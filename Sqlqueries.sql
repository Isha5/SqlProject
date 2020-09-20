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
