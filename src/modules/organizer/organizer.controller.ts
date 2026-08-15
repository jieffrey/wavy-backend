import type { Context } from "hono";
import type { z } from "zod";
import type { AppEnv } from "../../middleware/auth.middleware";
import { respond, validBody } from "../../types/result";
import { organizerService } from "./organizer.service";
import { eventSchema, ticketCategorySchema, artistSchema, verifySchema, scanSchema } from "./organizer.schema";

const orgId = (c: Context<AppEnv>) => c.get("organizerId");
const id = (c: Context<AppEnv>) => Number(c.req.param("id"));

export const organizerController = {
  // Events
  listEvents: async (c: Context<AppEnv>) => respond(c)(await organizerService.listEvents(orgId(c))),
  getEvent: async (c: Context<AppEnv>) => respond(c)(await organizerService.getEvent(orgId(c), id(c))),
  createEvent: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof eventSchema>>(c);
    return respond(c)(await organizerService.createEvent(orgId(c), body), 201);
  },
  updateEvent: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof eventSchema>>(c);
    return respond(c)(await organizerService.updateEvent(orgId(c), id(c), body));
  },
  deleteEvent: async (c: Context<AppEnv>) => respond(c)(await organizerService.deleteEvent(orgId(c), id(c))),
  closeSales: async (c: Context<AppEnv>) => respond(c)(await organizerService.closeSales(orgId(c), id(c))),
  publishEvent: async (c: Context<AppEnv>) => respond(c)(await organizerService.publishEvent(orgId(c), id(c))),

  // Ticket Categories
  listCategories: async (c: Context<AppEnv>) => respond(c)(await organizerService.listCategories(orgId(c), id(c))),
  createCategory: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof ticketCategorySchema>>(c);
    return respond(c)(await organizerService.createCategory(orgId(c), id(c), body), 201);
  },
  updateCategory: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof ticketCategorySchema>>(c);
    return respond(c)(await organizerService.updateCategory(orgId(c), id(c), body));
  },
  deleteCategory: async (c: Context<AppEnv>) => respond(c)(await organizerService.deleteCategory(orgId(c), id(c))),

  // Artists
  listArtists: async (c: Context<AppEnv>) => respond(c)(await organizerService.listArtists(orgId(c))),
  createArtist: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof artistSchema>>(c);
    return respond(c)(await organizerService.createArtist(orgId(c), body), 201);
  },
  updateArtist: async (c: Context<AppEnv>) => {
    const body = validBody<z.output<typeof artistSchema>>(c);
    return respond(c)(await organizerService.updateArtist(orgId(c), id(c), body));
  },
  deleteArtist: async (c: Context<AppEnv>) => respond(c)(await organizerService.deleteArtist(orgId(c), id(c))),

  // Dashboard
  dashboard: async (c: Context<AppEnv>) => respond(c)(await organizerService.dashboard(orgId(c))),

  // Orders
  listOrders: async (c: Context<AppEnv>) => respond(c)(await organizerService.listOrders(orgId(c), c.req.query("status"))),
  verifyOrder: async (c: Context<AppEnv>) => {
    const { approve } = validBody<z.output<typeof verifySchema>>(c);
    return respond(c)(await organizerService.verifyOrder(orgId(c), id(c), approve));
  },

  scanValidate: async (c: Context<AppEnv>) => {
    const { qr_code } = validBody<z.output<typeof scanSchema>>(c);
    return respond(c)(await organizerService.scanValidate(orgId(c), qr_code));
  },
};