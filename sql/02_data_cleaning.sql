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

SELECT COUNT(*)
FROM online_retail
WHERE description IS NULL
AND UnitPrice = 0;

SELECT *
FROM online_retail
WHERE description IS NULL
LIMIT 20;

SELECT COUNT(*)
FROM online_retail
WHERE description IS NULL
AND customerid IS NULL;

SELECT MIN(Quantity),MAX(Quantity)
FROM online_retail;

SELECT *
FROM online_retail
WHERE Quantity = -80995
OR Quantity = 80995;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice =0;

SELECT *
FROM online_retail
WHERE UnitPrice = 0
LIMIT 20;

SELECT *
FROM online_retail
WHERE UnitPrice = 0
AND invoiceno LIKE 'C%';

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice = 0
AND Customerid IS NULL;

SELECT *
FROM online_retail
WHERE UnitPrice = 0
AND Customerid IS NOT NULL;

SELECT Quantity UnitPrice
FROM online_retail
WHERE UnitPrice = 0
AND Quantity = 0;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice = 0
AND Quantity < 0;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice = 0
AND Quantity < 0
AND InvoiceNo NOT LIKE 'C%';

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice = 0
AND Quantity < 0
AND InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NULL;

SELECT DISTINCT Description
FROM online_retail
WHERE UnitPrice = 0
AND Quantity < 0
AND InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NULL;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice = 0
AND Quantity > 0;

SELECT DISTINCT Description
FROM online_retail
WHERE UnitPrice = 0
AND Quantity > 0;

SELECT COUNT(*)
FROM online_retail
WHERE UnitPrice < 0;

SELECT *
FROM online_retail
WHERE UnitPrice < 0;

SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS duplicate_count
FROM online_retail
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;

SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS duplicate_count
FROM online_retail
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1
LIMIT 20;

--Keep only normal positive sales, so exclude rows where quantity or price is not positive.
SELECT *
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0;

SELECT 
  MIN(Quantity) AS minimum_quantity,
  MIN(UnitPrice) AS minimum_unit_price
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0;



