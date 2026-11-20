import { z } from "zod";

export const createOrderSchema = z.object({
  event_id: z.number(),
  ticket_category_id: z.number(),
  quantity: z.number().int().min(1).max(4),
  full_name: z.string().trim().max(200).optional().default(""),
  email: z.string().trim().max(200).optional().default(""),
  phone: z.string().trim().max(30).optional().default(""),
  id_number: z.string().trim().max(50).optional().default(""),
  birth_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, "birth_date must be YYYY-MM-DD").optional().nullable(),
  gender: z.enum(["L", "P"]).optional().nullable(),
  wa_consent: z.enum(["Ya", "Tidak"]).optional().nullable(),
});