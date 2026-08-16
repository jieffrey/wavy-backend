import jwt from "jsonwebtoken";
import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

export type TicketPayload = { uid: string; event_id: number; exp: number };

// QR token = JWT berisi uid acak + event_id + exp (tanggal konser).
// Bisa diverifikasi offline (signature + expiry) tanpa DB.
export const signTicket = (payload: TicketPayload) => jwt.sign(payload, process.env.JWT_SECRET!);

export const verifyTicket = (token: string) => jwt.verify(token, process.env.JWT_SECRET!) as TicketPayload;

type TicketRow = {
  id: number;
  order_id: number;
  owner_id: number;
  qr_code: string;
  is_scanned: boolean;
  event_id: number;
  title: string;
  date: Date;
  venue: string;
  category: string;
  poster_url: string;
};

const walletSelect = sql`
  SELECT t.id, t.order_id, t.owner_id, t.qr_code, t.is_scanned,
         e.id AS event_id, e.title, e.date, e.venue, e.category, e.poster_url
  FROM tickets t
  JOIN orders o ON o.id = t.order_id
  JOIN events e ON e.id = o.event_id
`;

export const ticketService = {
  async list(customerId: number) {
    return ok(
      await sql<TicketRow[]>`
        ${walletSelect}
        WHERE t.owner_id = ${customerId}
        ORDER BY e.date ASC
      `
    );
  },

  async get(customerId: number, id: number): Promise<Result<TicketRow>> {
    const [ticket] = await sql<TicketRow[]>`
      ${walletSelect}
      WHERE t.id = ${id} AND t.owner_id = ${customerId}
    `;
    if (!ticket) return fail(404, "ticket not found");
    return ok(ticket);
  },

  async transfer(customerId: number, id: number, toEmail: string): Promise<Result<{ message: string }>> {
    const [ticket] = await sql<{ id: number; is_scanned: boolean }[]>`
      SELECT t.id, t.is_scanned FROM tickets t
      WHERE t.id = ${id} AND t.owner_id = ${customerId}
    `;
    if (!ticket) return fail(404, "ticket not found");
    if (ticket.is_scanned) return fail(400, "ticket already scanned, cannot transfer");
    const [target] = await sql<{ id: number }[]>`SELECT id FROM customers WHERE email = ${toEmail}`;
    if (!target) return fail(404, "customer not found");
    if (target.id === customerId) return fail(400, "cannot transfer to yourself");
    const [event] = await sql<{ date: Date }[]>`
      SELECT e.date FROM tickets t JOIN orders o ON o.id = t.order_id JOIN events e ON e.id = o.event_id
      WHERE t.id = ${id}
    `;
    if (new Date() > new Date(event.date)) return fail(400, "event already ended");
    await sql`UPDATE tickets SET owner_id = ${target.id} WHERE id = ${id}`;
    return ok({ message: "ticket transferred" });
  },
};