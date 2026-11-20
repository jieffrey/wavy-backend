import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import { remainingQuotaSql } from "../../utils/quota";
import { categorySalesStatus, salesStatus, type SalesStatus } from "../../utils/sales-status";

type ConcertRow = {
  id: number;
  title: string;
  category: string;
  venue: string;
  date: Date;
  poster_url: string;
  status: string;
  artist_name: string;
  organizer_name: string;
  min_price: string | null;
  remaining: number;
  sales_start_at: Date | null;
  sales_end_at: Date | null;
};
type ConcertDetailRow = {
  id: number;
  organizer_id: number;
  artist_id: number;
  title: string;
  category: string;
  venue: string;
  date: Date;
  poster_url: string;
  banner_url: string;
  description: string;
  gallery: string;
  terms_conditions: string;
  seatmap: string;
  status: string;
  artist_name: string;
  genre: string;
  photo_url: string;
  bio: string;
  organizer_name: string;
  countdown_seconds: number;
  sales_start_at: Date | null;
  sales_end_at: Date | null;
  now: Date;
};
type CategoryRow = {
  id: number;
  event_id: number;
  name: string;
  price: string;
  quota: number;
  sold: number;
  remaining: number;
  benefits: string;
};

type ReviewRow = {
  id: number;
  rating: number;
  comment: string | null;
  created_at: Date;
  customer_name: string;
};

export const concertService = {
  async list(category?: string, q?: string): Promise<Result<(ConcertRow & { sales_status: SalesStatus })[]>> {
    const rows = await sql<(ConcertRow & { now: Date })[]>`
        SELECT e.id, e.title, e.category, e.venue, e.date, e.poster_url, e.status,
               e.sales_start_at, e.sales_end_at, now() AS now,
               a.name AS artist_name, o.name AS organizer_name,
               (SELECT MIN(tc.price) FROM ticket_categories tc WHERE tc.event_id = e.id) AS min_price,
               (SELECT COALESCE(SUM(${remainingQuotaSql(sql)}), 0)::int FROM ticket_categories tc WHERE tc.event_id = e.id) AS remaining
        FROM events e
        JOIN artists a ON a.id = e.artist_id
        JOIN organizers o ON o.id = e.organizer_id
        WHERE e.status = 'published'
          ${category ? sql`AND e.category = ${category}` : sql``}
          ${q ? sql`AND (e.title ILIKE ${`%${q}%`} OR a.name ILIKE ${`%${q}%`})` : sql``}
        ORDER BY e.date ASC
      `;
    return ok(rows.map(({ now, ...row }) => ({ ...row, sales_status: salesStatus(row, row.remaining, now) })));
  },

  async detail(
    id: number,
  ): Promise<
    Result<
      Omit<ConcertDetailRow, "gallery" | "seatmap" | "now"> & {
        gallery: string[];
        seatmap: { name: string; images: string[] } | null;
        sales_status: SalesStatus;
        ticket_categories: (CategoryRow & { sales_status: SalesStatus })[];
        reviews: ReviewRow[];
        avg_rating: number;
        review_count: number;
      }
    >
  > {
    const [event] = await sql<ConcertDetailRow[]>`
      SELECT e.*, a.name AS artist_name, a.genre, a.photo_url, a.bio, o.name AS organizer_name,
        GREATEST(EXTRACT(EPOCH FROM (e.date - now()))::int, 0) AS countdown_seconds, now() AS now
      FROM events e
      JOIN artists a ON a.id = e.artist_id
      JOIN organizers o ON o.id = e.organizer_id
      WHERE e.id = ${id} AND e.status IN ('published', 'closed')
    `;
    // closed tetap tampil (sales_status = closed) supaya link lama tidak 404; draft tetap tersembunyi
    if (!event) return fail(404, "concert not found");
    let gallery: string[] = [];
    try {
      gallery = JSON.parse(event.gallery || "[]");
    } catch {
      gallery = [];
    }
    let seatmap: { name: string; images: string[] } | null = null;
    try {
      const parsed = JSON.parse(event.seatmap || "null") as
        | { name: string; image?: string; images?: string[] }
        | null;
      if (parsed) {
        seatmap = { name: parsed.name, images: parsed.images?.length ? parsed.images : parsed.image ? [parsed.image] : [] };
      }
    } catch {
      seatmap = null;
    }
    const categories = await sql<CategoryRow[]>`
      SELECT tc.*, ${remainingQuotaSql(sql)} AS remaining
      FROM ticket_categories tc
      WHERE tc.event_id = ${id}
    `;
    const { now, ...eventFields } = event;
    const totalRemaining = categories.reduce((sum, c) => sum + c.remaining, 0);
    const sales_status = salesStatus(event, totalRemaining, now);
    const ticket_categories = categories.map((c) => ({
      ...c,
      sales_status: categorySalesStatus(sales_status, c.remaining),
    }));
    const [rating] = await sql<{ avg_rating: number; review_count: number }[]>`
      SELECT COALESCE(AVG(rating), 0)::float8 AS avg_rating, COUNT(*)::int AS review_count
      FROM reviews
      WHERE event_id = ${id}
    `;
    const reviews = await sql<ReviewRow[]>`
      SELECT r.id, r.rating, r.comment, r.created_at, c.name AS customer_name
      FROM reviews r
      JOIN customers c ON c.id = r.customer_id
      WHERE r.event_id = ${id}
      ORDER BY r.created_at DESC
    `;
    return ok({
      ...eventFields,
      gallery,
      seatmap,
      sales_status,
      ticket_categories,
      reviews,
      avg_rating: rating.avg_rating,
      review_count: rating.review_count,
    });
  },

  async notifyMe(
    customerId: number,
    eventId: number,
  ): Promise<Result<{ message: string }>> {
    // boleh subscribe ke event apapun yang ada (belum dibuka = draft), notif dikirim saat publish
    const [event] = await sql<
      { id: number }[]
    >`SELECT id FROM events WHERE id = ${eventId}`;
    if (!event) return fail(404, "concert not found");
    await sql`
      INSERT INTO notify_requests (customer_id, event_id)
      VALUES (${customerId}, ${eventId}) ON CONFLICT DO NOTHING
    `;
    return ok({ message: "notification requested" });
  },

  async cancelNotifyMe(customerId: number, eventId: number) {
    await sql`DELETE FROM notify_requests WHERE customer_id = ${customerId} AND event_id = ${eventId}`;
    return ok({ message: "notification cancelled" });
  },
};
