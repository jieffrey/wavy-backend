import { z } from "zod";

// ISO 8601 dengan offset, mis. "2026-12-01T10:00:00+07:00" atau "...Z".
// undefined = tidak diubah (saat update), null = tanpa batas.
const salesDate = z.string().datetime({ offset: true }).nullable().optional();
const nonEmpty = z.string().trim().min(1, "must not be empty");

const before = (a: string | null | undefined, b: string) => !a || new Date(a) < new Date(b);
const notAfter = (a: string | null | undefined, b: string) => !a || new Date(a) <= new Date(b);

// Aturan jendela penjualan juga dicek ulang di updateEvent setelah merge dengan nilai lama.
export const eventSchema = z
  .object({
    title: nonEmpty,
    artist_id: z.number(),
    category: z.string(),
    venue: z.string(),
    date: z.string(),
    poster_url: z.string(),
    description: z.string(),
    sales_start_at: salesDate,
    sales_end_at: salesDate,
  })
  .refine(
    (e) => !e.sales_start_at || !e.sales_end_at || new Date(e.sales_end_at) > new Date(e.sales_start_at),
    { message: "sales_end_at must be after sales_start_at", path: ["sales_end_at"] }
  )
  .refine((e) => notAfter(e.sales_end_at, e.date), {
    message: "sales_end_at must not be after the event date",
    path: ["sales_end_at"],
  })
  .refine((e) => before(e.sales_start_at, e.date), {
    message: "sales_start_at must be before the event date",
    path: ["sales_start_at"],
  });

export const ticketCategorySchema = z.object({
  name: nonEmpty,
  price: z.number().nonnegative(),
  quota: z.number().int().positive(),
});

export const artistSchema = z.object({
  name: z.string(),
  genre: z.string(),
  photo_url: z.string(),
  bio: z.string(),
});

export const verifySchema = z.object({ approve: z.boolean() });

export const scanSchema = z.object({ qr_code: z.string() });
