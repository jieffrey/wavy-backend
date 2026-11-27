import { describe, expect, mock, test } from "bun:test";

// OTP tidak dikirim ke SMTP sungguhan saat test
const sentTo: string[] = [];
mock.module("../src/utils/email", () => ({
  sendOtpEmail: async (to: string) => {
    sentTo.push(to);
  },
}));

const { call, sql } = await import("./helpers");

const uniqEmail = () => `otp-${Date.now()}-${Math.random().toString(36).slice(2, 8)}@test.local`;

async function login(email: string) {
  expect((await call("POST", "/auth/send-otp", undefined, { email })).status).toBe(200);
  const [otp] = await sql<{ code: string }[]>`
    SELECT code FROM otp_codes WHERE email = ${email.trim().toLowerCase()} ORDER BY created_at DESC LIMIT 1
  `;
  return call("POST", "/auth/verify-otp", undefined, { email, code: otp.code });
}

describe("satu alur masuk/daftar: email -> OTP -> isi nama", () => {
  test("email baru: akun dibuat tanpa nama, needs_name true; PATCH /me mengisi nama -> needs_name false", async () => {
    const email = uniqEmail();
    const verify = await login(email);
    expect(verify.status).toBe(200);
    expect(sentTo).toContain(email);
    expect(verify.body).toMatchObject({ needs_name: true, customer: { name: null, email } });
    const token = verify.body.access_token;

    const me = await call("GET", "/me", token);
    expect(me.status).toBe(200);
    expect(me.body).toMatchObject({ email, name: null, phone: "", needs_name: true });

    const saved = await call("PATCH", "/me", token, { name: "  Budi Santoso ", phone: "+62 812-3333" });
    expect(saved.status).toBe(200);
    expect(saved.body).toMatchObject({ name: "Budi Santoso", phone: "+62 812-3333", needs_name: false });

    // login berikutnya tidak meminta nama lagi
    const again = await login(email);
    expect(again.body).toMatchObject({ needs_name: false, customer: { name: "Budi Santoso" } });
  });

  test("email dinormalisasi: huruf besar & spasi tetap satu akun", async () => {
    const email = uniqEmail();
    await login(email);
    const upper = await login(`  ${email.toUpperCase()} `);
    expect(upper.status).toBe(200);
    const rows = await sql`SELECT id FROM customers WHERE email = ${email}`;
    expect(rows).toHaveLength(1);
  });

  test("PATCH /me: validasi per field, telepon opsional dipertahankan", async () => {
    const verify = await login(uniqEmail());
    const token = verify.body.access_token;
    const short = await call("PATCH", "/me", token, { name: "A" });
    expect(short.status).toBe(400);
    expect(short.body.error).toMatchObject({ code: "VALIDATION_ERROR", field: "name" });
    const badPhone = await call("PATCH", "/me", token, { name: "Sari", phone: "abc" });
    expect(badPhone.body.error).toMatchObject({ code: "VALIDATION_ERROR", field: "phone" });

    await call("PATCH", "/me", token, { name: "Sari", phone: "0812" });
    const keep = await call("PATCH", "/me", token, { name: "Sari Dewi" });
    expect(keep.body).toMatchObject({ name: "Sari Dewi", phone: "0812" });
  });

  test("tanpa token -> 401; /auth/register sudah dihapus", async () => {
    expect((await call("GET", "/me")).status).toBe(401);
    expect((await call("PATCH", "/me", undefined, { name: "X Y" })).status).toBe(401);
    expect((await call("POST", "/auth/register", undefined, { name: "Budi", email: uniqEmail() })).status).toBe(404);
  });
});
