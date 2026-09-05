import { sql } from "../src/db/client";

const ev = await sql`SELECT count(*)::int AS n, count(poster_url)::int AS posters, count(description)::int AS descs, min(date)::date AS earliest, max(date)::date AS latest FROM events`;
const up = await sql`SELECT count(*)::int AS n FROM events WHERE date >= now()`;
const orgs = await sql`SELECT count(*)::int AS n FROM organizers WHERE email LIKE 'demo.scrape-%' OR email LIKE 'demo.%@wavy.seed'`;
const cats = await sql`SELECT count(*)::int AS n FROM ticket_categories`;
const sample = await sql`SELECT title, venue, poster_url, left(description, 80) AS descr FROM events ORDER BY date ASC LIMIT 3`;

console.log("events:", JSON.stringify(ev[0]));
console.log("upcoming:", JSON.stringify(up[0]));
console.log("seed organizers:", JSON.stringify(orgs[0]));
console.log("ticket_categories:", JSON.stringify(cats[0]));
console.table(sample);

await sql.end();