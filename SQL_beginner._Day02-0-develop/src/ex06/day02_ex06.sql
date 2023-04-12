SELECT pizza_name, 
pizzeria.name as pizzeria_name from person 
inner join person_order
on person_order.person_id = person.id
inner join menu 
on person_order.menu_id=menu.id
inner join pizzeria
on menu.pizzeria_id=pizzeria.id
where person.name = 'Denis' or person.name = 'Anna'
order by pizza_name, pizzeria_name
