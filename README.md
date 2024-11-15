# Projekt-z-SQL
Data o mzdách a cenách potravin a jejich zpracování pomocí SQL

Porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období

Výstup projektu
1.	Data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky (t_jakub_narozny_project_SQL_primary_final)
2.	Dodatečná data o dalších evropských státech (t_jakub_narozny_project_SQL_secondary_final)

Výzkumné otázky – izolované úkoly v jednotlivých SQL scriptech – SQL dotazy z nově vytvořených tabulek. Každá otázka představuje jeden soubor končící .sql. Dodatečné komentáře jsou doplněny v pdf souboru.
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroční nárůst)?
4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
   
Jednotlivé SQL scripty:
creating_table_primary_final – vytvoření tabulky: „t_jakub_narozny_project_SQL_primary_final“
creating_table_secondary_final – vytvoření tabulky: „t_jakub_narozny_project_SQL_secondary_final“
1st_task – výstupní data jsou přímo v SQL dotazu bez vytvoření tabulky
2nd_task – výstupní data se uloží do tabulky „milk_bread“
3rd_task – vytvoří se tabulka „czechia_price_growth_rate“ a tabulka „products_lowest_growth_rate“
4th_task – vytvoří se tabulka „payroll_growth_rate“ a tabulka „total_payroll_growth_rate“
5th_task – aktualizuje se tabulka „total_payroll_growth_rate“
