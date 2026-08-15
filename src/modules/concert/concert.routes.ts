import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { concertController } from "./concert.controller";

const concertRoutes = new Hono<AppEnv>();

concertRoutes.get("/concerts", concertController.list);
concertRoutes.get("/concerts/:id", concertController.detail);
concertRoutes.post("/concerts/:id/notify-me", customerAuth, concertController.notifyMe);
concertRoutes.delete("/concerts/:id/notify-me", customerAuth, concertController.cancelNotifyMe);

export default concertRoutes;