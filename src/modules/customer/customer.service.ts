import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { createOrderSchema } from "./customer.schema";

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
};
type OrderInput = z.output<typeof createOrderSchema>;

export const customerService = {
  async createOrder(customerId: number, input: OrderInput): Promise<Result<OrderRow>> {
    const [cat] = await sql<CategoryRow[]>`SELECT * FROM ticket_categories WHERE id = ${input.ticket_category_id}`;
    if (!cat) return fail(404, "ticket category not found");
    if (cat.event_id !== input.event_id) return fail(400, "ticket category does not belong to event");
    if (cat.quota - cat.sold < input.quantity) return fail(400, "not enough tickets available");

    const total_price = Number(cat.price) * input.quantity;
    const [order] = await sql<OrderRow[]>`
      INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, expires_at)
      VALUES (${customerId}, ${input.event_id}, ${input.ticket_category_id}, ${input.quantity}, ${total_price}, now() + interval '15 minutes')
      RETURNING *
    `;
    return ok(order);
  },

  async getOrder(customerId: number, id: number): Promise<Result<OrderRow>> {
    const [order] = await sql<OrderRow[]>`SELECT * FROM orders WHERE id = ${id} AND customer_id = ${customerId}`;
    if (!order) return fail(404, "order not found");
    return ok(order);
  },

  async history(customerId: number) {
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