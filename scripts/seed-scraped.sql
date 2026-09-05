-- Seed data: 60 concerts scraped from artatix.co.id + loket.com (2026-09-05)
-- Posters hosted on source CDNs (assets.artatix.co.id / assets.loket.com)
-- Safe to re-run: organizers keyed by email (ON CONFLICT DO NOTHING), events/artists guarded by NOT EXISTS

BEGIN;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('TURN', 'demo.scrape-1@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. Roemah Satu Ide', 'demo.scrape-2@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Global Ahensi Solusindo', 'demo.scrape-3@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Soundjah', 'demo.scrape-4@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('WTkreatif', 'demo.scrape-5@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KINARIA  EVENT ORGANIZER', 'demo.scrape-6@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bestie Fest', 'demo.scrape-7@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KOMAPA UAJY', 'demo.scrape-8@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DD Entertainment', 'demo.scrape-9@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Saint Johns Catholic School', 'demo.scrape-10@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FUTURA FREE', 'demo.scrape-11@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('0911 ORGANIZER', 'demo.scrape-12@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Jangan Kolektif', 'demo.scrape-13@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RdC Jambi', 'demo.scrape-14@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV. Brinn Putra Perkasa ''Beplus Communication''', 'demo.scrape-15@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV. Duta Biru Production', 'demo.scrape-16@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Katarsis', 'demo.scrape-17@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sekolah Islam Dian Didaktika', 'demo.scrape-18@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Swable Fest', 'demo.scrape-19@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV.kutata production', 'demo.scrape-20@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dynamic Duos', 'demo.scrape-21@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ayofest.id', 'demo.scrape-22@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('510Squad Lamongan', 'demo.scrape-23@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('In Inertia Showcase Bandung', 'demo.scrape-24@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Muda Mudi Feelling Empty', 'demo.scrape-25@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Republik Event Musik Indonesia', 'demo.scrape-26@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bestieval Indonesia Concert', 'demo.scrape-27@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Rawstage', 'demo.scrape-28@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 44 JAKARTA', 'demo.scrape-29@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('D''Angelic Choir', 'demo.scrape-30@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NAWA DAYA CREATIVE HUB', 'demo.scrape-31@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('UKM Pancasila Economic Art Division', 'demo.scrape-32@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KAVAYA PRODUCTION', 'demo.scrape-33@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JAFPRO', 'demo.scrape-34@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gema Music Festival', 'demo.scrape-35@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SKA Live', 'demo.scrape-36@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Malang Bay Festival', 'demo.scrape-37@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Global Mandiri Cibubur', 'demo.scrape-38@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SARANG WALI ENTERTAIMENT', 'demo.scrape-39@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FF CREATIVE', 'demo.scrape-40@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIGMA PRO INDONESIA', 'demo.scrape-41@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BUZZ CREATIVE PROJECT', 'demo.scrape-42@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT.  Area Group Nusantara', 'demo.scrape-43@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('YOUNG ENTERTAIN', 'demo.scrape-44@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CK Star Entertainment', 'demo.scrape-45@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('North Ndapur', 'demo.scrape-46@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Spectaphoria', 'demo.scrape-47@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Angular//Momentum', 'demo.scrape-48@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Perusahaan Mai Dee', 'demo.scrape-49@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Antara Suara', 'demo.scrape-50@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Remember Musik Festival', 'demo.scrape-51@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Semua Pasti Gembira', 'demo.scrape-52@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. AKL Multiorganizer & Eventhype', 'demo.scrape-53@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Plainsong Live', 'demo.scrape-54@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIKMA FTI UAJY', 'demo.scrape-55@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('New Gen Entertainment', 'demo.scrape-56@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DINAMIT 2026', 'demo.scrape-57@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

-- ============ EVENTS (60) ============

-- TURNROOM RITUS V - BASAJAN a journey of Bewara Tour
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour', 'Music', 'Lo.co Bandung, Kota Bandung', '2026-09-04 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/HHOFM3OR70.jpg', 'An Intimate 360° Collaborative Performance Experience music in its most raw and immersive form. Set around a 360 degree central stage, Basajan brings an extraordinary collaborative show that seamlessly weaves together the mystic sounds of traditional Tarawangsa, contemporary dance, Theatrical, and emotive poetry into one unified, captivating performance. Designed with thoughtful scenography and a strong spirit of local artistry, step into our circle and be part of an unforgettable night where every angle tells a story.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour' AND ev.venue = 'Lo.co Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 133
FROM events ev WHERE ev.title = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour' AND ev.venue = 'Lo.co Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FEEL YOUR PAPUA - SORONG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FEEL YOUR PAPUA - SORONG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-2@wavy.seed' AND a.name = 'FEEL YOUR PAPUA - SORONG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FEEL YOUR PAPUA - SORONG', 'Music', 'Lapangan Korem, Kota Sorong', '2026-09-04 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/38IO5H69JV.png', 'FEEL YOUR PAPUA (FYP) ADALAH KONSER MUSIK DI TANAH PAPUA YANG MENGHADIRKAN SEJUMLAH TALENT/PERFORMER BERLATAR BELAKANG KULTUR INDONESIA TIMUR. KONSER INI BERTUJUAN MEMBERIKAN PANGGUNG BESAR BAGI TALENTA-TALENTA TIMUR TERUTAMA PAPUA UNTUK BERANI TAMPIL MENGHIBUR DIATAS PANGGUNG YANG LEBIH BESAR. HAL INI DIMAKSUDKAN SEBAGAI TRIGER UNTUK PERKEMBANGAN MUSIK DI TANAH PAPUA SEKALIGUS MAMPU MENJADI MOTOR PENGGERAK EKONOMI DI SEKTOR INDUSTRI KREATIF.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FEEL YOUR PAPUA - SORONG'
WHERE o.email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FEEL YOUR PAPUA - SORONG' AND ev.venue = 'Lapangan Korem, Kota Sorong');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 206
FROM events ev WHERE ev.title = 'FEEL YOUR PAPUA - SORONG' AND ev.venue = 'Lapangan Korem, Kota Sorong'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Purwokerto
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Purwokerto', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-3@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Purwokerto');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Purwokerto', 'Music', 'Hal. Gor Satria Purwokerto, Kab. Banyumas', '2026-09-05 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AGB5JIFLCS.png', 'Siapkan energi terbaikmu dan rasakan pengalaman musik yang lebih keras, lebih seru, dan lebih super di ROCKIN NOIZEE Purwokerto! Rockin Noizee hadir di HAL GOR Satria, Purwokerto pada 5 September 2026 , dengan menghadirkan deretan musisi yang siap mengguncang panggung Seringai , The Jansen dan Pee Wee Gaskins! Jangan lewatkan kesempatan untuk menyaksikan penampilan mereka secara langsung dalam satu panggung dan menjadi bagian dari perjalanan Rockin Noizee 2026 . 📍 HAL GOR Satria, Purwokerto 📅 5 September 2026 Get your ticket now and let''s rock the night!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Purwokerto'
WHERE o.email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Purwokerto' AND ev.venue = 'Hal. Gor Satria Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 29
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Purwokerto' AND ev.venue = 'Hal. Gor Satria Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bring Back The Noise #5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bring Back The Noise #5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'Bring Back The Noise #5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bring Back The Noise #5', 'Music', 'Gor Samapta, Kota Magelang', '2026-09-05 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IID8OK0T4J.jpg', 'Soundjah kembali menyajikan Bring Back The Noise #5 yang sebagaimana merupakan event sillaturahmi penggiat seni musik di Kota Magelang. Bring Back The Noise #5 menjadi upaya untuk terus menyalakan api - api semangat agar dapat kembali melahirkan musisi lokal yang berbakat.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bring Back The Noise #5'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bring Back The Noise #5' AND ev.venue = 'Gor Samapta, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 252
FROM events ev WHERE ev.title = 'Bring Back The Noise #5' AND ev.venue = 'Gor Samapta, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RUANG RIANG x PEKAN CERIA Jilid4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RUANG RIANG x PEKAN CERIA Jilid4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'RUANG RIANG x PEKAN CERIA Jilid4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RUANG RIANG x PEKAN CERIA Jilid4', 'Music', 'Gedung Adipura Wonosobo, Kab. Wonosobo', '2026-09-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/O3BYG8HTGK.png', 'RUANG RIANG x PEKAN CERIA Jilid4', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RUANG RIANG x PEKAN CERIA Jilid4'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RUANG RIANG x PEKAN CERIA Jilid4' AND ev.venue = 'Gedung Adipura Wonosobo, Kab. Wonosobo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 28000, 500, 225
FROM events ev WHERE ev.title = 'RUANG RIANG x PEKAN CERIA Jilid4' AND ev.venue = 'Gedung Adipura Wonosobo, Kab. Wonosobo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MEET AND GREET TOBA HERITAGE  2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MEET AND GREET TOBA HERITAGE  2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-6@wavy.seed' AND a.name = 'MEET AND GREET TOBA HERITAGE  2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MEET AND GREET TOBA HERITAGE  2026', 'Music', 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi', '2026-09-05 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/81EF8JNE50.png', 'Meet and Greet Toba Heritage Camp 2026 Hadir karena Bentuk rasa Cinta yang Konsistensi Terhadap, Harmoni Alam, dan Warisan Budaya. Perjalanan panjang yang penuh cerita kini memasuki babak baru! Memasuki tahun ini penyelenggaraannya secara berturut-turut, Meet and Greet Toba Heritage Camp kembali hadir sebagai ruang temu alternatif yang konsisten menjaga api kelestarian budaya dan lingkungan di kawasan Danau Toba. Tahun ini, kami membawa konsep yang semakin matang: Sebuah peleburan magis antara keindahan alam yang murni dengan kekayaan penampilan adat, dibalut oleh sajian musik yang terus berevolusi menyesuaikan perkembangan zaman. Apa yang Berbeda di Tahun Sebelumnya? Koneksi Alam yang Intim: Mengambil latar keindahan Pantai Gajah Tidur (Paropo Silalahi), rasakan sensasi berkemah di bawah langit terbuka yang menyatu langsung dengan embusan angin Toba. Adat &amp; Tradisi yang Membumi: Menyaksikan langsung pertunjukan seni adat yang sakral dan autentik, menjaga akar budaya tetap kokoh di tengah modernitas. Musik Lintas Generasi: Menghadirkan panggung musik dengan aransemen modern yang adaptif dengan tren masa kini tanpa kehilangan esensi lokalitasnya. Musik yang tidak hanya didengar, tapi juga dirasakan oleh setiap generasi. Mari menjadi bagian dari perayaan konsistensi budaya ini. Sampai jumpa di tepian Toba, tempat di mana tradisi bersenang-senang dengan cara yang paling organik! Yang Penting Heeppiii! 🏕️✨', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MEET AND GREET TOBA HERITAGE  2026'
WHERE o.email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MEET AND GREET TOBA HERITAGE  2026' AND ev.venue = 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 268
FROM events ev WHERE ev.title = 'MEET AND GREET TOBA HERITAGE  2026' AND ev.venue = 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIO SHOW REBORN TV ONE PURWOKERTO
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIO SHOW REBORN TV ONE PURWOKERTO', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-7@wavy.seed' AND a.name = 'RADIO SHOW REBORN TV ONE PURWOKERTO');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIO SHOW REBORN TV ONE PURWOKERTO', 'Music', 'Menara Teratai, Purwokerto, Kab. Banyumas', '2026-09-11 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1FUY9VI16A.png', 'Radio Show TV One Reborn 2026 Saatnya bersiap untuk menikmati malam penuh hiburan di Radio Show TV One Reborn 2026 ! Hadir kembali dengan konsep yang lebih meriah, acara ini akan menghadirkan deretan musisi pilihan yang siap memberikan penampilan terbaik dan menciptakan pengalaman konser yang tak terlupakan. Saksikan penampilan spesial dari SHA , Rebellion Rose , serta musisi lainnya yang akan segera diumumkan. Nikmati perpaduan musik rock, pop, dan berbagai genre favorit yang akan membuat suasana semakin meriah dan penuh semangat. Ajak teman, keluarga, dan komunitasmu untuk bernyanyi bersama, menikmati setiap penampilan, serta menjadi bagian dari kemeriahan salah satu festival musik yang paling dinantikan di Purwokerto. Detail Acara 📅 Tanggal: Jumat, 11 September 2026 📍 Lokasi: Menara Teratai, Purwokerto 🎤 Lineup: SHA, Rebellion Rose, dan masih banyak penampil lainnya yang akan segera diumumkan. 🎟️ Tiket: Tersedia secara eksklusif melalui Artatix . Jangan lewatkan kesempatan untuk merasakan keseruan Radio Show TV One Reborn 2026. Amankan tiketmu sekarang dan bersiaplah menikmati malam penuh musik, energi, dan pengalaman yang tak terlupakan! 🎶🔥', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIO SHOW REBORN TV ONE PURWOKERTO'
WHERE o.email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIO SHOW REBORN TV ONE PURWOKERTO' AND ev.venue = 'Menara Teratai, Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 61
FROM events ev WHERE ev.title = 'RADIO SHOW REBORN TV ONE PURWOKERTO' AND ev.venue = 'Menara Teratai, Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PAPUA CULTURE EVENT 3.0
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PAPUA CULTURE EVENT 3.0', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-8@wavy.seed' AND a.name = 'PAPUA CULTURE EVENT 3.0');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PAPUA CULTURE EVENT 3.0', 'Music', 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman', '2026-09-12 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ASXJTNK2LB.png', 'Indonesia merupakan negara yang memiliki keberagaman yang luar biasa, mulai dari suku, budaya, adat istiadat, agama, dan lain-lain. Wilayah Indonesia terdiri dari Indonesia Barat dan Indonesia Timur. Indonesia Timur sendiri terdiri dari beberapa wilayah, salah satunya Tanah Papua. Tanah Papua memiliki kekayaan budaya yang luar biasa indahnya sama seperti daerah-daerah lain di Indonesia. Namun, budaya Papua masih belum banyak dikenal oleh masyarakat di luar Papua, termasuk di Yogyakarta yang terkenal sebagai kota pelajar. Papua Culture Event (P.A.C.E) 3.0 merupakan salah satu program kerja yang diadakan oleh Komunitas Mahasiswa Papua Universitas Atma Jaya Yogyakarta dengan menampilkan Budaya Papua dalam bentuk pertunjukan seni, musik, dan tarian tradisional Papua kepada seluruh masyarakat yang ada di Yogyakarta. Papua Culture Event (P.A.C.E) 3.0 bertujuan untuk memperkuat kesatuan NKRI dengan menunjukkan kepada masyarakat yang ada di Yogyakarta bahwa Papua merupakan bagian integral dari Indonesia. Dengan memahami budaya Papua, masyarakat akan semakin cinta dan bangga terhadap Indonesia. Dan juga dari kegiatan ini diharapkan dapat meningkatkan kesadaran masyarakat tentang pentingnya menjaga dan melestarikan budaya bangsa. Papua Culture Event (P.A.C.E) 3.0 dapat menjadi wadah bagi masyarakat untuk mengenal dan memahami budaya Papua, sehingga dapat meningkatkan toleransi dan kerukunan antarbudaya. Papua Culture Event (P.A.C.E) 3.0 juga ingin menunjukkan kepada masyarakat bahwa budaya Papua tidak pernah pudar dan tetap eksis hingga saat ini. Event ini akan menampilkan berbagai pertunjukan seni yang penuh warna dan energik, sehingga dapat menarik minat masyarakat untuk mempelajari lebih lanjut tentang budaya Papua. more information : CP : 081248410691 (Gadis)', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PAPUA CULTURE EVENT 3.0'
WHERE o.email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PAPUA CULTURE EVENT 3.0' AND ev.venue = 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 4
FROM events ev WHERE ev.title = 'PAPUA CULTURE EVENT 3.0' AND ev.venue = 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dream Desire Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dream Desire Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Dream Desire Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dream Desire Fest 2026', 'Music', 'Taman Candra Wilwatikta, Kota Pasuruan', '2026-09-12 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FQG4SJJ8Y9.jpg', 'Acara Music Festival dengan target 10.000 penonton yang dilaksanakan di area outdoor dengan terbagi 2 area, duduk dan berdiri dengan menyajikan 3 artis', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dream Desire Fest 2026'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dream Desire Fest 2026' AND ev.venue = 'Taman Candra Wilwatikta, Kota Pasuruan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 56000, 500, 147
FROM events ev WHERE ev.title = 'Dream Desire Fest 2026' AND ev.venue = 'Taman Candra Wilwatikta, Kota Pasuruan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SYNC 2026 'Luminaria'
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SYNC 2026 ''Luminaria''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-10@wavy.seed' AND a.name = 'SYNC 2026 ''Luminaria''');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SYNC 2026 ''Luminaria''', 'Music', 'Saint John''s Catholic School BSD, Kota Tangerang Selatan', '2026-09-12 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9A3PVV1899.png', 'Presenting…SYNC 2026: Luminaria! SYNC is an annual event held by Saint John''s Catholic School BSD to celebrate the talent and skills of all the students of Saint John''s. From tireless practices to competitions, auditions to performances, we now end the event with a performance night. To wrap up SYNC 2026, we welcome our special guest star Adrian Khalif to perform in our closing pensi on September 12th. SYNC 2026: Luminaria will also include a variety of food and beverage tenants to create a complete festival atmosphere. Families, students, alumni, and guests can enjoy the performances while exploring different F&amp;B options around the venue. This festival aims to bring the school community together, celebrate youth expression, and create a fun and welcoming environment for everyone.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SYNC 2026 ''Luminaria'''
WHERE o.email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SYNC 2026 ''Luminaria''' AND ev.venue = 'Saint John''s Catholic School BSD, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 90
FROM events ev WHERE ev.title = 'SYNC 2026 ''Luminaria''' AND ev.venue = 'Saint John''s Catholic School BSD, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HARNESS YOUR HOPES VOL 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HARNESS YOUR HOPES VOL 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-11@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-11@wavy.seed' AND a.name = 'HARNESS YOUR HOPES VOL 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HARNESS YOUR HOPES VOL 3', 'Music', 'TPANG SOCIAL FABRIEK, Kota Bandung', '2026-09-12 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RHDS7VXZOH.png', 'Harness Your Hopes 3 marks the latest chapter of a music event that first came to life in 2022, receiving a warm response from independent music lovers and the local creative community. Returning with a bigger scale, a stronger vision, and the same passion, Harness Your Hopes 3 brings together artists from across the indie spectrum from Indie Rock and Indie Pop to Alternative. More than just a concert, Harness Your Hopes 3 is a space where artists and audiences can connect, discover new sounds, and celebrate the ever-growing culture of independent music. Get ready for an experience filled with music, community, expression, and creative energy.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HARNESS YOUR HOPES VOL 3'
WHERE o.email = 'demo.scrape-11@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HARNESS YOUR HOPES VOL 3' AND ev.venue = 'TPANG SOCIAL FABRIEK, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 253
FROM events ev WHERE ev.title = 'HARNESS YOUR HOPES VOL 3' AND ev.venue = 'TPANG SOCIAL FABRIEK, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 0911 FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '0911 FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-12@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-12@wavy.seed' AND a.name = '0911 FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '0911 FEST', 'Music', 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung', '2026-09-13 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VHI07YNVAZ.jpg', 'Bersiaplah untuk momen tak terlupakan! Merayakan 3 tahun 0911CREW yang luar biasa, dengan penampilan spesial Thepaps , Dt09 ,Bungsu Bandung, Sunday eleven , Dongtsay oasis bdg x madperit , thewaves , cornerkick , handsbeats serta band papan atas dari bandung akan memeriahkan acara tsb, yang tidak ingin Anda lewatkan. Mari kita jadikan perayaan ulang tahun ini menarik!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '0911 FEST'
WHERE o.email = 'demo.scrape-12@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '0911 FEST' AND ev.venue = 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 116
FROM events ev WHERE ev.title = '0911 FEST' AND ev.venue = 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 21 Century Show TDS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '21 Century Show TDS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-13@wavy.seed' AND a.name = '21 Century Show TDS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '21 Century Show TDS', 'Music', 'Sejiwa Coffee, Kiputih, Kota Bandung', '2026-09-13 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FY2S7ITAMU.jpg', 'Teenage Death Star', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '21 Century Show TDS'
WHERE o.email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '21 Century Show TDS' AND ev.venue = 'Sejiwa Coffee, Kiputih, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 119
FROM events ev WHERE ev.title = '21 Century Show TDS' AND ev.venue = 'Sejiwa Coffee, Kiputih, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria Kayu Agung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Kayu Agung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-14@wavy.seed' AND a.name = 'Riang dan Ceria Kayu Agung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Kayu Agung', 'Music', 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir', '2026-09-13 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HMMROHLQ34.png', '“RIANG &amp; CERIA” adalah festival musik menghadirkan suasana penuh warna yang membangkitkan nostalgia sekaligus menyalakan semangat baru. Terinspirasi dari era retro yang identik dengan kebebasan berekspresi dan keceriaan, event ini mengajak semua orang untuk merayakan cinta dengan cara yang berbeda, bukan untuk mengenang masa lalu, tapi untuk melangkah dengan senyuman baru.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Kayu Agung'
WHERE o.email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria Kayu Agung' AND ev.venue = 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 152
FROM events ev WHERE ev.title = 'Riang dan Ceria Kayu Agung' AND ev.venue = 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- B+Phoria
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'B+Phoria', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-15@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-15@wavy.seed' AND a.name = 'B+Phoria');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'B+Phoria', 'Music', 'Stadion Wilis Kota Madiun, Kota Madiun', '2026-09-18 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XFR3OWKYQ2.jpg', 'BPhoria adalah event Festive yang mengusung konsep dengan nuansa ceria, colourfull, cheersfull, dan kreatif. Event ini bertujuan untuk menunjukkan kolaborasi antar pelaku seni dan budaya yang dikemas secara creative. Dan memberikan “New Experience” kepada Audience. Menghadirkan youth culture experience event yang menggabungkan musik, komunitas dan social interaction dalam satu pengalaman yang kreatif dan interaktif. Menghadirkan entertainment yang relevan dengan tren generasi muda dan memiliki pre-event dan interactive experience untuk meningkatkan engagement dan membuka kolaborasi bagi brand, komunitas, media partner, dan creative industry', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'B+Phoria'
WHERE o.email = 'demo.scrape-15@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'B+Phoria' AND ev.venue = 'Stadion Wilis Kota Madiun, Kota Madiun');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 85
FROM events ev WHERE ev.title = 'B+Phoria' AND ev.venue = 'Stadion Wilis Kota Madiun, Kota Madiun'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sound Of Artjeh - Otewe Banda
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sound Of Artjeh - Otewe Banda', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-16@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-16@wavy.seed' AND a.name = 'Sound Of Artjeh - Otewe Banda');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sound Of Artjeh - Otewe Banda', 'Music', 'Taman Budaya Aceh, Kota Banda Aceh', '2026-09-18 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UODLFIRQJ1.png', 'Sound Of Artjeh Otewe Banda merupakan acara pra-event menuju utama “Dibanda Sama-Sama”, yang menghadirkan pengalaman festival musik dan hiburan bagi masyarakat Banda Aceh dan sekitarnya. Mengusung semangat kebersamaan, Otewe Banda menjadi ruang bagi generasi muda untuk berkumpul, menikmati musik, serta membangun suasana positif melalui pengalaman dan kreativitas. Sebagai bagian dari rangkaian menuju “Dibanda Sama-Sama”, Otewe Banda menghadirkan pertunjukan musik dan berbagai aktivitas hiburan dalam satu rangkaian acara.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sound Of Artjeh - Otewe Banda'
WHERE o.email = 'demo.scrape-16@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sound Of Artjeh - Otewe Banda' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 68
FROM events ev WHERE ev.title = 'Sound Of Artjeh - Otewe Banda' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pementasan Berusaha di Bawah Hujan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pementasan Berusaha di Bawah Hujan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-17@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-17@wavy.seed' AND a.name = 'Pementasan Berusaha di Bawah Hujan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pementasan Berusaha di Bawah Hujan', 'Music', 'Kuningan City Ballroom, Jakarta Selatan', '2026-09-18 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260701140143_6a44bb57d07db.jpg', '&nbsp; ⁠A semi-theatrical live performance that celebrates Idgitaf&rsquo;s musical journey across one EP and two albums. Centered around the theme of rain, Pementasan Berusaha di Bawah Hujan invites audiences to explore the stories behind Idgitaf&rsquo;s latest album through an emotional, authentic, and immersive experience. &nbsp; Get your tickets now! ──────────────────────────────────────── Pertunjukkan tunggal semi-teatrikal yang menghidupkan perjalanan musikal Idgitaf melalui 1 EP dan 2 album secara live. Bertemakan hujan, Idgitaf mengajak audiens menyelami kisah di balik album terbaru Berusaha di Bawah Hujan, dalam pengalaman yang emosional, autentik, dan imersif. &nbsp; Dapatkan tiketmu sekarang juga! &nbsp; &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pementasan Berusaha di Bawah Hujan'
WHERE o.email = 'demo.scrape-17@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pementasan Berusaha di Bawah Hujan' AND ev.venue = 'Kuningan City Ballroom, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 349000, 500, 61
FROM events ev WHERE ev.title = 'Pementasan Berusaha di Bawah Hujan' AND ev.venue = 'Kuningan City Ballroom, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Diphoria Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Diphoria Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-18@wavy.seed' AND a.name = 'Diphoria Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Diphoria Fest', 'Music', 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat', '2026-09-19 11:35:01'::timestamptz, 'https://assets.artatix.co.id/event/HIA4ZBQQRE.png', 'An event by Sekolah Islam Dian Didaktika celebrating Aceh’s beautiful traditions with a modern twist, performing art, dance, singing, and your favorite singer line-up!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Diphoria Fest'
WHERE o.email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Diphoria Fest' AND ev.venue = 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 34
FROM events ev WHERE ev.title = 'Diphoria Fest' AND ev.venue = 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Swable Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Swable Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-19@wavy.seed' AND a.name = 'Swable Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Swable Fest', 'Music', 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat', '2026-09-19 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OWHVW57771.jpg', 'Swable Fest 10 adalah puncak acara sekaligus penutup dari rangkaian event Swable Cup X Fest 10 yang di mana berisi pentas seni, pengumuman lomba Swable Cup 10, penampilan ekstrakulikuler SMAN 112 Jakarta, penampilan band, penampilan spesial dari Guest Star ternama, serta penampilan-penampilan menarik lainnya. For more information kindly contact us below: Instagram: @swablefest Email : Swablecupfest@gmail.com Contact Person: 087886723674 (Lulu Athir) 081908191921 (Malika) #ADVENTRA #SwableCUPxFEST10 #SwableFEST10', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Swable Fest'
WHERE o.email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Swable Fest' AND ev.venue = 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 147
FROM events ev WHERE ev.title = 'Swable Fest' AND ev.venue = 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road to Festival 76 Indonesia Adalah Kita 2026 - Solo
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-3@wavy.seed' AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo', 'Music', 'Pura Mangkunegaran, Kota Surakarta', '2026-09-19 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AZ28UV84HU.png', 'ROAD TO FESTIVAL 76 INDONESIA ADALAH KITA HADIR DI SOLO RAYA! 🚀🔥 Sobat Heppiii Solo Raya, siap-siap rayakan kebersamaan dalam satu keseruan yang nggak boleh dilewatkan!&nbsp; Mark your calendar pada tanggal 19 September 2026 di Halaman Mangkunegaran, Solo! Line Up: @theclovesandthetobacco @official510music @thejeblogs @thekick_ @theskit__ @soloensisofficial &amp; Blitz G Nggak cuma musik, di sini juga ada MUSIC FUN SKATE, 76 SKATERS, BMX, LIVE MURAL, HEPPIII GAMES, POP-UP MARKET, RAP BATTLES, F&amp;B, dan masih banyak keseruan lainnya! 🔥 📅&nbsp; Sabtu, 19 September 2026 – Solo 📍 Halaman Mangkunegaran, Solo 🕒&nbsp; Jam Penukaran Tiket ⏳&nbsp; Early Entry &nbsp;→ 13.00 - 16.00 WIB ⏳&nbsp; Presale &amp; Normal &nbsp;→ 14.00 - 21.00 WIB 🚪&nbsp; Open Gate ⏰&nbsp; Early Entry &nbsp;→ 14.00 WIB ⚠️ TIKET TERBATAS! &nbsp;Jangan cuma jadi penonton story, amankan tiketmu sekarang dan ajak bestie kamu buat seru-seruan bareng! 🔥 Let’s celebrate togetherness and heppiiiness in the differences that unite us! 🇮🇩 📢 Info lebih lanjut? Follow @jalanjalanheppiii76 &amp; @yangpentingheppiii!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo'
WHERE o.email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 89
FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festaria Purbalingga
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festaria Purbalingga', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-20@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-20@wavy.seed' AND a.name = 'Festaria Purbalingga');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festaria Purbalingga', 'Music', 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga', '2026-09-19 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q327TOR9VU.png', 'Festaria Purbalingga hadir sebagai festival musik dan hiburan spektakuler yang siap mengguncang Kabupaten Purbalingga. Nikmati malam penuh kemeriahan bersama deretan artis dan musisi favorit dalam satu panggung megah. Line Up: Ajeng Febria Oqinawa Daun Band Resty Ambyar Tria Ocan Azizah Tiena Ugiez Agne Valita Dipandu oleh MC Surya , acara akan semakin meriah dengan penampilan yang menghibur dan interaksi seru bersama para penonton. Selain menikmati konser musik, pengunjung juga dapat merasakan suasana festival yang nyaman dengan area kuliner dan UMKM yang siap memanjakan berbagai selera. Lokasi: Halaman Parkir GOR Guntur Darjono Purbalingga Ajak keluarga, sahabat, dan teman-temanmu untuk menjadi bagian dari kemeriahan Festaria Purbalingga . Bersiaplah menikmati malam penuh musik, kebersamaan, dan hiburan yang tak terlupakan!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festaria Purbalingga'
WHERE o.email = 'demo.scrape-20@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festaria Purbalingga' AND ev.venue = 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 170
FROM events ev WHERE ev.title = 'Festaria Purbalingga' AND ev.venue = 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MELANKOLIA DI MEDAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MELANKOLIA DI MEDAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-21@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-21@wavy.seed' AND a.name = 'MELANKOLIA DI MEDAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MELANKOLIA DI MEDAN', 'Music', 'DI MEDAN, Kota Medan', '2026-09-19 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AIGFKOJOO7.jpg', 'Melankolia di Medan', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MELANKOLIA DI MEDAN'
WHERE o.email = 'demo.scrape-21@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MELANKOLIA DI MEDAN' AND ev.venue = 'DI MEDAN, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 103
FROM events ev WHERE ev.title = 'MELANKOLIA DI MEDAN' AND ev.venue = 'DI MEDAN, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ayo Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ayo Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-22@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-22@wavy.seed' AND a.name = 'Ayo Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ayo Fest 2026', 'Music', 'Stadion Kridasana, Kota Singkawang', '2026-09-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RZACV5HUEL.jpg', 'Ayo Fest 2026 merupakan festival musik dan hiburan yang akan diselenggarakan pada Minggu, 20 September 2026 di Stadion Kridasana, Kota Singkawang. Festival ini menghadirkan penampilan artis ternama, local artist, serta berbagai hiburan menarik yang siap memberikan pengalaman festival yang meriah dan berkesan bagi seluruh pengunjung. AYO FEST 2026 dirancang sebagai salah satu festival hiburan terbesar di Kota Singkawang dengan konsep modern, energik, dan penuh pengalaman menarik yang dapat dinikmati oleh semua kalangan. Pembelian tiket resmi AYO FEST 2026 hanya tersedia melalui Artatix.co.id.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ayo Fest 2026'
WHERE o.email = 'demo.scrape-22@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ayo Fest 2026' AND ev.venue = 'Stadion Kridasana, Kota Singkawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 6
FROM events ev WHERE ev.title = 'Ayo Fest 2026' AND ev.venue = 'Stadion Kridasana, Kota Singkawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRIT U ALL FOR SPIRITUAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRIT U ALL FOR SPIRITUAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-23@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-23@wavy.seed' AND a.name = 'SPIRIT U ALL FOR SPIRITUAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRIT U ALL FOR SPIRITUAL', 'Music', 'Pantai Sumur Pawon, Kab. Tuban', '2026-09-20 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6E9LRGRRAS.jpg', 'One year was never merely the passing of time. It was a year carved into our scars, etched in silence, and carried beneath the weight of the crown. Ini tentang mereka yang tetap tinggal, berjalan bersama, dan menjaga spirit yang sama. 🕯️ One Fire, One Spirit, One Journey 🕯️ 1st Anniversary of 510Squad Lamongan 📍 Pantai Sumur Pawon 📅 20–21 September 2026 ⏳ Camp &amp; Sharing Session • Prize Game • Acoustic Cover Set 510 Gather beneath the crown. Share the weight. Awaken the spirit within. For what was buried shall rise again. The spirit will soon reveal itself.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRIT U ALL FOR SPIRITUAL'
WHERE o.email = 'demo.scrape-23@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRIT U ALL FOR SPIRITUAL' AND ev.venue = 'Pantai Sumur Pawon, Kab. Tuban');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35510, 500, 139
FROM events ev WHERE ev.title = 'SPIRIT U ALL FOR SPIRITUAL' AND ev.venue = 'Pantai Sumur Pawon, Kab. Tuban'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In Inertia Showcase Bandung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In Inertia Showcase Bandung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-24@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-24@wavy.seed' AND a.name = 'In Inertia Showcase Bandung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase Bandung', 'Music', 'Gedung Amphiteater UPI, Kota Bandung', '2026-09-20 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U8ZBYV3UR7.png', 'In Inertia Showcase Bandung', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase Bandung'
WHERE o.email = 'demo.scrape-24@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase Bandung' AND ev.venue = 'Gedung Amphiteater UPI, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 272
FROM events ev WHERE ev.title = 'In Inertia Showcase Bandung' AND ev.venue = 'Gedung Amphiteater UPI, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Muda Mudi Feelling Empty
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Muda Mudi Feelling Empty', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-25@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-25@wavy.seed' AND a.name = 'Muda Mudi Feelling Empty');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Muda Mudi Feelling Empty', 'Music', 'PARDES CAFE & PLAYSTATION, Kab. Tangerang', '2026-09-25 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FS7S3GRX35.png', 'Muda Mudi Feeling Empty merupakan gelaran acara musik berbasis karaoke set dan sing-along yang dirancang sebagai ruang ekspresi bagi penikmat musik subkultur, pop-punk, emo, dan post-hardcore. Mengusung konsep interaktif, acara ini menghadirkan pengalaman pertunjukan musik di mana batas antara pengisi acara dan audiens melebur dalam satu arena bernyanyi bersama. 1.Faizal Halim Permana / Ical (510) 2.Savira Razak (Billfold) Turut juga menghadirkan activity tambahan lainnya seperti standup comedy, battle dance, dj set after party.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Muda Mudi Feelling Empty'
WHERE o.email = 'demo.scrape-25@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Muda Mudi Feelling Empty' AND ev.venue = 'PARDES CAFE & PLAYSTATION, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 155
FROM events ev WHERE ev.title = 'Muda Mudi Feelling Empty' AND ev.venue = 'PARDES CAFE & PLAYSTATION, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BOOMFEST SERANG 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BOOMFEST SERANG 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'BOOMFEST SERANG 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BOOMFEST SERANG 2026', 'Music', 'Stadion Maulana Yusuf, Kota Serang', '2026-09-26 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6SNHOZ0YEW.jpg', 'BOOMFEST 2026 adalah festival musik yang diselenggarakan oleh Republik Event Musik Indonesia untuk menghadirkan hiburan berkualitas, mempertemukan musisi, penikmat musik, komunitas, dan pelaku UMKM dalam satu ruang kolaborasi. Lebih dari sekadar pertunjukan, BOOMFEST menjadi tempat untuk merayakan kreativitas, mendukung pertumbuhan ekonomi kreatif, dan menciptakan dampak positif bagi masyarakat serta pelaku usaha di sekitar lokasi acara.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BOOMFEST SERANG 2026'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BOOMFEST SERANG 2026' AND ev.venue = 'Stadion Maulana Yusuf, Kota Serang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 228
FROM events ev WHERE ev.title = 'BOOMFEST SERANG 2026' AND ev.venue = 'Stadion Maulana Yusuf, Kota Serang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL BLORA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL BLORA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-27@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-27@wavy.seed' AND a.name = 'TVONE BESTIEVAL BLORA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL BLORA', 'Music', 'Lapangan Kridosono, Blora, Kab. Blora', '2026-09-26 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6Q57JVU0WS.png', 'Bestieval adalah sebuah event Konser yang menyajikan artis-artis papan atas yang berbeda genre musik.untuk mempersatukan persatuan dan menyambung ikatan silahturahmi (Bestie) antar fans artis tersebut', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL BLORA'
WHERE o.email = 'demo.scrape-27@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL BLORA' AND ev.venue = 'Lapangan Kridosono, Blora, Kab. Blora');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 91
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL BLORA' AND ev.venue = 'Lapangan Kridosono, Blora, Kab. Blora'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THE RAWSTAGE one fight one stage
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THE RAWSTAGE one fight one stage', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-28@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-28@wavy.seed' AND a.name = 'THE RAWSTAGE one fight one stage');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THE RAWSTAGE one fight one stage', 'Music', 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara', '2026-09-27 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1IX1SHBW7H.jpg', 'THE RAWSTAGE – Combat Lifestyle &amp; Event adalah event yang memadukan boxing, muaythai, music, dan lifestyle dalam satu panggung. Menghadirkan pertandingan dan exhibition match dengan atmosfer kompetitif, sportif, serta hiburan bagi pecinta olahraga dan musik. 📍 Youth Market Arena, Pasar Kerajinan Margoyoso, Kalinyamatan, Jepara 📅 Minggu, 27 September 2026 ⏰ 16.00 WIB – selesai', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THE RAWSTAGE one fight one stage'
WHERE o.email = 'demo.scrape-28@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THE RAWSTAGE one fight one stage' AND ev.venue = 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 274
FROM events ev WHERE ev.title = 'THE RAWSTAGE one fight one stage' AND ev.venue = 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TYFOFEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TYFOFEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-29@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-29@wavy.seed' AND a.name = 'TYFOFEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TYFOFEST', 'Music', 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur', '2026-09-27 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YEU9Z8V59R.png', 'TYFOFES T merupakan puncak sekaligus penutup dari rangkaian FOCUST Vol. XVI yang diselenggarakan oleh SMAN 44 Jakarta, setelah sebelumnya diawali dengan pelaksanaan TyfoCup . Acara ini akan menghadirkan berbagai rangkaian kegiatan, mulai dari pembagian hadiah bagi para pemenang TyfoCup, penampilan ekstrakurikuler SMAN 44 Jakarta , penampilan band, hingga penampilan spesial dari Guest Star dan berbagai hiburan menarik lainnya. TYFOFEST hadir sebagai momen perayaan untuk menutup rangkaian FOCUST Vol. XVI dengan penuh semangat dan keseruan.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TYFOFEST'
WHERE o.email = 'demo.scrape-29@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TYFOFEST' AND ev.venue = 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 117
FROM events ev WHERE ev.title = 'TYFOFEST' AND ev.venue = 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Colors of D'Angelic #4  Echoes of A Journey
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Colors of D''Angelic #4  Echoes of A Journey', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-30@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-30@wavy.seed' AND a.name = 'Colors of D''Angelic #4  Echoes of A Journey');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Colors of D''Angelic #4  Echoes of A Journey', 'Music', 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan', '2026-10-03 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OBR9DGUW9U.png', 'Kehidupan sering kali membawa kita pada sebuah perjalanan panjang untuk mencari makna dan jalan pulang. Echoes of A Journey: Where Every Note Finds Its Way Home adalah sebuah konser amal paduan suara yang merangkai lagu demi lagu menjadi satu narasi utuh, yang akan mengajak Anda menyusuri sebuah kisah. Kisah tentang keberanian untuk melangkah, keteguhan melintasi badai, momen perenungan dalam keheningan, hingga akhirnya kembali menyambut cahaya. Perjalanan kisah ini akan dituturkan melalui harmoni suara D’Angelic Choir, komunitas paduan suara di bawah bimbingan Jonas Danny. Berawal dari kecintaan yang murni pada seni musik dan semangat kekeluargaan D’Angelic Choir berkembang menjadi komunitas paduan suara dengan deretan karya dan jejak panggung yang bermula dari kompetisi tingkat nasional, Australian International Music Festival, Sydney Opera House, hingga kesempatan berkolaborasi bersama TRUST Orchestra. Kami percaya bahwa seni memiliki kekuatan untuk membawa kebaikan. Oleh karena itu sebagian dukungan dari acara ini akan didedikasikan untuk gerakan ASAK (Ayo Sekolah Ayo Kuliah) Paroki St. Kristoforus . ASAK merupakan program pendampingan holistik yang menjadi jembatan bagi generasi muda untuk terus mengejar pendidikan dan cita-cita. Lewat pembinaan karakter, dukungan moral, dan rasa kekeluargaan, ASAK hadir memastikan setiap anak binaan dapat bertumbuh menjadi pribadi yang mandiri dan siap melangkah maju ke masa depan. Mari menjadi bagian dari perjalanan ini. Sampai jumpa di hari pertunjukan, tempat setiap nada dan kebaikan akan bergema menjadi satu.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Colors of D''Angelic #4  Echoes of A Journey'
WHERE o.email = 'demo.scrape-30@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Colors of D''Angelic #4  Echoes of A Journey' AND ev.venue = 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 170
FROM events ev WHERE ev.title = 'Colors of D''Angelic #4  Echoes of A Journey' AND ev.venue = 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SEMESTAMBYAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SEMESTAMBYAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-31@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-31@wavy.seed' AND a.name = 'SEMESTAMBYAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SEMESTAMBYAR', 'Music', 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto', '2026-10-03 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/X8MEND59Z1.jpg', 'Menjelang akhir tahun, atmosfer perayaan selalu dinanti oleh masyarakat. Memanfaatkan momentum pergantian bulan di penghujung tahun ini, Kota Mojokerto siap menggebrak lewat sebuah gelaran megah bertajuk Semestambyar. Bukan sekadar konser biasa, Semestambyar hadir sebagai panggung selebrasi yang memadukan energi musik dangdut, kehangatan budaya lokal, dan geliat ekonomi kreatif masyarakat. Namun, Semestambyar tidak hanya memanjakan telinga dan jiwa. Menyadari pentingnya menjaga stamina para penonton selama acara, konser ini terintegrasi langsung dengan pameran UMKM kuliner lokal. Pengunjung dapat menikmati aneka hidangan khas yang siap memanjakan lidah, memastikan kebutuhan logistik dan perut penonton tetap terpenuhi dengan baik di area festival. Lebih dari sekadar panggung hiburan, Semestambyar mengemban misi besar untuk kemajuan daerah. Acara ini dirancang strategis sebagai ajang promosi pariwisata guna menarik wisatawan dari luar daerah untuk berkunjung dan mengenal lebih dekat potensi Kota Mojokerto. Melalui perputaran transaksi di lapak UMKM dan sektor pendukung lainnya, event ini ditargetkan menjadi motor penggerak untuk mendongkrak ekonomi wilayah, memberikan dampak nyata bagi kesejahteraan para pelaku usaha lokal. Semestambyar adalah bukti nyata bagaimana hiburan dan pemberdayaan ekonomi dapat berjalan beriringan, membawa nama Kota Mojokerto semakin bersinar di peta pariwisata nasional.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SEMESTAMBYAR'
WHERE o.email = 'demo.scrape-31@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SEMESTAMBYAR' AND ev.venue = 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 73
FROM events ev WHERE ev.title = 'SEMESTAMBYAR' AND ev.venue = 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pead Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pead Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-32@wavy.seed' AND a.name = 'Pead Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pead Fest', 'Music', 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan', '2026-10-03 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AJ2QW4Y8LL.jpg', 'Sebuah rangkaian dari program kerja Unit Kegiatan Mahasiswa Pancasila Economic Art Division yang menyajikan sebuah konten festival musik.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pead Fest'
WHERE o.email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pead Fest' AND ev.venue = 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 106
FROM events ev WHERE ev.title = 'Pead Fest' AND ev.venue = 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kepri Island Run 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kepri Island Run 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'Kepri Island Run 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kepri Island Run 2026', 'Music', 'Taman Pacific Palace Hotel, Batam, Kota Batam', '2026-10-04 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NWMDPQ0GOE.png', '🏃‍♀️ Deskripsi Event – Kepri Island Run 2026 Kepri Island Run 2026 hadir dengan semangat “Running Across Batam City” , mengajak para pecinta olahraga untuk menikmati pengalaman berlari sekaligus menjelajahi energi dan keindahan Kota Batam. 📅 4 Oktober 2026 📍 Taman Pacific Palace Hotel, Batam Tersedia dua pilihan kategori: 10K Umum/Master 5K Umum Untuk Early Bird , harga mulai dari Rp185.000 untuk 5K dan Rp200.000 untuk 10K . Tersedia juga harga Regular sebesar Rp250.000 untuk 5K dan Rp300.000 untuk 10K . 🎁 Promo Early Bird: Buy 10 Get 1 Free! Jangan sampai kehabisan slot dan pastikan kamu sudah siap menjadi salah satu pelari yang paling kencang di Kepri Island Run 2026 ! Run the city. Feel the energy. Be part of Kepri Island Run 2026! 🏃‍♂️🔥', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kepri Island Run 2026'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kepri Island Run 2026' AND ev.venue = 'Taman Pacific Palace Hotel, Batam, Kota Batam');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 119
FROM events ev WHERE ev.title = 'Kepri Island Run 2026' AND ev.venue = 'Taman Pacific Palace Hotel, Batam, Kota Batam'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tabuan Show ( intimate concert )
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tabuan Show ( intimate concert )', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-34@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-34@wavy.seed' AND a.name = 'Tabuan Show ( intimate concert )');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tabuan Show ( intimate concert )', 'Music', 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon', '2026-10-04 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VYJ3QWSWB1.png', 'TABUAN SHOW CIREBON – Intimate Concert Bersiaplah menikmati malam penuh musik dan kehangatan dalam Tabuan Show Cirebon: Intimate Concert . Menghadirkan suasana yang lebih dekat antara penampil dan penonton, acara ini menjadi ruang bagi para pecinta musik untuk menikmati pertunjukan secara lebih personal dan berkesan. Penampilan spesial dari Aftershine yang dikenal dengan lagu-lagu bernuansa pop Jawa dan ambyar modern, serta Hii Show yang akan lounching EP Album siap memberikan hiburan penuh energi, akan menciptakan pengalaman konser yang tak terlupakan. Dengan konsep intimate concert, setiap lagu akan terasa lebih dekat, lebih hangat, dan lebih bermakna. Ajak teman, pasangan, maupun keluarga untuk menikmati malam penuh cerita, nyanyian, dan kebersamaan dalam satu panggung istimewa. 📅 Tanggal: 4 Oktober 2026 📍 Venue: Elpizo Space, Ciledug, Kabupaten Cirebon 🎤 Special Performances: Aftershine Hii Show 🎟️ Tiket tersedia di Artatix Jangan lewatkan kesempatan untuk menjadi bagian dari malam yang dipenuhi musik, nostalgia, dan momen yang akan terus dikenang. Sampai bertemu di Tabuan Show Cirebon – Intimate Concert!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tabuan Show ( intimate concert )'
WHERE o.email = 'demo.scrape-34@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tabuan Show ( intimate concert )' AND ev.venue = 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 102
FROM events ev WHERE ev.title = 'Tabuan Show ( intimate concert )' AND ev.venue = 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GEMA Music Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GEMA Music Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-35@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-35@wavy.seed' AND a.name = 'GEMA Music Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GEMA Music Fest', 'Music', 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang', '2026-10-09 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XMPPF83CDN.png', '*GEMA Music Fest : The New Season #SaatnyaSemuaBerwarna* Festival ini hadir membawa pengalaman yang lebih menarik, lebih berwarna dan penuh keseruan untuk semua. Nikmati penampilan spesial dari deretan *lineup artist* yang siap menghidupkan panggung utama dengan musik favoritmu. Keseruan juga berlanjut di *Mini Stage* dengan berbagai penampilan menarik, aktivitas interaktif, hingga hiburan yang bisa dinikmati sepanjang acara. Tak hanya itu, kamu juga bisa menjelajahi berbagai area komunitas, mengikuti beragam aktivitas seru, bermain games, berburu kuliner, mengunjungi tenant favorit dan merasakan atmosfer festival yang hangat bersama teman, keluarga, maupun komunitas. Apa pun warna ceritamu, semua bisa bertemu dalam satu perayaan yang penuh musik, kreativitas dan kebersamaan. *Saatnya semua bernyanyi. Saatnya semua berkumpul. Saatnya Semua Berwarna.* Sampai jumpa di *GEMA Music Fest: The New Season #SaatnyaSemuaBerwarna!*', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GEMA Music Fest'
WHERE o.email = 'demo.scrape-35@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GEMA Music Fest' AND ev.venue = 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 89999, 500, 264
FROM events ev WHERE ev.title = 'GEMA Music Fest' AND ev.venue = 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LOLLIPOP FEST VOL. 02
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LOLLIPOP FEST VOL. 02', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-36@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-36@wavy.seed' AND a.name = 'LOLLIPOP FEST VOL. 02');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LOLLIPOP FEST VOL. 02', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-10-09 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9IPETULINA.jpg', 'LOLLIPOP FEST VOL. 2 hadir kembali di Solo dengan penampilan dari beberapa Musisi Ibu Kota. ​ LINE UP FOR REVENGE - TEPE - ENAU - ARI LESMANA - RONY PARULIAN', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LOLLIPOP FEST VOL. 02'
WHERE o.email = 'demo.scrape-36@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 02' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 89500, 500, 68
FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 02' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Malang Bay Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Malang Bay Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-37@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-37@wavy.seed' AND a.name = 'Malang Bay Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Malang Bay Fest 2026', 'Music', 'Pantai Selatan Malang, Kab. Malang', '2026-10-10 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/EPWM4715O1.png', 'Malang Bay Fest 2026: The Ultimate Reggae Celebration Malang Bay Fest 2026 adalah FestivalMusik R eggae dua hari yang menampilkan deretan penampil lokal dan nasional dengan basis penggemar besar di Jawa Timur. Mengusung konsep B each Vibes dan Kehangatan Komunitas yang relevan dengan generasi usia 18–40 tahun, festival ini diadakan di lokasi strategis kawasan Malang Raya dengan kapasitas 12.000 penonton.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Malang Bay Fest 2026'
WHERE o.email = 'demo.scrape-37@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Malang Bay Fest 2026' AND ev.venue = 'Pantai Selatan Malang, Kab. Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 141
FROM events ev WHERE ev.title = 'Malang Bay Fest 2026' AND ev.venue = 'Pantai Selatan Malang, Kab. Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GLORIFEST "FESTARIA 2026"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GLORIFEST "FESTARIA 2026"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-38@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-38@wavy.seed' AND a.name = 'GLORIFEST "FESTARIA 2026"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GLORIFEST "FESTARIA 2026"', 'Music', 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor', '2026-10-10 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/31JTQ75YX5.png', 'GLORIFEST "FESTARIA 2026" ✨ GLORIFEST is coming! ✨ Siapkan energi terbaikmu untuk merasakan keseruan GLORIFEST , sebuah festival seru yang menghadirkan semangat, kreativitas, dan kebersamaan dalam satu momen yang nggak boleh dilewatkan! 📍 Venue: SMA Global Mandiri Cibubur 📅 Tanggal: 10 Oktober 2026 🎤 Penyelenggara: SMA Global Mandiri Cibubur Nikmati berbagai keseruan dan pengalaman menarik bersama teman-teman dalam suasana festival yang penuh energi. Jadikan GLORIFEST sebagai momen untuk berkumpul, bersenang-senang, dan menciptakan kenangan yang nggak terlupakan! 🔥 Save the date and get ready to celebrate the glory at GLORIFEST! 10 Oktober 2026 — See you at GLORIFEST FESTARIA!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GLORIFEST "FESTARIA 2026"'
WHERE o.email = 'demo.scrape-38@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GLORIFEST "FESTARIA 2026"' AND ev.venue = 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 284
FROM events ev WHERE ev.title = 'GLORIFEST "FESTARIA 2026"' AND ev.venue = 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SUMPAH PEMUDA FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SUMPAH PEMUDA FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-39@wavy.seed' AND a.name = 'SUMPAH PEMUDA FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SUMPAH PEMUDA FEST 2026', 'Music', 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal', '2026-10-10 18:30:01'::timestamptz, 'https://assets.artatix.co.id/event/VXEZHF6KTH.png', 'SUMPAH PEMUDA FEST 2026 Sumpah Pemuda Fest 2026 adalah konser dangdut ambyar yang menghadirkan perpaduan musik, semangat anak muda, dan hiburan dalam satu panggung. Mengusung energi khas generasi muda, acara ini menjadi ruang untuk berkumpul, bernyanyi bersama, dan menikmati penampilan musisi favorit dalam suasana yang meriah. Menghadirkan Ajeng Febria, Lavora, SMILHD,DAUN Dan MC Surya , serta sejumlah penampil lainnya, Sumpah Pemuda Fest 2026 siap menyuguhkan pengalaman konser yang penuh energi dan tidak terlupakan. Acara akan digelar pada 10 Oktober 2026 , mulai pukul 18.30 WIB , berlokasi di Lapangan Aspol Slawi, Tegal . Dengan menggabungkan semangat Sumpah Pemuda dan atmosfer konser dangdut yang dekat dengan generasi muda, Sumpah Pemuda Fest 2026 diharapkan menjadi momentum untuk merayakan kebersamaan, kreativitas, dan semangat anak muda melalui musik. Satu panggung. Satu semangat. Satu malam untuk bernyanyi bersama. Sumpah Pemuda Fest 2026 — saatnya Sobat Panggung ketemu, nyanyi, dan seru-seruan bareng!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SUMPAH PEMUDA FEST 2026'
WHERE o.email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SUMPAH PEMUDA FEST 2026' AND ev.venue = 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 59000, 500, 57
FROM events ev WHERE ev.title = 'SUMPAH PEMUDA FEST 2026' AND ev.venue = 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-40@wavy.seed' AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', 'Laswi Heritage, Bandung', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824143453_6a8bf41dee62f.jpg', 'GOOD DAY SCHOOLIOCUS - Harmony In Collaboration Vol 4 Kompetisi Angklung Tingkat SMA terbesar di Jawa Barat kembali hadir di bulan Oktober 2026. Kali ini mendatangkan guest star: Saung Angklung Udjo, DIA - Stand Here Alone &amp; Juicy Luicy. &nbsp; Selain penampilan di atas kalian juga dapat mengikuti banyak games seru dan hadiah menarik setiap kalian memenangkan games. &nbsp; &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4'
WHERE o.email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 0
FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BADONCI FESTIVAL DISK.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BADONCI FESTIVAL DISK.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-41@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-41@wavy.seed' AND a.name = 'BADONCI FESTIVAL DISK.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BADONCI FESTIVAL DISK.2', 'Music', 'Pohon Kasih Megamas, Kota Manado', '2026-10-15 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821133006_6a87f06e50af1.jpg', 'SYARAT DAN KETENTUAN BADONCI FESTIVAL 1.⁠ ⁠UMUM Badonci&nbsp;Festival&nbsp;diselenggarakan&nbsp;oleh&nbsp;penyelenggara&nbsp;resmi&nbsp;PT. Sigma Pro Indonesia&nbsp; Syarat&nbsp;dan&nbsp;ketentuan&nbsp;ini&nbsp;berlaku&nbsp;untuk&nbsp;semua&nbsp;pengunjung,&nbsp;peserta, artis, vendor, dan&nbsp;pihak&nbsp;terkait&nbsp;yang&nbsp;terlibat&nbsp;dalamacara. Penyelenggara&nbsp;berhak&nbsp;mengubah&nbsp;syarat&nbsp;dan&nbsp;ketentuan&nbsp;kapan&nbsp;saja&nbsp;tanpa&nbsp;pemberitahuan&nbsp;terlebih&nbsp;dahulu,&nbsp;denganpembaruan&nbsp;akan&nbsp;diumumkan&nbsp;melalui&nbsp;kanal&nbsp;resmi&nbsp;festival. &nbsp; 2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET Tiket&nbsp;hanya&nbsp;bisa&nbsp;dibeli&nbsp;melalui&nbsp;kanal&nbsp;resmi&nbsp;yang&nbsp;telah&nbsp;ditentukan&nbsp;LOKET.COM. ⁠Setiap&nbsp;tiket&nbsp;hanya&nbsp;sah&nbsp;untuk&nbsp;satu&nbsp;orang dan&nbsp;tidak&nbsp;dapat&nbsp;dipindahkan&nbsp;kepemilikan&nbsp;atau&nbsp;dijual&nbsp;kembali&nbsp;tanpa&nbsp;izinpenyelenggara. Tiket&nbsp;yang&nbsp;hilang,&nbsp;rusak,&nbsp;atau&nbsp;palsu&nbsp;tidak&nbsp;akan&nbsp;diganti&nbsp;atau&nbsp;diterima&nbsp;masuk. Pengunjung&nbsp;harus&nbsp;menunjukkan&nbsp;tiket&nbsp;berupa&nbsp;QR Code&nbsp;&nbsp;atau&nbsp;bukti&nbsp;pembayaran&nbsp;elektronik&nbsp;yang valid&nbsp;saat&nbsp;masuk&nbsp;area festival. &nbsp; 3.⁠ ⁠SYARAT MASUK AREA FESTIVAL Pengunjung&nbsp;di&nbsp;bawah&nbsp;umur&nbsp;harus&nbsp;ditemani&nbsp;oleh orang&nbsp;tua&nbsp;atau&nbsp;wali&nbsp;yang&nbsp;bertanggung&nbsp;jawab. ⁠Semua&nbsp;pengunjung&nbsp;wajib&nbsp;menjalani&nbsp;pemeriksaan&nbsp;keamanan&nbsp;sebelum&nbsp;masuk&nbsp;area festival. ⁠Penyelenggara&nbsp;berhak&nbsp;menolak&nbsp;masuk&nbsp;atau&nbsp;mengeluarkan&nbsp;pengunjung&nbsp;yang&nbsp;tidak&nbsp;mematuhi&nbsp;peraturan&nbsp;atau&nbsp;menunjukkanperilaku&nbsp;yang&nbsp;mengganggu&nbsp;ketertiban. &nbsp; 4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN Barang&nbsp;terlarang: Senjata&nbsp;api,&nbsp;senjata&nbsp;tajam, dan&nbsp;benda&nbsp;berbahaya&nbsp;lainnya. Narkoba,&nbsp;alkohol, dan&nbsp;zat&nbsp;terlarang&nbsp;lainnya. ⁠Bahan&nbsp;peledak&nbsp;atau&nbsp;bahan&nbsp;yang&nbsp;dapat&nbsp;menyebabkan&nbsp;kebakaran. ⁠Benda&nbsp;keras&nbsp;atau&nbsp;tajam&nbsp;yang&nbsp;dapat&nbsp;digunakan&nbsp;sebagai&nbsp;alat&nbsp;serangan. Drinks dan&nbsp;makanan&nbsp;dari&nbsp;luar&nbsp;area festival (kecuali&nbsp;untuk&nbsp;kebutuhan&nbsp;kesehatan&nbsp;khusus&nbsp;dengan&nbsp;izin&nbsp;tertulis). Barang&nbsp;diizinkan&nbsp;(dengan&nbsp;pembatasan): Tas&nbsp;kecil&nbsp;atau&nbsp;ransel&nbsp;dengan&nbsp;ukuran&nbsp;maksimal&nbsp;[misal: 40x30x20 cm]. ⁠Perlengkapan&nbsp;medis&nbsp;pribadi&nbsp;dengan&nbsp;izin&nbsp;petugas&nbsp;keamanan. ⁠Kamera&nbsp;foto/video non-profesional&nbsp;(tanpa&nbsp;tripod&nbsp;atau&nbsp;peralatan&nbsp;besar). ⁠Sunscreen,&nbsp;topi, dan&nbsp;payung&nbsp;untuk&nbsp;perlindungan&nbsp;dari&nbsp;cuaca. &nbsp; 5.⁠ ⁠PERILAKU PENGUNJUNG Seluruh&nbsp;pengunjung&nbsp;diharapkan&nbsp;bertingkah&nbsp;laku&nbsp;sopan&nbsp;dan&nbsp;menghormati&nbsp;sesama&nbsp;pengunjung, artis, dan&nbsp;petugas&nbsp;acara. Tidak&nbsp;diperbolehkan&nbsp;melakukan&nbsp;tindakan&nbsp;kekerasan,&nbsp;pelecehan,&nbsp;atau&nbsp;ujaran&nbsp;kebencian. ⁠Tidak&nbsp;diperbolehkan&nbsp;merusak&nbsp;atau&nbsp;mengganggu&nbsp;fasilitas&nbsp;dan&nbsp;properti&nbsp;festival. Merokok&nbsp;hanya&nbsp;diperbolehkan&nbsp;di area&nbsp;merokok&nbsp;yang&nbsp;telah&nbsp;ditentukan. &nbsp; 6.⁠ ⁠HAK DAN TANGGUNG JAWAB PENYELENGGARA Penyelenggara&nbsp;berhak&nbsp;membatalkan&nbsp;atau&nbsp;menangguhkan&nbsp;acara&nbsp;karena&nbsp;alasan&nbsp;keamanan,&nbsp;cuaca&nbsp;ekstrem,&nbsp;atau&nbsp;kondisi&nbsp;takterduga&nbsp;lainnya. Dalam&nbsp;hal&nbsp;ini,&nbsp;pengembalian&nbsp;tiket&nbsp;akan&nbsp;diatur&nbsp;sesuai&nbsp;kebijakan&nbsp;yang&nbsp;telah&nbsp;ditentukan. Penyelenggara&nbsp;tidak&nbsp;bertanggung&nbsp;jawab&nbsp;atas&nbsp;kehilangan,&nbsp;kerusakan,&nbsp;atau&nbsp;cedera&nbsp;yang&nbsp;terjadi&nbsp;pada&nbsp;pengunjung&nbsp;akibatkelalaian&nbsp;pribadi&nbsp;atau&nbsp;tidak&nbsp;mematuhi&nbsp;peraturan. Penyelenggara&nbsp;berhak&nbsp;mengambil&nbsp;foto&nbsp;atau&nbsp;video&nbsp;selama&nbsp;acara&nbsp;untuk&nbsp;keperluan&nbsp;promosi&nbsp;dan&nbsp;dokumentasi,&nbsp;denganpengunjung&nbsp;dianggap&nbsp;telah&nbsp;menyetujui&nbsp;penggunaan&nbsp;gambar&nbsp;tersebut. &nbsp; 7.⁠ ⁠KESEHATAN DAN KEAMANAN Pengunjung&nbsp;dengan&nbsp;kondisi&nbsp;kesehatan&nbsp;khusus&nbsp;disarankan&nbsp;untuk&nbsp;membawa&nbsp;obat&nbsp;pribadi&nbsp;dan&nbsp;memberitahu&nbsp;petugas&nbsp;medisjika&nbsp;diperlukan. Area&nbsp;medis&nbsp;tersedia&nbsp;di&nbsp;lokasi&nbsp;festival&nbsp;untuk&nbsp;menangani&nbsp;kasus&nbsp;darurat. ⁠Petugas&nbsp;keamanan&nbsp;dan&nbsp;petugas&nbsp;acara&nbsp;siap&nbsp;membantu&nbsp;pengunjung&nbsp;jika&nbsp;ada&nbsp;masalah&nbsp;atau&nbsp;keadaan&nbsp;darurat.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BADONCI FESTIVAL DISK.2'
WHERE o.email = 'demo.scrape-41@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 880000, 500, 93
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - BANJAR PATROMAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-7@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN', 'Music', 'Gelora Banjar Patroman, Kota Banjar', '2026-10-16 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JHRDAQBO0B.png', 'Radio Show TV One Reborn 2026 Saatnya bersiap untuk menikmati malam penuh hiburan di Radio Show TV One Reborn 2026 ! Hadir kembali dengan konsep yang lebih meriah, acara ini akan menghadirkan deretan musisi pilihan yang siap memberikan penampilan terbaik dan menciptakan pengalaman konser yang tak terlupakan. Saksikan penampilan spesial dari NDX , serta musisi lainnya yang akan segera diumumkan. Nikmati perpaduan musik rock, pop, dan berbagai genre favorit yang akan membuat suasana semakin meriah dan penuh semangat. Ajak teman, keluarga, dan komunitasmu untuk bernyanyi bersama, menikmati setiap penampilan, serta menjadi bagian dari kemeriahan salah satu festival musik yang paling dinantikan di Banjar Patroman. Detail Acara 📅 Tanggal: Jumat, 16 Oktober 2026 📍 Lokasi: Gelora Banjar Patroman 🎤 Lineup: NDX dan masih banyak penampil lainnya yang akan segera diumumkan. 🎟️ Tiket: Tersedia secara eksklusif melalui Artatix . Jangan lewatkan kesempatan untuk merasakan keseruan Radio Show TV One Reborn 2026. Amankan tiketmu sekarang dan bersiaplah menikmati malam penuh musik, energi, dan pengalaman yang tak terlupakan! 🎶🔥', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN'
WHERE o.email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN' AND ev.venue = 'Gelora Banjar Patroman, Kota Banjar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 51
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN' AND ev.venue = 'Gelora Banjar Patroman, Kota Banjar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-42@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-42@wavy.seed' AND a.name = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR', 'Music', 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta', '2026-10-17 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LVUXX93YQ4.png', '🎸 BUZZ BATTLE OF BANDS, HIGHSCHOOL FEST x FESTIVAL JAJANAN PASAR 🎸 Satu festival, dua keseruan! 🔥 Nikmati kemeriahan kompetisi band pelajar SMA yang menghadirkan aksi panggung penuh energi, sekaligus jelajahi berbagai jajanan pasar khas Nusantara dalam suasana festival yang seru dan meriah. 🔥 SPECIAL GUEST STAR: MCPR • NISKALA • THE GLOW Dukung talenta-talenta muda, nikmati penampilan guest star, dan puas kulineran bersama teman dan keluarga. 📅 17 Oktober 2026 📍 Taman Balekambang Surakarta 🎶 Music. Food. Competition. Fun. All in One Festival! Jangan cuma dengar ceritanya—datang dan rasakan sendiri keseruannya! ✨', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR'
WHERE o.email = 'demo.scrape-42@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR' AND ev.venue = 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 166
FROM events ev WHERE ev.title = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR' AND ev.venue = 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- AREA FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'AREA FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-43@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-43@wavy.seed' AND a.name = 'AREA FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'AREA FEST 2026', 'Music', 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh', '2026-10-17 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2LIKGSWOOQ.jpg', 'AREA FEST 2026 hadir sebagai festival musik dan kreativitas terbesar di Aceh. Rasakan kemeriahan konser musisi nasional, bazar UMKM, kuliner, dan berbagai pengalaman seru pada 17–18 Oktober 2026 di Taman Budaya Banda Aceh. Jangan lewatkan momen terbaik tahun ini, Amankan tiketmu sekarang dan jadilah bagian dari pengalaman yang tak terlupakan!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'AREA FEST 2026'
WHERE o.email = 'demo.scrape-43@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'AREA FEST 2026' AND ev.venue = 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 235000, 500, 79
FROM events ev WHERE ev.title = 'AREA FEST 2026' AND ev.venue = 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BANGKO FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BANGKO FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-44@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-44@wavy.seed' AND a.name = 'BANGKO FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BANGKO FEST', 'Music', 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi', '2026-10-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J0IDX0FF4I.png', 'BANGKO FEST Saatnya lepas penat bareng dalam satu malam penuh musik, energi, dan keseruan! 🎶🔥 BANGKO FEST hadir kembali dengan deretan performer spesial yang siap bikin suasana semakin pecah. Nikmati penampilan dari NDX AKA 📅 Selasa, 20 Oktober 2026 📍 Sirkuit Alboretum Rio Alip Bangko, Jambi Siapkan energi terbaikmu, ajak teman-temanmu, dan jangan lewatkan salah satu event musik paling seru di Jambi tahun ini. Ticket Category EARLY BIRD 🎟️ Festival - Rp75.000 🎟️ VIP - Rp125.000 Lepas penatnya, nikmati musiknya, bawa pulang momennya. YUK BANGKO FEST MELUNCUR!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BANGKO FEST'
WHERE o.email = 'demo.scrape-44@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BANGKO FEST' AND ev.venue = 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 172
FROM events ev WHERE ev.title = 'BANGKO FEST' AND ev.venue = 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ROSETOPIA ASIA TOUR 2026 IN JAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-45@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-45@wavy.seed' AND a.name = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', 'The Kasablanka, Jakarta Selatan', '2026-10-23 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260713100423_6a5455b7de053.jpeg', 'Black&nbsp;Rose, be ready to be part of The Rose&#39;s long-awaited return to Jakarta and experience an unforgettable evening on the ROSETAPIA Tour to celebrate an evening of heartfelt music, unforgettable performances, and lasting memories.&nbsp;&nbsp;&nbsp; Following the overwhelming response to their&nbsp;previous&nbsp;performances, South Korean indie rock band The Rose (더로즈) is set to make their return to Jakarta with their ROSETOPIA World Tour on 23 October 2026 at The&nbsp;Kasablanka.&nbsp; Over the years, the band has&nbsp;established&nbsp;itself as one of Korea&#39;s most acclaimed rock acts, earning international recognition for its distinctive sound, achieving commercial success with&nbsp;numerous&nbsp;releases, and building a dedicated global fanbase through award-winning music and captivating live performances.&nbsp;&nbsp; ROSETOPIA&nbsp;represents&nbsp;&quot;where past and present coexist, where every song, every memory, and every moment&nbsp;comes&nbsp;full circle.&quot; It serves as a deeply meaningful milestone for both the band and their fans, Black Rose. ROSETOPIA has been described by the band as a celebration, and a shared dream before they pursue individual growth and projects as&nbsp;chance&nbsp;to pause, recharge, and eventually return stronger.&nbsp;&nbsp;&nbsp; For the latest updates and ticket information, follow @ckstar.id on Instagram. &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA'
WHERE o.email = 'demo.scrape-45@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'The Kasablanka, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 1450000, 500, 5
FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'The Kasablanka, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 'Terror Machine'  25th North Ndapur Celebration
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '''Terror Machine''  25th North Ndapur Celebration', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = '''Terror Machine''  25th North Ndapur Celebration');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '''Terror Machine''  25th North Ndapur Celebration', 'Music', 'Sport Center Lamongan, Kab. Lamongan', '2026-10-24 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/YJSVK0EEM9.jpg', '“𝗧𝗘𝗥𝗥𝗢𝗥 𝗠𝗔𝗖𝗛𝗜𝗡𝗘” 𝟮𝟱𝗧𝗛 𝗡𝗼𝗿𝘁𝗵 𝗡𝗱𝗮𝗽𝘂𝗿 𝗖𝗲𝗹𝗲𝗯𝗿𝗮𝘁𝗶𝗼𝗻 Tahun ini Selebrasi Perayaan Event North Ndapur memasuki babak event ketiga, Mengingat Refleksi Perjalanan North Ndapur yang sudah memasuki Usia ke 25 Tahun. Dengan bangga mempersembahkan tema “Terror Machine”. Tema Tersebut terinspirasi dari Identitas / Slogan Distrik North Ndapur yaitu “Terror Machine”, Bila di Terjemahkan ke dalam Bahasa Indonesia bermakna “Mesin Terror”. Menggambarkan Semangat Perjuangan saat mendukung dan mengawal Tim Kebanggaan Persela Lamongan dimanapun Berlaga. Event ini akan menjadi salah 1 yang terbesar dari beberapa event North Ndapur sebelumnya.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '''Terror Machine''  25th North Ndapur Celebration'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '''Terror Machine''  25th North Ndapur Celebration' AND ev.venue = 'Sport Center Lamongan, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 198
FROM events ev WHERE ev.title = '''Terror Machine''  25th North Ndapur Celebration' AND ev.venue = 'Sport Center Lamongan, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spectaphoria Vol. 3  "Synchronicity"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spectaphoria Vol. 3  "Synchronicity"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-47@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-47@wavy.seed' AND a.name = 'Spectaphoria Vol. 3  "Synchronicity"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spectaphoria Vol. 3  "Synchronicity"', 'Music', 'Pantai Tanjungpendam, Kab. Belitung', '2026-10-24 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AHJEQ9BT0N.png', 'Spectaphoria Vol. 3: Synchronicity #SyncUpAndCelebrate Belitung, are you ready to vibe? &nbsp; Spectaphoria Vol. 3 balik lagi buat ngajak kalian masuk ke semesta&nbsp; "Synchronicity" . Ini bukan cuma soal konser musik biasa, tapi tempat di mana&nbsp; good music &nbsp;ketemu sama energi kalian dalam satu frekuensi yang pecah banget! Kita bakal seru-seruan bareng di&nbsp; Pantai Tanjungpendam &nbsp;pada&nbsp; 24-25 Oktober 2026 . Kenapa lo nggak boleh absen? Siapin diri buat&nbsp; sing along bareng artis-artis favorit nasional! Panggung megah dengan visual yang&nbsp; high-quality &nbsp;banget. Cocok buat lo yang haus konten&nbsp; aesthetic &nbsp;buat&nbsp; post &nbsp;di sosmed. Nonton festival di pinggir pantai sambil nungguin sunset Belitung yang legendaris?&nbsp; Say no more! Kapasitas kita batasi per hari biar lo bisa joget lebih bebas tanpa perlu desek-desekan parah. Jangan sampai kehabisan&nbsp;Early Bird-nya karena kuota terbatas! Jangan cuma jadi penonton di layar HP, mending langsung gas ke lokasi dan jadi bagian dari sejarah musik di Belitung. See you at the pit! &nbsp;👋🔥', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spectaphoria Vol. 3  "Synchronicity"'
WHERE o.email = 'demo.scrape-47@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spectaphoria Vol. 3  "Synchronicity"' AND ev.venue = 'Pantai Tanjungpendam, Kab. Belitung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 71
FROM events ev WHERE ev.title = 'Spectaphoria Vol. 3  "Synchronicity"' AND ev.venue = 'Pantai Tanjungpendam, Kab. Belitung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In Inertia Showcase - Unfamiliar Weather
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-48@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-48@wavy.seed' AND a.name = 'In Inertia Showcase - Unfamiliar Weather');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260731175446_6a6c7ef65fe70.jpg', 'Unfamiliar Weather Showcase adalah pertunjukan spesial dari In Inertia untuk merayakan album kedua mereka, Unfamiliar Weather. Pertunjukan akan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak. In Inertia akan membawakan rangkaian lagu dari album Unfamiliar Weather dalam sebuah format pertunjukan yang memadukan musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik. Setiap elemen dirancang sebagai satu kesatuan untuk membawa penonton memasuki perjalanan emosional yang menjadi tema utama album ini, mulai dari perubahan, kehilangan, penerimaan, hingga usaha menemukan rasa nyaman di tengah situasi yang terasa asing. Penonton akan diajak menikmati pertunjukan dari awal hingga akhir sebagai satu rangkaian cerita yang terbagi ke dalam dua babak. Durasi pertunjukan: ±120 menit Penampil: In Inertia Format pertunjukan: 2 babak Pengalaman: Musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase - Unfamiliar Weather'
WHERE o.email = 'demo.scrape-48@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 234
FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kumpulan Dikir No Good Live Di Odeon KL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kumpulan Dikir No Good Live Di Odeon KL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-49@wavy.seed' AND a.name = 'Kumpulan Dikir No Good Live Di Odeon KL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kumpulan Dikir No Good Live Di Odeon KL', 'Music', 'Odeon KL, Kuala Lumpur', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804144553_6a7198b17f1bb.jpeg', 'Kumpulan Dikir No Good, sebuah konsep gabungan irama punk rock dan ritma dikir barat bakal dipersembahkan secara kemas kemin dan tiada gogek langsung khas buat para peminat muzik tempatan pada 24 Oktober 2026. No Good bakal memainkan lagu-lagu mereka seperti D’Kolupo, Che Using, Suay, Wak Nyaknyo dan banyak lagi, diiringi pemain-pemain dikir barat paling memegang di Lembah Klang - diketuai oleh artis dikir rap Tok Ngulu Machey. Perusahaan Mai Dee dengan sokongan KHATAM, Kopi Saigon dan UV Kool ingin menjemput adik kakak abang cikgu untuk sertai kami sempena acara yang istimewo sekali, di panggung Odeon - meraikan tema “DIKIR NOT DEAD!” Anda bakal dihiburkan oleh persembahan tradisional hampir pupus dari Perlis, Awang Batil yang akan membuka panggung malam nanti dan ditutup dengan Dikir Barat Battle, yang menawarkan hadiah tunai buat juara tukang jogho. Ejas kain lepas, ejah jaket kulit. #DIKIRNOTDEAD #nogood #nogoodisdead #PerusahaanMaiDee #KumpulanDikirNoGood', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kumpulan Dikir No Good Live Di Odeon KL'
WHERE o.email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kumpulan Dikir No Good Live Di Odeon KL' AND ev.venue = 'Odeon KL, Kuala Lumpur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 172, 500, 229
FROM events ev WHERE ev.title = 'Kumpulan Dikir No Good Live Di Odeon KL' AND ev.venue = 'Odeon KL, Kuala Lumpur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Titik Sadrah for Revenge
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Titik Sadrah for Revenge', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-50@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-50@wavy.seed' AND a.name = 'Titik Sadrah for Revenge');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Titik Sadrah for Revenge', 'Music', 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260710180442_6a50d1ca9d9bd.jpeg', 'Menginjak dua dekade,&nbsp; Titik Sadrah hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi&nbsp; for Revenge , melainkan ruang sakral yang merangkum gelombang emosi band,&nbsp; Archims Pribadi (Chimot)&nbsp; secara personal, dan&nbsp; for Revenge Family . Sebuah memoar bersama untuk berhenti memaksakan apa yang telah karam dan mulai berdamai dengan kenyataan yang mematahkan arah. Kita semua pernah tersapu arus emosi liar hingga tenggelam di palung terendah. Bagi&nbsp; Chimot , palung itu adalah penerimaan pahit bahwa di tahun ke-20 ini ia tidak bisa lagi berdiri di balik set drumnya. Bagi&nbsp; for Revenge , ini adalah patah hati terdalam karena kehilangan detak jantung keseharian mereka. Sementara bagi&nbsp; for Revenge Family , ini adalah fase transisi berat untuk menerima keadaan dan formasi yang baru. Namun, kita disadarkan bahwa di setiap arus deras, selalu ada muara yang menanti. Di titik ini kita belajar bahwa tidak semua hal harus dipaksa untuk tetap tinggal, karena beberapa hal justru baru menemukan makna sejatinya saat kita memilih ikhlas melepaskan. Di muara inilah kita bertemu untuk saling menguatkan. Mari rayakan ruang penerimaan ini di Titik Sadrah Bandung, Eldorado Sport &amp; Convention Hall&nbsp; pada 31 Oktober September 2026 , dan Titik Sadrah&nbsp; Kuala Lumpur . Datanglah untuk melarung segala yang menyesakkan, biarkan semuanya usai di titik ini, dan pulanglah membawa awal yang baru.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Titik Sadrah for Revenge'
WHERE o.email = 'demo.scrape-50@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 400000, 500, 160
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Remember Fest 2026 X Cube Concert
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Remember Fest 2026 X Cube Concert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'Remember Fest 2026 X Cube Concert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Remember Fest 2026 X Cube Concert', 'Music', 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara', '2026-11-07 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9W4TPWAMQQ.jpg', 'Remember Fest x Cube Concert adalah festival musik dan hiburan tahunan&nbsp;yang menghadirkan pengalaman nostalgia dalam balutan konsep kreatif dan modern. Mengusung tema "In Cinema" pada tahun 2026, Remember Fest x Cube&nbsp;Concert menggabungkan konser musik dari musisi papan atas Indonesia,&nbsp;aktivitas komunitas, area kuliner, hiburan keluarga, hingga pengalaman&nbsp;budaya seperti layar tancap, sehingga menciptakan momen yang berkesan. bagi pengunjung dari berbagai kalangan selama dua hari penyelenggaraan&nbsp;di Open Space dan Gambir Expo Kemayoran, Jakarta.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Remember Fest 2026 X Cube Concert'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Remember Fest 2026 X Cube Concert' AND ev.venue = 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 233
FROM events ev WHERE ev.title = 'Remember Fest 2026 X Cube Concert' AND ev.venue = 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PGR Vol. 11 @Jakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PGR Vol. 11 @Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-52@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-52@wavy.seed' AND a.name = 'PGR Vol. 11 @Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PGR Vol. 11 @Jakarta', 'Music', 'JIExpo Kemayoran, Jakarta Pusat', '2026-11-07 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260525145212_6a13ffac08f80.jpeg', 'PGR Vol. 11 @Jakarta', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR Vol. 11 @Jakarta'
WHERE o.email = 'demo.scrape-52@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 116
FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Resonance - A Soundagia Series - Lampung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Resonance - A Soundagia Series - Lampung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-53@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-53@wavy.seed' AND a.name = 'Resonance - A Soundagia Series - Lampung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Resonance - A Soundagia Series - Lampung', 'Music', 'Stadion Tejosari, Kota Metro', '2026-11-08 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TP29Q47OQ6.jpg', 'Resonance - A Soundagia Series - Lampung adalah Official pre-series dari Soundagia yang menghadirkan konser musik berskala Mid-High dengan pengalaman festival modern &amp; dengan tema yang berbeda beda setiap seriesnya , dan sebagai tahap awal menuju Soundagia 2027 dan Soundagia berikutnya ditahun yang berbeda .', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Resonance - A Soundagia Series - Lampung'
WHERE o.email = 'demo.scrape-53@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Resonance - A Soundagia Series - Lampung' AND ev.venue = 'Stadion Tejosari, Kota Metro');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 9
FROM events ev WHERE ev.title = 'Resonance - A Soundagia Series - Lampung' AND ev.venue = 'Stadion Tejosari, Kota Metro'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Men I Trust Asia Tour 2026: Live In Jakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-54@wavy.seed' AND a.name = 'Men I Trust Asia Tour 2026: Live In Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', 'Tennis Indoor Senayan, Jakarta Pusat', '2026-11-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260517111454_6a0940bed96d2.jpeg', 'After a completely sold out show in 2023, Men I Trust is finally returning to Jakarta for the Asia Tour 2026. Bringing along their newest album and signature dreamy sound, the beloved indie trio will take over Tennis Indoor Senayan on 12 November 2026 for a night of hypnotic melodies, intimate moments, and nostalgic energy. Known for their atmospheric performances and fan-favorite tracks that have soundtracked listeners around the world, Men I Trust&rsquo;s return promises an even more special experience for Jakarta fans. Expect a set filled with both new songs and timeless favorites, wrapped in the band&rsquo;s warm and immersive live atmosphere.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Men I Trust Asia Tour 2026: Live In Jakarta'
WHERE o.email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Tennis Indoor Senayan, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 618000, 500, 132
FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Tennis Indoor Senayan, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NoiseVentura
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NoiseVentura', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-55@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-55@wavy.seed' AND a.name = 'NoiseVentura');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NoiseVentura', 'Music', 'Jogja Expo Center, Kab. Bantul', '2026-11-14 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/99DFZ4S5CB.jpg', 'NoiseVentura: Mana Tahan 6.0 merupakan konser musik yang diselenggarakan oleh Komunitas Musik Mahasiswa (SIKMA FTI Universitas Atma Jaya Yogyakarta). Mengusung tema "Make Some Noise", NoiseVentura hadir sebagai ruang bagi mahasiswa, musisi, dan masyarakat umum untuk merayakan musik melalui energi, kreativitas, serta kebersamaan. Tahun ini, NoiseVentura akan diselenggarakan pada Sabtu, 14 November 2026, di Jogja Expo Center, Daerah Istimewa Yogyakarta. Nantikan penampilan musisi pilihan dan rasakan pengalaman konser yang penuh energi hanya di NoiseVentura: Mana Tahan 6.0.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NoiseVentura'
WHERE o.email = 'demo.scrape-55@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NoiseVentura' AND ev.venue = 'Jogja Expo Center, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 42500, 500, 5
FROM events ev WHERE ev.title = 'NoiseVentura' AND ev.venue = 'Jogja Expo Center, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HIGH SCHOOL FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HIGH SCHOOL FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-56@wavy.seed' AND a.name = 'HIGH SCHOOL FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HIGH SCHOOL FEST 2026', 'Music', 'Stadiun Madya B, GBK, Jakarta Selatan', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821130357_6a87ea4d14a1a.jpg', 'School is back, but make it a festival!🎒 High School Fest is The Biggest School Themed Festival Ever! So, saatnya seru-seruan menikmati musik, main bareng, dan ngerasain kembali vibes sekolah dengan line up yang ga kalah asik dari tahun sebelumnya!! 28–29 November 2026, Stadion Madya GBK, Jakarta. DON’T MISS IT!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIGH SCHOOL FEST 2026'
WHERE o.email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 98
FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Joyland Sessions 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Joyland Sessions 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-54@wavy.seed' AND a.name = 'Joyland Sessions 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Joyland Sessions 2026', 'Music', 'GBK, Senayan Jakarta, Jakarta Pusat', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260624065902_6a3b1dc6b0a9f.jpeg', 'Joyland Sessions returns in 2026 with another carefully curated weekend of music, culture, and immersive experiences. Expect a genre-spanning lineup, special moments, and the signature Joyland atmosphere &mdash; all coming together for two unforgettable days in Jakarta.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Joyland Sessions 2026'
WHERE o.email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'GBK, Senayan Jakarta, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 5740000, 500, 152
FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'GBK, Senayan Jakarta, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DINAMIT FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DINAMIT FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-57@wavy.seed' AND a.name = 'DINAMIT FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DINAMIT FEST 2026', 'Music', 'Stadion Kridosono, Kota Yogyakarta', '2026-12-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/911POGP29I.png', 'DINAMIT Fest merupakan acara penutup dari seluruh rangkaian kegiatan DINAMIT yang dikemas dalam bentuk konser. Kegiatan ini diselenggarakan sebagai puncak acara sekaligus bentuk apresiasi kepada seluruh peserta, panitia, dan pihak yang telah berpartisipasi dalam setiap rangkaian kegiatan. DINAMIT Fest menghadirkan penampilan hiburan dari bintang tamu dan musisi yang bertujuan menciptakan suasana yang meriah dan penuh antusiasme. Selain sebagai sarana hiburan, kegiatan ini juga menjadi wadah untuk mempererat kebersamaan, meningkatkan solidaritas, serta meninggalkan kesan positif bagi seluruh peserta sebagai penutup dari rangkaian kegiatan DINAMIT.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DINAMIT FEST 2026'
WHERE o.email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DINAMIT FEST 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 191
FROM events ev WHERE ev.title = 'DINAMIT FEST 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

COMMIT;