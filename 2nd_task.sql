CREATE TABLE milk_bread
	SELECT
		industry_branch_code,
		industry_name,
		payroll_value,
		product_name,
		product_price,
		price_value,
		price_unit,
		price_year 
	FROM t_jakub_narozny_project_sql_primary_final
	WHERE product_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový') AND price_year IN (2006, 2018);

ALTER TABLE milk_bread
ADD possible_qty decimal(10,2); 

UPDATE milk_bread
SET possible_qty = (payroll_value / product_price);

SELECT * FROM milk_bread;
