import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { adminAuth } from "../../middleware/auth.middleware";
import { adminLoginSchema } from "./admin.schema";
import { adminController } from "./admin.controller";
import backofficeRoutes from "../backoffice/backoffice.routes";

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
adminRoutes.get("/customers", adminController.listCustomers);

// event, kategori tiket, artis, order, scan, dashboard (dulu Creator Studio EO)
adminRoutes.route("/", backofficeRoutes);

export default adminRoutes;