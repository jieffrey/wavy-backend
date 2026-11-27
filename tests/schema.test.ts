import { describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, insertPendingOrder, sql } from "./helpers";

// Skema v2 (db/migrations/001_init.sql): relasi & aturan ditegakkan juga oleh database, bukan hanya service.

const rejects = async (q: Promise<unknown>, pattern: RegExp) => {
  let message = "";
  try {
    await q;
  } catch (err) {
    message = err instanceof Error ? err.message : String(err);
  }
  expect(message).toMatch(pattern);
};

describe("skema v2", () => {
  test("tabel role EO & waiting room tidak ada; schema_migrations mencatat 001", async () => {
    const rows = await sql<{ t: string | null }[]>`
      SELECT to_regclass(x) AS t FROM unnest(ARRAY['public.organizers','public.favorite_organizers','public.waiting_room','public.waiting_list']) AS x
    `;
    expect(rows.every((r) => r.t === null)).toBe(true);
    const [m] = await sql<{ file: string }[]>`SELECT file FROM schema_migrations WHERE version = '001'`;
    expect(m.file).toBe("001_init.sql");
  });

  test("FK komposit: order dengan kategori milik event lain ditolak database", async () => {
    const a = await createEventWithCategory();
    const b = await createEventWithCategory();
    const customer = await createCustomer();
    await rejects(insertPendingOrder(customer.id, a.eventId, b.categoryId, 1, 10), /orders_category_event_fkey/);
  });

  test("CHECK: quantity 1..4, status terdaftar, paid wajib paid_at", async () => {
    const ev = await createEventWithCategory();
    const customer = await createCustomer();
    await rejects(insertPendingOrder(customer.id, ev.eventId, ev.categoryId, 5, 10), /orders_quantity_check/);
    await rejects(
      sql`INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status)
          VALUES (${customer.id}, ${ev.eventId}, ${ev.categoryId}, 1, 1, 'lunas')`,
      /orders_status_check/
    );
    await rejects(
      sql`INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status)
          VALUES (${customer.id}, ${ev.eventId}, ${ev.categoryId}, 1, 1, 'paid')`,
      /orders_paid_has_paid_at/
    );
    await rejects(sql`UPDATE ticket_categories SET quota = 0 WHERE id = ${ev.categoryId}`, /ticket_categories_quota_check/);
    await rejects(sql`UPDATE events SET status = 'archived' WHERE id = ${ev.eventId}`, /events_status_check/);
  });

  test("RESTRICT: artis yang dipakai event & event yang punya order tidak bisa dihapus langsung", async () => {
    const ev = await createEventWithCategory();
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, ev.eventId, ev.categoryId, 1, 10);
    await rejects(sql`DELETE FROM artists WHERE id = ${ev.artistId}`, /foreign key/);
    await rejects(sql`DELETE FROM events WHERE id = ${ev.eventId}`, /foreign key/);
  });

  test("kolom audit: created_by, verified_by, scanned_at/scanned_by diisi dari admin yang login", async () => {
    const ev = await createEventWithCategory({ quota: 5 });
    const created = await call("POST", "/admin/events", ev.admin.token, {
      title: "Audit",
      artist_id: ev.artistId,
      category: "pop",
      venue: "Jakarta",
      date: new Date(Date.now() + 86_400_000).toISOString(),
      poster_url: "",
      description: "",
    });
    expect(created.status).toBe(201);
    expect(created.body.created_by).toBe(ev.admin.id);

    const customer = await createCustomer();
    const orderId = await insertPendingOrder(customer.id, ev.eventId, ev.categoryId, 1, 10);
    expect((await call("POST", `/admin/orders/${orderId}/verify`, ev.admin.token, { approve: true })).status).toBe(200);
    const [order] = await sql<{ verified_by: number }[]>`SELECT verified_by FROM orders WHERE id = ${orderId}`;
    expect(order.verified_by).toBe(ev.admin.id);

    const [ticket] = await sql<{ qr_code: string }[]>`SELECT qr_code FROM tickets WHERE order_id = ${orderId}`;
    expect((await call("POST", "/admin/scan/validate", ev.admin.token, { qr_code: ticket.qr_code })).status).toBe(200);
    const [scanned] = await sql<{ scanned_at: Date | null; scanned_by: number }[]>`
      SELECT scanned_at, scanned_by FROM tickets WHERE qr_code = ${ticket.qr_code}
    `;
    expect(scanned.scanned_at).toBeInstanceOf(Date);
    expect(scanned.scanned_by).toBe(ev.admin.id);
  });
});
