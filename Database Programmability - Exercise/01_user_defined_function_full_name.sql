CREATE OR REPLACE FUNCTION fn_full_name (
    first_name VARCHAR(20),
    last_name VARCHAR(20)
)
RETURNS VARCHAR(41)
AS
$$
    DECLARE
        full_name VARCHAR(41);
    BEGIN
        full_name := CONCAT(INITCAP(LOWER(first_name)), ' ', INITCAP(LOWER(last_name)));
        RETURN full_name;
    END;
$$
LANGUAGE plpgsql;