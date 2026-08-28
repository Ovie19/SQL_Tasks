-- A
SELECT * FROM CUSTOMER;
SELECT * FROM ITEM;
SELECT * FROM SALE;
SELECT * FROM SALE_ITEM;

-- B
SELECT LastName, FirstName, Phone
FROM CUSTOMER;

-- C
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = "John";

-- D
SELECT C.LastName, C.FirstName, C.Phone,
	S.SaleDate, S.Total
FROM CUSTOMER AS C, SALE AS S
WHERE C.CustomerID = S.CustomerID AND
	S.Total > 100;

-- E
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName LIKE "D%";

-- F
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE "%ne%";

-- G
-- SELECT LastName, FirstName, Phone
-- FROM CUSTOMER
-- WHERE Phone 

-- H
SELECT MAX(Total) as MaximumSale,
	MIN(Total) as MinimumSale
FROM SALE;

-- I
SELECT AVG(Total) AS AverageSales
FROM SALE;

-- J
SELECT COUNT(CustomerID) AS NumberOfCustomer
FROM CUSTOMER;

-- K
-- SELECT * 
-- FROM CUSTOMER
-- GROUP BY LastName;

-- M
SELECT LastName, FirstName, Phone
FROM CUSTOMER