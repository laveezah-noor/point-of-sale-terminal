SELECT SQL_NO_CACHE t.transaction_date, t.description,
SUM(CASE WHEN e.entry_type='D' THEN e.amount ELSE 0.0 END) AS Amount,
GROUP_CONCAT(DISTINCT CONCAT(e.entry_type, e.account_id)
SEPARATOR ', ') AS Entries
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
WHERE t.transaction_date >= '1918-01-01' AND t.transaction_date <='2018-06-30'
GROUP BY t.id ORDER BY t.transaction_date;