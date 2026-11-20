import { createMiddleware } from "hono/factory";
import type { Context } from "hono";
import jwt from "jsonwebtoken";
import { sql } from "../db/client";
import { errorBody } from "../types/result";

export type AppEnv = { Variables: { organizerId: number; customerId: number; adminId: number } };

const readToken = (c: Context<AppEnv>) => {
  const auth = c.req.header("Authorization");
  return auth?.startsWith("Bearer ") ? auth.slice(7) : null;
};

const verify = (c: Context<AppEnv>, claim: string) => {
  const token = readToken(c);
  if (!token) return null;
  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET!) as Record<string, unknown>;
    return payload[claim] as number | undefined;
  } catch {
    return null;
  }
};

// PRD §4.5: status organizer dicek ke DB tiap request, jadi suspend berlaku
// seketika walaupun JWT-nya masih valid.
export const organizerAuth = createMiddleware<AppEnv>(async (c, next) => {
  const id = verify(c, "organizer_id");
  if (!id) return c.json({ error: "unauthorized" }, 401);
  const [organizer] = await sql<{ status: string }[]>`SELECT status FROM organizers WHERE id = ${id}`;
  if (!organizer) return c.json({ error: "unauthorized" }, 401);
  if (organizer.status === "suspended")
    return c.json(errorBody("organizer account is suspended", "ORGANIZER_SUSPENDED"), 403);
  c.set("organizerId", id);
  await next();
});

export const customerAuth = createMiddleware<AppEnv>(async (c, next) => {
  const id = verify(c, "customer_id");
  if (!id) return c.json({ error: "unauthorized" }, 401);
  c.set("customerId", id);
  await next();
});

export const adminAuth = createMiddleware<AppEnv>(async (c, next) => {
  const id = verify(c, "admin_id");
  if (!id) return c.json({ error: "unauthorized" }, 401);
  c.set("adminId", id);
  await next();
});