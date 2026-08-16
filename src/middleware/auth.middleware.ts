import { createMiddleware } from "hono/factory";
import type { Context } from "hono";
import jwt from "jsonwebtoken";

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

export const organizerAuth = createMiddleware<AppEnv>(async (c, next) => {
  const id = verify(c, "organizer_id");
  if (!id) return c.json({ error: "unauthorized" }, 401);
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