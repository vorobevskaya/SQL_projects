CREATE UNIQUE INDEX idx_person_order_order_date
on person_order
USING btree (person_id, menu_id) 
where order_date <> '2022-01-01';

set enable_seqscan =off;

explain analyze(
	select person_id, menu_id
FROM person_order 
	where order_date <>'2022-01-01'
)
