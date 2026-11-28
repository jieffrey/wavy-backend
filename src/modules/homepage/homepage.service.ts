import { sql } from "../../db/client";
import { ok } from "../../types/result";
import { remainingQuotaSql } from "../../utils/quota";
import { salesStatus, type SalesWindow } from "../../utils/sales-status";

type FeaturedRow = SalesWindow & {
  id: number;
  title: string;
  category: string;
  venue: string;
  date: Date;
  poster_url: string;
  artist_name: string;
  remaining_ticket: number;
  now: Date;
};

export const homepageService = {
  async get() {
    // remaining_ticket memakai rumus kuota yang sama dengan /concerts & POST /orders,
    // supaya angka dan sales_status tidak saling bertentangan
    const featured = await sql<FeaturedRow[]>`
      SELECT e.id, e.title, e.category, e.venue, e.date, e.poster_url,
        e.status, e.sales_start_at, e.sales_end_at, now() AS now,
        a.name AS artist_name,
        (SELECT COALESCE(SUM(${remainingQuotaSql(sql)}), 0)::int FROM ticket_categories tc WHERE tc.event_id = e.id) AS remaining_ticket
      FROM events e
      JOIN artists a ON a.id = e.artist_id
      WHERE e.status = 'published' AND e.date >= now()
      ORDER BY e.date ASC
      LIMIT 6
    `;
    const featured_events = featured.map(({ now, status, sales_start_at, sales_end_at, ...e }) => ({
      ...e,
      sales_status: salesStatus({ status, sales_start_at, sales_end_at }, e.remaining_ticket, now),
    }));
    const popular_artists = await sql`
      SELECT a.id, a.name, a.genre, a.photo_url, COUNT(fa.id)::int AS follower_count
      FROM artists a
      LEFT JOIN favorite_artists fa ON fa.artist_id = a.id
      GROUP BY a.id
      ORDER BY follower_count DESC, a.id ASC
      LIMIT 8
    `;
    return ok({ featured_events, popular_artists });
  },
};