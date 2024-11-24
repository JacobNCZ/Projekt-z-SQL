-- Vytvoření pomocné tabulky:
CREATE TABLE t_jakub_narozny_project_sql_temp_gdp
SELECT
	country,	
	abbreviation,
	currency_code,
	`year`,
	GDP,
	LAG (GDP, 1)
		OVER (PARTITION BY NULL ORDER BY year) AS last_year_price,
	(((GDP - (LAG (GDP, 1)
		OVER (PARTITION BY NULL ORDER BY year)))/(LAG (GDP, 1)
		OVER (PARTITION BY NULL ORDER BY year)))*100) AS total_gr_GDP
FROM t_jakub_narozny_project_sql_secondary_final
WHERE country = 'Czech Republic'
ORDER BY `year`;

-- Úprava typu sloupce - změna počtu des. míst:
ALTER TABLE t_jakub_narozny_project_sql_temp_gdp
MODIFY COLUMN total_gr_GDP DECIMAL(10,2);

-- Vytvoření hlavní tabulky:
CREATE TABLE t_jakub_narozny_project_sql_task05
SELECT
	tab1.country,
	tab1.abbreviation,
	tab1.currency_code,
	tab1.GDP,
	tab1.total_gr_GDP,
	tab2.total_gr_payroll,
	tab2.total_gr_price,
	tab1.`year`,
	tab2.total_payroll,
	tab2.total_price,	
	tab2.difference
FROM t_jakub_narozny_project_sql_temp_gdp AS tab1
INNER JOIN (SELECT
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
ORDER BY difference DESC) AS tab2
ON tab1.`year` = tab2.`year`;

-- Vymazání pomocné tabulky:
DROP TABLE IF EXISTS t_jakub_narozny_project_sql_temp_gdp;

-- Finální výbar požadovaných dat:
SELECT * FROM t_jakub_narozny_project_sql_task05;
