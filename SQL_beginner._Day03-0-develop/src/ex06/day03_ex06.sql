with cte as (select pizza_name,
pizzeria.name as pizzeria_name, price from menu
join pizzeria
on menu.pizzeria_id = pizzeria.id)

select A.pizza_name as pizza_name, A.pizzeria_name as pizzeria_name_1,  
B.pizzeria_name as pizzeria_name_2, A.price from cte A, cte B
where A.pizza_name = B.pizza_name and 
A.price = B.price
order by pizza_name;
