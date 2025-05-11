-- Solving  Amazon Buisness Problem With SQL



-- 1. Which payment methods are most commonly used by customers?

SELECT payment_method, count(*) as Usage_count
FROM amazon_sales
GROUP BY payment_method
ORDER BY Usage_count DESC;



-- 2.What are the top 5 best-selling products by total quantity sold?

SELECT Product, SUM (Quantity) AS Total_qnty
FROM amazon_sales
GROUP BY Product
ORDER BY Total_qnty DESC
LIMIT 5;



-- 3.Which product categories generated the highest total revenue?

SELECT category, SUM(total_amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;



-- 4.What is the total number of orders by each order status (Completed, Cancelled, Pending)?


SELECT order_status, COUNT(*) AS total_order
FROM amazon_sales
WHERE order_status IN ('Completed','Cancelled','Pending')
GROUP BY order_status;



-- 5.What are the top 5 cities by revenue contribution?

SELECT city, SUM(total_amount) as Total_Revenue
FROM amazon_sales
GROUP BY city
ORDER BY Total_Revenue DESC
Limit 5;



--6.Who are the top 5 customers based on total spending?


SELECT customer_name, SUM(total_amount) AS Total_spent
FROM amazon_sales
GROUP BY customer_name
ORDER BY Total_spent DESC
LIMIT 5;



-- 7.What is the monthly revenue trend?

SELECT TO_CHAR(dates, 'Mon-YYYY') AS Month, SUM(total_amount) AS monthly_Revenue
FROM amazon_sales
GROUP BY TO_CHAR(dates, 'Mon-YYYY')
ORDER BY  monthly_revenue DESC; 



-- 8.How many orders were placed for each product category per month?


SELECT category, TO_CHAR(dates, 'Mon') AS Month, count(order_id) AS Total_order
FROM amazon_sales
GROUP BY category, Month
ORDER BY Total_order DESC;



-- 9.Which product has the highest cancellation rate?


WITH product_orders AS (
		SELECT product, COUNT(*) AS total_orders,
		SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders
		FROM amazon_sales
		GROUP BY Product
)

SELECT product, 
cancelled_orders,
total_orders,
		ROUND(cancelled_orders * 100.0 / total_orders, 2) AS Cancellation_rate_Percentage
FROM product_orders
ORDER BY Cancellation_rate_Percentage DESC
LIMIT 1;



-- 10.What is the average order value (AOV)?

SELECT ROUND(SUM(total_amount) * 1.0 / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM amazon_sales;




    ----------- ADITIONAL ANALYSIS ------------




-- CHECKING CANCELLATION REASON OF WASHING MAchine

SELECT dates, quantity, payment_method, order_status
FROM amazon_sales
WHERE product = 'Washing Machine' AND order_status = 'Cancelled';  -- ITS LIKE GIFT CARS ISSUE OR MAY ME LOGISTIC ISSUE LETS SEE GIFT GARD CANCELLATION PERCENTAGE



-- GIFT CARD PAYMENT METHOD CANCELLATION PERCENTAGE

SELECT 
    order_status, 
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM amazon_sales
WHERE payment_method = 'Gift Card'
AND order_status IN ('Completed', 'Cancelled', 'Pending')
GROUP BY order_status;



-- GIFT CARD CITY WISE ORDER STATUS 

SELECT 
    order_status, city,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM amazon_sales
WHERE payment_method = 'Gift Card'
AND order_status IN ('Cancelled', 'Pending')
GROUP BY order_status, city
ORDER BY total_orders desc;
