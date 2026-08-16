import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { customerService } from "./customer.service";
import { createOrderSchema } from "./customer.schema";

export const customerController = {
  createOrder: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof createOrderSchema>>(c);
    return respond(c)(await customerService.createOrder(c.get("customerId"), body), 201);
  },

  getOrder: async (c: Context<AppEnv>) =>
    respond(c)(await customerService.getOrder(c.get("customerId"), Number(c.req.param("id")))),

  history: async (c: Context<AppEnv>) => respond(c)(await customerService.history(c.get("customerId"))),

  level: async (c: Context<AppEnv>) => respond(c)(await customerService.level(c.get("customerId"))),
};