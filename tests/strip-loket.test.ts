import { describe, expect, test } from "bun:test";
import { readFileSync, readdirSync } from "node:fs";
import { join } from "node:path";
import { sql } from "../src/db/client";
import {
  SQL_FN_END,
  SQL_FN_START,
  countLoket,
  sqlFunction,
  stripLoket,
  transformJson,
  transformSql,
} from "../scripts/strip-loket";

const POSTER = "https://assets.loket.com/neo/production/images/banner/20260101-abc.jpg";

describe("stripLoket", () => {
  test("URL gambar assets.loket.com tidak disentuh", () => {
    const html = `<img src="${POSTER}"> poster: ${POSTER}`;
    expect(stripLoket(html)).toBe(html);
  });

  test("kata 'loket' (counter) tidak disentuh", () => {
    const text =
      "Penukaran pada hari H selama loket masih dibuka. Penyelenggara berhak menutup loket penukaran (loket/booth).";
    expect(stripLoket(text)).toBe(text);
  });

  test("href ke loket.com dibuang, teks anchor tetap", () => {
    expect(stripLoket(`<a href="http://loket.com/" style="">beli</a>`)).toBe(`<a style="">beli</a>`);
    expect(stripLoket(`<a href='https://www.loket.com/event/x'>sini</a>`)).toBe(`<a>sini</a>`);
    expect(stripLoket(`<a href="https://example.com/">ok</a>`)).toBe(`<a href="https://example.com/">ok</a>`);
  });

  test("support@loket.com -> layanan pelanggan Wavy", () => {
    // label "Email:" ikut dirapikan (aturan email-label) karena hasilnya bukan alamat email
    expect(stripLoket("Email: support@loket.com")).toBe("Wavy Customer Service");
    expect(stripLoket("Email : suppport@loket.com")).toBe("Wavy Customer Service");
    expect(stripLoket("hubungi layanan pelanggan support@loket.com untuk")).toBe(
      "hubungi layanan pelanggan Wavy untuk"
    );
    expect(stripLoket(`<a href="mailto:support@loket.com">support@loket.com</a>`)).toBe(
      "<a>layanan pelanggan Wavy</a>"
    );
  });

  test("aplikasi LOKET X / Loket X / Loket-X -> Wavy", () => {
    expect(stripLoket("melalui aplikasi LOKET X.")).toBe("melalui aplikasi Wavy.");
    expect(stripLoket("aplikasi <strong>Loket X</strong>")).toBe("aplikasi <strong>Wavy</strong>");
    expect(stripLoket("di aplikasi Loket-X saat")).toBe("di aplikasi Wavy saat");
  });

  test("variasi domain sebagai teks -> Wavy", () => {
    expect(stripLoket("dibeli melalui Loket.com.")).toBe("dibeli melalui Wavy.");
    expect(stripLoket("ditentukan LOKET.COM.")).toBe("ditentukan Wavy.");
    expect(stripLoket("website loket com saja")).toBe("website Wavy saja");
    expect(stripLoket("Satu (1) akun Loketcom hanya")).toBe("Satu (1) akun Wavy hanya");
    expect(stripLoket("WWW.LOKET.COM +6221")).toBe("Wavy +6221");
    expect(stripLoket("situs resmi https://www.loket.com</p>")).toBe("situs resmi Wavy</p>");
  });

  test("URL loket.com berpath dan subdomain lain tetap", () => {
    for (const url of [POSTER, "https://www.loket.com/event/abc", "https://rest.loket.com/x"]) {
      expect(stripLoket(url)).toBe(url);
    }
  });

  test("merek LOKET berdiri sendiri, badan usaha, dan handle", () => {
    expect(stripLoket("(c) 2026 LOKET (PT Global Loket Sejahtera). ALL RIGHTS RESERVED.")).toBe(
      "(c) 2026 Wavy. ALL RIGHTS RESERVED."
    );
    expect(stripLoket("COLLECTIVE & PT GLOBAL LOKET SEJAHTERA.")).toBe("COLLECTIVE & Wavy.");
    expect(stripLoket("E-Ticket Loket paling telat")).toBe("E-Ticket Wavy paling telat");
    expect(stripLoket("Three Mountains Ave dan Loket.")).toBe("Three Mountains Ave dan Wavy.");
    expect(stripLoket("+6221-30003160 @LOKET</p>")).toBe("+6221-30003160</p>");
  });

  test("countLoket memisahkan asset, counter, dan branding", () => {
    expect(countLoket(`${POSTER} selama loket dibuka, beli di Loket.com`)).toEqual({
      asset: 1,
      counter: 1,
      other: 1,
    });
  });
});

describe("transform per format", () => {
  test("SQL: hanya isi string literal yang diubah, escape '' dijaga", () => {
    const src = "-- sumber: loket.com\nUPDATE events SET terms_conditions = 'Beli di Loket.com, jangan di '' calo'';';";
    expect(transformSql(src, stripLoket)).toBe(
      "-- sumber: loket.com\nUPDATE events SET terms_conditions = 'Beli di Wavy, jangan di '' calo'';';"
    );
  });

  test("JSON: string yang tidak berubah ditulis apa adanya", () => {
    const src = `{"sort": "loket", "raw": "<a href=\\"http://loket.com/\\">loket.com</a>\\n"}`;
    expect(transformJson(src, stripLoket)).toBe(`{"sort": "loket", "raw": "<a>Wavy</a>\\n"}`);
  });
});

describe("merapikan kalimat setelah penggantian", () => {
  test("nomor telepon Loket dibuang beserta labelnya", () => {
    expect(stripLoket("Wavy\nPhone: 021-30003160\nEmail: layanan pelanggan Wavy")).toBe("Wavy Customer Service");
    expect(stripLoket("hubungi:\nWavy\nE-mail: layanan pelanggan Wavy\nPhone: 021-3000 3160")).toBe(
      "hubungi:\nWavy Customer Service"
    );
    expect(stripLoket("<p>Email: layanan pelanggan Wavy</p><p>Telepon: 021 3000 3160</p><p>---</p>")).toBe(
      "<p>Wavy Customer Service</p><p>---</p>"
    );
    expect(stripLoket('<p dir="ltr">PHONE: +62 218 0600 822</p>')).toBe("");
    expect(stripLoket("TERSEBUT.<br>Wavy +6221-30003160</p>")).toBe("TERSEBUT.<br>Wavy</p>");
    expect(stripLoket("please send the request to layanan pelanggan Wavy or +62 2130003160")).toBe(
      "please send the request to Wavy Customer Service"
    );
  });

  test("blok kontak HTML jadi satu baris Wavy Customer Service", () => {
    expect(
      stripLoket("Wavy Customer Service<br>\n\t\t\tEMAIL : layanan pelanggan Wavy<br>\n\t\t\tPHONE : +6221-30003160</font>")
    ).toBe("Wavy Customer Service</font>");
    expect(
      stripLoket("silakan hubungi Wavy<br>\n\t\t\t\tTelephone : 021-30003160 ; Email : layanan pelanggan Wavy</em>")
    ).toBe("silakan hubungi Wavy Customer Service</em>");
    expect(stripLoket("menghubungi Customer Service Wavy\n\nTelepon: +62 21 3000 3160\nEmail: layanan pelanggan Wavy\n\nLain")).toBe(
      "menghubungi Customer Service Wavy\n\nLain"
    );
    expect(stripLoket("Ticket: Wavy Customer Service - layanan pelanggan Wavy / +62 21 3000 3160")).toBe(
      "Ticket: Wavy Customer Service"
    );
  });

  test("kalimat Inggris tidak memakai 'layanan pelanggan' dan tanpa 'the Wavy.'", () => {
    expect(stripLoket("please contact layanan pelanggan Wavy to process")).toBe("please contact Wavy Customer Service to process");
    expect(stripLoket("by contacting the Wavy call center at <a>layanan pelanggan Wavy</a> or +62-21-8060-0822.")).toBe(
      "by contacting Wavy Customer Service."
    );
    expect(stripLoket("once issued by the Wavy. E-tickets")).toBe("once issued by Wavy. E-tickets");
    expect(stripLoket("available in the Wavy app")).toBe("available in the Wavy app");
  });

  test("bahasa Indonesia 'hubungi layanan pelanggan Wavy' dan nomor lain tetap", () => {
    const text = "silakan hubungi layanan pelanggan Wavy untuk memproses. Telepon: +62 888-8988-880";
    expect(stripLoket(text)).toBe(text);
  });

  test("idempoten: menjalankan ulang tidak mengubah hasil", () => {
    const raw =
      "Email: support@loket.com\nPhone: 021-30003160\nonce issued by the LOKET. contact support@loket.com or +62 2130003160";
    const once = stripLoket(raw);
    expect(stripLoket(once)).toBe(once);
  });
});

describe("strip-loket-neon.sql", () => {
  const sqlPath = join(import.meta.dir, "..", "scripts", "strip-loket-neon.sql");

  test("fungsi strip_loket di file SQL = hasil generate dari RULES", () => {
    const src = readFileSync(sqlPath, "utf8").replace(/\r\n/g, "\n");
    const block = src.slice(src.indexOf(SQL_FN_START), src.indexOf(SQL_FN_END) + SQL_FN_END.length);
    expect(block).toBe(sqlFunction());
  });

  test("Postgres menghasilkan teks yang sama dengan stripLoket() untuk semua teks seed", async () => {
    const dir = join(import.meta.dir, "..", "scripts");
    const tnc = JSON.parse(readFileSync(join(dir, "_tnc.json"), "utf8")) as Record<string, Record<string, unknown>>;
    const inputs = [
      ...Object.values(tnc).flatMap((v) => Object.values(v).filter((x): x is string => typeof x === "string")),
      ...readdirSync(join(dir, "_manual-tnc"))
        .filter((f) => f.endsWith(".txt"))
        .map((f) => readFileSync(join(dir, "_manual-tnc", f), "utf8")),
      "Email: suppport@loket.com\nPhone: 021-30003160\nonce issued by the LOKET. Beli di Loket.com",
      "by contacting the LOKET call center at <a href=\"mailto:support@loket.com\">support@loket.com</a> or +62-21-8060-0822.",
    ].filter((t) => /loket|wavy|3160|0822/i.test(t));
    expect(inputs.length).toBeGreaterThan(10);

    const db = await sql.reserve();
    try {
      await db.unsafe(sqlFunction());
      for (const input of inputs) {
        const [{ out }] = await db<{ out: string }[]>`SELECT pg_temp.strip_loket(${input}) AS out`;
        expect(out).toBe(stripLoket(input));
      }
    } finally {
      db.release();
    }
  });
});
