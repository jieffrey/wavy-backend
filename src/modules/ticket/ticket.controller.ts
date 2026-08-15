import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { ticketService } from "./ticket.service";

export const ticketController = {
  list: async (c: Context<AppEnv>) => respond(c)(await ticketService.list(c.get("customerId"))),
  get: async (c: Context<AppEnv>) =>
    respond(c)(await ticketService.get(c.get("customerId"), Number(c.req.param("id")))),
};