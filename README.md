![Updated Photo](https://github.com/SubhajitDey2/amazon_sales_analysis_2025/blob/main/amazonsalesanalysisbg.png)
# Amazon Sales Analysis 2025
Prepared By: Subhajit Dey\
Date: 11-May-2025

A Data Analysis project focused on Amazon Sales Data 2025 to uncover business-critical insights.\
Using SQL, we answer a set of business questions aimed at improving sales, understanding customer behaviour, identifying revenue drops, and enhancing profitability.
_____________________________________________________________________________________________________________________________________________________________________________________________________________

## Dataset Columns
The dataset used (```amazon_sales```) contains the following fields:\
 •	```Order_ID```, ```Date```, ```Product```, ```Category```, ```Price```, ```Quantity```, ```Total_Amount```, ```Customer_Name```, ```City```,\
```Payment_Method```,``` Order_Status```\
 • [Download From Kaggle](https://www.kaggle.com/datasets/zahidmughal2343/amazon-sales-2025/data)
_____________________________________________________________________________________________________________________________________________________________________________________________________________

## Tools Used
•	PostgreSQL – For SQL-based data querying\
•	Excel – For Data Formatting\
•	Git & GitHub – For version control and collaboration
_____________________________________________________________________________________________________________________________________________________________________________________________________________

## Business Questions & Answers

**1.	Which payment methods are most commonly used by customers?** <br>
  ```sql
SELECT payment_method, count(*) as Usage_count
FROM amazon_sales
GROUP BY payment_method
ORDER BY Usage_count DESC;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________

 **2.	What are the top 5 best-selling products by total quantity sold?**
```sql
SELECT Product, SUM (Quantity) AS Total_qnty
FROM amazon_sales
GROUP BY Product
ORDER BY Total_qnty DESC
LIMIT 5;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________

**3.	Which product categories generated the highest total revenue?**
```sql
SELECT category, SUM(total_amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**4.	What is the total number of orders by each order status (Completed, Cancelled, Pending)?**
```sql
SELECT order_status, COUNT(*) AS total_orders
FROM amazon_sales
WHERE order_status IN ('Completed', 'Cancelled', 'Pending')
GROUP BY order_status;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**5.	What are the top 5 cities by revenue contribution?**
```sql
SELECT city, SUM(total_amount) as Total_Revenue
FROM amazon_sales
GROUP BY city
ORDER BY Total_Revenue DESC
Limit 5;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**6.	Who are the top 5 customers based on total spending?**
```sql
SELECT customer_name, SUM(total_amount) AS Total_spent
FROM amazon_sales
GROUP BY customer_name
ORDER BY Total_spent DESC
LIMIT 5;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**7.	What is the monthly revenue trend?**
```sql
SELECT TO_CHAR(dates, 'Mon-YYYY') AS Month, SUM(total_amount) AS monthly_Revenue
FROM amazon_sales
GROUP BY TO_CHAR(dates, 'Mon-YYYY')
ORDER BY  monthly_revenue DESC;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**8.	How many orders were placed for each product category per month?**
```sql
SELECT category, TO_CHAR(dates, 'Mon') AS Month, count(order_id) AS Total_order
FROM amazon_sales
GROUP BY category, Month
ORDER BY Total_order DESC;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**9.	Which product has the highest cancellation rate?**
```sql
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
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
**10.	What is the average order value (AOV)?**
```sql
SELECT ROUND (SUM(total_amount) * 1.0 / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM amazon_sales;
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________
## Key Findings
**•	Most Common Payment Methods:** PayPal and Credit Card are the Most common Payments Methods are Found. <br>
**•	Best Selling Products:** We found Customer Prefer Smart Watch and Smart Phones more than other Products like Laptop, Headphones, etc. <br>
**•	Top Revenue-Generating Product Categories:** Electronics and Home Appliances the top Revenue generated categories in Amazon.  <br>
**•	Order Status Distribution:** Total number of orders – Completed Orders 264, Cancelled Order – 231, Pending orders – 255. <br>
**•	Product with Highest Cancellation Rate:** Analyse the Data and Found 50% of Customer Cancelling the Product “Washing Machine”, Reason behind it, is a Payment/Logistic Problem. <br> 
**•	Monthly Revenue Trend:** February and March Identifies peak sales seasons. <br>
_____________________________________________________________________________________________________________________________________________________________________________________________________________
## Business Insights & Recommendations
**•	Payment Methods:** Amazon Users Favourite Payments Methods are PayPal and Credit Card although also it can be Gift Card also, but around 42.86% of the Gift Card Payments are cancelled and 42.86% are Still Pending and only 14.29% Successfully Completed. Promote and streamline the most used methods. Consider offering discounts on lesser-used but cost-effective payment options to diversify use. and Try to Resolve Gift Card Payments Issue and Give some Offers/ Token to remain the Trust of Users. <br>
**•	Products:** Top 5 Products are Smartwatch, Smartphone, Headphones, Laptop, Running Shoes. These products should be prioritized for inventory restocking and targeted promotions. Analyze profit margins of these products and upsell related accessories or services.<br>
**•	Logistic:** Improve packaging or communication if products are being returned/cancelled, Increase local warehousing. Add more last-mile delivery options (especially in rural areas). Add tracking metrics on delivery times vs. expected times. Flag suppliers with repeated delays. Top 5 Effected cities are Boston, Dallas, Houston, Denver, San Francisco. <br>
**•	Sales Trends:** Major Cities Miami, Denver, Houston, Dallas, Seattle this are the Top 5 Cites make Most revenue on Month of February and March. Focus ads spend and logistics improvements in these cities. Target the Top Customers and Categories with Great Deals and offers. Boost AOV Implement free shipping thresholds and product bundles to lift average order size.<br>
_____________________________________________________________________________________________________________________________________________________________________________________________________________
## Final Conclusion 

The analysis of Amazon Sales 2025 provides valuable insight into customer behavior, product performance, payment preferences, and operational bottlenecks. Key findings reveal that PayPal and Credit Card dominate as the preferred payment methods, while products like Smartwatches and Smartphones are top choices among consumers, contributing significantly to overall sales volume. <br> 

Electronics and Home Appliances stand out as the most revenue-generating categories, confirming strong demand in the tech and utility segments. However, operational inefficiencies—particularly in the delivery and cancellation of large items like Washing Machines—highlight pressing logistics and payment issues. A notably high cancellation rate of 50% for such products points to challenges in fulfillment and user experience, especially when using Gift Cards, which show over 85% incomplete transactions.\

Seasonal and geographic analysis shows February and March as peak months, with cities like Miami, Denver, and Houston driving the majority of revenue during this time. This presents a clear opportunity to refine regional marketing strategies, optimize inventory for peak periods, and focus on top-performing customers and cities.

**Strategic Focus Areas Moving Forward:**
**•**	Resolve Gift Card and logistics issues to regain customer trust.\
**•**	Invest in top-selling products and categories with better promotions and upsell opportunities.\
**•**	Strengthen delivery capabilities in key cities where cancellations are high.\
**•**	Leverage peak sales months through tailored campaigns and regional ad targeting.
