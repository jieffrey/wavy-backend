import { describe, expect, test } from "bun:test";
import {
  call,
  createCustomer,
  createEventWithCategory,
  createAdmin,
  insertPendingOrder,
  orderStatus,
  sql,
} from "./helpers";

const errorOf = (code: string) => ({ error: { code, message: expect.any(String) } });

// order paid dengan paid_at tertentu (daysAgo dari sekarang)
async function insertPaidOrder(customerId: number, eventId: number, categoryId: number, quantity: number, daysAgo = 0) {
  const [order] = await sql<{ id: number }[]>`
    INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at, paid_at)
    VALUES (${customerId}, ${eventId}, ${categoryId}, ${quantity}, ${quantity * 100000}, 'paid',
            now() - make_interval(days => ${daysAgo}), now() - make_interval(days => ${daysAgo}),
            now() - make_interval(days => ${daysAgo}))
    RETURNING id
  `;
  await sql`UPDATE ticket_categories SET sold = sold + ${quantity} WHERE id = ${categoryId}`;
  return order.id;
}

const jakartaDate = async (daysAgo: number) =>
  (
    await sql<{ d: string }[]>`
      SELECT to_char(((now() - make_interval(days => ${daysAgo})) AT TIME ZONE 'Asia/Jakarta')::date, 'YYYY-MM-DD') AS d
    `
  )[0].d;

describe("akses /admin/* (dulu /organizer/*)", () => {
  test("tanpa token / token customer -> 401; endpoint organizer lama sudah tidak ada", async () => {
    const customer = await createCustomer();
    for (const path of ["/admin/events", "/admin/artists", "/admin/orders", "/admin/dashboard"]) {
      expect((await call("GET", path)).status).toBe(401);
      expect((await call("GET", path, customer.token)).status).toBe(401);
    }
    const admin = await createAdmin();
    expect((await call("GET", "/organizer/events", admin.token)).status).toBe(404);
    expect((await call("POST", "/auth/organizer/login", undefined, { email: "a@b.c", password: "x" })).status).toBe(404);
  });
});

describe("paid_at", () => {
  test("approve order mengisi paid_at", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const id = await insertPendingOrder(customer.id, eventId, categoryId, 1, 10);
    const res = await call("POST", `/admin/orders/${id}/verify`, admin.token, { approve: true });
    expect(res.status).toBe(200);
    const [row] = await sql<{ paid_at: Date | null }[]>`SELECT paid_at FROM orders WHERE id = ${id}`;
    expect(row.paid_at).toBeInstanceOf(Date);
  });
});

describe("GET /admin/orders (+ /:id)", () => {
  test("baris berisi event_title, category_name, customer_*; filter status & event_id", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const paid = await insertPaidOrder(customer.id, eventId, categoryId, 2);
    const pending = await insertPendingOrder(customer.id, eventId, categoryId, 1, 10);
    const [otherEvent] = await sql<{ id: number }[]>`
      INSERT INTO events (artist_id, title, category, venue, date, poster_url, description, status)
      SELECT artist_id, 'Event Lain', category, venue, date, '', '', 'published' FROM events WHERE id = ${eventId}
      RETURNING id
    `;
    const [otherCat] = await sql<{ id: number }[]>`
      INSERT INTO ticket_categories (event_id, name, price, quota) VALUES (${otherEvent.id}, 'VIP', 1, 5) RETURNING id
    `;
    const otherOrder = await insertPendingOrder(customer.id, otherEvent.id, otherCat.id, 1, 10);

    const all = await call("GET", "/admin/orders", admin.token);
    expect(all.status).toBe(200);
    // order semua event platform; ambil yang dibuat test ini
    const mine = all.body.filter((o: any) => [eventId, otherEvent.id].includes(o.event_id));
    expect(mine.map((o: any) => o.id).sort()).toEqual([paid, pending, otherOrder].sort());
    const row = all.body.find((o: any) => o.id === paid);
    expect(row).toMatchObject({
      status: "paid",
      quantity: 2,
      event_id: eventId,
      event_title: "Konser Test",
      category_name: "Reguler",
      customer_email: expect.stringContaining("@test.local"),
      paid_at: expect.any(String),
    });
    expect(row).toHaveProperty("customer_name");

    const byStatus = await call("GET", `/admin/orders?status=paid&event_id=${eventId}`, admin.token);
    expect(byStatus.body.map((o: any) => o.id)).toEqual([paid]);
    const byEvent = await call("GET", `/admin/orders?event_id=${otherEvent.id}`, admin.token);
    expect(byEvent.body.map((o: any) => o.id)).toEqual([otherOrder]);
    const bad = await call("GET", "/admin/orders?event_id=abc", admin.token);
    expect(bad.status).toBe(400);
  });

  test("detail order berisi tiket; id tidak ada -> 404; lazy expiry", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const id = await insertPaidOrder(customer.id, eventId, categoryId, 2);
    await sql`INSERT INTO tickets (order_id, qr_code, owner_id) VALUES (${id}, ${`qr-${id}-1`}, ${customer.id}), (${id}, ${`qr-${id}-2`}, ${customer.id})`;
    await sql`UPDATE tickets SET is_scanned = true WHERE qr_code = ${`qr-${id}-1`}`;

    const res = await call("GET", `/admin/orders/${id}`, admin.token);
    expect(res.status).toBe(200);
    expect(res.body).toMatchObject({ id, event_title: "Konser Test", category_name: "Reguler" });
    expect(res.body.tickets.map((t: any) => t.is_scanned)).toEqual([true, false]);

    expect((await call("GET", "/admin/orders/999999999", admin.token)).status).toBe(404);
    expect((await call("GET", `/admin/orders/${id}`, customer.token)).status).toBe(401);

    const stale = await insertPendingOrder(customer.id, eventId, categoryId, 1, -1);
    const staleRes = await call("GET", `/admin/orders/${stale}`, admin.token);
    expect(staleRes.body.status).toBe("expired");
    expect(await orderStatus(stale)).toBe("expired");
  });
});

describe("GET /admin/dashboard", () => {
  test("?event_id: kpi, per_category, recent_orders; remaining_ticket dikurangi pending aktif", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ quota: 20 });
    const customer = await createCustomer();
    await insertPaidOrder(customer.id, eventId, categoryId, 2, 1); // 7 hari terakhir
    await insertPaidOrder(customer.id, eventId, categoryId, 3, 10); // 7 hari sebelumnya
    await insertPaidOrder(customer.id, eventId, categoryId, 1, 20); // di luar 14 hari
    await insertPendingOrder(customer.id, eventId, categoryId, 4, 10);
    await insertPendingOrder(customer.id, eventId, categoryId, 5, -1); // expired
    const [order] = await sql<{ id: number }[]>`SELECT id FROM orders WHERE event_id = ${eventId} AND status = 'paid' LIMIT 1`;
    await sql`INSERT INTO tickets (order_id, qr_code, owner_id, is_scanned) VALUES (${order.id}, ${`qr-dash-${order.id}`}, ${customer.id}, true)`;

    const res = await call("GET", `/admin/dashboard?event_id=${eventId}`, admin.token);
    expect(res.status).toBe(200);
    const b = res.body;
    expect(b.revenue).toBe(600000);
    expect(b.ticket_sold).toBe(6);
    expect(b.remaining_ticket).toBe(20 - 6 - 4);
    expect(b).toHaveProperty("popular_category");
    expect(b).toHaveProperty("peak_purchase_hour");
    expect(b.kpi).toEqual({
      revenue: 600000,
      tickets_sold: 6,
      pending_reserved: 4,
      checked_in: 1,
      revenue_7d: 200000,
      revenue_prev_7d: 300000,
      sold_7d: 2,
      sold_prev_7d: 3,
    });
    expect(b.per_category).toEqual([
      {
        event_id: eventId,
        event_title: "Konser Test",
        category_id: categoryId,
        name: "Reguler",
        quota: 20,
        sold: 6,
        pending: 4,
        remaining: 10,
        revenue: 600000,
      },
    ]);
    expect(b.recent_orders.length).toBe(5);
    expect(b.recent_orders[0]).toHaveProperty("event_title", "Konser Test");
    expect(b.recent_orders.some((o: any) => o.status === "expired")).toBe(true);

    // tanpa event_id = seluruh platform (mencakup event ini)
    const all = await call("GET", "/admin/dashboard", admin.token);
    expect(all.status).toBe(200);
    expect(all.body.per_category.some((c: any) => c.category_id === categoryId)).toBe(true);
    expect(all.body.ticket_sold).toBeGreaterThanOrEqual(6);
    expect((await call("GET", "/admin/dashboard?event_id=x", admin.token)).status).toBe(400);
  });
});

describe("GET /admin/dashboard/sales", () => {
  test("satu baris per hari (zero-filled), tanggal Asia/Jakarta", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ quota: 50 });
    const customer = await createCustomer();
    await insertPaidOrder(customer.id, eventId, categoryId, 2, 0);
    await insertPaidOrder(customer.id, eventId, categoryId, 1, 0);
    await insertPaidOrder(customer.id, eventId, categoryId, 3, 2);
    await insertPaidOrder(customer.id, eventId, categoryId, 4, 40); // di luar jendela

    const res = await call("GET", `/admin/dashboard/sales?days=7&event_id=${eventId}`, admin.token);
    expect(res.status).toBe(200);
    expect(res.body.length).toBe(7);
    expect(res.body[6]).toEqual({ date: await jakartaDate(0), tickets: 3, revenue: 300000 });
    expect(res.body[4]).toEqual({ date: await jakartaDate(2), tickets: 3, revenue: 300000 });
    expect(res.body[5]).toEqual({ date: await jakartaDate(1), tickets: 0, revenue: 0 });
    expect(res.body.reduce((n: number, r: any) => n + r.tickets, 0)).toBe(6);

    const def = await call("GET", `/admin/dashboard/sales?event_id=${eventId}`, admin.token);
    expect(def.body.length).toBe(30);
  });

  test("days di luar 1..365 -> 400 VALIDATION_ERROR", async () => {
    const admin = await createAdmin();
    for (const days of ["0", "366", "abc", "1.5"]) {
      const res = await call("GET", `/admin/dashboard/sales?days=${days}`, admin.token);
      expect(res.status).toBe(400);
      expect(res.body).toEqual(errorOf("VALIDATION_ERROR"));
    }
    expect((await call("GET", "/admin/dashboard/sales?days=365", admin.token)).body.length).toBe(365);
  });
});
