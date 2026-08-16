import { sql } from "../../db/client";
import { ok } from "../../types/result";

export const homepageService = {
  async get() {
    const featured_events = await sql`
      SELECT e.id, e.title, e.category, e.venue, e.date, e.poster_url,
        a.name AS artist_name, o.name AS organizer_name,
        COALESCE((SELECT SUM(tc.quota - tc.sold) FROM ticket_categories tc WHERE tc.event_id = e.id), 0)::int AS remaining_ticket
      FROM events e
      JOIN artists a ON a.id = e.artist_id
      JOIN organizers o ON o.id = e.organizer_id
      WHERE e.status = 'published' AND e.date >= now()
      ORDER BY e.date ASC
      LIMIT 6
    `;
    const popular_artists = await sql`
      SELECT a.id, a.name, a.genre, a.photo_url, COUNT(fa.id)::int AS follower_count
      FROM artists a
      LEFT JOIN favorite_artists fa ON fa.artist_id = a.id
      GROUP BY a.id
      ORDER BY follower_count DESC, a.id ASC
      LIMIT 8
    `;
    const organizers = await sql`
      SELECT o.id, o.name, COUNT(fo.id)::int AS follower_count
      FROM organizers o
      LEFT JOIN favorite_organizers fo ON fo.organizer_id = o.id
      GROUP BY o.id
      ORDER BY follower_count DESC, o.id ASC
      LIMIT 4
    `;
    return ok({ featured_events, popular_artists, organizers });
  },
};