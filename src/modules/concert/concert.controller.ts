import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { concertService } from "./concert.service";

export const concertController = {
  list: async (c: Context<AppEnv>) =>
    respond(c)(await concertService.list(c.req.query("category"), c.req.query("q"))),
  detail: async (c: Context<AppEnv>) => respond(c)(await concertService.detail(Number(c.req.param("id")))),
};