import { sql } from "../src/db/client";

await sql`
  ALTER TABLE events
    ADD COLUMN IF NOT EXISTS gallery text NOT NULL DEFAULT '[]',
    ADD COLUMN IF NOT EXISTS terms_conditions text NOT NULL DEFAULT ''
`;
await sql`
  ALTER TABLE ticket_categories
    ADD COLUMN IF NOT EXISTS benefits text NOT NULL DEFAULT ''
`;
const cols = await sql`
  SELECT table_name, column_name FROM information_schema.columns
  WHERE (table_name = 'events' AND column_name IN ('gallery','terms_conditions'))
     OR (table_name = 'ticket_categories' AND column_name = 'benefits')
`;
for (const c of cols) console.log(`+ ${c.table_name}.${c.column_name}`);
await sql.end();