import { describe, expect, test } from "bun:test";
import { countLoket, stripLoket, transformJson, transformSql } from "../scripts/strip-loket";

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
    expect(stripLoket("Email: support@loket.com")).toBe("Email: layanan pelanggan Wavy");
    expect(stripLoket("Email : suppport@loket.com")).toBe("Email : layanan pelanggan Wavy");
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
