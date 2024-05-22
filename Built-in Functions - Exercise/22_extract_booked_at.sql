SELECT
	EXTRACT(YEAR FROM booked_at) AS "YEAR",
	EXTRACT(MONTH FROM booked_at) AS "MONTH",
	EXTRACT(DAY FROM booked_at) AS "DAY",
	EXTRACT(HOUR FROM booked_at AT TIME ZONE 'UTC') AS "HOUR",
	EXTRACT(MINUTE FROM booked_at) AS "MINUTE",
	CEILING(EXTRACT(SECOND FROM booked_at)) AS "SECOND"
FROM bookings;