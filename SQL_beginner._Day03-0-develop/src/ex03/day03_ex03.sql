(select pizzeria.name as pizzeria_name
from person
join person_visits
on person_visits.person_id=person.id
join pizzeria
on person_visits.pizzeria_id=pizzeria.id
where gender = 'female'

except all

select pizzeria.name as pizzeria_name
from person
join person_visits
on person_visits.person_id=person.id
join pizzeria
on person_visits.pizzeria_id=pizzeria.id
where gender = 'male')

union all

(select pizzeria.name as pizzeria_name
from person
join person_visits
on person_visits.person_id=person.id
join pizzeria
on person_visits.pizzeria_id=pizzeria.id
where gender = 'male'

except all

select pizzeria.name as pizzeria_name
from person
join person_visits
on person_visits.person_id=person.id
join pizzeria
on person_visits.pizzeria_id=pizzeria.id
where gender = 'female')

order by pizzeria_name;
