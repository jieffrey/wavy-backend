import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { reviewSchema } from "./review.schema";
import { reviewController } from "./review.controller";

const reviewRoutes = new Hono<AppEnv>();

reviewRoutes.get("/events/:id/reviews", reviewController.list);
reviewRoutes.post(
  "/events/:id/reviews",
  customerAuth,
  zValidator<typeof reviewSchema, "json", AppEnv, string>("json", reviewSchema),
  reviewController.create
);

export default reviewRoutes;