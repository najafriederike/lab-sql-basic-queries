
-- 1. Display all available tables in the Sakila database.
SHOW TABLES;
USE sakila;

-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
-- 3.2 List of languages used in films, with the column aliased as language from the language table
-- 3.3 List of first names of all employees from the staff table
SELECT DISTINCT title FROM sakila.film;
SELECT name AS language from sakila.language;
SELECT first_name FROM sakila.staff;

-- 4. Retrieve unique release years.
SELECT DISTINCT release_year FROM sakila.film;

-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
SELECT DISTINCT(COUNT(store_id)) FROM store;

-- 5.2 Determine the number of employees that the company has.
SELECT DISTINCT(COUNT(staff_id)) FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(inventory_id) AS nr_films FROM sakila.inventory; -- 4.581 
SELECT COUNT(rental_id) AS nr_rentals FROM sakila.rental; -- 16.044 films have been rented

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT DISTINCT COUNT(last_name) FROM sakila.actor; -- 200 actors ## ???
SELECT COUNT(DISTINCT last_name) FROM sakila.actor; -- 201 actors ## ???

-- 6. Retrieve the 10 longest films.
SELECT title, length FROM sakila.film ORDER BY length DESC LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here.
SELECT title, length FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(special_features) AS counts_behind_the_scenes FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'; 