import { readFileSync, writeFileSync } from "fs";

const newEvents = JSON.parse(await Bun.file(`${import.meta.dir}/_new-events.json`).text());
const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
let sql = readFileSync(sqlPath, "utf8");

const esc = (s: string) => (s ?? "").replace(/'/g, "''");

// existing organizer emails in the file (to reuse without dup)
const existingOrgs = new Set([...sql.matchAll(/demo\.[a-z0-9-]+@wavy\.seed/g)].map((m) => m[0]));
const orgEmail = (name: string) => {
  const base = "demo." + (name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "").slice(0, 40) || "organizer");
  let email = `${base}@wavy.seed`;
  let n = 0;
  while (existingOrgs.has(email)) {
    n++;
    email = `${base}-${n}@wavy.seed`;
  }
  existingOrgs.add(email);
  return email;
};

const blocks: string[] = [];
let eventCount = 0;
let tierCount = 0;

for (const e of newEvents) {
  const title = e.title.trim();
  const venue = esc(e.venue.trim());
  const date = e.date || "2026-12-31";
  const time = e.time && e.time !== "00:00:01" ? e.time : "18:00:00";
  const low = Number(e.low ?? 0);
  const image = (e.image ?? "").trim() || (e.gallery && e.gallery[0]) || "";
  const description = (e.description ?? "").trim().slice(0, 3000);
  const org = e.organizer.trim() || "Event Organizer";
  const email = orgEmail(org);
  const tiers = e.tiers && e.tiers.length ? e.tiers : [{ name: "Reguler", price: low, quota: 500, sold: 18 }];

  blocks.push(`-- Organizer: ${org}`);
  blocks.push(`INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)`);
  blocks.push(`VALUES ('${esc(org)}', '${email}', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')`);
  blocks.push(`ON CONFLICT (email) DO NOTHING;`);
  blocks.push("");
  blocks.push(`INSERT INTO artists (organizer_id, name, genre, photo_url, bio)`);
  blocks.push(`SELECT o.id, '${esc(title)}', 'Music', '', '${esc(description).slice(0, 180)}'`);
  blocks.push(`FROM organizers o WHERE o.email = '${email}'`);
  blocks.push(`AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = '${email}' AND a.name = '${esc(title)}');`);
  blocks.push(`INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)`);
  blocks.push(`SELECT o.id, a.id, '${esc(title)}', 'Music', '${venue}', '${date} ${time}'::timestamptz, '${esc(image)}', '${esc(description)}', 'published'`);
  blocks.push(`FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '${esc(title)}'`);
  blocks.push(`WHERE o.email = '${email}'`);
  blocks.push(`AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '${esc(title)}' AND ev.venue = '${venue}');`);
  for (const t of tiers) {
    const price = Number(t.price ?? low);
    const quota = Math.min(Number(t.quota ?? 500) || 500, 5000);
    const sold = Math.min(Math.max(Number(t.sold ?? 0), 0), quota - 1);
    blocks.push(`INSERT INTO ticket_categories (event_id, name, price, quota, sold)`);
    blocks.push(`SELECT ev.id, '${esc(String(t.name ?? "Reguler"))}', ${price}, ${quota}, ${sold}`);
    blocks.push(`FROM events ev WHERE ev.title = '${esc(title)}' AND ev.venue = '${venue}'`);
    blocks.push(`AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = '${esc(String(t.name ?? "Reguler"))}');`);
    tierCount++;
  }
  blocks.push("");
  eventCount++;
}

const newBlock = blocks.join("\n");
sql = sql.replace(/\nCOMMIT;$/m, `\n${newBlock}\nCOMMIT;`);
writeFileSync(sqlPath, sql);
console.log(`Appended ${eventCount} events (${tierCount} ticket categories) to seed-scraped.sql`);