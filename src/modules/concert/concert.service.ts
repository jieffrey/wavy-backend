import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

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
  description: string;
  status: string;
  artist_name: string;
  genre: string;
  photo_url: string;
  bio: string;
  organizer_name: string;
  countdown_seconds: number;
};
type CategoryRow = {
  id: number;
  event_id: number;
  name: string;
  price: string;
  quota: number;
  sold: number;
  remaining: number;
};

type ReviewRow = {
  id: number;
  rating: number;
  comment: string | null;
  created_at: Date;
  customer_name: string;
};

export const concertService = {
  async list(category?: string, q?: string) {
    return ok(
      await sql<ConcertRow[]>`
        SELECT e.id, e.title, e.category, e.venue, e.date, e.poster_url, e.status,
               a.name AS artist_name, o.name AS organizer_name,
               (SELECT MIN(tc.price) FROM ticket_categories tc WHERE tc.event_id = e.id) AS min_price,
               (SELECT COALESCE(SUM(tc.quota - tc.sold), 0) FROM ticket_categories tc WHERE tc.event_id = e.id) AS remaining
        FROM events e
        JOIN artists a ON a.id = e.artist_id
        JOIN organizers o ON o.id = e.organizer_id
        WHERE e.status = 'published'
          ${category ? sql`AND e.category = ${category}` : sql``}
          ${q ? sql`AND (e.title ILIKE ${`%${q}%`} OR a.name ILIKE ${`%${q}%`})` : sql``}
        ORDER BY e.date ASC
      `,
    );
  },

  async detail(
    id: number,
  ): Promise<
    Result<
      ConcertDetailRow & {
        ticket_categories: CategoryRow[];
        reviews: ReviewRow[];
        avg_rating: number;
        review_count: number;
      }
    >
  > {
    const [event] = await sql<ConcertDetailRow[]>`
      SELECT e.*, a.name AS artist_name, a.genre, a.photo_url, a.bio, o.name AS organizer_name,
        GREATEST(EXTRACT(EPOCH FROM (e.date - now()))::int, 0) AS countdown_seconds
      FROM events e
      JOIN artists a ON a.id = e.artist_id
      JOIN organizers o ON o.id = e.organizer_id
      WHERE e.id = ${id} AND e.status = 'published'
    `;
    if (!event) return fail(404, "concert not found");
    const ticket_categories = await sql<CategoryRow[]>`
      SELECT tc.*, (tc.quota - tc.sold) AS remaining
      FROM ticket_categories tc
      WHERE tc.event_id = ${id}
    `;
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
      ...event,
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
