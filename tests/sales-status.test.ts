import { describe, expect, test } from "bun:test";
import { categorySalesStatus, salesError, salesStatus } from "../src/utils/sales-status";
import { call, createCustomer, createEventWithCategory, insertPendingOrder, orderBody, sql } from "./helpers";

const now = new Date("2026-11-20T12:00:00Z");
const at = (m: number) => new Date(now.getTime() + m * 60_000);
const ev = (o: { status?: string; start?: Date | null; end?: Date | null } = {}) => ({
  status: o.status ?? "published",
  sales_start_at: o.start ?? null,
  sales_end_at: o.end ?? null,
});

describe("salesStatus", () => {
  test("upcoming: sebelum sales_start_at", () => {
    expect(salesStatus(ev({ start: at(1) }), 10, now)).toBe("upcoming");
  });

  test("open: di dalam tenggat, atau tanpa batas (null)", () => {
    expect(salesStatus(ev({ start: at(-10), end: at(10) }), 10, now)).toBe("open");
    expect(salesStatus(ev(), 10, now)).toBe("open");
    expect(salesStatus(ev({ start: now }), 10, now)).toBe("open"); // start inklusif
  });

  test("closed: di-close manual, draft, atau sales_end_at sudah lewat", () => {
    expect(salesStatus(ev({ status: "closed" }), 10, now)).toBe("closed");
    expect(salesStatus(ev({ status: "draft" }), 10, now)).toBe("closed");
    expect(salesStatus(ev({ end: at(-1) }), 10, now)).toBe("closed");
    expect(salesStatus(ev({ end: now }), 10, now)).toBe("closed"); // end eksklusif
  });

  test("sold_out: sisa kuota semua kategori 0", () => {
    expect(salesStatus(ev(), 0, now)).toBe("sold_out");
  });

  test("prioritas: closed > upcoming > sold_out", () => {
    expect(salesStatus(ev({ status: "closed", start: at(10) }), 0, now)).toBe("closed");
    expect(salesStatus(ev({ end: at(-1) }), 0, now)).toBe("closed");
    expect(salesStatus(ev({ start: at(10) }), 0, now)).toBe("upcoming");
  });
});

describe("categorySalesStatus", () => {
  test("sold_out kalau remaining 0, selain itu ikut status event", () => {
    expect(categorySalesStatus("open", 0)).toBe("sold_out");
    expect(categorySalesStatus("open", 3)).toBe("open");
    expect(categorySalesStatus("upcoming", 3)).toBe("upcoming");
    expect(categorySalesStatus("closed", 3)).toBe("closed");
  });
});

describe("salesError", () => {
  test("kode error POST /orders per status", () => {
    expect(salesError(ev(), "upcoming").code).toBe("SALES_NOT_STARTED");
    expect(salesError(ev(), "sold_out").code).toBe("QUOTA_EXCEEDED");
    expect(salesError(ev({ end: at(-1) }), "closed").code).toBe("SALES_ENDED");
    expect(salesError(ev({ status: "closed" }), "closed").code).toBe("SALES_CLOSED");
  });
});

const minutesFromNow = (m: number) => new Date(Date.now() + m * 60_000);

// ---------------------------------------------------------------------------
// sales_status di GET /concerts & GET /concerts/:id (sumber: utils/sales-status.ts)
// ---------------------------------------------------------------------------
describe("sales_status di daftar & detail konser", () => {
  const addCategory = async (eventId: number, quota: number) =>
    (
      await sql<{ id: number }[]>`
        INSERT INTO ticket_categories (event_id, name, price, quota, sold)
        VALUES (${eventId}, 'VIP', 200000, ${quota}, 0) RETURNING id
      `
    )[0].id;
  const fromList = async (eventId: number) =>
    (await call("GET", "/concerts")).body.find((e: any) => e.id === eventId);

  test("upcoming: sebelum sales_start_at; tenggat ikut dikirim", async () => {
    const start = minutesFromNow(60);
    const end = minutesFromNow(120);
    const { eventId } = await createEventWithCategory({ salesStartAt: start, salesEndAt: end });

    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.status).toBe(200);
    expect(detail.body.sales_status).toBe("upcoming");
    expect(new Date(detail.body.sales_start_at).getTime()).toBe(start.getTime());
    expect(new Date(detail.body.sales_end_at).getTime()).toBe(end.getTime());
    expect(detail.body.ticket_categories[0].sales_status).toBe("upcoming");
    expect(detail.body).not.toHaveProperty("now");

    const item = await fromList(eventId);
    expect(item.sales_status).toBe("upcoming");
    expect(new Date(item.sales_start_at).getTime()).toBe(start.getTime());
    expect(new Date(item.sales_end_at).getTime()).toBe(end.getTime());
    expect(item).not.toHaveProperty("now");
  });

  test("open: tanpa batas (null) dan kuota masih ada", async () => {
    const { eventId } = await createEventWithCategory();
    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.body.sales_status).toBe("open");
    expect(detail.body.sales_start_at).toBeNull();
    expect(detail.body.sales_end_at).toBeNull();
    expect(detail.body.ticket_categories[0].sales_status).toBe("open");
    expect((await fromList(eventId)).sales_status).toBe("open");
  });

  test("closed: sales_end_at sudah lewat; POST /orders -> SALES_ENDED", async () => {
    const { eventId, categoryId } = await createEventWithCategory({
      salesStartAt: minutesFromNow(-120),
      salesEndAt: minutesFromNow(-1),
    });
    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.body.sales_status).toBe("closed");
    expect(detail.body.ticket_categories[0].sales_status).toBe("closed");
    expect((await fromList(eventId)).sales_status).toBe("closed");

    const customer = await createCustomer();
    const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(res.body.error.code).toBe("SALES_ENDED");
  });

  test("sold_out: kategori habis -> kategori sold_out; semua habis -> event sold_out & POST /orders ditolak", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ quota: 2, sold: 2 });
    const vipId = await addCategory(eventId, 1);

    const partly = await call("GET", `/concerts/${eventId}`);
    expect(partly.body.sales_status).toBe("open");
    const byId = new Map(partly.body.ticket_categories.map((c: any) => [c.id, c.sales_status]));
    expect(byId.get(categoryId)).toBe("sold_out");
    expect(byId.get(vipId)).toBe("open");

    const customer = await createCustomer();
    const soldOutCat = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId));
    expect(soldOutCat.status).toBe(409);
    expect(soldOutCat.body.error.code).toBe("QUOTA_EXCEEDED");

    // pending aktif menghabiskan kategori terakhir
    await insertPendingOrder(customer.id, eventId, vipId, 1, 10);
    const all = await call("GET", `/concerts/${eventId}`);
    expect(all.body.sales_status).toBe("sold_out");
    expect(all.body.ticket_categories.every((c: any) => c.sales_status === "sold_out")).toBe(true);
    expect((await fromList(eventId)).sales_status).toBe("sold_out");

    const other = await createCustomer();
    const res = await call("POST", "/orders", other.token, orderBody(eventId, vipId));
    expect(res.status).toBe(409);
    expect(res.body.error.code).toBe("QUOTA_EXCEEDED");
  });

  test("event di-close manual: detail tetap 200 dengan sales_status closed, dan muncul di daftar sebagai closed", async () => {
    const { organizer, eventId } = await createEventWithCategory();
    const closed = await call("POST", `/organizer/events/${eventId}/close-sales`, organizer.token);
    expect(closed.status).toBe(200);

    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.status).toBe(200);
    expect(detail.body.status).toBe("closed");
    expect(detail.body.sales_status).toBe("closed");
    expect(detail.body.ticket_categories[0].sales_status).toBe("closed");
    expect((await fromList(eventId)).sales_status).toBe("closed");
  });

  test("event draft tetap 404 di detail", async () => {
    const { eventId } = await createEventWithCategory({ status: "draft" });
    const detail = await call("GET", `/concerts/${eventId}`);
    expect(detail.status).toBe(404);
  });
});

describe("GET /concerts menyembunyikan draft", () => {
  test("event draft tidak muncul di daftar", async () => {
    const { eventId } = await createEventWithCategory({ status: "draft" });
    const list = await call("GET", "/concerts");
    expect(list.body.find((e: any) => e.id === eventId)).toBeUndefined();
  });
});
