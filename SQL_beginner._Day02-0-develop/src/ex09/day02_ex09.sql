select name from 
(select name, count(name) as amount from 
(select person.id, name, pizza_name from person
inner join person_order 
on person.id = person_order.person_id
inner join menu
on menu.id=person_order.menu_id
where gender = 'female' and
(pizza_name = 'pepperoni pizza' 
 or pizza_name = 'cheese pizza')) as t1
 group by name) as t2 where t2.amount = 2
 order by name