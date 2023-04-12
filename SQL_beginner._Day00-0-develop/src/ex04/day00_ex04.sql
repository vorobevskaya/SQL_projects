select name from person where id in
(select person_id from person_order 
where order_date = '2022-01-07'
and id = 13 or id =14 or id =18)
