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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation text,
    shape character varying(60),
    radius_in_ly integer
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
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer,
    mean_radius_in_km numeric(5,1),
    description text
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
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    has_water boolean,
    has_life boolean,
    size integer,
    description text
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    size_in_solar_radii numeric(5,1),
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 525);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 511);
INSERT INTO public.asteroid VALUES (3, 'Juno', 254);
INSERT INTO public.asteroid VALUES (4, 'Eros', 17);
INSERT INTO public.asteroid VALUES (5, 'Psyche', 223);
INSERT INTO public.asteroid VALUES (6, 'Ida', 16);
INSERT INTO public.asteroid VALUES (7, 'Themis', 208);
INSERT INTO public.asteroid VALUES (8, 'Hektor', 250);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Saggitarius', 'barred spiral', 52850);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'barred spiral', 152000);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Corvus', 'spiral', 500000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Virgo', 'spiral', 49000);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Coma Berenices', 'spiral', 53800);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Ursa Major', 'irregular', 37000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737.4, 'The only natural satellite of Earth. Plays a key role in the tides of Earth.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.3, 'Innermost and larger of the two satellites of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 'The smaller and outermost of the two satellites of Mars. It is not much bigger than an asteroid.');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 1560.8, 'The smallest of the four Galilean moons of Jupiter and sixth closest to the planet.');
INSERT INTO public.moon VALUES (5, 'Io', 5, 1821.6, 'The third smallest of the four Galilean moons of Jupiter. It is the innermost moon of Jupiter.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.1, 'The largest of the four Galilean moons of Jupiter. It is also the ninth largest object in the Solar system (including the sun).');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.3, 'The second largest of the four Galilean moons of Jupiter. It is the third largest moon in the solar system.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.5, 'It has the third closest orbit to Jupiter and was the fifth moon of Jupiter to be discovered. It was the first moon to be discovered after the four Galilean moons.');
INSERT INTO public.moon VALUES (9, 'Adrastea', 5, 8.2, 'The second moon of Jupiter by distance and the smallest of the four inner moons of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Valetudo', 5, 0.5, 'Discovered in 2016 but not announced publicly until 2018. Orbits Jupiter at a distance of 19,000,000 kms and has a high chance of colliding with other moons that it crosses paths with.');
INSERT INTO public.moon VALUES (11, 'Thebe', 5, 49.3, 'The fourth moon of Jupiter by distance. It was discovered in 1979 and officially named in 1983.');
INSERT INTO public.moon VALUES (12, 'Himalia', 5, 85.0, 'A large irregular satellite of Jupiter. It is the sixth largest satellite of Jupiter after the Galilean moons and Amalthea.');
INSERT INTO public.moon VALUES (13, 'Jupiter LXI', 5, 1.0, 'Natural satellite of Jupiter discovered in 2003. It has an orbital period of 701 days.');
INSERT INTO public.moon VALUES (14, 'Elara', 5, 43.0, 'Irregular satellite of Jupiter that was discovered in 1905.');
INSERT INTO public.moon VALUES (15, 'Carme', 5, 23.0, 'Carme is a retrograde irregular satellite of Jupiter. It was discovered in 1938.');
INSERT INTO public.moon VALUES (16, 'Lysithea', 5, 18.0, 'Prograde irregular satellite of Jupiter. Discovered in 1938.');
INSERT INTO public.moon VALUES (17, 'Euporie', 5, 1.0, 'Also known as Jupiter XXXIV, it is a natural satellite of Jupiter. It was discovered in 2001.');
INSERT INTO public.moon VALUES (18, 'Kallichore', 5, 1.0, 'Also known as Jupiter XLIV. It was discovered in 2003.');
INSERT INTO public.moon VALUES (19, 'Jupiter LXIII', 5, 1.0, 'An outer natural satellite of Jupiter. It was discovered in 2017.');
INSERT INTO public.moon VALUES (20, 'Autonoe', 5, 2.0, 'Also known as Jupiter XXVIII, it was discovered in 2001.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, false, 4880, 'Small terrestrial planet with a rocky body');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, false, 6051, 'Terrestrial planet similar to Earth');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 6371, 'Our home planet. The only known planet to have liquid water and life. One of four terrestrial planets in our solar system.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, false, 3390, 'Terrestrial planet with a thin atmosphere. Looked at to be the next planet for colonisation by humans.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, false, 69911, 'Largest planet in the solar system. A gas giant with a faint planetary ring system.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, false, 58232, 'Second largest planet in the solar system. It is a gas giant with a number of planetary rings. It has at least 83 moons.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, false, 25362, 'An ice giant. Third largest planet in the solar system. 27 known satellites.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, false, 24622, 'One of the two ice giants in the solar system. It is the fourth largest planet in th solar system and it has 14 known moons.');
INSERT INTO public.planet VALUES (9, 'Janssen', 7, false, false, 11945, 'Super hot planet considered to be a Hell pllanet. It s so hot on the surface of the planet during day that steel would melt.');
INSERT INTO public.planet VALUES (10, 'Galileo', 7, false, false, NULL, 'Gas giant and fourth extrasolar planet to be discovered.');
INSERT INTO public.planet VALUES (11, 'Brahe', 7, false, false, NULL, 'Planet has only been detected indirectly so its characteristics are unknown but it is surmised to be a gas giant.');
INSERT INTO public.planet VALUES (12, 'Harriot', 7, false, false, NULL, 'Planet has only been detected indirectly, so its physical characteristics are unknown. Likely to be a gas giant.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 'Yellow dwarf');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1.7, 'Blue-white binary star');
INSERT INTO public.star VALUES (3, 'Arcturus', 1, 25.4, 'Red giant');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 78.9, 'Four stars appearing as 1 blue super-giant');
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 2.7, 'Blue-white subgiant');
INSERT INTO public.star VALUES (6, 'Mirach', 2, 100.0, 'Red giant');
INSERT INTO public.star VALUES (7, '55 Cancri', 1, 0.9, 'Binary star system with 5 exoplanets');


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 8, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: asteroid unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_id UNIQUE (asteroid_id);


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
