-- CUSTOMER ANALYSIS

-- 1. Which customers generate the most revenue?
SELECT 
  CustomerID AS customers,
  SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY revenue DESC

/*
Customer revenue findings:
- Customer 14646 generated the highest gross positive revenue at 280,206.02.
- Customer 18102 followed with 259,657.30.
- Customer 17450 generated 194,550.79.
*/

