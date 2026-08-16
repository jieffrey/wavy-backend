import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

type Pos = { position: number; total: number };

// posisi acak-adil & stabil: md5(customer_id) jadi urutan pseudo-random tetap per event
const myPos = async (eventId: number, customerId: number): Promise<Pos | null> => {
  const [row] = await sql<Pos[]>`
    SELECT position, total FROM (
      SELECT customer_id, RANK() OVER (ORDER BY md5(customer_id::text)) AS position, COUNT(*) OVER () AS total
      FROM waiting_room WHERE event_id = ${eventId}
    ) q WHERE q.customer_id = ${customerId}
  `;
  return row ?? null;
};

export const waitingRoomService = {
  async join(customerId: number, eventId: number): Promise<Result<{ message: string } & Pos>> {
    const [event] = await sql<{ id: number }[]>`SELECT id FROM events WHERE id = ${eventId} AND status = 'published'`;
    if (!event) return fail(404, "concert not found");
    await sql`INSERT INTO waiting_room (event_id, customer_id) VALUES (${eventId}, ${customerId}) ON CONFLICT DO NOTHING`;
    return ok({ message: "joined waiting room", ...((await myPos(eventId, customerId))!) });
  },

  async status(customerId: number, eventId: number) {
    const pos = await myPos(eventId, customerId);
    return ok({ joined: !!pos, position: pos?.position ?? null, total: pos?.total ?? 0 });
  },
};