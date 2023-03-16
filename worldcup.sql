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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: continents; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continents (
    continent_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.continents OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continents_continent_id_seq OWNED BY public.continents.continent_id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: continents continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continents ALTER COLUMN continent_id SET DEFAULT nextval('public.continents_continent_id_seq'::regclass);


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continents VALUES (1, 'North America');
INSERT INTO public.continents VALUES (2, 'South America');
INSERT INTO public.continents VALUES (3, 'Africa');
INSERT INTO public.continents VALUES (4, 'Europe');
INSERT INTO public.continents VALUES (5, 'Asia');
INSERT INTO public.continents VALUES (6, 'Oceania');


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (123, 2018, 'Final', 404, 405, 4, 2);
INSERT INTO public.games VALUES (124, 2018, 'Third Place', 406, 407, 2, 0);
INSERT INTO public.games VALUES (125, 2018, 'Semi-Final', 405, 407, 2, 1);
INSERT INTO public.games VALUES (126, 2018, 'Semi-Final', 404, 406, 1, 0);
INSERT INTO public.games VALUES (127, 2018, 'Quarter-Final', 405, 408, 3, 2);
INSERT INTO public.games VALUES (128, 2018, 'Quarter-Final', 407, 409, 2, 0);
INSERT INTO public.games VALUES (129, 2018, 'Quarter-Final', 406, 410, 2, 1);
INSERT INTO public.games VALUES (130, 2018, 'Quarter-Final', 404, 411, 2, 0);
INSERT INTO public.games VALUES (131, 2018, 'Eighth-Final', 407, 412, 2, 1);
INSERT INTO public.games VALUES (132, 2018, 'Eighth-Final', 409, 413, 1, 0);
INSERT INTO public.games VALUES (133, 2018, 'Eighth-Final', 406, 414, 3, 2);
INSERT INTO public.games VALUES (134, 2018, 'Eighth-Final', 410, 415, 2, 0);
INSERT INTO public.games VALUES (135, 2018, 'Eighth-Final', 405, 416, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Eighth-Final', 408, 417, 2, 1);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 411, 418, 2, 1);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 404, 419, 4, 3);
INSERT INTO public.games VALUES (139, 2014, 'Final', 420, 419, 1, 0);
INSERT INTO public.games VALUES (140, 2014, 'Third Place', 421, 410, 3, 0);
INSERT INTO public.games VALUES (141, 2014, 'Semi-Final', 419, 421, 1, 0);
INSERT INTO public.games VALUES (142, 2014, 'Semi-Final', 420, 410, 7, 1);
INSERT INTO public.games VALUES (143, 2014, 'Quarter-Final', 421, 422, 1, 0);
INSERT INTO public.games VALUES (144, 2014, 'Quarter-Final', 419, 406, 1, 0);
INSERT INTO public.games VALUES (145, 2014, 'Quarter-Final', 410, 412, 2, 1);
INSERT INTO public.games VALUES (146, 2014, 'Quarter-Final', 420, 404, 1, 0);
INSERT INTO public.games VALUES (147, 2014, 'Eighth-Final', 410, 423, 2, 1);
INSERT INTO public.games VALUES (148, 2014, 'Eighth-Final', 412, 411, 2, 0);
INSERT INTO public.games VALUES (149, 2014, 'Eighth-Final', 404, 424, 2, 0);
INSERT INTO public.games VALUES (150, 2014, 'Eighth-Final', 420, 425, 2, 1);
INSERT INTO public.games VALUES (151, 2014, 'Eighth-Final', 421, 415, 2, 1);
INSERT INTO public.games VALUES (152, 2014, 'Eighth-Final', 422, 426, 2, 1);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 419, 413, 1, 0);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 406, 427, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (404, 'France');
INSERT INTO public.teams VALUES (405, 'Croatia');
INSERT INTO public.teams VALUES (406, 'Belgium');
INSERT INTO public.teams VALUES (407, 'England');
INSERT INTO public.teams VALUES (408, 'Russia');
INSERT INTO public.teams VALUES (409, 'Sweden');
INSERT INTO public.teams VALUES (410, 'Brazil');
INSERT INTO public.teams VALUES (411, 'Uruguay');
INSERT INTO public.teams VALUES (412, 'Colombia');
INSERT INTO public.teams VALUES (413, 'Switzerland');
INSERT INTO public.teams VALUES (414, 'Japan');
INSERT INTO public.teams VALUES (415, 'Mexico');
INSERT INTO public.teams VALUES (416, 'Denmark');
INSERT INTO public.teams VALUES (417, 'Spain');
INSERT INTO public.teams VALUES (418, 'Portugal');
INSERT INTO public.teams VALUES (419, 'Argentina');
INSERT INTO public.teams VALUES (420, 'Germany');
INSERT INTO public.teams VALUES (421, 'Netherlands');
INSERT INTO public.teams VALUES (422, 'Costa Rica');
INSERT INTO public.teams VALUES (423, 'Chile');
INSERT INTO public.teams VALUES (424, 'Nigeria');
INSERT INTO public.teams VALUES (425, 'Algeria');
INSERT INTO public.teams VALUES (426, 'Greece');
INSERT INTO public.teams VALUES (427, 'United States');


--
-- Name: continents_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continents_continent_id_seq', 6, true);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 154, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 427, true);


--
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (continent_id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey1 PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

