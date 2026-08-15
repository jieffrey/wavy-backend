import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { loginSchema, sendOtpSchema, verifyOtpSchema } from "./auth.schema";
import { authController } from "./auth.controller";

const authRoutes = new Hono<AppEnv>();

authRoutes.post(
  "/organizer/login",
  zValidator<typeof loginSchema, "json", AppEnv, string>("json", loginSchema),
  authController.organizerLogin
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

export default authRoutes;