-- Seed data: 597 concerts scraped from artatix.co.id + loket.com (2026-09-05)
-- Posters hosted on source CDNs (assets.artatix.co.id / assets.loket.com)
-- Safe to re-run: organizers keyed by email (ON CONFLICT DO NOTHING), events/artists guarded by NOT EXISTS

BEGIN;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hectic Creative', 'demo.scrape-1@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('WeR1 Official', 'demo.scrape-2@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Ruang Bermusik', 'demo.scrape-3@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FLUENTH.HOUSE', 'demo.scrape-4@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Carnaval of Screams', 'demo.scrape-5@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Melangkah Bersama', 'demo.scrape-6@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Universitas Kepanjen Malang', 'demo.scrape-7@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('THE POWER OF HUMAN', 'demo.scrape-8@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hellprint Official', 'demo.scrape-9@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dawn Gong', 'demo.scrape-10@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BPC HIPMI Majalengka', 'demo.scrape-11@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SAKUDUTAN!', 'demo.scrape-12@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Join', 'demo.scrape-13@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('We Are All Gonna Make It', 'demo.scrape-14@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 113 Jakarta', 'demo.scrape-15@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Say Boo Mee Records', 'demo.scrape-16@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sendagia Festival', 'demo.scrape-17@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Mendadak Festival', 'demo.scrape-18@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Fafest', 'demo.scrape-19@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pranugum Live', 'demo.scrape-20@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Jenitri Communications', 'demo.scrape-21@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('POWERED BY LEISURE', 'demo.scrape-22@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('House Of Gorgom', 'demo.scrape-23@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Pangudi Luhur II Servasius Bekasi', 'demo.scrape-24@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Negeri 2 Jakarta Barat', 'demo.scrape-25@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FUTURA FREE', 'demo.scrape-26@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('City of Laboratory', 'demo.scrape-27@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hingar.Project', 'demo.scrape-28@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Timur Bersemi', 'demo.scrape-29@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Spirit Behind The Goal', 'demo.scrape-30@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MASPAM COMPANY LTD X HECTIC CREATIVE X JNM BLOC X ILINE PRODUCTION', 'demo.scrape-31@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Grounderz 031', 'demo.scrape-32@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('verse class entertainment', 'demo.scrape-33@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Charitas', 'demo.scrape-34@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pajero Surakarta', 'demo.scrape-35@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('LUMAJANG METALHEAD', 'demo.scrape-36@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CHIERRA FEST', 'demo.scrape-37@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SINGALAUT 51', 'demo.scrape-38@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Musievent', 'demo.scrape-39@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bumi Irama', 'demo.scrape-40@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tegal City Hardcore', 'demo.scrape-41@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HELLHOUSE', 'demo.scrape-42@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Arsa Rijaya Entertainment', 'demo.scrape-43@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HomeTheatre2025', 'demo.scrape-44@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PSM Cantus Firmus USD', 'demo.scrape-45@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PRADIA FEST', 'demo.scrape-46@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rumble Effect', 'demo.scrape-47@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('UKM SBN UAJY', 'demo.scrape-48@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ARTEFAC UNS', 'demo.scrape-49@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('UKM MUSIK UBHARA PRESENT GEBYAR KHARISMA 26 x B.O.S', 'demo.scrape-50@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bestieval Indonesia Concert', 'demo.scrape-51@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Essential Loka', 'demo.scrape-52@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Cultivation Concert', 'demo.scrape-53@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tiarasary', 'demo.scrape-54@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hadir Entertainment', 'demo.scrape-55@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RNR Experience', 'demo.scrape-56@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tamapro Creative', 'demo.scrape-57@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Lokananta Surakarta', 'demo.scrape-58@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Aksara', 'demo.scrape-59@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Global Mandiri Jakarta', 'demo.scrape-60@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MILAD 60 FISIP UNTAN', 'demo.scrape-61@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Timeless Live', 'demo.scrape-62@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sahid Raya Yogyakarta', 'demo.scrape-63@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Karang Taruna Tunas Muda Priyan', 'demo.scrape-64@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PORSENI FKH UNAIR', 'demo.scrape-65@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM FISIP UNESA', 'demo.scrape-66@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Rahayu Indonesia Sentosa', 'demo.scrape-67@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tolos Entertainment', 'demo.scrape-68@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('One Night Pro', 'demo.scrape-69@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MEG Entertainment', 'demo.scrape-70@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Simak Siar', 'demo.scrape-71@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Universitas Terbuka Purwokerto', 'demo.scrape-72@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rocket Promotindo', 'demo.scrape-73@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CRAST EVENT', 'demo.scrape-74@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('POSER - Reka Kreatif', 'demo.scrape-75@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Stana Production', 'demo.scrape-76@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tambun City Hardcore', 'demo.scrape-77@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ENDOFTIME MANAGEMENT', 'demo.scrape-78@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Seinkiri Coffee, Kitchen, and Space', 'demo.scrape-79@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bandung Death Fest', 'demo.scrape-80@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('TEN US', 'demo.scrape-81@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Nada Dansa', 'demo.scrape-82@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('rood.fest', 'demo.scrape-83@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Human Capital', 'demo.scrape-84@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Arjuna Fest', 'demo.scrape-85@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('TC Projects', 'demo.scrape-86@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JAMBORE JAZZ KAMPUS 13th', 'demo.scrape-87@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM FISIB Universitas Pakuan', 'demo.scrape-88@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Engine Tune Up 2025', 'demo.scrape-89@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GRAMM HOTEL by Ambarrukmo Yogyakarta', 'demo.scrape-90@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Our Creative', 'demo.scrape-91@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEAZT ID', 'demo.scrape-92@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kontener Production', 'demo.scrape-93@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sedjiwa Project', 'demo.scrape-94@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Student Association of English Education Department', 'demo.scrape-95@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DEPT. SENI DAN BUDAYA BEM KM FH UNIVERSITAS SINGAPERBANGSA KARAWANG', 'demo.scrape-96@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Himpunan Mahasiswa Sipil FT UNTIRTA', 'demo.scrape-97@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA PLUS ISLAMIC VILLAGE', 'demo.scrape-98@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Mini Gigs', 'demo.scrape-99@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('STARFM UNS', 'demo.scrape-100@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM REMA UPI TASIKMALAYA', 'demo.scrape-101@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Spasial Live', 'demo.scrape-102@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('rockland.id', 'demo.scrape-103@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Non blok Crew', 'demo.scrape-104@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('One Night Project Indramayu', 'demo.scrape-105@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 99 JAKARTA', 'demo.scrape-106@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PSYONARA', 'demo.scrape-107@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Hallway Space', 'demo.scrape-108@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA NEGERI 2 CILACAP', 'demo.scrape-109@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NSB Project', 'demo.scrape-110@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pausa Melodi', 'demo.scrape-111@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Medialink Internasional', 'demo.scrape-112@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('COMMPHORIA 2025', 'demo.scrape-113@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Maha Creators', 'demo.scrape-114@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Jogja Nyengkuyung', 'demo.scrape-115@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. RADIO BUK GAJAH MEGASWARATAMA', 'demo.scrape-116@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ULTIMO MIGLIO', 'demo.scrape-117@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RUMAH EVENT INDONESIA', 'demo.scrape-118@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pawon Projects', 'demo.scrape-119@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Mthree Management', 'demo.scrape-120@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('casabadia', 'demo.scrape-121@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Qubu Resort', 'demo.scrape-122@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GLOBALNIGHTCULTURE', 'demo.scrape-123@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('150 Coffee Garden', 'demo.scrape-124@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Suarasa', 'demo.scrape-125@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Porlak Jahe Resort Purwakarta', 'demo.scrape-126@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Moonverse Festival', 'demo.scrape-127@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KAVAYA PRODUCTION', 'demo.scrape-128@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Berkah Maharta Satria', 'demo.scrape-129@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Aldo putra management', 'demo.scrape-130@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gubuk Kreasi Bersama', 'demo.scrape-131@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('One Night Project', 'demo.scrape-132@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Arena Sirkus', 'demo.scrape-133@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Fajarsoul Official Fanbase', 'demo.scrape-134@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Thirty One Festival - TOFEST 2025', 'demo.scrape-135@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Landfestival', 'demo.scrape-136@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Viking Karawang', 'demo.scrape-137@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 2 Tangerang Selatan', 'demo.scrape-138@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Panitia SMANSAFEST 2026', 'demo.scrape-139@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HMTS Universitas Tidar Magelang', 'demo.scrape-140@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Fun Asik Team', 'demo.scrape-141@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 1 BOYOLANGU', 'demo.scrape-142@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('TREVORA PRANA WORKS', 'demo.scrape-143@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('More Than Broterhood', 'demo.scrape-144@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('St. Bier Bar & Kitchen', 'demo.scrape-145@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Osis Smazaba Production', 'demo.scrape-146@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Linogram', 'demo.scrape-147@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Escalla Flora', 'demo.scrape-148@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Progresif Entertainment', 'demo.scrape-149@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Weekend Kalcer', 'demo.scrape-150@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('distopiafest', 'demo.scrape-151@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Lembang Fest', 'demo.scrape-152@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SKA Live', 'demo.scrape-153@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('86 solution', 'demo.scrape-154@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RITZ PRODUCTION', 'demo.scrape-155@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pangsuma FC', 'demo.scrape-156@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SoundKlik', 'demo.scrape-157@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Malampora', 'demo.scrape-158@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Universitas Budi Luhur', 'demo.scrape-159@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Ongatino Organizer', 'demo.scrape-160@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('62SOUND', 'demo.scrape-161@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rayabeatfestival', 'demo.scrape-162@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Omega Space', 'demo.scrape-163@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('YKI Cabang Koordinator Jawa Tengah', 'demo.scrape-164@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Ngabudaya Creative Indonesia', 'demo.scrape-165@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Blast ID', 'demo.scrape-166@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('LBH Padang   X Warga Bantu Warga', 'demo.scrape-167@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DoggyHouse Records', 'demo.scrape-168@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rumah Eyang Production', 'demo.scrape-169@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ZENMA Creative', 'demo.scrape-170@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bergigs Ria', 'demo.scrape-171@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Paduan Suara Gita Swara Jaya', 'demo.scrape-172@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bintang Serang Festival', 'demo.scrape-173@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Irish Music', 'demo.scrape-174@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('STAGE OF ARCHITECTURE', 'demo.scrape-175@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dompet Dhuafa Yogyakarta', 'demo.scrape-176@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Local Movement Festival', 'demo.scrape-177@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BOGOR BRUTAL FEST', 'demo.scrape-178@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MALANG VIOLENCE', 'demo.scrape-179@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Ziforia Festival', 'demo.scrape-180@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Handarbeni', 'demo.scrape-181@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('WTS Organizer', 'demo.scrape-182@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Labs Production', 'demo.scrape-183@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Centro Roast Space', 'demo.scrape-184@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rumah Bergerak', 'demo.scrape-185@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Panggung Penjuru', 'demo.scrape-186@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('UNLEASHED', 'demo.scrape-187@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Javalava x Sens Production89', 'demo.scrape-188@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Reang Fest', 'demo.scrape-189@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kudus Hardcore', 'demo.scrape-190@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BRE Banyumas Rawuh Entertainment', 'demo.scrape-191@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JRNY Records', 'demo.scrape-192@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('satu.id', 'demo.scrape-193@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Aremaniac Event', 'demo.scrape-194@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Connective Creative', 'demo.scrape-195@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('duatujuh communication', 'demo.scrape-196@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CURVA BOYS 1967', 'demo.scrape-197@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Madness YK Fest', 'demo.scrape-198@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Syafana Islamic School', 'demo.scrape-199@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Spectaphoria', 'demo.scrape-200@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('House of Catacombs', 'demo.scrape-201@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('WTMF', 'demo.scrape-202@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Argo Asia', 'demo.scrape-203@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DARAHBIRU MUSIKINDO', 'demo.scrape-204@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Senada Senadi', 'demo.scrape-205@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bandung Calling', 'demo.scrape-206@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Vecreative', 'demo.scrape-207@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OSIS SMA Kharisma Bangsa', 'demo.scrape-208@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BSO BAND FEB UI', 'demo.scrape-209@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PLP Records', 'demo.scrape-210@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BAM PRODUCTION', 'demo.scrape-211@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Random Heads Creator', 'demo.scrape-212@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Neverland', 'demo.scrape-213@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hip Hop Sorringin', 'demo.scrape-214@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dieng Underground Community', 'demo.scrape-215@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Biyasa Cafe & Billiard', 'demo.scrape-216@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Dynamic Duos', 'demo.scrape-217@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Plainform By Friend At Hand', 'demo.scrape-218@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bekasi Distorsi', 'demo.scrape-219@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Anar Club', 'demo.scrape-220@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PENTASTIX', 'demo.scrape-221@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Waloh Mateng Production', 'demo.scrape-222@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sulawesi Youth Festival', 'demo.scrape-223@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. Sekar Laut Tbk Finna Food', 'demo.scrape-224@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sukahati Creative Organizer', 'demo.scrape-225@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ILMU KOMUNIKASI UNRI 2023', 'demo.scrape-226@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Flawless Project', 'demo.scrape-227@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('swaraskena', 'demo.scrape-228@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bestie Fest', 'demo.scrape-229@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Scooter Magelangan Ride', 'demo.scrape-230@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Merona Entertainment', 'demo.scrape-231@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('MAN 25 JAKARTA', 'demo.scrape-232@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kenduri Musik Festival', 'demo.scrape-233@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('510Squad', 'demo.scrape-234@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Yayasan Generasi Inovatif Tunas Unggul', 'demo.scrape-235@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Jangan Kolektif', 'demo.scrape-236@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Konser Berani Tambah Bahagia', 'demo.scrape-237@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kreasi Management', 'demo.scrape-238@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ONE LIVE Indonesia', 'demo.scrape-239@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Cerita Kita Fest', 'demo.scrape-240@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rihels biz', 'demo.scrape-241@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kemenkraf uniba', 'demo.scrape-242@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JAFPRO', 'demo.scrape-243@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Nocturnal Blazze', 'demo.scrape-244@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Spiff Up The Frat', 'demo.scrape-245@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Civil Engineering Days', 'demo.scrape-246@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hardrock Indonesia', 'demo.scrape-247@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FESTAYA NTT', 'demo.scrape-248@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KOMUS FBE UAJY', 'demo.scrape-249@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Management Creativity Festival', 'demo.scrape-250@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Paduan Suara Mahasiswa UAJY', 'demo.scrape-251@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('tigosenga', 'demo.scrape-252@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Elkamasihcreative', 'demo.scrape-253@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FAKULTAS ILMU SOSIAL DAN ILMU POLITIK UAJY', 'demo.scrape-254@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Momenta Fest', 'demo.scrape-255@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Riuh Bersua', 'demo.scrape-256@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NiceyPeeps', 'demo.scrape-257@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rorojongrang Organizer', 'demo.scrape-258@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SCO Sekolah  Highscope  Indonesia Bintaro', 'demo.scrape-259@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PRIKITIEW LAND SUBANG', 'demo.scrape-260@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Hajatan Creative', 'demo.scrape-261@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Magnolia Coffee', 'demo.scrape-262@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Submarine Club', 'demo.scrape-263@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('RdC Jambi', 'demo.scrape-264@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Yayasan Get Plastic Indonesia', 'demo.scrape-265@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PreachJa', 'demo.scrape-266@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('IMU LOUDS', 'demo.scrape-267@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Baru Aja Collective', 'demo.scrape-268@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kutata Production', 'demo.scrape-269@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JNM Bloc', 'demo.scrape-270@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Metalgear Music', 'demo.scrape-271@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Komunitas Cirebon Bernyanyi', 'demo.scrape-272@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FTI JAYABAYA', 'demo.scrape-273@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Home Store Btm', 'demo.scrape-274@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Tulungagung rock comunity', 'demo.scrape-275@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HM ILKOM UDINUS', 'demo.scrape-276@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OSIS SMAZA PRODUCTION', 'demo.scrape-277@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Locomotive 21 Production', 'demo.scrape-278@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pesta Mangan', 'demo.scrape-279@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('LEMBAGA KESENANGAN RAKYAT', 'demo.scrape-280@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Pops Company', 'demo.scrape-281@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Seven ocean', 'demo.scrape-282@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Lokakarta', 'demo.scrape-283@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Rise Of The Deadtown x Ranggas Motorcycle', 'demo.scrape-284@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DEM FEB Universitas Slamet Riyadi Surakarta', 'demo.scrape-285@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kpop Event Palembang', 'demo.scrape-286@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Unity Fest - Extended Version Padang', 'demo.scrape-287@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Himpunan Mahasiswa Teknik Industri Universitas Muhammadiyah Gresik', 'demo.scrape-288@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PB Official', 'demo.scrape-289@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV. Duta Biru Production', 'demo.scrape-290@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kanal Space', 'demo.scrape-291@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM FAKULTAS PSIKOLOGI UNIVERSITAS GUNADARMA', 'demo.scrape-292@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEMFH UNILA', 'demo.scrape-293@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Setelah Menjadi Bapak', 'demo.scrape-294@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMASA GENERATION XXXII TANAYA', 'demo.scrape-295@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BULL MOTION UNITY FEST - BENGKULU', 'demo.scrape-296@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Metafora project', 'demo.scrape-297@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Ermukim Party', 'demo.scrape-298@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BURNOUT x TEGANGAN TINGGI', 'demo.scrape-299@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. DECOPEDIA UTAMA INTERNASIONAL', 'demo.scrape-300@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PANITIA GADO GADO XVII', 'demo.scrape-301@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gigsgoks', 'demo.scrape-302@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Pulse Production', 'demo.scrape-303@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Eternal Blast', 'demo.scrape-304@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Futura Studio', 'demo.scrape-305@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV Kemilau Berlian Abadi', 'demo.scrape-306@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Fbn Artisantz', 'demo.scrape-307@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Frans Production', 'demo.scrape-308@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Riverside Famiglia', 'demo.scrape-309@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PARTILIBUR', 'demo.scrape-310@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HIMAHI Budi Luhur', 'demo.scrape-311@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gelaria', 'demo.scrape-312@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OSIS MAN 2 Tulungagung', 'demo.scrape-313@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BULL MOTION LAMPUNG', 'demo.scrape-314@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM KM FISIP UGJ', 'demo.scrape-315@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('OtwBreakOutDay 2026', 'demo.scrape-316@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Lampion 2026', 'demo.scrape-317@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Jember Fashion Carnaval', 'demo.scrape-318@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Eclipse Time Records', 'demo.scrape-319@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Amplified Session x Dengar Kota SOC x Solo Musik Fest', 'demo.scrape-320@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Kekumpul', 'demo.scrape-321@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JITU FAST ENTERTAIN', 'demo.scrape-322@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Groundzero', 'demo.scrape-323@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('TURN', 'demo.scrape-324@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. Roemah Satu Ide', 'demo.scrape-325@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Global Ahensi Solusindo', 'demo.scrape-326@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Soundjah', 'demo.scrape-327@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('WTkreatif', 'demo.scrape-328@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KINARIA  EVENT ORGANIZER', 'demo.scrape-329@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KOMAPA UAJY', 'demo.scrape-330@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DD Entertainment', 'demo.scrape-331@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Saint Johns Catholic School', 'demo.scrape-332@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Same Sun', 'demo.scrape-333@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('0911 ORGANIZER', 'demo.scrape-334@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Istana Production', 'demo.scrape-335@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV. Brinn Putra Perkasa ''Beplus Communication''', 'demo.scrape-336@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('1000 Step Records & Eclipse Time Records', 'demo.scrape-337@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Katarsis', 'demo.scrape-338@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Swable Fest', 'demo.scrape-339@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Sekolah Islam Dian Didaktika', 'demo.scrape-340@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CV.kutata production', 'demo.scrape-341@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('510Squad Lamongan', 'demo.scrape-342@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ayofest.id', 'demo.scrape-343@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('In Inertia Showcase Bandung', 'demo.scrape-344@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Bolak Balik Event', 'demo.scrape-345@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Muda Mudi Feelling Empty', 'demo.scrape-346@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Republik Event Musik Indonesia', 'demo.scrape-347@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The Rawstage', 'demo.scrape-348@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMAN 44 JAKARTA', 'demo.scrape-349@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NAWA DAYA CREATIVE HUB', 'demo.scrape-350@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('UKM Pancasila Economic Art Division', 'demo.scrape-351@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('D''Angelic Choir', 'demo.scrape-352@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Crowded Records', 'demo.scrape-353@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gema Music Festival', 'demo.scrape-354@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Malang Bay Festival', 'demo.scrape-355@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA Global Mandiri Cibubur', 'demo.scrape-356@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SARANG WALI ENTERTAIMENT', 'demo.scrape-357@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FF CREATIVE', 'demo.scrape-358@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIGMA PRO INDONESIA', 'demo.scrape-359@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BUZZ CREATIVE PROJECT', 'demo.scrape-360@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT.  Area Group Nusantara', 'demo.scrape-361@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('YOUNG ENTERTAIN', 'demo.scrape-362@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('CK Star Entertainment', 'demo.scrape-363@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('North Ndapur', 'demo.scrape-364@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Angular//Momentum', 'demo.scrape-365@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Perusahaan Mai Dee', 'demo.scrape-366@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEMF Psikologi Universitas Sanata Dharma', 'demo.scrape-367@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('KRAZY BRAZY KARAWANG', 'demo.scrape-368@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Partimur Fest', 'demo.scrape-369@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM KM FARMASI UGM', 'demo.scrape-370@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('AMC FIA UB', 'demo.scrape-371@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Antara Suara', 'demo.scrape-372@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('S3 Entertainment by PT. Suryono Sehat Sejahtera', 'demo.scrape-373@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('GTR Runners', 'demo.scrape-374@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Remember Musik Festival', 'demo.scrape-375@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT Semua Pasti Gembira', 'demo.scrape-376@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('NMF ENTERTAINMENT', 'demo.scrape-377@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SMA NEGERI 2 CIBINONG', 'demo.scrape-378@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('PT. AKL Multiorganizer & Eventhype', 'demo.scrape-379@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('The 49th Jazz Goes to Campus', 'demo.scrape-380@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('JONG MESOEDJINEN', 'demo.scrape-381@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Plainsong Live', 'demo.scrape-382@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gemolong Festival', 'demo.scrape-383@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM Fakultas Ekonomi Universitas Sanata Dharma', 'demo.scrape-384@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('BEM UPN Veteran Jakarta', 'demo.scrape-385@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIKMA FTI UAJY', 'demo.scrape-386@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('FISIP UPNVJ', 'demo.scrape-387@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('ArtNoiserecords X B.O.B present', 'demo.scrape-388@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Vision Ground', 'demo.scrape-389@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Fakultas Ilmu Komunikasi Universitas Pancasila', 'demo.scrape-390@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('HMJ KPI UIN SSC', 'demo.scrape-391@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Nara Creative', 'demo.scrape-392@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('New Gen Entertainment', 'demo.scrape-393@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('DINAMIT 2026', 'demo.scrape-394@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('SIN COMPANY', 'demo.scrape-395@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Official BVJ', 'demo.scrape-396@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

INSERT INTO organizers (name, email, password, status, whatsapp, event_types, social_link)
VALUES ('Gembira Creative', 'demo.scrape-397@wavy.seed', '$2b$10$demoSeedHashNotForLogin', 'active', '', 'Music', '')
ON CONFLICT (email) DO NOTHING;

-- ============ EVENTS (597) ============

-- Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"', 'Music', 'GOR UNY, Kab. Sleman', '2024-04-21 17:00:00'::timestamptz, 'https://assets.artatix.co.id/event/66069fbfb7daa-IMG_0431.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"' AND ev.venue = 'GOR UNY, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 33
FROM events ev WHERE ev.title = 'Sebuah Pertunjukan Oleh Hindia dan Kawan-Kawan "DEFRAG"' AND ev.venue = 'GOR UNY, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RXXIII Birthday Celebration (Online)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RXXIII Birthday Celebration (Online)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-2@wavy.seed' AND a.name = 'RXXIII Birthday Celebration (Online)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RXXIII Birthday Celebration (Online)', 'Music', 'Jakarta & Online Stream, Sleman', '2024-06-15 19:00:00'::timestamptz, 'https://assets.artatix.co.id/event/66504379aaf83-WER1TICKETS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RXXIII Birthday Celebration (Online)'
WHERE o.email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RXXIII Birthday Celebration (Online)' AND ev.venue = 'Jakarta & Online Stream, Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 226
FROM events ev WHERE ev.title = 'RXXIII Birthday Celebration (Online)' AND ev.venue = 'Jakarta & Online Stream, Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ruang Bermusik 2024
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ruang Bermusik 2024', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-3@wavy.seed' AND a.name = 'Ruang Bermusik 2024');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ruang Bermusik 2024', 'Music', 'Tasikmalaya, Kota Tasikmalaya', '2024-07-13 14:00:00'::timestamptz, 'https://assets.artatix.co.id/event/66683513cf1fe-ruangbermusikbannerv1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ruang Bermusik 2024'
WHERE o.email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ruang Bermusik 2024' AND ev.venue = 'Tasikmalaya, Kota Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 850000, 500, 49
FROM events ev WHERE ev.title = 'Ruang Bermusik 2024' AND ev.venue = 'Tasikmalaya, Kota Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DOOMSDAY OPEN AIR FESTIVAL 2024
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DOOMSDAY OPEN AIR FESTIVAL 2024', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'DOOMSDAY OPEN AIR FESTIVAL 2024');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DOOMSDAY OPEN AIR FESTIVAL 2024', 'Music', 'PPI Lapangan Pussenif Bandung, Kota Bandung', '2024-10-06 10:00:00'::timestamptz, 'https://assets.artatix.co.id/event/66b33dd885cc3-BANNERARTATIXDOA2024copy.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DOOMSDAY OPEN AIR FESTIVAL 2024'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DOOMSDAY OPEN AIR FESTIVAL 2024' AND ev.venue = 'PPI Lapangan Pussenif Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 79000, 500, 172
FROM events ev WHERE ev.title = 'DOOMSDAY OPEN AIR FESTIVAL 2024' AND ev.venue = 'PPI Lapangan Pussenif Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CLEOPATRA by Carnaval of Screams
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CLEOPATRA by Carnaval of Screams', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'CLEOPATRA by Carnaval of Screams');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CLEOPATRA by Carnaval of Screams', 'Music', 'Tip Tap Toe, Yogyakarta, Kab. Sleman', '2024-11-01 19:00:00'::timestamptz, 'https://assets.artatix.co.id/event/GCK3IU3SH4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CLEOPATRA by Carnaval of Screams'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CLEOPATRA by Carnaval of Screams' AND ev.venue = 'Tip Tap Toe, Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 245
FROM events ev WHERE ev.title = 'CLEOPATRA by Carnaval of Screams' AND ev.venue = 'Tip Tap Toe, Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In2meet Night (Online Stream)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In2meet Night (Online Stream)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-2@wavy.seed' AND a.name = 'In2meet Night (Online Stream)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In2meet Night (Online Stream)', 'Music', 'Online Stream, Sleman', '2025-01-24 18:30:00'::timestamptz, 'https://assets.artatix.co.id/event/677a4a5239068-IMG_2088.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In2meet Night (Online Stream)'
WHERE o.email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In2meet Night (Online Stream)' AND ev.venue = 'Online Stream, Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 6
FROM events ev WHERE ev.title = 'In2meet Night (Online Stream)' AND ev.venue = 'Online Stream, Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In2Meet Night (Offline)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In2Meet Night (Offline)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-2@wavy.seed' AND a.name = 'In2Meet Night (Offline)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In2Meet Night (Offline)', 'Music', 'Jakarta, Sleman', '2025-01-24 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_677a4d2011f27.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In2Meet Night (Offline)'
WHERE o.email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In2Meet Night (Offline)' AND ev.venue = 'Jakarta, Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 46
FROM events ev WHERE ev.title = 'In2Meet Night (Offline)' AND ev.venue = 'Jakarta, Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Melangkah Bersama Vol. 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Melangkah Bersama Vol. 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-6@wavy.seed' AND a.name = 'Melangkah Bersama Vol. 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Melangkah Bersama Vol. 2', 'Music', 'SCBD Kopi Komplek Ruko Babarsari, Kab. Sleman', '2025-06-21 17:00:00'::timestamptz, 'https://assets.artatix.co.id/event/683a75f658357-artatixMBv2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Melangkah Bersama Vol. 2'
WHERE o.email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Melangkah Bersama Vol. 2' AND ev.venue = 'SCBD Kopi Komplek Ruko Babarsari, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 15000, 500, 288
FROM events ev WHERE ev.title = 'Melangkah Bersama Vol. 2' AND ev.venue = 'SCBD Kopi Komplek Ruko Babarsari, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- UK IMMORTAL FEST 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'UK IMMORTAL FEST 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-7@wavy.seed' AND a.name = 'UK IMMORTAL FEST 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'UK IMMORTAL FEST 2025', 'Music', 'Universitas Kepanjen, Malang', '2025-08-02 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/686cb08dcd5ec-Banner.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'UK IMMORTAL FEST 2025'
WHERE o.email = 'demo.scrape-7@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'UK IMMORTAL FEST 2025' AND ev.venue = 'Universitas Kepanjen, Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 111
FROM events ev WHERE ev.title = 'UK IMMORTAL FEST 2025' AND ev.venue = 'Universitas Kepanjen, Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pentas Narasi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pentas Narasi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-8@wavy.seed' AND a.name = 'Pentas Narasi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pentas Narasi', 'Music', 'Sport Center Kota Bengkulu, Kota Bengkulu', '2025-09-04 17:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_6845997e4c3df.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pentas Narasi'
WHERE o.email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pentas Narasi' AND ev.venue = 'Sport Center Kota Bengkulu, Kota Bengkulu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 420000, 500, 184
FROM events ev WHERE ev.title = 'Pentas Narasi' AND ev.venue = 'Sport Center Kota Bengkulu, Kota Bengkulu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Burgerkill "Resilient Show"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Burgerkill "Resilient Show"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Burgerkill "Resilient Show"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Burgerkill "Resilient Show"', 'Music', 'Graha Manggala Siliwangi, Kota Bandung', '2025-09-13 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/68a2deebead35-resilientshowevenbanner_.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Burgerkill "Resilient Show"'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Burgerkill "Resilient Show"' AND ev.venue = 'Graha Manggala Siliwangi, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 67
FROM events ev WHERE ev.title = 'Burgerkill "Resilient Show"' AND ev.venue = 'Graha Manggala Siliwangi, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DAWN GONG MUSIC CAMPOUT
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DAWN GONG MUSIC CAMPOUT', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-10@wavy.seed' AND a.name = 'DAWN GONG MUSIC CAMPOUT');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DAWN GONG MUSIC CAMPOUT', 'Music', 'Asram Edupark Glamping, Kab. Sleman', '2025-09-13 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/688340d9ce70d-dawngongcampot.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DAWN GONG MUSIC CAMPOUT'
WHERE o.email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DAWN GONG MUSIC CAMPOUT' AND ev.venue = 'Asram Edupark Glamping, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 1500000, 500, 250
FROM events ev WHERE ev.title = 'DAWN GONG MUSIC CAMPOUT' AND ev.venue = 'Asram Edupark Glamping, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hiphoria Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hiphoria Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-11@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-11@wavy.seed' AND a.name = 'Hiphoria Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hiphoria Fest', 'Music', 'LAP YONIF 321 GT Majalengka, Kab. Majalengka', '2025-09-14 13:00:53'::timestamptz, 'https://assets.artatix.co.id/event/686f85d8e7e32-Hiphoria.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hiphoria Fest'
WHERE o.email = 'demo.scrape-11@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hiphoria Fest' AND ev.venue = 'LAP YONIF 321 GT Majalengka, Kab. Majalengka');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 199000, 500, 203
FROM events ev WHERE ev.title = 'Hiphoria Fest' AND ev.venue = 'LAP YONIF 321 GT Majalengka, Kab. Majalengka'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Manunggaling Projo
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Manunggaling Projo', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-12@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-12@wavy.seed' AND a.name = 'Manunggaling Projo');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Manunggaling Projo', 'Music', 'Kalurahan Sidokarto, Kab. Sleman', '2025-09-17 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/68aaec7011581-FEEDWEB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Manunggaling Projo'
WHERE o.email = 'demo.scrape-12@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Manunggaling Projo' AND ev.venue = 'Kalurahan Sidokarto, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 276
FROM events ev WHERE ev.title = 'Manunggaling Projo' AND ev.venue = 'Kalurahan Sidokarto, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Join The Showcase Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Join The Showcase Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-13@wavy.seed' AND a.name = 'Join The Showcase Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Join The Showcase Vol.1', 'Music', 'Hafa Warehouse, Kota Bandung', '2025-09-19 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/EDP9FOSALX.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Join The Showcase Vol.1'
WHERE o.email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Join The Showcase Vol.1' AND ev.venue = 'Hafa Warehouse, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 59
FROM events ev WHERE ev.title = 'Join The Showcase Vol.1' AND ev.venue = 'Hafa Warehouse, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- We're All Gonna Gigs Volume 6
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'We''re All Gonna Gigs Volume 6', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-14@wavy.seed' AND a.name = 'We''re All Gonna Gigs Volume 6');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'We''re All Gonna Gigs Volume 6', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2025-09-20 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WH5U188ZIY.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'We''re All Gonna Gigs Volume 6'
WHERE o.email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 6' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 172
FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 6' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- VEHARSALOKA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'VEHARSALOKA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-15@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-15@wavy.seed' AND a.name = 'VEHARSALOKA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'VEHARSALOKA', 'Music', 'SMA Negeri 113 Jakarta Timur, Kota Adm. Jakarta Timur', '2025-09-20 08:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_684adcefacb7c.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'VEHARSALOKA'
WHERE o.email = 'demo.scrape-15@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'VEHARSALOKA' AND ev.venue = 'SMA Negeri 113 Jakarta Timur, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 235
FROM events ev WHERE ev.title = 'VEHARSALOKA' AND ev.venue = 'SMA Negeri 113 Jakarta Timur, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Amplified the Sun Vol.7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Amplified the Sun Vol.7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-16@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-16@wavy.seed' AND a.name = 'Amplified the Sun Vol.7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Amplified the Sun Vol.7', 'Music', 'Jrny Coffee n Records, Kab. Sleman', '2025-09-21 19:07:01'::timestamptz, 'https://assets.artatix.co.id/event/BRBJYE99PR.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Amplified the Sun Vol.7'
WHERE o.email = 'demo.scrape-16@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Amplified the Sun Vol.7' AND ev.venue = 'Jrny Coffee n Records, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 188
FROM events ev WHERE ev.title = 'Amplified the Sun Vol.7' AND ev.venue = 'Jrny Coffee n Records, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SENDAGIA FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SENDAGIA FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-17@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-17@wavy.seed' AND a.name = 'SENDAGIA FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SENDAGIA FEST', 'Music', 'Rth klero tengaran, Kab. Semarang', '2025-09-21 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/3SLV89MMHJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SENDAGIA FEST'
WHERE o.email = 'demo.scrape-17@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SENDAGIA FEST' AND ev.venue = 'Rth klero tengaran, Kab. Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 11
FROM events ev WHERE ev.title = 'SENDAGIA FEST' AND ev.venue = 'Rth klero tengaran, Kab. Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Festival Medan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Festival Medan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-18@wavy.seed' AND a.name = 'Mendadak Festival Medan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Festival Medan', 'Music', 'PRSU MEDAN, Kota Medan', '2025-09-26 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/I1LR4RK9WM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Festival Medan'
WHERE o.email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Festival Medan' AND ev.venue = 'PRSU MEDAN, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 145000, 500, 234
FROM events ev WHERE ev.title = 'Mendadak Festival Medan' AND ev.venue = 'PRSU MEDAN, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BEKASI REGGAE ROOTS AND CULTURE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BEKASI REGGAE ROOTS AND CULTURE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-19@wavy.seed' AND a.name = 'BEKASI REGGAE ROOTS AND CULTURE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BEKASI REGGAE ROOTS AND CULTURE', 'Music', 'Modo Coffee Garden, Jatiwarna, Bekasi, Kota Bekasi', '2025-09-26 15:30:00'::timestamptz, 'https://assets.artatix.co.id/event/68ab4d3bb1f53-26SEPTEMBER2025_20250825_003411_0000.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BEKASI REGGAE ROOTS AND CULTURE'
WHERE o.email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BEKASI REGGAE ROOTS AND CULTURE' AND ev.venue = 'Modo Coffee Garden, Jatiwarna, Bekasi, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 157
FROM events ev WHERE ev.title = 'BEKASI REGGAE ROOTS AND CULTURE' AND ev.venue = 'Modo Coffee Garden, Jatiwarna, Bekasi, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Common Roots By Pranugum Live
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Common Roots By Pranugum Live', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-20@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-20@wavy.seed' AND a.name = 'Common Roots By Pranugum Live');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Common Roots By Pranugum Live', 'Music', 'Lobby Drop Off Mangga Dua Square Jakarta Utara, Kota Adm. Jakarta Utara', '2025-09-26 14:00:16'::timestamptz, 'https://assets.artatix.co.id/event/6NFZ93GMKE.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Common Roots By Pranugum Live'
WHERE o.email = 'demo.scrape-20@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Common Roots By Pranugum Live' AND ev.venue = 'Lobby Drop Off Mangga Dua Square Jakarta Utara, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 210
FROM events ev WHERE ev.title = 'Common Roots By Pranugum Live' AND ev.venue = 'Lobby Drop Off Mangga Dua Square Jakarta Utara, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Upcoming Fest X Xound of Xoda 3th anniversary
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Upcoming Fest X Xound of Xoda 3th anniversary', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-21@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-21@wavy.seed' AND a.name = 'Upcoming Fest X Xound of Xoda 3th anniversary');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Upcoming Fest X Xound of Xoda 3th anniversary', 'Music', 'Tip Tap Toe, Yogyakarta, Kab. Sleman', '2025-09-27 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/68b072c757aea-xounofdxoda.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Upcoming Fest X Xound of Xoda 3th anniversary'
WHERE o.email = 'demo.scrape-21@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Upcoming Fest X Xound of Xoda 3th anniversary' AND ev.venue = 'Tip Tap Toe, Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 253
FROM events ev WHERE ev.title = 'Upcoming Fest X Xound of Xoda 3th anniversary' AND ev.venue = 'Tip Tap Toe, Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-22@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-22@wavy.seed' AND a.name = 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma', 'Music', 'Bandung, Kab. Bandung', '2025-09-27 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/981GXK6DBK.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma'
WHERE o.email = 'demo.scrape-22@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma' AND ev.venue = 'Bandung, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 196
FROM events ev WHERE ev.title = 'Dan Harusnya Ini Bukan Akhir Sebuah Showcase Oleh Car Crash Coma' AND ev.venue = 'Bandung, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- POPpohonan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'POPpohonan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-23@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-23@wavy.seed' AND a.name = 'POPpohonan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'POPpohonan', 'Music', 'Taman Kopi Guntang, Kab. Bandung', '2025-09-27 13:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_68a748cccbaa6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'POPpohonan'
WHERE o.email = 'demo.scrape-23@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'POPpohonan' AND ev.venue = 'Taman Kopi Guntang, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 160000, 500, 219
FROM events ev WHERE ev.title = 'POPpohonan' AND ev.venue = 'Taman Kopi Guntang, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- EXTIVA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'EXTIVA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-24@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-24@wavy.seed' AND a.name = 'EXTIVA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'EXTIVA', 'Music', 'SMA Pangudi Luhur 2 Servasius, Kota Bekasi', '2025-09-27 12:30:00'::timestamptz, 'https://assets.artatix.co.id/event/E426QKT92K.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EXTIVA'
WHERE o.email = 'demo.scrape-24@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EXTIVA' AND ev.venue = 'SMA Pangudi Luhur 2 Servasius, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 142
FROM events ev WHERE ev.title = 'EXTIVA' AND ev.venue = 'SMA Pangudi Luhur 2 Servasius, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FRANAYATRA 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FRANAYATRA 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-25@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-25@wavy.seed' AND a.name = 'FRANAYATRA 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FRANAYATRA 2025', 'Music', 'SMAN 2 JAKARTA, Kota Adm. Jakarta Barat', '2025-09-28 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VFSB2H8CU9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FRANAYATRA 2025'
WHERE o.email = 'demo.scrape-25@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FRANAYATRA 2025' AND ev.venue = 'SMAN 2 JAKARTA, Kota Adm. Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 65
FROM events ev WHERE ev.title = 'FRANAYATRA 2025' AND ev.venue = 'SMAN 2 JAKARTA, Kota Adm. Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NO FEAR OF PAIN VOL 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NO FEAR OF PAIN VOL 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'NO FEAR OF PAIN VOL 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO FEAR OF PAIN VOL 3', 'Music', 'SAGAVIGOR, Kota Bandung', '2025-10-03 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/C8OFCNM5AT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO FEAR OF PAIN VOL 3'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 3' AND ev.venue = 'SAGAVIGOR, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 3' AND ev.venue = 'SAGAVIGOR, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-27@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-27@wavy.seed' AND a.name = 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary', 'Music', 'Solo, Kota Surakarta', '2025-10-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZIH9NCPTZ4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary'
WHERE o.email = 'demo.scrape-27@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary' AND ev.venue = 'Solo, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 31
FROM events ev WHERE ev.title = 'City of Laboratory X Buzztard  Present  The Urban Clash  Buzztards Loud Years Anniversary' AND ev.venue = 'Solo, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BEMAFEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BEMAFEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-28@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-28@wavy.seed' AND a.name = 'BEMAFEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BEMAFEST', 'Music', 'Panorama25 Bojong Kab Pekalongan, Kab. Pekalongan', '2025-10-05 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/YTCEXGR3IJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BEMAFEST'
WHERE o.email = 'demo.scrape-28@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BEMAFEST' AND ev.venue = 'Panorama25 Bojong Kab Pekalongan, Kab. Pekalongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 224
FROM events ev WHERE ev.title = 'BEMAFEST' AND ev.venue = 'Panorama25 Bojong Kab Pekalongan, Kab. Pekalongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pentas Narasi Vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pentas Narasi Vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-8@wavy.seed' AND a.name = 'Pentas Narasi Vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pentas Narasi Vol 2', 'Music', 'Sport Center Kota Bengkulu, Kota Bengkulu', '2025-10-10 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U6E23ZDVPC.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pentas Narasi Vol 2'
WHERE o.email = 'demo.scrape-8@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pentas Narasi Vol 2' AND ev.venue = 'Sport Center Kota Bengkulu, Kota Bengkulu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 84
FROM events ev WHERE ev.title = 'Pentas Narasi Vol 2' AND ev.venue = 'Sport Center Kota Bengkulu, Kota Bengkulu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TIMUR BERSEMI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TIMUR BERSEMI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-29@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-29@wavy.seed' AND a.name = 'TIMUR BERSEMI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TIMUR BERSEMI', 'Music', 'Pavilion JBC, Kab. Muaro Jambi', '2025-10-11 16:00:00'::timestamptz, 'https://assets.artatix.co.id/event/KZAIRLCTRV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TIMUR BERSEMI'
WHERE o.email = 'demo.scrape-29@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TIMUR BERSEMI' AND ev.venue = 'Pavilion JBC, Kab. Muaro Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 187
FROM events ev WHERE ev.title = 'TIMUR BERSEMI' AND ev.venue = 'Pavilion JBC, Kab. Muaro Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spirit Behind The Goal #5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spirit Behind The Goal #5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-30@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-30@wavy.seed' AND a.name = 'Spirit Behind The Goal #5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spirit Behind The Goal #5', 'Music', 'Ex. Teras Hanggar Pancoran, Kota Adm. Jakarta Selatan', '2025-10-11 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TMUFAM24P6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spirit Behind The Goal #5'
WHERE o.email = 'demo.scrape-30@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spirit Behind The Goal #5' AND ev.venue = 'Ex. Teras Hanggar Pancoran, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 110
FROM events ev WHERE ev.title = 'Spirit Behind The Goal #5' AND ev.venue = 'Ex. Teras Hanggar Pancoran, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mini Solitaire Yogyakarta  - Pamungkas
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mini Solitaire Yogyakarta  - Pamungkas', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-31@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-31@wavy.seed' AND a.name = 'Mini Solitaire Yogyakarta  - Pamungkas');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mini Solitaire Yogyakarta  - Pamungkas', 'Music', 'JNM Bloc, Kota Yogyakarta', '2025-10-12 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/PKDHQBGZJO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mini Solitaire Yogyakarta  - Pamungkas'
WHERE o.email = 'demo.scrape-31@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mini Solitaire Yogyakarta  - Pamungkas' AND ev.venue = 'JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 223
FROM events ev WHERE ev.title = 'Mini Solitaire Yogyakarta  - Pamungkas' AND ev.venue = 'JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GETTHOCORE DPMB x SERIGALA MALAM
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GETTHOCORE DPMB x SERIGALA MALAM', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-32@wavy.seed' AND a.name = 'GETTHOCORE DPMB x SERIGALA MALAM');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GETTHOCORE DPMB x SERIGALA MALAM', 'Music', 'CHUG BAR, Kota Surabaya', '2025-10-12 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CIKASD5I65.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GETTHOCORE DPMB x SERIGALA MALAM'
WHERE o.email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GETTHOCORE DPMB x SERIGALA MALAM' AND ev.venue = 'CHUG BAR, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 96
FROM events ev WHERE ev.title = 'GETTHOCORE DPMB x SERIGALA MALAM' AND ev.venue = 'CHUG BAR, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- We're All Gonna Gigs Volume 7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'We''re All Gonna Gigs Volume 7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-14@wavy.seed' AND a.name = 'We''re All Gonna Gigs Volume 7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'We''re All Gonna Gigs Volume 7', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2025-10-15 19:30:01'::timestamptz, 'https://assets.artatix.co.id/event/79WRM95Q87.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'We''re All Gonna Gigs Volume 7'
WHERE o.email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 7' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 172
FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 7' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Festival Padang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Festival Padang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-18@wavy.seed' AND a.name = 'Mendadak Festival Padang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Festival Padang', 'Music', 'GOR HJ Agus Salim, Kota Padang', '2025-10-17 17:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_689da1dda41c9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Festival Padang'
WHERE o.email = 'demo.scrape-18@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Festival Padang' AND ev.venue = 'GOR HJ Agus Salim, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 174
FROM events ev WHERE ev.title = 'Mendadak Festival Padang' AND ev.venue = 'GOR HJ Agus Salim, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night', 'Music', 'The Ambaru Coffee & Eatery, Kota Semarang', '2025-10-18 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RPBHBAPFBM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night' AND ev.venue = 'The Ambaru Coffee & Eatery, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 259
FROM events ev WHERE ev.title = 'Warkopolim at The Ambaru Coffee & Eatery + Karaoke Night' AND ev.venue = 'The Ambaru Coffee & Eatery, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Charitas Project 3.0, CHRONOS ORIO
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Charitas Project 3.0, CHRONOS ORIO', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-34@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-34@wavy.seed' AND a.name = 'Charitas Project 3.0, CHRONOS ORIO');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Charitas Project 3.0, CHRONOS ORIO', 'Music', 'SMA Charitas Jakarta, Kota Adm. Jakarta Selatan', '2025-10-18 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/80LOQGSD1O.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Charitas Project 3.0, CHRONOS ORIO'
WHERE o.email = 'demo.scrape-34@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Charitas Project 3.0, CHRONOS ORIO' AND ev.venue = 'SMA Charitas Jakarta, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 122
FROM events ev WHERE ev.title = 'Charitas Project 3.0, CHRONOS ORIO' AND ev.venue = 'SMA Charitas Jakarta, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DARE TO FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DARE TO FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-35@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-35@wavy.seed' AND a.name = 'DARE TO FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DARE TO FEST', 'Music', 'PARKIR AREA DE TJOLOMADOE, Kota Surakarta', '2025-10-18 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/68ab15bf27362-BannerArtatix_DTF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DARE TO FEST'
WHERE o.email = 'demo.scrape-35@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DARE TO FEST' AND ev.venue = 'PARKIR AREA DE TJOLOMADOE, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 265
FROM events ev WHERE ev.title = 'DARE TO FEST' AND ev.venue = 'PARKIR AREA DE TJOLOMADOE, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HIGH VOLT - LUMAJANG METAL FEST 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HIGH VOLT - LUMAJANG METAL FEST 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-36@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-36@wavy.seed' AND a.name = 'HIGH VOLT - LUMAJANG METAL FEST 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HIGH VOLT - LUMAJANG METAL FEST 2025', 'Music', 'GOR WIRA BHAKTI  LUMAJANG, Kab. Lumajang', '2025-10-18 12:00:00'::timestamptz, 'https://assets.artatix.co.id/event/KF4RK5ZN1P.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIGH VOLT - LUMAJANG METAL FEST 2025'
WHERE o.email = 'demo.scrape-36@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIGH VOLT - LUMAJANG METAL FEST 2025' AND ev.venue = 'GOR WIRA BHAKTI  LUMAJANG, Kab. Lumajang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 278
FROM events ev WHERE ev.title = 'HIGH VOLT - LUMAJANG METAL FEST 2025' AND ev.venue = 'GOR WIRA BHAKTI  LUMAJANG, Kab. Lumajang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Chierra Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Chierra Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-37@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-37@wavy.seed' AND a.name = 'Chierra Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Chierra Fest', 'Music', 'Malang, Kab. Malang', '2025-10-19 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/VJJH6TEFC6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Chierra Fest'
WHERE o.email = 'demo.scrape-37@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Chierra Fest' AND ev.venue = 'Malang, Kab. Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 98000, 500, 171
FROM events ev WHERE ev.title = 'Chierra Fest' AND ev.venue = 'Malang, Kab. Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 51 FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '51 FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-38@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-38@wavy.seed' AND a.name = '51 FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '51 FEST', 'Music', 'MSC BHUMI MARINIR KARANG PILANG, Kota Surabaya', '2025-10-19 12:00:00'::timestamptz, 'https://assets.artatix.co.id/event/689dde1166931-IMG20250814WA0004.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '51 FEST'
WHERE o.email = 'demo.scrape-38@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '51 FEST' AND ev.venue = 'MSC BHUMI MARINIR KARANG PILANG, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 274
FROM events ev WHERE ev.title = '51 FEST' AND ev.venue = 'MSC BHUMI MARINIR KARANG PILANG, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-39@wavy.seed' AND a.name = 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI', 'Music', 'Kalipepe Land, Kab. Boyolali', '2025-10-24 16:30:01'::timestamptz, 'https://assets.artatix.co.id/event/8P6F1JRH0C.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI'
WHERE o.email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI' AND ev.venue = 'Kalipepe Land, Kab. Boyolali');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 177
FROM events ev WHERE ev.title = 'SERANA & SAMUDRA CLOSING TOUR  - BOYOLALI' AND ev.venue = 'Kalipepe Land, Kab. Boyolali'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Soundscapes
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Soundscapes', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-40@wavy.seed' AND a.name = 'Soundscapes');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Soundscapes', 'Music', 'Fourbidden Gudang Selatan  Bandung, Kota Bandung', '2025-10-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/703T7RPSJM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Soundscapes'
WHERE o.email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Soundscapes' AND ev.venue = 'Fourbidden Gudang Selatan  Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 67000, 500, 240
FROM events ev WHERE ev.title = 'Soundscapes' AND ev.venue = 'Fourbidden Gudang Selatan  Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NEVER SURENDER
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NEVER SURENDER', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-41@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-41@wavy.seed' AND a.name = 'NEVER SURENDER');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NEVER SURENDER', 'Music', 'Gedung Yaumi Slawi, Kab Tegal, Kab. Tegal', '2025-10-25 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZCCC7LEGHP.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NEVER SURENDER'
WHERE o.email = 'demo.scrape-41@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NEVER SURENDER' AND ev.venue = 'Gedung Yaumi Slawi, Kab Tegal, Kab. Tegal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 213
FROM events ev WHERE ev.title = 'NEVER SURENDER' AND ev.venue = 'Gedung Yaumi Slawi, Kab Tegal, Kab. Tegal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DPMBXSM GHETTOCORE HOME COMING TOUR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DPMBXSM GHETTOCORE HOME COMING TOUR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-42@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-42@wavy.seed' AND a.name = 'DPMBXSM GHETTOCORE HOME COMING TOUR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DPMBXSM GHETTOCORE HOME COMING TOUR', 'Music', 'TRANSMART MAGUWOHARJO YOGYAKARTA, Kab. Sleman', '2025-10-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7NUGHZ9YG6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DPMBXSM GHETTOCORE HOME COMING TOUR'
WHERE o.email = 'demo.scrape-42@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DPMBXSM GHETTOCORE HOME COMING TOUR' AND ev.venue = 'TRANSMART MAGUWOHARJO YOGYAKARTA, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 88000, 500, 96
FROM events ev WHERE ev.title = 'DPMBXSM GHETTOCORE HOME COMING TOUR' AND ev.venue = 'TRANSMART MAGUWOHARJO YOGYAKARTA, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Lara Fest 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Lara Fest 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-43@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-43@wavy.seed' AND a.name = 'Lara Fest 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Lara Fest 2025', 'Music', 'Open Stage Taman Budaya Aceh, Kota Banda Aceh', '2025-10-26 20:20:01'::timestamptz, 'https://assets.artatix.co.id/event/69X71UM06H.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Lara Fest 2025'
WHERE o.email = 'demo.scrape-43@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Lara Fest 2025' AND ev.venue = 'Open Stage Taman Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 189436, 500, 45
FROM events ev WHERE ev.title = 'Lara Fest 2025' AND ev.venue = 'Open Stage Taman Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Off The "BTVC 16 Bars" Cuff
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Off The "BTVC 16 Bars" Cuff', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'Off The "BTVC 16 Bars" Cuff');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Off The "BTVC 16 Bars" Cuff', 'Music', 'Krapela, Jakarta, Kota Adm. Jakarta Selatan', '2025-10-26 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/A99GP258PH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Off The "BTVC 16 Bars" Cuff'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Off The "BTVC 16 Bars" Cuff' AND ev.venue = 'Krapela, Jakarta, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 89
FROM events ev WHERE ev.title = 'Off The "BTVC 16 Bars" Cuff' AND ev.venue = 'Krapela, Jakarta, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Panggung Raya 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Panggung Raya 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-3@wavy.seed' AND a.name = 'Panggung Raya 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Panggung Raya 2025', 'Music', 'GOR SATRIA PURWOKERTO JAWA TENGAH, Kab. Banyumas', '2025-10-29 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_6899bda46467e.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Panggung Raya 2025'
WHERE o.email = 'demo.scrape-3@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Panggung Raya 2025' AND ev.venue = 'GOR SATRIA PURWOKERTO JAWA TENGAH, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 109
FROM events ev WHERE ev.title = 'Panggung Raya 2025' AND ev.venue = 'GOR SATRIA PURWOKERTO JAWA TENGAH, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Home Theatre 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Home Theatre 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-44@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-44@wavy.seed' AND a.name = 'Home Theatre 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Home Theatre 2025', 'Music', 'FAKULTAS ILMU KOMUNIKASI UNIVERSITAS PADJADJARAN, Kab. Sumedang', '2025-10-30 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/56OMFWN2WD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Home Theatre 2025'
WHERE o.email = 'demo.scrape-44@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Home Theatre 2025' AND ev.venue = 'FAKULTAS ILMU KOMUNIKASI UNIVERSITAS PADJADJARAN, Kab. Sumedang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 262
FROM events ev WHERE ev.title = 'Home Theatre 2025' AND ev.venue = 'FAKULTAS ILMU KOMUNIKASI UNIVERSITAS PADJADJARAN, Kab. Sumedang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Carnaval of Screams "Chariot"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Carnaval of Screams "Chariot"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'Carnaval of Screams "Chariot"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Carnaval of Screams "Chariot"', 'Music', 'Tip Tap Toe, Kab. Sleman', '2025-10-31 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0OQ6QTOS5X.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Carnaval of Screams "Chariot"'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Carnaval of Screams "Chariot"' AND ev.venue = 'Tip Tap Toe, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 135
FROM events ev WHERE ev.title = 'Carnaval of Screams "Chariot"' AND ev.venue = 'Tip Tap Toe, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Chariot Reservation Day 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Chariot Reservation Day 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'Chariot Reservation Day 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Chariot Reservation Day 1', 'Music', 'Tip Tap Toe, Kab. Sleman', '2025-10-31 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NRERYJFRRF.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Chariot Reservation Day 1'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Chariot Reservation Day 1' AND ev.venue = 'Tip Tap Toe, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 450000, 500, 275
FROM events ev WHERE ev.title = 'Chariot Reservation Day 1' AND ev.venue = 'Tip Tap Toe, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JOIN THE SHOWCASE VOL.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JOIN THE SHOWCASE VOL.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-13@wavy.seed' AND a.name = 'JOIN THE SHOWCASE VOL.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JOIN THE SHOWCASE VOL.2', 'Music', 'Hafa Warehouse, Kota Bandung', '2025-10-31 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CV8CBOLOB7.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JOIN THE SHOWCASE VOL.2'
WHERE o.email = 'demo.scrape-13@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JOIN THE SHOWCASE VOL.2' AND ev.venue = 'Hafa Warehouse, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 59
FROM events ev WHERE ev.title = 'JOIN THE SHOWCASE VOL.2' AND ev.venue = 'Hafa Warehouse, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Chariot Reservation Day 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Chariot Reservation Day 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'Chariot Reservation Day 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Chariot Reservation Day 2', 'Music', 'Tip Tap Toe, Kab. Sleman', '2025-11-01 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SDWS98LY0I.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Chariot Reservation Day 2'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Chariot Reservation Day 2' AND ev.venue = 'Tip Tap Toe, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 450000, 500, 275
FROM events ev WHERE ev.title = 'Chariot Reservation Day 2' AND ev.venue = 'Tip Tap Toe, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PERDITUS - Newcomers Concert PSM Cantus Firmus 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-45@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-45@wavy.seed' AND a.name = 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025', 'Music', 'DRIYARKARA Auditorium of Sanata Dharma University, Kota Yogyakarta', '2025-11-01 17:00:11'::timestamptz, 'https://assets.artatix.co.id/event/UI12NK3IB8.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025'
WHERE o.email = 'demo.scrape-45@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025' AND ev.venue = 'DRIYARKARA Auditorium of Sanata Dharma University, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 135
FROM events ev WHERE ev.title = 'PERDITUS - Newcomers Concert PSM Cantus Firmus 2025' AND ev.venue = 'DRIYARKARA Auditorium of Sanata Dharma University, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JAZTIFY  - VOL.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JAZTIFY  - VOL.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'JAZTIFY  - VOL.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JAZTIFY  - VOL.1', 'Music', 'Area Rooftop Pasar Baru, Kota Bandung', '2025-11-01 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/VN6B54ND3A.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JAZTIFY  - VOL.1'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.1' AND ev.venue = 'Area Rooftop Pasar Baru, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 42500, 500, 178
FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.1' AND ev.venue = 'Area Rooftop Pasar Baru, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Biggestshow Rumble Effect II
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Biggestshow Rumble Effect II', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-47@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-47@wavy.seed' AND a.name = 'Biggestshow Rumble Effect II');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Biggestshow Rumble Effect II', 'Music', 'Alun-alun Sukanagara Kabupaten Cianjur, Kab. Cianjur', '2025-11-01 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IAUGHDKS8K.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Biggestshow Rumble Effect II'
WHERE o.email = 'demo.scrape-47@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Biggestshow Rumble Effect II' AND ev.venue = 'Alun-alun Sukanagara Kabupaten Cianjur, Kab. Cianjur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 231
FROM events ev WHERE ev.title = 'Biggestshow Rumble Effect II' AND ev.venue = 'Alun-alun Sukanagara Kabupaten Cianjur, Kab. Cianjur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festival Budaya Nusantara 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festival Budaya Nusantara 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-48@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-48@wavy.seed' AND a.name = 'Festival Budaya Nusantara 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festival Budaya Nusantara 2025', 'Music', 'Student Center UAJY, Gd. Slamet Rijadi, Kampus II, Universitas Atma Jaya Yogyakarta, Kab. Sleman', '2025-11-02 16:00:17'::timestamptz, 'https://assets.artatix.co.id/event/F4WYNK9DRX.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festival Budaya Nusantara 2025'
WHERE o.email = 'demo.scrape-48@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festival Budaya Nusantara 2025' AND ev.venue = 'Student Center UAJY, Gd. Slamet Rijadi, Kampus II, Universitas Atma Jaya Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 24
FROM events ev WHERE ev.title = 'Festival Budaya Nusantara 2025' AND ev.venue = 'Student Center UAJY, Gd. Slamet Rijadi, Kampus II, Universitas Atma Jaya Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ARTEFAC
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ARTEFAC', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-49@wavy.seed' AND a.name = 'ARTEFAC');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ARTEFAC', 'Music', 'Pamedan Mangkunegaran, Kota Surakarta', '2025-11-02 14:00:00'::timestamptz, 'https://assets.artatix.co.id/event/EIZR6YY5X0.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ARTEFAC'
WHERE o.email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ARTEFAC' AND ev.venue = 'Pamedan Mangkunegaran, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 137
FROM events ev WHERE ev.title = 'ARTEFAC' AND ev.venue = 'Pamedan Mangkunegaran, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DOOMSDAY OPEN AIR 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DOOMSDAY OPEN AIR 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'DOOMSDAY OPEN AIR 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DOOMSDAY OPEN AIR 2025', 'Music', 'PUSDIKKU, Kota Bandung', '2025-11-02 10:00:00'::timestamptz, 'https://assets.artatix.co.id/event/6872810b6464a-headerartatixcopy2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DOOMSDAY OPEN AIR 2025'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DOOMSDAY OPEN AIR 2025' AND ev.venue = 'PUSDIKKU, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 152
FROM events ev WHERE ev.title = 'DOOMSDAY OPEN AIR 2025' AND ev.venue = 'PUSDIKKU, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRIT OF SOUL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRIT OF SOUL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-50@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-50@wavy.seed' AND a.name = 'SPIRIT OF SOUL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRIT OF SOUL', 'Music', 'Panggung Kreasi UBHARA Surabaya, Kota Surabaya', '2025-11-08 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BPVDJJJOUZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRIT OF SOUL'
WHERE o.email = 'demo.scrape-50@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRIT OF SOUL' AND ev.venue = 'Panggung Kreasi UBHARA Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 40
FROM events ev WHERE ev.title = 'SPIRIT OF SOUL' AND ev.venue = 'Panggung Kreasi UBHARA Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BESTIEVAL PURWOKERTO 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BESTIEVAL PURWOKERTO 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'BESTIEVAL PURWOKERTO 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BESTIEVAL PURWOKERTO 2025', 'Music', 'Purwokerto, Kab. Banyumas', '2025-11-08 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/EY2D92WUV3.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BESTIEVAL PURWOKERTO 2025'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BESTIEVAL PURWOKERTO 2025' AND ev.venue = 'Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 263
FROM events ev WHERE ev.title = 'BESTIEVAL PURWOKERTO 2025' AND ev.venue = 'Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Showvibes.project
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Showvibes.project', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-52@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-52@wavy.seed' AND a.name = 'Showvibes.project');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Showvibes.project', 'Music', 'Jogja National Museum, Yogyakarta, Kota Yogyakarta', '2025-11-08 13:00:00'::timestamptz, 'https://assets.artatix.co.id/event/EHEV3XL86R.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Showvibes.project'
WHERE o.email = 'demo.scrape-52@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Showvibes.project' AND ev.venue = 'Jogja National Museum, Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 216
FROM events ev WHERE ev.title = 'Showvibes.project' AND ev.venue = 'Jogja National Museum, Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JAZTIFY  - VOL.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JAZTIFY  - VOL.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'JAZTIFY  - VOL.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JAZTIFY  - VOL.2', 'Music', '150 Coffee And Garden, Kota Bandung', '2025-11-09 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/RSCSI7PX5M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JAZTIFY  - VOL.2'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.2' AND ev.venue = '150 Coffee And Garden, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 42500, 500, 178
FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.2' AND ev.venue = '150 Coffee And Garden, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kolaborasi Harmoni dan Nada
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kolaborasi Harmoni dan Nada', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-53@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-53@wavy.seed' AND a.name = 'Kolaborasi Harmoni dan Nada');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kolaborasi Harmoni dan Nada', 'Music', 'Gor Serbaguna Pancing Sumatera Utara, Kota Medan', '2025-11-09 14:00:00'::timestamptz, 'https://assets.artatix.co.id/event/6899e6b60d80d-bnnrcult.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kolaborasi Harmoni dan Nada'
WHERE o.email = 'demo.scrape-53@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kolaborasi Harmoni dan Nada' AND ev.venue = 'Gor Serbaguna Pancing Sumatera Utara, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 129
FROM events ev WHERE ev.title = 'Kolaborasi Harmoni dan Nada' AND ev.venue = 'Gor Serbaguna Pancing Sumatera Utara, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tiarasary 15 - Fashion Show
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tiarasary 15 - Fashion Show', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-54@wavy.seed' AND a.name = 'Tiarasary 15 - Fashion Show');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tiarasary 15 - Fashion Show', 'Music', 'GOR Abirawa Batang, Kab. Batang', '2025-11-09 08:00:00'::timestamptz, 'https://assets.artatix.co.id/event/68b27b6d2c074-2.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tiarasary 15 - Fashion Show'
WHERE o.email = 'demo.scrape-54@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tiarasary 15 - Fashion Show' AND ev.venue = 'GOR Abirawa Batang, Kab. Batang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 115000, 500, 282
FROM events ev WHERE ev.title = 'Tiarasary 15 - Fashion Show' AND ev.venue = 'GOR Abirawa Batang, Kab. Batang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- We're All Gonna Gigs Volume 8
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'We''re All Gonna Gigs Volume 8', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-14@wavy.seed' AND a.name = 'We''re All Gonna Gigs Volume 8');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'We''re All Gonna Gigs Volume 8', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2025-11-12 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/N28507IPFJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'We''re All Gonna Gigs Volume 8'
WHERE o.email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 8' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 172
FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 8' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JAZTIFY  - VOL.3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JAZTIFY  - VOL.3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'JAZTIFY  - VOL.3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JAZTIFY  - VOL.3', 'Music', 'WU BACKROOM BAR, Kota Bandung', '2025-11-14 21:00:01'::timestamptz, 'https://assets.artatix.co.id/event/PIQM8XG5X4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JAZTIFY  - VOL.3'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.3' AND ev.venue = 'WU BACKROOM BAR, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 138
FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.3' AND ev.venue = 'WU BACKROOM BAR, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hadir Fest Vol 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hadir Fest Vol 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-55@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-55@wavy.seed' AND a.name = 'Hadir Fest Vol 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hadir Fest Vol 1', 'Music', 'JNM Block, Kota Yogyakarta', '2025-11-14 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WGKGMJKRN2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hadir Fest Vol 1'
WHERE o.email = 'demo.scrape-55@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hadir Fest Vol 1' AND ev.venue = 'JNM Block, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 25
FROM events ev WHERE ev.title = 'Hadir Fest Vol 1' AND ev.venue = 'JNM Block, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festival Titik Temu
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festival Titik Temu', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-56@wavy.seed' AND a.name = 'Festival Titik Temu');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festival Titik Temu', 'Music', 'Gedung Jodjokodi Convention Center, Kota Palu', '2025-11-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NDTHNIPEFR.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festival Titik Temu'
WHERE o.email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festival Titik Temu' AND ev.venue = 'Gedung Jodjokodi Convention Center, Kota Palu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 128
FROM events ev WHERE ev.title = 'Festival Titik Temu' AND ev.venue = 'Gedung Jodjokodi Convention Center, Kota Palu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NARAGIGS 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NARAGIGS 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-57@wavy.seed' AND a.name = 'NARAGIGS 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NARAGIGS 2025', 'Music', 'GOR Rudi Resnawan Banjarbaru, Kota Banjarbaru', '2025-11-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UUEHUE5S90.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NARAGIGS 2025'
WHERE o.email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NARAGIGS 2025' AND ev.venue = 'GOR Rudi Resnawan Banjarbaru, Kota Banjarbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 271
FROM events ev WHERE ev.title = 'NARAGIGS 2025' AND ev.venue = 'GOR Rudi Resnawan Banjarbaru, Kota Banjarbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Lokananta 69
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Lokananta 69', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-58@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-58@wavy.seed' AND a.name = 'Lokananta 69');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Lokananta 69', 'Music', 'Taman Lingkar, Lokananta, Solo, Jawa Tengah, Kota Surakarta', '2025-11-15 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7J6D2JZTYM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Lokananta 69'
WHERE o.email = 'demo.scrape-58@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Lokananta 69' AND ev.venue = 'Taman Lingkar, Lokananta, Solo, Jawa Tengah, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 64
FROM events ev WHERE ev.title = 'Lokananta 69' AND ev.venue = 'Taman Lingkar, Lokananta, Solo, Jawa Tengah, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Aksara
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Aksara', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-59@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-59@wavy.seed' AND a.name = 'Aksara');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Aksara', 'Music', 'Hall Politeknik Negeri Media Kreatif, Kota Adm. Jakarta Selatan', '2025-11-15 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/K3OSI43H48.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Aksara'
WHERE o.email = 'demo.scrape-59@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Aksara' AND ev.venue = 'Hall Politeknik Negeri Media Kreatif, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 15000, 500, 107
FROM events ev WHERE ev.title = 'Aksara' AND ev.venue = 'Hall Politeknik Negeri Media Kreatif, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- AGLORIA 2.0
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'AGLORIA 2.0', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-60@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-60@wavy.seed' AND a.name = 'AGLORIA 2.0');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'AGLORIA 2.0', 'Music', 'SMA GLOBAL MANDIRI JAKARTA, Kota Adm. Jakarta Timur', '2025-11-15 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V5CEE6IY54.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'AGLORIA 2.0'
WHERE o.email = 'demo.scrape-60@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'AGLORIA 2.0' AND ev.venue = 'SMA GLOBAL MANDIRI JAKARTA, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 170
FROM events ev WHERE ev.title = 'AGLORIA 2.0' AND ev.venue = 'SMA GLOBAL MANDIRI JAKARTA, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BIROETOPIA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BIROETOPIA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-61@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-61@wavy.seed' AND a.name = 'BIROETOPIA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BIROETOPIA', 'Music', 'Lapangan Akademik FISIP UNTAN, Kota Pontianak', '2025-11-16 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/X57AT6V4XC.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BIROETOPIA'
WHERE o.email = 'demo.scrape-61@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BIROETOPIA' AND ev.venue = 'Lapangan Akademik FISIP UNTAN, Kota Pontianak');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 43
FROM events ev WHERE ev.title = 'BIROETOPIA' AND ev.venue = 'Lapangan Akademik FISIP UNTAN, Kota Pontianak'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- AFTER PARTY DOOMSDAY
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'AFTER PARTY DOOMSDAY', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'AFTER PARTY DOOMSDAY');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'AFTER PARTY DOOMSDAY', 'Music', 'DAHAN KOPI BANJARAN, Kab. Bandung', '2025-11-16 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IPHNLDVSIU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'AFTER PARTY DOOMSDAY'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'AFTER PARTY DOOMSDAY' AND ev.venue = 'DAHAN KOPI BANJARAN, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'AFTER PARTY DOOMSDAY' AND ev.venue = 'DAHAN KOPI BANJARAN, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JAZTIFY - VOL.4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JAZTIFY - VOL.4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'JAZTIFY - VOL.4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JAZTIFY - VOL.4', 'Music', 'KOPILUVIUM Kiara Artha Park Bandung, Kota Bandung', '2025-11-21 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/IFWATGPT27.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JAZTIFY - VOL.4'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JAZTIFY - VOL.4' AND ev.venue = 'KOPILUVIUM Kiara Artha Park Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 138
FROM events ev WHERE ev.title = 'JAZTIFY - VOL.4' AND ev.venue = 'KOPILUVIUM Kiara Artha Park Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TIMELESS LIVE - WAVE FROM THE EAST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TIMELESS LIVE - WAVE FROM THE EAST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-62@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-62@wavy.seed' AND a.name = 'TIMELESS LIVE - WAVE FROM THE EAST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TIMELESS LIVE - WAVE FROM THE EAST', 'Music', 'Lap. Pasir Putih, Kota Manado', '2025-11-21 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1NEQ2XDAY1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TIMELESS LIVE - WAVE FROM THE EAST'
WHERE o.email = 'demo.scrape-62@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TIMELESS LIVE - WAVE FROM THE EAST' AND ev.venue = 'Lap. Pasir Putih, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 136
FROM events ev WHERE ev.title = 'TIMELESS LIVE - WAVE FROM THE EAST' AND ev.venue = 'Lap. Pasir Putih, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-63@wavy.seed' AND a.name = 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"', 'Music', 'Indrapasta Grand Ballroom, Kab. Sleman', '2025-11-22 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZDHR71YD6O.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"'
WHERE o.email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"' AND ev.venue = 'Indrapasta Grand Ballroom, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 315000, 500, 9
FROM events ev WHERE ev.title = 'SAHID RAYA EXCLUSIVE CONCERT WITH UNGU "WAKTU YANG DINANTI"' AND ev.venue = 'Indrapasta Grand Ballroom, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PriyanBaktiBerbudaya#4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PriyanBaktiBerbudaya#4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-64@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-64@wavy.seed' AND a.name = 'PriyanBaktiBerbudaya#4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PriyanBaktiBerbudaya#4', 'Music', 'Lapangan Bola Voli Dusun Priyan, Kab. Bantul', '2025-11-22 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YVMEQGJF7F.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PriyanBaktiBerbudaya#4'
WHERE o.email = 'demo.scrape-64@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PriyanBaktiBerbudaya#4' AND ev.venue = 'Lapangan Bola Voli Dusun Priyan, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 22
FROM events ev WHERE ev.title = 'PriyanBaktiBerbudaya#4' AND ev.venue = 'Lapangan Bola Voli Dusun Priyan, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Airlangga Veterinary Award (AVA) 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Airlangga Veterinary Award (AVA) 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-65@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-65@wavy.seed' AND a.name = 'Airlangga Veterinary Award (AVA) 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Airlangga Veterinary Award (AVA) 2025', 'Music', 'ITS Robotics Center, Kota Surabaya', '2025-11-22 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/6M4AF39QMK.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Airlangga Veterinary Award (AVA) 2025'
WHERE o.email = 'demo.scrape-65@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Airlangga Veterinary Award (AVA) 2025' AND ev.venue = 'ITS Robotics Center, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 94000, 500, 15
FROM events ev WHERE ev.title = 'Airlangga Veterinary Award (AVA) 2025' AND ev.venue = 'ITS Robotics Center, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Artfishtival 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Artfishtival 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-66@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-66@wavy.seed' AND a.name = 'Artfishtival 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Artfishtival 2025', 'Music', 'Surabaya, Kota Surabaya', '2025-11-22 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/GB5LT1RU1O.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Artfishtival 2025'
WHERE o.email = 'demo.scrape-66@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Artfishtival 2025' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 158
FROM events ev WHERE ev.title = 'Artfishtival 2025' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rock In Solo Festival 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rock In Solo Festival 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-67@wavy.seed' AND a.name = 'Rock In Solo Festival 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rock In Solo Festival 2025', 'Music', 'Benteng Vastenburg, Kota Surakarta', '2025-11-22 11:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_6896f7c6e7526.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rock In Solo Festival 2025'
WHERE o.email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rock In Solo Festival 2025' AND ev.venue = 'Benteng Vastenburg, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 191
FROM events ev WHERE ev.title = 'Rock In Solo Festival 2025' AND ev.venue = 'Benteng Vastenburg, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Lepas Penat Land Vol. 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Lepas Penat Land Vol. 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-68@wavy.seed' AND a.name = 'Lepas Penat Land Vol. 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Lepas Penat Land Vol. 4', 'Music', 'Sumenep, Kab. Sumenep', '2025-11-23 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/MSQYNSF586.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Lepas Penat Land Vol. 4'
WHERE o.email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Lepas Penat Land Vol. 4' AND ev.venue = 'Sumenep, Kab. Sumenep');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 58000, 500, 14
FROM events ev WHERE ev.title = 'Lepas Penat Land Vol. 4' AND ev.venue = 'Sumenep, Kab. Sumenep'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Story in Purwakarta Vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Story in Purwakarta Vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-69@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-69@wavy.seed' AND a.name = 'Story in Purwakarta Vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Story in Purwakarta Vol 2', 'Music', 'Lapangan Yonarmed 9 Kostrad Kab Purwakarta, Kab. Purwakarta', '2025-11-23 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/EP6N3JLN94.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Story in Purwakarta Vol 2'
WHERE o.email = 'demo.scrape-69@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Story in Purwakarta Vol 2' AND ev.venue = 'Lapangan Yonarmed 9 Kostrad Kab Purwakarta, Kab. Purwakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 67
FROM events ev WHERE ev.title = 'Story in Purwakarta Vol 2' AND ev.venue = 'Lapangan Yonarmed 9 Kostrad Kab Purwakarta, Kab. Purwakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Paper Kites
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Paper Kites', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = 'The Paper Kites');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Paper Kites', 'Music', 'The Kasablanka Hall, Kota Adm. Jakarta Selatan, Dki Jakarta, Kota Adm. Jakarta Selatan', '2025-11-26 20:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JO2A4OW6DS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Paper Kites'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Paper Kites' AND ev.venue = 'The Kasablanka Hall, Kota Adm. Jakarta Selatan, Dki Jakarta, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 399000, 500, 0
FROM events ev WHERE ev.title = 'The Paper Kites' AND ev.venue = 'The Kasablanka Hall, Kota Adm. Jakarta Selatan, Dki Jakarta, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- YUK MARI HIPHOP - BALI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YUK MARI HIPHOP - BALI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'YUK MARI HIPHOP - BALI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YUK MARI HIPHOP - BALI', 'Music', 'Tipsy Lion Bali, Kab. Badung', '2025-11-26 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/E0UDGK7A8N.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'YUK MARI HIPHOP - BALI'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - BALI' AND ev.venue = 'Tipsy Lion Bali, Kab. Badung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 259
FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - BALI' AND ev.venue = 'Tipsy Lion Bali, Kab. Badung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BLUE Live Jakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BLUE Live Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = 'BLUE Live Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BLUE Live Jakarta', 'Music', 'The Kasablanka Hall, Kota Adm. Jakarta Selatan', '2025-11-27 19:00:00'::timestamptz, 'https://assets.artatix.co.id/event/98A9WP4GJH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BLUE Live Jakarta'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BLUE Live Jakarta' AND ev.venue = 'The Kasablanka Hall, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 850000, 500, 50
FROM events ev WHERE ev.title = 'BLUE Live Jakarta' AND ev.venue = 'The Kasablanka Hall, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 24 "Perayaan Warsa Kedua"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 24 "Perayaan Warsa Kedua"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 24 "Perayaan Warsa Kedua"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 24 "Perayaan Warsa Kedua"', 'Music', 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta', '2025-11-27 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/MYILBVDJ26.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 24 "Perayaan Warsa Kedua"'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 24 "Perayaan Warsa Kedua"' AND ev.venue = 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 103
FROM events ev WHERE ev.title = 'Simak Siar Vol 24 "Perayaan Warsa Kedua"' AND ev.venue = 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- YUK MARI HIPHOP - MALANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YUK MARI HIPHOP - MALANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'YUK MARI HIPHOP - MALANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YUK MARI HIPHOP - MALANG', 'Music', 'Tipsy Lion Malang, Kota Malang', '2025-11-28 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TRCZ9Z1PCL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'YUK MARI HIPHOP - MALANG'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - MALANG' AND ev.venue = 'Tipsy Lion Malang, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 29
FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - MALANG' AND ev.venue = 'Tipsy Lion Malang, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BertaUT - FEEL THE CULTURE. LIVE THE BEAT!
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-72@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-72@wavy.seed' AND a.name = 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!', 'Music', 'Sasana Krida Raga Satria - GOR Satria  Purwokerto, Kab. Banyumas', '2025-11-28 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KCSKCWDP4V.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!'
WHERE o.email = 'demo.scrape-72@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!' AND ev.venue = 'Sasana Krida Raga Satria - GOR Satria  Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 56
FROM events ev WHERE ev.title = 'BertaUT - FEEL THE CULTURE. LIVE THE BEAT!' AND ev.venue = 'Sasana Krida Raga Satria - GOR Satria  Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ruang Bersuara Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ruang Bersuara Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-73@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-73@wavy.seed' AND a.name = 'Ruang Bersuara Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ruang Bersuara Fest', 'Music', 'Citra City Balikpapan, Kota Balikpapan', '2025-11-28 14:00:00'::timestamptz, 'https://assets.artatix.co.id/event/event_68808b22a6c8b.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ruang Bersuara Fest'
WHERE o.email = 'demo.scrape-73@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ruang Bersuara Fest' AND ev.venue = 'Citra City Balikpapan, Kota Balikpapan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 165000, 500, 69
FROM events ev WHERE ev.title = 'Ruang Bersuara Fest' AND ev.venue = 'Citra City Balikpapan, Kota Balikpapan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- YUK MARI HIPHOP - SEMARANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YUK MARI HIPHOP - SEMARANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'YUK MARI HIPHOP - SEMARANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YUK MARI HIPHOP - SEMARANG', 'Music', 'Tipsy Lion Semarang, Kota Semarang', '2025-11-29 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DT76BDFQ6J.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'YUK MARI HIPHOP - SEMARANG'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - SEMARANG' AND ev.venue = 'Tipsy Lion Semarang, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 29
FROM events ev WHERE ev.title = 'YUK MARI HIPHOP - SEMARANG' AND ev.venue = 'Tipsy Lion Semarang, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MANADO HARI INI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MANADO HARI INI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-39@wavy.seed' AND a.name = 'MANADO HARI INI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MANADO HARI INI', 'Music', 'POHON KASIH, Kota Manado', '2025-11-29 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ATJ7XRF3M9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MANADO HARI INI'
WHERE o.email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MANADO HARI INI' AND ev.venue = 'POHON KASIH, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 157
FROM events ev WHERE ev.title = 'MANADO HARI INI' AND ev.venue = 'POHON KASIH, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bestieval Cirebon Vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bestieval Cirebon Vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'Bestieval Cirebon Vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bestieval Cirebon Vol 2', 'Music', 'Cirebon, Kab. Cirebon', '2025-11-29 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QEJ8DMFFQT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bestieval Cirebon Vol 2'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bestieval Cirebon Vol 2' AND ev.venue = 'Cirebon, Kab. Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 33
FROM events ev WHERE ev.title = 'Bestieval Cirebon Vol 2' AND ev.venue = 'Cirebon, Kab. Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- STEREO 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'STEREO 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-74@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-74@wavy.seed' AND a.name = 'STEREO 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'STEREO 2025', 'Music', 'Bale Lantip UTDI Yogyakarta, Kab. Bantul', '2025-11-29 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/O8PITZQVXU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'STEREO 2025'
WHERE o.email = 'demo.scrape-74@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'STEREO 2025' AND ev.venue = 'Bale Lantip UTDI Yogyakarta, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 132
FROM events ev WHERE ev.title = 'STEREO 2025' AND ev.venue = 'Bale Lantip UTDI Yogyakarta, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SILIWANGI FESTIVAL 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SILIWANGI FESTIVAL 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-75@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-75@wavy.seed' AND a.name = 'SILIWANGI FESTIVAL 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SILIWANGI FESTIVAL 2025', 'Music', 'Area Parkir Transmall Tasikmalaya, Kota Tasikmalaya', '2025-11-29 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5THE3710FE.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SILIWANGI FESTIVAL 2025'
WHERE o.email = 'demo.scrape-75@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SILIWANGI FESTIVAL 2025' AND ev.venue = 'Area Parkir Transmall Tasikmalaya, Kota Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 205
FROM events ev WHERE ev.title = 'SILIWANGI FESTIVAL 2025' AND ev.venue = 'Area Parkir Transmall Tasikmalaya, Kota Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ufuk Timur Indonesia Festival (UTIFEST) 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ufuk Timur Indonesia Festival (UTIFEST) 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-76@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-76@wavy.seed' AND a.name = 'Ufuk Timur Indonesia Festival (UTIFEST) 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ufuk Timur Indonesia Festival (UTIFEST) 2025', 'Music', 'Lapangan Hockey, GOR Soemantri, Kota Adm. Jakarta Selatan', '2025-11-29 12:00:00'::timestamptz, 'https://assets.artatix.co.id/event/6886609770989-BannerWeb1062x427piksel1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ufuk Timur Indonesia Festival (UTIFEST) 2025'
WHERE o.email = 'demo.scrape-76@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ufuk Timur Indonesia Festival (UTIFEST) 2025' AND ev.venue = 'Lapangan Hockey, GOR Soemantri, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 8
FROM events ev WHERE ev.title = 'Ufuk Timur Indonesia Festival (UTIFEST) 2025' AND ev.venue = 'Lapangan Hockey, GOR Soemantri, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ROAD TO KAMI AKAN SELALU ADA #4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROAD TO KAMI AKAN SELALU ADA #4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-77@wavy.seed' AND a.name = 'ROAD TO KAMI AKAN SELALU ADA #4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROAD TO KAMI AKAN SELALU ADA #4', 'Music', 'Mall Bekasi Junction, UG Floor, Kota Bekasi', '2025-11-29 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/I8M1TD9XHB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROAD TO KAMI AKAN SELALU ADA #4'
WHERE o.email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ROAD TO KAMI AKAN SELALU ADA #4' AND ev.venue = 'Mall Bekasi Junction, UG Floor, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 251
FROM events ev WHERE ev.title = 'ROAD TO KAMI AKAN SELALU ADA #4' AND ev.venue = 'Mall Bekasi Junction, UG Floor, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ENDOFTIME
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ENDOFTIME', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-78@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-78@wavy.seed' AND a.name = 'ENDOFTIME');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ENDOFTIME', 'Music', 'Taman Mayura, Cakranegara, Mataram, Kota Mataram', '2025-11-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZE8SHI83RF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ENDOFTIME'
WHERE o.email = 'demo.scrape-78@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ENDOFTIME' AND ev.venue = 'Taman Mayura, Cakranegara, Mataram, Kota Mataram');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 254
FROM events ev WHERE ev.title = 'ENDOFTIME' AND ev.venue = 'Taman Mayura, Cakranegara, Mataram, Kota Mataram'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SOULFUL SESSIONS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SOULFUL SESSIONS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-79@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-79@wavy.seed' AND a.name = 'SOULFUL SESSIONS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SOULFUL SESSIONS', 'Music', 'Seinkiri Coffee, Kitchen, and Space, Kota Bandung', '2025-11-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TAW3KHW3W3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SOULFUL SESSIONS'
WHERE o.email = 'demo.scrape-79@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SOULFUL SESSIONS' AND ev.venue = 'Seinkiri Coffee, Kitchen, and Space, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 147
FROM events ev WHERE ev.title = 'SOULFUL SESSIONS' AND ev.venue = 'Seinkiri Coffee, Kitchen, and Space, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bandung DeathFest 7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bandung DeathFest 7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-80@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-80@wavy.seed' AND a.name = 'Bandung DeathFest 7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bandung DeathFest 7', 'Music', 'PAPURI, Kota Bandung', '2025-11-30 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6R93RVX4QS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bandung DeathFest 7'
WHERE o.email = 'demo.scrape-80@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bandung DeathFest 7' AND ev.venue = 'PAPURI, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 120
FROM events ev WHERE ev.title = 'Bandung DeathFest 7' AND ev.venue = 'PAPURI, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)', 'Music', 'GOR UNY, Kab. Sleman', '2025-12-05 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AKURF4PE2J.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)' AND ev.venue = 'GOR UNY, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 20
FROM events ev WHERE ev.title = 'Secondhand Serenade  20 Year Awake Anniversary (Yogyakarta)' AND ev.venue = 'GOR UNY, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NO WAY OUT VOL 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NO WAY OUT VOL 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'NO WAY OUT VOL 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO WAY OUT VOL 3', 'Music', 'FOURBIDDEN, Kota Bandung', '2025-12-05 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YJJMQRSCCZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO WAY OUT VOL 3'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO WAY OUT VOL 3' AND ev.venue = 'FOURBIDDEN, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 288
FROM events ev WHERE ev.title = 'NO WAY OUT VOL 3' AND ev.venue = 'FOURBIDDEN, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JAZTIFY  - VOL.5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JAZTIFY  - VOL.5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'JAZTIFY  - VOL.5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JAZTIFY  - VOL.5', 'Music', 'AREA HANGGAR LASWI HERITAGE, Kota Bandung', '2025-12-05 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/4NFCY3QIPI.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JAZTIFY  - VOL.5'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.5' AND ev.venue = 'AREA HANGGAR LASWI HERITAGE, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 138
FROM events ev WHERE ev.title = 'JAZTIFY  - VOL.5' AND ev.venue = 'AREA HANGGAR LASWI HERITAGE, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tone Temple Tribute to Barefood
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tone Temple Tribute to Barefood', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-81@wavy.seed' AND a.name = 'Tone Temple Tribute to Barefood');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tone Temple Tribute to Barefood', 'Music', 'Downtown DIner, Kab. Sleman', '2025-12-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GHYY2MDHOT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tone Temple Tribute to Barefood'
WHERE o.email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tone Temple Tribute to Barefood' AND ev.venue = 'Downtown DIner, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 73
FROM events ev WHERE ev.title = 'Tone Temple Tribute to Barefood' AND ev.venue = 'Downtown DIner, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nada Dansa
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nada Dansa', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-82@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-82@wavy.seed' AND a.name = 'Nada Dansa');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nada Dansa', 'Music', 'Senayan Park, Kota Adm. Jakarta Pusat', '2025-12-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FYRERURFJF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nada Dansa'
WHERE o.email = 'demo.scrape-82@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nada Dansa' AND ev.venue = 'Senayan Park, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 286
FROM events ev WHERE ev.title = 'Nada Dansa' AND ev.venue = 'Senayan Park, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Throw-in#2 by Rood Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Throw-in#2 by Rood Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-83@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-83@wavy.seed' AND a.name = 'Throw-in#2 by Rood Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Throw-in#2 by Rood Fest', 'Music', 'Gor Bambu Runcing Temanggung, Kab. Temanggung', '2025-12-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VAPX13Q88Z.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Throw-in#2 by Rood Fest'
WHERE o.email = 'demo.scrape-83@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Throw-in#2 by Rood Fest' AND ev.venue = 'Gor Bambu Runcing Temanggung, Kab. Temanggung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 19700, 500, 189
FROM events ev WHERE ev.title = 'Throw-in#2 by Rood Fest' AND ev.venue = 'Gor Bambu Runcing Temanggung, Kab. Temanggung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Cobain Evoloudroom - Punxxxx Capital
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Cobain Evoloudroom - Punxxxx Capital', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-84@wavy.seed' AND a.name = 'Cobain Evoloudroom - Punxxxx Capital');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Cobain Evoloudroom - Punxxxx Capital', 'Music', 'Warung Fotokopi, Cipete, Kota Adm. Jakarta Selatan', '2025-12-05 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5ONZKVCA4Q.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Cobain Evoloudroom - Punxxxx Capital'
WHERE o.email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Cobain Evoloudroom - Punxxxx Capital' AND ev.venue = 'Warung Fotokopi, Cipete, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 112
FROM events ev WHERE ev.title = 'Cobain Evoloudroom - Punxxxx Capital' AND ev.venue = 'Warung Fotokopi, Cipete, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Secondhand Serenade Awake 20 Year Anniversary (Jakarta)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)', 'Music', 'Tennis Indoor, Kota Adm. Jakarta Selatan', '2025-12-06 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/8J7BQHGFP3.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)' AND ev.venue = 'Tennis Indoor, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 435000, 500, 40
FROM events ev WHERE ev.title = 'Secondhand Serenade Awake 20 Year Anniversary (Jakarta)' AND ev.venue = 'Tennis Indoor, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Arjuna Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Arjuna Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-85@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-85@wavy.seed' AND a.name = 'Arjuna Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Arjuna Fest', 'Music', 'GOR Kampus 2 UMS, Kab. Sukoharjo', '2025-12-06 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IHW36KY3KJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Arjuna Fest'
WHERE o.email = 'demo.scrape-85@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Arjuna Fest' AND ev.venue = 'GOR Kampus 2 UMS, Kab. Sukoharjo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 225
FROM events ev WHERE ev.title = 'Arjuna Fest' AND ev.venue = 'GOR Kampus 2 UMS, Kab. Sukoharjo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hi-Feast
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hi-Feast', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-86@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-86@wavy.seed' AND a.name = 'Hi-Feast');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hi-Feast', 'Music', 'Universitas Budi Luhur, Kota Adm. Jakarta Selatan', '2025-12-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AZRKWHA2DX.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hi-Feast'
WHERE o.email = 'demo.scrape-86@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hi-Feast' AND ev.venue = 'Universitas Budi Luhur, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 198
FROM events ev WHERE ev.title = 'Hi-Feast' AND ev.venue = 'Universitas Budi Luhur, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THE 13TH JAMBORE JAZZ KAMPUS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THE 13TH JAMBORE JAZZ KAMPUS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-87@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-87@wavy.seed' AND a.name = 'THE 13TH JAMBORE JAZZ KAMPUS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THE 13TH JAMBORE JAZZ KAMPUS', 'Music', 'GOR PERTAMINA UNIVERSITAS BRAWIJAYA, Kota Malang', '2025-12-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RZV3RX1QC2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THE 13TH JAMBORE JAZZ KAMPUS'
WHERE o.email = 'demo.scrape-87@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THE 13TH JAMBORE JAZZ KAMPUS' AND ev.venue = 'GOR PERTAMINA UNIVERSITAS BRAWIJAYA, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 83000, 500, 31
FROM events ev WHERE ev.title = 'THE 13TH JAMBORE JAZZ KAMPUS' AND ev.venue = 'GOR PERTAMINA UNIVERSITAS BRAWIJAYA, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BESTIEVAL CILEUNGSI 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BESTIEVAL CILEUNGSI 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'BESTIEVAL CILEUNGSI 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BESTIEVAL CILEUNGSI 2025', 'Music', 'Cileungsi, Kab. Bogor', '2025-12-06 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/TTD9ZYNDBV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BESTIEVAL CILEUNGSI 2025'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BESTIEVAL CILEUNGSI 2025' AND ev.venue = 'Cileungsi, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 33
FROM events ev WHERE ev.title = 'BESTIEVAL CILEUNGSI 2025' AND ev.venue = 'Cileungsi, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FISIB FACE 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FISIB FACE 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-88@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-88@wavy.seed' AND a.name = 'FISIB FACE 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FISIB FACE 2025', 'Music', 'Rooftop Mall BTM Bogor, Kota Bogor', '2025-12-06 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/B06G1XVOMM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FISIB FACE 2025'
WHERE o.email = 'demo.scrape-88@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FISIB FACE 2025' AND ev.venue = 'Rooftop Mall BTM Bogor, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 22500, 500, 154
FROM events ev WHERE ev.title = 'FISIB FACE 2025' AND ev.venue = 'Rooftop Mall BTM Bogor, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Engine Tune Up (ETU) USD 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Engine Tune Up (ETU) USD 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-89@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-89@wavy.seed' AND a.name = 'Engine Tune Up (ETU) USD 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Engine Tune Up (ETU) USD 2025', 'Music', 'Lapangan Parkir Jogja Expo Center, Kota Yogyakarta', '2025-12-06 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U4LU5Q9EW1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Engine Tune Up (ETU) USD 2025'
WHERE o.email = 'demo.scrape-89@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Engine Tune Up (ETU) USD 2025' AND ev.venue = 'Lapangan Parkir Jogja Expo Center, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40500, 500, 187
FROM events ev WHERE ev.title = 'Engine Tune Up (ETU) USD 2025' AND ev.venue = 'Lapangan Parkir Jogja Expo Center, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-90@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-90@wavy.seed' AND a.name = 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis', 'Music', 'Ballroom lantai 5 GRAMM Hotel by Ambarrukmo, Kota Yogyakarta', '2025-12-07 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F5HZ081JKF.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis'
WHERE o.email = 'demo.scrape-90@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis' AND ev.venue = 'Ballroom lantai 5 GRAMM Hotel by Ambarrukmo, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 132000, 500, 60
FROM events ev WHERE ev.title = 'An Intimate Showcase of Song and Poetry  Dee Lestari Bocor Tipis' AND ev.venue = 'Ballroom lantai 5 GRAMM Hotel by Ambarrukmo, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MBU MUSIC CHAPTER 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MBU MUSIC CHAPTER 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-91@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-91@wavy.seed' AND a.name = 'MBU MUSIC CHAPTER 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MBU MUSIC CHAPTER 2', 'Music', 'Taman Rekreasi Alam Mayang, Kota Pekanbaru', '2025-12-07 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3PO23WEZL7.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MBU MUSIC CHAPTER 2'
WHERE o.email = 'demo.scrape-91@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MBU MUSIC CHAPTER 2' AND ev.venue = 'Taman Rekreasi Alam Mayang, Kota Pekanbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 195000, 500, 143
FROM events ev WHERE ev.title = 'MBU MUSIC CHAPTER 2' AND ev.venue = 'Taman Rekreasi Alam Mayang, Kota Pekanbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SHOUT, LOUD & GLORY 'BEAZT x DONGKER RELEASE PARTY'
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-92@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-92@wavy.seed' AND a.name = 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY''');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY''', 'Music', 'Bengkel TigaDanEmpat, Cibinong, Bogor, Kab. Bogor', '2025-12-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OL5P0VV96A.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY'''
WHERE o.email = 'demo.scrape-92@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY''' AND ev.venue = 'Bengkel TigaDanEmpat, Cibinong, Bogor, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 66
FROM events ev WHERE ev.title = 'SHOUT, LOUD & GLORY ''BEAZT x DONGKER RELEASE PARTY''' AND ev.venue = 'Bengkel TigaDanEmpat, Cibinong, Bogor, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jomlo Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jomlo Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-93@wavy.seed' AND a.name = 'Jomlo Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jomlo Festival', 'Music', 'Lapangan Parkir Stadion Mandala Krida, Kota Yogyakarta', '2025-12-07 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/E33SG6DHHV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jomlo Festival'
WHERE o.email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jomlo Festival' AND ev.venue = 'Lapangan Parkir Stadion Mandala Krida, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 119
FROM events ev WHERE ev.title = 'Jomlo Festival' AND ev.venue = 'Lapangan Parkir Stadion Mandala Krida, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sedjiwa Fest 2025 Vol.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sedjiwa Fest 2025 Vol.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-94@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-94@wavy.seed' AND a.name = 'Sedjiwa Fest 2025 Vol.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sedjiwa Fest 2025 Vol.2', 'Music', 'Art Center Area SOR Adiwidjaya, Kab. Garut', '2025-12-07 13:00:00'::timestamptz, 'https://assets.artatix.co.id/event/DBCJIJIMAG.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sedjiwa Fest 2025 Vol.2'
WHERE o.email = 'demo.scrape-94@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sedjiwa Fest 2025 Vol.2' AND ev.venue = 'Art Center Area SOR Adiwidjaya, Kab. Garut');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 172
FROM events ev WHERE ev.title = 'Sedjiwa Fest 2025 Vol.2' AND ev.venue = 'Art Center Area SOR Adiwidjaya, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ANNIVERSAEED 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ANNIVERSAEED 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-95@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-95@wavy.seed' AND a.name = 'ANNIVERSAEED 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ANNIVERSAEED 2025', 'Music', 'Gedung Abdjan Soelaeman, UIN Sunan Gunung Djati Bandung, Kota Bandung', '2025-12-07 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/2JV3L7RVEZ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ANNIVERSAEED 2025'
WHERE o.email = 'demo.scrape-95@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ANNIVERSAEED 2025' AND ev.venue = 'Gedung Abdjan Soelaeman, UIN Sunan Gunung Djati Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 205
FROM events ev WHERE ev.title = 'ANNIVERSAEED 2025' AND ev.venue = 'Gedung Abdjan Soelaeman, UIN Sunan Gunung Djati Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- We're All Gonna Gigs Volume 9
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'We''re All Gonna Gigs Volume 9', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-14@wavy.seed' AND a.name = 'We''re All Gonna Gigs Volume 9');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'We''re All Gonna Gigs Volume 9', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2025-12-10 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/L31OR3CL47.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'We''re All Gonna Gigs Volume 9'
WHERE o.email = 'demo.scrape-14@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 9' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 172
FROM events ev WHERE ev.title = 'We''re All Gonna Gigs Volume 9' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SOLO UNTUK SUMATRA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SOLO UNTUK SUMATRA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-67@wavy.seed' AND a.name = 'SOLO UNTUK SUMATRA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SOLO UNTUK SUMATRA', 'Music', 'Shuga Bar & Eatery De Tjolomadoe, Kab. Karanganyar', '2025-12-10 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ADEWNM603G.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SOLO UNTUK SUMATRA'
WHERE o.email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SOLO UNTUK SUMATRA' AND ev.venue = 'Shuga Bar & Eatery De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 181
FROM events ev WHERE ev.title = 'SOLO UNTUK SUMATRA' AND ev.venue = 'Shuga Bar & Eatery De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Creative Law Art Festival 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Creative Law Art Festival 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-96@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-96@wavy.seed' AND a.name = 'Creative Law Art Festival 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Creative Law Art Festival 2025', 'Music', 'Aula Syekh Quro, Kampus Universitas Singaperbangsa Karawang, jawa Barat, Kab. Karawang', '2025-12-10 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5H4S49VXZV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Creative Law Art Festival 2025'
WHERE o.email = 'demo.scrape-96@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Creative Law Art Festival 2025' AND ev.venue = 'Aula Syekh Quro, Kampus Universitas Singaperbangsa Karawang, jawa Barat, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 218
FROM events ev WHERE ev.title = 'Creative Law Art Festival 2025' AND ev.venue = 'Aula Syekh Quro, Kampus Universitas Singaperbangsa Karawang, jawa Barat, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SIGNATURE TIME  POP UP BAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SIGNATURE TIME  POP UP BAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'SIGNATURE TIME  POP UP BAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SIGNATURE TIME  POP UP BAR', 'Music', 'TENGAH PEOPLE & PLACE, Kota Adm. Jakarta Barat', '2025-12-12 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7HOCQ6RQJ9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SIGNATURE TIME  POP UP BAR'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR' AND ev.venue = 'TENGAH PEOPLE & PLACE, Kota Adm. Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 258
FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR' AND ev.venue = 'TENGAH PEOPLE & PLACE, Kota Adm. Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CIVIL FESTIVAL 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CIVIL FESTIVAL 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-97@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-97@wavy.seed' AND a.name = 'CIVIL FESTIVAL 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CIVIL FESTIVAL 2025', 'Music', 'FT Untirta, Kota Cilegon - Banten, Kota Cilegon', '2025-12-12 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YPFWIKY1V5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CIVIL FESTIVAL 2025'
WHERE o.email = 'demo.scrape-97@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CIVIL FESTIVAL 2025' AND ev.venue = 'FT Untirta, Kota Cilegon - Banten, Kota Cilegon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 141
FROM events ev WHERE ev.title = 'CIVIL FESTIVAL 2025' AND ev.venue = 'FT Untirta, Kota Cilegon - Banten, Kota Cilegon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Spectrum 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Spectrum 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-98@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-98@wavy.seed' AND a.name = 'The Spectrum 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Spectrum 2025', 'Music', 'SMA PLUS ISLAMIC VILLAGE, Kab. Tangerang', '2025-12-12 12:30:01'::timestamptz, 'https://assets.artatix.co.id/event/33NJ9Y0E14.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Spectrum 2025'
WHERE o.email = 'demo.scrape-98@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Spectrum 2025' AND ev.venue = 'SMA PLUS ISLAMIC VILLAGE, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 47500, 500, 54
FROM events ev WHERE ev.title = 'The Spectrum 2025' AND ev.venue = 'SMA PLUS ISLAMIC VILLAGE, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Dubduban
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Dubduban', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-99@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-99@wavy.seed' AND a.name = 'Mendadak Dubduban');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Dubduban', 'Music', 'Bento Kopi Warungasem, Kab. Batang', '2025-12-13 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LO3Z7QI25B.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Dubduban'
WHERE o.email = 'demo.scrape-99@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Dubduban' AND ev.venue = 'Bento Kopi Warungasem, Kab. Batang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 74200, 500, 87
FROM events ev WHERE ev.title = 'Mendadak Dubduban' AND ev.venue = 'Bento Kopi Warungasem, Kab. Batang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- STARFEST VOL. XI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'STARFEST VOL. XI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-100@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-100@wavy.seed' AND a.name = 'STARFEST VOL. XI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'STARFEST VOL. XI', 'Music', 'Studio Lokananta, Kota Surakarta', '2025-12-13 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/AQ5WBNHGPO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'STARFEST VOL. XI'
WHERE o.email = 'demo.scrape-100@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'STARFEST VOL. XI' AND ev.venue = 'Studio Lokananta, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 50
FROM events ev WHERE ev.title = 'STARFEST VOL. XI' AND ev.venue = 'Studio Lokananta, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NARAGIGS 2025 BREBES
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NARAGIGS 2025 BREBES', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-57@wavy.seed' AND a.name = 'NARAGIGS 2025 BREBES');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NARAGIGS 2025 BREBES', 'Music', 'STADION KARANGBIRAHI, KAB. BREBES, Kab. Brebes', '2025-12-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WRBHQ4L1PX.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NARAGIGS 2025 BREBES'
WHERE o.email = 'demo.scrape-57@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NARAGIGS 2025 BREBES' AND ev.venue = 'STADION KARANGBIRAHI, KAB. BREBES, Kab. Brebes');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 251
FROM events ev WHERE ev.title = 'NARAGIGS 2025 BREBES' AND ev.venue = 'STADION KARANGBIRAHI, KAB. BREBES, Kab. Brebes'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- EDUVIBES 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'EDUVIBES 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-101@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-101@wavy.seed' AND a.name = 'EDUVIBES 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'EDUVIBES 2025', 'Music', 'Jl. Dadaha No.18, Kahuripan, Kec. Tawang, Kab. Tasikmalaya, Jawa Barat 46115, Kota Tasikmalaya', '2025-12-14 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5TPWFGQTYP.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EDUVIBES 2025'
WHERE o.email = 'demo.scrape-101@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EDUVIBES 2025' AND ev.venue = 'Jl. Dadaha No.18, Kahuripan, Kec. Tawang, Kab. Tasikmalaya, Jawa Barat 46115, Kota Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 263
FROM events ev WHERE ev.title = 'EDUVIBES 2025' AND ev.venue = 'Jl. Dadaha No.18, Kahuripan, Kec. Tawang, Kab. Tasikmalaya, Jawa Barat 46115, Kota Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In Inertia Showcase "All The Things We Never Said"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In Inertia Showcase "All The Things We Never Said"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-102@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-102@wavy.seed' AND a.name = 'In Inertia Showcase "All The Things We Never Said"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase "All The Things We Never Said"', 'Music', 'Studio Lokananta, Solo, Kota Surakarta', '2025-12-14 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/MOAF0V2XWF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase "All The Things We Never Said"'
WHERE o.email = 'demo.scrape-102@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase "All The Things We Never Said"' AND ev.venue = 'Studio Lokananta, Solo, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 116
FROM events ev WHERE ev.title = 'In Inertia Showcase "All The Things We Never Said"' AND ev.venue = 'Studio Lokananta, Solo, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ROCKLAND FESTIVAL 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROCKLAND FESTIVAL 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-103@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-103@wavy.seed' AND a.name = 'ROCKLAND FESTIVAL 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROCKLAND FESTIVAL 2025', 'Music', 'Vivo mall Sentul, Kab. Bogor', '2025-12-14 16:06:01'::timestamptz, 'https://assets.artatix.co.id/event/9OVMH2UV1K.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROCKLAND FESTIVAL 2025'
WHERE o.email = 'demo.scrape-103@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ROCKLAND FESTIVAL 2025' AND ev.venue = 'Vivo mall Sentul, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 219
FROM events ev WHERE ev.title = 'ROCKLAND FESTIVAL 2025' AND ev.venue = 'Vivo mall Sentul, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Saemen Fest 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Saemen Fest 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'Saemen Fest 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Saemen Fest 2025', 'Music', 'Mandala Krida Stadium Parking Lot, Kota Yogyakarta', '2025-12-14 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/N55QNCNSVA.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Saemen Fest 2025'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Saemen Fest 2025' AND ev.venue = 'Mandala Krida Stadium Parking Lot, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 23
FROM events ev WHERE ev.title = 'Saemen Fest 2025' AND ev.venue = 'Mandala Krida Stadium Parking Lot, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hardcore Attack
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hardcore Attack', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-104@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-104@wavy.seed' AND a.name = 'Hardcore Attack');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hardcore Attack', 'Music', 'Saga Vigor, Kota Bandung', '2025-12-14 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/KJNFZCR229.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hardcore Attack'
WHERE o.email = 'demo.scrape-104@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hardcore Attack' AND ev.venue = 'Saga Vigor, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 142
FROM events ev WHERE ev.title = 'Hardcore Attack' AND ev.venue = 'Saga Vigor, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Story Indramayu Vol 5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Story Indramayu Vol 5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-105@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-105@wavy.seed' AND a.name = 'Story Indramayu Vol 5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Story Indramayu Vol 5', 'Music', 'Hopespace Coffee and Eatry, Kab. Indramayu', '2025-12-14 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SCDGOZDTW9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Story Indramayu Vol 5'
WHERE o.email = 'demo.scrape-105@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Story Indramayu Vol 5' AND ev.venue = 'Hopespace Coffee and Eatry, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 245
FROM events ev WHERE ev.title = 'Story Indramayu Vol 5' AND ev.venue = 'Hopespace Coffee and Eatry, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Experience 99
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Experience 99', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-106@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-106@wavy.seed' AND a.name = 'Experience 99');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Experience 99', 'Music', 'SMA Negeri 99 Jakarta, Kota Adm. Jakarta Timur', '2025-12-14 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V99GEPQ7FJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Experience 99'
WHERE o.email = 'demo.scrape-106@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Experience 99' AND ev.venue = 'SMA Negeri 99 Jakarta, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 116700, 500, 48
FROM events ev WHERE ev.title = 'Experience 99' AND ev.venue = 'SMA Negeri 99 Jakarta, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Psyonara 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Psyonara 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-107@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-107@wavy.seed' AND a.name = 'Psyonara 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Psyonara 2025', 'Music', 'Balai Serbaguna Purnomo Prawiro, Fakultas Ilmu Sosial dan Ilmu Politik Universitas Indonesia, Kota Depok', '2025-12-16 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0VR73QAUJQ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Psyonara 2025'
WHERE o.email = 'demo.scrape-107@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Psyonara 2025' AND ev.venue = 'Balai Serbaguna Purnomo Prawiro, Fakultas Ilmu Sosial dan Ilmu Politik Universitas Indonesia, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 211
FROM events ev WHERE ev.title = 'Psyonara 2025' AND ev.venue = 'Balai Serbaguna Purnomo Prawiro, Fakultas Ilmu Sosial dan Ilmu Politik Universitas Indonesia, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HALLWAY MUSIC STAGE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HALLWAY MUSIC STAGE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-108@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-108@wavy.seed' AND a.name = 'HALLWAY MUSIC STAGE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HALLWAY MUSIC STAGE', 'Music', 'The Hallway Space, Kota Bandung', '2025-12-19 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/POHHGR5L5Q.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HALLWAY MUSIC STAGE'
WHERE o.email = 'demo.scrape-108@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HALLWAY MUSIC STAGE' AND ev.venue = 'The Hallway Space, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 54
FROM events ev WHERE ev.title = 'HALLWAY MUSIC STAGE' AND ev.venue = 'The Hallway Space, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-109@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-109@wavy.seed' AND a.name = 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )', 'Music', 'SMA Negeri 2 Cilacap, Kab. Cilacap', '2025-12-19 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UL563JQ2SV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )'
WHERE o.email = 'demo.scrape-109@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )' AND ev.venue = 'SMA Negeri 2 Cilacap, Kab. Cilacap');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 7
FROM events ev WHERE ev.title = 'Gebyar Kreasi Anak Smanda Ke 41 ( GREAS 41 )' AND ev.venue = 'SMA Negeri 2 Cilacap, Kab. Cilacap'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TRIBUNE VOICE 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TRIBUNE VOICE 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-110@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-110@wavy.seed' AND a.name = 'TRIBUNE VOICE 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TRIBUNE VOICE 2025', 'Music', 'Stadion Kapten I Wayan Dipta, Kab. Gianyar', '2025-12-20 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/X82QRN7ZZ7.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TRIBUNE VOICE 2025'
WHERE o.email = 'demo.scrape-110@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TRIBUNE VOICE 2025' AND ev.venue = 'Stadion Kapten I Wayan Dipta, Kab. Gianyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 100
FROM events ev WHERE ev.title = 'TRIBUNE VOICE 2025' AND ev.venue = 'Stadion Kapten I Wayan Dipta, Kab. Gianyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PAUSA MELODI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PAUSA MELODI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-111@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-111@wavy.seed' AND a.name = 'PAUSA MELODI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PAUSA MELODI', 'Music', 'Plaza Barat, Taman Mini Indonesia Indah, Kota Adm. Jakarta Timur', '2025-12-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/36J58PXO4L.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PAUSA MELODI'
WHERE o.email = 'demo.scrape-111@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PAUSA MELODI' AND ev.venue = 'Plaza Barat, Taman Mini Indonesia Indah, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 233
FROM events ev WHERE ev.title = 'PAUSA MELODI' AND ev.venue = 'Plaza Barat, Taman Mini Indonesia Indah, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-112@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-112@wavy.seed' AND a.name = 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience', 'Music', 'Graha Budaya Embung Giwangan Yogyakarta, Kota Yogyakarta', '2025-12-22 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BRUNAOYMEX.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience'
WHERE o.email = 'demo.scrape-112@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience' AND ev.venue = 'Graha Budaya Embung Giwangan Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 246
FROM events ev WHERE ev.title = 'Panji Sakti x Ust Salim A Fillah - Di Antara Pulang - Reflective Music Experience' AND ev.venue = 'Graha Budaya Embung Giwangan Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pagelaran Seni COMMPHORIA 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pagelaran Seni COMMPHORIA 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-113@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-113@wavy.seed' AND a.name = 'Pagelaran Seni COMMPHORIA 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pagelaran Seni COMMPHORIA 2025', 'Music', 'Taman Budaya Aceh, Kota Banda Aceh', '2025-12-22 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2PUKKJZ9P8.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pagelaran Seni COMMPHORIA 2025'
WHERE o.email = 'demo.scrape-113@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pagelaran Seni COMMPHORIA 2025' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 249
FROM events ev WHERE ev.title = 'Pagelaran Seni COMMPHORIA 2025' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- O23 Days
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'O23 Days', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-114@wavy.seed' AND a.name = 'O23 Days');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'O23 Days', 'Music', 'Queen Bar, Kota Yogyakarta', '2025-12-23 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DSWSP9ZOUZ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'O23 Days'
WHERE o.email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'O23 Days' AND ev.venue = 'Queen Bar, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 23000, 500, 122
FROM events ev WHERE ev.title = 'O23 Days' AND ev.venue = 'Queen Bar, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jogja Hanyengkuyung Sumatra
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jogja Hanyengkuyung Sumatra', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-115@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-115@wavy.seed' AND a.name = 'Jogja Hanyengkuyung Sumatra');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jogja Hanyengkuyung Sumatra', 'Music', 'Stadion Maguwoharjo, Kab. Sleman', '2025-12-23 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U0JSXY1Q6D.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jogja Hanyengkuyung Sumatra'
WHERE o.email = 'demo.scrape-115@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jogja Hanyengkuyung Sumatra' AND ev.venue = 'Stadion Maguwoharjo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 165
FROM events ev WHERE ev.title = 'Jogja Hanyengkuyung Sumatra' AND ev.venue = 'Stadion Maguwoharjo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ROCKIN'DRAMAYU  - LUKA BERPESTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROCKIN''DRAMAYU  - LUKA BERPESTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-116@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-116@wavy.seed' AND a.name = 'ROCKIN''DRAMAYU  - LUKA BERPESTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROCKIN''DRAMAYU  - LUKA BERPESTA', 'Music', 'STADION TRIDAYA INDRAMAYU, Kab. Indramayu', '2025-12-23 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FAG9ZUXIZN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROCKIN''DRAMAYU  - LUKA BERPESTA'
WHERE o.email = 'demo.scrape-116@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ROCKIN''DRAMAYU  - LUKA BERPESTA' AND ev.venue = 'STADION TRIDAYA INDRAMAYU, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 238
FROM events ev WHERE ev.title = 'ROCKIN''DRAMAYU  - LUKA BERPESTA' AND ev.venue = 'STADION TRIDAYA INDRAMAYU, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sound Scapes Vol.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sound Scapes Vol.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-40@wavy.seed' AND a.name = 'Sound Scapes Vol.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sound Scapes Vol.2', 'Music', 'Labyrinth, Gudang Selatan 22, Bandung., Kota Bandung', '2025-12-26 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/P55Y08FAEN.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sound Scapes Vol.2'
WHERE o.email = 'demo.scrape-40@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sound Scapes Vol.2' AND ev.venue = 'Labyrinth, Gudang Selatan 22, Bandung., Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 60
FROM events ev WHERE ev.title = 'Sound Scapes Vol.2' AND ev.venue = 'Labyrinth, Gudang Selatan 22, Bandung., Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Klik Musik Fest 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Klik Musik Fest 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-68@wavy.seed' AND a.name = 'Klik Musik Fest 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Klik Musik Fest 2025', 'Music', 'Lapangan Luar Stadion A. Yani Sumenep, Kab. Sumenep', '2025-12-27 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KWBDHDFFX2.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Klik Musik Fest 2025'
WHERE o.email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Klik Musik Fest 2025' AND ev.venue = 'Lapangan Luar Stadion A. Yani Sumenep, Kab. Sumenep');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 284
FROM events ev WHERE ev.title = 'Klik Musik Fest 2025' AND ev.venue = 'Lapangan Luar Stadion A. Yani Sumenep, Kab. Sumenep'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- INSIDIOUS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'INSIDIOUS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-117@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-117@wavy.seed' AND a.name = 'INSIDIOUS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'INSIDIOUS', 'Music', 'TIC Borobudur, Kab. Magelang', '2025-12-27 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4IF3HM8777.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'INSIDIOUS'
WHERE o.email = 'demo.scrape-117@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'INSIDIOUS' AND ev.venue = 'TIC Borobudur, Kab. Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 271
FROM events ev WHERE ev.title = 'INSIDIOUS' AND ev.venue = 'TIC Borobudur, Kab. Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SAYAPMAS FESTIVAL 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SAYAPMAS FESTIVAL 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-118@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-118@wavy.seed' AND a.name = 'SAYAPMAS FESTIVAL 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SAYAPMAS FESTIVAL 2025', 'Music', 'LAPANGAN PARKIR STADION KANJURUHAN MALANG, Kota Malang', '2025-12-27 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ANZYEC4DAT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SAYAPMAS FESTIVAL 2025'
WHERE o.email = 'demo.scrape-118@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SAYAPMAS FESTIVAL 2025' AND ev.venue = 'LAPANGAN PARKIR STADION KANJURUHAN MALANG, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 114
FROM events ev WHERE ev.title = 'SAYAPMAS FESTIVAL 2025' AND ev.venue = 'LAPANGAN PARKIR STADION KANJURUHAN MALANG, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Anniversafest VOL II
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Anniversafest VOL II', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-119@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-119@wavy.seed' AND a.name = 'Anniversafest VOL II');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Anniversafest VOL II', 'Music', 'Margo Utomo Hill View Resort, Kab. Banyuwangi', '2025-12-27 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FVTS766PX1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Anniversafest VOL II'
WHERE o.email = 'demo.scrape-119@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Anniversafest VOL II' AND ev.venue = 'Margo Utomo Hill View Resort, Kab. Banyuwangi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 147
FROM events ev WHERE ev.title = 'Anniversafest VOL II' AND ev.venue = 'Margo Utomo Hill View Resort, Kab. Banyuwangi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- EAZY DIZZY
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'EAZY DIZZY', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-120@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-120@wavy.seed' AND a.name = 'EAZY DIZZY');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'EAZY DIZZY', 'Music', 'puri begawan, Kota Bogor', '2025-12-27 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LV2IT5XX92.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EAZY DIZZY'
WHERE o.email = 'demo.scrape-120@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EAZY DIZZY' AND ev.venue = 'puri begawan, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 240
FROM events ev WHERE ev.title = 'EAZY DIZZY' AND ev.venue = 'puri begawan, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Badia Sun Run Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Badia Sun Run Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-121@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-121@wavy.seed' AND a.name = 'Badia Sun Run Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Badia Sun Run Festival', 'Music', 'Lapangan Kota Wisata Badia, Kab. Pangandaran', '2025-12-27 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZXXT4YTQPL.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Badia Sun Run Festival'
WHERE o.email = 'demo.scrape-121@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Badia Sun Run Festival' AND ev.venue = 'Lapangan Kota Wisata Badia, Kab. Pangandaran');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 133
FROM events ev WHERE ev.title = 'Badia Sun Run Festival' AND ev.venue = 'Lapangan Kota Wisata Badia, Kab. Pangandaran'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NYE'26 WAVES PARTY by QUBU RESORT
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NYE''26 WAVES PARTY by QUBU RESORT', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-122@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-122@wavy.seed' AND a.name = 'NYE''26 WAVES PARTY by QUBU RESORT');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NYE''26 WAVES PARTY by QUBU RESORT', 'Music', 'Qubu Resort, Kab. Kubu Raya', '2025-12-31 20:00:00'::timestamptz, 'https://assets.artatix.co.id/event/Q5XL2R44GO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NYE''26 WAVES PARTY by QUBU RESORT'
WHERE o.email = 'demo.scrape-122@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NYE''26 WAVES PARTY by QUBU RESORT' AND ev.venue = 'Qubu Resort, Kab. Kubu Raya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 86
FROM events ev WHERE ev.title = 'NYE''26 WAVES PARTY by QUBU RESORT' AND ev.venue = 'Qubu Resort, Kab. Kubu Raya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Dangdut
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Dangdut', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-94@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-94@wavy.seed' AND a.name = 'Mendadak Dangdut');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Dangdut', 'Music', 'Sari Ater Kamboti Bandung, Kota Bandung', '2025-12-31 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0U5065G4S5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Dangdut'
WHERE o.email = 'demo.scrape-94@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Dangdut' AND ev.venue = 'Sari Ater Kamboti Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 192
FROM events ev WHERE ev.title = 'Mendadak Dangdut' AND ev.venue = 'Sari Ater Kamboti Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Majestic UnderWater Kingdom
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Majestic UnderWater Kingdom', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-63@wavy.seed' AND a.name = 'The Majestic UnderWater Kingdom');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Majestic UnderWater Kingdom', 'Music', 'Sahid Raya Hotel & Convention Yogyakarta, Kab. Sleman', '2025-12-31 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IS6C5AL3K3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Majestic UnderWater Kingdom'
WHERE o.email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Majestic UnderWater Kingdom' AND ev.venue = 'Sahid Raya Hotel & Convention Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 139
FROM events ev WHERE ev.title = 'The Majestic UnderWater Kingdom' AND ev.venue = 'Sahid Raya Hotel & Convention Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GLOBALNIGHTCULTURE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GLOBALNIGHTCULTURE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-123@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-123@wavy.seed' AND a.name = 'GLOBALNIGHTCULTURE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GLOBALNIGHTCULTURE', 'Music', 'Q- Garden Cafe and Resto, Kota Cirebon', '2025-12-31 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/K6QQZY7NXH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GLOBALNIGHTCULTURE'
WHERE o.email = 'demo.scrape-123@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GLOBALNIGHTCULTURE' AND ev.venue = 'Q- Garden Cafe and Resto, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 89
FROM events ev WHERE ev.title = 'GLOBALNIGHTCULTURE' AND ev.venue = 'Q- Garden Cafe and Resto, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sound Of Nature
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sound Of Nature', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-124@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-124@wavy.seed' AND a.name = 'Sound Of Nature');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sound Of Nature', 'Music', '150 Coffee Garden, Kota Bandung', '2025-12-31 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3CR8SFNFVQ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sound Of Nature'
WHERE o.email = 'demo.scrape-124@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sound Of Nature' AND ev.venue = '150 Coffee Garden, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 112
FROM events ev WHERE ev.title = 'Sound Of Nature' AND ev.venue = '150 Coffee Garden, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Balefest Tahun Baru
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Balefest Tahun Baru', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-125@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-125@wavy.seed' AND a.name = 'Balefest Tahun Baru');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Balefest Tahun Baru', 'Music', 'TAMAN BALEKAMBANG, Kota Surakarta', '2025-12-31 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UJK9MJCC5Z.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Balefest Tahun Baru'
WHERE o.email = 'demo.scrape-125@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Balefest Tahun Baru' AND ev.venue = 'TAMAN BALEKAMBANG, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 85
FROM events ev WHERE ev.title = 'Balefest Tahun Baru' AND ev.venue = 'TAMAN BALEKAMBANG, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Reggae Campfire -  Porlak JaHe Resort
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Reggae Campfire -  Porlak JaHe Resort', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-126@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-126@wavy.seed' AND a.name = 'Reggae Campfire -  Porlak JaHe Resort');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Reggae Campfire -  Porlak JaHe Resort', 'Music', 'Porlak JaHe Resort - Purwakarta, Kab. Purwakarta', '2025-12-31 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/INW5K72644.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Reggae Campfire -  Porlak JaHe Resort'
WHERE o.email = 'demo.scrape-126@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Reggae Campfire -  Porlak JaHe Resort' AND ev.venue = 'Porlak JaHe Resort - Purwakarta, Kab. Purwakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 98
FROM events ev WHERE ev.title = 'Reggae Campfire -  Porlak JaHe Resort' AND ev.venue = 'Porlak JaHe Resort - Purwakarta, Kab. Purwakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Moonfest 5.0
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonfest 5.0', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-127@wavy.seed' AND a.name = 'Moonfest 5.0');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonfest 5.0', 'Music', 'Uptown Park, Summarecon Mall Serpong, Tangerang, Kab. Tangerang', '2025-12-31 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F1KW597KMS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Moonfest 5.0'
WHERE o.email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Moonfest 5.0' AND ev.venue = 'Uptown Park, Summarecon Mall Serpong, Tangerang, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 1
FROM events ev WHERE ev.title = 'Moonfest 5.0' AND ev.venue = 'Uptown Park, Summarecon Mall Serpong, Tangerang, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Neon Glow Bash
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Neon Glow Bash', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-128@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-128@wavy.seed' AND a.name = 'Neon Glow Bash');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Neon Glow Bash', 'Music', 'Alio Beach Cafe & Bar, Kota Batam', '2025-12-31 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9JN0KMAP4F.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Neon Glow Bash'
WHERE o.email = 'demo.scrape-128@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Neon Glow Bash' AND ev.venue = 'Alio Beach Cafe & Bar, Kota Batam');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 164
FROM events ev WHERE ev.title = 'Neon Glow Bash' AND ev.venue = 'Alio Beach Cafe & Bar, Kota Batam'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SIGNATURE TIME  POP UP BAR - TANGERANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SIGNATURE TIME  POP UP BAR - TANGERANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'SIGNATURE TIME  POP UP BAR - TANGERANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SIGNATURE TIME  POP UP BAR - TANGERANG', 'Music', 'CYBERINK, Kota Tangerang', '2026-01-09 20:00:01'::timestamptz, 'https://assets.artatix.co.id/event/43466KI7XJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SIGNATURE TIME  POP UP BAR - TANGERANG'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - TANGERANG' AND ev.venue = 'CYBERINK, Kota Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 258
FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - TANGERANG' AND ev.venue = 'CYBERINK, Kota Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-129@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-129@wavy.seed' AND a.name = 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG', 'Music', 'ILLUA SOJU BAR, MENTENG, Kota Adm. Jakarta Pusat', '2026-01-10 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F0VUCMWK6A.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG'
WHERE o.email = 'demo.scrape-129@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG' AND ev.venue = 'ILLUA SOJU BAR, MENTENG, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 57
FROM events ev WHERE ev.title = 'BROTHERSPHERE [FEEL THE FIRST ENERGY] ILLUA SOJU BAR - MENTENG' AND ev.venue = 'ILLUA SOJU BAR, MENTENG, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Gebyar Juwangi New Year 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Gebyar Juwangi New Year 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-130@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-130@wavy.seed' AND a.name = 'Gebyar Juwangi New Year 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Gebyar Juwangi New Year 2026', 'Music', 'Lapangan krida sejati. Cungkup rt018 rw005 pilangrejo juwangi boyolali, Kab. Boyolali', '2026-01-11 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FJYRBIE9PH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Gebyar Juwangi New Year 2026'
WHERE o.email = 'demo.scrape-130@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Gebyar Juwangi New Year 2026' AND ev.venue = 'Lapangan krida sejati. Cungkup rt018 rw005 pilangrejo juwangi boyolali, Kab. Boyolali');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 10
FROM events ev WHERE ev.title = 'Gebyar Juwangi New Year 2026' AND ev.venue = 'Lapangan krida sejati. Cungkup rt018 rw005 pilangrejo juwangi boyolali, Kab. Boyolali'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konser Ambyar Tribute to Didi Kempot
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konser Ambyar Tribute to Didi Kempot', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-131@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-131@wavy.seed' AND a.name = 'Konser Ambyar Tribute to Didi Kempot');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konser Ambyar Tribute to Didi Kempot', 'Music', 'De Tjolomadoe, Surakarta, Kota Surakarta', '2026-01-11 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DT73U71TFB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konser Ambyar Tribute to Didi Kempot'
WHERE o.email = 'demo.scrape-131@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konser Ambyar Tribute to Didi Kempot' AND ev.venue = 'De Tjolomadoe, Surakarta, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 83
FROM events ev WHERE ev.title = 'Konser Ambyar Tribute to Didi Kempot' AND ev.venue = 'De Tjolomadoe, Surakarta, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Story in Subang Fest Vol 5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Story in Subang Fest Vol 5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-132@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-132@wavy.seed' AND a.name = 'Story in Subang Fest Vol 5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Story in Subang Fest Vol 5', 'Music', 'Subang, Kab. Subang', '2026-01-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0T3XG90K1O.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Story in Subang Fest Vol 5'
WHERE o.email = 'demo.scrape-132@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Story in Subang Fest Vol 5' AND ev.venue = 'Subang, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 156
FROM events ev WHERE ev.title = 'Story in Subang Fest Vol 5' AND ev.venue = 'Subang, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Arena Sirkus II
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Arena Sirkus II', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-133@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-133@wavy.seed' AND a.name = 'Arena Sirkus II');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Arena Sirkus II', 'Music', 'kafka space, Kota Medan', '2026-01-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q0XVX8EVCB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Arena Sirkus II'
WHERE o.email = 'demo.scrape-133@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Arena Sirkus II' AND ev.venue = 'kafka space, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 39
FROM events ev WHERE ev.title = 'Arena Sirkus II' AND ev.venue = 'kafka space, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SIGNATURE TIME  POP UP BAR - BANDUNG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SIGNATURE TIME  POP UP BAR - BANDUNG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'SIGNATURE TIME  POP UP BAR - BANDUNG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SIGNATURE TIME  POP UP BAR - BANDUNG', 'Music', 'Gudang selatan Bandung, Kota Bandung', '2026-01-17 20:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UFHZMTU17C.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SIGNATURE TIME  POP UP BAR - BANDUNG'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - BANDUNG' AND ev.venue = 'Gudang selatan Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 258
FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - BANDUNG' AND ev.venue = 'Gudang selatan Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Souln1te First Celebration
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Souln1te First Celebration', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-134@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-134@wavy.seed' AND a.name = 'Souln1te First Celebration');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Souln1te First Celebration', 'Music', 'Jakarta Selatan, Kota Adm. Jakarta Selatan', '2026-01-17 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XKPCUHXH58.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Souln1te First Celebration'
WHERE o.email = 'demo.scrape-134@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Souln1te First Celebration' AND ev.venue = 'Jakarta Selatan, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 122
FROM events ev WHERE ev.title = 'Souln1te First Celebration' AND ev.venue = 'Jakarta Selatan, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TOFEST (ThirtyOneFestival) 2025
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TOFEST (ThirtyOneFestival) 2025', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-135@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-135@wavy.seed' AND a.name = 'TOFEST (ThirtyOneFestival) 2025');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TOFEST (ThirtyOneFestival) 2025', 'Music', 'Gambir Expo, Kota Adm. Jakarta Utara', '2026-01-17 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/9TZIIHNJLZ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TOFEST (ThirtyOneFestival) 2025'
WHERE o.email = 'demo.scrape-135@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TOFEST (ThirtyOneFestival) 2025' AND ev.venue = 'Gambir Expo, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 255
FROM events ev WHERE ev.title = 'TOFEST (ThirtyOneFestival) 2025' AND ev.venue = 'Gambir Expo, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LANDFEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LANDFEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-136@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-136@wavy.seed' AND a.name = 'LANDFEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LANDFEST', 'Music', 'Parkiran Barat, Mall Pamulang Square, Kota Tangerang Selatan', '2026-01-17 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KAOSXGVBP9.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LANDFEST'
WHERE o.email = 'demo.scrape-136@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LANDFEST' AND ev.venue = 'Parkiran Barat, Mall Pamulang Square, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 111111, 500, 69
FROM events ev WHERE ev.title = 'LANDFEST' AND ev.venue = 'Parkiran Barat, Mall Pamulang Square, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Until The Last Breath ( 20 Tahun Viking Karawang )
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Until The Last Breath ( 20 Tahun Viking Karawang )', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-137@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-137@wavy.seed' AND a.name = 'Until The Last Breath ( 20 Tahun Viking Karawang )');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Until The Last Breath ( 20 Tahun Viking Karawang )', 'Music', 'Karawang, Kab. Karawang', '2026-01-18 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0389VDGXTN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Until The Last Breath ( 20 Tahun Viking Karawang )'
WHERE o.email = 'demo.scrape-137@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Until The Last Breath ( 20 Tahun Viking Karawang )' AND ev.venue = 'Karawang, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 1
FROM events ev WHERE ev.title = 'Until The Last Breath ( 20 Tahun Viking Karawang )' AND ev.venue = 'Karawang, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ZHERENITY
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ZHERENITY', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-138@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-138@wavy.seed' AND a.name = 'ZHERENITY');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ZHERENITY', 'Music', 'SMAN 2 Tangerang Selatan, Kota Tangerang Selatan', '2026-01-20 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HYPV8GSPMF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ZHERENITY'
WHERE o.email = 'demo.scrape-138@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ZHERENITY' AND ev.venue = 'SMAN 2 Tangerang Selatan, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 124
FROM events ev WHERE ev.title = 'ZHERENITY' AND ev.venue = 'SMAN 2 Tangerang Selatan, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SIGNATURE TIME  POP UP BAR - JAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SIGNATURE TIME  POP UP BAR - JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-46@wavy.seed' AND a.name = 'SIGNATURE TIME  POP UP BAR - JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SIGNATURE TIME  POP UP BAR - JAKARTA', 'Music', 'KRAPELA at  ROW 9, Kota Adm. Jakarta Selatan', '2026-01-23 20:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TNVM0XXCY4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SIGNATURE TIME  POP UP BAR - JAKARTA'
WHERE o.email = 'demo.scrape-46@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - JAKARTA' AND ev.venue = 'KRAPELA at  ROW 9, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 258
FROM events ev WHERE ev.title = 'SIGNATURE TIME  POP UP BAR - JAKARTA' AND ev.venue = 'KRAPELA at  ROW 9, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SMANSA FESTIVAL 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SMANSA FESTIVAL 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-139@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-139@wavy.seed' AND a.name = 'SMANSA FESTIVAL 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SMANSA FESTIVAL 2026', 'Music', 'Lapangan SMA Negeri 1 Semarang, Kota Semarang', '2026-01-23 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/D5XIBP9ZYB.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SMANSA FESTIVAL 2026'
WHERE o.email = 'demo.scrape-139@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SMANSA FESTIVAL 2026' AND ev.venue = 'Lapangan SMA Negeri 1 Semarang, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 267
FROM events ev WHERE ev.title = 'SMANSA FESTIVAL 2026' AND ev.venue = 'Lapangan SMA Negeri 1 Semarang, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CEREMONASI 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CEREMONASI 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-140@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-140@wavy.seed' AND a.name = 'CEREMONASI 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CEREMONASI 2026', 'Music', 'Magelang, Jawa Tengah, Kota Magelang', '2026-01-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/N27EVBXI12.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CEREMONASI 2026'
WHERE o.email = 'demo.scrape-140@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CEREMONASI 2026' AND ev.venue = 'Magelang, Jawa Tengah, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 67000, 500, 90
FROM events ev WHERE ev.title = 'CEREMONASI 2026' AND ev.venue = 'Magelang, Jawa Tengah, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FunAsik 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FunAsik 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-141@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-141@wavy.seed' AND a.name = 'FunAsik 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FunAsik 2026', 'Music', 'Ex Terminal Cilembang, Tasikmalaya, Kab. Tasikmalaya', '2026-01-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LEACDM7YPP.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FunAsik 2026'
WHERE o.email = 'demo.scrape-141@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FunAsik 2026' AND ev.venue = 'Ex Terminal Cilembang, Tasikmalaya, Kab. Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 273
FROM events ev WHERE ev.title = 'FunAsik 2026' AND ev.venue = 'Ex Terminal Cilembang, Tasikmalaya, Kab. Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SMABOY FESTIVAL 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SMABOY FESTIVAL 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-142@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-142@wavy.seed' AND a.name = 'SMABOY FESTIVAL 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SMABOY FESTIVAL 2026', 'Music', 'GOR LEMBU PETENG, Kab. Tulungagung', '2026-01-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DZJ0UT2SD8.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SMABOY FESTIVAL 2026'
WHERE o.email = 'demo.scrape-142@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SMABOY FESTIVAL 2026' AND ev.venue = 'GOR LEMBU PETENG, Kab. Tulungagung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 93000, 500, 16
FROM events ev WHERE ev.title = 'SMABOY FESTIVAL 2026' AND ev.venue = 'GOR LEMBU PETENG, Kab. Tulungagung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Buzz Youth Fest #4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Buzz Youth Fest #4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'Buzz Youth Fest #4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Buzz Youth Fest #4', 'Music', 'Amanah Borneo Park, Banjarbaru, Kota Banjarbaru', '2026-01-24 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/VGZUGXA571.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Buzz Youth Fest #4'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Buzz Youth Fest #4' AND ev.venue = 'Amanah Borneo Park, Banjarbaru, Kota Banjarbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 380000, 500, 113
FROM events ev WHERE ev.title = 'Buzz Youth Fest #4' AND ev.venue = 'Amanah Borneo Park, Banjarbaru, Kota Banjarbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Awalan Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Awalan Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-143@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-143@wavy.seed' AND a.name = 'Awalan Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Awalan Fest 2026', 'Music', 'Stadion Maguwoharjo, Kab. Sleman', '2026-01-24 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/24TL9YRLUX.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Awalan Fest 2026'
WHERE o.email = 'demo.scrape-143@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Awalan Fest 2026' AND ev.venue = 'Stadion Maguwoharjo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 219
FROM events ev WHERE ev.title = 'Awalan Fest 2026' AND ev.venue = 'Stadion Maguwoharjo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- More Than Broterhood
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'More Than Broterhood', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-144@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-144@wavy.seed' AND a.name = 'More Than Broterhood');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'More Than Broterhood', 'Music', 'TEBING CAFE , PACIRAN, Kab. Lamongan', '2026-01-25 15:15:01'::timestamptz, 'https://assets.artatix.co.id/event/OSJ29EALE5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'More Than Broterhood'
WHERE o.email = 'demo.scrape-144@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'More Than Broterhood' AND ev.venue = 'TEBING CAFE , PACIRAN, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 162
FROM events ev WHERE ev.title = 'More Than Broterhood' AND ev.venue = 'TEBING CAFE , PACIRAN, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SHININ9 ANNIVERSARY 9TH ST.BIER BAR 'N KITCHEN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-145@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-145@wavy.seed' AND a.name = 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN', 'Music', 'St. Bier Bar N Kitchen, Kab. Sleman', '2026-01-27 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CWP9W42RIN.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN'
WHERE o.email = 'demo.scrape-145@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN' AND ev.venue = 'St. Bier Bar N Kitchen, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 125
FROM events ev WHERE ev.title = 'SHININ9 ANNIVERSARY 9TH ST.BIER BAR ''N KITCHEN' AND ev.venue = 'St. Bier Bar N Kitchen, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 26
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 26', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 26');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 26', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2026-01-29 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W4TKVZL4QI.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 26'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 26' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol 26' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SECONDHAND SERENADE - PALEMBANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SECONDHAND SERENADE - PALEMBANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = 'SECONDHAND SERENADE - PALEMBANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SECONDHAND SERENADE - PALEMBANG', 'Music', 'The Sultan Convention Center, Kota Palembang', '2026-01-30 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2P8118Y8R7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SECONDHAND SERENADE - PALEMBANG'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SECONDHAND SERENADE - PALEMBANG' AND ev.venue = 'The Sultan Convention Center, Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 150
FROM events ev WHERE ev.title = 'SECONDHAND SERENADE - PALEMBANG' AND ev.venue = 'The Sultan Convention Center, Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Smazaba Novaire Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Smazaba Novaire Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-146@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-146@wavy.seed' AND a.name = 'Smazaba Novaire Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Smazaba Novaire Fest', 'Music', 'SMA Negeri 1 Babadan, Kab. Ponorogo', '2026-01-30 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6I9EHPU4RO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Smazaba Novaire Fest'
WHERE o.email = 'demo.scrape-146@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Smazaba Novaire Fest' AND ev.venue = 'SMA Negeri 1 Babadan, Kab. Ponorogo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 128
FROM events ev WHERE ev.title = 'Smazaba Novaire Fest' AND ev.venue = 'SMA Negeri 1 Babadan, Kab. Ponorogo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BLEACH X BASTARDS OF YOUNG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BLEACH X BASTARDS OF YOUNG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'BLEACH X BASTARDS OF YOUNG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BLEACH X BASTARDS OF YOUNG', 'Music', 'SAGAVIGOR, Kota Bandung', '2026-01-31 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IXN8QZPF6X.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BLEACH X BASTARDS OF YOUNG'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BLEACH X BASTARDS OF YOUNG' AND ev.venue = 'SAGAVIGOR, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 158
FROM events ev WHERE ev.title = 'BLEACH X BASTARDS OF YOUNG' AND ev.venue = 'SAGAVIGOR, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-81@wavy.seed' AND a.name = 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"', 'Music', 'Ballroom & Arcadaz 5th Floor  Grand Mercure Gramm Hotel by Ambarrukmo, Kab. Sleman', '2026-01-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/47ZCFW3OV5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"'
WHERE o.email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"' AND ev.venue = 'Ballroom & Arcadaz 5th Floor  Grand Mercure Gramm Hotel by Ambarrukmo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 223
FROM events ev WHERE ev.title = 'TONE TEMPLE PRESENT "GRRRL GANG ONLINE 24/7"' AND ev.venue = 'Ballroom & Arcadaz 5th Floor  Grand Mercure Gramm Hotel by Ambarrukmo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dibawah LangitMu
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dibawah LangitMu', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-147@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-147@wavy.seed' AND a.name = 'Dibawah LangitMu');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dibawah LangitMu', 'Music', 'Alun Alun Barat Serang, Kota Serang', '2026-01-31 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FB299B89RD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dibawah LangitMu'
WHERE o.email = 'demo.scrape-147@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dibawah LangitMu' AND ev.venue = 'Alun Alun Barat Serang, Kota Serang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 251
FROM events ev WHERE ev.title = 'Dibawah LangitMu' AND ev.venue = 'Alun Alun Barat Serang, Kota Serang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-148@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-148@wavy.seed' AND a.name = 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto', 'Music', 'Escalla Flora, Kab. Mojokerto', '2026-01-31 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QMOL23C08K.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto'
WHERE o.email = 'demo.scrape-148@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto' AND ev.venue = 'Escalla Flora, Kab. Mojokerto');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 124
FROM events ev WHERE ev.title = 'Panggung Intim Banda Neira  "Berjalan Lebih Jauh" Ke Mojokerto' AND ev.venue = 'Escalla Flora, Kab. Mojokerto'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Brothersphere Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Brothersphere Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-129@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-129@wavy.seed' AND a.name = 'Brothersphere Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Brothersphere Fest 2026', 'Music', 'gambir expo kemayoran, Kota Adm. Jakarta Pusat', '2026-01-31 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/98FSLMGU58.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Brothersphere Fest 2026'
WHERE o.email = 'demo.scrape-129@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Brothersphere Fest 2026' AND ev.venue = 'gambir expo kemayoran, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 67
FROM events ev WHERE ev.title = 'Brothersphere Fest 2026' AND ev.venue = 'gambir expo kemayoran, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BURGERKILL  KONTINUM UNLEASHED - THE UPRISING
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-149@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-149@wavy.seed' AND a.name = 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING', 'Music', 'Braga Sky, Kota Bandung', '2026-02-01 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DJAQZU6MS3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING'
WHERE o.email = 'demo.scrape-149@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING' AND ev.venue = 'Braga Sky, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 37
FROM events ev WHERE ev.title = 'BURGERKILL  KONTINUM UNLEASHED - THE UPRISING' AND ev.venue = 'Braga Sky, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-150@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-150@wavy.seed' AND a.name = 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember', 'Music', 'Argokita Rembangan, Kab. Jember', '2026-02-01 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OKY0CGUVMA.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember'
WHERE o.email = 'demo.scrape-150@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember' AND ev.venue = 'Argokita Rembangan, Kab. Jember');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 100
FROM events ev WHERE ev.title = 'Panggung Intim Banda Neira "Berjalan Lebih Jauh" Ke Jember' AND ev.venue = 'Argokita Rembangan, Kab. Jember'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 2000'S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-70@wavy.seed' AND a.name = '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN', 'Music', 'Gedung Sultan Suriansyah, Kota Banjarmasin', '2026-02-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OA3IJUHMJ9.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN'
WHERE o.email = 'demo.scrape-70@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN' AND ev.venue = 'Gedung Sultan Suriansyah, Kota Banjarmasin');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 449000, 500, 120
FROM events ev WHERE ev.title = '2000''S NIGHT - THE SOUNDTRACK OF OUR YOUTH - SPECIAL  BANJARMASIN' AND ev.venue = 'Gedung Sultan Suriansyah, Kota Banjarmasin'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THERE'S NO BETTER FEELING THEN (SHOWCASE)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THERE''S NO BETTER FEELING THEN (SHOWCASE)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-151@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-151@wavy.seed' AND a.name = 'THERE''S NO BETTER FEELING THEN (SHOWCASE)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THERE''S NO BETTER FEELING THEN (SHOWCASE)', 'Music', 'Surabaya, Kota Surabaya', '2026-02-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/THAQYWPBV8.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THERE''S NO BETTER FEELING THEN (SHOWCASE)'
WHERE o.email = 'demo.scrape-151@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THERE''S NO BETTER FEELING THEN (SHOWCASE)' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 43
FROM events ev WHERE ev.title = 'THERE''S NO BETTER FEELING THEN (SHOWCASE)' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Lembang Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Lembang Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-152@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-152@wavy.seed' AND a.name = 'Lembang Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Lembang Fest', 'Music', 'Ark Cafe, Kab. Bandung Barat', '2026-02-07 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/T6762ZCG8D.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Lembang Fest'
WHERE o.email = 'demo.scrape-152@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Lembang Fest' AND ev.venue = 'Ark Cafe, Kab. Bandung Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 146
FROM events ev WHERE ev.title = 'Lembang Fest' AND ev.venue = 'Ark Cafe, Kab. Bandung Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LOLLIPOP FEST VOL. 01
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LOLLIPOP FEST VOL. 01', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-153@wavy.seed' AND a.name = 'LOLLIPOP FEST VOL. 01');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LOLLIPOP FEST VOL. 01', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-02-08 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FLWXOWQSYC.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LOLLIPOP FEST VOL. 01'
WHERE o.email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 01' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 109500, 500, 129
FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 01' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FAVELOV FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FAVELOV FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-154@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-154@wavy.seed' AND a.name = 'FAVELOV FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FAVELOV FEST', 'Music', 'Lapangan Atletik 1, Jakabaring Sport City, Kota Palembang', '2026-02-08 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/41DKPPEIO5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FAVELOV FEST'
WHERE o.email = 'demo.scrape-154@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FAVELOV FEST' AND ev.venue = 'Lapangan Atletik 1, Jakabaring Sport City, Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 62
FROM events ev WHERE ev.title = 'FAVELOV FEST' AND ev.venue = 'Lapangan Atletik 1, Jakabaring Sport City, Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- United Day 9
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'United Day 9', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'United Day 9');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'United Day 9', 'Music', 'TRITAN POINT, Kota Bandung', '2026-02-08 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/456N4LF43R.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'United Day 9'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'United Day 9' AND ev.venue = 'TRITAN POINT, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 227
FROM events ev WHERE ev.title = 'United Day 9' AND ev.venue = 'TRITAN POINT, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Intimate Concert Panji Sakti
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Intimate Concert Panji Sakti', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-155@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-155@wavy.seed' AND a.name = 'Intimate Concert Panji Sakti');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Intimate Concert Panji Sakti', 'Music', 'Temu Kamu Coffee and Eatery, Kota Malang', '2026-02-11 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HIB4L6O4I0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Intimate Concert Panji Sakti'
WHERE o.email = 'demo.scrape-155@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Intimate Concert Panji Sakti' AND ev.venue = 'Temu Kamu Coffee and Eatery, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 235
FROM events ev WHERE ev.title = 'Intimate Concert Panji Sakti' AND ev.venue = 'Temu Kamu Coffee and Eatery, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Futsal Nation Cup 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Futsal Nation Cup 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-156@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-156@wavy.seed' AND a.name = 'Futsal Nation Cup 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Futsal Nation Cup 2026', 'Music', 'GOR TERPADU AYANI, KOTA PONTIANAK, Kota Pontianak', '2026-02-12 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XNKDZDQYE6.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Futsal Nation Cup 2026'
WHERE o.email = 'demo.scrape-156@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Futsal Nation Cup 2026' AND ev.venue = 'GOR TERPADU AYANI, KOTA PONTIANAK, Kota Pontianak');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 178
FROM events ev WHERE ev.title = 'Futsal Nation Cup 2026' AND ev.venue = 'GOR TERPADU AYANI, KOTA PONTIANAK, Kota Pontianak'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SOUND KLIK
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SOUND KLIK', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-157@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-157@wavy.seed' AND a.name = 'SOUND KLIK');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SOUND KLIK', 'Music', 'Panorama 25 Bojong, Kab. Pekalongan', '2026-02-13 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Y6FXXG4BLK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SOUND KLIK'
WHERE o.email = 'demo.scrape-157@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SOUND KLIK' AND ev.venue = 'Panorama 25 Bojong, Kab. Pekalongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 51
FROM events ev WHERE ev.title = 'SOUND KLIK' AND ev.venue = 'Panorama 25 Bojong, Kab. Pekalongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MALAMPORA 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MALAMPORA 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-158@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-158@wavy.seed' AND a.name = 'MALAMPORA 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MALAMPORA 2026', 'Music', 'Bikasoga Indoor Hall, Kota Bandung', '2026-02-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4ZYVEOVUJS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MALAMPORA 2026'
WHERE o.email = 'demo.scrape-158@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MALAMPORA 2026' AND ev.venue = 'Bikasoga Indoor Hall, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 214
FROM events ev WHERE ev.title = 'MALAMPORA 2026' AND ev.venue = 'Bikasoga Indoor Hall, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konsolidasi Pasukan Babi Neraka
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konsolidasi Pasukan Babi Neraka', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-67@wavy.seed' AND a.name = 'Konsolidasi Pasukan Babi Neraka');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konsolidasi Pasukan Babi Neraka', 'Music', 'Studio Lokananta Solo, Kota Surakarta', '2026-02-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/19K4AB0JI4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konsolidasi Pasukan Babi Neraka'
WHERE o.email = 'demo.scrape-67@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konsolidasi Pasukan Babi Neraka' AND ev.venue = 'Studio Lokananta Solo, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 241
FROM events ev WHERE ev.title = 'Konsolidasi Pasukan Babi Neraka' AND ev.venue = 'Studio Lokananta Solo, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Story Intimate Indramayu Edisi Munggahan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Story Intimate Indramayu Edisi Munggahan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-105@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-105@wavy.seed' AND a.name = 'Story Intimate Indramayu Edisi Munggahan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Story Intimate Indramayu Edisi Munggahan', 'Music', 'Hopespace Coffee & Eatery, Indramayu, Kab. Indramayu', '2026-02-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AAYE644DYM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Story Intimate Indramayu Edisi Munggahan'
WHERE o.email = 'demo.scrape-105@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Story Intimate Indramayu Edisi Munggahan' AND ev.venue = 'Hopespace Coffee & Eatery, Indramayu, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 245
FROM events ev WHERE ev.title = 'Story Intimate Indramayu Edisi Munggahan' AND ev.venue = 'Hopespace Coffee & Eatery, Indramayu, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BLUNIVAL VOICE OF YOUTH Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BLUNIVAL VOICE OF YOUTH Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-159@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-159@wavy.seed' AND a.name = 'BLUNIVAL VOICE OF YOUTH Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BLUNIVAL VOICE OF YOUTH Vol.1', 'Music', 'Auditorium Grha Bujana Universitas Budi Luhur, Kota Adm. Jakarta Barat', '2026-02-13 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/H6D9R26JMK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BLUNIVAL VOICE OF YOUTH Vol.1'
WHERE o.email = 'demo.scrape-159@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BLUNIVAL VOICE OF YOUTH Vol.1' AND ev.venue = 'Auditorium Grha Bujana Universitas Budi Luhur, Kota Adm. Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 17
FROM events ev WHERE ev.title = 'BLUNIVAL VOICE OF YOUTH Vol.1' AND ev.venue = 'Auditorium Grha Bujana Universitas Budi Luhur, Kota Adm. Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Melangkah Bersama Vol . 7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Melangkah Bersama Vol . 7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-6@wavy.seed' AND a.name = 'Melangkah Bersama Vol . 7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Melangkah Bersama Vol . 7', 'Music', 'Journey Coffee & Records, Kab. Sleman', '2026-02-14 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9C4IFAGEFA.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Melangkah Bersama Vol . 7'
WHERE o.email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Melangkah Bersama Vol . 7' AND ev.venue = 'Journey Coffee & Records, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 208
FROM events ev WHERE ev.title = 'Melangkah Bersama Vol . 7' AND ev.venue = 'Journey Coffee & Records, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-160@wavy.seed' AND a.name = 'Riang dan Ceria');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria', 'Music', 'Jambi, Kota Jambi', '2026-02-14 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YGSOX1TW8R.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria'
WHERE o.email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria' AND ev.venue = 'Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 230
FROM events ev WHERE ev.title = 'Riang dan Ceria' AND ev.venue = 'Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 62 SOUND
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '62 SOUND', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-161@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-161@wavy.seed' AND a.name = '62 SOUND');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '62 SOUND', 'Music', 'PRPP SEMARANG, Kota Semarang', '2026-02-14 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6BZZCEWTFF.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '62 SOUND'
WHERE o.email = 'demo.scrape-161@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '62 SOUND' AND ev.venue = 'PRPP SEMARANG, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 13
FROM events ev WHERE ev.title = '62 SOUND' AND ev.venue = 'PRPP SEMARANG, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Raya Beat Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Raya Beat Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-162@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-162@wavy.seed' AND a.name = 'Raya Beat Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Raya Beat Festival', 'Music', 'Lapangan Skadron 21 AAY Puspenerbad, Kota Tangerang Selatan', '2026-02-14 13:00:00'::timestamptz, 'https://assets.artatix.co.id/event/4W7XX7AJ5Y.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Raya Beat Festival'
WHERE o.email = 'demo.scrape-162@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Raya Beat Festival' AND ev.venue = 'Lapangan Skadron 21 AAY Puspenerbad, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 266
FROM events ev WHERE ev.title = 'Raya Beat Festival' AND ev.venue = 'Lapangan Skadron 21 AAY Puspenerbad, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Trial Sunkies 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Trial Sunkies 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-155@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-155@wavy.seed' AND a.name = 'Trial Sunkies 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Trial Sunkies 3', 'Music', 'PLUS COFFE AND SPACE, Kota Malang', '2026-02-15 18:30:01'::timestamptz, 'https://assets.artatix.co.id/event/0NF6Q0Q4OU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Trial Sunkies 3'
WHERE o.email = 'demo.scrape-155@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Trial Sunkies 3' AND ev.venue = 'PLUS COFFE AND SPACE, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 105
FROM events ev WHERE ev.title = 'Trial Sunkies 3' AND ev.venue = 'PLUS COFFE AND SPACE, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)', 'Music', 'JNM Bloc, Kota Yogyakarta', '2026-02-15 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/09CQU37QGX.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)' AND ev.venue = 'JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135510, 500, 93
FROM events ev WHERE ev.title = '510 Genesis Spiritual Return to Origin (Special Show Orchestra Set)' AND ev.venue = 'JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Omega Space Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Omega Space Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-163@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-163@wavy.seed' AND a.name = 'Omega Space Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Omega Space Festival', 'Music', 'Kopi Ulon Signature, Kota Cirebon', '2026-02-15 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/539JBTUXHM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Omega Space Festival'
WHERE o.email = 'demo.scrape-163@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Omega Space Festival' AND ev.venue = 'Kopi Ulon Signature, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 269
FROM events ev WHERE ev.title = 'Omega Space Festival' AND ev.venue = 'Kopi Ulon Signature, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Love Heals
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Love Heals', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-164@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-164@wavy.seed' AND a.name = 'Love Heals');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Love Heals', 'Music', 'Marina Convention Center, Semarang, Kota Semarang', '2026-02-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CPDB2Y7NJG.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Love Heals'
WHERE o.email = 'demo.scrape-164@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Love Heals' AND ev.venue = 'Marina Convention Center, Semarang, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 222
FROM events ev WHERE ev.title = 'Love Heals' AND ev.venue = 'Marina Convention Center, Semarang, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ngabudayan Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ngabudayan Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-165@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-165@wavy.seed' AND a.name = 'Ngabudayan Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ngabudayan Fest 2026', 'Music', 'Lapangan Candi Sewu Prambanan, Kab. Klaten', '2026-02-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6SKLHYB7FR.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ngabudayan Fest 2026'
WHERE o.email = 'demo.scrape-165@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ngabudayan Fest 2026' AND ev.venue = 'Lapangan Candi Sewu Prambanan, Kab. Klaten');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 12120, 500, 55
FROM events ev WHERE ev.title = 'Ngabudayan Fest 2026' AND ev.venue = 'Lapangan Candi Sewu Prambanan, Kab. Klaten'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GigShow
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GigShow', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-166@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-166@wavy.seed' AND a.name = 'GigShow');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GigShow', 'Music', 'Gedung Serbaguna - Pemalang, Kab. Pemalang', '2026-02-15 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/S253PU7BOY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GigShow'
WHERE o.email = 'demo.scrape-166@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GigShow' AND ev.venue = 'Gedung Serbaguna - Pemalang, Kab. Pemalang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 258
FROM events ev WHERE ev.title = 'GigShow' AND ev.venue = 'Gedung Serbaguna - Pemalang, Kab. Pemalang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Padang Gigs Charity "WARGA BANTU WARGA"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Padang Gigs Charity "WARGA BANTU WARGA"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-167@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-167@wavy.seed' AND a.name = 'Padang Gigs Charity "WARGA BANTU WARGA"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Padang Gigs Charity "WARGA BANTU WARGA"', 'Music', 'Fabriek Padang, Kota Padang', '2026-02-15 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2OPGESOSK5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Padang Gigs Charity "WARGA BANTU WARGA"'
WHERE o.email = 'demo.scrape-167@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Padang Gigs Charity "WARGA BANTU WARGA"' AND ev.venue = 'Fabriek Padang, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 261
FROM events ev WHERE ev.title = 'Padang Gigs Charity "WARGA BANTU WARGA"' AND ev.venue = 'Fabriek Padang, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-168@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-168@wavy.seed' AND a.name = 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2026-02-16 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7KAAORU0CY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)'
WHERE o.email = 'demo.scrape-168@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 104
FROM events ev WHERE ev.title = 'Launching Shaggydog - Lodse (feat. Rebellion Rose & The Glad)' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Suka Suka Festival  Vol 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Suka Suka Festival  Vol 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-169@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-169@wavy.seed' AND a.name = 'Suka Suka Festival  Vol 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Suka Suka Festival  Vol 1', 'Music', 'De Tjolomadoe , Kab. Karanganyar, Jawa Tengah, Kota Surakarta', '2026-02-16 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GJ3NAWZMC8.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Suka Suka Festival  Vol 1'
WHERE o.email = 'demo.scrape-169@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Suka Suka Festival  Vol 1' AND ev.venue = 'De Tjolomadoe , Kab. Karanganyar, Jawa Tengah, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 197
FROM events ev WHERE ev.title = 'Suka Suka Festival  Vol 1' AND ev.venue = 'De Tjolomadoe , Kab. Karanganyar, Jawa Tengah, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- YK Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'YK Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-170@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-170@wavy.seed' AND a.name = 'YK Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'YK Fest', 'Music', 'LAPANGAN YONKAV 5 KARANG ENDAH, Kab. Muara Enim', '2026-02-17 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ERAXRSWLML.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'YK Fest'
WHERE o.email = 'demo.scrape-170@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'YK Fest' AND ev.venue = 'LAPANGAN YONKAV 5 KARANG ENDAH, Kab. Muara Enim');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 80
FROM events ev WHERE ev.title = 'YK Fest' AND ev.venue = 'LAPANGAN YONKAV 5 KARANG ENDAH, Kab. Muara Enim'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 27
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 27', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 27');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 27', 'Music', 'Lestari Corner Coffee, Kab. Sleman', '2026-02-26 21:30:01'::timestamptz, 'https://assets.artatix.co.id/event/ZBV7XF4EMH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 27'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 27' AND ev.venue = 'Lestari Corner Coffee, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol 27' AND ev.venue = 'Lestari Corner Coffee, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bergigs Ria #2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bergigs Ria #2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-171@wavy.seed' AND a.name = 'Bergigs Ria #2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bergigs Ria #2', 'Music', 'SANTAI KAWAN KOPI, Kab. Sleman', '2026-02-28 19:30:01'::timestamptz, 'https://assets.artatix.co.id/event/X4GV2Z879N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bergigs Ria #2'
WHERE o.email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bergigs Ria #2' AND ev.venue = 'SANTAI KAWAN KOPI, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 103
FROM events ev WHERE ev.title = 'Bergigs Ria #2' AND ev.venue = 'SANTAI KAWAN KOPI, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PSGSJ Annual Concert 2026 "Sacra  Cantica"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PSGSJ Annual Concert 2026 "Sacra  Cantica"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-172@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-172@wavy.seed' AND a.name = 'PSGSJ Annual Concert 2026 "Sacra  Cantica"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PSGSJ Annual Concert 2026 "Sacra  Cantica"', 'Music', 'Balai Resital Kertanegara, Kota Adm. Jakarta Selatan', '2026-02-28 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AHH8BLB9Y3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PSGSJ Annual Concert 2026 "Sacra  Cantica"'
WHERE o.email = 'demo.scrape-172@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PSGSJ Annual Concert 2026 "Sacra  Cantica"' AND ev.venue = 'Balai Resital Kertanegara, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 276
FROM events ev WHERE ev.title = 'PSGSJ Annual Concert 2026 "Sacra  Cantica"' AND ev.venue = 'Balai Resital Kertanegara, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bintang Serang Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bintang Serang Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-173@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-173@wavy.seed' AND a.name = 'Bintang Serang Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bintang Serang Festival', 'Music', 'Alun - Alun Barat Kota Serang, Kab. Serang', '2026-03-01 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0IX1OL3JJ7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bintang Serang Festival'
WHERE o.email = 'demo.scrape-173@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bintang Serang Festival' AND ev.venue = 'Alun - Alun Barat Kota Serang, Kab. Serang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 29
FROM events ev WHERE ev.title = 'Bintang Serang Festival' AND ev.venue = 'Alun - Alun Barat Kota Serang, Kab. Serang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRITUAL (Accoustic Set) JAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRITUAL (Accoustic Set) JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-174@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-174@wavy.seed' AND a.name = 'SPIRITUAL (Accoustic Set) JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRITUAL (Accoustic Set) JAKARTA', 'Music', 'BAGI KOPI CAWANG, Kota Adm. Jakarta Timur', '2026-03-06 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/YIS0877G73.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRITUAL (Accoustic Set) JAKARTA'
WHERE o.email = 'demo.scrape-174@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) JAKARTA' AND ev.venue = 'BAGI KOPI CAWANG, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 242
FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) JAKARTA' AND ev.venue = 'BAGI KOPI CAWANG, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Stage Of Architecture
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Stage Of Architecture', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-175@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-175@wavy.seed' AND a.name = 'Stage Of Architecture');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Stage Of Architecture', 'Music', 'Stadion Mandala Krida, Kab. Sleman', '2026-03-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/04KKZ6KITY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Stage Of Architecture'
WHERE o.email = 'demo.scrape-175@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Stage Of Architecture' AND ev.venue = 'Stadion Mandala Krida, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 145
FROM events ev WHERE ev.title = 'Stage Of Architecture' AND ev.venue = 'Stadion Mandala Krida, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CHARITY CONCERT PUSAKATA & SOENJI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CHARITY CONCERT PUSAKATA & SOENJI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-176@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-176@wavy.seed' AND a.name = 'CHARITY CONCERT PUSAKATA & SOENJI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CHARITY CONCERT PUSAKATA & SOENJI', 'Music', 'JNM Bloc Yogyakarta, Kota Yogyakarta', '2026-03-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZZV2064ZOL.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CHARITY CONCERT PUSAKATA & SOENJI'
WHERE o.email = 'demo.scrape-176@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CHARITY CONCERT PUSAKATA & SOENJI' AND ev.venue = 'JNM Bloc Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 119000, 500, 68
FROM events ev WHERE ev.title = 'CHARITY CONCERT PUSAKATA & SOENJI' AND ev.venue = 'JNM Bloc Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ramadhan Sale 2026 Local Movement Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ramadhan Sale 2026 Local Movement Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-177@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-177@wavy.seed' AND a.name = 'Ramadhan Sale 2026 Local Movement Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ramadhan Sale 2026 Local Movement Festival', 'Music', 'Mitra 10 Cibinong Bogor, Kota Bogor', '2026-03-11 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SS9WBPEP45.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ramadhan Sale 2026 Local Movement Festival'
WHERE o.email = 'demo.scrape-177@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ramadhan Sale 2026 Local Movement Festival' AND ev.venue = 'Mitra 10 Cibinong Bogor, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 42000, 500, 221
FROM events ev WHERE ev.title = 'Ramadhan Sale 2026 Local Movement Festival' AND ev.venue = 'Mitra 10 Cibinong Bogor, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRITUAL (Accoustic Set) BANDUNG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRITUAL (Accoustic Set) BANDUNG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-174@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-174@wavy.seed' AND a.name = 'SPIRITUAL (Accoustic Set) BANDUNG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRITUAL (Accoustic Set) BANDUNG', 'Music', 'ROOFTOP COFFEE BTM, Kota Bandung', '2026-03-13 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/COVXO1LSK2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRITUAL (Accoustic Set) BANDUNG'
WHERE o.email = 'demo.scrape-174@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) BANDUNG' AND ev.venue = 'ROOFTOP COFFEE BTM, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 242
FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) BANDUNG' AND ev.venue = 'ROOFTOP COFFEE BTM, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sore Simpel - Secepat Mungkin Berbuka
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sore Simpel - Secepat Mungkin Berbuka', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-58@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-58@wavy.seed' AND a.name = 'Sore Simpel - Secepat Mungkin Berbuka');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sore Simpel - Secepat Mungkin Berbuka', 'Music', 'Lokananta Surakarta, Kota Surakarta', '2026-03-13 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CRDYNQJXLC.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sore Simpel - Secepat Mungkin Berbuka'
WHERE o.email = 'demo.scrape-58@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sore Simpel - Secepat Mungkin Berbuka' AND ev.venue = 'Lokananta Surakarta, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 144
FROM events ev WHERE ev.title = 'Sore Simpel - Secepat Mungkin Berbuka' AND ev.venue = 'Lokananta Surakarta, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRITUAL (Accoustic Set) YOGYAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRITUAL (Accoustic Set) YOGYAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'SPIRITUAL (Accoustic Set) YOGYAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRITUAL (Accoustic Set) YOGYAKARTA', 'Music', 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta', '2026-03-15 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/M0O7NIZWPZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRITUAL (Accoustic Set) YOGYAKARTA'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) YOGYAKARTA' AND ev.venue = 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 23
FROM events ev WHERE ev.title = 'SPIRITUAL (Accoustic Set) YOGYAKARTA' AND ev.venue = 'Pendopo Ajiyasa, JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Vigorphoria
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Vigorphoria', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-160@wavy.seed' AND a.name = 'Vigorphoria');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Vigorphoria', 'Music', 'Lubuk Linggau, Kota Lubuk Linggau', '2026-03-28 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HPP0ZS7105.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Vigorphoria'
WHERE o.email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Vigorphoria' AND ev.venue = 'Lubuk Linggau, Kota Lubuk Linggau');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 220
FROM events ev WHERE ev.title = 'Vigorphoria' AND ev.venue = 'Lubuk Linggau, Kota Lubuk Linggau'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BOGOR BRUTAL FEST 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BOGOR BRUTAL FEST 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-178@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-178@wavy.seed' AND a.name = 'BOGOR BRUTAL FEST 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BOGOR BRUTAL FEST 4', 'Music', 'Lap. Simpati Raya, Jampang Bogor, Kab. Bogor', '2026-03-28 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HE6EL1ZX73.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BOGOR BRUTAL FEST 4'
WHERE o.email = 'demo.scrape-178@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BOGOR BRUTAL FEST 4' AND ev.venue = 'Lap. Simpati Raya, Jampang Bogor, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 174
FROM events ev WHERE ev.title = 'BOGOR BRUTAL FEST 4' AND ev.venue = 'Lap. Simpati Raya, Jampang Bogor, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MALANG VIOLENCE PRESENT VOL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MALANG VIOLENCE PRESENT VOL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-179@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-179@wavy.seed' AND a.name = 'MALANG VIOLENCE PRESENT VOL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MALANG VIOLENCE PRESENT VOL', 'Music', 'SM BADMINTON BALAI RW 17, Kota Malang', '2026-03-29 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AKMZCKXXXI.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MALANG VIOLENCE PRESENT VOL'
WHERE o.email = 'demo.scrape-179@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MALANG VIOLENCE PRESENT VOL' AND ev.venue = 'SM BADMINTON BALAI RW 17, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 267
FROM events ev WHERE ev.title = 'MALANG VIOLENCE PRESENT VOL' AND ev.venue = 'SM BADMINTON BALAI RW 17, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ziforia Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ziforia Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-180@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-180@wavy.seed' AND a.name = 'Ziforia Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ziforia Festival', 'Music', 'Lap. M10 Lindung Jaya, Kayu Aro, Kab. Kerinci', '2026-03-29 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XGTSTX1GXD.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ziforia Festival'
WHERE o.email = 'demo.scrape-180@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ziforia Festival' AND ev.venue = 'Lap. M10 Lindung Jaya, Kayu Aro, Kab. Kerinci');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 58000, 500, 20
FROM events ev WHERE ev.title = 'Ziforia Festival' AND ev.venue = 'Lap. M10 Lindung Jaya, Kayu Aro, Kab. Kerinci'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simpang Singgah Special Showcase
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simpang Singgah Special Showcase', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-181@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-181@wavy.seed' AND a.name = 'Simpang Singgah Special Showcase');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simpang Singgah Special Showcase', 'Music', 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta', '2026-04-04 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2823VARR5H.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simpang Singgah Special Showcase'
WHERE o.email = 'demo.scrape-181@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simpang Singgah Special Showcase' AND ev.venue = 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 153
FROM events ev WHERE ev.title = 'Simpang Singgah Special Showcase' AND ev.venue = 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spesial Showcase Anniversary #17 Superiots
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spesial Showcase Anniversary #17 Superiots', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-182@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-182@wavy.seed' AND a.name = 'Spesial Showcase Anniversary #17 Superiots');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spesial Showcase Anniversary #17 Superiots', 'Music', 'Bogor, Kota Bogor', '2026-04-04 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CZ8FAQKD21.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spesial Showcase Anniversary #17 Superiots'
WHERE o.email = 'demo.scrape-182@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spesial Showcase Anniversary #17 Superiots' AND ev.venue = 'Bogor, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 26
FROM events ev WHERE ev.title = 'Spesial Showcase Anniversary #17 Superiots' AND ev.venue = 'Bogor, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BESTIEVAL TANGERANG VOL.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BESTIEVAL TANGERANG VOL.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'BESTIEVAL TANGERANG VOL.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BESTIEVAL TANGERANG VOL.2', 'Music', 'Mall Balekota Tangerang, Kab. Tangerang', '2026-04-04 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/1D5Q83RVYY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BESTIEVAL TANGERANG VOL.2'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BESTIEVAL TANGERANG VOL.2' AND ev.venue = 'Mall Balekota Tangerang, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 33
FROM events ev WHERE ev.title = 'BESTIEVAL TANGERANG VOL.2' AND ev.venue = 'Mall Balekota Tangerang, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Semua Gembira Fest #2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Semua Gembira Fest #2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-183@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-183@wavy.seed' AND a.name = 'Semua Gembira Fest #2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Semua Gembira Fest #2', 'Music', 'Stadiun Kridosono Yogyakarta, Kota Yogyakarta', '2026-04-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DP87HXBF5Q.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Semua Gembira Fest #2'
WHERE o.email = 'demo.scrape-183@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Semua Gembira Fest #2' AND ev.venue = 'Stadiun Kridosono Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 120000, 500, 289
FROM events ev WHERE ev.title = 'Semua Gembira Fest #2' AND ev.venue = 'Stadiun Kridosono Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Grand Opening Centro Roast Space
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Grand Opening Centro Roast Space', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-184@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-184@wavy.seed' AND a.name = 'Grand Opening Centro Roast Space');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Grand Opening Centro Roast Space', 'Music', 'Centro Roast Space, Kota Tasikmalaya', '2026-04-05 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SAGONQ4ANE.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Grand Opening Centro Roast Space'
WHERE o.email = 'demo.scrape-184@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Grand Opening Centro Roast Space' AND ev.venue = 'Centro Roast Space, Kota Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 22
FROM events ev WHERE ev.title = 'Grand Opening Centro Roast Space' AND ev.venue = 'Centro Roast Space, Kota Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Carry On Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Carry On Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-185@wavy.seed' AND a.name = 'Carry On Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Carry On Fest', 'Music', 'Pfn Heritage, Kota Adm. Jakarta Timur', '2026-04-10 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LP2XXKGXN0.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Carry On Fest'
WHERE o.email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Carry On Fest' AND ev.venue = 'Pfn Heritage, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 35
FROM events ev WHERE ev.title = 'Carry On Fest' AND ev.venue = 'Pfn Heritage, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Fhandika Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Fhandika Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-186@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-186@wavy.seed' AND a.name = 'Fhandika Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Fhandika Fest', 'Music', 'Open Stage Taman Budaya Aceh, Kota Banda Aceh, Aceh, Kota Banda Aceh', '2026-04-11 20:15:01'::timestamptz, 'https://assets.artatix.co.id/event/VN85R0S2PD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Fhandika Fest'
WHERE o.email = 'demo.scrape-186@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Fhandika Fest' AND ev.venue = 'Open Stage Taman Budaya Aceh, Kota Banda Aceh, Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 248
FROM events ev WHERE ev.title = 'Fhandika Fest' AND ev.venue = 'Open Stage Taman Budaya Aceh, Kota Banda Aceh, Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Unleashed Showcase "Pasto"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Unleashed Showcase "Pasto"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-187@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-187@wavy.seed' AND a.name = 'Unleashed Showcase "Pasto"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Unleashed Showcase "Pasto"', 'Music', 'Karnaval Thamrin, Kota Adm. Jakarta Selatan', '2026-04-11 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/PSSDE804EW.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Unleashed Showcase "Pasto"'
WHERE o.email = 'demo.scrape-187@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Unleashed Showcase "Pasto"' AND ev.venue = 'Karnaval Thamrin, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 231
FROM events ev WHERE ev.title = 'Unleashed Showcase "Pasto"' AND ev.venue = 'Karnaval Thamrin, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SUGENGDALU LUMAJANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SUGENGDALU LUMAJANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-188@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-188@wavy.seed' AND a.name = 'SUGENGDALU LUMAJANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SUGENGDALU LUMAJANG', 'Music', 'Stadion Semeru Lumajang, Kab. Lumajang', '2026-04-11 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/I3X5KSIEZH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SUGENGDALU LUMAJANG'
WHERE o.email = 'demo.scrape-188@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SUGENGDALU LUMAJANG' AND ev.venue = 'Stadion Semeru Lumajang, Kab. Lumajang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 74
FROM events ev WHERE ev.title = 'SUGENGDALU LUMAJANG' AND ev.venue = 'Stadion Semeru Lumajang, Kab. Lumajang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Reang Fest Indramayu Vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Reang Fest Indramayu Vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-189@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-189@wavy.seed' AND a.name = 'Reang Fest Indramayu Vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Reang Fest Indramayu Vol 2', 'Music', 'stadion tridaya indramayu, Kab. Indramayu', '2026-04-11 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0ODEW0V8EY.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Reang Fest Indramayu Vol 2'
WHERE o.email = 'demo.scrape-189@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Reang Fest Indramayu Vol 2' AND ev.venue = 'stadion tridaya indramayu, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 267
FROM events ev WHERE ev.title = 'Reang Fest Indramayu Vol 2' AND ev.venue = 'stadion tridaya indramayu, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Domination Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Domination Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-190@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-190@wavy.seed' AND a.name = 'Domination Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Domination Fest', 'Music', 'Multifunction Sport Hall, Balai Jagong Kudus, Kab. Kudus', '2026-04-12 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TY286ROQ16.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Domination Fest'
WHERE o.email = 'demo.scrape-190@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Domination Fest' AND ev.venue = 'Multifunction Sport Hall, Balai Jagong Kudus, Kab. Kudus');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 180
FROM events ev WHERE ev.title = 'Domination Fest' AND ev.venue = 'Multifunction Sport Hall, Balai Jagong Kudus, Kab. Kudus'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BLACKEN RITUAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BLACKEN RITUAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-191@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-191@wavy.seed' AND a.name = 'BLACKEN RITUAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BLACKEN RITUAL', 'Music', 'TOBA DREAM JAKARTA, INDONESIA, Kota Adm. Jakarta Pusat', '2026-04-12 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VLYSAQP1ER.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BLACKEN RITUAL'
WHERE o.email = 'demo.scrape-191@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BLACKEN RITUAL' AND ev.venue = 'TOBA DREAM JAKARTA, INDONESIA, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 173
FROM events ev WHERE ev.title = 'BLACKEN RITUAL' AND ev.venue = 'TOBA DREAM JAKARTA, INDONESIA, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NO WAY OUT VOL 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NO WAY OUT VOL 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'NO WAY OUT VOL 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO WAY OUT VOL 4', 'Music', 'TBA, Kota Bandung', '2026-04-14 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KVT5RBXBGX.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO WAY OUT VOL 4'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO WAY OUT VOL 4' AND ev.venue = 'TBA, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 288
FROM events ev WHERE ev.title = 'NO WAY OUT VOL 4' AND ev.venue = 'TBA, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Laidback Journey Vol 76
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Laidback Journey Vol 76', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-192@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-192@wavy.seed' AND a.name = 'Laidback Journey Vol 76');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Laidback Journey Vol 76', 'Music', 'JRNY Coffee & Records, Kab. Sleman', '2026-04-16 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6LFZXVLMCW.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Laidback Journey Vol 76'
WHERE o.email = 'demo.scrape-192@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Laidback Journey Vol 76' AND ev.venue = 'JRNY Coffee & Records, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 86
FROM events ev WHERE ev.title = 'Laidback Journey Vol 76' AND ev.venue = 'JRNY Coffee & Records, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Papua Van Java - Sorong
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Papua Van Java - Sorong', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-193@wavy.seed' AND a.name = 'Papua Van Java - Sorong');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Papua Van Java - Sorong', 'Music', 'Alun Alun, Aimas, Sorong, Kab. Sorong', '2026-04-18 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9DS02MP5BW.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Papua Van Java - Sorong'
WHERE o.email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Papua Van Java - Sorong' AND ev.venue = 'Alun Alun, Aimas, Sorong, Kab. Sorong');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 260000, 500, 59
FROM events ev WHERE ev.title = 'Papua Van Java - Sorong' AND ev.venue = 'Alun Alun, Aimas, Sorong, Kab. Sorong'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Young Blood Return #2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Young Blood Return #2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-77@wavy.seed' AND a.name = 'Young Blood Return #2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Young Blood Return #2', 'Music', 'Mall Bekasi Junction, UG FLOOR, Kota Bekasi', '2026-04-18 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TOIDUNWZ3T.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Young Blood Return #2'
WHERE o.email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Young Blood Return #2' AND ev.venue = 'Mall Bekasi Junction, UG FLOOR, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 31
FROM events ev WHERE ev.title = 'Young Blood Return #2' AND ev.venue = 'Mall Bekasi Junction, UG FLOOR, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Berisix
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Berisix', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-194@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-194@wavy.seed' AND a.name = 'Berisix');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Berisix', 'Music', 'PRESTON HALL, Kota Malang', '2026-04-18 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TLY00YWYMU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Berisix'
WHERE o.email = 'demo.scrape-194@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Berisix' AND ev.venue = 'PRESTON HALL, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 172
FROM events ev WHERE ev.title = 'Berisix' AND ev.venue = 'PRESTON HALL, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Backyard Session Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Backyard Session Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-195@wavy.seed' AND a.name = 'Backyard Session Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Backyard Session Vol.1', 'Music', 'Inverse HQ, Jl. Raya Tenggilis No.25, Kendangsari, Kec. Tenggilis Mejoyo, Surabaya., Kota Surabaya', '2026-04-18 02:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1APHM3I91Z.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Backyard Session Vol.1'
WHERE o.email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Backyard Session Vol.1' AND ev.venue = 'Inverse HQ, Jl. Raya Tenggilis No.25, Kendangsari, Kec. Tenggilis Mejoyo, Surabaya., Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 35
FROM events ev WHERE ev.title = 'Backyard Session Vol.1' AND ev.venue = 'Inverse HQ, Jl. Raya Tenggilis No.25, Kendangsari, Kec. Tenggilis Mejoyo, Surabaya., Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TerAmbyar Sukabumi 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TerAmbyar Sukabumi 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-196@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-196@wavy.seed' AND a.name = 'TerAmbyar Sukabumi 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TerAmbyar Sukabumi 2026', 'Music', 'Stadion Surya Kencana, Sukabumi, Kota Sukabumi', '2026-04-19 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/THCC7O1R4S.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TerAmbyar Sukabumi 2026'
WHERE o.email = 'demo.scrape-196@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TerAmbyar Sukabumi 2026' AND ev.venue = 'Stadion Surya Kencana, Sukabumi, Kota Sukabumi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 115000, 500, 98
FROM events ev WHERE ev.title = 'TerAmbyar Sukabumi 2026' AND ev.venue = 'Stadion Surya Kencana, Sukabumi, Kota Sukabumi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SRIT Vol. 4 RISE TO GLORY
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SRIT Vol. 4 RISE TO GLORY', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-197@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-197@wavy.seed' AND a.name = 'SRIT Vol. 4 RISE TO GLORY');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SRIT Vol. 4 RISE TO GLORY', 'Music', 'Lap. Gajah Mada Lamongan, Kab. Lamongan', '2026-04-20 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0D1BK1L3G8.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SRIT Vol. 4 RISE TO GLORY'
WHERE o.email = 'demo.scrape-197@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SRIT Vol. 4 RISE TO GLORY' AND ev.venue = 'Lap. Gajah Mada Lamongan, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 131
FROM events ev WHERE ev.title = 'SRIT Vol. 4 RISE TO GLORY' AND ev.venue = 'Lap. Gajah Mada Lamongan, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS YK  FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS YK  FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-198@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-198@wavy.seed' AND a.name = 'MADNESS YK  FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS YK  FEST 2026', 'Music', 'PARKING LOT MANDALA KRIDA STADIUM, Kota Yogyakarta', '2026-04-23 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BLX0SPYFV3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS YK  FEST 2026'
WHERE o.email = 'demo.scrape-198@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS YK  FEST 2026' AND ev.venue = 'PARKING LOT MANDALA KRIDA STADIUM, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 4
FROM events ev WHERE ev.title = 'MADNESS YK  FEST 2026' AND ev.venue = 'PARKING LOT MANDALA KRIDA STADIUM, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SYAFANA FESTIVAL 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SYAFANA FESTIVAL 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-199@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-199@wavy.seed' AND a.name = 'SYAFANA FESTIVAL 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SYAFANA FESTIVAL 2026', 'Music', 'Syafana Islamic School Secondary BSD, Kab. Tangerang', '2026-04-24 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F1Y6GSTRCB.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SYAFANA FESTIVAL 2026'
WHERE o.email = 'demo.scrape-199@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SYAFANA FESTIVAL 2026' AND ev.venue = 'Syafana Islamic School Secondary BSD, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 227
FROM events ev WHERE ev.title = 'SYAFANA FESTIVAL 2026' AND ev.venue = 'Syafana Islamic School Secondary BSD, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spectaphoria Vol. 2 - Galaxy
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spectaphoria Vol. 2 - Galaxy', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-200@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-200@wavy.seed' AND a.name = 'Spectaphoria Vol. 2 - Galaxy');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spectaphoria Vol. 2 - Galaxy', 'Music', 'Pantai Wisata Tanjung Pendam , Belitung, Kab. Belitung', '2026-04-25 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RF9SES5EU8.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spectaphoria Vol. 2 - Galaxy'
WHERE o.email = 'demo.scrape-200@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spectaphoria Vol. 2 - Galaxy' AND ev.venue = 'Pantai Wisata Tanjung Pendam , Belitung, Kab. Belitung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 100
FROM events ev WHERE ev.title = 'Spectaphoria Vol. 2 - Galaxy' AND ev.venue = 'Pantai Wisata Tanjung Pendam , Belitung, Kab. Belitung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Endless Grave II
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Endless Grave II', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-201@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-201@wavy.seed' AND a.name = 'Endless Grave II');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Endless Grave II', 'Music', 'Kenes Social House, Kota Yogyakarta', '2026-04-25 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RNR213S8DX.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Endless Grave II'
WHERE o.email = 'demo.scrape-201@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Endless Grave II' AND ev.venue = 'Kenes Social House, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 123
FROM events ev WHERE ev.title = 'Endless Grave II' AND ev.venue = 'Kenes Social House, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- WTMF goes to Jayapura
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'WTMF goes to Jayapura', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-202@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-202@wavy.seed' AND a.name = 'WTMF goes to Jayapura');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'WTMF goes to Jayapura', 'Music', 'Gor Cendrawasih, Kota Jayapura', '2026-04-25 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V8CHKGGNOM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'WTMF goes to Jayapura'
WHERE o.email = 'demo.scrape-202@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'WTMF goes to Jayapura' AND ev.venue = 'Gor Cendrawasih, Kota Jayapura');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 146
FROM events ev WHERE ev.title = 'WTMF goes to Jayapura' AND ev.venue = 'Gor Cendrawasih, Kota Jayapura'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Electric in Beats
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Electric in Beats', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-203@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-203@wavy.seed' AND a.name = 'Electric in Beats');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Electric in Beats', 'Music', 'Taman Laswi Heritage, Kota Bandung', '2026-04-25 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/17LP0PG7B4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Electric in Beats'
WHERE o.email = 'demo.scrape-203@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Electric in Beats' AND ev.venue = 'Taman Laswi Heritage, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 99
FROM events ev WHERE ev.title = 'Electric in Beats' AND ev.venue = 'Taman Laswi Heritage, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Darah Biru Musik Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Darah Biru Musik Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-204@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-204@wavy.seed' AND a.name = 'Darah Biru Musik Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Darah Biru Musik Festival', 'Music', 'Lap Undar Jombang, Kab. Jombang', '2026-04-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2G9PCW10JG.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Darah Biru Musik Festival'
WHERE o.email = 'demo.scrape-204@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Darah Biru Musik Festival' AND ev.venue = 'Lap Undar Jombang, Kab. Jombang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 92
FROM events ev WHERE ev.title = 'Darah Biru Musik Festival' AND ev.venue = 'Lap Undar Jombang, Kab. Jombang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Senada/i Phase 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Senada/i Phase 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-205@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-205@wavy.seed' AND a.name = 'Senada/i Phase 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Senada/i Phase 1', 'Music', 'Surabaya, Kota Surabaya', '2026-04-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V5XLTNTU7L.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Senada/i Phase 1'
WHERE o.email = 'demo.scrape-205@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Senada/i Phase 1' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 175
FROM events ev WHERE ev.title = 'Senada/i Phase 1' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bandung Pop Calling Vol.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bandung Pop Calling Vol.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-206@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-206@wavy.seed' AND a.name = 'Bandung Pop Calling Vol.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bandung Pop Calling Vol.2', 'Music', 'Ampitheater UPI Bandung, Kota Bandung', '2026-04-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7YVZPCIE2U.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bandung Pop Calling Vol.2'
WHERE o.email = 'demo.scrape-206@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bandung Pop Calling Vol.2' AND ev.venue = 'Ampitheater UPI Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 98
FROM events ev WHERE ev.title = 'Bandung Pop Calling Vol.2' AND ev.venue = 'Ampitheater UPI Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Veteran Cup Festival 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Veteran Cup Festival 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-207@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-207@wavy.seed' AND a.name = 'Veteran Cup Festival 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Veteran Cup Festival 2026', 'Music', 'Lapangan Parkir Mandala Krida Yogyakarta, Kota Yogyakarta', '2026-04-25 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SISWGLJTZD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Veteran Cup Festival 2026'
WHERE o.email = 'demo.scrape-207@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Veteran Cup Festival 2026' AND ev.venue = 'Lapangan Parkir Mandala Krida Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 251
FROM events ev WHERE ev.title = 'Veteran Cup Festival 2026' AND ev.venue = 'Lapangan Parkir Mandala Krida Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Closing Ceremony Glarisa Vol. 9
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Closing Ceremony Glarisa Vol. 9', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-208@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-208@wavy.seed' AND a.name = 'Closing Ceremony Glarisa Vol. 9');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Closing Ceremony Glarisa Vol. 9', 'Music', 'Sekolah Kharisma Bangsa, Kota Tangerang Selatan', '2026-04-25 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W4E3JBAAWO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Closing Ceremony Glarisa Vol. 9'
WHERE o.email = 'demo.scrape-208@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Closing Ceremony Glarisa Vol. 9' AND ev.venue = 'Sekolah Kharisma Bangsa, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 4
FROM events ev WHERE ev.title = 'Closing Ceremony Glarisa Vol. 9' AND ev.venue = 'Sekolah Kharisma Bangsa, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The 16th Music Gallery
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The 16th Music Gallery', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-209@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-209@wavy.seed' AND a.name = 'The 16th Music Gallery');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The 16th Music Gallery', 'Music', 'STADION MADYA B, GBK SPORTS COMPLEX, Kota Adm. Jakarta Selatan', '2026-04-25 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KYQ45FC0H1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The 16th Music Gallery'
WHERE o.email = 'demo.scrape-209@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The 16th Music Gallery' AND ev.venue = 'STADION MADYA B, GBK SPORTS COMPLEX, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 277
FROM events ev WHERE ev.title = 'The 16th Music Gallery' AND ev.venue = 'STADION MADYA B, GBK SPORTS COMPLEX, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Party Lupa Pulang Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Party Lupa Pulang Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-210@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-210@wavy.seed' AND a.name = 'Party Lupa Pulang Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Party Lupa Pulang Vol.1', 'Music', 'Krapela, Kota Adm. Jakarta Selatan', '2026-04-26 19:30:01'::timestamptz, 'https://assets.artatix.co.id/event/0FZ1VHW0LI.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Party Lupa Pulang Vol.1'
WHERE o.email = 'demo.scrape-210@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Party Lupa Pulang Vol.1' AND ev.venue = 'Krapela, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 190
FROM events ev WHERE ev.title = 'Party Lupa Pulang Vol.1' AND ev.venue = 'Krapela, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BATTLE PERFORMANCE VOL. 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BATTLE PERFORMANCE VOL. 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-153@wavy.seed' AND a.name = 'BATTLE PERFORMANCE VOL. 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BATTLE PERFORMANCE VOL. 2', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-04-26 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GDK9YLWO1E.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BATTLE PERFORMANCE VOL. 2'
WHERE o.email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BATTLE PERFORMANCE VOL. 2' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 69500, 500, 149
FROM events ev WHERE ev.title = 'BATTLE PERFORMANCE VOL. 2' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MAN OSMAN "SOMEDAY IS TODAY CONCERT"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-102@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-102@wavy.seed' AND a.name = 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"', 'Music', 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta', '2026-04-30 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FC47UEZAO4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"'
WHERE o.email = 'demo.scrape-102@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"' AND ev.venue = 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 116
FROM events ev WHERE ev.title = 'MAN OSMAN "SOMEDAY IS TODAY CONCERT"' AND ev.venue = 'Teater Arena, Taman Budaya Jawa Tengah, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 29
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 29', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 29');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 29', 'Music', 'Warung Abang Awak Yogyakarta, Kab. Sleman', '2026-04-30 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CCJ3NMNGU4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 29'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 29' AND ev.venue = 'Warung Abang Awak Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol 29' AND ev.venue = 'Warung Abang Awak Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BIGBAM FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BIGBAM FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-211@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-211@wavy.seed' AND a.name = 'BIGBAM FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BIGBAM FEST 2026', 'Music', 'Lap parkir Story Mount, Kab. Berau', '2026-04-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1BUMXKTJLS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BIGBAM FEST 2026'
WHERE o.email = 'demo.scrape-211@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BIGBAM FEST 2026' AND ev.venue = 'Lap parkir Story Mount, Kab. Berau');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 239000, 500, 173
FROM events ev WHERE ev.title = 'BIGBAM FEST 2026' AND ev.venue = 'Lap parkir Story Mount, Kab. Berau'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THE ALTAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THE ALTAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-84@wavy.seed' AND a.name = 'THE ALTAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THE ALTAR', 'Music', 'Lima Dua Coffe Bar, Kota Adm. Jakarta Selatan', '2026-05-01 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VK1MHBEF2Z.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THE ALTAR'
WHERE o.email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THE ALTAR' AND ev.venue = 'Lima Dua Coffe Bar, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 122
FROM events ev WHERE ev.title = 'THE ALTAR' AND ev.venue = 'Lima Dua Coffe Bar, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sonic Bloom III
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sonic Bloom III', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-212@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-212@wavy.seed' AND a.name = 'Sonic Bloom III');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sonic Bloom III', 'Music', 'Basement Transmart Yogyakarta, Kab. Sleman', '2026-05-02 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/E44UO06QTS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sonic Bloom III'
WHERE o.email = 'demo.scrape-212@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sonic Bloom III' AND ev.venue = 'Basement Transmart Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 116
FROM events ev WHERE ev.title = 'Sonic Bloom III' AND ev.venue = 'Basement Transmart Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Neverland Malang 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Neverland Malang 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-213@wavy.seed' AND a.name = 'Neverland Malang 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Neverland Malang 2026', 'Music', 'Lapangan Rampal, Kota Malang', '2026-05-02 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J0U33V9CBT.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Neverland Malang 2026'
WHERE o.email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Neverland Malang 2026' AND ev.venue = 'Lapangan Rampal, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 109
FROM events ev WHERE ev.title = 'Neverland Malang 2026' AND ev.venue = 'Lapangan Rampal, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HIPHOP SORINGIN FESTIVAL  2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HIPHOP SORINGIN FESTIVAL  2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-214@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-214@wavy.seed' AND a.name = 'HIPHOP SORINGIN FESTIVAL  2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HIPHOP SORINGIN FESTIVAL  2026', 'Music', 'JNM BLOC, Kota Yogyakarta', '2026-05-02 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YYERKN5Y4G.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIPHOP SORINGIN FESTIVAL  2026'
WHERE o.email = 'demo.scrape-214@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIPHOP SORINGIN FESTIVAL  2026' AND ev.venue = 'JNM BLOC, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 82
FROM events ev WHERE ev.title = 'HIPHOP SORINGIN FESTIVAL  2026' AND ev.venue = 'JNM BLOC, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dieng Java Invasion 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dieng Java Invasion 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-215@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-215@wavy.seed' AND a.name = 'Dieng Java Invasion 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dieng Java Invasion 2026', 'Music', 'Gedung Pandawa Dieng Kulon kec. Batur Kab. Banjarnegara, Kab. Banjarnegara', '2026-05-02 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GBY51F894Q.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dieng Java Invasion 2026'
WHERE o.email = 'demo.scrape-215@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dieng Java Invasion 2026' AND ev.venue = 'Gedung Pandawa Dieng Kulon kec. Batur Kab. Banjarnegara, Kab. Banjarnegara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 245
FROM events ev WHERE ev.title = 'Dieng Java Invasion 2026' AND ev.venue = 'Gedung Pandawa Dieng Kulon kec. Batur Kab. Banjarnegara, Kab. Banjarnegara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS TOUR 2026 (TASIKMALAYA)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS TOUR 2026 (TASIKMALAYA)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MADNESS TOUR 2026 (TASIKMALAYA)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS TOUR 2026 (TASIKMALAYA)', 'Music', 'Tasikmalaya, Kota Tasikmalaya', '2026-05-03 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6GX0D4LAJ1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS TOUR 2026 (TASIKMALAYA)'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (TASIKMALAYA)' AND ev.venue = 'Tasikmalaya, Kota Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (TASIKMALAYA)' AND ev.venue = 'Tasikmalaya, Kota Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kecil Tapi Party 2026 - Soreang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kecil Tapi Party 2026 - Soreang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Kecil Tapi Party 2026 - Soreang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kecil Tapi Party 2026 - Soreang', 'Music', 'Archery Field Si Jalak Harupat, Soreang, Kab. Bandung', '2026-05-03 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V64JF6FIJJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kecil Tapi Party 2026 - Soreang'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Soreang' AND ev.venue = 'Archery Field Si Jalak Harupat, Soreang, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 237
FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Soreang' AND ev.venue = 'Archery Field Si Jalak Harupat, Soreang, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Take me Home Tour 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Take me Home Tour 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-192@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-192@wavy.seed' AND a.name = 'Take me Home Tour 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Take me Home Tour 2026', 'Music', 'JRNY Coffee & Records, Kota Yogyakarta', '2026-05-06 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/S03N41P6WZ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Take me Home Tour 2026'
WHERE o.email = 'demo.scrape-192@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Take me Home Tour 2026' AND ev.venue = 'JRNY Coffee & Records, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 156
FROM events ev WHERE ev.title = 'Take me Home Tour 2026' AND ev.venue = 'JRNY Coffee & Records, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Biyasa Blastation
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Biyasa Blastation', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-216@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-216@wavy.seed' AND a.name = 'Biyasa Blastation');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Biyasa Blastation', 'Music', 'Biyasa Cafe & Billiard, Kota Jambi', '2026-05-08 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/S1NQ2OURB9.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Biyasa Blastation'
WHERE o.email = 'demo.scrape-216@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Biyasa Blastation' AND ev.venue = 'Biyasa Cafe & Billiard, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 278
FROM events ev WHERE ev.title = 'Biyasa Blastation' AND ev.venue = 'Biyasa Cafe & Billiard, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Fafest - Koplo Roots & Culture
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Fafest - Koplo Roots & Culture', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-19@wavy.seed' AND a.name = 'Fafest - Koplo Roots & Culture');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Fafest - Koplo Roots & Culture', 'Music', 'Grand Kamala Lagoon, Kota Bekasi, Kota Bekasi', '2026-05-08 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OGZWPD5PE7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Fafest - Koplo Roots & Culture'
WHERE o.email = 'demo.scrape-19@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Fafest - Koplo Roots & Culture' AND ev.venue = 'Grand Kamala Lagoon, Kota Bekasi, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 287
FROM events ev WHERE ev.title = 'Fafest - Koplo Roots & Culture' AND ev.venue = 'Grand Kamala Lagoon, Kota Bekasi, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MIMBAR JALANAN MEDAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MIMBAR JALANAN MEDAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-217@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-217@wavy.seed' AND a.name = 'MIMBAR JALANAN MEDAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MIMBAR JALANAN MEDAN', 'Music', 'TBA, Kota Medan', '2026-05-09 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J2LPQNBHO4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MIMBAR JALANAN MEDAN'
WHERE o.email = 'demo.scrape-217@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MIMBAR JALANAN MEDAN' AND ev.venue = 'TBA, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 41
FROM events ev WHERE ev.title = 'MIMBAR JALANAN MEDAN' AND ev.venue = 'TBA, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Onside Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Onside Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-218@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-218@wavy.seed' AND a.name = 'Onside Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Onside Vol.1', 'Music', 'Friend At Hand Gubeng, Jl Raya Gubeng No.58, Kota Surabaya', '2026-05-09 16:30:01'::timestamptz, 'https://assets.artatix.co.id/event/QU8C43F2SS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Onside Vol.1'
WHERE o.email = 'demo.scrape-218@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Onside Vol.1' AND ev.venue = 'Friend At Hand Gubeng, Jl Raya Gubeng No.58, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 64
FROM events ev WHERE ev.title = 'Onside Vol.1' AND ev.venue = 'Friend At Hand Gubeng, Jl Raya Gubeng No.58, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Melangkah Bersama Vol . 8
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Melangkah Bersama Vol . 8', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-6@wavy.seed' AND a.name = 'Melangkah Bersama Vol . 8');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Melangkah Bersama Vol . 8', 'Music', 'Milli by Shaggydog, Kota Yogyakarta', '2026-05-09 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZHT0BWCS3N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Melangkah Bersama Vol . 8'
WHERE o.email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Melangkah Bersama Vol . 8' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 208
FROM events ev WHERE ev.title = 'Melangkah Bersama Vol . 8' AND ev.venue = 'Milli by Shaggydog, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Urban Discipline
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Urban Discipline', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-219@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-219@wavy.seed' AND a.name = 'Urban Discipline');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Urban Discipline', 'Music', 'Bekasi Junction, Kota Bekasi', '2026-05-09 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Z0KO7GTWZ2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Urban Discipline'
WHERE o.email = 'demo.scrape-219@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Urban Discipline' AND ev.venue = 'Bekasi Junction, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 7
FROM events ev WHERE ev.title = 'Urban Discipline' AND ev.venue = 'Bekasi Junction, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Anarclub Stage vol.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Anarclub Stage vol.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-220@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-220@wavy.seed' AND a.name = 'Anarclub Stage vol.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Anarclub Stage vol.2', 'Music', 'ST. BIER SETURAN, Kab. Sleman', '2026-05-09 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VX91G2DVE5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Anarclub Stage vol.2'
WHERE o.email = 'demo.scrape-220@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Anarclub Stage vol.2' AND ev.venue = 'ST. BIER SETURAN, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 260
FROM events ev WHERE ev.title = 'Anarclub Stage vol.2' AND ev.venue = 'ST. BIER SETURAN, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pentastix Mystical Pentas
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pentastix Mystical Pentas', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-221@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-221@wavy.seed' AND a.name = 'Pentastix Mystical Pentas');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pentastix Mystical Pentas', 'Music', 'Sentul Otopark, Kab. Bogor', '2026-05-09 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/D3ZXIG3QQZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pentastix Mystical Pentas'
WHERE o.email = 'demo.scrape-221@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pentastix Mystical Pentas' AND ev.venue = 'Sentul Otopark, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 83
FROM events ev WHERE ev.title = 'Pentastix Mystical Pentas' AND ev.venue = 'Sentul Otopark, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kecil Tapi Party 2026 - Kuningan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kecil Tapi Party 2026 - Kuningan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Kecil Tapi Party 2026 - Kuningan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kecil Tapi Party 2026 - Kuningan', 'Music', 'Open Space Gallery, Kab. Kuningan', '2026-05-10 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FL1X7QJRHJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kecil Tapi Party 2026 - Kuningan'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Kuningan' AND ev.venue = 'Open Space Gallery, Kab. Kuningan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 237
FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Kuningan' AND ev.venue = 'Open Space Gallery, Kab. Kuningan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FREEDOM CALL - LIVE IN JAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FREEDOM CALL - LIVE IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-222@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-222@wavy.seed' AND a.name = 'FREEDOM CALL - LIVE IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FREEDOM CALL - LIVE IN JAKARTA', 'Music', 'Toba Dream, Jl. Dr. Saharjo No. 90, Kota Adm. Jakarta Selatan', '2026-05-13 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SSHEY8S6NU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FREEDOM CALL - LIVE IN JAKARTA'
WHERE o.email = 'demo.scrape-222@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FREEDOM CALL - LIVE IN JAKARTA' AND ev.venue = 'Toba Dream, Jl. Dr. Saharjo No. 90, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 176
FROM events ev WHERE ev.title = 'FREEDOM CALL - LIVE IN JAKARTA' AND ev.venue = 'Toba Dream, Jl. Dr. Saharjo No. 90, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sulawesi Youth Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sulawesi Youth Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-223@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-223@wavy.seed' AND a.name = 'Sulawesi Youth Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sulawesi Youth Festival', 'Music', 'Makassar, Kota Makassar', '2026-05-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UQ1MZLTNSK.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sulawesi Youth Festival'
WHERE o.email = 'demo.scrape-223@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sulawesi Youth Festival' AND ev.venue = 'Makassar, Kota Makassar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 133000, 500, 179
FROM events ev WHERE ev.title = 'Sulawesi Youth Festival' AND ev.venue = 'Makassar, Kota Makassar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ULEG BAZAR KULINER SOLO 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ULEG BAZAR KULINER SOLO 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-224@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-224@wavy.seed' AND a.name = 'ULEG BAZAR KULINER SOLO 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ULEG BAZAR KULINER SOLO 2026', 'Music', 'Pamedan Pura Mangkunegaran, Kota Surakarta', '2026-05-14 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7JSCTSO7XQ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ULEG BAZAR KULINER SOLO 2026'
WHERE o.email = 'demo.scrape-224@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ULEG BAZAR KULINER SOLO 2026' AND ev.venue = 'Pamedan Pura Mangkunegaran, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 2
FROM events ev WHERE ev.title = 'ULEG BAZAR KULINER SOLO 2026' AND ev.venue = 'Pamedan Pura Mangkunegaran, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Senada/i Phase 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Senada/i Phase 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-205@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-205@wavy.seed' AND a.name = 'Senada/i Phase 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Senada/i Phase 2', 'Music', 'Surabaya, Kota Surabaya', '2026-05-15 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IN3ZZ72VTB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Senada/i Phase 2'
WHERE o.email = 'demo.scrape-205@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Senada/i Phase 2' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 175
FROM events ev WHERE ev.title = 'Senada/i Phase 2' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Suddenly Showcase #6
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Suddenly Showcase #6', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-195@wavy.seed' AND a.name = 'Mendadak Suddenly Showcase #6');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Suddenly Showcase #6', 'Music', 'Friend At Hand by Inlaws Coffee, Kota Surabaya', '2026-05-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/67KBBZ2TZZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Suddenly Showcase #6'
WHERE o.email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Suddenly Showcase #6' AND ev.venue = 'Friend At Hand by Inlaws Coffee, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 45
FROM events ev WHERE ev.title = 'Mendadak Suddenly Showcase #6' AND ev.venue = 'Friend At Hand by Inlaws Coffee, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Utarakan Cinta Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Utarakan Cinta Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-225@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-225@wavy.seed' AND a.name = 'Utarakan Cinta Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Utarakan Cinta Fest 2026', 'Music', 'GOR Merdeka, Kab. Jombang', '2026-05-15 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OJXM2K83JH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Utarakan Cinta Fest 2026'
WHERE o.email = 'demo.scrape-225@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Utarakan Cinta Fest 2026' AND ev.venue = 'GOR Merdeka, Kab. Jombang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 55
FROM events ev WHERE ev.title = 'Utarakan Cinta Fest 2026' AND ev.venue = 'GOR Merdeka, Kab. Jombang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- KOMUNIKA FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'KOMUNIKA FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-226@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-226@wavy.seed' AND a.name = 'KOMUNIKA FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'KOMUNIKA FEST 2026', 'Music', 'Anjung Seni Idrus Tintin, Kota Pekanbaru', '2026-05-15 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UKUUR0BAMK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'KOMUNIKA FEST 2026'
WHERE o.email = 'demo.scrape-226@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'KOMUNIKA FEST 2026' AND ev.venue = 'Anjung Seni Idrus Tintin, Kota Pekanbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 19000, 500, 188
FROM events ev WHERE ev.title = 'KOMUNIKA FEST 2026' AND ev.venue = 'Anjung Seni Idrus Tintin, Kota Pekanbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Senandungcita Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Senandungcita Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-227@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-227@wavy.seed' AND a.name = 'Senandungcita Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Senandungcita Fest', 'Music', 'Lapangan Bandara Lama Jambi, Kota Jambi', '2026-05-16 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QXZTFS6NSU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Senandungcita Fest'
WHERE o.email = 'demo.scrape-227@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Senandungcita Fest' AND ev.venue = 'Lapangan Bandara Lama Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 61
FROM events ev WHERE ev.title = 'Senandungcita Fest' AND ev.venue = 'Lapangan Bandara Lama Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Record Store Day Padang 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Record Store Day Padang 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-228@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-228@wavy.seed' AND a.name = 'Record Store Day Padang 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Record Store Day Padang 2026', 'Music', 'Fabriek Padang, Kota Padang', '2026-05-16 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IDN4D51LEE.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Record Store Day Padang 2026'
WHERE o.email = 'demo.scrape-228@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Record Store Day Padang 2026' AND ev.venue = 'Fabriek Padang, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 124
FROM events ev WHERE ev.title = 'Record Store Day Padang 2026' AND ev.venue = 'Fabriek Padang, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - CIKARANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - CIKARANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - CIKARANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - CIKARANG', 'Music', 'HALAMAN PARKIR FESTIVAL,LIPPO MALL CIKARANG, Kab. Bekasi', '2026-05-16 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AIZOYZBZOZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - CIKARANG'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - CIKARANG' AND ev.venue = 'HALAMAN PARKIR FESTIVAL,LIPPO MALL CIKARANG, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 47
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - CIKARANG' AND ev.venue = 'HALAMAN PARKIR FESTIVAL,LIPPO MALL CIKARANG, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Magelang Modsmayday 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Magelang Modsmayday 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-230@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-230@wavy.seed' AND a.name = 'Magelang Modsmayday 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Magelang Modsmayday 2026', 'Music', 'Lapangan Parkir AIM Artos Mall, Kota Magelang', '2026-05-16 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/A3CJNVYXLL.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Magelang Modsmayday 2026'
WHERE o.email = 'demo.scrape-230@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Magelang Modsmayday 2026' AND ev.venue = 'Lapangan Parkir AIM Artos Mall, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 70
FROM events ev WHERE ev.title = 'Magelang Modsmayday 2026' AND ev.venue = 'Lapangan Parkir AIM Artos Mall, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Puspa Rona Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Puspa Rona Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-231@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-231@wavy.seed' AND a.name = 'Puspa Rona Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Puspa Rona Festival', 'Music', 'Lap. Gemolong Sragen, Kab. Sragen', '2026-05-16 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TEDWFWWWR0.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Puspa Rona Festival'
WHERE o.email = 'demo.scrape-231@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Puspa Rona Festival' AND ev.venue = 'Lap. Gemolong Sragen, Kab. Sragen');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 83
FROM events ev WHERE ev.title = 'Puspa Rona Festival' AND ev.venue = 'Lap. Gemolong Sragen, Kab. Sragen'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kecil Tapi Party 2026 - Garut
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kecil Tapi Party 2026 - Garut', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Kecil Tapi Party 2026 - Garut');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kecil Tapi Party 2026 - Garut', 'Music', 'SOR RAA Adiwijaya, Ciateul, Kab. Garut', '2026-05-16 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/DY7PGODVFI.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kecil Tapi Party 2026 - Garut'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Garut' AND ev.venue = 'SOR RAA Adiwijaya, Ciateul, Kab. Garut');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 237
FROM events ev WHERE ev.title = 'Kecil Tapi Party 2026 - Garut' AND ev.venue = 'SOR RAA Adiwijaya, Ciateul, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Artella School Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Artella School Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-232@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-232@wavy.seed' AND a.name = 'Artella School Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Artella School Fest', 'Music', 'MAN 25 JAKARTA, Kota Adm. Jakarta Timur', '2026-05-16 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/P7P1HWN30E.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Artella School Fest'
WHERE o.email = 'demo.scrape-232@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Artella School Fest' AND ev.venue = 'MAN 25 JAKARTA, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 236
FROM events ev WHERE ev.title = 'Artella School Fest' AND ev.venue = 'MAN 25 JAKARTA, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SWARA PUNCAK
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SWARA PUNCAK', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-233@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-233@wavy.seed' AND a.name = 'SWARA PUNCAK');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SWARA PUNCAK', 'Music', 'Tebing Breksi, Kab. Sleman', '2026-05-16 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/MR9WQWEWC5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SWARA PUNCAK'
WHERE o.email = 'demo.scrape-233@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SWARA PUNCAK' AND ev.venue = 'Tebing Breksi, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 119
FROM events ev WHERE ev.title = 'SWARA PUNCAK' AND ev.venue = 'Tebing Breksi, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Beyond The Limits
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Beyond The Limits', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-234@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-234@wavy.seed' AND a.name = 'Beyond The Limits');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Beyond The Limits', 'Music', 'Cincai Cafe, Kota Batam', '2026-05-17 16:30:01'::timestamptz, 'https://assets.artatix.co.id/event/Z4D3BNQ8NW.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Beyond The Limits'
WHERE o.email = 'demo.scrape-234@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Beyond The Limits' AND ev.venue = 'Cincai Cafe, Kota Batam');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 32
FROM events ev WHERE ev.title = 'Beyond The Limits' AND ev.venue = 'Cincai Cafe, Kota Batam'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- KENDURI MUSIK FESTIVAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'KENDURI MUSIK FESTIVAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-233@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-233@wavy.seed' AND a.name = 'KENDURI MUSIK FESTIVAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'KENDURI MUSIK FESTIVAL', 'Music', 'Tebing Breksi, Kab. Sleman', '2026-05-17 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6VREFGRA3Y.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'KENDURI MUSIK FESTIVAL'
WHERE o.email = 'demo.scrape-233@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'KENDURI MUSIK FESTIVAL' AND ev.venue = 'Tebing Breksi, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 99
FROM events ev WHERE ev.title = 'KENDURI MUSIK FESTIVAL' AND ev.venue = 'Tebing Breksi, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 30
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 30', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 30');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 30', 'Music', 'Tilasawa Coffe Roester Yogyakarta, Kab. Sleman', '2026-05-21 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/K1KU1L1LSO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 30'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 30' AND ev.venue = 'Tilasawa Coffe Roester Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol 30' AND ev.venue = 'Tilasawa Coffe Roester Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Gelombang Lokal Malang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Gelombang Lokal Malang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-235@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-235@wavy.seed' AND a.name = 'Gelombang Lokal Malang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Gelombang Lokal Malang', 'Music', 'FBN Artisantz Coffee, Kota Malang', '2026-05-22 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KODRLKDM3M.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Gelombang Lokal Malang'
WHERE o.email = 'demo.scrape-235@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Gelombang Lokal Malang' AND ev.venue = 'FBN Artisantz Coffee, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 255
FROM events ev WHERE ev.title = 'Gelombang Lokal Malang' AND ev.venue = 'FBN Artisantz Coffee, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Thristday Shout 20
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Thristday Shout 20', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-236@wavy.seed' AND a.name = 'Thristday Shout 20');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Thristday Shout 20', 'Music', 'Fragment Project, Kota Bandung', '2026-05-23 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/K1GYFUCMUL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Thristday Shout 20'
WHERE o.email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Thristday Shout 20' AND ev.venue = 'Fragment Project, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 218
FROM events ev WHERE ev.title = 'Thristday Shout 20' AND ev.venue = 'Fragment Project, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Papua Van Java - Merauke
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Papua Van Java - Merauke', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-193@wavy.seed' AND a.name = 'Papua Van Java - Merauke');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Papua Van Java - Merauke', 'Music', 'Lapangan Kapsul Waktu, Kab. Merauke', '2026-05-23 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FIAT4UE7EN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Papua Van Java - Merauke'
WHERE o.email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Papua Van Java - Merauke' AND ev.venue = 'Lapangan Kapsul Waktu, Kab. Merauke');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 175000, 500, 29
FROM events ev WHERE ev.title = 'Papua Van Java - Merauke' AND ev.venue = 'Lapangan Kapsul Waktu, Kab. Merauke'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konser Berani Tambah Bahagia
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konser Berani Tambah Bahagia', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-237@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-237@wavy.seed' AND a.name = 'Konser Berani Tambah Bahagia');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konser Berani Tambah Bahagia', 'Music', 'Asram Edupark, Kab. Sleman', '2026-05-23 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/PPWIWBAPUS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konser Berani Tambah Bahagia'
WHERE o.email = 'demo.scrape-237@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konser Berani Tambah Bahagia' AND ev.venue = 'Asram Edupark, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 151
FROM events ev WHERE ev.title = 'Konser Berani Tambah Bahagia' AND ev.venue = 'Asram Edupark, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS TOUR 2026 (SUBANG)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS TOUR 2026 (SUBANG)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MADNESS TOUR 2026 (SUBANG)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS TOUR 2026 (SUBANG)', 'Music', 'Subang, Kab. Subang', '2026-05-24 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V3PBDB48U2.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS TOUR 2026 (SUBANG)'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (SUBANG)' AND ev.venue = 'Subang, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (SUBANG)' AND ev.venue = 'Subang, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-81@wavy.seed' AND a.name = 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"', 'Music', 'Ballroom & Arcadaz 5th Floor Gramm Hotel by Ambarrukmo, Kab. Sleman', '2026-05-29 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AI4J9K97E6.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"'
WHERE o.email = 'demo.scrape-81@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"' AND ev.venue = 'Ballroom & Arcadaz 5th Floor Gramm Hotel by Ambarrukmo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 153
FROM events ev WHERE ev.title = 'TONE TEMPLE "XIE XIE (Southeast Asia Tour) Yogyakarta"' AND ev.venue = 'Ballroom & Arcadaz 5th Floor Gramm Hotel by Ambarrukmo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS TOUR 2026 (KOTA BANDUNG)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS TOUR 2026 (KOTA BANDUNG)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MADNESS TOUR 2026 (KOTA BANDUNG)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS TOUR 2026 (KOTA BANDUNG)', 'Music', 'Kota Bandung, Kota Bandung', '2026-05-29 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BQ4AMANYN7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS TOUR 2026 (KOTA BANDUNG)'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (KOTA BANDUNG)' AND ev.venue = 'Kota Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (KOTA BANDUNG)' AND ev.venue = 'Kota Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RINDU BERISIK FESTIVAL 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RINDU BERISIK FESTIVAL 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-238@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-238@wavy.seed' AND a.name = 'RINDU BERISIK FESTIVAL 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RINDU BERISIK FESTIVAL 2026', 'Music', 'BSCC Dome Balikpapan, Kota Balikpapan', '2026-05-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F3221ORS6N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RINDU BERISIK FESTIVAL 2026'
WHERE o.email = 'demo.scrape-238@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RINDU BERISIK FESTIVAL 2026' AND ev.venue = 'BSCC Dome Balikpapan, Kota Balikpapan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 170000, 500, 254
FROM events ev WHERE ev.title = 'RINDU BERISIK FESTIVAL 2026' AND ev.venue = 'BSCC Dome Balikpapan, Kota Balikpapan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NORTH LIVE FESTIVAL VOL. 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NORTH LIVE FESTIVAL VOL. 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-239@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-239@wavy.seed' AND a.name = 'NORTH LIVE FESTIVAL VOL. 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NORTH LIVE FESTIVAL VOL. 1', 'Music', 'Pohon Kasih Megamas, Kota Manado', '2026-05-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XKFW9UZK3C.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NORTH LIVE FESTIVAL VOL. 1'
WHERE o.email = 'demo.scrape-239@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NORTH LIVE FESTIVAL VOL. 1' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 27
FROM events ev WHERE ev.title = 'NORTH LIVE FESTIVAL VOL. 1' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Cerita Kita Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Cerita Kita Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-240@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-240@wavy.seed' AND a.name = 'Cerita Kita Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Cerita Kita Fest', 'Music', 'GOR UNY, Kota Yogyakarta', '2026-05-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3QJIVF7M69.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Cerita Kita Fest'
WHERE o.email = 'demo.scrape-240@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Cerita Kita Fest' AND ev.venue = 'GOR UNY, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 180
FROM events ev WHERE ev.title = 'Cerita Kita Fest' AND ev.venue = 'GOR UNY, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dead Air Program
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dead Air Program', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-241@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-241@wavy.seed' AND a.name = 'Dead Air Program');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dead Air Program', 'Music', 'Hafa Warehouse, Kota Bandung', '2026-05-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/40BRQMBGD9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dead Air Program'
WHERE o.email = 'demo.scrape-241@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dead Air Program' AND ev.venue = 'Hafa Warehouse, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 123
FROM events ev WHERE ev.title = 'Dead Air Program' AND ev.venue = 'Hafa Warehouse, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BESTIEVAL PURWOKERTO 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BESTIEVAL PURWOKERTO 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'BESTIEVAL PURWOKERTO 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BESTIEVAL PURWOKERTO 2026', 'Music', 'Gedung Olahraga Satria Kota Purwokerto, Kab. Banyumas', '2026-05-30 15:00:00'::timestamptz, 'https://assets.artatix.co.id/event/OCQYT335QG.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BESTIEVAL PURWOKERTO 2026'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BESTIEVAL PURWOKERTO 2026' AND ev.venue = 'Gedung Olahraga Satria Kota Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 113
FROM events ev WHERE ev.title = 'BESTIEVAL PURWOKERTO 2026' AND ev.venue = 'Gedung Olahraga Satria Kota Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rilaya Uniba 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rilaya Uniba 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-242@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-242@wavy.seed' AND a.name = 'Rilaya Uniba 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rilaya Uniba 2026', 'Music', 'Lapangan FKIP kampus B Universitas Bina Bangsa, Kota Serang', '2026-05-30 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4PPET5U1DQ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rilaya Uniba 2026'
WHERE o.email = 'demo.scrape-242@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rilaya Uniba 2026' AND ev.venue = 'Lapangan FKIP kampus B Universitas Bina Bangsa, Kota Serang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 86
FROM events ev WHERE ev.title = 'Rilaya Uniba 2026' AND ev.venue = 'Lapangan FKIP kampus B Universitas Bina Bangsa, Kota Serang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nyanyian Fest Cirebon 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nyanyian Fest Cirebon 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-243@wavy.seed' AND a.name = 'Nyanyian Fest Cirebon 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nyanyian Fest Cirebon 2026', 'Music', 'Grage City Mall, Kota Cirebon', '2026-05-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0XGQKCD2ZY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nyanyian Fest Cirebon 2026'
WHERE o.email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nyanyian Fest Cirebon 2026' AND ev.venue = 'Grage City Mall, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 69
FROM events ev WHERE ev.title = 'Nyanyian Fest Cirebon 2026' AND ev.venue = 'Grage City Mall, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THIRSTDAY SHOUT 21
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THIRSTDAY SHOUT 21', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-236@wavy.seed' AND a.name = 'THIRSTDAY SHOUT 21');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THIRSTDAY SHOUT 21', 'Music', 'Spill n Bites Punawarman, Kota Bandung', '2026-05-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CMI4T50PS1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THIRSTDAY SHOUT 21'
WHERE o.email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THIRSTDAY SHOUT 21' AND ev.venue = 'Spill n Bites Punawarman, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 218
FROM events ev WHERE ev.title = 'THIRSTDAY SHOUT 21' AND ev.venue = 'Spill n Bites Punawarman, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LIVE ARENA 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LIVE ARENA 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-244@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-244@wavy.seed' AND a.name = 'LIVE ARENA 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LIVE ARENA 2026', 'Music', 'PARKIR MALL AEON DELTA MAS, Kab. Bekasi', '2026-05-31 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Z9JPZUOB30.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LIVE ARENA 2026'
WHERE o.email = 'demo.scrape-244@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LIVE ARENA 2026' AND ev.venue = 'PARKIR MALL AEON DELTA MAS, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 52
FROM events ev WHERE ev.title = 'LIVE ARENA 2026' AND ev.venue = 'PARKIR MALL AEON DELTA MAS, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-32@wavy.seed' AND a.name = 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"', 'Music', 'GSG UNESA KETINTANG, Kota Surabaya', '2026-06-01 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/17CHZX33RB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"'
WHERE o.email = 'demo.scrape-32@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"' AND ev.venue = 'GSG UNESA KETINTANG, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 16
FROM events ev WHERE ev.title = 'SURABAYA HARDCORE FEST "HAYWIRE LIVE AT SBHC VOL 12"' AND ev.venue = 'GSG UNESA KETINTANG, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hold Me Back Vol.5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hold Me Back Vol.5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-245@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-245@wavy.seed' AND a.name = 'Hold Me Back Vol.5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hold Me Back Vol.5', 'Music', 'Habbit Coffee, Kab. Banyumas', '2026-06-05 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Y9QDI8PE5L.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hold Me Back Vol.5'
WHERE o.email = 'demo.scrape-245@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hold Me Back Vol.5' AND ev.venue = 'Habbit Coffee, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 195
FROM events ev WHERE ev.title = 'Hold Me Back Vol.5' AND ev.venue = 'Habbit Coffee, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SoundKlik vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SoundKlik vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-157@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-157@wavy.seed' AND a.name = 'SoundKlik vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SoundKlik vol 2', 'Music', 'Panorama 25 Bojong Kab Pekalongan, Kab. Pekalongan', '2026-06-06 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XA334O6NZS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SoundKlik vol 2'
WHERE o.email = 'demo.scrape-157@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SoundKlik vol 2' AND ev.venue = 'Panorama 25 Bojong Kab Pekalongan, Kab. Pekalongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 41
FROM events ev WHERE ev.title = 'SoundKlik vol 2' AND ev.venue = 'Panorama 25 Bojong Kab Pekalongan, Kab. Pekalongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CIMPHORIA #9
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CIMPHORIA #9', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-246@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-246@wavy.seed' AND a.name = 'CIMPHORIA #9');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CIMPHORIA #9', 'Music', 'Lapangan Parkir Mandala Krida, Kota Yogyakarta', '2026-06-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NJ2J05HBB6.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CIMPHORIA #9'
WHERE o.email = 'demo.scrape-246@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CIMPHORIA #9' AND ev.venue = 'Lapangan Parkir Mandala Krida, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 58
FROM events ev WHERE ev.title = 'CIMPHORIA #9' AND ev.venue = 'Lapangan Parkir Mandala Krida, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hardrock D'legend Concert
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hardrock D''legend Concert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-247@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-247@wavy.seed' AND a.name = 'Hardrock D''legend Concert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hardrock D''legend Concert', 'Music', 'Stadion Oepoi Kupang, Kota Kupang', '2026-06-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/K3ELEDF2E7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hardrock D''legend Concert'
WHERE o.email = 'demo.scrape-247@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hardrock D''legend Concert' AND ev.venue = 'Stadion Oepoi Kupang, Kota Kupang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 91
FROM events ev WHERE ev.title = 'Hardrock D''legend Concert' AND ev.venue = 'Stadion Oepoi Kupang, Kota Kupang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festival Budaya NTT Vol. 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festival Budaya NTT Vol. 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-248@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-248@wavy.seed' AND a.name = 'Festival Budaya NTT Vol. 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festival Budaya NTT Vol. 4', 'Music', 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul', '2026-06-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9XL5SMSEAG.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festival Budaya NTT Vol. 4'
WHERE o.email = 'demo.scrape-248@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festival Budaya NTT Vol. 4' AND ev.venue = 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 84
FROM events ev WHERE ev.title = 'Festival Budaya NTT Vol. 4' AND ev.venue = 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NO FEAR OF PAIN VOL 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NO FEAR OF PAIN VOL 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'NO FEAR OF PAIN VOL 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO FEAR OF PAIN VOL 4', 'Music', 'TBA, Kota Bandung', '2026-06-06 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/422IIP16U1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO FEAR OF PAIN VOL 4'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 4' AND ev.venue = 'TBA, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 4' AND ev.venue = 'TBA, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS TOUR 2026 (KAB BANDUNG)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS TOUR 2026 (KAB BANDUNG)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MADNESS TOUR 2026 (KAB BANDUNG)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS TOUR 2026 (KAB BANDUNG)', 'Music', 'Kab Bandung, Kab. Bandung', '2026-06-06 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/PF96MRBAYS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS TOUR 2026 (KAB BANDUNG)'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (KAB BANDUNG)' AND ev.venue = 'Kab Bandung, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (KAB BANDUNG)' AND ev.venue = 'Kab Bandung, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HBD KOMUS "KEMBALI BERPESTA"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HBD KOMUS "KEMBALI BERPESTA"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-249@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-249@wavy.seed' AND a.name = 'HBD KOMUS "KEMBALI BERPESTA"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HBD KOMUS "KEMBALI BERPESTA"', 'Music', 'SOBO'' KITCHEN AND SPACE, Kab. Bantul', '2026-06-07 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3GOSLEHPCV.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HBD KOMUS "KEMBALI BERPESTA"'
WHERE o.email = 'demo.scrape-249@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HBD KOMUS "KEMBALI BERPESTA"' AND ev.venue = 'SOBO'' KITCHEN AND SPACE, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 247
FROM events ev WHERE ev.title = 'HBD KOMUS "KEMBALI BERPESTA"' AND ev.venue = 'SOBO'' KITCHEN AND SPACE, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MADNESS TOUR 2026 (SUKABUMI)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MADNESS TOUR 2026 (SUKABUMI)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MADNESS TOUR 2026 (SUKABUMI)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MADNESS TOUR 2026 (SUKABUMI)', 'Music', 'CAFE VANMILLA, Kota Sukabumi', '2026-06-07 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QKSXDF0PAT.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MADNESS TOUR 2026 (SUKABUMI)'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (SUKABUMI)' AND ev.venue = 'CAFE VANMILLA, Kota Sukabumi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 172
FROM events ev WHERE ev.title = 'MADNESS TOUR 2026 (SUKABUMI)' AND ev.venue = 'CAFE VANMILLA, Kota Sukabumi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RXXV Club (Online)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RXXV Club (Online)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-2@wavy.seed' AND a.name = 'RXXV Club (Online)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RXXV Club (Online)', 'Music', 'Online Stream, Kota Adm. Jakarta Utara', '2026-06-09 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/471APV8HIM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RXXV Club (Online)'
WHERE o.email = 'demo.scrape-2@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RXXV Club (Online)' AND ev.venue = 'Online Stream, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 146
FROM events ev WHERE ev.title = 'RXXV Club (Online)' AND ev.venue = 'Online Stream, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Management Creativity Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Management Creativity Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-250@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-250@wavy.seed' AND a.name = 'Management Creativity Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Management Creativity Festival', 'Music', 'Taman Seni & Budaya Aceh, Kota Banda Aceh', '2026-06-09 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6P0CR7E6ZF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Management Creativity Festival'
WHERE o.email = 'demo.scrape-250@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Management Creativity Festival' AND ev.venue = 'Taman Seni & Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 255000, 500, 150
FROM events ev WHERE ev.title = 'Management Creativity Festival' AND ev.venue = 'Taman Seni & Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BIG BROTHER ( Road To Rockland Festival )
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BIG BROTHER ( Road To Rockland Festival )', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-103@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-103@wavy.seed' AND a.name = 'BIG BROTHER ( Road To Rockland Festival )');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BIG BROTHER ( Road To Rockland Festival )', 'Music', 'Hotel Mars Puncak Bogor, Kab. Bogor', '2026-06-12 13:45:01'::timestamptz, 'https://assets.artatix.co.id/event/TJX9YS0C7Y.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BIG BROTHER ( Road To Rockland Festival )'
WHERE o.email = 'demo.scrape-103@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BIG BROTHER ( Road To Rockland Festival )' AND ev.venue = 'Hotel Mars Puncak Bogor, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 229
FROM events ev WHERE ev.title = 'BIG BROTHER ( Road To Rockland Festival )' AND ev.venue = 'Hotel Mars Puncak Bogor, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- KAROKERIA With SUGAR DADIE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'KAROKERIA With SUGAR DADIE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-33@wavy.seed' AND a.name = 'KAROKERIA With SUGAR DADIE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'KAROKERIA With SUGAR DADIE', 'Music', 'Warkop Sugardadie, Kota Semarang', '2026-06-13 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IDKHOV5WN1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'KAROKERIA With SUGAR DADIE'
WHERE o.email = 'demo.scrape-33@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'KAROKERIA With SUGAR DADIE' AND ev.venue = 'Warkop Sugardadie, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 269
FROM events ev WHERE ev.title = 'KAROKERIA With SUGAR DADIE' AND ev.venue = 'Warkop Sugardadie, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konser Newcomers "Peccator" PSM Atma Jogja
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konser Newcomers "Peccator" PSM Atma Jogja', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-251@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-251@wavy.seed' AND a.name = 'Konser Newcomers "Peccator" PSM Atma Jogja');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konser Newcomers "Peccator" PSM Atma Jogja', 'Music', 'Auditorium Kampus II, Gedung Thomas Aquinas, Universitas Atma Jaya Yogyakarta, Kab. Sleman', '2026-06-13 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/S5XE3AYOJ9.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konser Newcomers "Peccator" PSM Atma Jogja'
WHERE o.email = 'demo.scrape-251@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konser Newcomers "Peccator" PSM Atma Jogja' AND ev.venue = 'Auditorium Kampus II, Gedung Thomas Aquinas, Universitas Atma Jaya Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 193
FROM events ev WHERE ev.title = 'Konser Newcomers "Peccator" PSM Atma Jogja' AND ev.venue = 'Auditorium Kampus II, Gedung Thomas Aquinas, Universitas Atma Jaya Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DONGKER Palembang Intimate Showcase
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DONGKER Palembang Intimate Showcase', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-252@wavy.seed' AND a.name = 'DONGKER Palembang Intimate Showcase');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DONGKER Palembang Intimate Showcase', 'Music', 'Muara Space, Palembang, Kota Palembang', '2026-06-13 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3IOHOJLW5Y.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DONGKER Palembang Intimate Showcase'
WHERE o.email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DONGKER Palembang Intimate Showcase' AND ev.venue = 'Muara Space, Palembang, Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 116
FROM events ev WHERE ev.title = 'DONGKER Palembang Intimate Showcase' AND ev.venue = 'Muara Space, Palembang, Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jogja Rockphonic Kedhaton (Seating)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jogja Rockphonic Kedhaton (Seating)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-253@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-253@wavy.seed' AND a.name = 'Jogja Rockphonic Kedhaton (Seating)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jogja Rockphonic Kedhaton (Seating)', 'Music', 'Stadion Kridosono Yogyakarta, Kota Yogyakarta', '2026-06-13 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/ONUOOQWV93.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jogja Rockphonic Kedhaton (Seating)'
WHERE o.email = 'demo.scrape-253@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jogja Rockphonic Kedhaton (Seating)' AND ev.venue = 'Stadion Kridosono Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 600000, 500, 89
FROM events ev WHERE ev.title = 'Jogja Rockphonic Kedhaton (Seating)' AND ev.venue = 'Stadion Kridosono Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jogja Rockphonic (Standing)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jogja Rockphonic (Standing)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-253@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-253@wavy.seed' AND a.name = 'Jogja Rockphonic (Standing)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jogja Rockphonic (Standing)', 'Music', 'Stadion Kridosono Yogyakarta, Kota Yogyakarta', '2026-06-13 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/0FQXYG9GMR.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jogja Rockphonic (Standing)'
WHERE o.email = 'demo.scrape-253@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jogja Rockphonic (Standing)' AND ev.venue = 'Stadion Kridosono Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 79
FROM events ev WHERE ev.title = 'Jogja Rockphonic (Standing)' AND ev.venue = 'Stadion Kridosono Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FISTFEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FISTFEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-254@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-254@wavy.seed' AND a.name = 'FISTFEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FISTFEST 2026', 'Music', 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta', '2026-06-13 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HCBH8J34D0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FISTFEST 2026'
WHERE o.email = 'demo.scrape-254@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FISTFEST 2026' AND ev.venue = 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 92
FROM events ev WHERE ev.title = 'FISTFEST 2026' AND ev.venue = 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BESTIEVAL MAGELANG 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BESTIEVAL MAGELANG 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'BESTIEVAL MAGELANG 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BESTIEVAL MAGELANG 2026', 'Music', 'Lap. Aim Artos Magelang, Kota Magelang', '2026-06-13 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3DTUDBQMW9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BESTIEVAL MAGELANG 2026'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BESTIEVAL MAGELANG 2026' AND ev.venue = 'Lap. Aim Artos Magelang, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 113
FROM events ev WHERE ev.title = 'BESTIEVAL MAGELANG 2026' AND ev.venue = 'Lap. Aim Artos Magelang, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FISTFEST 2026 (FESTARA)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FISTFEST 2026 (FESTARA)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-254@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-254@wavy.seed' AND a.name = 'FISTFEST 2026 (FESTARA)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FISTFEST 2026 (FESTARA)', 'Music', 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta', '2026-06-13 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7KRALEGZNM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FISTFEST 2026 (FESTARA)'
WHERE o.email = 'demo.scrape-254@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FISTFEST 2026 (FESTARA)' AND ev.venue = 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 147500, 500, 2
FROM events ev WHERE ev.title = 'FISTFEST 2026 (FESTARA)' AND ev.venue = 'Stadion Mandala Krida, Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Momenta Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Momenta Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-255@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-255@wavy.seed' AND a.name = 'Momenta Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Momenta Festival', 'Music', 'Lap. PPI Pussenif Bandung, Kota Bandung', '2026-06-13 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JR2GGXMH7B.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Momenta Festival'
WHERE o.email = 'demo.scrape-255@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Momenta Festival' AND ev.venue = 'Lap. PPI Pussenif Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 165
FROM events ev WHERE ev.title = 'Momenta Festival' AND ev.venue = 'Lap. PPI Pussenif Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riuh Bersua
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riuh Bersua', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-256@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-256@wavy.seed' AND a.name = 'Riuh Bersua');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riuh Bersua', 'Music', 'Fabric Bloc Padang, Kota Padang', '2026-06-13 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TNO1MWDY1G.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riuh Bersua'
WHERE o.email = 'demo.scrape-256@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riuh Bersua' AND ev.venue = 'Fabric Bloc Padang, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 66000, 500, 18
FROM events ev WHERE ev.title = 'Riuh Bersua' AND ev.venue = 'Fabric Bloc Padang, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bergigs Ria 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bergigs Ria 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-171@wavy.seed' AND a.name = 'Bergigs Ria 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bergigs Ria 2026', 'Music', 'JRNY Coffee & Records, Kota Yogyakarta', '2026-06-14 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JM9JDFYL46.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bergigs Ria 2026'
WHERE o.email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bergigs Ria 2026' AND ev.venue = 'JRNY Coffee & Records, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 253
FROM events ev WHERE ev.title = 'Bergigs Ria 2026' AND ev.venue = 'JRNY Coffee & Records, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Mendadak Suddenly Showcase #7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Mendadak Suddenly Showcase #7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-195@wavy.seed' AND a.name = 'Mendadak Suddenly Showcase #7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Mendadak Suddenly Showcase #7', 'Music', 'AJBS, Kota Surabaya', '2026-06-14 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6G7GHLX6ZS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Mendadak Suddenly Showcase #7'
WHERE o.email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Mendadak Suddenly Showcase #7' AND ev.venue = 'AJBS, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 115
FROM events ev WHERE ev.title = 'Mendadak Suddenly Showcase #7' AND ev.venue = 'AJBS, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nicey Nice Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nicey Nice Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-257@wavy.seed' AND a.name = 'Nicey Nice Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nicey Nice Fest', 'Music', 'Surabaya Business Expo Center, Kota Surabaya', '2026-06-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3QYIHXQINR.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nicey Nice Fest'
WHERE o.email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nicey Nice Fest' AND ev.venue = 'Surabaya Business Expo Center, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 271
FROM events ev WHERE ev.title = 'Nicey Nice Fest' AND ev.venue = 'Surabaya Business Expo Center, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jomlo Festival 2026 Chapter Bekasi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jomlo Festival 2026 Chapter Bekasi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-93@wavy.seed' AND a.name = 'Jomlo Festival 2026 Chapter Bekasi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jomlo Festival 2026 Chapter Bekasi', 'Music', 'Meikarta Central Park, Kab. Bekasi', '2026-06-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UGGWWZJ8JT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jomlo Festival 2026 Chapter Bekasi'
WHERE o.email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jomlo Festival 2026 Chapter Bekasi' AND ev.venue = 'Meikarta Central Park, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 144500, 500, 129
FROM events ev WHERE ev.title = 'Jomlo Festival 2026 Chapter Bekasi' AND ev.venue = 'Meikarta Central Park, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SongList Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SongList Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-258@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-258@wavy.seed' AND a.name = 'SongList Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SongList Festival', 'Music', 'Grage City Mall, Kota Cirebon', '2026-06-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YBOB0U6WTK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SongList Festival'
WHERE o.email = 'demo.scrape-258@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SongList Festival' AND ev.venue = 'Grage City Mall, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 124
FROM events ev WHERE ev.title = 'SongList Festival' AND ev.venue = 'Grage City Mall, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nicey Nice Fest (FESTARA)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nicey Nice Fest (FESTARA)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-257@wavy.seed' AND a.name = 'Nicey Nice Fest (FESTARA)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nicey Nice Fest (FESTARA)', 'Music', 'Surabaya Business Expo Center, Kota Surabaya', '2026-06-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/20Z6AVK2ZD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nicey Nice Fest (FESTARA)'
WHERE o.email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nicey Nice Fest (FESTARA)' AND ev.venue = 'Surabaya Business Expo Center, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 31
FROM events ev WHERE ev.title = 'Nicey Nice Fest (FESTARA)' AND ev.venue = 'Surabaya Business Expo Center, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- VIStacular 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'VIStacular 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-259@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-259@wavy.seed' AND a.name = 'VIStacular 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'VIStacular 2026', 'Music', 'Omotesando, Kota Tangerang Selatan', '2026-06-14 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Y3ER7C9ROM.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'VIStacular 2026'
WHERE o.email = 'demo.scrape-259@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'VIStacular 2026' AND ev.venue = 'Omotesando, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 127
FROM events ev WHERE ev.title = 'VIStacular 2026' AND ev.venue = 'Omotesando, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konseria Harmoni Juni
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konseria Harmoni Juni', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-260@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-260@wavy.seed' AND a.name = 'Konseria Harmoni Juni');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konseria Harmoni Juni', 'Music', 'Panggung Seni Paseban Budaya Prikitiew Land Subang, Kukulu, Pagaden Barat, Kab. Subang', '2026-06-14 08:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RZKBAIKXWT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konseria Harmoni Juni'
WHERE o.email = 'demo.scrape-260@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konseria Harmoni Juni' AND ev.venue = 'Panggung Seni Paseban Budaya Prikitiew Land Subang, Kukulu, Pagaden Barat, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 30
FROM events ev WHERE ev.title = 'Konseria Harmoni Juni' AND ev.venue = 'Panggung Seni Paseban Budaya Prikitiew Land Subang, Kukulu, Pagaden Barat, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Noise Room
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Noise Room', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-261@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-261@wavy.seed' AND a.name = 'Noise Room');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Noise Room', 'Music', 'COMA BAR M-Bloc Space, Kota Adm. Jakarta Selatan', '2026-06-15 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LGAVZ488S6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Noise Room'
WHERE o.email = 'demo.scrape-261@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Noise Room' AND ev.venue = 'COMA BAR M-Bloc Space, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 3
FROM events ev WHERE ev.title = 'Noise Room' AND ev.venue = 'COMA BAR M-Bloc Space, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Magnolia 3rd Anniversary
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Magnolia 3rd Anniversary', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-262@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-262@wavy.seed' AND a.name = 'Magnolia 3rd Anniversary');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Magnolia 3rd Anniversary', 'Music', 'Magnolia Coffee and Space, Kab. Lumajang', '2026-06-15 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SZU01IM08D.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Magnolia 3rd Anniversary'
WHERE o.email = 'demo.scrape-262@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Magnolia 3rd Anniversary' AND ev.venue = 'Magnolia Coffee and Space, Kab. Lumajang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 106
FROM events ev WHERE ev.title = 'Magnolia 3rd Anniversary' AND ev.venue = 'Magnolia Coffee and Space, Kab. Lumajang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Speed Live in Solo
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Speed Live in Solo', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-263@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-263@wavy.seed' AND a.name = 'Speed Live in Solo');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Speed Live in Solo', 'Music', 'Convention Hall Tirtonadi, Solo, Kota Surakarta', '2026-06-19 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q2A8GHSD40.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Speed Live in Solo'
WHERE o.email = 'demo.scrape-263@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Speed Live in Solo' AND ev.venue = 'Convention Hall Tirtonadi, Solo, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 179
FROM events ev WHERE ev.title = 'Speed Live in Solo' AND ev.venue = 'Convention Hall Tirtonadi, Solo, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- VIGORPHORIA  PRABUMULIH
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'VIGORPHORIA  PRABUMULIH', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'VIGORPHORIA  PRABUMULIH');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'VIGORPHORIA  PRABUMULIH', 'Music', 'Citimall Prabumulih, Kota Prabumulih', '2026-06-19 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/0BD4SN6DBP.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'VIGORPHORIA  PRABUMULIH'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'VIGORPHORIA  PRABUMULIH' AND ev.venue = 'Citimall Prabumulih, Kota Prabumulih');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 132
FROM events ev WHERE ev.title = 'VIGORPHORIA  PRABUMULIH' AND ev.venue = 'Citimall Prabumulih, Kota Prabumulih'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sunrise Berkebun, Sunset Melantun (SBSM)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sunrise Berkebun, Sunset Melantun (SBSM)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-265@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-265@wavy.seed' AND a.name = 'Sunrise Berkebun, Sunset Melantun (SBSM)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sunrise Berkebun, Sunset Melantun (SBSM)', 'Music', 'Museum Pustaka Lontar, Karangasem, Kab. Karangasem', '2026-06-19 07:00:01'::timestamptz, 'https://assets.artatix.co.id/event/8QT32BX1IM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sunrise Berkebun, Sunset Melantun (SBSM)'
WHERE o.email = 'demo.scrape-265@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sunrise Berkebun, Sunset Melantun (SBSM)' AND ev.venue = 'Museum Pustaka Lontar, Karangasem, Kab. Karangasem');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 275
FROM events ev WHERE ev.title = 'Sunrise Berkebun, Sunset Melantun (SBSM)' AND ev.venue = 'Museum Pustaka Lontar, Karangasem, Kab. Karangasem'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Huru Hara Bajak Pesta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Huru Hara Bajak Pesta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-266@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-266@wavy.seed' AND a.name = 'Huru Hara Bajak Pesta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Huru Hara Bajak Pesta', 'Music', 'MINUTE JAKARTA, Kota Adm. Jakarta Pusat', '2026-06-20 21:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GUHXMV67DT.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Huru Hara Bajak Pesta'
WHERE o.email = 'demo.scrape-266@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Huru Hara Bajak Pesta' AND ev.venue = 'MINUTE JAKARTA, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 218
FROM events ev WHERE ev.title = 'Huru Hara Bajak Pesta' AND ev.venue = 'MINUTE JAKARTA, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DUMAI REBEL FEST VOL 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DUMAI REBEL FEST VOL 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-267@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-267@wavy.seed' AND a.name = 'DUMAI REBEL FEST VOL 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DUMAI REBEL FEST VOL 4', 'Music', 'KDC PASAR MODERN, Kota Dumai', '2026-06-20 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/G4RRAHYE3I.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DUMAI REBEL FEST VOL 4'
WHERE o.email = 'demo.scrape-267@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DUMAI REBEL FEST VOL 4' AND ev.venue = 'KDC PASAR MODERN, Kota Dumai');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 231
FROM events ev WHERE ev.title = 'DUMAI REBEL FEST VOL 4' AND ev.venue = 'KDC PASAR MODERN, Kota Dumai'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Story in Subang Vol 6
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Story in Subang Vol 6', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-132@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-132@wavy.seed' AND a.name = 'Story in Subang Vol 6');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Story in Subang Vol 6', 'Music', 'Kalijati, Subang, Kab. Subang', '2026-06-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1FVZ1HFAMH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Story in Subang Vol 6'
WHERE o.email = 'demo.scrape-132@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Story in Subang Vol 6' AND ev.venue = 'Kalijati, Subang, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 16
FROM events ev WHERE ev.title = 'Story in Subang Vol 6' AND ev.venue = 'Kalijati, Subang, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)', 'Music', 'Pos Bloc, Surabaya, Kota Surabaya', '2026-06-21 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/39FR09UY2O.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)' AND ev.venue = 'Pos Bloc, Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 159510, 500, 23
FROM events ev WHERE ev.title = '510 Genesis Spiritual Return to Origin - Surabaya (Special Show Orchestra Set)' AND ev.venue = 'Pos Bloc, Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Baru Aja Gigs vol. 1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Baru Aja Gigs vol. 1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-268@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-268@wavy.seed' AND a.name = 'Baru Aja Gigs vol. 1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Baru Aja Gigs vol. 1', 'Music', 'Gedung Manunggal Desa Blondo, Kec. Mungkid, Kab. Magelang, Kab. Magelang', '2026-06-21 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/L013WIMZNN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Baru Aja Gigs vol. 1'
WHERE o.email = 'demo.scrape-268@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Baru Aja Gigs vol. 1' AND ev.venue = 'Gedung Manunggal Desa Blondo, Kec. Mungkid, Kab. Magelang, Kab. Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 204
FROM events ev WHERE ev.title = 'Baru Aja Gigs vol. 1' AND ev.venue = 'Gedung Manunggal Desa Blondo, Kec. Mungkid, Kab. Magelang, Kab. Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GOLAGA VAGANZA 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GOLAGA VAGANZA 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-269@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-269@wavy.seed' AND a.name = 'GOLAGA VAGANZA 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GOLAGA VAGANZA 2026', 'Music', 'Wisata Goa Lawa Purbalingga, Kab. Purbalingga', '2026-06-21 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2G01LR843Y.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GOLAGA VAGANZA 2026'
WHERE o.email = 'demo.scrape-269@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GOLAGA VAGANZA 2026' AND ev.venue = 'Wisata Goa Lawa Purbalingga, Kab. Purbalingga');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 77
FROM events ev WHERE ev.title = 'GOLAGA VAGANZA 2026' AND ev.venue = 'Wisata Goa Lawa Purbalingga, Kab. Purbalingga'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 23 Days
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '23 Days', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-114@wavy.seed' AND a.name = '23 Days');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '23 Days', 'Music', 'OUTLET 23 JAMAL, Kab. Sleman', '2026-06-23 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V1FFR5UZ43.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '23 Days'
WHERE o.email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '23 Days' AND ev.venue = 'OUTLET 23 JAMAL, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 92
FROM events ev WHERE ev.title = '23 Days' AND ev.venue = 'OUTLET 23 JAMAL, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol 31
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol 31', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol 31');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol 31', 'Music', 'Warung Abang Awak Yogyakarta, Kab. Sleman', '2026-06-25 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2VR9W33GIT.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol 31'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol 31' AND ev.venue = 'Warung Abang Awak Yogyakarta, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol 31' AND ev.venue = 'Warung Abang Awak Yogyakarta, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rituals - Nadin Amizah
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rituals - Nadin Amizah', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-270@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-270@wavy.seed' AND a.name = 'Rituals - Nadin Amizah');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rituals - Nadin Amizah', 'Music', 'JNM Bloc, Kota Yogyakarta', '2026-06-26 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JCCNBL6AS8.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rituals - Nadin Amizah'
WHERE o.email = 'demo.scrape-270@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rituals - Nadin Amizah' AND ev.venue = 'JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 40
FROM events ev WHERE ev.title = 'Rituals - Nadin Amizah' AND ev.venue = 'JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Metalgear Showcase vol.6
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Metalgear Showcase vol.6', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-271@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-271@wavy.seed' AND a.name = 'Metalgear Showcase vol.6');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Metalgear Showcase vol.6', 'Music', 'Garden Cafe & resto, Kab. Jombang', '2026-06-26 13:30:01'::timestamptz, 'https://assets.artatix.co.id/event/03IP18DUFB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Metalgear Showcase vol.6'
WHERE o.email = 'demo.scrape-271@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Metalgear Showcase vol.6' AND ev.venue = 'Garden Cafe & resto, Kab. Jombang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 13
FROM events ev WHERE ev.title = 'Metalgear Showcase vol.6' AND ev.venue = 'Garden Cafe & resto, Kab. Jombang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Cirebon Bernyanyi Special Edition
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Cirebon Bernyanyi Special Edition', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-272@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-272@wavy.seed' AND a.name = 'Cirebon Bernyanyi Special Edition');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Cirebon Bernyanyi Special Edition', 'Music', 'Baraja Coffee Amphitheater, Kota Cirebon', '2026-06-27 18:30:01'::timestamptz, 'https://assets.artatix.co.id/event/MFMN0ZF9HL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Cirebon Bernyanyi Special Edition'
WHERE o.email = 'demo.scrape-272@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Cirebon Bernyanyi Special Edition' AND ev.venue = 'Baraja Coffee Amphitheater, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 176
FROM events ev WHERE ev.title = 'Cirebon Bernyanyi Special Edition' AND ev.venue = 'Baraja Coffee Amphitheater, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- EXCELSIA FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'EXCELSIA FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-273@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-273@wavy.seed' AND a.name = 'EXCELSIA FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'EXCELSIA FEST', 'Music', 'KAMPUS C JAYABAYA, Kota Depok', '2026-06-27 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UW94EKIYZC.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'EXCELSIA FEST'
WHERE o.email = 'demo.scrape-273@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'EXCELSIA FEST' AND ev.venue = 'KAMPUS C JAYABAYA, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 269
FROM events ev WHERE ev.title = 'EXCELSIA FEST' AND ev.venue = 'KAMPUS C JAYABAYA, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - TANGERANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - TANGERANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - TANGERANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - TANGERANG', 'Music', 'Mall Balekota Tangerang, Kota Tangerang', '2026-06-27 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YDQ16J48OK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - TANGERANG'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - TANGERANG' AND ev.venue = 'Mall Balekota Tangerang, Kota Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 47
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - TANGERANG' AND ev.venue = 'Mall Balekota Tangerang, Kota Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Noise From The Island "Bintan Loud Fest"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Noise From The Island "Bintan Loud Fest"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-274@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-274@wavy.seed' AND a.name = 'Noise From The Island "Bintan Loud Fest"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Noise From The Island "Bintan Loud Fest"', 'Music', 'Leka Beachclub, Kab. Bintan', '2026-06-27 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/467DZ4824D.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Noise From The Island "Bintan Loud Fest"'
WHERE o.email = 'demo.scrape-274@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Noise From The Island "Bintan Loud Fest"' AND ev.venue = 'Leka Beachclub, Kab. Bintan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 32
FROM events ev WHERE ev.title = 'Noise From The Island "Bintan Loud Fest"' AND ev.venue = 'Leka Beachclub, Kab. Bintan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-185@wavy.seed' AND a.name = 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak', 'Music', 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat', '2026-06-27 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SAYVQKWHUP.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak'
WHERE o.email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak' AND ev.venue = 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 265
FROM events ev WHERE ev.title = 'MEIGHTBALL - THE CRUCIFIX 8th Years Of Rumah Bergerak' AND ev.venue = 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tulungagung Distorsi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tulungagung Distorsi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-275@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-275@wavy.seed' AND a.name = 'Tulungagung Distorsi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tulungagung Distorsi', 'Music', 'GOR Lembupeteng Tulungagung, Kab. Tulungagung', '2026-06-27 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GEBCU12G71.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tulungagung Distorsi'
WHERE o.email = 'demo.scrape-275@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tulungagung Distorsi' AND ev.venue = 'GOR Lembupeteng Tulungagung, Kab. Tulungagung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 135
FROM events ev WHERE ev.title = 'Tulungagung Distorsi' AND ev.venue = 'GOR Lembupeteng Tulungagung, Kab. Tulungagung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Musik Radar
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Musik Radar', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-171@wavy.seed' AND a.name = 'Musik Radar');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Musik Radar', 'Music', 'Live at Santai Kawan Kopi, Kab. Sleman', '2026-06-28 21:30:01'::timestamptz, 'https://assets.artatix.co.id/event/PPSAR348MH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Musik Radar'
WHERE o.email = 'demo.scrape-171@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Musik Radar' AND ev.venue = 'Live at Santai Kawan Kopi, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 173
FROM events ev WHERE ev.title = 'Musik Radar' AND ev.venue = 'Live at Santai Kawan Kopi, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THE ALTAR TILL SILENCED
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THE ALTAR TILL SILENCED', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-84@wavy.seed' AND a.name = 'THE ALTAR TILL SILENCED');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THE ALTAR TILL SILENCED', 'Music', 'ILLUA BAR & LOUNGE, Kota Adm. Jakarta Pusat', '2026-06-28 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/42AZETBSL2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THE ALTAR TILL SILENCED'
WHERE o.email = 'demo.scrape-84@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THE ALTAR TILL SILENCED' AND ev.venue = 'ILLUA BAR & LOUNGE, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 122
FROM events ev WHERE ev.title = 'THE ALTAR TILL SILENCED' AND ev.venue = 'ILLUA BAR & LOUNGE, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- COMMATE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'COMMATE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-276@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-276@wavy.seed' AND a.name = 'COMMATE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'COMMATE', 'Music', 'HOD, Kota Semarang', '2026-06-28 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J5KUWFCNAP.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'COMMATE'
WHERE o.email = 'demo.scrape-276@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'COMMATE' AND ev.venue = 'HOD, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 288
FROM events ev WHERE ev.title = 'COMMATE' AND ev.venue = 'HOD, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Moonverse Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonverse Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-127@wavy.seed' AND a.name = 'Moonverse Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonverse Festival', 'Music', 'Uptown Park, Summarecon Mall Serpong, Kab. Tangerang', '2026-06-28 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/E9N8EO5ERD.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Moonverse Festival'
WHERE o.email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Moonverse Festival' AND ev.venue = 'Uptown Park, Summarecon Mall Serpong, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 91
FROM events ev WHERE ev.title = 'Moonverse Festival' AND ev.venue = 'Uptown Park, Summarecon Mall Serpong, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ganesha Music Show 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ganesha Music Show 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-277@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-277@wavy.seed' AND a.name = 'Ganesha Music Show 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ganesha Music Show 2026', 'Music', 'Eks Pasar Lanang, Kab. Ponorogo', '2026-07-01 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/MNCPANXFOX.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ganesha Music Show 2026'
WHERE o.email = 'demo.scrape-277@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ganesha Music Show 2026' AND ev.venue = 'Eks Pasar Lanang, Kab. Ponorogo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 21
FROM events ev WHERE ev.title = 'Ganesha Music Show 2026' AND ev.venue = 'Eks Pasar Lanang, Kab. Ponorogo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Makassar International Marching Fest 2026 (MIMFEST 2026)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Makassar International Marching Fest 2026 (MIMFEST 2026)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-278@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-278@wavy.seed' AND a.name = 'Makassar International Marching Fest 2026 (MIMFEST 2026)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Makassar International Marching Fest 2026 (MIMFEST 2026)', 'Music', 'Lapangan Karebosi, Kota Makassar', '2026-07-02 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/NVWAPBJ5AZ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Makassar International Marching Fest 2026 (MIMFEST 2026)'
WHERE o.email = 'demo.scrape-278@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Makassar International Marching Fest 2026 (MIMFEST 2026)' AND ev.venue = 'Lapangan Karebosi, Kota Makassar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 94
FROM events ev WHERE ev.title = 'Makassar International Marching Fest 2026 (MIMFEST 2026)' AND ev.venue = 'Lapangan Karebosi, Kota Makassar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Ninth Ritual "Rise Before Decade"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Ninth Ritual "Rise Before Decade"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-234@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-234@wavy.seed' AND a.name = 'The Ninth Ritual "Rise Before Decade"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Ninth Ritual "Rise Before Decade"', 'Music', 'Rooftop Coffee BTM, Kota Bandung', '2026-07-03 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XCWRQMG80G.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Ninth Ritual "Rise Before Decade"'
WHERE o.email = 'demo.scrape-234@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Ninth Ritual "Rise Before Decade"' AND ev.venue = 'Rooftop Coffee BTM, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 122
FROM events ev WHERE ev.title = 'The Ninth Ritual "Rise Before Decade"' AND ev.venue = 'Rooftop Coffee BTM, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road to Pesta Mangan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road to Pesta Mangan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-279@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-279@wavy.seed' AND a.name = 'Road to Pesta Mangan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road to Pesta Mangan', 'Music', 'ASA Sport Center Cilegon, Kota Cilegon', '2026-07-03 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/P8QI35028D.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road to Pesta Mangan'
WHERE o.email = 'demo.scrape-279@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road to Pesta Mangan' AND ev.venue = 'ASA Sport Center Cilegon, Kota Cilegon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 197
FROM events ev WHERE ev.title = 'Road to Pesta Mangan' AND ev.venue = 'ASA Sport Center Cilegon, Kota Cilegon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ELKAER 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ELKAER 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-280@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-280@wavy.seed' AND a.name = 'ELKAER 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ELKAER 2026', 'Music', 'XT SQUARE, Kota Yogyakarta', '2026-07-04 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/F1CIUBLFS0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ELKAER 2026'
WHERE o.email = 'demo.scrape-280@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ELKAER 2026' AND ev.venue = 'XT SQUARE, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 0
FROM events ev WHERE ev.title = 'ELKAER 2026' AND ev.venue = 'XT SQUARE, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Popstival Vol. 2 - Together We Loud
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Popstival Vol. 2 - Together We Loud', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-281@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-281@wavy.seed' AND a.name = 'The Popstival Vol. 2 - Together We Loud');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Popstival Vol. 2 - Together We Loud', 'Music', 'Hotel Bumi Wiyata Depok, Kota Depok', '2026-07-04 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W0S7OD5XJM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Popstival Vol. 2 - Together We Loud'
WHERE o.email = 'demo.scrape-281@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Popstival Vol. 2 - Together We Loud' AND ev.venue = 'Hotel Bumi Wiyata Depok, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 213
FROM events ev WHERE ev.title = 'The Popstival Vol. 2 - Together We Loud' AND ev.venue = 'Hotel Bumi Wiyata Depok, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PAPUA VAN JAVA - JAYAPURA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PAPUA VAN JAVA - JAYAPURA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-193@wavy.seed' AND a.name = 'PAPUA VAN JAVA - JAYAPURA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PAPUA VAN JAVA - JAYAPURA', 'Music', 'Stadion Mandala, Kota Jayapura', '2026-07-04 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7OW10PZ3P5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PAPUA VAN JAVA - JAYAPURA'
WHERE o.email = 'demo.scrape-193@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PAPUA VAN JAVA - JAYAPURA' AND ev.venue = 'Stadion Mandala, Kota Jayapura');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 259
FROM events ev WHERE ev.title = 'PAPUA VAN JAVA - JAYAPURA' AND ev.venue = 'Stadion Mandala, Kota Jayapura'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Gembira Fest Pangandaran
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Gembira Fest Pangandaran', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-282@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-282@wavy.seed' AND a.name = 'Gembira Fest Pangandaran');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Gembira Fest Pangandaran', 'Music', 'Lapang Timur Wonoharjo - Konser, Taman Wisata Alam Pangandaran - Trail Fun Run, Kab. Pangandaran', '2026-07-04 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JUT5RJPSY6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Gembira Fest Pangandaran'
WHERE o.email = 'demo.scrape-282@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Gembira Fest Pangandaran' AND ev.venue = 'Lapang Timur Wonoharjo - Konser, Taman Wisata Alam Pangandaran - Trail Fun Run, Kab. Pangandaran');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 76
FROM events ev WHERE ev.title = 'Gembira Fest Pangandaran' AND ev.venue = 'Lapang Timur Wonoharjo - Konser, Taman Wisata Alam Pangandaran - Trail Fun Run, Kab. Pangandaran'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Lokakarta Vol. 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Lokakarta Vol. 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-283@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-283@wavy.seed' AND a.name = 'Lokakarta Vol. 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Lokakarta Vol. 2', 'Music', 'Purwakarta, Kab. Purwakarta', '2026-07-05 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CAOPOYLLNH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Lokakarta Vol. 2'
WHERE o.email = 'demo.scrape-283@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Lokakarta Vol. 2' AND ev.venue = 'Purwakarta, Kab. Purwakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 159
FROM events ev WHERE ev.title = 'Lokakarta Vol. 2' AND ev.venue = 'Purwakarta, Kab. Purwakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Noise Speed Killa
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Noise Speed Killa', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-284@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-284@wavy.seed' AND a.name = 'Noise Speed Killa');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Noise Speed Killa', 'Music', 'Le Coffee Wonosobo, Kab. Wonosobo', '2026-07-05 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/A0PB6TAUDC.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Noise Speed Killa'
WHERE o.email = 'demo.scrape-284@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Noise Speed Killa' AND ev.venue = 'Le Coffee Wonosobo, Kab. Wonosobo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 262
FROM events ev WHERE ev.title = 'Noise Speed Killa' AND ev.venue = 'Le Coffee Wonosobo, Kab. Wonosobo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 10 YEARS AGAINST NEW WORLD HARDER
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '10 YEARS AGAINST NEW WORLD HARDER', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-77@wavy.seed' AND a.name = '10 YEARS AGAINST NEW WORLD HARDER');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '10 YEARS AGAINST NEW WORLD HARDER', 'Music', 'NewHope Arena Bekasi, Kota Bekasi', '2026-07-10 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/L0FYF31RIO.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '10 YEARS AGAINST NEW WORLD HARDER'
WHERE o.email = 'demo.scrape-77@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '10 YEARS AGAINST NEW WORLD HARDER' AND ev.venue = 'NewHope Arena Bekasi, Kota Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 251
FROM events ev WHERE ev.title = '10 YEARS AGAINST NEW WORLD HARDER' AND ev.venue = 'NewHope Arena Bekasi, Kota Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Cianjur
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Cianjur', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Cianjur');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Cianjur', 'Music', 'GIGA BEATS, Kab. Cianjur', '2026-07-10 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/90LLU2E6F5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Cianjur'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Cianjur' AND ev.venue = 'GIGA BEATS, Kab. Cianjur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Cianjur' AND ev.venue = 'GIGA BEATS, Kab. Cianjur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL KEBUMEN 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL KEBUMEN 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'TVONE BESTIEVAL KEBUMEN 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL KEBUMEN 2026', 'Music', 'Terminal Bus Kebumen, Kab. Kebumen', '2026-07-11 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZXYPZQ11O4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL KEBUMEN 2026'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL KEBUMEN 2026' AND ev.venue = 'Terminal Bus Kebumen, Kab. Kebumen');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 43
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL KEBUMEN 2026' AND ev.venue = 'Terminal Bus Kebumen, Kab. Kebumen'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- XXTRAORDINARY CONCERT OF MONKEY BOOTS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'XXTRAORDINARY CONCERT OF MONKEY BOOTS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-185@wavy.seed' AND a.name = 'XXTRAORDINARY CONCERT OF MONKEY BOOTS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'XXTRAORDINARY CONCERT OF MONKEY BOOTS', 'Music', 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat', '2026-07-11 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7UGCXTMPYW.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'XXTRAORDINARY CONCERT OF MONKEY BOOTS'
WHERE o.email = 'demo.scrape-185@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'XXTRAORDINARY CONCERT OF MONKEY BOOTS' AND ev.venue = 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 265
FROM events ev WHERE ev.title = 'XXTRAORDINARY CONCERT OF MONKEY BOOTS' AND ev.venue = 'The System Live Space - PFN Heritgae, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- euforia art'11
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'euforia art''11', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-285@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-285@wavy.seed' AND a.name = 'euforia art''11');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'euforia art''11', 'Music', 'De Tjolomadoe, Karanganyar, Kab. Karanganyar', '2026-07-11 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/365PUPU40I.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'euforia art''11'
WHERE o.email = 'demo.scrape-285@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'euforia art''11' AND ev.venue = 'De Tjolomadoe, Karanganyar, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 66000, 500, 105
FROM events ev WHERE ev.title = 'euforia art''11' AND ev.venue = 'De Tjolomadoe, Karanganyar, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Jatinangor
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Jatinangor', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Jatinangor');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Jatinangor', 'Music', 'BAGI KOPI, Kab. Sumedang', '2026-07-11 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/B2P4W4EHYN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Jatinangor'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Jatinangor' AND ev.venue = 'BAGI KOPI, Kab. Sumedang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Jatinangor' AND ev.venue = 'BAGI KOPI, Kab. Sumedang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Uri Chingu Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Uri Chingu Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-286@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-286@wavy.seed' AND a.name = 'Uri Chingu Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Uri Chingu Fest', 'Music', 'Halaman Lapangan DPRD Pemprov Sumsel., Kota Palembang', '2026-07-11 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W4J9JB92UT.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Uri Chingu Fest'
WHERE o.email = 'demo.scrape-286@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Uri Chingu Fest' AND ev.venue = 'Halaman Lapangan DPRD Pemprov Sumsel., Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 188
FROM events ev WHERE ev.title = 'Uri Chingu Fest' AND ev.venue = 'Halaman Lapangan DPRD Pemprov Sumsel., Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria Jambi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Jambi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Riang dan Ceria Jambi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Jambi', 'Music', 'Lapangan Bandara lama Jambi, Kota Jambi', '2026-07-12 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5IJQC5S31T.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Jambi'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria Jambi' AND ev.venue = 'Lapangan Bandara lama Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 42
FROM events ev WHERE ev.title = 'Riang dan Ceria Jambi' AND ev.venue = 'Lapangan Bandara lama Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HONEY - COLD STEEL SHOWCASE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HONEY - COLD STEEL SHOWCASE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'HONEY - COLD STEEL SHOWCASE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HONEY - COLD STEEL SHOWCASE', 'Music', 'FRAGMENT, Kota Bandung', '2026-07-12 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IROHYNNJOM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HONEY - COLD STEEL SHOWCASE'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HONEY - COLD STEEL SHOWCASE' AND ev.venue = 'FRAGMENT, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'HONEY - COLD STEEL SHOWCASE' AND ev.venue = 'FRAGMENT, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Lembang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Lembang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Lembang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Lembang', 'Music', 'KOPI ROMANTIS, Kab. Bandung Barat', '2026-07-12 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/4W5JGEKCS4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Lembang'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Lembang' AND ev.venue = 'KOPI ROMANTIS, Kab. Bandung Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Lembang' AND ev.venue = 'KOPI ROMANTIS, Kab. Bandung Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Thirstday Shout Vol 22
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Thirstday Shout Vol 22', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-236@wavy.seed' AND a.name = 'Thirstday Shout Vol 22');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Thirstday Shout Vol 22', 'Music', 'Rochels Coffee Dago, Kota Bandung', '2026-07-17 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/N0310R9N8N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Thirstday Shout Vol 22'
WHERE o.email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Thirstday Shout Vol 22' AND ev.venue = 'Rochels Coffee Dago, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 218
FROM events ev WHERE ev.title = 'Thirstday Shout Vol 22' AND ev.venue = 'Rochels Coffee Dago, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Banjaran
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Banjaran', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Banjaran');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Banjaran', 'Music', 'TBC, Kab. Bandung', '2026-07-17 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/J52LY6LDH0.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Banjaran'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Banjaran' AND ev.venue = 'TBC, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Banjaran' AND ev.venue = 'TBC, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Unity Fest - Extended Version Padang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Unity Fest - Extended Version Padang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-287@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-287@wavy.seed' AND a.name = 'Unity Fest - Extended Version Padang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Unity Fest - Extended Version Padang', 'Music', 'Lapangan Imam Bonjol, Kota Padang', '2026-07-18 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/6KXTJD265M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Unity Fest - Extended Version Padang'
WHERE o.email = 'demo.scrape-287@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Unity Fest - Extended Version Padang' AND ev.venue = 'Lapangan Imam Bonjol, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 81
FROM events ev WHERE ev.title = 'Unity Fest - Extended Version Padang' AND ev.venue = 'Lapangan Imam Bonjol, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-272@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-272@wavy.seed' AND a.name = 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI', 'Music', 'BT Batik Trusmi Jl. Trusmi No.148, Kabupaten Cirebon, Kota Cirebon', '2026-07-18 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J6S1VJ0OPK.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI'
WHERE o.email = 'demo.scrape-272@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI' AND ev.venue = 'BT Batik Trusmi Jl. Trusmi No.148, Kabupaten Cirebon, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 176
FROM events ev WHERE ev.title = 'CIREBON BERNYANYI SPECIAL EDITION BARENG BT BATIK TRUSMI' AND ev.venue = 'BT Batik Trusmi Jl. Trusmi No.148, Kabupaten Cirebon, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Purwakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Purwakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Purwakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Purwakarta', 'Music', 'AMOUND COFFEE, Kab. Purwakarta', '2026-07-18 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/4IQZX1IH4M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Purwakarta'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Purwakarta' AND ev.venue = 'AMOUND COFFEE, Kab. Purwakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Purwakarta' AND ev.venue = 'AMOUND COFFEE, Kab. Purwakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Industrial Festival Celebration
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Industrial Festival Celebration', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-288@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-288@wavy.seed' AND a.name = 'Industrial Festival Celebration');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Industrial Festival Celebration', 'Music', 'Lapangan utama UMG, Kab. Gresik', '2026-07-19 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BBAO22T36P.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Industrial Festival Celebration'
WHERE o.email = 'demo.scrape-288@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Industrial Festival Celebration' AND ev.venue = 'Lapangan utama UMG, Kab. Gresik');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 94
FROM events ev WHERE ev.title = 'Industrial Festival Celebration' AND ev.venue = 'Lapangan utama UMG, Kab. Gresik'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Saemen Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Saemen Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'Saemen Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Saemen Fest 2026', 'Music', 'Stadion Kridosono, Kota Yogyakarta', '2026-07-19 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GSMT35VFEP.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Saemen Fest 2026'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Saemen Fest 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 159000, 500, 93
FROM events ev WHERE ev.title = 'Saemen Fest 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Subang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Subang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Subang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Subang', 'Music', 'VALLET CAFE, Kab. Subang', '2026-07-19 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/HG1LRW67EU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Subang'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Subang' AND ev.venue = 'VALLET CAFE, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Subang' AND ev.venue = 'VALLET CAFE, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pasir Berisick
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pasir Berisick', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-289@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-289@wavy.seed' AND a.name = 'Pasir Berisick');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pasir Berisick', 'Music', 'Tanjung Cemara Karang Tirta, Kab. Pangandaran', '2026-07-19 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VT1OUA4SDK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pasir Berisick'
WHERE o.email = 'demo.scrape-289@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pasir Berisick' AND ev.venue = 'Tanjung Cemara Karang Tirta, Kab. Pangandaran');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 107
FROM events ev WHERE ev.title = 'Pasir Berisick' AND ev.venue = 'Tanjung Cemara Karang Tirta, Kab. Pangandaran'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Phase Shift
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Phase Shift', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-290@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-290@wavy.seed' AND a.name = 'Phase Shift');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Phase Shift', 'Music', 'Taman Budaya Aceh, Kota Banda Aceh', '2026-07-21 16:30:01'::timestamptz, 'https://assets.artatix.co.id/event/UY53DMD3GM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Phase Shift'
WHERE o.email = 'demo.scrape-290@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Phase Shift' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 90
FROM events ev WHERE ev.title = 'Phase Shift' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Porak Poranda "PEACH" Dumai
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Porak Poranda "PEACH" Dumai', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-291@wavy.seed' AND a.name = 'Porak Poranda "PEACH" Dumai');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Porak Poranda "PEACH" Dumai', 'Music', 'Muolaa Coffee Dumai, Kota Dumai', '2026-07-24 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RDDZ3BXI0J.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Porak Poranda "PEACH" Dumai'
WHERE o.email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Porak Poranda "PEACH" Dumai' AND ev.venue = 'Muolaa Coffee Dumai, Kota Dumai');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 133
FROM events ev WHERE ev.title = 'Porak Poranda "PEACH" Dumai' AND ev.venue = 'Muolaa Coffee Dumai, Kota Dumai'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tak Kalah Kasat Mata
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tak Kalah Kasat Mata', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-252@wavy.seed' AND a.name = 'Tak Kalah Kasat Mata');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tak Kalah Kasat Mata', 'Music', 'Muara Space, Palembang, Kota Palembang', '2026-07-24 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/L2TSK90K6Q.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tak Kalah Kasat Mata'
WHERE o.email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tak Kalah Kasat Mata' AND ev.venue = 'Muara Space, Palembang, Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 126
FROM events ev WHERE ev.title = 'Tak Kalah Kasat Mata' AND ev.venue = 'Muara Space, Palembang, Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PIASE 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PIASE 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-292@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-292@wavy.seed' AND a.name = 'PIASE 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PIASE 2026', 'Music', 'ITC Depok Jl. Margonda No.56, Depok, Kec. Pancoran Mas, Kota Depok', '2026-07-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/650XVL2X4P.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PIASE 2026'
WHERE o.email = 'demo.scrape-292@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PIASE 2026' AND ev.venue = 'ITC Depok Jl. Margonda No.56, Depok, Kec. Pancoran Mas, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 59000, 500, 156
FROM events ev WHERE ev.title = 'PIASE 2026' AND ev.venue = 'ITC Depok Jl. Margonda No.56, Depok, Kec. Pancoran Mas, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Semesta Merestui
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Semesta Merestui', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-293@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-293@wavy.seed' AND a.name = 'Semesta Merestui');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Semesta Merestui', 'Music', 'Lapangan PKOR Way Halim, Kota Bandar Lampung', '2026-07-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/P7S1FGAYFH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Semesta Merestui'
WHERE o.email = 'demo.scrape-293@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Semesta Merestui' AND ev.venue = 'Lapangan PKOR Way Halim, Kota Bandar Lampung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 155000, 500, 179
FROM events ev WHERE ev.title = 'Semesta Merestui' AND ev.venue = 'Lapangan PKOR Way Halim, Kota Bandar Lampung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Kuningan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Kuningan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Kuningan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Kuningan', 'Music', 'ERION SPACE, Kab. Kuningan', '2026-07-24 12:15:01'::timestamptz, 'https://assets.artatix.co.id/event/N0QVMII9X9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Kuningan'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Kuningan' AND ev.venue = 'ERION SPACE, Kab. Kuningan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Kuningan' AND ev.venue = 'ERION SPACE, Kab. Kuningan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Porak Poranda "PEACH" Pekanbaru
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Porak Poranda "PEACH" Pekanbaru', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-291@wavy.seed' AND a.name = 'Porak Poranda "PEACH" Pekanbaru');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Porak Poranda "PEACH" Pekanbaru', 'Music', 'Marco Coffee, Kota Pekanbaru', '2026-07-25 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3AN97Q0SYF.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Porak Poranda "PEACH" Pekanbaru'
WHERE o.email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Porak Poranda "PEACH" Pekanbaru' AND ev.venue = 'Marco Coffee, Kota Pekanbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 133
FROM events ev WHERE ev.title = 'Porak Poranda "PEACH" Pekanbaru' AND ev.venue = 'Marco Coffee, Kota Pekanbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GIGS BAPAK VOL. 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GIGS BAPAK VOL. 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-294@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-294@wavy.seed' AND a.name = 'GIGS BAPAK VOL. 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GIGS BAPAK VOL. 3', 'Music', 'SPILL & BITES, Kota Bandung', '2026-07-25 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XXGZILSYKV.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GIGS BAPAK VOL. 3'
WHERE o.email = 'demo.scrape-294@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GIGS BAPAK VOL. 3' AND ev.venue = 'SPILL & BITES, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 182
FROM events ev WHERE ev.title = 'GIGS BAPAK VOL. 3' AND ev.venue = 'SPILL & BITES, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SMASA FAIR x Music Festival "TANAYA x Berkilauan"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-295@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-295@wavy.seed' AND a.name = 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"', 'Music', 'SMA Negeri 1 Banjarmasin, Kota Banjarmasin', '2026-07-25 16:20:01'::timestamptz, 'https://assets.artatix.co.id/event/46C9MZW9V1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"'
WHERE o.email = 'demo.scrape-295@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"' AND ev.venue = 'SMA Negeri 1 Banjarmasin, Kota Banjarmasin');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 128250, 500, 135
FROM events ev WHERE ev.title = 'SMASA FAIR x Music Festival "TANAYA x Berkilauan"' AND ev.venue = 'SMA Negeri 1 Banjarmasin, Kota Banjarmasin'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Melangkah Bersama Vol. 9
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Melangkah Bersama Vol. 9', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-6@wavy.seed' AND a.name = 'Melangkah Bersama Vol. 9');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Melangkah Bersama Vol. 9', 'Music', 'Yogyakarta, Kota Yogyakarta', '2026-07-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GNH49TOK7Z.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Melangkah Bersama Vol. 9'
WHERE o.email = 'demo.scrape-6@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Melangkah Bersama Vol. 9' AND ev.venue = 'Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 30000, 500, 208
FROM events ev WHERE ev.title = 'Melangkah Bersama Vol. 9' AND ev.venue = 'Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- UNITY FEST EXTENDED VERSION BENGKULU
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'UNITY FEST EXTENDED VERSION BENGKULU', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-296@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-296@wavy.seed' AND a.name = 'UNITY FEST EXTENDED VERSION BENGKULU');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'UNITY FEST EXTENDED VERSION BENGKULU', 'Music', 'Lap. Sport Centre Pantai Panjang Kota Bengkulu, Kota Bengkulu', '2026-07-25 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5F316NJA6R.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'UNITY FEST EXTENDED VERSION BENGKULU'
WHERE o.email = 'demo.scrape-296@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'UNITY FEST EXTENDED VERSION BENGKULU' AND ev.venue = 'Lap. Sport Centre Pantai Panjang Kota Bengkulu, Kota Bengkulu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 198
FROM events ev WHERE ev.title = 'UNITY FEST EXTENDED VERSION BENGKULU' AND ev.venue = 'Lap. Sport Centre Pantai Panjang Kota Bengkulu, Kota Bengkulu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Metafora Project Festival Jepara vol 2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Metafora Project Festival Jepara vol 2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-297@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-297@wavy.seed' AND a.name = 'Metafora Project Festival Jepara vol 2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Metafora Project Festival Jepara vol 2', 'Music', 'Jepara, Kab. Jepara', '2026-07-25 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VOAQLZEQJH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Metafora Project Festival Jepara vol 2'
WHERE o.email = 'demo.scrape-297@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Metafora Project Festival Jepara vol 2' AND ev.venue = 'Jepara, Kab. Jepara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 281
FROM events ev WHERE ev.title = 'Metafora Project Festival Jepara vol 2' AND ev.venue = 'Jepara, Kab. Jepara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ermukim Party Vol 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ermukim Party Vol 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-298@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-298@wavy.seed' AND a.name = 'Ermukim Party Vol 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ermukim Party Vol 3', 'Music', 'Transmart Maguwo, Kab. Sleman', '2026-07-25 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1IQP6JAVK0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ermukim Party Vol 3'
WHERE o.email = 'demo.scrape-298@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ermukim Party Vol 3' AND ev.venue = 'Transmart Maguwo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 54
FROM events ev WHERE ev.title = 'Ermukim Party Vol 3' AND ev.venue = 'Transmart Maguwo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Cirebon
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Cirebon', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Cirebon');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Cirebon', 'Music', 'HIMAS COFFEE, Kota Cirebon', '2026-07-25 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/H6C0Q3CW1B.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Cirebon'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Cirebon' AND ev.venue = 'HIMAS COFFEE, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Cirebon' AND ev.venue = 'HIMAS COFFEE, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Burnout x Tegangan Tinggi - Maranggeni
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Burnout x Tegangan Tinggi - Maranggeni', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-299@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-299@wavy.seed' AND a.name = 'Burnout x Tegangan Tinggi - Maranggeni');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Burnout x Tegangan Tinggi - Maranggeni', 'Music', 'Area Parkir Barat De Tjolomadoe, Kab. Karanganyar', '2026-07-25 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LR7HA8RP8M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Burnout x Tegangan Tinggi - Maranggeni'
WHERE o.email = 'demo.scrape-299@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Burnout x Tegangan Tinggi - Maranggeni' AND ev.venue = 'Area Parkir Barat De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 237
FROM events ev WHERE ev.title = 'Burnout x Tegangan Tinggi - Maranggeni' AND ev.venue = 'Area Parkir Barat De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JOGJA SCOOTER PARADE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JOGJA SCOOTER PARADE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-300@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-300@wavy.seed' AND a.name = 'JOGJA SCOOTER PARADE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JOGJA SCOOTER PARADE', 'Music', 'Jogja Expo Center, Kab. Bantul', '2026-07-25 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IBE18P0YN3.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JOGJA SCOOTER PARADE'
WHERE o.email = 'demo.scrape-300@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JOGJA SCOOTER PARADE' AND ev.venue = 'Jogja Expo Center, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 110
FROM events ev WHERE ev.title = 'JOGJA SCOOTER PARADE' AND ev.venue = 'Jogja Expo Center, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GADO-GADO XVII
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GADO-GADO XVII', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-301@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-301@wavy.seed' AND a.name = 'GADO-GADO XVII');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GADO-GADO XVII', 'Music', 'SMA NEGERI 39 JAKARTA, Kota Adm. Jakarta Timur', '2026-07-25 07:30:01'::timestamptz, 'https://assets.artatix.co.id/event/FEFXLQHH9N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GADO-GADO XVII'
WHERE o.email = 'demo.scrape-301@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GADO-GADO XVII' AND ev.venue = 'SMA NEGERI 39 JAKARTA, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 33
FROM events ev WHERE ev.title = 'GADO-GADO XVII' AND ev.venue = 'SMA NEGERI 39 JAKARTA, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GIGSGOKS FESTIVAL 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GIGSGOKS FESTIVAL 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-302@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-302@wavy.seed' AND a.name = 'GIGSGOKS FESTIVAL 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GIGSGOKS FESTIVAL 2026', 'Music', 'LAPANGAN PARKIR UTARA, MAL CIPUTRA TANGERANG, CITRA RAYA, KABUPATEN TANGERANG, Kab. Tangerang', '2026-07-25 01:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3WWF7VJXZS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GIGSGOKS FESTIVAL 2026'
WHERE o.email = 'demo.scrape-302@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GIGSGOKS FESTIVAL 2026' AND ev.venue = 'LAPANGAN PARKIR UTARA, MAL CIPUTRA TANGERANG, CITRA RAYA, KABUPATEN TANGERANG, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 56
FROM events ev WHERE ev.title = 'GIGSGOKS FESTIVAL 2026' AND ev.venue = 'LAPANGAN PARKIR UTARA, MAL CIPUTRA TANGERANG, CITRA RAYA, KABUPATEN TANGERANG, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Paul Aro 'Lost In Jakarta'
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Paul Aro ''Lost In Jakarta''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-303@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-303@wavy.seed' AND a.name = 'Paul Aro ''Lost In Jakarta''');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Paul Aro ''Lost In Jakarta''', 'Music', '62 Coffee & Space, Kota Adm. Jakarta Selatan', '2026-07-26 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/D4KI0KKH9Q.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Paul Aro ''Lost In Jakarta'''
WHERE o.email = 'demo.scrape-303@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Paul Aro ''Lost In Jakarta''' AND ev.venue = '62 Coffee & Space, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 119
FROM events ev WHERE ev.title = 'Paul Aro ''Lost In Jakarta''' AND ev.venue = '62 Coffee & Space, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FestivalnYa Pedangdut
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FestivalnYa Pedangdut', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-1@wavy.seed' AND a.name = 'FestivalnYa Pedangdut');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FestivalnYa Pedangdut', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-07-26 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/8383GONTJV.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FestivalnYa Pedangdut'
WHERE o.email = 'demo.scrape-1@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FestivalnYa Pedangdut' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 163
FROM events ev WHERE ev.title = 'FestivalnYa Pedangdut' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - SEMARANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - SEMARANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - SEMARANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - SEMARANG', 'Music', 'PRPP SEMARANG, Kota Semarang', '2026-07-26 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q6Z496IVY6.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - SEMARANG'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - SEMARANG' AND ev.venue = 'PRPP SEMARANG, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 37
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - SEMARANG' AND ev.venue = 'PRPP SEMARANG, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road to Eternal Blast Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road to Eternal Blast Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-304@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-304@wavy.seed' AND a.name = 'Road to Eternal Blast Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road to Eternal Blast Fest', 'Music', 'Tropical House Cafe, Kab. Tulungagung', '2026-07-26 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LUQ0M93VR3.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road to Eternal Blast Fest'
WHERE o.email = 'demo.scrape-304@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road to Eternal Blast Fest' AND ev.venue = 'Tropical House Cafe, Kab. Tulungagung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 74666, 500, 28
FROM events ev WHERE ev.title = 'Road to Eternal Blast Fest' AND ev.venue = 'Tropical House Cafe, Kab. Tulungagung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Kota Bandung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Kota Bandung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Kota Bandung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Kota Bandung', 'Music', 'bandung, Kota Bandung', '2026-07-26 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4W5VPI2BNJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Kota Bandung'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Kota Bandung' AND ev.venue = 'bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Kota Bandung' AND ev.venue = 'bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Chaotic Distort
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Chaotic Distort', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-228@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-228@wavy.seed' AND a.name = 'Chaotic Distort');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Chaotic Distort', 'Music', 'Fabriek Padang, Kota Padang', '2026-07-26 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/NJ85LHT5G3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Chaotic Distort'
WHERE o.email = 'demo.scrape-228@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Chaotic Distort' AND ev.venue = 'Fabriek Padang, Kota Padang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 264
FROM events ev WHERE ev.title = 'Chaotic Distort' AND ev.venue = 'Fabriek Padang, Kota Padang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hingar Binar Vol.1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hingar Binar Vol.1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-305@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-305@wavy.seed' AND a.name = 'Hingar Binar Vol.1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hingar Binar Vol.1', 'Music', 'Binar Sebaya, Kota Surabaya', '2026-07-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OB9DEJMS9M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hingar Binar Vol.1'
WHERE o.email = 'demo.scrape-305@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hingar Binar Vol.1' AND ev.venue = 'Binar Sebaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 165
FROM events ev WHERE ev.title = 'Hingar Binar Vol.1' AND ev.venue = 'Binar Sebaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pasti Pesta Chapter II
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pasti Pesta Chapter II', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-160@wavy.seed' AND a.name = 'Pasti Pesta Chapter II');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pasti Pesta Chapter II', 'Music', 'Lapangan Bandara lama Jambi, Kota Jambi', '2026-07-31 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KXPTANS0B5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pasti Pesta Chapter II'
WHERE o.email = 'demo.scrape-160@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pasti Pesta Chapter II' AND ev.venue = 'Lapangan Bandara lama Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 20
FROM events ev WHERE ev.title = 'Pasti Pesta Chapter II' AND ev.venue = 'Lapangan Bandara lama Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Malam Ini Kita Ambyar
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Malam Ini Kita Ambyar', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-306@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-306@wavy.seed' AND a.name = 'Malam Ini Kita Ambyar');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Malam Ini Kita Ambyar', 'Music', 'Pantai Kilang Mandiri, Balikpapan, Kota Balikpapan', '2026-07-31 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V2LLBVNX5A.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Malam Ini Kita Ambyar'
WHERE o.email = 'demo.scrape-306@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Malam Ini Kita Ambyar' AND ev.venue = 'Pantai Kilang Mandiri, Balikpapan, Kota Balikpapan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 278
FROM events ev WHERE ev.title = 'Malam Ini Kita Ambyar' AND ev.venue = 'Pantai Kilang Mandiri, Balikpapan, Kota Balikpapan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Konser Teruntuk Kamu Punar Album Tour
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Konser Teruntuk Kamu Punar Album Tour', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-307@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-307@wavy.seed' AND a.name = 'Konser Teruntuk Kamu Punar Album Tour');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Konser Teruntuk Kamu Punar Album Tour', 'Music', 'Fbn Artisantz Parking, Kota Malang', '2026-07-31 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UJKNK26S0B.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Konser Teruntuk Kamu Punar Album Tour'
WHERE o.email = 'demo.scrape-307@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Konser Teruntuk Kamu Punar Album Tour' AND ev.venue = 'Fbn Artisantz Parking, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 98000, 500, 201
FROM events ev WHERE ev.title = 'Konser Teruntuk Kamu Punar Album Tour' AND ev.venue = 'Fbn Artisantz Parking, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Pangandaran
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Pangandaran', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Pangandaran');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Pangandaran', 'Music', 'PAWON ANGLO, Kab. Pangandaran', '2026-07-31 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KYLP8P9VA4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Pangandaran'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Pangandaran' AND ev.venue = 'PAWON ANGLO, Kab. Pangandaran');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Pangandaran' AND ev.venue = 'PAWON ANGLO, Kab. Pangandaran'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Unity Fest - Extended Version Jambi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Unity Fest - Extended Version Jambi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-308@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-308@wavy.seed' AND a.name = 'Unity Fest - Extended Version Jambi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Unity Fest - Extended Version Jambi', 'Music', 'Lapangan Bandara Lama Jambi, Kota Jambi', '2026-08-01 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/YYC08Q3GHL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Unity Fest - Extended Version Jambi'
WHERE o.email = 'demo.scrape-308@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Unity Fest - Extended Version Jambi' AND ev.venue = 'Lapangan Bandara Lama Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 64
FROM events ev WHERE ev.title = 'Unity Fest - Extended Version Jambi' AND ev.venue = 'Lapangan Bandara Lama Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Legacy Continues
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Legacy Continues', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-309@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-309@wavy.seed' AND a.name = 'Legacy Continues');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Legacy Continues', 'Music', 'GEDUNG SABUDGA UNISDA LAMONGAN, Kab. Lamongan', '2026-08-01 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/SGXOUA60DS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Legacy Continues'
WHERE o.email = 'demo.scrape-309@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Legacy Continues' AND ev.venue = 'GEDUNG SABUDGA UNISDA LAMONGAN, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 77
FROM events ev WHERE ev.title = 'Legacy Continues' AND ev.venue = 'GEDUNG SABUDGA UNISDA LAMONGAN, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Partilibur 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Partilibur 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-310@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-310@wavy.seed' AND a.name = 'Partilibur 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Partilibur 2026', 'Music', 'BNS - Batu Night Spectacular, Kota Batu', '2026-08-01 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/T682VJK9AQ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Partilibur 2026'
WHERE o.email = 'demo.scrape-310@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Partilibur 2026' AND ev.venue = 'BNS - Batu Night Spectacular, Kota Batu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 80
FROM events ev WHERE ev.title = 'Partilibur 2026' AND ev.venue = 'BNS - Batu Night Spectacular, Kota Batu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Garut
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Garut', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Garut');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Garut', 'Music', 'TEMU SPACE, Kab. Garut', '2026-08-01 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AXLMIGGP1M.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Garut'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Garut' AND ev.venue = 'TEMU SPACE, Kab. Garut');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Garut' AND ev.venue = 'TEMU SPACE, Kab. Garut'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Hi Summer Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Hi Summer Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-311@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-311@wavy.seed' AND a.name = 'Hi Summer Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Hi Summer Fest', 'Music', 'Lapangan Utama, Budi Luhur University, Kota Adm. Jakarta Selatan', '2026-08-02 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W340NP3SYA.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Hi Summer Fest'
WHERE o.email = 'demo.scrape-311@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Hi Summer Fest' AND ev.venue = 'Lapangan Utama, Budi Luhur University, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 103
FROM events ev WHERE ev.title = 'Hi Summer Fest' AND ev.venue = 'Lapangan Utama, Budi Luhur University, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Sumedang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Sumedang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Sumedang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Sumedang', 'Music', 'ZAZI CAFE, Kab. Sumedang', '2026-08-02 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/EFDWL89IEA.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Sumedang'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Sumedang' AND ev.venue = 'ZAZI CAFE, Kab. Sumedang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Sumedang' AND ev.venue = 'ZAZI CAFE, Kab. Sumedang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Cerita Tentang Hujan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Cerita Tentang Hujan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-312@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-312@wavy.seed' AND a.name = 'Cerita Tentang Hujan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Cerita Tentang Hujan', 'Music', 'Makka Koffie, Kota Mojokerto', '2026-08-06 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LRRNW2SHN0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Cerita Tentang Hujan'
WHERE o.email = 'demo.scrape-312@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Cerita Tentang Hujan' AND ev.venue = 'Makka Koffie, Kota Mojokerto');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 176
FROM events ev WHERE ev.title = 'Cerita Tentang Hujan' AND ev.venue = 'Makka Koffie, Kota Mojokerto'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spectacious 36
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spectacious 36', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-313@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-313@wavy.seed' AND a.name = 'Spectacious 36');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spectacious 36', 'Music', 'Lapangan MAN 2 Tulungagung, Kab. Tulungagung', '2026-08-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JEW9DYWS5B.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spectacious 36'
WHERE o.email = 'demo.scrape-313@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spectacious 36' AND ev.venue = 'Lapangan MAN 2 Tulungagung, Kab. Tulungagung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 179
FROM events ev WHERE ev.title = 'Spectacious 36' AND ev.venue = 'Lapangan MAN 2 Tulungagung, Kab. Tulungagung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Tasikmalaya
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Tasikmalaya', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Tasikmalaya');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Tasikmalaya', 'Music', 'BENTO KOPI, Kab. Tasikmalaya', '2026-08-07 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OV5HGMRIIL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Tasikmalaya'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Tasikmalaya' AND ev.venue = 'BENTO KOPI, Kab. Tasikmalaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Tasikmalaya' AND ev.venue = 'BENTO KOPI, Kab. Tasikmalaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Majalengka
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Majalengka', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Majalengka');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Majalengka', 'Music', 'FIKSI COFFE AND SPACE, Kab. Majalengka', '2026-08-07 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J9QJKS4FGA.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Majalengka'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Majalengka' AND ev.venue = 'FIKSI COFFE AND SPACE, Kab. Majalengka');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Majalengka' AND ev.venue = 'FIKSI COFFE AND SPACE, Kab. Majalengka'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NO FEAR OF PAIN VOL 5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NO FEAR OF PAIN VOL 5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'NO FEAR OF PAIN VOL 5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NO FEAR OF PAIN VOL 5', 'Music', 'TBA, Kota Bandung', '2026-08-07 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4C1GMDNVXI.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NO FEAR OF PAIN VOL 5'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 5' AND ev.venue = 'TBA, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'NO FEAR OF PAIN VOL 5' AND ev.venue = 'TBA, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- UNITY FEST - EXTENDED VERSION LAMPUNG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'UNITY FEST - EXTENDED VERSION LAMPUNG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-314@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-314@wavy.seed' AND a.name = 'UNITY FEST - EXTENDED VERSION LAMPUNG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'UNITY FEST - EXTENDED VERSION LAMPUNG', 'Music', 'LAPANGAN SABURAI, Kota Bandar Lampung', '2026-08-08 17:30:01'::timestamptz, 'https://assets.artatix.co.id/event/04HF7NJT5K.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'UNITY FEST - EXTENDED VERSION LAMPUNG'
WHERE o.email = 'demo.scrape-314@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'UNITY FEST - EXTENDED VERSION LAMPUNG' AND ev.venue = 'LAPANGAN SABURAI, Kota Bandar Lampung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 142
FROM events ev WHERE ev.title = 'UNITY FEST - EXTENDED VERSION LAMPUNG' AND ev.venue = 'LAPANGAN SABURAI, Kota Bandar Lampung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FISIP DUWE GAWE VOLL.X
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FISIP DUWE GAWE VOLL.X', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-315@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-315@wavy.seed' AND a.name = 'FISIP DUWE GAWE VOLL.X');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FISIP DUWE GAWE VOLL.X', 'Music', 'Cirebon, Kota Cirebon', '2026-08-08 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/X1NGDHFV7T.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FISIP DUWE GAWE VOLL.X'
WHERE o.email = 'demo.scrape-315@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FISIP DUWE GAWE VOLL.X' AND ev.venue = 'Cirebon, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 215
FROM events ev WHERE ev.title = 'FISIP DUWE GAWE VOLL.X' AND ev.venue = 'Cirebon, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Shout Of Sound - Indramayu
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Shout Of Sound - Indramayu', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-9@wavy.seed' AND a.name = 'Shout Of Sound - Indramayu');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Shout Of Sound - Indramayu', 'Music', 'HOPE SPACE COFFE AND EATERY, Kab. Indramayu', '2026-08-08 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/D0CDA0DIEU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Shout Of Sound - Indramayu'
WHERE o.email = 'demo.scrape-9@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Shout Of Sound - Indramayu' AND ev.venue = 'HOPE SPACE COFFE AND EATERY, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 7
FROM events ev WHERE ev.title = 'Shout Of Sound - Indramayu' AND ev.venue = 'HOPE SPACE COFFE AND EATERY, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol. 33
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol. 33', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol. 33');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol. 33', 'Music', 'Jogja National Museum, Kota Yogyakarta', '2026-08-13 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/H52YOVUWUJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol. 33'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol. 33' AND ev.venue = 'Jogja National Museum, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 253
FROM events ev WHERE ev.title = 'Simak Siar Vol. 33' AND ev.venue = 'Jogja National Museum, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SAINT OF MEMORANDUM - SOLO
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SAINT OF MEMORANDUM - SOLO', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-39@wavy.seed' AND a.name = 'SAINT OF MEMORANDUM - SOLO');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SAINT OF MEMORANDUM - SOLO', 'Music', 'De Tjolomadoe, Kota Surakarta', '2026-08-14 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QVCHQ1NOV2.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SAINT OF MEMORANDUM - SOLO'
WHERE o.email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SAINT OF MEMORANDUM - SOLO' AND ev.venue = 'De Tjolomadoe, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 77000, 500, 77
FROM events ev WHERE ev.title = 'SAINT OF MEMORANDUM - SOLO' AND ev.venue = 'De Tjolomadoe, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria Bengkulu
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Bengkulu', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Riang dan Ceria Bengkulu');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Bengkulu', 'Music', 'Lap Sport Center Bengkulu, Kota Bengkulu', '2026-08-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U4WE5J2OD0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Bengkulu'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria Bengkulu' AND ev.venue = 'Lap Sport Center Bengkulu, Kota Bengkulu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 95000, 500, 122
FROM events ev WHERE ev.title = 'Riang dan Ceria Bengkulu' AND ev.venue = 'Lap Sport Center Bengkulu, Kota Bengkulu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SAINT OF MEMORANDUM - PATI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SAINT OF MEMORANDUM - PATI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-39@wavy.seed' AND a.name = 'SAINT OF MEMORANDUM - PATI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SAINT OF MEMORANDUM - PATI', 'Music', 'Halaman Stadion Joyokusumo, Kab. Pati', '2026-08-15 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/R46T883MFV.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SAINT OF MEMORANDUM - PATI'
WHERE o.email = 'demo.scrape-39@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SAINT OF MEMORANDUM - PATI' AND ev.venue = 'Halaman Stadion Joyokusumo, Kab. Pati');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 77000, 500, 77
FROM events ev WHERE ev.title = 'SAINT OF MEMORANDUM - PATI' AND ev.venue = 'Halaman Stadion Joyokusumo, Kab. Pati'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Two Anchor Aweigh
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Two Anchor Aweigh', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-195@wavy.seed' AND a.name = 'Two Anchor Aweigh');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Two Anchor Aweigh', 'Music', 'Sailors Club, Kota Surabaya', '2026-08-15 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/A8ULUZNDU3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Two Anchor Aweigh'
WHERE o.email = 'demo.scrape-195@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Two Anchor Aweigh' AND ev.venue = 'Sailors Club, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 45
FROM events ev WHERE ev.title = 'Two Anchor Aweigh' AND ev.venue = 'Sailors Club, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Otw Break Out Day 2026 Cianjur
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Otw Break Out Day 2026 Cianjur', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-316@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-316@wavy.seed' AND a.name = 'Otw Break Out Day 2026 Cianjur');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Otw Break Out Day 2026 Cianjur', 'Music', 'CIANJUR, Kab. Cianjur', '2026-08-15 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RVZ9ATK944.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Otw Break Out Day 2026 Cianjur'
WHERE o.email = 'demo.scrape-316@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Otw Break Out Day 2026 Cianjur' AND ev.venue = 'CIANJUR, Kab. Cianjur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'Otw Break Out Day 2026 Cianjur' AND ev.venue = 'CIANJUR, Kab. Cianjur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LAMPION 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LAMPION 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-317@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-317@wavy.seed' AND a.name = 'LAMPION 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LAMPION 2026', 'Music', 'Senayan Park ''SPARK'' Pulau Satu, Kota Adm. Jakarta Pusat', '2026-08-15 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IEEVC67IKD.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LAMPION 2026'
WHERE o.email = 'demo.scrape-317@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LAMPION 2026' AND ev.venue = 'Senayan Park ''SPARK'' Pulau Satu, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 81000, 500, 151
FROM events ev WHERE ev.title = 'LAMPION 2026' AND ev.venue = 'Senayan Park ''SPARK'' Pulau Satu, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DAWN GONG MUSIC CAMPOUT 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DAWN GONG MUSIC CAMPOUT 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-10@wavy.seed' AND a.name = 'DAWN GONG MUSIC CAMPOUT 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DAWN GONG MUSIC CAMPOUT 2026', 'Music', 'ARKAMAYA KUSUMA, Kab. Sleman', '2026-08-15 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/R2MLQUCIQY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DAWN GONG MUSIC CAMPOUT 2026'
WHERE o.email = 'demo.scrape-10@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DAWN GONG MUSIC CAMPOUT 2026' AND ev.venue = 'ARKAMAYA KUSUMA, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 80
FROM events ev WHERE ev.title = 'DAWN GONG MUSIC CAMPOUT 2026' AND ev.venue = 'ARKAMAYA KUSUMA, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DISCHARGE
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DISCHARGE', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-210@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-210@wavy.seed' AND a.name = 'DISCHARGE');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DISCHARGE', 'Music', 'PFN HERITAGE, Kota Adm. Jakarta Timur', '2026-08-16 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XZ0EY6SJYR.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DISCHARGE'
WHERE o.email = 'demo.scrape-210@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DISCHARGE' AND ev.venue = 'PFN HERITAGE, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 10
FROM events ev WHERE ev.title = 'DISCHARGE' AND ev.venue = 'PFN HERITAGE, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - SOLO
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - SOLO', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - SOLO');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - SOLO', 'Music', 'Kali Pepe Land Solo, Kab. Boyolali', '2026-08-16 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2ERVVTZPH0.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - SOLO'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - SOLO' AND ev.venue = 'Kali Pepe Land Solo, Kab. Boyolali');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 47
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - SOLO' AND ev.venue = 'Kali Pepe Land Solo, Kab. Boyolali'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NEVERLAND BANDUNG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NEVERLAND BANDUNG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-213@wavy.seed' AND a.name = 'NEVERLAND BANDUNG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NEVERLAND BANDUNG', 'Music', 'Pangkalan TNI AU Husein Sastranegara, Kota Bandung', '2026-08-16 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/BN46GU5FWO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NEVERLAND BANDUNG'
WHERE o.email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NEVERLAND BANDUNG' AND ev.venue = 'Pangkalan TNI AU Husein Sastranegara, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 109
FROM events ev WHERE ev.title = 'NEVERLAND BANDUNG' AND ev.venue = 'Pangkalan TNI AU Husein Sastranegara, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- VICTORY NIGHT
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'VICTORY NIGHT', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-318@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-318@wavy.seed' AND a.name = 'VICTORY NIGHT');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'VICTORY NIGHT', 'Music', 'SEVENDREAM CITY JEMBER, Kab. Jember', '2026-08-17 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/7AINYGC6CJ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'VICTORY NIGHT'
WHERE o.email = 'demo.scrape-318@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'VICTORY NIGHT' AND ev.venue = 'SEVENDREAM CITY JEMBER, Kab. Jember');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 254
FROM events ev WHERE ev.title = 'VICTORY NIGHT' AND ev.venue = 'SEVENDREAM CITY JEMBER, Kab. Jember'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Skuteran Merdeka 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Skuteran Merdeka 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-230@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-230@wavy.seed' AND a.name = 'Skuteran Merdeka 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Skuteran Merdeka 2026', 'Music', 'Kolam Retensi Purwokerto, Kab. Banyumas', '2026-08-17 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZG20KJI8HI.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Skuteran Merdeka 2026'
WHERE o.email = 'demo.scrape-230@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Skuteran Merdeka 2026' AND ev.venue = 'Kolam Retensi Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 70
FROM events ev WHERE ev.title = 'Skuteran Merdeka 2026' AND ev.venue = 'Kolam Retensi Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Vigorphoria Manna
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Vigorphoria Manna', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Vigorphoria Manna');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Vigorphoria Manna', 'Music', 'Lapangan Padang Panjang Manna, Kab. Bengkulu Selatan', '2026-08-18 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LT3IYHXC92.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Vigorphoria Manna'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Vigorphoria Manna' AND ev.venue = 'Lapangan Padang Panjang Manna, Kab. Bengkulu Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 142
FROM events ev WHERE ev.title = 'Vigorphoria Manna' AND ev.venue = 'Lapangan Padang Panjang Manna, Kab. Bengkulu Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Colorcode "Show No Tears Showcase 2026"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Colorcode "Show No Tears Showcase 2026"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-319@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-319@wavy.seed' AND a.name = 'Colorcode "Show No Tears Showcase 2026"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Colorcode "Show No Tears Showcase 2026"', 'Music', 'Ballroom Gramm Hotel by Ambarukmo, Kab. Sleman', '2026-08-21 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/18FFZB65RI.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Colorcode "Show No Tears Showcase 2026"'
WHERE o.email = 'demo.scrape-319@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Colorcode "Show No Tears Showcase 2026"' AND ev.venue = 'Ballroom Gramm Hotel by Ambarukmo, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 117
FROM events ev WHERE ev.title = 'Colorcode "Show No Tears Showcase 2026"' AND ev.venue = 'Ballroom Gramm Hotel by Ambarukmo, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Vigorphoria Fajar Bulan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Vigorphoria Fajar Bulan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Vigorphoria Fajar Bulan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Vigorphoria Fajar Bulan', 'Music', 'Lapangan Sanayuda Fajar, Kab. Lampung Barat', '2026-08-21 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XYFRS73EYT.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Vigorphoria Fajar Bulan'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Vigorphoria Fajar Bulan' AND ev.venue = 'Lapangan Sanayuda Fajar, Kab. Lampung Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 142
FROM events ev WHERE ev.title = 'Vigorphoria Fajar Bulan' AND ev.venue = 'Lapangan Sanayuda Fajar, Kab. Lampung Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Otw Break Out Day 2026 Cirebon
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Otw Break Out Day 2026 Cirebon', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-316@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-316@wavy.seed' AND a.name = 'Otw Break Out Day 2026 Cirebon');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Otw Break Out Day 2026 Cirebon', 'Music', 'CIREBON, Kab. Cirebon', '2026-08-22 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZHUFQ4WH7Y.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Otw Break Out Day 2026 Cirebon'
WHERE o.email = 'demo.scrape-316@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Otw Break Out Day 2026 Cirebon' AND ev.venue = 'CIREBON, Kab. Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 168
FROM events ev WHERE ev.title = 'Otw Break Out Day 2026 Cirebon' AND ev.venue = 'CIREBON, Kab. Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road To Lepas Penat Vol. 5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road To Lepas Penat Vol. 5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-68@wavy.seed' AND a.name = 'Road To Lepas Penat Vol. 5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road To Lepas Penat Vol. 5', 'Music', 'Graha Adi Poday, Kab. Sumenep', '2026-08-23 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/L1SKG2E8AY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road To Lepas Penat Vol. 5'
WHERE o.email = 'demo.scrape-68@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road To Lepas Penat Vol. 5' AND ev.venue = 'Graha Adi Poday, Kab. Sumenep');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 134
FROM events ev WHERE ev.title = 'Road To Lepas Penat Vol. 5' AND ev.venue = 'Graha Adi Poday, Kab. Sumenep'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Getreal
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Getreal', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-114@wavy.seed' AND a.name = 'Getreal');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Getreal', 'Music', '23 Jamal, Kab. Sleman', '2026-08-23 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/ZZMGHFNJSW.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Getreal'
WHERE o.email = 'demo.scrape-114@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Getreal' AND ev.venue = '23 Jamal, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 23000, 500, 122
FROM events ev WHERE ev.title = 'Getreal' AND ev.venue = '23 Jamal, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- A Garden Session with The Adams & Fanny Soegi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'A Garden Session with The Adams & Fanny Soegi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-320@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-320@wavy.seed' AND a.name = 'A Garden Session with The Adams & Fanny Soegi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'A Garden Session with The Adams & Fanny Soegi', 'Music', 'The Apic Solo, Kab. Karanganyar', '2026-08-24 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/35ERI354GY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'A Garden Session with The Adams & Fanny Soegi'
WHERE o.email = 'demo.scrape-320@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'A Garden Session with The Adams & Fanny Soegi' AND ev.venue = 'The Apic Solo, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 280
FROM events ev WHERE ev.title = 'A Garden Session with The Adams & Fanny Soegi' AND ev.venue = 'The Apic Solo, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The Horas Nite
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The Horas Nite', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-321@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-321@wavy.seed' AND a.name = 'The Horas Nite');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The Horas Nite', 'Music', 'Bart Kuningan, Kota Adm. Jakarta Selatan', '2026-08-28 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IS3TPVRQ13.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The Horas Nite'
WHERE o.email = 'demo.scrape-321@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The Horas Nite' AND ev.venue = 'Bart Kuningan, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 13
FROM events ev WHERE ev.title = 'The Horas Nite' AND ev.venue = 'Bart Kuningan, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL KENDAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL KENDAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'TVONE BESTIEVAL KENDAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL KENDAL', 'Music', 'Hal Stadion Kebondalem, Kendal, Kab. Kendal', '2026-08-29 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GFX5FV83W2.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL KENDAL'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL KENDAL' AND ev.venue = 'Hal Stadion Kebondalem, Kendal, Kab. Kendal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 113
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL KENDAL' AND ev.venue = 'Hal Stadion Kebondalem, Kendal, Kab. Kendal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JOSJIS FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JOSJIS FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-322@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-322@wavy.seed' AND a.name = 'JOSJIS FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JOSJIS FEST', 'Music', 'Stadion Batoro Katong Ponorogo, Kab. Ponorogo', '2026-08-30 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LF7UPMDKE9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JOSJIS FEST'
WHERE o.email = 'demo.scrape-322@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JOSJIS FEST' AND ev.venue = 'Stadion Batoro Katong Ponorogo, Kab. Ponorogo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 144000, 500, 286
FROM events ev WHERE ev.title = 'JOSJIS FEST' AND ev.venue = 'Stadion Batoro Katong Ponorogo, Kab. Ponorogo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Batam Unity Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Batam Unity Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-323@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-323@wavy.seed' AND a.name = 'Batam Unity Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Batam Unity Fest', 'Music', 'Cincai Cafe, Kota Batam', '2026-08-30 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CJZY85ZNVO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Batam Unity Fest'
WHERE o.email = 'demo.scrape-323@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Batam Unity Fest' AND ev.venue = 'Cincai Cafe, Kota Batam');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 209
FROM events ev WHERE ev.title = 'Batam Unity Fest' AND ev.venue = 'Cincai Cafe, Kota Batam'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TURNROOM RITUS V - BASAJAN a journey of Bewara Tour
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-324@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-324@wavy.seed' AND a.name = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour', 'Music', 'Lo.co Bandung, Kota Bandung', '2026-09-04 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/HHOFM3OR70.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour'
WHERE o.email = 'demo.scrape-324@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour' AND ev.venue = 'Lo.co Bandung, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 272
FROM events ev WHERE ev.title = 'TURNROOM RITUS V - BASAJAN a journey of Bewara Tour' AND ev.venue = 'Lo.co Bandung, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- FEEL YOUR PAPUA - SORONG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'FEEL YOUR PAPUA - SORONG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-325@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-325@wavy.seed' AND a.name = 'FEEL YOUR PAPUA - SORONG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'FEEL YOUR PAPUA - SORONG', 'Music', 'Lapangan Korem, Kota Sorong', '2026-09-04 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/38IO5H69JV.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'FEEL YOUR PAPUA - SORONG'
WHERE o.email = 'demo.scrape-325@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'FEEL YOUR PAPUA - SORONG' AND ev.venue = 'Lapangan Korem, Kota Sorong');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 55
FROM events ev WHERE ev.title = 'FEEL YOUR PAPUA - SORONG' AND ev.venue = 'Lapangan Korem, Kota Sorong'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Purwokerto
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Purwokerto', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Purwokerto');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Purwokerto', 'Music', 'Hal. Gor Satria Purwokerto, Kab. Banyumas', '2026-09-05 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AGB5JIFLCS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Purwokerto'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Purwokerto' AND ev.venue = 'Hal. Gor Satria Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Purwokerto' AND ev.venue = 'Hal. Gor Satria Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bring Back The Noise #5
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bring Back The Noise #5', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-327@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-327@wavy.seed' AND a.name = 'Bring Back The Noise #5');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bring Back The Noise #5', 'Music', 'Gor Samapta, Kota Magelang', '2026-09-05 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IID8OK0T4J.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bring Back The Noise #5'
WHERE o.email = 'demo.scrape-327@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bring Back The Noise #5' AND ev.venue = 'Gor Samapta, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 101
FROM events ev WHERE ev.title = 'Bring Back The Noise #5' AND ev.venue = 'Gor Samapta, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RUANG RIANG x PEKAN CERIA Jilid4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RUANG RIANG x PEKAN CERIA Jilid4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-328@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-328@wavy.seed' AND a.name = 'RUANG RIANG x PEKAN CERIA Jilid4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RUANG RIANG x PEKAN CERIA Jilid4', 'Music', 'Gedung Adipura Wonosobo, Kab. Wonosobo', '2026-09-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/O3BYG8HTGK.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RUANG RIANG x PEKAN CERIA Jilid4'
WHERE o.email = 'demo.scrape-328@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RUANG RIANG x PEKAN CERIA Jilid4' AND ev.venue = 'Gedung Adipura Wonosobo, Kab. Wonosobo');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 28000, 500, 74
FROM events ev WHERE ev.title = 'RUANG RIANG x PEKAN CERIA Jilid4' AND ev.venue = 'Gedung Adipura Wonosobo, Kab. Wonosobo'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MEET AND GREET TOBA HERITAGE  2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MEET AND GREET TOBA HERITAGE  2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-329@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-329@wavy.seed' AND a.name = 'MEET AND GREET TOBA HERITAGE  2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MEET AND GREET TOBA HERITAGE  2026', 'Music', 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi', '2026-09-05 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/81EF8JNE50.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MEET AND GREET TOBA HERITAGE  2026'
WHERE o.email = 'demo.scrape-329@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MEET AND GREET TOBA HERITAGE  2026' AND ev.venue = 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 117
FROM events ev WHERE ev.title = 'MEET AND GREET TOBA HERITAGE  2026' AND ev.venue = 'Pantai Gajah Tidur Paropo Silalahi, Kab. Dairi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Salatiga
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Salatiga', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Salatiga');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Salatiga', 'Music', 'Salatiga, Kota Salatiga', '2026-09-06 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ZD01A636B3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Salatiga'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Salatiga' AND ev.venue = 'Salatiga, Kota Salatiga');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Salatiga' AND ev.venue = 'Salatiga, Kota Salatiga'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIO SHOW REBORN TV ONE PURWOKERTO
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIO SHOW REBORN TV ONE PURWOKERTO', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIO SHOW REBORN TV ONE PURWOKERTO');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIO SHOW REBORN TV ONE PURWOKERTO', 'Music', 'Menara Teratai, Purwokerto, Kab. Banyumas', '2026-09-11 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1FUY9VI16A.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIO SHOW REBORN TV ONE PURWOKERTO'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIO SHOW REBORN TV ONE PURWOKERTO' AND ev.venue = 'Menara Teratai, Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 47
FROM events ev WHERE ev.title = 'RADIO SHOW REBORN TV ONE PURWOKERTO' AND ev.venue = 'Menara Teratai, Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PAPUA CULTURE EVENT 3.0
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PAPUA CULTURE EVENT 3.0', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-330@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-330@wavy.seed' AND a.name = 'PAPUA CULTURE EVENT 3.0');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PAPUA CULTURE EVENT 3.0', 'Music', 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman', '2026-09-12 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ASXJTNK2LB.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PAPUA CULTURE EVENT 3.0'
WHERE o.email = 'demo.scrape-330@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PAPUA CULTURE EVENT 3.0' AND ev.venue = 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 130
FROM events ev WHERE ev.title = 'PAPUA CULTURE EVENT 3.0' AND ev.venue = 'PARKIRAN TRANSMART  MAGUWO, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Dream Desire Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Dream Desire Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-331@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-331@wavy.seed' AND a.name = 'Dream Desire Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Dream Desire Fest 2026', 'Music', 'Taman Candra Wilwatikta, Kota Pasuruan', '2026-09-12 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FQG4SJJ8Y9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Dream Desire Fest 2026'
WHERE o.email = 'demo.scrape-331@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Dream Desire Fest 2026' AND ev.venue = 'Taman Candra Wilwatikta, Kota Pasuruan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 56000, 500, 273
FROM events ev WHERE ev.title = 'Dream Desire Fest 2026' AND ev.venue = 'Taman Candra Wilwatikta, Kota Pasuruan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SYNC 2026 'Luminaria'
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SYNC 2026 ''Luminaria''', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-332@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-332@wavy.seed' AND a.name = 'SYNC 2026 ''Luminaria''');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SYNC 2026 ''Luminaria''', 'Music', 'Saint John''s Catholic School BSD, Kota Tangerang Selatan', '2026-09-12 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9A3PVV1899.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SYNC 2026 ''Luminaria'''
WHERE o.email = 'demo.scrape-332@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SYNC 2026 ''Luminaria''' AND ev.venue = 'Saint John''s Catholic School BSD, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 216
FROM events ev WHERE ev.title = 'SYNC 2026 ''Luminaria''' AND ev.venue = 'Saint John''s Catholic School BSD, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HARNESS YOUR HOPES VOL 3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HARNESS YOUR HOPES VOL 3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-26@wavy.seed' AND a.name = 'HARNESS YOUR HOPES VOL 3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HARNESS YOUR HOPES VOL 3', 'Music', 'TPANG SOCIAL FABRIEK, Kota Bandung', '2026-09-12 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RHDS7VXZOH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HARNESS YOUR HOPES VOL 3'
WHERE o.email = 'demo.scrape-26@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HARNESS YOUR HOPES VOL 3' AND ev.venue = 'TPANG SOCIAL FABRIEK, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 158
FROM events ev WHERE ev.title = 'HARNESS YOUR HOPES VOL 3' AND ev.venue = 'TPANG SOCIAL FABRIEK, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Words Written in Stone #2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Words Written in Stone #2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-333@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-333@wavy.seed' AND a.name = 'Words Written in Stone #2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Words Written in Stone #2', 'Music', 'Surabaya, Kota Surabaya', '2026-09-12 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JHJKRSIFPY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Words Written in Stone #2'
WHERE o.email = 'demo.scrape-333@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Words Written in Stone #2' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 9
FROM events ev WHERE ev.title = 'Words Written in Stone #2' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 0911 FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '0911 FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-334@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-334@wavy.seed' AND a.name = '0911 FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '0911 FEST', 'Music', 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung', '2026-09-13 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VHI07YNVAZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '0911 FEST'
WHERE o.email = 'demo.scrape-334@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '0911 FEST' AND ev.venue = 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 242
FROM events ev WHERE ev.title = '0911 FEST' AND ev.venue = 'SILOKA NUSANTARA SARAJIWA BEACHLAND, Kab. Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 21 Century Show TDS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '21 Century Show TDS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-236@wavy.seed' AND a.name = '21 Century Show TDS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '21 Century Show TDS', 'Music', 'Sejiwa Coffee, Kiputih, Kota Bandung', '2026-09-13 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FY2S7ITAMU.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '21 Century Show TDS'
WHERE o.email = 'demo.scrape-236@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '21 Century Show TDS' AND ev.venue = 'Sejiwa Coffee, Kiputih, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 118
FROM events ev WHERE ev.title = '21 Century Show TDS' AND ev.venue = 'Sejiwa Coffee, Kiputih, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BROKEN VERSUS - Sukabumi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BROKEN VERSUS - Sukabumi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-335@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-335@wavy.seed' AND a.name = 'BROKEN VERSUS - Sukabumi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BROKEN VERSUS - Sukabumi', 'Music', 'Sukabumi, Kota Sukabumi', '2026-09-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YYPAINQ6QI.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BROKEN VERSUS - Sukabumi'
WHERE o.email = 'demo.scrape-335@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BROKEN VERSUS - Sukabumi' AND ev.venue = 'Sukabumi, Kota Sukabumi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 81000, 500, 95
FROM events ev WHERE ev.title = 'BROKEN VERSUS - Sukabumi' AND ev.venue = 'Sukabumi, Kota Sukabumi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria Kayu Agung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Kayu Agung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Riang dan Ceria Kayu Agung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Kayu Agung', 'Music', 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir', '2026-09-13 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/HMMROHLQ34.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Kayu Agung'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria Kayu Agung' AND ev.venue = 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 212
FROM events ev WHERE ev.title = 'Riang dan Ceria Kayu Agung' AND ev.venue = 'GOR Perahu Kajang Kayu Agung Kabupaten OKI, Kab. Ogan Komering Ilir'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Baru Aja Gigs Vol.3 X Arkana Mandala
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Baru Aja Gigs Vol.3 X Arkana Mandala', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-268@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-268@wavy.seed' AND a.name = 'Baru Aja Gigs Vol.3 X Arkana Mandala');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Baru Aja Gigs Vol.3 X Arkana Mandala', 'Music', 'To be Announce, Kab. Magelang', '2026-09-17 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/IAPG0RAQX5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Baru Aja Gigs Vol.3 X Arkana Mandala'
WHERE o.email = 'demo.scrape-268@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Baru Aja Gigs Vol.3 X Arkana Mandala' AND ev.venue = 'To be Announce, Kab. Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 52500, 500, 14
FROM events ev WHERE ev.title = 'Baru Aja Gigs Vol.3 X Arkana Mandala' AND ev.venue = 'To be Announce, Kab. Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- B+Phoria
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'B+Phoria', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-336@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-336@wavy.seed' AND a.name = 'B+Phoria');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'B+Phoria', 'Music', 'Stadion Wilis Kota Madiun, Kota Madiun', '2026-09-18 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XFR3OWKYQ2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'B+Phoria'
WHERE o.email = 'demo.scrape-336@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'B+Phoria' AND ev.venue = 'Stadion Wilis Kota Madiun, Kota Madiun');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 198
FROM events ev WHERE ev.title = 'B+Phoria' AND ev.venue = 'Stadion Wilis Kota Madiun, Kota Madiun'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Sound Of Artjeh - Otewe Banda
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Sound Of Artjeh - Otewe Banda', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-290@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-290@wavy.seed' AND a.name = 'Sound Of Artjeh - Otewe Banda');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Sound Of Artjeh - Otewe Banda', 'Music', 'Taman Budaya Aceh, Kota Banda Aceh', '2026-09-18 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/UODLFIRQJ1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Sound Of Artjeh - Otewe Banda'
WHERE o.email = 'demo.scrape-290@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Sound Of Artjeh - Otewe Banda' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 150
FROM events ev WHERE ev.title = 'Sound Of Artjeh - Otewe Banda' AND ev.venue = 'Taman Budaya Aceh, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Youth Karta Core #1
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Youth Karta Core #1', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-337@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-337@wavy.seed' AND a.name = 'Youth Karta Core #1');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Youth Karta Core #1', 'Music', 'Yogyakarta, Kota Yogyakarta', '2026-09-18 16:58:01'::timestamptz, 'https://assets.artatix.co.id/event/KE3D8N48SY.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Youth Karta Core #1'
WHERE o.email = 'demo.scrape-337@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Youth Karta Core #1' AND ev.venue = 'Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 61
FROM events ev WHERE ev.title = 'Youth Karta Core #1' AND ev.venue = 'Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Melankolia Sinoptik
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Melankolia Sinoptik', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-291@wavy.seed' AND a.name = 'Melankolia Sinoptik');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Melankolia Sinoptik', 'Music', 'Pekanbaru, Kota Pekanbaru', '2026-09-18 19:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WCGXPZT0YH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Melankolia Sinoptik'
WHERE o.email = 'demo.scrape-291@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Melankolia Sinoptik' AND ev.venue = 'Pekanbaru, Kota Pekanbaru');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 213
FROM events ev WHERE ev.title = 'Melankolia Sinoptik' AND ev.venue = 'Pekanbaru, Kota Pekanbaru'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pementasan Berusaha di Bawah Hujan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pementasan Berusaha di Bawah Hujan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-338@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-338@wavy.seed' AND a.name = 'Pementasan Berusaha di Bawah Hujan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pementasan Berusaha di Bawah Hujan', 'Music', 'Kuningan City Ballroom, Jakarta Selatan', '2026-09-18 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260701140143_6a44bb57d07db.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pementasan Berusaha di Bawah Hujan'
WHERE o.email = 'demo.scrape-338@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pementasan Berusaha di Bawah Hujan' AND ev.venue = 'Kuningan City Ballroom, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 349000, 500, 174
FROM events ev WHERE ev.title = 'Pementasan Berusaha di Bawah Hujan' AND ev.venue = 'Kuningan City Ballroom, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Swable Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Swable Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-339@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-339@wavy.seed' AND a.name = 'Swable Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Swable Fest', 'Music', 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat', '2026-09-19 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OWHVW57771.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Swable Fest'
WHERE o.email = 'demo.scrape-339@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Swable Fest' AND ev.venue = 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 247
FROM events ev WHERE ev.title = 'Swable Fest' AND ev.venue = 'SMAN 112 JAKARTA, Kota Adm. Jakarta Barat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Diphoria Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Diphoria Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-340@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-340@wavy.seed' AND a.name = 'Diphoria Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Diphoria Fest', 'Music', 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat', '2026-09-19 11:35:01'::timestamptz, 'https://assets.artatix.co.id/event/HIA4ZBQQRE.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Diphoria Fest'
WHERE o.email = 'demo.scrape-340@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Diphoria Fest' AND ev.venue = 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 160
FROM events ev WHERE ev.title = 'Diphoria Fest' AND ev.venue = 'Jakarta Concert Hall, Kota Adm. Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Semarang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Semarang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Semarang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Semarang', 'Music', 'Sam Poo Kong, Semarang, Kota Semarang', '2026-09-19 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CELS4YNF0L.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Semarang'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Semarang' AND ev.venue = 'Sam Poo Kong, Semarang, Kota Semarang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Semarang' AND ev.venue = 'Sam Poo Kong, Semarang, Kota Semarang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Moonverse Festival Vol  7
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonverse Festival Vol  7', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-127@wavy.seed' AND a.name = 'Moonverse Festival Vol  7');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonverse Festival Vol  7', 'Music', 'Jakarta, Kota Adm. Jakarta Selatan', '2026-09-19 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WGV8RKPTCC.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Moonverse Festival Vol  7'
WHERE o.email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Moonverse Festival Vol  7' AND ev.venue = 'Jakarta, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 110000, 500, 1
FROM events ev WHERE ev.title = 'Moonverse Festival Vol  7' AND ev.venue = 'Jakarta, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road to Festival 76 Indonesia Adalah Kita 2026 - Solo
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo', 'Music', 'Pura Mangkunegaran, Kota Surakarta', '2026-09-19 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AZ28UV84HU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 228
FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Solo' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festaria Purbalingga
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festaria Purbalingga', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-341@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-341@wavy.seed' AND a.name = 'Festaria Purbalingga');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festaria Purbalingga', 'Music', 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga', '2026-09-19 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q327TOR9VU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festaria Purbalingga'
WHERE o.email = 'demo.scrape-341@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festaria Purbalingga' AND ev.venue = 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 283
FROM events ev WHERE ev.title = 'Festaria Purbalingga' AND ev.venue = 'Halaman GOR Guntur Darjono Purbalingga, Kab. Purbalingga'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MELANKOLIA DI MEDAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MELANKOLIA DI MEDAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-217@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-217@wavy.seed' AND a.name = 'MELANKOLIA DI MEDAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MELANKOLIA DI MEDAN', 'Music', 'DI MEDAN, Kota Medan', '2026-09-19 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AIGFKOJOO7.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MELANKOLIA DI MEDAN'
WHERE o.email = 'demo.scrape-217@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MELANKOLIA DI MEDAN' AND ev.venue = 'DI MEDAN, Kota Medan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 41
FROM events ev WHERE ev.title = 'MELANKOLIA DI MEDAN' AND ev.venue = 'DI MEDAN, Kota Medan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Magelang
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Magelang', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Magelang');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Magelang', 'Music', 'Hal Parkir AIM,  Magelang, Kota Magelang', '2026-09-20 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/O5SMXF7XFV.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Magelang'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Magelang' AND ev.venue = 'Hal Parkir AIM,  Magelang, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Magelang' AND ev.venue = 'Hal Parkir AIM,  Magelang, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SPIRIT U ALL FOR SPIRITUAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SPIRIT U ALL FOR SPIRITUAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-342@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-342@wavy.seed' AND a.name = 'SPIRIT U ALL FOR SPIRITUAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SPIRIT U ALL FOR SPIRITUAL', 'Music', 'Pantai Sumur Pawon, Kab. Tuban', '2026-09-20 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6E9LRGRRAS.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SPIRIT U ALL FOR SPIRITUAL'
WHERE o.email = 'demo.scrape-342@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SPIRIT U ALL FOR SPIRITUAL' AND ev.venue = 'Pantai Sumur Pawon, Kab. Tuban');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35510, 500, 226
FROM events ev WHERE ev.title = 'SPIRIT U ALL FOR SPIRITUAL' AND ev.venue = 'Pantai Sumur Pawon, Kab. Tuban'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Ayo Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Ayo Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-343@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-343@wavy.seed' AND a.name = 'Ayo Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Ayo Fest 2026', 'Music', 'Stadion Kridasana, Kota Singkawang', '2026-09-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RZACV5HUEL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Ayo Fest 2026'
WHERE o.email = 'demo.scrape-343@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Ayo Fest 2026' AND ev.venue = 'Stadion Kridasana, Kota Singkawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 125000, 500, 119
FROM events ev WHERE ev.title = 'Ayo Fest 2026' AND ev.venue = 'Stadion Kridasana, Kota Singkawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In Inertia Showcase Bandung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In Inertia Showcase Bandung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-344@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-344@wavy.seed' AND a.name = 'In Inertia Showcase Bandung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase Bandung', 'Music', 'Gedung Amphiteater UPI, Kota Bandung', '2026-09-20 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/U8ZBYV3UR7.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase Bandung'
WHERE o.email = 'demo.scrape-344@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase Bandung' AND ev.venue = 'Gedung Amphiteater UPI, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 82
FROM events ev WHERE ev.title = 'In Inertia Showcase Bandung' AND ev.venue = 'Gedung Amphiteater UPI, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bolak Balik Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bolak Balik Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-345@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-345@wavy.seed' AND a.name = 'Bolak Balik Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bolak Balik Festival', 'Music', 'Majalengka, Kab. Majalengka', '2026-09-25 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/7ZU3WMQYCJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bolak Balik Festival'
WHERE o.email = 'demo.scrape-345@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bolak Balik Festival' AND ev.venue = 'Majalengka, Kab. Majalengka');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 175
FROM events ev WHERE ev.title = 'Bolak Balik Festival' AND ev.venue = 'Majalengka, Kab. Majalengka'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Muda Mudi Feelling Empty
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Muda Mudi Feelling Empty', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-346@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-346@wavy.seed' AND a.name = 'Muda Mudi Feelling Empty');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Muda Mudi Feelling Empty', 'Music', 'PARDES CAFE & PLAYSTATION, Kab. Tangerang', '2026-09-25 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FS7S3GRX35.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Muda Mudi Feelling Empty'
WHERE o.email = 'demo.scrape-346@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Muda Mudi Feelling Empty' AND ev.venue = 'PARDES CAFE & PLAYSTATION, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 268
FROM events ev WHERE ev.title = 'Muda Mudi Feelling Empty' AND ev.venue = 'PARDES CAFE & PLAYSTATION, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BOOMFEST SERANG 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BOOMFEST SERANG 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-347@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-347@wavy.seed' AND a.name = 'BOOMFEST SERANG 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BOOMFEST SERANG 2026', 'Music', 'Stadion Maulana Yusuf, Kota Serang', '2026-09-26 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6SNHOZ0YEW.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BOOMFEST SERANG 2026'
WHERE o.email = 'demo.scrape-347@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BOOMFEST SERANG 2026' AND ev.venue = 'Stadion Maulana Yusuf, Kota Serang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 51
FROM events ev WHERE ev.title = 'BOOMFEST SERANG 2026' AND ev.venue = 'Stadion Maulana Yusuf, Kota Serang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto', 'Music', 'GOR Satria Kota Purwokerto, Kab. Banyumas', '2026-09-26 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LEW9GXTJUN.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto' AND ev.venue = 'GOR Satria Kota Purwokerto, Kab. Banyumas');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 45000, 500, 228
FROM events ev WHERE ev.title = 'Road to Festival 76 Indonesia Adalah Kita 2026 - Purwokerto' AND ev.venue = 'GOR Satria Kota Purwokerto, Kab. Banyumas'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL BLORA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL BLORA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'TVONE BESTIEVAL BLORA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL BLORA', 'Music', 'Lapangan Kridosono, Blora, Kab. Blora', '2026-09-26 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6Q57JVU0WS.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL BLORA'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL BLORA' AND ev.venue = 'Lapangan Kridosono, Blora, Kab. Blora');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 113
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL BLORA' AND ev.venue = 'Lapangan Kridosono, Blora, Kab. Blora'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- THE RAWSTAGE one fight one stage
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'THE RAWSTAGE one fight one stage', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-348@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-348@wavy.seed' AND a.name = 'THE RAWSTAGE one fight one stage');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'THE RAWSTAGE one fight one stage', 'Music', 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara', '2026-09-27 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1IX1SHBW7H.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'THE RAWSTAGE one fight one stage'
WHERE o.email = 'demo.scrape-348@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'THE RAWSTAGE one fight one stage' AND ev.venue = 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 84
FROM events ev WHERE ev.title = 'THE RAWSTAGE one fight one stage' AND ev.venue = 'Youth Craft Market Arena Pasar Kerajinan Jepara, Kab. Jepara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Riang dan Ceria Jambi
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Riang dan Ceria Jambi', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-264@wavy.seed' AND a.name = 'Riang dan Ceria Jambi');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Riang dan Ceria Jambi', 'Music', 'Jambi, Kota Jambi', '2026-09-27 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4TAMLUHQGO.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Riang dan Ceria Jambi'
WHERE o.email = 'demo.scrape-264@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Riang dan Ceria Jambi' AND ev.venue = 'Jambi, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 105000, 500, 262
FROM events ev WHERE ev.title = 'Riang dan Ceria Jambi' AND ev.venue = 'Jambi, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TYFOFEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TYFOFEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-349@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-349@wavy.seed' AND a.name = 'TYFOFEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TYFOFEST', 'Music', 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur', '2026-09-27 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/YEU9Z8V59R.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TYFOFEST'
WHERE o.email = 'demo.scrape-349@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TYFOFEST' AND ev.venue = 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 217
FROM events ev WHERE ev.title = 'TYFOFEST' AND ev.venue = 'Lapangan SMAN 44 Jakarta, Kota Adm. Jakarta Timur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Tegal
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Tegal', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Tegal');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Tegal', 'Music', 'Tegal, Kota Tegal', '2026-10-03 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/KWYA385D19.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Tegal'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Tegal' AND ev.venue = 'Tegal, Kota Tegal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Tegal' AND ev.venue = 'Tegal, Kota Tegal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SEMESTAMBYAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SEMESTAMBYAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-350@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-350@wavy.seed' AND a.name = 'SEMESTAMBYAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SEMESTAMBYAR', 'Music', 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto', '2026-10-03 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/X8MEND59Z1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SEMESTAMBYAR'
WHERE o.email = 'demo.scrape-350@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SEMESTAMBYAR' AND ev.venue = 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 160
FROM events ev WHERE ev.title = 'SEMESTAMBYAR' AND ev.venue = 'PASAR SEMERU KOTA MOJOKERTO, Kota Mojokerto'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Pead Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Pead Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-351@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-351@wavy.seed' AND a.name = 'Pead Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Pead Fest', 'Music', 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan', '2026-10-03 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AJ2QW4Y8LL.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Pead Fest'
WHERE o.email = 'demo.scrape-351@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Pead Fest' AND ev.venue = 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 193
FROM events ev WHERE ev.title = 'Pead Fest' AND ev.venue = 'Parkiran Fakultas Ekonomi dan Bisnis Universitas Pancasila, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Colors of D'Angelic #4  Echoes of A Journey
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Colors of D''Angelic #4  Echoes of A Journey', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-352@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-352@wavy.seed' AND a.name = 'Colors of D''Angelic #4  Echoes of A Journey');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Colors of D''Angelic #4  Echoes of A Journey', 'Music', 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan', '2026-10-03 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OBR9DGUW9U.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Colors of D''Angelic #4  Echoes of A Journey'
WHERE o.email = 'demo.scrape-352@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Colors of D''Angelic #4  Echoes of A Journey' AND ev.venue = 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 6
FROM events ev WHERE ev.title = 'Colors of D''Angelic #4  Echoes of A Journey' AND ev.venue = 'USMAR ISMAIL HALL, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kepri Island Run 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kepri Island Run 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-128@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-128@wavy.seed' AND a.name = 'Kepri Island Run 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kepri Island Run 2026', 'Music', 'Taman Pacific Palace Hotel, Batam, Kota Batam', '2026-10-04 06:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NWMDPQ0GOE.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kepri Island Run 2026'
WHERE o.email = 'demo.scrape-128@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kepri Island Run 2026' AND ev.venue = 'Taman Pacific Palace Hotel, Batam, Kota Batam');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 185000, 500, 194
FROM events ev WHERE ev.title = 'Kepri Island Run 2026' AND ev.venue = 'Taman Pacific Palace Hotel, Batam, Kota Batam'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Jepara
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Jepara', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Jepara');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Jepara', 'Music', 'Jepara, Kab. Jepara', '2026-10-04 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VXE240PKED.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Jepara'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Jepara' AND ev.venue = 'Jepara, Kab. Jepara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Jepara' AND ev.venue = 'Jepara, Kab. Jepara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CROWDED FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CROWDED FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-353@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-353@wavy.seed' AND a.name = 'CROWDED FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CROWDED FEST', 'Music', 'Sukabumi, Kota Sukabumi', '2026-10-04 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FYL8U7C0FJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CROWDED FEST'
WHERE o.email = 'demo.scrape-353@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CROWDED FEST' AND ev.venue = 'Sukabumi, Kota Sukabumi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 69
FROM events ev WHERE ev.title = 'CROWDED FEST' AND ev.venue = 'Sukabumi, Kota Sukabumi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Tabuan Show ( intimate concert )
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Tabuan Show ( intimate concert )', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-243@wavy.seed' AND a.name = 'Tabuan Show ( intimate concert )');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Tabuan Show ( intimate concert )', 'Music', 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon', '2026-10-04 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VYJ3QWSWB1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Tabuan Show ( intimate concert )'
WHERE o.email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Tabuan Show ( intimate concert )' AND ev.venue = 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 209
FROM events ev WHERE ev.title = 'Tabuan Show ( intimate concert )' AND ev.venue = 'Elpizo Space, Ciledug, Kabupaten Cirebon, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GEMA Music Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GEMA Music Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-354@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-354@wavy.seed' AND a.name = 'GEMA Music Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GEMA Music Fest', 'Music', 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang', '2026-10-09 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/XMPPF83CDN.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GEMA Music Fest'
WHERE o.email = 'demo.scrape-354@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GEMA Music Fest' AND ev.venue = 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 89999, 500, 61
FROM events ev WHERE ev.title = 'GEMA Music Fest' AND ev.venue = 'Parkir Utara Mall Ciputra Tangerang, Kab. Tangerang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- LOLLIPOP FEST VOL. 02
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'LOLLIPOP FEST VOL. 02', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-153@wavy.seed' AND a.name = 'LOLLIPOP FEST VOL. 02');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'LOLLIPOP FEST VOL. 02', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-10-09 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9IPETULINA.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'LOLLIPOP FEST VOL. 02'
WHERE o.email = 'demo.scrape-153@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 02' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 89500, 500, 139
FROM events ev WHERE ev.title = 'LOLLIPOP FEST VOL. 02' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Malang Bay Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Malang Bay Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-355@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-355@wavy.seed' AND a.name = 'Malang Bay Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Malang Bay Fest 2026', 'Music', 'Pantai Selatan Malang, Kab. Malang', '2026-10-10 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/EPWM4715O1.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Malang Bay Fest 2026'
WHERE o.email = 'demo.scrape-355@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Malang Bay Fest 2026' AND ev.venue = 'Pantai Selatan Malang, Kab. Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 215
FROM events ev WHERE ev.title = 'Malang Bay Fest 2026' AND ev.venue = 'Pantai Selatan Malang, Kab. Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GLORIFEST "FESTARIA 2026"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GLORIFEST "FESTARIA 2026"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-356@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-356@wavy.seed' AND a.name = 'GLORIFEST "FESTARIA 2026"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GLORIFEST "FESTARIA 2026"', 'Music', 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor', '2026-10-10 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/31JTQ75YX5.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GLORIFEST "FESTARIA 2026"'
WHERE o.email = 'demo.scrape-356@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GLORIFEST "FESTARIA 2026"' AND ev.venue = 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 130000, 500, 68
FROM events ev WHERE ev.title = 'GLORIFEST "FESTARIA 2026"' AND ev.venue = 'SMA GLOBAL MANDIRI CIBUBUR, Kota Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SUMPAH PEMUDA FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SUMPAH PEMUDA FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-357@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-357@wavy.seed' AND a.name = 'SUMPAH PEMUDA FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SUMPAH PEMUDA FEST 2026', 'Music', 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal', '2026-10-10 18:30:01'::timestamptz, 'https://assets.artatix.co.id/event/VXEZHF6KTH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SUMPAH PEMUDA FEST 2026'
WHERE o.email = 'demo.scrape-357@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SUMPAH PEMUDA FEST 2026' AND ev.venue = 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 59000, 500, 131
FROM events ev WHERE ev.title = 'SUMPAH PEMUDA FEST 2026' AND ev.venue = 'Lapangan Asrama Polisi Kalibliruk, Kab. Tegal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-358@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-358@wavy.seed' AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4', 'Music', 'Laswi Heritage, Bandung', '2026-10-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260824143453_6a8bf41dee62f.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4'
WHERE o.email = 'demo.scrape-358@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 25000, 500, 74
FROM events ev WHERE ev.title = 'GOOD DAY SCHOOLICIOUS - HARMONY IN COLLABORATION Vol. 4' AND ev.venue = 'Laswi Heritage, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BADONCI FESTIVAL DISK.2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BADONCI FESTIVAL DISK.2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-359@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-359@wavy.seed' AND a.name = 'BADONCI FESTIVAL DISK.2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BADONCI FESTIVAL DISK.2', 'Music', 'Pohon Kasih Megamas, Kota Manado', '2026-10-15 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821133006_6a87f06e50af1.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BADONCI FESTIVAL DISK.2'
WHERE o.email = 'demo.scrape-359@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 880000, 500, 167
FROM events ev WHERE ev.title = 'BADONCI FESTIVAL DISK.2' AND ev.venue = 'Pohon Kasih Megamas, Kota Manado'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RADIOSHOW TV ONE REBORN - BANJAR PATROMAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-229@wavy.seed' AND a.name = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN', 'Music', 'Gelora Banjar Patroman, Kota Banjar', '2026-10-16 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/JHRDAQBO0B.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN'
WHERE o.email = 'demo.scrape-229@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN' AND ev.venue = 'Gelora Banjar Patroman, Kota Banjar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 37
FROM events ev WHERE ev.title = 'RADIOSHOW TV ONE REBORN - BANJAR PATROMAN' AND ev.venue = 'Gelora Banjar Patroman, Kota Banjar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-360@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-360@wavy.seed' AND a.name = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR', 'Music', 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta', '2026-10-17 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/LVUXX93YQ4.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR'
WHERE o.email = 'demo.scrape-360@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR' AND ev.venue = 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 240
FROM events ev WHERE ev.title = 'BUZZ BATTLE BAND HIGHSCHOLL FEST x FESTIVAL JAJANAN PASAR' AND ev.venue = 'TAMAN BALEKAMBANG SURAKARTA, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Yogyakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Yogyakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Yogyakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Yogyakarta', 'Music', 'Yogyakarta, Kota Yogyakarta', '2026-10-17 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WORTJCUZ8I.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Yogyakarta'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Yogyakarta' AND ev.venue = 'Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Yogyakarta' AND ev.venue = 'Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BROKEN VERSUS - Pontianak
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BROKEN VERSUS - Pontianak', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-335@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-335@wavy.seed' AND a.name = 'BROKEN VERSUS - Pontianak');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BROKEN VERSUS - Pontianak', 'Music', 'Stadion Sultan Syarif Abdurrahman, Pontianak, Kota Pontianak', '2026-10-17 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TQC97A1IHF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BROKEN VERSUS - Pontianak'
WHERE o.email = 'demo.scrape-335@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BROKEN VERSUS - Pontianak' AND ev.venue = 'Stadion Sultan Syarif Abdurrahman, Pontianak, Kota Pontianak');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 81000, 500, 95
FROM events ev WHERE ev.title = 'BROKEN VERSUS - Pontianak' AND ev.venue = 'Stadion Sultan Syarif Abdurrahman, Pontianak, Kota Pontianak'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- AREA FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'AREA FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-361@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-361@wavy.seed' AND a.name = 'AREA FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'AREA FEST 2026', 'Music', 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh', '2026-10-17 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2LIKGSWOOQ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'AREA FEST 2026'
WHERE o.email = 'demo.scrape-361@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'AREA FEST 2026' AND ev.venue = 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 235000, 500, 153
FROM events ev WHERE ev.title = 'AREA FEST 2026' AND ev.venue = 'TAMAN BUDAYA  BANDA ACEH, Kota Banda Aceh'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- MAGNUMOTION DOOMSDAY OPEN AIR 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'MAGNUMOTION DOOMSDAY OPEN AIR 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-4@wavy.seed' AND a.name = 'MAGNUMOTION DOOMSDAY OPEN AIR 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'MAGNUMOTION DOOMSDAY OPEN AIR 2026', 'Music', 'To be update, Kota Bandung', '2026-10-18 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/3EWLW5CJ2S.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'MAGNUMOTION DOOMSDAY OPEN AIR 2026'
WHERE o.email = 'demo.scrape-4@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'MAGNUMOTION DOOMSDAY OPEN AIR 2026' AND ev.venue = 'To be update, Kota Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 2
FROM events ev WHERE ev.title = 'MAGNUMOTION DOOMSDAY OPEN AIR 2026' AND ev.venue = 'To be update, Kota Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Rockin Noizee 2026 - Pekalongan
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Rockin Noizee 2026 - Pekalongan', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-326@wavy.seed' AND a.name = 'Rockin Noizee 2026 - Pekalongan');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Rockin Noizee 2026 - Pekalongan', 'Music', 'Pekalongan, Kota Pekalongan', '2026-10-18 12:00:01'::timestamptz, 'https://assets.artatix.co.id/event/NVIHUKIH5E.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Rockin Noizee 2026 - Pekalongan'
WHERE o.email = 'demo.scrape-326@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Pekalongan' AND ev.venue = 'Pekalongan, Kota Pekalongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 20000, 500, 168
FROM events ev WHERE ev.title = 'Rockin Noizee 2026 - Pekalongan' AND ev.venue = 'Pekalongan, Kota Pekalongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- BANGKO FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'BANGKO FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-362@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-362@wavy.seed' AND a.name = 'BANGKO FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'BANGKO FEST', 'Music', 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi', '2026-10-20 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/J0IDX0FF4I.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'BANGKO FEST'
WHERE o.email = 'demo.scrape-362@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'BANGKO FEST' AND ev.venue = 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 246
FROM events ev WHERE ev.title = 'BANGKO FEST' AND ev.venue = 'SIRKUIT ARBORETUM RIO ALIF BANGKO MERANGIN, Kota Jambi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ROSETOPIA ASIA TOUR 2026 IN JAKARTA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-363@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-363@wavy.seed' AND a.name = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA', 'Music', 'The Kasablanka, Jakarta Selatan', '2026-10-23 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260713100423_6a5455b7de053.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA'
WHERE o.email = 'demo.scrape-363@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'The Kasablanka, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 1450000, 500, 79
FROM events ev WHERE ev.title = 'ROSETOPIA ASIA TOUR 2026 IN JAKARTA' AND ev.venue = 'The Kasablanka, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 'Terror Machine'  25th North Ndapur Celebration
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '''Terror Machine''  25th North Ndapur Celebration', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-364@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-364@wavy.seed' AND a.name = '''Terror Machine''  25th North Ndapur Celebration');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '''Terror Machine''  25th North Ndapur Celebration', 'Music', 'Sport Center Lamongan, Kab. Lamongan', '2026-10-24 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/YJSVK0EEM9.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '''Terror Machine''  25th North Ndapur Celebration'
WHERE o.email = 'demo.scrape-364@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '''Terror Machine''  25th North Ndapur Celebration' AND ev.venue = 'Sport Center Lamongan, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 272
FROM events ev WHERE ev.title = '''Terror Machine''  25th North Ndapur Celebration' AND ev.venue = 'Sport Center Lamongan, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nyanyian Fest Subang 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nyanyian Fest Subang 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-243@wavy.seed' AND a.name = 'Nyanyian Fest Subang 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nyanyian Fest Subang 2026', 'Music', 'Subang, Kab. Subang', '2026-10-24 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/V5JL9065A4.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nyanyian Fest Subang 2026'
WHERE o.email = 'demo.scrape-243@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nyanyian Fest Subang 2026' AND ev.venue = 'Subang, Kab. Subang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 209
FROM events ev WHERE ev.title = 'Nyanyian Fest Subang 2026' AND ev.venue = 'Subang, Kab. Subang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Spectaphoria Vol. 3  "Synchronicity"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Spectaphoria Vol. 3  "Synchronicity"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-200@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-200@wavy.seed' AND a.name = 'Spectaphoria Vol. 3  "Synchronicity"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Spectaphoria Vol. 3  "Synchronicity"', 'Music', 'Pantai Tanjungpendam, Kab. Belitung', '2026-10-24 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/AHJEQ9BT0N.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Spectaphoria Vol. 3  "Synchronicity"'
WHERE o.email = 'demo.scrape-200@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Spectaphoria Vol. 3  "Synchronicity"' AND ev.venue = 'Pantai Tanjungpendam, Kab. Belitung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 30
FROM events ev WHERE ev.title = 'Spectaphoria Vol. 3  "Synchronicity"' AND ev.venue = 'Pantai Tanjungpendam, Kab. Belitung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- In Inertia Showcase - Unfamiliar Weather
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-365@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-365@wavy.seed' AND a.name = 'In Inertia Showcase - Unfamiliar Weather');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'In Inertia Showcase - Unfamiliar Weather', 'Music', 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260731175446_6a6c7ef65fe70.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'In Inertia Showcase - Unfamiliar Weather'
WHERE o.email = 'demo.scrape-365@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 5
FROM events ev WHERE ev.title = 'In Inertia Showcase - Unfamiliar Weather' AND ev.venue = 'Aula Gudskul, Gudskul Ekosistem, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Kumpulan Dikir No Good Live Di Odeon KL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Kumpulan Dikir No Good Live Di Odeon KL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-366@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-366@wavy.seed' AND a.name = 'Kumpulan Dikir No Good Live Di Odeon KL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Kumpulan Dikir No Good Live Di Odeon KL', 'Music', 'Odeon KL, Kuala Lumpur', '2026-10-24 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260804144553_6a7198b17f1bb.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Kumpulan Dikir No Good Live Di Odeon KL'
WHERE o.email = 'demo.scrape-366@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Kumpulan Dikir No Good Live Di Odeon KL' AND ev.venue = 'Odeon KL, Kuala Lumpur');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 172, 500, 0
FROM events ev WHERE ev.title = 'Kumpulan Dikir No Good Live Di Odeon KL' AND ev.venue = 'Odeon KL, Kuala Lumpur'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PSYCHOFEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PSYCHOFEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-367@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-367@wavy.seed' AND a.name = 'PSYCHOFEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PSYCHOFEST 2026', 'Music', 'Kampus III Universitas Sanata Dharma, Kab. Sleman', '2026-10-25 17:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OVXFTI48PN.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PSYCHOFEST 2026'
WHERE o.email = 'demo.scrape-367@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PSYCHOFEST 2026' AND ev.venue = 'Kampus III Universitas Sanata Dharma, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 31
FROM events ev WHERE ev.title = 'PSYCHOFEST 2026' AND ev.venue = 'Kampus III Universitas Sanata Dharma, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Underground Supreme
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Underground Supreme', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-368@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-368@wavy.seed' AND a.name = 'Underground Supreme');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Underground Supreme', 'Music', 'District 163, Kab. Karawang', '2026-10-25 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260713224128_6a550728a5089.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Underground Supreme'
WHERE o.email = 'demo.scrape-368@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 200000, 500, 44
FROM events ev WHERE ev.title = 'Underground Supreme' AND ev.venue = 'District 163, Kab. Karawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PARTIMUR FEST
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PARTIMUR FEST', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-369@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-369@wavy.seed' AND a.name = 'PARTIMUR FEST');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PARTIMUR FEST', 'Music', 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul', '2026-10-29 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/W3FJFSTTRF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PARTIMUR FEST'
WHERE o.email = 'demo.scrape-369@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PARTIMUR FEST' AND ev.venue = 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 267
FROM events ev WHERE ev.title = 'PARTIMUR FEST' AND ev.venue = 'Lapangan Panahan GLADIAN JAYANDARU, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Muara Vibrasi THE PAPS
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Muara Vibrasi THE PAPS', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-252@wavy.seed' AND a.name = 'Muara Vibrasi THE PAPS');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Muara Vibrasi THE PAPS', 'Music', 'Muara Space, Palembang, Kota Palembang', '2026-10-30 16:20:01'::timestamptz, 'https://assets.artatix.co.id/event/F5R7H2EWQZ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Muara Vibrasi THE PAPS'
WHERE o.email = 'demo.scrape-252@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Muara Vibrasi THE PAPS' AND ev.venue = 'Muara Space, Palembang, Kota Palembang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 36
FROM events ev WHERE ev.title = 'Muara Vibrasi THE PAPS' AND ev.venue = 'Muara Space, Palembang, Kota Palembang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL SALATIGA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL SALATIGA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'TVONE BESTIEVAL SALATIGA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL SALATIGA', 'Music', 'Area Parkir Saloka Tuntang, Kota Salatiga', '2026-10-31 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/2L9NQQBF99.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL SALATIGA'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL SALATIGA' AND ev.venue = 'Area Parkir Saloka Tuntang, Kota Salatiga');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 43
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL SALATIGA' AND ev.venue = 'Area Parkir Saloka Tuntang, Kota Salatiga'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- TVONE BESTIEVAL TEGAL
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'TVONE BESTIEVAL TEGAL', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-51@wavy.seed' AND a.name = 'TVONE BESTIEVAL TEGAL');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'TVONE BESTIEVAL TEGAL', 'Music', 'Stadion Yos Sudarso, Kota Tegal', '2026-10-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/MOUPEWDY5F.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'TVONE BESTIEVAL TEGAL'
WHERE o.email = 'demo.scrape-51@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'TVONE BESTIEVAL TEGAL' AND ev.venue = 'Stadion Yos Sudarso, Kota Tegal');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 43
FROM events ev WHERE ev.title = 'TVONE BESTIEVAL TEGAL' AND ev.venue = 'Stadion Yos Sudarso, Kota Tegal'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Farmasi Cup 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Farmasi Cup 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-370@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-370@wavy.seed' AND a.name = 'Farmasi Cup 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Farmasi Cup 2026', 'Music', 'Mandala Krida, Kota Yogyakarta', '2026-10-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/OHIBNUQMRG.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Farmasi Cup 2026'
WHERE o.email = 'demo.scrape-370@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Farmasi Cup 2026' AND ev.venue = 'Mandala Krida, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 280
FROM events ev WHERE ev.title = 'Farmasi Cup 2026' AND ev.venue = 'Mandala Krida, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Senada Senja Festival 4.0
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Senada Senja Festival 4.0', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-371@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-371@wavy.seed' AND a.name = 'Senada Senja Festival 4.0');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Senada Senja Festival 4.0', 'Music', 'Malang, Kota Malang', '2026-10-31 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/WZANPZO9MW.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Senada Senja Festival 4.0'
WHERE o.email = 'demo.scrape-371@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Senada Senja Festival 4.0' AND ev.venue = 'Malang, Kota Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 163
FROM events ev WHERE ev.title = 'Senada Senja Festival 4.0' AND ev.venue = 'Malang, Kota Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Carnaval of Scream 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Carnaval of Scream 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-5@wavy.seed' AND a.name = 'Carnaval of Scream 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Carnaval of Scream 2026', 'Music', 'Tip Tap Toe, Kab. Sleman', '2026-10-31 20:00:01'::timestamptz, 'https://assets.artatix.co.id/event/RZZZZY5UMU.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Carnaval of Scream 2026'
WHERE o.email = 'demo.scrape-5@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Carnaval of Scream 2026' AND ev.venue = 'Tip Tap Toe, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 245
FROM events ev WHERE ev.title = 'Carnaval of Scream 2026' AND ev.venue = 'Tip Tap Toe, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Titik Sadrah for Revenge
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Titik Sadrah for Revenge', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-372@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-372@wavy.seed' AND a.name = 'Titik Sadrah for Revenge');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Titik Sadrah for Revenge', 'Music', 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260710180442_6a50d1ca9d9bd.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Titik Sadrah for Revenge'
WHERE o.email = 'demo.scrape-372@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 400000, 500, 286
FROM events ev WHERE ev.title = 'Titik Sadrah for Revenge' AND ev.venue = 'ELDORADO SPORT & CONVENTION HALL, BANDUNG, Bandung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-373@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-373@wavy.seed' AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01', 'Music', 'Balai Sarbini, DKI Jakarta', '2026-10-31 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260721113228_6a5ef65c616bf.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01'
WHERE o.email = 'demo.scrape-373@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 350000, 500, 179
FROM events ev WHERE ev.title = 'Alunan Musik Nostalgia (Memories Of The Soul) Vol. 01' AND ev.venue = 'Balai Sarbini, DKI Jakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GUNUNGRONGGO TRAIL RUN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GUNUNGRONGGO TRAIL RUN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-374@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-374@wavy.seed' AND a.name = 'GUNUNGRONGGO TRAIL RUN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GUNUNGRONGGO TRAIL RUN', 'Music', 'Sumber Jenon, Gunungronggo, Kab. Malang', '2026-11-01 04:30:01'::timestamptz, 'https://assets.artatix.co.id/event/9XMRAARHYM.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GUNUNGRONGGO TRAIL RUN'
WHERE o.email = 'demo.scrape-374@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GUNUNGRONGGO TRAIL RUN' AND ev.venue = 'Sumber Jenon, Gunungronggo, Kab. Malang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 150000, 500, 2
FROM events ev WHERE ev.title = 'GUNUNGRONGGO TRAIL RUN' AND ev.venue = 'Sumber Jenon, Gunungronggo, Kab. Malang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Moonverse Festival Vol  8
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Moonverse Festival Vol  8', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-127@wavy.seed' AND a.name = 'Moonverse Festival Vol  8');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Moonverse Festival Vol  8', 'Music', 'Tangerang, Kota Tangerang Selatan', '2026-11-01 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1FXZB2IZ43.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Moonverse Festival Vol  8'
WHERE o.email = 'demo.scrape-127@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Moonverse Festival Vol  8' AND ev.venue = 'Tangerang, Kota Tangerang Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 151
FROM events ev WHERE ev.title = 'Moonverse Festival Vol  8' AND ev.venue = 'Tangerang, Kota Tangerang Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Remember Fest 2026 X Cube Concert
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Remember Fest 2026 X Cube Concert', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-375@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-375@wavy.seed' AND a.name = 'Remember Fest 2026 X Cube Concert');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Remember Fest 2026 X Cube Concert', 'Music', 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara', '2026-11-07 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/9W4TPWAMQQ.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Remember Fest 2026 X Cube Concert'
WHERE o.email = 'demo.scrape-375@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Remember Fest 2026 X Cube Concert' AND ev.venue = 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 135000, 500, 95
FROM events ev WHERE ev.title = 'Remember Fest 2026 X Cube Concert' AND ev.venue = 'Gambir Expo - Jiexpo Kemayoran, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NEVERLAND CIKARANG
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NEVERLAND CIKARANG', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-213@wavy.seed' AND a.name = 'NEVERLAND CIKARANG');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NEVERLAND CIKARANG', 'Music', 'Cikarang, Kab. Bekasi', '2026-11-07 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/1GFMBLPTNY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NEVERLAND CIKARANG'
WHERE o.email = 'demo.scrape-213@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NEVERLAND CIKARANG' AND ev.venue = 'Cikarang, Kab. Bekasi');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 99000, 500, 269
FROM events ev WHERE ev.title = 'NEVERLAND CIKARANG' AND ev.venue = 'Cikarang, Kab. Bekasi'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- ARTEFAC UNS 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'ARTEFAC UNS 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-49@wavy.seed' AND a.name = 'ARTEFAC UNS 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'ARTEFAC UNS 2026', 'Music', 'De Tjolomadoe, Kab. Karanganyar', '2026-11-07 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/I0ZC2G9D0R.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'ARTEFAC UNS 2026'
WHERE o.email = 'demo.scrape-49@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'ARTEFAC UNS 2026' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 90000, 500, 157
FROM events ev WHERE ev.title = 'ARTEFAC UNS 2026' AND ev.venue = 'De Tjolomadoe, Kab. Karanganyar'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- PGR Vol. 11 @Jakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'PGR Vol. 11 @Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-376@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-376@wavy.seed' AND a.name = 'PGR Vol. 11 @Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'PGR Vol. 11 @Jakarta', 'Music', 'JIExpo Kemayoran, Jakarta Pusat', '2026-11-07 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260525145212_6a13ffac08f80.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'PGR Vol. 11 @Jakarta'
WHERE o.email = 'demo.scrape-376@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 250000, 500, 268
FROM events ev WHERE ev.title = 'PGR Vol. 11 @Jakarta' AND ev.venue = 'JIExpo Kemayoran, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-377@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-377@wavy.seed' AND a.name = 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"', 'Music', 'Halaman Parkir Cafe Tenda di Bawah Bintang, Kandangan Kediri, Kota Kediri', '2026-11-08 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/7IQA2QTKDJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"'
WHERE o.email = 'demo.scrape-377@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"' AND ev.venue = 'Halaman Parkir Cafe Tenda di Bawah Bintang, Kandangan Kediri, Kota Kediri');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 151
FROM events ev WHERE ev.title = 'NGORO BANGKIT 9  "WORLDWIDE METAL INVASION"' AND ev.venue = 'Halaman Parkir Cafe Tenda di Bawah Bintang, Kandangan Kediri, Kota Kediri'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- SMAVO IN ACTION 11.0 - ALOHARA
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'SMAVO IN ACTION 11.0 - ALOHARA', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-378@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-378@wavy.seed' AND a.name = 'SMAVO IN ACTION 11.0 - ALOHARA');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'SMAVO IN ACTION 11.0 - ALOHARA', 'Music', 'SMAN 2 CIBINONG, Kab. Bogor', '2026-11-08 09:00:01'::timestamptz, 'https://assets.artatix.co.id/event/5ED9O5K5UI.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'SMAVO IN ACTION 11.0 - ALOHARA'
WHERE o.email = 'demo.scrape-378@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'SMAVO IN ACTION 11.0 - ALOHARA' AND ev.venue = 'SMAN 2 CIBINONG, Kab. Bogor');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 164
FROM events ev WHERE ev.title = 'SMAVO IN ACTION 11.0 - ALOHARA' AND ev.venue = 'SMAN 2 CIBINONG, Kab. Bogor'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Resonance - A Soundagia Series - Lampung
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Resonance - A Soundagia Series - Lampung', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-379@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-379@wavy.seed' AND a.name = 'Resonance - A Soundagia Series - Lampung');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Resonance - A Soundagia Series - Lampung', 'Music', 'Stadion Tejosari, Kota Metro', '2026-11-08 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/TP29Q47OQ6.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Resonance - A Soundagia Series - Lampung'
WHERE o.email = 'demo.scrape-379@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Resonance - A Soundagia Series - Lampung' AND ev.venue = 'Stadion Tejosari, Kota Metro');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 187
FROM events ev WHERE ev.title = 'Resonance - A Soundagia Series - Lampung' AND ev.venue = 'Stadion Tejosari, Kota Metro'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Simak Siar Vol. 36
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Simak Siar Vol. 36', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-71@wavy.seed' AND a.name = 'Simak Siar Vol. 36');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Simak Siar Vol. 36', 'Music', 'JNM Bloc, Kota Yogyakarta', '2026-11-08 18:00:01'::timestamptz, 'https://assets.artatix.co.id/event/QY2AY1XV27.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Simak Siar Vol. 36'
WHERE o.email = 'demo.scrape-71@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Simak Siar Vol. 36' AND ev.venue = 'JNM Bloc, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 75000, 500, 233
FROM events ev WHERE ev.title = 'Simak Siar Vol. 36' AND ev.venue = 'JNM Bloc, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- The 49th Jazz Goes to Campus
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'The 49th Jazz Goes to Campus', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-380@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-380@wavy.seed' AND a.name = 'The 49th Jazz Goes to Campus');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'The 49th Jazz Goes to Campus', 'Music', 'Fakultas Ekonomi dan Bisnis Universitas Indonesia, Kota Depok', '2026-11-08 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260720094728_6a5d8c4088371.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'The 49th Jazz Goes to Campus'
WHERE o.email = 'demo.scrape-380@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Fakultas Ekonomi dan Bisnis Universitas Indonesia, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 535000, 500, 250
FROM events ev WHERE ev.title = 'The 49th Jazz Goes to Campus' AND ev.venue = 'Fakultas Ekonomi dan Bisnis Universitas Indonesia, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- JONGFEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'JONGFEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-381@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-381@wavy.seed' AND a.name = 'JONGFEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'JONGFEST 2026', 'Music', 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang', '2026-11-10 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260717192631_6a5a1f77042a2.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'JONGFEST 2026'
WHERE o.email = 'demo.scrape-381@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 139000, 500, 113
FROM events ev WHERE ev.title = 'JONGFEST 2026' AND ev.venue = 'Alun-Alun Simpang Pematang Mesuji, Kab. Tulang Bawang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Men I Trust Asia Tour 2026: Live In Jakarta
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-382@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-382@wavy.seed' AND a.name = 'Men I Trust Asia Tour 2026: Live In Jakarta');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Men I Trust Asia Tour 2026: Live In Jakarta', 'Music', 'Tennis Indoor Senayan, Jakarta Pusat', '2026-11-12 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260517111454_6a0940bed96d2.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Men I Trust Asia Tour 2026: Live In Jakarta'
WHERE o.email = 'demo.scrape-382@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Tennis Indoor Senayan, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 618000, 500, 46
FROM events ev WHERE ev.title = 'Men I Trust Asia Tour 2026: Live In Jakarta' AND ev.venue = 'Tennis Indoor Senayan, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Festival Titik Temu 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Festival Titik Temu 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-56@wavy.seed' AND a.name = 'Festival Titik Temu 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Festival Titik Temu 2026', 'Music', 'Gedung Jodjokodi Convention Center, Kota Palu, Sulawesi Tengah, Kota Palu', '2026-11-13 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/34SY526K9Z.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Festival Titik Temu 2026'
WHERE o.email = 'demo.scrape-56@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Festival Titik Temu 2026' AND ev.venue = 'Gedung Jodjokodi Convention Center, Kota Palu, Sulawesi Tengah, Kota Palu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 55000, 500, 48
FROM events ev WHERE ev.title = 'Festival Titik Temu 2026' AND ev.venue = 'Gedung Jodjokodi Convention Center, Kota Palu, Sulawesi Tengah, Kota Palu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Reang Fest Indramayu Vol.3
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Reang Fest Indramayu Vol.3', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-189@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-189@wavy.seed' AND a.name = 'Reang Fest Indramayu Vol.3');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Reang Fest Indramayu Vol.3', 'Music', 'Lapangan 20 Mei Maydas Jatibarang, Kab. Indramayu', '2026-11-14 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/SCEU3XW47M.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Reang Fest Indramayu Vol.3'
WHERE o.email = 'demo.scrape-189@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Reang Fest Indramayu Vol.3' AND ev.venue = 'Lapangan 20 Mei Maydas Jatibarang, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 50000, 500, 257
FROM events ev WHERE ev.title = 'Reang Fest Indramayu Vol.3' AND ev.venue = 'Lapangan 20 Mei Maydas Jatibarang, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Gemolong Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Gemolong Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-383@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-383@wavy.seed' AND a.name = 'Gemolong Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Gemolong Festival', 'Music', 'Lap SBI Gemolong, Kab. Sragen', '2026-11-14 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/69LNBJ4D05.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Gemolong Festival'
WHERE o.email = 'demo.scrape-383@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Gemolong Festival' AND ev.venue = 'Lap SBI Gemolong, Kab. Sragen');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 40000, 500, 29
FROM events ev WHERE ev.title = 'Gemolong Festival' AND ev.venue = 'Lap SBI Gemolong, Kab. Sragen'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Economic Festival (ECOFEST) USD 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Economic Festival (ECOFEST) USD 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-384@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-384@wavy.seed' AND a.name = 'Economic Festival (ECOFEST) USD 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Economic Festival (ECOFEST) USD 2026', 'Music', 'Lapangan Realino Universitas Sanata Dharma, Kab. Sleman', '2026-11-14 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/8XAMCNA5VR.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Economic Festival (ECOFEST) USD 2026'
WHERE o.email = 'demo.scrape-384@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Economic Festival (ECOFEST) USD 2026' AND ev.venue = 'Lapangan Realino Universitas Sanata Dharma, Kab. Sleman');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 32
FROM events ev WHERE ev.title = 'Economic Festival (ECOFEST) USD 2026' AND ev.venue = 'Lapangan Realino Universitas Sanata Dharma, Kab. Sleman'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Bela Negara Festival Vol 8
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Bela Negara Festival Vol 8', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-385@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-385@wavy.seed' AND a.name = 'Bela Negara Festival Vol 8');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Bela Negara Festival Vol 8', 'Music', 'Gor Soemantri Brodjonegoro, Kota Adm. Jakarta Selatan', '2026-11-14 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/ATCACAGMWA.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Bela Negara Festival Vol 8'
WHERE o.email = 'demo.scrape-385@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Bela Negara Festival Vol 8' AND ev.venue = 'Gor Soemantri Brodjonegoro, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 80000, 500, 35
FROM events ev WHERE ev.title = 'Bela Negara Festival Vol 8' AND ev.venue = 'Gor Soemantri Brodjonegoro, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NoiseVentura
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NoiseVentura', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-386@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-386@wavy.seed' AND a.name = 'NoiseVentura');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NoiseVentura', 'Music', 'Jogja Expo Center, Kab. Bantul', '2026-11-14 14:30:01'::timestamptz, 'https://assets.artatix.co.id/event/99DFZ4S5CB.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NoiseVentura'
WHERE o.email = 'demo.scrape-386@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NoiseVentura' AND ev.venue = 'Jogja Expo Center, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 42500, 500, 248
FROM events ev WHERE ev.title = 'NoiseVentura' AND ev.venue = 'Jogja Expo Center, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Jomlo Festival 2026 Chapter Jogja
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Jomlo Festival 2026 Chapter Jogja', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-93@wavy.seed' AND a.name = 'Jomlo Festival 2026 Chapter Jogja');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Jomlo Festival 2026 Chapter Jogja', 'Music', 'Yogyakarta, Kota Yogyakarta', '2026-11-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/GH24PH8GSZ.webp', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Jomlo Festival 2026 Chapter Jogja'
WHERE o.email = 'demo.scrape-93@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Jomlo Festival 2026 Chapter Jogja' AND ev.venue = 'Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 123456, 500, 255
FROM events ev WHERE ev.title = 'Jomlo Festival 2026 Chapter Jogja' AND ev.venue = 'Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Fisip Festival  Blackbox
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Fisip Festival  Blackbox', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-387@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-387@wavy.seed' AND a.name = 'Fisip Festival  Blackbox');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Fisip Festival  Blackbox', 'Music', 'Lapangan UPN Veteran Jakarta, Kota Adm. Jakarta Selatan', '2026-11-14 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/6TVQ1V8FKJ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Fisip Festival  Blackbox'
WHERE o.email = 'demo.scrape-387@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Fisip Festival  Blackbox' AND ev.venue = 'Lapangan UPN Veteran Jakarta, Kota Adm. Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 11
FROM events ev WHERE ev.title = 'Fisip Festival  Blackbox' AND ev.venue = 'Lapangan UPN Veteran Jakarta, Kota Adm. Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-63@wavy.seed' AND a.name = '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI', 'Music', 'Sahid Raya Hotel & Convention Yogyakarta, Kota Yogyakarta', '2026-11-14 20:15:01'::timestamptz, 'https://assets.artatix.co.id/event/LG93OKG553.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI'
WHERE o.email = 'demo.scrape-63@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI' AND ev.venue = 'Sahid Raya Hotel & Convention Yogyakarta, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 280000, 500, 99
FROM events ev WHERE ev.title = '3 Dekade Jikustik Feat Pongki Barata KEMBALI BERPUISI' AND ev.venue = 'Sahid Raya Hotel & Convention Yogyakarta, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Eternal Blast Fest 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Eternal Blast Fest 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-304@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-304@wavy.seed' AND a.name = 'Eternal Blast Fest 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Eternal Blast Fest 2026', 'Music', 'Tebing Mojo Amphithetaer, Kab. Tulungagung', '2026-11-21 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/69OUK5O6IH.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Eternal Blast Fest 2026'
WHERE o.email = 'demo.scrape-304@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Eternal Blast Fest 2026' AND ev.venue = 'Tebing Mojo Amphithetaer, Kab. Tulungagung');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 36666, 500, 18
FROM events ev WHERE ev.title = 'Eternal Blast Fest 2026' AND ev.venue = 'Tebing Mojo Amphithetaer, Kab. Tulungagung'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Songket Sonic 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Songket Sonic 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-388@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-388@wavy.seed' AND a.name = 'Songket Sonic 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Songket Sonic 2026', 'Music', 'Hakafe Coastal Area, Kab. Karimun', '2026-11-21 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/4IHCSEB2PN.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Songket Sonic 2026'
WHERE o.email = 'demo.scrape-388@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Songket Sonic 2026' AND ev.venue = 'Hakafe Coastal Area, Kab. Karimun');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 64
FROM events ev WHERE ev.title = 'Songket Sonic 2026' AND ev.venue = 'Hakafe Coastal Area, Kab. Karimun'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- NOVEMBER SUMMERFEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'NOVEMBER SUMMERFEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-389@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-389@wavy.seed' AND a.name = 'NOVEMBER SUMMERFEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'NOVEMBER SUMMERFEST 2026', 'Music', 'Sport Center Lamongan - GOR, Kab. Lamongan', '2026-11-22 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/FNB7B2CQGH.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'NOVEMBER SUMMERFEST 2026'
WHERE o.email = 'demo.scrape-389@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'NOVEMBER SUMMERFEST 2026' AND ev.venue = 'Sport Center Lamongan - GOR, Kab. Lamongan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 70000, 500, 237
FROM events ev WHERE ev.title = 'NOVEMBER SUMMERFEST 2026' AND ev.venue = 'Sport Center Lamongan - GOR, Kab. Lamongan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- STEREO 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'STEREO 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-74@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-74@wavy.seed' AND a.name = 'STEREO 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'STEREO 2026', 'Music', 'Bale Lantip UTDI, Kab. Bantul', '2026-11-28 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/4F0GZ81JMQ.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'STEREO 2026'
WHERE o.email = 'demo.scrape-74@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'STEREO 2026' AND ev.venue = 'Bale Lantip UTDI, Kab. Bantul');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 2
FROM events ev WHERE ev.title = 'STEREO 2026' AND ev.venue = 'Bale Lantip UTDI, Kab. Bantul'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nadaria Vol 10
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nadaria Vol 10', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-390@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-390@wavy.seed' AND a.name = 'Nadaria Vol 10');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nadaria Vol 10', 'Music', 'Pesona Square Depok, Kota Depok', '2026-11-28 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/CF9QYWYFLW.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nadaria Vol 10'
WHERE o.email = 'demo.scrape-390@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nadaria Vol 10' AND ev.venue = 'Pesona Square Depok, Kota Depok');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 110
FROM events ev WHERE ev.title = 'Nadaria Vol 10' AND ev.venue = 'Pesona Square Depok, Kota Depok'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Fucom Vol.4
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Fucom Vol.4', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-391@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-391@wavy.seed' AND a.name = 'Fucom Vol.4');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Fucom Vol.4', 'Music', 'Bpu Bagas Raya Cirebon, Kota Cirebon', '2026-11-28 15:30:01'::timestamptz, 'https://assets.artatix.co.id/event/V5NZQDQROF.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Fucom Vol.4'
WHERE o.email = 'demo.scrape-391@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Fucom Vol.4' AND ev.venue = 'Bpu Bagas Raya Cirebon, Kota Cirebon');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 65000, 500, 193
FROM events ev WHERE ev.title = 'Fucom Vol.4' AND ev.venue = 'Bpu Bagas Raya Cirebon, Kota Cirebon'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Java Beat Fest
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Java Beat Fest', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-392@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-392@wavy.seed' AND a.name = 'Java Beat Fest');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Java Beat Fest', 'Music', 'Pura Mangkunegaran, Kota Surakarta', '2026-11-28 16:00:01'::timestamptz, 'https://assets.artatix.co.id/event/MCKMUCA9N3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Java Beat Fest'
WHERE o.email = 'demo.scrape-392@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Java Beat Fest' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 79000, 500, 286
FROM events ev WHERE ev.title = 'Java Beat Fest' AND ev.venue = 'Pura Mangkunegaran, Kota Surakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- HIGH SCHOOL FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'HIGH SCHOOL FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-393@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-393@wavy.seed' AND a.name = 'HIGH SCHOOL FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'HIGH SCHOOL FEST 2026', 'Music', 'Stadiun Madya B, GBK, Jakarta Selatan', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260821130357_6a87ea4d14a1a.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'HIGH SCHOOL FEST 2026'
WHERE o.email = 'demo.scrape-393@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 100000, 500, 129
FROM events ev WHERE ev.title = 'HIGH SCHOOL FEST 2026' AND ev.venue = 'Stadiun Madya B, GBK, Jakarta Selatan'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Joyland Sessions 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Joyland Sessions 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-382@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-382@wavy.seed' AND a.name = 'Joyland Sessions 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Joyland Sessions 2026', 'Music', 'GBK, Senayan Jakarta, Jakarta Pusat', '2026-11-28 18:00:00'::timestamptz, 'https://assets.loket.com/neo/production/images/banner/20260624065902_6a3b1dc6b0a9f.jpeg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Joyland Sessions 2026'
WHERE o.email = 'demo.scrape-382@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'GBK, Senayan Jakarta, Jakarta Pusat');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 5740000, 500, 66
FROM events ev WHERE ev.title = 'Joyland Sessions 2026' AND ev.venue = 'GBK, Senayan Jakarta, Jakarta Pusat'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- DINAMIT FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'DINAMIT FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-394@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-394@wavy.seed' AND a.name = 'DINAMIT FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'DINAMIT FEST 2026', 'Music', 'Stadion Kridosono, Kota Yogyakarta', '2026-12-05 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/911POGP29I.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'DINAMIT FEST 2026'
WHERE o.email = 'demo.scrape-394@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'DINAMIT FEST 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 85000, 500, 222
FROM events ev WHERE ev.title = 'DINAMIT FEST 2026' AND ev.venue = 'Stadion Kridosono, Kota Yogyakarta'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- RISE OF SIN COMPANY FEST 2026
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'RISE OF SIN COMPANY FEST 2026', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-395@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-395@wavy.seed' AND a.name = 'RISE OF SIN COMPANY FEST 2026');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'RISE OF SIN COMPANY FEST 2026', 'Music', 'WARKOP LIREN JATIBARANG, Kab. Indramayu', '2026-12-25 13:00:01'::timestamptz, 'https://assets.artatix.co.id/event/R1ZU11K7KA.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'RISE OF SIN COMPANY FEST 2026'
WHERE o.email = 'demo.scrape-395@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'RISE OF SIN COMPANY FEST 2026' AND ev.venue = 'WARKOP LIREN JATIBARANG, Kab. Indramayu');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 49000, 500, 195
FROM events ev WHERE ev.title = 'RISE OF SIN COMPANY FEST 2026' AND ev.venue = 'WARKOP LIREN JATIBARANG, Kab. Indramayu'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- CLAFEST 2026 (Creative Law Festival 2026)
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'CLAFEST 2026 (Creative Law Festival 2026)', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-96@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-96@wavy.seed' AND a.name = 'CLAFEST 2026 (Creative Law Festival 2026)');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'CLAFEST 2026 (Creative Law Festival 2026)', 'Music', 'Karawang, Kota Adm. Jakarta Utara', '2026-12-27 18:00:00'::timestamptz, 'https://assets.artatix.co.id/event/7ESLXBEL8K.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'CLAFEST 2026 (Creative Law Festival 2026)'
WHERE o.email = 'demo.scrape-96@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'CLAFEST 2026 (Creative Law Festival 2026)' AND ev.venue = 'Karawang, Kota Adm. Jakarta Utara');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 35000, 500, 288
FROM events ev WHERE ev.title = 'CLAFEST 2026 (Creative Law Festival 2026)' AND ev.venue = 'Karawang, Kota Adm. Jakarta Utara'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- 17TH CELEBRATE BARAYA VIKING JAPAN
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, '17TH CELEBRATE BARAYA VIKING JAPAN', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-396@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-396@wavy.seed' AND a.name = '17TH CELEBRATE BARAYA VIKING JAPAN');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, '17TH CELEBRATE BARAYA VIKING JAPAN', 'Music', 'Lives Nagoya, Japan, Nagoya', '2027-01-02 10:00:01'::timestamptz, 'https://assets.artatix.co.id/event/43O7XD69A3.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = '17TH CELEBRATE BARAYA VIKING JAPAN'
WHERE o.email = 'demo.scrape-396@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = '17TH CELEBRATE BARAYA VIKING JAPAN' AND ev.venue = 'Lives Nagoya, Japan, Nagoya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 600000, 500, 208
FROM events ev WHERE ev.title = '17TH CELEBRATE BARAYA VIKING JAPAN' AND ev.venue = 'Lives Nagoya, Japan, Nagoya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- GEMBIRANG-GIGS#2
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'GEMBIRANG-GIGS#2', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-397@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-397@wavy.seed' AND a.name = 'GEMBIRANG-GIGS#2');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'GEMBIRANG-GIGS#2', 'Music', 'Kota Magelang, Kota Magelang', '2027-01-30 14:00:01'::timestamptz, 'https://assets.artatix.co.id/event/VIWR7Y07NY.png', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'GEMBIRANG-GIGS#2'
WHERE o.email = 'demo.scrape-397@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'GEMBIRANG-GIGS#2' AND ev.venue = 'Kota Magelang, Kota Magelang');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 60000, 500, 201
FROM events ev WHERE ev.title = 'GEMBIRANG-GIGS#2' AND ev.venue = 'Kota Magelang, Kota Magelang'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

-- Nicey Nice Festival
INSERT INTO artists (organizer_id, name, genre, photo_url, bio)
SELECT id, 'Nicey Nice Festival', 'Music', '', 'Seeded artist entry'
FROM organizers WHERE email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM artists a JOIN organizers o ON o.id = a.organizer_id WHERE o.email = 'demo.scrape-257@wavy.seed' AND a.name = 'Nicey Nice Festival');
INSERT INTO events (organizer_id, artist_id, title, category, venue, date, poster_url, description, status)
SELECT o.id, a.id, 'Nicey Nice Festival', 'Music', 'Surabaya, Kota Surabaya', '2027-04-04 15:00:01'::timestamptz, 'https://assets.artatix.co.id/event/Q54YJ2WAH5.jpg', 'Seeded from public listing data for UKK demo purposes.', 'published'
FROM organizers o JOIN artists a ON a.organizer_id = o.id AND a.name = 'Nicey Nice Festival'
WHERE o.email = 'demo.scrape-257@wavy.seed'
AND NOT EXISTS (SELECT 1 FROM events ev WHERE ev.title = 'Nicey Nice Festival' AND ev.venue = 'Surabaya, Kota Surabaya');
INSERT INTO ticket_categories (event_id, name, price, quota, sold)
SELECT ev.id, 'Reguler', 94000, 500, 191
FROM events ev WHERE ev.title = 'Nicey Nice Festival' AND ev.venue = 'Surabaya, Kota Surabaya'
AND NOT EXISTS (SELECT 1 FROM ticket_categories tc WHERE tc.event_id = ev.id);

COMMIT;