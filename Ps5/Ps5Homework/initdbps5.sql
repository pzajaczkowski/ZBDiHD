drop table Visit CASCADE CONSTRAINTS;
drop table City CASCADE CONSTRAINTS;
drop table Time CASCADE CONSTRAINTS;
drop table Age CASCADE CONSTRAINTS;
drop table VisitorCountry CASCADE CONSTRAINTS;
drop table AccommodationType CASCADE CONSTRAINTS;
drop table VisitType CASCADE CONSTRAINTS;

create table Time(
id_time NUMBER PRIMARY KEY,
month NUMBER(2),
year NUMBER(4));

create table City(
id_city NUMBER PRIMARY KEY,
name VARCHAR2(30),
country VARCHAR2(50),
continent VARCHAR2(50));

create table VisitorCountry(
id_country NUMBER PRIMARY KEY,
visitor_country VARCHAR2(30),
visitor_continent VARCHAR2(50));

create table AccommodationType(
id_type NUMBER PRIMARY KEY,
name VARCHAR2(30));

create table VisitType(
id_visit_type NUMBER PRIMARY KEY,
description VARCHAR2(30));

create table Age(
id_age NUMBER PRIMARY KEY,
age_from NUMBER(3),
age_to NUMBER(3),
name VARCHAR2(20)
);

create table Visit(
id_visit NUMBER PRIMARY KEY,
id_city NUMBER REFERENCES City(id_city),
id_country NUMBER REFERENCES VisitorCountry(id_country),
id_age NUMBER REFERENCES Age(id_age),
id_time NUMBER REFERENCES Time(id_time),
id_type NUMBER REFERENCES AccommodationType(id_type),
id_visit_type NUMBER REFERENCES VisitType(id_visit_type),
number_of_visitors NUMBER,
number_of_visits NUMBER,
profit NUMBER
);


INSERT INTO  visitorcountry VALUES(1, 'Poland','Europe');
INSERT INTO  visitorcountry VALUES(2, 'Sweden','Europe');
INSERT INTO  visitorcountry VALUES(3, 'Norway','Europe');
INSERT INTO  visitorcountry VALUES(4, 'Estonia','Europe');
INSERT INTO  visitorcountry VALUES(5, 'Finland','Europe');
INSERT INTO  visitorcountry VALUES(6, 'Spain','Europe');
INSERT INTO  visitorcountry VALUES(7, 'Lithuania','Europe');
INSERT INTO  visitorcountry VALUES(8, 'Germany','Europe');
INSERT INTO  visitorcountry VALUES(9, 'The Netherlands','Europe');
INSERT INTO  visitorcountry VALUES(10, 'Ireland','Europe');
INSERT INTO  visitorcountry VALUES(11, 'India','Asia');
INSERT INTO  visitorcountry VALUES(12, 'Turkey','Asia');
INSERT INTO  visitorcountry VALUES(13, 'Japan','Asia');
INSERT INTO  visitorcountry VALUES(14, 'Singapore','Asia');
INSERT INTO  visitorcountry VALUES(15, 'Australia','Australia');
INSERT INTO  visitorcountry VALUES(16, 'Canada','North America');
INSERT INTO  visitorcountry VALUES(17, 'USA','North America');
INSERT INTO  visitorcountry VALUES(18, 'Mexico','North America');
INSERT INTO  visitorcountry VALUES(19, 'Peru','South America');
INSERT INTO  visitorcountry VALUES(20, 'Tunesia','Africa');

INSERT INTO  time VALUES(1,1,2013);
INSERT INTO  time VALUES(2,2,2013);
INSERT INTO  time VALUES(3,3,2013);
INSERT INTO  time VALUES(4,4,2013);
INSERT INTO  time VALUES(5,5,2013);
INSERT INTO  time VALUES(6,6,2013);
INSERT INTO  time VALUES(7,7,2013);
INSERT INTO  time VALUES(8,8,2013);
INSERT INTO  time VALUES(9,9,2013);
INSERT INTO  time VALUES(10,10,2013);
INSERT INTO  time VALUES(11,11,2013);
INSERT INTO  time VALUES(12,12,2013);
INSERT INTO  time VALUES(13,1,2014);
INSERT INTO  time VALUES(14,2,2014);
INSERT INTO  time VALUES(15,3,2014);
INSERT INTO  time VALUES(16,4,2014);
INSERT INTO  time VALUES(17,5,2014);
INSERT INTO  time VALUES(18,6,2014);
INSERT INTO  time VALUES(19,7,2014);
INSERT INTO  time VALUES(20,8,2014);
INSERT INTO  time VALUES(21,9,2014);
INSERT INTO  time VALUES(22,10,2014);
INSERT INTO  time VALUES(23,11,2014);
INSERT INTO  time VALUES(24,12,2014);
INSERT INTO  time VALUES(25,1,2015);
INSERT INTO  time VALUES(26,2,2015);
INSERT INTO  time VALUES(27,3,2015);
INSERT INTO  time VALUES(28,4,2015);
INSERT INTO  time VALUES(29,5,2015);
INSERT INTO  time VALUES(30,6,2015);
INSERT INTO  time VALUES(31,7,2015);
INSERT INTO  time VALUES(32,8,2015);
INSERT INTO  time VALUES(33,9,2015);
INSERT INTO  time VALUES(34,10,2015);
INSERT INTO  time VALUES(35,11,2015);
INSERT INTO  time VALUES(36,12,2015);
INSERT INTO  time VALUES(37,1,2016);
INSERT INTO  time VALUES(38,2,2016);
INSERT INTO  time VALUES(39,3,2016);
INSERT INTO  time VALUES(40,4,2016);
INSERT INTO  time VALUES(41,5,2016);
INSERT INTO  time VALUES(42,6,2016);
INSERT INTO  time VALUES(43,7,2016);
INSERT INTO  time VALUES(44,8,2016);
INSERT INTO  time VALUES(45,9,2016);
INSERT INTO  time VALUES(46,10,2016);
INSERT INTO  time VALUES(47,11,2016);
INSERT INTO  time VALUES(48,12,2016);
INSERT INTO  time VALUES(49,1,2017);
INSERT INTO  time VALUES(50,2,2017);
INSERT INTO  time VALUES(51,3,2017);
INSERT INTO  time VALUES(52,4,2017);
INSERT INTO  time VALUES(53,5,2017);
INSERT INTO  time VALUES(54,6,2017);
INSERT INTO  time VALUES(55,7,2017);
INSERT INTO  time VALUES(56,8,2017);
INSERT INTO  time VALUES(57,9,2017);
INSERT INTO  time VALUES(58,10,2017);
INSERT INTO  time VALUES(59,11,2017);
INSERT INTO  time VALUES(60,12,2017);
INSERT INTO  time VALUES(61,1,2018);
INSERT INTO  time VALUES(62,2,2018);
INSERT INTO  time VALUES(63,3,2018);
INSERT INTO  time VALUES(64,4,2018);
INSERT INTO  time VALUES(65,5,2018);
INSERT INTO  time VALUES(66,6,2018);
INSERT INTO  time VALUES(67,7,2018);
INSERT INTO  time VALUES(68,8,2018);
INSERT INTO  time VALUES(69,9,2018);
INSERT INTO  time VALUES(70,10,2018);
INSERT INTO  time VALUES(71,11,2018);
INSERT INTO  time VALUES(72,12,2018);


INSERT INTO city VALUES(1, 'Warsaw','Poland', 'Europe');
INSERT INTO city VALUES(2, 'Bialystok','Poland', 'Europe');
INSERT INTO city VALUES(3, 'Paris', 'France', 'Europe');
INSERT INTO city VALUES(4, 'Berlin','Germany', 'Europe');
INSERT INTO city VALUES(5, 'Rome','Italy', 'Europe');
INSERT INTO city VALUES(6, 'Madrid','Spain', 'Europe');
INSERT INTO city VALUES(7, 'Barcelona','Spain', 'Europe');
INSERT INTO city VALUES(8, 'Florence','Italy', 'Europe');
INSERT INTO city VALUES(9, 'Quito','Ecuador', 'South America');
INSERT INTO city VALUES(10, 'Cuenca','Ecuador', 'South America');
INSERT INTO city VALUES(11, 'Cartagena','Colombia', 'South America');
INSERT INTO city VALUES(12, 'San Pedro de Atacama','Chile', 'South America');
INSERT INTO city VALUES(13, 'Isla Negra','Chile', 'South America');
INSERT INTO city VALUES(14, 'Cusco','Peru', 'South America');
INSERT INTO city VALUES(15, 'Lima','Peru', 'South America');
INSERT INTO city VALUES(16, 'Merida','Mexico', 'North America');
INSERT INTO city VALUES(17, 'Oaxaca','Mexico', 'North America');
INSERT INTO city VALUES(18, 'Tulum','Mexico', 'North America');
INSERT INTO city VALUES(19, 'Amsterdam','The Netherlands', 'Europe');
INSERT INTO city VALUES(20, 'Toledo','Spain', 'Europe');

INSERT INTO city VALUES(21, 'Tena','Ecuador', 'South America');
INSERT INTO city VALUES(22, 'Porto','Portugal', 'Europe');
INSERT INTO city VALUES(23, 'Burgos','Spain', 'Europe');


INSERT INTO accommodationtype  VALUES(1, 'Entire house');
INSERT INTO accommodationtype  VALUES(2, 'Room');
INSERT INTO accommodationtype  VALUES(3, 'Apartment');
INSERT INTO accommodationtype  VALUES(4, 'Room to share');
INSERT INTO accommodationtype  VALUES(5, 'Cottage');

INSERT INTO visittype  VALUES(1, 'Individual');
INSERT INTO visittype  VALUES(2, 'Organized group');
INSERT INTO visittype  VALUES(3, 'Business');


INSERT INTO age  VALUES(1,null , 12, 'child');
INSERT INTO age  VALUES(2, 13,18, 'teenager');
INSERT INTO age  VALUES(3, 19,30, 'young adult');
INSERT INTO age  VALUES(4, 31,50, 'adult');
INSERT INTO age  VALUES(5, 51,65, 'middle age');
INSERT INTO age  VALUES(6, 66,null, 'senior');



INSERT INTO visit VALUES(1, 1, 2, 5, 1, 1, 1, 100, 3, 50);
INSERT INTO visit VALUES(2, 2, 1, 5, 1, 2, 1, 200, 2, 70);
INSERT INTO visit VALUES(3, 3, 3, 5, 1, 3, 1, 60, 1, 30);
INSERT INTO visit VALUES(4, 1, 2, 4, 1, 1, 1, 40, 1, 20);
INSERT INTO visit VALUES(5, 2, 1, 4, 1, 2, 1, 170, 2, 30);
INSERT INTO visit VALUES(6, 3, 3, 4, 1, 3, 1, 130, 3, 80);

INSERT INTO visit VALUES(7, 4, 10, 3, 1, 1, 1, 40, 1, 20);
INSERT INTO visit VALUES(8, 5, 10, 3, 1, 2, 3, 100, 2, 30);
INSERT INTO visit VALUES(9, 6, 4, 2, 1, 2, 1, 200, 5, 80);
INSERT INTO visit VALUES(10, 7, 5, 2, 1, 3, 2, 40, 1, 20);
INSERT INTO visit VALUES(11, 8, 5, 5, 1, 1, 1, 130, 2, 32);
INSERT INTO visit VALUES(12, 9, 4, 5, 1, 2, 3, 105, 3, 56);
INSERT INTO visit VALUES(13, 10, 1, 6, 1, 3, 1, 120, 3, 30);

INSERT INTO visit VALUES(14, 1, 2, 5, 11, 1, 1, 100, 3, 50);
INSERT INTO visit VALUES(15, 2, 1, 5, 11, 2, 2, 200, 2, 70);
INSERT INTO visit VALUES(16, 3, 3, 5, 11, 3, 1, 60, 1, 30);
INSERT INTO visit VALUES(17, 1, 2, 4, 21, 1, 2, 40, 1, 20);
INSERT INTO visit VALUES(18, 2, 1, 4, 21, 2, 1, 170, 2, 30);
INSERT INTO visit VALUES(19, 3, 3, 4, 21, 3, 3, 130, 3, 80);

INSERT INTO visit VALUES(20, 4, 10, 3, 21, 4, 3, 40, 1, 20);
INSERT INTO visit VALUES(21, 5, 10, 3, 21, 2, 2, 100, 2, 30);
INSERT INTO visit VALUES(22, 6, 4, 2, 21, 3, 1, 200, 5, 80);
INSERT INTO visit VALUES(23, 7, 5, 2, 31, 3, 1, 40, 1, 20);
INSERT INTO visit VALUES(24, 8, 5, 5, 41, 1, 2, 130, 2, 32);
INSERT INTO visit VALUES(25, 9, 4, 5, 51, 2, 1, 105, 3, 56);
INSERT INTO visit VALUES(26, 10, 1, 6, 61, 3, 3, 120, 3, 30);


INSERT INTO visit VALUES(27, 4, 4, 1, 1, 1, 1, 40, 1, 20);
INSERT INTO visit VALUES(28, 5, 5, 1, 1, 2, 2, 10, 2, 5);
INSERT INTO visit VALUES(29, 6, 6, 1, 1, 2, 1, 20, 5, 10);
INSERT INTO visit VALUES(30, 7, 7, 2, 1, 3, 2, 40, 1, 20);
INSERT INTO visit VALUES(31, 8, 8, 1, 1, 1, 3, 130, 2, 32);
INSERT INTO visit VALUES(32, 9, 9, 1, 1, 2, 1, 10, 3, 6);
INSERT INTO visit VALUES(33, 10, 10, 2, 1, 3, 3, 120, 3, 30);

INSERT INTO visit VALUES(34, 4, 11, 3, 1, 1, 3, 40, 1, 20);
INSERT INTO visit VALUES(35, 5, 12, 4, 1, 2, 1, 30, 2, 5);
INSERT INTO visit VALUES(36, 6, 13, 4, 1, 2, 2, 40, 5, 10);
INSERT INTO visit VALUES(37, 7, 14, 4, 1, 3, 1, 60, 1, 20);
INSERT INTO visit VALUES(38, 8, 15, 5, 1, 4, 2, 100, 2, 32);
INSERT INTO visit VALUES(39, 9, 16, 3, 1, 5, 3, 100, 3, 60);

INSERT INTO visit VALUES(40, 4, 11, 3, 31, 1, 1, 40, 1, 20);
INSERT INTO visit VALUES(41, 5, 12, 4, 21, 2, 3, 30, 2, 5);
INSERT INTO visit VALUES(42, 6, 13, 4, 22, 2, 1, 40, 5, 10);
INSERT INTO visit VALUES(43, 7, 14, 4, 23, 3, 2, 60, 1, 20);
INSERT INTO visit VALUES(44, 8, 15, 5, 43, 4, 1, 100, 2, 32);
INSERT INTO visit VALUES(45, 9, 16, 3, 44, 5, 2, 100, 3, 60);

INSERT INTO visit VALUES(46, 4, 11, 3, 50, 1, 1, 40, 1, 20);
INSERT INTO visit VALUES(47, 5, 12, 4, 51, 2, 2, 30, 2, 5);
INSERT INTO visit VALUES(48, 6, 13, 4, 52, 2, 1, 40, 5, 10);
INSERT INTO visit VALUES(49, 7, 14, 4, 61, 3, 2, 60, 1, 20);
INSERT INTO visit VALUES(50, 8, 15, 5, 61, 4, 1, 100, 2, 32);
INSERT INTO visit VALUES(51, 9, 16, 3, 71, 5, 3, 100, 3, 60);
INSERT INTO visit VALUES(52, 10, 17, 5, 72, 4, 1, 120, 3, 30);

INSERT INTO visit VALUES(53, 15, 2, 5, 1, 1, 3, 100, 3, 50);
INSERT INTO visit VALUES(54, 12, 1, 5, 1, 2, 1, 200, 2, 70);

commit;