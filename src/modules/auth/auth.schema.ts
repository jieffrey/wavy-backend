import { z } from "zod";

export const loginSchema = z.object({ email: z.string().email(), password: z.string() });

export const organizerRegisterSchema = z.object({
  organizer_name: z.string().min(2),
  email: z.string().email(),
  password: z.string().min(8),
  whatsapp: z.string().min(8),
  event_types: z.string(),
  social_link: z.string().optional(),
});
export const sendOtpSchema = z.object({ email: z.string().email() });
export const verifyOtpSchema = z.object({ email: z.string().email(), code: z.string().length(6) });