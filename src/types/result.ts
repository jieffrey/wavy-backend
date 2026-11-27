import type { Context } from "hono";
import type { ContentfulStatusCode } from "hono/utils/http-status";
import type { AppEnv } from "../middleware/auth.middleware";

// Kode error aturan bisnis (PRD §4) yang dibaca frontend.
// Respons: { error: { code, message } }. Error lain tetap { error: "pesan" }.
export type ErrorCode =
  | "SALES_CLOSED"
  | "SALES_NOT_STARTED"
  | "SALES_ENDED"
  | "QUOTA_EXCEEDED"
  | "ORDER_EXPIRED"
  | "ORGANIZER_SUSPENDED"
  | "EMAIL_REGISTERED"
  | "INVALID_QUANTITY"
  | "VALIDATION_ERROR"
  | "NO_TICKET_CATEGORY"
  | "QUOTA_BELOW_RESERVED"
  | "CATEGORY_HAS_ORDERS"
  | "EVENT_HAS_ORDERS"
  | "INVALID_QR"
  | "QR_EXPIRED"
  | "TICKET_NOT_FOUND"
  | "WRONG_ORGANIZER"
  | "ALREADY_SCANNED"
  | "EVENT_ENDED"
  | "PAYMENT_NOT_CONFIGURED"
  | "ORDER_NOT_PENDING"
  | "PAYMENT_GATEWAY_ERROR"
  | "INVALID_SIGNATURE";

export type Result<T> =
  | { ok: true; data: T }
  | { ok: false; status: ContentfulStatusCode; error: string; code?: ErrorCode };

export const ok = <T>(data: T): Result<T> => ({ ok: true, data });

export const fail = (status: ContentfulStatusCode, error: string, code?: ErrorCode): Result<never> => ({
  ok: false,
  status,
  error,
  code,
});

export const errorBody = (message: string, code?: ErrorCode) =>
  code ? { error: { code, message } } : { error: message };

export const respond =
  (c: Context<AppEnv>) =>
  (r: Result<unknown>, status: ContentfulStatusCode = 200) =>
    r.ok ? c.json(r.data, status) : c.json(errorBody(r.error, r.code), r.status);

// body sudah divalidasi zValidator di route; tipe dipulihkan di sini karena
// Context controller tidak membawa tipe input middleware
export const validBody = <T>(c: Context<AppEnv>) => c.req.valid("json" as never) as T;
