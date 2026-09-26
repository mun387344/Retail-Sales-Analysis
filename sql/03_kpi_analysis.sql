--Business Questions
--How much revenue did the business generate?

SELECT SUM(Quantity * UnitPrice) AS Revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0;

-- How did revenue change over time?

-- Check the dataset's date range.
SELECT
    MIN(InvoiceDate) AS earliest_date,
    MAX(InvoiceDate) AS latest_date
FROM online_retail;

-- Calculate monthly revenue.
SELECT
    DATE_TRUNC('month', InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY month
ORDER BY month;

/*
How much revenue did the business generate, and how did revenue change over time?
Total revenue: 10,666,684.54
Lowest full-month revenue: February 2011 — 523,631.89
Revenue generally becomes much stronger toward September–November 2011
Highest monthly revenue: November 2011 — 1,509,496.33
December 2010 and December 2011 are partial months, so It is hard to compare them directly with full months. */

--Which countries have the most customers, and how much revenue does each country generate?

SELECT
  Country,
  COUNT(DISTINCT CustomerID) AS customer_count,
  SUM(Quantity*UnitPrice) AS country_total_revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY Country
ORDER BY customer_count DESC;

--When does the business generate the most revenue — by month, day of week, and time of day?
--We already calculated monthly revenue: November 2011 had the highest monthly revenue at 1,509,496.33.

----Which day of the week generates the most revenue?
SELECT 
  To_CHAR(InvoiceDate , 'Day') AS day_of_week ,
  SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
WHERE QUantity > 0
AND UnitPrice > 0
GROUP BY day_of_week
ORDER BY revenue DESC;
/*
Thursday generated the most revenue: 2,203,161.24
Tuesday was very close: 2,178,632.61
Sunday generated the least: 813,827.61
No positive-sales transactions appear on Saturdays in this dataset. 
*/

--At what time of day does the business generate the most revenue?
SELECT 
  EXTRACT(Hour FROM InvoiceDate) AS Hour,
  SUM(Quantity*UnitPrice) AS revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY Hour
ORDER BY revenue DESC;

/*
Revenue is concentrated during daytime business hours, particularly from 10:00 to 15:00.
10:00 generated the highest revenue: 1,446,742.70.
*/

/*
1. Revenue performance
- Total revenue → 10,666,684.54
- Monthly revenue trend → done
- Highest month → November 2011: 1,509,496.33
2. Geographic performance
- Unique identifiable customers by country → done
- Revenue by country → done
- UK dominates the dataset; Netherlands is an interesting case with only 9 identifiable customers but 285,446.34 revenue.
3. Sales timing
- Revenue by month → done
- Revenue by weekday → Thursday highest: 2,203,161.24
- Revenue by hour → 10:00 highest: 1,446,742.70
*/
