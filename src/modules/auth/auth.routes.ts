import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { customerRegisterSchema, loginSchema, organizerRegisterSchema, sendOtpSchema, verifyOtpSchema, verifyOrganizerEmailSchema } from "./auth.schema";
import { authController } from "./auth.controller";
import { errorBody } from "../../types/result";

const authRoutes = new Hono<AppEnv>();

authRoutes.post(
  "/organizer/login",
  zValidator<typeof loginSchema, "json", AppEnv, string>("json", loginSchema),
  authController.organizerLogin
);
authRoutes.post(
  "/organizer/register",
  zValidator<typeof organizerRegisterSchema, "json", AppEnv, string>("json", organizerRegisterSchema),
  authController.organizerRegister
);
authRoutes.post(
  "/register",
  // 400 { error: { code: "VALIDATION_ERROR", message, field } } supaya pesan per field terbaca di klien
  zValidator<typeof customerRegisterSchema, "json", AppEnv, string>("json", customerRegisterSchema, (result, c) => {
    if (result.success) return;
    const first = result.error.issues[0];
    const field = first?.path.join(".");
    return c.json(
      field
        ? { error: { code: "VALIDATION_ERROR", message: `${field}: ${first.message}`, field } }
        : errorBody("invalid request body", "VALIDATION_ERROR"),
      400
    );
  }),
  authController.registerCustomer
);
authRoutes.post(
  "/send-otp",
  zValidator<typeof sendOtpSchema, "json", AppEnv, string>("json", sendOtpSchema),
  authController.sendOtp
);
authRoutes.post(
  "/verify-otp",
  zValidator<typeof verifyOtpSchema, "json", AppEnv, string>("json", verifyOtpSchema),
  authController.verifyOtp
);
authRoutes.post(
  "/organizer/verify-email",
  zValidator<typeof verifyOrganizerEmailSchema, "json", AppEnv, string>("json", verifyOrganizerEmailSchema),
  authController.verifyOrganizerEmail
);

export default authRoutes;