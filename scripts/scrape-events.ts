import { writeFileSync } from "fs";

const UA = { "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" };

const ARTATIX_API = "https://api.artatix.co.id/api/v1";
const LOKET_API = "https://rest.loket.com/fusio/api/v1/public/discover";

async function getJson(url: string, headers: Record<string, string> = {}) {
  const res = await fetch(url, { headers: { ...UA, ...headers } });
  if (!res.ok) throw new Error(`${res.status} for ${url}`);
  return res.json();
}

async function getText(url: string, headers: Record<string, string> = {}) {
  const res = await fetch(url, { headers: { ...UA, ...headers } });
  if (!res.ok) throw new Error(`${res.status} for ${url}`);
  return res.text();
}

// ---------- ARTATIX ----------
async function scrapeArtatix() {
  const out: any[] = [];
  const seen = new Set<string>();
  let page = 1;
  while (true) {
    const j = await getJson(`${ARTATIX_API}/customer/event?page=${page}&limit=100`);
    const items = j?.data?.data ?? [];
    if (items.length === 0) break;
    for (const it of items) {
      if (seen.has(it.slug)) continue;
      seen.add(it.slug);
      try {
        const d = (await getJson(`${ARTATIX_API}/customer/event/${it.slug}`))?.data;
        out.push({
          source: "artatix",
          title: (d?.name ?? it.name).trim(),
          price_low: d?.lowestPrice ?? it.lowestPrice,
          date_start: d?.dateStart ?? it.dateStart,
          date_end: d?.dateEnd ?? it.dateEnd,
          time_start: d?.timeStart ?? it.timeStart,
          time_end: d?.timeEnd ?? it.timeEnd,
          venue: d?.location ?? it.location,
          city: d?.city ?? it.city,
          province: d?.province ?? it.province,
          organizer: (d?.user?.name ?? it.creator?.name ?? "").trim(),
          category: d?.eventCategory?.name ?? "",
          image: `https://assets.artatix.co.id/${d?.image ?? it.image}`,
          item_link: `https://www.artatix.co.id/event/${it.slug}`,
          eventModel: it.eventModel,
          eventSessionChildren: it.eventSessionChildren ?? "0",
        });
      } catch (e: any) {
        out.push({
          source: "artatix",
          title: it.name,
          price_low: it.lowestPrice,
          date_start: it.dateStart,
          date_end: it.dateEnd,
          venue: it.location,
          city: it.city,
          province: it.province,
          organizer: it.creator?.name ?? "",
          category: "",
          image: `https://assets.artatix.co.id/${it.image}`,
          item_link: `https://www.artatix.co.id/event/${it.slug}`,
          eventModel: it.eventModel,
          eventSessionChildren: it.eventSessionChildren ?? "0",
          detail_error: e.message,
        });
      }
    }
    page++;
    if (page > 20) break;
    console.log(`artatix page ${page - 1}: ${out.length} collected`);
  }
  return out;
}

// ---------- LOKET ----------
async function scrapeLoket() {
  const out: any[] = [];
  const seen = new Set<string>();
  // event types: 3 Konser, 6 Konferensi, 7 Workshop, 9 Pertunjukan, 22 Komedi & Pertunjukan
  const types = ["3", "6", "7", "9", "22"];
  for (const t of types) {
    let page = 1;
    let totalRecords = Infinity;
    while (out.filter((e) => e.loket_type === t).length < totalRecords || totalRecords === Infinity) {
      const url = `${LOKET_API}?p=${page}&ps=50&f.d_ext=1&f.d_et=${t}`;
      const j = await getJson(url);
      const result = j?.result ?? {};
      totalRecords = result.total_records ?? 0;
      const items = result.data ?? [];
      if (items.length === 0) break;
      for (const it of items) {
        const slug = (it.link ?? "").split("/").pop() ?? "";
        const key = slug || it.event_name;
        if (seen.has(key)) continue;
        seen.add(key);
        try {
          const html = await getText(it.link);
          const ld = parseLoketLd(html);
          out.push({
            source: "loket",
            loket_type: t,
            title: (ld?.name ?? it.event_name ?? "").trim(),
            price_low: ld?.price_low ?? it.pricing?.price ?? it.price ?? null,
            price_high: ld?.price_high ?? null,
            date_start: (ld?.start_date ?? unixToDate(it.date?.start_date)) ?? null,
            date_end: (ld?.end_date ?? unixToDate(it.date?.end_date)) ?? null,
            time_start: null,
            time_end: null,
            venue: (ld?.location_name ?? it.location?.location_name ?? "").trim(),
            city: (it.location?.city ?? ld?.city ?? "").trim(),
            province: "",
            organizer: (ld?.organizer ?? it.organization?.name ?? it.organization_name ?? "").trim(),
            category: typeLabel(t),
            image: (ld?.image ?? it.banners?.desktop ?? it.banners?.banner ?? "").trim(),
            item_link: it.link?.trim(),
            eventModel: "event",
            eventSessionChildren: "0",
          });
        } catch (e: any) {
          out.push({
            source: "loket",
            loket_type: t,
            title: it.event_name,
            price_low: it.pricing?.price ?? it.price ?? null,
            date_start: unixToDate(it.date?.start_date),
            date_end: unixToDate(it.date?.end_date),
            venue: it.location?.location_name ?? "",
            city: it.location?.city ?? "",
            province: "",
            organizer: it.organization?.name ?? it.organization_name ?? "",
            category: typeLabel(t),
            image: it.banners?.desktop ?? it.banners?.banner ?? "",
            item_link: it.link,
            eventModel: "event",
            eventSessionChildren: "0",
            detail_error: e.message,
          });
        }
      }
      page++;
      if (page > 15) break;
    }
    console.log(`loket d_et=${t}: collected ${out.filter((e) => e.loket_type === t).length}/${totalRecords}`);
  }
  return out;
}

function parseLoketLd(html: string) {
  const m = html.match(/<script[^>]*application\/ld\+json[^>]*>([\s\S]*?)<\/script>/);
  if (!m) return null;
  try {
    const j = JSON.parse(m[1]);
    const start = j.startDate as string;
    const end = j.endDate as string;
    const loc = Array.isArray(j.location) ? j.location[0] : j.location;
    const locName = loc?.name ?? loc?.address?.addressLocality ?? "";
    const offers = j.offers;
    const low = Array.isArray(offers?.offers)
      ? Math.min(...offers.offers.map((o: any) => Number(o.price ?? 0)).filter((n: number) => n > 0))
      : null;
    return {
      name: j.name,
      start_date: start ? start.slice(0, 10) : null,
      end_date: end ? end.slice(0, 10) : null,
      location_name: locName,
      city: loc?.address?.addressLocality ?? "",
      organizer: j.organizer?.name ?? "",
      image: Array.isArray(j.image) ? j.image[0] : j.image ?? "",
      price_low: low ?? null,
      price_high: offers?.highPrice ?? null,
    };
  } catch {
    return null;
  }
}

function unixToDate(u: number | null | undefined) {
  if (!u) return null;
  return new Date(u * 1000).toISOString().slice(0, 10);
}

function typeLabel(t: string) {
  const map: Record<string, string> = {
    "3": "Konser",
    "6": "Konferensi & Seminar",
    "7": "Workshop & Pelatihan",
    "9": "Pertunjukan & Penampilan",
    "22": "Komedi & Pertunjukan",
  };
  return map[t] ?? "Lainnya";
}

const artatix = await scrapeArtatix();
const loket = await scrapeLoket();
const all = [...artatix, ...loket];

writeFileSync("scripts/scraped-events.json", JSON.stringify(all, null, 2));
console.log(`\nTotal: artatix=${artatix.length}, loket=${loket.length}, combined=${all.length}`);
console.log("Wrote scripts/scraped-events.json");