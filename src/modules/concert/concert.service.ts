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

export const concertService = {
  async list(category?: string) {
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
        ORDER BY e.date ASC
      `
    );
  },

  async detail(id: number): Promise<Result<ConcertDetailRow & { ticket_categories: CategoryRow[] }>> {
    const [event] = await sql<ConcertDetailRow[]>`
      SELECT e.*, a.name AS artist_name, a.genre, a.photo_url, a.bio, o.name AS organizer_name
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
    return ok({ ...event, ticket_categories });
  },
};