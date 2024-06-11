CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
    game_name VARCHAR(50)
) RETURNS TABLE(
    total_cash NUMERIC
)
AS
$$
    BEGIN
        RETURN QUERY
        SELECT
            ROUND(SUM(cash), 2) AS total_cash
        FROM (
            SELECT
                cash,
                ROW_NUMBER() OVER (ORDER BY cash DESC) AS row_number
            FROM
                users_games AS ug
            JOIN
                games
            ON
               ug.game_id = games.id
            WHERE
                games.name = game_name
        ) AS fg
        WHERE
            fg.row_number % 2 <> 0;
    END;
$$
LANGUAGE plpgsql;

-- SELECT * FROM fn_cash_in_users_games('Delphinium Pacific Giant')