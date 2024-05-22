CREATE VIEW view_continents_countries_currencies_details
AS
SELECT
	concat(
		c.continent_name, ': ', c.continent_code
	) AS continent_details,
	concat_ws(
		' - ',
		coun.country_name, 
		coun.capital, 
		coun.area_in_sq_km, 
		'km2'
	) AS country_information,
	concat(
		curr.description, ' (', curr.currency_code, ')'
	) AS currencies
FROM 
	continents AS c,
	countries AS coun,
	currencies AS curr
WHERE
	c.continent_code = coun.continent_code
		AND
	coun.currency_code = curr.currency_code
ORDER BY
	country_information,
	currencies;