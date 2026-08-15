import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { sql } from "../db/client";
import { customerAuth, type AppEnv } from "../middleware/auth.middleware";

const customerRoutes = new Hono<AppEnv>();
customerRoutes.use("*", customerAuth);

const createOrderSchema = z.object({
  event_id: z.number(),
  ticket_category_id: z.number(),
  quantity: z.number().int().min(1).max(4),
});

customerRoutes.post(
  "/orders",
  zValidator<typeof createOrderSchema, "json", AppEnv, string>("json", createOrderSchema),
  async (c) => {
    const customerId = c.get("customerId");
    const { event_id, ticket_category_id, quantity } = c.req.valid("json");

    const [cat] = await sql`SELECT * FROM ticket_categories WHERE id = ${ticket_category_id}`;
    if (!cat) return c.json({ error: "ticket category not found" }, 404);
    if (cat.event_id !== event_id) return c.json({ error: "ticket category does not belong to event" }, 400);
    if (cat.quota - cat.sold < quantity) return c.json({ error: "not enough tickets available" }, 400);

    const total_price = Number(cat.price) * quantity;
    const [order] = await sql`
      INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, expires_at)
      VALUES (${customerId}, ${event_id}, ${ticket_category_id}, ${quantity}, ${total_price}, now() + interval '15 minutes')
      RETURNING *
    `;
    return c.json(order, 201);
  }
);

// didaftarkan sebelum /orders/:id supaya "history" tidak tertelan route param
customerRoutes.get("/orders/history", async (c) => {
  const customerId = c.get("customerId");
  const orders = await sql`SELECT * FROM orders WHERE customer_id = ${customerId} ORDER BY created_at DESC`;
  return c.json(orders);
});

customerRoutes.get("/orders/:id", async (c) => {
  const customerId = c.get("customerId");
  const id = Number(c.req.param("id"));
  const [order] = await sql`SELECT * FROM orders WHERE id = ${id} AND customer_id = ${customerId}`;
  if (!order) return c.json({ error: "order not found" }, 404);
  return c.json(order);
});

export default customerRoutes;