-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 04, 2014 at 12:23 AM
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
  `par` int(11) DEFAULT '0',
  `shots` int(11) DEFAULT NULL,
  `lap_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`basket_id`,`lap_id`),
  KEY `fk_basket_lap1` (`lap_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=18690 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_categories`
--

CREATE TABLE IF NOT EXISTS `statistics_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `statistics_categories`
--

INSERT INTO `statistics_categories` (`category_id`, `category`) VALUES
(1, 'OPEN Junior'),
(2, 'WOMEN Junior'),
(3, 'OPEN Master'),
(4, 'WOMEN Master'),
(5, 'OPEN'),
(6, 'WOMEN');

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
('5bddee34a847818057da79b9fa2ffcac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.36', 1391473363, 'a:19:{s:9:"user_data";s:0:"";s:7:"user_id";s:2:"12";s:8:"username";s:0:"";s:6:"status";s:1:"1";s:2:"id";s:2:"12";s:7:"country";N;s:7:"website";N;s:10:"first_name";s:5:"Admin";s:9:"last_name";s:5:"admin";s:10:"birth_date";s:10:"1981-05-05";s:5:"photo";s:36:"e1e0f51c5899db49ca33b7c1562cebf3.png";s:5:"thumb";s:42:"e1e0f51c5899db49ca33b7c1562cebf3_thumb.png";s:6:"gender";s:4:"Male";s:4:"club";N;s:5:"about";N;s:18:"slovak_champ_score";N;s:10:"ranking_id";N;s:5:"email";s:14:"admin@admin.sk";s:4:"role";s:5:"admin";}');

-- --------------------------------------------------------

--
-- Table structure for table `statistics_foreign_tournaments`
--

CREATE TABLE IF NOT EXISTS `statistics_foreign_tournaments` (
  `foreign_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `score` double NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`foreign_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=21 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=1436 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=355 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_ranking`
--

CREATE TABLE IF NOT EXISTS `statistics_ranking` (
  `ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_score` double DEFAULT NULL,
  `women_score` double DEFAULT NULL,
  `open_slovak_DG` double DEFAULT NULL,
  `women_slovak_DG` double DEFAULT NULL,
  `last_update` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ranking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=370 ;

--
-- Dumping data for table `statistics_ranking`
--

INSERT INTO `statistics_ranking` (`ranking_id`, `open_score`, `women_score`, `open_slovak_DG`, `women_slovak_DG`, `last_update`, `user_id`) VALUES
(330, NULL, NULL, 0, 0, '2014-02-04', 12),
(331, NULL, NULL, 0, 0, '2014-02-04', 18),
(341, NULL, NULL, 0, 0, '2014-02-04', 43),
(345, NULL, NULL, 0, 0, '2014-02-04', 17),
(362, NULL, NULL, 0, 0, '2014-02-04', 15);

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
  `user_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `note` text COLLATE utf8_slovak_ci,
  PRIMARY KEY (`register_player_id`),
  KEY `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournament_id`),
  KEY `fk_REGISTERED_PLAYERS_CATEGORIES1` (`category_id`),
  KEY `fk_REGISTERED_PLAYERS_user_profiles1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `statistics_registered_players`
--

INSERT INTO `statistics_registered_players` (`register_player_id`, `tournament_id`, `category_id`, `accom_id`, `food_id`, `user_id`, `position`, `note`) VALUES
(1, 9, 5, 10, 2, 12, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_register_options`
--

CREATE TABLE IF NOT EXISTS `statistics_register_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `what` varchar(500) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `statistics_register_options`
--

INSERT INTO `statistics_register_options` (`option_id`, `number`, `type`, `what`, `tournament_id`) VALUES
(1, 1, 'food', 'nope', 9),
(2, 2, 'food', 'Parky', 9),
(13, 4, 'food', 'pol kolaca', 9),
(9, 1, 'accom', 'nope', 9),
(12, 3, 'food', 'keksy', 9),
(10, 2, 'accom', 'chata', 9),
(11, 3, 'accom', 'hotel', 9),
(19, 1, 'accom', 'chata', 17),
(20, 2, 'accom', 'stan', 17);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=355 ;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_slovak_champ`
--

CREATE TABLE IF NOT EXISTS `statistics_slovak_champ` (
  `id_slovak_champ` int(11) NOT NULL AUTO_INCREMENT,
  `nmbr_accept_tourn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_slovak_champ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `statistics_slovak_champ`
--

INSERT INTO `statistics_slovak_champ` (`id_slovak_champ`, `nmbr_accept_tourn`) VALUES
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_tournaments`
--

CREATE TABLE IF NOT EXISTS `statistics_tournaments` (
  `tournament_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_to` date NOT NULL,
  `location` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `nmbr_of_round` int(11) DEFAULT NULL,
  `nmbr_of_fnl_laps` int(11) DEFAULT NULL,
  `about` text COLLATE utf8_slovak_ci,
  `photo` varchar(200) COLLATE utf8_slovak_ci DEFAULT NULL,
  `thumb` varchar(200) COLLATE utf8_slovak_ci DEFAULT NULL,
  `allow_registration` int(11) DEFAULT '0',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `max_open` int(11) DEFAULT NULL,
  `max_women` int(11) DEFAULT NULL,
  `slovak_champ` int(11) DEFAULT NULL,
  `dir_name` varchar(200) COLLATE utf8_slovak_ci DEFAULT NULL,
  `dir_email` varchar(300) COLLATE utf8_slovak_ci DEFAULT NULL,
  `dir_phone` varchar(50) COLLATE utf8_slovak_ci DEFAULT NULL,
  PRIMARY KEY (`tournament_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `statistics_tournaments`
--

INSERT INTO `statistics_tournaments` (`tournament_id`, `name`, `date`, `date_to`, `location`, `capacity`, `nmbr_of_round`, `nmbr_of_fnl_laps`, `about`, `photo`, `thumb`, `allow_registration`, `lat`, `lng`, `max_open`, `max_women`, `slovak_champ`, `dir_name`, `dir_email`, `dir_phone`) VALUES
(1, 'Matfyz', '2013-12-20', '0000-00-00', 'Mlynska Dolina', NULL, 2, 1, '<h1>Lorem ipsum</h1>\n<p>dolor sit amet, consectetur adipiscing elit. Suspendisse consectetur, turpis accumsan accumsan tempor, felis tortor porttitor justo, id varius odio mauris sed quam. Suspendisse potenti. Morbi dui lectus, imperdiet at mattis ut, tempus at dolor. Aenean vitae velit mi. Proin nunc tellus, interdum quis mattis ut, sodales sit amet tortor. Ut tempor ipsum id leo malesuada congue. Integer tincidunt euismod mauris, aliquet luctus urna dapibus ut. In at orci massa. Duis volutpat elit sed nisl sagittis dapibus. Nulla posuere mauris vel dictum dignissim. Nullam congue erat dui, vel scelerisque quam porttitor vel. Morbi quis dapibus ante. Nam sed velit ac sem feugiat tristique.</p>\n<p>Integer dignissim mollis felis ac sodales. Curabitur et feugiat magna, vel tincidunt augue. Etiam rhoncus elit a dui hendrerit condimentum. Proin quis mauris lacus. Integer molestie rhoncus ipsum sit amet malesuada. Integer volutpat ipsum vitae sem sagittis sagittis. Nulla facilisi. Nulla eget elit nibh. Fusce interdum accumsan lectus, eget bibendum felis congue ut. Nullam lacinia quam a sodales tincidunt. Donec vel dui ut est lacinia tristique. Sed vulputate tempus nisl eget hendrerit. Vestibulum et arcu arcu. Pellentesque non urna sit amet risus semper egestas sit amet porttitor tortor. Quisque posuere non neque et pellentesque.</p>\n<p>Maecenas et nulla in tortor condimentum convallis. Donec aliquet lectus ligula, lacinia congue odio pulvinar vel. Suspendisse eget sapien ac est dignissim tincidunt. Mauris ut accumsan leo. Donec rhoncus, mauris vel blandit pharetra, metus lectus interdum libero, sagittis mattis nulla metus vel lacus. Aenean a volutpat elit, id vulputate tortor. Phasellus venenatis mauris sapien, id lobortis dui cursus at. Mauris varius metus id enim aliquet euismod. Pellentesque vulputate rhoncus sem sit amet aliquam. Nam convallis in enim ac ullamcorper. Integer mi urna, aliquam at tellus sit amet, facilisis ornare nunc. Phasellus ultrices odio at velit venenatis consequat. Suspendisse ante nulla, dapibus nec vestibulum eget, imperdiet vel nunc. Praesent diam est, vestibulum a nisi non, fermentum commodo lectus.</p>\n<p>Fusce eget lacus eu ipsum consequat sagittis ornare et ligula. Nulla facilisi. Praesent gravida nisi vitae tellus congue, id laoreet erat dapibus. Sed ligula tortor, varius sed nisl feugiat, aliquam sodales nisi. Donec non enim ipsum. Sed dictum ante risus, ornare fermentum dolor mattis ac. Aliquam venenatis luctus tincidunt. In adipiscing ligula eu purus eleifend, id malesuada enim blandit. Vivamus pretium quam ut mollis vehicula. Nam mi sem, molestie a nibh ac, porttitor ultrices massa. Nulla at est sollicitudin, aliquam dui a, sodales risus. Vestibulum egestas tellus et lorem aliquam rhoncus. Nam sagittis purus eleifend, consectetur velit sed, commodo turpis. Aliquam a leo ut risus tempus imperdiet fringilla eu tortor.</p>\n<p>Proin commodo venenatis elit, nec luctus magna. Quisque non vulputate enim. Aliquam venenatis mi sed neque fermentum gravida sed quis tortor. Quisque ante erat, sodales eget eros eget, tempus lacinia nunc. Aenean interdum turpis mi, in congue magna auctor at. Vivamus eu neque nisi. Suspendisse dictum molestie odio, ornare consectetur lorem volutpat vel. Phasellus posuere dignissim purus a ornare. Vestibulum vel mi eu augue ultricies commodo. Sed tellus sapien, adipiscing non pharetra non, lobortis sed lorem. Donec nec placerat purus. Vestibulum euismod turpis nec ultrices scelerisque. Vivamus porta tortor et erat facilisis tincidunt. Vivamus ornare tortor id imperdiet scelerisque. Ut vel ipsum id massa facilisis mollis blandit in nunc. In sollicitudin urna facilisis, volutpat lectus sit amet, iaculis felis.</p>', '12022542114f9bae6c6ac8a5a6ca286e.jpg', '12022542114f9bae6c6ac8a5a6ca286e_thumb.jpg', 1, 47, 18, 130, 0, NULL, NULL, NULL, NULL),
(2, 'Discgolf Turnaj', '2013-03-08', '0000-00-00', 'Madarsko', NULL, 2, 1, '<ul>\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n<li>Vivamus vitae enim scelerisque, fringilla lorem sit amet, tempor est.</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<ul>\n<li>Nullam venenatis diam a quam cursus, sed convallis ipsum fringilla.</li>\n<li>Sed eu eros vitae ante tincidunt auctor a ac eros.</li>\n<li>Maecenas ut velit non dui consequat pellentesque.</li>\n<li>Proin eget lectus eu justo varius bibendum sed et neque.</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<ul>\n<li>Curabitur tincidunt dui eget lectus viverra porttitor.</li>\n<li>Nam euismod risus at velit aliquam, id semper mi mollis.</li>\n<li>Nullam molestie augue eget cursus rhoncus.</li>\n<li>Ut sit amet odio eget diam pretium egestas tristique vitae lorem.</li>\n<li>Donec ut tellus venenatis, lacinia lorem in, suscipit justo.</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<ul>\n<li>Donec suscipit lorem id luctus fermentum.</li>\n<li>Nullam nec purus et magna volutpat sodales.</li>\n<li>Integer eu orci a mauris ornare condimentum.</li>\n<li>Nunc in nisi eu tortor adipiscing consequat et id quam.</li>\n<li>Ut placerat mauris ac diam lobortis, vitae suscipit velit lacinia.</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<ul>\n<li>Nullam et massa quis dui fringilla laoreet.</li>\n<li>Aliquam id elit a urna suscipit pharetra id suscipit lorem.</li>\n</ul>', '4f5be9e950729b92071f944754db2010.jpg', '4f5be9e950729b92071f944754db2010_thumb.jpg', 1, 49.36528, 18.257521, 100, 0, NULL, NULL, NULL, NULL),
(3, 'Super Turnaj', '2013-12-31', '0000-00-00', 'Smolenice', NULL, 3, 2, '<p><iframe src="http://www.youtube.com/embed/l0z-QzUG_Eo" width="425" height="350"></iframe>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur mauris mauris, elementum condimentum pulvinar non, interdum at magna. Maecenas pulvinar neque lectus, ac fermentum lectus fringilla sit amet. Quisque turpis diam, sollicitudin euismod enim sed, adipiscing congue nulla. Aliquam non aliquam lacus, sed aliquet nunc. Cras tellus libero, varius sodales justo at, rutrum tincidunt odio. Cras at leo tellus. Sed id hendrerit nisi. Maecenas viverra blandit tortor in accumsan. Integer consectetur odio quis consectetur fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras scelerisque libero nisl, nec suscipit odio euismod eget.</p>\n<ol>\n<li>Donec viverra est ac eros mattis cursus. Maecenas scelerisque augue in est egestas vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nec diam ipsum. Ut consectetur orci vel metus elementum, auctor pulvinar tortor condimentum. Aenean dictum convallis massa, ut rutrum turpis adipiscing et. In consectetur cursus arcu, et cursus tortor porttitor id. Suspendisse sagittis urna non diam mollis venenatis. Phasellus interdum leo sed consectetur vehicula. Praesent semper turpis ac turpis lacinia, in convallis odio laoreet. Donec vehicula lorem in vulputate gravida. Curabitur feugiat nec eros laoreet facilisis. Curabitur velit metus, vulputate et euismod iaculis, euismod quis tortor. Praesent neque elit, ultrices et ante sit amet, facilisis luctus nulla. Nullam dictum gravida mauris, eget varius sapien convallis in. Aliquam in eleifend ligula, porta congue nisl.</li>\n<li>Maecenas et dolor dictum, placerat metus sit amet, mattis dolor. Phasellus dignissim enim eu elit eleifend, eget commodo sem luctus. In interdum dolor felis, quis vulputate nunc pretium nec. Fusce eu sollicitudin nisl. Aenean in facilisis neque. Pellentesque volutpat eleifend posuere. Pellentesque porta erat a iaculis tincidunt. Duis vel sem malesuada, facilisis ligula in, condimentum lorem. Duis rutrum, velit vitae consectetur vestibulum, erat erat aliquam massa, non consectetur sem urna a neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ut orci eu velit gravida volutpat in id mauris. Praesent risus felis, elementum sed vestibulum ac, lacinia eget justo. Proin elementum leo nec dolor rutrum, at viverra eros semper. Suspendisse quis porta nibh. Nam pulvinar laoreet justo fermentum vulputate.</li>\n<li>Mauris adipiscing mollis sapien, sed dapibus dui rutrum a. Donec ut euismod tellus. Nunc elit ante, rutrum sit amet arcu ut, semper scelerisque tellus. Nunc elementum lacus nec nisl rutrum aliquam. Nulla eu lacus suscipit, pretium diam nec, lacinia enim. Proin condimentum augue porttitor nisl blandit gravida. Aliquam sed ullamcorper augue, vitae tempus dolor. Nunc tristique vitae purus ut vulputate. Cras a aliquam sapien. Nullam cursus velit vitae leo sollicitudin, eget auctor justo viverra. Nulla rhoncus mauris in enim ornare lacinia.</li>\n<li>Nam tempor justo vel mauris lacinia, at dapibus tortor malesuada. Nullam pharetra pellentesque velit, tincidunt ornare metus ultricies non. Donec tristique dapibus magna, in rutrum purus commodo non. Fusce urna ligula, dapibus porttitor nunc eget, dictum fringilla turpis. Mauris mattis venenatis euismod. Cras sed tellus libero. In in ipsum lacus. Phasellus pulvinar felis ac libero scelerisque, et aliquet lacus malesuada. Morbi at risus eget ipsum volutpat aliquam. Maecenas eleifend scelerisque pretium. Vestibulum egestas lacinia ultrices. Morbi varius augue a purus mattis bibendum. Maecenas luctus quam ac diam venenatis laoreet. Duis et consectetur lorem. Cras convallis arcu ac tempor auctor. Curabitur sed enim nec purus lacinia aliquam nec sit amet lorem.</li>\n<li>Donec viverra orci vitae semper accumsan. Integer adipiscing aliquet lorem. Donec in porttitor lacus. Curabitur venenatis dolor id lorem condimentum facilisis. Integer vel aliquam est, vel accumsan nunc. Nunc sed risus sit amet lectus interdum facilisis. Praesent interdum felis enim, eget iaculis sem convallis nec. Praesent nec ligula diam. Nullam adipiscing magna id porttitor accumsan. Integer accumsan, est in facilisis elementum, purus nunc mattis massa, nec luctus quam mauris quis sapien. Donec euismod arcu lectus, vestibulum commodo ante cursus ac. Curabitur tempus feugiat adipiscing. Fusce suscipit et leo eget aliquet. Nam at porta enim.</li>\n<li>Curabitur consequat, enim ut tincidunt tincidunt, magna nunc luctus justo, a consequat tellus diam sit amet justo. Fusce ligula orci, accumsan non massa a, ultrices aliquam odio. Aliquam venenatis varius ante nec viverra. Donec a velit pharetra, consectetur lorem at, condimentum massa. Quisque commodo dui ultricies, tristique ante at, adipiscing dui. Etiam non ante orci. Nam in purus velit. Phasellus odio sapien, cursus at nisl eu, dignissim rhoncus ipsum. Sed a ligula ornare, luctus felis at, euismod elit. Donec posuere nunc erat, egestas viverra ante pulvinar ultrices. Sed ut elit nec tellus facilisis fermentum vitae ut leo. Suspendisse at luctus augue. Aenean ultrices ipsum id consequat volutpat. Donec lorem est, tincidunt eget est sit amet, condimentum interdum dui. Maecenas faucibus purus metus, ut dapibus lorem convallis eu.</li>\n<li>Nulla eget convallis purus, in laoreet elit. Nam aliquet erat enim, id facilisis lectus luctus ut. Donec ut dignissim eros. Vivamus urna velit, rhoncus a purus sit amet, eleifend cursus augue. Proin tempus purus sed nisl accumsan rutrum. Suspendisse in facilisis libero. Nulla venenatis dignissim lacus, non dapibus dolor rutrum non.</li>\n</ol>', '0b8371d6b5931d3393ce9fe7e8f7a240.jpg', '0b8371d6b5931d3393ce9fe7e8f7a240_thumb.jpg', 1, 48.567520374, 19.2664, NULL, 0, NULL, NULL, NULL, NULL),
(5, 'Test tournament', '2013-12-28', '0000-00-00', 'Trencin', NULL, 2, 1, '<p><img src="../../../tinymce/plugins/emoticons/img/smiley-laughing.gif" alt="" />Nadpis</p>\r\n<p>drgsregrtgrteg wtrhgtrhe&nbsp;trgw theh yteh yth rhy trhter ye h rh yh yeh yt</p>', '9863980295a5417d80c7d95ab32bd4a1.jpg', '9863980295a5417d80c7d95ab32bd4a1_thumb.jpg', 1, 10.23, 56.356, NULL, 0, NULL, NULL, NULL, NULL),
(6, 'test', '2013-12-26', '0000-00-00', 'mardof', NULL, 4, 5, '<div class="lang-php prettyprint prettyprinted">Lorem ipsum dolor sit amet, nam timeam epicuri ea, at est suscipit torquatos omittantur, eu has modus dicit detracto. Qui id aeterno impedit indoctum, et sea mucius commodo temporibus, an qui agam sadipscing persequeris. Id pri viderer impedit, in partem eripuit delicata eum. Doctus elaboraret mea cu. Cum ut inermis mentitum maiestatis.<br /><br />Dolor consulatu sea et, elitr partiendo duo in. Dicta doming quaestio ad cum. Deseruisse incorrupte ad pri. Vel case consulatu at, sea latine voluptatum cu, per enim aliquam fabulas ne. Assum platonem philosophia sit ea. No bonorum minimum qui, no dissentias cotidieque cum, sea ea brute dissentias necessitatibus.<br /><br />Est atqui populo dolores cu, periculis accusamus mnesarchum ne mei. In agam autem maluisset nec. Porro nostrum honestatis cu duo, ubique alterum fuisset et sit. Et solum timeam complectitur cum. Ius suas graece vocent te, magna mandamus contentiones eam ut, libris ponderum mandamus vim in. Id tollit labores mei, sea ne tale senserit periculis.<br /><br />Ut discere argumentum vel, graecis singulis contentiones ei mea. Viris intellegam in qui, recusabo maiestatis eum eu. Vidisse consectetuer vis eu. Et eruditi intellegebat duo. Duo maiestatis definiebas at, soleat nominati eam at.<br /><br />Cum in audire dolorem euripidis, vis eu iracundia interpretaris. Nam posse mediocritatem ea, ea vel tacimates referrentur. Laoreet deleniti definitiones sea at, ex dictas delicatissimi sea. Noluisse invidunt quaestio te pro, sit veniam debitis perfecto eu. Has animal aperiam cu.</div>', 'c05d9c8b1d9f53ef62ad919ddb95dc23.jpg', 'c05d9c8b1d9f53ef62ad919ddb95dc23_thumb.jpg', 1, 48.567520374, 19.149169922, NULL, 0, NULL, NULL, NULL, NULL),
(9, '2014 Budmerice OPEN', '2014-12-17', '2023-10-24', 'Budmerice', 1, 4, 1, '<p><span style="font-family: arial,sans-serif;"><span style="font-size: small;"><strong>P<span style="font-size: small;">ozor</span></strong>:</span> alej topolov, cesta, po ktorej sme boli zvyknut&iacute; pr&iacute;s?, je uzavret&aacute;, treba to ob&iacute;s? cez prv&uacute; praleln&uacute; ulicu v dedine (Revolučn&aacute; ulica).&nbsp; <br /><strong>Parkovanie:</strong> vzh?adom na to, že nem&aacute;m potvrden&yacute; pr&iacute;stup do parku je možn&eacute;, že budeme musie? parkova? pred br&aacute;nou, na mape vyzna?en&eacute; modrou farbou. V&scaron;etky cennosti si v aute odložte pre istotu do kufra. <br /><span style="color: #783f04;"><span style="text-decoration: underline;"><strong><span style="font-size: medium;"><br /><span style="color: #4c1130;"><span style="font-size: small;">W<span style="font-size: small;">arning</span></span></span></span></strong></span><span style="color: #4c1130;">: the tree alley we used to access the park is now closed for traffic. Therefore you need to use a detour through the first parallel street in the village (Revolucna ulica). Just follow the street to the end, then turn left, see the map on the right of this page.&nbsp; <br /> <strong>Parking:</strong> we still do not have a confirmation of parking inside the park area, so it is possible that you will need to park outside the park fence (indicated by the blue color on the map). Please, do not leave any visible valuables in your car and leave all your&nbsp; stuff in the car trunk! </span></span><br /><br /><br /><strong><span style="font-size: medium;">JEDLO/FOOD</span></strong></span><br /><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;">Voda a mal&eacute; ob?er<span style="font-size: small;">tvenie <span style="font-size: small;">s&uacute; zahrnut&eacute; v turnajovom poplatku. <span style="font-size: small;">V obci je viacero možnost&iacute; <span style="font-size: small;">na obed a ve?eru v sobotu a nede?u s cenami od 5 Euro. Odpor&uacute;?an&aacute; re&scaron;taur&aacute;cia je </span></span></span></span></span></span><br /></span><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;"><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;"><a href="https://plus.google.com/103123951796227980920/about?hl=sk" target="_blank"><span style="font-size: small;">Re&scaron;taur&aacute;cia </span>KVAK</a> , <a href="http://kvakrestaurant.webnode.sk/kontakt/" target="_blank" rel="nofollow">alternat&iacute;<span style="font-size: small;">vny</span> link</a> (o<span style="font-size: small;">tvoren&eacute;</span> sobota 12:00 - 24:00 a<span style="font-size: small;"> <span style="font-size: small;">nede?a</span></span> 12:00 - 22:00)<br /><span style="color: #4c1130;"><a href="https://sites.google.com/site/regnadgtur/goog_781703377"><br /></a></span></span></span></span></span></span></span><span style="color: #4c1130;">Water and small snack are included in the player fee. Multiple lunch and dinner options in the village are available on Saturday and Sunday starting at 5 Eur, <br />recommended option <a target="_blank">KVAK restaurant</a> , <a target="_blank">alternative link</a> (open Saturday 12:00 - 24:00 and Sunday 12:00 - 22:00)</span><br /><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><br /></span></span></strong></span><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;">ACCOMMODATION/UBYTOVANIE</span></strong></span></p>\r\n<div style="display: inline; margin: 5px 10px; float: right;"><a href="https://sites.google.com/site/regnadgtur/budmerice-2013/budmerice%202.png?attredirects=0"><img src="https://sites.google.com/site/regnadgtur/_/rsrc/1367567440933/budmerice-2013/budmerice%202.png?height=320&amp;width=400" alt="" width="400" height="320" border="0" /></a></div>\r\n<p><br />UNISTAV, Jablonecka 2, Budmerice, 48.353536,17.416451&nbsp;<span style="font-size: small;"><a href="https://maps.google.sk/maps?q=48.353606,17.416395&amp;hl=sk&amp;num=1&amp;t=h&amp;z=19" target="_blank">Mapa</a></span>, <span style="font-size: small;">v žltom kruhu na mape</span> hore<br /><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;">robot<span style="font-size: small;">n&iacute;<span style="font-size: small;">c</span>k<span style="font-size: small;">a</span> ubytov<span style="font-size: small;">?a</span> 6&euro; za osobu a noc <br /><span style="font-size: small;">hotelov<span style="font-size: small;">&aacute;</span> ?as<span style="font-size: small;">?</span> 12&euro; za o<span style="font-size: small;">sobu a <span style="font-size: small;">noc</span></span></span></span></span></span></span><br /><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;"><span style="font-size: small;"><span style="font-size: small;"><span style="font-size: small;">mo<span style="font-size: small;">ž<span style="font-size: small;">nos? <span style="font-size: small;">ra?ajok</span> <span style="font-size: small;">n<span style="font-size: small;">a</span></span> <span style="font-size: small;">ned<span style="font-size: small;">e<span style="font-size: small;">?u</span></span></span></span></span></span></span></span></span></span> <span style="font-size: small;"><span style="font-size: small;">cca</span>.</span> 3&euro; <br /></span><br /><span style="color: #4c1130;">UNISTAV, Jablonecka 2, Budmerice, 48.353536,17.416451&nbsp;<span style="font-size: small;"><a href="https://maps.google.sk/maps?q=48.353606,17.416395&amp;hl=sk&amp;num=1&amp;t=h&amp;z=19" target="_blank">Map</a></span>, see also yellow circle on the map above<br /> basic accommodation 6&euro; per night per person (double room)<br />hotel accommodation 12&euro; per night per person (double room)<br />optional breakfast on Sunday approx. 3&euro;</span><br /><br /><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="color: #cc0000;"><span style="color: #000000;"><span style="font-size: small;"><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;">POPLAT<span style="font-size: medium;">OK/</span>F<span style="font-size: medium;">EE</span></span></strong></span></span></span></span></span></strong></span></span></strong></span><br /><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="color: #cc0000;"><span style="color: #000000;"><span style="font-size: small;">5 Euro + 2 Euro pre ne<span style="font-size: small;">?lenov <span style="font-size: small;">Slovenskej asoci&aacute;cie Frisbee</span></span></span></span></span></span></span></span></span></span><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><br /><br /></span></span></strong></span></span></span></strong></span></span></span></strong><span style="color: #4c1130;"><span style="font-size: medium;"><span style="font-family: arial,sans-serif;"><span style="font-size: medium;"><span style="font-size: small;">5 Euro + 2 Euro for non-members of Slovak Association of Frisbee</span></span></span></span></span><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><span style="font-family: arial,sans-serif;"><strong><span style="font-size: medium;"><span style="text-decoration: underline;"><br /></span></span></strong></span><br /></span>P<span style="font-size: medium;">ROGRAM<span style="font-size: medium;">/TOURNAMENT <span style="font-size: medium;">SCHEDULE</span></span></span></span></strong><br /></span><span style="font-family: arial,sans-serif;"><span style="font-family: arial,sans-serif;">Pros&iacute;me, každ&uacute; skupinu, ktor&aacute; dohr&aacute; 4.kolo v sobotu, aby priniesla k&ocirc;&scaron; ku ka&scaron;tielu<br /><br /></span><span style="font-family: arial,sans-serif;"><span style="color: #4c1130;">We kindly ask all the players'' flights that finishes the 4th round on Saturday to bring the basket to the meeting area. </span></span><br /><br /><strong>Saturday April 20, 2013</strong><br />09:00 - Registration - </span><span style="font-family: arial,sans-serif;"><span lang="en">pay entry fee<br /></span>09:30 - Players meeting<br />09:45 - First and second round&nbsp; (2 x 12 holes together)<br />12:30 - Lunch break <br />14:45 - Players meeting<br /> 15:00 - Third and fourth round </span><span style="font-family: arial,sans-serif;"><span style="font-family: arial,sans-serif;">(2 x 12 holes together)</span><br /><br /></span></p>\r\n<div>\r\n<div class="sites-embed-align-right-wrapping-on">\r\n<div class="sites-embed-border-on sites-embed" style="width: 400px;">\r\n<h4 class="sites-embed-title">Budmerice Spring Fling 2013 - registr&aacute;cia</h4>\r\n<div class="sites-embed-content sites-embed-type-spreadsheet-form">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p><span style="font-family: arial,sans-serif;"><strong>Sunday April 21, 2013</strong><br />09:30 - Players meeting<br />09:45 - Fifth and sixth round&nbsp; </span><span style="font-family: arial,sans-serif;"><span style="font-family: arial,sans-serif;">(2 x 12 holes together)</span><br />12:30 - Short Break<br />13:00 - Final round (the best 5 players in divisions OPEN &amp; WOMEN, 6 extra holes)<br /><br /><strong><span style="font-size: medium;">ORGANIZ&Aacute;TORI TURNAJA/TOURNAMENT ORGANIZERS</span></strong><br /><strong>Riadite? turnaja / Tournament director:</strong> Kasho Grožaj (kasho30(at)gmail),&nbsp; +421 908 445 263<br /><strong>Turnajov&aacute; komisia / Tournament commission:</strong> Richard Koll&aacute;r (rk.frisbee(at)gmail)<br />&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; ?irsson Kri?ka (cirsson(at)gmail) <br />&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; Katka Bo?ov&aacute; (kb.frisbee(at)gmail)<br /><br /><br /><strong><span style="font-size: medium;">REGISTR&Aacute;CIA/REGISTRATION<br /></span></strong></span><br /><span style="font-family: arial,sans-serif;"><span style="font-size: small;"><span style="font-family: arial,sans-serif;">Pros<span style="font-size: small;">&iacute;m, zaregistrujte sa pomocou formul&aacute;ra<span style="font-size: small;"> vpravo.</span> </span>S&uacute;?aži<span style="font-size: small;"> sa v div&iacute;zia&aacute;ch </span>OPEN a WOMEN, 6 x 12 <span style="font-size: small;">jamiek</span> + 6 <span style="font-size: small;">jamiek</span> fin<span style="font-size: small;">&aacute;le</span>. Maxim&aacute;lna kapacita turnaja je <span style="font-size: small;">48</span> hr&aacute;?ov.&nbsp; Zo<span style="font-size: small;">znam prih&aacute;l<span style="font-size: small;">sen<span style="font-size: small;">&yacute;ch hr&aacute;?ov je niž&scaron;ie. </span></span></span><br /></span></span><strong><span style="font-size: medium;"><br /></span></strong><span style="color: #4c1130;">Please, register using the online form on the right. The competition divisions are OPEN and WOMEN, 6 x 12 + 6 holes finals. The maximum tournament capacity is 48 players.<span style="font-size: large;"><span style="font-size: small;">The list of registered players is below.</span><strong><br /></strong></span></span></span></p>', '2958a2b0532fb97828d5e9f2880202a5.JPG', '2958a2b0532fb97828d5e9f2880202a5_thumb.JPG', 1, NULL, NULL, 100, 50, 1, 'Fero', NULL, NULL),
(10, '2013 Budmerice OPEN', '2013-04-21', '0000-00-00', 'Budmerice', NULL, 6, 1, '<p>Budmerice OPEN 2013</p>\n<p>&nbsp;</p>', NULL, NULL, 1, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL),
(11, '2013 Sad JK Bratislava', '2013-04-10', '0000-00-00', 'Bratislava', NULL, 2, 1, '<p>fiktivny turnaj na kontrolu</p>', NULL, NULL, 1, NULL, NULL, 20, 0, NULL, NULL, NULL, NULL),
(13, '2001 Test Tournament', '2001-01-01', '0000-00-00', 'Bratislava', NULL, 3, 2, NULL, NULL, NULL, 0, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL),
(14, '2013 test budmerice', '2013-04-11', '0000-00-00', 'Budmerice', NULL, 6, 1, NULL, NULL, NULL, 0, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL),
(15, 'Test datumu', '2014-01-23', '2014-01-31', 'Mordor', NULL, 5, 1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eros fusce Cum id dignissim dis sagittis ultrices massa iaculis nostra...Sodales posuere nascetur.Eget class sodales nullam semper sagittis volutpat; nulla et curabitur.A lobortis Eleifend faucibus euismod erat sodales neque aptent, orci vehicula elit torquent.Urna dictumst lobortis quisque magnis sagittis porta fermentum, nulla facilisi cursus maecenas curabitur.</p>\n<p>A amet Vulputate ridiculus pulvinar fusce faucibus lacus sociis?Risus augue nascetur.Risus at penatibus quis mi.Justo at dignissim libero...Class congue iaculis.</p>\n<p>Scelerisque cras nam phasellus sit bibendum id habitant blandit pellentesque quis - dui netus vivamus nisi!Urna nibh montes leo id hac vivamus mus?Litora parturient cras pulvinar laoreet aptent metus cursus nostra!Nam mattis himenaeos magna penatibus ad lacinia vivamus?Imperdiet fusce Quisque sit magnis mauris torquent duis.</p>\n<p>Tellus ridiculus ultricies phasellus purus lectus nisl rutrum blandit ut, penatibus porta odio.Eu bibendum inceptos metus ullamcorper penatibus aliquam, mauris accumsan tempor curabitur.Morbi laoreet quisque faucibus adipiscing blandit pellentesque volutpat vehicula ante, lacinia accumsan.Sapien metus dignissim congue?Amet litora parturient felis fusce nunc faucibus facilisis: turpis elit non proin mus.</p>', NULL, NULL, 1, 45, 65, 120, 0, NULL, NULL, NULL, NULL),
(17, 'Director test', '2014-03-26', '2014-04-16', 'neviem', 25, 4, 1, NULL, NULL, NULL, 1, 45, 32, 100, 0, NULL, 'Riaditel', 'er@re.com', '123456'),
(18, 'test slovak champ', '2014-01-15', '2014-01-30', 'sk', 12, 1, 2, NULL, NULL, NULL, 1, 12, 45, 12, 123, 1, 'saddq', 'kasho30@gmail.com', NULL),
(19, 'teewa', '2014-01-22', '2014-01-28', 'ed', 45, 4, 1, NULL, NULL, NULL, 1, 1, 2, 45, 12, 0, 'ewfw', 'cirsson@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistics_users`
--

CREATE TABLE IF NOT EXISTS `statistics_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'user',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=143 ;

--
-- Dumping data for table `statistics_users`
--

INSERT INTO `statistics_users` (`id`, `role`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(12, 'admin', '', '$2a$08$sfqcqR6UIuidnYHuXrRBeekmUjukLzgzMxlUgz3WIgR0g7ip70IjW', 'admin@admin.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '2014-02-03 20:25:41', '2013-12-09 15:11:30', '2014-02-03 20:25:41'),
(15, 'user', '', '$2a$08$FqLAw1JJLWtJmAgRAdm9..On78BtxxbyXL6pPYmAKYK8RiD3x.bkW', 'new@mail.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', '2013-12-09 17:44:44', '2013-12-25 18:34:19'),
(17, 'user', '', '$2a$08$SSDoyGCxR.w2HnmNKDcSmOhU4LSw3JG1zPaS2j/UrK8RN36dNjQcu', 'rk.frisbee@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '95.105.161.133', '2014-01-05 12:28:41', '2014-01-05 12:26:52', '2014-01-05 11:28:41'),
(18, 'user', '', '$2a$08$ZNId/e8hygTcsuqcfT0SXuf4YAiTvwPQ24guzVg3PDkPCTKZxjxke', 'kb.frisbee@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '95.105.161.133', '2014-01-05 16:36:52', '2014-01-05 12:27:55', '2014-01-05 15:36:52'),
(43, 'user', '', '$2a$08$ta1SBZXKGPb9/CUTQy7ICu50l3obVVHLImCEZ3Ag1edofJ/iGXw1y', 'johan@johan.sk', 1, 0, NULL, NULL, NULL, NULL, NULL, '62.169.189.70', '2014-01-11 15:06:08', '2014-01-11 14:53:56', '2014-01-11 14:06:08');

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
  `country` varchar(20) COLLATE utf8_slovak_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_slovak_ci DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_slovak_ci DEFAULT 'default.png',
  `thumb` varchar(255) COLLATE utf8_slovak_ci DEFAULT 'default-thumb.png',
  `gender` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `club` varchar(45) COLLATE utf8_slovak_ci DEFAULT NULL,
  `about` text COLLATE utf8_slovak_ci,
  `user_id` int(11) NOT NULL,
  `slovak_champ_score` double DEFAULT NULL,
  `ranking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_user_profiles_users1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci AUTO_INCREMENT=142 ;

--
-- Dumping data for table `statistics_user_profiles`
--

INSERT INTO `statistics_user_profiles` (`id`, `country`, `website`, `first_name`, `last_name`, `birth_date`, `photo`, `thumb`, `gender`, `club`, `about`, `user_id`, `slovak_champ_score`, `ranking_id`) VALUES
(11, NULL, NULL, 'Admin', 'admin', '1981-05-05', 'e1e0f51c5899db49ca33b7c1562cebf3.png', 'e1e0f51c5899db49ca33b7c1562cebf3_thumb.png', 'Male', NULL, NULL, 12, NULL, NULL),
(14, 'fewf', NULL, 'Adam', 'Velky', '2013-12-05', 'default.png', 'default-thumb.png', 'Male', 'sdfaf', 'seafb rea arg ', 15, NULL, NULL),
(16, 'SK', NULL, 'Richard', 'Kollár', '1974-02-24', 'default.png', 'default-thumb.png', 'Male', 'Metal Impact', NULL, 17, NULL, NULL),
(17, 'SK', NULL, 'Katka', 'Boďová', '1981-04-12', 'default.png', 'default-thumb.png', 'Female', 'Metal Impact', NULL, 18, NULL, NULL),
(42, NULL, NULL, 'johan', 'johan', '2014-01-01', 'default.png', 'default-thumb.png', 'Male', '1234', NULL, 43, NULL, NULL);

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
