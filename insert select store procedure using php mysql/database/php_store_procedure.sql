-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2016 at 08:57 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php_store_procedure`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee`()
SELECT `lastname`,`changedat` FROM employees_audit$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCountry`(IN `country_name` VARCHAR(255))
BEGIN
INSERT INTO country(country_name) VALUES(country_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectCountry`()
BEGIN
SELECT * FROM country ORDER BY country_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `users`()
SELECT username,name FROM users$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(6, 'India'),
(7, 'Nepal'),
(8, 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

CREATE TABLE IF NOT EXISTS `customer_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_number` varchar(255) NOT NULL,
  `customerLevel` varchar(10) NOT NULL,
  `creditlimit` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employees_audit`
--

CREATE TABLE IF NOT EXISTS `employees_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeNumber` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employees_audit`
--

INSERT INTO `employees_audit` (`id`, `employeeNumber`, `lastname`, `changedat`, `action`) VALUES
(1, 150, 'Paswan', '2015-12-14 00:00:00', 'update');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
