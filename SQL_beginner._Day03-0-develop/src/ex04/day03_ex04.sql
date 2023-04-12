(select pizzeria.name as pizzeria_name
from person
join person_visits
on person_visits.person_id=person.id
join pizzeria
on person_visits.pizzeria_id=pizzeria.id
join person_order
on person_order.person_id=person_visits.person_id
where gender = 'female'

except

select pizzeria.name as pizzeria_name
from person
full outer join person_visits
on person_visits.person_id=person.id
full outer join pizzeria
on person_visits.pizzeria_id=pizzeria.id
full outer join person_order
on person_order.person_id=person_visits.person_id
where gender = 'male')

union

(select pizzeria.name as pizzeria_name
from person
full outer join person_visits
on person_visits.person_id=person.id
full outer join pizzeria
on person_visits.pizzeria_id=pizzeria.id
full outer join person_order
on person_order.person_id=person_visits.person_id
where gender = 'male'

except

select pizzeria.name as pizzeria_name
from person
full outer join person_visits
on person_visits.person_id=person.id
full outer join pizzeria
on person_visits.pizzeria_id=pizzeria.id
full outer join person_order
on person_order.person_id=person_visits.person_id
where gender = 'female');
