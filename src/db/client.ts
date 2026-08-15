import postgres from "postgres";

const url = new URL(process.env.DATABASE_URL!);
url.search = "";

export const sql = postgres(url.toString(), {
  ssl: "require",
  prepare: false,
  max: 10,
  // kolom dibuat bigint/numeric, postgres-js default pulang sebagai string;
  // nilai semua kecil, jadi di-parse jadi number biar JSON konsisten (id, quantity, dll)
  types: {
    bigint: {
      to: 20,
      from: [20],
      parse: (x: string) => Number(x),
      serialize: (x: number) => x.toString(),
    },
    numeric: {
      to: 1700,
      from: [1700],
      parse: (x: string) => Number(x),
      serialize: (x: number) => x.toString(),
    },
  },
});

export default sql;