import type { Sql } from "postgres";

export type PaidAtMigrationReport = { paidAtBackfilled: number };

// Waktu order menjadi paid (dipakai dashboard & grafik penjualan organizer).
// Idempotent: aman dijalankan berulang (run kedua melaporkan 0 baris).
//
// SQL mentah (setara):
//   ALTER TABLE orders ADD COLUMN IF NOT EXISTS paid_at timestamptz;
//   UPDATE orders SET paid_at = created_at WHERE status = 'paid' AND paid_at IS NULL;
//   CREATE INDEX IF NOT EXISTS idx_orders_paid_at ON orders (paid_at) WHERE status = 'paid';
export async function migratePaidAt(sql: Sql<any>): Promise<PaidAtMigrationReport> {
  await sql`ALTER TABLE orders ADD COLUMN IF NOT EXISTS paid_at timestamptz`;
  // order paid lama tidak mencatat waktu bayar -> pakai waktu order dibuat
  const backfilled = await sql`
    UPDATE orders SET paid_at = created_at
    WHERE status = 'paid' AND paid_at IS NULL
  `;
  await sql`CREATE INDEX IF NOT EXISTS idx_orders_paid_at ON orders (paid_at) WHERE status = 'paid'`;
  return { paidAtBackfilled: backfilled.count };
}
