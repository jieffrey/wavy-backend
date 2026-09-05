import { writeFileSync } from "fs";

const d = JSON.parse(await Bun.file("scripts/curated-events.json").text());

const music = d.filter(
  (e: any) =>
    ["Musik", "Konser"].includes(e.category) &&
    e.venue &&
    e.venue.trim() &&
    e.city &&
    e.city.trim() &&
    e.venue !== "Online Event",
);

let upcoming = music.filter((e: any) => e.date_start >= "2026-09-01" && e.date_start <= "2027-12-31");
upcoming.sort((a: any, b: any) => (a.date_start ?? "").localeCompare(b.date_start ?? ""));

const DIRTY = /tba|to be|\?/i;
upcoming = upcoming.filter((e: any) => !DIRTY.test(e.venue + " " + e.city));

const baseTitle = (s: string) =>
  s
    .toLowerCase()
    .replace(/\s+/g, " ")
    .replace(/[\s-]+([a-z0-9 ]*)$/, (m, tail) => (tail && tail.trim().length > 0 && !/\d/.test(tail) ? "" : m))
    .replace(/vol\s*\d+$/i, "")
    .trim();

// dedupe: same organizer + same base title -> keep the earliest event
const seen = new Set<string>();
const deduped: any[] = [];
for (const e of upcoming) {
  const key = `${e.organizer.trim().toLowerCase()}|${baseTitle(e.title)}`;
  if (seen.has(key)) continue;
  seen.add(key);
  deduped.push(e);
}
console.log("after tour dedupe:", deduped.length);

// quality score: named venue (>2 words & not just city), logo/organizer presence, price present
const score = (e: any): number => {
  let s = 0;
  const v = (e.venue || "").trim();
  if (v.split(" ").length >= 2) s += 3;
  if (e.price_low > 0) s += 1;
  if (e.image) s += 1;
  if (/stadium|stadion|hall|expo|gbk|senayan|konser|amphitheater|theater|theatre|ji-expo|jiexpo/i.test(v)) s += 2;
  return s;
};
const ranked = deduped.map((e) => ({ e, s: score(e) })).sort((a, b) => b.s - a.s || (a.e.date_start || "").localeCompare(b.e.date_start || ""));

const FINAL_N = 60;
const picked = ranked
  .slice(0, FINAL_N)
  .map((r) => r.e)
  .sort((a, b) => (a.date_start ?? "").localeCompare(b.date_start ?? ""));

writeFileSync("scripts/filtered-events.json", JSON.stringify(picked, null, 2));
console.log("FINAL:", picked.length);
console.log(picked.map((e: any) => `${e.date_start} | ${e.title.slice(0, 45).padEnd(45)} | ${e.venue.slice(0, 35).padEnd(35)} | ${e.organizer.slice(0, 28)}`).join("\n"));