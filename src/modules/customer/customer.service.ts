import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { createOrderSchema, profileSchema } from "./customer.schema";
import { expireByCategory, expireByCustomer, expireOrder } from "../../utils/order-expiry";
import { remainingQuotaSql } from "../../utils/quota";
import { categorySalesStatus, salesError, salesStatus, type SalesWindow } from "../../utils/sales-status";

type CategoryRow = { id: number; event_id: number; name: string; price: string; quota: number; sold: number };
type OrderRow = {
  id: number;
  customer_id: number;
  event_id: number;
  ticket_category_id: number;
  quantity: number;
  total_price: string;
  status: string;
  expires_at: Date;
  created_at: Date;
  full_name?: string;
  email?: string;
  phone?: string;
  id_number?: string;
  birth_date?: Date | string | null;
  gender?: string | null;
  wa_consent?: string | null;
};
// order + info tampilan (judul event, kategori, poster) untuk riwayat & detail customer
type OrderViewRow = OrderRow & {
  event_title: string | null;
  category_name: string | null;
  poster_url: string | null;
  event_date: Date | null;
  venue: string | null;
};
type OrderInput = z.output<typeof createOrderSchema>;
type ProfileInput = z.output<typeof profileSchema>;
type Profile = { id: number; email: string; name: string | null; phone: string; needs_name: boolean };

const profileOf = (c: { id: number; email: string; name: string | null; phone: string }): Profile => ({
  ...c,
  needs_name: !c.name?.trim(),
});
type EventSalesRow = SalesWindow & { now: Date; remaining: number };

// LEFT JOIN: order lama tetap tampil walau event/kategorinya sudah tidak ada
const orderViewColumns = () => sql`
  o.*, e.title AS event_title, tc.name AS category_name, e.poster_url, e.date AS event_date, e.venue
`;
const orderViewFrom = () => sql`
  FROM orders o
  LEFT JOIN events e ON e.id = o.event_id
  LEFT JOIN ticket_categories tc ON tc.id = o.ticket_category_id
`;

export const customerService = {
  // PRD §4.1–4.4: cek status penjualan (utils/sales-status.ts) + reservasi kuota dalam satu transaksi.
  // Baris kategori di-lock (FOR UPDATE) sehingga order bersamaan untuk kategori yang
  // sama antre; order berikutnya baru menghitung kuota setelah order sebelumnya commit.
  async createOrder(customerId: number, input: OrderInput): Promise<Result<OrderRow>> {
    return sql.begin(async (tx): Promise<Result<OrderRow>> => {
      const [event] = await tx<EventSalesRow[]>`
        SELECT e.status, e.sales_start_at, e.sales_end_at, now() AS now,
               (SELECT COALESCE(SUM(${remainingQuotaSql(tx)}), 0)::int
                FROM ticket_categories tc WHERE tc.event_id = e.id) AS remaining
        FROM events e WHERE e.id = ${input.event_id}
      `;
      if (!event) return fail(404, "event not found");
      const status = salesStatus(event, event.remaining, event.now);
      if (status !== "open") {
        const { message, code } = salesError(event, status);
        return fail(409, message, code);
      }

      const [cat] = await tx<CategoryRow[]>`
        SELECT * FROM ticket_categories WHERE id = ${input.ticket_category_id} FOR UPDATE
      `;
      if (!cat) return fail(404, "ticket category not found");
      if (cat.event_id !== input.event_id) return fail(400, "ticket category does not belong to event");

      await expireByCategory(tx, cat.id);
      const [{ remaining }] = await tx<{ remaining: number }[]>`
        SELECT ${remainingQuotaSql(tx)} AS remaining FROM ticket_categories tc WHERE tc.id = ${cat.id}
      `;
      if (categorySalesStatus(status, remaining) === "sold_out")
        return fail(409, "tickets in this category are sold out", "QUOTA_EXCEEDED");
      if (input.quantity > remaining)
        return fail(409, `not enough tickets available (remaining ${remaining})`, "QUOTA_EXCEEDED");

      const total_price = Number(cat.price) * input.quantity;
      // gender & wa_consent: kolom NOT NULL DEFAULT '' di DB, jadi kosong = "" (bukan null)
      const [order] = await tx<OrderRow[]>`
        INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at,
                            full_name, email, phone, id_number, birth_date, gender, wa_consent)
        VALUES (${customerId}, ${input.event_id}, ${cat.id}, ${input.quantity}, ${total_price}, 'pending_payment',
                now() + interval '15 minutes', now(),
                ${input.full_name ?? ""}, ${input.email ?? ""}, ${input.phone ?? ""}, ${input.id_number ?? ""},
                ${input.birth_date || null}, ${input.gender ?? ""}, ${input.wa_consent ?? ""})
        RETURNING *
      `;
      return ok(order);
    });
  },

  async getOrder(customerId: number, id: number): Promise<Result<OrderViewRow>> {
    await expireOrder(sql, id);
    const [order] = await sql<OrderViewRow[]>`
      SELECT ${orderViewColumns()} ${orderViewFrom()}
      WHERE o.id = ${id} AND o.customer_id = ${customerId}
    `;
    if (!order) return fail(404, "order not found");
    return ok(order);
  },

  async history(customerId: number) {
    await expireByCustomer(sql, customerId);
    return ok(
      await sql<OrderViewRow[]>`
        SELECT ${orderViewColumns()} ${orderViewFrom()}
        WHERE o.customer_id = ${customerId}
        ORDER BY o.created_at DESC
      `
    );
  },

  async profile(customerId: number): Promise<Result<Profile>> {
    const [c] = await sql<{ id: number; email: string; name: string | null; phone: string }[]>`
      SELECT id, email, name, phone FROM customers WHERE id = ${customerId}
    `;
    if (!c) return fail(404, "customer not found");
    return ok(profileOf(c));
  },

  async updateProfile(customerId: number, input: ProfileInput): Promise<Result<Profile>> {
    const [c] = await sql<{ id: number; email: string; name: string | null; phone: string }[]>`
      UPDATE customers SET name = ${input.name}, phone = ${input.phone ?? sql`phone`}
      WHERE id = ${customerId}
      RETURNING id, email, name, phone
    `;
    if (!c) return fail(404, "customer not found");
    return ok(profileOf(c));
  },

  async level(customerId: number) {
    const [r] = await sql<{ attended: number }[]>`
      SELECT COUNT(DISTINCT event_id)::int AS attended FROM orders
      WHERE customer_id = ${customerId} AND status = 'paid'
    `;
    const attended = r.attended;
    const level = attended >= 10 ? 5 : attended >= 5 ? 4 : attended >= 3 ? 3 : attended >= 1 ? 2 : 1;
    const level_label = ["", "Pengunjung", "Newbie", "Fan", "Super Fan", "Legend"][level];
    return ok({ attended_concerts: attended, level, level_label });
  },
};