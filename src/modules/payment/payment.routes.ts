import { Hono } from "hono";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerAuth } from "../../middleware/auth.middleware";
import { respond } from "../../types/result";
import { paymentService } from "./payment.service";

const paymentRoutes = new Hono<AppEnv>();

paymentRoutes.post("/orders/:id/pay", customerAuth, async (c) =>
  respond(c)(await paymentService.pay(c.get("customerId"), Number(c.req.param("id"))))
);

paymentRoutes.get("/orders/:id/payment-status", customerAuth, async (c) =>
  respond(c)(await paymentService.status(c.get("customerId"), Number(c.req.param("id"))))
);

// Webhook Midtrans (Payment Notification URL). Tanpa auth: keaslian dicek lewat signature_key.
paymentRoutes.post("/payments/midtrans/notification", async (c) => {
  const body = await c.req.json().catch(() => ({}));
  return respond(c)(await paymentService.notification(body));
});

export default paymentRoutes;
