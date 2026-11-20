import { sql } from "../src/db/client";
import { migratePayment } from "../src/db/migrations/payment";

// Jalankan per database: bun scripts/migrate-payment.ts (idempotent)
// SQL mentah ada di komentar src/db/migrations/payment.ts.
await migratePayment(sql);
const cols = await sql`
  SELECT column_name, data_type FROM information_schema.columns
  WHERE table_name = 'orders' AND column_name IN ('payment_ref', 'payment_type') ORDER BY column_name
`;
for (const c of cols) console.log(`+ orders.${c.column_name} (${c.data_type})`);
await sql.end();
