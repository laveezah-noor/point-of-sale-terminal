SELECT
    node.id,
    node.line_type,
    (COUNT(parent.id) - 1) AS depth,
    node.visible_index,
    node.printed_no,
    node.line_text,
    node.line_type,
    node.left_index,
    node.right_index,
    (
        SELECT
            COUNT(*)
        FROM
            accounts a
        WHERE
            a.balance_and_income_line_id = node.id
    ) AS AccountsCount
FROM
    balance_and_income_lines AS parent
    LEFT JOIN balance_and_income_lines AS node ON node.left_index;

SELECT
    line.printed_no as RowNo,
    line.line_text AS RowText,
    (
        SELECT
            GROUP_CONCAT(CAST(a.account_name AS CHAR) SEPARATOR ', ')
        FROM
            accounts a
        WHERE
            a.balance_and_income_line_id = line.ID
    ) AS RelatedAccounts,
    SUM(
        CASE
            WHEN line.line_type <> 'balance_line'
            AND line.line_type <> 'income_line' THEN null
            ELSE (
                CASE
                    WHEN line.line_type = 'balance_line' 
                    THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod - val.CreditFirstPeriod
                    ELSE (
                        val.DebitFirstPeriod - val.ClosingDebitFirstPeriod
                    ) - (
                        val.CreditFirstPeriod - val.ClosingCreditFirstPeriod
                    )
                END
            )
        END
    ) * (
        CASE
            WHEN line.value_type = 'D' THEN 1
            ELSE -1
        END
    ) AS ValueFirstPeriod,
    SUM(
        CASE
            WHEN line.line_type <> 'balance_line'
            AND line.line_type <> 'income_line' THEN null
            ELSE (
                CASE
                    WHEN line.line_type = 'balance_line' THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod - val.CreditFirstPeriod + val.DebitSecondPeriod - val.CreditSecondPeriod
                    ELSE (
                        val.DebitSecondPeriod - val.ClosingDebitSecondPeriod
                    ) - (
                        val.CreditSecondPeriod - val.ClosingCreditSecondPeriod
                    )
                END
            )
        END
    ) * (
        CASE
            WHEN line.value_type = 'D' THEN 1
            ELSE -1
        END
    ) AS ValueSecondPeriod
FROM
    balance_and_income_lines AS line
    LEFT JOIN balance_and_income_lines AS child_line ON child_line.left_index BETWEEN line.left_index
    AND line.right_index
    LEFT JOIN (
        SELECT
            a.balance_and_income_line_id AS LineId,
            l.line_type AS LineType,
            SUM(
                CASE
                    WHEN t.transaction_date < '2017-01-01'
                    AND e.entry_type = 'D' THEN e.amount
                    ELSE 0.0
                END
            ) AS TotalDebitBefore,
            SUM(
                CASE
                    WHEN t.transaction_date < '2017-01-01'
                    AND e.entry_type = 'C' THEN e.amount
                    ELSE 0.0
                END
            ) AS TotalCreditBefore,
            SUM(
                CASE
                    WHEN t.transaction_date >= '2017-01-01'
                    AND t.transaction_date < '2018-01-01'
                    AND e.entry_type = 'D' THEN e.amount
                    ELSE 0.0
                END
            ) AS DebitFirstPeriod,
            SUM(
                CASE
                    WHEN t.transaction_date >= '2017-01-01'
                    AND t.transaction_date < '2018-01-01'
                    AND e.entry_type = 'C' THEN e.amount
                    ELSE 0.0
                END
            ) AS CreditFirstPeriod,
            SUM(
                CASE
                    WHEN d.document_type = 13
                    AND t.transaction_date >= '2017-01-01'
                    AND t.transaction_date < '2018-01-01'
                    AND e.entry_type = 'D' THEN e.amount
                    ELSE 0.0
                END
            ) AS ClosingDebitFirstPeriod,
            SUM(
                CASE
                    WHEN d.document_type = 13
                    AND t.transaction_date >= '2017-01-01'
                    AND t.transaction_date < '2018-01-01'
                    AND e.entry_type = 'C' THEN e.amount
                    ELSE 0.0
                END
            ) AS ClosingCreditFirstPeriod,
            SUM(
                CASE
                    WHEN t.transaction_date >= '2018-01-01'
                    AND e.entry_type = 'D' THEN e.amount
                    ELSE 0.0
                END
            ) AS DebitSecondPeriod,
            SUM(
                CASE
                    WHEN t.transaction_date >= '2018-01-01'
                    AND e.entry_type = 'C' THEN e.amount
                    ELSE 0.0
                END
            ) AS CreditSecondPeriod,
            SUM(
                CASE
                    WHEN d.document_type = 13
                    AND t.transaction_date >= '2018-01-01'
                    AND e.entry_type = 'D' THEN e.amount
                    ELSE 0.0
                END
            ) AS ClosingDebitSecondPeriod,
            SUM(
                CASE
                    WHEN d.document_type = 13
                    AND t.transaction_date >= '2018-01-01'
                    AND e.entry_type = 'C' THEN e.amount
                    ELSE 0.0
                END
            ) AS ClosingCreditSecondPeriod
        FROM
            documents d
            LEFT JOIN transactions t ON t.document_id = d.id
            LEFT JOIN ledger_entries e ON e.transaction_id = t.id
            LEFT JOIN accounts a ON a.id = e.account_id
            LEFT JOIN balance_and_income_lines l ON l.id = a.balance_and_income_line_id
        WHERE
            t.transaction_date <= '2018-12-31'
        GROUP BY
            a.balance_and_income_line_id
    ) AS val ON val.LineId = child_line.id
    OR (
        child_line.id = 14
        AND val.LineType = 'income_line'
    )
GROUP BY
    line.id
ORDER BY
    line.visible_index