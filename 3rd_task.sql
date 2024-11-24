CREATE TABLE t_jakub_narozny_project_sql_task03
	SELECT
		product_code,
		product_name,
		concat(price_value, price_unit) AS unit,
		price_year,
		product_price,
		LAG (product_price, 1)
			OVER (PARTITION BY product_code ORDER BY price_year) AS last_year,
		(product_price - (LAG (product_price, 1)
			OVER (PARTITION BY product_code ORDER BY price_year))) AS price_difference,
		((product_price - (LAG (product_price, 1)
			OVER (PARTITION BY product_code ORDER BY price_year)))/(LAG (product_price, 1)
			OVER (PARTITION BY product_code ORDER BY price_year))*100) AS growth_rate_price
	FROM t_jakub_narozny_project_sql_primary_final
	GROUP BY product_code, price_year;

ALTER TABLE t_jakub_narozny_project_sql_task03
MODIFY COLUMN growth_rate_price DECIMAL(10,2);

SELECT * FROM t_jakub_narozny_project_sql_task03;
