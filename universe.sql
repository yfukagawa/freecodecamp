--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    g_id integer NOT NULL,
    name character varying(30) NOT NULL,
    how_many_stars_in_million integer NOT NULL,
    rotation_speed_km_per_sec integer NOT NULL,
    memo_if_needed text,
    any_lifeform_y_or_n boolean NOT NULL,
    any_humanoid_lifeform_y_or_n boolean NOT NULL,
    age_in_billion_years numeric(5,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_g_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_g_id_seq OWNED BY public.galaxy.g_id;


--
-- Name: known_lifeforms; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.known_lifeforms (
    l_id integer NOT NULL,
    g_id integer NOT NULL,
    s_id integer NOT NULL,
    p_id integer NOT NULL,
    m_id integer NOT NULL,
    intelligence_level text NOT NULL,
    humanoid_y_or_n character varying(1) NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.known_lifeforms OWNER TO freecodecamp;

--
-- Name: known_lifeforms_l_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.known_lifeforms_l_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.known_lifeforms_l_id_seq OWNER TO freecodecamp;

--
-- Name: known_lifeforms_l_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.known_lifeforms_l_id_seq OWNED BY public.known_lifeforms.l_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    m_id integer NOT NULL,
    name character varying(30) NOT NULL,
    how_many_submoons integer NOT NULL,
    rotation_speed_km_per_sec integer NOT NULL,
    age_in_bil_yrs numeric(5,1) NOT NULL,
    memo_if_needed text,
    lifeform_y_or_n boolean NOT NULL,
    humanoid_y_or_n boolean NOT NULL,
    p_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_m_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_m_id_seq OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_m_id_seq OWNED BY public.moon.m_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    p_id integer NOT NULL,
    name character varying(30) NOT NULL,
    how_many_moons integer NOT NULL,
    rotation_speed_km_per_sec integer NOT NULL,
    memo_if_needed text,
    lifeform_y_or_n boolean NOT NULL,
    humanoid_y_or_n boolean NOT NULL,
    s_id integer,
    age_in_bil_yrs numeric(9,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_p_id_seq OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_p_id_seq OWNED BY public.planet.p_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    s_id integer NOT NULL,
    name character varying(30) NOT NULL,
    temp_in_million_c integer NOT NULL,
    rotation_speed_km_per_sec integer NOT NULL,
    age_in_bill_yrs numeric(5,1) NOT NULL,
    memo_if_needed text,
    lifeform_y_or_n boolean NOT NULL,
    humanoid_y_or_n boolean NOT NULL,
    g_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_s_id_seq OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_s_id_seq OWNED BY public.star.s_id;


--
-- Name: galaxy g_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN g_id SET DEFAULT nextval('public.galaxy_g_id_seq'::regclass);


--
-- Name: known_lifeforms l_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms ALTER COLUMN l_id SET DEFAULT nextval('public.known_lifeforms_l_id_seq'::regclass);


--
-- Name: moon m_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN m_id SET DEFAULT nextval('public.moon_m_id_seq'::regclass);


--
-- Name: planet p_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN p_id SET DEFAULT nextval('public.planet_p_id_seq'::regclass);


--
-- Name: star s_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN s_id SET DEFAULT nextval('public.star_s_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 100000, 210, 'We live here', true, true, 13.61);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000, 225, 'It is huge', false, false, 10.01);
INSERT INTO public.galaxy VALUES (3, 'Cain Major Dwarf Galaxy', 1000, 0, 'It seems to be falling apart', false, false, 0.24);
INSERT INTO public.galaxy VALUES (4, 'Green Dragon', 10, 130, 'Many planets with dragons', true, true, 300.25);
INSERT INTO public.galaxy VALUES (5, 'Red Light', 44, 334, 'Hellfire', true, false, 900.01);
INSERT INTO public.galaxy VALUES (6, 'Fast Bird', 702, 648, 'Super fast', true, true, 721.33);


--
-- Data for Name: known_lifeforms; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 30, 'we live here', true, true, 1, 4.54);
INSERT INTO public.planet VALUES (2, 'Yoshi', 2, 44, 'Green planet', true, true, 4, 44.40);
INSERT INTO public.planet VALUES (3, 'Coocoo', 7, 125, 'A bunch of birds', true, false, 6, 3.50);
INSERT INTO public.planet VALUES (4, 'RR10', 0, 100, 'not livable', false, false, 5, 110.80);
INSERT INTO public.planet VALUES (5, 'M115-6', 320, 5, 'many moons', true, true, 4, 556.90);
INSERT INTO public.planet VALUES (6, 'Hotbuns', 8, 220, 'Hot place', true, false, 6, 33.60);
INSERT INTO public.planet VALUES (7, 'Hobbit', 9, 187, 'little humanodis', true, true, 3, 212.40);
INSERT INTO public.planet VALUES (8, 'Qwacker', 10, 202, 'A bunch of birds', true, true, 6, 103.70);
INSERT INTO public.planet VALUES (9, 'RQW-44', 5, 201, 'not livable', false, false, 5, 300.80);
INSERT INTO public.planet VALUES (10, 'NWE-11', 11, 118, 'Livable', true, true, 4, 46.90);
INSERT INTO public.planet VALUES (11, 'Toaster', 666, 220, 'too many moons', true, false, 6, 512.70);
INSERT INTO public.planet VALUES (12, 'Drew', 4, 187, 'livable', true, true, 2, 44.40);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 15, 2, 4.6, 'it is very hot', false, false, 1);
INSERT INTO public.star VALUES (2, 'Andy', 5, 20, 5.0, 'it is very hot', false, false, 2);
INSERT INTO public.star VALUES (3, 'Ax Blade', 40, 3, 100.0, 'it is on fire', true, false, 3);
INSERT INTO public.star VALUES (4, 'Green Flame', 87, 228, 185.0, 'Dragons live there', true, false, 4);
INSERT INTO public.star VALUES (5, 'Cold Fire', 1, 130, 3.0, 'small and cold', false, false, 5);
INSERT INTO public.star VALUES (6, 'Hot Wing', 27, 13, 42.0, 'coming in hot', false, false, 6);


--
-- Name: galaxy_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_g_id_seq', 6, true);


--
-- Name: known_lifeforms_l_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.known_lifeforms_l_id_seq', 1, false);


--
-- Name: moon_m_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_m_id_seq', 1, false);


--
-- Name: planet_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_p_id_seq', 12, true);


--
-- Name: star_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_s_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (g_id);


--
-- Name: known_lifeforms known_lifeforms_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_name_key UNIQUE (name);


--
-- Name: known_lifeforms known_lifeforms_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_pkey PRIMARY KEY (l_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (m_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (p_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (s_id);


--
-- Name: known_lifeforms known_lifeforms_g_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_g_id_fkey FOREIGN KEY (g_id) REFERENCES public.galaxy(g_id);


--
-- Name: known_lifeforms known_lifeforms_g_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_g_id_fkey1 FOREIGN KEY (g_id) REFERENCES public.galaxy(g_id);


--
-- Name: known_lifeforms known_lifeforms_m_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_m_id_fkey FOREIGN KEY (m_id) REFERENCES public.moon(m_id);


--
-- Name: known_lifeforms known_lifeforms_m_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_m_id_fkey1 FOREIGN KEY (m_id) REFERENCES public.moon(m_id);


--
-- Name: known_lifeforms known_lifeforms_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.planet(p_id);


--
-- Name: known_lifeforms known_lifeforms_p_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_p_id_fkey1 FOREIGN KEY (p_id) REFERENCES public.planet(p_id);


--
-- Name: known_lifeforms known_lifeforms_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_s_id_fkey FOREIGN KEY (s_id) REFERENCES public.star(s_id);


--
-- Name: known_lifeforms known_lifeforms_s_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.known_lifeforms
    ADD CONSTRAINT known_lifeforms_s_id_fkey1 FOREIGN KEY (s_id) REFERENCES public.star(s_id);


--
-- Name: moon moon_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.planet(p_id);


--
-- Name: moon moon_p_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_p_id_fkey1 FOREIGN KEY (p_id) REFERENCES public.planet(p_id);


--
-- Name: planet planet_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_s_id_fkey FOREIGN KEY (s_id) REFERENCES public.star(s_id);


--
-- Name: planet planet_s_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_s_id_fkey1 FOREIGN KEY (s_id) REFERENCES public.star(s_id);


--
-- Name: star star_g_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_g_id_fkey FOREIGN KEY (g_id) REFERENCES public.galaxy(g_id);


--
-- Name: star star_g_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_g_id_fkey1 FOREIGN KEY (g_id) REFERENCES public.galaxy(g_id);


--
-- PostgreSQL database dump complete
--

