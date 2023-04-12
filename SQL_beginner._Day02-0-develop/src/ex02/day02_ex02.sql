select coalesce(person.name, '-') as person_name, 
visit_date, coalesce(pizzeria.name, '-') as pizzeria_name from person
full outer join 
(select pizzeria_id, person_id, visit_date from person_visits
 where visit_date != '2022-01-01' is not true
or visit_date != '2022-01-02' is not true
or visit_date != '2022-01-03' is not true) as t1
on person.id=t1.person_id
full outer join pizzeria
on pizzeria.id=t1.pizzeria_id
order by person_name, visit_date, pizzeria_name
