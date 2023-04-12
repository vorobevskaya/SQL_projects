insert into person_discounts
with buf as (select person_id, pizzeria_id, count(person_id) as amount_of_orders
	 from person_order 
	  join menu 
	  on person_order.menu_id=menu.id
	  group by person_id, pizzeria_id
	 order by person_id, pizzeria_id)
select row_number() over (order by 1) as id,
person_id, pizzeria_id, (select 
case when amount_of_orders = 1 then 10.5
when amount_of_orders = 2 then 22
else 30 end as discount)
from buf;

select * from person_discounts
--delete from person_discounts