import type { Sql } from "postgres";

// Kolom pembayaran Midtrans di orders. Idempotent.
//
// SQL mentah (setara):
//   ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_ref text;   -- order_id Midtrans percobaan terakhir
//   ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_type text;  -- payment_type Midtrans (bank_transfer, qris, ...)
//   CREATE INDEX IF NOT EXISTS idx_orders_payment_ref ON orders (payment_ref);
export async function migratePayment(sql: Sql<any>) {
  await sql`ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_ref text`;
  await sql`ALTER TABLE orders ADD COLUMN IF NOT EXISTS payment_type text`;
  await sql`CREATE INDEX IF NOT EXISTS idx_orders_payment_ref ON orders (payment_ref)`;
}
