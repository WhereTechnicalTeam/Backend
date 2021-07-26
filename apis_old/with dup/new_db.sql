--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

-- Started on 2021-07-02 10:08:48 GMT

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
-- TOC entry 221 (class 1259 OID 126999)
-- Name: apis_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apis_events (
    id integer NOT NULL,
    title character varying(100),
    schedule character varying(100),
    description character varying(500),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.apis_events OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 126876)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 126874)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 126886)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 126884)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 126868)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 126866)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 213 (class 1259 OID 126894)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150),
    first_name character varying(150),
    last_name character varying(150),
    email character varying(254) NOT NULL,
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 126904)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 126902)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 212 (class 1259 OID 126892)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 217 (class 1259 OID 126912)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 126910)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 220 (class 1259 OID 126994)
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    district_name character varying(100),
    region_id integer
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 126972)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 126970)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 126858)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 126856)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 126847)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 126845)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 227 (class 1259 OID 127095)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 127033)
-- Name: job_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_info (
    id integer NOT NULL,
    current_institution character varying(100),
    job_title character varying(100),
    employment_status character varying(100),
    is_current character varying(5) NOT NULL,
    longitude double precision,
    latitude double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    district_id_id integer,
    level_of_health_system_id integer,
    region_id_id integer,
    user_profile_id integer
);


ALTER TABLE public.job_info OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 127007)
-- Name: level_of_health_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_of_health_system (
    id integer NOT NULL,
    level character varying(100)
);


ALTER TABLE public.level_of_health_system OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 127025)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(500),
    content character varying(1000),
    picture_array character varying(200)[],
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id_id integer,
    user_profile_id integer
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 127012)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region_name character varying(100)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 127017)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    title character varying(10),
    surname character varying(50),
    firstname character varying(50),
    sex character varying(10),
    date_of_birth date,
    phone1 character varying(13),
    phone2 character varying(13),
    is_trained_frontline character varying(5),
    cohort_number_frontline integer,
    yr_completed_frontline date,
    institution_enrolled_at_frontline character varying(100),
    job_title_at_enroll_frontline character varying(100),
    is_trained_intermediate character varying(5),
    cohort_number_intermediate integer,
    yr_completed_intermediate date,
    institution__enrolled_at_intermediate character varying(100),
    job_title_at_enroll_intermediate character varying(100),
    is_trained_advanced character varying(5),
    cohort_number_advanced integer,
    yr_completed_advanced date,
    institution_enrolled_at_advanced character varying(100),
    job_title_at_enroll_advanced character varying(100),
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_id integer
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- TOC entry 3004 (class 2604 OID 126879)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3005 (class 2604 OID 126889)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3003 (class 2604 OID 126871)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3006 (class 2604 OID 126897)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3007 (class 2604 OID 126907)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3008 (class 2604 OID 126915)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3009 (class 2604 OID 126975)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 126861)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 126850)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3242 (class 0 OID 126999)
-- Dependencies: 221
-- Data for Name: apis_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apis_events (id, title, schedule, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 126876)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3232 (class 0 OID 126886)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 126868)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add district	7	add_district
26	Can change district	7	change_district
27	Can delete district	7	delete_district
28	Can view district	7	view_district
29	Can add events	8	add_events
30	Can change events	8	change_events
31	Can delete events	8	delete_events
32	Can view events	8	view_events
33	Can add level of health system	9	add_levelofhealthsystem
34	Can change level of health system	9	change_levelofhealthsystem
35	Can delete level of health system	9	delete_levelofhealthsystem
36	Can view level of health system	9	view_levelofhealthsystem
37	Can add region	10	add_region
38	Can change region	10	change_region
39	Can delete region	10	delete_region
40	Can view region	10	view_region
41	Can add user profile	11	add_userprofile
42	Can change user profile	11	change_userprofile
43	Can delete user profile	11	delete_userprofile
44	Can view user profile	11	view_userprofile
45	Can add new	12	add_new
46	Can change new	12	change_new
47	Can delete new	12	delete_new
48	Can view new	12	view_new
49	Can add job info	13	add_jobinfo
50	Can change job info	13	change_jobinfo
51	Can delete job info	13	delete_jobinfo
52	Can view job info	13	view_jobinfo
\.


--
-- TOC entry 3234 (class 0 OID 126894)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	1234	\N	\N	\N	\N	\N	aabalekuusimon78@gmail.com	\N	\N	2020-08-31 17:10:29+00
2	1234	\N	\N	\N	\N	\N	cirjorge@gmail.com	\N	\N	2020-08-31 17:24:51+00
3	1234	\N	\N	\N	\N	\N	nyefianutu@gmail.com	\N	\N	2020-08-31 20:36:34+00
4	1234	\N	\N	\N	\N	\N	nooralwanga@gmail.com	\N	\N	2020-08-31 22:03:20+00
5	1234	\N	\N	\N	\N	\N	abdulaa22@gmail.com	\N	\N	2020-09-01 09:47:17+00
6	1234	\N	\N	\N	\N	\N	naadada63@gmail.com	\N	\N	2020-09-01 16:46:51+00
7	1234	\N	\N	\N	\N	\N	ayichuruchristy@yahoo.com	\N	\N	2020-09-01 16:49:18+00
8	1234	\N	\N	\N	\N	\N	yelfaayire.vitus@yahoo.com	\N	\N	2020-09-02 12:38:01+00
9	1234	\N	\N	\N	\N	\N	yelfaayire.vitus@yahoo.com	\N	\N	2020-09-02 12:55:42+00
10	1234	\N	\N	\N	\N	\N	tugpieldominic@gmail.com	\N	\N	2020-09-02 12:58:33+00
11	1234	\N	\N	\N	\N	\N	sendtobboat@yahoo.com	\N	\N	2020-09-02 15:17:45+00
12	1234	\N	\N	\N	\N	\N	sendtobboat@yahoo.com	\N	\N	2020-09-02 15:18:04+00
13	1234	\N	\N	\N	\N	\N	hanta1984@live.com	\N	\N	2020-09-02 15:50:48+00
14	1234	\N	\N	\N	\N	\N	doris.millu84@gmail.com	\N	\N	2020-09-02 17:07:17+00
15	1234	\N	\N	\N	\N	\N	Baleripat@gmail.com 	\N	\N	2020-09-03 09:37:35+00
16	1234	\N	\N	\N	\N	\N	julison10000@gmail.com	\N	\N	2020-09-03 17:40:10+00
17	1234	\N	\N	\N	\N	\N	braimahvivian@mail.com	\N	\N	2020-09-03 21:16:52+00
18	1234	\N	\N	\N	\N	\N	mshamir@yahoo.com	\N	\N	2020-09-03 21:39:33+00
19	1234	\N	\N	\N	\N	\N	babota1966@gmail.com	\N	\N	2020-09-04 07:36:55+00
20	1234	\N	\N	\N	\N	\N	ecurlz19@gmail.com 	\N	\N	2020-09-04 07:58:49+00
21	1234	\N	\N	\N	\N	\N	anchabafgh@yahoo.com	\N	\N	2020-09-04 12:07:39+00
22	1234	\N	\N	\N	\N	\N	asherifa24@yahoo.com	\N	\N	2020-09-04 16:30:22+00
23	1234	\N	\N	\N	\N	\N	gcheyuo@gmail.com 	\N	\N	2020-09-06 02:03:28+00
24	1234	\N	\N	\N	\N	\N	hemmanuels@gmail.com	\N	\N	2020-09-23 20:39:01+00
25	1234	\N	\N	\N	\N	\N	horzul14@gmail.com	\N	\N	2020-09-23 20:59:48+00
26	1234	\N	\N	\N	\N	\N	ernestkasiedu@yahoo.com	\N	\N	2020-09-23 21:20:52+00
27	1234	\N	\N	\N	\N	\N	nooralwanga@gmail.com 	\N	\N	2020-09-23 21:29:36+00
28	1234	\N	\N	\N	\N	\N	gyesi2g3@gmail.com	\N	\N	2020-09-23 21:35:34+00
29	1234	\N	\N	\N	\N	\N	sefajnr@gmail.com	\N	\N	2020-09-23 21:35:50+00
30	1234	\N	\N	\N	\N	\N	mwintumahb@yahoo.com 	\N	\N	2020-09-23 21:36:46+00
31	1234	\N	\N	\N	\N	\N	Jwkfiagbe@gmail.com	\N	\N	2020-09-23 21:44:10+00
32	1234	\N	\N	\N	\N	\N	oxygenbay@yahoo.com	\N	\N	2020-09-23 22:24:15+00
33	1234	\N	\N	\N	\N	\N	jamessoyelleh@gmail.com	\N	\N	2020-09-23 22:24:29+00
34	1234	\N	\N	\N	\N	\N	paulseidu36@gmail.com	\N	\N	2020-09-24 03:31:17+00
35	1234	\N	\N	\N	\N	\N	nyefianutu@gmail.com	\N	\N	2020-09-24 07:55:58+00
36	1234	\N	\N	\N	\N	\N	eberko85@gmail.com	\N	\N	2020-09-24 09:29:33+00
37	1234	\N	\N	\N	\N	\N	isaacyeboah276@gmail.com	\N	\N	2020-09-24 09:39:31+00
38	1234	\N	\N	\N	\N	\N	jaharthur2003@yahoo.com	\N	\N	2020-09-24 09:47:18+00
39	1234	\N	\N	\N	\N	\N	yfenteng@yahoo.com	\N	\N	2020-09-24 10:40:03+00
40	1234	\N	\N	\N	\N	\N	kunkus33@yahoo.com,  kunkus33@gmail.com	\N	\N	2020-09-24 11:36:15+00
41	1234	\N	\N	\N	\N	\N	otuamic@yahoo.co.uk	\N	\N	2020-09-24 11:43:28+00
42	1234	\N	\N	\N	\N	\N	noahagbofu97@gmail.com	\N	\N	2020-09-24 12:06:01+00
43	1234	\N	\N	\N	\N	\N	abrahamnum@yahoo.com	\N	\N	2020-09-24 12:42:02+00
44	1234	\N	\N	\N	\N	\N	obgracious@gamail.com	\N	\N	2020-09-24 12:50:17+00
45	1234	\N	\N	\N	\N	\N	kwam.emma@yahoo.com	\N	\N	2020-09-24 13:15:23+00
46	1234	\N	\N	\N	\N	\N	siehdaniel@gmail.com	\N	\N	2020-09-24 13:16:39+00
47	1234	\N	\N	\N	\N	\N	jummaitarl30@gmail.com	\N	\N	2020-09-24 13:23:44+00
48	1234	\N	\N	\N	\N	\N	siehdaniel@gmail.com	\N	\N	2020-09-24 13:26:41+00
49	1234	\N	\N	\N	\N	\N	myakilo@gmail.com 	\N	\N	2020-09-24 14:14:46+00
50	1234	\N	\N	\N	\N	\N	jamesowusu80@yahoo.com	\N	\N	2020-09-24 14:18:06+00
51	1234	\N	\N	\N	\N	\N	joenn143@gmail.com	\N	\N	2020-09-24 14:36:52+00
52	1234	\N	\N	\N	\N	\N	short23gh@yahoo.com	\N	\N	2020-09-24 14:51:34+00
53	1234	\N	\N	\N	\N	\N	chrisnoba@gmail.com	\N	\N	2020-09-24 16:19:18+00
54	1234	\N	\N	\N	\N	\N	nyawdan@gmail.com	\N	\N	2020-09-24 17:08:15+00
55	1234	\N	\N	\N	\N	\N	rrmahama@gmail.com	\N	\N	2020-09-25 01:26:24+00
56	1234	\N	\N	\N	\N	\N	kuffourbrago@yahoo.com	\N	\N	2020-09-25 06:53:54+00
57	1234	\N	\N	\N	\N	\N	ndegoson@yahoo.co.uk	\N	\N	2020-09-25 10:35:49+00
58	1234	\N	\N	\N	\N	\N	ages440@gmail.com	\N	\N	2020-09-25 11:00:58+00
59	1234	\N	\N	\N	\N	\N	mananzumuroh73@gmail.com	\N	\N	2020-09-25 13:42:49+00
60	1234	\N	\N	\N	\N	\N	mananzumuroh73@gmail.com	\N	\N	2020-09-25 13:43:13+00
61	1234	\N	\N	\N	\N	\N	mananzumuroh73@gmail.com	\N	\N	2020-09-25 13:43:24+00
62	1234	\N	\N	\N	\N	\N	wewuguapiupeter@yahoo.com	\N	\N	2020-09-25 15:02:45+00
63	1234	\N	\N	\N	\N	\N	wewuguapiupeter@yahoo.com	\N	\N	2020-09-25 15:09:45+00
64	1234	\N	\N	\N	\N	\N	sir.orison@gmail.com	\N	\N	2020-09-25 15:33:03+00
65	1234	\N	\N	\N	\N	\N	eldzandu@gmail.com	\N	\N	2020-09-25 17:10:01+00
66	1234	\N	\N	\N	\N	\N	belpah@yahoo.col	\N	\N	2020-09-25 18:50:15+00
67	1234	\N	\N	\N	\N	\N	danielagudey@gmail.com	\N	\N	2020-09-26 03:50:53+00
68	1234	\N	\N	\N	\N	\N	aabalekuusimon78@gmail.com	\N	\N	2020-09-26 11:33:44+00
69	1234	\N	\N	\N	\N	\N	Kenpriama02@gmail.com 	\N	\N	2020-09-26 14:39:15+00
70	1234	\N	\N	\N	\N	\N	indomieilliasu@gmail.com	\N	\N	2020-09-27 16:53:49+00
71	1234	\N	\N	\N	\N	\N	gandorg007@gmail.com	\N	\N	2020-09-28 06:25:54+00
72	1234	\N	\N	\N	\N	\N	macjonaskambe@yahoo.com	\N	\N	2020-09-28 11:04:25+00
73	1234	\N	\N	\N	\N	\N	borenasa13@yahoo.com, borenasa1@gmail.com	\N	\N	2020-09-28 11:49:27+00
74	1234	\N	\N	\N	\N	\N	tankorukj@gmail.com	\N	\N	2020-09-28 12:44:20+00
75	1234	\N	\N	\N	\N	\N	hasana4iddi@gmail.com	\N	\N	2020-09-28 12:53:45+00
76	1234	\N	\N	\N	\N	\N	sasasam338@gmail.com	\N	\N	2020-09-28 14:52:35+00
77	1234	\N	\N	\N	\N	\N	tugpieldominic@gmail.com	\N	\N	2020-09-28 15:56:54+00
78	1234	\N	\N	\N	\N	\N	akansiaksylvester@ymail.com	\N	\N	2020-09-28 16:24:52+00
79	1234	\N	\N	\N	\N	\N	dangboorpaul@gmail.com	\N	\N	2020-09-28 17:32:27+00
80	1234	\N	\N	\N	\N	\N	joykaf2013@gmail.com	\N	\N	2020-09-29 09:48:30+00
81	1234	\N	\N	\N	\N	\N	dongdemza@gmail.com 	\N	\N	2020-09-29 11:25:43+00
82	1234	\N	\N	\N	\N	\N	gkyeduodu@uhas.edu.gh	\N	\N	2020-09-29 11:54:48+00
83	1234	\N	\N	\N	\N	\N	gregkofi@gmail.com	\N	\N	2020-09-29 15:22:20+00
84	1234	\N	\N	\N	\N	\N	fortressfay@yahoo.com	\N	\N	2020-09-29 17:16:17+00
85	1234	\N	\N	\N	\N	\N	doggypapa@yahoo.com	\N	\N	2020-09-29 17:59:02+00
86	1234	\N	\N	\N	\N	\N	sakyigordon1984@gmail.com	\N	\N	2020-09-29 21:01:22+00
87	1234	\N	\N	\N	\N	\N	fmeeduah@gmail.com 	\N	\N	2020-09-30 10:30:57+00
88	1234	\N	\N	\N	\N	\N	kepahjames@yahoo.com	\N	\N	2020-09-30 13:38:48+00
89	1234	\N	\N	\N	\N	\N	P .O . Box  TD 380, Takoradi 	\N	\N	2020-09-30 15:08:48+00
90	1234	\N	\N	\N	\N	\N	philipdebrah82@gmail.com	\N	\N	2020-09-30 15:10:14+00
91	1234	\N	\N	\N	\N	\N	drkhumaloo@yahoo.com 	\N	\N	2020-09-30 18:54:04+00
92	1234	\N	\N	\N	\N	\N	phoebebala55@yahoo.com	\N	\N	2020-09-30 18:55:28+00
93	1234	\N	\N	\N	\N	\N	nyjunior23@gmail.com	\N	\N	2020-09-30 20:23:42+00
94	1234	\N	\N	\N	\N	\N	irene.amedzro@gmail.com	\N	\N	2020-09-30 21:14:33+00
95	1234	\N	\N	\N	\N	\N	soseiwusu21@gmail.com	\N	\N	2020-09-30 22:02:47+00
96	1234	\N	\N	\N	\N	\N	albywhaj@gmail.com 	\N	\N	2020-09-30 22:55:33+00
97	1234	\N	\N	\N	\N	\N	gideonoteng@yahoo.com	\N	\N	2020-10-01 07:59:26+00
98	1234	\N	\N	\N	\N	\N	robertnterful@yahoo.com	\N	\N	2020-10-01 08:33:55+00
99	1234	\N	\N	\N	\N	\N	naomiasher82@gmail.com	\N	\N	2020-10-01 08:50:50+00
100	1234	\N	\N	\N	\N	\N	deeblaq25@gmail.com	\N	\N	2020-10-01 09:32:40+00
101	1234	\N	\N	\N	\N	\N	serwaaayiwa75@gmail.com	\N	\N	2020-10-01 10:35:06+00
102	1234	\N	\N	\N	\N	\N	dsaneaidoo@gmail.com	\N	\N	2020-10-01 13:43:54+00
103	1234	\N	\N	\N	\N	\N	danisoman1979@gmail.com	\N	\N	2020-10-05 11:25:54+00
104	1234	\N	\N	\N	\N	\N	wklenyuie@yahoo.com	\N	\N	2020-10-05 13:11:20+00
105	1234	\N	\N	\N	\N	\N	nelsonamoro@yahoo.com	\N	\N	2020-10-05 14:43:52+00
106	1234	\N	\N	\N	\N	\N	dzikpeemelia@gmail.com	\N	\N	2020-10-06 10:26:56+00
107	1234	\N	\N	\N	\N	\N	jonas1192009@hotmail.com	\N	\N	2020-10-09 08:42:02+00
108	1234	\N	\N	\N	\N	\N	fsnuvey@gmail.com	\N	\N	2020-10-09 14:35:59+00
109	1234	\N	\N	\N	\N	\N	mybalb327@gmail.com	\N	\N	2020-10-09 20:36:38+00
110	1234	\N	\N	\N	\N	\N	babota1966@gmail.com	\N	\N	2020-10-12 08:34:54+00
111	1234	\N	\N	\N	\N	\N	sefajnr@gmail.com	\N	\N	2020-10-13 07:08:47+00
112	1234	\N	\N	\N	\N	\N	gafaru.adam@gmail.com	\N	\N	2020-10-16 13:54:45+00
113	1234	\N	\N	\N	\N	\N	Sarpongjohnson326@gmail.com	\N	\N	2020-11-04 13:27:51+00
114	1234	\N	\N	\N	\N	\N	Public health laboratory Box 99 Tamale NR	\N	\N	2020-11-04 13:31:26+00
115	1234	\N	\N	\N	\N	\N	jwkfiagbe@gmail.com	\N	\N	2020-11-04 13:39:43+00
116	1234	\N	\N	\N	\N	\N	etergu@gmail.com	\N	\N	2020-11-04 14:24:10+00
117	1234	\N	\N	\N	\N	\N	issahkanton@gmail.com 	\N	\N	2020-11-04 15:20:25+00
118	1234	\N	\N	\N	\N	\N	issahkanton@gmail.com 	\N	\N	2020-11-04 15:20:40+00
119	1234	\N	\N	\N	\N	\N	issahkanton@gmail.com 	\N	\N	2020-11-04 15:21:12+00
120	1234	\N	\N	\N	\N	\N	apinyelaa@gmail.com	\N	\N	2020-11-04 15:21:17+00
121	1234	\N	\N	\N	\N	\N	asigreyaw@gmail.com	\N	\N	2020-11-04 15:33:52+00
122	1234	\N	\N	\N	\N	\N	podmum2011@gmail.com	\N	\N	2020-11-04 15:37:26+00
123	1234	\N	\N	\N	\N	\N	gyachen@yahoo.com	\N	\N	2020-11-04 16:19:24+00
124	1234	\N	\N	\N	\N	\N	cudjoealfred@yahoo.com	\N	\N	2020-11-04 16:59:31+00
125	1234	\N	\N	\N	\N	\N	afukaahsimon@yahoo.com 	\N	\N	2020-11-04 20:15:56+00
126	1234	\N	\N	\N	\N	\N	abuakwahdanielnanabanyin@yahoo.com	\N	\N	2020-11-04 21:07:01+00
127	1234	\N	\N	\N	\N	\N	arsulemana24@gmail.co	\N	\N	2020-11-05 08:09:02+00
128	1234	\N	\N	\N	\N	\N	arsulemana24@gmail.co	\N	\N	2020-11-05 08:09:22+00
129	1234	\N	\N	\N	\N	\N	nyuasuns@gmail.com	\N	\N	2020-11-05 09:15:39+00
130	1234	\N	\N	\N	\N	\N	peteraxt75@gmail.com	\N	\N	2020-11-05 09:15:41+00
131	1234	\N	\N	\N	\N	\N	Sapungukwasi@yahoo.com	\N	\N	2020-11-05 11:07:47+00
132	1234	\N	\N	\N	\N	\N	arisdomichael@gmail.com	\N	\N	2020-11-05 11:16:47+00
133	1234	\N	\N	\N	\N	\N	attmoattak@gmail.com 	\N	\N	2020-11-05 16:05:37+00
134	1234	\N	\N	\N	\N	\N	noahagbofu97@gmail.com 	\N	\N	2020-11-05 22:27:03+00
135	1234	\N	\N	\N	\N	\N	adamanas@yahoo.com	\N	\N	2020-11-06 10:16:45+00
136	1234	\N	\N	\N	\N	\N	mayor425d@yahoo.com	\N	\N	2020-11-11 14:38:35+00
137	1234	\N	\N	\N	\N	\N	ejoycelyn@gmail.com	\N	\N	2020-11-11 14:43:39+00
138	1234	\N	\N	\N	\N	\N	oseigideon24@gmail.com 	\N	\N	2020-11-11 16:00:15+00
139	1234	\N	\N	\N	\N	\N	ageobeta38@yahoo.com	\N	\N	2020-11-26 13:18:26+00
140	1234	\N	\N	\N	\N	\N	abdulhamidabubakari@yahoo.com 	\N	\N	2020-12-24 14:42:54+00
141	1234	\N	\N	\N	\N	\N	anyimclement@gmail.com	\N	\N	2021-04-14 11:00:44+00
\.


--
-- TOC entry 3236 (class 0 OID 126904)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3238 (class 0 OID 126912)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3241 (class 0 OID 126994)
-- Dependencies: 220
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (id, district_name, region_id) FROM stdin;
43	ASUNAFO NORTH	1
44	ASUNAFO SOUTH	1
46	ASUTIFI NORTH	1
47	ASUTIFI SOUTH	1
209	TANO NORTH	1
210	TANO SOUTH	1
5	ADANSI ASOKWA	2
270	ADANSI NORTH	2
6	ADANSI SOUTH	2
9	AFIGYA KWABRE NORTH	2
263	AFIGYA KWABRE SOUTH	2
13	AHAFO ANO NORTH	2
269	AHAFO ANO SOUTH EAST	2
14	AHAFO ANO SOUTH WEST	2
257	AKROFUOM	2
32	AMANSIE CENTRAL	2
33	AMANSIE SOUTH	2
268	AMANSIE WEST	2
35	ASANTE AKIM CENTRAL MUNICIPA	2
36	ASANTE AKIM NORTH	2
37	ASANTE AKIM SOUTH	2
40	ASOKORE MAMPONG	2
120	ASOKWA	2
50	ATWIMA KWANWOMA	2
51	ATWIMA MPONUA	2
255	ATWIMA NWABIAGYA NORTH	2
52	ATWIMA NWABIAGYA SOUTH	2
59	BEKWAI MUNICIPAL	2
72	BOSOME FREHO	2
73	BOSOMTWI	2
258	EJISU	2
90	EJURA SEKYE DUMASI	2
89	JUABEN	2
121	KMA-BANTAMA	2
123	KMA-MANHYIA NORTH	2
241	KMA-MANHYIA SOUTH	2
124	KMA-NHYIAESO	2
127	KMA-SUBIN	2
129	KOMENDA EDINA EGUAFO ABIREM	2
137	KWABRE EAST	2
122	KWADASO	2
150	MAMPONG MUNICIPAL	2
256	OBUASI EAST	2
171	OBUASI MUNICIPAL	2
172	OFFINSO	2
173	OFFINSO NORTH	2
125	OFORIKROM	2
128	OLD TAFO	2
185	SEKYERE AFRAM PLAINS	2
186	SEKYERE CENTRAL	2
187	SEKYERE EAST	2
184	SEKYERE KUMAWU	2
188	SEKYERE SOUTH	2
126	SUAME	2
56	BANDA	3
248	BEREKUM EAST	3
60	BEREKUM WEST	3
83	DORMAA EAST	3
84	DORMAA MUNICIPAL	3
85	DORMAA WEST	3
105	JAMAN NORTH	3
106	JAMAN SOUTH	3
203	SUNYANI MUNICIPAL	3
204	SUNYANI WEST	3
205	TAIN	3
231	WENCHI	3
48	ATEBUBU AMANTIN	4
118	KINTAMPO NORTH	4
119	KINTAMPO SOUTH	4
162	NKORANSA SOUTH	4
163	NKORANZA NORTH	4
242	PRU EAST	4
175	PRU WEST	4
189	SENE EAST	4
190	SENE WEST	4
213	TECHIMAN MUNICIPAL	4
214	TECHIMAN NORTH	4
1	ABURA / ASEBU / KWAMANKESE	5
10	AGONA EAST	5
11	AGONA WEST	5
16	AJUMAKO-ENYAN-ESIAM	5
39	ASIKUMAN / ODOBEN / BRAKWA	5
264	ASSIN FOSU	5
41	ASSIN NORTH	5
42	ASSIN SOUTH	5
53	AWUTU SENYA	5
54	AWUTU SENYA EAST	5
77	CCM - CAPE COAST NORTH	5
243	CCM - CAPE COAST SOUTH	5
88	EFFUTU	5
91	EKUMFI	5
261	GOMOA CENTRAL	5
99	GOMOA EAST	5
100	GOMOA WEST	5
152	MFANTSIMAN	5
218	TWIFO ATI MORKWA	5
219	TWIFO HEMAN LOWER DENKYIRA	5
220	UPPER DENKYIRA EAST	5
221	UPPER DENKYIRA WEST	5
266	ABUAKWA NORTH	6
86	ABUAKWA SOUTH	6
67	ACHIASE	6
259	AKWAPIM NORTH	6
20	AKWAPIM SOUTH	6
21	AKYEMANSA	6
65	ASENE MANSO AKROSO	6
45	ASUOGYAMAN	6
267	ATIWA EAST	6
49	ATIWA WEST	6
55	AYENSUANO	6
260	BIRIM CENTRAL	6
66	BIRIM NORTH	6
265	BIRIM SOUTH	6
82	DENKYEMBUOR	6
93	FANTEAKWA NORTH	6
262	FANTEAKWA SOUTH	6
138	KWAEBIBIREM	6
139	KWAHU AFRAM PLAINS NORTH	6
140	KWAHU AFRAM PLAINS SOUTH	6
141	KWAHU EAST	6
142	KWAHU SOUTH	6
143	KWAHU WEST	6
149	LOWER MANYA	6
160	NEW JUABEN NORTH	6
254	NEW JUABEN SOUTH	6
169	NSAWAM ADOAGYIRI	6
19	OKERE	6
202	SUHUM KRABOA COALTAR	6
222	UPPER MANYA KROBO	6
223	UPPER WEST AKIM	6
232	WEST AKIM	6
236	YILO KROBO	6
22	ABLEKUMA CENTRAL	7
23	ABLEKUMA NORTH	7
24	ABLEKUMA WEST	7
2	ADA EAST	7
3	ADA WEST	7
7	ADENTA MUNICIPAL	7
253	AMA-ABLEKUMA SOUTH	7
25	AMA-ASHIEDU KETEKE	7
30	AMA-OKAIKOI SOUTH	7
38	ASHAIMAN	7
26	AYAWASO CENTRAL	7
27	AYAWASO EAST	7
271	AYAWASO NORTH	7
28	AYAWASO WEST	7
94	GA CENTRAL	7
95	GA EAST	7
251	GA NORTH	7
96	GA SOUTH	7
97	GA WEST	7
31	KORLE KLOTTEY	7
132	KPONE KATAMANSO	7
252	KROWOR	7
144	LA DADE KOTOPON	7
145	LA NKWANANANG MADINA	7
148	LEKZOKUKU	7
161	NINGO PRAMPRAM	7
29	OKAIKOI NORTH	7
191	SHAI OSUDOKU	7
216	TEMA WEST	7
244	TMA - TEMA CENTRAL	7
215	TMA - TEMA EAST	7
250	WEIJA GBAWE	7
246	BUNKPURUGU NYANKPANDURI	8
80	CHEREPONI	8
87	EAST MAMPRUSI	8
151	MAMPRUGU MOAGDURI	8
234	WEST MAMPRUSI	8
76	YUNYOO-NASUAN	8
101	GUSHIEGU	9
112	KARAGA	9
130	KPANDAI	9
136	KUMBUMGU	9
153	MION	9
247	NANTON	9
158	NANUMBA NORTH	9
159	NANUMBA SOUTH	9
177	SABOBA	9
178	SANERIGU	9
179	SAVELUGU	9
212	TATALE	9
207	TM-TAMALE CENTRAL	9
208	TM-TAMALE SOUTH	9
217	TOLON	9
235	YENDI	9
237	ZABZUGU	9
63	BIAKOYE	10
107	JASIKAN	10
111	KADJEBI	10
133	KRACHI EAST	10
134	KRACHI NCHUMURU	10
135	KRACHI WEST	10
164	NKWANTA NORTH	10
165	NKWANTA SOUTH	10
69	BOLE	11
78	CENTRAL GONJA	11
239	EAST GONJA	11
238	NORTH EAST GONJA	11
167	NORTH GONJA	11
180	SAWLA TUNA KALBA	11
233	WEST GONJA	11
57	BAWKU MUNICIPAL	12
58	BAWKU WEST	12
64	BINDURI	12
240	BOLGA EAST	12
70	BOLGATANGA MUNICIPAL	12
71	BONGO	12
74	BUILSA NORTH	12
75	BUILSA SOUTH	12
81	DAFFIAMA BUSSIE	13
98	GARU	12
113	KASSENA NANKANA EAST	12
114	KASSENA NANKANA WEST	12
155	NABDAM	12
176	PUSIGA	12
206	TALENSI	12
245	TEMPANE	12
108	JIRAPA	13
109	JOMORO	13
146	LAMBUSSIE-KARNI	13
147	LAWRA	13
156	NADOWLI-KALEO	13
157	NANDOM	13
193	SISSALA EAST	13
194	SISSALA WEST	13
224	WA EAST	13
225	WA MUNICIPAL	13
226	WA WEST	13
4	ADAKLU ANYIGBE	14
8	AFADZATO SOUTH	14
12	AGOTIME ZIOPE	14
17	AKATSI NORTH	14
18	AKATSI SOUTH	14
115	ANLOGA	14
79	CENTRAL TONGU	14
102	HO	14
103	HO WEST	14
104	HOHOE	14
249	KETA MUNICIPAL	14
116	KETU NORTH	14
117	KETU SOUTH	14
131	KPANDO MUNICIPAL	14
166	NORTH DAYI	14
168	NORTH TONGU	14
195	SOUTH DAYI	14
196	SOUTH TONGU	14
15	AHANTA WEST	15
92	ELLEMBELLE	15
198	KWESIMINTIM	15
154	MPOHOR	15
170	NZEMA EAST	15
174	PRESTEA/HUNI VALLEY	15
192	SHAMA	15
197	STMA-ESIKADO	15
199	STMA-SEKONDI	15
200	STMA-TAKORADI	15
211	TARKWA NSUAEM	15
227	WASSA AMENFI CENTRAL	15
228	WASSA AMENFI EAST	15
229	WASSA AMENFI WEST	15
230	WASSA EAST	15
34	AOWIN	16
61	BIA EAST	16
62	BIA WEST	16
68	BODI	16
110	JUABOSO	16
181	SEFWI AKONTOMBRA	16
182	SEFWI BIBIANI AHWIASO BEKWAI	16
183	SEFWI WIAWSO	16
201	SUAMAN	16
\.


--
-- TOC entry 3240 (class 0 OID 126972)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3226 (class 0 OID 126858)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	apis	district
8	apis	events
9	apis	levelofhealthsystem
10	apis	region
11	apis	userprofile
12	apis	new
13	apis	jobinfo
\.


--
-- TOC entry 3224 (class 0 OID 126847)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-06-30 09:30:25.594188+00
2	auth	0001_initial	2021-06-30 09:30:26.365218+00
3	admin	0001_initial	2021-06-30 09:30:27.483169+00
4	admin	0002_logentry_remove_auto_add	2021-06-30 09:30:27.644111+00
5	admin	0003_logentry_add_action_flag_choices	2021-06-30 09:30:27.654821+00
6	apis	0001_initial	2021-06-30 09:30:28.389985+00
7	contenttypes	0002_remove_content_type_name	2021-06-30 09:30:28.959619+00
8	auth	0002_alter_permission_name_max_length	2021-06-30 09:30:29.016616+00
9	auth	0003_alter_user_email_max_length	2021-06-30 09:30:29.069165+00
10	auth	0004_alter_user_username_opts	2021-06-30 09:30:29.094717+00
11	auth	0005_alter_user_last_login_null	2021-06-30 09:30:29.112968+00
12	auth	0006_require_contenttypes_0002	2021-06-30 09:30:29.127347+00
13	auth	0007_alter_validators_add_error_messages	2021-06-30 09:30:29.154137+00
14	auth	0008_alter_user_username_max_length	2021-06-30 09:30:29.2494+00
15	auth	0009_alter_user_last_name_max_length	2021-06-30 09:30:29.279602+00
16	auth	0010_alter_group_name_max_length	2021-06-30 09:30:29.305852+00
17	auth	0011_update_proxy_permissions	2021-06-30 09:30:29.328846+00
18	auth	0012_alter_user_first_name_max_length	2021-06-30 09:30:29.348416+00
19	sessions	0001_initial	2021-06-30 09:30:29.504889+00
\.


--
-- TOC entry 3248 (class 0 OID 127095)
-- Dependencies: 227
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3247 (class 0 OID 127033)
-- Dependencies: 226
-- Data for Name: job_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_info (id, current_institution, job_title, employment_status, is_current, longitude, latitude, created_at, updated_at, district_id_id, level_of_health_system_id, region_id_id, user_profile_id) FROM stdin;
1	Ghana health service , Upper West regional health Directorate.	Senior Public health Officer	\N	no	301	336	2020-08-31 17:10:29+00	\N	225	2	13	1
2	Regional Health Directorate, Upper East	Health Information Officer	\N	no	-0.8587743	10.7964868	2020-08-31 17:24:51+00	\N	70	2	12	2
3	Regional Health Directorate - Ghana Health Service	Regional Disease Control Officer/EPI	\N	no	0.836797	9.404374	2020-08-31 20:36:34+00	\N	207	2	9	3
4	GFELTP-GHS	Epidemiologist	\N	no	99999	999	2020-08-31 22:03:20+00	\N	28	1	7	4
5	District Water and Sanitation Unit, Bongo	Environmental Health Officer	\N	no	10.91411	-0.806888	2020-09-01 09:47:17+00	\N	71	3	12	5
6	Bawku Presbyterian Hospital/Bawku Municipal Health Directorate (GHS)	 Disease control officer	\N	no	2333234	110600281	2020-09-01 16:46:51+00	\N	57	3	12	6
7	GHS	District Health Promotion Officer	\N	no	11822	102715	2020-09-01 16:49:18+00	\N	75	3	12	7
8	VSD	District Veterinary Officer	\N	no	949.386	240.085	2020-09-02 12:38:01+00	\N	226	3	13	8
9	VSD	District veterinary officer	\N	no	949.365	240.116	2020-09-02 12:55:42+00	\N	226	3	13	9
10	Environmental Health Department	Environmental Health Analyst	\N	no	2.4976981	10.0616282	2020-09-02 12:58:33+00	\N	225	2	13	10
11	Ghana Health Service	Health Information Officer	\N	no	-0.857249	10.794019	2020-09-02 15:17:45+00	\N	70	3	12	11
12	Ghana Health Service	Health Information Officer	\N	no	-0.857249	10.794019	2020-09-02 15:18:04+00	\N	70	3	12	12
13	GHS, District Health Directorate	Disease control officer	\N	no	1.101179	10.969123	2020-09-02 15:50:48+00	\N	114	3	12	13
14	Ghana Health Service	Disease Control Officer	\N	no	10.794218	-0.85731	2020-09-02 17:07:17+00	\N	70	3	12	14
15	Disease control unit 	Disease control officer	\N	no	0.51	10.4718	2020-09-03 09:37:35+00	\N	70	3	12	15
16	BAWKU PRESBYTERIAN HOSPITAL	PRINCIPAL TECHNICAL OFFICER (MEDICAL LABORATORY)	\N	no	0.231338	11.063115	2020-09-03 17:40:10+00	\N	57	3	12	16
17	Bawku Municipal veterinary office/Agriculture	Technical officer veterinary department	\N	no	247635	11051682	2020-09-03 21:16:52+00	\N	57	3	12	17
18	FOOD AND DRUGS AUTHORITY	REGULATORY OFFICER	\N	no	10.058957	-2.497434	2020-09-03 21:39:33+00	\N	225	2	13	18
19	District Health Directorate, Nabdam	Acting District Director of Health Services	\N	no	-0.672638	10.853942	2020-09-04 07:36:55+00	\N	155	3	12	19
20	Veterinary services directorate 	Veterinary officer	\N	no	-0.809035	10.91361	2020-09-04 07:58:49+00	\N	71	3	12	20
21	Environmental Health and Sanitation	Environmental Health Analyst	\N	no	-825009	9.411589	2020-09-04 12:07:39+00	\N	207	2	9	21
22	food and drugs Authority	regulatory officer	\N	no	-0.825216	9.411378	2020-09-04 16:30:22+00	\N	207	2	9	22
23	NA	NA	\N	no	-2.65878	10.36267	2020-09-06 02:03:28+00	\N	156	3	13	23
24	Ghana Health Service	T.O Health Information	\N	no	-3.10494	6.67188	2020-09-23 20:39:01+00	\N	62	3	16	24
25	Municipal Health Directorate, Sissala East, Tumu	Municipal Health Information Officer	\N	no	1.5911	10.5233	2020-09-23 20:59:48+00	\N	193	3	13	25
26	Ministry of Health, Quality Management Unit	Quality Manager	\N	no	-0.196287	5.552422	2020-09-23 21:20:52+00	\N	144	1	7	26
27	GFELTP 	Epidemiologist 	\N	no	0	0	2020-09-23 21:29:36+00	\N	28	1	7	27
28	Tamale Teaching Hospital	Medical Laboratory Scientist	\N	no	986	986	2020-09-23 21:35:34+00	\N	207	2	9	28
29	Ghana Health Service / Laboratory	Deputy Chief Biomedical Scientist	\N	no	-1.744295	4.9226281	2020-09-23 21:35:50+00	\N	200	2	15	29
30	Ghana health Service/ Laboratory 	Senior Biomedical scientist 	\N	no	8146	39	2020-09-23 21:36:46+00	\N	130	3	9	30
31	Nzema - East Municipal Health Directorate	Public Health Officer - DC	\N	no	-2.23869	4.86665	2020-09-23 21:44:10+00	\N	170	3	15	31
32	Disease control 	Disease control 	\N	no	-0.173236	5.602207	2020-09-23 22:24:15+00	\N	94	1	7	32
33	VETERINARY SERVICE DEPARTMENT	DISTRICT VETERINARY OFFICER	\N	no	-276054	10.99558	2020-09-23 22:24:29+00	\N	146	3	13	33
34	WA WEST DISTRICT HEALTH ADMINISTRATION(WECHIAU)	DISEASE CONTROL OFFICER 	\N	no	-2.685413	9.829025	2020-09-24 03:31:17+00	\N	226	3	13	34
35	Regional Health Directorate Ghana Health Service	Regional Disease Control Officer/EPI	\N	no	0.836414	9.404653	2020-09-24 07:55:58+00	\N	207	2	9	35
36	LAWRA MUNICIPAL HOSPITAL	MEDICAL LAB SCIENTIST	\N	no	11	1832	2020-09-24 09:29:33+00	\N	147	3	13	36
37	Health Information	Health Information Officer	\N	no	-2.4278748	6.6599528	2020-09-24 09:39:31+00	\N	44	3	1	37
38	Asunafo South District Health Directorate	District Disease Control/Surveillance Officer	\N	no	-2.4278748	6.6599528	2020-09-24 09:47:18+00	\N	44	3	1	38
39	VETERINARY SERVICES DIRECTORATE	HEAD OF EPIDEMIOLOGY	\N	no	-0.16787	5.55736	2020-09-24 10:40:03+00	\N	94	1	7	39
40	Adabraka polyclinic, laboratory	principal medical lab scientist	\N	no	-0.204962	5.561433	2020-09-24 11:36:15+00	\N	31	3	7	40
41	Sekondi Public Health Laboratory 	Head of Laboratory/ Deputy Chief Biomedical Scientist	\N	no	-1.744304	4.922872	2020-09-24 11:43:28+00	\N	199	2	15	41
42	GHANA HEALTH SERVICE/ PUBLIC HEALTH	DISEASE CONTROL OFFICER	\N	no	6.4232926	6.7363922	2020-09-24 12:06:01+00	\N	12	3	14	42
43	Ghana Health Service/Pru East District Health Directorate	Public Health Officer	\N	no	-0.672385	8.229404	2020-09-24 12:42:02+00	\N	242	2	4	43
44	Sissala West DHA	District Disease Control Officer	\N	no	10.983055	-2.222433	2020-09-24 12:50:17+00	\N	194	3	13	44
45	GHANA HEALTH SERVICE, KINTAMPO	PRINCIPAL COMMUNITY HEALTH NURSE	\N	no	8.05059	-1.73234	2020-09-24 13:15:23+00	\N	118	3	4	45
46	Ghana Health Service	Health Information Officer	\N	no	-0.672385	8.229404	2020-09-24 13:16:39+00	\N	242	3	4	46
47	Kwesimintsim Hospital/ Public Health Unit	Senior Nursing Officer	\N	no	1.5446	1.4656	2020-09-24 13:23:44+00	\N	198	3	15	47
48	Ghana Health Services/Ministry of Health	Health Information Officer	\N	no	-0.672385	8.229404	2020-09-24 13:26:41+00	\N	242	3	4	48
49	GHS /DISEASE CONTROL UNIT	PRINCIPAL PUBLIC HEA.TH OFFICER	\N	no	-15148	6.4912	2020-09-24 14:14:46+00	\N	269	3	2	49
50	KINTAMPO NORTH MUNICIPAL HEALTH DIRECTORATE	MUNICIPAL DISEASE CONTROL OFFICER	\N	no	-1.73245	8.05045	2020-09-24 14:18:06+00	\N	118	3	4	50
51	Kintampo North Municipal Health Directorate	Senior Technical Officer (Health Information)	\N	no	-1.73167	8.05651	2020-09-24 14:36:52+00	\N	118	3	4	51
52	Food and Drugs Authority	Regional Head, FDA, Upper West Region	\N	no	-2.497605	10.058996	2020-09-24 14:51:34+00	\N	225	2	13	52
53	Ghana Health Service	Public Health Officer (Disease Control)	\N	no	0.5831	6.1337	2020-09-24 16:19:18+00	\N	116	3	14	53
54	Food and Drugs Authority	Senior Regulatory Officer	\N	no	7.357111	-2.325489	2020-09-24 17:08:15+00	\N	203	2	3	54
55	Tamale Teaching Hospital	Medical Laboratory Scientist	\N	no	-0.8238666	9.3931559	2020-09-25 01:26:24+00	\N	207	2	9	55
56	Ga West Municipal Hospital	Physician Assistant/Field Epidemiologist	\N	no	5.7035	-0.29801	2020-09-25 06:53:54+00	\N	97	3	7	56
57	Food and Drugs Authority	Senior Regulatory Officer	\N	no	10.801793	-0.867364	2020-09-25 10:35:49+00	\N	70	2	12	57
58	Ghana Health Service 	Public Health Officer (Disease Control 	\N	no	5.633168	-2.257168	2020-09-25 11:00:58+00	\N	227	3	15	58
59	Ghana Health Service	Technical officer (Health Information Officer)	\N	no	-2.67838	9.82418	2020-09-25 13:42:49+00	\N	226	3	13	59
60	Ghana Health Service	Technical officer (Health Information Officer)	\N	no	-2.67838	9.82418	2020-09-25 13:43:13+00	\N	226	3	13	60
61	Ghana Health Service	Technical officer (Health Information Officer)	\N	no	-2.67838	9.82418	2020-09-25 13:43:24+00	\N	226	3	13	61
62	Veterinary Services Department	Chief Animal Health Officer	\N	no	9.92309	0.43251	2020-09-25 15:02:45+00	\N	112	3	9	62
63	Veterinary Services Department	Chief Animal Health Officer	\N	no	9.92309	0.43251	2020-09-25 15:09:45+00	\N	112	3	9	63
64	Ghana Health Service- District Health Directorate, Nanumba South	District Health Information Officer	\N	no	0.002943	8.656914	2020-09-25 15:33:03+00	\N	159	3	9	64
65	TETTEH QUARSHIE MEMORIAL HOSPITAL  LABORATORY DEPT	QUALITY & SAFETY MANAGER 	\N	no	0.759	5.5518	2020-09-25 17:10:01+00	\N	259	3	6	65
66	Western Regional Public Health Division 	Field Epidemiologist	\N	no	14513	4533	2020-09-25 18:50:15+00	\N	\N	2	15	66
67	Regional Public Health Division	Regional Malaria Focal Person	\N	no	-1.75373	4.8843	2020-09-26 03:50:53+00	\N	200	2	15	67
68	Ghana health service/ public health Department	Senior Public health Officer	\N	no	-2.499716	10.058445	2020-09-26 11:33:44+00	\N	225	2	13	68
69	Pru East Health Directorate 	Surveillance Officer	\N	no	-0.672385	8.229404	2020-09-26 14:39:15+00	\N	242	3	4	69
70	Veterinary Services Department	Animal Health Officer	\N	no	-0.649757	8.23901	2020-09-27 16:53:49+00	\N	242	3	4	70
71	MHD, Nanumba North	MDCO	\N	no	0.05514	8.85791	2020-09-28 06:25:54+00	\N	158	3	9	71
72	Ghana Health Service, Prestea Huni Valley Municipal Health Directorate	Senoir Public Health Officer	\N	no	5.569793	-2.019799	2020-09-28 11:04:25+00	\N	174	3	15	72
73	Ghana Health Service, Kintampo Municipal Health Directorate	Technical Officer (Health Information)	\N	no	8.05059	-1.73234	2020-09-28 11:49:27+00	\N	118	3	4	73
74	GHS/ District  Health Diretorate	Ag. PHN	\N	no	-2.4278748	6.6599528	2020-09-28 12:44:20+00	\N	44	3	1	74
75	Regional Health Directorate/Disease Control and EPI unit 	Health Information Officer	\N	no	0.836303	9.404639	2020-09-28 12:53:45+00	\N	207	2	9	75
76	DISTRICT HEALTH DIRECTORATE	SENIOR TECHNICAL OFFICER - HEALTH INFORMATION	\N	no	1.863289	6.820134	2020-09-28 14:52:35+00	\N	14	3	2	76
77	Environmental Health Department	Environmental Health Analyst	\N	no	2.34613	10.4007738	2020-09-28 15:56:54+00	\N	81	3	12	77
78	VETERINARY SERVICES	DISTRICT VETERINARY OFFICER	\N	no	92	5472	2020-09-28 16:24:52+00	\N	44	3	1	78
79	GHANA HEALTH SERVICE	HEALTH INFORMATION	\N	no	-2.4247	10.5043	2020-09-28 17:32:27+00	\N	146	3	13	79
80	Ghana Health Service	Public Health Service	\N	no	-1.215804	6.624198	2020-09-29 09:48:30+00	\N	35	3	2	80
81	University of Health & Allied Sciences	Lecturer	\N	no	0.4738	7.1519	2020-09-29 11:25:43+00	\N	104	3	14	81
82	UHAS/Epidemiology & Biostatistics 	Lecturer/Epidemiologist	\N	no	0.472326666666666	7.25897666666666	2020-09-29 11:54:48+00	\N	104	1	14	82
83	SPH-UHAS	Lecturer	\N	no	7.159138	0.472277	2020-09-29 15:22:20+00	\N	104	1	14	83
84	University of Health and Allied Sciences	Assistant lecturer	\N	no	0.4723266666666	7.158976666666	2020-09-29 17:16:17+00	\N	104	3	14	84
85	District Health Directorate, Lambussie	Public Health Officer (Disease Control)	\N	no	-2.4247	10.5043	2020-09-29 17:59:02+00	\N	146	3	13	85
86	Ghana Health Service	Public Health Officer (Disease Control)	\N	no	-1.215804	6.624198	2020-09-29 21:01:22+00	\N	35	3	2	86
87	Suntreso Government Hospital 	Head of Department- Public Health 	\N	no	1380	6429	2020-09-30 10:30:57+00	\N	121	3	2	87
88	Ghana Health Service	Disease Control Officer	\N	no	-1.215804	6.624198	2020-09-30 13:38:48+00	\N	35	3	2	88
89	Volta River Authority Hospitals Limited, Aboadze 	Midwife 	\N	no	4.974333	1.654995	2020-09-30 15:08:48+00	\N	192	3	15	89
90	VETERINARY SERVICES DEPARTMENT	VETERINARIAN	\N	no	-2.817864	5.82703	2020-09-30 15:10:14+00	\N	34	3	16	90
91	Ghana Health Service 	Medical Laboratory Scientist 	\N	no	-2.314182	7.344615	2020-09-30 18:54:04+00	\N	203	3	3	91
92	Ghana Health Service	District Director of Health	\N	no	2658780	10362670	2020-09-30 18:55:28+00	\N	156	3	13	92
93	Ghana Health Service, Ejisu	Public Health Officer (Health Information)	\N	no	-1.469262	6.722297	2020-09-30 20:23:42+00	\N	258	3	2	93
94	Ghana Health Service/Public Health Laboratory	Biomedical Scientist	\N	no	-1.744304	4.922872	2020-09-30 21:14:33+00	\N	200	2	15	94
95	Techiman Municipal Health directorate 	Health Information Officer	\N	no	-1.93524	7.5604	2020-09-30 22:02:47+00	\N	213	3	4	95
96	Ghana Health Service / Municipal Health Directorate 	Municipal public health nurse 	\N	no	2.4916	5.4946	2020-09-30 22:55:33+00	\N	34	3	16	96
97	Ghana Health Service	Biomedical Scientist	\N	no	-0.4757468	10.9420117	2020-10-01 07:59:26+00	\N	58	3	12	97
98	Ghana Health Service, Prestea Municipal Health Directorate	Disease Control Officer	\N	no	5.569793	-2.019799	2020-10-01 08:33:55+00	\N	174	3	15	98
99	Ghana Health Service	Public Health Nurse	\N	no	1.4656	4.5446	2020-10-01 08:50:50+00	\N	198	3	15	99
100	Dormaa Municipal Health Directorate	Health Information Officer	\N	no	-2.870233	7.274352	2020-10-01 09:32:40+00	\N	84	3	3	100
101	Municipal Health Directorate	Public Health Nurse	\N	no	2.87016	7.274385	2020-10-01 10:35:06+00	\N	84	3	3	101
102	WHO	Technical Officer for Quality of Care, Maternal, Newborn and Child Health	\N	no	0.201448	5.606959	2020-10-01 13:43:54+00	\N	96	3	7	102
103	Ghana Health Service	Municipal Public Health Officer	\N	no	-2.869963	7.274098	2020-10-05 11:25:54+00	\N	84	3	3	103
104	Ghana Health Service	Public Health Officer-Disease Control	\N	no	0.2737	6.3631	2020-10-05 13:11:20+00	\N	102	2	14	104
105	Veterinary service directorate	Veterinary Officer	\N	no	-1.726494	8.066181	2020-10-05 14:43:52+00	\N	118	3	4	105
106	GHS	PUBLIC HEALTH NURSE (AGT)	\N	no	11049	673	2020-10-06 10:26:56+00	\N	117	3	14	106
107	District Health Directorate 	District Disease Control Officer	\N	no	-0.476208	9.934961	2020-10-09 08:42:02+00	\N	112	3	9	107
108	Swiss Tropical and Public Health Institute, University of Basel	PhD Fellow	\N	no	47.5559	7.5774	2020-10-09 14:35:59+00	\N	\N	2	\N	108
109	Ghana Health Service	Medical Laboratory Scientist	\N	no	-0.476208	9.934961	2020-10-09 20:36:38+00	\N	112	3	9	109
110	District Health Directorate, Ghana Health Service	Acting District Director of Health Services	\N	no	10.853942	-0.672638	2020-10-12 08:34:54+00	\N	155	3	12	110
111	Ghana Health Service / Laboratory	Deputy Chief Biomedical Scientist	\N	no	-1.744295	4.9226281	2020-10-13 07:08:47+00	\N	200	2	15	111
112	Food and Drugs Authority, Tamale office	Regulatory officer	\N	no	9.41156	-0.824838	2020-10-16 13:54:45+00	\N	207	2	9	112
113	Kwadaso Municipal Health Directorate	Senior Technical Officer	\N	no	6.68029	-1.668514	2020-11-04 13:27:51+00	\N	122	3	2	113
114	Public health laboratory 	Public health Officer 	\N	no	9.39218	-0.8235	2020-11-04 13:31:26+00	\N	207	2	9	114
115	NZEMA EAST HEALTH DIRECTORATE	PUBLIC HEALTH OFFICER - DC	\N	no	-2.24734	4.86963	2020-11-04 13:39:43+00	\N	170	3	15	115
116	Veterinary Service	Senior Technical Officer	\N	no	10.87729	1.9881	2020-11-04 14:24:10+00	\N	193	1	13	116
117	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	STUDENT 	\N	no	-1.98658	10.87583	2020-11-04 15:20:25+00	\N	193	3	13	117
118	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	STUDENT 	\N	no	-1.98658	10.87583	2020-11-04 15:20:40+00	\N	193	3	13	118
119	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	STUDENT 	\N	no	-1.98658	10.87583	2020-11-04 15:21:12+00	\N	193	3	13	119
120	Regional Health Directorate, Ghana Health Service	Health Information Officer	\N	no	-0.8366540819414	9.40453852527719	2020-11-04 15:21:17+00	\N	\N	2	9	120
121	Ghana Health Service, Obuasi municipal health directorate	Public health officer	\N	no	4029	1057	2020-11-04 15:33:52+00	\N	171	3	2	121
122	Food and Drugs Authority	Regulatory Officer	\N	no	133	7324	2020-11-04 15:37:26+00	\N	121	2	2	122
123	Food and Drugs Authority	Regulatory officer	\N	no	9.410477	0.82474	2020-11-04 16:19:24+00	\N	207	2	9	123
124	GHANA HEALTH SERVICE UPPER EAST REGIONAL HOSPITAL	SENIOR MEDICAL LABORATORY SCIENTIST	\N	no	135	5753	2020-11-04 16:59:31+00	\N	70	3	12	124
125	Ghana health Service 	Senior Technical officer (Health Information)	\N	no	269631	269631	2020-11-04 20:15:56+00	\N	114	3	12	125
126	Tumu Municipal hospital 	Medical laboratory scientist 	\N	no	0	0	2020-11-04 21:07:01+00	\N	193	3	13	126
127	Bimbilla Hospital Laboratory 	Medical Laboratory Scientist 	\N	no	0.055362	8.857958	2020-11-05 08:09:02+00	\N	158	3	9	127
128	Bimbilla Hospital Laboratory 	Medical Laboratory Scientist 	\N	no	0.055362	8.857958	2020-11-05 08:09:22+00	\N	158	3	9	128
129	Sissala East Municipal Health Directorate, Tumu	Municipal Disease Control Officer	\N	no	1.986764	10.876147	2020-11-05 09:15:39+00	\N	193	3	13	129
130	Ghana Health Service	Disease control 	\N	no	-0.841743333333334	9.43498833333333	2020-11-05 09:15:41+00	\N	207	3	9	130
131	Ghana health service 	Public health service 	\N	no	10.969002	-1.101101	2020-11-05 11:07:47+00	\N	194	3	12	131
132	Ghana Health Service	Public Health Officer Disease Control 	\N	no	-2925	10.1394	2020-11-05 11:16:47+00	\N	80	3	8	132
133	JASIKAN DISTRICT HEALTH DIRECTORATE 	BIOSTATICTISCIAN 	\N	no	7.401005	0.464053	2020-11-05 16:05:37+00	\N	107	3	10	133
134	GHANA HEALTH SERVICE/PUBLIC HEALTH 	DISEASE CONTROL OFFICER 	\N	no	5567888	56778888	2020-11-05 22:27:03+00	\N	12	3	14	134
135	GHANA HEALTH SERVICE	REGIONAL HEALTH INFORMATION OFFICER	\N	no	10.534445	-0.444662	2020-11-06 10:16:45+00	\N	\N	2	8	135
136	Dormaa Presbyterian Hospital	Biomedical scientist	\N	no	2	5225	2020-11-11 14:38:35+00	\N	84	3	3	136
137	Suaman Health Directorate/RCH	Ag.PHN	\N	no	3134	6740	2020-11-11 14:43:39+00	\N	201	3	16	137
138	Dormaa MHD	Disease Control Officer 	\N	no	7.27428	-2.87008	2020-11-11 16:00:15+00	\N	84	3	3	138
139	VETERINARY SERVICES DEPARTMENT	CHIEF ANIMAL HEALTH OFFICER	\N	no	6.202963	-1.68166	2020-11-26 13:18:26+00	\N	171	3	2	139
140	GHS/ Bawku Municipal Health Directorate 	Health Information Officer 	\N	no	-0.250365	11.056915	2020-12-24 14:42:54+00	\N	57	3	12	140
141	Food and Drugs Authority 	Senior Regulatory Officer 	\N	no	-0.86505	10.7987	2021-04-14 11:00:44+00	\N	70	2	12	141
\.


--
-- TOC entry 3243 (class 0 OID 127007)
-- Dependencies: 222
-- Data for Name: level_of_health_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_of_health_system (id, level) FROM stdin;
1	National
2	Regional
3	District
\.


--
-- TOC entry 3246 (class 0 OID 127025)
-- Dependencies: 225
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, content, picture_array, created_at, updated_at, user_id_id, user_profile_id) FROM stdin;
\.


--
-- TOC entry 3244 (class 0 OID 127012)
-- Dependencies: 223
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, region_name) FROM stdin;
1	AHAFO
2	ASHANTI
3	BONO
4	BONO EAST
5	CENTRAL
6	EASTERN
7	GREATER ACCRA
8	NORTH EAST
9	NORTHERN
10	OTI
11	SAVANNAH
12	UPPER EAST
13	UPPER WEST
14	VOLTA
15	WESTERN
16	WESTERN NORTH
\.


--
-- TOC entry 3245 (class 0 OID 127017)
-- Dependencies: 224
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, title, surname, firstname, sex, date_of_birth, phone1, phone2, is_trained_frontline, cohort_number_frontline, yr_completed_frontline, institution_enrolled_at_frontline, job_title_at_enroll_frontline, is_trained_intermediate, cohort_number_intermediate, yr_completed_intermediate, institution__enrolled_at_intermediate, job_title_at_enroll_intermediate, is_trained_advanced, cohort_number_advanced, yr_completed_advanced, institution_enrolled_at_advanced, job_title_at_enroll_advanced, status, created_at, updated_at, user_id) FROM stdin;
1	\N	Aabalekuu	Simon	Male	1982-03-10	207447446	249580197	No	\N	\N	\N	\N	Yes	1	2019-12-20	Ghana health service	Public health Officer (Disease control)	\N	\N	\N	\N	\N	unverified	2020-08-31 17:10:29+00	\N	1
2	\N	Akowuah	George	Male	1986-12-14	207669398	541480231	No	\N	\N	\N	\N	Yes	1	2019-12-12	Regional Health Directorate, Upper East	Health Information	No	\N	\N	\N	\N	unverified	2020-08-31 17:24:51+00	\N	2
3	\N	Mahama	Fuseini	Male	1971-01-21	244155009	\N	Yes	6	2016-09-30	District Health Directorate - Ghana Health Service	District Disease Control Officer	Yes	1	2019-12-12	District Health Directorate - Ghana Health Service	District Disease Control Officer	\N	\N	\N	\N	\N	unverified	2020-08-31 20:36:34+00	\N	3
4	\N	Noora	Charles Lwanga	Male	1986-04-29	208776329	242209316	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	7	2015-07-31	GHS	Lab. Scientist	unverified	2020-08-31 22:03:20+00	\N	4
5	\N	Abdul-Rahaman	Abdul-Aziz	Male	1984-03-27	249408602	207979738	Yes	20	2019-12-10	WaterAid Ghana	Environmental Health Officer	Yes	15	2019-12-12	GFELT	Field Epidemiologist	No	\N	\N	\N	\N	unverified	2020-09-01 09:47:17+00	\N	5
6	\N	Naada-Kogh	David	Male	1986-12-25	247661201	206727086	Yes	9	2018-05-03	Bawku Municipal Health Directorate/BawkuPresbyterian Hospital (GHS)	Disease Control officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-01 16:46:51+00	\N	6
7	\N	Ayichuru	Christiana	Female	1977-12-15	243986495	\N	Yes	9	2018-05-03	GHS	Ag PHN/HPO	Yes	9	2018-05-03	GHS	Ag PHN/HPO	No	\N	\N	\N	\N	unverified	2020-09-01 16:49:18+00	\N	7
8	\N	NUO-IRE	Y VITUS	Male	1976-09-21	205005427	542605214	\N	\N	\N	\N	\N	Yes	1	2019-12-11	VSD	District veterinary officer 	\N	\N	\N	\N	\N	unverified	2020-09-02 12:38:01+00	\N	8
9	\N	NUO-IRE	Y VITUS	Male	1976-09-21	205005427	542605214	\N	\N	\N	\N	\N	Yes	1	2019-12-11	VSD	District veterinary Officer	\N	\N	\N	\N	\N	unverified	2020-09-02 12:55:42+00	\N	9
10	\N	Tugpiel	Dominic	Male	1975-07-03	208399811	247646875	No	\N	\N	\N	\N	Yes	1	2019-12-11	Environmental Health Department	Environmental Health Analyst	No	\N	\N	\N	\N	unverified	2020-09-02 12:58:33+00	\N	10
11	\N	Boateng	Kwabena	Male	1984-08-28	209283996	243778556	Yes	9	2018-02-19	Ghana Health Service	Health Information Officer	No	9	2018-05-03	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-02 15:17:45+00	\N	11
12	\N	Boateng	Kwabena	Male	1984-08-28	209283996	243778556	Yes	9	2018-02-19	Ghana Health Service	Health Information Officer	No	9	2018-05-03	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-02 15:18:04+00	\N	12
13	\N	Amankwaa	Williams Fosu	Male	1984-03-28	242637718	207526304	Yes	9	2018-05-19	Ghana Health Service	Disease control	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-02 15:50:48+00	\N	13
14	\N	Millu Dekomwine	Doris	Female	1986-05-05	208296075	\N	Yes	9	2018-05-03	Ghana Health Service	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-02 17:07:17+00	\N	14
15	\N	Baleri 	Patricia 	Female	1990-10-09	240141196	\N	Yes	9	2018-05-03	Ghana Health Service 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-03 09:37:35+00	\N	15
16	\N	GODSON	JULIUS	Male	1984-04-24	244165545	553352551	Yes	9	2018-05-03	BAWKU PRESBYTERIAN HOSPITAL/ BAWKU MUNICIPAL HEALTH DIRECTORATE (GHS)	MEDICAL LABORATORY TECHNICIAN	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-03 17:40:10+00	\N	16
17	\N	Braimah	Vivian	Female	1961-10-23	243855076	\N	Yes	9	2018-05-03	Bawku Municipal Verterinary/ Agriculture	Technical officer verterinary	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-03 21:16:52+00	\N	17
18	\N	MOHAMMED	SHAMIR ALHASSAN	Male	1987-01-04	209728220	\N	Yes	\N	\N	FOOD AND DRUGS AUTHORITY	REGULATORY OFFICER	Yes	1	2019-12-11	FOOD AND DRUGS AUTHORITY	REGULATORY OFFICER	No	\N	\N	\N	\N	unverified	2020-09-03 21:39:33+00	\N	18
19	\N	Baba	Awuni	Male	1970-03-13	243924152	207239709	No	\N	\N	\N	\N	Yes	1	2019-12-12	Ghana Health Service	Regional Disease Surveillance Officer	No	\N	\N	\N	\N	unverified	2020-09-04 07:36:55+00	\N	19
20	\N	Boateng 	Ernest	Male	1990-12-15	549272360	506716523	No	\N	\N	\N	\N	Yes	1	2019-12-12	Veterinary services directorate 	Veterinary Officer 	No	\N	\N	\N	\N	unverified	2020-09-04 07:58:49+00	\N	20
21	\N	Anchaba	Faustinus	Male	1977-09-25	246321063	209712924	No	\N	\N	\N	\N	Yes	1	2019-12-11	School of public health, Accra-Ghana	Field Epidemiologist 	No	\N	\N	\N	\N	unverified	2020-09-04 12:07:39+00	\N	21
22	\N	Alhassan	Sherifa	Female	1985-10-25	248274850	208332336	Yes	6	2016-10-23	\N	regulatory officer	Yes	1	2019-10-28	food and drugs Authority	regulatory officer	No	\N	\N	\N	\N	unverified	2020-09-04 16:30:22+00	\N	22
23	\N	Cheyuo	Gladys	Female	1976-06-12	243077368	206966562	No	\N	\N	\N	\N	Yes	2	2019-12-12	GHana Health Service	Public Heaelth Nurse	No	\N	\N	NA	NA	unverified	2020-09-06 02:03:28+00	\N	23
24	\N	Hagyirah	Emmanuel	Male	1981-10-31	540749172	\N	Yes	\N	\N	Ghana Health Service	T.O Health Information	Yes	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-23 20:39:01+00	\N	24
25	\N	Hor	Zulkarnein Jnr	Male	1988-01-03	201380681	541582958	Yes	\N	2018-08-15	Municipal Health Directorate, Sissala East, Tumu	Municipal Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-23 20:59:48+00	\N	25
26	\N	Asiedu	Ernest Konadu	Male	2020-10-04	244461895	208287015	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	8	2016-06-30	National Catholic Health Service	Coordinator, Community and Institutional Care	unverified	2020-09-23 21:20:52+00	\N	26
27	\N	Noora 	Charles Lwanga 	Male	1986-04-29	242209316	208776329	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	7	2015-07-31	University of Ghana 	Laboratorian 	unverified	2020-09-23 21:29:36+00	\N	27
28	\N	ISSAHAKU GYESI	RAZAK	Male	2020-06-01	243263602	208264569	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	9	\N	Tamale Teaching Hospital	Medical Laboratory Scientist	unverified	2020-09-23 21:35:34+00	\N	28
29	\N	Asante-Sefa	Solomon	Male	1980-12-17	244979600	\N	Yes	10	2018-05-16	Ghana Health Service / Laboratory	Principal Biomedical Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-23 21:35:50+00	\N	29
30	\N	MWINTUMAH 	Benjamin Maanuor 	Male	1989-07-09	204192110	543826251	Yes	14	2019-08-22	Ghana Health Service / Laboratory Development 	Biomedical Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-23 21:36:46+00	\N	30
31	\N	Fiagbe	Joseph	Male	1980-06-28	243836200	207999429	Yes	10	2018-05-16	University of Ghana	Public Health Officer -Disease Control	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-23 21:44:10+00	\N	31
32	\N	Wullar	Oxygen	Male	1975-06-14	243124789	208215406	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-12-12	University of Ghana 	Senior Public Health Officer	unverified	2020-09-23 22:24:15+00	\N	32
33	\N	SOYELLEH	JAMES	Male	1974-03-06	543091954	205767684	Yes	12	2018-06-01	VETERINARY SERVICE DEPARTMENT	DISTRICT VETERINARY OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-23 22:24:29+00	\N	33
34	\N	SEIDU 	PAUL	Male	1989-07-22	245296233	503400788	Yes	\N	2018-08-15	GHANA HEALTH SERVICE	DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 03:31:17+00	\N	34
35	\N	Mahama	Fuseini	Male	1971-01-21	244155009	\N	Yes	6	2016-09-30	Ghana Health Service	District Disease Control Officer	Yes	1	2019-12-12	Ghana Health Service	District Disease Control Officer	\N	\N	\N	\N	\N	unverified	2020-09-24 07:55:58+00	\N	35
36	\N	BERKO	EMMANUEL	Male	1985-06-03	208882878	542639670	Yes	3	2018-11-01	LAWRA MUNICIPAL HOSPITAL	MEDICAL LABORATORY  SCIENTIST	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-24 09:29:33+00	\N	36
37	\N	Yeboah	Isaac	Male	1984-05-04	246221682	202360472	Yes	15	2019-12-12	Asunafo South Health Directorate	Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-24 09:39:31+00	\N	37
38	\N	Arthur	Atta	Male	1979-06-01	243564659	206315433	Yes	15	2019-12-12	Pru District Health Directorate	District Disease Surveillance Officer	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-24 09:47:18+00	\N	38
39	\N	DANSO	EDWARD FENTENG	Male	1968-10-31	540849171	208241094	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	1	2009-06-30	SCHOOL OF PUBLIC HEALTH/EPIDEMIOLOGY DEPARTMENT, LEGON, UNIVERSITY OF GHANA	SENIOR VETERINARY OFFICER	unverified	2020-09-24 10:40:03+00	\N	39
40	\N	Adjei	Eric	Male	1973-06-20	244418523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	7	2015-11-01	SPH, EPID department	medical laboratory scientist	unverified	2020-09-24 11:36:15+00	\N	40
41	\N	Mensah	Ebenezer Kofi 	Male	0066-07-16	244528615	244528615	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	4	0012-07-31	Sekondi Public Health Laboratory, Ghana Health Service 	Medical Laboratory Scientist	unverified	2020-09-24 11:43:28+00	\N	41
42	\N	AGBOFU	NOAH	Male	1990-07-07	240557893	\N	Yes	\N	2018-08-08	UNIVERSITY OF GHANA/ SCHOOL OF PUBLIC HEALTH	FIELD EPIDEMIOLOGY 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-24 12:06:01+00	\N	42
43	\N	Num	Abraham	Male	1972-10-02	249765847	208598009	Yes	15	2019-12-12	Ghana Health Service/Pru East District Health Directorate	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 12:42:02+00	\N	43
44	\N	Obeng	Rahman	Male	1984-05-06	207422751	\N	Yes	\N	\N	Sissala West DHA	District Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 12:50:17+00	\N	44
45	\N	OSEI	EMMANUEL KWAME	Male	1984-02-24	249716390	209393448	Yes	15	2019-12-12	GHANA HEALTH SERVICE, KINTAMPO MUNICIPAL HEALTH DIRECTORATE	AG. PUBLIC HEALTH NURSE	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 13:15:23+00	\N	45
46	\N	Sieh	Daniel	Male	1984-07-29	242917363	242917363	Yes	15	2019-12-12	Ghana Health Service/Mnistry of Health	Health information officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 13:16:39+00	\N	46
47	\N	Abdullai	Safiatu	Female	1980-11-07	244129644	\N	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-07-11	University of Ghana/ GFELTP	Nursing	unverified	2020-09-24 13:23:44+00	\N	47
48	\N	Sieh	Daniel	Male	1984-07-29	242917363	242917363	Yes	15	2019-12-12	Ghana Health Services/Ministry of Health	 Health Information Officer	No	\N	\N	Ghana Health Services/Ministry of Health	Health Information Officer	No	\N	\N	Ghana Health Services/Ministry of Health	Health Information Officer	unverified	2020-09-24 13:26:41+00	\N	48
49	\N	KWAKYE  (OWUSU)	MICHAEL 	Male	1975-06-10	209406624	557356854	Yes	13	2019-05-16	GHANA HEALTH SERVICE/DISEASE CONTROL UNIT	DISTRICT DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 14:14:46+00	\N	49
50	\N	OWUSU	JAMES	Male	1980-09-25	249151203	204591529	Yes	15	2019-12-12	KINTAMPO NORTH MUNICIPAL HEALTH DIRECTORATE	DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 14:18:06+00	\N	50
51	\N	Nanga	Joseph Nyindam	Male	1983-06-09	248977519	201316574	Yes	15	2019-12-12	Kintampo North Municipal Health Directorate	Senior technical Officer (Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 14:36:52+00	\N	51
52	\N	Ankomah	Albert	Male	1978-05-12	244470413	207944200	Yes	\N	\N	Food and Drugs Authority	Food Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-24 14:51:34+00	\N	52
53	\N	Kankpetinge	Christopher	Male	1984-12-15	548428898	504428898	Yes	11	2018-08-03	Ghana Health Service	Disease Control Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 16:19:18+00	\N	53
54	\N	NTI	DANIEL 	Male	1974-12-05	209122506	244724708	Yes	\N	2019-12-12	Food and Drugs Authority	Senior Regulatory Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-24 17:08:15+00	\N	54
55	\N	Mahama	Raymond Razak	Male	1987-03-31	244843539	207862120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-01	Tamale Teaching Hospital	Medical Laboratory Scientist	unverified	2020-09-25 01:26:24+00	\N	55
56	\N	Ofosuhene	Abigail	Female	1981-09-05	261407099	558464625	Yes	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-07-31	University of Ghana, School of Public Health	Physician Assistant	unverified	2020-09-25 06:53:54+00	\N	56
57	\N	Ndego	Abel	Male	1980-01-01	208435770	555347170	Yes	9	2018-05-02	Food and Drugs Authority	Regulatory Officer 1	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 10:35:49+00	\N	57
58	\N	Adutwum Asare	Richard	Male	1982-07-02	202235841	546818915	Yes	10	2018-05-16	Ghana Health Service 	Technical Officer (Disease Control )	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-25 11:00:58+00	\N	58
59	\N	Zumuroh	Danyuo Manan	Male	1992-03-07	540632547	209983331	Yes	12	2018-09-15	Ghana Health Service	Technical officer ( Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 13:42:49+00	\N	59
60	\N	Zumuroh	Danyuo Manan	Male	1992-03-07	540632547	209983331	Yes	12	2018-09-15	Ghana Health Service	Technical officer ( Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 13:43:13+00	\N	60
61	\N	Zumuroh	Danyuo Manan	Male	1992-03-07	540632547	209983331	Yes	12	2018-09-15	Ghana Health Service	Technical officer ( Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 13:43:24+00	\N	61
62	\N	Wewugu	Apiu Peter	Male	1976-03-23	203495645	242547146	Yes	14	2019-08-22	Veterinary Services Department - MOFA	Assistant Chief Animal Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 15:02:45+00	\N	62
63	\N	Wewugu	Apiu Peter	Male	1976-03-23	203495645	242547146	Yes	14	2019-08-22	Veterinary Services Department	Assistant Chief Animal Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 15:09:45+00	\N	63
64	\N	Otchere	Godsway Orison	Male	1983-08-09	244907292	246810263	Yes	14	2019-08-22	Ghana Health Service	District Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-25 15:33:03+00	\N	64
65	\N	DZANDU	ELI	Male	1982-04-06	207821719	244016662	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-07-31	UG-SPH	FIELD EPIDEMIOLOGIST	unverified	2020-09-25 17:10:01+00	\N	65
66	\N	Ayepah 	Christabel 	Female	1980-11-09	206300443	559620488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	12	2019-07-31	Shama Health Center	Facility Head	unverified	2020-09-25 18:50:15+00	\N	66
67	\N	Agudey	Daniel	Male	1970-03-28	208504122	208504122	Yes	2	2016-01-08	Regional Public Health Division	Regional Surveillance Officer	\N	\N	\N	\N	\N	Yes	11	2019-07-26	\N	Regional Malaria Focal Person	unverified	2020-09-26 03:50:53+00	\N	67
68	\N	Aabalekuu 	Simon	Male	1982-01-10	207447446	249580197	\N	\N	\N	\N	\N	Yes	1	2019-12-12	Ghana health service	Public health Officer	\N	\N	\N	\N	\N	unverified	2020-09-26 11:33:44+00	\N	68
69	\N	Amartey	Kenneth Nii	Male	1987-10-18	249881047	\N	Yes	15	2019-12-12	Pru East Health Directorate	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-26 14:39:15+00	\N	69
70	\N	Abubakari	Illiasu	Male	1983-05-06	543318990	594106062	Yes	15	2019-12-14	Veterinary Services Department	Animal Health Officer	No	\N	\N	\N	\N	No	\N	\N	Veterinary Services Department	Animal Health Officer	unverified	2020-09-27 16:53:49+00	\N	70
71	\N	Agunga	Bruno Gandorg	Male	1979-10-06	246531448	246531448	Yes	14	2019-08-22	MHD, Nanumba North	MDCO	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 06:25:54+00	\N	71
72	\N	Kambe	MacJonas	Male	1983-04-04	243639008	505691691	Yes	10	2018-05-16	Ghana Health Service, Prestea Huni Valley Municipal Health Directorate	Public Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 11:04:25+00	\N	72
73	\N	Abubakari	Aliu	Male	1985-12-13	205338188	557070255	Yes	15	2019-12-12	Ghana Health Service	Technical Officer (Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 11:49:27+00	\N	73
74	\N	Tankoruk	Jeremiah	Male	1982-08-13	240775799	203529229	Yes	15	2019-12-13	GHS/ District Health Directorate 	Ag.Comnunity Health nusrse ( Ag PHN)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 12:44:20+00	\N	74
75	\N	Iddi	Hasana	Female	1992-10-09	545118063	507562133	Yes	14	2019-08-22	Regional Health Directorate/Disease Control and EPI unit 	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 12:53:45+00	\N	75
76	\N	AMANKWAAH	SAMUEL	Male	1989-04-10	541288594	546295331	Yes	13	2019-05-16	GHANA HEALTH DIRECTORATE/ DISTRICT HEALTH DIRECTORATE	HEALTH INFORMATION OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-28 14:52:35+00	\N	76
77	\N	Tugpiel	Dominic	Male	1975-07-03	208399811	247647875	No	\N	\N	\N	Environmental Health Analyst	Yes	1	2019-12-10	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 15:56:54+00	\N	77
78	\N	AKANSIAK	SYLVESTER	Male	1970-08-08	244850212	244850212	Yes	15	2019-12-12	GFELTP, 	DISTRICT VETERINARY OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-28 16:24:52+00	\N	78
79	\N	DANGBOOR	PAUL AABETERFAA	Male	1994-12-25	541439780	205105851	Yes	\N	2018-08-15	GHANA HEALTH SERVICE	HEALTH INFORMATION (TECHNICAL ASSISTANT)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-28 17:32:27+00	\N	79
80	\N	Banini	Rejoice	Female	1986-03-06	547138966	209433937	Yes	13	2019-05-16	Ghana Health Nurse	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-29 09:48:30+00	\N	80
81	\N	DONGDEM	ANTHONY ZUNUO	Male	1969-07-10	506531040	244219733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	1	2010-12-15	University of Ghana/Department of Epidemiology & Disease Control	Biomedical Scientist	unverified	2020-09-29 11:25:43+00	\N	81
82	\N	Kye-Duodu	Gideon	Male	1976-09-20	244465259	208632324	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	4	2012-07-31	District Hospital, Begoro	Senior Biomedical Scientist	unverified	2020-09-29 11:54:48+00	\N	82
83	\N	Amenuvegbe	Gregory	Male	0068-08-09	208163336	593201142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	10	2018-07-30	UHAS	Asst.Lecturer	unverified	2020-09-29 15:22:20+00	\N	83
84	\N	Aku	Fortress	Female	1986-01-17	246121421	207984613	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	8	2016-06-30	Volta Regional Hospital	Biomedical Scientist	unverified	2020-09-29 17:16:17+00	\N	84
85	\N	Aleungurah	Douglas	Male	1982-03-27	202862278	249477149	Yes	12	2018-08-15	District Health Directorate, Lambussie	Public Health Officer (Disease Control)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-29 17:59:02+00	\N	85
86	\N	Sakyi	Gordon	Male	1983-03-03	543935274	249014119	Yes	13	2019-05-16	Ghana Health Service	Public Health Officer(Disease Control)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-29 21:01:22+00	\N	86
87	\N	Eduah 	Felicia Maame Efua 	Female	1977-09-09	247250678	208758888	Yes	13	2020-05-05	Ahafo Ano South DHD	District Public Health Nurse 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-30 10:30:57+00	\N	87
88	\N	Kepah	James	Male	1986-12-07	248085724	\N	Yes	13	2019-05-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-30 13:38:48+00	\N	88
89	\N	Kwofie 	Vida Naana 	Female	1973-06-08	277117988	558112811	No	\N	\N	\N	\N	No	\N	\N	NA	NA	Yes	11	2019-11-12	University of Ghana, School of Public Health 	Midwife 	unverified	2020-09-30 15:08:48+00	\N	89
90	\N	DEBRAH	SELORM	Male	1975-11-09	208870225	244791991	Yes	10	2018-05-16	VETERINARY SERVICES DEPARTMENT	VETERINARIAN	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-09-30 15:10:14+00	\N	90
91	\N	KUMA	GEORGE KHUMALO	Male	1976-06-14	244180430	208217527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	5	2013-07-30	Ghana Health Service	Medical Laboratory Scientist	unverified	2020-09-30 18:54:04+00	\N	91
92	\N	Balagumyetime	Phoebe	Female	1968-07-06	243516077	\N	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	5	2017-07-31	Ghana Healrh service	District Director	unverified	2020-09-30 18:55:28+00	\N	92
93	\N	Agyei	Yaw Fosu	Male	1987-07-23	265101012	544388568	Yes	13	2019-05-16	Ghana Health Service, Ejisu	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-30 20:23:42+00	\N	93
94	\N	Amedzro	Irene	Female	1982-06-14	208418471	242084455	Yes	2	2016-01-08	Ghana Health Service/Public Health Laboratory	Biomedical Scientist	No	\N	\N	\N	\N	Yes	11	2019-11-15	Ghana Health Service/Public Health Laboratory	Biomedical Scientist	unverified	2020-09-30 21:14:33+00	\N	94
95	\N	Osei-Wusu	Sadick 	Male	1988-10-31	248824943	202449611	Yes	5	2019-12-12	\N	Health information officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-30 22:02:47+00	\N	95
96	\N	Whajah	Alberta Mali 	Female	1985-05-11	208604151	558518781	Yes	10	2018-05-16	Ghana Health Service 	Municipal public health nurse 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-09-30 22:55:33+00	\N	96
97	\N	Oteng	Gideon	Male	1986-12-30	242208827	200686195	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	10	2018-07-31	University of Ghana, School of Public Health, Department of Epidemiology and Disease Control	Biomedical Scientist	unverified	2020-10-01 07:59:26+00	\N	97
98	\N	NTERFUL	ROBERT	Male	1981-10-17	246249488	202024939	Yes	10	2018-04-16	\N	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-01 08:33:55+00	\N	98
99	\N	Acquah	Naomi Nayoca	Female	1984-01-28	243446327	\N	Yes	10	2018-05-16	Ghana Health Service	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-01 08:50:50+00	\N	99
100	\N	Achirem Nyarko	Dennis	Male	1986-04-22	545142114	501162149	Yes	15	2019-12-12	Dormaa Municipal Health Directorate	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-01 09:32:40+00	\N	100
101	\N	Ayiwa	Serwaa	Female	1975-09-19	208190317	544221899	Yes	15	2019-09-12	Municipal Health Directorate	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-01 10:35:06+00	\N	101
102	\N	Dsane-Aidoo	Paul Henry	Male	1986-06-28	242141600	\N	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-03	School of Public Health, GFELTP	Senior Medical Officer	unverified	2020-10-01 13:43:54+00	\N	102
103	\N	Owusu-Amponsah	Daniel	Male	1979-03-24	550975844	504404900	Yes	15	2019-12-12	Ghana Field Epidemiology and Laboratory Training Program	Public Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-05 11:25:54+00	\N	103
104	\N	Klenyuie	Wisdom	Male	1981-08-29	242836665	207142936	Yes	11	2018-08-01	Ghana Health Service	Public Health Officer-Disease Control	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-05 13:11:20+00	\N	104
105	\N	Amoro	Nelson Ayamga	Male	0085-10-28	540747247	501382117	Yes	15	2019-12-12	Veterinary Services Directorate	Veterinary Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-05 14:43:52+00	\N	105
106	\N	DZIKPE 	EMILIA 	Female	1987-05-18	245188660	200288473	Yes	11	2018-08-01	GHS	PUBLIC HEALTH NURSE (AGT)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-06 10:26:56+00	\N	106
107	\N	Doogu	Jonas	Male	1984-10-10	244581769	505439065	Yes	14	2019-08-22	District Health Directorate (GHS)	Disease Control Officer (TO)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-09 08:42:02+00	\N	107
108	\N	Nuvey	Francis	Male	1991-05-15	41715661462	504991496	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-12	Korle Bu Teaching Hospital, Ministry of Health	Nurse	unverified	2020-10-09 14:35:59+00	\N	108
109	\N	Bawa	Dr. Abdul-Latif Baako	Male	1990-06-27	205781030	544053885	Yes	14	2019-08-22	Ghana Health Service	Medical Laboratory Scientist	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-09 20:36:38+00	\N	109
110	\N	Baba	Awuni	Male	1970-03-13	243924152	207239709	\N	\N	\N	\N	\N	Yes	1	2019-12-12	Regional Health Directorate, Ghana Health Service	Regional Disease Surveillance Officer	No	\N	\N	\N	\N	unverified	2020-10-12 08:34:54+00	\N	110
111	\N	Asante-Sefa	Solomon	Male	1980-12-17	244979600	\N	Yes	10	2018-05-16	Ghana Health Service / Laboratory	Principal Biomedical Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-13 07:08:47+00	\N	111
112	\N	Adam	Gafaru Osman	Male	1986-02-06	207807776	246008457	Yes	14	2019-08-22	Food and Drugs Authority, Tamale office	Regulatory Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-10-16 13:54:45+00	\N	112
113	\N	Sarpong	Johnson	Male	1986-02-24	247791534	247791534	Yes	13	2019-05-02	Public Health - Disease Control Unit	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 13:27:51+00	\N	113
114	\N	Dombadoh 	Alentis Aba-ifaa 	Male	1980-05-16	243466361	205522102	Yes	14	2019-08-27	Uncertainty of Ghana 	Public health Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 13:31:26+00	\N	114
115	\N	FIAGBE	JOSEPH W.K	Male	1980-06-28	243836200	207999429	Yes	10	2018-05-15	SUAMAN HEALTH DIRECTORATE	PUBLIC HEALTH OFFICER -DC	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 13:39:43+00	\N	115
116	\N	Tergu	Eric	Male	1983-03-10	207416158	546561222	Yes	3	\N	3	Veterinarian	Yes	\N	2018-08-12	Veterinary service Department	Technical officer	No	\N	\N	\N	\N	unverified	2020-11-04 14:24:10+00	\N	116
117	\N	KANTON 	ISSAH LURIWIE 	Male	1982-08-10	541107044	205164066	Yes	12	2018-08-15	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	AG. PUBLIC HEALTH NURSE 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 15:20:25+00	\N	117
118	\N	KANTON 	ISSAH LURIWIE 	Male	1982-08-10	541107044	205164066	Yes	12	2018-08-15	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	AG. PUBLIC HEALTH NURSE 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 15:20:40+00	\N	118
119	\N	KANTON 	ISSAH LURIWIE 	Male	1982-08-10	541107044	205164066	Yes	12	2018-08-15	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	AG. PUBLIC HEALTH NURSE 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 15:21:12+00	\N	119
120	\N	Apinyela	Andrews  Akanlebe	Male	1982-10-07	541190805	506016564	Yes	14	2019-08-16	Nanumba North Municipal Health Directorate,Ghana Health Service	Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 15:21:17+00	\N	120
121	\N	Asigre	David	Male	1985-08-25	249656290	507256404	Yes	13	2019-04-26	Ghana Health Service	Public health officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 15:33:52+00	\N	121
122	\N	Ohene Djan	Prince	Male	1986-12-31	249013088	\N	Yes	13	2019-05-15	Food and Drugs Authority	Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 15:37:26+00	\N	122
123	\N	Gyacham	Henry	Male	1984-11-23	244608080	506414130	Yes	14	2019-08-28	Food and Drugs Authority	Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 16:19:24+00	\N	123
124	\N	CUDJOE 	ALFRED	Male	1979-03-26	249741970	249741970	Yes	\N	2018-05-03	GHANA HEALTH SERVICE, UPPER EAST REGIONAL HOSPITAL	MEDICAL LABORATORY SCIENTIST	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 16:59:31+00	\N	124
125	\N	AFUKAAH 	SIMON 	Male	1984-12-20	277324012	202062808	Yes	9	2018-05-03	Ghana health  Service 	Health information  officer 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-04 20:15:56+00	\N	125
126	\N	Abuakwah 	Daniel Nanabanyin 	Male	1987-06-06	244486561	200852902	Yes	4	2018-07-15	Tumu Municipal hospital 	Medical laboratory scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-04 21:07:01+00	\N	126
127	\N	Sulemana	Abdul-Rsuf	Male	1989-06-05	245884557	502110683	Yes	14	2019-08-22	Bimbilla Hospital/ Laboratory deparment	Medical Laboratory Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 08:09:02+00	\N	127
128	\N	Sulemana	Abdul-Rsuf	Male	1989-06-05	245884557	502110683	Yes	14	2019-08-22	Bimbilla Hospital/ Laboratory deparment	Medical Laboratory Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 08:09:22+00	\N	128
129	\N	Nyuasun	Saani	Male	1983-03-23	249383515	207290380	Yes	1	2018-08-24	Ghana Health Service	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 09:15:39+00	\N	129
130	\N	Apetorgbor	Peter	Male	1975-01-07	244946147	\N	Yes	14	2019-08-22	Ghana Health Service	Disease control 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-05 09:15:41+00	\N	130
131	\N	Apungu 	Samuel 	Male	1985-05-24	205359221	249611504	Yes	9	2018-05-28	Ghana health service 	Public health nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 11:07:47+00	\N	131
132	\N	Asumadu	Gyetuah 	Male	1986-01-27	206156039	206156039	Yes	14	2019-08-22	University of Ghana 	Disease Control Officer 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-05 11:16:47+00	\N	132
133	\N	AGBO 	TIMOTHY ATTA 	Male	1986-08-11	240646055	205524558	Yes	11	2018-07-29	University College of Ghana,  Legon	HEALTH INFORMATION OFFICER 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 16:05:37+00	\N	133
134	\N	AGBOFU 	NOAH	Male	1990-07-07	240557893	505368577	Yes	11	2018-08-11	UNIVERSITY OF GHANA SCHOOL OF PUBLIC HEALTH 	DISEASE CONTROL 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-05 22:27:03+00	\N	134
135	\N	ADAM	ANAS	Male	1986-12-23	206138785	248859976	Yes	14	2019-08-22	GHANA HEALTH SERVICE	DISTRICT HEALTH INFORMATION OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	unverified	2020-11-06 10:16:45+00	\N	135
136	\N	Duah	Agyemang	Male	1987-12-02	200262072	240134880	Yes	15	2019-12-12	Laboratory	Biomedical scientist	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-11 14:38:35+00	\N	136
137	\N	Essel	Joycelyn	Female	1993-02-13	549754562	570283890	Yes	10	2018-05-15	GHS	Ag.PHN	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-11 14:43:39+00	\N	137
138	\N	Osei	Gideon 	Male	1991-06-20	546098320	546098320	Yes	15	2019-12-12	Dormaa MHD	Disease Control Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-11 16:00:15+00	\N	138
139	\N	AGYEMANG	KOFI BOATENG	Male	1971-04-02	266762942	201168555	Yes	13	2019-05-16	VETERINARY	ANIMAL HEALTH OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	unverified	2020-11-26 13:18:26+00	\N	139
140	\N	Abdul Hamid 	Abubakari 	Male	1990-04-04	541111604	506944402	Yes	9	2018-05-03	GHS/Bawku Municipal Health Directorate 	Health Information Officer 	No	9	2018-05-03	\N	\N	No	\N	\N	\N	\N	unverified	2020-12-24 14:42:54+00	\N	140
141	\N	Anyim 	Clement 	Male	1986-12-13	249535356	200947923	Yes	9	2018-05-03	Food and Drugs Authority 	Regulatory Officer	Yes	1	2019-12-13	Food and Drugs Authority 	 Regulatory Officer	No	\N	\N	\N	\N	unverified	2021-04-14 11:00:44+00	\N	141
\.


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- TOC entry 3058 (class 2606 OID 127006)
-- Name: apis_events apis_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_events
    ADD CONSTRAINT apis_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3024 (class 2606 OID 127093)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3029 (class 2606 OID 126928)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3032 (class 2606 OID 126891)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3026 (class 2606 OID 126881)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 126919)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3021 (class 2606 OID 126873)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 126909)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3043 (class 2606 OID 126943)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3034 (class 2606 OID 126899)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3046 (class 2606 OID 126917)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3049 (class 2606 OID 126957)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3037 (class 2606 OID 127087)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3055 (class 2606 OID 126998)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 126981)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 126865)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3016 (class 2606 OID 126863)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 126855)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3078 (class 2606 OID 127102)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3073 (class 2606 OID 127037)
-- Name: job_info job_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_info
    ADD CONSTRAINT job_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 127011)
-- Name: level_of_health_system level_of_health_system_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_of_health_system
    ADD CONSTRAINT level_of_health_system_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 2606 OID 127032)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 127016)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 127024)
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3022 (class 1259 OID 127094)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3027 (class 1259 OID 126939)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3030 (class 1259 OID 126940)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3017 (class 1259 OID 126925)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3038 (class 1259 OID 126955)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3041 (class 1259 OID 126954)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3044 (class 1259 OID 126969)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3047 (class 1259 OID 126968)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3035 (class 1259 OID 127088)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3056 (class 1259 OID 127085)
-- Name: districts_region_id_f125ac86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX districts_region_id_f125ac86 ON public.districts USING btree (region_id);


--
-- TOC entry 3050 (class 1259 OID 126992)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3053 (class 1259 OID 126993)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3076 (class 1259 OID 127104)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3079 (class 1259 OID 127103)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3070 (class 1259 OID 127081)
-- Name: job_info_district_id_id_1e31952d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX job_info_district_id_id_1e31952d ON public.job_info USING btree (district_id_id);


--
-- TOC entry 3071 (class 1259 OID 127082)
-- Name: job_info_level_of_health_system_id_a3101d01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX job_info_level_of_health_system_id_a3101d01 ON public.job_info USING btree (level_of_health_system_id);


--
-- TOC entry 3074 (class 1259 OID 127083)
-- Name: job_info_region_id_id_1761d335; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX job_info_region_id_id_1761d335 ON public.job_info USING btree (region_id_id);


--
-- TOC entry 3075 (class 1259 OID 127084)
-- Name: job_info_user_profile_id_9ebfbe3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX job_info_user_profile_id_9ebfbe3c ON public.job_info USING btree (user_profile_id);


--
-- TOC entry 3068 (class 1259 OID 127059)
-- Name: news_user_id_id_542285fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_user_id_id_542285fb ON public.news USING btree (user_id_id);


--
-- TOC entry 3069 (class 1259 OID 127060)
-- Name: news_user_profile_id_30fda527; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_user_profile_id_30fda527 ON public.news USING btree (user_profile_id);


--
-- TOC entry 3065 (class 1259 OID 127048)
-- Name: user_profile_user_id_8fdce8e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_profile_user_id_8fdce8e2 ON public.user_profile USING btree (user_id);


--
-- TOC entry 3082 (class 2606 OID 126934)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3081 (class 2606 OID 126929)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3080 (class 2606 OID 126920)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3084 (class 2606 OID 126949)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3083 (class 2606 OID 126944)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3086 (class 2606 OID 126963)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3085 (class 2606 OID 126958)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3089 (class 2606 OID 127038)
-- Name: districts districts_region_id_f125ac86_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_region_id_f125ac86_fk_regions_id FOREIGN KEY (region_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3087 (class 2606 OID 126982)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3088 (class 2606 OID 126987)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3093 (class 2606 OID 127061)
-- Name: job_info job_info_district_id_id_1e31952d_fk_districts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_info
    ADD CONSTRAINT job_info_district_id_id_1e31952d_fk_districts_id FOREIGN KEY (district_id_id) REFERENCES public.districts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3094 (class 2606 OID 127066)
-- Name: job_info job_info_level_of_health_syst_a3101d01_fk_level_of_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_info
    ADD CONSTRAINT job_info_level_of_health_syst_a3101d01_fk_level_of_ FOREIGN KEY (level_of_health_system_id) REFERENCES public.level_of_health_system(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3095 (class 2606 OID 127071)
-- Name: job_info job_info_region_id_id_1761d335_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_info
    ADD CONSTRAINT job_info_region_id_id_1761d335_fk_regions_id FOREIGN KEY (region_id_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3096 (class 2606 OID 127076)
-- Name: job_info job_info_user_profile_id_9ebfbe3c_fk_user_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_info
    ADD CONSTRAINT job_info_user_profile_id_9ebfbe3c_fk_user_profile_id FOREIGN KEY (user_profile_id) REFERENCES public.user_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3091 (class 2606 OID 127049)
-- Name: news news_user_id_id_542285fb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_id_id_542285fb_fk_auth_user_id FOREIGN KEY (user_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3092 (class 2606 OID 127054)
-- Name: news news_user_profile_id_30fda527_fk_user_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_profile_id_30fda527_fk_user_profile_id FOREIGN KEY (user_profile_id) REFERENCES public.user_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3090 (class 2606 OID 127043)
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-07-02 10:08:49 GMT

--
-- PostgreSQL database dump complete
--

