import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { sendOtpEmail } from "../../utils/email";
import { rateLimit } from "../../utils/rate-limit";
import { ok, fail, type Result } from "../../types/result";

type CustomerRow = { id: number; name: string | null; email: string };
type OtpRow = { id: number; expires_at: Date };

export type OtpData = {
  access_token: string;
  customer: { id: number; name: string | null; email: string };
  /** true = akun baru / nama belum diisi; klien menampilkan langkah "isi nama" lalu PATCH /me */
  needs_name: boolean;
};

const sign = (payload: object) => jwt.sign(payload, process.env.JWT_SECRET!, { expiresIn: "24h" });

export const authService = {
  // Satu alur masuk/daftar (web & mobile): email -> OTP. Email baru = akun dibuat tanpa nama;
  // verify-otp mengembalikan needs_name: true sampai nama diisi lewat PATCH /me.
  async sendOtp(email: string): Promise<Result<{ message: string }>> {
    const [recent] = await sql<{ c: number }[]>`
      SELECT COUNT(*)::int AS c FROM otp_codes
      WHERE email = ${email} AND created_at > LOCALTIMESTAMP - interval '5 minutes'
    `;
    if (recent.c >= 3) return fail(429, "too many OTP requests, try again later");
    const [existing] = await sql<CustomerRow[]>`SELECT id FROM customers WHERE email = ${email}`;
    if (!existing) {
      await sql`INSERT INTO customers (email) VALUES (${email})`;
    }
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    await sql`
      INSERT INTO otp_codes (email, code, expires_at)
      VALUES (${email}, ${code}, LOCALTIMESTAMP + interval '5 minutes')
    `;
    await sendOtpEmail(email, code);
    return ok({ message: "OTP sent to email" });
  },

  async verifyOtp(email: string, code: string): Promise<Result<OtpData>> {
    if (!rateLimit(`verify:${email}`, 5, 10 * 60 * 1000)) return fail(429, "too many attempts, try again later");
    const [otp] = await sql<OtpRow[]>`
      SELECT * FROM otp_codes
      WHERE email = ${email} AND code = ${code} AND used = false
        AND expires_at > LOCALTIMESTAMP
      ORDER BY created_at DESC
      LIMIT 1
    `;
    if (!otp) return fail(401, "invalid OTP code");

    await sql`UPDATE otp_codes SET used = true WHERE id = ${otp.id}`;
    const [customer] = await sql<CustomerRow[]>`SELECT * FROM customers WHERE email = ${email}`;
    return ok({
      access_token: sign({ customer_id: customer.id }),
      customer: { id: customer.id, name: customer.name, email: customer.email },
      needs_name: !customer.name?.trim(),
    });
  },

};