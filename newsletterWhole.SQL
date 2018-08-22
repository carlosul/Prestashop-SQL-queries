SELECT
`firstname` AS name, `lastname` AS surname, lang.iso_code AS ps_lang, `email` AS email, a.birthday AS birthday,
(SELECT COUNT(*) 
FROM ps47f_orders o 
WHERE o.valid =1 
AND (o.id_customer = a.id_customer)
) AS number_orders,
a.date_add AS sign_in_date, 
(SELECT SUM(total_paid_real / conversion_rate)
FROM ps47f_orders o
WHERE o.id_customer = a.id_customer
AND o.id_shop IN (2, 1) 
AND o.valid = 1
) AS ps_order_total,
(SELECT MAX(date_add)
FROM ps47f_orders o 
WHERE o.valid =1 
AND (o.id_customer = a.id_customer)
) AS last_order_date


FROM `ps47f_customer` a 
LEFT JOIN ps47f_lang lang ON lang.id_lang = a.id_lang
LEFT JOIN ps47f_gender_lang gl ON (a.id_gender = gl.id_gender AND gl.id_lang = 1) 
LEFT JOIN ps47f_shop shop ON a.id_shop = shop.id_shop WHERE 1  AND a.`deleted` = 0  AND a.`active` = 1  AND `newsletter` = 1  AND a.id_shop IN (2, 1)


UNION
			
SELECT Null AS column1, Null AS column2, Null AS column3, email AS column4, Null AS column5, Null AS n_of_orders, newsletter_date_add AS date_add, Null AS ps_order_total, Null AS last_order FROM  `ps47f_newsletter`

ORDER BY `ps_order_total` desc
