UPDATE products
SET
    price = price + price * 0.10
WHERE id IN (
    SELECT 
        product_id
    FROM
        feedbacks
    WHERE
        rate > 8
);