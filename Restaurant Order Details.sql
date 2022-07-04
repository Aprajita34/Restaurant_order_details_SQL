CREATE DATABASE food_ratings;
USE food_ratings;

SELECT *
FROM orders;

SELECT *
FROM restaurants;

-- 1) Which restaurant received the most orders?
SELECT r.restaurant_name,count(o.quantity_of_items) AS most_orders
FROM restaurants r
 JOIN orders o on r.restaurant_id=o.restaurant_id
 GROUP BY r.restaurant_name
ORDER BY count(o.quantity_of_items) DESC
LIMIT 1;

/* The Cave Hotel has recieved the maximum orders .*/

-- 2) Which restaurant saw most sales?
SELECT r.restaurant_name AS restaurant,sum(o.order_amount) AS sales
FROM restaurants r
JOIN orders o on r.restaurant_id=o.restaurant_id
group by r.restaurant_name 
order by sum(o.order_amount) desc
LIMIT 1;
/* Veer Restaurant saw most sales*/

-- 3) Which customer ordered the most?
SELECT customer_name,count(quantity_of_items)
FROM orders
GROUP BY customer_name
Order by count(quantity_of_items) desc
limit 1;
/*Srini ordered the most*/

-- 4) Display restaurant name and the category where name starts with s ?
SELECT restaurant_name,category
FROM restaurants
where restaurant_name like "s%";
/* SSK and Sam Hotel*/

-- 5) Which is the most liked cuisine?
SELECT cuisine,customer_rating_food
FROM restaurants r
INNER JOIN orders o
ON r.restaurant_id=o.restaurant_id
where customer_rating_food = 5
group by cuisine
order by customer_rating_food desc
limit 1;
/*French is the one*/


-- 6) Which zone has the most sales?

SELECT zone,sum(order_amount) as sales
FROM restaurants r
INNER JOIN orders o
ON r.restaurant_id=o.restaurant_id
group by zone
order by sum(order_amount) desc
limit 1;
/* Zone D has the maximum sales*/

-- 7) The payment mode used maximum number of times
select payment_mode,count(payment_mode) as number_of_times_used
from orders
group by payment_mode
order by count(payment_mode) desc
limit 1;
/* Debit card*/

-- 8) Restaurant receiving the delivery rating greater than 4
select restaurant_name,customer_rating_delivery
from restaurants r 
inner join orders o 
on r.restaurant_id=o.restaurant_id
where customer_rating_delivery >=4
group by restaurant_name
order by customer_rating_delivery desc;
/*Many restaurants*/

-- 9) Maximum delivery time taken by restaurant
select restaurant_name,max(delivery_time_taken_mins) as max_time
from restaurants r
inner join orders o on r.restaurant_id=o.restaurant_id
group by restaurant_name
order by max(delivery_time_taken_mins) desc 
limit 1;
/*Wikkies takes maximum time*/

-- 10) customer name, restaurant name and the category where category is ordinary and name starts with d 
select customer_name,restaurant_name,category
from restaurants r
inner join orders o 
on r.restaurant_id=o.restaurant_id
where category="ordinary" and customer_name like "d%";

