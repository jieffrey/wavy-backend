-- =====================================================================
-- Neon DEV branch only, do not run on production.
-- =====================================================================
-- Membuang branding "Loket.com" dari events.description dan
-- events.terms_conditions, lalu merapikan kalimat yang kaku hasil penggantian
-- (nomor telepon Loket, "Email: layanan pelanggan Wavy", "issued by the Wavy", dst.).
-- Fungsi pg_temp.strip_loket DIBANGKITKAN dari RULES di scripts/strip-loket.ts
-- (`bun scripts/strip-loket.ts --sql`), jadi hasilnya sama dengan file seed.
-- Aman dijalankan ulang di data yang sudah pernah di-strip (aturan idempoten).
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
-- Dibangkitkan oleh `bun scripts/strip-loket.ts --sql` dari RULES; jangan edit tangan.
CREATE FUNCTION pg_temp.strip_loket(t text) RETURNS text
LANGUAGE plpgsql IMMUTABLE AS $fn$
DECLARE r record;
BEGIN
  IF t IS NULL THEN RETURN NULL; END IF;
  FOR r IN SELECT * FROM (VALUES
    (1, '\s+href\s*=\s*("[^"]*loket\.com[^"]*"|''[^'']*loket\.com[^'']*'')', '', 'gi'), -- href
    (2, '(?<![\w.])sup+ort@loket\.com', 'layanan pelanggan Wavy', 'gi'), -- support-email
    (3, '(?<![\w./@-])loket[ -]?x(?!\w)', 'Wavy', 'gi'), -- loket-x
    (4, '(?<![\w./@-])(https?://)?(www\.)?loket(\.|\s)?com(/(?=[^\w/.-]|$))?(?![\w/-]|\.\w)', 'Wavy', 'gi'), -- loket-com
    (5, '\s+@loket(?![\w.@-])', '', 'gi'), -- handle
    (6, 'PT\.?\s+Global\s+Loket\s+Sejahtera', 'Wavy', 'gi'), -- company
    (7, '(?<![\w./@-])(Loket|LOKET)(?![\w@/-]|\.\w)', 'Wavy', 'g'), -- brand
    (8, 'Wavy\s*\(Wavy\)', 'Wavy', 'g'), -- dedupe
    (9, 'layanan pelanggan\s+layanan pelanggan Wavy', 'layanan pelanggan Wavy', 'gi'), -- dedupe-support
    (10, '<p[^>]*>[\s\u00a0]*(?:PHONE|Phone|Telepon|Telephone)[\s\u00a0]*:[\s\u00a0]*(?:\+62|0)[ -]?21[ -]?(?:3000[ -]?3160|8060[ -]?0822|8[ -]?0600[ -]?822)(?![\w-])[\s\u00a0]*</p>|<span[^>]*>[\s\u00a0]*(?:PHONE|Phone|Telepon|Telephone)[\s\u00a0]*:[\s\u00a0]*</span>[\s\u00a0]*<span[^>]*>[\s\u00a0]*(?:\+62|0)[ -]?21[ -]?(?:3000[ -]?3160|8060[ -]?0822|8[ -]?0600[ -]?822)(?![\w-])[\s\u00a0]*</span>(?:<span[^>]*>[\s\u00a0]*<br[\s\u00a0]*/?>[\s\u00a0]*</span>)?', '', 'g'), -- phone-block
    (11, '(?:<br[\s\u00a0]*/?>)?[\s\u00a0]*(?:PHONE|Phone|Telepon|Telephone)[\s\u00a0]*:[\s\u00a0]*(?:\+62|0)[ -]?21[ -]?(?:3000[ -]?3160|8060[ -]?0822|8[ -]?0600[ -]?822)(?![\w-])(?:[\s\u00a0]*;)?', '', 'g'), -- phone-line
    (12, '[\s\u00a0]+(?:or[\s\u00a0]+|atau[\s\u00a0]+)?(?:\+62|0)[ -]?21[ -]?(?:3000[ -]?3160|8060[ -]?0822|8[ -]?0600[ -]?822)(?![\w-])', '', 'g'), -- phone-inline
    (13, 'the Wavy call center at[\s\u00a0]*(?:<a[^>]*>)?[\s\u00a0]*layanan pelanggan Wavy[\s\u00a0]*(?:</a>)?', 'Wavy Customer Service', 'g'), -- call-center
    (14, '(?<![\w])(contact|to)([\s\u00a0]+)layanan pelanggan Wavy', '\1\2Wavy Customer Service', 'g'), -- english-cs
    (15, '(?:E-?mail|EMAIL)[\s\u00a0]*:[\s\u00a0]*((?:<[^>]+>|[\s\u00a0])*)layanan pelanggan Wavy', '\1Wavy Customer Service', 'g'), -- email-label
    (16, 'Customer Service Wavy(?:[\s\u00a0]|<br[\s\u00a0]*/?>)+Wavy Customer Service', 'Customer Service Wavy', 'g'), -- dedupe-cs-1
    (17, 'Wavy Customer Service(?:[\s\u00a0]|<br[\s\u00a0]*/?>)+Wavy Customer Service', 'Wavy Customer Service', 'g'), -- dedupe-cs-2
    (18, '(?<![\w])Wavy(?:[\s\u00a0]|<br[\s\u00a0]*/?>)+Wavy Customer Service', 'Wavy Customer Service', 'g'), -- dedupe-cs-3
    (19, 'Wavy Customer Service[\s\u00a0]*-[\s\u00a0]*layanan pelanggan Wavy(?:[\s\u00a0]*/)?', 'Wavy Customer Service', 'g'), -- dedupe-cs-4
    (20, '(?<![\w])the Wavy(?=[.,;:!?)])', 'Wavy', 'g') -- the-wavy
  ) AS v(n, pattern, replacement, flags) ORDER BY n LOOP
    t := regexp_replace(t, r.pattern, r.replacement, r.flags);
  END LOOP;
  RETURN t;
END
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
-- IF NOT EXISTS: kalau skrip ini pernah di-COMMIT, backup lama (teks asli) dipertahankan.
CREATE TABLE IF NOT EXISTS events_backup_strip_loket AS
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
