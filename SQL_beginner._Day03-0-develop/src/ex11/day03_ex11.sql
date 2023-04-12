update menu
set price = 
(cast((select price from menu 
where pizza_name = 'greek pizza') *0.9 as int))
where pizza_name = 'greek pizza';
