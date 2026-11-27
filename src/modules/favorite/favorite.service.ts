import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

export const favoriteService = {
  async followArtist(customerId: number, artistId: number): Promise<Result<{ message: string }>> {
    const [artist] = await sql<{ id: number }[]>`SELECT id FROM artists WHERE id = ${artistId}`;
    if (!artist) return fail(404, "artist not found");
    await sql`
      INSERT INTO favorite_artists (customer_id, artist_id)
      VALUES (${customerId}, ${artistId}) ON CONFLICT DO NOTHING
    `;
    return ok({ message: "artist followed" });
  },

  async unfollowArtist(customerId: number, artistId: number) {
    await sql`DELETE FROM favorite_artists WHERE customer_id = ${customerId} AND artist_id = ${artistId}`;
    return ok({ message: "artist unfollowed" });
  },

  async list(customerId: number) {
    const artists = await sql`
      SELECT fa.id AS favorite_id, a.id, a.name, a.genre, a.photo_url
      FROM favorite_artists fa
      JOIN artists a ON a.id = fa.artist_id
      WHERE fa.customer_id = ${customerId}
    `;
    return ok({ artists });
  },
};