import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { adminAuth } from "../../middleware/auth.middleware";
import { adminLoginSchema, organizerStatusSchema } from "./admin.schema";
import { adminController } from "./admin.controller";

const adminRoutes = new Hono<AppEnv>();

adminRoutes.post(
  "/login",
  zValidator<typeof adminLoginSchema, "json", AppEnv, string>("json", adminLoginSchema),
  adminController.login
);

adminRoutes.use("*", adminAuth);

adminRoutes.get("/stats", adminController.stats);
adminRoutes.get("/organizers", adminController.listOrganizers);
adminRoutes.patch(
  "/organizers/:id",
  zValidator<typeof organizerStatusSchema, "json", AppEnv, string>("json", organizerStatusSchema),
  adminController.setOrganizerStatus
);
adminRoutes.get("/events", adminController.listEvents);
adminRoutes.get("/customers", adminController.listCustomers);

export default adminRoutes;