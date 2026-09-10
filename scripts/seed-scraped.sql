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
-- ============================================================
-- FULL T&C (from source APIs, HTML) — overrides truncated text
-- ============================================================
UPDATE events SET terms_conditions = '<p class="mb-2 relative"><span style="white-space: pre-wrap;">1. Tiket yang valid adalah yang dibeli melalui Artatix.co.id</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">2. Satu tiket berlaku untuk satu orang.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">3. Panitia/penyelenggara/promotor acara tidak bertanggung jawab/tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform yang bukan mitra resmi penjualan tiket "SYNC 2026: Luminaria”.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">5. Panitia/penyelenggara/promotor acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh pemerintah, panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">7. Panitia/penyelenggara/promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">8. Jika acara dibatalkan, promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">10. Harap membawa kartu ID asli dan e-Ticket dari Artatix.co.id saat melakukan penukaran tiket.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">11. Kami menyarankan agar para penonton tidak menggunakan kendaraan pribadi untuk datang ke acara SYNC 2026: Luminaria. Sekolah Saint John''s BSD hanya menyediakan tempat parkir di Sekolah Cikal Harapan dan tidak bisa menjamin ketersediaan tempat parkir di area lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">12. Promotor berhak untuk:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika tiket telah digunakan oleh orang lain.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area Saint John''s BSD jika tiket yang digunakan tidak valid.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan tiket secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan tiket yang sah atau memperoleh tiket dengan cara yang tidak sesuai dengan prosedur.</span></li></ul><p class="mb-2 relative"><span style="white-space: pre-wrap;">13. Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari area Sekolah Saint John''s BSD jika tidak mematuhi protokol kesehatan dan keamanan yang telah diterapkan.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">14. Barang yang boleh dibawa kedalam venue:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa kartu identitas dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa bukti tiket/tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa masker dan hand sanitizer</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa obat-obatan pribadi</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa jas hujan atau payung</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></li></ul><p class="mb-2 relative"><span style="white-space: pre-wrap;">15. Barang yang tidak diperbolehkan dibawa kedalam Sekolah Saint John’s BSD:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar&nbsp;</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR, Mirrorless dan Gopro.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Rokok, vape, rokok elektrik dan lain sejenisnya</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li></ul><p class="mb-2 relative"><span style="white-space: pre-wrap;">16. Pihak panitia/penyelenggara/promotor acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">17. Dilarang merokok di dalam area Sekolah Saint John’s BSD</span><br><span style="white-space: pre-wrap;">18. Dilarang membuat kerusuhan dalam situasi apapun di dalam area Sekolah Saint John’s BSD</span><br><br><br><br><b><strong class="font-bold" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN TIKET SYNC 2026 DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></p><p class="mb-2 relative"><b><strong class="font-bold" style="white-space: pre-wrap;">DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN.</strong></b></p>' WHERE title = 'SYNC 2026 ''Luminaria''' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Satu Entry Pass berlaku untuk satu orang.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Penonton dengan kategori anak-anak dan atau dengan tinggi badan di atas 100 cm wajib menggunakan tiket.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform yang bukan mitra resmi penjualan tiket.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun memiliki bukti pembelian. Tiket merupakan tanggung jawab pembeli.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Jika acara dibatalkan oleh Promotor, maka Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut, biaya administrasi yang timbul akan dibebankan ke pembeli, seperti : biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pembeli.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Harap membawa e-Ticket dari artatix.co.id saat melakukan penukaran tiket.</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Promotor berhak untuk:</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area&nbsp; MLDSPOT Fresh Concert On Wheels jika Entry Pass yang digunakan tidak valid.</span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari MLDSPOT Fresh Concert On Wheels jika tidak mematuhi protokol yang telah diterapkan.</span></li><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang tidak diperbolehkan dibawa kedalam&nbsp; MLDSPOT Fresh Concert On Wheels :</span></li><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Tidak membawa atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama</span></li><li value="18" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar.</span></li><li value="19" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR.</span></li><li value="20" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="21" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="22" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="23" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="24" class="dark:text-white"><span style="white-space: pre-wrap;">Vape, Rokok Elektrik dan lain sejenisnya kecuali Rokok MLD Fresh Cola.</span></li><li value="25" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li><li value="26" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li><li value="27" class="dark:text-white"><span style="white-space: pre-wrap;">Dilarang membuat kerusuhan dalam situasi apapun di dalam area&nbsp; MLDSPOT Fresh Concert On Wheels. </span><br><br><br><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></i><br><br><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN.</strong></b></i></li></ol>' WHERE title = 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Ketentuan Umum </span><br><span style="white-space: pre-wrap;">- Tiket resmi hanya dapat diperoleh melalui platform penjualan resmi yang ditunjuk oleh Panitia. (Artatix.id)</span><br><span style="white-space: pre-wrap;">- Satu tiket hanya berlaku untuk satu peserta.</span><br><span style="white-space: pre-wrap;">- Tiket yang telah dibeli tidak dapat dipindahtangankan, ditukar, ataupun diperjualbelikan kembali tanpa persetujuan Panitia.</span><br><span style="white-space: pre-wrap;">- Tiket yang hilang maupun rusak menjadi tanggung jawab peserta.</span><br><span style="white-space: pre-wrap;">- Peserta wajib menggunakan identitas asli yang sesuai dengan data registrasi.</span><br><span style="white-space: pre-wrap;">- Dengan melakukan pembelian tiket, peserta dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan acara.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Ketentuan Peserta</span><br><span style="white-space: pre-wrap;">- Fun Run bersifat non-kompetitif.</span><br><span style="white-space: pre-wrap;">- Peserta disarankan berusia minimal 12 tahun. Peserta di bawah 17 tahun wajib berada dalam pengawasan orang tua atau wali.</span><br><span style="white-space: pre-wrap;">- Peserta wajib berada dalam kondisi fisik yang sehat dan layak mengikuti kegiatan lari sejauh 5 kilometer.</span><br><span style="white-space: pre-wrap;">- Peserta dengan riwayat penyakit jantung, gangguan pernapasan, atau kondisi medis tertentu disarankan berkonsultasi dengan tenaga medis sebelum mengikuti acara.</span><br><span style="white-space: pre-wrap;">- Panitia berhak menghentikan peserta yang dinilai tidak layak melanjutkan kegiatan demi alasan keselamatan.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Race Pack</span><br><span style="white-space: pre-wrap;">- Race Pack hanya dapat diambil sesuai jadwal yang diumumkan Panitia.</span><br><span style="white-space: pre-wrap;">- Peserta wajib menunjukkan e-ticket beserta kartu identitas saat pengambilan Race Pack.</span><br><span style="white-space: pre-wrap;">- Race Pack yang tidak diambil sesuai jadwal dianggap hangus dan tidak dapat dikirimkan setelah acara berlangsung.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Ketentuan Selama Acara</span><br><span style="white-space: pre-wrap;">- Peserta wajib mengenakan BIB Number resmi selama mengikuti kegiatan.</span><br><span style="white-space: pre-wrap;">- Peserta wajib mengikuti rute yang telah ditentukan.</span><br><span style="white-space: pre-wrap;">- Dilarang memotong jalur (shortcut) maupun mengganggu peserta lain.</span><br><span style="white-space: pre-wrap;">- Peserta wajib mematuhi arahan Race Marshal, Petugas Medis, dan Panitia.</span><br><span style="white-space: pre-wrap;">- Peserta diwajibkan menjaga kebersihan dengan membuang sampah pada tempat yang telah disediakan.</span><br><span style="white-space: pre-wrap;">- Demi keamanan bersama, peserta tidak diperkenankan membawa hewan peliharaan selama kegiatan berlangsung.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang Disarankan</span><br><span style="white-space: pre-wrap;">- Handphone</span><br><span style="white-space: pre-wrap;">- Smartwatch/GPS Watch</span><br><span style="white-space: pre-wrap;">- Botol minum pribadi</span><br><span style="white-space: pre-wrap;">- Topi</span><br><span style="white-space: pre-wrap;">- Sunscreen</span><br><span style="white-space: pre-wrap;">- Obat-obatan pribadi</span><br><span style="white-space: pre-wrap;">- Uang tunai secukupnya</span><br><span style="white-space: pre-wrap;">- Kartu Identitas</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang Dilarang</span><br><span style="white-space: pre-wrap;">- Senjata tajam maupun benda berbahaya</span><br><span style="white-space: pre-wrap;">- Minuman beralkohol</span><br><span style="white-space: pre-wrap;">- Narkotika dan obat-obatan terlarang</span><br><span style="white-space: pre-wrap;">- Drone tanpa izin resmi</span><br><span style="white-space: pre-wrap;">- Sepeda, skateboard, maupun kendaraan bermotor di jalur lari</span><br><span style="white-space: pre-wrap;">- Hewan peliharaan</span><br><span style="white-space: pre-wrap;">- Barang lain yang dianggap membahayakan peserta</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Dokumentasi</span><br><span style="white-space: pre-wrap;">- Seluruh kegiatan akan didokumentasikan dalam bentuk foto maupun video.</span><br><span style="white-space: pre-wrap;">- Dengan mengikuti acara ini, peserta memberikan izin kepada Panitia untuk menggunakan dokumentasi tersebut sebagai materi publikasi, promosi, maupun dokumentasi ARTEFAC UNS dan Gendut Berlari tanpa kompensasi tambahan.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Force Majeure</span></li></ol><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">Panitia berhak mengubah jadwal, rute, lokasi, maupun membatalkan acara apabila terjadi keadaan kahar (force majeure), termasuk namun tidak terbatas pada cuaca ekstrem, bencana alam, kebijakan pemerintah, atau keadaan lain di luar kendali Panitia.</span></p><ol start="9" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Keselamatan</span></li></ol><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">Keamanan dan keselamatan peserta merupakan prioritas utama. Meskipun Panitia telah menyediakan petugas medis, marshal, serta sistem pengamanan selama acara berlangsung, setiap peserta tetap bertanggung jawab atas kondisi kesehatan dan barang pribadinya masing-masing.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">Dengan melakukan registrasi dan mengikuti (nama event), peserta menyatakan telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku serta bersedia mengikuti seluruh arahan Panitia demi terciptanya acara yang aman, nyaman, dan menyenangkan bagi seluruh peserta.</span></p>' WHERE title = 'ARTERUN x Gendut Berlari - Pace of Joy' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td style="width:100%">
			<div class="editable__">
			<p dir="ltr"><span id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><font size="2" style=""><b>PERATURAN UMUM YANG BERLAKU</b><br><span style="color: rgb(0, 0, 255);"><i style=""><b>GENERAL TERMS AND CONDITIONS</b></i></span></font></span></p>

			<ul dir="ltr"><li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Dilarang membawa makanan dan minuman dari luar area Konser, makanan dan minuman tersedia di dalam area Konser.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>It is forbidden to bring food and drinks from outside the Concert area, food and drinks are available inside the Concert area.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tidak diperkenankan merokok di dalam area konser Tennis Indoor. Merokok hanya diperbolehkan di area yang telah disediakan.</b><br><span style="color: rgb(0, 0, 255);"><span id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><b style=""><i>Smoking is not permitted inside the Tennis Indoor concert area. Smoking is only allowed in designated smoking areas.</i></b></span></span></font></li>
			</ul><p dir="ltr"><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">BARANG-BARANG YANG DIPERBOLEHKAN :<br><span style="color:#0000FF;"><i>ACCEPTABLE ITEMS:</i></span></b></font></p>

			<ul dir="ltr"><li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Kamera non profesional</b><br><span style="color:#0000FF;"><span id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><b style=""><i>Non-professional flash / still cameras, handheld video devices (Sony Action Cam, GoPro, Polaroids, etc.)</i></b></span></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Payung Lipat</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Foldable umbrella</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Rokok, rokok elektrik dan vape (dalam keadaan tersegel)</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Cigarettes, E-cigs / vapes (in sealed condition)</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Korek Api</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Lighter</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tas kecil, ransel satu kompartemen, dan tas tangan/dompet (maksimum 30 cm x 30 cm). Terdapat layanan penitipan barang dengan biaya tambahan.</b><br><span style="color: rgb(0, 0, 255);"><span id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><b><i>Small bags, single-compartment backpacks, and purses/handbags (maximum 30 x 30cm). A paid locker/storage service is available.</i></b></span></span></font></li>
			</ul><p dir="ltr"><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">BARANG-BARANG TERLARANG:<br><span style="color: rgb(0, 0, 255);"><i>PROHIBITED ITEMS:</i></span></b></font></p>

			<ul dir="ltr"><li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Makanan dan minuman dari luar, makanan dan minuman tersedia di dalam venue.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Outside food or drinks. Food and drinks are available inside the venue.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Peralatan fotografi dan videografi professional</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Professional photography / videography (with detachable lenses) and audio recording equipment. Point and shoot cameras and mobile phones are permitted.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Botol plastik, kaca dan kaleng. Botol air minum, tumbler dan botol parfum di perbolehkan.</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Plastic bottles, glasses, and cans. Water bottles, tumblers and perfumes are permitted.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style="">Narkoba, obat-obat terlarang dan benda-benda ilegal lainnya.</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><i>Drugs and illegal substances.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Rollerblade, sepeda, dan kendaraan personal lainnya.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><i>Rollerblades, bicycles, and other personal vehicles.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Binatang atau hewan peliharaan</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><i>Pets</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Senjata, benda tajam dan/atau benda mudah terbakar/meledak</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><i>Weapons, sharp objects, and flammables</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style="">Benda-benda yang memiliki potensi bahaya dan beracun.</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Any other potentially hazardous and dangerous items.</i></b></span></font></li>
			</ul><p dir="ltr"><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">PERATURAN DAN REGULASI TIKET<br><span style="color:#0000FF;"><i>TICKET RULES AND REGULATIONS</i></span></b></font></p>

			<ol dir="ltr"><li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tiket hanya dapat dibeli melalui website resmi plainsong.id & <a href="http://loket.com/">loket.com</a>. Tiket yang diperoleh dari sumber yang tidak resmi, mungkin palsu dan tidak berlaku. Pihak penyelenggara tidak bertanggung jawab atas segala bentuk penipuan tiket yang dibeli melalui pihak lain.</b><br><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i><span style="color: rgb(0, 0, 255);">Tickets can only be purchased via our official website</span><a href="http://www.joylandfest.com/" style=""><span style="color:#0000FF;"> </span></a><span style="color: rgb(0, 0, 255);">plainsong.id &</span><a href="http://loket.com/" style=""><span style="color:#0000FF;"> loket.com</span></a><span style="color: rgb(0, 0, 255);">. Tickets obtained from unofficial sources may be counterfeit and invalid. The organizer is not responsible for any form of fraudulent tickets purchased through other parties.</span></i></b></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tiket yang sudah dibeli atau ditukar tidak dapat dikembalikan.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Tickets that have been purchased or exchanged are non-refundable.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tiket dapat dipindahtangankan dengan syarat membawa fotocopy KTP Fisik/Digital pembeli tiket.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Tickets can be transferred if you bring a photocopy of the purchaser''s Physical/Digital identity card.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Tiket tidak boleh dijual, dialihkan atau digunakan untuk segala bentuk tujuan komersial atau perdagangan, termasuk namun tidak terbatas pada promosi, kontes, tujuan komersial atau periklanan, perumahan, hotel, persewaan liburan, undian, hadiah amal atau kegiatan lain tanpa persetujuan tertulis sebelumnya dari penyelenggara. Kegiatan sponsorship, pemasaran ditempat, pemberian sampel, penjual otomatis, pembagian kupon/produk, atau aktivitas promosi lainnya tidak boleh dilakukan di acara (termasuk di tempat parkir), tanpa persetujuan tertulis sebelumnya dari penyelenggara dalam setiap kegiatan. Setiap tiket yang digunakan yang melanggar ketentuan ini akan dicabut dan tidak berlaku, dan pembawanya dianggap sebagai pelanggar di acara. Penjualan kembali atau upaya penjualan kembali tiket dapat menjadi alasan untuk penghentian lisensi dan pembatalan tiket.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Tickets may not be sold, transferred or used for any form of commercial or trade purposes, including but not limited to promotions, contests, commercial or advertising purposes, housing, hotels, vacation rentals, sweepstakes, charitable gifts or other activities without the prior written consent of the organizer. Sponsorship activities, on-site marketing, sample giving, vending, distribution of coupons/products, or other promotional activities may not be carried out at the event (including in the parking lot), without prior written approval from the organizer in each activity. Any tickets used in violation of these terms will be revoked and void, and the bearer will be deemed a violator at the event. The resale or attempted resale of tickets may be grounds for license termination and ticket cancellation.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Harap membawa kartu identitas atau paspor yang masih berlaku. Pengecekan Identitas bersifat WAJIB oleh promotor.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Bring your valid ID or passport. Checking ID or Passport are MANDATORY to enter the event.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Pembeli tiket akan menerima tiket elektronik. Harap membawa tiket elektronik saat penukaran tiket fisik. Cukup berupa softcopy, tidak perlu di cetak kertas.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Purchasers of tickets will receive e-vouchers. Please ensure to bring your e-voucher during ticket exchange. Digital e-vouchers are acceptable; printing of e-vouchers is not necessary.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Data pada identitas harus sama dengan data yang ada pada tiket elektronik.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>The data on the ID card must be the same as the data on the e-ticket.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Barcode akan dipindai oleh petugas pada saat memasuki area konser. Pengunjung akan mendapatkan gelang. Gelang di WAJIBKAN untuk digunakan secepatnya pada saat memasuki area konser</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Barcode will be scanned by our staff upon entry. E-vouchers will then be exchanged with a wristband. Wristbands are MANDATORY to be used immediately upon entrance to the Concert area.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Penonton dapat memasuki area melalui pintu yang disediakan. Re-entry tidak diperkenankan.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Visitors can enter through the entrance that has been provided. Re-entry is not permitted.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Pembelian tiket maksimal sejumlah 4 (empat) tiket per transaks</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Maximum purchase of 4 (four) tickets in one transaction.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">1 (Satu) Tiket hanya valid untuk 1 (satu) orang dan 1 (satu) kali masuk.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>1 (one) ticket is valid for 1 (one) person and 1 (one) time entrance only.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Penonton penyandang disabilitas memiliki kategori tiket khusus, dan akan menonton dari tribun yang disediakan khusus bagi penyandang disabilitas.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>Visitors with disabilities have a dedicated ticket category and will be seated in the designated disability-accessible tribune.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Dengan membeli tiket, Anda menyetujui semua ketentuan dan terikat secara hukum untuk mematuhi ketentuan ini. Penyelenggara berhak, atas kebijakannya sendiri, untuk mengubah, memodifikasi, menambah atau menghapus bagian dari ketentuan ini setiap saat. Silahkan melakukan pemeriksaan secara berkala untuk perubahan ketentuan.</b><br><span style="color: rgb(0, 0, 255);"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>By purchasing a ticket, you agree to all the terms and are legally bound to comply with these terms. The Organizer reserves the right, in its sole discretion, to change, modify, add or remove portions of these terms at any time. Please check regularly for changes to the terms.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Pembeli tiket memberikan hak kepada penyelenggara (dan yang ditunjuknya) untuk memasukan gambar, rupa, tindakan dan pernyataan Anda dalam audio, video, film, webcast, streaming atau transmisi, pameran, siaran simulcast atau reproduksi lainnya yang dibuat secara langsung atau direkam, atau di acara dalam media atau konteks apa pun untuk tujuan apa pun, termasuk tujuan komersial atau promosi tanpa izin lebih lanjut atau sebaliknya serta bahwa Anda tidak berhak atas pembayaran, kompensasi, atau kredit dalam bentuk apapun terkait hal tersebut.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>The ticket purchaser grants the organizer the right (and its designees) to include your images, forms, actions and statements in audio, video, film, webcast, streaming or transmission, exhibition, simulcast broadcast or other reproduction made live or recorded, or in events in any media or context for any purpose, including commercial or promotional purposes without further permission or otherwise and that you are not entitled to any payment, compensation or credit of any kind in connection therewith.</i></b></span></font></li>
				<li><font size="2"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d">Jika terjadi pembatalan acara, maka uang tiket akan dikembalikan sesuai dengan ketentuan penyelenggara. Biaya administrasi tiket, convenient fee pembayaran dengan kartu kredit, virtual account atau biaya pribadi lainnya (contoh biaya perjalanan, biaya akomodasi, dll.) tidak akan dikembalikan.</b><br><span style="color:#0000FF;"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d" style=""><i>In the event of cancellation of the event, the ticket money will be refunded according to the provisions of the organizer. Ticket administration fees, convenient fees for payment by credit card, virtual account or other personal costs (eg travel expenses, accommodation fees, etc.) will not be refunded.</i></b></span></font></li>
			</ol><p dir="ltr"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><font size="2">FOR FURTHER INFORMATION</font></b></p>

			<p dir="ltr"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><font size="2">INSTAGRAM : <a href="https://www.instagram.com/plainsonglive_/?hl=en">PLAINSONGLIVE_</a><br>
			WEBSITE : <a href="https://www.plainsong.id/">https://www.plainsong.id/</a></font></b></p>

			<p dir="ltr"><b id="docs-internal-guid-3a3fdea8-7fff-1ec6-6715-88f54bcfe39d"><font size="2">LOKET.COM Customer Service<br>
			EMAIL : support@loket.com<br>
			PHONE : +6221-30003160</font></b></p>
			</div>
			</td>
			<td style="width:50%"> </td>
		</tr></tbody></table>' WHERE title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<p> </p>

			<ol><li>All ticket purchases are final and non-refundable.<br></li>
				<li>Tickets are valid only for the date(s) and category stated on the ticket.<br></li>
				<li>Attendees must present a valid ticket (digital) and identification upon entry.<br></li>
				<li>The organizer reserves the right to refuse entry or remove attendees who violate event rules or behave in a disruptive manner.<br></li>
				<li>The organizer reserves the right to change the event schedule, speakers, programs, or venue arrangements without prior notice.<br></li>
				<li>By attending the event, attendees consent to being photographed and recorded for documentation and promotional purposes.<br></li>
				<li>Tickets purchased from unauthorized parties are the sole responsibility of the buyer and may be deemed invalid.<br></li>
				<li>By purchasing and/or using an IdeaFest 2026 ticket, attendees agree to all applicable Terms & Conditions set by the organizer.</li>
			</ol></td>
		</tr></tbody></table>' WHERE title = 'IdeaFest 2026' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = '<p class="mb-2 relative"><span style="white-space: pre-wrap;">Wajib 21+</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">1. Entry Pass yang valid adalah yang dibeli melalui artatix.co.id</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">2. Satu Entry Pass berlaku untuk satu orang.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket "MELANKOLIA DI MEDAN”.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">7. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">8. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">10. Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">11. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke event.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">12. Promotor berhak untuk:</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Melarang penonton masuk ke area event  jika Entry Pass yang digunakan tidak valid.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">13. Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari area event  jika tidak mematuhi protokol kesehatan yang telah diterapkan.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">14. Barang yang boleh dibawa kedalam venue:</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa kartu identitas dan uang pribadi</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa bukti tiket/tanda masuk</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa masker dan hand sanitizer</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa obat-obatan pribadi</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa jas hujan</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Membawa handphone / perangkat lainnya</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">15. Barang yang tidak diperbolehkan dibawa:</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Tidak membawa atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Makanan dan minuman dari luar</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Kamera profesional seperti Drone, SLR, DSLR.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Tongsis atau Selfie Stick.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Cairan dan benda yang mudah terbakar.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Tas atau ransel berukuran besar.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Laser dan pointer.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">● Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">16. Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">17. Dilarang membuat kerusuhan dalam situasi apapun di dalam area event</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN.</span></p>' WHERE title = 'MELANKOLIA DI MEDAN' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<table class="toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td style="width:100%">
			<div class="editable__">
			<p><font size="2">Dengan membeli tiket <strong style="">ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong> Pembeli telah menyetujui semua <strong style="">Syarat dan Ketentuan</strong> yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.<br><span style="color: rgb(255, 0, 0);"><i>By purchasing a ticket for <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA,</strong><strong> </strong>the Event Attendee has agreed to</i> </span><span style="color: rgb(255, 0, 0);"><i>all applicable <strong>Terms and Conditions</strong>. All forms of violation of the terms and conditions will be dealt with strictly.</i> </span></font></p>

			<p paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{118}" paraid="1579927467"><font size="2">Kategori yang tersedia dan tempat penjualan adalah sebagai berikut;<br><strong>therosejakarta2026.com </strong></font></p>

			<ul role="list"><li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{134}" paraid="490825254"><font size="2">DIAMOND (SEATED)</font></li>
				<li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{134}" paraid="490825254"><font size="2">GOLD (SEATED)</font></li>
				<li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{166}" paraid="768141991"><font size="2">SILVER (SEATED)</font></li>
				<li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{178}" paraid="814868999"><font size="2">CAT 1 (STANDING)</font></li>
				<li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{194}" paraid="1666443842"><font size="2">CAT 2 (STANDING)</font></li>
				<li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{204}" paraid="689427610"><font size="2">CAT 3 (STANDING)</font></li>
			</ul><p paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{224}" paraid="185355122"><font size="2"><span style="color:#FF0000;"><i>Categories and ticketing website are as follows;</i> </span><br><span style="color:#FF0000;"><strong>therosejakarta2026.com</strong> </span></font></p>

			<ul role="list"><li paraeid="{4c7887f6-e882-4ffd-8c61-ddcda0afe598}{244}" paraid="611039668"><span style="color:#FF0000;"><font size="2"><i>DIAMOND (SEATED) </i> </font></span></li>
				<li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{1}" paraid="521073886"><span style="color:#FF0000;"><font size="2"><i>GOLD (SEATED) </i> </font></span></li>
				<li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{15}" paraid="675161746"><span style="color:#FF0000;"><font size="2"><i>SILVER (SEATED)</i> </font></span></li>
				<li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{27}" paraid="1560464099"><span style="color:#FF0000;"><font size="2"><i>CAT 1 (STANDING)</i> </font></span></li>
				<li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{33}" paraid="1056979622"><span style="color:#FF0000;"><font size="2"><i>CAT 2 (STANDING)</i> </font></span></li>
				<li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{39}" paraid="819938125"><span style="color:#FF0000;"><i><font size="2">CAT 3 (STANDING) </font></i></span></li>
			</ul><p paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{59}" paraid="2032934229"><font size="2">Semua harga belum termasuk Pajak Pemerintah dan belum termasuk Biaya Layanan lainnya.<br><span style="color: rgb(255, 0, 0);"><i>All Prices exclude Government tax and Convenience fee.</i> </span><i style=""> </i></font></p>

			<p paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{87}" paraid="447140230"><font size="2">Semua penjualan Tiket adalah final. Tiket yang telah dibeli tidak dapat ditukar, tidak dapat diuangkan kembali, ataupun dibatalkan.</font><br><span style="color: rgb(255, 0, 0);"><i style=""><font size="2">All ticket sales are final. Purchased tickets cannot be exchanged, refunded, or canceled.</font></i></span></p>

			<p paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{173}" paraid="30451439"><font size="2"><strong>INFORMASI PEMBELIAN TIKET:</strong> <strong>GENERAL SALE</strong></font><br><span style="color:#FF0000;"><i><strong><font size="2">TICKET PURCHASE INFORMATION: GENERAL SALE</font></strong></i> </span></p>

			<ol role="list"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="1" data-font="Cambria" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{193}" paraid="1357805233"><strong>Jadwal General Sale</strong><br><span style="color:#FF0000;"><i><strong>General Sale Schedule</strong></i> </span></p>
				</li>
			</ol><ul><li paraeid="{1aae74cb-7dbd-414c-86d7-3873d058d96d}{217}" paraid="1447126865">Hari / Tanggal : Rabu, 22 Juli 2026<br><span style="color:#FF0000;"><i>Day / Date</i> :<i> Wednesday, 22 July 2026</i> </span></li>
				<li paraeid="{bd9a18f3-ef9a-4611-b2be-625db6482f59}{12}" paraid="1834996108">Waktu : Pukul 12:00 WIB<br><i><span style="color:#FF0000;">Time</span></i><span style="color:#FF0000;"> :<i> 12:00 WIB</i> </span></li>
				<li paraeid="{bd9a18f3-ef9a-4611-b2be-625db6482f59}{52}" paraid="1153641553">Tempat : <strong>therose</strong><strong>jakarta2026.com</strong><br><i><span style="color:#FF0000;">Place</span></i><span style="color:#FF0000;"> :<i> <strong>therosejakarta2026.com</strong></i> </span></li>
			</ul><ol role="list" start="2"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="2" data-font="Cambria" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{bd9a18f3-ef9a-4611-b2be-625db6482f59}{98}" paraid="1490993662">Pembelian tiket pada General Sale dapat dilakukan dengan beberapa metode pembayaran (virtual account dan kartu kredit).<br><span style="color:#FF0000;"><i>Ticket purchases on General Sale can be made with several payment methods (virtual account and credit card).</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="3" data-font="Cambria" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{bd9a18f3-ef9a-4611-b2be-625db6482f59}{120}" paraid="66337437">Pembelian dengan menggunakan kartu kredit hanya dapat dilakukan dengan kartu kredit dengan sistem 3D Secure.<br><span style="color:#FF0000;"><i>Credit card purchases can only be made with credit cards with a 3D Secure system.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Cambria" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{bd9a18f3-ef9a-4611-b2be-625db6482f59}{182}" paraid="647037124">1 akun hanya dapat membeli maksimum <strong>4 (empat)</strong> tiket per transaksi. Akun dengan NIK, alamat email dan nomor telepon yang sama tidak bisa melakukan pembelian berulang.<br><span style="color: rgb(255, 0, 0);"><i>Each account can purchase a maximum of </i><strong style="font-style: italic;">4 (four)</strong><i> tickets per transaction. Accounts with the same NIK, email address and telephone number will be blocked from attempting to make repeated purchases.</i></span></p>
				</li>
			</ol><p paraeid="{96e7f3b0-08ff-47e5-be49-27eebd7e6b52}{7}" paraid="147965176"><font size="2"><strong style="">KETENTUAN UMUM </strong><br><span style="color: rgb(255, 0, 0);"><i><strong>GENERAL REGULATIONS</strong></i> </span></font></p>

			<ol role="list"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="1" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{96e7f3b0-08ff-47e5-be49-27eebd7e6b52}{23}" paraid="1287738817">Tiket hanya dapat dibeli melalui website <strong>therose</strong><strong>jakarta2026.com</strong>, tiket hanya dapat digunakan untuk masuk ke acara konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong><strong>.</strong><br><span style="color:#FF0000;"><i>Tickets can only be purchased through <strong>therose</strong><strong>jakarta2026.com</strong> website, tickets are only valid for admission to</i> <i><strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA.</strong></i></span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="2" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{96e7f3b0-08ff-47e5-be49-27eebd7e6b52}{123}" paraid="1573960427">Nama sesuai dengan kartu identitas yang sah bersifat wajib untuk membeli Tiket ke konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA.</strong> Pastikan Anda melakukan pembelian tiket dengan menggunakan data Anda yang sah dan benar (Kartu Identitas/KTP/KK/SIM/Paspor). Tiket Anda tidak dapat di ubah dan/atau dimodifikasi setelah pembelian sudah dilakukan.<br><span style="color:#FF0000;"><i>You will be required to provide your name in accordance to purchase tickets to the</i><strong> </strong><i><strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA. </strong>The provided name must match the name indicated your personal identification document (ID Card/KTP/KK/SIM/Passport). Your ticket(s) cannot be changed, modified or transferred once purchased.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="3" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{96e7f3b0-08ff-47e5-be49-27eebd7e6b52}{213}" paraid="1205964350">Dimohon untuk membawa KTP/KK/Passport/SIM asli sesuai dengan data yang tertera di E-Voucher/E-Ticket pada saat penukaran Wrisband/Tiket.<br><span style="color:#FF0000;"><i>Please bring a valid ID card/KK/Passport/Driving License with your personal information that matches what is reflected on the E-Voucher/E-Ticket in order to redeem your Wristband/Tickets.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{96e7f3b0-08ff-47e5-be49-27eebd7e6b52}{251}" paraid="372720183">E-Voucher/E-Ticket menggunakan sistem barcode dan berlaku untuk satu kali penukaran wristband. Tanda yang berlaku untuk masuk ke dalam tempat pertunjukan adalah wristband yang sudah ditukarkan dengan E-Voucher/E-Ticket yang sudah di dapatkan. Dilarang keras melakukan duplikasi E-Voucher/E-Ticket/Tiket.<br><span style="color:#FF0000;"><i>The E-Voucher/E-Ticket contains a barcode and will be used to redeem your wristbands. The barcode is only valid for wristband redemption for one time. Only ticket holders with valid wristbands (official wristbands redeemed through the E-Voucher/E-Ticket) will be permitted to enter the venue. Duplication of E-Vouchers/E-Tickets/Tickets is strictly prohibited.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="5" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1b350d27-da51-4121-8dce-ed1cb332238c}{132}" paraid="1126711171">Mohon tidak membagikan dan menyebarluaskan nomor barcode di dalam E-Voucher/E-Ticket baik dalam bentuk unggahan foto <i>atau e-mail </i>dan lainnya. Barcode yang tercantum pada E-Voucher/E-Ticket bersifat rahasia, tidak boleh rusak dan disebarluaskan kepada siapapun dan ke manapun sampai Anda masuk ke dalam venue acara.<br><span style="color:#FF0000;"><i>Please do not share or disseminate the barcode and/or barcode number in the E-Voucher in any form (photo uploads, e-mails, screen shots). The barcode listed on E-Voucher/E-Ticket is confidential and must not be damaged until you have redeemed your wristband and successfully entered the venue. </i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="6" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1b350d27-da51-4121-8dce-ed1cb332238c}{184}" paraid="78640700">Penyelenggara tidak bertanggung jawab atas kelalaian pembeli E-Voucher/E-Ticket yang mengakibatkan E-Voucher/E-Ticket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk dipergunakan sebagai tanda masuk tempat pertunjukkan yang menghilangkan hak dari pembeli E-Voucher/E-Ticket.<br><span style="color:#FF0000;"><i>The Promoter is not responsible for situations in which the negligence of the E-Voucher/E-Ticket buyer leads to the use/tampering/appropriation of the E-Voucher/E-Ticket and its contents by another individual. Upon discovery of such situations, the E-Voucher/E-Ticket will be nulled and deemed invalid, and the buyer will forfeit the rights previously entitled to the E-Voucher/E-Ticket holder.</i></span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="7" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d79fa44b-ba70-46a3-add0-7149e194818d}{75}" paraid="324366323">Setiap pemilik tiket kategori DIAMOND, GOLD dan SILVER akan mendapatkan nomor kursi sedangkan untuk pemilik tiket kategori CAT 1, CAT 2, dan CAT 3 akan mendapatkan nomor antrian.<br><span style="color:#FF0000;"><i>Every DIAMOND, GOLD dan SILVER ticket holder will receive a seat number while all CAT 1, CAT 2, and CAT 3 ticket holders will receive a queue number.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="8" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d79fa44b-ba70-46a3-add0-7149e194818d}{229}" paraid="1326789862">Setelah Anda berhasil melakukan pembelian tiket, E-Voucher/E-Ticket akan dikirimkan ke email Anda. H-7 sebelum konser dimulai, nomor kursi akan muncul di E-Voucher/E-Ticket yang telah Anda dapatkan sebelumnya. Anda perlu me-refresh link E-Voucher/E-Ticket tersebut. Nomor kursi akan di generate oleh sistem dan tidak dapat diubah atau di modifikasi.<br><span style="color:#FF0000;"><i>Upon purchasing the ticket successfully, an E-Voucher/E-Ticket will be sent to your email. 7 days before the concert starts, the seat number will be assigned to your ticket, and it will appear on the same E-Voucher/E-Ticket that you received previously. You will need to refresh the same E-Voucher/E-Ticket link received upon purchase</i><i> </i><i>to see your seat number. The seat number will be automatically generated and assigned by the system. The assigned seat number reflected on your E-Voucher/E-Ticket cannot be changed or modified.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="9" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{c2865f84-7207-42aa-a833-296e6d7ebc7c}{152}" paraid="769053130">Pihak Promotor dan ticketing partner resmi yang ditunjuk menjamin hanya akan mengeluarkan E-Voucher/E-Ticket kepada Pembeli yang sah.<br><span style="color:#FF0000;"><i>The Promoter and the appointed official ticketing partner guarantee that they will only issue E-Voucher to authorized Buyers.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="10" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{c2865f84-7207-42aa-a833-296e6d7ebc7c}{208}" paraid="1348061723">Perpindahan kepemilikan dan atau pemalsuan E-Voucher/tiket/gelang berada di luar kendali dan bukan menjadi tanggung jawab Promotor.<br><span style="color:#FF0000;"><i>Transfer of ownership and or forgery of E-Vouchers/tickets/wristbands are beyond the control and not the responsibility of the Promoter.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="11" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{357b0c39-aab8-48fa-9b89-44da2e2c27ee}{19}" paraid="1008898293">Tiket atau E-Voucher yang sudah dibeli tidak untuk diperjualbelikan kembali dengan harga yang lebih tinggi dari harga resmi yang telah ditentukan oleh Penyelenggara. Jika terdapat indikasi pelanggaran, maka Penyelenggara berhak untuk melakukan upaya hukum dan/atau membatalkan tiket tersebut.<br><span style="color:#FF0000;"><i>Tickets or E-Vouchers that have been purchased are not to be resold at a higher price than the official price determined by the Organizer. In case of any indication of a violation, the Organizer has the right to take legal action and/or cancel the ticket.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="12" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{357b0c39-aab8-48fa-9b89-44da2e2c27ee}{163}" paraid="812329850">Setiap pemegang tiket DIAMOND, GOLD dan SILVER akan mendapatkan nomor kursi. Pemegang Tiket wajib menempati tempat duduk atau posisi yang telah ditentukan oleh pihak Penyelenggara sesuai dengan kategori Tiket yang dibeli.<br><span style="color:#FF0000;"><i>Each DIAMOND, GOLD, and SILVER ticket holder will receive a seat number. Ticket Holder must occupy the seat or position assigned by the Promoter according to the category to which the purchased ticket belongs.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="13" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{e238aec3-0013-44a9-a0ff-90d9a0860b31}{126}" paraid="533399791">Dengan membeli Tiket konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong>, Anda telah menyetujui pengumpulan penyimpanan dan penggunaan data pribadi Anda secara terbatas untuk keperluan konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA.</strong><br><span style="color:#FF0000;"><i>By purchasing tickets to <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA,</strong> you agree to the collection, storage, and limited use of your personal data for the purposes of <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA.</strong></i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="14" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{e238aec3-0013-44a9-a0ff-90d9a0860b31}{220}" paraid="129100129">Penjualan Tiket resmi hanya melalui channel yang telah diinformasikan melalui akun resmi sosial media Penyelenggara acara @ckstar.id. Pembelian tiket di luar dari channel resmi menjadi tanggung jawab dan resiko pribadi dari Pembeli Tiket.<br><span style="color:#FF0000;"><i>Official tickets will only be sold through the platforms announced on CK Star Entertainment''s official social media accounts. Ticket(s) purchased from unofficial and unauthorized third party are at the sole risk and responsibility of the Ticket Purchaser.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="15" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{e238aec3-0013-44a9-a0ff-90d9a0860b31}{240}" paraid="1924015431">Waktu dan tempat penukaran wristband akan di informasikan melalui media sosial CK Star Entertainment.<br><span style="color:#FF0000;"><i>More details regarding wristband redemption will be shared at a later stage through CK Star Entertainment official social media accounts.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="16" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{29}" paraid="556459215">Syarat penukaran wristband :<br><span style="color:#FF0000;"><i>Wristband exchange requirements :</i></span></p>
				</li>
			</ol><ul><li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{51}" paraid="205885223">E-Voucher (Elektronik / Dicetak)<br><span style="color:#FF0000;"><i>E-Voucher (Electronic / Printed)</i> </span></li>
				<li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{51}" paraid="205885223">KTP/KK/SIM/Paspor yang masih berlaku dan asli (nama harus sesuai dengan yang tertera di E-Voucher)<br><span style="color:#FF0000;"><i>Original and valid KTP/KK/SIM/Passport. Your name on your personal identification document must match the one reflected on your E-Voucher.<br><br></i></span></li>
			</ul><ol role="list" start="17"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="17" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{99}" paraid="75177534">Jika penukaran diwakilkan :<br><span style="color:#FF0000;"><i>If you are redeeming the wristband on behalf of the original E-Voucher holder, you will need:</i> </span></p>
				</li>
			</ol><ul><li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{119}" paraid="538946980"><strong>E-Voucher (</strong><strong>Dicetak</strong><strong>)</strong><br><i><span style="color:#FF0000;"><strong>E-Voucher (Printed)</strong></span></i><span style="color:#FF0000;"> </span></li>
				<li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{119}" paraid="538946980"><strong>Surat Kuasa yang </strong><strong>dicetak</strong><strong> dan </strong><strong>ditandatangani</strong><strong> </strong><strong>langsung</strong><strong> di </strong><strong>atas</strong><strong> </strong><strong>materai</strong><strong> Rp </strong><strong>10.000,-</strong><strong> . Surat Kuasa </strong><strong>ini</strong><strong> </strong><strong>wajib</strong><strong> </strong><strong>dibawa</strong><strong> </strong><strong>saat</strong><strong> </strong><strong>penukaran</strong><strong>.</strong><br><span style="color:#FF0000;"><i><strong>A printed Letter of Attorney signed directly by the person that you are representing on an IDR 10.000 stamp. This signed Letter of Attorney must be brought at the time of exchange.</strong></i> </span></li>
				<li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{119}" paraid="538946980">Fotokopi kartu identitas yang namanya tercantum di E-Voucher<br><span style="color:#FF0000;"><i>A printed copy of the Identity Card whose name is reflected on the E-Voucher.</i> </span></li>
				<li paraeid="{afa3f1c5-7ed3-4259-889a-c8571651dbf9}{119}" paraid="538946980">Format Surat Kuasa bisa di unduh di link yang tersedia di bio Instagram @ckstar.id<br><span style="color:#FF0000;"><i>Letter of Attorney Template can be downloaded at the link provided in the Instagram bio @ckstar.id<br><br></i></span></li>
			</ul><ol role="list" start="18"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="18" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{fb04e92f-499a-416a-9a59-3411f19ff2e1}{16}" paraid="744949297"><strong>Tidak </strong><strong>ada</strong><strong> </strong><strong>gelang</strong><strong> </strong><strong>pengganti</strong> yang akan dikeluarkan dalam kondisi apa pun jika hilang & rusak karena alasan apapun. Penyelenggara tidak bertanggung jawab atas gelang yang hilang, dicuri atau rusak.<br><span style="color:#FF0000;"><i><strong>No wristband replacement will be issued </strong>or permitted under any circumstances. You will be responsible for ensuring that your wristband(s) is not lost, stolen and/or damaged. Promoters will not be responsible for any lost, stolen, and/or damaged wristband(s).</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="19" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{fb04e92f-499a-416a-9a59-3411f19ff2e1}{132}" paraid="2058340684">Penyelenggara memiliki hak untuk mengubah ataupun menambahkan syarat lain pada <strong>Syarat</strong><strong> & </strong><strong>Ketentuan</strong> tanpa adanya pemberitahuan terlebih dahulu.<br><span style="color:#FF0000;"><i>The Organizer has the right to change or add other terms in the <strong>Terms & Conditions</strong> without prior notification.</i></span></p>
				</li>
			</ol><p paraeid="{fb04e92f-499a-416a-9a59-3411f19ff2e1}{214}" paraid="1887201308"><font size="2"><strong style="">BATASAN UMUR</strong></font><br><span style="color:#FF0000;"><strong><em><font size="2">AGE RESTRICTIONS</font></em></strong><em> </em></span></p>

			<ol role="list" start="20"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="20" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{fb04e92f-499a-416a-9a59-3411f19ff2e1}{230}" paraid="768537818">Anak di bawah usia 13 (tiga belas) tahun wajib didampingi oleh orang tua atau wali.<br><span style="color:#FF0000;"><i>Children under the age of 13 (thirteen) years old must be accompanied by a parent or legal guardian.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="21" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{97adbb1a-cdf4-41f7-bbb3-c7d4edf7371e}{17}" paraid="86443685">Anak-anak di bawah 6 (enam) tahun tidak diperbolehkan masuk ke tempat pertunjukan.<br><span style="color:#FF0000;"><i>Children under 6 (six) years old will not be admitted into the performance venue.</i></span></p>
				</li>
			</ol><p paraeid="{97adbb1a-cdf4-41f7-bbb3-c7d4edf7371e}{79}" paraid="751009541"><font size="2"><strong style="">LAYANAN KEBUTUHAN KHUSUS</strong></font><br><span style="color:#FF0000;"><strong><em><font size="2">SPECIAL NEED SERVICE</font></em></strong><em> </em></span></p>

			<ol role="list" start="22"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="22" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{97adbb1a-cdf4-41f7-bbb3-c7d4edf7371e}{95}" paraid="74718471">Terdapat kuota dalam jumlah terbatas untuk tempat duduk yang dapat diakses dengan kursi roda. Untuk mendapatkan otorisasi pemesanan tempat duduk ini, Anda diwajibkan untuk melampirkan Surat Keterangan Dokter yang berasal dari institusi yang sah, baik klinik maupun rumah sakit beserta surat pernyataan yang ditandatangani suami/istri/keluarga/wali diatas materai. Penyelenggara Acara hanya menerima Surat Keterangan Dokter yang berasal dari institusi yang sah. Mohon kirimkan file dalam bentuk PDF ke enquiries-id@ckstarentertainment.com paling lambat tanggal <strong>16 Oktober 2026</strong> dengan subjek ''Special Needs Service (THE ROSE in Jakarta) - Nama Lengkap''<br><span style="color:#FF0000;"><i>Wheelchair accessible seating will be available in limited quantities. To get your booking authorized, you must present your medical certificate from a legitimate institution and physician as proof of disability along with a stamped Letter of Statement signed by a spouse/family member/guardian. The Promoter only accepts legitimate medical certificates issued by a medical professional or institution. Please send the files in PDF format to enquiries-id@ckstarentertainment.com by <strong>16 October 2026</strong> with the subject ''Special Needs Service (THE ROSE in Jakarta) - Full Name''</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="23" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1f3400c6-9412-4dc8-a351-03a8efa4932f}{3}" paraid="718925011">Bagi ibu hamil wajib membawa surat rekomendasi dari dokter dan surat izin / surat pernyataan dari suami/anggota keluarga.<br><span style="color:#FF0000;"><i>Pregnant women are required to bring a doctor''s recommendation letter with a stamped permit along with Letter of Statement from their husband/family member.</i></span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="24" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1f3400c6-9412-4dc8-a351-03a8efa4932f}{95}" paraid="1869899197">Surat Pernyataan dibutuhkan pihak Promotor sebagai jaminan bahwa penonton yang bersangkutan dalam keadaan sehat dan bisa mengikuti acara.<br><span style="color:#FF0000;"><i>A statement letter is required by the Promoter as a guarantee that the audience concerned is in good health and able to attend the event. </i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="25" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1f3400c6-9412-4dc8-a351-03a8efa4932f}{167}" paraid="1082088690">Pemilik tiket dengan kondisi memiliki penyakit berat seperti gangguan jantung, tekanan darah rendah dan yang lainnya tidak diperbolehkan untuk menghadiri acara/konser.<br><span style="color:#FF0000;"><i>Attendees with serious medical conditions such as heart problems, low blood pressure, and others are not allowed to attend the event/concert.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="26" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d381cd71-27c1-4e0b-8a8f-1982c8312e3a}{2}" paraid="179147441">Pertunjukan ini menampilkan efek lampu flash dan pencahayaan intens, serta suara yang sangat keras yang dapat menyebabkan gangguan atau ketidaknyamanan bagi sebagian penonton.<br><span style="color:#FF0000;"><i>This show contains bright and intense flashing lights, as well as extremely loud sounds that may cause disturbance or discomfort to some audiences.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="27" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d381cd71-27c1-4e0b-8a8f-1982c8312e3a}{88}" paraid="1944047699">Penonton menerima bahwa mereka mempunyai kewajiban untuk memastikan keselamatan mereka sendiri, dengan mempertimbangkan kondisi medis pribadi apa pun.<br><span style="color:#FF0000;"><i>Attendees accept they have a duty to take reasonable steps to ensure their own safety, considering any personal medical conditions.</i></span></p>
				</li>
			</ol><p paraeid="{d381cd71-27c1-4e0b-8a8f-1982c8312e3a}{174}" paraid="1498098239"><font size="2"><strong style="">KEBIJAKAN TIDAK KELUAR MASUK</strong></font><br><span style="color:#FF0000;"><strong><em><font size="2">NO RE-ENTRY POLICY</font></em></strong> </span></p>

			<ol role="list" start="28"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="28" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d381cd71-27c1-4e0b-8a8f-1982c8312e3a}{192}" paraid="1884126161">Tidak diperbolehkan untuk masuk kembali setelah keluar dari area venue acara. Harap diingat bahwa memasuki area konser atau event hanya satu kali (tidak berulang), apapun tiket kelas yang telah dibeli.<br><span style="color:#FF0000;"><i>No re-entry is allowed for this event. Please keep in mind that re-entry is not allowed to the concert or event area, regardless of your ticket category. Once you enter the venue, you cannot leave and enter again.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="29" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{d381cd71-27c1-4e0b-8a8f-1982c8312e3a}{212}" paraid="504706233">Penyelenggara acara berhak melarang untuk masuk ke lokasi penyelenggaraan acara apabila wristband dengan barcode diketahui telah digunakan untuk pengunjung lainnya.<br><span style="color:#FF0000;"><i>The Promoter reserves the right to prohibit entry to the venue for a valid wristband that contains a previously scanned barcode.</i></span></p>
				</li>
			</ol><p paraeid="{1e9ab160-8b94-4065-807a-deb02284271d}{39}" paraid="1324101600"><font size="2"><strong style="">KEBIJAKAN UMUM</strong><br><em style=""><span style="color:#FF0000;"><strong>GENERAL POLICIES</strong> </span></em></font></p>

			<ol role="list" start="30"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="30" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1e9ab160-8b94-4065-807a-deb02284271d}{55}" paraid="567336962">Setiap Pemegang Tiket yang datang ke area acara bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya sendiri. Para Penyelenggara/Manajemen tidak bertanggung jawab untuk, termasuk namun tidak terbatas pada cedera atau kerusakan yang mungkin terjadi kepada Pemegang Tiket selama atau di dalam acara tersebut.<br><span style="color:#FF0000;"><i>Every event attendee is responsible for their own safety, health, and personal security. The Promoter and/or Management are not responsible for, including but not limited to, any injury or damage that may occur to the event attendee within event premises or before/during/after the event.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="31" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1e9ab160-8b94-4065-807a-deb02284271d}{209}" paraid="797432457">Tidak diperkenankan menginap di venue acara.<br><span style="color:#FF0000;"><i>Waiting in line overnight is prohibited.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="32" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{1e9ab160-8b94-4065-807a-deb02284271d}{225}" paraid="302736012">Penonton diharapkan mengantri dengan tertib dan sopan.<br><span style="color:#FF0000;"><i>The attendees are expected to line up in an orderly manner and show respect to others in the line.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="33" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{8}" paraid="792907202">Demi keamanan dan kenyamanan, dilarang membawa koper, tas punggung (backpack) serta tas berukuran besar lainnya ke area konser.<br><span style="color:#FF0000;"><i>For safety and covenience, it is prohibited to bring luggage, backpacks, as well other oversized bags to the concert area.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="34" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{32}" paraid="856891461">Pembeli membebaskan penyelenggara acara dan tidak akan mengajukan tuntutan hukum apapun apabila acara/pertunjukan dibatalkan semata-mata karena sebab keputusan sepihak dari artis, pemerintah, ataupun sebab-sebab lain yang berada di luar dari kemampuan dan kehendak dari penyelenggara acara.<br><span style="color:#FF0000;"><i>Purchaser hereby agrees to release the Promoter from legal claims through the courts or any means permitted by law in the event of cancellation of a concert that was made unilaterally by the artist or the government or other causes beyond capacity and will of the Promoter.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="35" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{48}" paraid="22899617">Jika terjadi pembatalan konser, maka Tiket akan dikembalikan sesuai dengan ketentuan Penyelenggara. Pengembalian harga Tiket tidak termasuk Biaya Platform, Biaya Lainnya dan Biaya pribadi Pembeli Tiket (contoh biaya perjalanan, biaya akomodasi,dll).<br><span style="color:#FF0000;"><i>In the event of a cancelled concert, tickets will be refunded in accordance with the provisions of the Promoter. Refunds do not include Platform Fee, Convenience Fee, and/or any other personal costs of the Ticket Buyer (e.g. travel expenses, accommodation expenses, etc).</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="36" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{70}" paraid="909190428">Tiket dijual secara langsung dari penyelenggara ke Pembeli Tiket. Setiap tiket yang di beli oleh pelaku usaha atau pedagang tiket dengan tujuan untuk penjualan kembali Tiket dan/atau keperluan pemasaran adalah melanggar Syarat & Ketentuan penjualan Tiket ini sehingga dapat dianggap menjadi tidak sah dan dibatalkan. Tiket yang dibeli dari website pihak ketiga dan reseller yang tidak sah menjadi tanggung jawab pribadi dan risiko dari Pembeli Tiket.<br><span style="color:#FF0000;"><i>The Ticket(s) are sold by the Promoter directly to the Ticket Buyer. Any Ticket(s) purchased by Business or traders for the purpose of Ticket Resales and/or Marketing is a breach of these Terms & Conditions and hence may be considered invalid and can be nullified. Tickets purchased from third-party websites and unauthorized resellers are at the sole risk and responsibility of the Ticket Purchaser.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="37" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{90}" paraid="245154261">Pihak Promotor berhak untuk melarang pengunjung untuk memasuki lokasi acara apabila pengunjung tidak memiliki tiket yang sah.<br><span style="color:#FF0000;"><i>The Promoter has the right to prohibit visitors from entering the event location if visitors do not have a valid ticket.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="38" data-font="Cambria" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{106}" paraid="867777642">Setiap upaya untuk memasuki acara tanpa tiket yang sah atau kredensial yang sah akan dikeluarkan dari area acara. Dalam kondisi tertentu orang yang demikian akan dilaporkan ke pihak kepolisian dan akan dituntut telah melakukan tindakan penyerebotan ataupun tindak kekerasan.<br><span style="color:#FF0000;"><i>Any attempt to enter the event without a valid ticket or valid credentials will result in immediate removal from the event grounds. In certain cases, we will contact the police and press charges against the violators.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="39" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{126}" paraid="1992250116">Pihak Promotor berhak sewaktu-waktu untuk mengubah pengaturan denah dan penataan pengunjung di dalam lokasi acara tanpa pemberitahuan sebelumnya.<br><span style="color:#FF0000;"><i>The Promoter reserves the right to change the layout and the seating of the audience in the event location without prior notice.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="40" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{146}" paraid="1783213792">Pemegang Tiket memberikan hak kepada pihak Penyelenggara acara untuk melakukan perekaman dan penggunaan video dan gambar untuk publisitas, promosi dan keperluan komersil lainnya yang berkaitan dengan konser<strong> </strong><strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong> di kemudian hari.<br><span style="color:#FF0000;"><i>The Ticket Holder grants the Promoter the right to record and use any video and picture for publicity, promotion or other commercial purposes related to <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong><strong> </strong>concert in future.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="41" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{180}" paraid="619441998">Penyelenggara acara memiliki hak untuk menolak masuk dan/atau mengeluarkan orang-orang yang tidak menaati syarat dan ketentuan acara beserta orang-orang yang dengan sengaja membuat kerusuhan/menimbulkan hal-hal yang merugikan satu pihak atau pihak lainnya tanpa diberikan pengembalian harga tiket.<br><span style="color:#FF0000;"><i>Promoter reserves the right to refuse admission to and/or evict Ticket Holders who do not abide by the Terms and Conditions of the event and/or </i><i>intentionally create situtations that are detrimental to any involved party, at the sole discretion of the promoter. No refunds will be given.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="42" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{208}" paraid="920432676">Penyelenggara, panitia, pendukung dan artis tidak bertanggung jawab atas peristiwa kehilangan, pencurian, atau pengrusakan barang ataupun kecelakaan yang terjadi di area manapun di dalam lokasi acara pada saat penyelenggaraan acara dan karena sebab apapun.<br><span style="color:#FF0000;"><i>The organizers, promoters, and artists cannot be held responsible for lost, stolen, or damaged possessions or accidents resulting in injury occurring anywhere in the venue during the event regardless of fault or reason.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="43" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{4a86ecdd-33d7-4660-aade-b74c57928c8f}{234}" paraid="564827260">Pihak Promotor berhak melarang untuk masuk terhadap pengunjung manapun yang terindikasi sedang berada dalam keadaan mabuk karena alkohol atau secara jelas berada dibawah pengaruh obat-obatan terlarang. Siapapun yang ditemukan membawa barang-barang yang melanggar hukum akan dilaporkan kepada polisi, dilarang untuk memasuki lokasi acara, dan harga tiket tidak akan dikembalikan.<br><span style="color:#FF0000;"><i>The Promoter reserves the right to prohibit entry to any individual suspected of being intoxicated due to alcohol or clearly under the influence of illegal substances. Anyone found in possession of illegal items will be reported to the authorities, denied entry to the event location, and will not be entitled to a refund for their ticket.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="44" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{1}" paraid="1904939795">Penyelenggara acara menentang adanya SARA dan perundungan.<i> </i>Setiap peserta acara yang diketahui, atas kebijakan Promotor, menunjukkan perilaku ini dapat dikeluarkan dari acara tanpa diberikan pengembalian harga tiket.<br><span style="color:#FF0000;"><i>Promoter does not permit any form of harassment and/or bullying. Any event attendee observed, at the sole discretion of the Promoter, to be exhibiting these behaviors may be removed from the event. No refunds will be given.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="45" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{21}" paraid="1227125022">Dilarang melemparkan barang ke panggung, khususnya benda padat karena akan melukai artis yang melakukan pertunjukan acara.<br><span style="color:#FF0000;"><i>Throwing objects onto the stage is strictly prohibited, especially solid items, as they may injure the performers / artist(s) during the event.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="46" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{87}" paraid="1216068777">Keselamatan dan keamanan Anda menjadi prioritas bagi penyelenggara. Anda memahami bahwa Anda dan barang bawaan Anda akan dikenai pemeriksaan pada saat masuk ke lokasi acara. Untuk memastikan proses masuk yang lancar dan aman bagi semua pengunjung, pemeriksaan kemanan akan dilakukan secara menyeluruh, termasuk inspeksi visual terhadap tas dan barang bawaan, pemeriksaan dengan metode bandara, detektor obat-obatan terlarang dan anjing pelacak (K-9). Jika Anda menolak untuk berpartisipasi dalam tindakan kemanan ini, kami dapat menolak Anda untuk masuk ke area acara. Penyelenggara berhak untuk meminta Anda meninggalkan acara jika perilaku Anda membahayakan keselamatan atau kemanan peserta acara lainnya tanpa menerima pengembalian uang tiket.<br><span style="color:#FF0000;"><i>Your safety and security are a priority for the organizers. You acknowledge that you and your belongings will be subject to inspection upon entry to the event venue. To ensure a smooth and secure entry process for all attendees, comprehensive security checks will be conducted, including visual inspections of bags and belongings, Airport-style pat-down searches, electronic drug detection and K-9 screenings. Should you refuse to participate in these security procedures, we reserve the right to deny you entry to the event. The organizers also have the right to ask you to leave the event if your behavior poses a threat to the safety or security of other attendees, without any refund for your ticket.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="47" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{127}" paraid="731094898">Berikut adalah barang barang yang tidak diizinkan masuk ke dalam area acara.<br><span style="color:#FF0000;"><i>The following items are not permitted in the event area:</i> </span></p>
				</li>
			</ol><ul><li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Makanan dan Minuman<br><span style="color:#FF0000;"><i>Food and Drinks</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Kamera Profesional, DSLR, Perekam, Kamera Polaroid, GoPro, Drone, DJI Camera, etc<br><span style="color:#FF0000;"><i>Professional Cameras, DSLR, Recorders, Polaroid Cameras, GoPro, Drone, DJI Camera, etc</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Ipad/Tablet<br><span style="color:#FF0000;"><i>Ipads/Tablets</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Tongkat Selfie, Tripod, dll<br><span style="color:#FF0000;"><i>Selfie Sticks, Tripods, etc</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Tas dengan ukuran melebihi 20cm x 30cm (Tas Non-PVC diperbolehkan). Tidak disediakan tempat penitipan barang di lokasi acara.<br><span style="color:#FF0000;"><i>Oversized Bags larger than 20 cm x 30 cm (Non PVC bag is allowed). There will be no lockers at the venue.</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Botol Minuman/Tumbler<br><span style="color:#FF0000;"><i>Water Bottles/Tumblers</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Parfum dan Kaleng aerosol<br><span style="color:#FF0000;"><i>Perfume and Aerosol Cans</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Bangku/Kursi<br><span style="color:#FF0000;"><i>Stools/Chairs</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Payung berukuran lebih dari 25cm dalam keadaan terlipat.<br><span style="color:#FF0000;"><i>Umbrellas that are larger than 25cm when folded</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Senter dan Penunjuk Laser<br><span style="color:#FF0000;"><i>Flashlights and Laser Pointers</i></span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Spanduk, Bendera, dll yang berukuran lebih besar dari A4<br><span style="color:#FF0000;"><i>Banners, Signs, Flags that are larger than A4 size, etc</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Senjata, Benda Tajam/ Benda Berbahaya Lainnya<br><span style="color:#FF0000;"><i>Weapons, Other sharp and/or dangerous objects</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Minuman Beralkohol dan obat-obatan terlarang / tanpa resep<br><span style="color:#FF0000;">Alcoholic drinks and illegal/non-prescription drugs</span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Rokok, Vape, Rokok Elektrik, dll<br><span style="color:#FF0000;"><i>Cigarettes, Vapes, E-cigarettes etc</i></span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Pemantik api dan barang yang mudah terbakar lainnya<br><span style="color:#FF0000;"><i>Lighters and other flammable items</i> </span></li>
				<li paraeid="{6e4f8c48-68e9-451d-8ebd-a9aeeb7524d8}{135}" paraid="1498981495">Alat yang dapat membuat kebisingan termasuk namun tidak terbatas pada terompet, peluit, dll<br><span style="color:#FF0000;"><i>Noise makers including but not limited to air horns, whistles, etc<br></i></span><br></li>
			</ul><ol role="list" start="48"><li aria-setsize="-1" data-aria-level="1" data-aria-posinset="48" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{bbc87db3-dd01-4599-96ad-492d3d94ab0b}{72}" paraid="2069088667">Dengan membeli Tiket untuk ke acara konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA,</strong> maka Pembeli Tiket dan Pemegang Tiket setuju untuk menaati setiap dan seluruh Syarat dan Ketentuan acara yang ditetapkan dan berlaku dari waktu ke waktu.<br><span style="color:#FF0000;"><i>By purchasing tickets to <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA,</strong> Ticket Buyers and Ticket Holders agree to comply with all the Terms & Conditions of the event that are valid from the time of purchase up until the conclusion of the event.</i> </span></p>
				</li>
				<li aria-setsize="-1" data-aria-level="1" data-aria-posinset="49" data-font="Cambria,Arial,ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¥        Â®        Â‹ÃƒÂƒ Âƒ  Âƒ   Âƒ    Âƒ     Âƒ      Âƒ       Â¤        Â½        Â“" data-leveltext="%1." data-list-defn-props="{">
				<p paraeid="{bbc87db3-dd01-4599-96ad-492d3d94ab0b}{110}" paraid="1235187775">Mohon cek akun Instagram kami (@ckstar.id) secara berkala untuk informasi lebih lanjut seputar konser <strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA</strong>.<br><span style="color:#FF0000;"><i>Please check our Instagram account (@ckstar.id) regularly for updates about</i><strong> </strong><i><strong>ROSETOPIA ASIA TOUR 2026 IN JAKARTA.</strong></i> </span></p>
				</li>
			</ol></div>
			</td>
			<td style="width:50%"> </td>
		</tr></tbody></table>' WHERE title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND venue = 'Jakarta Selatan';
UPDATE events SET terms_conditions = '<p class="mb-2 relative"><span style="white-space: pre-wrap;">&nbsp;Entry Pass yang valid adalah yang dibeli melalui artatix.co.id</span></p><ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Satu Entry Pass berlaku untuk satu orang.</span></li><li value="2" class="dark:text-white"><b><strong class="font-bold" style="white-space: pre-wrap;">Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/ yang bukan mitra resmi penjualan tiket "Moonverse ”.</strong></b></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang sudah dibeli tidak dapat dipindah tangankan atau dilakukan pengembalian uang (refund)</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang hilang karena dicuri tidak akan diganti atau diterbitkan ulang.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Dalam keadaan keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke venue Moonverse .</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Promotor berhak untuk:</span></li></ol><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area jika Entry Pass yang digunakan tidak valid.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li></ul></li></ul><ol start="13" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari Moonverse jika tidak mematuhi protokol kesehatan yang telah diterapkan.</span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang boleh dibawa kedalam venue:</span></li></ol><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa kartu identitas dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa bukti tiket/tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa masker dan hand sanitizer</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa obat-obatan pribadi</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa jas hujan&nbsp;</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></li></ul></li></ul><p class="mb-2 relative"><span style="white-space: pre-wrap;">15. Barang yang tidak diperbolehkan dibawa kedalam venue:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku ke dalam venue.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Tas atau ransel berukuran besar.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Rokok, vape, rokok elektrok dan lain sejenisnya</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li></ul></li></ul><ol start="16" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Dilarang membuat kerusuhan dalam situasi apapun di dalam area Moonverse .</span></li></ol><p class="mb-2 relative"><b><strong class="font-bold" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></p>' WHERE title = 'Moonverse Festival Vol  7' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket resmi hanya dijual melalui platform yang ditunjuk oleh promotor, yaitu </span><b><strong class="font-bold" style="white-space: pre-wrap;">Artatix.co.id</strong></b><span style="white-space: pre-wrap;">. Promotor tidak bertanggung jawab atas segala bentuk penipuan atau kerugian akibat pembelian tiket melalui pihak lain di luar penjualan resmi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Satu Entry Pass berlaku untuk satu orang.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Maksimal pembelian 5 tiket dalam 1 kali transaksi</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Ibu hamil tidak disarankan memasuki area venue Ayo Fest 2026</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Anak-anak di bawah 10 tahun tidak disarankan memasuki area venue Ayo Fest 2026</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket bersifat pribadi dan tidak dapat dialihkan kepada pihak lain dalam kondisi apa pun, termasuk menggunakan surat kuasa dan sejenisnya</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Setiap pemegang tiket bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya selama berada di area konser. Penyelenggara, sponsor, dan band tidak bertanggung jawab atas cedera, kerusakan, atau kehilangan yang mungkin terjadi selama atau di dalam acara</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></li><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">E-ticket dan kartu identitas asli berbentuk fisik (KTP/SIM/Paspor) menjadi syarat wajib saat penukaran tiket</span></li><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Promotor berhak untuk:</span></li></ol><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area event Ayo Fest 2026 jika Entry Pass yang digunakan tidak valid.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li></ul></li></ul><ol start="16" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang boleh dibawa kedalam event Ayo Fest 2026 :</span></li></ol><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa kartu identitas dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa bukti tiket/tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa obat-obatan pribadi</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa jas hujan&nbsp;</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Tumblr/ Botol minum kosong</span></li></ul></li></ul><ol start="17" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang tidak diperbolehkan dibawa kedalam event Ayo Fest 2026 :</span></li></ol><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar ke dalam venue Ayo Fest 2026.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Tas atau ransel berukuran besar.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Kursi lipat atau sejenisnya.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Rokok, vape, rokok elektrik dan lain sejenisnya</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li></ul></li></ul><ol start="18" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="18" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li><li value="19" class="dark:text-white"><span style="white-space: pre-wrap;"> Dilarang membuat kerusuhan dalam situasi apapun di dalam area event Ayo Fest 2026.</span></li><li value="20" class="dark:text-white"><span style="white-space: pre-wrap;">Segala syarat dan ketentuan mengenai tiket merupakan kebijakan penyelenggara yang tidak dapat diganggu gugat</span></li><li value="21" class="dark:text-white"><span style="white-space: pre-wrap;">Pembelian tiket ini secara otomatis menyatakan bahwa pembeli telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku.</span></li></ol><p class="mb-2 relative" style="text-align: justify;"><br><b><strong class="font-bold" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></p><p class="mb-2 relative" style="text-align: justify;"><b><strong class="font-bold" style="white-space: pre-wrap;">DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN.</strong></b></p>' WHERE title = 'Ayo Fest 2026' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<p class="mb-2 relative"><span style="white-space: pre-wrap;">1. Entry Pass yang valid adalah yang dibeli melalui artatix.co.id</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">2. Satu Entry Pass berlaku untuk satu orang.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket "Riang dan Ceria”.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">6.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">minimal umur 13 tahun</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">7.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">8.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">9.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">10.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">11.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke "Riang dan Ceria”.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">12.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Promotor berhak untuk:</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Melarang penonton masuk ke area "Riang dan ceria” jika Entry Pass yang digunakan tidak valid.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari "Riang dan Ceria ” jika tidak mematuhi protokol kesehatan yang telah diterapkan.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">13 Barang yang boleh dibawa kedalam venue:</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Membawa kartu identitas dan uang pribadi</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Membawa bukti tiket/tanda masuk</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Membawa masker dan hand sanitizer</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Membawa obat-obatan pribadi</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Membawa jas hujan </span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">14.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;">Barang yang tidak diperbolehkan dibawa kedalam "Riang Dan Ceria” :</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Makanan dan minuman dari luar ke dalam "Riang dan Ceria”.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Kamera profesional seperti Drone, SLR, DSLR. Tongsis atau Selfie Stick.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya. </span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Cairan dan benda yang mudah terbakar.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Tas atau ransel berukuran besar.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Laser dan pointer.</span></p><p class="mb-2 relative"><span style="white-space: pre-wrap;">* Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></p><ol start="15" class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li></ol><p class="mb-2 relative"><span style="white-space: pre-wrap;">16.</span><span style="white-space: pre-wrap;">	</span><span style="white-space: pre-wrap;"> Dilarang membuat kerusuhan dalam situasi apapun di dalam area "Riang Dan Ceria”.</span></p>' WHERE title = 'Riang dan Ceria Jambi' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ticket Purchase and Redemption: Official tickets must be purchased through the authorized ticketing partner and are non-refundable. e-vouchers must be exchanged for wristbands upon presentation of a valid original ID (KTP/Driver''s License/Passport).&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ticket Usage: Ticket can only be used 1 (one) time. Re-entry does not apply.</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wristband Usage: Access wristbands must be worn at all times while within the festival area. Organizers reserve the right to deny entry to visitors with damaged, broken, or unattached wristbands.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Age Restrictions: Children under the age of 5 are admitted free of charge but must remain under the full supervision of a parent or adult guardian.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Security Checks: All visitors are subject to body and bag checks by the security team before entering the venue.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prohibited Items: Bringing firearms or sharp weapons, narcotics, outside food or beverages, professional cameras or drones, glass bottles or cans, as well as political, SARA-related (sectarian/sensitive), or provocative items is strictly prohibited.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Responsibility: Visitors are responsible for any damage to, loss of, or theft of personal belongings during the event.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Organizer Rights: Organizers reserve the right to deny entry to or remove visitors who violate rules or engage in illegal activities, without providing a ticket refund.&nbsp;</span></p><p class="mb-2 relative" style="text-align: start;"><span style="white-space: pre-wrap;">9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Event Documentation: All visitors grant permission to the organizers to capture and use photos or videos as part of the documentation and promotional materials for Remember Fest 2026 x Cube Concert.</span></p>' WHERE title = 'Remember Fest 2026 X Cube Concert' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<ul><li>Proof of ID is a requirement for every ticket purchased<br><span style="color:#0000CD;"><em>Wajib menunjukkan kartu identitas untuk setiap pembelian tiket</em></span></li>
				<li>E-voucher can be exchanged at Social Padel House, Setiabudi on the date according to the ticket category.<br><span style="color:#0000CD;"><em>E-voucher ini dapat ditukarkan dengan tiket asli di Social Padel House, Setiabudi di tanggal sesuai kategori tiket</em></span></li>
				<li>Tickets are non-refundable<br><span style="color:#0000CD;"><em>Tiket yang sudah dibeli tidak dapat dikembalikan</em></span></li>
				<li>The Organizer/Promoter is not responsible for the negligence of the ticket buyer which results in the E-voucher/ticket falling into the hands of another person (in the control of another person) to be used as a sign of entry to the performance venue or to exchange a ticket which eliminates the buyer''s right to enter the performance venue/exchange the E-voucher.<br><span style="color:#0000CD;"><em>Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.</em></span></li>
				<li>Prohibited to bring food and drinks from outside into the venue.<br><span style="color:#0000CD;"><em>Dilarang membawa makanan dan minuman dari luar ke dalam venue.</em></span></li>
				<li>Prohibited to bring and use any illegal drugs, narcotics, psychotropics, or items containing other dangerous substances<br><span style="color:#0000CD;"><em>Dilarang membawa dan menggunakan segala obat-obatan terlarang, narkoba, psikotropika, atau barang-barang yang mengandung zat berbahaya lainnya.</em></span></li>
				<li>Prohibited to bring sharp weapons/firearms, explosives, and objects prohibited under applicable laws and regulations into the venue.<br><span style="color:#0000CD;"><em>Dilarang membawa senjata tajam/api, bahan peledak, serta benda-benda yang dilarang berdasarkan ketentuan perundangan yang berlaku ke dalam venue.</em></span></li>
				<li>We will have every right to refuse and/or discharge entry for ticket holders that does not meet the Term & Condition<br><span style="color:#0000CD;"><em>Penyelenggara berhak untuk tidak memberikan izin untuk masuk ke dalam tempat acara apabila syarat-syarat & ketentuan tidak dipenuhi</em></span></li>
			</ul></td>
		</tr></tbody></table>' WHERE title = 'SPH Superstar Series : Tolito Aguirre' AND venue = 'Jakarta Selatan';
UPDATE events SET terms_conditions = '<p class="mb-2 relative"><b><strong class="font-bold" style="white-space: pre-wrap;">Syarat &amp; Ketentuan</strong></b></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">1. Tiket resmi hanya dijual melalui situs </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar </strong></b></i><span style="white-space: pre-wrap;">atau official ticketing partner yang ditunjuk oleh promotor </span><i><em class="italic" style="white-space: pre-wrap;">(Artatix.co.id)</em></i><span style="white-space: pre-wrap;">. Promotor tidak bertanggung jawab atas segala bentuk penipuan tiket yang dibeli dari pihak lain.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">2. Satu Entry Pass berlaku untuk satu orang.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">3. Maksimal pembelian 5 tiket dalam 1 kali transaksi</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">4. Ibu hamil tidak disarankan memasuki area venue </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar</strong></b></i></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">5. Tiket bersifat pribadi dan tidak dapat dialihkan kepada pihak lain dalam kondisi apa pun, kecuali menggunakan surat kuasa dan sejenisnya</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">6. Setiap pemegang tiket bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya selama berada di area konser. Penyelenggara, sponsor, dan band tidak bertanggung jawab atas cedera, kerusakan, atau kehilangan yang mungkin terjadi selama atau di dalam acara</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">7. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">8. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">9. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">10. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">11. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">12. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">13. E-ticket dan kartu identitas asli berbentuk fisik (KTP/SIM/Paspor) menjadi syarat wajib saat penukaran tiket</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">14. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke Lokasi event </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar.</strong></b></i></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">15. Promotor berhak untuk:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area event </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar</strong></b></i><span style="white-space: pre-wrap;"> jika Entry Pass yang digunakan tidak valid.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li></ul><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">16. Barang yang boleh dibawa kedalam event </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar </strong></b></i><span style="white-space: pre-wrap;">:</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa kartu identitas dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa bukti tiket/tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa obat-obatan pribadi</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa jas hujan&nbsp;</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></li></ul><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">17. Barang yang tidak diperbolehkan dibawa kedalam event </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar</strong></b></i><span style="white-space: pre-wrap;"> :</span></p><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar ke dalam venue </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar</strong></b></i><span style="white-space: pre-wrap;">.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Tas atau ransel berukuran besar.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Kursi lipat atau sejenisnya.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Rokok, vape, rokok elektrik dan lain sejenisnya</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li></ul><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">18. Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">19. Dilarang membuat kerusuhan dalam situasi apapun di dalam area event </span><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">Semestambyar</strong></b></i><span style="white-space: pre-wrap;">.</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">20. Segala syarat dan ketentuan mengenai tiket merupakan kebijakan penyelenggara yang tidak dapat diganggu gugat</span></p><p class="mb-2 relative" style="text-align: justify;"><span style="white-space: pre-wrap;">21. Pembelian tiket ini secara otomatis menyatakan bahwa pembeli telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku.</span></p><p class="mb-2 relative" style="text-align: justify;"><br><b><strong class="font-bold" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></p><p class="mb-2 relative" style="text-align: justify;"><b><strong class="font-bold" style="white-space: pre-wrap;">DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN.</strong></b></p>' WHERE title = 'SEMESTAMBYAR' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<table class="toc"><tbody><tr></tr></tbody><tbody><tr><td style="width:50%">
			<div class="editable__">
			<p><meta charset="utf-8"></p>

			<ol dir="ltr"><li role="presentation">Maksimal <strong>9 kart</strong> dalam satu sesi (durasi 7 menit).</li>
				<li role="presentation">Pengunjung yang bermain menggunakan <strong>Senior Kart</strong> wajib membuat <strong>Racer Name</strong>, melakukan registrasi, serta mengisi <strong>waiver</strong> sebelum bermain. Seluruh data yang didaftarkan harus sesuai dengan identitas resmi.</li>
				<li role="presentation"><strong>Racer Name</strong> yang telah didaftarkan tidak dapat diubah maupun dipindahtangankan kepada orang lain.</li>
				<li role="presentation">Pengunjung diwajibkan hadir di area kasir <strong>minimal 30 menit sebelum jam sesi dimulai</strong>.</li>
				<li role="presentation">Pembayaran yang telah dilakukan<strong> tidak dapat dikembalikan (non-refundable)</strong>.</li>
				<li role="presentation">Tiket hanya berlaku pada <strong>tanggal kunjungan </strong>yang telah dipilih.</li>
				<li role="presentation">Pengambilan sesi bermain mengikuti antrean yang berlaku di kasir.</li>
				<li role="presentation">Pengunjung yang telah melakukan registrasi melalui <strong>Loket.com</strong> wajib menunjukkan <strong>e-ticket</strong> di counter kasir Barcode Gokart.</li>
				<li role="presentation">Wajib menggunakan <strong>helm full-face</strong> dengan standar <strong>Double D-Ring</strong>.</li>
				<li role="presentation">Wajib menggunakan <strong>balaclava</strong>.</li>
				<li role="presentation">Wajib menggunakan <strong>sepatu tertutup</strong>.</li>
				<li role="presentation">Penggunaan <strong>sarung tangan</strong>, <strong>neck support collar</strong>, dan <strong>rib protector</strong> bersifat opsional.</li>
				<li role="presentation">Manajemen Barcode Gokart berhak menolak peserta yang dianggap tidak memenuhi standar keselamatan atau berpotensi membahayakan diri sendiri maupun orang lain.</li>
			</ol></div>
			</td>
		</tr></tbody></table>' WHERE title = 'BARCODE GOKART' AND venue = 'Jakarta Utara';
UPDATE events SET terms_conditions = '<table class="toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td style="width:50%">
			<div class="editable__">
			<h2 dir="ltr"><font size="2"><strong style="">PERATURAN UMUM PENYELENGGARAAN EVENT</strong><br><span style="color:#0000FF;"><em><strong style="">GENERAL TERMS AND CONDITIONS</strong></em></span></font><br></h2>

			<p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Drinking station tersedia di area venue untuk pengisian ulang air minum. Mohon membawa tumbler pribadi Anda.<br><span style="color:#0000FF;"><em>Refillable drinking stations are available throughout the venue for your convenience. We encourage all attendees to bring their own tumblers.</em></span></font></b></p>

			<p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Merokok hanya diperbolehkan di area yang telah disediakan.<br><span style="color:#0000FF;"><em>Smoking is only allowed in the areas provided.</em></span></font></b><br></p>

			<p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">BARANG-BARANG TERLARANG:<br><span style="color:#0000FF;"><em>PROHIBITED ITEMS:</em></span></font></b></p>

			<ol><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Makanan dan minuman dari luar, makanan dan minuman tersedia di dalam venue.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Outside food or drinks. Food and drinks are available inside the venue.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Peralatan fotografi, videografi professional dan drone.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Professional photography / videography (with detachable lenses), audio recording equipment and drone. </b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Botol plastik, kaca dan kaleng.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Plastic bottles, glasses and cans.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Korek (Korek tersedia di area merokok).</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Lighters (Lighters available in the smoking area).</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Payung.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Umbrella.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Narkoba, obat-obat terlarang dan benda-benda ilegal lainnya.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Drugs and illegal substances.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Rollerblade, sepeda, dan kendaraan personal lainnya.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Rollerblades, bicycles, and other personal vehicles.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Senjata, benda tajam dan/atau benda mudah terbakar/meledak.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Weapons, sharp objects, and flammables.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Benda-benda yang memiliki potensi bahaya dan beracun.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Any other potentially hazardous and dangerous items.</b></em></span></font></p>
				</li>
			</ol><p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">BARANG-BARANG YANG DIPERBOLEHKAN :<br><span style="color:#0000FF;"><em>ACCEPTABLE ITEMS:</em></span></font></b></p>

			<ol><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Rokok (Rokok harus dalam keadaan tersegel saat memasuki area konser).</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Cigarettes (cigarettes must be sealed upon entry)</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Rokok Elektrik dan vape.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">E-cigs / vapes.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Botol parfum, air minum dan tumbler diperbolehkan.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Perfume, Water bottles, and tumblers are permitted.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Kamera non profesional.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Non-professional flash / still cameras, handheld video devices (such as: Sony Action Cam, GoPro, Polaroids, etc.).</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Jas hujan.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Rain ponchos are recommended.</b></em></span></font></p>
				</li>
			</ol><p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">SYARAT DAN KETENTUAN TIKET<br><span style="color:#0000FF;"><em>TICKET RULES AND REGULATIONS</em></span></font></b></p>

			<ol><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Tiket hanya dapat dibeli melalui website resmi <a href="https://joylandfest.com/">https://joylandfest.com/</a> & loket.com. Tiket yang diperoleh dari sumber yang tidak resmi, mungkin palsu dan tidak berlaku. Pihak penyelenggara tidak bertanggung jawab atas segala bentuk penipuan tiket yang dibeli melalui pihak lain.<br><em><span style="color:#0000FF;">Tickets can only be purchased via our official website</span><a href="http://www.joylandfest.com/"><span style="color:#0000FF;"> </span></a><a href="http://www.joylandfest.com"><span style="color:#0000FF;">www.joylandfest.com</span></a><span style="color:#0000FF;"> & </span><a href="http://loket.com/"><span style="color:#0000FF;">loket.com</span></a><span style="color:#0000FF;">. Tickets obtained from unofficial sources may be counterfeit and invalid. The organizer is not responsible for any form of fraudulent tickets purchased through other parties.</span></em></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Tiket yang sudah dibeli atau ditukar tidak dapat dikembalikan.<br><span style="color:#0000FF;"><em>Tickets that have been purchased or exchanged are non-refundable.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Tiket dapat dipindahtangankan dengan syarat: membawa fotocopy KTP Fisik/Digital pembeli tiket.<br><span style="color:#0000FF;"><em>Tickets can be transferred with the following conditions: bring a photocopy of the purchaser''s Physical/Digital identity card.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Tiket tidak boleh dijual, dialihkan atau digunakan untuk segala bentuk tujuan komersial atau perdagangan, termasuk namun tidak terbatas pada promosi, kontes, tujuan komersial atau periklanan, perumahan, hotel, persewaan liburan, undian, hadiah amal atau kegiatan lain tanpa persetujuan tertulis sebelumnya dari penyelenggara. Kegiatan sponsorship, pemasaran ditempat, pemberian sampel, penjual otomatis, pembagian kupon/produk, atau aktivitas promosi lainnya tidak boleh dilakukan di acara (termasuk di tempat parkir), tanpa persetujuan tertulis sebelumnya dari penyelenggara dalam setiap kegiatan. Setiap tiket yang digunakan yang melanggar ketentuan ini akan dicabut dan tidak berlaku, dan pembawanya dianggap sebagai pelanggar di acara. Penjualan kembali atau upaya penjualan kembali tiket dapat menjadi alasan untuk penghentian lisensi dan pembatalan tiket.<br><span style="color:#0000FF;"><em>Tickets may not be sold, transferred or used for any form of commercial or trade purposes, including but not limited to promotions, contests, commercial or advertising purposes, housing, hotels, vacation rentals, sweepstakes, charitable gifts or other activities without the prior written consent of organizer. Sponsorship activities, on-site marketing, sample giving, vending, distribution of coupons/products, or other promotional activities may not be carried out at the event (including in the parking lot), without prior written approval from the organizer in each activity. Any tickets used in violation of these terms will be revoked and void, and the bearer will be deemed a violator at the event. The resale or attempted resale of tickets may be grounds for license termination and ticket cancellation.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Pembeli tiket Joyland Sessions akan menerima tiket elektronik. Harap membawa tiket elektronik saat penukaran tiket fisik. Cukup berupa softcopy, tidak perlu dicetak kertas.<br><span style="color:#0000FF;"><em>Purchasers of Joyland Sessions tickets will receive e-vouchers. Please ensure to bring your e-voucher during ticket exchange. Digital e-vouchers are acceptable; printing of e-vouchers is not necessary.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Untuk pembeli tiket kategori Early Entry, diwajibkan masuk ke dalam venue sebelum pukul 15:00 WIB. Jika pemilik tiket early entry datang melebihi waktu tersebut, maka akan dikenakan biaya tambahan sebesar Rp 125.000,- yang dibayarkan di venue pada hari H, untuk dapat masuk ke dalam venue Joyland Sessions.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Early Entry ticket holders are required to enter the venue before 15:00 WIB. If an Early Entry ticket holder arrives later than the specified time, an additional fee of IDR 125,000,- will be charged on the event date to enter the Joyland Sessions venue.</b></em></span></font></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Barcode akan dipindai oleh petugas pada saat memasuki area Joyland Sessions. Pengunjung akan mendapatkan gelang. Gelang WAJIB digunakan secepatnya pada saat memasuki area Joyland Jakarta.<br><span style="color:#0000FF;"><em>Barcode will be scanned by our staff upon entry to Joyland Sessions. E-vouchers will then be exchanged with a wristband. Wristbands are MANDATORY to be used immediately upon entrance to the Joyland Festival area.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Penonton dapat memasuki area melalui pintu yang disediakan<br><span style="color:#0000FF;"><em>Visitors can enter through the entrance that has been provided.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Pembelian tiket maksimal sejumlah 6 (enam) tiket per transaksi<br><span style="color:#0000FF;"><em>Maximum purchase of 6 (six) tickets in one transaction.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Tidak diperbolehkan masuk kembali setelah keluar dari area Joyland Sessions, di hari yang sama.<br><span style="color:#0000FF;"><em>No re-entries allowed, after leaving the Joyland Sessions area, on the same day.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Dengan membeli tiket, Anda menyetujui semua ketentuan dan terikat secara hukum untuk mematuhi ketentuan ini. Penyelenggara berhak, atas kebijakannya sendiri, untuk mengubah, memodifikasi, menambah atau menghapus bagian dari ketentuan ini setiap saat. Silahkan melakukan pemeriksaan secara berkala untuk perubahan ketentuan.<br><span style="color:#0000FF;"><em>By purchasing a ticket, you agree to all the terms and are legally bound to comply with these terms. The Organizer reserves the right, in its sole discretion, to change, modify, add or remove portions of these terms at any time. Please check regularly for changes to the terms.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Pembeli tiket memberikan hak kepada penyelenggara (dan yang ditunjuknya) untuk memasukan gambar, rupa, tindakan dan pernyataan Anda dalam audio, video, film, webcast, streaming atau transmisi, pameran, siaran simulcast atau reproduksi lainnya yang dibuat secara langsung atau direkam, atau di acara dalam media atau konteks apa pun untuk tujuan apa pun, termasuk tujuan komersial atau promosi tanpa izin lebih lanjut atau sebaliknya serta bahwa Anda tidak berhak atas pembayaran, kompensasi, atau kredit dalam bentuk apa pun terkait hal tersebut.<br><span style="color:#0000FF;"><em>The ticket purchaser grants the organizer the right (and its designees) to include your images, forms, actions and statements in audio, video, film, webcast, streaming or transmission, exhibition, simulcast broadcast or other reproduction made live or recorded, or in events in any media or context for any purpose, including commercial or promotional purposes without further permission or otherwise and that you are not entitled to any payment, compensation or credit of any kind in connection therewith.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Jika terjadi pembatalan acara, maka uang tiket akan dikembalikan sesuai dengan ketentuan penyelenggara. Biaya administrasi tiket, convenient fee pembayaran dengan kartu kredit, virtual account atau biaya pribadi lainnya (contoh biaya perjalanan, biaya akomodasi, dll.) tidak akan dikembalikan.<br><span style="color:#0000FF;"><em>In the event of cancellation of the event, the ticket money will be refunded according to the provisions of the organizer. Ticket administration fees, convenient fees for payment by credit card, virtual account or other personal costs (eg travel expenses, accommodation fees, etc.) will not be refunded.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">Waktu pertunjukan dan artis dapat berubah tanpa pemberitahuan sebelumnya. Tidak ada pengembalian uang yang akan diberikan jika terjadi perubahan tersebut.<br><span style="color:#0000FF;"><em>Performance times and artists are subject to change without prior notice. No refunds will be given in the event of such change.</em></span></font></b></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><font size="2"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">Dengan membeli tiket, anda mengerti dan setuju kepada syarat dan ketentuan dari acara dan bersedia mengikuti seluruh arahan, perintah dan regulasi yang diberikan oleh penyelenggara dan pemerintah Indonesia, ketentuan tersebut juga berlaku untuk protokol kesehatan dan keselamatan yang di lakukan saat acara berlangsung.</b><br><span style="color:#0000FF;"><em><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f">By purchasing this ticket, you understand and agree to the terms and conditions of the event and comply to all directions, orders, and regulations set by the organizer and Indonesian government, as well as the health and safety protocols applicable at the time of the event</b></em></span></font></p>
				</li>
			</ol><p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">FOR FURTHER INFORMATION</font></b></p>

			<p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">INSTAGRAM : <a href="https://www.instagram.com/plainsonglive_/?hl=en">PLAINSONGLIVE_</a><br>
			WEBSITE : <a href="https://www.plainsong.id/">https://www.plainsong.id/</a></font></b><br></p>

			<p dir="ltr"><b id="docs-internal-guid-8b197b86-7fff-4279-1ef8-c069f5b1557f"><font size="2">LOKET.COM Customer Service<br>
			EMAIL : support@loket.com<br>
			PHONE : +6221-30003160</font></b></p>
			</div>
			</td>
		</tr></tbody></table>' WHERE title = 'Joyland Sessions 2026' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = '<ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Jika kamu melakukan pembelian tiket acara ini, maka dianggap sudah membaca, memahami, dan menyetujui seluruh Syarat &amp; Ketentuan dari acara.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket Masuk / Entry Pass yang valid adalah yang dibeli melalui artatix.co.id.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Satu Tiket Masuk / Entry Pass berlaku untuk satu orang.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Disarankan tidak meng-upload E-Ticket / Entry Pass di media sosial untuk menghindari duplikasi.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia dan Promotor tidak bertanggung jawab / tidak ada penggantian kerugian atas pembelian tiket acara melalui calo / tempat / kanal / platform yang bukan mitra resmi penjualan tiket “Nyanian Fest”</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Penyelenggara tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk digunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke area acara untuk menukarkan e-tiket.&nbsp;&nbsp;</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Harga sudah termasuk Pajak.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Harga belum termasuk biaya layanan artatix.co.id</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang sudah dibeli tidak dapat dikembalikan dan&nbsp;</span><i><em class="italic" style="white-space: pre-wrap;">non-refundable</em></i><span style="white-space: pre-wrap;">.&nbsp;</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Dalam keadaan-keadaan kahar / darurat seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></li><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">Harap membawa kartu ID asli dan e-Ticket dari artatix.co.id saat melakukan penukaran tiket.</span></li><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Promotor berhak untuk:</span></li><li value="16" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area Creative Culture Studio jika Entry Pass yang digunakan tidak valid.</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li></ul></li><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari Area Pertunjukan jika tidak mematuhi protokol keselamatan acara.</span></li><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang boleh dibawa kedalam area pertunjukan :</span></li><li value="18" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa kartu identitas dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa bukti tiket/tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa masker dan hand sanitizer</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa obat-obatan pribadi</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa jas hujan&nbsp;</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Membawa handphone / perangkat lainnya</span></li></ul></li><li value="18" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang tidak boleh dibawa kedalam area pertunjukan :</span></li><li value="19" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ul class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Tidak membawa atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar ke dalam Venue Nyanyian Fest&nbsp;</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR.</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.&nbsp;</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Tas atau ransel berukuran besar.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Rokok, vape, rokok elektrok dan lain sejenisnya</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</span></li></ul></li><li value="19" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li></ul><p class="mb-2 relative"><br><br><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></i></p><p class="mb-2 relative"><i><b><strong class="font-bold italic" style="white-space: pre-wrap;">DAN SAYA MEMBERIKAN PERSETUJUAN SAYA UNTUK DIKONTRAKKAN SECARA HUKUM DENGAN SYARAT DAN KETENTUAN</strong></b></i></p>' WHERE title = 'Nyanyian Fest Subang 2026' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<ul><li>1 e-ticket (1 barcode) is only applicable to 1 person.</li><li>The barcode on the ticket will be used as an entrance pass. </li><li>The E-ticket/E-Voucher can be screen-captured or printed out. If you choose to screen-capture, make sure the barcode on your phone looks clear. </li><li>By purchasing this ticket, you have agreed to the personal data collection, storage, and usage for the recital purposes. </li><li>There is a maximum of 5 tickets purchasable per transaction.  </li><li>It is forbidden to bring sharp items, firearms, drugs, and pets into the recital. </li><li>Please remain silent during the recital. If you need to leave the hall, kindly do so only between pieces or during the intermission.</li><li>A purchased ticket <strong>can''t </strong>be returned. </li><li>The attendee is advised to come at least 20 minutes before the recital starts. When the recital starts, the late attendees will only be allowed to enter during the gap between songs.</li><li>Attendees must be at least 6 years old. Children should be accompanied by a guardian who can ensure they remain silent throughout the recital.</li><li>You may inquire any information regarding the ticket purchase by contacting the Loket.com call center at <a href="mailto:support@loket.com" rel="noopener noreferrer" target="_blank">support@loket.com</a> or +62-21-8060-0822. </li></ul>' WHERE title = 'Piano Recital by Petrick Kluivert' AND venue = 'Jakarta Selatan';
UPDATE events SET terms_conditions = '<p><strong>Benefits</strong></p><p><br></p><p><br></p><p><br></p><p><strong>Terms & Conditions</strong></p><p><br></p><ul><li><span>Satu tiket hanya berlaku untuk 1 (satu) orang</span></li><li><span>Semua pengunjung berusia di atas 5 (lima) tahun wajib memiliki tiket untuk dapat memasuki area festival The 49th Jazz Goes to Campus.</span></li><li><span>Tiket hanya dapat dibeli melalui website resmi jgtcfestival.com atau Loket.com</span></li><li><span>Harga tiket yang tertera belum termasuk platform handling fee dan local tax.</span></li><li><span>Tiket tidak dapat dikembalikan (NON-REFUNDABLE) setelah pembelian.</span></li><li><span>Setiap email hanya diperbolehkan membeli maksimal 10 tiket per transaksi </span></li><li><span>Saat penukaran tiket (ticket exchange), pengunjung wajib membawa kartu identitas resmi (seperti KTP, SIM, atau Kartu Pelajar) dan E-Ticket sebagai bukti pembelian.</span></li><li><span>Pengunjung diimbau menjaga kebersihan, menggunakan fasilitas umum dengan bijak, dan mengikuti protokol kesehatan yang berlaku pada saat acara berlangsung.</span></li><li><span>Tidak tersedia layanan penitipan barang di area acara. Pengunjung disarankan membawa barang seperlunya dan bertanggung jawab atas barang pribadinya masing-masing.</span></li><li><span>Panitia tidak bertanggung jawab atas kehilangan barang pribadi selama acara.</span></li><li><span>Panitia berhak melakukan pemeriksaan terhadap barang bawaan pengunjung demi menjaga keamanan dan kenyamanan acara.</span></li><li><span>Barang-barang yang dilarang dan disita oleh panitia selama acara berlangsung tidak dapat dikembalikan dalam kondisi atau alasan apa pun.</span></li><li><span>Pengunjung wajib mematuhi seluruh ketentuan mengenai barang bawaan yang berlaku selama acara berlangsung.</span></li><li><span>Penyelenggara tidak bertanggung jawab atas tiket yang dibeli di luar platform resmi (termasuk melalui calo, reseller tidak resmi, dan pihak ketiga lainnya)</span></li><li><span>Tiket yang rusak (misalnya QR code tidak terbaca), hilang, dicuri, atau telah digunakan sebelumnya tidak akan digantikan dengan tiket baru dalam bentuk apapun oleh penyelenggara.</span></li><li><span>Pengunjung bertanggung jawab penuh atas keamanan dan validitas tiket miliknya masing-masing.</span></li><li><span>Penyelenggara tidak melayani penggantian tiket dalam kasus kerusakan, kehilangan, atau duplikasi akibat kelalaian pembeli.</span></li><li><span>Dalam hal Force Majeure (bencana alam, pandemi, kebijakan pemerintah, kerusuhan, dsb.), panitia berhak untuk mengubah tanggal, waktu, atau lokasi acara, bahkan membatalkan acara apabila diperlukan.</span></li><li><span>Syarat dan ketentuan ini dapat berubah sewaktu-waktu dan versi terbaru akan tersedia di situs resmi dan media sosial Jazz Goes to Campus</span></li><li><span>Semua keputusan yang dibuat oleh penyelenggara bersifat mutlak, resmi, dan harus dipatuhi oleh seluruh pengunjung.</span></li></ul><p><br></p><p><strong>Festival Guidelines</strong></p><p><br></p><ul><li><span>Read the Tickets Terms & Conditions Before Entering the Festival</span></li><li><span>Exchange your Tickets</span></li><li><span>Don’t Forget to Bring Your Own Medicine</span></li><li><span>Keep the venue clean and dispose of trash properly</span></li><li><span>Wear Comfortable Shoes </span></li></ul><p><br></p><p><strong>Prohibited Items</strong></p><ul><li><span>Cigarettes, e-cigarettes, vape, and pods</span></li><li><span>Weapons or any sharp objects</span></li><li><span>Flammable items (lighter, fireworks, etc.)</span></li><li><span>Alcohol</span></li><li><span>Illegal drugs</span></li><li><span>Perfume or any liquid substances</span></li><li><span>Outside food & beverages</span></li><li><span>Plastic packaging of any kind</span></li><li><span>Umbrellas</span></li><li><span>Tripods, monopods, and selfie sticks</span></li><li><span>Professional cameras (DSLR/SLR with detachable lens)</span></li><li><span>Bicycles, skates, and scooters</span></li><li><span>Large bags or suitcases</span></li><li><span>Laser pointers</span></li><li><span>Pets or animals</span></li><li><span>Baby strollers</span></li></ul>' WHERE title = 'The 49th Jazz Goes to Campus' AND venue = 'Kota Depok';
UPDATE events SET terms_conditions = '<p><h4><strong>Terms &amp; Conditions</strong></h4></p><p><h4><span style="font-weight: 400;">Dengan membeli tiket </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><em><span style="font-weight: 400;">,</span></em><span style="font-weight: 400;"> Pembeli telah menyetujui semua Syarat dan Ketentuan yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.</span></h4></p><p><h4><em><span style="font-weight: 400;">By purchasing a ticket for </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta</em></strong><em><span style="font-weight: 400;">, the Event Attendee has agreed to all applicable Terms and Conditions. All forms of violation of the terms and conditions will be dealt with strictly.</span></em></h4></p><p><h4><span style="font-weight: 400;">Kategori yang tersedia dan tempat penjualan tiket akan diumumkan melalui kanal resmi Penyelenggara.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Categories and official ticketing platform will be announced through the Promoter&rsquo;s official channels.</span></em><em><span style="font-weight: 400;"><br /></span></em><em><span style="font-weight: 400;"><br /></span></em><span style="font-weight: 400;">Semua harga belum termasuk Pajak Pemerintah dan belum termasuk Biaya Layanan lainnya. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">All Prices exclude Government tax and Convenience fee.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p><h4><span style="font-weight: 400;">Kategori tiket yang tersedia adalah sebagai berikut:</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Categories and ticketing website are as follows:</span></em></h4></p><p><h4><strong>VIP (SEATED)</strong><strong><br /></strong><strong>CAT R (SEATED)</strong><strong><br /></strong><strong>CAT S (SEATED)</strong><strong><br /></strong><strong>CAT B (SEATED)<br /></strong><strong>CAT A (SEATED)<br /><br /></strong><span style="font-weight: 400;">Semua penjualan tiket bersifat final. Tiket yang sudah dibeli tidak dapat ditukar, dikembalikan, atau dibatalkan.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">All ticket sales are final. Purchased tickets cannot be exchanged, refunded, or canceled.</span></em></h4></p><p><h4><strong><br /></strong><strong>INFORMASI PEMBELIAN TIKET:</strong> <strong>GENERAL SALE</strong><span style="font-weight: 400;">&nbsp;</span></h4></p><p><h4><strong><em>TICKET PURCHASE INFORMATION: GENERAL SALE</em></strong><strong><em><br /><br /></em></strong></h4></p><p><ol></p><p><li></p><p><h4><strong>Jadwal General Sale</strong> <span style="font-weight: 400;"><br /></span><strong><em>General Sale Schedule</em></strong> <span style="font-weight: 400;"><br /></span><span style="font-weight: 400;">Hari / Tanggal </span> <span style="font-weight: 400;">: Rabu, 29 Juli 2026</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Day / Date</span></em> <em><span style="font-weight: 400;">: Wednesday, 29 July 2026</span></em><em><span style="font-weight: 400;"><br /></span></em><span style="font-weight: 400;">Waktu </span> <span style="font-weight: 400;">: Pukul 14:00 WIB </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Time</span></em> <em><span style="font-weight: 400;">: 14:00 WIB</span></em></h4></p><p></li></p><p><li></p><p><h4>Pembelian tiket pada General Sale dapat dilakukan dengan beberapa metode pembayaran (virtual account dan kartu kredit).<br /><em><span style="font-weight: 400;">Ticket purchases on General Sale can be made with several payment methods (virtual account and credit card).</span></em></h4></p><p></li></p><p></ol></p><p><ol start="3"></p><p><li></p><p><h4><span style="font-weight: 400;"> 1 akun hanya dapat membeli maksimum 4 (empat) tiket di kategori lain per akun. Akun dengan NIK, alamat email dan nomor telepon yang sama tidak bisa melakukan pembelian berulang. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Each account may purchase a maximum of 4 (four) tickets in other categories per account. Accounts with the same NIK, email address, and phone number cannot make repeated purchases.</span></em><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;"><br /><br /></span></h4></p><p></li></p><p></ol></p><p><h4><strong>Ketentuan Umum</strong><strong><br /></strong><strong><em>General Regulations</em></strong></h4></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tiket hanya dapat dibeli melalui platform ticketing resmi yang diumumkan oleh Penyelenggara. Tiket hanya dapat digunakan untuk masuk ke acara </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Tickets can only be purchased through the official ticketing platform announced by the Promoter. Tickets are only valid for admission to </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta</em></strong><em><span style="font-weight: 400;">.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Nama sesuai dengan kartu identitas yang sah bersifat wajib untuk membeli tiket. Pastikan Anda melakukan pembelian tiket dengan menggunakan data yang sah dan benar, sesuai dengan KTP, KK, SIM, atau Paspor.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">You will be required to provide your name in accordance with your valid identification document when purchasing tickets. Please make sure to use correct and valid personal data according to your ID Card, Family Card, Driving License, or Passport.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tiket Anda tidak dapat diubah, dimodifikasi, atau dipindahtangankan setelah pembelian berhasil dilakukan.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Your ticket cannot be changed, modified, or transferred once the purchase has been completed.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Dimohon untuk membawa KTP, KK, Paspor, atau SIM asli sesuai dengan data yang tertera pada E-Voucher/E-Ticket saat penukaran wristband atau tiket.</span><em><span style="font-weight: 400;"><br /></span></em><em><span style="font-weight: 400;">Please bring your original valid ID Card, Family Card, Passport, or Driving License with personal information that matches what is reflected on the E-Voucher/E-Ticket in order to redeem your wristband or ticket.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">E-Voucher/E-Ticket menggunakan sistem barcode dan berlaku untuk satu kali penukaran wristband atau tiket. Dilarang keras melakukan duplikasi E-Voucher, E-Ticket, tiket, atau wristband.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The E-Voucher/E-Ticket contains a barcode and is valid for one-time wristband or ticket redemption only. Duplication of E-Vouchers, E-Tickets, tickets, or wristbands is strictly prohibited.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Mohon untuk tidak membagikan atau menyebarluaskan barcode yang tercantum pada E-Voucher/E-Ticket dalam bentuk apa pun, termasuk unggahan foto, email, screenshot, atau bentuk lainnya.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Please do not share or disseminate the barcode listed on your E-Voucher/E-Ticket in any form, including photo uploads, emails, screenshots, or any other format.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara tidak bertanggung jawab atas kelalaian pembeli yang mengakibatkan E-Voucher/E-Ticket jatuh ke tangan orang lain dan digunakan sebagai tanda masuk ke venue.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter is not responsible for any negligence by the E-Voucher/E-Ticket buyer that results in the E-Voucher/E-Ticket being used by another person for venue admission.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Setelah Anda berhasil melakukan pembelian tiket, E-Voucher/E-Ticket akan dikirimkan ke email Anda. H-7 sebelum konser dimulai, seat number akan muncul di E-Voucher/E-Ticket yang telah Anda dapatkan sebelumnya. Anda perlu me-refresh link E-Voucher/E-Ticket tersebut. Nomor kursi akan di generate oleh sistem dan tidak dapat diubah atau di modifikasi. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Upon purchasing the ticket successfully, an E-Voucher/E-Ticket will be sent to your email. 7 days before the concert starts, the seat number will be assigned to your ticket, and it will appear on the same E-Voucher/E-Ticket that you received previously. You will need to refresh the same E-Voucher/E-Ticket link received upon purchase to see your seat number. The seat number will be automatically generated and assigned by the system. The assigned seat number reflected on your E-Voucher/E-Ticket cannot be changed or modified.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pihak Promotor dan ticketing partner resmi yang ditunjuk menjamin hanya akan mengeluarkan E-Voucher/E-Ticket kepada Pembeli yang sah. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter and the appointed official ticketing partner guarantee that they will only issue E-Voucher to authorized Buyers.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Perpindahan kepemilikan dan/atau pemalsuan E-Voucher/tiket berada di luar kendali dan bukan menjadi tanggung jawab Promotor. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Transfer of ownership and/or forgery of E-Vouchers/tickets are beyond the control and not the responsibility of the Promoter.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tiket atau E-Voucher yang sudah dibeli tidak untuk diperjualbelikan kembali dengan harga yang lebih tinggi dari harga resmi yang telah ditentukan oleh Penyelenggara. Jika terdapat indikasi pelanggaran, maka Penyelenggara berhak untuk melakukan upaya hukum dan/atau membatalkan tiket tersebut. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Tickets or E-Vouchers that have been purchased are not to be resold at a higher price than the official price determined by the Organizer. In case of any indication of a violation, the Organizer has the right to take legal action and/or cancel the ticket.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Dengan membeli Tiket konser </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><span style="font-weight: 400;">, Anda telah menyetujui pengumpulan, penyimpanan, dan penggunaan data pribadi Anda secara terbatas untuk keperluan konser </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><span style="font-weight: 400;">. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">By purchasing tickets to </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta,</em></strong><em><span style="font-weight: 400;"> you agree to the collection, storage, and limited use of your personal data for the purposes of </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta.</em></strong></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penjualan Tiket resmi hanya melalui channel yang telah diinformasikan melalui akun resmi sosial media Penyelenggara acara @flabbergastproductions. Pembelian tiket di luar dari channel resmi menjadi tanggung jawab dan resiko pribadi dari Pembeli Tiket.&nbsp; </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Official tickets will only be sold through the platforms announced on Flabbergast Productions @flabbergastproductions official social media accounts. Ticket(s) purchased from unofficial and unauthorized third party are at the sole risk and responsibility of the Ticket Purchaser.</span></em><span style="font-weight: 400;"><br /></span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Syarat penukaran wristband : </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Wristband exchange requirements :</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">E-Voucher (Elektronik / Dicetak) </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">E-Voucher (Electronic / Printed)</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">KTP/KK/SIM/Paspor yang masih berlaku dan asli (nama harus sesuai dengan yang tertera di E-Voucher) </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Original and valid KTP/KK/SIM/Passport. Your name on your personal identification document must match the one reflected on your E-Voucher.</span></em></h4></p><p></li></p><p></ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Jika penukaran diwakilkan : </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">If you are redeeming the wristband on behalf of the original E-Voucher holder, you will need:</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><strong>E-Voucher (Dicetak)</strong> <span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">E-Voucher (Printed)</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Surat Kuasa yang dicetak dan ditandatangani langsung di atas materai Rp 10.000,- . Surat Kuasa ini wajib dibawa saat penukaran. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">A printed Letter of Attorney signed directly by the person that you are representing on an IDR 10.000 stamp. This signed Letter of Attorney must be brought at the time of exchange.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Fotokopi kartu identitas yang namanya tercantum di E-Voucher </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">A printed copy of the Identity Card whose name is reflected on the E-Voucher.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Format Surat Kuasa bisa di unduh di link yang tersedia di bio Instagram @flabbergastproductions. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Letter of Attorney Template can be downloaded at the link provided in the Instagram bio @flabbergastproductions.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p></ol></p><p><li style="font-weight: 400;"></p><p><h4><strong>Tidak ada gelang pengganti</strong><span style="font-weight: 400;"> yang akan dikeluarkan dalam kondisi apapun jika hilang &amp; rusak karena alasan apapun. Penyelenggara tidak bertanggung jawab atas gelang yang hilang, dicuri atau rusak. </span><span style="font-weight: 400;"><br /></span><strong><em>No wristband replacement will be issued </em></strong><em><span style="font-weight: 400;">or permitted under any circumstances. You will be responsible for ensuring that your wristband(s) is not lost, stolen and/or damaged. Promoters will not be responsible for any lost, stolen, and/or damaged wristband(s).</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara memiliki hak untuk mengubah ataupun menambahkan syarat lain pada </span><strong>Syarat &amp; Ketentuan</strong><span style="font-weight: 400;"> tanpa adanya pemberitahuan terlebih dahulu. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Organizer has the right to change or add other terms in the </span></em><strong><em>Terms &amp; Conditions</em></strong><em><span style="font-weight: 400;"> without prior notification.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p></ol></p><p><h4>&nbsp;</h4></p><p><h4><strong><br /></strong><strong>BATASAN UMUR</strong><span style="font-weight: 400;">&nbsp;<br /></span><strong>AGE RESTRICTIONS</strong><span style="font-weight: 400;">&nbsp;</span></h4></p><p><h4><span style="font-weight: 400;">&nbsp;</span><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;">Anak di bawah usia 7 tahun tidak diperbolehkan,&nbsp;tidak diperkenankan memasuki area acara, meskipun didampingi oleh orang tua/wali dan telah memiliki tiket yang berlaku.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Children under of 7 Children old are strictly not permitted to enter, even if accompanied by a parent/guardian and holding a valid ticket.</span></em><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;">&nbsp;</span></h4></p><p><h4><strong>LAYANAN KEBUTUHAN KHUSUS<br /></strong><strong>SPECIAL NEED SERVICE</strong><strong><br /><br /></strong></h4></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Terdapat kuota dalam jumlah terbatas untuk tempat duduk yang dapat diakses dengan kursi roda. Untuk mendapatkan otorisasi pemesanan tempat duduk ini, Anda diwajibkan untuk melampirkan Surat Keterangan Dokter yang berasal dari institusi yang sah, baik klinik maupun rumah sakit beserta surat pernyataan yang ditandatangani suami/istri/keluarga/wali diatas materai. Penyelenggara Acara hanya menerima Surat Keterangan Dokter yang berasal dari institusi yang sah. Mohon kirimkan file dalam bentuk PDF ke info@theflabbergast.com paling lambat tanggal </span><strong>16 September 2026</strong><span style="font-weight: 400;"> dengan subjek ''Special Needs Service (Tiffany Young: Edge of Calm Tour in Jakarta) - Full Name'' </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Wheelchair accessible seating will be available in limited quantities. To get your booking authorized, you must present your medical certificate from a legitimate institution and physician as proof of disability along with a stamped Letter of Statement signed by a spouse/family member/guardian. The Promoter only accepts legitimate medical certificates issued by a medical professional or institution. Please send the files in PDF format to info@theflabbergast.com by </span></em><strong><em>16 September</em></strong> <strong><em>2026</em></strong><em><span style="font-weight: 400;"> with the subject ''Special Needs Service </span></em><strong><em>(Tiffany Young: Edge of Calm Tour in Jakarta) - Full Name''</em></strong></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pengguna kursi roda atau individu dengan disabilitas hanya dapat membeli tiket di kategori VIP. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Wheelchair users or individuals with disabilities will only be able to purchase tickets in VIP.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Bagi ibu hamil wajib membawa surat rekomendasi dari dokter dan surat izin / surat pernyataan dari suami/anggota keluarga.</span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Pregnant women are required to bring a doctor&rsquo;s recommendation letter with a stamped permit along with a Letter of Statement from their husband/family member.</span></em><em><span style="font-weight: 400;"><br /></span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Surat Pernyataan dibutuhkan pihak Promotor sebagai jaminan bahwa penonton yang bersangkutan dalam keadaan sehat dan bisa mengikuti acara.&nbsp; </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">A statement letter is required by the Promoter as a guarantee that the audience concerned is in good health and able to attend the event. </span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pemilik tiket dengan kondisi memiliki penyakit berat seperti gangguan jantung, tekanan darah rendah dan yang lainnya tidak diperbolehkan untuk menghadiri acara/konser. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Attendees with serious medical conditions such as heart problems, low blood pressure, and others are not allowed to attend the event/concert.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pertunjukan ini menampilkan efek lampu flash dan pencahayaan intens, serta suara yang sangat keras yang dapat menyebabkan gangguan atau ketidaknyamanan bagi sebagian penonton. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">This show contains bright and intense flashing lights, as well as extremely loud sounds that may cause disturbance or discomfort to some audiences.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penonton menerima bahwa mereka mempunyai kewajiban untuk memastikan keselamatan mereka sendiri, dengan mempertimbangkan kondisi medis pribadi apa pun. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Attendees accept they have a duty to take reasonable steps to ensure their own safety, considering any personal medical conditions.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p></ol></p><p><h4><span style="font-weight: 400;">&nbsp;</span></h4></p><p><h4><strong>KEBIJAKAN TIDAK KELUAR MASUK</strong><span style="font-weight: 400;">&nbsp;<br /></span><strong>NO RE-ENTRY POLICY</strong></h4></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tidak diperbolehkan untuk masuk kembali setelah keluar dari area venue acara. Harap diingat bahwa memasuki area konser atau event hanya satu kali (tidak berulang), apapun tiket kelas yang telah dibeli.</span> <span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">No re-entry is allowed for this event. Please keep in mind that re-entry is not allowed to the concert or event area, regardless of your ticket category. Once you enter the venue, you cannot leave and enter again.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara acara berhak melarang untuk masuk ke lokasi penyelenggaraan acara apabila wristband dengan barcode diketahui telah digunakan untuk pengunjung lainnya. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter reserves the right to prohibit entry to the venue for a valid wristband that contains a previously scanned barcode.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p></ol></p><p><h4><br /><br /><br /></h4></p><p><h4><strong>KEBIJAKAN UMUM<br /></strong><strong>GENERAL POLICIES</strong></h4></p><p><ol></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Setiap Pemegang Tiket yang datang ke area acara bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya sendiri. Para Penyelenggara/Manajemen tidak bertanggung jawab untuk, termasuk namun tidak terbatas pada cedera atau kerusakan yang mungkin terjadi kepada Pemegang Tiket selama atau di dalam acara tersebut. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Every event attendee is responsible for their own safety, health, and personal security. The Promoter and/or Management are not responsible for, including but not limited to, any injury or damage that may occur to the event attendee within event premises or before/during/after the event.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tidak diperkenankan menginap di venue acara. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Waiting in line overnight is prohibited.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penonton diharapkan mengantri dengan tertib dan sopan. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The attendees are expected to line up in an orderly manner and show respect to others in the line.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Demi keamanan dan kenyamanan, dilarang membawa koper, tas punggung (backpack) serta tas berukuran besar lainnya ke area konser. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">For safety and convenience, it is prohibited to bring luggage, backpacks, as well other oversized bags to the concert area.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pembeli membebaskan penyelenggara acara dan tidak akan mengajukan tuntutan hukum apapun apabila acara/pertunjukan dibatalkan semata-mata karena sebab keputusan sepihak dari artis, pemerintah, ataupun sebab-sebab lain yang berada di luar dari kemampuan dan kehendak dari penyelenggara acara. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Purchaser hereby agrees to release the Promoter from legal claims through the courts or any means permitted by law in the event of cancellation of a concert that was made unilaterally by the artist or the government or other causes beyond capacity and will of the Promoter.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Jika terjadi pembatalan konser, maka Tiket akan dikembalikan sesuai dengan ketentuan Penyelenggara. Pengembalian harga Tiket tidak termasuk Biaya Platform, Biaya Lainnya dan Biaya pribadi Pembeli Tiket (contoh biaya perjalanan, biaya akomodasi,dll). </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">In the event of a cancelled concert, tickets will be refunded in accordance with the provisions of the Promoter. Refunds do not include Platform Fee, Convenience Fee, and/or any other personal costs of the Ticket Buyer (e.g. travel expenses, accommodation expenses, etc).</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tiket dijual secara langsung dari penyelenggara ke Pembeli Tiket. Setiap tiket yang dibeli oleh pelaku usaha atau pedagang tiket dengan tujuan untuk penjualan kembali Tiket dan/atau keperluan pemasaran adalah melanggar Syarat &amp; Ketentuan penjualan Tiket ini sehingga dapat dianggap menjadi tidak sah dan dibatalkan. Tiket yang dibeli dari website pihak ketiga dan reseller yang tidak sah menjadi tanggung jawab pribadi dan risiko dari Pembeli Tiket. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Ticket(s) are sold by the Promoter directly to the Ticket Buyer. Any Ticket(s) purchased by Business or traders for the purpose of Ticket Resales and/or Marketing is a breach of these Terms &amp; Conditions and hence may be considered invalid and can be nullified. Tickets purchased from third-party websites and unauthorized resellers are at the sole risk and responsibility of the Ticket Purchaser.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pihak Promotor berhak untuk melarang pengunjung untuk memasuki lokasi acara apabila pengunjung tidak memiliki tiket yang sah. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter has the right to prohibit visitors from entering the event location if visitors do not have a valid ticket.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Setiap upaya untuk memasuki acara tanpa tiket yang sah atau kredensial yang sah akan dikeluarkan dari area acara. Dalam kondisi tertentu orang yang demikian akan dilaporkan ke pihak kepolisian dan akan dituntut telah melakukan tindakan penyerobotan ataupun tindak kekerasan. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Any attempt to enter the event without a valid ticket or valid credentials will result in immediate removal from the event grounds. In certain cases, we will contact the police and press charges against the violators.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pihak Promotor berhak sewaktu-waktu untuk mengubah pengaturan denah dan penataan pengunjung di dalam lokasi acara tanpa pemberitahuan sebelumnya. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter reserves the right to change the layout and the seating of the audience in the event location without prior notice.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pemegang Tiket memberikan hak kepada pihak Penyelenggara acara untuk melakukan perekaman dan penggunaan video dan gambar untuk publisitas, promosi dan keperluan komersial lainnya yang berkaitan dengan konser</span> <strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><em><span style="font-weight: 400;">,</span></em><span style="font-weight: 400;"> di kemudian hari. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Ticket Holder grants the Promoter the right to record and use any video and picture for publicity, promotion or other commercial purposes related to </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta </em></strong><em><span style="font-weight: 400;">concert in future.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara acara memiliki hak untuk menolak masuk dan/atau mengeluarkan orang-orang yang tidak menaati syarat dan ketentuan acara beserta orang-orang yang dengan sengaja membuat kerusuhan/menimbulkan hal-hal yang merugikan satu pihak atau pihak lainnya tanpa diberikan pengembalian harga tiket.</span> <span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Promoter reserves the right to refuse admission to and/or evict Ticket Holders who do not abide by the Terms and Conditions of the event and/or </span></em><em><span style="font-weight: 400;">intentionally create situations that are detrimental to any involved party, at the sole discretion of the promoter. No refunds will be given.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara, panitia, pendukung dan artis tidak bertanggung jawab atas peristiwa kehilangan, pencurian, atau pengrusakan barang ataupun kecelakaan yang terjadi di area manapun di dalam lokasi acara pada saat penyelenggaraan acara dan karena sebab apapun. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The organizers, promoters, and artists cannot be held responsible for lost, stolen, or damaged possessions or accidents resulting in injury occurring anywhere in the venue during the event regardless of fault or reason.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pihak Promotor berhak melarang untuk masuk terhadap pengunjung manapun yang terindikasi sedang berada dalam keadaan mabuk karena alkohol atau secara jelas berada dibawah pengaruh obat-obatan terlarang. Siapapun yang ditemukan membawa barang-barang yang melanggar hukum akan dilaporkan kepada polisi, dilarang untuk memasuki lokasi acara, dan harga tiket tidak akan dikembalikan. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The Promoter reserves the right to prohibit entry to any individual suspected of being intoxicated due to alcohol or clearly under the influence of illegal substances. Anyone found in possession of illegal items will be reported to the authorities, denied entry to the event location, and will not be entitled to a refund for their ticket.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Penyelenggara acara menentang adanya SARA dan perundungan.</span> <span style="font-weight: 400;">Setiap peserta acara yang diketahui, atas kebijakan Promotor, menunjukkan perilaku ini dapat dikeluarkan dari acara tanpa diberikan pengembalian harga tiket. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Promoter does not permit any form of harassment and/or bullying. Any event attendee observed, at the sole discretion of the Promoter, to be exhibiting these behaviors may be removed from the event. No refunds will be given.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Dilarang melemparkan barang ke panggung, khususnya benda padat karena akan melukai artis yang melakukan pertunjukan acara. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Throwing objects onto the stage is strictly prohibited, especially solid items, as they may injure the performers / artist(s) during the event.</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Keselamatan dan keamanan Anda menjadi prioritas bagi penyelenggara. Anda memahami bahwa Anda dan barang bawaan Anda akan dikenai pemeriksaan pada saat masuk ke lokasi acara. Untuk memastikan proses masuk yang lancar dan aman bagi semua pengunjung, pemeriksaan keamanan akan dilakukan secara menyeluruh, termasuk inspeksi visual terhadap tas dan barang bawaan, pemeriksaan dengan metode bandara, detektor obat-obatan terlarang dan anjing pelacak (K-9). Jika Anda menolak untuk berpartisipasi dalam tindakan keamanan ini, kami dapat menolak Anda untuk masuk ke area acara. Penyelenggara berhak untuk meminta Anda meninggalkan acara jika perilaku Anda membahayakan keselamatan atau keamanan peserta acara lainnya tanpa menerima pengembalian uang tiket. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Your safety and security are a priority for the organizers. You acknowledge that you and your belongings will be subject to inspection upon entry to the event venue. To ensure a smooth and secure entry process for all attendees, comprehensive security checks will be conducted, including visual inspections of bags and belongings, Airport-style pat-down searches, electronic drug detection and K-9 screenings. Should you refuse to participate in these security procedures, we reserve the right to deny you entry to the event. The organizers also have the right to ask you to leave the event if your behavior poses a threat to the safety or security of other attendees, without any refund for your ticket.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Berikut adalah barang barang yang tidak diizinkan masuk ke dalam area acara. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">The following items are not permitted in the event area:</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><ul></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Makanan dan Minuman </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Food and Drinks</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Kamera Profesional, DSLR, Perekam, Kamera Polaroid, GoPro, Drone, DJI Camera, etc </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Professional Cameras, DSLR, Recorders, Polaroid Cameras, GoPro, Drone, DJI Camera, etc</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Ipad/Tablet </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Ipads/Tablets</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tongkat Selfie, Tripod, dll </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Selfie Sticks, Tripods, etc</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Tas dengan ukuran melebihi 20cm x 30cm (Tas Non-PVC diperbolehkan). Tidak disediakan tempat penitipan barang di lokasi acara. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Oversized Bags larger than 20 cm x 30 cm (Non PVC bag is allowed). There will be no lockers at the venue.</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Botol Minuman/Tumbler </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Water Bottles/Tumblers</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Parfum dan Kaleng aerosol </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Perfume and Aerosol Cans</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Bangku/Kursi </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Stools/Chairs</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Payung berukuran lebih dari 25cm dalam keadaan terlipat. </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Umbrellas that are larger than 25cm when folded</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Senter dan Penunjuk Laser </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Flashlights and Laser Pointers</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Spanduk, Bendera, dll yang berukuran lebih besar dari A4 </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Banners, Signs, Flags that are larger than A4 size, etc</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Senjata, Benda Tajam/ Benda Berbahaya Lainnya </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Weapons, Other sharp and/or dangerous objects</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Minuman Beralkohol dan obat-obatan terlarang / tanpa resep </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Alcoholic drinks and illegal/non-prescription drugs&nbsp;</span></em></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Rokok, Vape, Rokok Elektrik, dll </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Cigarettes, Vapes, E-cigarettes, etc</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Pemantik api dan barang yang mudah terbakar lainnya </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Lighters and other flammable items</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p><li style="font-weight: 400;"></p><p><h4><span style="font-weight: 400;">Alat yang dapat membuat kebisingan termasuk namun tidak terbatas pada terompet, peluit, dll </span><span style="font-weight: 400;"><br /></span><em><span style="font-weight: 400;">Noise makers including but not limited to air horns, whistles, etc</span></em><span style="font-weight: 400;">&nbsp;</span></h4></p><p></li></p><p></ul></p><p></ol></p><p><h4>&nbsp;</h4></p><p><h4><span style="font-weight: 400;">Dengan membeli tiket untuk </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><span style="font-weight: 400;">, maka Pembeli Tiket dan Pemegang Tiket setuju untuk menaati setiap dan seluruh Syarat dan Ketentuan acara yang ditetapkan dan berlaku dari waktu pembelian hingga acara selesai.<br /></span><em><span style="font-weight: 400;">By purchasing tickets to </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta</em></strong><em><span style="font-weight: 400;">, Ticket Buyers and Ticket Holders agree to comply with all Terms &amp; Conditions of the event that are valid from the time of purchase until the conclusion of the event.<br /><br /></span></em><span style="font-weight: 400;">Mohon cek akun Instagram kami </span><strong>@flabbergastproductions</strong><span style="font-weight: 400;"> secara berkala untuk informasi lebih lanjut seputar </span><strong>Tiffany Young: Edge of Calm Tour in Jakarta</strong><span style="font-weight: 400;">.<br /></span><em><span style="font-weight: 400;">Please check our Instagram account </span></em><strong><em>@flabbergastproductions</em></strong><em><span style="font-weight: 400;"> regularly for further updates about </span></em><strong><em>Tiffany Young: Edge of Calm Tour in Jakarta</em></strong><em><span style="font-weight: 400;">.<br /><br /></span></em><span style="font-weight: 400;">Presented by: EarendelWorks&nbsp;</span><span style="font-weight: 400;">&amp; Pacific Music Group</span><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;">Organized by: Flabbergast Productions<br /><br /></span><strong>Customer Service Info<br /></strong><span style="font-weight: 400;">For more information about ticket purchase, wheelchair accessible seating please contact:</span><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;"><br /></span><a href="http://loket.com"><strong>Loket.com</strong><strong><br /></strong></a><span style="font-weight: 400;">Phone:</span> <span style="font-weight: 400;">021-30003160</span><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;">Email: </span><span style="font-weight: 400;"><a href="mailto:support@loket.com">support@loket.com</a><br /><br /></span><strong>FLABBERGAST PRODUCTIONS<br /></strong><span style="font-weight: 400;">For Sponsorship, Marketing and any other enquiries, please email to :</span><span style="font-weight: 400;"><br /></span><span style="font-weight: 400;"><a href="mailto:info@theflabbergast.com&nbsp;">info@theflabbergast.com&nbsp;</a><br /></span><span style="font-weight: 400;">Instagram: </span><strong>@flabbergastproductions</strong></h4></p><p><h4><strong>Copyright</strong><strong><br /></strong><span style="font-weight: 400;">&copy; 2026 Flabbergast Productions. ALL RIGHTS RESERVED.</span></h4></p>' WHERE title = 'Tiffany Young: Edge of Calm Tour in Jakarta' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = '<ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Entry Pass yang valid adalah yang dibeli melalui artatix.co.id</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Pembayaran Hanya di Artatix. Tidak ada pembayaran melalui rekening pribadi. Jika membayar ke rekening lainnya, maka diluar tanggungjawab Panitia dan Promotor</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Setiap tiket berlaku untuk 1 (satu) orang dan tidak berlaku multiple entry (bolak balik) masuk ke area konser FEEL YOUR PAPUA (FYP).</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia dan Promotor tidak bertanggung jawab / tidak ada penggantian kerugian atas pembelian tiket acara melalui calo / tempat / kanal / platform yang bukan mitra resmi penjualan tiket</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Tiket yang hilang / dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan atau waktu lain.</span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Konser ini  tidak diperkenankan membawa balita. Usia menonton wajib diatas 10 tahun</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia / penyelenggara / promotor berhak untuk membatalkan dan atau merubah waktu acara dan atau tata letak tempat tanpa pemberitahuan sebelumnya.</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia / Penyelenggara / Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia acara / penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, dengan alasan apapun.</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Harap membawa kartu ID fisik dan asli (KTP) dan e-Ticket dari artatix.co.id pada saat melakukan penukaran tiket.</span></li><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Kami menyarankan agar para penonton menggunakan transportasi online</span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.</span></li><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Melarang penonton masuk ke area konser jika Entry Pass yang digunakan tidak valid.</span></li><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Panitia menyediakan lounge area 21+ dari ZONATION bagi penonton yang ingin santai merokok dengan suasana yang menyenangkan</span></li><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Memproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.</span></li><li value="18" class="dark:text-white"><span style="white-space: pre-wrap;">Penyelenggara dapat mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari area konser jika tidak mematuhi protokol kesehatan yang telah diterapkan.</span></li><li value="19" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang boleh dibawa ke dalam venue:</span></li><li value="20" class="dark:text-white pl-5 mt-2 space-y-1 list-inside"><ol class="w-full space-y-1 text-gray-900 list-inside dark:text-white"><li value="1" class="dark:text-white"><span style="white-space: pre-wrap;">Kartu identitas, dompet dan uang pribadi</span></li><li value="2" class="dark:text-white"><span style="white-space: pre-wrap;">Bukti tiket / tanda masuk</span></li><li value="3" class="dark:text-white"><span style="white-space: pre-wrap;">Handbag</span></li><li value="4" class="dark:text-white"><span style="white-space: pre-wrap;">Masker dan hand sanitizer</span></li><li value="5" class="dark:text-white"><span style="white-space: pre-wrap;">Obat-obatan pribadi</span></li><li value="6" class="dark:text-white"><span style="white-space: pre-wrap;">Jas hujan </span></li><li value="7" class="dark:text-white"><span style="white-space: pre-wrap;">Handphone / perangkat lainnya</span></li><li value="8" class="dark:text-white"><span style="white-space: pre-wrap;">Barang yang tidak diperbolehkan dibawa ke dalam area konser:</span></li><li value="9" class="dark:text-white"><span style="white-space: pre-wrap;">Atribut / bendera / identitas dari kelompok sepak bola, politik, ras dan agama.</span></li><li value="10" class="dark:text-white"><span style="white-space: pre-wrap;">Makanan dan minuman dari luar ke dalam area konser.</span></li><li value="11" class="dark:text-white"><span style="white-space: pre-wrap;">Kamera profesional seperti Drone, SLR, DSLR dsb.</span></li><li value="12" class="dark:text-white"><span style="white-space: pre-wrap;">Tongsis atau Selfie Stick.</span></li><li value="13" class="dark:text-white"><span style="white-space: pre-wrap;">Payung.</span><br><span style="white-space: pre-wrap;">Minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya. </span></li><li value="14" class="dark:text-white"><span style="white-space: pre-wrap;">Senjata tajam / api, bahan peledak, dan benda-benda berbahaya lainnya yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</span></li><li value="15" class="dark:text-white"><span style="white-space: pre-wrap;">Cairan dan benda yang mudah terbakar.</span></li><li value="16" class="dark:text-white"><span style="white-space: pre-wrap;">Tas atau ransel berukuran besar.</span></li><li value="17" class="dark:text-white"><span style="white-space: pre-wrap;">Laser dan pointer.</span></li></ol></li><li value="20" class="dark:text-white"><span style="white-space: pre-wrap;">Barang berbahaya yang dapat membahayakan orang lain maupun diri sendiri dalam bentuk apapun yang belum disebutkan pada peraturan diatas.</span></li><li value="21" class="dark:text-white"><span style="white-space: pre-wrap;">Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</span></li><li value="22" class="dark:text-white"><span style="white-space: pre-wrap;">Dilarang membuat kerusuhan dalam situasi apapun di dalam area konser. </span></li></ol><p class="mb-2 relative" style="text-align: start;"><b><strong class="font-bold" style="white-space: pre-wrap;">SAYA TELAH MEMBACA DAN MEMAHAMI SYARAT DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN ENTRY PASS DI ATAS. DAN JIKA ADA PERUBAHAN ATURAN PROMOTOR, AKAN SEGERA DIINFORMASIKAN DI AKUN MEDIA SOSIAL PROMOTOR</strong></b></p>' WHERE title = 'FEEL YOUR PAPUA - SORONG' AND venue = 'TBA';
UPDATE events SET terms_conditions = '<p>Dengan membeli tiket show<strong> PutBal Comedy Show</strong>, Pembeli telah menyetujui semua Syarat dan Ketentuan yang berlaku. Segala bentuk pelanggaran atas ketentuan dari pihak Penyelenggara akan ditindak secara tegas.</p><p><br></p><p><strong>KETENTUAN UMUM</strong></p><p><br></p><p><br></p><ul><li class="ql-align-justify">Tiket offline hanya dapat dibeli melalui website loket.com. Tiket dapat digunakan untuk masuk ke area <strong>“PutBal Comedy Show"</strong></li><li class="ql-align-justify">Semua harga belum termasuk Pajak Hiburan Daerah 10% dan belum termasuk Biaya Admin 2.22% dan biaya lainnya.</li><li class="ql-align-justify">Mohon siapkan data diri lengkap (nama sesuai identitas, nomor identitas, email & nomor HP) sebelum melakukan pembelian tiket.</li><li class="ql-align-justify">1 (satu) transaksi bisa beli maksimal 1 (satu) tiket wajib dengan data diri yang berbeda.</li><li class="ql-align-justify">Tiket berlaku untuk 1 (satu) orang Pemegang Tiket, untuk 1 (satu) kali masuk ke area acara.</li><li class="ql-align-justify">Nama sesuai dengan kartu identitas yang sah bersifat wajib untuk membeli tiket show "PutBal Comedy Show". Pastikan Anda melakukan pembelian Tiket dengan menggunakan data Anda yang sah dan benar (Kartu Identitas/KK/KTP/SIM/Paspor). Tiket Anda tidak dapat diubah dan/atau dimodifikasi setelah pembelian sudah dilakukan.</li><li class="ql-align-justify">Tiket dijual secara langsung oleh Promotor ke konsumen. Tiket apapun yang dibeli oleh pelaku usaha atau pedagang yang melanggar Syarat & Ketentuan penjualan tiket akan dibatalkan. Dengan menerima syarat dan ketentuan ini, Anda mengkonfirmasi bahwa Anda adalah konsumen.</li><li class="ql-align-justify">Tiket tidak dapat digunakan untuk keperluan komersial, termasuk namun tidak terbatas kepada hadiah, kompetisi, kontes, atau undian. Tiket yang dijual atau digunakan dengan melanggar persyaratan ini dapat dibatalkan tanpa pengembalian dana, dan Pemegang Tiket akan ditolak masuk ke dalam area acara tanpa terkecuali. Penyelenggara tidak bertanggung jawab atas kelalaian Pembeli Tiket yang mengakibatkan Tiket jatuh ke tangan orang lain dan dipergunakan sebagai tanda masuk, sehingga menghilangkan hak Pembeli Tiket untuk masuk ke area acara.</li><li class="ql-align-justify">Semua penjualan Tiket adalah final. Tiket yang telah terjual tidak dapat ditukar dan tidak dapat diuangkan kembali. </li><li class="ql-align-justify">Tiket tidak dapat dipindahtangankan dengan alasan apapun.</li></ul><p class="ql-align-justify"><br></p><p><strong>BATASAN UMUR</strong></p><p><br></p><ul><li class="ql-align-justify">Identitas (dengan foto) resmi yang dianggap berlaku adalah Kartu Tanda Penduduk bagi Warga Negara Indonesia, Surat Izin Mengemudi, Paspor, Kartu Pelajar/Mahasiswa, dan Kartu Identitas dari Negara asal bagi Warga Negara Asing.</li><li class="ql-align-justify">Pembeli tiket wajib berusia minimal 15 (lima belas) tahun.</li></ul><p class="ql-align-justify"><br></p><p><strong>INFORMASI PENONTON</strong></p><p><br></p><ul><li class="ql-align-justify">Tidak ada penitipan barang.</li><li class="ql-align-justify">Pihak Penyelenggara berhak untuk tidak mengizinkan penonton masuk ke area show apabila melanggar dari ketentuan ini.</li><li class="ql-align-justify">Pihak Penyelenggara berhak untuk menuntut secara hukum terhadap siapapun yang mendapatkan tiket dengan cara yang tidak sah, termasuk namun tidak terbatas pada penggandaan tiket ataupun dengan cara lain mendapatkan tiket tidak sesuai dengan ketentuan yang telah ditetapkan oleh penyelenggara show.</li><li class="ql-align-justify">Penyelenggara show tidak bertanggung jawab atas kelalaian pembeli tiket yang menyebabkan tiket yang telah dibeli jatuh ke tangan orang lain (atau berada dalam penguasaan orang lain) yang kemudian digunakan sebagai tanda masuk yang sah ke lokasi show.</li><li class="ql-align-justify">Pembeli membebaskan penyelenggara show dan tidak akan mengajukan tuntutan hukum apapun apabila show/pertunjukan dibatalkan semata – mata karena sebab keputusan sepihak dari artis, pemerintah, ataupun sebab – sebab lain yang berada di luar dari kemampuan dan kehendak dari penyelenggara show.</li><li class="ql-align-justify">Apabila show/pertunjukan dibatalkan, tiket akan dibayarkan kembali menurut ketentuan penyelenggara show. Biaya – biaya lain (yang dibebankan kepada pembeli melalui kartu kredit) tidak termasuk sebagai harga tiket yang akan dibayarkan kembali.</li><li class="ql-align-justify">Penyelenggara show berhak untuk melarang pengunjung untuk memasuki lokasi show apabila pengunjung tidak memiliki tiket yang sah.</li><li class="ql-align-justify">Penyelenggara show berhak mengeluarkan pengunjung dari lokasi show apabila dipandang perlu untuk alasan keamanan, kenyamanan pengunjung lainnya, serta demi menjamin kelancaran penyelenggaraan show.</li><li class="ql-align-justify">Dalam keadaan tertentu, area – area tertentu di dalam lokasi show dapat menjadi area terlarang untuk dimasuki penonton.</li><li class="ql-align-justify">Penyelenggara, panitia, dan artis tidak bertanggung jawab atas kompensasi dan/atau biaya tambahan apapun yang timbul akibat adanya pembatalan ataupun penundaan show.</li><li class="ql-align-justify">Penonton yang tidak berperilaku tertib, membuat keonaran ataupun berperilaku tidak patut, dan penonton yang menolak untuk mematuhi perintah/peringatan dari panitia show akan dikeluarkan dari lokasi show tanpa diberikan pengembalian harga tiket.</li><li class="ql-align-justify">Setiap orang yang berusaha untuk memasuki lokasi show tanpa tiket yang sah akan dikeluarkan dari lokasi show. Dalam kondisi tertentu orang yang demikian akan dilaporkan ke pihak kepolisian dan akan dituntut telah melakukan tindakan penyerobotan ataupun tindak kekerasan.</li><li class="ql-align-justify">Penyelenggara, panitia pendukung dan artis tidak bertanggung jawab atas peristiwa kehilangan, pencurian, atau pengrusakan barang ataupun kecelakaan yang terjadi di area manapun di dalam lokasi show pada saat penyelenggaraan show dan karena sebab apapun.</li><li class="ql-align-justify">Penyelenggara berhak melarang untuk masuk terhadap pengunjung manapun yang terindikasi sedang berada dalam keadaan mabuk, secara jelas berada dibawah pengaruh obat – obatan terlarang. Siapapun yang ditemukan membawa barang – barang yang melanggar hukum akan dilaporkan kepada polisi, dilarang untuk memasuki lokasi show, dan harga tiket tidak akan dikembalikan.</li><li class="ql-align-justify">Penyelenggara tidak akan menggunakan atau menyebarluaskan data/informasi tentang pribadi pengunjung yang diberikan saat membeli tiket tanpa persetujuan pengunjung terlebih dahulu.</li><li class="ql-align-justify">Penonton yang telah dikeluarkan atau keluar dari lokasi show tidak diperkenankan untuk masuk kembali ke lokasi show.</li><li class="ql-align-justify">Untuk alasan keselamatan, Penyelenggara/Promotor memiliki hak untuk menunda, membatalkan, atau menghentikan jalannya show; menahan Pengunjung untuk tetap berada di lokasi show untuk sementara waktu hingga show berakhir; mengevakuasi sebagian atau keseluruhan Pengunjung dari lokasi show dan juga berhak menolak Pengunjung untuk masuk ke lokasi show meskipun telah memiliki tiket masuk yang sah tanpa ada kompensasi apapun kepada Pengunjung.</li><li class="ql-align-justify">Penyelenggara berhak sewaktu-waktu untuk mengubah pengaturan denah dan penataan penempatan pengunjung di dalam lokasi show.</li><li class="ql-align-justify">Penyelenggara memiliki hak untuk mengubah ataupun menambahkan syarat lain pada Syarat & Ketentuan tanpa adanya pemberitahuan terlebih dahulu.</li><li class="ql-align-justify">Penonton dilarang untuk mempublikasikan video show hasil rekaman pribadi. Penyelenggara berhak melakukan penarikan video yang melanggar ketentuan.</li><li class="ql-align-justify">Show diharapkan dapat berlangsung nyaman dan dapat dinikmati.</li></ul><p class="ql-align-justify"><br></p><p class="ql-align-justify"><strong>BARANG-BARANG DILARANG</strong></p><p class="ql-align-justify"><br></p><ul><li class="ql-align-justify">Dilarang membawa makanan dan minuman dari luar ke lokasi show.</li><li class="ql-align-justify">Dilarang membawa kamera profesional dan semi-profesional / SLR / DSLR.</li><li class="ql-align-justify">Dilarang melakukan aktivitas perekaman dan transmisi selama show berlangsung. </li><li class="ql-align-justify">Dilarang membawa kamera dengan lensa yang dapat dilepas, kamera video, alat perekam, dan kamera aksi. Dilarang menggunakan flash untuk fotografi.</li><li class="ql-align-justify">Dilarang berjualan di dalam lokasi show.</li><li class="ql-align-justify">Dilarang menyebarkan pamflet, atau brosur apapun tanpa persetujuan dari Penyelenggara.</li><li class="ql-align-justify">Dilarang membawa senjata dalam bentuk apapun.</li><li class="ql-align-justify">Dilarang membawa narkoba atau obat – obatan terlarang.</li><li class="ql-align-justify">Dilarang membawa alat yang dapat mengeluarkan sinar laser.</li><li class="ql-align-justify">Dilarang membawa tongkat yang terbuat dari besi maupun kayu.</li><li class="ql-align-justify">Dilarang membawa binatang dan hewan peliharaan.</li><li class="ql-align-justify">Dilarang membawa botol kaca.</li><li class="ql-align-justify">Dilarang membawa botol air berisi cairan apapun (botol harus dalam keadaan kosong).</li><li class="ql-align-justify">Dilarang membawa tripod atau monopod (tongsis) untuk kamera.</li><li class="ql-align-justify">Dilarang membawa bahan peledak atau mudah meledak.</li><li class="ql-align-justify">Dilarang membawa pisau atau benda tajam lainnya.</li><li class="ql-align-justify">Dilarang membawa barang yang mudah terbakar atau produk dalam kaleng aerosol.</li><li class="ql-align-justify">Dilarang membawa kursi.</li><li class="ql-align-justify">Dilarang membawa benda apapun yang dapat digunakan untuk merusak ketertiban, membahayakan keselamatan pengunjung, dan/atau menimbulkan kerusakan pada manusia ataupun barang, berdasarkan keputusan mutlak dari panitia show.</li></ul><p><br></p>' WHERE title = 'Putbal Comedy Show' AND venue = 'DKI Jakarta';
UPDATE events SET terms_conditions = '<p><strong>Ticket Purchase & Ownership</strong></p><p>- Tickets are strictly non-refundable under any circumstances, unless the event is canceled by the organizer.</p><p>- Tickets are non-transferable. The buyer''s name on the e-ticket must match the original Identity Card (ID Card/Passport) presented during registration at the Four Seasons.</p><p>- This event is exclusively for guests aged 21 and above.</p><p>- Seat allocation is based on the order of registration.</p><p><br></p><p><strong>Event Access & Code of Conduct</strong></p><p>- To maintain an intimate atmosphere, guests are expected to arrive on time. Latecomers arriving during the Q&A session or the main event may be asked to wait outside the area until a suitable break.</p><p>- Offside Corp reserves the full right to refuse entry or remove any guest who causes a disturbance or behaves inappropriately, without any compensation. Any form of behavior that violates applicable laws will be handed over to the authorities.</p><p><br></p><p><strong>Photo & Signing Session</strong></p><p>- Professional cameras (DSLR/Mirrorless with telephoto lenses) or lighting equipment are strictly prohibited. Official documentation will be provided by the organizer. The use of smartphone cameras is allowed.</p><p>- Guests are required to follow the instructions of the staff and security personnel during the photo and signing session to ensure the comfort of Park Ji-Sung and Patrice Evra.</p><p>- The organizer reserves the right to use documentation taken during the event for publication purposes.</p><p><br></p><p><strong>Force Majeure & Cancellation</strong></p><p>- In the event of Force Majeure (natural disasters, pandemics, security crises, or sudden international travel restrictions), the organizer reserves the right to postpone or cancel the event.</p>' WHERE title = 'Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND venue = 'Jakarta Selatan';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<p><strong>Hillsong Worship Nights Asia Tour Surabaya</strong><br></p>

			<p><strong>Kapan dan di mana acara akan diadakan?</strong></p>

			<ul><li><span style="color:#000000;"><em>Hillsong Worship Nights Asia Tour Surabaya akan diadakan pada 11 September 2026 di Graha Unesa, Surabaya.</em></span></li>
			</ul><p><strong>Kapan dan di mana penjualan tiket dimulai?</strong></p>

			<ul><li><span style="color:#000000;"><em>26 Juni 2026 mulai pukul 11.59 WIB</em></span></li>
				<li><span style="color:#000000;"><em>Tiket dapat dibeli melalui hillsongworshipsby.com dan juga melalui website loket.com</em></span></li>
				<li><span style="color:#000000;"><em>Mohon untuk tidak membeli tiket dari pihak lain selain outlet resmi yang disebutkan di atas. Pihak promotor tidak bertanggung jawab atas segala bentuk penipuan terkait tiket yang dibeli dari sumber tidak resmi</em>.</span></li>
			</ul><p><strong>Berapa jumlah maksimal tiket yang bisa dibeli per transaksi?</strong></p>

			<ul><li><span style="color:#000000;"><em>Maksimal 8 tiket per transaksi.</em></span></li>
			</ul><p><strong>Apakah saya bisa memilih nomor kursi untuk kategori VIP, Platinum, Gold, dan Silver?</strong></p>

			<ul><li><span style="color:#000000;"><em>Tidak. Nomor kursi akan ditentukan secara otomatis oleh sistem berdasarkan tanggal dan waktu pembelian tiket. Nomor Kursi akan tersedia di e-ticket anda paling lambat 5 hari sebelum acara.</em></span></li>
			</ul><p><strong>Apakah kategori Festival akan mendapatkan nomor antrian?</strong></p>

			<ul><li><span style="color:#000000;"><em>Tidak. Kategori Festival adalah free standing dan tidak memiliki nomor antrean.</em></span></li>
			</ul><p><strong>Apakah saya harus mengisi data diri saat membeli tiket?</strong></p>

			<ul><li><span style="color:#000000;"><em>Ya. Anda perlu mengisi data pribadi sesuai kartu identitas untuk keperluan verifikasi saat penukaran tiket. Pastikan email dan kartu identitas masih aktif dan valid.</em></span></li>
			</ul><p><strong>Apakah saya bisa mengubah kategori tiket atau mengajukan refund?</strong></p>

			<ul><li><span style="color:#000000;"><em>Tidak. Semua tiket yang sudah dibeli tidak dapat diubah, ditukar, atau dikembalikan dalam kondisi apa pun.</em></span></li>
			</ul><p><strong>Apakah ada batasan usia untuk menonton konser ini?</strong></p>

			<ul><li><span style="color:#000000;"><em>Tidak ada.</em></span></li>
				<li><span style="color:#000000;"><em>Anak usia di atas 4 tahun wajib memiliki tiket dan harus didampingi orang tua/wali.</em></span></li>
				<li><span style="color:#000000;"><em>Anak usia di bawah 4 tahun boleh masuk tanpa tiket jika dipangku. Jika ingin duduk sendiri, maka wajib membeli tiket. Kategori Festival tidak disarankan untuk anak-anak.</em></span></li>
			</ul><p><strong>Bagaimana ketentuan pembelian tiket untuk pengguna kursi roda/disabilitas?</strong></p>

			<ul><li><span style="color:#000000;"><em>Akses untuk pengguna kursi roda tersedia di kategori Festival, dengan jumlah terbatas.</em></span></li>
				<li><span style="color:#000000;"><em>Pemesanan hanya dapat dilakukan melalui offline ticketing (WhatsApp: 0815 1187 3767).</em></span></li>
			</ul><p><strong>Kapan saya akan menerima tiketnya?</strong></p>

			<ul><li><span style="color:#000000;"><em>Setelah pembayaran berhasil, Anda akan menerima e-ticket melalui email yang terdaftar.</em></span></li>
				<li><span style="color:#000000;"><em>E-tiket dan Nomor Kursi (Seat Number) akan dikirim ke email yang terdaftar 5 (lima) hari sebelum acara.</em></span></li>
				<li><span style="color:#000000;"><em>Mohon berikan waktu untuk pengiriman email. Mohon periksa juga folder junk/spam bila email tidak muncul di inbox.</em></span></li>
			</ul><p><strong>Saya tidak menemukan email konfirmasi pembayaran. Apa yang harus saya lakukan?</strong></p>

			<ul><li><span style="color:#000000;"><em>Mohon periksa folder spam/junk terlebih dahulu. Jika masih tidak ditemukan, silakan hubungi Loket.com<br>
				Telephone : 021-30003160 ; Email : suppport@loket.com</em></span></li>
			</ul><p><strong>Kapan dan di mana penukaran tiket akan dilakukan?</strong></p>

			<ul><li><span style="color:#000000;"><em>Informasi lengkap mengenai penukaran tiket akan diumumkan melalui akun Instagram @ColorAsiaLive dan @OtelloAsia menjelang hari H konser.</em></span></li>
			</ul><p><strong>For more information:</strong></p>

			<ul><li><span style="color:#000000;"><em>Visit hillsongworshipsby.com</em></span></li>
			</ul></td>
		</tr></tbody></table>' WHERE title = 'Hillsong Worship Nights Asia Tour Surabaya' AND venue = 'Graha Unesa Surabaya, Kota Surabaya';
UPDATE events SET terms_conditions = '<p>SYARAT & KETENTUAN</p><p><br></p><p>1. Tiket berlaku untuk STASHEDTHEJAZZ REUNION — ONCE UPON A JAZZ Vol. 02 pada Jumat, 11 September 2026 di SunBreeze Hotel, Senayan Jakarta.</p><p><br></p><p>2. Setiap tiket berlaku untuk 1 (satu) orang dan memberikan akses ke area acara serta tempat duduk sesuai kategori tiket yang dibeli.</p><p><br></p><p>3. Tiket sudah termasuk F&B Voucher sebesar Rp100.000. Voucher diberikan dalam bentuk voucher fisik pada saat proses check-in/registrasi di lokasi acara dan dapat digunakan di SunBreeze sesuai ketentuan yang berlaku pada saat acara.</p><p><br></p><p>4. Tiket yang telah dibeli bersifat non-refundable dan tidak dapat dikembalikan, kecuali apabila acara dibatalkan oleh penyelenggara.</p><p><br></p><p>5. Apabila terjadi perubahan jadwal atau ketentuan pelaksanaan acara, penyelenggara akan memberikan informasi kepada pemegang tiket melalui kanal komunikasi resmi.</p><p><br></p><p>6. Tiket wajib ditunjukkan dalam bentuk e-ticket yang valid pada saat proses check-in/registrasi di lokasi acara.</p><p><br></p><p>7. Satu tiket hanya dapat digunakan untuk satu kali akses. Tiket yang telah digunakan tidak dapat digunakan kembali.</p><p><br></p><p>8. Tiket tidak dapat diperjualbelikan kembali tanpa persetujuan penyelenggara.</p><p><br></p><p>9. Penyelenggara berhak menolak akses apabila tiket terbukti tidak valid, telah digunakan sebelumnya, atau diperoleh melalui transaksi yang tidak sah.</p><p><br></p><p>10. Penyelenggara berhak melakukan penyesuaian terhadap tata letak tempat duduk, area acara, dan susunan teknis acara apabila diperlukan untuk kelancaran dan keamanan acara.</p><p><br></p><p>11. Pengunjung wajib mengikuti peraturan dan ketentuan yang berlaku di area SunBreeze Hotel selama acara berlangsung.</p><p><br></p><p>12. Dengan melakukan pembelian tiket, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.</p>' WHERE title = 'StashedTheJazz Reunion' AND venue = 'Sunbreeze Hotel, Jakarta Selatan';
UPDATE events SET terms_conditions = '<h1>Edu Concert 2026</h1><h2><em>Our Musical Journey</em></h2><h2><br></h2><p>Melalui <strong>Edu Concert: Our Musical Journey</strong>, kami mengundang seluruh keluarga, sahabat, alumni, dan masyarakat untuk menjadi bagian dari perjalanan musikal ini serta memberikan apresiasi kepada generasi muda yang terus berkarya, belajar, dan menginspirasi melalui musik.</p>' WHERE title = 'EDU CONCERT "Our Musical Journey"' AND venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya';
UPDATE events SET terms_conditions = '<p>SYARAT DAN KETENTUAN TIKET:</p><p>1. Tiket dapat dibeli melalui laman loket.com</p><p>2. Pembelian tiket selain melalui loket.com TIDAK MENJADI TANGGUNG JAWAB PROMOTOR & segala risiko yang timbul menjadi tanggung jawab pembeli tiket,</p><p>3. Usia dibawah atau sama dengan 5 tahun WAJIB didampingi oleh orang tua/wali,</p><p>4. Anak dengan usia mulai 5 tahun wajib membeli tiket</p><p>5. Harga sudah termasuk pajak.</p><p>6. Pada saat proses pembelian tiket, pastikan mengisi data SESUAI dengan identitas diri,</p><p>7. Tiket yang sudah dibeli TIDAK dapat dikembalikan (NO REFUND, NO DOWNGRADE, NO UPGRADE),</p><p>8. QR code pada e-tiket baru akan MUNCUL pada periode waktu penukaran tiket</p><p>9. QR code pada e-tiket hanya dapat di-scan sebanyak satu kali.</p><p>10. Gelang tiket digunakan untuk Single Entry (sekali masuk)</p>' WHERE title = 'SARVIVAL EVENT' AND venue = 'SMAN 7 Purworejo, Kab. Purworejo';
UPDATE events SET terms_conditions = '<table class="toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td style="width:100%">
			<div class="editable__" spellcheck="false">
			<ol><li>Tiket yang sah adalah yang dibeli melalui chanel resmi yang ditunjuk oleh penyelenggara</li>
				<li>Satu tiket berlaku untuk satu orang, dan satu kali masuk area venue.</li>
				<li>Pembeli tiket minimal berusia 12 (dua belas) tahun ke atas. Penonton dibawah usia 12 (dua belas) tahun tidak diperbolehkan memasuki area venue <b>RUANG RAYA - KARAWANG</b>.</li>
				<li>Ibu Hamil tidak disarankan memasuki area venue <strong>RUANG RAYA - KARAWANG</strong>.</li>
				<li>Harap membawa kartu identitas asli dan tiket (e-voucher) dari Loket.com pada saat memasuki lokasi acara.</li>
				<li>Maksimum pembelian tiket adalah 4 (empat) tiket dalam 1 (satu) kali transaksi.</li>
				<li>Setiap tiket akan dipersonalisasikan dengan terteranya nama pengunjung di tiket. Nama yang sudah diregistrasikan di tiket tidak dapat diubah. Mohon pastikan bahwa nama lengkap dan nomor kartu indentitas Anda sesuai dengan kartu identitas yang dikeluarkan pemerintah dengan foto yang valid (kartu tanda penduduk apapun/KTP) dengan benar saat mengisi informasi Anda untuk e-ticket Anda.</li>
				<li>Dilarang keras untuk menjual kembali tiket yang sudah dibeli. Semua komponen tiket akan dicabut jika dijual kembali. Harga tiket sudah termasuk pajak pemerintah & biaya admin.</li>
				<li>Tiket yang sudah dibeli tidak dapat dikembalikan dan non-refundable.</li>
				<li>Promotor berhak untuk:
				<ul><li>Melarang penonton masuk jika tiket telah digunakan oleh orang lain.</li>
					<li>Melarang penonton masuk ke area event <b>RUANG RAYA - KARAWANG</b> jika tiket yang digunakan tidak valid.</li>
					<li>Memproses atau mengajukan hukum, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan tiket secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan tiket yang sah atau memperoleh tiket dengan cara yang tidak sesuai prosedur.</li>
					<li>Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket merupakan tanggung jawab pembeli.</li>
				</ul></li>
				<li><b>RUANG RAYA - KARAWANG</b> adalah acara yang diselenggarakan dengan menerapkan protokol kesehatan yang ketat sesuai standar CHSE (Cleanliness, Health, Safety, Environment Sustainability).</li>
				<li>Pihak penyelenggara menindak tegas, dan berhak mengeluarkan pengunjung apabila tidak mematuhi protokol kesehatan yang telah diterapkan.</li>
				<li>Jika terjadi pembatalan acara, maka uang tiket akan dikembalikan sesuai dengan ketentuan penyelenggara. Biaya administrasi tiket, convenient fee yang dibebankan kepada pembeli dengan kartu kredit atau biaya pribadi (contoh biaya perjalanan, biaya akomodasi, dll) tidak akan dikembalikan.</li>
				<li>Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.</li>
				<li>Panitia/penyelenggara/promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.</li>
				<li>Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.</li>
				<li>Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke Lokasi event <b>RUANG RAYA - KARAWANG</b>.</li>
				<li>Barang yang boleh dibawa kedalam event <b>RUANG RAYA - KARAWANG </b>:
				<ul><li>Membawa kartu identitas dan uang pribadi.</li>
					<li>Membawa bukti tiket/tanda masuk</li>
					<li>Membawa obat-obatan pribadi</li>
					<li>Membawa jas hujan</li>
					<li>Membawa handphone / perangkat pribadi lainnya.</li>
				</ul></li>
				<li>Barang yang <b>TIDAK DIPERBOLEHKAN</b> dibawa kedalam event <b>RUANG RAYA - KARAWANG</b> :
				<ul><li>Dilarang membawa makanan dan minuman dari luar ke dalam venue <b>RUANG RAYA - KARAWANG</b>.</li>
					<li>Dilarang membawa kamera profesional seperti Drone, SLR, DSLR, Action Camera, dan sejenisnya.</li>
					<li>Dilarang membawa Tongsis atau Selfie Stick, Tripod dan sejenisnya.</li>
					<li>Dilarang membawa Parfum >100ml.</li>
					<li>Dilarang membawa Payung</li>
					<li>Dilarang membawa minuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.</li>
					<li>Dilarang membawa senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.</li>
					<li>Dilarang membawa cairan dan benda yang mudah terbakar.</li>
					<li>Dilarang membawa tas atau ransel berukuran besar.</li>
					<li>Dilarang membawa kursi lipat atau sejenisnya.</li>
					<li>Dilarang membawa laser dan pointer.</li>
					<li>Dilarang membawa rokok, vape, pods, rokok elektrik dan lain sejenisnya</li>
					<li>Dilarang membawa hewan peliharaan</li>
					<li>Dilarang membawa barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.</li>
				</ul></li>
				<li>Dianjurkan untuk membawa tempat minum atau tempat makan pribadi untuk mengurangi sampah dari wadah sekali pakai.</li>
				<li>Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.</li>
				<li>Dilarang membuat kerusuhan atau mengganggu kenyamanan antar penonton dalam situasi apapun di dalam area event <b>RUANG RAYA - KARAWANG</b>.</li>
				<li>Segala syarat dan ketentuan mengenai tiket merupakan kebijakan penyelenggara yang tidak dapat diganggu gugat.</li>
				<li>Pembelian tiket ini secara otomatis menyatakan bahwa pembeli telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku.</li>
			</ol><p>SAYA TELAH MEMBACA DAN MEMAHAMI PERSYARATAN DAN KETENTUAN PEMBELIAN DAN PENGGUNAAN TIKET MASUK YANG TERTERA DI ATAS. SAYA MENYETUJUI DAN MEMBERIKAN IZIN.<br>
			UNTUK TERKAIT SECARA SAH DENGAN PERSYARATAN DAN KETENTUAN TERSEBUT.<br>WWW.LOKET.COM +6221-30003160 @LOKET</p>
			</div>
			</td>
		</tr></tbody></table>' WHERE title = 'RUANG RAYA - KARAWANG' AND venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang';
UPDATE events SET terms_conditions = '<h2>1. Pembelian Tiket</h2><ul><li>Setiap tiket hanya berlaku untuk satu orang dan satu kali masuk.</li><li>Pastikan data yang Anda masukkan saat pembelian sudah benar. Kesalahan data yang disebabkan oleh pembeli menjadi tanggung jawab pembeli.</li><li>Tiket hanya dapat dibeli melalui kanal penjualan resmi yang telah ditentukan oleh penyelenggara.</li></ul><h2>2. Tiket dan Masuk ke Venue</h2><ul><li>E-ticket atau tiket fisik wajib ditunjukkan saat memasuki area konser.</li><li>Penyelenggara berhak meminta identitas diri untuk proses verifikasi apabila diperlukan.</li><li>Tiket yang hilang, rusak, atau telah digunakan tidak dapat diganti.</li></ul><h2>3. Pengembalian Dana (Refund)</h2><ul><li>Seluruh pembelian tiket bersifat final dan tidak dapat dibatalkan maupun ditukar.</li><li>Refund hanya akan diproses apabila konser dibatalkan oleh penyelenggara sesuai dengan kebijakan yang berlaku.</li><li>Apabila konser ditunda, tiket tetap berlaku untuk jadwal terbaru, kecuali penyelenggara mengumumkan kebijakan lain.</li></ul><p><br></p>' WHERE title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur';
UPDATE events SET terms_conditions = '<p><strong>SYARAT & KETENTUAN</strong></p><p><br></p><ol><li>Tiket yang telah dibeli tidak dapat dikembalikan (non-refundable), kecuali apabila acara dibatalkan oleh pihak penyelenggara.</li><li>Satu tiket berlaku untuk satu orang dan hanya dapat digunakan untuk satu kali masuk. Pastikan data pembelian sudah benar sebelum menyelesaikan transaksi.</li><li>E-ticket wajib ditunjukkan saat memasuki venue. Penyelenggara berhak menolak tiket yang tidak valid, telah digunakan sebelumnya, digandakan, atau diperoleh melalui pihak yang tidak resmi.</li><li>Penonton wajib mengikuti seluruh peraturan yang berlaku di venue dan menjaga ketertiban selama acara berlangsung. Penyelenggara berhak mengeluarkan penonton yang mengganggu keamanan, kenyamanan, atau jalannya pertunjukan.</li><li>Dilarang membawa senjata, obat-obatan terlarang, benda berbahaya, minuman beralkohol, serta barang lain yang dapat membahayakan diri sendiri maupun orang lain ke dalam area acara.</li><li>Penyelenggara tidak bertanggung jawab atas kehilangan atau kerusakan barang pribadi selama berada di area acara.</li><li>Dokumentasi berupa foto dan/atau video dapat dilakukan selama acara berlangsung untuk keperluan dokumentasi dan publikasi. Dengan menghadiri acara, penonton dianggap menyetujui penggunaan dokumentasi tersebut.</li><li>Informasi mengenai perubahan teknis, jadwal, tata cara masuk, atau ketentuan acara akan disampaikan melalui kanal komunikasi resmi penyelenggara.</li></ol><p>Dengan melakukan pembelian tiket, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.</p>' WHERE title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND venue = 'Berbagi Ruang, Kota Denpasar';
UPDATE events SET terms_conditions = '<p><strong>1. Ketentuan Umum</strong></p><ul><li>Tiket WARIA FEST (Warga Berpesta Ria) Vol. 2 berlaku untuk acara pada <strong>19 September 2026</strong>.</li><li>Tiket yang telah dibeli merupakan bukti hak masuk ke area acara dan wajib ditunjukkan pada saat melakukan registrasi/penukaran tiket.</li><li>Satu tiket berlaku untuk <strong>1 orang</strong>.</li><li>Tiket yang sudah dibeli <strong>tidak dapat dikembalikan (refund)</strong>, kecuali apabila acara dibatalkan oleh pihak penyelenggara.</li></ul><p><br></p><p><strong>2. Ketentuan Masuk</strong></p><ul><li>Pengunjung wajib menunjukkan tiket/QR Code yang valid kepada petugas saat memasuki area acara.</li><li>QR Code tiket hanya dapat digunakan <strong>satu kali</strong>.</li><li>Pengunjung wajib menjaga tiket dan QR Code agar tidak disalahgunakan oleh pihak lain.</li><li>Pihak penyelenggara berhak menolak akses masuk apabila tiket terbukti tidak valid, telah digunakan sebelumnya, atau diperoleh melalui cara yang tidak sah.</li><li>Pengunjung wajib mengikuti proses pemeriksaan/registrasi yang ditetapkan oleh panitia.</li></ul><p><br></p><p><strong>3. Ketentuan Selama Acara</strong></p><ul><li>Pengunjung wajib menjaga ketertiban, keamanan, kebersihan, dan kenyamanan selama acara berlangsung.</li><li>Dilarang melakukan tindakan yang dapat mengganggu atau membahayakan pengunjung lain.</li><li>Pengunjung wajib mengikuti seluruh peraturan dan arahan dari panitia serta petugas keamanan.</li><li>Dilarang membawa barang-barang yang dapat membahayakan diri sendiri maupun orang lain.</li><li>Dilarang melakukan tindakan kekerasan, keributan, atau tindakan lain yang mengganggu jalannya acara.</li><li>Pengunjung bertanggung jawab atas barang pribadi masing-masing. Penyelenggara tidak bertanggung jawab atas kehilangan atau kerusakan barang pribadi.</li></ul><p><br></p><p><strong>4. Dokumentasi</strong></p><ul><li>Dengan membeli dan menggunakan tiket, pengunjung menyetujui bahwa selama acara berlangsung dapat dilakukan pengambilan foto, video, atau dokumentasi lainnya untuk keperluan dokumentasi dan publikasi acara.</li><li>Pengunjung tidak dapat menuntut penyelenggara atas penggunaan dokumentasi tersebut selama digunakan untuk kepentingan publikasi acara secara wajar.</li></ul><p><br></p><p><strong>5. Pembatalan & Perubahan Acara</strong></p><ul><li>Penyelenggara berhak melakukan perubahan terhadap susunan acara, penampil, waktu, maupun teknis pelaksanaan apabila diperlukan.</li><li>Apabila terjadi perubahan atau pembatalan acara karena keadaan di luar kendali penyelenggara, informasi akan disampaikan melalui kanal komunikasi resmi penyelenggara.</li><li>Ketentuan refund apabila terjadi pembatalan akan mengikuti kebijakan penyelenggara dan platform penjualan tiket.</li></ul><p><br></p><p><strong>6. Penutup</strong></p><ul><li>Dengan melakukan pembelian tiket, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku.</li><li>Penyelenggara berhak mengambil tindakan terhadap pengunjung yang melanggar ketentuan acara, termasuk meminta pengunjung meninggalkan area acara tanpa pengembalian biaya tiket.</li></ul><p><br></p>' WHERE title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<p style="margin-left:3.2pt;"><strong>Dengan membeli tiket Suara Guntur, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh syarat & ketentuan berikut:</strong><br><br><strong>A.INFORMASI UMUM</strong></p>

			<div>
			<ol><li>Suara Guntur adalah sebuah event activation dari program Nalarraya yang mengharapkan adanya pariwisata keberlanjutan dengan insan pariwisata yang peduli terhadap lingkungan dengan kemasan Konser Interaktif dan Proaktif yang berlangsung selama 2 hari :
				<ul><li>Tanggal 19 - 20 September 2026</li>
					<li>Lokasi : Edu Wisata Gunung Guntur Garut</li>
				</ul></li>
				<li>Tiket berlaku sesuai tanggal yang tertera pada tiket (Day 1, Day 2, atau 2-Days Pass No Camp, Camp Fest 1 atau Camp Fest 2).</li>
				<li><span style="color:#FF0000;"><strong>Tiket hanya berlaku untuk 1 orang</strong></span></li>
			</ol><p><strong>B.JENIS TIKET</strong></p>

			<ol><li><strong>Tiket Reguler Day 1 (Konser Suara Buana) :</strong><br>
				Tiket yang didalamnya mendapatkan fasilitas di hari pertama (All Activities Day-1, Tiket Edu Wisata, Konser Suara buana, Talk Show Guntur Talk''s (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan)</li>
				<li><strong>Tiket Regular Day 2 (Konser Suara Pagi Buta) :</strong><br>
				Tiket yang didalamnya mendapatkan fasilitas di hari kedua (All Activities Day-2, Tiket Edu Wisata, Konser Suara Pagi Buta, Yoga/Meditasi, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan), Penanaman Pohon & Pemasangan Rambu Mitigasi Bencana)</li>
				<li><strong>Tiket 2 Days Pass No Camp :</strong><br>
				Tiket yang didalamnya mendapatkan semua fasilitas dua hari full tanpa menginap/kemping. (All Activities 2 days, Tiket Edu Wisata, Konser Sound Of Welness, Talk Show; Guntur Talk''s (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Yoga/Meditasi, Penanaman Pohon & Pemasangan Rambu Mitigasi Bencana, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan)</li>
				<li><strong>Tiket Camp Fest 2 :</strong><br>
				Tiket yang didalamnya mendapatkan semua fasilitas dua hari full dengan menginap dan hanya disediakan lapak untuk mendirikan tenda. (Lapak Tenda uk. maksimal kaps.4, All Activities 2 days, Tiket Edu Wisata, Konser Sound Of Welness, Talk Show; Guntur Talk''s (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Yoga/Meditasi, Penenaman Pohon & Pemasangan Rambu Mitigasi Bencana, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan)</li>
				<li><strong>Tiket Camp Fest 1 :</strong><br>
				Tiket yang didalamnya mendapatkan semua fasilitas dua hari full dengan menginap dan disediakan tenda outdoor kaps.2 atau kaps.4 (Tenda uk. Kaps 2 bisa request kaps jika pembelian dilakukan secara group minimal 3 orang, All Activities 2 days, Tiket Edu Wisata, Konser Sound Of Welness, Talk Show; Guntur Talks (Konservasi, Mitigasi, Mindfullness, Revolusi Meja Makan dan Hutan Sosial), Yoga/Meditasi, Penanaman Pohon & Pemasangan Rambu Mitigasi Bencana, Program Mindfullness eating (Makan bersama : Makan Malam/Sarapan).</li>
			</ol><p><strong>C.PEMBELIAN DAN KEABSAHAN TIKET</strong></p>
			</div>

			<div>
			<ol><li>Tiket resmi hanya berlaku jika dibeli melalui saluran/sistem penjualan resmi yang ditunjuk oleh penyelenggara.</li>
				<li>Harga yang tertera sudah termasuk tarif layanan platform loket.com</li>
				<li>Satu e-ticket/QR code hanya berlaku untuk 1 (satu) orang dan 1 (satu) kali pemindaian (<strong><em>entry</em></strong>).</li>
				<li>Tiket yang sudah dibeli <strong>tidak dapat dikembalikan</strong><strong> (</strong><strong><em>non-refundable</em>) </strong>atau diuangkan kembali dengan alasan apa pun, kecuali acara dibatalkan secara resmi oleh penyelenggara.</li>
			</ol><p><strong>D.PENUKARAN E-TICKET & GELANG (WRISTBAND)</strong></p>

			<ol><li>Setiap e-ticket wajib ditukarkan dengan gelang resmi (wristband) sebelum memasuki area Suara Guntur di Edu Wisata Gunung Guntur.</li>
				<li>Penukaran dilakukan di area ticket box yang telah disediakan oleh penyelenggara.</li>
				<li>Ticket box akan dibuka pada hari pelaksanaan (Day-1) mulai pukul 09.00 WIB.</li>
				<li>Ticket box Day-2 akan dibuka pada pagi hari pelaksanaan (Day-2) mulai pukul 04.00 WIB.</li>
				<li>Pengunjung diwajibkan membawa:
				<ul><li>E-ticket yang valid (digital atau cetak)</li>
					<li>Identitas diri (KTP/SIM/Paspor) yang sesuai dengan data pembelian</li>
					<li>Gelang yang telah dipasang tidak boleh dilepas selama acara berlangsung</li>
				</ul></li>
				<li>Gelang yang hilang, rusak, atau dilepas dianggap tidak berlaku dan tidak dapat diganti dengan alasan apapun.</li>
			</ol><p><strong>E.USIA DAN KEAMANAN</strong></p>

			<ol><li>Pengunjung berusia di bawah 18 tahun wajib didampingi orang tua/wali.</li>
				<li>Pengunjung bertanggung jawab atas keamanan barang pribadi masing-masing.</li>
				<li>Penyelenggara tidak bertanggung jawab atas kehilangan atau kerusakan barang.</li>
				<li>Penonton usia diatas 6th wajib melakukan pembelian tiket</li>
			</ol><p><strong>F.KETENTUAN BARANG</strong></p>

			<ol><li>Dilarang membawa:
				<ul><li>Senjata tajam / api</li>
					<li>Narkotika & obat terlarang</li>
					<li>Makanan & minuman dari luar (Kecuali kebutuhan makanan di Camp)</li>
					<li>Minuman beralkohol</li>
					<li>Kamera profesional & alat rekam tanpa izin</li>
					<li>Drone</li>
					<li>Barang berbahaya lainnya</li>
					<li>Barang yang tidak reusable atau sekali pakai</li>
					<li>Membawa peliharaan</li>
				</ul></li>
				<li>Petugas berhak melakukan pemeriksaan saat masuk area acara.</li>
				<li>Dianjurkan Memakai barang :
				<ul><li>Botol minum tidak sekali pakai (Reusable)</li>
					<li>Alat makan tidak sekali pakai</li>
				</ul></li>
			</ol><p><strong>G.FORCE MAJEURE</strong></p>

			<ol><li>Acara dapat ditunda atau dibatalkan akibat kondisi di luar kendali (force majeure), termasuk:
				<ul><li>Bencana alam</li>
					<li>Cuaca ekstrem</li>
					<li>Kebijakan pemerintah</li>
					<li>Situasi keamanan</li>
				</ul></li>
				<li>Mekanisme pengembalian dana akan diinformasikan melalui platform resmi Suara Guntur jika terjadi pembatalan acara</li>
			</ol><p><strong>H.DOKUMENTASI DAN PUBLIKASI</strong></p>
			</div>

			<ol><li>Dengan hadir, pengunjung menyetujui bahwa:
				<ul><li>Foto, video, dan rekaman selama acara dapat digunakan oleh penyelenggara untuk keperluan dokumentasi dan promosi.</li>
					<li>Pengunjung tidak berhak menuntut kompensasi atas penggunaan tersebut.</li>
				</ul></li>
			</ol></td>
		</tr></tbody></table>' WHERE title = 'SUARA GUNTUR (The Sound Of Wellness)' AND venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut';
UPDATE events SET terms_conditions = '<h1>TERMS & CONDITIONS</h1><p><strong>GUTS Bali × Worship Nite Project — Tour-gether: Bali</strong></p><p><strong>25 September 2026 | Superclub Atlas, Canggu, Bali</strong></p><p><br></p><p><strong>Ticket Purchase</strong></p><ul><li class="ql-indent-1">By purchasing a ticket, you agree to all Terms & Conditions applicable to this event.</li><li class="ql-indent-1">Each ticket is valid for <strong>one (1) person</strong> only.</li><li class="ql-indent-1">Tickets must be purchased through the official ticketing platform and/or authorized sales channels.</li><li class="ql-indent-1">Please ensure that all information provided during the ticket purchase process is accurate.</li></ul><p><strong>Ticket Validity</strong></p><ul><li class="ql-indent-1">Each ticket is valid only for the event date stated on the ticket.</li><li class="ql-indent-1">Tickets may not be duplicated, reproduced, or resold without prior authorization from the Organizer.</li><li class="ql-indent-1">The Organizer reserves the right to refuse admission for invalid, duplicated, or unauthorized tickets.</li></ul><p><strong>Refund & Cancellation</strong></p><ul><li class="ql-indent-1">All tickets purchased are <strong>non-refundable and non-transferable</strong>, except where otherwise determined by the Organizer.</li><li class="ql-indent-1">In the event of cancellation or postponement, further information regarding ticket validity, refunds, or rescheduling will be announced through the Organizer’s official channels.</li></ul><p><strong>Event Entry</strong></p><ul><li class="ql-indent-1">Attendees must present a valid ticket/QR code upon arrival for verification and entry.</li><li class="ql-indent-1">The Organizer reserves the right to conduct security checks before allowing entry.</li><li class="ql-indent-1">Attendees must comply with the venue’s rules and regulations at all times.</li><li class="ql-indent-1">The Organizer reserves the right to deny entry or remove any attendee who violates the event or venue regulations.</li></ul><p><strong>Age Requirement</strong></p><ul><li class="ql-indent-1">This event is open to attendees aged <strong>15 years and above</strong>.</li><li class="ql-indent-1">Attendees may be required to present a valid identification document for age verification.</li><li class="ql-indent-1">The Organizer reserves the right to refuse entry if the attendee does not meet the applicable age requirement.</li></ul><p><strong>Prohibited Items & Conduct</strong></p><ul><li class="ql-indent-1">Attendees are prohibited from bringing items that are not permitted by the venue or Organizer.</li><li class="ql-indent-1">Any form of violence, harassment, discrimination, illegal activity, or disruptive behavior is strictly prohibited.</li><li class="ql-indent-1">Attendees who violate these rules may be removed from the event without refund.</li></ul><p><strong>Personal Belongings</strong></p><ul><li class="ql-indent-1">Attendees are responsible for their own personal belongings.</li><li class="ql-indent-1">The Organizer and venue are not responsible for any loss, damage, or theft of personal belongings during the event.</li></ul><p><strong>Documentation & Media</strong></p><ul><li class="ql-indent-1">By attending the event, you acknowledge that photography, video, and other forms of documentation may be taken during the event.</li><li class="ql-indent-1">Such materials may be used by the Organizer for documentation, promotional, and social media purposes.</li></ul><p><strong>Organizer''s Rights</strong></p><ul><li>The Organizer reserves the right to make decisions necessary for the safety, security, and smooth operation of the event.</li><li>The Organizer reserves the right to update these Terms & Conditions when necessary. Any material updates will be communicated through the official event channels.</li></ul><ol><li><strong>Agreement</strong></li></ol><ul><li>By purchasing a ticket and/or attending the event, you confirm that you have read, understood, and agreed to these Terms & Conditions.</li></ul><p><strong>GUTS Bali × Worship Nite Project</strong></p><p><strong>Tour-gether: Bali</strong></p><p><strong>Revival is Here.</strong></p>' WHERE title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND venue = 'Atlas Super Club, Kab. Badung';
UPDATE events SET terms_conditions = '<table class="toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td style="width:50%">
			<div class="editable__">
			<p><strong>TERMS AND CONDITIONS TICKETING PESTAPORA 2026</strong><br>
			&nbsp;</p>
			<meta charset="utf-8"><p dir="ltr">Dengan membeli tiket, anda telah mengerti, menyetujui dan bersedia mematuhi seluruh syarat dan ketentuan selama&nbsp;<strong>Pestapora 2026</strong> berlangsung yang telah ditentukan pihak penyelenggara. Untuk pengalaman terbaik di&nbsp;<strong>Pestapora 2026</strong>, harap perhatikan hal-hal berikut:<br><i><span style="color:#0000FF;">By purchasing a ticket, you understand, agree and comply with all terms and protocols for the event arranged by the organiser.&nbsp;For the best experience at&nbsp;<strong>Pestapora 2026</strong>, please take note of the following:</span></i><br><br>
			Tiket Presale adalah kategori tiket keluaran ketiga terbitan Pestapora 2026. Tiket ini dapat berlaku untuk tiga (3) hari yakni 25, 26, 27 September 2026 dan bebas masuk di waktu kapanpun ke area Pestapora sebelum close gate.<br><i><span style="color:#0000FF;">Presale Tickets are the third ticket category issued by Pestapora 2026. These tickets can be valid for three (3) days, namely 25, 26, 27 September 2026 and are free to enter at any time to the Pestapora area before the gate closes.</span></i><br><br><strong><u>PEMBELIAN DAN PENGUMPULAN TIKET:</u></strong><br><span style="color:#0000FF;"><i><strong><u>TICKET PURCHASE AND COLLECTION:</u></strong></i></span></p>

			<ol><li aria-level="1" dir="ltr">Tiket resmi hanya dapat dibeli dan didapatkan melalui loket.com. Pembelian tiket selain dari official ticketing partner, penyelenggara tidak menjamin keaslian tiket. Pihak penyelenggara tidak bertanggung jawab atas segala penipuan tiket yang dibeli melalui pihak lain.<br><span style="color:#0000FF;"><i>Tickets can only be purchased and collected through loket.com. By purchasing tickets from unauthorised sellers or other parties, buyers take on the risk that the validity of the tickets cannot be guaranteed, with no refunds possible.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Tiket tidak boleh dijual dialihkan untuk tujuan komersil. Untuk tujuan promosi, kontes, undian, kegiatan amal atau kegiatan lain tanpa persetujuan tertulis sebelumnya dari pihak penyelenggara. Setiap tiket yang melanggar peraturan ini akan dicabut dan dinyatakan tidak berlaku, dan pelakunya akan dianggap sebagai pelanggar Pestapora. Penjualan kembali dapat menjadi lisensi penyelenggara untuk membatalkan tiket.<br><span style="color:#0000FF;"><i>Tickets may not be sold, transferred or used for any form of commercial or trade purposes, including but not limited to promotions, contests, commercial or advertising purposes, housing, hotels, vacation rentals, sweepstakes, charitable gifts or other activities without the prior written consent of the organiser. Sponsorship activities, on-site marketing, sample giving, vending, distribution of coupons/products, or other promotional activities may not be carried out at the event (including in the parking lot), without prior written approval from the organiser in each activity. Any tickets used in violation of these terms will be revoked and void, and the bearer will be deemed a violator at the event. The resale or attempted resale of tickets may be grounds for licence termination and ticket cancellation.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pihak Penyelenggara akan mengambil langkah hukum terhadap siapa pun yang memperoleh tiket dengan cara ilegal, tidak terbatas pada, penggandaan tiket atau metode lain yang melanggar ketentuan yang telah ditetapkan oleh penyelenggara Pestapora.<br><span style="color:#0000FF;"><i>The Organizer will take legal action against anyone who obtains tickets through illegal means, including ticket duplication or any other methods that violate the terms set by the event organizer.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pembelian tiket presale di Loket<i>&nbsp;</i>maksimal sejumlah 4 (empat) tiket per transaksi melalui 1 akun.<br><span style="color:#0000FF;"><i>Limited to only 4 presale tickets per transaction with 1 account.&nbsp;</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pembelian tiket presale<i>&nbsp;</i>di Aplikasi BRImo<i>&nbsp;</i>maksimal sejumlah 2 (dua) tiket per transaksi melalui 1 akun.<br><i><span style="color:#0000FF;">Limited to only 2 presale tickets per transaction with 1 account in BRImo Application.</span></i><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">1 tiket hanya berlaku untuk 1 orang untuk 1 kali masuk setiap harinya sesuai dengan kategori dan tanggal tiket yang dibeli.&nbsp;<br><span style="color:#0000FF;"><i>1 (one) ticket is valid for 1 (one) person and 1 (one) time entrance only per day and/or depending upon ticket category purchased.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penyelenggara Pestapora tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan tiket jatuh ke tangan atau berada dalam penguasaan orang lain, yang kemudian digunakan sebagai tanda masuk resmi ke lokasi Pestapora.<br><span style="color:#0000FF;"><i>The Pestapora organizer is not responsible for the ticket buyer''s negligence that results in the ticket falling into the hands or possession of another person, who then uses it as valid entry to the event venue.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pembeli tiket memberikan hak kepada penyelenggara (dan yang ditunjuknya) untuk memasukan gambar, rupa, tindakan dan pernyataan anda dalam audio, video, film, webcast, streaming, atau transmisi, pameran, siaran simulcast atau reproduksi lainnya yang dibuat secara langsung atau direkam, atau di Pestapora dalam media atau konteks apapun untuk tujuan apapun. Termasuk untuk tujuan komersial atau promosi tanpa izin lebih lanjut atau sebaliknya serta bahwa anda tidak berhak atas pembayaran, kompensasi, atau kredit dalam bentuk apapun terkait dengan hal tersebut.<br><span style="color:#0000FF;"><i>The ticket purchaser grants the organiser the right (and its designees) to include your images, forms, actions and statements in audio, video, film, webcast, streaming or transmission, exhibition, simulcast broadcast or other reproduction made live or recorded, or in events in any media or context for any purpose, including commercial or promotional purposes without further permission or otherwise and that you are not entitled to any payment, compensation or credit of any kind in connection therewith.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Dengan memiliki tiket, penonton memahami dan menerima risiko pribadi selama Pestapora berlangsung. Penyelenggara tidak bertanggung jawab atas cedera maupun kehilangan, kerusakan, atau pencurian barang pribadi.<br><span style="color:#0000FF;"><i>Ticket holders assume all risk of injury and all responsibility for property loss, destruction or theft and release the promoters, performers, sponsors, ticket outlets, venues, and their employees from any liability thereafter.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penyelenggara berhak membatasi orang untuk masuk ke area tertentu&thinsp;untuk pertimbangan keamanan dan keselamatan.<br><span style="color:#0000FF;"><i>The organizer reserves the right to restrict people from entering certain areas</i>&nbsp;<i>for security and safety considerations.</i></span></li>
			</ol><p dir="ltr"><strong>KEBIJAKAN PEMBELIAN TIKET ANAK-ANAK:</strong><br><i><strong><span style="color:#0000FF;">CHILD POLICY:</span></strong></i></p>

			<ol start="11"><li aria-level="1" dir="ltr">Anak-anak berusia mulai dari 6 tahun ke atas diharuskan membeli tiket masuk.<br><span style="color:#0000FF;"><i>Children aged 6 years old and above will be required to purchase a ticket for admission.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Terdapat fasilitas daycare bernama Pecapowa, untuk orang dewasa yang membawa anak.<br><span style="color:#0000FF;"><i>There are day care facilities by the name of Pecapowa for adults that bring children.&nbsp;</i></span><br>
				&nbsp;</li>
			</ol><p dir="ltr"><strong><u>E-TICKETS</u></strong></p>

			<ol start="13"><li aria-level="1" dir="ltr">Pembeli tiket akan menerima E-tiket, yang dapat dilihat di akun Loket.com atau melalui email yang dikirimkan. Harap membawa dan menunjukkan E-tiket saat penukaran tiket fisik berupa gelang (cukup berupa softcopy, tidak perlu dicetak kertas), dan menyertakan Identitas yang sama.<br><span style="color:#0000FF;"><i>The ticket purchaser</i><i> will opt for E-ticket(s), it may be retrieved from your Loket.com account or email. Please remember to bring and Pestapora the E-ticket(s) (</i><i>printing of e-vouchers is not necessary)&nbsp;</i><i>alongside a valid ID when exchanging E-ticket(s) with wristband(s).&nbsp;</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">E-Voucher&nbsp;bersifat rahasia dan bukan untuk dibagikan. Pembeli paham dan mengerti apabila dibagikan akan memiliki resiko e-voucher bisa berpindah tangan.<br><span style="color:#0000FF;"><i>E-vouchers are confidential and not to be shared. The buyer understands that sharing them carries the risk of the e-voucher changing hands.</i></span></li>
			</ol><p><br><strong><u>EXCHANGE &amp; REFUND POLICY</u></strong></p>

			<ol start="15"><li aria-level="1" dir="ltr">E-Voucher wajib ditukarkan dengan wristband selama periode penukaran<br><span style="color:#0000FF;"><i>The E-Voucher must be exchanged for a wristband during the designated exchange period.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Informasi mengenai penukaran wristband :<br>
				Waktu dan tempat penukaran wristband akan diinformasikan melalui media sosial resmi&nbsp;<strong>Pestapora</strong>.<br><span style="color:#0000FF;"><i>The time and location for wristband exchange will be announced through Pestapora&rsquo;s official social media channels.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Disarankan untuk menukarkan e-voucher sebelumnya untuk menghindari antrian pada saat hari konser.<br><span style="color:#0000FF;"><i>It is recommended to redeem the e-voucher beforehand to avoid queues on the day of the concert.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Jika terjadi pembatalan Pestapora, maka uang tiket akan&nbsp;<i>dikembalikan sesuai dengan ketentuan penyelenggara</i>. Biaya administrasi tiket, convenient fee pembayaran dengan kartu kredit / payment gateway lain, virtual account atau biaya pribadi lainnya (contoh biaya perjalanan, biaya akomodasi, dll) tidak akan dikembalikan.<br><span style="color:#0000FF;"><i>In the event of cancellation of the event, the ticket money will be refunded according to the provisions of the organiser. Ticket administration fees, convenience fees for payment by credit card, virtual account or other personal costs (e.g. travel expenses, accommodation fees, etc.) will not be refunded.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Tiket yang sudah dibeli tidak dapat ditukar atau dikembalikan.<br><span style="color:#0000FF;"><i>There is no refund, exchange, or cancellation once ticket(s) are sold.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Tiket Presale (dapat dipindahtangankan dengan syarat, membawa:)</li>
			</ol><ul><li aria-level="2" dir="ltr">KTP asli / digital pembeli tiket yang namanya teregistrasi oleh penyelenggara.</li>
				<li aria-level="2" dir="ltr">Surat Kuasa pemilik tiket yang namanya teregistrasi oleh penyelenggara (dalam hal diwakilkan) wajib ditandatangani di atas materai Rp 10.000 atau e-meterai asli dengan lambang PERURI.</li>
				<li aria-level="2" dir="ltr">Apabila pemindahan tiket dilakukan dalam lingkup satu keluarga. Maka Wajib melampirkan bukti berupa, salinan atau foto kartu keluarga.</li>
			</ul><p><br><span style="color:#0000FF;"><i>Presale Tickets can be transferred provided that you bring:<br>
			- Original / digital KTP of ticket buyers whose names are registered by the organizer.<br>
			- The Power of Attorney for the ticket owner whose name is registered with the organizer (if represented) must be signed on a Rp. 10,000 stamps or original e-stamp with the PERURI symbol.<br>
			- If ticket transfers are made within the same family, you must provide proof in the form of a copy or photo of the family card (kartu keluarga).</i></span></p>

			<p dir="ltr"><strong><u>EARLY ENTRY TICKETS</u></strong></p>

			<p dir="ltr">&#8288;Pembeli tiket early entry dapat memasuki area festival&nbsp;<strong>MAKSIMAL</strong> pukul 16.00 WIB.<br><i><span style="color:#0000FF;">Early entry ticket holders can get into the festival until 16:00 PM.</span></i></p>

			<p dir="ltr">Pemegang tiket early entry yang datang di atas pukul 16.00 WIB akan dikenakan biaya top-up sebesar Rp100.000-, dan akan langsung dibayarkan kepada panitia.<br><i><span style="color:#0000FF;">Early entry ticket holders who arrive after 16:00 PM will be charged an additional fee of IDR 100,000, which must be paid directly to Pestapora.</span></i><br><br><strong><u>SECURITY CHECKS AND ADMISSION RULES</u></strong></p>

			<ol start="21"><li aria-level="1" dir="ltr"><strong>Barang-barang yang dilarang:</strong></li>
			</ol><ul><li aria-level="2" dir="ltr">Makan &amp; minum dari luar.</li>
				<li aria-level="2" dir="ltr">Senjata tajam &amp; senjata api.</li>
				<li aria-level="2" dir="ltr">Tongsis/selfie stick.</li>
				<li aria-level="2" dir="ltr">Lensa kamera tele, perekam audio, dan eksternal flash.</li>
				<li aria-level="2" dir="ltr">Drone atau peralatan sejenisnya.</li>
				<li aria-level="2" dir="ltr">Obat-obatan terlarang atau zat adiktif lain.</li>
				<li aria-level="2" dir="ltr">Cartridge Vape dan Pod.</li>
				<li aria-level="2" dir="ltr">Liquid Vape dan Pod.</li>
				<li aria-level="2" dir="ltr">Flare dan benda lain yang dapat memicu kebakaran.</li>
				<li aria-level="2" dir="ltr">Laser pointer.</li>
				<li aria-level="2" dir="ltr">Barang dan Cairan yang mudah terbakar.</li>
				<li aria-level="2" dir="ltr">Terompet dan toa/megaphone.</li>
				<li aria-level="2" dir="ltr">Sepeda, skateboard, &amp; otoped.</li>
				<li aria-level="2" dir="ltr">Hewan peliharaan.</li>
				<li aria-level="2" dir="ltr">Atribut partai.</li>
				<li aria-level="2" dir="ltr">Kursi lipat. (dalam kondisi khusus, selama diizinkan oleh promotor)</li>
				<li aria-level="2" dir="ltr">Tumbler kaca.</li>
				<li aria-level="2" dir="ltr">Payung.</li>
			</ul><p dir="ltr"><span style="color:#0000FF;"><i><strong>The following will not be allowed into the venue:</strong></i></span></p>

			<ul><li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Food and drinks from outside.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Sharp objects and firearms.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Selfie sticks.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Telephoto camera lenses, audio recorders, and external flashes.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Drones or similar equipment.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Illegal drugs or other addictive substances.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Vapes and Pods Cartridge.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Liquid Vapes and Pods.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Flares and items that could start a fire.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Laser pointers.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Things and Flammable liquids.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Horns and megaphones.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Bicycles, skateboards, and scooters.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Pets.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Political Items.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Folding chairs. (under special conditions, as long as permitted by the promoter).</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Glass tumblers.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Umbrellas.</i></span><br>
				&nbsp;</li>
			</ul><ol start="22"><li aria-level="1" dir="ltr"><strong>Barang-barang di perbolehkan:</strong></li>
			</ol><ul><li aria-level="2" dir="ltr">Botol air, yang harus dikosongkan terlebih dahulu sebelum memasuki venue (tidak bermaterial kaca).</li>
				<li aria-level="2" dir="ltr">Parfum.</li>
				<li aria-level="2" dir="ltr">Kosmetik</li>
				<li aria-level="2" dir="ltr">Rokok yang masih tersegel.</li>
				<li aria-level="2" dir="ltr">Heatstick yang masih tersegel.</li>
				<li aria-level="2" dir="ltr">1 orang hanya diperbolehkan membawa 1 device rokok elektrik atau vape tanpa liquid tambahan.</li>
				<li aria-level="2" dir="ltr">Jas hujan.</li>
				<li aria-level="2" dir="ltr">Stroller anak &amp; Kursi Roda (sepanjang diizinkan oleh pihak penyelenggara).</li>
			</ul><p dir="ltr"><span style="color:#0000FF;"><i><strong>Allowed items into the venue:</strong></i></span></p>

			<ul><li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Water bottles, which must be emptied before entering the venue (no glass bottles).</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Perfume.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Cosmetics.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Sealed cigarettes.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Sealed heatstick.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>1 person is only allowed to bring 1 electronic cigarette or vape device without additional liquid</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Raincoats.</i></span></li>
				<li aria-level="1" dir="ltr"><span style="color:#0000FF;"><i>Child strollers &amp; wheelchairs (as long as permitted by the organizers).</i></span></li>
			</ul><p>&nbsp;</p>

			<p><strong><u>KETENTUAN AUDIO, PHOTOGRAPHY &amp; VIDEOGRAPHY</u></strong></p>

			<ul><li aria-level="2" dir="ltr">Kamera professional diperbolehkan selama tidak menggunakan lensa tele</li>
				<li aria-level="2" dir="ltr">Tongsis, tripod dan monopod tidak diperbolehkan.</li>
				<li aria-level="2" dir="ltr">Dilarang melakukan live streaming.</li>
				<li aria-level="2" dir="ltr">Dilarang menggunakan flash di moment yang ditentukan penyelenggara.</li>
				<li aria-level="2" dir="ltr">Dilarang merekam menggunakan drone.</li>
			</ul><p dir="ltr"><span style="color:#0000FF;"><i><strong>AUDIO, PHOTOGRAPHY &amp; VIDEOGRAPHY POLICY</strong></i></span></p>

			<ul><li aria-level="2" dir="ltr"><span style="color:#0000FF;"><i>Professional cameras are allowed as long as they don&rsquo;t use telephoto lenses.</i></span></li>
				<li aria-level="2" dir="ltr"><span style="color:#0000FF;"><i>No selfie sticks, tripods and monopods.</i></span></li>
				<li aria-level="2" dir="ltr"><span style="color:#0000FF;"><i>Live streaming of events is prohibited.</i></span></li>
				<li aria-level="2" dir="ltr"><span style="color:#0000FF;"><i>Camera flash may be prohibited at moments.&nbsp;</i></span></li>
				<li aria-level="2" dir="ltr"><span style="color:#0000FF;"><i>Drone may be prohibited at moments.&nbsp;</i></span><br>
				&nbsp;</li>
			</ul><ol start="23"><li aria-level="1" dir="ltr">Penyelenggara berhak menuntut kepada pengunjung yang mendokumentasikan penampil dan memonetisasi tanpa izin.<br><span style="color:#0000FF;"><i>The organizer has the right to take legal action against attendees who document the event performances and monetize them without proper authorization.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pengunjung dengan barang terlarang, akses masuknya akan ditolak, dan tiket akan dinyatakan hangus.<br><span style="color:#0000FF;"><i>Patrons with prohibited items will be denied entry, regardless of purchased ticket.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penyelenggara diberikan hak untuk menyita dan/atau memusnahkan seluruh barang/makanan/minuman/benda yang telah dilarang oleh penyelenggara. Apabila didapati berada di dalam area pertunjukan Pestapora<br><span style="color:#0000FF;"><i>The organizer is given the right to confiscate and/or destroy all goods/food/drinks/objects that have been prohibited by the organizer. If found inside the Pestapora performance area</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Dilarang berjualan di dalam area Pestapora.<br><span style="color:#0000FF;"><i>No selling inside the location of Pestapora.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pertunjukan ini menampilkan efek lampu flash dan pencahayaan intens, serta suara yang sangat keras yang dapat menyebabkan gangguan atau ketidaknyamanan bagi sebagian penonton.<br><span style="color:#0000FF;"><i>This show features flashing lights, intense lighting effects, and very loud sounds that may cause discomfort or disturbance to some audience members.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pemilik tiket memahami bahwa mereka memiliki kewajiban untuk mengambil langkah-langkah yang wajar untuk memastikan keselamatan mereka sendiri, dengan mempertimbangkan kondisi medis pribadi.<br><span style="color:#0000FF;"><i>Ticket holders understand that they are responsible for taking reasonable steps to ensure their own safety, taking into consideration their personal medical conditions.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pengunjung hanya diperbolehkan masuk dengan wristband yang digunakan dengan benar di pergelangan tangan.<br><span style="color:#0000FF;"><i>Admission to the Pestapora/venue by wristband properly worn.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penonton di dalam lokasi acara yang tidak mengenakan wristband yang sah akan dikeluarkan dari lokasi acara tanpa pengecualian.<br><span style="color:#0000FF;"><i>Attendees inside the event venue who are not wearing a valid wristband will be removed from the event venue without exception.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Barcode pada wristband akan dipindai oleh petugas saat memasuki venue Pestapora. Pihak penyelenggara berhak melarang masuknya siapa pun yang tidak mematuhi permintaan pemeriksaan keamanan. Termasuk: tidak menggunakan wristband dengan benar, barcode yang sudah terpindai atau dengan sengaja mengoper wristband.<br><span style="color:#0000FF;"><i>Barcode on the wristband will be scanned at the entry gate.We reserve the right to refuse entry to any person who does not comply with security check requests. Including: not properly worn wristband, barcodes that have been scanned or deliberately passing the wristband.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Berdasarkan pertimbangan yang wajar dan proporsional, penyelenggara Pestapora memiliki hak mutlak untuk mengeluarkan pengunjung dari lokasi Pestapora jika dianggap perlu demi alasan keamanan, kenyamanan pengunjung lain, dan kelancaran jalannya Pestapora.&nbsp;<br><span style="color:#0000FF;"><i>Based on reasonable and proportional considerations, the Pestapora organizers have the absolute right to remove visitors from the Pestapora location if deemed necessary for reasons of security, the comfort of other visitors, and the smooth running of the Pestapora.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penonton yang bertindak tidak tertib, mengganggu ketertiban, berperilaku tidak pantas, atau menolak untuk mematuhi arahan atau peringatan dari panitia Pestapora akan segera dikeluarkan dari lokasi Pestapora tanpa hak untuk mendapatkan pengembalian tiket.&nbsp;<br><span style="color:#0000FF;"><i>Event attendees who engage in disorderly conduct, cause disturbances, behave inappropriately, or refuse to comply with instructions or warnings from event staff will be immediately removed from the event venue, with no right to a ticket refund.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Dilarang melemparkan barang ke panggung, khususnya benda padat karena dapat melukai sekitar.<br><span style="color:#0000FF;"><i>Please don&rsquo;t throw things, especially hard objects on stage because it would harm surroundings.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penonton hanya diperbolehkan&nbsp;<strong>satu kali</strong> masuk melalui pintu yang disediakan dan dilarang masuk kembali jika sudah keluar dari venue<i>,&nbsp;</i>di hari yang sama.<i>&nbsp;</i><br><span style="color:#0000FF;"><i>There will be NO RE ENTRY.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penonton yang telah dikeluarkan atau keluar dari lokasi acara tidak diperkenankan untuk masuk kembali ke lokasi acara.<br><span style="color:#0000FF;"><i>Attendees who have been ejected or left the event location are not permitted to re-enter the event location.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Pestapora berusaha menciptakan ruang aman dan nyaman untuk perempuan dan semua, segala bentuk jenis pelecehan akan kami tindak lanjuti.<br><span style="color:#0000FF;"><i>Pestapora strives to create a safe and comfortable space for women and everyone. We will take action against all forms of harassment.</i></span></li>
			</ol><p dir="ltr">Harap diperhatikan juga:<br><i><span style="color:#0000FF;">Please also note:</span></i></p>

			<ol start="38"><li aria-level="1" dir="ltr">Waktu pertunjukan dan artis dapat berubah dan/atau dibatalkan tanpa pemberitahuan sebelumnya. Tidak ada pengembalian uang yang akan diberikan jika terjadi perubahan dan/atau pembatalan tersebut<br><span style="color:#0000FF;"><i>Performance times and artists are subject to change without prior notice. No refunds will be given in the event of such change.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penampil dan susunan program dapat mengalami perubahan sewaktu-waktu atas pertimbangan penampil dan/atau penyelenggara. Pestapora akan selalu berupaya memberikan pengalaman terbaik, dan setiap perubahan dilakukan dengan mempertimbangkan kepentingan bersama. Dengan membeli tiket, penonton memahami bahwa perubahan tersebut merupakan bagian dari dinamika Pestapora dan tidak dapat dijadikan dasar tuntutan terhadap penyelenggara.<br><span style="color:#0000FF;"><i>The performers and program are subject to change at any time at the discretion of the performers and/or organizers. Pestapora will always strive to provide the best possible experience, and any changes are made with the common good in mind. By purchasing tickets, attendees understand that these changes are part of the dynamics of the event and cannot be used as a basis for claims against the organizers.</i></span><br>
				&nbsp;</li>
				<li aria-level="1" dir="ltr">Penyelenggara berhak untuk mengubah, memodifikasi, menambah atau menghapus bagian dari ketentuan ini setiap saat. Silahkan simak dan melakukan kembali pemeriksaan secara berkala untuk perubahan ketentuan.<br><span style="color:#0000FF;"><i>The Organizer reserves the right, in its sole discretion, to change, modify, add or remove portions of these terms at any time. Please check regularly for changes to the terms.</i></span></li>
			</ol><p>&nbsp;</p>

			<p dir="ltr"><strong>UNTUK INFORMASI LEBIH LANJUT:</strong><br><i><strong><span style="color:#0000FF;">FOR FURTHER INFORMATION:</span></strong></i></p>

			<p dir="ltr"><u>BOSS CREATOR</u></p>

			<p dir="ltr">WHATSAPP (Chat Only): +62 811-880-553</p>

			<p dir="ltr">EMAIL: info@bosscreator.id</p>

			<p dir="ltr">&nbsp;</p>

			<p dir="ltr"><u>LOKET.COM</u></p>

			<p dir="ltr">WHATSAPP: KLIK DISINI</p>

			<p dir="ltr">EMAIL:<a href="http://support@loket.com"><span style="color:#0000FF;"> support@loket.com</span></a></p>

			<p dir="ltr">PHONE: +62 218 0600 822</p>
			</div>
			</td>
		</tr></tbody></table>' WHERE title = 'Pestapora 2026' AND venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<ol><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Tiket Glitter Camp Live Concert Jakarta yang sah adalah tiket yang dibeli melalui situs resmi <a href="https://www.loket.com/">https://www.loket.com</a> dan sesuai dengan tata cara pembelian yang telah ditentukan oleh penyelenggara.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Harga tiket yang tercantum sudah termasuk Pajak Pertambahan Nilai (PPN) sesuai dengan ketentuan perundang-undangan yang berlaku, namun belum termasuk pajak hiburan dan biaya administrasi lainnya</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Seluruh section pada konser bersifat tempat duduk. Tempat duduk akan ditentukan oleh sistem sesuai dengan urutan pembayaran. Setiap pembeli akan mendapatkan barcode ticket melalui E-Ticket yang akan dikirimkan ke email setiap pembeli. Seating Number (Nomor Kursi) akan dimunculkan pada E-Ticket Loket paling telat H-5 sebelum acara berlangsung.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation"><strong>Terkait jam mulai acara akan diinfokan lebih lanjut mendekati hari penyelenggaraan acara.</strong></p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penukaran E-Ticket menjadi wristband akan dibuka mulai pukul 11.00 WIB</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Data pribadi yang dimasukkan ke dalam situs Glitter Camp Live Concert Jakarta hanya akan digunakan untuk keperluan pembelian tiket Glitter Camp Live Concert Jakarta.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Satu (1) akun Loketcom hanya berlaku untuk pembelian maksimal sepuluh (10) tiket Glitter Camp Live Concert Jakarta dalam 1 kali transaksi.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Anak dengan usia dibawah satu (1) tahun tidak diperkenankan untuk menghadiri Glitter Camp Live Concert Jakarta.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Anak dengan usia satu (1) tahun sampai dengan tiga belas (13) tahun diwajibkan untuk membeli tiket untuk menghadiri acara, dan diwajibkan untuk didampingi oleh orang tua untuk menghadiri acara. Jika tidak ada orang tua atau pendamping yang hadir, maka anak tersebut tidak diperkenankan masuk dan menghadiri acara, tiket akan dinyatakan hangus.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Anak dengan usia tiga belas (13) tahun,, dapat menghadiri acara tanpa orang tua, tetapi wajib mengisi formulir yang telah disiapkan penyelenggara saat penukaran tiket agar penyelenggara memiliki informasi lengkap terhadap anak tersebut.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Anak Berkebutuhan Khusus (ABK), pengguna kursi roda dan layanan kebutuhan khusus lainnya, wajib didampingi dan menginformasikan kepada pihak penyelenggara melalui email <a href="mailto:arvindomedia@gmail.com">arvindomedia@gmail.com</a> (sub:assistance glitter camp)</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Usia anak akan diverifikasi pada saat penukaran tiket dan/atau pengambilan wristband. Orang tua atau wali wajib menunjukkan dokumen identitas resmi anak yang mencantumkan tanggal lahir, seperti Akta Kelahiran, Kartu Keluarga (KK), KIA, atau Paspor.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Segala keputusan terkait pengunjung yang dapat melakukan pembelian tiket Glitter Camp Live Concert Jakarta adalah keputusan yang mutlak dan tidak dapat diganggu gugat oleh pihak manapun.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Tiket dijual secara langsung dari penyelenggara ke konsumen. Tiket apapun yang dibeli oleh pebisnis atau pedagang tiket yang melanggar peraturan ini akan dibatalkan. Kami tidak bertanggung jawab atas tiket yang diperoleh di luar dari situs resmi https://www.loket.com</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">E-Ticket hanya dapat diakses melalui email yang digunakan ketika membeli tiket.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Untuk kenyamanan dan keteraturan acara, Seat Number (SN) akan dibagikan mendekati hari acara, paling telat lima (5) hari sebelum acara diselenggarakan.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemegang Tiket wajib menunjukkan E-Ticket untuk mendapatkan Wristband sebagai tanda masuk ke Glitter Camp Live Concert Jakarta sesuai dengan kategori tiket dan section yang dipilih.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Dalam hal terjadi alih kepemilikan tiket, maka pemegang tiket pengganti wajib menunjukkan:</p>
				</li>
			</ol><ul dir="ltr"><li role="presentation">E-Ticket asli yang dikirimkan melalui email/whatsapp,</li>
				<li role="presentation">Fotokopi kartu identitas pemilik asli tiket, dan</li>
				<li role="presentation">Surat kuasa yang telah ditandatangani oleh pemilik asli tiket di atas materai Rp10.000.</li>
			</ul><ol start="17"><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemegang Tiket secara hukum hanya berhak untuk menggunakan E-Ticket sebanyak satu (1) kali. Menduplikasi E-Ticket tidak diperbolehkan dan merupakan tindakan ilegal.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Semua Pemegang Tiket hanya bisa masuk ke area Glitter Camp Live Concert sebanyak satu (1) kali. Tidak boleh keluar masuk area Glitter Camp Live Concert (tidak in-out).</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">E-Ticket bersifat rahasia dan tidak boleh disebarluaskan kepada pihak mana pun. Segala bentuk kecurangan atau penipuan tiket menjadi tanggung jawab pemilik tiket dan berada di luar tanggung jawab penyelenggara.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penyelenggara berhak mengambil tindakan hukum dan/atau menolak akses pengunjung ke area acara apabila:</p>
				</li>
			</ol><ul dir="ltr"><li role="presentation">Tiket telah digunakan oleh orang lain, atau</li>
				<li role="presentation">Tiket diperoleh secara tidak sah.</li>
			</ul><ol start="21"><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penyelenggara berhak memproses dan menuntut secara hukum (perdata dan/atau pidana) terhadap pihak yang melakukan pelanggaran, termasuk namun tidak terbatas pada pemalsuan, penggandaan, atau pembelian tiket yang bertentangan dengan ketentuan resmi.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penyelenggara tidak bertanggung jawab atas kelalaian Pemegang Tiket yang mengakibatkan tiket berada dalam penguasaan pihak lain dan digunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang dapat menghilangkan hak Pemegang Tiket untuk masuk.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemegang Tiket dengan kondisi medis tertentu atau yang sedang sakit diwajibkan memberikan keterangan medis sebelum mengikuti Glitter Camp Live Concert Jakarta. Penyelenggara tidak bertanggung jawab atas komplikasi kesehatan yang timbul selama acara yang disebabkan oleh kondisi medis yang telah ada sebelumnya.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Identitas resmi yang berlaku untuk pengambilan tiket antara lain:</p>
				</li>
			</ol><ul dir="ltr"><li role="presentation">Kartu Tanda Penduduk (KTP),</li>
				<li role="presentation">Surat Izin Mengemudi (SIM),Paspor, atau</li>
				<li role="presentation">Kartu Keluarga (KK) yang masih berlaku.</li>
				<li role="presentation">Akte Lahir, baik digital maupun fotokopi, untuk anak dibawah usia 17 tahun dan belum memiliki KTP</li>
			</ul><ol start="25"><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Setelah Pemegang Tiket menerima Wristband, penyelenggara tidak bertanggung jawab terhadap kehilangan, pengalihan, atau pemindahtanganan Wristband kepada pihak lain. Tidak akan diberikan pengganti tiket atau Wristband dalam kondisi apa pun.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Dengan membeli tiket Glitter Camp Live Concert Jakarta, Pemegang Tiket telah menyetujui semua Syarat dan Ketentuan yang berlaku serta tunduk pada hukum Negara Republik Indonesia.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Jika terjadi pembatalan Glitter Camp Live Concert Jakarta, maka uang tiket akan dikembalikan sesuai dengan ketentuan penyelenggara. Pembeli tiket dengan ini juga melepaskan hak untuk mengajukan tuntutan hukum melalui pengadilan atau cara lainnya terkait pembatalan yang disebabkan oleh pihak artis, pemerintah atau sebab-sebab lain di luar kuasa penyelenggara.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penyelenggara berhak menolak atau melarang Pemegang Tiket memasuki area acara Glitter Camp Live Concert Jakarta apabila:</p>
				</li>
			</ol><ul dir="ltr"><li role="presentation">Dalam keadaan mabuk,</li>
				<li role="presentation">Di bawah pengaruh obat-obatan terlarang atau narkotika, atau</li>
				<li role="presentation">Dalam kondisi kesehatan yang tidak memadai.</li>
			</ul><ol start="29"><li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemegang Tiket yang terbukti membawa obat-obatan terlarang, senjata atau barang-barang terlarang lainnya tidak akan diperbolehkan masuk ke dalam area festival. Pemegang Tiket yang ditemukan membawa barang-barang tersebut akan dilaporkan ke pihak yang berwajib dan tidak berhak atas pengembalian uang tiket.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pengunjung yang bertindak tidak sopan, mengganggu, atau berperilaku tidak senonoh, serta yang menolak menaati peraturan dan mematuhi teguran staf akan segera dikeluarkan dari area acara Glitter Camp Live Concert Jakarta tanpa hak pengembalian uang tiket.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pengunjung yang dikeluarkan dari area festival tidak akan diperbolehkan memasuki kembali area acara, termasuk pada hari berikutnya.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pengunjung yang memasuki area acara Glitter Camp Live Concert Jakarta tanpa tiket yang sah atau tanda pengenal yang sah akan dikeluarkan dan dapat dikenakan tindakan hukum serta dimintai ganti rugi.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pengunjung wajib menjaga dan bertanggung jawab atas barang-barang pribadi selama berada di area acara Glitter Camp Live Concert Jakarta.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Panitia acara, penyelenggara, dan pengisi acara tidak bertanggung jawab atas kehilangan barang pribadi pengunjung Glitter Camp Live Concert Jakarta atau kejadian yang mengakibatkan cedera di area Glitter Camp Live Concert Jakarta selama acara berlangsung, apapun alasannya.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Setiap pengunjung atau peserta acara ini dianggap sepenuhnya melepaskan dan membebaskan penyelenggara dari segala hak, tuntutan, kerugian, kehilangan, tanggung jawab, denda dan perbuatan apapun yang timbul secara langsung atau tidak langsung akibat rekaman dan siaran acara ini.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemegang Tiket memberikan izin kepada penyelenggara dan pihak sponsor untuk melakukan perekaman video, pengambilan testimoni, serta menayangkannya di berbagai saluran media (televisi, media cetak, maupun digital) di seluruh dunia untuk keperluan iklan, publikasi, dan promosi terkait Glitter Camp Live Concert Jakarta, tanpa memerlukan persetujuan tambahan dari pemilik tiket.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Penyelenggara, artis, maupun sponsor tidak bertanggung jawab atas cedera tubuh atau kerusakan barang yang mungkin dialami pengunjung sebelum maupun selama Glitter Camp Live Concert Jakarta berlangsung.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Pemilik tiket wajib mematuhi seluruh tata tertib Glitter Camp Live Concert Jakarta yang ditetapkan oleh penyelenggara.</p>
				</li>
				<li aria-level="1" dir="ltr">
				<p dir="ltr" role="presentation">Petugas resmi penyelenggara berhak menolak atau mengeluarkan pengunjung yang melanggar tata tertib dari area acara Glitter Camp Live Concert Jakarta.</p>
				</li>
			</ol><p dir="ltr"><b id="docs-internal-guid-0b341eff-7fff-6db3-a106-c157bcf2836b">Butuh bantuan? Hubungi:</b><br>
			E-mail : arvindomedia@gmail.com<br>
			Telepon : 021 - 87797777<br>
			WhatsApp (Live Chat) : 081196510040<br>
			Instagram : @arvindo.entertainment</p>
			</td>
		</tr></tbody></table>' WHERE title = 'Glitter Camp Live Concert' AND venue = 'Balai Sarbini Jakarta, Jakarta Selatan';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<ol><li>Tiket yang sah adalah yang dibeli melalui Loket.com. Promotor tidak bertanggungjawab terhadap validitas tiket yang dibeli dari pihak ketiga.</li>
				<li>Tiket berlaku untuk 1 orang, 1 kali masuk venue, tidak diperkenankan re-entry.</li>
				<li>Pemegang <strong>Tiket VIP</strong> masuk melalui gate khusus, mendapat area khusus di depan stage dengan kapasitas terbatas. Tiket VIP ditukarkan dengan gelang/ID. Boleh keluar-masuk area VIP dengan menunjukkan gelang/ID.</li>
				<li>Disediakan gate khusus prioritas: anak-anak, ibu hamil, lanisa, dan penonton berkebutuhan khusus. Harap menghubungi petugas untuk mendapat bantuan.</li>
				<li>Harap membawa tiket dari Loket.com pada saat memasuki venue. Tiket tidak perlu di-print, cukup ditunjukkan di gate untuk di-scan oleh petugas.</li>
				<li>Penyelenggara memiliki hak untuk:<br>
				- Melarang masuk pengunjung jika tiket telah dipergunakan oleh orang lain.<br>
				- Melarang masuk pengunjung ke area venue jika tiket tidak valid.<br>
				- Memproses atau mengajukan hukum, baik perdata atau kriminal kepada pengunjung yang mendapatkan tiket dengan ilegal, termasuk memalsukan dan menggandakan tiket yang sah atau mendapatkan tiket dengan cara yang tidak sesuai prosedur.</li>
				<li>Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.</li>
				<li>Ticket yang telah dibeli tidak dapat diuangkan kembali dengan alasan apapun.</li>
				<li>Pihak penyelenggara akan menindak tegas, dan berhak mengeluarkan pengunjung apabila berperilaku tidak tertib, dalam pengaruh alkohol, menyinggung atau berperilaku yang tidak pantas, dan tamu yang menolak untuk mematuhi instruksi / peringatan dari staf festival / event. Tidak akan ada pengembalian uang.</li>
				<li>Tamu bertanggung jawab sepenuhnya atas keamanan semua barang-barang pribadi. Kehilangan barang pribadi bukan tanggung jawab panitia.</li>
				<li>Dilarang membawa makanan dan minuman dari luar ke dalam venue.</li>
				<li>Dilarang membawa dan menggunakan segala obat-obatan terlarang, narkoba, psikotropika, atau barang-barang yang mengandung zat berbahaya lainnya.</li>
				<li>Dilarang membawa senjata tajam/api, bahan peledak, serta benda-benda yang dilarang berdasarkan ketentuan perundangan yang berlaku ke dalam venue.</li>
				<li>Jika terjadi pembatalan pertunjukkan di kemudian hari maka pembelian tiket akan dikembalikan sesuai dengan ketentuan promotor.</li>
				<li>Penyelenggara, promotor, dan artis tidak bertanggung jawab atas kompensasi dan/atau biaya pembatalan untuk biaya perjalanan yang Anda keluarkan apabila festival/acara yang dibatalkan atau ditunda.</li>
				<li>Harga tercantum belum termasuk biaya admin dan PPN, kecuali disebutkan lain.</li>
			</ol></td>
		</tr></tbody></table>' WHERE title = 'PGR 2026 @Cikarang' AND venue = 'Lippo Mall Cikarang, Kab. Bekasi';
UPDATE events SET terms_conditions = '<p>Party du Royaume — 20th Celebration</p><p>•	Ketentuan Tiket</p><p>1. Tiket berlaku untuk 1 (satu) orang dan hanya dapat digunakan untuk 1 (satu) sesi pertunjukan sesuai sesi yang dipilih saat pembelian.</p><p>2. Tiket tidak dapat digunakan untuk sesi yang berbeda dari sesi yang tertera pada tiket.</p><p>3. Penonton diharapkan hadir lebih awal untuk proses registrasi. First come first serve (Open gate 30 menit sebelum pertunjukan dimulai)</p><p>4. Harga Early Bird hanya berlaku selama periode Early Bird dan/atau selama kuota tiket Early Bird masih tersedia.</p><p>5. Setelah periode Early Bird berakhir, harga tiket mengikuti harga Regular Sales.</p><p>6. Pembayaran & Konfirmasi Tiket dianggap sah setelah pembayaran berhasil dan pembeli menerima konfirmasi/tiket resmi yang dikirim ke email.</p><p>7. Pastikan data yang dimasukkan saat pembelian sudah benar.</p><p>8. Kesalahan pengisian data yang disebabkan oleh pembeli menjadi tanggung jawab pembeli.</p><p>9. Tiket & Akses MasukTiket wajib ditunjukkan pada saat memasuki venue.</p><p>10. Tiket dapat berupa tiket digital/QR Code sesuai sistem ticketing yang digunakan.</p><p>11. 1 QR Code hanya dapat digunakan 1 kali dan tidak dapat digunakan kembali setelah berhasil divalidasi.</p><p>12. Tiket yang telah digunakan, rusak, tidak terbaca, atau terindikasi telah digunakan sebelumnya dapat ditolak oleh panitia.</p>' WHERE title = 'Party Du Royaume by de Creative Kingdom' AND venue = 'Taman Budaya Raden Saleh, Kota Semarang';
UPDATE events SET terms_conditions = '<p><strong>SYARAT DAN KETENTUAN PEMBELIAN TIKET</strong></p><p><strong>Golden Jubilee / GoJu 2026</strong> diselenggarakan oleh BPN PKKI.</p><p>Dengan melakukan pembelian tiket, Pembeli telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan (S&K) berikut ini.</p><p><br></p><p><strong>1. Definisi</strong></p><p><br></p><p>1.1. "Penyelenggara" adalah pihak yang menyelenggarakan dan bertanggung jawab atas acara ini, yaitu BPN PKKI.</p><p><br></p><p>1.2. "Tiket" atau "E-ticket" adalah bukti pembelian sah dalam bentuk digital (PDF/aplikasi/QR code) yang wajib ditukarkan menjadi Gelang Acara sebelum dapat digunakan untuk masuk ke venue.</p><p><br></p><p>1.3. "Gelang Acara" adalah gelang fisik resmi yang diberikan oleh Penyelenggara sebagai pengganti e-ticket pada saat penukaran, dan merupakan satu-satunya identitas yang sah untuk masuk dan tetap berada di dalam venue selama acara berlangsung.</p><p><br></p><p>1.4. "Pembeli" adalah individu yang melakukan transaksi pembelian tiket melalui kanal resmi yang ditentukan Penyelenggara.</p><p><br></p><p>1.5. "Kanal Resmi" adalah platform penjualan tiket yang ditunjuk dan diumumkan secara resmi oleh Penyelenggara, yaitu loket.com</p><p><br></p><p><strong>2. Pembelian Tiket</strong></p><p><br></p><p>2.1. Tiket hanya sah jika dibeli melalui Kanal Resmi yang ditunjuk Penyelenggara. Penyelenggara tidak bertanggung jawab atas tiket yang dibeli dari pihak ketiga yang tidak resmi (calo, reseller tidak resmi, dsb).</p><p><br></p><p>2.2. Setiap transaksi tunduk pada ketersediaan kuota tiket. Penyelenggara berhak membatasi jumlah pembelian per akun/identitas untuk mencegah penyalahgunaan sistem.</p><p><br></p><p>2.3. Data yang diisi pada saat pembelian (nama, email, nomor telepon, dll.) harus benar dan sesuai identitas asli, karena akan digunakan untuk verifikasi saat masuk ke venue.</p><p><br></p><p>2.4. Harga tiket sudah tidak termasuk biaya layanan (administrasi), pajak, dan biaya lain yang berlaku, sebagaimana ditampilkan pada saat transaksi di Kanal Resmi.</p><p><br></p><p><strong>3. Pembayaran</strong></p><p><br></p><p>3.1. Pembayaran harus diselesaikan sesuai batas waktu (time limit) yang ditentukan oleh sistem Kanal Resmi. Transaksi yang tidak diselesaikan dalam batas waktu tersebut akan dibatalkan secara otomatis.</p><p><br></p><p>3.2. Tiket dianggap sah dan berlaku setelah pembayaran dikonfirmasi berhasil oleh sistem dan e-ticket/bukti pembelian telah diterbitkan.</p><p><br></p><p>3.3. Penyelenggara dan/atau mitra penyedia layanan pembayaran tidak bertanggung jawab atas kegagalan transaksi yang diakibatkan oleh gangguan pada pihak bank, dompet digital, atau penyedia jasa pembayaran Pembeli.</p><p><br></p><p><strong>4. E-Ticket dan Penukaran Gelang Acara</strong></p><p><br></p><p>4.1. Seluruh tiket diterbitkan hanya dalam bentuk e-ticket (digital). Tidak ada tiket fisik yang diterbitkan oleh Penyelenggara.</p><p><br></p><p>4.2. E-ticket wajib ditukarkan menjadi Gelang Acara sebelum Pembeli/pemegang tiket dapat memasuki venue. E-ticket itu sendiri tidak berlaku sebagai akses masuk ke dalam venue.</p><p><br></p><p>4.3. Penukaran e-ticket menjadi Gelang Acara dapat dilakukan pada periode sebelum hari H (pre-event) dan/atau pada hari H acara, sesuai jadwal dan lokasi penukaran (loket/booth) yang ditentukan dan diinformasikan oleh Penyelenggara melalui kanal komunikasi resmi. Penyelenggara berhak menutup loket penukaran sesuai jadwal yang ditentukan, dan Pembeli yang tidak menukarkan e-ticket pada periode pre-event tetap dapat melakukan penukaran pada hari H selama loket masih dibuka.</p><p><br></p><p>4.4. Pada saat penukaran, Pembeli wajib menunjukkan e-ticket yang sah (QR code/kode booking) beserta identitas diri (KTP/SIM/Paspor) yang sesuai dengan data pemesanan untuk diverifikasi oleh petugas.</p><p><br></p><p>4.5. Setiap e-ticket (QR code) hanya dapat ditukarkan satu kali dan akan langsung dinonaktifkan oleh sistem setelah proses penukaran berhasil. E-ticket yang sudah ditukarkan tidak dapat digunakan kembali untuk penukaran kedua.</p><p><br></p><p>4.6. E-ticket yang digandakan, dipalsukan, sudah pernah ditukarkan, atau menunjukkan tanda-tanda manipulasi akan ditolak oleh petugas pada saat penukaran, dan pemegangnya tidak berhak mendapatkan Gelang Acara maupun kompensasi apa pun.</p><p><br></p><p>4.7. Pembeli disarankan untuk melakukan penukaran gelang sebelum waktu acara dimulai, mengingat ketersediaan waktu penukaran terbatas dan dapat terjadi antrean. Penyelenggara tidak bertanggung jawab atas keterlambatan masuk venue akibat Pembeli melakukan penukaran mendekati waktu acara.</p><p><br></p><p>4.8. Khusus untuk pembelian Donasi Kursi Kasih, tidak mendapatkan QR code.</p><p>Donasi Kursi Kasih adalah bentuk donasi dukungan dari Pembeli untuk umat yang didukung dalam tujuan acara, dan alokasinya akan dibagikan oleh Penyelenggara.</p><p><br></p><p><strong>5. Ketentuan Gelang Acara</strong></p><p><br></p><p>5.1. Gelang Acara yang telah diterima wajib langsung dipasang dan dikenakan di pergelangan tangan oleh petugas pada saat penukaran, dan tidak boleh dilepas selama berada di area venue.</p><p><br></p><p>5.2. Gelang Acara yang rusak, terputus, dilepas paksa, atau menunjukkan tanda-tanda manipulasi/pemalsuan dianggap tidak sah dan tidak dapat digunakan untuk masuk kembali ke venue (re-entry), tanpa penggantian.</p><p><br></p><p>5.3. Gelang Acara bersifat satu kali pakai dan melekat pada satu orang; tidak dapat dipindahtangankan setelah dipasang ke pergelangan tangan pengunjung.</p><p><br></p><p>5.4. Gelang Acara yang hilang setelah diterima tidak dapat diganti atau diterbitkan ulang oleh Penyelenggara.</p><p><br></p><p>5.5. Petugas keamanan berhak memeriksa keaslian Gelang Acara kapan saja selama acara berlangsung, termasuk pada titik masuk ulang (re-entry) jika area tersebut mengizinkan keluar-masuk venue.</p><p><br></p><p><strong>6. Kebijakan Pembatalan dan Pengembalian Dana (Refund)</strong></p><p><br></p><p>6.1. Tiket yang sudah dibeli tidak dapat dikembalikan atau dibatalkan atas permintaan pribadi Pembeli (termasuk namun tidak terbatas pada alasan berubah pikiran, halangan pribadi, atau kesalahan input data oleh Pembeli sendiri).</p><p><br></p><p>6.2. Pengembalian dana (refund) hanya berlaku apabila acara dibatalkan secara resmi oleh Penyelenggara. Dalam hal ini:</p><p><br></p><p>6.2.1. Penyelenggara akan mengumumkan pembatalan secara resmi melalui kanal komunikasi resmi (situs web, media sosial, dan/atau Kanal Resmi penjualan tiket).</p><p><br></p><p>6.2.2. Proses refund akan dilakukan sepenuhnya sebesar nilai nominal tiket yang dibayarkan, dengan mekanisme dan estimasi waktu yang akan diinformasikan kemudian oleh Penyelenggara atau Kanal Resmi.</p><p><br></p><p>6.2.3. Biaya administrasi/layanan pembelian (jika ada) dapat menjadi bagian yang tidak termasuk dalam refund, kecuali dinyatakan lain oleh Penyelenggara.</p><p><br></p><p>6.3. Apabila acara ditunda atau dijadwalkan ulang (reschedule), tiket yang sudah dibeli tetap berlaku untuk tanggal baru tersebut. Refund untuk kasus reschedule akan diatur dalam pengumuman resmi tersendiri, jika diberlakukan.</p><p><br></p><p>6.4. Permintaan refund di luar ketentuan pada poin 6.2 tidak akan diproses oleh Penyelenggara maupun Kanal Resmi penjualan.</p><p><br></p><p><strong>7. Masuk ke Venue</strong></p><p><br></p><p>7.1. Akses masuk ke venue hanya berlaku bagi pengunjung yang telah mengenakan Gelang Acara yang sah hasil penukaran e-ticket. E-ticket yang belum ditukarkan tidak dapat digunakan untuk masuk ke venue.</p><p><br></p><p>7.2. Petugas berhak memeriksa dan mencocokkan keaslian Gelang Acara pada titik masuk venue, dan dapat meminta pengunjung menunjukkan identitas diri yang sah apabila diperlukan.</p><p><br></p><p>7.3. Penyelenggara berhak melakukan pemeriksaan keamanan (security check) terhadap barang bawaan setiap pengunjung sebelum memasuki venue.</p><p><br></p><p>7.4. Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung yang: tidak mengenakan Gelang Acara yang sah/tidak dapat diverifikasi; dalam kondisi mabuk atau di bawah pengaruh zat terlarang; membawa barang yang dilarang (senjata, bahan berbahaya, dll.); atau berperilaku yang mengganggu ketertiban dan keselamatan acara.</p><p><br></p><p>7.5. Seluruh kategori tiket menerapkan sistem free seating (tanpa nomor kursi), sehingga tempat duduk/posisi di dalam venue tidak ditentukan dan tersedia berdasarkan urutan kedatangan pengunjung (first come, first served).</p><p><br></p><p>7.6. Anak berusia di atas 2 (Dua) tahun wajib memiliki tiket (dan Gelang Acara hasil penukarannya) yang sah untuk dapat memasuki area acara.</p><p><br></p><p><strong>8. Tata Tertib Pengunjung</strong></p><p><br></p><p>8.1. Pengunjung dilarang membawa makanan dan minuman dari luar venue, kecuali diizinkan secara tertulis oleh Penyelenggara.</p><p><br></p><p>8.2. Pengunjung wajib mengikuti instruksi petugas keamanan dan panitia selama berada di area venue, demi keselamatan bersama.</p><p><br></p><p>8.3. Penyelenggara berhak menolak masuk atau mengeluarkan peserta yang melanggar peraturan yang berlaku atau dianggap dapat mengganggu keamanan dan keselamatan acara, tanpa kompensasi apa pun.</p><p><br></p><p>8.4. Segala tindakan yang dapat merugikan, mengganggu, atau membahayakan peserta lain maupun jalannya acara baik secara fisik, verbal, maupun melalui media lain tidak akan ditoleransi dan dapat ditindak sesuai peraturan yang berlaku, termasuk diserahkan kepada pihak berwenang jika diperlukan.</p><p><br></p><p><strong>9. Donasi Kursi Kasih</strong></p><p><br></p><p>9.1.Kursi kasih akan disalurkan langsung oleh tim KLMTD Goju.</p><p><br></p><p>9.2.QRCode tidak diberikan kepada pemberi donasi.</p><p><br></p><p><strong>10. Dokumentasi dan Hak Penggunaan Gambar</strong></p><p><br></p><p>10.1. Dengan menghadiri acara, Pembeli/pengunjung memahami dan menyetujui bahwa dirinya dapat terekam dalam foto, video, atau materi dokumentasi lain yang diambil oleh Penyelenggara untuk keperluan publikasi, promosi, dan arsip, tanpa kompensasi tambahan.</p><p><br></p><p>10.2. Pengunjung yang tidak berkenan direkam dapat menyampaikan hal ini kepada petugas dokumentasi di lokasi, namun Penyelenggara tidak menjamin dapat menghindari seluruh kemungkinan rekaman insidental di area publik venue.</p><p><br></p><p><strong>11. Perubahan Acara dan Force Majeure</strong></p><p><br></p><p>11.1. Penyelenggara berhak melakukan perubahan terhadap susunan acara, talent/pengisi acara, jadwal, atau lokasi, dengan pemberitahuan resmi sesegera mungkin kepada pemegang tiket.</p><p><br></p><p>11.2. Dalam hal terjadi keadaan kahar (force majeure) seperti bencana alam, kebijakan pemerintah, kerusuhan, pandemi, atau kondisi luar kendali Penyelenggara lainnya yang menyebabkan acara tidak dapat dilaksanakan, ketentuan pada Pasal 6 (Kebijakan Refund) mengenai pembatalan resmi oleh Penyelenggara akan berlaku.</p><p><br></p><p><strong>12. Batasan Tanggung Jawab</strong></p><p><br></p><p>12.1. Penyelenggara tidak bertanggung jawab atas kehilangan, kerusakan, atau pencurian barang pribadi milik pengunjung selama berada di area venue.</p><p>12.2. Penyelenggara tidak bertanggung jawab atas biaya tambahan yang dikeluarkan Pembeli di luar harga tiket (misalnya transportasi, akomodasi, atau cuti kerja) apabila terjadi perubahan, penundaan, atau pembatalan acara.</p><p>12.3. Tanggung jawab Penyelenggara terhadap Pembeli, dalam hal apa pun, terbatas pada nilai nominal harga tiket yang telah dibayarkan, kecuali ditentukan lain oleh hukum yang berlaku.</p><p><br></p><p><strong>13. Privasi Data</strong></p><p><br></p><p>13.1. Data pribadi yang diberikan saat pembelian tiket akan digunakan oleh Penyelenggara dan Kanal Resmi semata-mata untuk keperluan verifikasi, komunikasi terkait acara, dan keperluan administratif lainnya sesuai kebijakan privasi yang berlaku.</p><p><br></p><p>13.2 Penyelenggara berkomitmen untuk tidak membagikan data pribadi Pembeli kepada pihak ketiga tanpa izin, kecuali diwajibkan oleh hukum yang berlaku.</p><p><br></p><p><strong>14. Hukum yang Berlaku</strong></p><p><br></p><p>14.1. Syarat dan ketentuan ini diatur dan ditafsirkan berdasarkan hukum yang berlaku di Republik Indonesia.</p><p><br></p><p>14.2. Setiap perselisihan yang timbul akan diupayakan diselesaikan secara musyawarah; apabila tidak tercapai kesepakatan, penyelesaian akan dilakukan melalui jalur hukum yang berlaku.</p><p><br></p><p><strong>15. Perubahan Syarat dan Ketentuan</strong></p><p><br></p><p>15.1. Penyelenggara berhak memperbarui, mengubah, atau menyesuaikan isi Syarat dan Ketentuan ini sewaktu-waktu tanpa pemberitahuan sebelumnya, sesuai dengan kebutuhan operasional acara.</p><p><br></p><p>15.2. Pembeli/pengunjung disarankan untuk memeriksa kembali versi terbaru Syarat dan Ketentuan secara berkala melalui Kanal Resmi sebelum hari acara.</p><p><br></p><p><strong>16. Kontak dan Informasi Lebih Lanjut</strong></p><p><br></p><p>Untuk pertanyaan, keluhan, atau informasi lebih lanjut, Pembeli dapat menghubungi:</p><p>Email: support@loket.com</p><p>Telepon: 021 3000 3160</p><p>---</p><p>Syarat dan ketentuan ini dapat berubah sewaktu-waktu. Versi terbaru akan selalu tersedia di Kanal Resmi penjualan tiket dan/atau situs resmi Penyelenggara.</p>' WHERE title = 'Golden Jubilee 2026' AND venue = 'Indonesia Arena, Jakarta Pusat';
UPDATE events SET terms_conditions = '<p>Ketentuan Umum</p><ul><li>Bawa e-tiket untuk ditukarkan dengan wristband saat check-in</li><li>Setiap pengunjung akan mendapatkan 1 renteng kopi  Good Day dan Passport Activity Event.</li></ul><p><br></p><p>Barang yang Dilarang (Don''ts)</p><ul><li>Dilarang membawa senjata tajam, bahan peledak, atau benda berbahaya lainnya.</li><li>Dilarang membawa kamera profesional, lensa panjang, atau alat perekam video profesional tanpa seizin panitia penyelenggara.</li><li>Dilarang membawa obat-obatan terlarang dan alkohol.</li></ul><p><br></p><p>Barang yang Dianjurkan (Do''s)</p><ul><li>Membawa obat-obatan pribadi yang dibutuhkan.</li><li>Membawa jas hujan.</li><li>Menggunakan pakaian yang nyaman dan alas kaki yang aman.</li></ul><p><br></p><p><br></p>' WHERE title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND venue = 'Laswi Heritage, Bandung';
UPDATE events SET terms_conditions = '<p>Ketentuan Umum Peserta/Pengunjung</p><ul><li>Setiap peserta atau pengunjung <strong>wajib memiliki tiket</strong> atau tanda pengenal sah yang terdaftar atas nama pribadi.</li><li>Peserta wajib mematuhi <strong>batas usia minimum</strong> yang telah ditentukan oleh pihak penyelenggara (jika ada, misal: 17 tahun ke atas).</li><li>Seluruh peserta dilarang membawa senjata tajam, obat-obatan terlarang, alkohol, atau benda berbahaya lainnya ke area acara.</li><li>Penyelenggara berhak mengeluarkan peserta dari area acara tanpa pengembalian dana jika melakukan tindakan provokatif, merusuh, atau melanggar hukum. [<a href="https://kiostix.com/terms-and-condition" rel="noopener noreferrer" target="_blank">1</a>]</li></ul><p><br></p><p><br></p><p>2. Ketentuan Tiket dan Pendaftaran</p><ul><li>Tiket yang sudah dibeli <strong>tidak dapat dikembalikan</strong> (<em>non-refundable</em>) atau ditukarkan dengan alasan apa pun, kecuali acara dibatalkan oleh pihak penyelenggara.</li><li>Pendaftaran atau pembelian tiket hanya sah jika dilakukan melalui platform resmi yang ditunjuk oleh panitia.</li><li>Penyelenggara tidak bertanggung jawab atas kerugian akibat pembelian tiket melalui pihak ketiga yang tidak resmi.</li></ul><p><br></p><p><br></p><p>3. Ketentuan Khusus (Jika Event Berupa Lomba/Kompetisi)</p><ul><li>Karya atau penampilan peserta harus <strong>murni hasil karya sendiri</strong> (<em>original</em>) dan tidak melanggar hak cipta pihak lain.</li><li>Peserta wajib mengikuti seluruh <strong>jadwal dan tahapan acara</strong> yang telah ditetapkan oleh panitia.</li><li>Keputusan dewan juri bersifat <strong>mutlak dan tidak dapat diganggu gugat</strong>. [<a href="http://efestaphoria2015.blogspot.com/p/syarat-dan-ketentuan.html" rel="noopener noreferrer" target="_blank">1</a>]</li></ul><p><br></p><p><br></p><p>4. Kebijakan Pembatalan dan Perubahan Acara</p><ul><li>Penyelenggara berhak untuk mengubah susunan acara (<em>rundown</em>), waktu, atau lokasi jika terjadi keadaan darurat di luar kendali panitia (<em>force majeure</em>).</li><li>Jika acara dibatalkan sepenuhnya oleh penyelenggara, informasi mengenai prosedur pengembalian dana akan diumumkan melalui saluran resmi.</li></ul><p><br></p><p><br></p><p>5. Privasi dan Hak Publikasi</p><ul><li>Dengan menghadiri atau mengikuti acara ini, peserta memberikan izin kepada penyelenggara untuk mengambil foto, video, atau rekaman suara selama acara berlangsung.</li><li>Dokumentasi tersebut dapat digunakan oleh panitia untuk keperluan publikasi, promosi, dan media sosial tanpa kewajiban memberikan kompensasi kepada peserta.</li></ul><p><br></p><p><br></p>' WHERE title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND venue = 'ILLUA SOJU BOX, Jakarta Pusat';
UPDATE events SET terms_conditions = '<p class="ql-align-center"><u>SYARAT DAN KETENTUAN BADONCI FESTIVAL</u></p><p>1.⁠ ⁠UMUM</p><ul><li>Badonci Festival diselenggarakan oleh penyelenggara resmi PT. Sigma Pro Indonesia </li><li>Syarat dan ketentuan ini berlaku untuk semua pengunjung, peserta, artis, vendor, dan pihak terkait yang terlibat dalamacara.</li><li>Penyelenggara berhak mengubah syarat dan ketentuan kapan saja tanpa pemberitahuan terlebih dahulu, denganpembaruan akan diumumkan melalui kanal resmi festival.</li></ul><p><br></p><p>2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET</p><ul><li>Tiket hanya bisa dibeli melalui kanal resmi yang telah ditentukan LOKET.COM.</li><li>⁠Setiap tiket hanya sah untuk satu orang dan tidak dapat dipindahkan kepemilikan atau dijual kembali tanpa izinpenyelenggara.</li><li>Tiket yang hilang, rusak, atau palsu tidak akan diganti atau diterima masuk.</li><li>Pengunjung harus menunjukkan tiket berupa QR Code  atau bukti pembayaran elektronik yang valid saat masuk area festival.</li></ul><p><br></p><p>3.⁠ ⁠SYARAT MASUK AREA FESTIVAL</p><ul><li>Pengunjung di bawah umur harus ditemani oleh orang tua atau wali yang bertanggung jawab.</li><li>⁠Semua pengunjung wajib menjalani pemeriksaan keamanan sebelum masuk area festival.</li><li>⁠Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung yang tidak mematuhi peraturan atau menunjukkanperilaku yang mengganggu ketertiban.</li></ul><p><br></p><p>4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN</p><p><em>Barang terlarang:</em></p><ul><li>Senjata api, senjata tajam, dan benda berbahaya lainnya.</li><li>Narkoba, alkohol, dan zat terlarang lainnya.</li><li>⁠Bahan peledak atau bahan yang dapat menyebabkan kebakaran.</li><li>⁠Benda keras atau tajam yang dapat digunakan sebagai alat serangan.</li><li>Drinks dan makanan dari luar area festival (kecuali untuk kebutuhan kesehatan khusus dengan izin tertulis).</li></ul><p><em>Barang diizinkan (dengan pembatasan):</em></p><ul><li>Tas kecil atau ransel dengan ukuran maksimal [misal: 40x30x20 cm].</li><li>⁠Perlengkapan medis pribadi dengan izin petugas keamanan.</li><li>⁠Kamera foto/video non-profesional (tanpa tripod atau peralatan besar).</li><li>⁠Sunscreen, topi, dan payung untuk perlindungan dari cuaca.</li></ul><p><br></p><p>5.⁠ ⁠PERILAKU PENGUNJUNG</p><ul><li>Seluruh pengunjung diharapkan bertingkah laku sopan dan menghormati sesama pengunjung, artis, dan petugas acara.</li><li>Tidak diperbolehkan melakukan tindakan kekerasan, pelecehan, atau ujaran kebencian.</li><li>⁠Tidak diperbolehkan merusak atau mengganggu fasilitas dan properti festival.</li><li>Merokok hanya diperbolehkan di area merokok yang telah ditentukan.</li></ul><p><br></p><p>6.⁠ ⁠HAK DAN TANGGUNG JAWAB PENYELENGGARA</p><ul><li>Penyelenggara berhak membatalkan atau menangguhkan acara karena alasan keamanan, cuaca ekstrem, atau kondisi takterduga lainnya. Dalam hal ini, pengembalian tiket akan diatur sesuai kebijakan yang telah ditentukan.</li><li>Penyelenggara tidak bertanggung jawab atas kehilangan, kerusakan, atau cedera yang terjadi pada pengunjung akibatkelalaian pribadi atau tidak mematuhi peraturan.</li><li>Penyelenggara berhak mengambil foto atau video selama acara untuk keperluan promosi dan dokumentasi, denganpengunjung dianggap telah menyetujui penggunaan gambar tersebut.</li></ul><p><br></p><p>7.⁠ ⁠KESEHATAN DAN KEAMANAN</p><ul><li>Pengunjung dengan kondisi kesehatan khusus disarankan untuk membawa obat pribadi dan memberitahu petugas medisjika diperlukan.</li><li>Area medis tersedia di lokasi festival untuk menangani kasus darurat.</li><li><span >⁠Petugas keamanan dan petugas acara siap membantu pengunjung jika ada masalah atau keadaan darurat.</span></li></ul><p><br></p>' WHERE title = 'BADONCI FESTIVAL DISK.2' AND venue = 'Pohon Kasih Megamas, Kota Manado';
UPDATE events SET terms_conditions = '<h2>Syarat dan Ketentuan</h2><p>Dengan membeli tiket <strong>Unfamiliar Weather Showcase</strong>, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan berikut:</p><p><br></p><p><strong>Tiket dan Akses Masuk</strong></p><ul><li class="ql-indent-1">Satu tiket hanya berlaku untuk satu orang dan satu kali akses masuk.</li><li class="ql-indent-1">Pengunjung wajib menunjukkan e-ticket dengan kode QR yang masih berlaku saat memasuki lokasi acara.</li><li class="ql-indent-1">Kode QR bersifat rahasia. Kehilangan atau penyalahgunaan tiket akibat tiket dibagikan kepada pihak lain menjadi tanggung jawab pemilik tiket.</li><li class="ql-indent-1">Tiket yang telah digunakan, diduplikasi, atau tidak dapat diverifikasi akan dinyatakan tidak berlaku.</li></ul><p><strong>Pembelian dan Pengembalian Tiket</strong></p><ul><li class="ql-indent-1">Tiket yang telah dibeli tidak dapat dibatalkan, dikembalikan, ditukar, atau diuangkan kembali.</li><li class="ql-indent-1">Tiket tidak boleh diperjualbelikan kembali dengan harga yang lebih tinggi dari harga resmi.</li><li class="ql-indent-1">Panitia tidak bertanggung jawab atas tiket yang dibeli melalui pihak atau saluran tidak resmi.</li></ul><p><strong>Waktu Kehadiran</strong></p><ul><li class="ql-indent-1">Pengunjung disarankan hadir lebih awal untuk proses registrasi dan pemeriksaan sebelum pertunjukan dimulai.</li><li class="ql-indent-1">Pertunjukan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak.</li><li class="ql-indent-1">Keterlambatan pengunjung tidak menjadi dasar untuk pengembalian dana.</li></ul><p><strong>Ketertiban Selama Pertunjukan</strong></p><ul><li class="ql-indent-1">Pengunjung wajib mengikuti arahan panitia, petugas keamanan, dan pengelola lokasi.</li><li class="ql-indent-1">Pengunjung diharapkan menjaga ketenangan serta tidak mengganggu jalannya pertunjukan maupun kenyamanan pengunjung lain.</li><li class="ql-indent-1">Dilarang merokok, termasuk menggunakan rokok elektrik atau vape, di dalam area pertunjukan. Area merokok disediakan di luar aula.</li><li class="ql-indent-1">Panitia berhak menolak atau mengeluarkan pengunjung yang melakukan tindakan berbahaya, mengganggu, merusak fasilitas, atau tidak mematuhi peraturan tanpa pengembalian dana.</li></ul><p><strong>Barang yang Dilarang</strong></p><ul><li class="ql-indent-1">Senjata tajam, bahan peledak, benda berbahaya, obat-obatan terlarang, serta barang lain yang dapat membahayakan pengunjung tidak diperbolehkan dibawa ke dalam lokasi.</li><li class="ql-indent-1">Panitia berhak melakukan pemeriksaan terhadap barang bawaan pengunjung sebelum memasuki area pertunjukan.</li></ul><p><strong>Dokumentasi</strong></p><ul><li class="ql-indent-1">Pengunjung diperbolehkan mengambil foto dan video selama pertunjukan, termasuk menggunakan kamera profesional.</li><li class="ql-indent-1">Seluruh kegiatan dokumentasi harus dilakukan tanpa mengganggu jalannya pertunjukan, menghalangi pandangan, membatasi pergerakan, atau mengurangi kenyamanan pengunjung lain.</li><li class="ql-indent-1">Penggunaan lampu kilat, lampu tambahan, tripod, atau perlengkapan berukuran besar tidak diperbolehkan apabila mengganggu pertunjukan maupun pengunjung lain.</li><li class="ql-indent-1">Panitia berhak memberikan teguran atau meminta pengunjung menghentikan kegiatan dokumentasi apabila dianggap mengganggu.</li><li class="ql-indent-1">Dengan menghadiri acara, pengunjung memahami bahwa foto atau video yang menampilkan pengunjung dapat digunakan oleh In Inertia dan penyelenggara untuk keperluan dokumentasi serta publikasi acara.</li></ul><p><strong>Instalasi dan Area Pertunjukan</strong></p><ul><li class="ql-indent-1">Pengunjung wajib menjaga instalasi, perlengkapan visual, serta seluruh fasilitas yang tersedia di area acara.</li><li class="ql-indent-1">Pengunjung dilarang menyentuh, memindahkan, menaiki, atau merusak instalasi, kecuali terdapat petunjuk bahwa instalasi tersebut dapat berinteraksi langsung dengan pengunjung.</li><li class="ql-indent-1">Kerusakan yang disebabkan oleh kelalaian atau tindakan pengunjung dapat menjadi tanggung jawab pengunjung yang bersangkutan.</li></ul><p><strong>Keamanan dan Barang Pribadi</strong></p><ul><li class="ql-indent-1">Pengunjung bertanggung jawab atas keselamatan diri dan barang pribadi selama berada di lokasi acara.</li><li class="ql-indent-1">Panitia tidak bertanggung jawab atas kehilangan, kerusakan, atau tertukarnya barang pribadi.</li><li class="ql-indent-1">Pertunjukan dapat melibatkan suara keras, pencahayaan redup, efek visual, dan perubahan intensitas cahaya. Pengunjung yang memiliki sensitivitas terhadap kondisi tersebut disarankan mempertimbangkan kondisi pribadi sebelum menghadiri acara.</li></ul><p><strong>Perubahan dan Pembatalan Acara</strong></p><ul><li class="ql-indent-1">Jadwal, susunan pertunjukan, pengisi acara, tata letak, dan ketentuan acara dapat berubah apabila diperlukan karena alasan teknis, keamanan, atau keadaan di luar kendali penyelenggara.</li><li class="ql-indent-1">Apabila acara dibatalkan, informasi mengenai mekanisme pengembalian dana akan diumumkan melalui kanal resmi penyelenggara.</li><li class="ql-indent-1">Dalam keadaan kahar atau <em>force majeure</em>, termasuk bencana alam, kebijakan pemerintah, gangguan keamanan, kondisi kesehatan masyarakat, atau keadaan lain di luar kendali penyelenggara, penyelesaian tiket akan mengikuti kebijakan yang diumumkan kemudian.</li></ul><p><strong>Ketentuan Akhir</strong></p><ul><li class="ql-indent-1">Panitia berhak memperbarui syarat dan ketentuan apabila diperlukan.</li><li class="ql-indent-1">Keputusan panitia terkait pelaksanaan acara dan penerapan ketentuan bersifat final.</li><li class="ql-indent-1">Informasi resmi mengenai acara hanya disampaikan melalui kanal resmi In Inertia dan penyelenggara.</li></ul><p><br></p>' WHERE title = 'In Inertia Showcase - Unfamiliar Weather' AND venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan';
UPDATE events SET terms_conditions = '<p>Berikut adalah draf <strong >Syarat & Ketentuan (Terms & Conditions)</strong> yang standar, jelas, dan aman untuk dicantumkan di halaman penjualan tiket UNDERGROUND SUPREME di Loket.com:</p><p><br></p><h3><strong >Syarat & Ketentuan Pembelian & Masuk Event</strong></h3><p><br></p><p><span >Mohon dibaca dengan saksama demi kenyamanan dan kelancaran bersama selama rangkaian event UNDERGROUND SUPREME oleh KRAZY BRAZY KARAWANG.</span> </p><p><br></p><h3><strong >1. Pembelian & Penukaran Tiket</strong></h3><p><br></p><ul><li><strong >Saluran Resmi:</strong> Tiket resmi hanya dapat dibeli melalui platform Loket.com. Penyelenggara tidak bertanggung jawab atas penipuan atau tiket palsu yang dibeli melalui pihak ketiga atau calo.</li><li><strong >Non-Refundable:</strong> Tiket yang sudah dibeli tidak dapat dibatalkan, ditukar, atau diuangkan kembali dengan alasan apa pun, kecuali terjadi pembatalan acara oleh pihak penyelenggara.</li><li><strong >Proses Penukaran:</strong><span > Penukaran tiket </span><em >presale</em><span > menjadi gelang tanda masuk (</span><em >wristband</em><span >) dapat dilakukan di venue (District 163 Karawang) mulai hari Minggu, 25 Oktober 2026 pukul 15.00 WIB.</span> </li><li><strong >Bukti Identitas:</strong> Pengunjung wajib menunjukkan E-Voucher resmi dari Loket.com beserta kartu identitas asli yang sah (KTP/SIM/Paspor/Kartu Pelajar) yang sesuai dengan nama saat pembelian tiket.</li></ul><h3><strong >2. Batasan Usia & Akses Masuk</strong></h3><p><br></p><ul><li><strong >Ketentuan Usia:</strong><span > Mengingat target audiens event ini adalah segmen usia 15–30 tahun, pengunjung di bawah usia 15 tahun wajib didampingi oleh orang tua atau orang dewasa.</span> </li><li><strong >Hak Masuk:</strong> Penyelenggara berhak menolak masuk atau mengeluarkan pengunjung dari area venue jika tidak mematuhi peraturan yang berlaku atau membuat kerusuhan demi kenyamanan pengunjung lain.</li></ul><h3><strong >3. Protokol Keamanan & Barang Bawaan</strong></h3><p><br></p><ul><li><strong >Pemeriksaan Barang:</strong><span > Seluruh pengunjung wajib melewati prosedur pemeriksaan keamanan (</span><em >body check</em><span > & </span><em >bag check</em><span >) oleh petugas sebelum memasuki area konser indoor District 163 Karawang.</span> </li><li><strong >Barang yang Dilarang:</strong> Pengunjung <strong >dilarang keras</strong> membawa barang-barang berikut ke dalam venue:</li><li class="ql-indent-1">Senjata api, senjata tajam, atau benda berbahaya lainnya.</li><li class="ql-indent-1">Narkoba, psikotropika, dan zat adiktif terlarang lainnya.</li><li class="ql-indent-1">Makanan dan minuman dari luar venue.</li><li class="ql-indent-1">Kamera profesional (DSLR/Mirrorless) tanpa izin tertulis atau <em >press pass</em> dari panitia.</li><li class="ql-indent-1">Rokok elektrik (vape/pod) atau rokok konvensional yang dinyalakan di area tertutup (non-smoking area).</li></ul><h3><strong >4. Kebijakan Dokumentasi & Hak Gambar</strong></h3><p><br></p><ul><li><strong >Dokumentasi Acara:</strong><span > Pihak KRAZY BRAZY KARAWANG beserta media partner resmi berhak mengambil foto, video, dan rekaman audio pengunjung selama acara berlangsung untuk keperluan publikasi, media sosial, dan pembuatan </span><em >Video Rekap Exclusive</em><span >.</span> </li><li><strong >Persetujuan Hak Cipta:</strong> Dengan membeli tiket dan menghadiri event ini, pengunjung memberikan izin penuh kepada penyelenggara untuk menggunakan dokumentasi tersebut tanpa kompensasi apa pun.</li></ul><p><span >Dengan melakukan pembelian tiket UNDERGROUND SUPREME, Anda dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan di atas. Sampai jumpa di moshpit!</span> </p><p><br></p>' WHERE title = 'Underground Supreme' AND venue = 'District 163, Kab. Karawang';
UPDATE events SET terms_conditions = '<table class="content toc cke_show_border"><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr></tr></tbody><tbody><tr><td>
			<p><strong><font size="2">SYARAT & KETENTUAN - Titik Sadrah for Revenge </font></strong></p>
			<meta charset="utf-8"><p dir="ltr"><font size="2">Dengan membeli tiket <strong>Titik Sadrah for Revenge</strong>, Anda telah menyetujui seluruh Syarat & Ketentuan yang berlaku di bawah ini. Harap baca dengan saksama demi kenyamanan dan keselamatan semua pihak yang terlibat, terutama anak-anak dan keluarga.</font></p>

			<p dir="ltr"><font size="2">Dengan membeli dan/atau menggunakan tiket ini, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh isi dokumen ini sebagai bentuk perjanjian yang mengikat antara pengunjung dan penyelenggara. Syarat & Ketentuan ini berlaku setara dengan kontrak dan dapat dijadikan acuan hukum apabila terjadi pelanggaran.</font></p>

			<p><strong><font size="2">PEMBELIAN TIKET</font></strong></p>

			<ul><li aria-level="1" dir="ltr"><font size="2"><i>Tiket hanya dapat dibeli melalui </i><a href="http://forrevenge.id" rel="noopener noreferrer" target="_blank"><span style="color:#FF0000;"><i><strong><u>forrevenge.id</u></strong></i></span></a><span style="color:#FF0000;"><i><strong> </strong></i></span></font></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Harga tiket belum termasuk: Pajak Hiburan Daerah 10%, Biaya Admin 5%, dan Biaya platform pembayaran.</font></i></li>
				<li aria-level="1" dir="ltr"><font size="2">Gunakan data identitas yang valid (KTP/SIM/Paspor) saat membeli tiket. Tiket tidak dapat diubah setelah pembelian.</font></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Setiap transaksi Presale dan General Sale maksimal dapat membeli 4 (empat) tiket menggunakan data diri yang berbeda.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Satu tiket berlaku untuk satu orang dan tidak dapat digunakan untuk keluar-masuk (no re-entry).</font></i></li>
				<li aria-level="1" dir="ltr"><font size="2">Tiket bersifat digital dan akan tersedia H-5 konser melalui aplikasi <strong>Loket X</strong> (tersedia di Play Store dan App Store). </font></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Tiket ini hanya untuk keperluan pribadi. Dilarang dijual kembali atau digunakan untuk kepentingan komersial tanpa izin promotor.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Pelanggaran terhadap ketentuan pembelian tiket dapat menyebabkan pembatalan tiket tanpa pengembalian dana.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Semua penjualan bersifat final. Tidak ada pengembalian dana, pertukaran, atau pengalihan kepemilikan.</font></i></li>
			</ul><p dir="ltr"><strong><font size="2">PEMBELIAN TIKET Add-on</font></strong></p>

			<ul><li aria-level="1" dir="ltr"><font size="2">Terdapat tiga jenis <i>Add-on Benefit</i> yang dapat dibeli pada tanggal 12 Juli 2026 melalui <a href="http://forrevenge.id" rel="noopener noreferrer" target="_blank"><span style="color:#FF0000;"><i><strong><u>forrevenge.id</u></strong></i></span></a><span style="color:#FF0000;"><i><strong> </strong></i></span>: </font>

				<ul><li aria-level="2" dir="ltr"><font size="2">Exclusive T-Shirt Long Sleeve </font></li>
					<li aria-level="2" dir="ltr"><font size="2">Exclusive T-Shirt Short Sleeve </font></li>
					<li aria-level="2" dir="ltr"><font size="2">Exclusive CD Set Perayaan Patah Hati - Babak 2 </font></li>
				</ul></li>
				<li aria-level="1" dir="ltr"><font size="2"><i>Add-on Benefit</i> ini memberikan akses tambahan di luar tiket konser, namun tidak dapat dibeli tanpa memiliki tiket konser terlebih dahulu.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Cara Pembelian <i>Add-on Benefit</i> </font>
				<ul><li aria-level="2"><font size="2"><i>Add-on Benefit</i> bersifat opsional dan dibeli secara terpisah setelah membeli tiket konser (Festival A/Festival B). Apabila dalam satu transaksi terdapat lebih dari 1 (satu) tiket konser, maka dapat membeli add-on benefit sesuai dengan jumlah tiket konser yang dimiliki.</font></li>
					<li aria-level="2"><font size="2">Pemegang satu (1) tiket konser dapat membeli seluruh jenis add-on benefit yang tersedia. </font></li>
					<li aria-level="2"><font size="2">Setiap Jenis add-on benefit hanya dapat dibeli maksimal satu (1) item per satu (1) tiket konser. </font></li>
					<li aria-level="2"><font size="2"><i>Add-on Benefit</i> dapat dibeli dalam kombinasi apa pun. Sebagai contoh: <i>pemegang satu (1) tiket konser dapat membeli 1 Exclusive T-Shirt Long Sleeve <strong>+</strong> 1 Exclusive T-Shirt Short Sleeve <strong>+</strong> 1 Exclusive CD Set Perayaan Patah Hati - Babak 2 </i></font></li>
				</ul></li>
			</ul><p><strong><font size="2">AKSES MASUK AREA KONSER </font></strong></p>

			<ul><li aria-level="2" dir="ltr"><font size="2"><i>Add-on Benefit</i> tidak berfungsi sebagai tiket masuk.</font></li>
				<li aria-level="2" dir="ltr"><font size="2">QR Code <i>Add-on Benefit</i> hanya digunakan untuk verifikasi benefit tambahan pada hari acara.</font></li>
				<li aria-level="2" dir="ltr"><font size="2">Untuk memasuki area konser, Anda harus tetap menggunakan QR Code dari tiket konser pada aplikasi <strong>Loket X</strong>.</font><br></li>
			</ul><p><strong><font size="2">BATASAN UMUR</font></strong></p>

			<ul><li aria-level="1" dir="ltr"><i><font size="2"><strong>Usia 17 tahun ke atas:</strong> Diperbolehkan menonton konser dan membeli tiket secara mandiri.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2"><strong>Usia 2 - 16 tahun:</strong> Diperbolehkan menonton konser dengan pendampingan orang dewasa (minimal berusia 17 tahun) dan wajib memiliki tiket. Pembelian tiket untuk anak harus dilakukan oleh orang dewasa yang mendampingi.</font></i></li>
				<li aria-level="1" dir="ltr"><font size="2"><i><strong>Usia di bawah 0 - 2 tahun:</strong> Tidak diperbolehkan masuk ke area konser.</i></font></li>
			</ul><p><strong><font size="2">PERINGATAN KESELAMATAN</font></strong></p>

			<ul><li aria-level="1" dir="ltr"><i><strong><font size="2">Konser akan menampilkan cahaya intens dan suara keras yang dapat menyebabkan gangguan kesehatan, terutama bagi pengunjung dengan kondisi medis seperti epilepsi fotosensitif, gangguan pendengaran, dan gangguan sensorik lainnya. </font></strong></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2"><strong>Harap gunakan </strong><strong>ear protection</strong><strong> jika Anda memiliki sensitivitas berlebih dengan suara keras dan konsultasikan dengan tenaga medis apabila memiliki kondisi khusus.</strong></font></i></li>
				<li aria-level="1" dir="ltr"><i><strong><font size="2">Pengunjung dengan kondisi medis serius (seperti gangguan jantung, tekanan darah tinggi, gangguan pernapasan, atau kondisi kronis lainnya) sangat disarankan untuk tidak menghadiri konser demi keselamatan pribadi.</font></strong></i></li>
				<li aria-level="1" dir="ltr"><i><strong><font size="2">Setiap pengunjung bertanggung jawab atas keselamatan diri sendiri dengan mempertimbangkan kondisi pribadi dan risiko yang mungkin timbul dari paparan cahaya intens, suara keras, kerumunan, serta kondisi area acara.</font></strong></i></li>
			</ul><p dir="ltr"><br><font size="2"><strong>INFORMASI PENONTON</strong></font></p>

			<ul><li aria-level="1" dir="ltr"><i><font size="2"><strong>Tidak tersedia tempat penitipan barang</strong>. Hindari membawa koper, tas besar, atau barang berukuran besar.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Tiket hanya berlaku untuk pemilik terdaftar. Tiket yang digandakan atau disalahgunakan akan dibatalkan tanpa pengembalian dana.</font></i></li>
				<li aria-level="1" dir="ltr"><font size="2"><i>Demi kenyamanan dan keamanan bersama, pengunjung wajib:</i> </font>
				<ul><li aria-level="2" dir="ltr"><i><font size="2">Mengikuti seluruh petunjuk dari petugas keamanan dan panitia</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Tidak melakukan tindakan provokatif, berbahaya, atau mengganggu pengunjung lain</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Tidak memanjat panggung, pagar pembatas, atau area terlarang lainnya</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Tidak membuang sampah sembarangan</font></i></li>
				</ul></li>
				<li aria-level="1" dir="ltr"><font size="2"><i>Panitia berhak menolak masuk atau mengeluarkan pengunjung tanpa pengembalian dana jika:</i> </font>
				<ul><li aria-level="2" dir="ltr"><i><font size="2">Tidak memiliki tiket sah</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Mengganggu kenyamanan atau keamanan</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Dalam pengaruh alkohol/narkoba</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Membawa barang terlarang</font></i></li>
					<li aria-level="2" dir="ltr"><i><font size="2">Melanggar arahan keamanan atau tata tertib area acara</font></i></li>
				</ul></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Dalam kondisi force majeure (pembatalan dari artis, terjadi bencana alam, kebijakan pemerintah, dll.), pengembalian dana akan mengikuti kebijakan promotor. Biaya tambahan seperti penginapan dan transportasi tidak ditanggung penyelenggara.</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Penyelenggara, panitia, artis, dan pihak terkait lainnya tidak bertanggung jawab atas kehilangan, pencurian, kerusakan barang, atau kecelakaan di area konser.</font></i></li>
			</ul><p dir="ltr"><br><font size="2"><strong>BARANG-BARANG DILARANG</strong></font></p>

			<p dir="ltr"><font size="2">Demi keselamatan dan kelancaran acara, berikut adalah barang-barang yang tidak diperbolehkan dibawa ke dalam area konser:</font></p>

			<ul><li aria-level="1" dir="ltr"><i><font size="2">Makanan dan minuman dari luar</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Alkohol dan narkoba</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Senjata tajam, senjata api, atau benda berbahaya lainnya</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Laser pointer, kembang api, petasan, dan benda eksplosif lainnya</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Kamera profesional (SLR/DSLR), kamera dengan lensa lepas, drone, tripod, monopod (selfie sticks), kamera aksi (GoPro dan sejenisnya)</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Peralatan perekam suara atau video</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Tablet, laptop, dan alat elektronik berukuran besar</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Brosur, pamflet, atau barang promosi tanpa izin</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Payung besar dan benda berukuran besar lainnya</font></i></li>
				<li aria-level="1" dir="ltr"><i><font size="2">Hewan peliharaan</font></i></li>
				<li aria-level="1" dir="ltr"><font size="2">Vape dan rokok tidak tersegel lebih dari 1 bungkus.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Parfum lebih dari 50ml</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Benda apapun yang dapat digunakan untuk merusak ketertiban, membahayakan keselamatan pengunjung, dan/atau menimbulkan kerusakan pada manusia ataupun barang, berdasarkan keputusan mutlak dari panitia konser</font></li>
			</ul><p dir="ltr"><font size="2">Barang-barang yang dilarang akan disita dan tidak dikembalikan. Pelanggaran terhadap aturan ini dapat mengakibatkan pengunjung dikeluarkan dari area konser tanpa pengembalian uang tiket.</font></p>

			<p dir="ltr"> </p>

			<p dir="ltr"><strong><font size="2">BARANG-BARANG YANG DIPERBOLEHKAN</font></strong></p>

			<ul><li aria-level="1" dir="ltr"><font size="2">Kamera analog tanpa lensa lepas, digicam, dan polaroid.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Tumbler kosong atau berisi air mineral. </font></li>
			</ul><p dir="ltr"><br><font size="2"><strong>REKAMAN DAN PUBLIKASI</strong></font></p>

			<ul><li aria-level="1" dir="ltr"><font size="2">Pengunjung dilarang mengunggah video konser berdurasi lebih dari 30 detik per lagu ke media sosial.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Penyelenggara memiliki hak untuk merekam dan menggunakan dokumentasi konser, termasuk gambar atau pernyataan pengunjung, untuk keperluan promosi tanpa kompensasi.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Dengan hadir di area konser, pengunjung melepaskan dan membebaskan penyelenggara serta afiliasinya dari segala bentuk klaim, tuntutan, atau kompensasi yang berkaitan dengan dokumentasi tersebut.</font></li>
			</ul><p dir="ltr"><br><font size="2"><strong>PERUBAHAN DAN PENYESUAIAN</strong></font></p>

			<ul><li aria-level="1" dir="ltr"><font size="2">Penyelenggara berhak mengubah layout acara, menyesuaikan Syarat & Ketentuan, dan mengambil tindakan pengamanan jika dibutuhkan tanpa pemberitahuan terlebih dahulu.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Penyelenggara tidak bertanggung jawab atas kerugian tidak langsung, konsekuensial, atau insidental yang timbul akibat perubahan, penundaan, atau pembatalan acara.</font></li>
				<li aria-level="1" dir="ltr"><font size="2">Setiap pembaruan akan diinformasikan melalui kanal resmi promotor.</font></li>
			</ul><p dir="ltr"> </p>

			<p dir="ltr"><font size="2">Terima kasih telah mendukung Titik Sadrah for Revenge. Mari kita rayakan setiap kisah dan karya for Revenge dalam suasana yang aman, nyaman, dan penuh makna. </font></p>

			<p dir="ltr"><strong><font size="2">Selamat menikmati Titik Sadrah for Revenge</font></strong></p>
			</td>
		</tr></tbody></table>' WHERE title = 'Titik Sadrah for Revenge' AND venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung';
UPDATE events SET terms_conditions = '<p><p><strong>Syarat dan Ketentuan / Terms &amp; Conditions</strong></p></p><p><p>Dengan membeli tiket&nbsp;<strong>Memories Of The Soul</strong>, Pembeli Tiket dan Pemegang Tiket dianggap telah membaca, memahami, dan menyetujui seluruh Syarat &amp; Ketentuan yang berlaku.</p></p><p><p>&nbsp;</p></p><p><p><strong>Ticketing &amp; Admission</strong></p></p><p><p>Satu tiket berlaku untuk 1 (satu orang) pada 1 (satu) kali jadwal pertunjukan.</p></p><p><p>Pembeli Tiket wajib menunjukkan e-ticket yang valid untuk memasuki area acara.</p></p><p><p>Tiket yang telah dipindai (scan) dianggap telah digunakan dan tidak dapat digunakan kembali.</p></p><p><p>Tiket yang telah dibeli tidak dapat ditukar, dibatalkan, ataupun diuangkan kembali.</p></p><p><p>Penyelenggara berhak menolak akses masuk apabila tiket tidak valid, rusak, atau terindikasi duplikasi.</p></p><p><p>Dilarang memperjualbelikan kembali tiket dengan harga di atas harga resmi yang telah ditentukan oleh Penyelenggara.</p></p><p><p>&nbsp;</p></p><p><p>Pertunjukan ini dianjurkan untuk penonton usia 5 tahun ke atas.</p></p><p><p>Anak di bawah usia 5 tahun dilarang memasuki ruangan teater dan dilarang membeli tiket.</p></p><p><p>Anak di atas 5 tahun yang ikut menonton wajib memiliki tiket sendiri.</p></p><p><p>Penonton wajib hadir sesuai jadwal yang dipilih dan duduk sesuai nomor kursi yang dipilih.</p></p><p><p>&nbsp;</p></p><p><p><strong>Ketertiban &amp; Kenyamanan</strong></p></p><p><p>Penonton wajib mengikuti arahan petugas keamanan dan panitia selama acara berlangsung.</p></p><p><p>Penyelenggara berhak mengeluarkan penonton dari area acara apabila dianggap melakukan tindakan yang mengganggu, berbahaya, diskriminatif, atau melanggar hukum tanpa pengembalian dana.</p></p><p><p>&nbsp;</p></p><p><p><strong>Barang yang Tidak Diperbolehkan</strong></p></p><p><p>Membawa Makanan dan Minuman ke dalam ruangan Teater</p></p><p><p>Senjata tajam, benda berbahaya, dan bahan mudah terbakar</p></p><p><p>Minuman beralkohol, narkotika, dan zat terlarang lainnya.</p></p><p><p>Kamera profesional (DSLR/mirrorless) dan peralatan recording profesional tanpa izin resmi.</p></p><p><p>&nbsp;</p></p><p><p><strong>PERHATIAN</strong></p></p><p><p>Tiket hanya dijual melalui kanal resmi yang telah ditentukan oleh Penyelenggara. Penyelenggara tidak bertanggung jawab atas pembelian tiket melalui pihak tidak resmi atau calo.</p></p><p><p>Biaya Pajak, biaya administrasi dan biaya platform di tanggung oleh Penonton</p></p><p><p>Penyelenggara tidak bertanggung jawab atas segala kelalaian yang mengakibatkan e-voucher dan gelang salah tempat atau hilang.</p></p><p><p>Penyelenggara berhak menolak masuk ke area konser jika tiket sudah digunakan orang lain dan tiket tersebut tidak sah.</p></p><p><p>Penyelenggara dapat melakukan tindakan hukum perdata dan pidana terhadap penonton yang memperoleh tiket secara ilegal, termasuk penggandaan tiket atau mendapatkan tiket melalui prosedur pembelian tidak resmi.</p></p><p><p>Penyelenggara tidak bertanggung jawab atas kehilangan, kerusakan, atau pencurian barang pribadi selama acara berlangsung.</p></p><p><p>&nbsp;</p></p><p><p>Untuk informasi terkait dengan&nbsp;<strong>Memories Of The Soul</strong>&nbsp;bisa di cek melalui akun instagram https://www.instagram.com/alunanmusik.nostalgia/</p></p>' WHERE title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND venue = 'Balai Sarbini, DKI Jakarta';
UPDATE events SET terms_conditions = '<table class="content toc"><tbody><tr></tr></tbody><tbody><tr><td>
			<ol><li>Tiket yang sah adalah yang dibeli melalui Loket.com. Promotor tidak bertanggungjawab terhadap validitas tiket yang dibeli dari pihak ketiga.</li>
				<li>Tiket berlaku untuk 1 orang, 1 kali masuk venue, tidak diperkenankan re-entry.</li>
				<li>Pemegang <strong>Tiket VIP</strong> masuk melalui gate khusus, mendapat area khusus di depan stage dengan kapasitas terbatas. Tiket VIP ditukarkan dengan gelang/ID. Boleh keluar-masuk area VIP dengan menunjukkan gelang/ID.</li>
				<li>Disediakan gate khusus prioritas: anak-anak, ibu hamil, lanisa, dan penonton berkebutuhan khusus. Harap menghubungi petugas untuk mendapat bantuan.</li>
				<li>Harap membawa tiket dari Loket.com pada saat memasuki venue. Tiket tidak perlu di-print, cukup ditunjukkan di gate untuk di-scan oleh petugas.</li>
				<li>Penyelenggara memiliki hak untuk:<br>
				- Melarang masuk pengunjung jika tiket telah dipergunakan oleh orang lain.<br>
				- Melarang masuk pengunjung ke area venue jika tiket tidak valid.<br>
				- Memproses atau mengajukan hukum, baik perdata atau kriminal kepada pengunjung yang mendapatkan tiket dengan ilegal, termasuk memalsukan dan menggandakan tiket yang sah atau mendapatkan tiket dengan cara yang tidak sesuai prosedur.</li>
				<li>Penyelenggara/Promotor tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan E-voucher/tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk di gunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/menukarkan E-voucher.</li>
				<li>Ticket yang telah dibeli tidak dapat diuangkan kembali dengan alasan apapun.</li>
				<li>Pihak penyelenggara akan menindak tegas, dan berhak mengeluarkan pengunjung apabila berperilaku tidak tertib, dalam pengaruh alkohol, menyinggung atau berperilaku yang tidak pantas, dan tamu yang menolak untuk mematuhi instruksi / peringatan dari staf festival / event. Tidak akan ada pengembalian uang.</li>
				<li>Tamu bertanggung jawab sepenuhnya atas keamanan semua barang-barang pribadi. Kehilangan barang pribadi bukan tanggung jawab panitia.</li>
				<li>Dilarang membawa makanan dan minuman dari luar ke dalam venue.</li>
				<li>Dilarang membawa dan menggunakan segala obat-obatan terlarang, narkoba, psikotropika, atau barang-barang yang mengandung zat berbahaya lainnya.</li>
				<li>Dilarang membawa senjata tajam/api, bahan peledak, serta benda-benda yang dilarang berdasarkan ketentuan perundangan yang berlaku ke dalam venue.</li>
				<li>Jika terjadi pembatalan pertunjukkan di kemudian hari maka pembelian tiket akan dikembalikan sesuai dengan ketentuan promotor.</li>
				<li>Penyelenggara, promotor, dan artis tidak bertanggung jawab atas kompensasi dan/atau biaya pembatalan untuk biaya perjalanan yang Anda keluarkan apabila festival/acara yang dibatalkan atau ditunda.</li>
				<li>Harga tercantum belum termasuk biaya admin dan PPN, kecuali disebutkan lain.</li>
			</ol></td>
		</tr></tbody></table>' WHERE title = 'PGR Vol. 11 @Jakarta' AND venue = 'JIExpo Kemayoran, Jakarta Pusat';
UPDATE events SET terms_conditions = '<p><strong>Peraturan Pengunjung</strong></p><ol><li>Wajib menunjukkan e-ticket beserta identitas diri saat masuk.</li><li>Dilarang membawa senjata tajam, narkoba, minuman keras, dan barang berbahaya lainnya.</li><li>Dilarang membawa makanan dan minuman dari luar area acara.</li><li>Penyelenggara berhak melakukan pemeriksaan barang bawaan demi keamanan bersama.</li><li>Dengan membeli tiket, pengunjung dianggap menyetujui seluruh ketentuan yang berlaku.</li></ol><p><br></p><p>Follow Instagram & tiktok: <strong>@jongmesoedjinen</strong> untuk informasi terbaru mengenai line up, rundown, dan berbagai kejutan lainnya.</p><p><br></p><p>Sampai jumpa di <strong>JONGFEST 2026</strong>! 🔥🎶</p>' WHERE title = 'JONGFEST 2026' AND venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang';
UPDATE events SET terms_conditions = '<p class="ql-align-center"><strong >TERMS & CONDITIONS</strong></p><p class="ql-align-center"><strong >HIGH SCHOOL FEST 2026</strong></p><p class="ql-align-center"><br></p><p class="ql-align-center"><em >28–29 November 2026 • Stadion Madya GBK, Jakarta</em></p><p><span >Dengan membeli tiket High School Fest 2026 (“HSF”), kamu dianggap telah membaca, memahami, menyetujui, dan bersedia mengikuti seluruh syarat dan ketentuan yang berlaku selama acara berlangsung. Please read this carefully before coming to the festival.</span></p><p><br></p><p><strong >1. PEMBELIAN & PENGGUNAAN TIKET</strong></p><ul><li><span >Tiket resmi hanya dapat dibeli melalui official ticketing partner yang ditunjuk oleh penyelenggara. Penyelenggara tidak bertanggung jawab atas tiket yang dibeli melalui pihak atau kanal tidak resmi.</span></li><li><span >1 (satu) tiket berlaku untuk 1 (satu) orang sesuai kategori dan tanggal yang tertera pada tiket.</span></li><li><span >Tiket tidak boleh diperjualbelikan atau digunakan untuk kepentingan komersial, promosi, kontes, giveaway, atau kegiatan lainnya tanpa persetujuan tertulis dari penyelenggara.</span></li><li><span >Penyelenggara berhak membatalkan tiket yang diperoleh atau digunakan dengan cara yang melanggar ketentuan.</span></li><li><span >Batas maksimal pembelian tiket per transaksi mengikuti ketentuan yang tercantum pada masing-masing kategori tiket.</span></li><li><span >Jaga tiket dan data pembelianmu. Penyelenggara tidak bertanggung jawab atas tiket atau e-ticket yang hilang, disalahgunakan, atau berpindah tangan karena kelalaian pemilik.</span></li><li><span >E-ticket akan dikirimkan dalam bentuk QR code yang akan di kirimkan via e-mail kalian.</span></li><li><span >Mohon data - data dapat diisi dengan benar pada halaman checkout, karena segala macam kesalahan dalam memasukkan data - data, bukan menjadi tanggung jawab pihak promotor.</span></li><li><strong >PIHAK PROMOTOR TIDAK MENYEDIAKAN ATAU MENJUAL TIKET DALAM BENTUK WRISTBAND, ID PASS, MAUPUN BENTUK TIKET FISIK LAINNYA</strong></li></ul><p><br></p><p><strong >2. E-TICKET & CHECK-IN</strong></p><ul><li><span >E-ticket akan tersedia melalui kanal resmi ticketing sesuai mekanisme pembelian.</span></li><li><span >Saat check-in atau penukaran tiket, pengunjung wajib menunjukkan e-ticket dan identitas yang sesuai apabila diminta oleh panitia atau crew ground-handling.</span></li><li><span >E-ticket bersifat pribadi dan tidak diperbolehkan untuk dibagikan ke orang lain. Barcode/QR code yang telah digunakan tidak dapat digunakan kembali.</span></li><li><span >Informasi mengenai check-in, penukaran tiket, dan gate akan diumumkan melalui kanal resmi High School Fest.</span></li></ul><p><br></p><p><strong >3. REFUND, EXCHANGE & EVENT CHANGES</strong></p><ul><li><span >Tiket yang telah dibeli bersifat final dan tidak dapat ditukar, dialihkan, maupun dikembalikan (refund) dengan alasan apa pun. </span></li><li><span >Apabila terjadi pembatalan acara, kebijakan refund akan mengikuti ketentuan resmi yang diumumkan oleh penyelenggara.</span></li><li><span >Jadwal, performer, program, venue area, dan ketentuan acara dapat berubah sewaktu-waktu. Setiap perubahan akan diinformasikan melalui kanal resmi HSF.</span></li><li><span >Biaya pribadi seperti transportasi, akomodasi, atau biaya lainnya di luar harga tiket bukan menjadi tanggung jawab penyelenggara.</span></li></ul><p><br></p><h3><strong >4. BARANG YANG DILARANG & DIPERBOLEHKAN</strong></h3><p><strong >        Barang yang tidak diperbolehkan dibawa masuk ke area acara:</strong></p><ul><li><span >Senjata tajam, senjata api, atau benda lain yang berpotensi membahayakan.</span></li><li><span >Rokok, </span><strong >kecuali dalam keadaan masih tersegel</strong><span >.</span></li><li><span >Narkotika, obat-obatan terlarang, dan zat ilegal lainnya.</span></li><li><span >Makanan dan minuman dari luar venue.</span></li><li><span >Payung.</span></li><li><span >Flare, kembang api, bahan mudah terbakar, laser pointer, dan benda lain yang berpotensi memicu kebakaran.</span></li><li><span >Drone, kamera profesional, serta lensa tele/jarak jauh.</span></li><li><span >Tongsis/selfie stick, tripod, monopod, pengeras suara/TOA, tiang banner, dan bendera.</span></li><li><span >Peralatan audio/video profesional lainnya yang tidak diperkenankan oleh penyelenggara.</span></li><li><span >Hewan peliharaan.</span></li><li><span >Benda lain yang dinilai dapat membahayakan atau mengganggu keamanan dan kenyamanan acara berdasarkan keputusan petugas.</span></li></ul><p><strong >        Barang yang diperbolehkan dibawa masuk dengan ketentuan:</strong></p><ul><li><span >Botol minum berbahan non-kaca, </span><strong >dalam keadaan kosong saat melewati pemeriksaan di gate</strong><span >.</span></li><li><span >Kosmetik dan kebutuhan pribadi dalam jumlah yang wajar.</span></li><li><span >Jas hujan.</span></li><li><span >Stroller anak dan kursi roda, dengan tetap mengikuti arahan petugas.</span></li><li><span >Parfum dengan kapasitas maksimal </span><strong >15 ml</strong><span > atau ukuran travel size.</span></li></ul><h3><strong >5. FOTO, VIDEO & KONTEN</strong></h3><ul><li><span >Kamera pribadi diperbolehkan selama tidak menggunakan peralatan yang termasuk dalam daftar barang yang dilarang.</span></li><li><span >Live streaming, penggunaan drone, serta aktivitas dokumentasi untuk kepentingan komersial tanpa izin dari penyelenggara tidak diperbolehkan.</span></li><li><span >Penggunaan flash dapat dibatasi atau dilarang pada momen tertentu demi menjaga kenyamanan performer dan pengunjung.</span></li><li><span >Penyelenggara berhak mengambil foto, video, atau rekaman suasana selama acara berlangsung yang dapat menampilkan pengunjung untuk keperluan dokumentasi, publikasi, dan promosi HSF.</span></li></ul><p><strong >6. ADMISSION & RE-ENTRY</strong></p><ul><li><span >Pengunjung wajib menggunakan tiket/tanda masuk sesuai ketentuan selama berada di area festival.</span></li><li><span >Barcode/QR pada tiket dapat dipindai saat memasuki venue.</span></li><li><span >Pengunjung yang tidak mematuhi prosedur security check dapat ditolak masuk.</span></li><li><span >Setelah keluar dari venue, pengunjung tidak dapat masuk kembali ke area venue.</span></li><li><span >Tiket atau akses masuk dapat dinyatakan hangus apabila ditemukan pelanggaran terhadap ketentuan HSF.</span></li></ul><p><strong >7. SAFETY & CODE OF CONDUCT</strong></p><ul><li><span >HSF berkomitmen menciptakan festival yang aman, nyaman, dan welcoming untuk semua.</span></li><li><span >Segala bentuk pelecehan, kekerasan, diskriminasi, tindakan mengganggu, atau perilaku yang membahayakan orang lain tidak ditoleransi.</span></li><li><span >Pengunjung wajib mengikuti arahan panitia dan petugas keamanan selama acara.</span></li><li><span >Penyelenggara berhak mengeluarkan pengunjung dari venue apabila melakukan pelanggaran, mengganggu ketertiban, atau dianggap membahayakan keamanan dan kenyamanan orang lain. Tiket yang telah dibeli tidak akan mendapatkan refund.</span></li><li><span >Dilarang melempar barang ke panggung atau area penonton. Keep yourself and everyone around you safe.</span></li><li><span >Acara dapat menggunakan suara dengan volume tinggi serta lighting/visual effects yang intens.</span></li></ul><p><strong >8. PERUBAHAN KETENTUAN</strong></p><p><span >Penyelenggara berhak mengubah, menambah, atau memperbarui Terms & Conditions ini apabila diperlukan. Pastikan kamu selalu mengecek informasi terbaru melalui kanal resmi High School Fest sebelum datang ke acara.</span></p><p><strong >FOR MORE INFO</strong></p><p><span >Follow dan cek seluruh update resmi High School Fest untuk informasi ticketing, lineup, rundown, venue, gate, dan ketentuan terbaru.</span></p>' WHERE title = 'HIGH SCHOOL FEST 2026' AND venue = 'Stadiun Madya B, GBK, Jakarta Selatan';
-- ============================================================
-- MANUAL T&C (pasted from official event sites) + SEATMAPS
-- ============================================================
UPDATE events SET terms_conditions = 'Terms & Conditions

General

Ticket(s) are sold by the Promoters directly to the consumer. Any tickets purchased by businesses or traders in breach of the Terms & Conditions of ticket sale will be canceled. By accepting these terms and conditions you confirm that you are a consumer.
Tiket dijual secara langsung oleh Promotor ke konsumen. Tiket apa pun yang dibeli oleh pelaku usaha atau pedagang yang melanggar Syarat & Ketentuan penjualan tiket akan dibatalkan. Dengan menerima syarat dan ketentuan ini, Anda mengkonfirmasi bahwa Anda adalah konsumen.

Tickets ownership cannot be transferred for commercial purposes, including but not limited to prizes, competitions, contests or sweepstakes. Tickets sold or used in breach of this condition may be nullified without a refund, where the Ticket Holder will be refused admission into the concert area with no exception. The promoter is not responsible for the negligence of the Ticket Buyer which results in the ticket falling into the hands of other parties which can be used as an entry requirement, thereby eliminating the Ticket Buyer''s rights to enter the venue area.
Tiket tidak dapat dialihkan kepemilikan dengan tujuan komersial, termasuk namun tidak terbatas kepada hadiah, kompetisi, kontes, atau undian. Tiket yang dijual atau digunakan dengan melanggar persyaratan ini dapat dibatalkan tanpa pengembalian dana, dan Pemegang Tiket akan ditolak masuk ke dalam area acara tanpa terkecuali. Penyelenggara tidak bertanggung jawab atas kelalaian Pembeli Tiket yang mengakibatkan Tiket jatuh ke tangan orang lain dan dipergunakan sebagai tanda masuk, sehingga menghilangkan hak Pembeli Tiket untuk masuk ke area acara.

Your Ticket/s will IMMEDIATELY BECOME INVALID if resold OR OFFERED FOR SALE. Tickets sold via third parties or other unauthorized outlets, including online auction sites are not valid for admission. The resale of a Ticket renders it invalid and may lead to refusal of entry.
Tiket Anda LANGSUNG MENJADI TIDAK VALID jika dijual kembali ATAU DITAWARKAN UNTUK DIJUAL. Tiket yang dijual melalui pihak ketiga dan outlet tidak resmi lainnya, termasuk situs lelang online tidak berlaku untuk tiket masuk. Penjualan kembali Tiket menjadikannya tidak sah dan dapat menyebabkan penolakan masuk.

Every Ticket Holder who comes to the event area is responsible for their own safety, health and personal security. The Band/promoter/Management are not responsible for, including but not limited to any injury or damage that may occur to Ticket Holders during or in the event.
Setiap Pemegang Tiket yang datang ke area acara bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya sendiri. Para Band/Penyelenggara/Manajemen tidak bertanggung jawab untuk, termasuk namun tidak terbatas pada cedera atau kerusakan yang mungkin terjadi kepada Pemegang Tiket selama atau di dalam acara tersebut.

Your Ticket purchase constitutes a personal, revocable license and, at all times, remains the property of the promoters.
Tiket Anda merupakan lisensi pribadi yang dapat dibatalkan dan, sepanjang waktu, tetap menjadi milik promotor.

All ticket sales are final. Tickets that have been sold cannot be exchanged and can not be cashed out.
Semua penjualan Tiket adalah final. Tiket yang telah terjual tidak dapat ditukar dan tidak dapat diuangkan kembali.

By purchasing the tickets for the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA, you agree to the collection, storage and limited use of your personal data for the purposes of the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA in accordance with Indonesian prevailing regulations concerning Personal Data Protection.
Dengan membeli Tiket acara ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA, Anda telah menyetujui pengumpulan, penyimpanan dan penggunaan data pribadi Anda secara terbatas untuk keperluan acara ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA sesuai dengan ketentuan peraturan perundang-undangan yang berlaku di Indonesia terkait Perlindungan Data Pribadi.

By purchasing tickets to the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA, Ticket Buyers and Ticket Holders agree to comply with all the Terms & Conditions of the event that are determined and valid from time to time.
Dengan membeli Tiket untuk ke acara konser ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA, maka Pembeli Tiket dan Pemegang Tiket setuju untuk menaati setiap dan seluruh Syarat & Ketentuan acara yang ditetapkan dan berlaku dari waktu ke waktu.

The Ticket Holder grants the Promoter and the right to use, in perpetuity, all or any part of the recording of any video and still footage made of the Ticket holder''s appearance on any channels, including but not limited to magazine, social media, and TV for broadcast in any and all media globally used for advertising, publicity and promotions relating thereto without any further approval of yours.
Pemegang Tiket memberikan hak kepada Penyelenggara acara untuk melakukan rekaman video dan gambar baik sebagian atau semua, pada kanal/platform apapun, termasuk namun tidak terbatas pada majalah, media sosial, dan saluran TV untuk disiarkan di media apapun di seluruh dunia, untuk iklan, publisitas dan promosi yang berkaitan dengan konser tanpa persetujuan lebih lanjut dari Pemegang Tiket.

The promoter has the right to refuse admission to and/or evict Ticket-Holders who do not abide by the Terms and Conditions of the event.
Penyelenggara acara memiliki hak untuk menolak masuk dan/atau mengeluarkan orang-orang yang tidak menaati syarat dan ketentuan acara.

The promoter has the right to process and prosecute in accordance with the provisions of the prevailing laws and regulations, both civil procedure and criminal procedure against people who obtain tickets through illegal means, including but not limited to forging or duplicating valid tickets, or obtaining the tickets in a way that is not in accordance with what has been determined by the promoter, as stated in these Terms and Conditions.
Penyelenggara berhak untuk memproses dan menuntut secara hukum sesuai dengan ketentuan peraturan perundang-undangan yang berlaku baik secara perdata maupun secara pidana terhadap orang-orang yang memperoleh Tiket dengan cara yang tidak sah termasuk namun tidak terbatas pada cara melakukan pemalsuan atau menggandakan Tiket yang sah atau memperoleh Tiket dengan cara yang tidak sesuai dengan yang telah ditentukan oleh Penyelenggara sebagaimana dalam Syarat dan Ketentuan ini.

Please check our Instagram account (@pkentertainment.id) periodically for more information about the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA.
Mohon cek akun Instagram kami (@pkentertainment.id) secara berkala untuk informasi lebih lanjut seputar acara ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA.

Ticketing

Tickets can be purchased on Loket.com via enhypeninjakarta.com. Tickets are only for admission to the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA.
Tiket dapat dibeli di Loket.com melalui enhypeninjakarta.com. Tiket dapat digunakan untuk masuk ke acara konser ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA.

Ticket price excludes 10% government tax, 6% ticketing platform fee and any other applicable fees.
Harga Tiket tidak termasuk 10% pajak pemerintah, 6% biaya platform tiket dan biaya lain yang berlaku.

ENGENE MEMBERSHIP Presale and General Onsale tickets are limited to a maximum of 6 (six) per transaction within the same category. 1 (one) email address and 1 (one) phone number is limited to 1 (one) transaction.
Penjualan ENGENE MEMBERSHIP Presale dan General On-Sale dibatasi maksimal 6 (enam) per transaksi dalam kategori yang sama. 1 (satu) alamat email dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.

To participate in the ENGENE MEMBERSHIP PRESALE, you must apply for the ENGENE MEMBERSHIP PRESALE in advance on WEVERSE. Only ENGENE MEMBERSHIP (GLOBAL) holders are eligible to participate in the ENGENE MEMBERSHIP PRESALE. Please take note of the schedule, as application is not possible outside of the application period and make sure to check the correct time and date for different time zones.
Untuk mengikuti ENGENE MEMBERSHIP PRESALE, Anda harus melakukan pendaftaran ENGENE MEMBERSHIP PRESALE terlebih dahulu melalui WEVERSE. Hanya pemegang ENGENE MEMBERSHIP (GLOBAL) yang berhak mengikuti ENGENE MEMBERSHIP PRESALE. Harap memperhatikan jadwal yang telah ditentukan, karena pendaftaran tidak dapat dilakukan di luar periode yang ditetapkan. Pastikan juga untuk memeriksa tanggal dan waktu yang sesuai dengan zona waktu masing-masing.

Purchasing tickets for the ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA must use the name according to a valid photo ID. Make sure to buy tickets using your valid and correct data (ID Card/KK/KTP/SIM/Passport). Your ticket(s) cannot be changed and/or modified once the purchase has been made.
Pembelian tiket konser ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA wajib menggunakan Nama sesuai dengan kartu identitas yang sah. Pastikan Anda melakukan pembelian Tiket dengan menggunakan data Anda yang sah dan benar (Kartu Identitas/KK/KTP/SIM/Paspor). Tiket Anda tidak dapat diubah dan/atau dimodifikasi setelah pembelian telah dilaksanakan.

The Ticket Holder must occupy the seat or position that has been assigned by the promoter according to the category of ticket purchased.
Pemegang Tiket wajib menempati tempat duduk atau posisi yang telah ditentukan oleh pihak Penyelenggara sesuai dengan kategori Tiket yang dibeli.

In the event of a canceled concert, tickets will be refunded in accordance with the provisions of the promoter. Refunds do not include Platform Fees, Convenience Fees, or any other personal costs of the Ticket Buyer (e.g. travel expenses, accommodation expenses, etc).
Jika terjadi pembatalan konser, maka Tiket akan dikembalikan sesuai dengan ketentuan Penyelenggara. Pengembalian harga Tiket tidak termasuk Biaya Platform, Biaya Lainnya dan biaya pribadi Pembeli Tiket (contoh biaya perjalanan, biaya akomodasi, dll).

In order for Tickets to be valid on show day, the Ticket Buyer will be asked to provide the following items alongside their redeemed wristbands:
a. Photo ID (ID Card/KK/KTP/SIM/Passport)
Agar Tiket Anda valid di hari konser, Pembeli Tiket akan diminta untuk menyediakan barang dibawah ini bersama gelang Anda:
a. Kartu identitas dengan foto (KK/KTP/SIM/Paspor)

Reserve & Hold

Reserve & Hold tickets are non-refundable and non-transferable. All payments made under the Reserve & Hold program are final and cannot be refunded, transferred, or exchanged for cash or other ticket categories.
Tiket Reserve & Hold tidak dapat dikembalikan (non-refundable) dan tidak dapat dialihkan (non-transferable). Seluruh pembayaran yang telah dilakukan dalam program Reserve & Hold bersifat final dan tidak dapat dikembalikan, dialihkan, maupun ditukarkan dengan uang tunai atau kategori tiket lainnya.

Ticket Buyers are required to complete payment according to the payment schedule provided at the time of purchase. Failure to complete any payment by the applicable deadline will result in the automatic cancellation and voiding of the reserved ticket, without prior notice. All payments already made will be forfeited and will not be refunded.
Pembeli Tiket wajib menyelesaikan pembayaran sesuai dengan jadwal pembayaran yang telah ditentukan pada saat pembelian. Kegagalan untuk menyelesaikan salah satu pembayaran hingga batas waktu yang telah ditentukan akan mengakibatkan reservasi tiket secara otomatis dibatalkan dan dinyatakan tidak berlaku (void), tanpa pemberitahuan sebelumnya. Seluruh pembayaran yang telah dilakukan akan hangus dan tidak dapat dikembalikan.

Payment deadlines are final. Requests for payment extensions, late payments, or reinstatement of cancelled tickets will not be accommodated.
Batas waktu pembayaran bersifat final dan tidak dapat diperpanjang. Permintaan perpanjangan waktu pembayaran, pembayaran setelah batas waktu yang ditentukan, maupun pengaktifan kembali tiket yang telah dibatalkan tidak dapat dipenuhi.

Reserve & Hold only secures the selected ticket(s) for the customer for the applicable payment period. It does not constitute full ticket ownership until the total ticket price has been fully paid. E-tickets will only be issued after the customer has successfully completed 100% of the total ticket payment and fulfilled all applicable payment requirements.
Reserve & Hold hanya berfungsi untuk mengamankan tiket yang telah dipilih oleh Pembeli Tiket selama periode pembayaran yang berlaku. Reservasi tersebut belum dianggap sebagai kepemilikan tiket secara penuh sampai seluruh harga tiket telah dibayarkan. E-ticket hanya akan diterbitkan setelah Pembeli Tiket berhasil menyelesaikan 100% pembayaran harga tiket dan memenuhi seluruh persyaratan pembayaran yang berlaku.

Wristband Redemption

The time and place for wristband redemption will be announced and informed through the promoter''s social networking services (@pkentertainment.id), as well as the official website enhypeninjakarta.com. It is recommended to exchange the e-voucher beforehand to avoid queues on the day of the concert.
Waktu dan tempat penukaran gelang akan diumumkan dan diinformasikan melalui media sosial promotor (@pkentertainment.id), serta situs web resmi www.enhypeninjakarta.com. Disarankan untuk menukarkan e-voucher sebelumnya untuk menghindari antrian pada hari konser.

In order for Tickets to be valid for wristband redemption, the Ticket Buyer (Lead Booker) will be asked to provide all of the following items alongside their ticket(s):
a. Photo ID (ID Card/KK/KTP/SIM/Passport)
b. Loket.com E-Voucher
Agar Tiket Anda valid untuk penukaran gelang, Pembeli Tiket (Pemesan Utama) akan diminta untuk menyediakan barang dibawah ini bersama tiket Anda:
a. Kartu identitas asli (ID Card/KK/KTP/SIM/Paspor)
b. E-Voucher Loket.com

If wristband redemption is represented, please provide:
a. Printed e-voucher
b. Photo ID (ID Card/KK/KTP/SIM/Passpor) of the wristband redeemer
c. Copy of the Photo ID (ID Card/KK/KTP/SIM/Passport) of the original ticket holder
d. Power of Attorney signed on a Rp.10.000 Duty Stamp by the represented party
Apabila penukaran gelang diwakili, mohon untuk menyediakan:
a. E-voucher yang telah dicetak
b. Kartu identitas asli (ID Card/KK/KTP/SIM/Paspor) penukar tiket
c. Fotokopi identitas diri (KTP/KK/SIM/Paspor) pemesan tiket asli
d. Surat Kuasa yang ditandatangani di atas materai Rp.10.000 oleh pihak yang diwakili

The promoter will not, for any reason, replace lost or damaged wristbands.
Penyelenggara tidak akan memberikan penggantian gelang yang hilang atau rusak karena alasan apa pun.

Health and Safety

For audiences who feel unwell, it is highly recommended to wear a mask throughout the event.
Bagi penonton yang merasa kurang sehat, sangat disarankan untuk menggunakan masker selama acara berlangsung.

For safety reasons, individuals with disabilities and pregnant women are advised not to be in the standing area. Children under the age of 12 (twelve) and individuals under the height of 1.2m are not allowed in the standing area. Please contact our customer support for more information.
Demi alasan keamanan, penonton difabel dan wanita hamil disarankan untuk tidak berada di area standing. Anak-anak dibawah usia 12 (dua belas) tahun dan penonton dengan tinggi dibawah 1.2m tidak diperbolehkan untuk berada di area standing. Silakan hubungi layanan pelanggan kami untuk informasi lebih lanjut.

Strobe, laser and haze effects may be used during the show. Patrons susceptible to photosensitive epilepsy or other photo sensitivities may be affected.
Efek strobo, laser, dan kabut dapat digunakan selama pertunjukan. Pengunjung yang rentan terhadap epilepsi fotosensitif atau bentuk lain sensitivitas cahaya dapat terpengaruh.

The promoter reserves all rights to add any additional Terms / Conditions related to health protocols in accordance with the prevailing law and/or regulations at the time of the event.
Penyelenggara berhak untuk menambahkan Syarat/Ketentuan tambahan terkait protokol kesehatan sesuai dengan hukum dan/atau peraturan yang berlaku pada saat acara berlangsung.

Special Needs Assistance

Dedicated special needs / wheelchair accessible seating is only available in CAT 3. Ticket buyers requiring special needs assistance must purchase CAT 3 tickets.
Area tempat duduk khusus bagi penyandang disabilitas / pengguna kursi roda hanya tersedia di kategori CAT 3. Pembeli tiket yang memerlukan bantuan atau akses khusus wajib membeli tiket kategori CAT 3.

Ticket upgrades to CAT 3 may be required depending on ticket availability.
Upgrade kategori tiket ke CAT 3 dapat diperlukan, bergantung pada ketersediaan tiket.

There is a limited quota for wheelchair accessible seating and is subject to availability on a first-come, first served basis.
Terdapat kuota dalam jumlah terbatas untuk tempat duduk yang dapat diakses dengan kursi roda dan bergantung pada ketersediaan berdasarkan urutan permintaan.

To get your booking authorized, you must present a medical certificate as proof of disability. The Promoter only accepts medical certificates from legitimate institutions and/or physicians.
Untuk mendapatkan otorisasi pemesanan tempat duduk ini, Anda diwajibkan untuk melampirkan Surat Keterangan Dokter yang sah. Penyelenggara Acara hanya menerima Surat Keterangan Dokter yang berasal dari institusi yang sah, baik klinik maupun rumah sakit.

Relocation requests may be reviewed based on medical condition, seating availability, safety considerations and Promoter approval.
Permohonan perpindahan tempat duduk dapat dipertimbangkan berdasarkan kondisi medis, ketersediaan tempat duduk, pertimbangan keselamatan, serta persetujuan Penyelenggara.

For more information regarding wheelchair accessible seating and booking, please contact support@loket.com to process your booking.
Untuk informasi lebih lanjut dan pemesanan, silakan hubungi layanan pelanggan support@loket.com untuk memproses pemesanan Anda.

Age Restriction

Children under the age of 14 (fourteen) must be accompanied by a parent or legal guardian aged 18 (eighteen) or over. Children under the age of 3 (three) are not allowed to attend the event. Parents/Guardians are responsible for their children''s safety at all times.
Anak-anak yang berusia di bawah 14 (empat belas) tahun wajib didampingi oleh orang tua atau wali yang berusia 18 (delapan belas) tahun ke atas. Anak-anak yang berusia di bawah 3 (tiga) tahun tidak diperbolehkan menghadiri acara ini. Orang tua/wali bertanggung jawab atas keselamatan anak-anak mereka setiap saat.

No Re-Entry Policy

Re-entry to the venue is not permitted. This applies to all ticket holders and ticket categories. Once you enter, you won''t be able to leave and re-enter. The promoter reserves the right to deny venue access, even to holders of valid tickets/wristbands with barcodes, if the ticket/wristband has already been scanned.
Tidak diperbolehkan untuk keluar masuk area konser. Hal ini berlaku untuk semua pemegang tiket dan kategori tiket. Setelah Anda masuk, Anda tidak dapat keluar dan masuk kembali. Penyelenggara berhak menolak akses masuk ke dalam venue, bahkan kepada pemegang tiket/gelang yang masih berlaku dengan barcode, jika tiket/gelang tersebut telah dipindai.

Security Check and Prohibited Items

We take your safety seriously. To ensure a smooth and secure entry process for everyone, we will be conducting thorough security checks, which may include:
Kami sangat memprioritaskan keamanan Anda. Untuk memastikan proses masuk yang lancar dan aman bagi semuanya, kami akan melakukan pemeriksaan keamanan secara menyeluruh, termasuk:
Visual inspections of bags and belongings.
Inspeksi visual terhadap tas dan barang bawaan.
Airport-style pat-down searches.
Pemeriksaan tubuh secara menyeluruh dengan metode bandara.
Electronic drug detection and K-9 screening.
Detektor obat-obatan terlarang dan anjing pelacak (K-9).

You have the right to refuse a search, but the promoter may deny you entry if you do.
Anda memiliki hak untuk menolak pemeriksaan, tetapi penyelenggara dapat menolak Anda untuk masuk apabila Anda melakukannya.

All ticket holders must comply with the following guidelines for permitted bags:
Seluruh pemegang tiket wajib mengikuti panduan untuk tas yang diizinkan sebagai berikut:
Bags must not exceed the designated size limit, which is no larger than A4 size or 210mm x 297mm.
Tas tidak diizinkan untuk melebihi batas ukuran yang ditentukan, yaitu tidak lebih besar dari ukuran A4 atau 210 mm x 297 mm.
Event attendees are prohibited to bring more than one (1) bag, as the promoter does not offer a deposit box counter/booth.
Penonton tidak diperbolehkan membawa lebih dari satu (1) tas. Penyelenggara tidak menyediakan konter/tempat penitipan barang.

The following items are not permitted in the event and may be ejected with or without the owner from the venue area:
Barang-barang berikut tidak diizinkan dalam acara dan akan dikeluarkan dengan atau tanpa pemilik dari area acara tersebut:
Professional camera/recording equipment (any camera with a detachable lens, any professional video or audio recording devices, including ''GoPro'' style devices and tablets).
Alat perekam (kamera profesional, alat perekam video dan alat perekam suara, termasuk perangkat sejenis GoPro dan tablet)
Liquids, alcohol, cigarettes and banned substances including outside food and drink;
Cairan, alkohol, segala jenis rokok, dan barang-barang terlarang lainnya termasuk makanan dan minuman;
Pyrotechnic items or explosives including fireworks, candles, lighters;
Benda piroteknik atau benda yang bersifat meledak termasuk kembang api, lilin atau korek api;
Flammable material including alcohol, gasoline, kerosene, pressurized cologne;
Bahan mudah terbakar termasuk alkohol, bensin, minyak tanah, cologne;
Lasers, lights or flashlights.
Laser, lampu atau senter.
Dangerous or potentially hazardous objects, including but not limited to sports equipment, weapons, knives, firearms, iron bars, sharp objects, helmets, metal/plastic knuckles, self-defense spray (tear gas, pepper-spray), stun guns (tasers) or any electric shock devices;
Benda berbahaya atau berpotensi berbahaya termasuk namun tidak terbatas pada alat olahraga, senjata, pisau, senjata api, perangkat laser, bar besi, bilah kayu, benda atau bahan tajam, helm, keling besi/plastic, semprotan pertahan diri (gas air mata, semprotan merica), senjata kejut listrik atau perangkat sengatan listrik lainnya;
Any other items that pose a risk to public safety including glass items, tools, chemicals, suspicious powder, umbrellas, selfie sticks, and other poles or tripods.
Benda-benda kasual yang mencurigakan yang bisa dijadikan senjata atau proyektil termasuk barang kaca, peralatan, bahan kimia, bubuk mencurigakan, payung, tongkat swafoto dan jenis-jenis tiang atau tripod lainnya.

The promoter reserves the right to remove disruptive attendees without a refund.
Penyelenggara berhak mengeluarkan pengunjung yang mengganggu tanpa pengembalian dana.

The promoter is not responsible for lost or damaged belongings.
Penyelenggara tidak bertanggung jawab atas barang yang hilang atau rusak.

All attendees, including the media, are subject to these security measures.
Semua pengunjung, termasuk media, wajib mengikuti tahapan keamanan ini.

Promoters

ABOUT PK ENTERTAINMENT

PK Entertainment is Indonesia''s leading music promoter, established in 2015 by a collective of visionary strategists and creators. We are dedicated to curating and presenting world-class concerts that deliver exceptional live music experiences and create unforgettable memories for concertgoers.

Over the years, PK Entertainment has built a strong legacy of bringing some of the world''s biggest superstars and most exciting emerging artists to Indonesia and Thailand. Our portfolio includes internationally acclaimed acts such as Coldplay, Ed Sheeran, Celine Dion, Westlife, LANY, Shawn Mendes, Charlie Puth, Calum Scott, keshi, Tom Jones, ONE OK ROCK, YOASOBI, RADWIMPS, Fujii Kaze, Ado, Eve, Maroon 5, LINKIN PARK, Bruno Mars, BABYMONSTER and ATEEZ.

For more than a decade, we have been at the forefront of Indonesia''s live entertainment industry, producing world-class concerts. Building on this momentum, we are preparing an even more exciting lineup for 2026 and 2027, featuring internationally acclaimed artists such as ENHYPEN, BIGBANG, BOYNEXTDOOR, and many more.

PK Entertainment operates under PK Entertainment Group, alongside its business units including PK Events, PK Films, PK Music, and PK Capital, forming an integrated entertainment ecosystem and positioning us as Indonesia''s one-stop entertainment and event powerhouse, delivering diverse, world-class experiences across live events, concerts, music, film, and creative production.

Customer Service Info

For more information about ticket purchase, wheelchair accessible seating please contact:

Loket.com
Phone: 021-30003160
Email: support@loket.com

PK Entertainment
Email: contact@pk-ent.com

Copyright

(c) 2026 PK ENTERTAINMENT GROUP INDONESIA. ALL RIGHTS RESERVED.

(c) 2026 LOKET (PT Global Loket Sejahtera). ALL RIGHTS RESERVED.' WHERE title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND venue = 'Jakarta Utara';
UPDATE events SET seatmap = '{"name":"Jakarta International Stadium - Seating & Zone","images":["https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026855/WhatsApp_Image_2026-09-10_at_2.50.23_PM.jpg"]}' WHERE title = 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND venue = 'Jakarta Utara';
UPDATE events SET terms_conditions = 'T.O.P PRE-STUDIO 2026 in JAKARTA

T.O.P akan hadir di Jakarta untuk sebuah acara fan event eksklusif, T.O.P PRE-STUDIO 2026 in JAKARTA, yang mengundang para penggemar untuk menjadi bagian dari sebuah pengalaman di mana momenmomen tak terlupakan diciptakan bersama.

PRE-STUDIO adalah tempat di mana T.O.P dan para penggemarnya berkumpul untuk berbagi, terhubung, dan merayakan ikatan yang telah mereka bangun selama bertahun-tahun. Setiap penampilan, setiap interaksi, dan setiap momen yang dibagikan mencerminkan kerinduan T.O.P untuk kembali bertemu dengan para penggemarnya serta menciptakan kenangan baru bersama.

Bergabunglah bersama T.O.P saat ia membuka pintu PRE-STUDIO, sebuah pengalaman di mana setiap penggemar menjadi bagian dari perjalanan, dan setiap momen yang dibagikan akan menjadi kenangan yang akan selalu dikenang.

T.O.P is coming to Jakarta for an exclusive fan event, T.O.P PRE-STUDIO 2026 in JAKARTA, inviting fans to step into an experience where unforgettable moments are created together.

PRE-STUDIO is where T.O.P and his fans come together to share, connect, and celebrate the bond they have built over the years. Every performance, every interaction, and every shared experience reflects T.O.P''s desire to reconnect with his fans and create new memories together.

Join T.O.P as he opens the doors to PRE-STUDIO, where every fan becomes part of the journey, and every shared moment becomes a memory to cherish.

Terms & Conditions

SYARAT & KETENTUAN

GENERAL REGULATIONS

Tiket hanya dapat dibeli melalui www.topinjakarta2026.com. Tiket hanya berlaku untuk masuk ke acara T.O.P PRE-STUDIO 2026 in Jakarta.
Tickets can only be purchased through www.topinjakarta2026.com. Tickets are only valid for admission to T.O.P PRE-STUDIO 2026 in Jakarta.
Harga tiket tidak termasuk pajak pemerintah 10%, biaya admin 5%, dan biaya layanan platform.
Ticket prices exclude 10% government tax, 5% admin fee, and platform service fee.
Setelah pembelian berhasil, e-ticket akan dikirimkan ke email Anda.
Upon successful purchase, an e-ticket will be sent to your email.
Mohon membawa identitas asli yang masih berlaku (KTP/KK/Paspor/SIM/Kartu Pelajar) yang sesuai dengan data pada e-ticket di aplikasi Loket-X saat penukaran wristband/tiket.
Please bring a valid original ID card (KTP/KK/Passport/Driving License/Student Card) that matches the information reflected on your e-ticket in order to redeem your wristband/ticket.
Dengan membeli tiket T.O.P PRE-STUDIO 2026 in Jakarta, Anda menyetujui pengumpulan, penyimpanan, dan penggunaan data pribadi secara terbatas untuk keperluan acara.
By purchasing tickets to T.O.P PRE-STUDIO 2026 in Jakarta, you agree to the collection, storage, and limited use of your personal data for event purposes.
Semua penjualan tiket bersifat final. Tiket yang telah terjual tidak dapat ditukar maupun diuangkan kembali.
All ticket sales are final. Tickets sold cannot be exchanged or refunded.
E-ticket menggunakan sistem barcode dan hanya berlaku untuk satu kali penukaran wristband. Tanda masuk ke venue adalah wristband resmi yang telah ditukarkan dari e-ticket.
The e-ticket contains a barcode and is valid for one-time wristband redemption only. Only ticket holders with valid official wristbands will be permitted to enter the venue.
Dilarang membagikan barcode e-ticket dalam bentuk apa pun. Barcode bersifat rahasia dan tidak boleh rusak atau disebarluaskan hingga Anda masuk ke venue.
Please do not share or disseminate the barcode in any form (photo uploads, emails, screenshots, etc.). The barcode is confidential and must not be damaged or shared until you have successfully entered the venue.
Penyelenggara tidak bertanggung jawab atas kelalaian pembeli yang menyebabkan e-ticket digunakan pihak lain.
The promoter is not responsible for any misuse of the e-ticket caused by the buyer''s negligence. Such tickets may be deemed invalid.
Fanmeeting terdiri dari 5 kategori tiket (VIP, CAT 1, CAT 2, CAT 3, CAT 4) dengan tempat duduk bernomor.
There are five ticket categories (VIP, CAT 1, CAT 2, CAT 3, CAT 4), all with numbered seating.
Setelah Anda berhasil melakukan pembelian tiket, e-ticket akan dikirimkan ke email Anda mendekati jadwal acara. Seat number akan muncul di e-ticket yang telah Anda dapatkan sebelumnya. Anda perlu me-refresh link e-ticket tersebut. Nomor kursi akan di generate oleh sistem dan tidak dapat diubah atau di modifikasi.
Upon purchasing the ticket successfully, e-ticket will be sent to your email closer to the event date. The seat number will be assigned to your ticket, and it will appear on the same e-ticket that you received previously. You will need to refresh the same e-ticket link received upon purchase to see your seat number. The seat number will be automatically generated and assigned by the system. The assigned seat number reflected on your e-ticket cannot be changed or modified.
Pemegang tiket wajib menempati tempat duduk sesuai kategori yang dibeli.
Ticket holders must occupy the assigned seat according to their ticket category.
Penyelenggara berhak mengubah atau menambahkan syarat dan ketentuan tanpa pemberitahuan sebelumnya.
The promoter reserves the right to change or add conditions without prior notice.

INFORMASI PEMBELIAN TIKET : TOPSX GLOBAL MEMBERSHIP PRESALE

TICKET PURCHASE INFORMATION : TOPSX GLOBAL MEMBERSHIP PRESALE

Nomor T.O.P Global Membership [TOPSX] adalah kode yang akan digunakan dalam periode TOPSX Global Membership Presale.
The T.O.P Global Membership [TOPSX] number is the code that will be used during the TOPSX Global Membership Presale period.
Pembelian tiket pada TOPSX Global Membership Presale hanya dapat diakses menggunakan nomor membership yang telah didaftarkan selama periode registrasi yang telah ditentukan.
Ticket purchases during the TOPSX Global Membership Presale can only be accessed using the membership number registered during the designated registration period.
Kode yang telah didaftarkan hanya dapat digunakan untuk 1 (satu) kali transaksi selama periode TOPSX Global Membership Presale.
The registered code can only be used for 1 (one) transaction during the TOPSX Global Membership Presale period.
Pembelian dibatasi maksimal 2 (dua) tiket selama periode TOPSX Global Membership Presale.
Purchases are limited to a maximum of 2 (two) tickets during the TOPSX Global Membership Presale period.
Jadwal TOPSX Global Membership Presale
TOPSX Global Membership Presale Schedule
Hari / Tanggal : Kamis, 13 Agustus 2026
Day / Date : Thursday, 13 August 2026
Waktu : Pukul 12:00 WIB - 23:59 WIB
Time : 12:00 WIB - 23:59 WIB
Tempat : topinjakarta2026.com
Place : topinjakarta2026.com
Pembelian tiket pada TOPSX Global Membership Presale dapat dilakukan menggunakan beberapa metode pembayaran, yaitu Virtual Account, E-wallet, QRIS, Paylater, bank transfer, dan kartu kredit.
Ticket purchases during the TOPSX Global Membership Presale can be made using several payment methods, including Virtual Account, E-wallet, QRIS, Paylater, bank transfer, and credit card.
Pembayaran menggunakan kartu kredit hanya dapat dilakukan dengan kartu kredit yang mendukung sistem 3D Secure.
Payments made by credit card can only be completed using credit cards that support 3D Secure.

INFORMASI PEMBELIAN TIKET : GENERAL SALE

TICKET PURCHASE INFORMATION : GENERAL SALE

Setiap akun dibatasi untuk melakukan 1 (satu) kali transaksi, dengan pembelian maksimum 4 (empat) tiket selama periode General Sale.
Each account is limited to 1 (one) transaction, with a maximum purchase of 4 (four) tickets during the General Sale period.
Pembelian ulang tidak dapat dilakukan menggunakan NIK, alamat email, dan nomor telepon yang sama.
Repeat purchases cannot be made using the same National Identification Number (NIK), email address, and phone number.
Jadwal General Sale
General Sale Schedule
Hari / Tanggal : Jumat, 14 Agustus 2026
Day / Date : Friday, 14 August 2026
Waktu : Pukul 12:00 WIB
Time : 12:00 WIB
Tempat : topinjakarta2026.com
Place : topinjakarta2026.com
Pembelian tiket pada General Sale dapat dilakukan menggunakan beberapa metode pembayaran, yaitu Virtual Account, E-wallet, QRIS, Paylater, bank transfer, dan kartu kredit.
Ticket purchases during the TOPSX Global General Sale can be made using several payment methods, including Virtual Account, E-wallet, QRIS, Paylater, bank transfer, and credit card.
Pembayaran menggunakan kartu kredit hanya dapat dilakukan dengan kartu kredit yang mendukung sistem 3D Secure.
Payments made by credit card can only be completed using credit cards that support 3D Secure.

INFORMASI PENUKARAN WRISTBAND

WRISTBAND REDEMPTION

Waktu dan lokasi penukaran wristband akan diinformasikan melalui media sosial resmi Tonz Entertainment, Three Mountains Ave dan Loket.
Further details regarding wristband redemption will be announced through Tonz Entertainment, Three Mountains Ave and Loket official social media accounts.

BATASAN UMUR

AGE RESTRICTIONS

Anak di bawah usia 12 tahun harus didampingi orang tua/wali sah berusia minimal 18 tahun. Anak di bawah usia 8 tahun tidak diperbolehkan menghadiri acara ini.
Children under 12 years old must be accompanied by a parent or legal guardian aged 18 or above. Children under 8 years old are not allowed to attend the event.

LAYANAN KEBUTUHAN KHUSUS

SPECIAL NEED SERVICE

Tersedia kuota terbatas untuk kursi roda. Pemohon wajib melampirkan Surat Keterangan Dokter dari institusi resmi serta surat pernyataan bermaterai dari keluarga/wali. Kirim file PDF ke specialneeds0001@gmail.com paling lambat 5 September 2026 dengan subjek: "T.O.P PRE-STUDIO 2026 IN JAKARTA - SPECIAL NEED" dengan mencantumkan:
- Nama Lengkap
- Nomor Invoice
- Jumlah Pendamping
- Surat Keterangan Dokter
Wheelchair-accessible seating is available in limited quantities. A valid medical certificate from a legitimate institution and a stamped statement letter from a family member/guardian are required. Please send documents in PDF format to specialneeds0001@gmail.com by 5 September 2026 with the subject "T.O.P PRE-STUDIO 2026 IN JAKARTA - SPECIAL NEED"
- Full name
- Invoice Number
- Number of companions
- Medical Certificate or Doctor''s Note
Pengguna kursi roda atau individu dengan disabilitas hanya dapat membeli tiket di kategori CAT 1.
Wheelchair users or individuals with disabilities will only be able to purchase tickets in CAT 1.

KEBIJAKAN TIDAK KELUAR MASUK

NO RE-ENTRY

Tidak diperbolehkan masuk kembali setelah keluar dari area venue.
No re-entry is allowed.
Penyelenggara berhak menolak masuk apabila barcode telah digunakan sebelumnya.
The promoter reserves the right to deny entry if the barcode has already been scanned.

PEMERIKSAAN SAAT MASUK ACARA
SECURITY CHECK UPON ENTRY

Keselamatan dan keamanan Anda adalah prioritas kami. Setiap pengunjung dan barang bawaan akan melalui pemeriksaan keamanan sebelum memasuki area acara. Dengan memasuki area acara, Anda menyetujui untuk mengikuti prosedur pemeriksaan yang berlaku. Apabila Anda menolak pemeriksaan, Penyelenggara berhak untuk menolak akses masuk. Penyelenggara juga berhak meminta Anda meninggalkan area acara apabila perilaku Anda dianggap membahayakan keselamatan atau keamanan peserta lainnya. Dalam hal penolakan masuk atau permintaan untuk meninggalkan acara, tidak akan ada pengembalian dana.
Your safety and security are our top priorities. All attendees and their belongings will be subject to a security check prior to entering the event area. By entering the venue, you agree to comply with the applicable security procedures. If you refuse to undergo inspection, the promoter reserves the right to deny entry. The promoter also reserves the right to require you to leave the event if your behavior is deemed to compromise the safety or security of other attendees. In the event of denied entry or removal from the venue, no refund will be provided.

KEBIJAKAN UMUM

GENERAL POLICIES

Setiap pemegang tiket bertanggung jawab atas keselamatan dan keamanan pribadi masing-masing.
Each attendee is responsible for their own safety and security.
Tiket resmi hanya dijual melalui channel resmi yang diumumkan di @tonzentofficial, @threemountainsave dan www.topinjakarta2026.com.
Official tickets are only sold through platforms announced on @tonzentofficial, @threemountainsave and www.topinjakarta2026.com.
Jika konser dibatalkan karena alasan di luar kendali penyelenggara, pengembalian tiket mengikuti ketentuan penyelenggara dan tidak termasuk biaya platform maupun biaya pribadi.
In the event of cancellation beyond the promoter''s control, refunds will follow promoter policies and will exclude platform fees and personal expenses.
Tiket yang dibeli untuk tujuan penjualan kembali dianggap melanggar syarat dan ketentuan dan dapat dibatalkan.
Tickets purchased for resale purposes are in violation of these Terms & Conditions and may be invalidated.
Pemegang tiket memberikan hak kepada penyelenggara untuk merekam dan menggunakan foto/video untuk kepentingan promosi.
Ticket holders grant the promoter the right to record and use video and images for promotional purposes.
Penyelenggara menentang segala bentuk SARA, pelecehan, dan perundungan.
The promoter does not permit any form of harassment and/or bullying.
Demi menjaga kenyamanan, keamanan, dan kelancaran jalannya acara Fan Meeting, segala bentuk surat maupun hadiah dari penggemar untuk artis tidak dapat diterima. Mohon pengertian dan kerjasamanya.
In order to ensure the comfort, safety, and smooth execution of the Fan Meeting, any form of letters or gifts from fans for the artist will not be accepted. Your understanding and cooperation are greatly appreciated.

Mohon cek Instagram @tonzentofficial dan @threemountainsave secara berkala untuk informasi terbaru.
Please check @tonzentofficial and @threemountainsave Instagram account regularly for updates regarding the event.

Contact Us

For more information about ticket purchase:

Loket.com
Phone: 021-30003160
Email: support@loket.com

For more information about wheelchair accessible seating, please contact:

Email: specialneeds0001@gmail.com

For strategic partnership, marketing, and promotional collaboration, please contact:

Email: info@threemountainsave.com' WHERE title = 'T.O.P PRE-STUDIO 2026 in Jakarta' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = 'Terms & Conditions

SYARAT & KETENTUAN

GENERAL REGULATIONS

Tiket hanya dapat dibeli melalui www.hwanginyoupinjakarta2026.com. Tiket hanya berlaku untuk masuk ke acara 2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA.
Tickets can only be purchased through www.hwanginyoupinjakarta2026.com. Tickets are only valid for admission to 2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA.
Nama sesuai dengan kartu identitas yang sah wajib digunakan untuk membeli tiket. Pastikan Anda melakukan pembelian dengan data yang sah dan benar (KTP/KK/Kartu Pelajar/SIM/Paspor). Tiket tidak dapat diubah dan/atau dimodifikasi setelah pembelian dilakukan.
You will be required to provide your name in accordance with your valid personal identification to purchase tickets to the 2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA. The provided name must match the name indicated on your personal identification document (ID Card/KTP/KK/Student Card/SIM/Passport). Your ticket(s) cannot be changed, modified, or transferred once purchased.
1 akun hanya dapat membeli maksimal 4 (empat) tiket per transaksi. Akun dengan NIK, alamat email, dan nomor telepon yang sama tidak dapat melakukan pembelian berulang.
Each account can purchase a maximum of 4 (four) tickets per transaction. Accounts with the same NIK, email address, and telephone number will be blocked from attempting repeated purchases.
Harga tiket tidak termasuk pajak pemerintah 10%, biaya admin 5%, dan biaya lainnya.
Ticket prices exclude 10% government tax, 5% admin fee, and any other applicable charges.
Setelah pembelian berhasil, booking confirmation akan dikirimkan ke email Anda.
Upon successful purchase, a booking confirmation will be sent to your email.
Mohon membawa identitas asli yang masih berlaku (KTP/KK/Paspor/SIM/Kartu Pelajar) yang sesuai dengan data pada e-ticket di aplikasi Loket-X saat penukaran wristband/tiket.
Please bring a valid original ID card (KTP/KK/Passport/Driving License/Student Card) that matches the information reflected on your e-ticket in order to redeem your wristband/ticket.
Dengan membeli tiket, Anda menyetujui pengumpulan, penyimpanan, dan penggunaan data pribadi secara terbatas untuk keperluan acara.
By purchasing tickets to 2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA, you agree to the collection, storage, and limited use of your personal data for event purposes.
Semua penjualan tiket bersifat final. Tiket yang telah terjual tidak dapat ditukar maupun diuangkan kembali.
All ticket sales are final. Tickets sold cannot be exchanged or refunded.
E-ticket menggunakan sistem barcode dan hanya berlaku untuk satu kali penukaran wristband. Tanda masuk ke venue adalah wristband resmi yang telah ditukarkan dari e-ticket.
The e-ticket contains a barcode and is valid for one-time wristband redemption only. Only ticket holders with valid official wristbands will be permitted to enter the venue.
Dilarang membagikan barcode e-ticket dalam bentuk apa pun. Barcode bersifat rahasia dan tidak boleh rusak atau disebarluaskan hingga Anda masuk ke venue.
Please do not share or disseminate the barcode in any form (photo uploads, emails, screenshots, etc.). The barcode is confidential and must not be damaged or shared until you have successfully entered the venue.
Penyelenggara tidak bertanggung jawab atas kelalaian pembeli yang menyebabkan e-ticket digunakan pihak lain.
The promoter is not responsible for any misuse of the e-ticket caused by the buyer''s negligence. Such tickets may be deemed invalid.
Fanmeeting terdiri dari 2 kategori tiket (FOREVER, ALWAYS) dengan tempat duduk bernomor.
There are two ticket categories (FOREVER, ALWAYS), all with numbered seating.
Setelah Anda berhasil melakukan pembelian tiket, e-ticket akan dikirimkan ke email Anda mendekati jadwal acara. Seat number akan muncul di e-ticket yang telah Anda dapatkan sebelumnya. Anda perlu me-refresh link e-ticket tersebut. Nomor kursi akan di generate oleh sistem dan tidak dapat diubah atau di modifikasi.
Upon purchasing the ticket successfully, e-ticket will be sent to your email closer to the event date. The seat number will be assigned to your ticket, and it will appear on the same e-ticket that you received previously. You will need to refresh the same e-ticket link received upon purchase to see your seat number. The seat number will be automatically generated and assigned by the system. The assigned seat number reflected on your e-ticket cannot be changed or modified.
Pemegang tiket wajib menempati tempat duduk sesuai kategori yang dibeli.
Ticket holders must occupy the assigned seat according to their ticket category.
Penyelenggara berhak mengubah atau menambahkan syarat dan ketentuan tanpa pemberitahuan sebelumnya.
The promoter reserves the right to change or add conditions without prior notice.

INFORMASI PENUKARAN WRISTBAND

WRISTBAND REDEMPTION

Waktu dan lokasi penukaran wristband akan diinformasikan melalui media sosial resmi Three Mountains Ave dan Loket.
Further details regarding wristband redemption will be announced through Three Mountains Ave and Loket official social media accounts.

BATASAN UMUR

AGE RESTRICTIONS

Anak di bawah usia 12 tahun harus didampingi orang tua/wali sah berusia minimal 18 tahun. Anak di bawah usia 8 tahun tidak diperbolehkan menghadiri acara ini.
Children under 12 years old must be accompanied by a parent or legal guardian aged 18 or above. Children under 8 years old are not allowed to attend the event.

LAYANAN KEBUTUHAN KHUSUS

SPECIAL NEED SERVICE

Tersedia kuota terbatas untuk kursi roda. Pemohon wajib melampirkan Surat Keterangan Dokter dari institusi resmi serta surat pernyataan bermaterai dari keluarga/wali. Kirim file PDF ke info@threemountainsave.com paling lambat 10 Oktober 2026 dengan subjek: "HWANG IN YOUP IN JAKARTA 2026 - SPECIAL NEED" dengan mencantumkan:
- Nama Lengkap
- Nomor Invoice
- Jumlah Pendamping
- Surat Keterangan Dokter
Wheelchair-accessible seating is available in limited quantities. A valid medical certificate from a legitimate institution and a stamped statement letter from a family member/guardian are required. Please send documents in PDF format to info@threemountainsave.com by 10 October 2026 with the subject "HWANG IN YOUP IN JAKARTA 2026 - SPECIAL NEED"
- Full name
- Invoice Number
- Number of companions
- Medical Certificate or Doctor''s Note
Pengguna kursi roda atau individu dengan disabilitas hanya dapat membeli tiket di kategori FOREVER.
Wheelchair users or individuals with disabilities will only be able to purchase tickets in FOREVER.

KEBIJAKAN TIDAK KELUAR MASUK

NO RE-ENTRY

Tidak diperbolehkan masuk kembali setelah keluar dari area venue.
No re-entry is allowed.
Penyelenggara berhak menolak masuk apabila barcode telah digunakan sebelumnya.
The promoter reserves the right to deny entry if the barcode has already been scanned.

PEMERIKSAAN SAAT MASUK ACARA
SECURITY CHECK UPON ENTRY

Keselamatan dan keamanan Anda adalah prioritas kami. Setiap pengunjung dan barang bawaan akan melalui pemeriksaan keamanan sebelum memasuki area acara. Dengan memasuki area acara, Anda menyetujui untuk mengikuti prosedur pemeriksaan yang berlaku. Apabila Anda menolak pemeriksaan, Penyelenggara berhak untuk menolak akses masuk. Penyelenggara juga berhak meminta Anda meninggalkan area acara apabila perilaku Anda dianggap membahayakan keselamatan atau keamanan peserta lainnya. Dalam hal penolakan masuk atau permintaan untuk meninggalkan acara, tidak akan ada pengembalian dana.
Your safety and security are our top priorities. All attendees and their belongings will be subject to a security check prior to entering the event area. By entering the venue, you agree to comply with the applicable security procedures. If you refuse to undergo inspection, the promoter reserves the right to deny entry. The promoter also reserves the right to require you to leave the event if your behavior is deemed to compromise the safety or security of other attendees. In the event of denied entry or removal from the venue, no refund will be provided.

KEBIJAKAN UMUM

GENERAL POLICIES

Setiap pemegang tiket bertanggung jawab atas keselamatan dan keamanan pribadi masing-masing.
Each attendee is responsible for their own safety and security.
Tiket resmi hanya dijual melalui channel resmi yang diumumkan di @threemouintansave dan www.hwanginyoupinjakarta2026.com.
Official tickets are only sold through platforms announced on @threemouintansave and www.hwanginyoupinjakarta2026.com.
Jika konser dibatalkan karena alasan di luar kendali penyelenggara, pengembalian tiket mengikuti ketentuan penyelenggara dan tidak termasuk biaya platform maupun biaya pribadi.
In the event of cancellation beyond the promoter''s control, refunds will follow promoter policies and will exclude platform fees and personal expenses.
Tiket yang dibeli untuk tujuan penjualan kembali dianggap melanggar syarat dan ketentuan dan dapat dibatalkan.
Tickets purchased for resale purposes are in violation of these Terms & Conditions and may be invalidated.
Pemegang tiket memberikan hak kepada penyelenggara untuk merekam dan menggunakan foto/video untuk kepentingan promosi.
Ticket holders grant the promoter the right to record and use video and images for promotional purposes.
Penyelenggara menentang segala bentuk SARA, pelecehan, dan perundungan.
The promoter does not permit any form of harassment and/or bullying.
Demi menjaga kenyamanan, keamanan, dan kelancaran jalannya acara Fan Meeting, segala bentuk hadiah dari penggemar untuk artis tidak dapat diterima. Mohon pengertian dan kerjasamanya.
In order to ensure the comfort, safety, and smooth execution of the Fan Meeting, any form of gifts from fans for the artist will not be accepted. Your understanding and cooperation are greatly appreciated.

Mohon cek Instagram @threemouintansave secara berkala untuk informasi terbaru.
Please check @threemouintansave Instagram account regularly for updates regarding the event.

Promoters

Tentang Promotor

Three Mountains Ave adalah promotor acara berbasis di Indonesia yang berkomitmen menghadirkan konser dan fan meeting berkualitas tinggi dengan perhatian penuh terhadap detail serta standar produksi yang prima. Dengan fokus pada penciptaan pengalaman yang bermakna dan berkesan, Three Mountains Ave berkomitmen untuk memberikan kenangan tak terlupakan bagi artis maupun para penggemar.

About the Promoter

Three Mountains Ave is an Indonesia-based event promoter committed to delivering high-quality concerts and fan meetings with meticulous attention to detail and excellent production standards. With a focus on creating meaningful and memorable experiences, Three Mountains Ave is dedicated to providing unforgettable moments for both artists and their fans.

Customer Service Info

For more information about ticket purchase and wheelchair accessible seating, please contact:

Loket.com
Phone: 021-30003160
Email: support@loket.com

For strategic partnership, marketing, and promotional collaboration, please contact:

info@threemountainsave.com

Copyright

(c) 2026 THREE MOUNTAINS AVE. ALL RIGHTS RESERVED.

(c) 2026 LOKET (PT Global Loket Sejahtera). ALL RIGHTS RESERVED.' WHERE title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND venue = 'Jakarta Pusat';
UPDATE events SET seatmap = '{"name":"Jakarta Concert Hall - Denah Tempat Duduk","images":["https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026916/WhatsApp_Image_2026-09-10_at_2.50.23_PM_1.jpg","https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026917/WhatsApp_Image_2026-09-10_at_2.50.23_PM_2.jpg"]}' WHERE title = '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = 'TERMS & CONDITIONS OF TICKET PURCHASE

YE LIVE IN JAKARTA · GELORA BUNG KARNO · 24 OKTOBER 2026

Diselenggarakan oleh / Presented by: RAW VISION COLLECTIVE (RVC)

Dengan melakukan pembelian tiket, Pembeli dan Pemegang Tiket dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang tercantum di bawah ini.
By purchasing a ticket, the Buyer and Ticket Holder are deemed to have read, understood, and agreed to all Terms & Conditions set out below.

Dalam hal terdapat perbedaan antara versi Bahasa Indonesia dan versi Bahasa Inggris, maka versi Bahasa Indonesia yang berlaku.
In the event of conflict between the Indonesian and English versions, the Indonesian version shall prevail.

A. PEMBELIAN TIKET / TICKET PURCHASE

Tiket resmi hanya dijual melalui yejakarta.com dan platform resmi yang ditunjuk oleh Penyelenggara (Loket.com). Penyelenggara tidak bertanggung jawab atas kerugian yang timbul akibat pembelian tiket melalui pihak tidak resmi, termasuk namun tidak terbatas pada calo.
Official tickets are sold exclusively through yejakarta.com and designated official platforms (Loket.com). The Organiser accepts no liability for losses arising from purchases made through unauthorised channels, including but not limited to scalpers.
Setiap pembelian tiket wajib menggunakan nama dan data yang sesuai dengan identitas resmi yang masih berlaku (KTP / Paspor / Kartu Keluarga / SIM / Kartu Pelajar). Data tidak dapat diubah atau dimodifikasi setelah transaksi selesai.
All ticket purchases must be made using a name and details that match a valid official identity document (ID Card / Passport / Family Card / Driver''s License / Student ID). Details cannot be altered or modified once the transaction has been completed.
Acara ini terdiri dari 8 kategori tiket: Festival (standing), Super Fans Festival (standing) dan VIP West, VIP East, CAT 1, CAT 2, CAT 3 dan CAT 4 dengan tempat duduk bernomor.
This event features 8 ticket categories: Festival (standing), Super Fans Festival (standing), and VIP West, VIP East, CAT 1, CAT 2, CAT 3, and CAT 4 with numbered seating.
Pembelian dibatasi maksimal 8 (delapan) tiket per transaksi dan bisa untuk kategori yang berbeda. 1 (satu) alamat email, 1 (satu) nomor identitas diri dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.
Purchases are limited to a maximum of 8 (eight) tickets per transaction, and purchasing tickets across different categories is permitted. 1 (one) email address, 1 (one) ID number, and 1 (one) phone number are limited to 1 (one) transaction.
Harga tiket belum termasuk pajak pemerintah 10%, biaya platform 6% dan biaya lain yang berlaku. Total biaya yang harus dibayarkan oleh Pembeli dapat dilihat pada saat checkout.
Ticket prices exclude 10% government tax, platform fees 6% and applicable service charges. The total amount of money that need to be paid by the Buyer can be seen upon checkout.
Setelah pembelian tiket berhasil, e-ticket dapat diakses melalui aplikasi LOKET X menggunakan akun/email yang terdaftar pada saat pembelian.
After the ticket purchase is successful, the e-ticket can be accessed through the LOKET X application using the account/email registered at the time of purchase.
Penyelenggara dan partner ticketing resmi yang ditunjuk hanya akan menerbitkan e-ticket kepada Pembeli yang sah.
The organiser and designated official ticketing partners will only issue e-tickets to legitimate Buyers.
Pemegang Tiket wajib menempati tempat duduk atau posisi yang telah ditentukan oleh system sesuai dengan kategori tiket yang dibeli. Bagi Pemegang Tiket kategori dengan tempat duduk bernomer (CAT 1, 2, 3, 4 dan VIP), maka nomor kursi akan tersedia beberapa hari sebelum konser melalui aplikasi LOKET X.
Ticket Holders are required to occupy the seat or position designated by the system according to the purchased ticket category. For Ticket Holders in the Numbered Seat category (1, 2, 3, 4 and VIP), the seat number will be available to the Ticket Holder a few days before the concert via the LOKET X application.
Tidak diperbolehkan membagikan dan menyebarluaskan nomor barcode di dalam e-ticket baik dalam bentuk unggahan apapun (foto, email, tangkapan layar dan lainnya). Barcode yang tercantum pada e-ticket bersifat rahasia, tidak boleh rusak dan disebarluaskan hingga Anda menukarkan wristband dan berhasil memasuki venue acara.
Do not share or disseminate the barcode and/or barcode number in the e-ticket in any form (photo uploads, emails, screen shots, and others). The barcode listed on e-ticket is confidential and must not be damaged until you have redeemed your wristband and successfully entered the venue.
Penyelenggara tidak bertanggung jawab atas kelalaian pembeli tiket yang mengakibatkan tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk dipergunakan sebagai tanda masuk tempat pertunjukkan yang menghilangkan hak dari pembeli tiket.
The Organiser is not responsible for situations in which the negligence of the ticket buyer leads to the use/tampering/appropriation of the ticket and its contents by another individual. Upon discovery of such situations, the e-ticket will be nulled and deemed invalid, and the buyer will forfeit the rights previously entitled to the ticket holder.
Semua penjualan tiket adalah final. Tiket yang telah terjual tidak dapat ditukar dan tidak dapat diuangkan kembali, kecuali dalam hal pembatalan acara oleh Penyelenggara sebagaimana diatur pada Pasal J.
All ticket sales are final. Tickets sold cannot be exchanged, cashed out or refunded, except in the event of cancellation by the Organiser as set out in Section J.

B. VALIDASI & AKSES MASUK / ENTRY VALIDATION

Pastikan Anda memiliki e-ticket yang tersedia di aplikasi LOKET X. Screenshot e-ticket tidak diperkenankan dan tidak akan diterima sebagai akses masuk ke venue.
Make sure you have an e-ticket available in the LOKET X application. Screenshots of the e-ticket are not allowed and will not be accepted for entry into the venue.
Pastikan Anda telah login ke akun LOKET X yang digunakan saat pembelian tiket sebelum tiba di lokasi acara untuk memperlancar proses validasi dan masuk ke venue.
Make sure you have logged into the LOKET X account used during the ticket purchase before arriving at the event location to ensure a smooth validation process and entry into the venue.
Penyelenggara berhak menolak masuk atau mengeluarkan siapapun yang tidak mematuhi Syarat & Ketentuan ini, berada dalam kondisi mabuk atau membahayakan, atau dianggap mengancam keselamatan orang lain. Tidak ada pengembalian dana atas tiket yang tidak digunakan akibat penolakan tersebut.
The Organiser reserves the right to refuse entry or remove any person who does not comply with these Terms & Conditions, is intoxicated or dangerous, or is deemed a threat to others'' safety. No refund will be issued for unused tickets as a result of such refusal.

C. KEBIJAKAN TIDAK KELUAR MASUK / NO RE-ENTRY POLICY

Tidak ada gelang pengganti yang akan dikeluarkan dalam kondisi apa pun jika hilang dan rusak karena alasan apapun. Penyelenggara tidak bertanggung jawab atas gelang yang hilang, dicuri atau rusak.
No replacement wristbands will be issued under any circumstances if lost or damaged for any reason. The Organiser is not responsible for lost, stolen, or damaged wristband.
Pemegang Tiket tidak diperkenankan untuk masuk kembali ke area venue setelah keluar. Setiap tiket hanya berlaku untuk satu kali masuk, tanpa pengecualian, terlepas dari kategori tiket yang dimiliki.
Ticket Holders are not allowed to re-enter the venue area once they have left. Each ticket is valid for one-time entry only, with no exceptions, regardless of the ticket category held.
Penyelenggara berhak menolak akses masuk apabila wristband atau barcode diketahui telah digunakan sebelumnya oleh Pemegang Tiket lain.
The Organiser''s reserves the right to deny entry if the wristband or barcode is found to have been previously used by another Ticket Holders.

D. BATASAN USIA / AGE RESTRICTION

Penting dibaca sebelum membeli / Important — read before purchasing

Anak di bawah usia 7 (tujuh) tahun DILARANG memasuki area venue tanpa pengecualian, karena pertimbangan keselamatan, tingkat kebisingan, efek pyroteknik, dan kepadatan kerumunan.
Children under 7 (seven) years of age are PROHIBITED from entering the venue without exception, due to safety considerations, sound levels, pyrotechnic effects, and crowd density.
Anak di bawah usia 15 (lima belas) tahun wajib didampingi secara terus-menerus oleh orang tua atau wali berusia paling sedikit 18 (delapan belas) tahun yang juga memiliki tiket pada kategori yang sama.
Children under the age of 15 (fifteen) must be continuously accompanied by parent or guardian aged at least 18 (eighteen) years who also holds a ticket in the same category.
Orang tua atau wali yang mendampingi anak di bawah usia 15 (lima belas) tahun bertanggung jawab penuh untuk memastikan anak berada di area yang sesuai kategori tiketnya. Kegagalan untuk mematuhi ketentuan penempatan area ini sepenuhnya menjadi tanggung jawab orang tua atau wali yang bersangkutan, dan Penyelenggara tidak dapat dimintai pertanggungjawaban atas insiden yang timbul karenanya.
Parents or guardians accompanying children under the age 15 (fifteen) years old bear full responsibility for ensuring the child remains in the appropriate zone matching their ticket category. Failure to comply with area placement rules is entirely the responsibility of the parent or guardian, and the Organiser accepts no liability for incidents arising therefrom.
Dengan membeli tiket untuk anak di bawah umur, orang tua atau wali mengakui bahwa mereka memahami sifat konser langsung, termasuk suara keras, piroteknik, kepadatan kerumunan, dan kemungkinan pergerakan kerumunan secara tiba-tiba, serta secara sukarela menanggung risiko-risiko tersebut atas nama anak di bawah umur.
By purchasing a ticket for a minor, the parent or guardian acknowledges that they understand the nature of a live concert, including loud sound, pyrotechnics, crowd density, and the possibility of sudden crowd movement, and voluntarily assumes these risks on behalf of the minor.
Petugas keamanan venue berhak memindahkan atau mengeluarkan penonton — termasuk anak-anak — dari area yang tidak sesuai atau dianggap membahayakan, tanpa pengembalian dana.
Venue security personnel have the right to relocate or remove attendees — including children — from areas deemed inappropriate or unsafe, without refund.

E. PENERIMAAN RISIKO / ASSUMPTION OF RISK

Dengan membeli tiket dan memasuki lokasi acara, Pembeli tiket dan Pemegang Tiket mengakui dan menerima risiko yang melekat pada kehadiran di konser berskala besar, termasuk namun tidak terbatas pada kepadatan penonton, desakan massa, tingkat kebisingan yang tinggi, kondisi cuaca, serta penggunaan efek khusus seperti piroteknik, asap, lampu strobo, dan laser. Kehadiran merupakan risiko yang ditanggung sendiri oleh Pemegang Tiket. Individu dengan kondisi medis yang mungkin terdampak oleh efek-efek tersebut—termasuk epilepsi, gangguan pernapasan, atau sensitivitas terhadap cahaya—disarankan untuk berkonsultasi dengan tenaga medis profesional sebelum hadir. Memasuki lokasi acara berarti menyetujui ketentuan-ketentuan ini.
By purchasing a ticket and entering the venue, the Ticket Buyer and Ticket Holder acknowledges and accepts the inherent risks associated with attending a large-scale concert, including but not limited to crowd congestion, crowd surges, high noise levels, weather conditions, and the use of special effects such as pyrotechnics, smoke, strobe lighting, and lasers. Attendance is at the Ticket Holder''s own risk. Individuals with medical conditions that may be affected by these effects, including epilepsy, respiratory conditions, or light sensitivity, are advised to consult a medical professional before attending. Entry into the venue constitutes acceptance of these conditions.
Demi alasan keselamatan, area Festival Standing tidak direkomendasikan bagi Pemegang Tiket dengan kondisi medis khusus, ibu hamil dan penyandang disabilitas. Anak yang berusia di bawah 15 (lima belas) tahun tidak diperbolehkan berada di area Festival Standing. Tersedia kuota terbatas untuk area yang dapat diakses oleh pengguna kursi roda. Untuk memperoleh persetujuan pemesanan, Anda wajib melampirkan Surat Keterangan Dokter dari rumah sakit atau klinik yang sah sebagai bukti kebutuhan aksesibilitas, serta Surat Pernyataan bermaterai yang ditandatangani oleh suami/istri, anggota keluarga, atau wali. Dokumen hanya diterima apabila diterbitkan oleh institusi medis yang sah. Mohon kirimkan seluruh dokumen dalam format PDF ke support@loket.com paling lambat 24 Agustus 2026 dengan subjek email "WHEELCHAIR ACCESS REQUEST - YE JAKARTA 2026".
For safety reasons, the Festival Standing area is not recommended for Ticket Holders with special medical conditions, pregnant women and, people with disabilities., Children and those under the age of 15 (fifteen) are not allowed in Festival Standing area16 years of age. A limited quota is available for areas accessible to wheelchair users. To obtain booking approval, you are required to attach a valid Doctor''s Certificate from a legitimate hospital or clinic as proof of accessibility needs, as well as a stamped Statement Letter signed by a spouse, family member, or guardian. Documents will only be accepted if issued by a legitimate medical institution. Please send all documents in PDF format to support@loket.com no later than 24 Agustus 2026 with the subject "WHEELCHAIR ACCESS REQUEST - YE JAKARTA 2026".

F. BARANG LARANGAN / PROHIBITED ITEMS

Barang-barang berikut dilarang dibawa ke dalam tempat acara diselenggarakan:
The following items are prohibited inside the venue:
Alkohol, obat-obatan terlarang, rokok, vape / Alcohol, narcotics, cigarettes, vape
Makanan dan minuman dari luar venue / Food and beverages from outside the venue
Segala jenis kamera, alat perekam audio dan video termasuk lensa tambahan untuk handphone dan tripod / All types of cameras, audio and video recording equipment, including add-on lenses for mobile phones.
Tripod, selfie stick.
Segala jenis perangkat tablet / All types of tablet devices.
Drone / Drones
Benda piroteknik, kembang api, korek api / Pyrotechnics, fireworks, lighters
Parfum botol kaca / glass bottle perfume
Senjata, benda tajam, tongkat, tiang bendera / Weapons, sharp objects, poles, flag poles
Laser pointer / Laser pointers
Tas berukuran besar (melebihi 30x30cm) / Oversized bags (exceeding 30x30cm)
Payung berukuran besar / Large umbrellas
Hewan peliharaan / Pets

Penyelenggara tidak menyediakan tempat penitipan barang. Setiap barang yang disita atau dibuang di area gate sepenuhnya menjadi tanggung jawab Pemegang Tiket. Penyelenggara tidak bertanggung jawab dan tidak akan memberikan ganti rugi atas barang yang disita, dibuang, atau tidak diperkenankan masuk ke dalam venue
No safety deposit facilities are provided by the Organiser. Any items confiscated or discarded at the gate shall be the sole responsibility of the Ticket Holder. The Organiser shall not be responsible and shall not provide any compensation for items that are confiscated, discarded, or not permitted to enter the venue.

G. PEREKAMAN & HAK CITRA / RECORDING & IMAGE RIGHTS

Dilarang melakukan perekaman audio/video profesional atau live streaming.
Professional audio/video recording or live streaming is prohibited.
Dengan memasuki venue, Pemegang Tiket memberikan izin kepada Penyelenggara dan pihak-pihak yang ditunjuk untuk merekam, mengambil foto, dan menggunakan citra/suara Pemegang Tiket yang terekam selama acara berlangsung untuk keperluan publikasi, dokumentasi, dan promosi, tanpa kompensasi tambahan. Penggunaan citra bersifat insidental dan tidak dimaksudkan sebagai penonjonal individu.
By entering the venue, the Ticket Holder grants the Organiser and its designated parties the right to record, photograph, and use the Ticket Holder''s captured image/voice during the event for publication, documentation, and promotional purposes, without additional compensation. The use of such images is incidental and is not intended as the highlighting of any individual.

H. KESELAMATAN & KEAMANAN / SAFETY & SECURITY

Penyelenggara akan menyediakan petugas keamanan, tenaga medis, dan fasilitas medis darurat di venue. Namun Penyelenggara tidak dapat menjamin kondisi bebas risiko sepenuhnya mengingat sifat acara massa berskala besar.
The Organiser will provide security personnel, medical staff, and Emergency Medical Services (EMS) facilities at the venue. However, the Organiser cannot guarantee a fully risk-free environment given the nature of large-scale mass events.
Penyelenggara berhak mengubah tata letak venue, akses pintu masuk, dan konfigurasi area demi pertimbangan keselamatan, tanpa pemberitahuan sebelumnya.
The Organiser reserves the right to change the venue layout, entry access, and area configuration for safety reasons, without prior notice.

I. PEMBATASAN TANGGUNG JAWAB / LIMITATION OF LIABILITY

Sejauh diizinkan oleh hukum yang berlaku di Indonesia, tanggung jawab Penyelenggara kepada Pemegang Tiket atas segala klaim yang timbul dari atau sehubungan dengan kehadiran di acara ini dibatasi hingga sebesar harga tiket pokok yang dibayarkan. Penyelenggara tidak bertanggung jawab atas kerugian tidak langsung, kerugian konsekuensial, kehilangan keuntungan, biaya perjalanan, atau biaya akomodasi dalam kondisi apapun.
To the extent permitted by applicable Indonesian law, the Organiser''s liability to Ticket Holders for any claim arising from or in connection with attendance at this event is limited to the face value of the ticket purchased. The Organiser is not liable for indirect losses, consequential losses, lost profits, travel costs, or accommodation costs under any circumstances.
Penyelenggara tidak bertanggung jawab atas kehilangan, pencurian, atau kerusakan barang pribadi Pemegang Tiket di dalam atau di luar area tempat acara diselenggarakan.
The Organiser is not responsible for loss, theft, or damage to Ticket Holders'' personal property inside or outside the venue.

J. KEADAAN KAHAR / FORCE MAJEURE

Penyelenggara berhak membatalkan, menunda, atau mengubah acara akibat keadaan di luar kendali yang wajar (keadaan kahar / force majeure), termasuk namun tidak terbatas pada bencana alam, keputusan pemerintah, gangguan keamanan, atau kondisi cuaca ekstrem.
The Organiser reserves the right to cancel, postpone, or modify the event due to circumstances beyond reasonable control (force majeure), including but not limited to natural disaster, government order, security disruption, or extreme weather.
Dalam hal terjadi pembatalan konser oleh Penyelenggara, maka Tiket akan dikembalikan sesuai dengan ketentuan Penyelenggara.
In the event of a concert cancellation by the Organiser, ticket will be refunded in accordance with the Organiser''s terms and conditions.
Penyelenggara tidak bertanggung jawab atas biaya perjalanan, akomodasi, atau kerugian lain yang timbul akibat perubahan atau pembatalan acara, termasuk dalam kondisi keadaan kahar / force majeure.
The Organiser''s is not responsible for travel, accommodation expenses, or any other losses arising from event changes or cancellations, including in force majeure conditions.

K. DATA PRIBADI / PERSONAL DATA

Dengan membeli tiket dan/atau memasuki venue, Pembeli dan Pemegang Tiket memberikan persetujuan kepada Penyelenggara untuk mengumpulkan, menyimpan, memproses, dan menggunakan data pribadinya untuk keperluan pelaksanaan acara, termasuk pemenuhan kontrak tiket, pengendalian akses, keamanan, komunikasi terkait acara, serta pemenuhan kewajiban hukum. Data pribadi dapat dibagikan kepada instansi pemerintah yang berwenang dan pihak ketiga yang ditunjuk (antara lain penyedia layanan tiket, keamanan dan penyedia teknologi) sepanjang diperlukan untuk tujuan tersebut dan sesuai peraturan perundang-undangan yang berlaku.
By purchasing a ticket and/or entering the venue, the Ticket Buyer and Ticket Holder provides consent to the Organiser to collect, store, process, and use their personal data for the purposes of the event implementation, including ticket contract fulfillment, access control, security, event-related communication, and compliance with legal obligations. Personal data may be shared with competent government authorities and designated third parties (including ticket service providers, security providers, and technology providers) to the extent necessary for such purposes and in accordance with applicable laws and regulations.

L. KETENTUAN UMUM / GENERAL

Penyelenggara berhak mengubah Syarat & Ketentuan ini sewaktu-waktu. Perubahan akan diumumkan melalui yejakarta.com. Penggunaan tiket setelah perubahan dianggap sebagai penerimaan atas perubahan tersebut.
The Organiser reserves the right to amend these Terms and Conditions at any time. Changes will be announced via yejakarta.com. Use of the ticket after amendments constitutes acceptance thereof.
Syarat & Ketentuan ini tunduk pada hukum Republik Indonesia. Setiap sengketa yang timbul akan diselesaikan melalui musyawarah dan apabila tidak tercapai kesepakatan, diselesaikan melalui Pengadilan Negeri Jakarta Selatan.
These Terms are governed by the laws of the Republic of Indonesia. Any disputes shall first be resolved through good-faith negotiation and, if unresolved, through the South Jakarta District Court.
Ketidakpatuhan terhadap salah satu ketentuan di atas dapat mengakibatkan pembatalan tiket atau penolakan akses tanpa pengembalian dana.
Non-compliance with any of the above terms may result in ticket cancellation or entry refusal without refund.

TERMS & CONDITIONS RESERVE & HOLD PROGRAM

Pembelian tiket melalui program Reserve & Hold bersifat final dan tidak dapat dikembalikan. Seluruh pembayaran yang telah dilakukan dalam program Reserve & Hold bersifat final dan tidak dapat dikembalikan maupun ditukarkan dengan uang tunai atau kategori tiket lainnya. Larangan pengalihan ini berlaku sampai pelunasan 100% harga tiket; setelah e-ticket diterbitkan, tiket bersifat transferable sebagaimana diatur dalam ketentuan mengenai identitas Pembeli Tiket.
Ticket purchases made through the Reserve & Hold program are final and non-refundable. All payments made under the Reserve & Hold program are final and cannot be refunded or exchanged for cash or for tickets in any other category. The restriction on transfer applies until 100% of the ticket price has been paid; after the e-ticket is issued, the ticket is transferable as set out in the Ticket Buyer identity provision.
Pembeli Tiket wajib menyelesaikan pembayaran sesuai dengan jadwal pembayaran yang telah ditentukan sebagaimana tercantum di bawah ini. Kegagalan untuk menyelesaikan salah satu pembayaran hingga batas waktu yang telah ditentukan akan mengakibatkan reservasi tiket secara otomatis dibatalkan dan dinyatakan tidak berlaku (void), tanpa pemberitahuan sebelumnya. Seluruh pembayaran yang telah dilakukan akan hangus dan tidak dapat dikembalikan. Kegagalan menyelesaikan pembayaran pada Termin 1 dan/atau pelunasan pada Termin 2 sampai dengan batas waktu yang ditentukan merupakan wanprestasi (gagal bayar). Dalam hal gagal bayar, reservasi batal secara otomatis dan seluruh dana yang telah dibayarkan, termasuk pembayaran Termin 1, hangus serta tidak dapat dikembalikan.
Ticket Buyers are required to complete payments in accordance with the payment schedule set forth below. Failure to complete any payment by the applicable deadline will result in the automatic cancellation and voiding of the ticket reservation, without prior notice. All payments already made will be forfeited and will not be refunded. Failure to complete the Term 1 payment and/or the Term 2 settlement by the applicable deadline constitutes default. In the event of default, the reservation is automatically cancelled and all amounts already paid, including the Term 1 payment, are forfeited and will not be refunded.
TERM 1 - RESERVATION
START: SEPTEMBER 5TH, 2026 10:00 WIB
DUE DATE: SEPTEMBER 20TH, 2026 23:59 WIB
TERM 2 - FINAL PAYMENT
START: SEPTEMBER 21ST, 2026 00:00 WIB
DUE DATE: OCTOBER 11TH, 2026 23:59 WIB
Program Reserve & Hold disediakan masing-masing 5 (lima) kategori yaitu; (a) Super Fans Festival, (b) CAT 1, (c) CAT 2, (d) CAT 3, dan (e) Festival.
The Reserve & Hold program is offered across 5 (five) categories; (a) Super Fans Festival, (b) CAT 1, (c) CAT 2, (d) CAT 3, dan (e) Festival.
Batas waktu pembayaran bersifat final dan tidak dapat diperpanjang. Segala permintaan perpanjangan waktu pembayaran ataupun permintaan pengaktifan kembali tiket atau reservasi yang telah dibatalkan tidak dapat dipenuhi.
All payment deadlines are final and cannot be extended. Any requests for an extension of the payment deadline or for the reinstatement of cancelled tickets or reservation will not be accommodated.
Pembelian tiket melalui program Reserve & Hold bertujuan untuk mengamankan tiket yang telah dipilih oleh Pembeli Tiket di termin ke-1. Pembeli Tiket baru dianggap memiliki hak penuh atas tiket setelah berhasil melakukan pelunasan atas sisa harga tiket pada termin ke-2, sehingga seluruh harga tiket (100%) telah dibayarkan penuh, pembayaran sebesar 100% dari harga tiket pada termin ke-2 dan memenuhi seluruh persyaratan pembayaran yang berlaku. E-ticket hanya akan diterbitkan setelah Pembeli Tiket berhasil menyelesaikan pembayaran sebesar 100% dari harga tiket dan memenuhi seluruh persyaratan pembayaran yang berlaku.
Ticket purchases through the Reserve & Hold program are intended to secure the tickets selected by the Ticket Buyer during Term 1. The Ticket Buyer will only be deemed to have full rights to the tickets upon settlement of the remaining balance of the ticket price during Term 2, such that 100% of the ticket price has been paid in full, and fulfillment of all applicable payment requirements. E-tickets will only be issued after the Ticket Buyer has successfully completed 100% payment of the ticket price and fulfilled all applicable payment requirements.
Reservasi dalam program Reserve & Hold hanya dapat didaftarkan dan dilanjutkan atas satu nama Pembeli Tiket yang tercatat pada saat pemesanan Termin 1. Nama tersebut tidak dapat diubah, dialihkan, atau digantikan oleh pihak lain sampai dengan pelunasan 100% harga tiket. Setelah pelunasan 100% harga tiket dan penerbitan e-ticket, tiket bersifat transferable sesuai mekanisme dan syarat yang berlaku pada platform penjualan tiket.
A reservation under the Reserve & Hold program may only be registered and continued under the single Ticket Buyer name recorded at the time of the Term 1 booking. That name may not be changed, assigned, or substituted by any other party until 100% of the ticket price has been paid. After 100% payment and issuance of the e-ticket, the ticket is transferable in accordance with the then-applicable ticket platform mechanism and terms.

TERMS AND CONDITIONS OF HOTEL BUNDLING

Paket Hotel Bundling YE JAKARTA 2026 tersedia dalam beberapa pilihan bundling mencakup 2 tiket konser yang dipadukan dengan pilihan akomodasi menginap selama 1 (satu) malam atau 2 (dua) malam. Pilihan paket yang tersedia meliputi:
YE JAKARTA 2026 Hotel Bundling packages are available in several options, offering a choice of either a 1-night or 2-night stay combined with two (2) concert tickets. The available packages are as follows:
CAT 1
CAT 1 Artotel Mangkuluhur - Artotel Mangkuluhur, Atelier
CAT 1 Artotel Mangkuluhur - Artotel Mangkuluhur, Premium
CAT 1 Ayana - Ayana, Deluxe
CAT 1 Gran Mahakam - Gran Mahakam, Deluxe
CAT 1 Gran Mahakam - Gran Mahakam, Junior Suite
CAT 1 Gran Mahakam - Gran Mahakam, Deluxe Suite
CAT 1 Grand Hyatt - Grand Hyatt, Grand Room City
CAT 1 Hermitage - Hermitage, Deluxe
CAT 1 Kempinski - Kempinski, Deluxe
CAT 1 Kempinski - Kempinski, Grand Deluxe
CAT 1 Kempinski - Kempinski, Executive
CAT 1 Mandarin Oriental - Mandarin Oriental, Deluxe
CAT 1 Pullman Thamrin - Pullman Thamrin, Premium Superior
CAT 1 The Westin - The Westin, Deluxe Skyline
CAT 1 The Westin - The Westin, Westin Room
CAT 1 Le Meridien - Le Meridien, Premier Room
CAT 2
CAT 2 Four Points - Four Points, Deluxe
CAT 2 Four Points - Four Points, Premium Deluxe
CAT 2 GranDhika Iskandarsyah - GranDhika Iskandarsyah, Deluxe
CAT 2 Mercure Gatot Subroto - Mercure Gatot Subroto, Superior
Setiap Paket Bundling Hotel hanya berlaku untuk periode menginap pada tanggal 23-25 Oktober 2026 atau 24-25 Oktober 2026. Paket mencakup akomodasi hotel dan 2 (dua) tiket konser sesuai kategori yang dipilih.
Each Hotel Bundling Package is valid exclusively for stay periods between October 23-25, 2026, or October 24-25, 2026. Each package includes hotel accommodation and two (2) concert tickets for the selected category.
Penjualan paket Hotel Bundling YE JAKARTA 2026 secara resmi hanya tersedia melalui situs resmi yejakarta.com.
YE JAKARTA 2026 Hotel Bundling packages are sold exclusively through the official website at yejakarta.com.
Pembelian wajib menggunakan nama sesuai identitas resmi (KTP, KK, SIM, atau paspor), untuk proses reservasi hotel. Nama tidak dapat diubah setelah transaksi selesai.
All purchases must be made under a name that matches an official government ID (ID Card/KTP, Family Card/KK, Driver''s License/SIM, or Passport) for hotel reservation purposes. Names cannot be changed after the transaction is completed.
Pembelian paket Hotel Bundling YE JAKARTA 2026 dibatasi maksimal 2 (dua) paket per transaksi.
Purchases of YE JAKARTA 2026 Hotel Bundling packages are limited to a maximum of 2 (two) packages per transaction.
Seluruh paket Hotel Bundling YE JAKARTA 2026 yang telah dibeli tidak dapat dibatalkan, tidak dapat dipindahtangankan, atau dimodifikasi dengan alasan apa pun. Paket Hotel Bundling yang diperjualbelikan atau digunakan tidak sesuai ketentuan berpotensi dibatalkan tanpa pengembalian dana, serta pemegang tiket dapat ditolak masuk ke area acara. Penyelenggara tidak bertanggung jawab atas penyalahgunaan tiket oleh pihak lain akibat kelalaian pembeli.
All purchased YE JAKARTA 2026 Hotel Bundling packages are strictly non-refundable, non-transferable, and non-modifiable for any reason. Tickets that are resold or used in violation of these terms may be canceled without a refund, and ticket holders may be denied entry to the event venue. The organizer is not responsible for any ticket misuse resulting from buyer negligence.
Dengan melakukan pembelian, pembeli dianggap telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan yang berlaku.
By completing the purchase, buyers are considered to have read, understood, and agreed to all applicable terms and conditions.
Check-in hotel dapat dilakukan mulai pukul 14.00 WIB. Setiap paket menjamin kamar untuk 2 (dua) orang. Permintaan extra bed (jika diperlukan) akan dikenakan biaya tambahan dan diatur langsung dengan pihak hotel.
Hotel check-in starts at 2:00 PM WIB. Each package guarantees accommodation for two (2) guests. Requests for an extra bed (if required) will incur additional charges and must be arranged directly with the hotel.
Jika terjadi pembatalan event, pemesanan hotel tidak dapat di-refund. Namun, kamar hotel tetap dapat digunakan sesuai dengan tanggal pemesanan awal. Ketentuan terkait tiket akan mengikuti Syarat dan Ketentuan Pembelian Tiket yang berlaku.
In the event of a concert cancellation, the hotel reservation is non-refundable; however, the room will remain available for use on the originally booked dates. Any matters relating to the tickets shall be governed by the applicable Terms and Conditions of Ticket Purchase.
Dengan melakukan pemesanan, Tamu memberikan persetujuan kepada Penyelenggara dan/atau hotel untuk mengumpulkan, menyimpan, dan menggunakan data pribadi yang diberikan semata-mata untuk keperluan pemrosesan reservasi hotel, komunikasi terkait pemesanan, dan pemenuhan kewajiban hukum yang berlaku. Penggunaan data pribadi akan tunduk pada ketentuan peraturan perundang-undangan mengenai Perlindungan Data pribadi di Indonesia.
By making a reservation, the Guest concerts to the collection, storage, and use of the personal data provided solely for the purpose of processing the hotel reservation, related communications, and compliance with applicable legal obligations. The processing of personal data shall be subject to the prevailing personal data protection laws and regulations in Indonesia.
Penjualan paket Hotel Bundling hanya dibuka hingga tanggal 30 September 2026. Setelah tanggal tersebut, paket Hotel Bundling dengan harga dan kategori yang tertera di atas tidak lagi berlaku. Pengecualian berlaku untuk Ayana Hotel (hingga 15 September 2026) dan Pullman Thamrin Hotel (hingga 23 September 2026).
Sales of the Hotel Bundling packages are available only until September 30, 2026, after which the rates and categories specified above will no longer be valid. Exceptions apply to Ayana Hotel (available until September 15, 2026) and Pullman Thamrin Hotel (available until September 23, 2026).
Penyelenggara dan/atau hotel tidak bertanggung jawab atas kegagalan atau keterlambatan dalam melaksanakan kewajiban yang disebabkan oleh kejadian di luar kendali yang wajar, termasuk namun tidak terbatas pada bencana alam, pandemi, wabah, perang, kerusuhan, tindakan pemerintah, atau keadaan kahar lainnya (force majeure). Dalam hal terjadi force majeure, Penyelenggara akan berupaya memberitahukan Tamu dalam waktu yang wajar.
Neither the Organizer nor the hotel shall be liable for any failure or delay in performing their obligations arising from events beyond their reasonable control, including but not limited to natural disasters, pandemics, epidemics, war, civil unrest, government actions, or other force majeure events. In the event of force majeure, the Organizer shall endeavor to notify the Guest within a reasonable time.
Untuk informasi lebih lanjut:
For further information:
Ticket: LOKET Customer Service - support@loket.com / +62 21 3000 3160
Hotel : Illa - +62 877-8111-6221

FREQUENTLY ASKED QUESTIONS (FAQ)

Di mana saya dapat membeli tiket resmi?
Tiket resmi hanya dapat dibeli melalui yejakarta.com dan platform resmi yang ditunjuk oleh Penyelenggara (Loket.com). Pembelian melalui pihak lain atau calo sepenuhnya menjadi risiko pembeli. Pastikan Anda telah mendaftarkan di Loket.com untuk mempermudah transaksi pembelian.
Pastikan Anda telah mendaftarkan di Loket.com untuk mempermudah transaksi pembelian.
Where can I buy official tickets?
Official tickets can only be purchased through yejakarta.com and the official ticketing partner appointed by the organizer, Loket.com. Purchases made through third parties or scalpers are entirely at the buyer''s own risk.
Make sure you have registered a Loket.com account to facilitate your purchase transaction.

Berapa banyak tiket yang bisa saya beli?
Pembelian dibatasi maksimal 8 (delapan) tiket per transaksi dan bisa untuk kategori yang berbeda. 1 (satu) alamat email, 1 (satu) nomor identitas diri dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.
What is the maximum number of tickets I can buy?
Purchases are limited to a maximum of 8 (eight) tickets per transaction, and purchasing tickets across different categories is permitted. 1 (one) email address, 1 (one) ID number, and 1 (one) phone number are limited to 1 (one) transaction.

Kapan saya akan menerima tiket?
Setelah transaksi pembelian berhasil, Booking Confirmation akan dikirimkan ke alamat email yang digunakan saat melakukan pembelian. Selanjutnya, e-ticket akan tersedia di aplikasi LOKET X menggunakan akun atau alamat email yang sama setelah tiket diterbitkan oleh Loket. E-ticket hanya dapat diakses melalui aplikasi LOKET X.
When will I receive my ticket?
After a successful purchase transaction, a Booking Confirmation will be sent to the email address used during purchase. Subsequently, the e-ticket will be available in the LOKET X app using the same account or email address once issued by the Loket. E-tickets can only be accessed through the LOKET X app.

Kapan nomor kursi (seat number) saya tersedia?
Bagi pemegang tiket kategori VIP, CAT 1, CAT 2, CAT 3 dan CAT 4, nomor kursi akan diumumkan mendekati hari konser melalui aplikasi LOKET X. Informasi ini tidak tersedia pada saat pembelian tiket.
When will my seat number be available?
For ticket holders categories: VIP, CAT 1, CAT 2, CAT 3, and CAT 4, seat numbers will be informed a few days before the concert via the LOKET X app. This information is not available at the time of ticket purchase.

Apakah saya boleh menggunakan screenshot e-tiket untuk masuk ke venue?
Tidak. QR yang tersedia di LOKET X tidak bisa di-screenshot. Anda wajib menunjukkan QR e-ticket asli yang tersedia di aplikasi LOKET X saat proses validasi di venue.
Can I use a screenshot of the e-ticket to enter the venue?
No. The QR code in LOKET X cannot be screenshotted. You must show the original QR e-ticket available in the LOKET X application during the validation process at the venue.

Apakah e-tiket dapat dipindahkan kepada orang lain?
Ya. Setelah QR e-tiket tersedia di aplikasi LOKET X, Anda dapat menggunakan fitur Transfer Tiket untuk mengirimkan e-ticket kepada teman atau anggota keluarga melalui aplikasi LOKET X. Setiap e-ticket hanya dapat ditransfer 1 (satu) kali.
Can the e-ticket be transferred to someone else?
Yes. Once the e-ticket is available in the LOKET X app, you can use the Ticket Transfer feature to send the e-ticket to a friend or family member via the LOKET X app. Each e-ticket can only be transferred 1 (one) time.

Apakah saya dapat keluar dan masuk kembali ke venue?
Tidak. Acara ini menerapkan kebijakan NO RE-ENTRY. Setelah keluar dari area venue, Anda tidak diperkenankan masuk kembali dengan alasan apa pun.
Can I re-enter the venue?
No. This event enforces a strict NO RE-ENTRY policy. Once you leave the venue area, you will not be allowed re-entry for any reason.

Berapa batas usia untuk menghadiri konser?
- Anak di bawah usia 15 tahun wajib didampingi secara terus-menerus oleh orang tua atau wali berusia minimal 18 tahun yang juga memiliki tiket pada kategori yang sama.
- Orang tua atau wali bertanggung jawab penuh atas pengawasan anak, memastikan anak tetap berada di area sesuai kategori tiketnya, serta menerima seluruh risiko yang melekat pada konser, termasuk suara keras, piroteknik, kepadatan kerumunan, dan kemungkinan pergerakan kerumunan secara tiba-tiba.
What is the age restriction for attending the concert?
- Children under 15 years old must be continuously accompanied by a parent or legal guardian aged at least 18 years who also holds a ticket in the same ticket category.
- Parents or guardians are fully responsible for supervising the child, ensuring the child remains in the correct ticket category area, and acknowledge the inherent risks of a live concert, including loud sound, pyrotechnics, crowd density, and possible sudden crowd movement.

Barang apa saja yang tidak boleh dibawa ke dalam venue?
Barang yang dilarang antara lain:
- Alkohol, obat-obatan terlarang, rokok, vape;
- Makanan dan minuman dari luar;
- Kamera profesional, alat perekam video/audio, GoPro, tablet;
- Drone;
- Benda piroteknik, kembang api, korek;
- Parfum botol kaca;
- Senjata, benda tajam, tongkat, tiang bendera;
- Laser pointer;
- Tas berukuran besar (melebihi 30x30cm);
- Payung berukuran besar;
- Hewan peliharaan.
Penyelenggara tidak menyediakan penitipan barang.
What items are prohibited inside the venue?
Prohibited items include:
- Alcohol, narcotics, cigarettes, vape;
- Food and beverages from outside the venue;
- Professional cameras, video/audio recorders, GoPro, tablet devices;
- Drones
- Pyrotechnics, fireworks, lighters
- Glass bottle perfume
- Weapons, sharp objects, poles, flag poles;
- Laser pointers
- Oversized bags (exceeding 30x30cm);
- Large umbrellas
- Pets
Note: The organizer does not provide luggage storage/cloakroom services.

Apakah tiket dapat dibatalkan atau dikembalikan?
Seluruh penjualan tiket bersifat final. Tiket yang telah dibeli tidak dapat ditukar maupun dikembalikan dananya, kecuali apabila acara dibatalkan oleh Penyelenggara sesuai ketentuan yang berlaku.
Can tickets be canceled or refunded?
All ticket sales are final. Tickets purchased cannot be exchanged or refunded, unless the event is canceled by the organizer in accordance with applicable regulations.

Apa yang harus saya lakukan sebelum datang ke venue?
Pastikan Anda:
- Sudah login ke akun LOKET X yang digunakan saat membeli tiket.
- Memastikan e-ticket telah tersedia di aplikasi.
- Tidak membagikan QR e-tiket kepada siapa pun.
- Membawa identitas diri yang masih berlaku apabila diperlukan untuk proses verifikasi.
- Datang lebih awal agar proses validasi berjalan lancar.
What should I do before arriving at the venue?
Make sure you:
- Are logged into the LOKET X account used to purchase the ticket.
- Verify that your e-ticket is available in the app.
- Do not share your QR e-ticket with anyone.
- Bring a valid photo ID for verification if required.
- Arrive early to ensure a smooth validation process.

Bisakah saya dan teman saya mendapatkan tempat duduk bersebelahan jika membeli tiket secara terpisah?
Untuk memastikan tempat duduk bersebelahan, tiket wajib dibeli dalam satu transaksi yang sama. Jika tiket dibeli melalui transaksi terpisah, nomor kursi akan dialokasikan secara otomatis oleh sistem dan tidak dapat diubah atau disesuaikan untuk memastikan tempat duduk bersebelahan.
Can my friend and I get seats next to each other if we purchase our tickets separately?
To guarantee seats next to each other, tickets must be purchased in a single transaction. If tickets are bought through separate transactions, seat numbers will be assigned automatically by the system and cannot be modified or adjusted to ensure adjacent seating.

COPYRIGHT

(c) 2026 RAW VISION COLLECTIVE & PT GLOBAL LOKET SEJAHTERA. ALL RIGHTS RESERVED.' WHERE title = 'YE JAKARTA 2026' AND venue = 'Jakarta Pusat';
UPDATE events SET seatmap = '{"name":"Gelora Bung Karno - Denah Tempat Duduk","images":["https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026916/WhatsApp_Image_2026-09-10_at_2.50.23_PM_3.jpg","https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026917/WhatsApp_Image_2026-09-10_at_2.50.23_PM_4.jpg"]}' WHERE title = 'YE JAKARTA 2026' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = 'Terms & Conditions

Ticket(s) are sold by the Promoters directly to the consumer. Any tickets purchased by businesses or traders in breach of the Terms & Conditions of ticket sale will be canceled. By accepting these terms and conditions you confirm that you are a consumer.
Tiket dijual secara langsung oleh Promotor ke konsumen. Tiket apa pun yang dibeli oleh pelaku usaha atau pedagang yang melanggar Syarat & Ketentuan penjualan tiket akan dibatalkan. Dengan menerima syarat dan ketentuan ini, Anda mengkonfirmasi bahwa Anda adalah konsumen.

Tickets ownership cannot be transferred for commercial purposes, including but not limited to prizes, competitions, contests or sweepstakes. Tickets sold or used in breach of this condition may be nullified without a refund, where the Ticket Holder will be refused admission into the concert area with no exception. The Promoter is not responsible for the negligence of the Ticket Buyer which results in the ticket falling into the hands of other parties which can be used as an entry requirement, thereby eliminating the Ticket Buyer''s rights to enter the venue area.
Tiket tidak dapat dialihkan kepemilikan dengan tujuan komersial, termasuk namun tidak terbatas kepada hadiah, kompetisi, kontes, atau undian. Tiket yang dijual atau digunakan dengan melanggar persyaratan ini dapat dibatalkan tanpa pengembalian dana, dan Pemegang Tiket akan ditolak masuk ke dalam area acara tanpa terkecuali. Penyelenggara tidak bertanggung jawab atas kelalaian Pembeli Tiket yang mengakibatkan Tiket jatuh ke tangan orang lain dan dipergunakan sebagai tanda masuk, sehingga menghilangkan hak Pembeli Tiket untuk masuk ke area acara.

Your Ticket/s will IMMEDIATELY BECOME INVALID if resold OR OFFERED FOR SALE. Tickets sold via third parties or other unauthorized outlets, including online auction sites are not valid for admission. The resale of a Ticket renders it invalid and may lead to refusal of entry.
Tiket Anda LANGSUNG MENJADI TIDAK VALID jika dijual kembali ATAU DITAWARKAN UNTUK DIJUAL. Tiket yang dijual melalui pihak ketiga dan outlet tidak resmi lainnya, termasuk situs lelang online tidak berlaku untuk tiket masuk. Penjualan kembali Tiket menjadikannya tidak sah dan dapat menyebabkan penolakan masuk.

Every Ticket Holder who comes to the event area is responsible for their own safety, health and personal security. The Sponsors/Band/Promoter/Management are not responsible for, including but not limited to any injury or damage that may occur to Ticket Holders during or in the event.
Setiap Pemegang Tiket yang datang ke area acara bertanggung jawab atas keselamatan, kesehatan, dan keamanan pribadinya sendiri. Para Sponsor/Band/Penyelenggara/Manajemen tidak bertanggung jawab untuk, termasuk namun tidak terbatas pada cedera atau kerusakan yang mungkin terjadi kepada Pemegang Tiket selama atau di dalam acara tersebut.

Your Ticket purchase constitutes a personal, revocable license and, at all times, remains the property of the promoters.
Tiket Anda merupakan lisensi pribadi yang dapat dibatalkan dan, sepanjang waktu, tetap menjadi milik promotor.

All ticket sales are final. Tickets that have been sold cannot be exchanged and can not be cashed out.
Semua penjualan Tiket adalah final. Tiket yang telah terjual tidak dapat ditukar dan tidak dapat diuangkan kembali.

By purchasing the tickets for the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA., you agree to the collection, storage and limited use of your personal data for the purposes of the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA. in accordance with Indonesian prevailing regulations concerning Personal Data Protection.
Dengan membeli Tiket acara BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA., Anda telah menyetujui pengumpulan, penyimpanan dan penggunaan data pribadi Anda secara terbatas untuk keperluan acara BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA. sesuai dengan ketentuan peraturan perundang-undangan yang berlaku di Indonesia terkait Perlindungan Data Pribadi.

By purchasing tickets to the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA., Ticket Buyers and Ticket Holders agree to comply with all the Terms & Conditions of the event that are determined and valid from time to time.
Dengan membeli Tiket untuk ke acara konser BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA., maka Pembeli Tiket dan Pemegang Tiket setuju untuk menaati setiap dan seluruh Syarat & Ketentuan acara yang ditetapkan dan berlaku dari waktu ke waktu.

The Ticket Holder grants the Promoter and Sponsors the right to use, in perpetuity, all or any part of the recording of any video and still footage made of the Ticket holder''s appearance on any channels, including but not limited to magazine, social media, and TV for broadcast in any and all media globally used for advertising, publicity and promotions relating thereto without any further approval of yours.
Pemegang Tiket memberikan hak kepada Penyelenggara acara dan para Sponsor untuk melakukan rekaman video dan gambar baik sebagian atau semua, pada kanal/platform apapun, termasuk namun tidak terbatas pada majalah, media sosial, dan saluran TV untuk disiarkan di media apapun di seluruh dunia, untuk iklan, publisitas dan promosi yang berkaitan dengan konser tanpa persetujuan lebih lanjut dari Pemegang Tiket.

The Promoter has the right to refuse admission to and/or evict Ticket-Holders who do not abide by the Terms and Conditions of the event.
Penyelenggara acara memiliki hak untuk menolak masuk dan/atau mengeluarkan orang-orang yang tidak menaati syarat dan ketentuan acara.

The Promoter has the right to process and prosecute in accordance with the provisions of the prevailing laws and regulations, both civil procedure and criminal procedure against people who obtain tickets through illegal means, including but not limited to forging or duplicating valid tickets, or obtaining the tickets in a way that is not in accordance with what has been determined by the Promoter, as stated in these Terms and Conditions.
Penyelenggara berhak untuk memproses dan menuntut secara hukum sesuai dengan ketentuan peraturan perundang-undangan yang berlaku baik secara perdata maupun secara pidana terhadap orang-orang yang memperoleh Tiket dengan cara yang tidak sah termasuk namun tidak terbatas pada cara melakukan pemalsuan atau menggandakan Tiket yang sah atau memperoleh Tiket dengan cara yang tidak sesuai dengan yang telah ditentukan oleh Penyelenggara sebagaimana dalam Syarat dan Ketentuan ini.

Please check our Instagram account (@pkentertainment.id and @soundrhythm) periodically for more information about the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA.
Mohon cek akun Instagram kami (@pkentertainment.id dan @soundrhythm) secara berkala untuk informasi lebih lanjut seputar acara BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA.

Tickets can be purchased on Loket.com via bigbanginjakarta.com. Tickets are only for admission to the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA.
Tiket dapat dibeli di Loket.com melalui bigbanginjakarta.com. Tiket dapat digunakan untuk masuk ke acara konser BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA.

Ticket price excludes 10% government tax, 6% ticketing platform fee and any other applicable fees.
Harga Tiket tidak termasuk 10% pajak pemerintah, 6% biaya platform tiket dan biaya lain yang berlaku.

BIGBANG V.I.P MEMBERSHIP PRESALE is limited to a maximum of 2 (two) per transaction, 1 (one) membership code, 1 (one) email address, and 1 (one) phone number is limited to 1 (one) transaction.
Penjualan BIGBANG V.I.P MEMBERSHIP Presale dibatasi maksimal 2 (dua) per transaksi, 1 (satu) kode keanggotaan, 1 (satu) alamat email dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.

BCA PRESALE and INDOSAT PRESALE are limited to a maximum of 2 (two) per transaction, 1 (one) email address and 1 (one) phone number is limited to 1 (one) transaction.
Penjualan BCA PRESALE dan INDOSAT PRESALE dibatasi maksimal 2 (dua) per transaksi dalam kategori yang sama. 1 (satu) alamat email dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.

GENERAL ON SALE is limited to a maximum of 4 (four) per transaction, 1 (one) email address and 1 (one) phone number is limited to 1 (one) transaction.
Penjualan GENERAL ON SALE dibatasi maksimal 4 (empat) per transaksi dalam kategori yang sama. 1 (satu) alamat email dan 1 (satu) nomor telepon dibatasi 1 (satu) transaksi.

To participate in the BIGBANG V.I.P MEMBERSHIP PRESALE, you must apply for the BIGBANG V.I.P MEMBERSHIP PRESALE SURVEY in advance on B.Stage. Only BIGBANG V.I.P MEMBERSHIP holders are eligible to participate in the BIGBANG V.I.P MEMBERSHIP PRESALE. Please take note of the schedule, as application is not possible outside of the application period and make sure to check the correct time and date for different time zones.
Untuk mengikuti BIGBANG V.I.P MEMBERSHIP PRESALE, Anda harus melakukan pendaftaran BIGBANG V.I.P MEMBERSHIP PRESALE SURVEY terlebih dahulu melalui B.Stage. Hanya pemegang BIGBANG V.I.P MEMBERSHIP yang berhak mengikuti BIGBANG V.I.P MEMBERSHIP PRESALE. Harap memperhatikan jadwal yang telah ditentukan, karena pendaftaran tidak dapat dilakukan di luar periode yang ditetapkan. Pastikan juga untuk memeriksa tanggal dan waktu yang sesuai dengan zona waktu masing-masing.

Purchasing tickets for the BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA. must use the name according to a valid photo ID. Make sure to buy tickets using your valid and correct data (ID Card/KK/KTP/SIM/Passport). Your ticket(s) cannot be changed and/or modified once the purchase has been made.
Pembelian tiket konser BIGBANG 2026–2027 WORLD TOUR < XX : COSMOS > IN JAKARTA. wajib menggunakan Nama sesuai dengan kartu identitas yang sah. Pastikan Anda melakukan pembelian Tiket dengan menggunakan data Anda yang sah dan benar (Kartu Identitas/KK/KTP/SIM/Paspor). Tiket Anda tidak dapat diubah dan/atau dimodifikasi setelah pembelian telah dilaksanakan.

The Ticket Holder must occupy the seat or position that has been assigned by the Promoter according to the category of ticket purchased.
Pemegang Tiket wajib menempati tempat duduk atau posisi yang telah ditentukan oleh pihak Penyelenggara sesuai dengan kategori Tiket yang dibeli.

In the event of a canceled concert, tickets will be refunded in accordance with the provisions of the Promoter. Refunds do not include Platform Fees, Convenience Fees, or any other personal costs of the Ticket Buyer (e.g. travel expenses, accommodation expenses, etc).
Jika terjadi pembatalan konser, maka Tiket akan dikembalikan sesuai dengan ketentuan Penyelenggara. Pengembalian harga Tiket tidak termasuk Biaya Platform, Biaya Lainnya dan biaya pribadi Pembeli Tiket (contoh biaya perjalanan, biaya akomodasi, dll).

In order for Tickets to be valid on show day, the Ticket Buyer will be asked to provide the following items alongside their redeemed wristbands:
a. Photo ID (ID Card/KK/KTP/SIM/Passport)
Agar Tiket Anda valid di hari konser, Pembeli Tiket akan diminta untuk menyediakan barang dibawah ini bersama gelang Anda:
a. Kartu identitas dengan foto (KK/KTP/SIM/Paspor)

The time and place for wristband redemption will be announced and informed through the promoter''s social networking services (@pkentertainment.id and @soundrhythm), as well as the official website www.bigbanginjakarta.com. It is recommended to exchange the e-voucher beforehand to avoid queues on the day of the concert.
Waktu dan tempat penukaran gelang akan diumumkan dan diinformasikan melalui media sosial promotor (@pkentertainment.id dan @soundrhythm), serta situs web resmi www.bigbanginjakarta.com. Disarankan untuk menukarkan e-voucher sebelumnya untuk menghindari antrian pada hari konser.

In order for Tickets to be valid for wristband redemption, the Ticket Buyer (Lead Booker) will be asked to provide all of the following items alongside their ticket(s):
- Photo ID (ID Card/KK/KTP/SIM/Passport)
- Loket.com E-Voucher
Agar Tiket Anda valid untuk penukaran gelang, Pembeli Tiket (Pemesan Utama) akan diminta untuk menyediakan barang dibawah ini bersama tiket Anda:
- Kartu identitas asli (ID Card/KK/KTP/SIM/Paspor)
- E-Voucher Loket.com

If wristband redemption is represented, please provide:
- Printed e-voucher
- Photo ID (ID Card/KK/KTP/SIM/Passport) of the wristband redeemer
- Copy of the Photo ID (ID Card/KK/KTP/SIM/Passport) of the original ticket holder
- Power of Attorney signed on a Rp.10.000 Duty Stamp by the represented party
Apabila penukaran gelang diwakili, mohon untuk menyediakan:
- E-voucher yang telah dicetak
- Kartu identitas asli (ID Card/KK/KTP/SIM/Paspor) penukar tiket
- Fotokopi identitas diri (KTP/KK/SIM/Paspor) pemesan tiket asli
- Surat Kuasa yang ditandatangani di atas materai Rp.10.000 oleh pihak yang diwakili

The Promoter will not, for any reason, replace lost or damaged wristbands.
Penyelenggara tidak akan memberikan penggantian gelang yang hilang atau rusak karena alasan apa pun.

For audiences who feel unwell, it is highly recommended to wear a mask throughout the event.
Bagi penonton yang merasa kurang sehat, sangat disarankan untuk menggunakan masker selama acara berlangsung.

For safety reasons, individuals with disabilities and pregnant women are advised not to be in the standing area. Children under the age of 12 (twelve) and individuals under the height of 1.2m are not allowed in the standing area. Please contact our customer support for more information.
Demi alasan keamanan, penonton difabel dan wanita hamil disarankan untuk tidak berada di area standing. Anak-anak dibawah usia 12 (dua belas) tahun dan penonton dengan tinggi dibawah 1.2m tidak diperbolehkan untuk berada di area standing. Silakan hubungi layanan pelanggan kami untuk informasi lebih lanjut.

Strobe, laser and haze effects may be used during the show. Patrons susceptible to photosensitive epilepsy or other photo sensitivities may be affected.
Efek strobo, laser, dan kabut dapat digunakan selama pertunjukan. Pengunjung yang rentan terhadap epilepsi fotosensitif atau bentuk lain sensitivitas cahaya dapat terpengaruh.

The promoter reserves all rights to add any additional Terms / Conditions related to health protocols in accordance with the prevailing law and/or regulations at the time of the event.
Penyelenggara berhak untuk menambahkan Syarat/Ketentuan tambahan terkait protokol kesehatan sesuai dengan hukum dan/atau peraturan yang berlaku pada saat acara berlangsung.

Dedicated special needs / wheelchair accessible seating is only available in CAT 2. Ticket buyers requiring special needs assistance must purchase CAT 2 tickets.
Area tempat duduk khusus bagi penyandang disabilitas / pengguna kursi roda hanya tersedia di kategori CAT 2. Pembeli tiket yang memerlukan bantuan atau akses khusus wajib membeli tiket kategori CAT 2.

Ticket upgrades to CAT 2 may be required depending on ticket availability.
Upgrade kategori tiket ke CAT 2 dapat diperlukan, bergantung pada ketersediaan tiket.

There is a limited quota for wheelchair accessible seating and is subject to availability on a first-come, first served basis.
Terdapat kuota dalam jumlah terbatas untuk tempat duduk yang dapat diakses dengan kursi roda dan bergantung pada ketersediaan berdasarkan urutan permintaan.

To get your booking authorized, you must present a medical certificate as proof of disability. The Promoter only accepts medical certificates from legitimate institutions and/or physicians.
Untuk mendapatkan otorisasi pemesanan tempat duduk ini, Anda diwajibkan untuk melampirkan Surat Keterangan Dokter yang sah. Penyelenggara Acara hanya menerima Surat Keterangan Dokter yang berasal dari institusi yang sah, baik klinik maupun rumah sakit.

Relocation requests may be reviewed based on medical condition, seating availability, safety considerations and Promoter approval.
Permohonan perpindahan tempat duduk dapat dipertimbangkan berdasarkan kondisi medis, ketersediaan tempat duduk, pertimbangan keselamatan, serta persetujuan Penyelenggara.

For more information regarding wheelchair accessible seating and booking, please contact support@loket.com to process your booking.
Untuk informasi lebih lanjut dan pemesanan, silakan hubungi layanan pelanggan support@loket.com untuk memproses pemesanan Anda.

Promoters

Combining the power of the live event with a focus on true artist development, AEG Presents is a world leader in the music and entertainment industries.

Operating across four continents, the company has an unparalleled commitment to artistry, creativity, and community. Its tentpole festivals and multi-day music events — which include the iconic Coachella Valley Music & Arts Festival and the legendary New Orleans Jazz & Heritage Festival alongside American Express Presents BST Hyde Park, Stagecoach, Hangout Festival, Electric Forest, and Firefly — continue to set the bar for the live music experience. AEG Presents promotes global tours for artists such as The Rolling Stones, Elton John, Taylor Swift, Celine Dion, Justin Bieber, Kenny Chesney, Paul McCartney, and Katy Perry, in addition to — through its network of clubs, theatres, arenas, stadiums and renowned partner brands such as Goldenvoice, Messina Touring Group, Concerts West, The Bowery Presents, PromoWest Productions, Marshall Arts, Madison House Presents, and Zero Mile Presents — creating and developing an unmatched infrastructure for artist development and audience reach.

More information can be found at www.aegpresents.com.

PK Entertainment is Indonesia''s leading music promoter, established in 2015 by a collective of visionary strategists and creators. We are dedicated to curating and presenting world-class concerts that deliver exceptional live music experiences and create unforgettable memories for concertgoers.

Over the years, PK Entertainment has built a strong legacy of bringing some of the world''s biggest superstars and most exciting emerging artists to Indonesia and Thailand. Our portfolio includes internationally acclaimed acts such as Coldplay, Ed Sheeran, Celine Dion, Westlife, LANY, Shawn Mendes, Charlie Puth, Calum Scott, keshi, Tom Jones, ONE OK ROCK, YOASOBI, RADWIMPS, Fujii Kaze, Ado, Eve, Maroon 5, LINKIN PARK, Bruno Mars, BABYMONSTER and ATEEZ.

For more than a decade, we have been at the forefront of Indonesia''s live entertainment industry, producing world-class concerts. Building on this momentum, we are preparing an even more exciting lineup for 2026 and 2027, featuring internationally acclaimed artists such as ENHYPEN, BIGBANG, BOYNEXTDOOR, and many more.

PK Entertainment operates under PK Entertainment Group, alongside its business units including PK Events, PK Concerts, PK Films, PK Music, and PK Capital, forming an integrated entertainment ecosystem and positioning us as Indonesia''s one-stop entertainment and event powerhouse, delivering diverse, world-class experiences across live events, concerts, music, film, and creative production.

Sound Rhythm - The Outsiders. We are not followers.

Founded in 2002, Sound Rhythm''s DNA can be traced back way into the early 1990s when our founder is involved in the making of Air Supply (1994), Phil Collins (1995), Alanis Morissette (1996), Mr. BIG (1996), and 1996 Jakarta Alternative Festival (featuring Foo Fighters, Sonic Youth, Beastie Boys).

Various international artists that Sound Rhythm has handled are Calvin Harris, Suede, 2PM, David Foster & Friends, David Guetta, I AM HARDWELL, ASOT - Armin Van Buuren, Blur, Creed, Phoenix, Jennifer Lopez, OneRepublic, Chicago, Katy Perry, One Direction, The Vamps, Celine Dion, Ed Sheeran, LAUV, Shawn Mendes, The 1975, Justin Bieber, Westlife, Fujii Kaze, One OK Rock, Niall Horan, and many more to come.

In 2025, Sound Rhythm committed to expanding their horizon with not only promoting concerts but also promoting Sport and Family events.

For more information about Sound Rhythm, please visit: http://SoundRhythm.id
Instagram & X @SoundRhythm

Sponsored By

Customer Service Info

For more information about ticket purchase, wheelchair accessible seating please contact:

Loket.com
Phone: 021-30003160
Email: support@loket.com

PK Entertainment
Email: contact@pk-ent.com

Copyright

(c) 2026 PK ENTERTAINMENT GROUP INDONESIA. ALL RIGHTS RESERVED.

(c) 2026 LOKET (PT Global Loket Sejahtera). ALL RIGHTS RESERVED.' WHERE title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND venue = 'Jakarta Utara';
UPDATE events SET seatmap = '{"name":"Jakarta International Stadium - Seating & Zone","images":["https://res.cloudinary.com/pbzbhdg3/image/upload/v1789026915/WhatsApp_Image_2026-09-10_at_2.50.23_PM_5.jpg"]}' WHERE title = 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND venue = 'Jakarta Utara';
UPDATE events SET terms_conditions = 'Syarat & Ketentuan - Snada Indonesia 2026

Dengan membeli tiket Snada Indonesia 2026, Anda telah menyetujui seluruh Syarat & Ketentuan yang berlaku di bawah ini. Harap baca dengan saksama demi kenyamanan dan keselamatan semua pihak yang terlibat, terutama anak-anak dan keluarga.

Dengan membeli dan/atau menggunakan tiket ini, pengunjung dianggap telah membaca, memahami, dan menyetujui seluruh isi dokumen ini sebagai bentuk perjanjian yang mengikat antara pengunjung dan penyelenggara. Syarat & Ketentuan ini berlaku setara dengan kontrak dan dapat dijadikan acuan hukum apabila terjadi pelanggaran.

PEMBELIAN TIKET

Tiket hanya dapat dibeli melalui snadaindonesia.com

Harga tiket belum termasuk: Pajak Hiburan Daerah 10%, Biaya Admin 5%, dan Biaya platform pembayaran.

Setiap transaksi General Admission maksimal dapat membeli 4 (empat) tiket menggunakan data diri yang berbeda.

Satu tiket berlaku untuk satu orang dan dapat digunakan untuk keluar-masuk (re-entry).

Gunakan data identitas yang valid (KTP/SIM/Paspor) saat membeli tiket. Tiket tidak dapat diubah setelah pembelian.

Tiket bersifat digital dan akan tersedia H-5 konser melalui aplikasi Loket X (tersedia di Play Store dan App Store).

Tiket ini hanya untuk keperluan pribadi. Dilarang dijual kembali atau digunakan untuk kepentingan komersial tanpa izin promotor.

Pelanggaran terhadap ketentuan pembelian tiket dapat menyebabkan pembatalan tiket tanpa pengembalian dana.

Semua penjualan bersifat final. Tidak ada pengembalian dana, pertukaran, atau pengalihan kepemilikan.

BATASAN UMUR

Usia 17 tahun ke atas: Diperbolehkan menonton konser dan membeli tiket secara mandiri.

Usia 2-16 tahun: Diperbolehkan menonton konser dengan pendampingan orang dewasa (minimal berusia 17 tahun) dan wajib memiliki tiket. Pembelian tiket untuk anak harus dilakukan oleh orang dewasa yang mendampingi.

Usia di bawah 0-2 tahun: Tidak diperbolehkan masuk ke area konser.

KETERANGAN TIKET & TEMPAT DUDUK

Kategori tiket meliputi kategori CAT Diamond Spot, VIP, Platinum, Gold, Silver, Bronze, Festival

Promotor tidak menjual kursi yang terhalang sepenuhnya oleh pembatas/pilar.

INFORMASI NOMOR KURSI

Nomor kursi dipilih otomatis oleh sistem. Kursi akan diatur mulai dari barisan paling depan di setiap kategori, sesuai jumlah tiket dan waktu pembelian. First buy, first served.

Pembelian lebih dari 1 tiket, kursi akan diatur bersebelahan sesuai dengan jumlah tiket yang dibeli, selama masih tersedia.

Nomor kursi akan tersedia H-5 konser pada tiket Anda di aplikasi Loket X.

PERINGATAN KESELAMATAN

Konser akan menampilkan cahaya intens dan suara keras yang dapat menyebabkan gangguan kesehatan, terutama bagi pengunjung dengan kondisi medis seperti epilepsi fotosensitif, gangguan pendengaran, dan gangguan sensorik lainnya.

Pengunjung dengan kondisi medis serius (seperti gangguan jantung, tekanan darah tinggi, gangguan pernapasan, atau kondisi kronis lainnya) sangat disarankan untuk tidak menghadiri konser demi keselamatan pribadi.

Setiap pengunjung bertanggung jawab atas keselamatan diri sendiri dengan mempertimbangkan kondisi pribadi dan risiko yang mungkin timbul dari paparan cahaya intens, suara keras, kerumunan, serta kondisi area acara.

INFORMASI PENONTON

Tidak tersedia tempat penitipan barang pribadi. Hindari membawa koper, tas besar, atau barang berukuran besar lainnya.

Tiket hanya berlaku untuk pemilik terdaftar. Tiket yang digandakan atau disalahgunakan akan dibatalkan tanpa pengembalian dana.

Demi kenyamanan dan keamanan bersama, pengunjung wajib:
Mengikuti seluruh petunjuk dari petugas keamanan dan panitia
Tidak melakukan tindakan provokatif, berbahaya, atau mengganggu pengunjung lain
Tidak memanjat panggung, pagar pembatas, atau area terlarang lainnya
Tidak membuang sampah sembarangan

Panitia berhak menolak masuk atau mengeluarkan pengunjung tanpa pengembalian dana jika:
Tidak memiliki tiket sah
Mengganggu kenyamanan atau keamanan
Dalam pengaruh alkohol/narkoba
Membawa barang terlarang
Melanggar arahan keamanan atau tata tertib area acara

Dalam kondisi force majeure (pembatalan dari artis, terjadi bencana alam, kebijakan pemerintah, dll.), pengembalian dana akan mengikuti kebijakan promotor. Biaya tambahan seperti penginapan dan transportasi tidak ditanggung penyelenggara.

Penyelenggara, panitia, artis, dan pihak terkait lainnya tidak bertanggung jawab atas kehilangan, pencurian, kerusakan barang, atau kecelakaan di area konser.

BARANG-BARANG DILARANG

Demi keselamatan dan kelancaran acara, berikut adalah barang-barang yang tidak diperbolehkan dibawa ke dalam area konser:

Makanan dan minuman dari luar

Senjata tajam, senjata api, atau benda berbahaya lainnya

Laser pointer, kembang api, petasan, dan benda eksplosif lainnya

Kamera profesional (SLR/DSLR), kamera dengan lensa lepas, drone, tripod, monopod (selfie sticks), kamera aksi (GoPro dan sejenisnya)

Peralatan perekam suara atau video

Tablet, laptop, dan alat elektronik berukuran besar

Brosur, pamflet, atau barang promosi tanpa izin

Payung besar dan benda berukuran besar lainnya

Hewan peliharaan

Vape dan rokok tidak tersegel lebih dari 1 bungkus.

Parfum lebih dari 50ml

BARANG-BARANG YANG DIPERBOLEHKAN

Kamera analog tanpa lensa lepas, digicam, dan polaroid

Tumbler kosong atau berisi air mineral

Barang-barang yang dilarang akan disita dan tidak dikembalikan. Pelanggaran terhadap aturan ini dapat mengakibatkan pengunjung dikeluarkan dari area konser tanpa pengembalian uang tiket.

REKAMAN DAN PUBLIKASI

Pengunjung dilarang mengunggah video konser berdurasi lebih dari 30 detik per lagu ke media sosial.

Penyelenggara memiliki hak untuk merekam dan menggunakan dokumentasi konser, termasuk gambar atau pernyataan pengunjung, untuk keperluan promosi tanpa kompensasi.

Dengan hadir di area konser, pengunjung melepaskan dan membebaskan penyelenggara serta afiliasinya dari segala bentuk klaim, tuntutan, atau kompensasi yang berkaitan dengan dokumentasi tersebut.

PERUBAHAN DAN PENYESUAIAN

Penyelenggara berhak mengubah layout acara, menyesuaikan Syarat & Ketentuan, dan mengambil tindakan pengamanan jika dibutuhkan tanpa pemberitahuan terlebih dahulu.

Penyelenggara tidak bertanggung jawab atas kerugian tidak langsung, konsekuensial, atau insidental yang timbul akibat perubahan, penundaan, atau pembatalan acara.

Setiap pembaruan akan diinformasikan melalui kanal resmi promotor.

Dengan membeli tiket SNADA Indonesia 2026, Anda dianggap telah membaca, memahami, dan menyetujui seluruh Syarat & Ketentuan yang berlaku.

Terima kasih telah menjadi bagian dari perjalanan ini.
Mari kita rayakan setiap kisah dan karya Raisa dalam suasana yang aman, nyaman, dan penuh makna.

Selamat menikmati SNADA Indonesia 2026.

Informasi

Untuk informasi kerja sama dan kolaborasi:

Sponsorship
E-mail: partnership@antarasuara.com
Media Partnership
E-mail: media@antarasuara.com

Untuk informasi atau bantuan seputar tiket hubungi:
Loket.com
E-mail: support@loket.com
Phone: 021-3000 3160' WHERE title = 'Snada Indonesia 2026' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = 'Next Gen(re) Parenting

Program acara ini hadir sebagai wujud pergerakan ibu modern untuk meninggalkan mitos dan beralih ke pola asuh berbasis ilmiah.

Tajuk ini membawa pesan pemberdayaan bahwa masa depan anak ditentukan oleh ketegasan keputusan ibu hari ini, bukan oleh tradisi atau stigma lingkungan.

Konsep ini sekaligus menjawab kegelisahan para ibu dengan menegaskan pentingnya nutrisi dan kesehatan mental di 1000 Hari Pertama Kehidupan sebagai pondasi emas yang tidak bisa ditunda.

Menghadirkan :

MerdiOctav Sahetapy
dr. Elvine Gunawan, Sp. KJ
Dokter Spesialis Anak

Syarat dan Ketentuan

1 tiket berlaku untuk 1 Orang Tua dan 1 Anak

Harga tiket termasuk:

- Akses mengikuti sesi "Next Gen(re) Parenting"
- Akses ke booth MIPP (Brainwave & Booth Emotion)
- Produk Morinaga sesuai dengan pilihan
- Phone Strap Soyacan
- Pouch Morigro
- Building Block
- Photo Grid
- Sticker Pack' WHERE title = 'Next Gen(re) Parenting - Semarang' AND venue = 'Kota Semarang';
UPDATE events SET terms_conditions = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop

Workshop selama dua hari ini mengupas tuntas mengenai bagaimana praktisi HR dapat memimpin personil dan organisasi secara efektif dan efisien, juga memaksimalkan performa keduanya dalam menghadapi besarnya tantangan AI bagi para pekerja dewasa ini.

- Day 1: menghadirkan talkshow bersama para ahli, mengupas case studies berdasarkan kasus nyata, serta diskusi seputar memimpin organisasi yang human-centric di era AI.

- Day 2: menerapkan knowledge menjadi real-world application melalui sistem Management Drives: disini peserta akan belajar mengenal pendorong perilaku (behavioural drivers), motivasi individual dari para pekerja, dan bagaimana pemahaman akan semua ini akan memperkuat kepemimpinan serta pengelolaan Human Resources di organisasi (people management).

Tiket

Loket Platform
3 kategori tiket - Harga mulai dari Rp365.000

Rp365.000
Day 1 only (Normal Price)
Penjualan berakhir 16 Sep 2026
16.00 GMT+7
available

Rp5.200.000
Day 2 only (Normal Price)
Penjualan berakhir 16 Sep 2026
16.00 GMT+7
available

Rp3.350.000
Day 1 + Day 2 (Normal Price)
Penjualan berakhir 16 Sep 2026
16.00 GMT+7
available

Leading HR and Unlocking Organisational Performance: People & Performance Workshop
Grand Sahid Jaya Hotel, Jakarta Pusat

15-16 Sep 2026, 09:00 - 16:30 WIB
Workshop & Pelatihan
- Pengembangan Diri
- Karir & Keterampilan Profesional

Diselenggarakan oleh
Emerge Consulting

Tagar Event
traininghrd
humanresource
seminarhrd
humanresourcemanagement' WHERE title = 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND venue = 'Jakarta Pusat';
UPDATE events SET terms_conditions = 'Adili Idola

TENTANG ADILI IDOLA

Adili Idola promoted by GOLDLive Indonesia dan Comika menjadi event "Roasting" yang menghadirkan sosok "Kontroversial" yang akan di-roasting oleh banyak pihak, seperti selebriti, komika, musisi, aktor, aktris, politisi dan masih banyak lagi.

ROASTER ADILI IDOLA

FATIH ANDHIKA
OKI RENGGA
RIGEN RAKELNA
WHO''S THE NEXT?

LOKASI NONTON LANGSUNG:

Studio RCTI+
Gedung RCTI, Raya, Jl. F Perjuangan No. 1, RT.11/RW.10, Kebon Jeruk, Kebonjeruk, West Jakarta City, Jakarta 11530

FAQ TIKET OFFLINE

Siapa saja yang akan tampil?
Lineup terdiri dari roastee, roastmaster, para roaster, dan special guest. Daftar talent akan diumumkan secara bertahap.

Berapa lama durasi pertunjukan?
Pertunjukan berlangsung pukul 19.30-22.30 WIB. Open gate akan dibuka sebelum acara dimulai. Informasi mengenai waktu open gate akan diumumkan lebih lanjut melalui kanal resmi Adili Idola.

Apakah ada batas usia penonton?
Pembeli dan penonton wajib berusia di atas 17 (tujuh belas) tahun. Mohon untuk tidak melakukan pembelian tiket apabila belum memenuhi batas usia yang ditentukan, karena penyelenggara berhak menolak masuk dan tiket yang telah dibeli tidak dapat dikembalikan (non-refundable).

Minimal 1 data bisa beli berapa tiket?
Bagi yang sudah melakukan pre-registration, setiap 1 data diri dapat membeli maksimal 2 tiket Early Bird dengan kategori yang sama.

Bagaimana alur masuk ke venue?
Saat datang ke venue nanti, cukup bawa identitas diri (KTP/SIM/Paspor) dan e-voucher tiket yang sudah dikirimkan melalui email dari LOKET saat pembelian berhasil.

FAQ LIVE STREAMING PAY-PER-VIEW

Live streaming ini bisa ditonton di mana?
Live streaming dapat disaksikan melalui aplikasi RCTI+ dan dapat diakses tanpa VPN, termasuk dari luar Indonesia.

Apakah live streaming bisa ditonton dari luar kota atau luar negeri?
Bisa. Live streaming dapat diakses dari mana saja selama memiliki koneksi internet yang stabil.

Bagaimana cara membeli tiket live streaming pay-per-view?
Tiket live streaming dapat dibeli melalui website adiliidola.id dengan memilih opsi Tiket Live Streaming Pay-Per-View. Jangan lupa download aplikasi RCTI+ terlebih dahulu, ya! Setelah pembayaran berhasil, kamu akan mendapatkan akses untuk menonton live streaming pay-per-view pada hari event.

Apakah jika sudah berlangganan aplikasi RCTI+ harus membeli tiket lagi?
Betul. Meskipun sudah berlangganan RCTI+, kamu tetap perlu membeli tiket Live Streaming Pay-Per-View Adili Idola untuk dapat menyaksikan seluruh rangkaian acara.

Apakah live streaming bisa digunakan lebih dari satu perangkat?
Tidak. Satu tiket hanya dapat digunakan pada satu perangkat.

Apakah saat menonton nanti bisa diputar ulang dari awal?
Bisa. Tayangan Adili Idola memiliki fitur playback/rewind di aplikasi RCTI+, sehingga kamu dapat memutar kembali tayangan yang sedang berlangsung.

Bisa menonton siaran ulang tidak?
Bisa. Tayangan Pay-Per-View Adili Idola dapat ditonton kembali hingga H+7 setelah acara live berakhir.

Tayangan live streaming pay-per-view di RCTI+ bisa ditonton melalui platform apa saja?
Tayangan dapat disaksikan melalui aplikasi RCTI+, website RCTI+, dan TV.

Ketentuan Menonton Live Streaming Pay-Per-View

Untuk menjaga kenyamanan bersama serta melindungi hak siar dan hak cipta acara, tayangan Pay-Per-View Adili Idola di RCTI+ tidak dapat direkam atau menggunakan fitur screen recording. Penonton juga tidak diperkenankan membagikan cuplikan maupun keseluruhan tayangan ke media sosial atau platform lainnya tanpa izin resmi.

Ketentuan ini berlaku sebagaimana aturan di venue, di mana proses perekaman selama acara berlangsung juga tidak diperbolehkan. Apabila ditemukan aktivitas perekaman dan/atau pengunggahan tayangan RCTI+ secara tidak sah, penyelenggara bersama RCTI+ berhak mengambil tindakan yang diperlukan, termasuk penurunan konten, pembatasan akses tayangan, hingga langkah hukum sesuai dengan peraturan yang berlaku.

Dengan membeli tiket Live Streaming Pay-Per-View, penonton dianggap telah membaca, memahami, dan menyetujui seluruh ketentuan yang berlaku, termasuk larangan merekam, mengambil tangkapan layar, melakukan screen recording, serta membagikan tayangan secara tidak sah. Terima kasih atas pengertian dan dukungannya untuk menikmati Adili Idola secara resmi melalui RCTI+.

About GOLDLive Indonesia

GOLDLive Indonesia berdiri sejak 2019 yang membangun ekosistem hiburan dengan mempromosikan berbagai artis lokal dan internasional yang terdiri dari berbagai jenis event: konser, festival, standup comedy, konferensi dan pameran. GoldLive indonesia memiliki pengalaman dalam menyelenggarakan berbagai jenis acara dan berkomitmen penuh untuk selalu memberikan pengalaman baru dan berharga bagi semua audiens. Dengan perhatian pada detail dan kualitas, GoldLive Indonesia terus mempersembahkan momen berkelas dalam dunia hiburan Tanah Air.

About COMIKA

Comika adalah perusahaan pengembangan Intellectual Property (IP) berbasis komedi dengan memanfaatkan ekosistem Stand-Up Comedy dari promotor event, talent management, platform digital, lembaga edukasi, dan merchandise.

Customer Service Tiket Offline

Untuk informasi lebih lanjut, dapat menghubungi Customer Service loket.com

Telepon: +62 21 3000 3160
Email: support@loket.com

Customer Service Tiket Pay-Per-View

Untuk informasi lebih lanjut, dapat menghubungi Customer Service RCTI+

Telepon: +62 888-8988-880
Email: cs@rctiplus.com' WHERE title = 'Adili Idola: Celebrity Roast' AND venue = 'Jakarta Barat';
UPDATE events SET seatmap = '' WHERE title = 'SYNC 2026 ''Luminaria''' AND venue = 'TBA';
UPDATE events SET seatmap = '' WHERE title = 'Moonverse Festival Vol  7' AND venue = 'TBA';
UPDATE events SET seatmap = '' WHERE title = 'Ayo Fest 2026' AND venue = 'TBA';
UPDATE events SET seatmap = '' WHERE title = 'Remember Fest 2026 X Cube Concert' AND venue = 'TBA';
UPDATE events SET seatmap = '' WHERE title = 'SEMESTAMBYAR' AND venue = 'TBA';
UPDATE events SET seatmap = '{"name":"Layout ARTERUN x Gendut Berlari - Pace of Joy","images":["https://api.artatix.co.id/event_layout/24GGKSHRGP.jpg"]}' WHERE title = 'ARTERUN x Gendut Berlari - Pace of Joy' AND venue = 'TBA';
UPDATE events SET seatmap = '{"name":"Layout Riang dan Ceria","images":["https://api.artatix.co.id/event_layout/KDGNJBQCG9.png"]}' WHERE title = 'Riang dan Ceria Jambi' AND venue = 'TBA';
COMMIT;
