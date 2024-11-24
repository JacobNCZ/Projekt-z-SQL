CREATE TABLE t_jakub_narozny_project_SQL_secondary_final
SELECT 
	c.country,
	c.abbreviation,
	currency_name,
	currency_code,
	e.`year`,
	e.GDP,
	e.population,
	capital_city,
	c.continent,
	c.region_in_world,
	c.national_symbol,
	c.national_dish 
FROM countries AS c
INNER JOIN economies AS e
ON c.country = e.country
WHERE e.`year` BETWEEN '2006' AND '2018';

SELECT * FROM t_jakub_narozny_project_sql_secondary_final;
