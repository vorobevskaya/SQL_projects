select order_date, concat (name, ' (age:', age, ')') as person_information 
from 
(select order_date, person_id 
from person_order) pv
left join person on person.id=pv.person_id
order by order_date, person_information asc