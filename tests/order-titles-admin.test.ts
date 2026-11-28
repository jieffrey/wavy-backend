import { describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, insertPendingOrder, sql, tokenFor } from "./helpers";

async function paidOrder(customerId: number, eventId: number, categoryId: number, quantity: number) {
  const [o] = await sql<{ id: number }[]>`
    INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at, paid_at)
    VALUES (${customerId}, ${eventId}, ${categoryId}, ${quantity}, ${quantity * 100000}, 'paid', now(), now(), now())
    RETURNING id
  `;
  await sql`UPDATE ticket_categories SET sold = sold + ${quantity} WHERE id = ${categoryId}`;
  return o.id;
}

async function createAdmin() {
  const [a] = await sql<{ id: number }[]>`
    INSERT INTO admins (name, email, password) VALUES ('Admin Test', ${`admin-${Date.now()}-${Math.random()}@test.local`}, 'x')
    RETURNING id
  `;
  return { id: a.id, token: tokenFor("admin_id", a.id) };
}

describe("order customer menyertakan judul event, kategori, poster", () => {
  test("GET /orders/history dan GET /orders/:id", async () => {
    const ev = await createEventWithCategory();
    await sql`UPDATE events SET poster_url = 'https://img.test/p.jpg' WHERE id = ${ev.eventId}`;
    const cust = await createCustomer();
    const id = await insertPendingOrder(cust.id, ev.eventId, ev.categoryId, 1, 15);

    const hist = await call("GET", "/orders/history", cust.token);
    expect(hist.status).toBe(200);
    expect(hist.body).toHaveLength(1);
    expect(hist.body[0]).toMatchObject({
      id,
      event_title: "Konser Test",
      category_name: "Reguler",
      poster_url: "https://img.test/p.jpg",
      venue: "Venue",
      status: "pending_payment",
    });
    expect(hist.body[0].event_date).toBeTruthy();

    const det = await call("GET", `/orders/${id}`, cust.token);
    expect(det.status).toBe(200);
    expect(det.body).toMatchObject({ id, event_title: "Konser Test", category_name: "Reguler" });
  });

  test("order customer lain tetap 404", async () => {
    const ev = await createEventWithCategory();
    const owner = await createCustomer();
    const other = await createCustomer();
    const id = await insertPendingOrder(owner.id, ev.eventId, ev.categoryId, 1, 15);
    expect((await call("GET", `/orders/${id}`, other.token)).status).toBe(404);
  });
});

describe("GET /admin/me", () => {
  test("mengembalikan profil admin dari token", async () => {
    const admin = await createAdmin();
    const res = await call("GET", "/admin/me", admin.token);
    expect(res.status).toBe(200);
    expect(res.body).toMatchObject({ id: admin.id, name: "Admin Test" });
    expect(res.body.password).toBeUndefined();
  });

  test("tanpa token / token customer → 401", async () => {
    expect((await call("GET", "/admin/me")).status).toBe(401);
    const cust = await createCustomer();
    expect((await call("GET", "/admin/me", cust.token)).status).toBe(401);
  });
});

describe("endpoint organizer admin sudah dihapus", () => {
  test("GET/PATCH /admin/organizers* -> 404", async () => {
    const admin = await createAdmin();
    expect((await call("GET", "/admin/organizers", admin.token)).status).toBe(404);
    expect((await call("GET", "/admin/organizers/1", admin.token)).status).toBe(404);
    expect((await call("PATCH", "/admin/organizers/1", admin.token, { status: "active" })).status).toBe(404);
  });
});
