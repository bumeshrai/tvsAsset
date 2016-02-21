-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2016 at 12:22 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tvs`
--

-- --------------------------------------------------------

--
-- Table structure for table `apiuser`
--

CREATE TABLE IF NOT EXISTS `apiuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lastlogged` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `apiuser`
--

INSERT INTO `apiuser` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`, `lastlogged`) VALUES
(1, 'Maintainence1', 'mohan@gmail.com', 'password', '2016-01-13 22:31:08', '2016-01-13 22:31:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `AssetCodes`
--

CREATE TABLE IF NOT EXISTS `AssetCodes` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `assetcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ecode` int(10) NOT NULL,
  `Lcode` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `assetcode` (`assetcode`),
  KEY `Ecode` (`Ecode`),
  KEY `Lcode` (`Lcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `AssetCodes`
--

INSERT INTO `AssetCodes` (`ID`, `assetcode`, `Ecode`, `Lcode`) VALUES
(1, 'C2/STI/LHS/TVF/01/FW/Sept 2015', 1, 1),
(2, 'C2/STI/LHS/TVD/01/TX/Sept 2015', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE IF NOT EXISTS `Equipment` (
  `Ecode` int(10) NOT NULL,
  `Name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Ecode`),
  UNIQUE KEY `Ecode_2` (`Ecode`),
  KEY `Ecode` (`Ecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `errorlog` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Message` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `assetcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetcode` (`assetcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `errorlog`
--

INSERT INTO `errorlog` (`id`, `Name`, `Message`, `assetcode`, `archive`) VALUES
(1, 'Header', 'Sample Error', 'C2/STI/LHS/TVF/01/FW/Sept 2015', 0),
(2, 'Header', 'Sample Error', 'C2/STI/LHS/TVF/01/FW/Sept 2015', 0);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(10) NOT NULL,
  `assetcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `assetcode` (`assetcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `assetcode`, `username`, `created_at`, `updated_at`, `status`) VALUES
(1, 'C2/STI/LHS/TVF/01/FW/Sept 2015', 'Mohan Rajan', '2015-11-18 09:26:56', NULL, 'QR_FETCH'),
(2, 'C2/STI/LHS/TVF/01/FW/Sept 2015', 'Hello user', '2015-11-18 09:26:56', NULL, 'CHANGED'),
(3, 'C2/STI/LHS/TVD/01/TX/Sept 2015', 'Different User', '2015-11-23 11:49:01', NULL, 'QR_FETCH'),
(4, 'C2/STI/LHS/TVD/01/TX/Sept 2015', 'Diff User 2', '2015-11-23 11:49:01', NULL, 'CHANGED');

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE IF NOT EXISTS `Location` (
  `Lcode` int(10) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `Lcode` (`Lcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`Lcode`, `Name`) VALUES
(1, 'Thirumangalam');

-- --------------------------------------------------------

--
-- Table structure for table `Maintainence`
--

CREATE TABLE IF NOT EXISTS `Maintainence` (
  `mnid` int(10) NOT NULL,
  `Ecode` int(10) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timer` int(10) DEFAULT NULL,
  PRIMARY KEY (`mnid`),
  UNIQUE KEY `mnid` (`mnid`),
  KEY `Ecode` (`Ecode`),
  KEY `Ecode_2` (`Ecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Maintainence`
--

INSERT INTO `Maintainence` (`mnid`, `Ecode`, `Name`, `timer`) VALUES
(1, 1, 'Check_Impeller', 91),
(2, 1, 'Lubricate_Motor', 364),
(3, 1, 'Secure_Wiring', 182),
(4, 1, 'Clean_Terminal_Box', 182),
(5, 1, 'Check_Insulation', 182),
(6, 1, 'Check_Blade_Tips', 91),
(7, 1, 'Tighten_Flexi_Nuts', 182),
(8, 1, 'General_Cleaning', 91),
(9, 2, 'Clean_Blades', 91),
(10, 2, 'Check_Linkages', 91),
(11, 2, 'Manual_closeopen', 91),
(12, 2, 'Frame_Tightness', 364),
(13, 2, 'Actuator_Wiring', 182);

-- --------------------------------------------------------

--
-- Table structure for table `Manu_det`
--

CREATE TABLE IF NOT EXISTS `Manu_det` (
  `Mid` int(10) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ctno` bigint(20) NOT NULL,
  `ctname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ctno2` bigint(20) DEFAULT NULL,
  `ctname2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ecode` int(10) NOT NULL,
  `Pname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Mid`),
  KEY `Ecode` (`Ecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Manu_det`
--

INSERT INTO `Manu_det` (`Mid`, `Name`, `email`, `ctno`, `ctname`, `ctno2`, `ctname2`, `Ecode`, `Pname`) VALUES
(1, 'CMRLGOV', 'cmrl@cmrlgov.in', 8144010101, 'CMRLGOVERNER', 8144080808, 'CMRLGOVERNER2', 1, 'FAN_SIDE');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_11_18_114715_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'He will be the Administrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Tunnel_Ventilation_Damper`
--

CREATE TABLE IF NOT EXISTS `Tunnel_Ventilation_Damper` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `AssetCode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Clean_Blades` tinyint(1) DEFAULT '0',
  `Clean_Blades_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Check_Linkages` tinyint(1) DEFAULT '0',
  `Check_Linkages_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Manual_closeopen` tinyint(1) DEFAULT '0',
  `Manual_closeopen_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Frame_Tightness` tinyint(1) DEFAULT '0',
  `Frame_Tightness_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Actuator_Wiring` tinyint(1) NOT NULL DEFAULT '0',
  `Actuator_Wirig_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Tunnel_Ventilation_Damper`
--

INSERT INTO `Tunnel_Ventilation_Damper` (`id`, `AssetCode`, `Clean_Blades`, `Clean_Blades_d`, `Check_Linkages`, `Check_Linkages_d`, `Manual_closeopen`, `Manual_closeopen_d`, `Frame_Tightness`, `Frame_Tightness_d`, `Actuator_Wiring`, `Actuator_Wirig_d`) VALUES
(1, 'C2/STI/LHS/TVD/01/TX/Sept 2015', 0, '91', 0, '91', 0, '91', 0, '364', 0, '182');

-- --------------------------------------------------------

--
-- Table structure for table `Tunnel_Ventilation_Fan`
--

CREATE TABLE IF NOT EXISTS `Tunnel_Ventilation_Fan` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `AssetCode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Check_Impeller` tinyint(1) NOT NULL DEFAULT '0',
  `Check_Impeller_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Lubricate_Motor` tinyint(1) NOT NULL DEFAULT '0',
  `Lubricate_Motor_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Secure_Wiring` tinyint(1) NOT NULL DEFAULT '0',
  `Secure_Wiring_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Clean_Terminal_Box` tinyint(1) NOT NULL DEFAULT '0',
  `Clean_Terminal_Box_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Check_Insulation` tinyint(1) NOT NULL DEFAULT '0',
  `Check_Insulation_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Check_Blade_Tips` tinyint(1) NOT NULL DEFAULT '0',
  `Check_Blade_Tips_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Tighten_Flexi_Nuts` tinyint(1) NOT NULL DEFAULT '0',
  `Tighten_Flexi_Nuts_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `General_Cleaning` tinyint(1) NOT NULL DEFAULT '0',
  `General_Cleaning_d` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Tunnel_Ventilation_Fan`
--

INSERT INTO `Tunnel_Ventilation_Fan` (`id`, `AssetCode`, `Check_Impeller`, `Check_Impeller_d`, `Lubricate_Motor`, `Lubricate_Motor_d`, `Secure_Wiring`, `Secure_Wiring_d`, `Clean_Terminal_Box`, `Clean_Terminal_Box_d`, `Check_Insulation`, `Check_Insulation_d`, `Check_Blade_Tips`, `Check_Blade_Tips_d`, `Tighten_Flexi_Nuts`, `Tighten_Flexi_Nuts_d`, `General_Cleaning`, `General_Cleaning_d`) VALUES
(1, 'C2/STI/LHS/TVF/01/FW/Sept 2015', 0, '91', 0, '364', 0, '182', 0, '182', 0, '182', 0, '91', 0, '182', 0, '91');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohan Rajan', 'mohanrajan1996@gmail.com', '$2y$10$c8TfHOmiYPu1O4dz9QEoOOFkV.g4wcGn9NI5zW2K1aciwAlF18opG', 'klp7rnPBPdrLNyT8cBLqJDL3z7mQTFNWOB6eGmffZ5F1oYq4mDSWebl9vmXZ', '2015-11-18 19:22:54', '2015-11-26 17:13:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AssetCodes`
--
ALTER TABLE `AssetCodes`
  ADD CONSTRAINT `Ecode in AssetCodes` FOREIGN KEY (`Ecode`) REFERENCES `Equipment` (`Ecode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Lcode in AssetCodes` FOREIGN KEY (`Lcode`) REFERENCES `Location` (`Lcode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `errorlog`
--
ALTER TABLE `errorlog`
  ADD CONSTRAINT `AssetCode in ErrorLog` FOREIGN KEY (`assetcode`) REFERENCES `AssetCodes` (`assetcode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `AssetCode in History` FOREIGN KEY (`assetcode`) REFERENCES `AssetCodes` (`assetcode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Maintainence`
--
ALTER TABLE `Maintainence`
  ADD CONSTRAINT `Ecode in Maintainence` FOREIGN KEY (`Ecode`) REFERENCES `Equipment` (`Ecode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Manu_det`
--
ALTER TABLE `Manu_det`
  ADD CONSTRAINT `Ecode on Manu_det` FOREIGN KEY (`Ecode`) REFERENCES `Equipment` (`Ecode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
