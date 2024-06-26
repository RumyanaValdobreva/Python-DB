SELECT
    CASE
        WHEN LENGTH(description) > 10 THEN CONCAT(SUBSTRING(description FROM 1 FOR 10), '...')
        WHEN description IS NULL THEN '...'
        ELSE
            CONCAT(description, '...')
    END AS summary,
    TO_CHAR(capture_date, 'DD.MM HH24:MI') AS date
FROM
    photos
WHERE
    EXTRACT(DAY FROM capture_date) = 10
ORDER BY
    capture_date DESC;