import { z } from "zod";

export const sendOtpSchema = z.object({ email: z.string().email() });
// daftar customer: nama + email -> OTP (verifikasi tetap lewat /auth/verify-otp)
export const customerRegisterSchema = z.object({
  name: z.string().trim().min(2).max(80),
  email: z.string().trim().toLowerCase().email(),
});
export const verifyOtpSchema = z.object({ email: z.string().email(), code: z.string().length(6) });
