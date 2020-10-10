-----------NON-CORRELATED SUBQUERIES-----------


--find flight information about flights where the origin elevation is less than 2000 feet.
SELECT * 
FROM flights 
WHERE origin in (
    SELECT code 
    FROM airports 
    WHERE elevation < 2000);
    
    
-- find flight information about flights where the Federal Aviation Administration region (faa_region) is the Southern region (ASO).
SELECT * 
FROM flights 
WHERE origin in (
    SELECT code 
    FROM airports 
    WHERE faa_region = 'ASO');
    
-- find how many flights are there on average, for all Fridays in a given month from the flights table
SELECT a.dep_month,
       a.dep_day_of_week,
       AVG(a.flight_count) AS average_flights
  FROM (
        SELECT dep_month,
              dep_day_of_week,
               dep_date,
               COUNT(*) AS flight_count
          FROM flights
         GROUP BY 1,2,3
       ) a
 GROUP BY 1,2
 ORDER BY 1,2;
 
 --find the average total distance flown by day of week and month.
 SELECT a.dep_month,
       a.dep_day_of_week,
       AVG(a.flight_distance) AS average_distance
  FROM (
        SELECT dep_month,
              dep_day_of_week,
               dep_date,
               sum(distance) AS flight_distance
          FROM flights
         GROUP BY 1,2,3
       ) a
 GROUP BY 1,2
 ORDER BY 1,2;
 
 
 -------CORRELATED SUBQUERIES -----------


-- find the list of all flights whose distance is above average for their carrier.
 SELECT id
FROM flights AS f
WHERE distance > (
 SELECT AVG(distance)
 FROM flights
 WHERE carrier = f.carrier);
 
 
 
 
 
 DATE TIME STRING FUNCTIONS
 --the baked goods are packaged exactly five hours, twenty minutes, and two days after the delivery (designated by delivery_time). 
 --write query returning all the packaging times for the goods in the baked_goods table
 
 SELECT DATETIME(delivery_time, '+5 hours', '30 minutes', '2 day') as package_time
FROM baked_goods;


--Querying with Date and not timestamps
SELECT DATE(manufacture_time), count(*) as count_baked_goods
FROM baked_goods
GROUP BY DATE(manufacture_time);



--Querying with only time
SELECT TIME(manufacture_time), count(*) as count_baked_goods
FROM baked_goods
GROUP BY TIME(manufacture_time);


--determine the overall greatest value of cost for each item
SELECT id, MAX(ingredients_cost, packaging_cost)
FROM baked_goods;

--string concatenation

SELECT first_name || ' ' || last_name as full_name
FROM bakeries;
 

 
