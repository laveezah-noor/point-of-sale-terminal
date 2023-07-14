CREATE FUNCTION `newEntry` (document_id int(10), document_date date, document_no varchar(100), 
description varchar(500), document_type smallint(5), inserted_at datetime, inserted_by varchar(255),
transaction_id int(10), ledger_id int(10), account_id bigint(19), entry_type enum('C','D'), `amount` decimal(20,2))
RETURNS INTEGER
BEGIN
START TRANSACTION;
INSERT INTO `documents` 
(`id`, `document_date`, `document_no`, `description`, `document_comments`, 
`internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) 
VALUES (document_id, document_date, document_no, description,
 '', '', document_type, inserted_at, inserted_by, '', '');

INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) 
VALUES (transaction_id, document_id, document_date, description);

INSERT INTO `ledger_entries` 
(`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) 
VALUES 
(ledger_id, transaction_id, account_id, entry_type, amount, NULL, NULL);

COMMIT;
RETURN 1;
ROLLBACK;
END
