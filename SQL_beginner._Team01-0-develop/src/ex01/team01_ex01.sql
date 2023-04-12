-- INSERT INTO currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- INSERT INTO currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH full_balance AS(
WITH balance_new AS
	(SELECT user_id,
		    coalesce("user".name, 'not defined') AS name,
	        coalesce("user".lastname, 'not defined') AS lastname,
	        type,
	        sum_balance.sum AS volume,
	        sum_balance.currency_id,
	        sum_balance.updated
	   FROM (SELECT user_id, sum(money) AS sum, type, currency_id, updated
		       FROM balance
		      GROUP BY  user_id, type, currency_id, updated
		      ORDER BY  1) AS sum_balance
	    FULL JOIN "user" ON id = sum_balance.user_id),

    data_diff_table AS
		(SELECT balance_new.user_id, balance_new.name AS user_name, balance_new.lastname,
		 type, volume, currency_id, balance_new.updated AS balance_updated,
		 currency.name AS currency_name, rate_to_usd, currency.updated AS currency_updated,
		    CASE
			    WHEN balance_new.updated <= currency.updated THEN (currency.updated - balance_new.updated)
			    ELSE (balance_new.updated - currency.updated)
		    END AS date_diff
		  FROM balance_new FULL
			JOIN currency ON currency_id = currency.id
			ORDER BY user_id)

    SELECT data_diff_table.user_id, data_diff_table.user_name, data_diff_table.lastname, data_diff_table.type,
		 data_diff_table.volume, data_diff_table.currency_id, data_diff_table.balance_updated,
		 data_diff_table.currency_updated,
		 MIN(date_diff)
				OVER (PARTITION BY data_diff_table.user_id, data_diff_table.type, data_diff_table.balance_updated) AS min
	 FROM data_diff_table),

    dist_balance AS (SELECT user_id, user_name, lastname, type, volume, currency_id,balance_updated, min
			FROM full_balance
			GROUP BY  user_id, user_name, lastname, type, volume, currency_id, balance_updated, min)

SELECT   user_name AS name, lastname, name AS currency_name,
		 volume * currency.rate_to_usd AS currency_in_usd
  FROM dist_balance
      JOIN currency ON dist_balance.currency_id = currency.id
		AND (dist_balance.balance_updated+min) = currency.updated
		OR (dist_balance.balance_updated-min) = currency.updated

  ORDER BY name DESC, lastname, currency_name;

