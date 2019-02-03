-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2011 at 04:16 PM
-- Server version: 5.1.44
-- PHP Version: 5.2.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lisdDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisd`
--

CREATE TABLE `tbl_lisd` (
  `lisdID` int(10) NOT NULL AUTO_INCREMENT,
  `librarianID` int(10) NOT NULL,
  `departmentID` int(10) NOT NULL,
  `classTypeID` int(10) NOT NULL,
  `classDate` datetime NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `courseNumber` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `undergraduates` int(10) NOT NULL,
  `graduates` int(10) NOT NULL,
  `faculty` int(10) NOT NULL,
  `other` int(10) NOT NULL,
  `locationID` int(10) NOT NULL,
  PRIMARY KEY (`lisdID`),
  KEY `IX_tbl_lisd_classTypeID` (`classTypeID`),
  KEY `IX_tbl_lisd_departmentID` (`departmentID`),
  KEY `IX_tbl_lisd_librarianID` (`librarianID`),
  KEY `IX_tbl_lisd_locationID` (`locationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1273 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisdClassType`
--

CREATE TABLE `tbl_lisdClassType` (
  `classTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `classType` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`classTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisdDepartment`
--

CREATE TABLE `tbl_lisdDepartment` (
  `departmentID` int(10) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) NOT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisdLibrarian`
--

CREATE TABLE `tbl_lisdLibrarian` (
  `librarianID` int(10) NOT NULL AUTO_INCREMENT,
  `librarian` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`librarianID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisdLocation`
--

CREATE TABLE `tbl_lisdLocation` (
  `locationID` int(10) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`locationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisdLogin`
--

CREATE TABLE `tbl_lisdLogin` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `role` int(10) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lisd_test`
--

CREATE TABLE `tbl_lisd_test` (
  `lisdID` int(10) NOT NULL AUTO_INCREMENT,
  `librarianID` int(10) NOT NULL,
  `departmentID` int(10) NOT NULL,
  `classTypeID` int(10) NOT NULL,
  `classDate` datetime NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `courseNumber` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `undergraduates` int(10) NOT NULL,
  `graduates` int(10) NOT NULL,
  `faculty` int(10) NOT NULL,
  `other` int(10) NOT NULL,
  `locationID` int(10) NOT NULL,
  PRIMARY KEY (`lisdID`),
  KEY `IX_tbl_lisd_classTypeID` (`classTypeID`),
  KEY `IX_tbl_lisd_departmentID` (`departmentID`),
  KEY `IX_tbl_lisd_librarianID` (`librarianID`),
  KEY `IX_tbl_lisd_locationID` (`locationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=977 ;
