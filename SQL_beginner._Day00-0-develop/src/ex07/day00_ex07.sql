select id, name, case when (age >= 10 and age <=20) then '10-20' 
when (age > 20 and age < 24) then '21-24' else '25+' end as interval_info
from person
order by interval_info asc
