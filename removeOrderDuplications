SELECT `id_order`,`total_paid_tax_incl`,`total_paid_real` FROM `ps47f_orders` 
WHERE `total_paid_real` <> `total_paid_tax_incl`

Arreglo:

UPDATE `ps47f_orders`
SET `total_paid_real` = `total_paid_tax_incl` 
WHERE `total_paid_real` <> `total_paid_tax_incl`
