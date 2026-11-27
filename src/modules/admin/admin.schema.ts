import { z } from "zod";

export const adminLoginSchema = z.object({ email: z.string().email(), password: z.string() });

// Transisi yang sah ditegakkan di admin.service (setOrganizerStatus).
// rejected wajib membawa alasan; alasan dikirim ke organizer lewat email & ditampilkan saat login.
export const organizerStatusSchema = z
  .object({
    status: z.enum(["active", "suspended", "rejected"]),
    reason: z.string().trim().max(500).optional(),
  })
  .refine((b) => b.status !== "rejected" || (b.reason?.length ?? 0) >= 10, {
    path: ["reason"],
    message: "reason wajib diisi minimal 10 karakter saat menolak organizer",
  });

export const organizerListQuerySchema = z.object({
  status: z.enum(["active", "suspended", "pending_verification", "rejected"]).optional(),
});
