import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { adminService } from "./admin.service";
import { adminLoginSchema, organizerStatusSchema } from "./admin.schema";

export const adminController = {
  login: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof adminLoginSchema>>(c);
    return respond(c)(await adminService.login(body.email, body.password));
  },

  stats: async (c: Context<AppEnv>) => respond(c)(await adminService.stats()),

  listOrganizers: async (c: Context<AppEnv>) => respond(c)(await adminService.listOrganizers()),

  setOrganizerStatus: async (c: Context<AppEnv>) => {
    const { status } = validBody<z.output<typeof organizerStatusSchema>>(c);
    return respond(c)(await adminService.setOrganizerStatus(Number(c.req.param("id")), status));
  },

  listEvents: async (c: Context<AppEnv>) => respond(c)(await adminService.listEvents()),

  listCustomers: async (c: Context<AppEnv>) => respond(c)(await adminService.listCustomers()),
};