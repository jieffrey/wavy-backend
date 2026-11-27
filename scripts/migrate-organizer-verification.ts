import { sql } from "../src/db/client";
import { migrateOrganizerVerification } from "../src/db/migrations/organizer-verification";

// Jalankan per database: bun scripts/migrate-organizer-verification.ts (idempotent)
// SQL mentah ada di komentar src/db/migrations/organizer-verification.ts.
await migrateOrganizerVerification(sql);
const cols = await sql`
  SELECT column_name, data_type FROM information_schema.columns
  WHERE table_name = 'organizers' AND column_name IN ('email_verified_at', 'reviewed_at', 'rejection_reason')
  ORDER BY column_name
`;
for (const c of cols) console.log(`+ organizers.${c.column_name} (${c.data_type})`);
const [pending] = await sql<{ n: number }[]>`SELECT COUNT(*)::int AS n FROM organizers WHERE status = 'pending_verification'`;
console.log(`organizer menunggu verifikasi: ${pending.n}`);
await sql.end();
