SELECT c.email AS email, c.`firstname` AS name, c.`lastname` AS surname, c.`email` AS email, 
(SELECT COUNT(*) 
FROM ps47f_orders o 
WHERE o.valid =1 
AND (o.id_customer = c.id_customer)
) AS number_orders, o.date_add AS LAST_ORDER_DATE

FROM `ps47f_customer` c 
LEFT JOIN `ps47f_blockreviews` r ON r.email = c.email
LEFT JOIN `ps47f_orders` o ON o.id_customer = c.id_customer
WHERE `newsletter`= 1 
AND c.id_lang = 4
AND r.email IS NULL
AND o.date_add BETWEEN DATE_SUB(NOW(), INTERVAL 15 DAY) AND NOW()
HAVING number_orders > 2
