import jwt from "jsonwebtoken";
import { sql } from "../src/db/client";
import server from "../src/index";

const uniq = () => `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;

export const tokenFor = (claim: "customer_id" | "admin_id", id: number) =>
  jwt.sign({ [claim]: id }, process.env.JWT_SECRET!, { expiresIn: "1h" });

export async function call(method: string, path: string, token?: string, body?: unknown) {
  const res = await server.fetch(
    new Request(`http://wavy.test/api/v1${path}`, {
      method,
      headers: {
        "Content-Type": "application/json",
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
      },
      body: body === undefined ? undefined : JSON.stringify(body),
    })
  );
  const json = (await res.json().catch(() => null)) as any;
  return { status: res.status, body: json };
}

// admin pengelola event (event & artis milik platform, tidak ada lagi organizer)
export async function createAdmin() {
  const [admin] = await sql<{ id: number }[]>`
    INSERT INTO admins (name, email, password) VALUES ('Admin Test', ${`admin-${uniq()}@test.local`}, 'x')
    RETURNING id
  `;
  return { id: admin.id, token: tokenFor("admin_id", admin.id) };
}

export async function createCustomer() {
  const [cust] = await sql<{ id: number }[]>`
    INSERT INTO customers (email) VALUES (${`cust-${uniq()}@test.local`}) RETURNING id
  `;
  return { id: cust.id, token: tokenFor("customer_id", cust.id) };
}

type EventOpts = {
  quota?: number;
  sold?: number;
  status?: string;
  salesStartAt?: Date | null;
  salesEndAt?: Date | null;
};

// admin + artist + event + satu kategori tiket
export async function createEventWithCategory(opts: EventOpts = {}) {
  const admin = await createAdmin();
  const [artist] = await sql<{ id: number }[]>`
    INSERT INTO artists (name, genre, photo_url, bio)
    VALUES ('Artist', 'pop', '', '') RETURNING id
  `;
  const [event] = await sql<{ id: number }[]>`
    INSERT INTO events (artist_id, title, category, venue, date, poster_url, description, status, sales_start_at, sales_end_at)
    VALUES (${artist.id}, 'Konser Test', 'pop', 'Venue', now() + interval '30 days', '', '',
            ${opts.status ?? "published"}, ${opts.salesStartAt ?? null}, ${opts.salesEndAt ?? null})
    RETURNING id
  `;
  const [category] = await sql<{ id: number }[]>`
    INSERT INTO ticket_categories (event_id, name, price, quota, sold)
    VALUES (${event.id}, 'Reguler', 100000, ${opts.quota ?? 10}, ${opts.sold ?? 0})
    RETURNING id
  `;
  return { admin, artistId: artist.id, eventId: event.id, categoryId: category.id };
}

// order pending yang dibuat langsung di DB; expiresInMinutes negatif = sudah lewat
export async function insertPendingOrder(
  customerId: number,
  eventId: number,
  categoryId: number,
  quantity: number,
  expiresInMinutes: number
) {
  const [order] = await sql<{ id: number }[]>`
    INSERT INTO orders (customer_id, event_id, ticket_category_id, quantity, total_price, status, expires_at, created_at)
    VALUES (${customerId}, ${eventId}, ${categoryId}, ${quantity}, ${quantity * 100000}, 'pending_payment',
            now() + make_interval(mins => ${expiresInMinutes}), now())
    RETURNING id
  `;
  return order.id;
}

export const orderStatus = async (id: number) =>
  (await sql<{ status: string }[]>`SELECT status FROM orders WHERE id = ${id}`)[0]?.status;

export const orderBody = (eventId: number, categoryId: number, quantity = 1) => ({
  event_id: eventId,
  ticket_category_id: categoryId,
  quantity,
});

export { sql };
