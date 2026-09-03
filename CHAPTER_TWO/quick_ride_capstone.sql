-- Question 1
SELECT
    t.trip_id,
    t.rider_name,
    d.driver_name,
    t.city,
    t.fare
FROM trips t
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.status = 'Completed';

-- Question 2
SELECT
    t.trip_id,
    t.rider_name,
    d.driver_name,
    t.city,
    t.fare
FROM trips t
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.city = 'Lagos';

-- Question 3
SELECT
    rider_name,
    SUM(fare) AS total_spend
FROM trips
WHERE status = 'completed'
GROUP BY rider_name
ORDER BY total_spend DESC;

-- Question 4
SELECT 
	d.driver_name,
    COUNT(t.trip_id) AS completed_trips,
    AVG(t.rating) AS average_rating
FROM trips t
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.status = 'Completed'
GROUP BY d.driver_id, d.driver_name;

-- Question 5
SELECT *
FROM trips
WHERE status = 'Completed'
  AND fare > (
      SELECT AVG(fare)
      FROM trips
      WHERE status = 'Completed'
  );

-- Question 6
SELECT
	d.driver_name
FROM drivers d
WHERE NOT EXISTS(
	SELECT 1
    FROM trips t
    WHERE t.driver_id = d.driver_id
		AND t.status = 'Cancelled'
);

-- Question 7
SELECT
	d.driver_name,
    t.fare
FROM drivers d
JOIN trips t
	ON t.driver_id = d.driver_id
WHERE t.fare = (
	SELECT MAX(fare)
    FROM trips
); 

-- Question 8
SELECT
    d.driver_name,
    COUNT(t.trip_id) AS trip_count
FROM drivers d
JOIN trips t
    ON d.driver_id = t.driver_id
GROUP BY
    d.driver_id,
    d.driver_name
HAVING COUNT(t.trip_id) > (
    SELECT COUNT(t2.trip_id)
    FROM trips t2
    JOIN drivers d2
        ON t2.driver_id = d2.driver_id
    WHERE d2.driver_name = 'Chioma Bello'
);

-- Question 9
SELECT DISTINCT
    rider_name
FROM trips
WHERE rating = 5;

-- Question 10
SELECT
    rider_name AS name,
    city,
    'Rider' AS role
FROM trips
UNION ALL
SELECT
    driver_name AS name,
    home_city AS city,
    'Driver' AS role
FROM drivers;

-- Question 11
SELECT city
FROM trips
UNION
SELECT home_city
FROM drivers;

-- Question 12
SELECT	
	d.driver_name,
    SUM(t.fare) as total_earnings
FROM drivers d
JOIN trips t
	ON t.driver_id = d.driver_id
WHERE t.status = 'completed'
GROUP BY d.driver_id
ORDER BY total_earnings DESC
LIMIT 1;