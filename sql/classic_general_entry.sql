SELECT * FROM transactions;

SELECT t.transaction_date AS Date, t.description AS DescriptionOrAccountTitle, 
null as AmountDebit, null AS AmountCredit, t.id AS Reference, null AS IsLine
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
WHERE t.transaction_date BETWEEN '2018-01-01' AND '2018-06-30'
UNION
SELECT null AS Date, (CASE WHEN e.entry_type = 'D' THEN
a.account_name ELSE CONCAT('-  ', a.account_name) END) AS DescriptionOrAccountTitle,
(CASE WHEN e.entry_type = 'D' THEN e.amount ELSE null END) AS AmountDebit,
(CASE WHEN e.entry_type = 'C' THEN e.amount ELSE null END) AS AmountDebit,
t.id AS Reference, (CASE WHEN e.entry_type = 'D' THEN 1 ELSE 2 END) AS IsLine
FROM transactions t
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
WHERE t.transaction_date BETWEEN '2018-01-01' AND '2018-06-30'
ORDER BY Reference, IsLine;