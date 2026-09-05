import { writeFileSync } from "fs";

const raw = JSON.parse(await Bun.file("scripts/curated-events.json").text());

const events = raw.filter(
  (e: any) =>
    ["Musik", "Konser"].includes(e.category) &&
    e.venue &&
    e.venue.trim() &&
    e.city &&
    e.city.trim() &&
    e.venue !== "Online Event",
);

function esc(s: string) {
  return (s ?? "").replace(/'/g, "''");
}

function slugify(s: string) {
  return (s ?? "")
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "")
    .slice(0, 48);
}

// unique organizers -> deterministic seed emails
const orgSlug = new Map<string, string>();
const orgIndex = new Map<string, number>();
let orgCount = 0;
for (const e of events) {
  const name = e.organizer.trim();
  if (!orgSlug.has(name)) {
    orgCount++;
    orgIndex.set(name, orgCount);
    orgSlug.set(name, `demo.scrape-${orgCount}@wavy.seed`);
  }
}

// events date formatting: date_start (+time if available)
function eventDate(e: any) {
  const d = e.date_start ?? "2026-12-31";
  const t = e.time_start && e.time_start !== "00:00:01" ? e.time_start : "18:00:00";
  return `'${d} ${t}'::timestamptz`;
}

const lines: string[] = [];
lines.push(`-- Seed data: ${events.length} concerts scraped from artatix.co.id + loket.com (${new Date().toISOString().slice(0, 10)})`);
lines.push(`-- Posters hosted on source CDNs (assets.artatix.co.id / assets.loket.com)`);
lines.push("-- Safe to re-run: organizers keyed by email (ON CONFLICT DO NOTHING), events/artists guarded by NOT EXISTS");
lines.push("");
lines.push("BEGIN;");
lines.push("");

let organizerBlock = new Set<string>();
for (const e of events) {
  const name = e.organizer.trim();
  if (organizerBlock.has(name)) continue;
  organizerBlock.add(name);
  lines.push(`INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)`);
  lines.push(`VALUES ('${esc(name)}', '${orgSlug.get(name)}', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')`);
  lines.push(`ON CONFLICT (email) DO NOTHING;`);
  lines.push("");
}

lines.push(`-- ============ EVENTS (${events.length}) ============`);
lines.push("");
for (const e of events) {
  const title = e.title.trim();
  const venue = `${esc(e.venue.trim())}, ${esc(e.city.trim())}`;
  const short = title.length > 80 ? title.slice(0, 80) : title;
  const slug = slugify(short);
  const org = e.organizer.trim();

  lines.push(`-- ${title}`);
  lines.push(`INSERT INTO artists (organizer_id, name, genre, photo_url, bio)`);
  lines.push(`SELECT id, '${esc(title)}', 'Music', '', 'Seeded artist entry'`);
  lines.push(`FROM organizers WHERE email = '${orgSlug.get(org)}'`);
  lines.push(`AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = '${orgSlug.get(org)}' AND a.name = '${esc(title)}');`);

  lines.push(`INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)`);
  lines.push(`SELECT o.id, a.id, '${esc(title)}', 'Music', '${venue}', ${eventDate(e)}, '${esc(e.image ?? "")}', 'Seeded from public listing data for UKK demo purposes.', 'published'`);
  lines.push(`FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '${esc(title)}'`);
  lines.push(`WHERE o.email = '${orgSlug.get(org)}'`);
  lines.push(`AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '${esc(title)}' AND ev.venue = '${venue}');`);

  const price = Number(e.price_low ?? 0);
  const sold = Math.min(Math.floor((Number(orgIndex.get(org)) * 13 + price) % 290), 290);
  lines.push(`INSERT INTO ticket_categories (event_id, name, price, quota, sold)`);
  lines.push(`SELECT ev.id, 'Reguler', ${price}, 500, ${sold}`);
  lines.push(`FROM events ev WHERE ev.title = '${esc(title)}' AND ev.venue = '${venue}'`);
  lines.push(`AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);`);
  lines.push("");
}

lines.push("COMMIT;");

writeFileSync("scripts/seed-scraped.sql", lines.join("\n"));
console.log(`Generated seed-scraped.sql with ${events.length} events, ${orgSlug.size} organizers.`);
console.log(`Unique organizer emails: ${orgSlug.size} (${orgIndex.size} tracked)`);