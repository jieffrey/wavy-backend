import { Hono } from "hono";
import { cors } from "hono/cors";
import authRoutes from "./modules/auth/auth.routes";
import organizerRoutes from "./modules/organizer/organizer.routes";
import customerRoutes from "./modules/customer/customer.routes";
import concertRoutes from "./modules/concert/concert.routes";
import ticketRoutes from "./modules/ticket/ticket.routes";
import reviewRoutes from "./modules/review/review.routes";
import favoriteRoutes from "./modules/favorite/favorite.routes";
import notificationRoutes from "./modules/notification/notification.routes";
import homepageRoutes from "./modules/homepage/homepage.routes";
import adminRoutes from "./modules/admin/admin.routes";
import waitingRoomRoutes from "./modules/waitingroom/waitingroom.routes";
import waitingListRoutes from "./modules/waitinglist/waitinglist.routes";

const app = new Hono();

app.use(
  "*",
  cors({
    origin: ["http://localhost:3000", "http://localhost:3001"],
    allowHeaders: ["Content-Type", "Authorization"],
    allowMethods: ["POST", "GET", "PUT", "PATCH", "DELETE", "OPTIONS"],
    credentials: true,
  }),
);

app.get("/health", (c) => c.json({ status: "ok" }));

app.route("/api/v1/auth", authRoutes);
app.route("/api/v1/organizer", organizerRoutes);
app.route("/api/v1", customerRoutes);
app.route("/api/v1", concertRoutes);
app.route("/api/v1", ticketRoutes);
app.route("/api/v1", reviewRoutes);
app.route("/api/v1", favoriteRoutes);
app.route("/api/v1", notificationRoutes);
app.route("/api/v1", homepageRoutes);
app.route("/api/v1/admin", adminRoutes);
app.route("/api/v1", waitingRoomRoutes);
app.route("/api/v1", waitingListRoutes);

export default {
  port: Number(process.env.PORT) || 1420,
  fetch: app.fetch,
};
