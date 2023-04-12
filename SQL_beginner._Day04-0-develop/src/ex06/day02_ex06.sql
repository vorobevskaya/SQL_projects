create materialized view 
mv_dmitriy_visits_and_eats
as select pizzeria.name as pizzeria_name from person
 join person_visits
on person.id=person_visits.person_id
 join pizzeria 
on pizzeria.id=person_visits.pizzeria_id
 join menu
on menu.pizzeria_id=pizzeria.id
where person.name = 'Dmitriy' 
and visit_date = '2022-01-08'
and price < 800;