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
ORDER BY revenue DESC;

/*
Customer revenue findings:
- Customer 14646 generated the highest gross positive revenue at 280,206.02.
- Customer 18102 followed with 259,657.30.
- Customer 17450 generated 194,550.79.
*/

--2. Which customers appear to have become inactive?
SELECT
    CustomerID,
    MAX(InvoiceDate) AS last_purchase_date
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING MAX(InvoiceDate) <
       (SELECT MAX(InvoiceDate) FROM online_retail) - INTERVAL '90 days'
ORDER BY last_purchase_date ASC;

/*
Customer activity finding:
- Customers whose last positive purchase occurred more than 90 days before
  the end of the dataset were classified as apparently inactive.
- This is a 90-day analytical definition and does not prove that these
  customers permanently stopped purchasing.
*/

--What products are most frequently purchased by our highest-value customers?

SELECT
  CustomerID,
  Stockcode,
  COUNT(DISTINCT InvoiceNo) AS purchase_frequency
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND CustomerID IN ('14646','18102', '17450', '16446', '14911')
AND StockCode NOT IN ('DOT', 'POST', 'M', 'AMAZONFEE', 'C2')
GROUP BY CustomerID, Stockcode
ORDER BY purchase_frequency DESC;

/*
Highest-value customer product findings:
- Among the five highest-revenue customers, Customer 14911 purchased
  StockCode 22423 most frequently, appearing in 49 distinct invoices.
- StockCodes 85123A and 22699 each appeared in 33 distinct invoices
  for Customer 14911.
- Non-product charges such as carriage, postage, manual entries,
  and Amazon fees were excluded from the product-frequency analysis.
- Purchase frequency represents the number of distinct invoices
  containing each product, not the number of units purchased.
*/

