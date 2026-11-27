import type { Sql } from "postgres";

// Verifikasi organizer oleh admin (status pending_verification -> active / rejected). Idempotent.
//
// SQL mentah (setara):
//   ALTER TABLE organizers ADD COLUMN IF NOT EXISTS email_verified_at timestamptz; -- OTP email dari pendaftaran
//   ALTER TABLE organizers ADD COLUMN IF NOT EXISTS reviewed_at timestamptz;       -- waktu admin setujui/tolak
//   ALTER TABLE organizers ADD COLUMN IF NOT EXISTS rejection_reason text;         -- alasan penolakan (dikirim ke EO)
//   CREATE INDEX IF NOT EXISTS idx_organizers_status ON organizers (status);
export async function migrateOrganizerVerification(sql: Sql<any>) {
  await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS email_verified_at timestamptz`;
  await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS reviewed_at timestamptz`;
  await sql`ALTER TABLE organizers ADD COLUMN IF NOT EXISTS rejection_reason text`;
  await sql`CREATE INDEX IF NOT EXISTS idx_organizers_status ON organizers (status)`;
}
