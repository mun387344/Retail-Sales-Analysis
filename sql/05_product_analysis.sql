-- PRODUCT ANALYSIS

-- 1. Which products have the highest and lowest sales volumes?

-- Products with the highest sales volume
SELECT
    StockCode,
    SUM(Quantity) AS total_quantity_sold
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY StockCode
ORDER BY total_quantity_sold DESC;

-- Products with the lowest sales volume
SELECT
    StockCode,
    SUM(Quantity) AS total_quantity_sold
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
GROUP BY StockCode
ORDER BY total_quantity_sold ASC;

/*
Sales volume findings:
- StockCode 23843 had the highest sales volume with 80,995 units sold.
- StockCode 23166 followed with 78,033 units sold.
- StockCode 22197 sold 56,921 units.
- Multiple products had the lowest sales volume, with only 1 unit sold.
*/

-- 2. Which products generate the most and least revenue?