import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { createOrderSchema } from "./customer.schema";
import { expireByCategory, expireByCustomer, expireOrder } from "../../utils/order-expiry";
import { remainingQuotaSql } from "../../utils/quota";

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
type OrderInput = z.output<typeof createOrderSchema>;
type EventSalesRow = { status: string; sales_start_at: Date | null; sales_end_at: Date | null; now: Date };

export const customerService = {
  // PRD §4.1–4.4: cek status penjualan + reservasi kuota dalam satu transaksi.
  // Baris kategori di-lock (FOR UPDATE) sehingga order bersamaan untuk kategori yang
  // sama antre; order berikutnya baru menghitung kuota setelah order sebelumnya commit.
  async createOrder(customerId: number, input: OrderInput): Promise<Result<OrderRow>> {
    return sql.begin(async (tx): Promise<Result<OrderRow>> => {
      const [event] = await tx<EventSalesRow[]>`
        SELECT status, sales_start_at, sales_end_at, now() AS now FROM events WHERE id = ${input.event_id}
      `;
      if (!event) return fail(404, "event not found");
      if (event.status !== "published") return fail(409, "ticket sales are closed for this event", "SALES_CLOSED");
      if (event.sales_start_at && event.now < event.sales_start_at)
        return fail(409, "ticket sales have not started yet", "SALES_NOT_STARTED");
      if (event.sales_end_at && event.now >= event.sales_end_at)
        return fail(409, "ticket sales have ended", "SALES_ENDED");

      const [cat] = await tx<CategoryRow[]>`
        SELECT * FROM ticket_categories WHERE id = ${input.ticket_category_id} FOR UPDATE
      `;
      if (!cat) return fail(404, "ticket category not found");
      if (cat.event_id !== input.event_id) return fail(400, "ticket category does not belong to event");

      await expireByCategory(tx, cat.id);
      const [{ remaining }] = await tx<{ remaining: number }[]>`
        SELECT ${remainingQuotaSql(tx)} AS remaining FROM ticket_categories tc WHERE tc.id = ${cat.id}
      `;
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

  async getOrder(customerId: number, id: number): Promise<Result<OrderRow>> {
    await expireOrder(sql, id);
    const [order] = await sql<OrderRow[]>`SELECT * FROM orders WHERE id = ${id} AND customer_id = ${customerId}`;
    if (!order) return fail(404, "order not found");
    return ok(order);
  },

  async history(customerId: number) {
    await expireByCustomer(sql, customerId);
    return ok(await sql<OrderRow[]>`SELECT * FROM orders WHERE customer_id = ${customerId} ORDER BY created_at DESC`);
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