with buf as 
(select person_visits.id, visit_date from person
left join person_visits on person.id = person_visits.person_id
		  where person.id = 1 or person.id = 2)

SELECT day::date AS missing_date
FROM   generate_series(timestamp '2022-01-01', '2022-01-10', '1 day') day
left join buf
on day.day = buf.visit_date
where buf.id is null
order by missing_date asc
