SELECT person.first_name, person.last_name, count(distinct `order`.`id`) as total_orders, sum(order_item.quantity) as total_items_bought, sum(item.price*order_item.quantity)-sum(order_item.discount) as total_money_spent
FROM person LEFT JOIN `order` 
    ON person.id=`order`.`person_id`
LEFT JOIN order_item
    ON `order`.`id`=order_item.order_id
LEFT JOIN item
    ON order_item.item_id=item.id
GROUP BY person.first_name, person.last_name
ORDER BY person.last_name DESC
