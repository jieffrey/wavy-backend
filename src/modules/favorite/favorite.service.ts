import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

export const favoriteService = {
  async followOrganizer(customerId: number, organizerId: number): Promise<Result<{ message: string }>> {
    const [org] = await sql<{ id: number }[]>`SELECT id FROM organizers WHERE id = ${organizerId}`;
    if (!org) return fail(404, "organizer not found");
    await sql`
      INSERT INTO favorite_organizers (customer_id, organizer_id)
      VALUES (${customerId}, ${organizerId}) ON CONFLICT DO NOTHING
    `;
    return ok({ message: "organizer followed" });
  },

  async unfollowOrganizer(customerId: number, organizerId: number) {
    await sql`DELETE FROM favorite_organizers WHERE customer_id = ${customerId} AND organizer_id = ${organizerId}`;
    return ok({ message: "organizer unfollowed" });
  },

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
    const organizers = await sql`
      SELECT fo.id AS favorite_id, o.id, o.name
      FROM favorite_organizers fo
      JOIN organizers o ON o.id = fo.organizer_id
      WHERE fo.customer_id = ${customerId}
    `;
    const artists = await sql`
      SELECT fa.id AS favorite_id, a.id, a.name, a.genre, a.photo_url
      FROM favorite_artists fa
      JOIN artists a ON a.id = fa.artist_id
      WHERE fa.customer_id = ${customerId}
    `;
    return ok({ organizers, artists });
  },
};