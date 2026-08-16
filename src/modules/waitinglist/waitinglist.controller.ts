import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { waitingListService } from "./waitinglist.service";

export const waitingListController = {
  join: async (c: Context<AppEnv>) =>
    respond(c)(await waitingListService.join(c.get("customerId"), Number(c.req.param("id")))),
  leave: async (c: Context<AppEnv>) =>
    respond(c)(await waitingListService.leave(c.get("customerId"), Number(c.req.param("id")))),
};