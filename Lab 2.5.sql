USE sakila; 
SHOW FULL TABLES;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = "SCARLETT";

-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(*) AS avaialble_for_rent FROM sakila.inventory;
SELECT COUNT(*) AS rented FROM sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration. *Wasn't able to do the formatting, tried a number of things but wasn't able to get it to cooperate*
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT * FROM sakila.film;

SELECT ROUND(AVG(length),2) as avg_duration, MAX(length) AS max_duration, MIN(length) AS min_duration FROM sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)? 
-- DEATEDIFF("yyy-mmm-dd_1","yyyy-nm-dd_2")
SELECT MAX(payment_date) AS "FIRST DAY", MIN(payment_date) AS "LAST DAY", DATEDIFF("2006-02-14", "2005-05-24") AS "DAYS OPERATING" FROM sakila.payment;

-- Show rental info with additional columns month and weekday. Get 20 results. 
SELECT *, MONTH(rental_date) AS "month", DAY(rental_date) AS "weekday" FROM sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. *HAD TROUBLE WITH THIS ONE*
SELECT *, MONTH(rental_date) AS "month", DAY(rental_date) AS "weekday", DAYOFWEEK(rental_date) as "day_	type" FROM sakila.rental
WHERE DAYOFWEEK(rental_date) = ("1", "2", "3", "4", "5") THEN "workday" FROM sakila.rental
WHERE DAYOFWEEK(rental_date) = "6", "7" THEN "weekend";

-- WHERE DAYOFWEEK(rental_date) = ("MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY") THEN "workday" FROM sakila.rental
-- WHERE DAYOFWEEK(rental_date) = "SATURDAY", "SUNDAY" THEN "weekend";

-- Get release years.
SELECT release_year FROM sakila.film;

-- Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title REGEXP "ARMAGEDDON$"; 

-- Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE "%APOLLO"; 

-- Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC 
LIMIT 10; 

-- How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film 
WHERE special_features REGEXP "Behind the Scenes$";