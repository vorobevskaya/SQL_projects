create view v_symmetric_union as (select person.id as person_id from person
join person_visits
on person.id = person_visits.person_id
where visit_date = '2022-01-02'
except
select person.id as person_id from person
join person_visits
on person.id = person_visits.person_id
where visit_date = '2022-01-06')
union
(select person.id as person_id from person
join person_visits
on person.id = person_visits.person_id
where visit_date = '2022-01-06'
except
select person.id as person_id from person
join person_visits
on person.id = person_visits.person_id
where visit_date = '2022-01-02')
order by person_id;