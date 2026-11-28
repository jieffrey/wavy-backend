import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { fail, respond, validBody } from "../../types/result";
import { adminService } from "./admin.service";
import { adminLoginSchema } from "./admin.schema";

// query angka opsional: kosong -> fallback, bukan bilangan bulat -> null
const intQuery = (raw: string | undefined, fallback: number) => {
  if (raw === undefined || raw === "") return fallback;
  const n = Number(raw);
  return Number.isInteger(n) ? n : null;
};

export const adminController = {
  login: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof adminLoginSchema>>(c);
    return respond(c)(await adminService.login(body.email, body.password));
  },

  me: async (c: Context<AppEnv>) => respond(c)(await adminService.me(c.get("adminId"))),

  stats: async (c: Context<AppEnv>) => respond(c)(await adminService.stats()),

  dailyStats: async (c: Context<AppEnv>) => {
    const days = intQuery(c.req.query("days"), 30);
    if (days === null || days < 1 || days > 365) return respond(c)(fail(400, "days must be an integer between 1 and 365", "VALIDATION_ERROR"));
    return respond(c)(await adminService.dailyStats(days));
  },

  topEvents: async (c: Context<AppEnv>) => {
    const limit = intQuery(c.req.query("limit"), 5);
    if (limit === null || limit < 1 || limit > 20) return respond(c)(fail(400, "limit must be an integer between 1 and 20", "VALIDATION_ERROR"));
    return respond(c)(await adminService.topEvents(limit));
  },

  recentOrders: async (c: Context<AppEnv>) => {
    const limit = intQuery(c.req.query("limit"), 8);
    if (limit === null || limit < 1 || limit > 50) return respond(c)(fail(400, "limit must be an integer between 1 and 50", "VALIDATION_ERROR"));
    return respond(c)(await adminService.recentOrders(limit));
  },

  listCustomers: async (c: Context<AppEnv>) => respond(c)(await adminService.listCustomers()),
};