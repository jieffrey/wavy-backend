import { createHash } from "node:crypto";

// Klien Midtrans (Snap + Core API status) berbasis fetch. Objek `midtrans` sengaja bisa
// diganti di test (mock) tanpa jaringan.

export type MidtransStatus = {
  order_id: string;
  status_code: string;
  gross_amount: string;
  transaction_status: string;
  fraud_status?: string;
  payment_type?: string;
  signature_key?: string;
};

export type SnapRequest = {
  orderId: string;
  grossAmount: number;
  expiryMinutes: number;
  customer: { first_name: string; email: string; phone: string };
};

export const midtransConfig = () => {
  const serverKey = process.env.MIDTRANS_SERVER_KEY ?? "";
  const isProduction = process.env.MIDTRANS_IS_PRODUCTION === "true";
  return {
    serverKey,
    configured: serverKey.length > 0,
    snapUrl: isProduction
      ? "https://app.midtrans.com/snap/v1/transactions"
      : "https://app.sandbox.midtrans.com/snap/v1/transactions",
    apiUrl: isProduction ? "https://api.midtrans.com" : "https://api.sandbox.midtrans.com",
  };
};

const authHeader = (serverKey: string) => `Basic ${Buffer.from(`${serverKey}:`).toString("base64")}`;

// sha512(order_id + status_code + gross_amount + server_key), sesuai dokumentasi Midtrans
export const midtransSignature = (orderId: string, statusCode: string, grossAmount: string, serverKey: string) =>
  createHash("sha512").update(`${orderId}${statusCode}${grossAmount}${serverKey}`).digest("hex");

// format start_time Snap dalam WIB, mis. 2026-11-20 21:30:00 +0700
const snapTime = (d: Date) => {
  const wib = new Date(d.getTime() + 7 * 60 * 60 * 1000).toISOString();
  return `${wib.slice(0, 10)} ${wib.slice(11, 19)} +0700`;
};

export class MidtransError extends Error {}

export const midtrans = {
  async createSnapTransaction(req: SnapRequest): Promise<{ token: string; redirect_url: string }> {
    const cfg = midtransConfig();
    const res = await fetch(cfg.snapUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json", Accept: "application/json", Authorization: authHeader(cfg.serverKey) },
      body: JSON.stringify({
        transaction_details: { order_id: req.orderId, gross_amount: req.grossAmount },
        customer_details: req.customer,
        expiry: { start_time: snapTime(new Date()), unit: "minute", duration: req.expiryMinutes },
      }),
    });
    const json = (await res.json().catch(() => ({}))) as { token?: string; redirect_url?: string; error_messages?: string[] };
    if (!res.ok || !json.token || !json.redirect_url) {
      throw new MidtransError(`snap ${res.status}: ${(json.error_messages ?? []).join("; ") || "no token"}`);
    }
    return { token: json.token, redirect_url: json.redirect_url };
  },

  // null = transaksi belum ada di Midtrans (customer belum memilih metode bayar)
  async getStatus(orderId: string): Promise<MidtransStatus | null> {
    const cfg = midtransConfig();
    const res = await fetch(`${cfg.apiUrl}/v2/${encodeURIComponent(orderId)}/status`, {
      headers: { Accept: "application/json", Authorization: authHeader(cfg.serverKey) },
    });
    const json = (await res.json().catch(() => ({}))) as MidtransStatus;
    if (json.status_code === "404") return null;
    if (!res.ok || !json.transaction_status) throw new MidtransError(`status ${res.status} ${json.status_code ?? ""}`);
    return json;
  },
};
