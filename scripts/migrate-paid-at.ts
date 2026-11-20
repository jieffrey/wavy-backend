import { sql } from "../src/db/client";
import { migratePaidAt } from "../src/db/migrations/paid-at";

// Jalankan per database: bun scripts/migrate-paid-at.ts (idempotent)
// SQL mentah ada di komentar src/db/migrations/paid-at.ts.
const report = await migratePaidAt(sql);

const cols = await sql`
  SELECT column_name, data_type FROM information_schema.columns
  WHERE table_name = 'orders' AND column_name = 'paid_at'
`;
for (const c of cols) console.log(`+ orders.${c.column_name} (${c.data_type})`);
console.log(`backfill: ${report.paidAtBackfilled} order paid tanpa paid_at diisi created_at`);
await sql.end();
