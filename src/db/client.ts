import postgres from "postgres";
import { resolveSsl } from "./ssl";

const url = new URL(process.env.DATABASE_URL!);
url.search = "";

export const sql = postgres(url.toString(), {
  // NeonDB wajib SSL; DATABASE_SSL=disable hanya diterima untuk host lokal (test)
  ssl: resolveSsl(url.hostname, process.env.DATABASE_SSL),
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