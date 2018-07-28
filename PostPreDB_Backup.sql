--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2018-07-25 20:57:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2822 (class 1262 OID 16393)
-- Name: test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE test OWNER TO postgres;

\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 24603)
-- Name: user_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_status (
    user_status_id smallint NOT NULL,
    val character varying(50)
);


ALTER TABLE public.user_status OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24601)
-- Name: UserStatus_UserStatusID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserStatus_UserStatusID_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserStatus_UserStatusID_seq" OWNER TO postgres;

--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 200
-- Name: UserStatus_UserStatusID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserStatus_UserStatusID_seq" OWNED BY public.user_status.user_status_id;


--
-- TOC entry 198 (class 1259 OID 16418)
-- Name: answer_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_sequence
    START WITH 1000
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_sequence OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16420)
-- Name: question_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_sequence
    START WITH 1000
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_sequence OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16396)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    name character varying(30),
    email character varying(96),
    email_confirm boolean DEFAULT false,
    user_status_id smallint DEFAULT 1
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 2680 (class 2604 OID 16399)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2683 (class 2604 OID 24606)
-- Name: user_status user_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_status ALTER COLUMN user_status_id SET DEFAULT nextval('public."UserStatus_UserStatusID_seq"'::regclass);


--
-- TOC entry 2812 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (1, 'Tom', 'tom@mail.ru', false, 1);
INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (4, 'Petya', 'Petya@mail.ru', false, 2);
INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (3, 'Vasya', 'Vasya@mail.ru', false, 2);
INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (5, 'Anna', 'anna@mail.ru', false, 3);
INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (7, '1', '1', true, 2);
INSERT INTO public."user" (user_id, name, email, email_confirm, user_status_id) VALUES (2, 'Mark', 'mark@mail.ru', true, 3);


--
-- TOC entry 2816 (class 0 OID 24603)
-- Dependencies: 201
-- Data for Name: user_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_status (user_status_id, val) VALUES (1, 'новый');
INSERT INTO public.user_status (user_status_id, val) VALUES (2, 'проверенный');
INSERT INTO public.user_status (user_status_id, val) VALUES (3, 'заблокированный');


--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 200
-- Name: UserStatus_UserStatusID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserStatus_UserStatusID_seq"', 3, true);


--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 198
-- Name: answer_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_sequence', 1000, false);


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 199
-- Name: question_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_sequence', 1000, false);


--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 2689 (class 2606 OID 24608)
-- Name: user_status UserStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_status
    ADD CONSTRAINT "UserStatus_pkey" PRIMARY KEY (user_status_id);


--
-- TOC entry 2685 (class 2606 OID 24600)
-- Name: user User_un_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "User_un_email" UNIQUE (email);


--
-- TOC entry 2687 (class 2606 OID 16401)
-- Name: user users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


-- Completed on 2018-07-25 20:57:50

--
-- PostgreSQL database dump complete
--

