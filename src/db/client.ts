import postgres from "postgres";

const url = new URL(process.env.DATABASE_URL!);
url.search = "";

// ponytail: prepare:false dibutuhkan utk Neon transaction-pooler (-pooler host);
// kalau pakai direct connection bisa dihapus. SSL di-force krn Neon wajib TLS.
export const sql = postgres(url.toString(), {
  ssl: "require",
  prepare: false,
  max: 10,
});

export default sql;