--session 1
BEGIN;

--session 2
BEGIN;

--session 1
update pizzeria set rating = 0 where id =1;

--session 2
update pizzeria set rating = 0 where id =2;

--session 1
update pizzeria set rating = 0 where id =2;

--session 2
update pizzeria set rating = 0 where id =1;

--session 1
commit;

--session 2
commit;