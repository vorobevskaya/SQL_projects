create view address_age as (select address, age from person); 
select address, 
round((max(age) - (min(age)/max(age))), 2) as formula,
round(avg(age),2) as average,
case when (round((max(age) - (min(age)/max(age))), 2)) > round(avg(age),2)
then true 
else false end as comparison
from address_age 
group by address
order by 1