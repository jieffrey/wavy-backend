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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hillsong Worship Nights Asia Tour Surabaya', 'Music', 'Graha Unesa Surabaya, Kota Surabaya', '2026-09-11 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260626103121_6a3df2891f543.jpeg', 'Untuk pertama kalinya di Surabaya, Hillsong Worship hadir sebagai bagian dari Asia Tour 2026. Sebuah malam istimewa yang akan menyatukan ribuan hati dalam pujian dan penyembahan melalui lagu-lagu yang telah menjadi berkat bagi jutaan orang di seluruh dunia. Nikmati secara langsung lagu-lagu ikonik seperti What A Beautiful Name, Oceans (Where Feet May Fail), Who You Say I Am, Cornerstone, dan King of Kings dalam sebuah pengalaman worship yang penuh sukacita, pengharapan, dan inspirasi. Malam istimewa ini akan menjadi pengalaman yang tak terlupakan bagi ribuan jemaat, keluarga, dan komunitas Kristen yang akan berkumpul bersama dalam satu hati untuk memuji dan menyembah Tuhan.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hillsong Worship Nights Asia Tour Surabaya'
WHERE o.email = 'demo.otello-asia-dan-color-asia-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'FESTIVAL (STANDING)', 750000, 1442, 144
FROM events ev WHERE ev.title = 'Hillsong Worship Nights Asia Tour Surabaya' AND ev.venue = 'Graha Unesa Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL (STANDING)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VIP (NUMBERING SEATING)', 1250000, 1949, 194
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'StashedTheJazz Reunion', 'Music', 'Sunbreeze Hotel, Jakarta Selatan', '2026-09-11 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260906085347_6a9cc7abc908e.jpg', 'STASHEDTHEJAZZ REUNION ONCE UPON A JAZZ — Vol. 02 Standards from Your Favorite Classic Movies StashedTheJazz returns for an intimate evening of jazz, bringing together timeless standards from beloved classic movies in a sophisticated rooftop setting at SunBreeze Hotel, Senayan Jakarta. A special reunion featuring live performances by a curated lineup of musicians, creating an evening of music, atmosphere, and timeless melodies. THE EXPERIENCE • Live Jazz Tribute Concert • Standards from Your Favorite Classic Movies • Intimate Rooftop Setting • Limited Seating • Curated live music performances • Rp100.000 F&B Voucher included with your ticket EVENT DETAILS Friday, 11 September 2026 Doors Open: 8:00 PM Venue: SunBreeze Hotel, Senayan Jakarta — 7th Floor Event Time: 8:00 PM – 3:00 AM WIB Limited seats available. Come for the music. Stay for the atmosphere. Welcome back to StashedTheJazz.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'StashedTheJazz Reunion'
WHERE o.email = 'demo.stashedthejazz@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'StashedTheJazz Reunion' AND ev.venue = 'Sunbreeze Hotel, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Once Upon A Jazz', 330000, 100, 10
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'EDU CONCERT "Our Musical Journey"', 'Music', 'Performance Hall UK Petra Surabaya, Kota Surabaya', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804160556_6a71ab74d6f3b.jpg', 'Edu Concert 2026 Our Musical Journey Edu Concert: Our Musical Journey merupakan konser tahunan yang diselenggarakan oleh Jurusan Musik SMKN 12 Surabaya sebagai bentuk apresiasi terhadap proses belajar, dedikasi, dan perkembangan musikal para siswa selama menempuh pendidikan di sekolah. Mengusung tema "Our Musical Journey" , konser ini mengajak penonton menyaksikan perjalanan setiap siswa dalam mengembangkan kemampuan bermusik, mulai dari proses pembelajaran di kelas, latihan yang penuh disiplin, hingga pencapaian yang diwujudkan melalui sebuah pertunjukan di atas panggung. Setiap penampilan menjadi cerminan dari semangat belajar, kerja sama, kreativitas, dan kecintaan terhadap musik yang terus bertumbuh. Bertempat di Performance Hall Universitas Kristen Petra Surabaya , konser ini akan menampilkan siswa kelas XI dan XII Jurusan Musik dengan berbagai mayor, meliputi Piano, Gitar, Gesek, Tiup, dan Vokal . Selain penampilan solo, penonton juga akan disuguhkan berbagai pertunjukan ansambel, seperti Orkestra SMKN 12 Surabaya, Ansambel Gitar, Paduan Suara , serta berbagai kolaborasi musikal yang menggambarkan kekayaan ekspresi dan kemampuan para siswa.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EDU CONCERT "Our Musical Journey"'
WHERE o.email = 'demo.musik-rolas@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Pelajar/Mahasiswa', 25000, 100, 10
FROM events ev WHERE ev.title = 'EDU CONCERT "Our Musical Journey"' AND ev.venue = 'Performance Hall UK Petra Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Pelajar/Mahasiswa');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Tiket UMUM', 35000, 210, 21
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SARVIVAL EVENT', 'Music', 'SMAN 7 Purworejo, Kab. Purworejo', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804145234_6a719a42b4552.jpg', 'Sekarang persiapkan dirimu untuk SARVIVAL (Sarkoro Voice Festival) Festival ini akan digelar dengan menghadirkan deretan bintang tamu yang luar biasa. Diantaranya: -NADHIF BASALAMAH -DENNY CAKNAN -TYO AND FRIENDS Tempat : Lapangan SMA NEGERI 7 PURWOREJO Tanggal : 12 September 2026 Ayo, jangan lewatkan konser terbesar di Kota Purworejo dan jadilah bagian dari keseruan Konser SARVIVAL (Sarkoro Voice Festival) bersama teman, pasangan, dan keluarga! Segera amankan tiketmu sebelum kehabisan!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SARVIVAL EVENT'
WHERE o.email = 'demo.sarvival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'FESTIVAL', 140000, 1, 0
FROM events ev WHERE ev.title = 'SARVIVAL EVENT' AND ev.venue = 'SMAN 7 Purworejo, Kab. Purworejo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VVIP', 199000, 1, 0
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RUANG RAYA - KARAWANG', 'Music', 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260611113413_6a2a3ac5de004.jpeg', 'Ruang Raya adalah festival yang mempertemukan musik, komunitas, kuliner, dan kreativitas lokal dalam satu perayaan.Lebih dari sekadar konser, Ruang Raya menjadi ruang bagi semua orang untuk berkumpul, berekspresi, dan menciptakan momen yang tak terlupakan. &rdquo;Menyalakan Ruang, Merayakan Kota.&rdquo;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RUANG RAYA - KARAWANG'
WHERE o.email = 'demo.lima-ruang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'REGULAR - Early Entry', 200000, 690, 69
FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULAR - Early Entry');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'REGULAR - Festival', 275000, 2277, 227
FROM events ev WHERE ev.title = 'RUANG RAYA - KARAWANG' AND ev.venue = 'KAWASAN 3 BISNIS, KARAWANG, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULAR - Festival');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'REGULAR - VIP Festival', 350000, 401, 40
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO PEACE TODAY NO LIFE TOMORROW #7', 'Music', 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur', '2026-09-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260725203446_6a64bb762533a.jpg', 'NO PEACE TODAY NO LIFE TOMORROW adalah event musik tahunan yang diinisiasi pada era 2000an. Berawal dari penggalangan dana untuk korban bencana Bengkulu tahun 2000. Bukan hanya membawa misi amal namun juga keresahan kolektif untuk membuat ruang ekspresi lintas genre. Event ini tumbuh menjadi salah satu movement independen yang ditunggu tunggu.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO PEACE TODAY NO LIFE TOMORROW #7'
WHERE o.email = 'demo.84-crew@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE 1', 50000, 500, 50
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE 2', 75000, 500, 50
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'REGULER', 100000, 1000, 100
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULER');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'BERDUA', 185000, 500, 50
FROM events ev WHERE ev.title = 'NO PEACE TODAY NO LIFE TOMORROW #7' AND ev.venue = 'THE SYSTEM LIVE SPACE - PFN HERITAGE, Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'BERDUA');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'BERTIGA', 270000, 300, 30
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI', 'Music', 'Berbagi Ruang, Kota Denpasar', '2026-09-13 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260831225034_6a95a2ca000db.jpg', 'HUJAN TENTANG CINTA. Majelis Lidah Berduri kembali ke Bali. Setelah Tiba-Tiba Marabahaya, kali ini hujan datang membawa cinta—dengan segala yang sengit, bising, absurd, dan tak selesai. 13 September, mari bertemu lagi di antara lagu-lagu lama, bunyi-bunyi baru, dan cerita yang mungkin lebih baik dirasakan daripada dijelaskan. Datang. Kita lihat apa yang turun malam itu.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI'
WHERE o.email = 'demo.melbi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Advance Ticket', 75000, 500, 50
FROM events ev WHERE ev.title = 'HUJAN TENTANG CINTA - MAJELIS LIDAH BERDURI' AND ev.venue = 'Berbagi Ruang, Kota Denpasar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Advance Ticket');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Door Ticket', 100000, 100, 10
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Waria Fest (Warga Berpesta Ria) Vol. 2', 'Music', 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang', '2026-09-19 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260901154925_6a96919512602.jpg', 'Warga Berpesta Ria — Saatnya Kumpul, Musik, dan Seru-Seruan! WARIA FEST (Warga Berpesta Ria) Vol. 2 kembali hadir untuk mengajak warga berkumpul, bersenang-senang, dan menikmati malam dengan suguhan musik dari berbagai penampil. Bersiap untuk malam yang penuh energi bersama Dogy Is Dog, Smile Morning, DJ Renggo, Never Forgive Honey, The Matulacaka, dan Akar Enak , serta dipandu oleh MC Reza . Jangan lewatkan keseruan WARIA FEST Vol. 2 dan jadilah bagian dari pesta warga yang penuh musik, tawa, dan kebersamaan! Detail Event Event: WARIA FEST (Warga Berpesta Ria) Vol. 2 Tanggal: Sabtu, 19 September 2026 Waktu: Mulai pukul 19.00 WIB Lokasi: Warmindo Bang Gaga MC: Reza Line Up Dogy Is Dog Smile Morning DJ Renggo Never Forgive Honey The Matulacaka Akar enak Harga Tiket Tiket Online: Rp35.000 FREE Soft Drink Info lebih lanjut: 0852-8553-5237 (Dimas)', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Waria Fest (Warga Berpesta Ria) Vol. 2'
WHERE o.email = 'demo.pt-besar-intan-gemilang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Waria Fest (Warga Berpesta Ria) Vol. 2' AND ev.venue = 'Warmindo Bang Gaga Bojong Nangka, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Tiket Waria Fest', 35000, 200, 20
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SUARA GUNTUR (The Sound Of Wellness)', 'Music', 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut', '2026-09-19 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821171844_6a882604b0753.jpg', 'THE SOUND OF WELLNESS', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SUARA GUNTUR (The Sound Of Wellness)'
WHERE o.email = 'demo.nalarraya@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale - Camp Fest Cat 1', 325000, 30, 3
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Camp Fest Cat 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale - Camp Fest Cat 2', 300000, 30, 3
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Camp Fest Cat 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale - 2 Daypass (NO CAMP)', 200000, 100, 10
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - 2 Daypass (NO CAMP)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale - Suara Buana', 150000, 300, 30
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Suara Buana');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale - Suara Pagi Buta', 150000, 300, 30
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale - Suara Pagi Buta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Normal - Camp Fest Cat 1', 350000, 40, 4
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Camp Fest Cat 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Normal - Camp Fest Cat 2', 300000, 40, 4
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Camp Fest Cat 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Normal - 2 Daypass (NO CAMP)', 225000, 100, 10
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - 2 Daypass (NO CAMP)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Normal - Suara Buana', 175000, 150, 15
FROM events ev WHERE ev.title = 'SUARA GUNTUR (The Sound Of Wellness)' AND ev.venue = 'Edu Wisata Perlebahan Gunung Guntur, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Normal - Suara Buana');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Normal - Suara Pagi Buta', 175000, 150, 15
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TOUR-GETHER WORSHIP NITE PROJECT BALI', 'Music', 'Atlas Super Club, Kab. Badung', '2026-09-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260811210347_6a7b2bc3a86c7.jpg', 'GUTS Bali × Worship Nite Project Tour-gether is a journey of worship, and Bali is where it comes to a close. In collaboration with GUTS Bali , Worship Nite Project brings the final stop of the Tour-gether journey to Bali. creating a space where worship goes beyond the walls of a church and reaches everyone, wherever they are. Because we believe Jesus is present everywhere and His love is for everyone. This is more than a night of worship. It’s an invitation to encounter Jesus, find hope, and experience His presence in a place you might not expect. Come as you are. Come with an open heart. Come and encounter Jesus. Tour-gether: Bali. Revival is here.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TOUR-GETHER WORSHIP NITE PROJECT BALI'
WHERE o.email = 'demo.guts-bali@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'REGULER', 115000, 661, 66
FROM events ev WHERE ev.title = 'TOUR-GETHER WORSHIP NITE PROJECT BALI' AND ev.venue = 'Atlas Super Club, Kab. Badung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'REGULER');

-- Organizer: Boss Creator
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Boss Creator', 'demo.boss-creator@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Pestapora 2026', 'Music', '', '&nbsp; Pestapora 2026 adalah sebuah perayaan dan selebrasi selama tiga hari yang melibatkan berbagai komunitas dan menggabungkan lintas genre musik di Indonesia. 25, 26, 27 Septemb'
FROM organizers o WHERE o.email = 'demo.boss-creator@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.boss-creator@wavy.seed' AND a.name = 'Pestapora 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pestapora 2026', 'Music', 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara', '2026-09-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260819162030_6a85755e86d56.jpeg', '&nbsp; Pestapora 2026 adalah sebuah perayaan dan selebrasi selama tiga hari yang melibatkan berbagai komunitas dan menggabungkan lintas genre musik di Indonesia. 25, 26, 27 September 2026 adalah hari perayaan Pestapora selanjutnya. Nantikan dan mari berpestapora! &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pestapora 2026'
WHERE o.email = 'demo.boss-creator@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Regular - 3 Days Pass', 650000, 1500, 150
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Regular - 3 Days Pass');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Daily Pass - Day 1', 300000, 5000, 400
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Daily Pass - Day 3', 300000, 5000, 400
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Entry - Day 1', 225000, 1500, 150
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Entry - Day 3', 225000, 1500, 150
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Regular - 3 Days Pass', 650000, 1000, 100
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Regular - 3 Days Pass');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Daily Pass - Day 1', 300000, 2000, 200
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Daily Pass - Day 2', 300000, 500, 50
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Daily Pass - Day 3', 300000, 3000, 300
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Daily Pass - Day 3');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Entry - Day 1', 225000, 1000, 100
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Entry - Day 2', 225000, 1000, 100
FROM events ev WHERE ev.title = 'Pestapora 2026' AND ev.venue = 'Gambir Expo & Hall D2 Jiexpo, Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Entry - Day 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Entry - Day 3', 225000, 1000, 100
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Glitter Camp Live Concert', 'Music', 'Balai Sarbini Jakarta, Jakarta Selatan', '2026-10-03 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260622121756_6a38c58400b06.jpeg', '&quot;Glitter Camp Live Concert&quot; mengusung konsep intimate concert dengan sentuhan tata visual modern dan warna-warni, hingga atmosfer panggung yang dibuat dengan suasana camp yang modern dan hangat.&nbsp; Tak hanya menjadi showcase penampilan lagu-lagu glitter, &quot;Glitter Camp Live Concert&quot; juga akan menjadi playground bagi masing-masing personil Glitter dengan para Glitz.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Glitter Camp Live Concert'
WHERE o.email = 'demo.arvindo-media@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Glitz (CAT 1)', 500000, 196, 19
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Glitz (CAT 1)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Besties (CAT 2)', 400000, 50, 5
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Besties (CAT 2)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Berkilau (CAT 3)', 125000, 52, 5
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Berkilau (CAT 3)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Glitz with Buumi Bundle (CAT 1)', 630000, 40, 4
FROM events ev WHERE ev.title = 'Glitter Camp Live Concert' AND ev.venue = 'Balai Sarbini Jakarta, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Glitz with Buumi Bundle (CAT 1)');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Besties with Buumi Bundle (CAT 2)', 530000, 30, 3
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PGR 2026 @Cikarang', 'Music', 'Lippo Mall Cikarang, Kab. Bekasi', '2026-10-03 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824224750_6a8c67a68485b.jpeg', 'PGR 2026 @Cikarang', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR 2026 @Cikarang'
WHERE o.email = 'demo.pt-semua-pasti-gembira@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE', 85000, 200, 20
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - FESTIVAL PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR2026 @Cikarang - FESTIVAL PRESALE.', 100000, 5000, 400
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - FESTIVAL PRESALE.');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE', 175000, 100, 10
FROM events ev WHERE ev.title = 'PGR 2026 @Cikarang' AND ev.venue = 'Lippo Mall Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR2026 @Cikarang - VIP PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR2026 @Cikarang - VIP PRESALE.', 200000, 300, 30
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Party Du Royaume by de Creative Kingdom', 'Music', 'Taman Budaya Raden Saleh, Kota Semarang', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260902183800_6a980a98a2970.jpg', 'Party Du Royaume Di sebuah kerajaan yang megah, lahirlah seorang Putra Mahkota yang telah lama dinantikan. Untuk menyambut kelahirannya, sebuah pesta besar dipersiapkan dengan segala sesuatu yang paling indah, mewah, dan sempurna. Namun, di tengah kemeriahan dan gemerlap istana, sesuatu yang tak terduga mulai terjadi... Apa yang sebenarnya terjadi di balik pesta sang Putra Mahkota? Dan mampukah mereka menyadari apa yang paling berharga? Saksikan drama musikal Party Du Royaume! Sabtu, 10 Oktober 2026 di Taman Budaya Raden Saleh (Gedung Ki Narto Sabdho) Semarang.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Party Du Royaume by de Creative Kingdom'
WHERE o.email = 'demo.ydl-teknologi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Bird Sales VIP Session 1', 125000, 265, 26
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales VIP Session 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Bird Sales Regular Session 1', 75000, 189, 18
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales Regular Session 1');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Bird Sales VIP Session 2', 125000, 265, 26
FROM events ev WHERE ev.title = 'Party Du Royaume by de Creative Kingdom' AND ev.venue = 'Taman Budaya Raden Saleh, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Early Bird Sales VIP Session 2');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Early Bird Sales Regular Session 2', 75000, 189, 18
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Golden Jubilee 2026', 'Music', 'Indonesia Arena, Jakarta Pusat', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260618124142_6a338516d382f.jpeg', 'Golden Jubilee adalah perayaan iman sekaligus gerakan solidaritas spiritual yang mengundang 12.000 umat untuk hadir bersama dalam satu momen bersejarah, merayakan 50 tahun Pembaruan Karismatik Katolik (PKK) di Indonesia dengan tema Roh Kudus Api Evangelisasi dan misi Solidaritas Spiritual. Lebih dari sebuah perayaan, Golden Jubilee adalah panggilan nyata untuk bergerak bersama bagi Kaum Kecil, Lemah, Miskin, Tersingkir, dan Difabel (KLMTD) mereka yang kerap berada di pinggiran, namun adalah pusat dari misi Injil. Kehadiranmu bukan sekadar mengisi kursi. Setiap tiket yang kamu beli adalah kontribusi nyata bagi misi yang berkelanjutan, termasuk retreat pendampingan iman bagi keluarga, kaum muda, dan sahabat KLMTD yang akan terus berjalan setelah perayaan ini. Satu kursi. Satu langkah iman. Satu dampak nyata. &#128330;&#65039; Rundown 09.00 WIB Registrasi & GoJu Fair 11.00 WIB Open Gate 12.45 - 21.00 WIB Acara Puncak GoJu', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Golden Jubilee 2026'
WHERE o.email = 'demo.bpn-pkki@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VVIP', 3300000, 200, 20
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VIP', 1400000, 400, 40
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'TELESKOPIK', 1100000, 350, 35
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'TELESKOPIK');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'SILVER', 125000, 2000, 200
FROM events ev WHERE ev.title = 'Golden Jubilee 2026' AND ev.venue = 'Indonesia Arena, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'SILVER');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'DONASI KURSI KASIH', 300000, 50, 5
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', 'Laswi Heritage, Bandung', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824143453_6a8bf41dee62f.jpg', 'GOOD DAY SCHOOLIOCUS - Harmony In Collaboration Vol 4 Kompetisi Angklung Tingkat SMA terbesar di Jawa Barat kembali hadir di bulan Oktober 2026. Kali ini mendatangkan guest star: Saung Angklung Udjo, DIA - Stand Here Alone & Juicy Luicy. &nbsp; Selain penampilan di atas kalian juga dapat mengikuti banyak games seru dan hadiah menarik setiap kalian memenangkan games. &nbsp; &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4'
WHERE o.email = 'demo.ff-creative@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE', 25000, 1000, 100
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3', 'Music', 'ILLUA SOJU BOX, Jakarta Pusat', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260904181041_6a9aa731daafb.jpg', 'Karaoke musik JKT48 merupakan suatu kesenangan terutama bagi seluruh penggemar musik JKT48, tentunya dengan adanya acara ini bisa memperketat silaturahmi bagi anak muda, jangan sampai lewatkan keseruan acara ini karena acara ini akan lebih meriah ditahun sebelumnya, Jangan lupa datang pada acara karaoke bu Aldan group dengan waktu yang sudah di tentukan.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3'
WHERE o.email = 'demo.dadan-aldia-putra@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE SPC', 30000, 20, 2
FROM events ev WHERE ev.title = 'KARAOKE MUSIK JKT48 BY ALDAN GROUP VOL 3' AND ev.venue = 'ILLUA SOJU BOX, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE SPC');

-- Organizer: SIGMA PRO INDONESIA
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIGMA PRO INDONESIA', 'demo.sigma-pro-indonesia@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'BADONCI FESTIVAL DISK.2', 'Music', '', 'SYARAT DAN KETENTUAN BADONCI FESTIVAL 1.⁠ ⁠UMUM Badonci&nbsp;Festival&nbsp;diselenggarakan&nbsp;oleh&nbsp;penyelenggara&nbsp;resmi&nbsp;PT. Sigma Pro Indonesia&nbsp; Syarat&nbsp;da'
FROM organizers o WHERE o.email = 'demo.sigma-pro-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.sigma-pro-indonesia@wavy.seed' AND a.name = 'BADONCI FESTIVAL DISK.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BADONCI FESTIVAL DISK.2', 'Music', 'Pohon Kasih Megamas, Kota Manado', '2026-10-15 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821133006_6a87f06e50af1.jpg', 'SYARAT DAN KETENTUAN BADONCI FESTIVAL 1.⁠ ⁠UMUM Badonci&nbsp;Festival&nbsp;diselenggarakan&nbsp;oleh&nbsp;penyelenggara&nbsp;resmi&nbsp;PT. Sigma Pro Indonesia&nbsp; Syarat&nbsp;dan&nbsp;ketentuan&nbsp;ini&nbsp;berlaku&nbsp;untuk&nbsp;semua&nbsp;pengunjung,&nbsp;peserta, artis, vendor, dan&nbsp;pihak&nbsp;terkait&nbsp;yang&nbsp;terlibat&nbsp;dalamacara. Penyelenggara&nbsp;berhak&nbsp;mengubah&nbsp;syarat&nbsp;dan&nbsp;ketentuan&nbsp;kapan&nbsp;saja&nbsp;tanpa&nbsp;pemberitahuan&nbsp;terlebih&nbsp;dahulu,&nbsp;denganpembaruan&nbsp;akan&nbsp;diumumkan&nbsp;melalui&nbsp;kanal&nbsp;resmi&nbsp;festival. &nbsp; 2.⁠ ⁠PEMBELIAN DAN PENGGUNAAN TIKET Tiket&nbsp;hanya&nbsp;bisa&nbsp;dibeli&nbsp;melalui&nbsp;kanal&nbsp;resmi&nbsp;yang&nbsp;telah&nbsp;ditentukan&nbsp;LOKET.COM. ⁠Setiap&nbsp;tiket&nbsp;hanya&nbsp;sah&nbsp;untuk&nbsp;satu&nbsp;orang dan&nbsp;tidak&nbsp;dapat&nbsp;dipindahkan&nbsp;kepemilikan&nbsp;atau&nbsp;dijual&nbsp;kembali&nbsp;tanpa&nbsp;izinpenyelenggara. Tiket&nbsp;yang&nbsp;hilang,&nbsp;rusak,&nbsp;atau&nbsp;palsu&nbsp;tidak&nbsp;akan&nbsp;diganti&nbsp;atau&nbsp;diterima&nbsp;masuk. Pengunjung&nbsp;harus&nbsp;menunjukkan&nbsp;tiket&nbsp;berupa&nbsp;QR Code&nbsp;&nbsp;atau&nbsp;bukti&nbsp;pembayaran&nbsp;elektronik&nbsp;yang valid&nbsp;saat&nbsp;masuk&nbsp;area festival. &nbsp; 3.⁠ ⁠SYARAT MASUK AREA FESTIVAL Pengunjung&nbsp;di&nbsp;bawah&nbsp;umur&nbsp;harus&nbsp;ditemani&nbsp;oleh orang&nbsp;tua&nbsp;atau&nbsp;wali&nbsp;yang&nbsp;bertanggung&nbsp;jawab. ⁠Semua&nbsp;pengunjung&nbsp;wajib&nbsp;menjalani&nbsp;pemeriksaan&nbsp;keamanan&nbsp;sebelum&nbsp;masuk&nbsp;area festival. ⁠Penyelenggara&nbsp;berhak&nbsp;menolak&nbsp;masuk&nbsp;atau&nbsp;mengeluarkan&nbsp;pengunjung&nbsp;yang&nbsp;tidak&nbsp;mematuhi&nbsp;peraturan&nbsp;atau&nbsp;menunjukkanperilaku&nbsp;yang&nbsp;mengganggu&nbsp;ketertiban. &nbsp; 4.⁠ ⁠BARANG TERLARANG DAN DIIZINKAN Barang&nbsp;terlarang: Senjata&nbsp;api,&nbsp;senjata&nbsp;tajam, dan&nbsp;benda&nbsp;berbahaya&nbsp;lainnya. Narkoba,&nbsp;alkohol, dan&nbsp;zat&nbsp;terlarang&nbsp;lainnya. ⁠Bahan&nbsp;peledak&nbsp;atau&nbsp;bahan&nbsp;yang&nbsp;dapat&nbsp;menyebabkan&nbsp;kebakaran. ⁠Benda&nbsp;keras&nbsp;atau&nbsp;tajam&nbsp;yang&nbsp;dapat&nbsp;digunakan&nbsp;sebagai&nbsp;alat&nbsp;serangan. Drinks dan&nbsp;makanan&nbsp;dari&nbsp;luar&nbsp;area festival (kecuali&nbsp;untuk&nbsp;kebutuhan&nbsp;kesehatan&nbsp;khusus&nbsp;dengan&nbsp;izin&nbsp;tertulis). Barang&nbsp;diizinkan&nbsp;(dengan&nbsp;pembatasan): Tas&nbsp;kecil&nbsp;atau&nbsp;ransel&nbsp;dengan&nbsp;ukuran&nbsp;maksimal&nbsp;[misal: 40x30x20 cm]. ⁠Perlengkapan&nbsp;medis&nbsp;pribadi&nbsp;dengan&nbsp;izin&nbsp;petugas&nbsp;keamanan. ⁠Kamera&nbsp;foto/video non-profesional&nbsp;(tanpa&nbsp;tripod&nbsp;atau&nbsp;peralatan&nbsp;besar). ⁠Sunscreen,&nbsp;topi, dan&nbsp;payung&nbsp;untuk&nbsp;perlindungan&nbsp;dari&nbsp;cuaca. &nbsp; 5.⁠ ⁠PERILAKU PENGUNJUNG Seluruh&nbsp;pengunjung&nbsp;diharapkan&nbsp;bertingkah&nbsp;laku&nbsp;sopan&nbsp;dan&nbsp;menghormati&nbsp;s', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BADONCI FESTIVAL DISK.2'
WHERE o.email = 'demo.sigma-pro-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE 1 - FESTIVAL', 150000, 4550, 400
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1 - FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'FRESALE 1 - VIP', 250000, 650, 65
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FRESALE 1 - VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'FESTIVAL - BARENG SAYANG', 260000, 500, 50
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL - BARENG SAYANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VIP - BARENG SAYANG', 460000, 500, 50
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP - BARENG SAYANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'FESTIVAL - BARENG TAMANG', 480000, 500, 50
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'FESTIVAL - BARENG TAMANG');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VIP - BARENG TAMANG', 880000, 500, 50
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260731175446_6a6c7ef65fe70.jpg', 'Unfamiliar Weather Showcase adalah pertunjukan spesial dari In Inertia untuk merayakan album kedua mereka, Unfamiliar Weather. Pertunjukan akan berlangsung selama kurang lebih 120 menit dan terbagi ke dalam dua babak. In Inertia akan membawakan rangkaian lagu dari album Unfamiliar Weather dalam sebuah format pertunjukan yang memadukan musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik. Setiap elemen dirancang sebagai satu kesatuan untuk membawa penonton memasuki perjalanan emosional yang menjadi tema utama album ini, mulai dari perubahan, kehilangan, penerimaan, hingga usaha menemukan rasa nyaman di tengah situasi yang terasa asing. Penonton akan diajak menikmati pertunjukan dari awal hingga akhir sebagai satu rangkaian cerita yang terbagi ke dalam dua babak. Durasi pertunjukan: ±120 menit Penampil: In Inertia Format pertunjukan: 2 babak Pengalaman: Musik live, tata suara imersif, visual, pencahayaan, dan instalasi artistik', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase - Unfamiliar Weather'
WHERE o.email = 'demo.angular-momentum@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 230, 23
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Underground Supreme', 'Music', 'District 163, Kab. Karawang', '2026-10-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260713224128_6a550728a5089.jpg', 'UNDERGROUND SUPREME: Rise The Underground Culture Kultur Hip-Hop bukan sekadar musik, melainkan sebuah wadah ekspresi kreatif, seni, dan pergerakan komunitas. KRAZY BRAZY KARAWANG dengan bangga mempersembahkan UNDERGROUND SUPREME , sebuah panggung representatif yang dirancang untuk merayakan energi kultur Hip-Hop lokal serta membangun ekosistem kreatif urban yang lebih besar di Karawang. Dengan mengusung semangat "Rise The Underground Culture" , event ini memadukan konser musik dengan berbagai aktivasi komunitas kreatif untuk memberikan pengalaman hiburan alternatif yang segar, eksklusif, dan berkualitas bagi generasi muda. Lineup & Pengisi Acara Bersiaplah untuk merayakan energi skena underground bersama deretan talenta Hip-Hop terbaik: Main Performance (Guest Stars): Penampilan rap yang energik, gelap, dan khas dari Coming soon Guess Star Local Heroes: Aksi panggung memukau dari 3 Local Heroes yang siap membakar atmosfer acara. Creative Experience Tidak hanya menyajikan pertunjukan musik di panggung utama, UNDERGROUND SUPREME juga menghadirkan pengalaman interaktif yang melibatkan massa secara langsung: Live Printing & Sablon Area: Area kreatif interaktif di mana pengunjung bisa melihat dan merasakan langsung proses pembuatan karya sablon. Merchandise Area: Tempat berburu berbagai produk kreatif eksklusif sebagai bagian dari identitas event dan komunitas. UMKM & Brand Local Booth: Ruang khusus bagi brand lokal dan pelaku usaha kreatif untuk memperkenalkan produk urban terbaik mereka kepada audiens. Detail Pelaksanaan Event Hari/Tanggal: Minggu, 25 Oktober 2026 Waktu: 15.00 WIB – 01.55 WIB ( Open Gate & penukaran tiket dimulai pukul 15.00 WIB) Lokasi: District 163 Karawang (Jl. Tarumanagara No. 6, Ruko Karawang Hijau, Purwadana, Kecamatan Telukjambe Timur, Karawang) Jangan sampai kehabisan! Kuota tiket terbatas. Amankan tiketmu sekarang juga, jadilah bagian dari solidaritas komunitas, dan rasakan pengalaman kultur urban yang autentik bersama Krazy Brazy Karawang!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Underground Supreme'
WHERE o.email = 'demo.krazy-brazy-karawang@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale 1 - Underground Supreme', 160000, 300, 30
FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale 1 - Underground Supreme');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Presale 2 - Underground Supreme', 200000, 500, 50
FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Presale 2 - Underground Supreme');

-- Organizer: Antara Suara
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Antara Suara', 'demo.antara-suara@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Titik Sadrah for Revenge', 'Music', '', 'Menginjak dua dekade,&nbsp; Titik Sadrah hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi&nbsp; for Revenge , melain'
FROM organizers o WHERE o.email = 'demo.antara-suara@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.antara-suara@wavy.seed' AND a.name = 'Titik Sadrah for Revenge');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Titik Sadrah for Revenge', 'Music', 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260710180442_6a50d1ca9d9bd.jpeg', 'Menginjak dua dekade,&nbsp; Titik Sadrah hadir sebagai pelabuhan terakhir bagi mereka yang lelah berlari dari kehilangan. Ini bukan sekadar panggung bagi&nbsp; for Revenge , melainkan ruang sakral yang merangkum gelombang emosi band,&nbsp; Archims Pribadi (Chimot)&nbsp; secara personal, dan&nbsp; for Revenge Family . Sebuah memoar bersama untuk berhenti memaksakan apa yang telah karam dan mulai berdamai dengan kenyataan yang mematahkan arah. Kita semua pernah tersapu arus emosi liar hingga tenggelam di palung terendah. Bagi&nbsp; Chimot , palung itu adalah penerimaan pahit bahwa di tahun ke-20 ini ia tidak bisa lagi berdiri di balik set drumnya. Bagi&nbsp; for Revenge , ini adalah patah hati terdalam karena kehilangan detak jantung keseharian mereka. Sementara bagi&nbsp; for Revenge Family , ini adalah fase transisi berat untuk menerima keadaan dan formasi yang baru. Namun, kita disadarkan bahwa di setiap arus deras, selalu ada muara yang menanti. Di titik ini kita belajar bahwa tidak semua hal harus dipaksa untuk tetap tinggal, karena beberapa hal justru baru menemukan makna sejatinya saat kita memilih ikhlas melepaskan. Di muara inilah kita bertemu untuk saling menguatkan. Mari rayakan ruang penerimaan ini di Titik Sadrah Bandung, Eldorado Sport & Convention Hall&nbsp; pada 31 Oktober September 2026 , dan Titik Sadrah&nbsp; Kuala Lumpur . Datanglah untuk melarung segala yang menyesakkan, biarkan semuanya usai di titik ini, dan pulanglah membawa awal yang baru.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Titik Sadrah for Revenge'
WHERE o.email = 'demo.antara-suara@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Festival A ', 450000, 985, 98
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Festival A ');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Festival B', 400000, 645, 64
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Festival B');

-- Organizer: S3 Entertainment by PT. Suryono Sehat Sejahtera
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('S3 Entertainment by PT. Suryono Sehat Sejahtera', 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT o.id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', '', '&nbsp; Memories Of The Soul adalah sebuah perhelatan musik yang menghadirkan kembali lagu-lagu hits terbaik era 80-an, 90-an, hingga awal 2000-an yang penuh kenangan. Event ini dir'
FROM organizers o WHERE o.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o2 ON o2.id = a.organizer_id WHERE o2.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed' AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', 'Balai Sarbini, DKI Jakarta', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260721113228_6a5ef65c616bf.jpg', '&nbsp; Memories Of The Soul adalah sebuah perhelatan musik yang menghadirkan kembali lagu-lagu hits terbaik era 80-an, 90-an, hingga awal 2000-an yang penuh kenangan. Event ini dirancang sebagai momen &ldquo;temu kangen&rdquo; bagi para pecinta musik lintas generasi untuk kembali merasakan suasana hangat, romantis, dan penuh memori indah melalui lantunan lagu yang tak lekang oleh waktu. Dikemas dengan konsep panggung elegan, tata cahaya spektakuler, dan kualitas tata suara premium, event ini menghadirkan pengalaman eksklusif dan berkelas. Tidak hanya menyuguhkan hiburan, acara ini juga menjadi ruang silaturahmi, networking, serta ajang mempererat kebersamaan dalam suasana yang nyaman dan penuh nostalgia. Dengan segmentasi audiens usia 35&ndash;60 tahun, kalangan profesional, eksekutif, dan komunitas pecinta musik nostalgia, event ini diharapkan menjadi event tahunan yang dinantikan serta memberikan nilai tambah promosi dan eksposur maksimal bagi para sponsor yang terlibat. &nbsp; &nbsp;', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01'
WHERE o.email = 'demo.s3-entertainment-by-pt-suryono-sehat-sej@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VVIP Kursi Atas', 2000000, 33, 3
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP Kursi Atas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VVIP Kursi Depan', 1500000, 64, 6
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VVIP Kursi Depan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'VIP', 1300000, 24, 2
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'VIP');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Platinum', 1000000, 162, 16
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Platinum');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Gold', 750000, 471, 47
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Gold');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Silver', 500000, 250, 25
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'Silver');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Bronze', 350000, 148, 14
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PGR Vol. 11 @Jakarta', 'Music', 'JIExpo Kemayoran, Jakarta Pusat', '2026-11-07 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260525145212_6a13ffac08f80.jpeg', 'PGR Vol. 11 @Jakarta', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR Vol. 11 @Jakarta'
WHERE o.email = 'demo.pt-semua-pasti-gembira-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR Vol. 11 - FESTIVAL PRESALE', 100000, 5000, 400
FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PGR Vol. 11 - FESTIVAL PRESALE');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PGR Vol. 11 - VIP PRESALE', 250000, 300, 30
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JONGFEST 2026', 'Music', 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang', '2026-11-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260717192631_6a5a1f77042a2.jpg', '🎉 JONGFEST 2026 🎉 THE BIG FESTIVAL MUSIC LIVE IN MESUJI Bersiaplah menjadi bagian dari salah satu festival musik terbesar di Kabupaten Mesuji! JONG MESOEDJINEN dengan bangga mempersembahkan JONGFEST 2026 , menghadirkan penampilan spesial dari xxxxx xxxx xxxxx , xxxxxxxxx , xxxxxxxxxx dan xxxxx xxxx dalam satu panggung spektakuler. Nikmati malam penuh hiburan dengan lagu-lagu hits yang akan membuat seluruh penonton bernyanyi bersama. Selain konser musik, pengunjung juga dapat menikmati berbagai tenant kuliner UMKM, area festival, serta beragam aktivitas menarik lainnya. Jangan lewatkan kesempatan menjadi bagian dari sejarah festival musik terbesar di Mesuji! 🎤 Line Up xxxxx xxxx xxxxx xxxxxxxxxx xxxxxxxxx xxxxx xxxx INFUSE BAND (Line Up akan ditampilkan bertahap setelah tiket Early Bird terpenuhi!) 📅 Informasi Acara Tanggal: 10 November 2026 Waktu: 16.00 WIB – 22.00 WIB Lokasi: Alun-Alun Simpang Pematang Kecamatan Simpang Pematang, Kabupaten Mesuji, Lampung 🎟️ Kategori Tiket Early Bird (Kuota Terbatas) Presale Reguler VIP (jika tersedia) Tiket yang telah dibeli tidak dapat dikembalikan atau ditukar kecuali acara dibatalkan oleh penyelenggara.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JONGFEST 2026'
WHERE o.email = 'demo.jong-mesoedjinen@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'NORMAL FESTIVAL', 119000, 1200, 120
FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'NORMAL FESTIVAL');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'NORMAL VIP', 139000, 700, 70
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
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HIGH SCHOOL FEST 2026', 'Music', 'Stadiun Madya B, GBK, Jakarta Selatan', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821130357_6a87ea4d14a1a.jpg', 'School is back, but make it a festival!🎒 High School Fest is The Biggest School Themed Festival Ever! So, saatnya seru-seruan menikmati musik, main bareng, dan ngerasain kembali vibes sekolah dengan line up yang ga kalah asik dari tahun sebelumnya!! 28–29 November 2026, Stadion Madya GBK, Jakarta. DON’T MISS IT!', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIGH SCHOOL FEST 2026'
WHERE o.email = 'demo.new-gen-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'PRESALE 1 - (2 DAYS PASS) 28-29 November 2026', 180000, 1000, 100
FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id AND tc.name = 'PRESALE 1 - (2 DAYS PASS) 28-29 November 2026');

COMMIT;
