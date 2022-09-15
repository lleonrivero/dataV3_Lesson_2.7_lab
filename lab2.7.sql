## Lab | SQL Join (Part I) ##

USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM category;
SELECT * FROM film_category;

SELECT count(film_id) AS 'Films', name AS 'Category'
FROM sakila.category a
JOIN sakila.film_category b
ON a.category_id = b.category_id
GROUP BY name;

-- 2. Display the total amount rung up (payment) by each staff member in August of 2005.
SELECT * FROM sakila.rental;
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT SUM(amount) AS 'August 2005', first_name AS 'First Name', last_name AS 'Last Name'
FROM sakila.payment a
JOIN sakila.staff b
ON a.staff_id = b.staff_id
WHERE payment_date > '2005-08-01 00:00:01' AND payment_date < '2005-08-30 23:59:59'
GROUP BY first_name;

SELECT SUM(amount) AS 'August 2005', first_name AS 'First Name', last_name AS 'Last Name'
FROM sakila.payment a
JOIN sakila.staff b
ON a.staff_id = b.staff_id
WHERE payment_date > '2005-08-01 00:00:01' AND payment_date < '2005-08-30 23:59:59'
GROUP BY first_name;

-- 3. Which actor has appeared in the most films?
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;
SELECT count(film_id) AS 'Film appearances', last_name, first_name
FROM sakila.actor a
JOIN sakila.film_actor b
ON a.actor_id = b.actor_id
GROUP BY a.actor_id
ORDER BY count(film_id) DESC;
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT count(rental_id) AS 'Films rented', first_name, last_name
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(rental_id) DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT first_name AS 'First Name', last_name AS 'Last Name', address AS 'Address1', address2 AS 'Address2', district AS 'District', city_id AS 'City' 
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT title AS 'Title', count(actor_id) AS 'Number of actors'
FROM sakila.film f 
JOIN sakila.film_actor fa USING (film_id)
GROUP BY title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;
SELECT customer_id AS 'Cust ID', last_name AS 'Last name', first_name AS 'First name', sum(amount) AS 'Total amount paid' 
FROM sakila.customer c
JOIN sakila.payment p USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- 8. List number of films per category. (identical to first question, ignore)


