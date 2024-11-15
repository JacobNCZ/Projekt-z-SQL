SELECT
	industry_branch_code,
	industry_name,
	payroll_value,
	payroll_year
FROM t_jakub_narozny_project_sql_primary_final
GROUP BY industry_branch_code, payroll_year;