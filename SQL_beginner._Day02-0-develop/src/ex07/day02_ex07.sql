select pizzeria.name from person
inner join person_visits
on person.id=person_visits.person_id
inner join pizzeria
on person_visits.pizzeria_id=pizzeria.id
inner join menu
on pizzeria.id=menu.pizzeria_id
where person.name = 'Dmitriy' 
and person_visits.visit_date = '2022-01-08' 
and price < 800
