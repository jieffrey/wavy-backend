import { sql } from "../src/db/client";

const ev = await sql`SELECT count(*)::int AS n, count(poster_url)::int AS posters, count(CASE WHEN poster_url LIKE 'https://res.cloudinary.com/%' THEN 1 END)::int AS cloudinary FROM events`;
const ff = await sql`SELECT count(*)::int AS n FROM events WHERE title ILIKE '%free fire%' OR category ILIKE '%esports%'`;
const missing = await sql`SELECT title, poster_url FROM events WHERE poster_url = '' OR poster_url IS NULL LIMIT 10`;
const upcoming = await sql`SELECT count(*)::int AS n FROM events WHERE date >= now()`;

console.log("events:", JSON.stringify(ev[0]));
console.log("free-fire/esports events:", JSON.stringify(ff[0]));
console.log("events without poster:", JSON.stringify(missing));
console.log("upcoming:", JSON.stringify(upcoming[0]));

await sql.end();