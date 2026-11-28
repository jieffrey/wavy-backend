import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";
import { expireOrder } from "../../utils/order-expiry";
import { markOrderPaid } from "../../utils/order-payment";
import { midtrans, midtransConfig, midtransSignature, MidtransError, type MidtransStatus } from "./midtrans.client";

type OrderRow = {
  id: number;
  customer_id: number;
  event_id: number;
  ticket_category_id: number;
  quantity: number;
  total_price: string;
  status: string;
  expires_at: Date;
  full_name: string;
  email: string;
  phone: string;
  payment_ref: string | null;
};

export type PaymentOutcome = "paid" | "expired" | "pending" | "ignored";

// order_id Midtrans: unik per percobaan bayar, id order Wavy bisa dibaca balik
export const paymentRef = (orderId: number) =>
  `WAVY-${orderId}-${Date.now().toString(36)}${Math.random().toString(36).slice(2, 5)}`;
export const orderIdFromRef = (ref: string): number | null => {
  const m = /^WAVY-(\d+)-[a-z0-9]+$/.exec(ref);
  return m ? Number(m[1]) : null;
};

const FAILED = new Set(["expire", "cancel", "deny"]);

export const isSettled = (st: MidtransStatus) =>
  st.transaction_status === "settlement" ||
  (st.transaction_status === "capture" && (st.fraud_status ?? "accept") === "accept");

// Terapkan status transaksi Midtrans ke order. Idempoten: order yang sudah tidak
// pending_payment tidak diubah lagi, jadi notifikasi ganda / cek status berulang aman.
export async function applyMidtransStatus(st: MidtransStatus): Promise<PaymentOutcome> {
  const orderId = orderIdFromRef(st.order_id);
  if (!orderId) return "ignored";

  const outcome = await sql.begin(async (tx): Promise<PaymentOutcome | "close"> => {
    await expireOrder(tx, orderId);
    const [order] = await tx<OrderRow[]>`SELECT * FROM orders WHERE id = ${orderId} FOR UPDATE`;
    if (!order) return "ignored";
    if (order.status === "paid") return "paid";
    // order sudah dibatalkan customer, tapi Snap yang masih terbuka sempat membuat transaksi baru:
    // tutup transaksi itu supaya tidak bisa dibayar (dikerjakan di luar transaksi DB, lihat bawah)
    if (order.status === "cancelled" && st.transaction_status === "pending") return "close";
    if (order.status !== "pending_payment") return order.status === "expired" ? "expired" : "ignored";

    if (isSettled(st)) {
      // lunas lewat fungsi yang sama dengan approve manual EO
      await markOrderPaid(tx, order, { ref: st.order_id, type: st.payment_type ?? null });
      return "paid";
    }
    // percobaan lama yang gagal tidak boleh membatalkan percobaan bayar yang lebih baru
    if (FAILED.has(st.transaction_status) && order.payment_ref === st.order_id) {
      await tx`UPDATE orders SET status = 'expired' WHERE id = ${orderId}`;
      return "expired";
    }
    return "pending";
  });
  if (outcome !== "close") return outcome;
  await midtrans.expireTransaction(st.order_id).catch(() => {});
  return "ignored";
}

export const paymentService = {
  async pay(customerId: number, id: number): Promise<Result<{ token: string; redirect_url: string }>> {
    if (!midtransConfig().configured) return fail(503, "payment gateway is not configured", "PAYMENT_NOT_CONFIGURED");

    await expireOrder(sql, id);
    const [order] = await sql<OrderRow[]>`SELECT * FROM orders WHERE id = ${id} AND customer_id = ${customerId}`;
    if (!order) return fail(404, "order not found");
    if (order.status === "expired") return fail(409, "order has expired", "ORDER_EXPIRED");
    if (order.status !== "pending_payment") return fail(409, "order is not pending payment", "ORDER_NOT_PENDING");

    const minutes = Math.floor((new Date(order.expires_at).getTime() - Date.now()) / 60000);
    if (minutes < 1) return fail(409, "order has expired", "ORDER_EXPIRED");

    const ref = paymentRef(order.id);
    try {
      const snap = await midtrans.createSnapTransaction({
        orderId: ref,
        grossAmount: Math.round(Number(order.total_price)),
        expiryMinutes: minutes,
        customer: { first_name: order.full_name, email: order.email, phone: order.phone },
      });
      // payment_ref = percobaan terakhir; status order hanya diubah oleh notifikasi / cek status
      await sql`UPDATE orders SET payment_ref = ${ref} WHERE id = ${order.id} AND status = 'pending_payment'`;
      return ok(snap);
    } catch (err) {
      if (err instanceof MidtransError) return fail(502, err.message, "PAYMENT_GATEWAY_ERROR");
      throw err;
    }
  },

  async notification(body: Partial<MidtransStatus>): Promise<Result<{ outcome: PaymentOutcome }>> {
    const cfg = midtransConfig();
    if (!cfg.configured) return fail(503, "payment gateway is not configured", "PAYMENT_NOT_CONFIGURED");
    const { order_id, status_code, gross_amount, signature_key, transaction_status } = body;
    if (!order_id || !status_code || !gross_amount || !signature_key || !transaction_status) {
      return fail(400, "incomplete notification", "VALIDATION_ERROR");
    }
    if (midtransSignature(order_id, status_code, gross_amount, cfg.serverKey) !== signature_key) {
      return fail(403, "invalid signature", "INVALID_SIGNATURE");
    }
    return ok({ outcome: await applyMidtransStatus(body as MidtransStatus) });
  },

  // Untuk localhost tanpa webhook: tanya Midtrans lalu terapkan logika yang sama.
  async status(customerId: number, id: number): Promise<Result<{ status: string; outcome: PaymentOutcome }>> {
    const [order] = await sql<OrderRow[]>`SELECT * FROM orders WHERE id = ${id} AND customer_id = ${customerId}`;
    if (!order) return fail(404, "order not found");

    let outcome: PaymentOutcome = "ignored";
    if (order.status === "pending_payment" && order.payment_ref && midtransConfig().configured) {
      try {
        const st = await midtrans.getStatus(order.payment_ref);
        outcome = st ? await applyMidtransStatus(st) : "pending";
      } catch (err) {
        if (err instanceof MidtransError) return fail(502, err.message, "PAYMENT_GATEWAY_ERROR");
        throw err;
      }
    }
    await expireOrder(sql, id);
    const [fresh] = await sql<{ status: string }[]>`SELECT status FROM orders WHERE id = ${id}`;
    return ok({ status: fresh.status, outcome });
  },
};
