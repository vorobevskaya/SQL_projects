create view v_price_with_discount as 
(with cte as (select person.name, pizza_name, price 
from person
join person_order
on person.id=person_order.person_id
join menu
on person_order.menu_id=menu.id)
select name, pizza_name, price,
(select cast(price - price*0.1 as int)) as discount_price
from cte
order by name, pizza_name);