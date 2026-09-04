-- ============================================================
-- Seed data: scraped concerts (artatix.co.id + loket.com)
-- Safe to re-run: uses ON CONFLICT / NOT EXISTS for idempotency
-- ============================================================

-- Disable FK triggers for clean truncation
SET session_replication_role = replica;

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

SET session_replication_role = origin;

BEGIN;

-- ============================================================
-- 1. PK Entertainment — ENHYPEN + BIGBANG
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PK Entertainment', 'demo.pk-entertainment@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pk-entertainment@wavy.seed' AND a.name='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA', 'Music', 'Jakarta Utara', '2026-07-13'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA'
WHERE o.email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND e.venue='Jakarta Utara');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1450000, 200, 19
FROM events e WHERE e.title='ENHYPEN WORLD TOUR ''BLOOD SAGA'' IN JAKARTA' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pk-entertainment@wavy.seed' AND a.name='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA', 'Music', 'Jakarta Utara', '2026-10-12'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA'
WHERE o.email = 'demo.pk-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND e.venue='Jakarta Utara');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1550000, 200, 53
FROM events e WHERE e.title='BIGBANG 2026-2027 WORLD TOUR < XX : COSMOS > IN JAKARTA' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 2. Three Mountains Ave — T.O.P + Hwang In Youp
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Three Mountains Ave', 'demo.three-mountains-ave@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'T.O.P PRE-STUDIO 2026 in Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.three-mountains-ave@wavy.seed' AND a.name='T.O.P PRE-STUDIO 2026 in Jakarta');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'T.O.P PRE-STUDIO 2026 in Jakarta', 'Music', 'Jakarta Pusat', '2026-08-14'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='T.O.P PRE-STUDIO 2026 in Jakarta'
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
SELECT o.id, a.id, '2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA', 'Music', 'Jakarta Pusat', '2026-08-27'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA'
WHERE o.email = 'demo.three-mountains-ave@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1900000, 100, 4
FROM events e WHERE e.title='2026 HWANG IN YOUP FANMEETING TOUR <To you> in JAKARTA' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 3. Saint Johns Catholic School — SYNC 2026
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Saint Johns Catholic School', 'demo.saint-johns-catholic-school@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SYNC 2026 ''Luminaria''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.saint-johns-catholic-school@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.saint-johns-catholic-school@wavy.seed' AND a.name='SYNC 2026 ''Luminaria''');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SYNC 2026 ''Luminaria''', 'Music', 'TBA', '2026-09-12'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='SYNC 2026 ''Luminaria'''
WHERE o.email = 'demo.saint-johns-catholic-school@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SYNC 2026 ''Luminaria''' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 500, 48
FROM events e WHERE e.title='SYNC 2026 ''Luminaria''' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 4. MLDSPOT Fresh Concert On Wheels
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MLDSPOT Fresh Concert On Wheels', 'demo.mldspot-fresh-concert-on-wheels@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.mldspot-fresh-concert-on-wheels@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.mldspot-fresh-concert-on-wheels@wavy.seed' AND a.name='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta', 'Music', 'TBA', '2026-09-12'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta'
WHERE o.email = 'demo.mldspot-fresh-concert-on-wheels@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 200, 74
FROM events e WHERE e.title='MLDSPOT Fresh Concert On Wheels 2026 - Yogyakarta' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 5. ARTEFAC UNS — ARTERUN
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ARTEFAC UNS', 'demo.artefac-uns@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ARTERUN x Gendut Berlari - Pace of Joy', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.artefac-uns@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.artefac-uns@wavy.seed' AND a.name='ARTERUN x Gendut Berlari - Pace of Joy');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ARTERUN x Gendut Berlari - Pace of Joy', 'Music', 'TBA', '2026-09-12'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='ARTERUN x Gendut Berlari - Pace of Joy'
WHERE o.email = 'demo.artefac-uns@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ARTERUN x Gendut Berlari - Pace of Joy' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 135000, 100, 58
FROM events e WHERE e.title='ARTERUN x Gendut Berlari - Pace of Joy' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 6. Plainsong Live — Men I Trust + Joyland Sessions
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Plainsong Live', 'demo.plainsong-live@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.plainsong-live@wavy.seed' AND a.name='Men I Trust Asia Tour 2026: Live In Jakarta');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', 'Jakarta Pusat', '2026-09-18'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Men I Trust Asia Tour 2026: Live In Jakarta'
WHERE o.email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Men I Trust Asia Tour 2026: Live In Jakarta' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 518000, 500, 109
FROM events e WHERE e.title='Men I Trust Asia Tour 2026: Live In Jakarta' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Joyland Sessions 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.plainsong-live@wavy.seed' AND a.name='Joyland Sessions 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Joyland Sessions 2026', 'Music', 'Jakarta Pusat', '2026-10-20'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Joyland Sessions 2026'
WHERE o.email = 'demo.plainsong-live@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Joyland Sessions 2026' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 588000, 200, 71
FROM events e WHERE e.title='Joyland Sessions 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 7. IDEAFEST
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('IDEAFEST', 'demo.ideafest@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'IdeaFest 2026', 'Conference', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ideafest@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ideafest@wavy.seed' AND a.name='IdeaFest 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'IdeaFest 2026', 'Conference', 'Jakarta Pusat', '2026-09-18'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='IdeaFest 2026'
WHERE o.email = 'demo.ideafest@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='IdeaFest 2026' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1400000, 100, 5
FROM events e WHERE e.title='IdeaFest 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 8. Dynamic Duos — MELANKOLIA DI MEDAN
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dynamic Duos', 'demo.dynamic-duos@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MELANKOLIA DI MEDAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.dynamic-duos@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.dynamic-duos@wavy.seed' AND a.name='MELANKOLIA DI MEDAN');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MELANKOLIA DI MEDAN', 'Music', 'TBA', '2026-09-19'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='MELANKOLIA DI MEDAN'
WHERE o.email = 'demo.dynamic-duos@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='MELANKOLIA DI MEDAN' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 50000, 300, 107
FROM events e WHERE e.title='MELANKOLIA DI MEDAN' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 9. CK Star Entertainment — ROSETOPIA
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CK Star Entertainment', 'demo.ck-star-entertainment@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ck-star-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ck-star-entertainment@wavy.seed' AND a.name='ROSETOPIA ASIA TOUR 2026 IN JAKARTA');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', 'Jakarta Selatan', '2026-09-19'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='ROSETOPIA ASIA TOUR 2026 IN JAKARTA'
WHERE o.email = 'demo.ck-star-entertainment@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND e.venue='Jakarta Selatan');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1450000, 100, 15
FROM events e WHERE e.title='ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 10. Moonverse Festival
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Moonverse Festival', 'demo.moonverse-festival@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonverse Festival Vol 7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.moonverse-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.moonverse-festival@wavy.seed' AND a.name='Moonverse Festival Vol 7');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonverse Festival Vol 7', 'Music', 'TBA', '2026-09-19'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Moonverse Festival Vol 7'
WHERE o.email = 'demo.moonverse-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Moonverse Festival Vol 7' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 110000, 100, 35
FROM events e WHERE e.title='Moonverse Festival Vol 7' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 11. ayofest.id
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ayofest.id', 'demo.ayofest-id@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ayo Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.ayofest-id@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.ayofest-id@wavy.seed' AND a.name='Ayo Fest 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ayo Fest 2026', 'Music', 'TBA', '2026-09-20'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Ayo Fest 2026'
WHERE o.email = 'demo.ayofest-id@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Ayo Fest 2026' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 125000, 300, 15
FROM events e WHERE e.title='Ayo Fest 2026' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 12. Raw Vision Collective — YE JAKARTA 2026
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Raw Vision Collective', 'demo.raw-vision-collective@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YE JAKARTA 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.raw-vision-collective@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.raw-vision-collective@wavy.seed' AND a.name='YE JAKARTA 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YE JAKARTA 2026', 'Music', 'Jakarta Pusat', '2026-09-26'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='YE JAKARTA 2026'
WHERE o.email = 'demo.raw-vision-collective@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='YE JAKARTA 2026' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 1875000, 500, 63
FROM events e WHERE e.title='YE JAKARTA 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 13. Morinaga Early Life Nutrition — Parenting Workshop
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Morinaga Early Life Nutrition', 'demo.morinaga-early-life-nutrition@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Next Gen(re) Parenting - Semarang', 'Workshop', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.morinaga-early-life-nutrition@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.morinaga-early-life-nutrition@wavy.seed' AND a.name='Next Gen(re) Parenting - Semarang');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Next Gen(re) Parenting - Semarang', 'Workshop', 'Kota Semarang', '2026-09-26'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Next Gen(re) Parenting - Semarang'
WHERE o.email = 'demo.morinaga-early-life-nutrition@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Next Gen(re) Parenting - Semarang' AND e.venue='Kota Semarang');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 120000, 150, 80
FROM events e WHERE e.title='Next Gen(re) Parenting - Semarang' AND e.venue='Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 14. RdC Jambi
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RdC Jambi', 'demo.rdc-jambi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Jambi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.rdc-jambi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.rdc-jambi@wavy.seed' AND a.name='Riang dan Ceria Jambi');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Jambi', 'Music', 'TBA', '2026-09-27'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Riang dan Ceria Jambi'
WHERE o.email = 'demo.rdc-jambi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Riang dan Ceria Jambi' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 105000, 500, 31
FROM events e WHERE e.title='Riang dan Ceria Jambi' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 15. Free Fire World Series
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Free Fire World Series', 'demo.free-fire-world-series@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals', 'Esports', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.free-fire-world-series@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.free-fire-world-series@wavy.seed' AND a.name='Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals', 'Esports', 'Kota Surabaya', '2026-09-28'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals'
WHERE o.email = 'demo.free-fire-world-series@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals' AND e.venue='Kota Surabaya');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 20000, 500, 299
FROM events e WHERE e.title='Free Fire World Series (FFWS) SEA 2026 Fall - Grand Finals' AND e.venue='Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 16. Remember Musik Festival
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Remember Musik Festival', 'demo.remember-musik-festival@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Remember Fest 2026 X Cube Concert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.remember-musik-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.remember-musik-festival@wavy.seed' AND a.name='Remember Fest 2026 X Cube Concert');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Remember Fest 2026 X Cube Concert', 'Music', 'TBA', '2026-09-29'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Remember Fest 2026 X Cube Concert'
WHERE o.email = 'demo.remember-musik-festival@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Remember Fest 2026 X Cube Concert' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 135000, 300, 12
FROM events e WHERE e.title='Remember Fest 2026 X Cube Concert' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 17. Social Padel House
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Social Padel House, Setiabudi', 'demo.social-padel-house-setiabudi@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPH Superstar Series : Tolito Aguirre', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.social-padel-house-setiabudi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.social-padel-house-setiabudi@wavy.seed' AND a.name='SPH Superstar Series : Tolito Aguirre');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPH Superstar Series : Tolito Aguirre', 'Music', 'Jakarta Selatan', '2026-10-02'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='SPH Superstar Series : Tolito Aguirre'
WHERE o.email = 'demo.social-padel-house-setiabudi@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SPH Superstar Series : Tolito Aguirre' AND e.venue='Jakarta Selatan');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 375000, 150, 5
FROM events e WHERE e.title='SPH Superstar Series : Tolito Aguirre' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 18. NAWA DAYA CREATIVE HUB — SEMESTAMBYAR
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NAWA DAYA CREATIVE HUB', 'demo.nawa-daya-creative-hub@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SEMESTAMBYAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.nawa-daya-creative-hub@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.nawa-daya-creative-hub@wavy.seed' AND a.name='SEMESTAMBYAR');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SEMESTAMBYAR', 'Music', 'TBA', '2026-10-03'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='SEMESTAMBYAR'
WHERE o.email = 'demo.nawa-daya-creative-hub@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='SEMESTAMBYAR' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 80000, 500, 68
FROM events e WHERE e.title='SEMESTAMBYAR' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 19. BARCODE GOKART
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BARCODE GOKART', 'demo.barcode-gokart@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BARCODE GOKART', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.barcode-gokart@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.barcode-gokart@wavy.seed' AND a.name='BARCODE GOKART');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BARCODE GOKART', 'Music', 'Jakarta Utara', '2026-10-13'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='BARCODE GOKART'
WHERE o.email = 'demo.barcode-gokart@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='BARCODE GOKART' AND e.venue='Jakarta Utara');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 60000, 150, 69
FROM events e WHERE e.title='BARCODE GOKART' AND e.venue='Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 20. PT Oppal Musik Indonesia — Snada
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Oppal Musik Indonesia', 'demo.pt-oppal-musik-indonesia@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Snada Indonesia 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pt-oppal-musik-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pt-oppal-musik-indonesia@wavy.seed' AND a.name='Snada Indonesia 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Snada Indonesia 2026', 'Music', 'Jakarta Pusat', '2026-10-16'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Snada Indonesia 2026'
WHERE o.email = 'demo.pt-oppal-musik-indonesia@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Snada Indonesia 2026' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 675000, 100, 36
FROM events e WHERE e.title='Snada Indonesia 2026' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 21. JAFPRO — Nyanyian Fest
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JAFPRO', 'demo.jafpro@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nyanyian Fest Subang 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.jafpro@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.jafpro@wavy.seed' AND a.name='Nyanyian Fest Subang 2026');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nyanyian Fest Subang 2026', 'Music', 'TBA', '2026-10-24'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Nyanyian Fest Subang 2026'
WHERE o.email = 'demo.jafpro@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Nyanyian Fest Subang 2026' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 100000, 150, 13
FROM events e WHERE e.title='Nyanyian Fest Subang 2026' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 22. Petrick Kluivert — Piano Recital
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Petrick Kluivert', 'demo.petrick-kluivert@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Piano Recital by Petrick Kluivert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.petrick-kluivert@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.petrick-kluivert@wavy.seed' AND a.name='Piano Recital by Petrick Kluivert');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Piano Recital by Petrick Kluivert', 'Music', 'Jakarta Selatan', '2026-11-08'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Piano Recital by Petrick Kluivert'
WHERE o.email = 'demo.petrick-kluivert@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Piano Recital by Petrick Kluivert' AND e.venue='Jakarta Selatan');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 300000, 500, 292
FROM events e WHERE e.title='Piano Recital by Petrick Kluivert' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 23. The 49th Jazz Goes to Campus
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The 49th Jazz Goes to Campus', 'demo.the-49th-jazz-goes-to-campus@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The 49th Jazz Goes to Campus', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.the-49th-jazz-goes-to-campus@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.the-49th-jazz-goes-to-campus@wavy.seed' AND a.name='The 49th Jazz Goes to Campus');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The 49th Jazz Goes to Campus', 'Music', 'Kota Depok', '2026-11-23'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='The 49th Jazz Goes to Campus'
WHERE o.email = 'demo.the-49th-jazz-goes-to-campus@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='The 49th Jazz Goes to Campus' AND e.venue='Kota Depok');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 175000, 150, 47
FROM events e WHERE e.title='The 49th Jazz Goes to Campus' AND e.venue='Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 24. Flabbergast Productions — Tiffany Young
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Flabbergast Productions', 'demo.flabbergast-productions@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tiffany Young: Edge of Calm Tour in Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.flabbergast-productions@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.flabbergast-productions@wavy.seed' AND a.name='Tiffany Young: Edge of Calm Tour in Jakarta');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tiffany Young: Edge of Calm Tour in Jakarta', 'Music', 'Jakarta Pusat', '2026-11-29'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Tiffany Young: Edge of Calm Tour in Jakarta'
WHERE o.email = 'demo.flabbergast-productions@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Tiffany Young: Edge of Calm Tour in Jakarta' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 950000, 100, 35
FROM events e WHERE e.title='Tiffany Young: Edge of Calm Tour in Jakarta' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 25. PT. Roemah Satu Ide — FEEL YOUR PAPUA
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. Roemah Satu Ide', 'demo.pt-roemah-satu-ide@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FEEL YOUR PAPUA - SORONG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.pt-roemah-satu-ide@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.pt-roemah-satu-ide@wavy.seed' AND a.name='FEEL YOUR PAPUA - SORONG');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FEEL YOUR PAPUA - SORONG', 'Music', 'TBA', '2026-12-05'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='FEEL YOUR PAPUA - SORONG'
WHERE o.email = 'demo.pt-roemah-satu-ide@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='FEEL YOUR PAPUA - SORONG' AND e.venue='TBA');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 75000, 100, 36
FROM events e WHERE e.title='FEEL YOUR PAPUA - SORONG' AND e.venue='TBA'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 26. Emerge Consulting — Workshop
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Emerge Consulting', 'demo.emerge-consulting@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop', 'Workshop', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.emerge-consulting@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.emerge-consulting@wavy.seed' AND a.name='Leading HR and Unlocking Organisational Performance: People & Performance Workshop');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Leading HR and Unlocking Organisational Performance: People & Performance Workshop', 'Workshop', 'Jakarta Pusat', '2026-12-10'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Leading HR and Unlocking Organisational Performance: People & Performance Workshop'
WHERE o.email = 'demo.emerge-consulting@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND e.venue='Jakarta Pusat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 330000, 100, 39
FROM events e WHERE e.title='Leading HR and Unlocking Organisational Performance: People & Performance Workshop' AND e.venue='Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 27. GoldLivexComika — Adili Idola
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GoldLivexComika', 'demo.goldlivexcomika@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Adili Idola: Celebrity Roast', 'Comedy', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.goldlivexcomika@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.goldlivexcomika@wavy.seed' AND a.name='Adili Idola: Celebrity Roast');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Adili Idola: Celebrity Roast', 'Comedy', 'Jakarta Barat', '2026-12-18'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Adili Idola: Celebrity Roast'
WHERE o.email = 'demo.goldlivexcomika@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Adili Idola: Celebrity Roast' AND e.venue='Jakarta Barat');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 350000, 150, 63
FROM events e WHERE e.title='Adili Idola: Celebrity Roast' AND e.venue='Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 28. COMIKA EVENT — Putbal Comedy Show
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('COMIKA EVENT', 'demo.comika-event@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Putbal Comedy Show', 'Comedy', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.comika-event@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.comika-event@wavy.seed' AND a.name='Putbal Comedy Show');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Putbal Comedy Show', 'Comedy', 'DKI Jakarta', '2026-12-18'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Putbal Comedy Show'
WHERE o.email = 'demo.comika-event@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Putbal Comedy Show' AND e.venue='DKI Jakarta');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 150000, 500, 218
FROM events e WHERE e.title='Putbal Comedy Show' AND e.venue='DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

-- ============================================================
-- 29. OFF/SIDE — Park Ji-Sung Dinner
-- ============================================================
INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OFF/SIDE', 'demo.off-side@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Exclusive Dinner with Park Ji-Sung and Patrice Evra', 'Lifestyle', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.off-side@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id=a.organizer_id WHERE o.email='demo.off-side@wavy.seed' AND a.name='Exclusive Dinner with Park Ji-Sung and Patrice Evra');

INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Exclusive Dinner with Park Ji-Sung and Patrice Evra', 'Lifestyle', 'Jakarta Selatan', '2026-12-18'::timestamptz, '', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name='Exclusive Dinner with Park Ji-Sung and Patrice Evra'
WHERE o.email = 'demo.off-side@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events e WHERE e.title='Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND e.venue='Jakarta Selatan');

INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT e.id, 'Reguler', 8500000, 200, 59
FROM events e WHERE e.title='Exclusive Dinner with Park Ji-Sung and Patrice Evra' AND e.venue='Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id=e.id);

COMMIT;

-- Verify counts
SELECT 'organizers' AS tbl, COUNT(*) AS cnt FROM organizers
UNION ALL SELECT 'artists', COUNT(*) FROM artists
UNION ALL SELECT 'events', COUNT(*) FROM events
UNION ALL SELECT 'ticket_categories', COUNT(*) FROM ticket_categories
ORDER BY tbl;
