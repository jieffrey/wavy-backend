import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { eventSchema, ticketCategorySchema, artistSchema } from "./organizer.schema";
import { signTicket, verifyTicket } from "../ticket/ticket.service";
import { notificationService } from "../notification/notification.service";

type EventRow = {
  id: number;
  organizer_id: number;
  artist_id: number;
  title: string;
  category: string;
  venue: string;
  date: Date;
  poster_url: string;
  description: string;
  status: string;
};
type CategoryRow = { id: number; event_id: number; name: string; price: string; quota: number; sold: number };
type ArtistRow = { id: number; organizer_id: number; name: string; genre: string; photo_url: string; bio: string };
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
type EventInput = z.output<typeof eventSchema>;
type CategoryInput = z.output<typeof ticketCategorySchema>;
type ArtistInput = z.output<typeof artistSchema>;

export const organizerService = {
  // ---------- Events ----------

  async listEvents(organizerId: number) {
    return ok(await sql<EventRow[]>`SELECT * FROM events WHERE organizer_id = ${organizerId} ORDER BY id DESC`);
  },

  async getEvent(organizerId: number, id: number): Promise<Result<EventRow & { ticket_categories: CategoryRow[] }>> {
    const [event] = await sql<EventRow[]>`SELECT * FROM events WHERE id = ${id} AND organizer_id = ${organizerId}`;
    if (!event) return fail(404, "event not found");
    const ticket_categories = await sql<CategoryRow[]>`SELECT * FROM ticket_categories WHERE event_id = ${id}`;
    return ok({ ...event, ticket_categories });
  },

  async createEvent(organizerId: number, input: EventInput) {
    const [event] = await sql<EventRow[]>`
      INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description)
      VALUES (${organizerId}, ${input.artist_id}, ${input.title}, ${input.category}, ${input.venue}, to_timestamp(${input.date}), ${input.poster_url}, ${input.description})
      RETURNING *
    `;
    return ok(event);
  },

  async updateEvent(organizerId: number, id: number, input: EventInput): Promise<Result<EventRow>> {
    const [event] = await sql<EventRow[]>`
      UPDATE events SET artist_id = ${input.artist_id}, title = ${input.title}, category = ${input.category},
        venue = ${input.venue}, date = to_timestamp(${input.date}), poster_url = ${input.poster_url}, description = ${input.description}
      WHERE id = ${id} AND organizer_id = ${organizerId}
      RETURNING *
    `;
    if (!event) return fail(404, "event not found");
    return ok(event);
  },

  async deleteEvent(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    const [event] = await sql<{ id: number }[]>`DELETE FROM events WHERE id = ${id} AND organizer_id = ${organizerId} RETURNING id`;
    if (!event) return fail(404, "event not found");
    return ok({ message: "event deleted" });
  },

  async closeSales(organizerId: number, id: number): Promise<Result<EventRow>> {
    const [event] = await sql<EventRow[]>`
      UPDATE events SET status = 'closed'
      WHERE id = ${id} AND organizer_id = ${organizerId}
      RETURNING *
    `;
    if (!event) return fail(404, "event not found");
    return ok(event);
  },

  async publishEvent(organizerId: number, id: number): Promise<Result<EventRow>> {
    const [event] = await sql<EventRow[]>`
      UPDATE events SET status = 'published'
      WHERE id = ${id} AND organizer_id = ${organizerId}
      RETURNING *
    `;
    if (!event) return fail(404, "event not found");
    const followers = await sql<{ customer_id: number }[]>`
      SELECT customer_id FROM favorite_organizers WHERE organizer_id = ${organizerId}
      UNION
      SELECT customer_id FROM favorite_artists WHERE artist_id = ${event.artist_id}
      UNION
      SELECT customer_id FROM notify_requests WHERE event_id = ${event.id}
    `;
    await notificationService.notifyMany(
      followers.map((f) => f.customer_id),
      `Event baru: ${event.title}`,
      `Tiket ${event.title} sudah dibuka di Wavy.`
    );
    return ok(event);
  },

  // ---------- Ticket Categories ----------

  async ownEvent(organizerId: number, eventId: number) {
    const [event] = await sql<{ id: number }[]>`SELECT id FROM events WHERE id = ${eventId} AND organizer_id = ${organizerId}`;
    return !!event;
  },

  async ownCategory(organizerId: number, id: number): Promise<CategoryRow | null> {
    const [cat] = await sql<CategoryRow[]>`
      SELECT tc.* FROM ticket_categories tc
      JOIN events e ON e.id = tc.event_id
      WHERE tc.id = ${id} AND e.organizer_id = ${organizerId}
    `;
    return cat ?? null;
  },

  async listCategories(organizerId: number, eventId: number): Promise<Result<CategoryRow[]>> {
    if (!(await this.ownEvent(organizerId, eventId))) return fail(404, "event not found");
    return ok(await sql<CategoryRow[]>`SELECT * FROM ticket_categories WHERE event_id = ${eventId}`);
  },

  async createCategory(organizerId: number, eventId: number, input: CategoryInput): Promise<Result<CategoryRow>> {
    if (!(await this.ownEvent(organizerId, eventId))) return fail(404, "event not found");
    const [cat] = await sql<CategoryRow[]>`
      INSERT INTO ticket_categories (event_id, name, price, quota)
      VALUES (${eventId}, ${input.name}, ${input.price}, ${input.quota})
      RETURNING *
    `;
    return ok(cat);
  },

  async updateCategory(organizerId: number, id: number, input: CategoryInput): Promise<Result<CategoryRow>> {
    const cat = await this.ownCategory(organizerId, id);
    if (!cat) return fail(404, "ticket category not found");
    if (input.quota < cat.sold) return fail(400, "quota cannot be lower than sold tickets");
    const [updated] = await sql<CategoryRow[]>`
      UPDATE ticket_categories SET name = ${input.name}, price = ${input.price}, quota = ${input.quota}
      WHERE id = ${id}
      RETURNING *
    `;
    return ok(updated);
  },

  async deleteCategory(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    const cat = await this.ownCategory(organizerId, id);
    if (!cat) return fail(404, "ticket category not found");
    await sql`DELETE FROM ticket_categories WHERE id = ${id}`;
    return ok({ message: "ticket category deleted" });
  },

  // ---------- Artists ----------

  async listArtists(organizerId: number) {
    return ok(await sql<ArtistRow[]>`SELECT * FROM artists WHERE organizer_id = ${organizerId} ORDER BY id DESC`);
  },

  async createArtist(organizerId: number, input: ArtistInput) {
    const [artist] = await sql<ArtistRow[]>`
      INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
      VALUES (${organizerId}, ${input.name}, ${input.genre}, ${input.photo_url}, ${input.bio})
      RETURNING *
    `;
    return ok(artist);
  },

  async updateArtist(organizerId: number, id: number, input: ArtistInput): Promise<Result<ArtistRow>> {
    const [artist] = await sql<ArtistRow[]>`
      UPDATE artists SET name = ${input.name}, genre = ${input.genre}, photo_url = ${input.photo_url}, bio = ${input.bio}
      WHERE id = ${id} AND organizer_id = ${organizerId}
      RETURNING *
    `;
    if (!artist) return fail(404, "artist not found");
    return ok(artist);
  },

  async deleteArtist(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    const [artist] = await sql<{ id: number }[]>`DELETE FROM artists WHERE id = ${id} AND organizer_id = ${organizerId} RETURNING id`;
    if (!artist) return fail(404, "artist not found");
    return ok({ message: "artist deleted" });
  },

  // ---------- Dashboard ----------

  async dashboard(organizerId: number) {
    const [revenue] = await sql<{ revenue: number }[]>`
      SELECT COALESCE(SUM(o.total_price), 0)::float8 AS revenue
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
    `;
    const [sold] = await sql<{ ticket_sold: number }[]>`
      SELECT COALESCE(SUM(tc.sold), 0)::int AS ticket_sold
      FROM ticket_categories tc JOIN events e ON e.id = tc.event_id
      WHERE e.organizer_id = ${organizerId}
    `;
    const [remaining] = await sql<{ remaining_ticket: number }[]>`
      SELECT COALESCE(SUM(tc.quota - tc.sold), 0)::int AS remaining_ticket
      FROM ticket_categories tc JOIN events e ON e.id = tc.event_id
      WHERE e.organizer_id = ${organizerId}
    `;
    const [popular] = await sql<{ popular_category: string }[]>`
      SELECT e.category AS popular_category
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
      GROUP BY e.category
      ORDER BY SUM(o.quantity) DESC
      LIMIT 1
    `;
    const [peak] = await sql<{ peak_purchase_hour: number }[]>`
      SELECT EXTRACT(HOUR FROM o.created_at)::int AS peak_purchase_hour
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId}
      GROUP BY 1
      ORDER BY COUNT(*) DESC
      LIMIT 1
    `;

    return ok({
      revenue: revenue.revenue,
      ticket_sold: sold.ticket_sold,
      remaining_ticket: remaining.remaining_ticket,
      popular_category: popular?.popular_category ?? "",
      peak_purchase_hour: peak?.peak_purchase_hour ?? 0,
    });
  },

  // ---------- Orders (organizer) ----------

  async listOrders(organizerId: number, status?: string) {
    const rows = status
      ? await sql<OrderRow[]>`
          SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
          WHERE e.organizer_id = ${organizerId} AND o.status = ${status}
          ORDER BY o.created_at DESC
        `
      : await sql<OrderRow[]>`
          SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
          WHERE e.organizer_id = ${organizerId}
          ORDER BY o.created_at DESC
        `;
    return ok(rows);
  },

  async verifyOrder(organizerId: number, id: number, approve: boolean): Promise<Result<{ message: string }>> {
    const [order] = await sql<OrderRow[]>`
      SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
      WHERE o.id = ${id} AND e.organizer_id = ${organizerId}
    `;
    if (!order) return fail(404, "order not found");
    if (order.status !== "pending_payment") return fail(400, "order is not pending payment");

    if (approve) {
      const [event] = await sql<{ date: Date }[]>`SELECT date FROM events WHERE id = ${order.event_id}`;
      const exp = Math.floor(new Date(event.date).getTime() / 1000);
      await sql.begin(async (tx) => {
        await tx`UPDATE orders SET status = 'paid' WHERE id = ${id}`;
        await tx`UPDATE ticket_categories SET sold = sold + ${order.quantity} WHERE id = ${order.ticket_category_id}`;
        for (let i = 0; i < order.quantity; i++) {
          await tx`INSERT INTO tickets (order_id, qr_code)
                   VALUES (${order.id}, ${signTicket({ uid: crypto.randomUUID(), event_id: order.event_id, exp })})`;
        }
      });
      return ok({ message: "order approved" });
    }

    await sql`UPDATE orders SET status = 'rejected' WHERE id = ${id}`;
    // auto-offer (phase 4 item 14): tiket dari order yang gagal ditawarkan ke waiting list teratas
    const [event] = await sql<{ title: string }[]>`SELECT title FROM events WHERE id = ${order.event_id}`;
    const offers = await sql<{ customer_id: number }[]>`
      SELECT customer_id FROM waiting_list
      WHERE event_id = ${order.event_id}
      ORDER BY created_at ASC
      LIMIT ${order.quantity}
    `;
    await notificationService.notifyMany(
      offers.map((o) => o.customer_id),
      `Slot tiket tersedia: ${event.title}`,
      `Order yang gagal membebaskan slot — tiket ${event.title} kembali tersedia di Wavy.`
    );
    return ok({ message: "order rejected" });
  },

  async scanValidate(
    organizerId: number,
    qrCode: string
  ): Promise<Result<{ message: string; ticket: { id: number; order_id: number; event_id: number; title: string; date: Date; venue: string } }>> {
    try {
      verifyTicket(qrCode);
    } catch (err) {
      return fail(400, err instanceof jwt.TokenExpiredError ? "QR code expired" : "invalid QR code");
    }

    const [ticket] = await sql<
      { id: number; order_id: number; organizer_id: number; event_id: number; title: string; date: Date; venue: string; is_scanned: boolean }[]
    >`
      SELECT t.id, t.order_id, t.is_scanned, e.id AS event_id, e.title, e.date, e.venue, e.organizer_id
      FROM tickets t
      JOIN orders o ON o.id = t.order_id
      JOIN events e ON e.id = o.event_id
      WHERE t.qr_code = ${qrCode}
    `;
    if (!ticket) return fail(404, "ticket not found");
    if (ticket.organizer_id !== organizerId) return fail(403, "ticket does not belong to your event");
    if (ticket.is_scanned) return fail(400, "ticket already scanned");
    if (new Date() > new Date(ticket.date)) return fail(400, "event already ended");

    await sql`UPDATE tickets SET is_scanned = true WHERE id = ${ticket.id}`;
    return ok({
      message: "ticket valid",
      ticket: { id: ticket.id, order_id: ticket.order_id, event_id: ticket.event_id, title: ticket.title, date: ticket.date, venue: ticket.venue },
    });
  },
};