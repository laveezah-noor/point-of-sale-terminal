
INSERT INTO `documents` 
(`id`, `document_date`, `document_no`, `description`, `document_comments`, 
`internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) 
VALUES (1000100, '2005-05-17', '', 
'Voluptates non placeat nihil. Nulla et mollitia numquam eligendi aperiam saepe. Soluta aut dolorem neque dolore delectus. Aut quibusdam dolor saepe cupiditate corrupti.',
 '', '', 0, '1999-02-19 19:13:14', '', '2002-01-25 15:53:20', '');

INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) 
VALUES (1000100, 1000100, '1983-05-03', 'Vero quis quasi dolore vero magni quo quaerat. Quae dicta quia molestiae voluptatem amet officiis omnis. Qui excepturi sit veniam pariatur repellendus.');

INSERT INTO `ledger_entries` 
(`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) 
VALUES 
(2500101, 1000100, '0', 'D', '3514400.00', NULL, NULL),
(2500100, 1000100, '0', 'D', '3514400.00', NULL, NULL);


SELECT newEntry(1000101, '2002-01-13', "", 
"Equipment bought", 0, now(), "user",
1000101, 2500102, '122', 'D', 20000);