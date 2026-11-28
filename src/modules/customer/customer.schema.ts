import { z } from "zod";

export const MAX_TICKETS_PER_ORDER = 4;

export const createOrderSchema = z.object({
  event_id: z.number(),
  ticket_category_id: z.number(),
  quantity: z
    .number({
      required_error: "quantity is required",
      invalid_type_error: "quantity must be a number",
    })
    .int("quantity must be a whole number")
    .min(1, "quantity must be at least 1")
    .max(MAX_TICKETS_PER_ORDER, `quantity must be at most ${MAX_TICKETS_PER_ORDER} tickets per order`),
  full_name: z.string().trim().max(200).optional().default(""),
  email: z.string().trim().max(200).optional().default(""),
  phone: z.string().trim().max(30).optional().default(""),
  id_number: z.string().trim().max(50).optional().default(""),
  birth_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, "birth_date must be YYYY-MM-DD").optional().nullable(),
  gender: z.enum(["L", "P"]).optional().nullable(),
  wa_consent: z.enum(["Ya", "Tidak"]).optional().nullable(),
});

// PATCH /me: nama wajib (langkah "isi nama" setelah OTP untuk akun baru), telepon opsional.
export const profileSchema = z.object({
  name: z.string().trim().min(2, "name must be at least 2 characters").max(80, "name must be at most 80 characters"),
  phone: z
    .string()
    .trim()
    .max(30, "phone must be at most 30 characters")
    .regex(/^[0-9+\-\s]*$/, "phone may only contain digits, +, - and spaces")
    .optional(),
});
