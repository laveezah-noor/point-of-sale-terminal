-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: apskaitavnext2
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(19) unsigned NOT NULL,
  `balance_and_income_line_id` int(10) unsigned DEFAULT NULL,
  `equity_column_id` int(10) unsigned DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `account_type` smallint(5) unsigned NOT NULL,
  `official_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_type_idx` (`account_type`),
  KEY `accounts_official_code_idx` (`official_code`),
  KEY `accounts_balance_and_income_line_id_fk` (`balance_and_income_line_id`),
  KEY `accounts_equity_column_id_fk` (`equity_column_id`),
  CONSTRAINT `accounts_balance_and_income_line_id_fk` FOREIGN KEY (`balance_and_income_line_id`) REFERENCES `balance_and_income_lines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `accounts_equity_column_id_fk` FOREIGN KEY (`equity_column_id`) REFERENCES `equity_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balance_and_income_lines`
--

DROP TABLE IF EXISTS `balance_and_income_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_and_income_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_type` enum('base_header','balance_header','income_header','balance_line','income_line') CHARACTER SET ascii NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `line_text` varchar(255) COLLATE utf8_bin NOT NULL,
  `value_type` enum('D','C') CHARACTER SET ascii NOT NULL,
  `left_index` int(10) unsigned NOT NULL,
  `right_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_and_income_lines_line_type_idx` (`line_type`),
  KEY `balance_and_income_lines_visible_index_idx` (`visible_index`),
  KEY `balance_and_income_lines_left_index_idx` (`left_index`),
  KEY `balance_and_income_lines_right_index_idx` (`right_index`),
  KEY `balance_and_income_lines_value_type_idx` (`value_type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_adjustments`
--

DROP TABLE IF EXISTS `cash_flow_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_flow_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `account_id` bigint(20) unsigned NOT NULL,
  `entry_type` enum('D','C') CHARACTER SET ascii NOT NULL,
  `amount` decimal(20,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_adjustments_entry_type_idx` (`entry_type`),
  KEY `cash_flow_adjustments_transaction_id_fk` (`transaction_id`),
  KEY `cash_flow_adjustments_account_id_fk` (`account_id`),
  CONSTRAINT `cash_flow_adjustments_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cash_flow_adjustments_transaction_id_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_line_assignments`
--

DROP TABLE IF EXISTS `cash_flow_line_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_flow_line_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned NOT NULL,
  `cash_flow_line_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_line_assignments_account_id_fk` (`account_id`),
  KEY `cash_flow_line_assignments_cash_flow_line_id_fk` (`cash_flow_line_id`),
  CONSTRAINT `cash_flow_line_assignments_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_flow_line_assignments_cash_flow_line_id_fk` FOREIGN KEY (`cash_flow_line_id`) REFERENCES `cash_flow_lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_flow_lines`
--

DROP TABLE IF EXISTS `cash_flow_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_flow_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_type` enum('header','line') CHARACTER SET ascii NOT NULL,
  `is_net_income` tinyint(3) unsigned NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `line_text` varchar(255) COLLATE utf8_bin NOT NULL,
  `value_type` enum('D','C') CHARACTER SET ascii NOT NULL,
  `balance_type` enum('total','per_period','D','C') CHARACTER SET ascii NOT NULL,
  `left_index` int(10) unsigned NOT NULL,
  `right_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_lines_line_type_idx` (`line_type`),
  KEY `cash_flow_lines_is_net_income_idx` (`is_net_income`),
  KEY `cash_flow_lines_visible_index_idx` (`visible_index`),
  KEY `cash_flow_lines_value_type_idx` (`value_type`),
  KEY `cash_flow_lines_balance_type_idx` (`balance_type`),
  KEY `cash_flow_lines_left_index_idx` (`left_index`),
  KEY `cash_flow_lines_right_index_idx` (`right_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_codes`
--

DROP TABLE IF EXISTS `country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_codes` (
  `id` char(2) CHARACTER SET ascii NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_codes`
--

DROP TABLE IF EXISTS `currency_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_codes` (
  `id` char(3) CHARACTER SET ascii NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_date` date NOT NULL,
  `document_no` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(500) COLLATE utf8_bin NOT NULL,
  `document_comments` varchar(4000) COLLATE utf8_bin NOT NULL,
  `internal_comments` varchar(500) COLLATE utf8_bin NOT NULL,
  `document_type` smallint(5) unsigned NOT NULL,
  `extended_document_type_id` char(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_document_date_idx` (`document_date`),
  KEY `documents_document_type_idx` (`document_type`),
  KEY `documents_external_id_idx` (`external_id`),
  KEY `documents_extended_document_type_id_fk` (`extended_document_type_id`),
  CONSTRAINT `documents_extended_document_type_id_fk` FOREIGN KEY (`extended_document_type_id`) REFERENCES `extended_document_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equity_columns`
--

DROP TABLE IF EXISTS `equity_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equity_columns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `column_text` varchar(255) COLLATE utf8_bin NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equity_columns_visible_index_idx` (`visible_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equity_line_assignments`
--

DROP TABLE IF EXISTS `equity_line_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equity_line_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equity_line_id` int(10) unsigned NOT NULL,
  `document_type` smallint(6) NOT NULL,
  `extended_document_type_id` char(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equity_line_assignments_document_type_idx` (`document_type`),
  KEY `equity_line_assignments_equity_line_id_fk` (`equity_line_id`),
  KEY `equity_line_assignments_extended_document_type_id_fk` (`extended_document_type_id`),
  CONSTRAINT `equity_line_assignments_equity_line_id_fk` FOREIGN KEY (`equity_line_id`) REFERENCES `equity_lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equity_line_assignments_extended_document_type_id_fk` FOREIGN KEY (`extended_document_type_id`) REFERENCES `extended_document_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equity_lines`
--

DROP TABLE IF EXISTS `equity_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equity_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) COLLATE utf8_bin NOT NULL,
  `line_text` varchar(255) COLLATE utf8_bin NOT NULL,
  `line_type` enum('initial_balance','cumulative_delta','zero_balance','first_delta','first_balance','second_delta','second_balance') CHARACTER SET ascii NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equity_lines_visible_index_idx` (`visible_index`),
  KEY `equity_lines_line_type_idx` (`line_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extended_document_types`
--

DROP TABLE IF EXISTS `extended_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extended_document_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `fallback_document_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_document_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_document_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extended_fixed_assets_operation_types`
--

DROP TABLE IF EXISTS `extended_fixed_assets_operation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extended_fixed_assets_operation_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `fallback_fixed_assets_operation_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_fixed_assets_operation_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_fixed_assets_operation_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extended_inventory_operation_types`
--

DROP TABLE IF EXISTS `extended_inventory_operation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extended_inventory_operation_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `fallback_inventory_operation_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_inventory_operation_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_inventory_operation_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension_guid` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `extension_version` varchar(20) COLLATE utf8_bin NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_bin NOT NULL,
  `uninstalled_at` datetime DEFAULT NULL,
  `uninstalled_by` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ledger_entries`
--

DROP TABLE IF EXISTS `ledger_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `account_id` bigint(19) unsigned NOT NULL,
  `entry_type` enum('D','C') CHARACTER SET ascii NOT NULL,
  `amount` decimal(20,2) unsigned NOT NULL,
  `person_id` int(10) unsigned DEFAULT NULL,
  `cost_centre_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledger_entries_entry_type_idx` (`entry_type`),
  KEY `ledger_entries_transaction_id_fk` (`transaction_id`),
  KEY `ledger_entries_account_id_fk` (`account_id`),
  CONSTRAINT `ledger_entries_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ledger_entries_transaction_id_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2500001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_transaction_date_idx` (`transaction_date`),
  KEY `transactions_document_id_fk` (`document_id`),
  CONSTRAINT `transactions_document_id_fk` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'apskaitavnext2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-10  0:35:46

SELECT line.printed_no as RowNo, line.line_text AS RowText,
(SELECT GROUP_CONCAT(CAST(a.id AS CHAR) SEPARATOR ', ') 
FROM accounts a WHERE a.balance_and_income_line_id = line.ID) AS RelatedAccounts,
SUM(CASE WHEN line.line_type <> 'balance_line' 
AND line.line_type <> 'income_line' THEN null ELSE
(CASE WHEN line.line_type = 'balance_line' 
THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod - 
val.CreditFirstPeriod ELSE (val.DebitFirstPeriod - val.ClosingDebitFirstPeriod)
- (val.CreditFirstPeriod - val.ClosingCreditFirstPeriod) END) END)
* (CASE WHEN line.value_type='D' THEN 1 ELSE -1 END) AS ValueFirstPeriod,
SUM(CASE WHEN line.line_type <> 'balance_line' 
AND line.line_type <> 'income_line' THEN null ELSE
(CASE WHEN line.line_type = 'balance_line' 
THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod - 
val.CreditFirstPeriod + val.DebitSecondPeriod - val.CreditSecondPeriod 
ELSE (val.DebitSecondPeriod - val.ClosingDebitSecondPeriod)
- (val.CreditSecondPeriod - val.ClosingCreditSecondPeriod) END) END)
* (CASE WHEN line.value_type='D' THEN 1 ELSE -1 END) AS ValueSecondPeriod
FROM balance_and_income_lines AS line
LEFT JOIN balance_and_income_lines AS child_line ON child_line.left_index 
BETWEEN line.left_index AND line.right_index
LEFT JOIN (
SELECT a.balance_and_income_line_id AS LineId, l.line_type AS LineType,
SUM(CASE WHEN t.transaction_date < '2017-01-01' 
AND e.entry_type='D' THEN e.amount ELSE 0.0 END) AS TotalDebitBefore,
SUM(CASE WHEN t.transaction_date < '2017-01-01' 
AND e.entry_type='C' THEN e.amount ELSE 0.0 END) AS TotalCreditBefore,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' 
AND t.transaction_date < '2018-01-01' AND e.entry_type='D' 
THEN e.amount ELSE 0.0 END) AS DebitFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' 
AND t.transaction_date < '2018-01-01' AND e.entry_type='C' 
THEN e.amount ELSE 0.0 END) AS CreditFirstPeriod,
SUM(CASE WHEN d.document_type = 13 AND t.transaction_date >= '2017-01-01' 
AND t.transaction_date < '2018-01-01' AND e.entry_type='D' 
THEN e.amount ELSE 0.0 END) AS ClosingDebitFirstPeriod,
SUM(CASE WHEN d.document_type = 13 AND t.transaction_date >= '2017-01-01' 
AND t.transaction_date < '2018-01-01' AND e.entry_type='C' 
THEN e.amount ELSE 0.0 END) AS ClosingCreditFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='D' 
THEN e.amount ELSE 0.0 END) AS DebitSecondPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='C' 
THEN e.amount ELSE 0.0 END) AS CreditSecondPeriod,
SUM(CASE WHEN d.document_type = 13 AND t.transaction_date >= '2018-01-01' 
AND e.entry_type='D' THEN e.amount ELSE 0.0 END) AS ClosingDebitSecondPeriod,
SUM(CASE WHEN d.document_type = 13 AND t.transaction_date >= '2018-01-01' 
AND e.entry_type='C' THEN e.amount ELSE 0.0 END) AS ClosingCreditSecondPeriod
FROM documents d
LEFT JOIN transactions t ON t.document_id = d.id
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
LEFT JOIN balance_and_income_lines l ON l.id = a.balance_and_income_line_id
WHERE t.transaction_date <='2018-12-31' GROUP BY a.balance_and_income_line_id
) AS val ON val.LineId = child_line.id OR (child_line.id=14 AND val.LineType = 'income_line')
GROUP BY line.id ORDER BY line.visible_index;

SELECT node.id, node.line_type, (COUNT(parent.id) - 1) AS depth, 
node.visible_index, node.printed_no, node.line_text, node.line_type, node.left_index, 
node.right_index,
(SELECT COUNT(*) FROM accounts a WHERE a.balance_and_income_line_id = node.id) AS AccountsCount
FROM balance_and_income_lines AS parent
LEFT JOIN balance_and_income_lines AS node ON node.left_index 
        BETWEEN parent.left_index AND parent.right_index
GROUP BY node.id ORDER BY node.left_index;

SELECT line.printed_no as RowNo, line.line_text AS RowText,
SUM(
CASE WHEN line.line_type<>'line' THEN NULL
WHEN line.is_net_income > 0 THEN
(SELECT SUM(CASE WHEN e.entry_type='D' THEN -e.amount ELSE e.amount END)
FROM documents d
LEFT JOIN transactions t ON t.document_id = d.id
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
LEFT JOIN balance_and_income_lines l ON l.id = a.balance_and_income_line_id
WHERE t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01'
AND d.document_type<>13 AND l.line_type='income_line')
ELSE
(CASE WHEN child_line.id IS NULL THEN
(CASE line.balance_type
WHEN 'total' THEN val.TotalDebitBefore - val.TotalCreditBefore + 
                  val.DebitFirstPeriod - val.CreditFirstPeriod
WHEN 'per_period' THEN val.DebitFirstPeriod - val.CreditFirstPeriod
WHEN 'D' THEN val.DebitFirstPeriod
ELSE - val.CreditFirstPeriod
END) * (CASE WHEN line.value_type='D' THEN 1 ELSE -1 END)
ELSE
(CASE child_line.balance_type
WHEN 'total' THEN val.TotalDebitBefore - val.TotalCreditBefore + 
                  val.DebitFirstPeriod - val.CreditFirstPeriod
WHEN 'per_period' THEN val.DebitFirstPeriod - val.CreditFirstPeriod
WHEN 'D' THEN val.DebitFirstPeriod
ELSE - val.CreditFirstPeriod
END) * (CASE WHEN child_line.value_type='D' THEN 1 ELSE -1 END)
END)
END) AS FirstPeriodValue,
SUM(
CASE WHEN line.line_type<>'line' THEN NULL
WHEN line.is_net_income > 0 THEN
(SELECT SUM(CASE WHEN e.entry_type='D' THEN -e.amount ELSE e.amount END)
FROM documents d
LEFT JOIN transactions t ON t.document_id = d.id
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN accounts a ON a.id = e.account_id
LEFT JOIN balance_and_income_lines l ON l.id = a.balance_and_income_line_id
WHERE t.transaction_date >= '2018-01-01' AND t.transaction_date <= '2018-12-31'
AND d.document_type<>13 AND l.line_type='income_line')
ELSE
(CASE WHEN child_line.id IS NULL THEN
(CASE line.balance_type
WHEN 'total' THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod
- val.CreditFirstPeriod + val.DebitSecondPeriod - CreditSecondPeriod
WHEN 'per_period' THEN val.DebitSecondPeriod - val.CreditSecondPeriod
WHEN 'D' THEN val.DebitSecondPeriod
ELSE - val.CreditSecondPeriod
END) * (CASE WHEN line.value_type='D' THEN 1 ELSE -1 END)
ELSE
(CASE child_line.balance_type
WHEN 'total' THEN val.TotalDebitBefore - val.TotalCreditBefore + val.DebitFirstPeriod
- val.CreditFirstPeriod + val.DebitSecondPeriod - CreditSecondPeriod
WHEN 'per_period' THEN val.DebitSecondPeriod - val.CreditSecondPeriod
WHEN 'D' THEN val.DebitSecondPeriod
ELSE - val.CreditSecondPeriod
END) * (CASE WHEN child_line.value_type='D' THEN 1 ELSE -1 END)
END)
END) AS SecondPeriodValue
FROM cash_flow_lines AS line
LEFT JOIN cash_flow_lines AS child_line ON child_line.left_index 
                          BETWEEN line.left_index AND line.right_index
LEFT JOIN (
SELECT c.cash_flow_line_id AS LineId,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='D' 
         THEN e.amount ELSE 0.0 END) AS TotalDebitBefore,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='C' 
         THEN e.amount ELSE 0.0 END) AS TotalCreditBefore,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01'
AND e.entry_type='D' AND d.document_type <> 13 THEN e.amount ELSE 0.0 END) AS DebitFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01'
AND e.entry_type='C' AND d.document_type <> 13 
                     THEN e.amount ELSE 0.0 END) AS CreditFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='D'
AND d.document_type <> 13 THEN e.amount ELSE 0.0 END) AS DebitSecondPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='C'
AND d.document_type <> 13 THEN e.amount ELSE 0.0 END) AS CreditSecondPeriod
FROM documents d
LEFT JOIN transactions t ON t.document_id = d.id
LEFT JOIN ledger_entries e ON e.transaction_id = t.id
LEFT JOIN cash_flow_line_assignments c ON c.account_id = e.account_id
WHERE t.transaction_date <='2018-12-31' AND NOT c.id IS NULL GROUP BY c.cash_flow_line_id
UNION ALL
SELECT c.cash_flow_line_id AS LineId,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='D' 
         THEN e.amount ELSE 0.0 END) AS TotalDebitBefore,
SUM(CASE WHEN t.transaction_date < '2017-01-01' AND e.entry_type='C' 
         THEN e.amount ELSE 0.0 END) AS TotalCreditBefore,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01'
AND e.entry_type='D' THEN e.amount ELSE 0.0 END) AS DebitFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2017-01-01' AND t.transaction_date < '2018-01-01'
AND e.entry_type='C' THEN e.amount ELSE 0.0 END) AS CreditFirstPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='D'
THEN e.amount ELSE 0.0 END) AS DebitSecondPeriod,
SUM(CASE WHEN t.transaction_date >= '2018-01-01' AND e.entry_type='C'
THEN e.amount ELSE 0.0 END) AS CreditSecondPeriod
FROM transactions t
LEFT JOIN cash_flow_adjustments e ON e.transaction_id = t.id
LEFT JOIN cash_flow_line_assignments c ON c.account_id = e.account_id
WHERE t.transaction_date <='2018-12-31' AND NOT c.id IS NULL GROUP BY c.cash_flow_line_id
) AS val ON val.LineId = child_line.id
GROUP BY line.id ORDER BY line.visible_index;