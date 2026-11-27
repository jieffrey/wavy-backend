import type { Context } from "hono";
import type { ContentfulStatusCode } from "hono/utils/http-status";
import type { AppEnv } from "../middleware/auth.middleware";

// Kode error aturan bisnis (PRD §4) yang dibaca frontend.
// Respons: { error: { code, message, ...details } }. Error lain tetap { error: "pesan" }.
// details = data tambahan untuk kode tertentu (mis. field pada VALIDATION_ERROR).
export type ErrorCode =
  | "SALES_CLOSED"
  | "SALES_NOT_STARTED"
  | "SALES_ENDED"
  | "QUOTA_EXCEEDED"
  | "ORDER_EXPIRED"
  | "EVENT_NOT_CLOSED"
  | "ARTIST_HAS_EVENTS"
  | "INVALID_QUANTITY"
  | "VALIDATION_ERROR"
  | "NO_TICKET_CATEGORY"
  | "QUOTA_BELOW_RESERVED"
  | "CATEGORY_HAS_ORDERS"
  | "EVENT_HAS_ORDERS"
  | "INVALID_QR"
  | "QR_EXPIRED"
  | "TICKET_NOT_FOUND"
  | "ALREADY_SCANNED"
  | "EVENT_ENDED"
  | "PAYMENT_NOT_CONFIGURED"
  | "ORDER_NOT_PENDING"
  | "PAYMENT_GATEWAY_ERROR"
  | "INVALID_SIGNATURE";

export type Result<T> =
  | { ok: true; data: T }
  | { ok: false; status: ContentfulStatusCode; error: string; code?: ErrorCode; details?: Record<string, unknown> };

export const ok = <T>(data: T): Result<T> => ({ ok: true, data });

export const fail = (
  status: ContentfulStatusCode,
  error: string,
  code?: ErrorCode,
  details?: Record<string, unknown>
): Result<never> => ({
  ok: false,
  status,
  error,
  code,
  ...(details ? { details } : {}),
});

export const errorBody = (message: string, code?: ErrorCode, details?: Record<string, unknown>) =>
  code ? { error: { ...details, code, message } } : { error: message };

export const respond =
  (c: Context<AppEnv>) =>
  (r: Result<unknown>, status: ContentfulStatusCode = 200) =>
    r.ok ? c.json(r.data, status) : c.json(errorBody(r.error, r.code, r.details), r.status);

// body sudah divalidasi zValidator di route; tipe dipulihkan di sini karena
// Context controller tidak membawa tipe input middleware
export const validBody = <T>(c: Context<AppEnv>) => c.req.valid("json" as never) as T;
