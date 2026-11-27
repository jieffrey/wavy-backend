import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { favoriteService } from "./favorite.service";

const cid = (c: Context<AppEnv>) => c.get("customerId");
const id = (c: Context<AppEnv>) => Number(c.req.param("id"));

export const favoriteController = {
  list: async (c: Context<AppEnv>) => respond(c)(await favoriteService.list(cid(c))),
  followArtist: async (c: Context<AppEnv>) => respond(c)(await favoriteService.followArtist(cid(c), id(c))),
  unfollowArtist: async (c: Context<AppEnv>) => respond(c)(await favoriteService.unfollowArtist(cid(c), id(c))),
};