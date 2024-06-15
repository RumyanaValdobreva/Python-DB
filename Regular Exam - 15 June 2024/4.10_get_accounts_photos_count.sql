CREATE OR REPLACE FUNCTION udf_accounts_photos_count (
    account_username VARCHAR(30)
) RETURNS INTEGER
AS
$$
    DECLARE
        result INTEGER;
    BEGIN
        SELECT
            COUNT(ap.photo_id)
        INTO
            result
        FROM
            accounts AS a
        JOIN
            accounts_photos AS ap
        ON
            a.id = ap.account_id
        WHERE
            a.username = account_username;
        RETURN result;
    END;
$$
LANGUAGE plpgsql;