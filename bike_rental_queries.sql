-- ==========================
-- Bike Rental Case Study
-- ==========================
-- Author: Juliya
-- Description: This file contains all SQL queries to answer the business questions 
-- of a Bike Rental Shop case study. The goal is to extract insights from the rental 
-- shop's database, which contains customer, bike, rental, and membership data.
-- ==========================

-- Query 1: How many bikes does the shop own by category (only categories with more than 2 bikes)?
-- ==========================
-- This query counts the number of bikes in each category, showing only categories
-- with more than 2 bikes.

SELECT 
    category,
    COUNT(*) AS number_of_bikes
FROM bike
GROUP BY category
HAVING COUNT(*) > 2


-- Query 2: List of customers and the total number of memberships purchased
-- ==========================
-- This query returns a list of customer names with the total number of memberships 
-- each customer has purchased. Customers with no memberships show a count of 0.

SELECT 
    c.name AS customer_name,
    COALESCE(COUNT(m.id), 0) AS membership_count
FROM customer c
LEFT JOIN membership m ON c.id = m.customer_id
GROUP BY c.id
ORDER BY membership_count DESC


-- Query 3: New rental prices with discounts
-- ==========================
-- This query calculates the discounted prices for bikes based on their category.
-- Electric bikes have a 10% discount on hourly rental and a 20% discount on daily rental.
-- Mountain bikes have a 20% discount on hourly rental and a 50% discount on daily rental.
-- All other bikes get a 50% discount for both hourly and daily rentals.

SELECT 
    id, 
    category, 
    price_per_hour AS old_price_per_hour, 
    CASE 
        WHEN category = 'Electric' THEN ROUND(price_per_hour - (price_per_hour * 0.1), 2)
        WHEN category = 'Mountain' THEN ROUND(price_per_hour - (price_per_hour * 0.2), 2)
        ELSE ROUND(price_per_hour - (price_per_hour * 0.5), 2)
    END AS new_price_per_hour,
    price_per_day AS old_price_per_day,
    CASE 
        WHEN category = 'Electric' THEN ROUND(price_per_day - (price_per_day * 0.2), 2)
        WHEN category = 'Mountain' THEN ROUND(price_per_day - (price_per_day * 0.5), 2)
        ELSE price_per_day * 0.5
    END AS new_price_per_day
FROM bike


-- Query 4: Count of rented and available bikes by category
-- ==========================
-- This query provides counts of rented and available bikes in each category.

SELECT 
    category, 
    COUNT(CASE WHEN status = 'available' THEN 1 END) AS available_bikes_count,
    COUNT(CASE WHEN status = 'rented' THEN 1 END) AS rented_bikes_count
FROM bike
GROUP BY category


-- Query 5: Total rental revenue by month and year
-- ==========================
-- This query calculates the total revenue from rentals, broken down by year, month, 
-- and an all-time total at the end.

SELECT 
    YEAR(start_datetime) AS year,
    MONTH(start_datetime) AS month,
    SUM(total_paid) AS revenue 
FROM rental
GROUP BY GROUPING SETS((YEAR(start_datetime), MONTH(start_datetime)), YEAR(start_datetime), ())
ORDER BY year, month


-- Query 6: Total revenue from memberships by year, month, and membership type
-- ==========================
-- This query calculates the total revenue from memberships, broken down by year, 
-- month, and membership type name.

SELECT 
    YEAR(start_date) AS year,
    MONTH(start_date) AS month,
    mt.name,
    SUM(total_paid) AS revenue 
FROM membership m 
INNER JOIN membership_type mt ON mt.id = m.membership_type_id
GROUP BY YEAR(start_date), MONTH(start_date), mt.name
ORDER BY year, month, revenue


-- Query 7: Membership revenue for 2024 by membership type and month
-- ==========================
-- This query calculates the membership revenue for the year 2024, broken down by 
-- month and membership type. It also includes subtotals and grand totals.

SELECT 
    MONTH(start_date) AS month,
    mt.name,
    SUM(total_paid) AS revenue 
FROM membership m 
INNER JOIN membership_type mt ON mt.id = m.membership_type_id
WHERE YEAR(start_date) = '2024'
GROUP BY GROUPING SETS((MONTH(start_date), mt.name), (mt.name), ())
ORDER BY name, month


-- Query 8: Segment customers by the number of rentals they’ve made
-- ==========================
-- This query categorizes customers based on the number of rentals they’ve made. 
-- Customers are categorized into three groups: 'more than 10', 'between 5 and 10', and 'fewer than 5'.
WITH no_of_rentals AS (
    SELECT 
        customer_id,
        CASE
            WHEN COUNT(id) > 10 THEN 'more than 10'
            WHEN COUNT(id) BETWEEN 5 AND 10 THEN 'between 5 and 10'
            WHEN COUNT(id) < 5 THEN 'fewer than 5'
        END AS rental_count_category,
        COUNT(id) AS No_of_rentals 
    FROM rental
    GROUP BY customer_id
)
SELECT 
    rental_count_category, 
    COUNT(*) AS customer_count
FROM no_of_rentals
GROUP BY rental_count_category
ORDER BY customer_count
