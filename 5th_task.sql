SELECT
	country,	
	abbreviation,
	currency_code,
	`year`,
	GDP
FROM t_jakub_narozny_project_sql_secondary_final
WHERE country = 'Czech Republic'
ORDER BY `year`;

INSERT INTO total_payroll_growth_rate (`section`)
VALUES ('GDP');

UPDATE total_payroll_growth_rate
	SET `sum(year_2006)` = 
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2006),
		`sum(year_2007)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2007),
		`sum(year_2008)` = 
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2008),
		`sum(year_2009)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2009),
		`sum(year_2010)` = 
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2010),
		`sum(year_2011)` = 
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2011),
		`sum(year_2012)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2012),
		`sum(year_2013)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2013),
		`sum(year_2014)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2014),
		`sum(year_2015)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2015),
		`sum(year_2016)` = 
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2016),
		`sum(year_2017)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2017),
		`sum(year_2018)` =
		(SELECT GDP 
		FROM t_jakub_narozny_project_sql_secondary_final
		WHERE country = 'Czech Republic' AND YEAR = 2018)
	WHERE `section` = 'GDP';

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

SELECT 
	`section`,
	total_gr_07,
	total_gr_08,
	total_gr_09,
	total_gr_10,
	total_gr_12,
	total_gr_13,
	total_gr_14,
	total_gr_15,
	total_gr_16,
	total_gr_17,
	total_gr_18
FROM total_payroll_growth_rate;
