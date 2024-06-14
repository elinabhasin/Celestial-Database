--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: cosmic_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cosmic_events (
    cosmic_events_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.cosmic_events OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    dist_from_earth_mpc numeric(4,3),
    constellation text,
    description text,
    approx_number_of_stars_crores integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    has_atmosphere boolean,
    has_human_exploration boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(60),
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity_class character(7),
    star_type character varying(60)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cosmic_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cosmic_events VALUES (1, 'Parade of Planets', 'On June 3, 2024, Mercury, Mars, Jupiter, Saturn, Uranus, and Neptune will align along the ecliptic.');
INSERT INTO public.cosmic_events VALUES (2, 'Lyrid meteor shower', 'On April 21–22, 2024, this event will have an average of 10 meteors per hour.');
INSERT INTO public.cosmic_events VALUES (3, 'Penumbral lunar eclipse', 'On March 25, 2024, this event will be visible from North America.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0.008, 'Sagittarius', 'This is the galaxy containing the Sun and its Solar System, and therefore Earth. Most things visible to the naked eye in the sky are part of it, including the Milky Way composing the Zone of Avoidance.', 30000);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy', 2, 3.600, 'Ursa Major', 'Appears similar in shape to a cigar.Also known as Messier 82 or M82', 10);
INSERT INTO public.galaxy VALUES ('IC 342', 3, 3.280, 'Camelopardalis', 'The hidden galaxy.', 2000);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 4, 5.000, 'Coma Berenices', 'The SLEEPING BEAUTY galaxy.', 100000);
INSERT INTO public.galaxy VALUES ('Tiangulum Galaxy', 5, 0.840, 'Triangulum', 'Named after its location within the Triangulum constellation..', 4000);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 6, 0.050, 'Dorado/Mensa', 'This is the fourth-largest galaxy in the Local Group,named after Ferdinand Magellan.', 1000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('NULL', 1, 1, NULL, false);
INSERT INTO public.moon VALUES ('NULL', 2, 2, NULL, false);
INSERT INTO public.moon VALUES ('NULL', 17, 9, NULL, false);
INSERT INTO public.moon VALUES ('Phobos', 4, 4, false, false);
INSERT INTO public.moon VALUES ('Deimos', 5, 4, false, false);
INSERT INTO public.moon VALUES ('Europa', 6, 5, true, false);
INSERT INTO public.moon VALUES ('Ganymede', 7, 5, true, false);
INSERT INTO public.moon VALUES ('Callisto', 8, 5, false, false);
INSERT INTO public.moon VALUES ('Io', 9, 5, true, false);
INSERT INTO public.moon VALUES ('Thebe', 10, 5, false, false);
INSERT INTO public.moon VALUES ('Titan', 11, 6, true, false);
INSERT INTO public.moon VALUES ('Enceladus', 12, 6, false, false);
INSERT INTO public.moon VALUES ('Titania', 13, 7, false, false);
INSERT INTO public.moon VALUES ('Ariel', 14, 7, false, false);
INSERT INTO public.moon VALUES ('Triton', 15, 8, true, false);
INSERT INTO public.moon VALUES ('Thalassa', 16, 8, false, false);
INSERT INTO public.moon VALUES ('Charon', 18, 10, false, false);
INSERT INTO public.moon VALUES ('Namaka', 19, 11, false, false);
INSERT INTO public.moon VALUES ('MK 2', 20, 12, false, false);
INSERT INTO public.moon VALUES ('Moon', 3, 3, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, false, 0, 1);
INSERT INTO public.planet VALUES ('Venus', 2, false, 0, 1);
INSERT INTO public.planet VALUES ('Earth', 3, true, 1, 1);
INSERT INTO public.planet VALUES ('Mars', 4, false, 2, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 95, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, false, 146, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, false, 28, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, false, 16, 1);
INSERT INTO public.planet VALUES ('Ceres', 9, false, 0, 1);
INSERT INTO public.planet VALUES ('Pluto', 10, false, 5, 1);
INSERT INTO public.planet VALUES ('Haumea', 11, false, 2, 1);
INSERT INTO public.planet VALUES ('Makemake', 12, false, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('NULL', 1, 3, 'Unknown', NULL);
INSERT INTO public.star VALUES ('NULL', 2, 4, 'Unknown', NULL);
INSERT INTO public.star VALUES ('NULL', 5, 2, 'Unknown', NULL);
INSERT INTO public.star VALUES ('BV 399', 3, 5, 'II     ', 'Variable star of the Beta Lyrae type.');
INSERT INTO public.star VALUES ('RS Puppis', 4, 6, 'I      ', 'Classical Cepheid variable star.');
INSERT INTO public.star VALUES ('Alpha Centauri', 6, 1, 'V      ', 'Binary star system: G2V and K1V.');
INSERT INTO public.star VALUES ('SUN', 8, 1, 'G2V    ', 'G2V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: cosmic_events cosmic_events_cosmic_events_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmic_events
    ADD CONSTRAINT cosmic_events_cosmic_events_id_key UNIQUE (cosmic_events_id);


--
-- Name: cosmic_events cosmic_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmic_events
    ADD CONSTRAINT cosmic_events_pkey PRIMARY KEY (cosmic_events_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


