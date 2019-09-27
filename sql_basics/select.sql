SELECT p.first_name, p.last_name, COUNT(o.id), SUM(oi.quantity), SUM(oi.quantity*i.price-oi.discount)
FROM `person` p LEFT JOIN `order` o ON p.id = o.person_id LEFT JOIN `order_item` oi ON o.id = oi.order_id
LEFT JOIN `item` i ON oi.item_id = i.id GROUP BY p.id