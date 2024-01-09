 --
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(50),
    password character varying(255),
    accesslevel character varying(50)
);


ALTER TABLE public.admin OWNER TO kim;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO kim;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: cinema; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.cinema (
    id integer NOT NULL,
    name character varying(255),
    location character varying(255)
);


ALTER TABLE public.cinema OWNER TO kim;

--
-- Name: cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.cinema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_id_seq OWNER TO kim;

--
-- Name: cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.cinema_id_seq OWNED BY public.cinema.id;


--
-- Name: cinemaadmin; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.cinemaadmin (
    id integer NOT NULL,
    adminid integer,
    cinemaid integer
);


ALTER TABLE public.cinemaadmin OWNER TO kim;

--
-- Name: cinemaadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.cinemaadmin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinemaadmin_id_seq OWNER TO kim;

--
-- Name: cinemaadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.cinemaadmin_id_seq OWNED BY public.cinemaadmin.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phonenumber character varying(20)
);


ALTER TABLE public.client OWNER TO kim;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO kim;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    title character varying(255),
    duration integer,
    genre character varying(50)
);


ALTER TABLE public.movie OWNER TO kim;

--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO kim;

--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- Name: price; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.price (
    id integer NOT NULL,
    type character varying(50),
    amount numeric(5,2)
);


ALTER TABLE public.price OWNER TO kim;

--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO kim;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    clientid integer,
    screeningid integer,
    totalamount numeric(8,2),
    paymentmethod character varying(50)
);


ALTER TABLE public.reservation OWNER TO kim;

--
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO kim;

--
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- Name: screening; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.screening (
    id integer NOT NULL,
    datetime timestamp without time zone,
    movieid integer,
    theaterid integer,
    priceid integer
);


ALTER TABLE public.screening OWNER TO kim;

--
-- Name: screening_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.screening_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screening_id_seq OWNER TO kim;

--
-- Name: screening_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.screening_id_seq OWNED BY public.screening.id;


--
-- Name: seat; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.seat (
    id integer NOT NULL,
    number character varying(10),
    theaterid integer,
    screeningid integer
);


ALTER TABLE public.seat OWNER TO kim;

--
-- Name: seat_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seat_id_seq OWNER TO kim;

--
-- Name: seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.seat_id_seq OWNED BY public.seat.id;


--
-- Name: theater; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.theater (
    id integer NOT NULL,
    number integer,
    capacity integer,
    cinemaid integer
);


ALTER TABLE public.theater OWNER TO kim;

--
-- Name: theater_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.theater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theater_id_seq OWNER TO kim;

--
-- Name: theater_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.theater_id_seq OWNED BY public.theater.id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: cinema id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinema ALTER COLUMN id SET DEFAULT nextval('public.cinema_id_seq'::regclass);


--
-- Name: cinemaadmin id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinemaadmin ALTER COLUMN id SET DEFAULT nextval('public.cinemaadmin_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- Name: screening id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.screening ALTER COLUMN id SET DEFAULT nextval('public.screening_id_seq'::regclass);


--
-- Name: seat id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.seat ALTER COLUMN id SET DEFAULT nextval('public.seat_id_seq'::regclass);


--
-- Name: theater id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.theater ALTER COLUMN id SET DEFAULT nextval('public.theater_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.admin (id, username, password, accesslevel) FROM stdin;
\.


--
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.cinema (id, name, location) FROM stdin;
\.


--
-- Data for Name: cinemaadmin; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.cinemaadmin (id, adminid, cinemaid) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.client (id, name, email, phonenumber) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.movie (id, title, duration, genre) FROM stdin;
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.price (id, type, amount) FROM stdin;
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.reservation (id, clientid, screeningid, totalamount, paymentmethod) FROM stdin;
\.


--
-- Data for Name: screening; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.screening (id, datetime, movieid, theaterid, priceid) FROM stdin;
\.


--
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.seat (id, number, theaterid, screeningid) FROM stdin;
\.


--
-- Data for Name: theater; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.theater (id, number, capacity, cinemaid) FROM stdin;
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, false);


--
-- Name: cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.cinema_id_seq', 1, false);


--
-- Name: cinemaadmin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.cinemaadmin_id_seq', 1, false);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.movie_id_seq', 1, false);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.price_id_seq', 1, false);


--
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);


--
-- Name: screening_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.screening_id_seq', 1, false);


--
-- Name: seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.seat_id_seq', 1, false);


--
-- Name: theater_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.theater_id_seq', 1, false);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: cinema cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (id);


--
-- Name: cinemaadmin cinemaadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinemaadmin
    ADD CONSTRAINT cinemaadmin_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- Name: screening screening_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.screening
    ADD CONSTRAINT screening_pkey PRIMARY KEY (id);


--
-- Name: seat seat_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (id);


--
-- Name: theater theater_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.theater
    ADD CONSTRAINT theater_pkey PRIMARY KEY (id);


--
-- Name: cinemaadmin cinemaadmin_adminid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinemaadmin
    ADD CONSTRAINT cinemaadmin_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(id);


--
-- Name: cinemaadmin cinemaadmin_cinemaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cinemaadmin
    ADD CONSTRAINT cinemaadmin_cinemaid_fkey FOREIGN KEY (cinemaid) REFERENCES public.cinema(id);


--
-- Name: reservation reservation_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- Name: reservation reservation_screeningid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_screeningid_fkey FOREIGN KEY (screeningid) REFERENCES public.screening(id);


--
-- Name: screening screening_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.screening
    ADD CONSTRAINT screening_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movie(id);


--
-- Name: screening screening_priceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.screening
    ADD CONSTRAINT screening_priceid_fkey FOREIGN KEY (priceid) REFERENCES public.price(id);


--
-- Name: screening screening_theaterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.screening
    ADD CONSTRAINT screening_theaterid_fkey FOREIGN KEY (theaterid) REFERENCES public.theater(id);


--
-- Name: seat seat_screeningid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_screeningid_fkey FOREIGN KEY (screeningid) REFERENCES public.screening(id);


--
-- Name: seat seat_theaterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_theaterid_fkey FOREIGN KEY (theaterid) REFERENCES public.theater(id);


--
-- Name: theater theater_cinemaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.theater
    ADD CONSTRAINT theater_cinemaid_fkey FOREIGN KEY (cinemaid) REFERENCES public.cinema(id);


--
-- PostgreSQL database dump complete
--

