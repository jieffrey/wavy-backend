import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

export const waitingListService = {
  async join(customerId: number, eventId: number): Promise<Result<{ message: string; position: number }>> {
    const [event] = await sql<{ id: number }[]>`SELECT id FROM events WHERE id = ${eventId} AND status = 'published'`;
    if (!event) return fail(404, "concert not found");
    await sql`INSERT INTO waiting_list (event_id, customer_id) VALUES (${eventId}, ${customerId}) ON CONFLICT DO NOTHING`;
    const [pos] = await sql<{ position: number }[]>`
      SELECT COUNT(*)::int AS position FROM waiting_list
      WHERE event_id = ${eventId}
        AND created_at <= (SELECT created_at FROM waiting_list WHERE event_id = ${eventId} AND customer_id = ${customerId})
    `;
    return ok({ message: "joined waiting list", position: pos.position });
  },

  async leave(customerId: number, eventId: number) {
    await sql`DELETE FROM waiting_list WHERE customer_id = ${customerId} AND event_id = ${eventId}`;
    return ok({ message: "left waiting list" });
  },
};