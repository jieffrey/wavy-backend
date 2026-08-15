import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { sql } from "../../db/client";
import { organizerAuth, type AppEnv } from "../../middleware/auth.middleware";
import { eventSchema, ticketCategorySchema, artistSchema, verifySchema } from "./organizer.schema";

const organizerRoutes = new Hono<AppEnv>();
organizerRoutes.use("*", organizerAuth);

const zv = <T extends z.ZodTypeAny>(schema: T) => zValidator<T, "json", AppEnv, string>("json", schema);

const notFound = (msg: string) => ({ error: msg });

// ---------- Events ----------

organizerRoutes.get("/events", async (c) => {
  const organizerId = c.get("organizerId");
  const events = await sql`SELECT * FROM events WHERE organizer_id = ${organizerId} ORDER BY id DESC`;
  return c.json(events);
});

organizerRoutes.post("/events", zv(eventSchema), async (c) => {
  const organizerId = c.get("organizerId");
  const b = c.req.valid("json");
  const [event] = await sql`
    INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description)
    VALUES (${organizerId}, ${b.artist_id}, ${b.title}, ${b.category}, ${b.venue}, to_timestamp(${b.date}), ${b.poster_url}, ${b.description})
    RETURNING *
  `;
  return c.json(event, 201);
});

organizerRoutes.get("/events/:id", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const [event] = await sql`SELECT * FROM events WHERE id = ${id} AND organizer_id = ${organizerId}`;
  if (!event) return c.json(notFound("event not found"), 404);
  const ticket_categories = await sql`SELECT * FROM ticket_categories WHERE event_id = ${id}`;
  return c.json({ ...event, ticket_categories });
});

organizerRoutes.put("/events/:id", zv(eventSchema), async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const b = c.req.valid("json");
  const [event] = await sql`
    UPDATE events SET artist_id = ${b.artist_id}, title = ${b.title}, category = ${b.category},
      venue = ${b.venue}, date = to_timestamp(${b.date}), poster_url = ${b.poster_url}, description = ${b.description}
    WHERE id = ${id} AND organizer_id = ${organizerId}
    RETURNING *
  `;
  if (!event) return c.json(notFound("event not found"), 404);
  return c.json(event);
});

organizerRoutes.delete("/events/:id", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const [event] = await sql`DELETE FROM events WHERE id = ${id} AND organizer_id = ${organizerId} RETURNING id`;
  if (!event) return c.json(notFound("event not found"), 404);
  return c.json({ message: "event deleted" });
});

organizerRoutes.post("/events/:id/close-sales", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const [event] = await sql`
    UPDATE events SET status = 'closed'
    WHERE id = ${id} AND organizer_id = ${organizerId}
    RETURNING *
  `;
  if (!event) return c.json(notFound("event not found"), 404);
  return c.json(event);
});

// ---------- Ticket Categories ----------

const ownedEvent = async (organizerId: number, eventId: number) => {
  const [event] = await sql`SELECT id FROM events WHERE id = ${eventId} AND organizer_id = ${organizerId}`;
  return event;
};

const ownedCategory = async (organizerId: number, id: number) => {
  const [cat] = await sql`
    SELECT tc.* FROM ticket_categories tc
    JOIN events e ON e.id = tc.event_id
    WHERE tc.id = ${id} AND e.organizer_id = ${organizerId}
  `;
  return cat;
};

organizerRoutes.get("/events/:id/ticket-categories", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  if (!(await ownedEvent(organizerId, id))) return c.json(notFound("event not found"), 404);
  const categories = await sql`SELECT * FROM ticket_categories WHERE event_id = ${id}`;
  return c.json(categories);
});

organizerRoutes.post("/events/:id/ticket-categories", zv(ticketCategorySchema), async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  if (!(await ownedEvent(organizerId, id))) return c.json(notFound("event not found"), 404);
  const b = c.req.valid("json");
  const [cat] = await sql`
    INSERT INTO ticket_categories (event_id, name, price, quota)
    VALUES (${id}, ${b.name}, ${b.price}, ${b.quota})
    RETURNING *
  `;
  return c.json(cat, 201);
});

organizerRoutes.put("/ticket-categories/:id", zv(ticketCategorySchema), async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const b = c.req.valid("json");
  const cat = await ownedCategory(organizerId, id);
  if (!cat) return c.json(notFound("ticket category not found"), 404);
  if (b.quota < cat.sold) return c.json({ error: "quota cannot be lower than sold tickets" }, 400);
  const [updated] = await sql`
    UPDATE ticket_categories SET name = ${b.name}, price = ${b.price}, quota = ${b.quota}
    WHERE id = ${id}
    RETURNING *
  `;
  return c.json(updated);
});

organizerRoutes.delete("/ticket-categories/:id", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const cat = await ownedCategory(organizerId, id);
  if (!cat) return c.json(notFound("ticket category not found"), 404);
  await sql`DELETE FROM ticket_categories WHERE id = ${id}`;
  return c.json({ message: "ticket category deleted" });
});

// ---------- Artists ----------

organizerRoutes.get("/artists", async (c) => {
  const organizerId = c.get("organizerId");
  const artists = await sql`SELECT * FROM artists WHERE organizer_id = ${organizerId} ORDER BY id DESC`;
  return c.json(artists);
});

organizerRoutes.post("/artists", zv(artistSchema), async (c) => {
  const organizerId = c.get("organizerId");
  const b = c.req.valid("json");
  const [artist] = await sql`
    INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
    VALUES (${organizerId}, ${b.name}, ${b.genre}, ${b.photo_url}, ${b.bio})
    RETURNING *
  `;
  return c.json(artist, 201);
});

organizerRoutes.put("/artists/:id", zv(artistSchema), async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const b = c.req.valid("json");
  const [artist] = await sql`
    UPDATE artists SET name = ${b.name}, genre = ${b.genre}, photo_url = ${b.photo_url}, bio = ${b.bio}
    WHERE id = ${id} AND organizer_id = ${organizerId}
    RETURNING *
  `;
  if (!artist) return c.json(notFound("artist not found"), 404);
  return c.json(artist);
});

organizerRoutes.delete("/artists/:id", async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const [artist] = await sql`DELETE FROM artists WHERE id = ${id} AND organizer_id = ${organizerId} RETURNING id`;
  if (!artist) return c.json(notFound("artist not found"), 404);
  return c.json({ message: "artist deleted" });
});

// ---------- Dashboard ----------

organizerRoutes.get("/dashboard", async (c) => {
  const organizerId = c.get("organizerId");

  const [revenue] = await sql`
    SELECT COALESCE(SUM(o.total_price), 0)::float8 AS revenue
    FROM orders o JOIN events e ON e.id = o.event_id
    WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
  `;
  const [sold] = await sql`
    SELECT COALESCE(SUM(tc.sold), 0)::int AS ticket_sold
    FROM ticket_categories tc JOIN events e ON e.id = tc.event_id
    WHERE e.organizer_id = ${organizerId}
  `;
  const [remaining] = await sql`
    SELECT COALESCE(SUM(tc.quota - tc.sold), 0)::int AS remaining_ticket
    FROM ticket_categories tc JOIN events e ON e.id = tc.event_id
    WHERE e.organizer_id = ${organizerId}
  `;
  const [popular] = await sql`
    SELECT e.category AS popular_category
    FROM orders o JOIN events e ON e.id = o.event_id
    WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
    GROUP BY e.category
    ORDER BY SUM(o.quantity) DESC
    LIMIT 1
  `;
  const [peak] = await sql`
    SELECT EXTRACT(HOUR FROM o.created_at)::int AS peak_purchase_hour
    FROM orders o JOIN events e ON e.id = o.event_id
    WHERE e.organizer_id = ${organizerId}
    GROUP BY 1
    ORDER BY COUNT(*) DESC
    LIMIT 1
  `;

  return c.json({
    revenue: revenue.revenue,
    ticket_sold: sold.ticket_sold,
    remaining_ticket: remaining.remaining_ticket,
    popular_category: popular?.popular_category ?? "",
    peak_purchase_hour: peak?.peak_purchase_hour ?? 0,
  });
});

// ---------- Orders (organizer) ----------

organizerRoutes.get("/orders", async (c) => {
  const organizerId = c.get("organizerId");
  const status = c.req.query("status");
  const rows = status
    ? await sql`
        SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
        WHERE e.organizer_id = ${organizerId} AND o.status = ${status}
        ORDER BY o.created_at DESC
      `
    : await sql`
        SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
        WHERE e.organizer_id = ${organizerId}
        ORDER BY o.created_at DESC
      `;
  return c.json(rows);
});

organizerRoutes.post("/orders/:id/verify", zv(verifySchema), async (c) => {
  const organizerId = c.get("organizerId");
  const id = Number(c.req.param("id"));
  const { approve } = c.req.valid("json");

  const [order] = await sql`
    SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
    WHERE o.id = ${id} AND e.organizer_id = ${organizerId}
  `;
  if (!order) return c.json(notFound("order not found"), 404);
  if (order.status !== "pending_payment") {
    return c.json({ error: "order is not pending payment" }, 400);
  }

  if (approve) {
    await sql.begin(async (tx) => {
      await tx`UPDATE orders SET status = 'paid' WHERE id = ${id}`;
      await tx`UPDATE ticket_categories SET sold = sold + ${order.quantity} WHERE id = ${order.ticket_category_id}`;
    });
    return c.json({ message: "order approved" });
  }

  await sql`UPDATE orders SET status = 'rejected' WHERE id = ${id}`;
  return c.json({ message: "order rejected" });
});

export default organizerRoutes;