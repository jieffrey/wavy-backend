import { describe, expect, test } from "bun:test";
import {
  call,
  createCustomer,
  createEventWithCategory,
  createOrganizer,
  insertPendingOrder,
  orderBody,
  orderStatus,
  sql,
  tokenFor,
} from "./helpers";

const minutesFromNow = (m: number) => new Date(Date.now() + m * 60_000);

const baseEvent = (artistId: number) => ({
  title: "Konser Baru",
  artist_id: artistId,
  category: "pop",
  venue: "Venue",
  date: minutesFromNow(60 * 24 * 30).toISOString(),
  poster_url: "",
  description: "",
});

// ---------------------------------------------------------------------------
// 1. Tenggat penjualan pada endpoint event organizer
// ---------------------------------------------------------------------------
describe("organizer event sales window", () => {
  test("create menyimpan sales_start_at & sales_end_at", async () => {
    const { organizer, artistId } = await createEventWithCategory();
    const start = minutesFromNow(60);
    const end = minutesFromNow(120);
    const res = await call("POST", "/organizer/events", organizer.token, {
      ...baseEvent(artistId),
      sales_start_at: start.toISOString(),
      sales_end_at: end.toISOString(),
    });
    expect(res.status).toBe(201);
    expect(new Date(res.body.sales_start_at).getTime()).toBe(start.getTime());
    expect(new Date(res.body.sales_end_at).getTime()).toBe(end.getTime());
  });

  test("create menolak sales_end_at <= sales_start_at", async () => {
    const { organizer, artistId } = await createEventWithCategory();
    const t = minutesFromNow(60).toISOString();
    const res = await call("POST", "/organizer/events", organizer.token, {
      ...baseEvent(artistId),
      sales_start_at: t,
      sales_end_at: t,
    });
    expect(res.status).toBe(400);
  });

  test("create menolak format tanggal tidak valid", async () => {
    const { organizer, artistId } = await createEventWithCategory();
    const res = await call("POST", "/organizer/events", organizer.token, {
      ...baseEvent(artistId),
      sales_start_at: "besok",
    });
    expect(res.status).toBe(400);
  });

  test("update parsial divalidasi terhadap nilai tersimpan; field yang tidak dikirim dipertahankan", async () => {
    const start = minutesFromNow(60);
    const { organizer, artistId, eventId } = await createEventWithCategory({ salesStartAt: start });

    const bad = await call("PUT", `/organizer/events/${eventId}`, organizer.token, {
      ...baseEvent(artistId),
      sales_end_at: minutesFromNow(30).toISOString(), // sebelum start tersimpan
    });
    expect(bad.status).toBe(400);

    const kept = await call("PUT", `/organizer/events/${eventId}`, organizer.token, baseEvent(artistId));
    expect(kept.status).toBe(200);
    expect(new Date(kept.body.sales_start_at).getTime()).toBe(start.getTime());

    const cleared = await call("PUT", `/organizer/events/${eventId}`, organizer.token, {
      ...baseEvent(artistId),
      sales_start_at: null,
    });
    expect(cleared.status).toBe(200);
    expect(cleared.body.sales_start_at).toBeNull();
  });
});

// ---------------------------------------------------------------------------
// 2. Validasi POST /orders + format error
// ---------------------------------------------------------------------------
describe("POST /orders sales status", () => {
  test("event yang di-close manual -> 409 SALES_CLOSED", async () => {
    const { organizer, eventId, categoryId } = await createEventWithCategory();
    const closed = await call("POST", `/organizer/events/${eventId}/close-sales`, organizer.token);
    expect(closed.status).toBe(200);

    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(res.status).toBe(409);
    expect(res.body).toEqual({ error: { code: "SALES_CLOSED", message: expect.any(String) } });
  });

  test("event draft (belum publish) -> 409 SALES_CLOSED", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ status: "draft" });
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("SALES_CLOSED");
  });

  test("sebelum sales_start_at -> 409 SALES_NOT_STARTED", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ salesStartAt: minutesFromNow(60) });
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("SALES_NOT_STARTED");
  });

  test("setelah sales_end_at -> 409 SALES_ENDED", async () => {
    const { eventId, categoryId } = await createEventWithCategory({
      salesStartAt: minutesFromNow(-120),
      salesEndAt: minutesFromNow(-1),
    });
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("SALES_ENDED");
  });

  test("di dalam tenggat -> 201, pending_payment, expires_at = created_at + 15 menit", async () => {
    const { eventId, categoryId } = await createEventWithCategory({
      salesStartAt: minutesFromNow(-10),
      salesEndAt: minutesFromNow(10),
    });
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, 2));
    expect(res.status).toBe(201);
    expect(res.body.status).toBe("pending_payment");
    const ttl = new Date(res.body.expires_at).getTime() - new Date(res.body.created_at).getTime();
    expect(ttl).toBe(15 * 60_000);
  });
});

describe("POST /orders attendee data", () => {
  test("data attendee tersimpan di order yang dibuat dalam transaksi", async () => {
    const { eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, {
      ...orderBody(eventId, categoryId),
      full_name: "Budi Santoso",
      email: "budi@test.local",
      phone: "081234567890",
      id_number: "3201010101010001",
      birth_date: "2000-05-17",
      gender: "L",
      wa_consent: "Ya",
    });
    expect(res.status).toBe(201);
    const [row] = await sql<Record<string, unknown>[]>`
      SELECT full_name, email, phone, id_number, to_char(birth_date, 'YYYY-MM-DD') AS birth_date, gender, wa_consent
      FROM orders WHERE id = ${res.body.id}
    `;
    expect(row).toEqual({
      full_name: "Budi Santoso",
      email: "budi@test.local",
      phone: "081234567890",
      id_number: "3201010101010001",
      birth_date: "2000-05-17",
      gender: "L",
      wa_consent: "Ya",
    });
  });

  test("gender & wa_consent kosong tidak melanggar NOT NULL (disimpan string kosong)", async () => {
    const { eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, { ...orderBody(eventId, categoryId), gender: null });
    expect(res.status).toBe(201);
    expect(res.body.gender).toBe("");
    expect(res.body.wa_consent).toBe("");
    expect(res.body.birth_date).toBeNull();
  });
});

describe("POST /orders quota", () => {
  test("order pending yang belum expired ikut memakan kuota -> 409 QUOTA_EXCEEDED", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 3, sold: 1 });
    const other = await createCustomer();
    await insertPendingOrder(other.id, eventId, categoryId, 1, 10); // sisa 1

    const customer = await createCustomer();
    const tooMany = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, 2));
    expect(tooMany.status).toBe(409);
    expect(tooMany.body).toEqual({ error: { code: "QUOTA_EXCEEDED", message: expect.any(String) } });

    const fits = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, 1));
    expect(fits.status).toBe(201);
  });

  test("order pending yang sudah expired melepas kuota dan ditandai expired", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 1 });
    const other = await createCustomer();
    const stale = await insertPendingOrder(other.id, eventId, categoryId, 1, -1);

    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, 1));
    expect(res.status).toBe(201);
    expect(await orderStatus(stale)).toBe("expired");
  });

  test("dua order bersamaan memperebutkan kuota terakhir: hanya satu yang lolos", async () => {
    for (let round = 0; round < 5; round++) {
      const { eventId, categoryId } = await createEventWithCategory({ quota: 1 });
      const [a, b] = await Promise.all([createCustomer(), createCustomer()]);
      const results = await Promise.all([
        call("POST", "/orders", a.token, orderBody(eventId, categoryId, 1)),
        call("POST", "/orders", b.token, orderBody(eventId, categoryId, 1)),
      ]);
      const statuses = results.map((r) => r.status).sort();
      expect(statuses).toEqual([201, 409]);
      expect(results.find((r) => r.status === 409)!.body.error.code).toBe("QUOTA_EXCEEDED");

      const [{ n }] = await sql<{ n: number }[]>`
        SELECT COUNT(*)::int AS n FROM orders WHERE ticket_category_id = ${categoryId}
      `;
      expect(n).toBe(1);
    }
  });

  test("10 order bersamaan untuk kuota 3: tepat 3 yang lolos", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 3 });
    const customers = await Promise.all(Array.from({ length: 10 }, () => createCustomer()));
    const results = await Promise.all(
      customers.map((c) => call("POST", "/orders", c.token, orderBody(eventId, categoryId, 1)))
    );
    expect(results.filter((r) => r.status === 201)).toHaveLength(3);
    expect(results.filter((r) => r.status === 409)).toHaveLength(7);
  });
});

describe("remaining di daftar & detail konser", () => {
  test("remaining = quota - sold - pending aktif; pending expired tidak dihitung", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 10, sold: 3 });
    const customer = await createCustomer();
    await insertPendingOrder(customer.id, eventId, categoryId, 2, 10); // aktif
    await insertPendingOrder(customer.id, eventId, categoryId, 4, -1); // expired, tidak dihitung

    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.status).toBe(200);
    expect(detail.body.ticket_categories.find((c: any) => c.id === categoryId).remaining).toBe(5);

    const list = await call("GET", "/concerts");
    expect(list.status).toBe(200);
    expect(list.body.find((e: any) => e.id === eventId).remaining).toBe(5);
  });

  test("angka remaining sama dengan batas yang ditegakkan POST /orders", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 4, sold: 1 });
    const other = await createCustomer();
    await insertPendingOrder(other.id, eventId, categoryId, 1, 10);

    const detail = await call("GET", `/concerts/${eventId}`);
    const remaining = detail.body.ticket_categories[0].remaining;
    expect(remaining).toBe(2);

    const customer = await createCustomer();
    const over = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, remaining + 1));
    expect(over.status).toBe(409);
    const exact = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, remaining));
    expect(exact.status).toBe(201);

    const after = await call("GET", `/concerts/${eventId}`);
    expect(after.body.ticket_categories[0].remaining).toBe(0);
  });

  test("sold > quota (data seed) tidak menghasilkan remaining negatif", async () => {
    const { eventId } = await createEventWithCategory({ quota: 2, sold: 5 });
    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.body.ticket_categories[0].remaining).toBe(0);
  });
});

// ---------------------------------------------------------------------------
// 3. Lazy expiry
// ---------------------------------------------------------------------------
describe("lazy expiry", () => {
  test("GET /orders/:id menandai order lewat waktu sebagai expired", async () => {
    const { eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const id = await insertPendingOrder(customer.id, eventId, categoryId, 1, -1);

    const res = await call("GET", `/orders/${id}`, customer.token);
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("expired");
  });

  test("GET /orders/history dan GET /organizer/orders menandai order lewat waktu", async () => {
    const { organizer, eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();
    const other = await createCustomer();
    const id1 = await insertPendingOrder(customer.id, eventId, categoryId, 1, -1);
    const id2 = await insertPendingOrder(other.id, eventId, categoryId, 1, -1);
    const fresh = await insertPendingOrder(customer.id, eventId, categoryId, 1, 10);

    const history = await call("GET", "/orders/history", customer.token);
    expect(history.status).toBe(200);
    const byId = new Map(history.body.map((o: any) => [o.id, o.status]));
    expect(byId.get(id1)).toBe("expired");
    expect(byId.get(fresh)).toBe("pending_payment");
    expect(await orderStatus(id2)).toBe("pending_payment"); // milik customer lain, belum disentuh

    const list = await call("GET", "/organizer/orders", organizer.token);
    expect(list.status).toBe(200);
    expect(list.body.find((o: any) => o.id === id2).status).toBe("expired");
  });

  test("EO tidak bisa approve order yang sudah expired -> 409 ORDER_EXPIRED", async () => {
    const { organizer, eventId, categoryId } = await createEventWithCategory({ quota: 5 });
    const customer = await createCustomer();
    const id = await insertPendingOrder(customer.id, eventId, categoryId, 2, -1);

    const res = await call("POST", `/organizer/orders/${id}/verify`, organizer.token, { approve: true });
    expect(res.status).toBe(409);
    expect(res.body).toEqual({ error: { code: "ORDER_EXPIRED", message: expect.any(String) } });

    expect(await orderStatus(id)).toBe("expired");
    const [{ sold }] = await sql<{ sold: number }[]>`SELECT sold FROM ticket_categories WHERE id = ${categoryId}`;
    expect(sold).toBe(0);
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${id}`;
    expect(n).toBe(0);
  });

  test("approve order yang masih berlaku tetap jalan (paid + tiket terbit)", async () => {
    const { organizer, eventId, categoryId } = await createEventWithCategory({ quota: 5 });
    const customer = await createCustomer();
    const id = await insertPendingOrder(customer.id, eventId, categoryId, 2, 10);

    const res = await call("POST", `/organizer/orders/${id}/verify`, organizer.token, { approve: true });
    expect(res.status).toBe(200);
    expect(await orderStatus(id)).toBe("paid");
    const [{ n }] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM tickets WHERE order_id = ${id}`;
    expect(n).toBe(2);

    const again = await call("POST", `/organizer/orders/${id}/verify`, organizer.token, { approve: true });
    expect(again.status).toBe(400);
  });
});

// ---------------------------------------------------------------------------
// 4. Suspend organizer langsung berlaku
// ---------------------------------------------------------------------------
describe("organizer suspension", () => {
  test("JWT valid tapi organizer di-suspend -> 403 ORGANIZER_SUSPENDED", async () => {
    const organizer = await createOrganizer();
    const before = await call("GET", "/organizer/events", organizer.token);
    expect(before.status).toBe(200);

    await sql`UPDATE organizers SET status = 'suspended' WHERE id = ${organizer.id}`;
    const after = await call("GET", "/organizer/events", organizer.token);
    expect(after.status).toBe(403);
    expect(after.body).toEqual({ error: { code: "ORGANIZER_SUSPENDED", message: expect.any(String) } });

    await sql`UPDATE organizers SET status = 'active' WHERE id = ${organizer.id}`;
    const restored = await call("GET", "/organizer/events", organizer.token);
    expect(restored.status).toBe(200);
  });

  test("suspend lewat endpoint admin langsung memblokir token EO", async () => {
    const organizer = await createOrganizer();
    const [admin] = await sql<{ id: number }[]>`
      INSERT INTO admins (name, email, password) VALUES ('Admin', ${`admin-${organizer.id}@test.local`}, 'x') RETURNING id
    `;
    const res = await call("PATCH", `/admin/organizers/${organizer.id}`, tokenFor("admin_id", admin.id), {
      status: "suspended",
    });
    expect(res.status).toBe(200);

    const blocked = await call("GET", "/organizer/dashboard", organizer.token);
    expect(blocked.status).toBe(403);
    expect(blocked.body.error.code).toBe("ORGANIZER_SUSPENDED");
  });

  test("token untuk organizer yang tidak ada -> 401", async () => {
    const res = await call("GET", "/organizer/events", tokenFor("organizer_id", 999_999_999));
    expect(res.status).toBe(401);
  });
});

// ---------------------------------------------------------------------------
// Migration backfill order lama
// ---------------------------------------------------------------------------
describe("migrate-order-rules backfill", () => {
  test("pending tanpa expires_at -> expired; created_at NULL diisi; run kedua tidak mengubah apa pun", async () => {
    const { migrateOrderRules } = await import("../src/db/migrations/order-rules");
    const { eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();

    const insertLegacy = async (status: string, expiresAt: Date | null) => {
      const [row] = await sql<{ id: number }[]>`
        INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at)
        VALUES (${customer.id}, ${eventId}, ${categoryId}, 1, 100000, ${status}, ${expiresAt}, NULL)
        RETURNING id
      `;
      return row.id;
    };
    const expiresAt = new Date("2026-10-01T10:15:00Z");
    const pendingNoExpiry = await insertLegacy("pending_payment", null);
    const paidWithExpiry = await insertLegacy("paid", expiresAt);
    const paidNoExpiry = await insertLegacy("paid", null);

    const first = await migrateOrderRules(sql);
    expect(first.pendingWithoutExpiryExpired).toBeGreaterThanOrEqual(1);
    expect(first.createdAtBackfilled).toBeGreaterThanOrEqual(3);

    const rows = await sql<{ id: number; status: string; created_at: Date | null }[]>`
      SELECT id, status, created_at FROM orders WHERE id IN ${sql([pendingNoExpiry, paidWithExpiry, paidNoExpiry])}
    `;
    const byId = new Map(rows.map((r) => [r.id, r]));
    expect(byId.get(pendingNoExpiry)!.status).toBe("expired");
    expect(byId.get(paidWithExpiry)!.status).toBe("paid");
    expect(byId.get(paidWithExpiry)!.created_at!.toISOString()).toBe("2026-10-01T10:00:00.000Z");
    expect(byId.get(paidNoExpiry)!.created_at).not.toBeNull();
    expect(rows.every((r) => r.created_at !== null)).toBe(true);

    const second = await migrateOrderRules(sql);
    expect(second).toEqual({ pendingWithoutExpiryExpired: 0, createdAtBackfilled: 0 });
  });
});
