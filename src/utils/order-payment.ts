import type { TransactionSql } from "postgres";
import { signTicket } from "../modules/ticket/ticket.service";

type PayableOrder = {
  id: number;
  event_id: number;
  ticket_category_id: number;
  customer_id: number;
  quantity: number;
};

// Satu-satunya jalur order pending_payment -> paid (PRD §4): dipakai approve manual EO
// dan pelunasan Midtrans. Pemanggil WAJIB sudah mengunci baris order (FOR UPDATE)
// di transaksi `tx` dan memastikan status masih pending_payment.
export async function markOrderPaid(
  tx: TransactionSql<any>,
  order: PayableOrder,
  payment?: { ref: string; type: string | null }
) {
  const [event] = await tx<{ date: Date }[]>`SELECT date FROM events WHERE id = ${order.event_id}`;
  const exp = Math.floor(new Date(event.date).getTime() / 1000);
  if (payment) {
    await tx`UPDATE orders SET status = 'paid', paid_at = now(), payment_ref = ${payment.ref}, payment_type = ${payment.type}
             WHERE id = ${order.id}`;
  } else {
    await tx`UPDATE orders SET status = 'paid', paid_at = now() WHERE id = ${order.id}`;
  }
  await tx`UPDATE ticket_categories SET sold = sold + ${order.quantity} WHERE id = ${order.ticket_category_id}`;
  for (let i = 0; i < order.quantity; i++) {
    await tx`INSERT INTO tickets (order_id, qr_code, owner_id)
             VALUES (${order.id}, ${signTicket({ uid: crypto.randomUUID(), event_id: order.event_id, exp })}, ${order.customer_id})`;
  }
}
