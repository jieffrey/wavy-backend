import { Hono } from "hono";
import authRoutes from "./modules/auth/auth.routes";
import organizerRoutes from "./modules/organizer/organizer.routes";
import customerRoutes from "./modules/customer/customer.routes";

const app = new Hono();

app.get("/health", (c) => c.json({ status: "ok" }));

app.route("/api/v1/auth", authRoutes);
app.route("/api/v1/organizer", organizerRoutes);
app.route("/api/v1", customerRoutes);

export default {
  port: Number(process.env.PORT) || 8080,
  fetch: app.fetch,
};