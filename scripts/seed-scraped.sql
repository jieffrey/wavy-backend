-- Seed data: scraped concerts (artatix.co.id + loket.com), cleaned, posters hosted on Cloudinary
-- Safe to re-run: organizers keyed by email (ON CONFLICT DO NOTHING)

TRUNCATE TABLE
  waiting_list,
  waiting_room,
  notify_requests,
  notifications,
  favorite_artists,
  favorite_organizers,
  reviews,
  tickets,
  orders,
  ticket_categories,
  events,
  artists,
  otp_codes,
  customers,
  organizers,
  admins
CASCADE;

BEGIN;

-- Organizer: PK Entertainment
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PK Entertainment', 'demo.pk-entertainment@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pk-entertainment@wavy.seed' AND a.name='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA', 'Music', 'Jakarta Utara', '2026-07-13'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788524685/wavy/concerts/enhypen-world-tour-blood-saga-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA'
WHERE o.email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND e.venue='Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1450000, 200, 19
FROM events e WHERE e.title='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Three Mountains Ave
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Three Mountains Ave', 'demo.three-mountains-ave@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'T.O.P PRE-STUDIO 2026 in Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.three-mountains-ave@wavy.seed' AND a.name='T.O.P PRE-STUDIO 2026 in Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'T.O.P PRE-STUDIO 2026 in Jakarta', 'Music', 'Jakarta Pusat', '2026-08-14'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788524689/wavy/concerts/t-o-p-pre-studio-2026-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'T.O.P PRE-STUDIO 2026 in Jakarta'
WHERE o.email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='T.O.P PRE-STUDIO 2026 in Jakarta' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 2100000, 300, 166
FROM events e WHERE e.title='T.O.P PRE-STUDIO 2026 in Jakarta' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.three-mountains-ave@wavy.seed' AND a.name='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA', 'Music', 'Jakarta Pusat', '2026-08-27'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577129/wavy/concerts/2026-hwang-in-youp-fanmeeting-tour-to-you-in-jakar.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA'
WHERE o.email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1900000, 100, 4
FROM events e WHERE e.title='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Saint Johns Catholic School
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Saint Johns Catholic School', 'demo.saint-johns-catholic-school@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SYNC 2026 ''Luminaria''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.saint-johns-catholic-school@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.saint-johns-catholic-school@wavy.seed' AND a.name='SYNC 2026 ''Luminaria''');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SYNC 2026 ''Luminaria''', 'Music', 'TBA', '2026-09-12'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577057/wavy/concerts/sync-2026-luminaria.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SYNC 2026 ''Luminaria'''
WHERE o.email = 'demo.saint-johns-catholic-school@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SYNC 2026 ''Luminaria''' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 500, 48
FROM events e WHERE e.title='SYNC 2026 ''Luminaria''' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: MLDSPOT Fresh Concert On Wheels
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MLDSPOT Fresh Concert On Wheels', 'demo.mldspot-fresh-concert-on-wheels@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.mldspot-fresh-concert-on-wheels@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.mldspot-fresh-concert-on-wheels@wavy.seed' AND a.name='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta', 'Music', 'TBA', '2026-09-12'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577025/wavy/concerts/mldspot-fresh-concert-on-wheels-2026-yogyakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta'
WHERE o.email = 'demo.mldspot-fresh-concert-on-wheels@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 200, 74
FROM events e WHERE e.title='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: ARTEFAC UNS
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ARTEFAC UNS', 'demo.artefac-uns@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ARTERUN x Gendut Berlari - Pace of Joy', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.artefac-uns@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.artefac-uns@wavy.seed' AND a.name='ARTERUN x Gendut Berlari - Pace of Joy');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ARTERUN x Gendut Berlari - Pace of Joy', 'Music', 'TBA', '2026-09-12'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577029/wavy/concerts/arterun-x-gendut-berlari-pace-of-joy.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ARTERUN x Gendut Berlari - Pace of Joy'
WHERE o.email = 'demo.artefac-uns@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ARTERUN x Gendut Berlari - Pace of Joy' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 135000, 100, 58
FROM events e WHERE e.title='ARTERUN x Gendut Berlari - Pace of Joy' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Plainsong Live
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Plainsong Live', 'demo.plainsong-live@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.plainsong-live@wavy.seed' AND a.name='Men I Trust Asia Tour 2026: Live In Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', 'Jakarta Pusat', '2026-09-18'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577064/wavy/concerts/men-i-trust-asia-tour-2026-live-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Men I Trust Asia Tour 2026: Live In Jakarta'
WHERE o.email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Men I Trust Asia Tour 2026: Live In Jakarta' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 518000, 500, 109
FROM events e WHERE e.title='Men I Trust Asia Tour 2026: Live In Jakarta' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: IDEAFEST
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('IDEAFEST', 'demo.ideafest@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'IdeaFest 2026', 'Conference', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ideafest@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ideafest@wavy.seed' AND a.name='IdeaFest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'IdeaFest 2026', 'Conference', 'Jakarta Pusat', '2026-09-18'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577125/wavy/concerts/ideafest-2026.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'IdeaFest 2026'
WHERE o.email = 'demo.ideafest@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='IdeaFest 2026' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1400000, 100, 5
FROM events e WHERE e.title='IdeaFest 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Dynamic Duos
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dynamic Duos', 'demo.dynamic-duos@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MELANKOLIA DI MEDAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.dynamic-duos@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.dynamic-duos@wavy.seed' AND a.name='MELANKOLIA DI MEDAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MELANKOLIA DI MEDAN', 'Music', 'TBA', '2026-09-19'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577043/wavy/concerts/melankolia-di-medan.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MELANKOLIA DI MEDAN'
WHERE o.email = 'demo.dynamic-duos@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='MELANKOLIA DI MEDAN' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 50000, 300, 107
FROM events e WHERE e.title='MELANKOLIA DI MEDAN' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: CK Star Entertainment
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CK Star Entertainment', 'demo.ck-star-entertainment@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ck-star-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ck-star-entertainment@wavy.seed' AND a.name='ROSETOPIA ASIA TOUR 2026 IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', 'Jakarta Selatan', '2026-09-19'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577122/wavy/concerts/rosetopia-asia-tour-2026-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA'
WHERE o.email = 'demo.ck-star-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND e.venue='Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1450000, 100, 15
FROM events e WHERE e.title='ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Moonverse Festival
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Moonverse Festival', 'demo.moonverse-festival@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonverse Festival Vol  7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.moonverse-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.moonverse-festival@wavy.seed' AND a.name='Moonverse Festival Vol  7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonverse Festival Vol  7', 'Music', 'TBA', '2026-09-19'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577039/wavy/concerts/moonverse-festival-vol-7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Moonverse Festival Vol  7'
WHERE o.email = 'demo.moonverse-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Moonverse Festival Vol  7' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 110000, 100, 35
FROM events e WHERE e.title='Moonverse Festival Vol  7' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: ayofest.id
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ayofest.id', 'demo.ayofest-id@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ayo Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ayofest-id@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ayofest-id@wavy.seed' AND a.name='Ayo Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ayo Fest 2026', 'Music', 'TBA', '2026-09-20'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577061/wavy/concerts/ayo-fest-2026.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ayo Fest 2026'
WHERE o.email = 'demo.ayofest-id@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Ayo Fest 2026' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 125000, 300, 15
FROM events e WHERE e.title='Ayo Fest 2026' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Raw Vision Collective
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Raw Vision Collective', 'demo.raw-vision-collective@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YE JAKARTA 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.raw-vision-collective@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.raw-vision-collective@wavy.seed' AND a.name='YE JAKARTA 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YE JAKARTA 2026', 'Music', 'Jakarta Pusat', '2026-09-26'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577132/wavy/concerts/ye-jakarta-2026.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'YE JAKARTA 2026'
WHERE o.email = 'demo.raw-vision-collective@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='YE JAKARTA 2026' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1875000, 500, 63
FROM events e WHERE e.title='YE JAKARTA 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Morinaga Early Life Nutrition
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Morinaga Early Life Nutrition', 'demo.morinaga-early-life-nutrition@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Next Gen(re) Parenting - Semarang', 'Workshop', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.morinaga-early-life-nutrition@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.morinaga-early-life-nutrition@wavy.seed' AND a.name='Next Gen(re) Parenting - Semarang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Next Gen(re) Parenting - Semarang', 'Workshop', 'Kota Semarang', '2026-09-26'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577110/wavy/concerts/next-gen-re-parenting-semarang.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Next Gen(re) Parenting - Semarang'
WHERE o.email = 'demo.morinaga-early-life-nutrition@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Next Gen(re) Parenting - Semarang' AND e.venue='Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 120000, 150, 80
FROM events e WHERE e.title='Next Gen(re) Parenting - Semarang' AND e.venue='Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: RdC Jambi
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RdC Jambi', 'demo.rdc-jambi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Jambi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.rdc-jambi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.rdc-jambi@wavy.seed' AND a.name='Riang dan Ceria Jambi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Jambi', 'Music', 'TBA', '2026-09-27'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577046/wavy/concerts/riang-dan-ceria-jambi.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Jambi'
WHERE o.email = 'demo.rdc-jambi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Riang dan Ceria Jambi' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 105000, 500, 31
FROM events e WHERE e.title='Riang dan Ceria Jambi' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Remember Musik Festival
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Remember Musik Festival', 'demo.remember-musik-festival@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Remember Fest 2026 X Cube Concert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.remember-musik-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.remember-musik-festival@wavy.seed' AND a.name='Remember Fest 2026 X Cube Concert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Remember Fest 2026 X Cube Concert', 'Music', 'TBA', '2026-09-29'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577053/wavy/concerts/remember-fest-2026-x-cube-concert.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Remember Fest 2026 X Cube Concert'
WHERE o.email = 'demo.remember-musik-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Remember Fest 2026 X Cube Concert' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 135000, 300, 12
FROM events e WHERE e.title='Remember Fest 2026 X Cube Concert' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Social Padel House, Setiabudi
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Social Padel House, Setiabudi', 'demo.social-padel-house-setiabudi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPH Superstar Series : Tolito Aguirre', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.social-padel-house-setiabudi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.social-padel-house-setiabudi@wavy.seed' AND a.name='SPH Superstar Series : Tolito Aguirre');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPH Superstar Series : Tolito Aguirre', 'Music', 'Jakarta Selatan', '2026-10-02'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577086/wavy/concerts/sph-superstar-series-tolito-aguirre.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPH Superstar Series : Tolito Aguirre'
WHERE o.email = 'demo.social-padel-house-setiabudi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SPH Superstar Series : Tolito Aguirre' AND e.venue='Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 375000, 150, 5
FROM events e WHERE e.title='SPH Superstar Series : Tolito Aguirre' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: NAWA DAYA CREATIVE HUB
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NAWA DAYA CREATIVE HUB', 'demo.nawa-daya-creative-hub@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SEMESTAMBYAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.nawa-daya-creative-hub@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.nawa-daya-creative-hub@wavy.seed' AND a.name='SEMESTAMBYAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SEMESTAMBYAR', 'Music', 'TBA', '2026-10-03'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577049/wavy/concerts/semestambyar.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SEMESTAMBYAR'
WHERE o.email = 'demo.nawa-daya-creative-hub@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SEMESTAMBYAR' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 500, 68
FROM events e WHERE e.title='SEMESTAMBYAR' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pk-entertainment@wavy.seed' AND a.name='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA', 'Music', 'Jakarta Utara', '2026-10-12'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577135/wavy/concerts/bigbang-2026-2027-world-tour-xx-cosmos-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA'
WHERE o.email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND e.venue='Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1550000, 200, 53
FROM events e WHERE e.title='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: BARCODE GOKART
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BARCODE GOKART', 'demo.barcode-gokart@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BARCODE GOKART', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.barcode-gokart@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.barcode-gokart@wavy.seed' AND a.name='BARCODE GOKART');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BARCODE GOKART', 'Music', 'Jakarta Utara', '2026-10-13'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577082/wavy/concerts/barcode-gokart.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BARCODE GOKART'
WHERE o.email = 'demo.barcode-gokart@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='BARCODE GOKART' AND e.venue='Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 60000, 150, 69
FROM events e WHERE e.title='BARCODE GOKART' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: PT Oppal Musik Indonesia
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Oppal Musik Indonesia', 'demo.pt-oppal-musik-indonesia@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Snada Indonesia 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pt-oppal-musik-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pt-oppal-musik-indonesia@wavy.seed' AND a.name='Snada Indonesia 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Snada Indonesia 2026', 'Music', 'Jakarta Pusat', '2026-10-16'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577079/wavy/concerts/snada-indonesia-2026.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Snada Indonesia 2026'
WHERE o.email = 'demo.pt-oppal-musik-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Snada Indonesia 2026' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 675000, 100, 36
FROM events e WHERE e.title='Snada Indonesia 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Joyland Sessions 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.plainsong-live@wavy.seed' AND a.name='Joyland Sessions 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Joyland Sessions 2026', 'Music', 'Jakarta Pusat', '2026-10-20'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577071/wavy/concerts/joyland-sessions-2026.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Joyland Sessions 2026'
WHERE o.email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Joyland Sessions 2026' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 588000, 200, 71
FROM events e WHERE e.title='Joyland Sessions 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: JAFPRO
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JAFPRO', 'demo.jafpro@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nyanyian Fest Subang 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.jafpro@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.jafpro@wavy.seed' AND a.name='Nyanyian Fest Subang 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nyanyian Fest Subang 2026', 'Music', 'TBA', '2026-10-24'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577036/wavy/concerts/nyanyian-fest-subang-2026.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nyanyian Fest Subang 2026'
WHERE o.email = 'demo.jafpro@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Nyanyian Fest Subang 2026' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 100000, 150, 13
FROM events e WHERE e.title='Nyanyian Fest Subang 2026' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Petrick Kluivert
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Petrick Kluivert', 'demo.petrick-kluivert@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Piano Recital by Petrick Kluivert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.petrick-kluivert@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.petrick-kluivert@wavy.seed' AND a.name='Piano Recital by Petrick Kluivert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Piano Recital by Petrick Kluivert', 'Music', 'Jakarta Selatan', '2026-11-08'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577119/wavy/concerts/piano-recital-by-petrick-kluivert.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Piano Recital by Petrick Kluivert'
WHERE o.email = 'demo.petrick-kluivert@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Piano Recital by Petrick Kluivert' AND e.venue='Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 300000, 500, 292
FROM events e WHERE e.title='Piano Recital by Petrick Kluivert' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: The 49th Jazz Goes to Campus
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The 49th Jazz Goes to Campus', 'demo.the-49th-jazz-goes-to-campus@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The 49th Jazz Goes to Campus', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.the-49th-jazz-goes-to-campus@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.the-49th-jazz-goes-to-campus@wavy.seed' AND a.name='The 49th Jazz Goes to Campus');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The 49th Jazz Goes to Campus', 'Music', 'Kota Depok', '2026-11-23'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577106/wavy/concerts/the-49th-jazz-goes-to-campus.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The 49th Jazz Goes to Campus'
WHERE o.email = 'demo.the-49th-jazz-goes-to-campus@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='The 49th Jazz Goes to Campus' AND e.venue='Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 175000, 150, 47
FROM events e WHERE e.title='The 49th Jazz Goes to Campus' AND e.venue='Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Flabbergast Productions
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Flabbergast Productions', 'demo.flabbergast-productions@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tiffany Young: Edge of Calm Tour in Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.flabbergast-productions@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.flabbergast-productions@wavy.seed' AND a.name='Tiffany Young: Edge of Calm Tour in Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tiffany Young: Edge of Calm Tour in Jakarta', 'Music', 'Jakarta Pusat', '2026-11-29'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577114/wavy/concerts/tiffany-young-edge-of-calm-tour-in-jakarta.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tiffany Young: Edge of Calm Tour in Jakarta'
WHERE o.email = 'demo.flabbergast-productions@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Tiffany Young: Edge of Calm Tour in Jakarta' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 950000, 100, 35
FROM events e WHERE e.title='Tiffany Young: Edge of Calm Tour in Jakarta' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: PT. Roemah Satu Ide
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. Roemah Satu Ide', 'demo.pt-roemah-satu-ide@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FEEL YOUR PAPUA - SORONG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pt-roemah-satu-ide@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pt-roemah-satu-ide@wavy.seed' AND a.name='FEEL YOUR PAPUA - SORONG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FEEL YOUR PAPUA - SORONG', 'Music', 'TBA', '2026-12-05'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577033/wavy/concerts/feel-your-papua-sorong.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FEEL YOUR PAPUA - SORONG'
WHERE o.email = 'demo.pt-roemah-satu-ide@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='FEEL YOUR PAPUA - SORONG' AND e.venue='TBA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 75000, 100, 36
FROM events e WHERE e.title='FEEL YOUR PAPUA - SORONG' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Emerge Consulting
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Emerge Consulting', 'demo.emerge-consulting@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop', 'Workshop', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.emerge-consulting@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.emerge-consulting@wavy.seed' AND a.name='Leading HR and Unlocking Organisational Performance: People & Performance Workshop');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop', 'Workshop', 'Jakarta Pusat', '2026-12-10'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577099/wavy/concerts/leading-hr-and-unlocking-organisational-performanc.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop'
WHERE o.email = 'demo.emerge-consulting@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND e.venue='Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 330000, 100, 39
FROM events e WHERE e.title='Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: GoldLivexComika
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GoldLivexComika', 'demo.goldlivexcomika@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Adili Idola: Celebrity Roast', 'Comedy', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.goldlivexcomika@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.goldlivexcomika@wavy.seed' AND a.name='Adili Idola: Celebrity Roast');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Adili Idola: Celebrity Roast', 'Comedy', 'Jakarta Barat', '2026-12-18'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577068/wavy/concerts/adili-idola-celebrity-roast.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Adili Idola: Celebrity Roast'
WHERE o.email = 'demo.goldlivexcomika@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Adili Idola: Celebrity Roast' AND e.venue='Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 350000, 150, 63
FROM events e WHERE e.title='Adili Idola: Celebrity Roast' AND e.venue='Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: COMIKA EVENT
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('COMIKA EVENT', 'demo.comika-event@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Putbal Comedy Show', 'Comedy', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.comika-event@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.comika-event@wavy.seed' AND a.name='Putbal Comedy Show');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Putbal Comedy Show', 'Comedy', 'DKI Jakarta', '2026-12-18'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577103/wavy/concerts/putbal-comedy-show.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Putbal Comedy Show'
WHERE o.email = 'demo.comika-event@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Putbal Comedy Show' AND e.venue='DKI Jakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 150000, 500, 218
FROM events e WHERE e.title='Putbal Comedy Show' AND e.venue='DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: OFF/SIDE
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OFF/SIDE', 'demo.off-side@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Exclusive Dinner with Park Ji-Sung and Patrice Evra', 'Lifestyle', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.off-side@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.off-side@wavy.seed' AND a.name='Exclusive Dinner with Park Ji-Sung and Patrice Evra');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Exclusive Dinner with Park Ji-Sung and Patrice Evra', 'Lifestyle', 'Jakarta Selatan', '2026-12-18'::timestamptz, 'https://res.cloudinary.com/pbzbhdg3/image/upload/v1788577091/wavy/concerts/exclusive-dinner-with-park-ji-sung-and-patrice-evr.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra'
WHERE o.email = 'demo.off-side@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND e.venue='Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 8500000, 200, 59
FROM events e WHERE e.title='Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- Organizer: Otello Asia dan Color Asia Live
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Otello Asia dan Color Asia Live', 'demo.otello-asia-dan-color-asia-live@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Hillsong Worship Nights Asia Tour Surabaya', 'Music', '', 'Untuk pertama kalinya di Surabaya, Hillsong Worship hadir sebagai bagian dari Asia Tour 2026. Sebuah malam istimewa yang akan menyatukan ribuan hati dalam pujian dan penyembahan me'
FROM organizers o WHERE o.email = 'demo.otello-asia-dan-color-asia-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.otello-asia-dan-color-asia-live@wavy.seed' AND a.name = 'Hillsong Worship Nights Asia Tour Surabaya');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Hillsong Worship Nights Asia Tour Surabaya', 'Music', 'Graha Unesa Surabaya, Kota Surabaya', '2026-09-11 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260626103121_6a3df2891f543.jpeg', 'Untuk pertama kalinya di Surabaya, Hillsong Worship hadir sebagai bagian dari Asia Tour 2026. Sebuah malam istimewa yang akan menyatukan ribuan hati dalam pujian dan penyembahan melalui lagu-lagu yang telah menjadi berkat bagi jutaan orang di seluruh dunia. Nikmati secara langsung lagu-lagu ikonik seperti What A Beautiful Name, Oceans (Where Feet May Fail), Who You Say I Am, Cornerstone, dan King of Kings dalam sebuah pengalaman worship yang penuh sukacita, pengharapan, dan inspirasi. Malam istimewa ini akan menjadi pengalaman yang tak terlupakan bagi ribuan jemaat, keluarga, dan komunitas Kristen yang akan berkumpul bersama dalam satu hati untuk memuji dan menyembah Tuhan.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hillsong Worship Nights Asia Tour Surabaya'
WHERE o.email = 'demo.otello-asia-dan-color-asia-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL (STANDING)', 750000, 1442, 144, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL (STANDING)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP (NUMBERING SEATING)', 1250000, 1949, 194, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP (NUMBERING SEATING)');

-- Organizer: StashedTheJazz
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('StashedTheJazz', 'demo.stashedthejazz@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'StashedTheJazz Reunion', 'Music', '', 'STASHEDTHEJAZZ REUNION ONCE UPON A JAZZ — Vol. 02 Standards from Your Favorite Classic Movies StashedTheJazz returns for an intimate evening of jazz, bringing together timeless sta'
FROM organizers o WHERE o.email = 'demo.stashedthejazz@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.stashedthejazz@wavy.seed' AND a.name = 'StashedTheJazz Reunion');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'StashedTheJazz Reunion', 'Music', 'Sunbreeze Hotel, Jakarta Selatan', '2026-09-11 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260906085347_6a9cc7abc908e.jpg', 'STASHEDTHEJAZZ REUNION ONCE UPON A JAZZ — Vol. 02 Standards from Your Favorite Classic Movies StashedTheJazz returns for an intimate evening of jazz, bringing together timeless standards from beloved classic movies in a sophisticated rooftop setting at SunBreeze Hotel, Senayan Jakarta. A special reunion featuring live performances by a curated lineup of musicians, creating an evening of music, atmosphere, and timeless melodies. THE EXPERIENCE • Live Jazz Tribute Concert • Standards from Your Favorite Classic Movies • Intimate Rooftop Setting • Limited Seating • Curated live music performances • Rp100.000 F&B Voucher included with your ticket EVENT DETAILS Friday, 11 September 2026 Doors Open: 8:00 PM Venue: SunBreeze Hotel, Senayan Jakarta — 7th Floor Event Time: 8:00 PM – 3:00 AM WIB Limited seats available. Come for the music. Stay for the atmosphere. Welcome back to StashedTheJazz.', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-06_edef81ae376c780a7fe26332c7209b82970c8c89da1102d4b73ac080668f06c5.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-06_78ae48d481cb3c89b5fbd0bfb410ac3ee0b4e0230cc6f23b822ed759d2ec6847.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'StashedTheJazz Reunion'
WHERE o.email = 'demo.stashedthejazz@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'StashedTheJazz Reunion' AND ev.venue = 'Sunbreeze Hotel, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Once Upon A Jazz', 330000, 100, 10, 'Event access, seating, and Rp100.000 F&B Voucher. Limited seats available. Valid for 1 person.'
FROM events ev WHERE ev.title = 'StashedTheJazz Reunion' AND ev.venue = 'Sunbreeze Hotel, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Once Upon A Jazz');

-- Organizer: MUSIK ROLAS
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MUSIK ROLAS', 'demo.musik-rolas@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'EDU CONCERT "Our Musical Journey"', 'Music', '', 'Edu Concert 2026 Our Musical Journey Edu Concert: Our Musical Journey merupakan konser tahunan yang diselenggarakan oleh Jurusan Musik SMKN 12 Surabaya sebagai bentuk apresiasi ter'
FROM organizers o WHERE o.email = 'demo.musik-rolas@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.musik-rolas@wavy.seed' AND a.name = 'EDU CONCERT "Our Musical Journey"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'EDU CONCERT "Our Musical Journey"', 'Music', 'Performance Hall UK Petra Surabaya, Kota Surabaya', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804160556_6a71ab74d6f3b.jpg', 'Edu Concert 2026 Our Musical Journey Edu Concert: Our Musical Journey merupakan konser tahunan yang diselenggarakan oleh Jurusan Musik SMKN 12 Surabaya sebagai bentuk apresiasi terhadap proses belajar, dedikasi, dan perkembangan musikal para siswa selama menempuh pendidikan di sekolah. Mengusung tema "Our Musical Journey" , konser ini mengajak penonton menyaksikan perjalanan setiap siswa dalam mengembangkan kemampuan bermusik, mulai dari proses pembelajaran di kelas, latihan yang penuh disiplin, hingga pencapaian yang diwujudkan melalui sebuah pertunjukan di atas panggung. Setiap penampilan menjadi cerminan dari semangat belajar, kerja sama, kreativitas, dan kecintaan terhadap musik yang terus bertumbuh. Bertempat di Performance Hall Universitas Kristen Petra Surabaya , konser ini akan menampilkan siswa kelas XI dan XII Jurusan Musik dengan berbagai mayor, meliputi Piano, Gitar, Gesek, Tiup, dan Vokal . Selain penampilan solo, penonton juga akan disuguhkan berbagai pertunjukan ansambel, seperti Orkestra SMKN 12 Surabaya, Ansambel Gitar, Paduan Suara , serta berbagai kolaborasi musikal yang menggambarkan kekayaan ekspresi dan kemampuan para siswa.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EDU CONCERT "Our Musical Journey"'
WHERE o.email = 'demo.musik-rolas@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pelajar/Mahasiswa', 25000, 100, 10, 'Tiket khusus untuk pelajar dan mahasiswa'
FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Pelajar/Mahasiswa');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tiket UMUM', 35000, 210, 21, 'Dibeli masyarakat umum'
FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Tiket UMUM');

-- Organizer: SARVIVAL
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SARVIVAL', 'demo.sarvival@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'SARVIVAL EVENT', 'Music', '', 'Sekarang persiapkan dirimu untuk SARVIVAL (Sarkoro Voice Festival) Festival ini akan digelar dengan menghadirkan deretan bintang tamu yang luar biasa. Diantaranya: -NADHIF BASALAMA'
FROM organizers o WHERE o.email = 'demo.sarvival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.sarvival@wavy.seed' AND a.name = 'SARVIVAL EVENT');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'SARVIVAL EVENT', 'Music', 'SMAN 7 Purworejo, Kab. Purworejo', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804145234_6a719a42b4552.jpg', 'Sekarang persiapkan dirimu untuk SARVIVAL (Sarkoro Voice Festival) Festival ini akan digelar dengan menghadirkan deretan bintang tamu yang luar biasa. Diantaranya: -NADHIF BASALAMAH -DENNY CAKNAN -TYO AND FRIENDS Tempat : Lapangan SMA NEGERI 7 PURWOREJO Tanggal : 12 September 2026 Ayo, jangan lewatkan konser terbesar di Kota Purworejo dan jadilah bagian dari keseruan Konser SARVIVAL (Sarkoro Voice Festival) bersama teman, pasangan, dan keluarga! Segera amankan tiketmu sebelum kehabisan!', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-04_ca03cc2169477f6326a10b2a8189c52201688f7c63becf7e9a9a03c7f08d87e1.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-08-04_6db89d1312a9f909e316f28a829dbd28b321b0b472118da941541967b7c04d5d.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SARVIVAL EVENT'
WHERE o.email = 'demo.sarvival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL', 140000, 1, 0, 'Tiket Festival'
FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP', 199000, 1, 0, 'Tiket VVIP'
FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP');

-- Organizer: LIMA RUANG
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('LIMA RUANG', 'demo.lima-ruang@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'RUANG RAYA - KARAWANG', 'Music', '', 'Ruang Raya adalah festival yang mempertemukan musik, komunitas, kuliner, dan kreativitas lokal dalam satu perayaan.Lebih dari sekadar konser, Ruang Raya menjadi ruang bagi semua or'
FROM organizers o WHERE o.email = 'demo.lima-ruang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.lima-ruang@wavy.seed' AND a.name = 'RUANG RAYA - KARAWANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'RUANG RAYA - KARAWANG', 'Music', 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260611113413_6a2a3ac5de004.jpeg', 'Ruang Raya adalah festival yang mempertemukan musik, komunitas, kuliner, dan kreativitas lokal dalam satu perayaan.Lebih dari sekadar konser, Ruang Raya menjadi ruang bagi semua orang untuk berkumpul, berekspresi, dan menciptakan momen yang tak terlupakan. &rdquo;Menyalakan Ruang, Merayakan Kota.&rdquo;', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RUANG RAYA - KARAWANG'
WHERE o.email = 'demo.lima-ruang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - Early Entry', 200000, 690, 69, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk pajak dan biaya platform&lt;/li&gt; &lt;li&gt;Wajib masuk sebelum pukul 15:00&lt;/li&gt; &lt;li&gt;Datang diatas pukul 15:00, tiket dinyatakan hangus&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULAR - Early Entry');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - Festival', 275000, 2277, 227, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk pajak dan biaya platform&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULAR - Festival');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - VIP Festival', 350000, 401, 40, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk pajak dan biaya platform&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULAR - VIP Festival');

-- Organizer: 84 CREW
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('84 CREW', 'demo.84-crew@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'NO PEACE TODAY NO LIFE TOMORROW #7', 'Music', '', 'NO PEACE TODAY NO LIFE TOMORROW adalah event musik tahunan yang diinisiasi pada era 2000an. Berawal dari penggalangan dana untuk korban bencana Bengkulu tahun 2000. Bukan hanya mem'
FROM organizers o WHERE o.email = 'demo.84-crew@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.84-crew@wavy.seed' AND a.name = 'NO PEACE TODAY NO LIFE TOMORROW #7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'NO PEACE TODAY NO LIFE TOMORROW #7', 'Music', 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260725203446_6a64bb762533a.jpg', 'NO PEACE TODAY NO LIFE TOMORROW adalah event musik tahunan yang diinisiasi pada era 2000an. Berawal dari penggalangan dana untuk korban bencana Bengkulu tahun 2000. Bukan hanya membawa misi amal namun juga keresahan kolektif untuk membuat ruang ekspresi lintas genre. Event ini tumbuh menjadi salah satu movement independen yang ditunggu tunggu.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO PEACE TODAY NO LIFE TOMORROW #7'
WHERE o.email = 'demo.84-crew@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1', 50000, 500, 50, ''
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 2', 75000, 500, 50, ''
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULER', 100000, 1000, 100, ''
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULER');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BERDUA', 185000, 500, 50, 'Paket 2 orang'
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'BERDUA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BERTIGA', 270000, 300, 30, 'Paket bertiga'
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'BERTIGA');

-- Organizer: Melbi
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Melbi', 'demo.melbi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI', 'Music', '', 'HUJAN TENTANG CINTA. Majelis Lidah Berduri kembali ke Bali. Setelah Tiba-Tiba Marabahaya, kali ini hujan datang membawa cinta—dengan segala yang sengit, bising, absurd, dan tak sel'
FROM organizers o WHERE o.email = 'demo.melbi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.melbi@wavy.seed' AND a.name = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI', 'Music', 'Berbagi Ruang, Kota Denpasar', '2026-09-13 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260831225034_6a95a2ca000db.jpg', 'HUJAN TENTANG CINTA. Majelis Lidah Berduri kembali ke Bali. Setelah Tiba-Tiba Marabahaya, kali ini hujan datang membawa cinta—dengan segala yang sengit, bising, absurd, dan tak selesai. 13 September, mari bertemu lagi di antara lagu-lagu lama, bunyi-bunyi baru, dan cerita yang mungkin lebih baik dirasakan daripada dijelaskan. Datang. Kita lihat apa yang turun malam itu.', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_42c2c432b2770dbc8aba5e3f585b122aa057aa4f6824672b8dc2241cc3d53310.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_c3b2f81e302b84164c58238dd5de5e63978b74c3078c71d568b3b6a9d58ffe01.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_d41bbd8d1f27a6a4df2250064753711c1c8c25b1ee3df253d20bc787039d18f0.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_03d1ba8259f0ca52da95aea302d4e47e026fe1fe80e896fd72a6dc85696d35fe.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_43d46c1b44ed3ae7304d2bb9ed7c7b72b6c1477ae5730604aefa5a6cf903fd43.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_553e4a92f99ba942c44a58e935c401e4a2025b0a98769c4ab7e245bcd166cbad.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI'
WHERE o.email = 'demo.melbi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Advance Ticket', 75000, 500, 50, ''
FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Advance Ticket');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Door Ticket', 100000, 100, 10, ''
FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Door Ticket');

-- Organizer: PT Besar Intan Gemilang
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Besar Intan Gemilang', 'demo.pt-besar-intan-gemilang@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Waria Fest (Warga Berpesta Ria) Vol. 2', 'Music', '', 'Warga Berpesta Ria — Saatnya Kumpul, Musik, dan Seru-Seruan! WARIA FEST (Warga Berpesta Ria) Vol. 2 kembali hadir untuk mengajak warga berkumpul, bersenang-senang, dan menikmati ma'
FROM organizers o WHERE o.email = 'demo.pt-besar-intan-gemilang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.pt-besar-intan-gemilang@wavy.seed' AND a.name = 'Waria Fest (Warga Berpesta Ria) Vol. 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Waria Fest (Warga Berpesta Ria) Vol. 2', 'Music', 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang', '2026-09-19 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260901154925_6a96919512602.jpg', 'Warga Berpesta Ria — Saatnya Kumpul, Musik, dan Seru-Seruan! WARIA FEST (Warga Berpesta Ria) Vol. 2 kembali hadir untuk mengajak warga berkumpul, bersenang-senang, dan menikmati malam dengan suguhan musik dari berbagai penampil. Bersiap untuk malam yang penuh energi bersama Dogy Is Dog, Smile Morning, DJ Renggo, Never Forgive Honey, The Matulacaka, dan Akar Enak , serta dipandu oleh MC Reza . Jangan lewatkan keseruan WARIA FEST Vol. 2 dan jadilah bagian dari pesta warga yang penuh musik, tawa, dan kebersamaan! Detail Event Event: WARIA FEST (Warga Berpesta Ria) Vol. 2 Tanggal: Sabtu, 19 September 2026 Waktu: Mulai pukul 19.00 WIB Lokasi: Warmindo Bang Gaga MC: Reza Line Up Dogy Is Dog Smile Morning DJ Renggo Never Forgive Honey The Matulacaka Akar enak Harga Tiket Tiket Online: Rp35.000 FREE Soft Drink Info lebih lanjut: 0852-8553-5237 (Dimas)', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-01_1b4e26e9b8dcb0090be0178c4bd0734bfcc9dff83e6701b2cb6c311810bef8dd.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-01_9747b11b1654fc47b9e8f536fd3a201e063e942ab9c803394329a9a2531bbca8.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Waria Fest (Warga Berpesta Ria) Vol. 2'
WHERE o.email = 'demo.pt-besar-intan-gemilang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND ev.venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tiket Waria Fest', 35000, 200, 20, 'Tiket Regular Waria Fest Vol. 2'
FROM events ev WHERE ev.title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND ev.venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Tiket Waria Fest');

-- Organizer: NALARRAYA
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NALARRAYA', 'demo.nalarraya@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'SUARA GUNTUR (The Sound Of Wellness)', 'Music', '', 'THE SOUND OF WELLNESS'
FROM organizers o WHERE o.email = 'demo.nalarraya@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.nalarraya@wavy.seed' AND a.name = 'SUARA GUNTUR (The Sound Of Wellness)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'SUARA GUNTUR (The Sound Of Wellness)', 'Music', 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut', '2026-09-19 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821171844_6a882604b0753.jpg', 'THE SOUND OF WELLNESS', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SUARA GUNTUR (The Sound Of Wellness)'
WHERE o.email = 'demo.nalarraya@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Camp Fest Cat 1', 325000, 30, 3, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Camp Fest Cat 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Camp Fest Cat 2', 300000, 30, 3, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Camp Fest Cat 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - 2 Daypass (NO CAMP)', 200000, 100, 10, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - 2 Daypass (NO CAMP)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Suara Buana', 150000, 300, 30, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser hari pertama.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan mal'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Suara Buana');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Suara Pagi Buta', 150000, 300, 30, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser hari kedua.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan sarap'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Suara Pagi Buta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Camp Fest Cat 1', 350000, 40, 4, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Camp Fest Cat 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Camp Fest Cat 2', 300000, 40, 4, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Camp Fest Cat 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - 2 Daypass (NO CAMP)', 225000, 100, 10, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan malam &amp; sara'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - 2 Daypass (NO CAMP)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Suara Buana', 175000, 150, 15, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser hari pertama.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan mal'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Suara Buana');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Suara Pagi Buta', 175000, 150, 15, '&lt;p&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Benefit :&lt;/em&gt;&lt;/span&gt;&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Akses semua area konser hari kedua.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;span style=&quot;color:#0000FF;&quot;&gt;&lt;em&gt;Tiket berlaku untuk satu orang.&lt;/em&gt;&lt;/span&gt;&lt;/li&gt; &lt;li&gt;&lt;font color=&quot;#0000ff&quot;&gt;&lt;i&gt;Program Mindfullness Eating (Makan bersama : Makan sarap'
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Suara Pagi Buta');

-- Organizer: GUTS BALI
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GUTS BALI', 'demo.guts-bali@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'TOUR-GETHER WORSHIP NITE PROJECT BALI', 'Music', '', 'GUTS Bali × Worship Nite Project Tour-gether is a journey of worship, and Bali is where it comes to a close. In collaboration with GUTS Bali , Worship Nite Project brings the final'
FROM organizers o WHERE o.email = 'demo.guts-bali@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.guts-bali@wavy.seed' AND a.name = 'TOUR-GETHER WORSHIP NITE PROJECT BALI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'TOUR-GETHER WORSHIP NITE PROJECT BALI', 'Music', 'Atlas Super Club, Kab. Badung', '2026-09-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260811210347_6a7b2bc3a86c7.jpg', 'GUTS Bali × Worship Nite Project Tour-gether is a journey of worship, and Bali is where it comes to a close. In collaboration with GUTS Bali , Worship Nite Project brings the final stop of the Tour-gether journey to Bali. creating a space where worship goes beyond the walls of a church and reaches everyone, wherever they are. Because we believe Jesus is present everywhere and His love is for everyone. This is more than a night of worship. It’s an invitation to encounter Jesus, find hope, and experience His presence in a place you might not expect. Come as you are. Come with an open heart. Come and encounter Jesus. Tour-gether: Bali. Revival is here.', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_f2d4e0b43271efcca9a16295eb3577fc35a028679eb69b5fb8639dc010f2751e.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_1e5b09016cb267da2c0586af271963e199481acb83a0852002c613cda6b19b09.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TOUR-GETHER WORSHIP NITE PROJECT BALI'
WHERE o.email = 'demo.guts-bali@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULER', 115000, 661, 66, 'Worship. Music. Revival. Step into a night where faith meets a new atmosphere. Come as you are and encounter Jesus. Revival is here.'
FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULER');

-- Organizer: Boss Creator
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Boss Creator', 'demo.boss-creator@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Pestapora 2026', 'Music', '', 'Pestapora 2026 adalah sebuah perayaan dan selebrasi selama tiga hari yang melibatkan berbagai komunitas dan menggabungkan lintas genre musik di Indonesia. 25, 26, 27 September 2026'
FROM organizers o WHERE o.email = 'demo.boss-creator@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.boss-creator@wavy.seed' AND a.name = 'Pestapora 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Pestapora 2026', 'Music', 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara', '2026-09-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260819162030_6a85755e86d56.jpeg', 'Pestapora 2026 adalah sebuah perayaan dan selebrasi selama tiga hari yang melibatkan berbagai komunitas dan menggabungkan lintas genre musik di Indonesia. 25, 26, 27 September 2026 adalah hari perayaan Pestapora selanjutnya. Nantikan dan mari berpestapora!', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pestapora 2026'
WHERE o.email = 'demo.boss-creator@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular - 3 Days Pass', 650000, 1500, 150, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Regular - 3 Days Pass');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 1', 300000, 5000, 400, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 3', 300000, 5000, 400, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 1', 225000, 1500, 150, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.&lt;/li&gt; &lt;li&gt;Masuk ke venue sebelum jam 15.00 WIB&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 3', 225000, 1500, 150, '&lt;ul&gt; &lt;li&gt;Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.&lt;/li&gt; &lt;li&gt;Masuk ke venue sebelum jam 15.00 WIB&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular - 3 Days Pass', 650000, 1000, 100, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Regular - 3 Days Pass');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 1', 300000, 2000, 200, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 2', 300000, 500, 50, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 3', 300000, 3000, 300, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 1', 225000, 1000, 100, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;br /&gt; Entry to venue before 15.00 WIB&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 2', 225000, 1000, 100, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;br /&gt; Entry to venue before 15.00 WIB&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 3', 225000, 1000, 100, '&lt;p&gt;Prices do not include Regional Entertainment Tax, Admin Fees and other fees.&lt;br /&gt; Entry to venue before 15.00 WIB&lt;/p&gt;'
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 3');

-- Organizer: Arvindo Media
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Arvindo Media', 'demo.arvindo-media@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Glitter Camp Live Concert', 'Music', '', '&quot;Glitter Camp Live Concert&quot; mengusung konsep intimate concert dengan sentuhan tata visual modern dan warna-warni, hingga atmosfer panggung yang dibuat dengan suasana camp'
FROM organizers o WHERE o.email = 'demo.arvindo-media@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.arvindo-media@wavy.seed' AND a.name = 'Glitter Camp Live Concert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Glitter Camp Live Concert', 'Music', 'Balai Sarbini Jakarta, Jakarta Selatan', '2026-10-03 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260622121756_6a38c58400b06.jpeg', '&quot;Glitter Camp Live Concert&quot; mengusung konsep intimate concert dengan sentuhan tata visual modern dan warna-warni, hingga atmosfer panggung yang dibuat dengan suasana camp yang modern dan hangat. Tak hanya menjadi showcase penampilan lagu-lagu glitter, &quot;Glitter Camp Live Concert&quot; juga akan menjadi playground bagi masing-masing personil Glitter dengan para Glitz.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Glitter Camp Live Concert'
WHERE o.email = 'demo.arvindo-media@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Glitz (CAT 1)', 500000, 196, 19, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;li&gt;&lt;em&gt;Setiap pembelian tiket Glitz akan mendapatkan Photocard. Pembeli juga mendapatkan kesempatan untuk Hi-Bye dan kesempatan mendapatkan Official Signed Poster melalui sistem raffle.&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Glitz (CAT 1)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Besties (CAT 2)', 400000, 50, 5, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;li&gt;&lt;em&gt;Setiap pembelian tiket Bestie akan mendapatkan kesempatan untuk mendapatkan Official Signed Poster dan Photocard melalui sistem raffle&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Besties (CAT 2)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Berkilau (CAT 3)', 125000, 52, 5, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Berkilau (CAT 3)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Glitz with Buumi Bundle (CAT 1)', 630000, 40, 4, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;li&gt;&lt;em&gt;Setiap pembelian tiket Glitz akan mendapatkan Photocard. Pembeli juga mendapatkan kesempatan untuk Hi-Bye dan kesempatan mendapatkan Official Signed Poster melalui sistem raffle.&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Glitz with Buumi Bundle (CAT 1)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Besties with Buumi Bundle (CAT 2)', 530000, 30, 3, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;Harga belum termasuk pajak dan admin fee&lt;/em&gt;&lt;/li&gt; &lt;li&gt;&lt;em&gt;Setiap pembelian tiket Bestie akan mendapatkan kesempatan untuk mendapatkan Official Signed Poster dan Photocard melalui sistem raffle&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Besties with Buumi Bundle (CAT 2)');

-- Organizer: PT Semua Pasti Gembira
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Semua Pasti Gembira', 'demo.pt-semua-pasti-gembira@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'PGR 2026 @Cikarang', 'Music', '', 'PGR 2026 @Cikarang'
FROM organizers o WHERE o.email = 'demo.pt-semua-pasti-gembira@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.pt-semua-pasti-gembira@wavy.seed' AND a.name = 'PGR 2026 @Cikarang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'PGR 2026 @Cikarang', 'Music', 'Lippo Mall Cikarang, Kab. Bekasi', '2026-10-03 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824224750_6a8c67a68485b.jpeg', 'PGR 2026 @Cikarang', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR 2026 @Cikarang'
WHERE o.email = 'demo.pt-semua-pasti-gembira@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE', 85000, 200, 20, '&lt;ul&gt; &lt;li&gt;Harga Belum termasuk pajak dan admin fee&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - FESTIVAL PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE.', 100000, 5000, 400, '&lt;ul&gt; &lt;li&gt;Harga Belum termasuk pajak dan admin fee&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - FESTIVAL PRESALE.');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE', 175000, 100, 10, '&lt;ul&gt; &lt;li&gt;&lt;small&gt;Harga Belum termasuk pajak dan admin fee&lt;/small&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - VIP PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE.', 200000, 300, 30, '&lt;ul&gt; &lt;li&gt;&lt;small&gt;Harga Belum termasuk pajak dan admin fee&lt;/small&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - VIP PRESALE.');

-- Organizer: YDL Teknologi
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('YDL Teknologi', 'demo.ydl-teknologi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Party Du Royaume by de Creative Kingdom', 'Music', '', 'Party Du Royaume Di sebuah kerajaan yang megah, lahirlah seorang Putra Mahkota yang telah lama dinantikan. Untuk menyambut kelahirannya, sebuah pesta besar dipersiapkan dengan sega'
FROM organizers o WHERE o.email = 'demo.ydl-teknologi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.ydl-teknologi@wavy.seed' AND a.name = 'Party Du Royaume by de Creative Kingdom');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Party Du Royaume by de Creative Kingdom', 'Music', 'Taman Budaya Raden Saleh, Kota Semarang', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260902183800_6a980a98a2970.jpg', 'Party Du Royaume Di sebuah kerajaan yang megah, lahirlah seorang Putra Mahkota yang telah lama dinantikan. Untuk menyambut kelahirannya, sebuah pesta besar dipersiapkan dengan segala sesuatu yang paling indah, mewah, dan sempurna. Namun, di tengah kemeriahan dan gemerlap istana, sesuatu yang tak terduga mulai terjadi... Apa yang sebenarnya terjadi di balik pesta sang Putra Mahkota? Dan mampukah mereka menyadari apa yang paling berharga? Saksikan drama musikal Party Du Royaume! Sabtu, 10 Oktober 2026 di Taman Budaya Raden Saleh (Gedung Ki Narto Sabdho) Semarang.', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_97778e0a800e6a2e8243d94fbab6b3b9bef7a0bc4a8f85de6125557e6fa87829.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_c5ad21eaef024ff083a1e425b1ba062270999615e59e72d11dc93ce62fefd13e.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_bed35f0d1368212fd573b6305b354e4d0ed8bcf50efbd25232ffae57358564dc.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_7bd128551c4eae9b3c085b16f74e8fd116329a6eecf087fb8a9104dc11ed83fd.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_d8c0af11c4724022aa7ecb445e666b4220f860250794bcec554446ff01f72901.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Party Du Royaume by de Creative Kingdom'
WHERE o.email = 'demo.ydl-teknologi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales VIP Session 1', 125000, 265, 26, 'Early Bird Sales VIP'
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales VIP Session 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales Regular Session 1', 75000, 189, 18, 'Early Bird Sales Regular'
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales Regular Session 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales VIP Session 2', 125000, 265, 26, 'Early Bird Sales VIP Session 2'
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales VIP Session 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales Regular Session 2', 75000, 189, 18, 'Early Bird Sales Regular Session 2'
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales Regular Session 2');

-- Organizer: BPN PKKI
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BPN PKKI', 'demo.bpn-pkki@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Golden Jubilee 2026', 'Music', '', 'Golden Jubilee adalah perayaan iman sekaligus gerakan solidaritas spiritual yang mengundang 12.000 umat untuk hadir bersama dalam satu momen bersejarah, merayakan 50 tahun Pembarua'
FROM organizers o WHERE o.email = 'demo.bpn-pkki@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.bpn-pkki@wavy.seed' AND a.name = 'Golden Jubilee 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Golden Jubilee 2026', 'Music', 'Indonesia Arena, Jakarta Pusat', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260618124142_6a338516d382f.jpeg', 'Golden Jubilee adalah perayaan iman sekaligus gerakan solidaritas spiritual yang mengundang 12.000 umat untuk hadir bersama dalam satu momen bersejarah, merayakan 50 tahun Pembaruan Karismatik Katolik (PKK) di Indonesia dengan tema Roh Kudus Api Evangelisasi dan misi Solidaritas Spiritual. Lebih dari sebuah perayaan, Golden Jubilee adalah panggilan nyata untuk bergerak bersama bagi Kaum Kecil, Lemah, Miskin, Tersingkir, dan Difabel (KLMTD) mereka yang kerap berada di pinggiran, namun adalah pusat dari misi Injil. Kehadiranmu bukan sekadar mengisi kursi. Setiap tiket yang kamu beli adalah kontribusi nyata bagi misi yang berkelanjutan, termasuk retreat pendampingan iman bagi keluarga, kaum muda, dan sahabat KLMTD yang akan terus berjalan setelah perayaan ini. Satu kursi. Satu langkah iman. Satu dampak nyata. &#128330;&#65039; Rundown 09.00 WIB Registrasi & GoJu Fair 11.00 WIB Open Gate 12.45 - 21.00 WIB Acara Puncak GoJu', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Golden Jubilee 2026'
WHERE o.email = 'demo.bpn-pkki@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP', 3300000, 200, 20, '&lt;ul&gt; &lt;li&gt;This ticket is valid for 1 person.&lt;/li&gt; &lt;li&gt;⁠Seating is located on VVIP zone 1st/ground floor.&lt;/li&gt; &lt;li&gt;Free Seating (No Assigned Seats).&lt;/li&gt; &lt;li&gt;Ticket price excludes 10% government tax, 5% administration fee, and platform fee.&lt;/li&gt; &lt;li&gt;If you using wheelchair please contact customer service.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP', 1400000, 400, 40, '&lt;ul&gt; &lt;li&gt;This ticket is valid for 1 person.&lt;/li&gt; &lt;li&gt;Seating is located on VIP zone 1st/ground floor.&lt;/li&gt; &lt;li&gt;Free Seating (No Assigned Seats).&lt;/li&gt; &lt;li&gt;Ticket price excludes 10% government tax, 5% administration fee, and platform fee.&lt;/li&gt; &lt;li&gt;If you using wheelchair please contact customer service.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'TELESKOPIK', 1100000, 350, 35, '&lt;ul&gt; &lt;li&gt;This ticket is valid for 1 person.&lt;/li&gt; &lt;li&gt;Seating is located on teleskopik zone 1st/ground floor.&lt;/li&gt; &lt;li&gt;Free Seating (No Assigned Seats).&lt;/li&gt; &lt;li&gt;Ticket price excludes 10% government tax, 5% administration fee, and platform fee.&quot;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'TELESKOPIK');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'SILVER', 125000, 2000, 200, '&lt;ul&gt; &lt;li&gt;This ticket is valid for 1 person.&lt;/li&gt; &lt;li&gt;Seating is located on Silver zone 4th floor.&lt;/li&gt; &lt;li&gt;Free Seating (No Assigned Seats).&lt;/li&gt; &lt;li&gt;Ticket price excludes 10% government tax, 5% administration fee, and platform fee.&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'SILVER');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'DONASI KURSI KASIH', 300000, 50, 5, '&lt;ul&gt; &lt;li&gt; &lt;style type=&quot;text/css&quot;&gt;&lt;!--br {mso-data-placement:same-cell;}--&gt; &lt;/style&gt; &lt;strong&gt;Kursi kasih akan disalurkan langsung oleh tim KLMTD Goju.&lt;/strong&gt;&lt;/li&gt; &lt;li&gt;&lt;strong&gt;QRCode tidak diberikan kepada pemberi donasi.&lt;/strong&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'DONASI KURSI KASIH');

-- Organizer: FF CREATIVE
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FF CREATIVE', 'demo.ff-creative@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', '', 'GOOD DAY SCHOOLIOCUS - Harmony In Collaboration Vol 4 Kompetisi Angklung Tingkat SMA terbesar di Jawa Barat kembali hadir di bulan Oktober 2026. Kali ini mendatangkan guest star: S'
FROM organizers o WHERE o.email = 'demo.ff-creative@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.ff-creative@wavy.seed' AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', 'Laswi Heritage, Bandung', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824143453_6a8bf41dee62f.jpg', 'GOOD DAY SCHOOLIOCUS - Harmony In Collaboration Vol 4 Kompetisi Angklung Tingkat SMA terbesar di Jawa Barat kembali hadir di bulan Oktober 2026. Kali ini mendatangkan guest star: Saung Angklung Udjo, DIA - Stand Here Alone & Juicy Luicy. Selain penampilan di atas kalian juga dapat mengikuti banyak games seru dan hadiah menarik setiap kalian memenangkan games.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4'
WHERE o.email = 'demo.ff-creative@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE', 25000, 1000, 100, 'PRESALE'
FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE');

-- Organizer: Dadan Aldia Putra
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dadan Aldia Putra', 'demo.dadan-aldia-putra@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3', 'Music', '', 'Karaoke musik JKT48 merupakan suatu kesenangan terutama bagi seluruh penggemar musik JKT48, tentunya dengan adanya acara ini bisa memperketat silaturahmi bagi anak muda, jangan sam'
FROM organizers o WHERE o.email = 'demo.dadan-aldia-putra@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.dadan-aldia-putra@wavy.seed' AND a.name = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3', 'Music', 'ILLUA SOJU BOX, Jakarta Pusat', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260904181041_6a9aa731daafb.jpg', 'Karaoke musik JKT48 merupakan suatu kesenangan terutama bagi seluruh penggemar musik JKT48, tentunya dengan adanya acara ini bisa memperketat silaturahmi bagi anak muda, jangan sampai lewatkan keseruan acara ini karena acara ini akan lebih meriah ditahun sebelumnya, Jangan lupa datang pada acara karaoke bu Aldan group dengan waktu yang sudah di tentukan.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3'
WHERE o.email = 'demo.dadan-aldia-putra@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE SPC', 30000, 20, 2, ''
FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE SPC');

-- Organizer: SIGMA PRO INDONESIA
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIGMA PRO INDONESIA', 'demo.sigma-pro-indonesia@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'BADONCI FESTIVAL DISK.2', 'Music', '', 'SYARAT DAN KETENTUAN BADONCI FESTIVAL 1.⁠ ⁠UMUM Badonci Festival diselenggarakan oleh penyelenggara resmi PT. Sigma Pro Indonesia Syarat dan ketentuan ini berlaku untuk semua pengu'
FROM organizers o WHERE o.email = 'demo.sigma-pro-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.sigma-pro-indonesia@wavy.seed' AND a.name = 'BADONCI FESTIVAL DISK.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'BADONCI FESTIVAL DISK.2', 'Music', 'Pohon Kasih Megamas, Kota Manado', '2026-10-15 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821133006_6a87f06e50af1.jpg', 'SYARAT DAN KETENTUAN BADONCI FESTIVAL 1.⁠ ⁠UMUM Badonci Festival diselenggarakan oleh penyelenggara resmi PT. Sigma Pro Indonesia Syarat dan ketentuan ini berlaku untuk semua pengunjung, peserta, artis, vendor, dan pihak terkait yang terlibat dalamacara. Penyelenggara berhak mengubah syarat dan ketentuan kapan saja tanpa pemberitahuan terlebih dahulu, denganpembaruan akan diumumkan melalui kanal resmi festival. 2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET Tiket hanya bisa dibeli melalui kanal resmi yang telah ditentukan LOKET.COM. ⁠Setiap tiket hanya sah untuk satu orang dan tidak dapat dipindahkan kepemilikan atau dijual kembali tanpa izinpenyelenggara. Tiket yang hilang, rusak, atau palsu tidak akan diganti atau diterima masuk. Pengunjung harus menunjukkan tiket berupa QR Code atau bukti pembayaran elektronik yang valid saat masuk area festival. 3.⁠ ⁠SYARAT MASUK AREA FESTIVAL Pengunjung di bawah umur harus ditemani oleh orang tua atau wali yang bertanggung jawab. ⁠Semua pengunjung wajib menjalani pemeriksaan keamanan sebelum masuk area festival. ⁠Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung yang tidak mematuhi peraturan atau menunjukkanperilaku yang mengganggu ketertiban. 4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN Barang terlarang: Senjata api, senjata tajam, dan benda berbahaya lainnya. Narkoba, alkohol, dan zat terlarang lainnya. ⁠Bahan peledak atau bahan yang dapat menyebabkan kebakaran. ⁠Benda keras atau tajam yang dapat digunakan sebagai alat serangan. Drinks dan makanan dari luar area festival (kecuali untuk kebutuhan kesehatan khusus dengan izin tertulis). Barang diizinkan (dengan pembatasan): Tas kecil atau ransel dengan ukuran maksimal [misal: 40x30x20 cm]. ⁠Perlengkapan medis pribadi dengan izin petugas keamanan. ⁠Kamera foto/video non-profesional (tanpa tripod atau peralatan besar). ⁠Sunscreen, topi, dan payung untuk perlindungan dari cuaca. 5.⁠ ⁠PERILAKU PENGUNJUNG Seluruh pengunjung diharapkan bertingkah laku sopan dan menghormati sesama pengunjung, artis, dan petugas acara. Tidak diperbolehkan melakukan tindakan kekerasan, pelecehan, atau ujaran kebencian. ⁠Tidak diperbolehkan merusak atau mengganggu fasilitas dan properti festival. Merokok hanya diperbolehkan di area merokok yang telah ditentukan. 6.⁠ ⁠HAK DAN TANGGUNG JAWAB PENYELENGGARA Penyelenggara berhak membatalkan atau menangguhkan acara karena alasan keamanan, cuaca ekstrem, atau kondisi takterduga lainnya. Dalam hal ini, pengembalian tiket akan diatur sesuai kebijakan yang telah ditentukan. Penyelenggara tidak bertanggung jawab atas kehilangan, kerusakan, atau cedera yang terjadi pada pengunjung akibatkelalaian pribadi atau tidak mematuhi peraturan. Penyelenggara berhak mengambil foto atau video selama acara untuk keperluan promosi dan dokumentasi, denganpengunjung dianggap telah menyetujui penggunaan gambar tersebut. 7.⁠ ⁠KESEHATAN DAN KEAMANAN Pengunjung dengan kondisi kesehatan khusus disarankan untuk membawa obat pribadi dan memberitahu petugas medisjika diperluk', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-22_f91ab905923b0b139a5eb36c99f1ccc80d8314d1e7ada7492690c78a4d290d21.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BADONCI FESTIVAL DISK.2'
WHERE o.email = 'demo.sigma-pro-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1 - FESTIVAL', 150000, 4550, 400, ''
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1 - FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FRESALE 1 - VIP', 250000, 650, 65, ''
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FRESALE 1 - VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL - BARENG SAYANG', 260000, 500, 50, '2 tiket'
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL - BARENG SAYANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP - BARENG SAYANG', 460000, 500, 50, '2 tiket'
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP - BARENG SAYANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL - BARENG TAMANG', 480000, 500, 50, '4 TIKET'
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL - BARENG TAMANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP - BARENG TAMANG', 880000, 500, 50, '4 TIKET'
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP - BARENG TAMANG');

-- Organizer: Angular//Momentum
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Angular//Momentum', 'demo.angular-momentum@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', '', 'Unfamiliar Weather Showcase adalah pertunjukan spesial dari In Inertia untuk merayakan album kedua mereka, Unfamiliar Weather. Pertunjukan akan berlangsung selama kurang lebih 120 '
FROM organizers o WHERE o.email = 'demo.angular-momentum@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.angular-momentum@wavy.seed' AND a.name = 'In Inertia Showcase - Unfamiliar Weather');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260731175446_6a6c7ef65fe70.jpg', 'Unfamiliar Weather Showcase adalah pertunjukan spesial dari In Inertia untuk merayakan album kedua mereka, Unfamiliar Weather. Pertunjukan akan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak. In Inertia akan membawakan rangkaian lagu dari album Unfamiliar Weather dalam sebuah format pertunjukan yang memadukan musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik. Setiap elemen dirancang sebagai satu kesatuan untuk membawa penonton memasuki perjalanan emosional yang menjadi tema utama album ini, mulai dari perubahan, kehilangan, penerimaan, hingga usaha menemukan rasa nyaman di tengah situasi yang terasa asing. Penonton akan diajak menikmati pertunjukan dari awal hingga akhir sebagai satu rangkaian cerita yang terbagi ke dalam dua babak. Durasi pertunjukan: ±120 menit Penampil: In Inertia Format pertunjukan: 2 babak Pengalaman: Musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik', 'published', '["https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_2f6f5f272e41c97f875c0328dc156e352f241373b18c7a627c6fb46799305488.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_a2cf9c7a7f7f8e327c2a74338d1d1cffeb819f353b0788251955e02bf72a0c07.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_fea78744c8d934faf45c2e2c147eb942a879144dc44528fb4c818187819ee295.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_9b4a72be45c3f80fd6cb5d71fa6e4d07f639b42e1031f9b742c2093a4941af1a.webp"]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase - Unfamiliar Weather'
WHERE o.email = 'demo.angular-momentum@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Reguler', 200000, 230, 23, 'Tiket untuk pertunjukan imersif “Unfamiliar Weather” oleh In Inertia'
FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Reguler');

-- Organizer: KRAZY BRAZY KARAWANG
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KRAZY BRAZY KARAWANG', 'demo.krazy-brazy-karawang@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Underground Supreme', 'Music', '', 'UNDERGROUND SUPREME: Rise The Underground Culture Kultur Hip-Hop bukan sekadar musik, melainkan sebuah wadah ekspresi kreatif, seni, dan pergerakan komunitas. KRAZY BRAZY KARAWANG '
FROM organizers o WHERE o.email = 'demo.krazy-brazy-karawang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.krazy-brazy-karawang@wavy.seed' AND a.name = 'Underground Supreme');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Underground Supreme', 'Music', 'District 163, Kab. Karawang', '2026-10-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260713224128_6a550728a5089.jpg', 'UNDERGROUND SUPREME: Rise The Underground Culture Kultur Hip-Hop bukan sekadar musik, melainkan sebuah wadah ekspresi kreatif, seni, dan pergerakan komunitas. KRAZY BRAZY KARAWANG dengan bangga mempersembahkan UNDERGROUND SUPREME , sebuah panggung representatif yang dirancang untuk merayakan energi kultur Hip-Hop lokal serta membangun ekosistem kreatif urban yang lebih besar di Karawang. Dengan mengusung semangat "Rise The Underground Culture" , event ini memadukan konser musik dengan berbagai aktivasi komunitas kreatif untuk memberikan pengalaman hiburan alternatif yang segar, eksklusif, dan berkualitas bagi generasi muda. Lineup & Pengisi Acara Bersiaplah untuk merayakan energi skena underground bersama deretan talenta Hip-Hop terbaik: Main Performance (Guest Stars): Penampilan rap yang energik, gelap, dan khas dari Coming soon Guess Star Local Heroes: Aksi panggung memukau dari 3 Local Heroes yang siap membakar atmosfer acara. Creative Experience Tidak hanya menyajikan pertunjukan musik di panggung utama, UNDERGROUND SUPREME juga menghadirkan pengalaman interaktif yang melibatkan massa secara langsung: Live Printing & Sablon Area: Area kreatif interaktif di mana pengunjung bisa melihat dan merasakan langsung proses pembuatan karya sablon. Merchandise Area: Tempat berburu berbagai produk kreatif eksklusif sebagai bagian dari identitas event dan komunitas. UMKM & Brand Local Booth: Ruang khusus bagi brand lokal dan pelaku usaha kreatif untuk memperkenalkan produk urban terbaik mereka kepada audiens. Detail Pelaksanaan Event Hari/Tanggal: Minggu, 25 Oktober 2026 Waktu: 15.00 WIB – 01.55 WIB ( Open Gate & penukaran tiket dimulai pukul 15.00 WIB) Lokasi: District 163 Karawang (Jl. Tarumanagara No. 6, Ruko Karawang Hijau, Purwadana, Kecamatan Telukjambe Timur, Karawang) Jangan sampai kehabisan! Kuota tiket terbatas. Amankan tiketmu sekarang juga, jadilah bagian dari solidaritas komunitas, dan rasakan pengalaman kultur urban yang autentik bersama Krazy Brazy Karawang!', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Underground Supreme'
WHERE o.email = 'demo.krazy-brazy-karawang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 1 - Underground Supreme', 160000, 300, 30, 'Tiket UNDERGROUND SUPREME Presale 1. Kuota terbatas! Akses masuk area konser Hip-Hop dan area kreatif. Amankan tiketmu sekarang juga!'
FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale 1 - Underground Supreme');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 2 - Underground Supreme', 200000, 500, 50, 'Tiket UNDERGROUND SUPREME Presale 2. Kuota terbatas! Akses masuk area konser Hip-Hop dan area kreatif. Amankan tiketmu sekarang juga!'
FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale 2 - Underground Supreme');

-- Organizer: Antara Suara
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Antara Suara', 'demo.antara-suara@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Titik Sadrah for Revenge', 'Music', '', 'Menginjak dua dekade, Titik Sadrah hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi for Revenge , melainkan ruang sa'
FROM organizers o WHERE o.email = 'demo.antara-suara@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.antara-suara@wavy.seed' AND a.name = 'Titik Sadrah for Revenge');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Titik Sadrah for Revenge', 'Music', 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260710180442_6a50d1ca9d9bd.jpeg', 'Menginjak dua dekade, Titik Sadrah hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi for Revenge , melainkan ruang sakral yang merangkum gelombang emosi band, Archims Pribadi (Chimot) secara personal, dan for Revenge Family . Sebuah memoar bersama untuk berhenti memaksakan apa yang telah karam dan mulai berdamai dengan kenyataan yang mematahkan arah. Kita semua pernah tersapu arus emosi liar hingga tenggelam di palung terendah. Bagi Chimot , palung itu adalah penerimaan pahit bahwa di tahun ke-20 ini ia tidak bisa lagi berdiri di balik set drumnya. Bagi for Revenge , ini adalah patah hati terdalam karena kehilangan detak jantung keseharian mereka. Sementara bagi for Revenge Family , ini adalah fase transisi berat untuk menerima keadaan dan formasi yang baru. Namun, kita disadarkan bahwa di setiap arus deras, selalu ada muara yang menanti. Di titik ini kita belajar bahwa tidak semua hal harus dipaksa untuk tetap tinggal, karena beberapa hal justru baru menemukan makna sejatinya saat kita memilih ikhlas melepaskan. Di muara inilah kita bertemu untuk saling menguatkan. Mari rayakan ruang penerimaan ini di Titik Sadrah Bandung, Eldorado Sport & Convention Hall pada 31 Oktober September 2026 , dan Titik Sadrah Kuala Lumpur . Datanglah untuk melarung segala yang menyesakkan, biarkan semuanya usai di titik ini, dan pulanglah membawa awal yang baru.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Titik Sadrah for Revenge'
WHERE o.email = 'demo.antara-suara@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival A ', 450000, 985, 98, '&lt;ul&gt; &lt;li&gt;1 tiket Konser Titik Sadrah for Revenge&lt;/li&gt; &lt;li&gt;⁠1 tiket berlaku untuk satu orang&lt;/li&gt; &lt;li&gt;Harga tiket belum termasuk Pajak Hiburan Daerah 10%, Biaya Admin 5%&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Festival A ');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival B', 400000, 645, 64, '&lt;ul&gt; &lt;li&gt;1 tiket Konser Titik Sadrah for Revenge&lt;/li&gt; &lt;li&gt;⁠1 tiket berlaku untuk satu orang&lt;/li&gt; &lt;li&gt;Harga tiket belum termasuk Pajak Hiburan Daerah 10%, Biaya Admin 5%&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Festival B');

-- Organizer: S3 Entertainment by PT. Suryono Sehat Sejahtera
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('S3 Entertainment by PT. Suryono Sehat Sejahtera', 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', '', 'Memories Of The Soul adalah sebuah perhelatan musik yang menghadirkan kembali lagu-lagu hits terbaik era 80-an, 90-an, hingga awal 2000-an yang penuh kenangan. Event ini dirancang '
FROM organizers o WHERE o.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed' AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', 'Balai Sarbini, DKI Jakarta', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260721113228_6a5ef65c616bf.jpg', 'Memories Of The Soul adalah sebuah perhelatan musik yang menghadirkan kembali lagu-lagu hits terbaik era 80-an, 90-an, hingga awal 2000-an yang penuh kenangan. Event ini dirancang sebagai momen &ldquo;temu kangen&rdquo; bagi para pecinta musik lintas generasi untuk kembali merasakan suasana hangat, romantis, dan penuh memori indah melalui lantunan lagu yang tak lekang oleh waktu. Dikemas dengan konsep panggung elegan, tata cahaya spektakuler, dan kualitas tata suara premium, event ini menghadirkan pengalaman eksklusif dan berkelas. Tidak hanya menyuguhkan hiburan, acara ini juga menjadi ruang silaturahmi, networking, serta ajang mempererat kebersamaan dalam suasana yang nyaman dan penuh nostalgia. Dengan segmentasi audiens usia 35&ndash;60 tahun, kalangan profesional, eksekutif, dan komunitas pecinta musik nostalgia, event ini diharapkan menjadi event tahunan yang dinantikan serta memberikan nilai tambah promosi dan eksposur maksimal bagi para sponsor yang terlibat.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01'
WHERE o.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP Kursi Atas', 2000000, 33, 3, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP Kursi Atas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP Kursi Depan', 1500000, 64, 6, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP Kursi Depan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP', 1300000, 24, 2, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Platinum', 1000000, 162, 16, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Platinum');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold', 750000, 471, 47, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Gold');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Silver', 500000, 250, 25, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Silver');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Bronze', 350000, 148, 14, ''
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Bronze');

-- Organizer: PT Semua Pasti Gembira
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Semua Pasti Gembira', 'demo.pt-semua-pasti-gembira-1@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'PGR Vol. 11 @Jakarta', 'Music', '', 'PGR Vol. 11 @Jakarta'
FROM organizers o WHERE o.email = 'demo.pt-semua-pasti-gembira-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.pt-semua-pasti-gembira-1@wavy.seed' AND a.name = 'PGR Vol. 11 @Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'PGR Vol. 11 @Jakarta', 'Music', 'JIExpo Kemayoran, Jakarta Pusat', '2026-11-07 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260525145212_6a13ffac08f80.jpeg', 'PGR Vol. 11 @Jakarta', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR Vol. 11 @Jakarta'
WHERE o.email = 'demo.pt-semua-pasti-gembira-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR Vol. 11 - FESTIVAL PRESALE', 100000, 5000, 400, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;&lt;strong&gt;Harga Belum termasuk pajak dan admin fee&lt;/strong&gt;&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR Vol. 11 - FESTIVAL PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR Vol. 11 - VIP PRESALE', 250000, 300, 30, '&lt;ul&gt; &lt;li&gt;&lt;em&gt;&lt;strong&gt;Harga Belum termasuk pajak dan admin fee&lt;/strong&gt;&lt;/em&gt;&lt;/li&gt; &lt;/ul&gt;'
FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR Vol. 11 - VIP PRESALE');

-- Organizer: JONG MESOEDJINEN
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JONG MESOEDJINEN', 'demo.jong-mesoedjinen@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'JONGFEST 2026', 'Music', '', '🎉 JONGFEST 2026 🎉 THE BIG FESTIVAL MUSIC LIVE IN MESUJI Bersiaplah menjadi bagian dari salah satu festival musik terbesar di Kabupaten Mesuji! JONG MESOEDJINEN dengan bangga memp'
FROM organizers o WHERE o.email = 'demo.jong-mesoedjinen@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.jong-mesoedjinen@wavy.seed' AND a.name = 'JONGFEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'JONGFEST 2026', 'Music', 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang', '2026-11-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260717192631_6a5a1f77042a2.jpg', '🎉 JONGFEST 2026 🎉 THE BIG FESTIVAL MUSIC LIVE IN MESUJI Bersiaplah menjadi bagian dari salah satu festival musik terbesar di Kabupaten Mesuji! JONG MESOEDJINEN dengan bangga mempersembahkan JONGFEST 2026 , menghadirkan penampilan spesial dari xxxxx xxxx xxxxx , xxxxxxxxx , xxxxxxxxxx dan xxxxx xxxx dalam satu panggung spektakuler. Nikmati malam penuh hiburan dengan lagu-lagu hits yang akan membuat seluruh penonton bernyanyi bersama. Selain konser musik, pengunjung juga dapat menikmati berbagai tenant kuliner UMKM, area festival, serta beragam aktivitas menarik lainnya. Jangan lewatkan kesempatan menjadi bagian dari sejarah festival musik terbesar di Mesuji! 🎤 Line Up xxxxx xxxx xxxxx xxxxxxxxxx xxxxxxxxx xxxxx xxxx INFUSE BAND (Line Up akan ditampilkan bertahap setelah tiket Early Bird terpenuhi!) 📅 Informasi Acara Tanggal: 10 November 2026 Waktu: 16.00 WIB – 22.00 WIB Lokasi: Alun-Alun Simpang Pematang Kecamatan Simpang Pematang, Kabupaten Mesuji, Lampung 🎟️ Kategori Tiket Early Bird (Kuota Terbatas) Presale Reguler VIP (jika tersedia) Tiket yang telah dibeli tidak dapat dikembalikan atau ditukar kecuali acara dibatalkan oleh penyelenggara.', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JONGFEST 2026'
WHERE o.email = 'demo.jong-mesoedjinen@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'NORMAL FESTIVAL', 119000, 1200, 120, 'Dapatkan harga terbaik JONGFEST 2026! Kuota FESTIVAL terbatas. Berlaku hingga kuota habis. Amankan tiketmu sekarang!.'
FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'NORMAL FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'NORMAL VIP', 139000, 700, 70, 'Dapatkan harga terbaik JONGFEST 2026! Kuota VIP terbatas. Berlaku hingga kuota habis. Amankan tiketmu sekarang!'
FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'NORMAL VIP');

-- Organizer: New Gen Entertainment
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('New Gen Entertainment', 'demo.new-gen-entertainment@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'HIGH SCHOOL FEST 2026', 'Music', '', 'School is back, but make it a festival!🎒 High School Fest is The Biggest School Themed Festival Ever! So, saatnya seru-seruan menikmati musik, main bareng, dan ngerasain kembali v'
FROM organizers o WHERE o.email = 'demo.new-gen-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.new-gen-entertainment@wavy.seed' AND a.name = 'HIGH SCHOOL FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status, gallery, terms_conditions)
SELECT o.id, a.id, 'HIGH SCHOOL FEST 2026', 'Music', 'Stadiun Madya B, GBK, Jakarta Selatan', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821130357_6a87ea4d14a1a.jpg', 'School is back, but make it a festival!🎒 High School Fest is The Biggest School Themed Festival Ever! So, saatnya seru-seruan menikmati musik, main bareng, dan ngerasain kembali vibes sekolah dengan line up yang ga kalah asik dari tahun sebelumnya!! 28–29 November 2026, Stadion Madya GBK, Jakarta. DON’T MISS IT!', 'published', '[]', ''
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIGH SCHOOL FEST 2026'
WHERE o.email = 'demo.new-gen-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1 - (2 DAYS PASS) 28-29 November 2026', 180000, 1000, 100, '&lt;p&gt;DAY 1&lt;/p&gt;'
FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1 - (2 DAYS PASS) 28-29 November 2026');


-- fallback: events tanpa gallery pakai poster sebagai gallery
UPDATE events SET gallery = ('["' || replace(replace(poster_url, '\\', '\\\\'), '"', '\\"') || '"]')
WHERE gallery IS NULL OR gallery = '[]' OR gallery = ' ';

-- ============================================================
-- ENRICHMENT: real descriptions, galleries, seatmaps, benefits
-- ============================================================
UPDATE events SET description = 'Presenting…SYNC 2026: Luminaria!

SYNC is an annual event held by Saint John''s Catholic School BSD to celebrate the talent and skills of all the students of Saint John''s. From tireless practices to competitions, auditions to performances, we now end the event with a performance night. To wrap up SYNC 2026, we welcome our special guest star 

Adrian Khalif

 to perform in our closing pensi on September 12th.

SYNC 2026: Luminaria will also include a variety of food and beverage tenants to create a complete festival atmosphere. Families, students, alumni, and guests can enjoy the performances while exploring different F&B options around the venue.

This festival aims to bring the school community together, celebrate youth expression, and create a fun and welcoming environment for everyone.', terms_conditions = '1. Tiket yang valid adalah yang dibeli melalui Artatix.co.id

2. Satu tiket berlaku untuk satu orang.

3. Panitia/penyelenggara/promotor acara tidak bertanggung jawab/tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform yang bukan mitra resmi penjualan tiket "SYNC 2026: Luminaria”.

4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

5. Panitia/penyelenggara/promotor acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh pemerintah, panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

7. Panitia/penyelenggara/promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

8. Jika acara dibatalkan, promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.

10. Harap membawa kartu ID asli dan e-Ticket dari Artatix.co.id saat melakukan penukaran tiket.

11. Kami menyarankan agar para penonton tidak menggunakan kendaraan pribadi untuk datang ke acara SYNC 2026: Luminaria. Sekolah Saint John''s BSD hanya menyediakan tempat parkir ', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://share.google/ivWJyiadxRpgWRUOU"}' WHERE title = 'SYNC 2026 ''Luminaria''' AND venue = 'TBA';
UPDATE events SET description = 'Tentu kawan! Berikut deskripsi yang cocok untuk banner 

MLDSPOT Fresh Concert on Wheels

:

🎶 MLDSPOT Fresh Concert on Wheels

Lampung, 29 Agustus - Yogyakarta 12 September - Malang,19 September - Samarinda, 26 September

Saatnya menikmati pengalaman musik yang fresh dan seru bersama 

MLDSPOT Fresh Concert on Wheels!

 🚐🎶

Fresh Concert on Wheels hadir menyapa berbagai kota dengan membawa pertunjukan musik dan energi positif langsung ke tengah-tengah kamu. Saksikan penampilan musisi favorit dalam konsep konser yang unik, fun, dan penuh warna!

📍 

Lampung

 — 29 Agustus 2026

📍 

Yogyakarta

 — 12 September 2026

📍 

Malang

 — 19 September 2026

📍 

Samarinda

 — 26 September 2026

Dengan line-up spesial seperti 

Fiersa Besari, Feel Koplo, Ecko Show, Moluccan Soul, Last Child, IDGITAF, ENAU,

 dan 

Ndarboy

, siap-siap menikmati berbagai warna musik dalam satu rangkaian perjalanan konser yang nggak boleh dilewatkan.

🔥 

Fresh music, fresh vibes, fresh experience!

Jangan lewatkan keseruannya dan amankan tiketmu sekarang!

🎟️ 

Ticket available at Artatix

MLDSPOT Fresh Concert on Wheels — See you on the road!', terms_conditions = 'Satu Entry Pass berlaku untuk satu orang.

Penonton dengan kategori anak-anak dan atau dengan tinggi badan di atas 100 cm wajib menggunakan tiket.

Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform yang bukan mitra resmi penjualan tiket.

Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun memiliki bukti pembelian. Tiket merupakan tanggung jawab pembeli.

Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

Jika acara dibatalkan oleh Promotor, maka Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut, biaya administrasi yang timbul akan dibebankan ke pembeli, seperti : biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pembeli.

Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.

Harap membawa e-Ticket dari artatix.co.id saat melakukan penukaran tiket.

Promotor berhak untuk:

Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.

Melarang penonton masuk ke area MLDSPOT Fresh Concert On Wheels jika ', gallery = gallery, seatmap = '' WHERE title = 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND venue = 'TBA';
UPDATE events SET description = '🔥 The Story

Tidak semua orang berlari untuk menjadi yang tercepat.

Ada yang berlari untuk hidup lebih sehat, mencari ketenangan, bertemu orang-orang baru, atau sekadar menikmati setiap langkah. Apa pun alasanmu, setiap langkah selalu memiliki cerita dan setiap cerita layak untuk dirayakan.

Berangkat dari semangat tersebut, 

ARTEFAC UNS 2026

 berkolaborasi dengan 

Gendut Berlari

 menghadirkan:

ARTERUN: PACE OF JOY

Run Together. Share the Joy.

Arterun merupakan fun run 5K yang menjadi langkah awal menuju 

Closing Ceremony ARTEFAC UNS 2026

, festival tahunan yang memadukan kreativitas, olahraga, seni, musik, dan kebersamaan.

Bersama Gendut Berlari, kami percaya bahwa berlari bukan tentang siapa yang paling cepat mencapai garis finis, melainkan tentang keberanian untuk memulai, menikmati proses, dan menemukan kebahagiaan di setiap langkah.

Di lintasan ini, setiap peserta datang dengan cerita yang berbeda, tetapi pulang dengan semangat yang sama. Baik kamu pelari berpengalaman, baru memulai hobi berlari, maupun ingin menikmati pagi bersama orang-orang terdekat, 

kamu adalah bagian dari perjalanan ini.

Mari rayakan setiap langkah, temukan energi baru, dan jadikan Arterun sebagai awal perjalanan menuju kemeriahan 

ARTEFAC UNS 2026

.

Run with Joy.

Share the Journey.

Celebrate Every Step.

ARTERUN: PACE OF JOY

Every Pace. Every Story. Every Joy.

🏃 

Run Category

Kategori

: 5K Fun Run

Konsep

: Community Run

Rekomendasi Pace

:

Pace 8.30

Pace 10.30

Water Station

:

Tersedia 1 water station di KM 2.5

🎁 

Run Entitlements

Peserta akan mendapatkan:

Jersey peserta

Medali finisher

BIB Number

Refreshment

Entertaint after-run

Dokumentasi fotografer

Pengalaman berlari bersama Topik Sudirman

📍 

Event Details

🏁 Race Day

Hari/Tanggal

Sabtu, 12 September 2026

Jam Kumpul

05.00 WIB

Start – Finish

06.00 – 08.00 WIB

Lokasi Start & Finish

Lokananta Bloc

Jalan A. Yani Nomor 379 A, Kelurahan Kerten, Kecamatan Laweyan, Kota Surakarta (Solo), Jawa Tengah.

🎽 Race Pack Collection

Hari/Tanggal

Jumat, 11 September 2026

Waktu Pengambilan

15.00 – 20.00 WIB

Lokasi

To be Confirmed by Email

Kuota

300 peserta

Dresscode

Jersey peserta

Kontak Admin

082241560379', terms_conditions = 'Ketentuan Umum 

- Tiket resmi hanya dapat diperoleh melalui platform penjualan resmi yang ditunjuk oleh Panitia. (Artatix.id)

- Satu tiket hanya berlaku untuk satu peserta.

- Tiket yang telah dibeli tidak dapat dipindahtangankan, ditukar, ataupun diperjualbelikan kembali tanpa persetujuan Panitia.

- Tiket yang hilang maupun rusak menjadi tanggung jawab peserta.

- Peserta wajib menggunakan identitas asli yang sesuai dengan data registrasi.

- Dengan melakukan pembelian tiket, peserta dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan acara.

Ketentuan Peserta

- Fun Run bersifat non-kompetitif.

- Peserta disarankan berusia minimal 12 tahun. Peserta di bawah 17 tahun wajib berada dalam pengawasan orang tua atau wali.

- Peserta wajib berada dalam kondisi fisik yang sehat dan layak mengikuti kegiatan lari sejauh 5 kilometer.

- Peserta dengan riwayat penyakit jantung, gangguan pernapasan, atau kondisi medis tertentu disarankan berkonsultasi dengan tenaga medis sebelum mengikuti acara.

- Panitia berhak menghentikan peserta yang dinilai tidak layak melanjutkan kegiatan demi alasan keselamatan.

Race Pack

- Race Pack hanya dapat diambil sesuai jadwal yang diumumkan Panitia.

- Peserta wajib menunjukkan e-ticket beserta kartu identitas saat pengambilan Race Pack.

- Race Pack yang tidak diambil sesuai jadwal dianggap hangus dan tidak dapat dikirimkan setelah acara berlangsung.

Ketentuan Selama Acara

- Peserta wajib mengenakan BIB Number resmi selama mengikuti kegiatan.

- Peserta wajib mengikuti rute yang telah ditentukan.

- Dilarang memotong jalur (shortcut) maupun mengganggu peserta lain.

- Peserta wajib mematuhi arahan Race Marshal, Petugas Medis, dan Panitia.

- Peserta diwajibkan menjaga kebersihan dengan membuang sampah pada tempat yang telah disediakan.

- Demi keamanan bersama, peserta tidak diperkenankan membawa hewan peliharaan selama kegiatan berlangsung.

Barang yang Disarankan

- Handphone

- Smartwatch/GPS Watch

- Botol', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://maps.app.goo.gl/r1RabQeRGhDo3rcQ8?g_st=ic"}' WHERE title = 'ARTERUN x Gendut Berlari - Pace of Joy' AND venue = 'TBA';
UPDATE events SET description = 'After a completely sold out show in 2023, Men I Trust is finally returning to Jakarta for the Asia Tour 2026. Bringing along their newest album and signature dreamy sound, the beloved indie trio will take over Tennis Indoor Senayan on 12 November 2026 for a night of hypnotic melodies, intimate moments, and nostalgic energy.

Known for their atmospheric performances and fan-favorite tracks that have soundtracked listeners around the world, Men I Trust&rsquo;s return promises an even more special experience for Jakarta fans. Expect a set filled with both new songs and timeless favorites, wrapped in the band&rsquo;s warm and immersive live atmosphere.', terms_conditions = 'PERATURAN UMUM YANG BERLAKU

GENERAL TERMS AND CONDITIONS

 

Dilarang membawa makanan dan minuman dari luar area Konser, makanan dan minuman tersedia di dalam area Konser.

It is forbidden to bring food and drinks from outside the Concert area, food and drinks are available inside the Concert area.

 

Tidak diperkenankan merokok di dalam area konser Tennis Indoor. Merokok hanya diperbolehkan di area yang telah disediakan.

Smoking is not permitted inside the Tennis Indoor concert area. Smoking is only allowed in designated smoking areas.

 

BARANG-BARANG YANG DIPERBOLEHKAN :

ACCEPTABLE ITEMS:

 

Kamera non profesional

Non-professional flash / still cameras, handheld video devices (Sony Action Cam, GoPro, Polaroids, etc.)

 

Payung Lipat

Foldable umbrella

 

Rokok, rokok elektrik dan vape (dalam keadaan tersegel)

Cigarettes, E-cigs / vapes (in sealed condition)

 

Korek Api

Lighter

 

Tas kecil, ransel satu kompartemen, dan tas tangan/dompet (maksimum 30 cm x 30 cm). Terdapat layanan penitipan barang dengan biaya tambahan.

Small bags, single-compartment backpacks, and purses/handbags (maximum 30 x 30cm). A paid locker/storage service is available.

 

BARANG-BARANG TERLARANG:

PROHIBITED ITEMS:

 

Makanan dan minuman dari luar, makanan dan minuman tersedia di dalam venue.

Outside food or drinks. Food and drinks are available inside the venue.

 

Peralatan fotografi dan videografi professional

Professional photography / videography (with detachable lenses) and audio recording equipment. Point and shoot cameras and mobile phones are permitted.

 

Botol plastik, kaca dan kaleng. Botol air minum, tumbler dan botol parfum di perbolehkan.

Plastic bottles, glasses, and cans. Water bottles, tumblers and perfumes are permitted.

 

Narkoba, obat-obat terlarang dan benda-benda ilegal lainnya.

Drugs and illegal substances.

 

Rollerblade, sepeda, dan kendaraan personal lainnya.

Rollerblades, bicycles, and other personal vehicles.

 

Binatang atau hewan p', gallery = gallery, seatmap = '' WHERE title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival', 618000, 2200, 660, '<ul>
 <li>Standing</li>
 <li>Price exclude local tax, admin fee and platform fee</li>
</ul>' FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tribune A', 818000, 130, 129, '<ul>
 <li>Seating</li>
 <li>Price exclude local tax, admin fee and platform fee</li>
</ul>' FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tribune B', 718000, 925, 277, '<ul>
 <li>Seating</li>
 <li>Price exclude local tax, admin fee and platform fee</li>
</ul>' FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tribune C', 518000, 600, 180, '<ul>
 <li>Seating</li>
 <li>Price exclude local tax, admin fee and platform fee</li>
</ul>' FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Wheelchair-Friendly Access', 618000, 8, 2, '<ul>
 <li>Pembelian Tiket bundling diwajibkan dengan jumlah genap dan kelipatannya.</li>
 <li>Dua tiket dalam paket bundling ini diperuntukan bagi pengguna kursi roda dan pendamping.</li>
 <li>Pembeli tiket ini akan memiliki area menonton khusus yang dapat di akses oleh 1 pengguna kursi roda dan pendamping.</li>
 <li>Jika pada hari H pemilik tiket type wheelchair akses datang dengan tanpa menggunakan kursi roda, maka tiket akan secara otomatis dialihkan menjadi tiket festival normal.</li>
 <li>Price exclude local tax, admin fee and platform fee</li>
</ul>' FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'IdeaFest returns with a bold new theme: Rehumanize. A collective invitation to reconnect creativity with empathy, meaning, and real human connection in an increasingly fast-moving world.

Over 3 vibrant days, experience:

- 150+ inspiring sessions

- 500+ national & international speakers

- JKT GO SUPER CRAZY FESTIVAL

- IdeaFest X

- IdeaFriends Forum

And many more to be announced soon

More than a festival, IdeaFest 2026 is where ideas become conversations, communities become movements, and creativity becomes a force to bring people closer again. From culture, technology, business, to everyday human experiences. This is a space to rediscover what makes us human. Whether you''re a creator, innovator, entrepreneur, or culture enthusiast, this is your space to connect, collaborate, and reimagine the future together. Mark your calendar and be part of the movement.

Grab your ticket(s) now!', terms_conditions = 'All ticket purchases are final and non-refundable.

 
Tickets are valid only for the date(s) and category stated on the ticket.

 
Attendees must present a valid ticket (digital) and identification upon entry.

 
The organizer reserves the right to refuse entry or remove attendees who violate event rules or behave in a disruptive manner.

 
The organizer reserves the right to change the event schedule, speakers, programs, or venue arrangements without prior notice.

 
By attending the event, attendees consent to being photographed and recorded for documentation and promotional purposes.

 
Tickets purchased from unauthorized parties are the sole responsibility of the buyer and may be deemed invalid.

 
By purchasing and/or using an IdeaFest 2026 ticket, attendees agree to all applicable Terms & Conditions set by the organizer.', gallery = gallery, seatmap = '' WHERE title = 'IdeaFest 2026' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Promo BNI - Daily Pass IdeaTalks, Day 1', 200000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 <strong>Valid for BNI Card payments only</strong>⁠</li>
 <li>Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Promo BNI - Daily Pass IdeaTalks, Day 2', 200000, 500, 150, '<ul>
 <li><strong>Valid for BNI Card payments only</strong></li>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 ⁠Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Promo BNI  - Daily Pass IdeaTalks, Day 3', 200000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 <strong>Valid for BNI Card payments only</strong></li>
 <li>⁠Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Promo BNI - IdeaFriends Exclusive Member ', 1400000, 50, 15, '<ul>
 <li><strong>Valid for BNI Card payments only</strong></li>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Full 3-Day access to IdeaTalks with special ID access</li>
 <li>Access to VIP Lounge for exclusive networking opportunities</li>
 <li>Access to exclusive monthly IdeaFest events</li>
 <li>Complimentary freebies from partners (*if available)</li>
 <li>Access to recordings of selected IdeaTalks sessions</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular  - Daily Pass IdeaTalks, Day 1', 300000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular  - Daily Pass IdeaTalks, Day 2', 300000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular  - Daily Pass IdeaTalks, Day 3', 300000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'OTS  - Daily Pass IdeaTalks, Day 1', 350000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'OTS  - Daily Pass IdeaTalks, Day 2', 350000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'OTS  - Daily Pass IdeaTalks, Day 3', 350000, 500, 150, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFriends Exclusive Member ', 1500000, 100, 30, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 <span style="color:#0000FF;"><em>Full 3-Day access to IdeaTalks with special ID access</em></span></li>
 <li><span style="color:#0000FF;"><em>Access to VIP Lounge for exclusive networking opportunities</em></span></li>
 <li><span style="color:#0000FF;"><em>Access to exclusive monthly IdeaFest events</em></span></li>
 <li><span style="color:#0000FF;"><em>Complimentary freebies from partners (*if available)</em></span></li>
 <li><span style="color:#0000FF;"><em>Access to recordings of selected IdeaTalks sessi' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Bundle - IdeaTalks Day 3 X ESCAPE OFF AIR REGULER', 400000, 25, 7, '<p>
<style type="text/css"><!--br {mso-data-placement:same-cell;}-->
</style>
Bundle include:<br />
- Reguler - Daily Pass IdeaTalks, Day 3<br />
- IdeaFest X ESCAPE OFF AIR REGULER<br />
Ticket prices exclude platform fees and applicable taxes.</p>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaTalks Day 2 X Squid Game: The Experience', 550000, 300, 90, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Immerse yourself into Southeast Asia''s first licensed Netflix''s Squid Game: The Experience.</li>
 <li>Bundle include:
 <ul>
 <li>Reguler - Daily Pass IdeaTalks, Day 2</li>
 <li>Off-Peak Weekend Pass* for Squid Game: The Experience</li>
 </ul>
 </li>
</ul>

<p>*Squid Game: The Experience ticket valid from date of purchase until 16 November 2026.<br />
*Squid Game: The Experience ticket valid for Weekend Off-Peak schedule only, 10:00 AM&ndash;03:00 PM (75-minute session).</p>

<ul>
 <li>Ticket prices exclude ' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Squid Game Experience Jakarta - Voucher Code', 0, 300, 90, '' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X Merajut R(A)sa: The Art of Letting Go', 285000, 27, 26, '<ul>
 <li>[Saturday, September 5th 15.40-18.00 WIB].</li>
 <li>[Ticket prices exclude platform fees and applicable taxes].</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X Gobind Vashdev: Forced Mindfulness', 250000, 17, 16, '<ul>
 <li>[Saturday, September 5th 18.30-20.30 WIB].</li>
 <li>[Ticket prices exclude platform fees and applicable taxes].</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X ESCAPE OFF AIR VIP', 400000, 244, 73, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Sunday, September 6th 18.30-21.30 WIB</li>
 <li>Free Seating</li>
 <li>Including "Exclusive Challenge Card" from Escape</li>
 <li>Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X ESCAPE OFF AIR REGULER', 250000, 496, 148, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Sunday, September 6th 18.30-21.30 WIB</li>
 <li>Free Seating</li>
 <li>Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X ranum: Find Your SOUL, Find Your MATE', 229000, 25, 7, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Saturday, September 5th 17.00-19.00 WIB</li>
 <li>Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'IdeaFest X Grind Theory: The Wealth Ladder', 250000, 32, 31, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Saturday, September 5th 09.00-10.40 WIB</li>
 <li>Ticket prices exclude platform fees and applicable taxes.</li>
</ul>' FROM events ev WHERE ev.title = 'IdeaFest 2026' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'Melankolia di Medan', terms_conditions = 'Wajib 21+

1. Entry Pass yang valid adalah yang dibeli melalui artatix.co.id

2. Satu Entry Pass berlaku untuk satu orang.

3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket "MELANKOLIA DI MEDAN”.

4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

7. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

8. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.

10. Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.

11. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke event.

12. Promotor berhak untuk:

● Melarang penonton masuk jika Entry Pass t', gallery = gallery, seatmap = '' WHERE title = 'MELANKOLIA DI MEDAN' AND venue = 'TBA';
UPDATE events SET description = 'Black Rose, be ready to be part of The Rose''s long-awaited return to Jakarta and experience an unforgettable evening on the ROSETAPIA Tour to celebrate an evening of heartfelt music, unforgettable performances, and lasting memories. 

Following the overwhelming response to their previous performances, South Korean indie rock band The Rose (더로즈) is set to make their return to Jakarta with their ROSETOPIA World Tour on 23 October 2026 at The Kasablanka. 

Over the years, the band has established itself as one of Korea''s most acclaimed rock acts, earning international recognition for its distinctive sound, achieving commercial success with numerous releases, and building a dedicated global fanbase through award-winning music and captivating live performances. 

ROSETOPIA represents "where past and present coexist, where every song, every memory, and every moment comes full circle." It serves as a deeply meaningful milestone for both the band and their fans, Black Rose. ROSETOPIA has been described by the band as a celebration, and a shared dream before they pursue individual growth and projects as chance to pause, recharge, and eventually return stronger. 

For the latest updates and ticket information, follow @ckstar.id on Instagram.', terms_conditions = 'Dengan membeli tiket 
ROSETOPIA ASIA TOUR 2026 IN JAKARTA
 Pembeli telah menyetujui semua 
Syarat dan Ketentuan
 yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.

By purchasing a ticket for 
ROSETOPIA ASIA TOUR 2026 IN JAKARTA,

 
the Event Attendee has agreed to
 

all applicable 
Terms and Conditions
. All forms of violation of the terms and conditions will be dealt with strictly.
 

 

Kategori yang tersedia dan tempat penjualan adalah sebagai berikut;

therosejakarta2026.com 

 

DIAMOND (SEATED)

 

GOLD (SEATED)

 

SILVER (SEATED)

 

CAT 1 (STANDING)

 

CAT 2 (STANDING)

 

CAT 3 (STANDING)

 

Categories and ticketing website are as follows;
 

therosejakarta2026.com
 

 

DIAMOND (SEATED) 
 

 

GOLD (SEATED) 
 

 

SILVER (SEATED)
 

 

CAT 1 (STANDING)
 

 

CAT 2 (STANDING)
 

 

CAT 3 (STANDING) 

 

Semua harga belum termasuk Pajak Pemerintah dan belum termasuk Biaya Layanan lainnya.

All Prices exclude Government tax and Convenience fee.
 

 

 

Semua penjualan Tiket adalah final. Tiket yang telah dibeli tidak dapat ditukar, tidak dapat diuangkan kembali, ataupun dibatalkan.

All ticket sales are final. Purchased tickets cannot be exchanged, refunded, or canceled.

 

INFORMASI PEMBELIAN TIKET:
 
GENERAL SALE

TICKET PURCHASE INFORMATION: GENERAL SALE

 

 

 

Jadwal General Sale

General Sale Schedule

 

 

 

Hari / Tanggal : Rabu, 22 Juli 2026

Day / Date
 :
 Wednesday, 22 July 2026
 

 
Waktu : Pukul 12:00 WIB

Time

 :
 12:00 WIB
 

 
Tempat : 
therose

jakarta2026.com

Place

 :
 
therosejakarta2026.com

 

 

 
Pembelian tiket pada General Sale dapat dilakukan dengan beberapa metode pembayaran (virtual account dan kartu kredit).

Ticket purchases on General Sale can be made with several payment methods (virtual account and credit card).
 

 

 

 
Pembelian dengan menggunakan kartu kredit hanya dapat dilakukan dengan kartu kredit dengan sistem 3D Secure.

Credit card purchases can ', gallery = gallery, seatmap = '{"name":"NEW SEATING","image":"https://assets.loket.com/neo/production/images/seating_chart/20180110041207.png"}' WHERE title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND venue = 'Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'DIAMOND', 3950000, 286, 285, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Best available seat</li>
 <li>Soundcheck</li>
 <li>Group Photo 4:20</li>
 <li>Signed Poster</li>
 <li>Price Exclude Government Tax &amp; Convenience Fee</li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'GOLD', 3600000, 90, 89, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Best available seat</li>
 <li>Soundcheck</li>
 <li>Group Photo 4:20</li>
 <li>Price Exclude Government Tax &amp; Convenience Fee</li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'SILVER', 3300000, 90, 89, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 Best available seat</li>
 <li>Soundcheck</li>
 <li>Price Exclude Government Tax &amp; Convenience Fee</li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 1', 2200000, 1036, 310, '<ul>
 <li>Standing</li>
 <li>Price Exclude Government Tax &amp; Convenience Fee<span style="color:#0000FF;"><b> </b></span></li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 2', 1800000, 1099, 329, '<ul>
 <li>Standing</li>
 <li><meta charset="utf-8" />Price Exclude Government Tax &amp; Convenience Fee<span style="color:#0000FF;"><b> </b></span></li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 3', 1450000, 1000, 300, '<ul>
 <li>Standing</li>
 <li><meta charset="utf-8" />Price Exclude Government Tax &amp; Convenience Fee<span style="color:#0000FF;"><b> </b></span></li>
</ul>' FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'Jakarta Selatan';
UPDATE events SET description = 'Festival musik Moonverse akan diselenggarakan di Jakarta dengan menggabungkan musik, kolaborasi, kreatif dan tenant. Jakarta kali ini menjadi tujuan sebagai ajang gelaran perayaan pesta ambyar.

Festival musik ini akan diadakan di Jakarta yang akan dibungkus dengan beberapa penampilan eksklusif musisi dan band ternama Indonesia. Moonverse bakal menciptakan animo yang sangat luar biasa dan tentunya dari beberapa band lokal yang keren-keren juga.', terms_conditions = 'Entry Pass yang valid adalah yang dibeli melalui artatix.co.id

Satu Entry Pass berlaku untuk satu orang.

Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/ yang bukan mitra resmi penjualan tiket "Moonverse ”.

Tiket yang sudah dibeli tidak dapat dipindah tangankan atau dilakukan pengembalian uang (refund)

Tiket yang hilang karena dicuri tidak akan diganti atau diterbitkan ulang.

Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

Dalam keadaan keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.

Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.

Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke venue Moonverse .

Promotor berhak untuk:

Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://maps.app.goo.gl/UCK32cQyRMXRkP5G8"}' WHERE title = 'Moonverse Festival Vol  7' AND venue = 'TBA';
UPDATE events SET description = 'Ayo Fest 2026

 merupakan festival musik dan hiburan yang akan diselenggarakan pada Minggu, 20 September 2026 di Stadion Kridasana, Kota Singkawang. 

Festival ini menghadirkan penampilan artis ternama, local artist, serta berbagai hiburan menarik yang siap memberikan pengalaman festival yang meriah dan berkesan bagi seluruh pengunjung.

AYO FEST 2026 dirancang sebagai salah satu festival hiburan terbesar di Kota Singkawang dengan konsep modern, energik, dan penuh pengalaman menarik yang dapat dinikmati oleh semua kalangan.

Pembelian tiket resmi AYO FEST 2026 hanya tersedia melalui Artatix.co.id.', terms_conditions = 'Tiket resmi hanya dijual melalui platform yang ditunjuk oleh promotor, yaitu 

Artatix.co.id

. Promotor tidak bertanggung jawab atas segala bentuk penipuan atau kerugian akibat pembelian tiket melalui pihak lain di luar penjualan resmi

Satu Entry Pass berlaku untuk satu orang.

Maksimal pembelian 5 tiket dalam 1 kali transaksi

Ibu hamil tidak disarankan memasuki area venue Ayo Fest 2026

Anak-anak di bawah 10 tahun tidak disarankan memasuki area venue Ayo Fest 2026

Tiket bersifat pribadi dan tidak dapat dialihkan kepada pihak lain dalam kondisi apa pun, termasuk menggunakan surat kuasa dan sejenisnya

Setiap pemegang tiket bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya selama berada di area konser. Penyelenggara, sponsor, dan band tidak bertanggung jawab atas cedera, kerusakan, atau kehilangan yang mungkin terjadi selama atau di dalam acara

Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pe', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://share.google/dSwOc6AOvt6PF2CD9"}' WHERE title = 'Ayo Fest 2026' AND venue = 'TBA';
UPDATE events SET description = 'Next Gen(Re) Parenting
 hadir mengajak Ibu masa kini membuka pintu menuju masa depan terbaik Si Kecil. Dengan meninggalkan berbagai “
katanya
” dan lebih yakin membuat 
pilihan yang tepat
, mulai dari nutrisi hingga cara mendampingi tumbuh kembangnya. Karena pilihan Ibu hari ini menjadi awal dari masa depan terbaik mereka sebagai future leader.

Dikemas melalui beragam aktivitas interaktif dan experiential untuk Ibu & Si Kecil, setiap pengalaman menjadi langkah kecil untuk membuka potensi besar mereka.

Hadir pula Interactive Talkshow yang menghadirkan perspektif lengkap dari dokter, psikolog, dan mom, bersama:

dr. Hendra Wardhana, Sp.A (@bicarasikecil),

Indah Sundari Jayanti, S. Psi., M.Psi., Psikolog, 

Patricia Gouw. 

Ketiganya akan berbagi insight dan pengalaman dalam memahami nutrisi, tumbuh kembang, hingga bagaimana menjadi orang tua yang lebih yakin dalam mendampingi perjalanan Si Kecil.

Your Choice, Their Future.', terms_conditions = '1 tiket berlaku untuk 1 Orang Tua dan 1 Anak

Harga tiket termasuk:

Talkshow Eksklusif sesi “Next Gen(re) Parenting” bersama para Expert:

dr. Hendra Wardhana, Sp.A (@bicarasikecil),

Indah Sundari Jayanti, S. Psi., M.Psi., Psikolog, 

Patricia Gouw. 

Juga termasuk:

Experience & Play Area untuk Anak

Entertainment Performance

Snack & Makan siang

Eksklusif Gift dari Morinaga', gallery = gallery, seatmap = '' WHERE title = 'Next Gen(re) Parenting - Semarang' AND venue = 'Kota Semarang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Next Gen(re) Parenting - Semarang' AND ev.venue = 'Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Event Ticket', 120000, 31, 30, '' FROM events ev WHERE ev.title = 'Next Gen(re) Parenting - Semarang' AND ev.venue = 'Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Event Ticket', 150000, 178, 177, '' FROM events ev WHERE ev.title = 'Next Gen(re) Parenting - Semarang' AND ev.venue = 'Kota Semarang';
UPDATE events SET description = '“RIANG & CERIA”

 adalah festival musik menghadirkan suasana penuh warna yang membangkitkan nostalgia sekaligus menyalakan semangat baru. 

Terinspirasi dari era retro yang identik dengan kebebasan berekspresi dan keceriaan, event ini mengajak semua orang untuk merayakan cinta dengan cara yang berbeda, bukan untuk mengenang masa lalu, tapi untuk melangkah dengan senyuman baru.', terms_conditions = '1. Entry Pass yang valid adalah yang dibeli melalui artatix.co.id

2. Satu Entry Pass berlaku untuk satu orang.

3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket "Riang dan Ceria”.

4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

6.

 

minimal umur 13 tahun

7.

 

Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

8.

 

Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

9.

 

Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.

10.

 

Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.

11.

 

Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke "Riang dan Ceria”.

12.

 

Promotor berhak untuk:

* Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.

* Melarang penonton masuk ke area "Riang dan ceria” jika Entry Pass yang digunakan tidak valid.

* Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara', gallery = gallery, seatmap = '' WHERE title = 'Riang dan Ceria Jambi' AND venue = 'TBA';
UPDATE events SET description = 'Remember Fest x Cube Concert adalah festival musik dan hiburan tahunan yang menghadirkan pengalaman nostalgia dalam balutan konsep kreatif dan modern.

Mengusung tema "In Cinema" pada tahun 2026, Remember Fest x Cube Concert menggabungkan konser musik dari musisi papan atas Indonesia, aktivitas komunitas, area kuliner, hiburan keluarga, hingga pengalaman budaya seperti layar tancap, sehingga menciptakan momen yang berkesan.

bagi pengunjung dari berbagai kalangan selama dua hari penyelenggaraan di Open Space dan Gambir Expo Kemayoran, Jakarta.', terms_conditions = '1. Ticket Purchase and Redemption: Official tickets must be purchased through the authorized ticketing partner and are non-refundable. e-vouchers must be exchanged for wristbands upon presentation of a valid original ID (KTP/Driver''s License/Passport). 

2. Ticket Usage: Ticket can only be used 1 (one) time. Re-entry does not apply.

3. Wristband Usage: Access wristbands must be worn at all times while within the festival area. Organizers reserve the right to deny entry to visitors with damaged, broken, or unattached wristbands. 

4. Age Restrictions: Children under the age of 5 are admitted free of charge but must remain under the full supervision of a parent or adult guardian. 

5. Security Checks: All visitors are subject to body and bag checks by the security team before entering the venue. 

6. Prohibited Items: Bringing firearms or sharp weapons, narcotics, outside food or beverages, professional cameras or drones, glass bottles or cans, as well as political, SARA-related (sectarian/sensitive), or provocative items is strictly prohibited. 

7. Personal Responsibility: Visitors are responsible for any damage to, loss of, or theft of personal belongings during the event. 

8. Organizer Rights: Organizers reserve the right to deny entry to or remove visitors who violate rules or engage in illegal activities, without providing a ticket refund. 

9. Event Documentation: All visitors grant permission to the organizers to capture and use photos or videos as part of the documentation and promotional materials for Remember Fest 2026 x Cube Concert.', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://share.google/1bacEoT7MKWxQBb6f"}' WHERE title = 'Remember Fest 2026 X Cube Concert' AND venue = 'TBA';
UPDATE events SET description = 'SPH Superstar Series : Tolito Aguirre', terms_conditions = 'Proof of ID is a requirement for every ticket purchased

Wajib menunjukkan kartu identitas untuk setiap pembelian tiket

 
E-voucher can be exchanged at Social Padel House, Setiabudi on the date according to the ticket category.

E-voucher ini dapat ditukarkan dengan tiket asli di Social Padel House, Setiabudi di tanggal sesuai kategori tiket

 
Tickets are non-refundable

Tiket yang sudah dibeli tidak dapat dikembalikan

 
The Organizer/Promoter is not responsible for the negligence of the ticket buyer which results in the E-voucher/ticket falling into the hands of another person (in the control of another person) to be used as a sign of entry to the performance venue or to exchange a ticket which eliminates the buyer''s right to enter the performance venue/exchange the E-voucher.

Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.

 
Prohibited to bring food and drinks from outside into the venue.

Dilarang membawa makanan dan minuman dari luar ke dalam venue.

 
Prohibited to bring and use any illegal drugs, narcotics, psychotropics, or items containing other dangerous substances

Dilarang membawa dan menggunakan segala obat-obatan terlarang, narkoba, psikotropika, atau barang-barang yang mengandung zat berbahaya lainnya.

 
Prohibited to bring sharp weapons/firearms, explosives, and objects prohibited under applicable laws and regulations into the venue.

Dilarang membawa senjata tajam/api, bahan peledak, serta benda-benda yang dilarang berdasarkan ketentuan perundangan yang berlaku ke dalam venue.

 
We will have every right to refuse and/or discharge entry for ticket holders that does not meet the Term & Condition

Penyelenggara berhak untuk tidak memberikan izin untuk masuk ke dal', gallery = gallery, seatmap = '' WHERE title = 'SPH Superstar Series : Tolito Aguirre' AND venue = 'Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'SPH Superstar Series : Tolito Aguirre' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'EXHIBITION - 23 OCT 2026 [PRESALE]', 375000, 75, 22, '<ul>
 <li>Price exclude&nbsp;admin fee&nbsp;&amp; gov tax&nbsp;</li>
 <li>Children aged 5 and older must have a ticket. Children under 5 will be lap-seated and not assigned a seat.</li>
</ul>' FROM events ev WHERE ev.title = 'SPH Superstar Series : Tolito Aguirre' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'EXHIBITION - 24 OCT 2026 [PRESALE]', 375000, 75, 22, '<ul>
 <li>Price exclude&nbsp;admin fee&nbsp;&amp; gov tax&nbsp;</li>
 <li>Children aged 5 and older must have a ticket. Children under 5 will be lap-seated and not assigned a seat.</li>
</ul>' FROM events ev WHERE ev.title = 'SPH Superstar Series : Tolito Aguirre' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'EXHIBITION - 23 OCT 2026 [NORMAL]', 450000, 250, 75, '<ul>
 <li>Price exclude&nbsp;admin fee&nbsp;&amp; gov tax&nbsp;</li>
 <li>Children aged 5 and older must have a ticket. Children under 5 will be lap-seated and not assigned a seat.</li>
</ul>' FROM events ev WHERE ev.title = 'SPH Superstar Series : Tolito Aguirre' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'EXHIBITION - 24 OCT 2026 [NORMAL]', 450000, 250, 75, '<ul>
 <li>Price exclude&nbsp;admin fee&nbsp;&amp; gov tax&nbsp;</li>
 <li>Children aged 5 and older must have a ticket. Children under 5 will be lap-seated and not assigned a seat.</li>
</ul>' FROM events ev WHERE ev.title = 'SPH Superstar Series : Tolito Aguirre' AND ev.venue = 'Jakarta Selatan';
UPDATE events SET description = 'Menjelang akhir tahun, atmosfer perayaan selalu dinanti oleh masyarakat. Memanfaatkan momentum pergantian bulan di penghujung tahun ini, Kota Mojokerto siap menggebrak lewat sebuah gelaran megah bertajuk 

Semestambyar.

 Bukan sekadar konser biasa, Semestambyar hadir sebagai panggung selebrasi yang memadukan energi musik dangdut, kehangatan budaya lokal, dan geliat ekonomi kreatif masyarakat.

Namun, Semestambyar tidak hanya memanjakan telinga dan jiwa. Menyadari pentingnya menjaga stamina para penonton selama acara, konser ini terintegrasi langsung dengan pameran UMKM kuliner lokal. Pengunjung dapat menikmati aneka hidangan khas yang siap memanjakan lidah, memastikan kebutuhan logistik dan perut penonton tetap terpenuhi dengan baik di area festival.

Lebih dari sekadar panggung hiburan, Semestambyar mengemban misi besar untuk kemajuan daerah. Acara ini dirancang strategis sebagai ajang promosi pariwisata guna menarik wisatawan dari luar daerah untuk berkunjung dan mengenal lebih dekat potensi Kota Mojokerto. Melalui perputaran transaksi di lapak UMKM dan sektor pendukung lainnya, event ini ditargetkan menjadi motor penggerak untuk mendongkrak ekonomi wilayah, memberikan dampak nyata bagi kesejahteraan para pelaku usaha lokal.

Semestambyar adalah bukti nyata bagaimana hiburan dan pemberdayaan ekonomi dapat berjalan beriringan, membawa nama Kota Mojokerto semakin bersinar di peta pariwisata nasional.', terms_conditions = 'Syarat & Ketentuan

1. Tiket resmi hanya dijual melalui situs 

Semestambyar 

atau official ticketing partner yang ditunjuk oleh promotor 

(Artatix.co.id)

. Promotor tidak bertanggung jawab atas segala bentuk penipuan tiket yang dibeli dari pihak lain.

2. Satu Entry Pass berlaku untuk satu orang.

3. Maksimal pembelian 5 tiket dalam 1 kali transaksi

4. Ibu hamil tidak disarankan memasuki area venue 

Semestambyar

5. Tiket bersifat pribadi dan tidak dapat dialihkan kepada pihak lain dalam kondisi apa pun, kecuali menggunakan surat kuasa dan sejenisnya

6. Setiap pemegang tiket bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya selama berada di area konser. Penyelenggara, sponsor, dan band tidak bertanggung jawab atas cedera, kerusakan, atau kehilangan yang mungkin terjadi selama atau di dalam acara

7. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

8. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.

9. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

10. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

11. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

12. Panitia acara/p', gallery = gallery, seatmap = '{"name":"Venue Map","image":"https://maps.app.goo.gl/9jeqDEYbXqkJDcM69"}' WHERE title = 'SEMESTAMBYAR' AND venue = 'TBA';
UPDATE events SET description = 'Sirkuit indoor elektrik gokart pertama di Indonesia dengan kecepatan hingga 70km/jam menjadikan Barcode Gokart yang tercepat di Indonesia pada kelasnya yaitu Elektrik Gokart. Berada di dalam Mall Of Indonesia, menjadikan Barcode Gokart menjadi destinasi menarik untuk para antusias balap dan kecepatan di Indonesia. Barcode Gokart juga menjadi partner official dari SODI selaku penyedia brand Gokart yang mendunia dan menjamin keamanan baik dari track maupun kendaraan dan juga E SWS selaku penyelenggara event olahraga balap taraf internasional. Hal tersebut menjadi bentuk wujud keseriusan Barcode Gokart untuk bisa menjadi andil bagian dalam memajukan dunia Gokart di Indonesia.

Jam Operasional: 
 
- Buka Setiap Hari pukul 10.00 WIB - 22.00 WIB 
- Last Check In pukul 21.00 WIB 

Lokasi: 

Mall Of Indonesia, LG Floor. B 02B

FAQ:

1. Tiket Balap sudah termasuk apa saja dan berapa lama waktu yang di dapat dalam setiap sesi-nya?

Setiap 1 Tiket, pengunjung mendapatkan 1 Sesi bermain Gokart selama 7 menit. Pihak Barcode juga menyediakan Helm, jika diperlukan juga sepatu dan race suit khusus.

2. Apakah perlu menunjukan SIM pada saat masuk ke Barcode Gokart?

Untuk bermain di Barcode Gokart tidak memerlukan SIM khusus. Para pemain dipisahkan atau dikualifikasikan berdasarkan kelas dan aturan khusus setiap kelas nya.

3. Berapa usia minimal untuk bermain?

Usia minimal pada track anak adalah 3-8 tahun, sedangkan untuk Main Track usia minimal 8 tahun atau dengan syarat tinggi minimal 140 cm.

4. Berapa maximal berat badan untuk bermain?

Berat badan maximal untuk senior kart 120kg

5. Apakah akan ada tingkatan kelas yang dibagi dan syarat nya?

Pada main track, Barcode Gokart terbagi menjadi 3 kelas utama dengan perbedaan signifikan pada speed limit, yaitu :
- Beginner Boost (45km/h)
- Advance Boost (55km/h)
- Pro (70km/h)

Bagi Anda yang ingin mencoba pada 
level Advance Boost
, 
diwajibkan untuk memulai dari level Beginner Boost
 dalam satu sesi dan mendapatkan 
best lap minimal 37 detik
, untuk kemudian dapat melanjutkan pada level Advance.

Apabila Anda ingin mencoba
 level Pro
, Anda diwajibkan untuk melewati 
level Advance Boost
 terlebih dahulu dan mendapatkan 
best lap
 dengan catatan waktu
 28 detik
.', terms_conditions = 'Maksimal 
9 kart
 dalam satu sesi (durasi 7 menit).

 
Pengunjung yang bermain menggunakan 
Senior Kart
 wajib membuat 
Racer Name
, melakukan registrasi, serta mengisi 
waiver
 sebelum bermain. Seluruh data yang didaftarkan harus sesuai dengan identitas resmi.

 

Racer Name
 yang telah didaftarkan tidak dapat diubah maupun dipindahtangankan kepada orang lain.

 
Pengunjung diwajibkan hadir di area kasir 
minimal 30 menit sebelum jam sesi dimulai
.

 
Pembayaran yang telah dilakukan
 tidak dapat dikembalikan (non-refundable)
.

 
Tiket hanya berlaku pada 
tanggal kunjungan 
yang telah dipilih.

 
Pengambilan sesi bermain mengikuti antrean yang berlaku di kasir.

 
Pengunjung yang telah melakukan registrasi melalui 
Loket.com
 wajib menunjukkan 
e-ticket
 di counter kasir Barcode Gokart.

 
Wajib menggunakan 
helm full-face
 dengan standar 
Double D-Ring
.

 
Wajib menggunakan 
balaclava
.

 
Wajib menggunakan 
sepatu tertutup
.

 
Penggunaan 
sarung tangan
, 
neck support collar
, dan 
rib protector
 bersifat opsional.

 
Manajemen Barcode Gokart berhak menolak peserta yang dianggap tidak memenuhi standar keselamatan atau berpotensi membahayakan diri sendiri maupun orang lain.', gallery = gallery, seatmap = '' WHERE title = 'BARCODE GOKART' AND venue = 'Jakarta Utara';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'KIDS TRACK', 60000, 1000, 300, '<p>&bull; Usia 3 - 8 Tahun.<br />
&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BEGINNER BOOST', 175000, 1000, 300, '<p>&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ADVANCE BOOST', 250000, 1000, 300, '<p>&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.<br />
&bull; Anda diwajibkan untuk memulai dari level Beginner Boost dalam satu sesi dan mendapatkan best lap minimal 37 detik.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRO', 325000, 1000, 300, '<p>&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.<br />
&bull; Anda diwajibkan untuk melewati level Advance Boost terlebih dahulu dan mendapatkan best lap dengan catatan waktu 28 detik.</p>

<p>&nbsp;</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, '2 SESSION BUNDLING BEGINNER BOOST', 300000, 1000, 300, '<p>&bull; Tiket berlaku untuk 1 orang, bermain 2 sesi di hari yang sama.<br />
&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, '2 SESSION BUNDLING ADVANCED BOOST', 450000, 1000, 300, '<p>&bull; Tiket berlaku untuk 1 orang, bermain 2 sesi di hari yang sama.<br />
&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.<br />
&bull; Anda diwajibkan untuk memulai dari level Beginner Boost dalam satu sesi dan mendapatkan best lap minimal 37 detik.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, '2 SESSION BUNDLING PRO', 590000, 1000, 300, '<p>&bull; Tiket berlaku untuk 1 orang, bermain 2 sesi di hari yang sama.<br />
&bull; Harga tiket belum termasuk biaya admin fee dan platform fee.<br />
&bull; Anda diwajibkan untuk melewati level Advance Boost terlebih dahulu dan mendapatkan best lap dengan catatan waktu 28 detik.</p>' FROM events ev WHERE ev.title = 'BARCODE GOKART' AND ev.venue = 'Jakarta Utara';
UPDATE events SET description = 'Joyland Sessions returns in 2026 with another carefully curated weekend of music, culture, and immersive experiences.

Expect a genre-spanning lineup, special moments, and the signature Joyland atmosphere &mdash; all coming together for two unforgettable days in Jakarta.', terms_conditions = 'PERATURAN UMUM PENYELENGGARAAN EVENT

GENERAL TERMS AND CONDITIONS

 

Drinking station tersedia di area venue untuk pengisian ulang air minum. Mohon membawa tumbler pribadi Anda.

Refillable drinking stations are available throughout the venue for your convenience. We encourage all attendees to bring their own tumblers.

 

Merokok hanya diperbolehkan di area yang telah disediakan.

Smoking is only allowed in the areas provided.

 

BARANG-BARANG TERLARANG:

PROHIBITED ITEMS:

 

 

Makanan dan minuman dari luar, makanan dan minuman tersedia di dalam venue.

Outside food or drinks. Food and drinks are available inside the venue.

 

 

 

Peralatan fotografi, videografi professional dan drone.

Professional photography / videography (with detachable lenses), audio recording equipment and drone. 

 

 

 

Botol plastik, kaca dan kaleng.

Plastic bottles, glasses and cans.

 

 

 

Korek (Korek tersedia di area merokok).

Lighters (Lighters available in the smoking area).

 

 

 

Payung.

Umbrella.

 

 

 

Narkoba, obat-obat terlarang dan benda-benda ilegal lainnya.

Drugs and illegal substances.

 

 

 

Rollerblade, sepeda, dan kendaraan personal lainnya.

Rollerblades, bicycles, and other personal vehicles.

 

 

 

Senjata, benda tajam dan/atau benda mudah terbakar/meledak.

Weapons, sharp objects, and flammables.

 

 

 

Benda-benda yang memiliki potensi bahaya dan beracun.

Any other potentially hazardous and dangerous items.

 

 

BARANG-BARANG YANG DIPERBOLEHKAN :

ACCEPTABLE ITEMS:

 

 

Rokok (Rokok harus dalam keadaan tersegel saat memasuki area konser).

Cigarettes (cigarettes must be sealed upon entry)

 

 

 

Rokok Elektrik dan vape.

E-cigs / vapes.

 

 

 

Botol parfum, air minum dan tumbler diperbolehkan.

Perfume, Water bottles, and tumblers are permitted.

 

 

 

Kamera non profesional.

Non-professional flash / still cameras, handheld video devices (such as: Sony Action Cam, GoPro, Polaroids, etc.).

 

 

 

Jas hujan.

Rain pon', gallery = gallery, seatmap = '' WHERE title = 'Joyland Sessions 2026' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1: 2-DAY PASS', 588000, 480, 479, '<ul>
 <li>Price exclude local tax and admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 2: EARLY ENTRY - 2-DAY PASS', 688000, 120, 119, '<ul>
 <li>Price exclude local tax and admin fee</li>
 <li><span style="color:#FF0000;">Enter the venue before 15:00 WIB</span></li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 2: GENERAL ADMISSION - 2-DAY PASS', 788000, 480, 479, '<ul>
 <li>Price exclude local tax and admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 3: EARLY ENTRY - 2-DAY PASS', 888000, 240, 239, '<ul>
 <li>Price exclude local tax and admin fee</li>
 <li><span style="color:#FF0000;">Enter the venue before 15:00 WIB</span></li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 3: GENERAL ADMISSION - 2-DAY PASS', 988000, 950, 949, '<ul>
 <li>Price exclude local tax and admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 4: EARLY ENTRY 2-DAY PASS', 1088000, 288, 86, '<ul>
 <li>Price exclude local tax and admin fee</li>
 <li><span style="color:#FF0000;">Enter the venue before 15:00 WIB</span></li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 4: GENERAL ADMISSION - 2-DAY PASS', 1188000, 1152, 345, '<ul>
 <li>Price exclude local tax and admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (1 NIGHT) + 2 TIX 2-DAY PASS GA', 2680000, 20, 19, '<ul>
 <li>Check-in Period: 27 November 2026 - 29 November 2026</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li><strong>Package includes 2 tickets 2-day pass General Admission and 1 night stay</strong></li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (2 NIGHTS) + 2 TIX 2-DAY PASS GA', 3980000, 10, 9, '<ul>
 <li>Check-in Period: 27 November 2026 - 28 November 2026</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li><strong>Package includes 2 tickets 2-day pass General Admission and 2 night stay</strong></li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (3 NIGHTS) + 2 TIX 2-DAY PASS GA', 5280000, 10, 3, '<ul>
 <li>Check-in Period: 27 November 2026 only</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li><strong>Package includes 2 tickets 2-day pass General Admission and 3 night stay</strong></li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (1 NIGHT)+2 TIX PRESALE 3: 2DP GA', 3140000, 20, 6, '<ul>
 <li>Check-in Period: 27 November 2026 - 29 November 2026</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li><strong>Package includes 2 tickets 2-day pass General Admission and 1 night stay</strong></li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (2 NIGHTS)+2 TIX PRESALE 3: 2DP GA', 4440000, 10, 3, '<ul>
 <li>Check-in Period: 27 November 2026 - 28 November 2026</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li>Package includes 2 tickets 2-day pass General Admission and 2 night stay</li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ARTOTEL SENAYAN (3 NIGHTS)+2 TIX PRESALE 3: 2DP GA', 5740000, 10, 3, '<ul>
 <li>Check-in Period: 27 November 2026 only</li>
 <li>Check-in date will be confirmed by Plainsong team after ticket purchase</li>
 <li>Package includes 2 tickets 2-day pass General Admission and 3 night stay</li>
 <li>Price includes tax &amp; admin fees</li>
 <li>Package includes breakfast for 2 pax</li>
 <li>Room Type: Deluxe Room</li>
</ul>' FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = '🎤 Nyanyian Fest Subang 2026

Saatnya merayakan musik, kebersamaan, dan euforia dalam satu festival yang penuh warna! 

Nyanyian Fest

 hadir di 

Subang

 untuk menghadirkan pengalaman seru bagi para pecinta musik dari berbagai kalangan.

Nikmati penampilan musisi-musisi pilihan, bernyanyi bersama ribuan penonton, dan rasakan atmosfer festival yang hangat serta penuh energi. Nyanyian Fest bukan sekadar konser, tetapi sebuah perayaan yang menyatukan orang-orang melalui musik, cerita, dan momen yang tak terlupakan.

Baik datang bersama sahabat, pasangan, maupun keluarga, bersiaplah menciptakan kenangan terbaik di salah satu festival musik yang paling dinantikan di Subang.

📅 

Tanggal:

 24 Oktober 2026

📍 

Lokasi:

 Subang

🎟️ 

Tiket tersedia di Artatix

Jangan lewatkan kesempatan untuk menjadi bagian dari kemeriahan 

Nyanyian Fest Subang 2026

. Siapkan suaramu, ajak orang-orang terdekat, dan nikmati hari penuh musik, kebahagiaan, serta pengalaman yang akan selalu dikenang.

#NyanyianFest #NyanyianFestSubang #Subang #FestivalMusik #LiveMusic #Artatix', terms_conditions = 'Jika kamu melakukan pembelian tiket acara ini, maka dianggap sudah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan dari acara.

Tiket Masuk / Entry Pass yang valid adalah yang dibeli melalui artatix.co.id.

Satu Tiket Masuk / Entry Pass berlaku untuk satu orang.

Disarankan tidak meng-upload E-Ticket / Entry Pass di media sosial untuk menghindari duplikasi.

Panitia dan Promotor tidak bertanggung jawab / tidak ada penggantian kerugian atas pembelian tiket acara melalui calo / tempat / kanal / platform yang bukan mitra resmi penjualan tiket “Nyanian Fest”

Penyelenggara tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk digunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke area acara untuk menukarkan e-tiket. 

Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

Harga sudah termasuk Pajak.

Harga belum termasuk biaya layanan artatix.co.id

Tiket yang sudah dibeli tidak dapat dikembalikan dan 

non-refundable

. 

Dalam keadaan-keadaan kahar / darurat seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.

Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua ar', gallery = gallery, seatmap = '' WHERE title = 'Nyanyian Fest Subang 2026' AND venue = 'TBA';
UPDATE events SET description = 'Petrick Kluivert Piano Recital presents an intimate evening of classical piano, featuring works by R. Schumann, J. Brahms, F. Chopin, and S. Rachmaninoff.

This recital explores the many shades of becoming: innocence, longing, inner conflict, tenderness, and emotional maturity. Through Schumann&rsquo;s Abegg Variations, Brahms&rsquo; Klavierst&uuml;cke Op. 76, Chopin&rsquo;s Polonaise-Fantaisie Op. 61, and Rachmaninoff&rsquo;s Piano Sonata Op. 36 No. 2, Petrick invites the audience into a musical journey shaped by lyricism, virtuosity, and deep personal reflection.

Born in the 90''s, Petrick began studying piano at the age of 9. He trained under Imelda and Teo Minaroy before continuing his studies at Yayasan Pendidikan Musik Jakarta, including the Pre-Conservatory Program, under the guidance of renowned Indonesian pianists Gita Bayuratri, Levi Gunardi, and Aisha Sudiarso Pletscher. He later continued private studies with Iswargia Renardi Sudarno, acclaimed Indonesian pedagogue, conductor, and Director of Jakarta Conservatory of Music.

During his musical journey, Petrick received several recognitions, including the YPM Young Artist Award in 2015 and 2017, The Most Outstanding Performance Award from 2013 to 2015, 1st Prize at Bandung National Piano Competition, Finalist at Jakarta Conservatory of Music Boston Piano Competition, and Grand Finalist at Indonesia Steinway Youth Piano Competition. He has also participated in masterclasses with distinguished musicians, including German pianist and pedagogue Josef Anton Scherrer.

Join Petrick for an evening of powerful, poetic, and deeply expressive piano music at Balai Recital Kertanegara.', terms_conditions = '1 e-ticket (1 barcode) is only applicable to 1 person.

The barcode on the ticket will be used as an entrance pass. 

The E-ticket/E-Voucher can be screen-captured or printed out. If you choose to screen-capture, make sure the barcode on your phone looks clear. 

By purchasing this ticket, you have agreed to the personal data collection, storage, and usage for the recital purposes. 

There is a maximum of 5 tickets purchasable per transaction.  

It is forbidden to bring sharp items, firearms, drugs, and pets into the recital. 

Please remain silent during the recital. If you need to leave the hall, kindly do so only between pieces or during the intermission.

A purchased ticket 
can''t 
be returned. 

The attendee is advised to come at least 20 minutes before the recital starts. When the recital starts, the late attendees will only be allowed to enter during the gap between songs.

Attendees must be at least 6 years old. Children should be accompanied by a guardian who can ensure they remain silent throughout the recital.

You may inquire any information regarding the ticket purchase by contacting the Loket.com call center at 
support@loket.com
 or +62-21-8060-0822.', gallery = gallery, seatmap = '{"name":"BALAI RESITAL KERTANEGARA","image":"https://assets.loket.com/neo/production/images/seating_chart/20260626125711_6a3e14b7908da.jpeg"}' WHERE title = 'Piano Recital by Petrick Kluivert' AND venue = 'Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Piano Recital by Petrick Kluivert' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Diamond Category', 550000, 53, 15, '' FROM events ev WHERE ev.title = 'Piano Recital by Petrick Kluivert' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Platinum Category', 400000, 123, 36, '' FROM events ev WHERE ev.title = 'Piano Recital by Petrick Kluivert' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold Category', 300000, 127, 38, '' FROM events ev WHERE ev.title = 'Piano Recital by Petrick Kluivert' AND ev.venue = 'Jakarta Selatan';
UPDATE events SET description = 'The Oldest and Biggest Student-Led Festival, The 49th Jazz Goes to Campus is Back!

As the longest-running student-led jazz festival in Indonesia, we are returning with even greater energy. This year marks a monumental milestone as we take our final step before the golden anniversary of Jazz Goes to Campus.

Carrying the theme "Resonating Jazz Through Every Soul", we invite you to a festival where music transcends boundaries. Expect a diverse lineup of legendary musicians and rising stars, delivering the true spirit of jazz directly to the iconic campus grounds. Be part of the legacy and witness the biggest celebration of music, community, and freedom of expression.

Date: 8th November 2026

Location: FEB UI CAMPUS GROUND

Regular Tickets are open for Presale 2

Get your tickets now only on Loket.com!

See you on 8th November 2026, Jazzmates!', terms_conditions = 'Benefits

Terms & Conditions

Satu tiket hanya berlaku untuk 1 (satu) orang

Semua pengunjung berusia di atas 5 (lima) tahun wajib memiliki tiket untuk dapat memasuki area festival The 49th Jazz Goes to Campus.

Tiket hanya dapat dibeli melalui website resmi jgtcfestival.com atau Loket.com

Harga tiket yang tertera belum termasuk platform handling fee dan local tax.

Tiket tidak dapat dikembalikan (NON-REFUNDABLE) setelah pembelian.

Setiap email hanya diperbolehkan membeli maksimal 10 tiket per transaksi 

Saat penukaran tiket (ticket exchange), pengunjung wajib membawa kartu identitas resmi (seperti KTP, SIM, atau Kartu Pelajar) dan E-Ticket sebagai bukti pembelian.

Pengunjung diimbau menjaga kebersihan, menggunakan fasilitas umum dengan bijak, dan mengikuti protokol kesehatan yang berlaku pada saat acara berlangsung.

Tidak tersedia layanan penitipan barang di area acara. Pengunjung disarankan membawa barang seperlunya dan bertanggung jawab atas barang pribadinya masing-masing.

Panitia tidak bertanggung jawab atas kehilangan barang pribadi selama acara.

Panitia berhak melakukan pemeriksaan terhadap barang bawaan pengunjung demi menjaga keamanan dan kenyamanan acara.

Barang-barang yang dilarang dan disita oleh panitia selama acara berlangsung tidak dapat dikembalikan dalam kondisi atau alasan apa pun.

Pengunjung wajib mematuhi seluruh ketentuan mengenai barang bawaan yang berlaku selama acara berlangsung.

Penyelenggara tidak bertanggung jawab atas tiket yang dibeli di luar platform resmi (termasuk melalui calo, reseller tidak resmi, dan pihak ketiga lainnya)

Tiket yang rusak (misalnya QR code tidak terbaca), hilang, dicuri, atau telah digunakan sebelumnya tidak akan digantikan dengan tiket baru dalam bentuk apapun oleh penyelenggara.

Pengunjung bertanggung jawab penuh atas keamanan dan validitas tiket miliknya masing-masing.

Penyelenggara tidak melayani penggantian tiket dalam kasus kerusakan, kehilangan, atau duplikasi akibat kelalaian pembeli.

Dalam ha', gallery = gallery, seatmap = '' WHERE title = 'The 49th Jazz Goes to Campus' AND venue = 'Kota Depok';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Kota Depok';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 2 Reguler', 175000, 4500, 1350, '' FROM events ev WHERE ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Kota Depok';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 2 GOLD', 400000, 350, 105, '' FROM events ev WHERE ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Kota Depok';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 2 VIP', 535000, 250, 75, '' FROM events ev WHERE ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Kota Depok';
UPDATE events SET description = 'Tiffany Young: Edge of Calm Tour in Jakarta
Celebrating the 10th anniversary of her solo debut, Tiffany Young is finally set to reunite with fans through the Tiffany Young: Edge of Calm Tour in Jakarta.

A decade of music, unforgettable performances, and Tiffany Young''s most heartfelt stories come together in a special concert created just for this milestone.

Jakarta will be one of the special stops on this Asia tour, bringing fans closer to Tiffany Young for a long-awaited reunion filled with unforgettable moments, heartfelt performances, and new memories to cherish together

On September 19, 2026, join Tiffany Young in Jakarta to create unforgettable memories on the Tiffany Young: Edge of Calm Tour💗.

Tiffany Young: Edge of Calm Tour in Jakarta
📅 Show Date : 19 September 2026 (Sat)
🕕 Show Time : 7PM
🎭 Venue: JIEXPO Theatre
🎫 Ticket Price : 2,000,000 / 2,550,000 / 3,250,000
🪧 Organizer: EarendelWorks & Flabbergast Productions
🏷 Artist Management: Pacific Music Group
📢 Ticket Sales: 29 July 2026
🕚 Sales Open : 2:00 PM WIB
🎟 Ticketing Platform: LOKET

📌 Please refer to the organizer''s official announcements for further details
📌 The organizer reserves the right to make changes to the event without prior notice

TICKET INFORMATION
VIP (Seated): IDR 3,250,000
CAT R (Seated): IDR 2,550,000
CAT S (Seated): IDR 2,000,000
CAT A (Seated): IDR 1,500,000
CAT B (Seated): IDR 950,000

Ticket Sales:
29 July 2026, 2:00 PM WIB
Exclusively via Loket.

Ticket prices are excluding applicable taxes and platform/service fees.

OFFICIAL LINKS
Instagram: 
tiffanyyoungofficial

Spotify: 
Tiffany Young

Youtube: 
Tiffany Young

EVENT TERMS & CONDITIONS
- Ticket holders must follow all event regulations set by the promoter and venue.
- Tickets that have been purchased cannot be exchanged or refunded.
- The promoter is not responsible for tickets purchased outside the official ticketing platform.
- Fan benefits are only valid for eligible ticket categories and must follow the official event flow.
- Professional cameras, recording equipment, and livestreaming are not allowed unless officially approved.
- The promoter has the right to make adjustments to the event flow when necessary for safety, security, or operational reasons.

ADMISSION RULES
Rating / Age Limit
- Rating: General
- No admission for infants in arms and children below 7 years old
- Children 7 years and above must purchase a ticket for entry
- Admission is subject to tickets produced at the entrance

Accessibility Info
- Please be advised there are steps leading to most seats in the auditorium.
- Designated wheelchair accessible seating is available.
- Wheelchair users: please send the request to support@loket.com or +62 2130003160', terms_conditions = 'Terms & Conditions

Dengan membeli tiket 

Tiffany Young: Edge of Calm Tour in Jakarta

,

 Pembeli telah menyetujui semua Syarat dan Ketentuan yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.

By purchasing a ticket for 

Tiffany Young: Edge of Calm Tour in Jakarta

, the Event Attendee has agreed to all applicable Terms and Conditions. All forms of violation of the terms and conditions will be dealt with strictly.

Kategori yang tersedia dan tempat penjualan tiket akan diumumkan melalui kanal resmi Penyelenggara.

Categories and official ticketing platform will be announced through the Promoter&rsquo;s official channels.

Semua harga belum termasuk Pajak Pemerintah dan belum termasuk Biaya Layanan lainnya. 

All Prices exclude Government tax and Convenience fee.

 

Kategori tiket yang tersedia adalah sebagai berikut:

Categories and ticketing website are as follows:

VIP (SEATED)

CAT R (SEATED)

CAT S (SEATED)

CAT B (SEATED)

CAT A (SEATED)

Semua penjualan tiket bersifat final. Tiket yang sudah dibeli tidak dapat ditukar, dikembalikan, atau dibatalkan.

All ticket sales are final. Purchased tickets cannot be exchanged, refunded, or canceled.

INFORMASI PEMBELIAN TIKET:
 
GENERAL SALE

 

TICKET PURCHASE INFORMATION: GENERAL SALE

Jadwal General Sale
 

General Sale Schedule

 

Hari / Tanggal 
 
: Rabu, 29 Juli 2026

Day / Date

 

: Wednesday, 29 July 2026

Waktu 
 
: Pukul 14:00 WIB 

Time

 

: 14:00 WIB

Pembelian tiket pada General Sale dapat dilakukan dengan beberapa metode pembayaran (virtual account dan kartu kredit).

Ticket purchases on General Sale can be made with several payment methods (virtual account and credit card).

 1 akun hanya dapat membeli maksimum 4 (empat) tiket di kategori lain per akun. Akun dengan NIK, alamat email dan nomor telepon yang sama tidak bisa melakukan pembelian berulang. 

Each account may purchase a maximum of 4 (four) tickets in other categories per account. Ac', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-26_893233437ce5f633279849276a4e91689a2b8d10bed372c43c1d91179c5d0edd.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-08-26_4aa634b7691711ae385497ea96879c2bb30e1c3acfb8c118cccaf053a29a67d4.webp"]', seatmap = '' WHERE title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP (Seated)', 3250000, 502, 150, '<ul>
 <li>Price exclude tax, service fee and platform fee</li>
 <li>Soundcheck</li>
 <li>City Exclusive Photocard</li>
 <li>Early access to Merch</li>
 <li>Official Lanyard</li>
 <li>Official Photocard</li>
 <li>Official Poster</li>
 <li>Show Ticket</li>
</ul>' FROM events ev WHERE ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT R (Seated)', 2550000, 613, 183, '<ul>
 <li>Price exclude tax, service fee and platform fee</li>
 <li>Soundcheck</li>
 <li>City Exclusive Photocard</li>
 <li>Early Access to Merch</li>
 <li>Offical Lanyard</li>
 <li>Official Photocard</li>
 <li>Official Poster</li>
 <li>Show Ticket</li>
</ul>' FROM events ev WHERE ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT S (Seated)', 2000000, 448, 134, '<ul>
 <li>Price exclude tax, service fee and platform fee</li>
 <li>Official Lanyard</li>
 <li>Official Photocard</li>
 <li>Official Poster</li>
 <li>Show Ticket</li>
</ul>' FROM events ev WHERE ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT A (Seated)', 1500000, 507, 152, '<ul>
 <li>Price exclude tax, service fee and platfom fee</li>
 <li>Hi-bye 10 winner</li>
 <li>Q&amp;A, Attendance Check (only attending), Sound Check 30 winner&nbsp;Official Lanyard ALL</li>
 <li>Official Photocard ALL</li>
 <li>Official Poster ALL</li>
 <li>Show Ticker ALL</li>
</ul>' FROM events ev WHERE ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT B (Seated)', 950000, 315, 94, '<ul>
 <li>Price exclude tax, service fee and platform fee</li>
 <li>Official Photocard 100 winner</li>
 <li>Official Poster ALL</li>
 <li>Show Ticker ALL</li>
</ul>' FROM events ev WHERE ev.title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'FEEL YOUR PAPUA (FYP) ADALAH KONSER MUSIK DI TANAH PAPUA YANG MENGHADIRKAN SEJUMLAH TALENT/PERFORMER BERLATAR BELAKANG KULTUR INDONESIA TIMUR. KONSER INI BERTUJUAN MEMBERIKAN PANGGUNG BESAR BAGI TALENTA-TALENTA TIMUR TERUTAMA PAPUA UNTUK BERANI TAMPIL MENGHIBUR DIATAS PANGGUNG YANG LEBIH BESAR.

HAL INI DIMAKSUDKAN SEBAGAI TRIGER UNTUK PERKEMBANGAN MUSIK DI TANAH PAPUA SEKALIGUS MAMPU MENJADI MOTOR PENGGERAK EKONOMI DI SEKTOR INDUSTRI KREATIF.', terms_conditions = 'Entry Pass yang valid adalah yang dibeli melalui artatix.co.id

Pembayaran Hanya di Artatix. Tidak ada pembayaran melalui rekening pribadi. Jika membayar ke rekening lainnya, maka diluar tanggungjawab Panitia dan Promotor

Setiap tiket berlaku untuk 1 (satu) orang dan tidak berlaku multiple entry (bolak balik) masuk ke area konser FEEL YOUR PAPUA (FYP).

Panitia dan Promotor tidak bertanggung jawab / tidak ada penggantian kerugian atas pembelian tiket acara melalui calo / tempat / kanal / platform yang bukan mitra resmi penjualan tiket

Tiket yang hilang / dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.

Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan atau waktu lain.

Konser ini tidak diperkenankan membawa balita. Usia menonton wajib diatas 10 tahun

Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia / penyelenggara / promotor berhak untuk membatalkan dan atau merubah waktu acara dan atau tata letak tempat tanpa pemberitahuan sebelumnya.

Panitia / Penyelenggara / Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.

Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.

Panitia acara / penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acar', gallery = gallery, seatmap = '' WHERE title = 'FEEL YOUR PAPUA - SORONG' AND venue = 'TBA';
UPDATE events SET description = 'Dakwah berisi proses kembali ke jalan yang lurus Pandji Pragiwaksono bersama Ustad Felix Siauw, dengan juga menambahkan penampilan stand up comedy. Dikemas dengan mudah, menyenangkan dan tentunya menghibur.

Selain Pandji Pragiwaksono dan Ustadz Felix Siauw, akan ada pengisi acara lain yang berasal dari Stand up Comedian dan YukNgaji.', terms_conditions = 'Dengan membeli tiket show
 PutBal Comedy Show
, Pembeli telah menyetujui semua Syarat dan Ketentuan yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.

KETENTUAN UMUM

Tiket offline hanya dapat dibeli melalui website loket.com. Tiket dapat digunakan untuk masuk ke area 
“PutBal Comedy Show"

Semua harga belum termasuk Pajak Hiburan Daerah 10% dan belum termasuk Biaya Admin 2.22% dan biaya lainnya.

Mohon siapkan data diri lengkap (nama sesuai identitas, nomor identitas, email & nomor HP) sebelum melakukan pembelian tiket.

1 (satu) transaksi bisa beli maksimal 1 (satu) tiket wajib dengan data diri yang berbeda.

Tiket berlaku untuk 1 (satu) orang Pemegang Tiket, untuk 1 (satu) kali masuk ke area acara.

Nama sesuai dengan kartu identitas yang sah bersifat wajib untuk membeli tiket show "PutBal Comedy Show". Pastikan Anda melakukan pembelian Tiket dengan menggunakan data Anda yang sah dan benar (Kartu Identitas/KK/KTP/SIM/Paspor). Tiket Anda tidak dapat diubah dan/atau dimodifikasi setelah pembelian sudah dilakukan.

Tiket dijual secara langsung oleh Promotor ke konsumen. Tiket apapun yang dibeli oleh pelaku usaha atau pedagang yang melanggar Syarat & Ketentuan penjualan tiket akan dibatalkan. Dengan menerima syarat dan ketentuan ini, Anda mengkonfirmasi bahwa Anda adalah konsumen.

Tiket tidak dapat digunakan untuk keperluan komersial, termasuk namun tidak terbatas kepada hadiah, kompetisi, kontes, atau undian. Tiket yang dijual atau digunakan dengan melanggar persyaratan ini dapat dibatalkan tanpa pengembalian dana, dan Pemegang Tiket akan ditolak masuk ke dalam area acara tanpa terkecuali. Penyelenggara tidak bertanggung jawab atas kelalaian Pembeli Tiket yang mengakibatkan Tiket jatuh ke tangan orang lain dan dipergunakan sebagai tanda masuk, sehingga menghilangkan hak Pembeli Tiket untuk masuk ke area acara.

Semua penjualan Tiket adalah final. Tiket yang telah terjual tidak dapat ditukar dan tidak dapat d', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-01_0b18c9b82053ef3346d262f43c623066dcf9baf4471b400f004fdc3e83ad7267.webp"]', seatmap = '' WHERE title = 'Putbal Comedy Show' AND venue = 'DKI Jakarta';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pre Sale Silver', 150000, 100, 99, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya.' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pre Sale Gold', 250000, 100, 99, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Discount 5% Official Merchandise PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pre Sale Platinum', 350000, 142, 141, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Tagging Seat
- Discount 5% Official Merchandise PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pre Sale Diamond', 500000, 40, 39, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Tagging Seat
- Best View
- Disc 10% Official Merch PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal Silver', 275000, 210, 209, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya.' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal Gold', 375000, 45, 44, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Discount 5% Official Merchandise PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal Platinum', 475000, 201, 60, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Tagging Seat
- Discount 5% Official Merchandise PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal Diamond', 600000, 66, 65, '- Harga tiket belum termasuk pajak hiburan dan biaya lainnya
- Soundcheck Access
- Tagging Seat
- Best View
- Disc 10% Official Merch PutBal' FROM events ev WHERE ev.title = 'Putbal Comedy Show' AND ev.venue = 'DKI Jakarta';
UPDATE events SET description = 'Untuk pertama kalinya di Surabaya, Hillsong Worship hadir sebagai bagian dari Asia Tour 2026. Sebuah malam istimewa yang akan menyatukan ribuan hati dalam pujian dan penyembahan melalui lagu-lagu yang telah menjadi berkat bagi jutaan orang di seluruh dunia. Nikmati secara langsung lagu-lagu ikonik seperti What A Beautiful Name, Oceans (Where Feet May Fail), Who You Say I Am, Cornerstone, dan King of Kings dalam sebuah pengalaman worship yang penuh sukacita, pengharapan, dan inspirasi. Malam istimewa ini akan menjadi pengalaman yang tak terlupakan bagi ribuan jemaat, keluarga, dan komunitas Kristen yang akan berkumpul bersama dalam satu hati untuk memuji dan menyembah Tuhan.', terms_conditions = 'Hillsong Worship Nights Asia Tour Surabaya

 

Kapan dan di mana acara akan diadakan?

 

Hillsong Worship Nights Asia Tour Surabaya akan diadakan pada 11 September 2026 di Graha Unesa, Surabaya.

 

Kapan dan di mana penjualan tiket dimulai?

 

26 Juni 2026 mulai pukul 11.59 WIB

 

Tiket dapat dibeli melalui hillsongworshipsby.com dan juga melalui website loket.com

 

Mohon untuk tidak membeli tiket dari pihak lain selain outlet resmi yang disebutkan di atas. Pihak promotor tidak bertanggung jawab atas segala bentuk penipuan terkait tiket yang dibeli dari sumber tidak resmi
.

 

Berapa jumlah maksimal tiket yang bisa dibeli per transaksi?

 

Maksimal 8 tiket per transaksi.

 

Apakah saya bisa memilih nomor kursi untuk kategori VIP, Platinum, Gold, dan Silver?

 

Tidak. Nomor kursi akan ditentukan secara otomatis oleh sistem berdasarkan tanggal dan waktu pembelian tiket. Nomor Kursi akan tersedia di e-ticket anda paling lambat 5 hari sebelum acara.

 

Apakah kategori Festival akan mendapatkan nomor antrian?

 

Tidak. Kategori Festival adalah free standing dan tidak memiliki nomor antrean.

 

Apakah saya harus mengisi data diri saat membeli tiket?

 

Ya. Anda perlu mengisi data pribadi sesuai kartu identitas untuk keperluan verifikasi saat penukaran tiket. Pastikan email dan kartu identitas masih aktif dan valid.

 

Apakah saya bisa mengubah kategori tiket atau mengajukan refund?

 

Tidak. Semua tiket yang sudah dibeli tidak dapat diubah, ditukar, atau dikembalikan dalam kondisi apa pun.

 

Apakah ada batasan usia untuk menonton konser ini?

 

Tidak ada.

 

Anak usia di atas 4 tahun wajib memiliki tiket dan harus didampingi orang tua/wali.

 

Anak usia di bawah 4 tahun boleh masuk tanpa tiket jika dipangku. Jika ingin duduk sendiri, maka wajib membeli tiket. Kategori Festival tidak disarankan untuk anak-anak.

 

Bagaimana ketentuan pembelian tiket untuk pengguna kursi roda/disabilitas?

 

Akses untuk pengguna kursi roda tersedia di kategori Festiva', gallery = gallery, seatmap = '{"name":"Unesa 2026-09-02 14:49","image":"https://assets.loket.com/neo/production/images/seating_chart/20180110041207.png"}' WHERE title = 'Hillsong Worship Nights Asia Tour Surabaya' AND venue = 'Graha Unesa Surabaya, Kota Surabaya';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL (STANDING)', 750000, 1442, 432, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP (NUMBERING SEATING)', 1250000, 1949, 584, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PLATINUM (NUMBERING SEATING)', 990000, 344, 343, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'GOLD (NUMBERING SEATING)', 750000, 444, 443, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'SILVER (NUMBERING SEATING)', 550000, 585, 584, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya';
UPDATE events SET description = 'STASHEDTHEJAZZ REUNION

ONCE UPON A JAZZ — Vol. 02

Standards from Your Favorite Classic Movies

StashedTheJazz returns for an intimate evening of jazz, bringing together timeless standards from beloved classic movies in a sophisticated rooftop setting at SunBreeze Hotel, Senayan Jakarta.

A special reunion featuring live performances by a curated lineup of musicians, creating an evening of music, atmosphere, and timeless melodies.

THE EXPERIENCE

• Live Jazz Tribute Concert

• Standards from Your Favorite Classic Movies

• Intimate Rooftop Setting

• Limited Seating

• Curated live music performances

• Rp100.000 F&B Voucher included with your ticket

EVENT DETAILS

Friday, 11 September 2026

Doors Open: 8:00 PM

Venue: SunBreeze Hotel, Senayan Jakarta — 7th Floor

Event Time: 8:00 PM – 3:00 AM WIB

Limited seats available.

Come for the music.

Stay for the atmosphere.

Welcome back to StashedTheJazz.', terms_conditions = 'SYARAT & KETENTUAN

1. Tiket berlaku untuk STASHEDTHEJAZZ REUNION — ONCE UPON A JAZZ Vol. 02 pada Jumat, 11 September 2026 di SunBreeze Hotel, Senayan Jakarta.

2. Setiap tiket berlaku untuk 1 (satu) orang dan memberikan akses ke area acara serta tempat duduk sesuai kategori tiket yang dibeli.

3. Tiket sudah termasuk F&B Voucher sebesar Rp100.000. Voucher diberikan dalam bentuk voucher fisik pada saat proses check-in/registrasi di lokasi acara dan dapat digunakan di SunBreeze sesuai ketentuan yang berlaku pada saat acara.

4. Tiket yang telah dibeli bersifat non-refundable dan tidak dapat dikembalikan, kecuali apabila acara dibatalkan oleh penyelenggara.

5. Apabila terjadi perubahan jadwal atau ketentuan pelaksanaan acara, penyelenggara akan memberikan informasi kepada pemegang tiket melalui kanal komunikasi resmi.

6. Tiket wajib ditunjukkan dalam bentuk e-ticket yang valid pada saat proses check-in/registrasi di lokasi acara.

7. Satu tiket hanya dapat digunakan untuk satu kali akses. Tiket yang telah digunakan tidak dapat digunakan kembali.

8. Tiket tidak dapat diperjualbelikan kembali tanpa persetujuan penyelenggara.

9. Penyelenggara berhak menolak akses apabila tiket terbukti tidak valid, telah digunakan sebelumnya, atau diperoleh melalui transaksi yang tidak sah.

10. Penyelenggara berhak melakukan penyesuaian terhadap tata letak tempat duduk, area acara, dan susunan teknis acara apabila diperlukan untuk kelancaran dan keamanan acara.

11. Pengunjung wajib mengikuti peraturan dan ketentuan yang berlaku di area SunBreeze Hotel selama acara berlangsung.

12. Dengan melakukan pembelian tiket, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-06_edef81ae376c780a7fe26332c7209b82970c8c89da1102d4b73ac080668f06c5.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-06_78ae48d481cb3c89b5fbd0bfb410ac3ee0b4e0230cc6f23b822ed759d2ec6847.webp"]', seatmap = '' WHERE title = 'StashedTheJazz Reunion' AND venue = 'Sunbreeze Hotel, Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'StashedTheJazz Reunion' AND ev.venue = 'Sunbreeze Hotel, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Once Upon A Jazz', 330000, 100, 30, 'Event access, seating, and Rp100.000 F&B Voucher. Limited seats available. Valid for 1 person.' FROM events ev WHERE ev.title = 'StashedTheJazz Reunion' AND ev.venue = 'Sunbreeze Hotel, Jakarta Selatan';
UPDATE events SET description = 'Edu Concert 2026

Our Musical Journey

Edu Concert: Our Musical Journey
 merupakan konser tahunan yang diselenggarakan oleh Jurusan Musik SMKN 12 Surabaya sebagai bentuk apresiasi terhadap proses belajar, dedikasi, dan perkembangan musikal para siswa selama menempuh pendidikan di sekolah.

Mengusung tema 
"Our Musical Journey"
, konser ini mengajak penonton menyaksikan perjalanan setiap siswa dalam mengembangkan kemampuan bermusik, mulai dari proses pembelajaran di kelas, latihan yang penuh disiplin, hingga pencapaian yang diwujudkan melalui sebuah pertunjukan di atas panggung. Setiap penampilan menjadi cerminan dari semangat belajar, kerja sama, kreativitas, dan kecintaan terhadap musik yang terus bertumbuh.

Bertempat di 
Performance Hall Universitas Kristen Petra Surabaya
, konser ini akan menampilkan siswa kelas XI dan XII Jurusan Musik dengan berbagai mayor, meliputi 
Piano, Gitar, Gesek, Tiup, dan Vokal
. Selain penampilan solo, penonton juga akan disuguhkan berbagai pertunjukan ansambel, seperti 
Orkestra SMKN 12 Surabaya, Ansambel Gitar, Paduan Suara
, serta berbagai kolaborasi musikal yang menggambarkan kekayaan ekspresi dan kemampuan para siswa.', terms_conditions = 'Edu Concert 2026

Our Musical Journey

Melalui 
Edu Concert: Our Musical Journey
, kami mengundang seluruh keluarga, sahabat, alumni, dan masyarakat untuk menjadi bagian dari perjalanan musikal ini serta memberikan apresiasi kepada generasi muda yang terus berkarya, belajar, dan menginspirasi melalui musik.', gallery = gallery, seatmap = '' WHERE title = 'EDU CONCERT "Our Musical Journey"' AND venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Pelajar/Mahasiswa', 25000, 100, 30, 'Tiket khusus untuk pelajar dan mahasiswa' FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tiket UMUM', 35000, 210, 63, 'Dibeli masyarakat umum' FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya';
UPDATE events SET description = 'Sekarang persiapkan dirimu untuk SARVIVAL (Sarkoro Voice Festival)

Festival ini akan digelar dengan menghadirkan deretan bintang tamu yang luar biasa.

Diantaranya:

-NADHIF BASALAMAH

-DENNY CAKNAN

-TYO AND FRIENDS

Tempat : Lapangan SMA NEGERI 7 PURWOREJO

Tanggal : 12 September 2026

Ayo, jangan lewatkan konser terbesar di Kota Purworejo dan jadilah bagian dari keseruan Konser SARVIVAL (Sarkoro Voice Festival) bersama teman, pasangan, dan keluarga!

Segera amankan tiketmu sebelum kehabisan!', terms_conditions = 'SYARAT DAN KETENTUAN TIKET:

1. Tiket dapat dibeli melalui laman loket.com

2. Pembelian tiket selain melalui loket.com TIDAK MENJADI TANGGUNG JAWAB PROMOTOR & segala risiko yang timbul menjadi tanggung jawab pembeli tiket,

3. Usia dibawah atau sama dengan 5 tahun WAJIB didampingi oleh orang tua/wali,

4. Anak dengan usia mulai 5 tahun wajib membeli tiket

5. Harga sudah termasuk pajak.

6. Pada saat proses pembelian tiket, pastikan mengisi data SESUAI dengan identitas diri,

7. Tiket yang sudah dibeli TIDAK dapat dikembalikan (NO REFUND, NO DOWNGRADE, NO UPGRADE),

8. QR code pada e-tiket baru akan MUNCUL pada periode waktu penukaran tiket

9. QR code pada e-tiket hanya dapat di-scan sebanyak satu kali.

10. Gelang tiket digunakan untuk Single Entry (sekali masuk)', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-04_ca03cc2169477f6326a10b2a8189c52201688f7c63becf7e9a9a03c7f08d87e1.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-08-04_6db89d1312a9f909e316f28a829dbd28b321b0b472118da941541967b7c04d5d.webp"]', seatmap = '' WHERE title = 'SARVIVAL EVENT' AND venue = 'SMAN 7 Purworejo, Kab. Purworejo';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL', 140000, 1, 0, 'Tiket Festival' FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP', 199000, 1, 0, 'Tiket VVIP' FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo';
UPDATE events SET description = 'Ruang Raya adalah festival yang mempertemukan musik, komunitas, kuliner, dan kreativitas lokal dalam satu perayaan.Lebih dari sekadar konser, Ruang Raya menjadi ruang bagi semua orang untuk berkumpul, berekspresi, dan menciptakan momen yang tak terlupakan. &rdquo;Menyalakan Ruang, Merayakan Kota.&rdquo;', terms_conditions = 'Tiket yang sah adalah yang dibeli melalui chanel resmi yang ditunjuk oleh penyelenggara

 
Satu tiket berlaku untuk satu orang, dan satu kali masuk area venue.

 
Pembeli tiket minimal berusia 12 (dua belas) tahun ke atas. Penonton dibawah usia 12 (dua belas) tahun tidak diperbolehkan memasuki area venue 
RUANG RAYA - KARAWANG
.

 
Ibu Hamil tidak disarankan memasuki area venue 
RUANG RAYA - KARAWANG
.

 
Harap membawa kartu identitas asli dan tiket (e-voucher) dari Loket.com pada saat memasuki lokasi acara.

 
Maksimum pembelian tiket adalah 4 (empat) tiket dalam 1 (satu) kali transaksi.

 
Setiap tiket akan dipersonalisasikan dengan terteranya nama pengunjung di tiket. Nama yang sudah diregistrasikan di tiket tidak dapat diubah. Mohon pastikan bahwa nama lengkap dan nomor kartu indentitas Anda sesuai dengan kartu identitas yang dikeluarkan pemerintah dengan foto yang valid (kartu tanda penduduk apapun/KTP) dengan benar saat mengisi informasi Anda untuk e-ticket Anda.

 
Dilarang keras untuk menjual kembali tiket yang sudah dibeli. Semua komponen tiket akan dicabut jika dijual kembali. Harga tiket sudah termasuk pajak pemerintah & biaya admin.

 
Tiket yang sudah dibeli tidak dapat dikembalikan dan non-refundable.

 
Promotor berhak untuk:
 

Melarang penonton masuk jika tiket telah digunakan oleh orang lain.

 
Melarang penonton masuk ke area event 
RUANG RAYA - KARAWANG
 jika tiket yang digunakan tidak valid.

 
Memproses atau mengajukan hukum, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan tiket secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan tiket yang sah atau memperoleh tiket dengan cara yang tidak sesuai prosedur.

 
Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket merupakan tanggung jawab pembeli.

 

 

RUANG RAYA - KARAWANG
 adalah acara yang diselenggarakan dengan menerapkan protokol kesehatan yang ketat sesuai standar CHSE (Cleanliness, Health, Safety,', gallery = gallery, seatmap = '' WHERE title = 'RUANG RAYA - KARAWANG' AND venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - Early Entry', 200000, 690, 207, '<ul>
 <li>Harga belum termasuk pajak dan biaya platform</li>
 <li>Wajib masuk sebelum pukul 15:00</li>
 <li>Datang diatas pukul 15:00, tiket dinyatakan hangus</li>
</ul>' FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - Festival', 275000, 2277, 683, '<ul>
 <li>Harga belum termasuk pajak dan biaya platform</li>
</ul>' FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULAR - VIP Festival', 350000, 401, 120, '<ul>
 <li>Harga belum termasuk pajak dan biaya platform</li>
</ul>' FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
UPDATE events SET description = 'NO PEACE TODAY NO LIFE TOMORROW adalah event musik tahunan yang diinisiasi pada era 2000an. 

Berawal dari penggalangan dana untuk korban bencana Bengkulu tahun 2000.

Bukan hanya membawa misi amal namun juga keresahan kolektif untuk membuat ruang ekspresi lintas genre.

Event ini tumbuh menjadi salah satu movement independen yang ditunggu tunggu.', terms_conditions = '1. Pembelian Tiket

Setiap tiket hanya berlaku untuk satu orang dan satu kali masuk.

Pastikan data yang Anda masukkan saat pembelian sudah benar. Kesalahan data yang disebabkan oleh pembeli menjadi tanggung jawab pembeli.

Tiket hanya dapat dibeli melalui kanal penjualan resmi yang telah ditentukan oleh penyelenggara.

2. Tiket dan Masuk ke Venue

E-ticket atau tiket fisik wajib ditunjukkan saat memasuki area konser.

Penyelenggara berhak meminta identitas diri untuk proses verifikasi apabila diperlukan.

Tiket yang hilang, rusak, atau telah digunakan tidak dapat diganti.

3. Pengembalian Dana (Refund)

Seluruh pembelian tiket bersifat final dan tidak dapat dibatalkan maupun ditukar.

Refund hanya akan diproses apabila konser dibatalkan oleh penyelenggara sesuai dengan kebijakan yang berlaku.

Apabila konser ditunda, tiket tetap berlaku untuk jadwal terbaru, kecuali penyelenggara mengumumkan kebijakan lain.', gallery = gallery, seatmap = '' WHERE title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1', 50000, 500, 150, '' FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 2', 75000, 500, 150, '' FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULER', 100000, 1000, 300, '' FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BERDUA', 185000, 500, 150, 'Paket 2 orang' FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BERTIGA', 270000, 300, 90, 'Paket bertiga' FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
UPDATE events SET description = 'HUJAN TENTANG CINTA.

Majelis Lidah Berduri kembali ke Bali. Setelah Tiba-Tiba Marabahaya, kali ini hujan datang membawa cinta—dengan segala yang sengit, bising, absurd, dan tak selesai. 13 September, mari bertemu lagi di antara lagu-lagu lama, bunyi-bunyi baru, dan cerita yang mungkin lebih baik dirasakan daripada dijelaskan. Datang. Kita lihat apa yang turun malam itu.', terms_conditions = 'SYARAT & KETENTUAN

Tiket yang telah dibeli tidak dapat dikembalikan (non-refundable), kecuali apabila acara dibatalkan oleh pihak penyelenggara.

Satu tiket berlaku untuk satu orang dan hanya dapat digunakan untuk satu kali masuk. Pastikan data pembelian sudah benar sebelum menyelesaikan transaksi.

E-ticket wajib ditunjukkan saat memasuki venue. Penyelenggara berhak menolak tiket yang tidak valid, telah digunakan sebelumnya, digandakan, atau diperoleh melalui pihak yang tidak resmi.

Penonton wajib mengikuti seluruh peraturan yang berlaku di venue dan menjaga ketertiban selama acara berlangsung. Penyelenggara berhak mengeluarkan penonton yang mengganggu keamanan, kenyamanan, atau jalannya pertunjukan.

Dilarang membawa senjata, obat-obatan terlarang, benda berbahaya, minuman beralkohol, serta barang lain yang dapat membahayakan diri sendiri maupun orang lain ke dalam area acara.

Penyelenggara tidak bertanggung jawab atas kehilangan atau kerusakan barang pribadi selama berada di area acara.

Dokumentasi berupa foto dan/atau video dapat dilakukan selama acara berlangsung untuk keperluan dokumentasi dan publikasi. Dengan menghadiri acara, penonton dianggap menyetujui penggunaan dokumentasi tersebut.

Informasi mengenai perubahan teknis, jadwal, tata cara masuk, atau ketentuan acara akan disampaikan melalui kanal komunikasi resmi penyelenggara.

Dengan melakukan pembelian tiket, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_42c2c432b2770dbc8aba5e3f585b122aa057aa4f6824672b8dc2241cc3d53310.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_c3b2f81e302b84164c58238dd5de5e63978b74c3078c71d568b3b6a9d58ffe01.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_d41bbd8d1f27a6a4df2250064753711c1c8c25b1ee3df253d20bc787039d18f0.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_03d1ba8259f0ca52da95aea302d4e47e026fe1fe80e896fd72a6dc85696d35fe.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_43d46c1b44ed3ae7304d2bb9ed7c7b72b6c1477ae5730604aefa5a6cf903fd43.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_553e4a92f99ba942c44a58e935c401e4a2025b0a98769c4ab7e245bcd166cbad.webp"]', seatmap = '' WHERE title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND venue = 'Berbagi Ruang, Kota Denpasar';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Advance Ticket', 75000, 500, 150, '' FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Door Ticket', 100000, 100, 30, '' FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar';
UPDATE events SET description = 'Warga Berpesta Ria — Saatnya Kumpul, Musik, dan Seru-Seruan!

WARIA FEST
 (Warga Berpesta Ria) Vol. 2 kembali hadir untuk mengajak warga berkumpul, bersenang-senang, dan menikmati malam dengan suguhan musik dari berbagai penampil.

Bersiap untuk malam yang penuh energi bersama 
Dogy Is Dog, Smile Morning, DJ Renggo, Never Forgive Honey, The Matulacaka, dan Akar Enak
, serta dipandu oleh 
MC Reza
.

Jangan lewatkan keseruan WARIA FEST Vol. 2 dan jadilah bagian dari pesta warga yang penuh musik, tawa, dan kebersamaan!

Detail Event

Event: WARIA FEST (Warga Berpesta Ria) Vol. 2

Tanggal: Sabtu, 19 September 2026

Waktu: Mulai pukul 19.00 WIB

Lokasi: Warmindo Bang Gaga

MC: Reza

Line Up

Dogy Is Dog

Smile Morning

DJ Renggo

Never Forgive Honey

The Matulacaka

Akar enak

Harga Tiket

Tiket Online: Rp35.000

FREE Soft Drink

Info lebih lanjut: 0852-8553-5237 (Dimas)', terms_conditions = '1. Ketentuan Umum

Tiket WARIA FEST (Warga Berpesta Ria) Vol. 2 berlaku untuk acara pada 
19 September 2026
.

Tiket yang telah dibeli merupakan bukti hak masuk ke area acara dan wajib ditunjukkan pada saat melakukan registrasi/penukaran tiket.

Satu tiket berlaku untuk 
1 orang
.

Tiket yang sudah dibeli 
tidak dapat dikembalikan (refund)
, kecuali apabila acara dibatalkan oleh pihak penyelenggara.

2. Ketentuan Masuk

Pengunjung wajib menunjukkan tiket/QR Code yang valid kepada petugas saat memasuki area acara.

QR Code tiket hanya dapat digunakan 
satu kali
.

Pengunjung wajib menjaga tiket dan QR Code agar tidak disalahgunakan oleh pihak lain.

Pihak penyelenggara berhak menolak akses masuk apabila tiket terbukti tidak valid, telah digunakan sebelumnya, atau diperoleh melalui cara yang tidak sah.

Pengunjung wajib mengikuti proses pemeriksaan/registrasi yang ditetapkan oleh panitia.

3. Ketentuan Selama Acara

Pengunjung wajib menjaga ketertiban, keamanan, kebersihan, dan kenyamanan selama acara berlangsung.

Dilarang melakukan tindakan yang dapat mengganggu atau membahayakan pengunjung lain.

Pengunjung wajib mengikuti seluruh peraturan dan arahan dari panitia serta petugas keamanan.

Dilarang membawa barang-barang yang dapat membahayakan diri sendiri maupun orang lain.

Dilarang melakukan tindakan kekerasan, keributan, atau tindakan lain yang mengganggu jalannya acara.

Pengunjung bertanggung jawab atas barang pribadi masing-masing. Penyelenggara tidak bertanggung jawab atas kehilangan atau kerusakan barang pribadi.

4. Dokumentasi

Dengan membeli dan menggunakan tiket, pengunjung menyetujui bahwa selama acara berlangsung dapat dilakukan pengambilan foto, video, atau dokumentasi lainnya untuk keperluan dokumentasi dan publikasi acara.

Pengunjung tidak dapat menuntut penyelenggara atas penggunaan dokumentasi tersebut selama digunakan untuk kepentingan publikasi acara secara wajar.

5. Pembatalan & Perubahan Acara

Penyelenggara berhak melakukan perubahan terha', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-01_1b4e26e9b8dcb0090be0178c4bd0734bfcc9dff83e6701b2cb6c311810bef8dd.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-01_9747b11b1654fc47b9e8f536fd3a201e063e942ab9c803394329a9a2531bbca8.webp"]', seatmap = '' WHERE title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND ev.venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Tiket Waria Fest', 35000, 200, 60, 'Tiket Regular Waria Fest Vol. 2' FROM events ev WHERE ev.title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND ev.venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang';
UPDATE events SET description = 'THE SOUND OF WELLNESS', terms_conditions = 'Dengan membeli tiket Suara Guntur, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh syarat & ketentuan berikut:

A.INFORMASI UMUM

 

 

Suara Guntur adalah sebuah event activation dari program Nalarraya yang mengharapkan adanya pariwisata keberlanjutan dengan insan pariwisata yang peduli terhadap lingkungan dengan kemasan Konser Interaktif dan Proaktif yang berlangsung selama 2 hari :
 

Tanggal 19 - 20 September 2026

 
Lokasi : Edu Wisata Gunung Guntur Garut

 

 
Tiket berlaku sesuai tanggal yang tertera pada tiket (Day 1, Day 2, atau 2-Days Pass No Camp, Camp Fest 1 atau Camp Fest 2).

 

Tiket hanya berlaku untuk 1 orang

 

B.JENIS TIKET

 

Tiket Reguler Day 1 (Konser Suara Buana) :

 Tiket yang didalamnya mendapatkan fasilitas di hari pertama (All Activities Day-1, Tiket Edu Wisata, Konser Suara buana, Talk Show Guntur Talk''s (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan)

 

Tiket Regular Day 2 (Konser Suara Pagi Buta) :

 Tiket yang didalamnya mendapatkan fasilitas di hari kedua (All Activities Day-2, Tiket Edu Wisata, Konser Suara Pagi Buta, Yoga/Meditasi, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan), Penanaman Pohon & Pemasangan Rambu Mitigasi Bencana)

 

Tiket 2 Days Pass No Camp :

 Tiket yang didalamnya mendapatkan semua fasilitas dua hari full tanpa menginap/kemping. (All Activities 2 days, Tiket Edu Wisata, Konser Sound Of Welness, Talk Show; Guntur Talk''s (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Yoga/Meditasi, Penanaman Pohon & Pemasangan Rambu Mitigasi Bencana, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan)

 

Tiket Camp Fest 2 :

 Tiket yang didalamnya mendapatkan semua fasilitas dua hari full dengan menginap dan hanya disediakan lapak untuk mendirikan tenda. (Lapak Tenda uk. maksimal kaps.4, All Activities 2 days, Tiket Edu Wisata, Konser Sound Of Welness, ', gallery = gallery, seatmap = '' WHERE title = 'SUARA GUNTUR (The Sound Of Wellness)' AND venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Camp Fest Cat 1', 325000, 30, 9, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font>.</li>
 <li><span style="color:#0000FF;"><em>Tenda kapasitas 2&nbsp;atau 4 orang.</em></span></li>
 <li><span style="color:#0000FF;"><em>Harga termasuk local tax dan service fee.</em></span></li>
 <li><font color="#0000ff"><i>2Daypass ticket (berlaku un' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Camp Fest Cat 2', 300000, 30, 9, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Lapak tenda kapasitas 2 atau 4 orang.</em></span></li>
 <li><span style="color:#0000FF;"><em>Harga termasuk local tax &amp; service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>2daypass ticket (' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - 2 Daypass (NO CAMP)', 200000, 100, 30, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak termasuk camping (tenda dan lapak).</em></span></li>
 <li><font color="#0000ff"><i>2Daypass ticket (' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Suara Buana', 150000, 300, 90, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser hari pertama.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam)</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Berlaku untuk tanggal 19 September 2026.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak terma' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale - Suara Pagi Buta', 150000, 300, 90, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser hari kedua.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Berlaku untuk tanggal 20&nbsp;September 2026.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak ' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Camp Fest Cat 1', 350000, 40, 12, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Tenda kapasitas 2 atau 4 orang.</em></span></li>
 <li><span style="color:#0000FF;"><em>Harga termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>2daypass ticket (berlaku ' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Camp Fest Cat 2', 300000, 40, 12, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Lapak tenda kapasitas 2 atau 4 orang.</em></span></li>
 <li><span style="color:#0000FF;"><em>Harga termasuk local tax &amp; service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>2daypass ticket (' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - 2 Daypass (NO CAMP)', 225000, 100, 30, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam &amp; sarapan)</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak termasuk camping (tenda dan lapak).</em></span></li>
 <li><span style="color:#0000FF;"><font color="' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Suara Buana', 175000, 150, 45, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser hari pertama.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan malam).</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Berlaku untuk tanggal 19 September 2026.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak term' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Normal - Suara Pagi Buta', 175000, 150, 45, '<p><span style="color:#0000FF;"><em>Benefit :</em></span></p>

<ul>
 <li><span style="color:#0000FF;"><em>Akses semua area konser hari kedua.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tiket berlaku untuk satu orang.</em></span></li>
 <li><font color="#0000ff"><i>Program Mindfullness Eating (Makan bersama : Makan sarapan).</i></font></li>
 <li><span style="color:#0000FF;"><em>Harga sudah termasuk local tax dan service fee.</em></span></li>
 <li><span style="color:#0000FF;"><em>Berlaku untuk tanggal 20&nbsp;September 2026.</em></span></li>
 <li><span style="color:#0000FF;"><em>Tidak' FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
UPDATE events SET description = 'GUTS Bali × Worship Nite Project

Tour-gether
 is a journey of worship, and Bali is where it comes to a close.

In collaboration with 
GUTS Bali
, Worship Nite Project brings the final stop of the Tour-gether journey to Bali.

 creating a space where worship goes beyond the walls of a church and reaches everyone, wherever they are.

Because we believe 
Jesus is present everywhere and His love is for everyone.

This is more than a night of worship. It’s an invitation to encounter Jesus, find hope, and experience His presence in a place you might not expect.

Come as you are.

Come with an open heart.

Come and encounter Jesus.

Tour-gether: Bali.

Revival is here.', terms_conditions = 'TERMS & CONDITIONS

GUTS Bali × Worship Nite Project — Tour-gether: Bali

25 September 2026 | Superclub Atlas, Canggu, Bali

Ticket Purchase

By purchasing a ticket, you agree to all Terms & Conditions applicable to this event.

Each ticket is valid for 
one (1) person
 only.

Tickets must be purchased through the official ticketing platform and/or authorized sales channels.

Please ensure that all information provided during the ticket purchase process is accurate.

Ticket Validity

Each ticket is valid only for the event date stated on the ticket.

Tickets may not be duplicated, reproduced, or resold without prior authorization from the Organizer.

The Organizer reserves the right to refuse admission for invalid, duplicated, or unauthorized tickets.

Refund & Cancellation

All tickets purchased are 
non-refundable and non-transferable
, except where otherwise determined by the Organizer.

In the event of cancellation or postponement, further information regarding ticket validity, refunds, or rescheduling will be announced through the Organizer’s official channels.

Event Entry

Attendees must present a valid ticket/QR code upon arrival for verification and entry.

The Organizer reserves the right to conduct security checks before allowing entry.

Attendees must comply with the venue’s rules and regulations at all times.

The Organizer reserves the right to deny entry or remove any attendee who violates the event or venue regulations.

Age Requirement

This event is open to attendees aged 
15 years and above
.

Attendees may be required to present a valid identification document for age verification.

The Organizer reserves the right to refuse entry if the attendee does not meet the applicable age requirement.

Prohibited Items & Conduct

Attendees are prohibited from bringing items that are not permitted by the venue or Organizer.

Any form of violence, harassment, discrimination, illegal activity, or disruptive behavior is strictly prohibited.

Attendees who viol', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_f2d4e0b43271efcca9a16295eb3577fc35a028679eb69b5fb8639dc010f2751e.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_1e5b09016cb267da2c0586af271963e199481acb83a0852002c613cda6b19b09.webp"]', seatmap = '' WHERE title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND venue = 'Atlas Super Club, Kab. Badung';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRE-SALE', 100000, 139, 138, 'A night where worship meets a new atmosphere. Come encounter Jesus, find hope, and be part of the revival. Limited presale tickets.' FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'REGULER', 115000, 661, 198, 'Worship. Music. Revival. Step into a night where faith meets a new atmosphere. Come as you are and encounter Jesus. Revival is here.' FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung';
UPDATE events SET description = 'Pestapora 2026 adalah sebuah perayaan dan selebrasi selama tiga hari yang melibatkan berbagai komunitas dan menggabungkan lintas genre musik di Indonesia. 25, 26, 27 September 2026 adalah hari perayaan Pestapora selanjutnya. Nantikan dan mari berpestapora!', terms_conditions = 'TERMS AND CONDITIONS TICKETING PESTAPORA 2026

 

 

Dengan membeli tiket, anda telah mengerti, menyetujui dan bersedia mematuhi seluruh syarat dan ketentuan selama 
Pestapora 2026
 berlangsung yang telah ditentukan pihak penyelenggara. Untuk pengalaman terbaik di 
Pestapora 2026
, harap perhatikan hal-hal berikut:

By purchasing a ticket, you understand, agree and comply with all terms and protocols for the event arranged by the organiser. For the best experience at 
Pestapora 2026
, please take note of the following:

 Tiket Presale adalah kategori tiket keluaran ketiga terbitan Pestapora 2026. Tiket ini dapat berlaku untuk tiga (3) hari yakni 25, 26, 27 September 2026 dan bebas masuk di waktu kapanpun ke area Pestapora sebelum close gate.

Presale Tickets are the third ticket category issued by Pestapora 2026. These tickets can be valid for three (3) days, namely 25, 26, 27 September 2026 and are free to enter at any time to the Pestapora area before the gate closes.

PEMBELIAN DAN PENGUMPULAN TIKET:

TICKET PURCHASE AND COLLECTION:

 

Tiket resmi hanya dapat dibeli dan didapatkan melalui loket.com. Pembelian tiket selain dari official ticketing partner, penyelenggara tidak menjamin keaslian tiket. Pihak penyelenggara tidak bertanggung jawab atas segala penipuan tiket yang dibeli melalui pihak lain.

Tickets can only be purchased and collected through loket.com. By purchasing tickets from unauthorised sellers or other parties, buyers take on the risk that the validity of the tickets cannot be guaranteed, with no refunds possible.

 

 
Tiket tidak boleh dijual dialihkan untuk tujuan komersil. Untuk tujuan promosi, kontes, undian, kegiatan amal atau kegiatan lain tanpa persetujuan tertulis sebelumnya dari pihak penyelenggara. Setiap tiket yang melanggar peraturan ini akan dicabut dan dinyatakan tidak berlaku, dan pelakunya akan dianggap sebagai pelanggar Pestapora. Penjualan kembali dapat menjadi lisensi penyelenggara untuk membatalkan tiket.

Tickets may not be ', gallery = gallery, seatmap = '' WHERE title = 'Pestapora 2026' AND venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Regular - 3 Days Pass', 650000, 1500, 450, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 1', 300000, 6000, 1800, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 2', 300000, 6500, 6499, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Daily Pass - Day 3', 300000, 6500, 1950, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 1', 225000, 1500, 450, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
 <li>Masuk ke venue sebelum jam 15.00 WIB</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 2', 225000, 1500, 1499, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
 <li>Masuk ke venue sebelum jam 15.00 WIB</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Entry - Day 3', 225000, 1500, 450, '<ul>
 <li>Harga belum termasuk Pajak Hiburan Daerah, Biaya Admin, dan biaya lainnya.</li>
 <li>Masuk ke venue sebelum jam 15.00 WIB</li>
</ul>' FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
UPDATE events SET description = '"Glitter Camp Live Concert"
 mengusung konsep intimate concert dengan sentuhan tata visual modern dan warna-warni, hingga atmosfer panggung yang dibuat dengan suasana camp yang modern dan hangat. 

Tak hanya menjadi showcase penampilan lagu-lagu glitter, 
"Glitter Camp Live Concert"
 juga akan menjadi playground bagi masing-masing personil Glitter dengan para Glitz.', terms_conditions = 'Tiket Glitter Camp Live Concert Jakarta yang sah adalah tiket yang dibeli melalui situs resmi 
https://www.loket.com
 dan sesuai dengan tata cara pembelian yang telah ditentukan oleh penyelenggara.

 

 

 
Harga tiket yang tercantum sudah termasuk Pajak Pertambahan Nilai (PPN) sesuai dengan ketentuan perundang-undangan yang berlaku, namun belum termasuk pajak hiburan dan biaya administrasi lainnya

 

 

 
Seluruh section pada konser bersifat tempat duduk. Tempat duduk akan ditentukan oleh sistem sesuai dengan urutan pembayaran. Setiap pembeli akan mendapatkan barcode ticket melalui E-Ticket yang akan dikirimkan ke email setiap pembeli. Seating Number (Nomor Kursi) akan dimunculkan pada E-Ticket Loket paling telat H-5 sebelum acara berlangsung.

 

 

 

Terkait jam mulai acara akan diinfokan lebih lanjut mendekati hari penyelenggaraan acara.

 

 

 
Penukaran E-Ticket menjadi wristband akan dibuka mulai pukul 11.00 WIB

 

 

 
Data pribadi yang dimasukkan ke dalam situs Glitter Camp Live Concert Jakarta hanya akan digunakan untuk keperluan pembelian tiket Glitter Camp Live Concert Jakarta.

 

 

 
Satu (1) akun Loketcom hanya berlaku untuk pembelian maksimal sepuluh (10) tiket Glitter Camp Live Concert Jakarta dalam 1 kali transaksi.

 

 

 
Anak dengan usia dibawah satu (1) tahun tidak diperkenankan untuk menghadiri Glitter Camp Live Concert Jakarta.

 

 

 
Anak dengan usia satu (1) tahun sampai dengan tiga belas (13) tahun diwajibkan untuk membeli tiket untuk menghadiri acara, dan diwajibkan untuk didampingi oleh orang tua untuk menghadiri acara. Jika tidak ada orang tua atau pendamping yang hadir, maka anak tersebut tidak diperkenankan masuk dan menghadiri acara, tiket akan dinyatakan hangus.

 

 

 
Anak dengan usia tiga belas (13) tahun,, dapat menghadiri acara tanpa orang tua, tetapi wajib mengisi formulir yang telah disiapkan penyelenggara saat penukaran tiket agar penyelenggara memiliki informasi lengkap terhadap anak tersebut.

 

 

 
Anak Berkebu', gallery = gallery, seatmap = '' WHERE title = 'Glitter Camp Live Concert' AND venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP (Beanbag)', 900000, 2, 1, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket VIP akan mendapatkan sesi Photo Group dan Hi-Bye dengan Glitter. Pembeli tiket VIP juga akan mendapatkan Official Signed Poster, Lanyard khusus, Photocard dan juga Merchandise spesial</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP (Seat)', 900000, 14, 13, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket VIP akan mendapatkan sesi Photo Group dan Hi-Bye dengan Glitter. Pembeli tiket VIP juga akan mendapatkan Official Signed Poster, Lanyard khusus, Photocard dan juga Merchandise spesial</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Glitz (CAT 1)', 500000, 196, 58, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket Glitz akan mendapatkan Photocard. Pembeli juga mendapatkan kesempatan untuk Hi-Bye dan kesempatan mendapatkan Official Signed Poster melalui sistem raffle.</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Besties (CAT 2)', 400000, 50, 15, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket Bestie akan mendapatkan kesempatan untuk mendapatkan Official Signed Poster dan Photocard melalui sistem raffle</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Berkilau (CAT 3)', 125000, 52, 15, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Glitz with Buumi Bundle (CAT 1)', 630000, 40, 12, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket Glitz akan mendapatkan Photocard. Pembeli juga mendapatkan kesempatan untuk Hi-Bye dan kesempatan mendapatkan Official Signed Poster melalui sistem raffle.</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Besties with Buumi Bundle (CAT 2)', 530000, 30, 9, '<ul>
 <li><em>Harga belum termasuk pajak dan admin fee</em></li>
 <li><em>Setiap pembelian tiket Bestie akan mendapatkan kesempatan untuk mendapatkan Official Signed Poster dan Photocard melalui sistem raffle</em></li>
</ul>' FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
UPDATE events SET description = 'PGR 2026 @Cikarang', terms_conditions = 'Tiket yang sah adalah yang dibeli melalui Loket.com. Promotor tidak bertanggungjawab terhadap validitas tiket yang dibeli dari pihak ketiga.

 
Tiket berlaku untuk 1 orang, 1 kali masuk venue, tidak diperkenankan re-entry.

 
Pemegang 
Tiket VIP
 masuk melalui gate khusus, mendapat area khusus di depan stage dengan kapasitas terbatas. Tiket VIP ditukarkan dengan gelang/ID. Boleh keluar-masuk area VIP dengan menunjukkan gelang/ID.

 
Disediakan gate khusus prioritas: anak-anak, ibu hamil, lanisa, dan penonton berkebutuhan khusus. Harap menghubungi petugas untuk mendapat bantuan.

 
Harap membawa tiket dari Loket.com pada saat memasuki venue. Tiket tidak perlu di-print, cukup ditunjukkan di gate untuk di-scan oleh petugas.

 
Penyelenggara memiliki hak untuk:

 - Melarang masuk pengunjung jika tiket telah dipergunakan oleh orang lain.

 - Melarang masuk pengunjung ke area venue jika tiket tidak valid.

 - Memproses atau mengajukan hukum, baik perdata atau kriminal kepada pengunjung yang mendapatkan tiket dengan ilegal, termasuk memalsukan dan menggandakan tiket yang sah atau mendapatkan tiket dengan cara yang tidak sesuai prosedur.

 
Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.

 
Ticket yang telah dibeli tidak dapat diuangkan kembali dengan alasan apapun.

 
Pihak penyelenggara akan menindak tegas, dan berhak mengeluarkan pengunjung apabila berperilaku tidak tertib, dalam pengaruh alkohol, menyinggung atau berperilaku yang tidak pantas, dan tamu yang menolak untuk mematuhi instruksi / peringatan dari staf festival / event. Tidak akan ada pengembalian uang.

 
Tamu bertanggung jawab sepenuhnya atas keamanan semua barang-barang pribadi. Kehilangan barang pribadi bukan tanggung jawab', gallery = gallery, seatmap = '' WHERE title = 'PGR 2026 @Cikarang' AND venue = 'Lippo Mall Cikarang, Kab. Bekasi';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE', 85000, 200, 60, '<ul>
 <li>Harga Belum termasuk pajak dan admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE.', 100000, 5000, 1500, '<ul>
 <li>Harga Belum termasuk pajak dan admin fee</li>
</ul>' FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE', 175000, 100, 30, '<ul>
 <li><small>Harga Belum termasuk pajak dan admin fee</small></li>
</ul>' FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE.', 200000, 300, 90, '<ul>
 <li><small>Harga Belum termasuk pajak dan admin fee</small></li>
</ul>' FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi';
UPDATE events SET description = 'Party Du Royaume

Di sebuah kerajaan yang megah, lahirlah seorang Putra Mahkota

yang telah lama dinantikan.

Untuk menyambut kelahirannya, sebuah pesta besar dipersiapkan

dengan segala sesuatu yang paling indah, mewah, dan sempurna.

Namun, di tengah kemeriahan dan gemerlap istana,

sesuatu yang tak terduga mulai terjadi...

Apa yang sebenarnya terjadi di balik pesta sang Putra Mahkota?

Dan mampukah mereka menyadari apa yang paling berharga?

Saksikan drama musikal Party Du Royaume! Sabtu, 10 Oktober 2026 di Taman Budaya Raden Saleh (Gedung Ki Narto Sabdho) Semarang.', terms_conditions = 'Party du Royaume — 20th Celebration

• Ketentuan Tiket

1. Tiket berlaku untuk 1 (satu) orang dan hanya dapat digunakan untuk 1 (satu) sesi pertunjukan sesuai sesi yang dipilih saat pembelian.

2. Tiket tidak dapat digunakan untuk sesi yang berbeda dari sesi yang tertera pada tiket.

3. Penonton diharapkan hadir lebih awal untuk proses registrasi. First come first serve (Open gate 30 menit sebelum pertunjukan dimulai)

4. Harga Early Bird hanya berlaku selama periode Early Bird dan/atau selama kuota tiket Early Bird masih tersedia.

5. Setelah periode Early Bird berakhir, harga tiket mengikuti harga Regular Sales.

6. Pembayaran & Konfirmasi Tiket dianggap sah setelah pembayaran berhasil dan pembeli menerima konfirmasi/tiket resmi yang dikirim ke email.

7. Pastikan data yang dimasukkan saat pembelian sudah benar.

8. Kesalahan pengisian data yang disebabkan oleh pembeli menjadi tanggung jawab pembeli.

9. Tiket & Akses MasukTiket wajib ditunjukkan pada saat memasuki venue.

10. Tiket dapat berupa tiket digital/QR Code sesuai sistem ticketing yang digunakan.

11. 1 QR Code hanya dapat digunakan 1 kali dan tidak dapat digunakan kembali setelah berhasil divalidasi.

12. Tiket yang telah digunakan, rusak, tidak terbaca, atau terindikasi telah digunakan sebelumnya dapat ditolak oleh panitia.', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_97778e0a800e6a2e8243d94fbab6b3b9bef7a0bc4a8f85de6125557e6fa87829.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_c5ad21eaef024ff083a1e425b1ba062270999615e59e72d11dc93ce62fefd13e.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_bed35f0d1368212fd573b6305b354e4d0ed8bcf50efbd25232ffae57358564dc.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_7bd128551c4eae9b3c085b16f74e8fd116329a6eecf087fb8a9104dc11ed83fd.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-09-02_d8c0af11c4724022aa7ecb445e666b4220f860250794bcec554446ff01f72901.webp"]', seatmap = '' WHERE title = 'Party Du Royaume by de Creative Kingdom' AND venue = 'Taman Budaya Raden Saleh, Kota Semarang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales VIP Session 1', 125000, 265, 79, 'Early Bird Sales VIP' FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales Regular Session 1', 75000, 189, 56, 'Early Bird Sales Regular' FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales VIP Session 2', 125000, 265, 79, 'Early Bird Sales VIP Session 2' FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird Sales Regular Session 2', 75000, 189, 56, 'Early Bird Sales Regular Session 2' FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang';
UPDATE events SET description = 'Golden Jubilee adalah perayaan iman sekaligus gerakan solidaritas spiritual yang mengundang 12.000 umat untuk hadir bersama dalam satu momen bersejarah, merayakan 50 tahun Pembaruan Karismatik Katolik (PKK) di Indonesia dengan tema Roh Kudus Api Evangelisasi dan misi Solidaritas Spiritual.

Lebih dari sebuah perayaan, Golden Jubilee adalah panggilan nyata untuk bergerak bersama bagi Kaum Kecil, Lemah, Miskin, Tersingkir, dan Difabel (KLMTD) mereka yang kerap berada di pinggiran, namun adalah pusat dari misi Injil.

Kehadiranmu bukan sekadar mengisi kursi. Setiap tiket yang kamu beli adalah kontribusi nyata bagi misi yang berkelanjutan, termasuk retreat pendampingan iman bagi keluarga, kaum muda, dan sahabat KLMTD yang akan terus berjalan setelah perayaan ini.

Satu kursi. Satu langkah iman. Satu dampak nyata. &#128330;&#65039;

Rundown

09.00 WIB

Registrasi & GoJu Fair

11.00 WIB

Open Gate

12.45 - 21.00 WIB

Acara Puncak GoJu', terms_conditions = 'SYARAT DAN KETENTUAN PEMBELIAN TIKET

Golden Jubilee / GoJu 2026
 diselenggarakan oleh BPN PKKI.

Dengan melakukan pembelian tiket, Pembeli telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan (S&K) berikut ini.

1. Definisi

1.1. "Penyelenggara" adalah pihak yang menyelenggarakan dan bertanggung jawab atas acara ini, yaitu BPN PKKI.

1.2. "Tiket" atau "E-ticket" adalah bukti pembelian sah dalam bentuk digital (PDF/aplikasi/QR code) yang wajib ditukarkan menjadi Gelang Acara sebelum dapat digunakan untuk masuk ke venue.

1.3. "Gelang Acara" adalah gelang fisik resmi yang diberikan oleh Penyelenggara sebagai pengganti e-ticket pada saat penukaran, dan merupakan satu-satunya identitas yang sah untuk masuk dan tetap berada di dalam venue selama acara berlangsung.

1.4. "Pembeli" adalah individu yang melakukan transaksi pembelian tiket melalui kanal resmi yang ditentukan Penyelenggara.

1.5. "Kanal Resmi" adalah platform penjualan tiket yang ditunjuk dan diumumkan secara resmi oleh Penyelenggara, yaitu loket.com

2. Pembelian Tiket

2.1. Tiket hanya sah jika dibeli melalui Kanal Resmi yang ditunjuk Penyelenggara. Penyelenggara tidak bertanggung jawab atas tiket yang dibeli dari pihak ketiga yang tidak resmi (calo, reseller tidak resmi, dsb).

2.2. Setiap transaksi tunduk pada ketersediaan kuota tiket. Penyelenggara berhak membatasi jumlah pembelian per akun/identitas untuk mencegah penyalahgunaan sistem.

2.3. Data yang diisi pada saat pembelian (nama, email, nomor telepon, dll.) harus benar dan sesuai identitas asli, karena akan digunakan untuk verifikasi saat masuk ke venue.

2.4. Harga tiket sudah tidak termasuk biaya layanan (administrasi), pajak, dan biaya lain yang berlaku, sebagaimana ditampilkan pada saat transaksi di Kanal Resmi.

3. Pembayaran

3.1. Pembayaran harus diselesaikan sesuai batas waktu (time limit) yang ditentukan oleh sistem Kanal Resmi. Transaksi yang tidak diselesaikan dalam batas waktu tersebut akan dibatalkan secara otomatis.

', gallery = gallery, seatmap = '' WHERE title = 'Golden Jubilee 2026' AND venue = 'Indonesia Arena, Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP', 3300000, 200, 60, '<ul>
 <li>This ticket is valid for 1 person.</li>
 <li>⁠Seating is located on VVIP zone 1st/ground floor.</li>
 <li>Free Seating (No Assigned Seats).</li>
 <li>Ticket price excludes 10% government tax, 5% administration fee, and platform fee.</li>
 <li>If you using wheelchair please contact customer service.</li>
</ul>' FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP', 1400000, 400, 120, '<ul>
 <li>This ticket is valid for 1 person.</li>
 <li>Seating is located on VIP zone 1st/ground floor.</li>
 <li>Free Seating (No Assigned Seats).</li>
 <li>Ticket price excludes 10% government tax, 5% administration fee, and platform fee.</li>
 <li>If you using wheelchair please contact customer service.</li>
</ul>' FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'TELESKOPIK', 1100000, 350, 105, '<ul>
 <li>This ticket is valid for 1 person.</li>
 <li>Seating is located on teleskopik zone 1st/ground floor.</li>
 <li>Free Seating (No Assigned Seats).</li>
 <li>Ticket price excludes 10% government tax, 5% administration fee, and platform fee."</li>
</ul>' FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'SILVER', 125000, 2000, 600, '<ul>
 <li>This ticket is valid for 1 person.</li>
 <li>Seating is located on Silver zone 4th floor.</li>
 <li>Free Seating (No Assigned Seats).</li>
 <li>Ticket price excludes 10% government tax, 5% administration fee, and platform fee.</li>
</ul>' FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'DONASI KURSI KASIH', 300000, 50, 15, '<ul>
 <li>
 <style type="text/css"><!--br {mso-data-placement:same-cell;}-->
 </style>
 <strong>Kursi kasih akan disalurkan langsung oleh tim KLMTD Goju.</strong></li>
 <li><strong>QRCode tidak diberikan kepada pemberi donasi.</strong></li>
</ul>' FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat';
UPDATE events SET description = 'GOOD DAY SCHOOLIOCUS - Harmony In Collaboration Vol 4

Kompetisi Angklung Tingkat SMA terbesar di Jawa Barat kembali hadir di bulan Oktober 2026.

Kali ini mendatangkan guest star:

Saung Angklung Udjo, DIA - Stand Here Alone & Juicy Luicy.

 

Selain penampilan di atas kalian juga dapat mengikuti banyak games seru dan hadiah menarik setiap kalian memenangkan games.', terms_conditions = 'Ketentuan Umum

Bawa e-tiket untuk ditukarkan dengan wristband saat check-in

Setiap pengunjung akan mendapatkan 1 renteng kopi Good Day dan Passport Activity Event.

Barang yang Dilarang (Don''ts)

Dilarang membawa senjata tajam, bahan peledak, atau benda berbahaya lainnya.

Dilarang membawa kamera profesional, lensa panjang, atau alat perekam video profesional tanpa seizin panitia penyelenggara.

Dilarang membawa obat-obatan terlarang dan alkohol.

Barang yang Dianjurkan (Do''s)

Membawa obat-obatan pribadi yang dibutuhkan.

Membawa jas hujan.

Menggunakan pakaian yang nyaman dan alas kaki yang aman.', gallery = gallery, seatmap = '' WHERE title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND venue = 'Laswi Heritage, Bandung';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE', 25000, 1000, 300, 'PRESALE' FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung';
UPDATE events SET description = 'Karaoke musik JKT48 merupakan suatu kesenangan terutama bagi seluruh penggemar musik JKT48, tentunya dengan adanya acara ini bisa memperketat silaturahmi bagi anak muda, jangan sampai lewatkan keseruan acara ini karena acara ini akan lebih meriah ditahun sebelumnya, Jangan lupa datang pada acara karaoke bu Aldan group dengan waktu yang sudah di tentukan.', terms_conditions = 'Ketentuan Umum Peserta/Pengunjung

Setiap peserta atau pengunjung 
wajib memiliki tiket
 atau tanda pengenal sah yang terdaftar atas nama pribadi.

Peserta wajib mematuhi 
batas usia minimum
 yang telah ditentukan oleh pihak penyelenggara (jika ada, misal: 17 tahun ke atas).

Seluruh peserta dilarang membawa senjata tajam, obat-obatan terlarang, alkohol, atau benda berbahaya lainnya ke area acara.

Penyelenggara berhak mengeluarkan peserta dari area acara tanpa pengembalian dana jika melakukan tindakan provokatif, merusuh, atau melanggar hukum. [
1
]

2. Ketentuan Tiket dan Pendaftaran

Tiket yang sudah dibeli 
tidak dapat dikembalikan
 (
non-refundable
) atau ditukarkan dengan alasan apa pun, kecuali acara dibatalkan oleh pihak penyelenggara.

Pendaftaran atau pembelian tiket hanya sah jika dilakukan melalui platform resmi yang ditunjuk oleh panitia.

Penyelenggara tidak bertanggung jawab atas kerugian akibat pembelian tiket melalui pihak ketiga yang tidak resmi.

3. Ketentuan Khusus (Jika Event Berupa Lomba/Kompetisi)

Karya atau penampilan peserta harus 
murni hasil karya sendiri
 (
original
) dan tidak melanggar hak cipta pihak lain.

Peserta wajib mengikuti seluruh 
jadwal dan tahapan acara
 yang telah ditetapkan oleh panitia.

Keputusan dewan juri bersifat 
mutlak dan tidak dapat diganggu gugat
. [
1
]

4. Kebijakan Pembatalan dan Perubahan Acara

Penyelenggara berhak untuk mengubah susunan acara (
rundown
), waktu, atau lokasi jika terjadi keadaan darurat di luar kendali panitia (
force majeure
).

Jika acara dibatalkan sepenuhnya oleh penyelenggara, informasi mengenai prosedur pengembalian dana akan diumumkan melalui saluran resmi.

5. Privasi dan Hak Publikasi

Dengan menghadiri atau mengikuti acara ini, peserta memberikan izin kepada penyelenggara untuk mengambil foto, video, atau rekaman suara selama acara berlangsung.

Dokumentasi tersebut dapat digunakan oleh panitia untuk keperluan publikasi, promosi, dan media sosial tanpa kewajiban memberikan kompens', gallery = gallery, seatmap = '' WHERE title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND venue = 'ILLUA SOJU BOX, Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE NOWING', 15000, 1, 0, '' FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE SPC', 30000, 20, 6, '' FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat';
UPDATE events SET description = 'SYARAT DAN KETENTUAN BADONCI FESTIVAL

1.⁠ ⁠UMUM

 
Badonci Festival diselenggarakan oleh penyelenggara resmi PT. Sigma Pro Indonesia 

 
Syarat dan ketentuan ini berlaku untuk semua pengunjung, peserta, artis, vendor, dan pihak terkait yang terlibat dalamacara.

 
Penyelenggara berhak mengubah syarat dan ketentuan kapan saja tanpa pemberitahuan terlebih dahulu, denganpembaruan akan diumumkan melalui kanal resmi festival.

 

2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET

 
Tiket hanya bisa dibeli melalui kanal resmi yang telah ditentukan LOKET.COM.

 
⁠Setiap tiket hanya sah untuk satu orang dan tidak dapat dipindahkan kepemilikan atau dijual kembali tanpa izinpenyelenggara.

 
Tiket yang hilang, rusak, atau palsu tidak akan diganti atau diterima masuk.

 
Pengunjung harus menunjukkan tiket berupa QR Code atau bukti pembayaran elektronik yang valid saat masuk area festival.

 

3.⁠ ⁠SYARAT MASUK AREA FESTIVAL

 
Pengunjung di bawah umur harus ditemani oleh orang tua atau wali yang bertanggung jawab.

 
⁠Semua pengunjung wajib menjalani pemeriksaan keamanan sebelum masuk area festival.

 
⁠Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung yang tidak mematuhi peraturan atau menunjukkanperilaku yang mengganggu ketertiban.

 

4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN

Barang terlarang:

 
Senjata api, senjata tajam, dan benda berbahaya lainnya.

 
Narkoba, alkohol, dan zat terlarang lainnya.

 
⁠Bahan peledak atau bahan yang dapat menyebabkan kebakaran.

 
⁠Benda keras atau tajam yang dapat digunakan sebagai alat serangan.

 
Drinks dan makanan dari luar area festival (kecuali untuk kebutuhan kesehatan khusus dengan izin tertulis).

Barang diizinkan (dengan pembatasan):

 
Tas kecil atau ransel dengan ukuran maksimal [misal: 40x30x20 cm].

 
⁠Perlengkapan medis pribadi dengan izin petugas keamanan.

 
⁠Kamera foto/video non-profesional (tanpa tripod atau peralatan besar).

 
⁠Sunscreen, topi, dan payung untuk perlindungan dari cuaca.

 

5.⁠ ⁠PERILAKU PENGUNJUNG

 
Seluruh pengunjung diharapkan bertingkah laku sopan dan menghormati sesama pengunjung, artis, dan petugas acara.

 
Tidak diperbolehkan melakukan tindakan kekerasan, pelecehan, atau ujaran kebencian.

 
⁠Tidak diperbolehkan merusak atau mengganggu fasilitas dan properti festival.

 
Merokok hanya diperbolehkan di area merokok yang telah ditentukan.

 

6.⁠ ⁠HAK DAN TANGGUNG JAWAB PENYELENGGARA

 
Penyelenggara berhak membatalkan atau menangguhkan acara karena alasan keamanan, cuaca ekstrem, atau kondisi takterduga lainnya. Dalam hal ini, pengembalian tiket akan diatur sesuai kebijakan yang telah ditentukan.

 
Penyelenggara tidak bertanggung jawab atas kehilangan, kerusakan, atau cedera yang terjadi pada pengunjung akibatkelalaian pribadi atau tidak mematuhi peraturan.

 
Penyelenggara berhak mengambil foto atau video selama acara untuk keperluan promosi dan dokumentasi, denganpengunjung dianggap telah menyetujui penggunaan gambar tersebut.

 

7.⁠ ⁠KESEHATAN DAN KEAMANAN

 
Pengunjung den', terms_conditions = 'SYARAT DAN KETENTUAN BADONCI FESTIVAL

1.⁠ ⁠UMUM

Badonci Festival diselenggarakan oleh penyelenggara resmi PT. Sigma Pro Indonesia 

Syarat dan ketentuan ini berlaku untuk semua pengunjung, peserta, artis, vendor, dan pihak terkait yang terlibat dalamacara.

Penyelenggara berhak mengubah syarat dan ketentuan kapan saja tanpa pemberitahuan terlebih dahulu, denganpembaruan akan diumumkan melalui kanal resmi festival.

2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET

Tiket hanya bisa dibeli melalui kanal resmi yang telah ditentukan LOKET.COM.

⁠Setiap tiket hanya sah untuk satu orang dan tidak dapat dipindahkan kepemilikan atau dijual kembali tanpa izinpenyelenggara.

Tiket yang hilang, rusak, atau palsu tidak akan diganti atau diterima masuk.

Pengunjung harus menunjukkan tiket berupa QR Code  atau bukti pembayaran elektronik yang valid saat masuk area festival.

3.⁠ ⁠SYARAT MASUK AREA FESTIVAL

Pengunjung di bawah umur harus ditemani oleh orang tua atau wali yang bertanggung jawab.

⁠Semua pengunjung wajib menjalani pemeriksaan keamanan sebelum masuk area festival.

⁠Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung yang tidak mematuhi peraturan atau menunjukkanperilaku yang mengganggu ketertiban.

4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN

Barang terlarang:

Senjata api, senjata tajam, dan benda berbahaya lainnya.

Narkoba, alkohol, dan zat terlarang lainnya.

⁠Bahan peledak atau bahan yang dapat menyebabkan kebakaran.

⁠Benda keras atau tajam yang dapat digunakan sebagai alat serangan.

Drinks dan makanan dari luar area festival (kecuali untuk kebutuhan kesehatan khusus dengan izin tertulis).

Barang diizinkan (dengan pembatasan):

Tas kecil atau ransel dengan ukuran maksimal [misal: 40x30x20 cm].

⁠Perlengkapan medis pribadi dengan izin petugas keamanan.

⁠Kamera foto/video non-profesional (tanpa tripod atau peralatan besar).

⁠Sunscreen, topi, dan payung untuk perlindungan dari cuaca.

5.⁠ ⁠PERILAKU PENGUNJUNG

Seluruh pengunjung diharapkan bertingkah laku sopan dan', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-08-22_f91ab905923b0b139a5eb36c99f1ccc80d8314d1e7ada7492690c78a4d290d21.webp"]', seatmap = '' WHERE title = 'BADONCI FESTIVAL DISK.2' AND venue = 'Pohon Kasih Megamas, Kota Manado';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1 - FESTIVAL', 150000, 4550, 1365, '' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FRESALE 1 - VIP', 250000, 650, 195, '' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL - BARENG SAYANG', 260000, 500, 150, '2 tiket' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP - BARENG SAYANG', 460000, 500, 150, '2 tiket' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FESTIVAL - BARENG TAMANG', 480000, 500, 150, '4 TIKET' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP - BARENG TAMANG', 880000, 500, 150, '4 TIKET' FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado';
UPDATE events SET description = 'Unfamiliar Weather Showcase adalah pertunjukan spesial dari In Inertia untuk merayakan album kedua mereka, Unfamiliar Weather.

Pertunjukan akan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak. In Inertia akan membawakan rangkaian lagu dari album Unfamiliar Weather dalam sebuah format pertunjukan yang memadukan musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik.

Setiap elemen dirancang sebagai satu kesatuan untuk membawa penonton memasuki perjalanan emosional yang menjadi tema utama album ini, mulai dari perubahan, kehilangan, penerimaan, hingga usaha menemukan rasa nyaman di tengah situasi yang terasa asing.

Penonton akan diajak menikmati pertunjukan dari awal hingga akhir sebagai satu rangkaian cerita yang terbagi ke dalam dua babak.

Durasi pertunjukan: ±120 menit

Penampil: In Inertia

Format pertunjukan: 2 babak

Pengalaman: Musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik', terms_conditions = 'Syarat dan Ketentuan

Dengan membeli tiket 
Unfamiliar Weather Showcase
, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan berikut:

Tiket dan Akses Masuk

Satu tiket hanya berlaku untuk satu orang dan satu kali akses masuk.

Pengunjung wajib menunjukkan e-ticket dengan kode QR yang masih berlaku saat memasuki lokasi acara.

Kode QR bersifat rahasia. Kehilangan atau penyalahgunaan tiket akibat tiket dibagikan kepada pihak lain menjadi tanggung jawab pemilik tiket.

Tiket yang telah digunakan, diduplikasi, atau tidak dapat diverifikasi akan dinyatakan tidak berlaku.

Pembelian dan Pengembalian Tiket

Tiket yang telah dibeli tidak dapat dibatalkan, dikembalikan, ditukar, atau diuangkan kembali.

Tiket tidak boleh diperjualbelikan kembali dengan harga yang lebih tinggi dari harga resmi.

Panitia tidak bertanggung jawab atas tiket yang dibeli melalui pihak atau saluran tidak resmi.

Waktu Kehadiran

Pengunjung disarankan hadir lebih awal untuk proses registrasi dan pemeriksaan sebelum pertunjukan dimulai.

Pertunjukan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak.

Keterlambatan pengunjung tidak menjadi dasar untuk pengembalian dana.

Ketertiban Selama Pertunjukan

Pengunjung wajib mengikuti arahan panitia, petugas keamanan, dan pengelola lokasi.

Pengunjung diharapkan menjaga ketenangan serta tidak mengganggu jalannya pertunjukan maupun kenyamanan pengunjung lain.

Dilarang merokok, termasuk menggunakan rokok elektrik atau vape, di dalam area pertunjukan. Area merokok disediakan di luar aula.

Panitia berhak menolak atau mengeluarkan pengunjung yang melakukan tindakan berbahaya, mengganggu, merusak fasilitas, atau tidak mematuhi peraturan tanpa pengembalian dana.

Barang yang Dilarang

Senjata tajam, bahan peledak, benda berbahaya, obat-obatan terlarang, serta barang lain yang dapat membahayakan pengunjung tidak diperbolehkan dibawa ke dalam lokasi.

Panitia berhak melakukan pemeriksaan terhadap barang baw', gallery = '["https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_2f6f5f272e41c97f875c0328dc156e352f241373b18c7a627c6fb46799305488.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_a2cf9c7a7f7f8e327c2a74338d1d1cffeb819f353b0788251955e02bf72a0c07.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_fea78744c8d934faf45c2e2c147eb942a879144dc44528fb4c818187819ee295.webp","https://assets.loket.com/neo/production/images/event_gallery/2026-07-31_9b4a72be45c3f80fd6cb5d71fa6e4d07f639b42e1031f9b742c2093a4941af1a.webp"]', seatmap = '' WHERE title = 'In Inertia Showcase - Unfamiliar Weather' AND venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Reguler', 200000, 230, 69, 'Tiket untuk pertunjukan imersif “Unfamiliar Weather” oleh In Inertia' FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan';
UPDATE events SET description = 'UNDERGROUND SUPREME: Rise The Underground Culture

Kultur Hip-Hop bukan sekadar musik, melainkan sebuah wadah ekspresi kreatif, seni, dan pergerakan komunitas. KRAZY BRAZY KARAWANG dengan bangga mempersembahkan 
UNDERGROUND SUPREME
, sebuah panggung representatif yang dirancang untuk merayakan energi kultur Hip-Hop lokal serta membangun ekosistem kreatif urban yang lebih besar di Karawang. 

Dengan mengusung semangat 
"Rise The Underground Culture"
, event ini memadukan konser musik dengan berbagai aktivasi komunitas kreatif untuk memberikan pengalaman hiburan alternatif yang segar, eksklusif, dan berkualitas bagi generasi muda. 

Lineup & Pengisi Acara

Bersiaplah untuk merayakan energi skena 
underground
 bersama deretan talenta Hip-Hop terbaik: 

Main Performance (Guest Stars):
 Penampilan rap yang energik, gelap, dan khas dari Coming soon Guess Star

Local Heroes:
 Aksi panggung memukau dari 3 Local Heroes yang siap membakar atmosfer acara. 

Creative Experience

Tidak hanya menyajikan pertunjukan musik di panggung utama, UNDERGROUND SUPREME juga menghadirkan pengalaman interaktif yang melibatkan massa secara langsung: 

Live Printing & Sablon Area:

 Area kreatif interaktif di mana pengunjung bisa melihat dan merasakan langsung proses pembuatan karya sablon.
 

Merchandise Area:

 Tempat berburu berbagai produk kreatif eksklusif sebagai bagian dari identitas event dan komunitas.
 

UMKM & Brand Local Booth:

 Ruang khusus bagi 

brand

 lokal dan pelaku usaha kreatif untuk memperkenalkan produk urban terbaik mereka kepada audiens.
 

Detail Pelaksanaan Event

Hari/Tanggal:

 Minggu, 25 Oktober 2026
 

Waktu:

 15.00 WIB – 01.55 WIB (

Open Gate

 & penukaran tiket dimulai pukul 15.00 WIB)
 

Lokasi:

 District 163 Karawang (Jl. Tarumanagara No. 6, Ruko Karawang Hijau, Purwadana, Kecamatan Telukjambe Timur, Karawang)
 

Jangan sampai kehabisan! Kuota tiket terbatas. Amankan tiketmu sekarang juga, jadilah bagian dari solidaritas komunitas, dan rasakan pengalaman kultur urban yang autentik bersama Krazy Brazy Karawang!', terms_conditions = 'Berikut adalah draf 
Syarat & Ketentuan (Terms & Conditions)
 yang standar, jelas, dan aman untuk dicantumkan di halaman penjualan tiket UNDERGROUND SUPREME di Loket.com:

Syarat & Ketentuan Pembelian & Masuk Event

Mohon dibaca dengan saksama demi kenyamanan dan kelancaran bersama selama rangkaian event UNDERGROUND SUPREME oleh KRAZY BRAZY KARAWANG.
 

1. Pembelian & Penukaran Tiket

Saluran Resmi:
 Tiket resmi hanya dapat dibeli melalui platform Loket.com. Penyelenggara tidak bertanggung jawab atas penipuan atau tiket palsu yang dibeli melalui pihak ketiga atau calo.

Non-Refundable:
 Tiket yang sudah dibeli tidak dapat dibatalkan, ditukar, atau diuangkan kembali dengan alasan apa pun, kecuali terjadi pembatalan acara oleh pihak penyelenggara.

Proses Penukaran:

 Penukaran tiket 

presale

 menjadi gelang tanda masuk (

wristband

) dapat dilakukan di venue (District 163 Karawang) mulai hari Minggu, 25 Oktober 2026 pukul 15.00 WIB.
 

Bukti Identitas:
 Pengunjung wajib menunjukkan E-Voucher resmi dari Loket.com beserta kartu identitas asli yang sah (KTP/SIM/Paspor/Kartu Pelajar) yang sesuai dengan nama saat pembelian tiket.

2. Batasan Usia & Akses Masuk

Ketentuan Usia:

 Mengingat target audiens event ini adalah segmen usia 15–30 tahun, pengunjung di bawah usia 15 tahun wajib didampingi oleh orang tua atau orang dewasa.
 

Hak Masuk:
 Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung dari area venue jika tidak mematuhi peraturan yang berlaku atau membuat kerusuhan demi kenyamanan pengunjung lain.

3. Protokol Keamanan & Barang Bawaan

Pemeriksaan Barang:

 Seluruh pengunjung wajib melewati prosedur pemeriksaan keamanan (

body check

 & 

bag check

) oleh petugas sebelum memasuki area konser indoor District 163 Karawang.
 

Barang yang Dilarang:
 Pengunjung 
dilarang keras
 membawa barang-barang berikut ke dalam venue:

Senjata api, senjata tajam, atau benda berbahaya lainnya.

Narkoba, psikotropika, dan zat adiktif terlarang lainnya.

Makanan da', gallery = gallery, seatmap = '' WHERE title = 'Underground Supreme' AND venue = 'District 163, Kab. Karawang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 1 - Underground Supreme', 160000, 300, 90, 'Tiket UNDERGROUND SUPREME Presale 1. Kuota terbatas! Akses masuk area konser Hip-Hop dan area kreatif. Amankan tiketmu sekarang juga!' FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Presale 2 - Underground Supreme', 200000, 500, 150, 'Tiket UNDERGROUND SUPREME Presale 2. Kuota terbatas! Akses masuk area konser Hip-Hop dan area kreatif. Amankan tiketmu sekarang juga!' FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang';
UPDATE events SET description = 'Menginjak dua dekade, 
Titik Sadrah
 hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi 
for Revenge
, melainkan ruang sakral yang merangkum gelombang emosi band, 
Archims Pribadi (Chimot) 
secara personal, dan 
for Revenge Family
. Sebuah memoar bersama untuk berhenti memaksakan apa yang telah karam dan mulai berdamai dengan kenyataan yang mematahkan arah.

Kita semua pernah tersapu arus emosi liar hingga tenggelam di palung terendah. Bagi 
Chimot
, palung itu adalah penerimaan pahit bahwa di tahun ke-20 ini ia tidak bisa lagi berdiri di balik set drumnya. Bagi 
for Revenge
, ini adalah patah hati terdalam karena kehilangan detak jantung keseharian mereka. Sementara bagi 
for Revenge Family
, ini adalah fase transisi berat untuk menerima keadaan dan formasi yang baru.

Namun, kita disadarkan bahwa di setiap arus deras, selalu ada muara yang menanti. Di titik ini kita belajar bahwa tidak semua hal harus dipaksa untuk tetap tinggal, karena beberapa hal justru baru menemukan makna sejatinya saat kita memilih ikhlas melepaskan. Di muara inilah kita bertemu untuk saling menguatkan.

Mari rayakan ruang penerimaan ini di Titik Sadrah
 Bandung, Eldorado Sport & Convention Hall 
pada
 31 Oktober September 2026
, dan Titik Sadrah 
Kuala Lumpur
. Datanglah untuk melarung segala yang menyesakkan, biarkan semuanya usai di titik ini, dan pulanglah membawa awal yang baru.', terms_conditions = 'SYARAT & KETENTUAN - Titik Sadrah for Revenge 

 

Dengan membeli tiket 
Titik Sadrah for Revenge
, Anda telah menyetujui seluruh Syarat & Ketentuan yang berlaku di bawah ini. Harap baca dengan saksama demi kenyamanan dan keselamatan semua pihak yang terlibat, terutama anak-anak dan keluarga.

 

Dengan membeli dan/atau menggunakan tiket ini, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh isi dokumen ini sebagai bentuk perjanjian yang mengikat antara pengunjung dan penyelenggara. Syarat & Ketentuan ini berlaku setara dengan kontrak dan dapat dijadikan acuan hukum apabila terjadi pelanggaran.

 

PEMBELIAN TIKET

 

Tiket hanya dapat dibeli melalui 

forrevenge.id

 

 

Harga tiket belum termasuk: Pajak Hiburan Daerah 10%, Biaya Admin 5%, dan Biaya platform pembayaran.

 

Gunakan data identitas yang valid (KTP/SIM/Paspor) saat membeli tiket. Tiket tidak dapat diubah setelah pembelian.

 

Setiap transaksi Presale dan General Sale maksimal dapat membeli 4 (empat) tiket menggunakan data diri yang berbeda.

 

Satu tiket berlaku untuk satu orang dan tidak dapat digunakan untuk keluar-masuk (no re-entry).

 

Tiket bersifat digital dan akan tersedia H-5 konser melalui aplikasi 
Loket X
 (tersedia di Play Store dan App Store). 

 

Tiket ini hanya untuk keperluan pribadi. Dilarang dijual kembali atau digunakan untuk kepentingan komersial tanpa izin promotor.

 

Pelanggaran terhadap ketentuan pembelian tiket dapat menyebabkan pembatalan tiket tanpa pengembalian dana.

 

Semua penjualan bersifat final. Tidak ada pengembalian dana, pertukaran, atau pengalihan kepemilikan.

 

PEMBELIAN TIKET Add-on

 

Terdapat tiga jenis 
Add-on Benefit
 yang dapat dibeli pada tanggal 12 Juli 2026 melalui 

forrevenge.id

 

: 

 

Exclusive T-Shirt Long Sleeve 

 

Exclusive T-Shirt Short Sleeve 

 

Exclusive CD Set Perayaan Patah Hati - Babak 2 

 

 

Add-on Benefit
 ini memberikan akses tambahan di luar tiket konser, namun tidak dapat dibeli tanpa memiliki tike', gallery = gallery, seatmap = '' WHERE title = 'Titik Sadrah for Revenge' AND venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival A ', 450000, 985, 295, '<ul>
 <li>1 tiket Konser Titik Sadrah for Revenge</li>
 <li>⁠1 tiket berlaku untuk satu orang</li>
 <li>Harga tiket belum termasuk Pajak Hiburan Daerah 10%, Biaya Admin 5%</li>
</ul>' FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival B', 400000, 645, 193, '<ul>
 <li>1 tiket Konser Titik Sadrah for Revenge</li>
 <li>⁠1 tiket berlaku untuk satu orang</li>
 <li>Harga tiket belum termasuk Pajak Hiburan Daerah 10%, Biaya Admin 5%</li>
</ul>' FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung';
UPDATE events SET description = 'Memories Of The Soul
 adalah sebuah perhelatan musik yang menghadirkan kembali lagu-lagu hits terbaik era 80-an, 90-an, hingga awal 2000-an yang penuh kenangan. Event ini dirancang sebagai momen &ldquo;temu kangen&rdquo; bagi para pecinta musik lintas generasi untuk kembali merasakan suasana hangat, romantis, dan penuh memori indah melalui lantunan lagu yang tak lekang oleh waktu.

Dikemas dengan konsep panggung elegan, tata cahaya spektakuler, dan kualitas tata suara premium, event ini menghadirkan pengalaman eksklusif dan berkelas. Tidak hanya menyuguhkan hiburan, acara ini juga menjadi ruang silaturahmi, networking, serta ajang mempererat kebersamaan dalam suasana yang nyaman dan penuh nostalgia.

Dengan segmentasi audiens usia 35&ndash;60 tahun, kalangan profesional, eksekutif, dan komunitas pecinta musik nostalgia, event ini diharapkan menjadi event tahunan yang dinantikan serta memberikan nilai tambah promosi dan eksposur maksimal bagi para sponsor yang terlibat.', terms_conditions = 'Syarat dan Ketentuan / Terms & Conditions

Dengan membeli tiket 
Memories Of The Soul
, Pembeli Tiket dan Pemegang Tiket dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.

 

Ticketing & Admission

Satu tiket berlaku untuk 1 (satu orang) pada 1 (satu) kali jadwal pertunjukan.

Pembeli Tiket wajib menunjukkan e-ticket yang valid untuk memasuki area acara.

Tiket yang telah dipindai (scan) dianggap telah digunakan dan tidak dapat digunakan kembali.

Tiket yang telah dibeli tidak dapat ditukar, dibatalkan, ataupun diuangkan kembali.

Penyelenggara berhak menolak akses masuk apabila tiket tidak valid, rusak, atau terindikasi duplikasi.

Dilarang memperjualbelikan kembali tiket dengan harga di atas harga resmi yang telah ditentukan oleh Penyelenggara.

 

Pertunjukan ini dianjurkan untuk penonton usia 5 tahun ke atas.

Anak di bawah usia 5 tahun dilarang memasuki ruangan teater dan dilarang membeli tiket.

Anak di atas 5 tahun yang ikut menonton wajib memiliki tiket sendiri.

Penonton wajib hadir sesuai jadwal yang dipilih dan duduk sesuai nomor kursi yang dipilih.

 

Ketertiban & Kenyamanan

Penonton wajib mengikuti arahan petugas keamanan dan panitia selama acara berlangsung.

Penyelenggara berhak mengeluarkan penonton dari area acara apabila dianggap melakukan tindakan yang mengganggu, berbahaya, diskriminatif, atau melanggar hukum tanpa pengembalian dana.

 

Barang yang Tidak Diperbolehkan

Membawa Makanan dan Minuman ke dalam ruangan Teater

Senjata tajam, benda berbahaya, dan bahan mudah terbakar

Minuman beralkohol, narkotika, dan zat terlarang lainnya.

Kamera profesional (DSLR/mirrorless) dan peralatan recording profesional tanpa izin resmi.

 

PERHATIAN

Tiket hanya dijual melalui kanal resmi yang telah ditentukan oleh Penyelenggara. Penyelenggara tidak bertanggung jawab atas pembelian tiket melalui pihak tidak resmi atau calo.

Biaya Pajak, biaya administrasi dan biaya platform di tanggung oleh Penonton

Penyelenggara', gallery = gallery, seatmap = '{"name":"BALAI SARBINI","image":"https://assets.loket.com/neo/production/images/seating_chart/20260722132843_6a60631b07131.jpeg"}' WHERE title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND venue = 'Balai Sarbini, DKI Jakarta';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP Kursi Atas', 2000000, 33, 9, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VVIP Kursi Depan', 1500000, 64, 19, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP', 1300000, 24, 7, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Platinum', 1000000, 162, 48, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold', 750000, 471, 141, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Silver', 500000, 250, 75, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Bronze', 350000, 148, 44, '' FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta';
UPDATE events SET description = 'PGR Vol. 11 @Jakarta', terms_conditions = 'Tiket yang sah adalah yang dibeli melalui Loket.com. Promotor tidak bertanggungjawab terhadap validitas tiket yang dibeli dari pihak ketiga.

 
Tiket berlaku untuk 1 orang, 1 kali masuk venue, tidak diperkenankan re-entry.

 
Pemegang 
Tiket VIP
 masuk melalui gate khusus, mendapat area khusus di depan stage dengan kapasitas terbatas. Tiket VIP ditukarkan dengan gelang/ID. Boleh keluar-masuk area VIP dengan menunjukkan gelang/ID.

 
Disediakan gate khusus prioritas: anak-anak, ibu hamil, lanisa, dan penonton berkebutuhan khusus. Harap menghubungi petugas untuk mendapat bantuan.

 
Harap membawa tiket dari Loket.com pada saat memasuki venue. Tiket tidak perlu di-print, cukup ditunjukkan di gate untuk di-scan oleh petugas.

 
Penyelenggara memiliki hak untuk:

 - Melarang masuk pengunjung jika tiket telah dipergunakan oleh orang lain.

 - Melarang masuk pengunjung ke area venue jika tiket tidak valid.

 - Memproses atau mengajukan hukum, baik perdata atau kriminal kepada pengunjung yang mendapatkan tiket dengan ilegal, termasuk memalsukan dan menggandakan tiket yang sah atau mendapatkan tiket dengan cara yang tidak sesuai prosedur.

 
Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.

 
Ticket yang telah dibeli tidak dapat diuangkan kembali dengan alasan apapun.

 
Pihak penyelenggara akan menindak tegas, dan berhak mengeluarkan pengunjung apabila berperilaku tidak tertib, dalam pengaruh alkohol, menyinggung atau berperilaku yang tidak pantas, dan tamu yang menolak untuk mematuhi instruksi / peringatan dari staf festival / event. Tidak akan ada pengembalian uang.

 
Tamu bertanggung jawab sepenuhnya atas keamanan semua barang-barang pribadi. Kehilangan barang pribadi bukan tanggung jawab', gallery = gallery, seatmap = '' WHERE title = 'PGR Vol. 11 @Jakarta' AND venue = 'JIExpo Kemayoran, Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR Vol. 11 - FESTIVAL PRESALE', 100000, 5000, 1500, '<ul>
 <li><em><strong>Harga Belum termasuk pajak dan admin fee</strong></em></li>
</ul>' FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PGR Vol. 11 - VIP PRESALE', 250000, 300, 90, '<ul>
 <li><em><strong>Harga Belum termasuk pajak dan admin fee</strong></em></li>
</ul>' FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat';
UPDATE events SET description = '🎉
 JONGFEST 2026 🎉

THE BIG FESTIVAL MUSIC LIVE IN MESUJI

Bersiaplah menjadi bagian dari salah satu festival musik terbesar di Kabupaten Mesuji!

JONG MESOEDJINEN
 dengan bangga mempersembahkan 
JONGFEST 2026
, menghadirkan penampilan spesial dari 
xxxxx
 
xxxx
 
xxxxx
 , 
xxxxxxxxx ,
 
xxxxxxxxxx
 dan 
xxxxx xxxx 
dalam satu panggung spektakuler.

Nikmati malam penuh hiburan dengan lagu-lagu hits yang akan membuat seluruh penonton bernyanyi bersama. Selain konser musik, pengunjung juga dapat menikmati berbagai tenant kuliner UMKM, area festival, serta beragam aktivitas menarik lainnya.

Jangan lewatkan kesempatan menjadi bagian dari sejarah festival musik terbesar di Mesuji!

🎤 Line Up

xxxxx xxxx xxxxx

xxxxxxxxxx

xxxxxxxxx

xxxxx xxxx 

INFUSE BAND 

(Line Up akan ditampilkan bertahap setelah tiket Early Bird terpenuhi!) 

📅 Informasi Acara

Tanggal:
 10 November 2026

Waktu:
 16.00 WIB – 22.00 WIB

Lokasi:
 Alun-Alun Simpang Pematang Kecamatan Simpang Pematang, Kabupaten Mesuji, Lampung

🎟️ Kategori Tiket

Early Bird 
(Kuota Terbatas)

Presale

Reguler

VIP 
(jika tersedia) 

Tiket yang telah dibeli tidak dapat dikembalikan atau ditukar kecuali acara dibatalkan oleh penyelenggara.', terms_conditions = 'Peraturan Pengunjung

Wajib menunjukkan e-ticket beserta identitas diri saat masuk.

Dilarang membawa senjata tajam, narkoba, minuman keras, dan barang berbahaya lainnya.

Dilarang membawa makanan dan minuman dari luar area acara.

Penyelenggara berhak melakukan pemeriksaan barang bawaan demi keamanan bersama.

Dengan membeli tiket, pengunjung dianggap menyetujui seluruh ketentuan yang berlaku.

Follow Instagram & tiktok: 
@jongmesoedjinen
 untuk informasi terbaru mengenai line up, rundown, dan berbagai kejutan lainnya.

Sampai jumpa di 
JONGFEST 2026
! 🔥🎶', gallery = gallery, seatmap = '' WHERE title = 'JONGFEST 2026' AND venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'NORMAL FESTIVAL', 119000, 1200, 360, 'Dapatkan harga terbaik JONGFEST 2026! Kuota FESTIVAL terbatas. Berlaku hingga kuota habis. Amankan tiketmu sekarang!.' FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'NORMAL VIP', 139000, 700, 210, 'Dapatkan harga terbaik JONGFEST 2026! Kuota VIP terbatas. Berlaku hingga kuota habis. Amankan tiketmu sekarang!' FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang';
UPDATE events SET description = 'School is back, but make it a festival!🎒

High School Fest is The Biggest School Themed Festival Ever! So, saatnya seru-seruan menikmati musik, main bareng, dan ngerasain kembali vibes sekolah dengan line up yang ga kalah asik dari tahun sebelumnya!!

28–29 November 2026, Stadion Madya GBK, Jakarta.

DON’T MISS IT!', terms_conditions = 'TERMS & CONDITIONS

HIGH SCHOOL FEST 2026

28–29 November 2026 • Stadion Madya GBK, Jakarta

Dengan membeli tiket High School Fest 2026 (“HSF”), kamu dianggap telah membaca, memahami, menyetujui, dan bersedia mengikuti seluruh syarat dan ketentuan yang berlaku selama acara berlangsung. Please read this carefully before coming to the festival.

1. PEMBELIAN & PENGGUNAAN TIKET

Tiket resmi hanya dapat dibeli melalui official ticketing partner yang ditunjuk oleh penyelenggara. Penyelenggara tidak bertanggung jawab atas tiket yang dibeli melalui pihak atau kanal tidak resmi.

1 (satu) tiket berlaku untuk 1 (satu) orang sesuai kategori dan tanggal yang tertera pada tiket.

Tiket tidak boleh diperjualbelikan atau digunakan untuk kepentingan komersial, promosi, kontes, giveaway, atau kegiatan lainnya tanpa persetujuan tertulis dari penyelenggara.

Penyelenggara berhak membatalkan tiket yang diperoleh atau digunakan dengan cara yang melanggar ketentuan.

Batas maksimal pembelian tiket per transaksi mengikuti ketentuan yang tercantum pada masing-masing kategori tiket.

Jaga tiket dan data pembelianmu. Penyelenggara tidak bertanggung jawab atas tiket atau e-ticket yang hilang, disalahgunakan, atau berpindah tangan karena kelalaian pemilik.

E-ticket akan dikirimkan dalam bentuk QR code yang akan di kirimkan via e-mail kalian.

Mohon data - data dapat diisi dengan benar pada halaman checkout, karena segala macam kesalahan dalam memasukkan data - data, bukan menjadi tanggung jawab pihak promotor.

PIHAK PROMOTOR TIDAK MENYEDIAKAN ATAU MENJUAL TIKET DALAM BENTUK WRISTBAND, ID PASS, MAUPUN BENTUK TIKET FISIK LAINNYA

2. E-TICKET & CHECK-IN

E-ticket akan tersedia melalui kanal resmi ticketing sesuai mekanisme pembelian.

Saat check-in atau penukaran tiket, pengunjung wajib menunjukkan e-ticket dan identitas yang sesuai apabila diminta oleh panitia atau crew ground-handling.

E-ticket bersifat pribadi dan tidak diperbolehkan untuk dibagikan ke orang lain. Barcode/QR code yang tela', gallery = gallery, seatmap = '' WHERE title = 'HIGH SCHOOL FEST 2026' AND venue = 'Stadiun Madya B, GBK, Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'BLIND BOX 2 DAY PASS - (28-29 November 2026)', 100000, 61, 60, '' FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'PRESALE 1 - (2 DAYS PASS) 28-29 November 2026', 180000, 1000, 300, '<p>DAY 1</p>' FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan';
UPDATE events SET description = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA brings ENGENE the boy group''s first stadium show in Indonesia. Fresh off their newest chapter, the seven members take over Jakarta International Stadium with a setlist spanning their explosive discography, dramatic storytelling stages and the intricate choreography the group is famous for. Powered by PH Entertainment and Live Nation, the show promises state-of-the-art production, immersive visual effects and a stage experience that turns the concert into a storybook you step inside.', terms_conditions = 'Tickets can only be purchased through Loket.com via enhypeninjakarta.com. Ticket price excludes 10% government tax, 6% ticketing platform fee and any other applicable fees. ENGENE MEMBERSHIP Presale and General On-Sale are limited to a maximum of 6 tickets per transaction within the same category. One email address and one phone number is limited to 1 transaction. Ticket holders must arrive before the designated entry time; latecomers may be refused entry. All ticketing terms follow the promoter''s official announcement.', gallery = '["https://assets.loket.com/lp/sdk/prod/assets/banner/banner_1781766554_6a33999aa1874.jpg","https://assets.loket.com/imgdir/2026-06-27/b8/b8f61b4b5bcd6fd24ef04796056da4c8bca1d10b2189019350789212143.jpg","https://assets.loket.com/imgdir/2026-07-07/1e/1ef83cae5b9c88059510d109f0f77e7ee404f8ab379246850970799003.jpg"]', seatmap = '' WHERE title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND venue = 'Jakarta Utara';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP A & VIP B (Standing)', 3650000, 1200, 960, 'Access to soundcheck session
Special ENHYPEN VIP gift
Official VIP laminate & lanyard
Priority entry lane
Dedicated VIP merchandise fast lane' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 1 (Numbered Seating)', 3450000, 1500, 980, 'Official ENHYPEN merchandise set
Reserved numbered seating position assigned near show date' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 2 A, B & C (Numbered Seating)', 3250000, 1800, 1100, 'Reserved numbered seating
Best view of main stage' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 3 (Numbered Seating)', 2950000, 1600, 900, 'Reserved numbered seating' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 4 (Numbered Seating)', 2750000, 1400, 700, 'Reserved numbered seating' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 5 (Numbered Seating)', 2250000, 1300, 600, 'Reserved numbered seating' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 6 A & B (Numbered Seating)', 1850000, 1200, 500, 'Reserved numbered seating' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 7 A & B (Numbered Seating)', 1450000, 1000, 400, 'Reserved numbered seating' FROM events ev WHERE ev.title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND ev.venue = 'Jakarta Utara';
UPDATE events SET description = 'T.O.P, the legendary rapper of BIGBANG, returns to Indonesia with his first solo fan meeting in Asia - T.O.P PRE-STUDIO 2026. The event at Istora Senayan is an intimate, all-seated evening where his fans step into the ''PRE-STUDIO'' world: live performances from his solo catalogue, candid conversation, and behind-the-scenes stories from his decade-long career as an artist and actor. Presented by TONZ Entertainment with Three Mountains Ave as co-organizer, the night celebrates a more personal side of T.O.P ahead of his new chapter.', terms_conditions = 'Tickets can only be purchased through topinjakarta2026.com. Ticket price excludes 10% government tax, 5% admin fee and platform service fee. The fan meeting features 5 numbered-seating categories (VIP, CAT 1, CAT 2, CAT 3, CAT 4). All ticket holders must occupy their assigned seat. Raffle benefits are open only for tickets purchased until 5 September 2026 23:59 WIB; seat number is used as raffle number, each seat is eligible for one raffle benefit. Wheelchair users may only purchase CAT 1 category.', gallery = '["https://assets.loket.com/lp/sdk/prod/assets/banner/banner_1786518023_6a7c1a0741b62.jpg","https://assets.loket.com/imgdir/2026-08-10/fa/fa5f8c18f1a915e45d9667b61f4ea00ca0701a0b1169817151821412057.png","https://assets.loket.com/imgdir/2026-08-10/f6/f66a14d7484063bc40fa8bc4acf88992762838b31271941441076688668.png"]', seatmap = '{"name":"Istora Senayan - T.O.P PRE-STUDIO 2026 Seating Chart","image":"https://assets.loket.com/imgdir/2026-08-10/fa/fa5f8c18f1a915e45d9667b61f4ea00ca0701a0b1169817151821412057.png"}' WHERE title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP A / B / C Floor', 4100000, 800, 700, 'Send-off (All)
Soundcheck (All)
Group Photo 1:10 (Raffle)
Signed Poster (Raffle)
Signed Polaroid (Raffle)
VIP Laminated Pass & Lanyard (All)
Photocard (All)' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 1 Tribune', 3600000, 1200, 900, 'Signed Poster (Raffle)
Signed Polaroid (Raffle)
Photocard (All)' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 2 Tribune', 3000000, 1000, 650, 'Photocard (All)' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 3 Tribune', 2400000, 900, 550, 'Photocard (All)' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 4 Tribune', 2100000, 800, 480, 'Photocard (All)' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Restricted View', 1200000, 600, 300, 'Photocard (All)
Limited view of the stage' FROM events ev WHERE ev.title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'Hwang In Youp, the beloved actor behind True Beauty and Family by Choice, lands his Jakarta stop of the 2026 fan meeting tour <To you>. Held at Jakarta Concert Hall, this all-seated gathering is a heartfelt letter to his fans: songs and stories, games, and an unmissable Hi-Touch session for every single ticket holder. Presented by Three Mountains Ave, the show is produced as a cozy, intimate two-floor theatre experience.', terms_conditions = 'Tickets can only be purchased through hwanginyoupinjakarta2026.com. Ticket price excludes government tax and processing fees. All seat categories are numbered seating; the displayed seat plan is a reference and may be adjusted. Raffle benefits apply only to tickets purchased until 10 October 2026 23:59 WIB. Seat number is used as raffle number. Group Photo 1:2 winners are excluded from the Group Photo 1:20 draw.', gallery = '["https://assets.loket.com/lp/sdk/prod/assets/banner/banner_1787273676_6a87a1cc29372.png","https://assets.loket.com/imgdir/2026-08-20/54/54a5d0de453ff62a0e520c9486d5afa8d016f0381571351651460482587.png","https://assets.loket.com/imgdir/2026-08-20/61/615e8018ba24c68a2f4064c57480a85d983272ae1657430217775810119.png"]', seatmap = '' WHERE title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'FOREVER', 2900000, 800, 650, 'Hi-Touch (All)
Group Photo 1:2 (90 winners, raffle)
Group Photo 1:20 (All except 1:2 winners)
Signed Polaroid (10 winners, raffle)
Signed Poster (120 winners, raffle)
Photocard (All)' FROM events ev WHERE ev.title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'ALWAYS', 1900000, 900, 620, 'Hi-Touch (All)
Group Photo 1:20 (100 winners, raffle)
Signed Poster (30 winners, raffle)
Photocard (All)' FROM events ev WHERE ev.title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'Rapper, producer and creative force Ye (Kanye West) headlines his first-ever solo concert in Indonesia. YE JAKARTA 2026 takes over the main stadium of Gelora Bung Karno with a career-spanning production built around his boundary-pushing vision. Presented by Raw Vision Collective, the night brings his stadium-scale staging, genre-defying setlist and larger-than-life spectacle to Jakarta''s biggest stage.', terms_conditions = 'Tickets valid only via yejakarta.com. Ticket price excludes 10% government tax and 6% platform fee. Seated categories are numbered seating with seats assigned near show date. VIP benefit: one seat in VIP area, Surprise Box Set A, VIP laminate & lanyard. Super Fans Festival: early entry access, Surprise Box Set B, Super Fans laminate & lanyard.', gallery = '["https://assets.loket.com/neo/production/images/banner/20260727183422_6a67423e76dbc.png","https://assets.loket.com/neo/production/images/banner/20260808185643_6a77197b29ce4.jpeg"]', seatmap = '' WHERE title = 'YE JAKARTA 2026' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP East', 9850000, 500, 400, 'Numbered seat in VIP East area
Surprise Box Set A
VIP laminate & lanyard' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP West', 9850000, 500, 400, 'Numbered seat in VIP West area
Surprise Box Set A
VIP laminate & lanyard' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Super Fans Festival', 5850000, 2000, 1300, 'Standing early entry access
Surprise Box Set B
Super Fans laminate & lanyard' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 1 A & B', 4875000, 2000, 1400, 'Numbered seating' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 2 A & B', 3875000, 2200, 1500, 'Numbered seating' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival A & B', 3500000, 3000, 1800, 'Standing area' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 3 A & B', 2875000, 2500, 1300, 'Numbered seating' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 4 A & B', 1875000, 2500, 1100, 'Numbered seating' FROM events ev WHERE ev.title = 'YE JAKARTA 2026' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'The kings of K-pop return. BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > lands at Jakarta International Stadium, marking the reunited quintet''s return to Indonesian stages. Built around their monumental comeback, the show blends the group''s biggest anthems with the newest chapter of their discography on a massive cosmic-themed production. Presented by PK Entertainment, Sound Rhythm and AEG Presents, it is the most anticipated K-pop stadium event of the year.', terms_conditions = 'Tickets valid only via bigbanginjakarta.com. Price excludes 10% government tax, 6% platform fee and applicable admin fees. VIP packages (Ultimate/Diamond/Gold) include a set of 4 member photocard, dedicated check-in lane, exclusive tour VIP gift and laminate pass + lanyard. Ultimate VIP and Diamond VIP holders get fast lane access to merchandise. No Meet & Greet or photo session is included. Numbered seating tickets receive seat numbers near show date.', gallery = '["https://assets.loket.com/lp/sdk/prod/assets/banner/banner_1787129556_6a856ed429dd1.jpg","https://assets.loket.com/imgdir/2026-08-14/0b/0b4136d9ba49d1da9253b17aae707aece2b6ee83151895883896508919.jpg","https://assets.loket.com/imgdir/2026-08-26/17/17e2a1549eae255dde49076a77a87a17e388ba6f1213048299759518172.jpeg"]', seatmap = '' WHERE title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND venue = 'Jakarta Utara';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Ultimate VIP (Standing)', 6500000, 600, 500, '4 member BIGBANG photocard set
Dedicated check-in lane
Exclusive tour VIP gift
Laminate pass & lanyard
Merchandise fast lane' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Diamond VIP (Numbered Seating)', 6000000, 700, 580, '4 member BIGBANG photocard set
Dedicated check-in lane
Exclusive tour VIP gift
Laminate pass & lanyard
Merchandise fast lane' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold VIP (Numbered Seating)', 5500000, 700, 520, '4 member BIGBANG photocard set
Dedicated check-in lane
Exclusive tour VIP gift
Laminate pass & lanyard' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 1 A & B (Numbered Seating)', 4750000, 1600, 1100, 'Numbered seating' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 2 (Numbered Seating)', 3750000, 1600, 950, 'Numbered seating' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 3 (Numbered Seating)', 2850000, 1800, 1000, 'Numbered seating' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 4 (Numbered Seating)', 2550000, 1800, 900, 'Numbered seating' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 5 A & B (Numbered Seating)', 2250000, 1600, 700, 'Numbered seating' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 6 A & B (Numbered Seating, Restricted View)', 1850000, 1400, 600, 'Restricted view' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'CAT 7 A & B (Numbered Seating, Restricted View)', 1550000, 1200, 500, 'Restricted view' FROM events ev WHERE ev.title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND ev.venue = 'Jakarta Utara';
UPDATE events SET description = 'Snada brings its signature nasyid harmonies back to the stage with a night of acoustic excellence and spiritual energy. Curated to blend the group''s evergreen hits with new arrangements, the concert is a celebration of Indonesian Nasyid, complete with full live band and intimate storytelling between songs.', terms_conditions = 'Ticket price excludes 10% government tax and 5% admin fee. Seating is free seating within purchased zone unless stated otherwise. Doors open 1.5 hours before showtime.', gallery = gallery, seatmap = '' WHERE title = 'Snada Indonesia 2026' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Snada Indonesia 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'VIP', 750000, 300, 120, 'Front zone seating
Official concert tote bag' FROM events ev WHERE ev.title = 'Snada Indonesia 2026' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Festival', 450000, 800, 280, 'Standing area access' FROM events ev WHERE ev.title = 'Snada Indonesia 2026' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'A full-day workshop designed for HR leaders and people managers who want to turn their workforce into a competitive advantage. Through case studies, live exercises and practical frameworks, participants learn how to align people strategy with business goals, design performance systems that actually drive behaviour, and build an organisation where talent thrives. Led by certified practitioners with 15+ years of experience across SEA enterprises.', terms_conditions = 'Ticket includes workshop materials, lunch and coffee breaks. Seat is non-transferable. E-certificate awarded upon completion. Cancellation within 72 hours of the event is non-refundable.', gallery = gallery, seatmap = '' WHERE title = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND venue = 'Jakarta Pusat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Early Bird', 1200000, 40, 35, 'Full-day workshop
Workshop materials
Lunch & coffee break
E-certificate' FROM events ev WHERE ev.title = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND ev.venue = 'Jakarta Pusat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Reguler', 1500000, 50, 20, 'Full-day workshop
Workshop materials
Lunch & coffee break
E-certificate' FROM events ev WHERE ev.title = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND ev.venue = 'Jakarta Pusat';
UPDATE events SET description = 'The no-filter comedy battle returns. Adili Idola: Celebrity Roast puts a public figure on the dock and lets comics and celebrity friends roast them from every angle. A collaboration between Goldlive Indonesia and Comika, this edition''s star guest faces the sharpest one-liners, surprise guests and a live audience that votes on every hit. Expect the jokes to cut deep and the star to fight back.', terms_conditions = 'All tickets are free seating. Audience must be 17+ years old. Ticket price excludes 10% entertainment tax and 5% admin fee.', gallery = gallery, seatmap = '' WHERE title = 'Adili Idola: Celebrity Roast' AND venue = 'Jakarta Barat';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Adili Idola: Celebrity Roast' AND ev.venue = 'Jakarta Barat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Diamond', 950000, 100, 99, 'Closest viewing zone
Free seating' FROM events ev WHERE ev.title = 'Adili Idola: Celebrity Roast' AND ev.venue = 'Jakarta Barat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Platinum', 850000, 150, 149, 'Front-mid zone
Free seating' FROM events ev WHERE ev.title = 'Adili Idola: Celebrity Roast' AND ev.venue = 'Jakarta Barat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold', 700000, 200, 180, 'Mid zone
Free seating' FROM events ev WHERE ev.title = 'Adili Idola: Celebrity Roast' AND ev.venue = 'Jakarta Barat';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Silver', 500000, 250, 200, 'General zone
Free seating' FROM events ev WHERE ev.title = 'Adili Idola: Celebrity Roast' AND ev.venue = 'Jakarta Barat';
UPDATE events SET description = 'An unforgettable evening with two Manchester United legends. Football greats Park Ji-Sung and Patrice Evra share stories from the Old Trafford dressing room, their Champions League nights under Sir Alex Ferguson, and their lives after football - over a curated fine-dining menu. Limited to an intimate gathering, the night includes a Q&A session and photo opportunity with both icons.', terms_conditions = 'Ticket includes welcome drink, four-course dinner and premium seat at the storytelling session. Photo session with the legends included. Dress code: smart casual. Purchase is required for every attending guest.', gallery = gallery, seatmap = '' WHERE title = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND venue = 'Jakarta Selatan';
DELETE FROM ticket_categories tc USING events ev WHERE tc.event_id = ev.id AND ev.title = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Gold Seat', 3500000, 60, 45, 'Four-course dinner
Premium seating near stage
Q&A access
Photo with Park Ji-Sung & Patrice Evra' FROM events ev WHERE ev.title = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND ev.venue = 'Jakarta Selatan';
INSERT INTO ticket_categories (event_id, name, price, quota, sold, benefits)
SELECT ev.id, 'Dining Gallery', 2200000, 80, 50, 'Four-course dinner
Gallery seating
Q&A access' FROM events ev WHERE ev.title = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND ev.venue = 'Jakarta Selatan';
COMMIT;
