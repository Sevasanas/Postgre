
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Ubuntu 12.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.10 (Ubuntu 12.10-1.pgdg20.04+1)

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
-- Name: buyers; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.buyers (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    surname character varying(250) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public.buyers OWNER TO gb_user;

--
-- Name: buyers_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.buyers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buyers_id_seq OWNER TO gb_user;

--
-- Name: buyers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.buyers_id_seq OWNED BY public.buyers.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.cart (
    id_product integer NOT NULL,
    id_buyer integer NOT NULL,
    price integer,
    count integer
);


ALTER TABLE public.cart OWNER TO gb_user;

--
-- Name: delivery; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.delivery (
    id integer NOT NULL,
    id_buyer integer NOT NULL,
    address character varying(250) NOT NULL
);


ALTER TABLE public.delivery OWNER TO gb_user;

--
-- Name: delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_id_seq OWNER TO gb_user;

--
-- Name: delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.delivery_id_seq OWNED BY public.delivery.id;


--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.manufacturer OWNER TO gb_user;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturer_id_seq OWNER TO gb_user;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    date timestamp without time zone,
    id_buyer integer NOT NULL,
    id_product integer NOT NULL,
    id_payment integer NOT NULL,
    status_order integer NOT NULL,
    id_delivery integer NOT NULL
);


ALTER TABLE public.orders OWNER TO gb_user;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO gb_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.payment OWNER TO gb_user;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO gb_user;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    price integer,
    in_stock boolean,
    description text,
    id_manufacturer integer,
    url character varying(250) NOT NULL,
    extra_options jsonb
);


ALTER TABLE public.products OWNER TO gb_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO gb_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    id_product integer,
    description text
);


ALTER TABLE public.recipes OWNER TO gb_user;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO gb_user;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    id_buyer integer NOT NULL,
    reviewe text
);


ALTER TABLE public.reviews OWNER TO gb_user;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO gb_user;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: status_order; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.status_order (
    id integer NOT NULL,
    status_order character varying(50)
);


ALTER TABLE public.status_order OWNER TO gb_user;

--
-- Name: status_order_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.status_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_order_id_seq OWNER TO gb_user;

--
-- Name: status_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.status_order_id_seq OWNED BY public.status_order.id;


--
-- Name: buyers id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.buyers ALTER COLUMN id SET DEFAULT nextval('public.buyers_id_seq'::regclass);


--
-- Name: delivery id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.delivery ALTER COLUMN id SET DEFAULT nextval('public.delivery_id_seq'::regclass);


--
-- Name: manufacturer id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: status_order id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.status_order ALTER COLUMN id SET DEFAULT nextval('public.status_order_id_seq'::regclass);


--
-- Data for Name: buyers; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.buyers (id, name, surname, email, phone) FROM stdin;
1       Derek   Gutierrez       odio@hotmail.net        (456) 614-7972
2       Quynn   Sampson cras.convallis@aol.couk 1-520-658-2948
3       Beau    Buck    vivamus.nibh@yahoo.couk 1-275-628-3736
4       Claudia Rice    mauris.sagittis@google.ca       (810) 244-5071
5       Hashim  O'donnell       sed@outlook.net 1-502-163-8648
6       Ethan   Glover  cursus@yahoo.edu        (684) 302-9848
7       Ferdinand       Moore   gravida.molestie@google.com     (366) 211-6380
8       Sebastian       Kennedy eros.nec.tellus@google.com      (783) 334-6844
9       Robert  Santana rhoncus.nullam@aol.net  (365) 837-5477
10      Rhiannon        Stafford        adipiscing@google.org   (269) 533-2847
11      Barbara Fry     aliquam@aol.ca  (555) 506-4606
12      Silas   Crawford        lacinia.sed.congue@hotmail.com  (573) 411-1473
13      Duncan  Sharpe  et@yahoo.net    (673) 384-3905
14      Ethan   Schneider       non.hendrerit@outlook.couk      1-577-732-2011
15      Joshua  Greer   molestie.tortor@hotmail.edu     (791) 215-2175
16      Bianca  Contreras       interdum.curabitur@yahoo.edu    (385) 848-1167
17      Ignatius        Simon   non.sapien.molestie@outlook.couk        1-556-433-2214
18      Geoffrey        Oneil   metus.urna@yahoo.org    (570) 669-1782
19      Pascale Stark   molestie@yahoo.edu      1-373-862-4514
20      Lucian  Gates   mauris@outlook.couk     (119) 847-8742
21      Helen   Travis  ac.orci.ut@google.com   (427) 791-8315
22      Julian  Sandoval        vitae@aol.org   1-827-882-2114
23      Kennan  Turner  maecenas.ornare.egestas@protonmail.edu  1-651-632-4986
24      Fritz   Duke    nam@protonmail.com      (784) 516-4127
25      Tobias  Mckenzie        nec.euismod@yahoo.net   1-141-204-7110
26      Judith  Bauer   arcu.nunc.mauris@hotmail.net    (462) 283-5971
27      Mason   Cross   nullam.nisl@protonmail.ca       1-106-222-1131
28      Natalie Andrews mauris.suspendisse@outlook.edu  (666) 766-7293
29      Selma   Mckay   etiam.gravida.molestie@outlook.ca       (342) 542-4377
30      Calvin  Chaney  urna.justo@protonmail.net       1-570-275-4212
31      Judah   Diaz    libero.donec.consectetuer@yahoo.edu     1-573-487-5143
32      Tatiana Mayer   lacus.cras@hotmail.net  (272) 445-1555
33      Fletcher        Henderson       aliquam.gravida@outlook.net     1-710-862-9271
34      Mark    Moses   mattis.ornare@outlook.edu       1-431-356-7372
35      Minerva Stanton duis.ac@hotmail.couk    (492) 806-3607
36      Megan   Mccarthy        enim.diam@icloud.org    (514) 672-8664
37      Eliana  Ashley  a@outlook.edu   (506) 316-7275
38      Lani    Chambers        suspendisse.commodo@protonmail.net      (638) 245-9072
39      Mason   Herring porttitor.interdum@protonmail.edu       (146) 210-4653
40      Lionel  Munoz   odio.vel.est@icloud.org 1-682-821-3944
41      Gil     White   et.ultrices.posuere@aol.net     (336) 928-1681
42      Shannon Doyle   ante.vivamus@outlook.couk       1-489-633-4594
43      Uriah   Aguirre scelerisque@yahoo.ca    1-212-423-8754
44      Madaline        Franklin        sem@google.net  (843) 242-4636
45      Vanna   Harrell adipiscing@aol.org      1-389-631-1885
46      Briar   Hewitt  integer.urna.vivamus@yahoo.com  (447) 710-2643
47      Walter  Noble   augue.ac@google.net     (533) 888-8468
48      Kermit  Webster praesent.eu.dui@icloud.couk     1-780-987-1493
49      Hedwig  Mills   feugiat.metus.sit@protonmail.org        1-855-871-3385
50      Allen   Grimes  sollicitudin.a@yahoo.couk       (741) 582-6824
51      Macaulay        Wagner  per.conubia@hotmail.com 1-789-945-4249
52      Hedley  Wallace lorem@icloud.net        1-367-147-0396
53      Linda   Houston vitae.risus@google.net  (319) 456-3361
54      Allen   Swanson quam.dignissim@icloud.couk      (454) 833-6318
55      Galena  Ortega  interdum.sed@aol.net    1-526-656-1631
56      Kelsie  Stephens        quisque.ornare@outlook.couk     1-336-317-6746
57      Karen   Coffey  nisl.sem@aol.org        1-154-244-1701
58      Anika   Campos  et.commodo@protonmail.ca        (245) 840-8375
59      Leroy   Alston  elementum.at@hotmail.com        1-587-867-6818
60      Robin   Pate    eros.nam@hotmail.ca     1-722-287-3106
61      Robin   Tucker  sagittis.augue@icloud.ca        1-386-141-0640
62      Joel    Haynes  neque.venenatis@protonmail.ca   (542) 924-7459
63      Christian       Velasquez       purus.accumsan.interdum@outlook.ca     1-255-579-5823
64      Erich   Mcguire felis.purus@hotmail.net (824) 451-2963
65      Alice   Gamble  semper.auctor.mauris@google.org 1-366-862-7130
66      Gareth  Koch    vehicula.risus.nulla@outlook.edu        (216) 897-5633
67      Echo    Albert  auctor.velit@hotmail.ca 1-426-698-8287
68      Lillian Moody   feugiat.non.lobortis@protonmail.ca      (376) 464-3247
69      Kathleen        Mccall  sed.leo.cras@yahoo.couk 1-617-276-8612
70      Lev     Chaney  risus.at@protonmail.edu (310) 367-6760
71      Connor  Guzman  bibendum.donec@outlook.org      1-705-207-8151
72      Declan  Mcneil  mollis.lectus@outlook.net       1-126-927-1860
73      Noah    Rasmussen       orci.consectetuer@protonmail.couk       (368) 703-0352
74      Xenos   Ayers   luctus.aliquet.odio@outlook.couk        (860) 251-6760
75      Wesley  Hopkins aenean.eget.magna@outlook.org   (556) 976-8008
76      Acton   Holcomb in.consectetuer@protonmail.net  1-473-371-2496
77      Galvin  Barron  accumsan.neque.et@aol.ca        (273) 597-8715
78      Thomas  Chan    urna@protonmail.net     1-377-457-1750
79      Gemma   Parrish pede@yahoo.org  (604) 224-5341
80      Alea    Britt   proin.ultrices@yahoo.com        1-524-837-6024
81      Deirdre Sweeney vestibulum.accumsan.neque@aol.edu       (687) 655-7830
82      Janna   Duncan  quisque@google.com      1-221-617-2145
83      Kaseem  Swanson mollis.integer@google.couk      (215) 255-5145
84      Rhoda   Mcknight        sagittis.semper.nam@yahoo.ca    1-526-840-7316
85      Geoffrey        Barrera dictum.ultricies@outlook.ca     1-331-162-3811
86      Lana    Clements        malesuada.augue@yahoo.org       (312) 420-2445
87      Zena    Grant   felis.adipiscing@hotmail.ca     1-628-477-7555
88      Jenette Green   vel@icloud.net  (230) 764-2602
89      Orlando Anthony et.ultrices@aol.org     (767) 757-6880
90      Carlos  Yang    vulputate.ullamcorper@yahoo.net 1-711-834-5175
91      Acton   Carson  quis.lectus@google.edu  1-701-898-7384
92      Malik   Blackwell       est@yahoo.edu   1-603-402-6322
93      Kato    Zimmerman       tempus.lorem@yahoo.org  1-780-767-5739
94      Giacomo Hoover  mollis.phasellus@yahoo.com      (551) 618-2136
95      Gannon  Davis   vivamus.rhoncus@aol.ca  1-826-659-5567
96      Jerome  Lopez   libero.est@protonmail.couk      (246) 634-2466
97      Hyatt   Figueroa        quis.massa.mauris@google.edu    (141) 217-4740
98      Tasha   Mueller quis@protonmail.org     1-406-500-5917
99      Carolyn Abbott  cursus.integer@protonmail.com   (286) 476-4567
100     Lester  Padilla libero.et@outlook.couk  (844) 425-7443
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.delivery (id, id_buyer, address) FROM stdin;
1       1       P.O. Box 602, 4714 Ullamcorper Rd.
2       2       P.O. Box 503, 5873 Sed Rd.
3       3       8025 Congue Street
4       4       Ap #957-4083 Id, Avenue
5       5       714-8714 Nam Street
6       6       799-4403 Aliquam Street
7       7       796-7085 Libero Ave
8       8       584 Vehicula St.
9       9       3655 Donec Rd.
10      10      Ap #303-6541 Mauris Rd.
11      11      841-9516 Orci Street
12      12      Ap #956-2464 Et, Road
13      13      Ap #310-8274 Leo. St.
14      14      P.O. Box 106, 3889 Felis. St.
15      15      666-7495 Vel, Av.
16      16      617-6600 Tincidunt Av.
17      17      P.O. Box 987, 2409 Dolor Avenue
18      18      931-760 Malesuada St.
19      19      Ap #776-5537 Eu Street
20      20      285-7998 Ornare Avenue
21      21      Ap #328-1621 Nibh. St.
22      22      219-6453 Ridiculus Av.
23      23      985-1150 Tellus. Avenue
24      24      Ap #772-759 Tempus St.
25      25      3834 Commodo St.
26      26      P.O. Box 998, 7134 Sit Rd.
27      27      P.O. Box 618, 5149 Ornare Av.
28      28      738-6435 Odio St.
29      29      137-6618 Malesuada St.
30      30      Ap #222-2899 Dui Rd.
31      31      Ap #393-1618 Nunc St.
32      32      513-8114 Sed, St.
33      33      724-9006 Luctus St.
34      34      Ap #931-2902 Primis Rd.
35      35      3340 Fringilla. Avenue
36      36      Ap #560-7387 Faucibus Rd.
37      37      589-256 Ligula Av.
38      38      6622 Non Ave
39      39      Ap #232-6074 Orci, Ave
40      40      Ap #301-5669 Feugiat. St.
41      41      Ap #415-8062 Neque. Street
42      42      Ap #565-8476 Mus. St.
43      43      374 Ante Street
44      44      P.O. Box 771, 6734 Vivamus St.
45      45      Ap #643-164 Diam Av.
46      46      Ap #743-8906 Consectetuer Rd.
47      47      Ap #477-7641 Fermentum Rd.
48      48      P.O. Box 554, 3581 Amet Street
49      49      Ap #971-4901 Tempus, St.
50      50      761-3709 Fusce Street
51      51      Ap #887-523 In Avenue
52      52      9882 Condimentum. Road
53      53      P.O. Box 791, 8104 Eu St.
54      54      Ap #193-1967 Porttitor Rd.
55      55      343-5550 Cursus Street
56      56      Ap #456-3457 Enim, Road
57      57      579-4955 Ac St.
58      58      P.O. Box 728, 1491 Mollis St.
59      59      P.O. Box 450, 9835 Est, St.
60      60      Ap #129-8123 Mauris Rd.
61      61      Ap #977-9470 Elit Road
62      62      P.O. Box 801, 7114 Dignissim Avenue
63      63      P.O. Box 608, 3550 Sit St.
64      64      810-8355 Facilisis Rd.
65      65      495-326 Eleifend Rd.
66      66      356-8067 Ut Av.
67      67      941-2822 Ipsum St.
68      68      Ap #690-7093 Accumsan Ave
69      69      Ap #275-6736 Pede Rd.
70      70      193-9003 Sit Ave
71      71      Ap #554-5360 Morbi St.
72      72      P.O. Box 164, 2422 Dictum St.
73      73      464-1218 Lectus Rd.
74      74      Ap #434-7519 Donec Road
75      75      9241 Arcu. St.
76      76      Ap #607-6574 Eleifend St.
77      77      3680 Montes, St.
78      78      664-3281 Purus St.
79      79      P.O. Box 116, 7519 Risus. Rd.
80      80      702-528 Velit. Rd.
81      81      P.O. Box 538, 1594 Non Ave
82      82      4382 Sed, St.
83      83      Ap #767-3120 Dolor St.
84      84      242-5826 Accumsan Road
85      85      Ap #651-7056 Tellus. Road
86      86      729-642 Lectus Road
87      87      6287 Fringilla Road
88      88      Ap #293-6756 Fermentum Ave
89      89      647-9542 Feugiat St.
90      90      Ap #144-9118 Ullamcorper, Street
91      91      Ap #443-7290 Lobortis Street
92      92      Ap #499-6548 Consequat, Avenue
93      93      951-3629 Enim. Road
94      94      930-9133 Et, Ave
95      95      8614 Ac, St.
96      96      P.O. Box 272, 1784 A Rd.
97      97      Ap #717-3125 Accumsan Rd.
98      98      Ap #107-4788 Mauris Avenue
99      99      Ap #738-6750 Non, Road
100     100     Ap #563-4561 Lorem St.
\.


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.manufacturer (id, name) FROM stdin;
1       Sed Nulla Ante Inc.
2       Curabitur Ut Ltd
3       Tellus Lorem Eu Incorporated
4       Massa Rutrum LLP
5       Sed Nunc Est Inc.
6       Sodales Mauris Blandit LLP
7       Dolor Ltd
8       Vitae Erat Vivamus Corporation
9       Nec Eleifend Ltd
10      Nec Euismod Limited
11      Molestie Arcu Industries
12      Blandit Viverra Industries
13      Mi Felis Foundation
14      Vel Vulputate Incorporated
15      Enim Suspendisse Aliquet Inc.
16      A Auctor Industries
17      Lobortis Ultrices Vivamus Incorporated
18      Pede Nunc Sed Company
19      Sit Inc.
20      Semper Egestas LLC
21      Et Magna Praesent PC
22      Molestie Orci Tincidunt Ltd
23      Ante Vivamus Non Industries
24      Dolor Industries
25      Facilisis Lorem Industries
26      Sit Amet Nulla Foundation
27      Aliquam Erat Volutpat Company
28      Ligula Inc.
29      Auctor LLP
30      Risus At LLC
31      Magna Sed LLP
32      Mauris Sit Associates
33      A Ultricies Adipiscing Associates
34      Ut Lacus Limited
35      Montes Nascetur Inc.
36      Amet Ultricies Company
37      Morbi Tristique Incorporated
38      Vitae Sodales LLC
39      Sapien Cras Ltd
40      Ipsum Suspendisse Consulting
41      Eu Sem Ltd
42      Sodales PC
43      Elit Erat Vitae Company
44      Fermentum Risus Foundation
45      Semper Rutrum Fusce Associates
46      Ut Molestie Incorporated
47      Eleifend Cras Foundation
48      Mauris PC
49      A Institute
50      Tempor Institute
51      Tortor Foundation
52      Venenatis PC
53      Vitae Aliquam Corporation
54      Orci Lacus LLC
55      Nam Porttitor Scelerisque Foundation
56      Ac Associates
57      Quisque Nonummy Ipsum LLP
58      Suspendisse Aliquet Molestie Corporation
59      Lorem Semper Auctor Inc.
60      Urna Suscipit Nonummy Limited
61      Vitae Posuere Institute
62      Non Cursus LLP
63      Molestie Sed Id Associates
64      Justo Faucibus Industries
65      Mus Donec LLC
66      Metus Vivamus LLC
67      Ac LLC
68      Congue In Corporation
69      Sodales At Ltd
70      Non Enim Ltd
71      Vitae Sodales At Limited
72      In Faucibus LLC
73      Vitae Institute
74      Facilisis Non Bibendum Ltd
75      Integer Company
76      Sagittis Duis Gravida Associates
77      In Faucibus Limited
78      Duis Gravida PC
79      Iaculis Quis Inc.
80      Pellentesque Habitant Morbi LLC
81      Pede Sagittis Ltd
82      Eu Lacus Incorporated
83      Aliquam Adipiscing Lobortis LLP
84      Fringilla Euismod Corp.
85      Nunc Commodo Ltd
86      Commodo Hendrerit Associates
87      Lacus Varius Corp.
88      Vel Inc.
89      Phasellus In LLC
90      Nec Quam Limited
91      Adipiscing Elit Ltd
92      Faucibus Corp.
93      Porttitor Limited
94      Nec Corporation
95      Cum Sociis Corp.
96      Tortor Integer Aliquam LLC
97      A Industries
98      Libero PC
99      Nulla In Tincidunt Industries
100     Ipsum Suspendisse Sagittis Institute
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.orders (id, date, id_buyer, id_product, id_payment, status_order, id_delivery) FROM stdin;
1       2023-03-16 22:49:13     1       1       4       4       1
2       2021-07-26 11:27:19     2       2       2       3       2
3       2021-10-05 19:47:53     3       3       3       1       3
4       2021-06-08 22:30:18     4       4       2       2       4
5       2022-05-10 03:55:22     5       5       1       3       5
6       2021-08-06 00:06:06     6       6       4       1       6
7       2022-05-17 21:20:49     7       7       3       1       7
8       2022-08-01 22:35:25     8       8       2       3       8
9       2021-12-20 09:50:31     9       9       1       5       9
10      2022-01-16 20:54:00     10      10      3       4       10
11      2021-07-14 18:52:18     11      11      2       4       11
12      2023-02-11 19:48:40     12      12      2       4       12
13      2021-05-18 01:39:19     13      13      2       4       13
14      2023-03-26 11:41:04     14      14      1       2       14
15      2022-09-13 21:58:26     15      15      4       5       15
16      2022-02-23 17:15:36     16      16      2       4       16
17      2022-08-21 22:27:43     17      17      2       2       17
18      2021-10-09 05:15:35     18      18      2       4       18
19      2021-08-14 20:39:19     19      19      2       1       19
20      2022-01-23 01:18:27     20      20      4       4       20
21      2023-04-20 07:43:40     21      21      3       5       21
22      2022-03-12 00:45:43     22      22      2       4       22
23      2021-05-13 18:00:37     23      23      2       4       23
24      2022-08-26 16:35:22     24      24      1       2       24
25      2021-11-06 17:28:26     25      25      2       2       25
26      2022-02-20 02:52:28     26      26      2       2       26
27      2021-12-18 22:38:00     27      27      1       4       27
28      2022-11-09 03:30:38     28      28      3       5       28
29      2022-11-20 08:31:21     29      29      2       2       29
30      2023-02-08 06:35:49     30      30      4       2       30
31      2021-11-13 15:50:55     31      31      3       1       31
32      2022-09-28 17:32:02     32      32      2       2       32
33      2023-04-12 06:06:58     33      33      2       4       33
34      2023-02-20 20:19:21     34      34      2       3       34
35      2023-01-13 06:47:15     35      35      3       4       35
36      2021-07-23 08:16:11     36      36      3       2       36
37      2022-12-11 22:00:57     37      37      1       4       37
38      2023-04-01 19:19:47     38      38      4       2       38
39      2022-03-06 22:06:01     39      39      3       2       39
40      2021-06-16 16:06:48     40      40      2       4       40
41      2023-01-09 07:50:01     41      41      3       2       41
42      2022-04-25 10:00:33     42      42      4       3       42
43      2021-06-19 07:23:22     43      43      3       3       43
44      2022-05-01 09:34:39     44      44      3       3       44
45      2021-10-30 18:27:17     45      45      2       2       45
46      2022-10-21 15:51:34     46      46      3       2       46
47      2022-05-05 02:08:10     47      47      3       4       47
48      2021-09-28 15:59:06     48      48      2       4       48
49      2023-04-08 00:23:15     49      49      2       3       49
50      2023-04-05 12:40:03     50      50      4       4       50
51      2022-04-03 17:31:15     51      51      3       2       51
52      2022-07-04 18:33:33     52      52      2       3       52
53      2022-10-18 21:36:11     53      53      1       2       53
54      2021-12-28 04:14:03     54      54      3       3       54
55      2022-02-11 17:39:50     55      55      3       1       55
56      2022-02-22 09:20:44     56      56      4       3       56
57      2021-11-02 07:26:58     57      57      2       5       57
58      2021-10-06 03:09:38     58      58      3       4       58
59      2022-02-25 03:26:58     59      59      3       5       59
60      2021-08-28 06:16:35     60      60      2       1       60
61      2021-11-04 06:08:41     61      61      1       3       61
62      2021-12-02 09:01:54     62      62      2       4       62
63      2021-06-12 01:45:50     63      63      4       2       63
64      2023-02-23 23:01:25     64      64      3       5       64
65      2022-11-16 03:07:40     65      65      3       3       65
66      2021-08-06 17:50:22     66      66      2       2       66
67      2021-07-05 18:41:39     67      67      3       3       67
68      2022-02-05 02:24:20     68      68      1       3       68
69      2022-06-14 09:45:49     69      69      2       2       69
70      2022-09-08 21:25:37     70      70      4       2       70
71      2021-07-21 04:25:49     71      71      1       4       71
72      2021-07-29 16:24:31     72      72      4       3       72
73      2021-11-24 05:27:47     73      73      3       2       73
74      2021-12-19 01:19:15     74      74      4       4       74
75      2021-10-28 04:59:09     75      75      2       2       75
76      2022-02-05 20:47:13     76      76      3       3       76
77      2022-06-22 02:45:23     77      77      3       4       77
78      2022-12-30 17:02:53     78      78      4       4       78
79      2021-11-27 04:46:32     79      79      4       2       79
80      2023-02-18 09:07:05     80      80      1       2       80
81      2021-12-30 09:44:08     81      81      1       4       81
82      2023-01-27 20:31:26     82      82      3       4       82
83      2022-09-18 20:50:57     83      83      4       4       83
84      2021-08-04 11:16:34     84      84      2       4       84
85      2022-08-16 04:38:18     85      85      3       3       85
86      2022-12-19 22:19:47     86      86      4       3       86
87      2022-07-26 15:52:50     87      87      3       2       87
88      2022-07-10 09:26:59     88      88      3       1       88
89      2021-12-08 22:58:06     89      89      2       2       89
90      2023-01-01 00:28:27     90      90      3       3       90
91      2022-05-31 07:14:38     91      91      3       2       91
92      2021-05-01 02:14:05     92      92      1       3       92
93      2022-04-02 16:57:00     93      93      4       3       93
94      2022-11-17 11:32:33     94      94      3       3       94
95      2021-11-26 04:53:04     95      95      4       2       95
96      2021-12-05 01:12:51     96      96      4       5       96
97      2022-06-13 10:08:22     97      97      4       5       97
98      2023-01-12 18:24:10     98      98      1       1       98
99      2022-02-05 17:10:24     99      99      2       1       99
100     2022-01-01 21:46:14     100     100     2       1       100
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.payment (id, name) FROM stdin;
1       VISA
2       Mastercard Worldwide
3       JCB
4       Ã»–
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products (id, name, price, in_stock, description, id_manufacturer, url, extra_options) FROM stdin;
1       lorem,  1057    f       magnis dis parturient   1       https://ebay.com/user/110?q=test        {"temperature": 200}
2       pharetra.       632     t       nec, mollis vitae, posuere at, velit. Cras lorem lorem, 2       https://nytimes.com/en-ca?gi=100        {"range": 10}
3       fringilla. Donec        1357    f       tempor arcu. Vestibulum ut eros non     3       http://google.com/en-ca?client=g        {"value_of_division": 10}
4       diam nunc, ullamcorper  3126    f       non lorem vitae 4       http://instagram.com/site?ab=441&aad=2  {"temperature": 100}
5       orci, adipiscing        892     f       sit amet,       5       http://google.com/group/9?g=1   {"range": 200}
6       tristique senectus      2348    t       non, lobortis quis,     6      https://wikipedia.org/fr?gi=100  {"temperature": 200}
7       Vestibulum      3886    t       nec, eleifend non, dapibus rutrum, justo.       7       http://facebook.com/group/9?client=g    {"value_of_division": 200}
8       Aenean  3119    t       sed, facilisis vitae, orci. Phasellus dapibus  8http://instagram.com/settings?k=0       {"temperature": 200}
9       mollis. 4710    t       risus. Duis     9       http://netflix.com/fr?q=11      {"limits_of_error": 10}
10      Nullam  4305    t       vel sapien imperdiet ornare. In 10      http://youtube.com/site?q=0     {"temperature": 200}
11      diam.   1042    f       vel, faucibus id, libero.       11      http://youtube.com/site?gi=100  \N
12      Integer vitae   1701    t       ac turpis egestas. Fusce aliquet magna a neque. Nullam  12      http://walmart.com/sub/cars?page=1&offset=1     \N
13      dolor egestas   3210    f       Cras eu tellus eu augue porttitor interdum. Sed 13      http://naver.com/one?str=se     \N
14      urna. Nullam    1051    t       Integer urna. Vivamus molestie  14     https://walmart.com/fr?q=11      \N
15      odio.   981     t       velit egestas lacinia. Sed      15      http://reddit.com/settings?q=4  \N
16      rutrum lorem    4345    t       nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis   16      https://nytimes.com/sub/cars?ad=115    \N
17      sit amet        2293    f       malesuada augue ut lacus. Nulla 17     https://zoom.us/fr?q=11  \N
18      erat vitae risus.       2560    f       amet orci. Ut sagittis lobortis mauris. 18      https://bbc.co.uk/settings?q=11 \N
19      libero. Proin   4015    t       velit eget laoreet posuere, enim nisl elementum purus, accumsan 19      http://youtube.com/user/110?p=8 \N
20      mollis  3627    t       Quisque imperdiet,      20      https://youtube.com/settings?search=1   \N
21      tempor  368     t       nibh vulputate  21      https://instagram.com/site?q=11 {"limits_of_error": 10}
22      semper egestas, urna    362     f       non, hendrerit id, ante.       22       https://ebay.com/settings?search=1      {"temperature": 200}
23      magna. Lorem ipsum      2606    f       turpis. Aliquam adipiscing lobortis risus. In   23      https://whatsapp.com/user/110?p=8       {"limits_of_error": 5}
24      metus urna      2112    f       lacus.  24      https://wikipedia.org/settings?g=1      {"range": 10}
25      amet ornare     1002    t       parturient montes, nascetur ridiculus mus. Donec dignissim magna a      25      https://wikipedia.org/user/110?search=1{"value_of_division": 10}
26      cursus  4622    t       In nec orci.    26      http://youtube.com/settings?q=4 {"limits_of_error": 10}
27      Vivamus non lorem       1179    t       rhoncus. Donec est.     27     http://wikipedia.org/one?q=11    {"temperature": 100}
28      eu arcu.        1360    t       fermentum arcu. 28      https://bbc.co.uk/group/9?p=8   {"limits_of_error": 10}
29      luctus ut,      1866    t       lacinia orci, consectetuer euismod     29       https://zoom.us/sub?search=1    {"range": 10}
30      ultrices posuere        4707    f       tristique neque venenatis lacus.30      http://pinterest.com/sub/cars?ad=115    {"limits_of_error": 10}
31      ipsum. Suspendisse non  3481    f       sit amet orci. Ut sagittis lobortis     31      https://reddit.com/fr?k=0       \N
32      quis, tristique 2077    t       leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor    32      https://ebay.com/sub?q=4        \N
33      Aliquam 43      f       malesuada fames ac turpis egestas. Fusce aliquet magna a neque. 33      http://baidu.com/one?k=0        \N
34      accumsan convallis,     2027    f       at, libero. Morbi       34     https://wikipedia.org/fr?search=1        \N
35      morbi   3974    f       nibh. Aliquam ornare, libero    35      https://walmart.com/fr?q=test   \N
36      libero. Donec consectetuer      1863    f       id sapien. Cras dolor dolor, tempus     36      https://twitter.com/one?k=0     \N
37      lectus  2272    f       Aenean massa. Integer vitae nibh. Donec 37     http://bbc.co.uk/group/9?str=se  \N
38      aliquet odio.   4023    t       diam    38      https://facebook.com/site?g=1   \N
39      commodo auctor velit.   4345    t       elit erat       39      http://zoom.us/settings?k=0     \N
40      Etiam   3120    t       id enim. Curabitur massa. Vestibulum accumsan neque     40      http://wikipedia.org/sub?ad=115 \N
41      non     1348    f       nascetur ridiculus      41      https://google.com/settings?k=0 \N
42      diam.   1999    f       Duis at lacus. Quisque purus sapien,    42     http://facebook.com/sub/cars?q=test      \N
43      lorem. Donec    1511    f       ligula. Nullam feugiat  43      https://youtube.com/group/9?search=1    \N
44      parturient montes, nascetur     4190    t       Quisque purus sapien, gravida non, sollicitudin a, malesuada id,        44      https://naver.com/en-ca?q=test  \N
45      enim, sit       781     t       nisi. Mauris nulla. Integer     45     https://reddit.com/sub/cars?gi=100       \N
46      Donec fringilla.        625     t       diam at pretium aliquet,       46       https://netflix.com/sub?page=1&offset=1 \N
47      tincidunt       3275    t       et magnis dis parturient montes, nascetur       47      http://netflix.com/one?gi=100   \N
48      sed     3711    f       aliquet molestie tellus. Aenean 48      http://twitter.com/en-us?str=se \N
49      Nulla   680     t       Vestibulum accumsan neque et nunc. Quisque ornare       49      http://google.com/fr?q=0        \N
50      Proin ultrices. Duis    4116    t       Integer vitae nibh. Donec      50       https://pinterest.com/group/9?k=0       \N
51      rhoncus id, mollis      2230    f       Integer tincidunt aliquam arcu. Aliquam ultrices iaculis        51      http://ebay.com/one?g=1 {"temperature": 200}
52      velit   2699    f       ut,     52      http://google.com/en-us?q=4    {"value_of_division": 5}
53      pharetra, felis eget    1171    f       mauris, aliquam eu, accumsan sed,       53      https://zoom.us/user/110?q=0    {"color": "red"}
54      sit     1523    f       odio. Aliquam vulputate ullamcorper     54     https://whatsapp.com/settings?ab=441&aad=2       {"color": "green"}
55      vestibulum lorem,       2255    f       orci lacus vestibulum lorem, sit amet ultricies sem magna       55      https://google.com/en-us?k=0    {"temperature": 200}
56      non, bibendum   4004    f       Quisque porttitor eros nec      56     http://zoom.us/sub?k=0   {"color": "blue"}
57      facilisi. Sed neque.    1914    t       et arcu imperdiet ullamcorper. 57       http://baidu.com/site?k=0       {"color": "brown"}
58      nisl sem,       3831    t       orci luctus     58      https://ebay.com/fr?ab=441&aad=2        {"color": "yelow"}
59      dapibus 4781    f       sem ut dolor dapibus gravida. Aliquam   59     https://guardian.co.uk/en-ca?str=se      {"color": "red"}
60      Phasellus       71      t       ac mi eleifend egestas. Sed pharetra, felis     60      https://zoom.us/one?search=1    {"temperature": 200}
61      metus vitae velit       2735    t       tempus risus. Donec egestas. Duis       61      http://pinterest.com/user/110?gi=100    \N
62      sem egestas blandit.    1672    f       netus et malesuada fames ac turpis egestas. Fusce aliquet       62      http://walmart.com/en-ca?p=8    \N
63      massa   4480    t       arcu ac orci.   63      https://google.com/settings?ab=441&aad=2        \N
64      urna suscipit   2073    f       Sed pharetra, felis eget varius ultrices, mauris        64      http://reddit.com/en-us?q=test  \N
65      nascetur ridiculus      2665    f       Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum 65      https://reddit.com/one?q=test  \N
66      a nunc. 4019    t       turpis non enim. Mauris quis turpis vitae purus66       http://baidu.com/site?str=se    \N
67      dolor dolor,    33      f       eu      67      http://instagram.com/sub?ad=115 \N
68      ac nulla.       3575    t       aliquet 68      https://whatsapp.com/en-us?client=g     \N
69      viverra.        4575    f       metus. In lorem. Donec  69      http://whatsapp.com/user/110?search=1   \N
70      Aliquam 4852    t       Mauris molestie pharetra nibh.  70      http://google.com/settings?gi=100       \N
71      sed dictum eleifend,    3039    t       tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce 71      http://ebay.com/site?p=8        \N
72      arcu iaculis    1796    t       nisl sem, consequat nec, mollis 72     http://yahoo.com/one?client=g    \N
73      in molestie tortor      3368    f       Nunc ullamcorper, velit in aliquet      73      https://pinterest.com/en-ca?search=1    \N
74      Quisque ornare tortor   4464    f       parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque      74      https://zoom.us/en-us?page=1&offset=1   \N
75      mauris erat eget        4673    t       vestibulum lorem, sit amet ultricies sem magna  75      https://pinterest.com/sub/cars?q=0      \N
76      magna   2274    f       pellentesque a, facilisis non,  76      https://netflix.com/user/110?q=0        \N
77      massa. Suspendisse eleifend.    2658    t       turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque        77      http://naver.com/group/9?gi=100 \N
78      risus.  2159    t       faucibus orci luctus et ultrices posuere cubilia Curae  78      https://naver.com/en-us?p=8     \N
79      nonummy ipsum   1782    f       sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum       79      https://walmart.com/site?ab=441&aad=2  \N
80      Vestibulum ut   366     t       elit. Etiam laoreet, libero     80     http://wikipedia.org/group/9?q=test      \N
81      Nullam enim.    1933    t       leo, in lobortis tellus justo   81     http://naver.com/en-ca?search=1  \N
82      ornare lectus justo     1337    t       ante lectus convallis est, vitae sodales nisi magna sed dui.    82      http://reddit.com/sub?str=se    \N
83      vestibulum lorem, sit   4219    t       malesuada vel, convallis       83       https://netflix.com/fr?ad=115   \N
84      urna    4922    t       nec     84      https://guardian.co.uk/user/110?gi=100  \N
85      risus. Quisque  80      t       mi felis, adipiscing fringilla, porttitor vulputate,    85      http://pinterest.com/one?k=0    \N
86      lacus. Mauris   1231    f       faucibus ut, nulla.     86      http://instagram.com/fr?page=1&offset=1 \N
87      dapibus ligula. 868     t       massa non       87      http://naver.com/group/9?ad=115 \N
88      sit amet ante.  4621    f       pede. Nunc sed orci lobortis augue scelerisque  88      https://whatsapp.com/sub?client=g       \N
89      lobortis, nisi nibh     4805    f       sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus     89      https://wikipedia.org/fr?q=test\N
90      ultricies dignissim     2862    t       Integer eu      90      http://instagram.com/sub?q=0    \N
91      pellentesque,   2537    f       fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies      91      https://youtube.com/en-us?q=4  \N
92      a       135     t       feugiat nec, diam.      92      https://netflix.com/en-us?ad=115        \N
93      risus.  959     t       velit in aliquet        93      http://facebook.com/sub/cars?p=8        \N
94      euismod ac,     4648    t       auctor vitae, aliquet nec, imperdiet   94       http://instagram.com/sub/cars?page=1&offset=1   \N
95      non, sollicitudin       2264    t       consequat, lectus sit   95     https://twitter.com/fr?k=0       \N
96      lorem ipsum     97      f       mus.    96      https://instagram.com/site?ab=441&aad=2 \N
97      et,     965     t       Proin eget      97      http://walmart.com/group/9?k=0  \N
98      lacinia 2486    t       non, bibendum sed, est. 98      http://ebay.com/en-ca?search=1&q=de     \N
99      Donec feugiat metus     947     t       tempus, lorem fringilla ornare placerat,        99      https://cnn.com/settings?gi=100 \N
100     dignissim tempor arcu.  4732    t       ante    100     http://guardian.co.uk/en-ca?q=test      \N
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.recipes (id, name, id_product, description) FROM stdin;
1       dictum magna.   1       Nullam suscipit, est ac facilisis facilisis, magna
2       pede    2       arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,
3       nisl elementum  3       sollicitudin orci sem eget massa. Suspendisse eleifend.
4       ridiculus       4       augue, eu tempor erat neque non quam. Pellentesque habitant
5       nisi    5       dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,
6       Nunc laoreet lectus     6       odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis
7       libero mauris,  7       ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.
8       ut nisi 8       Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque
9       lobortis        9       sem mollis dui, in sodales elit erat vitae
10      nec, mollis     10      eget tincidunt dui
11      Duis volutpat   11      et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate,
12      arcu.   12      Donec egestas. Aliquam
13      Curae Donec tincidunt.  13      Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit
14      pede. Suspendisse       14      diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,
15      in, hendrerit   15      augue, eu tempor erat neque non quam. Pellentesque
16      dui nec 16      fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper
17      non, cursus     17      justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin
18      felis. Nulla    18      lorem vitae odio sagittis semper. Nam
19      Vestibulum ut   19      id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non,
20      Nam interdum    20      fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor
21      montes, nascetur ridiculus      21      odio. Nam interdum enim non nisi. Aenean eget metus. In nec
22      dui     22      iaculis enim, sit amet ornare
23      fringilla purus 23      mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.
24      interdum. Sed   24      vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam
25      ac mattis       25      diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis
26      feugiat 26      dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis
27      Suspendisse dui. Fusce  27      amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo
28      vehicula. Pellentesque  28      Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In
29      Integer 29      Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus
30      Duis cursus,    30      tellus faucibus leo,
31      accumsan convallis,     31      ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,
32      vitae erat      32      diam vel arcu. Curabitur ut odio vel
33      consectetuer ipsum      33      interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis
34      orci. Ut        34      nisl sem, consequat nec, mollis vitae, posuere at, velit.
35      massa rutrum    35      neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel
36      varius  36      eu, ultrices sit amet, risus.
37      Donec elementum,        37      semper et, lacinia vitae, sodales at, velit. Pellentesque
38      enim. Curabitur massa.  38      Curabitur consequat, lectus sit amet luctus vulputate, nisi
39      Nunc    39      ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui
40      Sed dictum.     40      feugiat tellus lorem eu metus.
41      in aliquet      41      risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante
42      vel quam dignissim      42      Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt
43      ligula consectetuer rhoncus.    43      tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices
44      faucibus lectus, a      44      a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis
45      nulla at sem    45      ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a
46      auctor odio     46      accumsan interdum libero dui
47      molestie tellus.        47      posuere cubilia
48      Etiam   48      mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo
49      dolor sit       49      Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim.
50      dictum eu, eleifend     50      condimentum eget,
51      et magnis       51      libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae,
52      accumsan laoreet        52      ut
53      sapien, cursus  53      Mauris molestie pharetra nibh.
54      sit amet        54      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim
55      et, commodo     55      dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames
56      aliquet. Phasellus fermentum    56      Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,
57      orci. Ut        57      sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus
58      nisi. Aenean    58      Sed auctor odio a purus. Duis elementum, dui quis accumsan
59      arcu. Sed       59      auctor quis, tristique ac, eleifend vitae, erat. Vivamus
60      bibendum sed,   60      eget metus eu
61      Maecenas malesuada      61      aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna.
62      vitae semper egestas,   62      faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor
63      congue turpis.  63      nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo
64      lectus. Cum     64      justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget
65      Aenean massa. Integer   65      nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.
66      suscipit nonummy. Fusce 66      ipsum dolor sit amet, consectetuer
67      amet, consectetuer      67      nonummy. Fusce fermentum fermentum arcu. Vestibulum ante
68      metus. Aliquam erat     68      dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in
69      orci, consectetuer euismod      69      Duis dignissim tempor arcu. Vestibulum ut
70      est     70      lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis
71      Sed     71      Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus
72      interdum.       72      eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec
73      amet ante. Vivamus      73      mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis
74      In      74      at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi
75      magna. Lorem    75      ultrices, mauris ipsum
76      lacus, varius et,       76      at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum
77      mollis nec, cursus      77      eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum,
78      aliquet libero. Integer 78      nibh enim, gravida sit amet, dapibus id,
79      dapibus gravida.        79      faucibus orci luctus et ultrices posuere cubilia
80      neque vitae     80      velit. Cras lorem
81      orci quis       81      Integer vulputate, risus a ultricies
82      auctor velit. Aliquam   82      Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl
83      Aenean eget metus.      83      augue eu tellus. Phasellus elit
84      metus urna convallis    84      lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis
85      auctor  85      dictum mi, ac mattis velit justo
86      dolor egestas rhoncus.  86      adipiscing, enim mi tempor lorem,
87      est.    87      imperdiet
88      eget varius     88      at arcu. Vestibulum
89      ac metus        89      vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,
90      urna    90      risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a,
91      neque. Morbi    91      sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,
92      odio sagittis   92      nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum
93      ultricies ornare,       93      tellus sem mollis dui, in sodales elit erat
94      tincidunt tempus risus. 94      Cras eu tellus eu augue porttitor interdum. Sed auctor odio a
95      et, euismod     95      consectetuer mauris id sapien. Cras dolor dolor, tempus non,
96      Phasellus fermentum     96      purus sapien, gravida non, sollicitudin a, malesuada id, erat.
97      in consectetuer 97      tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam
98      vitae sodales nisi      98      arcu eu odio tristique pharetra. Quisque ac libero nec
99      ultricies       99      ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis
100     vulputate       100     ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.reviews (id, id_buyer, reviewe) FROM stdin;
1       1       ornare egestas
2       2       Nulla
3       3       arcu vel quam
4       4       et magnis dis parturient montes, nascetur ridiculus
5       5       dis parturient montes, nascetur ridiculus
6       6       Suspendisse aliquet,
7       7       vitae purus gravida sagittis.
8       8       mus. Proin vel
9       9       montes, nascetur ridiculus mus. Aenean
10      10      fringilla purus mauris a nunc. In at
11      11      Mauris quis turpis vitae purus gravida
12      12      est, mollis
13      13      Ut tincidunt orci quis lectus. Nullam suscipit, est ac
14      14      feugiat metus sit amet ante. Vivamus
15      15      eu tempor erat neque non quam. Pellentesque habitant morbi tristique
16      16      lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus
17      17      dictum magna. Ut tincidunt orci quis lectus.
18      18      Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.
19      19      egestas rhoncus. Proin nisl sem,
20      20      semper auctor. Mauris
21      21      In at pede. Cras vulputate velit eu sem. Pellentesque ut
22      22      taciti sociosqu ad litora torquent per conubia nostra, per
23      23      libero. Donec consectetuer mauris id
24      24      euismod urna. Nullam lobortis quam a felis ullamcorper viverra.
25      25      ante, iaculis nec, eleifend non,
26      26      urna. Vivamus molestie dapibus ligula.
27      27      imperdiet dictum magna. Ut
28      28      dis parturient montes, nascetur ridiculus mus.
29      29      ut mi. Duis risus odio, auctor vitae, aliquet nec,
30      30      Class aptent taciti sociosqu ad litora torquent per
31      31      diam vel arcu. Curabitur
32      32      purus. Duis elementum,
33      33      vehicula aliquet libero. Integer in magna.
34      34      Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat
35      35      Curabitur dictum. Phasellus in
36      36      arcu eu
37      37      nec
38      38      rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed
39      39      ante lectus convallis est,
40      40      erat, in consectetuer
41      41      vestibulum, neque sed dictum eleifend, nunc risus varius orci,
42      42      sociis natoque penatibus et magnis dis parturient montes,
43      43      eget metus eu erat semper rutrum. Fusce dolor quam,
44      44      nec urna et arcu imperdiet ullamcorper.
45      45      eleifend vitae, erat. Vivamus
46      46      tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum
47      47      fringilla ornare placerat, orci lacus
48      48      Fusce aliquam, enim nec tempus scelerisque, lorem ipsum
49      49      ipsum ac mi eleifend egestas. Sed
50      50      facilisis. Suspendisse commodo tincidunt
51      51      egestas a, dui. Cras pellentesque. Sed dictum. Proin eget
52      52      metus. In lorem. Donec elementum, lorem
53      53      iaculis enim, sit amet ornare lectus justo
54      54      ultrices posuere cubilia Curae Donec
55      55      ipsum. Phasellus vitae mauris sit amet lorem
56      56      aliquet libero. Integer in magna. Phasellus dolor
57      57      Maecenas
58      58      velit. Sed
59      59      cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam
60      60      Phasellus dolor elit, pellentesque a,
61      61      vestibulum. Mauris magna. Duis dignissim tempor
62      62      eu dolor egestas rhoncus. Proin nisl sem, consequat nec,
63      63      egestas
64      64      ac metus vitae velit egestas lacinia. Sed congue,
65      65      pede blandit congue. In
66      66      malesuada. Integer id
67      67      Integer vitae nibh. Donec est mauris, rhoncus id,
68      68      Praesent interdum
69      69      justo eu arcu. Morbi
70      70      vestibulum, neque sed dictum eleifend, nunc risus varius
71      71      dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus
72      72      Vivamus non lorem vitae odio sagittis semper. Nam
73      73      tincidunt pede ac
74      74      sodales. Mauris blandit enim consequat purus. Maecenas
75      75      in sodales elit erat
76      76      Mauris blandit enim consequat purus. Maecenas libero est, congue a,
77      77      ut mi. Duis
78      78      in felis. Nulla tempor augue ac ipsum.
79      79      turpis egestas.
80      80      Sed diam lorem, auctor quis, tristique ac, eleifend
81      81      malesuada augue ut lacus. Nulla tincidunt, neque vitae
82      82      Vestibulum ante ipsum primis in faucibus orci luctus et
83      83      nunc. Quisque ornare tortor at risus. Nunc
84      84      egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere
85      85      commodo tincidunt nibh. Phasellus nulla.
86      86      Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat
87      87      Nam ac nulla. In
88      88      metus
89      89      iaculis enim, sit
90      90      ante. Maecenas mi felis, adipiscing fringilla,
91      91      fermentum fermentum arcu. Vestibulum ante ipsum primis
92      92      sit amet, dapibus id, blandit at,
93      93      mollis non, cursus non,
94      94      litora torquent per conubia nostra, per inceptos hymenaeos.
95      95      orci. Phasellus dapibus quam quis diam. Pellentesque
96      96      ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,
97      97      faucibus id, libero. Donec consectetuer mauris id sapien.
98      98      nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.
99      99      Integer in magna. Phasellus dolor elit, pellentesque
100     100     molestie sodales. Mauris
\.


--
-- Data for Name: status_order; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.status_order (id, status_order) FROM stdin;
1       Accepted
2       Derected to work
3       Executed
4       Posted
5       Cancelled
\.


--
-- Name: buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.buyers_id_seq', 1, false);


--
-- Name: delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.delivery_id_seq', 1, false);


--
-- Name: manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.manufacturer_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.recipes_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: status_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.status_order_id_seq', 1, false);


--
-- Name: buyers buyers_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_email_key UNIQUE (email);


--
-- Name: buyers buyers_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_phone_key UNIQUE (phone);


--
-- Name: buyers buyers_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_url_key UNIQUE (url);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: status_order status_order_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.status_order
    ADD CONSTRAINT status_order_pkey PRIMARY KEY (id);


--
-- Name: cart cart_id_buyer_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_id_buyer_fk FOREIGN KEY (id_buyer) REFERENCES public.buyers(id);


--
-- Name: cart cart_id_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_id_product_fk FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: orders orders_id_buyer_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_buyer_fk FOREIGN KEY (id_buyer) REFERENCES public.buyers(id);


--
-- Name: orders orders_id_delivery_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_delivery_fk FOREIGN KEY (id_delivery) REFERENCES public.delivery(id);


--
-- Name: orders orders_id_payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_payment_fk FOREIGN KEY (id_payment) REFERENCES public.payment(id);


--
-- Name: orders orders_id_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_product_fk FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: orders orders_status_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_order_fk FOREIGN KEY (status_order) REFERENCES public.status_order(id);


--
-- Name: products products_id_manufacturer_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_manufacturer_fk FOREIGN KEY (id_manufacturer) REFERENCES public.manufacturer(id) ON DELETE RESTRICT;


--
-- Name: recipes recipes_id_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_id_product_fk FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: reviews reviews_id_buyer_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_id_buyer_fk FOREIGN KEY (id_buyer) REFERENCES public.buyers(id);


--
-- PostgreSQL database dump complete
--
