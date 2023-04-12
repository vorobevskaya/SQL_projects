select distinct id from person_visits
where visit_date >= '2022-01-06' 
and visit_date <= '2022-01-09'
union
select distinct id from person_visits 
where id =2
order by id desc
