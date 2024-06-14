UPDATE coaches
SET
    salary = salary * coach_level
WHERE
    first_name LIKE 'C%'
        AND
    id IN (
        SELECT
            coach_id
        FROM
            players_coaches
        WHERE
            player_id IS NOT NULL
                AND
            coach_id IS NOT NULL
        GROUP BY coach_id
);