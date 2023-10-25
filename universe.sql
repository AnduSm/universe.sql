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
    name character varying(30),
    has_life boolean DEFAULT false,
    galaxy_type character varying(30),
    galaxy_id integer NOT NULL,
    age character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    mass character varying(50),
    gravity character varying(30),
    satellite_of character varying(30),
    moon_id integer NOT NULL,
    planet_id integer
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    name character varying(30) NOT NULL,
    description text,
    more_info_id integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    has_life boolean DEFAULT false,
    distance_from_earth_million_miles_or_lys integer,
    planet_id integer NOT NULL,
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
    name character varying(30) NOT NULL,
    star_type text,
    age_in_millions_of_years numeric(5,1),
    solar_masses integer,
    star_id integer NOT NULL,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', true, 'Spiral Galxy', 1, '13.61B');
INSERT INTO public.galaxy VALUES ('Andromeda', false, 'Spiral Galaxy', 2, '10.01B');
INSERT INTO public.galaxy VALUES ('Cygnus A', false, 'Elliptical Galaxy', 3, '1.000B');
INSERT INTO public.galaxy VALUES ('Pegasus', false, 'Spheroidal', 4, '12.5B');
INSERT INTO public.galaxy VALUES ('Virgo A', false, 'Elliptical', 5, '???');
INSERT INTO public.galaxy VALUES ('Maffei 1', false, 'Elliptical', 6, '10.0B+');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', '7.34767309 x 10^22kg', '1.62m/s²', 'Earth', 1, 3);
INSERT INTO public.moon VALUES ('Phobos', '1.0659 x 10^22kg', '0.0057m/s²', 'Mars', 2, 4);
INSERT INTO public.moon VALUES ('Deimos', '1.4762 x 10^15kg', '0.003m/s²', 'Mars', 3, 4);
INSERT INTO public.moon VALUES ('Europa', '0.008 Earths', '1.315m/s²', 'Jupiter', 4, 5);
INSERT INTO public.moon VALUES ('Io', '0.015 Earths', '1.796m/s²', 'Jupiter', 5, 5);
INSERT INTO public.moon VALUES ('Ganymede', '0.025 Earths', '1.428m/s²', 'Jupiter', 6, 5);
INSERT INTO public.moon VALUES ('Callisto', '0.018 Earths', '1.4238m/s²', 'Jupiter', 7, 5);
INSERT INTO public.moon VALUES ('Titan', '0.022 Earths', '1.352m/s²', 'Saturn', 8, 6);
INSERT INTO public.moon VALUES ('Enceladus', '1.8x10^-5 Earths', '0.113m/s²', 'Saturn', 9, 6);
INSERT INTO public.moon VALUES ('Iapetus', '0.0003 Earths', '0.223m/s²', 'Saturn', 10, 6);
INSERT INTO public.moon VALUES ('Mimas', '6.3x10^-6 Earths', '0.064m/s²', 'Saturn', 11, 6);
INSERT INTO public.moon VALUES ('Tethys', '1.03x10^-4 Earths', '0.146m/s²', 'Saturn', 12, 6);
INSERT INTO public.moon VALUES ('Dione', '1.834x10^-4 Earths', '0.232m/s²', 'Saturn', 13, 6);
INSERT INTO public.moon VALUES ('Oberon', '3.076 x 10^21kg', '0.354m/s²', 'Uranus', 16, 7);
INSERT INTO public.moon VALUES ('Umbriel', '1.275 x 10^21kg', '0.250m/s²', 'Uranus', 17, 7);
INSERT INTO public.moon VALUES ('Titania', '3.400 x 10^21kg', '0.365m/s²', 'Uranus', 14, 7);
INSERT INTO public.moon VALUES ('Miranda', '6.4 x 10^19kg', '0.077m/s²', 'Uranus', 15, 7);
INSERT INTO public.moon VALUES ('Triton', '0.00359 Earths', '0.779m/s²', 'Neptune', 18, 8);
INSERT INTO public.moon VALUES ('Proteus', '4.4 x 10^19kg', '0.070/s²', 'Neptune', 19, 8);
INSERT INTO public.moon VALUES ('Charon', '1.586 x 10^21kg', '0.288/s²', 'Pluto', 20, 9);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES ('Ganymede', 'Largest moon in our solar system even bigger than Mercury', 1);
INSERT INTO public.more_info VALUES ('Venus', 'The only planet that rotates clockwise', 2);
INSERT INTO public.more_info VALUES ('Earth', 'All major planets fit side by side between the Earth and the Moon', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Terrestrial', false, 133, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 'Terrestrial', false, 68, 2, 1);
INSERT INTO public.planet VALUES ('Mars', 'Terrestrial', false, 237, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', 'Gas Giant', false, 370, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 'Gas Giant', false, 857, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 'Ice Giant', false, 1736, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 'Ice Giant', false, 2704, 8, 1);
INSERT INTO public.planet VALUES ('Earth', 'Terrestrial', true, 0, 3, 1);
INSERT INTO public.planet VALUES ('Dimidium', 'Hot Jupiter', false, 50, 10, 2);
INSERT INTO public.planet VALUES ('14 Herculis b', 'Gas Giant', false, 58, 12, 2);
INSERT INTO public.planet VALUES ('Janssen', 'Terrestrial', false, 40, 11, 2);
INSERT INTO public.planet VALUES ('Kepler 189f', 'Terrestrial', false, 580, 9, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'Yellow Dwarf', 4603.0, 1, 1, 1);
INSERT INTO public.star VALUES ('Vega', 'A0V', 450.0, 2, 3, 1);
INSERT INTO public.star VALUES ('Canopus', 'Class F A9', 450.0, 8, 6, 1);
INSERT INTO public.star VALUES ('Sirius', 'Binary', 230.0, 2, 5, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 'Red Supergiant', 10.1, 17, 2, 1);
INSERT INTO public.star VALUES ('Antares', 'Red Supergiant', 11.1, 15, 4, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_fk_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet__fk_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet__fk_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
