import postgres from "postgres";

const url = new URL(process.env.DATABASE_URL!);
url.search = "";

export const sql = postgres(url.toString(), {
  ssl: "require",
  prepare: false,
  max: 10,
});

export default sql;