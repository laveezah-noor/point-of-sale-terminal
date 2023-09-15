SELECT
    SQL_NO_CACHE e.account_id,
    a.account_name,
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
    ) AS CreditSecondPeriod
FROM
    transactions t
    LEFT JOIN ledger_entries e ON e.transaction_id = t.id
    LEFT JOIN accounts a ON a.id = e.account_id
WHERE
    t.transaction_date <= '2018-12-31'
GROUP BY
    e.account_id
ORDER BY
    CAST(e.account_id AS CHAR);

SELECT
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R
WHERE
    (
        LOWER(B) IS NOT ""
        AND LOWER(B) LIKE LOWER("" % "&B1&" % "")
    )
    OR (
        LOWER(D) IS NOT NULL
        AND LOWER(D) LIKE LOWER("" % "&D1&" % "")
    )
    OR (
        LOWER(L) IS NOT NULL
        AND LOWER(L) LIKE LOWER("" % "&L1&" % "")
    )
    OR (
        LOWER(M) IS NOT NULL
        AND LOWER(M) LIKE LOWER("" % "&M1&" % ""))
    OR (
        A LIKE "" % "&A1&" % ""
        OR B LIKE "" % "&B1&" % ""
        OR D LIKE "" % "&D1&" % ""
        OR F LIKE "" % "&F1&" % ""
        OR G LIKE "" % "&G1&" % ""
        OR H LIKE "" % "&H1&" % ""
        OR J LIKE "" % "&J1&" % ""
    )
    OR (
        LOWER(I) IS NOT NULL
        AND LOWER(I) LIKE LOWER("" % "&I1&" % ""))

        -- OR LOWER(D) LIKE LOWER(""%"&D1&"%"") OR LOWER(L) LIKE LOWER(""%"&L1&"%"") OR LOWER(M) LIKE LOWER(""%"&M1&"%"") OR (A LIKE ""%"&A1&"%"" OR B LIKE ""%"&B1&"%"" OR D LIKE ""%"&D1&"%"" OR F LIKE ""%"&F1&"%"" OR G LIKE ""%"&G1&"%"" OR H LIKE ""%"&H1&"%"" OR J LIKE ""%"&J1&"%"") OR LOWER(I) LIKE LOWER(""%"&I1&"%"")

        
SELECT
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R
WHERE
    (
        LOWER(B) LIKE LOWER("" % "&B1&" % "")
    )
    OR (
        LOWER(D) LIKE LOWER("" % "&D1&" % "")
    )
    OR (
        LOWER(L) LIKE LOWER("" % "&L1&" % "")
    )
    OR (
        LOWER(M) LIKE LOWER("" % "&M1&" % ""))
    OR (
        A LIKE "" % "&A1&" % ""
        OR B LIKE "" % "&B1&" % ""
        OR D LIKE "" % "&D1&" % ""
        OR F LIKE "" % "&F1&" % ""
        OR G LIKE "" % "&G1&" % ""
        OR H LIKE "" % "&H1&" % ""
        OR J LIKE "" % "&J1&" % ""
    )
    OR (
        LOWER(I) LIKE LOWER("" % "&I1&" % ""))