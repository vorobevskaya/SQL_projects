CREATE UNIQUE INDEX idx_menu_unique 
on menu
USING btree (pizzeria_id, pizza_name) ;

set enable_seqscan =off;

explain analyze(select pizzeria_id, pizza_name
FROM menu)
