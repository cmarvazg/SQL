alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';

create table customers(
id_customer int primary key,
                      fname varchar(20) not null,
                      lname varchar(20) not null,
                      street varchar(50) not null,
                      city varchar(30) not null,
                      country varchar(30) not null,
                      postcode varchar(20) not null
);

INSERT INTO customers VALUES (1, 'John', 'Taylor', 'Main street', 'Kansas City', 'Estados Unidos', 12345);
INSERT INTO customers VALUES (2, 'Candy', 'Wilson', 'Central Avenue', 'Orlando', 'Estados Unidos', 56783);
INSERT INTO customers VALUES (3, 'Haidée', 'Williams', 'Pine street', 'Atlanta', 'Estados Unidos', 563843);
INSERT INTO customers VALUES (4, 'Jack', 'Johnson', 'Care street', 'Filadelfia', 'Estados Unidos', 892723);
INSERT INTO customers VALUES (5, 'George', 'Davies', 'Wall Street', 'New York', 'Estados Unidos', 637434);

create table emails(
id_email int primary key,
           id_customer int references customers(id_customer),
           email varchar(50) not null
);

INSERT INTO emails VALUES(6, 1, 'charliebrown@gmai.com');
INSERT INTO emails VALUES(7, 2, 'snoppy@gmai.com');
INSERT INTO emails VALUES(8, 3, 'androide12@gmai.com');
INSERT INTO emails VALUES(9, 5, 'georgedavis@gmai.com');
INSERT INTO emails VALUES(10, 4, 'jacki12@gmai.com');

create table phones(
id_phone int primary key,
                    id_customer int references customers(id_customer),
                    country_code varchar(2) not null,
                    are_code varchar(2) not null,
                    numero varchar(8) not null
);

INSERT INTO phones VALUES (11, 1, 01, 11, 15563924);
INSERT INTO phones VALUES (12, 5, 02, 22, 15508321);
INSERT INTO phones VALUES (13, 2, 03, 33, 15563846);
INSERT INTO phones VALUES (14, 4, 04, 44, 15568238);
INSERT INTO phones VALUES (15, 3, 05, 55, 15564867);

create table classes(
id_class int primary key,
           clase varchar(20) not null
);

INSERT INTO classes VALUES (16, 'Premium economy');
INSERT INTO classes VALUES (17, 'Business');
INSERT INTO classes VALUES (18, 'Economy');
INSERT INTO classes VALUES (19, 'Economy');
INSERT INTO classes VALUES (20, 'Premium');

create table status(
id_status int primary key,
            status varchar(10) not null
);

INSERT INTO status VALUES (21, 'Cancelled');
INSERT INTO status VALUES (22, 'Active');
INSERT INTO status VALUES (23, 'Active');
INSERT INTO status VALUES (24, 'Active');
INSERT INTO status VALUES (25, 'Cancelled');

create table country (
id_country int primary key,
           nombre varchar(30)
);

INSERT INTO country VALUES (26, 'USA');
INSERT INTO country VALUES (27, 'UK');
INSERT INTO country VALUES (28, 'Australia');
INSERT INTO country VALUES (29, 'Canadá');
INSERT INTO country VALUES (30, 'France');

create table airline(
code_airline varchar(10) primary key,
           id_country int references country(id_country)
);

INSERT INTO airline VALUES (31, 26);
INSERT INTO airline VALUES (32, 27);
INSERT INTO airline VALUES (33, 28);
INSERT INTO airline VALUES (34, 29);
INSERT INTO airline VALUES (35, 30);

create table city(
id_city int primary key,
           nombre varchar(30) not null,
           id_country int references country(id_country)
);

INSERT INTO city VALUES (36, 'Toronto', 26);
INSERT INTO city VALUES (37, 'London', 27);
INSERT INTO city VALUES (38, 'Chicago', 26);
INSERT INTO city VALUES (39, 'New York', 26);
INSERT INTO city VALUES (40, 'Paris', 30);

create table booking(
id_booking int primary key,
           price decimal(8,2) not null,
           id_city int references city(id_city),
           id_satus int references status(id_status),
           id_class int references classes(id_class),
           id_customer int references customers(id_customer),
           fecha date not null
);

INSERT INTO booking VALUES (41, '31', 36, 21, 16, 1, '31/05/2022' );
INSERT INTO booking VALUES (42, '50', 37, 22, 17, 2, '01/06/2022' );
INSERT INTO booking VALUES (43, '18', 38, 23, 18, 3, '02/06/2022');
INSERT INTO booking VALUES (44, '25', 39, 24, 19, 4, '03/06/2022');
INSERT INTO booking VALUES (45, '60', 40, 25, 20, 5, '04/06/2022');

create table flight(
    no_flight int primary key,
    smoking_allowed varchar(2),
    code_airline varchar(10) references airline(code_airline),
    no_available varchar(1) not null);

INSERT INTO flight VALUES (1234, 'si', 31, '1');
INSERT INTO flight VALUES (1434, 'si', 32, '2');
INSERT INTO flight VALUES (2314, 'no', 33, '3');
INSERT INTO flight VALUES (2334, 'si', 34, '4');
INSERT INTO flight VALUES (4334, 'no', 35, '5');


create table flight_availability(
    id_availability int primary key,
    time_departure varchar(30) not null,
    no_flight int references flight(no_flight),
    time_arriva varchar(30)
);

INSERT INTO flight_availability VALUES (40, '16:00:00', 1234, '20:00:00');
INSERT INTO flight_availability VALUES (41, '11:00:00', 1434, '15:00:00');
INSERT INTO flight_availability VALUES (42, '13:00:00', 2314, '22:00:00');
INSERT INTO flight_availability VALUES (43, '17:00:00', 2334, '19:00:00');
INSERT INTO flight_availability VALUES (44, '10:00:00', 4334, '14:00:00');

select count(*)
from country;

select count(*)
from status
where status like 'Active';

select count(*)
from customers ;

select count(*)
from emails ;
