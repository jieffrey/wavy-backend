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
  SELECT t.id, t.order_id, t.qr_code, t.is_scanned,
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
        WHERE o.customer_id = ${customerId}
        ORDER BY e.date ASC
      `
    );
  },

  async get(customerId: number, id: number): Promise<Result<TicketRow>> {
    const [ticket] = await sql<TicketRow[]>`
      ${walletSelect}
      WHERE t.id = ${id} AND o.customer_id = ${customerId}
    `;
    if (!ticket) return fail(404, "ticket not found");
    return ok(ticket);
  },
};