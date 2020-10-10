
-- Label airports according to their elevation and fetch the num of airports falling under certain threshold elevation
SELECT
    CASE
        WHEN elevation < 500 THEN 'Low'
        WHEN elevation BETWEEN 500 AND 1999 THEN 'Medium'
        WHEN elevation >= 2000 THEN 'High'
        ELSE 'Unknown'
    END AS elevation_tier
    , COUNT(*)
FROM airports
GROUP BY 1;

--elevation_tier	count(*)
High	            110
Low	              172
Medium	          362

--count the number of low elevation airports by state (low_elevation value = less than 1000ft)
SELECT  state, 
    COUNT(CASE WHEN elevation < 1000 THEN 1 ELSE NULL END) as count_low_elevation_aiports 
FROM airports 
GROUP BY state;


--Find the sum of the total flight distance and compare that to the sum of flight distance from a particular airline 
SELECT origin, sum(distance) as total_flight_distance, sum(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END) as total_delta_flight_distance 
FROM flights 
GROUP BY origin;

-- find the percentage of flights from Delta by origin (carrier = 'DL')
SELECT origin, 100.0*(sum(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END)/sum(distance)) 
as percentage_flight_distance_from_delta 
FROM flights GROUP BY origin;

--Find the percentage of high elevation airports (elevation >= 2000) by state
SELECT state, 100.0 * sum(CASE WHEN elevation >= 2000 THEN 1 ELSE 0 END) / count(*) 
as percentage_high_elevation_airports FROM airports
GROUP BY state;
