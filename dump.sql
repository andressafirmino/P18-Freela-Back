--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    "idCategory" integer NOT NULL,
    category text NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: logged; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logged (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: logged_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logged_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logged_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logged_id_seq OWNED BY public.logged.id;


--
-- Name: old_photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.old_photos (
    id integer NOT NULL,
    "idPhotos" integer NOT NULL,
    photos text NOT NULL
);


--
-- Name: photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    "idProduct" integer NOT NULL,
    "photoUrl" text
);


--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.old_photos.id;


--
-- Name: photos_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.photos_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photos_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.photos_id_seq1 OWNED BY public.photos.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    category text NOT NULL,
    description text NOT NULL,
    "idSeller" integer NOT NULL,
    status boolean DEFAULT true NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    cpf text NOT NULL,
    phone text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: logged id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logged ALTER COLUMN id SET DEFAULT nextval('public.logged_id_seq'::regclass);


--
-- Name: old_photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.old_photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq1'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: logged; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.logged VALUES (1, 'andressa', 'andressa@firmino.com', '281b2fdf-5582-4156-98ac-532acf8c4565', '2023-08-12 18:34:24.575507');
INSERT INTO public.logged VALUES (2, 'andressa', 'andressa@firmino.com', '15e50662-44d0-4059-90c6-71c2ffcb5e40', '2023-08-12 19:02:45.200791');
INSERT INTO public.logged VALUES (3, 'andressa', 'andressa@firmino.com', '2c769c85-87f0-40cd-926c-49ab02fc0887', '2023-08-12 19:09:14.703396');
INSERT INTO public.logged VALUES (4, 'andressa', 'andressa@firmino.com', '3a11f035-f549-4731-91f8-5739b7e1e62e', '2023-08-12 19:13:53.639548');
INSERT INTO public.logged VALUES (5, 'andressa', 'andressa@firmino.com', '20051cd9-02e0-4a7a-827c-3ea545ca7ab4', '2023-08-12 19:16:55.985273');
INSERT INTO public.logged VALUES (6, 'andressa', 'andressa@firmino.com', '745a9569-6cae-4142-b73f-2ee32f7372f6', '2023-08-12 19:26:52.029665');
INSERT INTO public.logged VALUES (7, 'andressa', 'andressa@firmino.com', '8c1bc767-ec2d-4425-bee7-31c057014f7b', '2023-08-12 19:38:05.512531');
INSERT INTO public.logged VALUES (8, 'andressa', 'andressa@firmino.com', 'cdad347c-9acd-4c09-9092-668ff8fd1f3b', '2023-08-12 20:07:41.950227');
INSERT INTO public.logged VALUES (9, 'andressa', 'andressa@firmino.com', '081eb4f6-589c-4ee4-b96b-3af80862ef2b', '2023-08-12 20:47:12.597284');
INSERT INTO public.logged VALUES (10, 'andressa', 'andressa@firmino.com', 'f5bbb232-6a40-4774-8729-70edfe302204', '2023-08-12 22:11:59.676424');
INSERT INTO public.logged VALUES (11, 'andressa', 'andressa@firmino.com', '72b0d0d3-26ff-456f-82aa-21b5b4303680', '2023-08-12 22:36:09.763985');
INSERT INTO public.logged VALUES (12, 'andressa', 'andressa@firmino.com', '5f8c8799-e5a5-4da7-ab04-2744970ab389', '2023-08-14 02:49:56.863086');
INSERT INTO public.logged VALUES (13, 'Teste', 'teste@teste.com', '40f2002a-07cb-4cf2-b87e-3a4e173061c8', '2023-08-14 11:20:19.524915');
INSERT INTO public.logged VALUES (15, 'andressa', 'andressa@firmino.com', 'e9bf2be1-3db8-4343-a7f8-f59fb0196ef9', '2023-08-14 13:03:30.738886');
INSERT INTO public.logged VALUES (16, 'Teste', 'teste@teste.com', '4e74a165-2fda-4730-a385-9c6181ed6968', '2023-08-14 13:23:33.827042');
INSERT INTO public.logged VALUES (17, 'andressa', 'andressa@firmino.com', 'a1819d96-4e83-4b58-b4de-53e7deefc6a0', '2023-08-14 15:03:57.860311');
INSERT INTO public.logged VALUES (20, 'andressa', 'andressa@firmino.com', 'c9257144-95c4-4d15-baa0-870d9bbd88b5', '2023-08-14 15:52:54.065657');


--
-- Data for Name: old_photos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.photos VALUES (1, 2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftkoc.fandom.com%2Fpt-br%2Fwiki%2FFeiticeira_Negra&psig=AOvVaw1YJJPCXjCAhJWTZb1oLLlR&ust=1691978459764000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi4m4vF2IADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (2, 2, 'https://lh3.googleusercontent.com/05JfZ1ZdyzrRNvhJosUFdcjjJRFE7k2KhmeM2ujqeCbrcrCb1hkq7O_JdUBpQ3r9hi0YeSn4WgmKx3Ai8LHdM2SucxSzl9TRZ4fCAqETJ6WtHgE=w1440-e365');
INSERT INTO public.photos VALUES (3, 2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpokemongolive.com%2Fpt_br%2Fpost%2Fpgo-anniversary-2022%2F&psig=AOvVaw1Aweae8YaFbiJFFtFn7xXI&ust=1692065967667000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPi37-Gh24ADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (4, 3, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftkoc.fandom.com%2Fpt-br%2Fwiki%2FFeiticeira_Negra&psig=AOvVaw1YJJPCXjCAhJWTZb1oLLlR&ust=1691978459764000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi4m4vF2IADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (5, 3, 'https://lh3.googleusercontent.com/05JfZ1ZdyzrRNvhJosUFdcjjJRFE7k2KhmeM2ujqeCbrcrCb1hkq7O_JdUBpQ3r9hi0YeSn4WgmKx3Ai8LHdM2SucxSzl9TRZ4fCAqETJ6WtHgE=w1440-e365');
INSERT INTO public.photos VALUES (6, 3, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpokemongolive.com%2Fpt_br%2Fpost%2Fpgo-anniversary-2022%2F&psig=AOvVaw1Aweae8YaFbiJFFtFn7xXI&ust=1692065967667000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPi37-Gh24ADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (7, 4, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftkoc.fandom.com%2Fpt-br%2Fwiki%2FFeiticeira_Negra&psig=AOvVaw1YJJPCXjCAhJWTZb1oLLlR&ust=1691978459764000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi4m4vF2IADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (8, 4, NULL);
INSERT INTO public.photos VALUES (9, 4, NULL);
INSERT INTO public.photos VALUES (10, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftkoc.fandom.com%2Fpt-br%2Fwiki%2FFeiticeira_Negra&psig=AOvVaw1YJJPCXjCAhJWTZb1oLLlR&ust=1691978459764000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIi4m4vF2IADFQAAAAAdAAAAABAE');
INSERT INTO public.photos VALUES (11, 5, NULL);
INSERT INTO public.photos VALUES (12, 5, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpokemongolive.com%2Fpt_br%2Fpost%2Fpgo-anniversary-2022%2F&psig=AOvVaw1Aweae8YaFbiJFFtFn7xXI&ust=1692065967667000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPi37-Gh24ADFQAAAAAdAAAAABAE');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (1, 'pikachu', 'Pokemon', 'carta rara', 1, true);
INSERT INTO public.products VALUES (2, 'maga', 'digimon', 'especial', 1, false);
INSERT INTO public.products VALUES (3, 'maga', 'digimon', 'especial', 1, false);
INSERT INTO public.products VALUES (4, 'maga', 'digimon', 'especial', 1, false);
INSERT INTO public.products VALUES (5, 'maga', 'digimon', 'especial', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'andressa', 'andressa@firmino.com', '$2b$10$EeSHJARVjDXQNgOn0X7DbebJWs6hBpUc9usJ9o6gMt2yxaCO8RZl6', '11111111111', '11111111111', '2023-08-12 18:33:51.411421');
INSERT INTO public.users VALUES (2, 'Teste', 'teste@teste.com', '$2b$10$ENSgdZECshQAmX42C4MhPOBKTk0cUhvks0tNUf.qo.J4V.JEc0SgG', '11111111111', '11111111111', '2023-08-14 11:03:23.418778');
INSERT INTO public.users VALUES (3, 'teste', 'teste2@teste.com', '$2b$10$swvIHpScVDb.NT97KaWBZu2dXChGu78mqZbP8MIPV0k8b6JWO8enW', '12312312312', '12112341234', '2023-08-14 11:19:07.687295');


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: logged_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logged_id_seq', 20, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.photos_id_seq', 2, true);


--
-- Name: photos_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.photos_id_seq1', 12, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: categories categories_idCategory_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "categories_idCategory_key" UNIQUE ("idCategory");


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: logged logged_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logged
    ADD CONSTRAINT logged_pkey PRIMARY KEY (id);


--
-- Name: logged logged_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logged
    ADD CONSTRAINT logged_token_key UNIQUE (token);


--
-- Name: old_photos photos_idPhotos_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.old_photos
    ADD CONSTRAINT "photos_idPhotos_key" UNIQUE ("idPhotos");


--
-- Name: old_photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.old_photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey1 PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: logged logged_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logged
    ADD CONSTRAINT logged_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- Name: photos photos_idProduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photos_idProduct_fkey" FOREIGN KEY ("idProduct") REFERENCES public.products(id);


--
-- Name: products products_idSeller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_idSeller_fkey" FOREIGN KEY ("idSeller") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

