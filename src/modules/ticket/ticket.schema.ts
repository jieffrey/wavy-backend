import { z } from "zod";

export const transferSchema = z.object({ to_email: z.string().email() });