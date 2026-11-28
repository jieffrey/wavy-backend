import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";
import type { Sql, TransactionSql } from "postgres";

// Runner migration SQL (db/migrations/NNN_nama.sql). Dipakai scripts/migrate.ts, scripts/db-reset.ts,
// dan tests/preload.ts supaya skema test = skema produksi.
// Tiap file dicatat di schema_migrations; file yang sudah tercatat tidak dijalankan lagi.

type Db = Sql<any> | TransactionSql<any>;
export type Migration = { version: string; file: string; sql: string };

export const MIGRATIONS_DIR = join(import.meta.dir, "..", "..", "db", "migrations");

export function listMigrations(dir = MIGRATIONS_DIR): Migration[] {
  return readdirSync(dir)
    .filter((f) => /^\d{3}_[a-z0-9_-]+\.sql$/.test(f))
    .sort()
    .map((file) => ({ version: file.slice(0, 3), file, sql: readFileSync(join(dir, file), "utf8") }));
}

export async function ensureMigrationsTable(db: Db) {
  const [{ exists }] = await db<{ exists: boolean }[]>`SELECT to_regclass('public.schema_migrations') IS NOT NULL AS exists`;
  if (exists) return;
  await db`
    CREATE TABLE schema_migrations (
      version     text PRIMARY KEY,
      file        text NOT NULL,
      applied_at  timestamptz NOT NULL DEFAULT now()
    )
  `;
}

export async function pendingMigrations(db: Db, dir = MIGRATIONS_DIR): Promise<Migration[]> {
  await ensureMigrationsTable(db);
  const done = new Set((await db<{ version: string }[]>`SELECT version FROM schema_migrations`).map((r) => r.version));
  return listMigrations(dir).filter((m) => !done.has(m.version));
}

// Jalankan satu migration di koneksi/transaksi `db` yang diberikan pemanggil.
export async function applyMigration(db: Db, m: Migration) {
  await db.unsafe(m.sql);
  await db`INSERT INTO schema_migrations (version, file) VALUES (${m.version}, ${m.file})`;
}

// Semua migration yang belum jalan; tiap file dalam transaksinya sendiri (gagal = file itu di-rollback).
export async function migrate(sql: Sql<any>, dir = MIGRATIONS_DIR): Promise<string[]> {
  const applied: string[] = [];
  for (const m of await pendingMigrations(sql, dir)) {
    await sql.begin((tx) => applyMigration(tx, m));
    applied.push(m.file);
  }
  return applied;
}
