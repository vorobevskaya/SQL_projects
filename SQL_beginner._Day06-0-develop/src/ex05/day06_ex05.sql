comment on table person_discounts is 
'This table consists of people, pizzerias and discounts';

comment on column person_discounts.id is 
'unique_id';

comment on column person_discounts.person_id is 
'unique_person_id';

comment on column person_discounts.pizzeria_id is 
'unique_pizzeria_id';

comment on column person_discounts.discount is 
'discount a person has in this pizzeria';