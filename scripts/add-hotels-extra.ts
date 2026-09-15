import { readFileSync, writeFileSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dir = dirname(fileURLToPath(import.meta.url));
const HOTELS_JSON = resolve(__dir, "../../wavy-next/src/data/hotels.json");
const WAVE_UA = { "user-agent": "Wavy-UKK-Demo/1.0 (student project; contact: none)" };

const PALETTE = [
  "linear-gradient(135deg,#7DD3E8,#4A90D9)",
  "linear-gradient(135deg,#FF5470,#211F2B)",
  "linear-gradient(135deg,#C6395A,#14131C)",
  "linear-gradient(135deg,#1B1A3A,#0D0C1F)",
  "linear-gradient(135deg,#8B0000,#2B0000)",
  "linear-gradient(135deg,#3D3D3D,#0A0A0A)",
];

const WIKI_FILE: Record<string, string> = {};
const IMAGE_SEARCH: Record<string, string> = {};

const HOTELS_EXTRA: any[] = [
  { location: "Singapore", price: "5500000", rating: "4.8", name: "Marina Bay Sands" },
  { location: "Singapore", price: "4200000", rating: "4.7", name: "The Fullerton Hotel Singapore" },
  { location: "Malaysia", price: "2600000", rating: "4.6", name: "Mandarin Oriental, Kuala Lumpur" },
  { location: "Malaysia", price: "1800000", rating: "4.4", name: "The Majestic Hotel Kuala Lumpur" },
  { location: "Thailand", price: "3800000", rating: "4.8", name: "Mandarin Oriental Bangkok" },
  { location: "Thailand", price: "3200000", rating: "4.7", name: "The Peninsula Bangkok" },
  { location: "South Korea", price: "4900000", rating: "4.8", name: "The Shilla Seoul" },
  { location: "South Korea", price: "3600000", rating: "4.6", name: "Lotte Hotel Seoul" },
  { location: "Bandung", price: "950000", rating: "4.3", name: "Hotel Preanger Bandung" },
  { location: "Bandung", price: "850000", rating: "4.2", name: "Hotel Savoy Homann Bandung" },
  { location: "Bali", price: "3400000", rating: "4.7", name: "Ayana Resort Bali" },
  { location: "Bali", price: "2600000", rating: "4.5", name: "Hilton Bali Resort" },
  { location: "Yogyakarta", price: "1100000", rating: "4.4", name: "Hotel Phoenix Yogyakarta" },
  { location: "Yogyakarta", price: "1400000", rating: "4.5", name: "Royal Ambarrukmo Yogyakarta" },
  { location: "Surabaya", price: "1600000", rating: "4.5", name: "Hotel Majapahit Surabaya" },
  { location: "Surabaya", price: "1200000", rating: "4.3", name: "Aryaduta Surabaya" },
];

async function wikiGet(url: string) {
  for (let attempt = 0; attempt < 3; attempt++) {
    try {
      const r = await fetch(url, { headers: WAVE_UA });
      if (r.status === 429) {
        await new Promise((res) => setTimeout(res, 3000 + attempt * 2000));
        continue;
      }
      if (!r.ok) return undefined;
      return await r.json();
    } catch {
      await new Promise((res) => setTimeout(res, 1500));
    }
  }
  return undefined;
}

async function wikiFileImage(file: string) {
  const url =
    "https://commons.wikimedia.org/w/api.php" +
    "?action=query&titles=" +
    encodeURIComponent(file) +
    "&prop=imageinfo&iiprop=url|mime&iiurlwidth=800&format=json&origin=*";
  const j = await wikiGet(url);
  for (const p of Object.values<any>(j?.query?.pages ?? {})) {
    const ii = p.imageinfo?.[0];
    if (ii && ii.thumburl && ii.mime?.startsWith("image/")) return ii.thumburl;
  }
  return undefined;
}

async function wikiImage(query: string) {
  const tokens = query
    .toLowerCase()
    .split(/[^a-z0-9]+/)
    .filter((t) => t.length >= 4);
  const url =
    "https://commons.wikimedia.org/w/api.php" +
    "?action=query&generator=search&gsrnamespace=6&gsrlimit=30&gsrsearch=" +
    encodeURIComponent(`${query} filetype:bitmap`) +
    "&prop=imageinfo&iiprop=url|size|mime&iiurlwidth=800&format=json&origin=*";
  const j = await wikiGet(url);
  const pages = j?.query?.pages ?? {};
  let best: { url?: string; score: number } = { score: -1 };
  for (const p of Object.values<any>(pages)) {
    const title = (p.title ?? "").toLowerCase();
    const score = tokens.reduce((acc, t) => acc + (title.includes(t) ? 1 : 0), 0);
    if (score > best.score) {
      const ii = p.imageinfo?.[0];
      if (ii && ii.thumburl && ii.mime?.startsWith("image/")) best = { url: ii.thumburl, score };
    }
  }
  return best.score > 0 ? best.url : undefined;
}

const hotels: any[] = JSON.parse(readFileSync(HOTELS_JSON, "utf8"));
const existing = new Set(hotels.map((h) => h.name.toLowerCase()));
let nextId = Math.max(...hotels.map((h) => h.id)) + 1;

let added = 0;
let withImg = 0;
for (let i = 0; i < HOTELS_EXTRA.length; i++) {
  const name = HOTELS_EXTRA[i].name;
  if (existing.has(name.toLowerCase())) {
    console.log(`[skip] ${name} already present`);
    continue;
  }
  const override = WIKI_FILE[name];
  const query = IMAGE_SEARCH[name] ?? name;
  const img = override ? await wikiFileImage(override) : await wikiImage(query);
  hotels.push({
    id: nextId++,
    name,
    location: HOTELS_EXTRA[i].location,
    price: HOTELS_EXTRA[i].price,
    rating: HOTELS_EXTRA[i].rating,
    gradient: PALETTE[i % PALETTE.length],
    ...(img ? { image: img } : {}),
  });
  console.log(`[add] ${name} @ ${HOTELS_EXTRA[i].location} ${img ? "img OK" : "(gradient)"}`);
  if (img) withImg += 1;
  added += 1;
  await new Promise((res) => setTimeout(res, 450));
}

writeFileSync(HOTELS_JSON, JSON.stringify(hotels, null, 2) + "\n", "utf8");
console.log(`\nadded ${added} hotels (${withImg} with image). total=${hotels.length}`);
console.log("wrote", HOTELS_JSON);