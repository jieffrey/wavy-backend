import bcrypt from "bcryptjs";
import { sql } from "../src/db/client";

const EO_NAME = "Demo Event Organizer";
const EO_EMAIL = process.env.DEMO_EO_EMAIL ?? "demo.eo@wavy.test";
const EO_PASSWORD = process.env.DEMO_EO_PASSWORD ?? "demo12345";
const BUYER_NAME = "Demo Pembeli";
const BUYER_EMAIL = process.env.DEMO_BUYER_EMAIL ?? "demo.buyer@wavy.test";
const DEMO_OTP = "123456";

// EO — login via email/password (POST /auth/organizer/login)
const [eo] = await sql<{ id: number }[]>`SELECT id FROM organizers WHERE email = ${EO_EMAIL}`;
if (eo) {
  await sql`UPDATE organizers SET name = ${EO_NAME}, password = ${bcrypt.hashSync(EO_PASSWORD, 10)}, status = 'active' WHERE id = ${eo.id}`;
} else {
  await sql`INSERT INTO organizers (name, email, password) VALUES (${EO_NAME}, ${EO_EMAIL}, ${bcrypt.hashSync(EO_PASSWORD, 10)})`;
}

// Pembeli — login via OTP (POST /auth/send-otp + /auth/verify-otp)
const [buyer] = await sql<{ id: number }[]>`SELECT id FROM customers WHERE email = ${BUYER_EMAIL}`;
if (buyer) {
  await sql`UPDATE customers SET name = ${BUYER_NAME} WHERE id = ${buyer.id}`;
} else {
  await sql`INSERT INTO customers (name, email) VALUES (${BUYER_NAME}, ${BUYER_EMAIL})`;
}

// OTP siap pakai langsung di DB (15 menit) — tanpa perlu email sungguhan
await sql`INSERT INTO otp_codes (email, code, expires_at) VALUES (${BUYER_EMAIL}, ${DEMO_OTP}, LOCALTIMESTAMP + interval '15 minutes')`;

console.log("=== Seed akun demo ===");
console.log(`EO       : ${EO_EMAIL} / ${EO_PASSWORD}`);
console.log(`Pembeli  : ${BUYER_EMAIL} / OTP ${DEMO_OTP}`);
console.log("(verifikasi OTP: POST /api/v1/auth/verify-otp { email, code })");

await sql.end();