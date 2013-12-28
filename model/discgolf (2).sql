-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2013 at 06:03 PM
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
-- Table structure for table `statistics_basket`
--

CREATE TABLE IF NOT EXISTS `statistics_basket` (
  `basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `par` int(11) DEFAULT NULL,
  `shots` int(11) DEFAULT NULL,
  `lap_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`basket_id`,`lap_id`),
  KEY `fk_basket_lap1` (`lap_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `statistics_basket`
--

INSERT INTO `statistics_basket` (`basket_id`, `par`, `shots`, `lap_id`, `number`) VALUES
(1, 4, 4, 1, 1),
(2, 8, 5, 1, 2),
(3, 45, 2, 1, 3),
(4, 5, 3, 1, 4),
(5, 5, 5, 1, 5),
(6, 4, 5, 2, 1),
(7, 8, 6, 2, 2),
(8, 45, 8, 2, 3),
(9, 5, 3, 2, 4),
(10, 5, 9, 2, 5),
(11, 4, 1, 3, 1),
(12, 8, 4, 3, 2),
(13, 5, 8, 3, 4),
(14, 45, 2, 3, 3),
(15, 3, 12, 2, 6),
(16, 2, 4, 5, 1),
(17, 7, 5, 5, 2),
(18, 4, 3, 5, 4),
(19, 5, 7, 5, 5),
(20, 45, 8, 5, 6),
(21, 1, 1, 5, 7),
(22, 6, 4, 5, 8),
(23, 2, 6, 5, 9),
(24, 3, 4, 5, 10),
(25, 4, 4, 4, 1),
(26, 7, 7, 4, 2),
(27, 45, 5, 4, 3),
(28, 7, 9, 4, 4),
(29, 5, 6, 4, 5),
(30, 9, 3, 4, 6),
(31, 5, 8, 4, 7),
(32, 9, 98, 4, 8),
(33, 2, 2, 6, 1),
(34, 4, 3, 6, 2),
(35, 4, 8, 6, 3),
(36, 2, 4, 6, 4),
(37, 2, 8, 6, 5),
(38, 3, 4, 6, 6),
(39, 4, 5, 5, 3),
(40, 4, 2, 7, 1),
(41, 3, 3, 7, 2),
(42, 3, 4, 7, 3),
(43, 2, 6, 7, 4),
(44, 1, 4, 7, 5),
(45, 4, 4, 8, 1),
(46, 3, 6, 8, 2),
(47, 3, 6, 8, 3),
(48, 2, 7, 8, 4),
(49, 1, 9, 8, 5),
(50, 3, 10, 8, 6),
(51, 4, 2, 9, 1),
(52, 3, 3, 9, 2),
(53, 3, 5, 9, 3),
(54, 2, 8, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_categories`
--

CREATE TABLE IF NOT EXISTS `statistics_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `statistics_categories`
--

INSERT INTO `statistics_categories` (`category_id`, `category`) VALUES
(1, 'Junior'),
(2, 'Senior'),
(3, 'Master');

-- --------------------------------------------------------

--
-- Table structure for table `statistics_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `statistics_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `statistics_ci_sessions`
--

INSERT INTO `statistics_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('835a07ea55b430f364191779d2caec03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1388156304, 'a:18:{s:9:"user_data";s:0:"";s:7:"user_id";s:2:"12";s:8:"username";s:0:"";s:6:"status";s:1:"1";s:2:"id";s:2:"12";s:7:"country";s:8:"Slovakia";s:7:"website";N;s:10:"first_name";s:4:"Fero";s:9:"last_name";s:6:"Taraba";s:10:"birth_date";s:10:"1986-02-05";s:5:"photo";s:36:"905553fb6a893f79a9145bd411aa5de2.jpg";s:5:"thumb";s:42:"905553fb6a893f79a9145bd411aa5de2_thumb.jpg";s:6:"gender";s:4:"Male";s:4:"club";s:6:"Matfyz";s:5:"about";s:12:"Hi I am Fero";s:10:"year_score";s:3:"150";s:5:"email";s:14:"fero@taraba.sk";s:4:"role";s:5:"admin";}'),
('8c428eac511c4bd14aa9197fd8e567a6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', 1388152449, '');

-- --------------------------------------------------------

--
-- Table structure for table `statistics_lap`
--

CREATE TABLE IF NOT EXISTS `statistics_lap` (
  `lap_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `tournament_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `final` int(11) DEFAULT NULL,
  PRIMARY KEY (`lap_id`,`tournament_id`,`user_id`),
  KEY `fk_laps_statistics_tournaments1` (`tournament_id`),
  KEY `fk_laps_statistics_user_profiles1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `statistics_lap`
--

INSERT INTO `statistics_lap` (`lap_id`, `number`, `tournament_id`, `user_id`, `final`) VALUES
(1, 1, 1, 12, NULL),
(2, 2, 1, 12, NULL),
(3, 1, 1, 12, 1),
(4, 2, 2, 12, NULL),
(5, 1, 2, 12, NULL),
(6, 1, 2, 12, 1),
(7, 1, 1, 13, NULL),
(8, 2, 1, 13, NULL),
(9, 1, 1, 13, 1),
(10, 1, 1, 14, NULL),
(11, 2, 1, 14, NULL),
(12, 1, 1, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_login_attempts`
--

CREATE TABLE IF NOT EXISTS `statistics_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_number_of_baskets`
--

CREATE TABLE IF NOT EXISTS `statistics_number_of_baskets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(11) NOT NULL,
  `no_bskts_1` int(11) DEFAULT NULL,
  `no_bskts_2` int(11) DEFAULT NULL,
  `no_bskts_3` int(11) DEFAULT NULL,
  `no_bskts_4` int(11) DEFAULT NULL,
  `no_bskts_5` int(11) DEFAULT NULL,
  `no_bskts_6` int(11) DEFAULT NULL,
  `no_bskts_7` int(11) DEFAULT NULL,
  `no_bskts_8` int(11) DEFAULT NULL,
  `no_bskts_9` int(11) DEFAULT NULL,
  `no_bskts_10` int(11) DEFAULT NULL,
  `no_final_1` int(11) DEFAULT NULL,
  `no_final_2` int(11) DEFAULT NULL,
  `no_final_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_number_of_baskets_results1` (`result_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `statistics_number_of_baskets`
--

INSERT INTO `statistics_number_of_baskets` (`id`, `result_id`, `no_bskts_1`, `no_bskts_2`, `no_bskts_3`, `no_bskts_4`, `no_bskts_5`, `no_bskts_6`, `no_bskts_7`, `no_bskts_8`, `no_bskts_9`, `no_bskts_10`, `no_final_1`, `no_final_2`, `no_final_3`) VALUES
(1, 1, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2, 2, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(3, 3, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(4, 4, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_players_has_tournaments`
--

CREATE TABLE IF NOT EXISTS `statistics_players_has_tournaments` (
  `tournament_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `final` int(11) DEFAULT NULL,
  `disqualified` int(11) DEFAULT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`tournament_id`,`user_id`),
  KEY `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` (`tournament_id`),
  KEY `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` (`category_id`),
  KEY `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistics_players_has_tournaments`
--

INSERT INTO `statistics_players_has_tournaments` (`tournament_id`, `category_id`, `user_id`, `final`, `disqualified`, `score`) VALUES
(1, 1, 12, 1, NULL, 130),
(1, 1, 13, 1, NULL, 65),
(1, 2, 14, 1, NULL, 130),
(2, 2, 12, 1, NULL, 100);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_registered_players`
--

CREATE TABLE IF NOT EXISTS `statistics_registered_players` (
  `tournament_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `accommodation` tinyint(1) DEFAULT NULL,
  `nutrition` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  KEY `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournament_id`),
  KEY `fk_REGISTERED_PLAYERS_CATEGORIES1` (`category_id`),
  KEY `fk_REGISTERED_PLAYERS_user_profiles1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistics_registered_players`
--

INSERT INTO `statistics_registered_players` (`tournament_id`, `category_id`, `accommodation`, `nutrition`, `user_id`) VALUES
(3, 3, 1, 1, 12),
(1, 3, 0, 1, 12),
(2, 3, 1, 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_results`
--

CREATE TABLE IF NOT EXISTS `statistics_results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `lap_1` int(11) DEFAULT NULL,
  `lap_2` int(11) DEFAULT NULL,
  `lap_3` int(11) DEFAULT NULL,
  `lap_4` int(11) DEFAULT NULL,
  `lap_5` int(11) DEFAULT NULL,
  `lap_6` int(11) DEFAULT NULL,
  `lap_7` int(11) DEFAULT NULL,
  `lap_8` int(11) DEFAULT NULL,
  `lap_9` int(11) DEFAULT NULL,
  `lap_10` int(11) DEFAULT NULL,
  `final_1` int(11) DEFAULT NULL,
  `final_2` int(11) DEFAULT NULL,
  `final_3` int(11) DEFAULT NULL,
  `tournament_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `fk_results_tournaments1` (`tournament_id`),
  KEY `fk_results_user_profiles1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `statistics_results`
--

INSERT INTO `statistics_results` (`result_id`, `points`, `lap_1`, `lap_2`, `lap_3`, `lap_4`, `lap_5`, `lap_6`, `lap_7`, `lap_8`, `lap_9`, `lap_10`, `final_1`, `final_2`, `final_3`, `tournament_id`, `user_id`) VALUES
(1, 25, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 12),
(2, 30, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 2, 12),
(3, 28, 15, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 13),
(4, 36, 18, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_slovak_champ`
--

CREATE TABLE IF NOT EXISTS `statistics_slovak_champ` (
  `id_slovak_champ` int(11) NOT NULL AUTO_INCREMENT,
  `nmbr_accept_tourn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_slovak_champ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `statistics_slovak_champ`
--

INSERT INTO `statistics_slovak_champ` (`id_slovak_champ`, `nmbr_accept_tourn`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_tournaments`
--

CREATE TABLE IF NOT EXISTS `statistics_tournaments` (
  `tournament_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `nmbr_of_round` int(11) DEFAULT NULL,
  `nmbr_of_fnl_laps` int(11) DEFAULT NULL,
  `about` text,
  `photo` varchar(200) DEFAULT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `allow_registration` int(11) DEFAULT '0',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `par` int(11) DEFAULT NULL,
  PRIMARY KEY (`tournament_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `statistics_tournaments`
--

INSERT INTO `statistics_tournaments` (`tournament_id`, `name`, `date`, `location`, `nmbr_of_round`, `nmbr_of_fnl_laps`, `about`, `photo`, `thumb`, `allow_registration`, `lat`, `lng`, `par`) VALUES
(1, 'Matfyz', '2013-12-20', 'Mlynska Dolina', 2, 1, '<h1>Lorem ipsum</h1>\r\n<p>dolor sit amet, consectetur adipiscing elit. Suspendisse consectetur, turpis accumsan accumsan tempor, felis tortor porttitor justo, id varius odio mauris sed quam. Suspendisse potenti. Morbi dui lectus, imperdiet at mattis ut, tempus at dolor. Aenean vitae velit mi. Proin nunc tellus, interdum quis mattis ut, sodales sit amet tortor. Ut tempor ipsum id leo malesuada congue. Integer tincidunt euismod mauris, aliquet luctus urna dapibus ut. In at orci massa. Duis volutpat elit sed nisl sagittis dapibus. Nulla posuere mauris vel dictum dignissim. Nullam congue erat dui, vel scelerisque quam porttitor vel. Morbi quis dapibus ante. Nam sed velit ac sem feugiat tristique.</p>\r\n<p>Integer dignissim mollis felis ac sodales. Curabitur et feugiat magna, vel tincidunt augue. Etiam rhoncus elit a dui hendrerit condimentum. Proin quis mauris lacus. Integer molestie rhoncus ipsum sit amet malesuada. Integer volutpat ipsum vitae sem sagittis sagittis. Nulla facilisi. Nulla eget elit nibh. Fusce interdum accumsan lectus, eget bibendum felis congue ut. Nullam lacinia quam a sodales tincidunt. Donec vel dui ut est lacinia tristique. Sed vulputate tempus nisl eget hendrerit. Vestibulum et arcu arcu. Pellentesque non urna sit amet risus semper egestas sit amet porttitor tortor. Quisque posuere non neque et pellentesque.</p>\r\n<p>Maecenas et nulla in tortor condimentum convallis. Donec aliquet lectus ligula, lacinia congue odio pulvinar vel. Suspendisse eget sapien ac est dignissim tincidunt. Mauris ut accumsan leo. Donec rhoncus, mauris vel blandit pharetra, metus lectus interdum libero, sagittis mattis nulla metus vel lacus. Aenean a volutpat elit, id vulputate tortor. Phasellus venenatis mauris sapien, id lobortis dui cursus at. Mauris varius metus id enim aliquet euismod. Pellentesque vulputate rhoncus sem sit amet aliquam. Nam convallis in enim ac ullamcorper. Integer mi urna, aliquam at tellus sit amet, facilisis ornare nunc. Phasellus ultrices odio at velit venenatis consequat. Suspendisse ante nulla, dapibus nec vestibulum eget, imperdiet vel nunc. Praesent diam est, vestibulum a nisi non, fermentum commodo lectus.</p>\r\n<p>Fusce eget lacus eu ipsum consequat sagittis ornare et ligula. Nulla facilisi. Praesent gravida nisi vitae tellus congue, id laoreet erat dapibus. Sed ligula tortor, varius sed nisl feugiat, aliquam sodales nisi. Donec non enim ipsum. Sed dictum ante risus, ornare fermentum dolor mattis ac. Aliquam venenatis luctus tincidunt. In adipiscing ligula eu purus eleifend, id malesuada enim blandit. Vivamus pretium quam ut mollis vehicula. Nam mi sem, molestie a nibh ac, porttitor ultrices massa. Nulla at est sollicitudin, aliquam dui a, sodales risus. Vestibulum egestas tellus et lorem aliquam rhoncus. Nam sagittis purus eleifend, consectetur velit sed, commodo turpis. Aliquam a leo ut risus tempus imperdiet fringilla eu tortor.</p>\r\n<p>Proin commodo venenatis elit, nec luctus magna. Quisque non vulputate enim. Aliquam venenatis mi sed neque fermentum gravida sed quis tortor. Quisque ante erat, sodales eget eros eget, tempus lacinia nunc. Aenean interdum turpis mi, in congue magna auctor at. Vivamus eu neque nisi. Suspendisse dictum molestie odio, ornare consectetur lorem volutpat vel. Phasellus posuere dignissim purus a ornare. Vestibulum vel mi eu augue ultricies commodo. Sed tellus sapien, adipiscing non pharetra non, lobortis sed lorem. Donec nec placerat purus. Vestibulum euismod turpis nec ultrices scelerisque. Vivamus porta tortor et erat facilisis tincidunt. Vivamus ornare tortor id imperdiet scelerisque. Ut vel ipsum id massa facilisis mollis blandit in nunc. In sollicitudin urna facilisis, volutpat lectus sit amet, iaculis felis.</p>', 'b214c0dfab32035fc780f2d78fe4f81d.jpg', 'b214c0dfab32035fc780f2d78fe4f81d_thumb.jpg', 1, NULL, NULL, 130),
(2, 'Discgolf Turnaj', '2013-03-08', 'Madarsko', 2, 1, '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Vivamus vitae enim scelerisque, fringilla lorem sit amet, tempor est.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Nullam venenatis diam a quam cursus, sed convallis ipsum fringilla.</li>\r\n<li>Sed eu eros vitae ante tincidunt auctor a ac eros.</li>\r\n<li>Maecenas ut velit non dui consequat pellentesque.</li>\r\n<li>Proin eget lectus eu justo varius bibendum sed et neque.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Curabitur tincidunt dui eget lectus viverra porttitor.</li>\r\n<li>Nam euismod risus at velit aliquam, id semper mi mollis.</li>\r\n<li>Nullam molestie augue eget cursus rhoncus.</li>\r\n<li>Ut sit amet odio eget diam pretium egestas tristique vitae lorem.</li>\r\n<li>Donec ut tellus venenatis, lacinia lorem in, suscipit justo.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Donec suscipit lorem id luctus fermentum.</li>\r\n<li>Nullam nec purus et magna volutpat sodales.</li>\r\n<li>Integer eu orci a mauris ornare condimentum.</li>\r\n<li>Nunc in nisi eu tortor adipiscing consequat et id quam.</li>\r\n<li>Ut placerat mauris ac diam lobortis, vitae suscipit velit lacinia.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Nullam et massa quis dui fringilla laoreet.</li>\r\n<li>Aliquam id elit a urna suscipit pharetra id suscipit lorem.</li>\r\n</ul>', '4a964a7f33e45400420d2e27d10465bc.jpg', '4a964a7f33e45400420d2e27d10465bc_thumb.jpg', 1, NULL, NULL, 100),
(3, 'Super Turnaj', '2013-12-31', 'Smolenice', 3, 2, '<p><iframe src="http://www.youtube.com/embed/l0z-QzUG_Eo" width="425" height="350"></iframe>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mauris mauris, elementum condimentum pulvinar non, interdum at magna. Maecenas pulvinar neque lectus, ac fermentum lectus fringilla sit amet. Quisque turpis diam, sollicitudin euismod enim sed, adipiscing congue nulla. Aliquam non aliquam lacus, sed aliquet nunc. Cras tellus libero, varius sodales justo at, rutrum tincidunt odio. Cras at leo tellus. Sed id hendrerit nisi. Maecenas viverra blandit tortor in accumsan. Integer consectetur odio quis consectetur fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras scelerisque libero nisl, nec suscipit odio euismod eget.</p>\r\n<ol>\r\n<li>Donec viverra est ac eros mattis cursus. Maecenas scelerisque augue in est egestas vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec diam ipsum. Ut consectetur orci vel metus elementum, auctor pulvinar tortor condimentum. Aenean dictum convallis massa, ut rutrum turpis adipiscing et. In consectetur cursus arcu, et cursus tortor porttitor id. Suspendisse sagittis urna non diam mollis venenatis. Phasellus interdum leo sed consectetur vehicula. Praesent semper turpis ac turpis lacinia, in convallis odio laoreet. Donec vehicula lorem in vulputate gravida. Curabitur feugiat nec eros laoreet facilisis. Curabitur velit metus, vulputate et euismod iaculis, euismod quis tortor. Praesent neque elit, ultrices et ante sit amet, facilisis luctus nulla. Nullam dictum gravida mauris, eget varius sapien convallis in. Aliquam in eleifend ligula, porta congue nisl.</li>\r\n<li>Maecenas et dolor dictum, placerat metus sit amet, mattis dolor. Phasellus dignissim enim eu elit eleifend, eget commodo sem luctus. In interdum dolor felis, quis vulputate nunc pretium nec. Fusce eu sollicitudin nisl. Aenean in facilisis neque. Pellentesque volutpat eleifend posuere. Pellentesque porta erat a iaculis tincidunt. Duis vel sem malesuada, facilisis ligula in, condimentum lorem. Duis rutrum, velit vitae consectetur vestibulum, erat erat aliquam massa, non consectetur sem urna a neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ut orci eu velit gravida volutpat in id mauris. Praesent risus felis, elementum sed vestibulum ac, lacinia eget justo. Proin elementum leo nec dolor rutrum, at viverra eros semper. Suspendisse quis porta nibh. Nam pulvinar laoreet justo fermentum vulputate.</li>\r\n<li>Mauris adipiscing mollis sapien, sed dapibus dui rutrum a. Donec ut euismod tellus. Nunc elit ante, rutrum sit amet arcu ut, semper scelerisque tellus. Nunc elementum lacus nec nisl rutrum aliquam. Nulla eu lacus suscipit, pretium diam nec, lacinia enim. Proin condimentum augue porttitor nisl blandit gravida. Aliquam sed ullamcorper augue, vitae tempus dolor. Nunc tristique vitae purus ut vulputate. Cras a aliquam sapien. Nullam cursus velit vitae leo sollicitudin, eget auctor justo viverra. Nulla rhoncus mauris in enim ornare lacinia.</li>\r\n<li>Nam tempor justo vel mauris lacinia, at dapibus tortor malesuada. Nullam pharetra pellentesque velit, tincidunt ornare metus ultricies non. Donec tristique dapibus magna, in rutrum purus commodo non. Fusce urna ligula, dapibus porttitor nunc eget, dictum fringilla turpis. Mauris mattis venenatis euismod. Cras sed tellus libero. In in ipsum lacus. Phasellus pulvinar felis ac libero scelerisque, et aliquet lacus malesuada. Morbi at risus eget ipsum volutpat aliquam. Maecenas eleifend scelerisque pretium. Vestibulum egestas lacinia ultrices. Morbi varius augue a purus mattis bibendum. Maecenas luctus quam ac diam venenatis laoreet. Duis et consectetur lorem. Cras convallis arcu ac tempor auctor. Curabitur sed enim nec purus lacinia aliquam nec sit amet lorem.</li>\r\n<li>Donec viverra orci vitae semper accumsan. Integer adipiscing aliquet lorem. Donec in porttitor lacus. Curabitur venenatis dolor id lorem condimentum facilisis. Integer vel aliquam est, vel accumsan nunc. Nunc sed risus sit amet lectus interdum facilisis. Praesent interdum felis enim, eget iaculis sem convallis nec. Praesent nec ligula diam. Nullam adipiscing magna id porttitor accumsan. Integer accumsan, est in facilisis elementum, purus nunc mattis massa, nec luctus quam mauris quis sapien. Donec euismod arcu lectus, vestibulum commodo ante cursus ac. Curabitur tempus feugiat adipiscing. Fusce suscipit et leo eget aliquet. Nam at porta enim.</li>\r\n<li>Curabitur consequat, enim ut tincidunt tincidunt, magna nunc luctus justo, a consequat tellus diam sit amet justo. Fusce ligula orci, accumsan non massa a, ultrices aliquam odio. Aliquam venenatis varius ante nec viverra. Donec a velit pharetra, consectetur lorem at, condimentum massa. Quisque commodo dui ultricies, tristique ante at, adipiscing dui. Etiam non ante orci. Nam in purus velit. Phasellus odio sapien, cursus at nisl eu, dignissim rhoncus ipsum. Sed a ligula ornare, luctus felis at, euismod elit. Donec posuere nunc erat, egestas viverra ante pulvinar ultrices. Sed ut elit nec tellus facilisis fermentum vitae ut leo. Suspendisse at luctus augue. Aenean ultrices ipsum id consequat volutpat. Donec lorem est, tincidunt eget est sit amet, condimentum interdum dui. Maecenas faucibus purus metus, ut dapibus lorem convallis eu.</li>\r\n<li>Nulla eget convallis purus, in laoreet elit. Nam aliquet erat enim, id facilisis lectus luctus ut. Donec ut dignissim eros. Vivamus urna velit, rhoncus a purus sit amet, eleifend cursus augue. Proin tempus purus sed nisl accumsan rutrum. Suspendisse in facilisis libero. Nulla venenatis dignissim lacus, non dapibus dolor rutrum non.</li>\r\n</ol>', '673cac12b8058d0da98db516441c866f.jpg', '673cac12b8058d0da98db516441c866f_thumb.jpg', 1, NULL, NULL, NULL),
(4, 'Stary turnaj', '2012-06-14', 'Kosice', 3, 1, '<ul >\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n</ul>\r <p >&nbsp;</p>\r <p >&nbsp;</p>\r <ul >\r\n<li>Ut interdum massa ut turpis tempus rutrum.</li>\r\n</ul>\r <p >&nbsp;</p>\r <p >&nbsp;</p>\r <ul >\r\n<li>Quisque id libero ac mauris interdum rutrum ut ut nisl.</li>\r\n<li>Aenean malesuada justo ac nibh cursus, quis feugiat tortor porttitor.</li>\r\n<li>Integer congue mi at blandit ornare.</li>\r\n<li>Donec eget arcu porta, pharetra felis vel, pulvinar elit.</li>\r\n<li>Phasellus dignissim sem commodo purus sagittis tempus.</li>\r\n</ul>\r <p >&nbsp;</p>\r <p >&nbsp;</p>\r <ul >\r\n<li>Donec molestie mauris et mi malesuada, et rhoncus quam viverra.</li>\r\n<li>Phasellus in mauris a turpis congue rhoncus.</li>\r\n</ul>\r <p >&nbsp;</p>\r <p >&nbsp;</p>\r <ul >\r\n<li>Morbi euismod velit sit amet diam tempor, sit amet suscipit justo euismod.</li>\r\n<li>Maecenas a diam non dolor vehicula aliquet.</li>\r\n<li>Etiam pretium enim a quam consectetur, id rhoncus ipsum iaculis.</li>\r\n</ul>', '6738f2ac1f1f021268fa71b9de94de5f.jpg', '6738f2ac1f1f021268fa71b9de94de5f_thumb.jpg', 1, NULL, NULL, NULL),
(5, 'Test tournament', '2013-12-28', 'Trencin', 2, 1, '<p><img src="../../../tinymce/plugins/emoticons/img/smiley-laughing.gif" alt="" />Nadpis</p>\r\n<p>drgsregrtgrteg wtrhgtrhe&nbsp;trgw theh yteh yth rhy trhter ye h rh yh yeh yt</p>', NULL, NULL, 1, 10.23, 56.356, NULL),
(6, 'test', '2013-12-26', 'mardof', 4, 5, '<div class="lang-php prettyprint prettyprinted">Lorem ipsum dolor sit amet, nam timeam epicuri ea, at est suscipit torquatos omittantur, eu has modus dicit detracto. Qui id aeterno impedit indoctum, et sea mucius commodo temporibus, an qui agam sadipscing persequeris. Id pri viderer impedit, in partem eripuit delicata eum. Doctus elaboraret mea cu. Cum ut inermis mentitum maiestatis.<br /><br />Dolor consulatu sea et, elitr partiendo duo in. Dicta doming quaestio ad cum. Deseruisse incorrupte ad pri. Vel case consulatu at, sea latine voluptatum cu, per enim aliquam fabulas ne. Assum platonem philosophia sit ea. No bonorum minimum qui, no dissentias cotidieque cum, sea ea brute dissentias necessitatibus.<br /><br />Est atqui populo dolores cu, periculis accusamus mnesarchum ne mei. In agam autem maluisset nec. Porro nostrum honestatis cu duo, ubique alterum fuisset et sit. Et solum timeam complectitur cum. Ius suas graece vocent te, magna mandamus contentiones eam ut, libris ponderum mandamus vim in. Id tollit labores mei, sea ne tale senserit periculis.<br /><br />Ut discere argumentum vel, graecis singulis contentiones ei mea. Viris intellegam in qui, recusabo maiestatis eum eu. Vidisse consectetuer vis eu. Et eruditi intellegebat duo. Duo maiestatis definiebas at, soleat nominati eam at.<br /><br />Cum in audire dolorem euripidis, vis eu iracundia interpretaris. Nam posse mediocritatem ea, ea vel tacimates referrentur. Laoreet deleniti definitiones sea at, ex dictas delicatissimi sea. Noluisse invidunt quaestio te pro, sit veniam debitis perfecto eu. Has animal aperiam cu.</div>', NULL, NULL, 1, 48.567520374, 19.149169922, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_users`
--

CREATE TABLE IF NOT EXISTS `statistics_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'user',
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

--
-- Dumping data for table `statistics_users`
--

INSERT INTO `statistics_users` (`id`, `role`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(12, 'admin', '', '$2a$08$eJT8IPE/hABgGUZBQsel6.l/y1/pC1XvFmiWtgZLp7yBJDSpaa5kW', 'fero@taraba.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2013-12-27 10:38:12', '2013-12-09 15:11:30', '2013-12-27 10:38:12'),
(13, 'user', 'auto', '', '', 2, 0, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00 00:00:00', '2013-12-09 17:06:23', '2013-12-09 17:06:23'),
(14, 'user', '', '$2a$08$67iTcpJuNSiE.fOyTLjnfe4EFfV9kISUa9X4BM9gUtuZ79ZZT4CL.', 'vlado@mail.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2013-12-09 17:20:52', '2013-12-09 23:05:33'),
(15, 'user', '', '$2a$08$FqLAw1JJLWtJmAgRAdm9..On78BtxxbyXL6pPYmAKYK8RiD3x.bkW', 'new@mail.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2013-12-09 17:44:44', '2013-12-25 18:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `statistics_user_autologin`
--

CREATE TABLE IF NOT EXISTS `statistics_user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `fk_user_autologin_users1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_user_profiles`
--

CREATE TABLE IF NOT EXISTS `statistics_user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_bin DEFAULT 'default.png',
  `thumb` varchar(255) COLLATE utf8_bin DEFAULT 'default-thumb.png',
  `gender` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `club` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `about` text COLLATE utf8_bin,
  `user_id` int(11) NOT NULL,
  `year_score` double NOT NULL,
  `slovak_champ_score` double DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_user_profiles_users1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Dumping data for table `statistics_user_profiles`
--

INSERT INTO `statistics_user_profiles` (`id`, `country`, `website`, `first_name`, `last_name`, `birth_date`, `photo`, `thumb`, `gender`, `club`, `about`, `user_id`, `year_score`, `slovak_champ_score`) VALUES
(11, 'Slovakia', NULL, 'Fero', 'Taraba', '1986-02-05', '905553fb6a893f79a9145bd411aa5de2.jpg', '905553fb6a893f79a9145bd411aa5de2_thumb.jpg', 'Male', 'Matfyz', 'Hi I am Fero', 12, 230, 130),
(12, NULL, NULL, 'Jan', 'Slovak', '2013-12-19', 'default.png', 'default-thumb.png', 'Male', 'Slovaci', NULL, 13, 65, 65),
(13, 'Slovakia', NULL, 'Vlado', 'Lalik', '1992-07-09', 'default.png', 'default-thumb.png', 'Female', 'Club', 'Vladoooooooooo', 14, 130, 130),
(14, 'fewf', NULL, 'Adam', 'Velky', '2013-12-05', 'default.png', 'default-thumb.png', 'Male', 'sdfaf', 'seafb rea arg ', 15, 0, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `statistics_basket`
--
ALTER TABLE `statistics_basket`
  ADD CONSTRAINT `fk_basket_lap1` FOREIGN KEY (`lap_id`) REFERENCES `statistics_lap` (`lap_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_lap`
--
ALTER TABLE `statistics_lap`
  ADD CONSTRAINT `fk_laps_statistics_tournaments1` FOREIGN KEY (`tournament_id`) REFERENCES `statistics_tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_laps_statistics_user_profiles1` FOREIGN KEY (`user_id`) REFERENCES `statistics_user_profiles` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_number_of_baskets`
--
ALTER TABLE `statistics_number_of_baskets`
  ADD CONSTRAINT `fk_number_of_baskets_results1` FOREIGN KEY (`result_id`) REFERENCES `statistics_results` (`result_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_players_has_tournaments`
--
ALTER TABLE `statistics_players_has_tournaments`
  ADD CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` FOREIGN KEY (`category_id`) REFERENCES `statistics_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` FOREIGN KEY (`tournament_id`) REFERENCES `statistics_tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` FOREIGN KEY (`user_id`) REFERENCES `statistics_user_profiles` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_registered_players`
--
ALTER TABLE `statistics_registered_players`
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1` FOREIGN KEY (`category_id`) REFERENCES `statistics_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1` FOREIGN KEY (`tournament_id`) REFERENCES `statistics_tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1` FOREIGN KEY (`user_id`) REFERENCES `statistics_user_profiles` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_results`
--
ALTER TABLE `statistics_results`
  ADD CONSTRAINT `fk_results_tournaments1` FOREIGN KEY (`tournament_id`) REFERENCES `statistics_tournaments` (`tournament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_results_user_profiles1` FOREIGN KEY (`user_id`) REFERENCES `statistics_user_profiles` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_user_autologin`
--
ALTER TABLE `statistics_user_autologin`
  ADD CONSTRAINT `fk_user_autologin_users1` FOREIGN KEY (`user_id`) REFERENCES `statistics_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `statistics_user_profiles`
--
ALTER TABLE `statistics_user_profiles`
  ADD CONSTRAINT `fk_user_profiles_users1` FOREIGN KEY (`user_id`) REFERENCES `statistics_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
