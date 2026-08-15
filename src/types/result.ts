import type { Context } from "hono";
import type { ContentfulStatusCode } from "hono/utils/http-status";
import type { AppEnv } from "../middleware/auth.middleware";

export type Result<T> = { ok: true; data: T } | { ok: false; status: ContentfulStatusCode; error: string };

export const ok = <T>(data: T): Result<T> => ({ ok: true, data });

export const fail = (status: ContentfulStatusCode, error: string): Result<never> => ({ ok: false, status, error });

export const respond =
  (c: Context<AppEnv>) =>
  (r: Result<unknown>, status: ContentfulStatusCode = 200) =>
    r.ok ? c.json(r.data, status) : c.json({ error: r.error }, r.status);

// body sudah divalidasi zValidator di route; tipe dipulihkan di sini karena
// Context controller tidak membawa tipe input middleware
export const validBody = <T>(c: Context<AppEnv>) => c.req.valid("json" as never) as T;