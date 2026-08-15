import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import type { z } from "zod";
import type { reviewSchema } from "./review.schema";

type ReviewInput = z.output<typeof reviewSchema>;
type ReviewBase = { id: number; customer_id: number; event_id: number; rating: number; comment: string | null; created_at: Date };
type ReviewRow = ReviewBase & { customer_name: string };

export const reviewService = {
  async create(customerId: number, eventId: number, input: ReviewInput): Promise<Result<ReviewBase>> {
    const [event] = await sql<{ id: number }[]>`SELECT id FROM events WHERE id = ${eventId} AND status = 'published'`;
    if (!event) return fail(404, "event not found");

    const [paid] = await sql<{ id: number }[]>`
      SELECT id FROM orders WHERE customer_id = ${customerId} AND event_id = ${eventId} AND status = 'paid'
    `;
    if (!paid) return fail(400, "you must have a paid ticket to review");

    const [existing] = await sql<{ id: number }[]>`
      SELECT id FROM reviews WHERE customer_id = ${customerId} AND event_id = ${eventId}
    `;
    if (existing) return fail(400, "already reviewed");

    const [review] = await sql<ReviewBase[]>`
      INSERT INTO reviews (customer_id, event_id, rating, comment)
      VALUES (${customerId}, ${eventId}, ${input.rating}, ${input.comment ?? null})
      RETURNING id, customer_id, event_id, rating, comment, created_at
    `;
    return ok(review);
  },

  async list(eventId: number) {
    return ok(
      await sql<ReviewRow[]>`
        SELECT r.id, r.customer_id, r.event_id, r.rating, r.comment, r.created_at, c.name AS customer_name
        FROM reviews r
        JOIN customers c ON c.id = r.customer_id
        WHERE r.event_id = ${eventId}
        ORDER BY r.created_at DESC
      `
    );
  },
};