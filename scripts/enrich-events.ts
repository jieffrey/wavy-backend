import { writeFileSync } from "fs";

const events = JSON.parse(await Bun.file("scripts/filtered-events.json").text());
const UA = { "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" };

const stripHtml = (s?: string | null) => (s ?? "").replace(/<[^>]*>/g, " ").replace(/\s+/g, " ").trim();
const slugOf = (link: string) => (link || "").split("/").filter(Boolean).pop() ?? "";

async function artatixDetail(slug: string) {
  const res = await fetch(`https://api.artatix.co.id/api/v1/customer/event/${slug}`, { headers: UA });
  if (!res.ok) throw new Error(`artatix ${res.status}`);
  const d = (await res.json())?.data;
  return { description: stripHtml(d?.description), image: d?.image ? `https://assets.artatix.co.id/${d.image}` : null };
}

async function loketDetail(link: string) {
  const res = await fetch(link, { headers: UA });
  const html = await res.text();
  const m = html.match(/<script[^>]*application\/ld\+json[^>]*>([\s\S]*?)<\/script>/);
  if (!m) return { description: "" };
  try {
    const j = JSON.parse(m[1]);
    const img = Array.isArray(j.image) ? j.image[0] : j.image;
    return { description: stripHtml(j.description) };
  } catch {
    return { description: "" };
  }
}

let checked = 0;
for (const e of events) {
  checked++;
  try {
    if (e.source === "artatix") {
      const d = await artatixDetail(slugOf(e.item_link));
      e.description = d.description;
      e.image = e.image ?? d.image;
    } else {
      const d = await loketDetail(e.item_link);
      e.description = d.description;
    }
  } catch (err: any) {
    e.description = "";
    e.description_error = err.message;
  }

  // image check -> HTTP 200 + content-type image/*
  try {
    const r = await fetch(e.image, { method: "GET", headers: UA, redirect: "follow" });
    const ct = r.headers.get("content-type") ?? "";
    e.image_status = r.status;
    e.image_ok = r.ok && (ct.startsWith("image/") || /jpg|jpeg|png|webp/.test(ct));
  } catch {
    e.image_ok = false;
    e.image_status = 0;
  }
  process.stdout.write(`\r[${checked}/${events.length}] ${e.image_ok ? "OK " : "FAIL"} ${e.title.slice(0, 40)}`);
}

const missingDesc = events.filter((e: any) => !e.description).length;
const badImg = events.filter((e: any) => !e.image_ok).length;
console.log(`\nmissing descriptions: ${missingDesc}, bad images: ${badImg}`);

writeFileSync("scripts/filtered-events.json", JSON.stringify(events, null, 2));
console.log(`wrote ${events.length} enriched events`);