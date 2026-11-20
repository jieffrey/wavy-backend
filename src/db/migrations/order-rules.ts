import type { Sql } from "postgres";

// Fase 1 (PRD §4): tenggat penjualan event + index untuk hitung kuota order.
// Idempotent: aman dijalankan berulang.
export async function migrateOrderRules(sql: Sql<any>) {
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
}
