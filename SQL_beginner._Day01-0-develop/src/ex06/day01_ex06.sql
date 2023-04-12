select action_date, name as person_name from (select order_date as action_date, person_id from person_order
intersect 
select visit_date as action_date, person_id from person_visits) pv
left join person on person.id=pv.person_id
order by action_date asc, person_name desc