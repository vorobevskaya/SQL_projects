select person.name as name, pizza_name, price, 
cast(price * (1 - discount*0.01) as int) as discount,
pizzeria.name from person 
join person_order 
on person.id = person_order.person_id
join menu
on person_order.menu_id = menu.id
join pizzeria 
on menu.pizzeria_id=pizzeria.id
join person_discounts
on person_discounts.person_id=person.id 
and
person_discounts.pizzeria_id=menu.pizzeria_id
order by person.name, pizza_name