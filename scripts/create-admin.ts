// Buat akun admin, atau ganti password-nya kalau email sudah ada.
//
//   bun scripts/create-admin.ts --email admin@contoh.id --name "Nama Admin" --password "rahasia-panjang"
//
// Menulis ke database di DATABASE_URL (.env). Password tidak pernah dicetak.
import { parseArgs } from "node:util";
import bcrypt from "bcryptjs";
import { z } from "zod";
import type { Sql } from "postgres";

// Sama dengan hash yang dibandingkan adminService.login (bcryptjs, cost 10).
export const hashAdminPassword = (password: string) => bcrypt.hashSync(password, 10);

const inputSchema = z.object({
  email: z.string().trim().email(),
  name: z.string().trim().min(1),
  password: z.string().min(8),
});

export type CreateAdminInput = z.input<typeof inputSchema>;

export async function createAdmin(sql: Sql<any>, input: CreateAdminInput) {
  const { email, name, password } = inputSchema.parse(input);
  const hash = hashAdminPassword(password);
  return sql.begin(async (tx) => {
    // admins.email tidak punya unique constraint; lock per email supaya dua run bersamaan tidak membuat duplikat
    await tx`SELECT pg_advisory_xact_lock(hashtext(${"admins:" + email}))`;
    const [existing] = await tx<{ id: number }[]>`SELECT id FROM admins WHERE email = ${email} FOR UPDATE`;
    if (existing) {
      await tx`UPDATE admins SET name = ${name}, password = ${hash} WHERE id = ${existing.id}`;
      return { id: existing.id, email, action: "updated" as const };
    }
    const [row] = await tx<{ id: number }[]>`
      INSERT INTO admins (name, email, password) VALUES (${name}, ${email}, ${hash}) RETURNING id
    `;
    return { id: row.id, email, action: "created" as const };
  });
}

if (import.meta.main) {
  const { values } = parseArgs({
    options: {
      email: { type: "string" },
      name: { type: "string" },
      password: { type: "string" },
    },
    strict: true,
  });
  const parsed = inputSchema.safeParse(values);
  if (!parsed.success) {
    // pesan zod hanya menyebut nama field, bukan nilainya
    const fields = parsed.error.issues.map((i) => i.path.join(".")).join(", ");
    console.error(`Argumen tidak valid: ${fields}`);
    console.error('Pakai: bun scripts/create-admin.ts --email <email> --name "<nama>" --password "<min 8 karakter>"');
    process.exit(1);
  }
  const { sql } = await import("../src/db/client");
  try {
    const res = await createAdmin(sql, parsed.data);
    console.log(`admin ${res.email} ${res.action === "created" ? "dibuat" : "diperbarui (password diganti)"} (id ${res.id})`);
  } finally {
    await sql.end();
  }
}
