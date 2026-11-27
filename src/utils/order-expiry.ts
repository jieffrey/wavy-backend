import type { Sql, TransactionSql } from "postgres";

// PRD §4.4 — lazy expiry: order pending_payment yang melewati expires_at diubah
// menjadi 'expired' saat order disentuh (dibaca / dihitung kuotanya), tanpa cron.
// Order expired tidak lagi dihitung sebagai kuota terpakai.

type Db = Sql<any> | TransactionSql<any>;

export const expireOrder = (db: Db, orderId: number) => db`
  UPDATE orders SET status = 'expired'
  WHERE id = ${orderId} AND status = 'pending_payment' AND expires_at <= now()
`;

export const expireByCategory = (db: Db, categoryId: number) => db`
  UPDATE orders SET status = 'expired'
  WHERE ticket_category_id = ${categoryId} AND status = 'pending_payment' AND expires_at <= now()
`;

export const expireByCustomer = (db: Db, customerId: number) => db`
  UPDATE orders SET status = 'expired'
  WHERE customer_id = ${customerId} AND status = 'pending_payment' AND expires_at <= now()
`;

export const expireByEvent = (db: Db, eventId: number) => db`
  UPDATE orders SET status = 'expired'
  WHERE event_id = ${eventId} AND status = 'pending_payment' AND expires_at <= now()
`;

// dashboard admin: hitungan per status harus melihat order kedaluwarsa sebagai expired
export const expireAll = (db: Db) => db`
  UPDATE orders SET status = 'expired'
  WHERE status = 'pending_payment' AND expires_at <= now()
`;
