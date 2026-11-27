import { describe, expect, test } from "bun:test";
import { signTicket } from "../src/modules/ticket/ticket.service";
import {
  call,
  createCustomer,
  createEventWithCategory,
  createAdmin,
  insertPendingOrder,
  sql,
} from "./helpers";

const errorOf = (code: string) => ({ error: { code, message: expect.any(String) } });

const categoryBody = (quota: number, extra: Record<string, unknown> = {}) => ({
  name: "Reguler",
  price: 100000,
  quota,
  ...extra,
});

const inDays = (d: number) => new Date(Date.now() + d * 86_400_000).toISOString();

const eventBody = (extra: Record<string, unknown> = {}) => ({
  title: "Konser Baru",
  artist_id: 0,
  category: "pop",
  venue: "Venue",
  date: inDays(30),
  poster_url: "",
  description: "",
  ...extra,
});

// tiket paid + QR untuk event; expSeconds negatif = QR sudah kedaluwarsa
async function insertTicket(eventId: number, categoryId: number, expSeconds = 3600) {
  const customer = await createCustomer();
  const [order] = await sql<{ id: number }[]>`
    INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at, paid_at)
    VALUES (${customer.id}, ${eventId}, ${categoryId}, 1, 100000, 'paid', now(), now(), now())
    RETURNING id
  `;
  const qr = signTicket({
    uid: crypto.randomUUID(),
    event_id: eventId,
    exp: Math.floor(Date.now() / 1000) + expSeconds,
  });
  const [ticket] = await sql<{ id: number }[]>`
    INSERT INTO tickets (order_id, qr_code, owner_id) VALUES (${order.id}, ${qr}, ${customer.id}) RETURNING id
  `;
  return { qr, ticketId: ticket.id, orderId: order.id };
}

// ---------------------------------------------------------------------------
// 1. Update kategori: kuota tidak boleh di bawah reserved (sold + pending aktif)
// ---------------------------------------------------------------------------
describe("PUT /admin/ticket-categories/:id", () => {
  test("quota < sold + pending aktif -> 400 QUOTA_BELOW_RESERVED, kuota tidak berubah", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ quota: 10, sold: 3 });
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 2, 10);

    const res = await call("PUT", `/admin/ticket-categories/${categoryId}`, admin.token, categoryBody(4));
    expect(res.status).toBe(400);
    expect(res.body).toEqual(errorOf("QUOTA_BELOW_RESERVED"));
    const [{ quota }] = await sql<{ quota: number }[]>`SELECT quota FROM ticket_categories WHERE id = ${categoryId}`;
    expect(quota).toBe(10);
  });

  test("quota = reserved boleh; pending expired tidak dihitung", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ quota: 10, sold: 3 });
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 2, 10);
    await insertPendingOrder(customer.id, eventId, categoryId, 4, -1);

    const res = await call("PUT", `/admin/ticket-categories/${categoryId}`, admin.token, categoryBody(5));
    expect(res.status).toBe(200);
    expect(res.body.quota).toBe(5);
  });

  test("harga negatif / nama kosong -> 400 VALIDATION_ERROR", async () => {
    const { admin, categoryId } = await createEventWithCategory();
    const neg = await call("PUT", `/admin/ticket-categories/${categoryId}`, admin.token, categoryBody(10, { price: -1 }));
    expect(neg.status).toBe(400);
    expect(neg.body).toEqual(errorOf("VALIDATION_ERROR"));
    const empty = await call("PUT", `/admin/ticket-categories/${categoryId}`, admin.token, categoryBody(10, { name: "  " }));
    expect(empty.status).toBe(400);
    expect(empty.body).toEqual(errorOf("VALIDATION_ERROR"));
  });

  test("kategori tidak ada -> 404; token customer -> 401", async () => {
    const { categoryId } = await createEventWithCategory();
    const admin = await createAdmin();
    const res = await call("PUT", "/admin/ticket-categories/999999999", admin.token, categoryBody(10));
    expect(res.status).toBe(404);
    const customer = await createCustomer();
    expect((await call("PUT", `/admin/ticket-categories/${categoryId}`, customer.token, categoryBody(10))).status).toBe(401);
  });
});

// ---------------------------------------------------------------------------
// 2. Hapus kategori / event yang sudah punya order
// ---------------------------------------------------------------------------
describe("DELETE kategori & event", () => {
  test("kategori dengan order (status apa pun) -> 409 CATEGORY_HAS_ORDERS", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 1, -1);

    const res = await call("DELETE", `/admin/ticket-categories/${categoryId}`, admin.token);
    expect(res.status).toBe(409);
    expect(res.body).toEqual(errorOf("CATEGORY_HAS_ORDERS"));
  });

  test("kategori tanpa order -> 200", async () => {
    const { admin, categoryId } = await createEventWithCategory();
    const res = await call("DELETE", `/admin/ticket-categories/${categoryId}`, admin.token);
    expect(res.status).toBe(200);
  });

  test("event dengan order -> 409 EVENT_HAS_ORDERS", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 1, 10);

    const res = await call("DELETE", `/admin/events/${eventId}`, admin.token);
    expect(res.status).toBe(409);
    expect(res.body).toEqual(errorOf("EVENT_HAS_ORDERS"));
  });

  test("event tanpa order (dengan kategori, notify-me, review) -> 200, bukan 500 FK", async () => {
    const { admin, eventId } = await createEventWithCategory();
    const customer = await createCustomer();
    await sql`INSERT INTO notify_requests (customer_id, event_id) VALUES (${customer.id}, ${eventId})`;
    await sql`INSERT INTO reviews (customer_id, event_id, rating, comment) VALUES (${customer.id}, ${eventId}, 5, 'mantap')`;

    const res = await call("DELETE", `/admin/events/${eventId}`, admin.token);
    expect(res.status).toBe(200);
    const rows = await sql`SELECT id FROM events WHERE id = ${eventId}`;
    expect(rows.length).toBe(0);
  });
});

// ---------------------------------------------------------------------------
// 3. Scan QR
// ---------------------------------------------------------------------------
describe("POST /admin/scan/validate", () => {
  test("scan valid -> 200 dengan category_name; scan kedua -> 409 ALREADY_SCANNED", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const { qr, ticketId, orderId } = await insertTicket(eventId, categoryId);

    const res = await call("POST", "/admin/scan/validate", admin.token, { qr_code: qr });
    expect(res.status).toBe(200);
    expect(res.body.message).toBe("ticket valid");
    expect(res.body.ticket).toMatchObject({
      id: ticketId,
      order_id: orderId,
      event_id: eventId,
      title: "Konser Test",
      venue: "Venue",
      category_name: "Reguler",
    });

    const again = await call("POST", "/admin/scan/validate", admin.token, { qr_code: qr });
    expect(again.status).toBe(409);
    expect(again.body).toEqual(errorOf("ALREADY_SCANNED"));
  });

  test("dua scan bersamaan -> tepat satu 200, satu 409", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const { qr } = await insertTicket(eventId, categoryId);
    const results = await Promise.all(
      Array.from({ length: 4 }, () => call("POST", "/admin/scan/validate", admin.token, { qr_code: qr }))
    );
    expect(results.filter((r) => r.status === 200).length).toBe(1);
    expect(results.filter((r) => r.status === 409).length).toBe(3);
  });

  test("QR bukan JWT -> 400 INVALID_QR; QR kedaluwarsa -> 400 QR_EXPIRED", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const invalid = await call("POST", "/admin/scan/validate", admin.token, { qr_code: "bukan-jwt" });
    expect(invalid.status).toBe(400);
    expect(invalid.body).toEqual(errorOf("INVALID_QR"));

    const { qr } = await insertTicket(eventId, categoryId, -60);
    const expired = await call("POST", "/admin/scan/validate", admin.token, { qr_code: qr });
    expect(expired.status).toBe(400);
    expect(expired.body).toEqual(errorOf("QR_EXPIRED"));
  });

  test("QR valid tapi tiket tidak ada -> 404 TICKET_NOT_FOUND", async () => {
    const { admin, eventId } = await createEventWithCategory();
    const qr = signTicket({ uid: crypto.randomUUID(), event_id: eventId, exp: Math.floor(Date.now() / 1000) + 3600 });
    const res = await call("POST", "/admin/scan/validate", admin.token, { qr_code: qr });
    expect(res.status).toBe(404);
    expect(res.body).toEqual(errorOf("TICKET_NOT_FOUND"));
  });

  test("admin mana pun bisa scan tiket event mana pun (event milik platform)", async () => {
    const { eventId, categoryId } = await createEventWithCategory();
    const { qr } = await insertTicket(eventId, categoryId);
    const other = await createAdmin();
    const res = await call("POST", "/admin/scan/validate", other.token, { qr_code: qr });
    expect(res.status).toBe(200);
    const customer = await createCustomer();
    expect((await call("POST", "/admin/scan/validate", customer.token, { qr_code: qr })).status).toBe(401);
  });

  test("event sudah lewat -> 400 EVENT_ENDED", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const { qr } = await insertTicket(eventId, categoryId);
    await sql`UPDATE events SET date = now() - interval '1 hour' WHERE id = ${eventId}`;
    const res = await call("POST", "/admin/scan/validate", admin.token, { qr_code: qr });
    expect(res.status).toBe(400);
    expect(res.body).toEqual(errorOf("EVENT_ENDED"));
  });
});

// ---------------------------------------------------------------------------
// 4. List & detail event dengan statistik kuota
// ---------------------------------------------------------------------------
describe("GET /admin/events (+ /:id) statistik", () => {
  test("total_* dan sales_status; detail kategori punya pending/remaining/sales_status", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ quota: 10, sold: 3 });
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 2, 10);
    await insertPendingOrder(customer.id, eventId, categoryId, 4, -1); // expired, tidak dihitung
    const [second] = await sql<{ id: number }[]>`
      INSERT INTO ticket_categories (event_id, name, price, quota, sold)
      VALUES (${eventId}, 'VIP', 500000, 5, 5) RETURNING id
    `;

    const list = await call("GET", "/admin/events", admin.token);
    expect(list.status).toBe(200);
    const ev = list.body.find((e: any) => e.id === eventId);
    expect(ev).toMatchObject({
      title: "Konser Test",
      artist_name: "Artist",
      total_quota: 15,
      total_sold: 8,
      total_pending: 2,
      total_remaining: 5,
      sales_status: "open",
    });

    const detail = await call("GET", `/admin/events/${eventId}`, admin.token);
    expect(detail.status).toBe(200);
    expect(detail.body.total_remaining).toBe(5);
    const reguler = detail.body.ticket_categories.find((c: any) => c.id === categoryId);
    expect(reguler).toMatchObject({ pending: 2, remaining: 5, sales_status: "open" });
    const vip = detail.body.ticket_categories.find((c: any) => c.id === second.id);
    expect(vip).toMatchObject({ pending: 0, remaining: 0, sales_status: "sold_out" });
  });

  test("event draft -> sales_status closed; id tidak ada -> 404", async () => {
    const { admin, eventId } = await createEventWithCategory({ status: "draft" });
    const detail = await call("GET", `/admin/events/${eventId}`, admin.token);
    expect(detail.body.sales_status).toBe("closed");
    expect((await call("GET", "/admin/events/999999999", admin.token)).status).toBe(404);
  });
});

// ---------------------------------------------------------------------------
// 5. Validasi event
// ---------------------------------------------------------------------------
describe("validasi event", () => {
  test("judul kosong / sales_end_at setelah tanggal event / sales_start_at >= tanggal -> 400", async () => {
    const { admin, artistId } = await createEventWithCategory();
    const date = inDays(30);
    const cases = [
      eventBody({ artist_id: artistId, title: "" }),
      eventBody({ artist_id: artistId, date, sales_end_at: inDays(31) }),
      eventBody({ artist_id: artistId, date, sales_start_at: date }),
    ];
    for (const body of cases) {
      const res = await call("POST", "/admin/events", admin.token, body);
      expect(res.status).toBe(400);
      expect(res.body).toEqual(errorOf("VALIDATION_ERROR"));
    }
    const okRes = await call("POST", "/admin/events", admin.token, eventBody({ artist_id: artistId, date, sales_end_at: date }));
    expect(okRes.status).toBe(201);
  });

  test("PUT memindah tanggal event sebelum sales_end_at yang tersimpan -> 400", async () => {
    const { admin, eventId, artistId } = await createEventWithCategory({ salesEndAt: new Date(Date.now() + 20 * 86_400_000) });
    // sales_end_at tidak dikirim -> nilai lama dipakai, tapi tanggal event baru lebih awal
    const res = await call("PUT", `/admin/events/${eventId}`, admin.token, eventBody({ artist_id: artistId, date: inDays(10) }));
    expect(res.status).toBe(400);
    expect(res.body).toEqual(errorOf("VALIDATION_ERROR"));

    const okRes = await call("PUT", `/admin/events/${eventId}`, admin.token, eventBody({ artist_id: artistId, date: inDays(25) }));
    expect(okRes.status).toBe(200);
  });
});
