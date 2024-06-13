SELECT
    a.name AS address,
    CASE
        WHEN EXTRACT(HOUR FROM c.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    c.bill,
    cl.full_name,
    cs.make,
    cs.model,
    cat.name
FROM
    courses AS c
JOIN
    clients AS cl
ON
    c.client_id = cl.id
JOIN
    cars AS cs
ON
    c.car_id = cs.id
JOIN
    categories AS cat
ON
    cs.category_id = cat.id
JOIN
    addresses AS a
ON
    c.from_address_id = a.id
ORDER BY
    c.id;