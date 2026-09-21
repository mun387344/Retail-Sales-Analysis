SELECT *
FROM online_retail
LIMIT 5;

SELECT InvoiceNo, Country
FROM online_retail
LIMIT 5;

SELECT COUNT(*)
FROM online_retail;

SELECT DISTINCT Country
FROM online_retail;

SELECT COUNT (DISTINCT Country)
FROM online_retail;

SELECT *
FROM online_retail
WHERE CustomerID IS NULL;

SELECT COUNT(*)
FROM online_retail
WHERE CustomerID IS NULL;

SELECT *
FROM online_retail
WHERE Quantity < 0;