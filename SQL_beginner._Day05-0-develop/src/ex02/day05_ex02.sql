CREATE INDEX idx_person_name ON person 
USING btree (upper(name));

set enable_seqscan = off;

explain analyze
(select person.name from person 
where upper(person.name) = 'KATE')