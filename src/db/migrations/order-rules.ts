import type { Sql } from "postgres";

export type OrderRulesMigrationReport = {
  pendingWithoutExpiryExpired: number;
  createdAtBackfilled: number;
};

// Fase 1 (PRD §4): tenggat penjualan event, index hitung kuota, backfill order lama.
// Idempotent: aman dijalankan berulang (run kedua melaporkan 0 baris).
export async function migrateOrderRules(sql: Sql<any>): Promise<OrderRulesMigrationReport> {
  await sql`
    ALTER TABLE events
      ADD COLUMN IF NOT EXISTS sales_start_at timestamptz,
      ADD COLUMN IF NOT EXISTS sales_end_at timestamptz
  `;
  await sql.unsafe(`
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'events_sales_window_check') THEN
        ALTER TABLE events ADD CONSTRAINT events_sales_window_check
          CHECK (sales_start_at IS NULL OR sales_end_at IS NULL OR sales_end_at > sales_start_at);
      END IF;
    END $$;
  `);
  // hitung kuota pending per kategori di POST /orders
  await sql`CREATE INDEX IF NOT EXISTS idx_orders_category_status ON orders (ticket_category_id, status)`;

  // Backfill order lama (dibuat sebelum createOrder transaksional):
  // 1) pending tanpa expires_at tidak bisa di-lazy-expire -> anggap expired
  const expired = await sql`
    UPDATE orders SET status = 'expired'
    WHERE status = 'pending_payment' AND expires_at IS NULL
  `;
  // 2) created_at dulu tidak pernah diisi; expires_at selalu = waktu buat + 15 menit,
  //    jadi created_at = expires_at - 15 menit. Tanpa expires_at -> waktu migration.
  const backfilled = await sql`
    UPDATE orders SET created_at = COALESCE(expires_at - interval '15 minutes', now())
    WHERE created_at IS NULL
  `;

  return { pendingWithoutExpiryExpired: expired.count, createdAtBackfilled: backfilled.count };
}
