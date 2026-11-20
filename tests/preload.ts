// Dijalankan sebelum semua test (lihat bunfig.toml).
// Test TIDAK BOLEH memakai DATABASE_URL dari .env (NeonDB). Database test wajib:
//   - di-set lewat TEST_DATABASE_URL
//   - namanya berakhiran _test
//   - host lokal (localhost / 127.0.0.1)
// Skema public di database test di-DROP dan dibangun ulang setiap run.

import { afterAll } from "bun:test";
import { join } from "node:path";

const testUrl = process.env.TEST_DATABASE_URL;
if (!testUrl) {
  throw new Error(
    "TEST_DATABASE_URL belum di-set. Contoh: TEST_DATABASE_URL=postgres://postgres:postgres@localhost:5432/wavy_test bun test"
  );
}

const parsed = new URL(testUrl);
const dbName = parsed.pathname.replace(/^\//, "");
if (!dbName.endsWith("_test")) {
  throw new Error(`Nama database test harus berakhiran _test (dapat: "${dbName}")`);
}
if (!["localhost", "127.0.0.1", "::1", "[::1]"].includes(parsed.hostname)) {
  throw new Error(`Database test harus lokal (dapat host: "${parsed.hostname}")`);
}

process.env.DATABASE_URL = testUrl;
process.env.DATABASE_SSL ??= "disable";
process.env.JWT_SECRET ??= "wavy-test-secret";

// import setelah env di-override supaya client.ts membaca URL test
const { sql } = await import("../src/db/client");
const { migrateOrderRules } = await import("../src/db/migrations/order-rules");

await sql.unsafe("DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;");
await sql.file(join(import.meta.dir, "fixtures", "schema.sql"));
await migrateOrderRules(sql);

// Satu client dipakai bersama semua file test; ditutup sekali di akhir run,
// bukan per file (kalau per file, file berikutnya kena CONNECTION_ENDED).
afterAll(async () => {
  await sql.end();
});
