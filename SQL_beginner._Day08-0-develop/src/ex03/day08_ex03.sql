--session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--session 1
select rating from pizzeria where name = 'Pizza Hut';

--session 2
update pizzeria set rating = 4 where name = 'Pizza Hut';

--session 2
commit;

--session 1
select rating from pizzeria where name = 'Pizza Hut';

--session 2
commit;

--session 1
select rating from pizzeria where name = 'Pizza Hut';

--session 2
select rating from pizzeria where name = 'Pizza Hut';