import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { notificationService } from "./notification.service";

export const notificationController = {
  list: async (c: Context<AppEnv>) => respond(c)(await notificationService.list(c.get("customerId"))),
  markRead: async (c: Context<AppEnv>) =>
    respond(c)(await notificationService.markRead(c.get("customerId"), Number(c.req.param("id")))),
};