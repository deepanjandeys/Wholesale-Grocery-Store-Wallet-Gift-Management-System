-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 07, 2025 at 05:22 PM
-- Server version: 5.7.31
-- PHP Version: 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `statusdeal`
--

-- --------------------------------------------------------

--
-- Table structure for table `approve`
--

DROP TABLE IF EXISTS `approve`;
CREATE TABLE IF NOT EXISTS `approve` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approve`
--

INSERT INTO `approve` (`id`, `name`) VALUES
(0, 'Disapprove'),
(1, 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '1',
  `balance` float NOT NULL DEFAULT '0',
  `credit_limit` smallint(6) NOT NULL DEFAULT '5000',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `mobile`, `password`, `DateOfBirth`, `address`, `email`, `gender`, `isApproved`, `balance`, `credit_limit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Deepanjan Dey', '9401543453', '$2y$10$Xk3A/dNvdjQD4H.GKbOnh.hili5EPmGXtvh0VwuAtSw8UTuvRK4nC', '1976-12-31', 'Seva Sarani,Rongpur\r\nRONGPUR', 'deepanjandeys@gmail.com', 1, 1, -3050, 5009, 1, '2022-12-22 21:53:31', '2023-12-08 16:29:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_gifts`
--

DROP TABLE IF EXISTS `customer_gifts`;
CREATE TABLE IF NOT EXISTS `customer_gifts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `monthId` tinyint(4) NOT NULL,
  `year` smallint(6) NOT NULL,
  `basedAmount` double(8,2) NOT NULL,
  `giftAmount` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_gifts`
--

INSERT INTO `customer_gifts` (`id`, `custId`, `monthId`, `year`, `basedAmount`, `giftAmount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 12, 2022, 2461.00, 0, '2022-12-26 07:28:25', '2022-12-26 07:28:25', NULL),
(4, 5, 12, 2022, 4762.25, 0, '2022-12-26 09:46:06', '2022-12-26 09:46:06', NULL),
(6, 5, 7, 2023, 2580.00, 0, '2023-07-01 17:14:10', '2023-07-01 17:14:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_purchases`
--

DROP TABLE IF EXISTS `customer_purchases`;
CREATE TABLE IF NOT EXISTS `customer_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `purchaseDate` date NOT NULL,
  `amount` double(8,2) NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_purchases`
--

INSERT INTO `customer_purchases` (`id`, `custId`, `purchaseDate`, `amount`, `remarks`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, '2022-12-24', 10.00, NULL, 1, '2022-12-23 14:14:53', '2022-12-24 09:02:09', NULL),
(2, 5, '2022-12-24', 300.00, NULL, 0, '2022-12-23 14:16:23', '2022-12-25 07:25:15', '2022-12-25 07:25:15'),
(4, 5, '2022-12-24', 1800.00, NULL, 1, '2022-12-24 09:00:38', '2022-12-24 09:01:08', NULL),
(5, 5, '2022-12-24', 325.50, NULL, 1, '2022-12-24 09:10:12', '2022-12-24 09:10:22', NULL),
(8, 5, '2022-12-25', 325.50, NULL, 1, '2022-12-25 07:38:34', '2022-12-25 07:39:56', NULL),
(9, 5, '2022-12-25', 300.25, NULL, 1, '2022-12-25 09:15:38', '2022-12-26 09:45:57', NULL),
(10, 5, '2022-12-01', 880.00, NULL, 1, '2022-12-25 09:37:15', '2022-12-27 01:45:11', NULL),
(11, 5, '2022-12-26', 2001.00, NULL, 1, '2022-12-26 09:45:40', '2022-12-26 09:45:53', NULL),
(12, 5, '2022-12-27', 100.00, NULL, 1, '2022-12-27 00:12:05', '2022-12-27 01:29:07', NULL),
(14, 5, '2022-12-27', 10.00, NULL, 1, '2022-12-27 01:49:35', '2022-12-27 01:49:48', NULL),
(15, 5, '2022-12-27', 1.00, NULL, 1, '2022-12-27 01:50:03', '2023-01-18 19:08:46', NULL),
(16, 5, '2023-01-19', 100.00, 'muri+biscuit', 1, '2023-01-18 19:13:05', '2023-01-18 19:14:03', NULL),
(17, 5, '2023-07-02', 880.00, NULL, 1, '2023-07-01 17:09:44', '2023-07-01 17:10:30', NULL),
(18, 5, '2023-07-02', 1700.00, NULL, 1, '2023-07-01 17:11:13', '2023-07-01 17:11:53', NULL),
(19, 5, '2023-07-02', 2001.00, NULL, 1, '2023-07-01 17:59:14', '2023-07-01 17:59:43', NULL),
(20, 5, '2023-07-03', 100.00, NULL, 1, '2023-07-03 03:54:46', '2023-07-03 03:56:04', NULL),
(21, 5, '2023-07-03', 154.00, NULL, 1, '2023-07-03 03:56:50', '2023-07-03 22:31:18', NULL),
(22, 5, '2023-07-04', 880.00, NULL, 1, '2023-07-03 15:08:39', '2023-07-03 15:08:53', NULL),
(23, 5, '2023-07-04', 150.00, NULL, 0, '2023-07-03 21:46:12', '2023-07-03 23:55:43', '2023-07-03 23:55:43'),
(24, 5, '2023-07-04', 150.00, NULL, 0, '2023-07-03 23:56:10', '2023-07-03 23:56:30', '2023-07-03 23:56:30'),
(25, 5, '2023-07-04', 99.00, NULL, 1, '2023-07-03 23:57:25', '2023-07-03 23:57:39', NULL),
(26, 5, '2023-07-05', 150.00, NULL, 1, '2023-07-05 10:19:02', '2023-07-09 23:30:25', NULL),
(27, 5, '2023-08-10', 100.00, NULL, 1, '2023-08-10 04:06:20', '2023-08-10 04:11:22', NULL),
(28, 5, '2023-10-29', 10000.00, NULL, 1, '2023-10-29 09:53:14', '2023-10-30 03:28:24', NULL),
(29, 5, '2023-10-29', 10.00, NULL, 0, '2023-10-29 10:11:44', '2023-10-30 03:31:21', '2023-10-30 03:31:21'),
(30, 5, '2023-10-30', 10.00, NULL, 0, '2023-10-30 03:04:28', '2023-10-30 03:31:27', '2023-10-30 03:31:27'),
(31, 5, '2023-10-30', 1000.00, NULL, 0, '2023-10-30 03:06:24', '2023-10-30 03:31:34', '2023-10-30 03:31:34'),
(32, 5, '2023-10-30', 1700.00, NULL, 1, '2023-10-30 03:15:19', '2023-10-30 03:15:31', NULL),
(33, 5, '2023-10-30', 7000.00, NULL, 1, '2023-10-30 03:16:02', '2023-10-30 03:16:15', NULL),
(35, 5, '2023-10-30', 10.00, NULL, 0, '2023-10-30 03:37:05', '2023-10-30 03:37:48', '2023-10-30 03:37:48'),
(36, 5, '2023-10-30', 10.00, NULL, 1, '2023-10-30 03:46:56', '2023-10-30 03:49:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer__wallets`
--

DROP TABLE IF EXISTS `customer__wallets`;
CREATE TABLE IF NOT EXISTS `customer__wallets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `curBalance` float NOT NULL,
  `tranType` tinyint(4) NOT NULL,
  `remarks` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer__wallets`
--

INSERT INTO `customer__wallets` (`id`, `custId`, `amount`, `curBalance`, `tranType`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 5, 150.00, 2350, 0, 'Opening Balance', '2023-07-03 23:52:52', '2023-07-03 23:52:52', NULL),
(15, 5, 150.00, 2200, 1, 'Purchase Approved', '2023-07-03 23:52:52', '2023-07-03 23:52:52', NULL),
(16, 5, 150.00, 2350, 2, 'Purchase dis Approved', '2023-07-03 23:53:57', '2023-07-03 23:53:57', NULL),
(17, 5, 150.00, 2500, 2, 'Purchase declined', '2023-07-03 23:55:43', '2023-07-03 23:55:43', NULL),
(18, 5, 150.00, 2650, 2, 'Purchase declined', '2023-07-03 23:56:30', '2023-07-03 23:56:30', NULL),
(19, 5, 99.00, 2551, 1, 'Purchase Approved', '2023-07-03 23:57:39', '2023-07-03 23:57:39', NULL),
(22, 5, 109.00, 2660, 2, 'Balance Added ', '2023-07-04 00:14:34', '2023-07-04 00:14:34', NULL),
(26, 5, 100.00, 2760, 2, 'Balance Added ', '2023-07-04 03:52:33', '2023-07-04 03:52:33', NULL),
(27, 5, 100.00, 3460, 2, 'Balance Added ', '2023-07-09 21:42:11', '2023-07-09 21:42:11', NULL),
(28, 5, 100.00, 3660, 2, 'Balance Added', '2023-07-09 21:46:27', '2023-07-09 21:46:27', NULL),
(29, 5, 100.00, 3760, 2, 'Balance Added', '2023-07-09 21:48:36', '2023-07-09 21:48:36', NULL),
(30, 5, 100.00, 3860, 2, 'Balance Added', '2023-07-09 21:49:25', '2023-07-09 21:49:25', NULL),
(31, 5, 100.00, 3960, 2, 'Balance Added', '2023-07-09 21:49:38', '2023-07-09 21:49:38', NULL),
(32, 5, 100.00, 4060, 2, 'Balance Added', '2023-07-09 21:53:30', '2023-07-09 21:53:30', NULL),
(33, 5, 100.00, 4160, 2, 'Balance Added', '2023-07-09 21:56:13', '2023-07-09 21:56:13', NULL),
(34, 5, 10.00, 4170, 2, 'Balance Added', '2023-07-09 22:44:18', '2023-07-09 22:44:18', NULL),
(35, 5, 10.00, 4180, 2, 'Balance Added', '2023-07-09 22:45:03', '2023-07-09 22:45:03', NULL),
(36, 5, 10.00, 4205, 2, 'Balance Added', '2023-07-09 22:56:00', '2023-07-09 22:56:00', NULL),
(37, 5, 10.00, 4215, 2, 'Balance Added', '2023-07-09 22:59:45', '2023-07-09 22:59:45', NULL),
(38, 5, 15.00, 4230, 2, 'Balance Edited', '2023-07-09 23:02:29', '2023-07-09 23:04:05', NULL),
(39, 5, 25.00, 4255, 2, 'Balance Edited', '2023-07-09 23:04:44', '2023-07-09 23:05:16', NULL),
(40, 5, 135.00, 4390, 2, 'Balance Added', '2023-07-09 23:13:13', '2023-07-09 23:13:13', NULL),
(41, 5, 135.00, 4525, 2, 'Balance Added', '2023-07-09 23:13:16', '2023-07-09 23:13:16', NULL),
(42, 5, 35.00, 4560, 2, 'Balance Edited', '2023-07-09 23:15:19', '2023-07-09 23:15:34', NULL),
(43, 5, 40.00, 4600, 2, 'Balance Edited', '2023-07-09 23:18:37', '2023-07-09 23:18:46', NULL),
(44, 5, 20.00, 4620, 2, 'Balance Edited', '2023-07-09 23:20:38', '2023-07-09 23:20:55', NULL),
(45, 5, 150.00, 4470, 1, 'Purchase Approved', '2023-07-09 23:30:25', '2023-07-09 23:30:25', NULL),
(46, 5, 20.00, 4490, 2, 'Balance Edited', '2023-07-09 23:51:43', '2023-07-10 00:27:48', NULL),
(47, 5, 100.00, 4390, 3, 'Balance Withdraw', '2023-07-10 04:29:10', '2023-07-10 04:29:10', NULL),
(48, 5, 50.00, 4340, 3, 'Balance Edited', '2023-07-10 04:41:23', '2023-07-10 04:49:14', NULL),
(49, 5, 140.00, 4200, 3, 'Balance Edited', '2023-07-10 04:52:29', '2023-07-10 04:52:40', NULL),
(50, 5, 350.00, 4550, 2, 'Balance Edited', '2023-07-10 05:27:10', '2023-07-10 05:27:24', NULL),
(51, 5, 250.00, 4800, 2, 'Balance Edited', '2023-07-10 05:30:29', '2023-07-10 05:31:08', NULL),
(52, 5, 300.00, 4500, 3, 'Balance Edited', '2023-07-10 05:31:29', '2023-07-10 08:51:30', NULL),
(53, 5, 100.00, 4400, 3, 'Balance Withdraw', '2023-07-10 08:52:01', '2023-07-10 08:52:01', NULL),
(54, 5, 100.00, 4500, 2, 'Balance Added', '2023-07-10 08:52:20', '2023-07-10 08:52:20', NULL),
(55, 5, 150.00, 4650, 2, 'Balance Added', '2023-07-10 08:59:33', '2023-07-10 08:59:33', NULL),
(56, 5, 100.00, 4750, 2, 'Balance Added', '2023-07-10 09:01:33', '2023-07-10 09:01:33', NULL),
(57, 5, 50.00, 4800, 2, 'Balance Added', '2023-07-10 09:02:04', '2023-07-10 09:02:04', NULL),
(58, 5, 150.00, 4550, 3, 'Balance Edited', '2023-07-10 09:08:50', '2023-07-10 09:12:34', NULL),
(59, 5, 100.00, 4650, 2, 'Recharge', '2023-07-10 09:14:15', '2023-07-10 09:14:15', NULL),
(60, 5, 100.00, 4750, 2, 'Credit', '2023-08-10 04:10:06', '2023-08-10 04:10:06', NULL),
(61, 5, 100.00, 4650, 1, 'Purchase Approved', '2023-08-10 04:11:22', '2023-08-10 04:11:22', NULL),
(62, 5, 100.00, 4750, 2, 'Balance Added', '2023-08-10 04:27:18', '2023-08-10 04:27:18', NULL),
(63, 5, 10000.00, 14750, 2, 'Purchase declined', '2023-10-29 09:55:57', '2023-10-29 09:55:57', NULL),
(64, 5, 10.00, 4760, 2, 'Purchase declined', '2023-10-29 10:19:05', '2023-10-29 10:19:05', NULL),
(65, 5, 10.00, 4760, 2, 'Purchase declined', '2023-10-30 03:04:52', '2023-10-30 03:04:52', NULL),
(66, 5, 1000.00, 4760, 2, 'Purchase declined', '2023-10-30 03:12:43', '2023-10-30 03:12:43', NULL),
(67, 5, 1700.00, 3060, 1, 'Purchase Approved', '2023-10-30 03:15:31', '2023-10-30 03:15:31', NULL),
(68, 5, 7000.00, -3940, 1, 'Purchase Approved', '2023-10-30 03:16:15', '2023-10-30 03:16:15', NULL),
(73, 5, 10000.00, -13940, 1, 'Purchase Restored', '2023-10-30 03:26:56', '2023-10-30 03:26:56', NULL),
(74, 5, 10.00, -13950, 1, 'Purchase Restored', '2023-10-30 03:27:06', '2023-10-30 03:27:06', NULL),
(75, 5, 10.00, -13960, 1, 'Purchase Restored', '2023-10-30 03:27:10', '2023-10-30 03:27:10', NULL),
(76, 5, 1000.00, -14960, 1, 'Purchase Restored', '2023-10-30 03:27:13', '2023-10-30 03:27:13', NULL),
(77, 5, 10000.00, -24960, 1, 'Purchase Approved', '2023-10-30 03:28:24', '2023-10-30 03:28:24', NULL),
(78, 5, 10.00, -24960, 2, 'Purchase declined', '2023-10-30 03:31:21', '2023-10-30 03:31:21', NULL),
(79, 5, 10.00, -24960, 2, 'Purchase declined', '2023-10-30 03:31:27', '2023-10-30 03:31:27', NULL),
(80, 5, 1000.00, -24960, 2, 'Purchase declined', '2023-10-30 03:31:34', '2023-10-30 03:31:34', NULL),
(82, 5, 10.00, -3960, 4, 'Purchase declined', '2023-10-30 03:37:48', '2023-10-30 03:37:48', NULL),
(83, 5, 10.00, -3960, 4, 'Purchase declined', '2023-10-30 03:47:09', '2023-10-30 03:47:09', NULL),
(84, 5, 10.00, -3960, 3, 'Purchase Restored', '2023-10-30 03:47:49', '2023-10-30 03:47:49', NULL),
(85, 5, 10.00, -3970, 1, 'Purchase Approved', '2023-10-30 03:49:14', '2023-10-30 03:49:14', NULL),
(86, 5, 30.00, -3940, 2, 'Credit', '2023-11-04 10:16:59', '2023-11-04 10:16:59', NULL),
(87, 5, 60.00, -3880, 2, 'Debit', '2023-11-04 10:17:19', '2023-11-04 10:17:19', NULL),
(88, 5, 500.00, -4380, 3, 'Balance Withdraw', '2023-11-04 10:19:18', '2023-11-04 10:19:18', NULL),
(89, 5, 500.00, -4880, 3, 'Debit', '2023-11-04 13:45:29', '2023-11-04 13:45:29', NULL),
(90, 5, 20.00, -4900, 3, 'Purchase', '2023-11-04 13:46:56', '2023-11-04 13:46:56', NULL),
(91, 5, 10.00, -4910, 3, 'Purchase', '2023-11-04 13:48:40', '2023-11-04 13:48:40', NULL),
(92, 5, 10.00, -4920, 3, 'Debit', '2023-11-04 13:54:47', '2023-11-04 13:54:47', NULL),
(93, 5, 0.00, -4920, 3, 'Balance Edited', '2023-11-05 07:22:33', '2023-11-05 07:34:04', NULL),
(94, 5, 120.00, -4800, 2, 'Credit', '2023-12-08 14:30:38', '2023-12-08 14:30:38', NULL),
(95, 5, 200.00, -4600, 2, 'Credit', '2023-12-08 14:31:48', '2023-12-08 14:31:48', NULL),
(96, 5, 200.00, -4400, 2, 'Credit', '2023-12-08 14:33:30', '2023-12-08 14:33:30', NULL),
(97, 5, 200.00, -4200, 2, 'Balance Added', '2023-12-08 14:34:50', '2023-12-08 14:34:50', NULL),
(98, 5, 200.00, -4000, 2, 'Balance Added', '2023-12-08 14:36:10', '2023-12-08 14:36:10', NULL),
(99, 5, 200.00, -3800, 2, 'Balance Added', '2023-12-08 14:37:13', '2023-12-08 14:37:13', NULL),
(100, 5, 200.00, -3600, 2, 'Balance Added', '2023-12-08 15:45:50', '2023-12-08 15:45:50', NULL),
(101, 5, 200.00, -3400, 2, 'Credit', '2023-12-08 15:45:56', '2023-12-08 15:45:56', NULL),
(102, 5, 200.00, -3200, 2, 'Balance Added', '2023-12-08 16:10:40', '2023-12-08 16:10:40', NULL),
(103, 5, 50.00, -3150, 2, 'Balance Added', '2023-12-08 16:28:17', '2023-12-08 16:28:17', NULL),
(104, 5, 50.00, -3100, 2, 'Balance Added', '2023-12-08 16:28:43', '2023-12-08 16:28:43', NULL),
(105, 5, 50.00, -3050, 2, 'Balance Added', '2023-12-08 16:29:54', '2023-12-08 16:29:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `caption` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_caption` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `caption`, `sub_caption`, `filename`, `img_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, NULL, NULL, '1674088354.jpg', 1, '2023-01-18 19:02:34', '2023-01-18 19:02:34', NULL),
(15, NULL, NULL, '1674088373.jpg', 1, '2023-01-18 19:02:53', '2023-01-18 19:02:53', NULL),
(16, 'Mobile Recharge', 'Recharge Karo Aur Cash Karo', '1674088460.jpg', 2, '2023-01-18 19:04:20', '2023-01-18 19:04:20', NULL),
(17, 'Shop More Get More Gift', 'We accept all Banks Debit or Credit Card.', '1674088506.jpg', 2, '2023-01-18 19:05:06', '2023-01-18 19:05:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `image_types`
--

DROP TABLE IF EXISTS `image_types`;
CREATE TABLE IF NOT EXISTS `image_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_types`
--

INSERT INTO `image_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Banner', '2022-12-29 03:36:51', '2022-12-29 04:36:51'),
(2, 'Deals of the day', '2022-12-29 04:36:52', '2022-12-29 04:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `metainfo`
--

DROP TABLE IF EXISTS `metainfo`;
CREATE TABLE IF NOT EXISTS `metainfo` (
  `id` tinyint(4) NOT NULL,
  `value` float NOT NULL,
  `credit_limit` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metainfo`
--

INSERT INTO `metainfo` (`id`, `value`, `credit_limit`) VALUES
(1, 2001, 10);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2022_12_22_132828_create_customers_table', 2),
(8, '2022_12_22_133046_create_customer_purchases_table', 2),
(9, '2022_12_26_072622_create_customer_gifts_table', 3),
(10, '2022_12_28_160342_create_images_table', 4),
(11, '2022_12_29_043352_create_image_types_table', 5),
(12, '2023_07_03_194423_create_customer__wallets_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
CREATE TABLE IF NOT EXISTS `months` (
  `id` tinyint(11) NOT NULL,
  `name` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `months_pay_alert`
--

DROP TABLE IF EXISTS `months_pay_alert`;
CREATE TABLE IF NOT EXISTS `months_pay_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` tinyint(4) NOT NULL,
  `year` smallint(6) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months_pay_alert`
--

INSERT INTO `months_pay_alert` (`id`, `month`, `year`, `date_time`) VALUES
(1, 11, 2023, '2023-12-13 00:00:00'),
(2, 11, 2023, '2023-12-13 23:50:47');

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
CREATE TABLE IF NOT EXISTS `operators` (
  `name` char(3) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`name`) VALUES
('!='),
('<'),
('<='),
('='),
('>'),
('>='),
('All');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(0, 'Inactive'),
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'deepanjandeys@gmail.com', '2022-12-23 15:50:43', '$2y$10$i/1AgrsyofL4KRXa1iuqHui309td3xKgF10Ld8l6BX7b81nPMAkBS', NULL, '2022-12-23 15:50:44', '2022-12-23 15:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_tran_type`
--

DROP TABLE IF EXISTS `wallet_tran_type`;
CREATE TABLE IF NOT EXISTS `wallet_tran_type` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_tran_type`
--

INSERT INTO `wallet_tran_type` (`id`, `name`) VALUES
(0, 'Opening Balance'),
(1, 'Debit'),
(2, 'Credit'),
(3, 'Purchase');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE IF NOT EXISTS `years` (
  `id` tinyint(4) NOT NULL,
  `value` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `value`) VALUES
(1, 2021),
(2, 2022),
(3, 2023),
(4, 2024);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
