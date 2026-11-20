import { sql } from "../src/db/client";
import { migrateOrderRules } from "../src/db/migrations/order-rules";

// Jalankan per database: bun scripts/migrate-order-rules.ts (idempotent)
const report = await migrateOrderRules(sql);

const cols = await sql`
  SELECT column_name, data_type FROM information_schema.columns
  WHERE table_name = 'events' AND column_name IN ('sales_start_at', 'sales_end_at')
  ORDER BY column_name
`;
for (const c of cols) console.log(`+ events.${c.column_name} (${c.data_type})`);
console.log(`backfill: ${report.pendingWithoutExpiryExpired} order pending tanpa expires_at -> expired`);
console.log(`backfill: ${report.createdAtBackfilled} order created_at NULL diisi`);
await sql.end();
