import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { concertController } from "./concert.controller";

const concertRoutes = new Hono<AppEnv>();

concertRoutes.get("/concerts", concertController.list);
concertRoutes.get("/concerts/:id", concertController.detail);

export default concertRoutes;