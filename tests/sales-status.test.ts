import { describe, expect, test } from "bun:test";
import { categorySalesStatus, salesError, salesStatus } from "../src/utils/sales-status";

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
