// Terapkan migration db/migrations/*.sql yang belum tercatat di schema_migrations.
// Menulis ke database di DATABASE_URL (.env = Neon). Aman dijalankan berulang.
//
//   bun scripts/migrate.ts            -> jalankan yang tertunda
//   bun scripts/migrate.ts --status   -> hanya tampilkan daftar tertunda
import { sql } from "../src/db/client";
import { migrate, pendingMigrations } from "../src/db/migrate";

const host = new URL(process.env.DATABASE_URL!).hostname;

try {
  if (process.argv.includes("--status")) {
    const pending = await pendingMigrations(sql);
    console.log(`${host}: ${pending.length} migration tertunda${pending.length ? ":" : ""}`);
    for (const m of pending) console.log(`  - ${m.file}`);
  } else {
    const applied = await migrate(sql);
    console.log(applied.length ? `${host}: diterapkan ${applied.join(", ")}` : `${host}: skema sudah terbaru`);
  }
} catch (err) {
  console.error("migrate gagal:", err instanceof Error ? err.message : err);
  process.exitCode = 1;
} finally {
  await sql.end();
}
