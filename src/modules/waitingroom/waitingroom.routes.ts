import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { waitingRoomController } from "./waitingroom.controller";

const waitingRoomRoutes = new Hono<AppEnv>();

waitingRoomRoutes.post("/concerts/:id/waiting-room", customerAuth, waitingRoomController.join);
waitingRoomRoutes.get("/concerts/:id/waiting-room", customerAuth, waitingRoomController.status);

export default waitingRoomRoutes;