CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
) RETURNS INTEGER
AS
$$
    BEGIN
        RETURN (
            SELECT
                COUNT(*)
            FROM
                clients AS cl
            JOIN
                courses AS cs
            ON
                cl.id = cs.client_id
            WHERE
                cl.phone_number = phone_num
        );
    END;
$$
LANGUAGE plpgsql;