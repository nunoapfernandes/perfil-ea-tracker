--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE episode (
    episode_id integer NOT NULL,
    imdb character varying(255),
    number integer,
    runtime integer
);


ALTER TABLE episode OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genre (
    id_genre integer NOT NULL,
    genre character varying(255)
);


ALTER TABLE genre OWNER TO postgres;

--
-- Name: genre_id_genre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genre_id_genre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_id_genre_seq OWNER TO postgres;

--
-- Name: genre_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genre_id_genre_seq OWNED BY genre.id_genre;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media (
    id_media integer NOT NULL,
    category integer,
    image_path character varying(255),
    overview character varying(5000),
    rating numeric(19,2),
    rating_trakt numeric(19,2),
    released timestamp without time zone,
    title character varying(255),
    tmdb character varying(255)
);


ALTER TABLE media OWNER TO postgres;

--
-- Name: media_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media_genre (
    medias_id_media integer NOT NULL,
    genres_id_genre integer NOT NULL
);


ALTER TABLE media_genre OWNER TO postgres;

--
-- Name: media_id_media_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_id_media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_id_media_seq OWNER TO postgres;

--
-- Name: media_id_media_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_id_media_seq OWNED BY media.id_media;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE movie (
    certification character varying(255),
    homepage character varying(255),
    imdb character varying(255),
    language character varying(255),
    runtime integer,
    slug character varying(255),
    tagline character varying(255),
    trailer character varying(255),
    id_media integer NOT NULL
);


ALTER TABLE movie OWNER TO postgres;

--
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE season (
    aired_episodes integer,
    episodes integer,
    number integer,
    season_id integer NOT NULL
);


ALTER TABLE season OWNER TO postgres;

--
-- Name: season_episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE season_episode (
    season_id integer NOT NULL,
    episode_id integer NOT NULL
);


ALTER TABLE season_episode OWNER TO postgres;

--
-- Name: tvshow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tvshow (
    aired_day character varying(255),
    aired_episodes integer,
    aired_time character varying(255),
    aired_timezone character varying(255),
    certification character varying(255),
    country character varying(255),
    homepage character varying(255),
    imdb character varying(255),
    language character varying(255),
    network character varying(255),
    runtime integer,
    seasons integer,
    show_id integer NOT NULL,
    slug character varying(255),
    status character varying(255),
    trailer character varying(255)
);


ALTER TABLE tvshow OWNER TO postgres;

--
-- Name: tvshow_season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tvshow_season (
    show_id integer NOT NULL,
    season_id integer NOT NULL
);


ALTER TABLE tvshow_season OWNER TO postgres;

--
-- Name: user_has_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_has_media (
    add_date timestamp without time zone,
    comment character varying(255),
    rating integer,
    view_date timestamp without time zone,
    watched boolean,
    watchlist boolean,
    usertr_id_user integer NOT NULL,
    media_id_media integer NOT NULL
);


ALTER TABLE user_has_media OWNER TO postgres;

--
-- Name: usertr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usertr (
    id_user integer NOT NULL,
    about character varying(255),
    birthday timestamp without time zone,
    email character varying(255),
    gender character varying(255),
    image_path character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE usertr OWNER TO postgres;

--
-- Name: usertr_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usertr_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usertr_id_user_seq OWNER TO postgres;

--
-- Name: usertr_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usertr_id_user_seq OWNED BY usertr.id_user;


--
-- Name: genre id_genre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN id_genre SET DEFAULT nextval('genre_id_genre_seq'::regclass);


--
-- Name: media id_media; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media ALTER COLUMN id_media SET DEFAULT nextval('media_id_media_seq'::regclass);


--
-- Name: usertr id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertr ALTER COLUMN id_user SET DEFAULT nextval('usertr_id_user_seq'::regclass);


--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY episode (episode_id, imdb, number, runtime) FROM stdin;
3	tt4417020	1	64
4	tt4559272	2	43
5	tt4559274	3	48
6	tt4559276	4	46
7	tt4559278	5	45
8	tt4549106	6	51
10	tt4549108	1	42
11	tt4897130	2	44
12	tt5218334	3	42
13	tt5218358	4	44
14	tt5218374	5	42
15	tt5218388	6	44
16	tt5218406	7	43
17	tt5218418	8	44
18	tt5218430	9	45
19	tt5218442	10	43
20	tt5218450	11	43
21	tt5218460	12	42
22	tt5218470	13	40
23	tt5218476	14	42
24	tt4959800	15	45
26	tt5646582	1	47
27	tt6082748	2	48
28	tt6082752	3	43
29	tt6082756	4	43
30	tt6094030	5	43
31	tt6094034	6	45
32	tt6094038	7	45
33	\N	8	45
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genre (id_genre, genre) FROM stdin;
1	action
2	adventure
3	animation
4	anime
5	biography
6	children
7	comedy
8	crime
9	disaster
10	documentary
11	drama
12	eastern
13	family
14	fan-film
15	fantasy
16	film-noir
17	game-show
18	history
19	holiday
20	home-and-garden
21	horror
22	indie
23	mini-series
24	music
25	musical
26	mystery
27	news
28	none
29	reality
30	road
31	romance
32	science-fiction
33	short
34	soap
35	special-interest
36	sporting-event
37	sports
38	suspense
39	talk-show
40	thriller
41	tv-movie
42	war
43	western
\.


--
-- Name: genre_id_genre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genre_id_genre_seq', 43, true);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media (id_media, category, image_path, overview, rating, rating_trakt, released, title, tmdb) FROM stdin;
1	2	/cCDuZqLv6jwnf3cZZq7g3uNLaIu.jpg	A horrifying zombiocalypse spin-off series from The Walking Dead, set in the same universe but starting at a far earlier time in Los Angeles. The show follows normal people learning to deal with the rapidly growing collapse of civilization, at the very beginning of a zombie outbreak.In Los Angeles, a city where people come to escape, shield secrets, and bury their pasts, we follow this mysterious outbreak as it threatens to disrupt what little stability high school guidance counselor Madison Clark and English teacher Travis Manawa have managed to assemble. The pressure of blending two families while dealing with resentful, escapist, and strung out children takes a back seat when society begins to break down. A forced evolution, and survival of the fittest takes hold, as our dysfunctional family finds they must either reinvent themselves or embrace their darker histories.	\N	7.32	2015-08-23 00:00:00	Fear the Walking Dead	62286
2	3	/i2bXSzpKWw0RVmLdldhBFT3a0Ty.jpg	\N	\N	7.34	2015-08-24 01:00:00	Season 1	62286
3	4	/AqVgGJBEiboLcEvrORj825asXaQ.jpg	A highly dysfunctional blended family is forced together when they realize a reported virus is actually the onset of the undead apocalypse.	\N	7.48	2015-08-24 01:00:00	Pilot	62286
4	4	/ucJSgfXGSUXllKkUXj5VSeuzTjY.jpg	While Madison struggles to keep Nick from crippling withdrawal, Travis ventures out to find his son before the city of Los Angeles falls.	\N	7.58	2015-08-31 01:00:00	So Close, Yet So Far	62286
5	4	/h549fQfrFm4VAstYHuiN4pBQKQF.jpg	After they escape a riot, Travis, Liza and Chris seek refuge with the Salazars. Madison defends her home.	\N	7.60	2015-09-14 01:00:00	The Dog	62286
6	4	/4RQkvl5d7E9Bzy8Xb9PHX609bsA.jpg	Madison and Travis see different sides of the National Guard's occupation in their neighborhood; the family tries to adapt to the new world.	\N	7.52	2015-09-21 01:00:00	Not Fade Away	62286
7	4	/mch2M5E6ep67gIIcjV9GPc5AnJZ.jpg	The National Guard's plan for the neighborhood is revealed. Meanwhile, Travis and Madison make a difficult decision.	\N	7.55	2015-09-28 01:00:00	Cobalt	62286
8	4	/eeZsNbAxVsysrLOk0HMDUrZVMQf.jpg	As civil unrest grows, and the dead take over, Travis and Madison try to devise ways to protect their families.	\N	7.91	2015-10-05 01:00:00	The Good Man	62286
9	3	/qMwcN9GFKmETQViGl6268jCyyXi.jpg	\N	\N	7.08	2016-04-11 01:00:00	Season 2	62286
10	4	/xbi94WOnv8nFKNDipP3OaAC58pz.jpg	After fleeing a burning Los Angeles on Strand's yacht, tensions arise among the group. Strand remains mysterious. Our group encounters danger at sea.	\N	7.37	2016-04-11 01:00:00	Monster	62286
11	4	/9Yb6TGfo8YfYIc8oRRCi86Ga9bA.jpg	The group seeks shelter with a survivalist family and Madison tries to uncover the family's true motives. Salazar works to discover Strand's intentions.	\N	7.42	2016-04-18 01:00:00	We All Fall Down	62286
12	4	/iOSxUesOZD9a1lTC508lk0e97z3.jpg	Madison confronts Strand about his mysterious destination. Nick, Alicia and others inspect wreckage from a plane crash.	\N	7.52	2016-04-25 01:00:00	Ouroboros	62286
13	4	/qpStK1MQtA5AUrhjgd0PvC0ZDCU.jpg	The group lets a family in distress board the Abigail. Strand's past begins to come to light. Nick looks for an associate of Strand.	\N	7.61	2016-05-02 01:00:00	Blood in the Streets	62286
14	4	/seXoGUWAZ6DMSMQw4VlZPf5zjfa.jpg	Alicia works toward reuniting with her family. Travis comes across a familiar face. Madison and Nick try to save their family against all odds.	\N	7.52	2016-05-09 01:00:00	Captive	62286
15	4	/niX3UGNmPZOVw8h0v4t7jXcL8eU.jpg	As Abigail arrives at her destination, conflicts arise. Chris makes a shocking decision. Nick knows a new mother figure.	\N	7.47	2016-05-16 01:00:00	Sicut Cervus	62286
16	4	/xcqecmQFHLAMFPC0z5Q1n3qN56F.jpg	The family faces their biggest test yet; Nick, Madison, Travis and others try to stay close to each other.	\N	7.37	2016-05-23 01:00:00	Shiva	62286
17	4	/aUH2ItdbHS3kPxfWwitkBKkR4kf.jpg	Nick's search for answers leads him into a deadly dog-eat-dog landscape. A dark time from his past is uncovered.	\N	7.30	2016-08-22 01:00:00	Grotesque	62286
18	4	/xlsY4gXwX8QAH5H3ODGfNcCPkrF.jpg	After the fall of the compound, Madison, Strand and others forge a tenuous path forward.  Meanwhile, Nick is recruited for a perilous assignment.	\N	7.42	2016-08-29 01:00:00	Los Muertos	62286
19	4	/qFEZHshhf0QsSteUzu3PFYgOLL0.jpg	Travis struggles to connect with Chris while searching for shelter.  Meanwhile, Alicia meets a lonely woman with a bloody past.	\N	7.60	2016-09-05 01:00:00	Do Not Disturb	62286
20	4	/p3MLwCdUOcNK1X0vH0jlh7fcQdI.jpg	Alicia and Madison try to bring two competing factions together; Nick uses skills from his past for his new role.\n	\N	7.55	2016-09-12 01:00:00	Pablo & Jessica	62286
21	4	/nlRGmFzgqyl0vyJ0TjvWtFEDCmh.jpg	Madison springs into action when one of the hotel residents gets violent.  Meanwhile, Alejandro shows a darker side of himself at the Colonia.	\N	7.50	2016-09-19 01:00:00	Pillar of Salt	62286
22	4	/bJDbkqfgPyf1UI8tYXC9dGE1kkV.jpg	Madison struggles to cope as a large number of refugees flood into the hotel, including someone familiar but unexpected.	\N	7.41	2016-09-26 01:00:00	Date of Death	62286
23	4	/ymHnr9axhOlkSn2urQvAqvnz05o.jpg	Travis is thrown off by new refugees; Nick must decide if he's going to stay at the Colonia with Luciana or leave.	\N	7.91	2016-10-03 01:00:00	Wrath	62286
24	4	/u6G7ItO8Bn9eFg9l7vpu44nQokm.jpg	Season finale. When Travis' rage causes unrest at the hotel, Madison has to choose whether or not she will stand by him; Nick becomes leader of the Colonia as Narcos close in.	\N	7.82	2016-10-03 01:00:00	North	62286
25	3	/cMh46P517YVBedpMtO3ucBvK1jM.jpg	\N	\N	8.63	2017-06-05 01:00:00	עונה 3	62286
26	4	/ibvKh25Zudki90LYVGzkA0m9qvX.jpg	In the third season opener, the Clark family find themselves in a dire predicament and must work together to discover a path to safety.	\N	7.69	2017-06-05 01:00:00	Eye of the Beholder	62286
27	4	/qc9LbqdSOKoKgx24iIBBXr5wjSz.jpg	Following a harrowing journey, the Clark family arrive at their new home; and Strand faces resistance as he attempts to hold power over his domain.	\N	7.64	2017-06-05 01:00:00	The New Frontier	62286
28	4	/9wp7BHmCcmz9EnT9nwUiLa5O2qb.jpg	Still finding their place, Alicia and Nick fall in with new crowds while Madison discovers Otto's past mimics that of her own.	\N	7.57	2017-06-12 01:00:00	TEOTWAWKI	62286
29	4	/uXwWHomxsCoSj80YO67Z1jELxff.jpg	A mysterious character searches for purpose and soon becomes tied to the struggle over a key resource in the apocalypse.	\N	7.87	2017-06-19 01:00:00	100	62286
30	4	/hXpNjQXE2V01E0AiKCHhhzpPUeb.jpg	An oncoming threat disrupts peace; Madison and Troy search for answers; Alicia must reconcile with her past.	\N	7.66	2017-06-26 01:00:00	Burning in Water, Drowning in Flame	62286
31	4	\N	Loyalty wavers at the Ranch; news of incoming danger spreads in the community; Madison struggles to keep everyone together; Nick grapples with a hard truth.	\N	7.74	2017-07-03 01:00:00	Red Dirt	62286
32	4	\N	A new arrival sows a divide within the ranch. Meanwhile, Alicia forms a new relationship in hopes of maintaining peace.	\N	8.67	2017-07-10 01:00:00	The Unveiling	62286
33	4	\N	Madison must negotiate the terms of an agreement in the midst of ranch-wide turmoil; and Nick and Alicia challenge their mother's motives.	\N	5.25	2017-07-10 01:00:00	Children of Wrath	62286
\.


--
-- Data for Name: media_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media_genre (medias_id_media, genres_id_genre) FROM stdin;
1	11
1	21
\.


--
-- Name: media_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_id_media_seq', 33, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie (certification, homepage, imdb, language, runtime, slug, tagline, trailer, id_media) FROM stdin;
\.


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY season (aired_episodes, episodes, number, season_id) FROM stdin;
6	6	1	2
15	15	2	9
5	8	3	25
\.


--
-- Data for Name: season_episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY season_episode (season_id, episode_id) FROM stdin;
2	3
2	4
2	5
2	6
2	7
2	8
9	10
9	11
9	12
9	13
9	14
9	15
9	16
9	17
9	18
9	19
9	20
9	21
9	22
9	23
9	24
25	26
25	27
25	28
25	29
25	30
25	31
25	32
25	33
\.


--
-- Data for Name: tvshow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tvshow (aired_day, aired_episodes, aired_time, aired_timezone, certification, country, homepage, imdb, language, network, runtime, seasons, show_id, slug, status, trailer) FROM stdin;
Sunday	27	21:00	America/New_York	TV-MA	us	http://www.amc.com/shows/fear-the-walking-dead	tt3743822	en	AMC	45	3	1	fear-the-walking-dead	returning series	http://youtube.com/watch?v=yzXglr5bc3w
\.


--
-- Data for Name: tvshow_season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tvshow_season (show_id, season_id) FROM stdin;
1	2
1	9
1	25
\.


--
-- Data for Name: user_has_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_has_media (add_date, comment, rating, view_date, watched, watchlist, usertr_id_user, media_id_media) FROM stdin;
\.


--
-- Data for Name: usertr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usertr (id_user, about, birthday, email, gender, image_path, password, username) FROM stdin;
\.


--
-- Name: usertr_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usertr_id_user_seq', 1, false);


--
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (episode_id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id_genre);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id_media);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id_media);


--
-- Name: season_episode season_episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season_episode
    ADD CONSTRAINT season_episode_pkey PRIMARY KEY (season_id, episode_id);


--
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season_pkey PRIMARY KEY (season_id);


--
-- Name: tvshow tvshow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow
    ADD CONSTRAINT tvshow_pkey PRIMARY KEY (show_id);


--
-- Name: tvshow_season tvshow_season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow_season
    ADD CONSTRAINT tvshow_season_pkey PRIMARY KEY (show_id, season_id);


--
-- Name: season_episode uk_awn7qk5mh409vfh5bnub9n231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season_episode
    ADD CONSTRAINT uk_awn7qk5mh409vfh5bnub9n231 UNIQUE (episode_id);


--
-- Name: tvshow_season uk_iwf3qu0oh4qjj4gg4rdo0a5k5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow_season
    ADD CONSTRAINT uk_iwf3qu0oh4qjj4gg4rdo0a5k5 UNIQUE (season_id);


--
-- Name: user_has_media user_has_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_has_media
    ADD CONSTRAINT user_has_media_pkey PRIMARY KEY (usertr_id_user, media_id_media);


--
-- Name: usertr usertr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertr
    ADD CONSTRAINT usertr_pkey PRIMARY KEY (id_user);


--
-- Name: media_genre fk1qthwhh4lxyfoki578jsyrkte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_genre
    ADD CONSTRAINT fk1qthwhh4lxyfoki578jsyrkte FOREIGN KEY (genres_id_genre) REFERENCES genre(id_genre);


--
-- Name: season fk4asm7g66okbejyon1i2m8eljn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season
    ADD CONSTRAINT fk4asm7g66okbejyon1i2m8eljn FOREIGN KEY (season_id) REFERENCES media(id_media);


--
-- Name: media_genre fk5stvav1yog66fylnt3tb3g98f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_genre
    ADD CONSTRAINT fk5stvav1yog66fylnt3tb3g98f FOREIGN KEY (medias_id_media) REFERENCES media(id_media);


--
-- Name: tvshow_season fkcg12g27wxga3d3xwoxb3fiv13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow_season
    ADD CONSTRAINT fkcg12g27wxga3d3xwoxb3fiv13 FOREIGN KEY (season_id) REFERENCES season(season_id);


--
-- Name: tvshow fkfxckceqhncuslekx8lh9xxd8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow
    ADD CONSTRAINT fkfxckceqhncuslekx8lh9xxd8e FOREIGN KEY (show_id) REFERENCES media(id_media);


--
-- Name: episode fkh0adfixdr7wjhjbiv4uhscmlh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT fkh0adfixdr7wjhjbiv4uhscmlh FOREIGN KEY (episode_id) REFERENCES media(id_media);


--
-- Name: user_has_media fkkjctrihxyolw3m317viaoty1s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_has_media
    ADD CONSTRAINT fkkjctrihxyolw3m317viaoty1s FOREIGN KEY (media_id_media) REFERENCES media(id_media);


--
-- Name: season_episode fkkoskkbnp7413yuhlhgwtyar09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season_episode
    ADD CONSTRAINT fkkoskkbnp7413yuhlhgwtyar09 FOREIGN KEY (season_id) REFERENCES season(season_id);


--
-- Name: movie fklj38y3jdywoi2wdrs591voalf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT fklj38y3jdywoi2wdrs591voalf FOREIGN KEY (id_media) REFERENCES media(id_media);


--
-- Name: tvshow_season fkplc0idqv4ybpe0xpxcg4442m4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow_season
    ADD CONSTRAINT fkplc0idqv4ybpe0xpxcg4442m4 FOREIGN KEY (show_id) REFERENCES tvshow(show_id);


--
-- Name: user_has_media fkreet1ch8scisxq01s99haabae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_has_media
    ADD CONSTRAINT fkreet1ch8scisxq01s99haabae FOREIGN KEY (usertr_id_user) REFERENCES usertr(id_user);


--
-- Name: season_episode fkv175f1oq7una44hxjxppscbs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season_episode
    ADD CONSTRAINT fkv175f1oq7una44hxjxppscbs FOREIGN KEY (episode_id) REFERENCES episode(episode_id);


--
-- PostgreSQL database dump complete
--

