import { z } from "zod";

export const loginSchema = z.object({ email: z.string().email(), password: z.string() });
export const sendOtpSchema = z.object({ email: z.string().email() });
export const verifyOtpSchema = z.object({ email: z.string().email(), code: z.string().length(6) });