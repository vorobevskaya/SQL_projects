create sequence seq_person_discounts start 1;

alter table person_discounts
alter column id set default nextval ('seq_person_discounts');


--INSERT INTO person_discounts(person_id, pizzeria_id, discount) VALUES (1,2,12);
--select * from person_discounts