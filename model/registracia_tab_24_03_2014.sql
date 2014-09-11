-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2014 at 11:17 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discgolf`
--

-- --------------------------------------------------------

--
-- Table structure for table `statistics_not_registered_players`
--

CREATE TABLE IF NOT EXISTS `statistics_not_registered_players` (
  `not_registered_player_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(500) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `country` varchar(500) DEFAULT NULL,
  `club` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`not_registered_player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_registered_players`
--

CREATE TABLE IF NOT EXISTS `statistics_registered_players` (
  `register_player_id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `accom_id` int(1) DEFAULT NULL,
  `food_id` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `note` text COLLATE utf8_slovak_ci,
  `not_registered_players_id` int(11) DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8_slovak_ci DEFAULT NULL,
  `pdga_membership` varchar(200) COLLATE utf8_slovak_ci DEFAULT NULL,
  `active_saf` varchar(50) COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`register_player_id`),
  KEY `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournament_id`),
  KEY `fk_REGISTERED_PLAYERS_CATEGORIES1` (`category_id`),
  KEY `fk_REGISTERED_PLAYERS_user_profiles1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=18 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `statistics_registered_players`
--
ALTER TABLE `statistics_registered_players`
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1` FOREIGN KEY (`category_id`) REFERENCES `statistics_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1` FOREIGN KEY (`tournament_id`) REFERENCES `statistics_tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1` FOREIGN KEY (`user_id`) REFERENCES `statistics_user_profiles` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
