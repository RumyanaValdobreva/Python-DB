CREATE OR REPLACE FUNCTION fn_calculate_future_value(
    initial_sum DECIMAL,
    yearly_interest_rate DECIMAL,
    number_of_years INTEGER
) RETURNS DECIMAL
AS
$$
    DECLARE
        final_sum DECIMAL;
    BEGIN
        final_sum = TRUNC(
            initial_sum * POWER(1 + yearly_interest_rate, number_of_years),
                4
        );

        RETURN final_sum;
    END;
$$
LANGUAGE plpgsql;