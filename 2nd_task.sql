CREATE TABLE t_jakub_narozny_project_sql_task02
	SELECT
		DISTINCT(product_code),
		price_year,
		product_price,
		SUM(payroll_value) AS total_payroll_value,
		ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
	FROM t_jakub_narozny_project_sql_primary_final
	WHERE price_year = (SELECT MIN(price_year) FROM t_jakub_narozny_project_sql_primary_final) AND 
		product_code = 111301
	GROUP BY product_code, price_year, product_price
UNION
	SELECT
		DISTINCT(product_code),
		price_year,
		product_price,
		SUM(payroll_value) AS total_payroll_value,
		ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
	FROM t_jakub_narozny_project_sql_primary_final
	WHERE price_year = (SELECT MAX(price_year) FROM t_jakub_narozny_project_sql_primary_final) AND 
		product_code = 111301
	GROUP BY product_code, price_year, product_price
UNION
	SELECT
		DISTINCT(product_code),
		price_year,
		product_price,
		SUM(payroll_value) AS total_payroll_value,
		ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
	FROM t_jakub_narozny_project_sql_primary_final
	WHERE price_year = (SELECT MIN(price_year) FROM t_jakub_narozny_project_sql_primary_final) AND 
		product_code = 114201
	GROUP BY product_code, price_year, product_price
UNION
	SELECT
		DISTINCT(product_code),
		price_year,
		product_price,
		SUM(payroll_value) AS total_payroll_value,
		ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
	FROM t_jakub_narozny_project_sql_primary_final
	WHERE price_year = (SELECT MAX(price_year) FROM t_jakub_narozny_project_sql_primary_final) AND 
		product_code = 114201
	GROUP BY product_code, price_year, product_price;

SELECT * FROM t_jakub_narozny_project_sql_task02;
