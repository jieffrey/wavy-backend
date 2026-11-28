import { afterAll, beforeAll, beforeEach, describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, insertPendingOrder, orderBody, orderStatus, sql } from "./helpers";
import { midtrans, midtransSignature, type MidtransStatus } from "../src/modules/payment/midtrans.client";

// POST /orders/:id/cancel — customer membatalkan order pending miliknya. Midtrans di-mock (tanpa jaringan).
const original = { ...midtrans };
let statusReply: MidtransStatus | null = null;
let statusError = false;
let expired: string[] = [];

beforeAll(() => {
  midtrans.getStatus = async () => {
    if (statusError) throw new (await import("../src/modules/payment/midtrans.client")).MidtransError("status 500");
    return statusReply;
  };
  midtrans.expireTransaction = async (ref) => {
    expired.push(ref);
  };
});

afterAll(() => {
  Object.assign(midtrans, original);
  delete process.env.MIDTRANS_SERVER_KEY;
});

beforeEach(() => {
  statusReply = null;
  statusError = false;
  expired = [];
  delete process.env.MIDTRANS_SERVER_KEY;
});

async function pending(qty = 2, quota = 3, expiresInMinutes = 15) {
  const ev = await createEventWithCategory({ quota });
  const cust = await createCustomer();
  const id = await insertPendingOrder(cust.id, ev.eventId, ev.categoryId, qty, expiresInMinutes);
  return { ...ev, cust, id };
}

const remaining = async (eventId: number, categoryId: number) => {
  const res = await call("GET", `/concerts/${eventId}`);
  return res.body.ticket_categories.find((c: { id: number }) => c.id === categoryId).remaining as number;
};

describe("POST /orders/:id/cancel", () => {
  test("pending -> cancelled, kuota langsung lepas dan bisa dibeli customer lain", async () => {
    const o = await pending(2, 3);
    expect(await remaining(o.eventId, o.categoryId)).toBe(1);

    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("cancelled");
    expect(await orderStatus(o.id)).toBe("cancelled");
    expect(await remaining(o.eventId, o.categoryId)).toBe(3);

    const other = await createCustomer();
    const buy = await call("POST", "/orders", other.token, orderBody(o.eventId, o.categoryId, 3));
    expect(buy.status).toBe(201);
  });

  test("order milik customer lain -> 404, status tidak berubah", async () => {
    const o = await pending(1);
    const other = await createCustomer();
    const res = await call("POST", `/orders/${o.id}/cancel`, other.token);
    expect(res.status).toBe(404);
    expect(await orderStatus(o.id)).toBe("pending_payment");
  });

  test("tanpa login -> 401", async () => {
    const o = await pending(1);
    const res = await call("POST", `/orders/${o.id}/cancel`);
    expect(res.status).toBe(401);
  });

  test("order paid / sudah batal -> 409 ORDER_NOT_PENDING", async () => {
    const o = await pending(1);
    await sql`UPDATE orders SET status = 'paid', paid_at = now() WHERE id = ${o.id}`;
    const paid = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(paid.status).toBe(409);
    expect(paid.body.error.code).toBe("ORDER_NOT_PENDING");
    expect(await orderStatus(o.id)).toBe("paid");

    const c = await pending(1);
    expect((await call("POST", `/orders/${c.id}/cancel`, c.cust.token)).status).toBe(200);
    const again = await call("POST", `/orders/${c.id}/cancel`, c.cust.token);
    expect(again.status).toBe(409);
    expect(again.body.error.code).toBe("ORDER_NOT_PENDING");
  });

  test("pending yang sudah lewat 15 menit -> 409 ORDER_EXPIRED dan tercatat expired", async () => {
    const o = await pending(1, 3, -1);
    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("ORDER_EXPIRED");
    expect(await orderStatus(o.id)).toBe("expired");
  });

  test("dua batal bersamaan: satu sukses, satu 409; tidak ada error 500", async () => {
    const o = await pending(1);
    const [a, b] = await Promise.all([
      call("POST", `/orders/${o.id}/cancel`, o.cust.token),
      call("POST", `/orders/${o.id}/cancel`, o.cust.token),
    ]);
    expect([a.status, b.status].sort()).toEqual([200, 409]);
    expect(await orderStatus(o.id)).toBe("cancelled");
  });

  test("batal bersamaan dengan approve admin: hasil akhir konsisten (cancelled tanpa tiket, atau paid dengan tiket)", async () => {
    const o = await pending(2, 3);
    const [cancel, approve] = await Promise.all([
      call("POST", `/orders/${o.id}/cancel`, o.cust.token),
      call("POST", `/admin/orders/${o.id}/verify`, o.admin.token, { approve: true }),
    ]);
    expect([cancel.status, approve.status].every((s) => s < 500)).toBe(true);
    const status = await orderStatus(o.id);
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${o.id}`;
    const [{ sold }] = await sql<{ sold: number }[]>`SELECT sold FROM ticket_categories WHERE id = ${o.categoryId}`;
    if (status === "cancelled") {
      expect(n).toBe(0);
      expect(Number(sold)).toBe(0);
    } else {
      expect(status).toBe("paid");
      expect(n).toBe(2);
      expect(Number(sold)).toBe(2);
    }
  });

  test("admin melihat status cancelled di daftar order dan di order per status", async () => {
    const o = await pending(1);
    await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    const list = await call("GET", `/admin/orders?event_id=${o.eventId}`, o.admin.token);
    expect(list.status).toBe(200);
    const row = (list.body as { id: number; status: string }[]).find((r) => r.id === o.id);
    expect(row?.status).toBe("cancelled");
    const stats = await call("GET", "/admin/stats", o.admin.token);
    expect(stats.body.orders_by_status.cancelled).toBeGreaterThan(0);
  });
});

describe("POST /orders/:id/cancel dengan Midtrans", () => {
  const ref = (id: number) => `WAVY-${id}-test1`;
  const st = (id: number, transaction_status: string): MidtransStatus => ({
    order_id: ref(id),
    status_code: transaction_status === "settlement" ? "200" : "201",
    gross_amount: "100000.00",
    transaction_status,
    payment_type: "bank_transfer",
  });

  async function withRef() {
    process.env.MIDTRANS_SERVER_KEY = "SB-Mid-server-test-key";
    const o = await pending(1);
    await sql`UPDATE orders SET payment_ref = ${ref(o.id)} WHERE id = ${o.id}`;
    return o;
  }

  test("transaksi Midtrans masih pending -> ditutup (expire) lalu order cancelled", async () => {
    const o = await withRef();
    statusReply = st(o.id, "pending");
    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(200);
    expect(expired).toEqual([ref(o.id)]);
    expect(await orderStatus(o.id)).toBe("cancelled");
  });

  test("Snap dibuka tapi belum pilih metode (status 404 di Midtrans) -> cancelled tanpa expire", async () => {
    const o = await withRef();
    statusReply = null;
    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(200);
    expect(expired).toEqual([]);
  });

  test("ternyata sudah lunas di Midtrans -> 409, order jadi paid dan tiket terbit", async () => {
    const o = await withRef();
    statusReply = st(o.id, "settlement");
    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("ORDER_NOT_PENDING");
    expect(await orderStatus(o.id)).toBe("paid");
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${o.id}`;
    expect(n).toBe(1);
  });

  test("notifikasi pending untuk order yang sudah batal (Snap masih terbuka) -> transaksi ditutup, order tetap cancelled", async () => {
    const o = await withRef();
    await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expired = [];
    const body = st(o.id, "pending");
    const signature_key = midtransSignature(body.order_id, body.status_code, body.gross_amount, "SB-Mid-server-test-key");
    const res = await call("POST", "/payments/midtrans/notification", undefined, { ...body, signature_key });
    expect(res.status).toBe(200);
    expect(expired).toEqual([ref(o.id)]);
    expect(await orderStatus(o.id)).toBe("cancelled");
  });

  test("Midtrans tidak bisa dihubungi -> 502, order tetap pending", async () => {
    const o = await withRef();
    statusError = true;
    const res = await call("POST", `/orders/${o.id}/cancel`, o.cust.token);
    expect(res.status).toBe(502);
    expect(res.body.error.code).toBe("PAYMENT_GATEWAY_ERROR");
    expect(await orderStatus(o.id)).toBe("pending_payment");
  });
});
