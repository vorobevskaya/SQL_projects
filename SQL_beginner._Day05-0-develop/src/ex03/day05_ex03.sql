CREATE INDEX idx_person_order_multi 
on person_order
USING btree (person_id, menu_id) 
INCLUDE (order_date);

set enable_seqscan =off;

explain analyze(select person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19)
