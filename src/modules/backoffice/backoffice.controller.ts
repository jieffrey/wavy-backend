import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { errorBody, respond, validBody } from "../../types/result";
import { backofficeService } from "./backoffice.service";
import { eventSchema, ticketCategorySchema, artistSchema, verifySchema, scanSchema } from "./backoffice.schema";

const id = (c: Context<AppEnv>) => Number(c.req.param("id"));

// query angka opsional: kosong -> undefined, bukan bilangan bulat -> null
const optionalInt = (raw: string | undefined) => {
  if (raw === undefined || raw === "") return undefined;
  const n = Number(raw);
  return Number.isInteger(n) ? n : null;
};

export const backofficeController = {
  // Events
  listEvents: async (c: Context<AppEnv>) => respond(c)(await backofficeService.listEvents()),
  getEvent: async (c: Context<AppEnv>) => respond(c)(await backofficeService.getEvent(id(c))),
  createEvent: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof eventSchema>>(c);
    return respond(c)(await backofficeService.createEvent(body), 201);
  },
  updateEvent: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof eventSchema>>(c);
    return respond(c)(await backofficeService.updateEvent(id(c), body));
  },
  deleteEvent: async (c: Context<AppEnv>) => respond(c)(await backofficeService.deleteEvent(id(c))),
  closeSales: async (c: Context<AppEnv>) => respond(c)(await backofficeService.closeSales(id(c))),
  reopenSales: async (c: Context<AppEnv>) => respond(c)(await backofficeService.reopenSales(id(c))),
  publishEvent: async (c: Context<AppEnv>) => respond(c)(await backofficeService.publishEvent(id(c))),

  // Ticket Categories
  listCategories: async (c: Context<AppEnv>) => respond(c)(await backofficeService.listCategories(id(c))),
  createCategory: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof ticketCategorySchema>>(c);
    return respond(c)(await backofficeService.createCategory(id(c), body), 201);
  },
  updateCategory: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof ticketCategorySchema>>(c);
    return respond(c)(await backofficeService.updateCategory(id(c), body));
  },
  deleteCategory: async (c: Context<AppEnv>) => respond(c)(await backofficeService.deleteCategory(id(c))),

  // Artists
  listArtists: async (c: Context<AppEnv>) => respond(c)(await backofficeService.listArtists()),
  createArtist: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof artistSchema>>(c);
    return respond(c)(await backofficeService.createArtist(body), 201);
  },
  updateArtist: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof artistSchema>>(c);
    return respond(c)(await backofficeService.updateArtist(id(c), body));
  },
  deleteArtist: async (c: Context<AppEnv>) => respond(c)(await backofficeService.deleteArtist(id(c))),

  // Dashboard (opsional ?event_id= untuk satu event)
  dashboard: async (c: Context<AppEnv>) => {
    const eventId = optionalInt(c.req.query("event_id"));
    if (eventId === null) return c.json(errorBody("event_id must be an integer", "VALIDATION_ERROR"), 400);
    return respond(c)(await backofficeService.dashboard(eventId));
  },
  salesSeries: async (c: Context<AppEnv>) => {
    const rawDays = optionalInt(c.req.query("days"));
    const days = rawDays === undefined ? 30 : rawDays;
    if (days === null || days < 1 || days > 365)
      return c.json(errorBody("days must be an integer between 1 and 365", "VALIDATION_ERROR"), 400);
    const eventId = optionalInt(c.req.query("event_id"));
    if (eventId === null) return c.json(errorBody("event_id must be an integer", "VALIDATION_ERROR"), 400);
    return respond(c)(await backofficeService.salesSeries(days, eventId));
  },

  // Orders
  listOrders: async (c: Context<AppEnv>) => {
    const eventId = optionalInt(c.req.query("event_id"));
    if (eventId === null) return c.json(errorBody("event_id must be an integer", "VALIDATION_ERROR"), 400);
    const status = c.req.query("status") || undefined;
    return respond(c)(await backofficeService.listOrders({ status, eventId }));
  },
  getOrder: async (c: Context<AppEnv>) => {
    if (!Number.isInteger(id(c))) return c.json({ error: "order not found" }, 404);
    return respond(c)(await backofficeService.getOrder(id(c)));
  },
  verifyOrder: async (c: Context<AppEnv>) => {
    const { approve } = validBody<z.output<typeof verifySchema>>(c);
    return respond(c)(await backofficeService.verifyOrder(id(c), approve));
  },
  refundOrder: async (c: Context<AppEnv>) => respond(c)(await backofficeService.refundOrder(id(c))),

  scanValidate: async (c: Context<AppEnv>) => {
    const { qr_code } = validBody<z.output<typeof scanSchema>>(c);
    return respond(c)(await backofficeService.scanValidate(qr_code));
  },
};
