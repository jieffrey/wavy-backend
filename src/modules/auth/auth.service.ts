import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { sendOtpEmail, sendOrganizerVerificationEmail } from "../../utils/email";
import { rateLimit } from "../../utils/rate-limit";
import { ok, fail, type Result } from "../../types/result";

type OrganizerRow = {
  id: number;
  name: string;
  email: string;
  password: string;
  status: string;
  rejection_reason: string | null;
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
    // frontend menampilkan penjelasan per status dari code (bukan dari teks message)
    if (organizer.status === "pending_verification") {
      return fail(
        403,
        "akun Anda masih dalam proses verifikasi kerja sama. Tim kami akan menghubungi Anda via WhatsApp/Email.",
        "ORGANIZER_PENDING"
      );
    }
    if (organizer.status === "rejected") {
      return fail(403, "pengajuan kerja sama Anda belum disetujui.", "ORGANIZER_REJECTED", {
        reason: organizer.rejection_reason ?? "",
      });
    }
    if (organizer.status === "suspended") {
      return fail(
        403,
        "akun organizer Anda sedang ditangguhkan. Hubungi admin untuk informasi lebih lanjut.",
        "ORGANIZER_SUSPENDED"
      );
    }
    if (organizer.status !== "active") return fail(403, "akun organizer tidak aktif");
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
    const password = bcrypt.hashSync(input.password, 10);
    const saved = await sql.begin(async (tx) => {
      const [existing] = await tx<{ id: number; status: string }[]>`
        SELECT id, status FROM organizers WHERE email = ${input.email} FOR UPDATE
      `;
      if (existing && existing.status !== "rejected") return false;
      if (existing) {
        // pengajuan yang ditolak boleh diajukan ulang dengan email yang sama -> kembali ke antrean admin
        await tx`
          UPDATE organizers SET
            name = ${input.organizer_name}, password = ${password}, status = 'pending_verification',
            whatsapp = ${input.whatsapp}, event_types = ${input.event_types}, social_link = ${input.social_link ?? ""},
            created_at = now(), email_verified_at = NULL, reviewed_at = NULL, rejection_reason = NULL
          WHERE id = ${existing.id}
        `;
      } else {
        await tx`
          INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link, created_at)
          VALUES (${input.organizer_name}, ${input.email}, ${password}, 'pending_verification', ${input.whatsapp}, ${input.event_types}, ${input.social_link ?? ""}, now())
        `;
      }
      return true;
    });
    if (!saved) return fail(409, "email sudah terdaftar sebagai organizer");

    // Send verification OTP to organizer email
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    await sql`
      INSERT INTO otp_codes (email, code, expires_at)
      VALUES (${input.email}, ${code}, LOCALTIMESTAMP + interval '5 minutes')
    `;
    try {
      await sendOrganizerVerificationEmail(input.email, code, input.organizer_name);
    } catch (e) {
      console.error("Failed to send organizer verification email:", e);
    }

    return ok({
      message: "Pengajuan kerja sama terkirim. Silakan cek email Anda untuk kode verifikasi.",
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

  async verifyOrganizerEmail(email: string, code: string): Promise<Result<{ message: string }>> {
    if (!rateLimit(`verify-org:${email}`, 5, 10 * 60 * 1000)) return fail(429, "too many attempts, try again later");

    const [otp] = await sql<OtpRow[]>`
      SELECT * FROM otp_codes
      WHERE email = ${email} AND code = ${code} AND used = false
        AND expires_at > LOCALTIMESTAMP
      ORDER BY created_at DESC
      LIMIT 1
    `;
    if (!otp) return fail(401, "kode OTP tidak valid atau sudah kedaluwarsa");

    await sql`UPDATE otp_codes SET used = true WHERE id = ${otp.id}`;

    // OTP hanya membuktikan email milik pendaftar; akun tetap pending_verification
    // sampai admin menyetujui (PATCH /admin/organizers/:id).
    const result = await sql`
      UPDATE organizers SET email_verified_at = COALESCE(email_verified_at, now())
      WHERE email = ${email} AND status = 'pending_verification'
    `;
    if (result.count === 0) {
      return fail(404, "organizer tidak ditemukan atau sudah diproses");
    }

    return ok({ message: "Email terverifikasi. Akun Anda menunggu persetujuan admin; kami kirim email setelah ditinjau." });
  },
};