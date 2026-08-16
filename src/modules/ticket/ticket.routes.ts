import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { ticketController } from "./ticket.controller";
import { transferSchema } from "./ticket.schema";

const ticketRoutes = new Hono<AppEnv>();

ticketRoutes.get("/tickets", customerAuth, ticketController.list);
ticketRoutes.get("/tickets/:id", customerAuth, ticketController.get);
ticketRoutes.post(
  "/tickets/:id/transfer",
  customerAuth,
  zValidator<typeof transferSchema, "json", AppEnv, string>("json", transferSchema),
  ticketController.transfer
);

export default ticketRoutes;