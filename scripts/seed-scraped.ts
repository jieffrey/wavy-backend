import { sql } from "../src/db/client";
import { readFileSync } from "fs";
import { resolve } from "path";

const sqlPath = resolve(import.meta.dir, "seed-scraped.sql");
const sqlContent = readFileSync(sqlPath, "utf-8");

console.log("Reading seed SQL from:", sqlPath);
console.log("Executing seed SQL...");

try {
  // postgres.js sql.unsafe() executes raw SQL without parameterization
  await sql.unsafe(sqlContent);
  console.log("Seed SQL executed successfully.");
} catch (err: any) {
  console.error("Seed SQL failed:", err.message);
  process.exit(1);
} finally {
  await sql.end();
}
