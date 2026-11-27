import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { fail, respond, validBody } from "../../types/result";
import { adminService } from "./admin.service";
import { adminLoginSchema, organizerListQuerySchema, organizerStatusSchema } from "./admin.schema";

export const adminController = {
  login: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof adminLoginSchema>>(c);
    return respond(c)(await adminService.login(body.email, body.password));
  },

  me: async (c: Context<AppEnv>) => respond(c)(await adminService.me(c.get("adminId"))),

  stats: async (c: Context<AppEnv>) => respond(c)(await adminService.stats()),

  listOrganizers: async (c: Context<AppEnv>) => {
    const query = organizerListQuerySchema.safeParse({ status: c.req.query("status") || undefined });
    if (!query.success) return respond(c)(fail(400, "invalid status filter", "VALIDATION_ERROR"));
    return respond(c)(await adminService.listOrganizers(query.data.status));
  },

  getOrganizer: async (c: Context<AppEnv>) => {
    const id = Number(c.req.param("id"));
    if (!Number.isInteger(id) || id <= 0) return respond(c)(fail(404, "organizer not found"));
    return respond(c)(await adminService.getOrganizer(id));
  },

  setOrganizerStatus: async (c: Context<AppEnv>) => {
    const id = Number(c.req.param("id"));
    if (!Number.isInteger(id) || id <= 0) return respond(c)(fail(404, "organizer not found"));
    const { status, reason } = validBody<z.output<typeof organizerStatusSchema>>(c);
    return respond(c)(await adminService.setOrganizerStatus(id, status, reason));
  },

  listEvents: async (c: Context<AppEnv>) => respond(c)(await adminService.listEvents()),

  listCustomers: async (c: Context<AppEnv>) => respond(c)(await adminService.listCustomers()),
};