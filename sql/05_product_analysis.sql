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
- StockCode 23843 showed the highest gross positive quantity at 80,995 units,
  but it was previously identified as part of an unusually large reversal
  transaction and should not be interpreted as normal product performance.
- StockCode 23166 followed with 78,033 gross positive units.
- StockCode 22197 recorded 56,921 gross positive units.
- Multiple products had the lowest gross positive sales volume, with only 1 unit.
*/


-- 2. Which products generate the most and least revenue?

-- Investigate non-product StockCodes found in the revenue ranking
SELECT DISTINCT
    StockCode,
    Description
FROM online_retail
WHERE StockCode IN ('DOT', 'M', 'POST', 'AMAZONFEE');

-- Products generating the highest revenue
SELECT
    StockCode,
    SUM(Quantity * UnitPrice) AS product_revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND StockCode NOT IN ('DOT', 'POST', 'M', 'AMAZONFEE')
GROUP BY StockCode
ORDER BY product_revenue DESC;

-- Products generating the lowest revenue
SELECT
    StockCode,
    SUM(Quantity * UnitPrice) AS product_revenue
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND StockCode NOT IN ('DOT', 'POST', 'M', 'AMAZONFEE')
GROUP BY StockCode
ORDER BY product_revenue ASC;

/*
Product revenue findings:
- StockCode 22423 generated the highest gross positive product revenue: 174,484.74.
- StockCode 23843 ranked second at 168,469.60, but this stock code was previously
  identified as part of an unusually large reversal transaction, so it should
  not be interpreted as normal product performance.
- StockCode 84227 generated the lowest gross positive product revenue: 0.42.
- Non-product charges such as postage, manual entries, and Amazon fees were
  excluded from the product revenue ranking.
*/