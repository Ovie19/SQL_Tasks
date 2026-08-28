-- Request 1
select trip_id, rider_name, fare
from trips
where city = "Lagos";

-- Request 2
select fare, rider_name, city
from trips
order by fare desc limit 5; 

-- Request 3
select distinct city
from trips;

-- Request 4
select * 
from trips
where payment_method = "card" and fare > 5000;

-- Request 5
select *
from trips
where distance_km > 5 and distance_km < 10;

-- Request 6
select *
from trips
where rider_name like "A%";

-- Request 7
select * 
from trips
where payment_method in ("card", "wallet");

-- Request 8
select * 
from trips
where rating is null;

-- Request 9
select * 
from trips
where status = "completed"
order by city asc, fare desc;

-- Request 10
select * 
from trips
where status = "cancelled";

-- Request 11  
select sum(fare) as total_revenue, avg(fare) as average_fare, 
max(fare) as biggest_fare, min(fare) smallest_fare
from trips
where status = "completed";

-- Request 12  
select vehicle_type, count(trip_id)
from trips
group by vehicle_type;

-- Request 13  
select city, sum(fare) as total_revenue
from trips
where status = "completed"
group by city
order by total_revenue desc;

-- Request 14 
select city, avg(rating) as average_rating
from trips
group by city
having average_rating < 4.0;

-- Request 15 
select trips.*, trip_id, driver_name, home_city
from trips join drivers
on trips.driver_id = drivers.driver_id;

-- Request 16  
select trips.driver_id, driver_name, count(trip_id) as number_of_trips
from trips join drivers
on trips.driver_id = drivers.driver_id
group by driver_id
having number_of_trips > 6;
