import bcrypt from "bcryptjs";
import { sql } from "../src/db/client";

const email = process.env.ADMIN_EMAIL;
const password = process.env.ADMIN_PASSWORD;
if (!email || !password) throw new Error("ADMIN_EMAIL and ADMIN_PASSWORD env required");

const [existing] = await sql<{ id: number }[]>`SELECT id FROM admins WHERE email = ${email}`;
if (existing) {
  console.log(`admin ${email} already exists`);
} else {
  await sql`INSERT INTO admins (name, email, password) VALUES ('Super Admin', ${email}, ${bcrypt.hashSync(password, 10)})`;
  console.log(`admin ${email} created`);
}
await sql.end();