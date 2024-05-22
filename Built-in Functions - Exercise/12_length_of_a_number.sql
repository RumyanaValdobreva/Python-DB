SELECT 
	population,
	LENGTH(CAST(population AS VARCHAR)) AS length
FROM countries;

-- SELECT 
-- 	LENGTH(population::"varchar") AS length -- Does not work in judje
-- FROM countries;