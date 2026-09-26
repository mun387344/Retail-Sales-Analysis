--Business Questions
--How much revenue did the business generate?

SELECT SUM(Quantity * UnitPrice) AS Revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0;

--How did revenue change over time?

SELECT MIN(InvoiceDate) AS earliest_date, MAX(InvoiceDate) AS latest_date
FROM online_retail;

SELECT 
  DATE_TRUNC('month' , InvoiceDate) AS month, 
  SUM(Quantity * UnitPrice) AS monthly_revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY DATE_TRUNC('month', InvoiceDate)
ORDER BY month;

/*
How much revenue did the business generate, and How did revenue change over time?
Total revenue: 10,666,684.54
Lowest full-month revenue: February 2011 — 523,631.89
Revenue generally becomes much stronger toward September–November 2011
Highest monthly revenue: November 2011 — 1,509,496.33
December 2010 and December 2011 are partial months, so It is hard to compare them directly with full months. */


