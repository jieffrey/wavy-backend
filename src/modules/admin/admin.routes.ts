import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { adminAuth } from "../../middleware/auth.middleware";
import { adminLoginSchema, organizerStatusSchema } from "./admin.schema";
import { adminController } from "./admin.controller";
import { errorBody } from "../../types/result";

const adminRoutes = new Hono<AppEnv>();

adminRoutes.post(
  "/login",
  zValidator<typeof adminLoginSchema, "json", AppEnv, string>("json", adminLoginSchema),
  adminController.login
);

adminRoutes.use("*", adminAuth);

adminRoutes.get("/me", adminController.me);
adminRoutes.get("/stats", adminController.stats);
adminRoutes.get("/stats/daily", adminController.dailyStats);
adminRoutes.get("/stats/top-events", adminController.topEvents);
adminRoutes.get("/orders/recent", adminController.recentOrders);
adminRoutes.get("/organizers", adminController.listOrganizers);
adminRoutes.get("/organizers/:id", adminController.getOrganizer);
adminRoutes.patch(
  "/organizers/:id",
  // 400 { error: { code: "VALIDATION_ERROR", message } } supaya pesan per field terbaca di frontend
  zValidator<typeof organizerStatusSchema, "json", AppEnv, string>("json", organizerStatusSchema, (result, c) => {
    if (result.success) return;
    const first = result.error.issues[0];
    const field = first?.path.join(".");
    return c.json(
      errorBody(field ? `${field}: ${first.message}` : "invalid request body", "VALIDATION_ERROR", field ? { field } : undefined),
      400
    );
  }),
  adminController.setOrganizerStatus
);
adminRoutes.get("/events", adminController.listEvents);
adminRoutes.get("/customers", adminController.listCustomers);

export default adminRoutes;