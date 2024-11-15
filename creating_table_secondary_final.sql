CREATE TABLE t_jakub_narozny_project_SQL_secondary_final
SELECT 
	countries.country,
	countries.abbreviation,
	currency_name,
	currency_code,
	economies.`year`,
	economies.GDP,
	economies.population,
	capital_city,
	countries.continent,
	countries.region_in_world,
	countries.national_symbol,
	countries.national_dish 
FROM countries
INNER JOIN economies
ON countries.country = economies.country
WHERE economies.`year` BETWEEN '2006' AND '2018';
