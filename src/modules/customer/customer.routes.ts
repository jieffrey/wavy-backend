import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { errorBody } from "../../types/result";
import { createOrderSchema, profileSchema } from "./customer.schema";
import { customerController } from "./customer.controller";

const customerRoutes = new Hono<AppEnv>();

customerRoutes.post(
  "/orders",
  customerAuth,
  // 400 dengan bentuk { error: { code, message } } seperti aturan bisnis lain,
  // bukan ZodError mentah. Masalah quantity diprioritaskan karena paling sering dari UI.
  zValidator<typeof createOrderSchema, "json", AppEnv, string>("json", createOrderSchema, (result, c) => {
    if (result.success) return;
    const issues = result.error.issues;
    const qty = issues.find((i) => i.path[0] === "quantity");
    if (qty) return c.json(errorBody(qty.message, "INVALID_QUANTITY"), 400);
    const first = issues[0];
    const field = first?.path.join(".");
    return c.json(errorBody(field ? `${field}: ${first.message}` : "invalid request body", "VALIDATION_ERROR"), 400);
  }),
  customerController.createOrder
);

// didaftarkan sebelum /orders/:id supaya "history" tidak tertelan route param
customerRoutes.get("/orders/history", customerAuth, customerController.history);
customerRoutes.get("/orders/:id", customerAuth, customerController.getOrder);

customerRoutes.get("/me", customerAuth, customerController.profile);
customerRoutes.patch(
  "/me",
  customerAuth,
  // 400 { error: { code: "VALIDATION_ERROR", message, field } } supaya pesan per field terbaca di klien
  zValidator<typeof profileSchema, "json", AppEnv, string>("json", profileSchema, (result, c) => {
    if (result.success) return;
    const first = result.error.issues[0];
    const field = first?.path.join(".");
    return c.json(
      errorBody(field ? `${field}: ${first.message}` : "invalid request body", "VALIDATION_ERROR", field ? { field } : undefined),
      400
    );
  }),
  customerController.updateProfile
);
customerRoutes.get("/me/level", customerAuth, customerController.level);

export default customerRoutes;