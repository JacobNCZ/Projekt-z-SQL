-- Vytvoření pomocné tabulky:
CREATE TABLE t_jakub_narozny_project_sql_temp_tba
	SELECT
		industry_branch_code,
		industry_name,
		payroll_value,
		payroll_year
	FROM t_jakub_narozny_project_sql_primary_final
	GROUP BY payroll_year, industry_branch_code;

-- Vytvoření hlavní tabulky:
CREATE TABLE t_jakub_narozny_project_sql_task04
	SELECT
		payroll_year AS year,
		total_payroll,
		LAG (total_payroll, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year) AS last_year_payroll,
		(((total_payroll - (LAG (total_payroll, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year)))/(LAG (total_payroll, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year)))*100) AS total_gr_payroll,
		total_price,
		LAG (total_price, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year) AS last_year_price,
		(((total_price - (LAG (total_price, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year)))/(LAG (total_price, 1)
			OVER (PARTITION BY NULL ORDER BY payroll_year)))*100) AS total_gr_price
	FROM (
		SELECT
			payroll_year,
			SUM(payroll_value) AS total_payroll
		FROM t_jakub_narozny_project_sql_temp_tba
		GROUP BY payroll_year) AS t1
	INNER JOIN
		(SELECT
			price_year,	
			sum(product_price) AS total_price
		FROM t_jakub_narozny_project_sql_task03
		GROUP BY price_year) AS t2
	ON payroll_year = price_year;

ALTER TABLE t_jakub_narozny_project_sql_task04
MODIFY COLUMN total_gr_payroll DECIMAL(10,2),
MODIFY COLUMN total_gr_price DECIMAL(10,2);

-- Vymazání dočasné tabulky:
DROP TABLE IF EXISTS t_jakub_narozny_project_sql_temp_tba;

-- Zobrazení výsledných dat:
SELECT
	t1.`year`,
	t1.total_payroll,
	t1.total_gr_payroll,
	total_price,
	total_gr_price,
	diff_tab.difference
FROM t_jakub_narozny_project_sql_task04 AS t1
INNER JOIN (SELECT `year`, (total_gr_price - total_gr_payroll) AS difference
FROM t_jakub_narozny_project_sql_task04) AS diff_tab
ON t1.`year` = diff_tab.YEAR
ORDER BY difference DESC;
