import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { eventSchema, ticketCategorySchema, artistSchema } from "./organizer.schema";
import { verifyTicket } from "../ticket/ticket.service";
import { notificationService } from "../notification/notification.service";
import { expireByCategory, expireByOrganizer, expireOrder } from "../../utils/order-expiry";
import { markOrderPaid } from "../../utils/order-payment";
import { activePendingSql, remainingQuotaSql } from "../../utils/quota";
import { salesStatus, categorySalesStatus, type SalesStatus } from "../../utils/sales-status";

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
  sales_start_at: Date | null;
  sales_end_at: Date | null;
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
type ScannedTicket = {
  id: number;
  order_id: number;
  event_id: number;
  title: string;
  date: Date;
  venue: string;
  category_name: string | null;
};
type EventInput = z.output<typeof eventSchema>;
type CategoryInput = z.output<typeof ticketCategorySchema>;
type ArtistInput = z.output<typeof artistSchema>;

const toDate = (v: string | null | undefined) => (v ? new Date(v) : null);

type EventStats = {
  artist_name: string | null;
  total_quota: number;
  total_sold: number;
  total_pending: number;
  total_remaining: number;
};
type EventWithStats = EventRow & EventStats & { sales_status: SalesStatus };
type CategoryWithStats = CategoryRow & { pending: number; remaining: number; sales_status: SalesStatus };

// Event milik organizer + statistik kuota (rumus PRD §4.3 dari utils/quota.ts).
// db_now = now() DB supaya sales_status satu jam dengan hitungan pending/expiry.
const selectEventsWithStats = (organizerId: number, eventId?: number) => sql<
  (EventRow & EventStats & { db_now: Date })[]
>`
  SELECT e.*, a.name AS artist_name, now() AS db_now,
    COALESCE(s.total_quota, 0)::int AS total_quota,
    COALESCE(s.total_sold, 0)::int AS total_sold,
    COALESCE(s.total_pending, 0)::int AS total_pending,
    COALESCE(s.total_remaining, 0)::int AS total_remaining
  FROM events e
  LEFT JOIN artists a ON a.id = e.artist_id
  LEFT JOIN LATERAL (
    SELECT SUM(x.quota) AS total_quota, SUM(x.sold) AS total_sold,
           SUM(x.pending) AS total_pending, SUM(x.remaining) AS total_remaining
    FROM (
      SELECT tc.quota, tc.sold, ${activePendingSql(sql)} AS pending, ${remainingQuotaSql(sql)} AS remaining
      FROM ticket_categories tc WHERE tc.event_id = e.id
    ) x
  ) s ON true
  WHERE e.organizer_id = ${organizerId} ${eventId === undefined ? sql`` : sql`AND e.id = ${eventId}`}
  ORDER BY e.id DESC
`;

const withSalesStatus = ({ db_now, ...row }: EventRow & EventStats & { db_now: Date }): EventWithStats => ({
  ...row,
  sales_status: salesStatus(row, row.total_remaining, db_now),
});

type OrderListRow = OrderRow & {
  paid_at: Date | null;
  event_title: string;
  category_name: string | null;
  customer_name: string | null;
  customer_email: string | null;
};
type OrderFilters = { status?: string; eventId?: number; id?: number };
type PerCategoryRow = {
  event_id: number;
  event_title: string;
  category_id: number;
  name: string;
  quota: number;
  sold: number;
  pending: number;
  remaining: number;
  revenue: number;
};

// Satu bentuk baris order untuk list, detail, dan recent_orders dashboard.
const selectOrders = (organizerId: number, f: OrderFilters, limit?: number) => sql<OrderListRow[]>`
  SELECT o.*, e.title AS event_title, tc.name AS category_name,
    c.name AS customer_name, c.email AS customer_email
  FROM orders o
  JOIN events e ON e.id = o.event_id
  LEFT JOIN ticket_categories tc ON tc.id = o.ticket_category_id
  LEFT JOIN customers c ON c.id = o.customer_id
  WHERE e.organizer_id = ${organizerId}
    ${f.status ? sql`AND o.status = ${f.status}` : sql``}
    ${f.eventId !== undefined ? sql`AND o.event_id = ${f.eventId}` : sql``}
    ${f.id !== undefined ? sql`AND o.id = ${f.id}` : sql``}
  ORDER BY o.created_at DESC NULLS LAST, o.id DESC
  ${limit ? sql`LIMIT ${limit}` : sql``}
`;

// Validasi tanggal penjualan terhadap tanggal event (dipakai juga oleh updateEvent setelah merge).
export const salesWindowError = (date: Date, start: Date | null, end: Date | null): string | null => {
  if (start && end && end <= start) return "sales_end_at must be after sales_start_at";
  if (end && end > date) return "sales_end_at must not be after the event date";
  if (start && start >= date) return "sales_start_at must be before the event date";
  return null;
};

// tawarkan tiket yang kembali tersedia (reject/refund) ke waiting list teratas
const offerTickets = async (eventId: number, quantity: number) => {
  const [event] = await sql<{ title: string }[]>`SELECT title FROM events WHERE id = ${eventId}`;
  const offers = await sql<{ customer_id: number }[]>`
    SELECT customer_id FROM waiting_list
    WHERE event_id = ${eventId}
    ORDER BY created_at ASC
    LIMIT ${quantity}
  `;
  await notificationService.notifyMany(
    offers.map((o) => o.customer_id),
    `Slot tiket tersedia: ${event.title}`,
    `Tiket ${event.title} kembali tersedia di Wavy.`
  );
};

export const organizerService = {
  // ---------- Events ----------

  async listEvents(organizerId: number): Promise<Result<EventWithStats[]>> {
    return ok((await selectEventsWithStats(organizerId)).map(withSalesStatus));
  },

  async getEvent(
    organizerId: number,
    id: number
  ): Promise<Result<EventWithStats & { ticket_categories: CategoryWithStats[] }>> {
    const [row] = await selectEventsWithStats(organizerId, id);
    if (!row) return fail(404, "event not found");
    const event = withSalesStatus(row);
    const categories = await sql<(CategoryRow & { pending: number; remaining: number })[]>`
      SELECT tc.*, ${activePendingSql(sql)} AS pending, ${remainingQuotaSql(sql)} AS remaining
      FROM ticket_categories tc WHERE tc.event_id = ${id}
      ORDER BY tc.id
    `;
    const ticket_categories = categories.map((c) => ({
      ...c,
      sales_status: categorySalesStatus(event.sales_status, c.remaining),
    }));
    return ok({ ...event, ticket_categories });
  },

  async createEvent(organizerId: number, input: EventInput): Promise<Result<EventRow>> {
    const windowError = salesWindowError(new Date(input.date), toDate(input.sales_start_at), toDate(input.sales_end_at));
    if (windowError) return fail(400, windowError, "VALIDATION_ERROR");
    const [event] = await sql<EventRow[]>`
      INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, sales_start_at, sales_end_at)
      VALUES (${organizerId}, ${input.artist_id}, ${input.title}, ${input.category}, ${input.venue}, ${new Date(input.date)}, ${input.poster_url}, ${input.description},
              ${toDate(input.sales_start_at)}, ${toDate(input.sales_end_at)})
      RETURNING *
    `;
    return ok(event);
  },

  async updateEvent(organizerId: number, id: number, input: EventInput): Promise<Result<EventRow>> {
    const [current] = await sql<EventRow[]>`SELECT * FROM events WHERE id = ${id} AND organizer_id = ${organizerId}`;
    if (!current) return fail(404, "event not found");

    // field tenggat yang tidak dikirim dipertahankan; null berarti dihapus
    const salesStart = input.sales_start_at === undefined ? current.sales_start_at : toDate(input.sales_start_at);
    const salesEnd = input.sales_end_at === undefined ? current.sales_end_at : toDate(input.sales_end_at);
    const windowError = salesWindowError(new Date(input.date), salesStart, salesEnd);
    if (windowError) return fail(400, windowError, "VALIDATION_ERROR");

    const [event] = await sql<EventRow[]>`
      UPDATE events SET artist_id = ${input.artist_id}, title = ${input.title}, category = ${input.category},
        venue = ${input.venue}, date = ${new Date(input.date)}, poster_url = ${input.poster_url}, description = ${input.description},
        sales_start_at = ${salesStart}, sales_end_at = ${salesEnd}
      WHERE id = ${id} AND organizer_id = ${organizerId}
      RETURNING *
    `;
    if (!event) return fail(404, "event not found");
    return ok(event);
  },

  async deleteEvent(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    return sql.begin(async (tx): Promise<Result<{ message: string }>> => {
      const [event] = await tx<{ id: number }[]>`
        SELECT id FROM events WHERE id = ${id} AND organizer_id = ${organizerId} FOR UPDATE
      `;
      if (!event) return fail(404, "event not found");
      // order (status apa pun) adalah riwayat transaksi: event-nya tidak boleh hilang
      const [hasOrders] = await tx`SELECT 1 FROM orders WHERE event_id = ${id} LIMIT 1`;
      if (hasOrders) return fail(409, "event already has orders and cannot be deleted", "EVENT_HAS_ORDERS");
      // baris turunan tanpa order dibersihkan dulu supaya FK tidak memicu 500
      await tx`DELETE FROM notify_requests WHERE event_id = ${id}`;
      await tx`DELETE FROM waiting_list WHERE event_id = ${id}`;
      await tx`DELETE FROM waiting_room WHERE event_id = ${id}`;
      await tx`DELETE FROM reviews WHERE event_id = ${id}`;
      await tx`DELETE FROM ticket_categories WHERE event_id = ${id}`;
      await tx`DELETE FROM events WHERE id = ${id}`;
      return ok({ message: "event deleted" });
    });
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
    // event tanpa kategori tiket tidak bisa dijual, jadi tidak boleh di-publish (syarat dicek di SQL yang sama)
    const [event] = await sql<EventRow[]>`
      UPDATE events SET status = 'published'
      WHERE id = ${id} AND organizer_id = ${organizerId}
        AND EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = events.id)
      RETURNING *
    `;
    if (!event) {
      if (!(await this.ownEvent(organizerId, id))) return fail(404, "event not found");
      return fail(400, "add at least one ticket category before publishing", "NO_TICKET_CATEGORY");
    }
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
    if (input.price < 0) return fail(400, "price must not be negative", "VALIDATION_ERROR");
    // lock kategori (sama dengan POST /orders) supaya reservasi baru tidak menyelip
    // di antara hitung reserved dan update kuota
    return sql.begin(async (tx): Promise<Result<CategoryRow>> => {
      const [cat] = await tx<CategoryRow[]>`
        SELECT tc.* FROM ticket_categories tc
        JOIN events e ON e.id = tc.event_id
        WHERE tc.id = ${id} AND e.organizer_id = ${organizerId}
        FOR UPDATE OF tc
      `;
      if (!cat) return fail(404, "ticket category not found");
      await expireByCategory(tx, id);
      // reserved = tiket paid + order pending yang belum expired (PRD §4.3)
      const [{ reserved }] = await tx<{ reserved: number }[]>`
        SELECT (tc.sold + ${activePendingSql(tx)})::int AS reserved FROM ticket_categories tc WHERE tc.id = ${id}
      `;
      if (input.quota < reserved)
        return fail(400, `quota cannot be lower than reserved tickets (${reserved})`, "QUOTA_BELOW_RESERVED");
      const [updated] = await tx<CategoryRow[]>`
        UPDATE ticket_categories SET name = ${input.name}, price = ${input.price}, quota = ${input.quota}
        WHERE id = ${id}
        RETURNING *
      `;
      return ok(updated);
    });
  },

  async deleteCategory(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    return sql.begin(async (tx): Promise<Result<{ message: string }>> => {
      const [cat] = await tx<{ id: number }[]>`
        SELECT tc.id FROM ticket_categories tc
        JOIN events e ON e.id = tc.event_id
        WHERE tc.id = ${id} AND e.organizer_id = ${organizerId}
        FOR UPDATE OF tc
      `;
      if (!cat) return fail(404, "ticket category not found");
      const [hasOrders] = await tx`SELECT 1 FROM orders WHERE ticket_category_id = ${id} LIMIT 1`;
      if (hasOrders) return fail(409, "ticket category already has orders and cannot be deleted", "CATEGORY_HAS_ORDERS");
      await tx`DELETE FROM ticket_categories WHERE id = ${id}`;
      return ok({ message: "ticket category deleted" });
    });
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

  // ---------- Profil ----------

  async me(organizerId: number): Promise<Result<{ id: number; name: string; email: string; status: string }>> {
    const [organizer] = await sql<{ id: number; name: string; email: string; status: string }[]>`
      SELECT id, name, email, status FROM organizers WHERE id = ${organizerId}
    `;
    if (!organizer) return fail(404, "organizer not found");
    return ok(organizer);
  },

  // ---------- Dashboard ----------

  async dashboard(organizerId: number) {
    await expireByOrganizer(sql, organizerId);
    const [revenue] = await sql<{ revenue: number }[]>`
      SELECT COALESCE(SUM(o.total_price), 0)::float8 AS revenue
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
    `;
    // tiket per kategori; sisa kuota memakai rumus PRD §4.3 (dikurangi pending aktif)
    const per_category = await sql<PerCategoryRow[]>`
      SELECT e.id AS event_id, e.title AS event_title, tc.id AS category_id, tc.name,
        tc.quota::int AS quota, tc.sold::int AS sold,
        ${activePendingSql(sql)} AS pending,
        ${remainingQuotaSql(sql)} AS remaining,
        COALESCE((
          SELECT SUM(o.total_price) FROM orders o
          WHERE o.ticket_category_id = tc.id AND o.status = 'paid'
        ), 0)::float8 AS revenue
      FROM ticket_categories tc JOIN events e ON e.id = tc.event_id
      WHERE e.organizer_id = ${organizerId}
      ORDER BY e.date DESC, e.id DESC, tc.id
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
    // jendela bergulir 7 hari terakhir vs 7 hari sebelumnya, berdasarkan paid_at
    const [trend] = await sql<{ revenue_7d: number; revenue_prev_7d: number; sold_7d: number; sold_prev_7d: number }[]>`
      SELECT
        COALESCE(SUM(o.total_price) FILTER (WHERE o.paid_at > now() - interval '7 days'), 0)::float8 AS revenue_7d,
        COALESCE(SUM(o.total_price) FILTER (WHERE o.paid_at <= now() - interval '7 days'), 0)::float8 AS revenue_prev_7d,
        COALESCE(SUM(o.quantity) FILTER (WHERE o.paid_at > now() - interval '7 days'), 0)::int AS sold_7d,
        COALESCE(SUM(o.quantity) FILTER (WHERE o.paid_at <= now() - interval '7 days'), 0)::int AS sold_prev_7d
      FROM orders o JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
        AND o.paid_at > now() - interval '14 days'
    `;
    const [checked] = await sql<{ checked_in: number }[]>`
      SELECT COUNT(*)::int AS checked_in
      FROM tickets t JOIN orders o ON o.id = t.order_id JOIN events e ON e.id = o.event_id
      WHERE e.organizer_id = ${organizerId} AND t.is_scanned = true
    `;
    const recent_orders = await selectOrders(organizerId, {}, 5);

    const sum = (key: "sold" | "pending" | "remaining") => per_category.reduce((n, c) => n + c[key], 0);
    return ok({
      revenue: revenue.revenue,
      ticket_sold: sum("sold"),
      remaining_ticket: sum("remaining"),
      popular_category: popular?.popular_category ?? "",
      peak_purchase_hour: peak?.peak_purchase_hour ?? 0,
      kpi: {
        revenue: revenue.revenue,
        tickets_sold: sum("sold"),
        pending_reserved: sum("pending"),
        checked_in: checked.checked_in,
        ...trend,
      },
      per_category,
      recent_orders,
    });
  },

  // Penjualan harian (tanggal Asia/Jakarta) dari order paid berdasarkan paid_at; hari kosong = 0.
  async salesSeries(organizerId: number, days: number) {
    const rows = await sql<{ date: string; tickets: number; revenue: number }[]>`
      WITH days AS (
        SELECT generate_series(
          (now() AT TIME ZONE 'Asia/Jakarta')::date - ${days - 1}::int,
          (now() AT TIME ZONE 'Asia/Jakarta')::date,
          interval '1 day'
        )::date AS d
      ),
      paid AS (
        SELECT (o.paid_at AT TIME ZONE 'Asia/Jakarta')::date AS d, o.quantity, o.total_price
        FROM orders o JOIN events e ON e.id = o.event_id
        WHERE e.organizer_id = ${organizerId} AND o.status = 'paid'
          AND o.paid_at >= ((now() AT TIME ZONE 'Asia/Jakarta')::date - ${days - 1}::int) AT TIME ZONE 'Asia/Jakarta'
      )
      SELECT to_char(days.d, 'YYYY-MM-DD') AS date,
        COALESCE(SUM(paid.quantity), 0)::int AS tickets,
        COALESCE(SUM(paid.total_price), 0)::float8 AS revenue
      FROM days LEFT JOIN paid ON paid.d = days.d
      GROUP BY days.d
      ORDER BY days.d
    `;
    return ok(rows);
  },

  // ---------- Orders (organizer) ----------

  async listOrders(organizerId: number, filters: OrderFilters = {}) {
    await expireByOrganizer(sql, organizerId);
    return ok(await selectOrders(organizerId, filters));
  },

  async getOrder(
    organizerId: number,
    id: number
  ): Promise<Result<OrderListRow & { tickets: { id: number; is_scanned: boolean }[] }>> {
    await expireOrder(sql, id);
    const [order] = await selectOrders(organizerId, { id });
    if (!order) return fail(404, "order not found");
    const tickets = await sql<{ id: number; is_scanned: boolean }[]>`
      SELECT id, is_scanned FROM tickets WHERE order_id = ${id} ORDER BY id
    `;
    return ok({ ...order, tickets });
  },

  async verifyOrder(organizerId: number, id: number, approve: boolean): Promise<Result<{ message: string }>> {
    // lock baris order supaya approve/reject tidak balapan dengan approve lain atau expiry
    const result = await sql.begin(async (tx): Promise<Result<OrderRow>> => {
      await expireOrder(tx, id);
      const [order] = await tx<OrderRow[]>`
        SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
        WHERE o.id = ${id} AND e.organizer_id = ${organizerId}
        FOR UPDATE OF o
      `;
      if (!order) return fail(404, "order not found");
      if (order.status === "expired") return fail(409, "order has expired", "ORDER_EXPIRED");
      if (order.status !== "pending_payment") return fail(400, "order is not pending payment");

      if (approve) {
        await markOrderPaid(tx, order);
      } else {
        await tx`UPDATE orders SET status = 'rejected' WHERE id = ${id}`;
      }
      return ok(order);
    });
    if (!result.ok) return result;

    if (approve) return ok({ message: "order approved" });
    // auto-offer (phase 4 item 14): tiket dari order yang gagal ditawarkan ke waiting list teratas
    await offerTickets(result.data.event_id, result.data.quantity);
    return ok({ message: "order rejected" });
  },

  async refundOrder(organizerId: number, id: number): Promise<Result<{ message: string }>> {
    const [order] = await sql<OrderRow[]>`
      SELECT o.* FROM orders o JOIN events e ON e.id = o.event_id
      WHERE o.id = ${id} AND e.organizer_id = ${organizerId}
    `;
    if (!order) return fail(404, "order not found");
    if (order.status !== "paid") return fail(400, "only paid orders can be refunded");
    const [event] = await sql<{ date: Date }[]>`SELECT date FROM events WHERE id = ${order.event_id}`;
    if (new Date() > new Date(event.date)) return fail(400, "event already ended, no refunds");

    await sql.begin(async (tx) => {
      await tx`UPDATE orders SET status = 'refunded' WHERE id = ${id}`;
      await tx`UPDATE ticket_categories SET sold = GREATEST(sold - ${order.quantity}, 0) WHERE id = ${order.ticket_category_id}`;
      await tx`DELETE FROM tickets WHERE order_id = ${id}`;
    });
    await offerTickets(order.event_id, order.quantity);
    return ok({ message: "order refunded" });
  },

  async scanValidate(
    organizerId: number,
    qrCode: string
  ): Promise<Result<{ message: string; ticket: ScannedTicket }>> {
    try {
      verifyTicket(qrCode);
    } catch (err) {
      return err instanceof jwt.TokenExpiredError
        ? fail(400, "QR code expired", "QR_EXPIRED")
        : fail(400, "invalid QR code", "INVALID_QR");
    }

    const [ticket] = await sql<(ScannedTicket & { organizer_id: number; is_scanned: boolean; ended: boolean })[]>`
      SELECT t.id, t.order_id, t.is_scanned, e.id AS event_id, e.title, e.date, e.venue, e.organizer_id,
             tc.name AS category_name, (e.date < now()) AS ended
      FROM tickets t
      JOIN orders o ON o.id = t.order_id
      JOIN events e ON e.id = o.event_id
      LEFT JOIN ticket_categories tc ON tc.id = o.ticket_category_id
      WHERE t.qr_code = ${qrCode}
    `;
    if (!ticket) return fail(404, "ticket not found", "TICKET_NOT_FOUND");
    if (ticket.organizer_id !== organizerId) return fail(403, "ticket does not belong to your event", "WRONG_ORGANIZER");
    if (ticket.is_scanned) return fail(409, "ticket already scanned", "ALREADY_SCANNED");
    if (ticket.ended) return fail(400, "event already ended", "EVENT_ENDED");

    // atomik: dua scan bersamaan hanya satu yang lolos (yang lain dapat 0 baris)
    const [scanned] = await sql<{ id: number }[]>`
      UPDATE tickets SET is_scanned = true WHERE id = ${ticket.id} AND is_scanned = false RETURNING id
    `;
    if (!scanned) return fail(409, "ticket already scanned", "ALREADY_SCANNED");
    return ok({
      message: "ticket valid",
      ticket: {
        id: ticket.id,
        order_id: ticket.order_id,
        event_id: ticket.event_id,
        title: ticket.title,
        date: ticket.date,
        venue: ticket.venue,
        category_name: ticket.category_name,
      },
    });
  },
};