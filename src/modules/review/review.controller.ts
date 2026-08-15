import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { reviewService } from "./review.service";
import { reviewSchema } from "./review.schema";

export const reviewController = {
  create: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof reviewSchema>>(c);
    return respond(c)(await reviewService.create(c.get("customerId"), Number(c.req.param("id")), body), 201);
  },

  list: async (c: Context<AppEnv>) => respond(c)(await reviewService.list(Number(c.req.param("id")))),
};