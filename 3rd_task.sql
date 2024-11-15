CREATE TABLE czechia_price_growth_rate 
SELECT 
	product_code,
	product_name,
	concat(price_value, price_unit) AS unit
FROM t_jakub_narozny_project_sql_primary_final
GROUP BY product_code;

ALTER TABLE czechia_price_growth_rate
	ADD year_2006 decimal(10,2),
	ADD year_2007 decimal(10,2),
	ADD year_2008 decimal(10,2),
	ADD year_2009 decimal(10,2),
	ADD year_2010 decimal(10,2),
	ADD year_2011 decimal(10,2),
	ADD year_2012 decimal(10,2),
	ADD year_2013 decimal(10,2),
	ADD year_2014 decimal(10,2),
	ADD year_2015 decimal(10,2),
	ADD year_2016 decimal(10,2),
	ADD year_2017 decimal(10,2),
	ADD year_2018 decimal(10,2),
	ADD gr_07 decimal(10,2),
	ADD gr_08 decimal(10,2),
	ADD gr_09 decimal(10,2),
	ADD gr_10 decimal(10,2),
	ADD gr_11 decimal(10,2),
	ADD gr_12 decimal(10,2),
	ADD gr_13 decimal(10,2),
	ADD gr_14 decimal(10,2),
	ADD gr_15 decimal(10,2),
	ADD gr_16 decimal(10,2),
	ADD gr_17 decimal(10,2),
	ADD gr_18 decimal(10,2);

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2006
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2006 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2007
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2007 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2008
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2008 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2009
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2009 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2010
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2010 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2011
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2011 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2012
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2012 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2013
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2013 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2014
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2014 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2015
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2015 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2016
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2016 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2017
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2017 = temp_table.product_price;

UPDATE czechia_price_growth_rate
LEFT JOIN (SELECT product_code, product_price
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2018
GROUP BY price_year, product_code) AS temp_table
ON czechia_price_growth_rate.product_code = temp_table.product_code
SET czechia_price_growth_rate.year_2018 = temp_table.product_price;

/*growth_rate = ((present - past)/past)*100*/
UPDATE czechia_price_growth_rate
SET czechia_price_growth_rate.gr_07 = (((year_2007 - year_2006)/year_2006)*100),
	czechia_price_growth_rate.gr_08 = (((year_2008 - year_2007)/year_2007)*100),
	czechia_price_growth_rate.gr_09 = (((year_2009 - year_2008)/year_2008)*100),
	czechia_price_growth_rate.gr_10 = (((year_2010 - year_2009)/year_2009)*100), 
	czechia_price_growth_rate.gr_11 = (((year_2011 - year_2010)/year_2010)*100),
	czechia_price_growth_rate.gr_12 = (((year_2012 - year_2011)/year_2011)*100),
	czechia_price_growth_rate.gr_13 = (((year_2013 - year_2012)/year_2012)*100),
	czechia_price_growth_rate.gr_14 = (((year_2014 - year_2013)/year_2013)*100),
	czechia_price_growth_rate.gr_15 = (((year_2015 - year_2014)/year_2014)*100),
	czechia_price_growth_rate.gr_16 = (((year_2016 - year_2015)/year_2015)*100),
	czechia_price_growth_rate.gr_17 = (((year_2017 - year_2016)/year_2016)*100),
	czechia_price_growth_rate.gr_18 = (((year_2018 - year_2017)/year_2017)*100);

CREATE TABLE products_lowest_growth_rate
		(SELECT product_code, product_name, unit, gr_07 AS min_growth_rate, '2007' AS year 
		FROM czechia_price_growth_rate
		WHERE gr_07 IS NOT NULL
		ORDER BY gr_07
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_08, '2008'
		FROM czechia_price_growth_rate
		WHERE gr_08 IS NOT NULL
		ORDER BY gr_08
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_09, '2009'
		FROM czechia_price_growth_rate
		WHERE gr_09 IS NOT NULL
		ORDER BY gr_09
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_10, '2010'
		FROM czechia_price_growth_rate
		WHERE gr_10 IS NOT NULL
		ORDER BY gr_10
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_11, '2011'
		FROM czechia_price_growth_rate
		WHERE gr_11 IS NOT NULL
		ORDER BY gr_11
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_12, '2012'
		FROM czechia_price_growth_rate
		WHERE gr_12 IS NOT NULL
		ORDER BY gr_12
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_13, '2013'
		FROM czechia_price_growth_rate
		WHERE gr_13 IS NOT NULL
		ORDER BY gr_13
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_14, '2014'
		FROM czechia_price_growth_rate
		WHERE gr_14 IS NOT NULL
		ORDER BY gr_14
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_15, '2015'
		FROM czechia_price_growth_rate
		WHERE gr_15 IS NOT NULL
		ORDER BY gr_15
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_16, '2016'
		FROM czechia_price_growth_rate
		WHERE gr_16 IS NOT NULL
		ORDER BY gr_16
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_17, '2017'
		FROM czechia_price_growth_rate
		WHERE gr_17 IS NOT NULL
		ORDER BY gr_17
		LIMIT 3)
	UNION
		(SELECT product_code, product_name, unit, gr_18, '2018'
		FROM czechia_price_growth_rate
		WHERE gr_18 IS NOT NULL
		ORDER BY gr_18
		LIMIT 3);

SELECT t2.product_name, t1.total_min_gr, t2.occurrance 
FROM (SELECT 
	product_name,
	sum(min_growth_rate) AS total_min_gr
FROM products_lowest_growth_rate
GROUP BY product_name
ORDER BY sum(min_growth_rate)) 	
 AS t1
INNER JOIN (SELECT 
	product_name,
	count(product_code) AS occurrance
FROM products_lowest_growth_rate
GROUP BY product_name
ORDER BY count(product_name) DESC) AS t2
ON t1.product_name = t2.product_name;

/*Mezi suroviny, které se objevily za každý rok na prvních třech místech v nejnižším meziročním nárůstu se v celkovém součtu objevily suroviny: 'Konzumní brambory', 'Rajská jablka červená kulatá' a 'Pšeničná mouka hladká'*/ 
