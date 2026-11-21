import { describe, expect, test } from "bun:test";
import { createAdmin } from "../scripts/create-admin";
import { call, sql } from "./helpers";

const email = () => `create-admin-${Date.now()}-${Math.random().toString(36).slice(2, 8)}@test.local`;

describe("scripts/create-admin", () => {
  test("admin baru bisa login lewat POST /admin/login", async () => {
    const e = email();
    const res = await createAdmin(sql, { email: e, name: "Admin Baru", password: "password-awal-1" });
    expect(res.action).toBe("created");

    const login = await call("POST", "/admin/login", undefined, { email: e, password: "password-awal-1" });
    expect(login.status).toBe(200);
    expect(login.body.admin).toEqual({ id: res.id, name: "Admin Baru", email: e });
  });

  test("email yang sudah ada: password diganti, tidak ada baris duplikat", async () => {
    const e = email();
    const first = await createAdmin(sql, { email: e, name: "Admin", password: "password-lama-1" });
    const second = await createAdmin(sql, { email: e, name: "Admin Ganti", password: "password-baru-1" });
    expect(second).toEqual({ id: first.id, email: e, action: "updated" });

    const [{ n }] = await sql<{ n: number }[]>`SELECT count(*)::int AS n FROM admins WHERE email = ${e}`;
    expect(n).toBe(1);
    expect((await call("POST", "/admin/login", undefined, { email: e, password: "password-lama-1" })).status).toBe(401);
    expect((await call("POST", "/admin/login", undefined, { email: e, password: "password-baru-1" })).status).toBe(200);
  });

  test("input tidak valid ditolak sebelum menyentuh database", async () => {
    await expect(createAdmin(sql, { email: "bukan-email", name: "A", password: "password-ok-1" })).rejects.toThrow();
    await expect(createAdmin(sql, { email: email(), name: "A", password: "pendek" })).rejects.toThrow();
  });
});
