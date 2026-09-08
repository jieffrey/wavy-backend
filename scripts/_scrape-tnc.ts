import { sql } from "../src/db/client";
const slugs = require("./_slugs-all.json");
const headers = { "user-agent": "Mozilla/5.0", "accept": "application/json", "accept-language": "id-ID,id;q=0.9" };
const out = {};
let done = 0;
for (const row of slugs) {
  if (!row.slug) continue;
  try {
    let tnc = null, desc = null;
    if (row.sort === "loket") {
      const r = await fetch(`https://rest.loket.com/fusio/api/v1/public/events/${row.slug}`, { headers });
      if (r.status !== 200) { console.log(`loket ${row.id} ${row.slug} -> ${r.status}`); done++; continue; }
      const j = await r.json();
      tnc = j.result?.schedules?.[0]?.template?.tnc || null;
    } else {
      const r = await fetch(`https://api.artatix.co.id/api/v1/customer/event/${row.slug}`, { headers });
      if (r.status !== 200) { console.log(`artatix ${row.id} ${row.slug} -> ${r.status}`); done++; continue; }
      const j = await r.json();
      tnc = j.data?.sk || null;
    }
    if (!tnc) { console.log(`${row.id} ${row.slug}: NO TNC`); continue; }
    const isHtml = /<[a-z][\s\S]*>/i.test(tnc);
    // strip script/style blocks and on* handlers for safety
    const clean = tnc
      .replace(/<script[\s\S]*?<\/script>/gi, "")
      .replace(/<style[\s\S]*?<\/style>/gi, "");
    const plain = clean.replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
    out[row.id] = { slug: row.slug, sort: row.sort, html: isHtml, len: plain.length, raw: clean };
    console.log(`${row.id} | ${row.sort} | ${isHtml ? "HTML" : "TXT"} | ${plain.length} | ${row.slug}`);
    done++;
  } catch (e) {
    console.log(`${row.id} ${row.slug} ERR ${e.message}`);
  }
  await new Promise((r) => setTimeout(r, 200));
}
require("fs").writeFileSync("C:/Users/kalsah/project-ukk/wavy-backend/scripts/_tnc.json", JSON.stringify(out, null, 2));
console.log("fetched:", done, "/", slugs.length);
await sql.end();