CREATE TABLE t_jakub_narozny_project_sql_task01
SELECT
	industry_branch_code,
	industry_name,
	payroll_year,
	payroll_value,
	LAG (payroll_value, 1)
		OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS last_year,
	(payroll_value - (LAG (payroll_value, 1)
		OVER (PARTITION BY industry_branch_code ORDER BY payroll_year))) AS difference 
FROM t_jakub_narozny_project_sql_primary_final
GROUP BY industry_branch_code, payroll_year;

SELECT * 
FROM t_jakub_narozny_project_sql_task01
WHERE difference < 0;
