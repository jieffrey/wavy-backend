import { sql } from "../src/db/client";
import { readFileSync, writeFileSync } from "fs";

const DIR = `${import.meta.dir}/_manual-tnc`;

const seatmapByKey: Record<string, { name: string; images: string[] } | "clear"> = {
  enhypen: {
    name: "Jakarta International Stadium - Seating & Zone",
    images: [
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026855/WhatsApp_Image_2026-09-10_at_2.50.23_PM.jpg",
    ],
  },
  hwang: {
    name: "Jakarta Concert Hall - Denah Tempat Duduk",
    images: [
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026916/WhatsApp_Image_2026-09-10_at_2.50.23_PM_1.jpg",
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026917/WhatsApp_Image_2026-09-10_at_2.50.23_PM_2.jpg",
    ],
  },
  ye: {
    name: "Gelora Bung Karno - Denah Tempat Duduk",
    images: [
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026916/WhatsApp_Image_2026-09-10_at_2.50.23_PM_3.jpg",
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026917/WhatsApp_Image_2026-09-10_at_2.50.23_PM_4.jpg",
    ],
  },
  bigbang: {
    name: "Jakarta International Stadium - Seating & Zone",
    images: [
      "https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026915/WhatsApp_Image_2026-09-10_at_2.50.23_PM_5.jpg",
    ],
  },
  arterun: {
    name: "Layout ARTERUN x Gendut Berlari - Pace of Joy",
    images: ["https://api.artatix.co.id/event_layout/24GGKSHRGP.jpg"],
  },
  riang: {
    name: "Layout Riang dan Ceria",
    images: ["https://api.artatix.co.id/event_layout/KDGNJBQCG9.png"],
  },
};

const events: Array<{ key: string; file: string; title: string; venue: string }> = [
  { key: "enhypen", file: "enhypen.txt", title: "ENHYPEN WORLD TOUR 'BLOOD SAGA' IN JAKARTA", venue: "Jakarta Utara" },
  { key: "top", file: "top.txt", title: "T.O.P PRE-STUDIO 2026 in Jakarta", venue: "Jakarta Pusat" },
  { key: "hwang", file: "hwang.txt", title: "2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA", venue: "Jakarta Pusat" },
  { key: "ye", file: "ye.txt", title: "YE JAKARTA 2026", venue: "Jakarta Pusat" },
  { key: "bigbang", file: "bigbang.txt", title: "BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA", venue: "Jakarta Utara" },
  { key: "snada", file: "snada.txt", title: "Snada Indonesia 2026", venue: "Jakarta Pusat" },
  { key: "nextgen", file: "nextgen.txt", title: "Next Gen(re) Parenting - Semarang", venue: "Kota Semarang" },
  { key: "leadinghr", file: "leadinghr.txt", title: "Leading HR and Unlocking Organisational Performance: People & Performance Workshop", venue: "Jakarta Pusat" },
  { key: "adili", file: "adili.txt", title: "Adili Idola: Celebrity Roast", venue: "Jakarta Barat" },
];

const clearSeatmap: Array<{ title: string; venue: string }> = [
  { title: "SYNC 2026 'Luminaria'", venue: "TBA" },
  { title: "Moonverse Festival Vol  7", venue: "TBA" },
  { title: "Ayo Fest 2026", venue: "TBA" },
  { title: "Remember Fest 2026 X Cube Concert", venue: "TBA" },
  { title: "SEMESTAMBYAR", venue: "TBA" },
];

const esc = (s: string) => (s ?? "").replace(/'/g, "''");

const blocks: string[] = [];
blocks.push("");
blocks.push("-- ============================================================");
blocks.push("-- MANUAL T&C (pasted from official event sites) + SEATMAPS");
blocks.push("-- ============================================================");

const matchedKeys: string[] = [];
for (const e of events) {
  const row = await sql`
    SELECT title, venue FROM events WHERE title = ${e.title} AND venue = ${e.venue} LIMIT 1
  `;
  if (!row[0]) {
    console.log(`SKIP (not in DB) [${e.key}] ${e.title} @ ${e.venue}`);
    continue;
  }
  matchedKeys.push(e.key);
  const title = esc(row[0].title);
  const venue = esc(row[0].venue);
  const terms = readFileSync(`${DIR}/${e.file}`, "utf8").trim().replace(/\r\n/g, "\n");
  blocks.push(`UPDATE events SET terms_conditions = '${esc(terms)}' WHERE title = '${title}' AND venue = '${venue}';`);

  const sm = seatmapByKey[e.key];
  if (sm && sm !== "clear") {
    blocks.push(`UPDATE events SET seatmap = '${esc(JSON.stringify(sm))}' WHERE title = '${title}' AND venue = '${venue}';`);
  }
}
console.log(`matched ${matchedKeys.length}/${events.length} events`);

for (const c of clearSeatmap) {
  const row = await sql`
    SELECT title, venue FROM events WHERE title = ${c.title} AND venue = ${c.venue} LIMIT 1
  `;
  if (!row[0]) {
    console.log(`SKIP clear (not in DB): ${c.title} @ ${c.venue}`);
    continue;
  }
  const title = esc(row[0].title);
  const venue = esc(row[0].venue);
  blocks.push(`UPDATE events SET seatmap = '' WHERE title = '${title}' AND venue = '${venue}';`);
}

// artatix real layouts
for (const key of ["arterun", "riang"]) {
  const sm = seatmapByKey[key];
  if (!sm || sm === "clear") continue;
  const e = key === "arterun"
    ? { title: "ARTERUN x Gendut Berlari - Pace of Joy", venue: "TBA" }
    : { title: "Riang dan Ceria Jambi", venue: "TBA" };
  const row = await sql`
    SELECT title, venue FROM events WHERE title = ${e.title} AND venue = ${e.venue} LIMIT 1
  `;
  if (!row[0]) {
    console.log(`SKIP artatix (not in DB): ${e.title} @ ${e.venue}`);
    continue;
  }
  const title = esc(row[0].title);
  const venue = esc(row[0].venue);
  blocks.push(`UPDATE events SET seatmap = '${esc(JSON.stringify(sm))}' WHERE title = '${title}' AND venue = '${venue}';`);
}

// live DB execution
let updated = 0;
for (const b of blocks) {
  if (!b.startsWith("UPDATE")) continue;
  await sql.unsafe(b);
  updated++;
}
console.log("live DB updates:", updated);

// bake into seed-scraped.sql before COMMIT (dedupe existing MANUAL block)
const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
let text = readFileSync(sqlPath, "utf8");
if (text.includes("-- MANUAL T&C")) {
  text = text.replace(/\n-- =+\n-- MANUAL T&C[\s\S]*?\nCOMMIT;\s*$/m, "\n" + blocks.join("\n") + "\nCOMMIT;\n");
} else {
  text = text.replace(/\nCOMMIT;\s*$/m, blocks.join("\n") + "\nCOMMIT;\n");
}
writeFileSync(sqlPath, text);
console.log("seed-scraped.sql updated");
await sql.end();