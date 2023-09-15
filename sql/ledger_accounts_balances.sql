SELECT SQL_NO_CACHE e.account_id, a.account_name,
SUM(CASE WHEN e.entry_type='D' THEN e.amount ELSE -e.amount END) AS Balance
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
-- WHERE t.transaction_date <='2018-06-30' 
WHERE a.account_name = "Inventory"
GROUP BY e.account_id
ORDER BY CAST(e.account_id AS CHAR);

SELECT SQL_NO_CACHE e.account_id, a.account_name, 
SUM(CASE WHEN e.entry_type='D' THEN e.amount ELSE -e.amount END) AS Balance
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
-- WHERE t.transaction_date <='2018-06-30' 
WHERE a.account_name = "Inventory"
GROUP BY e.account_id
ORDER BY CAST(e.account_id AS CHAR);