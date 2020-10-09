SELECT DISTINCT year from population_years;

SELECT * FROM population_years
WHERE country = 'Gabon'
ORDER BY population DESC
LIMIT 1;

SELECT * FROM population_years 
WHERE year = '2005' 
ORDER BY population ASC LIMIT 10;

select distinct country from population_years where year = '2010' and population > 100;

select count(*) from population_years where country like '%Islands%';

select population from population_years where country = 'Indonesia' and year = '2000';
select population from population_years where country = 'Indonesia' and year = '2010';


SELECT country,
 CASE
  WHEN population > 100 THEN 'Highly_populous'
  WHEN imdb_rating < 10 THEN 'Less_populous'
  ELSE 'Moderate Growth'
 END AS Population_Growth_Slope
FROM population_years;
