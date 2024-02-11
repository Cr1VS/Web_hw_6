--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Debian 15.5-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-02-10 20:29:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = "UTF8";
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config("search_path", "", false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS "standard public schema";


SET default_tablespace = "";

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 17319)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer,
    subject_id integer,
    grade integer,
    grade_date date NOT NULL,
    CONSTRAINT grades_grade_check CHECK (((grade >= 0) AND (grade <= 100)))
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17318)
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 222
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- TOC entry 215 (class 1259 OID 17281)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(70) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17280)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 214
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 217 (class 1259 OID 17288)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    fullname character varying(70) NOT NULL,
    group_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17287)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 216
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 221 (class 1259 OID 17307)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    teacher_id integer
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17306)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 220
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 219 (class 1259 OID 17300)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    fullname character varying(70) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17299)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 218
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 3223 (class 2604 OID 17322)
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval("public.grades_id_seq"::regclass);


--
-- TOC entry 3219 (class 2604 OID 17284)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval("public.groups_id_seq"::regclass);


--
-- TOC entry 3220 (class 2604 OID 17291)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval("public.students_id_seq"::regclass);


--
-- TOC entry 3222 (class 2604 OID 17310)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval("public.subjects_id_seq"::regclass);


--
-- TOC entry 3221 (class 2604 OID 17303)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval("public.teachers_id_seq"::regclass);


--
-- TOC entry 3390 (class 0 OID 17319)
-- Dependencies: 223
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades (id, student_id, subject_id, grade, grade_date) FROM stdin;
1	1	1	98	2023-03-02
2	1	1	82	2023-04-19
3	1	1	81	2023-04-10
4	1	2	63	2023-10-17
5	1	2	65	2023-05-11
6	1	2	86	2023-11-09
7	1	3	80	2023-02-01
8	1	3	88	2023-02-26
9	1	3	92	2023-08-09
10	1	4	89	2023-02-20
11	1	4	97	2023-07-10
12	1	4	61	2023-02-20
13	1	5	65	2023-07-09
14	1	5	66	2023-02-19
15	1	5	75	2023-02-15
16	1	6	67	2023-10-08
17	1	6	71	2023-03-27
18	1	6	80	2023-12-11
19	1	7	93	2023-02-13
20	1	7	62	2023-05-22
21	1	7	85	2023-12-12
22	1	8	77	2023-05-08
23	1	8	77	2023-07-26
24	1	8	63	2023-09-20
25	2	1	91	2023-06-25
26	2	1	64	2023-12-16
27	2	1	82	2023-02-26
28	2	2	63	2023-04-24
29	2	2	85	2023-11-27
30	2	2	69	2023-08-18
31	2	3	80	2023-02-24
32	2	3	97	2023-05-20
33	2	3	82	2023-04-16
34	2	4	79	2023-03-25
35	2	4	88	2023-10-08
36	2	4	97	2023-01-08
37	2	5	61	2023-10-21
38	2	5	99	2023-10-13
39	2	5	82	2023-07-20
40	2	6	84	2023-12-12
41	2	6	67	2023-02-11
42	2	6	92	2023-09-09
43	2	7	88	2023-04-20
44	2	7	81	2023-04-22
45	2	7	65	2023-05-24
46	2	8	97	2023-06-10
47	2	8	67	2023-10-10
48	2	8	99	2023-02-17
49	3	1	81	2023-04-06
50	3	1	79	2023-12-15
51	3	1	100	2023-06-25
52	3	2	65	2023-01-23
53	3	2	95	2023-05-19
54	3	2	72	2023-04-01
55	3	3	100	2023-10-22
56	3	3	92	2023-08-08
57	3	3	74	2023-10-15
58	3	4	97	2023-04-25
59	3	4	90	2023-02-18
60	3	4	72	2023-08-19
61	3	5	65	2023-02-23
62	3	5	92	2023-11-24
63	3	5	71	2023-03-25
64	3	6	65	2023-12-06
65	3	6	69	2023-12-10
66	3	6	69	2023-06-16
67	3	7	75	2023-04-06
68	3	7	65	2023-07-07
69	3	7	85	2023-05-14
70	3	8	100	2023-06-23
71	3	8	88	2023-06-21
72	3	8	67	2023-07-27
73	4	1	82	2023-09-08
74	4	1	92	2023-02-05
75	4	1	97	2023-01-21
76	4	2	98	2023-12-01
77	4	2	67	2023-08-17
78	4	2	67	2023-04-16
79	4	3	97	2023-07-11
80	4	3	60	2023-09-09
81	4	3	74	2023-09-18
82	4	4	64	2023-11-20
83	4	4	64	2023-05-15
84	4	4	63	2023-09-26
85	4	5	63	2023-07-01
86	4	5	69	2023-04-20
87	4	5	99	2023-11-07
88	4	6	90	2023-02-15
89	4	6	87	2023-09-26
90	4	6	79	2023-03-01
91	4	7	80	2023-06-17
92	4	7	85	2023-10-12
93	4	7	66	2023-10-13
94	4	8	77	2023-04-05
95	4	8	83	2023-12-08
96	4	8	78	2023-10-05
97	5	1	63	2023-06-16
98	5	1	66	2023-12-16
99	5	1	72	2023-08-08
100	5	2	86	2023-09-08
101	5	2	81	2023-07-13
102	5	2	65	2023-09-26
103	5	3	87	2023-12-20
104	5	3	76	2023-07-13
105	5	3	65	2023-10-26
106	5	4	92	2023-03-10
107	5	4	76	2023-09-08
108	5	4	64	2023-07-11
109	5	5	71	2023-06-16
110	5	5	63	2023-06-26
111	5	5	77	2023-12-19
112	5	6	89	2023-06-26
113	5	6	80	2023-10-21
114	5	6	79	2023-07-15
115	5	7	93	2023-10-24
116	5	7	74	2023-06-26
117	5	7	96	2023-03-20
118	5	8	98	2023-09-15
119	5	8	94	2023-10-12
120	5	8	62	2023-06-09
121	6	1	92	2023-08-27
122	6	1	99	2023-09-04
123	6	1	95	2023-08-08
124	6	2	78	2023-08-20
125	6	2	64	2023-12-11
126	6	2	96	2023-05-13
127	6	3	74	2023-09-09
128	6	3	68	2023-08-23
129	6	3	70	2023-02-09
130	6	4	100	2023-01-23
131	6	4	99	2023-02-26
132	6	4	98	2023-12-13
133	6	5	93	2023-05-05
134	6	5	99	2023-02-26
135	6	5	92	2023-03-06
136	6	6	99	2023-02-13
137	6	6	98	2023-05-20
138	6	6	98	2023-04-07
139	6	7	61	2023-01-15
140	6	7	85	2023-02-04
141	6	7	68	2023-07-26
142	6	8	97	2023-02-21
143	6	8	91	2023-08-25
144	6	8	96	2023-04-02
145	7	1	93	2023-06-06
146	7	1	91	2023-11-12
147	7	1	87	2023-12-09
148	7	2	95	2023-03-18
149	7	2	87	2023-11-19
150	7	2	75	2023-09-14
151	7	3	94	2023-12-08
152	7	3	71	2023-03-11
153	7	3	69	2023-09-01
154	7	4	70	2023-01-16
155	7	4	91	2023-06-16
156	7	4	84	2023-01-17
157	7	5	67	2023-02-07
158	7	5	65	2023-05-14
159	7	5	85	2023-10-02
160	7	6	77	2023-07-26
161	7	6	82	2023-12-27
162	7	6	77	2023-02-11
163	7	7	87	2023-04-07
164	7	7	72	2023-04-03
165	7	7	80	2023-12-12
166	7	8	91	2023-01-25
167	7	8	91	2023-03-15
168	7	8	62	2023-07-16
169	8	1	80	2023-12-20
170	8	1	98	2023-08-03
171	8	1	62	2023-02-04
172	8	2	62	2023-07-05
173	8	2	83	2023-11-23
174	8	2	87	2023-12-16
175	8	3	64	2023-12-02
176	8	3	65	2023-11-08
177	8	3	62	2023-11-08
178	8	4	82	2023-07-14
179	8	4	94	2023-10-23
180	8	4	65	2023-10-23
181	8	5	73	2023-07-06
182	8	5	85	2023-10-23
183	8	5	82	2023-02-15
184	8	6	84	2023-03-24
185	8	6	67	2023-04-02
186	8	6	82	2023-05-02
187	8	7	90	2023-03-07
188	8	7	91	2023-08-08
189	8	7	60	2023-04-04
190	8	8	80	2023-02-21
191	8	8	65	2023-09-08
192	8	8	97	2023-12-19
193	9	1	97	2023-07-27
194	9	1	85	2023-06-15
195	9	1	83	2023-01-11
196	9	2	60	2023-10-02
197	9	2	76	2023-04-10
198	9	2	61	2023-06-02
199	9	3	65	2023-08-07
200	9	3	97	2023-06-14
201	9	3	67	2023-04-05
202	9	4	84	2023-11-26
203	9	4	85	2023-05-02
204	9	4	70	2023-09-15
205	9	5	100	2023-07-03
206	9	5	87	2023-07-19
207	9	5	61	2023-02-10
208	9	6	81	2023-02-17
209	9	6	82	2023-05-02
210	9	6	97	2023-05-12
211	9	7	65	2023-06-16
212	9	7	95	2023-03-16
213	9	7	78	2023-10-23
214	9	8	73	2023-10-26
215	9	8	76	2023-12-01
216	9	8	82	2023-02-23
217	10	1	69	2023-02-09
218	10	1	73	2023-05-19
219	10	1	97	2023-08-11
220	10	2	65	2023-05-23
221	10	2	90	2023-06-17
222	10	2	99	2023-01-03
223	10	3	98	2023-07-01
224	10	3	96	2023-05-24
225	10	3	89	2023-02-13
226	10	4	81	2023-01-01
227	10	4	73	2023-12-18
228	10	4	79	2023-08-27
229	10	5	73	2023-05-14
230	10	5	67	2023-09-10
231	10	5	75	2023-05-15
232	10	6	93	2023-01-06
233	10	6	72	2023-09-12
234	10	6	93	2023-02-25
235	10	7	87	2023-04-04
236	10	7	94	2023-06-05
237	10	7	79	2023-06-25
238	10	8	85	2023-06-13
239	10	8	96	2023-07-17
240	10	8	95	2023-07-27
241	11	1	61	2023-09-13
242	11	1	94	2023-06-06
243	11	1	80	2023-04-11
244	11	2	68	2023-01-23
245	11	2	73	2023-12-14
246	11	2	85	2023-09-08
247	11	3	76	2023-08-06
248	11	3	96	2023-07-10
249	11	3	99	2023-03-08
250	11	4	65	2023-09-10
251	11	4	62	2023-05-26
252	11	4	62	2023-10-21
253	11	5	73	2023-09-04
254	11	5	65	2023-11-25
255	11	5	84	2023-10-27
256	11	6	95	2023-05-06
257	11	6	61	2023-05-23
258	11	6	61	2023-02-09
259	11	7	70	2023-10-02
260	11	7	79	2023-06-06
261	11	7	75	2023-07-20
262	11	8	66	2023-06-16
263	11	8	73	2023-11-09
264	11	8	78	2023-02-14
265	12	1	60	2023-03-22
266	12	1	65	2023-08-01
267	12	1	70	2023-02-17
268	12	2	67	2023-06-14
269	12	2	84	2023-05-12
270	12	2	82	2023-08-26
271	12	3	79	2023-03-24
272	12	3	97	2023-07-15
273	12	3	79	2023-11-12
274	12	4	63	2023-12-07
275	12	4	96	2023-02-24
276	12	4	68	2023-09-16
277	12	5	80	2023-08-14
278	12	5	63	2023-11-15
279	12	5	90	2023-03-15
280	12	6	70	2023-04-02
281	12	6	93	2023-06-24
282	12	6	65	2023-05-16
283	12	7	100	2023-12-25
284	12	7	85	2023-07-18
285	12	7	62	2023-10-17
286	12	8	74	2023-04-02
287	12	8	91	2023-09-04
288	12	8	66	2023-08-11
289	13	1	78	2023-03-26
290	13	1	79	2023-09-07
291	13	1	85	2023-03-02
292	13	2	69	2023-10-26
293	13	2	95	2023-10-12
294	13	2	95	2023-02-19
295	13	3	63	2023-08-19
296	13	3	80	2023-09-08
297	13	3	68	2023-10-09
298	13	4	85	2023-11-27
299	13	4	78	2023-04-05
300	13	4	78	2023-02-08
301	13	5	97	2023-11-20
302	13	5	92	2023-07-14
303	13	5	72	2023-04-18
304	13	6	75	2023-06-03
305	13	6	84	2023-11-07
306	13	6	88	2023-06-22
307	13	7	95	2023-03-18
308	13	7	65	2023-10-15
309	13	7	87	2023-03-16
310	13	8	62	2023-06-02
311	13	8	64	2023-12-01
312	13	8	63	2023-01-27
313	14	1	98	2023-08-24
314	14	1	67	2023-02-04
315	14	1	97	2023-01-19
316	14	2	72	2023-06-02
317	14	2	97	2023-07-02
318	14	2	100	2023-05-20
319	14	3	61	2023-09-20
320	14	3	63	2023-04-01
321	14	3	87	2023-12-04
322	14	4	67	2023-11-26
323	14	4	77	2023-11-21
324	14	4	85	2023-09-09
325	14	5	80	2023-06-26
326	14	5	60	2023-10-12
327	14	5	84	2023-03-17
328	14	6	64	2023-11-14
329	14	6	61	2023-04-02
330	14	6	73	2023-11-22
331	14	7	76	2023-07-15
332	14	7	63	2023-03-10
333	14	7	98	2023-04-23
334	14	8	87	2023-08-12
335	14	8	72	2023-04-11
336	14	8	84	2023-08-17
337	15	1	88	2023-10-14
338	15	1	80	2023-11-08
339	15	1	61	2023-11-10
340	15	2	68	2023-02-27
341	15	2	74	2023-12-23
342	15	2	64	2023-04-17
343	15	3	83	2023-06-17
344	15	3	84	2023-06-02
345	15	3	72	2023-06-22
346	15	4	95	2023-10-13
347	15	4	89	2023-11-22
348	15	4	99	2023-04-03
349	15	5	74	2023-02-10
350	15	5	82	2023-02-21
351	15	5	89	2023-08-27
352	15	6	87	2023-01-06
353	15	6	84	2023-10-11
354	15	6	75	2023-08-20
355	15	7	95	2023-09-08
356	15	7	97	2023-02-09
357	15	7	95	2023-02-21
358	15	8	66	2023-02-21
359	15	8	81	2023-10-06
360	15	8	82	2023-12-04
361	16	1	69	2023-10-16
362	16	1	60	2023-09-14
363	16	1	96	2023-02-16
364	16	2	62	2023-01-22
365	16	2	100	2023-09-03
366	16	2	74	2023-04-11
367	16	3	84	2023-11-21
368	16	3	77	2023-02-09
369	16	3	74	2023-01-19
370	16	4	73	2023-08-01
371	16	4	66	2023-08-12
372	16	4	66	2023-09-03
373	16	5	85	2023-08-05
374	16	5	69	2023-11-19
375	16	5	71	2023-03-23
376	16	6	92	2023-03-24
377	16	6	83	2023-02-14
378	16	6	70	2023-08-07
379	16	7	66	2023-02-17
380	16	7	94	2023-06-04
381	16	7	72	2023-02-09
382	16	8	78	2023-06-20
383	16	8	93	2023-11-19
384	16	8	100	2023-07-20
385	17	1	95	2023-06-04
386	17	1	77	2023-07-27
387	17	1	60	2023-08-23
388	17	2	65	2023-09-24
389	17	2	99	2023-01-26
390	17	2	85	2023-09-07
391	17	3	70	2023-09-24
392	17	3	89	2023-05-05
393	17	3	69	2023-01-01
394	17	4	65	2023-05-06
395	17	4	92	2023-07-03
396	17	4	69	2023-02-17
397	17	5	85	2023-09-22
398	17	5	96	2023-11-13
399	17	5	79	2023-08-04
400	17	6	79	2023-10-25
401	17	6	67	2023-01-19
402	17	6	100	2023-05-03
403	17	7	86	2023-05-11
404	17	7	63	2023-12-06
405	17	7	68	2023-05-18
406	17	8	61	2023-11-21
407	17	8	81	2023-12-20
408	17	8	98	2023-12-21
409	18	1	64	2023-01-10
410	18	1	88	2023-10-20
411	18	1	94	2023-01-25
412	18	2	96	2023-10-25
413	18	2	81	2023-05-13
414	18	2	80	2023-03-21
415	18	3	85	2023-10-08
416	18	3	69	2023-10-03
417	18	3	63	2023-06-12
418	18	4	78	2023-01-05
419	18	4	75	2023-01-19
420	18	4	62	2023-12-16
421	18	5	94	2023-02-04
422	18	5	66	2023-01-06
423	18	5	94	2023-09-19
424	18	6	75	2023-03-16
425	18	6	97	2023-11-15
426	18	6	66	2023-01-16
427	18	7	82	2023-11-23
428	18	7	60	2023-08-12
429	18	7	87	2023-10-21
430	18	8	84	2023-11-27
431	18	8	62	2023-03-11
432	18	8	95	2023-08-05
433	19	1	96	2023-02-25
434	19	1	71	2023-11-11
435	19	1	66	2023-08-14
436	19	2	91	2023-12-22
437	19	2	89	2023-01-09
438	19	2	93	2023-03-08
439	19	3	72	2023-09-05
440	19	3	63	2023-01-23
441	19	3	93	2023-12-04
442	19	4	88	2023-07-03
443	19	4	98	2023-03-05
444	19	4	92	2023-10-12
445	19	5	62	2023-04-14
446	19	5	78	2023-11-20
447	19	5	91	2023-02-06
448	19	6	99	2023-10-10
449	19	6	90	2023-02-26
450	19	6	97	2023-04-26
451	19	7	99	2023-08-07
452	19	7	87	2023-03-24
453	19	7	74	2023-03-01
454	19	8	63	2023-08-20
455	19	8	98	2023-03-01
456	19	8	69	2023-05-04
457	20	1	95	2023-05-21
458	20	1	74	2023-07-05
459	20	1	76	2023-04-22
460	20	2	80	2023-10-19
461	20	2	60	2023-08-11
462	20	2	80	2023-07-09
463	20	3	83	2023-05-06
464	20	3	81	2023-01-11
465	20	3	94	2023-06-03
466	20	4	89	2023-03-04
467	20	4	63	2023-11-11
468	20	4	88	2023-01-09
469	20	5	63	2023-04-27
470	20	5	70	2023-11-13
471	20	5	66	2023-06-18
472	20	6	99	2023-06-27
473	20	6	80	2023-07-24
474	20	6	74	2023-08-14
475	20	7	77	2023-03-01
476	20	7	65	2023-08-10
477	20	7	71	2023-07-27
478	20	8	78	2023-08-11
479	20	8	99	2023-09-19
480	20	8	81	2023-08-24
481	21	1	65	2023-10-03
482	21	1	89	2023-11-26
483	21	1	86	2023-12-11
484	21	2	77	2023-11-15
485	21	2	77	2023-03-07
486	21	2	91	2023-10-21
487	21	3	75	2023-04-23
488	21	3	98	2023-09-11
489	21	3	81	2023-07-05
490	21	4	80	2023-11-17
491	21	4	81	2023-10-02
492	21	4	92	2023-08-11
493	21	5	74	2023-11-17
494	21	5	98	2023-11-18
495	21	5	78	2023-03-10
496	21	6	66	2023-02-11
497	21	6	82	2023-06-02
498	21	6	71	2023-10-02
499	21	7	68	2023-02-14
500	21	7	81	2023-02-26
501	21	7	95	2023-07-03
502	21	8	63	2023-01-21
503	21	8	62	2023-07-14
504	21	8	93	2023-05-22
505	22	1	62	2023-04-09
506	22	1	85	2023-12-21
507	22	1	93	2023-04-14
508	22	2	75	2023-09-18
509	22	2	60	2023-03-05
510	22	2	87	2023-11-18
511	22	3	95	2023-10-23
512	22	3	97	2023-02-25
513	22	3	61	2023-01-19
514	22	4	85	2023-10-08
515	22	4	75	2023-04-07
516	22	4	98	2023-06-16
517	22	5	75	2023-01-01
518	22	5	99	2023-04-11
519	22	5	79	2023-08-13
520	22	6	76	2023-07-10
521	22	6	91	2023-02-12
522	22	6	92	2023-01-03
523	22	7	92	2023-05-14
524	22	7	100	2023-01-19
525	22	7	97	2023-03-13
526	22	8	96	2023-08-01
527	22	8	66	2023-12-20
528	22	8	92	2023-03-05
529	23	1	90	2023-07-04
530	23	1	81	2023-07-19
531	23	1	67	2023-10-13
532	23	2	95	2023-11-13
533	23	2	69	2023-03-05
534	23	2	95	2023-03-15
535	23	3	91	2023-08-01
536	23	3	85	2023-11-27
537	23	3	61	2023-12-24
538	23	4	77	2023-05-25
539	23	4	77	2023-08-16
540	23	4	88	2023-09-26
541	23	5	84	2023-03-05
542	23	5	90	2023-08-07
543	23	5	71	2023-06-08
544	23	6	90	2023-09-02
545	23	6	61	2023-02-02
546	23	6	73	2023-02-01
547	23	7	84	2023-02-10
548	23	7	95	2023-10-05
549	23	7	77	2023-02-21
550	23	8	96	2023-09-24
551	23	8	71	2023-01-06
552	23	8	88	2023-06-20
553	24	1	92	2023-08-17
554	24	1	97	2023-03-14
555	24	1	78	2023-10-11
556	24	2	86	2023-06-23
557	24	2	67	2023-09-12
558	24	2	73	2023-01-05
559	24	3	62	2023-01-23
560	24	3	93	2023-11-10
561	24	3	91	2023-05-04
562	24	4	87	2023-05-14
563	24	4	64	2023-12-18
564	24	4	60	2023-07-07
565	24	5	86	2023-11-04
566	24	5	81	2023-09-22
567	24	5	85	2023-02-15
568	24	6	68	2023-07-22
569	24	6	91	2023-02-25
570	24	6	99	2023-08-24
571	24	7	90	2023-11-19
572	24	7	72	2023-06-07
573	24	7	88	2023-09-20
574	24	8	62	2023-02-27
575	24	8	73	2023-06-06
576	24	8	84	2023-11-19
577	25	1	69	2023-06-17
578	25	1	70	2023-12-08
579	25	1	98	2023-09-20
580	25	2	79	2023-08-13
581	25	2	75	2023-08-16
582	25	2	78	2023-12-18
583	25	3	83	2023-06-14
584	25	3	74	2023-04-07
585	25	3	97	2023-07-20
586	25	4	100	2023-06-24
587	25	4	69	2023-09-12
588	25	4	92	2023-01-18
589	25	5	69	2023-08-20
590	25	5	89	2023-10-02
591	25	5	77	2023-02-09
592	25	6	86	2023-04-05
593	25	6	78	2023-10-14
594	25	6	70	2023-09-01
595	25	7	83	2023-11-05
596	25	7	94	2023-05-10
597	25	7	88	2023-06-16
598	25	8	72	2023-02-13
599	25	8	82	2023-05-03
600	25	8	95	2023-04-27
601	26	1	62	2023-02-16
602	26	1	95	2023-10-07
603	26	1	71	2023-10-12
604	26	2	87	2023-06-27
605	26	2	70	2023-02-18
606	26	2	63	2023-06-11
607	26	3	94	2023-01-20
608	26	3	96	2023-04-04
609	26	3	87	2023-07-04
610	26	4	69	2023-01-16
611	26	4	72	2023-04-09
612	26	4	94	2023-09-04
613	26	5	81	2023-12-06
614	26	5	94	2023-10-19
615	26	5	71	2023-10-13
616	26	6	72	2023-02-24
617	26	6	88	2023-10-11
618	26	6	85	2023-08-13
619	26	7	100	2023-07-17
620	26	7	97	2023-04-17
621	26	7	91	2023-03-08
622	26	8	89	2023-12-02
623	26	8	67	2023-05-11
624	26	8	73	2023-12-17
625	27	1	67	2023-12-03
626	27	1	90	2023-01-04
627	27	1	78	2023-07-20
628	27	2	92	2023-01-04
629	27	2	88	2023-07-10
630	27	2	80	2023-08-19
631	27	3	65	2023-10-08
632	27	3	83	2023-09-24
633	27	3	60	2023-07-24
634	27	4	76	2023-08-07
635	27	4	64	2023-04-16
636	27	4	60	2023-12-13
637	27	5	75	2023-09-03
638	27	5	78	2023-06-11
639	27	5	99	2023-06-19
640	27	6	76	2023-12-20
641	27	6	99	2023-01-15
642	27	6	95	2023-07-26
643	27	7	89	2023-02-06
644	27	7	87	2023-10-27
645	27	7	93	2023-12-07
646	27	8	68	2023-07-08
647	27	8	86	2023-11-18
648	27	8	84	2023-05-18
649	28	1	90	2023-05-17
650	28	1	70	2023-08-16
651	28	1	92	2023-02-02
652	28	2	86	2023-02-03
653	28	2	79	2023-01-05
654	28	2	68	2023-02-24
655	28	3	88	2023-09-04
656	28	3	61	2023-09-01
657	28	3	74	2023-01-22
658	28	4	91	2023-03-06
659	28	4	87	2023-06-26
660	28	4	77	2023-07-21
661	28	5	86	2023-10-14
662	28	5	87	2023-11-12
663	28	5	83	2023-05-23
664	28	6	70	2023-08-20
665	28	6	99	2023-10-02
666	28	6	60	2023-09-20
667	28	7	75	2023-10-09
668	28	7	71	2023-02-20
669	28	7	100	2023-10-10
670	28	8	94	2023-12-02
671	28	8	99	2023-03-15
672	28	8	95	2023-04-23
673	29	1	97	2023-05-21
674	29	1	87	2023-04-26
675	29	1	68	2023-03-16
676	29	2	65	2023-08-12
677	29	2	93	2023-04-26
678	29	2	84	2023-07-01
679	29	3	82	2023-02-05
680	29	3	66	2023-02-09
681	29	3	83	2023-04-04
682	29	4	97	2023-07-17
683	29	4	69	2023-11-08
684	29	4	97	2023-06-01
685	29	5	90	2023-11-10
686	29	5	75	2023-01-26
687	29	5	74	2023-10-18
688	29	6	100	2023-02-13
689	29	6	89	2023-10-14
690	29	6	66	2023-08-09
691	29	7	62	2023-05-23
692	29	7	97	2023-06-20
693	29	7	88	2023-12-18
694	29	8	68	2023-01-05
695	29	8	89	2023-11-08
696	29	8	78	2023-05-17
697	30	1	97	2023-02-06
698	30	1	68	2023-11-07
699	30	1	93	2023-08-20
700	30	2	100	2023-02-08
701	30	2	77	2023-02-10
702	30	2	93	2023-10-25
703	30	3	86	2023-05-22
704	30	3	69	2023-09-26
705	30	3	89	2023-05-07
706	30	4	72	2023-07-06
707	30	4	95	2023-06-05
708	30	4	87	2023-04-22
709	30	5	88	2023-12-16
710	30	5	88	2023-05-10
711	30	5	99	2023-06-20
712	30	6	76	2023-02-16
713	30	6	86	2023-12-07
714	30	6	76	2023-06-17
715	30	7	65	2023-12-03
716	30	7	74	2023-09-01
717	30	7	73	2023-06-11
718	30	8	65	2023-06-22
719	30	8	98	2023-10-22
720	30	8	91	2023-01-10
721	31	1	69	2023-08-11
722	31	1	98	2023-04-22
723	31	1	70	2023-10-26
724	31	2	99	2023-04-13
725	31	2	98	2023-04-01
726	31	2	88	2023-12-21
727	31	3	93	2023-02-09
728	31	3	74	2023-03-13
729	31	3	73	2023-02-09
730	31	4	95	2023-08-07
731	31	4	65	2023-11-11
732	31	4	78	2023-05-25
733	31	5	99	2023-10-27
734	31	5	100	2023-10-05
735	31	5	86	2023-12-15
736	31	6	94	2023-07-24
737	31	6	65	2023-01-02
738	31	6	98	2023-03-14
739	31	7	65	2023-01-25
740	31	7	84	2023-05-22
741	31	7	92	2023-11-10
742	31	8	90	2023-02-24
743	31	8	64	2023-05-07
744	31	8	87	2023-09-27
745	32	1	64	2023-06-06
746	32	1	67	2023-10-05
747	32	1	68	2023-12-08
748	32	2	99	2023-02-16
749	32	2	82	2023-03-08
750	32	2	60	2023-04-20
751	32	3	87	2023-03-27
752	32	3	76	2023-05-01
753	32	3	78	2023-02-18
754	32	4	61	2023-05-11
755	32	4	93	2023-10-25
756	32	4	95	2023-10-02
757	32	5	70	2023-07-08
758	32	5	79	2023-01-26
759	32	5	87	2023-12-09
760	32	6	69	2023-06-02
761	32	6	68	2023-01-22
762	32	6	65	2023-02-07
763	32	7	74	2023-08-03
764	32	7	64	2023-03-24
765	32	7	70	2023-03-10
766	32	8	65	2023-08-25
767	32	8	85	2023-07-15
768	32	8	92	2023-07-10
769	33	1	91	2023-04-22
770	33	1	98	2023-01-21
771	33	1	68	2023-12-26
772	33	2	100	2023-06-07
773	33	2	77	2023-10-06
774	33	2	81	2023-09-01
775	33	3	66	2023-05-20
776	33	3	92	2023-05-27
777	33	3	94	2023-09-17
778	33	4	72	2023-04-27
779	33	4	60	2023-12-23
780	33	4	91	2023-09-10
781	33	5	74	2023-12-07
782	33	5	61	2023-08-09
783	33	5	79	2023-08-16
784	33	6	85	2023-08-09
785	33	6	65	2023-10-09
786	33	6	73	2023-03-16
787	33	7	72	2023-03-17
788	33	7	67	2023-09-20
789	33	7	90	2023-03-20
790	33	8	61	2023-07-09
791	33	8	96	2023-03-07
792	33	8	78	2023-04-22
793	34	1	74	2023-01-14
794	34	1	92	2023-09-04
795	34	1	72	2023-01-09
796	34	2	100	2023-06-21
797	34	2	82	2023-06-25
798	34	2	82	2023-09-11
799	34	3	95	2023-05-15
800	34	3	69	2023-10-27
801	34	3	67	2023-09-15
802	34	4	64	2023-01-21
803	34	4	71	2023-07-26
804	34	4	79	2023-12-05
805	34	5	86	2023-12-04
806	34	5	61	2023-01-21
807	34	5	94	2023-07-17
808	34	6	62	2023-11-19
809	34	6	86	2023-01-19
810	34	6	94	2023-02-16
811	34	7	98	2023-06-02
812	34	7	78	2023-09-07
813	34	7	92	2023-03-15
814	34	8	96	2023-09-27
815	34	8	84	2023-06-26
816	34	8	70	2023-11-08
817	35	1	64	2023-04-05
818	35	1	100	2023-12-25
819	35	1	84	2023-05-01
820	35	2	96	2023-04-26
821	35	2	74	2023-02-07
822	35	2	89	2023-12-13
823	35	3	94	2023-10-07
824	35	3	91	2023-11-24
825	35	3	63	2023-03-23
826	35	4	75	2023-07-24
827	35	4	86	2023-07-07
828	35	4	64	2023-09-02
829	35	5	75	2023-09-05
830	35	5	73	2023-12-04
831	35	5	82	2023-03-21
832	35	6	67	2023-04-14
833	35	6	70	2023-10-19
834	35	6	74	2023-01-27
835	35	7	71	2023-11-20
836	35	7	81	2023-05-11
837	35	7	74	2023-04-27
838	35	8	89	2023-07-22
839	35	8	91	2023-04-06
840	35	8	89	2023-05-17
841	36	1	95	2023-06-26
842	36	1	87	2023-06-13
843	36	1	72	2023-07-17
844	36	2	93	2023-10-06
845	36	2	92	2023-04-07
846	36	2	69	2023-11-12
847	36	3	76	2023-11-13
848	36	3	60	2023-06-03
849	36	3	81	2023-07-19
850	36	4	66	2023-08-18
851	36	4	72	2023-09-11
852	36	4	98	2023-02-23
853	36	5	73	2023-08-07
854	36	5	94	2023-06-21
855	36	5	76	2023-02-05
856	36	6	82	2023-09-24
857	36	6	79	2023-01-08
858	36	6	63	2023-10-27
859	36	7	66	2023-10-06
860	36	7	69	2023-06-13
861	36	7	75	2023-02-17
862	36	8	87	2023-05-04
863	36	8	92	2023-08-24
864	36	8	65	2023-12-09
865	37	1	76	2023-06-22
866	37	1	83	2023-07-23
867	37	1	82	2023-12-15
868	37	2	62	2023-01-10
869	37	2	60	2023-04-12
870	37	2	77	2023-07-24
871	37	3	73	2023-08-18
872	37	3	89	2023-03-18
873	37	3	92	2023-12-17
874	37	4	71	2023-06-08
875	37	4	92	2023-08-16
876	37	4	80	2023-09-06
877	37	5	86	2023-11-18
878	37	5	95	2023-05-25
879	37	5	64	2023-09-21
880	37	6	92	2023-11-02
881	37	6	66	2023-04-02
882	37	6	88	2023-07-24
883	37	7	81	2023-04-02
884	37	7	91	2023-04-07
885	37	7	97	2023-06-01
886	37	8	64	2023-01-19
887	37	8	93	2023-07-26
888	37	8	92	2023-11-02
889	38	1	93	2023-11-17
890	38	1	68	2023-03-17
891	38	1	63	2023-10-13
892	38	2	60	2023-04-15
893	38	2	70	2023-08-22
894	38	2	75	2023-10-12
895	38	3	88	2023-10-05
896	38	3	68	2023-07-16
897	38	3	75	2023-07-23
898	38	4	89	2023-09-12
899	38	4	80	2023-03-02
900	38	4	92	2023-08-22
901	38	5	95	2023-07-02
902	38	5	90	2023-03-05
903	38	5	73	2023-04-06
904	38	6	95	2023-08-11
905	38	6	62	2023-05-14
906	38	6	97	2023-06-09
907	38	7	60	2023-09-13
908	38	7	64	2023-09-22
909	38	7	61	2023-08-22
910	38	8	63	2023-03-11
911	38	8	89	2023-08-24
912	38	8	70	2023-10-04
913	39	1	74	2023-09-11
914	39	1	62	2023-04-08
915	39	1	73	2023-07-23
916	39	2	84	2023-07-12
917	39	2	74	2023-01-13
918	39	2	91	2023-10-03
919	39	3	80	2023-09-25
920	39	3	98	2023-01-07
921	39	3	73	2023-06-15
922	39	4	86	2023-08-09
923	39	4	80	2023-09-15
924	39	4	97	2023-08-22
925	39	5	99	2023-03-23
926	39	5	84	2023-07-27
927	39	5	69	2023-09-15
928	39	6	72	2023-05-14
929	39	6	75	2023-01-09
930	39	6	69	2023-05-21
931	39	7	94	2023-10-11
932	39	7	85	2023-07-20
933	39	7	96	2023-04-07
934	39	8	99	2023-05-13
935	39	8	75	2023-07-24
936	39	8	85	2023-05-14
937	40	1	82	2023-01-13
938	40	1	61	2023-01-01
939	40	1	90	2023-03-26
940	40	2	67	2023-12-22
941	40	2	85	2023-08-24
942	40	2	81	2023-02-02
943	40	3	87	2023-03-17
944	40	3	96	2023-08-27
945	40	3	78	2023-09-04
946	40	4	79	2023-04-13
947	40	4	100	2023-02-27
948	40	4	89	2023-11-19
949	40	5	97	2023-11-23
950	40	5	75	2023-07-27
951	40	5	61	2023-01-13
952	40	6	66	2023-02-16
953	40	6	70	2023-12-08
954	40	6	91	2023-05-23
955	40	7	78	2023-06-27
956	40	7	67	2023-06-20
957	40	7	93	2023-09-05
958	40	8	78	2023-01-10
959	40	8	67	2023-02-03
960	40	8	72	2023-04-10
961	41	1	62	2023-03-17
962	41	1	100	2023-10-07
963	41	1	69	2023-05-23
964	41	2	68	2023-05-01
965	41	2	94	2023-02-06
966	41	2	71	2023-11-20
967	41	3	61	2023-10-17
968	41	3	62	2023-07-24
969	41	3	80	2023-09-22
970	41	4	77	2023-04-21
971	41	4	77	2023-05-14
972	41	4	81	2023-08-25
973	41	5	66	2023-12-21
974	41	5	68	2023-05-21
975	41	5	95	2023-05-04
976	41	6	85	2023-07-10
977	41	6	70	2023-04-20
978	41	6	90	2023-05-11
979	41	7	80	2023-05-11
980	41	7	86	2023-04-13
981	41	7	61	2023-03-26
982	41	8	68	2023-08-09
983	41	8	81	2023-05-19
984	41	8	73	2023-04-17
985	42	1	89	2023-12-01
986	42	1	72	2023-01-27
987	42	1	97	2023-02-08
988	42	2	60	2023-04-18
989	42	2	84	2023-10-21
990	42	2	73	2023-06-11
991	42	3	67	2023-01-14
992	42	3	66	2023-11-20
993	42	3	79	2023-01-02
994	42	4	100	2023-04-13
995	42	4	63	2023-07-17
996	42	4	100	2023-07-16
997	42	5	72	2023-04-04
998	42	5	67	2023-04-24
999	42	5	74	2023-06-15
1000	42	6	76	2023-02-18
1001	42	6	77	2023-02-12
1002	42	6	89	2023-04-09
1003	42	7	99	2023-09-09
1004	42	7	63	2023-09-05
1005	42	7	61	2023-12-02
1006	42	8	73	2023-11-15
1007	42	8	77	2023-01-27
1008	42	8	73	2023-07-02
1009	43	1	78	2023-02-20
1010	43	1	66	2023-11-17
1011	43	1	64	2023-02-18
1012	43	2	95	2023-06-27
1013	43	2	85	2023-03-08
1014	43	2	76	2023-01-05
1015	43	3	63	2023-07-24
1016	43	3	65	2023-06-13
1017	43	3	74	2023-09-15
1018	43	4	66	2023-06-22
1019	43	4	83	2023-10-07
1020	43	4	84	2023-07-15
1021	43	5	61	2023-09-17
1022	43	5	92	2023-10-09
1023	43	5	73	2023-05-21
1024	43	6	90	2023-01-05
1025	43	6	85	2023-10-18
1026	43	6	87	2023-07-23
1027	43	7	89	2023-07-24
1028	43	7	83	2023-10-22
1029	43	7	97	2023-04-19
1030	43	8	92	2023-08-25
1031	43	8	96	2023-09-02
1032	43	8	63	2023-02-21
1033	44	1	80	2023-08-23
1034	44	1	74	2023-05-18
1035	44	1	90	2023-11-26
1036	44	2	78	2023-06-06
1037	44	2	82	2023-07-17
1038	44	2	81	2023-05-01
1039	44	3	97	2023-01-16
1040	44	3	71	2023-10-24
1041	44	3	96	2023-12-24
1042	44	4	100	2023-05-24
1043	44	4	66	2023-09-25
1044	44	4	92	2023-02-13
1045	44	5	72	2023-08-27
1046	44	5	61	2023-02-12
1047	44	5	71	2023-01-04
1048	44	6	62	2023-12-04
1049	44	6	99	2023-10-22
1050	44	6	83	2023-06-14
1051	44	7	85	2023-12-03
1052	44	7	92	2023-07-18
1053	44	7	68	2023-02-25
1054	44	8	86	2023-04-02
1055	44	8	79	2023-04-25
1056	44	8	76	2023-09-23
1057	45	1	66	2023-06-27
1058	45	1	71	2023-11-01
1059	45	1	100	2023-09-24
1060	45	2	97	2023-04-07
1061	45	2	95	2023-12-18
1062	45	2	100	2023-11-27
1063	45	3	94	2023-07-16
1064	45	3	64	2023-01-12
1065	45	3	78	2023-08-05
1066	45	4	94	2023-04-14
1067	45	4	87	2023-07-24
1068	45	4	90	2023-05-14
1069	45	5	90	2023-05-17
1070	45	5	85	2023-05-12
1071	45	5	98	2023-10-14
1072	45	6	90	2023-08-18
1073	45	6	61	2023-11-01
1074	45	6	65	2023-05-06
1075	45	7	95	2023-07-24
1076	45	7	100	2023-03-27
1077	45	7	64	2023-09-10
1078	45	8	71	2023-09-06
1079	45	8	88	2023-11-17
1080	45	8	99	2023-06-21
1081	46	1	69	2023-09-11
1082	46	1	94	2023-12-02
1083	46	1	79	2023-10-05
1084	46	2	79	2023-10-09
1085	46	2	78	2023-06-18
1086	46	2	91	2023-06-17
1087	46	3	75	2023-02-18
1088	46	3	71	2023-11-23
1089	46	3	74	2023-09-21
1090	46	4	75	2023-07-11
1091	46	4	91	2023-07-14
1092	46	4	63	2023-12-19
1093	46	5	67	2023-06-08
1094	46	5	93	2023-11-23
1095	46	5	88	2023-08-14
1096	46	6	68	2023-11-03
1097	46	6	97	2023-02-06
1098	46	6	88	2023-06-20
1099	46	7	66	2023-06-09
1100	46	7	98	2023-02-14
1101	46	7	74	2023-03-24
1102	46	8	73	2023-11-05
1103	46	8	86	2023-07-10
1104	46	8	80	2023-12-24
1105	47	1	72	2023-02-19
1106	47	1	74	2023-03-25
1107	47	1	89	2023-08-24
1108	47	2	86	2023-06-01
1109	47	2	92	2023-08-25
1110	47	2	73	2023-09-06
1111	47	3	97	2023-10-13
1112	47	3	72	2023-06-02
1113	47	3	62	2023-07-24
1114	47	4	75	2023-08-11
1115	47	4	76	2023-09-12
1116	47	4	95	2023-07-18
1117	47	5	91	2023-03-24
1118	47	5	80	2023-08-10
1119	47	5	76	2023-02-02
1120	47	6	81	2023-01-17
1121	47	6	72	2023-06-04
1122	47	6	60	2023-05-25
1123	47	7	97	2023-12-07
1124	47	7	88	2023-08-06
1125	47	7	65	2023-07-24
1126	47	8	88	2023-10-10
1127	47	8	80	2023-02-14
1128	47	8	95	2023-05-23
1129	48	1	75	2023-07-03
1130	48	1	60	2023-02-24
1131	48	1	98	2023-07-19
1132	48	2	97	2023-08-27
1133	48	2	91	2023-01-26
1134	48	2	100	2023-12-02
1135	48	3	78	2023-12-05
1136	48	3	65	2023-01-22
1137	48	3	80	2023-04-05
1138	48	4	64	2023-02-14
1139	48	4	71	2023-09-11
1140	48	4	69	2023-08-18
1141	48	5	89	2023-08-03
1142	48	5	96	2023-07-04
1143	48	5	100	2023-01-19
1144	48	6	100	2023-06-10
1145	48	6	96	2023-06-18
1146	48	6	92	2023-11-05
1147	48	7	100	2023-01-02
1148	48	7	65	2023-10-17
1149	48	7	80	2023-08-12
1150	48	8	72	2023-07-03
1151	48	8	72	2023-07-11
1152	48	8	94	2023-01-12
1153	49	1	78	2023-12-24
1154	49	1	86	2023-10-18
1155	49	1	84	2023-05-26
1156	49	2	90	2023-11-24
1157	49	2	98	2023-05-22
1158	49	2	72	2023-08-26
1159	49	3	91	2023-10-15
1160	49	3	99	2023-08-19
1161	49	3	81	2023-06-14
1162	49	4	73	2023-03-15
1163	49	4	81	2023-05-21
1164	49	4	83	2023-04-08
1165	49	5	86	2023-08-25
1166	49	5	82	2023-11-26
1167	49	5	92	2023-05-24
1168	49	6	74	2023-08-25
1169	49	6	90	2023-01-07
1170	49	6	99	2023-06-17
1171	49	7	70	2023-07-10
1172	49	7	65	2023-10-05
1173	49	7	71	2023-11-23
1174	49	8	60	2023-07-08
1175	49	8	64	2023-02-04
1176	49	8	87	2023-12-19
1177	50	1	78	2023-05-24
1178	50	1	84	2023-09-17
1179	50	1	90	2023-08-24
1180	50	2	90	2023-05-26
1181	50	2	84	2023-06-21
1182	50	2	67	2023-04-17
1183	50	3	90	2023-05-24
1184	50	3	63	2023-05-25
1185	50	3	93	2023-06-02
1186	50	4	89	2023-08-23
1187	50	4	69	2023-07-13
1188	50	4	68	2023-06-25
1189	50	5	71	2023-03-19
1190	50	5	60	2023-09-11
1191	50	5	96	2023-02-02
1192	50	6	93	2023-11-25
1193	50	6	100	2023-08-19
1194	50	6	78	2023-04-17
1195	50	7	71	2023-06-02
1196	50	7	87	2023-12-23
1197	50	7	91	2023-05-18
1198	50	8	95	2023-12-24
1199	50	8	91	2023-09-03
1200	50	8	62	2023-03-16
\.


--
-- TOC entry 3382 (class 0 OID 17281)
-- Dependencies: 215
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name) FROM stdin;
1	Group A
2	Group B
3	Group C
\.


--
-- TOC entry 3384 (class 0 OID 17288)
-- Dependencies: 217
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, fullname, group_id) FROM stdin;
1	John Roberts	2
2	Mitchell Garcia	1
3	Erica Miller	3
4	Patricia Warren	1
5	Adam Campbell	2
6	Teresa Sharp	3
7	Amber Stephens	1
8	Sharon Carter	1
9	Robert Murray	3
10	Richard Shea	1
11	Jeremiah Thompson	2
12	Francisco Davis	2
13	Katelyn Gilbert	2
14	Justin Novak	2
15	Matthew Reed	2
16	Lawrence Morales	3
17	Gregory Willis	2
18	Toni Rose	3
19	Kelly Richmond	2
20	Edward Rasmussen	3
21	Sandy Green	3
22	Becky White	1
23	Julia Mcclure	3
24	Kayla Collier	3
25	Stephen Bailey	1
26	Elijah Johnson	3
27	Kyle Good	1
28	Joseph Clark	2
29	Calvin Massey	2
30	Ashley Webb	2
31	Mike Robinson	3
32	Denise Knapp	1
33	Matthew Becker	3
34	Arthur Carson	3
35	Kristin Campbell	2
36	Jay Arnold	2
37	Caitlin Martinez	1
38	Robert Duke	3
39	Krystal Leonard	2
40	Melissa Garcia	2
41	Amanda Small	2
42	Eileen Cole	2
43	Dana Patterson	2
44	Tyler Martin	3
45	Ian Romero	3
46	Mrs. Lisa Brown	2
47	Michael Brown	1
48	Ann Jones	2
49	Jessica Olsen	3
50	Joseph Walker	2
\.


--
-- TOC entry 3388 (class 0 OID 17307)
-- Dependencies: 221
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name, teacher_id) FROM stdin;
1	Mathematics	1
2	Physics	2
3	Chemistry	3
4	Biology	4
5	History	5
6	Geograph	6
7	Literature	7
8	Computer Science	8
\.


--
-- TOC entry 3386 (class 0 OID 17300)
-- Dependencies: 219
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, fullname) FROM stdin;
1	Sharon Johnson
2	James Salazar
3	Ann Velasquez
4	Paul George
5	Samantha Ellis
6	Dennis Nelson
7	Shannon Malone
8	Kyle Wilson
\.


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 222
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval("public.grades_id_seq", 1200, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 214
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval("public.groups_id_seq", 3, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval("public.students_id_seq", 50, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 220
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval("public.subjects_id_seq", 8, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 218
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval("public.teachers_id_seq", 8, true);


--
-- TOC entry 3234 (class 2606 OID 17325)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 17286)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 17293)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 17312)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 17305)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 17326)
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- TOC entry 3238 (class 2606 OID 17331)
-- Name: grades grades_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 3235 (class 2606 OID 17294)
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 3236 (class 2606 OID 17313)
-- Name: subjects subjects_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


-- Completed on 2024-02-10 20:29:38

--
-- PostgreSQL database dump complete
--
