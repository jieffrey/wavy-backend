import type { ErrorCode } from "../types/result";

// PRD §4.1 — satu-satunya sumber status penjualan. Dipakai GET /concerts,
// GET /concerts/:id, dan POST /orders. Jangan hitung ulang di tempat lain.
export type SalesStatus = "upcoming" | "open" | "closed" | "sold_out";

export type SalesWindow = {
  status: string; // events.status: draft | published | closed
  sales_start_at: Date | null; // null = tidak ada batas awal
  sales_end_at: Date | null; // null = tidak ada batas akhir
};

// Urutan prioritas bila beberapa kondisi berlaku sekaligus: closed > upcoming > sold_out > open.
//   closed   : bukan `published` (close manual / draft) atau now >= sales_end_at
//   upcoming : now < sales_start_at
//   sold_out : total sisa kuota semua kategori = 0 (rumus di utils/quota.ts)
// `now` sebaiknya now() dari DB supaya satu jam dengan hitungan kuota & expiry.
export function salesStatus(event: SalesWindow, totalRemaining: number, now: Date): SalesStatus {
  if (event.status !== "published") return "closed";
  if (event.sales_end_at && now >= event.sales_end_at) return "closed";
  if (event.sales_start_at && now < event.sales_start_at) return "upcoming";
  if (totalRemaining <= 0) return "sold_out";
  return "open";
}

// Per kategori: sold_out kalau sisa kategori 0, selain itu ikut status event.
export const categorySalesStatus = (eventStatus: SalesStatus, remaining: number): SalesStatus =>
  remaining <= 0 ? "sold_out" : eventStatus;

// Error POST /orders untuk status selain open.
export function salesError(
  event: SalesWindow,
  status: Exclude<SalesStatus, "open">,
): { message: string; code: ErrorCode } {
  switch (status) {
    case "upcoming":
      return { message: "ticket sales have not started yet", code: "SALES_NOT_STARTED" };
    case "sold_out":
      return { message: "tickets are sold out", code: "QUOTA_EXCEEDED" };
    case "closed":
      return event.status === "published"
        ? { message: "ticket sales have ended", code: "SALES_ENDED" }
        : { message: "ticket sales are closed for this event", code: "SALES_CLOSED" };
  }
}
