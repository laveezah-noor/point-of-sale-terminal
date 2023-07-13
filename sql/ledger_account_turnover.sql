select * from transactions;
select * from ledger_entries;

SELECT t.transaction_date, t.description, 
(CASE WHEN e.entry_type='D' THEN e.amount ELSE 0 END) AS DebitAmount,
(CASE WHEN e.entry_type='C' THEN e.amount ELSE 0 END) AS CreditAmount
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
WHERE t.transaction_date >= '1978-10-19' AND t.transaction_date <='2018-06-30'
AND e.account_id = 0
ORDER BY t.transaction_date;