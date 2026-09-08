import { sql } from "../src/db/client";
import { readFileSync, writeFileSync } from "fs";

const tnc = require("./_tnc.json");
const ids = Object.keys(tnc).map(Number);
const rows = await sql`SELECT id, title, venue FROM events WHERE id = ANY(${ids})`;
const byId = new Map(rows.map((r) => [r.id, r]));

const esc = (s) => (s ?? "").replace(/'/g, "''");

const blocks = [];
blocks.push("");
blocks.push("-- ============================================================");
blocks.push("-- FULL T&C (from source APIs, HTML) — overrides truncated text");
blocks.push("-- ============================================================");
let n = 0;
for (const [idStr, v] of Object.entries(tnc)) {
  const id = Number(idStr);
  const row = byId.get(id);
  if (!row) { console.log(`skip id ${id} not in DB`); continue; }
  const title = esc(row.title);
  const venue = esc(row.venue);
  let terms = (v.raw || "").trim();
  if (!terms) terms = (await sql`SELECT terms_conditions FROM events WHERE id = ${id}`)[0]?.terms_conditions || "";
  blocks.push(`UPDATE events SET terms_conditions = '${esc(terms)}' WHERE title = '${title}' AND venue = '${venue}';`);
  n++;
}
console.log("terms updates:", n);

const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
let text = readFileSync(sqlPath, "utf8");
if (text.includes("-- FULL T&C")) {
  text = text.replace(/\n-- =+\n-- FULL T&C[\s\S]*?\nCOMMIT;\s*$/m, "\n" + blocks.join("\n") + "\nCOMMIT;\n");
} else {
  text = text.replace(/\nCOMMIT;\s*$/m, blocks.join("\n") + "\nCOMMIT;\n");
}
writeFileSync(sqlPath, text);
console.log("seed-scraped.sql updated");
await sql.end();