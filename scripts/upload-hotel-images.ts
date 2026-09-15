import { readFileSync, writeFileSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dir = dirname(fileURLToPath(import.meta.url));
const HOTELS_JSON = resolve(__dir, "../../wavy-next/src/data/hotels.json");

const CLOUDINARY_URL = parseCloudinary();
if (!CLOUDINARY_URL) {
  console.error("CLOUDINARY_URL missing (check wavy-backend/.env)");
  process.exit(1);
}
const { key, secret, cloud } = CLOUDINARY_URL;

const UA = "Wavy-UKK-Demo/1.0 (student project)";

const EXTRA_SOURCES: Record<number, string[]> = {
  2: ["https://media.iceportal.com/127254/photos/79921081_XL.jpg"],
  3: ["https://image-tc.galaxy.tf/wijpeg-ztac20qf5zthslu6pyyjpiwl/hotel-gran-mahakam.jpg?width=1920"],
  10: [
    "https://cache.marriott.com/content/dam/marriott-renditions/JKTWI/jktwi-exterior-3609-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1300px:*",
    "https://images.trvl-media.com/lodging/16000000/15670000/15663900/15663894/c900443e.jpg",
  ],
  11: [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Four_Points_by_Sheraton_Jakarta_Thamrin_%28Desember_2024%29.jpg/1200px-Four_Points_by_Sheraton_Jakarta_Thamrin_%28Desember_2024%29.jpg",
  ],
  12: [
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/597970315.jpg?k=ed1155caed3c107c74ba7764b4085b9f5d82d3d40b021a2a489d220c5e0efa2b&o=",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/32/0b/c2/a0/hotel-grandhika.jpg?w=900&h=500&s=1",
  ],
};

function parseCloudinary() {
  let raw = process.env.CLOUDINARY_URL;
  if (!raw) {
    try {
      const envPath = resolve(__dir, "../.env");
      const text = readFileSync(envPath, "utf8");
      const m = text.match(/^CLOUDINARY_URL=(.+)$/m);
      if (m) raw = m[1].trim();
    } catch {
      /* ignore */
    }
  }
  if (!raw) return null;
  const m = raw.match(/^cloudinary:\/\/([^:]+):([^@]+)@(.+)$/);
  if (!m) return null;
  return { key: m[1], secret: m[2], cloud: m[3] };
}

async function download(url: string): Promise<{ bytes: Uint8Array; type: string } | null> {
  for (let attempt = 0; attempt < 2; attempt++) {
    try {
      const r = await fetch(url, { headers: { "user-agent": UA }, redirect: "follow" });
      if (!r.ok) return null;
      const buf = new Uint8Array(await r.arrayBuffer());
      const type = r.headers.get("content-type") ?? "";
      if (buf.length === 0 || !type.startsWith("image/")) return null;
      return { bytes: buf, type };
    } catch {
      await new Promise((res) => setTimeout(res, 1200));
    }
  }
  return null;
}

async function uploadImage(bytes: Uint8Array, type: string, publicId: string): Promise<string | null> {
  for (let attempt = 0; attempt < 2; attempt++) {
    try {
      const fd = new FormData();
      fd.append("file", new Blob([bytes as BlobPart], { type }), "hotel.jpg");
      fd.append("public_id", publicId);
      fd.append("overwrite", "true");
      const r = await fetch(`https://api.cloudinary.com/v1_1/${cloud}/image/upload`, {
        method: "POST",
        headers: { Authorization: "Basic " + btoa(`${key}:${secret}`) },
        body: fd,
      });
      const j: any = await r.json();
      if (r.ok && j?.secure_url) return j.secure_url;
      console.error(`  upload fail (${r.status}): ${j?.error?.message ?? ""}`);
      return null;
    } catch (e: any) {
      console.error("  upload err:", String(e?.message ?? e).slice(0, 100));
      await new Promise((res) => setTimeout(res, 1500));
    }
  }
  return null;
}

const hotels: any[] = JSON.parse(readFileSync(HOTELS_JSON, "utf8"));
let done = 0;
for (const h of hotels) {
  const id: number = h.id;
  if (h.image?.startsWith("https://res.cloudinary.com/")) {
    console.log(`[${id}] ${h.name} <- already cloudinary (skip)`);
    continue;
  }
  const candidates = [...(EXTRA_SOURCES[id] ?? []), ...(h.image ? [h.image] : [])];
  if (candidates.length === 0) {
    console.log(`[${id}] ${h.name} <- no source (skip)`);
    continue;
  }
  let photo: { bytes: Uint8Array; type: string } | null = null;
  for (const src of candidates) {
    const got = await download(src);
    if (got) {
      photo = got;
      console.log(`[${id}] ${h.name} <- src ${src.slice(0, 90)}`);
      break;
    }
    console.log(`[${id}] ${h.name} <- src fail ${src.slice(0, 90)}`);
  }
  if (!photo) {
    console.log(`[${id}] ${h.name} <- NO DOWNLOAD (keep as-is)`);
    continue;
  }
  const publicId = `wavy/hotels/${id}`;
  const url = await uploadImage(photo.bytes, photo.type, publicId);
  if (url) {
    h.image = url;
    done += 1;
    console.log(`[${id}] ${h.name} -> ${url}`);
  }
  await new Promise((res) => setTimeout(res, 300));
}

if (done > 0) {
  writeFileSync(HOTELS_JSON, JSON.stringify(hotels, null, 2) + "\n", "utf8");
}
console.log(`\nuploaded ${done}/${hotels.length} hotels. image-bearing: ${hotels.filter((h) => h.image).length}/${hotels.length}`);
console.log("wrote", HOTELS_JSON);