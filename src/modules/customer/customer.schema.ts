import { z } from "zod";

export const createOrderSchema = z.object({
  event_id: z.number(),
  ticket_category_id: z.number(),
  quantity: z.number().int().min(1).max(4),
});