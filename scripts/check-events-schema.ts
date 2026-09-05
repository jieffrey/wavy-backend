import { sql } from "../src/db/client";

const col = await sql`
  SELECT column_name, data_type, udt_name FROM information_schema.columns
  WHERE table_name = 'events' AND column_name IN ('category','venue','date','title')
`;
console.table(col);

await sql.end();