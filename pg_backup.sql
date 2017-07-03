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
tt1480055	1	61	12	13
tt1668746	2	55	12	14
tt1829962	3	57	12	15
tt1829963	4	55	12	16
tt1829964	5	54	12	17
tt1837862	6	52	12	18
tt1837863	7	57	12	19
tt1837864	8	58	12	20
tt1851398	9	56	12	21
tt1851397	10	52	12	22
tt1971833	1	52	23	24
tt2069318	2	53	23	25
tt2070135	3	52	23	26
tt2069319	4	50	23	27
tt2074658	5	54	23	28
tt2085238	6	54	23	29
tt2085239	7	55	23	30
tt2085240	8	53	23	31
tt2084342	9	54	23	32
tt2112510	10	63	23	33
tt2178782	1	54	34	35
tt2178772	2	57	34	36
tt2178802	3	52	34	37
tt2178798	4	53	34	38
tt2178788	5	57	34	39
tt2178812	6	53	34	40
tt2178814	7	57	34	41
tt2178806	8	56	34	42
tt2178784	9	50	34	43
tt2178796	10	62	34	44
tt2816136	1	58	45	46
tt2832378	2	52	45	47
tt2972426	3	56	45	48
tt2972428	4	55	45	49
tt3060856	5	53	45	50
tt3060910	6	50	45	51
tt3060876	7	51	45	52
tt3060782	8	52	45	53
tt3060858	9	50	45	54
tt3060860	10	65	45	55
tt3658012	1	59	56	57
tt3846626	2	63	56	58
tt3866836	3	66	56	59
tt3866838	4	57	56	60
tt3866840	5	64	56	61
tt3866842	6	62	56	62
tt3866846	7	66	56	63
tt3866850	8	69	56	64
tt3866826	9	63	56	65
tt3866862	10	72	56	66
tt3658014	1	59	67	68
tt4077554	2	62	67	69
tt4131606	3	60	67	70
tt4283016	4	68	67	71
tt4283028	5	67	67	72
tt4283054	6	60	67	73
tt4283060	7	58	67	74
tt4283074	8	66	67	75
tt4283088	9	69	67	76
tt4283094	10	81	67	77
tt5654088	1	55	78	79
tt5655178	2	55	78	80
tt5775840	3	55	78	81
tt5775846	4	55	78	82
tt5775854	5	55	78	83
tt5775864	6	55	78	84
tt5775874	7	55	78	85
tt3326028	1	58	87	88
tt3378490	2	60	87	89
tt3425172	3	58	87	90
tt3425174	4	54	87	91
tt3502494	5	60	87	92
tt3566840	6	61	87	93
tt3566844	7	61	87	94
tt3566848	8	59	87	95
tt3797264	1	63	96	97
tt4071518	2	60	96	98
tt4054704	3	62	96	99
tt4109822	4	61	96	100
tt4172972	5	61	96	101
tt4172976	6	61	96	102
tt4172978	7	60	96	103
tt4178826	8	62	96	104
tt4172990	9	62	96	105
tt3878560	10	89	96	106
tt4765182	1	58	107	108
tt5009086	2	56	107	109
tt5100842	3	58	107	110
tt5022436	4	53	107	111
tt5162328	5	58	107	112
tt5165300	6	58	107	113
tt5273862	7	57	107	114
tt5297122	8	58	107	115
tt5297144	9	58	107	116
tt5001840	10	58	107	117
tt5895810	1	60	118	119
tt5977724	2	60	118	120
tt5977750	3	60	118	121
tt6006284	4	60	118	122
tt6006288	5	60	118	123
tt6007454	6	60	118	124
tt6007456	7	60	118	125
tt6007462	8	60	118	126
tt6007464	9	60	118	127
tt5934364	10	60	118	128
tt2400770	1	51	130	131
tt2431596	2	51	130	132
tt2451520	3	56	130	133
tt2577286	4	54	130	134
tt2511030	5	54	130	135
tt2511028	6	56	130	136
tt2595996	7	56	130	137
tt2620550	8	58	130	138
tt2640490	9	58	130	139
tt2692410	10	53	130	140
tt2739642	11	58	130	141
tt2754710	12	59	130	142
tt2754708	13	60	130	143
tt3015084	1	56	144	145
tt3099720	2	55	144	146
tt3262412	3	59	144	147
tt3262414	4	59	144	148
tt3262416	5	51	144	149
tt3262410	6	59	144	150
tt3262424	7	52	144	151
tt3262418	8	57	144	152
tt3262426	9	59	144	153
tt3262428	10	59	144	154
tt3262420	11	57	144	155
tt3262422	12	59	144	156
tt3262434	13	92	144	157
tt3713502	1	52	158	159
tt3807516	2	57	158	160
tt3807522	3	55	158	161
tt3807518	4	58	158	162
tt3807524	5	58	158	163
tt3807528	6	53	158	164
tt3807532	7	59	158	165
tt3807534	8	58	158	166
tt3807526	9	53	158	167
tt3807546	10	59	158	168
tt3807540	11	59	158	169
tt3807544	12	59	158	170
tt3807538	13	89	158	171
tt4645280	1	53	172	173
tt4800062	2	59	172	174
tt4848198	3	56	172	175
tt4943588	4	59	172	176
tt4964764	5	57	172	177
tt4955850	6	58	172	178
tt4982080	7	57	172	179
tt5208156	8	58	172	180
tt5197318	9	56	172	181
tt5208192	10	59	172	182
tt5188388	11	59	172	183
tt5193130	12	59	172	184
tt5193132	13	76	172	185
tt5440228	1	60	186	187
tt6007580	2	60	186	188
tt5949054	3	60	186	189
tt5948520	4	60	186	190
tt5974194	5	60	186	191
tt6007582	6	60	186	192
tt6007584	7	60	186	193
tt6007588	8	60	186	194
tt6007596	9	60	186	195
tt6007600	10	60	186	196
tt6007602	11	60	186	197
tt6007608	12	60	186	198
tt5842030	13	60	186	199
tt4417020	1	64	201	202
tt4559272	2	43	201	203
tt4559274	3	48	201	204
tt4559276	4	46	201	205
tt4559278	5	45	201	206
tt4549106	6	51	201	207
tt4549108	1	42	208	209
tt4897130	2	44	208	210
tt5218334	3	42	208	211
tt5218358	4	44	208	212
tt5218374	5	42	208	213
tt5218388	6	44	208	214
tt5218406	7	43	208	215
tt5218418	8	44	208	216
tt5218430	9	45	208	217
tt5218442	10	43	208	218
tt5218450	11	43	208	219
tt5218460	12	42	208	220
tt5218470	13	40	208	221
tt5218476	14	42	208	222
tt4959800	15	45	208	223
tt5646582	1	47	224	225
tt6082748	2	48	224	226
tt6082752	3	43	224	227
tt6082756	4	43	224	228
tt6094030	5	43	224	229
tt6094034	6	45	224	230
tt6094038	7	45	224	231
\N	8	45	224	232
tt0562992	1	44	234	235
\N	2	44	234	236
\N	3	44	234	237
\N	4	45	234	238
\N	5	43	234	239
\N	6	45	234	240
\N	7	44	234	241
\N	8	42	234	242
\N	9	41	234	243
\N	10	42	234	244
\N	11	43	234	245
\N	12	42	234	246
\N	13	45	234	247
\N	1	44	248	249
\N	2	44	248	250
\N	3	44	248	251
\N	4	44	248	252
\N	5	46	248	253
\N	6	45	248	254
\N	7	45	248	255
\N	8	45	248	256
\N	9	47	248	257
\N	10	45	248	258
\N	11	43	248	259
\N	12	43	248	260
\N	13	46	248	261
\N	1	44	262	263
\N	2	45	262	264
\N	3	45	262	265
\N	4	46	262	266
\N	5	46	262	267
\N	6	43	262	268
\N	7	45	262	269
\N	8	45	262	270
\N	9	43	262	271
\N	10	43	262	272
\N	11	45	262	273
\N	12	46	262	274
\N	13	46	262	275
\N	1	48	276	277
\N	2	48	276	278
\N	3	43	276	279
\N	4	44	276	280
\N	5	44	276	281
\N	6	45	276	282
\N	7	45	276	283
\N	8	43	276	284
\N	9	45	276	285
\N	10	44	276	286
\N	11	49	276	287
\N	12	45	276	288
\N	13	63	276	289
\N	1	64	290	291
\N	2	42	290	292
\N	3	42	290	293
\N	4	41	290	294
\N	5	42	290	295
\N	6	48	290	296
\N	7	44	290	297
\N	8	43	290	298
\N	9	46	290	299
\N	10	46	290	300
\N	11	42	290	301
\N	12	48	290	302
\N	13	53	290	303
tt1723888	1	43	304	305
tt1723889	2	46	304	306
tt1721225	3	44	304	307
tt1721226	4	45	304	308
tt1777783	5	43	304	309
tt1777782	6	45	304	310
tt1777781	7	48	304	311
tt1795142	8	48	304	312
tt1795143	9	42	304	313
tt1795139	10	46	304	314
tt1795140	11	48	304	315
tt1795141	12	45	304	316
tt1824359	13	45	304	317
tt2402301	1	48	318	319
\N	2	45	318	320
tt2340501	3	44	318	321
\N	4	41	318	322
\N	5	44	318	323
\N	6	45	318	324
\N	7	43	318	325
\N	8	41	318	326
\N	9	44	318	327
\N	10	44	318	328
\N	11	44	318	329
\N	12	44	318	330
\N	13	44	318	331
tt3469416	1	76	332	333
tt3737226	2	47	332	334
tt3714112	3	46	332	335
tt3745430	4	47	332	336
tt3845940	5	45	332	337
tt3845938	6	45	332	338
tt3787384	7	46	332	339
tt3787400	8	49	332	340
tt3834038	9	44	332	341
tt3834040	10	45	332	342
tt3834042	11	47	332	343
tt3834044	12	57	332	344
tt4289846	1	46	345	346
tt4464958	2	47	345	347
tt4483506	3	43	345	348
tt4483520	4	42	345	349
tt4507160	5	50	345	350
tt4545140	6	50	345	351
tt4652840	7	45	345	352
tt4652846	8	46	345	353
tt4787004	9	45	345	354
tt4701538	10	50	345	355
tt4701542	11	55	345	356
tt4701544	12	60	345	357
tt5848216	1	50	358	359
tt5985750	2	45	358	360
tt5985752	3	44	358	361
tt5985754	4	44	358	362
tt6250146	5	44	358	363
tt6340130	6	48	358	364
tt6336800	7	46	358	365
tt6333372	8	44	358	366
tt6340134	9	43	358	367
tt6250158	10	42	358	368
tt6340138	11	45	358	369
tt6340142	12	60	358	370
tt0775431	1	22	372	373
tt1091289	2	21	372	374
tt1091290	3	22	372	375
tt1091291	4	20	372	376
tt1091292	5	20	372	377
tt1091293	6	21	372	378
tt1136041	7	21	372	379
tt1127389	8	20	372	380
tt1127390	9	19	372	381
tt1127384	10	20	372	382
tt1127385	11	22	372	383
tt1127386	12	20	372	384
tt1127387	13	21	372	385
tt1127905	14	20	372	386
tt1127906	15	21	372	387
tt1127907	16	19	372	388
tt1127908	17	20	372	389
tt1256599	1	21	390	391
tt1256030	2	21	390	392
tt1256034	3	21	390	393
tt1256035	4	21	390	394
tt1256036	5	20	390	395
tt1256037	6	21	390	396
tt1256038	7	21	390	397
tt1256039	8	20	390	398
tt1256040	9	21	390	399
tt1256020	10	21	390	400
tt1256021	11	21	390	401
tt1256022	12	21	390	402
tt1256023	13	21	390	403
tt1256024	14	21	390	404
tt1256025	15	20	390	405
tt1256026	16	21	390	406
tt1256027	17	21	390	407
tt1256028	18	20	390	408
tt1256029	19	20	390	409
tt1256031	20	20	390	410
tt1256032	21	21	390	411
\N	22	18	390	412
tt1426233	23	21	390	413
tt1487706	1	21	414	415
tt1495238	2	21	414	416
tt1494210	3	20	414	417
tt1523181	4	21	414	418
tt1528188	5	21	414	419
tt1523180	6	19	414	420
tt1535334	7	19	414	421
tt1536922	8	20	414	422
tt1544819	9	19	414	423
tt1558529	10	21	414	424
tt1558530	11	19	414	425
tt1567073	12	19	414	426
tt1570312	13	20	414	427
tt1588684	14	18	414	428
tt1589887	15	21	414	429
tt1592080	16	21	414	430
tt1607974	17	20	414	431
tt1609715	18	21	414	432
tt1609410	19	21	414	433
tt1628617	20	20	414	434
tt1648755	21	21	414	435
tt1648756	22	20	414	436
tt1627740	23	20	414	437
tt1632224	1	21	438	439
tt1632235	2	20	438	440
tt1632240	3	21	438	441
tt1632241	4	19	438	442
tt1632242	5	20	438	443
tt1632243	6	21	438	444
tt1632244	7	21	438	445
tt1632245	8	19	438	446
tt1632246	9	21	438	447
tt1632225	10	20	438	448
tt1632226	11	20	438	449
tt1632227	12	21	438	450
tt1632228	13	21	438	451
tt1632229	14	21	438	452
tt1632230	15	20	438	453
tt1632231	16	20	438	454
tt1632232	17	21	438	455
tt1632233	18	21	438	456
tt1632234	19	21	438	457
tt1632236	20	21	438	458
tt1632237	21	20	438	459
tt1632238	22	21	438	460
tt1632239	23	19	438	461
tt1918407	24	21	438	462
tt1980710	1	21	463	464
tt2033019	2	19	463	465
tt2057241	3	20	463	466
tt2058495	4	20	463	467
tt2063481	5	21	463	468
tt2079337	6	21	463	469
tt2082016	7	19	463	470
tt2092310	8	21	463	471
tt2100287	9	21	463	472
tt2105978	10	20	463	473
tt2119890	11	19	463	474
tt2136314	12	20	463	475
tt2139151	13	21	463	476
tt2181587	14	20	463	477
tt2192687	15	20	463	478
tt2209665	16	21	463	479
tt2220955	17	21	463	480
tt2238153	18	21	463	481
tt2275203	19	20	463	482
tt2275201	20	21	463	483
tt2300453	21	19	463	484
tt2332311	22	21	463	485
tt2372043	23	21	463	486
tt2379487	24	21	463	487
tt2194640	1	21	488	489
tt2392630	2	21	488	490
tt2378184	3	19	488	491
tt2411550	4	20	488	492
tt2411582	5	21	488	493
tt2450064	6	21	488	494
tt2462410	7	21	488	495
tt2502436	8	21	488	496
tt2505340	9	19	488	497
tt2523744	10	21	488	498
tt2559784	11	21	488	499
tt2571320	12	21	488	500
tt2582488	13	21	488	501
tt2636834	14	19	488	502
tt2633894	15	20	488	503
tt2668846	16	20	488	504
tt2697398	17	20	488	505
tt2708314	18	20	488	506
tt2739286	19	19	488	507
tt2784494	20	19	488	508
tt2833366	21	19	488	509
tt2833352	22	21	488	510
tt2852720	23	20	488	511
tt2891288	24	20	488	512
tt3111660	1	21	513	514
tt2933998	2	21	513	515
tt3218670	3	20	513	516
tt3221722	4	21	513	517
tt3229392	5	19	513	518
tt3229394	6	20	513	519
tt3229396	7	19	513	520
tt3303726	8	20	513	521
tt3309570	9	19	513	522
tt3338358	10	19	513	523
tt3337724	11	21	513	524
tt3337728	12	21	513	525
tt3337730	13	20	513	526
tt3453320	14	20	513	527
tt3477310	15	20	513	528
tt3507240	16	19	513	529
tt3521962	17	19	513	530
tt3517894	18	20	513	531
tt3521964	19	19	513	532
tt3554854	20	20	513	533
tt3572170	21	18	513	534
tt3572176	22	21	513	535
tt3572182	23	19	513	536
tt3572184	24	21	513	537
tt3596130	1	21	538	539
tt3807172	2	19	538	540
tt3811812	3	19	538	541
tt3811814	4	19	538	542
tt3811816	5	19	538	543
tt3823240	6	21	538	544
tt3823244	7	19	538	545
tt3823242	8	20	538	546
tt3823248	9	20	538	547
tt3823250	10	19	538	548
tt3823252	11	19	538	549
tt3823254	12	20	538	550
tt3862708	13	20	538	551
tt3862712	14	21	538	552
tt3862710	15	20	538	553
tt3862714	16	20	538	554
tt3862720	17	20	538	555
tt3862722	18	19	538	556
tt3862724	19	21	538	557
tt3862726	20	19	538	558
tt3862728	21	18	538	559
tt3862732	22	19	538	560
tt3862734	23	18	538	561
tt3862738	24	20	538	562
tt3603346	1	20	563	564
tt4938690	2	19	563	565
tt4962326	3	19	563	566
tt4995126	4	18	563	567
tt5027380	5	18	563	568
tt5090816	6	19	563	569
tt5073156	7	18	563	570
tt5117928	8	19	563	571
tt5143500	9	21	563	572
tt5143508	10	21	563	573
tt5143516	11	21	563	574
tt5273742	12	18	563	575
tt5273740	13	18	563	576
tt5295650	14	18	563	577
tt5341496	15	19	563	578
tt5376678	16	19	563	579
tt5436356	17	19	563	580
tt5497250	18	19	563	581
tt5522908	19	20	563	582
tt5586046	20	19	563	583
tt5586050	21	18	563	584
tt5597958	22	20	563	585
tt5597960	23	18	563	586
tt5562854	24	19	563	587
tt3603372	1	21	588	589
tt5973910	2	18	588	590
tt5996928	3	20	588	591
tt6062772	4	20	588	592
tt6077690	5	19	588	593
tt5825290	6	18	588	594
tt6186420	7	20	588	595
tt6189462	8	18	588	596
tt6214960	9	19	588	597
tt6255718	10	19	588	598
tt6255770	11	20	588	599
tt6320950	12	21	588	600
tt6337212	13	18	588	601
tt6414316	14	19	588	602
tt6438684	15	20	588	603
tt6495864	16	17	588	604
tt6527026	17	19	588	605
tt6565510	18	19	588	606
tt6565514	19	18	588	607
tt6565516	20	19	588	608
tt6565524	21	19	588	609
tt6565530	22	20	588	610
tt6706250	23	19	588	611
tt6706254	24	19	588	612
tt6673774	1	22	613	614
tt5017734	1	65	616	617
tt5062946	2	61	616	618
tt5280330	3	61	616	619
tt5665566	4	61	616	620
tt5665572	5	58	616	621
tt5665580	6	54	616	622
tt5665584	7	54	616	623
tt5017740	8	62	616	624
tt2161930	1	55	626	627
tt2250466	2	50	626	628
tt2248444	3	51	626	629
tt2248422	4	48	626	630
tt2294870	5	52	626	631
tt2311910	6	50	626	632
tt2311926	7	54	626	633
tt2312714	8	47	626	634
tt2248426	9	52	626	635
tt2468204	10	52	626	636
tt2440660	11	54	626	637
tt2555986	12	53	626	638
tt2555988	13	50	626	639
tt2811510	1	50	640	641
tt3221190	2	49	640	642
tt2990016	3	51	640	643
tt3001906	4	48	640	644
tt3001926	5	49	640	645
tt3221232	6	52	640	646
tt3147682	7	48	640	647
tt3147690	8	47	640	648
tt3186026	9	49	640	649
tt3221270	10	51	640	650
tt3297502	11	54	640	651
tt3326204	12	47	640	652
tt3326208	13	60	640	653
tt3513862	1	59	654	655
tt3892086	2	55	654	656
tt3892088	3	53	654	657
tt3892094	4	47	654	658
tt3897442	5	52	654	659
tt3897454	6	54	654	660
tt3918768	7	53	654	661
tt4083028	8	44	654	662
tt4035250	9	52	654	663
tt4128566	10	57	654	664
tt4128572	11	53	654	665
tt4128574	12	49	654	666
tt4221826	13	58	654	667
tt4498368	1	49	668	669
tt4817660	2	42	668	670
tt4817664	3	54	668	671
tt4817670	4	43	668	672
tt4949018	5	48	668	673
tt4949028	6	48	668	674
tt5025272	7	52	668	675
tt5095720	8	47	668	676
tt5083704	9	46	668	677
tt5095730	10	57	668	678
tt5095732	11	52	668	679
tt5095742	12	47	668	680
tt5095748	13	55	668	681
tt5419058	1	50	682	683
tt5965956	2	50	682	684
tt6010608	3	50	682	685
tt6059620	4	50	682	686
tt6110792	5	50	682	687
tt6411836	6	50	682	688
tt6411844	7	50	682	689
tt6411838	8	50	682	690
tt6411842	9	50	682	691
tt6411846	10	50	682	692
tt6411854	11	50	682	693
tt6411858	12	50	682	694
tt6411862	13	50	682	695
tt3097534	1	72	697	698
tt3296848	2	53	697	699
tt3519062	3	51	697	700
tt3578722	4	51	697	701
tt3514096	5	53	697	702
tt3551076	6	54	697	703
tt3578728	7	49	697	704
tt3468290	8	54	697	705
tt3599898	9	53	697	706
tt3599918	10	64	697	707
tt3836974	1	53	708	709
tt4001064	2	62	708	710
tt4001074	3	50	708	711
tt4001070	4	56	708	712
tt4001084	5	57	708	713
tt4001082	6	49	708	714
tt4001092	7	58	708	715
tt4001088	8	63	708	716
tt4001090	9	50	708	717
tt3886622	10	54	708	718
tt5223488	1	67	719	720
tt5273758	2	52	719	721
tt5273760	3	49	719	722
tt5273762	4	50	719	723
tt5273774	5	61	719	724
tt5273764	6	46	719	725
tt5273770	7	45	719	726
tt5273772	8	52	719	727
tt5273778	9	50	719	728
tt5273780	10	52	719	729
tt3464768	1	53	731	732
tt3857028	2	46	731	733
tt3858672	3	47	731	734
tt3864892	4	46	731	735
tt3876380	5	44	731	736
tt3866650	6	42	731	737
tt3884286	7	47	731	738
tt3895284	8	47	731	739
tt3895286	9	47	731	740
tt3895288	10	49	731	741
tt3824148	1	46	742	743
tt4462674	2	47	742	744
tt4462676	3	42	742	745
tt4462678	4	43	742	746
tt4462682	5	45	742	747
tt4462680	6	46	742	748
tt4462684	7	42	742	749
tt4462686	8	48	742	750
tt4462688	9	49	742	751
tt4462690	10	48	742	752
tt5554490	1	51	753	754
tt5579594	2	51	753	755
tt5719532	3	45	753	756
tt5719534	4	47	753	757
tt5719536	5	49	753	758
tt5719540	6	47	753	759
tt5719542	7	52	753	760
tt5719546	8	48	753	761
tt5719544	9	49	753	762
tt5570804	10	56	753	763
\N	1	45	764	765
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
1	1	/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg	An Amazon princess comes to the world of Man to become the greatest of the female superheroes.	\N	7.62	2017-06-02 00:00:00	Wonder Woman	297762
2	1	/f8Ng1Sgb3VLiSwAvrfKeQPzvlfr.jpg	Autobots and Decepticons are at war, with humans on the sidelines. Optimus Prime is gone. The key to saving our future lies buried in the secrets of the past, in the hidden history of Transformers on Earth.	\N	7.22	2017-06-23 00:00:00	Transformers: The Last Knight	335988
3	1	/ewVHnq4lUiovxBCu64qxq5bT2lu.jpg	Bound for a remote planet on the far side of the galaxy, the crew of the colony ship Covenant discovers what they think is an uncharted paradise, but is actually a dark, dangerous world — whose sole inhabitant is the “synthetic” David, survivor of the doomed Prometheus expedition.	\N	6.78	2017-05-19 00:00:00	Alien: Covenant	126889
4	1	/iNpz2DgTsTMPaDRZq2tnbqjL2vF.jpg	When a mysterious woman seduces Dom into the world of crime and a betrayal of those closest to him, the crew face trials that will test them as never before.	\N	7.63	2017-04-14 00:00:00	The Fate of the Furious	337339
5	1	/5HqRLIGVNdet68CEO8N5MVx02i6.jpg	The adventures of two California Highway Patrol motorcycle officers as they make their rounds on the freeways of Los Angeles.	\N	7.35	2017-03-24 00:00:00	CHiPS	417644
6	1	/iRAZIEgfB9N0BObV0QI61Nxh92h.jpg	Saban's Power Rangers follows five ordinary teens who must become something extraordinary when they learn that their small town of Angel Grove — and the world — is on the verge of being obliterated by an alien threat. Chosen by destiny, our heroes quickly discover they are the only ones who can save the planet. But to do so, they will have to overcome their real-life issues and before it’s too late, band together as the Power Rangers.	\N	7.00	2017-03-24 00:00:00	Power Rangers	305470
7	1	/zkXnKIwX5pYorKJp2fjFSfNyKT0.jpg	John Wick is forced out of retirement by a former associate looking to seize control of a shadowy international assassins’ guild. Bound by a blood oath to aid him, Wick travels to Rome and does battle against some of the world’s most dangerous killers.	\N	7.55	2017-02-10 00:00:00	John Wick: Chapter 2	324552
8	1	/zxkY8byBnCsXodEYpK8tmwEGXBI.jpg	Though safely entombed in a crypt deep beneath the unforgiving desert, an ancient queen whose destiny was unjustly taken from her is awakened in our current day, bringing with her malevolence grown over millennia, and terrors that defy human comprehension.	\N	6.56	2017-06-09 00:00:00	The Mummy	282035
9	1	/r2517Vz9EhDhj88qwbDVj8DCRZN.jpg	Explore the mysterious and dangerous home of the king of the apes as a team of explorers ventures deep inside the treacherous, primordial island.	\N	7.44	2017-03-10 00:00:00	Kong: Skull Island	293167
10	1	/ik3ebv7J18fs6cHkmu91oxz7EGt.jpg	At the dawn of the 20th century, British explorer Percy Fawcett journeys into the Amazon, where he discovers evidence of a previously unknown, advanced civilization that may have once inhabited the region. Despite being ridiculed by the scientific establishment, which views indigenous populations as savages, the determined Fawcett, supported by his devoted wife, son, and aide-de-camp, returns to his beloved jungle in an attempt to prove his case.	\N	6.45	2017-04-21 00:00:00	The Lost City of Z	314095
11	2	/gwPSoYUHAKmdyVywgLpKKA4BjRr.jpg	Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and the icy horrors beyond.	\N	9.37	2011-04-17 04:00:00	Game of Thrones	1399
12	3	/olJ6ivXxCMq3cfujo1IRw30OrsQ.jpg	\N	\N	9.16	2011-04-18 01:00:00	Season 1	1399
13	4	/wrGWeW4WKxnaeA8sxJb2T9O6ryo.jpg	Ned Stark, Lord of Winterfell learns that his mentor, Jon Arryn, has died and that King Robert is on his way north to offer Ned Arryn’s position as the King’s Hand. Across the Narrow Sea in Pentos, Viserys Targaryen plans to wed his sister Daenerys to the nomadic Dothraki warrior leader, Khal Drogo to forge an alliance to take the throne.	\N	8.18	2011-04-18 01:00:00	Winter Is Coming	1399
14	4	/icjOgl5F9DhysOEo6Six2Qfwcu2.jpg	Having agreed to become the King’s Hand, Ned leaves Winterfell with daughters Sansa and Arya, while Catelyn stays behind in Winterfell. Jon Snow heads north to join the brotherhood of the Night’s Watch. Tyrion decides to forego the trip south with his family, instead joining Jon in the entourage heading to the Wall. Viserys bides his time in hopes of winning back the throne, while Daenerys focuses her attention on learning how to please her new husband, Drogo.	\N	8.18	2011-04-25 01:00:00	The Kingsroad	1399
15	4	/4vCYVtIhiYSUry1lviA7CKPUB5Z.jpg	Arriving at King’s Landing, Ned is shocked to learn of the Crown’s profligacy from his new advisors. At Castle Black, Jon Snow impresses Tyrion at the expense of greener recruits. Suspecting the Lannisters had a hand in Bran’s fall, Catelyn covertly follows her husband to King’s Landing, where she is intercepted by Petyr Baelish, a.k.a. “Littlefinger,” a shrewd longtime ally and brothel owner. Cersei and Jaime ponder the implications of Bran’s recovery; Arya studies swordsmanship. On the road to Vaes Dothrak, Daenerys finds herself at odds with Viserys.	\N	8.12	2011-05-02 01:00:00	Lord Snow	1399
16	4	/a4tO7cgpv9IkatqAsv5k20zzlyi.jpg	Ned looks for clues to the death of his predecessor, and uncovers one of King Robert’s bastards. Robert and his guests witness a tournament honoring Ned. Jon takes measures to protect Sam from further abuse at Castle Black; a frustrated Viserys clashes with Daenerys in Vaes Dothrak; Sansa imagines her future as a queen, while Arya envisions a far different future. Catelyn rallies her husband’s allies to make a point, while Tyrion finds himself caught in the wrong place at the wrong time.	\N	8.17	2011-05-09 01:00:00	Cripples, Bastards, and Broken Things	1399
17	4	/qS3CHz3AKaC6WhlxQuEXPdrEPjg.jpg	Incensed over news of Daenerys’ alliance with the Dothrakis, Robert orders a preemptive strike on the Targaryens that drives a wedge in his relationship with Ned. A captive Tyrion helps Catelyn, but receives a cold reception at the Eyrie from her sister, Jon Arryn’s widow Lysa. Sansa is charmed by the dashing Ser Loras Tyrell, a.k.a. the Knight of Flowers. Arya overhears a plot against her father.	\N	8.19	2011-05-16 01:00:00	The Wolf and the Lion	1399
18	4	/AqtTrDIHKB6USFUUxLiIWJ6LTes.jpg	Reinstated as the Hand, Ned sits for the King while Robert is on a hunt. Ned issues a decree that could have long-term consequences throughout the Seven Kingdoms. At the Eyrie, Tyrion confesses to his "crimes," and demands that Lysa give him a trial by combat. Joffrey apologizes to Sansa. Viserys receives his final payment for Daenerys from Drogo.	\N	8.38	2011-05-23 01:00:00	A Golden Crown	1399
37	4	/u2DZ4uvnM46KpAb2RPc5TM9tZJq.jpg	Tyrion shoulders new responsibilities. Jon is taken to the Fist of the First Men. Daenerys meets with the slavers. Jaime strikes a deal with his captors.	\N	8.22	2013-04-15 01:00:00	Walk of Punishment	1399
19	4	/l0d3WVs99QZPoxrOGuk21mV5NSp.jpg	Explaining that the future of the Lannisters is at stake, Tywin presses Jaime to “be the man you were meant to be” as they prepare for battle. Ned confronts Cersei about the secrets that killed Jon Arryn. With the fate of the missing Benjen very much on his mind, Jon takes his Night’s Watch vows, though not with the assignment he coveted. After Ser Jorah saves Daenerys from treachery, an enraged Drogo vows to lead the Dothraki where they’ve never gone before. An injured Robert takes pains to ensure an orderly transition at King’s Landing.	\N	8.36	2011-05-30 01:00:00	You Win or You Die	1399
20	4	/9ZvT1IZPcC11eiCByOzqQvC3CCR.jpg	In the aftermath of Ned's capture, Syrio and Arya face off against Lannister guards, while Cersei manipulates Sansa to her own ends. Robb rallies his father's northern allies against Tywin Lannister and heads south to war. Tyrion forms an uneasy alliance with the hill tribes and reunites with his father. Jon lashes out at Ser Alliser Thorne and battles a mysterious attacker from beyond the Wall. Dany is forced to reconcile her desire to conquer Westeros with Drogo's savagery after the Dothraki raid a peaceful village.	\N	8.21	2011-06-06 01:00:00	The Pointy End	1399
21	4	/41zQhAxoccalbhcd1udPIPJVTt1.jpg	With Sansa's life in danger, Ned makes a fateful decision. Catelyn brokers an unsavory deal with the slippery Walder Frey. Tyrion acquires a mistress and is forced by his father to fight on the front lines. Robb wins his first major victory and captures a prized prisoner. Jon is rewarded for his valor and discovers a dark secret about Maester Aemon. As Drogo's wound festers, Dany defies her bloodrider Qotho and puts her trust in the enslaved witch Mirri Maz Duur.	\N	8.45	2011-06-13 01:00:00	Baelor	1399
22	4	/88loh1qyi8vwJO8qH1SdQRsHKNI.jpg	As tragic news spreads across the Seven Kingdoms, Bran and Rickon share a prophetic dream, Catelyn interrogates Jamie about her son's fall, and Robb's destiny is forever changed. After a surprising decision by his father, Tyrion heads south. Arya assumes a new identity in an attempt to escape King's Landing, and Sansa is terrorized by Joffrey. At the Wall, Jon is forced to choose between the Night's Watch and the family he left behind. Across the sea, Dany pays a terrible price for her love, but finds new hope.	\N	8.68	2011-06-20 01:00:00	Fire and Blood	1399
23	3	/5tuhCkqPOT20XPwwi9NhFnC1g9R.jpg	\N	\N	9.12	2012-04-02 01:00:00	Season 2	1399
24	4	/psRgsLrTrEKS0YGuP1H3BCfhzhh.jpg	As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.	\N	8.24	2012-04-02 01:00:00	The North Remembers	1399
25	4	/8ywfRTCSZUSummwvKky7V4DZJru.jpg	In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.	\N	8.17	2012-04-09 01:00:00	The Night Lands	1399
26	4	/wjNzQfeb31KpKGuawX3JET8YexZ.jpg	At the Red Keep, Tyrion plots three alliances through the promise of marriage.  Catelyn arrives in the Stormlands to forge an alliance of her own, but King Renly, his new wife Margaery, and her brother Loras Tyrell have other plans.  At Winterfell, Luwin tries to decipher Bran’s dreams.	\N	8.19	2012-04-16 01:00:00	What is Dead May Never Die	1399
27	4	/4j2j97GFao2NX4uAtMbr0Qhx2K2.jpg	Joffrey punishes Sansa for Robb’s victories, and Tyrion scrambles to temper the king’s cruelty. Catelyn entreats Stannis and Renly to unite against the Lannisters. Dany and her khalasar arrive at the prosperous city of Qarth. Tyrion coerces a relative into being his eyes and ears. Arya and Gendry are taken to Harrenhal, where their lives are in the hands of Ser Gregor Clegane. Stannis orders Davos to smuggle Melisandre into a secret cove.	\N	8.18	2012-04-23 01:00:00	Garden of Bones	1399
28	4	/h7HHSQtEyf7cNBYR2G9DjQ78EgV.jpg	The Baratheon rivalry ends, driving Catelyn to flee and Littlefinger to act. At King’s Landing, Tyrion’s source alerts him to Joffrey’s defense plan - and a mysterious secret weapon. Theon sails to the Stony Shore to prove he’s worthy to be called Ironborn. At Harrenhal, Arya receives a promise from Jaqen H’ghar, one of the prisoners she saved from the Gold Cloaks. The Night’s Watch arrive at the Fist of the First Men, an ancient ringfort where they hope to stem the wildings' advance.	\N	8.19	2012-04-30 01:00:00	The Ghost of Harrenhal	1399
29	4	/o3tRgIZtnv1hAeBBZYxyBss8Xta.jpg	Theon completes his master stroke. In King's Landing, the Lannisters send Myrcella off to be married. Arya comes face to face with a surprise visitor. Dany vows to take what is hers. Robb and Catelyn receive crucial news. Qhorin gives Jon a chance to prove himself.	\N	8.24	2012-05-07 01:00:00	The Old Gods and the New	1399
30	4	/d7hTn2ltWb9RMXLycP1TSQTIPG8.jpg	Jamie meets a distant relative. Daenerys receives an invitation to the House of the Undying. Theon leads a search party. Jon loses his way in the wilderness. Cersei counsels Sansa.	\N	8.21	2012-05-14 01:00:00	A Man Without Honor	1399
31	4	/cDgJzu2sI4t8BnLGDKsQklv1aCA.jpg	Theon receives a visitor. Arya asks her third and last death from Jaqen. While Stannis' army is reaching its destination, Davos is offered a reward.  Betrayal befalls Robb.	\N	8.14	2012-05-21 01:00:00	The Prince of Winterfell	1399
32	4	/c3hoOyXyQpd7gK1eM6Rar1dTxzA.jpg	Tyrion and the Lannisters fight for their lives as Stannis’ fleet assaults King’s Landing.	\N	8.60	2012-05-28 01:00:00	Blackwater	1399
33	4	/u46jn12qEyaCOe1oqJBwPvL5d7R.jpg	Tyrion awakens to a changed situation. King Joffrey doles out rewards to his subjects. As Theon stirs his men to action, Luwin offers some final advice. Brienne silences Jaime. Arya receives a gift from Jaqen. Dany goes to a strange place. Jon proves himself to Qhorin.	\N	8.57	2012-06-04 01:00:00	Valar Morghulis	1399
34	3	/7d3vRgbmnrRQ39Qmzd66bQyY7Is.jpg	\N	\N	9.20	2013-04-01 01:00:00	Season 3	1399
35	4	/3ZerJvXQXcM3tygHRkPTDbbK0hw.jpg	Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King's Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.	\N	8.29	2013-04-01 01:00:00	Valar Dohaeris	1399
36	4	/o8yL7mNZenG9W8398AcfH7veRB4.jpg	Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.	\N	8.12	2013-04-08 01:00:00	Dark Wings, Dark Words	1399
38	4	/jPlIqgPG2PQET2CMfz297Et0Fbb.jpg	Trouble brews among the Night's Watch at Craster's. Margaery takes Joffrey out of his comfort zone. Arya meets the leader of the Brotherhood. Varys plots revenge on an old foe. Theon mournfully recalls his missteps. Daenerys deftly orchestrates her exit from Astapor.	\N	8.67	2013-04-22 01:00:00	And Now His Watch Is Ended	1399
39	4	/d2b1CWsWCKMt5IpNXKgJfE4fjxj.jpg	The Hound is judged by the gods. Jaime is judged by men. Jon proves himself. Robb is betrayed. Tyrion learns the cost of weddings.	\N	8.20	2013-04-29 01:00:00	Kissed by Fire	1399
40	4	/a5ifsts2r9znJO1xQ1NnuYqdbM2.jpg	Tywin plans strategic unions for the Lannisters. Melisandre pays a visit to the Riverlands. Robb weighs a compromise to repair his alliance with House Frey. Roose Bolton decides what to do with Jaime Lannister. Jon, Ygritte, and the Wildlings face a daunting climb.	\N	8.16	2013-05-06 01:00:00	The Climb	1399
41	4	/27NIMz6XTGcZM0jsI1gk0BNjHvM.jpg	Daenerys exchanges gifts with a slave lord outside of Yunkai. As Sansa frets about her prospects, Shae chafes at Tyrion’s new situation. Tywin counsels the king, and Melisandre reveals a secret to Gendry. Brienne faces a formidable foe in Harrenhal.	\N	8.23	2013-05-13 01:00:00	The Bear and the Maiden Fair	1399
42	4	/m4Fs1dVNux8wgdSpLokaFHtmOCR.jpg	King’s Landing hosts a wedding, and Tyrion and Sansa spend the night together. Daenerys meets the Titan’s Bastard. Davos demands proof from Melisandre. Sam and Gilly meet an older gentleman.	\N	8.31	2013-05-20 01:00:00	Second Sons	1399
43	4	/27NyMAUv5Yfb3pyd3kFy9Ge7n8s.jpg	Robb presents himself to Walder Frey, and Edmure meets his bride. Jon faces his harshest test yet. Bran discovers a new gift. Daario and Jorah debate how to take Yunkai. House Frey joins with House Tully.	\N	8.82	2013-06-03 01:00:00	The Rains of Castamere	1399
44	4	/yeQwl3ZN8ZMqGvifMGWz2oCEPZ5.jpg	Joffrey challenges Tywin. Bran tells a ghost story. In Dragonstone, mercy comes from strange quarters. Daenerys waits to see if she is a conqueror or a liberator.	\N	8.46	2013-06-10 01:00:00	Mhysa	1399
45	3	/dniQ7zw3mbLJkd1U0gdFEh4b24O.jpg	\N	\N	9.18	2014-04-07 01:00:00	Season 4	1399
46	4	/5g2n9uGbEJKGn5SgO1se5kVoevR.jpg	Tyrion welcomes a surprise guest to King’s Landing for the royal wedding, but fears he’s come to the Red Keep for something else. Meanwhile, Jon warns his skeptical Night’s Watch superiors about an impending attack. Jaime struggles to regain his status at home. Arya encounters a face from her past, and Daario Naharis discusses strategy with Daenerys on the journey to the slave city Meereen.	\N	8.45	2014-04-07 01:00:00	Two Swords	1399
47	4	/fIyK75aaNngpbXLJWDEJYhwtzDj.jpg	A who’s who of honored guests turns out for Joffrey and Margaery’s wedding in King’s Landing, but the king’s taste in entertainment rubs many of them the wrong way. Meanwhile, Bronn gives a lesson to an unlikely pupil; Bran’s vision helps map out his journey; Stannis loses patience with Davos; and Ramsay takes a perverse delight in his new pet.	\N	8.80	2014-04-14 01:00:00	The Lion and the Rose	1399
48	4	/pgwGxEDIv1XyB5TcJcJM7EMLWiX.jpg	In the frenzied aftermath of the royal wedding, Tyrion gets a visit from a loyal subject, but wonders if anyone in his family will help him out of his current predicament. Meanwhile, Tywin offers to work for the common good with a presumed enemy. Sam takes stock of the personnel at Castle Black. The Hound gives another life lesson to Arya, and Daenerys makes a decision outside the walls of Meereen.	\N	8.35	2014-04-21 01:00:00	Breaker of Chains	1399
49	4	/2h2dtlA6U0Imc3VSq5YlpAif9Qz.jpg	Jon welcomes volunteers. Bran, Jojen, Meera and Hodor seek shelter. Jaime and Brienne discuss his honor. Daenerys balances justice and mercy.	\N	8.21	2014-04-28 01:00:00	Oathkeeper	1399
50	4	/AakvWcPHDwrEML6mwvz4I0hzp3l.jpg	Jon starts a new mission. Cersei and Tywin consider the next move for the Crown. Daenerys makes plans for the future after hearing the latest news from King's Landing. Lord Baelish and Sansa reach their destination.	\N	8.10	2014-05-05 01:00:00	First of His Name	1399
51	4	/vKt9b7HNYhwM91C7S53zPsAWfT3.jpg	Tyrion faces his father in the throne room. Stannis and Davos put their faith in a new strategy. Daenerys' sphere of influence expands.	\N	8.59	2014-05-12 01:00:00	The Laws of Gods and Men	1399
52	4	/r7u0uELPyDkNnBZzAFVvw1XJKo5.jpg	Tyrion gains an unlikely ally. Daario asks Daenerys to allow him to do what he does best. Jon's warnings about the vulnerability of the Wall are ignored. Brienne follows a new lead. Arya and The Hound come across Rorge. Sansa discovers Littlefinger's true intentions for The Eyrie.	\N	8.42	2014-05-19 01:00:00	Mockingbird	1399
53	4	/B5ttTcMjq7YzgKcCzhb6ggJT03.jpg	Unexpected visitors arrive in Mole's Town. Sam questions his decision regarding Gilly. Littlefinger's motives are questioned. Sansa is interrogated by Lord Royce. Arya and The Hound arrive at the Bloody Gate. Ramsay tries to prove himself to his father. Tyrion's fate is decided.	\N	8.68	2014-06-02 01:00:00	The Mountain and the Viper	1399
54	4	/90jIL7o1zVMWNiXUUFDQnisgEq7.jpg	The Night's Watch attempts to defend Castle Black against Mance Rayder's massive wildling army, who plan to siege the fortress from the north, while a secret garrison of wildlings, including Ygritte, are poised to launch a surprise attack from the south.	\N	8.51	2014-06-09 01:00:00	The Watchers on the Wall	1399
55	4	/qi538fri8dTMMUV0MS1MSrFgo48.jpg	Circumstances change after an unexpected arrival from north of the Wall. Daenerys must face harsh realities. Bran learns more about his destiny. Tyrion sees the truth about his situation.	\N	8.71	2014-06-16 01:00:00	The Children	1399
56	3	/yKOltUHsp9X7dXWIm0hNGcIQa4G.jpg	The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.	\N	8.51	2015-04-13 01:00:00	Season 5	1399
57	4	/shIFxmFySt9CtGXMTXWBipsNOIs.jpg	Cersei and Jaime adjust to a world without Tywin; Varys reveals a conspiracy to Tyrion; Daenerys faces a new threat to her rule; Jon is caught between two kings.	\N	8.02	2015-04-13 01:00:00	The Wars to Come	1399
58	4	/pVTafj1pKhXh5aGZItOSDtgBZuc.jpg	Arya arrives in Braavos; Podrick and Brienne run into trouble on the road; Cersei fears for her daughter's safety in Dorne as Ellaria Sand seeks revenge for Oberyn's death. Stannis tempts Jon; an adviser tempts Daenerys.	\N	7.93	2015-04-20 01:00:00	The House of Black and White	1399
59	4	/5b6eUi2w12ao24ug8cL5QqJFKig.jpg	In Braavos, Arya sees the Many-Faced God; In King's Landing, Queen Margaery enjoys her new husband; Tyrion and Varys walk the Long Bridge of Volantis.	\N	7.88	2015-04-27 01:00:00	High Sparrow	1399
60	4	/eaHkOeGsaznmgru8z3ECiosZAAh.jpg	The Faith Militant grow increasingly aggressive. Jaime and Bronn head south. Ellaria and the Sand Snakes vow vengeance.	\N	7.97	2015-05-04 01:00:00	Sons of the Harpy	1399
61	4	/6OBLxmCseaeLwpKO9wN3oqPMDHQ.jpg	Daenerys makes a difficult decision in Meereen; Jon recruits the help of an unexpected ally; Brienne searches for Sansa; Theon remains under Ramsay’s control.	\N	7.89	2015-05-11 01:00:00	Kill the Boy	1399
62	4	/siGoOvAqTTyojNHpfR8wilIoBjf.jpg	Arya trains. Jorah and Tyrion run into slavers. Trystane and Myrcella make plans. Jaime and Bronn reach their destination. The Sand Snakes attack.	\N	7.67	2015-05-18 01:00:00	Unbowed, Unbent, Unbroken	1399
63	4	/3z3TxpfUwG7MWIXbx58zJNgxWg7.jpg	Jon prepares for conflict. Sansa tries to talk to Theon. Brienne waits for a sign. Stannis remains stubborn. Jaime attempts to reconnect with family.	\N	8.02	2015-05-25 01:00:00	The Gift	1399
64	4	/zIrSrXU4zOArlVYnXFxxfKDYYY2.jpg	Arya makes progress in her training. Sansa confronts an old friend. Cersei struggles. Jon travels.	\N	8.73	2015-06-01 01:00:00	Hardhome	1399
65	4	/j7oyJI76rmn83WrczewkiqO5hh6.jpg	Stannis confronts a troubling decision. Jon returns to The Wall. Mace visits the Iron Bank. Arya encounters someone from her past. Daenerys reluctantly oversees a traditional celebration of athleticism. 	\N	8.48	2015-06-08 01:00:00	The Dance of Dragons	1399
66	4	/b5dIepsIO3robQSe18fWmsQe37R.jpg	Stannis marches on Winterfell. With Daenerys missing, Meereen has to find a new custodian. Cersei seeks forgiveness for her sins. Jon deals with life back behind the wall.	\N	8.35	2015-06-15 01:00:00	Mother's Mercy	1399
67	3	/zvYrzLMfPIenxoq2jFY4eExbRv8.jpg	Nach den schockierenden Entwicklungen am Ende der fünften Staffel, einschließlich Jon Schnees blutigem Schicksal, Daenerys knapper Flucht aus der Arena von Mereen und Cerseis öffentlicher Demütigung in den Straßen von Königsmund, formieren sich die Überlebenden aus allen Teilen von Westeros und Essos neu, um unerbittlich ihrem ungewissen Schicksal nachzujagen. Altbekannte Figuren werden neue Allianzen schmieden, um ihre Überlebenschancen zu erhöhen, während neue Gesichter das Gleichgewicht der Mächte im Osten, Westen, Norden und Süden ins Wanken bringen.	\N	8.96	2016-04-25 01:00:00	Season 6	1399
68	4	/wUT1usesyneAJee4wzxxu6pfOKY.jpg	Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.	\N	8.06	2016-04-25 01:00:00	The Red Woman	1399
69	4	/9JlZ6sOXf4nodwWYvoM5zCJIGm9.jpg	Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton  proposes a plan, and Balon Greyjoy entertains other proposals.	\N	8.37	2016-05-02 01:00:00	Home	1399
70	4	/hTRefrtVbPvTP7xA1e0EjU5ioVf.jpg	Daenerys meets her future. Bran meets the past. Tommen confronts the High Sparrow. Arya trains to be No One. Varys finds an answer. Ramsay gets a gift.\n	\N	8.10	2016-05-09 01:00:00	Oathbreaker	1399
71	4	/ieuk4jZv1vFi8yxrGiL1wrtRT7P.jpg	Tyrion strikes a deal. Jorah and Daario undertake a difficult task. Jaime and Cersei try to improve their situation.	\N	8.39	2016-05-16 01:00:00	Book of the Stranger	1399
72	4	/rqPtGylElBAud1BBZpyOq7MQ6Ak.jpg	Tyrion seeks a strange ally. Bran learns a great deal. Brienne goes on a mission. Arya is given a chance to prove herself.	\N	8.49	2016-05-23 01:00:00	The Door	1399
73	4	/k01MUth8Xm2y79nvsQ3UF25SN9w.jpg	An old foe comes back into the picture. Gilly meets Sam’s family. Arya faces a difficult choice. Jaime faces off against the High Sparrow.	\N	8.07	2016-05-30 01:00:00	Blood of My Blood	1399
74	4	/pGYURx0nKsYcSNrRpmnJ5BaHcKs.jpg	The High Sparrow eyes another target. Jaime confronts a hero. Arya makes a plan. The North is reminded.	\N	7.97	2016-06-06 01:00:00	The Broken Man	1399
75	4	/7CrDDELasQYT2gienzYAPRjYbL9.jpg	While Jaime weighs his options, Cersei answers a request. Tyrion’s plans bear fruit. Arya faces a new test.	\N	8.09	2016-06-13 01:00:00	No One	1399
76	4	/qb302fko45T0TvgsFa12IbSiq2P.jpg	Jon Snow and Ramsay Bolton battle for Winterfell. In Mereen Daenerys deals with old foes and new alliances.	\N	8.97	2016-06-20 01:00:00	Battle of the Bastards	1399
77	4	/m8vzoOKnjzFG8M5iprtweQEQzrW.jpg	Cercei and Loras are about to face their trial. In Winterfell Davos confronts Melisandre. Bran has another glimpse into the past. Daenery makes a decicion before leaving Mereen. \n\nAnd winter has come.	\N	8.90	2016-06-27 01:00:00	The Winds of Winter	1399
78	3	/19NPjmN6o3QGYfu8WnzgDSx75Ov.jpg	\N	\N	9.23	\N	Season 7	1399
79	4	\N	\N	\N	9.20	2017-07-17 01:00:00	TBA	1399
80	4	\N	\N	\N	7.67	2017-07-24 01:00:00	\N	1399
81	4	\N	\N	\N	7.86	2017-07-31 01:00:00	\N	1399
82	4	\N	\N	\N	7.57	2017-08-07 01:00:00	\N	1399
83	4	\N	\N	\N	8.20	2017-08-14 01:00:00	\N	1399
84	4	\N	\N	\N	8.50	2017-08-21 01:00:00	\N	1399
85	4	\N	\N	\N	8.50	2017-08-28 01:00:00	\N	1399
86	2	/dUYx61M4fGSkNeTzaNdufsxTOuw.jpg	James "Ghost" St. Patrick has it all: a beautiful wife, a gorgeous Manhattan penthouse, and the hottest, up-and-coming new nightclub in New York. His club, Truth, caters to the elite: the famous and infamous boldface names that run the city that never sleeps. As its success grows, so do Ghost’s plans to build an empire. However, Truth hides an ugly reality. It’s a front for Ghost’s criminal underworld; a lucrative drug network, serving only the wealthy and powerful. As Ghost is seduced by the prospect of a legitimate life, everything precious to him becomes unknowingly threatened. Once you’re in, can you ever get out?	\N	8.49	2014-06-08 01:00:00	Power	54650
87	3	/h2Ef6jGAgjUDL21RJrfSHsA2A2W.jpg	\N	\N	8.56	2014-06-08 01:00:00	Season 1	54650
88	4	/cv073jDlAI8A2BWTYlK8nFfhagC.jpg	James "Ghost" St. Patrick opens Truth nightclub, hoping its success will allow him to leave his career as a NYC drug kingpin. But an attack on his drug business threatens his plans.	\N	7.72	2014-06-08 01:00:00	Not Exactly How We Planned	54650
89	4	/4toU9rXS3NTBGqBuJkd6hDSZIW1.jpg	Ghost hosts a party for Vogue Magazine, while he and Tommy have to make a tough decision when their drug business is attacked.	\N	7.72	2014-06-15 01:00:00	Whoever He Is	54650
90	4	/wWbSCTFe1M48eIutu1dAVWCpZH0.jpg	A model gets hospitalized after snorting bad cocaine. Ghost, Tommy and Josh investigate, while Josh suggests to involve police. The rift between Tasha and Ghost deepens when she visits the bank to find a lot of their money missing.	\N	7.73	2014-06-22 01:00:00	This Is Real	54650
91	4	/5JqNyr9RLSN6IKxmHTA7URUeWDP.jpg	Ghost and Tommy gather their network of gang leaders while Angela plans surveillance for the same meeting. The mystery assailant strikes again. Ghost admits to Angela that he's married with children.	\N	7.77	2014-06-29 01:00:00	Who Are You?	54650
92	4	/AoSZ4aKWjbVmT3HgpQIaZDs52MG.jpg	Concerned over Ghost's attitude, Tasha interferes with club business. Ghost and Angela pursue their affair. Tommy pursues a club employee.	\N	7.79	2014-07-13 01:00:00	I Gotta Go	54650
93	4	/64TKmmxYtPpTXDbm53DHBIt3MLS.jpg	Tommy makes peace with Ruiz while Angela wires one of Ruiz's gang members. Ghost forgets Tasha's birthday. Ghost and Angela confront the reality of their affair.	\N	7.70	2014-07-20 01:00:00	Who You With?	54650
94	4	/84KDPVD7ZiTysm5wPj9KCXxpOX8.jpg	Tasha sees Angela for the first time. Ghost learns a friend may be behind the hits while Angela races to stop the next attack. Ghost makes a commitment to Angela. The mastermind behind the hits is revealed.	\N	7.94	2014-07-27 01:00:00	Loyalty	54650
95	4	/n7Xltz4KWkirbvAS7PX9FNhZWQ5.jpg	Ghost plans a huge party at Truth, hoping to expand out of NYC and the drug world. Ghost makes a big decision in an attempt to achieve his dream of going legit.	\N	7.99	2014-08-03 01:00:00	Best Laid Plans	54650
96	3	/vImIPJ4HDX6em8Bs1ed7GDejBvQ.jpg	Season two picks up right where it left off: James “Ghost” St. Patrick doubling down on his drug business to save his nightclub and dream of a legitimate future. Ghost’s work troubles pale in comparison to juggling his relationship with his wife, Tasha, and his first love, Angela, who’s also an Assistant US Attorney investigating his drug organization.\n\nGhost is set further back from his dream by his business partner, Tommy, who loves the drug game, and his former mentor, Kanan, fresh out of jail and looking for revenge.\n\nSeason two has Ghost in a race against himself: Can he get out of the drug game alive before Angela discovers who he is?	\N	8.65	2015-06-07 01:00:00	Season 2	54650
97	4	/yCbZ40N4ybiI9locMw8NaCzqOSW.jpg	Ghost picks up the pieces at Truth after the botched murder attempt against him, while recommitting to the drug game. Tommy disappears after learning Angela is with the feds.	\N	7.87	2015-06-07 01:00:00	Consequences	54650
98	4	/tRlahL9Pi7w503PvGcOFiWsoSLC.jpg	Tommy signs on to assist Ghost in expanding the drug trade, but has a serious condition that must first be met, while Ghost is surprised to learn about Kanan getting out of jail.\n	\N	7.79	2015-06-14 01:00:00	No Friends On The Street	54650
99	4	/tqMBMOaSCe5tZuM8wJFMV6UxaZu.jpg	Ghost brings Angela to Miami, where they indulge in the fantasy of being a couple, but reality brings them back to earth. Back in New York, Tommy and Kanan bond.\n	\N	7.76	2015-06-21 01:00:00	Like We're Any Other Couple	54650
100	4	/kAnPMdxPrVFNk7BILGJNaDmCZHE.jpg	Ghost battles to win back his club and must deal with those standing in the way.\n	\N	7.91	2015-06-28 01:00:00	You're the Only Person I Can Trust	54650
101	4	/g8qBm5ekQHT8POKU6j88oUlR0ox.jpg	Ghost and Tommy hustle to sell their product and pay Lobos; the FBI questions Holly.	\N	7.96	2015-07-12 01:00:00	Who You Are and Who You Want to Be	54650
102	4	/xaVUnz5xXP45ybbAVfjtpLdxNbO.jpg	Angela learns that Jamie and Ghost are the same person; the drug syndicate welcomes a new member.	\N	8.07	2015-07-19 01:00:00	Why Her?	54650
103	4	/y3WCb7fz2ezR7FJ1FtRGQ3gcTqW.jpg	Tommy becomes worried after Holly speaks with the feds; Ghost explains his actions to Angela.	\N	7.96	2015-07-26 01:00:00	You're Not the Man	54650
104	4	/uUT9BSEJYQj82HdonNCXbHm50Sj.jpg	Ghost attempts to distance himself from Lobos before Angela gets to him.	\N	8.09	2015-08-02 01:00:00	Three Moves Ahead	54650
105	4	/xdPhHb3isr9gPTDLLxnd7kP3Iqx.jpg	Tommy is pressured to flip on Lobos or go to jail; Ghost tries to do the right thing.	\N	8.25	2015-08-09 01:00:00	Time's Up	54650
106	4	/hHaGdaIzVv222g64GIw7eZL0bK2.jpg	Bodies from Ghost's organization drop left and right, each death inching closer to Ghost and Tommy.	\N	8.30	2015-08-16 01:00:00	Ghost Is Dead	54650
107	3	/ti6rli4AhUCA6e4C2E0P0MgO9FL.jpg	Will James St. Patrick's dream of leaving the drug game and finding love with the woman sworn to bring him to justice end before it begins with the specter of "Ghost" coming back to haunt him? Be careful what you wish for.	\N	8.69	2016-07-18 01:00:00	Season 3	54650
108	4	/8UIz8ZWXMshrqaKEbcouZSsUSpg.jpg	Out of the drug game and with new nightclubs, James St. Patrick is ready to leave “Ghost” behind and begin his new life with Angela. Just one problem: someone knows the truth about Vladimir, Drifty, Ruiz, and Lobos. Angela learns of a shocking discovery at work, and now must decide where to draw the line between love and honor.  Without her husband by her side, Tasha reels from the death of Shawn while having an unsettling theory as to the identity of his killer. On his own in the underworld, Tommy is forced to make some bold moves while he receives a gruesome reminder of his assignment to kill Ghost.	\N	8.05	2016-07-18 01:00:00	Call Me James	54650
109	4	/3panbhDLJWVj75WV1UNOyBtDYRN.jpg	Ghost scrambles to tie up the most lethal of loose ends while he deals with new nightlife competition.  Tommy confronts Tasha over a lie from the past, as she and Angela must learn to coexist as their domestic lives change. With his drug organization unraveling, Tommy gains an advisor in his returned love, Holly, who enlists an old friend to solve a new problem.	\N	8.01	2016-07-25 01:00:00	It's Never Over	54650
110	4	/qkevRqYmqqF5m4xKjfReYqplC3S.jpg	Ghost is presented with a business opportunity that could take the clubs to the next level, but must outshine devious new rivals, all while looking over his shoulder for Lobos’s revenge. Tommy reunites with Tasha in a business scheme, while he also tries to keep a new drug contact under control and protect his reputation in the streets. Tasha and Ghost are tested when Tariq crosses a line.	\N	7.97	2016-08-01 01:00:00	I Got This on Lock	54650
111	4	/by63OYg1leGsZzbOh18i1SgY8GF.jpg	Ghost is spread even thinner between Angela, the children, business and Tommy as the opportunity to expand the clubs evolves; Tommy struggles with a decision, Kanan re-enters the life; Angela has doubts.	\N	8.07	2016-08-08 01:00:00	Don't Worry, Baby	54650
112	4	/jEkxse3mHY2tiV6gb1IGXbzZCf4.jpg	Tommy goes gunning for the culprit who tried to kill him; Greg pressures Ruiz to give up the "Ghost," as Angela tries to keep them at bay. Meanwhile, Proctor brings a new problem to the fore for Ghost to deal with.	\N	8.34	2016-08-15 01:00:00	Help Me	54650
113	4	/wTcneh422F8hSEqPrwihHi6lt2L.jpg	Ghost and Tommy reunite to take out a dangerous enemy and enlist Tasha to help them escape detection by Angela and her team; Ghost loses control at a critical moment.	\N	8.09	2016-08-22 01:00:00	The Right Decision	54650
114	4	/rX7odn83KSWJQwHAGPkfTljOBFh.jpg	Angela reels after her breakup and faces difficult questions at work; Ghost scrambles to keep the club deal alive as he and Tommy are forced to re-enter the game; Dre learns the meaning of the La Arana card.	\N	8.05	2016-08-29 01:00:00	Don't Go	54650
115	4	/OfypxqAnwVhPWU6gYNCHd26hYk.jpg	Mike and Angela hunt for the mole; Angela gets a lead, while she must solidify Tommy's alibi; Tasha receives a warning as Tariq makes a dangerous new friend; Milan issues an edict to push a new product.	\N	8.03	2016-09-05 01:00:00	Trust Me	54650
116	4	/xJd3zDR4jYOlu8bpdIGxFI5eIMm.jpg	Angela searches for the mole; Ghost works to regain the club deal; Kanan exerts a dark influence upon Tariq; Milan warns Tommy about the price of betrayal.	\N	8.03	2016-09-19 01:00:00	I Call the Shots	54650
117	4	\N	Ghost attempts to retrieve evidence while throwing the party of his career; Tasha forms an unlikely alliance in an effort to save her family; Tommy considers a move that could change everyone's lives.	\N	8.36	2016-09-26 01:00:00	In My Best Interest	54650
118	3	/qKbqQMTBSRe1rafVlVlCXUdylXt.jpg	\N	\N	9.67	2017-06-26 01:00:00	עונה 4	54650
119	4	/hiLwF72RJFWw2R3W2KQyd5TaHXK.jpg	Ghost faces threats from all sides following his arrest for the murder of Agent Knox; Tasha scrambles to get bail as the Feds begin to build their case; Tommy navigates his new role and enlists help in recovering Tariq.	\N	8.23	2017-06-26 01:00:00	When I Get Out	54650
120	4	/ml73DkrvKVzD23iK15SXoe8Md9F.jpg	Proctor works to protect his client as Ghost faces harassment; the team discusses its strategy for taking down St. Patrick; Tommy struggles to let go of his old duties; Tasha talks to the children about what is going on.	\N	8.27	2017-07-03 01:00:00	Things Are Going to Get Worse	54650
121	4	/uzDtEwIYxpBIPvzIQvR8bkZIQXF.jpg	\N	\N	0.00	2017-07-10 01:00:00	The Kind of Man You Are	54650
122	4	\N	\N	\N	0.00	2017-07-17 01:00:00	We're in This Together	54650
123	4	\N	\N	\N	0.00	2017-07-24 01:00:00	Don't Thank Me	54650
124	4	\N	\N	\N	0.00	2017-07-31 01:00:00	New Man	54650
125	4	\N	\N	\N	7.00	2017-08-07 01:00:00	You Lied to My Face	54650
126	4	\N	\N	\N	0.00	2017-08-14 01:00:00	It's Done	54650
127	4	\N	\N	\N	0.00	2017-08-21 01:00:00	That Ain't Me	54650
128	4	\N	\N	\N	0.00	2017-08-28 01:00:00	You Can't Fix This 	54650
129	2	/22mSgZmStDb1luWdolYY3feLVW9.jpg	Piper Chapman is a public relations executive with a career and a fiance when her past suddenly catches up to her. In her mid-30s she is sentenced to spend time in a minimum-security women's prison in Connecticut for her association with a drug runner 10 years earlier. This Netflix original series is based on the book of the same title. Forced to trade power suits for prison orange, Chapman makes her way through the corrections system and adjusts to life behind bars, making friends with the many eccentric, unusual and unexpected people she meets.	\N	8.34	2013-07-11 04:00:00	Orange Is the New Black	1424
130	3	/kJzjhNiMiDk7sqgrmbEAk56oR9D.jpg	Piper must trade her comfortable New York life for an orange prison jumpsuit when her decade-old relationship with a drug runner catches up with her.	\N	8.48	2013-07-11 04:01:00	Season 1	1424
131	4	/g8EpHVZZn0LJvRW7raCSkfO17mE.jpg	Sentenced to fifteen months for a crime committed in her youth, Piper Chapman leaves her supportive fiance Larry for her new home: a women's prison.	\N	7.67	2013-07-11 04:00:00	I Wasn't Ready	1424
132	4	/mbLSYxzuC9AyVmWEoTTizPS7c3y.jpg	After insulting the food in front of the prison chef, Piper is starved out by the kitchen staff and struggles to offer up an acceptable apology.	\N	7.81	2013-07-11 04:00:00	Tit Punch	1424
133	4	/bPuWKEOSBztyYJmzDgEiQHpbmz4.jpg	Targeted for romance by a fellow prisoner, Piper finds that subtlety is an ineffective approach to letting her suitor down.	\N	7.85	2013-07-11 04:00:00	Lesbian Request Denied	1424
134	4	/eCxIEhDguoaIpoIHct0QeTGjSRH.jpg	Piper gets to know her stern new roommate; the prisoners prepare a farewell party for one of their own; a misplaced screwdriver has dire consequences.	\N	7.88	2013-07-11 04:00:00	Imaginary Enemies	1424
135	4	/ZUQMlwisANsGExqFy3xiAncO4o.jpg	When her sighting of a legendary feral chicken polarizes the inmates, Larry wonders if Piper is getting too absorbed in the "fishbowl" of prison life.	\N	7.77	2013-07-11 04:00:00	The Chickening	1424
136	4	/pHL87ffFnhbAziM7S9jnHet6EN5.jpg	The inmates campaign along racial lines for positions on a prisoners council, but Piper tries to stay above the increasingly raucous competition.	\N	7.82	2013-07-11 04:00:00	WAC Pack	1424
137	4	/hSan3djgV7HIDLx4NZ1hCUJuNXS.jpg	Piper wants the prison's outdoor running track reopened, but in order to get it, she'll have to give her corrections officer something he wants.	\N	7.80	2013-07-11 04:00:00	Blood Donut	1424
138	4	/fIbkhhqGNGCq01aSn5vKhqOhtIL.jpg	Red gets pressured to smuggle drugs through her kitchen; Larry publishes an article about Piper in the "New York Times;" two babies come into the world.	\N	7.80	2013-07-11 04:00:00	Moscow Mule	1424
139	4	/bdcoyRcv1aQKW0CyRYOmWhHykEW.jpg	Thanksgiving arrives with the promise of a visit by Larry, but Piper's raunchy dance moves land her in solitary with a holiday feast of moldy bologna.	\N	8.03	2013-07-11 04:00:00	Fucksgiving	1424
140	4	/7iBAq85IZAiNn3bQhAueCj421t0.jpg	Pennsatucky discovers a new skill; the inmates try to scare delinquent teenagers straight; Pornstache's side business suffers a tragic setback.	\N	8.09	2013-07-11 04:00:00	Bora Bora Bora	1424
141	4	/gt0YGGOjWY1MMiC6IvQWNrnJZvb.jpg	The prisoners mourn one of their own and even a drunken Pornstache reveals surprising emotions; Larry gives a revealing radio interview.	\N	8.11	2013-07-11 04:00:00	Tall Men with Feelings	1424
142	4	/xNl7oihTm2PQB9V3LR3fNhnL2Ug.jpg	Painful truths reorient several relationships and careers; Pennsatucky feels disrespected by Piper, which is not good; Larry delivers an ultimatum.	\N	7.99	2013-07-11 04:00:00	Fool Me Once	1424
143	4	/za4SjyamKLOHLwDVUPjStYZfayL.jpg	Red's scheme to reclaim her kitchen backfires; the inmates stage a Christmas pageant; Piper's plans unravel even as she realizes her life is in jeopardy.	\N	8.39	2013-07-11 04:00:00	Can't Fix Crazy	1424
144	3	/xekxbBb8sk6gyi0Xq3nNwqJFHX1.jpg	Shocking revelations and new arrivals shake up the lives and relationships of Litchfield's prisoners.	\N	8.47	2014-06-06 04:01:00	Season 2	1424
145	4	/9HI0CaWvqwHL4xd6yt6C5b9dWzB.jpg	Piper's world is turned upside down when she is forced to confront the consequences of her actions and face new challenges.	\N	8.00	2014-06-06 04:00:00	Thirsty Bird	1424
146	4	/fUrtBPiI8v7PLVs3v4nHN1k76Tl.jpg	A mock Job Fair provides Taystee with a chance to show off her business smarts; Red feels isolated from her prison family.	\N	7.76	2014-06-06 04:00:00	Looks Blue, Tastes Red	1424
147	4	/wtTt2H5jdECvdYQpgjepvTS852K.jpg	Piper is challenged by her Soso experience; Morello gets her heart broken; a figure from Taystee's past arrives to disturb the status quo.	\N	7.86	2014-06-06 04:00:00	Hugs Can Be Deceiving	1424
148	4	/1o3gOCq5lX6YYZ4tBpNKXqRz0jv.jpg	Sophia gives the women a much-needed lesson in female anatomy; Morello takes a detour; Larry makes some life changes.	\N	7.88	2014-06-06 04:00:00	A Whole Other Hole	1424
149	4	/gjQGxxAQmxVbkMT522pI8e9JYZd.jpg	A bathroom turf war sees deeper lines drawn in the sand as Gloria and Vee go head to head. Piper receives devastating news.	\N	7.79	2014-06-06 04:00:00	Low Self Esteem City	1424
150	4	/gotmC6GaCD4luNBetAUlky6wF2d.jpg	Love is in the air as the inmates prepare for a Valentine's Day party; Red makes an intriguing new discovery. Larry asks Piper to be his prison mole.	\N	7.89	2014-06-06 04:00:00	You Also Have a Pizza	1424
151	4	/gGIph0QRjG59VCe2anuhCMWRm4n.jpg	Piper starts a prison newsletter with the help of Healy and a few other inmates; Vee launches an entrepreneurial enterprise. 	\N	7.78	2014-06-06 04:00:00	Comic Sans	1424
152	4	/nhiycDr1AMZOyMAWZhoFmK3iHSw.jpg	Piper faces a new backlash over special privileges; Caputo feels pressure to toughen up, resulting in administrative changes.	\N	7.86	2014-06-06 04:00:00	Appropriately Sized Pots	1424
153	4	/xUMh9zTpMfq6HOFFeMcYeNg7ZuA.jpg	Piper's relationship with Larry faces a real-world test; Red's effort to redeem herself is finally rewarded. A familiar figure returns to Litchfield.	\N	7.96	2014-06-06 04:00:00	40 Oz. of Furlough	1424
154	4	/uL9hSfLBOEkGqcSf6N0jSnJtJV9.jpg	The guards get tougher in a bid to turn up prison contraband; a big, lingering secret is finally revealed.	\N	8.03	2014-06-06 04:00:00	Little Mustachioed Shit	1424
155	4	/rWECLIVLiEqnGyajfUjmEL4oYZp.jpg	Piper is shocked at an unexpected change in her status; Soso's hunger strike attracts new support that takes on a religious fervor.	\N	7.94	2014-06-06 04:00:00	Take a Break from Your Values	1424
156	4	/yoGOVt01tQfNBz7GcmtQk1gzjcg.jpg	Tensions run high as a prison power outage forces several issues to come to light. Piper finds herself compromised and is forced to think on her feet.	\N	8.11	2014-06-06 04:00:00	It Was the Change	1424
157	4	/bossMzlq0cPL8f2DVxYtpv58iHZ.jpg	Several futures hang in the balance as the inmates face and confront their worst nightmares: Life will never be the same again.	\N	8.62	2014-06-06 04:00:00	We Have Manners. We're Polite.	1424
158	3	/6CVeQu1HCgolMRJ8Gr1iYwF5aIc.jpg	New business interests, spiritual movements and parental problems upend lives and ignite power struggles among Litchfield's residents and guards.	\N	8.04	2015-06-12 04:01:00	Season 3	1424
159	4	/9UoltpPmKZgBU6MLYLtDchzcbOv.jpg	Caputo's kinder, gentler new regime includes organizing a Mother's Day fair for the inmates that brings up a LOT of mixed feelings about family.	\N	7.47	2015-06-12 04:00:00	Mother's Day	1424
160	4	/tTsjwx8hCEppIjn3HkHwEWJF3sQ.jpg	Tempers flare when bed bugs invade. Alex cracks. Red lashes out at Piper. Aleida interferes with Daya and Bennett. Caputo gets bad news.	\N	7.46	2015-06-12 04:00:00	Bed Bugs and Beyond	1424
161	4	/tefQcT6PENAO1xnpNMTJoBESeZ4.jpg	Nicky's stash situation gets complicated. Alex and Crazy Eyes try a new drama class. Red assists Healy with a personal matter.	\N	7.60	2015-06-12 04:00:00	Empathy Is a Boner Killer	1424
162	4	/flFl4tdrCki3b1UenHss5GjdrG8.jpg	Big Boo comes up with a scheme to make money. Daya, Taystee and Crazy Eyes confront reality. Caputo tries to make a good impression on some visitors.	\N	7.56	2015-06-12 04:00:00	Finger in the Dyke	1424
163	4	/qCInUgSmQNaBUsEimoNmZNy6ccr.jpg	Rumors fly among the inmates about a new, higher-paying job assignment, especially when they have to take a test for it	\N	7.48	2015-06-12 04:00:00	Fake It Till You Fake It Some More	1424
164	4	/upuyvrCXjkyaKNH7qfc6wgbOyE4.jpg	Regime change isn't going over well with the staff, but Red makes it work for her. Lorna finds a way to meet men. Chang shows her private side.	\N	7.61	2015-06-12 04:00:00	Ching Chong Chang	1424
165	4	/iZBFrUgXOFBY6u5CbRWtv20cdC.jpg	Norma’s healing powers draw more believers. Piper creates a new business venture. Caputo breaks in the new hires.	\N	7.56	2015-06-12 04:00:00	Tongue-Tied	1424
166	4	/93XCYxmbikqADPVbaXLB3Iw3J2R.jpg	Piper gets creative in order to grow her business. Crazy Eyes’s sci-fi sex story for drama class is a hit. Alex doesn’t trust new inmate Lolly.	\N	7.53	2015-06-12 04:00:00	Fear, and Other Smells	1424
167	4	/y068Jmgm5pTVBAaM5riWfBigySo.jpg	Too many inmates seem to be getting religion, so a rabbi comes to visit. Leanne tries to organize Norma's followers.	\N	7.58	2015-06-12 04:00:00	Where My Dreidel At	1424
168	4	/eHGAJB3x0ezLeUnm6Aw5UYAdu6v.jpg	Pennsatucky, Piper, Crazy Eyes and Lorna get closer with their new admirers. Tensions between Sophia and Gloria, and Alex and Lolly escalate.	\N	7.57	2015-06-12 04:00:00	A Tittin' and a Hairin'	1424
169	4	/2ZxBZRh9uO77f6jMZsdkGoBBNNB.jpg	Caputo and Piper confront labor issues. A miracle occurs in Norma's group. Crazy Eyes's erotica winds up in the hands of the staff.	\N	7.69	2015-06-12 04:00:00	We Can Be Heroes	1424
170	4	/ubmos2DF9Jew1va9DMFfrduMTre.jpg	Daya goes into labor. Sophia suffers a hate crime. Stella helps Piper with a business snag. Taystee takes on a new role.	\N	7.75	2015-06-12 04:00:00	Don’t Make Me Come Back There	1424
171	4	/fbQdjpUCgWtsDt7zydhL0UPgrOI.jpg	Miracles and conversions occur, but Piper and Caputo know that some situations can't be dealt with through spiritual means.	\N	8.12	2015-06-12 04:00:00	Trust No Bitch	1424
172	3	/r4kUNRIcBAPJJ3MSzTbyzbLNGBa.jpg	Tensions were already running high at Litchfield. Throw 100 new inmates into the mix, and it's going to get really rough.	\N	8.44	2016-06-17 04:01:00	Season 4	1424
173	4	/bi53Ydx5ZvShRrsEAHYMVjqUTSq.jpg	With a major security breach and a lot of new inmates, Caputo has to call in the big guns. Things get a little too real for Crazy Eyes and Lolly.	\N	7.80	2016-06-17 04:00:00	Work That Body for Me	1424
174	4	/mYRHZ3k6OwoeBelUjOHvlkvltw3.jpg	The newcomers stir up ethnic and domestic conflicts, but Maria sees an opportunity. Judy's special treatment raises eyebrows.	\N	7.52	2016-06-17 04:00:00	Power Suit	1424
175	4	/bJkRqnYZcVNK2IS2jVsxzICN4Eg.jpg	A new job puts Taystee close to Caputo. Lorna has to get creative in her marriage. Soso and Poussey deal with some awkward truths.	\N	7.63	2016-06-17 04:00:00	(Don't) Say Anything	1424
176	4	/paFCasrlPnCrViIqqSvSU91n6sG.jpg	Nothing stays hidden for long when emotions run high, but Red, Healy and Caputo try to keep the peace. Piper has a business competitor.	\N	7.56	2016-06-17 04:00:00	Doctor Psycho	1424
177	4	/7ragrxvPdU3LKiC42g61vuEinjH.jpg	Company policies lead to a shortage of critical supplies and an eventful trip to a prison convention. Piscatella starts a new anti-gang initiative.	\N	7.51	2016-06-17 04:00:00	We'll Always Have Baltimore	1424
178	4	/iELqxCboiOPUlYSxkQ9MvmdhKhM.jpg	Piper's plan to edge out the competition could backfire badly. Cindy finds a way to make Taystee's job pay off. Luschek gets some interesting mail.	\N	7.66	2016-06-17 04:00:00	Piece of Sh*t	1424
179	4	/2iKVENQ56soRiWNvSCGKhuuLiKD.jpg	Paranoia strikes deep for Lolly and Judy, aggravating an already tense situation. Red sticks to a Russian tradition for an important occasion.	\N	7.76	2016-06-17 04:00:00	It Sounded Nicer in My Head	1424
180	4	/893EZMh52fzJk1IkEC8Fi4pktzx.jpg	A new work detail doesn't go over well with the inmates. Judy seeks help from Poussey. Maria finds a place she can conduct business.	\N	7.73	2016-06-17 04:00:00	Friends in Low Places	1424
181	4	/fxPJFuk8sxdArWsTz8B9bh2m9HE.jpg	Ramos and Flores figure out ways to rebel against authority. A news item has an unexpected effect. Red and Lorna face personal disappointment.	\N	7.60	2016-06-17 04:00:00	Turn Table Turn	1424
182	4	/dbFDvMkv1hadq0L8sVsgd4AS7Jo.jpg	The movie night selection becomes controversial. Aleida makes an adjustment. Piper worries the prison punishments are getting medieval.	\N	7.72	2016-06-17 04:00:00	Bunny, Skull, Bunny, Skull	1424
183	4	/lGbLb4AF59smEctyLZznphCB192.jpg	Caputo's leadership is challenged and the inmates are in for a long night of lockdown after workers make an unsettling discovery.\n	\N	7.93	2016-06-17 04:00:00	People Persons	1424
184	4	/87BlphK0MYFDt19dIJLzstX0GVe.jpg	Alliances shift among the prison "families" as Piscatella and his guards crack down. Poussey, Judy and Alex prefer to look ahead to the future.	\N	8.09	2016-06-17 04:00:00	The Animals	1424
185	4	/hRsZxbPJ4eNmFwK6rruht3kA9qK.jpg	Corporate bureaucracy and simmering anger work against Caputo's efforts to keep a sensitive situation under control.	\N	8.36	2016-06-17 04:00:00	Toast Can't Never Be Bread Again	1424
186	3	/mv9FXJJZqRPv0lxKGBfXE3c3Eaq.jpg	\N	\N	7.82	2017-06-09 04:00:00	Season 5	1424
187	4	/gmCtFgdkdciHT967oo3pKLlefsH.jpg	As the standoff at the prison spirals into a full-blown riot, enterprising inmates take advantage of the confusion. Taystee confronts Caputo.	\N	7.68	2017-06-09 04:00:00	Riot FOMO	1424
188	4	/kXhPjj0bfuiz3QtLeEIBOakIODO.jpg	Maria convenes a special assembly in the chapel as the inmates plot their next move. Frieda makes use of the survival skills she learned as a kid.	\N	7.63	2017-06-09 04:00:00	Fuck, Marry, Frieda	1424
189	4	/vHGOKOCmb4riDiU5PQHE160zlAx.jpg	Linda begins to see the prison in a new light, while Judy grows desperate to escape. With darkness falling, the inmates compile a list of demands.	\N	7.53	2017-06-09 04:00:00	Pissters!	1424
190	4	/vwzh6rE8glHMM8Oa9zZ8wuzpXqK.jpg	Red and Blanca dig for dirt on Piscatella. Suzanne conducts a séance. The guards show off their talents for "Litchfield Idol" judges Leanne and Angie.	\N	7.55	2017-06-09 04:00:00	Litchfield's Got Talent	1424
191	4	/A15Ch7FQxvAheEKKV8sSJQ04j4k.jpg	When the inmates' antics make the morning news, Flaca and Maritza soak up the spotlight. Brandy and her crew auction off Judy to the highest bidder.	\N	7.73	2017-06-09 04:00:00	Sing It, White Effie	1424
192	4	/hCxyhrdLrl3iJeAf6O4kZEfBla2.jpg	Boo defends Doggett, Janae consoles Soso, and Lorna comes on to Nicky. While Alex lays low in the yard, Piper decides to take a stand.	\N	7.64	2017-06-09 04:00:00	Flaming Hot Cheetos, Literally	1424
193	4	/bhYEF8TJxe77IEb9EMnIV0EnPPq.jpg	Black Cindy concocts a scheme to distract Suzanne when she spirals out of control. Taystee and Piper search for ways to honor Poussey's memory.	\N	7.60	2017-06-09 04:00:00	Full Bush, Half Snickers	1424
194	4	/5FeaWGRnzWesG2hQYgGpKr0vrv6.jpg	While Taystee sits down with a negotiator, Red and Blanca put their own plan into action. Gloria counsels Daya and asks Caputo for a favor.	\N	7.75	2017-06-09 04:00:00	Tied to the Traintracks	1424
195	4	/62B5y5EgpEYkXIR8kEUkEWlsPyP.jpg	Red senses trouble, but the others are convinced she's just paranoid. Taystee and Black Cindy enlist an unlikely ally, and two old friends clash.	\N	7.78	2017-06-09 04:00:00	The Tightening	1424
196	4	/aYeCe7Qpst1h9oOt4gdYk053ebW.jpg	Taystee tries to keep the negotiations on track. Angie comes up with an idea for fixing Leanne's finger. Piscatella's past is revealed.	\N	7.91	2017-06-09 04:00:00	The Reverse Midas Touch	1424
197	4	/oHaFJ0PH9GQBKc6IbOKjhSMjOV2.jpg	Red and the others weigh their options. Gloria wrestles with her conscience as she moves forward with a plan. Lorna takes over the pharmacy.	\N	7.81	2017-06-09 04:00:00	Breaking the Fiberboard Ceiling	1424
198	4	/cmH08QQQJpuZRWyCdAve75qyLQD.jpg	Boo dabbles in blackmail, Nicky promises to help Lorna, Doggett makes a discovery, and Piper comes to a realization about Alex.	\N	7.76	2017-06-09 04:00:00	Tattoo You	1424
199	4	/gEJVDdXsYK6yKvkT2rJM7phm77i.jpg	As chaos descends on Litchfield three days into the riot, the inmates wonder what the future holds and seek solace in loved ones.	\N	8.30	2017-06-09 04:00:00	Storm-y Weather	1424
200	2	/cCDuZqLv6jwnf3cZZq7g3uNLaIu.jpg	A horrifying zombiocalypse spin-off series from The Walking Dead, set in the same universe but starting at a far earlier time in Los Angeles. The show follows normal people learning to deal with the rapidly growing collapse of civilization, at the very beginning of a zombie outbreak.In Los Angeles, a city where people come to escape, shield secrets, and bury their pasts, we follow this mysterious outbreak as it threatens to disrupt what little stability high school guidance counselor Madison Clark and English teacher Travis Manawa have managed to assemble. The pressure of blending two families while dealing with resentful, escapist, and strung out children takes a back seat when society begins to break down. A forced evolution, and survival of the fittest takes hold, as our dysfunctional family finds they must either reinvent themselves or embrace their darker histories.	\N	7.31	2015-08-23 04:00:00	Fear the Walking Dead	62286
201	3	/i2bXSzpKWw0RVmLdldhBFT3a0Ty.jpg	\N	\N	7.34	2015-08-24 01:00:00	Season 1	62286
202	4	/AqVgGJBEiboLcEvrORj825asXaQ.jpg	A highly dysfunctional blended family is forced together when they realize a reported virus is actually the onset of the undead apocalypse.	\N	7.48	2015-08-24 01:00:00	Pilot	62286
203	4	/ucJSgfXGSUXllKkUXj5VSeuzTjY.jpg	While Madison struggles to keep Nick from crippling withdrawal, Travis ventures out to find his son before the city of Los Angeles falls.	\N	7.58	2015-08-31 01:00:00	So Close, Yet So Far	62286
204	4	/h549fQfrFm4VAstYHuiN4pBQKQF.jpg	After they escape a riot, Travis, Liza and Chris seek refuge with the Salazars. Madison defends her home.	\N	7.60	2015-09-14 01:00:00	The Dog	62286
205	4	/4RQkvl5d7E9Bzy8Xb9PHX609bsA.jpg	Madison and Travis see different sides of the National Guard's occupation in their neighborhood; the family tries to adapt to the new world.	\N	7.52	2015-09-21 01:00:00	Not Fade Away	62286
206	4	/mch2M5E6ep67gIIcjV9GPc5AnJZ.jpg	The National Guard's plan for the neighborhood is revealed. Meanwhile, Travis and Madison make a difficult decision.	\N	7.55	2015-09-28 01:00:00	Cobalt	62286
207	4	/eeZsNbAxVsysrLOk0HMDUrZVMQf.jpg	As civil unrest grows, and the dead take over, Travis and Madison try to devise ways to protect their families.	\N	7.91	2015-10-05 01:00:00	The Good Man	62286
208	3	/qMwcN9GFKmETQViGl6268jCyyXi.jpg	\N	\N	7.08	2016-04-11 01:00:00	Season 2	62286
209	4	/xbi94WOnv8nFKNDipP3OaAC58pz.jpg	After fleeing a burning Los Angeles on Strand's yacht, tensions arise among the group. Strand remains mysterious. Our group encounters danger at sea.	\N	7.37	2016-04-11 01:00:00	Monster	62286
210	4	/9Yb6TGfo8YfYIc8oRRCi86Ga9bA.jpg	The group seeks shelter with a survivalist family and Madison tries to uncover the family's true motives. Salazar works to discover Strand's intentions.	\N	7.42	2016-04-18 01:00:00	We All Fall Down	62286
211	4	/iOSxUesOZD9a1lTC508lk0e97z3.jpg	Madison confronts Strand about his mysterious destination. Nick, Alicia and others inspect wreckage from a plane crash.	\N	7.52	2016-04-25 01:00:00	Ouroboros	62286
212	4	/qpStK1MQtA5AUrhjgd0PvC0ZDCU.jpg	The group lets a family in distress board the Abigail. Strand's past begins to come to light. Nick looks for an associate of Strand.	\N	7.61	2016-05-02 01:00:00	Blood in the Streets	62286
213	4	/seXoGUWAZ6DMSMQw4VlZPf5zjfa.jpg	Alicia works toward reuniting with her family. Travis comes across a familiar face. Madison and Nick try to save their family against all odds.	\N	7.52	2016-05-09 01:00:00	Captive	62286
214	4	/niX3UGNmPZOVw8h0v4t7jXcL8eU.jpg	As Abigail arrives at her destination, conflicts arise. Chris makes a shocking decision. Nick knows a new mother figure.	\N	7.47	2016-05-16 01:00:00	Sicut Cervus	62286
215	4	/xcqecmQFHLAMFPC0z5Q1n3qN56F.jpg	The family faces their biggest test yet; Nick, Madison, Travis and others try to stay close to each other.	\N	7.37	2016-05-23 01:00:00	Shiva	62286
216	4	/aUH2ItdbHS3kPxfWwitkBKkR4kf.jpg	Nick's search for answers leads him into a deadly dog-eat-dog landscape. A dark time from his past is uncovered.	\N	7.29	2016-08-22 01:00:00	Grotesque	62286
217	4	/xlsY4gXwX8QAH5H3ODGfNcCPkrF.jpg	After the fall of the compound, Madison, Strand and others forge a tenuous path forward.  Meanwhile, Nick is recruited for a perilous assignment.	\N	7.42	2016-08-29 01:00:00	Los Muertos	62286
218	4	/qFEZHshhf0QsSteUzu3PFYgOLL0.jpg	Travis struggles to connect with Chris while searching for shelter.  Meanwhile, Alicia meets a lonely woman with a bloody past.	\N	7.60	2016-09-05 01:00:00	Do Not Disturb	62286
219	4	/p3MLwCdUOcNK1X0vH0jlh7fcQdI.jpg	Alicia and Madison try to bring two competing factions together; Nick uses skills from his past for his new role.\n	\N	7.55	2016-09-12 01:00:00	Pablo & Jessica	62286
220	4	/nlRGmFzgqyl0vyJ0TjvWtFEDCmh.jpg	Madison springs into action when one of the hotel residents gets violent.  Meanwhile, Alejandro shows a darker side of himself at the Colonia.	\N	7.50	2016-09-19 01:00:00	Pillar of Salt	62286
221	4	/bJDbkqfgPyf1UI8tYXC9dGE1kkV.jpg	Madison struggles to cope as a large number of refugees flood into the hotel, including someone familiar but unexpected.	\N	7.41	2016-09-26 01:00:00	Date of Death	62286
222	4	/ymHnr9axhOlkSn2urQvAqvnz05o.jpg	Travis is thrown off by new refugees; Nick must decide if he's going to stay at the Colonia with Luciana or leave.	\N	7.91	2016-10-03 01:00:00	Wrath	62286
223	4	/u6G7ItO8Bn9eFg9l7vpu44nQokm.jpg	Season finale. When Travis' rage causes unrest at the hotel, Madison has to choose whether or not she will stand by him; Nick becomes leader of the Colonia as Narcos close in.	\N	7.82	2016-10-03 01:00:00	North	62286
224	3	/cMh46P517YVBedpMtO3ucBvK1jM.jpg	\N	\N	8.63	2017-06-05 01:00:00	Season 3	62286
225	4	/ibvKh25Zudki90LYVGzkA0m9qvX.jpg	In the third season opener, the Clark family find themselves in a dire predicament and must work together to discover a path to safety.	\N	7.69	2017-06-05 01:00:00	Eye of the Beholder	62286
226	4	/qc9LbqdSOKoKgx24iIBBXr5wjSz.jpg	Following a harrowing journey, the Clark family arrive at their new home; and Strand faces resistance as he attempts to hold power over his domain.	\N	7.64	2017-06-05 01:00:00	The New Frontier	62286
227	4	/9wp7BHmCcmz9EnT9nwUiLa5O2qb.jpg	Still finding their place, Alicia and Nick fall in with new crowds while Madison discovers Otto's past mimics that of her own.	\N	7.57	2017-06-12 01:00:00	TEOTWAWKI	62286
228	4	/uXwWHomxsCoSj80YO67Z1jELxff.jpg	A mysterious character searches for purpose and soon becomes tied to the struggle over a key resource in the apocalypse.	\N	7.87	2017-06-19 01:00:00	100	62286
229	4	/hXpNjQXE2V01E0AiKCHhhzpPUeb.jpg	An oncoming threat disrupts peace; Madison and Troy search for answers; Alicia must reconcile with her past.	\N	7.67	2017-06-26 01:00:00	Burning in Water, Drowning in Flame	62286
230	4	\N	Loyalty wavers at the Ranch; news of incoming danger spreads in the community; Madison struggles to keep everyone together; Nick grapples with a hard truth.	\N	7.80	2017-07-03 01:00:00	Red Dirt	62286
231	4	\N	A new arrival sows a divide within the ranch. Meanwhile, Alicia forms a new relationship in hopes of maintaining peace.	\N	8.00	2017-07-10 01:00:00	The Unveiling	62286
232	4	\N	Madison must negotiate the terms of an agreement in the midst of ranch-wide turmoil; and Nick and Alicia challenge their mother's motives.	\N	3.67	2017-07-10 01:00:00	Children of Wrath	62286
233	2	/cFcZYgPRFZdBkA7EsxHz5Cb8x5.jpg	The Doctor is an alien Time Lord from the planet Gallifrey who travels through all of time and space in his TARDIS. He has a long list of friends and companions who have shared journeys with him. Instead of dying, the Doctor is able to “regenerate” into a new body, taking on a new personality with each regeneration. Twelve actors, plus John Hurt, have played The Doctor thus far.	\N	9.04	2005-03-26 06:00:00	Doctor Who	57243
234	3	/9Jt2FFCAME7eHDC28r4qCHErhhF.jpg	\N	\N	8.22	2005-03-26 20:30:00	Season 1	57243
235	4	/irTDkbtPQ4aM9YQw1uEevzk5rSz.jpg	Location: London, England\nDate: 4th/5th/6th March 2005\nEnemy: Nestene Consciousness\n\nRose Tyler stumbles across a man called The Doctor as he seeks out the Nestene Consciousness, to prevent the living plastic it is controlling from taking over the world.	\N	7.68	2005-03-26 18:45:00	Rose	57243
236	4	/hg7IMOwTe5zV89CjcoOv0tJFZe6.jpg	Location: Platform 1 (A space station orbiting Earth)\nDate: 5,000,000,000 AD\nEnemy: The Lady Cassandra\n\nThe Doctor takes Rose on her first voyage through time: to the year five billion, when the Sun is about to expand and swallow the Earth. She is cautious and soon starts to question her reasons for joining The Doctor. But amongst the powerful alien races gathering to watch on Platform One, a murderer is at work. Who is controlling the mysterious and deadly metal spiders?	\N	7.81	2005-04-02 17:45:00	The End of the World	57243
237	4	/l3oSyFTBXYVSRMNXBEC2u40Jw60.jpg	Location: Cardiff, Wales\nDate: 24th December, 1869\nEnemy: The Gelth\n\nThe Doctor plans to take Rose back through time to Naples, 1860, but instead they arrive in Cardiff, 1869. In Victorian Cardiff, the dead are walking and creatures made of gas are on the loose. The time-travellers team up with Charles Dickens to investigate Mr Sneed, the local undertaker, who's hiding a very big secret. However, this time, The Doctor won't be able to save everyone.	\N	7.62	2005-04-09 17:45:00	The Unquiet Dead	57243
238	4	/cCmY8qKoI88FMuZaQ8GzYMQxDWt.jpg	Location: London, Earth\nDate: March, 2006\nEnemy: Slitheen\n\nThe  Doctor and Rose return to modern-day Earth, only to find it has been a year since Rose first set off, and everyone thought she was missing, presumed dead. Whilst there, a spaceship crashes into Big Ben and lands in the Thames. Soon, all is not as it seems with the residents of 10 Downing Street.	\N	7.55	2005-04-16 17:45:00	Aliens of London (1)	57243
271	4	/yd4ZXt6HpZw9ecancFH6aLk6331.jpg	Location: A boys' boarding school \nDate: 1913 \nEnemies: The Family of Blood \nEngland, 1913. A schoolteacher called John Smith dreams of adventures in time and space. The Doctor, along with Martha, heads to a boarding school, but what he finds is far from ordinary...\n\nConclusion.	\N	8.52	2007-06-02 17:45:00	The Family of Blood (2)	57243
239	4	/oMyzp40ovZV0OKOcMcLSoV0WMVV.jpg	Location: London, Earth\nDate: March, 2006\nEnemy: Slitheen\n\nWith the Doctor, Rose, and MP Harriet Jones trapped inside Downing Street, the Slitheen make their move: Nuclear Warfare. If the human race is obliterated, the Earth can be sold on the Galactic Black Market for a very reasonable price. It's up to the Doctor to defeat the Slitheen before the entire population of the Earth is wiped out. But will he have to make the ultimate sacrifice: Rose Tyler...?	\N	7.49	2005-04-23 17:45:00	World War Three (2)	57243
240	4	/go14P6iykl0fnkXVD4RXRI08Bk1.jpg	Location: Utah, Earth\nDate: 2012\nEnemy: Dalek\n\nThe Doctor and Rose find themselves in an underground museum in Utah in the year 2012. The museum houses all kinds of extra-terrestrial artefacts the only living exhibit being one of the Doctor's oldest enemies - a Dalek. But soon after, it escapes from its "torture chamber," and goes on a killing spree. Will Rose be one of the victims?	\N	8.26	2005-04-30 17:45:00	Dalek	57243
241	4	/fiGTKcv29xHiy5sjyW11k5RzNEN.jpg	Location: Satellite 5\nDate: 200,000\nEnemy: The Editor, Jagrafess\n\nThe Doctor, Rose and Adam arrive in the year 200,000 on a broadcasting station that transmits programming to Earth. But soon, trouble is afoot, when they discover that any worker promoted to a position on level 500 never returns. The Doctor and Rose attempt to find out what is happening, whilst Adam investigates part of the station himself, and makes a decision that he's going to regret for the rest of his life.	\N	7.75	2005-05-07 17:45:00	The Long Game	57243
242	4	/5PQa7xD2iL7BkBlF8JNZyCgWefI.jpg	Location: London, Earth\nDate: 1986\nEnemy: The Reapers\n\nRose requests a trip back to the day her father, Pete Tyler, died. Reluctantly, the Doctor agrees, but he realises he has made a mistake, when Rose saves Pete from being run over by a car. This has now changed the timeline, and Reapers are transposing themselves all over the Universe. However, this time, the Doctor doesn't have a plan…	\N	8.07	2005-05-14 17:45:00	Father's Day	57243
243	4	/4JwPlEI4qWbnQVX1TlZNlUAyHcB.jpg	Location: London, England\nDate: 1941\nEnemy: The Empty Child\n\nAfter chasing an unexplained capsule through time, the TARDIS lands in London, during an air raid. Rose investigates when a small child wearing a gasmask, standing on a rooftop, continuously calls out for his mummy. After floating above the city on a barrage balloon, Rose is swept off her feet by another time traveller – Captain Jack Harkness. Meanwhile, The Doctor follows a teenaged girl to a meeting of the homeless children of the Blitz. Here, the child in the gasmask is terrorising them with a parade of strange events, constantly asking for his mother.	\N	8.58	2005-05-21 17:45:00	The Empty Child (1)	57243
244	4	/yE8fusMqHwGHdCDi9lNMBuSYXUT.jpg	Location: London, England\nDate: 1941\nEnemy: The Empty Child, Nanogenes\n\nAfter narrowly escaping the gas mask monsters, The Doctor, Rose, and Captain Jack try to stop the mutated people from infecting other victims. But it soon becomes apparent that one of the group may indirectly responsible for the virus. The answer lies at the bomb site, but time is running out...	\N	8.57	2005-05-28 17:45:00	The Doctor Dances (2)	57243
245	4	/t9ossMxqe5WVBvGkaWA8ReO4Xnu.jpg	Location: Cardiff, Wales\nDate: 2006\nEnemy: Margaret Blaine (Blon Fel Fotch Pasameer-Day Slitheen)\n\nThe Doctor, Rose and Captain Jack stop off in present-day Cardiff to recharge the TARDIS on the Rift they formerly encountered in 1869. Whilst there, they come upon a since-thought-long-dead enemy of theirs, who is hatching yet another plan to destroy Earth.	\N	7.68	2005-06-04 17:45:00	Boom Town	57243
246	4	/wvKyXn0WGmR32KCsRaRPbKKzCW1.jpg	Location: The Gamestation (Satellite 5)\nDate: 200,100\nEnemy: The Games, The Daleks\n\nIn a seemingly futuristic world, the Doctor wakes up in the Big Brother house during an eviction, Rose wakes up on the Weakest Link with the Anne-Droid, and Captain Jack gets a make over with Trin-E and Zu-Zana. But something unusual is happening, and the losing contestants are being disintergrated. Obviously, it's time for the Doctor to investigate. There could be only one monster behind this - the Daleks!	\N	8.48	2005-06-11 17:45:00	Bad Wolf (1)	57243
247	4	/umvpeUdQ4WrkRq5YXWtwU7k0zDx.jpg	Location: The Gamestation (Satellite 5)\nDate: 200,100\nEnemy: Emperor Dalek, The Daleks\n\nThe fate of the Universe is hanging in the balance as the Dalek fleet begin their invasion of Earth. The Doctor must decide whether to sacrifice every human being on Earth in order to save every other living creature in the universe from the Daleks. Either way, he knows he must send Rose home...	\N	8.78	2005-06-18 17:45:00	The Parting of the Ways (2)	57243
248	3	/oXVmsIkZCgJDNcZJJxzvV7zwyb1.jpg	\N	\N	8.69	2006-04-15 19:30:00	Season 2	57243
249	4	/3CmzxNTL4Mk49r5kiYKpdoLGA5n.jpg	Location: New Earth\nDate: 5,000,000,023 \nEnemies: Lady Cassandra, The Flesh, Sisters of Plenitude \n\nIn the year five billion and twenty-three, after the destruction of the Earth, the Doctor takes Rose to the New Earth. There, in a hospital facility, the feline Sisters of Plenitude can mysteriously cure any diseases, but, in the basement, an old enemy of the Doctor is out for revenge.	\N	8.07	2006-04-15 17:45:00	New Earth	57243
250	4	/9950TrmEKVGquoYzAljQH3wFcdr.jpg	Location: Torchwood House, Scotland, Earth Date: 1879 \nEnemies: Werewolf, The Monks\n\nLanding in 1879, Scotland, the Tenth Doctor and Rose meet Queen Victoria, travelling with her to spend the night at the Torchwood Estate. However, a group of warrior monks have sinister plans for the monarch, and the full moon is about to summon a creature out of legend.	\N	8.00	2006-04-22 17:45:00	Tooth and Claw	57243
251	4	/5UzEq0sVHOfj2VOttLcRLUuaOzz.jpg	Location: Deffry Vale High School, London, England, Earth \nDate: 2007 \nEnemies: The Krillitanes \n\nThere are strange goings-on at a comprehensive school - UFOs, over-intelligent children, and odd-tasting school dinners. This attracts the attention of the Tenth Doctor, Rose and Mickey Smith, as well as a couple of old friends…	\N	8.01	2006-04-29 17:45:00	School Reunion	57243
252	4	/yN4GJf4cimPy6EMQh2pYPZp6ZhA.jpg	Location: Versailles, France, Earth and on S.S. Madame de Pompadour (a Spaceship)\nDate: Across the 18th Century and during the 51st Century\nEnemies: Clockwork Droids\n\nOn a seemingly abandoned spaceship in the 51st century, the Tenth Doctor, Rose and Mickey find time windows leading to 18th century France and a group of clockwork androids using them to stalk a young woman throughout her life.	\N	8.63	2006-05-06 17:45:00	The Girl in the Fireplace	57243
253	4	/sEIBy4vsUX03exTcs9atCc5zYQb.jpg	Location: Parallel Earth\nDate: 1st February, 2007\nEnemy: John Lumic, The Cybermen\n\nAfter the TARDIS makes a crash landing on the Earth of another universe, Rose discovers her father is alive and rich, Mickey encounters his alternative self, and the Tenth Doctor learns one of his oldest and deadliest foes is about to be reborn.	\N	7.94	2006-05-13 17:45:00	Rise of the Cybermen (1)	57243
254	4	/AmEiRzAHkjgnKwmWL9BD3K9m1Rs.jpg	Location: A parallel Earth\nDate: 1st/2nd February, 2007\nEnemy: John Lumic, Cyber-Controller, The Cybermen\n\nThe plans of John Lumic to convert the world into Cybermen are now in full force. The Tenth Doctor, Rose, Mickey and the Preachers must find a way to stop him from enforcing his "ultimate upgrade."	\N	8.04	2006-05-20 17:45:00	The Age of Steel (2)	57243
255	4	/cbCRy1RwRvrdLeocZa8RDERJxC5.jpg	Location: London, England, Earth\nDate: 1953 - Queen Elizabeth II's Coronation Enemy: The Wire \n\nIn 1953 London, the police are abducting people from their homes. The people of Britain gather around their new-fangled "tele-vision" sets to celebrate the new Queen's coronation - but something strange is affecting the signal.	\N	7.68	2006-05-27 17:45:00	The Idiot's Lantern	57243
256	4	/62ir7aFCD5Q5bpOslSB20VBywnx.jpg	Location: In orbit below a black hole\nDate: Possibly 43,000 (43K reference)\nEnemy: The Beast,The Ood (as The Legion of The Beast)\n\nRose finds herself further away from home than ever before, on a desolate world in the orbit of a Black Hole. Trapped with an Earth expedition and the mysterious Ood, the time-travellers face an even greater danger as something ancient beneath the planet's surface begins to awake.	\N	8.41	2006-06-03 17:45:00	The Impossible Planet (1)	57243
257	4	/AhLxY9rJO5S1VfTX9KCQSiM0x1g.jpg	Location: In orbit below a black hole\nDate: Possibly 43,000 (43K reference)\nEnemy: The Beast,The Ood (as The Legion of The Beast)\n\nThe TARDIS lands in a base on a planet orbiting a black hole, an impossible situation that stumps even the Tenth Doctor. The base crew are drilling to the centre of the world, to claim the power that keeps it in orbit for themselves. However, an ancient evil is down there too, and he is awake…	\N	8.57	2006-06-10 17:45:00	The Satan Pit (2)	57243
258	4	/pQd4lnSCbvXgcG1EYikz7lYEXx7.jpg	Location: London, Earth\nDate: 2007\nEnemy: The Abzorbaloff \n\nAn ordinary man named Elton Pope becomes obsessed with the Tenth Doctor, Rose and their strange blue box, joining a group of like-minded people in hopes of finding him. But when the mysterious Victor Kennedy joins the group, the fun soon stops and Elton discovers a darker side to his hobby.	\N	6.96	2006-06-17 17:45:00	Love and Monsters	57243
259	4	/ohSCkAMSXvkY18iBovaZ4VF7dHH.jpg	Location: Earth\nDate: 2012\nEnemy: Chloe Webber/Isolas\n\nWhen the TARDIS lands in 2012, the Tenth Doctor plans to show Rose the London Olympics. However, ordinary children are vanishing into thin air, a mother living in a seemingly normal British household is trying to hide her daughter's unnatural powers from the world, and a demonic presence lurks in an upstairs cupboard.	\N	7.29	2006-06-24 17:45:00	Fear Her	57243
260	4	/5DE2tYGs1sjYqKK7T1dyXw7f5NS.jpg	Location: London, Torchwood Tower\nDate: 2007\nEnemies: Cybermen, Torchwood\n\nGhostly beings have been regularly appearing across the world and people, believing them to be their dead loved ones, are welcoming their visits with open arms. When the TARDIS arrives at the Torchwood Institute, the Tenth Doctor and Rose are taken prisoner. They are drawn into the investigation of a mysterious sphere kept in Torchwood Tower, and monstrous foes return as two universes collide.	\N	8.46	2006-07-01 17:45:00	Army of Ghosts (1)	57243
261	4	/wIotyoKHq7ldmeOa5FN62IMFt3d.jpg	Location: London, Torchwood Tower\nDate: 2007\nEnemies: Cybermen, Daleks\n\nHumanity is caught in the crossfire as the Cybermen and the Daleks wage war against each other. When the mysterious Genesis Ark opens, the Tenth Doctor is faced with an impossible decision: saving the world could mean losing Rose Tyler forever…	\N	9.05	2006-07-08 17:45:00	Doomsday (2)	57243
262	3	/67xbjSv353G2rqQIs6dnDKc6P11.jpg	\N	\N	8.55	2007-04-01 19:30:00	Season 3	57243
263	4	/SAtfIVeCbfpvhMOC7vY1A9z6D7.jpg	Location: Earth/Moon\nDate: 2008\nEnemies: Judoon, Plasmavore, Slabs \n\nTrainee doctor Martha Jones has her hands full balancing her medical studies with placating her demanding family. So the last thing she needs is to find that the hospital where she works has been transported to the moon, where it's invaded by an overbearing alien police force. There she encounters a patient called John Smith, who seems curiously at ease with the situation…	\N	8.10	2007-04-01 17:45:00	Smith and Jones	57243
264	4	/4PahAL07rbyiUhsgLW99qzi6y5d.jpg	Location: Earth\nDate: 1599\nEnemies: Carrionites\n\nMartha takes her first trip in the Tardis, all the way back to Elizabethan England. She and the Doctor hear of a series of bizarre deaths and discover that playwright William Shakespeare is being controlled by dangerous witch-like creatures. It seems the time-travelling duo must defeat ancient forces to prevent history from being rewritten.	\N	8.06	2007-04-07 17:45:00	The Shakespeare Code	57243
265	4	/ja8oZQszacBLr7sc1uceRIsPb49.jpg	Location: New Earth\nDate: The year 5,000,000,053\nEnemies: Macra\n\nThe Doctor takes Martha to New Earth, in the far future, only to find that an entire city has become a deadly trap.	\N	8.13	2007-04-14 17:45:00	Gridlock	57243
266	4	/yQFwHDE9sJOhkQPEkUSordnlVIq.jpg	Location: New York\nDate: 1930s\nEnemies: Daleks (Cult of Skaro), Pig Slaves\n\nThe Doctor investigates disappearances in New York at the height of the depression in the 1930s. Nefarious Pig Men linger in the sewers and the Daleks prepare an audacious plan at the top of the Empire State Building	\N	7.58	2007-04-21 17:45:00	Daleks in Manhattan (1)	57243
267	4	/cPTcmOlSep64XXsXv9YdcbLxIhb.jpg	Location: New York\nDate: 1930s\nEnemies: Daleks (Cult of Skaro), Pig Slaves\n\nThe newly-created Dalek-human hybrid, and the other three members of the Cult of Skaro launch an attack on Hooverville, along with their Pig Slaves. The Doctor, Martha, and Frank manage to escape, but discover that the Daleks' plan involving the Empire State Building...	\N	7.65	2007-04-28 17:45:00	Evolution of the Daleks (2)	57243
268	4	/bX9jXbbKOqMMbPpNCNudKtwF3C0.jpg	Location: London\nDate: 2008\nEnemy: Professor Lazarus\n\nIt looks as though Martha's odyssey is coming to an end when the Doctor drops her home, even landing the Tardis inside her lounge. But then a TV news report tickles the insatiable curiosity of our gallivanting Gallifreyan, and they're off again. So we're treated to the unusual sight of the Doc in a DJ as he escorts a glammed-up Martha to the launch of a scientific breakthrough: an eternal youth machine created by an elderly professor, Richard Lazarus. As with all weird science, the side effects are severe, but this is a very extreme case (and no, it's not suitable for tots). Doctor Who continues its game of spot the homage. Tonight's story is an enjoyable synthesis of She, The Fly and The Quatermass Experiment - even down to the final battle in a London cathedral. But despite some charming interplay between the two leads and an excellent turn from Mark Gatiss as the young and old professor, The Lazarus Experiment is a pretty conventional runaround, though the nightmarish Identikit creature is superbly realised and dedicated Whovians can look out for a "reverse the polarity" reference.	\N	7.54	2007-05-05 17:45:00	The Lazarus Experiment	57243
269	4	/hLxBTqcxkbFhAa7RtK1M5XAKv92.jpg	Location: SS Pentallian \nDate: The 42nd century\nEnemies: Ashton\n\nIn a far-flung galaxy, saboteurs are at work, and crew members are being possessed. The TARDIS crew find themselves in the 42nd century on a spaceship, SS Pentallian, slowly being pulled into a sun, and must find a way to survive	\N	7.83	2007-05-19 17:45:00	42	57243
270	4	/8bXp7x8LqxUnmzDd9Tnb6pSh9t0.jpg	Location: A boys' boarding school \nDate: 1913 \nEnemies: The Family of Blood\n\nEngland, 1913. A schoolteacher called John Smith dreams of adventures in time and space. The Doctor, along with Martha, heads to a boarding school, but what he finds is far from ordinary...	\N	8.33	2007-05-26 17:45:00	Human Nature (1)	57243
272	4	/7nzpdhKR3hxcfWNjmAYy3eYJOPt.jpg	Location: Hull, London, England\nDate: 2007\nEnemies: The Weeping Angels\n\nSuggestion is a powerful weapon ...\n\nThe Doctor is lost in time and within the walls of an old, abandoned house, murder is afoot and the Weeping Angels await...\n\nA young woman called Sally visits a dilapidated house, and is led down a terrifying time-torn path.	\N	9.38	2007-06-09 17:45:00	Blink	57243
273	4	/hoFrmMRxyHTMI7QCvgRZ4OgdV3f.jpg	Location: Malcassairo\nDate: The Year 100 Trillion\nEnemies: Futurekind, The Master\n\nAfter being brought back to life in The Parting of the Ways, Captain Jack Harkness was just left on the Gamestation by the Doctor and Rose. In this episode, Captain Jack Harkness storms back into the Doctor's life, and the TARDIS is thrown to the end of the universe itself. 	\N	8.47	2007-06-16 17:45:00	Utopia (1)	57243
274	4	/4NiwidmFeLhNWMbCP0SrJLCDl1F.jpg	Location: London\nDate: 2008\nEnemies: The Master, the Toclafane\n\nHarry Saxon becomes Prime Minister and his reign of terror begins – but that's only the start of his ambitions, as he announces mankind's first contact with an alien race, the Toclafane. \n\nAn audacious plan spanning the whole of time and space begins to close around the Earth, in the penultimate episode of Russell T Davies's Doctor Who.	\N	8.56	2007-06-23 17:45:00	The Sound of Drums (2)	57243
275	4	/vXwspI0LtsTe6mn9cRpfmUpBAHr.jpg	Location: Earth, The Valiant\nDate: 2008, 2009\nEnemies: The Toclafane, The Master\n\nOne year has passed since the events of "The Sound of Drums." \n\nThe Earth has been conquered and its population enslaved, the Doctor is the Master's prisoner, and the warships of a new Time Lord Empire rise from the ashes. The fate of the world is in Martha Jones' hands.	\N	8.66	2007-06-30 17:45:00	Last of the Time Lords (3)	57243
276	3	/h6hogh9U371q87XLhvrJbczg8lm.jpg	\N	\N	8.88	2008-04-05 19:30:00	第 4 季	57243
277	4	/cq1zrCS267vGXa3rCYQkVKNJE9v.jpg	Location: London\nDate: 2009\nEnemies: Adipose, Miss Foster\n\nDuring an alien emergency in London, a woman called Donna Noble must search for an old friend who can save the day - a man named the Doctor. But can even the Doctor halt the plans of the mysterious Miss Foster?	\N	8.21	2008-04-05 17:45:00	Partners in Crime	57243
278	4	/4WoJP6if8546yPrWjvJ3SBfHClg.jpg	Location: Pompeii\nDate: 23rd/24th August 79AD\nEnemies: Pyrovile \n\nThe Doctor takes Donna back to Pompeii, on the day of the eruption of Mt. Vesuvius, and is faced with a great moral dilemma. Should they warn the residents of the impending disaster, or let history take its natural course? 	\N	8.18	2008-04-12 17:45:00	The Fires of Pompeii	57243
279	4	/pqzflnCz2QgRC2lUSfCSTofsZJ1.jpg	Location: Ood-Sphere\nDate: 4126\nEnemies: Mr. Halpen, Ood Operations \n\nThe Doctor and Donna find themselves on an icy planet known as the Ood-Sphere. There they discover what drove the Ood to be a servant race.	\N	8.10	2008-04-19 17:45:00	Planet of the Ood	57243
280	4	/7nKSO79WS60wbECOD8iNASsEJwk.jpg	Location: Modern-day Earth\nDate: 2009\nEnemies: Sontarans \n\nAided by the Rattigan Academy, the Sontarans establish a covert base at the mysterious ATMOS Factory. Can the Doctor stop the Sontarans from unleashing a potent terror that will bring the world to its knees?	\N	7.89	2008-04-26 17:45:00	The Sontaran Stratagem (1)	57243
281	4	/o0OQByMgT3W9AzGg98HgBq9KkA.jpg	Location: Earth\nDate: 2009\nEnemies: The Sontarans\n\nThe Sontarans continue their evil plot and begin to "choke" the Earth. The Doctor and Donna, now teamed with Martha have to stop them! Can they save Earth before it's too late?	\N	8.04	2008-05-03 17:45:00	The Poison Sky (2)	57243
282	4	/tqqn9eTtZlSMe1Nng2qmduloOe0.jpg	Location: Messaline\nDate: 60120724 (New Byzantine Calendar)\nEnemies: The Hath\n\nThe Doctor lands on the remote planet Messaline as an age-old war rages and the threat of genocide looms. When Martha is kidnapped by the Hath, the Doctor is distracted by "the most important woman in his life."	\N	8.28	2008-05-10 17:45:00	The Doctor's Daughter	57243
283	4	/dvZeLZ08yzuJ3gE5sT7TmSWNq79.jpg	Location: England, Earth\nDate: December 3rd 1926\nEnemies: Vespiforms\n\nThe Doctor and Donna's meet Agatha Christie at a manor owned buy Lady Eddison. When Agatha Christie goes missing and a body turns up in the library the adventure turns into a pulp sci-fiction murder mystery, with a murder, a jewel thief, and a wasp alien. Can they solve the mystery?	\N	7.99	2008-05-17 17:45:00	The Unicorn and the Wasp	57243
284	4	/pA3KBOYK60cqJ6qkbeOBSSTUdGj.jpg	Location: The Library\nDate: 51st century\nEnemies: Vashta Nerada\n\nThe Doctor and Donna land in a frightening position in the far future. While investigating a derelict library, the duo come face to face with the disembodied mind of a little girl, an archaeological team led by a woman from the Doctor's future, and swarms of flesh-eating creatures that are seen only as shadows.	\N	8.80	2008-05-31 17:45:00	Silence in the Library (1)	57243
285	4	/4t21hQqK2bqlKu0zoNaFPgNlplz.jpg	Location: The Library\nDate: 51st Century\nEnemies: Vashta Nerada\n\nThe Doctor and Donna land in a frightening position in the far future. While investigating a derelict library, the duo come face to face with the disembodied mind of a little girl, an archaeological team led by a woman from the Doctor's future, and swarms of flesh-eating creatures that are seen only as shadows	\N	8.99	2008-06-07 17:45:00	Forest of the Dead (2)	57243
286	4	/kPxhdqzj8vuhh36QfDLbENbgPVb.jpg	Location: Planet Midnight\nDate: unknown\nEnemies: unknown - possessive creature\n\nWhile visiting the planet Midnight, a beautiful and luxury planet, full of lavishs and hightech cities, a terrifying problem arises that leaves The Doctor powerless.	\N	8.49	2008-06-14 17:45:00	Midnight	57243
287	4	/etMTaIloNsHhSqDkqV66tLnJ8Z0.jpg	Location: Earth\nDate: 2007/2008/2009\nEnemies: Member of the Trickster's Brigade\n\nWhilst attending a carnival on the Chino-planet of Shan Shen, Donna is cajoled into having her fortune read, where her past is carefully examined. With the Doctor missing, Donna must work with Rose, a traveller from a parallel universe, to prevent darkness encompassing the whole of the universe. 	\N	8.81	2008-06-21 17:45:00	Turn Left	57243
288	4	/AsL6ph9Ouk7zSp4OlHB8Vx06v4V.jpg	Location: Earth, The Medusa Cascade, The Shadow Proclamation\nDate: 2009\nEnemies: The Daleks and Davros\n\nThe Earth has been moved, and it's a race against time as Donna and the Doctor try to find it before the Daleks destroy everything; they head for the Shadow Proclamation and the Medusa Cascade. Meanwhile on Earth a veritable bevy of ex-companions join together to contact the Doctor and take down the Daleks. Can Captain Jack, Sarah-Jane, Martha Jones and Rose find the Doctor in time... 	\N	8.88	2008-06-28 17:45:00	The Stolen Earth (1)	57243
289	4	/di3ZK4886uAdvhgfjD0IB9Gwcr6.jpg	Location: The Dalek Crucible and Earth\nDate: 2009\nEnemies: The Daleks and Davros\n\nThe Earth has been overwhelmed and the universe faces dominion by the resurgent forces of a terrifying and limitless empire led by one of The Doctor's greatest enemies. Aiding the Time Lord in a final battle are several of his closest allies and companions, but for one of them, a price will be paid... 	\N	9.05	2008-07-05 17:45:00	Journey's End (2)	57243
375	4	/eDyDC7cwKz9ZTA4CX44eKuHjPgZ.jpg	Leonard asks a woman out after he finds out that Penny is seeing someone.	\N	7.91	2007-10-09 00:00:00	The Fuzzy Boots Corollary	1418
290	3	/hUsQerEeMqsu9cVYzMEB2OGJjrw.jpg	After his explosive regeneration, the Eleventh Doctor awakes to discover his TARDIS is about to crash. Emerging from the wreckage of his crashed time machine, he meets young Amy Pond. Still wearing the remains of the Tenth Doctor’s suit, ripped and raggedy from the damage after the TARDIS control room exploded, the Doctor promises to take Amy to the stars. But before they can begin their journey, they become embroiled in an alien plot that could destroy the Earth.\n\nLater the Doctor makes good his promise and Amy boards the regenerated TARDIS, ready to take to the stars on a series of wild adventures that will change her life. Amy and the Doctor explore time and space, visiting 17th century Venice, France during the 1890s and the United Kingdom in the far future, now an entire nation floating in space. As always, wherever the Doctor goes, his oldest enemies are never far behind - the Daleks are hatching a new master plan from the heart of war-torn London in the 1940s. But they are not the only strange creatures the Doctor and Amy must face - there are also alien vampires, humanoid reptiles, old enemies such as the Weeping Angels, and a silent menace that follows Amy and the Doctor around wherever they go.	\N	8.66	2010-04-03 19:30:00	Season 5	57243
291	4	/7SCdxZkZba4YCjPXnAt2otv8fjS.jpg	Location: Leadworth \nDate: (1996,2008,2010)\nEnemies: Prisoner Zero, Atraxi \n\nThe Doctor has regenerated into a brand new man, but danger strikes before he can even recover. With the TARDIS wrecked, and the sonic screwdriver destroyed, the new Doctor has just 20 minutes to save the whole world - and only Amy Pond to help him.	\N	8.68	2010-04-03 17:45:00	The Eleventh Hour	57243
292	4	/idREuQNMuuvJcvn549j68MOTqEc.jpg	Location: Starship UK\nDate: 3295 \nEnemies: Smilers\n\nAmy Pond takes her first trip in the TARDIS when the Doctor whisks her away to the distant future and they discover Britain in space. Starship UK houses the future of the British people as they search the stars for a new home. But when Amy explores she encounters the terrifying Smilers and learns a deadly truth inside the Voting Booth...	\N	8.16	2010-04-10 17:45:00	The Beast Below	57243
293	4	/bQU8MI5DUkw3R8tpC58wZ4RoeFt.jpg	Location: Earth \nDate: 1941, World War II\nEnemies: Daleks\n\nThe Doctor has been summoned by old friend Winston Churchill, but in the Cabinet War Rooms far below the streets of blitz-torn London, it's his oldest enemy he finds waiting for him, as the time-travelling adventures continue. The Daleks are back – but can Winston Churchill be in league with them?	\N	7.80	2010-04-17 17:45:00	Victory of the Daleks	57243
294	4	/7on4wH45zsKYnqQX91xXsTBbMje.jpg	Location: Alfava Metraxis \nDate:  51st century\nEnemies: Weeping Angels\n\nA crashed spaceship, a shattered temple and a terrifying climb through the maze of the dead - River Song is back in the Doctor's life, and she's brought more trouble than even he can handle. The last of the weeping Angels is loose in the ruins of Alfava Metraxis, and the Doctor is recruited to track it down. "Don't blink!" everyone tells Amy - but Amy is about to discover, not blinking might just be the worst thing you can do...	\N	8.58	2010-04-24 17:45:00	The Time of Angels (1)	57243
295	4	/hdeY2GyMvtHVps5Ze6z7D7j1oqm.jpg	Location: Alfava Metraxis \nDate:  51st century\nEnemies: Weeping Angels\n\nThere's no way back, no way up and no way out. Trapped among an army of Weeping Angels, The Doctor and his friends must try to escape through the wreckage of a crashed space liner. Meanwhile, in the forest vault, the Doctor's companion, Amy Pond, finds herself facing an even more deadly attack. \n\n	\N	8.57	2010-05-01 17:45:00	Flesh and Stone (2)	57243
296	4	/jLksFGWiRB0EHmCxLosDwIJW7GA.jpg	Location: Venice, Earth  \nDate: 1580  \nEnemies: Saturnynians\n\nDessicated corpses, terror in the canal and a visit to the sinister House of Calvierri – the Doctor takes Amy and Rory for a romantic mini-break, as the Tardis touches down once again. \n\nBut 16th-century Venice is not as it should be. The city has been sealed to protect it from the Plague, although Rosanna Calvierri may have other plans...	\N	7.69	2010-05-08 17:45:00	The Vampires of Venice	57243
297	4	/oGtuZIqlVOzlLbvt73rQQUqhDSV.jpg	Location: Upper Leadworth / The TARDIS\nDate: 2015.\nEnemies: The Dream Lord , The Eknodine\n\nIt has been five years since Amy Pond last travelled with the Doctor, and when he lands in her garden again, on the eve of the birth of her first child, she finds herself facing a heartbreaking choice – one that will change her life forever. They will have to choose which is the dream world and which is reality. 	\N	8.18	2010-05-15 17:45:00	Amy's Choice	57243
298	4	/4s6jxJBNqXF3j3PBMto78SSunrB.jpg	Location: Cwmtaff, Wales \nDate: 2020\nEnemies: Silurians \n\nIn 2020, the most ambitious drilling project in history is under way. Dr Nasreen Chaudry and her team have reached 21 kilometers into the Earth's crust - but something is stirring far below. Amy Pond discovers there's nowhere to run when you can't even trust the ground at your feet.	\N	7.80	2010-05-22 17:45:00	The Hungry Earth (1)	57243
299	4	/kpjhRYkFJIV90yqrwCWGk8ALhdb.jpg	Location: Cwmtaff, Wales \nDate: 2020\nEnemies: Silurians \n\nIt is the most important day in the history of Earth: the dawn of a new age of harmony… or the start of its final war. \n\nThe Doctor must face his most difficult challenge yet and he tries desperately to ensure Alaya's prediction of a massacre does not come true. Meanwhile, what fate will befall the captured Amy and can Tony and his friends be trusted? \n	\N	7.98	2010-05-29 17:45:00	Cold Blood (2)	57243
300	4	/bSXtkTYVizAlcbNGRHBCj8rznCJ.jpg	Location: Auvers-sur-Oise, Earth \nDate: 1890 \nEnemies: Krafayis \n\nTerror lurks in the cornfields of Provence, but only a sad and lonely painter can see it. Amy Pond finds herself shoulder to shoulder with Vincent van Gogh, in a battle with a deadly alien - saving the world has never been so ginger! But can even the Doctor save Vincent?	\N	9.08	2010-06-05 17:45:00	Vincent and the Doctor	57243
301	4	/wbo8GXgAMZ7H3XdZLqm2UJO1ow.jpg	Location: Aickman Road\nDate: 2010 \nEnemies: Number 79B, Aickman Road \n\nThere's a house on Aickman road with a staircase that people go up, but never down... To solve the mystery of the man upstairs, the Doctor must pass himself off as a normal human being, and share a flat with Craig Owens.	\N	8.35	2010-06-12 17:45:00	The Lodger	57243
302	4	/oCgpFhpCCgAwNUhR1seTYXRJkHE.jpg	Location: Stonehenge, Earth\nDate: 102AD\nEnemies: The Alliance \n\nThe Doctor's friends unite to send him a terrible warning; the Pandorica - which is said to contain the most feared being in all the cosmos - is opening. But what's inside, and can the Doctor stop it? 	\N	8.83	2010-06-19 17:45:00	The Pandorica Opens (1)	57243
303	4	/ic0ZIxO7T5AN0YIyP7jlbepZPdc.jpg	Location: National Museum \nDate: 1996\nEnemies: Stone Dalek\n\nThe Doctor is gone, the Tardis has been destroyed, and the universe is collapsing. The only hope for all reality is a little girl who still believes in stars.	\N	9.02	2010-06-26 17:45:00	The Big Bang (2)	57243
304	3	/xmfMcVkVer5r33QhA4e2DpIR78B.jpg	\N	\N	8.25	2011-04-23 19:30:00	Season 6	57243
374	4	/5Itgr82yyAEtwegAZgMm30UqJXK.jpg	Leonard volunteers to sign for a package in an attempt to make a good impression on Penny, but when he enlists Sheldon for help, his attempt at chivalry goes terribly awry.	\N	8.09	2007-10-02 00:00:00	The Big Bran Hypothesis	1418
305	4	/w1Gu8jrHqYrWs136GxRvScqXRfQ.jpg	Location: Utah, Washington D.C., Florida\nDate: 2011, 1969\nEnemies: The Silence\n\nPlacing his life entirely in their hands, the Doctor agrees to search for the recipient of the fourth envelope - just who is Canton Everett Delaware the Third? And what is the relevance of their only other clue: 'Space 1969'? Their quest lands them - quite literally - in the Oval Office, where they are enlisted by President Nixon himself to assist enigmatic former-FBI agent Canton, in saving a terrified little girl from a mysterious spaceman.	\N	8.72	2011-04-23 17:45:00	The Impossible Astronaut (1)	57243
306	4	/aDhkjkl7Et7uudNitbkHm7CZdla.jpg	Location: Utah, Washington D.C., New York City\nDate: 1969\nEnemies: The Silence\n\nThe Doctor is locked in the perfect prison. Amy, Rory and River Song are being hunted down across America by the FBI. With the help of new friend and FBI-insider, Canton Everett Delaware the Third, our heroes are reunited to share their discoveries, if not their memories. For the world is occupied by an alien force who control humanity through post-hypnotic suggestion and no one can be trusted. Aided by President Nixon and Neil Armstrong's foot, the Doctor must mount a revolution to drive out the enemy and rescue the missing little girl. No-one knows why they took her. Or why they have kidnapped Amy Pond...	\N	8.70	2011-04-30 17:45:00	Day of the Moon (2)	57243
307	4	/c1QBseuJ2MSUcpas1pC6x6nrvtw.jpg	Location: In a pirate ship\nDate: 1699\nEnemies: Siren\n\nThe TARDIS is marooned onboard a 17th-century pirate ship whose crew is being attacked by a mysterious and beautiful sea creature.\n\nBecalmed and beset by cabin fever, the pirates have numerous superstitious explanations for the Siren's appearance. The Doctor has other ideas but, as his theories are disproved and every plan of escape is thwarted, he must work to win the trust of the implacable Captain Avery and uncover the truth behind the pirates' supernatural fears – and he must work quickly, for some of his friends have already fallen under the Siren's spell...	\N	7.53	2011-05-07 17:45:00	The Curse of the Black Spot	57243
308	4	/kQKQ1UGOBlerJiXjNDQ4bV9Nh3v.jpg	Location: In a bubble universe\nDate: unknown\nEnemies: The House, The Nephew\n\nThe Doctor receives a distress signal from an old friend. Could there really be another living Time Lord out there? Hopes raised, he follows the signal to a junkyard planet sitting upon a mysterious asteroid in a Bubble universe, populated by a very strange family, as the time-travelling drama continues.\n\nThe Doctor, Amy and Rory are given the warmest of welcomes by Auntie, Uncle and Nephew. But the beautiful and insane Idris greets them in a more unusual fashion – what is she trying to tell the Doctor? As the Doctor investigates, he unwittingly puts his friends in the gravest danger. 	\N	8.73	2011-05-14 17:45:00	The Doctor's Wife	57243
309	4	/2nSKMC4B6Rkg3ilTiQbwDGZfBfv.jpg	A solar tsunami sends the TARDIS hurtling towards a futuristic factory on Earth, where human doppelgangers are used to mine dangerous acid, as the time-travelling adventures continue.\n\nA second wave hits and the "Gangers" separate. They can remember every second of their "original's" life and feel every emotion they've ever experienced. But are these memories stolen or have they been bequeathed? Are the Gangers merely faulty machinery that must be shut down or are they living, breathing, sentient beings? Can the Doctor convince the terrified humans to accept these "almost people" and prevent an all-out civil war before the factory explodes?	\N	7.66	2011-05-21 17:45:00	The Rebel Flesh (1)	57243
310	4	/hFx0dr4dyAyV8izoBO6HuW4yR2.jpg	As the solar storm rages, Jennifer, a Ganger driven mad by the memories of being "decommissioned", is seeking revenge, as the time-travelling drama continues.\n\nShe can remember every excruciating second of every "execution" and is determined that the humans will pay. And she isn't just talking war; she's talking revolution. As the crumbling factory fills with toxic fumes and drips lethal acid, the "Originals" wait desperately for the shuttle from the Mainland to rescue them. But Jennifer has other ideas. Can the Doctor convince the terrified factory workers to embrace their own humanity and work together with their Gangers to overcome a monster of their own making?	\N	7.97	2011-05-28 17:45:00	The Almost People (2)	57243
311	4	/89NYx2loksaiFj4vFyEQZ4Of25.jpg	Amy Pond has been kidnapped and the Doctor is raising an army to rescue her as the drama continues. But as he and Rory race across galaxies, calling in long-held debts and solemnly given promises, his enemies are laying a carefully concealed trap.\n\nIn her cell in Stormcage, River Song sadly acknowledges that the time has come at last – today will mark the Battle of Demons Run and the Doctor’s darkest hour. Both sides will make their sacrifices and River Song must finally reveal her most closely guarded secret to the Doctor.	\N	8.96	2011-06-04 17:45:00	A Good Man Goes to War (1)	57243
312	4	/tSccK7c1jlpPahKXQvIfYUjFGtg.jpg	In the desperate search for Melody Pond, the TARDIS crash lands in Thirties Berlin, as the time-travelling drama returns for the second half of the series shown earlier in the year. The Doctor comes face to face with the greatest war criminal in the Universe. And Hitler. Old friendships are tested to their limits as the Doctor suffers the ultimate betrayal and learns a harsh lesson in the cruelest warfare of all. As precious time ebbs away, the Doctor must teach his adversaries that time travel has responsibilities. And he must succeed before an almighty price is paid.	\N	8.61	2011-08-27 17:45:00	Let's Kill Hitler (2)	57243
313	4	/l6lYTQ5QwYAqQGvTOfLdnlcMvuF.jpg	A little boy named George sends a distress signal to the Doctor when he discovers that monsters live in his bedroom cupboard. 	\N	7.54	2011-09-03 17:45:00	Night Terrors	57243
314	4	/n6RYsI4S1Wy8ouanOYGXQuS2gAP.jpg	The TARDIS brings its crew to a quarantine facility for victims of an alien plague. When Amy is trapped, Rory must rescue her from the facility's doctors but learns something surprising about his wife.	\N	8.41	2011-09-10 17:45:00	The Girl Who Waited	57243
315	4	/cf0vAccRIXwYJtc2pIbmRtlgdNW.jpg	The trio arrive at a hotel where the layout of the rooms keeps changing. It also contains rooms that hold the greatest fears of each visitor.	\N	8.14	2011-09-17 17:45:00	The God Complex	57243
316	4	/is8F49nu51Cy1KBdhGnoFjxlSzH.jpg	As the Doctor prepares for his inevitable death at Lake Silencio, he visits a former roommate and learns that the Cybermen are responsible for a series of disappearances at a local department store and resolves to investigate.	\N	8.14	2011-09-24 17:45:00	Closing Time	57243
317	4	/BQaQJKqeIV7L4R3XKKZrJyzM7D.jpg	As the Doctor makes his final journey to the shores of Lake Silencio in Utah, he knows only one thing can keep the universe safe – his own death – in the concluding episode of this series of the time-travelling drama. But has he reckoned without the love of a good woman?	\N	8.72	2011-10-01 17:45:00	The Wedding of River Song	57243
334	4	/bR45NIPLU4wkaHK2KIIAKJUVHmp.jpg	A Dalek fleet surrounds a lone rebel ship, and only the Doctor can help them now.\nThe Doctor faces his greatest enemy and he needs Clara by his side. Confronted with a decision that could change the Daleks forever he is forced to examine his conscience. Will he find the answer to his question - "Am I a good man?"	\N	7.87	2014-08-30 17:45:00	Into the Dalek	57243
318	3	/6biGcR0OyFnKRxxUW7bGtK49wTd.jpg	The seventh series of the British science fiction television series Doctor Who aired from 1 September 2012 to 18 May 2013, being split into two parts, as with the previous series. The series was broadcast concurrently on BBC One in the United Kingdom, BBC America in the United States, and on Space in Canada, and also on ABC in Australia, with the first five episodes released a week after its UK and North American release and the remainder released the next day. Following its premiere on 1 September 2012, the series aired weekly until 29 September 2012. Six episodes were broadcast in 2012, including the 2012 Christmas special, "The Snowmen", which aired separately from the main series. The remaining eight episodes began broadcasting on 30 March 2013. "The Snowmen" introduced a new TARDIS interior, title sequence, theme tune, and costume for the Doctor.\n\nDoctor Who's seventh series was the show's third and final series in which Matt Smith, Karen Gillan and Arthur Darvill played the eleventh incarnation of the Doctor and his companions Amy Pond and Rory Williams respectively. Gillan and Darvill departed the series in the fifth episode, after which a new companion named Clara Oswald joined the Doctor, played by Jenna-Louise Coleman, remaining with the series for its second half. Smith stayed for one year longer than Gillan and Darvill, and will depart the series after the 2013 specials.	\N	7.96	2012-09-01 19:30:00	Season 7	57243
319	4	/rN3BynpG55i9P933Pp0775U81fU.jpg	Kidnapped by his oldest foe, the Doctor is forced on an impossible mission - to a place even the Daleks are too terrified to enter... the Asylum. A planetary prison confining the most terrifying and insane of their kind, the Doctor and the Ponds must find an escape route. But with Amy and Rory’s relationship in meltdown, and an army of mad Daleks closing in, it is up to the Doctor to save their lives, as well as the Pond’s marriage.	\N	8.69	2012-09-01 17:45:00	Asylum of the Daleks	57243
320	4	/2yOZwTxLN0Jm3tiQQT1IETpH1CJ.jpg	An unmanned spaceship hurtles towards certain destruction - unless the Doctor can save it, and its impossible cargo... of dinosaurs! By his side a ragtag gang of adventurers; a big game hunter, an Egyptian Queen and a surprised member of the Pond family. But little does the Doctor know there is someone else onboard who will stop at nothing to keep hold of his precious, prehistoric cargo.	\N	8.05	2012-09-08 17:45:00	Dinosaurs on a Spaceship	57243
321	4	/j0Kc08Zz6UJVIG60WFSJ34VTmC8.jpg	The Doctor gets a Stetson (and a gun!), and finds himself the reluctant Sheriff of a Western town under siege by a relentless cyborg, who goes by the name of the Gunslinger. But who is he and what does he want? The answer seems to lie with the mysterious, Kahler-Jex, an alien doctor (yes another one!) whose initial appearance is hiding a dark secret.	\N	7.84	2012-09-15 17:45:00	A Town Called Mercy	57243
322	4	/bUkVdlhBZEat0OqBYLPQOeZv7xF.jpg	The Doctor and the Ponds puzzle an unlikely invasion of Earth, as millions of sinister black cubes arrive overnight, almost like presents falling from the sky. But what are they, what’s inside them and most importantly, who sent them? With the international community at a loss, it’s left to the Doctor to unearth who is behind the mystery. 	\N	8.05	2012-09-22 17:45:00	The Power of Three	57243
323	4	/wYJautwl0CARbcN68b224NYaQl1.jpg	The Doctor’s heart-breaking farewell to Amy and Rory – a race against time through the streets of Manhattan, as New York’s statues come to life around them… With Rory’s life in danger, the Doctor and Amy must locate him before it’s too late! Luckily, an old friend helps them and guides the way.	\N	8.91	2012-09-29 17:45:00	The Angels Take Manhattan	57243
324	4	/3VoZH0t0dCT8I74eUlBxJTf8jXM.jpg	When the Doctor receives a mysterious call from Clara, the woman that he's been seeking since he has seen her die twice, he arrives in 21st century Earth and discovers that something is using wi-fi to download human minds into the Internet... and feed on them.	\N	8.36	2013-03-30 18:45:00	The Bells of St John	57243
325	4	/i6tJrGtJcCJ18tWrfaskEMUl5g5.jpg	Clara wants to see something awesome, so the Doctor whisks her off to the inhabited rings of the planet Akhaten, where the Festival of Offerings is in full swing. Clara meets the young Queen of Years as the pilgrims and natives ready for the ceremony. But something is stirring in the pyramid, and a sacrifice will be demanded.	\N	7.90	2013-04-06 17:45:00	The Rings of Akhaten	57243
326	4	/pDBbOWasznRv9hdztCe0LUWEMU0.jpg	The Doctor and Clara land on a damaged Russian submarine in 1983 as it spirals out of control into the ocean depths. An alien creature is loose on board, having escaped from a block of Arctic ice. With tempers flaring and a cargo of nuclear weapons on board, it’s not just the crew but the whole of humanity at stake!\n	\N	7.72	2013-04-13 17:45:00	Cold War	57243
327	4	/36Oy5SR1JU6EsBC4qHL985EqC2v.jpg	Clara and the Doctor arrive at Caliburn House, a haunted mansion sat alone on a desolate moor. Within its walls, a ghost hunting Professor and a gifted psychic are searching for the Witch of the Well. Her apparition appears throughout the history of the building, but is she really a ghost? And what is chasing her?\n	\N	8.09	2013-04-20 17:45:00	Hide	57243
328	4	/sLGGoIP1lqbv4YlCRQQafkYIwkr.jpg	When a salvage ship attempts to pull the TARDIS aboard when the time vessel's shields are down, an explosion occurs. The Doctor forces the salvage crew to help him find Clara, who is lost somewhere inside his vessel.	\N	8.16	2013-04-27 17:45:00	Journey to the Centre of the TARDIS	57243
329	4	/vQoo3ZgprNji2SLhkOXTXVq5339.jpg	Something ghastly is afoot in Victorian Yorkshire, as bodies are found with their skin a waxy, glowing red.	\N	7.80	2013-05-04 17:45:00	The Crimson Horror	57243
330	4	/z8i0eek1v9N30opYpp1mp7cggK2.jpg	Hedgewick's World of Wonders: the perfect theme park day out - and ground zero for a deadly silver resurrection.	\N	8.20	2013-05-11 17:45:00	Nightmare in Silver	57243
331	4	/yuyaPwtNhyrlCE7bOD5PZZVxFdf.jpg	Someone is kidnapping the Doctor's friends, leading him towards the one place in all of time and space that he should never go.	\N	8.98	2013-05-18 17:45:00	The Name of the Doctor	57243
332	3	/nMxeLkOF9DzbqJdSx7gzmbFvPGK.jpg	The season ushers in an exciting new era for the show as Peter Capaldi steps into the role of the Doctor. Fans first got a glimpse of Capaldi's Doctor in November's 50th Anniversary Special, and again in the final minutes of last year's Christmas Special, but the upcoming season premiere marks the first full episode for the Twelfth Doctor. Capaldi will be joined by Jenna Coleman, who returns as companion Clara Oswald, and Samuel Anderson who joins the cast as Danny Pink, a teacher at Coal Hill School where Clara also works.	\N	7.48	2014-08-23 19:30:00	Season 8	57243
333	4	/fn0tmqmL7P83DwLksG7TuFHNaoV.jpg	When a dinosaur materialises alongside the Houses of Parliament in Victorian London, the Doctor's old friends, the Paternoster Gang, are relieved when he arrives, seemingly to deal with the creature. However, they soon realise that the Doctor is the one in need of help; newly regenerated, extremely volatile and questioning his self-worth, this is a very different man to the one they last saw. The only person that may be able to help him is Clara, and she is still grappling with losing the Doctor she knew and loved.	\N	8.03	2014-08-23 17:45:00	Deep Breath	57243
335	4	/8bMdhKODbWluNpKnsDwsCKTWQNH.jpg	In a sun-dappled Sherwood Forest, The Doctor discovers an evil plan from beyond the stars. But with the fate of Nottingham at stake (and possibly Derby), there's no time for the two adventurers to get into a fight about who is real and who isn't - which is probably why they do very little else!	\N	7.68	2014-09-06 17:45:00	Robot of Sherwood	57243
336	4	/dMAViLP5xtMJPwv9EOYUx0RZR6w.jpg	What scares the grand old man of time? What horrors lurk under his bed? Ghosts of the past and future crowd into the lives of The Doctor and Clara; a terrified caretaker in a children's home, the last man standing in the universe, and a little boy who doesn't want to join the army...	\N	8.46	2014-09-13 17:45:00	Listen	57243
337	4	/me3tZsKPUujLcNaMBBqxk4zfqIG.jpg	The Bank of Karabraxos is the deadliest bank in the cosmos - only a fool or genius would tempt to rob it. Fortunately, for The Doctor, he's both. But nothing even The Doctor has encountered can prepare them for the Teller: a creature of terrifying power that can detect guilt.	\N	8.16	2014-09-20 17:45:00	Time Heist	57243
338	4	/rzyWVBDPRDYREQddDeIPUoVYfqE.jpg	Clara has it all under control: her life at school, her life in space; her new boyfriend and her mad old Time Lord. Everything is humming along just fine, so long as everybody never actually meets. And then, one morning, just before assembly, Coal Hill welcomes a new relief caretaker with a Scottish accent.	\N	7.81	2014-09-27 17:45:00	The Caretaker	57243
339	4	/wEBoSLmrlf9K6yLsqN8eRyIY1be.jpg	In the near future, The Doctor and Clara arrive on a decrepit shuttle making a suicide mission to the Moon. Crashing on the lunar surface, they find a mining base full of eviscerated corpses, spider-like creatures scuttling about in the dark, and a terrible dilemma.	\N	7.61	2014-10-04 17:45:00	Kill the Moon	57243
340	4	/4tMq7FEADEsUs3xNaRAAwsu6DeA.jpg	Aboard the most beautiful train in history, speeding among the stars of the future, a legend is stalking the passengers. Once you see the Mummy, you have 66 seconds to live. Clara sees The Doctor at his deadliest and most ruthless - and finally she realises she's made the right decision. Because this is their last adventure: it's time to say goodbye to the Time Lord.	\N	8.09	2014-10-11 17:45:00	Mummy on the Orient Express	57243
341	4	/dIiRNUWRmX7lKPb39pARJsdlgN1.jpg	Separated from The Doctor, Clara discovers a new menace from another dimension. But how do you hide when even the walls are no protection.	\N	8.09	2014-10-18 17:45:00	Flatline	57243
342	4	/lH0tIDwpIcU9BQeUOXIoJoZmhnf.jpg	One morning in London, and every city and town in the world, the human race wakes up to the most surprising invasion yet: the trees have moved back in. Everywhere, in every land, a forest has grown overnight and taken back the Earth.	\N	7.55	2014-10-25 17:45:00	In the Forest of the Night	57243
343	4	/1VIFcfBadRqw3s6wbcqV9o9WeIO.jpg	In the mysterious world of the Nethersphere, plans have been drawn. Old friends and old enemies manoeuvre around The Doctor, and an impossible choice is looming over him.	\N	8.39	2014-11-01 18:45:00	Dark Water	57243
344	4	/crrMkCB8OLqo3VdYdxfUBEAHt2J.jpg	With Cybermen on the streets of London, old friends unite against old enemies and the Doctor takes to the air in a startling new role. As the Doctor faces his greatest challenge, sacrifices must be made before the day is won.	\N	8.11	2014-11-08 18:45:00	Death In Heaven	57243
345	3	/uidaCdI0hKiZGfMzWHNMYeNZyV7.jpg	Now that the Doctor and Clara have established a dynamic as a partnership of equals, they’re relishing the fun and thrills that all of space and time has to offer. Tangling with ghosts, Vikings and the ultimate evil of the Daleks, they embark on their biggest adventures yet. Missy is back to plague the Doctor once more, the Zygons inspire fear as they shape-shift into human clones, and a new arrival moves in cosmic ways.	\N	7.99	2015-09-19 19:30:00	Season 9	57243
346	4	/4szgVi355DvGfmSkQulNYWIkbIP.jpg	Where is the Doctor? When the skies of Earth are frozen by a mysterious alien force, Clara needs her friend. But where is the Doctor, and what is he hiding from? As past deeds come back to haunt him, old enemies will come face-to-face, and for the Doctor and Clara survival seems impossible.	\N	8.20	2015-09-19 17:45:00	The Magician's Apprentice (1)	57243
347	4	/tv0WKdJYAkFZM34obgEzeJyRvEi.jpg	Trapped and alone in a terrifying Dalek city, the Doctor is at the heart of an evil Empire; no sonic, no TARDIS, nobody to help. With his greatest temptation before him, can the Doctor resist? And will there be mercy?	\N	8.16	2015-09-26 17:45:00	The Witch's Familiar (2)	57243
348	4	/5b11pS8kvHPJcKIAtdqW0TSuWJb.jpg	The Doctor and Clara save the frightened crew from a threat in an underwater base, but the Doctor questions the haunting. 	\N	7.97	2015-10-03 17:45:00	Under The Lake (1)	57243
349	4	/nQbCg8toK04cKQi3b7SpGMOtZlr.jpg	An alien warlord sets a twisted plan in motion in order to ensure his survival on a remote Army outpost, and the Doctor may have to do something unthinkable. 	\N	7.89	2015-10-10 17:45:00	Before The Flood (2)	57243
350	4	/5aGS4PCDbn3miav9xTrq3QaZmOA.jpg	In a forgotten corner of history, a young Viking girl sits surrounded by the dead warriors of her people. She wants to fight back against the perpetrators - and, in doing so, declares war on the Mire, one of the deadliest races that the galaxy has ever known. The Doctor and Clara must help protect her village, using the twelve tense hours they have to turn a motley crew of farmers and blacksmiths into a fighting force to be reckoned with. 	\N	7.87	2015-10-17 17:45:00	The Girl Who Died (1)	57243
351	4	/foGfiuXpSe3TvCI4CL620i79QLO.jpg	England, 1651. A deadly highwayman known only as 'The Knightmare' plagues the dark streets of London, his fire-breathing accomplice by his side. There's something clearly more than human here, and that includes the loot as much as the outlaws. Who are these creatures, and are they enemies to be fought, or friends who might possibly save the Doctor from certain doom on the gallows?	\N	7.77	2015-10-24 17:45:00	The Woman Who Lived (2)	57243
352	4	/1GRZ4mBbEIezevCfGMZHNWinYZq.jpg	The Zygons, a race of shapeshifting aliens, have been living in secret among us on Earth, unknown and unseen - until now!\n\nWhen Osgood is kidnapped by a rogue gang of Zygons, the Doctor, Clara and UNIT must scatter across the world in a bid to set her free. But will they reach her in time, and can they stop an uprising before it’s too late?	\N	7.61	2015-10-31 18:45:00	The Zygon Invasion (1)	57243
353	4	/97EIvboowEBC1tnRBNNBIw1XrEs.jpg	Shapeshifting Zygons are everywhere in the UK and there is no way of knowing who to trust. With UNIT neutralized only the Doctor stands in their way. What can the Doctor do to save his friends?	\N	7.93	2015-11-07 18:45:00	The Zygon Inversion (2)	57243
354	4	/nyIBGBeKc9znPjRw3anSmVB5SiC.jpg	This terrifying story is assembled from footage discovered in the wreckage of Le Verrier Space Station.	\N	6.82	2015-11-14 18:45:00	Sleep No More	57243
355	4	/sbHH582pGSoFUpxh7GwuRpjkjcJ.jpg	The Doctor and Clara, with their old friend Rigsy, find themselves in a magical alien world, hidden on a street in the heart of London.	\N	8.19	2015-11-21 18:45:00	Face The Raven	57243
356	4	/nLXzaaySsrIief9JVGdL8JsFTzt.jpg	Trapped in a world unlike any other he has seen, the Doctor faces the greatest challenge of his many lives. One final test. And he must face it alone.\n\nPursued by the fearsome creature known only as the Veil, he must attempt the impossible. If he makes it through, Gallifrey is waiting…	\N	8.57	2015-11-28 18:45:00	Heaven Sent (1)	57243
357	4	/63ZdUe52okiZu2oR75Rsd7teTxt.jpg	If you took everything from him, betrayed him, trapped him, and broke both his hearts...how far might the Doctor go?\n\nReturning to Gallifrey, the Doctor faces the Time Lords in a struggle that will take him to the end of time itself. Who is the Hybrid? And what is the Doctor’s confession?	\N	8.45	2015-12-05 18:45:00	Hell Bent (2)	57243
358	3	/8HPLQQqTPfy7Oiligw9FXcfig9w.jpg	Doctor Who, Season 10 will see Peter Capaldi embark on his thrilling final chapter as the Twelfth Doctor as well as the introduction of brand new companion Pearl Mackie as Bill Potts and the return of Matt Lucas as Nardole. Fantastic adventures and terrifying monsters await the team of heroes as they journey through space and time. Expect laughter, danger and exhilarating escapades in this final season under the helm of lead writer and executive producer Steven Moffat.	\N	7.68	2017-04-15 19:30:00	Season 10	57243
359	4	/gxxhOtonWORK058jPtzgh3gz3IN.jpg	A chance encounter with a girl with a star in her eye leads to a terrifying chase across time and space. Bill’s mind is opened to a Universe that is bigger and more exciting than she could possibly have imagined - but who is the Doctor, and what is his secret mission with Nardole on Earth?	\N	8.13	2017-04-15 17:45:00	The Pilot	57243
360	4	/pj8g594dT9tnxEyMp9WtCPYi2pO.jpg	In the far future, at the edge of the galaxy, there is a gleaming, perfect city. This brand new human settlement is said to hold the secret of human happiness - but the only smiles the Doctor and Bill can find are on a pile of grinning skulls.\n\nSomething is alive in the walls, and the emojibots are watching from the shadows, as the Doctor and Bill trying to unravel a terrifying mystery...	\N	7.85	2017-04-22 17:45:00	Smile	57243
361	4	/e2zFXmklhrGSFRWiuMGmJpIA3kz.jpg	The Doctor and Bill visit London during the last of the River Thames frost fairs in February 1814. They soon discover that there is something under the ice which is causing people to disappear.	\N	7.77	2017-04-29 17:45:00	Thin Ice	57243
362	4	/v7lKlSs0RBIRvRkaU1DdR6KE53K.jpg	Bill is moving in with some friends and they’ve found the perfect house – so what if it’s strangely cheap to rent, and the landlord is a little creepy?\n\nThe wind blows, the floorboards creak, and the Doctor thinks something is very wrong. What lurks in the strange tower at the heart of the building – and why can’t they find any way to enter it?	\N	7.70	2017-05-06 17:45:00	Knock Knock	57243
363	4	/d5nINIHEamo5hoXIRFQDlRGtW5J.jpg	The Doctor, Bill and Nardole answer a distress call in deep space, and find themselves trapped on board space station Chasm Forge. All but four of the crew have been murdered – and the dead are still walking!\n\nIn a future where oxygen is sold by the breath, and space suits are valued more highly than their occupants, the TARDIS crew battle for survival against the darkest evil of all…	\N	7.90	2017-05-13 17:45:00	Oxygen	57243
364	4	/6qjxu9RbVPWFEbE5E9dN0HjAfzm.jpg	In the Haereticum – the Vatican’s secret library of blasphemy – there is an ancient book known only as The Veritas. Throughout history, anyone who has ever read it has immediately taken their own life. Now a new translation is online, and the danger is spreading. The Vatican appeals to the Doctor. Will he read The Veritas? But can even the Doctor survive the ultimate truth?	\N	8.09	2017-05-20 17:45:00	Extremis	57243
365	4	/ni0M5tb3ehUcfcQ675VYOBeONs0.jpg	An 'ancient' pyramid appears overnight. Every clock in the world begins counting down to the Earth's destruction. Three opposing armies lie ready to annihilate each other. An alien race stands ready to offer humanity a deal that could save them, but enslave them. It is a terrifying race against time to save the world. Will the Doctor be forced to accept their help?	\N	7.94	2017-05-27 17:45:00	The Pyramid at the End of the World	57243
366	4	/iHKV70qoL9Fa1AkYRXYucv92MWV.jpg	Earth has been invaded and Bill is living alone, an isolated figure surviving in occupied Britain. The Doctor is imprisoned and appears to be on the side of the enemy, flooding the airwaves with fake news. Bill and Nardole must embark on a deadly mission to rescue the Doctor and lead the resistance against the new regime, whatever the cost.	\N	7.67	2017-06-03 17:45:00	The Lie of the Land	57243
367	4	/lJW5n7z9E4ppOOju0zKVd0PN0v.jpg	The Doctor, Bill and Nardole arrive on Mars and find themselves in an impossible conflict between Ice Warriors… and Victorian soldiers. As the Martian hive awakes around them, the Doctor faces a unique dilemma – this time the humans, not the Ice Warriors are the invaders. When Earth is invading Mars, whose side is he on?	\N	7.67	2017-06-10 17:45:00	Empress of Mars	57243
368	4	/890whs65S57x2qsiU8M3W5RQ0tk.jpg	A long time ago, the ninth legion of the Roman army vanished into the mists of Scotland. Bill has a theory about what happened, and the Doctor has a time machine. But when they arrive in ancient Aberdeenshire, what they find is a far greater threat than any army. In a cairn, on a hillside, is a doorway leading to the end of the world…	\N	7.69	2017-06-17 17:45:00	The Eaters of Light	57243
369	4	/oCdBc9eMkXqPUI8V096xoNyIf09.jpg	Friendship drives the Doctor into the rashest decision of his life. Trapped on a giant spaceship, caught in the event horizon of a black hole, he witnesses the death of someone he is pledged to protect. Is there any way he can redeem his mistake? Are events already out of control? For once, time is the Time Lord’s enemy...	\N	8.33	2017-06-24 17:45:00	World Enough and Time	57243
370	4	/ldwHPCFoMgyryt0bkg7g1jj2TFA.jpg	“Without hope, without witness, without reward.” The Mondasian Cybermen are on the rise. It’s time for the Doctor’s final battle…	\N	8.37	2017-07-01 17:45:00	The Doctor Falls	57243
371	2	/wQoosZYg9FqPrmI4zeCLRdEbqAB.jpg	What happens when hyperintelligent roommates Sheldon and Leonard meet Penny, a free-spirited beauty moving in next door, and realize they know next to nothing about life outside of the lab. Rounding out the crew are the smarmy Wolowitz, who thinks he's as sexy as he is brainy, and Koothrappali, who suffers from an inability to speak in the presence of a woman.	\N	8.42	2007-09-25 00:00:00	The Big Bang Theory	1418
372	3	/zqAL2rav7Tg8uwDtLurqZVN3mtr.jpg	University physicists Leonard and Sheldon know whether to use an integral or a differential to solve the area under a curve. But they don't have a clue about girls. Or dating. Or clothes. Or parties. Or having fun. Or, basically, life. So when a pretty blonde named Penny moves in the apartment across the hall, the guys decide to get an education outside of the classroom. Boys, you have a lot to learn.	\N	8.67	2007-09-25 00:00:00	Season 1	1418
373	4	/rxWlBXZhGWhumbLB8gAHyyW3ITD.jpg	Brilliant physicist roommates Leonard and Sheldon meet their new neighbor Penny, who begins showing them that as much as they know about science, they know little about actual living.	\N	8.12	2007-09-25 00:00:00	Pilot	1418
376	4	/bk8aIjAyS6XDG3I3otseP0jaR4x.jpg	Sheldon's getting fired forces him to explore what life has to offer outside physics, leaving Leonard to take drastic action to snap his friend out of his funk.	\N	7.96	2007-10-16 00:00:00	The Luminous Fish Effect	1418
377	4	/zO3CSyb13PQyzWICp4mmZEUeExp.jpg	Fearing he's wasting his time on Penny, Leonard ends up making a connection with Leslie.	\N	7.98	2007-10-23 00:00:00	The Hamburger Postulate	1418
378	4	/4P20QdmB6QL8aa0b8dKR8sHK1iW.jpg	Penny hosts a Hallowe'en party, putting Leonard, Sheldon, Wolowitz, and Koothrappali through a new test of their social skills.	\N	8.07	2007-10-30 00:00:00	The Middle Earth Paradigm	1418
379	4	/4y5rvzPZF5ukM3vtktqWTp9MhyH.jpg	With Wolowitz AWOL with one of her friends, Penny's recruited to fill in for him on the guys' Halo team	\N	8.04	2007-11-06 01:00:00	The Dumpling Paradox	1418
380	4	/rbVfuB7vBrrXygo0d8qhk9FhmAd.jpg	Raj's parents set him up on a blind date, but just when he discovers he can talk to her, she shows interest in Sheldon.	\N	8.06	2007-11-13 01:00:00	The Grasshopper Experiment	1418
381	4	/8MvMEvZzZPBkgQZIVk9KvF8nLH5.jpg	When they're invited to present at a physics conference, Sheldon's reluctance to share the credit leads to a tiff between him and  Leonard, and Penny's intervention only exacerbates the situation.	\N	8.06	2008-03-18 00:00:00	The Cooper-Hofstadter Polarization	1418
382	4	/6dssfbhNv1g3FFqKWKJhNqaqSQH.jpg	Leonard and Sheldon each lie to avoid seeing Penny's concert, but Sheldon's is a bit too complicated for his own good.	\N	7.96	2008-03-25 00:00:00	The Loobenfeld Decay	1418
383	4	/q0E0GNUMHWZDNKbygCjKJGiFc9G.jpg	With his friends knowing how sour he acts when sick—and avoiding him as a result—Sheldon is nursed by Penny, who hasn't a clue what she's in for.	\N	8.02	2008-04-01 00:00:00	The Pancake Batter Anomaly	1418
384	4	/zxQA3r7tOSJKNfe7S5hU02OIl9z.jpg	With Sheldon rattled over meeting Dennis, a 15-year-old physicist who's smarter than he, Leonard helps him look for a way to debunk Dennis's research.	\N	7.93	2008-04-15 00:00:00	The Jerusalem Duality	1418
385	4	/w1Et8tW5En8a2ieEWRlolAVkyED.jpg	Sheldon finds himself booted from the gang's Physics Bowl team and replaced with Leslie, so he forms his own team, hoping to prove he's superior.	\N	8.04	2008-04-22 00:00:00	The Bat Jar Conjecture	1418
386	4	/sktEOfZVIBnyW6MeZlGXbcdp6vO.jpg	When delivery of another collectible leads to Penny's lashing out at Leonard, he decides it's time to give up his habit, much to his friends' protestation.	\N	8.05	2008-04-29 00:00:00	The Nerdvana Annihilation	1418
387	4	/qBlf2PEd6RDGnyOip6ZPJ825AMw.jpg	The rest of the gang fall for Sheldon's twin sister, and Leonard's plan to win her heart is derailed when Sheldon declares he'll be the one to decide who can date her.	\N	8.06	2008-05-06 00:00:00	The Pork Chop Indeterminacy	1418
388	4	/jnI6qR3y9Hfn7hA1uCUJhYMkIAv.jpg	Penny wants to throw a surprise party for Leonard, but Sheldon's indulgence at an electronics store throws her off-track.\n	\N	8.13	2008-05-13 00:00:00	The Peanut Reaction	1418
389	4	/3RCfgXjtRcWRt1ci7RIYi3JzJQ9.jpg	Penny's break-up spurs Leonard to summon the courage to ask her out, and each goes to Sheldon for advice on their upcoming date.	\N	8.22	2008-05-20 00:00:00	The Tangerine Factor	1418
390	3	/2NBwUBZ4clwj6qO9fBinfxiB0dR.jpg	This season, Leonard gets a girl. So does Sheldon. Howard drives the Mars Rover into a ditch. Raj woos a terminator. Gorgeous girl-next-door Penny falls under the spell of Age of Conan. And super-smart, ueberconfident Leslie Winkler reduces mere men to spineless jellyfish.	\N	8.77	2008-09-23 00:00:00	Season 2	1418
391	4	/y9cFxQyFRBOewwVvkMl6SaH2om0.jpg	Penny's first date with Leonard goes awry; Penny finds Sheldon to be an unwilling confidant.	\N	8.03	2008-09-23 00:00:00	The Bad Fish Paradigm	1418
392	4	/uyVg1stSsplFU17YFYuFF75E1Zg.jpg	A jealous Leonard reacts to Penny's new guy by rebounding with Leslie.	\N	7.92	2008-09-30 00:00:00	The Codpiece Topology	1418
393	4	/q0bhAlY77x9XwfpHYrDScHZvMQE.jpg	Sheldon creates a monster when he introduces Penny to online gaming.	\N	8.16	2008-10-07 00:00:00	The Barbarian Sublimation	1418
394	4	/AvCiGNJqqaowpZlBdoO6Bp2hIdp.jpg	Raj gets an inflated ego and makes a play for Penny after being referenced in a magazine article.	\N	8.01	2008-10-14 00:00:00	The Griffin Equivalency	1418
395	4	/84UnqiLl4J8LCmJXWwTNfne4pWC.jpg	Leonard and his friends stage an intervention to force Sheldon to face his fear of driving.	\N	8.06	2008-10-21 00:00:00	The Euclid Alternative	1418
396	4	/2WAmfZtammDEhuQuDgxqQT7BR9z.jpg	Sheldon and the gang are confused when a young grad student is attracted to him.	\N	8.10	2008-11-04 01:00:00	The Cooper-Nowitzki Theorem	1418
397	4	/nBAjkqE9I805f9OCqxZAKVqnJT2.jpg	When Sheldon bans Penny from the apartment for numerous minor infractions, she decides to retaliate.	\N	8.21	2008-11-11 01:00:00	The Panty Piñata Polarization	1418
398	4	/AlvHVY7gvBHfQvMLAvB9PODeYQw.jpg	Leonard inadvertently steals away the new woman Wolowitz thinks is the love of his life.	\N	8.01	2008-11-18 01:00:00	The Lizard-Spock Expansion	1418
399	4	/f5ls4tc9cY8Zh9998lMyZ3A9E6B.jpg	Sheldon is thrilled when Leonard starts dating a woman who meets Sheldon's stringent standards.	\N	8.03	2008-11-25 01:00:00	The White Asparagus Triangulation	1418
400	4	/uosBIO5639eeocnvjCxqrLl2HEN.jpg	Leonard asks Penny for advice when his new relationship starts moving too fast.	\N	7.93	2008-12-09 01:00:00	The Vartabedian Conundrum	1418
401	4	/aUh7k8uTCSjnlFqQZ4HVKZ8N7rA.jpg	Penny starts dating Leonard's handsome colleague; Leonard and his friends are tortured by Sheldon's obsession with gift-giving etiquette.	\N	8.46	2008-12-16 01:00:00	The Bath Item Gift Hypothesis	1418
402	4	/fdo2epxMfOhpAWJ3EWplioQakRK.jpg	Penny's criticism of Wolowitz's romantic life pushes him into depression and AWOL for a fighting robot battle the rest of guys are depending on him for.	\N	7.91	2009-01-13 01:00:00	The Killer Robot Instability	1418
403	4	/9q49iyMGcO9EIk9vWbnBZgfGNSF.jpg	Sheldon creates a scientific procedure for making friends.	\N	7.95	2009-01-20 01:00:00	The Friendship Algorithm	1418
404	4	/wC2YMYgyCnEixzO1ztYx1LUAndL.jpg	Sheldon's solution to Penny's financial difficulty leads to a confrontation between Leonard and Penny's ex-boyfriend.	\N	7.97	2009-02-03 01:00:00	The Financial Permeability	1418
405	4	/cShchuw3099TXbfav7e9XU6qCoV.jpg	Leonard and Penny are drawn together after a disastrous visit from Leonard's mother.	\N	8.19	2009-02-10 01:00:00	The Maternal Capacitance	1418
406	4	/egK4v3alm6G7cm0CmMRGR3p8Yx3.jpg	A paintball game leads to a fight between Sheldon and Penny, and romance for Leslie and Wolowitz.	\N	8.05	2009-03-03 01:00:00	The Cushion Saturation	1418
407	4	/uorhUtKMHkx7EokhUcSBl3q6GRt.jpg	Leonard, Sheldon and Wolowitz are ecstatic to learn that a famous science-fiction actress (Summer Glau) is on board the train they are taking to San Francisco.	\N	7.98	2009-03-10 00:00:00	The Terminator Decoupling	1418
408	4	/fkaYEuDqCyBsODp0XYMAZrLULYs.jpg	Penny's home business turns into a complete nightmare when Sheldon takes over.	\N	8.07	2009-03-17 00:00:00	The Work Song Nanocluster	1418
409	4	/8LL0P42Z8mwyFXfnF3jnaabSZYt.jpg	Penny squares off with a new beautiful female neighbor who may become the building's "new Penny." 	\N	8.05	2009-03-31 00:00:00	The Dead Hooker Juxtaposition	1418
410	4	/otMgg5qrM4XfHwbGnpWhPy8R2yD.jpg	A fellow comic book enthusiast's hitting on Penny leads to Leonard and Howard going to a bar's Ladies' Night.	\N	7.99	2009-04-14 00:00:00	The Hofstadter Isotope	1418
411	4	/5SRU3ZHSjhdh7MOWHxivvO6p2Xs.jpg	Leonard and Koothrappali escort a heartbroken Wolowitz to Las Vegas, and Sheldon becomes locked out of his apartment and must stay with Penny.	\N	8.10	2009-04-28 00:00:00	The Vegas Renormalization	1418
412	4	/jNdjEnmBwdJiojaG6weilqZPfOn.jpg	Penny's second date with Stuart sees her making a comment that gives Leonard new hope for a relationship with her. Wolowitz realizes there's a crucial error in a NASA project he's working on.	\N	8.11	2009-05-05 00:00:00	The Classified Materials Turbulence	1418
413	4	/5NiLbb4TXeiiAjTPyqP08Swu8w5.jpg	The guys' plan to work over the summer at the North Pole makes Penny revaluate her feelings for Leonard.	\N	8.13	2009-05-12 00:00:00	The Monopolar Expedition	1418
414	3	/j64iUb52W2IYE9qV9pLi5tFq8IE.jpg	Worlds collide in Season 3! A love affair with Penny has opened a big, wide, wonderful world of romance for Leonard. But Sheldon likes the world just the way it was, thank you. All of which makes for a zany comic triangle with brainy, clueless Sheldon and practical, grounded Penny hilariously vying for the role of hypotenuse.	\N	8.73	2009-09-22 00:00:00	Season 3	1418
415	4	/4MFmDclUoXHM0se1IM9jKRhHp6n.jpg	When Sheldon learns the guys tampered with his expedition data he got from the arctic, he leaves to Texas in disgrace. This results in the guys following him, which threatens Leonard's hope for some romantic time with Penny and the guys' friendship with Sheldon. 	\N	8.08	2009-09-22 00:00:00	The Electric Can Opener Fluctuation	1418
416	4	/9jFDwZFm1r91jQLgCNu2LpHOeR0.jpg	Leonard and Penny struggle to recover from an awkward first hookup while Sheldon and Howard stake their best comic books on a bet to determine the species of a cricket. 	\N	7.98	2009-09-29 00:00:00	The Jiminy Conjecture	1418
417	4	/6HmTc86cMT295YCGWqcyqFM7RLw.jpg	Howard and Raj visit a Goth nightclub to pick up women while Sheldon attempts to build a better Penny using chocolate-based behavior modification. 	\N	7.97	2009-10-06 00:00:00	The Gothowitz Deviation	1418
418	4	/voUYI2Mu2uX3wORIx78vaZtteDA.jpg	Raj must find a new job or be sent back to India, but Sheldon has a solution, which leaves Leonard and Penny dealing with Howard as a third wheel.	\N	7.99	2009-10-13 00:00:00	The Pirate Solution	1418
419	4	/wM89iCs6rpjOabOau7yMbSwMGBd.jpg	After overhearing that Wil Wheaton is entering a trading-card competition, Sheldon decides to enter it himself. Meanwhile, Penny sets up one of her friends on a date with Wolowitz.	\N	8.05	2009-10-20 00:00:00	The Creepy Candy Coating Corollary	1418
420	4	/ethrkqDoGEbXtmN48IhN9aIESfa.jpg	Sheldon becomes Leonard's teacher in order to understand football, while an incident with flying a kite threatens Howard and Raj's friendship.	\N	7.83	2009-11-03 01:00:00	The Cornhusker Vortex	1418
421	4	/vbpHo8Px5CILtVR9wU3wyPSHn56.jpg	A squabble between Leonard and Penny sees Sheldon playing mediator, though out of his own incovenience from the sitiation rather than altruism.	\N	7.92	2009-11-10 01:00:00	The Guitarist Amplification	1418
422	4	/8EbctrCaN3RJXiTKe2a9yebM9rZ.jpg	With Leonard, Howard and Raj away camping in the desert, an injured Penny has only Sheldon to rely on.	\N	8.19	2009-11-17 01:00:00	The Adhesive Duck Deficiency	1418
423	4	/e2Vb37HOqNC7A2dyRJKwotzrfkE.jpg	After he's humiliated on National Public Radio, Sheldon vows to destroy Kripke, while Wolowitz tries not to destroy his new relationship with Bernadette.	\N	8.07	2009-11-24 01:00:00	The Vengeance Formulation	1418
424	4	/xUaKd5XBnmqny83essybaiQSICd.jpg	Penny gets help from Sheldon in order to understand what Leonard's work is, while Wolowitz develops a jealousy when Leonard starts hanging out with his new girlfriend.	\N	8.07	2009-12-08 01:00:00	The Gorilla Experiment	1418
425	4	/kioeIQpVHRmhILyFGHiiebACdX1.jpg	A Christmas visit from his mother has Leonard discovering she's kept a lot of news from him that she shares with Sheldon and worrying if she'll approve of his romance with Penny.	\N	8.08	2009-12-15 01:00:00	The Maternal Congruence	1418
426	4	/5uXitxxXHYVKHrEGmT3ylHRxOjn.jpg	Leonard is aghast to find out a secret of Penny's: she believes in psychics. Meanwhile, Sheldon tries to assist Koothrappali in picking up a girl at a university mixer.	\N	8.06	2010-01-12 01:00:00	The Psychic Vortex	1418
427	4	/axiLsQGNKt1gPWfvUNKWXis0g7r.jpg	When their apartment is robbed, Leonard and Sheldon turn to their friends to create a state-of-the-art security system.	\N	8.01	2010-01-19 01:00:00	The Bozeman Reaction	1418
428	4	/7tx6fSRlOn6r5HXVOzOjilaqeZI.jpg	Sheldon's search for the answer to a physics problem leads him to work at the Cheesecake Factory with Penny.	\N	8.17	2010-02-02 01:00:00	The Einstein Approximation	1418
429	4	/3elMw28LbCcugoq3l1YYnMRB5x7.jpg	Leonard can only bring one guest on a trip to see CERN's Large Hadron Collider (the world's largest and highest energy particle accelerator) in Switzerland on Valentine's Day.	\N	8.00	2010-02-09 01:00:00	The Large Hadron Collision	1418
430	4	/xVP7pr7EMlLFoc8RvE72SwKDNUr.jpg	Sheldon winds up in traffic court when he gets a ticket because of Penny.	\N	8.02	2010-03-02 01:00:00	The Excelsior Acquisition	1418
431	4	/wSVH5BgJ1f6LkoZHQiTLq8uEtKx.jpg	When the guys find a ring from "The Lord of the Rings" at a garage sale, it threatens to tear them apart.	\N	8.10	2010-03-09 01:00:00	The Precious Fragmentation	1418
432	4	/lyAMqIxYBlBNk8Brb6CWceltipC.jpg	Sheldon's friends come to his aid when his fear of public speaking stands between him and a coveted award.	\N	8.18	2010-03-23 00:00:00	The Pants Alternative	1418
433	4	/oHlOeHU6ruNOCE2yvRYG21r0AB5.jpg	A fight between Leonard and Penny threatens their relationship, while Sheldon battles Wil Wheaton in bowling.	\N	8.00	2010-04-13 00:00:00	The Wheaton Recurrence	1418
434	4	/dIwVRXOZVYbiDBTS0iHzU87Ckf9.jpg	When Leonard and Penny aren't speaking, Sheldon goes to extremes to keep them both happy.	\N	8.05	2010-05-04 00:00:00	The Spaghetti Catalyst	1418
435	4	/afJuGuebpnKoMySDLT8uspTuKMp.jpg	Leonard and Sheldon compete for the attention of a famous female physicist.	\N	8.09	2010-05-11 00:00:00	The Plimpton Stimulation	1418
436	4	/nlrAXWCH48c8ixIRjA5dba7ssJ8.jpg	Leonard tells Penny about how he met Sheldon for the first time...and what happened to the elevator.	\N	8.22	2010-05-18 00:00:00	The Staircase Implementation	1418
437	4	/8qiIzoYt24oqoYu5W6Zl1NLdkeM.jpg	While Penny worries that dating Leonard has ruined her for normal guys, Wolowitz and Koothrappali search for Sheldon's perfect match online.	\N	8.29	2010-05-25 00:00:00	The Lunar Excitation	1418
438	3	/hM2TYCmOVXop1xhLA1Mbqyg60ze.jpg	This season the Big Bang gang’s romantic universe expands. On the rebound from Penny, Leonard falls into the arms of Raj’s sister Priya. Sheldon gets a girlfriend, or rather a friend who is a girl: Amy, a dour neurobiologist who declares herself besties with Penny. Howard and Bernadette heat up. And so do Raj and Bernadette (at least in Raj’s Bollywood daydream).	\N	8.56	2010-09-24 00:00:00	Season 4	1418
439	4	/mWb1Pqj69defY79lWT5whB93amH.jpg	Penny tags along on Sheldon's first ever date; Wolowitz finds a new use for a robotic arm.	\N	8.14	2010-09-24 00:00:00	The Robotic Manipulation	1418
440	4	/z5HaxRkizr5mXY2h6t48NeW7WHc.jpg	Realizing he will not live long enough to download his consciousness into a robot body, Sheldon tries to extend his life span.	\N	8.08	2010-10-01 00:00:00	The Cruciferous Vegetable Amplification	1418
441	4	/zzirlcKXa59InOVr0XqQqptWI9u.jpg	The guys are concerned as Sheldon searches for an alternative to human companionship.	\N	8.04	2010-10-08 00:00:00	The Zazzy Substitution	1418
442	4	/cRmRUBDVIzIW7goyI1RYfOKzOru.jpg	An embarrassing secret of Wolowitz's comes to light, while Sheldon and Raj have a small war at work.	\N	8.00	2010-10-15 00:00:00	The Hot Troll Deviation	1418
443	4	/eC8uxQxHQl1f7IaMxguuvzZ0IFS.jpg	Leonard realizes he’s the only one without a girlfriend, while Sheldon wants to get rid of his.	\N	7.99	2010-10-22 00:00:00	The Desperation Emanation	1418
444	4	/hSGsvcjqOYDE0OjSO8YGCUZu4uS.jpg	Leonard keeps an affair a secret from Sheldon, Howard and Raj.	\N	8.03	2010-10-29 00:00:00	The Irish Pub Formulation	1418
445	4	/t0WHy5iJwTpEzatBsIKcnBN5Mim.jpg	Sheldon's answers during an FBI interview put Wolowitz's security clearance in jeopardy.	\N	8.00	2010-11-05 00:00:00	The Apology Insufficiency	1418
446	4	/sUqV1mRRIHSTURqaB91TJa3STYS.jpg	While the guys camp in line for a long-awaited movie screening, Penny and Bernadette invite Amy to her first slumber party.	\N	8.06	2010-11-12 01:00:00	The 21-Second Excitation	1418
447	4	/wf22T6mMkuAlvASCmfxYb4TeLja.jpg	Penny asks Leonard to lie to her father, while Howard, Raj and Bernadette pull an all-nighter at a telescope.	\N	8.21	2010-11-19 01:00:00	The Boyfriend Complexity	1418
448	4	/fQ0f0ctLmE4AoY2Vxx0FVFDmOJj.jpg	Amy finds she has sexual feelings for Penny's ex, while Koothrappali and Wolowitz try to prove who would be the better superhero.	\N	7.91	2010-12-10 01:00:00	The Alien Parasite Hypothesis	1418
449	4	/tXv9ip8xDHB03iCvX9E7MPMJnlD.jpg	The guys find a "super" use for Penny's new boyfriend, Zack, when they enter a costume contest as the Justice League. 	\N	8.22	2010-12-17 01:00:00	The Justice League Recombination	1418
450	4	/ksC48YK2UFV8GeBETu11fTM7r0a.jpg	Leonard's idea for a smartphone app derails his friendship with Sheldon.	\N	7.92	2011-01-07 01:00:00	The Bus Pants Utilization	1418
451	4	/eYBLpaag18wl4LfRmyTdSNNDMw4.jpg	Bernadette runs into her ex-boyfriend while attending a science event with Wolowitz.	\N	8.13	2011-01-21 01:00:00	The Love Car Displacement	1418
452	4	/j2iZFSk4Nd16GmPAZwXCr4JX8HO.jpg	Hoping it will make him a better teacher, Sheldon has Penny give him acting lessons. Raj has fantasies about a friend's girlfriend.	\N	7.91	2011-02-04 01:00:00	The Thespian Catalyst	1418
453	4	/bwcoYIObcrLUgbgQCRZKHYU8o2o.jpg	A wealthy donor to the university makes Leonard consider how far he's willing to go for the sake of science.	\N	8.07	2011-02-11 01:00:00	The Benefactor Factor	1418
454	4	/diipQcaojYFyHWXZIv6BaPnFU4s.jpg	As Wolowitz contemplates taking things with Bernadette to the next level, Leonard rekindles his relationship with Raj's sister.	\N	8.06	2011-02-18 01:00:00	The Cohabitation Formulation	1418
455	4	/oLOcwFRUvREspaavAhlzyBZaHdB.jpg	Sheldon becomes concerned when everybody begins to hang out at Raj's apartment and discovers Leonard is the center of the group.	\N	8.07	2011-02-25 01:00:00	The Toast Derivation	1418
456	4	/eyRxvkPeegoTP9h9mw7TVuIKFdU.jpg	Sheldon is baffled by Wolowitz's magic trick. Meanwhile, Leonard realizes dating Priya may make it impossible to continue being friends with Penny.	\N	8.25	2011-03-11 01:00:00	The Prestidigitation Approximation	1418
457	4	/yjfkO1wNV8l3oyDyHR8caqnhcff.jpg	Sheldon's World of Warcraft online game account is hacked and he is determined to find out who did it. Also Penny shares some girl talk with her friends about Leonard and his new girlfriend. When Howard discovers who hacked the account, the guys depart for a quest to Carlsbad, California where the hacker, Todd Zarnecki, lives in order to retrieve the stolen account, along with "enchanted weapons, gladiator armor, gold, and a battle ostrich, Glenn". Despite Sheldon carrying his Bat'leth with him they fail miserably. On the way back their car engine breaks down, and they're saved by Penny, who came to drive them home and upon hearing about their failure promises to show them "How we finish quests in Nebraska" and forces Zarnecki to give up kicking him below waist.	\N	8.16	2011-04-01 00:00:00	The Zarnecki Incursion	1418
458	4	/AqRkNvMif7UKW1grguHuXaO92le.jpg	Sheldon and Amy decide to start several rumors about the others as a test. Meanwhile, Howard takes his relationship with Bernadette to even higher level.	\N	8.24	2011-04-08 00:00:00	The Herb Garden Germination	1418
459	4	/nDmwd3iWFqmO9PoC21xWg8EIF9Q.jpg	When Leonard spends too much time in the shower with Priya, Sheldon charges Leonard with two violations of the roommate agreement. However, before he can get too far, Priya uses her skills as a lawyer to nullify the charges due to the agreement's vague wording, much to Sheldon's dismay. When the guys take advantage of Priya's skills in order to eat Greek food on pizza night, Sheldon goes to Penny, who invites him to a girls' night out with Amy and Bernadette, which Sheldon agrees to after Penny mentions that they may be talking trash about Priya. After the girls drink some cocktails, they decide to take Sheldon dancing, which Sheldon reluctantly goes along with. After dancing, Sheldon takes an intoxicated Amy back to her apartment and as well as talking about Priya, meets a monkey who is addicted to smoking cigarettes. Amy tells Sheldon not to give in to Priya's law skills, before kissing him and going to her bathroom to vomit.	\N	8.20	2011-04-29 00:00:00	The Agreement Dissection	1418
460	4	/nyeGKYQVp5WHmFgSaqT6FaeaR7j.jpg	Raj attempts to cure his social anxiety disorder while Penny uses Bernadette to spy on Leonard and his girlfriend.	\N	8.12	2011-05-06 00:00:00	The Wildebeest Implementation	1418
461	4	/tj2ZwG0xRGjAtmjshIx8J3vsgvp.jpg	When Howard finally breaks the news to his mom that he's engaged to Bernadette, it lands her in the hospital.	\N	8.20	2011-05-13 00:00:00	The Engagement Reaction	1418
462	4	/mWA4sWG1t1ekD1A7sy6wy0FnxEM.jpg	When Bernadette receives her PhD, Wolowitz feels emasculated. Raj and Leonard swap places and Penny does something she's regrets.	\N	8.37	2011-05-20 00:00:00	The Roommate Transmogrification	1418
463	3	/l08Z8ihAsTRPEuOehbwk4axg3cu.jpg	In season five, Penny and Leonard's relationship is relaunched in full "beta test" mode, while Sheldon, Howard, and Raj discover the feminine mystique is something that cannot be easily graphed or calculated. As Sheldon makes begrudging amendments to his "Relationship Agreement" with his "friend-who-happens-to-be-a-girl" Amy Farrah Fowler, Raj contemplates an arranged marriage, and Howard is all-systems-go for both is NASA space launch and wedding to the spirited Bernadette.	\N	8.44	2011-09-23 00:00:00	Season 5	1418
464	4	/p4iEiMNcp4twY8UExrJEAFgfKNN.jpg	Penny is worried with how damaged her friendship with the guys will be in the aftermath of her sleeping with Raj while Sheldon becomes the leader of the paintball team.\n	\N	8.09	2011-09-23 00:00:00	The Skank Reflex Analysis	1418
465	4	/uC7Tu9nUcU8TArVj9hfL19Sbu02.jpg	A fight between Sheldon and Penny leaves Amy caught in the middle, while Leonard tries to spice up his long-distance relationship with Priya.	\N	8.08	2011-09-23 00:00:00	The Infestation Hypothesis	1418
466	4	/JcLSNor6DBT2yunvpC2bPNl5ug.jpg	Leonard and Amy get to know each other better, while Howard and Bernadette spend the weekend with Mrs. Wolowitz.	\N	8.04	2011-09-30 00:00:00	The Pulled Groin Extrapolation	1418
467	4	/gNvsQbFaUmEdA6emU1b5QjNSSUi.jpg	Penny plays Matchmaker for Raj, which results in him finding a girl he is comfortable talking to.	\N	8.11	2011-10-07 00:00:00	The Wiggly Finger Catalyst	1418
468	4	/n7SjA6WCUaUDJuAAw9wCEXlUeYJ.jpg	Sheldon and Leonard get invited to a party at Wil Wheaton's house, and Howard gets an out-of-this-world opportunity.	\N	8.16	2011-10-14 00:00:00	The Russian Rocket Reaction	1418
469	4	/48KJU7snU3fcO9r5B1i1UOvRWdK.jpg	Sheldon's mother, Mary Cooper, comes to visit, but Sheldon is annoyed that she also spends time with the rest of the gang, instead of catering to his every demand. 	\N	8.04	2011-10-21 00:00:00	The Rhinitis Revelation	1418
470	4	/ebed5DV7dCo4VidLmtw72Dq1C0P.jpg	A cute comic book artist puts Leonard and Priya’s relationship to the test, while Sheldon tries to scare the guys for Halloween.	\N	8.35	2011-10-28 00:00:00	The Good Guy Fluctuation	1418
471	4	/aurpiLKoAxCIuUkudW7bSQ75CG6.jpg	Amy becomes heartbroken when she discovers that Penny and Bernadette went wedding dress shopping without her. 	\N	8.02	2011-11-04 00:00:00	The Isolation Permutation	1418
472	4	/7B0IDHuAPW4ldQXoZOmD0aloOFs.jpg	Leonard and Penny try hanging out as friends on a 'non-date', but end up purposely ruining each others chances with perspective dates. Meanwhile, Sheldon enlists the help of Bernadette and Amy to overcome his fear of birds.	\N	8.15	2011-11-11 01:00:00	The Ornithophobia Diffusion	1418
473	4	/pxFsLPiyfeyKT1dFVcT4NaljN6U.jpg	Sheldon considers taking his relationship with Amy to the next level when Stuart from the comic book store asks her out on a date.	\N	8.11	2011-11-18 01:00:00	The Flaming Spittoon Acquisition	1418
474	4	/cBCPpoq0WrYSLuba4lfhdQpRYiK.jpg	Leonard must face his fears after being contacted by his high school tormentor.	\N	7.86	2011-12-09 01:00:00	The Speckerman Recurrence	1418
475	4	/1aHuf2HoOL3CXeg0kC2nqMJZFlz.jpg	Sheldon gets in trouble with Amy when he isn't impressed by her recent accomplishment, and Howard must come to grips with Bernadette's dislike of children.	\N	8.10	2012-01-13 01:00:00	The Shiny Trinket Maneuver	1418
476	4	/LrCaKB8n4kiFi1Wv0M0Zi4Cyf1.jpg	Leonard, who broke up with Priya, asks Penny out to a spur-of the-moment romantic dinner for two, and the duo contemplates on their relationship. 	\N	8.19	2012-01-20 01:00:00	The Recombination Hypothesis	1418
477	4	/5e8e9h79Z2tIvEeAQbT03f5jJIP.jpg	Leonard and Penny deal with the idea of starting a relationship again and Raj finally finds a "woman" he can talk to without being drunk, in the form of Siri on his new phone. Meanwhile, Sheldon decides to start a YouTube series entitled "Sheldon Cooper presents Fun with Flags" with the help of Amy. 	\N	8.31	2012-01-27 01:00:00	The Beta Test Initiation	1418
478	4	/kFg32ZrA7NwZ4G2yIdlvY4spiSE.jpg	Sheldon's selfish demands force Leonard to reconsider their friendship. Meanwhile, Wolowitz tries to pick his astronaut nickname.	\N	8.16	2012-02-03 01:00:00	The Friendship Contraction	1418
479	4	/4gKRiiKQOiCVz7XxnGDGsdLfxQC.jpg	When Sheldon is forced to take his vacation, he goes to work with Amy in her neurobiology lab.	\N	8.06	2012-02-10 01:00:00	The Vacation Solution	1418
480	4	/mXfjsXkRNTadAc5QmBSEpYp7kxI.jpg	Penny is horrified when Amy gives her a gift: a huge, quite horrible painting of the two of them. With no good way to avoid displaying it, she only hangs it up when Amy is over. When Amy catches her taking the painting down, she's embarrassed and angry until Penny lies and says the gift made Bernadette jealous.\nWhen the deranged Professor Rothman is forced to retire, both Sheldon and Kripke vie for his office. President Siebert refuses to resolve the dispute, so Leonard arranges a one-on-one basketball game to decide (since they're both equally bad at sports). Neither one can even make a single basket, so they end up deciding by seeing who can bounce the ball the highest. Sheldon wins; unfortunately, the office is not what he'd hoped for: the thermostat is located in the office of a professor going through the hot flashes of menopause (thus Sheldon is too cold), the mockingbird outside his window is off-key with the annoying windchimes, the perpetually naked Professor Rothman refuses to vacate, and the Geology Department upstairs makes too much noise. Finally, Sheldon gets his head stuck in the wall in an existing hole, after which Leonard takes his picture before he goes for help.	\N	8.20	2012-02-17 01:00:00	The Rothman Disintegration	1418
481	4	/9zQOT6sWLxGYlhEm4w4k9g8pfto.jpg	Sheldon becomes agitated when his regular barber is out sick. Astronaut training causes Howard to reconsider wanting to go into space. Penny beats Leonard in chess, the first time she plays.	\N	8.27	2012-02-24 01:00:00	The Werewolf Transformation	1418
482	4	/oV7kx2yUpQW9J1EtoOCzjg0ImrQ.jpg	Sheldon must choose between joining Amy at her aunt's birthday party or playing videogames all weekend with the guys.	\N	8.25	2012-03-09 01:00:00	The Weekend Vortex	1418
483	4	/6Qmr055Mb0WpftolHquEUg3lsyK.jpg	Penny buys Leonard and Sheldon “Star Trek” collectibles as a thank-you, leading Sheldon to be haunted by Mr. Spock. Meanwhile, Raj decides he has met the “Future Mrs. Koothrappali” after his parents set him up on a date.	\N	8.22	2012-03-30 00:00:00	The Transporter Malfunction	1418
484	4	/fuhNUadNllYAavIaRs49xPv3KT7.jpg	When Wolowitz gets to work with Stephen Hawking, Sheldon is willing to do anything to meet his hero.	\N	8.31	2012-04-06 00:00:00	The Hawking Excitation	1418
485	4	/itWuT7J1FJhMm90D1DDUqtGHPfq.jpg	After the guys throw Howard a bachelor party, Bernadette reconsiders marrying him after learning about his sexual history.	\N	8.15	2012-04-27 00:00:00	The Stag Convergence	1418
486	4	/kxmph4faR8SVmoG8dCigsypzlZk.jpg	When NASA moves up Howard's mission, he must face his fears and Bernadette's dad, thus putting the wedding plans in jeopardy. Meanwhile, Leonard says something surprising to Penny in the bedroom.	\N	8.25	2012-05-04 00:00:00	The Launch Acceleration	1418
487	4	/kxEZL3HEDFpRKuT9pOXa57t5Lct.jpg	The fifth season ends with Howard and Bernadette deciding to get married before his NASA mission, causing the gang to scurry into overdrive in an effort to stage the wedding. NASA astronaut Mike Massimino has a cameo as himself.	\N	8.35	2012-05-11 00:00:00	The Countdown Reflection	1418
488	3	/2Rsb94mlt4OHhiO2UWatDOhnBqv.jpg	Whether on or above Earth, hilarity is outrageously universal in TV's most popular comedy featuring four forward-thinking but socially backward geniuses. Fun discoveries multiply: Leonard learns jealousy is bad for a relationship (with Penny) but science is good for seduction (of Penny). Howard finds life in the International Space Station life is no escape from terrestrial turmoil between his mom and his new wife Bernadette. Raj meets someone special who may be a good match, if he can keep her from fleeing mid-date. And then there's Sheldon. He learns what not to say after facing harassment charges or competing for tenure at work and how Dungeons & Dragons can be the icebreaker his relationship with Amy needs.	\N	8.37	2012-09-28 00:00:00	Season 6	1418
489	4	/4B368zuJ95q9YIytU5RQWTcoqt4.jpg	Raj faces his loneliness when his friends are out on dates; while in space, Wolowitz gets drawn into a fight between Bernadette and his mom.	\N	7.97	2012-09-28 00:00:00	The Date Night Variable	1418
490	4	/iPmPrWqh2cjOrowe6vY7A2WQdEr.jpg	Sheldon tries to intervene when he learns that Penny is thinking about breaking up with Leonard; Howard is picked on.	\N	8.01	2012-10-05 00:00:00	The Decoupling Fluctuation	1418
491	4	/qR33LssYT8TAE63s9JO9O1uV5T9.jpg	Amy feels threatened by Sheldon's new assistant; Wolowitz starts to feel the pressures of being in space.	\N	8.07	2012-10-12 00:00:00	The Higgs Boson Observation	1418
492	4	/8dEANiXOoJRkMuY3IzPnkCFLbch.jpg	Wolowitz's return from space isn't all he expected; game night becomes a gender war.	\N	8.12	2012-10-19 00:00:00	The Re-Entry Minimization	1418
493	4	/wZ1yGqMU2IbArCMoSfmvlOQZYUO.jpg	The gang heads to Stuart's comic book store to celebrate Halloween; Leonard uses science to seduce Penny.	\N	8.04	2012-10-26 00:00:00	The Holographic Excitation	1418
494	4	/rjuBewK571pQy2fMPXccELf4qA0.jpg	A game threatens Sheldon's relationship with Stephen Hawking; Penny secretly signs up for a college class.	\N	8.01	2012-11-02 00:00:00	The Extract Obliteration	1418
495	4	/fQE9HcNPMoxG0zlOPOqpVxp0fzI.jpg	Bernadette wants Wolowitz to move out of his mom's house; Sheldon is caught in the middle of Amy and Wil Wheaton's argument.	\N	8.07	2012-11-09 01:00:00	The Habitation Configuration	1418
496	4	/kTa10r4ixikaOzbNKN01er69B6z.jpg	Raj and Howard try to to figure out why Sheldon disappears at 2:45 every afternoon; jealousy arises in Penny and Leonard's relationship.	\N	8.18	2012-11-16 01:00:00	The 43 Peculiarity	1418
497	4	/6umV4rqsYAXJBx4n3enWL17s2Mx.jpg	Sheldon and Wolowitz's fight over a parking spot at the university impacts the whole gang.	\N	8.18	2012-11-30 01:00:00	The Parking Spot Escalation	1418
498	4	/1v11KeF9iGcsMIyoubWxn2PUiMt.jpg	When Amy gets sick, Sheldon tries to nurse her back to health; Wolowitz and his father-in-law plan a fishing trip.	\N	8.23	2012-12-07 01:00:00	The Fish Guts Displacement	1418
499	4	/nPOucbTVMxh3Vk7G11JQs6M0wKs.jpg	During a game, Sheldon revisits Christmas memories; Amy, Penny and Bernadette look for a date for Koothrappali.	\N	8.03	2012-12-14 01:00:00	The Santa Simulation	1418
500	4	/20ywqn6sUIpKrTLvEs8j5Xt8RoC.jpg	When Sheldon is accused of sexual harassment, he ends up getting Raj, Leonard and Wolowitz in trouble.	\N	8.20	2013-01-04 01:00:00	The Egg Salad Equivalency	1418
501	4	/i9iyVGVGJhIFvEZMyZJCIh4Bq9j.jpg	As the guys don costumes and go on a road trip to a comic book convention, the ladies decide to stay home and try to interpret a comic book.	\N	8.22	2013-01-11 01:00:00	The Bakersfield Expedition	1418
502	4	/49L8kp4S5KG8F51jWhnVqiROU7o.jpg	Sheldon faces a crisis of confidence when he is forced to work with his nemesis, Barry Kripke; Raj and Howard buy expensive action figures of themselves.	\N	8.10	2013-02-01 01:00:00	The Cooper/Kripke Inversion	1418
503	4	/BJqrgEjvKtLv1GvtEk6jEOG4xd.jpg	A fight between Sheldon and Leonard impacts Amy and Penny's living arrangements; while Howard is away, Raj helps Mrs. Wolowitz out.	\N	8.10	2013-02-08 01:00:00	The Spoiler Alert Segmentation	1418
504	4	/t3mBbwmnfFyZfCkPIrlsFTpqtX3.jpg	The guys search for a perfect Valentine's Day gift for their significant others; Stuart and Raj host a "lonely people" party at the comic book store.	\N	8.03	2013-02-15 01:00:00	The Tangible Affection Proof	1418
505	4	/9mESh7C2sAfDlSNieAIbZSNUtDO.jpg	After a bad date, Koothrappali decides to never leave his apartment; Penny's acting skills impress Sheldon.	\N	8.02	2013-02-22 01:00:00	The Monster Isolation	1418
506	4	/ofH9NUUdzLgrzdBnAKQZpMlN4D0.jpg	Leonard, Sheldon and Wolowitz talk to junior high girls about science-related careers; Raj plans a date with Lucy.	\N	8.11	2013-03-08 01:00:00	The Contractual Obligation Implementation	1418
507	4	/6rRlXXWtpfcvUElLulQziUygpJ3.jpg	Howard considers whether or not he should open a letter from his father; Penny and Leonard host a "grown-up" cocktail party.	\N	8.17	2013-03-15 00:00:00	The Closet Reconfiguration	1418
508	4	/hPTtj9jq5MEicZl1n0KlVGYCVVI.jpg	The girls get involved when Leonard, Sheldon and Raj compete for tenure at the University.	\N	8.24	2013-04-05 00:00:00	The Tenure Turbulence	1418
509	4	/kB1tTwjePahW7J8bxF7UDbOeYWP.jpg	Amy tries to help Sheldon get over his compulsive need for closure when one of his favorite TV shows is canceled; Raj discovers a secret about Lucy.	\N	8.29	2013-04-26 00:00:00	The Closure Alternative	1418
510	4	/cd1F6bJeh8ZShiN6kg4A86rrCQC.jpg	Leonard and Sheldon hire the host (Bob Newhart) of their favorite childhood TV show to perform; Bernadette and Howard run into trouble while dog-sitting for Raj's pet.	\N	8.10	2013-05-03 00:00:00	The Proton Resurgence	1418
511	4	/wYoUk1sVkbVaixAb4Yylvvsf0S9.jpg	Amy and Sheldon's relationship takes a surprising turn during a game of "Dungeons & Dragons"; Lucy and Koothrappali have an awkward date.	\N	8.28	2013-05-10 00:00:00	The Love Spell Potential	1418
512	4	/vSXj11LVxoN5Lf11YyqVmS6kjjl.jpg	When Leonard is considered for an exciting research opportunity, Sheldon becomes jealous and tries to scare him into backing out.  Meanwhile, Raj's relationship with Lucy is strained when he tries to get her to meet his friends.	\N	8.17	2013-05-17 00:00:00	The Bon Voyage Reaction	1418
537	4	/ttZQApyLrVIw5RJPdc6sNBf2Mfv.jpg	Faced with an uncertain future, Sheldon considers a major change; Emily and Raj decide to take things to the next level.	\N	8.10	2014-05-16 00:00:00	The Status Quo Combustion	1418
559	4	/ApopO3nNzWkFgE7ATs1jMOOaAzF.jpg	When Raj is asked to create a message in case a NASA mission discovers alien life, the guys fight over what he should do. Also, Penny is torn between auditioning for a movie or keeping her successful pharmaceutical sales job.	\N	7.44	2015-04-17 00:00:00	The Communication Deterioration	1418
513	3	/j1FU0qKHx1F8FVBmK5DBOTrhsAr.jpg	Leonard returns from his North Sea expedition to find that his relationship with Penny involves more beta-testing than he’s ever done in a lab. Howard’s attachment issues with the women in his life in particular and Raj’s social breakthrough with women in general provide more laughs. Bernadette and Amy stand staunchly by the men in their life, even when they’re sitting in marathon role-playing games. Sheldon sees his mom in a totally different way, parties with James Earl Jones, establishes a (sort of) bond with his idol Professor Proton and makes a scientific breakthrough that breaks down before you can say Science Friday.	\N	8.31	2013-09-27 00:00:00	Season 7	1418
514	4	/gLVcxpHMXwFdYNz5qpwT7D4xobq.jpg	In the first part of the one-hour seventh season premiere, Sheldon and Penny bond in Leonard's absence, but it's Sheldon's feelings that are crushed when Leonard returns from the North Sea. Guest star Regina King returns as Mrs. Davis, the University's Director of Employee Relations.	\N	8.03	2013-09-27 00:00:00	The Hofstadter Insufficiency	1418
515	4	/8dtUzxoROPxK4h8aOpN2d0VIrnN.jpg	On the second part of the one-hour seventh season premiere, Raj gets consoled about his ex-girlfriend and Howard's relationship with his mother causes an unusual threat to his masculinity. Kevin Sussman returns as Stuart, the comic book store owner.	\N	8.13	2013-09-27 00:00:00	The Deception Verification	1418
516	4	/9TfdBipAB3Su41jtoyCYVh3n4qF.jpg	When the entire gang competes in a cutthroat scavenger hunt designed by Raj that tests their science knowledge and street smarts, it brings out the best – and worst – in everyone.	\N	8.31	2013-10-04 00:00:00	The Scavenger Vortex	1418
517	4	/4Nv7khUgwpqJq1vEqb3QC7SCSC.jpg	After Amy ruins one of Sheldon's favorite movies – Raiders of the Lost Ark – he gets defensive, seeking revenge. Meanwhile, Leonard discovers a way to get Penny to do anything; and Raj and Stuart create online dating profiles.	\N	8.04	2013-10-11 00:00:00	The Raiders Minimization	1418
518	4	/8gsO10PHQnMO0qqXKN58Dk9bBBm.jpg	Sheldon must decide how much "Amy time" is too much after she takes a job at his university, and their relationship is put to the test. Meanwhile, Howard finds himself sleeping on Raj's couch after a fight with Bernadette.	\N	8.01	2013-10-18 00:00:00	The Workplace Proximity	1418
519	4	/72rOuEWwRImeqSxohELPj4KcZGl.jpg	Sheldon's latest scientific breakthrough makes him feel like a fraud – and threatens to haunt him forever. Meanwhile, Howard's romantic gesture to Bernadette causes Penny to step up her game with Leonard.	\N	8.29	2013-10-25 00:00:00	The Romance Resonance	1418
520	4	/iGnMTWsJH0Iy1TgMsEEH525pZ4E.jpg	Sheldon feels slighted when Professor Proton (recurring guest star Bob Newhart) seeks advice from Leonard instead of him, and he seeks revenge by befriending a rival science TV host, Bill Nye (guest starring as himself). Meanwhile, Raj gets jealous when Howard crashes "girls' night."	\N	8.09	2013-11-08 01:00:00	The Proton Displacement	1418
521	4	/zyVbYHiuLJloyBS114wZQ3MoCwQ.jpg	Leonard tries to keep Sheldon from overreacting when a past mistake comes to light, but Sheldon punishes Leonard by making him "walk a mile in his shoes." Meanwhile, Penny confronts Raj's ex-girlfriend, Lucy (guest star Kate Micucci).	\N	8.01	2013-11-15 01:00:00	The Itchy Brain Simulation	1418
522	4	/pi75to7J8ccuFwsxk6JUgLX73CH.jpg	An upset Sheldon protests when the entire gang drags him to Mrs. Wolowitz's house for Thanksgiving. Meanwhile, Penny and Leonard must deal with a mistake from her past.	\N	8.38	2013-11-22 01:00:00	The Thanksgiving Decoupling	1418
523	4	/4uYb8WBhcynYXn9zt1Dqn9ecJGD.jpg	Sheldon faces a crisis after Leonard disproves his accidental scientific discovery. Meanwhile, Raj must stay with Howard & Bernadette for a week.	\N	7.95	2013-12-06 01:00:00	The Discovery Dissipation	1418
524	4	/u9i2Bt8zer4wRlluZP6M5aNOVBO.jpg	While Sheldon is in Texas, the rest of the gang realize how much he has changed their lives as they decorate the apartment Christmas tree.	\N	8.15	2013-12-13 01:00:00	The Cooper Extraction	1418
525	4	/fFtyEDSvjcTnMDK4X9TNdcgX1cP.jpg	As Leonard tries to help Penny with a disappointment, Penny asks him a bold question about their relationship; Sheldon wants to learn how to be funny.	\N	7.91	2014-01-03 01:00:00	The Hesitation Ramification	1418
526	4	/hELmM0SOzRYBgYeGBXFmCPtCplp.jpg	Sheldon must learn how to relax when he is forced to take a vacation; Leonard tries to support Penny when she quits her job; Bernadette needs to replace one of Stuart's comic books.	\N	7.94	2014-01-10 01:00:00	The Occupation Recalibration	1418
527	4	/cSZz02yrNxFgPurf3qzjOBApmD.jpg	Unable to get Comic-Con tickets, Sheldon tries to hold his own convention and ends up spending a wild evening with James Earl Jones; the ladies try to act maturely.	\N	7.96	2014-01-31 01:00:00	The Convention Conundrum	1418
528	4	/niAxb6opEFN8Qh6PAgNvCjwSp5Q.jpg	Sheldon and Amy go on a trip to wine country with Howard and Bernadette; Penny and Leonard rush Raj's dog to the vet	\N	8.18	2014-02-07 01:00:00	The Locomotive Manipulation	1418
529	4	/hQDnxCPLBsx3yqWkXxon5xUSKHT.jpg	When Leonard buys a dining room table, Sheldon re-evaluates the changes in his life; Bernadette is torn when Wolowitz gets the chance to go back to space.	\N	7.94	2014-02-28 01:00:00	The Table Polarization	1418
530	4	/qE2TUN7dGf7uQHMRPjQBjGoZNYC.jpg	Bernadette tries to negotiate peace between Sheldon and Wolowitz; Penny receives an embarrassing offer; Raj wants Amy to write to a woman on his behalf.	\N	7.90	2014-03-07 01:00:00	The Friendship Turbulence	1418
531	4	/vWqUcSJkak2uWHmafkGAwRlYzyJ.jpg	Sheldon is faced with a new reality when he visits his mom in Houston; a murder mystery party starts arguments.	\N	7.90	2014-03-14 00:00:00	The Mommy Observation	1418
532	4	/mF1eIY5zamkqIueM02BbW41yCJr.jpg	Raj struggles with guilt when he dates two women at once; Penny has a chance to play a part in a cheesy movie; Sheldon is torn between two gaming systems.	\N	8.21	2014-04-04 00:00:00	The Indecision Amalgamation	1418
533	4	/unJUBeZADZWE0KNnVoRNbVm7cRl.jpg	Sheldon has a personal crisis when he decides string theory is a waste of his time; a double date ends in embarrassment for Howard.	\N	8.05	2014-04-11 00:00:00	The Relationship Diremption	1418
534	4	/78XqKsIx2kP4aiZLQmgjDXfLNol.jpg	Sheldon gives spontaneity a try, which causes unexpected friction for Penny, Bernadette and Amy; Raj asks Howard for help with preparation for a date with Emily.	\N	7.97	2014-04-25 00:00:00	The Anything Can Happen Recurrence	1418
535	4	/hhzxGGwhOrjNaymWkAgI11Btref.jpg	Professor Proton helps Sheldon deal with grief; Leonard gets into a competition with Penny; Bernadette and Amy prepare a "Star Wars Day" gift for the guys.	\N	7.97	2014-05-02 00:00:00	The Proton Transmogrification	1418
536	4	/zhcQnZ5ZsDlVBHePHnJwYjs3xWt.jpg	A bad day compels Penny to re-evaluate her choices -- including Leonard; Bernadette and Howard must care for Mrs. Wolowitz; Sheldon gives Raj advice on relationships.	\N	8.09	2014-05-09 00:00:00	The Gorilla Dissolution	1418
538	3	/71669CxKEeyqtItFH6mFHKxPh3y.jpg	Sheldon is rescued from his soul-searching cross-country train trip (older but no wiser) and that means The Big Bang Theory gang's all here to spread another gear's cheer as TV's most attended laugh seminar. Enrol in the comic curriculum to observe Leonard's minor surgery, which signals a major catastrophe for Sheldon, Howard's obsession over his mum's relationship with friend-turned-freeloader Stuart and the unexpected results of Penny's technique as a pharmaceutical sales rep. Discover ways to re-create proms not attended or holiday celebrations not especially beloved and play a new game based on Raj's dating life. Savour online fan Fiction by Amy, watch Bernadette take indelicate command of some delicate family matters and, who knows, you might spot a cool special guest or two.	\N	7.99	2014-09-23 00:00:00	Season 8	1418
539	4	/eiknk78qNy9yYtmwjBZYLURhR19.jpg	Leonard and Amy make an unexpected trip to Arizona to fetch Sheldon; Penny interviews for a job at Bernadette's company; Stuart's relationship with Mrs. Wolowitz disturbs Howard.	\N	7.67	2014-09-23 00:00:00	The Locomotion Interruption	1418
540	4	/gzDRKQVGyX4FTKv51CWFqVc34TG.jpg	When Sheldon must teach a class, Howard decides to take it; Amy takes advantage of the tension between Penny and Bernadette.	\N	7.90	2014-09-23 00:00:00	The Junior Professor Solution	1418
541	4	/eHuRYLXpxZATwCJrqubQelPEjHs.jpg	Wolowitz feels nervous when he is asked to throw the first pitch at a Los Angeles Angels game; Penny and Leonard want to prove Sheldon wrong after he says he and Amy are the better couple.	\N	7.67	2014-09-30 00:00:00	The First Pitch Insufficiency	1418
542	4	/fxyeZcehNMkV7o8qtuv2tMzI2pn.jpg	Raj's honesty comes back to haunt him when his new girlfriend is unfriendly to Penny; the guys think about becoming part owners in Stuart's store.	\N	7.71	2014-10-07 00:00:00	The Hook-Up Reverberation	1418
543	4	/psYPKikZStDFT6OqFLp3TKvqQbI.jpg	During their weekend in Las Vegas, Bernadette and Amy accuse Penny of being a buzz kill; the guys try to invent the next big thing.	\N	7.81	2014-10-14 00:00:00	The Focus Attenuation	1418
544	4	/nh5DYUzf3waIHJAO7Ircv7MnMHj.jpg	Sheldon and Raj test whether they could survive a dark-matter research expedition in a salt mine by simulating the conditions in a steam tunnel deep underground. Leonard and Penny seek advice from Howard and Bernadette after they fight about money.	\N	7.72	2014-10-21 00:00:00	The Expedition Approximation	1418
545	4	/ogSq5iQZ6u4WawkcwFjB5ICvKTG.jpg	The guys try to help Penny out of an awkward work dilemma, when a smitten doctor shows up at her door after her flirtatious sales techniques work a little too well. Meanwhile, Amy and Bernadette argue over whether or not female scientists should play up their sexuality.	\N	7.83	2014-10-31 00:00:00	The Misinterpretation Agitation	1418
546	4	/4j2EMbHRVvimywvBwZQ5q7O3wOS.jpg	When the gang recreates a high-school prom night on the roof of the guys'; apartment building, Sheldon feels pressure to participate in all the typical romantic traditions.	\N	7.96	2014-11-07 01:00:00	The Prom Equivalency	1418
547	4	/4DvPvWUgoO64waeO23l3oZQyYHd.jpg	When Leonard gets minor surgery on his nose, Sheldon is the one in need of sympathy. Meanwhile, Raj's parents' impending divorce causes Howard and Bernadette to work on their own marriage.	\N	7.81	2014-11-14 01:00:00	The Septum Deviation	1418
548	4	/24ShQB4KKIoBy0jIy9pdYt7GnPE.jpg	While Sheldon says a tearful goodbye to the final instalment of "Fun with Flags", Leonard, Howard and Raj search for something significant in a dead professor's research. And Bernadette is shocked to learn of her co-workers’ true feelings from Penny.	\N	7.60	2014-11-21 01:00:00	The Champagne Reflection	1418
549	4	/44FXhFZgXuY2BHTqUTr9K2gdzZG.jpg	Leonard and Howard turn to Raj for help in dealing with a work emergency when they nearly come to blows after blaming each other for a potential disaster at the university. Amy throws an authentic Victorian Christmas party, while Sheldon seeks revenge on her for making him celebrate the holidays.	\N	7.72	2014-12-12 01:00:00	The Clean Room Infiltration	1418
550	4	/cDT0ktiJ5h7N2LoH4PD7YERuMyp.jpg	Wolowitz tries to distract Raj, who is anxiously awaiting data from a space probe he helped launch. Meanwhile, Sheldon and Leonard go dress shopping with Penny and Amy.	\N	7.50	2014-12-19 01:00:00	The Space Probe Disintegration	1418
551	4	/nQB2Pa1TXKQjSR4coCDRmox9UoE.jpg	The gang tries to help Sheldon when he becomes stuck in a rut at work by increasing his anxiety level. Howard teases Raj with a new game called "Cinnamon or Emily?"	\N	7.56	2015-01-30 01:00:00	The Anxiety Optimization	1418
552	4	/kRpSOJmWA0ek6Qyua4pn3zYEvfr.jpg	Leonard and Sheldon publish a paper which is widely accepted except for comments from an internet troll. Meanwhile, the girls reminisce about embarassing incidents from their past.	\N	7.80	2015-02-06 01:00:00	The Troll Manifestation	1418
553	4	/uDHVXadIwiUvYENRrzFyCJoSjFw.jpg	Wolowitz receives some shocking news as everyone prepares for the reopening of Stuart’s comic book store. Penny teaches Sheldon how to “let it go,” but can’t follow her own advice after she learns something infuriating about Amy. Also, Leonard and Raj think they spot Nathan Fillion at a restaurant.	\N	7.67	2015-02-20 01:00:00	The Comic Book Store Regeneration	1418
554	4	/bqzCAK0r6xsn9Tx0amTb3jtWEGQ.jpg	As a joke, Sheldon and Penny try an experiment designed to make participants fall in love.  Also, Leonard, Amy, Raj and Emily spend the evening trying to escape a room with a “zombie.” And, after returning from Mrs. Wolowitz’ funeral, Bernadette and Howard run into trouble at the airport.	\N	7.67	2015-02-27 01:00:00	The Intimacy Acceleration	1418
555	4	/6Jh4pXXaagHSb9Ap40rQBDefRFl.jpg	Trouble arises when Amy learns Sheldon has applied for a one-way mission to colonize Mars. Also, a trip to the pet store ends in a fight for Sheldon and Amy, Leonard surprises Penny with a very “adult” purchase, and Raj is caught snooping in Emily’s apartment.	\N	7.65	2015-03-06 01:00:00	The Colonization Application	1418
556	4	/qRNOiaPWO6m5gR5STlrGjSSS0Cv.jpg	Friction ensues when a magazine fails to mention Leonard in an article about the paper he co-wrote with Sheldon. Also, a blackout at Mrs. Wolowitz’s home leads to a final family dinner in her honor.	\N	7.49	2015-03-13 00:00:00	The Leftover Thermalization	1418
557	4	/6O7dxVBPOFKp2cdfFIl5Lf0mys2.jpg	When Leonard and Sheldon are invited to speak at UC Berkeley, they take a detour to try to meet an idol. Also, when Bernadette and Howard battle over the fate of his Doctor Who TARDIS, Raj and Amy offer to settle the dispute with a game of ping pong.	\N	7.61	2015-04-03 00:00:00	The Skywalker Incursion	1418
558	4	/1VqKU1CVOkLDRoYnognbKuXTlBn.jpg	When Sheldon and Amy build a blanket fort, they come to major crossroads in their relationship. Also, Wolowitz meets the half-brother he never knew he had, and when Penny is invited to appear on Wil Wheaton’s podcast, she and Leonard have a huge, on-air argument.	\N	7.62	2015-04-10 00:00:00	The Fortification Implementation	1418
560	4	/k8J6TonhAR5NHNybzMTkF8pflWM.jpg	Wolowitz questions his engineering abilities when he and Sheldon can’t get a toy drone to fly. Meanwhile, a cancelled flight nearly prevents Leonard from giving the commencement address at his former high school, and Raj pits his parents against each other when his father cuts him off financially.	\N	7.58	2015-04-24 00:00:00	The Graduation Transmission	1418
561	4	/q7lYLffxGu5OVlhS84YyCYY5t1z.jpg	Personalities collide when Sheldon and Leonard’s mothers finally meet. Meanwhile, Howard finally decides to “man up” and do his fair share of the housework – but not without a little help from his friends.	\N	7.56	2015-05-01 00:00:00	The Maternal Combustion	1418
562	4	/qhmAkhpkWpZnOPzTFbNfuvgot09.jpg	Sheldon pushes Leonard and Penny to choose a date for their wedding and deals with dramatic changes in his own relationship with Amy.	\N	7.78	2015-05-08 00:00:00	The Commitment Determination	1418
563	3	/eKDvR1vYLCE08K1h0KUfHNliD8T.jpg	Our two genius roommates, Leonard and Sheldon, and their friends are back once again (smarter, but no wiser). Last season, Sheldon went soul-searching (on a train, of course) and was prepared to make some substantial revisions on his Relationship Agreement with Amy, when everything changed. Leonard, meanwhile, was off to Vegas with Penny to finally tie the knot in the season finale. Howard finds himself alone with Bernadette after the sudden passing of his mother; while Raj is not only talking to women – he’s getting exclusive with Emily. Together, they will all learn that life is far more complicated outside of the lab as love and friendship never produce predictable results!	\N	7.96	2015-09-22 00:00:00	Season 9	1418
564	4	/za6BAvh7hGFooEcANqJC5srF1FA.jpg	Sheldon is confronted by a mystery of the universe he cannot unravel: when a woman wants time apart to think, exactly how much time does that mean, and is there any way to hurry the process along? In Las Vegas, Penny and Leonard march closer to marching down the aisle, but has Penny gotten over Leonard’s infidelity? And if so, will he do anything to un-get her over it?\n	\N	7.48	2015-09-22 00:00:00	The Matrimonial Momentum	1418
565	4	/n0uM0N3qz0kp51ad2lPajyt9Rhm.jpg	Leonard confronts the woman he kissed on the North Sea in an attempt to set Penny’s mind at ease. Also, Sheldon films a special episode of “Fun with Flags” after his breakup with Amy, and Bernadette feels guilty about withholding a secret from Penny.	\N	7.58	2015-09-29 00:00:00	The Separation Oscillation	1418
566	4	/4VC9UZmTRALQXCIBpFe9VO2vM3R.jpg	The guys’ science skills are put to the test when they get a flat tire during Leonard’s bachelor party weekend in Mexico. Also, the girls force Penny to finally tell her family that she eloped with Leonard.	\N	7.65	2015-10-06 00:00:00	The Bachelor Party Corrosion	1418
567	4	/sJil2kjShboUXna44vBml70Xbj7.jpg	Leonard and Penny finally move in together leaving Sheldon very upset with this big change in his life and wishing he could go back to a time when he had no emotions in 2003 before he met Leonard. Raj, Howard and Stuart attempt to form a band.	\N	7.56	2015-10-13 00:00:00	The 2003 Approximation	1418
568	4	/eDOUvJIpKqK276AfbdnzrBC2XJR.jpg	The guys take a fencing lesson from Barry Kripke and Sheldon finds himself in an awkward position when Kripke expresses interest in Amy. Also, when Stuart struggles to get female customers at the Comic Book Store, Penny, Amy and Bernadette come by to help him out.	\N	7.55	2015-10-20 00:00:00	The Perspiration Implementation	1418
569	4	/tqZH3yGasgJiW9WEuq7AG019Jot.jpg	In the midst of a nation-wide helium shortage, Sheldon and Leonard take desperate measures to get the supplies they need. Also, Penny and Bernadette download a dating app on Amy's phone to try and find her a new man.	\N	7.44	2015-10-27 00:00:00	The Helium Insufficiency	1418
570	4	/l6uYe2FTdtvH73JdMv7Qnym8PRJ.jpg	Adam Nimoy, friend of Wil Wheaton and son of Leonard Nimoy, interviews Sheldon for a Star Trek documentary. Sheldon gets off topic and ends up revealing an engagement ring and his plan to propose to Amy. Bernadette wants to start renovating the house and the issue of starting a family with Howard is brought up.	\N	7.62	2015-11-06 01:00:00	The Spock Resonance	1418
571	4	/f2kduB25FNPL7V8uuTIdGbT9vaO.jpg	Amy has a formal date which Leonard, Penny and Bernadette secretly spy on. Sheldon has Howard and Raj help him find a new girlfriend since they found Amy for him.	\N	7.70	2015-11-13 01:00:00	The Mystery Date Observation	1418
572	4	/uYdqPZZGn6bsJMl9ib8NmPlin9z.jpg	It’s Thanksgiving. Sheldon and Amy go on a lunch date to the aquarium as friends. Howard, Bernadette, Raj and Emily help out at a soup kitchen. Leonard and Penny make their first Thanksgiving dinner as a married couple. 	\N	7.68	2015-11-20 01:00:00	The Platonic Permutation	1418
573	4	/mYyJOfa85Ix95HdFz1D72OHTeY9.jpg	Sheldon has a revelation when he realizes why a song was stuck in his head. Also, Amy invites Dave over for dinner despite their previously awkward date, and Wolowitz and Koothrappali become obsessed with a fan of their band, "Footprints on the Moon".	\N	7.90	2015-12-11 01:00:00	The Earworm Reverberation	1418
574	4	/wXuaZNFFTzSnCyIzHJX8cpDPv7A.jpg	As the guys prepare to go to the premiere of the new Star Wars movie, Sheldon plans a special event for Amy's birthday.	\N	8.20	2015-12-18 01:00:00	The Opening Night Excitation	1418
575	4	/4DnDFLbjiljaQuK2u7gv8ZP56lB.jpg	Leonard visits a psychiatrist so Penny can make a sales call. Stuart moves out of the Wolowitz house. Sheldon works with Raj looking for extra-solar planets.	\N	7.56	2016-01-08 01:00:00	The Sales Call Sublimation	1418
576	4	/ge9x2mL8kKRlAuaULVy5cNS1t98.jpg	The gang decides to head to Vegas for the week on a party bus. Sheldon learns about the importance of empathy and saying sorry.	\N	7.61	2016-01-15 01:00:00	The Empathy Optimization	1418
577	4	/e4KZVnhg3UyZSAZIB6d3m38ToJz.jpg	Sheldon is thrilled when his Meemaw comes to visit, but his excitement quickly fades when she butts heads with Amy.  Also, Raj meets a new girl at the comic book store who makes him question his relationship with Emily.	\N	7.62	2016-02-05 01:00:00	The Meemaw Materialization	1418
578	4	/w93H4gv8LIb9nlITuGpR9ndDUk8.jpg	Sheldon and Amy host a live Valentine's Day episode of Fun with Flags, Leonard and Penny grapple with getting older, Howard and Bernadette find a surprise in their hot tub and Raj is torn between Emily and the cute girl he met at the Comic Bookstore.	\N	7.61	2016-02-12 01:00:00	The Valentino Submergence	1418
579	4	/cybOS60LRof6PljKrYXAyCh8637.jpg	When the gang finds out about Bernadette's pregnancy, they celebrate by singing karaoke.  Also, Bernadette is concerned when Wolowitz freaks out over her pregnancy announcement, and Wolowitz is convinced he must make more money to provide for a baby.	\N	7.70	2016-02-19 01:00:00	The Positive Negative Reaction	1418
580	4	/aCCxCIQjlFmlS97jCIzd2uameQl.jpg	After more than nine years together, the gang finally celebrates Sheldon’s birthday, surprising him with a special guest (Adam West).	\N	7.58	2016-02-26 01:00:00	The Celebration Experimentation	1418
581	4	/jUOKCbKMhg2jEarqXnuy0rdcLXO.jpg	Sheldon works up a contract to split their portion of their guidance system invention royalties, but Bernadette does not like how it's done. Raj must again decide between Emily and Claire when they both contact him.	\N	7.67	2016-03-11 01:00:00	The Application Deterioration	1418
582	4	/kl5SoKzqxhwK9irTvarRHOmTvi6.jpg	Amy is shocked at a revelation from Sheldon after she buys him a new laptop.  Koothrappali sells out Leonard and Wolowitz after they lie to their wives in order to attend an early screening of a movie.	\N	7.64	2016-04-01 00:00:00	The Solder Excursion Diversion	1418
583	4	/eL2nmkRYtWcvXUVfx4SQGJeDULl.jpg	Secrets are revealed when Amy and Sheldon join Penny and Leonard on a weekend cabin trip. Raj is more excited about Howard's and Bernadette's impending parenthood than they are.	\N	7.64	2016-04-08 00:00:00	The Big Bear Precipitation	1418
584	4	/mQZwoLE1qYkyiwIbfIAs5uqtJi4.jpg	Everyone must choose sides when a small argument between Leonard and Sheldon erupts into a heated fight during a group get-together.	\N	7.61	2016-04-22 00:00:00	The Viewing Party Combustion	1418
585	4	/lUwn0Uxldc3B76B26Yd8aIPj4uM.jpg	Sheldon and Bernadette spend a night together while the rest of the gang goes to a wine tasting party, but things get uncomfortable for Raj when Zack also attends and takes an interest in Claire.\n	\N	7.66	2016-04-29 00:00:00	The Fermentation Bifurcation	1418
586	4	/wFmeHdgLoNVyRYv4omvrSoe9yLO.jpg	Sheldon hires Stuart to spend the day with Amy when he’d rather go to a movie screening. Also, Leonard’s mother, Beverly, comes to town and Penny struggles to make a connection with her.	\N	7.62	2016-05-06 00:00:00	The Line Substitution Solution	1418
587	4	/18nmVxxyu7jlKxqwn088P2hkQ4J.jpg	Leonard and Penny get remarried in front of their friends (who show up), Leonard's parents, Beverly and Alfred (Judd Hirsch) and Sheldon's mother, Mary, who finds something in common with Alfred. Howard gets an unknown email from the Air Force about his invention.	\N	7.79	2016-05-13 00:00:00	The Convergence Convergence	1418
588	3	/dz2Mq1bpjBFiTOJbomCEP59kqJV.jpg	\N	\N	8.08	2016-09-20 00:00:00	Season 10	1418
589	4	/9oifJEgVKWsiPsRVnvpdACiJB05.jpg	After Leonard's father, Alfred and Sheldon's mother, Mary share an evening together, everyone deals with an awkward morning the following day. Also, Penny's family arrives for the ceremony, including her anxiety-ridden mother, Susan, and her drug dealing brother, Randall.	\N	7.69	2016-09-20 00:00:00	The Conjugal Conjecture	1418
590	4	/chN747cMwRMuxm1JL1YKsKOsu9O.jpg	The Air Force shows interest in the guidance system and Penny lets it slip at work that Bernadette is expecting.	\N	7.65	2016-09-27 00:00:00	The Military Miniaturization	1418
591	4	/sPTHeziA20nRw3NqA9j8FchsVdS.jpg	Sheldon can't keep up with the late nights Howard and Leonard are putting in, Raj spends the day with a pregnant Bernadette and Penny and Amy attend a faculty party.	\N	7.64	2016-10-04 00:00:00	The Dependence Transcendence	1418
592	4	/dUEDKR7xxWcmGeKtfqI7e9fyQAw.jpg	When Amy's apartment floods, she proposes a "cohabitation experiment" with Sheldon. Also, Howard and Bernadette are upset when Koothrappali learns the gender of the baby before they do.	\N	7.85	2016-10-11 00:00:00	The Cohabitation Experimentation	1418
593	4	/sXpnjSU96ED3yYVrm9BqYhgf4eG.jpg	Leonard and Penny must separate a quarreling Sheldon and Amy when their cohabitation does not go as planned, and Sheldon threatens to break off their relationship when Amy refuses to adhere to the bathroom schedule. Also, Howard and Bernadette find unexpected guests at their house when they decide to stay home from a planned vacation.	\N	7.63	2016-10-18 00:00:00	The Hot Tub Contamination	1418
594	4	/yEDSHVRQiHtIWQ3fcLutr2CSgVC.jpg	Penny is surprised to learn she has fans of her performance in "Serial Ape-ist" when she attends Van Nuys Comic Con with Leonard. Also, Amy hosts a Sheldon-style brunch at Penny’s apartment, and Wolowitz makes an impulsive purchase when he starts stressing out about the baby on the way.	\N	7.68	2016-10-28 00:00:00	The Fetal Kick Catalyst	1418
595	4	/kj7XGHGwP2rAr9SZQl0361rc1Q8.jpg	In order to continue living with Sheldon, Amy lies to him about repairs being made to her apartment and they host an "on location" episode of "Fun With Flags" in Penny’s apartment. Also, Leonard lets Penny decorate Sheldon’s old room after he learns that she has been secretly moving Leonard’s collectibles into storage.	\N	7.80	2016-11-04 00:00:00	The Veracity Elasticity	1418
596	4	/txfP3RGQrH975I1mVohAUOxYkjh.jpg	After a successful experiment combining their genes, Sheldon will stop at nothing to convince Amy they should procreate. Also, Koothrappali is embarrassed to tell the gang what the new woman he’s dating does for a living.	\N	7.92	2016-11-11 01:00:00	The Brain Bowl Incubation	1418
597	4	/lkrG22IN1cDzQUik3DSE0Gizkro.jpg	When Bert, a Caltech geologist, wins the MacArthur Genius fellowship, Sheldon is overcome with jealousy. Also, Wolowitz finds an old remote control Stephen Hawking action figure he invented.	\N	7.68	2016-11-18 01:00:00	The Geology Elevation	1418
598	4	/gdmbxOWVmc35uryPjQdGeIFYhbU.jpg	Sheldon and Leonard must divide up their possessions and remove Penny's things from 4B.	\N	7.60	2016-12-02 01:00:00	The Property Division Collision	1418
599	4	/3FkVpR8xDoXlJ4E07JpwkTknaWK.jpg	Amy's desire to have an intimate night with Sheldon on her birthday is interrupted by Bernadette going into labor.	\N	7.75	2016-12-16 01:00:00	The Birthday Synchronicity	1418
600	4	/e0nr2JM5ZgLXtJejueg1uTIti6H.jpg	Sheldon and Amy visit Leonard and Penny for the first time since the holidays and share details about their terrible trip to Texas.	\N	7.59	2017-01-06 01:00:00	The Holiday Summation	1418
601	4	/yik9SnRIwGbJcbLKDdN64z796rl.jpg	Leonard and Penny may need a Relationship Agreement, and Sheldon volunteers to prepare one.	\N	7.59	2017-01-20 01:00:00	The Romance Recalibration	1418
602	4	/6Dx0gT8VsA9iC9migoWFiepWMQf.jpg	Sheldon uses a machine to help him identify other people's emotions, and Raj tries to understand his difficulties with women.	\N	7.62	2017-02-03 01:00:00	The Emotion Detection Automation	1418
603	4	/xTNAUYH3FVQjdljPhsKWryYYjWW.jpg	Leonard and Wolowitz try to distract Sheldon when he slows the progress of their guidance system. Also, Penny and Amy take Bernadette out for the night, leaving Raj and Stuart to care for baby Halley.	\N	7.74	2017-02-10 01:00:00	The Locomotion Reverberation	1418
604	4	/vu8eDZ7MiefrZxX2OhFbda6noB2.jpg	Sheldon and Amy have their first fight since moving in together and Koothrappali is shocked at the realities of financial independence when he stops receiving support from his father.	\N	7.56	2017-02-17 01:00:00	The Allowance Evaporation	1418
605	4	/wv69h7bKeHblo3taVkPhHLnCxk4.jpg	The guys' annual trip to Comic Con is in doubt when Raj can't afford to go.	\N	7.75	2017-02-24 01:00:00	The Comic-Con Conundrum	1418
606	4	/4iPNBT5dpaBzRrylQPx6j7dI3nT.jpg	Raj searches for a cheaper living arrangement.	\N	7.59	2017-03-10 01:00:00	The Escape Hatch Identification	1418
607	4	/XqD2Q7kM5lrTjDRwkKK7s3OzGz.jpg	Leonard, Penny and Raj adjust to their new living arrangement and Sheldon takes an interest in Amy's work.	\N	7.51	2017-03-31 00:00:00	The Collaboration Fluctuation	1418
608	4	/rJJ7LLPDRHUQYVaeaxXSrdmWt34.jpg	Sheldon pushes himself to the limit when he collaborates on projects with Leonard and Wolowitz as well as Amy on the same day. Also, Bernadette is nearing the end of her maternity leave and must return to work.	\N	7.57	2017-04-07 00:00:00	The Recollection Dissipation	1418
609	4	/jYnc1Ypn8Cdbme8hpe13RLEB0Ud.jpg	Howard and Bernadette have a hard time leaving Halley in day care when Bernadette returns to work. Also, Bert introduces the gang to his new girlfriend, Rebecca.	\N	7.56	2017-04-14 00:00:00	The Separation Agitation	1418
610	4	/yhxksl1jAcYfrDlC0QSFglisOTf.jpg	Leonard isn’t thrilled when Penny considers taking a new job offered by her ex-boyfriend, Zack.	\N	7.53	2017-04-28 00:00:00	The Cognition Regeneration	1418
611	4	/1iG6nwkQb75R8zxsypJL5xVqpxy.jpg	Amy is offered a Fellowship at Princeton, Raj makes new living arrangements, and the gyroscope project is spinning out of control!	\N	7.59	2017-05-05 00:00:00	The Gyroscopic Collapse	1418
612	4	/7Tkb7haVVehH7vND0veU9IXSo7w.jpg	The gang is concerned when Sheldon’s former admirer, Dr. Ramona Nowitzki, resurfaces while Amy is away at Princeton. 	\N	8.21	2017-05-12 00:00:00	The Long Distance Dissonance	1418
613	3	\N	\N	\N	8.88	\N	Season 11	1418
614	4	\N	\N	\N	7.91	2017-09-26 00:00:00	\N	1418
615	2	/ovnH6mQfVembYErJXYhnh6e0R9C.jpg	Based on Neil Gaiman's eponymous novel, ex-convict Shadow Moon becomes the traveling partner of a mysterious conman named Mr. Wednesday after his release from prison. He soon discovers Mr. Wednesday is more than he seems and becomes embroiled in an epic conflict between Old Gods and New.	\N	8.21	2017-05-01 01:00:00	American Gods	46639
616	3	/67exRijfvN5RRmBCqFtk1bhJ7Uh.jpg	\N	\N	8.17	2017-05-01 01:00:00	Season 1	46639
617	4	/uvry4weK00pFLn7fxQ9M4m3Da2A.jpg	When Shadow Moon is released from prison early after the death of his wife, he meets Mr. Wednesday and is recruited as his bodyguard. Shadow discovers that this may be more than he bargained for.	\N	7.74	2017-05-01 01:00:00	The Bone Orchard	46639
618	4	/3lRIm0Ksi8X6vvmSldiiaYEOgne.jpg	As Mr. Wednesday begins recruitment for the coming battle, Shadow Moon travels with him to Chicago and agrees to a very high stakes game of checkers with the old Slavic god, Czernobog.	\N	7.75	2017-05-08 01:00:00	The Secret of Spoons	46639
619	4	/cxF4KvQbed5vnFAVsHFhLdrSzfD.jpg	Shadow questions his decision to work for Mr. Wednesday after learning of his plan to rob a bank; Shadow makes a surprising discovery when he returns to his motel room.	\N	7.75	2017-05-15 01:00:00	Head Full of Snow	46639
620	4	/btCbZe5xGMZcUkWwFmmePyVNFJD.jpg	The story of Laura's life and death is explored, including her first encounter with Shadow and how exactly she came to be sitting on the edge of his motel room bed.	\N	7.85	2017-05-22 01:00:00	Git Gone	46639
621	4	/h9eN63m309gZGXh2cN3A3LlBKA.jpg	Shadow's emotional reunion with his dead and unfaithful wife is interrupted when he and Mr. Wednesday are kidnapped by the New Gods.	\N	7.92	2017-05-29 01:00:00	Lemon Scented You	46639
622	4	/bdpghAgeRFg3gJfInc5w4vUzIyx.jpg	On the run after the New Gods' show of force, Shadow and Mr. Wednesday seek safe haven with one of Mr. Wednesday's oldest friends, Vulcan, God of the Fire and the Forge.	\N	7.80	2017-06-05 01:00:00	A Murder of Gods	46639
623	4	/RkfHpT76UsKRUmG0pmssdJdNQQ.jpg	Following her brief reunion with Shadow, Laura turns to an unlikely travel companion to find her way back to life; Mad Sweeney's long, winding, and often-tragic past is explored.	\N	7.83	2017-06-12 01:00:00	A Prayer for Mad Sweeney	46639
624	4	/cIaeavALIUoPhrkLgUSNodTXIKv.jpg	On the eve of war, Mr. Wednesday attempts to recruit the Old God Ostara, but needs Mr. Nancy's help in making a good impression and winning her over.	\N	8.17	2017-06-19 01:00:00	Come to Jesus	46639
625	2	/6AquMx9MoJZTaZIR2AokSDATFCt.jpg	Ruthless and cunning, Congressman Francis Underwood and his wife Claire stop at nothing to conquer everything. This wicked political drama penetrates the shadowy world of greed, sex and corruption in modern D.C.	\N	8.96	2013-02-01 05:00:00	House of Cards	1425
626	3	/oUfT2AbMVCYbVA3GIBbPqA6ZpUC.jpg	Betrayed by the White House, Congressman Francis Underwood embarks on a ruthless rise to power. Blackmail, seduction and ambition are his weapons.	\N	8.88	2013-02-01 05:01:00	Season 1	1425
627	4	/6sAKJySMV5VlrlBs6q9V8FjkwQd.jpg	When the newly elected President reneges on a promise, Francis and Claire decide to sever all allegiances and toss the rules out the window.	\N	8.20	2013-02-01 05:00:00	Chapter 1	1425
628	4	/1vjZa5tTaz86kKKBhiYBWnkRlQl.jpg	Francis and Doug plan to frame Secretary of State nominee, Michael Kern. Meanwhile, Zoe's popularity at the Washington Herald continues to grow.	\N	8.17	2013-02-01 05:00:00	Chapter 2	1425
629	4	/vMXqVtz5ZBR4xuWFTRBJtj0DvSl.jpg	Francis heads for his hometown to deal with a crisis. Zoe negotiates the politics of being a journalist on the rise. Claire finds herself a new business partner.	\N	8.11	2013-02-01 05:00:00	Chapter 3	1425
630	4	/1BseCNuPiQHWChHbxGDz5WaBoxG.jpg	Francis shakes down the Congressional leadership. Zoe is offered the promotion of White House Correspondent and doesn't know if she should take it or not.	\N	8.09	2013-02-01 05:00:00	Chapter 4	1425
631	4	/33pCcjWAYRcgXWKhWk0wPXp5Mfe.jpg	A feud starts between Francis and Marty Spinella. Russo goes into depression about the job losses at the shipyards.	\N	8.19	2013-02-01 05:00:00	Chapter 5	1425
632	4	/6cXGqA2XqnuAREg6z3VvErifu5I.jpg	The strike between Frank and Marty starts to get out of hand. Russo has decided to run for Governor of Pennsylvania.	\N	8.23	2013-02-01 05:00:00	Chapter 6	1425
633	4	/vj7hlPqAKTHrQxCMmp74G04VPPY.jpg	Frank helps Peter get ready for his governor race, but Peter is starting to have second thoughts. Doug tries to help a young hooker in trouble.	\N	7.99	2013-02-01 05:00:00	Chapter 7	1425
634	4	/aQjFqJtsyySgtOt5273N2GAQIaJ.jpg	Frank has a library named after him at his old military school. Peter tries to win back the support of his hometown.	\N	7.69	2013-02-01 05:00:00	Chapter 8	1425
635	4	/zgZg8gzvDa0yqvagURKSA706FvX.jpg	Frank tries to do whatever it takes to get the new bill passed in Congress. Russo goes on a bus campaign with the Vice President, but the VP is not making it an easy trip for him. Zoe's relationship with Frank gets a little bumpy.	\N	8.16	2013-02-01 05:00:00	Chapter 9	1425
636	4	/v3jUPbKmVpaH8a6Qv295qkEdhVm.jpg	Claire fuels an old flame. Peter wrestles with his demons. Francis crosses the point of no return.	\N	8.18	2013-02-01 05:00:00	Chapter 10	1425
637	4	/tVxl2dA9O8ajENIaHhwHo69fk5y.jpg	Zoe extends her time away from The Hill while Francis tracks down Russo and engages in damage control. 	\N	8.31	2013-02-01 05:00:00	Chapter 11	1425
638	4	/nV48z5uXfJH2DIGim4eRSldd02C.jpg	The President sends Frank to St. Louis to persuade Raymond Tusk into becoming the new Vice President. Zoe and Janine investigate Peter Russo's death.	\N	8.15	2013-02-01 05:00:00	Chapter 12	1425
639	4	/vsuWBB8cF18VKfCAIei1htFGKkf.jpg	Frank scrambles to keep his plan on track. Gillian is planning to sue Claire. Zoe, Janine, and Lucas investigate Rachel Posner and her relationship with Peter Russo.	\N	8.41	2013-02-01 05:00:00	Chapter 13	1425
640	3	/e5WNFWA1ZLnHxpr9xQdZMhEpvNo.jpg	In their ruthless rise to power, Francis and Claire battle threats past and present, and form new alliances while old ones succumb to betrayal.	\N	8.71	2014-02-14 05:01:00	Season 2	1425
641	4	/z91LQoFwhVcpeu3bZAQVIQ8B7kS.jpg	The Underwoods tackle two threats that could bring their plans to ruin. Francis grooms his replacement as Whip. Claire goes on the offensive.	\N	8.71	2014-02-14 05:00:00	Chapter 14	1425
642	4	/3CTVNSqSBE6wl2MTd0kCLPpfzeO.jpg	Amid turmoil in the home, Frank takes office. Foreign relations become entangled as Durant's team bungles a meeting. As foes negotiate to thwart her, Jackie maneuvers to strengthen her position. Lucas acquires new skills in order to pursue his secret investigation. 	\N	8.03	2014-02-14 05:00:00	Chapter 15	1425
643	4	/rXXh4m1daaLSC6p5iVDrljnkUKT.jpg	Tension rises between Francis and Raymond Tusk as the situation with China deteriorates. A battle in the Senate pits Francis against the Republicans.	\N	8.08	2014-02-14 05:00:00	Chapter 16	1425
644	4	/lPprjEmxdRE2nNQy1AzG8tFEAh1.jpg	A terror scare at the Capitol traps Francis with a resentful Donald Blythe. Claire gives a live interview that rocks the media.	\N	8.29	2014-02-14 05:00:00	Chapter 17	1425
645	4	/3d9v7vXp1e9EoVKB3mwZc3mXBih.jpg	Francis back-channels with a Chinese billionaire. Lucas uses extreme measures to expose the Vice President. A shadowy figure joins Team Underwood.	\N	7.99	2014-02-14 05:00:00	Chapter 18	1425
646	4	/mtgMfDZ6ljzYMIqzaojoZTzhKol.jpg	Amidst an energy crisis, Francis and Tusk end their shaky alliance. Lucas must make a difficult choice. Stamper grows closer to Rachel.	\N	7.93	2014-02-14 05:00:00	Chapter 19	1425
647	4	/ic09rdouhfHbbxb7tQNaDeRwhgY.jpg	Despite some friction, the Walkers deepen their friendship with the Underwoods. But it's all-out war between Francis and Tusk.	\N	7.98	2014-02-14 05:00:00	Chapter 20	1425
648	4	/7rvGPOhfKWOUSQRl96OGtE0SmWh.jpg	The war with Tusk intensifies. Claire influences Tricia Walker politically and domestically. Francis has a show-down with Linda Vasquez.	\N	8.09	2014-02-14 05:00:00	Chapter 21	1425
649	4	/nLfMbhVy4iucq2fUN039roQfUOd.jpg	Things get personal when Tusk blindsides the Underwoods with a scandal. Freddy and his BBQ joint get caught up in the mix.	\N	8.20	2014-02-14 05:00:00	Chapter 22	1425
650	4	/9ZSl47CVSQMmbeau7ghQdWyRk7C.jpg	With a military stand-off overseas and potential violence at home, Francis wants to finish off Tusk for good. Claire and Jackie Sharp collide.	\N	8.04	2014-02-14 05:00:00	Chapter 23	1425
651	4	/grwrv79vDn0w8UrQhcBNe9kTTK7.jpg	A Special Prosecutor interrogates Francis. Remy Danton tries to keep his options open. Stamper wrestles with his demons.	\N	8.21	2014-02-14 05:00:00	Chapter 24	1425
652	4	/4sTmsXEM7SMYqZg8qF9o8FRLlGG.jpg	Francis finds himself shut out and Claire makes a difficult sacrifice. Stamper tries to regain control.	\N	8.27	2014-02-14 05:00:00	Chapter 25	1425
653	4	/eED02PqgQFR9aePrwfm5J24bfEw.jpg	Francis faces annihilation while the nation is in an uproar. Stamper must tie up loose ends. Claire feels the cost of ruthlessness.	\N	8.81	2014-02-14 05:00:00	Chapter 26	1425
654	3	/za2XGEr1BWAuZkI0veLEwVxy30S.jpg	President Underwood fights to secure his legacy. Claire wants more than being First Lady. The biggest threat they face is contending with each other.	\N	8.00	2015-02-27 05:01:00	Season 3	1425
655	4	/uMHBlf6kYYRxGGmZhvCJQT7pNW6.jpg	A rocky start for the Underwood Presidency. Frank wants to introduce an ambitious jobs program, while Claire sets her sights on the United Nations.	\N	7.74	2015-02-27 05:00:00	Chapter 27	1425
656	4	/9wF8NpqsHl1CI8Th2RVq0MLDX6f.jpg	Claire's U.N. bid runs into trouble. Frank fights off mutiny with a bold address to the country.	\N	7.77	2015-02-27 05:00:00	Chapter 28	1425
657	4	/394ReRMqzcX2CN0NAPq6SLci9qp.jpg	The Russian president's state visit becomes a cold war of wills, and some punks heat things up.	\N	7.81	2015-02-27 05:00:00	Chapter 29	1425
658	4	/P3fbW8FKj2UrJYv3jtiYrQg63D.jpg	Claire bypasses Russia at the U.N. Frank tries to outmaneuver a potential challenger and ends up face to face with a higher power.	\N	7.65	2015-02-27 05:00:00	Chapter 30	1425
659	4	/4n2b5xWMdRqwF42dWHvx1AlhY6p.jpg	Frank declares war on Congress to jump-start his jobs program. Claire spars with the Russian Ambassador.	\N	7.67	2015-02-27 05:00:00	Chapter 31	1425
660	4	/zk7ZKFzaetHCpj1fN96PYXnJ8E1.jpg	Frank and Claire travel to Moscow to negotiate the return of an imprisoned U.S. citizen. Claire takes a stand that jeopardizes their plans.	\N	8.12	2015-02-27 05:00:00	Chapter 32	1425
661	4	/wyYtFGv8athHOkadbrD4kfr3J48.jpg	The damage is done and the Underwoods must repair it. But deep wounds don't heal fast, and sometimes not at all.	\N	7.61	2015-02-27 05:00:00	Chapter 33	1425
662	4	/wQmxJCDMDb85IRmxk9ilkvOY7XS.jpg	A hurricane endangers more than just the entire East Coast and Frank must make a difficult choice.	\N	7.70	2015-02-27 05:00:00	Chapter 34	1425
663	4	/pCNZMCI3J51O2HfJdjk81ctihSO.jpg	The Jordan Valley erupts in chaos as Frank's campaign is picking up steam. Claire gets disturbing intel and counsels him.	\N	7.69	2015-02-27 05:00:00	Chapter 35	1425
664	4	/hQWoj3JHqfAcUl3EX6WutF8Rj9f.jpg	Frank needs to deal with Petrov one on one while Claire tries to preserve the peace-keeping mission. Sacrifices must be made.	\N	7.60	2015-02-27 05:00:00	Chapter 36	1425
665	4	/n32TwwAv6Tplb3AsHz4dA0KUSAD.jpg	Things turn ugly when Frank, Jackie, and Heather square off during their first debate. Tom joins Claire on the campaign trail.	\N	7.99	2015-02-27 05:00:00	Chapter 37	1425
666	4	/uj78KJ8K9SyMYgSMdxCFhky1pqm.jpg	Heather Dunbar goes for the jugular, forcing Claire to confront her worst fears. The rift between Frank and Claire widens.	\N	7.84	2015-02-27 05:00:00	Chapter 38	1425
667	4	/s9TwFkEx8arMPwalN3wKs8Rx7N5.jpg	In the midst of the Iowa caucuses, Frank and Claire must confront hard truths about each other.	\N	8.03	2015-02-27 05:00:00	Chapter 39	1425
668	3	/1GeYr0qAYpxIGiIabzu1WqzKgtQ.jpg	They've always been a great team. But now in season four, Frank and Claire become even greater adversaries as their marriage stumbles and their ambitions are at odds. In an election year, the stakes are now higher than ever, and the biggest threat they face is contending with each other.	\N	8.67	2016-03-04 05:01:00	Season 4	1425
669	4	/cYFDcXovJN8PA8I9mWRnsGCrHND.jpg	Claire's absence causes problems for Frank on the campaign trail amid rumors of a marital rift. Claire tries to strike out on her own.	\N	7.61	2016-03-04 05:00:00	Chapter 40	1425
670	4	/kLB9Qv4iTYCewVf6F38ISmU633z.jpg	As Claire begins exploring a campaign of her own, she and Frank engage in backdoor political maneuvering. But this time they're not on the same side.	\N	7.65	2016-03-04 05:00:00	Chapter 41	1425
671	4	/xodFyCDBVa4zjzEf37poflRSk4N.jpg	Claire joins Frank as he stumps in South Carolina, but he doesn't trust her. A disastrous scandal blindsides Frank's campaign on primary day.	\N	7.92	2016-03-04 05:00:00	Chapter 42	1425
672	4	/qq8upbp6c7wCYPMXGK7J2uJouQA.jpg	Claire threatens Frank. Frank makes a politically bold move that may provoke Russia. An event at a campaign stop changes everything.	\N	8.17	2016-03-04 05:00:00	Chapter 43	1425
673	4	/fuQLG08nhwpH9doMadv4ly5Ccg5.jpg	Claire advises Donald Blythe on dealing with Petrov. Further investigations of Lucas Goodwin dredges up his accusations against Frank.	\N	7.80	2016-03-04 05:00:00	Chapter 44	1425
674	4	/zN2DH6xZdy3QBFfAlXYabyuQlzi.jpg	Claire clashes with the Secretary of State over her involvement in negotiations with Russia. Dunbar must choose between her campaign and her ethics.	\N	7.95	2016-03-04 05:00:00	Chapter 45	1425
675	4	/A8PGgUxcCUUtXYMH3RiLhWRumLX.jpg	Frank and Claire adjust to their new reality. The search for Frank's running mate begins. Frank starts a campaign to weaken Conway's strong support.	\N	7.85	2016-03-04 05:00:00	Chapter 46	1425
676	4	/A89VnVtJyD8NxdgYGwP0Nyw1zAv.jpg	Formidable as ever, both Underwoods have their eyes on the big picture as they manipulate a potential running mate and push the gun bill.	\N	7.65	2016-03-04 05:00:00	Chapter 47	1425
677	4	/al9EvPl9huoVdAnTlYj9RlNAr4E.jpg	At the convention, Frank and his team publicly push for Catherine Durant to be chosen as his running mate, but privately pursue a different agenda.	\N	7.88	2016-03-04 05:00:00	Chapter 48	1425
678	4	/pLarLmlsGWE0kgK7UWB2z3NCPl7.jpg	As Frank deals with a new threat to his candidacy, Claire has doubts about their plan. Claire faces a difficult decision concerning her mother.	\N	8.20	2016-03-04 05:00:00	Chapter 49	1425
679	4	/2yqQTueyjgqW3khdVXuV9CtEWif.jpg	Frank ups the ante on the war on terror to counter Conway's public show of strength. Tom joins Claire on the campaign trail.	\N	7.77	2016-03-04 05:00:00	Chapter 50	1425
680	4	/wcJuWSQ6kKNwHJAZgoczDXjX4lS.jpg	Frank asks Will to help deal with extremists threatening to murder hostages. Hammerschmidt digs deeper into the allegations against Frank.	\N	8.00	2016-03-04 05:00:00	Chapter 51	1425
681	4	/kKtoxmVKX0wSSKM3xnlIkx31v5z.jpg	As the hostage situation continues, Claire secretly negotiates with Yusuf al Ahmadi. Frank confronts Hammerschmidt.	\N	8.52	2016-03-04 05:00:00	Chapter 52	1425
682	3	/xaYAGAQwpsYhLdX9JKTaGI2zgCE.jpg	Season five picks up where it left off: in the midst of a tense presidential election that puts the Underwoods on the same ticket against energetic Republican upstart Will Conway. Viewers will see how their heated campaigns play out as well as which alliances dissolve in the aftermath. Perhaps the biggest question is if Frank and Claire’s relationship is among them.	\N	8.13	2017-05-30 04:00:00	Season 5	1425
683	4	/1Xn58CmmTOHnzxOUK1VvuoyYrjR.jpg	As Congress debates investigating Frank, he and Claire attempt to stoke fear of terrorism. Tom Yates continues his stay in the White House.	\N	7.84	2017-05-30 04:00:00	Chapter 53	1425
684	4	/kXDHOaaJfZGITHckOvtiXAhNogm.jpg	Frank and his team work to leverage support in key states by any means necessary. Claire learns some upsetting news about one of Frank's friends.	\N	7.74	2017-05-30 04:00:00	Chapter 54	1425
685	4	/A3SE9uT3RmdCUibnWU9LOkf9eB3.jpg	The day before the election, Conway holds a 24-hour Skype session with voters, while Frank and Claire stump in key states and try to discredit him.	\N	7.69	2017-05-30 04:00:00	Chapter 55	1425
686	4	/fpDX6Z3ZP8FWMJsjsN1i1G1Hw41.jpg	With a tight race and low voter turnout on Election Day, things look grim for Frank. But he's still got one more trick up his sleeve.	\N	7.87	2017-05-30 04:00:00	Chapter 56	1425
687	4	/pfFo1NJCKnoSugAgwqvjsRteX4t.jpg	Nine weeks after Election Day, the Underwoods work to consolidate their power. Leann tries to track down a missing Aidan Macallan.	\N	7.69	2017-05-30 04:00:00	Chapter 57	1425
688	4	/jTry9NWJOrF33vBjJTmnmMHvDNZ.jpg	In the midst of uncertainty, suspected Russian forces take over an American station in Antarctica. Meanwhile, a damaging news leak could hurt Frank.	\N	7.63	2017-05-30 04:00:00	Chapter 58	1425
689	4	/1Qf2vfDj2DVdAnexu6PMNsUji1e.jpg	When a crisis forces White House personnel to take shelter in a bunker, Commerce Department official Jane Davis negotiates through back channels.	\N	7.84	2017-05-30 04:00:00	Chapter 59	1425
690	4	/iF36sfyjNGzVWBBMZ16hmOcWe8C.jpg	While Frank attends an elite men's weekend gathering to firm up support, Claire deals with a stranded Russian ship and threats from Petrov.	\N	7.69	2017-05-30 04:00:00	Chapter 60	1425
691	4	/8MOQrYJzzq7kflbQibWCaPPm370.jpg	Petrov tries to influence affairs in the U.S. Jane discusses her agenda with Claire. With her job at stake, Leann reaches out to a reporter for help.	\N	7.68	2017-05-30 04:00:00	Chapter 61	1425
692	4	/xFY41KgBD9tgrp9uXzWbQiXqamv.jpg	The Underwoods and their team angle to undermine the revived committee investigating Frank. Hammerschmidt's investigation heats up.	\N	7.77	2017-05-30 04:00:00	Chapter 62	1425
693	4	/fFFuFSpMuAJKmYyjyWZq7X2By9G.jpg	As the team tries to control fallout from damaging testimony and leaks, everyone is under suspicion and tensions flare between Frank and Claire.	\N	7.81	2017-05-30 04:00:00	Chapter 63	1425
694	4	/8QTtCMqMY5u9CMFNrTYSBlWgrNV.jpg	Frank attempts to stop Cathy from testifying. With Hammerschmidt sniffing out the truth, the Underwoods throw someone close to them under the bus.	\N	8.17	2017-05-30 04:00:00	Chapter 64	1425
695	4	/mbQqlUn5sAggVOM4WdWEN060RaI.jpg	In the wake of a surprising announcement, everything at the White House is shaken up. A decision must be made about whether to go to war. 	\N	8.14	2017-05-30 04:00:00	Chapter 65	1425
696	2	/e890UetS6XH7kqltlZ8VU6qDaHU.jpg	An American black comedy–crime drama anthology television series created and primarily written by Noah Hawley. The show is inspired by the 1996 film of the same name written and directed by the Coen brothers, who serve as executive producers on the series. Each season follows an anthology format, being set in a different era along with a different story, cast and set of characters.	\N	8.85	2014-04-14 23:00:00	Fargo	60622
697	3	/matO9b040ibkviZV5mmDdKpQMEV.jpg	\N	\N	8.99	2014-04-16 02:00:00	Season 1	60622
698	4	/3FQOlp4DD4bSWz3qfoznUNJjqGL.jpg	A ruthless, manipulative man meets a small town insurance salesman and sets him on a path of destruction.	\N	8.30	2014-04-16 02:00:00	The Crocodile's Dilemma	60622
699	4	/heCd4SuRAQtzt7FbwMNdmiFtFvG.jpg	Molly begins to suspect that Lester is involved in the murders, but her new boss points her in a different direction. Meanwhile, Malvo investigates the blackmail plot against a man known as the 'Supermarket King'.	\N	7.92	2014-04-23 02:00:00	The Rooster Prince	60622
700	4	/269IUdtuzqCfRWOHxgkPX24Oj6h.jpg	Malvo flips the script on the blackmail operation, Molly sets a trap, and Gus debates whether he should come clean. Lester's return to work has complicated repercussions.	\N	8.04	2014-04-30 02:00:00	A Muddy Road	60622
701	4	/psDcdcOC1f8JOrJfdd1RvrByzmk.jpg	When Gus tries to right a wrong, Malvo embraces his alter ego. Lester finds himself in a surprising situation, and Molly uncovers a promising lead.	\N	8.11	2014-05-07 02:00:00	Eating the Blame	60622
702	4	/thwaGJ8kAkEWa5lrvmHPnQKMpwQ.jpg	When Lester has a close call, Molly makes an unorthodox decision. Gus weighs some neighborly advice, and Malvo gets what he wants.	\N	7.95	2014-05-14 02:00:00	The Six Ungraspables	60622
703	4	/4tBslQdkXDtGOTbFbp89WG0Pn0X.jpg	Malvo executes his master plan, while Lester attempts to craft one of his own. Gus and Molly team up in Duluth. 	\N	8.24	2014-05-21 02:00:00	Buridan's Ass	60622
704	4	/yMN76D8tdEKptKiLTDbxgmk2gYa.jpg	Malvo seeks answers, while Lester finagles a few of his own. Molly and Gus try to get past a setback in the investigation.	\N	8.11	2014-05-28 02:00:00	Who Shaves the Barber?	60622
705	4	/z0dQrylb9iFxu0ImB4ibCtIjcW7.jpg	Molly faces pressure to close the case, while Lester starts to feel like a new man.	\N	8.06	2014-06-04 02:00:00	The Heap	60622
706	4	/amMJDXnoViXKsuHzgGPQihGyWDM.jpg	Lester has an unexpected encounter, Malvo changes course, and a new investigation leads Molly down a familiar path.	\N	8.34	2014-06-11 02:00:00	A Fox, a Rabbit, and a Cabbage	60622
707	4	/kMAfFXXi5GpmXo4V7pJ8SXleU2o.jpg	Molly takes the lead, while Gus pursues a hunch. Lester manipulates a situation, and Malvo finds a new target.	\N	8.66	2014-06-18 02:00:00	Morton's Fork	60622
708	3	/xeKfy7m8rPl08mQ6ZfbkgOy6Hdj.jpg	\N	\N	8.71	2015-10-13 02:00:00	Season 2	60622
709	4	/f5GAKBnvFOYs1kpPm12GX67dlmN.jpg	In 1979, an unexpected turn of events at a diner disrupts the lives of the citizens in a small Minnesota town. 	\N	7.81	2015-10-13 02:00:00	Waiting for Dutch	60622
710	4	/lr6INd2kO3lT4UHi9Rpx0QRJy7B.jpg	The Gerhardts get a surprising offer, and two unlikely murderers do their best to clean up their mess.	\N	7.81	2015-10-20 02:00:00	Before the Law	60622
711	4	/AbDD6X7bPY6ssO0L2WtwnzgLob3.jpg	The Gerhardts' search for Rye intensifies. Lou takes a trip to Fargo. Peggy overhears a new theory about the Waffle Hut shooter.	\N	7.83	2015-10-27 02:00:00	The Myth of Sisyphus	60622
712	4	/if7NEHuvF8pukFTu1jvBXlfFFp.jpg	Floyd responds to Kansas City’s proposal, Hanzee takes a road trip, and Lou has a realization.	\N	7.82	2015-11-03 03:00:00	Fear and Trembling	60622
713	4	/f6friNdCny0Ny1baFkr9057n2NX.jpg	Floyd takes action, and Charlie tries to prove himself. Peggy and Ed disagree about what to do next, while Lou finds himself sidelined during Ronald Reagan’s campaign tour.	\N	8.05	2015-11-10 03:00:00	The Gift of the Magi	60622
714	4	/f39zcWNYeRzs4akIHoDX3tVsrCY.jpg	Lou and Hank try to prevent an altercation, Peggy and Ed defend their choices and the Gerhardt clan attempts to get back one of their own.	\N	8.15	2015-11-17 03:00:00	Rhinoceros	60622
715	4	/heY4gHbp5KzIqj3V0wAL52nTdSO.jpg	Lou and Hank investigate in Fargo, The King of Breakfast visits Betsy and Molly, Floyd is summoned away and Bear questions a family member’s loyalty.	\N	8.07	2015-11-24 03:00:00	Did You Do This? No, You Did It!	60622
716	4	/wuZqErsa5pS5oSP1guS3nlqqbfl.jpg	Hanzee searches for Peggy and Ed. Dodd ends up in unfamiliar territory.	\N	8.35	2015-12-01 03:00:00	Loplop	60622
717	4	/qoWv82WUK0f6eDLqQgujChscKsi.jpg	Peggy and Ed agree to follow through with their plan at the Motor Motel, Lou faces jurisdictional politics and Hanzee reports back to the Gerhardts.	\N	8.40	2015-12-08 03:00:00	The Castle	60622
718	4	/h6sSCMixDZh4lBLxR9zZCmgE1JH.jpg	Peggy and Ed make a run for it.	\N	7.94	2015-12-15 03:00:00	Palindrome	60622
719	3	/dYHoNzcpQXzU2qBMZYbyOnrcuvi.jpg	\N	\N	8.01	2017-04-20 02:00:00	Season 3	60622
720	4	/phouc6q1IZTxUlClr7CNnxaF9Xw.jpg	A petty sibling rivalry between two brothers escalates and brings chaos to a small Minnesotan community.	\N	7.93	2017-04-20 02:00:00	The Law of Vacant Places	60622
721	4	/1NqbChQ7sSXQvo0WKHS7bHKwv2o.jpg	Gloria deals with the aftermath of a crime, Vargas makes a move, and Ray and Nikki move on to Plan B.	\N	7.82	2017-04-27 02:00:00	The Principle of Restricted Choice	60622
722	4	/q38okovZVSEsabPddeH2dFplpJE.jpg	Gloria revisits her stepfather's past to try and find some answers.	\N	7.67	2017-05-04 02:00:00	The Law of Non-Contradiction	60622
723	4	/2o7A2iP8m72tSkMz26BXUwH50ZF.jpg	Emmit and Sy try to figure out what they've gotten themselves into, Nikki and Ray track down some collateral, and Gloria learns more about Maurice.	\N	7.87	2017-05-11 02:00:00	The Narrow Escape Problem	60622
724	4	/1KGKMJXfIlwkVjBV3TBrPkRuuqy.jpg	Nikki and Ray’s retaliation has consequences for Emmit. Gloria and Winnie start connecting the dots.	\N	7.86	2017-05-18 02:00:00	The House of Special Purpose	60622
725	4	/5ZfK6DrqbZ4B98zBEGbY4M0C0lK.jpg	Gloria and Winnie get closer to the truth. Emmit tries to make things right. Nikki and Ray prepare for payback. Varga cleans up a mess. 	\N	7.98	2017-05-25 02:00:00	The Lord of No Mercy	60622
726	4	/yaf1iDx4AW0CDx9RnjD8E6mvw71.jpg	Gloria tries to work around the system. Nikki finds herself in a familiar place. Varga comes up with an alternative plan. Emmit goes to dinner.	\N	7.87	2017-06-01 02:00:00	The Law of Inevitability	60622
727	4	/AmXD9mAHJpX8NQK6u446FLjrOp8.jpg	Nikki struggles to survive. Emmit gets spooked. Sy joins Varga for tea.	\N	7.95	2017-06-08 02:00:00	Who Rules the Land of Denial?	60622
728	4	/1Uh1j9R2lLJf6D0DrV3N0OYD1Et.jpg	Emmit sits down with Gloria while Nikki negotiates a deal.	\N	8.02	2017-06-15 02:00:00	Aporia	60622
729	4	/24APQdCi8Q2xJzC9rutUh1kSvIl.jpg	In the season finale, Gloria follows the money, Nikki plays a game and Emmit learns a lesson about progress from Varga.	\N	8.13	2017-06-22 02:00:00	Somebody to Love	60622
730	2	/xEggmiD4WoJBQR2AiVF46yPUUgD.jpg	We meet him when the man who will become Saul Goodman is known as Jimmy McGill, a small-time lawyer searching for his destiny and, more immediately, hustling to make ends meet. Working alongside, and, often, against Jimmy, is ‘fixer’ Mike Erhmantraut. The series tracks Jimmy's transformation into the man who puts ‘criminal’ in ‘criminal lawyer’.	\N	8.55	2015-02-07 23:00:00	Better Call Saul	60059
731	3	/iwwHYFrVJF3mkHHMp77120gnYUq.jpg	\N	\N	8.41	2015-02-09 03:00:00	Season 1	60059
732	4	/kXPlwZm3RefxpSU5E3Mu4Yyvn40.jpg	Jimmy works his magic in the courtroom. Unexpected inspiration leads him to an unconventional pursuit of potential clients.	\N	7.68	2015-02-09 03:00:00	Uno	60059
733	4	/8XFhyx4xFCY2nZPThgOUF42G4fI.jpg	As his troubles escalate to a boiling point, Jimmy finds himself in dire straits. An act of carelessness puts Chuck at risk.	\N	7.89	2015-02-10 03:00:00	Mijo	60059
734	4	/xF1LKhLd0xAcddb9HrgAJ2W6gav.jpg	Jimmy pulls out all the stops to prove that his dangerous client is innocent, even though it causes some friction with Kim.	\N	7.98	2015-02-17 03:00:00	Nacho	60059
735	4	/rXNmF84z0YOpuO7Uqm38ii3Taxe.jpg	Jimmy conjures up a bold plan to solicit new clients, but has to face the consequences when the scheme strains his relationships with a rival firm.	\N	7.77	2015-02-24 03:00:00	Hero	60059
736	4	/iDW7BZtI7M1xIzL4vGG637EzbPT.jpg	When his efforts to drum up new business are interrupted by alarming news, Jimmy is pressured to make a difficult choice.	\N	7.56	2015-03-03 03:00:00	Alpine Shepherd Boy	60059
737	4	/1hapaqrgQsbvFqgCLSTjVQlvHdZ.jpg	Mike's tragic past comes back to haunt him, and he's forced to seek help from an unusual source. Meanwhile, Jimmy's moral compass is put to the test.	\N	8.11	2015-03-10 02:00:00	Five-O	60059
738	4	/hyGwjiq1Snmabd7IfHzGXOIwug9.jpg	Jimmy meets with potential new clients. When given the opportunity to do the right thing, Jimmy cashes in a favor from an unlikely ally.	\N	7.93	2015-03-17 02:00:00	Bingo	60059
739	4	/5vpI6D2n4zma4xqQBRq2Bz3tHu5.jpg	Jimmy shows Chuck that he's willing to do almost anything to win a case, even if it means getting his hands dirty.	\N	8.01	2015-03-24 02:00:00	RICO	60059
740	4	/xbdBDbGvjXs6IllQbvo6LyATj5n.jpg	Chuck urges Jimmy to accept a harsh truth. Meanwhile, a deal threatens to go off the rails when Mike's ability to complete a job is called into question.	\N	8.24	2015-03-31 02:00:00	Pimento	60059
741	4	/bZzkmEYEu88QoSzz0Mgz5YYd7n3.jpg	In the aftermath of recent events, Jimmy seizes an opportunity to reconnect with an old friend. Chuck adjusts to a new way of life.	\N	7.95	2015-04-07 02:00:00	Marco	60059
742	3	/7othdOzr1RFJaIUuyhNlbWPLiA7.jpg	\N	\N	8.50	2016-02-16 03:00:00	Season 2	60059
743	4	/zT2i7XBvXCnyCnBSEOf2EbGEsuN.jpg	Jimmy and Kim's relationship takes a new turn. Mike decides it's for the best to sever his affiliation with an unrestrained associate.	\N	7.70	2016-02-16 03:00:00	Switch	60059
744	4	/9SXC0BMRAt5OHWZFqXESkOGLRhO.jpg	To keep a potentially messy situation from unraveling, Mike brokers a deal. Jimmy works to exonerate an eccentric client.	\N	7.85	2016-02-23 03:00:00	Cobbler	60059
745	4	/o3euy8qB8AErKQcVHRrGWV1Xtiq.jpg	Jimmy's client outreach efforts thrive, and he exhibits new heights of showmanship. Mike is perplexed by daughter-in-law Stacey's troubling news.	\N	7.88	2016-03-01 03:00:00	Amarillo	60059
746	4	/f9zIpy2pPrLpFxLxKpiMF3e72x4.jpg	Jimmy's actions unexpectedly create waves for Kim. Mike cautiously weighs a lucrative proposal that might bring about dire consequences.	\N	8.00	2016-03-08 03:00:00	Gloves Off	60059
747	4	/lGyroPKe9IexyGMUotJW7LRiBsh.jpg	Jimmy becomes frustrated with his restrictive work environment. Kim pulls out all the stops to dig herself out of a seemingly bottomless hole at HHM.	\N	7.71	2016-03-15 02:00:00	Rebecca	60059
748	4	/iKvrkFvAFPW4C8JV498UqV4YcLT.jpg	Jimmy finds comfort in familiarity; Kim receives a life-changing proposal; when he is threatened, Mike finds himself pushed to the limit.	\N	7.78	2016-03-22 02:00:00	Bali Ha'i	60059
749	4	/1RumrNbk6ZAGB5U1YqQR6h96u77.jpg	When Mike's hand is forced, he can no longer hide his frustration; he and Jimmy work together to keep the peace.	\N	7.78	2016-03-29 02:00:00	Inflatable	60059
750	4	/43SruAr8U7y2qteRb9OaSTesQzy.jpg	Mike aims to settle the score with an enemy; an unexpected opportunity presents itself to Jimmy.	\N	7.78	2016-04-05 02:00:00	Fifi	60059
751	4	/tuYPo6zuzyVHezXcq3KukGZi5uJ.jpg	Mike takes a methodical approach to his mission; someone questions Chuck's capabilities; Jimmy faces a personal dilemma.	\N	8.24	2016-04-12 02:00:00	Nailed	60059
752	4	/zit4sAsSYOnpk5MOcceRiQf0VTj.jpg	Jimmy must make a hard choice; Mike takes control of matters; Hamlin delivers shocking news.	\N	8.17	2016-04-19 02:00:00	Klick	60059
753	3	/tVxi5KuJJAmAuDdSyZUPiURDPcV.jpg	\N	\N	8.61	2017-04-11 02:00:00	Season 3	60059
754	4	/gABmDo0yc5A9Rqpx7ebzvxMTTRg.jpg	Jimmy and Chuck's relationship deteriorates. Kim feels the pressure of running her own firm. Mike investigates the note left on his car.	\N	7.75	2017-04-11 02:00:00	Mabel	60059
755	4	/buKhfwuOyXv5ZbZSlkWz0pR6Il5.jpg	Jimmy and Kim hire an assistant; Mike seeks out a mysterious acquaintance; Chuck uses the law to gain an advantage over Jimmy.	\N	7.95	2017-04-18 02:00:00	Witness	60059
756	4	/jlAfOz1zVFrL6wYeCjT875AfOV6.jpg	Jimmy decides to represent a new client to Kim's dismay; Mike meets a formidable ally who gives a most tempting offer.	\N	7.88	2017-04-25 02:00:00	Sunk Costs	60059
757	4	/pFjMOyhgP8HCwkRG34ZD8C0VTDz.jpg	Jimmy asks a favor of Mike; new complications disrupt Salamancas' business; Chuck and Jimmy struggle with a compromise.	\N	8.05	2017-05-02 02:00:00	Sabrosito	60059
758	4	/fBJZXkXcHZ6Oytyn9AW8yljk45K.jpg	Kim and Jimmy face off with an adversary; Jimmy looks to Chuck's past to secure his future; Jimmy loses an ally and gains another.	\N	8.30	2017-05-09 02:00:00	Chicanery	60059
759	4	/lAEikpCAspgsGAaNpnbyxXHO6nj.jpg	Jimmy has a new endeavor; Chuck pushes himself to the limit; Nacho finds himself in a power struggle.	\N	7.97	2017-05-16 02:00:00	Off Brand	60059
760	4	/jqVsNTUU6uhgjIpxzTgOa8U1teK.jpg	Jimmy tries to settle debts; Nacho reunites with an acquaintance; Mike helps Stacey with a project and makes a connection.	\N	7.88	2017-05-23 02:00:00	Expenses	60059
761	4	/fksW2qNAxoe2jP9kL4y1RU3Xj7a.jpg	Jimmy is pushed to desperate measures; Nacho picks up a skill; Mike explores an alliance; Kim stands up to Hamlin.	\N	7.95	2017-06-06 02:00:00	Slip	60059
762	4	/1I5fgW7h62PsDmMGpThHJ0tSdg3.jpg	Jimmy visits a friend and takes up an old pastime; Chuck and Hamlin argue over the future of the firm; Kim faces challenges.	\N	8.01	2017-06-13 02:00:00	Fall	60059
763	4	/atvS6hAaSZhROAGjYSHjVsVUT58.jpg	Kim takes time off; Jimmy tries to make amends; Nacho gambles with his future; Hamlin pushes Chuck to make a decision.	\N	8.21	2017-06-20 02:00:00	Lantern	60059
764	3	\N	\N	\N	0.00	\N	Season 4	60059
765	4	\N	\N	\N	10.00	\N	\N	60059
\.


--
-- Data for Name: media_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media_genre (medias_id_media, genres_id_genre) FROM stdin;
1	1
1	2
1	15
1	32
2	1
2	2
2	32
2	40
3	32
3	21
3	40
4	1
4	8
4	40
5	1
5	7
5	8
6	1
6	32
6	2
7	1
7	40
7	8
8	2
8	15
8	21
8	40
8	1
9	1
9	2
9	15
10	2
10	18
10	1
10	11
11	11
11	15
11	32
11	1
11	2
86	11
86	8
129	7
129	11
200	11
200	21
233	11
233	1
233	2
233	32
233	15
371	7
615	11
615	1
615	2
615	26
615	15
615	32
625	11
696	11
696	8
696	40
730	7
730	11
730	8
\.


--
-- Name: media_genre_medias_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_genre_medias_id_media_seq', 1, false);


--
-- Name: media_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_id_media_seq', 765, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie (certification, homepage, imdb, language, runtime, slug, tagline, trailer, id_media) FROM stdin;
PG-13	http://www.warnerbros.com/wonder-woman	tt0451279	en	141	wonder-woman-2017	Power. Grace. Wisdom. Wonder.	http://youtube.com/watch?v=5lGoQhFb4NM	1
PG-13	http://www.transformersmovie.com/	tt3371366	en	149	transformers-the-last-knight-2017	There are mysteries to the universe we were never meant to solve	http://youtube.com/watch?v=6Vtf0MszgP8	2
R	https://alienuniverse.com/alien-covenant	tt2316204	en	122	alien-covenant-2017	The path to paradise begins in hell.	http://youtube.com/watch?v=svnAD0TApb8	3
PG-13	http://www.fastandfurious.com/	tt4630562	en	136	the-fate-of-the-furious-2017	Family no more	http://youtube.com/watch?v=JwMKRevYa_M	4
R	https://www.warnerbros.com/chips	tt0493405	en	100	chips-2017	Chip Happens	http://youtube.com/watch?v=nmgeiznfdLI	5
PG-13	http://www.powerrangers.movie/	tt3717490	en	124	power-rangers-2017	Together we are more	http://youtube.com/watch?v=5kIe6UZHSXw	6
R	http://www.johnwick.movie/	tt4425200	en	122	john-wick-chapter-2-2017	Never stab the devil in the back	http://youtube.com/watch?v=LZrX9mffH8Y	7
PG-13	https://ismovies.net/movie/the-mummy	tt2345759	en	110	the-mummy-2017	Welcome To A New World of Gods And Monsters	\N	8
PG-13	http://kongskullislandmovie.com/	tt3731562	en	118	kong-skull-island-2017	All hail the king	http://youtube.com/watch?v=44LdLqgOpjo	9
PG-13	http://www.lostcityofzfilm.co.uk/home	tt1212428	en	140	the-lost-city-of-z-2017	In 1925, Percy Fawcett ventured into the Amazon in search of a myth. What he discovered became legendary.	http://youtube.com/watch?v=Yixiv6A0BbU	10
\.


--
-- Name: movie_id_media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_id_media_seq', 1, false);


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY season (aired_episodes, episodes, number, season_id, show_id) FROM stdin;
10	10	1	12	11
10	10	2	23	11
10	10	3	34	11
10	10	4	45	11
10	10	5	56	11
10	10	6	67	11
0	7	7	78	11
8	8	1	87	86
10	10	2	96	86
10	10	3	107	86
1	10	4	118	86
13	13	1	130	129
13	13	2	144	129
13	13	3	158	129
13	13	4	172	129
13	13	5	186	129
6	6	1	201	200
15	15	2	208	200
5	8	3	224	200
13	13	1	234	233
13	13	2	248	233
13	13	3	262	233
13	13	4	276	233
13	13	5	290	233
13	13	6	304	233
13	13	7	318	233
12	12	8	332	233
12	12	9	345	233
12	12	10	358	233
17	17	1	372	371
23	23	2	390	371
23	23	3	414	371
24	24	4	438	371
24	24	5	463	371
24	24	6	488	371
24	24	7	513	371
24	24	8	538	371
24	24	9	563	371
24	24	10	588	371
0	1	11	613	371
8	8	1	616	615
13	13	1	626	625
13	13	2	640	625
13	13	3	654	625
13	13	4	668	625
13	13	5	682	625
10	10	1	697	696
10	10	2	708	696
10	10	3	719	696
10	10	1	731	730
10	10	2	742	730
10	10	3	753	730
0	1	4	764	730
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
Sunday	60	21:00	America/New_York	TV-MA	us	http://www.hbo.com/game-of-thrones	tt0944947	en	HBO	55	7	game-of-thrones	returning series	\N	11
Sunday	29	21:00	America/New_York	TV-MA	us	https://www.starz.com/series/power	tt3281796	en	Starz!	60	4	power	returning series	http://youtube.com/watch?v=w7fuOkF74Zw	86
Friday	65	00:00	America/New_York	TV-MA	us	https://www.netflix.com/title/70242311	tt2372162	en	Netflix	60	5	orange-is-the-new-black	returning series	http://youtube.com/watch?v=njy0dFFlpAc	129
Sunday	26	21:00	America/New_York	TV-MA	us	http://www.amc.com/shows/fear-the-walking-dead	tt3743822	en	AMC	45	3	fear-the-walking-dead	returning series	http://youtube.com/watch?v=yzXglr5bc3w	200
Saturday	127	18:45	Europe/London	TV-PG	gb	http://www.bbc.co.uk/programmes/b006q2x0	tt0436992	en	BBC One	45	10	doctor-who-2005	returning series	\N	233
Monday	231	20:00	America/New_York	TV-14	us	http://www.cbs.com/shows/big_bang_theory/	tt0898266	en	CBS	22	11	the-big-bang-theory	returning series	http://youtube.com/watch?v=3vLXy_w_VKg	371
Sunday	8	21:00	America/New_York	TV-MA	us	https://www.starz.com/series/americangods	tt1898069	en	Starz!	60	1	american-gods	returning series	http://youtube.com/watch?v=oyoXURn9oK0	615
Friday	65	00:00	America/New_York	TV-MA	us	http://www.netflix.com/title/70178217	tt1856010	en	Netflix	50	5	house-of-cards	returning series	http://youtube.com/watch?v=ULwUzF1q5w4	625
Wednesday	30	22:00	America/New_York	TV-MA	us	http://www.fxnetworks.com/fargo	tt2802850	en	FX (US)	55	3	fargo	returning series	\N	696
Monday	30	22:00	America/New_York	TV-14	us	http://www.amctv.com/shows/better-call-saul	tt3032476	en	AMC	45	4	better-call-saul	returning series	http://youtube.com/watch?v=l1xIGfVFb-U	730
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

