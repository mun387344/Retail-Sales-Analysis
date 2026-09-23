SELECT COUNT(*)
FROM online_retail
WHERE Quantity < 0
AND InvoiceNo LIKE 'C%';

SELECT *
FROM online_retail
WHERE Quantity < 0
AND InvoiceNo NOT LIKE 'C%';

SELECT 
COUNT(*) FILTER (WHERE InvoiceNo IS NULL) AS missing_invoice,
COUNT(*) FILTER (WHERE StockCode IS NULL) AS missing_stockcode,
COUNT (*)FILTER (WHERE description IS NULL) AS missing_description,
COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
COUNT(*) FILTER (WHERE invoicedate IS NULL) AS missing_invoicedate,
COUNT(*) FILTER (WHERE unitprice IS NULL) AS missing_unitprice,
COUNT(*) FILTER (WHERE customerid IS NULL) As missing_customerid,
COUNT(*) FILTER (WHERE Country IS NULL) AS missing_country
FROM online_retail;

SELECT *
FROM online_retail
WHERE description IS NULL
LIMIT 20;

SELECT COUNT(*)
FROM online_retail
WHERE description IS NULL
AND UnitPrice = 0;

SELECT COUNT(*)
FROM online_retail
WHERE description IS NULL
AND customerid IS NULL;

SELECT MIN(Quantity),MAX(Quantity)
FROM online_retail;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice =0;

SELECT *
FROM online_retail
WHERE UnitPrice = 0
AND invoiceno LIKE 'C%';

SELECT *
FROM online_retail
WHERE Quantity = -80995
OR Quantity = 80995;

