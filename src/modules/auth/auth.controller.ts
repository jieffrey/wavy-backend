import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { authService } from "./auth.service";
import { loginSchema, sendOtpSchema, verifyOtpSchema } from "./auth.schema";

export const authController = {
  organizerLogin: async (c: Context<AppEnv>) => {
    const { email, password } = validBody<z.output<typeof loginSchema>>(c);
    return respond(c)(await authService.organizerLogin(email, password));
  },

  sendOtp: async (c: Context<AppEnv>) => {
    const { email } = validBody<z.output<typeof sendOtpSchema>>(c);
    return respond(c)(await authService.sendOtp(email));
  },

  verifyOtp: async (c: Context<AppEnv>) => {
    const { email, code } = validBody<z.output<typeof verifyOtpSchema>>(c);
    return respond(c)(await authService.verifyOtp(email, code));
  },
};