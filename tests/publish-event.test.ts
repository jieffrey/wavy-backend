import { describe, expect, test } from "bun:test";
import { call, createEventWithCategory, createOrganizer, sql } from "./helpers";

describe("POST /organizer/events/:id/publish", () => {
  test("event tanpa kategori tiket -> 400 NO_TICKET_CATEGORY, status tetap draft", async () => {
    const { organizer, eventId, categoryId } = await createEventWithCategory({ status: "draft" });
    await sql`DELETE FROM ticket_categories WHERE id = ${categoryId}`;

    const res = await call("POST", `/organizer/events/${eventId}/publish`, organizer.token);
    expect(res.status).toBe(400);
    expect(res.body).toEqual({ error: { code: "NO_TICKET_CATEGORY", message: expect.any(String) } });

    const [{ status }] = await sql<{ status: string }[]>`SELECT status FROM events WHERE id = ${eventId}`;
    expect(status).toBe("draft");
  });

  test("event dengan kategori tiket -> 200 published", async () => {
    const { organizer, eventId } = await createEventWithCategory({ status: "draft" });
    const res = await call("POST", `/organizer/events/${eventId}/publish`, organizer.token);
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("published");
  });

  test("event milik organizer lain -> 404, bukan NO_TICKET_CATEGORY", async () => {
    const { eventId, categoryId } = await createEventWithCategory({ status: "draft" });
    await sql`DELETE FROM ticket_categories WHERE id = ${categoryId}`;
    const stranger = await createOrganizer();
    const res = await call("POST", `/organizer/events/${eventId}/publish`, stranger.token);
    expect(res.status).toBe(404);
  });
});
