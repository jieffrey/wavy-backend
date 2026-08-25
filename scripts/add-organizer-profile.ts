import { sql } from "../src/db/client";

// Migrasi idempotent: kolom profil & kontak untuk pengajuan kerja sama organizer.
await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS whatsapp TEXT NOT NULL DEFAULT ''`;
await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS event_types TEXT NOT NULL DEFAULT ''`;
await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS social_link TEXT NOT NULL DEFAULT ''`;

console.log("migrasi selesai: kolom whatsapp, event_types, social_link siap");
await sql.end();
