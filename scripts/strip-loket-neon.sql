-- =====================================================================
-- Neon DEV branch only, do not run on production.
-- =====================================================================
-- Membuang branding "Loket.com" dari events.description dan
-- events.terms_conditions. Aturannya sama dengan scripts/strip-loket.ts
-- (kalau salah satu diubah, ubah juga yang lain).
--
-- Tetap utuh:
--   - URL gambar https://assets.loket.com/... (poster/banner/galeri/img src)
--   - URL loket.com yang berpath atau subdomain lain
--   - kata "loket" huruf kecil (counter penukaran), mis. "selama loket masih dibuka"
--
-- Cara pakai (psql interaktif, supaya transaksi tetap terbuka):
--   psql "<connection string Neon branch DEV>"
--   \i scripts/strip-loket-neon.sql
--   -- periksa hasil preview & verifikasi, lalu ketik salah satu:
--   COMMIT;    -- simpan
--   ROLLBACK;  -- batalkan (tabel backup ikut batal)
-- Butuh Postgres >= 15 (regexp_count). Lookbehind butuh >= 9.6.
-- =====================================================================

\set ON_ERROR_STOP on

BEGIN;

-- ---------------------------------------------------------------------
-- 0. Fungsi bantu (hanya hidup di sesi ini, tidak tersimpan di skema)
-- ---------------------------------------------------------------------
-- strip-loket:function:start
CREATE FUNCTION pg_temp.strip_loket(t text) RETURNS text
LANGUAGE sql IMMUTABLE AS $fn$
  SELECT
    -- 9. rapikan "layanan pelanggan layanan pelanggan Wavy"
    regexp_replace(
    -- 8. rapikan "Wavy (Wavy)"
    regexp_replace(
    -- 7. merek "Loket"/"LOKET" berdiri sendiri (case-sensitive: "loket" kecil = counter, tidak disentuh)
    regexp_replace(
    -- 6. nama badan usaha
    regexp_replace(
    -- 5. handle "@LOKET"
    regexp_replace(
    -- 4. domain sebagai teks: Loket.com, LOKET.COM, loket com, Loketcom, www.loket.com, https://www.loket.com
    regexp_replace(
    -- 3. aplikasi LOKET X / Loket X / Loket-X
    regexp_replace(
    -- 2. support@loket.com (termasuk salah ketik "suppport")
    regexp_replace(
    -- 1. atribut href yang mengarah ke loket.com (teks anchor tetap)
    regexp_replace(
      t,
      '\s+href\s*=\s*("[^"]*loket\.com[^"]*"|''[^'']*loket\.com[^'']*'')', '', 'gi'),
      '(?<![\w.])sup+ort@loket\.com', 'layanan pelanggan Wavy', 'gi'),
      '(?<![\w./@-])loket[ -]?x(?!\w)', 'Wavy', 'gi'),
      '(?<![\w./@-])(https?://)?(www\.)?loket(\.|\s)?com(/(?=[^\w/.-]|$))?(?![\w/-]|\.\w)', 'Wavy', 'gi'),
      '\s+@loket(?![\w.@-])', '', 'gi'),
      'PT\.?\s+Global\s+Loket\s+Sejahtera', 'Wavy', 'gi'),
      '(?<![\w./@-])(Loket|LOKET)(?![\w@/-]|\.\w)', 'Wavy', 'g'),
      'Wavy\s*\(Wavy\)', 'Wavy', 'g'),
      'layanan pelanggan\s+layanan pelanggan Wavy', 'layanan pelanggan Wavy', 'gi')
$fn$;
-- strip-loket:function:end

-- Hitungan per teks:
--   asset   = "assets.loket.com" (harus tetap)
--   counter = "loket" huruf kecil berdiri sendiri (harus tetap)
--   other   = sisanya, yaitu branding (target 0)
CREATE FUNCTION pg_temp.loket_hits(t text, kind text) RETURNS int
LANGUAGE sql IMMUTABLE AS $fn$
  SELECT CASE kind
    WHEN 'asset'   THEN regexp_count(coalesce(t, ''), 'assets\.loket\.com', 1, 'i')
    WHEN 'counter' THEN regexp_count(coalesce(t, ''), '(?<![\w./@-])loket(?![\w.@-])', 1, '')
    ELSE regexp_count(coalesce(t, ''), 'loket', 1, 'i')
       - regexp_count(coalesce(t, ''), 'assets\.loket\.com', 1, 'i')
       - regexp_count(coalesce(t, ''), '(?<![\w./@-])loket(?![\w.@-])', 1, '')
  END
$fn$;

-- ---------------------------------------------------------------------
-- 1. Backup (ikut ROLLBACK kalau dibatalkan)
-- ---------------------------------------------------------------------
CREATE TABLE events_backup_strip_loket AS
SELECT id, description, terms_conditions, now() AS backed_up_at
FROM events;

-- ---------------------------------------------------------------------
-- 2. Preview: event yang kena + jumlah hit sebelum/sesudah
-- ---------------------------------------------------------------------
SELECT
  e.id,
  left(e.title, 40) AS title,
  pg_temp.loket_hits(e.description, 'other')
    + pg_temp.loket_hits(e.terms_conditions, 'other') AS other_before,
  pg_temp.loket_hits(pg_temp.strip_loket(e.description), 'other')
    + pg_temp.loket_hits(pg_temp.strip_loket(e.terms_conditions), 'other') AS other_after,
  pg_temp.loket_hits(e.description, 'asset')
    + pg_temp.loket_hits(e.terms_conditions, 'asset') AS asset_hits,
  pg_temp.loket_hits(e.description, 'counter')
    + pg_temp.loket_hits(e.terms_conditions, 'counter') AS counter_hits
FROM events e
WHERE e.description ~* 'loket' OR e.terms_conditions ~* 'loket'
ORDER BY e.id;

-- Total sebelum UPDATE
SELECT
  sum(pg_temp.loket_hits(description, 'other') + pg_temp.loket_hits(terms_conditions, 'other'))     AS other_before,
  sum(pg_temp.loket_hits(description, 'asset') + pg_temp.loket_hits(terms_conditions, 'asset'))     AS asset_before,
  sum(pg_temp.loket_hits(description, 'counter') + pg_temp.loket_hits(terms_conditions, 'counter')) AS counter_before
FROM events;

-- ---------------------------------------------------------------------
-- 3. UPDATE
-- ---------------------------------------------------------------------
UPDATE events
SET description      = pg_temp.strip_loket(description),
    terms_conditions = pg_temp.strip_loket(terms_conditions)
WHERE description      IS DISTINCT FROM pg_temp.strip_loket(description)
   OR terms_conditions IS DISTINCT FROM pg_temp.strip_loket(terms_conditions);

-- ---------------------------------------------------------------------
-- 4. Verifikasi
-- ---------------------------------------------------------------------
-- 4a. Sisa branding harus 0
SELECT
  sum(pg_temp.loket_hits(description, 'other') + pg_temp.loket_hits(terms_conditions, 'other')) AS other_after_expect_0
FROM events;

-- 4b. Hit URL aset & kata counter harus sama dengan backup (diff = 0)
SELECT
  sum(pg_temp.loket_hits(e.description, 'asset') + pg_temp.loket_hits(e.terms_conditions, 'asset'))
    - sum(pg_temp.loket_hits(b.description, 'asset') + pg_temp.loket_hits(b.terms_conditions, 'asset'))
    AS asset_diff_expect_0,
  sum(pg_temp.loket_hits(e.description, 'counter') + pg_temp.loket_hits(e.terms_conditions, 'counter'))
    - sum(pg_temp.loket_hits(b.description, 'counter') + pg_temp.loket_hits(b.terms_conditions, 'counter'))
    AS counter_diff_expect_0
FROM events e
JOIN events_backup_strip_loket b ON b.id = e.id;

-- 4c. Daftar URL loket.com yang masih ada harus identik dengan sebelum UPDATE
--     (baris yang muncul di sini = URL yang hilang/berubah; harapannya kosong)
(SELECT b.id, m[1] AS url
   FROM events_backup_strip_loket b,
        regexp_matches(coalesce(b.description, '') || ' ' || coalesce(b.terms_conditions, ''),
                       '(https?://[a-z0-9.-]*loket\.com/[^\s"''<>)]+)', 'gi') AS m)
EXCEPT ALL
(SELECT e.id, m[1]
   FROM events e,
        regexp_matches(coalesce(e.description, '') || ' ' || coalesce(e.terms_conditions, ''),
                       '(https?://[a-z0-9.-]*loket\.com/[^\s"''<>)]+)', 'gi') AS m);

-- 4d. Contoh hasil untuk dicek mata
SELECT id, left(title, 40) AS title,
       regexp_replace(substring(terms_conditions FROM '.{0,60}Wavy.{0,60}'), '\s+', ' ', 'g') AS sample
FROM events
WHERE terms_conditions LIKE '%Wavy%'
ORDER BY id
LIMIT 10;

-- ---------------------------------------------------------------------
-- 5. Selesai: pilih salah satu secara manual
-- ---------------------------------------------------------------------
-- COMMIT;
-- ROLLBACK;
-- Setelah COMMIT dan hasil di aplikasi sudah dicek, backup boleh dihapus:
-- DROP TABLE events_backup_strip_loket;
