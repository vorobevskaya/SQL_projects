select name from pizzeria where id not in 
(select pizzeria_id from person_visits)

select name from pizzeria p
where not exists  
(select pizzeria_id from person_visits pv 
 where p.id = pv.pizzeria_id)