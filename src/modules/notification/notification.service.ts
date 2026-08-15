import { sql } from "../../db/client";
import { ok, fail, type Result } from "../../types/result";

type NotificationRow = { id: number; customer_id: number; title: string; message: string; read: boolean; created_at: Date };

export const notificationService = {
  async list(customerId: number) {
    return ok(
      await sql<NotificationRow[]>`SELECT * FROM notifications WHERE customer_id = ${customerId} ORDER BY created_at DESC`
    );
  },

  async markRead(customerId: number, id: number): Promise<Result<{ message: string }>> {
    const [n] = await sql<{ id: number }[]>`
      UPDATE notifications SET read = true WHERE id = ${id} AND customer_id = ${customerId} RETURNING id
    `;
    if (!n) return fail(404, "notification not found");
    return ok({ message: "notification marked as read" });
  },

  async notifyMany(customerIds: number[], title: string, message: string) {
    for (const cid of new Set(customerIds)) {
      await sql`INSERT INTO notifications (customer_id, title, message) VALUES (${cid}, ${title}, ${message})`;
    }
  },
};