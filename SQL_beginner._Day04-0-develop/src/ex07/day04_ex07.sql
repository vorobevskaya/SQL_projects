insert into person_visits 
values
((select max(id) from person_visits) +1, 
(select id from person where name = 'Dmitriy'),
(select pizzeria_id from menu where pizza_name = 'cheese pizza' 
 and price < 750 and pizzeria_id not in 
 (select id from pizzeria where name = 'Papa Johns')),
'2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;