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
SELECT LastName, FirstName , COUNT(*) as NumberOfCustomer
FROM CUSTOMER
Group BY LastName, FirstName;

-- M
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID in (
		SELECT CustomerID 
        FROM SALE 
        WHERE Total > 100
)
ORDER BY LastName ASC, FirstName DESC;

-- N
SELECT C.LastName, C.FirstName, C.Phone
FROM CUSTOMER As C, SALE as S
WHERE C.CustomerID = S.SaleID
and S.Total > 100
ORDER BY C.LastName asc,  C.FirstName desc;

-- O
SELECT C.FirstName, C.LastName , C.Phone
FROM CUSTOMER AS C 
JOIN SALE AS S ON C.CustomerID = S.SaleID
WHERE S.Total > 100
ORDER BY C.LastName asc, C.FirstName desc;

-- P
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID in (
	SELECT CustomerID
	FROM SALE
    WHERE SaleID IN (
		SELECT SaleItemID
        FROM SALE_ITEM
        where ItemID in (
			select ItemID 
            FROM ITEM
            WHERE ItemDescription = 'Desk Lamp'
        )
    )
)
ORDER BY LastName asc, FirstName desc;
describe ITEM;

-- Q
select LastName, FirstName, Phone
from CUSTOMER as C 
join SALE as S
join SALE_ITEM as SI
join ITEM as I
where C.CustomerID = S.CustomerID
and S.SaleID = SI.SaleID
and SI.ItemID = I.ItemID
and I.ItemDescription = 'Desk Lamp'
ORDER BY C.LastName asc, C.FirstName desc;

-- R
SELECT LastName, FirstName, Phone
from CUSTOMER as C 
Join SALE as S on C.CustomerID = S.SaleID
join SALE_ITEM as SI on S.SaleID = SI.SaleID
join ITEM as I on SI.ItemID = I.ItemID
where I.ItemDescription = 'Desk Lamp'
ORDER BY LastName asc, FirstName desc;

-- S
SELECT LastName, FirstName, Phone
FROM CUSTOMER as C 
JOIN SALE as S on C.CustomerID = S.CustomerID
WHERE S.SaleID in(
	SELECT SaleID
    FROM SALE_ITEM as SI
    join ITEM as I on  SI.ItemID = I.ItemID
    where ItemDescription = 'Desk Lamp'
)
ORDER BY LastName desc, FirstName asc;

-- T
SELECT LastName, FirstName, Phone
FROM CUSTOMER as C 
WHERE C.CustomerID in (
	SELECT S.CustomerID
    FROM SALE AS S
    join SALE_ITEM as SI on S.SaleID = SI.SaleID
    where SI.ItemID in (
		SELECT ItemID
        FROM ITEM 
        where ItemDescription = 'Desk Lamp'
    )
); 

-- U
SELECT C.LastName, C.FirstName, C.Phone, I.ItemDescription
FROM CUSTOMER AS C
LEFT JOIN SALE AS S ON C.CustomerID = S.CustomerID
LEFT JOIN SALE_ITEM AS SI ON S.SaleID = SI.SaleID
LEFT JOIN ITEM AS I ON SI.ItemID = I.ItemID AND I.ItemDescription = 'Desk Lamp'
ORDER BY I.ItemDescription ASC, C.LastName ASC, C.FirstName DESC;

-- V
SELECT 
    C1.LastName AS CustomerLastName, 
    C1.FirstName AS CustomerFirstName, 
    C2.LastName AS ReferredByLastName, 
    C2.FirstName AS ReferredByFirstName
FROM CUSTOMER AS C1
LEFT JOIN CUSTOMER AS C2 ON C1.ReferredBy = C2.CustomerID;