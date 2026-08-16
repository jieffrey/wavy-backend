import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { waitingRoomService } from "./waitingroom.service";

export const waitingRoomController = {
  join: async (c: Context<AppEnv>) =>
    respond(c)(await waitingRoomService.join(c.get("customerId"), Number(c.req.param("id")))),
  status: async (c: Context<AppEnv>) =>
    respond(c)(await waitingRoomService.status(c.get("customerId"), Number(c.req.param("id")))),
};