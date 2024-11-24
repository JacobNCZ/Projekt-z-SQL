/*První procedura pro výběr dat za první období při zadání kódu zboží*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `engeto_db_final`.`possible_buy_qty_product_first_year`(IN pro_code INT)
BEGIN
	CREATE TABLE IF NOT EXISTS t_jakub_narozny_project_sql_task02 (
		product_code int,
		product_name varchar(50),
		price_year int,
		product_price double,
		total_payroll_value decimal(35,2),
		possible_qty double);
	
	INSERT INTO t_jakub_narozny_project_sql_task02 
		(SELECT
			DISTINCT(product_code),
			product_name,
			price_year,
			product_price,
			SUM(payroll_value) AS total_payroll_value,
			ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
		FROM t_jakub_narozny_project_sql_primary_final_original
		WHERE price_year = (SELECT MIN(price_year) FROM t_jakub_narozny_project_sql_primary_final_original) AND 
			product_code = pro_code
		GROUP BY product_code, price_year, product_price);
END

/*Druhá procedura pro výběr dat za poslední období při zadání kódu zboží*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `engeto_db_final`.`possible_buy_qty_product_last_year`(IN pro_code INT)
BEGIN
	CREATE TABLE IF NOT EXISTS t_jakub_narozny_project_sql_task02 (
		product_code int,
		product_name varchar(50),
		price_year int,
		product_price double,
		total_payroll_value decimal(35,2),
		possible_qty double);
		
	INSERT INTO t_jakub_narozny_project_sql_task02 
		(SELECT
			DISTINCT(product_code),
			product_name,
			price_year,
			product_price,
			SUM(payroll_value) AS total_payroll_value,
			ROUND((SUM(payroll_value)/product_price),2) AS possible_qty
		FROM t_jakub_narozny_project_sql_primary_final_original
		WHERE price_year = (SELECT MAX(price_year) FROM t_jakub_narozny_project_sql_primary_final_original) AND 
			product_code = pro_code
		GROUP BY product_code, price_year, product_price);
END

/*Pokud mám procedury uloženy, mohu je následně zavolat:*/
CALL possible_buy_qty_product_first_year(111301);
CALL possible_buy_qty_product_first_year(114201);
CALL possible_buy_qty_product_last_year(111301);
CALL possible_buy_qty_product_last_year(114201);

SELECT * FROM t_jakub_narozny_project_sql_task02;