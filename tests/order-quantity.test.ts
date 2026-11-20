import { describe, expect, test } from "bun:test";
import { call, createCustomer, createEventWithCategory, orderBody, sql } from "./helpers";

const countOrders = async (eventId: number) =>
  Number((await sql<{ c: string }[]>`SELECT count(*) AS c FROM orders WHERE event_id = ${eventId}`)[0].c);

// ---------------------------------------------------------------------------
// POST /orders: quantity wajib 1..4 (validasi schema, sebelum menyentuh DB)
// ---------------------------------------------------------------------------
describe("POST /orders quantity limit", () => {
  const rejected: [string, unknown, string][] = [
    ["0", 0, "quantity must be at least 1"],
    ["negatif", -1, "quantity must be at least 1"],
    ["5 (lebih dari 4)", 5, "quantity must be at most 4 tickets per order"],
    ["pecahan", 1.5, "quantity must be a whole number"],
    ["string", "2", "quantity must be a number"],
  ];

  for (const [label, quantity, message] of rejected) {
    test(`menolak quantity ${label} dengan 400 INVALID_QUANTITY`, async () => {
      const { eventId, categoryId } = await createEventWithCategory();
      const customer = await createCustomer();

      const res = await call("POST", "/orders", customer.token, { ...orderBody(eventId, categoryId), quantity });

      expect(res.status).toBe(400);
      expect(res.body).toEqual({ error: { code: "INVALID_QUANTITY", message } });
      expect(await countOrders(eventId)).toBe(0);
    });
  }

  test("menolak quantity yang tidak dikirim", async () => {
    const { eventId, categoryId } = await createEventWithCategory();
    const customer = await createCustomer();

    const res = await call("POST", "/orders", customer.token, { event_id: eventId, ticket_category_id: categoryId });

    expect(res.status).toBe(400);
    expect(res.body).toEqual({ error: { code: "INVALID_QUANTITY", message: "quantity is required" } });
  });

  test("field lain yang salah tetap 400 dengan bentuk error yang sama", async () => {
    const { categoryId } = await createEventWithCategory();
    const customer = await createCustomer();

    const res = await call("POST", "/orders", customer.token, { ...orderBody(0, categoryId), event_id: "x" });

    expect(res.status).toBe(400);
    expect(res.body.error.code).toBe("VALIDATION_ERROR");
    expect(res.body.error.message).toStartWith("event_id:");
  });

  for (const quantity of [1, 4]) {
    test(`menerima quantity ${quantity} (batas)`, async () => {
      const { eventId, categoryId } = await createEventWithCategory({ quota: 10 });
      const customer = await createCustomer();

      const res = await call("POST", "/orders", customer.token, orderBody(eventId, categoryId, quantity));

      expect(res.status).toBe(201);
      expect(res.body.quantity).toBe(quantity);
      expect(Number(res.body.total_price)).toBe(100000 * quantity);
    });
  }
});
