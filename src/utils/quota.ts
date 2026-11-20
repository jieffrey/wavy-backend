import type { Sql, TransactionSql } from "postgres";

type Db = Sql<any> | TransactionSql<any>;

// PRD §4.3 — satu-satunya rumus sisa kuota per kategori tiket:
//   quota - sold (tiket paid; dipelihara approve/refund) - order pending yang belum expired
// Dipakai POST /orders (cek kuota), daftar konser, dan detail konser.
// Fragment SQL: tabel ticket_categories WAJIB ber-alias `tc` di query pemakainya.
// Hasil tidak pernah negatif (data seed bisa punya sold > quota).
export const remainingQuotaSql = (db: Db) => db`
  GREATEST(
    tc.quota - tc.sold - COALESCE((
      SELECT SUM(o.quantity) FROM orders o
      WHERE o.ticket_category_id = tc.id
        AND o.status = 'pending_payment'
        AND o.expires_at > now()
    ), 0),
    0
  )::int
`;
