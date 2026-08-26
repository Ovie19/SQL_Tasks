SELECT SKU, SKU_Description
from INVENTORY

SELECT SKU_Description, SKU
from INVENTORY

SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
from INVENTORY

SELECT *
from INVENTORY

SELECT *
from INVENTORY
where QuantityOnHand > 0

SELECT DISTINCT WarehouseID
from INVENTORY

SELECT WarehouseID
from INVENTORY

SELECT *
from INVENTORY
where QuantityOnHand = 0

SELECT SKU, SKU_Description
from INVENTORY
where QuantityOnHand = 0

SELECT SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0
order by WarehouseID

SELECT SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand > 0
order by WarehouseID Desc, SKU asc

SELECT SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0 and QuantityOnOrder > 0
order by WarehouseID Desc, SKU asc

SELECT SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0 or QuantityOnOrder = 0
order by WarehouseID Desc, SKU asc

SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand >= 1 and QuantityOnHand <= 10

SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand between 1 and 10

SELECT Distinct SKU, SKU_Description
from INVENTORY
where SKU_Description Like "Half-Dome%"

SELECT Distinct SKU, SKU_Description
from INVENTORY
where SKU_Description like "%Climb%"

SELECT Distinct SKU, SKU_Description
from INVENTORY
where SKU_Description like "__d%"

SELECT SUM(QuantityOnHand) as Total_sum_of_quantity,
avg(QuantityOnHand) as average_quantity, min(QuantityOnHand) as minimum_quantity,
max(QuantityOnHand) as maximum_quantity, count(QuantityOnHand) as number_of_rows
from INVENTORY

SELECT WarehouseID, sum(QuantityOnHand) as TotalItemsOnHand
from INVENTORY
group by WarehouseID
order by TotalItemsOnHand desc

SELECT WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3
from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
order by TotalItemsOnHandLT3 desc

SELECT WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3
from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
having TotalItemsOnHandLT3 < 2
order by TotalItemsOnHandLT3 desc
