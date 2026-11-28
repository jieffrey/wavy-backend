import { z } from "zod";

// email dinormalisasi (trim + huruf kecil) supaya satu orang = satu akun, apa pun cara mengetiknya
const email = z.string().trim().toLowerCase().email();

export const sendOtpSchema = z.object({ email });
export const verifyOtpSchema = z.object({ email, code: z.string().regex(/^[0-9]{6}$/, "code must be 6 digits") });
