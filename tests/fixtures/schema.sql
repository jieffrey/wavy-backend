-- Snapshot skema dasar (pg_dump --schema-only) sebelum migration order-rules.
-- Dipakai tests/preload.ts untuk membangun database test. Jangan dijalankan ke DB produksi.

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.admins (
    id bigint NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;

CREATE TABLE public.artists (
    id bigint NOT NULL,
    organizer_id bigint,
    name text,
    genre text,
    photo_url text,
    bio text
);

CREATE SEQUENCE public.artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name text,
    email text,
    created_at timestamp with time zone
);

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;

CREATE TABLE public.events (
    id bigint NOT NULL,
    organizer_id bigint,
    artist_id bigint,
    title text,
    category text,
    venue text,
    date timestamp with time zone,
    poster_url text,
    description text,
    status text DEFAULT 'draft'::text,
    gallery text DEFAULT '[]'::text NOT NULL,
    terms_conditions text DEFAULT ''::text NOT NULL,
    seatmap text DEFAULT ''::text NOT NULL,
    banner_url text DEFAULT ''::text NOT NULL
);

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;

CREATE TABLE public.favorite_artists (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    artist_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);

CREATE SEQUENCE public.favorite_artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.favorite_artists_id_seq OWNED BY public.favorite_artists.id;

CREATE TABLE public.favorite_organizers (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    organizer_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);

CREATE SEQUENCE public.favorite_organizers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.favorite_organizers_id_seq OWNED BY public.favorite_organizers.id;

CREATE TABLE public.notifications (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;

CREATE TABLE public.notify_requests (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    event_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);

CREATE SEQUENCE public.notify_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.notify_requests_id_seq OWNED BY public.notify_requests.id;

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint,
    event_id bigint,
    ticket_category_id bigint,
    quantity bigint,
    total_price numeric,
    status text DEFAULT 'pending_payment'::text,
    expires_at timestamp with time zone,
    created_at timestamp with time zone,
    full_name text DEFAULT ''::text NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    phone text DEFAULT ''::text NOT NULL,
    id_number text DEFAULT ''::text NOT NULL,
    birth_date date,
    gender text DEFAULT ''::text NOT NULL,
    wa_consent text DEFAULT ''::text NOT NULL
);

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;

CREATE TABLE public.organizers (
    id bigint NOT NULL,
    name text,
    email text,
    password text,
    created_at timestamp with time zone,
    status text DEFAULT 'active'::text NOT NULL,
    whatsapp text DEFAULT ''::text NOT NULL,
    event_types text DEFAULT ''::text NOT NULL,
    social_link text DEFAULT ''::text NOT NULL
);

CREATE SEQUENCE public.organizers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;

CREATE TABLE public.otp_codes (
    id integer NOT NULL,
    email text NOT NULL,
    code text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    used boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);

CREATE SEQUENCE public.otp_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.otp_codes_id_seq OWNED BY public.otp_codes.id;

CREATE TABLE public.reviews (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    event_id bigint NOT NULL,
    rating integer NOT NULL,
    comment text,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;

CREATE TABLE public.ticket_categories (
    id bigint NOT NULL,
    event_id bigint,
    name text,
    price numeric,
    quota bigint,
    sold bigint DEFAULT 0,
    benefits text DEFAULT ''::text NOT NULL
);

CREATE SEQUENCE public.ticket_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.ticket_categories_id_seq OWNED BY public.ticket_categories.id;

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    order_id bigint,
    qr_code text,
    is_scanned boolean DEFAULT false,
    owner_id bigint NOT NULL
);

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;

CREATE TABLE public.waiting_list (
    id integer NOT NULL,
    event_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE SEQUENCE public.waiting_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.waiting_list_id_seq OWNED BY public.waiting_list.id;

CREATE TABLE public.waiting_room (
    id integer NOT NULL,
    event_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE SEQUENCE public.waiting_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.waiting_room_id_seq OWNED BY public.waiting_room.id;

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);

ALTER TABLE ONLY public.favorite_artists ALTER COLUMN id SET DEFAULT nextval('public.favorite_artists_id_seq'::regclass);

ALTER TABLE ONLY public.favorite_organizers ALTER COLUMN id SET DEFAULT nextval('public.favorite_organizers_id_seq'::regclass);

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);

ALTER TABLE ONLY public.notify_requests ALTER COLUMN id SET DEFAULT nextval('public.notify_requests_id_seq'::regclass);

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);

ALTER TABLE ONLY public.otp_codes ALTER COLUMN id SET DEFAULT nextval('public.otp_codes_id_seq'::regclass);

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);

ALTER TABLE ONLY public.ticket_categories ALTER COLUMN id SET DEFAULT nextval('public.ticket_categories_id_seq'::regclass);

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);

ALTER TABLE ONLY public.waiting_list ALTER COLUMN id SET DEFAULT nextval('public.waiting_list_id_seq'::regclass);

ALTER TABLE ONLY public.waiting_room ALTER COLUMN id SET DEFAULT nextval('public.waiting_room_id_seq'::regclass);

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.favorite_artists
    ADD CONSTRAINT favorite_artists_customer_id_artist_id_key UNIQUE (customer_id, artist_id);

ALTER TABLE ONLY public.favorite_artists
    ADD CONSTRAINT favorite_artists_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.favorite_organizers
    ADD CONSTRAINT favorite_organizers_customer_id_organizer_id_key UNIQUE (customer_id, organizer_id);

ALTER TABLE ONLY public.favorite_organizers
    ADD CONSTRAINT favorite_organizers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.notify_requests
    ADD CONSTRAINT notify_requests_customer_id_event_id_key UNIQUE (customer_id, event_id);

ALTER TABLE ONLY public.notify_requests
    ADD CONSTRAINT notify_requests_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_customer_id_event_id_key UNIQUE (customer_id, event_id);

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.ticket_categories
    ADD CONSTRAINT ticket_categories_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uni_customers_email UNIQUE (email);

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT uni_organizers_email UNIQUE (email);

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT uni_tickets_qr_code UNIQUE (qr_code);

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_event_id_customer_id_key UNIQUE (event_id, customer_id);

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.waiting_room
    ADD CONSTRAINT waiting_room_event_id_customer_id_key UNIQUE (event_id, customer_id);

ALTER TABLE ONLY public.waiting_room
    ADD CONSTRAINT waiting_room_pkey PRIMARY KEY (id);

CREATE INDEX idx_otp_codes_email_code ON public.otp_codes USING btree (email, code);

ALTER TABLE ONLY public.favorite_artists
    ADD CONSTRAINT favorite_artists_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(id);

ALTER TABLE ONLY public.favorite_artists
    ADD CONSTRAINT favorite_artists_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);

ALTER TABLE ONLY public.favorite_organizers
    ADD CONSTRAINT favorite_organizers_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);

ALTER TABLE ONLY public.favorite_organizers
    ADD CONSTRAINT favorite_organizers_organizer_id_fkey FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);

ALTER TABLE ONLY public.ticket_categories
    ADD CONSTRAINT fk_events_ticket_categories FOREIGN KEY (event_id) REFERENCES public.events(id);

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);

ALTER TABLE ONLY public.notify_requests
    ADD CONSTRAINT notify_requests_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);

ALTER TABLE ONLY public.notify_requests
    ADD CONSTRAINT notify_requests_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);
