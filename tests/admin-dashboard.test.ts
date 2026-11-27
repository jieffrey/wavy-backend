import { describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, sql, tokenFor } from "./helpers";

const uniq = () => `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;

async function adminToken() {
  const [a] = await sql<{ id: number }[]>`
    INSERT INTO admins (name, email, password) VALUES ('Admin', ${`admin-${uniq()}@test.local`}, 'x') RETURNING id
  `;
  return tokenFor("admin_id", a.id);
}

async function order(eventId: number, categoryId: number, status: string, qty: number, price: number, opts: { paidAt?: string; expired?: boolean } = {}) {
  const customer = await createCustomer();
  const [o] = await sql<{ id: number }[]>`
    INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at, paid_at)
    VALUES (${customer.id}, ${eventId}, ${categoryId}, ${qty}, ${price}, ${status},
            ${opts.expired ? sql`now() - interval '1 minute'` : sql`now() + interval '15 minutes'`}, now(),
            ${status === "paid" ? sql`${opts.paidAt ?? new Date().toISOString()}::timestamptz` : null})
    RETURNING id
  `;
  return o.id;
}

describe("GET /admin/stats", () => {
  test("KPI platform + order per status; pending kedaluwarsa dihitung expired", async () => {
    const admin = await adminToken();
    const ev = await createEventWithCategory({ quota: 50 });
    const stale = await order(ev.eventId, ev.categoryId, "pending_payment", 1, 100000, { expired: true });
    const res = await call("GET", "/admin/stats", admin);
    expect(res.status).toBe(200);
    expect(res.body).not.toHaveProperty("organizer_count");
    for (const key of [
      "event_count",
      "customer_count",
      "published_event_count",
      "order_count",
      "ticket_sold",
      "revenue",
    ])
      expect(typeof res.body[key]).toBe("number");
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM orders WHERE status = 'expired'`;
    expect(res.body.orders_by_status.expired).toBe(n);
    const [row] = await sql`SELECT status FROM orders WHERE id = ${stale}`;
    expect(row.status).toBe("expired");
    const [{ q }] = await sql<{ q: number }[]>`SELECT COALESCE(SUM(quantity), 0)::int AS q FROM orders WHERE status = 'paid'`;
    expect(res.body.ticket_sold).toBe(q);
    const total = Object.values(res.body.orders_by_status as Record<string, number>).reduce((a, b) => a + b, 0);
    expect(total).toBe(res.body.order_count);
  });
});

describe("GET /admin/stats/daily", () => {
  test("satu baris per hari WIB, hari ini memuat order paid hari ini", async () => {
    const admin = await adminToken();
    const before = await call("GET", "/admin/stats/daily?days=7", admin);
    expect(before.status).toBe(200);
    expect(before.body).toHaveLength(7);
    const ev = await createEventWithCategory({ quota: 50 });
    await order(ev.eventId, ev.categoryId, "paid", 2, 250000);
    await order(ev.eventId, ev.categoryId, "pending_payment", 1, 100000);
    const after = await call("GET", "/admin/stats/daily?days=7", admin);
    const today = (rows: { revenue: number; tickets: number; orders: number }[]) => rows[rows.length - 1];
    expect(today(after.body).revenue - today(before.body).revenue).toBe(250000);
    expect(today(after.body).tickets - today(before.body).tickets).toBe(2);
    expect(today(after.body).orders - today(before.body).orders).toBe(1);
    expect(after.body[0].date < after.body[6].date).toBe(true);
  });

  test("order paid 10 hari lalu tidak masuk jendela 7 hari", async () => {
    const admin = await adminToken();
    const ev = await createEventWithCategory({ quota: 50 });
    const before = await call("GET", "/admin/stats/daily?days=7", admin);
    await order(ev.eventId, ev.categoryId, "paid", 1, 99000, { paidAt: new Date(Date.now() - 10 * 86_400_000).toISOString() });
    const after = await call("GET", "/admin/stats/daily?days=7", admin);
    const sum = (rows: { revenue: number }[]) => rows.reduce((a, r) => a + r.revenue, 0);
    expect(sum(after.body)).toBe(sum(before.body));
  });

  test("days di luar 1..365 -> 400", async () => {
    const admin = await adminToken();
    expect((await call("GET", "/admin/stats/daily?days=0", admin)).status).toBe(400);
    expect((await call("GET", "/admin/stats/daily?days=abc", admin)).status).toBe(400);
  });

  test("wajib token admin", async () => {
    expect((await call("GET", "/admin/stats/daily")).status).toBe(401);
  });
});

describe("GET /admin/stats/top-events & /admin/orders/recent", () => {
  test("event terlaris diurutkan tiket terjual, hanya order paid", async () => {
    const admin = await adminToken();
    const a = await createEventWithCategory({ quota: 200 });
    const b = await createEventWithCategory({ quota: 200 });
    // maks 4 tiket per order (CHECK di DB): banyak order supaya kedua event jadi teratas di platform
    for (let i = 0; i < 23; i++) await order(a.eventId, a.categoryId, "paid", 4, 400_000); // 92 tiket
    for (let i = 0; i < 25; i++) await order(b.eventId, b.categoryId, "paid", 4, 400_000); // 100 tiket
    await order(a.eventId, a.categoryId, "pending_payment", 4, 5_000_000);
    const res = await call("GET", "/admin/stats/top-events?limit=2", admin);
    expect(res.status).toBe(200);
    expect(res.body.map((e: { id: number }) => e.id)).toEqual([b.eventId, a.eventId]);
    expect(res.body[1]).toMatchObject({ tickets_sold: 92, revenue: 9_200_000, artist_name: "Artist" });
  });

  test("order terbaru paling baru di atas, dengan nama event & pembeli", async () => {
    const admin = await adminToken();
    const ev = await createEventWithCategory({ quota: 10 });
    const id = await order(ev.eventId, ev.categoryId, "pending_payment", 1, 100000);
    const res = await call("GET", "/admin/orders/recent?limit=3", admin);
    expect(res.status).toBe(200);
    expect(res.body.length).toBeLessThanOrEqual(3);
    expect(res.body[0]).toMatchObject({ id, event_title: "Konser Test", status: "pending_payment" });
    expect(typeof res.body[0].customer_name).toBe("string");
    expect((await call("GET", "/admin/orders/recent?limit=99", admin)).status).toBe(400);
  });
});
