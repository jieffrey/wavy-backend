import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { ticketService } from "./ticket.service";
import { transferSchema } from "./ticket.schema";

export const ticketController = {
  list: async (c: Context<AppEnv>) => respond(c)(await ticketService.list(c.get("customerId"))),
  get: async (c: Context<AppEnv>) =>
    respond(c)(await ticketService.get(c.get("customerId"), Number(c.req.param("id")))),
  transfer: async (c: Context<AppEnv>) => {
    const { to_email } = validBody<z.output<typeof transferSchema>>(c);
    return respond(c)(await ticketService.transfer(c.get("customerId"), Number(c.req.param("id")), to_email));
  },
};