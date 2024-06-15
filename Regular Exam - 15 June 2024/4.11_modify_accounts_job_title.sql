CREATE OR REPLACE PROCEDURE udp_modify_account (
    IN address_street VARCHAR(30),
    IN address_town VARCHAR(30)
)
AS
$$
    BEGIN
        UPDATE accounts
        SET
            job_title = CONCAT('(Remote)', ' ', job_title)
        WHERE
             id IN (
                SELECT
                    acc.id
                FROM
                    addresses AS a
                JOIN
                    accounts as acc
                ON
                    a.account_id = acc.id
                WHERE
                    a.street = address_street
                        AND
                    a.town = address_town
        );
    END;
$$
LANGUAGE plpgsql;