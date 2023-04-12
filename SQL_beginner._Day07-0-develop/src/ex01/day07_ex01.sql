select person.name, count_of_visits 
from (select person_id, count(person_id) as count_of_visits
from person_visits
group by person_id
order by count_of_visits desc, person_id asc) as buf
inner join person
on person.id=buf.person_id
order by count_of_visits desc limit 4