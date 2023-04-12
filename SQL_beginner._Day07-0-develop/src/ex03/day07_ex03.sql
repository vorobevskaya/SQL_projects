select name, sum(count) as total_count from (select pizzeria.name as name, count(pizzeria_id) as count, 'visit' as action_type from pizzeria
join person_visits
on pizzeria.id=person_visits.pizzeria_id
group by pizzeria.name
union 
select pizzeria.name as name, count(pizzeria_id) as count, 'order' as action_type
from person_order
left join menu
on menu.id=person_order.menu_id
left join pizzeria
on menu.pizzeria_id=pizzeria.id
group by pizzeria.name) as buf
group by name
order by total_count desc, name asc