import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { homepageController } from "./homepage.controller";

const homepageRoutes = new Hono<AppEnv>();

homepageRoutes.get("/homepage", homepageController.get);

export default homepageRoutes;