select name as person_name1, person_name2, address as common_address from
(select person.name, person_name2, t1.address
from person inner join
(select name as person_name2, address from person) as t1
on t1.address=person.address
where t1.person_name2 != person.name) as t2
order by person_name1, person_name2, common_address

