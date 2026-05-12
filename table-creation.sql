create database project_1;

use project_1;

-- table 1--  
create table users(
   user_id int primary key,
   first_name varchar(100) not null,
   last_name varchar(100),
   email varchar(100) not null unique,
   phone varchar(20),
   gender varchar(20),
   date_of_birth date,
   password varchar(50) not null
); 
insert into users (user_id,first_name,last_name,email,phone,gender,date_of_birth,password) values
(100001,'Sathish','Kumar','satths@gmail.com','6352851995','Male','2004-08-27','sathish@2722'),
(100002,'Ramyaa','sivasankari','ramyaa@gmail.com','9122163990','Female','2005-02-22','ramyaa@22'),
(100003,'Sakthi','chandran','sakthi@gmail.com','7215077099','Male','2005-09-30','sakthi@elsa'),
(100004,'Raj','ramar','ramraj@gmail.com','9363992682','Male','2005-07-03','ramar@99'),
(100005,'Janish','mohan','mohan@gmail.com','6790013081','Male','2004-04-03','mohan@jd'),
(100006,'Uma','dhandapani','uma@gmail.com','8070814953','Female','1990-05-18','uma@sathish'),
(100007,'Deepa','D','deepa11@gmail.com','9750021623','Female','2002-09-11','deepa@19121'),
(100008,'Sara','dhaganthika','sara@gmail.com','6158527809','Female','2006-01-30','sara@123'),
(100009,'Sasi','vinai','sasi31@gmail.com','9876754321','Male','2004-08-31','sasi@31'),
(100010,'venkat','arumugam','rasa@mail.com','6390017941','Male','2005-03-10','rasa@69');

-- table 2-- 
create table genres(
   genres_name varchar(20) primary key,
   description text
);
insert into genres (genres_name,description) values
('Action','Movies with fast-paced scenes, fights, chases, explosions, and stunts.'),
('Romance','Movies that focus on love stories and relationships.'),
('Comedy','Movies designed to make people laugh through humor, jokes, or funny situations.'),
('Horror','Movies that create fear, suspense, and shock using scary elements.'),
('Adventure','Movies that involve journeys, exploration, and exciting experiences.'),
('Crime','Movies about criminals, police investigations, or illegal activities.'),
('Thriller','Movies with suspense, mystery, and tension that keep viewers guessing.'),
('Science-Fi','Movies based on futuristic science, space, robots, or advanced technology.'),
('Fantasy','Movies with magical elements, imaginary worlds, or supernatural powers.'),
('Animation','Movies created using drawings, CGI, or computer graphics instead of real actors.'),
('Super-hero','Movies about characters with superpowers or extraordinary abilities.'),
('Historical','Movies based on past events or time periods.'),
('Biography','Movies based on a real person’s life story.'),
('Psychological','Movies that explore the human mind, emotions, and mental conflict.'),
('Survival','Movie about characters struggle to stay alive in extreme situations.');

-- table 3-- 
create table languages(
   language_id int primary key,
   language_name varchar(40)
);
insert into languages(language_id,language_name) values
(501,'Tamil'),
(502,'English'),
(503,'Malayalam'),
(504,'Hindi'),
(505,'Japanese'),
(506,'Telugu');

-- table 4--  
create table movies(
   movie_id int primary key,
   title varchar(50),
   genres_name varchar(20) ,
   language_id int ,
   duration int,
   certified varchar(20),
   release_year year,
   director varchar(40),
   foreign key (genres_name) references genres (genres_name),
   foreign key (language_id)references languages (language_id)
   );
insert into movies (movie_id,title,genres_name,language_id,duration,certified,release_year,director)values
(1, 'Fight Club', 'Psychological', 502, 139, 'R', 1999, 'David Fincher'),
(2, 'Vada Chennai', 'Crime', 501, 166, 'A', 2018, 'Vetrimaaran'),
(3, 'Premam', 'Romance', 503, 157, 'U/A', 2015, 'Alphonse Puthren'),
(4, 'John Wick', 'Action', 502, 101, 'A', 2014, 'Chad Stahelski'),
(5, 'Life of Pi', 'Adventure', 502, 127, 'U/A', 2012, 'Ang Lee'),
(6, 'Interstellar', 'Science-Fi', 502, 169, 'PG', 2014, 'Christopher Nolan'),
(7, 'Manjummel Boys', 'Survival', 503, 135, 'U/A', 2024, 'Chidambaram'),
(8, 'The Dark Knight', 'Action', 502, 152, 'U/A', 2008, 'Christopher Nolan'),
(9, 'Inception', 'Science-Fi', 502, 148, 'U/A', 2010, 'Christopher Nolan'),
(10, 'Titanic', 'Romance', 502, 195, 'U/A', 1997, 'James Cameron'),
(11, 'Avengers Endgame', 'Action', 502, 181, 'U/A', 2019, 'Anthony Russo'),
(12, 'Joker', 'Psychological', 502, 122, 'A', 2019, 'Todd Phillips'),
(13, 'Gladiator', 'Historical', 502, 155, 'A', 2000, 'Ridley Scott'),
(14, 'The Lion King', 'Animation', 502, 88, 'U', 1994, 'Roger Allers'),
(15, 'Bahubali', 'Action', 506, 159, 'U/A', 2015, 'S S Rajamouli'),
(16, 'KGF', 'Action', 506, 156, 'U/A', 2018, 'Prashanth Neel'),
(17, 'Conjuring', 'Horror', 502, 112, 'A', 2013, 'James Wan'),
(18, 'Minnal Murali', 'Super-hero', 503, 161, 'U', 2021, 'Basil Joseph'),
(19, 'RRR', 'Action', 506, 182, 'U/A', 2022, 'S S Rajamouli'),
(20, 'Vikram', 'Action', 501, 175, 'U/A', 2022, 'Lokesh Kanagaraj'),
(21, 'Ponniyin Selvan', 'Historical', 501, 167, 'U/A', 2022, 'Mani Ratnam');

-- table 5--
create table theaters(
   theater_id int primary key,
   theater_name varchar(40),
   location text,
   city varchar(40),
   total_screens int
);
insert into theaters (theater_id,theater_name,location,city,total_screens) values
(301,'IMAX','Nexus Vijaya Mall','Vadapalani',4),
(302,'PVR','The Providence Mall','Puducherry',2),
(303,'Janas','Ghandhi Road','Villupuram',4),
(304,'INOX','The Marina Mall','Navalur',6),
(305,'Mayajaal','ECR Road','Muttukaadu',12),
(306,'AGS Cinemas','Vivra Mall','Navalur',5),
(307,'Sathyam Cinemas','Royapettah','Chennai',4),
(308,'Escape Cinemas','Express Avenue','Peters Colony',6),
(309,'Rohini Silver Screens','Ponnamalle Road','Koyambedu',10),
(310,'SPI Palazzo','Forum Mall','Vadapalani',3),
(311,'Kamala Cinemas','Vadapalani','Chennai',4),
(312,'Vettri','Chromepet','Tambaram',1);

-- table 6--  
create table screens(
   screen_id int primary key,
   theater_id int ,
   total_seats int,
   screen_type varchar(30),
   foreign key (theater_id) references theaters (theater_id)
);
insert into screens (screen_id,theater_id,total_seats,screen_type) values
(401,305,250,'IMAX'),
(402,301,120,'Normal'),
(403,309,220,'IMAX'),
(404,302,150,'Premium'),
(405,307,120,'Classic'),
(406,304,200,'IMAX'),
(407,311,120,'Normal'),
(408,303,100,'Normal'),
(409,308,200,'Luxury'),
(410,306,180,'Premium'),
(411,310,140,'Premium'),
(412,305,200,'Premium'),
(413,302,120,'Normal'),
(414,309,200,'Premium'),
(415,304,150,'Premium'),
(416,307,100,'Normal'),
(417,308,180,'Premium'),
(418,301,100,'Normal'),
(419,306,150,'Normal'),
(420,303,90,'Normal');

-- table 7--
create table seats(
   seat_id int primary key,
   screen_id int , foreign key (screen_id) references screens (screen_id),
   seat_type varchar(10),
   seat_number varchar(5),
   price int,
   availability boolean default true,
   unique (screen_id , seat_number),
   foreign key (screen_id) references screens (screen_id)
);
insert into seats (seat_id,screen_id,seat_type,seat_number,price,availability) values
(601,410,'Gold','J1',200,true),
(602,402,'Silver','B1',150,true),
(603,418,'Budget','R1',100,true),
(604,406,'VIP','F1',300,true),
(605,414,'Platinum','N1',250,true),
(606,401,'Couple','A1',350,true),
(607,417,'Gold','Q1',200,true),
(608,407,'Silver','G1',150,true),
(609,420,'Budget','T1',100,true),
(612,408,'Silver','H1',150,false),
(613,415,'Couple','O1',350,false),
(614,402,'Silver','B2',150,false),
(615,413,'Silver','M1',150,true),
(616,406,'VIP','F2',300,false),
(617,419,'Budget','S1',100,true),
(619,416,'Silver','P1',150,true),
(620,405,'Balcony','E1',180,true),
(621,409,'Platinum','I1',250,true),
(623,420,'Budget','T2',100,true),
(624,403,'VIP','C1',300,true),
(625,412,'Gold','L1',200,true),
(626,416,'Silver','P2',150,true),
(627,403,'VIP','C2',300,true),
(629,418,'Budget','R2',100,false),
(630,405,'Balcony','E2',180,true),
(631,414,'Platinum','N2',250,true),
(632,404,'Gold','D2',200,false),
(633,412,'Gold','L2',200,true),
(634,407,'Silver','G2',150,true),
(635,415,'Couple','O2',350,true),
(636,417,'Gold','Q2',200,true),
(637,410,'Gold','J2',200,true),
(638,419,'Budget','S2',100,true),
(639,411,'Platinum','K2',250,false),
(640,408,'Silver','H2',150,true);

-- table 8 --
create table shows(
   show_id int primary key,
   screen_id int , 
   movie_id int , 
   show_date date,
   show_time time,
   language_id int, 
   foreign key (screen_id) references screens (screen_id),
   foreign key (movie_id) references movies (movie_id),
   foreign key (language_id) references languages (language_id)
);
insert into shows (show_id,screen_id,movie_id,show_date,show_time,language_id) values
(1001,401,1,'2026-05-01','09:00:00',502),
(1002,402,2,'2026-05-01','13:30:00',501),
(1003,403,3,'2026-05-01','18:00:00',503),
(1004,404,4,'2026-05-01','23:00:00',502),
(1005,405,5,'2026-05-01','09:00:00',502),
(1006,406,6,'2026-05-01','13:30:00',502),
(1007,407,7,'2026-05-01','18:00:00',503),
(1008,408,8,'2026-05-01','23:00:00',502),
(1009,409,9,'2026-05-02','09:00:00',502),
(1010,410,10,'2026-05-02','13:30:00',502),
(1011,411,11,'2026-05-02','18:00:00',502),
(1012,412,12,'2026-05-02','23:00:00',502),
(1013,413,13,'2026-05-02','09:00:00',502),
(1014,414,14,'2026-05-02','13:30:00',502),
(1015,415,15,'2026-05-02','18:00:00',506),
(1016,416,16,'2026-05-02','23:00:00',506),
(1017,417,17,'2026-05-03','09:00:00',502),
(1018,418,18,'2026-05-03','13:30:00',503),
(1019,419,19,'2026-05-03','18:00:00',506),
(1020,420,20,'2026-05-03','23:00:00',501);

-- table 9 --
create table bookings(
   booking_id int primary key,
   user_id int , 
   show_id int , 
   booking_datetime datetime ,
   total_amount decimal(10,2),
   status varchar (20) default 'Confirmed' ,
   foreign key (user_id) references users (user_id),
   foreign key (show_id) references shows (show_id)
);  
insert into bookings (booking_id,user_id,show_id,booking_datetime,total_amount,status) values
(201,100008,1015,'2026-04-28 09:30:00',350,'Confirmed'),
(202,100001,1001,'2026-04-28 10:15:00',350,'Confirmed'),
(203,100002,1002,'2026-04-28 11:30:00',150,'Confirmed'),
(204,100003,1003,'2026-04-28 13:00:00',300,'Canceled'),
(205,100004,1004,'2026-04-28 15:30:00',200,'Confirmed'),
(206,100005,1005,'2026-04-28 18:00:00',180,'Confirmed'),
(207,100006,1006,'2026-04-28 20:30:00',300,'Canceled'),
(208,100007,1007,'2026-04-28 09:45:00',150,'Confirmed'),
(209,100008,1008,'2026-04-28 12:30:00',150,'Confirmed'),
(210,100009,1009,'2026-04-28 14:15:00',250,'Canceled'),
(211,100010,1010,'2026-04-29 09:00:00',200,'Confirmed'),
(212,100001,1011,'2026-04-29 10:30:00',250,'Confirmed'),
(213,100002,1012,'2026-04-29 12:00:00',200,'Confirmed'),
(214,100003,1013,'2026-04-29 13:45:00',150,'Canceled'),
(215,100004,1014,'2026-04-29 16:00:00',250,'Confirmed'),
(216,100005,1015,'2026-04-29 18:30:00',350,'Confirmed'),
(217,100006,1016,'2026-04-29 20:00:00',150,'Canceled'),
(218,100007,1017,'2026-04-29 09:15:00',200,'Confirmed'),
(219,100008,1018,'2026-04-29 11:30:00',100,'Confirmed'),
(220,100009,1019,'2026-04-29 13:00:00',100,'Canceled'),
(221,100010,1020,'2026-04-30 09:00:00',150,'Confirmed'),
(222,100001,1001,'2026-04-30 10:30:00',350,'Confirmed'),
(223,100002,1002,'2026-04-30 12:00:00',100,'Canceled'),
(224,100003,1003,'2026-04-30 14:00:00',300,'Confirmed'),
(225,100004,1004,'2026-04-30 16:30:00',200,'Confirmed'),
(226,100005,1005,'2026-04-30 18:45:00',180,'Canceled'),
(227,100006,1006,'2026-04-30 20:15:00',300,'Confirmed'),
(228,100007,1007,'2026-04-30 09:30:00',150,'Confirmed'),
(229,100008,1008,'2026-04-30 11:45:00',150,'Canceled'),
(230,100009,1009,'2026-04-30 13:15:00',250,'Confirmed');

-- table 10 --
create table booking_details(
   booking_detail_id int primary key,
   booking_id int ,
   seat_id int , 
   foreign key (booking_id) references bookings (booking_id),
   foreign key (seat_id) references seats (seat_id)
);
insert into booking_details (booking_detail_id,booking_id,seat_id) values
(701,201,606),
(702,203,602),
(703,204,624),
(704,205,614),
(705,206,620),
(706,207,616),
(707,208,608),
(708,209,640),
(709,210,621),
(710,211,601),
(711,212,639),
(712,213,625),
(713,214,615),
(714,215,605),
(715,216,613),
(716,217,619),
(717,218,607),
(718,219,603),
(719,220,617),
(720,221,609),
(721,224,627),
(722,225,632),
(723,226,630),
(724,227,604),
(725,228,634),
(726,229,612),
(727,230,621),
(728,202,636),
(729,222,633),
(730,223,638);

-- table 11 --  
create table payments(
   payment_id int primary key,
   booking_id int ,  
   payment_method varchar(20),
   payment_status varchar(20),
   amount_paid decimal(10,2),
   foreign key (booking_id) references bookings (booking_id)
);
insert into payments (payment_id,booking_id,payment_method,payment_status,amount_paid) values
(801,201,'UPI','Success',350),
(802,202,'Card','Success',350),
(803,203,'Cash','Success',150),
(804,204,'UPI','Failed',300),
(805,205,'Card','Failed',150),
(806,206,'Cash','Success',180),
(807,207,'UPI','Failed',300),
(808,208,'Card','Success',150),
(809,209,'Cash','Success',150),
(810,210,'UPI','Failed',250),
(811,211,'Card','Success',200),
(812,212,'Cash','Failed',250),
(813,213,'UPI','Success',200),
(814,214,'Card','Failed',150),
(815,215,'Cash','Success',250),
(816,216,'UPI','Failed',350),
(817,217,'Card','Success',150),
(818,218,'Cash','Success',200),
(819,219,'UPI','Success',100),
(820,220,'Card','Pending',100),
(821,221,'Cash','Success',150),
(822,222,'UPI','Success',350),
(823,223,'Card','Failed',100),
(824,224,'Cash','Success',300),
(825,225,'UPI','Failed',200),
(826,226,'Card','Success',180),
(827,227,'Cash','Success',300),
(828,228,'UPI','Success',150),
(829,229,'Card','Failed',150),
(830,230,'Cash','Success',250);

-- table 12--  
create table refunds(
   refund_id int primary key,
   payment_id int , 
   refund_amount int,
   refund_status varchar(50),
   foreign key (payment_id) references payments (payment_id)
);
insert into refunds (refund_id,payment_id,refund_amount,refund_status) values
(5001,804,300,'Processed'),
(5002,805,150,'Pending'),
(5003,807,300,'Pending'),
(5004,810,250,'Processed'),
(5005,812,250,'Processed'),
(5006,814,150,'Processed'),
(5007,816,350,'Pending'),
(5008,823,100,'Processed'),
(5009,825,200,'Processed'),
(5010,829,150,'Processed');

-- table 13--
create table reviews(
   review_id int primary key,
   user_id int , 
   movie_id int ,
   rating int,
   comment text,
   review_date datetime,
   foreign key (user_id) references users (user_id),
   foreign key (movie_id) references movies (movie_id)
);
insert into reviews (review_id,user_id,movie_id,rating,comment,review_date) values
(901,100001,1,5,'Amazing movie with deep meaning','2026-04-28 10:00:00'),
(902,100002,2,4,'Very realistic and intense','2026-04-28 11:30:00'),
(903,100003,3,5,'Beautiful love story','2026-04-28 13:00:00'),
(904,100004,4,4,'Great action scenes','2026-04-28 15:00:00'),
(905,100005,5,5,'Visually stunning movie','2026-04-28 17:30:00'),
(906,100006,6,5,'Mind blowing concept','2026-04-28 19:00:00'),
(907,100007,7,4,'Emotional survival story','2026-04-29 09:30:00'),
(908,100008,8,5,'Best superhero movie','2026-04-29 11:00:00'),
(909,100009,9,5,'Complex but awesome','2026-04-29 13:30:00'),
(910,100010,10,4,'Classic love story','2026-04-29 15:00:00'),
(911,100001,11,5,'Epic superhero climax','2026-04-29 16:00:00'),
(912,100002,12,5,'Dark and powerful acting','2026-04-29 17:00:00'),
(913,100003,13,4,'Strong historical drama','2026-04-29 18:00:00'),
(914,100004,14,5,'Childhood favorite','2026-04-29 19:00:00'),
(915,100005,15,5,'Grand visual experience','2026-04-29 20:00:00'),
(916,100006,16,4,'Mass entertainer','2026-04-30 09:00:00'),
(917,100007,17,4,'Very scary movie','2026-04-30 10:00:00'),
(918,100008,18,5,'Unique superhero story','2026-04-30 11:00:00'),
(919,100009,19,5,'Powerful action drama','2026-04-30 12:00:00'),
(920,100010,20,5,'Stylish action movie','2026-04-30 13:00:00'),
(921,100001,21,5,'Excellent historical storytelling','2026-04-30 14:00:00');

show tables;

select * from users;
select * from genres;
select * from languages;
select * from movies;
select * from theaters;
select * from screens;
select * from seats;
select * from shows;
select * from bookings;
select * from booking_details;
select * from payments;
select * from refunds;
select * from reviews;



--                                  BASIC + JOIN QUERIES                        --

-- 1. Find all movie titles along with their language names and genre names. --
SELECT m.movie_id , m.title , l.language_id , l.language_name , g.genres_name 
FROM movies as m
join genres as g on m.genres_name = g.genres_name
join languages as l on m.language_id = l.language_id;

-- 2. Display all users who made confirmed bookings with movie title and booking amount. --
select  u.first_name , u.last_name , m.title , b.total_amount
from bookings as b
join users as u on b.user_id = u.user_id
join shows as s on b.show_id = s.show_id
join movies as m on s.movie_id = m.movie_id 
where b.status = 'Confirmed';

-- 3. Show theater names with their total number of screens and total seat capacity. --  
select t.theater_name , t.total_screens , sum(s.total_seats)
from screens as s
join theaters as t on s.theater_id = t.theater_id
group by t.theater_name , t.total_screens 
order by  t.total_screens desc;

-- 4. Find all movies that are screened in IMAX screen types. --  
select m.title , s.screen_type
from movies as m
join shows as sh on m.movie_id = sh.movie_id
join screens as s on sh.screen_id = s.screen_id
where screen_type = 'IMAX';

-- 5. Display all seats that are currently unavailable along with theater and screen details. --  
SELECT se.seat_number , se.seat_type , se.availability ,
	   sc.screen_id , sc.screen_type , t.theater_name
FROM seats AS se
JOIN screens AS sc ON se.screen_id = sc.screen_id
JOIN theaters AS t ON sc.theater_id = t.theater_id
WHERE se.availability = FALSE;


--                                   GROUP BY + HAVING                                       --  

-- 6. Find the total number of movies available in each genre --  
select genres_name , count(*) as total_movies
from movies
group by genres_name;

-- 7. Display genres that have more than 3 movies. --  
select genres_name , count(*) as total_movies
from movies
group by genres_name 
having count(*) > 3;

-- 8 . Find the average movie duration for each language --  
select l.language_name , avg(m.duration) 
from movies as m
join languages as l on m.language_id = l.language_id
group by l.language_name;

-- 9. Show theaters where total seats across all screens exceed 500. --  
select t.theater_name , sum(s.total_seats) 
from theaters as t
join screens as s on t.theater_id = s.theater_id 
group by t.theater_id , t.theater_name
having  sum(s.total_seats) > 400;

-- 10. Find payment methods whose successful transaction amount is greater than 1000. --  
select p.payment_method , sum(p.amount_paid)
from payments as p
where payment_status = 'Success'
group by payment_method
having sum(p.amount_paid) > 1000; 


--                                        MULTIPLE JOINS                              --  

-- 11.Display booking details including: Username,Movie title,Theater name,Seat number,Payment method --  
select u.first_name , u.last_name , m.title ,
       t.theater_name , se.seat_number , p.payment_method
from bookings as b
join users as u on b.user_id = u.user_id
join shows as sh on b.show_id = sh.show_id
join movies as m on sh.movie_id = m.movie_id
join screens as sc on sh.screen_id = sc.screen_id
join theaters as t on  sc.theater_id = t.theater_id
join booking_details as bd on b.booking_id = bd.booking_id
join seats as se on bd.seat_id = se.seat_id 
join payments as p on b.booking_id = p.booking_id;

-- 12. Find all canceled bookings along with refund status and refund amount. --  
select b.booking_id , b.status , p.payment_id ,
       p.payment_status , r.refund_amount , r.refund_status
from bookings as b
join payments as p on b.booking_id = p.booking_id 
join refunds as r on p.payment_id = r.payment_id 
where b.status = 'Canceled';

-- 13. Display movie reviews with: User full name Movie title Rating Review comment --  
select u.first_name , u.last_name , m.title , r.rating , r.comment 
from reviews as r 
join users as u on r.user_id = u.user_id
join movies as m on r.movie_id = m.movie_id;

-- 14. Find all movies released after 2015 that have rating greater than 4. --  
select m.title , m.release_year , r.rating 
from movies as m
join reviews as r on m.movie_id = r.movie_id
where m.release_year > '2015' and
r.rating > 4;

-- 15. Show all theaters and the number of shows conducted in each theater --  
select t.theater_name , count(sc.show_id) 
from theaters as t 
join screens as s on t.theater_id = s.theater_id 
join shows as sc on s.screen_id = sc.screen_id 
group by theater_name ; 

--                                     SUBQUERY QUERIES                            -- 
-- 16. Find the movie with the highest duration --  
select title , duration 
from movies 
where duration = (
	select max(duration)
    from movies 
);

-- 17. Find users who spent more than the average booking amount. --  
select u.first_name , u.last_name , b.total_amount
from users as u
join bookings as b on u.user_id = b.user_id
where b.total_amount > (
     select avg(total_amount)
	 from bookings
);

-- 18. Display movies whose average rating is equal to the highest average rating. --  
select m.title , avg(r.rating) as avg_rating
from movies as m
join reviews as r on m.movie_id = r.movie_id
group by m.title 
having avg(r.rating) = (
      select max(avg_rating)
      from (
           select avg(rating) as avg_rating
           from reviews
           group by movie_id
           ) as x
);

-- 19. Find theaters having more screens than the average number of screens. --  
select theater_name , total_screens
from theaters 
where total_screens > (
    select avg(total_screens)
    from theaters
);

-- 20. Find users who booked more than 2 tickets --  
select u.first_name , u.last_name , count(b.booking_id) as total_bookings
from users as u
join bookings as b on u.user_id = b.user_id
group by u.user_id , u.first_name  , u.last_name
having count(b.booking_id) > 2;

--                                     WINDOW FUNCTION QUERIES                                  --  

-- 21. Rank movies based on duration using RANK() --  
select title , duration ,
rank() over(
order by duration desc) as movie_rank
from movies;

-- 22. Assign row numbers to bookings ordered by booking amount using ROW_NUMBER() --  
 select booking_id , total_amount ,
 row_number() over(
 order by total_amount desc ) row_num
 from bookings;
 
 -- 23. Find the top-rated movie in each genre using DENSE_RANK() --  
 select * 
 from (
     select m.genres_name , m.title , 
     avg(r.rating) as avg_rating ,
     dense_rank () over(
               partition by m.genres_name
               order by avg(r.rating) desc 
               ) as ranking 
	 from movies as m
     join reviews as r 
     on m.movie_id = r.movie_id
     group by m.genres_name , m.title
) as x
where ranking = 1;

-- 24. Calculate running total revenue from bookings using SUM() OVER() --  
select booking_id , total_amount , 
sum(total_amount) over (
                  order by booking_id) as running_total
from bookings; 

-- 25. Find the second highest booking amount using window functions. --  
select * 
from (
    select booking_id , total_amount ,
    dense_rank ()  over (
                    order by total_amount) as ranking
	from bookings
) as x
where ranking = 2;

