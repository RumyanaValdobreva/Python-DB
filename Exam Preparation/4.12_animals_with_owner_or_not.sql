CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not (
    IN animal_name VARCHAR(30),
    OUT owner_result VARCHAR(30)
)
AS
$$
    BEGIN
        SELECT
            o.name
        INTO
            owner_result
        FROM
            owners AS o
        JOIN
            animals AS a
        ON
            o.id = a.owner_id
        WHERE
            a.name = animal_name;

        IF owner_result IS NULL THEN owner_result := 'For adoption';
        END IF;
    END;
$$
LANGUAGE plpgsql;