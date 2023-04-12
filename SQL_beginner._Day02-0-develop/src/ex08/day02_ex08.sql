select name from person
inner join person_order
on person.id = person_order.person_id
inner join menu
on menu.id=person_order.menu_id
where gender='male' and 
(address= 'Moscow' or address = 'Samara') 
and (pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')
order by name desc
