SELECT pizzeria.name as pizzeria_name 
from person
 full outer join person_visits
on person.id=person_visits.person_id
 full outer join pizzeria
on person_visits.pizzeria_id = pizzeria.id
where person.name = 'Andrey'
except
SELECT pizzeria.name as pizzeria_name 
from person
 full outer join person_order
on person.id=person_order.person_id
 full outer join menu
on person_order.menu_id = menu.id
full outer join pizzeria
on menu.pizzeria_id = pizzeria.id
where person.name = 'Andrey'
order by pizzeria_name;
