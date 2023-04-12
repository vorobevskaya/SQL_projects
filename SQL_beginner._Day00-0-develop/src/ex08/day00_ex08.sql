select * from person_order 
where id % 2=0 
order by id, person_id, menu_id asc
