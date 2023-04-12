with buf as (select pizzeria.name as name, 
			 menu.price as price from pizzeria 
			join menu
			on pizzeria.id=menu.pizzeria_id)

select name, count(name), round(avg(price),2) as average_price,
max(price) as max_price,
min(price) as min_price from buf
group by name
order by 1
