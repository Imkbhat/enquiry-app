--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: enquiry; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA enquiry;


ALTER SCHEMA enquiry OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: commacat(text, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry.commacat(initialstr text, newstr text) RETURNS text
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF newstr IS NULL OR newstr = '' THEN
      RETURN initialstr;
    ELSIF initialstr = '' THEN
   RETURN newstr;
 ELSE
      RETURN initialstr || ', ' || newstr;
    END IF;
  END;
$$;


ALTER FUNCTION enquiry.commacat(initialstr text, newstr text) OWNER TO postgres;

--
-- Name: textcat_commacat(text); Type: AGGREGATE; Schema: enquiry; Owner: postgres
--

CREATE AGGREGATE enquiry.textcat_commacat(text) (
    SFUNC = enquiry.commacat,
    STYPE = text,
    INITCOND = ''
);


ALTER AGGREGATE enquiry.textcat_commacat(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: course; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.course (
    course_id integer NOT NULL,
    enquiry_contact_id integer,
    name character varying(100),
    fees numeric,
    institute_id integer
);


ALTER TABLE enquiry.course OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.course_course_id_seq OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.course_course_id_seq OWNED BY enquiry.course.course_id;


--
-- Name: enquiry; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry (
    enquiry_id integer NOT NULL,
    enquiry_contact_id integer,
    doe timestamp without time zone,
    next_cal_date timestamp without time zone,
    remark character varying(200),
    committed_fees numeric,
    last_update timestamp without time zone,
    institute_id integer,
    enquiry_src_id integer
);


ALTER TABLE enquiry.enquiry OWNER TO postgres;

--
-- Name: enquiry_address; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry_address (
    enquiry_address_id integer NOT NULL,
    detail character varying(200),
    city character varying(50),
    country character varying(45),
    zip_code character varying(100)
);


ALTER TABLE enquiry.enquiry_address OWNER TO postgres;

--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_address_enquiry_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_address_enquiry_address_id_seq OWNER TO postgres;

--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_address_enquiry_address_id_seq OWNED BY enquiry.enquiry_address.enquiry_address_id;


--
-- Name: enquiry_contact; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry_contact (
    enquiry_contact_id bigint NOT NULL,
    name character varying(200),
    email character varying(50),
    phone character varying(45),
    local_address integer,
    permanent_address integer
);


ALTER TABLE enquiry.enquiry_contact OWNER TO postgres;

--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_contact_enquiry_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_contact_enquiry_contact_id_seq OWNER TO postgres;

--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_contact_enquiry_contact_id_seq OWNED BY enquiry.enquiry_contact.enquiry_contact_id;


--
-- Name: enquiry_course; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry_course (
    enquiry_course_id integer NOT NULL,
    enquiry_id integer,
    enquiry_src_id integer,
    course_id integer
);


ALTER TABLE enquiry.enquiry_course OWNER TO postgres;

--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_course_enquiry_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_course_enquiry_course_id_seq OWNER TO postgres;

--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_course_enquiry_course_id_seq OWNED BY enquiry.enquiry_course.enquiry_course_id;


--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_enquiry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_enquiry_id_seq OWNER TO postgres;

--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_enquiry_id_seq OWNED BY enquiry.enquiry.enquiry_id;


--
-- Name: enquiry_followup; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry_followup (
    enquiry_followup_id integer NOT NULL,
    enquiry_id integer,
    doe timestamp without time zone,
    details character varying(200)
);


ALTER TABLE enquiry.enquiry_followup OWNER TO postgres;

--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_followup_enquiry_followup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_followup_enquiry_followup_id_seq OWNER TO postgres;

--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_followup_enquiry_followup_id_seq OWNED BY enquiry.enquiry_followup.enquiry_followup_id;


--
-- Name: enquiry_source; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.enquiry_source (
    enquiry_src_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE enquiry.enquiry_source OWNER TO postgres;

--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.enquiry_source_enquiry_src_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.enquiry_source_enquiry_src_id_seq OWNER TO postgres;

--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.enquiry_source_enquiry_src_id_seq OWNED BY enquiry.enquiry_source.enquiry_src_id;


--
-- Name: followup; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.followup (
    followup_id integer NOT NULL,
    doe date,
    detail character varying(100),
    enquiry_id integer
);


ALTER TABLE enquiry.followup OWNER TO postgres;

--
-- Name: followup_followup_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.followup_followup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.followup_followup_id_seq OWNER TO postgres;

--
-- Name: followup_followup_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.followup_followup_id_seq OWNED BY enquiry.followup.followup_id;


--
-- Name: institute; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.institute (
    institute_id integer NOT NULL,
    enquiry_contact_id integer,
    name character varying(200),
    doe date DEFAULT now()
);


ALTER TABLE enquiry.institute OWNER TO postgres;

--
-- Name: institute_institute_id_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry.institute_institute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry.institute_institute_id_seq OWNER TO postgres;

--
-- Name: institute_institute_id_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry.institute_institute_id_seq OWNED BY enquiry.institute.institute_id;


--
-- Name: sample; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry.sample (
    id bigint,
    name character varying(10)
);


ALTER TABLE enquiry.sample OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    contact_id integer,
    name character varying(100),
    fees numeric,
    institute_id integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_course_id_seq OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- Name: enquiry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry (
    enquiry_id integer NOT NULL,
    contact_id integer,
    doe timestamp without time zone,
    next_cal_date timestamp without time zone,
    remark character varying(200),
    committed_fees numeric,
    last_update timestamp without time zone,
    institute_id integer,
    enquiry_src_id integer
);


ALTER TABLE public.enquiry OWNER TO postgres;

--
-- Name: enquiry_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_address (
    enquiry_address_id integer NOT NULL,
    detail character varying(200),
    city character varying(50),
    country character varying(45),
    zip_code character varying(100)
);


ALTER TABLE public.enquiry_address OWNER TO postgres;

--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_address_enquiry_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_address_enquiry_address_id_seq OWNER TO postgres;

--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_address_enquiry_address_id_seq OWNED BY public.enquiry_address.enquiry_address_id;


--
-- Name: enquiry_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_contact (
    enquiry_contact_id integer NOT NULL,
    name character varying(200),
    email character varying(50),
    phone character varying(45),
    local_address integer,
    permanent_address integer
);


ALTER TABLE public.enquiry_contact OWNER TO postgres;

--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_contact_enquiry_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_contact_enquiry_contact_id_seq OWNER TO postgres;

--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_contact_enquiry_contact_id_seq OWNED BY public.enquiry_contact.enquiry_contact_id;


--
-- Name: enquiry_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_course (
    enquiry_course_id integer NOT NULL,
    enquiry_id integer,
    enquiry_src_id integer
);


ALTER TABLE public.enquiry_course OWNER TO postgres;

--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_course_enquiry_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_course_enquiry_course_id_seq OWNER TO postgres;

--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_course_enquiry_course_id_seq OWNED BY public.enquiry_course.enquiry_course_id;


--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_enquiry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_enquiry_id_seq OWNER TO postgres;

--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_enquiry_id_seq OWNED BY public.enquiry.enquiry_id;


--
-- Name: enquiry_followup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_followup (
    enquiry_followup_id integer NOT NULL,
    enquiry_id integer,
    doe timestamp without time zone,
    details character varying(200)
);


ALTER TABLE public.enquiry_followup OWNER TO postgres;

--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_followup_enquiry_followup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_followup_enquiry_followup_id_seq OWNER TO postgres;

--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_followup_enquiry_followup_id_seq OWNED BY public.enquiry_followup.enquiry_followup_id;


--
-- Name: enquiry_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_source (
    enquiry_src_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.enquiry_source OWNER TO postgres;

--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_source_enquiry_src_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_source_enquiry_src_id_seq OWNER TO postgres;

--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_source_enquiry_src_id_seq OWNED BY public.enquiry_source.enquiry_src_id;


--
-- Name: institute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institute (
    institute_id integer NOT NULL,
    contact_id integer,
    name character varying(200),
    doe timestamp without time zone DEFAULT now()
);


ALTER TABLE public.institute OWNER TO postgres;

--
-- Name: institute_institute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institute_institute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institute_institute_id_seq OWNER TO postgres;

--
-- Name: institute_institute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institute_institute_id_seq OWNED BY public.institute.institute_id;


--
-- Name: course course_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.course ALTER COLUMN course_id SET DEFAULT nextval('enquiry.course_course_id_seq'::regclass);


--
-- Name: enquiry enquiry_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry ALTER COLUMN enquiry_id SET DEFAULT nextval('enquiry.enquiry_enquiry_id_seq'::regclass);


--
-- Name: enquiry_address enquiry_address_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_address ALTER COLUMN enquiry_address_id SET DEFAULT nextval('enquiry.enquiry_address_enquiry_address_id_seq'::regclass);


--
-- Name: enquiry_contact enquiry_contact_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_contact ALTER COLUMN enquiry_contact_id SET DEFAULT nextval('enquiry.enquiry_contact_enquiry_contact_id_seq'::regclass);


--
-- Name: enquiry_course enquiry_course_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_course ALTER COLUMN enquiry_course_id SET DEFAULT nextval('enquiry.enquiry_course_enquiry_course_id_seq'::regclass);


--
-- Name: enquiry_followup enquiry_followup_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_followup ALTER COLUMN enquiry_followup_id SET DEFAULT nextval('enquiry.enquiry_followup_enquiry_followup_id_seq'::regclass);


--
-- Name: enquiry_source enquiry_src_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_source ALTER COLUMN enquiry_src_id SET DEFAULT nextval('enquiry.enquiry_source_enquiry_src_id_seq'::regclass);


--
-- Name: followup followup_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.followup ALTER COLUMN followup_id SET DEFAULT nextval('enquiry.followup_followup_id_seq'::regclass);


--
-- Name: institute institute_id; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.institute ALTER COLUMN institute_id SET DEFAULT nextval('enquiry.institute_institute_id_seq'::regclass);


--
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- Name: enquiry enquiry_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry ALTER COLUMN enquiry_id SET DEFAULT nextval('public.enquiry_enquiry_id_seq'::regclass);


--
-- Name: enquiry_address enquiry_address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_address ALTER COLUMN enquiry_address_id SET DEFAULT nextval('public.enquiry_address_enquiry_address_id_seq'::regclass);


--
-- Name: enquiry_contact enquiry_contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_contact ALTER COLUMN enquiry_contact_id SET DEFAULT nextval('public.enquiry_contact_enquiry_contact_id_seq'::regclass);


--
-- Name: enquiry_course enquiry_course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_course ALTER COLUMN enquiry_course_id SET DEFAULT nextval('public.enquiry_course_enquiry_course_id_seq'::regclass);


--
-- Name: enquiry_followup enquiry_followup_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_followup ALTER COLUMN enquiry_followup_id SET DEFAULT nextval('public.enquiry_followup_enquiry_followup_id_seq'::regclass);


--
-- Name: enquiry_source enquiry_src_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_source ALTER COLUMN enquiry_src_id SET DEFAULT nextval('public.enquiry_source_enquiry_src_id_seq'::regclass);


--
-- Name: institute institute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institute ALTER COLUMN institute_id SET DEFAULT nextval('public.institute_institute_id_seq'::regclass);


--
-- Data for Name: course; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.course (course_id, enquiry_contact_id, name, fees, institute_id) FROM stdin;
2	1	VTU	2000	1
3	\N	Engineering	500000	1
4	\N	Computer Science	677777	2
\.


--
-- Data for Name: enquiry; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry (enquiry_id, enquiry_contact_id, doe, next_cal_date, remark, committed_fees, last_update, institute_id, enquiry_src_id) FROM stdin;
1	1	\N	\N	Best Course	1000	\N	1	1
3	6	2020-01-30 00:00:00	\N	I need to complete engneeing in 4 days	677777	\N	2	3
4	7	2020-01-30 00:00:00	\N	sdsds	677777	\N	2	6
\.


--
-- Data for Name: enquiry_address; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry_address (enquiry_address_id, detail, city, country, zip_code) FROM stdin;
1	Kiran	Karnataka	India	577422
9	ShravanaBelagola	Hasan	India	577422
10	Hasan	Hasan	India	567888
11				\N
13	Shravanabelagola	\N	\N	\N
14	23532253423	\N	\N	\N
\.


--
-- Data for Name: enquiry_contact; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry_contact (enquiry_contact_id, name, email, phone, local_address, permanent_address) FROM stdin;
1	Kiran	kbs71190@gmail.com	9740594382	1	1
2	Bahubali College of Engineering	bce@gmail.com	9740594382	\N	9
3	Malnad College of Engineering	mce@mce.org	534532454532	\N	10
4				\N	11
6	Kiran	kbs711@gmail.com	526353332	\N	13
7	Kiran Udachan	kiranudachana@gmailcom	253623332	\N	14
\.


--
-- Data for Name: enquiry_course; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry_course (enquiry_course_id, enquiry_id, enquiry_src_id, course_id) FROM stdin;
1	1	1	\N
2	3	\N	4
3	4	\N	4
\.


--
-- Data for Name: enquiry_followup; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry_followup (enquiry_followup_id, enquiry_id, doe, details) FROM stdin;
\.


--
-- Data for Name: enquiry_source; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.enquiry_source (enquiry_src_id, name) FROM stdin;
3	Prajavani
2	UrbanPro 2
1	Test1
6	Kiran Udachan1
\.


--
-- Data for Name: followup; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.followup (followup_id, doe, detail, enquiry_id) FROM stdin;
1	2020-02-03	ddddds	3
2	2020-02-03	dddsdssddds	3
3	2020-02-03	ssdddsd	4
4	2020-02-03	dssddd	4
5	2020-02-03	sasssss	4
6	2020-02-03	sas	4
7	2020-02-03	sasassasss	4
8	2020-02-03	I want to get new job now	4
9	2020-02-03	Yo baby	3
\.


--
-- Data for Name: institute; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.institute (institute_id, enquiry_contact_id, name, doe) FROM stdin;
1	1	BCE	\N
2	2	Bahubali College of Engineering	2020-01-29
3	3	Malnad College of Engineering	2020-01-29
\.


--
-- Data for Name: sample; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--

COPY enquiry.sample (id, name) FROM stdin;
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, contact_id, name, fees, institute_id) FROM stdin;
\.


--
-- Data for Name: enquiry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry (enquiry_id, contact_id, doe, next_cal_date, remark, committed_fees, last_update, institute_id, enquiry_src_id) FROM stdin;
\.


--
-- Data for Name: enquiry_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_address (enquiry_address_id, detail, city, country, zip_code) FROM stdin;
1	Kiran	Karnataka	India	577422
\.


--
-- Data for Name: enquiry_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_contact (enquiry_contact_id, name, email, phone, local_address, permanent_address) FROM stdin;
\.


--
-- Data for Name: enquiry_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_course (enquiry_course_id, enquiry_id, enquiry_src_id) FROM stdin;
\.


--
-- Data for Name: enquiry_followup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_followup (enquiry_followup_id, enquiry_id, doe, details) FROM stdin;
\.


--
-- Data for Name: enquiry_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_source (enquiry_src_id, name) FROM stdin;
1	Test
2	Test
\.


--
-- Data for Name: institute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institute (institute_id, contact_id, name, doe) FROM stdin;
\.


--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.course_course_id_seq', 4, true);


--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_address_enquiry_address_id_seq', 14, true);


--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_contact_enquiry_contact_id_seq', 7, true);


--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_course_enquiry_course_id_seq', 3, true);


--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_enquiry_id_seq', 4, true);


--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_followup_enquiry_followup_id_seq', 1, false);


--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.enquiry_source_enquiry_src_id_seq', 6, true);


--
-- Name: followup_followup_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.followup_followup_id_seq', 9, true);


--
-- Name: institute_institute_id_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry.institute_institute_id_seq', 4, true);


--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 1, true);


--
-- Name: enquiry_address_enquiry_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_address_enquiry_address_id_seq', 1, true);


--
-- Name: enquiry_contact_enquiry_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_contact_enquiry_contact_id_seq', 1, false);


--
-- Name: enquiry_course_enquiry_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_course_enquiry_course_id_seq', 3, true);


--
-- Name: enquiry_enquiry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_enquiry_id_seq', 1, false);


--
-- Name: enquiry_followup_enquiry_followup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_followup_enquiry_followup_id_seq', 1, false);


--
-- Name: enquiry_source_enquiry_src_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_source_enquiry_src_id_seq', 2, true);


--
-- Name: institute_institute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institute_institute_id_seq', 1, false);


--
-- Name: enquiry_address enquiry_address_enquiry_address_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_address
    ADD CONSTRAINT enquiry_address_enquiry_address_id_key UNIQUE (enquiry_address_id);


--
-- Name: enquiry_contact enquiry_contact_enquiry_contact_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_contact
    ADD CONSTRAINT enquiry_contact_enquiry_contact_id_key UNIQUE (enquiry_contact_id);


--
-- Name: enquiry_course enquiry_course_enquiry_course_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_course
    ADD CONSTRAINT enquiry_course_enquiry_course_id_key UNIQUE (enquiry_course_id);


--
-- Name: enquiry enquiry_enquiry_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry
    ADD CONSTRAINT enquiry_enquiry_id_key UNIQUE (enquiry_id);


--
-- Name: enquiry_followup enquiry_followup_enquiry_followup_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_followup
    ADD CONSTRAINT enquiry_followup_enquiry_followup_id_key UNIQUE (enquiry_followup_id);


--
-- Name: enquiry_source enquiry_source_enquiry_src_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_source
    ADD CONSTRAINT enquiry_source_enquiry_src_id_key UNIQUE (enquiry_src_id);


--
-- Name: institute institute_institute_id_key; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.institute
    ADD CONSTRAINT institute_institute_id_key UNIQUE (institute_id);


--
-- Name: enquiry_address enquiry_address_enquiry_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_address
    ADD CONSTRAINT enquiry_address_enquiry_address_id_key UNIQUE (enquiry_address_id);


--
-- Name: enquiry_contact enquiry_contact_enquiry_contact_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_contact
    ADD CONSTRAINT enquiry_contact_enquiry_contact_id_key UNIQUE (enquiry_contact_id);


--
-- Name: enquiry_course enquiry_course_enquiry_course_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_course
    ADD CONSTRAINT enquiry_course_enquiry_course_id_key UNIQUE (enquiry_course_id);


--
-- Name: enquiry enquiry_enquiry_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry
    ADD CONSTRAINT enquiry_enquiry_id_key UNIQUE (enquiry_id);


--
-- Name: enquiry_followup enquiry_followup_enquiry_followup_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_followup
    ADD CONSTRAINT enquiry_followup_enquiry_followup_id_key UNIQUE (enquiry_followup_id);


--
-- Name: enquiry_source enquiry_source_enquiry_src_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_source
    ADD CONSTRAINT enquiry_source_enquiry_src_id_key UNIQUE (enquiry_src_id);


--
-- Name: institute institute_institute_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institute
    ADD CONSTRAINT institute_institute_id_key UNIQUE (institute_id);


--
-- Name: enquiry_contact enquiry_address_id_fk; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_contact
    ADD CONSTRAINT enquiry_address_id_fk FOREIGN KEY (permanent_address) REFERENCES enquiry.enquiry_address(enquiry_address_id) MATCH FULL;


--
-- Name: enquiry_course fk_enquiry_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_course
    ADD CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id) REFERENCES enquiry.enquiry(enquiry_id) ON DELETE CASCADE;


--
-- Name: enquiry_followup fk_enquiry_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_followup
    ADD CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id) REFERENCES enquiry.enquiry(enquiry_id) ON DELETE CASCADE;


--
-- Name: enquiry fk_enquiry_src_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry
    ADD CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id) REFERENCES enquiry.enquiry_source(enquiry_src_id) ON DELETE CASCADE;


--
-- Name: enquiry_course fk_enquiry_src_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry_course
    ADD CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id) REFERENCES enquiry.enquiry_source(enquiry_src_id) ON DELETE CASCADE;


--
-- Name: course fk_institute_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.course
    ADD CONSTRAINT fk_institute_id FOREIGN KEY (institute_id) REFERENCES enquiry.institute(institute_id) ON DELETE CASCADE;


--
-- Name: enquiry fk_institute_id; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry.enquiry
    ADD CONSTRAINT fk_institute_id FOREIGN KEY (institute_id) REFERENCES enquiry.institute(institute_id) ON DELETE CASCADE;


--
-- Name: enquiry_course fk_enquiry_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_course
    ADD CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id) REFERENCES public.enquiry(enquiry_id) ON DELETE CASCADE;


--
-- Name: enquiry_followup fk_enquiry_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_followup
    ADD CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id) REFERENCES public.enquiry(enquiry_id) ON DELETE CASCADE;


--
-- Name: enquiry fk_enquiry_src_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry
    ADD CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id) REFERENCES public.enquiry_source(enquiry_src_id) ON DELETE CASCADE;


--
-- Name: enquiry_course fk_enquiry_src_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_course
    ADD CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id) REFERENCES public.enquiry_source(enquiry_src_id) ON DELETE CASCADE;


--
-- Name: course fk_institute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT fk_institute_id FOREIGN KEY (institute_id) REFERENCES public.institute(institute_id) ON DELETE CASCADE;


--
-- Name: enquiry fk_institute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry
    ADD CONSTRAINT fk_institute_id FOREIGN KEY (institute_id) REFERENCES public.institute(institute_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
