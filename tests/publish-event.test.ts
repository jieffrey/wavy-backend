import { describe, expect, test } from "bun:test";
import { call, createAdmin, createCustomer, createEventWithCategory, sql } from "./helpers";

describe("POST /admin/events/:id/publish", () => {
  test("event tanpa kategori tiket -> 400 NO_TICKET_CATEGORY, status tetap draft", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory({ status: "draft" });
    await sql`DELETE FROM ticket_categories WHERE id = ${categoryId}`;

    const res = await call("POST", `/admin/events/${eventId}/publish`, admin.token);
    expect(res.status).toBe(400);
    expect(res.body).toEqual({ error: { code: "NO_TICKET_CATEGORY", message: expect.any(String) } });

    const [{ status }] = await sql<{ status: string }[]>`SELECT status FROM events WHERE id = ${eventId}`;
    expect(status).toBe("draft");
  });

  test("event dengan kategori tiket -> 200 published", async () => {
    const { admin, eventId } = await createEventWithCategory({ status: "draft" });
    const res = await call("POST", `/admin/events/${eventId}/publish`, admin.token);
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("published");
  });

  test("event tidak ada -> 404, bukan NO_TICKET_CATEGORY", async () => {
    const admin = await createAdmin();
    const res = await call("POST", "/admin/events/999999999/publish", admin.token);
    expect(res.status).toBe(404);
  });
});

describe("POST /admin/events/:id/reopen-sales (tombol Buka lagi)", () => {
  test("closed -> published; penjualan kembali open dan order diterima", async () => {
    const { admin, eventId, categoryId } = await createEventWithCategory();
    expect((await call("POST", `/admin/events/${eventId}/close-sales`, admin.token)).status).toBe(200);
    expect((await call("GET", `/concerts/${eventId}`)).body.sales_status).toBe("closed");

    const res = await call("POST", `/admin/events/${eventId}/reopen-sales`, admin.token);
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("published");
    expect((await call("GET", `/concerts/${eventId}`)).body.sales_status).toBe("open");

    const customer = await createCustomer();
    const order = await call("POST", "/orders", customer.token, { event_id: eventId, ticket_category_id: categoryId, quantity: 1 });
    expect(order.status).toBe(201);
  });

  test("bukan closed -> 409 EVENT_NOT_CLOSED; tidak ada -> 404; tanpa admin -> 401", async () => {
    const { admin, eventId } = await createEventWithCategory();
    const res = await call("POST", `/admin/events/${eventId}/reopen-sales`, admin.token);
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("EVENT_NOT_CLOSED");
    expect((await call("POST", "/admin/events/999999999/reopen-sales", admin.token)).status).toBe(404);
    expect((await call("POST", `/admin/events/${eventId}/reopen-sales`)).status).toBe(401);
  });

  test("lewat sales_end_at: dibuka lagi tetap closed bagi customer (status dihitung)", async () => {
    const { admin, eventId } = await createEventWithCategory({ salesEndAt: new Date(Date.now() - 60_000) });
    await call("POST", `/admin/events/${eventId}/close-sales`, admin.token);
    expect((await call("POST", `/admin/events/${eventId}/reopen-sales`, admin.token)).status).toBe(200);
    expect((await call("GET", `/concerts/${eventId}`)).body.sales_status).toBe("closed");
  });
});

describe("DELETE /admin/artists/:id", () => {
  test("artis dipakai event -> 409 ARTIST_HAS_EVENTS; artis bebas -> 200", async () => {
    const { admin, artistId } = await createEventWithCategory();
    const used = await call("DELETE", `/admin/artists/${artistId}`, admin.token);
    expect(used.status).toBe(409);
    expect(used.body.error.code).toBe("ARTIST_HAS_EVENTS");

    const created = await call("POST", "/admin/artists", admin.token, { name: "Solo", genre: "pop", photo_url: "", bio: "" });
    expect(created.status).toBe(201);
    const customer = await createCustomer();
    await sql`INSERT INTO favorite_artists (customer_id, artist_id) VALUES (${customer.id}, ${created.body.id})`;
    expect((await call("DELETE", `/admin/artists/${created.body.id}`, admin.token)).status).toBe(200);
  });

  test("nama artis kosong -> 400 VALIDATION_ERROR", async () => {
    const admin = await createAdmin();
    const res = await call("POST", "/admin/artists", admin.token, { name: " ", genre: "", photo_url: "", bio: "" });
    expect(res.status).toBe(400);
    expect(res.body.error.code).toBe("VALIDATION_ERROR");
  });
});
