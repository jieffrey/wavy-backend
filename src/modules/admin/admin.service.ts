import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import { expireByOrganizer } from "../../utils/order-expiry";
import { sendOrganizerApprovedEmail, sendOrganizerRejectedEmail } from "../../utils/email";

export type OrganizerStatus = "active" | "suspended" | "pending_verification" | "rejected";

// Transisi status organizer yang boleh dilakukan admin.
//   pending_verification -> active (setujui) | rejected (tolak + alasan)
//   active <-> suspended
// rejected tidak bisa diaktifkan langsung: organizer mengajukan ulang lewat /auth/organizer/register.
const TRANSITIONS: Record<OrganizerStatus, readonly OrganizerStatus[]> = {
  pending_verification: ["active", "rejected"],
  active: ["suspended"],
  suspended: ["active"],
  rejected: [],
};

export type SetOrganizerStatusData = {
  message: string;
  status: OrganizerStatus;
  previous_status: OrganizerStatus;
  // email persetujuan/penolakan; false = gagal kirim (status tetap tersimpan), null = tidak ada email
  email_sent: boolean | null;
};

type AdminRow = { id: number; name: string; email: string; password: string };

const sign = (payload: object) => jwt.sign(payload, process.env.JWT_SECRET!, { expiresIn: "24h" });

export const adminService = {
  async login(
    email: string,
    password: string
  ): Promise<Result<{ access_token: string; admin: { id: number; name: string; email: string } }>> {
    const [admin] = await sql<AdminRow[]>`SELECT * FROM admins WHERE email = ${email}`;
    if (!admin || !(await bcrypt.compare(password, admin.password))) return fail(401, "invalid email or password");
    return ok({
      access_token: sign({ admin_id: admin.id }),
      admin: { id: admin.id, name: admin.name, email: admin.email },
    });
  },

  async me(adminId: number): Promise<Result<{ id: number; name: string; email: string }>> {
    const [admin] = await sql<{ id: number; name: string; email: string }[]>`
      SELECT id, name, email FROM admins WHERE id = ${adminId}
    `;
    if (!admin) return fail(404, "admin not found");
    return ok(admin);
  },

  async stats() {
    const [counts] = await sql`
      SELECT
        (SELECT COUNT(*) FROM organizers)::int AS organizer_count,
        (SELECT COUNT(*) FROM organizers WHERE status = 'pending_verification')::int AS pending_organizer_count,
        (SELECT COUNT(*) FROM customers)::int AS customer_count,
        (SELECT COUNT(*) FROM events)::int AS event_count,
        (SELECT COUNT(*) FROM orders)::int AS order_count,
        (SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE status = 'paid')::float8 AS revenue,
        (SELECT COALESCE(SUM(sold), 0) FROM ticket_categories)::int AS ticket_sold
    `;
    return ok(counts);
  },

  async listOrganizers(status?: OrganizerStatus) {
    return ok(
      await sql`
        SELECT o.id, o.name, o.email, o.status, o.created_at, o.whatsapp, o.event_types, o.social_link,
          o.email_verified_at, o.reviewed_at, o.rejection_reason,
          (SELECT COUNT(*) FROM events e WHERE e.organizer_id = o.id)::int AS event_count,
          (SELECT COALESCE(SUM(o2.total_price), 0) FROM orders o2 JOIN events e2 ON e2.id = o2.event_id
            WHERE e2.organizer_id = o.id AND o2.status = 'paid')::float8 AS revenue
        FROM organizers o
        ${status ? sql`WHERE o.status = ${status}` : sql``}
        -- antrean verifikasi: yang paling lama menunggu di atas
        ORDER BY ${status === "pending_verification" ? sql`o.created_at ASC NULLS FIRST, o.id ASC` : sql`o.id DESC`}
      `
    );
  },

  // profil organizer + daftar event (tiket terjual, kuota, pendapatan) + ringkasan penjualan
  async getOrganizer(id: number) {
    const [organizer] = await sql`
      SELECT id, name, email, status, created_at, whatsapp, event_types, social_link,
        email_verified_at, reviewed_at, rejection_reason
      FROM organizers WHERE id = ${id}
    `;
    if (!organizer) return fail(404, "organizer not found");
    await expireByOrganizer(sql, id);
    const events = await sql`
      SELECT e.id, e.title, e.category, e.venue, e.date, e.status, e.poster_url,
        COALESCE((SELECT SUM(tc.quota) FROM ticket_categories tc WHERE tc.event_id = e.id), 0)::int AS quota,
        COALESCE((SELECT SUM(tc.sold) FROM ticket_categories tc WHERE tc.event_id = e.id), 0)::int AS sold,
        COALESCE((SELECT SUM(o.total_price) FROM orders o WHERE o.event_id = e.id AND o.status = 'paid'), 0)::float8 AS revenue
      FROM events e
      WHERE e.organizer_id = ${id}
      ORDER BY e.date DESC NULLS LAST, e.id DESC
    `;
    const [summary] = await sql`
      SELECT
        (SELECT COUNT(*) FROM events WHERE organizer_id = ${id})::int AS event_count,
        (SELECT COUNT(*) FROM events WHERE organizer_id = ${id} AND status = 'published')::int AS published_count,
        COUNT(*) FILTER (WHERE o.status = 'paid')::int AS paid_order_count,
        COUNT(*) FILTER (WHERE o.status = 'pending_payment')::int AS pending_order_count,
        COALESCE(SUM(o.quantity) FILTER (WHERE o.status = 'paid'), 0)::int AS ticket_sold,
        COALESCE(SUM(o.total_price) FILTER (WHERE o.status = 'paid'), 0)::float8 AS revenue
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${id}
    `;
    return ok({ organizer, events, summary });
  },

  async setOrganizerStatus(
    id: number,
    next: Exclude<OrganizerStatus, "pending_verification">,
    reason?: string
  ): Promise<Result<SetOrganizerStatusData>> {
    if (!["active", "suspended", "rejected"].includes(next)) return fail(400, "invalid status");
    const trimmed = reason?.trim() ?? "";
    if (next === "rejected" && trimmed.length < 10)
      return fail(400, "reason wajib diisi minimal 10 karakter saat menolak organizer", "VALIDATION_ERROR");

    // row lock: dua admin yang menekan Setujui/Tolak bersamaan tidak boleh sama-sama lolos
    const res = await sql.begin(async (tx) => {
      const [org] = await tx<{ id: number; name: string; email: string; status: OrganizerStatus }[]>`
        SELECT id, name, email, status FROM organizers WHERE id = ${id} FOR UPDATE
      `;
      if (!org) return fail(404, "organizer not found");
      if (!(TRANSITIONS[org.status] ?? []).includes(next)) {
        return fail(409, `status organizer tidak bisa diubah dari ${org.status} ke ${next}`, "INVALID_STATUS_TRANSITION", {
          from: org.status,
          to: next,
        });
      }
      const review = org.status === "pending_verification";
      await tx`
        UPDATE organizers SET
          status = ${next},
          rejection_reason = ${next === "rejected" ? trimmed : null},
          reviewed_at = ${review ? tx`now()` : tx`reviewed_at`}
        WHERE id = ${id}
      `;
      return ok({ org, review });
    });
    if (!res.ok) return res;
    const { org, review } = res.data;

    // email dikirim setelah commit; kegagalan SMTP tidak membatalkan keputusan admin
    let email_sent: boolean | null = null;
    if (review) {
      try {
        if (next === "active") await sendOrganizerApprovedEmail(org.email, org.name);
        else await sendOrganizerRejectedEmail(org.email, org.name, trimmed);
        email_sent = true;
      } catch (e) {
        console.error(`gagal kirim email status organizer #${id}:`, e);
        email_sent = false;
      }
    }
    return ok({ message: `organizer ${next}`, status: next, previous_status: org.status, email_sent });
  },

  async listEvents() {
    return ok(
      await sql`
        SELECT e.id, e.title, e.category, e.venue, e.date, e.status,
          a.name AS artist_name, o.name AS organizer_name
        FROM events e
        JOIN artists a ON a.id = e.artist_id
        JOIN organizers o ON o.id = e.organizer_id
        ORDER BY e.id DESC
      `
    );
  },

  async listCustomers() {
    return ok(
      await sql`
        SELECT c.id, c.name, c.email, c.created_at,
          (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id)::int AS order_count,
          (SELECT COALESCE(SUM(o2.total_price), 0) FROM orders o2 WHERE o2.customer_id = c.id AND o2.status = 'paid')::float8 AS spend
        FROM customers c
        ORDER BY c.id DESC
      `
    );
  },
};