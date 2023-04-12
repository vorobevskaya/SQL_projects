--session 1
SHOW TRANSACTION ISOLATION LEVEL;

--session 2
SHOW TRANSACTION ISOLATION LEVEL;

--session 1
begin;

--session 2
begin;

--session 1
select rating from pizzeria where name = 'Pizza Hut';

--session 2
select rating from pizzeria where name = 'Pizza Hut';

--session 1
update pizzeria set rating = 4 where name = 'Pizza Hut';

--session 2
update pizzeria set rating = 4 where name = 'Pizza Hut';

--session 1
commit;

--session 2
commit;

--session 1
select rating from pizzeria where name = 'Pizza Hut';

--session 2
select rating from pizzeria where name = 'Pizza Hut';