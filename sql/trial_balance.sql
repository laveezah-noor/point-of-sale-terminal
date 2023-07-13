SELECT SQL_NO_CACHE e.account_id, a.account_name,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='D'
         THEN e.amount ELSE 0.0 END) AS TotalDebitBefore,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='C'
         THEN e.amount ELSE 0.0 END) AS TotalCreditBefore,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND
    t.transaction_date < '2018-01-01' AND e.entry_type='D' 
    THEN e.amount ELSE 0.0 END) AS DebitFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01' 
         AND e.entry_type='C' THEN e.amount ELSE 0.0 END) AS CreditFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='D' 
         THEN e.amount ELSE 0.0 END) AS DebitSecondPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='C' 
         THEN e.amount ELSE 0.0 END) AS CreditSecondPeriod
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
WHERE t.transaction_date <='2018-12-31' GROUP BY e.account_id 
       ORDER BY CAST(e.account_id AS CHAR);