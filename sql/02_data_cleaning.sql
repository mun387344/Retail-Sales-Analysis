SELECT COUNT(*)
FROM online_retail
WHERE Quantity < 0
AND InvoiceNo LIKE 'C%';

SELECT *S
FROM online_retail
WHERE Quantity < 0
AND InvoiceNo NOT LIKE 'C%';
