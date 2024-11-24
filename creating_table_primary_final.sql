CREATE TABLE t_jakub_narozny_project_SQL_primary_final
SELECT 
	value_type_code,
	unit_code,
	industry_branch_code,
	industry_name,
	payroll_value,
	payroll_year,
	product_code,
	product_name,
	product_price,
	price_value,
	price_unit,
	price_year
FROM (SELECT  
		value_type_code,
		unit_code,
		industry_branch_code,
		name AS industry_name,
		round(avg(value), 2) AS payroll_value,
		payroll_year
	FROM czechia_payroll AS cz_payr
	INNER JOIN czechia_payroll_industry_branch AS cz_pibc
		ON cz_payr.industry_branch_code = cz_pibc.code
	WHERE industry_branch_code IS NOT NULL AND value_type_code <> 316 
	GROUP BY
		industry_branch_code,
		payroll_year,
		value_type_code,
		unit_code,
		industry_name) AS cz_i
INNER JOIN 
	(SELECT
		category_code AS product_code,
		name AS product_name,
		round(avg(value), 2) AS product_price,
		price_value,
		price_unit,
		YEAR(date_from) AS price_year
	FROM czechia_price AS cz_pri
	INNER JOIN czechia_price_category AS cz_pc
	ON cz_pri.category_code = cz_pc.code
	GROUP BY
		product_code,
		price_year,
		product_name,
		price_value,
		price_unit
	ORDER BY category_code) AS cz_p
ON cz_i.payroll_year = cz_p.price_year
ORDER BY industry_branch_code, payroll_year, product_code;

SELECT * FROM t_jakub_narozny_project_sql_primary_final;
