CREATE TABLE czechia_products
	(SELECT
		czechia_price.id AS price_id,
		category_code AS product_code,
		name AS product_name,
		round(avg(value), 2) AS product_price,
		price_value,
		price_unit,
		YEAR(date_from) AS price_year
	FROM czechia_price
	INNER JOIN czechia_price_category
		ON czechia_price.category_code = czechia_price_category.code
	GROUP BY category_code, YEAR(date_from)
	ORDER BY category_code);

CREATE TABLE czechia_industry 
	(SELECT 
		czechia_payroll.id AS payroll_id, 
		value_type_code,
		unit_code,
		industry_branch_code,
		name AS industry_name,
		round(avg(value), 2) AS payroll_value,
		payroll_year
	FROM czechia_payroll
	INNER JOIN czechia_payroll_industry_branch 
		ON czechia_payroll.industry_branch_code = czechia_payroll_industry_branch.code
	WHERE industry_branch_code IS NOT NULL AND value_type_code <> 316 
	GROUP BY industry_branch_code, payroll_year);

CREATE TABLE t_jakub_narozny_project_SQL_primary_final 
	(SELECT * FROM czechia_industry
	INNER JOIN czechia_products
		ON czechia_industry.payroll_year = czechia_products.price_year);

DROP TABLE IF EXISTS czechia_products, czechia_industry;
