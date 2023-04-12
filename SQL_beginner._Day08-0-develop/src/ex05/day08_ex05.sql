--session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--session 1
select sum(rating) from pizzeria;

--session 2
update pizzeria set rating = 1 where name = 'Pizza Hut';

--session 2
commit;

--session 1
select sum(rating) from pizzeria;

--session 1
commit;

--session 1
select sum(rating) from pizzeria;

--session 2
select sum(rating) from pizzeria;