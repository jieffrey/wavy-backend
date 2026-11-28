import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import { expireAll } from "../../utils/order-expiry";

export type OrderStatus = "pending_payment" | "paid" | "expired" | "rejected" | "refunded" | "cancelled";

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

  // KPI platform (dashboard admin). Order kedaluwarsa di-expire dulu (lazy expiry, PRD §4.4)
  // supaya hitungan per status tidak memasukkan pending yang sudah lewat batas bayar.
  async stats() {
    await expireAll(sql);
    const [counts] = await sql`
      SELECT
        (SELECT COUNT(*) FROM customers)::int AS customer_count,
        (SELECT COUNT(*) FROM events)::int AS event_count,
        (SELECT COUNT(*) FROM events WHERE status = 'published')::int AS published_event_count,
        (SELECT COUNT(*) FROM orders)::int AS order_count,
        (SELECT COUNT(*) FROM orders WHERE status = 'paid')::int AS paid_order_count,
        (SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE status = 'paid')::float8 AS revenue,
        -- tiket terjual = jumlah tiket di order paid (sumber sama dengan grafik harian & event terlaris)
        (SELECT COALESCE(SUM(quantity), 0) FROM orders WHERE status = 'paid')::int AS ticket_sold
    `;
    const byStatus = await sql<{ status: string; count: number }[]>`
      SELECT status, COUNT(*)::int AS count FROM orders GROUP BY status
    `;
    const orders_by_status: Record<OrderStatus, number> = {
      pending_payment: 0,
      paid: 0,
      expired: 0,
      rejected: 0,
      refunded: 0,
      cancelled: 0,
    };
    for (const r of byStatus) if (r.status in orders_by_status) orders_by_status[r.status as OrderStatus] = r.count;
    return ok({ ...counts, orders_by_status });
  },

  // pendapatan & tiket per hari (WIB) dari order paid, berdasarkan paid_at; hari tanpa penjualan = 0
  async dailyStats(days: number) {
    const rows = await sql<{ date: string; orders: number; tickets: number; revenue: number }[]>`
      WITH days AS (
        SELECT generate_series(
          (now() AT TIME ZONE 'Asia/Jakarta')::date - ${days - 1}::int,
          (now() AT TIME ZONE 'Asia/Jakarta')::date,
          interval '1 day'
        )::date AS d
      ),
      paid AS (
        SELECT (paid_at AT TIME ZONE 'Asia/Jakarta')::date AS d, quantity, total_price
        FROM orders
        WHERE status = 'paid'
          AND paid_at >= ((now() AT TIME ZONE 'Asia/Jakarta')::date - ${days - 1}::int) AT TIME ZONE 'Asia/Jakarta'
      )
      SELECT to_char(days.d, 'YYYY-MM-DD') AS date,
        COUNT(paid.d)::int AS orders,
        COALESCE(SUM(paid.quantity), 0)::int AS tickets,
        COALESCE(SUM(paid.total_price), 0)::float8 AS revenue
      FROM days LEFT JOIN paid ON paid.d = days.d
      GROUP BY days.d
      ORDER BY days.d
    `;
    return ok(rows);
  },

  // event terlaris: tiket terjual (order paid) terbanyak, seri = pendapatan lalu id
  async topEvents(limit: number) {
    return ok(
      await sql`
        SELECT e.id, e.title, e.status, a.name AS artist_name,
          COALESCE(SUM(ord.quantity), 0)::int AS tickets_sold,
          COALESCE(SUM(ord.total_price), 0)::float8 AS revenue
        FROM events e
        LEFT JOIN artists a ON a.id = e.artist_id
        JOIN orders ord ON ord.event_id = e.id AND ord.status = 'paid'
        GROUP BY e.id, a.name
        ORDER BY tickets_sold DESC, revenue DESC, e.id DESC
        LIMIT ${limit}
      `
    );
  },

  // order terbaru di seluruh platform
  async recentOrders(limit: number) {
    await expireAll(sql);
    return ok(
      await sql`
        SELECT ord.id, ord.status, ord.quantity, ord.total_price::float8 AS total_price, ord.created_at, ord.paid_at,
          e.id AS event_id, e.title AS event_title,
          COALESCE(NULLIF(c.name, ''), c.email) AS customer_name
        FROM orders ord
        JOIN events e ON e.id = ord.event_id
        JOIN customers c ON c.id = ord.customer_id
        ORDER BY ord.created_at DESC NULLS LAST, ord.id DESC
        LIMIT ${limit}
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