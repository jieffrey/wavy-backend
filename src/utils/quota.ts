import type { Sql, TransactionSql } from "postgres";

type Db = Sql<any> | TransactionSql<any>;

// Jumlah tiket di order pending_payment yang belum expired (masih mereservasi kuota).
// Fragment SQL: tabel ticket_categories WAJIB ber-alias `tc` di query pemakainya.
export const activePendingSql = (db: Db) => db`
  COALESCE((
    SELECT SUM(o.quantity) FROM orders o
    WHERE o.ticket_category_id = tc.id
      AND o.status = 'pending_payment'
      AND o.expires_at > now()
  ), 0)::int
`;

// PRD §4.3 — satu-satunya rumus sisa kuota per kategori tiket:
//   quota - sold (tiket paid; dipelihara approve/refund) - order pending yang belum expired
// Dipakai POST /orders (cek kuota), daftar konser, dan detail konser.
// Fragment SQL: tabel ticket_categories WAJIB ber-alias `tc` di query pemakainya.
// Hasil tidak pernah negatif (data seed bisa punya sold > quota).
export const remainingQuotaSql = (db: Db) => db`
  GREATEST(tc.quota - tc.sold - ${activePendingSql(db)}, 0)::int
`;
