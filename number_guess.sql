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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(50),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1668749871037', 5, 335);
INSERT INTO public.number_guess VALUES ('user_1668749801118', 5, 100);
INSERT INTO public.number_guess VALUES ('user_1668749801117', 5, 228);
INSERT INTO public.number_guess VALUES ('user_1668749809480', 5, 899);
INSERT INTO public.number_guess VALUES ('user_1668749809481', 5, 507);
INSERT INTO public.number_guess VALUES ('user_1668749862809', 5, 141);
INSERT INTO public.number_guess VALUES ('user_1668749862810', 5, 86);
INSERT INTO public.number_guess VALUES ('user_1668749871038', 5, 99);
INSERT INTO public.number_guess VALUES ('user_1668749892252', 5, 181);
INSERT INTO public.number_guess VALUES ('user_1668749892253', 5, 129);
INSERT INTO public.number_guess VALUES ('user_1668749950471', 5, 197);
INSERT INTO public.number_guess VALUES ('user_1668749950470', 5, 11);
INSERT INTO public.number_guess VALUES ('user_1668749954663', 5, 604);
INSERT INTO public.number_guess VALUES ('user_1668749954664', 5, 232);
INSERT INTO public.number_guess VALUES ('user_1668749993277', 5, 509);
INSERT INTO public.number_guess VALUES ('user_1668749993278', 5, 242);


--
-- Name: number_guess number_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

