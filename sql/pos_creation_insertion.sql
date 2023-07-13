DROP SCHEMA IF EXISTS `pos` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `pos` ;

#
# TABLE STRUCTURE FOR: accounts
#

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` bigint(19) unsigned NOT NULL,
  `balance_and_income_line_id` int(10) unsigned DEFAULT NULL,
  `equity_column_id` int(10) unsigned DEFAULT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_type` smallint(5) unsigned NOT NULL,
  `official_code` varchar(20) NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_type_idx` (`account_type`),
  KEY `accounts_official_code_idx` (`official_code`),
  KEY `accounts_balance_and_income_line_id_fk` (`balance_and_income_line_id`),
  KEY `accounts_equity_column_id_fk` (`equity_column_id`),
  CONSTRAINT `accounts_balance_and_income_line_id_fk` FOREIGN KEY (`balance_and_income_line_id`) REFERENCES `balance_and_income_lines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `accounts_equity_column_id_fk` FOREIGN KEY (`equity_column_id`) REFERENCES `equity_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `accounts` (
`id`, 
`balance_and_income_line_id`, 
`equity_column_id`, 
`account_name`, 
`account_type`, `official_code`, `is_archived`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) 
VALUES 
('0', 39, 1, '18367', 8, 'zxjp', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('1', 39, null, 'Fixed Assets', 1, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('122', 39, null, 'Equipment', 1, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('2', 39, null, 'Current Assets', 1, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('201', 39, null, 'Supplies', 1, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('241', 39, null, 'Account Receivable', 2, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', ''),
('271', 39, null, 'Cash in Bank', 2, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', '')
,
('1', 39, null, 'Fixed Assets', 1, 'asset', 1, '1989-04-29 18:04:34', '', '1983-02-17 09:48:32', '');


#
# TABLE STRUCTURE FOR: balance_and_income_lines
#

DROP TABLE IF EXISTS `balance_and_income_lines`;

CREATE TABLE `balance_and_income_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_type` enum('base_header','balance_header','income_header','balance_line','income_line') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) NOT NULL,
  `line_text` varchar(255) NOT NULL,
  `value_type` enum('D','C') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `left_index` int(10) unsigned NOT NULL,
  `right_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_and_income_lines_line_type_idx` (`line_type`),
  KEY `balance_and_income_lines_visible_index_idx` (`visible_index`),
  KEY `balance_and_income_lines_left_index_idx` (`left_index`),
  KEY `balance_and_income_lines_right_index_idx` (`right_index`),
  KEY `balance_and_income_lines_value_type_idx` (`value_type`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (39, 'income_header', 0, '', '', 'D', 0, 0, '2021-03-26 10:39:36', '', '2019-06-30 17:43:26', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (40, 'balance_line', 0, '', '', 'D', 0, 0, '1977-11-23 18:09:26', '', '1976-12-30 09:55:25', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (41, 'balance_line', 0, '', '', 'D', 0, 0, '1990-03-25 08:26:42', '', '1972-07-12 01:42:54', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (42, 'income_line', 0, '', '', 'C', 0, 0, '1995-01-15 00:06:32', '', '1997-06-23 23:01:36', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (43, 'base_header', 0, '', '', 'D', 0, 0, '2003-02-14 11:10:16', '', '1975-07-06 04:30:48', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (44, 'base_header', 0, '', '', 'C', 0, 0, '1971-01-11 14:18:14', '', '2017-09-12 23:26:40', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (45, 'income_line', 0, '', '', 'D', 0, 0, '1970-08-12 21:40:31', '', '2005-02-17 14:58:41', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (46, 'base_header', 0, '', '', 'C', 0, 0, '1981-12-31 06:44:05', '', '1983-03-22 22:00:51', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (47, 'balance_header', 0, '', '', 'D', 0, 0, '1993-03-28 22:58:18', '', '2015-08-17 04:55:49', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (48, 'base_header', 0, '', '', 'D', 0, 0, '1976-04-10 11:12:57', '', '1977-08-24 00:25:43', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (49, 'base_header', 0, '', '', 'C', 0, 0, '1993-09-09 18:50:36', '', '2013-11-13 01:20:11', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (50, 'income_header', 0, '', '', 'D', 0, 0, '2010-10-03 10:10:32', '', '1989-01-17 10:46:11', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (51, 'base_header', 0, '', '', 'C', 0, 0, '2011-02-19 15:16:31', '', '2001-04-14 14:43:11', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (52, 'income_line', 0, '', '', 'C', 0, 0, '1986-10-10 16:22:40', '', '1973-02-10 00:03:52', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (53, 'balance_header', 0, '', '', 'D', 0, 0, '1998-10-01 14:32:28', '', '2020-01-26 19:42:44', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (54, 'base_header', 0, '', '', 'D', 0, 0, '1994-02-26 03:14:30', '', '1982-05-19 14:27:44', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (55, 'balance_line', 0, '', '', 'C', 0, 0, '1993-03-21 21:31:15', '', '1992-02-24 14:28:08', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (56, 'balance_header', 0, '', '', 'C', 0, 0, '1976-12-17 01:29:46', '', '2006-09-17 04:24:32', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (57, 'balance_header', 0, '', '', 'D', 0, 0, '2017-03-11 03:29:18', '', '1979-10-10 03:26:47', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (58, 'income_line', 0, '', '', 'C', 0, 0, '1999-01-19 12:48:03', '', '2017-11-29 01:10:57', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (59, 'balance_line', 0, '', '', 'D', 0, 0, '2018-12-15 17:36:10', '', '2020-10-23 01:40:35', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (60, 'base_header', 0, '', '', 'D', 0, 0, '2019-08-23 22:36:48', '', '1995-02-10 21:26:16', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (61, 'income_line', 0, '', '', 'D', 0, 0, '1974-12-13 07:05:56', '', '1995-03-05 15:39:14', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (62, 'balance_line', 0, '', '', 'C', 0, 0, '1976-03-19 23:50:35', '', '1976-02-18 06:03:46', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (63, 'income_header', 0, '', '', 'C', 0, 0, '1997-09-25 02:52:47', '', '1994-12-05 10:34:20', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (64, 'income_line', 0, '', '', 'D', 0, 0, '2001-04-26 05:09:35', '', '2016-12-08 02:59:03', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (65, 'balance_line', 0, '', '', 'C', 0, 0, '1992-04-21 07:20:24', '', '2004-02-06 23:27:34', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (66, 'income_line', 0, '', '', 'D', 0, 0, '1997-10-19 03:37:33', '', '2006-05-06 12:53:26', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (67, 'base_header', 0, '', '', 'C', 0, 0, '1975-10-17 07:43:50', '', '1972-06-30 05:16:13', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (68, 'balance_header', 0, '', '', 'D', 0, 0, '1970-06-19 14:37:57', '', '1988-12-17 08:59:57', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (69, 'balance_line', 0, '', '', 'D', 0, 0, '2009-10-23 13:12:42', '', '2011-11-15 03:33:58', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (70, 'income_line', 0, '', '', 'D', 0, 0, '1999-04-12 03:49:04', '', '2022-12-18 22:52:03', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (71, 'balance_line', 0, '', '', 'C', 0, 0, '2008-12-14 23:59:14', '', '2016-08-05 08:19:04', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (72, 'balance_header', 0, '', '', 'D', 0, 0, '2021-05-28 03:18:49', '', '1991-11-30 03:42:20', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (73, 'income_line', 0, '', '', 'C', 0, 0, '1971-02-09 23:28:55', '', '1978-12-14 20:27:33', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (74, 'income_line', 0, '', '', 'D', 0, 0, '1998-10-23 13:11:18', '', '2001-11-02 05:48:21', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (75, 'base_header', 0, '', '', 'C', 0, 0, '2015-06-06 10:15:25', '', '2009-03-15 04:59:12', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (76, 'income_line', 0, '', '', 'C', 0, 0, '2012-11-14 13:41:12', '', '1993-04-22 05:57:26', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (77, 'balance_line', 0, '', '', 'C', 0, 0, '1983-10-08 17:22:01', '', '2009-05-20 00:48:16', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (78, 'base_header', 0, '', '', 'C', 0, 0, '2009-02-25 17:04:03', '', '1984-01-21 04:45:57', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (79, 'balance_header', 0, '', '', 'C', 0, 0, '1987-08-28 21:16:07', '', '1994-09-19 02:52:19', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (80, 'income_header', 0, '', '', 'D', 0, 0, '1980-08-31 07:30:08', '', '1970-09-28 08:54:18', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (81, 'income_header', 0, '', '', 'C', 0, 0, '1980-06-03 03:18:14', '', '2013-06-30 21:21:37', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (82, 'income_header', 0, '', '', 'D', 0, 0, '1976-05-09 00:47:04', '', '1990-09-19 01:48:18', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (83, 'balance_header', 0, '', '', 'C', 0, 0, '2011-05-15 17:06:22', '', '1995-11-10 07:02:31', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (84, 'income_line', 0, '', '', 'D', 0, 0, '1976-01-30 19:52:58', '', '1982-08-18 09:23:41', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (85, 'base_header', 0, '', '', 'D', 0, 0, '2017-05-23 16:24:37', '', '1978-03-16 20:15:09', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (86, 'base_header', 0, '', '', 'D', 0, 0, '2004-12-22 12:51:59', '', '1998-10-16 05:35:45', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (87, 'income_header', 0, '', '', 'D', 0, 0, '2008-03-29 00:03:00', '', '1971-05-18 11:42:55', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (88, 'balance_line', 0, '', '', 'D', 0, 0, '1991-12-29 06:06:22', '', '1986-04-28 11:49:08', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (89, 'balance_header', 0, '', '', 'C', 0, 0, '1987-06-15 22:49:43', '', '2007-05-02 02:04:49', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (90, 'income_header', 0, '', '', 'C', 0, 0, '1972-06-20 19:53:22', '', '2017-04-18 08:29:00', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (91, 'balance_line', 0, '', '', 'D', 0, 0, '2007-10-26 06:09:56', '', '2002-05-07 20:50:50', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (92, 'balance_line', 0, '', '', 'C', 0, 0, '2004-02-12 04:32:05', '', '2005-01-07 10:53:09', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (93, 'income_line', 0, '', '', 'D', 0, 0, '1973-05-12 08:57:29', '', '1972-08-14 17:45:55', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (94, 'base_header', 0, '', '', 'C', 0, 0, '2012-05-13 18:36:53', '', '2016-09-13 13:37:21', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (95, 'income_line', 0, '', '', 'C', 0, 0, '2012-12-26 06:05:40', '', '2018-08-02 16:28:50', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (96, 'balance_header', 0, '', '', 'D', 0, 0, '1997-10-29 18:57:06', '', '2011-08-01 15:54:41', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (97, 'base_header', 0, '', '', 'D', 0, 0, '1976-11-09 10:02:12', '', '2018-01-02 08:52:15', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (98, 'balance_line', 0, '', '', 'D', 0, 0, '1983-11-05 14:47:05', '', '2013-05-26 05:10:02', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (99, 'income_line', 0, '', '', 'C', 0, 0, '1998-05-18 09:53:02', '', '2018-03-19 16:26:40', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (100, 'base_header', 0, '', '', 'C', 0, 0, '2018-02-06 03:41:05', '', '1997-04-19 04:17:54', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (101, 'income_header', 0, '', '', 'D', 0, 0, '1987-07-14 14:32:13', '', '1988-09-15 06:48:31', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (102, 'balance_header', 0, '', '', 'D', 0, 0, '2011-10-30 18:27:12', '', '2001-03-05 08:30:59', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (103, 'balance_line', 0, '', '', 'D', 0, 0, '2005-10-23 01:59:06', '', '2016-03-31 04:36:44', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (104, 'base_header', 0, '', '', 'C', 0, 0, '1983-08-09 11:41:30', '', '1974-01-14 14:23:13', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (105, 'income_line', 0, '', '', 'C', 0, 0, '2010-05-18 06:27:39', '', '1974-05-20 00:03:13', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (106, 'balance_line', 0, '', '', 'C', 0, 0, '2003-11-08 08:49:58', '', '1986-01-14 22:30:50', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (107, 'balance_header', 0, '', '', 'D', 0, 0, '1970-07-26 05:51:31', '', '1979-06-02 22:41:24', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (108, 'balance_header', 0, '', '', 'D', 0, 0, '1976-03-21 18:01:46', '', '1985-07-11 13:44:46', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (109, 'balance_line', 0, '', '', 'D', 0, 0, '1989-01-26 08:32:42', '', '2018-02-15 14:26:42', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (110, 'income_header', 0, '', '', 'D', 0, 0, '1970-09-03 16:13:48', '', '1982-03-07 15:43:05', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (111, 'base_header', 0, '', '', 'C', 0, 0, '2008-08-23 13:52:29', '', '1976-06-29 08:03:30', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (112, 'income_header', 0, '', '', 'C', 0, 0, '1995-11-10 23:03:53', '', '2006-11-26 13:00:20', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (113, 'base_header', 0, '', '', 'D', 0, 0, '2011-01-31 16:07:14', '', '1971-12-25 23:13:15', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (114, 'balance_line', 0, '', '', 'D', 0, 0, '2000-12-24 14:37:02', '', '2014-03-25 23:04:59', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (115, 'balance_line', 0, '', '', 'D', 0, 0, '1995-12-11 20:39:45', '', '2011-11-11 19:31:34', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (116, 'base_header', 0, '', '', 'C', 0, 0, '1976-02-02 04:02:46', '', '1994-11-23 02:09:42', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (117, 'income_header', 0, '', '', 'D', 0, 0, '1978-10-10 07:15:13', '', '2016-11-10 13:29:58', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (118, 'balance_header', 0, '', '', 'D', 0, 0, '1985-08-22 05:16:18', '', '1976-10-30 05:47:49', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (119, 'income_line', 0, '', '', 'D', 0, 0, '2006-06-10 11:25:06', '', '1978-10-08 10:50:32', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (120, 'balance_header', 0, '', '', 'C', 0, 0, '1998-01-25 03:22:32', '', '1996-07-18 20:22:26', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (121, 'income_header', 0, '', '', 'D', 0, 0, '2008-03-29 12:18:17', '', '1980-01-04 17:40:24', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (122, 'income_line', 0, '', '', 'D', 0, 0, '1998-03-20 19:10:00', '', '1998-07-11 02:15:13', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (123, 'income_line', 0, '', '', 'C', 0, 0, '2014-04-28 02:36:05', '', '1985-05-11 04:06:46', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (124, 'income_header', 0, '', '', 'D', 0, 0, '2005-09-19 10:47:51', '', '2003-09-11 14:35:53', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (125, 'income_header', 0, '', '', 'C', 0, 0, '2000-02-26 04:18:19', '', '2013-11-28 10:03:21', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (126, 'base_header', 0, '', '', 'C', 0, 0, '2005-07-24 05:10:54', '', '2011-02-08 02:26:16', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (127, 'income_header', 0, '', '', 'D', 0, 0, '2008-12-04 02:57:35', '', '1991-11-19 17:05:51', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (128, 'base_header', 0, '', '', 'D', 0, 0, '2013-05-25 01:35:15', '', '2002-06-20 18:39:40', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (129, 'income_line', 0, '', '', 'C', 0, 0, '1983-11-21 11:44:14', '', '2006-06-30 14:07:16', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (130, 'income_line', 0, '', '', 'D', 0, 0, '2000-03-27 05:37:11', '', '1971-02-10 21:23:03', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (131, 'balance_header', 0, '', '', 'C', 0, 0, '1988-08-27 03:57:01', '', '2000-06-22 18:26:50', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (132, 'income_header', 0, '', '', 'D', 0, 0, '1994-03-10 11:35:46', '', '1985-11-24 23:28:46', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (133, 'income_header', 0, '', '', 'D', 0, 0, '1975-08-09 08:38:28', '', '2008-12-31 18:58:54', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (134, 'base_header', 0, '', '', 'D', 0, 0, '1972-01-02 06:34:32', '', '2020-07-22 13:00:31', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (135, 'balance_header', 0, '', '', 'C', 0, 0, '2014-06-11 12:19:45', '', '1995-03-23 19:39:12', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (136, 'base_header', 0, '', '', 'C', 0, 0, '1973-12-22 15:12:34', '', '1993-07-06 06:28:00', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (137, 'balance_header', 0, '', '', 'C', 0, 0, '2017-09-13 07:38:06', '', '2006-05-22 00:49:38', '');
INSERT INTO `balance_and_income_lines` (`id`, `line_type`, `visible_index`, `printed_no`, `line_text`, `value_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (138, 'income_line', 0, '', '', 'C', 0, 0, '1990-12-14 17:56:39', '', '2008-03-23 22:45:14', '');


#
# TABLE STRUCTURE FOR: cash_flow_adjustments
#

DROP TABLE IF EXISTS `cash_flow_adjustments`;

CREATE TABLE `cash_flow_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `account_id` bigint(20) unsigned NOT NULL,
  `entry_type` enum('D','C') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `amount` decimal(20,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_adjustments_entry_type_idx` (`entry_type`),
  KEY `cash_flow_adjustments_transaction_id_fk` (`transaction_id`),
  KEY `cash_flow_adjustments_account_id_fk` (`account_id`),
  CONSTRAINT `cash_flow_adjustments_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `cash_flow_adjustments_transaction_id_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (1, 1000001, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (2, 1000002, '0', 'D', '3.66');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (3, 1000003, '0', 'C', '29.13');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (4, 1000004, '0', 'D', '3169426.72');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (5, 1000005, '0', 'C', '22048209.60');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (6, 1000006, '0', 'C', '6524.24');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (7, 1000007, '0', 'C', '295.40');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (8, 1000008, '0', 'D', '65294158.41');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (9, 1000009, '0', 'D', '1455.40');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (10, 1000010, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (11, 1000011, '0', 'D', '499828522.94');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (12, 1000012, '0', 'C', '9.10');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (13, 1000013, '0', 'D', '18255435.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (14, 1000014, '0', 'C', '7560.90');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (15, 1000015, '0', 'D', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (16, 1000016, '0', 'C', '2969031.24');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (17, 1000017, '0', 'C', '49155.30');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (18, 1000018, '0', 'D', '12245.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (19, 1000019, '0', 'C', '701820.84');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (20, 1000020, '0', 'D', '44.77');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (21, 1000021, '0', 'C', '5.36');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (22, 1000022, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (23, 1000023, '0', 'D', '401752075.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (24, 1000024, '0', 'D', '2368.91');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (25, 1000025, '0', 'D', '7707475.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (26, 1000026, '0', 'C', '58180.50');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (27, 1000027, '0', 'D', '33632.52');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (28, 1000028, '0', 'C', '2433789.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (29, 1000029, '0', 'C', '149.23');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (30, 1000030, '0', 'D', '79435.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (31, 1000031, '0', 'D', '365.88');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (32, 1000032, '0', 'D', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (33, 1000033, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (34, 1000034, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (35, 1000035, '0', 'D', '50.27');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (36, 1000036, '0', 'C', '0.42');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (37, 1000037, '0', 'D', '5.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (38, 1000038, '0', 'D', '1.97');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (39, 1000039, '0', 'D', '3127286.49');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (40, 1000040, '0', 'D', '11.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (41, 1000041, '0', 'C', '359.83');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (42, 1000042, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (43, 1000043, '0', 'C', '5253.23');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (44, 1000044, '0', 'C', '26.71');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (45, 1000045, '0', 'D', '4.81');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (46, 1000046, '0', 'D', '2528856.40');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (47, 1000047, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (48, 1000048, '0', 'C', '50.42');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (49, 1000049, '0', 'C', '3394558.38');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (50, 1000050, '0', 'C', '54.60');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (51, 1000051, '0', 'D', '7949.47');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (52, 1000052, '0', 'C', '421778525.56');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (53, 1000053, '0', 'D', '7680.71');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (54, 1000054, '0', 'C', '5220.79');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (55, 1000055, '0', 'D', '78395.79');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (56, 1000056, '0', 'C', '537.55');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (57, 1000057, '0', 'D', '47291039.20');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (58, 1000058, '0', 'C', '55863.32');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (59, 1000059, '0', 'C', '5.20');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (60, 1000060, '0', 'C', '315583.40');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (61, 1000061, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (62, 1000062, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (63, 1000063, '0', 'C', '13.91');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (64, 1000064, '0', 'D', '58944725.86');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (65, 1000065, '0', 'D', '373506362.82');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (66, 1000066, '0', 'C', '3.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (67, 1000067, '0', 'C', '2690.47');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (68, 1000068, '0', 'D', '23149.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (69, 1000069, '0', 'C', '834998.88');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (70, 1000070, '0', 'D', '941142.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (71, 1000071, '0', 'C', '19.08');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (72, 1000072, '0', 'C', '5517.49');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (73, 1000073, '0', 'D', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (74, 1000074, '0', 'C', '53852158.63');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (75, 1000075, '0', 'D', '2274.30');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (76, 1000076, '0', 'C', '109.53');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (77, 1000077, '0', 'D', '195131.07');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (78, 1000078, '0', 'D', '55.79');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (79, 1000079, '0', 'D', '524048.37');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (80, 1000080, '0', 'C', '300.74');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (81, 1000081, '0', 'C', '4363625.37');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (82, 1000082, '0', 'D', '33.99');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (83, 1000083, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (84, 1000084, '0', 'C', '106820.20');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (85, 1000085, '0', 'C', '0.03');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (86, 1000086, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (87, 1000087, '0', 'C', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (88, 1000088, '0', 'D', '50717.06');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (89, 1000089, '0', 'D', '21687663.90');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (90, 1000090, '0', 'D', '0.30');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (91, 1000091, '0', 'C', '911403.04');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (92, 1000092, '0', 'D', '829769.40');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (93, 1000093, '0', 'C', '42128182.58');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (94, 1000094, '0', 'D', '417733.10');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (95, 1000095, '0', 'D', '0.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (96, 1000096, '0', 'D', '7409.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (97, 1000097, '0', 'D', '15586.52');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (98, 1000098, '0', 'D', '9147672.00');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (99, 1000099, '0', 'D', '5743.13');
INSERT INTO `cash_flow_adjustments` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`) VALUES (100, 1000100, '0', 'C', '0.00');


#
# TABLE STRUCTURE FOR: cash_flow_line_assignments
#

DROP TABLE IF EXISTS `cash_flow_line_assignments`;

CREATE TABLE `cash_flow_line_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned NOT NULL,
  `cash_flow_line_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_line_assignments_account_id_fk` (`account_id`),
  KEY `cash_flow_line_assignments_cash_flow_line_id_fk` (`cash_flow_line_id`),
  CONSTRAINT `cash_flow_line_assignments_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_flow_line_assignments_cash_flow_line_id_fk` FOREIGN KEY (`cash_flow_line_id`) REFERENCES `cash_flow_lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (1, '0', 1);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (2, '0', 2);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (3, '0', 3);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (4, '0', 4);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (5, '0', 5);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (6, '0', 6);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (7, '0', 7);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (8, '0', 8);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (9, '0', 9);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (10, '0', 10);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (11, '0', 11);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (12, '0', 12);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (13, '0', 13);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (14, '0', 14);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (15, '0', 15);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (16, '0', 16);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (17, '0', 17);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (18, '0', 18);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (19, '0', 19);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (20, '0', 20);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (21, '0', 21);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (22, '0', 22);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (23, '0', 23);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (24, '0', 24);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (25, '0', 25);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (26, '0', 26);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (27, '0', 27);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (28, '0', 28);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (29, '0', 29);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (30, '0', 30);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (31, '0', 31);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (32, '0', 32);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (33, '0', 33);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (34, '0', 34);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (35, '0', 35);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (36, '0', 36);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (37, '0', 37);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (38, '0', 38);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (39, '0', 39);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (40, '0', 40);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (41, '0', 41);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (42, '0', 42);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (43, '0', 43);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (44, '0', 44);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (45, '0', 45);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (46, '0', 46);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (47, '0', 47);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (48, '0', 48);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (49, '0', 49);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (50, '0', 50);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (51, '0', 51);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (52, '0', 52);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (53, '0', 53);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (54, '0', 54);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (55, '0', 55);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (56, '0', 56);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (57, '0', 57);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (58, '0', 58);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (59, '0', 59);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (60, '0', 60);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (61, '0', 61);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (62, '0', 62);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (63, '0', 63);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (64, '0', 64);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (65, '0', 65);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (66, '0', 66);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (67, '0', 67);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (68, '0', 68);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (69, '0', 69);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (70, '0', 70);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (71, '0', 71);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (72, '0', 72);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (73, '0', 73);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (74, '0', 74);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (75, '0', 75);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (76, '0', 76);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (77, '0', 77);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (78, '0', 78);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (79, '0', 79);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (80, '0', 80);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (81, '0', 81);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (82, '0', 82);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (83, '0', 83);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (84, '0', 84);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (85, '0', 85);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (86, '0', 86);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (87, '0', 87);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (88, '0', 88);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (89, '0', 89);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (90, '0', 90);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (91, '0', 91);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (92, '0', 92);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (93, '0', 93);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (94, '0', 94);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (95, '0', 95);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (96, '0', 96);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (97, '0', 97);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (98, '0', 98);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (99, '0', 99);
INSERT INTO `cash_flow_line_assignments` (`id`, `account_id`, `cash_flow_line_id`) VALUES (100, '0', 100);


#
# TABLE STRUCTURE FOR: cash_flow_lines
#

DROP TABLE IF EXISTS `cash_flow_lines`;

CREATE TABLE `cash_flow_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_type` enum('header','line') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `is_net_income` tinyint(3) unsigned NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) NOT NULL,
  `line_text` varchar(255) NOT NULL,
  `value_type` enum('D','C') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `balance_type` enum('total','per_period','D','C') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `left_index` int(10) unsigned NOT NULL,
  `right_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_flow_lines_line_type_idx` (`line_type`),
  KEY `cash_flow_lines_is_net_income_idx` (`is_net_income`),
  KEY `cash_flow_lines_visible_index_idx` (`visible_index`),
  KEY `cash_flow_lines_value_type_idx` (`value_type`),
  KEY `cash_flow_lines_balance_type_idx` (`balance_type`),
  KEY `cash_flow_lines_left_index_idx` (`left_index`),
  KEY `cash_flow_lines_right_index_idx` (`right_index`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '2011-09-19 04:12:02', '', '1976-04-02 09:24:15', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (2, 'line', 0, 0, '', '', 'D', 'D', 0, 0, '1984-05-06 00:30:12', '', '2021-03-04 10:41:28', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (3, 'header', 0, 0, '', '', 'C', 'total', 0, 0, '1977-05-07 02:04:37', '', '1970-07-14 00:49:04', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (4, 'line', 0, 0, '', '', 'D', 'D', 0, 0, '2021-02-06 20:54:01', '', '2018-05-04 05:46:11', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (5, 'line', 1, 0, '', '', 'C', 'D', 0, 0, '1997-09-28 01:12:41', '', '1981-02-12 21:30:12', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (6, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '2004-06-27 18:56:57', '', '1974-11-21 07:15:48', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (7, 'header', 0, 0, '', '', 'D', 'total', 0, 0, '1987-05-02 23:01:36', '', '1987-04-09 05:16:08', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (8, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '1985-10-19 06:49:54', '', '1997-11-14 22:06:36', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (9, 'line', 1, 0, '', '', 'C', 'per_period', 0, 0, '2014-01-27 22:08:43', '', '1986-11-16 10:08:32', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (10, 'header', 1, 0, '', '', 'D', 'D', 0, 0, '1979-05-27 11:36:20', '', '1974-03-01 01:10:06', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (11, 'line', 0, 0, '', '', 'C', 'per_period', 0, 0, '2011-01-02 14:29:35', '', '2001-07-09 20:03:26', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (12, 'line', 1, 0, '', '', 'C', 'total', 0, 0, '1993-07-21 17:40:33', '', '2019-05-25 12:34:17', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (13, 'header', 1, 0, '', '', 'D', 'D', 0, 0, '1983-11-27 12:06:05', '', '2006-04-15 00:15:12', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (14, 'header', 0, 0, '', '', 'D', 'total', 0, 0, '1993-09-15 12:05:02', '', '2021-04-29 14:12:47', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (15, 'header', 0, 0, '', '', 'D', 'total', 0, 0, '2008-05-04 09:41:39', '', '1994-11-05 20:21:00', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (16, 'line', 0, 0, '', '', 'C', 'C', 0, 0, '1994-04-26 11:19:50', '', '1994-03-11 11:49:20', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (17, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1987-07-25 03:58:30', '', '1981-07-29 20:04:52', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (18, 'line', 0, 0, '', '', 'C', 'per_period', 0, 0, '2003-08-22 22:25:45', '', '1998-09-13 19:04:20', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (19, 'header', 0, 0, '', '', 'C', 'D', 0, 0, '1996-05-15 06:38:29', '', '1992-09-05 00:25:31', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (20, 'line', 0, 0, '', '', 'D', 'total', 0, 0, '1997-05-26 04:17:04', '', '2012-09-05 11:13:29', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (21, 'header', 0, 0, '', '', 'D', 'total', 0, 0, '1977-05-17 02:58:53', '', '1993-12-27 06:59:53', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (22, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1988-06-11 06:23:40', '', '2010-05-31 12:24:55', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (23, 'header', 1, 0, '', '', 'C', 'C', 0, 0, '1970-12-28 06:53:44', '', '1988-12-30 17:00:49', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (24, 'line', 0, 0, '', '', 'D', 'total', 0, 0, '1977-06-21 00:06:51', '', '1977-11-01 02:15:12', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (25, 'header', 1, 0, '', '', 'C', 'total', 0, 0, '1982-12-26 02:57:49', '', '2011-03-05 20:45:50', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (26, 'header', 1, 0, '', '', 'D', 'D', 0, 0, '1978-03-24 21:08:50', '', '1996-06-28 19:14:18', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (27, 'header', 1, 0, '', '', 'C', 'C', 0, 0, '1979-02-26 14:01:50', '', '2000-04-06 17:21:30', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (28, 'header', 0, 0, '', '', 'D', 'per_period', 0, 0, '2022-11-19 23:38:39', '', '1999-08-20 19:10:29', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (29, 'header', 0, 0, '', '', 'D', 'per_period', 0, 0, '1995-09-23 06:12:34', '', '2012-04-07 22:10:01', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (30, 'header', 1, 0, '', '', 'D', 'C', 0, 0, '2003-07-22 12:51:08', '', '2001-04-17 15:27:19', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (31, 'header', 1, 0, '', '', 'C', 'total', 0, 0, '2008-01-03 14:44:11', '', '1980-06-03 14:05:38', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (32, 'line', 0, 0, '', '', 'D', 'total', 0, 0, '1972-06-05 16:11:18', '', '2001-07-18 19:16:17', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (33, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1990-01-05 23:31:18', '', '1994-04-23 09:18:05', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (34, 'line', 0, 0, '', '', 'D', 'per_period', 0, 0, '2003-05-28 05:27:20', '', '2005-08-14 17:31:08', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (35, 'header', 1, 0, '', '', 'D', 'total', 0, 0, '2001-11-24 08:43:49', '', '1985-09-11 23:47:32', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (36, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '2009-03-13 21:59:09', '', '1992-09-04 16:02:26', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (37, 'line', 1, 0, '', '', 'D', 'total', 0, 0, '2008-09-17 02:10:37', '', '1995-12-05 00:33:47', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (38, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '1977-03-22 14:44:27', '', '1982-07-10 08:08:21', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (39, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '1998-12-13 11:47:26', '', '1975-09-03 12:01:42', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (40, 'line', 1, 0, '', '', 'D', 'total', 0, 0, '1991-04-18 21:33:02', '', '1984-10-31 00:13:33', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (41, 'header', 0, 0, '', '', 'C', 'C', 0, 0, '1991-08-21 02:42:06', '', '1990-04-23 18:53:58', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (42, 'header', 0, 0, '', '', 'C', 'C', 0, 0, '1972-09-22 01:21:14', '', '1980-01-10 19:46:07', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (43, 'line', 0, 0, '', '', 'C', 'total', 0, 0, '1992-04-12 15:09:06', '', '2019-09-27 12:58:36', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (44, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '2020-06-23 22:51:47', '', '1970-12-30 10:44:21', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (45, 'line', 1, 0, '', '', 'D', 'C', 0, 0, '1994-10-22 13:09:49', '', '2006-05-27 07:05:40', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (46, 'header', 0, 0, '', '', 'D', 'D', 0, 0, '2003-11-19 22:36:53', '', '1973-10-15 18:17:25', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (47, 'line', 0, 0, '', '', 'D', 'per_period', 0, 0, '1987-10-09 03:24:15', '', '2005-08-25 14:17:18', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (48, 'header', 0, 0, '', '', 'D', 'D', 0, 0, '2009-11-15 12:21:53', '', '1998-03-21 03:05:43', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (49, 'line', 0, 0, '', '', 'C', 'D', 0, 0, '2019-06-10 01:17:26', '', '2022-09-05 18:46:01', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (50, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '2018-04-13 15:52:29', '', '1977-03-29 23:16:46', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (51, 'header', 0, 0, '', '', 'C', 'C', 0, 0, '2007-03-03 22:59:28', '', '1984-10-03 12:29:58', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (52, 'header', 1, 0, '', '', 'C', 'total', 0, 0, '1976-10-31 15:11:18', '', '1992-01-15 10:34:54', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (53, 'line', 0, 0, '', '', 'C', 'C', 0, 0, '1988-09-18 09:14:27', '', '1988-12-04 19:26:11', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (54, 'header', 0, 0, '', '', 'C', 'total', 0, 0, '1986-07-29 12:55:43', '', '1974-11-25 06:15:52', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (55, 'header', 1, 0, '', '', 'C', 'per_period', 0, 0, '2011-05-08 14:44:39', '', '2003-12-10 05:19:44', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (56, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '2002-03-03 05:28:21', '', '1981-05-24 07:08:47', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (57, 'line', 1, 0, '', '', 'C', 'total', 0, 0, '1985-02-18 22:28:45', '', '1974-10-10 03:09:42', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (58, 'line', 0, 0, '', '', 'D', 'C', 0, 0, '1998-05-04 14:35:57', '', '2020-01-03 21:27:22', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (59, 'line', 1, 0, '', '', 'D', 'C', 0, 0, '1973-02-07 02:57:39', '', '2022-12-11 08:25:17', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (60, 'line', 0, 0, '', '', 'D', 'total', 0, 0, '2021-08-18 09:25:54', '', '1979-11-07 01:08:24', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (61, 'line', 1, 0, '', '', 'C', 'per_period', 0, 0, '1990-11-20 06:07:09', '', '2003-10-22 21:08:26', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (62, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '1982-06-24 16:14:44', '', '2012-10-05 06:15:09', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (63, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1993-12-13 11:19:20', '', '2002-07-28 10:14:58', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (64, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '2018-08-28 16:39:13', '', '2017-05-15 20:21:34', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (65, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '2002-03-22 04:11:21', '', '2015-04-11 20:59:25', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (66, 'header', 0, 0, '', '', 'C', 'D', 0, 0, '1973-07-13 21:21:47', '', '1977-02-09 08:39:45', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (67, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '1996-03-20 15:45:33', '', '1997-09-02 23:10:54', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (68, 'header', 0, 0, '', '', 'C', 'C', 0, 0, '1979-10-24 02:23:00', '', '2009-11-11 13:11:37', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (69, 'line', 0, 0, '', '', 'D', 'C', 0, 0, '2017-06-30 05:58:11', '', '1985-11-05 04:44:13', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (70, 'header', 0, 0, '', '', 'C', 'D', 0, 0, '1998-07-07 01:33:05', '', '1999-02-19 11:38:50', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (71, 'header', 0, 0, '', '', 'D', 'C', 0, 0, '1970-08-12 20:08:34', '', '2019-11-03 09:23:20', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (72, 'line', 1, 0, '', '', 'D', 'C', 0, 0, '2021-08-28 23:37:01', '', '1996-08-11 17:14:10', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (73, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '1989-03-19 04:52:21', '', '1972-03-04 23:00:39', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (74, 'header', 1, 0, '', '', 'D', 'total', 0, 0, '1971-07-27 12:45:44', '', '2020-04-05 04:44:17', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (75, 'header', 0, 0, '', '', 'D', 'D', 0, 0, '2008-09-06 20:06:02', '', '1992-01-10 15:58:43', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (76, 'line', 0, 0, '', '', 'D', 'D', 0, 0, '2001-01-28 02:25:06', '', '1971-03-18 00:45:25', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (77, 'header', 1, 0, '', '', 'D', 'D', 0, 0, '2014-06-24 20:14:07', '', '1985-04-13 05:22:13', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (78, 'line', 1, 0, '', '', 'C', 'D', 0, 0, '1997-01-26 21:57:01', '', '1972-12-04 12:25:04', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (79, 'line', 0, 0, '', '', 'D', 'per_period', 0, 0, '2019-03-13 14:13:33', '', '1987-07-07 21:44:57', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (80, 'header', 1, 0, '', '', 'D', 'D', 0, 0, '1971-11-02 02:21:32', '', '2005-12-14 05:06:22', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (81, 'header', 1, 0, '', '', 'C', 'D', 0, 0, '1994-09-23 03:18:36', '', '2011-10-17 03:56:54', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (82, 'header', 0, 0, '', '', 'D', 'total', 0, 0, '2002-01-07 09:09:50', '', '1981-10-17 10:24:38', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (83, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '1994-01-10 21:13:56', '', '1978-09-19 08:38:29', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (84, 'line', 0, 0, '', '', 'D', 'total', 0, 0, '1972-03-24 06:45:09', '', '1972-09-01 09:52:25', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (85, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1986-08-04 01:48:26', '', '2011-10-07 07:19:02', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (86, 'header', 1, 0, '', '', 'D', 'per_period', 0, 0, '1984-07-26 05:59:26', '', '2017-11-03 07:42:22', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (87, 'header', 1, 0, '', '', 'C', 'per_period', 0, 0, '1975-01-06 18:27:17', '', '2005-01-13 14:04:40', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (88, 'line', 1, 0, '', '', 'D', 'per_period', 0, 0, '1994-10-09 09:07:01', '', '1999-03-28 20:09:43', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (89, 'header', 0, 0, '', '', 'C', 'per_period', 0, 0, '1977-10-09 03:28:56', '', '1999-03-21 07:12:40', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (90, 'header', 0, 0, '', '', 'D', 'per_period', 0, 0, '2012-03-25 05:41:22', '', '1983-10-29 02:07:15', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (91, 'header', 1, 0, '', '', 'D', 'C', 0, 0, '1996-03-14 19:12:46', '', '1987-12-03 12:48:39', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (92, 'header', 1, 0, '', '', 'C', 'C', 0, 0, '1992-05-06 07:44:55', '', '1989-09-19 21:07:14', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (93, 'header', 0, 0, '', '', 'D', 'per_period', 0, 0, '1997-03-09 22:38:21', '', '2008-07-09 06:44:37', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (94, 'header', 0, 0, '', '', 'D', 'D', 0, 0, '2016-10-12 00:46:34', '', '1994-05-01 01:29:49', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (95, 'line', 1, 0, '', '', 'C', 'D', 0, 0, '2016-01-01 04:20:07', '', '1987-01-20 13:38:36', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (96, 'line', 0, 0, '', '', 'C', 'C', 0, 0, '2007-03-21 23:37:45', '', '1984-09-30 04:51:25', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (97, 'header', 0, 0, '', '', 'D', 'D', 0, 0, '2010-06-18 11:22:58', '', '2007-10-06 08:37:46', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (98, 'line', 1, 0, '', '', 'D', 'D', 0, 0, '1994-08-16 20:43:25', '', '2000-07-25 16:06:13', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (99, 'line', 1, 0, '', '', 'C', 'total', 0, 0, '2018-06-19 21:39:42', '', '1997-01-03 07:08:07', '');
INSERT INTO `cash_flow_lines` (`id`, `line_type`, `is_net_income`, `visible_index`, `printed_no`, `line_text`, `value_type`, `balance_type`, `left_index`, `right_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (100, 'line', 1, 0, '', '', 'C', 'total', 0, 0, '2009-02-18 16:01:06', '', '1973-05-31 21:56:54', '');


#
# TABLE STRUCTURE FOR: country_codes
#

DROP TABLE IF EXISTS `country_codes`;

CREATE TABLE `country_codes` (
  `id` char(2) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `country_codes` (`id`, `is_archived`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES ('', 0, '1981-11-22 00:36:46', '', '1973-01-19 13:57:54', '');


#
# TABLE STRUCTURE FOR: currency_codes
#

DROP TABLE IF EXISTS `currency_codes`;

CREATE TABLE `currency_codes` (
  `id` char(3) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `is_archived` tinyint(3) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `currency_codes` (`id`, `is_archived`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES ('', 0, '1996-05-31 14:38:03', '', '1998-08-22 06:28:00', '');


#
# TABLE STRUCTURE FOR: documents
#
DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_date` date NOT NULL,
  `document_no` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `document_comments` varchar(4000) NOT NULL,
  `internal_comments` varchar(500) NOT NULL,
  `document_type` smallint(5) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_document_date_idx` (`document_date`),
  KEY `documents_document_type_idx` (`document_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1000101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000001, '2002-08-27', '', 'Consequatur dolorem non non est consectetur dolores. Quia iste et voluptas officiis placeat fugit itaque. Temporibus laborum voluptatem porro voluptatibus non dicta. Eos reiciendis sint distinctio sit et voluptatem asperiores. Quis exercitationem excepturi et et qui tempora.', '', '', 0, '1986-07-30 05:46:29', '', '2020-03-28 22:56:15', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000002, '1978-01-26', '', 'Iste voluptatem itaque sit eaque sapiente et. Ipsa ipsa enim suscipit qui ad quidem. Magni saepe voluptatem voluptas incidunt.', '', '', 0, '1995-05-02 12:14:49', '', '1977-11-03 12:43:28', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000003, '2012-01-23', '', 'Repudiandae aut suscipit sit a. Aliquam voluptatem quisquam accusamus cum quas. Et quasi ut perspiciatis numquam. Nesciunt hic quia unde eveniet.', '', '', 0, '2000-08-11 22:41:23', '', '2013-05-14 08:21:33', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000004, '2014-04-11', '', 'Perspiciatis dignissimos voluptas similique suscipit eum excepturi hic eum. Unde pariatur velit temporibus perferendis et perspiciatis deleniti id. Sunt est architecto nihil pariatur enim facere. Eum unde non repellat vero distinctio nihil quos atque.', '', '', 0, '1991-10-02 20:51:50', '', '2007-02-27 08:06:28', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000005, '1979-10-17', '', 'Voluptatem voluptas qui soluta. Rem quae doloribus amet perspiciatis perspiciatis beatae. Et voluptas excepturi id sed perferendis a accusantium.', '', '', 0, '1972-06-12 05:20:30', '', '1997-10-04 05:26:43', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000006, '1979-09-23', '', 'Cum cumque dolor sit aut. Non minima dolore facere libero et excepturi sunt. Illum natus et sunt nostrum sit. Maiores beatae distinctio nemo.', '', '', 0, '1998-08-14 00:33:53', '', '2019-06-11 17:30:04', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000007, '2017-12-28', '', 'Dolores consequuntur dolor harum eius est a. Cumque amet aut consequatur rerum autem nihil. Aut quia accusamus optio rerum a est aut. Est labore et temporibus nihil in.', '', '', 0, '2014-11-06 13:55:54', '', '1970-08-23 00:38:47', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000008, '1993-05-04', '', 'Et sit eveniet qui laborum nostrum qui laboriosam. Dicta laboriosam a dolorem inventore. Aliquam quis commodi et quam rerum.', '', '', 0, '1981-07-06 07:32:47', '', '1982-08-04 07:01:43', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000009, '1997-12-04', '', 'Optio qui dolores autem. Libero dolores dolor animi ratione nemo aut consequuntur. Eveniet autem sed maxime. Porro reiciendis ipsam voluptates quae repudiandae dolorem alias ipsam. Dolorum doloremque iste voluptatem autem voluptatibus quo.', '', '', 0, '1988-05-24 17:58:37', '', '2007-09-15 03:05:48', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000010, '2009-12-25', '', 'Ipsum nesciunt itaque iste aut doloremque. Et occaecati et molestias iure aliquid. Expedita cumque autem facilis officiis.', '', '', 0, '1973-10-23 00:17:32', '', '2020-10-22 18:38:27', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000011, '2001-02-19', '', 'Ab dolore impedit eos. Voluptatem accusantium consequatur eligendi aut deserunt. Voluptatem dolores deserunt id nobis. Ipsam facere non totam et.', '', '', 0, '1973-12-14 23:57:30', '', '2019-06-19 05:53:10', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000012, '1975-05-30', '', 'Dolores nemo qui vero et ut. Aut ipsum velit aliquid incidunt. Incidunt voluptatem repellat nulla et quis et. Velit eum modi et inventore optio in. Ducimus molestias aut et porro ut.', '', '', 0, '2004-03-25 04:54:56', '', '2014-12-30 06:58:59', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000013, '1990-07-05', '', 'Ducimus ea ut consequatur consectetur fugiat repellendus aspernatur. Et ea consequatur omnis amet vero. Incidunt omnis ut vel voluptas sed perspiciatis. Omnis sunt deleniti eos officia distinctio quibusdam et.', '', '', 0, '1993-02-04 15:32:13', '', '1994-11-02 14:04:58', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000014, '1999-11-27', '', 'Eligendi est quia ut dicta illum. Dicta cumque architecto sapiente et quia non. Rem ut ut soluta quos. Ipsum molestias eaque quam fuga delectus.', '', '', 0, '2021-10-22 18:12:36', '', '1978-10-22 16:33:27', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000015, '2009-02-25', '', 'Quas nisi consequatur voluptatem dicta deserunt asperiores. Odit sunt aut beatae est architecto. Nemo magni quia perspiciatis voluptatem illo at modi. Qui illum eaque fuga non.', '', '', 0, '1988-11-28 08:31:10', '', '2007-08-18 09:30:21', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000016, '1980-02-21', '', 'Sunt repudiandae est at tempora molestiae veritatis nemo. Sint laboriosam possimus et reprehenderit. Eos esse pariatur accusamus modi omnis voluptas. Voluptatem pariatur occaecati quia recusandae reprehenderit aspernatur eligendi.', '', '', 0, '2023-05-02 10:09:01', '', '1976-08-25 12:17:25', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000017, '1986-07-25', '', 'Sit consequuntur aut quam beatae ullam dolores. Fugit odit ullam delectus est repellendus maxime. Asperiores dolores quidem architecto voluptatum. Temporibus similique minus dolores optio corporis porro repudiandae.', '', '', 0, '2021-09-20 16:40:58', '', '1995-10-27 07:33:54', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000018, '2014-03-24', '', 'Sed ut placeat fugiat a maxime amet. Voluptates quam sunt quia ut. Blanditiis quasi nobis illo quod qui corrupti tempore.', '', '', 0, '2020-11-14 21:30:41', '', '2022-04-24 04:19:42', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000019, '2016-04-11', '', 'Perferendis molestiae ad aspernatur laboriosam numquam. Non ad sit ut sit assumenda ea. Adipisci quibusdam voluptatibus et odit praesentium. Quos dolore assumenda nisi ullam eum.', '', '', 0, '1977-10-20 05:22:18', '', '2014-03-31 01:42:20', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000020, '1981-07-16', '', 'Eaque voluptate ut quas nihil blanditiis possimus. Nemo numquam porro assumenda eum repudiandae velit optio tempora. Sunt cum fuga libero voluptas vel ullam sed illo. Eveniet labore beatae facere mollitia sint est.', '', '', 0, '1993-09-30 18:08:35', '', '1995-01-05 05:18:28', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000021, '2023-06-25', '', 'Totam et qui reiciendis magnam ut aliquam ea commodi. Velit cupiditate laborum iusto qui. Qui sit autem non corporis.', '', '', 0, '2013-07-21 05:45:25', '', '2004-10-23 09:45:04', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000022, '2003-02-05', '', 'Neque ullam et non perspiciatis. Fuga quam in corporis neque dolorum. Sit dolorum voluptatem eos numquam.', '', '', 0, '2006-04-17 17:46:05', '', '2002-05-15 12:00:32', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000023, '2017-05-21', '', 'Id accusamus quasi doloribus aut eveniet. Eos sed quidem numquam totam nesciunt. Minus quae sed animi quasi. Tenetur officia reiciendis eum et rem illum veritatis.', '', '', 0, '1980-03-29 23:57:41', '', '1976-06-18 10:09:33', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000024, '1981-09-06', '', 'Autem magni ut aut sed qui vel dolores. Provident vitae odit vel. Et rerum aut et possimus. Recusandae incidunt nihil sapiente quaerat et pariatur aut.', '', '', 0, '1990-03-15 06:18:52', '', '1974-05-10 01:09:49', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000025, '2014-04-23', '', 'Dolore inventore nam natus. Vero est quisquam autem aspernatur. Enim similique et nulla rerum. Molestiae odit et odit nesciunt eos. Quo veniam quis voluptatem possimus.', '', '', 0, '1974-06-04 17:49:47', '', '2008-08-16 20:03:57', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000026, '2018-02-08', '', 'Doloribus libero dolor eos ex velit repellendus et. Qui ex cupiditate explicabo optio inventore.', '', '', 0, '1985-06-09 15:43:56', '', '1985-12-11 03:28:36', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000027, '1971-11-21', '', 'Est rerum animi ut expedita nisi quo aspernatur. Expedita vitae quae et iure odit. Corrupti quia cupiditate nobis. Neque aliquid molestiae est.', '', '', 0, '1997-05-31 03:42:10', '', '2008-06-19 18:06:31', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000028, '1975-09-27', '', 'Accusamus aut labore quo. In id ut animi odio. Et vitae iusto voluptas.', '', '', 0, '1973-03-29 17:39:40', '', '1991-04-25 21:04:40', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000029, '2022-03-21', '', 'Consequatur consequatur explicabo natus ducimus architecto libero. Quia eligendi itaque autem dicta facere aut nisi. Facere et repudiandae autem voluptates. Molestiae et quibusdam et et.', '', '', 0, '2001-05-22 22:35:59', '', '2006-10-31 12:39:06', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000030, '2002-01-27', '', 'Tempora non enim natus sed sed fuga voluptas. Ut fuga illo ratione sit pariatur laudantium. Rem consequatur alias beatae ut.', '', '', 0, '1998-12-28 15:39:46', '', '1978-02-06 18:20:10', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000031, '2022-04-22', '', 'Sunt rerum perspiciatis aut nihil. Voluptate amet ipsum qui pariatur cum quaerat ut ratione. Vitae non voluptatem dolorem quisquam expedita necessitatibus dolor.', '', '', 0, '1972-02-22 17:48:17', '', '1981-09-27 22:37:33', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000032, '1980-07-10', '', 'Sequi in nihil quis in sint tenetur. Maxime corrupti nulla vel. Veritatis explicabo numquam suscipit voluptatem.', '', '', 0, '1972-04-29 06:55:13', '', '1976-08-24 00:02:20', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000033, '2004-02-22', '', 'Quibusdam quia est quo aspernatur officiis laboriosam et. In facilis ex nemo ea deleniti. Fugiat incidunt eos magni velit aliquid ipsam commodi. Necessitatibus amet incidunt facere.', '', '', 0, '1971-04-02 18:29:49', '', '1979-03-05 17:34:31', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000034, '1979-01-27', '', 'Qui cupiditate ipsa et incidunt ullam facere aut. Rerum nemo molestias quo vel illum ut eum labore. Rerum saepe deleniti et. Similique aperiam pariatur vitae in voluptatem modi.', '', '', 0, '1998-09-20 15:44:06', '', '2014-06-25 23:51:00', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000035, '2014-01-19', '', 'Cumque aut omnis ipsa ipsam consequuntur. Saepe ratione ea quia magni et. Sunt modi itaque deleniti qui temporibus.', '', '', 0, '2004-02-23 23:19:04', '', '2015-09-07 01:35:09', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000036, '1990-08-19', '', 'Sapiente laboriosam voluptate sequi nisi corporis. Enim doloribus possimus quia dicta est. Voluptate laboriosam ut voluptatem aliquid aut corrupti.', '', '', 0, '2023-01-03 08:32:05', '', '1970-03-14 09:16:22', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000037, '2001-10-14', '', 'Earum voluptas iste quis nam molestias debitis repudiandae. Ab quisquam ipsam eos a eos eveniet saepe. Quos nobis eum voluptates illum et maxime. Nulla sit et ullam quia dolore voluptatem.', '', '', 0, '1980-04-19 22:22:44', '', '2023-01-13 19:04:26', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000038, '2008-05-28', '', 'Consequuntur est qui natus commodi provident. Nesciunt aliquam expedita dolorum dolor nisi incidunt accusamus dolorem. Amet quidem placeat eaque et.', '', '', 0, '2010-08-29 13:44:25', '', '2007-05-08 12:22:49', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000039, '1977-09-25', '', 'Ea cupiditate laudantium ut labore magni. Non nulla omnis soluta consequatur occaecati alias nulla. Suscipit harum et provident esse qui quod.', '', '', 0, '1981-07-16 09:29:57', '', '1992-06-12 18:19:48', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000040, '1983-07-29', '', 'Enim reiciendis odio in deleniti sit non itaque. Illum commodi molestiae excepturi provident iusto quasi quia. Vel nobis est voluptates quae. Adipisci soluta consectetur dolorem cupiditate quis est.', '', '', 0, '2017-11-14 03:43:07', '', '1996-09-12 06:54:50', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000041, '1996-04-30', '', 'Et amet repudiandae voluptates unde nihil deleniti non. Et impedit velit eum quo aliquid porro. Nihil quia ratione eum voluptates necessitatibus magni.', '', '', 0, '1999-01-22 19:16:20', '', '2023-02-10 06:01:54', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000042, '2002-08-19', '', 'Sint dolores placeat quia recusandae. Suscipit voluptatibus velit ut aliquam ea atque. Sapiente earum fugit quod voluptas.', '', '', 0, '1976-01-22 07:57:32', '', '1988-11-05 17:29:35', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000043, '2012-06-22', '', 'Harum unde earum aliquam delectus. Sed eius in suscipit voluptatem natus maxime. Enim delectus et earum. Cumque sit sit culpa molestiae.', '', '', 0, '1983-05-05 03:54:29', '', '1997-10-09 00:57:23', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000044, '1995-05-27', '', 'Beatae et porro enim harum accusamus est. Quia consequatur libero omnis velit harum animi molestiae.', '', '', 0, '2004-08-18 01:21:24', '', '1975-05-20 21:59:37', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000045, '2021-04-26', '', 'Sint ratione quo earum repudiandae et quo et sit. Eius necessitatibus sunt a perspiciatis. Cumque a quas error voluptatibus non. Enim ut impedit sed dolorem quisquam aut aut. Molestias quam vero vel suscipit animi assumenda.', '', '', 0, '2006-03-31 16:28:15', '', '1993-04-14 00:37:43', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000046, '2007-01-19', '', 'Corrupti occaecati explicabo cum sunt qui. Quam odit debitis error et nam dolores. Sed totam est minima tempora. Ut repellat sit non dolores et. Excepturi explicabo necessitatibus et nam exercitationem dolorum porro ad.', '', '', 0, '2019-09-06 09:21:15', '', '1976-05-03 19:31:18', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000047, '1999-04-06', '', 'Consequatur qui consequuntur numquam. Molestias voluptatem modi ipsam a ut et voluptatum. Quisquam nostrum sed est laborum voluptate quibusdam laborum.', '', '', 0, '2002-05-09 09:30:06', '', '2010-03-10 15:24:27', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000048, '2004-12-09', '', 'Rerum quam quod dignissimos corrupti quis. Necessitatibus necessitatibus ea suscipit aut quia. Architecto consequatur dignissimos rem error in quibusdam.', '', '', 0, '1971-08-29 14:54:39', '', '2000-12-08 08:31:34', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000049, '1993-06-16', '', 'Voluptas odit eum numquam temporibus. Quo eligendi perferendis molestiae aut et maxime. Molestiae quisquam laboriosam qui. Asperiores et esse aut ipsum perspiciatis quibusdam.', '', '', 0, '2008-11-27 04:03:30', '', '2011-07-01 16:23:41', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000050, '2005-09-05', '', 'Error quia at voluptatibus libero libero. Suscipit laboriosam ut cumque similique veritatis est officia. Sed minus facilis aperiam dolores est sint. Voluptates molestiae atque nemo aliquid corrupti aspernatur.', '', '', 0, '2015-02-28 15:01:02', '', '2023-06-16 17:55:04', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000051, '2005-12-15', '', 'Odio veniam et dolore voluptatem ducimus. Qui unde nisi nobis id dolorem molestiae. Quis est earum nulla.', '', '', 0, '1987-04-12 00:55:44', '', '1973-06-28 08:14:48', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000052, '2007-12-28', '', 'Magnam perferendis ex sed non dolorum. Sit labore et delectus ullam excepturi. Maiores est aut minima quis et.', '', '', 0, '1992-07-17 22:35:20', '', '1990-09-20 10:28:27', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000053, '1996-10-21', '', 'Doloribus dolor voluptas consectetur qui in nam ut. Voluptatem quasi maxime dolore et. Expedita suscipit eligendi et voluptas optio nostrum. Repellendus illum consectetur distinctio esse quasi delectus aut.', '', '', 0, '2005-02-26 22:47:40', '', '2022-03-03 00:45:18', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000054, '1974-12-19', '', 'Quo ut consequuntur dolorem ut quisquam consequatur qui dolores. Praesentium est et minus. Provident pariatur cupiditate illo saepe earum et. Accusamus itaque architecto omnis aperiam nostrum. Fuga deleniti qui voluptatem dolorem fugit dolores est.', '', '', 0, '1978-08-27 18:26:38', '', '1988-10-07 23:40:04', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000055, '1976-08-08', '', 'Possimus fuga nisi perspiciatis. Magnam ullam repudiandae velit ipsum cupiditate ex. Sed sunt officia sed error in.', '', '', 0, '2016-05-11 10:32:53', '', '2009-12-27 23:30:46', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000056, '1986-03-18', '', 'Optio hic voluptatem pariatur voluptas. Nulla ut sit eius veniam accusamus et. Qui assumenda nam qui. Laboriosam ullam adipisci quae. Quam pariatur maiores in enim.', '', '', 0, '1992-12-14 11:34:22', '', '2008-07-24 12:44:08', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000057, '1986-05-27', '', 'Ipsum ut error molestiae et aperiam. Dolorum id rerum nemo laboriosam. Qui est ipsa neque.', '', '', 0, '2014-08-28 04:46:55', '', '1992-02-03 23:31:23', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000058, '2000-07-21', '', 'Et est voluptatem id numquam quasi assumenda eos adipisci. Adipisci repellat aut voluptatem recusandae quaerat tempora. Magnam voluptatem eligendi veniam enim. Deleniti omnis tempore facere dolorem.', '', '', 0, '2019-07-23 02:18:46', '', '1982-12-18 17:19:47', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000059, '2016-11-12', '', 'Adipisci pariatur nihil quaerat consequatur voluptatem optio ab quia. Impedit optio perspiciatis sequi delectus consequatur optio impedit. Facilis doloremque est illo occaecati. Consequatur rerum tempora ut doloremque asperiores magnam consequatur. Ipsam quia minima in.', '', '', 0, '2017-02-12 19:35:26', '', '2010-05-04 21:49:25', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000060, '2002-10-05', '', 'Eligendi et minus sapiente aspernatur ipsa in. Error sunt beatae incidunt ut. Quia quas corrupti natus aspernatur sit.', '', '', 0, '1992-04-23 13:57:02', '', '2013-10-08 13:06:45', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000061, '1986-12-02', '', 'Reprehenderit omnis quidem quia iusto et. Sed saepe officia quis dolor. Molestiae maxime temporibus iste ducimus atque aut.', '', '', 0, '1974-07-13 08:03:15', '', '1998-09-10 13:32:19', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000062, '2015-07-20', '', 'Fugit aut id eum corrupti. Fugit accusamus nulla occaecati.', '', '', 0, '1986-10-18 12:36:48', '', '1970-02-18 03:31:37', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000063, '1997-11-19', '', 'Consequatur ullam magni corrupti ut dolores. Quaerat minima et harum quia quaerat quis unde. Ut vero earum assumenda cupiditate animi ipsum quod.', '', '', 0, '2006-08-24 23:15:45', '', '1990-03-24 23:57:54', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000064, '2015-09-23', '', 'Quod et ipsum ut est nemo ducimus. Ut fugiat similique sit ea fugit qui et. Voluptatum quaerat nostrum sapiente.', '', '', 0, '2007-08-24 17:20:14', '', '2018-05-31 07:42:53', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000065, '1991-08-10', '', 'Blanditiis ea qui quia praesentium sed qui cumque. Molestiae est quam officia fugit quidem eos.', '', '', 0, '1989-11-27 12:20:49', '', '1991-02-17 05:50:45', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000066, '1974-05-26', '', 'Pariatur voluptas itaque aut at. Libero et aperiam accusantium commodi sint nesciunt. Quas tenetur asperiores animi repellendus sapiente.', '', '', 0, '2002-07-02 15:51:33', '', '1970-01-02 18:19:45', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000067, '1987-06-23', '', 'Perspiciatis tempora doloribus nostrum aliquid. Aut perferendis deleniti dicta possimus sapiente iste fugit beatae. Magnam commodi unde dolore rerum sit quae voluptatem. Quod eum cumque dolor in libero dolorem nesciunt.', '', '', 0, '2012-07-22 14:41:04', '', '2016-06-28 06:45:34', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000068, '1992-09-15', '', 'Dicta quia provident officiis in. Voluptates veniam earum nihil et voluptatem repellat voluptatem. Accusantium dignissimos labore dolor consequatur occaecati omnis error. Error voluptatem qui in et iste blanditiis libero iure. Aliquam eveniet libero qui consectetur modi repellendus nihil.', '', '', 0, '1998-03-16 02:18:25', '', '1996-06-21 16:17:25', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000069, '2022-04-16', '', 'Commodi placeat accusamus necessitatibus hic exercitationem debitis. Distinctio eum recusandae rerum adipisci minus deserunt ut. Voluptatibus sequi temporibus dolores minus. Omnis autem minima sunt distinctio maiores id quis.', '', '', 0, '2011-09-12 10:25:45', '', '1985-08-21 15:47:31', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000070, '2003-03-29', '', 'Non quis consequatur voluptatem quia. Recusandae animi assumenda quod perspiciatis.', '', '', 0, '2008-10-28 07:50:53', '', '1999-01-21 15:19:56', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000071, '1992-08-20', '', 'Voluptas esse reprehenderit libero molestias vitae. Quasi est modi sit repudiandae optio. Asperiores repellendus dicta corporis porro dolor dolor.', '', '', 0, '2007-11-16 05:59:31', '', '1999-02-08 22:09:13', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000072, '2018-08-20', '', 'Nobis aut id vero cupiditate et ab. Perferendis aut odit nemo. Quia sed corrupti rerum ducimus facere veritatis quae quis. Animi omnis porro commodi facere aperiam hic aut.', '', '', 0, '2000-03-17 02:50:51', '', '1978-10-03 07:45:50', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000073, '2005-12-18', '', 'Illum pariatur id natus repellendus. Ut mollitia vitae eos. Praesentium in nulla nemo cumque qui.', '', '', 0, '1978-02-18 05:03:03', '', '2011-08-18 06:54:19', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000074, '2017-04-22', '', 'Aliquid qui maiores modi placeat ut. Ab illo quibusdam laboriosam voluptates sint. Illum qui non ut ullam velit dolorem. Assumenda magni aperiam delectus et et iure et.', '', '', 0, '1982-09-20 01:25:20', '', '2004-12-25 07:50:36', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000075, '2005-05-31', '', 'Recusandae quis error commodi aut velit omnis. Ipsam omnis excepturi molestiae ut quia porro molestiae. Alias maiores consequatur minus delectus.', '', '', 0, '2010-06-30 11:58:41', '', '1983-03-05 03:50:13', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000076, '1971-04-22', '', 'Similique nihil rerum vel debitis. Saepe ipsum pariatur veritatis quo. Non provident qui expedita.', '', '', 0, '2006-09-18 17:26:40', '', '2004-07-25 00:02:29', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000077, '1993-07-12', '', 'Dicta dolor sint a non quos rerum. Maiores corporis sequi provident mollitia. Odio consequatur itaque asperiores quaerat tempora non. Explicabo est omnis nihil sequi voluptas.', '', '', 0, '1978-08-15 12:38:14', '', '1999-10-25 07:58:02', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000078, '1996-06-15', '', 'Enim laborum consequatur amet non molestias. Officia facere aperiam et error. Officia vero culpa porro quia ut.', '', '', 0, '1986-01-29 23:08:07', '', '1997-03-10 15:19:53', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000079, '1992-05-25', '', 'Enim reiciendis ut corrupti. Nihil vel tenetur doloremque suscipit iure hic cum. Rem aut corporis similique numquam cum.', '', '', 0, '2012-09-24 04:24:02', '', '2002-10-26 13:31:14', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000080, '2017-07-19', '', 'Delectus vel ducimus nemo blanditiis natus et neque debitis. Qui exercitationem recusandae animi et laboriosam ipsum. Unde quasi deserunt quam ipsum rerum consectetur.', '', '', 0, '1995-03-08 04:36:22', '', '2014-08-10 10:51:20', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000081, '1990-04-15', '', 'Unde ipsa sunt nostrum. Quis optio velit dolor commodi.', '', '', 0, '2005-10-08 21:48:27', '', '1986-02-01 00:31:54', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000082, '2012-08-03', '', 'Totam placeat omnis illo aut alias ut. Temporibus dicta eos omnis porro autem fugiat mollitia. Molestias non et minus ullam aut aliquid ullam. Aliquid ut accusamus occaecati nesciunt voluptate error asperiores.', '', '', 0, '1971-12-11 12:14:17', '', '1987-01-08 13:43:51', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000083, '1980-10-10', '', 'Accusamus eveniet veniam debitis necessitatibus. Dignissimos temporibus et temporibus blanditiis. Incidunt quasi molestias optio velit dolores enim distinctio. Eveniet et deleniti consequatur at.', '', '', 0, '2011-07-18 20:43:02', '', '1975-02-05 05:45:44', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000084, '2021-04-06', '', 'Sit quia facilis aliquid itaque omnis natus. Dolores suscipit quo non vel modi quia. At officiis qui accusantium consectetur dolores. Sequi cupiditate placeat consequatur corrupti dolorem.', '', '', 0, '2007-08-06 02:01:10', '', '1988-08-06 22:52:34', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000085, '1997-01-05', '', 'Quisquam vitae commodi consequatur amet. Dicta eaque voluptas ea delectus sed atque. Debitis dolorem omnis voluptas aut est in ullam.', '', '', 0, '2008-11-06 06:41:14', '', '1996-01-19 15:57:57', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000086, '2000-04-04', '', 'Sed sed excepturi est architecto. Hic sint autem et et unde. Quod possimus quis facere a.', '', '', 0, '1999-07-24 16:37:42', '', '1983-02-27 18:16:59', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000087, '1974-10-17', '', 'Et tempore sed magni impedit dolor aut odit. Expedita sunt id quae libero excepturi maiores. Labore nobis non aperiam ut dolorum nesciunt nemo dolorem. Aliquam ab quia eum voluptatem numquam mollitia rem. Quasi ea quis voluptatem a.', '', '', 0, '2004-02-04 23:28:18', '', '1996-12-28 08:49:13', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000088, '1979-04-17', '', 'Incidunt vel est laboriosam minima aliquam. Ab aperiam repellendus est mollitia. Et iste esse iusto enim.', '', '', 0, '1982-08-29 08:25:48', '', '2009-03-29 16:20:35', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000089, '1990-07-28', '', 'Non omnis dolores eum doloribus quae excepturi nemo eaque. Voluptate ratione repudiandae molestiae nihil. Nemo aut ut est ut alias unde voluptatem tempora. Consequatur impedit occaecati pariatur qui enim nisi vitae.', '', '', 0, '1991-07-03 03:04:55', '', '2001-06-16 02:13:11', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000090, '1994-06-23', '', 'Magnam nam laborum in in nemo veritatis accusantium sed. Aperiam odio nihil et et labore error optio. Libero est amet beatae et aliquid.', '', '', 0, '1997-09-30 00:31:14', '', '1976-03-29 22:01:44', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000091, '1981-11-11', '', 'Repellendus quidem minima amet maxime beatae itaque nihil. Sint debitis molestias et atque consequatur molestias ad exercitationem. Voluptatum amet molestias aspernatur nihil adipisci adipisci. Dolor consectetur porro consequatur dolore iure odit qui.', '', '', 0, '1982-05-13 10:16:16', '', '2002-03-26 22:35:12', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000092, '1998-12-05', '', 'Necessitatibus ut est repudiandae aut eum. Culpa excepturi sit ullam tenetur quia qui.', '', '', 0, '1998-02-08 09:15:11', '', '1978-01-12 17:20:38', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000093, '2023-06-11', '', 'Saepe quam a placeat laboriosam voluptatem. Iure quasi qui est harum reiciendis. Tempore sed itaque nihil aperiam quo voluptas ea. Eligendi neque quo omnis eaque dolores quam consequatur.', '', '', 0, '1999-08-08 10:30:30', '', '2002-03-08 12:29:09', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000094, '1986-03-19', '', 'Voluptatum excepturi earum natus sequi temporibus fuga impedit. Consequatur earum optio illo maiores aut aut est. Sunt et natus voluptatibus sapiente nam recusandae.', '', '', 0, '2003-03-26 00:04:49', '', '2010-10-14 05:45:46', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000095, '1989-12-17', '', 'Expedita ipsam id quo nostrum sit alias quae sit. Qui ex tempora odit voluptate labore suscipit atque soluta. Minus commodi labore excepturi nobis ipsum. Ea veritatis est minus rerum.', '', '', 0, '2023-04-01 20:48:11', '', '2013-08-17 14:23:21', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000096, '1982-05-18', '', 'Sit nesciunt aut itaque ut ratione omnis perspiciatis. Quos et veniam culpa blanditiis soluta voluptatem unde eius. Voluptatem illo quis quod.', '', '', 0, '2001-11-25 03:46:14', '', '1971-08-04 05:59:08', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000097, '1984-08-24', '', 'Eum saepe ad aut laborum eum voluptatum. Qui fugit repellat et minus excepturi quia. Perspiciatis dolores omnis ipsam.', '', '', 0, '2006-03-05 16:16:20', '', '2015-12-24 21:31:05', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000098, '1994-12-09', '', 'Deserunt temporibus optio totam qui provident blanditiis aut. Autem ut dolor minus quia autem. Quisquam sequi tempore hic sequi sed exercitationem sit.', '', '', 0, '1972-10-31 17:37:44', '', '1975-06-30 10:32:47', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000099, '1992-09-18', '', 'Molestiae ratione dolores sed qui velit qui. Amet sed nobis sunt consequatur consequuntur. Nulla placeat vel voluptatem qui est.', '', '', 0, '2016-10-25 00:17:05', '', '1983-06-03 08:24:32', '');
INSERT INTO `documents` (`id`, `document_date`, `document_no`, `description`, `document_comments`, `internal_comments`, `document_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1000100, '2005-05-17', '', 'Voluptates non placeat nihil. Nulla et mollitia numquam eligendi aperiam saepe. Soluta aut dolorem neque dolore delectus. Aut quibusdam dolor saepe cupiditate corrupti.', '', '', 0, '1999-02-19 19:13:14', '', '2002-01-25 15:53:20', '');


#
# TABLE STRUCTURE FOR: equity_columns
#

DROP TABLE IF EXISTS `equity_columns`;

CREATE TABLE `equity_columns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `column_text` varchar(255) NOT NULL,
  `visible_index` int(10) unsigned NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equity_columns_visible_index_idx` (`visible_index`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1, '', 0, '1988-06-02 14:31:45', '', '1994-09-08 22:36:37', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (2, '', 0, '2018-05-22 07:20:36', '', '2021-04-21 23:39:12', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (3, '', 0, '1990-06-15 20:55:37', '', '1972-06-11 05:25:24', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (4, '', 0, '1972-03-06 13:35:22', '', '1978-11-26 23:33:29', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (5, '', 0, '2018-01-19 12:39:00', '', '2014-10-07 09:42:34', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (6, '', 0, '1996-09-17 07:20:20', '', '2014-11-25 19:32:28', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (7, '', 0, '2002-01-04 19:07:15', '', '2007-03-30 21:16:41', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (8, '', 0, '1972-08-22 15:53:33', '', '2003-10-25 16:01:30', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (9, '', 0, '2010-06-29 04:24:49', '', '2013-05-02 14:44:12', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (10, '', 0, '2021-03-31 07:50:31', '', '1972-09-15 18:24:53', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (11, '', 0, '1979-05-30 07:42:02', '', '2006-05-28 07:57:19', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (12, '', 0, '2001-09-24 02:12:11', '', '2016-10-10 20:23:12', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (13, '', 0, '2003-07-30 14:18:40', '', '2013-09-28 03:13:32', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (14, '', 0, '1975-07-25 02:02:34', '', '2018-11-17 11:38:45', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (15, '', 0, '1987-01-15 18:55:08', '', '2015-04-14 06:46:42', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (16, '', 0, '1983-12-02 10:05:36', '', '2014-05-18 13:08:33', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (17, '', 0, '1980-12-21 21:13:55', '', '1977-09-30 09:06:13', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (18, '', 0, '2017-02-14 18:20:25', '', '2022-11-25 15:46:11', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (19, '', 0, '1993-07-08 12:46:22', '', '1996-11-22 07:09:31', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (20, '', 0, '1975-02-07 06:15:27', '', '2022-09-16 09:50:32', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (21, '', 0, '2013-04-21 23:38:24', '', '1989-02-04 13:12:31', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (22, '', 0, '1984-07-08 07:49:05', '', '2000-11-23 05:33:12', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (23, '', 0, '2006-02-13 22:39:09', '', '2002-10-05 02:43:06', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (24, '', 0, '2013-02-25 12:52:22', '', '2005-01-21 03:43:01', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (25, '', 0, '1988-08-03 15:01:46', '', '1971-02-10 07:52:15', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (26, '', 0, '2007-09-26 20:26:23', '', '1989-06-05 22:06:20', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (27, '', 0, '1995-01-09 12:19:15', '', '2016-08-31 13:29:56', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (28, '', 0, '2014-01-09 02:02:05', '', '1992-08-04 17:59:26', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (29, '', 0, '1980-09-12 02:31:06', '', '2002-02-12 06:53:03', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (30, '', 0, '2008-11-25 16:38:05', '', '2002-04-16 14:53:07', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (31, '', 0, '2011-09-10 12:38:56', '', '1989-05-22 11:02:54', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (32, '', 0, '2012-03-23 08:24:28', '', '1982-06-08 22:42:25', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (33, '', 0, '1996-02-01 20:07:29', '', '1990-07-16 20:09:02', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (34, '', 0, '1970-02-27 18:21:02', '', '2006-03-09 13:58:34', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (35, '', 0, '2005-12-03 12:57:19', '', '2007-01-17 18:55:20', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (36, '', 0, '1983-04-19 06:25:10', '', '1982-01-08 16:13:06', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (37, '', 0, '1972-09-10 05:45:08', '', '1997-02-21 00:28:08', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (38, '', 0, '1990-02-20 06:55:28', '', '1976-11-13 22:18:14', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (39, '', 0, '2012-02-13 06:39:48', '', '2012-03-10 23:25:30', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (40, '', 0, '1981-10-20 04:43:00', '', '1988-10-29 04:21:34', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (41, '', 0, '1979-11-10 17:32:40', '', '2018-03-15 01:18:50', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (42, '', 0, '2007-03-19 01:35:24', '', '2006-02-16 07:09:03', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (43, '', 0, '1986-05-13 19:14:27', '', '1975-08-09 07:55:36', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (44, '', 0, '1970-12-20 21:15:04', '', '1975-08-06 10:01:49', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (45, '', 0, '1987-05-05 01:22:58', '', '1999-08-19 03:28:12', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (46, '', 0, '1990-04-25 07:21:13', '', '1979-02-23 20:50:05', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (47, '', 0, '2014-12-01 09:07:44', '', '2010-04-19 09:11:00', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (48, '', 0, '2013-12-04 09:22:58', '', '1995-06-02 15:47:54', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (49, '', 0, '1988-09-08 02:07:59', '', '1971-04-29 09:13:17', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (50, '', 0, '1982-07-26 14:30:21', '', '1974-05-22 00:54:42', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (51, '', 0, '2021-02-13 16:38:59', '', '2003-11-21 10:13:55', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (52, '', 0, '1992-05-12 04:23:39', '', '1991-12-23 03:03:11', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (53, '', 0, '1974-12-08 13:57:46', '', '1979-02-24 00:03:10', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (54, '', 0, '1971-06-03 23:13:06', '', '2001-11-07 22:09:13', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (55, '', 0, '1990-01-31 02:05:24', '', '1993-02-25 04:40:34', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (56, '', 0, '1972-08-25 14:46:23', '', '1999-08-30 17:26:52', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (57, '', 0, '2017-07-05 06:24:04', '', '2002-07-31 14:46:16', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (58, '', 0, '2019-09-17 10:42:31', '', '2013-12-22 01:00:00', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (59, '', 0, '1979-08-05 13:05:34', '', '2019-07-14 04:59:04', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (60, '', 0, '2008-01-14 16:57:11', '', '1971-07-16 02:46:37', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (61, '', 0, '1995-01-05 07:45:02', '', '2010-08-30 07:18:56', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (62, '', 0, '1978-11-15 17:05:18', '', '1995-12-12 01:31:19', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (63, '', 0, '2001-03-01 08:36:02', '', '2007-12-07 03:29:33', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (64, '', 0, '2008-01-07 01:52:58', '', '2015-10-02 12:45:27', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (65, '', 0, '2019-04-23 05:59:09', '', '1982-12-04 02:34:43', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (66, '', 0, '1975-06-11 19:47:22', '', '2001-07-15 01:07:00', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (67, '', 0, '1980-05-22 20:59:33', '', '2021-01-16 12:43:18', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (68, '', 0, '1974-03-24 05:28:53', '', '1985-11-18 23:56:14', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (69, '', 0, '2010-04-16 00:49:54', '', '1992-08-26 05:13:01', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (70, '', 0, '1991-02-25 05:32:39', '', '1971-08-25 20:06:52', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (71, '', 0, '2017-12-31 05:31:46', '', '1973-07-03 23:43:09', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (72, '', 0, '1990-01-23 01:07:15', '', '1989-11-21 14:11:17', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (73, '', 0, '1981-10-16 07:13:56', '', '2016-02-11 03:32:45', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (74, '', 0, '1975-04-10 01:01:09', '', '2013-09-13 06:07:33', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (75, '', 0, '2018-08-31 07:36:31', '', '2012-10-28 21:02:45', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (76, '', 0, '1978-11-30 21:24:52', '', '2001-11-06 10:34:40', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (77, '', 0, '1972-09-10 15:58:25', '', '1986-05-08 07:18:23', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (78, '', 0, '2013-04-16 04:24:10', '', '2005-09-08 16:52:09', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (79, '', 0, '2001-07-12 16:31:39', '', '2011-12-01 08:38:28', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (80, '', 0, '1975-12-13 17:38:39', '', '2013-07-17 20:52:47', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (81, '', 0, '2008-07-31 20:45:34', '', '2006-04-09 00:32:11', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (82, '', 0, '1989-10-28 04:05:35', '', '2011-01-21 12:23:23', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (83, '', 0, '1981-06-22 10:16:19', '', '1981-12-09 13:26:26', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (84, '', 0, '2000-09-07 14:32:53', '', '2007-02-28 09:27:28', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (85, '', 0, '1990-09-11 09:23:46', '', '2021-06-02 02:07:48', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (86, '', 0, '1998-01-18 13:57:58', '', '2006-06-22 13:00:11', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (87, '', 0, '1986-04-26 10:41:17', '', '2008-06-27 14:46:17', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (88, '', 0, '2015-09-24 05:59:28', '', '2021-09-17 23:21:53', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (89, '', 0, '2022-10-05 21:14:36', '', '2001-07-22 21:42:41', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (90, '', 0, '1997-09-26 09:39:39', '', '2006-06-24 10:49:56', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (91, '', 0, '1993-02-18 00:23:38', '', '2006-04-13 16:06:36', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (92, '', 0, '2009-06-09 21:03:02', '', '1994-02-23 18:46:31', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (93, '', 0, '1989-12-28 14:29:30', '', '2018-06-15 00:28:48', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (94, '', 0, '1994-07-16 20:49:36', '', '1983-09-24 06:21:07', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (95, '', 0, '1972-09-01 17:26:53', '', '2018-03-17 13:07:28', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (96, '', 0, '2011-08-24 16:48:12', '', '1989-01-09 15:08:16', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (97, '', 0, '1981-01-25 17:21:43', '', '1997-01-21 11:34:31', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (98, '', 0, '1999-10-19 05:38:20', '', '1989-07-14 13:00:48', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (99, '', 0, '2008-08-10 02:55:09', '', '2004-02-23 00:13:34', '');
INSERT INTO `equity_columns` (`id`, `column_text`, `visible_index`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (100, '', 0, '2005-09-18 13:58:34', '', '2022-04-04 01:20:22', '');


#
# TABLE STRUCTURE FOR: equity_line_assignments
#

DROP TABLE IF EXISTS `equity_line_assignments`;

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (1, 1, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (2, 2, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (3, 3, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (4, 4, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (5, 5, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (6, 6, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (7, 7, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (8, 8, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (9, 9, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (10, 10, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (11, 11, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (12, 12, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (13, 13, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (14, 14, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (15, 15, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (16, 16, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (17, 17, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (18, 18, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (19, 19, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (20, 20, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (21, 21, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (22, 22, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (23, 23, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (24, 24, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (25, 25, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (26, 26, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (27, 27, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (28, 28, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (29, 29, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (30, 30, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (31, 31, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (32, 32, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (33, 33, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (34, 34, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (35, 35, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (36, 36, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (37, 37, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (38, 38, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (39, 39, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (40, 40, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (41, 41, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (42, 42, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (43, 43, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (44, 44, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (45, 45, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (46, 46, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (47, 47, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (48, 48, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (49, 49, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (50, 50, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (51, 51, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (52, 52, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (53, 53, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (54, 54, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (55, 55, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (56, 56, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (57, 57, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (58, 58, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (59, 59, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (60, 60, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (61, 61, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (62, 62, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (63, 63, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (64, 64, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (65, 65, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (66, 66, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (67, 67, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (68, 68, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (69, 69, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (70, 70, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (71, 71, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (72, 72, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (73, 73, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (74, 74, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (75, 75, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (76, 76, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (77, 77, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (78, 78, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (79, 79, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (80, 80, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (81, 81, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (82, 82, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (83, 83, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (84, 84, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (85, 85, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (86, 86, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (87, 87, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (88, 88, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (89, 89, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (90, 90, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (91, 91, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (92, 92, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (93, 93, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (94, 94, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (95, 95, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (96, 96, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (97, 97, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (98, 98, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (99, 99, 0, '');
INSERT INTO `equity_line_assignments` (`id`, `equity_line_id`, `document_type`, `extended_document_type_id`) VALUES (100, 100, 0, '');


#
# TABLE STRUCTURE FOR: equity_lines
#
select * from equity_lines;
DROP TABLE IF EXISTS `equity_lines`;

CREATE TABLE `equity_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visible_index` int(10) unsigned NOT NULL,
  `printed_no` varchar(20) NOT NULL,
  `line_text` varchar(255) NOT NULL,
  `line_type` enum('initial_balance','cumulative_delta','zero_balance','first_delta','first_balance','second_delta','second_balance') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equity_lines_visible_index_idx` (`visible_index`),
  KEY `equity_lines_line_type_idx` (`line_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (1, 0, '', '', 'second_balance', '2021-10-09 08:51:45', '', '2022-07-30 23:54:07', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (2, 0, '', '', 'cumulative_delta', '1970-03-24 17:49:32', '', '1981-01-08 09:48:56', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (3, 0, '', '', 'initial_balance', '1984-06-08 23:20:47', '', '1976-03-29 12:45:51', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (4, 0, '', '', 'first_delta', '2017-05-26 16:31:51', '', '1987-10-08 02:43:52', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (5, 0, '', '', 'initial_balance', '1986-05-19 09:48:52', '', '1970-02-21 21:06:07', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (6, 0, '', '', 'second_balance', '1997-01-01 04:41:27', '', '2001-01-09 21:49:40', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (7, 0, '', '', 'first_delta', '2004-04-06 21:17:23', '', '1985-06-06 18:25:08', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (8, 0, '', '', 'first_balance', '2022-11-03 09:39:51', '', '1977-10-15 18:50:33', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (9, 0, '', '', 'cumulative_delta', '2002-02-05 01:31:58', '', '1975-07-19 17:08:23', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (10, 0, '', '', 'initial_balance', '1992-09-22 15:47:48', '', '1970-04-22 15:44:45', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (11, 0, '', '', 'zero_balance', '1980-05-22 07:45:04', '', '1974-08-20 22:47:53', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (12, 0, '', '', 'second_balance', '1987-01-09 23:51:36', '', '2018-11-11 23:27:35', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (13, 0, '', '', 'second_delta', '1981-07-21 23:07:37', '', '2013-12-04 17:17:21', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (14, 0, '', '', 'initial_balance', '2010-03-30 18:08:37', '', '1973-02-01 02:55:40', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (15, 0, '', '', 'initial_balance', '2020-07-23 13:36:29', '', '2012-02-05 07:09:34', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (16, 0, '', '', 'initial_balance', '1971-11-13 08:35:01', '', '2005-04-06 17:35:55', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (17, 0, '', '', 'second_delta', '2011-08-21 04:31:46', '', '2010-04-18 13:59:24', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (18, 0, '', '', 'initial_balance', '1988-01-29 20:46:10', '', '1971-03-04 00:23:18', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (19, 0, '', '', 'initial_balance', '1984-12-13 03:31:44', '', '2010-07-09 13:04:53', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (20, 0, '', '', 'second_delta', '2003-07-19 06:28:10', '', '1977-06-07 19:32:42', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (21, 0, '', '', 'first_balance', '1987-07-02 01:48:40', '', '2008-02-29 01:59:09', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (22, 0, '', '', 'first_balance', '1995-03-08 02:15:51', '', '2021-06-05 15:16:09', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (23, 0, '', '', 'initial_balance', '1992-07-16 14:08:27', '', '1974-01-15 03:48:04', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (24, 0, '', '', 'first_delta', '2012-03-21 20:11:36', '', '1992-06-01 04:25:42', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (25, 0, '', '', 'first_delta', '1984-05-13 08:16:37', '', '1977-12-09 03:55:32', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (26, 0, '', '', 'first_delta', '1990-06-06 22:54:37', '', '1975-11-15 15:54:01', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (27, 0, '', '', 'second_delta', '1977-10-21 23:24:48', '', '2014-10-08 07:54:49', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (28, 0, '', '', 'initial_balance', '2016-06-03 11:10:36', '', '1997-02-14 07:11:11', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (29, 0, '', '', 'second_delta', '1994-06-11 14:35:12', '', '1988-04-02 16:27:10', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (30, 0, '', '', 'zero_balance', '2021-08-28 10:42:11', '', '1981-07-15 20:01:03', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (31, 0, '', '', 'second_delta', '1990-05-21 04:14:20', '', '1992-12-23 16:38:02', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (32, 0, '', '', 'first_balance', '2018-01-31 10:21:09', '', '2014-06-14 18:59:05', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (33, 0, '', '', 'first_balance', '1988-03-14 00:52:17', '', '2006-06-19 09:56:39', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (34, 0, '', '', 'second_delta', '2004-03-14 05:38:21', '', '1992-04-24 01:49:19', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (35, 0, '', '', 'first_delta', '2008-11-30 02:04:03', '', '1987-09-23 02:24:18', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (36, 0, '', '', 'second_delta', '2013-02-28 23:57:47', '', '2019-01-20 21:35:37', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (37, 0, '', '', 'first_delta', '1995-07-16 06:09:52', '', '2010-08-28 19:24:16', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (38, 0, '', '', 'second_delta', '2017-09-28 21:20:10', '', '2007-02-08 19:47:14', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (39, 0, '', '', 'first_balance', '1975-06-27 11:14:28', '', '2001-07-12 00:49:56', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (40, 0, '', '', 'second_balance', '1990-03-10 23:35:30', '', '1982-09-22 14:06:29', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (41, 0, '', '', 'second_balance', '2017-12-22 13:37:53', '', '2002-06-13 11:16:53', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (42, 0, '', '', 'first_balance', '2018-05-04 03:21:35', '', '2019-06-24 14:14:26', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (43, 0, '', '', 'cumulative_delta', '1991-06-02 11:13:09', '', '2020-04-04 02:54:10', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (44, 0, '', '', 'zero_balance', '1977-02-03 09:21:06', '', '1975-11-24 13:16:13', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (45, 0, '', '', 'cumulative_delta', '2011-11-23 01:20:01', '', '2023-06-18 19:11:58', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (46, 0, '', '', 'second_balance', '1995-05-09 21:51:07', '', '2004-05-26 00:34:06', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (47, 0, '', '', 'initial_balance', '2001-04-22 14:27:36', '', '1977-03-14 15:42:24', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (48, 0, '', '', 'initial_balance', '1986-05-01 06:44:29', '', '1972-11-26 19:57:42', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (49, 0, '', '', 'cumulative_delta', '2001-04-20 03:53:17', '', '2018-01-20 16:01:17', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (50, 0, '', '', 'initial_balance', '1994-03-28 16:32:07', '', '1981-12-31 13:35:06', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (51, 0, '', '', 'second_delta', '2005-08-14 02:34:25', '', '2022-05-08 21:42:14', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (52, 0, '', '', 'cumulative_delta', '1985-07-05 03:16:46', '', '2015-03-03 00:08:17', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (53, 0, '', '', 'cumulative_delta', '1988-11-19 08:45:29', '', '2007-01-25 10:57:20', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (54, 0, '', '', 'zero_balance', '1974-07-03 08:30:31', '', '1971-05-31 20:50:48', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (55, 0, '', '', 'cumulative_delta', '1982-03-28 08:09:38', '', '1981-01-19 01:30:47', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (56, 0, '', '', 'zero_balance', '1991-04-12 05:48:09', '', '2003-05-09 21:16:59', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (57, 0, '', '', 'second_balance', '2000-09-16 12:16:40', '', '2012-01-15 11:37:11', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (58, 0, '', '', 'second_delta', '1970-09-06 02:41:01', '', '2023-07-01 15:02:47', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (59, 0, '', '', 'initial_balance', '1971-08-16 03:29:41', '', '1971-10-15 23:31:48', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (60, 0, '', '', 'initial_balance', '2020-12-12 17:16:39', '', '1979-09-13 02:40:27', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (61, 0, '', '', 'second_balance', '1975-10-21 12:31:36', '', '2006-05-04 03:34:54', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (62, 0, '', '', 'zero_balance', '2011-01-30 01:47:37', '', '2020-09-17 15:12:30', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (63, 0, '', '', 'second_balance', '2003-05-21 12:09:11', '', '2004-11-05 22:21:12', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (64, 0, '', '', 'cumulative_delta', '2007-12-16 19:55:48', '', '1982-04-19 12:51:34', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (65, 0, '', '', 'zero_balance', '1976-08-20 17:28:23', '', '1994-12-28 09:28:38', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (66, 0, '', '', 'zero_balance', '1993-01-11 15:23:04', '', '2022-01-20 03:26:50', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (67, 0, '', '', 'first_delta', '1998-07-22 06:51:00', '', '2002-04-16 08:18:16', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (68, 0, '', '', 'second_delta', '2014-05-25 18:42:16', '', '1972-08-24 08:32:02', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (69, 0, '', '', 'initial_balance', '2019-08-30 07:27:17', '', '2020-08-16 12:49:18', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (70, 0, '', '', 'first_balance', '1998-02-24 08:34:58', '', '2022-01-30 02:57:40', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (71, 0, '', '', 'first_balance', '2020-11-16 03:25:29', '', '1973-05-26 15:38:54', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (72, 0, '', '', 'first_balance', '1982-02-26 15:49:44', '', '1999-04-03 15:01:54', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (73, 0, '', '', 'first_delta', '1992-07-07 16:31:33', '', '1998-10-08 16:48:43', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (74, 0, '', '', 'second_delta', '2003-03-23 10:48:51', '', '2018-11-25 04:25:05', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (75, 0, '', '', 'zero_balance', '1988-01-03 07:52:32', '', '2012-11-18 15:15:23', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (76, 0, '', '', 'second_delta', '2000-11-26 13:47:21', '', '1972-10-03 19:04:06', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (77, 0, '', '', 'first_balance', '1999-12-23 21:04:14', '', '1980-04-06 04:38:26', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (78, 0, '', '', 'first_balance', '1991-05-24 05:05:23', '', '2018-03-04 10:38:37', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (79, 0, '', '', 'zero_balance', '1984-09-28 16:20:56', '', '1977-04-23 10:53:58', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (80, 0, '', '', 'zero_balance', '2018-01-04 15:13:17', '', '1987-11-30 20:51:54', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (81, 0, '', '', 'zero_balance', '2001-05-01 00:33:15', '', '1987-09-21 16:41:40', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (82, 0, '', '', 'second_balance', '1988-11-17 16:52:41', '', '1983-06-11 11:18:13', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (83, 0, '', '', 'first_delta', '1984-04-12 00:11:32', '', '2009-04-10 20:14:07', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (84, 0, '', '', 'first_delta', '1973-08-02 10:06:15', '', '1994-11-20 13:11:01', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (85, 0, '', '', 'second_delta', '1974-01-15 16:18:41', '', '1993-02-20 04:12:09', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (86, 0, '', '', 'zero_balance', '2000-11-10 23:23:03', '', '2007-06-01 03:43:28', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (87, 0, '', '', 'initial_balance', '2008-06-10 07:54:59', '', '1997-06-28 20:49:43', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (88, 0, '', '', 'second_balance', '1972-03-30 13:13:16', '', '1979-01-07 17:14:05', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (89, 0, '', '', 'first_delta', '1986-03-08 18:42:40', '', '2004-02-23 17:39:59', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (90, 0, '', '', 'second_delta', '1991-05-03 22:44:35', '', '2006-05-13 15:23:00', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (91, 0, '', '', 'first_delta', '2010-05-07 08:54:07', '', '1978-12-04 14:36:01', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (92, 0, '', '', 'second_balance', '2011-01-12 21:51:29', '', '2015-01-27 11:21:12', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (93, 0, '', '', 'first_delta', '2016-11-04 18:59:55', '', '2015-08-27 23:55:02', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (94, 0, '', '', 'initial_balance', '2022-07-21 14:48:26', '', '1975-12-05 07:49:27', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (95, 0, '', '', 'cumulative_delta', '2003-09-22 02:44:09', '', '1987-01-30 20:24:58', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (96, 0, '', '', 'first_delta', '1995-12-26 00:56:50', '', '1977-04-09 21:04:43', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (97, 0, '', '', 'initial_balance', '1975-07-11 10:41:05', '', '1988-09-14 07:47:30', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (98, 0, '', '', 'first_delta', '1990-11-01 21:28:45', '', '1972-05-19 04:43:23', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (99, 0, '', '', 'first_delta', '1997-12-20 01:29:27', '', '2020-09-07 03:31:40', '');
INSERT INTO `equity_lines` (`id`, `visible_index`, `printed_no`, `line_text`, `line_type`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`) VALUES (100, 0, '', '', 'initial_balance', '2003-01-23 20:58:54', '', '2009-01-30 20:48:01', '');


#
# TABLE STRUCTURE FOR: extended_document_types
#

DROP TABLE IF EXISTS `extended_document_types`;

CREATE TABLE `extended_document_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `fallback_document_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_document_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_document_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `extended_document_types` (`id`, `extension_id`, `type_name`, `fallback_document_type`) VALUES ('', 1, 'expedita', 0);


#
# TABLE STRUCTURE FOR: extended_fixed_assets_operation_types
#

DROP TABLE IF EXISTS `extended_fixed_assets_operation_types`;

CREATE TABLE `extended_fixed_assets_operation_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `fallback_fixed_assets_operation_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_fixed_assets_operation_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_fixed_assets_operation_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `extended_fixed_assets_operation_types` (`id`, `extension_id`, `type_name`, `fallback_fixed_assets_operation_type`) VALUES ('', 1, 'quia', 0);


#
# TABLE STRUCTURE FOR: extended_inventory_operation_types
#

DROP TABLE IF EXISTS `extended_inventory_operation_types`;

CREATE TABLE `extended_inventory_operation_types` (
  `id` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `fallback_inventory_operation_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extended_inventory_operation_types_extension_id_fk` (`extension_id`),
  CONSTRAINT `extended_inventory_operation_types_extension_id_fk` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `extended_inventory_operation_types` (`id`, `extension_id`, `type_name`, `fallback_inventory_operation_type`) VALUES ('', 1, 'repellat', 0);


#
# TABLE STRUCTURE FOR: extensions
#

DROP TABLE IF EXISTS `extensions`;

CREATE TABLE `extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension_guid` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `extension_name` varchar(255) NOT NULL,
  `extension_version` varchar(20) NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `uninstalled_at` datetime DEFAULT NULL,
  `uninstalled_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (1, '', 'qui', '', '1971-09-27 05:42:56', '', '2020-09-06 01:16:10', '', '1996-06-07 16:11:43', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (2, '', 'earum', '', '1992-08-11 08:19:16', '', '1981-01-11 22:54:16', '', '2016-08-02 03:45:53', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (3, '', 'sit', '', '2013-07-05 00:48:32', '', '2016-12-21 00:29:45', '', '1981-11-04 13:48:02', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (4, '', 'unde', '', '2012-11-05 14:24:58', '', '2016-01-04 12:59:25', '', '1974-06-17 05:17:47', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (5, '', 'quod', '', '2002-07-05 07:32:03', '', '1987-04-27 13:29:28', '', '1979-10-18 13:17:22', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (6, '', 'sint', '', '2016-02-25 12:48:53', '', '1979-11-13 19:24:48', '', '1994-06-17 22:52:12', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (7, '', 'labore', '', '2012-02-15 13:11:47', '', '2019-02-21 09:08:47', '', '1993-07-24 09:21:15', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (8, '', 'dignissimos', '', '1985-03-21 16:02:24', '', '1972-08-21 05:43:37', '', '1974-06-30 20:34:51', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (9, '', 'qui', '', '1998-04-19 14:59:31', '', '1986-05-20 19:57:47', '', '1982-02-04 16:08:34', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (10, '', 'laborum', '', '2021-01-23 15:39:32', '', '2010-05-24 04:33:55', '', '1986-09-04 19:29:00', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (11, '', 'est', '', '1971-08-23 01:37:28', '', '2022-12-26 07:50:45', '', '2006-10-05 14:55:03', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (12, '', 'provident', '', '1974-04-22 13:37:34', '', '2011-01-22 12:37:07', '', '1977-01-08 15:12:46', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (13, '', 'nam', '', '2011-09-20 17:49:17', '', '1998-08-01 22:46:21', '', '1987-11-18 05:26:27', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (14, '', 'praesentium', '', '1980-11-06 16:44:24', '', '1998-08-20 01:02:37', '', '2007-05-07 22:48:09', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (15, '', 'consequatur', '', '1977-10-01 05:38:22', '', '2005-05-26 15:51:25', '', '2001-09-07 21:17:11', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (16, '', 'quia', '', '1983-01-18 11:19:46', '', '1997-06-19 19:55:23', '', '1978-05-08 18:22:46', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (17, '', 'quibusdam', '', '1988-04-23 08:17:31', '', '2012-05-01 12:34:35', '', '1986-01-04 17:44:18', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (18, '', 'minima', '', '2001-06-26 11:12:17', '', '1983-11-04 03:41:29', '', '2023-01-10 07:06:04', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (19, '', 'et', '', '1975-02-12 21:05:09', '', '2015-09-15 08:34:08', '', '1986-01-23 13:41:15', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (20, '', 'molestiae', '', '1979-04-15 21:01:10', '', '1988-10-05 15:32:29', '', '1990-07-10 12:56:54', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (21, '', 'deserunt', '', '2001-11-18 08:35:21', '', '1998-01-29 23:55:27', '', '1999-04-01 16:22:21', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (22, '', 'quia', '', '1987-05-12 03:29:00', '', '2005-10-15 02:38:05', '', '2014-06-17 06:15:37', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (23, '', 'et', '', '1990-03-21 04:15:58', '', '1993-02-07 20:00:09', '', '1982-12-21 17:34:31', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (24, '', 'eius', '', '1973-11-11 18:27:54', '', '2014-10-18 15:24:18', '', '1974-05-28 01:04:06', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (25, '', 'iure', '', '2010-07-02 07:19:46', '', '2010-12-29 22:18:00', '', '2010-06-11 02:10:35', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (26, '', 'sint', '', '2003-09-19 08:36:33', '', '2012-01-15 07:33:08', '', '1982-07-23 16:12:38', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (27, '', 'cupiditate', '', '2019-08-03 15:47:14', '', '2009-06-24 20:27:14', '', '1977-03-19 07:39:08', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (28, '', 'natus', '', '1994-03-12 08:03:57', '', '1971-12-13 01:33:44', '', '1977-10-14 16:18:04', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (29, '', 'est', '', '1972-04-05 17:57:05', '', '1995-11-12 02:57:31', '', '2010-03-23 13:18:50', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (30, '', 'labore', '', '1995-07-12 16:02:29', '', '1988-11-10 10:31:47', '', '2007-06-18 00:33:39', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (31, '', 'temporibus', '', '1986-06-11 22:26:14', '', '1989-03-25 23:54:01', '', '2002-08-28 20:37:27', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (32, '', 'aut', '', '2003-08-10 18:39:21', '', '1982-02-11 22:34:33', '', '2002-08-30 23:32:20', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (33, '', 'quae', '', '1983-07-21 06:33:27', '', '1974-03-12 12:51:32', '', '1993-12-14 13:27:45', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (34, '', 'modi', '', '2012-02-05 22:32:54', '', '1998-03-12 15:31:02', '', '2010-01-22 21:48:04', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (35, '', 'aut', '', '2005-07-22 06:49:12', '', '1974-03-13 06:17:21', '', '2010-05-07 23:01:43', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (36, '', 'sed', '', '1973-02-07 12:14:15', '', '2018-08-28 00:13:47', '', '1994-11-11 03:23:46', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (37, '', 'est', '', '2017-02-28 04:18:11', '', '1981-06-07 19:53:11', '', '2023-04-16 05:46:28', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (38, '', 'corrupti', '', '1998-01-21 08:11:03', '', '2007-10-19 05:11:11', '', '1975-04-15 14:23:29', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (39, '', 'sunt', '', '1990-07-11 10:07:06', '', '2020-08-01 10:02:30', '', '2005-02-03 16:35:24', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (40, '', 'sed', '', '1988-04-06 11:20:34', '', '1976-09-14 07:49:27', '', '2019-01-18 22:46:18', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (41, '', 'quibusdam', '', '1979-08-21 20:00:02', '', '1971-01-30 00:53:41', '', '1970-01-21 19:08:15', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (42, '', 'aliquam', '', '1985-01-11 15:55:37', '', '2013-11-09 15:05:31', '', '2013-12-07 05:30:01', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (43, '', 'quae', '', '2015-11-09 22:58:34', '', '1995-12-05 23:43:35', '', '1978-02-11 05:27:14', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (44, '', 'cumque', '', '2004-11-17 22:04:41', '', '2021-11-11 13:34:21', '', '2002-10-17 00:42:36', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (45, '', 'facilis', '', '1997-11-28 08:05:01', '', '2010-08-13 07:22:45', '', '1997-03-04 05:44:21', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (46, '', 'non', '', '2018-01-12 06:21:18', '', '1985-05-06 14:07:10', '', '1976-11-13 17:30:14', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (47, '', 'aliquid', '', '1991-01-12 09:51:28', '', '1999-02-21 05:06:23', '', '2017-12-19 16:02:31', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (48, '', 'dolor', '', '2008-12-21 14:06:07', '', '1998-02-12 03:11:43', '', '1972-11-10 21:35:49', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (49, '', 'eos', '', '1985-11-10 15:59:32', '', '2018-09-10 07:22:34', '', '1991-07-11 18:28:38', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (50, '', 'repellendus', '', '2005-04-21 11:04:16', '', '2006-06-15 21:00:32', '', '1976-02-08 15:49:50', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (51, '', 'optio', '', '1979-07-14 00:40:51', '', '1981-04-10 08:58:23', '', '2008-11-17 02:40:22', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (52, '', 'id', '', '2016-04-16 10:42:12', '', '2021-12-21 05:45:46', '', '1980-11-03 16:27:57', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (53, '', 'explicabo', '', '2009-12-08 04:05:47', '', '2006-12-02 23:19:00', '', '1977-05-16 17:56:57', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (54, '', 'excepturi', '', '1995-10-06 21:02:34', '', '1995-05-04 23:45:59', '', '1981-02-15 12:05:50', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (55, '', 'impedit', '', '1989-10-24 04:29:39', '', '1991-05-04 14:19:20', '', '1984-10-08 08:59:52', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (56, '', 'officia', '', '1998-05-18 12:11:08', '', '2018-11-11 20:24:12', '', '1982-01-10 19:02:44', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (57, '', 'qui', '', '1982-07-30 22:52:04', '', '1981-02-15 18:33:18', '', '2017-11-14 06:47:03', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (58, '', 'commodi', '', '1999-11-20 06:25:23', '', '2009-09-01 06:55:45', '', '2000-04-24 21:26:54', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (59, '', 'officiis', '', '1999-04-03 03:38:40', '', '2004-08-28 09:34:33', '', '1979-11-02 22:12:13', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (60, '', 'veniam', '', '1986-09-11 21:15:33', '', '1973-07-20 17:41:57', '', '1973-05-25 01:58:54', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (61, '', 'esse', '', '1972-09-02 07:03:40', '', '1985-06-02 09:08:05', '', '1995-08-11 08:19:10', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (62, '', 'iste', '', '2019-10-19 07:23:45', '', '2005-02-15 17:53:28', '', '2020-07-11 21:26:38', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (63, '', 'et', '', '1976-10-06 11:49:25', '', '1993-08-27 17:32:02', '', '2016-08-07 22:14:00', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (64, '', 'molestiae', '', '1983-11-23 16:48:10', '', '1980-08-11 15:39:21', '', '1993-08-18 19:11:51', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (65, '', 'deleniti', '', '2020-05-26 07:10:21', '', '2003-05-10 06:34:36', '', '1987-04-02 02:59:08', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (66, '', 'aut', '', '1978-09-05 00:15:15', '', '1975-03-20 18:36:29', '', '1996-09-14 12:00:51', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (67, '', 'non', '', '1997-07-10 17:08:58', '', '1979-04-28 19:51:18', '', '1983-05-16 19:30:58', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (68, '', 'sed', '', '1989-04-02 17:21:46', '', '1994-07-08 14:44:27', '', '2015-05-15 18:10:38', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (69, '', 'est', '', '1995-12-21 19:31:24', '', '1982-03-02 03:04:31', '', '1979-05-31 19:48:33', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (70, '', 'quas', '', '1996-05-03 16:35:53', '', '1977-02-10 04:45:48', '', '2008-03-04 11:04:24', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (71, '', 'voluptatibus', '', '1983-07-02 04:51:02', '', '2020-02-14 05:24:34', '', '1995-09-04 17:54:23', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (72, '', 'molestiae', '', '2013-02-09 07:45:03', '', '1998-09-16 01:29:30', '', '2014-02-21 10:06:26', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (73, '', 'similique', '', '2010-10-20 20:09:49', '', '1986-12-14 03:10:22', '', '1972-03-12 04:29:02', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (74, '', 'magnam', '', '2012-07-17 12:25:14', '', '2015-12-17 09:15:14', '', '1972-01-11 10:05:04', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (75, '', 'et', '', '1989-07-20 07:53:17', '', '1981-12-23 07:04:43', '', '1995-07-17 11:57:13', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (76, '', 'suscipit', '', '1978-12-30 15:01:20', '', '2010-08-19 08:14:16', '', '2003-12-10 18:17:42', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (77, '', 'quibusdam', '', '1970-09-06 00:46:35', '', '2013-01-17 17:44:35', '', '2012-03-01 08:12:07', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (78, '', 'voluptas', '', '1988-08-25 12:18:00', '', '1971-02-24 00:30:21', '', '2000-08-08 10:08:26', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (79, '', 'molestias', '', '2019-09-23 03:18:03', '', '1983-09-24 07:47:37', '', '1983-07-24 13:51:45', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (80, '', 'nostrum', '', '2002-10-04 12:43:01', '', '2019-10-11 19:41:44', '', '2022-03-27 20:26:02', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (81, '', 'qui', '', '1981-07-10 11:52:46', '', '2014-05-14 01:13:59', '', '1989-07-21 10:20:11', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (82, '', 'voluptatem', '', '1996-12-25 11:37:25', '', '1997-07-06 01:34:50', '', '1992-06-28 18:10:06', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (83, '', 'cum', '', '1970-03-02 05:03:17', '', '2006-09-15 13:45:24', '', '1997-11-02 08:39:21', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (84, '', 'optio', '', '1982-01-05 13:38:39', '', '1992-03-05 23:03:41', '', '2008-10-10 05:14:12', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (85, '', 'quia', '', '2014-01-13 17:02:02', '', '2016-07-04 21:38:07', '', '1990-02-01 03:17:50', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (86, '', 'est', '', '2020-11-28 08:19:51', '', '2000-09-03 19:06:15', '', '2007-02-23 03:16:29', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (87, '', 'quaerat', '', '1975-05-06 20:00:19', '', '1986-01-11 12:40:26', '', '1984-12-16 03:34:18', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (88, '', 'delectus', '', '2017-08-26 23:55:01', '', '2020-05-06 22:43:03', '', '2008-09-25 05:23:39', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (89, '', 'voluptate', '', '2003-09-20 00:54:23', '', '1994-10-25 14:09:05', '', '1996-10-27 05:42:36', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (90, '', 'sunt', '', '1980-09-01 14:23:00', '', '1995-05-08 09:38:53', '', '2009-08-19 22:51:19', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (91, '', 'qui', '', '1980-12-20 17:30:56', '', '1982-08-10 22:39:57', '', '1994-12-19 20:31:08', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (92, '', 'aliquid', '', '1988-08-08 17:36:54', '', '1988-06-21 12:07:21', '', '1975-12-22 18:27:37', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (93, '', 'accusamus', '', '1997-03-17 20:19:46', '', '1992-05-04 17:20:24', '', '2002-02-27 01:13:44', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (94, '', 'sit', '', '1972-07-22 07:22:03', '', '2004-11-08 06:13:27', '', '1986-03-01 21:27:27', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (95, '', 'cupiditate', '', '1970-07-28 15:59:28', '', '1975-03-10 09:49:41', '', '2021-08-11 15:08:21', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (96, '', 'aut', '', '1971-06-08 05:33:19', '', '1980-11-17 15:02:06', '', '2016-10-31 21:41:08', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (97, '', 'quisquam', '', '2022-12-30 02:42:03', '', '2012-12-03 04:37:48', '', '2019-09-12 06:54:57', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (98, '', 'eius', '', '2011-02-09 05:31:56', '', '1996-05-04 05:31:20', '', '2013-09-13 04:58:06', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (99, '', 'reiciendis', '', '2015-07-26 11:33:46', '', '1990-08-03 18:34:39', '', '2004-09-29 12:04:24', NULL);
INSERT INTO `extensions` (`id`, `extension_guid`, `extension_name`, `extension_version`, `inserted_at`, `inserted_by`, `updated_at`, `updated_by`, `uninstalled_at`, `uninstalled_by`) VALUES (100, '', 'repellat', '', '1980-11-02 18:19:56', '', '1987-05-07 15:10:14', '', '1999-12-05 15:49:19', NULL);


#
# TABLE STRUCTURE FOR: ledger_entries
#

DROP TABLE IF EXISTS `ledger_entries`;

CREATE TABLE `ledger_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `account_id` bigint(19) unsigned NOT NULL,
  `entry_type` enum('D','C') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `amount` decimal(20,2) unsigned NOT NULL,
  `person_id` int(10) unsigned DEFAULT NULL,
  `cost_centre_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledger_entries_entry_type_idx` (`entry_type`),
  KEY `ledger_entries_transaction_id_fk` (`transaction_id`),
  KEY `ledger_entries_account_id_fk` (`account_id`),
  CONSTRAINT `ledger_entries_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ledger_entries_transaction_id_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2500101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500001, 1000001, '0', 'C', '182.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500002, 1000002, '0', 'D', '1.33', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500003, 1000003, '0', 'C', '30252813.82', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500004, 1000004, '0', 'C', '125833268.99', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500005, 1000005, '0', 'D', '6.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500006, 1000006, '0', 'C', '367539.24', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500007, 1000007, '0', 'D', '5.62', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500008, 1000008, '0', 'C', '5.64', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500009, 1000009, '0', 'C', '27264.14', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500010, 1000010, '0', 'C', '90.27', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500011, 1000011, '0', 'D', '307213.74', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500012, 1000012, '0', 'D', '3.14', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500013, 1000013, '0', 'D', '27310.50', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500014, 1000014, '0', 'D', '8169.57', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500015, 1000015, '0', 'C', '52.06', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500016, 1000016, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500017, 1000017, '0', 'D', '25529.31', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500018, 1000018, '0', 'C', '80.42', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500019, 1000019, '0', 'C', '5.31', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500020, 1000020, '0', 'D', '5444.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500021, 1000021, '0', 'C', '74.24', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500022, 1000022, '0', 'C', '0.91', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500023, 1000023, '0', 'D', '74571.22', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500024, 1000024, '0', 'D', '9516.95', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500025, 1000025, '0', 'C', '46378067.50', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500026, 1000026, '0', 'C', '200.23', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500027, 1000027, '0', 'C', '1525.39', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500028, 1000028, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500029, 1000029, '0', 'D', '24066.70', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500030, 1000030, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500031, 1000031, '0', 'D', '3520.90', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500032, 1000032, '0', 'D', '10.22', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500033, 1000033, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500034, 1000034, '0', 'C', '3.79', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500035, 1000035, '0', 'C', '13575346.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500036, 1000036, '0', 'C', '2757.76', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500037, 1000037, '0', 'D', '4834347.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500038, 1000038, '0', 'D', '231.05', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500039, 1000039, '0', 'C', '110.43', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500040, 1000040, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500041, 1000041, '0', 'C', '657.12', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500042, 1000042, '0', 'C', '181.46', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500043, 1000043, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500044, 1000044, '0', 'D', '0.57', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500045, 1000045, '0', 'D', '331.08', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500046, 1000046, '0', 'C', '2199498.98', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500047, 1000047, '0', 'C', '4271.13', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500048, 1000048, '0', 'C', '6408117.31', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500049, 1000049, '0', 'C', '18338356.30', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500050, 1000050, '0', 'C', '37467026.71', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500051, 1000051, '0', 'C', '1.81', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500052, 1000052, '0', 'D', '2461157.84', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500053, 1000053, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500054, 1000054, '0', 'D', '3286085.91', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500055, 1000055, '0', 'C', '311.75', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500056, 1000056, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500057, 1000057, '0', 'D', '2122.97', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500058, 1000058, '0', 'D', '1894865.04', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500059, 1000059, '0', 'C', '6209.60', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500060, 1000060, '0', 'D', '8285058.65', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500061, 1000061, '0', 'D', '46.90', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500062, 1000062, '0', 'D', '0.10', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500063, 1000063, '0', 'C', '548.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500064, 1000064, '0', 'C', '104.98', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500065, 1000065, '0', 'D', '3.12', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500066, 1000066, '0', 'D', '432.71', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500067, 1000067, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500068, 1000068, '0', 'C', '52643.55', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500069, 1000069, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500070, 1000070, '0', 'C', '2.94', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500071, 1000071, '0', 'D', '102011583.45', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500072, 1000072, '0', 'D', '6931065.64', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500073, 1000073, '0', 'C', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500074, 1000074, '0', 'D', '98695.50', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500075, 1000075, '0', 'D', '36120360.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500076, 1000076, '0', 'C', '2.89', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500077, 1000077, '0', 'D', '0.77', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500078, 1000078, '0', 'D', '601809.41', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500079, 1000079, '0', 'D', '51811306.56', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500080, 1000080, '0', 'C', '17495271.54', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500081, 1000081, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500082, 1000082, '0', 'C', '33814.38', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500083, 1000083, '0', 'D', '55118.90', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500084, 1000084, '0', 'C', '13634.65', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500085, 1000085, '0', 'D', '436.58', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500086, 1000086, '0', 'C', '13.22', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500087, 1000087, '0', 'D', '204.10', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500088, 1000088, '0', 'D', '20098.40', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500089, 1000089, '0', 'D', '0.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500090, 1000090, '0', 'C', '758236135.52', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500091, 1000091, '0', 'D', '1566.21', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500092, 1000092, '0', 'D', '28.72', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500093, 1000093, '0', 'D', '192663005.73', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500094, 1000094, '0', 'C', '3644881.16', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500095, 1000095, '0', 'D', '4836437.40', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500096, 1000096, '0', 'C', '64371662.00', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500097, 1000097, '0', 'D', '5832349.59', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500098, 1000098, '0', 'D', '0.41', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500099, 1000099, '0', 'D', '5.85', NULL, NULL);
INSERT INTO `ledger_entries` (`id`, `transaction_id`, `account_id`, `entry_type`, `amount`, `person_id`, `cost_centre_id`) VALUES (2500100, 1000100, '0', 'D', '3514400.00', NULL, NULL);


#
# TABLE STRUCTURE FOR: transactions
#

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_transaction_date_idx` (`transaction_date`),
  KEY `transactions_document_id_fk` (`document_id`),
  CONSTRAINT `transactions_document_id_fk` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1000101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000001, 1000001, '1978-10-19', 'Ut enim ea natus aut qui qui. Commodi dolores laborum sit sunt delectus quia. Nisi alias quidem iste at rerum fuga molestiae. Sit ut unde alias ut.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000002, 1000002, '2010-05-16', 'Quia ducimus id aliquid dolorem ad voluptatem consectetur. Doloremque ut voluptatem ex pariatur non autem est. Voluptate delectus molestiae deserunt autem a fugit eos incidunt. Accusantium consequatur aut quidem porro. Illo voluptas possimus quos.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000003, 1000003, '2004-08-01', 'Voluptas vero animi quisquam tempore. Non et recusandae temporibus accusantium. Qui maiores harum odit sequi.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000004, 1000004, '2008-09-24', 'Deleniti autem itaque praesentium eos aliquam autem. Illo dolor nisi omnis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000005, 1000005, '2006-03-25', 'Tempore doloremque et expedita saepe doloribus velit. Quod reiciendis accusantium sit. Sed excepturi alias non atque qui. Totam dolor totam adipisci quibusdam et provident.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000006, 1000006, '2000-07-07', 'Hic nesciunt omnis ut dolorum voluptas. Ipsam consequuntur aut quis. Iure deserunt voluptas placeat qui quo ut. Praesentium ullam quis fugit blanditiis tempora.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000007, 1000007, '1991-07-22', 'Eos veniam neque adipisci. Repellat qui velit possimus culpa deserunt.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000008, 1000008, '2006-05-24', 'Quo rerum animi dolores mollitia sequi. Porro recusandae sapiente porro ut. Quia ad tenetur in tenetur. Minus quaerat est natus totam dolor.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000009, 1000009, '2006-01-21', 'Dolorum molestiae vitae recusandae accusantium odit aut. Placeat qui suscipit odio aut et reprehenderit exercitationem. Occaecati et voluptatem sunt ea sunt aut aut consequatur.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000010, 1000010, '2014-10-20', 'Culpa aut et laboriosam repellat sed. Nesciunt voluptas est qui officiis. Quod dolores eaque est optio. Aspernatur cupiditate pariatur id quo hic. Vitae ea sit molestiae necessitatibus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000011, 1000011, '1978-12-26', 'Recusandae debitis magni aliquam maiores assumenda aut rerum. Fugiat blanditiis hic sequi qui unde vel asperiores rerum. Voluptatibus molestias unde est maxime error quibusdam possimus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000012, 1000012, '1994-11-15', 'Ut consequatur expedita eum harum occaecati suscipit. Quos et porro quis. Quod mollitia dolor tempora. Et ea quis magnam est ex reprehenderit ad aut.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000013, 1000013, '1999-05-01', 'Totam est dolores rerum. Tenetur ut quisquam et est non. Explicabo enim amet sapiente eos illum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000014, 1000014, '2011-11-11', 'Tempore similique aliquam nihil dicta. Quia nihil quas tempore sequi inventore sit sunt. Ut et assumenda eligendi sint neque quia.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000015, 1000015, '2017-08-10', 'Quisquam ratione dolorem molestiae facere quae eius. Voluptas quis cum nihil quam possimus qui. Est quos est accusamus ratione ipsam ipsam minus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000016, 1000016, '1974-04-26', 'Facilis placeat repudiandae porro quam. Veniam aut blanditiis harum nemo omnis molestiae. Sit et voluptas cupiditate voluptatem autem.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000017, 1000017, '1988-12-26', 'Temporibus debitis cum vero aut quo asperiores. Enim magni neque inventore ipsum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000018, 1000018, '2011-05-29', 'Doloremque delectus et libero id non. Vitae cupiditate itaque id provident maxime nobis et. Aperiam magnam perspiciatis in veritatis non mollitia. Impedit voluptatem et natus. Est enim id voluptatum similique aut.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000019, 1000019, '1975-07-22', 'Vitae quo velit natus facilis. Accusantium ut sint iusto et dicta quaerat minus molestiae. Eligendi id fugiat quia fugit nemo. Alias maiores ut ab iure quo in incidunt.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000020, 1000020, '2007-10-10', 'Magnam et ratione voluptas cupiditate. Nihil tempora labore sequi. Qui deleniti sed totam animi et ut. Distinctio dolorum maiores et facere.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000021, 1000021, '1992-01-27', 'Magnam consequatur nihil tempore natus omnis. Rerum blanditiis eos et neque recusandae aliquid.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000022, 1000022, '1991-12-23', 'Id dolor perferendis optio at enim facere. Exercitationem praesentium consequuntur delectus sapiente in et nobis. Quia cum dolor quod in magnam ea. Consequatur amet eius consequatur error veniam accusamus cum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000023, 1000023, '2002-06-06', 'Aliquam sint et vitae. Dicta aut enim distinctio nam voluptas dignissimos quasi nihil. Hic nihil ea quas dolorem voluptatibus assumenda quo.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000024, 1000024, '2020-09-30', 'Temporibus velit enim molestiae nihil amet atque sint. Delectus occaecati animi nam quidem itaque quidem id quasi. Aliquid qui adipisci qui suscipit. Quam odit doloribus iure vel porro expedita alias.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000025, 1000025, '2021-10-11', 'Eaque quis quibusdam possimus ut voluptates neque. Itaque et qui unde id aut sed et. A nisi eaque ipsum dignissimos. Deserunt ratione perspiciatis libero incidunt.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000026, 1000026, '1994-11-30', 'Ut voluptate error rem dolorem rem quos. Repellendus illum sit commodi sint. Officiis rerum expedita corrupti ipsum eum. Ut laborum iusto itaque a totam voluptas.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000027, 1000027, '1981-03-17', 'Et veritatis minus natus qui odit hic quod. Dolor ut eveniet harum aliquam sed. Eaque ut autem non deserunt.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000028, 1000028, '1989-11-06', 'Quod minus quia est itaque inventore fugit corporis. Modi recusandae itaque soluta alias vero. Ea enim velit dolores et qui neque numquam.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000029, 1000029, '2019-08-01', 'Quia tempora rerum corporis eos molestiae. Velit magnam et accusantium ut eaque fuga soluta. Saepe voluptatem soluta perspiciatis voluptatum odit. Itaque sit est voluptatibus quasi ipsam non consequuntur. Aspernatur voluptas eaque placeat iste saepe.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000030, 1000030, '1989-06-09', 'Commodi voluptas quo et architecto rerum praesentium facilis. Et non officiis cupiditate reprehenderit. Alias laudantium consequatur iure unde et tenetur quisquam nemo. Ut autem ea neque quibusdam ad fugit.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000031, 1000031, '2012-10-31', 'Fuga explicabo fugit dolor velit sequi tempora debitis. Blanditiis rerum animi et cum dolores. Molestiae ea explicabo quam doloribus dolores sed sapiente molestiae. Ut est nam rerum doloremque maiores qui perferendis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000032, 1000032, '1978-06-04', 'Molestiae sint non maxime qui sint aut eum. Iste a deleniti blanditiis distinctio quis magni. Aut perferendis itaque quia autem aut sed. Itaque excepturi rerum dolor repudiandae nihil.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000033, 1000033, '1975-12-06', 'Saepe eum saepe est consequatur qui minima. Atque ut est est eos sed nobis. Optio amet dolorem eum dicta praesentium. Earum quia impedit eligendi quaerat.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000034, 1000034, '2021-08-28', 'Et molestias adipisci dolores non explicabo doloremque quia. Omnis harum et ducimus veritatis. Animi sit vero eos accusamus. Molestiae occaecati ad eum esse. Corporis et dolorum nam voluptatem officia eos.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000035, 1000035, '1987-05-03', 'Optio quo ut quod ut reprehenderit similique quod dolor. Impedit veritatis quos ipsa expedita sint dolorem sed. Odit id perspiciatis quo dolorem aspernatur asperiores placeat. Quisquam fugiat modi ut unde reiciendis et est.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000036, 1000036, '1983-08-31', 'Velit mollitia dolore nihil quaerat. Iure voluptas rerum similique non quo cum rerum accusamus. Ipsum quaerat dolorem exercitationem. Possimus error aut eum perferendis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000037, 1000037, '2002-01-26', 'Eaque commodi omnis omnis quia autem nobis dolor. Sed et sapiente corporis recusandae. Laboriosam nulla aspernatur iusto placeat sit eaque. Asperiores magnam omnis deleniti. Ratione quia dolorem error non rerum et laborum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000038, 1000038, '2015-08-22', 'Est ut tempora ad aut doloremque. Laborum deleniti accusamus similique quibusdam hic non. Enim voluptas a maiores et consequuntur voluptatum architecto.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000039, 1000039, '2005-06-30', 'Similique occaecati occaecati sit et quo dolores et. Libero aspernatur eum voluptatem. Error tempore ab ut nihil quasi. Iste sit non qui et.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000040, 1000040, '2009-10-12', 'Minus quo dolorem omnis nihil alias quis. Consequuntur similique beatae officiis voluptatem. Provident dicta aut qui.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000041, 1000041, '1997-07-26', 'Libero tempora commodi voluptate consequatur dolorem aperiam maiores. Laudantium adipisci a voluptates non porro. Natus saepe ea ut enim voluptatibus numquam est.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000042, 1000042, '1972-03-25', 'Et rerum asperiores eum consequuntur. Dolores labore earum temporibus ut. Esse voluptatibus consequatur ducimus amet ut autem facilis. Consequatur rem aliquid sed perspiciatis non illo libero omnis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000043, 1000043, '1998-12-06', 'Autem recusandae laudantium debitis deserunt aspernatur. Temporibus voluptatem est placeat doloremque. Illum possimus eveniet quo aut porro porro.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000044, 1000044, '1976-11-15', 'Sunt tenetur quibusdam doloribus. Repudiandae cum eos facere optio beatae dicta et. Quasi qui voluptates laboriosam incidunt voluptatem omnis voluptate. Ut corrupti ipsa beatae hic ducimus quae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000045, 1000045, '1972-11-14', 'Et sit molestiae aliquam nesciunt molestiae harum qui nulla. Dicta consequatur facilis hic dolor tenetur. Deleniti voluptas et quia voluptas provident aspernatur. Reprehenderit enim eos saepe consequuntur.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000046, 1000046, '1970-05-27', 'Necessitatibus sunt facere magnam accusamus. Neque minima explicabo totam nostrum sint quae. Blanditiis occaecati quia architecto occaecati consequatur eum. Et tenetur pariatur quis eveniet consectetur nihil eveniet.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000047, 1000047, '1991-08-15', 'Est et sint cum accusamus qui reiciendis porro. Ut et maiores ut esse et sit et. Fugit maxime delectus iure aut dolor eveniet. Optio mollitia qui expedita qui natus accusamus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000048, 1000048, '2012-07-12', 'Non minus sed necessitatibus qui rerum magni. Earum natus voluptatem libero iure aut ex tenetur mollitia. Quod adipisci dolore natus maxime.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000049, 1000049, '1992-07-26', 'Est facilis facilis praesentium sit vero illo. Harum nisi delectus animi quidem corporis porro. Laboriosam aut voluptatem qui sapiente doloribus ipsam explicabo. Eos rerum modi quia molestiae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000050, 1000050, '1978-03-04', 'Nihil consequatur maxime ab eum odit occaecati quaerat. Cumque quasi sequi et labore. Ut iure alias praesentium enim et. Dignissimos qui laudantium consequatur.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000051, 1000051, '1981-05-06', 'In tenetur consequatur sit quia molestiae. Perferendis laudantium ab earum consequuntur qui et architecto. Et voluptatum perspiciatis itaque aut illum sit. Iusto atque quas vitae est. Asperiores beatae ut voluptatem.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000052, 1000052, '2015-08-16', 'Consequatur placeat et impedit molestias. Officia vero repellendus unde dolore minima. Nisi modi ab deserunt minima dignissimos placeat deleniti.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000053, 1000053, '1991-04-04', 'Repudiandae sequi quo dolore exercitationem voluptatem ratione sint. Ut earum id tempora vel quos perspiciatis dolore. Ratione rem corrupti eos quia illum voluptatem.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000054, 1000054, '2013-10-17', 'Velit rem voluptas repudiandae atque officiis provident. Consequatur aut officiis ex inventore cum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000055, 1000055, '2002-12-09', 'Ea in illo nostrum. Commodi enim officia et excepturi. Non voluptatibus eveniet et in cupiditate quasi harum. Saepe et quis deserunt nesciunt.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000056, 1000056, '1995-05-01', 'Eos expedita fuga odit impedit qui. Qui autem iste vel sit. Quis similique modi quia.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000057, 1000057, '1987-02-07', 'Soluta dolore natus et quia reiciendis. Ratione voluptas consequatur id et. Esse porro ex nemo et. Consequatur ipsum ut dignissimos nobis sunt quidem libero et.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000058, 1000058, '2001-10-26', 'Sint ut in harum. Voluptas quae et quisquam voluptatem. Ducimus vero vel harum placeat est itaque. Odit aut natus aut autem.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000059, 1000059, '1978-03-13', 'Animi beatae explicabo adipisci voluptates. Velit consectetur vel harum nesciunt. Non et in ut debitis et hic.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000060, 1000060, '2020-07-17', 'Reprehenderit libero dolorum autem eaque voluptas labore blanditiis. Sunt dolorum maxime et et tempora modi tempore. Hic qui omnis et eius sunt voluptate aut.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000061, 1000061, '1970-04-24', 'Ex pariatur quae est quas. Omnis nihil sunt ut voluptatem rem accusamus. Modi aut velit quo nihil voluptates sed. Hic veniam odio ratione inventore ut accusamus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000062, 1000062, '1999-05-04', 'Consectetur sunt aspernatur voluptas eos fugiat optio. Blanditiis molestias voluptates et doloremque optio. Explicabo est rerum repellendus est nihil. Cupiditate alias iusto esse consectetur. Pariatur omnis nemo et voluptatem accusantium occaecati aut min');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000063, 1000063, '1975-08-27', 'Neque nulla atque ut beatae labore. Harum et illo illum animi velit explicabo quo. Laudantium quos expedita illum. Sint voluptas ullam possimus est.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000064, 1000064, '2004-01-05', 'Laboriosam perspiciatis in aut voluptatem quo veniam quia iusto. Ex vitae voluptatibus est tenetur sunt eum. Veniam corrupti non dolores voluptatem minus eum rem.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000065, 1000065, '2011-05-24', 'Et ipsum praesentium dolorum est eligendi. Voluptatem non aut aut corrupti facilis esse. Magnam in omnis voluptas dignissimos assumenda praesentium.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000066, 1000066, '1981-08-29', 'Ducimus excepturi voluptas adipisci soluta aut non aliquid. Et odio soluta dolorem unde delectus eaque. Recusandae quis in doloremque nulla dicta eaque distinctio.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000067, 1000067, '2018-05-05', 'Beatae sequi autem delectus incidunt dolorum ut delectus dolores. Distinctio fugit ad eligendi eum alias. Modi natus nam voluptas ea voluptate voluptatem. Aut qui quia maiores doloremque facilis aspernatur repellendus. Dicta dolor consequatur rerum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000068, 1000068, '1986-05-29', 'Laudantium magni et sit corrupti. Accusantium rerum adipisci quo mollitia incidunt. Accusantium ea eaque excepturi minus error saepe nam. Sed dolores nihil ipsa.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000069, 1000069, '2003-03-27', 'Et nam a ut est dolorem. Autem optio et voluptatem numquam officiis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000070, 1000070, '2010-05-24', 'Repellendus et atque cupiditate quia dolor aut iste. Aut nam voluptatem accusantium est quia eum eos. Et dolorem totam optio ut similique. Voluptatibus qui atque id cupiditate.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000071, 1000071, '2002-07-23', 'Adipisci voluptates aut earum minus. Id autem hic non et. Neque eius impedit voluptate deserunt. Eum qui et mollitia molestias atque blanditiis perferendis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000072, 1000072, '1991-10-14', 'Labore autem non expedita doloremque assumenda expedita. Minima asperiores voluptatem et pariatur quasi. Quas ipsa eaque harum sit doloremque occaecati veritatis enim.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000073, 1000073, '2006-07-20', 'Animi ipsa voluptates sunt quis expedita perferendis voluptatem molestiae. Velit vero officiis eaque rerum quia qui dignissimos. Qui recusandae perspiciatis quis alias quos.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000074, 1000074, '1984-10-09', 'Labore aspernatur aperiam porro facere asperiores. Aut totam voluptatem nihil suscipit. Quidem assumenda doloremque ad. Quis alias soluta consequatur non.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000075, 1000075, '1983-02-23', 'Doloremque in unde qui incidunt officiis doloribus. Sed officia natus consectetur accusamus mollitia expedita qui. Aut aliquam rerum deleniti eaque error. Ullam consequatur inventore enim.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000076, 1000076, '2022-03-03', 'Delectus omnis tempore sunt adipisci tempora. Inventore quia voluptatum occaecati itaque iusto. Et sunt a et aliquid occaecati molestias.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000077, 1000077, '2006-06-09', 'Expedita doloremque pariatur incidunt aliquam facere autem. Sed aut sint est esse. Ratione et molestiae qui quaerat. Repudiandae ipsa dolores sint est quia.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000078, 1000078, '2019-12-06', 'Nesciunt dolorum et et. Dicta et ducimus asperiores voluptas qui corporis. Incidunt autem aut placeat nemo rerum voluptatem nihil enim. Nulla et delectus excepturi suscipit magni aut nemo et.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000079, 1000079, '2007-09-27', 'Velit qui dolorem enim sed voluptatibus blanditiis magnam. Odio ea beatae facilis reprehenderit omnis. Rem aut veritatis quae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000080, 1000080, '1972-06-16', 'Dolore ut reiciendis fugiat amet unde. Accusamus aliquid expedita molestias autem. Ut eaque veritatis maiores maiores ab in.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000081, 1000081, '1997-10-26', 'Ad eos sint enim fugiat sit. Deserunt dolor sed rerum et dolores quisquam aperiam. Ratione exercitationem dolorem voluptate et. Et sit delectus quisquam libero.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000082, 1000082, '2006-03-21', 'Magni ex voluptates quam nobis. Praesentium quae consequatur voluptatum iusto eum.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000083, 1000083, '2014-09-05', 'Voluptas veniam ad dignissimos non eligendi. Dignissimos fugit repudiandae ut vitae sint. Ea et sint veniam ipsum optio libero vero ut.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000084, 1000084, '2019-09-18', 'Adipisci quasi consequuntur expedita. Blanditiis et occaecati et aspernatur. Itaque nam maiores consectetur facere repudiandae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000085, 1000085, '1996-11-07', 'Sint alias id minima. Sit non saepe rerum a. Cupiditate temporibus et qui ipsam minus maiores. Hic qui ratione laboriosam neque.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000086, 1000086, '2000-09-12', 'Aut deleniti veritatis eos excepturi. Dicta est in nisi ex in. Commodi ratione sed ad ex. Et consectetur necessitatibus harum non facere et.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000087, 1000087, '2017-06-08', 'Et quam nisi odio rem temporibus. Nam aliquid ex fugit eius atque sit iste. Non alias est accusamus. Labore repellendus ut magnam tempora voluptate alias. Voluptatem corporis quas occaecati quo beatae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000088, 1000088, '2003-05-23', 'Libero ex qui et eius possimus et et. Quos modi qui voluptatem autem id. Quaerat et aliquid culpa dolor aut fugiat. Omnis maxime corrupti iusto sed.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000089, 1000089, '2008-05-16', 'Sunt eum eum vitae sint quo qui et. Veritatis quis ea consequatur. Quaerat earum neque incidunt laudantium provident omnis beatae. Voluptas ut aliquid delectus facilis.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000090, 1000090, '2012-02-13', 'Saepe quae aut ut rem quos corrupti labore aut. Facere vero quo fuga. Illo dolorem et repellat.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000091, 1000091, '2011-03-06', 'Veritatis sunt necessitatibus qui accusantium. Laudantium qui dignissimos vel eligendi minima in neque. Expedita ducimus suscipit cum commodi veniam nulla porro.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000092, 1000092, '2008-04-29', 'Omnis ipsam ipsum fugiat fugit nesciunt voluptate facilis. Repellendus excepturi occaecati facilis est et sapiente veritatis magnam. Quis harum rem est nulla porro voluptas.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000093, 1000093, '2020-07-15', 'Molestiae expedita deleniti vel eum. Dolor ipsum laborum fuga. Nam qui numquam veniam ullam fugit tempora. Reiciendis est temporibus alias tenetur officia natus possimus.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000094, 1000094, '2013-03-30', 'Reiciendis quisquam saepe dolorum dignissimos quo officiis. Qui perspiciatis repudiandae enim dignissimos rerum dolorem. Et est rem explicabo quae molestiae.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000095, 1000095, '2004-09-24', 'Esse dolorem exercitationem delectus ad voluptatum in. Autem nemo sunt mollitia totam. Consequatur officia qui voluptates eius numquam esse.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000096, 1000096, '2018-02-16', 'Temporibus in non nihil voluptatem tempora perferendis. Itaque impedit quis impedit exercitationem omnis rerum. Molestiae repellendus placeat nihil voluptate labore aperiam. Commodi voluptate deleniti aperiam voluptas.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000097, 1000097, '1984-08-21', 'Aut voluptas ut doloribus modi. Architecto nam vero quisquam sed iure molestiae. Maxime perspiciatis aliquam impedit ut explicabo ea. Similique ratione vel eveniet quod et quo quia.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000098, 1000098, '2017-01-20', 'Eum quia accusamus vitae eum est quo. Esse dolore nihil nesciunt voluptatem. Quam ratione molestiae sit laudantium sit fugiat.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000099, 1000099, '1979-02-21', 'Rerum quibusdam libero cumque distinctio. Veritatis eligendi iusto qui similique accusantium non delectus. Totam voluptates qui et odit quos et. Omnis dolorum aut dolores et accusantium.');
INSERT INTO `transactions` (`id`, `document_id`, `transaction_date`, `description`) VALUES (1000100, 1000100, '1983-05-03', 'Vero quis quasi dolore vero magni quo quaerat. Quae dicta quia molestiae voluptatem amet officiis omnis. Qui excepturi sit veniam pariatur repellendus.');


