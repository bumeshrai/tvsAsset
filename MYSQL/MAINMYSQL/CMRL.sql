-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 29, 2016 at 12:40 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CMRL`
--
CREATE DATABASE IF NOT EXISTS `CMRL` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `CMRL`;

-- --------------------------------------------------------

--
-- Table structure for table `apiuser`
--

DROP TABLE IF EXISTS `apiuser`;
CREATE TABLE IF NOT EXISTS `apiuser` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lastlogged` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `apiuser`
--

TRUNCATE TABLE `apiuser`;
-- --------------------------------------------------------

--
-- Table structure for table `AssetCodes`
--

DROP TABLE IF EXISTS `AssetCodes`;
CREATE TABLE IF NOT EXISTS `AssetCodes` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `assetcode` varchar(100) NOT NULL,
  `Ecode` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `assetcode` (`assetcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `AssetCodes`
--

TRUNCATE TABLE `AssetCodes`;
--
-- Dumping data for table `AssetCodes`
--

INSERT INTO `AssetCodes` (`ID`, `assetcode`, `Ecode`) VALUES
(1, 'C2/STI/LHS/TVF/01/FW/Sept 2015', 1),
(2, 'C2/STI/LHS/TVD/01/TX/Sept 2015', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE IF NOT EXISTS `Equipment` (
  `Ecode` int(10) NOT NULL,
  `Name` varchar(80) NOT NULL,
  PRIMARY KEY (`Ecode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `Equipment`
--

TRUNCATE TABLE `Equipment`;
--
-- Dumping data for table `Equipment`
--

INSERT INTO `Equipment` (`Ecode`, `Name`) VALUES
(1, 'Tunnel_Ventilation_Fan'),
(2, 'Tunnel_Ventilation_Damper');

-- --------------------------------------------------------

--
-- Table structure for table `errorlog`
--

DROP TABLE IF EXISTS `errorlog`;
CREATE TABLE IF NOT EXISTS `errorlog` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Message` varchar(300) NOT NULL,
  `assetcode` varchar(100) NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `errorlog`
--

TRUNCATE TABLE `errorlog`;
--
-- Dumping data for table `errorlog`
--

INSERT INTO `errorlog` (`id`, `Name`, `Message`, `assetcode`, `archive`) VALUES
(1, 'Header', 'Sample Error', 'C2/STI/LHS/TVF/01/FW/Sept 2015', 0);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(10) NOT NULL,
  `assetcode` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `history`
--

TRUNCATE TABLE `history`;
-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
CREATE TABLE IF NOT EXISTS `Location` (
  `Lcode` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  KEY `Lcode` (`Lcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `Location`
--

TRUNCATE TABLE `Location`;
-- --------------------------------------------------------

--
-- Table structure for table `Maintainence`
--

DROP TABLE IF EXISTS `Maintainence`;
CREATE TABLE IF NOT EXISTS `Maintainence` (
  `mnid` int(10) NOT NULL,
  `Ecode` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `timer` int(10) DEFAULT NULL,
  UNIQUE KEY `mnid` (`mnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `Maintainence`
--

TRUNCATE TABLE `Maintainence`;
--
-- Dumping data for table `Maintainence`
--

INSERT INTO `Maintainence` (`mnid`, `Ecode`, `Name`, `timer`) VALUES
(0, 0, '', NULL),
(1, 1, 'Check_Impeller', 91),
(2, 1, 'Lubricate_Motor', 364),
(3, 1, 'Secure_Wiring', 182),
(4, 1, 'Clear_Terminal_Box', 182),
(5, 1, 'Check_Insulation', 182),
(6, 1, 'Check_Blade_Tips', 91),
(7, 1, 'Tighten_Flexi_Nuts', 182),
(8, 1, 'General_Cleaning', 91),
(9, 2, 'Clean_Blades', 91),
(10, 2, 'Check_Linkages', 91),
(11, 2, 'Manual_Closeopen', 91),
(12, 2, 'Frame_Tightness', 364),
(13, 2, 'Actuator_Wiring', 182);

-- --------------------------------------------------------

--
-- Table structure for table `Manu_det`
--

DROP TABLE IF EXISTS `Manu_det`;
CREATE TABLE IF NOT EXISTS `Manu_det` (
  `Mid` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `ctno` bigint(20) NOT NULL,
  `ctname` varchar(100) NOT NULL,
  `ctno2` bigint(20) DEFAULT NULL,
  `ctname2` varchar(100) DEFAULT NULL,
  `Ecode` int(10) NOT NULL,
  `Pname` varchar(60) NOT NULL,
  PRIMARY KEY (`Mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `Manu_det`
--

TRUNCATE TABLE `Manu_det`;
--
-- Dumping data for table `Manu_det`
--

INSERT INTO `Manu_det` (`Mid`, `Name`, `email`, `ctno`, `ctname`, `ctno2`, `ctname2`, `Ecode`, `Pname`) VALUES
(1, 'CMRLGOV', 'cmrl@cmrlgov.in', 8144010101, 'CMRLGOVERNER', 8144080808, 'CMRLGOVERNER2', 1, 'FAN_SIDE');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncate table before insert `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncate table before insert `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `permissions`
--

TRUNCATE TABLE `permissions`;
-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncate table before insert `permission_role`
--

TRUNCATE TABLE `permission_role`;
-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `roles`
--

TRUNCATE TABLE `roles`;
-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncate table before insert `role_user`
--

TRUNCATE TABLE `role_user`;
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohan Rajan', 'mohanrajan1996@gmail.com', '$2y$10$cN1NhniVBVCt/lOXmXGbteNCPxehs9HcjUJ3ZqKTrAUy.zgn.EAn.', '8R0iGYDnjQiHDO3eyROy3Hzxd34ctMnQVmvjL200AyFHdi83MOMhKtS2jyI8', '2015-11-06 15:40:51', '2015-11-06 15:47:21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
