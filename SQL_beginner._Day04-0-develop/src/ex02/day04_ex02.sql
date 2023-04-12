create view v_generated_dates as
select generated_date::date from
generate_series(
'2022-01-01'::date, 
	'2022-01-31'::date, '1 day':: interval) 
	generated_date
order by generated_date;