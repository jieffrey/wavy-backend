import { Hono } from "hono";
import type { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { eventSchema, ticketCategorySchema, artistSchema, verifySchema, scanSchema } from "./backoffice.schema";
import { backofficeController } from "./backoffice.controller";
import { errorBody } from "../../types/result";

// Dipasang di dalam admin.routes setelah adminAuth: semua path di sini = /api/v1/admin/...
const backofficeRoutes = new Hono<AppEnv>();

// 400 { error: { code: "VALIDATION_ERROR", message } } — bentuk sama dengan POST /orders
// dan error aturan bisnis lain, bukan ZodError mentah.
const zv = <T extends z.ZodTypeAny>(schema: T) =>
  zValidator<T, "json", AppEnv, string>("json", schema, (result, c) => {
    if (result.success) return;
    const first = result.error.issues[0];
    const field = first?.path.join(".");
    return c.json(errorBody(field ? `${field}: ${first.message}` : "invalid request body", "VALIDATION_ERROR"), 400);
  });

// Events
backofficeRoutes.get("/events", backofficeController.listEvents);
backofficeRoutes.post("/events", zv(eventSchema), backofficeController.createEvent);
backofficeRoutes.get("/events/:id", backofficeController.getEvent);
backofficeRoutes.put("/events/:id", zv(eventSchema), backofficeController.updateEvent);
backofficeRoutes.delete("/events/:id", backofficeController.deleteEvent);
backofficeRoutes.post("/events/:id/close-sales", backofficeController.closeSales);
backofficeRoutes.post("/events/:id/reopen-sales", backofficeController.reopenSales);
backofficeRoutes.post("/events/:id/publish", backofficeController.publishEvent);

// Ticket Categories
backofficeRoutes.get("/events/:id/ticket-categories", backofficeController.listCategories);
backofficeRoutes.post("/events/:id/ticket-categories", zv(ticketCategorySchema), backofficeController.createCategory);
backofficeRoutes.put("/ticket-categories/:id", zv(ticketCategorySchema), backofficeController.updateCategory);
backofficeRoutes.delete("/ticket-categories/:id", backofficeController.deleteCategory);

// Artists
backofficeRoutes.get("/artists", backofficeController.listArtists);
backofficeRoutes.post("/artists", zv(artistSchema), backofficeController.createArtist);
backofficeRoutes.put("/artists/:id", zv(artistSchema), backofficeController.updateArtist);
backofficeRoutes.delete("/artists/:id", backofficeController.deleteArtist);

// Dashboard
backofficeRoutes.get("/dashboard", backofficeController.dashboard);
backofficeRoutes.get("/dashboard/sales", backofficeController.salesSeries);

// Orders (GET /orders/recent ada di admin.routes dan didaftarkan lebih dulu)
backofficeRoutes.get("/orders", backofficeController.listOrders);
backofficeRoutes.get("/orders/:id", backofficeController.getOrder);
backofficeRoutes.post("/orders/:id/verify", zv(verifySchema), backofficeController.verifyOrder);
backofficeRoutes.post("/orders/:id/refund", backofficeController.refundOrder);
backofficeRoutes.post("/scan/validate", zv(scanSchema), backofficeController.scanValidate);

export default backofficeRoutes;
