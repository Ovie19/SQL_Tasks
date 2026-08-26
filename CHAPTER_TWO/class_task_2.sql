SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState = "CA" or
	  WAREHOUSE.WarehouseState = "GA" or 
      WAREHOUSE.WarehouseState = "ME";
      
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState in ("CA", "GA", "ME");

SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState != "CA" and
	  WAREHOUSE.WarehouseState != "GA" and 
      WAREHOUSE.WarehouseState != "ME";
      
SELECT INVENTORY.SKU, 
	   INVENTORY.SKU_Description, 
       INVENTORY.WarehouseID, 
       WAREHOUSE.WarehouseCity, 
       WAREHOUSE.WarehouseState 
from INVENTORY,  WAREHOUSE
where WAREHOUSE.WarehouseState not in ("CA", "GA", "ME");
      
SELECT CONCAT(INVENTORY.SKU_Description, ' is located in ' , WAREHOUSE.WarehouseCity) AS Descr
FROM INVENTORY, WAREHOUSE;

SELECT SKU, 
       SKU_Description, 
       WarehouseID
FROM INVENTORY
WHERE WarehouseID = (
    SELECT WarehouseID
    FROM WAREHOUSE w
    WHERE w.Manager = 'Lucille Smith'
);