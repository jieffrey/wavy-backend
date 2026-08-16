import type { Context } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { homepageService } from "./homepage.service";

export const homepageController = {
  get: async (c: Context<AppEnv>) => respond(c)(await homepageService.get()),
};