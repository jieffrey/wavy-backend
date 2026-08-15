import { Hono } from "hono";
import authRoutes from "./routes/auth.routes";
import organizerRoutes from "./routes/organizer.routes";
import customerRoutes from "./routes/customer.routes";

const app = new Hono();

app.get("/health", (c) => c.json({ status: "ok" }));

app.route("/api/v1/auth", authRoutes);
app.route("/api/v1/organizer", organizerRoutes);
app.route("/api/v1", customerRoutes);

export default {
  port: Number(process.env.PORT) || 8080,
  fetch: app.fetch,
};