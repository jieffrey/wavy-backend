import { readFileSync, writeFileSync } from "fs";
import type { DBEnriched } from "./_types";

const merged: Array<DBEnriched & { venue: string }> = JSON.parse(readFileSync(`${import.meta.dir}/_merged.json`, "utf8"));
const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
let sql = readFileSync(sqlPath, "utf8");

const esc = (s: string) => (s ?? "").replace(/'/g, "''");
const jsonEsc = (v: unknown) => esc(JSON.stringify(v));

let eventUpd = 0;
let tierUpd = 0;
const blocks: string[] = [];
blocks.push("-- ============================================================");
blocks.push("-- ENRICHMENT: real descriptions, galleries, seatmaps, benefits");
blocks.push("-- ============================================================");

for (const e of merged) {
  const title = esc(e.title);
  const venue = esc(e.venue);
  const description = (e.description ?? "").trim().slice(0, 3000);
  const terms = (e.terms_conditions ?? "").trim().slice(0, 2000);
  const gallery = (e.gallery ?? []).filter((g: any) => typeof g === "string").slice(0, 10);
  const gallerySql = gallery.length ? `'${jsonEsc(gallery)}'` : `gallery`;
  const seatmap = e.seatmap ? `'${jsonEsc(e.seatmap)}'` : `''`;

  blocks.push(`UPDATE events SET description = '${esc(description)}', terms_conditions = '${esc(terms)}', gallery = ${gallerySql}, seatmap = ${seatmap} WHERE title = '${title}' AND venue = '${venue}';`);
  eventUpd++;

  // recreate ticket categories with real names/prices/benefits
  const tiers = (e.tiers ?? []).slice(0, 20);
  if (tiers.length) {
    blocks.push(`DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = '${title}' AND ev.venue = '${venue}';`);
    for (const t of tiers) {
      const price = Math.round(Number(t.price ?? 0));
      const quota = Math.min(Math.max(Math.round(Number(t.quota ?? 500)), 1), 20000);
      const sold = Math.min(Math.max(Math.round(Number(t.sold ?? 0)), 0), quota - 1);
      const benefits = (t.benefits ?? "").trim().slice(0, 600);
      blocks.push(`INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)`);
      blocks.push(`SELECT ev.id, '${esc(String(t.name ?? "Reguler"))}', ${price}, ${quota}, ${sold}, '${esc(benefits)}' FROM events ev WHERE ev.title = '${title}' AND ev.venue = '${venue}';`);
      tierUpd++;
    }
  }
}

sql = sql.replace(/\nCOMMIT;$/m, `\n${blocks.join("\n")}\nCOMMIT;`);
writeFileSync(sqlPath, sql);
console.log(`Enriched ${eventUpd} events (${tierUpd} ticket categories) in seed-scraped.sql`);