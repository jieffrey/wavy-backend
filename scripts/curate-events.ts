import { writeFileSync } from "fs";

const d = JSON.parse(await Bun.file("scripts/scraped-events.json").text());

const EXCLUDE_CATS = new Set(["Wisata", "Pameran", "Kompetisi", "Olahraga"]);
const INCLUDED = new Set(["Musik", "Konser", "Pertunjukan & Penampilan", "Workshop", "Workshop & Pelatihan", "Konferensi & Seminar", "Teater", "Talkshow", ""]);

function norm(s: string) {
  return (s ?? "").toLowerCase().replace(/\s+/g, " ").trim();
}

const seen = new Map<string, any>();
let skippedNoPrice = 0;
let skippedCat = 0;
let skippedDup = 0;

for (const e of d) {
  if (!INCLUDED.has(e.category)) {
    if (!EXCLUDE_CATS.has(e.category)) skippedCat++;
    continue;
  }
  const price = Number(e.price_low ?? 0);
  if (!(price > 0)) { skippedNoPrice++; continue; }
  const key = `${norm(e.title)}|${norm(e.city) || "??"}|${e.date_start ?? ""}`;
  if (seen.has(key)) { skippedDup++; continue; }
  seen.set(key, e);
}

let curated = [...seen.values()];

curated = curated.filter((e) => e.date_start).sort((a, b) => (a.date_start ?? "").localeCompare(b.date_start ?? ""));

console.log("total raw:", d.length);
console.log("skipped no-price/free:", skippedNoPrice);
console.log("skipped excluded-cat(no cat label):", skippedCat);
console.log("skipped dup:", skippedDup);
console.log("CURATED:", curated.length);

const bySrc = {} as Record<string, number>;
for (const e of curated) bySrc[e.source] = (bySrc[e.source] ?? 0) + 1;
console.log("by source:", bySrc);

const newest = [...curated].sort((a, b) => (b.date_start ?? "").localeCompare(a.date_start ?? ""));
console.log("\n=== last 3 by date ===");
console.log(JSON.stringify(newest.slice(0, 3).map((e) => ({ title: e.title, date: e.date_start, venue: e.venue, city: e.city })), null, 1));

writeFileSync("scripts/curated-events.json", JSON.stringify(curated, null, 2));
console.log("Wrote scripts/curated-events.json");