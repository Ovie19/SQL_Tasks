-- 2.40
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState = "CA" or
	  WAREHOUSE.WarehouseState = "GA" or 
      WAREHOUSE.WarehouseState = "ME";
    
-- 2.41
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState in ("CA", "GA", "ME");

-- 2.42
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState != "CA" and
	  WAREHOUSE.WarehouseState != "GA" and 
      WAREHOUSE.WarehouseState != "ME";
      
-- 2.43
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState not in ("CA", "GA", "ME");
      
-- 2.44
SELECT CONCAT(INVENTORY.SKU_Description, ' is located in ' , WAREHOUSE.WarehouseCity) AS Descr
FROM INVENTORY, WAREHOUSE;

-- 2.45
SELECT SKU, 
       SKU_Description, 
       WarehouseID
FROM INVENTORY
WHERE WarehouseID = (
    SELECT WarehouseID
    FROM WAREHOUSE w
    WHERE w.Manager = 'Lucille Smith'
);

-- 2.46
SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
WHERE Manager = 'Lucille Smith';

-- 2.47
SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

-- 2.48
SELECT WarehouseID, avg(QuantityOnHand) AS AVERAGE
FROM INVENTORY
WHERE WarehouseID = (SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith')
GROUP BY WarehouseID;

-- 2.49
SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY, WAREHOUSE
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

-- 2.50
SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

-- 2.51
select SKU, SKU_Description, QuantityOnHand,
		WAREHOUSE.WarehouseID, WarehouseCity,
		WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

-- 2.52
SELECT WarehouseID, sum(QuantityOnOrder) AS TotalItemsOnOrder,
sum(QuantityOnHand) as TotalItemsOnHand
from INVENTORY
group by WarehouseID ,QuantityOnOrder;

-- subquery returns specific dataset to outer query  --  

-- 2.55
select SKU, SKU_Description, QuantityOnHand, QuantityOnOrder,
WAREHOUSE.WarehouseID,
WarehouseCity,
WarehouseState, Manager, SquareFeet
from INVENTORY RIGHT OUTER JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

-- 2.56
SELECT SKU, SKU_Description, Department
from CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

-- 2.57
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2017;

-- 2.58
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
WHERE SKU IN (SELECT SKU FROM CATALOG_SKU_2017);

-- 2.59
