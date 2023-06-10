--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bus (
    plate_number character varying(100) NOT NULL,
    bus_name character varying(100) NOT NULL,
    capacity character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    manufacturer character varying(100) NOT NULL,
    color character varying(100) NOT NULL,
    fueltype character varying(100) NOT NULL,
    status character varying(100) NOT NULL,
    driver_id integer NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.bus OWNER TO postgres;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver (
    driver_id integer NOT NULL,
    name character varying(100) NOT NULL,
    license_number character varying(100) NOT NULL,
    contact_number character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    experience character varying(100) NOT NULL,
    availability character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.driver OWNER TO postgres;

--
-- Name: driver_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_driver_id_seq OWNER TO postgres;

--
-- Name: driver_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_driver_id_seq OWNED BY public.driver.driver_id;


--
-- Name: passenger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger (
    passenger_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer NOT NULL,
    gender character varying(100) NOT NULL,
    contact integer NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    nationality character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.passenger OWNER TO postgres;

--
-- Name: passenger_passenger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passenger_passenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passenger_passenger_id_seq OWNER TO postgres;

--
-- Name: passenger_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passenger_passenger_id_seq OWNED BY public.passenger.passenger_id;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    reservation_id integer NOT NULL,
    passenger_id integer NOT NULL,
    schedule_id integer NOT NULL,
    seat_number integer NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_reservation_id_seq OWNER TO postgres;

--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_reservation_id_seq OWNED BY public.reservation.reservation_id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    route_id integer NOT NULL,
    source character varying(100) NOT NULL,
    destination character varying(100) NOT NULL,
    distance character varying(100) NOT NULL,
    duration character varying(100) NOT NULL,
    fare integer NOT NULL,
    stops character varying(100) NOT NULL,
    departure time without time zone NOT NULL,
    arrival_time time without time zone NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- Name: routes_route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_route_id_seq OWNER TO postgres;

--
-- Name: routes_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_route_id_seq OWNED BY public.routes.route_id;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    plate_number character varying(100) NOT NULL,
    route_id integer NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_schedule_id_seq OWNER TO postgres;

--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;


--
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    ticket_number integer NOT NULL,
    reservation_id integer NOT NULL,
    ticket_status character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- Name: driver driver_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver ALTER COLUMN driver_id SET DEFAULT nextval('public.driver_driver_id_seq'::regclass);


--
-- Name: passenger passenger_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger ALTER COLUMN passenger_id SET DEFAULT nextval('public.passenger_passenger_id_seq'::regclass);


--
-- Name: reservation reservation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN reservation_id SET DEFAULT nextval('public.reservation_reservation_id_seq'::regclass);


--
-- Name: routes route_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN route_id SET DEFAULT nextval('public.routes_route_id_seq'::regclass);


--
-- Name: schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.schedule_schedule_id_seq'::regclass);


--
-- Data for Name: bus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bus (plate_number, bus_name, capacity, model, manufacturer, color, fueltype, status, driver_id, created) FROM stdin;
XXXX-12345	Metro Shuttle A	80	Old	Ford INC.	Red	Diesel	Available	1	2023-06-06 07:45:22
XXXX-12346	Maharlika	98	New	Mitsubishi	Pink	Diesel	Available	5	2023-06-08 00:26:21
XXXX-12347	Maharlika	98	New	Mitsubishi	Pink	Diesel	NA	5	2023-06-08 00:29:28
XXXX-12348	Nissan	48	New	Mitsubishi	Brown	Diesel	Available	5	2023-06-08 00:29:28
XXXX-12349	Electric Bus	98	New	Mitsubishi	Pink	Electric	Available	5	2023-06-08 00:33:03
XXXX-12351	Nissan	48	New	Mitsubishi	Brown	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12352	Eugene	38	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12353	Ford	56	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12354	Ford	56	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12355	Ford	56	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12356	Ford	56	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12357	Ford	56	New	Mitsubishi	Yellow	Diesel	Available	5	2023-06-08 00:33:03
XXXX-12358	Electric Bus	98	New	Mitsubishi	Pink	Electric	Available	5	2023-06-08 00:33:03
XXXX-12359	Electric Bus	98	New	Mitsubishi	Pink	Electric	Available	5	2023-06-08 00:33:03
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver (driver_id, name, license_number, contact_number, email, address, experience, availability, created) FROM stdin;
1	John Doe	AAAA-11111	1234567890	johndoe@example.com	123 Main St	5 years	Available	2023-06-10 12:51:37.705166
2	Ford Ulbata Jr.	AAAA-12345	0936415272	ulbata@gmail.com	Fatima General Santos City	2 years	Available	2023-06-06 08:18:56
3	Richard Bangoy	AAAA-12346	09664267189	bangoy@gmail.com	Lagao General Santos City	10 years	Available	2023-06-06 08:18:56
4	John Doe	AAAA-11111	1234567890	johndoe@example.com	123 Main St	5 years	Available	2023-06-06 08:18:56
5	Jane Smith	BBBB-22222	0987654321	janesmith@example.com	456 Elm St	3 years	Not Available	2023-06-06 08:18:56
6	David Johnson	CCCC-33333	9876543210	davidjohnson@example.com	789 Oak Ave	7 years	Available	2023-06-06 08:18:56
7	Emily Davis	DDDD-44444	0123456789	emilydavis@example.com	321 Maple Rd	2 years	Not Available	2023-06-06 08:18:56
8	Michael Wilson	EEEE-55555	6789012345	michaelwilson@example.com	654 Pine Ln	6 years	Available	2023-06-06 08:18:56
9	Sarah Anderson	FFFF-66666	5432167890	sarahanderson@example.com	987 Cedar St	4 years	Not Available	2023-06-06 08:18:56
10	Matthew Thomas	GGGG-77777	8901234567	matthewthomas@example.com	876 Birch Ave	8 years	Available	2023-06-06 08:18:56
\.


--
-- Data for Name: passenger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passenger (passenger_id, name, age, gender, contact, email, address, nationality, created) FROM stdin;
1	Jessie Conn Ralph M. Sam	21	Male	981821721	sam@gmail.com	Fatima General Santos City	Filipino	2023-06-10 13:11:45.123632
2	Matthew Fang Bilaos	20	Male	981821729	bilaos@gmail.com	Zone 4 Block 6 General Santos City	Filipino	2023-06-10 13:11:45.123632
3	Mateo Cortez	24	Male	981672162	cortez@gmail.com	Fatima General Santos City	Filipino	2023-06-10 13:11:45.123632
4	Richard Bangoy Jr.	24	Male	981672162	bangoy@gmail.com	Fatima General Santos City	Filipino	2023-06-10 13:11:45.123632
5	Mateo Cortez	24	Male	981672162	cortez@gmail.com	Fatima General Santos City	Filipino	2023-06-10 13:11:45.123632
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (reservation_id, passenger_id, schedule_id, seat_number, created) FROM stdin;
4	1	8	10	2023-06-10 13:41:53.560385
7	1	8	5	2023-06-10 14:01:17.668778
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (route_id, source, destination, distance, duration, fare, stops, departure, arrival_time, created) FROM stdin;
2	Gensan	Davao	2 km	20 Minutes	200	Davao Terminal	04:30:00	04:50:00	2023-06-06 07:49:44
3	Polomolok	Davao City		200 km	500	Davao City Terminal	00:00:10	00:00:12	2023-06-08 10:40:46
4	Polomolok	Davao City		200 km	500	Davao City Terminal	00:00:10	00:00:12	2023-06-08 10:44:00
5	Tagum City	Davao City		30 km	80	Davao City Terminal	00:00:10	00:00:12	2023-06-08 10:44:00
6	Polomolok	Tagum City		200 km	500	Tagum City Terminal	00:00:11	00:00:12	2023-06-08 10:44:00
7	Polomolok	Lagao		100 km	80	Lagao	00:00:10	00:00:12	2023-06-08 10:44:00
8	Fatima	Lagao		30 km	90	Lagao	00:00:10	00:00:12	2023-06-08 10:44:00
9	Fatima	Calumpang		10 km	20	Lagao	00:00:10	00:00:12	2023-06-08 10:44:00
10	Polomolok	Gensan	20 km	30 minutes	100	Bolaong Terminal	11:00:00	12:00:00	2023-06-08 11:17:41
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (schedule_id, plate_number, route_id, created) FROM stdin;
7	XXXX-12345	2	2023-06-10 13:08:16.553274
8	XXXX-12346	5	2023-06-10 13:08:16.553274
9	XXXX-12347	9	2023-06-10 13:08:16.553274
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (ticket_number, reservation_id, ticket_status, created) FROM stdin;
\.


--
-- Name: driver_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_driver_id_seq', 10, true);


--
-- Name: passenger_passenger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passenger_passenger_id_seq', 5, true);


--
-- Name: reservation_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_reservation_id_seq', 7, true);


--
-- Name: routes_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_route_id_seq', 10, true);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 9, true);


--
-- Name: bus bus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus
    ADD CONSTRAINT bus_pkey PRIMARY KEY (plate_number);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_id);


--
-- Name: passenger passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (passenger_id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservation_id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (route_id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (ticket_number);


--
-- Name: bus_driver_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bus_driver_id_index ON public.bus USING btree (driver_id);


--
-- Name: index_bus_plate_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bus_plate_number ON public.bus USING btree (plate_number);


--
-- Name: index_passenger_passenger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_passenger_passenger_id ON public.passenger USING btree (passenger_id);


--
-- Name: index_routes_route_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_routes_route_id ON public.routes USING btree (route_id);


--
-- Name: index_schedule_schedule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_schedule_schedule_id ON public.schedule USING btree (schedule_id);


--
-- Name: index_ticket_reservation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ticket_reservation_id ON public.ticket USING btree (reservation_id);


--
-- Name: bus fk_bus_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus
    ADD CONSTRAINT fk_bus_driver FOREIGN KEY (driver_id) REFERENCES public.driver(driver_id);


--
-- Name: reservation fk_reservation_passenger; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_reservation_passenger FOREIGN KEY (passenger_id) REFERENCES public.passenger(passenger_id);


--
-- Name: reservation fk_reservation_schedule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_reservation_schedule FOREIGN KEY (schedule_id) REFERENCES public.schedule(schedule_id);


--
-- Name: schedule fk_schedule_bus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_schedule_bus FOREIGN KEY (plate_number) REFERENCES public.bus(plate_number);


--
-- Name: schedule fk_schedule_routes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_schedule_routes FOREIGN KEY (route_id) REFERENCES public.routes(route_id);


--
-- Name: ticket fk_ticket_reservation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT fk_ticket_reservation FOREIGN KEY (reservation_id) REFERENCES public.reservation(reservation_id);


--
-- PostgreSQL database dump complete
--

