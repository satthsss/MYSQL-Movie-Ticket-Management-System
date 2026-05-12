-- BASIC + JOIN QUERIES

-- 1. Find all movie titles along with their language names and genre names.
SELECT m.movie_id , m.title , l.language_id , l.language_name , g.genres_name 
FROM movies as m
JOIN genres as g ON m.genres_name = g.genres_name
JOIN languages as l ON m.language_id = l.language_id;

-- 2. Display all users who made confirmed bookings with movie title and booking amount.
SELECT  u.first_name , u.last_name , m.title , b.total_amount
FROM bookings as b
JOIN users as u ON b.user_id = u.user_id
JOIN shows as s ON b.show_id = s.show_id
JOIN movies as m ON s.movie_id = m.movie_id 
WHERE b.status = 'Confirmed';

-- 3. Show theater names with their total number of screens and total seat capacity.
SELECT t.theater_name , t.total_screens , SUM(s.total_seats)
FROM screens as s
JOIN theaters as t ON s.theater_id = t.theater_id
GROUP BY t.theater_name , t.total_screens
ORDER BY t.total_screens DESC;

-- 4. Find all movies that are screened in IMAX screen types.
SELECT m.title , s.screen_type
FROM movies as m
JOIN shows as sh ON m.movie_id = sh.movie_id
JOIN screens as s ON sh.screen_id = s.screen_id
WHERE screen_type = 'IMAX';

-- 5. Display all seats that are currently unavailable along with theater and screen details.
SELECT se.seat_number , se.seat_type , se.availability ,
       sc.screen_id , sc.screen_type , t.theater_name
FROM seats AS se
JOIN screens AS sc ON se.screen_id = sc.screen_id
JOIN theaters AS t ON sc.theater_id = t.theater_id
WHERE se.availability = FALSE;

-- GROUP BY + HAVING

-- 6. Find the total number of movies available in each genre.
SELECT genres_name , COUNT(*) as total_movies
FROM movies
GROUP BY genres_name;

-- 7. Display genres that have more than 3 movies.
SELECT genres_name , COUNT(*) as total_movies
FROM movies
GROUP BY genres_name
HAVING COUNT(*) > 3;

-- 8. Find the average movie duration for each language.
SELECT l.language_name , AVG(m.duration)
FROM movies as m
JOIN languages as l ON m.language_id = l.language_id
GROUP BY l.language_name;

-- 9. Show theaters where total seats across all screens exceed 400.
SELECT t.theater_name , SUM(s.total_seats)
FROM theaters as t
JOIN screens as s ON t.theater_id = s.theater_id
GROUP BY t.theater_id , t.theater_name
HAVING SUM(s.total_seats) > 400;

-- 10. Find payment methods whose successful transaction amount is greater than 1000.
SELECT p.payment_method , SUM(p.amount_paid)
FROM payments as p
WHERE payment_status = 'Success'
GROUP BY payment_method
HAVING SUM(p.amount_paid) > 1000;

-- MULTIPLE JOINS

-- 11. Display booking details including Username, Movie title, Theater name, Seat number, Payment method.
SELECT u.first_name , u.last_name , m.title ,
       t.theater_name , se.seat_number , p.payment_method
FROM bookings as b
JOIN users as u ON b.user_id = u.user_id
JOIN shows as sh ON b.show_id = sh.show_id
JOIN movies as m ON sh.movie_id = m.movie_id
JOIN screens as sc ON sh.screen_id = sc.screen_id
JOIN theaters as t ON sc.theater_id = t.theater_id
JOIN booking_details as bd ON b.booking_id = bd.booking_id
JOIN seats as se ON bd.seat_id = se.seat_id
JOIN payments as p ON b.booking_id = p.booking_id;

-- 12. Find all canceled bookings along with refund status and refund amount.
SELECT b.booking_id , b.status , p.payment_id ,
       p.payment_status , r.refund_amount , r.refund_status
FROM bookings as b
JOIN payments as p ON b.booking_id = p.booking_id
JOIN refunds as r ON p.payment_id = r.payment_id
WHERE b.status = 'Canceled';

-- 13. Display movie reviews with User full name, Movie title, Rating, Review comment.
SELECT u.first_name , u.last_name , m.title , r.rating , r.comment
FROM reviews as r
JOIN users as u ON r.user_id = u.user_id
JOIN movies as m ON r.movie_id = m.movie_id;

-- 14. Find all movies released after 2015 that have rating greater than 4.
SELECT m.title , m.release_year , r.rating
FROM movies as m
JOIN reviews as r ON m.movie_id = r.movie_id
WHERE m.release_year > '2015' AND r.rating > 4;

-- 15. Show all theaters and the number of shows conducted in each theater.
SELECT t.theater_name , COUNT(sc.show_id)
FROM theaters as t
JOIN screens as s ON t.theater_id = s.theater_id
JOIN shows as sc ON s.screen_id = sc.screen_id
GROUP BY theater_name;

-- SUBQUERY QUERIES

-- 16. Find the movie with the highest duration.
SELECT title , duration
FROM movies
WHERE duration = (
    SELECT MAX(duration)
    FROM movies
);

-- 17. Find users who spent more than the average booking amount.
SELECT u.first_name , u.last_name , b.total_amount
FROM users as u
JOIN bookings as b ON u.user_id = b.user_id
WHERE b.total_amount > (
     SELECT AVG(total_amount)
     FROM bookings
);

-- 18. Display movies whose average rating is equal to the highest average rating.
SELECT m.title , AVG(r.rating) as avg_rating
FROM movies as m
JOIN reviews as r ON m.movie_id = r.movie_id
GROUP BY m.title
HAVING AVG(r.rating) = (
      SELECT MAX(avg_rating)
      FROM (
           SELECT AVG(rating) as avg_rating
           FROM reviews
           GROUP BY movie_id
           ) as x
);

-- 19. Find theaters having more screens than the average number of screens.
SELECT theater_name , total_screens
FROM theaters
WHERE total_screens > (
    SELECT AVG(total_screens)
    FROM theaters
);

-- 20. Find users who booked more than 2 tickets.
SELECT u.first_name , u.last_name , COUNT(b.booking_id) as total_bookings
FROM users as u
JOIN bookings as b ON u.user_id = b.user_id
GROUP BY u.user_id , u.first_name , u.last_name
HAVING COUNT(b.booking_id) > 2;

-- WINDOW FUNCTION QUERIES

-- 21. Rank movies based on duration using RANK().
SELECT title , duration ,
RANK() OVER(
ORDER BY duration DESC) as movie_rank
FROM movies;

-- 22. Assign row numbers to bookings ordered by booking amount using ROW_NUMBER().
SELECT booking_id , total_amount ,
ROW_NUMBER() OVER(
ORDER BY total_amount DESC ) row_num
FROM bookings;

-- 23. Find the top-rated movie in each genre using DENSE_RANK().
SELECT *
FROM (
    SELECT m.genres_name , m.title ,
    AVG(r.rating) as avg_rating ,
    DENSE_RANK () OVER(
              PARTITION BY m.genres_name
              ORDER BY AVG(r.rating) DESC
              ) as ranking
    FROM movies as m
    JOIN reviews as r
    ON m.movie_id = r.movie_id
    GROUP BY m.genres_name , m.title
) as x
WHERE ranking = 1;

-- 24. Calculate running total revenue from bookings using SUM() OVER().
SELECT booking_id , total_amount ,
SUM(total_amount) OVER (
                 ORDER BY booking_id) as running_total
FROM bookings;

-- 25. Find the second highest booking amount using window functions.
SELECT *
FROM (
    SELECT booking_id , total_amount ,
    DENSE_RANK () OVER (
                   ORDER BY total_amount) as ranking
    FROM bookings
) as x
WHERE ranking = 2;
