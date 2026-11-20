import { afterAll, beforeAll, beforeEach, describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, insertPendingOrder, orderStatus, sql } from "./helpers";
import { midtrans, midtransSignature, type MidtransStatus } from "../src/modules/payment/midtrans.client";

// Midtrans di-mock: tidak ada request jaringan ke sandbox.
const SERVER_KEY = "SB-Mid-server-test-key";
const original = { ...midtrans };
let snapCalls: { orderId: string; grossAmount: number; expiryMinutes: number }[] = [];
let statusReply: MidtransStatus | null = null;

beforeAll(() => {
  process.env.MIDTRANS_SERVER_KEY = SERVER_KEY;
  midtrans.createSnapTransaction = async (req) => {
    snapCalls.push(req);
    return { token: `tok-${req.orderId}`, redirect_url: `https://app.sandbox.midtrans.com/snap/v4/redirection/${req.orderId}` };
  };
  midtrans.getStatus = async () => statusReply;
});

afterAll(() => {
  Object.assign(midtrans, original);
  delete process.env.MIDTRANS_SERVER_KEY;
});

beforeEach(() => {
  snapCalls = [];
  statusReply = null;
});

const notif = (orderId: string, transaction_status: string, extra: Partial<MidtransStatus> = {}) => {
  const status_code = transaction_status === "settlement" || transaction_status === "capture" ? "200" : "202";
  const gross_amount = "200000.00";
  return {
    order_id: orderId,
    status_code,
    gross_amount,
    transaction_status,
    payment_type: "bank_transfer",
    signature_key: midtransSignature(orderId, status_code, gross_amount, SERVER_KEY),
    ...extra,
  };
};

async function pendingOrder(qty = 2, expiresInMinutes = 15) {
  const ev = await createEventWithCategory({ quota: 5 });
  const cust = await createCustomer();
  const id = await insertPendingOrder(cust.id, ev.eventId, ev.categoryId, qty, expiresInMinutes);
  return { ...ev, cust, id };
}

async function payRef(o: Awaited<ReturnType<typeof pendingOrder>>) {
  const res = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
  expect(res.status).toBe(200);
  const [row] = await sql<{ payment_ref: string }[]>`SELECT payment_ref FROM orders WHERE id = ${o.id}`;
  return row.payment_ref;
}

describe("POST /orders/:id/pay", () => {
  test("membuat transaksi Snap dengan order_id unik per percobaan dan gross_amount = total_price", async () => {
    const o = await pendingOrder(2, 15);
    const a = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
    const b = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
    expect(a.status).toBe(200);
    expect(a.body.token).toStartWith("tok-");
    expect(a.body.redirect_url).toContain("sandbox");
    expect(snapCalls).toHaveLength(2);
    expect(snapCalls[0].orderId).not.toBe(snapCalls[1].orderId);
    expect(snapCalls[0].grossAmount).toBe(200000);
    expect(snapCalls[0].expiryMinutes).toBeGreaterThanOrEqual(13);
    expect(snapCalls[0].expiryMinutes).toBeLessThanOrEqual(15);
    expect(b.status).toBe(200);
  });

  test("tolak order yang sudah expired", async () => {
    const o = await pendingOrder(1, -1);
    const res = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("ORDER_EXPIRED");
    expect(snapCalls).toHaveLength(0);
  });

  test("tolak order yang bukan pending", async () => {
    const o = await pendingOrder(1);
    await sql`UPDATE orders SET status = 'paid' WHERE id = ${o.id}`;
    const res = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("ORDER_NOT_PENDING");
  });

  test("order milik customer lain -> 404", async () => {
    const o = await pendingOrder(1);
    const other = await createCustomer();
    const res = await call("POST", `/orders/${o.id}/pay`, other.token);
    expect(res.status).toBe(404);
  });

  test("tanpa MIDTRANS_SERVER_KEY -> 503 PAYMENT_NOT_CONFIGURED", async () => {
    const o = await pendingOrder(1);
    delete process.env.MIDTRANS_SERVER_KEY;
    const res = await call("POST", `/orders/${o.id}/pay`, o.cust.token);
    process.env.MIDTRANS_SERVER_KEY = SERVER_KEY;
    expect(res.status).toBe(503);
    expect(res.body.error.code).toBe("PAYMENT_NOT_CONFIGURED");
  });
});

describe("POST /payments/midtrans/notification", () => {
  test("signature tidak valid ditolak dan order tidak berubah", async () => {
    const o = await pendingOrder(2);
    const ref = await payRef(o);
    const res = await call("POST", "/payments/midtrans/notification", undefined, {
      ...notif(ref, "settlement"),
      signature_key: "0".repeat(128),
    });
    expect(res.status).toBe(403);
    expect(res.body.error.code).toBe("INVALID_SIGNATURE");
    expect(await orderStatus(o.id)).toBe("pending_payment");
  });

  test("settlement -> paid, paid_at terisi, sold naik, tiket terbit (sama seperti approve EO)", async () => {
    const o = await pendingOrder(2);
    const ref = await payRef(o);
    const res = await call("POST", "/payments/midtrans/notification", undefined, notif(ref, "settlement"));
    expect(res.status).toBe(200);
    expect(res.body.outcome).toBe("paid");
    const [order] = await sql`SELECT status, paid_at, payment_ref, payment_type FROM orders WHERE id = ${o.id}`;
    expect(order.status).toBe("paid");
    expect(order.paid_at).not.toBeNull();
    expect(order.payment_ref).toBe(ref);
    expect(order.payment_type).toBe("bank_transfer");
    const [cat] = await sql`SELECT sold FROM ticket_categories WHERE id = ${o.categoryId}`;
    expect(Number(cat.sold)).toBe(2);
    const [t] = await sql`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${o.id}`;
    expect(t.n).toBe(2);
  });

  test("notifikasi ganda idempoten: tiket tidak terbit dua kali", async () => {
    const o = await pendingOrder(2);
    const ref = await payRef(o);
    const body = notif(ref, "settlement");
    await call("POST", "/payments/midtrans/notification", undefined, body);
    const again = await call("POST", "/payments/midtrans/notification", undefined, body);
    const capture = await call("POST", "/payments/midtrans/notification", undefined, notif(ref, "capture", { fraud_status: "accept" }));
    expect(again.status).toBe(200);
    expect(again.body.outcome).toBe("paid");
    expect(capture.body.outcome).toBe("paid");
    const [cat] = await sql`SELECT sold FROM ticket_categories WHERE id = ${o.categoryId}`;
    expect(Number(cat.sold)).toBe(2);
    const [t] = await sql`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${o.id}`;
    expect(t.n).toBe(2);
  });

  test("capture dengan fraud_status challenge tetap pending", async () => {
    const o = await pendingOrder(1);
    const ref = await payRef(o);
    const res = await call("POST", "/payments/midtrans/notification", undefined, notif(ref, "capture", { fraud_status: "challenge" }));
    expect(res.body.outcome).toBe("pending");
    expect(await orderStatus(o.id)).toBe("pending_payment");
  });

  test("expire -> order expired dan kuota lepas", async () => {
    const o = await pendingOrder(3);
    const ref = await payRef(o);
    const before = await call("GET", `/concerts/${o.eventId}`);
    const remaining = (b: any) => b.ticket_categories.find((c: any) => c.id === o.categoryId).remaining;
    expect(remaining(before.body)).toBe(2);
    const res = await call("POST", "/payments/midtrans/notification", undefined, notif(ref, "expire"));
    expect(res.body.outcome).toBe("expired");
    expect(await orderStatus(o.id)).toBe("expired");
    const after = await call("GET", `/concerts/${o.eventId}`);
    expect(remaining(after.body)).toBe(5);
    // settlement yang datang terlambat tidak menghidupkan order expired
    const late = await call("POST", "/payments/midtrans/notification", undefined, notif(ref, "settlement"));
    expect(late.body.outcome).toBe("expired");
    expect(await orderStatus(o.id)).toBe("expired");
  });

  test("cancel/deny dari percobaan lama tidak membatalkan percobaan baru", async () => {
    const o = await pendingOrder(1);
    const oldRef = await payRef(o);
    await payRef(o);
    const res = await call("POST", "/payments/midtrans/notification", undefined, notif(oldRef, "cancel"));
    expect(res.body.outcome).toBe("pending");
    expect(await orderStatus(o.id)).toBe("pending_payment");
  });
});

describe("GET /orders/:id/payment-status", () => {
  test("cek status ke Midtrans lalu lunasi order (tanpa webhook)", async () => {
    const o = await pendingOrder(1);
    const ref = await payRef(o);
    statusReply = { ...notif(ref, "settlement") };
    const res = await call("GET", `/orders/${o.id}/payment-status`, o.cust.token);
    expect(res.status).toBe(200);
    expect(res.body).toEqual({ status: "paid", outcome: "paid" });
    const [t] = await sql`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${o.id}`;
    expect(t.n).toBe(1);
  });

  test("transaksi belum ada di Midtrans -> tetap pending", async () => {
    const o = await pendingOrder(1);
    await payRef(o);
    statusReply = null;
    const res = await call("GET", `/orders/${o.id}/payment-status`, o.cust.token);
    expect(res.body).toEqual({ status: "pending_payment", outcome: "pending" });
  });

  test("status expire dari Midtrans -> order expired", async () => {
    const o = await pendingOrder(1);
    const ref = await payRef(o);
    statusReply = { ...notif(ref, "expire") };
    const res = await call("GET", `/orders/${o.id}/payment-status`, o.cust.token);
    expect(res.body.status).toBe("expired");
  });
});
