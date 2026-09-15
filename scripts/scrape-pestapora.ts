import { readFileSync, writeFileSync } from "node:fs";

const SLUG = "pestapora-2026_kbgT";
const API = `https://rest.loket.com/fusio/api/v1/public/events/${SLUG}`;
const SEED = `${import.meta.dir}/seed-scraped.sql`;

const MARK_START = "-- >>> PESTAPORA 2026 REFRESH (scraped from loket.com)";
const MARK_END = "-- <<< PESTAPORA 2026 REFRESH";

function stripHtml(s: string): string {
  return (s ?? "")
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/<\/li>/gi, "\n")
    .replace(/<\/p>/gi, "\n")
    .replace(/<[^>]*>/g, " ")
    .replace(/&nbsp;/gi, " ")
    .replace(/&amp;/gi, "&")
    .replace(/&lt;/gi, "<")
    .replace(/&gt;/gi, ">")
    .replace(/&quot;/gi, '"')
    .replace(/&rsquo;/gi, "'")
    .replace(/&lsquo;/gi, "'")
    .replace(/&ldquo;/gi, '"')
    .replace(/&rdquo;/gi, '"')
    .replace(/\s+/g, " ")
    .trim();
}

const esc = (s: string) => (s ?? "").replace(/'/g, "''");

const r = await fetch(API, {
  headers: { "user-agent": "Wavy-UKK-Scraper/1.0 (student project)" },
});
if (!r.ok) throw new Error(`fetch failed ${r.status}`);
const d: any = (await r.json()).result;

const start = ((d.start_date_formatted ?? "").replace(" Asia/Jakarta", "")) || "2026-09-25 15:00:00";
const venue = [d.schedules?.[0]?.location?.location_name, d.schedules?.[0]?.location?.district_name]
  .filter(Boolean)
  .join(", ");
const banner = d.event_banner ?? "";
const description = stripHtml(d.description).slice(0, 3000);
const tnc = stripHtml(d.schedules?.[0]?.template?.tnc ?? "").slice(0, 2000);

const nacional = (d.schedules?.[0]?.groups ?? []).find((g: any) => /national/i.test(g.group_name ?? ""));
const tickets = (nacional?.tickets ?? []).map((t: any) => ({
  name: t.ticket_type ?? "",
  price: Number(t.price) ?? 0,
  quota: Math.min(Number(t.quantity) || 500, 5000),
  soldOut: t.status_ticket_name === "SOLD OUT" || t.available === false,
  benefits: stripHtml(t.description).slice(0, 500),
}));

const eventCond = `WHERE title = 'Pestapora 2026'`;
const ticketsSql = tickets
  .map((t) => {
    const sold = t.soldOut ? t.quota : Math.min(Math.floor(t.quota * 0.3), t.quota - 1);
    return [
      `INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)`,
      `SELECT ev.id, '${esc(t.name)}', ${t.price}, ${t.quota}, ${sold}, '${esc(t.benefits)}'`,
      `FROM events ev ${eventCond};`,
    ].join("\n");
  })
  .join("\n");

const block = `
${MARK_START} (${new Date().toISOString().slice(0, 10)})
UPDATE events SET
  date = '${esc(start)}'::timestamptz,
  poster_url = '${esc(banner)}',
  description = '${esc(description)}',
  terms_conditions = '${esc(tnc)}',
  gallery = '[]',
  seatmap = ''
${eventCond};
DELETE FROM ticket_categories tc USING events ev
  WHERE tc.event_id = ev.id AND ev.title = 'Pestapora 2026';
${ticketsSql}
${MARK_END}
`;

let sql = readFileSync(SEED, "utf8");
const re = new RegExp(`${MARK_START}[\\s\\S]*?${MARK_END}`, "m");
if (re.test(sql)) {
  sql = sql.replace(re, block.trim());
} else {
  sql = sql.replace(/\nCOMMIT;$/m, `\n${block}\nCOMMIT;`);
}
writeFileSync(SEED, sql);

console.log("event:", d.event_name);
console.log("venue:", venue);
console.log("start:", start);
console.log("tickets:", tickets.map((t) => `${t.name} ${t.price} x${t.quota} ${t.soldOut ? "SO" : "OK"}`).join(" | "));
console.log("tnc chars:", tnc.length);
console.log("block written to seed-scraped.sql", re.test(sql) ? "(replaced)" : "(inserted)");