import { afterEach, beforeEach, describe, expect, test } from "bun:test";
import bcrypt from "bcryptjs";
import type { SendMailOptions } from "nodemailer";
import { mailer } from "../src/utils/email";
import { call, createOrganizer, sql, tokenFor } from "./helpers";

// email ditangkap, tidak pernah ke SMTP
const sent: SendMailOptions[] = [];
const realSend = mailer.send;
let failMail = false;
beforeEach(() => {
  sent.length = 0;
  failMail = false;
  mailer.send = (async (o: SendMailOptions) => {
    if (failMail) throw new Error("smtp down");
    sent.push(o);
    return {} as never;
  }) as typeof mailer.send;
});
afterEach(() => {
  mailer.send = realSend;
});

const uniq = () => `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;

async function createAdmin() {
  const [a] = await sql<{ id: number }[]>`
    INSERT INTO admins (name, email, password) VALUES ('Admin', ${`admin-${uniq()}@test.local`}, 'x') RETURNING id
  `;
  return tokenFor("admin_id", a.id);
}

async function pendingOrganizer(password = "rahasia-123") {
  const email = `eo-${uniq()}@test.local`;
  const [o] = await sql<{ id: number }[]>`
    INSERT INTO organizers (name, email, password, status, whatsapp, event_types, created_at)
    VALUES ('EO Baru', ${email}, ${bcrypt.hashSync(password, 4)}, 'pending_verification', '0812', 'Konser', now())
    RETURNING id
  `;
  return { id: o.id, email, password };
}

const REASON = "Data legalitas perusahaan belum lengkap.";

describe("antrean verifikasi organizer (admin)", () => {
  test("GET /admin/organizers?status=pending_verification hanya berisi yang menunggu, terlama di atas", async () => {
    const admin = await createAdmin();
    const a = await pendingOrganizer();
    const b = await pendingOrganizer();
    await createOrganizer("active");
    const res = await call("GET", "/admin/organizers?status=pending_verification", admin);
    expect(res.status).toBe(200);
    expect(res.body.every((o: { status: string }) => o.status === "pending_verification")).toBe(true);
    const ids = res.body.map((o: { id: number }) => o.id);
    expect(ids.indexOf(a.id)).toBeLessThan(ids.indexOf(b.id));
    expect(res.body[0]).toHaveProperty("email_verified_at");
    expect(res.body[0]).toHaveProperty("rejection_reason");
  });

  test("filter status tidak dikenal -> 400", async () => {
    const res = await call("GET", "/admin/organizers?status=aneh", await createAdmin());
    expect(res.status).toBe(400);
    expect(res.body.error.code).toBe("VALIDATION_ERROR");
  });

  test("/admin/stats memuat jumlah pending untuk badge sidebar", async () => {
    const admin = await createAdmin();
    await pendingOrganizer();
    const res = await call("GET", "/admin/stats", admin);
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM organizers WHERE status = 'pending_verification'`;
    expect(res.body.pending_organizer_count).toBe(n);
  });

  test("setujui -> active, reviewed_at terisi, email persetujuan terkirim, EO bisa login", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const res = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "active" });
    expect(res.status).toBe(200);
    expect(res.body).toMatchObject({ status: "active", previous_status: "pending_verification", email_sent: true });
    const [row] = await sql`SELECT status, reviewed_at, rejection_reason FROM organizers WHERE id = ${eo.id}`;
    expect(row.status).toBe("active");
    expect(row.reviewed_at).not.toBeNull();
    expect(sent).toHaveLength(1);
    expect(sent[0].to).toBe(eo.email);
    expect(String(sent[0].subject)).toContain("disetujui");
    const login = await call("POST", "/auth/organizer/login", undefined, { email: eo.email, password: eo.password });
    expect(login.status).toBe(200);
  });

  test("tolak tanpa alasan -> 400 per field, status tidak berubah", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const res = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "rejected", reason: "  " });
    expect(res.status).toBe(400);
    expect(res.body.error).toMatchObject({ code: "VALIDATION_ERROR", field: "reason" });
    const [row] = await sql`SELECT status FROM organizers WHERE id = ${eo.id}`;
    expect(row.status).toBe("pending_verification");
    expect(sent).toHaveLength(0);
  });

  test("tolak dengan alasan -> rejected, email berisi alasan (di-escape), login menjelaskan alasan", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const reason = `${REASON} <script>x</script>`;
    const res = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "rejected", reason });
    expect(res.status).toBe(200);
    expect(res.body).toMatchObject({ status: "rejected", email_sent: true });
    expect(String(sent[0].html)).toContain("&lt;script&gt;");
    expect(String(sent[0].html)).not.toContain("<script>");
    const login = await call("POST", "/auth/organizer/login", undefined, { email: eo.email, password: eo.password });
    expect(login.status).toBe(403);
    expect(login.body.error).toMatchObject({ code: "ORGANIZER_REJECTED", reason });
  });

  test("SMTP gagal -> keputusan tetap tersimpan, email_sent false", async () => {
    failMail = true;
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const res = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "active" });
    expect(res.status).toBe(200);
    expect(res.body.email_sent).toBe(false);
    const [row] = await sql`SELECT status FROM organizers WHERE id = ${eo.id}`;
    expect(row.status).toBe("active");
  });

  test("transisi tidak sah ditolak 409 (pending -> suspended, rejected -> active)", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const bad = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "suspended" });
    expect(bad.status).toBe(409);
    expect(bad.body.error.code).toBe("INVALID_STATUS_TRANSITION");
    await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "rejected", reason: REASON });
    const again = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "active" });
    expect(again.status).toBe(409);
  });

  test("suspend/aktifkan organizer aktif tidak mengirim email", async () => {
    const admin = await createAdmin();
    const eo = await createOrganizer("active");
    const res = await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "suspended" });
    expect(res.status).toBe(200);
    expect(res.body.email_sent).toBeNull();
    expect((await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "active" })).status).toBe(200);
    expect(sent).toHaveLength(0);
  });

  test("dua keputusan bersamaan: hanya satu yang lolos (row lock)", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    const [a, b] = await Promise.all([
      call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "active" }),
      call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "rejected", reason: REASON }),
    ]);
    expect([a.status, b.status].sort()).toEqual([200, 409]);
    expect(sent).toHaveLength(1);
  });
});

describe("organizer pending/ditolak di sisi EO", () => {
  test("login pending -> 403 ORGANIZER_PENDING", async () => {
    const eo = await pendingOrganizer();
    const res = await call("POST", "/auth/organizer/login", undefined, { email: eo.email, password: eo.password });
    expect(res.status).toBe(403);
    expect(res.body.error.code).toBe("ORGANIZER_PENDING");
  });

  test("token organizer yang belum disetujui tidak bisa membuka Creator Studio", async () => {
    const eo = await pendingOrganizer();
    const res = await call("GET", "/organizer/me", tokenFor("organizer_id", eo.id));
    expect(res.status).toBe(403);
    expect(res.body.error.code).toBe("ORGANIZER_PENDING");
  });

  test("verify-email hanya menandai email, tidak mengaktifkan akun", async () => {
    const eo = await pendingOrganizer();
    await sql`INSERT INTO otp_codes (email, code, expires_at) VALUES (${eo.email}, '123456', LOCALTIMESTAMP + interval '5 minutes')`;
    const res = await call("POST", "/auth/organizer/verify-email", undefined, { email: eo.email, code: "123456" });
    expect(res.status).toBe(200);
    const [row] = await sql`SELECT status, email_verified_at FROM organizers WHERE id = ${eo.id}`;
    expect(row.status).toBe("pending_verification");
    expect(row.email_verified_at).not.toBeNull();
  });

  test("pengajuan ditolak boleh diajukan ulang dengan email yang sama -> kembali pending", async () => {
    const admin = await createAdmin();
    const eo = await pendingOrganizer();
    await call("PATCH", `/admin/organizers/${eo.id}`, admin, { status: "rejected", reason: REASON });
    const res = await call("POST", "/auth/organizer/register", undefined, {
      organizer_name: "EO Revisi",
      email: eo.email,
      password: "password-baru-1",
      whatsapp: "081234567890",
      event_types: "Konser musik",
    });
    expect(res.status).toBe(200);
    const [row] = await sql`SELECT id, name, status, rejection_reason FROM organizers WHERE email = ${eo.email}`;
    expect(row).toMatchObject({ id: eo.id, name: "EO Revisi", status: "pending_verification", rejection_reason: null });
  });

  test("email organizer aktif tetap tidak bisa didaftarkan ulang", async () => {
    const eo = await pendingOrganizer();
    await sql`UPDATE organizers SET status = 'active' WHERE id = ${eo.id}`;
    const res = await call("POST", "/auth/organizer/register", undefined, {
      organizer_name: "Lain",
      email: eo.email,
      password: "password-baru-1",
      whatsapp: "081234567890",
      event_types: "Konser musik",
    });
    expect(res.status).toBe(409);
  });
});
