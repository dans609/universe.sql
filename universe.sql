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

--
-- Name: btype; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.btype AS ENUM (
    'Stellar',
    'Supermassive',
    'Intermediate'
);


ALTER TYPE public.btype OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(60) NOT NULL,
    blackhole_type public.btype NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_types character varying(60),
    has_life boolean
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
    moon_id integer NOT NULL,
    name character varying(60),
    diameter_in_km integer NOT NULL,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number_of_moon integer NOT NULL,
    diameter_in_km integer NOT NULL,
    distance_from_sun_in_million_miles numeric(8,2),
    description text,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(60),
    description text,
    diameter_in_km integer NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, '1E1740.7-2942', 'Stellar');
INSERT INTO public.blackhole VALUES (2, 'Cigar Galaxy', 'Intermediate');
INSERT INTO public.blackhole VALUES (3, '1ES 2344+514', 'Supermassive');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy is called the Milky Way. It is a spiral galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Is the most powerful cosmic source of radio waves known, lying in the northern constellation Cygnus about 500,000,000 light-years from our home planet -Earth-', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Also known as Virgo A, is a giant elliptical galaxy in the constellation. Virgo whose nucleus contains a blackhole, the first ever to be directly imaged. M87 is the most powerful known source of radio energy among the thousands of galactic systems.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf Galaxy', 'Is the member of the local group of galaxies (the group that includes the Milky Way) named after the constellation Canis Major, in which it appears to lie. Discovered in 2003 by a team of astronomers from many countries', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Maffie I and II', 'Two galaxies relatively close to the Milky Way but unobserved until the late 1960s, when Italian astronomer, Paolo Maffei detected them by their infrared radiation', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3500, 'Earth moon is the brightest and largest object in our night sky. The Moon makes Earth a more livable planet by moderating our home planet wobble on its axis', 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 2618, 'Phobos is the larger of Mars two moons, It orbits Mars three times a day, and is so close to the planet surface that in some locations on Mars it cannot always be seen.', 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 1980, 'Like Phobos, Deimos is a small and lumpy, heavily cratered object. Its craters are generally smaller than 1.6 miles (2.5 kilometers) in diameter, however, and it lacks the grooves and ridges seen on Phobos', 4);
INSERT INTO public.moon VALUES (5, 'Europa', 3100, 'Europa is named for a woman who, in Greek mythology, was abducted by the god Zeus – Jupiter in Roman mythology', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631, 'The largest moon in the solar system, this icy world is the only moon to have its own magnetic field – and the atmospheric auroras that come with that.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2500, 'Callisto is the most heavily cratered object in our solar system.', 5);
INSERT INTO public.moon VALUES (8, 'Io', 3600, 'Volcanic activity on this Jovian moon is so abundant, it resurfaces the face of Io with new deposits faster than comets, and asteroids can pepper it with large craters.', 5);
INSERT INTO public.moon VALUES (9, 'Titan', 5150, 'Saturn largest moon, Titan has an earthlike cycle of liquids flowing across its surface. It is the only moon with a thick atmosphere.', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 'The mythological Mimas was a giant who was killed by Mars in the war between the Titans and the gods of Olympus.', 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 505, 'Geysers venting from Saturn moon Enceladus give clues that its subsurface saltwater ocean could be a possible habitat for life.', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1527, 'The name Rhea comes from the Greek goddess (or Titan) Rhea, who was the daughter of Uranus and Gaea. Her husband was Kronus (the Roman Saturn).', 6);
INSERT INTO public.moon VALUES (13, 'Dione', 1122, 'Cassini referred to Dione as one of the four Sidera Lodoicea (Stars of Louis) after King Louis XIV (the other three were Iapetus, Tethys, and Rhea).', 6);
INSERT INTO public.moon VALUES (14, 'Atlas', 30, 'Moons of Saturn were originally named for Greco-Roman Titans and descendants of the Titans.', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 472, 'Miranda was discovered in telescopic photos of the Uranian system by Gerard P. Kuiper on Feb. 16, 1948 at the McDonald Observatory in western Texas.', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1158, 'Ariel was discovered Oct. 24, 1851 by William Lassell, one of 19th century England grand amateur astronomers, who used the fortune he made in the brewery business to finance his telescopes.', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1200, 'Umbriel is the darkest of Uranus largest moons. It reflects only 16 percent of the light that strikes its surface, a feature similar to the highland areas of Earth Moon.', 7);
INSERT INTO public.moon VALUES (18, 'Titania', 1577, 'Titania is Uranus largest moon. Images taken by Voyager 2 almost 200 years after Titania discovery revealed signs that the moon was geologically active.', 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 1523, 'Oberon is the second largest moon of Uranus. Discovered in 1787, little was known about this moon until Voyager 2 passed it during its flyby of Uranus in January 1986', 7);
INSERT INTO public.moon VALUES (20, 'Triton', 2706, 'Triton, Largest of Neptune moons. Its diameter is about 1,680 mi (2,700 km), nearly 80% that of Earth Moon. Unique among the large moons of the solar system, Triton moves in a retrograde orbit, opposite the direction of Neptune rotation.', 8);
INSERT INTO public.moon VALUES (21, 'Despina', 150, 'Despina is irregularly shaped and shows no sign of any geological modification. It is likely that it is a rubble pile re-accreted from fragments of Neptune original satellites.', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'The Earth', 1, 12760, 93.00, 'Earth is our home planet, is the third planet from the sun, and the fifth largest planet.', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 4879, 36.00, 'Mercury is the closest planet to the Sun, and the smallest planet in our solar system-only slightly larger than Earth Moon.', true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 12104, 67.00, 'Venus is the second planet from the Sun, and the sixth largest planet. It is the hottest planet in our solar system.', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 6779, 142.00, 'Mars is the fourth planet from the Sun, and the seventh largest. It is the only planet we know of inhabited entirely by robots.', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 139820, 484.00, 'Jupiter is the fifth planet from the Sun, and the largest in the solar system -more than twice as massive as the other planets combined.', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 120500, 886.00, 'Saturn is the sixth planet from the Sun, and the second largest in the solar system. It is surrounded by a beautiful rings.', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 51118, 1800.00, 'Uranus is the seventh planet from the Sun, and the third largest planet in our solar system. It appears to spin sideways', true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 49528, 2800.00, 'Neptune is the eighth, and most distant planet from the Sun, It is the fourth-largest, and the first planet discovered with math.', true, 1);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', 0, 140000, 129329.76, 'Is a strong candidate for an extragalactic planet within the Andromeda Galaxy, it was detected through a microlensing event in 1999, however anstonomers are still working to confirm its existence', false, 5);
INSERT INTO public.planet VALUES (10, 'Dummy Planet I', 1028, 25000, 98274.52, 'Its a dummy planet create for exercise related project to the freecodecamp relation database course, this planet is orbit arround Betelguese Star in the Andromeda Galaxy', false, 5);
INSERT INTO public.planet VALUES (11, 'Dummy Planet II', 0, 12000, 105321.22, 'It is a dummy planet II, for exercise related project', false, 6);
INSERT INTO public.planet VALUES (12, 'Dummy Planet III', 10, 1800, 10021.22, 'It is a dummy planet III, for exercise related project', false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'The Sun is the star at the heart of our solar system. Its gravity holds the solar system together, keeping everything in its orbit', 1400000, true, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 'Also known as North Star, as well as Pole Star, Lodestar, or sometimes Guiding Star, is the 45th brightest star in the night sky. Lies at an estimated distance between 323 and 433 light years from Earth', 70000000, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Sirius or also known as Dog Star, because it is the brightest star in Canis Major (The Big Dog), Sirius is also the brightest star in the night sky, named from the Ancient Greek -Seirios- which translated to -Glowing- or -Schorcher-.', 2400000, true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse (Alpha Orionis)', 'Betelgeuse is a red supergiant star in the constellation Orion. It is one of the largest known stars and exhibits significant non-sphericity due to its intense stellar wind and irregular pulsations', 1200000000, false, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 'Alpheratz also known as Sirrah, is the brightest starin the constellation of Andromeda. Alpheratz is a spectroscopic binary star', 1700000, true, 2);
INSERT INTO public.star VALUES (7, 'Mirach', 'Mirach or also known as Beta Andromedae, is a prominent star in the northern constellation of Andromeda. Mirach is a red giant star that has a planet or brown dwarf companion (designated as -b-)', 199000000, true, 2);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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

