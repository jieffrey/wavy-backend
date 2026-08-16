import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

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

  async stats() {
    const [counts] = await sql`
      SELECT
        (SELECT COUNT(*) FROM organizers)::int AS organizer_count,
        (SELECT COUNT(*) FROM customers)::int AS customer_count,
        (SELECT COUNT(*) FROM events)::int AS event_count,
        (SELECT COUNT(*) FROM orders)::int AS order_count,
        (SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE status = 'paid')::float8 AS revenue,
        (SELECT COALESCE(SUM(sold), 0) FROM ticket_categories)::int AS ticket_sold
    `;
    return ok(counts);
  },

  async listOrganizers() {
    return ok(
      await sql`
        SELECT o.id, o.name, o.email, o.status, o.created_at,
          (SELECT COUNT(*) FROM events e WHERE e.organizer_id = o.id)::int AS event_count,
          (SELECT COALESCE(SUM(o2.total_price), 0) FROM orders o2 JOIN events e2 ON e2.id = o2.event_id
            WHERE e2.organizer_id = o.id AND o2.status = 'paid')::float8 AS revenue
        FROM organizers o
        ORDER BY o.id DESC
      `
    );
  },

  async setOrganizerStatus(id: number, status: string): Promise<Result<{ message: string }>> {
    if (!["active", "suspended"].includes(status)) return fail(400, "invalid status");
    const [org] = await sql<{ id: number }[]>`UPDATE organizers SET status = ${status} WHERE id = ${id} RETURNING id`;
    if (!org) return fail(404, "organizer not found");
    return ok({ message: `organizer ${status}` });
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