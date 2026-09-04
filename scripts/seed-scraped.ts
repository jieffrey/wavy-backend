import { sql } from "../src/db/client";

const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
const sqlContent = await Bun.file(sqlPath).text();

console.log("Reading seed SQL from:", sqlPath);
console.log("Executing seed SQL...");

try {
  await sql.unsafe(sqlContent);
  console.log("Seed SQL executed successfully.");
} catch (err: any) {
  console.error("Seed SQL failed:", err.message);
  process.exit(1);
} finally {
  await sql.end();
}
