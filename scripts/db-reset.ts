// Reset database ke skema v2 (db/migrations/*.sql) dan KOSONGKAN semua data kecuali akun admin.
// Menulis ke database di DATABASE_URL (.env = Neon). Tidak pernah dipanggil test atau script lain.
//
//   bun scripts/db-reset.ts                      -> dry-run: tampilkan target, jumlah baris, admin yang dipertahankan
//   bun scripts/db-reset.ts --confirm=<nama-db>  -> jalankan (nama harus sama persis dengan database di DATABASE_URL)
//
// Langkah (satu transaksi; error apa pun = rollback, database tidak berubah):
//   1. salin baris admins (id, name, email, password hash, created_at) ke memori + backup/admins-<waktu>.json
//   2. DROP SCHEMA public CASCADE; CREATE SCHEMA public
//   3. jalankan semua db/migrations/*.sql
//   4. kembalikan admin dengan id yang sama, majukan sequence id
//   5. verifikasi: semua tabel 0 baris kecuali admins & schema_migrations
import { mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { sql } from "../src/db/client";
import { applyMigration, ensureMigrationsTable, listMigrations } from "../src/db/migrate";

type AdminRow = { id: number; name: string; email: string; password: string; created_at: Date };

const url = new URL(process.env.DATABASE_URL!);
const dbName = decodeURIComponent(url.pathname.replace(/^\//, ""));
const confirmArg = process.argv.find((a) => a.startsWith("--confirm="))?.slice("--confirm=".length);

async function tableCounts(): Promise<{ table: string; rows: number }[]> {
  const tables = await sql<{ table_name: string }[]>`
    SELECT table_name FROM information_schema.tables
    WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
    ORDER BY table_name
  `;
  const out: { table: string; rows: number }[] = [];
  for (const { table_name } of tables) {
    const [{ n }] = await sql.unsafe<{ n: number }[]>(`SELECT COUNT(*)::int AS n FROM public."${table_name.replace(/"/g, '""')}"`);
    out.push({ table: table_name, rows: n });
  }
  return out;
}

async function readAdmins(): Promise<AdminRow[]> {
  const [exists] = await sql<{ ok: boolean }[]>`SELECT to_regclass('public.admins') IS NOT NULL AS ok`;
  if (!exists.ok) return [];
  return sql<AdminRow[]>`SELECT id, name, email, password, created_at FROM public.admins ORDER BY id`;
}

function printCounts(title: string, counts: { table: string; rows: number }[]) {
  console.log(title);
  if (!counts.length) console.log("  (tidak ada tabel)");
  for (const c of counts) console.log(`  ${c.table.padEnd(24)} ${c.rows}`);
}

async function main() {
  console.log(`Target : ${url.hostname} / database "${dbName}"`);
  const before = await tableCounts();
  const admins = await readAdmins();
  printCounts("Jumlah baris sekarang:", before);
  console.log(`Admin yang dipertahankan (${admins.length}): ${admins.map((a) => a.email).join(", ") || "-"}`);
  console.log(`Migration yang akan dijalankan: ${listMigrations().map((m) => m.file).join(", ")}`);

  if (confirmArg === undefined) {
    console.log(`\nDry-run, tidak ada yang diubah. Jalankan ulang dengan --confirm=${dbName} untuk reset.`);
    return;
  }
  if (confirmArg !== dbName) {
    console.error(`\n--confirm="${confirmArg}" tidak sama dengan nama database "${dbName}". Dibatalkan.`);
    process.exitCode = 2;
    return;
  }
  if (!admins.length) console.warn("\nPERINGATAN: tidak ada admin; setelah reset buat dengan scripts/create-admin.ts.");

  // backup admin ke file lokal (folder backup/ di-.gitignore) sebelum apa pun dihapus
  const dir = join(import.meta.dir, "..", "backup");
  mkdirSync(dir, { recursive: true });
  const backupFile = join(dir, `admins-${new Date().toISOString().replace(/[:.]/g, "-")}.json`);
  writeFileSync(backupFile, JSON.stringify(admins, null, 2));
  console.log(`\nBackup admin: ${backupFile}`);

  await sql.begin(async (tx) => {
    await tx.unsafe("SET LOCAL client_min_messages = warning"); // tanpa NOTICE "drop cascades to ..."
    await tx.unsafe("DROP SCHEMA public CASCADE");
    await tx.unsafe("CREATE SCHEMA public");
    await ensureMigrationsTable(tx);
    for (const m of listMigrations()) await applyMigration(tx, m);
    for (const a of admins) {
      await tx`
        INSERT INTO admins (id, name, email, password, created_at)
        OVERRIDING SYSTEM VALUE
        VALUES (${a.id}, ${a.name}, ${a.email}, ${a.password}, ${a.created_at})
      `;
    }
    await tx`SELECT setval(pg_get_serial_sequence('admins', 'id'), GREATEST((SELECT MAX(id) FROM admins), 1))`;
  });

  const after = await tableCounts();
  printCounts("\nSetelah reset:", after);
  const dirty = after.filter((c) => c.rows > 0 && !["admins", "schema_migrations"].includes(c.table));
  const [{ n: adminCount }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM admins`;
  if (dirty.length || adminCount !== admins.length) {
    console.error(`Verifikasi GAGAL: ${dirty.map((d) => d.table).join(", ") || `admin ${adminCount}/${admins.length}`}`);
    process.exitCode = 1;
    return;
  }
  console.log(`Selesai: database kosong, ${adminCount} admin dipertahankan.`);
}

try {
  await main();
} catch (err) {
  console.error("db-reset gagal (transaksi di-rollback):", err instanceof Error ? err.message : err);
  process.exitCode = 1;
} finally {
  await sql.end();
}
