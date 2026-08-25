import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { sendOtpEmail } from "../../utils/email";
import { rateLimit } from "../../utils/rate-limit";
import { ok, fail, type Result } from "../../types/result";

type OrganizerRow = {
  id: number;
  name: string;
  email: string;
  password: string;
  status: string;
};
type CustomerRow = { id: number; name: string | null; email: string };
type OtpRow = { id: number; expires_at: Date };

export type LoginData = {
  access_token: string;
  organizer: { id: number; name: string; email: string };
};

export type OrganizerRegisterData = {
  message: string;
  status: string;
};

export type OtpData = {
  access_token: string;
  customer: { id: number; name: string | null; email: string };
};

const sign = (payload: object) => jwt.sign(payload, process.env.JWT_SECRET!, { expiresIn: "24h" });

export const authService = {
  async organizerLogin(email: string, password: string): Promise<Result<LoginData>> {
    const [organizer] = await sql<OrganizerRow[]>`SELECT * FROM organizers WHERE email = ${email}`;
    if (!organizer || !(await bcrypt.compare(password, organizer.password))) {
      if (!rateLimit(`login:${email}`, 5, 15 * 60 * 1000)) return fail(429, "too many login attempts, try again later");
      return fail(401, "invalid email or password");
    }
    if (organizer.status === "pending_verification") {
      return fail(403, "akun Anda masih dalam proses verifikasi kerja sama. Tim kami akan menghubungi Anda via WhatsApp/Email.");
    }
    if (organizer.status === "suspended") {
      return fail(403, "akun organizer Anda sedang ditangguhkan. Hubungi admin untuk informasi lebih lanjut.");
    }
    return ok({
      access_token: sign({ organizer_id: organizer.id }),
      organizer: { id: organizer.id, name: organizer.name, email: organizer.email },
    });
  },

  async organizerRegister(input: {
    organizer_name: string;
    email: string;
    password: string;
    whatsapp: string;
    event_types: string;
    social_link?: string;
  }): Promise<Result<OrganizerRegisterData>> {
    const [existing] = await sql<{ id: number }[]>`SELECT id FROM organizers WHERE email = ${input.email}`;
    if (existing) return fail(409, "email sudah terdaftar sebagai organizer");

    await sql`
      INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
      VALUES (${input.organizer_name}, ${input.email}, ${bcrypt.hashSync(input.password, 10)}, 'pending_verification', ${input.whatsapp}, ${input.event_types}, ${input.social_link ?? ""})
    `;
    return ok({
      message: "Pengajuan kerja sama terkirim. Tim kami akan memverifikasi dan menghubungi Anda via WhatsApp/Email.",
      status: "pending_verification",
    });
  },

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
    });
  },
};