// Membuang branding "Loket.com" dari teks seed (deskripsi & syarat-ketentuan event)
// tanpa menyentuh URL gambar (https://assets.loket.com/...) dan tanpa mengubah kata
// "loket" yang berarti counter/tempat penukaran.
//
// Pakai:
//   bun scripts/strip-loket.ts            # tulis ulang file seed di tempat
//   bun scripts/strip-loket.ts --check    # hanya hitung, tidak menulis
//   bun scripts/strip-loket.ts --sql      # tulis ulang fungsi pg_temp.strip_loket di
//                                         # scripts/strip-loket-neon.sql dari RULES
//
// Fungsi SQL di strip-loket-neon.sql DIBANGKITKAN dari RULES di bawah (jangan edit tangan);
// tests/strip-loket.test.ts memastikan isinya sama dan hasil Postgres = hasil stripLoket().

import { readFileSync, readdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";

// replacement memakai backreference gaya JS ($1); di SQL ditulis .
export type Rule = { name: string; pattern: string; flags: "gi" | "g"; replacement: string };

// Karakter sebelum "loket" yang menandakan bagian URL/email/domain, bukan teks.
const NOT_URL = String.raw`(?<![\w./@-])`;

// Nomor telepon call center Loket (021-30003160 & 021-80600822) dalam berbagai format:
// +6221-30003160, 021 3000 3160, +62 2130003160, +62-21-8060-0822, +62 218 0600 822.
const LOKET_PHONE = String.raw`(?:\+62|0)[ -]?21[ -]?(?:3000[ -]?3160|8060[ -]?0822|8[ -]?0600[ -]?822)(?![\w-])`;
const PHONE_LABEL = String.raw`(?:PHONE|Phone|Telepon|Telephone)`;
// spasi termasuk NBSP (\u00a0): Postgres tidak selalu menganggap NBSP sebagai \s
const BS = "\\";
const SP = `[${BS}s${BS}u00a0]`; // escape ASCII (bukan karakter NBSP) supaya SQL hasil generate tetap terbaca

// Urutan penting. Pola ditulis supaya kompatibel dengan JS dan regex ARE Postgres.
export const RULES: Rule[] = [
  {
    // 1. Hapus atribut href yang mengarah ke loket.com; teks anchor tetap.
    name: "href",
    pattern: String.raw`\s+href\s*=\s*("[^"]*loket\.com[^"]*"|'[^']*loket\.com[^']*')`,
    flags: "gi",
    replacement: "",
  },
  {
    // 2. Email support (termasuk salah ketik "suppport").
    name: "support-email",
    pattern: String.raw`(?<![\w.])sup+ort@loket\.com`,
    flags: "gi",
    replacement: "layanan pelanggan Wavy",
  },
  {
    // 3. Aplikasi "LOKET X" / "Loket X" / "Loket-X".
    name: "loket-x",
    pattern: NOT_URL + String.raw`loket[ -]?x(?!\w)`,
    flags: "gi",
    replacement: "Wavy",
  },
  {
    // 4. Domain sebagai teks: Loket.com, LOKET.COM, loket com, Loketcom, www.loket.com,
    //    serta https://www.loket.com (akar situs saja, bukan URL berpath).
    name: "loket-com",
    pattern:
      NOT_URL +
      String.raw`(https?://)?(www\.)?loket(\.|\s)?com(/(?=[^\w/.-]|$))?(?![\w/-]|\.\w)`,
    flags: "gi",
    replacement: "Wavy",
  },
  {
    // 5. Handle media sosial "@LOKET" di footer.
    name: "handle",
    pattern: String.raw`\s+@loket(?![\w.@-])`,
    flags: "gi",
    replacement: "",
  },
  {
    // 6. Nama badan usaha Loket.
    name: "company",
    pattern: String.raw`PT\.?\s+Global\s+Loket\s+Sejahtera`,
    flags: "gi",
    replacement: "Wavy",
  },
  {
    // 7. Merek "Loket"/"LOKET" berdiri sendiri. SENGAJA case-sensitive: kata "loket"
    //    huruf kecil (counter penukaran) tidak disentuh.
    name: "brand",
    pattern: NOT_URL + String.raw`(Loket|LOKET)(?![\w@/-]|\.\w)`,
    flags: "g",
    replacement: "Wavy",
  },
  {
    // 8. Rapikan "LOKET (PT Global Loket Sejahtera)" yang jadi "Wavy (Wavy)".
    name: "dedupe",
    pattern: String.raw`Wavy\s*\(Wavy\)`,
    flags: "g",
    replacement: "Wavy",
  },
  {
    // 9. Rapikan "layanan pelanggan support@loket.com" yang jadi kalimat dobel.
    name: "dedupe-support",
    pattern: String.raw`layanan pelanggan\s+layanan pelanggan Wavy`,
    flags: "gi",
    replacement: "layanan pelanggan Wavy",
  },
  // ---- 10–19: merapikan kalimat yang kaku setelah penggantian di atas ----
  {
    // 10. Paragraf/span yang hanya berisi label + nomor telepon Loket.
    name: "phone-block",
    pattern:
      String.raw`<p[^>]*>${SP}*${PHONE_LABEL}${SP}*:${SP}*${LOKET_PHONE}${SP}*</p>` +
      String.raw`|<span[^>]*>${SP}*${PHONE_LABEL}${SP}*:${SP}*</span>${SP}*<span[^>]*>${SP}*${LOKET_PHONE}${SP}*</span>(?:<span[^>]*>${SP}*<br${SP}*/?>${SP}*</span>)?`,
    flags: "g",
    replacement: "",
  },
  {
    // 11. Baris "PHONE : 021-30003160" (beserta <br>/baris baru sebelumnya, dan "; " sesudahnya).
    name: "phone-line",
    pattern: String.raw`(?:<br${SP}*/?>)?${SP}*${PHONE_LABEL}${SP}*:${SP}*${LOKET_PHONE}(?:${SP}*;)?`,
    flags: "g",
    replacement: "",
  },
  {
    // 12. Nomor Loket yang menempel di teks: "Wavy +6221-30003160", "... or +62-21-8060-0822".
    name: "phone-inline",
    pattern: String.raw`${SP}+(?:or${SP}+|atau${SP}+)?${LOKET_PHONE}`,
    flags: "g",
    replacement: "",
  },
  {
    // 13. "contacting the Wavy call center at layanan pelanggan Wavy" -> "contacting Wavy Customer Service".
    name: "call-center",
    pattern: String.raw`the Wavy call center at${SP}*(?:<a[^>]*>)?${SP}*layanan pelanggan Wavy${SP}*(?:</a>)?`,
    flags: "g",
    replacement: "Wavy Customer Service",
  },
  {
    // 14. Kalimat Inggris: "contact / to layanan pelanggan Wavy" -> "... Wavy Customer Service".
    name: "english-cs",
    pattern: String.raw`(?<![\w])(contact|to)(${SP}+)layanan pelanggan Wavy`,
    flags: "g",
    replacement: "$1$2Wavy Customer Service",
  },
  {
    // 15. "Email: layanan pelanggan Wavy" bukan alamat email -> "Wavy Customer Service" (tag di antaranya tetap).
    name: "email-label",
    pattern: String.raw`(?:E-?mail|EMAIL)${SP}*:${SP}*((?:<[^>]+>|${SP})*)layanan pelanggan Wavy`,
    flags: "g",
    replacement: "$1Wavy Customer Service",
  },
  {
    // 16. "Customer Service Wavy\nWavy Customer Service" -> "Customer Service Wavy".
    name: "dedupe-cs-1",
    pattern: String.raw`Customer Service Wavy(?:${SP}|<br${SP}*/?>)+Wavy Customer Service`,
    flags: "g",
    replacement: "Customer Service Wavy",
  },
  {
    // 17. "Wavy Customer Service<br>Wavy Customer Service" -> satu kali.
    name: "dedupe-cs-2",
    pattern: String.raw`Wavy Customer Service(?:${SP}|<br${SP}*/?>)+Wavy Customer Service`,
    flags: "g",
    replacement: "Wavy Customer Service",
  },
  {
    // 18. "Wavy\nWavy Customer Service" / "hubungi Wavy Wavy Customer Service" -> "Wavy Customer Service".
    name: "dedupe-cs-3",
    pattern: String.raw`(?<![\w])Wavy(?:${SP}|<br${SP}*/?>)+Wavy Customer Service`,
    flags: "g",
    replacement: "Wavy Customer Service",
  },
  {
    // 19. "Wavy Customer Service - layanan pelanggan Wavy /" (sisa setelah nomor dibuang) -> satu kali.
    name: "dedupe-cs-4",
    pattern: String.raw`Wavy Customer Service${SP}*-${SP}*layanan pelanggan Wavy(?:${SP}*/)?`,
    flags: "g",
    replacement: "Wavy Customer Service",
  },
  {
    // 20. "issued by the Wavy." -> "issued by Wavy." (artikel sebelum nama merek di akhir frasa).
    name: "the-wavy",
    pattern: String.raw`(?<![\w])the Wavy(?=[.,;:!?)])`,
    flags: "g",
    replacement: "Wavy",
  },
];

// ---- fungsi Postgres yang setara (dipakai strip-loket-neon.sql) ----

export const SQL_FN_START = "-- strip-loket:function:start";
export const SQL_FN_END = "-- strip-loket:function:end";

const sqlLiteral = (s: string) => "'" + s.replace(/'/g, "''") + "'";

export function sqlFunction(): string {
  const rows = RULES.map((r, i) => {
    const replacement = r.replacement.replace(/\$(\d)/g, "\\$1"); // $1 (JS) -> \1 (Postgres)
    const sep = i === RULES.length - 1 ? "" : ",";
    return `    (${i + 1}, ${sqlLiteral(r.pattern)}, ${sqlLiteral(replacement)}, ${sqlLiteral(r.flags)})${sep} -- ${r.name}`;
  });
  return [
    SQL_FN_START,
    "-- Dibangkitkan oleh `bun scripts/strip-loket.ts --sql` dari RULES; jangan edit tangan.",
    "CREATE FUNCTION pg_temp.strip_loket(t text) RETURNS text",
    "LANGUAGE plpgsql IMMUTABLE AS $fn$",
    "DECLARE r record;",
    "BEGIN",
    "  IF t IS NULL THEN RETURN NULL; END IF;",
    "  FOR r IN SELECT * FROM (VALUES",
    ...rows,
    "  ) AS v(n, pattern, replacement, flags) ORDER BY n LOOP",
    "    t := regexp_replace(t, r.pattern, r.replacement, r.flags);",
    "  END LOOP;",
    "  RETURN t;",
    "END",
    "$fn$;",
    SQL_FN_END,
  ].join("\n");
}

// Ganti blok fungsi di antara penanda START/END dengan hasil sqlFunction().
export function replaceSqlFunction(sqlFile: string): string {
  const start = sqlFile.indexOf(SQL_FN_START);
  const end = sqlFile.indexOf(SQL_FN_END);
  if (start === -1 || end === -1) throw new Error("penanda strip-loket:function tidak ditemukan");
  return sqlFile.slice(0, start) + sqlFunction() + sqlFile.slice(end + SQL_FN_END.length);
}

const compiled = RULES.map((r) => ({ ...r, re: new RegExp(r.pattern, r.flags) }));

export function stripLoket(text: string): string {
  let out = text;
  for (const r of compiled) out = out.replace(r.re, r.replacement);
  return out;
}

export type LoketCounts = { asset: number; counter: number; other: number };

// asset   = "loket" di dalam URL assets.loket.com (harus tetap)
// counter = kata "loket" huruf kecil berdiri sendiri (counter / metadata, harus tetap)
// other   = sisanya (branding teks, email, href, dll.) — target 0 setelah strip
export function countLoket(text: string): LoketCounts {
  const total = text.match(/loket/gi)?.length ?? 0;
  const asset = text.match(/assets\.loket\.com/gi)?.length ?? 0;
  const counter = text.match(/(?<![\w./@-])loket(?![\w.@-])/g)?.length ?? 0;
  return { asset, counter, other: total - asset - counter };
}

// ---- transform per format file ----

// Hanya isi string literal SQL ('...' dengan '' sebagai escape) yang diubah; komentar
// dan kode SQL dibiarkan.
export function transformSql(src: string, fn: (s: string) => string): string {
  let out = "";
  let i = 0;
  while (i < src.length) {
    const ch = src[i];
    if (ch === "-" && src[i + 1] === "-") {
      const nl = src.indexOf("\n", i);
      const end = nl === -1 ? src.length : nl;
      out += src.slice(i, end);
      i = end;
    } else if (ch === "'") {
      let j = i + 1;
      let body = "";
      while (j < src.length) {
        if (src[j] === "'") {
          if (src[j + 1] === "'") {
            body += "'";
            j += 2;
            continue;
          }
          break;
        }
        body += src[j];
        j++;
      }
      out += "'" + fn(body).replace(/'/g, "''") + "'";
      i = j + 1;
    } else {
      out += ch;
      i++;
    }
  }
  return out;
}

// Ubah setiap string literal JSON; yang tidak berubah ditulis ulang apa adanya.
export function transformJson(src: string, fn: (s: string) => string): string {
  return src.replace(/"(?:[^"\\]|\\.)*"/g, (lit) => {
    const value = JSON.parse(lit) as string;
    const next = fn(value);
    return next === value ? lit : JSON.stringify(next);
  });
}

function addCounts(a: LoketCounts, b: LoketCounts): LoketCounts {
  return { asset: a.asset + b.asset, counter: a.counter + b.counter, other: a.other + b.other };
}

if (import.meta.main && process.argv.includes("--sql")) {
  const file = join(import.meta.dir, "strip-loket-neon.sql");
  const src = readFileSync(file, "utf8");
  const eol = src.includes("\r\n") ? "\r\n" : "\n";
  writeFileSync(file, replaceSqlFunction(src.replace(/\r\n/g, "\n")).replace(/\n/g, eol));
  console.log(`fungsi strip_loket ditulis ulang (${RULES.length} aturan) di ${file}`);
} else if (import.meta.main) {
  const check = process.argv.includes("--check");
  const dir = import.meta.dir;
  const files = [
    join(dir, "seed-scraped.sql"),
    join(dir, "_tnc.json"),
    ...readdirSync(join(dir, "_manual-tnc"))
      .filter((f) => f.endsWith(".txt"))
      .map((f) => join(dir, "_manual-tnc", f)),
  ];

  let before: LoketCounts = { asset: 0, counter: 0, other: 0 };
  let after: LoketCounts = { asset: 0, counter: 0, other: 0 };
  for (const file of files) {
    const src = readFileSync(file, "utf8");
    const next = file.endsWith(".sql")
      ? transformSql(src, stripLoket)
      : file.endsWith(".json")
        ? transformJson(src, stripLoket)
        : stripLoket(src);
    const b = countLoket(src);
    const a = countLoket(next);
    before = addCounts(before, b);
    after = addCounts(after, a);
    console.log(
      `${file.slice(dir.length + 1)}: other ${b.other} -> ${a.other}, asset ${b.asset} -> ${a.asset}, counter ${b.counter} -> ${a.counter}`
    );
    if (!check && next !== src) writeFileSync(file, next);
  }
  console.log(
    `TOTAL: other ${before.other} -> ${after.other}, asset ${before.asset} -> ${after.asset}, counter ${before.counter} -> ${after.counter}`
  );
}
