select name, lastname, type, volume, currency_name, last_rate_to_usd
, volume*last_rate_to_usd as total_volume_in_usd
from(
SELECT coalesce(u.name, 'not defined') as name ,
        coalesce(u.lastname, 'not defined') as lastname,
        balance.type,
        sum(balance.money) as volume,
        coalesce(c.name,'not defined') as currency_name,
        coalesce(c.rate_to_usd, 1) as last_rate_to_usd
FROM "user" u
full join balance on u.id = balance.user_id
full join
    (select t1.name, t1.max, Currency.rate_to_usd, Currency.id from Currency
join
(select name, max(updated) from currency group by name) as t1 on t1.name = Currency.name and t1.max = Currency.updated) as c
    on c.id = balance.currency_id
group by u.id, balance.type, currency_name, last_rate_to_usd
) as t1
order by name desc, lastname, type;

