import { writeFileSync, mkdirSync } from "fs";
import { dirname, resolve } from "path";

const PAGE_URL = "https://www.loket.com/site/page-yejakarta2026hotelbundling";
const OUT_PATH = resolve(import.meta.dir, "../../wavy-next/src/data/hotels.json");
const UA = { "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0" };

type Room = { category: string; room: string };
type Hotel = {
  id: number;
  name: string;
  location: string;
  price: string;
  rating: string;
  gradient: string;
  tier: string;
  rooms: Room[];
  ticketCat: string;
};

const DISPLAY = new Map<string, string>([
  ["Gran Mahakam", "Hotel Gran Mahakam"],
  ["Grand Hyatt", "Grand Hyatt Jakarta"],
  ["Hermitage", "The Hermitage Jakarta"],
  ["Kempinski", "Hotel Indonesia Kempinski"],
  ["Mandarin Oriental", "Mandarin Oriental Jakarta"],
  ["Pullman Thamrin", "Pullman Jakarta Thamrin"],
  ["The Westin", "The Westin Jakarta"],
  ["Le Meridien", "Le M\u00e9ridien Jakarta"],
  ["Four Points", "Four Points by Sheraton"],
  ["Mercure Gatot Subroto", "Mercure Gatot Subroto Jakarta"],
  ["Artotel Mangkuluhur", "ARTOTEL Mangkuluhur"],
]);

const LOCATION = new Map<string, string>([
  ["Ayana", "Jakarta Pusat"],
  ["Gran Mahakam", "Jakarta Selatan"],
  ["Grand Hyatt", "Jakarta Pusat"],
  ["Hermitage", "Jakarta Pusat"],
  ["Kempinski", "Jakarta Pusat"],
  ["Mandarin Oriental", "Jakarta Pusat"],
  ["Pullman Thamrin", "Jakarta Pusat"],
  ["The Westin", "Jakarta Selatan"],
  ["Le Meridien", "Jakarta Pusat"],
  ["Four Points", "Jakarta Selatan"],
  ["GranDhika Iskandarsyah", "Jakarta Selatan"],
  ["Mercure Gatot Subroto", "Jakarta Selatan"],
  ["Artotel Mangkuluhur", "Jakarta Selatan"],
]);

// Perkiraan tarif/malam & rating — Loket tidak mempublikasikan harga bundling (estimasi)
const ESTIMATE = new Map<string, { price: string; rating: string; gradient: string }>([
  ["Ayana", { price: "2800000", rating: "4.6", gradient: "linear-gradient(135deg,#7DD3E8,#4A90D9)" }],
  ["Gran Mahakam", { price: "2200000", rating: "4.5", gradient: "linear-gradient(135deg,#C6395A,#14131C)" }],
  ["Grand Hyatt", { price: "3900000", rating: "4.7", gradient: "linear-gradient(135deg,#1B1A3A,#0D0C1F)" }],
  ["Hermitage", { price: "2400000", rating: "4.6", gradient: "linear-gradient(135deg,#3D3D3D,#0A0A0A)" }],
  ["Kempinski", { price: "3400000", rating: "4.8", gradient: "linear-gradient(135deg,#FF5470,#211F2B)" }],
  ["Mandarin Oriental", { price: "4200000", rating: "4.9", gradient: "linear-gradient(135deg,#3D3D3D,#0A0A0A)" }],
  ["Pullman Thamrin", { price: "2000000", rating: "4.5", gradient: "linear-gradient(135deg,#8B0000,#2B0000)" }],
  ["The Westin", { price: "2900000", rating: "4.6", gradient: "linear-gradient(135deg,#7DD3E8,#4A90D9)" }],
  ["Le Meridien", { price: "2500000", rating: "4.6", gradient: "linear-gradient(135deg,#C6395A,#14131C)" }],
  ["Artotel Mangkuluhur", { price: "1600000", rating: "4.4", gradient: "linear-gradient(135deg,#FF5470,#211F2B)" }],
  ["Four Points", { price: "1400000", rating: "4.4", gradient: "linear-gradient(135deg,#1B1A3A,#0D0C1F)" }],
  ["GranDhika Iskandarsyah", { price: "1100000", rating: "4.2", gradient: "linear-gradient(135deg,#7DD3E8,#4A90D9)" }],
  ["Mercure Gatot Subroto", { price: "1200000", rating: "4.3", gradient: "linear-gradient(135deg,#C6395A,#14131C)" }],
]);

// Query pencarian foto di Wikimedia Commons per hotel (jangan diubah manual, =sumber luar)
const IMAGE_SEARCH = new Map<string, string>([
  ["Ayana", "Ayana Midplaza Jakarta hotel"],
  ["Gran Mahakam", "Gran Mahakam Hotel Jakarta"],
  ["Grand Hyatt", "Grand Hyatt Jakarta hotel"],
  ["Hermitage", "The Hermitage Hotel Jakarta"],
  ["Kempinski", "Hotel Indonesia Kempinski"],
  ["Mandarin Oriental", "Mandarin Oriental Jakarta hotel"],
  ["Pullman Thamrin", "Pullman Jakarta Thamrin"],
  ["The Westin", "The Westin Jakarta hotel"],
  ["Le Meridien", "Le Meridien Jakarta hotel"],
  ["Artotel Mangkuluhur", "ARTOTEL Mangkuluhur Jakarta"],
  ["Four Points", "Four Points by Sheraton Sudirman Jakarta"],
  ["GranDhika Iskandarsyah", "Grandhika Iskandarsyah Jakarta"],
  ["Mercure Gatot Subroto", "Mercure Gatot Subroto Jakarta"],
]);

// Foto yang sudah terverifikasi cocok (pakai nama file Commons persis)
const WIKI_FILE = new Map<string, string>([
  ["Mercure Gatot Subroto", "File:Hotel Mercure Jakarta Gatot Subroto (2025).jpg"],
]);

const WAVE_UA = { "user-agent": "Wavy-UKK-Demo/1.0 (student project; contact: none)" };

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
    "?action=query&generator=search&gsrnamespace=6&gsrlimit=20&gsrsearch=" +
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

function stripTags(html: string) {
  return html
    .replace(/\\u([0-9a-fA-F]{4})/g, (_, h) => String.fromCharCode(parseInt(h, 16)))
    .replace(/\\\//g, "/")
    .replace(/\\n/g, "\n")
    .replace(/\\r/g, "")
    .replace(/<[^>]+>/g, "\n")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/\u2013|\u2014/g, "-");
}

async function main() {
  const res = await fetch(PAGE_URL, { headers: UA });
  if (!res.ok) throw new Error(`${res.status} ${PAGE_URL}`);
  const html = await res.text();

  const lines = stripTags(html)
    .split("\n")
    .map((l) => l.trim())
    .filter(Boolean);

  const re = /^["'\s]*CAT\s*(\d)\s+(.+?)\s+-\s+\2\s*,\s*(.+)$/;
  const roomsByHotel = new Map<string, Room[]>();
  const tierByHotel = new Map<string, string>();

  for (const line of lines) {
    const m = line.match(re);
    if (!m) continue;
    const [, cat, hotel, room] = m;
    const key = hotel.trim();
    const roomName = room.replace(/^["'\\]+|["'\\]+$/g, "").trim();
    if (!roomName) continue;
    if (!roomsByHotel.has(key)) roomsByHotel.set(key, []);
    roomsByHotel.get(key)!.push({ category: `CAT ${cat}`, room: roomName });
    tierByHotel.set(key, `CAT ${cat}`);
  }

  if (!roomsByHotel.size) throw new Error("no hotel packages parsed from page");

  const hotels: Hotel[] = [...roomsByHotel.entries()]
    .sort((a, b) => {
      const ca = tierByHotel.get(a[0]) ?? "";
      const cb = tierByHotel.get(b[0]) ?? "";
      return ca.localeCompare(cb) || a[0].localeCompare(b[0]);
    })
    .map(([key, rooms], i) => {
      const est = ESTIMATE.get(key) ?? { price: "1500000", rating: "4.0", gradient: "linear-gradient(135deg,#7DD3E8,#4A90D9)" };
      return {
        id: i + 1,
        name: DISPLAY.get(key) ?? key,
        location: LOCATION.get(key) ?? "Jakarta",
        price: est.price,
        rating: est.rating,
        gradient: est.gradient,
        tier: tierByHotel.get(key) ?? "",
        rooms: rooms.slice().sort((x, y) => x.room.localeCompare(y.room)),
        ticketCat: tierByHotel.get(key) ?? "",
      };
    });

  // foto dari Wikimedia Commons (kalau ada), fallback: komponen pakai gradient
  const displayToKey = new Map([...DISPLAY].map(([k, v]) => [v, k]));
  let withImages = 0;
  for (const h of hotels) {
    const key = displayToKey.get(h.name) ?? h.name;
    const override = WIKI_FILE.get(key);
    let img = override ? await wikiFileImage(override) : undefined;
    if (!img) {
      const query = IMAGE_SEARCH.get(key) ?? `${key} Jakarta hotel`;
      img = await wikiImage(query);
    }
    if (img) {
      (h as any).image = img;
      withImages++;
      console.log(`  img ${h.name} <- ${img.split("/").slice(-1)[0]}`);
    } else {
      console.log(`  img ${h.name} <- (gradient)`);
    }
    await new Promise((res) => setTimeout(res, 500));
  }
  console.log(`images found: ${withImages}/${hotels.length}`);

  mkdirSync(dirname(OUT_PATH), { recursive: true });
  writeFileSync(OUT_PATH, JSON.stringify(hotels, null, 2));
  console.log(`scraped ${hotels.length} hotels from Loket YE hotel bundling`);
  for (const h of hotels) console.log(`  - [${h.tier}] ${h.name} @ ${h.location} (${h.rooms.map((r) => r.room).join(", ")})`);
  console.log("wrote", OUT_PATH);
}

await main();