import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { createOrderSchema } from "./customer.schema";
import { customerController } from "./customer.controller";

const customerRoutes = new Hono<AppEnv>();

customerRoutes.post(
  "/orders",
  customerAuth,
  zValidator<typeof createOrderSchema, "json", AppEnv, string>("json", createOrderSchema),
  customerController.createOrder
);

// didaftarkan sebelum /orders/:id supaya "history" tidak tertelan route param
customerRoutes.get("/orders/history", customerAuth, customerController.history);
customerRoutes.get("/orders/:id", customerAuth, customerController.getOrder);

export default customerRoutes;