select person.name, pizza_name, pizzeria.name as pizzeria_name 
from person
right join person_order
on person.id = person_order.person_id
left join menu
on menu.id = person_order.menu_id 
left join pizzeria
on pizzeria.id = menu.pizzeria_id
order by name, pizza_name, pizzeria_name