import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sql } from "../db/client";
import { sendOtpEmail } from "../utils/email";
import type { AppEnv } from "../middleware/auth.middleware";

const authRoutes = new Hono<AppEnv>();

const loginSchema = z.object({ email: z.string().email(), password: z.string() });
const sendOtpSchema = z.object({ email: z.string().email() });
const verifyOtpSchema = z.object({ email: z.string().email(), code: z.string().length(6) });

const sign = (payload: object) => jwt.sign(payload, process.env.JWT_SECRET!, { expiresIn: "24h" });

authRoutes.post(
  "/organizer/login",
  zValidator<typeof loginSchema, "json", AppEnv, string>("json", loginSchema),
  async (c) => {
    const { email, password } = c.req.valid("json");
    const [organizer] = await sql`SELECT * FROM organizers WHERE email = ${email}`;
    if (!organizer || !(await bcrypt.compare(password, organizer.password))) {
      return c.json({ error: "invalid email or password" }, 401);
    }
    const access_token = sign({ organizer_id: organizer.id });
    return c.json({ access_token, organizer: { id: organizer.id, name: organizer.name, email: organizer.email } });
  }
);

authRoutes.post(
  "/send-otp",
  zValidator<typeof sendOtpSchema, "json", AppEnv, string>("json", sendOtpSchema),
  async (c) => {
    const { email } = c.req.valid("json");
    const [existing] = await sql`SELECT id FROM customers WHERE email = ${email}`;
    if (!existing) {
      await sql`INSERT INTO customers (email) VALUES (${email})`;
    }
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    await sql`
      INSERT INTO otp_codes (email, code, expires_at)
      VALUES (${email}, ${code}, now() + interval '5 minutes')
    `;
    await sendOtpEmail(email, code);
    return c.json({ message: "OTP sent to email" });
  }
);

authRoutes.post(
  "/verify-otp",
  zValidator<typeof verifyOtpSchema, "json", AppEnv, string>("json", verifyOtpSchema),
  async (c) => {
    const { email, code } = c.req.valid("json");
    const [otp] = await sql`
      SELECT * FROM otp_codes
      WHERE email = ${email} AND code = ${code} AND used = false
      ORDER BY created_at DESC
      LIMIT 1
    `;
    if (!otp) return c.json({ error: "invalid OTP code" }, 401);
    if (new Date(otp.expires_at) < new Date()) return c.json({ error: "OTP code expired" }, 401);

    await sql`UPDATE otp_codes SET used = true WHERE id = ${otp.id}`;
    const [customer] = await sql`SELECT * FROM customers WHERE email = ${email}`;
    const access_token = sign({ customer_id: customer.id });
    return c.json({ access_token, customer: { id: customer.id, name: customer.name, email: customer.email } });
  }
);

export default authRoutes;