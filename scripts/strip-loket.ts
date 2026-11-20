// Membuang branding "Loket.com" dari teks seed (deskripsi & syarat-ketentuan event)
// tanpa menyentuh URL gambar (https://assets.loket.com/...) dan tanpa mengubah kata
// "loket" yang berarti counter/tempat penukaran.
//
// Pakai:
//   bun scripts/strip-loket.ts            # tulis ulang file seed di tempat
//   bun scripts/strip-loket.ts --check    # hanya hitung, tidak menulis
//
// Aturan yang sama dipakai di scripts/strip-loket-neon.sql (regexp_replace Postgres).
// Kalau mengubah aturan di sini, ubah juga SQL-nya.

import { readFileSync, readdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";

export type Rule = { name: string; pattern: string; flags: "gi" | "g"; replacement: string };

// Karakter sebelum "loket" yang menandakan bagian URL/email/domain, bukan teks.
const NOT_URL = String.raw`(?<![\w./@-])`;

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
];

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

if (import.meta.main) {
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
