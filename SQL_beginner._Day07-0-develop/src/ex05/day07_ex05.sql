select distinct person.name as name
from person
join person_order
on person.id=person_order.person_id
join menu
on person_order.menu_id=menu.id
order by name
