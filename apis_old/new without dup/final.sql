--

select * from public."rootApp_districttbl"
where district_name = 'ADAKLU'



-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

-- Started on 2021-07-19 02:53:43 GMT

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
-- TOC entry 219 (class 1259 OID 159493)
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 159491)
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- TOC entry 221 (class 1259 OID 159503)
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 159501)
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- TOC entry 227 (class 1259 OID 159562)
-- Name: apis_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apis_event (
    id integer NOT NULL,
    title character varying(100),
    schedule date,
    description character varying(500),
    created_at timestamp with time zone NOT NULL,
    picture character varying(100),
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.apis_event OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 159560)
-- Name: apis_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apis_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_event_id_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 226
-- Name: apis_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apis_event_id_seq OWNED BY public.apis_event.id;


--
-- TOC entry 229 (class 1259 OID 159573)
-- Name: apis_gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apis_gallery (
    id integer NOT NULL,
    title character varying(100),
    picture character varying(100),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.apis_gallery OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 159571)
-- Name: apis_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apis_gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_gallery_id_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 228
-- Name: apis_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apis_gallery_id_seq OWNED BY public.apis_gallery.id;


--
-- TOC entry 235 (class 1259 OID 159597)
-- Name: apis_verificationtbl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apis_verificationtbl (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(7),
    status character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.apis_verificationtbl OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 159595)
-- Name: apis_verificationtbl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apis_verificationtbl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_verificationtbl_id_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 234
-- Name: apis_verificationtbl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apis_verificationtbl_id_seq OWNED BY public.apis_verificationtbl.id;


--
-- TOC entry 246 (class 1259 OID 159736)
-- Name: app_contacts_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_contacts_contact (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    middlename character varying(50),
    lastname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    tel1 character varying(50) NOT NULL,
    tel2 character varying(50),
    user_id integer NOT NULL
);


ALTER TABLE public.app_contacts_contact OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 159739)
-- Name: app_contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_contacts_contact_id_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 247
-- Name: app_contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_contacts_contact_id_seq OWNED BY public.app_contacts_contact.id;


--
-- TOC entry 248 (class 1259 OID 159741)
-- Name: app_users_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_users_userprofile (
    id integer NOT NULL,
    middlename character varying(50),
    phone character varying(50),
    photo character varying(1000),
    user_id integer NOT NULL
);


ALTER TABLE public.app_users_userprofile OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 159747)
-- Name: app_users_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_users_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_users_userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 249
-- Name: app_users_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_users_userprofile_id_seq OWNED BY public.app_users_userprofile.id;


--
-- TOC entry 209 (class 1259 OID 159397)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 159395)
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
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 159407)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 159405)
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
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 159389)
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
-- TOC entry 206 (class 1259 OID 159387)
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
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 213 (class 1259 OID 159415)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150),
    first_name character varying(30),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 159425)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 159423)
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
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 212 (class 1259 OID 159413)
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
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 217 (class 1259 OID 159433)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 159431)
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
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 242 (class 1259 OID 159697)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 159554)
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    id integer NOT NULL,
    district_name character varying(100),
    region_id integer
);


ALTER TABLE public.district OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 159552)
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.district_id_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 224
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.district_id_seq OWNED BY public.district.id;


--
-- TOC entry 223 (class 1259 OID 159530)
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
-- TOC entry 222 (class 1259 OID 159528)
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
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 159379)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 159377)
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
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 159368)
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
-- TOC entry 202 (class 1259 OID 159366)
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
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 243 (class 1259 OID 159715)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 159727)
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 159725)
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 244
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- TOC entry 241 (class 1259 OID 159629)
-- Name: jobinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobinfo (
    id integer NOT NULL,
    current_institution character varying(100),
    job_title character varying(100),
    employment_status character varying(100),
    is_current character varying(5) NOT NULL,
    longitude double precision,
    latitude double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    district_id integer,
    level_of_health_system_id integer,
    region_id integer,
    user_id integer,
    user_profile_id integer
);


ALTER TABLE public.jobinfo OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 159627)
-- Name: jobinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobinfo_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 240
-- Name: jobinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobinfo_id_seq OWNED BY public.jobinfo.id;


--
-- TOC entry 231 (class 1259 OID 159581)
-- Name: level_of_health_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_of_health_system (
    id integer NOT NULL,
    level character varying(100)
);


ALTER TABLE public.level_of_health_system OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 159579)
-- Name: level_of_health_system_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.level_of_health_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_of_health_system_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 230
-- Name: level_of_health_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.level_of_health_system_id_seq OWNED BY public.level_of_health_system.id;


--
-- TOC entry 239 (class 1259 OID 159618)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(500),
    content character varying(1000),
    picture1 character varying(100),
    picture2 character varying(100),
    picture3 character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer,
    user_profile_id integer
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 159616)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 238
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 233 (class 1259 OID 159589)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    region_name character varying(100)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 159587)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 232
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 237 (class 1259 OID 159605)
-- Name: userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userprofile (
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


ALTER TABLE public.userprofile OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 159603)
-- Name: userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 236
-- Name: userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userprofile_id_seq OWNED BY public.userprofile.id;


--
-- TOC entry 3070 (class 2604 OID 159764)
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 159765)
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- TOC entry 3075 (class 2604 OID 159565)
-- Name: apis_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_event ALTER COLUMN id SET DEFAULT nextval('public.apis_event_id_seq'::regclass);


--
-- TOC entry 3076 (class 2604 OID 159576)
-- Name: apis_gallery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_gallery ALTER COLUMN id SET DEFAULT nextval('public.apis_gallery_id_seq'::regclass);


--
-- TOC entry 3079 (class 2604 OID 159600)
-- Name: apis_verificationtbl id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_verificationtbl ALTER COLUMN id SET DEFAULT nextval('public.apis_verificationtbl_id_seq'::regclass);


--
-- TOC entry 3084 (class 2604 OID 159766)
-- Name: app_contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.app_contacts_contact_id_seq'::regclass);


--
-- TOC entry 3085 (class 2604 OID 159767)
-- Name: app_users_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users_userprofile ALTER COLUMN id SET DEFAULT nextval('public.app_users_userprofile_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 159768)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 159769)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3064 (class 2604 OID 159770)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3067 (class 2604 OID 159771)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3068 (class 2604 OID 159772)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3069 (class 2604 OID 159773)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3074 (class 2604 OID 159557)
-- Name: district id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district ALTER COLUMN id SET DEFAULT nextval('public.district_id_seq'::regclass);


--
-- TOC entry 3072 (class 2604 OID 159774)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3063 (class 2604 OID 159775)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3062 (class 2604 OID 159776)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3083 (class 2604 OID 159777)
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- TOC entry 3082 (class 2604 OID 159632)
-- Name: jobinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo ALTER COLUMN id SET DEFAULT nextval('public.jobinfo_id_seq'::regclass);


--
-- TOC entry 3077 (class 2604 OID 159584)
-- Name: level_of_health_system id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_of_health_system ALTER COLUMN id SET DEFAULT nextval('public.level_of_health_system_id_seq'::regclass);


--
-- TOC entry 3081 (class 2604 OID 159621)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 3078 (class 2604 OID 159592)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 3080 (class 2604 OID 159608)
-- Name: userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprofile ALTER COLUMN id SET DEFAULT nextval('public.userprofile_id_seq'::regclass);


--
-- TOC entry 3356 (class 0 OID 159493)
-- Dependencies: 219
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- TOC entry 3358 (class 0 OID 159503)
-- Dependencies: 221
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- TOC entry 3364 (class 0 OID 159562)
-- Dependencies: 227
-- Data for Name: apis_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apis_event (id, title, schedule, description, created_at, picture, updated_at) FROM stdin;
\.


--
-- TOC entry 3366 (class 0 OID 159573)
-- Dependencies: 229
-- Data for Name: apis_gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apis_gallery (id, title, picture, created_at) FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 159597)
-- Dependencies: 235
-- Data for Name: apis_verificationtbl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apis_verificationtbl (id, email, code, status, created_at) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 159736)
-- Dependencies: 246
-- Data for Name: app_contacts_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_contacts_contact (id, firstname, middlename, lastname, email, tel1, tel2, user_id) FROM stdin;
\.


--
-- TOC entry 3385 (class 0 OID 159741)
-- Dependencies: 248
-- Data for Name: app_users_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_users_userprofile (id, middlename, phone, photo, user_id) FROM stdin;
\.


--
-- TOC entry 3346 (class 0 OID 159397)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3348 (class 0 OID 159407)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3344 (class 0 OID 159389)
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
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add social application	8	add_socialapp
30	Can change social application	8	change_socialapp
31	Can delete social application	8	delete_socialapp
32	Can view social application	8	view_socialapp
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application token	10	add_socialtoken
38	Can change social application token	10	change_socialtoken
39	Can delete social application token	10	delete_socialtoken
40	Can view social application token	10	view_socialtoken
41	Can add email address	11	add_emailaddress
42	Can change email address	11	change_emailaddress
43	Can delete email address	11	delete_emailaddress
44	Can view email address	11	view_emailaddress
45	Can add email confirmation	12	add_emailconfirmation
46	Can change email confirmation	12	change_emailconfirmation
47	Can delete email confirmation	12	delete_emailconfirmation
48	Can view email confirmation	12	view_emailconfirmation
49	Can add district	13	add_district
50	Can change district	13	change_district
51	Can delete district	13	delete_district
52	Can view district	13	view_district
53	Can add event	14	add_event
54	Can change event	14	change_event
55	Can delete event	14	delete_event
56	Can view event	14	view_event
57	Can add gallery	15	add_gallery
58	Can change gallery	15	change_gallery
59	Can delete gallery	15	delete_gallery
60	Can view gallery	15	view_gallery
61	Can add level of health system	16	add_levelofhealthsystem
62	Can change level of health system	16	change_levelofhealthsystem
63	Can delete level of health system	16	delete_levelofhealthsystem
64	Can view level of health system	16	view_levelofhealthsystem
65	Can add region	17	add_region
66	Can change region	17	change_region
67	Can delete region	17	delete_region
68	Can view region	17	view_region
69	Can add verification tbl	18	add_verificationtbl
70	Can change verification tbl	18	change_verificationtbl
71	Can delete verification tbl	18	delete_verificationtbl
72	Can view verification tbl	18	view_verificationtbl
73	Can add user profile	19	add_userprofile
74	Can change user profile	19	change_userprofile
75	Can delete user profile	19	delete_userprofile
76	Can view user profile	19	view_userprofile
77	Can add new	20	add_new
78	Can change new	20	change_new
79	Can delete new	20	delete_new
80	Can view new	20	view_new
81	Can add job info	21	add_jobinfo
82	Can change job info	21	change_jobinfo
83	Can delete job info	21	delete_jobinfo
84	Can view job info	21	view_jobinfo
85	Can add Token	22	add_token
86	Can change Token	22	change_token
87	Can delete Token	22	delete_token
88	Can view Token	22	view_token
89	Can add token	23	add_tokenproxy
90	Can change token	23	change_tokenproxy
91	Can delete token	23	delete_tokenproxy
92	Can view token	23	view_tokenproxy
\.


--
-- TOC entry 3350 (class 0 OID 159415)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	1234	\N	\N	aabalekuusimon78	\N	\N	aabalekuusimon78@gmail.com	\N	\N	2020-08-31 17:10:29+00
2	1234	\N	\N	cirjorge	\N	\N	cirjorge@gmail.com	\N	\N	2020-08-31 17:24:51+00
3	1234	\N	\N	nyefianutu	\N	\N	nyefianutu@gmail.com	\N	\N	2020-08-31 20:36:34+00
5	1234	\N	\N	abdulaa22	\N	\N	abdulaa22@gmail.com	\N	\N	2020-09-01 09:47:17+00
6	1234	\N	\N	naadada63	\N	\N	naadada63@gmail.com	\N	\N	2020-09-01 16:46:51+00
7	1234	\N	\N	ayichuruchristy	\N	\N	ayichuruchristy@yahoo.com	\N	\N	2020-09-01 16:49:18+00
9	1234	\N	\N	yelfaayire.vitus	\N	\N	yelfaayire.vitus@yahoo.com	\N	\N	2020-09-02 12:55:42+00
12	1234	\N	\N	sendtobboat	\N	\N	sendtobboat@yahoo.com	\N	\N	2020-09-02 15:18:04+00
13	1234	\N	\N	hanta1984	\N	\N	hanta1984@live.com	\N	\N	2020-09-02 15:50:48+00
14	1234	\N	\N	doris.millu84	\N	\N	doris.millu84@gmail.com	\N	\N	2020-09-02 17:07:17+00
15	1234	\N	\N	Baleripat	\N	\N	Baleripat@gmail.com 	\N	\N	2020-09-03 09:37:35+00
16	1234	\N	\N	julison10000	\N	\N	julison10000@gmail.com	\N	\N	2020-09-03 17:40:10+00
17	1234	\N	\N	braimahvivian	\N	\N	braimahvivian@mail.com	\N	\N	2020-09-03 21:16:52+00
18	1234	\N	\N	mshamir	\N	\N	mshamir@yahoo.com	\N	\N	2020-09-03 21:39:33+00
19	1234	\N	\N	babota1966	\N	\N	babota1966@gmail.com	\N	\N	2020-09-04 07:36:55+00
20	1234	\N	\N	ecurlz19	\N	\N	ecurlz19@gmail.com 	\N	\N	2020-09-04 07:58:49+00
21	1234	\N	\N	anchabafgh	\N	\N	anchabafgh@yahoo.com	\N	\N	2020-09-04 12:07:39+00
22	1234	\N	\N	asherifa24	\N	\N	asherifa24@yahoo.com	\N	\N	2020-09-04 16:30:22+00
23	1234	\N	\N	gcheyuo	\N	\N	gcheyuo@gmail.com 	\N	\N	2020-09-06 02:03:28+00
24	1234	\N	\N	hemmanuels	\N	\N	hemmanuels@gmail.com	\N	\N	2020-09-23 20:39:01+00
25	1234	\N	\N	horzul14	\N	\N	horzul14@gmail.com	\N	\N	2020-09-23 20:59:48+00
26	1234	\N	\N	ernestkasiedu	\N	\N	ernestkasiedu@yahoo.com	\N	\N	2020-09-23 21:20:52+00
27	1234	\N	\N	nooralwanga	\N	\N	nooralwanga@gmail.com 	\N	\N	2020-09-23 21:29:36+00
28	1234	\N	\N	gyesi2g3	\N	\N	gyesi2g3@gmail.com	\N	\N	2020-09-23 21:35:34+00
29	1234	\N	\N	sefajnr	\N	\N	sefajnr@gmail.com	\N	\N	2020-09-23 21:35:50+00
30	1234	\N	\N	mwintumahb	\N	\N	mwintumahb@yahoo.com 	\N	\N	2020-09-23 21:36:46+00
31	1234	\N	\N	Jwkfiagbe	\N	\N	Jwkfiagbe@gmail.com	\N	\N	2020-09-23 21:44:10+00
32	1234	\N	\N	oxygenbay	\N	\N	oxygenbay@yahoo.com	\N	\N	2020-09-23 22:24:15+00
33	1234	\N	\N	jamessoyelleh	\N	\N	jamessoyelleh@gmail.com	\N	\N	2020-09-23 22:24:29+00
34	1234	\N	\N	paulseidu36	\N	\N	paulseidu36@gmail.com	\N	\N	2020-09-24 03:31:17+00
36	1234	\N	\N	eberko85	\N	\N	eberko85@gmail.com	\N	\N	2020-09-24 09:29:33+00
37	1234	\N	\N	isaacyeboah276	\N	\N	isaacyeboah276@gmail.com	\N	\N	2020-09-24 09:39:31+00
38	1234	\N	\N	jaharthur2003	\N	\N	jaharthur2003@yahoo.com	\N	\N	2020-09-24 09:47:18+00
39	1234	\N	\N	yfenteng	\N	\N	yfenteng@yahoo.com	\N	\N	2020-09-24 10:40:03+00
40	1234	\N	\N	kunkus33	\N	\N	kunkus33@yahoo.com,  kunkus33@gmail.com	\N	\N	2020-09-24 11:36:15+00
41	1234	\N	\N	otuamic	\N	\N	otuamic@yahoo.co.uk	\N	\N	2020-09-24 11:43:28+00
42	1234	\N	\N	noahagbofu97	\N	\N	noahagbofu97@gmail.com	\N	\N	2020-09-24 12:06:01+00
43	1234	\N	\N	abrahamnum	\N	\N	abrahamnum@yahoo.com	\N	\N	2020-09-24 12:42:02+00
44	1234	\N	\N	obgracious	\N	\N	obgracious@gamail.com	\N	\N	2020-09-24 12:50:17+00
45	1234	\N	\N	kwam.emma	\N	\N	kwam.emma@yahoo.com	\N	\N	2020-09-24 13:15:23+00
47	1234	\N	\N	jummaitarl30	\N	\N	jummaitarl30@gmail.com	\N	\N	2020-09-24 13:23:44+00
48	1234	\N	\N	siehdaniel	\N	\N	siehdaniel@gmail.com	\N	\N	2020-09-24 13:26:41+00
49	1234	\N	\N	myakilo	\N	\N	myakilo@gmail.com 	\N	\N	2020-09-24 14:14:46+00
50	1234	\N	\N	jamesowusu80	\N	\N	jamesowusu80@yahoo.com	\N	\N	2020-09-24 14:18:06+00
51	1234	\N	\N	joenn143	\N	\N	joenn143@gmail.com	\N	\N	2020-09-24 14:36:52+00
52	1234	\N	\N	short23gh	\N	\N	short23gh@yahoo.com	\N	\N	2020-09-24 14:51:34+00
53	1234	\N	\N	chrisnoba	\N	\N	chrisnoba@gmail.com	\N	\N	2020-09-24 16:19:18+00
54	1234	\N	\N	nyawdan	\N	\N	nyawdan@gmail.com	\N	\N	2020-09-24 17:08:15+00
55	1234	\N	\N	rrmahama	\N	\N	rrmahama@gmail.com	\N	\N	2020-09-25 01:26:24+00
56	1234	\N	\N	kuffourbrago	\N	\N	kuffourbrago@yahoo.com	\N	\N	2020-09-25 06:53:54+00
57	1234	\N	\N	ndegoson	\N	\N	ndegoson@yahoo.co.uk	\N	\N	2020-09-25 10:35:49+00
58	1234	\N	\N	ages440	\N	\N	ages440@gmail.com	\N	\N	2020-09-25 11:00:58+00
61	1234	\N	\N	mananzumuroh73	\N	\N	mananzumuroh73@gmail.com	\N	\N	2020-09-25 13:43:24+00
63	1234	\N	\N	wewuguapiupeter	\N	\N	wewuguapiupeter@yahoo.com	\N	\N	2020-09-25 15:09:45+00
64	1234	\N	\N	sir.orison	\N	\N	sir.orison@gmail.com	\N	\N	2020-09-25 15:33:03+00
65	1234	\N	\N	eldzandu	\N	\N	eldzandu@gmail.com	\N	\N	2020-09-25 17:10:01+00
66	1234	\N	\N	belpah	\N	\N	belpah@yahoo.col	\N	\N	2020-09-25 18:50:15+00
67	1234	\N	\N	danielagudey	\N	\N	danielagudey@gmail.com	\N	\N	2020-09-26 03:50:53+00
69	1234	\N	\N	Kenpriama02	\N	\N	Kenpriama02@gmail.com 	\N	\N	2020-09-26 14:39:15+00
70	1234	\N	\N	indomieilliasu	\N	\N	indomieilliasu@gmail.com	\N	\N	2020-09-27 16:53:49+00
71	1234	\N	\N	gandorg007	\N	\N	gandorg007@gmail.com	\N	\N	2020-09-28 06:25:54+00
72	1234	\N	\N	macjonaskambe	\N	\N	macjonaskambe@yahoo.com	\N	\N	2020-09-28 11:04:25+00
73	1234	\N	\N	borenasa13	\N	\N	borenasa13@yahoo.com, borenasa1@gmail.com	\N	\N	2020-09-28 11:49:27+00
74	1234	\N	\N	tankorukj	\N	\N	tankorukj@gmail.com	\N	\N	2020-09-28 12:44:20+00
75	1234	\N	\N	hasana4iddi	\N	\N	hasana4iddi@gmail.com	\N	\N	2020-09-28 12:53:45+00
76	1234	\N	\N	sasasam338	\N	\N	sasasam338@gmail.com	\N	\N	2020-09-28 14:52:35+00
77	1234	\N	\N	tugpieldominic	\N	\N	tugpieldominic@gmail.com	\N	\N	2020-09-28 15:56:54+00
78	1234	\N	\N	akansiaksylvester	\N	\N	akansiaksylvester@ymail.com	\N	\N	2020-09-28 16:24:52+00
79	1234	\N	\N	dangboorpaul	\N	\N	dangboorpaul@gmail.com	\N	\N	2020-09-28 17:32:27+00
80	1234	\N	\N	joykaf2013	\N	\N	joykaf2013@gmail.com	\N	\N	2020-09-29 09:48:30+00
81	1234	\N	\N	dongdemza	\N	\N	dongdemza@gmail.com 	\N	\N	2020-09-29 11:25:43+00
82	1234	\N	\N	gkyeduodu	\N	\N	gkyeduodu@uhas.edu.gh	\N	\N	2020-09-29 11:54:48+00
83	1234	\N	\N	gregkofi	\N	\N	gregkofi@gmail.com	\N	\N	2020-09-29 15:22:20+00
84	1234	\N	\N	fortressfay	\N	\N	fortressfay@yahoo.com	\N	\N	2020-09-29 17:16:17+00
85	1234	\N	\N	doggypapa	\N	\N	doggypapa@yahoo.com	\N	\N	2020-09-29 17:59:02+00
86	1234	\N	\N	sakyigordon1984	\N	\N	sakyigordon1984@gmail.com	\N	\N	2020-09-29 21:01:22+00
87	1234	\N	\N	fmeeduah	\N	\N	fmeeduah@gmail.com 	\N	\N	2020-09-30 10:30:57+00
88	1234	\N	\N	kepahjames	\N	\N	kepahjames@yahoo.com	\N	\N	2020-09-30 13:38:48+00
89	1234	\N	\N	P .O . Box  TD 380, Takoradi 	\N	\N	P .O . Box  TD 380, Takoradi 	\N	\N	2020-09-30 15:08:48+00
90	1234	\N	\N	philipdebrah82	\N	\N	philipdebrah82@gmail.com	\N	\N	2020-09-30 15:10:14+00
91	1234	\N	\N	drkhumaloo	\N	\N	drkhumaloo@yahoo.com 	\N	\N	2020-09-30 18:54:04+00
92	1234	\N	\N	phoebebala55	\N	\N	phoebebala55@yahoo.com	\N	\N	2020-09-30 18:55:28+00
93	1234	\N	\N	nyjunior23	\N	\N	nyjunior23@gmail.com	\N	\N	2020-09-30 20:23:42+00
94	1234	\N	\N	irene.amedzro	\N	\N	irene.amedzro@gmail.com	\N	\N	2020-09-30 21:14:33+00
95	1234	\N	\N	soseiwusu21	\N	\N	soseiwusu21@gmail.com	\N	\N	2020-09-30 22:02:47+00
96	1234	\N	\N	albywhaj	\N	\N	albywhaj@gmail.com 	\N	\N	2020-09-30 22:55:33+00
97	1234	\N	\N	gideonoteng	\N	\N	gideonoteng@yahoo.com	\N	\N	2020-10-01 07:59:26+00
98	1234	\N	\N	robertnterful	\N	\N	robertnterful@yahoo.com	\N	\N	2020-10-01 08:33:55+00
99	1234	\N	\N	naomiasher82	\N	\N	naomiasher82@gmail.com	\N	\N	2020-10-01 08:50:50+00
100	1234	\N	\N	deeblaq25	\N	\N	deeblaq25@gmail.com	\N	\N	2020-10-01 09:32:40+00
101	1234	\N	\N	serwaaayiwa75	\N	\N	serwaaayiwa75@gmail.com	\N	\N	2020-10-01 10:35:06+00
102	1234	\N	\N	dsaneaidoo	\N	\N	dsaneaidoo@gmail.com	\N	\N	2020-10-01 13:43:54+00
103	1234	\N	\N	danisoman1979	\N	\N	danisoman1979@gmail.com	\N	\N	2020-10-05 11:25:54+00
104	1234	\N	\N	wklenyuie	\N	\N	wklenyuie@yahoo.com	\N	\N	2020-10-05 13:11:20+00
105	1234	\N	\N	nelsonamoro	\N	\N	nelsonamoro@yahoo.com	\N	\N	2020-10-05 14:43:52+00
106	1234	\N	\N	dzikpeemelia	\N	\N	dzikpeemelia@gmail.com	\N	\N	2020-10-06 10:26:56+00
107	1234	\N	\N	jonas1192009	\N	\N	jonas1192009@hotmail.com	\N	\N	2020-10-09 08:42:02+00
108	1234	\N	\N	fsnuvey	\N	\N	fsnuvey@gmail.com	\N	\N	2020-10-09 14:35:59+00
109	1234	\N	\N	mybalb327	\N	\N	mybalb327@gmail.com	\N	\N	2020-10-09 20:36:38+00
112	1234	\N	\N	gafaru.adam	\N	\N	gafaru.adam@gmail.com	\N	\N	2020-10-16 13:54:45+00
113	1234	\N	\N	Sarpongjohnson326	\N	\N	Sarpongjohnson326@gmail.com	\N	\N	2020-11-04 13:27:51+00
114	1234	\N	\N	Public health laboratory Box 99 Tamale NR	\N	\N	Public health laboratory Box 99 Tamale NR	\N	\N	2020-11-04 13:31:26+00
115	1234	\N	\N	jwkfiagbe	\N	\N	jwkfiagbe@gmail.com	\N	\N	2020-11-04 13:39:43+00
116	1234	\N	\N	etergu	\N	\N	etergu@gmail.com	\N	\N	2020-11-04 14:24:10+00
119	1234	\N	\N	issahkanton	\N	\N	issahkanton@gmail.com 	\N	\N	2020-11-04 15:21:12+00
120	1234	\N	\N	apinyelaa	\N	\N	apinyelaa@gmail.com	\N	\N	2020-11-04 15:21:17+00
121	1234	\N	\N	asigreyaw	\N	\N	asigreyaw@gmail.com	\N	\N	2020-11-04 15:33:52+00
122	1234	\N	\N	podmum2011	\N	\N	podmum2011@gmail.com	\N	\N	2020-11-04 15:37:26+00
123	1234	\N	\N	gyachen	\N	\N	gyachen@yahoo.com	\N	\N	2020-11-04 16:19:24+00
124	1234	\N	\N	cudjoealfred	\N	\N	cudjoealfred@yahoo.com	\N	\N	2020-11-04 16:59:31+00
125	1234	\N	\N	afukaahsimon	\N	\N	afukaahsimon@yahoo.com 	\N	\N	2020-11-04 20:15:56+00
126	1234	\N	\N	abuakwahdanielnanabanyin	\N	\N	abuakwahdanielnanabanyin@yahoo.com	\N	\N	2020-11-04 21:07:01+00
128	1234	\N	\N	arsulemana24	\N	\N	arsulemana24@gmail.co	\N	\N	2020-11-05 08:09:22+00
129	1234	\N	\N	nyuasuns	\N	\N	nyuasuns@gmail.com	\N	\N	2020-11-05 09:15:39+00
130	1234	\N	\N	peteraxt75	\N	\N	peteraxt75@gmail.com	\N	\N	2020-11-05 09:15:41+00
131	1234	\N	\N	Sapungukwasi	\N	\N	Sapungukwasi@yahoo.com	\N	\N	2020-11-05 11:07:47+00
132	1234	\N	\N	arisdomichael	\N	\N	arisdomichael@gmail.com	\N	\N	2020-11-05 11:16:47+00
133	1234	\N	\N	attmoattak	\N	\N	attmoattak@gmail.com 	\N	\N	2020-11-05 16:05:37+00
135	1234	\N	\N	adamanas	\N	\N	adamanas@yahoo.com	\N	\N	2020-11-06 10:16:45+00
136	1234	\N	\N	mayor425d	\N	\N	mayor425d@yahoo.com	\N	\N	2020-11-11 14:38:35+00
137	1234	\N	\N	ejoycelyn	\N	\N	ejoycelyn@gmail.com	\N	\N	2020-11-11 14:43:39+00
138	1234	\N	\N	oseigideon24	\N	\N	oseigideon24@gmail.com 	\N	\N	2020-11-11 16:00:15+00
139	1234	\N	\N	ageobeta38	\N	\N	ageobeta38@yahoo.com	\N	\N	2020-11-26 13:18:26+00
140	1234	\N	\N	abdulhamidabubakari	\N	\N	abdulhamidabubakari@yahoo.com 	\N	\N	2020-12-24 14:42:54+00
141	1234	\N	\N	anyimclement	\N	\N	anyimclement@gmail.com	\N	\N	2021-04-14 11:00:44+00
\.


--
-- TOC entry 3352 (class 0 OID 159425)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3354 (class 0 OID 159433)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3379 (class 0 OID 159697)
-- Dependencies: 242
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 3362 (class 0 OID 159554)
-- Dependencies: 225
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.district (id, district_name, region_id) FROM stdin;
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
-- TOC entry 3360 (class 0 OID 159530)
-- Dependencies: 223
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3342 (class 0 OID 159379)
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
7	sites	site
8	allauth	socialapp
9	allauth	socialaccount
10	allauth	socialtoken
11	account	emailaddress
12	account	emailconfirmation
13	apis	district
14	apis	event
15	apis	gallery
16	apis	levelofhealthsystem
17	apis	region
18	apis	verificationtbl
19	apis	userprofile
20	apis	new
21	apis	jobinfo
22	authtoken	token
23	authtoken	tokenproxy
\.


--
-- TOC entry 3340 (class 0 OID 159368)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-07-19 02:08:18.452341+00
2	auth	0001_initial	2021-07-19 02:08:18.959091+00
3	account	0001_initial	2021-07-19 02:08:20.889471+00
4	account	0002_email_max_length	2021-07-19 02:08:21.222887+00
5	admin	0001_initial	2021-07-19 02:08:21.391784+00
6	admin	0002_logentry_remove_auto_add	2021-07-19 02:08:21.570656+00
7	admin	0003_logentry_add_action_flag_choices	2021-07-19 02:08:21.590973+00
8	apis	0001_initial	2021-07-19 02:08:22.662869+00
9	contenttypes	0002_remove_content_type_name	2021-07-19 02:08:23.308141+00
10	auth	0002_alter_permission_name_max_length	2021-07-19 02:08:23.321175+00
11	auth	0003_alter_user_email_max_length	2021-07-19 02:08:23.346068+00
12	auth	0004_alter_user_username_opts	2021-07-19 02:08:23.371753+00
13	auth	0005_alter_user_last_login_null	2021-07-19 02:08:23.396677+00
14	auth	0006_require_contenttypes_0002	2021-07-19 02:08:23.40615+00
15	auth	0007_alter_validators_add_error_messages	2021-07-19 02:08:23.428119+00
16	auth	0008_alter_user_username_max_length	2021-07-19 02:08:23.528427+00
17	auth	0009_alter_user_last_name_max_length	2021-07-19 02:08:23.548984+00
18	auth	0010_alter_group_name_max_length	2021-07-19 02:08:23.569693+00
19	auth	0011_update_proxy_permissions	2021-07-19 02:08:23.60043+00
20	authtoken	0001_initial	2021-07-19 02:08:23.783891+00
21	authtoken	0002_auto_20160226_1747	2021-07-19 02:08:23.900661+00
22	authtoken	0003_tokenproxy	2021-07-19 02:08:23.918708+00
23	sessions	0001_initial	2021-07-19 02:08:24.083057+00
24	sites	0001_initial	2021-07-19 02:08:24.306244+00
25	sites	0002_alter_domain_unique	2021-07-19 02:08:24.440841+00
\.


--
-- TOC entry 3380 (class 0 OID 159715)
-- Dependencies: 243
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tnpnrqq97shstsqbcfk51q6zm06dd8cx	YjI4MTIwMzBmNDk2YzAzODBkNTg0MmEzNGJlZmNjMTE3ZWI5NjQ4Njp7Il9hdXRoX3VzZXJfaWQiOiIxNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwNWVmM2M0MjViMjk3MjY0ZWE0YmYwYmNkODE2NjllYzZlMjYwMTYifQ==	2021-07-17 16:26:13.397463+00
\.


--
-- TOC entry 3382 (class 0 OID 159727)
-- Dependencies: 245
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- TOC entry 3378 (class 0 OID 159629)
-- Dependencies: 241
-- Data for Name: jobinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobinfo (id, current_institution, job_title, employment_status, is_current, longitude, latitude, created_at, updated_at, district_id, level_of_health_system_id, region_id, user_id, user_profile_id) FROM stdin;
\.


--
-- TOC entry 3368 (class 0 OID 159581)
-- Dependencies: 231
-- Data for Name: level_of_health_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_of_health_system (id, level) FROM stdin;
1	National
2	Regional
3	District
\.


--
-- TOC entry 3376 (class 0 OID 159618)
-- Dependencies: 239
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, content, picture1, picture2, picture3, created_at, updated_at, user_id, user_profile_id) FROM stdin;
\.


--
-- TOC entry 3370 (class 0 OID 159589)
-- Dependencies: 233
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, region_name) FROM stdin;
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
-- TOC entry 3374 (class 0 OID 159605)
-- Dependencies: 237
-- Data for Name: userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userprofile (id, title, surname, firstname, sex, date_of_birth, phone1, phone2, is_trained_frontline, cohort_number_frontline, yr_completed_frontline, institution_enrolled_at_frontline, job_title_at_enroll_frontline, is_trained_intermediate, cohort_number_intermediate, yr_completed_intermediate, institution__enrolled_at_intermediate, job_title_at_enroll_intermediate, is_trained_advanced, cohort_number_advanced, yr_completed_advanced, institution_enrolled_at_advanced, job_title_at_enroll_advanced, status, created_at, updated_at, user_id) FROM stdin;
1	\N	Aabalekuu	Simon	Male	1982-03-10	207447446	249580197	No	\N	\N	\N	\N	Yes	1	2019-12-20	Ghana health service	Public health Officer (Disease control)	\N	\N	\N	\N	\N	pending approval	2020-08-31 17:10:29+00	\N	1
2	\N	Akowuah	George	Male	1986-12-14	207669398	541480231	No	\N	\N	\N	\N	Yes	1	2019-12-12	Regional Health Directorate, Upper East	Health Information	No	\N	\N	\N	\N	pending approval	2020-08-31 17:24:51+00	\N	2
3	\N	Mahama	Fuseini	Male	1971-01-21	244155009	\N	Yes	6	2016-09-30	District Health Directorate - Ghana Health Service	District Disease Control Officer	Yes	1	2019-12-12	District Health Directorate - Ghana Health Service	District Disease Control Officer	\N	\N	\N	\N	\N	pending approval	2020-08-31 20:36:34+00	\N	3
5	\N	Abdul-Rahaman	Abdul-Aziz	Male	1984-03-27	249408602	207979738	Yes	20	2019-12-10	WaterAid Ghana	Environmental Health Officer	Yes	15	2019-12-12	GFELT	Field Epidemiologist	No	\N	\N	\N	\N	pending approval	2020-09-01 09:47:17+00	\N	5
6	\N	Naada-Kogh	David	Male	1986-12-25	247661201	206727086	Yes	9	2018-05-03	Bawku Municipal Health Directorate/BawkuPresbyterian Hospital (GHS)	Disease Control officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-01 16:46:51+00	\N	6
7	\N	Ayichuru	Christiana	Female	1977-12-15	243986495	\N	Yes	9	2018-05-03	GHS	Ag PHN/HPO	Yes	9	2018-05-03	GHS	Ag PHN/HPO	No	\N	\N	\N	\N	pending approval	2020-09-01 16:49:18+00	\N	7
9	\N	NUO-IRE	Y VITUS	Male	1976-09-21	205005427	542605214	\N	\N	\N	\N	\N	Yes	1	2019-12-11	VSD	District veterinary Officer	\N	\N	\N	\N	\N	pending approval	2020-09-02 12:55:42+00	\N	9
12	\N	Boateng	Kwabena	Male	1984-08-28	209283996	243778556	Yes	9	2018-02-19	Ghana Health Service	Health Information Officer	No	9	2018-05-03	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-02 15:18:04+00	\N	12
13	\N	Amankwaa	Williams Fosu	Male	1984-03-28	242637718	207526304	Yes	9	2018-05-19	Ghana Health Service	Disease control	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-02 15:50:48+00	\N	13
14	\N	Millu Dekomwine	Doris	Female	1986-05-05	208296075	\N	Yes	9	2018-05-03	Ghana Health Service	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-02 17:07:17+00	\N	14
15	\N	Baleri 	Patricia 	Female	1990-10-09	240141196	\N	Yes	9	2018-05-03	Ghana Health Service 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-03 09:37:35+00	\N	15
16	\N	GODSON	JULIUS	Male	1984-04-24	244165545	553352551	Yes	9	2018-05-03	BAWKU PRESBYTERIAN HOSPITAL/ BAWKU MUNICIPAL HEALTH DIRECTORATE (GHS)	MEDICAL LABORATORY TECHNICIAN	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-03 17:40:10+00	\N	16
17	\N	Braimah	Vivian	Female	1961-10-23	243855076	\N	Yes	9	2018-05-03	Bawku Municipal Verterinary/ Agriculture	Technical officer verterinary	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-03 21:16:52+00	\N	17
18	\N	MOHAMMED	SHAMIR ALHASSAN	Male	1987-01-04	209728220	\N	Yes	\N	\N	FOOD AND DRUGS AUTHORITY	REGULATORY OFFICER	Yes	1	2019-12-11	FOOD AND DRUGS AUTHORITY	REGULATORY OFFICER	No	\N	\N	\N	\N	pending approval	2020-09-03 21:39:33+00	\N	18
19	\N	Baba	Awuni	Male	1970-03-13	243924152	207239709	No	\N	\N	\N	\N	Yes	1	2019-12-12	Ghana Health Service	Regional Disease Surveillance Officer	No	\N	\N	\N	\N	pending approval	2020-09-04 07:36:55+00	\N	19
20	\N	Boateng 	Ernest	Male	1990-12-15	549272360	506716523	No	\N	\N	\N	\N	Yes	1	2019-12-12	Veterinary services directorate 	Veterinary Officer 	No	\N	\N	\N	\N	pending approval	2020-09-04 07:58:49+00	\N	20
21	\N	Anchaba	Faustinus	Male	1977-09-25	246321063	209712924	No	\N	\N	\N	\N	Yes	1	2019-12-11	School of public health, Accra-Ghana	Field Epidemiologist 	No	\N	\N	\N	\N	pending approval	2020-09-04 12:07:39+00	\N	21
22	\N	Alhassan	Sherifa	Female	1985-10-25	248274850	208332336	Yes	6	2016-10-23	\N	regulatory officer	Yes	1	2019-10-28	food and drugs Authority	regulatory officer	No	\N	\N	\N	\N	pending approval	2020-09-04 16:30:22+00	\N	22
23	\N	Cheyuo	Gladys	Female	1976-06-12	243077368	206966562	No	\N	\N	\N	\N	Yes	2	2019-12-12	GHana Health Service	Public Heaelth Nurse	No	\N	\N	NA	NA	pending approval	2020-09-06 02:03:28+00	\N	23
24	\N	Hagyirah	Emmanuel	Male	1981-10-31	540749172	\N	Yes	\N	\N	Ghana Health Service	T.O Health Information	Yes	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-23 20:39:01+00	\N	24
25	\N	Hor	Zulkarnein Jnr	Male	1988-01-03	201380681	541582958	Yes	\N	2018-08-15	Municipal Health Directorate, Sissala East, Tumu	Municipal Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-23 20:59:48+00	\N	25
26	\N	Asiedu	Ernest Konadu	Male	2020-10-04	244461895	208287015	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	8	2016-06-30	National Catholic Health Service	Coordinator, Community and Institutional Care	pending approval	2020-09-23 21:20:52+00	\N	26
27	\N	Noora 	Charles Lwanga 	Male	1986-04-29	242209316	208776329	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	7	2015-07-31	University of Ghana 	Laboratorian 	pending approval	2020-09-23 21:29:36+00	\N	27
28	\N	ISSAHAKU GYESI	RAZAK	Male	2020-06-01	243263602	208264569	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	9	\N	Tamale Teaching Hospital	Medical Laboratory Scientist	pending approval	2020-09-23 21:35:34+00	\N	28
29	\N	Asante-Sefa	Solomon	Male	1980-12-17	244979600	\N	Yes	10	2018-05-16	Ghana Health Service / Laboratory	Principal Biomedical Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-23 21:35:50+00	\N	29
30	\N	MWINTUMAH 	Benjamin Maanuor 	Male	1989-07-09	204192110	543826251	Yes	14	2019-08-22	Ghana Health Service / Laboratory Development 	Biomedical Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-23 21:36:46+00	\N	30
31	\N	Fiagbe	Joseph	Male	1980-06-28	243836200	207999429	Yes	10	2018-05-16	University of Ghana	Public Health Officer -Disease Control	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-23 21:44:10+00	\N	31
32	\N	Wullar	Oxygen	Male	1975-06-14	243124789	208215406	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-12-12	University of Ghana 	Senior Public Health Officer	pending approval	2020-09-23 22:24:15+00	\N	32
33	\N	SOYELLEH	JAMES	Male	1974-03-06	543091954	205767684	Yes	12	2018-06-01	VETERINARY SERVICE DEPARTMENT	DISTRICT VETERINARY OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-23 22:24:29+00	\N	33
34	\N	SEIDU 	PAUL	Male	1989-07-22	245296233	503400788	Yes	\N	2018-08-15	GHANA HEALTH SERVICE	DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 03:31:17+00	\N	34
36	\N	BERKO	EMMANUEL	Male	1985-06-03	208882878	542639670	Yes	3	2018-11-01	LAWRA MUNICIPAL HOSPITAL	MEDICAL LABORATORY  SCIENTIST	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-24 09:29:33+00	\N	36
37	\N	Yeboah	Isaac	Male	1984-05-04	246221682	202360472	Yes	15	2019-12-12	Asunafo South Health Directorate	Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-24 09:39:31+00	\N	37
38	\N	Arthur	Atta	Male	1979-06-01	243564659	206315433	Yes	15	2019-12-12	Pru District Health Directorate	District Disease Surveillance Officer	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-24 09:47:18+00	\N	38
39	\N	DANSO	EDWARD FENTENG	Male	1968-10-31	540849171	208241094	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	1	2009-06-30	SCHOOL OF PUBLIC HEALTH/EPIDEMIOLOGY DEPARTMENT, LEGON, UNIVERSITY OF GHANA	SENIOR VETERINARY OFFICER	pending approval	2020-09-24 10:40:03+00	\N	39
40	\N	Adjei	Eric	Male	1973-06-20	244418523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	7	2015-11-01	SPH, EPID department	medical laboratory scientist	pending approval	2020-09-24 11:36:15+00	\N	40
41	\N	Mensah	Ebenezer Kofi 	Male	0066-07-16	244528615	244528615	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	4	0012-07-31	Sekondi Public Health Laboratory, Ghana Health Service 	Medical Laboratory Scientist	pending approval	2020-09-24 11:43:28+00	\N	41
42	\N	AGBOFU	NOAH	Male	1990-07-07	240557893	\N	Yes	\N	2018-08-08	UNIVERSITY OF GHANA/ SCHOOL OF PUBLIC HEALTH	FIELD EPIDEMIOLOGY 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-24 12:06:01+00	\N	42
43	\N	Num	Abraham	Male	1972-10-02	249765847	208598009	Yes	15	2019-12-12	Ghana Health Service/Pru East District Health Directorate	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 12:42:02+00	\N	43
44	\N	Obeng	Rahman	Male	1984-05-06	207422751	\N	Yes	\N	\N	Sissala West DHA	District Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 12:50:17+00	\N	44
45	\N	OSEI	EMMANUEL KWAME	Male	1984-02-24	249716390	209393448	Yes	15	2019-12-12	GHANA HEALTH SERVICE, KINTAMPO MUNICIPAL HEALTH DIRECTORATE	AG. PUBLIC HEALTH NURSE	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 13:15:23+00	\N	45
47	\N	Abdullai	Safiatu	Female	1980-11-07	244129644	\N	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-07-11	University of Ghana/ GFELTP	Nursing	pending approval	2020-09-24 13:23:44+00	\N	47
48	\N	Sieh	Daniel	Male	1984-07-29	242917363	242917363	Yes	15	2019-12-12	Ghana Health Services/Ministry of Health	 Health Information Officer	No	\N	\N	Ghana Health Services/Ministry of Health	Health Information Officer	No	\N	\N	Ghana Health Services/Ministry of Health	Health Information Officer	pending approval	2020-09-24 13:26:41+00	\N	48
49	\N	KWAKYE  (OWUSU)	MICHAEL 	Male	1975-06-10	209406624	557356854	Yes	13	2019-05-16	GHANA HEALTH SERVICE/DISEASE CONTROL UNIT	DISTRICT DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 14:14:46+00	\N	49
50	\N	OWUSU	JAMES	Male	1980-09-25	249151203	204591529	Yes	15	2019-12-12	KINTAMPO NORTH MUNICIPAL HEALTH DIRECTORATE	DISEASE CONTROL OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 14:18:06+00	\N	50
51	\N	Nanga	Joseph Nyindam	Male	1983-06-09	248977519	201316574	Yes	15	2019-12-12	Kintampo North Municipal Health Directorate	Senior technical Officer (Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 14:36:52+00	\N	51
52	\N	Ankomah	Albert	Male	1978-05-12	244470413	207944200	Yes	\N	\N	Food and Drugs Authority	Food Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-24 14:51:34+00	\N	52
53	\N	Kankpetinge	Christopher	Male	1984-12-15	548428898	504428898	Yes	11	2018-08-03	Ghana Health Service	Disease Control Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 16:19:18+00	\N	53
54	\N	NTI	DANIEL 	Male	1974-12-05	209122506	244724708	Yes	\N	2019-12-12	Food and Drugs Authority	Senior Regulatory Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-24 17:08:15+00	\N	54
55	\N	Mahama	Raymond Razak	Male	1987-03-31	244843539	207862120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-01	Tamale Teaching Hospital	Medical Laboratory Scientist	pending approval	2020-09-25 01:26:24+00	\N	55
56	\N	Ofosuhene	Abigail	Female	1981-09-05	261407099	558464625	Yes	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-07-31	University of Ghana, School of Public Health	Physician Assistant	pending approval	2020-09-25 06:53:54+00	\N	56
57	\N	Ndego	Abel	Male	1980-01-01	208435770	555347170	Yes	9	2018-05-02	Food and Drugs Authority	Regulatory Officer 1	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-25 10:35:49+00	\N	57
58	\N	Adutwum Asare	Richard	Male	1982-07-02	202235841	546818915	Yes	10	2018-05-16	Ghana Health Service 	Technical Officer (Disease Control )	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-25 11:00:58+00	\N	58
61	\N	Zumuroh	Danyuo Manan	Male	1992-03-07	540632547	209983331	Yes	12	2018-09-15	Ghana Health Service	Technical officer ( Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-25 13:43:24+00	\N	61
63	\N	Wewugu	Apiu Peter	Male	1976-03-23	203495645	242547146	Yes	14	2019-08-22	Veterinary Services Department	Assistant Chief Animal Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-25 15:09:45+00	\N	63
64	\N	Otchere	Godsway Orison	Male	1983-08-09	244907292	246810263	Yes	14	2019-08-22	Ghana Health Service	District Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-25 15:33:03+00	\N	64
65	\N	DZANDU	ELI	Male	1982-04-06	207821719	244016662	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	11	2019-07-31	UG-SPH	FIELD EPIDEMIOLOGIST	pending approval	2020-09-25 17:10:01+00	\N	65
66	\N	Ayepah 	Christabel 	Female	1980-11-09	206300443	559620488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	12	2019-07-31	Shama Health Center	Facility Head	pending approval	2020-09-25 18:50:15+00	\N	66
67	\N	Agudey	Daniel	Male	1970-03-28	208504122	208504122	Yes	2	2016-01-08	Regional Public Health Division	Regional Surveillance Officer	\N	\N	\N	\N	\N	Yes	11	2019-07-26	\N	Regional Malaria Focal Person	pending approval	2020-09-26 03:50:53+00	\N	67
69	\N	Amartey	Kenneth Nii	Male	1987-10-18	249881047	\N	Yes	15	2019-12-12	Pru East Health Directorate	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-26 14:39:15+00	\N	69
70	\N	Abubakari	Illiasu	Male	1983-05-06	543318990	594106062	Yes	15	2019-12-14	Veterinary Services Department	Animal Health Officer	No	\N	\N	\N	\N	No	\N	\N	Veterinary Services Department	Animal Health Officer	pending approval	2020-09-27 16:53:49+00	\N	70
71	\N	Agunga	Bruno Gandorg	Male	1979-10-06	246531448	246531448	Yes	14	2019-08-22	MHD, Nanumba North	MDCO	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 06:25:54+00	\N	71
72	\N	Kambe	MacJonas	Male	1983-04-04	243639008	505691691	Yes	10	2018-05-16	Ghana Health Service, Prestea Huni Valley Municipal Health Directorate	Public Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 11:04:25+00	\N	72
73	\N	Abubakari	Aliu	Male	1985-12-13	205338188	557070255	Yes	15	2019-12-12	Ghana Health Service	Technical Officer (Health Information)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 11:49:27+00	\N	73
74	\N	Tankoruk	Jeremiah	Male	1982-08-13	240775799	203529229	Yes	15	2019-12-13	GHS/ District Health Directorate 	Ag.Comnunity Health nusrse ( Ag PHN)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 12:44:20+00	\N	74
75	\N	Iddi	Hasana	Female	1992-10-09	545118063	507562133	Yes	14	2019-08-22	Regional Health Directorate/Disease Control and EPI unit 	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 12:53:45+00	\N	75
76	\N	AMANKWAAH	SAMUEL	Male	1989-04-10	541288594	546295331	Yes	13	2019-05-16	GHANA HEALTH DIRECTORATE/ DISTRICT HEALTH DIRECTORATE	HEALTH INFORMATION OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-28 14:52:35+00	\N	76
77	\N	Tugpiel	Dominic	Male	1975-07-03	208399811	247647875	No	\N	\N	\N	Environmental Health Analyst	Yes	1	2019-12-10	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 15:56:54+00	\N	77
78	\N	AKANSIAK	SYLVESTER	Male	1970-08-08	244850212	244850212	Yes	15	2019-12-12	GFELTP, 	DISTRICT VETERINARY OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-28 16:24:52+00	\N	78
79	\N	DANGBOOR	PAUL AABETERFAA	Male	1994-12-25	541439780	205105851	Yes	\N	2018-08-15	GHANA HEALTH SERVICE	HEALTH INFORMATION (TECHNICAL ASSISTANT)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-28 17:32:27+00	\N	79
80	\N	Banini	Rejoice	Female	1986-03-06	547138966	209433937	Yes	13	2019-05-16	Ghana Health Nurse	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-29 09:48:30+00	\N	80
81	\N	DONGDEM	ANTHONY ZUNUO	Male	1969-07-10	506531040	244219733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	1	2010-12-15	University of Ghana/Department of Epidemiology & Disease Control	Biomedical Scientist	pending approval	2020-09-29 11:25:43+00	\N	81
82	\N	Kye-Duodu	Gideon	Male	1976-09-20	244465259	208632324	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	4	2012-07-31	District Hospital, Begoro	Senior Biomedical Scientist	pending approval	2020-09-29 11:54:48+00	\N	82
83	\N	Amenuvegbe	Gregory	Male	0068-08-09	208163336	593201142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	10	2018-07-30	UHAS	Asst.Lecturer	pending approval	2020-09-29 15:22:20+00	\N	83
84	\N	Aku	Fortress	Female	1986-01-17	246121421	207984613	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	8	2016-06-30	Volta Regional Hospital	Biomedical Scientist	pending approval	2020-09-29 17:16:17+00	\N	84
85	\N	Aleungurah	Douglas	Male	1982-03-27	202862278	249477149	Yes	12	2018-08-15	District Health Directorate, Lambussie	Public Health Officer (Disease Control)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-29 17:59:02+00	\N	85
86	\N	Sakyi	Gordon	Male	1983-03-03	543935274	249014119	Yes	13	2019-05-16	Ghana Health Service	Public Health Officer(Disease Control)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-29 21:01:22+00	\N	86
87	\N	Eduah 	Felicia Maame Efua 	Female	1977-09-09	247250678	208758888	Yes	13	2020-05-05	Ahafo Ano South DHD	District Public Health Nurse 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-30 10:30:57+00	\N	87
88	\N	Kepah	James	Male	1986-12-07	248085724	\N	Yes	13	2019-05-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-30 13:38:48+00	\N	88
89	\N	Kwofie 	Vida Naana 	Female	1973-06-08	277117988	558112811	No	\N	\N	\N	\N	No	\N	\N	NA	NA	Yes	11	2019-11-12	University of Ghana, School of Public Health 	Midwife 	pending approval	2020-09-30 15:08:48+00	\N	89
90	\N	DEBRAH	SELORM	Male	1975-11-09	208870225	244791991	Yes	10	2018-05-16	VETERINARY SERVICES DEPARTMENT	VETERINARIAN	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-09-30 15:10:14+00	\N	90
91	\N	KUMA	GEORGE KHUMALO	Male	1976-06-14	244180430	208217527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	5	2013-07-30	Ghana Health Service	Medical Laboratory Scientist	pending approval	2020-09-30 18:54:04+00	\N	91
92	\N	Balagumyetime	Phoebe	Female	1968-07-06	243516077	\N	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	5	2017-07-31	Ghana Healrh service	District Director	pending approval	2020-09-30 18:55:28+00	\N	92
93	\N	Agyei	Yaw Fosu	Male	1987-07-23	265101012	544388568	Yes	13	2019-05-16	Ghana Health Service, Ejisu	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-30 20:23:42+00	\N	93
94	\N	Amedzro	Irene	Female	1982-06-14	208418471	242084455	Yes	2	2016-01-08	Ghana Health Service/Public Health Laboratory	Biomedical Scientist	No	\N	\N	\N	\N	Yes	11	2019-11-15	Ghana Health Service/Public Health Laboratory	Biomedical Scientist	pending approval	2020-09-30 21:14:33+00	\N	94
95	\N	Osei-Wusu	Sadick 	Male	1988-10-31	248824943	202449611	Yes	5	2019-12-12	\N	Health information officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-30 22:02:47+00	\N	95
96	\N	Whajah	Alberta Mali 	Female	1985-05-11	208604151	558518781	Yes	10	2018-05-16	Ghana Health Service 	Municipal public health nurse 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-09-30 22:55:33+00	\N	96
97	\N	Oteng	Gideon	Male	1986-12-30	242208827	200686195	No	\N	\N	\N	\N	No	\N	\N	\N	\N	Yes	10	2018-07-31	University of Ghana, School of Public Health, Department of Epidemiology and Disease Control	Biomedical Scientist	pending approval	2020-10-01 07:59:26+00	\N	97
98	\N	NTERFUL	ROBERT	Male	1981-10-17	246249488	202024939	Yes	10	2018-04-16	\N	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-01 08:33:55+00	\N	98
99	\N	Acquah	Naomi Nayoca	Female	1984-01-28	243446327	\N	Yes	10	2018-05-16	Ghana Health Service	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-01 08:50:50+00	\N	99
100	\N	Achirem Nyarko	Dennis	Male	1986-04-22	545142114	501162149	Yes	15	2019-12-12	Dormaa Municipal Health Directorate	Health Information Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-01 09:32:40+00	\N	100
101	\N	Ayiwa	Serwaa	Female	1975-09-19	208190317	544221899	Yes	15	2019-09-12	Municipal Health Directorate	Public Health Nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-01 10:35:06+00	\N	101
102	\N	Dsane-Aidoo	Paul Henry	Male	1986-06-28	242141600	\N	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-03	School of Public Health, GFELTP	Senior Medical Officer	pending approval	2020-10-01 13:43:54+00	\N	102
103	\N	Owusu-Amponsah	Daniel	Male	1979-03-24	550975844	504404900	Yes	15	2019-12-12	Ghana Field Epidemiology and Laboratory Training Program	Public Health Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-05 11:25:54+00	\N	103
104	\N	Klenyuie	Wisdom	Male	1981-08-29	242836665	207142936	Yes	11	2018-08-01	Ghana Health Service	Public Health Officer-Disease Control	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-05 13:11:20+00	\N	104
105	\N	Amoro	Nelson Ayamga	Male	0085-10-28	540747247	501382117	Yes	15	2019-12-12	Veterinary Services Directorate	Veterinary Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-05 14:43:52+00	\N	105
106	\N	DZIKPE 	EMILIA 	Female	1987-05-18	245188660	200288473	Yes	11	2018-08-01	GHS	PUBLIC HEALTH NURSE (AGT)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-06 10:26:56+00	\N	106
107	\N	Doogu	Jonas	Male	1984-10-10	244581769	505439065	Yes	14	2019-08-22	District Health Directorate (GHS)	Disease Control Officer (TO)	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-09 08:42:02+00	\N	107
108	\N	Nuvey	Francis	Male	1991-05-15	41715661462	504991496	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yes	11	2019-12-12	Korle Bu Teaching Hospital, Ministry of Health	Nurse	pending approval	2020-10-09 14:35:59+00	\N	108
109	\N	Bawa	Dr. Abdul-Latif Baako	Male	1990-06-27	205781030	544053885	Yes	14	2019-08-22	Ghana Health Service	Medical Laboratory Scientist	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-09 20:36:38+00	\N	109
112	\N	Adam	Gafaru Osman	Male	1986-02-06	207807776	246008457	Yes	14	2019-08-22	Food and Drugs Authority, Tamale office	Regulatory Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-10-16 13:54:45+00	\N	112
113	\N	Sarpong	Johnson	Male	1986-02-24	247791534	247791534	Yes	13	2019-05-02	Public Health - Disease Control Unit	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-04 13:27:51+00	\N	113
114	\N	Dombadoh 	Alentis Aba-ifaa 	Male	1980-05-16	243466361	205522102	Yes	14	2019-08-27	Uncertainty of Ghana 	Public health Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-04 13:31:26+00	\N	114
115	\N	FIAGBE	JOSEPH W.K	Male	1980-06-28	243836200	207999429	Yes	10	2018-05-15	SUAMAN HEALTH DIRECTORATE	PUBLIC HEALTH OFFICER -DC	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 13:39:43+00	\N	115
116	\N	Tergu	Eric	Male	1983-03-10	207416158	546561222	Yes	3	\N	3	Veterinarian	Yes	\N	2018-08-12	Veterinary service Department	Technical officer	No	\N	\N	\N	\N	pending approval	2020-11-04 14:24:10+00	\N	116
119	\N	KANTON 	ISSAH LURIWIE 	Male	1982-08-10	541107044	205164066	Yes	12	2018-08-15	SISSALA EAST MUNICIPAL HEALTH ADMINISTRATION 	AG. PUBLIC HEALTH NURSE 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-04 15:21:12+00	\N	119
120	\N	Apinyela	Andrews  Akanlebe	Male	1982-10-07	541190805	506016564	Yes	14	2019-08-16	Nanumba North Municipal Health Directorate,Ghana Health Service	Health Information Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 15:21:17+00	\N	120
121	\N	Asigre	David	Male	1985-08-25	249656290	507256404	Yes	13	2019-04-26	Ghana Health Service	Public health officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 15:33:52+00	\N	121
122	\N	Ohene Djan	Prince	Male	1986-12-31	249013088	\N	Yes	13	2019-05-15	Food and Drugs Authority	Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 15:37:26+00	\N	122
123	\N	Gyacham	Henry	Male	1984-11-23	244608080	506414130	Yes	14	2019-08-28	Food and Drugs Authority	Regulatory Officer	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 16:19:24+00	\N	123
124	\N	CUDJOE 	ALFRED	Male	1979-03-26	249741970	249741970	Yes	\N	2018-05-03	GHANA HEALTH SERVICE, UPPER EAST REGIONAL HOSPITAL	MEDICAL LABORATORY SCIENTIST	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-04 16:59:31+00	\N	124
125	\N	AFUKAAH 	SIMON 	Male	1984-12-20	277324012	202062808	Yes	9	2018-05-03	Ghana health  Service 	Health information  officer 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-04 20:15:56+00	\N	125
126	\N	Abuakwah 	Daniel Nanabanyin 	Male	1987-06-06	244486561	200852902	Yes	4	2018-07-15	Tumu Municipal hospital 	Medical laboratory scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-04 21:07:01+00	\N	126
128	\N	Sulemana	Abdul-Rsuf	Male	1989-06-05	245884557	502110683	Yes	14	2019-08-22	Bimbilla Hospital/ Laboratory deparment	Medical Laboratory Scientist 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-05 08:09:22+00	\N	128
129	\N	Nyuasun	Saani	Male	1983-03-23	249383515	207290380	Yes	1	2018-08-24	Ghana Health Service	Disease Control Officer	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-05 09:15:39+00	\N	129
130	\N	Apetorgbor	Peter	Male	1975-01-07	244946147	\N	Yes	14	2019-08-22	Ghana Health Service	Disease control 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-05 09:15:41+00	\N	130
131	\N	Apungu 	Samuel 	Male	1985-05-24	205359221	249611504	Yes	9	2018-05-28	Ghana health service 	Public health nurse	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-05 11:07:47+00	\N	131
132	\N	Asumadu	Gyetuah 	Male	1986-01-27	206156039	206156039	Yes	14	2019-08-22	University of Ghana 	Disease Control Officer 	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-05 11:16:47+00	\N	132
133	\N	AGBO 	TIMOTHY ATTA 	Male	1986-08-11	240646055	205524558	Yes	11	2018-07-29	University College of Ghana,  Legon	HEALTH INFORMATION OFFICER 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-05 16:05:37+00	\N	133
135	\N	ADAM	ANAS	Male	1986-12-23	206138785	248859976	Yes	14	2019-08-22	GHANA HEALTH SERVICE	DISTRICT HEALTH INFORMATION OFFICER	No	\N	\N	\N	\N	\N	\N	\N	\N	\N	pending approval	2020-11-06 10:16:45+00	\N	135
136	\N	Duah	Agyemang	Male	1987-12-02	200262072	240134880	Yes	15	2019-12-12	Laboratory	Biomedical scientist	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-11 14:38:35+00	\N	136
137	\N	Essel	Joycelyn	Female	1993-02-13	549754562	570283890	Yes	10	2018-05-15	GHS	Ag.PHN	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-11 14:43:39+00	\N	137
138	\N	Osei	Gideon 	Male	1991-06-20	546098320	546098320	Yes	15	2019-12-12	Dormaa MHD	Disease Control Officer 	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-11 16:00:15+00	\N	138
139	\N	AGYEMANG	KOFI BOATENG	Male	1971-04-02	266762942	201168555	Yes	13	2019-05-16	VETERINARY	ANIMAL HEALTH OFFICER	No	\N	\N	\N	\N	No	\N	\N	\N	\N	pending approval	2020-11-26 13:18:26+00	\N	139
140	\N	Abdul Hamid 	Abubakari 	Male	1990-04-04	541111604	506944402	Yes	9	2018-05-03	GHS/Bawku Municipal Health Directorate 	Health Information Officer 	No	9	2018-05-03	\N	\N	No	\N	\N	\N	\N	pending approval	2020-12-24 14:42:54+00	\N	140
141	\N	Anyim 	Clement 	Male	1986-12-13	249535356	200947923	Yes	9	2018-05-03	Food and Drugs Authority 	Regulatory Officer	Yes	1	2019-12-13	Food and Drugs Authority 	 Regulatory Officer	No	\N	\N	\N	\N	pending approval	2021-04-14 11:00:44+00	\N	141
\.


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 220
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 226
-- Name: apis_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apis_event_id_seq', 1, false);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 228
-- Name: apis_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apis_gallery_id_seq', 1, false);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 234
-- Name: apis_verificationtbl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apis_verificationtbl_id_seq', 1, false);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 247
-- Name: app_contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_contacts_contact_id_seq', 1, false);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 249
-- Name: app_users_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_users_userprofile_id_seq', 1, false);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 143, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 224
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.district_id_seq', 271, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 244
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 240
-- Name: jobinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobinfo_id_seq', 1, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 230
-- Name: level_of_health_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_of_health_system_id_seq', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 238
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 232
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 1, false);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 236
-- Name: userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userprofile_id_seq', 1, false);


--
-- TOC entry 3127 (class 2606 OID 159526)
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- TOC entry 3129 (class 2606 OID 159498)
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- TOC entry 3134 (class 2606 OID 159510)
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- TOC entry 3136 (class 2606 OID 159508)
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- TOC entry 3145 (class 2606 OID 159570)
-- Name: apis_event apis_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_event
    ADD CONSTRAINT apis_event_pkey PRIMARY KEY (id);


--
-- TOC entry 3147 (class 2606 OID 159578)
-- Name: apis_gallery apis_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_gallery
    ADD CONSTRAINT apis_gallery_pkey PRIMARY KEY (id);


--
-- TOC entry 3153 (class 2606 OID 159602)
-- Name: apis_verificationtbl apis_verificationtbl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apis_verificationtbl
    ADD CONSTRAINT apis_verificationtbl_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 159780)
-- Name: app_contacts_contact app_contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_contacts_contact
    ADD CONSTRAINT app_contacts_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 159782)
-- Name: app_users_userprofile app_users_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users_userprofile
    ADD CONSTRAINT app_users_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 159784)
-- Name: app_users_userprofile app_users_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users_userprofile
    ADD CONSTRAINT app_users_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 3099 (class 2606 OID 159695)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3104 (class 2606 OID 159459)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3107 (class 2606 OID 159412)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3101 (class 2606 OID 159402)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3094 (class 2606 OID 159445)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3096 (class 2606 OID 159394)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3115 (class 2606 OID 159430)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3118 (class 2606 OID 159474)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3109 (class 2606 OID 159420)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 159438)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3124 (class 2606 OID 159488)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3112 (class 2606 OID 159689)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3171 (class 2606 OID 159701)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 3173 (class 2606 OID 159703)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 3142 (class 2606 OID 159559)
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- TOC entry 3139 (class 2606 OID 159539)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3089 (class 2606 OID 159386)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3091 (class 2606 OID 159384)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 159376)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 159722)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3180 (class 2606 OID 159734)
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- TOC entry 3182 (class 2606 OID 159732)
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 3165 (class 2606 OID 159634)
-- Name: jobinfo jobinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 3149 (class 2606 OID 159586)
-- Name: level_of_health_system level_of_health_system_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_of_health_system
    ADD CONSTRAINT level_of_health_system_pkey PRIMARY KEY (id);


--
-- TOC entry 3159 (class 2606 OID 159626)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 159594)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 3155 (class 2606 OID 159613)
-- Name: userprofile userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprofile
    ADD CONSTRAINT userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 3157 (class 2606 OID 159615)
-- Name: userprofile userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprofile
    ADD CONSTRAINT userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 3125 (class 1259 OID 159527)
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- TOC entry 3130 (class 1259 OID 159517)
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- TOC entry 3131 (class 1259 OID 159524)
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- TOC entry 3132 (class 1259 OID 159523)
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- TOC entry 3185 (class 1259 OID 159795)
-- Name: app_contacts_contact_user_id_0c730d13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_contacts_contact_user_id_0c730d13 ON public.app_contacts_contact USING btree (user_id);


--
-- TOC entry 3097 (class 1259 OID 159696)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3102 (class 1259 OID 159460)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3105 (class 1259 OID 159461)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3092 (class 1259 OID 159446)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3113 (class 1259 OID 159476)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3116 (class 1259 OID 159475)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3119 (class 1259 OID 159490)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3122 (class 1259 OID 159489)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3110 (class 1259 OID 159690)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3169 (class 1259 OID 159709)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 3143 (class 1259 OID 159682)
-- Name: district_region_id_08d5327a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX district_region_id_08d5327a ON public.district USING btree (region_id);


--
-- TOC entry 3137 (class 1259 OID 159550)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3140 (class 1259 OID 159551)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3174 (class 1259 OID 159724)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3177 (class 1259 OID 159723)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3178 (class 1259 OID 159735)
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- TOC entry 3162 (class 1259 OID 159677)
-- Name: jobinfo_district_id_e9be7e97; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobinfo_district_id_e9be7e97 ON public.jobinfo USING btree (district_id);


--
-- TOC entry 3163 (class 1259 OID 159678)
-- Name: jobinfo_level_of_health_system_id_b72c62c6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobinfo_level_of_health_system_id_b72c62c6 ON public.jobinfo USING btree (level_of_health_system_id);


--
-- TOC entry 3166 (class 1259 OID 159679)
-- Name: jobinfo_region_id_bec492cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobinfo_region_id_bec492cd ON public.jobinfo USING btree (region_id);


--
-- TOC entry 3167 (class 1259 OID 159680)
-- Name: jobinfo_user_id_6b1db28b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobinfo_user_id_6b1db28b ON public.jobinfo USING btree (user_id);


--
-- TOC entry 3168 (class 1259 OID 159681)
-- Name: jobinfo_user_profile_id_90dbe1e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobinfo_user_profile_id_90dbe1e6 ON public.jobinfo USING btree (user_profile_id);


--
-- TOC entry 3160 (class 1259 OID 159650)
-- Name: news_user_id_f58d07aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_user_id_f58d07aa ON public.news USING btree (user_id);


--
-- TOC entry 3161 (class 1259 OID 159651)
-- Name: news_user_profile_id_30fda527; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_user_profile_id_30fda527 ON public.news USING btree (user_profile_id);


--
-- TOC entry 3197 (class 2606 OID 159511)
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3198 (class 2606 OID 159518)
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3211 (class 2606 OID 159801)
-- Name: app_contacts_contact app_contacts_contact_user_id_0c730d13_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_contacts_contact
    ADD CONSTRAINT app_contacts_contact_user_id_0c730d13_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3212 (class 2606 OID 159806)
-- Name: app_users_userprofile app_users_userprofile_user_id_b00b5c20_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_users_userprofile
    ADD CONSTRAINT app_users_userprofile_user_id_b00b5c20_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3192 (class 2606 OID 159453)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3191 (class 2606 OID 159448)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3190 (class 2606 OID 159439)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3194 (class 2606 OID 159468)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3193 (class 2606 OID 159463)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3196 (class 2606 OID 159482)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3195 (class 2606 OID 159477)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3210 (class 2606 OID 159710)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3201 (class 2606 OID 159683)
-- Name: district district_region_id_08d5327a_fk_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_region_id_08d5327a_fk_region_id FOREIGN KEY (region_id) REFERENCES public.region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3199 (class 2606 OID 159540)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3200 (class 2606 OID 159545)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3205 (class 2606 OID 159652)
-- Name: jobinfo jobinfo_district_id_e9be7e97_fk_district_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_district_id_e9be7e97_fk_district_id FOREIGN KEY (district_id) REFERENCES public.district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3206 (class 2606 OID 159657)
-- Name: jobinfo jobinfo_level_of_health_syst_b72c62c6_fk_level_of_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_level_of_health_syst_b72c62c6_fk_level_of_ FOREIGN KEY (level_of_health_system_id) REFERENCES public.level_of_health_system(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3207 (class 2606 OID 159662)
-- Name: jobinfo jobinfo_region_id_bec492cd_fk_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_region_id_bec492cd_fk_region_id FOREIGN KEY (region_id) REFERENCES public.region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3208 (class 2606 OID 159667)
-- Name: jobinfo jobinfo_user_id_6b1db28b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_user_id_6b1db28b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3209 (class 2606 OID 159672)
-- Name: jobinfo jobinfo_user_profile_id_90dbe1e6_fk_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobinfo
    ADD CONSTRAINT jobinfo_user_profile_id_90dbe1e6_fk_userprofile_id FOREIGN KEY (user_profile_id) REFERENCES public.userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3203 (class 2606 OID 159640)
-- Name: news news_user_id_f58d07aa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_id_f58d07aa_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3204 (class 2606 OID 159645)
-- Name: news news_user_profile_id_30fda527_fk_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_profile_id_30fda527_fk_userprofile_id FOREIGN KEY (user_profile_id) REFERENCES public.userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3202 (class 2606 OID 159635)
-- Name: userprofile userprofile_user_id_7b9586be_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userprofile
    ADD CONSTRAINT userprofile_user_id_7b9586be_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-07-19 02:53:43 GMT

--
-- PostgreSQL database dump complete
--

