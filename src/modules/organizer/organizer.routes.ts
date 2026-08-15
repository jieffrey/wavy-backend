import { Hono } from "hono";
import type { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import type { AppEnv } from "../../middleware/auth.middleware";
import { organizerAuth } from "../../middleware/auth.middleware";
import { eventSchema, ticketCategorySchema, artistSchema, verifySchema } from "./organizer.schema";
import { organizerController } from "./organizer.controller";

const organizerRoutes = new Hono<AppEnv>();
organizerRoutes.use("*", organizerAuth);

const zv = <T extends z.ZodTypeAny>(schema: T) => zValidator<T, "json", AppEnv, string>("json", schema);

// Events
organizerRoutes.get("/events", organizerController.listEvents);
organizerRoutes.post("/events", zv(eventSchema), organizerController.createEvent);
organizerRoutes.get("/events/:id", organizerController.getEvent);
organizerRoutes.put("/events/:id", zv(eventSchema), organizerController.updateEvent);
organizerRoutes.delete("/events/:id", organizerController.deleteEvent);
organizerRoutes.post("/events/:id/close-sales", organizerController.closeSales);

// Ticket Categories
organizerRoutes.get("/events/:id/ticket-categories", organizerController.listCategories);
organizerRoutes.post("/events/:id/ticket-categories", zv(ticketCategorySchema), organizerController.createCategory);
organizerRoutes.put("/ticket-categories/:id", zv(ticketCategorySchema), organizerController.updateCategory);
organizerRoutes.delete("/ticket-categories/:id", organizerController.deleteCategory);

// Artists
organizerRoutes.get("/artists", organizerController.listArtists);
organizerRoutes.post("/artists", zv(artistSchema), organizerController.createArtist);
organizerRoutes.put("/artists/:id", zv(artistSchema), organizerController.updateArtist);
organizerRoutes.delete("/artists/:id", organizerController.deleteArtist);

// Dashboard
organizerRoutes.get("/dashboard", organizerController.dashboard);

// Orders
organizerRoutes.get("/orders", organizerController.listOrders);
organizerRoutes.post("/orders/:id/verify", zv(verifySchema), organizerController.verifyOrder);

export default organizerRoutes;