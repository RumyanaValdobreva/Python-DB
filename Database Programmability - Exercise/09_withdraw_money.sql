CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INTEGER,
    money_amount NUMERIC(4)
)
AS
$$
    DECLARE
        current_balance NUMERIC;
    BEGIN
        current_balance := (
            SELECT
                balance
            FROM
                accounts
            WHERE
                id = account_id
        );
        IF money_amount <= current_balance THEN
            UPDATE accounts
            SET
                balance = balance - money_amount
            WHERE
                id = account_id;
        ELSE
            RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
        end if;
    END;
$$
LANGUAGE plpgsql;

CALL sp_withdraw_money(3, 5050.7500)