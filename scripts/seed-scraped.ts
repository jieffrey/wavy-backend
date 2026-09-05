import { sql } from "../src/db/client";

const sqlPath = `${import.meta.dir}/seed-scraped.sql`;
const raw = await Bun.file(sqlPath).text();

const beginIdx = raw.indexOf("BEGIN;");
const endIdx = raw.lastIndexOf("COMMIT;");
const truncateSql = raw.slice(0, beginIdx).trim();
const insertSql = raw.slice(beginIdx + "BEGIN;".length, endIdx).trim();

console.log("Reading seed SQL from:", sqlPath);
console.log("Executing seed SQL...");

try {
  await sql.begin(async (tx) => {
    await tx.unsafe(truncateSql);
    await tx.unsafe(insertSql);
  });
  console.log("Seed SQL executed successfully.");
} catch (err: any) {
  console.error("Seed SQL failed:", err.message);
  process.exit(1);
} finally {
  await sql.end();
}