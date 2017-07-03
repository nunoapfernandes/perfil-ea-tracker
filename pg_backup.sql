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
    imdb character varying(255),
    number integer,
    runtime integer,
    season_id integer,
    episode_id integer NOT NULL
);


ALTER TABLE episode OWNER TO postgres;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE episode_episode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE episode_episode_id_seq OWNER TO postgres;

--
-- Name: episode_episode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE episode_episode_id_seq OWNED BY episode.episode_id;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genre (
    id_genre integer NOT NULL,
    genre character varying(255)
);


ALTER TABLE genre OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

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
-- Name: media_genre_medias_id_media_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_genre_medias_id_media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_genre_medias_id_media_seq OWNER TO postgres;

--
-- Name: media_genre_medias_id_media_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_genre_medias_id_media_seq OWNED BY media_genre.medias_id_media;


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
-- Name: movie_id_media_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_id_media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movie_id_media_seq OWNER TO postgres;

--
-- Name: movie_id_media_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_id_media_seq OWNED BY movie.id_media;


--
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE season (
    aired_episodes integer,
    episodes integer,
    number integer,
    season_id integer NOT NULL,
    show_id integer NOT NULL
);


ALTER TABLE season OWNER TO postgres;

--
-- Name: season_season_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE season_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE season_season_id_seq OWNER TO postgres;

--
-- Name: season_season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE season_season_id_seq OWNED BY season.season_id;


--
-- Name: season_show_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE season_show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE season_show_id_seq OWNER TO postgres;

--
-- Name: season_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE season_show_id_seq OWNED BY season.show_id;


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
    slug character varying(255),
    status character varying(255),
    trailer character varying(255),
    show_id integer NOT NULL
);


ALTER TABLE tvshow OWNER TO postgres;

--
-- Name: tvshow_show_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tvshow_show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tvshow_show_id_seq OWNER TO postgres;

--
-- Name: tvshow_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tvshow_show_id_seq OWNED BY tvshow.show_id;


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
-- Name: user_has_media_media_id_media_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_has_media_media_id_media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_has_media_media_id_media_seq OWNER TO postgres;

--
-- Name: user_has_media_media_id_media_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_has_media_media_id_media_seq OWNED BY user_has_media.media_id_media;


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
-- Name: episode episode_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY episode ALTER COLUMN episode_id SET DEFAULT nextval('episode_episode_id_seq'::regclass);


--
-- Name: media id_media; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media ALTER COLUMN id_media SET DEFAULT nextval('media_id_media_seq'::regclass);


--
-- Name: media_genre medias_id_media; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_genre ALTER COLUMN medias_id_media SET DEFAULT nextval('media_genre_medias_id_media_seq'::regclass);


--
-- Name: movie id_media; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie ALTER COLUMN id_media SET DEFAULT nextval('movie_id_media_seq'::regclass);


--
-- Name: season season_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season ALTER COLUMN season_id SET DEFAULT nextval('season_season_id_seq'::regclass);


--
-- Name: season show_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season ALTER COLUMN show_id SET DEFAULT nextval('season_show_id_seq'::regclass);


--
-- Name: tvshow show_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tvshow ALTER COLUMN show_id SET DEFAULT nextval('tvshow_show_id_seq'::regclass);


--
-- Name: user_has_media media_id_media; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_has_media ALTER COLUMN media_id_media SET DEFAULT nextval('user_has_media_media_id_media_seq'::regclass);


--
-- Name: usertr id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertr ALTER COLUMN id_user SET DEFAULT nextval('usertr_id_user_seq'::regclass);


--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY episode (imdb, number, runtime, season_id, episode_id) FROM stdin;
tt1480055	1	61	2	3
tt1668746	2	55	2	4
tt1829962	3	57	2	5
tt1829963	4	55	2	6
tt1829964	5	54	2	7
tt1837862	6	52	2	8
tt1837863	7	57	2	9
tt1837864	8	58	2	10
tt1851398	9	56	2	11
tt1851397	10	52	2	12
tt1971833	1	52	13	14
tt2069318	2	53	13	15
tt2070135	3	52	13	16
tt2069319	4	50	13	17
tt2074658	5	54	13	18
tt2085238	6	54	13	19
tt2085239	7	55	13	20
tt2085240	8	53	13	21
tt2084342	9	54	13	22
tt2112510	10	63	13	23
tt2178782	1	54	24	25
tt2178772	2	57	24	26
tt2178802	3	52	24	27
tt2178798	4	53	24	28
tt2178788	5	57	24	29
tt2178812	6	53	24	30
tt2178814	7	57	24	31
tt2178806	8	56	24	32
tt2178784	9	50	24	33
tt2178796	10	62	24	34
tt2816136	1	58	35	36
tt2832378	2	52	35	37
tt2972426	3	56	35	38
tt2972428	4	55	35	39
tt3060856	5	53	35	40
tt3060910	6	50	35	41
tt3060876	7	51	35	42
tt3060782	8	52	35	43
tt3060858	9	50	35	44
tt3060860	10	65	35	45
tt3658012	1	59	46	47
tt3846626	2	63	46	48
tt3866836	3	66	46	49
tt3866838	4	57	46	50
tt3866840	5	64	46	51
tt3866842	6	62	46	52
tt3866846	7	66	46	53
tt3866850	8	69	46	54
tt3866826	9	63	46	55
tt3866862	10	72	46	56
tt3658014	1	59	57	58
tt4077554	2	62	57	59
tt4131606	3	60	57	60
tt4283016	4	68	57	61
tt4283028	5	67	57	62
tt4283054	6	60	57	63
tt4283060	7	58	57	64
tt4283074	8	66	57	65
tt4283088	9	69	57	66
tt4283094	10	81	57	67
tt5654088	1	55	68	69
tt5655178	2	55	68	70
tt5775840	3	55	68	71
tt5775846	4	55	68	72
tt5775854	5	55	68	73
tt5775864	6	55	68	74
tt5775874	7	55	68	75
tt0562992	1	44	77	78
\N	2	44	77	79
\N	3	44	77	80
\N	4	45	77	81
\N	5	43	77	82
\N	6	45	77	83
\N	7	44	77	84
\N	8	42	77	85
\N	9	41	77	86
\N	10	42	77	87
\N	11	43	77	88
\N	12	42	77	89
\N	13	45	77	90
\N	1	44	91	92
\N	2	44	91	93
\N	3	44	91	94
\N	4	44	91	95
\N	5	46	91	96
\N	6	45	91	97
\N	7	45	91	98
\N	8	45	91	99
\N	9	47	91	100
\N	10	45	91	101
\N	11	43	91	102
\N	12	43	91	103
\N	13	46	91	104
\N	1	44	105	106
\N	2	45	105	107
\N	3	45	105	108
\N	4	46	105	109
\N	5	46	105	110
\N	6	43	105	111
\N	7	45	105	112
\N	8	45	105	113
\N	9	43	105	114
\N	10	43	105	115
\N	11	45	105	116
\N	12	46	105	117
\N	13	46	105	118
\N	1	48	119	120
\N	2	48	119	121
\N	3	43	119	122
\N	4	44	119	123
\N	5	44	119	124
\N	6	45	119	125
\N	7	45	119	126
\N	8	43	119	127
\N	9	45	119	128
\N	10	44	119	129
\N	11	49	119	130
\N	12	45	119	131
\N	13	63	119	132
\N	1	64	133	134
\N	2	42	133	135
\N	3	42	133	136
\N	4	41	133	137
\N	5	42	133	138
\N	6	48	133	139
\N	7	44	133	140
\N	8	43	133	141
\N	9	46	133	142
\N	10	46	133	143
\N	11	42	133	144
\N	12	48	133	145
\N	13	53	133	146
tt1723888	1	43	147	148
tt1723889	2	46	147	149
tt1721225	3	44	147	150
tt1721226	4	45	147	151
tt1777783	5	43	147	152
tt1777782	6	45	147	153
tt1777781	7	48	147	154
tt1795142	8	48	147	155
tt1795143	9	42	147	156
tt1795139	10	46	147	157
tt1795140	11	48	147	158
tt1795141	12	45	147	159
tt1824359	13	45	147	160
tt2402301	1	48	161	162
\N	2	45	161	163
tt2340501	3	44	161	164
\N	4	41	161	165
\N	5	44	161	166
\N	6	45	161	167
\N	7	43	161	168
\N	8	41	161	169
\N	9	44	161	170
\N	10	44	161	171
\N	11	44	161	172
\N	12	44	161	173
\N	13	44	161	174
tt3469416	1	76	175	176
tt3737226	2	47	175	177
tt3714112	3	46	175	178
tt3745430	4	47	175	179
tt3845940	5	45	175	180
tt3845938	6	45	175	181
tt3787384	7	46	175	182
tt3787400	8	49	175	183
tt3834038	9	44	175	184
tt3834040	10	45	175	185
tt3834042	11	47	175	186
tt3834044	12	57	175	187
tt4289846	1	46	188	189
tt4464958	2	47	188	190
tt4483506	3	43	188	191
tt4483520	4	42	188	192
tt4507160	5	50	188	193
tt4545140	6	50	188	194
tt4652840	7	45	188	195
tt4652846	8	46	188	196
tt4787004	9	45	188	197
tt4701538	10	50	188	198
tt4701542	11	55	188	199
tt4701544	12	60	188	200
tt5848216	1	50	201	202
tt5985750	2	45	201	203
tt5985752	3	44	201	204
tt5985754	4	44	201	205
tt6250146	5	44	201	206
tt6340130	6	48	201	207
tt6336800	7	46	201	208
tt6333372	8	44	201	209
tt6340134	9	43	201	210
tt6250158	10	42	201	211
tt6340138	11	45	201	212
tt6340142	12	60	201	213
tt3326028	1	58	215	216
tt3378490	2	60	215	217
tt3425172	3	58	215	218
tt3425174	4	54	215	219
tt3502494	5	60	215	220
tt3566840	6	61	215	221
tt3566844	7	61	215	222
tt3566848	8	59	215	223
tt3797264	1	63	224	225
tt4071518	2	60	224	226
tt4054704	3	62	224	227
tt4109822	4	61	224	228
tt4172972	5	61	224	229
tt4172976	6	61	224	230
tt4172978	7	60	224	231
tt4178826	8	62	224	232
tt4172990	9	62	224	233
tt3878560	10	89	224	234
tt4765182	1	58	235	236
tt5009086	2	56	235	237
tt5100842	3	58	235	238
tt5022436	4	53	235	239
tt5162328	5	58	235	240
tt5165300	6	58	235	241
tt5273862	7	57	235	242
tt5297122	8	58	235	243
tt5297144	9	58	235	244
tt5001840	10	58	235	245
tt5895810	1	60	246	247
tt5977724	2	60	246	248
tt5977750	3	60	246	249
tt6006284	4	60	246	250
tt6006288	5	60	246	251
tt6007454	6	60	246	252
tt6007456	7	60	246	253
tt6007462	8	60	246	254
tt6007464	9	60	246	255
tt5934364	10	60	246	256
tt2400770	1	51	258	259
tt2431596	2	51	258	260
tt2451520	3	56	258	261
tt2577286	4	54	258	262
tt2511030	5	54	258	263
tt2511028	6	56	258	264
tt2595996	7	56	258	265
tt2620550	8	58	258	266
tt2640490	9	58	258	267
tt2692410	10	53	258	268
tt2739642	11	58	258	269
tt2754710	12	59	258	270
tt2754708	13	60	258	271
tt3015084	1	56	272	273
tt3099720	2	55	272	274
tt3262412	3	59	272	275
tt3262414	4	59	272	276
tt3262416	5	51	272	277
tt3262410	6	59	272	278
tt3262424	7	52	272	279
tt3262418	8	57	272	280
tt3262426	9	59	272	281
tt3262428	10	59	272	282
tt3262420	11	57	272	283
tt3262422	12	59	272	284
tt3262434	13	92	272	285
tt3713502	1	52	286	287
tt3807516	2	57	286	288
tt3807522	3	55	286	289
tt3807518	4	58	286	290
tt3807524	5	58	286	291
tt3807528	6	53	286	292
tt3807532	7	59	286	293
tt3807534	8	58	286	294
tt3807526	9	53	286	295
tt3807546	10	59	286	296
tt3807540	11	59	286	297
tt3807544	12	59	286	298
tt3807538	13	89	286	299
tt4645280	1	53	300	301
tt4800062	2	59	300	302
tt4848198	3	56	300	303
tt4943588	4	59	300	304
tt4964764	5	57	300	305
tt4955850	6	58	300	306
tt4982080	7	57	300	307
tt5208156	8	58	300	308
tt5197318	9	56	300	309
tt5208192	10	59	300	310
tt5188388	11	59	300	311
tt5193130	12	59	300	312
tt5193132	13	76	300	313
tt5440228	1	60	314	315
tt6007580	2	60	314	316
tt5949054	3	60	314	317
tt5948520	4	60	314	318
tt5974194	5	60	314	319
tt6007582	6	60	314	320
tt6007584	7	60	314	321
tt6007588	8	60	314	322
tt6007596	9	60	314	323
tt6007600	10	60	314	324
tt6007602	11	60	314	325
tt6007608	12	60	314	326
tt5842030	13	60	314	327
tt5017734	1	65	329	330
tt5062946	2	61	329	331
tt5280330	3	61	329	332
tt5665566	4	61	329	333
tt5665572	5	58	329	334
tt5665580	6	54	329	335
tt5665584	7	54	329	336
tt5017740	8	62	329	337
tt2161930	1	55	339	340
tt2250466	2	50	339	341
tt2248444	3	51	339	342
tt2248422	4	48	339	343
tt2294870	5	52	339	344
tt2311910	6	50	339	345
tt2311926	7	54	339	346
tt2312714	8	47	339	347
tt2248426	9	52	339	348
tt2468204	10	52	339	349
tt2440660	11	54	339	350
tt2555986	12	53	339	351
tt2555988	13	50	339	352
tt2811510	1	50	353	354
tt3221190	2	49	353	355
tt2990016	3	51	353	356
tt3001906	4	48	353	357
tt3001926	5	49	353	358
tt3221232	6	52	353	359
tt3147682	7	48	353	360
tt3147690	8	47	353	361
tt3186026	9	49	353	362
tt3221270	10	51	353	363
tt3297502	11	54	353	364
tt3326204	12	47	353	365
tt3326208	13	60	353	366
tt3513862	1	59	367	368
tt3892086	2	55	367	369
tt3892088	3	53	367	370
tt3892094	4	47	367	371
tt3897442	5	52	367	372
tt3897454	6	54	367	373
tt3918768	7	53	367	374
tt4083028	8	44	367	375
tt4035250	9	52	367	376
tt4128566	10	57	367	377
tt4128572	11	53	367	378
tt4128574	12	49	367	379
tt4221826	13	58	367	380
tt4498368	1	49	381	382
tt4817660	2	42	381	383
tt4817664	3	54	381	384
tt4817670	4	43	381	385
tt4949018	5	48	381	386
tt4949028	6	48	381	387
tt5025272	7	52	381	388
tt5095720	8	47	381	389
tt5083704	9	46	381	390
tt5095730	10	57	381	391
tt5095732	11	52	381	392
tt5095742	12	47	381	393
tt5095748	13	55	381	394
tt5419058	1	50	395	396
tt5965956	2	50	395	397
tt6010608	3	50	395	398
tt6059620	4	50	395	399
tt6110792	5	50	395	400
tt6411836	6	50	395	401
tt6411844	7	50	395	402
tt6411838	8	50	395	403
tt6411842	9	50	395	404
tt6411846	10	50	395	405
tt6411854	11	50	395	406
tt6411858	12	50	395	407
tt6411862	13	50	395	408
tt4417020	1	64	410	411
tt4559272	2	43	410	412
tt4559274	3	48	410	413
tt4559276	4	46	410	414
tt4559278	5	45	410	415
tt4549106	6	51	410	416
tt4549108	1	42	417	418
tt4897130	2	44	417	419
tt5218334	3	42	417	420
tt5218358	4	44	417	421
tt5218374	5	42	417	422
tt5218388	6	44	417	423
tt5218406	7	43	417	424
tt5218418	8	44	417	425
tt5218430	9	45	417	426
tt5218442	10	43	417	427
tt5218450	11	43	417	428
tt5218460	12	42	417	429
tt5218470	13	40	417	430
tt5218476	14	42	417	431
tt4959800	15	45	417	432
tt5646582	1	47	433	434
tt6082748	2	48	433	435
tt6082752	3	43	433	436
tt6082756	4	43	433	437
tt6094030	5	43	433	438
tt6094034	6	45	433	439
tt6094038	7	45	433	440
\N	8	45	433	441
tt4174892	1	44	443	444
tt4193934	2	44	443	445
tt4370532	3	43	443	446
tt4381250	4	43	443	447
tt4366194	5	43	443	448
tt4381252	6	44	443	449
tt4381256	7	44	443	450
tt4381258	8	43	443	451
tt4381262	9	43	443	452
tt4381264	10	44	443	453
tt4381266	11	43	443	454
tt4381270	12	44	443	455
tt4381274	13	44	443	456
tt4991616	1	43	457	458
tt5498998	2	43	457	459
tt5499018	3	43	457	460
tt5499022	4	43	457	461
tt5574158	5	43	457	462
tt5706306	6	43	457	463
tt5770094	7	43	457	464
tt5578258	8	43	457	465
tt5564402	9	43	457	466
tt5872980	10	43	457	467
tt5716584	11	43	457	468
tt5846742	12	43	457	469
tt5718584	13	43	457	470
tt6072918	1	43	471	472
tt6072926	2	43	471	473
tt6072928	3	43	471	474
tt6072914	4	43	471	475
tt6072924	5	43	471	476
tt6072930	6	45	471	477
\N	7	45	471	478
\N	8	45	471	479
\N	9	45	471	480
\N	10	45	471	481
\N	11	45	471	482
\N	12	45	471	483
\N	13	45	471	484
tt2510426	1	44	486	487
tt2580386	2	44	486	488
tt2639284	3	44	486	489
tt2545702	4	44	486	490
tt2639288	5	44	486	491
tt2639290	6	44	486	492
tt2639292	7	44	486	493
tt2639296	8	44	486	494
tt2639302	9	44	486	495
tt2639304	10	44	486	496
tt2922240	1	43	497	498
tt3314556	2	43	497	499
tt3314576	3	43	497	500
tt3360108	4	43	497	501
tt3360114	5	43	497	502
tt3360112	6	43	497	503
tt3360118	7	43	497	504
tt3360120	8	43	497	505
tt3360126	9	43	497	506
tt3360124	10	43	497	507
tt3859370	1	44	508	509
tt4277160	2	45	508	510
tt4277162	3	44	508	511
tt4226074	4	44	508	512
tt4277164	5	44	508	513
tt4277166	6	43	508	514
tt4277168	7	44	508	515
\N	8	44	508	516
\N	9	44	508	517
\N	10	45	508	518
tt4666106	1	43	519	520
tt5202896	2	43	519	521
tt5202902	3	43	519	522
tt5202900	4	43	519	523
tt5202898	5	43	519	524
tt5202904	6	43	519	525
tt5202906	7	43	519	526
tt5202908	8	43	519	527
tt5202910	9	44	519	528
tt5202912	10	46	519	529
tt5814630	1	42	530	531
tt6333012	2	42	530	532
tt6271006	3	42	530	533
tt6446452	4	42	530	534
tt6446456	5	45	530	535
tt6408790	6	45	530	536
tt6446458	7	45	530	537
tt6446462	8	45	530	538
tt6446460	9	45	530	539
tt6185992	10	45	530	540
tt3222784	1	29	542	543
tt3668816	2	28	542	544
tt3380250	3	28	542	545
tt3668330	4	28	542	546
tt3467892	5	28	542	547
tt3557356	6	28	542	548
tt3388032	7	28	542	549
tt3557358	8	28	542	550
tt3682540	1	30	551	552
tt3682600	2	27	551	553
tt3682606	3	29	551	554
tt3682586	4	30	551	555
tt3682590	5	29	551	556
tt3682592	6	30	551	557
tt3682588	7	29	551	558
tt3682604	8	28	551	559
tt4185454	9	30	551	560
tt4185460	10	28	551	561
tt4633480	1	32	562	563
tt5218398	2	30	562	564
tt5218400	3	30	562	565
tt5218414	4	31	562	566
tt5218422	5	31	562	567
tt5218484	6	30	562	568
tt5218490	7	30	562	569
tt5218496	8	30	562	570
tt5218498	9	31	562	571
tt5218514	10	31	562	572
tt5654084	1	31	573	574
tt6245460	2	30	573	575
tt6245462	3	31	573	576
tt6267504	4	30	573	577
tt6267506	5	31	573	578
tt6267508	6	31	573	579
tt5915160	7	31	573	580
tt6267510	8	30	573	581
tt6267512	9	31	573	582
tt6267514	10	31	573	583
\.


--
-- Name: episode_episode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('episode_episode_id_seq', 1, false);


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
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media (id_media, category, image_path, overview, rating, rating_trakt, released, title, tmdb) FROM stdin;
1	1	/gwPSoYUHAKmdyVywgLpKKA4BjRr.jpg	Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and the icy horrors beyond.	\N	9.37	2011-04-17 04:00:00	Game of Thrones	1399
2	1	/olJ6ivXxCMq3cfujo1IRw30OrsQ.jpg	\N	\N	9.16	2011-04-18 01:00:00	Season 1	1399
3	1	/wrGWeW4WKxnaeA8sxJb2T9O6ryo.jpg	Ned Stark, Lord of Winterfell learns that his mentor, Jon Arryn, has died and that King Robert is on his way north to offer Ned Arryn’s position as the King’s Hand. Across the Narrow Sea in Pentos, Viserys Targaryen plans to wed his sister Daenerys to the nomadic Dothraki warrior leader, Khal Drogo to forge an alliance to take the throne.	\N	8.18	2011-04-18 01:00:00	Winter Is Coming	1399
4	1	/icjOgl5F9DhysOEo6Six2Qfwcu2.jpg	Having agreed to become the King’s Hand, Ned leaves Winterfell with daughters Sansa and Arya, while Catelyn stays behind in Winterfell. Jon Snow heads north to join the brotherhood of the Night’s Watch. Tyrion decides to forego the trip south with his family, instead joining Jon in the entourage heading to the Wall. Viserys bides his time in hopes of winning back the throne, while Daenerys focuses her attention on learning how to please her new husband, Drogo.	\N	8.18	2011-04-25 01:00:00	The Kingsroad	1399
5	1	/4vCYVtIhiYSUry1lviA7CKPUB5Z.jpg	Arriving at King’s Landing, Ned is shocked to learn of the Crown’s profligacy from his new advisors. At Castle Black, Jon Snow impresses Tyrion at the expense of greener recruits. Suspecting the Lannisters had a hand in Bran’s fall, Catelyn covertly follows her husband to King’s Landing, where she is intercepted by Petyr Baelish, a.k.a. “Littlefinger,” a shrewd longtime ally and brothel owner. Cersei and Jaime ponder the implications of Bran’s recovery; Arya studies swordsmanship. On the road to Vaes Dothrak, Daenerys finds herself at odds with Viserys.	\N	8.12	2011-05-02 01:00:00	Lord Snow	1399
6	1	/a4tO7cgpv9IkatqAsv5k20zzlyi.jpg	Ned looks for clues to the death of his predecessor, and uncovers one of King Robert’s bastards. Robert and his guests witness a tournament honoring Ned. Jon takes measures to protect Sam from further abuse at Castle Black; a frustrated Viserys clashes with Daenerys in Vaes Dothrak; Sansa imagines her future as a queen, while Arya envisions a far different future. Catelyn rallies her husband’s allies to make a point, while Tyrion finds himself caught in the wrong place at the wrong time.	\N	8.17	2011-05-09 01:00:00	Cripples, Bastards, and Broken Things	1399
7	1	/qS3CHz3AKaC6WhlxQuEXPdrEPjg.jpg	Incensed over news of Daenerys’ alliance with the Dothrakis, Robert orders a preemptive strike on the Targaryens that drives a wedge in his relationship with Ned. A captive Tyrion helps Catelyn, but receives a cold reception at the Eyrie from her sister, Jon Arryn’s widow Lysa. Sansa is charmed by the dashing Ser Loras Tyrell, a.k.a. the Knight of Flowers. Arya overhears a plot against her father.	\N	8.19	2011-05-16 01:00:00	The Wolf and the Lion	1399
8	1	/AqtTrDIHKB6USFUUxLiIWJ6LTes.jpg	Reinstated as the Hand, Ned sits for the King while Robert is on a hunt. Ned issues a decree that could have long-term consequences throughout the Seven Kingdoms. At the Eyrie, Tyrion confesses to his "crimes," and demands that Lysa give him a trial by combat. Joffrey apologizes to Sansa. Viserys receives his final payment for Daenerys from Drogo.	\N	8.38	2011-05-23 01:00:00	A Golden Crown	1399
9	1	/l0d3WVs99QZPoxrOGuk21mV5NSp.jpg	Explaining that the future of the Lannisters is at stake, Tywin presses Jaime to “be the man you were meant to be” as they prepare for battle. Ned confronts Cersei about the secrets that killed Jon Arryn. With the fate of the missing Benjen very much on his mind, Jon takes his Night’s Watch vows, though not with the assignment he coveted. After Ser Jorah saves Daenerys from treachery, an enraged Drogo vows to lead the Dothraki where they’ve never gone before. An injured Robert takes pains to ensure an orderly transition at King’s Landing.	\N	8.36	2011-05-30 01:00:00	You Win or You Die	1399
10	1	/9ZvT1IZPcC11eiCByOzqQvC3CCR.jpg	In the aftermath of Ned's capture, Syrio and Arya face off against Lannister guards, while Cersei manipulates Sansa to her own ends. Robb rallies his father's northern allies against Tywin Lannister and heads south to war. Tyrion forms an uneasy alliance with the hill tribes and reunites with his father. Jon lashes out at Ser Alliser Thorne and battles a mysterious attacker from beyond the Wall. Dany is forced to reconcile her desire to conquer Westeros with Drogo's savagery after the Dothraki raid a peaceful village.	\N	8.21	2011-06-06 01:00:00	The Pointy End	1399
11	1	/41zQhAxoccalbhcd1udPIPJVTt1.jpg	With Sansa's life in danger, Ned makes a fateful decision. Catelyn brokers an unsavory deal with the slippery Walder Frey. Tyrion acquires a mistress and is forced by his father to fight on the front lines. Robb wins his first major victory and captures a prized prisoner. Jon is rewarded for his valor and discovers a dark secret about Maester Aemon. As Drogo's wound festers, Dany defies her bloodrider Qotho and puts her trust in the enslaved witch Mirri Maz Duur.	\N	8.45	2011-06-13 01:00:00	Baelor	1399
12	1	/88loh1qyi8vwJO8qH1SdQRsHKNI.jpg	As tragic news spreads across the Seven Kingdoms, Bran and Rickon share a prophetic dream, Catelyn interrogates Jamie about her son's fall, and Robb's destiny is forever changed. After a surprising decision by his father, Tyrion heads south. Arya assumes a new identity in an attempt to escape King's Landing, and Sansa is terrorized by Joffrey. At the Wall, Jon is forced to choose between the Night's Watch and the family he left behind. Across the sea, Dany pays a terrible price for her love, but finds new hope.	\N	8.68	2011-06-20 01:00:00	Fire and Blood	1399
13	1	/5tuhCkqPOT20XPwwi9NhFnC1g9R.jpg	\N	\N	9.12	2012-04-02 01:00:00	Season 2	1399
14	1	/psRgsLrTrEKS0YGuP1H3BCfhzhh.jpg	As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.	\N	8.24	2012-04-02 01:00:00	The North Remembers	1399
15	1	/8ywfRTCSZUSummwvKky7V4DZJru.jpg	In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.	\N	8.17	2012-04-09 01:00:00	The Night Lands	1399
16	1	/wjNzQfeb31KpKGuawX3JET8YexZ.jpg	At the Red Keep, Tyrion plots three alliances through the promise of marriage.  Catelyn arrives in the Stormlands to forge an alliance of her own, but King Renly, his new wife Margaery, and her brother Loras Tyrell have other plans.  At Winterfell, Luwin tries to decipher Bran’s dreams.	\N	8.19	2012-04-16 01:00:00	What is Dead May Never Die	1399
17	1	/4j2j97GFao2NX4uAtMbr0Qhx2K2.jpg	Joffrey punishes Sansa for Robb’s victories, and Tyrion scrambles to temper the king’s cruelty. Catelyn entreats Stannis and Renly to unite against the Lannisters. Dany and her khalasar arrive at the prosperous city of Qarth. Tyrion coerces a relative into being his eyes and ears. Arya and Gendry are taken to Harrenhal, where their lives are in the hands of Ser Gregor Clegane. Stannis orders Davos to smuggle Melisandre into a secret cove.	\N	8.18	2012-04-23 01:00:00	Garden of Bones	1399
18	1	/h7HHSQtEyf7cNBYR2G9DjQ78EgV.jpg	The Baratheon rivalry ends, driving Catelyn to flee and Littlefinger to act. At King’s Landing, Tyrion’s source alerts him to Joffrey’s defense plan - and a mysterious secret weapon. Theon sails to the Stony Shore to prove he’s worthy to be called Ironborn. At Harrenhal, Arya receives a promise from Jaqen H’ghar, one of the prisoners she saved from the Gold Cloaks. The Night’s Watch arrive at the Fist of the First Men, an ancient ringfort where they hope to stem the wildings' advance.	\N	8.19	2012-04-30 01:00:00	The Ghost of Harrenhal	1399
19	1	/o3tRgIZtnv1hAeBBZYxyBss8Xta.jpg	Theon completes his master stroke. In King's Landing, the Lannisters send Myrcella off to be married. Arya comes face to face with a surprise visitor. Dany vows to take what is hers. Robb and Catelyn receive crucial news. Qhorin gives Jon a chance to prove himself.	\N	8.24	2012-05-07 01:00:00	The Old Gods and the New	1399
20	1	/d7hTn2ltWb9RMXLycP1TSQTIPG8.jpg	Jamie meets a distant relative. Daenerys receives an invitation to the House of the Undying. Theon leads a search party. Jon loses his way in the wilderness. Cersei counsels Sansa.	\N	8.21	2012-05-14 01:00:00	A Man Without Honor	1399
21	1	/cDgJzu2sI4t8BnLGDKsQklv1aCA.jpg	Theon receives a visitor. Arya asks her third and last death from Jaqen. While Stannis' army is reaching its destination, Davos is offered a reward.  Betrayal befalls Robb.	\N	8.14	2012-05-21 01:00:00	The Prince of Winterfell	1399
22	1	/c3hoOyXyQpd7gK1eM6Rar1dTxzA.jpg	Tyrion and the Lannisters fight for their lives as Stannis’ fleet assaults King’s Landing.	\N	8.60	2012-05-28 01:00:00	Blackwater	1399
23	1	/u46jn12qEyaCOe1oqJBwPvL5d7R.jpg	Tyrion awakens to a changed situation. King Joffrey doles out rewards to his subjects. As Theon stirs his men to action, Luwin offers some final advice. Brienne silences Jaime. Arya receives a gift from Jaqen. Dany goes to a strange place. Jon proves himself to Qhorin.	\N	8.57	2012-06-04 01:00:00	Valar Morghulis	1399
24	1	/7d3vRgbmnrRQ39Qmzd66bQyY7Is.jpg	\N	\N	9.20	2013-04-01 01:00:00	Season 3	1399
25	1	/3ZerJvXQXcM3tygHRkPTDbbK0hw.jpg	Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King's Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.	\N	8.29	2013-04-01 01:00:00	Valar Dohaeris	1399
26	1	/o8yL7mNZenG9W8398AcfH7veRB4.jpg	Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.	\N	8.12	2013-04-08 01:00:00	Dark Wings, Dark Words	1399
27	1	/u2DZ4uvnM46KpAb2RPc5TM9tZJq.jpg	Tyrion shoulders new responsibilities. Jon is taken to the Fist of the First Men. Daenerys meets with the slavers. Jaime strikes a deal with his captors.	\N	8.22	2013-04-15 01:00:00	Walk of Punishment	1399
28	1	/jPlIqgPG2PQET2CMfz297Et0Fbb.jpg	Trouble brews among the Night's Watch at Craster's. Margaery takes Joffrey out of his comfort zone. Arya meets the leader of the Brotherhood. Varys plots revenge on an old foe. Theon mournfully recalls his missteps. Daenerys deftly orchestrates her exit from Astapor.	\N	8.67	2013-04-22 01:00:00	And Now His Watch Is Ended	1399
29	1	/d2b1CWsWCKMt5IpNXKgJfE4fjxj.jpg	The Hound is judged by the gods. Jaime is judged by men. Jon proves himself. Robb is betrayed. Tyrion learns the cost of weddings.	\N	8.20	2013-04-29 01:00:00	Kissed by Fire	1399
30	1	/a5ifsts2r9znJO1xQ1NnuYqdbM2.jpg	Tywin plans strategic unions for the Lannisters. Melisandre pays a visit to the Riverlands. Robb weighs a compromise to repair his alliance with House Frey. Roose Bolton decides what to do with Jaime Lannister. Jon, Ygritte, and the Wildlings face a daunting climb.	\N	8.16	2013-05-06 01:00:00	The Climb	1399
31	1	/27NIMz6XTGcZM0jsI1gk0BNjHvM.jpg	Daenerys exchanges gifts with a slave lord outside of Yunkai. As Sansa frets about her prospects, Shae chafes at Tyrion’s new situation. Tywin counsels the king, and Melisandre reveals a secret to Gendry. Brienne faces a formidable foe in Harrenhal.	\N	8.23	2013-05-13 01:00:00	The Bear and the Maiden Fair	1399
32	1	/m4Fs1dVNux8wgdSpLokaFHtmOCR.jpg	King’s Landing hosts a wedding, and Tyrion and Sansa spend the night together. Daenerys meets the Titan’s Bastard. Davos demands proof from Melisandre. Sam and Gilly meet an older gentleman.	\N	8.31	2013-05-20 01:00:00	Second Sons	1399
33	1	/27NyMAUv5Yfb3pyd3kFy9Ge7n8s.jpg	Robb presents himself to Walder Frey, and Edmure meets his bride. Jon faces his harshest test yet. Bran discovers a new gift. Daario and Jorah debate how to take Yunkai. House Frey joins with House Tully.	\N	8.82	2013-06-03 01:00:00	The Rains of Castamere	1399
34	1	/yeQwl3ZN8ZMqGvifMGWz2oCEPZ5.jpg	Joffrey challenges Tywin. Bran tells a ghost story. In Dragonstone, mercy comes from strange quarters. Daenerys waits to see if she is a conqueror or a liberator.	\N	8.46	2013-06-10 01:00:00	Mhysa	1399
35	1	/dniQ7zw3mbLJkd1U0gdFEh4b24O.jpg	\N	\N	9.18	2014-04-07 01:00:00	Season 4	1399
36	1	/5g2n9uGbEJKGn5SgO1se5kVoevR.jpg	Tyrion welcomes a surprise guest to King’s Landing for the royal wedding, but fears he’s come to the Red Keep for something else. Meanwhile, Jon warns his skeptical Night’s Watch superiors about an impending attack. Jaime struggles to regain his status at home. Arya encounters a face from her past, and Daario Naharis discusses strategy with Daenerys on the journey to the slave city Meereen.	\N	8.45	2014-04-07 01:00:00	Two Swords	1399
37	1	/fIyK75aaNngpbXLJWDEJYhwtzDj.jpg	A who’s who of honored guests turns out for Joffrey and Margaery’s wedding in King’s Landing, but the king’s taste in entertainment rubs many of them the wrong way. Meanwhile, Bronn gives a lesson to an unlikely pupil; Bran’s vision helps map out his journey; Stannis loses patience with Davos; and Ramsay takes a perverse delight in his new pet.	\N	8.80	2014-04-14 01:00:00	The Lion and the Rose	1399
63	1	/k01MUth8Xm2y79nvsQ3UF25SN9w.jpg	An old foe comes back into the picture. Gilly meets Sam’s family. Arya faces a difficult choice. Jaime faces off against the High Sparrow.	\N	8.07	2016-05-30 01:00:00	Blood of My Blood	1399
38	1	/pgwGxEDIv1XyB5TcJcJM7EMLWiX.jpg	In the frenzied aftermath of the royal wedding, Tyrion gets a visit from a loyal subject, but wonders if anyone in his family will help him out of his current predicament. Meanwhile, Tywin offers to work for the common good with a presumed enemy. Sam takes stock of the personnel at Castle Black. The Hound gives another life lesson to Arya, and Daenerys makes a decision outside the walls of Meereen.	\N	8.35	2014-04-21 01:00:00	Breaker of Chains	1399
39	1	/2h2dtlA6U0Imc3VSq5YlpAif9Qz.jpg	Jon welcomes volunteers. Bran, Jojen, Meera and Hodor seek shelter. Jaime and Brienne discuss his honor. Daenerys balances justice and mercy.	\N	8.21	2014-04-28 01:00:00	Oathkeeper	1399
40	1	/AakvWcPHDwrEML6mwvz4I0hzp3l.jpg	Jon starts a new mission. Cersei and Tywin consider the next move for the Crown. Daenerys makes plans for the future after hearing the latest news from King's Landing. Lord Baelish and Sansa reach their destination.	\N	8.10	2014-05-05 01:00:00	First of His Name	1399
41	1	/vKt9b7HNYhwM91C7S53zPsAWfT3.jpg	Tyrion faces his father in the throne room. Stannis and Davos put their faith in a new strategy. Daenerys' sphere of influence expands.	\N	8.59	2014-05-12 01:00:00	The Laws of Gods and Men	1399
42	1	/r7u0uELPyDkNnBZzAFVvw1XJKo5.jpg	Tyrion gains an unlikely ally. Daario asks Daenerys to allow him to do what he does best. Jon's warnings about the vulnerability of the Wall are ignored. Brienne follows a new lead. Arya and The Hound come across Rorge. Sansa discovers Littlefinger's true intentions for The Eyrie.	\N	8.42	2014-05-19 01:00:00	Mockingbird	1399
43	1	/B5ttTcMjq7YzgKcCzhb6ggJT03.jpg	Unexpected visitors arrive in Mole's Town. Sam questions his decision regarding Gilly. Littlefinger's motives are questioned. Sansa is interrogated by Lord Royce. Arya and The Hound arrive at the Bloody Gate. Ramsay tries to prove himself to his father. Tyrion's fate is decided.	\N	8.68	2014-06-02 01:00:00	The Mountain and the Viper	1399
44	1	/90jIL7o1zVMWNiXUUFDQnisgEq7.jpg	The Night's Watch attempts to defend Castle Black against Mance Rayder's massive wildling army, who plan to siege the fortress from the north, while a secret garrison of wildlings, including Ygritte, are poised to launch a surprise attack from the south.	\N	8.51	2014-06-09 01:00:00	The Watchers on the Wall	1399
45	1	/qi538fri8dTMMUV0MS1MSrFgo48.jpg	Circumstances change after an unexpected arrival from north of the Wall. Daenerys must face harsh realities. Bran learns more about his destiny. Tyrion sees the truth about his situation.	\N	8.71	2014-06-16 01:00:00	The Children	1399
46	1	/yKOltUHsp9X7dXWIm0hNGcIQa4G.jpg	The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.	\N	8.51	2015-04-13 01:00:00	Season 5	1399
47	1	/shIFxmFySt9CtGXMTXWBipsNOIs.jpg	Cersei and Jaime adjust to a world without Tywin; Varys reveals a conspiracy to Tyrion; Daenerys faces a new threat to her rule; Jon is caught between two kings.	\N	8.02	2015-04-13 01:00:00	The Wars to Come	1399
48	1	/pVTafj1pKhXh5aGZItOSDtgBZuc.jpg	Arya arrives in Braavos; Podrick and Brienne run into trouble on the road; Cersei fears for her daughter's safety in Dorne as Ellaria Sand seeks revenge for Oberyn's death. Stannis tempts Jon; an adviser tempts Daenerys.	\N	7.93	2015-04-20 01:00:00	The House of Black and White	1399
49	1	/5b6eUi2w12ao24ug8cL5QqJFKig.jpg	In Braavos, Arya sees the Many-Faced God; In King's Landing, Queen Margaery enjoys her new husband; Tyrion and Varys walk the Long Bridge of Volantis.	\N	7.88	2015-04-27 01:00:00	High Sparrow	1399
50	1	/eaHkOeGsaznmgru8z3ECiosZAAh.jpg	The Faith Militant grow increasingly aggressive. Jaime and Bronn head south. Ellaria and the Sand Snakes vow vengeance.	\N	7.97	2015-05-04 01:00:00	Sons of the Harpy	1399
51	1	/6OBLxmCseaeLwpKO9wN3oqPMDHQ.jpg	Daenerys makes a difficult decision in Meereen; Jon recruits the help of an unexpected ally; Brienne searches for Sansa; Theon remains under Ramsay’s control.	\N	7.89	2015-05-11 01:00:00	Kill the Boy	1399
52	1	/siGoOvAqTTyojNHpfR8wilIoBjf.jpg	Arya trains. Jorah and Tyrion run into slavers. Trystane and Myrcella make plans. Jaime and Bronn reach their destination. The Sand Snakes attack.	\N	7.67	2015-05-18 01:00:00	Unbowed, Unbent, Unbroken	1399
53	1	/3z3TxpfUwG7MWIXbx58zJNgxWg7.jpg	Jon prepares for conflict. Sansa tries to talk to Theon. Brienne waits for a sign. Stannis remains stubborn. Jaime attempts to reconnect with family.	\N	8.02	2015-05-25 01:00:00	The Gift	1399
54	1	/zIrSrXU4zOArlVYnXFxxfKDYYY2.jpg	Arya makes progress in her training. Sansa confronts an old friend. Cersei struggles. Jon travels.	\N	8.73	2015-06-01 01:00:00	Hardhome	1399
55	1	/j7oyJI76rmn83WrczewkiqO5hh6.jpg	Stannis confronts a troubling decision. Jon returns to The Wall. Mace visits the Iron Bank. Arya encounters someone from her past. Daenerys reluctantly oversees a traditional celebration of athleticism. 	\N	8.48	2015-06-08 01:00:00	The Dance of Dragons	1399
56	1	/b5dIepsIO3robQSe18fWmsQe37R.jpg	Stannis marches on Winterfell. With Daenerys missing, Meereen has to find a new custodian. Cersei seeks forgiveness for her sins. Jon deals with life back behind the wall.	\N	8.35	2015-06-15 01:00:00	Mother's Mercy	1399
57	1	/zvYrzLMfPIenxoq2jFY4eExbRv8.jpg	Nach den schockierenden Entwicklungen am Ende der fünften Staffel, einschließlich Jon Schnees blutigem Schicksal, Daenerys knapper Flucht aus der Arena von Mereen und Cerseis öffentlicher Demütigung in den Straßen von Königsmund, formieren sich die Überlebenden aus allen Teilen von Westeros und Essos neu, um unerbittlich ihrem ungewissen Schicksal nachzujagen. Altbekannte Figuren werden neue Allianzen schmieden, um ihre Überlebenschancen zu erhöhen, während neue Gesichter das Gleichgewicht der Mächte im Osten, Westen, Norden und Süden ins Wanken bringen.	\N	8.96	2016-04-25 01:00:00	Season 6	1399
58	1	/wUT1usesyneAJee4wzxxu6pfOKY.jpg	Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.	\N	8.06	2016-04-25 01:00:00	The Red Woman	1399
59	1	/9JlZ6sOXf4nodwWYvoM5zCJIGm9.jpg	Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton  proposes a plan, and Balon Greyjoy entertains other proposals.	\N	8.37	2016-05-02 01:00:00	Home	1399
60	1	/hTRefrtVbPvTP7xA1e0EjU5ioVf.jpg	Daenerys meets her future. Bran meets the past. Tommen confronts the High Sparrow. Arya trains to be No One. Varys finds an answer. Ramsay gets a gift.\n	\N	8.10	2016-05-09 01:00:00	Oathbreaker	1399
61	1	/ieuk4jZv1vFi8yxrGiL1wrtRT7P.jpg	Tyrion strikes a deal. Jorah and Daario undertake a difficult task. Jaime and Cersei try to improve their situation.	\N	8.39	2016-05-16 01:00:00	Book of the Stranger	1399
62	1	/rqPtGylElBAud1BBZpyOq7MQ6Ak.jpg	Tyrion seeks a strange ally. Bran learns a great deal. Brienne goes on a mission. Arya is given a chance to prove herself.	\N	8.49	2016-05-23 01:00:00	The Door	1399
64	1	/pGYURx0nKsYcSNrRpmnJ5BaHcKs.jpg	The High Sparrow eyes another target. Jaime confronts a hero. Arya makes a plan. The North is reminded.	\N	7.97	2016-06-06 01:00:00	The Broken Man	1399
65	1	/7CrDDELasQYT2gienzYAPRjYbL9.jpg	While Jaime weighs his options, Cersei answers a request. Tyrion’s plans bear fruit. Arya faces a new test.	\N	8.09	2016-06-13 01:00:00	No One	1399
66	1	/qb302fko45T0TvgsFa12IbSiq2P.jpg	Jon Snow and Ramsay Bolton battle for Winterfell. In Mereen Daenerys deals with old foes and new alliances.	\N	8.97	2016-06-20 01:00:00	Battle of the Bastards	1399
67	1	/m8vzoOKnjzFG8M5iprtweQEQzrW.jpg	Cercei and Loras are about to face their trial. In Winterfell Davos confronts Melisandre. Bran has another glimpse into the past. Daenery makes a decicion before leaving Mereen. \n\nAnd winter has come.	\N	8.90	2016-06-27 01:00:00	The Winds of Winter	1399
68	1	/19NPjmN6o3QGYfu8WnzgDSx75Ov.jpg	\N	\N	9.23	\N	Season 7	1399
69	1	\N	\N	\N	9.20	2017-07-17 01:00:00	TBA	1399
70	1	\N	\N	\N	7.67	2017-07-24 01:00:00	\N	1399
71	1	\N	\N	\N	7.86	2017-07-31 01:00:00	\N	1399
72	1	\N	\N	\N	7.57	2017-08-07 01:00:00	\N	1399
73	1	\N	\N	\N	8.20	2017-08-14 01:00:00	\N	1399
74	1	\N	\N	\N	8.50	2017-08-21 01:00:00	\N	1399
75	1	\N	\N	\N	8.50	2017-08-28 01:00:00	\N	1399
76	1	/cFcZYgPRFZdBkA7EsxHz5Cb8x5.jpg	The Doctor is an alien Time Lord from the planet Gallifrey who travels through all of time and space in his TARDIS. He has a long list of friends and companions who have shared journeys with him. Instead of dying, the Doctor is able to “regenerate” into a new body, taking on a new personality with each regeneration. Twelve actors, plus John Hurt, have played The Doctor thus far.	\N	9.04	2005-03-26 06:00:00	Doctor Who	57243
77	1	/9Jt2FFCAME7eHDC28r4qCHErhhF.jpg	\N	\N	8.22	2005-03-26 20:30:00	Season 1	57243
78	1	/irTDkbtPQ4aM9YQw1uEevzk5rSz.jpg	Location: London, England\nDate: 4th/5th/6th March 2005\nEnemy: Nestene Consciousness\n\nRose Tyler stumbles across a man called The Doctor as he seeks out the Nestene Consciousness, to prevent the living plastic it is controlling from taking over the world.	\N	7.68	2005-03-26 18:45:00	Rose	57243
79	1	/hg7IMOwTe5zV89CjcoOv0tJFZe6.jpg	Location: Platform 1 (A space station orbiting Earth)\nDate: 5,000,000,000 AD\nEnemy: The Lady Cassandra\n\nThe Doctor takes Rose on her first voyage through time: to the year five billion, when the Sun is about to expand and swallow the Earth. She is cautious and soon starts to question her reasons for joining The Doctor. But amongst the powerful alien races gathering to watch on Platform One, a murderer is at work. Who is controlling the mysterious and deadly metal spiders?	\N	7.81	2005-04-02 17:45:00	The End of the World	57243
80	1	/l3oSyFTBXYVSRMNXBEC2u40Jw60.jpg	Location: Cardiff, Wales\nDate: 24th December, 1869\nEnemy: The Gelth\n\nThe Doctor plans to take Rose back through time to Naples, 1860, but instead they arrive in Cardiff, 1869. In Victorian Cardiff, the dead are walking and creatures made of gas are on the loose. The time-travellers team up with Charles Dickens to investigate Mr Sneed, the local undertaker, who's hiding a very big secret. However, this time, The Doctor won't be able to save everyone.	\N	7.62	2005-04-09 17:45:00	The Unquiet Dead	57243
81	1	/cCmY8qKoI88FMuZaQ8GzYMQxDWt.jpg	Location: London, Earth\nDate: March, 2006\nEnemy: Slitheen\n\nThe  Doctor and Rose return to modern-day Earth, only to find it has been a year since Rose first set off, and everyone thought she was missing, presumed dead. Whilst there, a spaceship crashes into Big Ben and lands in the Thames. Soon, all is not as it seems with the residents of 10 Downing Street.	\N	7.55	2005-04-16 17:45:00	Aliens of London (1)	57243
82	1	/oMyzp40ovZV0OKOcMcLSoV0WMVV.jpg	Location: London, Earth\nDate: March, 2006\nEnemy: Slitheen\n\nWith the Doctor, Rose, and MP Harriet Jones trapped inside Downing Street, the Slitheen make their move: Nuclear Warfare. If the human race is obliterated, the Earth can be sold on the Galactic Black Market for a very reasonable price. It's up to the Doctor to defeat the Slitheen before the entire population of the Earth is wiped out. But will he have to make the ultimate sacrifice: Rose Tyler...?	\N	7.49	2005-04-23 17:45:00	World War Three (2)	57243
83	1	/go14P6iykl0fnkXVD4RXRI08Bk1.jpg	Location: Utah, Earth\nDate: 2012\nEnemy: Dalek\n\nThe Doctor and Rose find themselves in an underground museum in Utah in the year 2012. The museum houses all kinds of extra-terrestrial artefacts the only living exhibit being one of the Doctor's oldest enemies - a Dalek. But soon after, it escapes from its "torture chamber," and goes on a killing spree. Will Rose be one of the victims?	\N	8.26	2005-04-30 17:45:00	Dalek	57243
84	1	/fiGTKcv29xHiy5sjyW11k5RzNEN.jpg	Location: Satellite 5\nDate: 200,000\nEnemy: The Editor, Jagrafess\n\nThe Doctor, Rose and Adam arrive in the year 200,000 on a broadcasting station that transmits programming to Earth. But soon, trouble is afoot, when they discover that any worker promoted to a position on level 500 never returns. The Doctor and Rose attempt to find out what is happening, whilst Adam investigates part of the station himself, and makes a decision that he's going to regret for the rest of his life.	\N	7.75	2005-05-07 17:45:00	The Long Game	57243
85	1	/5PQa7xD2iL7BkBlF8JNZyCgWefI.jpg	Location: London, Earth\nDate: 1986\nEnemy: The Reapers\n\nRose requests a trip back to the day her father, Pete Tyler, died. Reluctantly, the Doctor agrees, but he realises he has made a mistake, when Rose saves Pete from being run over by a car. This has now changed the timeline, and Reapers are transposing themselves all over the Universe. However, this time, the Doctor doesn't have a plan…	\N	8.07	2005-05-14 17:45:00	Father's Day	57243
86	1	/4JwPlEI4qWbnQVX1TlZNlUAyHcB.jpg	Location: London, England\nDate: 1941\nEnemy: The Empty Child\n\nAfter chasing an unexplained capsule through time, the TARDIS lands in London, during an air raid. Rose investigates when a small child wearing a gasmask, standing on a rooftop, continuously calls out for his mummy. After floating above the city on a barrage balloon, Rose is swept off her feet by another time traveller – Captain Jack Harkness. Meanwhile, The Doctor follows a teenaged girl to a meeting of the homeless children of the Blitz. Here, the child in the gasmask is terrorising them with a parade of strange events, constantly asking for his mother.	\N	8.58	2005-05-21 17:45:00	The Empty Child (1)	57243
87	1	/yE8fusMqHwGHdCDi9lNMBuSYXUT.jpg	Location: London, England\nDate: 1941\nEnemy: The Empty Child, Nanogenes\n\nAfter narrowly escaping the gas mask monsters, The Doctor, Rose, and Captain Jack try to stop the mutated people from infecting other victims. But it soon becomes apparent that one of the group may indirectly responsible for the virus. The answer lies at the bomb site, but time is running out...	\N	8.57	2005-05-28 17:45:00	The Doctor Dances (2)	57243
121	1	/4WoJP6if8546yPrWjvJ3SBfHClg.jpg	Location: Pompeii\nDate: 23rd/24th August 79AD\nEnemies: Pyrovile \n\nThe Doctor takes Donna back to Pompeii, on the day of the eruption of Mt. Vesuvius, and is faced with a great moral dilemma. Should they warn the residents of the impending disaster, or let history take its natural course? 	\N	8.18	2008-04-12 17:45:00	The Fires of Pompeii	57243
88	1	/t9ossMxqe5WVBvGkaWA8ReO4Xnu.jpg	Location: Cardiff, Wales\nDate: 2006\nEnemy: Margaret Blaine (Blon Fel Fotch Pasameer-Day Slitheen)\n\nThe Doctor, Rose and Captain Jack stop off in present-day Cardiff to recharge the TARDIS on the Rift they formerly encountered in 1869. Whilst there, they come upon a since-thought-long-dead enemy of theirs, who is hatching yet another plan to destroy Earth.	\N	7.68	2005-06-04 17:45:00	Boom Town	57243
89	1	/wvKyXn0WGmR32KCsRaRPbKKzCW1.jpg	Location: The Gamestation (Satellite 5)\nDate: 200,100\nEnemy: The Games, The Daleks\n\nIn a seemingly futuristic world, the Doctor wakes up in the Big Brother house during an eviction, Rose wakes up on the Weakest Link with the Anne-Droid, and Captain Jack gets a make over with Trin-E and Zu-Zana. But something unusual is happening, and the losing contestants are being disintergrated. Obviously, it's time for the Doctor to investigate. There could be only one monster behind this - the Daleks!	\N	8.48	2005-06-11 17:45:00	Bad Wolf (1)	57243
90	1	/umvpeUdQ4WrkRq5YXWtwU7k0zDx.jpg	Location: The Gamestation (Satellite 5)\nDate: 200,100\nEnemy: Emperor Dalek, The Daleks\n\nThe fate of the Universe is hanging in the balance as the Dalek fleet begin their invasion of Earth. The Doctor must decide whether to sacrifice every human being on Earth in order to save every other living creature in the universe from the Daleks. Either way, he knows he must send Rose home...	\N	8.78	2005-06-18 17:45:00	The Parting of the Ways (2)	57243
91	1	/oXVmsIkZCgJDNcZJJxzvV7zwyb1.jpg	\N	\N	8.69	2006-04-15 19:30:00	Season 2	57243
92	1	/3CmzxNTL4Mk49r5kiYKpdoLGA5n.jpg	Location: New Earth\nDate: 5,000,000,023 \nEnemies: Lady Cassandra, The Flesh, Sisters of Plenitude \n\nIn the year five billion and twenty-three, after the destruction of the Earth, the Doctor takes Rose to the New Earth. There, in a hospital facility, the feline Sisters of Plenitude can mysteriously cure any diseases, but, in the basement, an old enemy of the Doctor is out for revenge.	\N	8.07	2006-04-15 17:45:00	New Earth	57243
93	1	/9950TrmEKVGquoYzAljQH3wFcdr.jpg	Location: Torchwood House, Scotland, Earth Date: 1879 \nEnemies: Werewolf, The Monks\n\nLanding in 1879, Scotland, the Tenth Doctor and Rose meet Queen Victoria, travelling with her to spend the night at the Torchwood Estate. However, a group of warrior monks have sinister plans for the monarch, and the full moon is about to summon a creature out of legend.	\N	8.00	2006-04-22 17:45:00	Tooth and Claw	57243
94	1	/5UzEq0sVHOfj2VOttLcRLUuaOzz.jpg	Location: Deffry Vale High School, London, England, Earth \nDate: 2007 \nEnemies: The Krillitanes \n\nThere are strange goings-on at a comprehensive school - UFOs, over-intelligent children, and odd-tasting school dinners. This attracts the attention of the Tenth Doctor, Rose and Mickey Smith, as well as a couple of old friends…	\N	8.01	2006-04-29 17:45:00	School Reunion	57243
95	1	/yN4GJf4cimPy6EMQh2pYPZp6ZhA.jpg	Location: Versailles, France, Earth and on S.S. Madame de Pompadour (a Spaceship)\nDate: Across the 18th Century and during the 51st Century\nEnemies: Clockwork Droids\n\nOn a seemingly abandoned spaceship in the 51st century, the Tenth Doctor, Rose and Mickey find time windows leading to 18th century France and a group of clockwork androids using them to stalk a young woman throughout her life.	\N	8.63	2006-05-06 17:45:00	The Girl in the Fireplace	57243
96	1	/sEIBy4vsUX03exTcs9atCc5zYQb.jpg	Location: Parallel Earth\nDate: 1st February, 2007\nEnemy: John Lumic, The Cybermen\n\nAfter the TARDIS makes a crash landing on the Earth of another universe, Rose discovers her father is alive and rich, Mickey encounters his alternative self, and the Tenth Doctor learns one of his oldest and deadliest foes is about to be reborn.	\N	7.94	2006-05-13 17:45:00	Rise of the Cybermen (1)	57243
97	1	/AmEiRzAHkjgnKwmWL9BD3K9m1Rs.jpg	Location: A parallel Earth\nDate: 1st/2nd February, 2007\nEnemy: John Lumic, Cyber-Controller, The Cybermen\n\nThe plans of John Lumic to convert the world into Cybermen are now in full force. The Tenth Doctor, Rose, Mickey and the Preachers must find a way to stop him from enforcing his "ultimate upgrade."	\N	8.04	2006-05-20 17:45:00	The Age of Steel (2)	57243
98	1	/cbCRy1RwRvrdLeocZa8RDERJxC5.jpg	Location: London, England, Earth\nDate: 1953 - Queen Elizabeth II's Coronation Enemy: The Wire \n\nIn 1953 London, the police are abducting people from their homes. The people of Britain gather around their new-fangled "tele-vision" sets to celebrate the new Queen's coronation - but something strange is affecting the signal.	\N	7.68	2006-05-27 17:45:00	The Idiot's Lantern	57243
99	1	/62ir7aFCD5Q5bpOslSB20VBywnx.jpg	Location: In orbit below a black hole\nDate: Possibly 43,000 (43K reference)\nEnemy: The Beast,The Ood (as The Legion of The Beast)\n\nRose finds herself further away from home than ever before, on a desolate world in the orbit of a Black Hole. Trapped with an Earth expedition and the mysterious Ood, the time-travellers face an even greater danger as something ancient beneath the planet's surface begins to awake.	\N	8.41	2006-06-03 17:45:00	The Impossible Planet (1)	57243
100	1	/AhLxY9rJO5S1VfTX9KCQSiM0x1g.jpg	Location: In orbit below a black hole\nDate: Possibly 43,000 (43K reference)\nEnemy: The Beast,The Ood (as The Legion of The Beast)\n\nThe TARDIS lands in a base on a planet orbiting a black hole, an impossible situation that stumps even the Tenth Doctor. The base crew are drilling to the centre of the world, to claim the power that keeps it in orbit for themselves. However, an ancient evil is down there too, and he is awake…	\N	8.57	2006-06-10 17:45:00	The Satan Pit (2)	57243
101	1	/pQd4lnSCbvXgcG1EYikz7lYEXx7.jpg	Location: London, Earth\nDate: 2007\nEnemy: The Abzorbaloff \n\nAn ordinary man named Elton Pope becomes obsessed with the Tenth Doctor, Rose and their strange blue box, joining a group of like-minded people in hopes of finding him. But when the mysterious Victor Kennedy joins the group, the fun soon stops and Elton discovers a darker side to his hobby.	\N	6.96	2006-06-17 17:45:00	Love and Monsters	57243
102	1	/ohSCkAMSXvkY18iBovaZ4VF7dHH.jpg	Location: Earth\nDate: 2012\nEnemy: Chloe Webber/Isolas\n\nWhen the TARDIS lands in 2012, the Tenth Doctor plans to show Rose the London Olympics. However, ordinary children are vanishing into thin air, a mother living in a seemingly normal British household is trying to hide her daughter's unnatural powers from the world, and a demonic presence lurks in an upstairs cupboard.	\N	7.29	2006-06-24 17:45:00	Fear Her	57243
103	1	/5DE2tYGs1sjYqKK7T1dyXw7f5NS.jpg	Location: London, Torchwood Tower\nDate: 2007\nEnemies: Cybermen, Torchwood\n\nGhostly beings have been regularly appearing across the world and people, believing them to be their dead loved ones, are welcoming their visits with open arms. When the TARDIS arrives at the Torchwood Institute, the Tenth Doctor and Rose are taken prisoner. They are drawn into the investigation of a mysterious sphere kept in Torchwood Tower, and monstrous foes return as two universes collide.	\N	8.46	2006-07-01 17:45:00	Army of Ghosts (1)	57243
122	1	/pqzflnCz2QgRC2lUSfCSTofsZJ1.jpg	Location: Ood-Sphere\nDate: 4126\nEnemies: Mr. Halpen, Ood Operations \n\nThe Doctor and Donna find themselves on an icy planet known as the Ood-Sphere. There they discover what drove the Ood to be a servant race.	\N	8.10	2008-04-19 17:45:00	Planet of the Ood	57243
104	1	/wIotyoKHq7ldmeOa5FN62IMFt3d.jpg	Location: London, Torchwood Tower\nDate: 2007\nEnemies: Cybermen, Daleks\n\nHumanity is caught in the crossfire as the Cybermen and the Daleks wage war against each other. When the mysterious Genesis Ark opens, the Tenth Doctor is faced with an impossible decision: saving the world could mean losing Rose Tyler forever…	\N	9.05	2006-07-08 17:45:00	Doomsday (2)	57243
105	1	/67xbjSv353G2rqQIs6dnDKc6P11.jpg	\N	\N	8.55	2007-04-01 19:30:00	Season 3	57243
106	1	/SAtfIVeCbfpvhMOC7vY1A9z6D7.jpg	Location: Earth/Moon\nDate: 2008\nEnemies: Judoon, Plasmavore, Slabs \n\nTrainee doctor Martha Jones has her hands full balancing her medical studies with placating her demanding family. So the last thing she needs is to find that the hospital where she works has been transported to the moon, where it's invaded by an overbearing alien police force. There she encounters a patient called John Smith, who seems curiously at ease with the situation…	\N	8.10	2007-04-01 17:45:00	Smith and Jones	57243
107	1	/4PahAL07rbyiUhsgLW99qzi6y5d.jpg	Location: Earth\nDate: 1599\nEnemies: Carrionites\n\nMartha takes her first trip in the Tardis, all the way back to Elizabethan England. She and the Doctor hear of a series of bizarre deaths and discover that playwright William Shakespeare is being controlled by dangerous witch-like creatures. It seems the time-travelling duo must defeat ancient forces to prevent history from being rewritten.	\N	8.06	2007-04-07 17:45:00	The Shakespeare Code	57243
108	1	/ja8oZQszacBLr7sc1uceRIsPb49.jpg	Location: New Earth\nDate: The year 5,000,000,053\nEnemies: Macra\n\nThe Doctor takes Martha to New Earth, in the far future, only to find that an entire city has become a deadly trap.	\N	8.13	2007-04-14 17:45:00	Gridlock	57243
109	1	/yQFwHDE9sJOhkQPEkUSordnlVIq.jpg	Location: New York\nDate: 1930s\nEnemies: Daleks (Cult of Skaro), Pig Slaves\n\nThe Doctor investigates disappearances in New York at the height of the depression in the 1930s. Nefarious Pig Men linger in the sewers and the Daleks prepare an audacious plan at the top of the Empire State Building	\N	7.58	2007-04-21 17:45:00	Daleks in Manhattan (1)	57243
110	1	/cPTcmOlSep64XXsXv9YdcbLxIhb.jpg	Location: New York\nDate: 1930s\nEnemies: Daleks (Cult of Skaro), Pig Slaves\n\nThe newly-created Dalek-human hybrid, and the other three members of the Cult of Skaro launch an attack on Hooverville, along with their Pig Slaves. The Doctor, Martha, and Frank manage to escape, but discover that the Daleks' plan involving the Empire State Building...	\N	7.65	2007-04-28 17:45:00	Evolution of the Daleks (2)	57243
111	1	/bX9jXbbKOqMMbPpNCNudKtwF3C0.jpg	Location: London\nDate: 2008\nEnemy: Professor Lazarus\n\nIt looks as though Martha's odyssey is coming to an end when the Doctor drops her home, even landing the Tardis inside her lounge. But then a TV news report tickles the insatiable curiosity of our gallivanting Gallifreyan, and they're off again. So we're treated to the unusual sight of the Doc in a DJ as he escorts a glammed-up Martha to the launch of a scientific breakthrough: an eternal youth machine created by an elderly professor, Richard Lazarus. As with all weird science, the side effects are severe, but this is a very extreme case (and no, it's not suitable for tots). Doctor Who continues its game of spot the homage. Tonight's story is an enjoyable synthesis of She, The Fly and The Quatermass Experiment - even down to the final battle in a London cathedral. But despite some charming interplay between the two leads and an excellent turn from Mark Gatiss as the young and old professor, The Lazarus Experiment is a pretty conventional runaround, though the nightmarish Identikit creature is superbly realised and dedicated Whovians can look out for a "reverse the polarity" reference.	\N	7.54	2007-05-05 17:45:00	The Lazarus Experiment	57243
112	1	/hLxBTqcxkbFhAa7RtK1M5XAKv92.jpg	Location: SS Pentallian \nDate: The 42nd century\nEnemies: Ashton\n\nIn a far-flung galaxy, saboteurs are at work, and crew members are being possessed. The TARDIS crew find themselves in the 42nd century on a spaceship, SS Pentallian, slowly being pulled into a sun, and must find a way to survive	\N	7.83	2007-05-19 17:45:00	42	57243
113	1	/8bXp7x8LqxUnmzDd9Tnb6pSh9t0.jpg	Location: A boys' boarding school \nDate: 1913 \nEnemies: The Family of Blood\n\nEngland, 1913. A schoolteacher called John Smith dreams of adventures in time and space. The Doctor, along with Martha, heads to a boarding school, but what he finds is far from ordinary...	\N	8.33	2007-05-26 17:45:00	Human Nature (1)	57243
114	1	/yd4ZXt6HpZw9ecancFH6aLk6331.jpg	Location: A boys' boarding school \nDate: 1913 \nEnemies: The Family of Blood \nEngland, 1913. A schoolteacher called John Smith dreams of adventures in time and space. The Doctor, along with Martha, heads to a boarding school, but what he finds is far from ordinary...\n\nConclusion.	\N	8.52	2007-06-02 17:45:00	The Family of Blood (2)	57243
115	1	/7nzpdhKR3hxcfWNjmAYy3eYJOPt.jpg	Location: Hull, London, England\nDate: 2007\nEnemies: The Weeping Angels\n\nSuggestion is a powerful weapon ...\n\nThe Doctor is lost in time and within the walls of an old, abandoned house, murder is afoot and the Weeping Angels await...\n\nA young woman called Sally visits a dilapidated house, and is led down a terrifying time-torn path.	\N	9.38	2007-06-09 17:45:00	Blink	57243
116	1	/hoFrmMRxyHTMI7QCvgRZ4OgdV3f.jpg	Location: Malcassairo\nDate: The Year 100 Trillion\nEnemies: Futurekind, The Master\n\nAfter being brought back to life in The Parting of the Ways, Captain Jack Harkness was just left on the Gamestation by the Doctor and Rose. In this episode, Captain Jack Harkness storms back into the Doctor's life, and the TARDIS is thrown to the end of the universe itself. 	\N	8.47	2007-06-16 17:45:00	Utopia (1)	57243
117	1	/4NiwidmFeLhNWMbCP0SrJLCDl1F.jpg	Location: London\nDate: 2008\nEnemies: The Master, the Toclafane\n\nHarry Saxon becomes Prime Minister and his reign of terror begins – but that's only the start of his ambitions, as he announces mankind's first contact with an alien race, the Toclafane. \n\nAn audacious plan spanning the whole of time and space begins to close around the Earth, in the penultimate episode of Russell T Davies's Doctor Who.	\N	8.56	2007-06-23 17:45:00	The Sound of Drums (2)	57243
118	1	/vXwspI0LtsTe6mn9cRpfmUpBAHr.jpg	Location: Earth, The Valiant\nDate: 2008, 2009\nEnemies: The Toclafane, The Master\n\nOne year has passed since the events of "The Sound of Drums." \n\nThe Earth has been conquered and its population enslaved, the Doctor is the Master's prisoner, and the warships of a new Time Lord Empire rise from the ashes. The fate of the world is in Martha Jones' hands.	\N	8.66	2007-06-30 17:45:00	Last of the Time Lords (3)	57243
119	1	/h6hogh9U371q87XLhvrJbczg8lm.jpg	\N	\N	8.88	2008-04-05 19:30:00	第 4 季	57243
120	1	/cq1zrCS267vGXa3rCYQkVKNJE9v.jpg	Location: London\nDate: 2009\nEnemies: Adipose, Miss Foster\n\nDuring an alien emergency in London, a woman called Donna Noble must search for an old friend who can save the day - a man named the Doctor. But can even the Doctor halt the plans of the mysterious Miss Foster?	\N	8.21	2008-04-05 17:45:00	Partners in Crime	57243
229	1	/g8qBm5ekQHT8POKU6j88oUlR0ox.jpg	Ghost and Tommy hustle to sell their product and pay Lobos; the FBI questions Holly.	\N	7.96	2015-07-12 01:00:00	Who You Are and Who You Want to Be	54650
123	1	/7nKSO79WS60wbECOD8iNASsEJwk.jpg	Location: Modern-day Earth\nDate: 2009\nEnemies: Sontarans \n\nAided by the Rattigan Academy, the Sontarans establish a covert base at the mysterious ATMOS Factory. Can the Doctor stop the Sontarans from unleashing a potent terror that will bring the world to its knees?	\N	7.89	2008-04-26 17:45:00	The Sontaran Stratagem (1)	57243
124	1	/o0OQByMgT3W9AzGg98HgBq9KkA.jpg	Location: Earth\nDate: 2009\nEnemies: The Sontarans\n\nThe Sontarans continue their evil plot and begin to "choke" the Earth. The Doctor and Donna, now teamed with Martha have to stop them! Can they save Earth before it's too late?	\N	8.04	2008-05-03 17:45:00	The Poison Sky (2)	57243
125	1	/tqqn9eTtZlSMe1Nng2qmduloOe0.jpg	Location: Messaline\nDate: 60120724 (New Byzantine Calendar)\nEnemies: The Hath\n\nThe Doctor lands on the remote planet Messaline as an age-old war rages and the threat of genocide looms. When Martha is kidnapped by the Hath, the Doctor is distracted by "the most important woman in his life."	\N	8.28	2008-05-10 17:45:00	The Doctor's Daughter	57243
126	1	/dvZeLZ08yzuJ3gE5sT7TmSWNq79.jpg	Location: England, Earth\nDate: December 3rd 1926\nEnemies: Vespiforms\n\nThe Doctor and Donna's meet Agatha Christie at a manor owned buy Lady Eddison. When Agatha Christie goes missing and a body turns up in the library the adventure turns into a pulp sci-fiction murder mystery, with a murder, a jewel thief, and a wasp alien. Can they solve the mystery?	\N	7.99	2008-05-17 17:45:00	The Unicorn and the Wasp	57243
127	1	/pA3KBOYK60cqJ6qkbeOBSSTUdGj.jpg	Location: The Library\nDate: 51st century\nEnemies: Vashta Nerada\n\nThe Doctor and Donna land in a frightening position in the far future. While investigating a derelict library, the duo come face to face with the disembodied mind of a little girl, an archaeological team led by a woman from the Doctor's future, and swarms of flesh-eating creatures that are seen only as shadows.	\N	8.80	2008-05-31 17:45:00	Silence in the Library (1)	57243
128	1	/4t21hQqK2bqlKu0zoNaFPgNlplz.jpg	Location: The Library\nDate: 51st Century\nEnemies: Vashta Nerada\n\nThe Doctor and Donna land in a frightening position in the far future. While investigating a derelict library, the duo come face to face with the disembodied mind of a little girl, an archaeological team led by a woman from the Doctor's future, and swarms of flesh-eating creatures that are seen only as shadows	\N	8.99	2008-06-07 17:45:00	Forest of the Dead (2)	57243
129	1	/kPxhdqzj8vuhh36QfDLbENbgPVb.jpg	Location: Planet Midnight\nDate: unknown\nEnemies: unknown - possessive creature\n\nWhile visiting the planet Midnight, a beautiful and luxury planet, full of lavishs and hightech cities, a terrifying problem arises that leaves The Doctor powerless.	\N	8.49	2008-06-14 17:45:00	Midnight	57243
130	1	/etMTaIloNsHhSqDkqV66tLnJ8Z0.jpg	Location: Earth\nDate: 2007/2008/2009\nEnemies: Member of the Trickster's Brigade\n\nWhilst attending a carnival on the Chino-planet of Shan Shen, Donna is cajoled into having her fortune read, where her past is carefully examined. With the Doctor missing, Donna must work with Rose, a traveller from a parallel universe, to prevent darkness encompassing the whole of the universe. 	\N	8.81	2008-06-21 17:45:00	Turn Left	57243
131	1	/AsL6ph9Ouk7zSp4OlHB8Vx06v4V.jpg	Location: Earth, The Medusa Cascade, The Shadow Proclamation\nDate: 2009\nEnemies: The Daleks and Davros\n\nThe Earth has been moved, and it's a race against time as Donna and the Doctor try to find it before the Daleks destroy everything; they head for the Shadow Proclamation and the Medusa Cascade. Meanwhile on Earth a veritable bevy of ex-companions join together to contact the Doctor and take down the Daleks. Can Captain Jack, Sarah-Jane, Martha Jones and Rose find the Doctor in time... 	\N	8.88	2008-06-28 17:45:00	The Stolen Earth (1)	57243
132	1	/di3ZK4886uAdvhgfjD0IB9Gwcr6.jpg	Location: The Dalek Crucible and Earth\nDate: 2009\nEnemies: The Daleks and Davros\n\nThe Earth has been overwhelmed and the universe faces dominion by the resurgent forces of a terrifying and limitless empire led by one of The Doctor's greatest enemies. Aiding the Time Lord in a final battle are several of his closest allies and companions, but for one of them, a price will be paid... 	\N	9.05	2008-07-05 17:45:00	Journey's End (2)	57243
133	1	/hUsQerEeMqsu9cVYzMEB2OGJjrw.jpg	After his explosive regeneration, the Eleventh Doctor awakes to discover his TARDIS is about to crash. Emerging from the wreckage of his crashed time machine, he meets young Amy Pond. Still wearing the remains of the Tenth Doctor’s suit, ripped and raggedy from the damage after the TARDIS control room exploded, the Doctor promises to take Amy to the stars. But before they can begin their journey, they become embroiled in an alien plot that could destroy the Earth.\n\nLater the Doctor makes good his promise and Amy boards the regenerated TARDIS, ready to take to the stars on a series of wild adventures that will change her life. Amy and the Doctor explore time and space, visiting 17th century Venice, France during the 1890s and the United Kingdom in the far future, now an entire nation floating in space. As always, wherever the Doctor goes, his oldest enemies are never far behind - the Daleks are hatching a new master plan from the heart of war-torn London in the 1940s. But they are not the only strange creatures the Doctor and Amy must face - there are also alien vampires, humanoid reptiles, old enemies such as the Weeping Angels, and a silent menace that follows Amy and the Doctor around wherever they go.	\N	8.66	2010-04-03 19:30:00	Season 5	57243
134	1	/7SCdxZkZba4YCjPXnAt2otv8fjS.jpg	Location: Leadworth \nDate: (1996,2008,2010)\nEnemies: Prisoner Zero, Atraxi \n\nThe Doctor has regenerated into a brand new man, but danger strikes before he can even recover. With the TARDIS wrecked, and the sonic screwdriver destroyed, the new Doctor has just 20 minutes to save the whole world - and only Amy Pond to help him.	\N	8.68	2010-04-03 17:45:00	The Eleventh Hour	57243
135	1	/idREuQNMuuvJcvn549j68MOTqEc.jpg	Location: Starship UK\nDate: 3295 \nEnemies: Smilers\n\nAmy Pond takes her first trip in the TARDIS when the Doctor whisks her away to the distant future and they discover Britain in space. Starship UK houses the future of the British people as they search the stars for a new home. But when Amy explores she encounters the terrifying Smilers and learns a deadly truth inside the Voting Booth...	\N	8.16	2010-04-10 17:45:00	The Beast Below	57243
136	1	/bQU8MI5DUkw3R8tpC58wZ4RoeFt.jpg	Location: Earth \nDate: 1941, World War II\nEnemies: Daleks\n\nThe Doctor has been summoned by old friend Winston Churchill, but in the Cabinet War Rooms far below the streets of blitz-torn London, it's his oldest enemy he finds waiting for him, as the time-travelling adventures continue. The Daleks are back – but can Winston Churchill be in league with them?	\N	7.80	2010-04-17 17:45:00	Victory of the Daleks	57243
137	1	/7on4wH45zsKYnqQX91xXsTBbMje.jpg	Location: Alfava Metraxis \nDate:  51st century\nEnemies: Weeping Angels\n\nA crashed spaceship, a shattered temple and a terrifying climb through the maze of the dead - River Song is back in the Doctor's life, and she's brought more trouble than even he can handle. The last of the weeping Angels is loose in the ruins of Alfava Metraxis, and the Doctor is recruited to track it down. "Don't blink!" everyone tells Amy - but Amy is about to discover, not blinking might just be the worst thing you can do...	\N	8.58	2010-04-24 17:45:00	The Time of Angels (1)	57243
138	1	/hdeY2GyMvtHVps5Ze6z7D7j1oqm.jpg	Location: Alfava Metraxis \nDate:  51st century\nEnemies: Weeping Angels\n\nThere's no way back, no way up and no way out. Trapped among an army of Weeping Angels, The Doctor and his friends must try to escape through the wreckage of a crashed space liner. Meanwhile, in the forest vault, the Doctor's companion, Amy Pond, finds herself facing an even more deadly attack. \n\n	\N	8.57	2010-05-01 17:45:00	Flesh and Stone (2)	57243
139	1	/jLksFGWiRB0EHmCxLosDwIJW7GA.jpg	Location: Venice, Earth  \nDate: 1580  \nEnemies: Saturnynians\n\nDessicated corpses, terror in the canal and a visit to the sinister House of Calvierri – the Doctor takes Amy and Rory for a romantic mini-break, as the Tardis touches down once again. \n\nBut 16th-century Venice is not as it should be. The city has been sealed to protect it from the Plague, although Rosanna Calvierri may have other plans...	\N	7.69	2010-05-08 17:45:00	The Vampires of Venice	57243
140	1	/oGtuZIqlVOzlLbvt73rQQUqhDSV.jpg	Location: Upper Leadworth / The TARDIS\nDate: 2015.\nEnemies: The Dream Lord , The Eknodine\n\nIt has been five years since Amy Pond last travelled with the Doctor, and when he lands in her garden again, on the eve of the birth of her first child, she finds herself facing a heartbreaking choice – one that will change her life forever. They will have to choose which is the dream world and which is reality. 	\N	8.18	2010-05-15 17:45:00	Amy's Choice	57243
141	1	/4s6jxJBNqXF3j3PBMto78SSunrB.jpg	Location: Cwmtaff, Wales \nDate: 2020\nEnemies: Silurians \n\nIn 2020, the most ambitious drilling project in history is under way. Dr Nasreen Chaudry and her team have reached 21 kilometers into the Earth's crust - but something is stirring far below. Amy Pond discovers there's nowhere to run when you can't even trust the ground at your feet.	\N	7.80	2010-05-22 17:45:00	The Hungry Earth (1)	57243
142	1	/kpjhRYkFJIV90yqrwCWGk8ALhdb.jpg	Location: Cwmtaff, Wales \nDate: 2020\nEnemies: Silurians \n\nIt is the most important day in the history of Earth: the dawn of a new age of harmony… or the start of its final war. \n\nThe Doctor must face his most difficult challenge yet and he tries desperately to ensure Alaya's prediction of a massacre does not come true. Meanwhile, what fate will befall the captured Amy and can Tony and his friends be trusted? \n	\N	7.98	2010-05-29 17:45:00	Cold Blood (2)	57243
143	1	/bSXtkTYVizAlcbNGRHBCj8rznCJ.jpg	Location: Auvers-sur-Oise, Earth \nDate: 1890 \nEnemies: Krafayis \n\nTerror lurks in the cornfields of Provence, but only a sad and lonely painter can see it. Amy Pond finds herself shoulder to shoulder with Vincent van Gogh, in a battle with a deadly alien - saving the world has never been so ginger! But can even the Doctor save Vincent?	\N	9.08	2010-06-05 17:45:00	Vincent and the Doctor	57243
144	1	/wbo8GXgAMZ7H3XdZLqm2UJO1ow.jpg	Location: Aickman Road\nDate: 2010 \nEnemies: Number 79B, Aickman Road \n\nThere's a house on Aickman road with a staircase that people go up, but never down... To solve the mystery of the man upstairs, the Doctor must pass himself off as a normal human being, and share a flat with Craig Owens.	\N	8.35	2010-06-12 17:45:00	The Lodger	57243
145	1	/oCgpFhpCCgAwNUhR1seTYXRJkHE.jpg	Location: Stonehenge, Earth\nDate: 102AD\nEnemies: The Alliance \n\nThe Doctor's friends unite to send him a terrible warning; the Pandorica - which is said to contain the most feared being in all the cosmos - is opening. But what's inside, and can the Doctor stop it? 	\N	8.83	2010-06-19 17:45:00	The Pandorica Opens (1)	57243
146	1	/ic0ZIxO7T5AN0YIyP7jlbepZPdc.jpg	Location: National Museum \nDate: 1996\nEnemies: Stone Dalek\n\nThe Doctor is gone, the Tardis has been destroyed, and the universe is collapsing. The only hope for all reality is a little girl who still believes in stars.	\N	9.02	2010-06-26 17:45:00	The Big Bang (2)	57243
147	1	/xmfMcVkVer5r33QhA4e2DpIR78B.jpg	\N	\N	8.25	2011-04-23 19:30:00	Season 6	57243
148	1	/w1Gu8jrHqYrWs136GxRvScqXRfQ.jpg	Location: Utah, Washington D.C., Florida\nDate: 2011, 1969\nEnemies: The Silence\n\nPlacing his life entirely in their hands, the Doctor agrees to search for the recipient of the fourth envelope - just who is Canton Everett Delaware the Third? And what is the relevance of their only other clue: 'Space 1969'? Their quest lands them - quite literally - in the Oval Office, where they are enlisted by President Nixon himself to assist enigmatic former-FBI agent Canton, in saving a terrified little girl from a mysterious spaceman.	\N	8.72	2011-04-23 17:45:00	The Impossible Astronaut (1)	57243
149	1	/aDhkjkl7Et7uudNitbkHm7CZdla.jpg	Location: Utah, Washington D.C., New York City\nDate: 1969\nEnemies: The Silence\n\nThe Doctor is locked in the perfect prison. Amy, Rory and River Song are being hunted down across America by the FBI. With the help of new friend and FBI-insider, Canton Everett Delaware the Third, our heroes are reunited to share their discoveries, if not their memories. For the world is occupied by an alien force who control humanity through post-hypnotic suggestion and no one can be trusted. Aided by President Nixon and Neil Armstrong's foot, the Doctor must mount a revolution to drive out the enemy and rescue the missing little girl. No-one knows why they took her. Or why they have kidnapped Amy Pond...	\N	8.70	2011-04-30 17:45:00	Day of the Moon (2)	57243
150	1	/c1QBseuJ2MSUcpas1pC6x6nrvtw.jpg	Location: In a pirate ship\nDate: 1699\nEnemies: Siren\n\nThe TARDIS is marooned onboard a 17th-century pirate ship whose crew is being attacked by a mysterious and beautiful sea creature.\n\nBecalmed and beset by cabin fever, the pirates have numerous superstitious explanations for the Siren's appearance. The Doctor has other ideas but, as his theories are disproved and every plan of escape is thwarted, he must work to win the trust of the implacable Captain Avery and uncover the truth behind the pirates' supernatural fears – and he must work quickly, for some of his friends have already fallen under the Siren's spell...	\N	7.53	2011-05-07 17:45:00	The Curse of the Black Spot	57243
151	1	/kQKQ1UGOBlerJiXjNDQ4bV9Nh3v.jpg	Location: In a bubble universe\nDate: unknown\nEnemies: The House, The Nephew\n\nThe Doctor receives a distress signal from an old friend. Could there really be another living Time Lord out there? Hopes raised, he follows the signal to a junkyard planet sitting upon a mysterious asteroid in a Bubble universe, populated by a very strange family, as the time-travelling drama continues.\n\nThe Doctor, Amy and Rory are given the warmest of welcomes by Auntie, Uncle and Nephew. But the beautiful and insane Idris greets them in a more unusual fashion – what is she trying to tell the Doctor? As the Doctor investigates, he unwittingly puts his friends in the gravest danger. 	\N	8.73	2011-05-14 17:45:00	The Doctor's Wife	57243
152	1	/2nSKMC4B6Rkg3ilTiQbwDGZfBfv.jpg	A solar tsunami sends the TARDIS hurtling towards a futuristic factory on Earth, where human doppelgangers are used to mine dangerous acid, as the time-travelling adventures continue.\n\nA second wave hits and the "Gangers" separate. They can remember every second of their "original's" life and feel every emotion they've ever experienced. But are these memories stolen or have they been bequeathed? Are the Gangers merely faulty machinery that must be shut down or are they living, breathing, sentient beings? Can the Doctor convince the terrified humans to accept these "almost people" and prevent an all-out civil war before the factory explodes?	\N	7.66	2011-05-21 17:45:00	The Rebel Flesh (1)	57243
153	1	/hFx0dr4dyAyV8izoBO6HuW4yR2.jpg	As the solar storm rages, Jennifer, a Ganger driven mad by the memories of being "decommissioned", is seeking revenge, as the time-travelling drama continues.\n\nShe can remember every excruciating second of every "execution" and is determined that the humans will pay. And she isn't just talking war; she's talking revolution. As the crumbling factory fills with toxic fumes and drips lethal acid, the "Originals" wait desperately for the shuttle from the Mainland to rescue them. But Jennifer has other ideas. Can the Doctor convince the terrified factory workers to embrace their own humanity and work together with their Gangers to overcome a monster of their own making?	\N	7.97	2011-05-28 17:45:00	The Almost People (2)	57243
154	1	/89NYx2loksaiFj4vFyEQZ4Of25.jpg	Amy Pond has been kidnapped and the Doctor is raising an army to rescue her as the drama continues. But as he and Rory race across galaxies, calling in long-held debts and solemnly given promises, his enemies are laying a carefully concealed trap.\n\nIn her cell in Stormcage, River Song sadly acknowledges that the time has come at last – today will mark the Battle of Demons Run and the Doctor’s darkest hour. Both sides will make their sacrifices and River Song must finally reveal her most closely guarded secret to the Doctor.	\N	8.96	2011-06-04 17:45:00	A Good Man Goes to War (1)	57243
155	1	/tSccK7c1jlpPahKXQvIfYUjFGtg.jpg	In the desperate search for Melody Pond, the TARDIS crash lands in Thirties Berlin, as the time-travelling drama returns for the second half of the series shown earlier in the year. The Doctor comes face to face with the greatest war criminal in the Universe. And Hitler. Old friendships are tested to their limits as the Doctor suffers the ultimate betrayal and learns a harsh lesson in the cruelest warfare of all. As precious time ebbs away, the Doctor must teach his adversaries that time travel has responsibilities. And he must succeed before an almighty price is paid.	\N	8.61	2011-08-27 17:45:00	Let's Kill Hitler (2)	57243
156	1	/l6lYTQ5QwYAqQGvTOfLdnlcMvuF.jpg	A little boy named George sends a distress signal to the Doctor when he discovers that monsters live in his bedroom cupboard. 	\N	7.54	2011-09-03 17:45:00	Night Terrors	57243
157	1	/n6RYsI4S1Wy8ouanOYGXQuS2gAP.jpg	The TARDIS brings its crew to a quarantine facility for victims of an alien plague. When Amy is trapped, Rory must rescue her from the facility's doctors but learns something surprising about his wife.	\N	8.41	2011-09-10 17:45:00	The Girl Who Waited	57243
158	1	/cf0vAccRIXwYJtc2pIbmRtlgdNW.jpg	The trio arrive at a hotel where the layout of the rooms keeps changing. It also contains rooms that hold the greatest fears of each visitor.	\N	8.14	2011-09-17 17:45:00	The God Complex	57243
159	1	/is8F49nu51Cy1KBdhGnoFjxlSzH.jpg	As the Doctor prepares for his inevitable death at Lake Silencio, he visits a former roommate and learns that the Cybermen are responsible for a series of disappearances at a local department store and resolves to investigate.	\N	8.14	2011-09-24 17:45:00	Closing Time	57243
160	1	/BQaQJKqeIV7L4R3XKKZrJyzM7D.jpg	As the Doctor makes his final journey to the shores of Lake Silencio in Utah, he knows only one thing can keep the universe safe – his own death – in the concluding episode of this series of the time-travelling drama. But has he reckoned without the love of a good woman?	\N	8.72	2011-10-01 17:45:00	The Wedding of River Song	57243
161	1	/6biGcR0OyFnKRxxUW7bGtK49wTd.jpg	The seventh series of the British science fiction television series Doctor Who aired from 1 September 2012 to 18 May 2013, being split into two parts, as with the previous series. The series was broadcast concurrently on BBC One in the United Kingdom, BBC America in the United States, and on Space in Canada, and also on ABC in Australia, with the first five episodes released a week after its UK and North American release and the remainder released the next day. Following its premiere on 1 September 2012, the series aired weekly until 29 September 2012. Six episodes were broadcast in 2012, including the 2012 Christmas special, "The Snowmen", which aired separately from the main series. The remaining eight episodes began broadcasting on 30 March 2013. "The Snowmen" introduced a new TARDIS interior, title sequence, theme tune, and costume for the Doctor.\n\nDoctor Who's seventh series was the show's third and final series in which Matt Smith, Karen Gillan and Arthur Darvill played the eleventh incarnation of the Doctor and his companions Amy Pond and Rory Williams respectively. Gillan and Darvill departed the series in the fifth episode, after which a new companion named Clara Oswald joined the Doctor, played by Jenna-Louise Coleman, remaining with the series for its second half. Smith stayed for one year longer than Gillan and Darvill, and will depart the series after the 2013 specials.	\N	7.96	2012-09-01 19:30:00	Season 7	57243
162	1	/rN3BynpG55i9P933Pp0775U81fU.jpg	Kidnapped by his oldest foe, the Doctor is forced on an impossible mission - to a place even the Daleks are too terrified to enter... the Asylum. A planetary prison confining the most terrifying and insane of their kind, the Doctor and the Ponds must find an escape route. But with Amy and Rory’s relationship in meltdown, and an army of mad Daleks closing in, it is up to the Doctor to save their lives, as well as the Pond’s marriage.	\N	8.69	2012-09-01 17:45:00	Asylum of the Daleks	57243
163	1	/2yOZwTxLN0Jm3tiQQT1IETpH1CJ.jpg	An unmanned spaceship hurtles towards certain destruction - unless the Doctor can save it, and its impossible cargo... of dinosaurs! By his side a ragtag gang of adventurers; a big game hunter, an Egyptian Queen and a surprised member of the Pond family. But little does the Doctor know there is someone else onboard who will stop at nothing to keep hold of his precious, prehistoric cargo.	\N	8.05	2012-09-08 17:45:00	Dinosaurs on a Spaceship	57243
164	1	/j0Kc08Zz6UJVIG60WFSJ34VTmC8.jpg	The Doctor gets a Stetson (and a gun!), and finds himself the reluctant Sheriff of a Western town under siege by a relentless cyborg, who goes by the name of the Gunslinger. But who is he and what does he want? The answer seems to lie with the mysterious, Kahler-Jex, an alien doctor (yes another one!) whose initial appearance is hiding a dark secret.	\N	7.84	2012-09-15 17:45:00	A Town Called Mercy	57243
165	1	/bUkVdlhBZEat0OqBYLPQOeZv7xF.jpg	The Doctor and the Ponds puzzle an unlikely invasion of Earth, as millions of sinister black cubes arrive overnight, almost like presents falling from the sky. But what are they, what’s inside them and most importantly, who sent them? With the international community at a loss, it’s left to the Doctor to unearth who is behind the mystery. 	\N	8.05	2012-09-22 17:45:00	The Power of Three	57243
166	1	/wYJautwl0CARbcN68b224NYaQl1.jpg	The Doctor’s heart-breaking farewell to Amy and Rory – a race against time through the streets of Manhattan, as New York’s statues come to life around them… With Rory’s life in danger, the Doctor and Amy must locate him before it’s too late! Luckily, an old friend helps them and guides the way.	\N	8.91	2012-09-29 17:45:00	The Angels Take Manhattan	57243
187	1	/crrMkCB8OLqo3VdYdxfUBEAHt2J.jpg	With Cybermen on the streets of London, old friends unite against old enemies and the Doctor takes to the air in a startling new role. As the Doctor faces his greatest challenge, sacrifices must be made before the day is won.	\N	8.11	2014-11-08 18:45:00	Death In Heaven	57243
167	1	/3VoZH0t0dCT8I74eUlBxJTf8jXM.jpg	When the Doctor receives a mysterious call from Clara, the woman that he's been seeking since he has seen her die twice, he arrives in 21st century Earth and discovers that something is using wi-fi to download human minds into the Internet... and feed on them.	\N	8.36	2013-03-30 18:45:00	The Bells of St John	57243
168	1	/i6tJrGtJcCJ18tWrfaskEMUl5g5.jpg	Clara wants to see something awesome, so the Doctor whisks her off to the inhabited rings of the planet Akhaten, where the Festival of Offerings is in full swing. Clara meets the young Queen of Years as the pilgrims and natives ready for the ceremony. But something is stirring in the pyramid, and a sacrifice will be demanded.	\N	7.90	2013-04-06 17:45:00	The Rings of Akhaten	57243
169	1	/pDBbOWasznRv9hdztCe0LUWEMU0.jpg	The Doctor and Clara land on a damaged Russian submarine in 1983 as it spirals out of control into the ocean depths. An alien creature is loose on board, having escaped from a block of Arctic ice. With tempers flaring and a cargo of nuclear weapons on board, it’s not just the crew but the whole of humanity at stake!\n	\N	7.72	2013-04-13 17:45:00	Cold War	57243
170	1	/36Oy5SR1JU6EsBC4qHL985EqC2v.jpg	Clara and the Doctor arrive at Caliburn House, a haunted mansion sat alone on a desolate moor. Within its walls, a ghost hunting Professor and a gifted psychic are searching for the Witch of the Well. Her apparition appears throughout the history of the building, but is she really a ghost? And what is chasing her?\n	\N	8.09	2013-04-20 17:45:00	Hide	57243
171	1	/sLGGoIP1lqbv4YlCRQQafkYIwkr.jpg	When a salvage ship attempts to pull the TARDIS aboard when the time vessel's shields are down, an explosion occurs. The Doctor forces the salvage crew to help him find Clara, who is lost somewhere inside his vessel.	\N	8.16	2013-04-27 17:45:00	Journey to the Centre of the TARDIS	57243
172	1	/vQoo3ZgprNji2SLhkOXTXVq5339.jpg	Something ghastly is afoot in Victorian Yorkshire, as bodies are found with their skin a waxy, glowing red.	\N	7.80	2013-05-04 17:45:00	The Crimson Horror	57243
173	1	/z8i0eek1v9N30opYpp1mp7cggK2.jpg	Hedgewick's World of Wonders: the perfect theme park day out - and ground zero for a deadly silver resurrection.	\N	8.20	2013-05-11 17:45:00	Nightmare in Silver	57243
174	1	/yuyaPwtNhyrlCE7bOD5PZZVxFdf.jpg	Someone is kidnapping the Doctor's friends, leading him towards the one place in all of time and space that he should never go.	\N	8.98	2013-05-18 17:45:00	The Name of the Doctor	57243
175	1	/nMxeLkOF9DzbqJdSx7gzmbFvPGK.jpg	The season ushers in an exciting new era for the show as Peter Capaldi steps into the role of the Doctor. Fans first got a glimpse of Capaldi's Doctor in November's 50th Anniversary Special, and again in the final minutes of last year's Christmas Special, but the upcoming season premiere marks the first full episode for the Twelfth Doctor. Capaldi will be joined by Jenna Coleman, who returns as companion Clara Oswald, and Samuel Anderson who joins the cast as Danny Pink, a teacher at Coal Hill School where Clara also works.	\N	7.48	2014-08-23 19:30:00	Season 8	57243
176	1	/fn0tmqmL7P83DwLksG7TuFHNaoV.jpg	When a dinosaur materialises alongside the Houses of Parliament in Victorian London, the Doctor's old friends, the Paternoster Gang, are relieved when he arrives, seemingly to deal with the creature. However, they soon realise that the Doctor is the one in need of help; newly regenerated, extremely volatile and questioning his self-worth, this is a very different man to the one they last saw. The only person that may be able to help him is Clara, and she is still grappling with losing the Doctor she knew and loved.	\N	8.03	2014-08-23 17:45:00	Deep Breath	57243
177	1	/bR45NIPLU4wkaHK2KIIAKJUVHmp.jpg	A Dalek fleet surrounds a lone rebel ship, and only the Doctor can help them now.\nThe Doctor faces his greatest enemy and he needs Clara by his side. Confronted with a decision that could change the Daleks forever he is forced to examine his conscience. Will he find the answer to his question - "Am I a good man?"	\N	7.87	2014-08-30 17:45:00	Into the Dalek	57243
178	1	/8bMdhKODbWluNpKnsDwsCKTWQNH.jpg	In a sun-dappled Sherwood Forest, The Doctor discovers an evil plan from beyond the stars. But with the fate of Nottingham at stake (and possibly Derby), there's no time for the two adventurers to get into a fight about who is real and who isn't - which is probably why they do very little else!	\N	7.68	2014-09-06 17:45:00	Robot of Sherwood	57243
179	1	/dMAViLP5xtMJPwv9EOYUx0RZR6w.jpg	What scares the grand old man of time? What horrors lurk under his bed? Ghosts of the past and future crowd into the lives of The Doctor and Clara; a terrified caretaker in a children's home, the last man standing in the universe, and a little boy who doesn't want to join the army...	\N	8.46	2014-09-13 17:45:00	Listen	57243
180	1	/me3tZsKPUujLcNaMBBqxk4zfqIG.jpg	The Bank of Karabraxos is the deadliest bank in the cosmos - only a fool or genius would tempt to rob it. Fortunately, for The Doctor, he's both. But nothing even The Doctor has encountered can prepare them for the Teller: a creature of terrifying power that can detect guilt.	\N	8.16	2014-09-20 17:45:00	Time Heist	57243
181	1	/rzyWVBDPRDYREQddDeIPUoVYfqE.jpg	Clara has it all under control: her life at school, her life in space; her new boyfriend and her mad old Time Lord. Everything is humming along just fine, so long as everybody never actually meets. And then, one morning, just before assembly, Coal Hill welcomes a new relief caretaker with a Scottish accent.	\N	7.81	2014-09-27 17:45:00	The Caretaker	57243
182	1	/wEBoSLmrlf9K6yLsqN8eRyIY1be.jpg	In the near future, The Doctor and Clara arrive on a decrepit shuttle making a suicide mission to the Moon. Crashing on the lunar surface, they find a mining base full of eviscerated corpses, spider-like creatures scuttling about in the dark, and a terrible dilemma.	\N	7.61	2014-10-04 17:45:00	Kill the Moon	57243
183	1	/4tMq7FEADEsUs3xNaRAAwsu6DeA.jpg	Aboard the most beautiful train in history, speeding among the stars of the future, a legend is stalking the passengers. Once you see the Mummy, you have 66 seconds to live. Clara sees The Doctor at his deadliest and most ruthless - and finally she realises she's made the right decision. Because this is their last adventure: it's time to say goodbye to the Time Lord.	\N	8.09	2014-10-11 17:45:00	Mummy on the Orient Express	57243
184	1	/dIiRNUWRmX7lKPb39pARJsdlgN1.jpg	Separated from The Doctor, Clara discovers a new menace from another dimension. But how do you hide when even the walls are no protection.	\N	8.09	2014-10-18 17:45:00	Flatline	57243
185	1	/lH0tIDwpIcU9BQeUOXIoJoZmhnf.jpg	One morning in London, and every city and town in the world, the human race wakes up to the most surprising invasion yet: the trees have moved back in. Everywhere, in every land, a forest has grown overnight and taken back the Earth.	\N	7.55	2014-10-25 17:45:00	In the Forest of the Night	57243
186	1	/1VIFcfBadRqw3s6wbcqV9o9WeIO.jpg	In the mysterious world of the Nethersphere, plans have been drawn. Old friends and old enemies manoeuvre around The Doctor, and an impossible choice is looming over him.	\N	8.39	2014-11-01 18:45:00	Dark Water	57243
188	1	/uidaCdI0hKiZGfMzWHNMYeNZyV7.jpg	Now that the Doctor and Clara have established a dynamic as a partnership of equals, they’re relishing the fun and thrills that all of space and time has to offer. Tangling with ghosts, Vikings and the ultimate evil of the Daleks, they embark on their biggest adventures yet. Missy is back to plague the Doctor once more, the Zygons inspire fear as they shape-shift into human clones, and a new arrival moves in cosmic ways.	\N	7.99	2015-09-19 19:30:00	Season 9	57243
189	1	/4szgVi355DvGfmSkQulNYWIkbIP.jpg	Where is the Doctor? When the skies of Earth are frozen by a mysterious alien force, Clara needs her friend. But where is the Doctor, and what is he hiding from? As past deeds come back to haunt him, old enemies will come face-to-face, and for the Doctor and Clara survival seems impossible.	\N	8.20	2015-09-19 17:45:00	The Magician's Apprentice (1)	57243
190	1	/tv0WKdJYAkFZM34obgEzeJyRvEi.jpg	Trapped and alone in a terrifying Dalek city, the Doctor is at the heart of an evil Empire; no sonic, no TARDIS, nobody to help. With his greatest temptation before him, can the Doctor resist? And will there be mercy?	\N	8.16	2015-09-26 17:45:00	The Witch's Familiar (2)	57243
191	1	/5b11pS8kvHPJcKIAtdqW0TSuWJb.jpg	The Doctor and Clara save the frightened crew from a threat in an underwater base, but the Doctor questions the haunting. 	\N	7.97	2015-10-03 17:45:00	Under The Lake (1)	57243
192	1	/nQbCg8toK04cKQi3b7SpGMOtZlr.jpg	An alien warlord sets a twisted plan in motion in order to ensure his survival on a remote Army outpost, and the Doctor may have to do something unthinkable. 	\N	7.89	2015-10-10 17:45:00	Before The Flood (2)	57243
193	1	/5aGS4PCDbn3miav9xTrq3QaZmOA.jpg	In a forgotten corner of history, a young Viking girl sits surrounded by the dead warriors of her people. She wants to fight back against the perpetrators - and, in doing so, declares war on the Mire, one of the deadliest races that the galaxy has ever known. The Doctor and Clara must help protect her village, using the twelve tense hours they have to turn a motley crew of farmers and blacksmiths into a fighting force to be reckoned with. 	\N	7.87	2015-10-17 17:45:00	The Girl Who Died (1)	57243
194	1	/foGfiuXpSe3TvCI4CL620i79QLO.jpg	England, 1651. A deadly highwayman known only as 'The Knightmare' plagues the dark streets of London, his fire-breathing accomplice by his side. There's something clearly more than human here, and that includes the loot as much as the outlaws. Who are these creatures, and are they enemies to be fought, or friends who might possibly save the Doctor from certain doom on the gallows?	\N	7.77	2015-10-24 17:45:00	The Woman Who Lived (2)	57243
195	1	/1GRZ4mBbEIezevCfGMZHNWinYZq.jpg	The Zygons, a race of shapeshifting aliens, have been living in secret among us on Earth, unknown and unseen - until now!\n\nWhen Osgood is kidnapped by a rogue gang of Zygons, the Doctor, Clara and UNIT must scatter across the world in a bid to set her free. But will they reach her in time, and can they stop an uprising before it’s too late?	\N	7.61	2015-10-31 18:45:00	The Zygon Invasion (1)	57243
196	1	/97EIvboowEBC1tnRBNNBIw1XrEs.jpg	Shapeshifting Zygons are everywhere in the UK and there is no way of knowing who to trust. With UNIT neutralized only the Doctor stands in their way. What can the Doctor do to save his friends?	\N	7.93	2015-11-07 18:45:00	The Zygon Inversion (2)	57243
197	1	/nyIBGBeKc9znPjRw3anSmVB5SiC.jpg	This terrifying story is assembled from footage discovered in the wreckage of Le Verrier Space Station.	\N	6.82	2015-11-14 18:45:00	Sleep No More	57243
198	1	/sbHH582pGSoFUpxh7GwuRpjkjcJ.jpg	The Doctor and Clara, with their old friend Rigsy, find themselves in a magical alien world, hidden on a street in the heart of London.	\N	8.19	2015-11-21 18:45:00	Face The Raven	57243
199	1	/nLXzaaySsrIief9JVGdL8JsFTzt.jpg	Trapped in a world unlike any other he has seen, the Doctor faces the greatest challenge of his many lives. One final test. And he must face it alone.\n\nPursued by the fearsome creature known only as the Veil, he must attempt the impossible. If he makes it through, Gallifrey is waiting…	\N	8.57	2015-11-28 18:45:00	Heaven Sent (1)	57243
200	1	/63ZdUe52okiZu2oR75Rsd7teTxt.jpg	If you took everything from him, betrayed him, trapped him, and broke both his hearts...how far might the Doctor go?\n\nReturning to Gallifrey, the Doctor faces the Time Lords in a struggle that will take him to the end of time itself. Who is the Hybrid? And what is the Doctor’s confession?	\N	8.45	2015-12-05 18:45:00	Hell Bent (2)	57243
201	1	/8HPLQQqTPfy7Oiligw9FXcfig9w.jpg	Doctor Who, Season 10 will see Peter Capaldi embark on his thrilling final chapter as the Twelfth Doctor as well as the introduction of brand new companion Pearl Mackie as Bill Potts and the return of Matt Lucas as Nardole. Fantastic adventures and terrifying monsters await the team of heroes as they journey through space and time. Expect laughter, danger and exhilarating escapades in this final season under the helm of lead writer and executive producer Steven Moffat.	\N	7.68	2017-04-15 19:30:00	Season 10	57243
202	1	/gxxhOtonWORK058jPtzgh3gz3IN.jpg	A chance encounter with a girl with a star in her eye leads to a terrifying chase across time and space. Bill’s mind is opened to a Universe that is bigger and more exciting than she could possibly have imagined - but who is the Doctor, and what is his secret mission with Nardole on Earth?	\N	8.13	2017-04-15 17:45:00	The Pilot	57243
203	1	/pj8g594dT9tnxEyMp9WtCPYi2pO.jpg	In the far future, at the edge of the galaxy, there is a gleaming, perfect city. This brand new human settlement is said to hold the secret of human happiness - but the only smiles the Doctor and Bill can find are on a pile of grinning skulls.\n\nSomething is alive in the walls, and the emojibots are watching from the shadows, as the Doctor and Bill trying to unravel a terrifying mystery...	\N	7.85	2017-04-22 17:45:00	Smile	57243
204	1	/e2zFXmklhrGSFRWiuMGmJpIA3kz.jpg	The Doctor and Bill visit London during the last of the River Thames frost fairs in February 1814. They soon discover that there is something under the ice which is causing people to disappear.	\N	7.77	2017-04-29 17:45:00	Thin Ice	57243
205	1	/v7lKlSs0RBIRvRkaU1DdR6KE53K.jpg	Bill is moving in with some friends and they’ve found the perfect house – so what if it’s strangely cheap to rent, and the landlord is a little creepy?\n\nThe wind blows, the floorboards creak, and the Doctor thinks something is very wrong. What lurks in the strange tower at the heart of the building – and why can’t they find any way to enter it?	\N	7.70	2017-05-06 17:45:00	Knock Knock	57243
206	1	/d5nINIHEamo5hoXIRFQDlRGtW5J.jpg	The Doctor, Bill and Nardole answer a distress call in deep space, and find themselves trapped on board space station Chasm Forge. All but four of the crew have been murdered – and the dead are still walking!\n\nIn a future where oxygen is sold by the breath, and space suits are valued more highly than their occupants, the TARDIS crew battle for survival against the darkest evil of all…	\N	7.90	2017-05-13 17:45:00	Oxygen	57243
228	1	/kAnPMdxPrVFNk7BILGJNaDmCZHE.jpg	Ghost battles to win back his club and must deal with those standing in the way.\n	\N	7.91	2015-06-28 01:00:00	You're the Only Person I Can Trust	54650
207	1	/6qjxu9RbVPWFEbE5E9dN0HjAfzm.jpg	In the Haereticum – the Vatican’s secret library of blasphemy – there is an ancient book known only as The Veritas. Throughout history, anyone who has ever read it has immediately taken their own life. Now a new translation is online, and the danger is spreading. The Vatican appeals to the Doctor. Will he read The Veritas? But can even the Doctor survive the ultimate truth?	\N	8.09	2017-05-20 17:45:00	Extremis	57243
208	1	/ni0M5tb3ehUcfcQ675VYOBeONs0.jpg	An 'ancient' pyramid appears overnight. Every clock in the world begins counting down to the Earth's destruction. Three opposing armies lie ready to annihilate each other. An alien race stands ready to offer humanity a deal that could save them, but enslave them. It is a terrifying race against time to save the world. Will the Doctor be forced to accept their help?	\N	7.94	2017-05-27 17:45:00	The Pyramid at the End of the World	57243
209	1	/iHKV70qoL9Fa1AkYRXYucv92MWV.jpg	Earth has been invaded and Bill is living alone, an isolated figure surviving in occupied Britain. The Doctor is imprisoned and appears to be on the side of the enemy, flooding the airwaves with fake news. Bill and Nardole must embark on a deadly mission to rescue the Doctor and lead the resistance against the new regime, whatever the cost.	\N	7.67	2017-06-03 17:45:00	The Lie of the Land	57243
210	1	/lJW5n7z9E4ppOOju0zKVd0PN0v.jpg	The Doctor, Bill and Nardole arrive on Mars and find themselves in an impossible conflict between Ice Warriors… and Victorian soldiers. As the Martian hive awakes around them, the Doctor faces a unique dilemma – this time the humans, not the Ice Warriors are the invaders. When Earth is invading Mars, whose side is he on?	\N	7.67	2017-06-10 17:45:00	Empress of Mars	57243
211	1	/890whs65S57x2qsiU8M3W5RQ0tk.jpg	A long time ago, the ninth legion of the Roman army vanished into the mists of Scotland. Bill has a theory about what happened, and the Doctor has a time machine. But when they arrive in ancient Aberdeenshire, what they find is a far greater threat than any army. In a cairn, on a hillside, is a doorway leading to the end of the world…	\N	7.69	2017-06-17 17:45:00	The Eaters of Light	57243
212	1	/oCdBc9eMkXqPUI8V096xoNyIf09.jpg	Friendship drives the Doctor into the rashest decision of his life. Trapped on a giant spaceship, caught in the event horizon of a black hole, he witnesses the death of someone he is pledged to protect. Is there any way he can redeem his mistake? Are events already out of control? For once, time is the Time Lord’s enemy...	\N	8.33	2017-06-24 17:45:00	World Enough and Time	57243
213	1	/ldwHPCFoMgyryt0bkg7g1jj2TFA.jpg	“Without hope, without witness, without reward.” The Mondasian Cybermen are on the rise. It’s time for the Doctor’s final battle…	\N	8.37	2017-07-01 17:45:00	The Doctor Falls	57243
214	1	/dUYx61M4fGSkNeTzaNdufsxTOuw.jpg	James "Ghost" St. Patrick has it all: a beautiful wife, a gorgeous Manhattan penthouse, and the hottest, up-and-coming new nightclub in New York. His club, Truth, caters to the elite: the famous and infamous boldface names that run the city that never sleeps. As its success grows, so do Ghost’s plans to build an empire. However, Truth hides an ugly reality. It’s a front for Ghost’s criminal underworld; a lucrative drug network, serving only the wealthy and powerful. As Ghost is seduced by the prospect of a legitimate life, everything precious to him becomes unknowingly threatened. Once you’re in, can you ever get out?	\N	8.49	2014-06-08 01:00:00	Power	54650
215	1	/h2Ef6jGAgjUDL21RJrfSHsA2A2W.jpg	\N	\N	8.56	2014-06-08 01:00:00	Season 1	54650
216	1	/cv073jDlAI8A2BWTYlK8nFfhagC.jpg	James "Ghost" St. Patrick opens Truth nightclub, hoping its success will allow him to leave his career as a NYC drug kingpin. But an attack on his drug business threatens his plans.	\N	7.72	2014-06-08 01:00:00	Not Exactly How We Planned	54650
217	1	/4toU9rXS3NTBGqBuJkd6hDSZIW1.jpg	Ghost hosts a party for Vogue Magazine, while he and Tommy have to make a tough decision when their drug business is attacked.	\N	7.72	2014-06-15 01:00:00	Whoever He Is	54650
218	1	/wWbSCTFe1M48eIutu1dAVWCpZH0.jpg	A model gets hospitalized after snorting bad cocaine. Ghost, Tommy and Josh investigate, while Josh suggests to involve police. The rift between Tasha and Ghost deepens when she visits the bank to find a lot of their money missing.	\N	7.73	2014-06-22 01:00:00	This Is Real	54650
219	1	/5JqNyr9RLSN6IKxmHTA7URUeWDP.jpg	Ghost and Tommy gather their network of gang leaders while Angela plans surveillance for the same meeting. The mystery assailant strikes again. Ghost admits to Angela that he's married with children.	\N	7.77	2014-06-29 01:00:00	Who Are You?	54650
220	1	/AoSZ4aKWjbVmT3HgpQIaZDs52MG.jpg	Concerned over Ghost's attitude, Tasha interferes with club business. Ghost and Angela pursue their affair. Tommy pursues a club employee.	\N	7.79	2014-07-13 01:00:00	I Gotta Go	54650
221	1	/64TKmmxYtPpTXDbm53DHBIt3MLS.jpg	Tommy makes peace with Ruiz while Angela wires one of Ruiz's gang members. Ghost forgets Tasha's birthday. Ghost and Angela confront the reality of their affair.	\N	7.70	2014-07-20 01:00:00	Who You With?	54650
222	1	/84KDPVD7ZiTysm5wPj9KCXxpOX8.jpg	Tasha sees Angela for the first time. Ghost learns a friend may be behind the hits while Angela races to stop the next attack. Ghost makes a commitment to Angela. The mastermind behind the hits is revealed.	\N	7.94	2014-07-27 01:00:00	Loyalty	54650
223	1	/n7Xltz4KWkirbvAS7PX9FNhZWQ5.jpg	Ghost plans a huge party at Truth, hoping to expand out of NYC and the drug world. Ghost makes a big decision in an attempt to achieve his dream of going legit.	\N	7.99	2014-08-03 01:00:00	Best Laid Plans	54650
224	1	/vImIPJ4HDX6em8Bs1ed7GDejBvQ.jpg	Season two picks up right where it left off: James “Ghost” St. Patrick doubling down on his drug business to save his nightclub and dream of a legitimate future. Ghost’s work troubles pale in comparison to juggling his relationship with his wife, Tasha, and his first love, Angela, who’s also an Assistant US Attorney investigating his drug organization.\n\nGhost is set further back from his dream by his business partner, Tommy, who loves the drug game, and his former mentor, Kanan, fresh out of jail and looking for revenge.\n\nSeason two has Ghost in a race against himself: Can he get out of the drug game alive before Angela discovers who he is?	\N	8.65	2015-06-07 01:00:00	Season 2	54650
225	1	/yCbZ40N4ybiI9locMw8NaCzqOSW.jpg	Ghost picks up the pieces at Truth after the botched murder attempt against him, while recommitting to the drug game. Tommy disappears after learning Angela is with the feds.	\N	7.87	2015-06-07 01:00:00	Consequences	54650
226	1	/tRlahL9Pi7w503PvGcOFiWsoSLC.jpg	Tommy signs on to assist Ghost in expanding the drug trade, but has a serious condition that must first be met, while Ghost is surprised to learn about Kanan getting out of jail.\n	\N	7.79	2015-06-14 01:00:00	No Friends On The Street	54650
227	1	/tqMBMOaSCe5tZuM8wJFMV6UxaZu.jpg	Ghost brings Angela to Miami, where they indulge in the fantasy of being a couple, but reality brings them back to earth. Back in New York, Tommy and Kanan bond.\n	\N	7.76	2015-06-21 01:00:00	Like We're Any Other Couple	54650
230	1	/xaVUnz5xXP45ybbAVfjtpLdxNbO.jpg	Angela learns that Jamie and Ghost are the same person; the drug syndicate welcomes a new member.	\N	8.07	2015-07-19 01:00:00	Why Her?	54650
231	1	/y3WCb7fz2ezR7FJ1FtRGQ3gcTqW.jpg	Tommy becomes worried after Holly speaks with the feds; Ghost explains his actions to Angela.	\N	7.96	2015-07-26 01:00:00	You're Not the Man	54650
232	1	/uUT9BSEJYQj82HdonNCXbHm50Sj.jpg	Ghost attempts to distance himself from Lobos before Angela gets to him.	\N	8.09	2015-08-02 01:00:00	Three Moves Ahead	54650
233	1	/xdPhHb3isr9gPTDLLxnd7kP3Iqx.jpg	Tommy is pressured to flip on Lobos or go to jail; Ghost tries to do the right thing.	\N	8.25	2015-08-09 01:00:00	Time's Up	54650
234	1	/hHaGdaIzVv222g64GIw7eZL0bK2.jpg	Bodies from Ghost's organization drop left and right, each death inching closer to Ghost and Tommy.	\N	8.30	2015-08-16 01:00:00	Ghost Is Dead	54650
235	1	/ti6rli4AhUCA6e4C2E0P0MgO9FL.jpg	Will James St. Patrick's dream of leaving the drug game and finding love with the woman sworn to bring him to justice end before it begins with the specter of "Ghost" coming back to haunt him? Be careful what you wish for.	\N	8.69	2016-07-18 01:00:00	Season 3	54650
236	1	/8UIz8ZWXMshrqaKEbcouZSsUSpg.jpg	Out of the drug game and with new nightclubs, James St. Patrick is ready to leave “Ghost” behind and begin his new life with Angela. Just one problem: someone knows the truth about Vladimir, Drifty, Ruiz, and Lobos. Angela learns of a shocking discovery at work, and now must decide where to draw the line between love and honor.  Without her husband by her side, Tasha reels from the death of Shawn while having an unsettling theory as to the identity of his killer. On his own in the underworld, Tommy is forced to make some bold moves while he receives a gruesome reminder of his assignment to kill Ghost.	\N	8.05	2016-07-18 01:00:00	Call Me James	54650
237	1	/3panbhDLJWVj75WV1UNOyBtDYRN.jpg	Ghost scrambles to tie up the most lethal of loose ends while he deals with new nightlife competition.  Tommy confronts Tasha over a lie from the past, as she and Angela must learn to coexist as their domestic lives change. With his drug organization unraveling, Tommy gains an advisor in his returned love, Holly, who enlists an old friend to solve a new problem.	\N	8.01	2016-07-25 01:00:00	It's Never Over	54650
238	1	/qkevRqYmqqF5m4xKjfReYqplC3S.jpg	Ghost is presented with a business opportunity that could take the clubs to the next level, but must outshine devious new rivals, all while looking over his shoulder for Lobos’s revenge. Tommy reunites with Tasha in a business scheme, while he also tries to keep a new drug contact under control and protect his reputation in the streets. Tasha and Ghost are tested when Tariq crosses a line.	\N	7.97	2016-08-01 01:00:00	I Got This on Lock	54650
239	1	/by63OYg1leGsZzbOh18i1SgY8GF.jpg	Ghost is spread even thinner between Angela, the children, business and Tommy as the opportunity to expand the clubs evolves; Tommy struggles with a decision, Kanan re-enters the life; Angela has doubts.	\N	8.07	2016-08-08 01:00:00	Don't Worry, Baby	54650
240	1	/jEkxse3mHY2tiV6gb1IGXbzZCf4.jpg	Tommy goes gunning for the culprit who tried to kill him; Greg pressures Ruiz to give up the "Ghost," as Angela tries to keep them at bay. Meanwhile, Proctor brings a new problem to the fore for Ghost to deal with.	\N	8.34	2016-08-15 01:00:00	Help Me	54650
241	1	/wTcneh422F8hSEqPrwihHi6lt2L.jpg	Ghost and Tommy reunite to take out a dangerous enemy and enlist Tasha to help them escape detection by Angela and her team; Ghost loses control at a critical moment.	\N	8.09	2016-08-22 01:00:00	The Right Decision	54650
242	1	/rX7odn83KSWJQwHAGPkfTljOBFh.jpg	Angela reels after her breakup and faces difficult questions at work; Ghost scrambles to keep the club deal alive as he and Tommy are forced to re-enter the game; Dre learns the meaning of the La Arana card.	\N	8.05	2016-08-29 01:00:00	Don't Go	54650
243	1	/OfypxqAnwVhPWU6gYNCHd26hYk.jpg	Mike and Angela hunt for the mole; Angela gets a lead, while she must solidify Tommy's alibi; Tasha receives a warning as Tariq makes a dangerous new friend; Milan issues an edict to push a new product.	\N	8.03	2016-09-05 01:00:00	Trust Me	54650
244	1	/xJd3zDR4jYOlu8bpdIGxFI5eIMm.jpg	Angela searches for the mole; Ghost works to regain the club deal; Kanan exerts a dark influence upon Tariq; Milan warns Tommy about the price of betrayal.	\N	8.03	2016-09-19 01:00:00	I Call the Shots	54650
245	1	\N	Ghost attempts to retrieve evidence while throwing the party of his career; Tasha forms an unlikely alliance in an effort to save her family; Tommy considers a move that could change everyone's lives.	\N	8.36	2016-09-26 01:00:00	In My Best Interest	54650
246	1	/qKbqQMTBSRe1rafVlVlCXUdylXt.jpg	\N	\N	9.67	2017-06-26 01:00:00	עונה 4	54650
247	1	/hiLwF72RJFWw2R3W2KQyd5TaHXK.jpg	Ghost faces threats from all sides following his arrest for the murder of Agent Knox; Tasha scrambles to get bail as the Feds begin to build their case; Tommy navigates his new role and enlists help in recovering Tariq.	\N	8.23	2017-06-26 01:00:00	When I Get Out	54650
248	1	/ml73DkrvKVzD23iK15SXoe8Md9F.jpg	Proctor works to protect his client as Ghost faces harassment; the team discusses its strategy for taking down St. Patrick; Tommy struggles to let go of his old duties; Tasha talks to the children about what is going on.	\N	8.27	2017-07-03 01:00:00	Things Are Going to Get Worse	54650
249	1	/uzDtEwIYxpBIPvzIQvR8bkZIQXF.jpg	\N	\N	0.00	2017-07-10 01:00:00	The Kind of Man You Are	54650
250	1	\N	\N	\N	0.00	2017-07-17 01:00:00	We're in This Together	54650
251	1	\N	\N	\N	0.00	2017-07-24 01:00:00	Don't Thank Me	54650
252	1	\N	\N	\N	0.00	2017-07-31 01:00:00	New Man	54650
253	1	\N	\N	\N	7.00	2017-08-07 01:00:00	You Lied to My Face	54650
254	1	\N	\N	\N	0.00	2017-08-14 01:00:00	It's Done	54650
255	1	\N	\N	\N	0.00	2017-08-21 01:00:00	That Ain't Me	54650
256	1	\N	\N	\N	0.00	2017-08-28 01:00:00	You Can't Fix This 	54650
257	1	/22mSgZmStDb1luWdolYY3feLVW9.jpg	Piper Chapman is a public relations executive with a career and a fiance when her past suddenly catches up to her. In her mid-30s she is sentenced to spend time in a minimum-security women's prison in Connecticut for her association with a drug runner 10 years earlier. This Netflix original series is based on the book of the same title. Forced to trade power suits for prison orange, Chapman makes her way through the corrections system and adjusts to life behind bars, making friends with the many eccentric, unusual and unexpected people she meets.	\N	8.34	2013-07-11 04:00:00	Orange Is the New Black	1424
258	1	/kJzjhNiMiDk7sqgrmbEAk56oR9D.jpg	Piper must trade her comfortable New York life for an orange prison jumpsuit when her decade-old relationship with a drug runner catches up with her.	\N	8.48	2013-07-11 04:01:00	Season 1	1424
259	1	/g8EpHVZZn0LJvRW7raCSkfO17mE.jpg	Sentenced to fifteen months for a crime committed in her youth, Piper Chapman leaves her supportive fiance Larry for her new home: a women's prison.	\N	7.67	2013-07-11 04:00:00	I Wasn't Ready	1424
260	1	/mbLSYxzuC9AyVmWEoTTizPS7c3y.jpg	After insulting the food in front of the prison chef, Piper is starved out by the kitchen staff and struggles to offer up an acceptable apology.	\N	7.81	2013-07-11 04:00:00	Tit Punch	1424
261	1	/bPuWKEOSBztyYJmzDgEiQHpbmz4.jpg	Targeted for romance by a fellow prisoner, Piper finds that subtlety is an ineffective approach to letting her suitor down.	\N	7.85	2013-07-11 04:00:00	Lesbian Request Denied	1424
262	1	/eCxIEhDguoaIpoIHct0QeTGjSRH.jpg	Piper gets to know her stern new roommate; the prisoners prepare a farewell party for one of their own; a misplaced screwdriver has dire consequences.	\N	7.88	2013-07-11 04:00:00	Imaginary Enemies	1424
263	1	/ZUQMlwisANsGExqFy3xiAncO4o.jpg	When her sighting of a legendary feral chicken polarizes the inmates, Larry wonders if Piper is getting too absorbed in the "fishbowl" of prison life.	\N	7.77	2013-07-11 04:00:00	The Chickening	1424
264	1	/pHL87ffFnhbAziM7S9jnHet6EN5.jpg	The inmates campaign along racial lines for positions on a prisoners council, but Piper tries to stay above the increasingly raucous competition.	\N	7.82	2013-07-11 04:00:00	WAC Pack	1424
265	1	/hSan3djgV7HIDLx4NZ1hCUJuNXS.jpg	Piper wants the prison's outdoor running track reopened, but in order to get it, she'll have to give her corrections officer something he wants.	\N	7.80	2013-07-11 04:00:00	Blood Donut	1424
266	1	/fIbkhhqGNGCq01aSn5vKhqOhtIL.jpg	Red gets pressured to smuggle drugs through her kitchen; Larry publishes an article about Piper in the "New York Times;" two babies come into the world.	\N	7.80	2013-07-11 04:00:00	Moscow Mule	1424
267	1	/bdcoyRcv1aQKW0CyRYOmWhHykEW.jpg	Thanksgiving arrives with the promise of a visit by Larry, but Piper's raunchy dance moves land her in solitary with a holiday feast of moldy bologna.	\N	8.03	2013-07-11 04:00:00	Fucksgiving	1424
268	1	/7iBAq85IZAiNn3bQhAueCj421t0.jpg	Pennsatucky discovers a new skill; the inmates try to scare delinquent teenagers straight; Pornstache's side business suffers a tragic setback.	\N	8.09	2013-07-11 04:00:00	Bora Bora Bora	1424
269	1	/gt0YGGOjWY1MMiC6IvQWNrnJZvb.jpg	The prisoners mourn one of their own and even a drunken Pornstache reveals surprising emotions; Larry gives a revealing radio interview.	\N	8.11	2013-07-11 04:00:00	Tall Men with Feelings	1424
270	1	/xNl7oihTm2PQB9V3LR3fNhnL2Ug.jpg	Painful truths reorient several relationships and careers; Pennsatucky feels disrespected by Piper, which is not good; Larry delivers an ultimatum.	\N	7.99	2013-07-11 04:00:00	Fool Me Once	1424
271	1	/za4SjyamKLOHLwDVUPjStYZfayL.jpg	Red's scheme to reclaim her kitchen backfires; the inmates stage a Christmas pageant; Piper's plans unravel even as she realizes her life is in jeopardy.	\N	8.39	2013-07-11 04:00:00	Can't Fix Crazy	1424
272	1	/xekxbBb8sk6gyi0Xq3nNwqJFHX1.jpg	Shocking revelations and new arrivals shake up the lives and relationships of Litchfield's prisoners.	\N	8.47	2014-06-06 04:01:00	Season 2	1424
273	1	/9HI0CaWvqwHL4xd6yt6C5b9dWzB.jpg	Piper's world is turned upside down when she is forced to confront the consequences of her actions and face new challenges.	\N	8.00	2014-06-06 04:00:00	Thirsty Bird	1424
274	1	/fUrtBPiI8v7PLVs3v4nHN1k76Tl.jpg	A mock Job Fair provides Taystee with a chance to show off her business smarts; Red feels isolated from her prison family.	\N	7.76	2014-06-06 04:00:00	Looks Blue, Tastes Red	1424
275	1	/wtTt2H5jdECvdYQpgjepvTS852K.jpg	Piper is challenged by her Soso experience; Morello gets her heart broken; a figure from Taystee's past arrives to disturb the status quo.	\N	7.86	2014-06-06 04:00:00	Hugs Can Be Deceiving	1424
276	1	/1o3gOCq5lX6YYZ4tBpNKXqRz0jv.jpg	Sophia gives the women a much-needed lesson in female anatomy; Morello takes a detour; Larry makes some life changes.	\N	7.88	2014-06-06 04:00:00	A Whole Other Hole	1424
277	1	/gjQGxxAQmxVbkMT522pI8e9JYZd.jpg	A bathroom turf war sees deeper lines drawn in the sand as Gloria and Vee go head to head. Piper receives devastating news.	\N	7.79	2014-06-06 04:00:00	Low Self Esteem City	1424
278	1	/gotmC6GaCD4luNBetAUlky6wF2d.jpg	Love is in the air as the inmates prepare for a Valentine's Day party; Red makes an intriguing new discovery. Larry asks Piper to be his prison mole.	\N	7.89	2014-06-06 04:00:00	You Also Have a Pizza	1424
279	1	/gGIph0QRjG59VCe2anuhCMWRm4n.jpg	Piper starts a prison newsletter with the help of Healy and a few other inmates; Vee launches an entrepreneurial enterprise. 	\N	7.78	2014-06-06 04:00:00	Comic Sans	1424
280	1	/nhiycDr1AMZOyMAWZhoFmK3iHSw.jpg	Piper faces a new backlash over special privileges; Caputo feels pressure to toughen up, resulting in administrative changes.	\N	7.86	2014-06-06 04:00:00	Appropriately Sized Pots	1424
281	1	/xUMh9zTpMfq6HOFFeMcYeNg7ZuA.jpg	Piper's relationship with Larry faces a real-world test; Red's effort to redeem herself is finally rewarded. A familiar figure returns to Litchfield.	\N	7.96	2014-06-06 04:00:00	40 Oz. of Furlough	1424
282	1	/uL9hSfLBOEkGqcSf6N0jSnJtJV9.jpg	The guards get tougher in a bid to turn up prison contraband; a big, lingering secret is finally revealed.	\N	8.03	2014-06-06 04:00:00	Little Mustachioed Shit	1424
283	1	/rWECLIVLiEqnGyajfUjmEL4oYZp.jpg	Piper is shocked at an unexpected change in her status; Soso's hunger strike attracts new support that takes on a religious fervor.	\N	7.94	2014-06-06 04:00:00	Take a Break from Your Values	1424
284	1	/yoGOVt01tQfNBz7GcmtQk1gzjcg.jpg	Tensions run high as a prison power outage forces several issues to come to light. Piper finds herself compromised and is forced to think on her feet.	\N	8.11	2014-06-06 04:00:00	It Was the Change	1424
285	1	/bossMzlq0cPL8f2DVxYtpv58iHZ.jpg	Several futures hang in the balance as the inmates face and confront their worst nightmares: Life will never be the same again.	\N	8.62	2014-06-06 04:00:00	We Have Manners. We're Polite.	1424
286	1	/6CVeQu1HCgolMRJ8Gr1iYwF5aIc.jpg	New business interests, spiritual movements and parental problems upend lives and ignite power struggles among Litchfield's residents and guards.	\N	8.04	2015-06-12 04:01:00	Season 3	1424
287	1	/9UoltpPmKZgBU6MLYLtDchzcbOv.jpg	Caputo's kinder, gentler new regime includes organizing a Mother's Day fair for the inmates that brings up a LOT of mixed feelings about family.	\N	7.47	2015-06-12 04:00:00	Mother's Day	1424
288	1	/tTsjwx8hCEppIjn3HkHwEWJF3sQ.jpg	Tempers flare when bed bugs invade. Alex cracks. Red lashes out at Piper. Aleida interferes with Daya and Bennett. Caputo gets bad news.	\N	7.46	2015-06-12 04:00:00	Bed Bugs and Beyond	1424
289	1	/tefQcT6PENAO1xnpNMTJoBESeZ4.jpg	Nicky's stash situation gets complicated. Alex and Crazy Eyes try a new drama class. Red assists Healy with a personal matter.	\N	7.60	2015-06-12 04:00:00	Empathy Is a Boner Killer	1424
290	1	/flFl4tdrCki3b1UenHss5GjdrG8.jpg	Big Boo comes up with a scheme to make money. Daya, Taystee and Crazy Eyes confront reality. Caputo tries to make a good impression on some visitors.	\N	7.56	2015-06-12 04:00:00	Finger in the Dyke	1424
291	1	/qCInUgSmQNaBUsEimoNmZNy6ccr.jpg	Rumors fly among the inmates about a new, higher-paying job assignment, especially when they have to take a test for it	\N	7.48	2015-06-12 04:00:00	Fake It Till You Fake It Some More	1424
292	1	/upuyvrCXjkyaKNH7qfc6wgbOyE4.jpg	Regime change isn't going over well with the staff, but Red makes it work for her. Lorna finds a way to meet men. Chang shows her private side.	\N	7.61	2015-06-12 04:00:00	Ching Chong Chang	1424
293	1	/iZBFrUgXOFBY6u5CbRWtv20cdC.jpg	Norma’s healing powers draw more believers. Piper creates a new business venture. Caputo breaks in the new hires.	\N	7.56	2015-06-12 04:00:00	Tongue-Tied	1424
294	1	/93XCYxmbikqADPVbaXLB3Iw3J2R.jpg	Piper gets creative in order to grow her business. Crazy Eyes’s sci-fi sex story for drama class is a hit. Alex doesn’t trust new inmate Lolly.	\N	7.53	2015-06-12 04:00:00	Fear, and Other Smells	1424
295	1	/y068Jmgm5pTVBAaM5riWfBigySo.jpg	Too many inmates seem to be getting religion, so a rabbi comes to visit. Leanne tries to organize Norma's followers.	\N	7.58	2015-06-12 04:00:00	Where My Dreidel At	1424
296	1	/eHGAJB3x0ezLeUnm6Aw5UYAdu6v.jpg	Pennsatucky, Piper, Crazy Eyes and Lorna get closer with their new admirers. Tensions between Sophia and Gloria, and Alex and Lolly escalate.	\N	7.57	2015-06-12 04:00:00	A Tittin' and a Hairin'	1424
297	1	/2ZxBZRh9uO77f6jMZsdkGoBBNNB.jpg	Caputo and Piper confront labor issues. A miracle occurs in Norma's group. Crazy Eyes's erotica winds up in the hands of the staff.	\N	7.69	2015-06-12 04:00:00	We Can Be Heroes	1424
298	1	/ubmos2DF9Jew1va9DMFfrduMTre.jpg	Daya goes into labor. Sophia suffers a hate crime. Stella helps Piper with a business snag. Taystee takes on a new role.	\N	7.75	2015-06-12 04:00:00	Don’t Make Me Come Back There	1424
299	1	/fbQdjpUCgWtsDt7zydhL0UPgrOI.jpg	Miracles and conversions occur, but Piper and Caputo know that some situations can't be dealt with through spiritual means.	\N	8.12	2015-06-12 04:00:00	Trust No Bitch	1424
300	1	/r4kUNRIcBAPJJ3MSzTbyzbLNGBa.jpg	Tensions were already running high at Litchfield. Throw 100 new inmates into the mix, and it's going to get really rough.	\N	8.44	2016-06-17 04:01:00	Season 4	1424
301	1	/bi53Ydx5ZvShRrsEAHYMVjqUTSq.jpg	With a major security breach and a lot of new inmates, Caputo has to call in the big guns. Things get a little too real for Crazy Eyes and Lolly.	\N	7.80	2016-06-17 04:00:00	Work That Body for Me	1424
302	1	/mYRHZ3k6OwoeBelUjOHvlkvltw3.jpg	The newcomers stir up ethnic and domestic conflicts, but Maria sees an opportunity. Judy's special treatment raises eyebrows.	\N	7.52	2016-06-17 04:00:00	Power Suit	1424
303	1	/bJkRqnYZcVNK2IS2jVsxzICN4Eg.jpg	A new job puts Taystee close to Caputo. Lorna has to get creative in her marriage. Soso and Poussey deal with some awkward truths.	\N	7.63	2016-06-17 04:00:00	(Don't) Say Anything	1424
304	1	/paFCasrlPnCrViIqqSvSU91n6sG.jpg	Nothing stays hidden for long when emotions run high, but Red, Healy and Caputo try to keep the peace. Piper has a business competitor.	\N	7.56	2016-06-17 04:00:00	Doctor Psycho	1424
305	1	/7ragrxvPdU3LKiC42g61vuEinjH.jpg	Company policies lead to a shortage of critical supplies and an eventful trip to a prison convention. Piscatella starts a new anti-gang initiative.	\N	7.51	2016-06-17 04:00:00	We'll Always Have Baltimore	1424
306	1	/iELqxCboiOPUlYSxkQ9MvmdhKhM.jpg	Piper's plan to edge out the competition could backfire badly. Cindy finds a way to make Taystee's job pay off. Luschek gets some interesting mail.	\N	7.66	2016-06-17 04:00:00	Piece of Sh*t	1424
307	1	/2iKVENQ56soRiWNvSCGKhuuLiKD.jpg	Paranoia strikes deep for Lolly and Judy, aggravating an already tense situation. Red sticks to a Russian tradition for an important occasion.	\N	7.76	2016-06-17 04:00:00	It Sounded Nicer in My Head	1424
308	1	/893EZMh52fzJk1IkEC8Fi4pktzx.jpg	A new work detail doesn't go over well with the inmates. Judy seeks help from Poussey. Maria finds a place she can conduct business.	\N	7.73	2016-06-17 04:00:00	Friends in Low Places	1424
309	1	/fxPJFuk8sxdArWsTz8B9bh2m9HE.jpg	Ramos and Flores figure out ways to rebel against authority. A news item has an unexpected effect. Red and Lorna face personal disappointment.	\N	7.60	2016-06-17 04:00:00	Turn Table Turn	1424
310	1	/dbFDvMkv1hadq0L8sVsgd4AS7Jo.jpg	The movie night selection becomes controversial. Aleida makes an adjustment. Piper worries the prison punishments are getting medieval.	\N	7.72	2016-06-17 04:00:00	Bunny, Skull, Bunny, Skull	1424
311	1	/lGbLb4AF59smEctyLZznphCB192.jpg	Caputo's leadership is challenged and the inmates are in for a long night of lockdown after workers make an unsettling discovery.\n	\N	7.93	2016-06-17 04:00:00	People Persons	1424
312	1	/87BlphK0MYFDt19dIJLzstX0GVe.jpg	Alliances shift among the prison "families" as Piscatella and his guards crack down. Poussey, Judy and Alex prefer to look ahead to the future.	\N	8.09	2016-06-17 04:00:00	The Animals	1424
313	1	/hRsZxbPJ4eNmFwK6rruht3kA9qK.jpg	Corporate bureaucracy and simmering anger work against Caputo's efforts to keep a sensitive situation under control.	\N	8.36	2016-06-17 04:00:00	Toast Can't Never Be Bread Again	1424
314	1	/mv9FXJJZqRPv0lxKGBfXE3c3Eaq.jpg	\N	\N	7.82	2017-06-09 04:00:00	Season 5	1424
315	1	/gmCtFgdkdciHT967oo3pKLlefsH.jpg	As the standoff at the prison spirals into a full-blown riot, enterprising inmates take advantage of the confusion. Taystee confronts Caputo.	\N	7.68	2017-06-09 04:00:00	Riot FOMO	1424
316	1	/kXhPjj0bfuiz3QtLeEIBOakIODO.jpg	Maria convenes a special assembly in the chapel as the inmates plot their next move. Frieda makes use of the survival skills she learned as a kid.	\N	7.63	2017-06-09 04:00:00	Fuck, Marry, Frieda	1424
317	1	/vHGOKOCmb4riDiU5PQHE160zlAx.jpg	Linda begins to see the prison in a new light, while Judy grows desperate to escape. With darkness falling, the inmates compile a list of demands.	\N	7.53	2017-06-09 04:00:00	Pissters!	1424
318	1	/vwzh6rE8glHMM8Oa9zZ8wuzpXqK.jpg	Red and Blanca dig for dirt on Piscatella. Suzanne conducts a séance. The guards show off their talents for "Litchfield Idol" judges Leanne and Angie.	\N	7.55	2017-06-09 04:00:00	Litchfield's Got Talent	1424
319	1	/A15Ch7FQxvAheEKKV8sSJQ04j4k.jpg	When the inmates' antics make the morning news, Flaca and Maritza soak up the spotlight. Brandy and her crew auction off Judy to the highest bidder.	\N	7.73	2017-06-09 04:00:00	Sing It, White Effie	1424
320	1	/hCxyhrdLrl3iJeAf6O4kZEfBla2.jpg	Boo defends Doggett, Janae consoles Soso, and Lorna comes on to Nicky. While Alex lays low in the yard, Piper decides to take a stand.	\N	7.64	2017-06-09 04:00:00	Flaming Hot Cheetos, Literally	1424
321	1	/bhYEF8TJxe77IEb9EMnIV0EnPPq.jpg	Black Cindy concocts a scheme to distract Suzanne when she spirals out of control. Taystee and Piper search for ways to honor Poussey's memory.	\N	7.60	2017-06-09 04:00:00	Full Bush, Half Snickers	1424
322	1	/5FeaWGRnzWesG2hQYgGpKr0vrv6.jpg	While Taystee sits down with a negotiator, Red and Blanca put their own plan into action. Gloria counsels Daya and asks Caputo for a favor.	\N	7.75	2017-06-09 04:00:00	Tied to the Traintracks	1424
323	1	/62B5y5EgpEYkXIR8kEUkEWlsPyP.jpg	Red senses trouble, but the others are convinced she's just paranoid. Taystee and Black Cindy enlist an unlikely ally, and two old friends clash.	\N	7.78	2017-06-09 04:00:00	The Tightening	1424
324	1	/aYeCe7Qpst1h9oOt4gdYk053ebW.jpg	Taystee tries to keep the negotiations on track. Angie comes up with an idea for fixing Leanne's finger. Piscatella's past is revealed.	\N	7.91	2017-06-09 04:00:00	The Reverse Midas Touch	1424
325	1	/oHaFJ0PH9GQBKc6IbOKjhSMjOV2.jpg	Red and the others weigh their options. Gloria wrestles with her conscience as she moves forward with a plan. Lorna takes over the pharmacy.	\N	7.81	2017-06-09 04:00:00	Breaking the Fiberboard Ceiling	1424
326	1	/cmH08QQQJpuZRWyCdAve75qyLQD.jpg	Boo dabbles in blackmail, Nicky promises to help Lorna, Doggett makes a discovery, and Piper comes to a realization about Alex.	\N	7.76	2017-06-09 04:00:00	Tattoo You	1424
327	1	/gEJVDdXsYK6yKvkT2rJM7phm77i.jpg	As chaos descends on Litchfield three days into the riot, the inmates wonder what the future holds and seek solace in loved ones.	\N	8.30	2017-06-09 04:00:00	Storm-y Weather	1424
328	1	/ovnH6mQfVembYErJXYhnh6e0R9C.jpg	Based on Neil Gaiman's eponymous novel, ex-convict Shadow Moon becomes the traveling partner of a mysterious conman named Mr. Wednesday after his release from prison. He soon discovers Mr. Wednesday is more than he seems and becomes embroiled in an epic conflict between Old Gods and New.	\N	8.21	2017-05-01 01:00:00	American Gods	46639
329	1	/67exRijfvN5RRmBCqFtk1bhJ7Uh.jpg	\N	\N	8.17	2017-05-01 01:00:00	Season 1	46639
330	1	/uvry4weK00pFLn7fxQ9M4m3Da2A.jpg	When Shadow Moon is released from prison early after the death of his wife, he meets Mr. Wednesday and is recruited as his bodyguard. Shadow discovers that this may be more than he bargained for.	\N	7.74	2017-05-01 01:00:00	The Bone Orchard	46639
331	1	/3lRIm0Ksi8X6vvmSldiiaYEOgne.jpg	As Mr. Wednesday begins recruitment for the coming battle, Shadow Moon travels with him to Chicago and agrees to a very high stakes game of checkers with the old Slavic god, Czernobog.	\N	7.75	2017-05-08 01:00:00	The Secret of Spoons	46639
332	1	/cxF4KvQbed5vnFAVsHFhLdrSzfD.jpg	Shadow questions his decision to work for Mr. Wednesday after learning of his plan to rob a bank; Shadow makes a surprising discovery when he returns to his motel room.	\N	7.75	2017-05-15 01:00:00	Head Full of Snow	46639
333	1	/btCbZe5xGMZcUkWwFmmePyVNFJD.jpg	The story of Laura's life and death is explored, including her first encounter with Shadow and how exactly she came to be sitting on the edge of his motel room bed.	\N	7.85	2017-05-22 01:00:00	Git Gone	46639
334	1	/h9eN63m309gZGXh2cN3A3LlBKA.jpg	Shadow's emotional reunion with his dead and unfaithful wife is interrupted when he and Mr. Wednesday are kidnapped by the New Gods.	\N	7.92	2017-05-29 01:00:00	Lemon Scented You	46639
335	1	/bdpghAgeRFg3gJfInc5w4vUzIyx.jpg	On the run after the New Gods' show of force, Shadow and Mr. Wednesday seek safe haven with one of Mr. Wednesday's oldest friends, Vulcan, God of the Fire and the Forge.	\N	7.80	2017-06-05 01:00:00	A Murder of Gods	46639
336	1	/RkfHpT76UsKRUmG0pmssdJdNQQ.jpg	Following her brief reunion with Shadow, Laura turns to an unlikely travel companion to find her way back to life; Mad Sweeney's long, winding, and often-tragic past is explored.	\N	7.83	2017-06-12 01:00:00	A Prayer for Mad Sweeney	46639
337	1	/cIaeavALIUoPhrkLgUSNodTXIKv.jpg	On the eve of war, Mr. Wednesday attempts to recruit the Old God Ostara, but needs Mr. Nancy's help in making a good impression and winning her over.	\N	8.17	2017-06-19 01:00:00	Come to Jesus	46639
338	1	/6AquMx9MoJZTaZIR2AokSDATFCt.jpg	Ruthless and cunning, Congressman Francis Underwood and his wife Claire stop at nothing to conquer everything. This wicked political drama penetrates the shadowy world of greed, sex and corruption in modern D.C.	\N	8.96	2013-02-01 05:00:00	House of Cards	1425
339	1	/oUfT2AbMVCYbVA3GIBbPqA6ZpUC.jpg	Betrayed by the White House, Congressman Francis Underwood embarks on a ruthless rise to power. Blackmail, seduction and ambition are his weapons.	\N	8.88	2013-02-01 05:01:00	Season 1	1425
340	1	/6sAKJySMV5VlrlBs6q9V8FjkwQd.jpg	When the newly elected President reneges on a promise, Francis and Claire decide to sever all allegiances and toss the rules out the window.	\N	8.20	2013-02-01 05:00:00	Chapter 1	1425
341	1	/1vjZa5tTaz86kKKBhiYBWnkRlQl.jpg	Francis and Doug plan to frame Secretary of State nominee, Michael Kern. Meanwhile, Zoe's popularity at the Washington Herald continues to grow.	\N	8.17	2013-02-01 05:00:00	Chapter 2	1425
342	1	/vMXqVtz5ZBR4xuWFTRBJtj0DvSl.jpg	Francis heads for his hometown to deal with a crisis. Zoe negotiates the politics of being a journalist on the rise. Claire finds herself a new business partner.	\N	8.11	2013-02-01 05:00:00	Chapter 3	1425
343	1	/1BseCNuPiQHWChHbxGDz5WaBoxG.jpg	Francis shakes down the Congressional leadership. Zoe is offered the promotion of White House Correspondent and doesn't know if she should take it or not.	\N	8.09	2013-02-01 05:00:00	Chapter 4	1425
344	1	/33pCcjWAYRcgXWKhWk0wPXp5Mfe.jpg	A feud starts between Francis and Marty Spinella. Russo goes into depression about the job losses at the shipyards.	\N	8.19	2013-02-01 05:00:00	Chapter 5	1425
345	1	/6cXGqA2XqnuAREg6z3VvErifu5I.jpg	The strike between Frank and Marty starts to get out of hand. Russo has decided to run for Governor of Pennsylvania.	\N	8.23	2013-02-01 05:00:00	Chapter 6	1425
346	1	/vj7hlPqAKTHrQxCMmp74G04VPPY.jpg	Frank helps Peter get ready for his governor race, but Peter is starting to have second thoughts. Doug tries to help a young hooker in trouble.	\N	7.99	2013-02-01 05:00:00	Chapter 7	1425
347	1	/aQjFqJtsyySgtOt5273N2GAQIaJ.jpg	Frank has a library named after him at his old military school. Peter tries to win back the support of his hometown.	\N	7.69	2013-02-01 05:00:00	Chapter 8	1425
348	1	/zgZg8gzvDa0yqvagURKSA706FvX.jpg	Frank tries to do whatever it takes to get the new bill passed in Congress. Russo goes on a bus campaign with the Vice President, but the VP is not making it an easy trip for him. Zoe's relationship with Frank gets a little bumpy.	\N	8.16	2013-02-01 05:00:00	Chapter 9	1425
349	1	/v3jUPbKmVpaH8a6Qv295qkEdhVm.jpg	Claire fuels an old flame. Peter wrestles with his demons. Francis crosses the point of no return.	\N	8.18	2013-02-01 05:00:00	Chapter 10	1425
350	1	/tVxl2dA9O8ajENIaHhwHo69fk5y.jpg	Zoe extends her time away from The Hill while Francis tracks down Russo and engages in damage control. 	\N	8.31	2013-02-01 05:00:00	Chapter 11	1425
351	1	/nV48z5uXfJH2DIGim4eRSldd02C.jpg	The President sends Frank to St. Louis to persuade Raymond Tusk into becoming the new Vice President. Zoe and Janine investigate Peter Russo's death.	\N	8.15	2013-02-01 05:00:00	Chapter 12	1425
352	1	/vsuWBB8cF18VKfCAIei1htFGKkf.jpg	Frank scrambles to keep his plan on track. Gillian is planning to sue Claire. Zoe, Janine, and Lucas investigate Rachel Posner and her relationship with Peter Russo.	\N	8.41	2013-02-01 05:00:00	Chapter 13	1425
353	1	/e5WNFWA1ZLnHxpr9xQdZMhEpvNo.jpg	In their ruthless rise to power, Francis and Claire battle threats past and present, and form new alliances while old ones succumb to betrayal.	\N	8.71	2014-02-14 05:01:00	Season 2	1425
354	1	/z91LQoFwhVcpeu3bZAQVIQ8B7kS.jpg	The Underwoods tackle two threats that could bring their plans to ruin. Francis grooms his replacement as Whip. Claire goes on the offensive.	\N	8.71	2014-02-14 05:00:00	Chapter 14	1425
355	1	/3CTVNSqSBE6wl2MTd0kCLPpfzeO.jpg	Amid turmoil in the home, Frank takes office. Foreign relations become entangled as Durant's team bungles a meeting. As foes negotiate to thwart her, Jackie maneuvers to strengthen her position. Lucas acquires new skills in order to pursue his secret investigation. 	\N	8.03	2014-02-14 05:00:00	Chapter 15	1425
356	1	/rXXh4m1daaLSC6p5iVDrljnkUKT.jpg	Tension rises between Francis and Raymond Tusk as the situation with China deteriorates. A battle in the Senate pits Francis against the Republicans.	\N	8.08	2014-02-14 05:00:00	Chapter 16	1425
357	1	/lPprjEmxdRE2nNQy1AzG8tFEAh1.jpg	A terror scare at the Capitol traps Francis with a resentful Donald Blythe. Claire gives a live interview that rocks the media.	\N	8.29	2014-02-14 05:00:00	Chapter 17	1425
358	1	/3d9v7vXp1e9EoVKB3mwZc3mXBih.jpg	Francis back-channels with a Chinese billionaire. Lucas uses extreme measures to expose the Vice President. A shadowy figure joins Team Underwood.	\N	7.99	2014-02-14 05:00:00	Chapter 18	1425
359	1	/mtgMfDZ6ljzYMIqzaojoZTzhKol.jpg	Amidst an energy crisis, Francis and Tusk end their shaky alliance. Lucas must make a difficult choice. Stamper grows closer to Rachel.	\N	7.93	2014-02-14 05:00:00	Chapter 19	1425
360	1	/ic09rdouhfHbbxb7tQNaDeRwhgY.jpg	Despite some friction, the Walkers deepen their friendship with the Underwoods. But it's all-out war between Francis and Tusk.	\N	7.98	2014-02-14 05:00:00	Chapter 20	1425
361	1	/7rvGPOhfKWOUSQRl96OGtE0SmWh.jpg	The war with Tusk intensifies. Claire influences Tricia Walker politically and domestically. Francis has a show-down with Linda Vasquez.	\N	8.09	2014-02-14 05:00:00	Chapter 21	1425
362	1	/nLfMbhVy4iucq2fUN039roQfUOd.jpg	Things get personal when Tusk blindsides the Underwoods with a scandal. Freddy and his BBQ joint get caught up in the mix.	\N	8.20	2014-02-14 05:00:00	Chapter 22	1425
363	1	/9ZSl47CVSQMmbeau7ghQdWyRk7C.jpg	With a military stand-off overseas and potential violence at home, Francis wants to finish off Tusk for good. Claire and Jackie Sharp collide.	\N	8.04	2014-02-14 05:00:00	Chapter 23	1425
364	1	/grwrv79vDn0w8UrQhcBNe9kTTK7.jpg	A Special Prosecutor interrogates Francis. Remy Danton tries to keep his options open. Stamper wrestles with his demons.	\N	8.21	2014-02-14 05:00:00	Chapter 24	1425
365	1	/4sTmsXEM7SMYqZg8qF9o8FRLlGG.jpg	Francis finds himself shut out and Claire makes a difficult sacrifice. Stamper tries to regain control.	\N	8.27	2014-02-14 05:00:00	Chapter 25	1425
366	1	/eED02PqgQFR9aePrwfm5J24bfEw.jpg	Francis faces annihilation while the nation is in an uproar. Stamper must tie up loose ends. Claire feels the cost of ruthlessness.	\N	8.81	2014-02-14 05:00:00	Chapter 26	1425
367	1	/za2XGEr1BWAuZkI0veLEwVxy30S.jpg	President Underwood fights to secure his legacy. Claire wants more than being First Lady. The biggest threat they face is contending with each other.	\N	8.00	2015-02-27 05:01:00	Season 3	1425
368	1	/uMHBlf6kYYRxGGmZhvCJQT7pNW6.jpg	A rocky start for the Underwood Presidency. Frank wants to introduce an ambitious jobs program, while Claire sets her sights on the United Nations.	\N	7.74	2015-02-27 05:00:00	Chapter 27	1425
369	1	/9wF8NpqsHl1CI8Th2RVq0MLDX6f.jpg	Claire's U.N. bid runs into trouble. Frank fights off mutiny with a bold address to the country.	\N	7.77	2015-02-27 05:00:00	Chapter 28	1425
370	1	/394ReRMqzcX2CN0NAPq6SLci9qp.jpg	The Russian president's state visit becomes a cold war of wills, and some punks heat things up.	\N	7.81	2015-02-27 05:00:00	Chapter 29	1425
371	1	/P3fbW8FKj2UrJYv3jtiYrQg63D.jpg	Claire bypasses Russia at the U.N. Frank tries to outmaneuver a potential challenger and ends up face to face with a higher power.	\N	7.65	2015-02-27 05:00:00	Chapter 30	1425
372	1	/4n2b5xWMdRqwF42dWHvx1AlhY6p.jpg	Frank declares war on Congress to jump-start his jobs program. Claire spars with the Russian Ambassador.	\N	7.67	2015-02-27 05:00:00	Chapter 31	1425
373	1	/zk7ZKFzaetHCpj1fN96PYXnJ8E1.jpg	Frank and Claire travel to Moscow to negotiate the return of an imprisoned U.S. citizen. Claire takes a stand that jeopardizes their plans.	\N	8.12	2015-02-27 05:00:00	Chapter 32	1425
374	1	/wyYtFGv8athHOkadbrD4kfr3J48.jpg	The damage is done and the Underwoods must repair it. But deep wounds don't heal fast, and sometimes not at all.	\N	7.61	2015-02-27 05:00:00	Chapter 33	1425
375	1	/wQmxJCDMDb85IRmxk9ilkvOY7XS.jpg	A hurricane endangers more than just the entire East Coast and Frank must make a difficult choice.	\N	7.70	2015-02-27 05:00:00	Chapter 34	1425
376	1	/pCNZMCI3J51O2HfJdjk81ctihSO.jpg	The Jordan Valley erupts in chaos as Frank's campaign is picking up steam. Claire gets disturbing intel and counsels him.	\N	7.69	2015-02-27 05:00:00	Chapter 35	1425
377	1	/hQWoj3JHqfAcUl3EX6WutF8Rj9f.jpg	Frank needs to deal with Petrov one on one while Claire tries to preserve the peace-keeping mission. Sacrifices must be made.	\N	7.60	2015-02-27 05:00:00	Chapter 36	1425
378	1	/n32TwwAv6Tplb3AsHz4dA0KUSAD.jpg	Things turn ugly when Frank, Jackie, and Heather square off during their first debate. Tom joins Claire on the campaign trail.	\N	7.99	2015-02-27 05:00:00	Chapter 37	1425
379	1	/uj78KJ8K9SyMYgSMdxCFhky1pqm.jpg	Heather Dunbar goes for the jugular, forcing Claire to confront her worst fears. The rift between Frank and Claire widens.	\N	7.84	2015-02-27 05:00:00	Chapter 38	1425
380	1	/s9TwFkEx8arMPwalN3wKs8Rx7N5.jpg	In the midst of the Iowa caucuses, Frank and Claire must confront hard truths about each other.	\N	8.03	2015-02-27 05:00:00	Chapter 39	1425
381	1	/1GeYr0qAYpxIGiIabzu1WqzKgtQ.jpg	They've always been a great team. But now in season four, Frank and Claire become even greater adversaries as their marriage stumbles and their ambitions are at odds. In an election year, the stakes are now higher than ever, and the biggest threat they face is contending with each other.	\N	8.67	2016-03-04 05:01:00	Season 4	1425
382	1	/cYFDcXovJN8PA8I9mWRnsGCrHND.jpg	Claire's absence causes problems for Frank on the campaign trail amid rumors of a marital rift. Claire tries to strike out on her own.	\N	7.61	2016-03-04 05:00:00	Chapter 40	1425
383	1	/kLB9Qv4iTYCewVf6F38ISmU633z.jpg	As Claire begins exploring a campaign of her own, she and Frank engage in backdoor political maneuvering. But this time they're not on the same side.	\N	7.65	2016-03-04 05:00:00	Chapter 41	1425
384	1	/xodFyCDBVa4zjzEf37poflRSk4N.jpg	Claire joins Frank as he stumps in South Carolina, but he doesn't trust her. A disastrous scandal blindsides Frank's campaign on primary day.	\N	7.92	2016-03-04 05:00:00	Chapter 42	1425
385	1	/qq8upbp6c7wCYPMXGK7J2uJouQA.jpg	Claire threatens Frank. Frank makes a politically bold move that may provoke Russia. An event at a campaign stop changes everything.	\N	8.17	2016-03-04 05:00:00	Chapter 43	1425
386	1	/fuQLG08nhwpH9doMadv4ly5Ccg5.jpg	Claire advises Donald Blythe on dealing with Petrov. Further investigations of Lucas Goodwin dredges up his accusations against Frank.	\N	7.80	2016-03-04 05:00:00	Chapter 44	1425
387	1	/zN2DH6xZdy3QBFfAlXYabyuQlzi.jpg	Claire clashes with the Secretary of State over her involvement in negotiations with Russia. Dunbar must choose between her campaign and her ethics.	\N	7.95	2016-03-04 05:00:00	Chapter 45	1425
388	1	/A8PGgUxcCUUtXYMH3RiLhWRumLX.jpg	Frank and Claire adjust to their new reality. The search for Frank's running mate begins. Frank starts a campaign to weaken Conway's strong support.	\N	7.85	2016-03-04 05:00:00	Chapter 46	1425
389	1	/A89VnVtJyD8NxdgYGwP0Nyw1zAv.jpg	Formidable as ever, both Underwoods have their eyes on the big picture as they manipulate a potential running mate and push the gun bill.	\N	7.65	2016-03-04 05:00:00	Chapter 47	1425
390	1	/al9EvPl9huoVdAnTlYj9RlNAr4E.jpg	At the convention, Frank and his team publicly push for Catherine Durant to be chosen as his running mate, but privately pursue a different agenda.	\N	7.88	2016-03-04 05:00:00	Chapter 48	1425
391	1	/pLarLmlsGWE0kgK7UWB2z3NCPl7.jpg	As Frank deals with a new threat to his candidacy, Claire has doubts about their plan. Claire faces a difficult decision concerning her mother.	\N	8.20	2016-03-04 05:00:00	Chapter 49	1425
392	1	/2yqQTueyjgqW3khdVXuV9CtEWif.jpg	Frank ups the ante on the war on terror to counter Conway's public show of strength. Tom joins Claire on the campaign trail.	\N	7.77	2016-03-04 05:00:00	Chapter 50	1425
393	1	/wcJuWSQ6kKNwHJAZgoczDXjX4lS.jpg	Frank asks Will to help deal with extremists threatening to murder hostages. Hammerschmidt digs deeper into the allegations against Frank.	\N	8.00	2016-03-04 05:00:00	Chapter 51	1425
394	1	/kKtoxmVKX0wSSKM3xnlIkx31v5z.jpg	As the hostage situation continues, Claire secretly negotiates with Yusuf al Ahmadi. Frank confronts Hammerschmidt.	\N	8.52	2016-03-04 05:00:00	Chapter 52	1425
395	1	/xaYAGAQwpsYhLdX9JKTaGI2zgCE.jpg	Season five picks up where it left off: in the midst of a tense presidential election that puts the Underwoods on the same ticket against energetic Republican upstart Will Conway. Viewers will see how their heated campaigns play out as well as which alliances dissolve in the aftermath. Perhaps the biggest question is if Frank and Claire’s relationship is among them.	\N	8.13	2017-05-30 04:00:00	Season 5	1425
396	1	/1Xn58CmmTOHnzxOUK1VvuoyYrjR.jpg	As Congress debates investigating Frank, he and Claire attempt to stoke fear of terrorism. Tom Yates continues his stay in the White House.	\N	7.84	2017-05-30 04:00:00	Chapter 53	1425
397	1	/kXDHOaaJfZGITHckOvtiXAhNogm.jpg	Frank and his team work to leverage support in key states by any means necessary. Claire learns some upsetting news about one of Frank's friends.	\N	7.74	2017-05-30 04:00:00	Chapter 54	1425
398	1	/A3SE9uT3RmdCUibnWU9LOkf9eB3.jpg	The day before the election, Conway holds a 24-hour Skype session with voters, while Frank and Claire stump in key states and try to discredit him.	\N	7.69	2017-05-30 04:00:00	Chapter 55	1425
399	1	/fpDX6Z3ZP8FWMJsjsN1i1G1Hw41.jpg	With a tight race and low voter turnout on Election Day, things look grim for Frank. But he's still got one more trick up his sleeve.	\N	7.87	2017-05-30 04:00:00	Chapter 56	1425
400	1	/pfFo1NJCKnoSugAgwqvjsRteX4t.jpg	Nine weeks after Election Day, the Underwoods work to consolidate their power. Leann tries to track down a missing Aidan Macallan.	\N	7.69	2017-05-30 04:00:00	Chapter 57	1425
401	1	/jTry9NWJOrF33vBjJTmnmMHvDNZ.jpg	In the midst of uncertainty, suspected Russian forces take over an American station in Antarctica. Meanwhile, a damaging news leak could hurt Frank.	\N	7.63	2017-05-30 04:00:00	Chapter 58	1425
402	1	/1Qf2vfDj2DVdAnexu6PMNsUji1e.jpg	When a crisis forces White House personnel to take shelter in a bunker, Commerce Department official Jane Davis negotiates through back channels.	\N	7.84	2017-05-30 04:00:00	Chapter 59	1425
403	1	/iF36sfyjNGzVWBBMZ16hmOcWe8C.jpg	While Frank attends an elite men's weekend gathering to firm up support, Claire deals with a stranded Russian ship and threats from Petrov.	\N	7.69	2017-05-30 04:00:00	Chapter 60	1425
404	1	/8MOQrYJzzq7kflbQibWCaPPm370.jpg	Petrov tries to influence affairs in the U.S. Jane discusses her agenda with Claire. With her job at stake, Leann reaches out to a reporter for help.	\N	7.68	2017-05-30 04:00:00	Chapter 61	1425
405	1	/xFY41KgBD9tgrp9uXzWbQiXqamv.jpg	The Underwoods and their team angle to undermine the revived committee investigating Frank. Hammerschmidt's investigation heats up.	\N	7.77	2017-05-30 04:00:00	Chapter 62	1425
406	1	/fFFuFSpMuAJKmYyjyWZq7X2By9G.jpg	As the team tries to control fallout from damaging testimony and leaks, everyone is under suspicion and tensions flare between Frank and Claire.	\N	7.81	2017-05-30 04:00:00	Chapter 63	1425
407	1	/8QTtCMqMY5u9CMFNrTYSBlWgrNV.jpg	Frank attempts to stop Cathy from testifying. With Hammerschmidt sniffing out the truth, the Underwoods throw someone close to them under the bus.	\N	8.17	2017-05-30 04:00:00	Chapter 64	1425
408	1	/mbQqlUn5sAggVOM4WdWEN060RaI.jpg	In the wake of a surprising announcement, everything at the White House is shaken up. A decision must be made about whether to go to war. 	\N	8.14	2017-05-30 04:00:00	Chapter 65	1425
409	1	/cCDuZqLv6jwnf3cZZq7g3uNLaIu.jpg	A horrifying zombiocalypse spin-off series from The Walking Dead, set in the same universe but starting at a far earlier time in Los Angeles. The show follows normal people learning to deal with the rapidly growing collapse of civilization, at the very beginning of a zombie outbreak.In Los Angeles, a city where people come to escape, shield secrets, and bury their pasts, we follow this mysterious outbreak as it threatens to disrupt what little stability high school guidance counselor Madison Clark and English teacher Travis Manawa have managed to assemble. The pressure of blending two families while dealing with resentful, escapist, and strung out children takes a back seat when society begins to break down. A forced evolution, and survival of the fittest takes hold, as our dysfunctional family finds they must either reinvent themselves or embrace their darker histories.	\N	7.31	2015-08-23 04:00:00	Fear the Walking Dead	62286
410	1	/i2bXSzpKWw0RVmLdldhBFT3a0Ty.jpg	\N	\N	7.34	2015-08-24 01:00:00	Season 1	62286
411	1	/AqVgGJBEiboLcEvrORj825asXaQ.jpg	A highly dysfunctional blended family is forced together when they realize a reported virus is actually the onset of the undead apocalypse.	\N	7.48	2015-08-24 01:00:00	Pilot	62286
412	1	/ucJSgfXGSUXllKkUXj5VSeuzTjY.jpg	While Madison struggles to keep Nick from crippling withdrawal, Travis ventures out to find his son before the city of Los Angeles falls.	\N	7.58	2015-08-31 01:00:00	So Close, Yet So Far	62286
413	1	/h549fQfrFm4VAstYHuiN4pBQKQF.jpg	After they escape a riot, Travis, Liza and Chris seek refuge with the Salazars. Madison defends her home.	\N	7.60	2015-09-14 01:00:00	The Dog	62286
414	1	/4RQkvl5d7E9Bzy8Xb9PHX609bsA.jpg	Madison and Travis see different sides of the National Guard's occupation in their neighborhood; the family tries to adapt to the new world.	\N	7.52	2015-09-21 01:00:00	Not Fade Away	62286
415	1	/mch2M5E6ep67gIIcjV9GPc5AnJZ.jpg	The National Guard's plan for the neighborhood is revealed. Meanwhile, Travis and Madison make a difficult decision.	\N	7.55	2015-09-28 01:00:00	Cobalt	62286
416	1	/eeZsNbAxVsysrLOk0HMDUrZVMQf.jpg	As civil unrest grows, and the dead take over, Travis and Madison try to devise ways to protect their families.	\N	7.91	2015-10-05 01:00:00	The Good Man	62286
417	1	/qMwcN9GFKmETQViGl6268jCyyXi.jpg	\N	\N	7.08	2016-04-11 01:00:00	Season 2	62286
418	1	/xbi94WOnv8nFKNDipP3OaAC58pz.jpg	After fleeing a burning Los Angeles on Strand's yacht, tensions arise among the group. Strand remains mysterious. Our group encounters danger at sea.	\N	7.37	2016-04-11 01:00:00	Monster	62286
419	1	/9Yb6TGfo8YfYIc8oRRCi86Ga9bA.jpg	The group seeks shelter with a survivalist family and Madison tries to uncover the family's true motives. Salazar works to discover Strand's intentions.	\N	7.42	2016-04-18 01:00:00	We All Fall Down	62286
420	1	/iOSxUesOZD9a1lTC508lk0e97z3.jpg	Madison confronts Strand about his mysterious destination. Nick, Alicia and others inspect wreckage from a plane crash.	\N	7.52	2016-04-25 01:00:00	Ouroboros	62286
421	1	/qpStK1MQtA5AUrhjgd0PvC0ZDCU.jpg	The group lets a family in distress board the Abigail. Strand's past begins to come to light. Nick looks for an associate of Strand.	\N	7.61	2016-05-02 01:00:00	Blood in the Streets	62286
422	1	/seXoGUWAZ6DMSMQw4VlZPf5zjfa.jpg	Alicia works toward reuniting with her family. Travis comes across a familiar face. Madison and Nick try to save their family against all odds.	\N	7.52	2016-05-09 01:00:00	Captive	62286
423	1	/niX3UGNmPZOVw8h0v4t7jXcL8eU.jpg	As Abigail arrives at her destination, conflicts arise. Chris makes a shocking decision. Nick knows a new mother figure.	\N	7.47	2016-05-16 01:00:00	Sicut Cervus	62286
424	1	/xcqecmQFHLAMFPC0z5Q1n3qN56F.jpg	The family faces their biggest test yet; Nick, Madison, Travis and others try to stay close to each other.	\N	7.37	2016-05-23 01:00:00	Shiva	62286
425	1	/aUH2ItdbHS3kPxfWwitkBKkR4kf.jpg	Nick's search for answers leads him into a deadly dog-eat-dog landscape. A dark time from his past is uncovered.	\N	7.29	2016-08-22 01:00:00	Grotesque	62286
426	1	/xlsY4gXwX8QAH5H3ODGfNcCPkrF.jpg	After the fall of the compound, Madison, Strand and others forge a tenuous path forward.  Meanwhile, Nick is recruited for a perilous assignment.	\N	7.42	2016-08-29 01:00:00	Los Muertos	62286
427	1	/qFEZHshhf0QsSteUzu3PFYgOLL0.jpg	Travis struggles to connect with Chris while searching for shelter.  Meanwhile, Alicia meets a lonely woman with a bloody past.	\N	7.60	2016-09-05 01:00:00	Do Not Disturb	62286
428	1	/p3MLwCdUOcNK1X0vH0jlh7fcQdI.jpg	Alicia and Madison try to bring two competing factions together; Nick uses skills from his past for his new role.\n	\N	7.55	2016-09-12 01:00:00	Pablo & Jessica	62286
429	1	/nlRGmFzgqyl0vyJ0TjvWtFEDCmh.jpg	Madison springs into action when one of the hotel residents gets violent.  Meanwhile, Alejandro shows a darker side of himself at the Colonia.	\N	7.50	2016-09-19 01:00:00	Pillar of Salt	62286
430	1	/bJDbkqfgPyf1UI8tYXC9dGE1kkV.jpg	Madison struggles to cope as a large number of refugees flood into the hotel, including someone familiar but unexpected.	\N	7.41	2016-09-26 01:00:00	Date of Death	62286
431	1	/ymHnr9axhOlkSn2urQvAqvnz05o.jpg	Travis is thrown off by new refugees; Nick must decide if he's going to stay at the Colonia with Luciana or leave.	\N	7.91	2016-10-03 01:00:00	Wrath	62286
432	1	/u6G7ItO8Bn9eFg9l7vpu44nQokm.jpg	Season finale. When Travis' rage causes unrest at the hotel, Madison has to choose whether or not she will stand by him; Nick becomes leader of the Colonia as Narcos close in.	\N	7.82	2016-10-03 01:00:00	North	62286
433	1	/cMh46P517YVBedpMtO3ucBvK1jM.jpg	\N	\N	8.63	2017-06-05 01:00:00	Season 3	62286
434	1	/ibvKh25Zudki90LYVGzkA0m9qvX.jpg	In the third season opener, the Clark family find themselves in a dire predicament and must work together to discover a path to safety.	\N	7.69	2017-06-05 01:00:00	Eye of the Beholder	62286
435	1	/qc9LbqdSOKoKgx24iIBBXr5wjSz.jpg	Following a harrowing journey, the Clark family arrive at their new home; and Strand faces resistance as he attempts to hold power over his domain.	\N	7.64	2017-06-05 01:00:00	The New Frontier	62286
436	1	/9wp7BHmCcmz9EnT9nwUiLa5O2qb.jpg	Still finding their place, Alicia and Nick fall in with new crowds while Madison discovers Otto's past mimics that of her own.	\N	7.57	2017-06-12 01:00:00	TEOTWAWKI	62286
437	1	/uXwWHomxsCoSj80YO67Z1jELxff.jpg	A mysterious character searches for purpose and soon becomes tied to the struggle over a key resource in the apocalypse.	\N	7.87	2017-06-19 01:00:00	100	62286
438	1	/hXpNjQXE2V01E0AiKCHhhzpPUeb.jpg	An oncoming threat disrupts peace; Madison and Troy search for answers; Alicia must reconcile with her past.	\N	7.67	2017-06-26 01:00:00	Burning in Water, Drowning in Flame	62286
439	1	\N	Loyalty wavers at the Ranch; news of incoming danger spreads in the community; Madison struggles to keep everyone together; Nick grapples with a hard truth.	\N	7.80	2017-07-03 01:00:00	Red Dirt	62286
440	1	\N	A new arrival sows a divide within the ranch. Meanwhile, Alicia forms a new relationship in hopes of maintaining peace.	\N	8.00	2017-07-10 01:00:00	The Unveiling	62286
441	1	\N	Madison must negotiate the terms of an agreement in the midst of ranch-wide turmoil; and Nick and Alicia challenge their mother's motives.	\N	3.67	2017-07-10 01:00:00	Children of Wrath	62286
442	1	/oWYOFBvIMkW64n51uD4mdje6k2u.jpg	The six-person crew of a derelict spaceship awakens from stasis in the farthest reaches of space. Their memories wiped clean, they have no recollection of who they are or how they got on board. The only clue to their identities is a cargo bay full of weaponry and a destination: a remote mining colony that is about to become a war zone. With no idea whose side they are on, they face a deadly decision. Will these amnesiacs turn their backs on history, or will their pasts catch up with them?	\N	7.67	2015-06-13 04:00:00	Dark Matter	62425
443	1	/yJyjf5EZkOajfcT5SJ4zZwpVCG8.jpg	Six strangers wake up with total amnesia on a spaceship. Over the course of the first season, they piece together their former identities while battling internal and external threats. By the end of the season, a traitor amongst them - the person that wiped their memories - is revealed.	\N	7.90	2015-06-13 02:00:00	Season 1	62425
444	1	/s5hgi2fUYr4tS8lO2PQbZmJHkxd.jpg	Six strangers awake amnesic on a marooned and damaged spacecraft. Quickly however they discover their personal talents and from there struggle to understand who they are and what has happened to them.	\N	7.40	2015-06-13 01:00:00	Episode One	62425
445	1	/jtmtr5WUYozHH6V65vlkHXuUi6n.jpg	The motley crew discover a small mining colony on a planet that happens to be the target of big corporations. Discovering their identities brings each one to question who they really are.	\N	7.35	2015-06-20 01:00:00	Episode Two	62425
446	1	/8B98ChE0j5QOqkrELd89EGE9VUX.jpg	When the ship mysteriously veers off course, suggestions of sabotage abound, fueling the onboard paranoia. A perilous spacewalk is required to bring the ship’s systems back online.	\N	7.34	2015-06-27 01:00:00	Episode Three	62425
447	1	/w0zhlFyee3AE7venCV3z786oI1e.jpg	The past comes back to haunt members of the crew during a stopover at a space station, during which Four makes a stunning discovery, while Two and Five learn that some games of chance come with surprising risks. Elsewhere, Six receives some unwanted attention at a local clinic; and One and Three's attempts to sell the weapons in their cargo hold lands them at a dangerous disadvantage.	\N	7.38	2015-07-04 01:00:00	Episode Four	62425
448	1	/qX1jJ26TI2CHsqDgOMUZrUFA5qm.jpg	The crew members find themselves trapped on a freighter with victims of a plague. Will someone on the team be infected by that terrible plague? \n	\N	7.47	2015-07-11 01:00:00	Episode Five	62425
449	1	/mlRRxZNJMctDUyiX12cWwMCAe21.jpg	Chemical hypnosis and the ship's neural link are used to explore the memories secreted away in Five's subconscious, during which she uncovers the dark truth about Four and Six's violent pasts. She also learns about the circumstances that landed her on the ship and gains some insight into the idyllic childhood of a mysterious little boy.	\N	7.48	2015-07-18 01:00:00	Episode Six	62425
450	1	/h9LZl4HOqaLHoJh5SvjzUwVRvyG.jpg	The crew finally gain access to the secret room in the ship's underbelly and among the items they find inside are a sunny android and a desperately ill woman who reveals a connection to Three.	\N	7.60	2015-07-25 01:00:00	Episode Seven	62425
451	1	/xYUAvIP03DIpDc8PLpnUirtHZlJ.jpg	The crew stop at a space station to refuel and rest, but Six has a different agenda, which has to do with revenge. Meanwhile, One is taken aback by an unwelcome revelation.	\N	7.60	2015-08-01 01:00:00	Episode Eight	62425
452	1	/3hoG6ui2KCvduEskBGTQahWoznJ.jpg	Four abandons the ship to embark on a reckless mission to reclaim his past and the crew are left wondering whether they should rescue him or let fate run its deadly course.	\N	7.58	2015-08-08 01:00:00	Episode Nine	62425
453	1	/liWa77KuIoBpTVJwEwZ4xtQa69o.jpg	The crew takes on a job stealing a device from a rival corporation, but another team of mercenaries have the same goal.	\N	7.67	2015-08-15 01:00:00	Episode Ten	62425
454	1	/rMbh0U1laQTyWkNYQuQ1K6e3aqc.jpg	The crew plots to reclaim the ship from the mercenaries that are determined to deliver them to the Galactic Authority.	\N	7.91	2015-08-22 01:00:00	Episode Eleven	62425
455	1	/3v3eDnm9zMwFhvIALRu4L5PfyfH.jpg	The team's handler sends the crew on another mission to retrieve a scientist being held against his will.	\N	7.72	2015-08-29 01:00:00	Episode Twelve	62425
456	1	/hpuMLsdKRr8gbRL2Wonok87cUYl.jpg	Crew members are targeted, and paranoia mounts as they search for the perpetrator; the person responsible for the mind-wipe makes a move.	\N	7.93	2015-08-29 01:00:00	Episode Thirteen	62425
457	1	/gdstJAqRq4cGialTj1xkOLKAWkd.jpg	In Season 2, the crew of the Raza becomes embroiled in an intergalactic conspiracy, seeking a mysterious device that may hold the key to victory in a looming all-out corporate war. In the aftermath of the betrayal of one of their own, they are split up - some imprisoned, others shuttled off to begin a new life. Fate, new allies and a larger enemy propels them to a new adventure.	\N	7.93	2016-07-02 02:00:00	Season 2	62425
458	1	/66hwm1OWfMlbcS2Qpp9Ug8wa4SI.jpg	The crew awakens to find themselves prisoners on the Hyperion-8 Maximum Security Galactic Detention Facility.	\N	7.66	2016-07-02 01:00:00	Welcome to Your New Home	62425
459	1	/qL49IXlCt0vyI3RxHnFhVx8lKFy.jpg	Imprisoned in Hyperion-8, the crew must negotiate attempted assassinations, extraditions, and behind-the-scenes machinations as they plot their escape.	\N	7.81	2016-07-09 01:00:00	Kill Them All	62425
460	1	/m02rV3hNk8ztTDKV0WTTz8IHper.jpg	The neural link triggers a dangerous glitch and the crew start to turn against each other while hiding out in empty space in an effort to lose the GA.	\N	7.65	2016-07-16 01:00:00	I've Seen the Other Side of You	62425
461	1	/ocsrZvu0j6AAIETfVRgLybrjLm8.jpg	Three manages to reconnect with his former crew. The Android ends up in some unique company.	\N	7.70	2016-07-23 01:00:00	We Were Family	62425
462	1	/p8ik3oGleFlOoWsrmiXYdgu2hJt.jpg	The Android goes undercover to try and help the crew track a dangerous, yet familiar, foe.	\N	7.73	2016-07-30 01:00:00	We Voted Not to Space You	62425
463	1	/h7D8hqJTe12kffO2R1rtvaTo0Ki.jpg	Desperate for money, the Raza crew follow Nyx's lead on an op, only to discover that their target is a personal one.	\N	7.61	2016-08-06 01:00:00	We Should Have Seen This Coming	62425
464	1	/kfPzYq0bWJGJJz5k0cuTOEblIbZ.jpg	Three crew members infiltrate a highly secure facility with the help of their handler.	\N	7.70	2016-08-13 01:00:00	She's One of Them Now	62425
465	1	/iE7PBFjVnBHm7DnjUSYa3ia0rGJ.jpg	A Blink Drive test goes awry, propelling the Raza to a parallel reality.	\N	7.73	2016-08-20 01:00:00	Stuff to Steal, People to Kill	62425
466	1	/8y7B8Vvv0Der3CHy5kuNF6b8qhZ.jpg	The crew takes a dangerous mission inside Dwarf Star Technologies in a desperate bid to save their ailing leader.	\N	7.81	2016-08-27 01:00:00	Going Out Fighting	62425
467	1	/sIOPxq2x2A2aNIVWYlrPFmx9Vo0.jpg	Mayhem on the ship sheds light on some crew members' dark pasts.	\N	7.72	2016-09-03 01:00:00	Take the Shot	62425
468	1	/u5ePMl1g6ELmWV29uRGMalVq3Zo.jpg	The crew races against time to track down and locate a missing Three and Five before the Galactic Authority gets to them first.	\N	7.73	2016-09-10 01:00:00	Wish I'd Spaced You When I Had the Chance	62425
469	1	/lt7KFCtiLDTxpI09Y6ypGNhD1S7.jpg	Four's loyalty is put to the test when he attempts to reclaim the throne of Ishida.	\N	8.10	2016-09-10 01:00:00	Sometimes in Life You Don't Get to Choose	62425
470	1	/AdEVwSBxRFTl8sIglXDB9ZqBdXd.jpg	The crew of the Raza works to prevent the destruction of a space station and prevent an all out corporate war.	\N	8.03	2016-09-17 01:00:00	But First, We Save the Galaxy	62425
471	1	/t5cN1LwdTeRe76kfnOpaCp3mvNV.jpg	Who's dead? Who's not? Our anti-heroes are left scattered and presumed to be dead as the corporations prepare for an all-out war. Buck up! We're in for one hell of a fight, team!	\N	8.71	2017-06-10 00:00:00	Season 3	62425
472	1	/khROBjWwx5TuxZDqamge8j2HXi7.jpg	The scattered survivors of EOS-7 battle to regroup amidst the backdrop of corporate war. Ryo Ishida, now emperor of Zairon, makes an enemy of his former allies, while the past comes back to haunt the crew of the Raza.	\N	7.85	2017-06-10 01:00:00	Being Better Is So Much Harder	62425
473	1	/ghzdRFc2UDiwpuEUzSufF5soBDt.jpg	The crew of the Raza target an Ishida research station in an attempt to take back the Blink Drive.	\N	7.85	2017-06-10 01:00:00	It Doesn't Have to Be Like This	62425
474	1	/uPTf3pLcdaxaMqzfJk9HHV7ZPHN.jpg	After receiving a distress call from a former associate, the crew of the Raza find themselves in the middle of a colony's fight for independence.	\N	7.74	2017-06-17 01:00:00	Welcome to the Revolution	62425
475	1	/ekIugbG2Hm9QlxKmjuzZTDwqFOB.jpg	Unbeknownst to the rest of the crew THREE has been trapped in a time loop, reliving the same day over and over. He must convince his crew mates that what's happening to him is real and find a way to stop the loop. Meanwhile, a mysterious mercenary infiltrates the Raza and THREE must deal with Sarah's new reality.	\N	7.97	2017-06-24 01:00:00	All the Time in the World	62425
476	1	/uWG6b3pasQ0LJBTA1E0RhgfCe6Z.jpg	A friend of Adrian's is taken captive by one of Tabor's rivals, demanding a specific data file in exchange for her release. When the crew discover that the file contains information about the construction of a secret Ferrous battle fleet, they agree to help in exchange for the file. The only problem is Adrian isn't exactly sure where Tabor hid the data file.	\N	7.84	2017-07-01 01:00:00	Give It Up, Princess	62425
477	1	/nis2GhVEfkLeE5qjo0RN8GgntuW.jpg	Familiar faces from the past return, causing havoc and forcing the crew to scramble to save their already damaged reputations.	\N	8.00	2017-07-08 01:00:00	One Last Card to Play	62425
478	1	\N	\N	\N	0.00	2017-07-15 01:00:00	Wish I Could Believe You	62425
479	1	\N	\N	\N	9.00	2017-07-22 01:00:00	 Hot Chocolate	62425
480	1	\N	\N	\N	5.00	2017-07-29 01:00:00	Isn’t That a Paradox?	62425
481	1	\N	\N	\N	0.00	2017-08-05 01:00:00	Built, Not Born	62425
482	1	\N	\N	\N	9.00	\N	The Dwarf Star Conspiracy	62425
483	1	\N	\N	\N	0.00	\N	My Final Gift to You	62425
484	1	\N	\N	\N	0.00	\N	Nowhere to Go	62425
485	1	/yET48smELUDAszOhHbL9A8RF3N8.jpg	A streetwise hustler is pulled into a compelling conspiracy after witnessing the suicide of a girl who looks just like her.	\N	8.54	2013-03-30 04:00:00	Orphan Black	56296
486	1	/jUh8JR2jvm4mFSvF6boaffxtUN4.jpg	\N	\N	8.84	2013-03-31 02:00:00	Season 1	56296
487	1	/qqQRdCNG3wGYIACkvm1zrjsjU27.jpg	Sarah, a streetwise hustler on the run from a lifetime of bad decisions, witnesses the suicide of a stranger who looks just like her. Sarah assumes her identity, hoping that cleaning out the dead woman’s bank account will solve all of her problems. Instead, the street smart chameleon is thrust headlong into a kaleidoscopic mystery. After taking on the new identity, Sarah quickly finds herself caught in the middle of a deadly conspiracy and must race to find answers.	\N	7.96	2013-03-31 02:00:00	Natural Selection	56296
488	1	/iSmtsq610j7dwYxLtKaxfoplM3z.jpg	With a body in her car and nowhere to turn, Sarah is forced to continue her con and earn “Beth” a second chance on the force. But with a killer on her tail, her only hope of finding answers lies with another apparent ‘identical,’ Alison.	\N	8.01	2013-04-07 02:00:00	Instinct	56296
489	1	/ps3taitT6QJD9NW1VqgdBETHNpO.jpg	Rocked by the revelation that she and her fellow "Orphans" are clones, Sarah just wants to get her hands on the money and skip town. But Sarah’s fake detective ruse stretches thin when the cops find the body she buried and assign “Beth” to the case. As Sarah closes in on the killer, the hunter becomes the hunted.	\N	8.03	2013-04-14 02:00:00	Variation Under Nature	56296
490	1	/aOGvlzLt7qs3HrUFdthtDEPMvZ9.jpg	Sarah realizes that the Orphans’ survival is going to take more than police work. But tracking the killer threatens Sarah’s long awaited reunion with her daughter, Kira. As Sarah gets closer to the killer, the killer gets closer to the truth – the ensuing showdown threatens to expose her ruse as a cop.	\N	8.05	2013-04-21 02:00:00	Effects of External Conditions	56296
491	1	/fIMvDLk4gbZnxFEoT8KkknLCaFp.jpg	When terrifying evidence suggests the Orphans are part of a sinister ongoing experiment, Sarah’s suspicions turn to Paul, Beth’s boyfriend. But her probing inadvertently triggers Paul’s own investigation, bringing him dangerously close to the truth. Meanwhile, paranoid Alison piles on a whole new level of complication.	\N	8.21	2013-04-28 02:00:00	Conditions of Existence	56296
492	1	/9zLRdKPArNQAhvpO4RHfZpcZSLY.jpg	Sarah’s hunt for answers is interrupted by a trip to the suburbs. Alison’s paranoia has boiled over, putting all the Orphans at risk. But when Sarah, Alison and Beth’s worlds dangerously collide, Sarah must decide who to trust with her secret.	\N	8.20	2013-05-05 02:00:00	Variations Under Domestication	56296
493	1	/lNFPFxjIxou7LYBEAjmTshyouxG.jpg	With Paul missing, Sarah is forced to confront the conspiracy head on. But when Paul learns Sarah has kept essential information from him, the fragile trust between them threatens to shatter. Meanwhile, Cosima grows closer to Delphine and the dangerously fascinating Dr. Leekie.	\N	8.19	2013-05-12 02:00:00	Parts Developed in an Unusual Manner	56296
494	1	/et8KVX0rT7I2iBiCGt4shcF2qs4.jpg	Sarah's actions pit the Orphans against each other as she tries to plan her next move. As Paul tries desperately to cover up Sarah’s existence, Alison takes vengeance on her suspected monitor, which could cost her everything she holds dear.	\N	8.30	2013-05-19 02:00:00	Entangled Bank	56296
495	1	/akweKZlaOMRwlSxR9CJmxJEkS4m.jpg	After Kira’s life is threatened, Sarah is on the warpath, but Dr. Leekie makes her think twice about her plans for revenge. Meanwhile, Cosima faces the truth about Delphine, forcing her to choose sides. Now, it’s up to Sarah to decide the killer’s fate, but the truth about where Sarah came from changes everything.	\N	8.37	2013-05-26 02:00:00	Unconscious Selection	56296
496	1	/1ffb6UusaLfdhG6m0VubeIehin3.jpg	Sarah’s last chance to bring her nemesis back to sanity slips away as Art intervenes to get answers of his own. Meanwhile, the Orphans must decide whether to make peace with their creators, as Sarah is forced into a deadly confrontation with their enemy.	\N	8.62	2013-06-02 02:00:00	Endless Forms Most Beautiful	56296
497	1	/vdDHuoApZuRJG3J4LWPI5EHsn7W.jpg	\N	\N	8.52	2014-04-20 02:00:00	Season 2	56296
498	1	/dfd0sgovrGnXVFHaaeFfVpbx76H.jpg	Sarah is out of options, on the run, and pursued by deadly adversaries. Desperate to find her daughter Kira, Sarah suspects ruthless pro-clone Rachel is behind her daughter’s disappearance and sparks an all out war against her.	\N	8.14	2014-04-20 02:00:00	Nature Under Constraint and Vexed	56296
499	1	/nygDnYHLX4o3o11S7hZTpTND9sU.jpg	While Alison struggles with Aynsley's death and Cosima grapples with the worsening symptoms of her mysterious sickness, Sarah enlists Art’s help to find Kira and is shocked when she learns where the trail leads.	\N	8.01	2014-04-27 02:00:00	Governed By Sound Reason and True Religion	56296
500	1	/h7haR9my4M8uRgFlwxQ1LoHkQBo.jpg	After hitting the road with Felix, Sarah is forced to turn to a ghost from her past — an old flame named Cal Morison. When their brief respite is brutally shattered, Sarah realizes that no matter how far she runs, it will never be far enough.	\N	7.99	2014-05-04 02:00:00	Mingling Its Own Nature with It	56296
501	1	/bt0GcvvoTGGa8pDNKCreX74usBI.jpg	Sarah comes home looking for answers, and with the help of Cosima, they begin digging into the origins of the clone experiment. The hunt for answers takes her right into the belly of the beast, but getting out could cost her more than she knows.	\N	8.16	2014-05-11 02:00:00	Governed As It Were By Chance	56296
502	1	/oVTbOWc9TP1NKMbSJh24aBE40Hs.jpg	Rachel goes on the warpath, lashing out at Sarah’s nearest and dearest. While she tries to keep her loved ones safe, an unexpected visitor threatens to derail Sarah’s plans.	\N	8.05	2014-05-18 02:00:00	Ipsa Scientia Potestas Est	56296
503	1	/v0iLczarq36PzfTAKvMVwUdtbkE.jpg	Sarah joins forces with an unlikely and untrustworthy ally, following a trail of clues that she hopes will lead her to the origins of the clone experiment. Cosima and Delphine make a discovery that could prove to be the key to treating her illness. Alison finds herself in unsavory company at rehab.	\N	8.05	2014-05-25 02:00:00	To Hound Nature in Her Wanderings	56296
504	1	/9Q3v8YZp32gTN2ISueWzaE1QsPa.jpg	When a rehab confidante betrays Alison and threatens to expose the truth about Aynsley’s death, she goes into free fall on the eve of Family Day. With Donnie and the kids set to visit, it’s all clones on deck to contain the fallout.	\N	8.19	2014-06-01 02:00:00	Knowledge of Causes, and Secret Motion of Things	56296
505	1	/tLUsH9vCPjwlSLZAphr3Q6oKKU0.jpg	A new player in the clone conspiracy turns up at Felix’s door, sending him into crisis mode. With Cosima running out of options, Sarah struggles with the decision to surrender a crucial piece of leverage and make a deal with Dyad.	\N	8.01	2014-06-08 02:00:00	Variable and Full of Perturbation	56296
506	1	/9wWZvOzUhcO8pW6rS76QEjr9fgt.jpg	Cosima takes a turn for the worse, forcing Sarah to take desperate action which results in tragic consequences for those she loves. The Proletheans set their ultimate plan in motion, while Alison and Donnie tangle with the law.	\N	8.22	2014-06-15 02:00:00	Things Which Have Never Yet Been Done	56296
507	1	/a7abpHjrOuOAaYP1Leb7LtbVutk.jpg	The war with Dyad is all but lost when Rachel’s latest ploy forces a broken Sarah to concede. The Clone Club springs into action, uniting in a reckless gambit to save Sarah. As they fight to gain their freedom, Sarah encounters a new ally and uncovers a terrifying new dimension to the conspiracy.	\N	8.46	2014-06-22 02:00:00	By Means Which Have Never Yet Been Tried	56296
508	1	/vhG5V9GBLoOxSwNdvvln8ru9hHd.jpg	\N	\N	8.39	2015-04-19 02:00:00	Season 3	56296
509	1	/xQLJo5J2tx348SLHX2iFJSTKLSD.jpg	Sarah pursues the missing Helena who is held in a faraway compound. Sarah must use her wiles – and acting chops – to deter a Topside investigator who threatens the Leda sisters’ lives. Meanwhile, Cosima appears to be rebounding from her illness, while Alison and Donnie face newfound financial woes. But when the menace of Castor rears its head once more, Sarah and her entire family must come together to survive.	\N	7.79	2015-04-19 02:00:00	The Weight of This Combination	56296
510	1	/dXppe0PjUEMmTymratnvVYZuxea.jpg	Castor pursues the Leda clones for original tissue samples. Helena, who is pregnant and imprisoned, is examined by a mysterious new villain. The Castor boys are also out to play, toying with a frightened young woman, Patty, in a sexy switcheroo that ultimately sets Sarah – and Art – hot on the Castor trail. But it’s not all fun and games for the Castor boys, as Sarah gleans they may have a mysterious defect that puts their lives in peril.	\N	7.67	2015-04-26 02:00:00	Transitory Sacrifices of Crisis	56296
511	1	/y8q1HRMDIgn7p0BrVqdnFdGpCJp.jpg	Leda and Castor are both on the hunt for original clone DNA. On-the-lam, Mark and Gracie pursue new leads to find the samples that might set them free, while Art and Sarah reunite to track them down. Meanwhile, Cosima and Scott try to learn more about Castor’s biology and Alison’s new money-making venture is going gangbusters. A shocking revelation about the Castor-Leda connection leaves the sisters reeling, just before Sarah witnesses a deadly Prolethean-Castor face-off.	\N	7.77	2015-05-03 02:00:00	Formalized, Complex, and Costly	56296
512	1	/g2gRrXfn1cHozs5z2r057SkUbww.jpg	Mark is taken down in a Prolethean shoot-out and Sarah must step in to help. But as Sarah gathers intel that puts her on the trail of the original Castor DNA, a familiar foe is not far behind. While Helena continues to toil in a faraway military compound, it is ultimately Sarah’s fate that will hang in the balance as she tries to save her sister. Meanwhile, Gracie is cast out from the Prolethean fold, and Alison and Donnie come face-to-face with unhappy drug lord, Jason Kellerman.	\N	7.79	2015-05-10 02:00:00	Newer Elements of Our Defense	56296
513	1	/5utMPBjiCDA3JUUI8PcmUjabkmh.jpg	Helena and Sarah are reunited at the Castor camp. As Sarah suffers testing, Paul appears to chide her; but his allegiances are beginning to strain. While the Leda family worries about Sarah’s absence, Gracie ‘breaks loose’ under the care of Mrs. S and an unwilling Felix. Cosima falls hard for an internet date, Shay.	\N	7.78	2015-05-17 02:00:00	Scarred by Many Past Frustrations	56296
514	1	/nxfv3ovOaAZeZy0bpj8VkOTStHe.jpg	Paul digs and finds the ugly truth behind the Castor Boys’ logbooks of names, pushing him into action. Meanwhile, Felix is desperate for info on Sarah’s whereabouts, and presses the still-ailing Rachel for any shred of a lead. In order for Donnie and Alison to take their money-making endeavor to the “next level” she must introduce Jason Kellerman to her unique business plan.	\N	8.14	2015-05-24 02:00:00	Certain Agony of the Battlefield	56296
515	1	/4CgSVGOKhrWZoxE8PO6oIhsmCm7.jpg	Alison must secure a store front in order to take her and Donnie’s business to the “next level”. But things don’t go according to plan when her mother, Connie, proves to be a major hindrance. Cosima is facing familiar health issues and calls upon beleaguered Alison for a favor. But with Alison working to save an imperiled Donnie from the merciless hands of a drug lord, it’s Cosima who ends up doing a favor. An unassuming Scott gets closer to the greatest discovery of all, when he sits down with beleaguered clone Rachel.	\N	7.95	2015-05-31 02:00:00	Community of Dreadful Fear and Hate	56296
516	1	/uAbjyb2XIjgkEniDREY8FCRcFiZ.jpg	When Rachel makes a promise to Sarah, it comes with a hefty price. Meanwhile, Helena and Gracie work with the Hendrixes, and Donnie takes Kellerman to task. Over at Castor, Coady and Benchman scheme to track down the Castor Original, and Rudy descends on DYAD for a much needed asset.	\N	8.02	2015-06-07 02:00:00	Ruthless in Purpose, and Insidious in Method	56296
517	1	/tJUpyt96IqxPqt9htnCICxtqmNz.jpg	Sarah, Felix and Mrs. S take a trip with the hopes of tracking down the Castor Original. But they are not alone. Back home, Donnie tries to save the family business when Pouchy defects, but it is Helena who manages to secure a “full refund.” Meanwhile, Cosima becomes suspicious of Shay, and Delphine takes the matter into her own hands. But nothing will ever be the same again when Leda finally finds what they’ve been looking for.	\N	8.10	2015-06-14 02:00:00	Insolvent Phantom of Tomorrow	56296
518	1	/GZ1QrOOoJTi32u9z0y9517IGhz.jpg	As Clone Club races towards the truth, Castor and Topside force Sarah to make uneasy alliances. But there is some rest for the wicked, when Donnie gives Helena an unexpected ‘gift’, and the results of Alison’s candidacy finally come in. Even as team Leda takes a moment to breathe, change is afoot and a life hangs in the balance.	\N	8.31	2015-06-21 02:00:00	History Yet to Be Written	56296
519	1	/iVbdswDOYNXUCn7ywDuZByg1Wd2.jpg	\N	\N	8.58	2016-04-15 02:00:00	Season 4	56296
520	1	/a2UexobEKDFAp70oeKReTbupsjt.jpg	A flashback to Beth Childs' final investigation, days before her suicide.	\N	7.94	2016-04-15 02:00:00	The Collapse of Nature	56296
521	1	/7K5uMbCyJDVjUaJiWB5EMMnW5BH.jpg	After evading a Neolution attack in Iceland, Sarah returns home to track down an elusive new ally. As Cosima struggles with Delphine’s disappearance, Alison and Donnie host a pregnant and ever-hungry Helena. Meanwhile Felix, feeling like an outsider, embarks on his own journey of self-discovery.	\N	7.99	2016-04-22 02:00:00	Transgressive Border Crossing	56296
522	1	/mfwHFxg1OTIi7HVSkUzSQ6AYoYj.jpg	As Sarah reels from the shocking discovery of Neolution’s biotech, she’s desperate to find answers. Rachel receives a visit from her keeper and takes a fraught step forward towards recovery. Meanwhile, Helena is mistaken for “Mrs. Hendrix” when she answers a visit from suspicious visitors.	\N	7.87	2016-04-29 02:00:00	The Stigmata of Progress	56296
523	1	/sugDVrxt3iuySnKA5HHJUHxfwgc.jpg	Sarah forms an alliance with a former enemy in hopes of getting to the head of Neolution.  Elsewhere, Allison orders Felix and Donnie to invade a Neolution fertility clinic and a Susan Duncan leaves Rachel to make a devastating decision.	\N	7.84	2016-05-06 02:00:00	From Instinct to Rational Control	56296
524	1	/7601Gx7CzbMiAnIhX3fK7eZskpI.jpg	Sarah’s day off to reconnect with Kira quickly turns into a sleuthing mission aimed squarely at discrediting Felix’s new ties. Cosima steps up with Donnie to further investigate the Neolutionist fertility research center. While Donnie bumps into an all too familiar face, Cosima makes a shocking discovery that leads her into a dangerous encounter.	\N	7.94	2016-05-13 02:00:00	Human Raw Material	56296
525	1	/l3ZjzTCr7wQ94jE1k4wyxEF0M1F.jpg	When Cosima admits doubts about finding a cure in time to save her life, Sarah makes a lone decision that exposes Kendall to those she’s spent years hiding from. Meanwhile, Art and Felix team up to protect naïve clone, Krystal Godderitch, from herself.	\N	8.31	2016-05-20 02:00:00	The Scandal of Altruism	56296
526	1	/xzuQlBmSKjV4HoWhQ8sdbGnhi83.jpg	Sarah regresses to old habits while struggling to cope with the consequences of her decisions —reconnecting with Beth on a dark night of the soul. Back at the lab, Cosima, haunted by vicious memories and news of Delphine, attempts a dangerous Hail Mary to find a cure. At the Hendrixes, Alison is more determined than ever to create normalcy for her kids. As she forges ahead with a birthday party, Donnie is caught in the Neolution crosshairs.	\N	7.84	2016-05-27 02:00:00	The Antisocialism of Sex	56296
527	1	/ti9N3pdtMCzx8LolSZQXItxAYyR.jpg	As Alison is terrified by Neolution threats made against Donnie, Sarah and Mrs. S question her loyalty to her sisters. While Sarah is distracted, Siobhan sneaks out to seek vengeance. Meanwhile, Cosima and Susan Duncan work together in a final attempt to discover a cure.	\N	7.97	2016-06-03 02:00:00	The Redesign of Natural Objects	56296
528	1	/iK75T2MA8w4mXZsxt9WpJtlTFeI.jpg	With Susan Duncan deposed, Sarah finds herself in the same position as Rachel — under the heel of a new HBIC — causing the archenemies to come together for the greater good. Cosima and Susan butt heads on the ethical implications of human experiments. Meanwhile, when the Hendrixes' legal counsel, Adele, further investigates Donnie’s case, she begins to suspect Felix is keeping deep secrets. Helena’s arrival forces Felix to make a difficult decision.	\N	8.12	2016-06-10 02:00:00	The Mitigation of Competition	56296
529	1	/bLzAJggPLEcI3RzImUgLhFgOFZv.jpg	In the season finale, when communication with Cosima is cut off and Neolution appears to be within striking distance, Sarah’s alliance with Rachel goes out the window. Sarah lures a high-level Neolutionist into a trap, and sets out to bring down Neolution once and for all.	\N	8.17	2016-06-17 02:00:00	From Dancing Mice to Psychopaths	56296
530	1	/rbcGVHalO4BSwAAZDifzF78ojtT.jpg	\N	\N	7.89	2017-06-11 02:00:00	Season 5	56296
531	1	/vHwO0KN7q0ZO1pAezT4tFSRYcKJ.jpg	As the fifth and final season opens, Sarah is deeply wounded and struggling to stay alive on the Island. Driven deep into its forest by Neolutionists and worse, she strives to make it far enough to rescue Cosima. Meanwhile, a recovering Cosima reunites with Delphine, but there’s way more going on this Island than Cosima imagined and Delphine can’t give her all the answers she needs. What is clear is that Rachel is now firmly in charge at the right-hand of the 170-year-old founder of Neolution, PT Westmorland. Back home, Neolution puts the screws to Alison and Donnie in their hunt for Helena. The sestras couldn’t be further apart when they need most to be together.	\N	7.87	2017-06-11 02:00:00	The Few Who Dare	56296
532	1	/uq5YRV5SS5LBphPXwULA51xaxej.jpg	Captured by Neolution Sarah receives a damning ultimatum from Rachel: come into the fold, or lose your family. Her decision causes a clash with Kira who begins exploring her own maturity. Meanwhile, Ferdinand struggles to get a handle on Rachel’s new velvet glove mandate in pursuit of the clones. With Neolutionists and Ferdinand watching their every move, Felix brings an old ally into the mix to help his family get Kira to safety. On the Island, Cosima struggles to comprehend the reality of the Neolution myth made real.	\N	7.94	2017-06-18 02:00:00	Clutch of Greed	56296
533	1	/zSsQ0ItTTxaT0uBFd4vX4kHd2lJ.jpg	Stuck on the sidelines with Neolutionists crawling all over her home, Alison seeks to return to her community center, but Bailey Downs has moved on from her. As she flounders to take back some semblance of control, the ghost of friendships’ past rears its handsome head. Art and his new partner show up at the Hendrix residence to continue their search for Helena, forcing Art to make a difficult moral judgement.	\N	7.89	2017-06-25 02:00:00	Beneath Her Heart	56296
534	1	/xPwMtlfoslHohZtsGvTf4lvl2Fx.jpg	Following up on intel from a mysterious source, Mrs. S heads on the road with Sarah to investigate a lead on a Neolution defector. Meanwhile, an unexpected reunion takes place on the island, while Cosima's research leads her to a terrible discovery.	\N	7.79	2017-07-02 02:00:00	Let the Children & the Childbearers Toil	56296
535	1	/v10zeOxPpWvcNUebtrEIFRvo2UR.jpg	While Sarah and Kira spend some well-needed bonding time at home, secrets are unlocked about Kira's special gifts that are surprisingly linked to the island's creature. Meanwhile, Cosima joins Delphine at the mansion for a twisted family dinner.	\N	5.60	2017-07-09 02:00:00	Ease for Idle Millionaires	56296
536	1	/6MOKGTRb2AsvqaJ73lgkAoofuyC.jpg	\N	\N	8.33	2017-07-16 02:00:00	Manacled Slim Wrists	56296
537	1	\N	\N	\N	7.33	2017-07-23 02:00:00	Gag or Throttle	56296
538	1	\N	\N	\N	8.50	2017-07-30 02:00:00	Guillotines Decide	56296
539	1	\N	\N	\N	6.00	2017-08-06 02:00:00	One Fettered Slave	56296
540	1	\N	\N	\N	8.60	2017-08-13 02:00:00	To Right the Wrongs of Many	56296
541	1	/dc5r71XI1gD4YwIUoEYCLiVvtss.jpg	In the high-tech gold rush of modern Silicon Valley, the people most qualified to succeed are the least capable of handling success. A comedy partially inspired by Mike Judge's own experiences as a Silicon Valley engineer in the late 1980s.	\N	8.47	2014-04-06 00:00:00	Silicon Valley	60573
542	1	/hRAfu6K3s4CLyQwRIWCnIbMjASn.jpg	\N	\N	8.39	2014-04-07 02:00:00	Season 1	60573
543	1	/zXr9tjwoL7L3YYKiXjMutwRS20U.jpg	Attending an elaborate launch party, Richard and his computer programmer friends - Big Head, Dinesh and Gilfoyle - dream of making it big. Instead, they're living in the communal Hacker Hostel owned by former programmer Erlich, who gets to claim ten percent of anything they invent there. When it becomes clear that Richard has developed a powerful compression algorithm for his website, Pied Piper, he finds himself courted by Gavin Belson, his egomaniacal corporate boss, who offers a $10 million buyout by his firm, Hooli. But Richard holds back when well-known investor Peter Gregory makes a counteroffer. 	\N	7.67	2014-04-07 02:00:00	Minimum Viable Product	60573
544	1	/phIIdNq3Z0nN61pMzCRwl4XULjw.jpg	After a celebratory party at the Hacker Hostel, Richard and Erlich learn that Peter Gregory won't pay up until they deliver a viable business plan that includes a slimmed-down staff. A desperate Richard hires former Belson underling Jared, and they set about trying to trim the fat. While Gilfoyle and Dinesh prove essential, Big Head's place in the company is less certain.	\N	7.67	2014-04-14 02:00:00	The Cap Table	60573
545	1	/t1kNkW61GFjGjGMBvRWK8GTwEKw.jpg	While Gavin Belson begins to hype Nucleus, a competing compression platform, Richard learns that the name Pied Piper is already registered to a sprinkler company, forcing him to negotiate. Meanwhile, Erlich goes on a vision quest for a new company name, and Peter Gregory proves elusive when one of his companies asks for money.	\N	7.78	2014-04-21 02:00:00	Articles of Incorporation	60573
546	1	/6W2pD1KzIEd6H4fZgem5U739YR0.jpg	At Peter's toga party, Richard drunkenly promises to make Erlich a board member, which he regrets the next morning. After being unassigned at Hooli, Big Head finds others like him who have made careers out of doing nothing. Richard struggles to put Pied Piper's vision into words for a presentation without Erlich; later, he discovers an interesting connection between Peter and Gavin Belson.	\N	7.81	2014-04-28 02:00:00	Fiduciary Duties	60573
547	1	/4PHnrI1ClfFNYjFkRiyJozssurL.jpg	Erlich taps a graffiti artist to design Pied Piper's logo, with predictably controversial results. Meanwhile, Richard learns he doesn't have much time to prepare for a live demonstration at TechCrunch Disrupt; Gavin Belson and Peter Gregory have an unexpected encounter; and Jared works on the company's efficiency. 	\N	7.91	2014-05-05 02:00:00	Signaling Risk	60573
548	1	/n2hm1gEsiDKqRrzgwMxuSJFubT8.jpg	Richard feels threatened when the team hires The Carver a hacker with a notorious reputation, to help with Pied Piper’s cloud. Jared finds himself taken for a ride when he seeks out Peter Gregory’s signature. Erlich and Dinesh compete for the attention of Tara, Gilfoyles visiting girlfriend. Later, Dinesh faces a sexual dilemma.	\N	7.89	2014-05-12 02:00:00	Third Party Insourcing	60573
549	1	/A3lTkdmLWOWPM0uLdXMlZ3QMNv2.jpg	At TechCrunch Disrupt, Richard feels the pressure to finish his demo, but finds himself distracted by a girl he dated briefly, who’s now spreading rumors about him. Jared worries that Monica is taking his place in the company. Dinesh develops a crush on a girl at a neighboring booth. Erlich’s scandalous past connection to one of the judges threatens Pied Piper’s chances.	\N	8.09	2014-05-19 02:00:00	Proof of Concept	60573
550	1	/gszwo9o1s0ooJauSIsgMPrg7RbV.jpg	Poised to compete at TechCrunch Disrupt, the guys of Pied Piper become worried after an impressive presentation by Gavin Belson. As Jared tries to pivot the company, Richard is inspired to make big changes at the last minute. 	\N	8.45	2014-06-02 02:00:00	Optimal Tip-to-Tip Efficiency	60573
551	1	/bzz8eBRsin3skOjd5fzrOkVYJAv.jpg	\N	\N	8.59	2015-04-13 02:00:00	Season 2	60573
552	1	/kudY5SSLMDorfYHS1aS1Qj3Pp4H.jpg	Following their success at TechCrunch Disrupt, the guys of Pied Piper find themselves aggressively courted by every VC in Silicon Valley. With Peter Gregory’s company facing major changes, Monica tries to do what’s best while dealing with new managing partner Laurie, a competitive bigwig who will do anything to hold onto Pied Piper. Later, Richard makes a decision about the company’s future and faces big news from Hooli.	\N	7.72	2015-04-13 02:00:00	Sand Hill Shuffle	60573
553	1	/ur0UstXr684QEByv415kzEuuW42.jpg	In the wake of Hooli’s bombshell, Richard and the guys struggle to find a backer as they face legal and financial woes. Monica attempts to balance her interest in Pied Piper with her job. A cash-strapped Dinesh tries to put an end to the Kickstarter campaign for his cousin’s new app, Bro. Richard gets a surprising offer.	\N	7.63	2015-04-20 02:00:00	Runaway Devaluation	60573
554	1	/fLub6BDHdnvrEIeezHygZEZq4Qu.jpg	While considering Gavin’s proposal, Richard is approached by Russ Hanneman, an image-conscious billionaire who wants to back Pied Piper, but may not be as “hands-off” as he claims. Gilfoyle and Dinesh play hardball to get what they want; Gavin finds a new strategy in dealing with the enemy.	\N	7.64	2015-04-27 02:00:00	Bad Money	60573
555	1	/w3UiscCdEGO9gphijXi4qm0XbJA.jpg	Richard butts heads with Erlich over a prospective hire, while Dinesh and Gilfoyle become suspicious that a new employee they recommended is commanding a higher salary. Big Head gets a surprising promotion at Hooli. At a board meeting, Monica and Richard find themselves outvoted; Jared institutes a workplace harassment policy.	\N	7.61	2015-05-04 02:00:00	The Lady	60573
556	1	/3aFDxHCFNinkzdCGnHHZBnVZZB0.jpg	Gavin’s interference causes Pied Piper to struggle with securing their expansion, while a nosy neighbor puts the guys at risk. Gilfoyle takes on the task of building servers, and an overstressed Richard reluctantly takes in Jared as a roommate. Big Head’s management skills are questioned, and Nucleus’ debut zeroes in on a big event.	\N	7.70	2015-05-11 02:00:00	Server Space	60573
557	1	/cxkCLVq93TTAfeTMYlEe0SmSPEZ.jpg	When Monica encourages the guys to pounce on a livestream opportunity, Erlich reconnects with his old mentee, Double-A, an energy drink billionaire, but Richard finds out their friendship isn’t quite what Erlich thinks. After learning that the livestream might hit a snag, Gilfoyle and Dinesh brainstorm their options. Jared encourages a friendship between Carla and Monica.	\N	7.83	2015-05-18 02:00:00	Homicide	60573
558	1	/ew3FPoR5TfuMeViHbTnHgaI45zB.jpg	With the Pied Piper team fielding job offers and Russ distracted by financial news, Richard faces the prospect of either merging with a nemesis or folding. Gavin attempts to turn Nucleus’ failure into a success. Dinesh tries his hand at wooing a woman online. After Gilfoyle suggests a risky move, Richard reaches out to an unconventional client.	\N	7.93	2015-05-25 02:00:00	Adult Content	60573
559	1	/9rE1PsUJ32D6iBQea6ScqzKK9ll.jpg	When Richard takes pity on a competitor, he accidentally sparks a feud that finds him paranoid about security. Jared exaggerates Pied Piper’s size to get results. Facing pressure from board members, Gavin looks to place responsibility elsewhere.	\N	7.77	2015-06-01 02:00:00	White Hat/Black Hat	60573
560	1	/eVzx30G4TvkV6AMhsyAalSU2kuG.jpg	When Pied Piper and Hooli enter binding arbitration, Erlich demands to be put on the stand. Big Head finds himself propped up. Richard worries Hooli’s claim could have legs.	\N	7.98	2015-06-08 02:00:00	Binding Arbitration	60573
561	1	/htnawGNust6Z0s492Y1FhQr9XIS.jpg	As the guys await the verdict on Pied Piper’s fate, an unexpected real-life drama draws a spike in traffic to their livestream and leaves them fighting to hold things together – literally. While Erlich considers his future, Richard scrambles to save Pied Piper’s.	\N	8.27	2015-06-15 02:00:00	Two Days of the Condor	60573
562	1	/m9B0FRaPf2AxsxWV3fYwZpIF5Be.jpg	With Richard unexpectedly ousted as CEO, Season 3 picks up with him offered a diminished role of CTO and the rest of his team facing the question of just how far their loyalty extends. Now under a new CEO who is hell-bent on transforming everything from Pied Piper's offices to its business agenda, the guys must find a way to triumph in the war of Art vs. Commerce. Meanwhile, as Gavin Belson works to rehabilitate Hooli's image following his blunders, Big Head finds himself in a new partnership.	\N	8.52	2016-04-25 02:00:00	Season 3	60573
563	1	/aTnRUqJ3gyeIKwHezaW9oB2X1YQ.jpg	After being unceremoniously fired, an angry Richard faces a tough decision: accept the diminished role of CTO, or leave Pied Piper for good. Erlich takes a shine to Jack Barker, Laurie’s new choice of CEO, while Dinesh and Gilfoyle weigh their options in Richard’s absence. At Hooli, Gavin tries to improve his image by admitting failure, and Big Head gets wind of major changes.	\N	7.82	2016-04-25 02:00:00	Founder Friendly	60573
564	1	/A3H1QgiPco47iHgv4DF7piMpXUY.jpg	The new and improved Pied Piper impresses Dinesh and Gilfoyle, but worries Richard; Jared and Erlich both face housing issues; Gavin suggests a controversial move.	\N	7.77	2016-05-02 02:00:00	Two in the Box	60573
565	1	/p6dSX0xbk6Mmz4WsoblTPUXjpZJ.jpg	Richard searches for a way around Jack. Gilfoyle opens himself up to recruiters. Dinesh draws unwanted attention from a recent purchase. 	\N	7.88	2016-05-09 02:00:00	Meinertzhagen's Haversack	60573
566	1	/9fGLYI4OvcBUbrXiXh4gSTaL8O6.jpg	The Pied Piper guys struggle to phone it in. Erlich faces competition. Monica takes a stand. Gavin makes a decision about Nucleus.	\N	8.02	2016-05-16 02:00:00	Maleant Data Systems Solutions	60573
567	1	/gVVli47E3zUtZVrHuxq9GAloi0M.jpg	Richard lets his ego get in the way at an interview. Dinesh, Gilfoyle and Jared misplace hardware. Erlich pitches his plans to Big Head.	\N	7.82	2016-05-23 02:00:00	The Empty Chair	60573
568	1	/bpWIRPbEdNj09q4ZD1RoQA3NKsx.jpg	Richard’s new relationship is threatened by neuroses. Big Head and Erlich’s launch party has snags. Dinesh falls for a foreign coworker. 	\N	7.78	2016-05-30 02:00:00	Bachmanity Insanity	60573
569	1	/q7FU9moLnmTlgsiMQ5rkM5efXQW.jpg	A beta version of Pied Piper gets an unexpected reception as Dinesh's lack of friends worries him, but Gilfoyle thinks he's stretching the truth. Amanda isn't sure she can dole out criticism. A strapped Erlich mulls a big decision. The Nucleus team tackles a difficult challenge from Gavin.	\N	7.97	2016-06-06 02:00:00	To Build a Better Beta	60573
570	1	/b9USgA2Nh9QMoCCpFQ6QdlJXyoW.jpg	Erlich tries to be honest with Richard, who has mixed emotions about their friendship and the future of Pied Piper. Jared's new company apparel turns heads but fuels yet another clash between Dinesh and Gilfoyle.	\N	7.94	2016-06-13 02:00:00	Bachman's Earning's Over-Ride	60573
571	1	/2r4tqHf2jxciVBduvj3eZANamMJ.jpg	Shocking stats are revealed and prompt Richard to bridge the gap between Pied Piper and its users, but Jared must go to extremes to keep everything intact. Gavin tries to recapture his former glory by bringing in new talent after discovering secrets about the competition.	\N	7.84	2016-06-20 02:00:00	Daily Active Users	60573
572	1	/2b8Xs9Fqt6H608pWLaBoBlrEqSk.jpg	Pied Piper’s future is hazy, but Erlich’s industry profile begins to rise, creating a moral dilemma for Richard as Dinesh’s new app starts to catch on. Meanwhile, Laurie makes plans for her exit; and Gavin’s pompous personality haunts his comeback at Hooli.	\N	8.07	2016-06-27 02:00:00	The Uptick	60573
573	1	/lsYfCqNCWWTc7zsqO5MYcptJI0n.jpg	Richard and the socially awkward Pied Piper team continue to claw their way towards tech fame and fortune in Season 4.	\N	8.23	2017-04-24 02:00:00	Season 4	60573
574	1	/vnV8nRsMvWDbWot4m4XKTEQKZXu.jpg	The guys struggle to find funding for Pied Piper's video chat app to keep up with their rapidly growing user base. Erlich faces resistance from Big Head's father. Jack steps on Gavin's toes at Hooli. Richard gets sage advice.\n	\N	7.95	2017-04-24 02:00:00	Success Failure	60573
575	1	/fxNqng24prlsIw6SgBWU7XxCcxn.jpg	Richard butts heads with Dinesh, whose new position goes to his head. Later, Richard discovers interesting data about PiperChat's users. Erlich makes a play to be involved in Jian-Yang's new app; Jared sets ground rules in his friendship with Richard; Gavin's paranoia over Jack's enthusiasm causes him to make a rash decision.\n	\N	8.07	2017-05-01 02:00:00	Terms of Service	60573
576	1	/iIznsbDIUTXozlQDmJkhcVI9RLB.jpg	Dinesh gets back to the ground while Richard continues to explore his new project. Gavin tries to come out of the new problem he has gotten himself into and interestingly the chemistry between Richard and Monica takes a new turn.\n	\N	7.92	2017-05-08 02:00:00	Intellectual Property	60573
577	1	/ixnSijOwzaGojKkKHoGNcG1vDBN.jpg	Sea food demo is being prepared. Big head professorship is proving beneficial to his students. And finally we get a glimpse of the insides of Gavin Belson mansion.\n	\N	7.94	2017-05-15 02:00:00	Teambuilding Exercise	60573
578	1	/fobLepYRsj4lZRbVu5llTtiH219.jpg	Richard tries to convince his new business partner Gavin about his strategy for the new internet, but finds himself blocked by meddling from an annoying associate of Gavin's. Erlich connives his way into Laurie's baby shower and tips her off to a hidden agenda. Dinesh struggles to free himself of Mia.\n	\N	7.95	2017-05-22 02:00:00	The Blood Boy	60573
579	1	/zmAq6z6S07Ck6PWYnqOL8yhWcCI.jpg	The guys struggle for funding to launch the latest iteration of Pied Piper. Erlich seeks to join the new VC firm formed by Laurie and Monica. Dinesh and Gilfoyle clash over the alpha build.\n	\N	7.85	2017-05-29 02:00:00	Customer Service	60573
580	1	/eU979h2f56ALEXkkwbyvJbsLc3k.jpg	When Richard decides to stand up to a patent troll, his defiance ends up coming back to haunt him. Gilfoyle goes to desperate measures to battle Jian-Yang's new smart refrigerator. Jared embraces multiple identities in in his quest to reduce costs. Erlich tries to hang with the alpha males.\n	\N	7.86	2017-06-05 02:00:00	The Patent Troll	60573
581	1	/6nTiPx7mQ3nWGzvnmKXUPsasip2.jpg	An unexpected increase in data traffic leads Richard to turn the Ehrlich for help in garnering a deal with Keenan Feldspar, Silicon Valley's latest 'it' boy, but when he makes a too-good-to-resist offer, Richard must weigh Pied Piper's future against a potential mutiny. Jack faces setbacks while preparing for Hooli-Con.\n	\N	7.93	2017-06-12 02:00:00	The Keenan Vortex	60573
582	1	/nwYmGaHCZt3gR8Knqq4ybOuqhod.jpg	Erlich goes on a trip to get his mojo back while the guys head to Hooli-Con, where Jared faces a moral dilemma; Gilfoyle and Dinesh are distracted by Keenan; and Richard becomes obsessed with an ex's new beau.	\N	7.98	2017-06-19 02:00:00	Hooli-Con	60573
583	1	/su047brLng4dut8OJzJ3stm4MaT.jpg	Richard finds himself in a web of lies; Jared plans his exit; Jack bets big; Gavin plots a comeback.	\N	8.06	2017-06-26 02:00:00	Server Error	60573
584	1	/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg	An Amazon princess comes to the world of Man to become the greatest of the female superheroes.	\N	7.62	2017-06-02 00:00:00	Wonder Woman	297762
585	1	/f8Ng1Sgb3VLiSwAvrfKeQPzvlfr.jpg	Autobots and Decepticons are at war, with humans on the sidelines. Optimus Prime is gone. The key to saving our future lies buried in the secrets of the past, in the hidden history of Transformers on Earth.	\N	7.22	2017-06-23 00:00:00	Transformers: The Last Knight	335988
586	1	/iNpz2DgTsTMPaDRZq2tnbqjL2vF.jpg	When a mysterious woman seduces Dom into the world of crime and a betrayal of those closest to him, the crew face trials that will test them as never before.	\N	7.63	2017-04-14 00:00:00	The Fate of the Furious	337339
587	1	/iRAZIEgfB9N0BObV0QI61Nxh92h.jpg	Saban's Power Rangers follows five ordinary teens who must become something extraordinary when they learn that their small town of Angel Grove — and the world — is on the verge of being obliterated by an alien threat. Chosen by destiny, our heroes quickly discover they are the only ones who can save the planet. But to do so, they will have to overcome their real-life issues and before it’s too late, band together as the Power Rangers.	\N	7.00	2017-03-24 00:00:00	Power Rangers	305470
588	1	/ik3ebv7J18fs6cHkmu91oxz7EGt.jpg	At the dawn of the 20th century, British explorer Percy Fawcett journeys into the Amazon, where he discovers evidence of a previously unknown, advanced civilization that may have once inhabited the region. Despite being ridiculed by the scientific establishment, which views indigenous populations as savages, the determined Fawcett, supported by his devoted wife, son, and aide-de-camp, returns to his beloved jungle in an attempt to prove his case.	\N	6.45	2017-04-21 00:00:00	The Lost City of Z	314095
589	1	/ewVHnq4lUiovxBCu64qxq5bT2lu.jpg	Bound for a remote planet on the far side of the galaxy, the crew of the colony ship Covenant discovers what they think is an uncharted paradise, but is actually a dark, dangerous world — whose sole inhabitant is the “synthetic” David, survivor of the doomed Prometheus expedition.	\N	6.78	2017-05-19 00:00:00	Alien: Covenant	126889
590	1	/zkXnKIwX5pYorKJp2fjFSfNyKT0.jpg	John Wick is forced out of retirement by a former associate looking to seize control of a shadowy international assassins’ guild. Bound by a blood oath to aid him, Wick travels to Rome and does battle against some of the world’s most dangerous killers.	\N	7.55	2017-02-10 00:00:00	John Wick: Chapter 2	324552
591	1	/r2517Vz9EhDhj88qwbDVj8DCRZN.jpg	Explore the mysterious and dangerous home of the king of the apes as a team of explorers ventures deep inside the treacherous, primordial island.	\N	7.44	2017-03-10 00:00:00	Kong: Skull Island	293167
592	1	/fyy1nDC8wm553FCiBDojkJmKLCs.jpg	Blindsided by a new generation of blazing-fast racers, the legendary Lightning McQueen is suddenly pushed out of the sport he loves. To get back in the game, he will need the help of an eager young race technician with her own plan to win, inspiration from the late Fabulous Hudson Hornet, and a few unexpected turns. Proving that #95 isn't through yet will test the heart of a champion on Piston Cup Racing’s biggest stage!	\N	7.00	2017-06-16 00:00:00	Cars 3	260514
593	1	/h2mhfbEBGABSHo2vXG1ECMKAJa7.jpg	The six-member crew of the International Space Station is tasked with studying a sample from Mars that may be the first proof of extra-terrestrial life, which proves more intelligent than ever expected.	\N	7.02	2017-03-24 00:00:00	Life	395992
\.


--
-- Data for Name: media_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media_genre (medias_id_media, genres_id_genre) FROM stdin;
1	11
1	15
1	32
1	1
1	2
76	11
76	1
76	2
76	32
76	15
214	11
214	8
257	7
257	11
328	11
328	1
328	2
328	26
328	15
328	32
338	11
409	11
409	21
442	32
442	11
442	40
442	26
485	40
485	11
485	15
485	32
485	1
541	7
584	1
584	2
584	15
584	32
585	1
585	2
585	32
585	40
586	1
586	8
586	40
587	1
587	32
587	2
588	2
588	18
588	1
588	11
589	32
589	21
589	40
590	1
590	40
590	8
591	1
591	2
591	15
592	3
592	7
592	2
593	40
593	32
593	21
\.


--
-- Name: media_genre_medias_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_genre_medias_id_media_seq', 1, false);


--
-- Name: media_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_id_media_seq', 593, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie (certification, homepage, imdb, language, runtime, slug, tagline, trailer, id_media) FROM stdin;
PG-13	http://www.warnerbros.com/wonder-woman	tt0451279	en	141	wonder-woman-2017	Power. Grace. Wisdom. Wonder.	http://youtube.com/watch?v=5lGoQhFb4NM	584
PG-13	http://www.transformersmovie.com/	tt3371366	en	149	transformers-the-last-knight-2017	There are mysteries to the universe we were never meant to solve	http://youtube.com/watch?v=6Vtf0MszgP8	585
PG-13	http://www.fastandfurious.com/	tt4630562	en	136	the-fate-of-the-furious-2017	Family no more	http://youtube.com/watch?v=JwMKRevYa_M	586
PG-13	http://www.powerrangers.movie/	tt3717490	en	124	power-rangers-2017	Together we are more	http://youtube.com/watch?v=5kIe6UZHSXw	587
PG-13	http://www.lostcityofzfilm.co.uk/home	tt1212428	en	140	the-lost-city-of-z-2017	In 1925, Percy Fawcett ventured into the Amazon in search of a myth. What he discovered became legendary.	http://youtube.com/watch?v=Yixiv6A0BbU	588
R	https://alienuniverse.com/alien-covenant	tt2316204	en	122	alien-covenant-2017	The path to paradise begins in hell.	http://youtube.com/watch?v=svnAD0TApb8	589
R	http://www.johnwick.movie/	tt4425200	en	122	john-wick-chapter-2-2017	Never stab the devil in the back	http://youtube.com/watch?v=LZrX9mffH8Y	590
PG-13	http://kongskullislandmovie.com/	tt3731562	en	118	kong-skull-island-2017	All hail the king	http://youtube.com/watch?v=44LdLqgOpjo	591
G	http://cars.disney.com	tt3606752	en	109	cars-3-2017	From this moment, everything will change	http://youtube.com/watch?v=E4K7JgPJ8-s	592
R	http://www.lifemovie.com/	tt5442430	en	103	life-2017	Be careful what you search for	http://youtube.com/watch?v=cuA-xqBw4jE	593
\.


--
-- Name: movie_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_id_media_seq', 1, false);


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY season (aired_episodes, episodes, number, season_id, show_id) FROM stdin;
10	10	1	2	1
10	10	2	13	1
10	10	3	24	1
10	10	4	35	1
10	10	5	46	1
10	10	6	57	1
0	7	7	68	1
13	13	1	77	76
13	13	2	91	76
13	13	3	105	76
13	13	4	119	76
13	13	5	133	76
13	13	6	147	76
13	13	7	161	76
12	12	8	175	76
12	12	9	188	76
12	12	10	201	76
8	8	1	215	214
10	10	2	224	214
10	10	3	235	214
1	10	4	246	214
13	13	1	258	257
13	13	2	272	257
13	13	3	286	257
13	13	4	300	257
13	13	5	314	257
8	8	1	329	328
13	13	1	339	338
13	13	2	353	338
13	13	3	367	338
13	13	4	381	338
13	13	5	395	338
6	6	1	410	409
15	15	2	417	409
5	8	3	433	409
13	13	1	443	442
13	13	2	457	442
5	13	3	471	442
10	10	1	486	485
10	10	2	497	485
10	10	3	508	485
10	10	4	519	485
3	10	5	530	485
8	8	1	542	541
10	10	2	551	541
10	10	3	562	541
10	10	4	573	541
\.


--
-- Name: season_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('season_season_id_seq', 1, false);


--
-- Name: season_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('season_show_id_seq', 1, false);


--
-- Data for Name: tvshow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tvshow (aired_day, aired_episodes, aired_time, aired_timezone, certification, country, homepage, imdb, language, network, runtime, seasons, slug, status, trailer, show_id) FROM stdin;
Sunday	60	21:00	America/New_York	TV-MA	us	http://www.hbo.com/game-of-thrones	tt0944947	en	HBO	55	7	game-of-thrones	returning series	\N	1
Saturday	127	18:45	Europe/London	TV-PG	gb	http://www.bbc.co.uk/programmes/b006q2x0	tt0436992	en	BBC One	45	10	doctor-who-2005	returning series	\N	76
Sunday	29	21:00	America/New_York	TV-MA	us	https://www.starz.com/series/power	tt3281796	en	Starz!	60	4	power	returning series	http://youtube.com/watch?v=w7fuOkF74Zw	214
Friday	65	00:00	America/New_York	TV-MA	us	https://www.netflix.com/title/70242311	tt2372162	en	Netflix	60	5	orange-is-the-new-black	returning series	http://youtube.com/watch?v=njy0dFFlpAc	257
Sunday	8	21:00	America/New_York	TV-MA	us	https://www.starz.com/series/americangods	tt1898069	en	Starz!	60	1	american-gods	returning series	http://youtube.com/watch?v=oyoXURn9oK0	328
Friday	65	00:00	America/New_York	TV-MA	us	http://www.netflix.com/title/70178217	tt1856010	en	Netflix	50	5	house-of-cards	returning series	http://youtube.com/watch?v=ULwUzF1q5w4	338
Sunday	26	21:00	America/New_York	TV-MA	us	http://www.amc.com/shows/fear-the-walking-dead	tt3743822	en	AMC	45	3	fear-the-walking-dead	returning series	http://youtube.com/watch?v=yzXglr5bc3w	409
Friday	31	21:00	America/Toronto	TV-14	ca	http://www.syfy.com/darkmatter	tt4159076	en	Syfy	45	3	dark-matter	returning series	http://youtube.com/watch?v=h6nwpNgPejA	442
Saturday	44	22:00	America/New_York	TV-MA	us	http://www.bbcamerica.com/shows/orphan-black	tt2234222	en	BBC America	45	5	orphan-black	returning series	http://youtube.com/watch?v=OcnIQeWY6MA	485
Sunday	38	22:00	America/New_York	TV-MA	us	http://www.hbo.com/silicon-valley	tt2575988	en	HBO	30	4	silicon-valley	returning series	http://youtube.com/watch?v=69V__a49xtw	541
\.


--
-- Name: tvshow_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tvshow_show_id_seq', 1, false);


--
-- Data for Name: user_has_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_has_media (add_date, comment, rating, view_date, watched, watchlist, usertr_id_user, media_id_media) FROM stdin;
\.


--
-- Name: user_has_media_media_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_has_media_media_id_media_seq', 1, false);


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
-- Name: season fkle6y1bxlf8j2ll45k43cisfrw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY season
    ADD CONSTRAINT fkle6y1bxlf8j2ll45k43cisfrw FOREIGN KEY (show_id) REFERENCES tvshow(show_id);


--
-- Name: movie fklj38y3jdywoi2wdrs591voalf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT fklj38y3jdywoi2wdrs591voalf FOREIGN KEY (id_media) REFERENCES media(id_media);


--
-- Name: episode fkr5ifuxa82mfaxrhgahps7iu2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT fkr5ifuxa82mfaxrhgahps7iu2m FOREIGN KEY (season_id) REFERENCES season(season_id);


--
-- Name: user_has_media fkreet1ch8scisxq01s99haabae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_has_media
    ADD CONSTRAINT fkreet1ch8scisxq01s99haabae FOREIGN KEY (usertr_id_user) REFERENCES usertr(id_user);


--
-- PostgreSQL database dump complete
--

