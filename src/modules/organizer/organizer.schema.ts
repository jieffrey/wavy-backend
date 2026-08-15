import { z } from "zod";

export const eventSchema = z.object({
  title: z.string(),
  artist_id: z.number(),
  category: z.string(),
  venue: z.string(),
  date: z.string(),
  poster_url: z.string(),
  description: z.string(),
});

export const ticketCategorySchema = z.object({
  name: z.string(),
  price: z.number(),
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