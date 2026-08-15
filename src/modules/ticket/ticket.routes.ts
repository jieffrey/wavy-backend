import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { ticketController } from "./ticket.controller";

const ticketRoutes = new Hono<AppEnv>();

ticketRoutes.get("/tickets", customerAuth, ticketController.list);
ticketRoutes.get("/tickets/:id", customerAuth, ticketController.get);

export default ticketRoutes;