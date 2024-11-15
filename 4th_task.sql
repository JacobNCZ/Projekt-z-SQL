CREATE TABLE payroll_growth_rate
SELECT
	industry_branch_code,
	industry_name
FROM t_jakub_narozny_project_sql_primary_final
GROUP BY industry_branch_code;

ALTER TABLE payroll_growth_rate
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
	
UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2006
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2006 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2007
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2007 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2008
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2008 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2009
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2009 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2010
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2010 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2011
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2011 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2012
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2012 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2013
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2013 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2014
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2014 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2015
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2015 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2016
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2016 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2017
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2017 = temp_table.payroll_value;

UPDATE payroll_growth_rate
LEFT JOIN (SELECT industry_branch_code, payroll_value
FROM t_jakub_narozny_project_sql_primary_final
WHERE price_year = 2018
GROUP BY price_year, industry_branch_code) AS temp_table
ON payroll_growth_rate.industry_branch_code = temp_table.industry_branch_code
SET payroll_growth_rate.year_2018 = temp_table.payroll_value;

UPDATE payroll_growth_rate
SET payroll_growth_rate.gr_07 = (((year_2007 - year_2006)/year_2006)*100),
	payroll_growth_rate.gr_08 = (((year_2008 - year_2007)/year_2007)*100),
	payroll_growth_rate.gr_09 = (((year_2009 - year_2008)/year_2008)*100),
	payroll_growth_rate.gr_10 = (((year_2010 - year_2009)/year_2009)*100), 
	payroll_growth_rate.gr_11 = (((year_2011 - year_2010)/year_2010)*100),
	payroll_growth_rate.gr_12 = (((year_2012 - year_2011)/year_2011)*100),
	payroll_growth_rate.gr_13 = (((year_2013 - year_2012)/year_2012)*100),
	payroll_growth_rate.gr_14 = (((year_2014 - year_2013)/year_2013)*100),
	payroll_growth_rate.gr_15 = (((year_2015 - year_2014)/year_2014)*100),
	payroll_growth_rate.gr_16 = (((year_2016 - year_2015)/year_2015)*100),
	payroll_growth_rate.gr_17 = (((year_2017 - year_2016)/year_2016)*100),
	payroll_growth_rate.gr_18 = (((year_2018 - year_2017)/year_2017)*100);

CREATE TABLE total_payroll_growth_rate
(SELECT 
	'section',
	sum(year_2006),
	sum(year_2007),
	sum(year_2008),
	sum(year_2009),
	sum(year_2010),
	sum(year_2011),
	sum(year_2012),
	sum(year_2013),
	sum(year_2014),
	sum(year_2015),
	sum(year_2016),
	sum(year_2017),
	sum(year_2018)
FROM payroll_growth_rate)
UNION
(SELECT
	'Total Price - all products',
	sum(year_2006),
	sum(year_2007),
	sum(year_2008),
	sum(year_2009),
	sum(year_2010),
	sum(year_2011),
	sum(year_2012),
	sum(year_2013),
	sum(year_2014),
	sum(year_2015),
	sum(year_2016),
	sum(year_2017),
	sum(year_2018)
FROM czechia_price_growth_rate);

ALTER TABLE total_payroll_growth_rate
MODIFY COLUMN section varchar(30),
ADD total_gr_07 decimal(10,2),
ADD total_gr_08 decimal(10,2),
ADD total_gr_09 decimal(10,2),
ADD total_gr_10 decimal(10,2),
ADD total_gr_11 decimal(10,2),
ADD total_gr_12 decimal(10,2),
ADD total_gr_13 decimal(10,2),
ADD total_gr_14 decimal(10,2),
ADD total_gr_15 decimal(10,2),
ADD total_gr_16 decimal(10,2),
ADD total_gr_17 decimal(10,2),
ADD total_gr_18 decimal(10,2);

UPDATE total_payroll_growth_rate
SET `section` = 'Total Payroll - all industry' WHERE `section` = 'section';

UPDATE total_payroll_growth_rate
SET	total_payroll_growth_rate.total_gr_07 = (((`sum(year_2007)` - `sum(year_2006)`)/`sum(year_2006)`)*100),
	total_payroll_growth_rate.total_gr_08 = (((`sum(year_2008)` - `sum(year_2007)`)/`sum(year_2007)`)*100),
	total_payroll_growth_rate.total_gr_09 = (((`sum(year_2009)` - `sum(year_2008)`)/`sum(year_2008)`)*100),
	total_payroll_growth_rate.total_gr_10 = (((`sum(year_2010)` - `sum(year_2009)`)/`sum(year_2009)`)*100),
	total_payroll_growth_rate.total_gr_11 = (((`sum(year_2011)` - `sum(year_2010)`)/`sum(year_2010)`)*100),
	total_payroll_growth_rate.total_gr_12 = (((`sum(year_2012)` - `sum(year_2011)`)/`sum(year_2011)`)*100),
	total_payroll_growth_rate.total_gr_13 = (((`sum(year_2013)` - `sum(year_2012)`)/`sum(year_2012)`)*100),
	total_payroll_growth_rate.total_gr_14 = (((`sum(year_2014)` - `sum(year_2013)`)/`sum(year_2013)`)*100),
	total_payroll_growth_rate.total_gr_15 = (((`sum(year_2015)` - `sum(year_2014)`)/`sum(year_2014)`)*100),
	total_payroll_growth_rate.total_gr_16 = (((`sum(year_2016)` - `sum(year_2015)`)/`sum(year_2015)`)*100),
	total_payroll_growth_rate.total_gr_17 = (((`sum(year_2017)` - `sum(year_2016)`)/`sum(year_2016)`)*100),
	total_payroll_growth_rate.total_gr_18 = (((`sum(year_2018)` - `sum(year_2017)`)/`sum(year_2017)`)*100);

SELECT 2007 AS year,
	(SELECT total_gr_07 FROM total_payroll_growth_rate
	WHERE `section` = 'Total price - all products')
	-
	(SELECT total_gr_07 FROM total_payroll_growth_rate
	WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2008,
		(SELECT total_gr_08 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_08 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2009,
		(SELECT total_gr_09 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_09 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2010,
		(SELECT total_gr_10 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_10 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2011,
		(SELECT total_gr_11 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_11 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2012,
		(SELECT total_gr_12 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_12 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2013,
		(SELECT total_gr_13 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_13 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2014,
		(SELECT total_gr_14 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_14 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2015,
		(SELECT total_gr_15 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_15 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference	
UNION
	SELECT 2016,
		(SELECT total_gr_16 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_16 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2017,
		(SELECT total_gr_17 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_17 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
UNION
	SELECT 2018,
		(SELECT total_gr_18 FROM total_payroll_growth_rate
		WHERE `section` = 'Total price - all products')
		-
		(SELECT total_gr_18 FROM total_payroll_growth_rate
		WHERE `section` = 'Total Payroll - all industry') AS Difference
ORDER BY Difference DESC;

SELECT * 
FROM total_payroll_growth_rate;
