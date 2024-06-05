CREATE VIEW continent_currency_usage
AS
SELECT
	u.continent_code,
	u.currency_code,
	u.currency_usage
FROM (
	SELECT
		c.continent_code,
		c.currency_code,
		c.currency_usage,
		DENSE_RANK() OVER (PARTITION BY c.continent_code ORDER BY c.currency_usage DESC) AS rank_usage
	FROM (
		SELECT
			continent_code,
			currency_code,
			COUNT(currency_code) AS currency_usage
		FROM
			countries
		GROUP BY
			continent_code,
			currency_code
		HAVING
			COUNT(*) > 1
		ORDER BY
			continent_code
	) AS c -- currency continent
) AS u -- ranked usage
WHERE
	u.rank_usage = 1
ORDER BY
	u.currency_usage DESC,
	u.continent_code ASC,
	u.currency_code ASC;