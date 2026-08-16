import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { waitingListController } from "./waitinglist.controller";

const waitingListRoutes = new Hono<AppEnv>();

waitingListRoutes.post("/concerts/:id/waiting-list", customerAuth, waitingListController.join);
waitingListRoutes.delete("/concerts/:id/waiting-list", customerAuth, waitingListController.leave);

export default waitingListRoutes;