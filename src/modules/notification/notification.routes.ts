import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { notificationController } from "./notification.controller";

const notificationRoutes = new Hono<AppEnv>();

notificationRoutes.get("/notifications", customerAuth, notificationController.list);
notificationRoutes.post("/notifications/:id/read", customerAuth, notificationController.markRead);

export default notificationRoutes;