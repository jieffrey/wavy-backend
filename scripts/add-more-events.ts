import { writeFileSync } from "fs";
import { sql } from "../src/db/client";

const UA = { "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0", accept: "application/json" };
const ARTATIX_API = "https://api.artatix.co.id/api/v1";
const LOKET_API = "https://rest.loket.com/fusio/api/v1/public";

// ---------- existing titles in DB (avoid duplicates) ----------
const dbEvents = await sql`SELECT title FROM events`;
const existingTitles = new Set(dbEvents.map((r) => r.title.trim().toLowerCase()));
console.log("existing DB event titles:", existingTitles.size);
await sql.end();

const esc = (s: string) => (s ?? "").replace(/'/g, "''");
const slugify = (s: string) =>
  (s ?? "").toLowerCase().replace(/&/g, "and").replace(/["'<>]/g, "").replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "").slice(0, 48);

function stripHtml(s?: string | null) {
  return (s ?? "").replace(/<br\s*\/?>/gi, "\n").replace(/<\/p>/gi, "\n").replace(/<[^>]*>/g, " ").replace(/&amp;/g, "&").replace(/\s+/g, " ").trim();
}

async function getJson(url: string) {
  const r = await fetch(url, { headers: UA });
  if (!r.ok) throw new Error(`${r.status} ${url}`);
  return r.json();
}

// ---------- ARTATIX ----------
async function scrapeArtatix() {
  const out: any[] = [];
  const seen = new Set<string>();
  for (let page = 1; page <= 12; page++) {
    const j = await getJson(`${ARTATIX_API}/customer/event?page=${page}&limit=100`);
    const items = j?.data?.data ?? [];
    if (!items.length) break;
    for (const it of items) {
      if (seen.has(it.slug)) continue;
      seen.add(it.slug);
      try {
        const d = (await getJson(`${ARTATIX_API}/customer/event/${it.slug}`))?.data;
        out.push({
          source: "artatix",
          title: (d?.name ?? it.name).trim(),
          low: d?.lowestPrice ?? it.lowestPrice ?? 0,
          date: (d?.dateStart ?? it.dateStart ?? "").slice(0, 10),
          time: d?.timeStart ?? it.timeStart ?? "18:00:00",
          venue: (d?.location ?? it.location ?? "").trim() + ", " + (d?.city ?? it.city ?? "").trim(),
          organizer: (d?.user?.name ?? it.creator?.name ?? "").trim(),
          category: d?.eventCategory?.name ?? "",
          image: `https://assets.artatix.co.id/${d?.image ?? it.image}`,
          link: `https://www.artatix.co.id/event/${it.slug}`,
          description: stripHtml(d?.description),
        });
      } catch {
        /* skip detail failures */
      }
    }
  }
  return out;
}

// ---------- LOKET ----------
async function scrapeLoket() {
  const out: any[] = [];
  const seen = new Set<string>();
  for (let page = 1; page <= 4; page++) {
    const j = await getJson(`${LOKET_API}/discover?p=${page}&ps=50&f.d_ext=1&f.d_et=3`);
    const items = j?.result?.data ?? [];
    if (!items.length) break;
    for (const it of items) {
      const slug = (it.link ?? "").split("/").pop() ?? "";
      if (!slug || seen.has(slug)) continue;
      seen.add(slug);
      out.push({
        source: "loket",
        slug,
        title: (it.event_name ?? "").trim(),
        link: it.link?.trim(),
        venue: [it.location?.location_name, it.location?.city].filter(Boolean).join(", "),
        city: it.location?.city ?? "",
      });
    }
  }
  console.log("loket candidates:", out.length);

  const enriched: any[] = [];
  for (const e of out) {
    try {
      const j = await getJson(`${LOKET_API}/events/${e.slug}`);
      const d = j?.result;
      if (!d || d.is_past_event) continue;
      e.date = (d.start_date_formatted ?? "").slice(0, 10);
      e.time = "";
      e.venue = e.venue || [d.location?.venue_name, d.location?.city_name].filter(Boolean).join(", ");
      e.low = d.start_price ?? 0;
      e.organizer = d.organization_name ?? "";
      e.category = "Konser";
      e.image = d.event_banner ?? "";
      e.description = stripHtml(d.description);
      e.gallery = (d.event_gallery ?? []).map((g: any) => g.image_path).filter(Boolean);
      e.tiers = ((d.schedules?.[0]?.groups ?? []).flatMap((g: any) => g.tickets ?? []))
        .filter((t: any) => t.available !== false && Number(t.price) > 0)
        .map((t: any) => ({
          name: t.ticket_type,
          price: Number(t.price),
          quota: Math.min(Number(t.quantity) || 500, 5000),
          sold: Math.min(Math.floor(Number(t.quantity ?? 0) * 0.1), 400),
        }));
      enriched.push(e);
    } catch {
      /* skip */
    }
  }
  return enriched;
}

// ---------- filter ----------
async function build() {
  console.log("scraping artatix...");
  const art = await scrapeArtatix();
  console.log("artatix:", art.length);
  console.log("scraping loket...");
  const lok = await scrapeLoket();
  console.log("loket enriched:", lok.length);

  const all = [...art, ...lok];
  const now = new Date().toISOString().slice(0, 10);
  const keepNew = all.filter(
    (e) =>
      ["Musik", "Konser"].includes(e.category) &&
      e.date >= now &&
      e.date <= "2027-12-31" &&
      e.title &&
      !existingTitles.has(e.title.toLowerCase()) &&
      !/tba|to be|\?/i.test(e.venue) &&
      Number(e.low) > 0 &&
      e.low >= 10000 &&
      e.venue.split(",").length >= 2 &&
      !/kuala lumpur|odeon kl|my\b|malaysia/i.test(e.venue.toLowerCase() + e.title.toLowerCase()),
  );

  // dedupe by normalized title
  const seen = new Set<string>();
  const deduped: any[] = [];
  for (const e of keepNew) {
    const k = e.title.toLowerCase().replace(/\s+/g, " ").trim();
    if (seen.has(k)) continue;
    seen.add(k);
    deduped.push(e);
  }

  // rank: has description + image + proper venue (2+ words) + online ticket tiers
  const score = (e: any) =>
    (e.description ? 2 : 0) + (e.image ? 2 : 0) + (e.tiers && e.tiers.length ? 2 : 0) + (e.venue.split(",")[0].split(" ").length >= 2 ? 1 : 0);
  deduped.sort((a, b) => score(b) - score(a) || a.date.localeCompare(b.date));

  console.log("new candidates after filter:", deduped.length);

  // verify images + pick to reach 56 total
  const need = 56 - existingTitles.size;
  console.log("need to add:", need, "to reach 56");
  const picked: any[] = [];
  for (const e of deduped) {
    if (picked.length >= need) break;
    try {
      if (e.image) {
        const r = await fetch(e.image, { headers: UA, redirect: "follow" });
        const ct = r.headers.get("content-type") ?? "";
        if (!r.ok || !ct.startsWith("image/")) continue;
      }
    } catch {
      continue;
    }
    picked.push(e);
  }
  console.log("picked:", picked.length);

  writeFileSync(`${import.meta.dir}/_new-events.json`, JSON.stringify(picked, null, 2));
  console.log("wrote _new-events.json");
  return picked;
}

await build();