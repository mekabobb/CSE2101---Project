-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2018 at 01:04 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS GSA_DB;

USE GSA_DB;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `GSA_DB`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Children` (
  `CID` int(7) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Gender` char(2) NOT NULL,
  `Date_of_Entry` Year(4) NOT NULL,
  `DOB` Date NOT NULL,
  `Address1` varchar(50) NOT NULL,
  `Address2` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Dumping data for table `settings`
--

INSERT INTO `Children` (`CID`, `First_Name`, `Last_Name`, `Gender`, `Date_of_Entry`, `DOB`, `Address1`, `Address2`, `City`) VALUES
(1, 'Bobby', 'Kukuru', 'M', '2017-10-18', '210 Salty Springs', 'Newtown, Kitty', 'Georgetown'),
(2, 'Chelsie', 'Chelsieson', 'F', '2018-09-07', '123 Happiness Lane', 'Waler, Lioni', 'Diamond'),
(3, 'Toan', 'Darrkloud', 'M', '2018-09-07', '20 Somaware', 'Newtown, Kitty', 'Georgetown'),
(4, 'Chelsie', 'Chelsieson', 'F', '2018-09-07', '125 Tilted Towers', 'Central Town', 'Diamond'),
(5, 'Sarah', 'Bunuki', 'F', '2018-09-07', '200 Danger Road', 'Newtown, Kitty', 'Georgetown');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Attend` (
  `AID` int(7) NOT NULL AUTO_INCREMENT,
  `CID` int(7) NOT NULL,
  `SID` int(7) NOT NULL,
  `Date` Date NOT NULL,
  `Presence` CHAR(2) NOT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `Attend` (`AID`, `CID`, `SID`, `Date`, `Presence`) VALUES
(1, 1, 1, '2017-09-03', 'P'),
(2, 2, 1, '2017-09-03', 'P'),
(3, 3, 1, '2017-09-03', 'P'),
(4, 4, 1, '2017-09-03', 'P'),
(5, 5, 1, '2017-09-03', 'P');

CREATE TABLE IF NOT EXISTS `Session` (
  `SID` int(7) NOT NULL AUTO_INCREMENT,
  `Half_or_Whole_Day` CHAR(2) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `Session` (`SID`, `Half_or_Whole_Day`) VALUES
(1, 'W'),
(2, 'H');

CREATE TABLE IF NOT EXISTS `Drop-off_and_Receive` (
  `DID` int(7) NOT NULL AUTO_INCREMENT,
  `CID` int(7) NOT NULL,
  `GID` int(7) NOT NULL,
  `Date` Date NOT NULL,
  `Sign-in_Time` Time NOT NULL,
  `Sign-out_Time` Time NOT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `Drop-off_and_Receive` (`DID`, `CID`, `GID`, `Date`, `Sign-in_Time`, `Sign-out_Time`) VALUES
(1, 1, 1, '2017-09-03', '08:00:00', '15:22:00'),
(2, 2, 3, '2017-09-03', '08:02:45', '15:10:00'),
(3, 3, 4, '2017-09-03', '08:03:01', '15:10:00'),
(4, 4, 5, '2017-09-03', '07:52:08', '15:00:00'),
(5, 3, 6, '2017-09-03', '08:03:01', '15:10:00');

CREATE TABLE IF NOT EXISTS `Gaurdian` (
  `GID` int(7) NOT NULL AUTO_INCREMENT,
  `CID` int(7) NOT NULL,
  `Family_Type` VARCHAR(50) NOT NULL,
  `First_Name` VARCHAR(50) NOT NULL,
  `Last_Name` VARCHAR(50) NOT NULL,
  `Address1` VARCHAR(50) NOT NULL,
  `Address2` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `Telephone#` Date NOT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `Gaurdian` (`GID`, `CID`, `Family_Type`, `First_Name`, `Last_Name`, `Address1`, `Address2`, `City`, `Telephone#`) VALUES
(1, 1, 'Prashad', 'Nagaar', 'Father', '210 Salty Springs', 'Newtown, Kitty', 'Georgetown', '2204645'),
(2, 1, 'Runi', 'Lakshmi', 'Mother', '210 Salty Springs', 'Newtown, Kitty', 'Georgetown', '2204645'),
(3, 2, 'Simon', 'Sayes', 'Father', '123 Happiness Lane', 'Waler, Lioni', 'Diamond', '2246764'),
(4, 3, 'Maria', 'Ladess', 'Mother', '20 Somaware', 'Newtown, Kitty', 'Georgetown', '2214653'),
(5, 4, 'Maria', 'Ladess', 'Aunt', '125 Tilted Towers', 'Central Town', 'Diamond', '2214653'),
(6, 5, 'Lara', 'Kroft', 'Grandmother', '200 Danger Road', 'Newtown, Kitty', 'Georgetown', '2212612');

CREATE TABLE IF NOT EXISTS `Paid` (
  `PID` int(7) NOT NULL AUTO_INCREMENT,
  `GID` int(7) NOT NULL,
  `CID` int(7) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Date` Date NOT NULL,
  `Time` Time NOT NULL,
  
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `Paid` (`PID`, `GID`, `CID`, `Amount`, `Date`, `Time`) VALUES
(1, 1, 1, 60000, '2017-08-07', '10:00:00'),
(2, 2, 2, 60000, '2017-07-05', '11:58:32'),
(3, 4, 4, 60000, '2017-07-05', '11:56:10');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
