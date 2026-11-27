import { describe, expect, mock, test } from "bun:test";

// OTP tidak dikirim ke SMTP sungguhan saat test
const sentTo: string[] = [];
mock.module("../src/utils/email", () => ({
  sendOtpEmail: async (to: string) => {
    sentTo.push(to);
  },
}));

const { call, sql } = await import("./helpers");

const uniqEmail = () => `reg-${Date.now()}-${Math.random().toString(36).slice(2, 8)}@test.local`;

describe("POST /auth/register (customer)", () => {
  test("nama + email -> customer dibuat dengan nama, OTP terkirim, verify-otp mengembalikan nama", async () => {
    const email = uniqEmail();
    const res = await call("POST", "/auth/register", undefined, { name: "  Budi Santoso ", email: email.toUpperCase() });
    expect(res.status).toBe(200);
    const [c] = await sql`SELECT name FROM customers WHERE email = ${email}`;
    expect(c.name).toBe("Budi Santoso");
    expect(sentTo).toContain(email);
    const [otp] = await sql`SELECT code FROM otp_codes WHERE email = ${email} ORDER BY created_at DESC LIMIT 1`;
    const verify = await call("POST", "/auth/verify-otp", undefined, { email, code: otp.code });
    expect(verify.status).toBe(200);
    expect(verify.body.customer).toMatchObject({ name: "Budi Santoso", email });
  });

  test("email yang sudah terdaftar dengan nama -> 409 EMAIL_REGISTERED", async () => {
    const email = uniqEmail();
    await sql`INSERT INTO customers (name, email) VALUES ('Lama', ${email})`;
    const res = await call("POST", "/auth/register", undefined, { name: "Baru", email });
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("EMAIL_REGISTERED");
    const [c] = await sql`SELECT name FROM customers WHERE email = ${email}`;
    expect(c.name).toBe("Lama");
  });

  test("akun lama dari login OTP tanpa nama boleh mendaftar untuk mengisi nama", async () => {
    const email = uniqEmail();
    await sql`INSERT INTO customers (email) VALUES (${email})`;
    const res = await call("POST", "/auth/register", undefined, { name: "Sari", email });
    expect(res.status).toBe(200);
    const rows = await sql`SELECT name FROM customers WHERE email = ${email}`;
    expect(rows).toHaveLength(1);
    expect(rows[0].name).toBe("Sari");
  });

  test("validasi per field: nama terlalu pendek / email tidak valid", async () => {
    const short = await call("POST", "/auth/register", undefined, { name: "A", email: uniqEmail() });
    expect(short.status).toBe(400);
    expect(short.body.error).toMatchObject({ code: "VALIDATION_ERROR", field: "name" });
    const bad = await call("POST", "/auth/register", undefined, { name: "Budi", email: "bukan-email" });
    expect(bad.body.error).toMatchObject({ code: "VALIDATION_ERROR", field: "email" });
  });
});
