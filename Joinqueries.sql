--How many entries in the database are from Africa?'
select count(*) from countries where continent = 'Africa';
56

--Num of countries in each continent
select continent, count(*) from countries group by 1 order by 2 desc;

continent	      count(*)
Africa	        56
Asia	          51
Europe	        40
NorthAmerica	  36
Oceania	        17
South America	  14

-- What was the total population of Oceania in 2005?
select sum(p.population) from population_years p 
join countries c on c.id = p.country_id 
where c.continent = 'Oceania' and p.year = 2005;
-- 32.66417



-- What is the average population of countries in South America in 2003?
select avg(population) from population_years p join countries c 
on c.id = p.country_id 
where c.continent = 'South America' and p.year = 2003;
--25.89M


-- What country had the smallest population in 2007?
with temp as (
  select min(p.population) as pop, p.country_id from population_years p where p.year = 2007)
  select c.name, t.pop from countries c join temp t on c.id=t.country_id;
  
 --Niue, 0.00216
 
 -- What is the average population of Poland during the time period covered by this dataset?
 SELECT round(avg(population_years.population),2)
FROM population_years
JOIN countries
	on population_years.country_id = countries.id
WHERE countries.name = 'Poland';
-- 38.56M

-- How many countries have the word "The" in their name?
SELECT count(*)
FROM countries
WHERE name like '%The%';
-- 4



-- What was the total population of each continent in 2010?
select sum(p.population) as Tot_Population, c.continent from countries c 
join population_years p 
on c.id = p.country_id 
where p.year=2010 group by 2 order by 1 desc;

Tot_Population	    continent
4133.09148	        Asia
1015.47846	        Africa
723.06044	          Europe
539.79456	          North America
396.58235	          South America
34.95696	          Oceania
