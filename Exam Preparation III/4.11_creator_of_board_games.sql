CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
    first_name_creator VARCHAR(30)
) RETURNS INTEGER
AS
$$
    DECLARE
        result INTEGER;
    BEGIN
        SELECT
            COUNT(*)
        INTO result
        FROM
            creators_board_games
        WHERE
            creator_id = (
                SELECT
                    id
                FROM
                    creators
                WHERE
                    first_name = first_name_creator
        );
        RETURN result;
    END;
$$
LANGUAGE plpgsql;