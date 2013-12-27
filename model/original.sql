-- phpMyAdmin SQL Dump
-- version 2.8.0.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 09, 2013 at 02:31 PM
-- Server version: 5.0.89
-- PHP Version: 5.3.10
-- 
-- Database: `vx600000db`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_assets`
-- 

CREATE TABLE `b0e2j_assets` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL default '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL default '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL default '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- 
-- Dumping data for table `b0e2j_assets`
-- 

INSERT INTO `b0e2j_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES (1, 0, 1, 560, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":[],"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 18, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 19, 160, 1, 'com_content', 'com_content', '{"core.admin":{"7":1,"8":1},"core.manage":{"6":1},"core.create":{"3":1,"8":1},"core.delete":{"8":1},"core.edit":{"4":1,"8":1},"core.edit.state":{"5":1,"8":1},"core.edit.own":{"8":1}}'),
(9, 1, 161, 162, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 163, 164, 1, 'com_installer', 'com_installer', '{"core.admin":{"7":1},"core.manage":{"7":1},"core.delete":[],"core.edit.state":[]}'),
(11, 1, 165, 166, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 167, 168, 1, 'com_login', 'com_login', '{}'),
(13, 1, 169, 170, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 171, 172, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 173, 174, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 175, 176, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 177, 178, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 179, 180, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 181, 184, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 185, 186, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 187, 188, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 189, 190, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 191, 192, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 193, 194, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.own":{"6":1},"core.edit.state":[]}'),
(25, 1, 195, 198, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 199, 200, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 49, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 182, 183, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 196, 197, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 8, 50, 59, 2, 'com_content.category.7', 'Features', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(33, 8, 60, 95, 2, 'com_content.category.8', 'News', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(34, 33, 61, 72, 3, 'com_content.category.9', 'World', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(35, 33, 73, 78, 3, 'com_content.category.10', 'Sports', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(36, 33, 79, 88, 3, 'com_content.category.11', 'Technology', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(37, 33, 89, 94, 3, 'com_content.category.12', 'Health', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(38, 34, 62, 63, 4, 'com_content.article.1', 'Storms Kill Dozens In 6 States', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(39, 34, 64, 65, 4, 'com_content.article.2', 'Gadhafi forces shell east Libyan city of Ajdabiya', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 36, 80, 81, 4, 'com_content.article.3', 'Twitter more robust than it may seem', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 36, 82, 83, 4, 'com_content.article.4', 'The ultimate pitch: 11 startups, 8 minutes, 500 investors', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 37, 90, 91, 4, 'com_content.article.5', 'Why isn''t there a safe weight-loss pill?', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 37, 92, 93, 4, 'com_content.article.6', '12 Foods With Super-Healing Powers', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 35, 74, 75, 4, 'com_content.article.7', 'What the?! Justin Verlander commits the balk of the year', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 36, 84, 85, 4, 'com_content.article.8', 'Cancer-Fighting Electric Hat Proves We Live In The Future', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 35, 76, 77, 4, 'com_content.article.9', 'Fill-in Chavez lifts Yankees over Rangers 6-5', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 32, 51, 52, 3, 'com_content.article.10', 'Module Positions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 32, 53, 54, 3, 'com_content.article.11', 'Module Variations', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 32, 55, 56, 3, 'com_content.article.12', 'Expose Framework', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 32, 57, 58, 3, 'com_content.article.13', 'Typography', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 7, 16, 17, 2, 'com_contact.category.13', 'Demo Contact Category', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(52, 34, 66, 67, 4, 'com_content.article.14', 'BP''s criminal negligence exposed', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 34, 68, 69, 4, 'com_content.article.15', 'Recognising Palestine?', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 36, 86, 87, 4, 'com_content.article.16', 'Amazon failure takes down sites across Internet', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(55, 34, 70, 71, 4, 'com_content.article.17', 'Ship loses contact in pirate zone ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(56, 8, 96, 119, 2, 'com_content.category.14', 'Slideshow', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(57, 56, 97, 98, 3, 'com_content.article.18', 'HTML5 Based Application', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(58, 56, 99, 100, 3, 'com_content.article.19', 'Mobile Application Development', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(59, 56, 101, 102, 3, 'com_content.article.20', 'Web Design & Development', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(60, 56, 103, 104, 3, 'com_content.article.21', 'Slide4', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(61, 8, 120, 129, 2, 'com_content.category.15', 'Demo Content', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(62, 61, 121, 122, 3, 'com_content.article.22', 'platea dignissim etiam', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(63, 61, 123, 124, 3, 'com_content.article.23', 'Phasellus sed elementum', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(64, 61, 125, 126, 3, 'com_content.article.24', ' Nec dignissim aenean rhoncus porta duis', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(65, 56, 105, 106, 3, 'com_content.article.25', 'Futuristic Dining Design', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(66, 56, 107, 108, 3, 'com_content.article.26', 'Discgolf v lete', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(67, 56, 109, 110, 3, 'com_content.article.27', 'Hraj discgolf...', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(68, 56, 111, 112, 3, 'com_content.article.28', 'Discgolf v zime', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(69, 56, 113, 114, 3, 'com_content.article.29', 'Interior Design of Kitchen', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(70, 61, 127, 128, 3, 'com_content.article.30', 'Freemium Template', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(71, 8, 130, 139, 2, 'com_content.category.16', 'Xpert Captions', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(72, 71, 137, 138, 3, 'com_content.article.31', 'Chcete ihrisko?', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(73, 71, 131, 132, 3, 'com_content.article.32', 'Ihrisko Makov', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(74, 71, 133, 134, 3, 'com_content.article.33', 'Disc Golf Camp', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(75, 71, 135, 136, 3, 'com_content.article.34', 'Ihrisko Malý Slavín', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(76, 27, 21, 22, 3, 'com_content.article.35', 'Domov', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(77, 27, 27, 28, 3, 'com_content.article.36', 'Naše služby', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(78, 27, 23, 24, 3, 'com_content.article.37', 'Niečo o mne', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(79, 27, 25, 26, 3, 'com_content.article.38', 'Čo je Disc Golf?', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(80, 27, 29, 30, 3, 'com_content.article.39', 'Kde hrať discgolf?', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(81, 27, 31, 32, 3, 'com_content.article.40', 'Kalendár domácich a zahraničných turnajov', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(82, 27, 33, 34, 3, 'com_content.article.41', 'Disc Golfové stránky', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(83, 27, 35, 36, 3, 'com_content.article.42', 'História', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(84, 27, 37, 38, 3, 'com_content.article.43', 'Ako vybrať disk na Disc Golf', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(85, 27, 39, 40, 3, 'com_content.article.44', 'Videá', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(86, 1, 554, 555, 1, 'com_tracks', 'com_tracks', '{}'),
(87, 27, 41, 42, 3, 'com_content.article.45', 'Makov MSR 2012 výsledky', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(88, 90, 141, 142, 3, 'com_content.article.46', 'Fotky ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(89, 27, 43, 44, 3, 'com_content.article.47', 'Fotky', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(90, 8, 140, 143, 2, 'com_content.category.17', 'Galéria', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(91, 56, 115, 116, 3, 'com_content.article.48', 'Discgolf_slideshow', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(92, 93, 145, 146, 3, 'com_content.article.49', 'Reportáž z Majstrovstiev SR v Makove 2012', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(93, 8, 144, 159, 2, 'com_content.category.18', 'Články', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(94, 56, 117, 118, 3, 'com_content.article.50', 'slider5', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(95, 1, 556, 557, 1, 'com_golfscores', 'com_golfscores', '{}'),
(96, 1, 558, 559, 1, 'com_comprofiler', 'comprofiler', '{}'),
(97, 93, 147, 148, 3, 'com_content.article.51', 'Návšteva u južných susedov', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(98, 93, 149, 150, 3, 'com_content.article.52', 'Finále ligy 2012 v Camping Parku Karpaty', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(99, 93, 151, 152, 3, 'com_content.article.53', 'Hugov adventný pohárik 2012', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(100, 93, 153, 154, 3, 'com_content.article.54', 'Slovácka túra - zimná 2013', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(101, 93, 155, 156, 3, 'com_content.article.55', 'Štompfa Cup 2013 prvý turnaj sezóny', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(102, 27, 45, 46, 3, 'com_content.article.56', 'SVK ranking', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(103, 27, 47, 48, 3, 'com_content.article.57', 'Výsledky turnajov 2005 - 2012', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(104, 93, 157, 158, 3, 'com_content.article.58', 'Budmerice Spring Fling 2013', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_associations`
-- 

CREATE TABLE `b0e2j_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY  (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_associations`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_banner_clients`
-- 

CREATE TABLE `b0e2j_banner_clients` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL default '0',
  `metakey_prefix` varchar(255) NOT NULL default '',
  `purchase_type` tinyint(4) NOT NULL default '-1',
  `track_clicks` tinyint(4) NOT NULL default '-1',
  `track_impressions` tinyint(4) NOT NULL default '-1',
  PRIMARY KEY  (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_banner_clients`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_banner_tracks`
-- 

CREATE TABLE `b0e2j_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_banner_tracks`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_banners`
-- 

CREATE TABLE `b0e2j_banners` (
  `id` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `clickurl` varchar(200) NOT NULL default '',
  `state` tinyint(3) NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL default '0',
  `metakey_prefix` varchar(255) NOT NULL default '',
  `purchase_type` tinyint(4) NOT NULL default '-1',
  `track_clicks` tinyint(4) NOT NULL default '-1',
  `track_impressions` tinyint(4) NOT NULL default '-1',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `reset` datetime NOT NULL default '0000-00-00 00:00:00',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `language` char(7) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_banners`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_categories`
-- 

CREATE TABLE `b0e2j_categories` (
  `id` int(11) NOT NULL auto_increment,
  `asset_id` int(10) unsigned NOT NULL default '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `level` int(10) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  `extension` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `description` mediumtext,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `access` int(10) unsigned default NULL,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL default '0',
  `created_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL default '0',
  `modified_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL default '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `b0e2j_categories`
-- 

INSERT INTO `b0e2j_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES (1, 0, 0, 0, 35, 0, '', 'system', 'ROOT', 0x726f6f74, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 0x756e63617465676f7269736564, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 0x756e63617465676f7269736564, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 0x756e63617465676f7269736564, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 0x756e63617465676f7269736564, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 0x756e63617465676f7269736564, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'features', 'com_content', 'Features', 0x6665617475726573, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:26:05', 42, '2011-04-19 18:04:29', 0, '*'),
(8, 33, 1, 13, 22, 1, 'news', 'com_content', 'News', 0x6e657773, '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:26:23', 0, '0000-00-00 00:00:00', 0, '*'),
(9, 34, 8, 14, 15, 2, 'news/world', 'com_content', 'World', 0x776f726c64, '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(10, 35, 8, 16, 17, 2, 'news/sports', 'com_content', 'Sports', 0x73706f727473, '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:26:49', 0, '0000-00-00 00:00:00', 0, '*'),
(11, 36, 8, 18, 19, 2, 'news/technology', 'com_content', 'Technology', 0x746563686e6f6c6f6779, '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:27:03', 0, '0000-00-00 00:00:00', 0, '*'),
(12, 37, 8, 20, 21, 2, 'news/health', 'com_content', 'Health', 0x6865616c7468, '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-17 17:27:41', 0, '0000-00-00 00:00:00', 0, '*'),
(13, 51, 1, 23, 24, 1, 'demo-contact-category', 'com_contact', 'Demo Contact Category', 0x64656d6f2d636f6e746163742d63617465676f7279, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-19 20:00:01', 0, '0000-00-00 00:00:00', 0, '*'),
(14, 56, 1, 25, 26, 1, 'slideshow', 'com_content', 'Slideshow', 0x736c69646573686f77, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-05-02 10:05:53', 42, '2012-08-30 18:33:28', 0, '*'),
(15, 61, 1, 27, 28, 1, 'demo-content', 'com_content', 'Demo Content', 0x64656d6f2d636f6e74656e74, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-05-24 10:45:45', 0, '0000-00-00 00:00:00', 0, '*'),
(16, 71, 1, 29, 30, 1, 'xpert-captions', 'com_content', 'Xpert Captions', 0x78706572742d63617074696f6e73, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-08-08 06:06:11', 0, '0000-00-00 00:00:00', 0, '*'),
(17, 90, 1, 31, 32, 1, 'galeria', 'com_content', 'Galéria', 0x67616c65726961, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-09-05 18:44:22', 0, '0000-00-00 00:00:00', 0, '*'),
(18, 93, 1, 33, 34, 1, 'reportaz', 'com_content', 'Články', 0x7265706f7274617a, '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 43, '2012-09-09 10:09:25', 43, '2012-10-04 16:59:22', 0, '*');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler`
-- 

CREATE TABLE `b0e2j_comprofiler` (
  `id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `firstname` varchar(100) default NULL,
  `middlename` varchar(100) default NULL,
  `lastname` varchar(100) default NULL,
  `hits` int(11) NOT NULL default '0',
  `message_last_sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `message_number_sent` int(11) NOT NULL default '0',
  `avatar` varchar(255) default NULL,
  `avatarapproved` tinyint(4) NOT NULL default '1',
  `approved` tinyint(4) NOT NULL default '1',
  `confirmed` tinyint(4) NOT NULL default '1',
  `lastupdatedate` datetime NOT NULL default '0000-00-00 00:00:00',
  `registeripaddr` varchar(50) NOT NULL default '',
  `cbactivation` varchar(50) NOT NULL default '',
  `banned` tinyint(4) NOT NULL default '0',
  `banneddate` datetime default NULL,
  `unbanneddate` datetime default NULL,
  `bannedby` int(11) default NULL,
  `unbannedby` int(11) default NULL,
  `bannedreason` mediumtext,
  `acceptedterms` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `apprconfbanid` (`approved`,`confirmed`,`banned`,`id`),
  KEY `avatappr_apr_conf_ban_avatar` (`avatarapproved`,`approved`,`confirmed`,`banned`,`avatar`),
  KEY `lastupdatedate` (`lastupdatedate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_comprofiler`
-- 

INSERT INTO `b0e2j_comprofiler` (`id`, `user_id`, `firstname`, `middlename`, `lastname`, `hits`, `message_last_sent`, `message_number_sent`, `avatar`, `avatarapproved`, `approved`, `confirmed`, `lastupdatedate`, `registeripaddr`, `cbactivation`, `banned`, `banneddate`, `unbanneddate`, `bannedby`, `unbannedby`, `bannedreason`, `acceptedterms`) VALUES (42, 42, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', 0, NULL, 1, 1, 1, '0000-00-00 00:00:00', '', '', 0, NULL, NULL, NULL, NULL, NULL, 0),
(43, 43, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', 0, NULL, 1, 1, 1, '0000-00-00 00:00:00', '', '', 0, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_field_values`
-- 

CREATE TABLE `b0e2j_comprofiler_field_values` (
  `fieldvalueid` int(11) NOT NULL auto_increment,
  `fieldid` int(11) NOT NULL default '0',
  `fieldtitle` varchar(255) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `sys` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fieldvalueid`),
  KEY `fieldid_ordering` (`fieldid`,`ordering`),
  KEY `fieldtitle_id` (`fieldtitle`,`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_field_values`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_fields`
-- 

CREATE TABLE `b0e2j_comprofiler_fields` (
  `fieldid` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `tablecolumns` text NOT NULL,
  `table` varchar(50) NOT NULL default '#__comprofiler',
  `title` varchar(255) NOT NULL default '',
  `description` mediumtext NOT NULL,
  `type` varchar(50) NOT NULL default '',
  `maxlength` int(11) default NULL,
  `size` int(11) default NULL,
  `required` tinyint(4) default '0',
  `tabid` int(11) default NULL,
  `ordering` int(11) default NULL,
  `cols` int(11) default NULL,
  `rows` int(11) default NULL,
  `value` varchar(50) default NULL,
  `default` mediumtext,
  `published` tinyint(1) NOT NULL default '1',
  `registration` tinyint(1) NOT NULL default '0',
  `profile` tinyint(1) NOT NULL default '1',
  `displaytitle` tinyint(1) NOT NULL default '1',
  `readonly` tinyint(1) NOT NULL default '0',
  `searchable` tinyint(1) NOT NULL default '0',
  `calculated` tinyint(1) NOT NULL default '0',
  `sys` tinyint(4) NOT NULL default '0',
  `pluginid` int(11) NOT NULL default '0',
  `params` mediumtext,
  PRIMARY KEY  (`fieldid`),
  KEY `tabid_pub_prof_order` (`tabid`,`published`,`profile`,`ordering`),
  KEY `readonly_published_tabid` (`readonly`,`published`,`tabid`),
  KEY `registration_published_order` (`registration`,`published`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_fields`
-- 

INSERT INTO `b0e2j_comprofiler_fields` (`fieldid`, `name`, `tablecolumns`, `table`, `title`, `description`, `type`, `maxlength`, `size`, `required`, `tabid`, `ordering`, `cols`, `rows`, `value`, `default`, `published`, `registration`, `profile`, `displaytitle`, `readonly`, `searchable`, `calculated`, `sys`, `pluginid`, `params`) VALUES (41, 'name', 'name', '#__users', '_UE_NAME', '_UE_REGWARN_NAME', 'predefined', NULL, NULL, 1, 11, -51, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 1, 1, 1, 1, NULL),
(26, 'onlinestatus', '', '#__comprofiler', '_UE_ONLINESTATUS', '', 'status', NULL, NULL, 0, 21, -21, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 1, 1, 1, NULL),
(27, 'lastvisitDate', 'lastvisitDate', '#__users', '_UE_LASTONLINE', '', 'datetime', NULL, NULL, 0, 21, -19, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 1, 'field_display_by=2'),
(28, 'registerDate', 'registerDate', '#__users', '_UE_MEMBERSINCE', '', 'datetime', NULL, NULL, 0, 21, -20, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 1, 'field_display_by=2'),
(29, 'avatar', 'avatar,avatarapproved', '#__comprofiler', '_UE_IMAGE', '', 'image', NULL, NULL, 0, 20, 1, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 1, 1, 1, NULL),
(42, 'username', 'username', '#__users', '_UE_UNAME', '_UE_VALID_UNAME', 'predefined', NULL, NULL, 1, 11, -46, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 1, 1, 1, 1, NULL),
(45, 'formatname', '', '#__comprofiler', '_UE_FORMATNAME', '', 'formatname', NULL, NULL, 0, 11, -52, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, 1, 1, 1, NULL),
(46, 'firstname', 'firstname', '#__comprofiler', '_UE_YOUR_FNAME', '_UE_REGWARN_FNAME', 'predefined', NULL, NULL, 1, 11, -50, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, 1, NULL),
(47, 'middlename', 'middlename', '#__comprofiler', '_UE_YOUR_MNAME', '_UE_REGWARN_MNAME', 'predefined', NULL, NULL, 0, 11, -49, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, 1, NULL),
(48, 'lastname', 'lastname', '#__comprofiler', '_UE_YOUR_LNAME', '_UE_REGWARN_LNAME', 'predefined', NULL, NULL, 1, 11, -48, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, 1, NULL),
(49, 'lastupdatedate', 'lastupdatedate', '#__comprofiler', '_UE_LASTUPDATEDON', '', 'datetime', NULL, NULL, 0, 21, -18, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 1, 'field_display_by=2'),
(50, 'email', 'email', '#__users', '_UE_EMAIL', '_UE_REGWARN_MAIL', 'primaryemailaddress', NULL, NULL, 1, 11, -47, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, 1, NULL),
(25, 'hits', 'hits', '#__comprofiler', '_UE_HITS', '_UE_HITS_DESC', 'counter', NULL, NULL, 0, 21, -22, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 1, NULL),
(51, 'password', 'password', '#__users', '_UE_PASS', '_UE_VALID_PASS', 'password', 50, NULL, 1, 11, -45, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, 1, NULL),
(52, 'params', 'params', '#__users', '_UE_USERPARAMS', '', 'userparams', NULL, NULL, 0, 11, -30, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, 1, NULL),
(24, 'connections', '', '#__comprofiler', '_UE_CONNECTION', '', 'connections', NULL, NULL, 0, 21, -17, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 1, NULL),
(23, 'forumrank', '', '#__comprofiler', '_UE_FORUM_FORUMRANKING', '', 'forumstats', NULL, NULL, 0, 21, -16, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 4, NULL),
(22, 'forumposts', '', '#__comprofiler', '_UE_FORUM_TOTALPOSTS', '', 'forumstats', NULL, NULL, 0, 21, -15, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 4, NULL),
(21, 'forumkarma', '', '#__comprofiler', '_UE_FORUM_KARMA', '', 'forumstats', NULL, NULL, 0, 21, -14, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 0, 1, 1, 4, NULL),
(20, 'forumsignature', '', '#__comprofiler', '_UE_FB_SIGNATURE', '', 'forumsettings', NULL, NULL, 0, 13, 3, 60, 5, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 1, 4, NULL),
(19, 'forumview', '', '#__comprofiler', '_UE_FB_VIEWTYPE_TITLE', '', 'forumsettings', NULL, NULL, 1, 13, 2, NULL, NULL, NULL, 'flat', 1, 0, 0, 1, 0, 0, 0, 1, 4, NULL),
(18, 'forumorder', '', '#__comprofiler', '_UE_FB_ORDERING_TITLE', '', 'forumsettings', NULL, NULL, 1, 13, 1, NULL, NULL, NULL, '0', 1, 0, 0, 1, 0, 0, 0, 1, 4, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_lists`
-- 

CREATE TABLE `b0e2j_comprofiler_lists` (
  `listid` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` mediumtext,
  `published` tinyint(1) NOT NULL default '0',
  `default` tinyint(1) NOT NULL default '0',
  `viewaccesslevel` int(10) unsigned NOT NULL default '0',
  `usergroupids` varchar(255) default NULL,
  `useraccessgroupid` int(9) NOT NULL default '18',
  `sortfields` varchar(255) default NULL,
  `filterfields` mediumtext,
  `ordering` int(11) NOT NULL default '0',
  `col1title` varchar(255) default NULL,
  `col1enabled` tinyint(1) NOT NULL default '0',
  `col1fields` mediumtext,
  `col2title` varchar(255) default NULL,
  `col2enabled` tinyint(1) NOT NULL default '0',
  `col1captions` tinyint(1) NOT NULL default '0',
  `col2fields` mediumtext,
  `col2captions` tinyint(1) NOT NULL default '0',
  `col3title` varchar(255) default NULL,
  `col3enabled` tinyint(1) NOT NULL default '0',
  `col3fields` mediumtext,
  `col3captions` tinyint(1) NOT NULL default '0',
  `col4title` varchar(255) default NULL,
  `col4enabled` tinyint(1) NOT NULL default '0',
  `col4fields` mediumtext,
  `col4captions` tinyint(1) NOT NULL default '0',
  `params` mediumtext,
  PRIMARY KEY  (`listid`),
  KEY `pub_ordering` (`published`,`ordering`),
  KEY `default_published` (`default`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_lists`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_members`
-- 

CREATE TABLE `b0e2j_comprofiler_members` (
  `referenceid` int(11) NOT NULL default '0',
  `memberid` int(11) NOT NULL default '0',
  `accepted` tinyint(1) NOT NULL default '1',
  `pending` tinyint(1) NOT NULL default '0',
  `membersince` date NOT NULL default '0000-00-00',
  `reason` mediumtext,
  `description` varchar(255) default NULL,
  `type` mediumtext,
  PRIMARY KEY  (`referenceid`,`memberid`),
  KEY `pamr` (`pending`,`accepted`,`memberid`,`referenceid`),
  KEY `aprm` (`accepted`,`pending`,`referenceid`,`memberid`),
  KEY `membrefid` (`memberid`,`referenceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_comprofiler_members`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_plugin`
-- 

CREATE TABLE `b0e2j_comprofiler_plugin` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `type` varchar(100) default '',
  `folder` varchar(100) default '',
  `backend_menu` varchar(255) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`),
  KEY `type_pub_order` (`type`,`published`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 AUTO_INCREMENT=501 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_plugin`
-- 

INSERT INTO `b0e2j_comprofiler_plugin` (`id`, `name`, `element`, `type`, `folder`, `backend_menu`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES (1, 'CB Core', 'cb.core', 'user', 'plug_cbcore', '', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'CB Connections', 'cb.connections', 'user', 'plug_cbconnections', '', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(3, 'Content Author', 'cb.authortab', 'user', 'plug_cbmamboauthortab', '', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Forum integration', 'cb.simpleboardtab', 'user', 'plug_cbsimpleboardtab', '', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'Mamblog Blog', 'cb.mamblogtab', 'user', 'plug_cbmamblogtab', '', 0, 6, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(6, 'YaNC Newsletters', 'yanc', 'user', 'plug_yancintegration', '', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(7, 'Default', 'default', 'templates', 'default', '', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(8, 'WinClassic', 'winclassic', 'templates', 'winclassic', '', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(9, 'WebFX', 'webfx', 'templates', 'webfx', '', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(10, 'OSX', 'osx', 'templates', 'osx', '', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(11, 'Luna', 'luna', 'templates', 'luna', '', 0, 5, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(12, 'Dark', 'dark', 'templates', 'dark', '', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(13, 'Default language (English)', 'default_language', 'language', 'default_language', '', 0, -1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'CB Menu', 'cb.menu', 'user', 'plug_cbmenu', '', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(15, 'Private Message System', 'pms.mypmspro', 'user', 'plug_pms_mypmspro', '', 0, 8, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(500, 'slovak', 'slovak', 'language', 'slovak', '', 0, 1, 1, 0, 0, 43, '2012-09-11 19:27:34', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_sessions`
-- 

CREATE TABLE `b0e2j_comprofiler_sessions` (
  `username` varchar(50) NOT NULL default '',
  `userid` int(11) unsigned NOT NULL default '0',
  `ui` tinyint(4) NOT NULL default '0',
  `incoming_ip` varchar(39) NOT NULL default '',
  `client_ip` varchar(39) NOT NULL default '',
  `session_id` varchar(33) NOT NULL default '',
  `session_data` mediumtext NOT NULL,
  `expiry_time` int(14) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `expiry_time` (`expiry_time`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_comprofiler_sessions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_tabs`
-- 

CREATE TABLE `b0e2j_comprofiler_tabs` (
  `tabid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `description` text,
  `ordering` int(11) NOT NULL default '0',
  `ordering_register` int(11) NOT NULL default '10',
  `width` varchar(10) NOT NULL default '.5',
  `enabled` tinyint(1) NOT NULL default '1',
  `pluginclass` varchar(255) default NULL,
  `pluginid` int(11) default NULL,
  `fields` tinyint(1) NOT NULL default '1',
  `params` mediumtext,
  `sys` tinyint(4) NOT NULL default '0',
  `displaytype` varchar(255) NOT NULL default '',
  `position` varchar(255) NOT NULL default '',
  `viewaccesslevel` int(10) unsigned NOT NULL default '0',
  `useraccessgroupid` int(9) NOT NULL default '-2',
  PRIMARY KEY  (`tabid`),
  KEY `enabled_position_ordering` (`enabled`,`position`,`ordering`),
  KEY `orderreg_enabled_pos_order` (`enabled`,`ordering_register`,`position`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_tabs`
-- 

INSERT INTO `b0e2j_comprofiler_tabs` (`tabid`, `title`, `description`, `ordering`, `ordering_register`, `width`, `enabled`, `pluginclass`, `pluginid`, `fields`, `params`, `sys`, `displaytype`, `position`, `viewaccesslevel`, `useraccessgroupid`) VALUES (11, '_UE_CONTACT_INFO_HEADER', '', -4, 10, '1', 1, 'getContactTab', 1, 1, NULL, 2, 'tab', 'cb_tabmain', 1, -2),
(12, '_UE_AUTHORTAB', '', -3, 10, '1', 0, 'getAuthorTab', 3, 0, NULL, 1, 'tab', 'cb_tabmain', 1, -2),
(13, '_UE_FORUMTAB', '', -2, 10, '1', 0, 'getForumTab', 4, 1, NULL, 1, 'tab', 'cb_tabmain', 1, -2),
(14, '_UE_BLOGTAB', '', -1, 10, '1', 0, 'getBlogTab', 5, 0, NULL, 1, 'tab', 'cb_tabmain', 1, -2),
(15, '_UE_CONNECTION', '', 99, 10, '1', 0, 'getConnectionTab', 2, 0, NULL, 1, 'tab', 'cb_tabmain', 1, -2),
(16, '_UE_NEWSLETTER_HEADER', '_UE_NEWSLETTER_INTRODCUTION', 99, 10, '1', 0, 'getNewslettersTab', 6, 0, NULL, 1, 'tab', 'cb_tabmain', 1, -2),
(17, '_UE_MENU', '', -10, 10, '1', 1, 'getMenuTab', 14, 0, NULL, 1, 'html', 'cb_head', 1, -2),
(18, '_UE_CONNECTIONPATHS', '', -9, 10, '1', 1, 'getConnectionPathsTab', 2, 0, NULL, 1, 'html', 'cb_head', 1, -2),
(19, '_UE_PROFILE_PAGE_TITLE', '', -8, 10, '1', 1, 'getPageTitleTab', 1, 0, NULL, 1, 'html', 'cb_head', 1, -2),
(20, '_UE_PORTRAIT', '', -7, 10, '1', 1, 'getPortraitTab', 1, 1, NULL, 1, 'html', 'cb_middle', 1, -2),
(21, '_UE_USER_STATUS', '', -6, 10, '.5', 1, 'getStatusTab', 14, 1, NULL, 1, 'html', 'cb_right', 1, -2),
(22, '_UE_PMSTAB', '', -5, 10, '.5', 0, 'getmypmsproTab', 15, 0, NULL, 1, 'html', 'cb_right', 1, -2);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_userreports`
-- 

CREATE TABLE `b0e2j_comprofiler_userreports` (
  `reportid` int(11) NOT NULL auto_increment,
  `reporteduser` int(11) NOT NULL default '0',
  `reportedbyuser` int(11) NOT NULL default '0',
  `reportedondate` date NOT NULL default '0000-00-00',
  `reportexplaination` text NOT NULL,
  `reportedstatus` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`reportid`),
  KEY `status_user_date` (`reportedstatus`,`reporteduser`,`reportedondate`),
  KEY `reportedbyuser_ondate` (`reportedbyuser`,`reportedondate`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `b0e2j_comprofiler_userreports`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_comprofiler_views`
-- 

CREATE TABLE `b0e2j_comprofiler_views` (
  `viewer_id` int(11) NOT NULL default '0',
  `profile_id` int(11) NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  `lastview` datetime NOT NULL default '0000-00-00 00:00:00',
  `viewscount` int(11) NOT NULL default '0',
  `vote` tinyint(3) default NULL,
  `lastvote` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`viewer_id`,`profile_id`,`lastip`),
  KEY `lastview` (`lastview`),
  KEY `profile_id_lastview` (`profile_id`,`lastview`,`viewer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_comprofiler_views`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_contact_details`
-- 

CREATE TABLE `b0e2j_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` int(10) unsigned default NULL,
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `b0e2j_contact_details`
-- 

INSERT INTO `b0e2j_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES (1, 'Test Contact', 0x746573742d636f6e74616374, 'Position', 'Address', 'City', 'Staate', 'Country', 'Zip', 'Phone', 'Fax', '<p>Test Contact Information</p>', '', NULL, 'Email@email.com', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 13, 1, 'Mobile', 'http://www.themexpert.com', '', '', '', '*', '2011-04-19 20:03:02', 42, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_content`
-- 

CREATE TABLE `b0e2j_content` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `asset_id` int(10) unsigned NOT NULL default '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `title_alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(10) unsigned NOT NULL default '0',
  `mask` int(10) unsigned NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL default '0',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL default '1',
  `parentid` int(10) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY  (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

-- 
-- Dumping data for table `b0e2j_content`
-- 

INSERT INTO `b0e2j_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES (1, 38, 'Storms Kill Dozens In 6 States', 0x73746f726d732d6b696c6c2d646f7a656e732d696e2d362d737461746573, '', '<p><img src="images/storms.jpg" border="0" /></p>\r\n<p>RALEIGH, N.C. — A furious storm system that kicked up tornadoes, flash floods and hail as big as softballs has left dozens dead on a rampage that stretched for days as it barreled from Oklahoma to North Carolina and Virginia.</p>\r\n', '\r\n<p>Emergency crews searched for victims in hard-hit swaths of North Carolina, where 62 tornadoes were reported from the worst spring storm in two decades to hit the state. Eleven people were confirmed dead in Bertie County, county manager Zee Lamb said, bringing the state''s death toll to at least 18 people on Sunday. NBC News was reporting at least 24 dead.</p>\r\n<p>In the capital city of Raleigh, three family members died in a mobile home park, said Wake County spokeswoman Sarah Willamson-Baker. At that trailer park, residents lined up outside Sunday and asked police guarding the area when they might get back in.</p>', -2, 0, 0, 9, '2011-04-17 17:49:37', 42, '', '2011-04-20 06:01:01', 42, 0, '0000-00-00 00:00:00', '2011-04-17 17:49:37', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 3, '', '', 1, 21, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(2, 39, 'Gadhafi forces shell east Libyan city of Ajdabiya', 0x676164686166692d666f726365732d7368656c6c2d656173742d6c696279616e2d636974792d6f662d616a646162697961, '', '<p><img src="images/libya.jpg" border="0" /></p>\r\n<p>AJDABIYA, Libya — Troops loyal to Libyan leader Moammar Gadhafi on Sunday shelled the rebel-held city of Ajdabiya, a strategic eastern town that has been the scene of fierce fighting in recent weeks.</p>\r\n', '\r\n<p>The government bombardment of Ajdabiya marked a setback for the rebels, who were forced to retreat a day after having advanced as far as the outskirts of the oil town of Brega, about 60 miles (100 kilometers) to the west.</p>\r\n<p>On Sunday, dozens of vehicles, some of them rebel trucks with heavy machine guns mounted in the back, could be seen fleeing Ajdabiya toward the rebel stronghold of Benghazi, about 100 miles (160 kilometers) to the north.</p>', -2, 0, 0, 9, '2011-04-17 18:00:55', 42, '', '2011-04-18 03:23:46', 42, 0, '0000-00-00 00:00:00', '2011-04-17 18:00:55', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 7, 0, 4, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 40, 'Twitter more robust than it may seem', 0x747769747465722d6d6f72652d726f627573742d7468616e2d69742d6d61792d7365656d, '', '<p><img src="images/t1flip.twitter.founders.gi.jpg" border="0" width="400" /></p>\r\n<p>(CNN) -- In the beginning was a word, sketched on a legal pad. And the word was Status. That was the working title used by programmer Jack Dorsey in 2000, when he designed the service that was to become Twitter six years later.</p>\r\n<p>An urban-design geek, Dorsey envisaged a city full of people buzzing short messages at each other the way taxi dispatchers and bike messengers do. Where are you? What''s up? What''s your status?</p>\r\n', '\r\n<p> </p>\r\n<p>Today, five years after its inception, Twitter''s status seems in flux. On the one hand, it is a vibrant virtual metropolis beyond Dorsey''s wildest imaginings. It has garnered 200 million citizens from every corner of the world, yet manages to be more orderly and simple than that noisy Facebook megalopolis down the road.</p>', -2, 0, 0, 11, '2011-04-17 18:32:48', 42, '', '2011-05-02 14:20:02', 42, 0, '0000-00-00 00:00:00', '2011-04-17 18:32:48', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 3, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(4, 41, 'The ultimate pitch: 11 startups, 8 minutes, 500 investors', 0x7468652d756c74696d6174652d70697463682d31312d73746172747570732d382d6d696e757465732d3530302d696e766573746f7273, '', '<p><img src="images/techstars.top.jpg" border="0" width="400" /></p>\r\n<p>NEW YORK (CNNMoney) -- In an old East Village music hall in downtown New York, more than 500 investors from around the country crowded into a dimly lit auditorium to hear 11 startups pitch.</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p>Those 11 startups were chosen from 600 applications for seed accelerator TechStars first New York City program. The accelerator offers up office space, intensive mentorship from some of tech industry''s top figures, and access to many of the field''s most prominent investors</p>', -2, 0, 0, 11, '2011-04-17 19:00:27', 42, '', '2011-05-02 13:18:28', 42, 0, '0000-00-00 00:00:00', '2011-04-17 19:00:27', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 2, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 42, 'Why isn''t there a safe weight-loss pill?', 0x7768792d69736e742d74686572652d612d736166652d7765696768742d6c6f73732d70696c6c, '', '<p><img src="images/t1larg.plate.ts.jpg" border="0" /></p>\r\n<p><strong>(CNN) </strong>-- Obesity can''t be cured by pills, shots or even surgery.</p>\r\n<p>If only it were that easy.</p>\r\n<p>Despite centuries of supposed weight-loss remedies from anti-obesity soaps, crash diets based on vinegar to even amphetamines, fads have failed.</p>\r\n', '\r\n<p>Over the years, Americans have become more obsessed with weight loss, but not much healthier as more than one-third of U.S. adults are obese.</p>\r\n<p>Drugs have not effectively answered the problem, despite billions of dollars spent in research. Obesity has more factors than just eating too much, according to research.</p>\r\n<p>The reasons why people gain excess weight vary -- and one drug isn''t likely to address all these factors including lifestyle, food access and environment.</p>', -2, 0, 0, 12, '2011-04-18 03:27:57', 42, '', '2011-04-18 04:12:05', 42, 0, '0000-00-00 00:00:00', '2011-04-18 03:27:57', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 43, '12 Foods With Super-Healing Powers', 0x31322d666f6f64732d776974682d73757065722d6865616c696e672d706f77657273, '', '<p><img src="images/hp_food_salad.jpg" border="0" /></p>\r\n<p>As part of a healthy diet, whole foods play a significant role in helping our bodies function at their best. There are hundreds of extremely nutritious whole foods, but the dozen on this list do more than contribute healthy nutrients -- they help you heal. In fact, every food on this list boasts multiple healing effects,</p>\r\n<p>from fighting cancer to reducing cholesterol, guarding against heart disease, and more. Eat these sup\r\n', '\r\ner-healing picks and start feeling pretty super yourself.</p>\r\n<h3>Brain Experts'' 6 Best Memory Tricks</h3>\r\n<p><strong>Kiwifruit</strong></p>\r\n<p>This tiny, nutrient-dense fruit packs an amazing amount of vitamin C (double the amount found in oranges), has more fiber than apples, and beats bananas as a high-potassium food. The unique blend of phytonutrients, vitamins, and minerals found in kiwifruit helps protect against heart disease, stroke, cancer, and respiratory disease. Kiwifruit''s natural blood-thinning properties work without the side effects of aspirin and support vascular health by reducing the formation of spontaneous blood clots, lowering LDL cholesterol, and reducing blood pressure. Multiple studies have shown that kiwifruit not only reduces oxidative stress and damage to DNA but also prompts damaged cells to repair themselves.</p>', -2, 0, 0, 12, '2011-04-18 03:32:34', 42, '', '2011-04-19 19:27:33', 42, 0, '0000-00-00 00:00:00', '2011-04-18 03:32:34', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 6, 0, 0, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 44, 'What the?! Justin Verlander commits the balk of the year', 0x776861742d7468652d6a757374696e2d7665726c616e6465722d636f6d6d6974732d7468652d62616c6b2d6f662d7468652d79656172, '', '<p><img src="images/verlander_shifty.jpg" border="0" /></p>\r\n<p>In the fifth inning, the A''s led 3-1 and put a runner on first with David DeJesus(notes) batting. On the fourth pitch of the at-bat, Verlander stepped backward from the pitching rubber, but he found his body in the wrong position for a throw to first base for a pickoff attempt. Instead, he comically short-armed the ball toward home.</p>\r\n<p>\r\n', '\r\n</p>\r\n<p>It rocketed toward the ground and appeared to hit an unprepared DeJesus on the bottom of his right foot before it rolled to the fence. Umpires called time, and DeJesus lobbied for a HBP. Off he went to first base on his own, but umps were too confused initially to make any ruling.</p>', -2, 0, 0, 10, '2011-04-18 03:41:20', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-18 03:41:20', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 1, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 45, 'Cancer-Fighting Electric Hat Proves We Live In The Future', 0x63616e6365722d6669676874696e672d656c6563747269632d6861742d70726f7665732d77652d6c6976652d696e2d7468652d667574757265, '', '<p><img src="images/Novocure_bus_01-2-654x1024.jpg" border="0" width="400" height="300" /></p>\r\n<p>The device, called the NovoTTF-100A and pictured above, uses electrodes placed on a patient’s scalp to generate electric fields that can damage tumor cells. The device is approved only for a rare kind of brain cancer called glioblastoma multiforme, and even then is approved only when the cancer has recurred and progressed after treatment with chemotherapies like Merck’s Temodar and Genentech’s Avastin and radiation.</p>\r\n<p>\r\n', '\r\n</p>\r\n<p>Ina  237-person clinical trial, patients who used the NovoTTF-100A were as likely to die as those who got chemotherapy, but they were less likely to have side effects such as nausea</p>', -2, 0, 0, 11, '2011-04-18 03:54:25', 42, '', '2011-05-02 13:18:10', 42, 0, '0000-00-00 00:00:00', '2011-04-18 03:54:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 46, 'Fill-in Chavez lifts Yankees over Rangers 6-5', 0x66696c6c2d696e2d63686176657a2d6c696674732d79616e6b6565732d6f7665722d72616e676572732d362d35, '', '<p><img src="images/nyc-baseman.jpg" border="0" /></p>\r\n<p>All three Yankees homers came off Ogando, who allowed just four hits over 13 shutout innings in his previous two starts this season. New York leads the majors with 27 home runs, a club record through 14 games.</p>\r\n<p>\r\n', '\r\n</p>\r\n<p>Ogando gave up five runs and six hits in 6 1-3 innings. Going into the game, he had allowed two regular-season homers in 54 2-3 career innings.</p>\r\n<p>Rodriguez sat out because of stiffness in his lower back and side, but the Yankees flashed plenty of power at the plate in a back-and-forth game that went on uninterrupted through a pair of rain showers.</p>', -2, 0, 0, 10, '2011-04-18 04:06:24', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-18 04:06:24', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(10, 47, 'Module Positions', 0x6d6f64756c652d706f736974696f6e73, '', '<p>There are <strong>52</strong> module positions. If no module is published to a position, it will not appear, collapsing the entire area.</p>\r\n<h3>Layout Control</h3>\r\n<p>Controlling module position in Expose really easy and give you a real test of module variation. Expose module layout are collapsible and extensible enough for creating new variations.</p>\r\n<p><img src="images/module-layouts.jpg" border="0" width="600" /></p>\r\n<h3>Preview</h3>\r\n<div class="tx-typo">\r\n<div class="note">View all module positions live by appending ?tp=1 or &amp;tp=1 to the end of your URL such as http://yoursite.com/index.php?tp=1.</div>\r\n</div>\r\n<p><img src="images/Module-Variations.jpg" border="0" alt="Module Positions" width="700" /></p>', '', 1, 0, 0, 7, '2011-04-19 18:05:22', 42, '', '2011-04-23 18:02:35', 42, 0, '0000-00-00 00:00:00', '2011-04-19 18:05:22', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 3, '', '', 1, 37, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 48, 'Module Variations', 0x6d6f64756c652d766172696174696f6e73, '', '<p>Module Variations allow you to individually style a module Enter any available suffixes at Extensions → Module Manager → Module → Module Class Suffix</p>\r\n\r\n<p>There are 11 suffixes: box1-7 and badge-hot, badge-new, badge-pick, badge-top.</p>\r\n\r\n<p>Note: You can compound multiple suffixes together such as box badge-pick.</p>', '', 1, 0, 0, 7, '2011-04-19 18:05:45', 42, '', '2011-05-24 09:40:22', 42, 0, '0000-00-00 00:00:00', '2011-04-19 18:05:45', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 2, '', '', 1, 479, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 49, 'Expose Framework', 0x6578706f73652d6672616d65776f726b, '', '<p><strong>Expose</strong> is a flexible and powerful rapid development theme framework for joomla1.5 and 1.6 with a very small footprint provides an extensible environment for developing, maintaining, and deploying high quality themes. Choosing Expose allows you to release your themes earlier, host and scale them without problem, and maintain them over time with no surprise.</p>\r\n<p><strong>Expose</strong> is based on experience. It does not reinvent the wheel: it uses most of the best practices of web development and integrates nicely with joomla framework with some great third-party libraries.</p>\r\n<h3>Key Features</h3>\r\n<ul class="check">\r\n<li>Flexible Layout system, gives you more control over your layouts.</li>\r\n<li>Stunning Administrator interface</li>\r\n<li>52 base module positions. Easily add more!</li>\r\n<li>Up to 3 layout combination</li>\r\n<li>Mobile platform support includes iPad, iPhone and Android.</li>\r\n<li>RTL support.</li>\r\n<li>CSS and JS code compression allow you to leveraging browser loading speed.</li>\r\n<li>Domination over Typography.</li>\r\n<li>Full control over Styling.</li>\r\n<li>Many built-in features such as to top smooth scroll, Image lazy loader, Modernizr, image fading, google analytics and much more</li>\r\n<li>Easy integration with any third party scripts, extensions and styles.</li>\r\n<li>Google Web Fonts, load custom fonts from Googles''s Font Directory</li>\r\n<li>Built in jQuery.</li>\r\n<li>Cross-browser compatibility.</li>\r\n</ul>', '', 1, 0, 0, 7, '2011-04-19 18:06:02', 42, '', '2011-09-21 16:53:18', 42, 0, '0000-00-00 00:00:00', '2011-04-19 18:06:01', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 1, '', '', 1, 29, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 50, 'Typography', 0x7479706f677261706879, '', '<h1>This is a Heading 1</h1>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>This is a Heading 2</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<h3>This is a Heading 3</h3>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<h4>This is a Heading 4</h4>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<h5>This is a Heading 5</h5>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<h6>This is a Heading 6</h6>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p>\r\n\r\n<div class="row">\r\n    <div class="span4 columns">\r\n      <h2>Misc. elements</h2>\r\n      <p>Using emphasis, addresses, &amp; abbreviations</p>\r\n      <p>\r\n        <code>&lt;strong&gt;</code>\r\n        <code>&lt;em&gt;</code>\r\n        <code>&lt;address&gt;</code>\r\n        <code>&lt;abbr&gt;</code>\r\n      </p>\r\n    </div>\r\n    <div class="span12 columns">\r\n      <h4>When to use</h4>\r\n      <p>Emphasis tags (<code>&lt;strong&gt;</code> and <code>&lt;em&gt;</code>) should be used to indicate additional importance or emphasis of a word or phrase relative to its surrounding copy. Use <code>&lt;strong&gt;</code> for importance and <code>&lt;em&gt;</code> for <em>stress</em> emphasis.</p>\r\n      <h3>Emphasis in a paragraph</h3>\r\n      <p><a href="#">Fusce dapibus</a>, <strong>tellus ac cursus commodo</strong>, <em>tortor mauris condimentum nibh</em>, ut fermentum massa justo sit amet risus. Maecenas faucibus mollis interdum. Nulla vitae elit libero, a pharetra augue.</p>\r\n      <p><strong>Note:</strong> It''s still okay to use <code>&lt;b&gt;</code> and <code>&lt;i&gt;</code> tags in HTML5, but they don''t come with inherent styles anymore. <code>&lt;b&gt;</code> is meant to highlight words or phrases without conveying additional importance, while <code>&lt;i&gt;</code> is mostly for voice, technical terms, etc.</p>\r\n      <h3>Addresses</h3>\r\n      <p>The <code>&lt;address&gt;</code> element is used for contact information for its nearest ancestor, or the entire body of work. Here’s how it looks:</p>\r\n      <address>\r\n        <strong>Twitter, Inc.</strong><br />\r\n        795 Folsom Ave, Suite 600<br />\r\n        San Francisco, CA 94107<br />\r\n        <abbr title="Phone">P:</abbr> (123) 456-7890\r\n      </address>\r\n      <p><strong>Note:</strong> Each line in an <code>&lt;address&gt;</code> must end with a line-break (<code>&lt;br /&gt;</code>) or be wrapped in a block-level tag (e.g., <code>&lt;p&gt;</code>) to properly structure the content.</p>\r\n      <h3>Abbreviations</h3>\r\n      <p>For abbreviations and acronyms, use the <code>&lt;abbr&gt;</code> tag (<code>&lt;acronym&gt;</code> is deprecated in <abbr title="HyperText Markup Langugage 5">HTML5</abbr>). Put the shorthand form within the tag and set a title for the complete name.</p>\r\n    </div>\r\n  </div>\r\n\r\n<div class="row">\r\n    <div class="span4 columns">\r\n      <h2>Blockquotes</h2>\r\n      <p>\r\n        <code>&lt;blockquote&gt;</code>\r\n        <code>&lt;p&gt;</code>\r\n        <code>&lt;small&gt;</code>\r\n      </p>\r\n    </div>\r\n    <div class="span12 columns">\r\n      <h4>How to quote</h4>\r\n      <p>To include a blockquote, wrap <code>&lt;blockquote&gt;</code> around <code>&lt;p&gt;</code> and <code>&lt;small&gt;</code> tags. Use the <code>&lt;small&gt;</code> element to cite your source and you''ll get an em dash <code>&amp;mdash;</code> before it.</p>\r\n      <blockquote>\r\n        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>\r\n        <small>Dr. Julius Hibbert</small>\r\n      </blockquote>\r\n    </div>\r\n  </div>\r\n\r\n<h3>Preformatted Text Style</h3>\r\n<pre class="linenums">\r\npre {\r\n  margin: 10px 0 10px 0px;\r\n  padding: 5px 0 5px 10px;\r\n  border: 1px dotted #aab4be;\r\n  border-left: 20px solid #b4b4b4;\r\n  background: #fafafa;\r\n  font-size: 90%;\r\n  color: #2E8B57;\r\n  font-family: "Courier New", Courier, monospace;\r\n}\r\n</pre>\r\n\r\n<h3>List Style</h3>\r\n<ul><li>Default ul style</li></ul>\r\n<ul class="check"><li>Default ul style</li></ul>\r\n\r\n<h3>Icon Style</h3>\r\n<div style="width:48%;margin-right:10px;float:left">\r\n  <p class="alert">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>alert</strong></p>\r\n  \r\n  <p class="asterisk">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>asterisk</strong></p>\r\n  \r\n  <p class="check">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>check</strong></p>\r\n  \r\n  <p class="disk">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>disk</strong></p>\r\n  \r\n  <p class="edit">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>edit</strong></p>\r\n  \r\n</div>\r\n<div style="width:48%;margin-left:10px;float:left">\r\n  <p class="email">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>email</strong></p>\r\n  <p class="pdf">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>pdf</strong></p>\r\n  <p class="printer">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>printer</strong></p>\r\n  <p class="star">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>star</strong></p>\r\n  <p class="tip">This is a sample of the alert style for <strong>p</strong> or <strong>span</strong> using class <strong>tip</strong></p>\r\n</div>\r\n<div class="clear"></div>\r\n<h3>Box Style</h3>\r\n<div class="tx-typo">\r\n  <div class="alert">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>alert</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="attention">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>attention</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="approved">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>approved</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="cart">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>cart</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="fav">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>fav</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="lock">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>lock</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="note">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>note</strong>  \r\n  </div>\r\n</div>\r\n\r\n<div class="tx-typo">\r\n  <div class="tips">\r\n    This is a sample of the alert style. Use this style to highlight information to your users. To use this use the div class <strong>tips</strong>  \r\n  </div>\r\n</div>\r\n\r\n<h3>Example: Default table styles</h3>\r\n<p>All tables will be automatically styled with only the essential borders to ensure readability and maintain structure. No need to add extra classes or attributes.</p>\r\n<table class="common-table ">\r\n        <thead>\r\n          <tr>\r\n            <th>#</th>\r\n            <th>First Name</th>\r\n            <th>Last Name</th>\r\n            <th>Language</th>\r\n          </tr>\r\n        </thead>\r\n        <tbody>\r\n          <tr>\r\n            <td>1</td>\r\n            <td>Some</td>\r\n            <td>One</td>\r\n            <td>English</td>\r\n          </tr>\r\n          <tr>\r\n            <td>2</td>\r\n            <td>Joe</td>\r\n            <td>Sixpack</td>\r\n            <td>English</td>\r\n          </tr>\r\n          <tr>\r\n            <td>3</td>\r\n            <td>Stu</td>\r\n            <td>Dent</td>\r\n            <td>Code</td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n\r\n<h3>Example: Zebra-striped</h3>\r\n<p>Get a little fancy with your tables by adding zebra-striping—just add the <code>.zebra-striped</code> class.</p>\r\n<table class="zebra-striped">\r\n        <thead>\r\n          <tr>\r\n            <th>#</th>\r\n            <th>First Name</th>\r\n            <th>Last Name</th>\r\n            <th>Language</th>\r\n          </tr>\r\n        </thead>\r\n        <tbody>\r\n          <tr>\r\n            <td>1</td>\r\n            <td>Some</td>\r\n            <td>One</td>\r\n            <td>English</td>\r\n          </tr>\r\n          <tr>\r\n            <td>2</td>\r\n            <td>Joe</td>\r\n            <td>Sixpack</td>\r\n            <td>English</td>\r\n          </tr>\r\n          <tr>\r\n            <td>3</td>\r\n            <td>Stu</td>\r\n            <td>Dent</td>\r\n            <td>Code</td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n<pre class="prettyprint linenums"><ol class="linenums"><li class="L0"><span class="tag">&lt;table</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">"zebra-striped"</span><span class="tag">&gt;</span></li><li class="L1"><span class="pln">...</span></li><li class="L2"><span class="tag">&lt;/table&gt;</span></li></ol></pre>\r\n\r\n<h3>Form Styles</h3>\r\n<form>\r\n        <fieldset>\r\n          <legend>Example form legend</legend>\r\n          <div class="clearfix">\r\n            <label for="">X-Large Input</label>\r\n            <div class="input">\r\n              <input class="xlarge" id="xlInput" name="xlInput" size="30" type="text" />\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="">Select</label>\r\n            <div class="input">\r\n              <select>\r\n                <option>1</option>\r\n                <option>2</option>\r\n                <option>3</option>\r\n                <option>4</option>\r\n                <option>5</option>\r\n              </select>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="">Select</label>\r\n            <div class="input">\r\n              <select class="medium">\r\n                <option>1</option>\r\n                <option>2</option>\r\n                <option>3</option>\r\n                <option>4</option>\r\n                <option>5</option>\r\n              </select>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label>Uneditable Input</label>\r\n            <div class="input">\r\n              <span class="uneditable-input">Some Value Here</span>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="disabledInput">Disabled Input</label>\r\n            <div class="input">\r\n              <input class="xlarge disabled" id="disabledInput" name="disabledInput" size="30" type="text" placeholder="Disabled input here… carry on." disabled="" />\r\n            </div>\r\n          </div> \r\n          <div class="clearfix error">\r\n            <label for="xlInput">X-Large Input</label>\r\n            <div class="input">\r\n              <input class="xlarge error" id="xlInput" name="xlInput" size="30" type="text" />\r\n              <span class="help-inline">Small snippet of help text</span>\r\n            </div>\r\n          </div> \r\n        </fieldset>\r\n        <fieldset>\r\n          <legend>Example form legend</legend>\r\n          <div class="clearfix">\r\n            <label for="prependedInput">Prepended Text</label>\r\n            <div class="input">\r\n              <div class="input-prepend">\r\n                <span class="add-on">@</span>\r\n                <input class="medium" id="prependedInput" name="prependedInput" size="16" type="text" />\r\n              </div>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="prependedInput2">Prepended Checkbox</label>\r\n            <div class="input">\r\n              <div class="input-prepend">\r\n                <label class="add-on"><input type="checkbox" name="" id="" value="" /></label>\r\n                <input class="mini" id="prependedInput2" name="prependedInput2" size="16" type="text" />\r\n              </div>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="appendedInput">Appended Checkbox</label>\r\n            <div class="input">\r\n              <div class="input-append">\r\n                <input class="mini" id="appendedInput" name="appendedInput" size="16" type="text" />\r\n                <label class="add-on active"><input type="checkbox" name="" id="" value="" checked="checked" /></label>\r\n              </div>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="xlInput">File Input</label>\r\n            <div class="input">\r\n              <input class="input-file" id="fileInput" name="fileInput" type="file" />\r\n            </div>\r\n          </div> \r\n        </fieldset>\r\n        <fieldset>\r\n          <legend>Example form legend</legend>\r\n          <div class="clearfix">\r\n            <label id="optionsCheckboxes">List of Options</label>\r\n            <div class="input">\r\n              <ul class="inputs-list">\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option1" />\r\n                    <span>Option one is this and that—be sure to include why it’s great</span>\r\n                  </label>\r\n                </li>\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option2" />\r\n                    <span>Option two can also be checked and included in form results</span>\r\n                  </label>\r\n                </li>\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option2" />\r\n                    <span>Option three can—yes, you guessed it—also be checked and included in form results</span>\r\n                  </label>\r\n                </li>\r\n                <li>\r\n                  <label class="disabled">\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option2" disabled="" />\r\n                    <span>Option four cannot be checked as it is disabled.</span>\r\n                  </label>\r\n                </li>\r\n              </ul>\r\n              <span class="help-block">\r\n                <strong>Note:</strong> Labels surround all the options for much larger click areas and a more usable form.\r\n              </span>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label>Date Range</label>\r\n            <div class="input">\r\n              <div class="inline-inputs">\r\n                <input class="small" type="text" value="May 1, 2011" />\r\n                <input class="mini" type="text" value="12:00am" />\r\n                to\r\n                <input class="small" type="text" value="May 8, 2011" />\r\n                <input class="mini" type="text" value="11:59pm" />\r\n                <span class="help-inline">All times are shown as Pacific Standard Time (GMT -08:00).</span>\r\n              </div>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="textarea">Textarea</label>\r\n            <div class="input">\r\n              <textarea class="xxlarge" id="textarea" name="textarea"></textarea>\r\n              <span class="help-block">\r\n                Block of help text to describe the field above if need be.\r\n              </span>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label id="optionsRadio">List of Options</label>\r\n            <div class="input">\r\n              <ul class="inputs-list">\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option1" />\r\n                    <span>Option one is this and that—be sure to include why it’s great</span>\r\n                  </label>\r\n                </li>\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option2" />\r\n                    <span>Option two can also be checked and included in form results</span>\r\n                  </label>\r\n                </li>\r\n              </ul>\r\n            </div>\r\n          </div> \r\n          <div class="actions">\r\n            <button type="submit" class="btn primary">Save Changes</button>&nbsp;<button type="reset" class="btn">Cancel</button>\r\n          </div>\r\n        </fieldset>\r\n      </form>\r\n\r\n<h3>Stacked forms</h3>\r\n<p>Add <code>.form-stacked</code> to your form’s HTML and you’ll have labels on top of their fields instead of to their left. This works great if your forms are short or you have two columns of inputs for heavier forms.</p>\r\n<form class="form-stacked">\r\n        <fieldset>\r\n          <legend>Example form legend</legend>\r\n          <div class="clearfix">\r\n            <label for="">X-Large Input</label>\r\n            <div class="input">\r\n              <input class="xlarge" id="xlInput" name="xlInput" size="30" type="text" />\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label for="">Select</label>\r\n            <div class="input">\r\n              <select>\r\n                <option>1</option>\r\n                <option>2</option>\r\n                <option>3</option>\r\n                <option>4</option>\r\n                <option>5</option>\r\n              </select>\r\n            </div>\r\n          </div> \r\n        </fieldset>\r\n        <fieldset>\r\n          <legend>Example form legend</legend>\r\n          <div class="clearfix error">\r\n            <label for="xlInput">X-Large Input</label>\r\n            <div class="input">\r\n              <input class="xlarge error" id="xlInput" name="xlInput" size="30" type="text" />\r\n              <span class="help-inline">Small snippet of help text</span>\r\n            </div>\r\n          </div> \r\n          <div class="clearfix">\r\n            <label id="optionsCheckboxes">List of Options</label>\r\n            <div class="input">\r\n              <ul class="inputs-list">\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option1" />\r\n                    <span>Option one is this and that—be sure to include why it’s great</span>\r\n                  </label>\r\n                </li>\r\n                <li>\r\n                  <label>\r\n                    <input type="checkbox" name="optionsCheckboxes" value="option2" />\r\n                    <span>Option two can also be checked and included in form results</span>\r\n                  </label>\r\n                </li>\r\n              </ul>\r\n              <span class="help-block">\r\n                <strong>Note:</strong> Labels surround all the options for much larger click areas and a more usable form.\r\n              </span>\r\n            </div>\r\n          </div> \r\n        </fieldset>\r\n        <div class="actions">\r\n          <button type="submit" class="btn primary">Save Changes</button>&nbsp;<button type="reset" class="btn">Cancel</button>\r\n        </div>\r\n      </form>\r\n<div class="row">\r\n    <div class="span4 columns">\r\n      <h2>Buttons</h2>\r\n      <p>As a convention, buttons are used for actions while links are used for objects. For instance, "Download" could be a button and "recent activity" could be a link.</p>\r\n      <p>All buttons default to a light gray style, but a blue <code>.primary</code> class and a red <code>.danger</code> class is available. Plus, rolling your own styles is easy peasy.</p>\r\n    </div>\r\n    <div class="span12 columns">\r\n      <h3>Example buttons</h3>\r\n      <p>Button styles can be applied to anything with the <code>.btn</code> applied. Typically you’ll want to apply these to only <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code>, and select <code>&lt;input&gt;</code> elements. Here’s how it looks:</p>\r\n      <div class="well" style="padding: 14px 19px;">\r\n        <button type="submit" class="btn primary">Submit</button>&nbsp;<button type="submit" class="btn">Cancel</button>&nbsp;<button class="btn danger">Delete</button>\r\n      </div>\r\n      <h3>Alternate sizes</h3>\r\n      <p>Fancy larger or smaller buttons? Have at it!</p>\r\n      <div class="well">\r\n        <a href="#" class="btn large primary">Primary action</a>\r\n        <a href="#" class="btn large">Action</a>\r\n      </div>\r\n      <div class="well" style="padding: 16px 19px;">\r\n        <a href="#" class="btn small primary">Primary action</a>\r\n        <a href="#" class="btn small">Action</a>\r\n      </div>\r\n      <h3>Disabled state</h3>\r\n      <p>For buttons that are not active or are disabled by the app for one reason or another, use the disabled state. That’s <code>.disabled</code> for links and <code>:disabled</code> for <code>&lt;button&gt;</code> elements.</p>\r\n      <h4>Links</h4>\r\n      <div class="well">\r\n        <a href="#" class="btn large primary disabled">Primary action</a>\r\n        <a href="#" class="btn large disabled">Action</a>\r\n      </div>\r\n      <h4>Buttons</h4>\r\n      <div class="well">\r\n        <button class="btn large primary disabled" disabled="">Primary action</button>&nbsp;<button class="btn large" disabled="">Action</button>\r\n      </div>\r\n    </div>\r\n  </div>\r\n<h1>Alerts &amp; Errors <small>Styles for success, warning, and error messages or alerts</small></h1>\r\n<div class="row">\r\n    <div class="span4 columns">\r\n      <h2>Basic alerts</h2>\r\n      <p>One-line messages for highlighting the failure, possible failure, or success of an action. Particularly useful for forms.</p>\r\n    </div>\r\n    <div class="span12 columns">\r\n      <div class="alert-message error">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Oh snap!</strong> Change this and that and try again.</p>\r\n      </div>\r\n      <div class="alert-message warning">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Holy gaucamole!</strong> Best check yo self, you’re not looking too good.</p>\r\n      </div>\r\n      <div class="alert-message success">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Well done!</strong> You successfully read this alert message.</p>\r\n      </div>\r\n      <div class="alert-message info">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Heads up!</strong> This is an alert that needs your attention, but it’s not a huge priority just yet.</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n<div class="row">\r\n    <div class="span4 columns">\r\n      <h2>Block messages</h2>\r\n      <p>For messages that require a bit of explanation, we have paragraph style alerts. These are perfect for bubbling up longer error messages, warning a user of a pending action, or just presenting information for more emphasis on the page.</p>\r\n    </div>\r\n    <div class="span12 columns">\r\n      <div class="alert-message block-message error">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Oh snap! You got an error!</strong> Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\r\n        <p><a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a></p>\r\n      </div>\r\n      <div class="alert-message block-message warning">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Holy gaucamole! This is a warning!</strong> Best check yo self, you’re not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>\r\n        <p><a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a></p>\r\n      </div>\r\n      <div class="alert-message block-message success">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Well done!</strong> You successfully read this alert message. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum.</p>\r\n        <p><a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a></p>\r\n      </div>\r\n      <div class="alert-message block-message info">\r\n        <a class="close" href="#">×</a>\r\n        <p><strong>Heads up!</strong> This is an alert that needs your attention, but it’s not a huge priority just yet.</p>\r\n        <p><a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a></p>\r\n      </div>\r\n    </div>\r\n  </div>', '', 1, 0, 0, 7, '2011-04-19 18:09:03', 42, '', '2011-09-13 17:34:00', 42, 0, '0000-00-00 00:00:00', '2011-04-19 18:09:03', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 28, 0, 0, '', '', 1, 117, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 52, 'BP''s criminal negligence exposed', 0x62702d732d6372696d696e616c2d6e65676c6967656e63652d6578706f736564, '', '<p><img src="images/bp.jpg" border="0" /></p>\r\n<p>Ryan Lambert is enraged.</p>\r\n<p>The owner of a charter fishing business, he had always supported the oil industry in his home state of Louisiana.  He previously trusted BP, and the rest of the oil industry, to do the right thing in case an accident happened. But not any more. "I''m seeing people starving to death and BP won''t pay them," said Lambert.\r\n', '\r\n</p>\r\n<p>His business drop of 94 per cent in the last year has cost him more than $1.1mn, he told Al Jazeera, "They won''t pay me, they owe me well over a million dollars just for last year, and all they do is send more papers to fill out."</p>', -2, 0, 0, 9, '2011-04-22 06:29:55', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-22 06:29:55', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 2, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', '');
INSERT INTO `b0e2j_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES (15, 53, 'Recognising Palestine?', 0x7265636f676e6973696e672d70616c657374696e65, '', '<p><img src="images/presidend_lebanon_syria.jpg" border="0" /></p>\r\n<p>What do you do if your decades-long campaign to bring about an independent Palestinian state on those fractions of historic Palestine known as the West Bank and Gaza Strip have resulted in total failure?</p>\r\n<p>The answer seems to be, if you are the Western-sponsored Palestinian Authority (PA) in Israeli-occupied Ramallah, to pretend you have a Palestinian state anyway, and to get as many other countries to join in this charade as possible.\r\n', '\r\n</p>\r\n<p>This appears to be the essence of the PA strategy to gain admittance for the "State of Palestine" to the UN General Assembly by September.</p>\r\n<p>Already, the PA is lobbying hard for countries to support the move, and in recent months a number of states, particularly in Latin America, have extended full diplomatic recognition to the Ramallah authority. The New York Times cited diplomats who say that if brought to a vote in the UN General Assembly, the measure would likely pass.</p>\r\n<p><strong>A fantasy ''state''</strong></p>\r\n<p>The PA''s push for recognition of a Palestinian state is the diplomatic counterpart to its much-touted "institution-building" and "economic development" efforts which are supposed to create the infrastructure for a future state.</p>', -2, 0, 0, 9, '2011-04-22 06:32:24', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-22 06:32:24', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 54, 'Amazon failure takes down sites across Internet', 0x616d617a6f6e2d6661696c7572652d74616b65732d646f776e2d73697465732d6163726f73732d696e7465726e6574, '', '<p><img src="images/800_ap_amazon_boxes_101213.jpg" border="0" /></p>\r\n<p>NEW YORK — Scores of websites and Internet services like Foursquare and Reddit are down or have limited availability because of problems at a data center run by Amazon.com.</p>\r\n<p>The problems reveal widespread reliance on Amazon Web Services, which rents out computers and data storage on a self-service basis over the Internet.\r\n', '\r\n</p>\r\n<p>AWS is generally considered reliable because it uses vast numbers of computers, spread out in different data centers, making Thursday''s failure unusual.  Amazon says the trouble started early in the morning at a data center in Northern Virginia.</p>', -2, 0, 0, 11, '2011-04-22 06:40:13', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-22 06:40:13', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 55, 'Ship loses contact in pirate zone ', 0x736869702d6c6f7365732d636f6e746163742d696e2d7069726174652d7a6f6e65, '', '<p><img src="images/21230917.jpg" border="0" /></p>\r\n<p>A Korean container vessel carrying 20 sailors, including 14 Koreans, lost contact with its company near a pirate-prone part of the Indian Ocean early yesterday, according to the owner and the government yesterday, raising fears of another Somali hijacking of a Korean ship.\r\n', '\r\n</p>\r\n<p>The 75,000-ton Hanjin Tianjin lost contact after sending an emergency signal at 5:15 a.m. Korea time when it was passing around 250 miles east off a Yemeni island on its way from Spain to Singapore, said officials of Hanjin Shipping, the ship’s owner and the country’s largest shipping company.</p>\r\n<p>The spot, 460 miles east of Somalia, is near the Gulf of Aden, where Korean vessels were hijacked by Somali pirates previously.</p>\r\n<p>A spokesman for the Ministry of Foreign Affairs and Trade, Cho Byung-jae, said at a media briefing yesterday that the ministry presumes the vessel has been hijacked.</p>', -2, 0, 0, 9, '2011-04-22 06:49:09', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-22 06:49:08', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(18, 57, 'HTML5 Based Application', 0x68746d6c352d62617365642d6170706c69636174696f6e, '', '<img src="images/html5.png" alt="html5" />\r\n<p>Arcu porta! Etiam pellentesque lectus vel nec tincidunt porta lundium! Et adipiscing amet? Temporelit odio purus placerat et. <a href="#">Read more..</a></p>', '', -2, 0, 0, 14, '2011-05-02 10:06:21', 42, '', '2011-05-24 06:41:00', 42, 0, '0000-00-00 00:00:00', '2011-05-02 10:06:21', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 9, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 58, 'Mobile Application Development', 0x6d6f62696c652d6170706c69636174696f6e2d646576656c6f706d656e74, '', '<img src="images/mobile-application.png" alt="mobile-application" />\r\n<p>Arcu porta! Etiam pellentesque lectus vel nec tincidunt porta lundium! Et adipiscing amet? Temporelit odio purus placerat et. <a href="#">Read more..</a></p>', '', -2, 0, 0, 14, '2011-05-02 10:06:53', 42, '', '2011-05-24 06:41:22', 42, 0, '0000-00-00 00:00:00', '2011-05-02 10:06:53', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 7, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 59, 'Web Design & Development', 0x7765622d64657369676e2d612d646576656c6f706d656e74, '', '<img src="images/web-design.png" alt="web-design" />\r\n<p>Arcu porta! Etiam pellentesque lectus vel nec tincidunt porta lundium! Et adipiscing amet? Temporelit odio purus placerat et <a href="#">Read more..</a></p>', '', -2, 0, 0, 14, '2011-05-02 10:07:20', 42, '', '2011-05-24 06:41:46', 42, 0, '0000-00-00 00:00:00', '2011-05-02 10:07:20', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 60, 'Slide4', 0x736c69646534, '', '<img src="images/slide/4.jpg" alt="slide4" />', '', -2, 0, 0, 14, '2011-05-02 10:07:43', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-05-02 10:07:43', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 62, 'platea dignissim etiam', 0x706c617465612d6469676e697373696d2d657469616d, '', '<p><img src="images/captions/roof.jpg" border="0" alt="" style="float: left; margin-right: 10px;" />A magnis mattis augue mus mid mid integer, integer dolor eu, cursus pellentesque. Mus ac, eros, integer augue porttitor cursus lundium purus porta. Tincidunt aliquam platea dignissim etiam a. Vut, est enim nec, montes, facilisis urna sociis? Sit aenean! Parturient, cum, nascetur a ultrices! Adipiscing massa elit? Placerat dapibus lundium, placerat vel et, tortor amet, velit, platea, platea eu, aenean nec! Sed, sit eu dapibus tincidunt et, est lorem, nec facilisis porta sed. Porttitor? Purus! Enim adipiscing pellentesque ac! Nunc nisi magna eros! Diam purus ultrices, dis proin turpis? Et massa dapibus et, placerat dictumst urna urna phasellus sed elementum ut, lectus ultrices</p>', '', 1, 0, 0, 15, '2011-05-24 10:46:49', 42, '', '2011-09-21 19:39:56', 42, 0, '0000-00-00 00:00:00', '2011-05-24 10:46:49', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 3, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 63, 'Phasellus sed elementum', 0x70686173656c6c75732d7365642d656c656d656e74756d, '', '<p><img src="images/captions/stairs.jpg" border="0" alt="" style="float: left; margin-right: 10px;" />A magnis mattis augue mus mid mid integer, integer dolor eu, cursus pellentesque. Mus ac, eros, integer augue porttitor cursus lundium purus porta. Tincidunt aliquam platea dignissim etiam a. Vut, est enim nec, montes, facilisis urna sociis? Sit aenean! Parturient, cum, nascetur a ultrices! Adipiscing massa elit? Placerat dapibus lundium, placerat vel et, tortor amet, velit, platea, platea eu, aenean nec! Sed, sit eu dapibus tincidunt et, est lorem, nec facilisis porta sed. Porttitor? Purus! Enim adipiscing pellentesque ac! Nunc nisi magna eros! Diam purus ultrices, dis proin turpis? Et massa dapibus et, placerat dictumst urna urna phasellus sed elementum ut, lectus ultrices</p>', '', 1, 0, 0, 15, '2011-05-24 10:47:13', 42, '', '2011-09-21 19:39:34', 42, 0, '0000-00-00 00:00:00', '2011-05-24 10:47:13', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 2, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(24, 64, ' Nec dignissim aenean rhoncus porta duis', 0x6e65632d6469676e697373696d2d61656e65616e2d72686f6e6375732d706f7274612d64756973, '', '<p><img src="images/captions/woodywoodpeacker.jpg" border="0" alt="" style="float: left; margin-right: 10px;" /> A magnis mattis augue mus mid mid integer, integer dolor eu, cursus pellentesque. Mus ac, eros, integer augue porttitor cursus lundium purus porta. Tincidunt aliquam platea dignissim etiam a. Vut, est enim nec, montes, facilisis urna sociis? Sit aenean! Parturient, cum, nascetur a ultrices! Adipiscing massa elit? Placerat dapibus lundium, placerat vel et, tortor amet, velit, platea, platea eu, aenean nec! Sed, sit eu dapibus tincidunt et, est lorem, nec facilisis porta sed. Porttitor? Purus! Enim adipiscing pellentesque ac! Nunc nisi magna eros! Diam purus ultrices, dis proin turpis? Et massa dapibus et, placerat dictumst urna urna phasellus sed elementum ut, lectus ultrices</p>', '', 1, 0, 0, 15, '2011-05-24 10:47:32', 42, '', '2011-09-21 19:38:59', 42, 0, '0000-00-00 00:00:00', '2011-05-24 10:47:32', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 1, '', '', 1, 21, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(25, 65, 'Futuristic Dining Design', 0x667574757269737469632d64696e696e672d64657369676e, '', '<img src="images/slideshow/dining-room.png" border="0" alt="" />\r\n<p>There are a wide range of working conditions and employment opportunities within interior design. Large and tiny corporations often hire interior designers as employees on regular working hours. Designers for smaller firms usually work on a contract or per-job basis. Self-employed designers, which make up 26% of interior designers, usually work the most hours. Interior designers often work under stress to meet deadlines</p>', '', -2, 0, 0, 14, '2011-08-01 12:32:12', 42, '', '2011-09-09 14:08:08', 42, 0, '0000-00-00 00:00:00', '2011-08-01 12:32:12', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 4, 0, 8, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(26, 66, 'Discgolf v lete', 0x64697363676f6c662d762d6c657465, '', '<p><img src="images/slideshow/slider3.jpg" border="0" alt="Discgolf v lete" width="960" height="270" style="border: 0;" /></p>', '', 1, 0, 0, 14, '2011-08-01 12:32:29', 42, '', '2012-08-31 11:11:22', 42, 0, '0000-00-00 00:00:00', '2011-08-01 12:32:29', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 7, 0, 3, '', '', 1, 17, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(27, 67, 'Hraj discgolf...', 0x6872616a2d64697363676f6c66, '', '<p><img src="images/slideshow/slider1.jpg" border="0" alt="" /></p>', '', 1, 0, 0, 14, '2011-08-01 12:32:47', 42, '', '2012-09-05 19:38:28', 43, 43, '2012-09-09 10:51:30', '2011-08-01 12:32:47', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 7, 0, 4, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(28, 68, 'Discgolf v zime', 0x64697363676f6c662d762d7a696d65, '', '<p><img src="images/slideshow/slider2.jpg" border="0" alt="Cross browser compatible template" width="960" height="270" style="border: 0;" /></p>', '', 1, 0, 0, 14, '2011-08-01 12:33:07', 42, '', '2012-08-31 11:06:01', 42, 0, '0000-00-00 00:00:00', '2011-08-01 12:33:07', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 7, 0, 2, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(29, 69, 'Interior Design of Kitchen', 0x696e746572696f722d64657369676e2d6f662d6b69746368656e, '', '<img src="images/slideshow/kitchen-interior.png" border="0" alt="" />\r\n<p>Interior design earnings vary based on employer, number of years with experience, and the reputation of the individual. For residential projects, self-employed interior designers usually earn a per-hour fee plus a percentage of the total cost of furniture, lighting, artwork, and other design elements. For commercial projects, they may charge per-hour fees, or a flat fee for the whole project.</p>', '', -2, 0, 0, 14, '2011-08-01 12:33:31', 42, '', '2011-09-09 14:07:33', 42, 0, '0000-00-00 00:00:00', '2011-08-01 12:33:31', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 6, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(30, 70, 'Freemium Template', 0x667265656d69756d2d74656d706c617465, '', '<p>Ut lectores et modo demonstraverunt gothica. Vulputate consequat magna typi dolor vulputate. Possim humanitatis delenit duis dolore volutpat. Adipiscing aliquam imperdiet decima claram facit. Est blandit mirum in soluta decima. Qui sollemnes mutationem lobortis qui nam. </p>', '', 1, 0, 0, 15, '2011-08-01 13:27:51', 42, '', '2011-09-21 20:06:11', 42, 0, '0000-00-00 00:00:00', '2011-08-01 13:27:51', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 7, 0, 0, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(31, 72, 'Chcete ihrisko?', 0x6368636574652d69687269736b6f, '', '<p><img src="images/captions/vlastne_ihrisko.jpg" border="0" width="240" height="160" /></p>\r\n<p style="text-align: justify;"><br class="Apple-interchange-newline" />Ponúkame Vám možnosť zahrať si tento fantastický šport a tým prispieť k Vašej párty, firemnému večierku, športovému dňu alebo teambuildingu. Dočasné 9 jamkové discgolfové ihrisko Vám naprojektujeme a pripravíme kdekoľvek to bude možné, a len za niekoľko minút. Krátka inštruktáž a môže sa začať. Pripravené máme aj špeciálne sprievodné discgolfové súťaže. Ponúkame kompletný catering service a technické zabezpečenie pre Váš výnimočný event.</p>\r\n<p style="text-align: justify;">Rovnako Vám dokážeme naprojektovať aj postaviť tzv. permanentné ihrisko.</p>', '', 1, 0, 0, 16, '2011-08-08 06:07:54', 42, '', '2012-09-23 11:04:13', 43, 0, '0000-00-00 00:00:00', '2011-08-08 06:07:54', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 1, '', '', 1, 4210, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(32, 73, 'Ihrisko Makov', 0x69687269736b6f2d6d616b6f76, '', '<p style="text-align: justify;"><span><span>Prvé downhill Disc Golfové ihrisko na Kysuciach v Makove. Od jari do neskorej jesene jepre záujemcov k dispozícii discgolfové ihrisko, ktoré patrí medzi prvé na Slovensku.</span></span><span> Na prudkom svahu 9 jamiek na 5 košov. Krásne ihrisko, ktoré musíte vyskúšať. Tu nájdete </span><a href="http://szf.sk/sites/default/files/Makov%20downhill%20discgolf%20course.JPG">plán ihriska</a>.</p>\r\n<p style="text-align: justify;">Ihrisko zabezpečil Ski Apartmány Makov. Ohláste sa recepcii apartmánového domu, kde si môžete zapožičat aj disky.</p>\r\n<p style="text-align: justify;">Kontakt na Ski apartmány:</p>\r\n<p style="text-align: justify;"><a href="http://www.makovapartmany.sk/?lang=sk" target="_blank">http://www.makovapartmany.sk/?lang=sk</a></p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_makov/IMG_7920.jpg" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/IMG_79212 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/Obrázok 0113 (300x200).JPG" border="0" alt="" /></p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_makov/IMG_79201 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/Obrázok 0317 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/P1040130 (300x200).jpg" border="0" alt="" /></p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_makov/Obrázok 0134 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/P10401359 (300x200).jpg" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/P104014310 (300x200).jpg" border="0" alt="" /></p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_makov/Obrázok 0398 (300x450).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_makov/Obrázok 0185 (300x450).JPG" border="0" alt="" /></p>', '', 1, 0, 0, 16, '2011-08-08 06:08:25', 42, '', '2012-09-23 10:47:22', 43, 0, '0000-00-00 00:00:00', '2011-08-08 06:08:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 4, '', '', 1, 4253, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(33, 74, 'Disc Golf Camp', 0x64697363676f6c662d63616d70, '', '<p style="text-align: justify;"><span>9 jamkové Disc Golfové ihrisko v obci Kuchyňa je vzdialené 40 km od Bratislavy. Ihrisko je súčasťou  novovybudovaného campingu - Camping park Karpaty. Nachádza sa v príjemnom prostredí Malých Karpát. Možnosť kempovania, posedenia v kaviarničke, využitia ohnísk na opekanie alebo túr do blízkej prírody napr: Vysoká 754 mnm - druhý najvyšší vrch Malých Karpát. Samozrejmosťou sú čisté toalety a sprchy.</span></p>\r\n<p style="text-align: justify;"><span>Ihrisko je k dispozícií na požiadanie a personál campingu pre Vás ihrisko rád pripraví. Pred Vašim príchodom ich prosím vopred kontaktujte. Ak nemáte vlastné disky máte možnosť si ich zapožičiať. Ihrisko je vhodné na zorganizovanie menšieho turnaja  s maximálnym počtom 36 hráčov. </span></p>\r\n<p style="text-align: justify;"><span>V ponuke je odborná inštruktáž.<br /></span></p>\r\n<p style="text-align: justify;"><span>Kontakt na camp :<br /> <a href="http://www.campingparkkarpaty.sk/sk/" target="_blank">http://www.campingparkkarpaty.sk/sk/</a></span></p>\r\n<p style="text-align: justify;"><span><a href="http://www.campingparkkarpaty.sk/sk/" target="_blank"><img src="images/captions/ihrisko_foto_kuchyna/Obrázok 04111 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_kuchyna/camping park karpaty1 (300x200).JPG" border="0" alt="" /></a></span> <img src="images/captions/ihrisko_foto_kuchyna/discgolf 22 (300x200).JPG" border="0" alt="" /> </p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_kuchyna/kuchyna 47 (300x225).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_kuchyna/kuchyna 89 (300x225).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_kuchyna/kuchyna710 (300x225).JPG" border="0" alt="" /></p>\r\n<p style="text-align: justify;"><img src="images/captions/ihrisko_foto_kuchyna/kuchna 95 (300x400).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_kuchyna/discgolf3 (300x400).jpg" border="0" alt="" /></p>', '', 1, 0, 0, 16, '2011-08-08 06:08:49', 42, '', '2012-09-23 09:17:57', 43, 43, '2012-09-23 09:17:57', '2011-08-08 06:08:49', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 20, 0, 3, '', '', 1, 4175, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(34, 75, 'Ihrisko Malý Slavín', 0x69687269736b6f2d6d616c792d736c6176696e, '', '<p style="text-align: justify;">Prvé permanentné ihrisko Bratislavský lesopark - Malý Slavín. K<span> dispozícii sú tri koše, každý z nich má 4 rôzne odhodiská z rôznych smerov. Na ihrisku sú voľne dostupné disky na požičanie, scorekarty a veľká informačná tabuľa. Na ihrisku prebieha <a href="https://sites.google.com/site/discgolfovaliga">Discgolfová liga</a>.</span></p>\r\n<p style="text-align: justify;">Zemepisná šírka : 48°14''6.11"S<br />Zemepisná dĺžka : 17° 6''8.74"V</p>\r\n<p style="text-align: justify;">Malý Slavín sa nachádza približne v strede medzi Mariankou a Račou. Najbližší možný prístup je z Marianky kde sa dá autom dostať až k starému kameňolomu. Odtiaľ je to cca 3,2 km ( 25. min. chôdze). Na samotnom Malom Slavíne sa nachádza aj lesné futbalové ihrisko, pingpongový stôl, niekoľko ohnísk  a pristrešky pre desiatky ľudí. Nájdete tu aj suché WC.<br /> Na požiadanie Vám radi zabezpečíme aj odbornú inštruktáž.</p>\r\n<p> </p>\r\n<p><img src="images/captions/ihrisko_foto_malyslavin/discgolfov green na Malom Slavne_res.jpg" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/pingpong7 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/stol(300x200).jpeg" border="0" alt="" /></p>\r\n<p><img src="images/captions/ihrisko_foto_malyslavin/Discatcher3 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/IMG_39174 (300x200).JPG" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/Tee sign9 (300x200).JPG" border="0" alt="" /></p>\r\n<p><img src="images/captions/ihrisko_foto_malyslavin/Puttingg8 (300x200).jpg" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/P10806016 (300x200).jpg" border="0" alt="" /> <img src="images/captions/ihrisko_foto_malyslavin/Thanks to all of you10 (300x200).JPG" border="0" alt="" /></p>\r\n<p><img src="images/captions/ihrisko_foto_malyslavin/Info tabuľa5 (300x450).JPG" border="0" alt="" /></p>', '', 1, 0, 0, 16, '2011-08-08 06:09:10', 42, '', '2013-03-05 21:54:28', 43, 0, '0000-00-00 00:00:00', '2011-08-08 06:09:10', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 0, 2, '', '', 1, 4511, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(35, 76, 'Domov', 0x646f6d6f76, '', '<h3 style="text-align: center;"><span style="font-family: ''arial'', ''helvetica'', sans-serif; font-size: large;"><strong> </strong></span></h3>\r\n<table style="width: 360px; float: right; height: 168px;" border="0">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: left;">\r\n<h3><span style="font-family: tahoma,arial,helvetica,sans-serif; font-size: small;"><span style="font-size: medium;"><strong>Posledné udalosti:</strong></span>                                           </span><span style="font-family: tahoma, arial, helvetica, sans-serif; font-size: small;"> </span></h3>\r\n<ul>\r\n<li><span style="font-size: small;"><a href="https://sites.google.com/site/regnadgtur/results"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;">Smolenice Open 07.-09. júna 2013</span></span></a></span></li>\r\n<li><span style="font-size: small;"><a href="https://sites.google.com/site/regnadgtur/results"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;">Hlohovecký pohár, 18. máj 2013</span></span></a></span></li>\r\n<li><span style="font-size: small;"><a href="https://sites.google.com/site/regnadgtur/results"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;">Pohár FMFI UK, 08. máj 2013</span></span><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><br /></span></span></a></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><a href="index.php?option=com_content&amp;view=article&amp;id=58&amp;catid=18">Budmerice Spring Fling 2013</a></span><br /></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><a href="index.php?option=com_content&amp;view=article&amp;id=55&amp;catid=18">Štompfa Cup 2013 prvý turnaj sezóny</a></span></span></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><a href="index.php?option=com_content&amp;view=article&amp;id=54&amp;catid=18">Slovácka túra - zimná 2013</a></span></span></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><a href="index.php?option=com_content&amp;view=article&amp;id=53&amp;catid=18">Hugov adventný pohárik 2012</a></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><a href="index.php?option=com_content&amp;view=article&amp;id=52&amp;catid=18">Finále ligy 2012 v Camping Parku Karpaty </a></span></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><a href="https://sites.google.com/site/regnadgtur/results/msrmakov2012" target="_blank">Majstrovstvá SR v Makove 2012 - výsledky</a></span></li>\r\n<li><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif; font-size: small;"><a href="index.php?option=com_content&amp;view=article&amp;id=49&amp;catid=18">Reportáž z Majstrovstiev SR v Makove 2012</a></span></li>\r\n<li><span style="font-size: small;"><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><a href="index.php?option=com_content&amp;view=article&amp;id=51&amp;catid=18">Návšteva u južných susedov</a></span><span style="font-family: ''tahoma'', ''arial'', ''helvetica'', sans-serif;"><br /></span></span></li>\r\n</ul>\r\n<p> </p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><iframe src="http://www.youtube.com/embed/1DFP44Eogio" frameborder="0" width="425" height="350"></iframe></p>\r\n<p> </p>', '', 1, 0, 0, 2, '2012-08-30 18:40:16', 42, '', '2013-09-25 05:06:08', 43, 43, '2013-09-25 05:06:08', '2012-08-30 18:40:16', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 67, 0, 13, '', '', 1, 1745, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(38, 79, 'Čo je Disc Golf?', 0x6f2d64697363676f6c6665, '', '<p style="text-align: left;">Disc Golf je najpopulárnejšia individuálna hra s lietajúcim tanierom (diskom). Snahou hráča je dosiahnuť cieľ na čo najmenší počet hodov.</p>\r\n<p style="text-align: justify;">Tým cieľom je v Disc Golfe špeciálny <strong>kôš</strong> (<strong>Disc Catcher</strong>). </p>\r\n<div style="text-align: justify;">\r\n<div id="382292467228550548-lhs" class="column" style="color: #273b4a; font-family: ''Trebuchet MS'', arial, sans-serif; font-size: 12px; font-weight: normal; line-height: normal; background-color: #efe8dc; width: 452.4166564941406px; float: left; overflow: visible; margin: 0px; padding: 0px;">\r\n<div class="columnlistp" style="padding-right: 5px;">\r\n<h2 style="margin: 0px; padding: 5px 0px; font-size: 18px !important; color: #273b4a; line-height: 1.5; font-family: Verdana !important;">Začíname</h2>\r\n<span style="position: relative; float: left; z-index: 10; clear: left; margin-top: 0px;"><span style="position: relative; float: left; z-index: 10; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/6288150.jpg" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="font-size: 11px; margin-top: -10px; margin-bottom: 10px; text-align: center;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">Hráč hádže z určeného miesta, pri odhode sa nesmie žiadnou časťou svojho tela dotýkať zeme za čiarou odhodiska. Prešľapnúť môže až po odhode. Nikdy nehádžem pokiaľ sa predo mnou alebo vedľa mňa nachádza osoba alebo zviera,</span></div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">ktorému by disk mohol ublížiť.</span></div>\r\n<hr style="width: 447.3999938964844px; clear: both; visibility: hidden;" />\r\n<h2 style="margin: 0px; padding: 5px 0px; font-size: 18px !important; color: #273b4a; line-height: 1.5; font-family: Verdana !important;">.:3:.</h2>\r\n<span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/6250643.jpg?199" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">Pokiaľ disk ostal na strome, hádže hráč z miesta pod diskom, nepripočítava si trestný hod. Vždy hádže hráč ktorý je ďalej od cieľa, bez ohľadu na to, koľký hod</span><br /><span style="font-size: small;">práve absolvuje. Všetci ostatní stoja najmenej tri metre za ním.</span></div>\r\n</div>\r\n</div>\r\n<div id="382292467228550548-rhs" class="column" style="color: #273b4a; font-family: ''Trebuchet MS'', arial, sans-serif; font-size: 12px; font-weight: normal; line-height: normal; background-color: #efe8dc; width: 452.4166564941406px; left: auto; float: left; overflow: visible; margin: 0px; padding: 0px;">\r\n<div class="columnlistp" style="padding-left: 5px;">\r\n<h2 style="margin: 0px; padding: 5px 0px; font-size: 18px !important; color: #273b4a; line-height: 1.5; font-family: Verdana !important;">.:2:.</h2>\r\n<span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/1355129.jpg?158" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">Ďalej hráč hádže z miesta, kde sa disk zastavil, pri odhode sa musí dotýkať aspoň jednou časťou tela miesta do 30cm za prednou hranou disku smerom k cieľu. Po odhode môže prešlapnúť len pokiaľ cieľ nie je bližšie než 10 metrov od koša. V tejto</span></div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">blízkosti už nesmie žiadnou časťou tela presiahnuť miesto odkiaľ hádže až do chvíle pokiaľ odhodený disk úplne nezastane.V opačnom prípade ho môže protihráč napomenúť alebo pripočítať trestný hod.</span></div>\r\n<hr style="visibility: hidden; width: 447.3999938964844px; clear: both;" />\r\n<h2 style="margin: 0px; padding: 5px 0px; font-size: 18px !important; color: #273b4a; line-height: 1.5; font-family: Verdana !important;">.:4:.</h2>\r\n<span style="z-index: 10; position: relative; float: left; clear: left; margin-top: 0px;"><span style="z-index: 10; position: relative; float: left; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/2942311.jpg?204" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">A je tam! Posledným krokom pre úspešné zvládnutie "jamky" je dostať disk do koša. Letiaci disk zachytávajú reťaze a ten padá do spodnej časti koša. Pre Vás to znamená úspešné ukončenie jednej "jamky" a môžete smelo pokračovať k ďalšej.</span></div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;">  </div>\r\n</div>\r\n</div>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"> </p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><strong style="padding: 0px; margin: 0px;"> </strong></p>\r\n<h2 style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><strong style="padding: 0px; margin: 0px;"> </strong></h2>\r\n<h2 style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><strong style="padding: 0px; margin: 0px;"> </strong></h2>\r\n<h2 style="text-align: left; line-height: 1.65em; margin: 0px 0px 10px; font-size: 1.1em; padding: 0px;"> </h2>\r\n<h2 style="text-align: left; line-height: 1.65em; margin: 0px 0px 10px; font-size: 1.1em; padding: 0px;"> </h2>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p><span style="color: #000000; font-size: large;"><strong style="padding: 0px; margin: 0px;">Pravidlá</strong></span></p>\r\nDisk sa hádže z určených <strong>„odhodísk“ (tee off),</strong> ktorých na lete ku<span style="color: #000000;"> košu</span> vzdialeného v priemere 50-150m sprevádzajú rôzne prekážky (stromy, kríky, jazierko, potok, výškové prevýšenia). Víťazom je tá osoba, ktorej sa podarí celé ihrisko spočívajúce prevažne z 9 a 18 „jamiek“ odohrať na čo najmenej hodov, pričom:<br />\r\n<ul>\r\n<li><strong>Par - </strong>„jamka” zahraná na tri hody</li>\r\n<li><strong>Birdie</strong> – ak sa podarí na dva hody</li>\r\n<li><strong>Bogey</strong> – ak na štyri hody</li>\r\n<li><strong>Double bogey</strong> – ak na päť</li>\r\n<li><strong>Hole in one</strong> alebo <strong>Ace</strong> – „eso“ teda na jeden hod</li>\r\n</ul>\r\nTerminológia pochádza z klasického golfu. Disky sa od ostatných lietajúcich tanierov líšia veľkosťou (priemer iba 20-22cm), ale hlavne svojou rôznorodosťou, na základe ktorej rozdeľujeme disky najskôr podľa dĺžky hodu na:</div>\r\n<div style="text-align: justify;">\r\n<ul>\r\n<li><strong>Driver</strong> – používa sa na najdlhšie hody z tee off                    </li>\r\n<li><strong>Mid-Range</strong> – určený na stredné vzdialenosti</li>\r\n<li><strong>Approach</strong> – je využívaný na krátke presné hody ku košu</li>\r\n<li><strong>Putter</strong> – zakončenie do koša.</li>\r\n</ul>\r\n</div>\r\n<div style="text-align: justify;">                                                                                               </div>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><span style="color: #000000; font-size: large;"><strong>Stručne z histórie</strong></span></p>\r\n<p class="columnlistp" style="text-align: justify;">Moderné začiatky Disc Golfu siahajú do severnej Ameriky šesťdesiatych rokov minulého storočia. Prvé oficiálne discgolfové ihrisko sa datuje na rok 1975, o rok neskôr už aj s novým kovovým reťazovým štýlom koša a založenou organizáciou PDGA (Professional Disc Golf assosiation). Počas deväťdesiatych rokov zaznamenal discgolf obrovský "boom", čoho výsledkom je dnes vyše 3000 ihrísk, 40 000 v PDGA registrovaných hráčov, ich celkový počet sa odhaduje na cca 500 000.</p>\r\n<div> </div>\r\n<div>  </div>\r\n<div><hr /></div>\r\n<div> </div>\r\n<div id="901308037980366532-rhs" class="column">\r\n<div class="columnlistp"><a></a> </div>\r\n</div>', '', 1, 0, 0, 2, '2012-08-31 07:12:04', 42, '', '2012-09-07 08:45:50', 43, 43, '2012-09-07 09:08:09', '2012-08-31 07:12:04', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 78, 0, 9, '', '', 1, 4399, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(45, 87, 'Makov MSR 2012 výsledky', 0x6d616b6f762d6d73722d323031322d7679736c65646b79, '', '<p><strong>MSR Makov 2012</strong></p>\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td>1.</td>\r\n<td>Lukáš Jedlička</td>\r\n<td>142</td>\r\n</tr>\r\n<tr>\r\n<td>2.</td>\r\n<td>Martin Krička</td>\r\n<td>142</td>\r\n</tr>\r\n<tr>\r\n<td>3.</td>\r\n<td>Richard Kollár</td>\r\n<td>148</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong> </strong></p>', '', 1, 0, 0, 2, '2012-09-03 15:35:51', 43, '', '2012-09-03 15:52:34', 43, 0, '0000-00-00 00:00:00', '2012-09-03 15:35:51', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 3, '', '', 1, 46, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `b0e2j_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES (36, 77, 'Naše služby', 0x6e6173652d736c757a6279, '', '<h1 style="text-align: justify; padding-bottom: 5px; line-height: 1.5; background-color: #ffffff; margin: 0px; padding-left: 0px; padding-right: 0px; font-family: Verdana !important; color: #273b4a; font-size: 18px !important; padding-top: 5px;"><span style="color: #333333;">Zábava, čerstvý vzduch, kvalita a férové ceny.</span><span><span style="color: #273b4a;"> </span></span><span style="color: #333333;">Vyberte si z ponuky našich služieb.</span><br /><br /></h1>\r\n<div style="color: #273b4a; font-family: ''Trebuchet MS'', arial, sans-serif; line-height: normal; background-color: #ffffff;">\r\n<div id="159671992209564985-parent" class="wsite-splitpane-2" style="width: 914px;">\r\n<div id="159671992209564985-lhs" class="column" style="width: 452.4166564941406px; float: left; overflow: visible; margin: 0px; padding: 0px;">\r\n<div class="columnlistp" style="padding-right: 5px;"><strong>Disc Golf Quick</strong><span style="z-index: 10; position: relative; float: left; clear: left; margin-top: 0px;"><span style="z-index: 10; position: relative; float: left; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/9759167.jpg?116" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">12 jamkové ihrisko v bratislavskom lesoparku.</span><br /><span style="font-size: small;">Dostupnosť autom na okraj lesa , odtiaľ 3 km príjemnej prechádzky lesom k ihrisku. Kapacita do 20 osôb. K dispozícii je suché WC.</span></div>\r\n<hr style="visibility: hidden; width: 447.3999938964844px; clear: both;" />\r\n<div>\r\n<div style="height: 20px; overflow: hidden; width: 447.3999938964844px;"> </div>\r\n<hr class="styled-hr" style="background-color: #777777; border: 0pt none; color: #777777; height: 1px; margin: 0px auto; text-align: center; width: 447.3999938964844px;" />\r\n<div style="height: 20px; overflow: hidden; width: 447.3999938964844px;"> </div>\r\n</div>\r\n<strong>Disc Golf Real<span style="z-index: 10; position: relative; margin-top: 0px; float: left; clear: left;"><span style="z-index: 10; position: relative; margin-top: 0px; float: left; clear: left;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/8314872.jpg?114" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span></strong>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">9 jamkové downhill ihrisko je situované priamo na lyžiarskej zjazdovke. K dispozícii je ubytovanie v zrekonštruovanom apartmánovom dome (30 samostatných apartmánov o rozlohe cca 50m2), kongresové služby, wellnes a bohatá gastronómia.</span></div>\r\n<hr style="clear: both; width: 447.3999938964844px; visibility: hidden;" /></div>\r\n</div>\r\n<div id="159671992209564985-rhs" class="column" style="width: 452.4166564941406px; left: auto; float: left; overflow: visible; margin: 0px; padding: 0px;">\r\n<div class="columnlistp" style="padding-left: 5px;"><strong>Disc Golf On Tour</strong><span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><span style="position: relative; z-index: 10; float: left; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/2761188.jpg?117" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">K dispozícii máme väčšie množstvo prenosných košov a discov , takže ilúziu originálneho discgolfového ihriska Vám vytvoríme kdekoľvek si budete želať.</span></div>\r\n<hr style="clear: both; width: 447.3999938964844px; visibility: hidden;" />\r\n<div>\r\n<div style="height: 20px; overflow: hidden; width: 447.3999938964844px;"> </div>\r\n<hr class="styled-hr" style="background-color: #777777; border: 0pt none; color: #777777; height: 1px; margin: 0px auto; text-align: center; width: 447.3999938964844px;" />\r\n<div style="height: 20px; overflow: hidden; width: 447.3999938964844px;"> </div>\r\n</div>\r\n<strong>Disc Golf Camp</strong><span style="z-index: 10; float: left; position: relative; clear: left; margin-top: 0px;"><span style="z-index: 10; float: left; position: relative; clear: left; margin-top: 0px;"><a style="color: #305b8f;"><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/8073483.jpg?119" border="0" alt="Picture" style="border-width: 1px; border-style: solid; border-color: #cccccc #aaaaaa #aaaaaa #cccccc; margin: 5px 10px 10px 0px; padding: 3px;" /></a></span></span>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"> </div>\r\n<div style="text-align: justify; margin-top: -10px; margin-bottom: 10px; font-size: 11px;"><span style="font-size: small;">9 jamkové discgolfové ihrisko v obci Kuchyňa 40 km od Bratislavy. Ihrisko je súčasťou  novovybudovaného campingu - Camping park Karpaty. Nachádza sa v príjemnom prostredí Malých Karpát. Možnosť kempovania, posedenia v kaviarničke, využitia ohnísk na opekanie. K  dispozícii sú sprchy a toalety.</span></div>\r\n<hr style="width: 447.3999938964844px; visibility: hidden; clear: both;" /></div>\r\n</div>\r\n</div>\r\n<div style="clear: both; visibility: hidden; height: 0px; overflow: hidden;"> </div>\r\n</div>\r\n<div style="color: #273b4a; font-family: ''Trebuchet MS'', arial, sans-serif; line-height: normal; background-color: #ffffff;">\r\n<div style="height: 20px; overflow: hidden; width: 914px;"><hr /> <hr /><hr /></div>\r\n</div>\r\n<div class="paragraph editable-text" style="margin: 0px; padding: 5px 0px; line-height: 22px; color: #273b4a; font-size: 13px; font-family: Verdana !important; background-color: #ffffff;">Samozrejmosťou sú doplnkové služby - ozvučenie, osvetlenie, catering, párty stany, outdoorové a indoorové aktivity, kultúrny program a čokoľvek si budete želať. Našim poslaním je Vaša maximálna spokojnosť. Odbremeníme Vás od starostí s organizáciou podujatia.<br /><br />Vieme pripraviť aj zábavu pre Vaše deti predškolského veku, pre ktoré je k dispozícii minidiscgolfový kôš a mini disky.</div>\r\n<div class="paragraph editable-text" style="margin: 0px; padding: 5px 0px; line-height: 22px; color: #273b4a; font-size: 13px; font-family: Verdana !important; background-color: #ffffff;"><img src="images/captions/leo DGr 4.jpg" border="0" alt="" /> <img src="images/captions/leo 6_r.jpg" border="0" alt="" /> <img src="images/captions/leo DG 3r.jpg" border="0" alt="" /></div>\r\n<div class="paragraph editable-text" style="margin: 0px; padding: 5px 0px; line-height: 22px; color: #273b4a; font-size: 13px; font-family: Verdana !important; background-color: #ffffff;">  <br /><br />Váš výnimočný event Vám navrhneme a naceníme presne podľa Vašich požiadaviek.<br />Ak Vás naša ponuka oslovila, neváhajte nás <a href="kontakt" title="Kontakt" style="color: #305b8f;">kontaktovať</a>. <br />Tešíme sa na Vás.</div>', '', 1, 0, 0, 2, '2012-08-31 06:52:30', 42, '', '2012-09-11 18:30:01', 43, 0, '0000-00-00 00:00:00', '2012-08-31 06:52:30', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 0, 11, '', '', 1, 4135, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(37, 78, 'Niečo o mne', 0x6b6f6e74616b74, '', '<p> </p>\r\n<p>Disc Golf som objavoval v Californii  rokoch 2002 a 2003. Hneď po návrate do SR som sa snažil na tento šport poukázať a naštartovať ho aj u nás doma. Prvý slovenský turnaj aj s medzinárodnou účasťou som zorganizoval v roku 2005. Každoročne turnaje aj vďaka pomoci ďalších nadšencov pribúdajú a získavajú na kvalite.</p>\r\n<div style="text-align: justify;">Okrem rozvoja Disc Golfu som zároveň aj aktívny hráč so ziskom dvoch titulov Majstra Slovenskej republiky za rok 2010 a 2012.</div>\r\n<div> </div>\r\n<div><span style="font-size: x-large;"><img src="images/captions/na web.jpg" border="0" alt="" /></span></div>\r\n<div> </div>\r\n<div> </div>\r\n<div><span style="font-size: x-large;">Kontakty</span></div>\r\n<div>\r\n<div>\r\n<h3 style="text-align: left;"><span style="font-size: medium;">Martin Krička                             Vladimír Spáčil<br /></span></h3>\r\n<div style="text-align: left;">Eisnerova 13                                Rímska 4<br />841 07 Bratislava                          841 10 Bratislava</div>\r\n<div style="text-align: left;">Tel: +421 905 805 204                   Tel: +421 907 808 909<br />E-mail: <a href="mailto:kricka@discgolf.sk" target="_blank">info@discgolf.sk</a>              E-mail: <a href="mailto:spacil@discgolf.sk">spacil@discgolf.sk</a></div>\r\n</div>\r\n</div>\r\n<div> </div>\r\n<div> </div>\r\n<div> </div>\r\n<div> </div>', '', 1, 0, 0, 2, '2012-08-31 06:59:50', 42, '', '2013-04-25 17:34:14', 43, 43, '2013-04-25 17:34:14', '2012-08-31 06:59:50', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 27, 0, 12, '', '', 1, 4192, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(39, 80, 'Kde hrať discgolf?', 0x6b64652d687261742d64697363676f6c66, '', '<p><span style="font-size: 1.1em; line-height: 1.65em; font-family: ''Lucida Grande'', ''Lucida Sans Unicode'', helvetica, verdana, arial, sans-serif;">Discgolf na Slovensku môžete hrať na permanentnom ihrisku alebo na turnajoch, ktoré usporiadame. Na jar sú to turnaje v Budmericiach (apríl) a Smoleniciach (jún), na jeseň sú to Majstrovstvá Slovenska (október). Viac informácií nájdete v sekcii </span><a href="http://szf.sk/node/333" style="padding: 0px; margin: 0px; color: #005a8c; text-decoration: underline;">Turnaje</a><span style="font-size: 1.1em; line-height: 1.65em; font-family: ''Lucida Grande'', ''Lucida Sans Unicode'', helvetica, verdana, arial, sans-serif;">.</span></p>\r\n<div class="node" style="padding: 0px; margin: 0px; font-family: ''Lucida Grande'', ''Lucida Sans Unicode'', helvetica, verdana, arial, sans-serif; line-height: 13.666666984558105px;">\r\n<div class="content" style="padding: 0px; margin: 0px;">\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><strong style="padding: 0px; margin: 0px;"><big style="padding: 0px; margin: 0px;">First downhill discgolf course in Makov</big></strong></p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;">Prvé downhill discgolfové ihrisko na kysuciach v<br style="padding: 0px; margin: 0px;" />Makove. Na prudkom svahu 9 jamiek na 5 kosov. Krásne ihrisko, ktoré musíte vyskúšať. Tu nájdet <a href="http://szf.sk/sites/default/files/Makov%20downhill%20discgolf%20course.JPG" style="padding: 0px; margin: 0px; color: #005a8c; text-decoration: underline;">plán ihriska</a>,</p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;"><strong style="padding: 0px; margin: 0px;"><big style="padding: 0px; margin: 0px;">Permanentné ihrisko v Bratislave</big></strong></p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;">Prvé permanentné ihrisko Bratislavský lesopark - <a href="http://maps.google.sk/maps?ll=48.235021,17.103224&amp;spn=0.008375,0.027595&amp;t=h&amp;z=15&amp;lci=com.panoramio.all,org.wikipedia.cs" style="padding: 0px; margin: 0px; color: #005a8c; text-decoration: underline;">Malý Slavín</a></p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;">Zemepisná šírka : 48°14''6.11"S<br style="padding: 0px; margin: 0px;" />Zemepisná dĺžka : 17° 6''8.74"V</p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;">Na ihrisku prebieha <a href="https://sites.google.com/site/discgolfovaliga" style="padding: 0px; margin: 0px; color: #005a8c; text-decoration: underline;">Discgolfová liga</a>, k dispozícii sú tri koše, každý z nich má štyri rôzne odhodiská z rôznych smerov. Na ihrisku sú voľne dostupné disky na požičanie, scorekarty a veľká informačná tabuľa.<br style="padding: 0px; margin: 0px;" />Kontakty na pravidelne hrávajúcich členov nájdete v sekcii <a href="http://szf.sk/node/323" style="padding: 0px; margin: 0px; color: #005a8c; text-decoration: underline;">Kontakty</a>.</p>\r\n<p style="padding: 0px; margin: 0px 0px 10px; font-size: 1.1em; line-height: 1.65em;">Ďalšie permenatné ihriská sú momentálne vo výstavbe (Kuchyňa 2011, Makov 2011).</p>\r\n</div>\r\n</div>\r\n<p> </p>', '', 1, 0, 0, 2, '2012-08-31 07:13:41', 42, '', '2012-09-03 18:26:38', 42, 0, '0000-00-00 00:00:00', '2012-08-31 07:13:41', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 10, '', '', 1, 48, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(40, 81, 'Kalendár domácich a zahraničných turnajov', 0x6b616c656e6461722d646f6d61636963682d612d7a616872616e69636e7963682d7475726e616a6f76, '', '<p> </p>\r\n<p> <iframe src="https://www.google.com/calendar/embed?src=bl6g1t9guvl037t54gmrho8cn0%40group.calendar.google.com&amp;ctz=Europe/Prague" width="500" height="375"></iframe> </p>\r\n<p style="text-align: justify;"><iframe src="https://www.google.com/calendar/embed?src=discgolf.at%40gmail.com&amp;ctz=Europe/Prague" width="500" height="375"></iframe></p>\r\n<p style="text-align: justify;"> </p>\r\n<div class="node" style="padding: 0px; margin: 0px; font-family: ''Lucida Grande'', ''Lucida Sans Unicode'', helvetica, verdana, arial, sans-serif; line-height: 13.666666984558105px;">\r\n<div class="content" style="padding: 0px; margin: 0px;">\r\n<p> <iframe src="https://www.google.com/calendar/embed?src=9l5ku84b8bluevrsej93qjv57o%40group.calendar.google.com&amp;ctz=Europe/Prague" width="500" height="375"></iframe></p>\r\n </div>\r\n<div class="content" style="padding: 0px; margin: 0px;"><iframe src="https://www.google.com/calendar/embed?src=9cf595d2mjj8b55k264220jcms%40group.calendar.google.com&amp;ctz=Europe/Prague" width="500" height="375"></iframe></div>\r\n<div class="content" style="padding: 0px; margin: 0px;"> </div>\r\n<div class="content" style="padding: 0px; margin: 0px;"><iframe src="https://www.google.com/calendar/embed?src=aas6fr8ll30661pooi3ap6t67k%40group.calendar.google.com&amp;ctz=Europe/Prague" width="500" height="375"></iframe></div>\r\n</div>', '', 1, 0, 0, 2, '2012-08-31 07:15:10', 42, '', '2013-02-07 22:32:16', 43, 0, '0000-00-00 00:00:00', '2012-08-31 07:15:10', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 0, 8, '', '', 1, 6413, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(41, 82, 'Disc Golfové stránky', 0x6c696e6b79, '', '<div> <span style="font-size: 1.1em; line-height: 1.3em;"><br /></span>\r\n<ul>\r\n<li><span style="font-size: 1.1em; line-height: 1.3em;"><a href="http://www.szf.sk" target="_blank">szf.sk</a> - Slovenská asociácia frisbee (SAF)</span></li>\r\n</ul>\r\n</div>\r\n<ul>\r\n<li><a href="http://www.discgolf.sk/">discgolf.sk</a> - všetko o Disc Golfe na Slovensku. Turnaje, výsledky, ihriská, tréningy.</li>\r\n</ul>\r\n<ul>\r\n<li><a href="http://www.discgolf.cz" target="_blank">discgolf.cz</a> - stránka o vsetkom z oblasti Disc Golfu v Českej republike.</li>\r\n</ul>\r\n<ul>\r\n<li><a href="http://www.discgolf.at/" target="_blank">discgolf.at</a> - všetko o regionálnych podujatiach v Disc Golfe. Prihlasovanie sa na lokálne turnaje a stredoeurópsku ligu, výsledky.</li>\r\n</ul>\r\n<ul>\r\n<li><a href="http://www.disc-golf.hu/" target="_blank" title="Disc Golf Hungary">disc-golf.hu</a> - stránka našich južných susedov.</li>\r\n</ul>\r\n<ul>\r\n<li><a href="http://discgolf.com/" target="_blank">discgolf.com</a> - novinky zo sveta Disc Golfu<span style="font-size: 1.1em; line-height: 1.3em;">.</span></li>\r\n</ul>\r\n<ul>\r\n<li><span><a href="http://www.pdga.com" target="_blank">pdga.com</a> - stránka Profesionálnej Disc Golfovej asociácie.</span></li>\r\n</ul>', '', 1, 0, 0, 2, '2012-08-31 07:16:14', 42, '', '2013-04-18 09:57:26', 43, 0, '0000-00-00 00:00:00', '2012-08-31 07:16:14', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 0, 7, '', '', 1, 3847, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(42, 83, 'História', 0x686973746f726961, '', '<div class="columnlistp">\r\n<h2>Stručne z histórie</h2>\r\n<span><span><a><img class="galleryImageBorder" src="http://discgolfevents.weebly.com/uploads/8/7/6/4/8764801/2017303.jpg?222" border="0" alt="Picture" style="margin-left: 20px; margin-right: 20px; float: right;" /></a></span></span>\r\n<div>Moderné začiatky Disc Golfu siahajú do severnej Ameriky šesťdesiatych rokov minulého storočia. Prvé oficiálne discgolfové ihrisko sa datuje na rok 1975, o rok neskôr už aj s novým kovovým reťazovým štýlom koša a založenou organizáciou PDGA (Professional Disc Golf assosiation). Počas deväťdesiatych rokov zaznamenal discgolf obrovský "boom", čoho výsledkom je dnes vyše 3000 ihrísk, 40 000 v PDGA registrovaných hráčov, ich celkový počet sa odhaduje na cca 500 000.</div>\r\n<div> </div>\r\n<div> </div>\r\n<div> </div>\r\n</div>\r\n<div><hr /></div>\r\n<div> </div>\r\n<div id="901308037980366532-rhs" class="column">\r\n<div class="columnlistp"><a><object width="350" height="289" data="http://www.youtube.com/v/_c7qCImCFww" type="application/x-shockwave-flash"><param name="src" value="http://www.youtube.com/v/_c7qCImCFww" /><param name="allownetworking" value="internal" /><param name="wmode" value="transparent" /></object></a> </div>\r\n</div>', '', 1, 0, 0, 2, '2012-08-31 11:27:25', 42, '', '2012-08-31 14:46:41', 42, 0, '0000-00-00 00:00:00', '2012-08-31 11:27:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 24, 0, 6, '', '', 1, 82, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(43, 84, 'Ako vybrať disk na Disc Golf', 0x616b6f2d7679627261742d6469736b2d6e612d64697363676f6c66, '', '<h1 style="text-align: justify;"><img src="images/captions/disc_portfolio.jpg" border="0" alt="" /> </h1>\r\n<div class="node">\r\n<div class="content">\r\n<p style="text-align: justify;">Tak ako v golfe každý hráč pri hre používa v rôznych herných situáciách rozličné typy palíc, aj v discgolfe hráči používajú rôzne typy diskov. Základné delenie je pomerne jednoduché: na krátke dohadzovanie do koša používame disky typu Putt &amp; Approach, na stredné vzdialenosti Mid-range a na dlhé hody Driver (fairway alebo distance). Každý typ disku má iné vlastnosti v závislosti na jeho tvare a typu plastu, z ktorého je vyrobený. Len značky Innova a Discmania majú viac ako 80 rôznych druhov diskov, ktoré môžu byť vyrobené celkom z 12 rôznych plastov, veľké množstvo diskov vyrábajú aj firmy Discraft (výrobca tradičného ultimate disku Ultrastar), Gateway atď.</p>\r\n<p style="text-align: justify;">Nájsť medzi toľkými rôznymi diskami tie správne, ktoré vám budú vyhovovať, je dlhodobý proces. Málokedy sa ale stáva, že hráč po prvom použití nový disk odloží s tým, že mu nevyhovuje, alebo nenájde pre jeho vlastnosti využitie, pretože nikdy nie je jasné, či sa presne tento disk nebude hráčovi hodiť za určitých špecifických okolností (uhol hodu, vietor, a pod.). No a napokon, nesmieme zabudnúť ani na rôznu hmotnosť diskov. Takmer každý typ disku sa vyrába v rôznych hmotnostných verziách, zvyčajne medzi 150 – 180 g (ultimate disk Ultrastar ma hmotnosť 175 g). Všeobecne ľahšie disky sú vhodnejšie pre deti, začiatočníkov a hráčov, ktorí pri hode využívajú viac švihu, než sily. Naopak ťažšie disky sú vhodné pre silových hráčov, prípadne pri hodoch v silnejšom vetre.</p>\r\n<p style="text-align: justify;"><strong>1. ZÁKLADNÉ ROZDELENIE DISKOV</strong></p>\r\n<p style="text-align: justify;"><strong>Putt &amp; Approach</strong> – stabilné disky, ktoré lietajú pomalšie. Najviac pripomínajú vlastnosti ultimate disku. Vďaka tomu ponúkajú skvelú kontrolu aj pri horších poveternostných podmienkach, čo je pri dohadzovaní do koša veľmi dôležité. Putt-re (čítaj patre) sa dajú skvelo použiť aj na prihrávku pod alebo ku košu. Každý skúsenejší hráč discgolfu vám potvrdí, že základom dobrého skóre je najmä skvelé ovládanie putteru.</p>\r\n<p style="text-align: justify;"><strong>Mid-range</strong> – tieto disky sú vhodné pre skoro všetky druhy hodov, najmú pre ich stabilnú dráhu letu aj pri dlhších hodoch. Práve z tohto dôvodu sú najviac odporúčané začiatočníkom ako ich jediný disk. Prioritne sú určené na kratšie (20 – 40 m) prihávky, ale dá sa s nimi dobre hádzať aj na dlhšiu vzdialenosť (do cca. 70m) ku košu. Je však možné ich použiť na kratšie drive, ako aj pri puttovaní, avšak treba myslieť na to, že podľa svojich parametrov môžu mať preferenciu bočiť do strany.</p>\r\n<p style="text-align: justify;"><strong>Fairway driveR</strong> – tieto disky používajú hráči, keď je pre nich presnosť dôležitejšia ako vzdialenosť. Sú pomalšie a teda ľahšie kontrolovateľné ako distance drivre (čítaj drajvre), a preto sú pre začiatočníkov oveľa vhodnejšie.</p>\r\n<p style="text-align: justify;"><strong>Distance driver</strong> – vrchol dizajnového vývoja diskov. Majú vysokú rýchlosť, dlhý dolet a vyžadujú, aby mal hráč dobre vypracovanú techniku hodu. Pri nedodržaní správnej techniky môžu uletieť veľmi ďaleko nesprávnym smerom, najmä pri silnejšom vetre. V rukách neskúsených hráčov môžu takéto disky pôsobiť ako delo v rukách dieťaťa.</p>\r\n<p style="text-align: justify;"><strong>2. PODĽA LETOVÝCH VLASTNOSTÍ</strong></p>\r\n<p style="text-align: justify;">Pri nákupe disku je možné sa riadiť štyrmi číselnými parametrami, ktoré hovoria o jeho letových vlastnostiach. Tieto parametre závisia na celkovom tvare disku a jeho vnútornej stavbe (plochý resp. vypuklý disk, širší vs. ostrý okraj, rovnomerne radiálne rozložená hmotnosť vs. centrovaná alebo necentrovaná hmotnosť). Tieto dôležité parametre sú: rýchlosť (SPEED), kĺzavosť (GLIDE), zatáčanie v plnej rýchlosti letu (TURN) a zatáčanie pri spomaľovaní (FADE). Už z tohto delenia teda vyplýva, že let disku ma niekoľko fáz, v ktorých sú jeho letové vlastnosti rôzne (disk môže pri vysokej rýchlosti letu najprv letieť doprava a následne po spomalení zmeniť smer doľava, takto možno hádzať tzv. eskové hody s letom v tvare písmena S), a taktiež, že let je veľmi ovplyvnený či už rýchlosťou (švihom) a silou jeho vypúšťania z ruky alebo prítomnosťou a smerom vetra. Taktiež rovnaké disky hodené tým istým spôsobom ľavákom a pravákom zatáčajú do opačných strán.</p>\r\n<p style="text-align: justify;"><strong>Speed</strong> – schopnosť disku prerážať vzduch, čím vyššie číslo, tým je disk rýchlejší. Rýchlejší disk letí ďalej s vynaložením menšieho úsilia. Pomalšie disky je nutné hodiť väčšou silou, ale pravdepodobnosť, že preletí cieľ je nižšia. Rýchlosť hodnotíme na škále od 1 do 13. Parameter rýchlosť tiež hovorí o tom, pri akej rýchlosti má disk ideálne letové vlastnosti. Preto disky s vysokými rýchlostnými číslami nie sú vhodné pre hráčov, ktorí pri hode nedokážu dať disku dostatočnú rýchlosť. Pre začiatočníkov preto odporúčame začať s diskami s rýchlosťami menšími ako 10.</p>\r\n<p style="text-align: justify;"><strong>Glide</strong> – popisuje schopnosť disku niesť sa vzduchom. Vyšší glide je skvelý pre začiatočníkov a pre dosiahnutie maximálnej vzdialenosti. Kĺzavosť sa hodnotí číslami 1-6. Čím vyššie číslo, tým väčšia kĺzavosť. Najmä pri hádzaní proti vetru alebo s bočným vetrom hrá kĺzavosť disku veľkú rolu a dokáže veľmi predĺžiť dĺžku jeho letu.</p>\r\n<p style="text-align: justify;"> </p>\r\n<div class="img_box img_right" style="text-align: justify;">\r\n<div class="img_image"><a class="lightbox-processed" href="http://szf.sk/sites/default/files/let.png" title="let.png" rel="lightbox[503]"><img class="img" src="http://szf.sk/sites/default/files/img_thumbnails/503_638.png" border="0" alt="let.png" title="let.png" width="185" height="250" /></a></div>\r\n</div>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><strong>Turn</strong> – disk hodený pravorukým hráčom technikou backhand má väčšiu či menšiu tendenciu sa vďaka svojej vysokej rýchlosti rotácie stáčať v prvej fáze letu viac či menej doprava. Disky s označením 0 majú najnižšiu tendenciu sa otáčať cez os, disky s označením -5 zatáčajú najviac. Pre ľavákov pri backhande disk zatáča v tejto fáze letu doľava. Niektoré disky ako Viper a Whippet majú tento parameter kladný, t.j. pri správnej technike hodu zatáčajú letia rovno, príp. mierne zatáčajú doľava. Disky s hodnotami -2 až -5 sú vhodné aj na rolovanie.</p>\r\n<p style="text-align: justify;"> </p>\r\n<div class="img_box img_left" style="text-align: justify;">\r\n<div class="img_image"><a class="lightbox-processed" href="http://szf.sk/sites/default/files/letg.png" title="letg.png" rel="lightbox[503]"><img class="img" src="http://szf.sk/sites/default/files/img_thumbnails/503_639.png" border="0" alt="letg.png" title="letg.png" width="250" height="226" /></a></div>\r\n</div>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><strong>Fade</strong> – na konci letu má každý disk tendenciu zabočiť vľavo (pri hode praváka backhandom). Toto discgolfové disky najviac odlišuje od diskov používaných na ultimate frisbee, ktoré takúto vlastnosť nemajú. Disky s malou kladnou hodnotou, či hodnotou 0 (napr. Innova Mako) lietajú priamejšie, prípadne je s nimi možné hodiť bez toho, aby na konci zmenili smer letu doľava, t.j. ich fade (zabočenie) je veľmi malé, naopak disky s hodnotením 5 (napr. Innova Gator) zabáčajú pri spomalení najviac, často vo veľmi ostrých uhloch. Opäť, pre ľavákov pri backhande disk zatáča v tejto fáze letu doprava.</p>\r\n<p style="text-align: justify;"><strong>3. PODĽA MATERIÁLU</strong></p>\r\n<p style="text-align: justify;"><strong>Innova:</strong></p>\r\n<p style="text-align: justify;"><strong>Star plastic</strong> : najlepšia kombinácia trvanlivosti a gripu (úchop). Disky z tohto plastu vydržia veľmi dlho, aj keď ich budete vytrvalo hádzať do stromov. Na druhej strane v mokrom počasí sa najviac šmýkajú, taktiež sa dokážu dobre odrážať od zeme, alebo sa šmýkať po tráve. Zároveň sú pre kvalitný použitý plast aj najdrahšie.</p>\r\n<p style="text-align: justify;"><strong>Champion plastic</strong> : tvrdší materiál, ktorý však tiež vydrží dlho. Nie je extra vhodný pre začiatočníkov, keďže nemá dobrý grip, najmä v chladnom alebo vlhkom počasí.</p>\r\n<p style="text-align: justify;"><strong>Pro plastic</strong> : disky majú perfektný grip a lepší Glide. Sú taktiež trvanlivejšie ako základný plast DX.</p>\r\n<p style="text-align: justify;"><strong>R-Pro</strong> : mäkší materiál s výborným gripom. Sú dobrou voľbou pri chladnejšom počasí, výhodou môže byť tiež minimálny odraz a odskakovanie pri pristátí.</p>\r\n<p style="text-align: justify;"><strong>DX plast</strong> : základný a najpopulárnejší materiál. DX plast ponúka najväčší výber diskov. Veľmi vhodné najmä na puttery, ktoré sa často nehádžu plnou silou do stromov. Pri silných nárazoch sa disk poškodzuje, najmä jeho hrana. Skúsenejší hráči tieto disky po poškodení opracovávajú pilníkom. Poškodené DX plastové disky však nie sú tiež na zahodenie. Množstvo nárazov môže zmeniť ich letové vlastnosti natoľko, že majú unikátnu dráhu letu, napr. sa pri dlhších hodoch nepreklápajú, či letia na opačnú stranu ako ostatné disky. Taktiež z nich bývajú dobre rolery. Preto dobre poškodené DX disky bývajú najväčšími pokladmi zbierok špičkových hráčov.</p>\r\n<p style="text-align: justify;"><strong>Discmania:</strong></p>\r\n<p style="text-align: justify;"><strong>D-line</strong> : dobrý grip aj za mokra, najvhodnejšie pri putteroch.</p>\r\n<p style="text-align: justify;"><strong>P-line</strong> : materiál podobný R-Pro od Innovy.</p>\r\n<p style="text-align: justify;"><strong>C-line</strong> : Tvrdší plast s dobrým gripom a výbornou trvanlivosťou.</p>\r\n<p style="text-align: justify;"><strong>S-line</strong> : Perfektný grip a stále dobrá životnosť.</p>\r\n<p style="text-align: justify;"><strong>SG-line</strong> : Mäkšia verzia materiálu S-line. V tomto plastie sa zatiaľ vyrába iba disk MD1.</p>\r\n<p style="text-align: justify;"><strong>4. PODĽA HMOTNOSTI</strong></p>\r\n<p style="text-align: justify;">Hmotnosť má zásadný vplyv na letové vlastnosti disku. Ľahšie disky síce lietajú ďalej, najmä pri hodoch do kopca, avšak silno podliehajú vplyvom vetra. Na druhej strane ťažšie disky udržia smer aj vo vetre a menej sa odrážajú od zeme.</p>\r\n<p style="text-align: justify;">Taktiež treba spomenúť, že niektoré disky majú špeciálne vlastnosti. Existujú disky, ktoré plávu na vodnej hladine (vhodné na hody cez jazerá alebo v ich blízkosti) alebo disky s veľkým obvodom vhodné na rolovanie, prípadne iné veľmi špecifické typy. Viac informácií o diskoch nájdete na stránkach ich výrobcov, prípadne na iných stránkach, ako je napr. <a href="http://www.discgolfreview.com" target="_blank">discgolfreview</a>, kde nájdete recenzie jednotlivých diskov. Napríklad prehľad rôznych typov diskov od výrobcu Innova, ktorý najstarostlivejšie číselne kóduje svoje disky, nájdete na ich stránkach: <a href="http://www.innovadiscs.com" target="_blank">INNOVA</a></p>\r\n<p style="text-align: justify;"><strong>ZÁVER</strong></p>\r\n<p style="text-align: justify;">Vybrať ten správny disk je naozaj ťažké. Odporúčame si disk najprv od niekoho požičať a vyskúšať si s ním hodiť pár hodov. Ideálna minimálna kolekcia diskov by mala obsahovať jeden putter, jeden mid-range disk, a pár driverov s dostatočne rozlišnými parametrami Turn a Fade, minimálne však jeden z malým a veľkým Fade. Na hranie na Malom Slavíne by mala postačovať kolekcia 4 diskov, na turnaje ako Budmerice alebo Smolenice sa vám už zíde aj 6-10 rôznych diskov, kým na veľké turnaje, prípadne špecifické ihriská ako je napríklad Makov (dole zjazdovkou) treba kolekciu patrične rozšíriť.</p>\r\n<p style="text-align: justify;"><strong>Predaj diskov</strong></p>\r\n<p style="text-align: justify;">Na Slovensku možno kúpiť viacero značiek diskov:<br />Značky Innova a Discmania predáva firma <a href="http://andysport.sk/76-disky%E2%80%9D">andysport.sk</a><br />disky Discraft ponúka firma <a href="http://www.discline.com/" target="_blank">Discline.com</a>. Disky možno taktiež nakupovať na discgolfových turnajoch.</p>\r\n</div>\r\n</div>', '', 1, 0, 0, 2, '2012-08-31 14:37:47', 42, '', '2012-09-07 08:04:28', 43, 0, '0000-00-00 00:00:00', '2012-08-31 14:37:47', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 0, 5, '', '', 1, 3926, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(44, 85, 'Videá', 0x7669646561, '', '<table style="width: 400px;" border="0" cellspacing="0" cellpadding="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<h1>Galéria</h1>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<h1>Inštruktážne videá</h1>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h3>Super Hole in ONE</h3>\r\n<p>Toto video bolo dňa 13.10.2010 v športe na Markíze ako frajer na záver.</p>\r\n<p><iframe src="http://www.youtube.com/embed/byK-KeSUSAo" frameborder="0" width="425" height="350"></iframe></p>\r\n<p> </p>\r\n<h3>First course</h3>\r\n<h3> <iframe style="float: left;" src="http://www.youtube.com/embed/csEDkSD-tEY" frameborder="0" width="425" height="350"></iframe></h3>\r\n<h3><span title="Discgolf Smolenice Open 2012 - Final Round Highlights - a short movie by 66" dir="ltr"> </span></h3>\r\n<h3><span title="Discgolf Smolenice Open 2012 - Final Round Highlights - a short movie by 66" dir="ltr"> </span></h3>\r\n<h3><span title="Discgolf Smolenice Open 2012 - Final Round Highlights - a short movie by 66" dir="ltr">Discgolf Smolenice Open 2012 - Final Round Highlights - a short movie by 66</span></h3>\r\n<p><span title="Discgolf Smolenice Open 2012 - Final Round Highlights - a short movie by 66" dir="ltr"> </span></p>\r\n<p><iframe style="float: left;" src="http://www.youtube.com/embed/IDp54fpEotc" frameborder="0" width="425" height="350"></iframe></p>\r\n<p> </p>\r\n<h3> </h3>\r\n<h3>Smolenice 2010</h3>\r\n<p>Trošku finálovích hodov z veže plus niečo k tomu.</p>\r\n<p> </p>\r\n<p><iframe src="http://www.youtube.com/embed/pN1AkCvyiBY" frameborder="0" width="425" height="350"></iframe></p>\r\n<p> </p>\r\n<h3>Malý Slavín 2010</h3>\r\n<p>Letná príprava našej junijorskej hviezdičky.</p>\r\n<h3><iframe style="float: left;" src="http://www.youtube.com/embed/ItZ_SSw6iRY" frameborder="0" width="425" height="350"></iframe></h3>\r\n<h3>  </h3>\r\n<h3>1. Promo video</h3>\r\n<p><iframe src="http://www.youtube.com/embed/ty0BXRN-UBs" frameborder="0" width="425" height="350"></iframe></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<h3 id="watch-headline-title"><span id="eow-title" class="long-title" title="Discmania Deep in the Game: Ep 1 - Putting (Instructional Disc Golf video)" dir="ltr">Discmania Deep in the Game: Ep 1 - Putting (Instructional Disc Golf video)</span></h3>\r\n<h3> <iframe src="http://www.youtube.com/embed/TLowvHyhSWU" frameborder="0" width="425" height="350"></iframe></h3>\r\n<h3> </h3>\r\n<h3 id="watch-headline-title"><span id="eow-title" class="long-title" title="Discmania Deep in the Game: Ep 2 - Backhand (Instructional Disc Golf video)" dir="ltr">Discmania Deep in the Game: Ep 2 - Backhand (Instructional Disc Golf video)   </span></h3>\r\n<h3> <iframe src="http://www.youtube.com/embed/rCs5u9ecVis" frameborder="0" width="425" height="350"></iframe></h3>\r\n<p> </p>\r\n<h3 id="watch-headline-title"><span id="eow-title" class="long-title" title="Discmania Deep in the Game: Ep 3 - Sidearm (Instructional Disc Golf video)" dir="ltr">Discmania Deep in the Game: Ep 3 - Sidearm (Instructional Disc Golf video)</span></h3>\r\n<h3> <iframe src="http://www.youtube.com/embed/x7ewCoZ8BwM" frameborder="0" width="425" height="350"></iframe></h3>\r\n<p> </p>\r\n<h3 id="watch-headline-title"><span id="eow-title" class="long-title" title="Discmania Deep in the Game: Ep 4 - Mental Game (Instructional Disc Golf video)" dir="ltr">Discmania Deep in the Game: Ep 4 - Mental Game (Instructional Disc Golf video)</span></h3>\r\n<h3> <iframe src="http://www.youtube.com/embed/c4zvNJ2Dk6g" frameborder="0" width="425" height="350"></iframe></h3>\r\n<p> </p>\r\n<h3 id="watch-headline-title"><span id="eow-title" class="long-title" title="Discmania Deep in the Game: Ep 5 - Monster Distance (Instructional Disc Golf video)" dir="ltr">Discmania Deep in the Game: Ep 5 - Monster Distance (Instructional Disc Golf video)</span></h3>\r\n<h3> <iframe src="http://www.youtube.com/embed/bH67PyY3RnM" frameborder="0" width="425" height="350"></iframe></h3>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td> </td>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td> </td>\r\n<td> </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3> </h3>', '', 1, 0, 0, 2, '2012-08-31 14:55:01', 42, '', '2012-09-03 19:40:15', 43, 0, '0000-00-00 00:00:00', '2012-08-31 14:55:01', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 0, 4, '', '', 1, 8291, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(46, 88, 'Fotky ', 0x666f746b792d67616c65726961, '', '<h3>Majstrovstvá SR v Makove 2012</h3>\r\n<p><span>{gallery}galerie/2012_MSR_Makov{/gallery}</span></p>', '', 1, 0, 0, 17, '2012-09-03 16:54:25', 43, '', '2012-09-07 07:51:44', 43, 0, '0000-00-00 00:00:00', '2012-09-03 16:54:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 25, 0, 1, '', '', 1, 3960, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(47, 89, 'Fotky', 0x666f746b79, '', '<h3>Majstrovstvá SR v Makove 2012</h3>', '', 1, 0, 0, 2, '2012-09-03 16:57:56', 43, '', '2012-09-06 08:07:28', 43, 0, '0000-00-00 00:00:00', '2012-09-03 16:57:56', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 2, '', '', 1, 80, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(48, 91, 'Discgolf_slideshow', 0x64697363676f6c662d736c69646573686f77, '', '<p><img src="images/slideshow/slider4.png" border="0" alt="" /><img src="images/galerie/4 obr_82perc_crop_4.jpg" border="0" alt="" /></p>', '', 1, 0, 0, 14, '2012-09-06 09:34:20', 43, '', '2012-09-09 20:23:00', 43, 0, '0000-00-00 00:00:00', '2012-09-06 09:34:20', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 27, 0, 1, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `b0e2j_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES (49, 92, 'Reportáž z Majstrovstiev SR v Makove 2012', 0x7265706f7274612d7a2d6d73722d32303132, '', '<p style="text-align: justify;" align="center"><span style="font-size: large;"><strong>Disgolfové (po)blúznenie po Makovsky</strong></span></p>\r\n<p style="text-align: justify;"><strong><span style="font-size: small;">Nedeľa podvečer:</span></strong></p>\r\n<p style="text-align: justify;">Krásnu kysuckú prírodu sme  aj tento rok opúšťali   s makovníkom na cestu. Tradičná cena pre víťazov a umiestnených na Majstrovstvách Slovenska v discgolfe - domáci makovský makovník - postupne mizol v ústach. Mňam.  Spokojný koniec prázdnin,  napínavý začiatok roka školského, zážitkový víkend. Unavení, diskutujúci s neskutočnou kulisou v aute - dve vrieskajúce príšery: alias deti Hugo s Leom si dali poobedného šlofíka rovná sa priveľa energie, následne „trpeli“ pripútaní v autosedačkách -  tešiac netešiac trielili sme domov. Zavŕšili sme tri dni discgolfblúznenia v Makove za účasti 32 hráčov čechoslovákov a iných - anglicky hovoriacich zblúdilcov.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong>Nedeľa poobedie:</strong></span></p>\r\n<p style="text-align: justify;">Zdravo vyčerpaní po dvoch dňoch „turistikovania“ si hráči plnili bruchá pri vyhlasovaní výsledkov chutnou papanicou v jedálni Ski apartmánov Makov. Vidličky a nože, poniektorí vymenili za diplomy, makovníky a víťazi v kategórii open a women – Lukáš Jedlička (obhájil minuloročné víťazstvo) a Katka Boďová aj pobytový poukaz. Pršavohmlové počasie bolo tiež účastné a statočne sprevádzalo disgolfistov počas celého turnaja. Finálový šesť jamkový zbeh makovskou zjazdovkou bol plný napätia, nakoľko o mužskom víťazovi rozhodol až záverečný rozstrel  Jedľa – Čiri (mimochodom majster Slovenska, musela som spomenúť, aby sme nemali tichú domácnosť) na poslednej jamke, na rozdiel od ženského finále, ktoré malo jasnú favoritku. Ocenenia boli udelené aj v oblasti nováčik a junior – obe uchmatol Lukáš Kvetan. Keby som aktívne hrala discgolf, chcela by som sa volať Lukáš, ide im karta. Gratulujem víťazom, nevíťazom, všetkým discgolfuchtivým.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong>Nedeľa doobedie:</strong></span></p>\r\n<p style="text-align: justify;">O finálových účastníkoch  muži Jedľa, Čiri, Rišo, Kasho, Branky a ženy Katka, Bea, Julka, Sisa definitívne rozhodlo tretie kolo. Pozostávalo z deviatich jamiek umne rozmiestnených  po osade Greguše (inak v piatok pri tvorbe ihriska to bolo husté, radšej som nemala spomenúť, aby nebola tichá domácnosť). Nebyť hmly aj by sa pokochať dalo výhľadom na slovenské kopce a stráne pripomínajúce diela Martina Benku.  Ale žblnk v topánkach je tiež zážitok. My neaktívni sme pozorovali po kopci roztrúsených, disky hádzajúcich, vzápätí hľadajúcich priaznivcov discgolfového blúznenia  z pohodlia hotelového balkóna, ujedajúc zázrivské korbáčiky a pochlipkávajúc teplý čajík. I tak še da :-). Raňajšie prebúdzanie zvládli takmer všetci bez väčších problémov. Chuť hrať je silnejšia ako káva bez mlieka.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><strong><span style="font-size: small;">Sobotný večer:</span></strong></p>\r\n<p style="text-align: justify;">Cink, cink, cink, cink, puting kontest pri umelom osvetlení bol príjemným zavŕšením náročného dňa, pivko v ruke, pohoda, spokojnosť, či? Večera zdravo štipľavá, vírivka relaxačno uvoľňujúca, debata nákazlivo pokojná. Druhé kolo skrátená na 9 jamiek, počasiu nerozkážeš a príroda sa tiež nepýta, či už môže vypnúť svetlá. Konečne do suchého.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong>Sobota prvé kolo:</strong></span></p>\r\n<p style="text-align: justify;">Spokojné žalúdky, suché ponožky, už vieme, čo nás čaká a neminie v ďalších kolách. To prvé down. Dážď, hmla, postrácané disky, zábava, pohyb, čerstvý vzduch a vzruch z hrania. Skupinky nadšencov sa pomaly vracajú do hotela.  16 jamiek, 2 ihriská, chvíľkami neviditeľné koše a stále prítomné nadšenie z vydareného, sklamanie z pokazeného, ešteže máme schopnosť zabúdať. Diskusie, hodnotenia, dojmy.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;">Toto všetko sa stalo po tom ako sa to začalo. ŠTART!</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;">A na konci začiatku – kofola, kebab, pizza, Stupava a meeting organizačného týmu.</p>\r\n<p style="text-align: justify;">O rok držím palce.</p>\r\n<p style="text-align: justify;"> </p>\r\n<p style="text-align: justify;">Matka Čirica</p>', '', 1, 0, 0, 18, '2012-09-09 09:03:22', 43, '', '2012-10-04 16:53:27', 43, 0, '0000-00-00 00:00:00', '2012-09-09 09:03:22', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, 6, '', '', 1, 3295, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(50, 94, 'slider5', 0x736c69646573686f7735, '', '<p><img src="images/slideshow/slider5.png" border="0" alt="" /><img src="images/slideshow/slideshow5.png" border="0" alt="" /></p>', '', 1, 0, 0, 14, '2012-09-09 20:28:22', 43, '', '2012-09-09 20:43:34', 43, 0, '0000-00-00 00:00:00', '2012-09-09 20:28:22', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(51, 97, 'Návšteva u južných susedov', 0x6e617673746576612d752d6a757a6e7963682d73757365646f76, '', '<p style="text-align: justify;">Neplánovaný výlet do Budapešti som využil na návštevu prvého permanentného ihriska Spiritus Disc Golf Park. Vďaka niektorým miestnym nadšencom tu vzniklo  nedávno 14 jamkové ihrisko (7 košov), na jednom z menších kopcov tohoto európskeho  veľkomesta. Ihrisko je samozrejme zadarmo, na hru potrebujete len disk.</p>\r\n<p style="text-align: justify;">Odporúčam vyskúšať.</p>\r\n<p><a href="http://goo.gl/maps/VOp5u" target="_blank">http://goo.gl/maps/VOp5u</a></p>\r\n<p> <img src="images/captions/Disc Golf Park_Budapest.JPG" border="0" alt="" /></p>', '', 1, 0, 0, 18, '2012-10-04 17:08:10', 43, '', '2012-10-04 18:36:04', 43, 0, '0000-00-00 00:00:00', '2012-10-04 17:08:10', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 5, '', '', 1, 2990, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(52, 98, 'Finále ligy 2012 v Camping Parku Karpaty', 0x66696e616c652d6c6967792d762d63616d70696e672d7061726b752d6b617270617479, '', '<p>14.10.2012 sa konal posledný oficiálny tohtoročný Disc Golfový turnaj v Camping Parku Karpaty obci Kuchyňa.<br />Všetkým Disc Golfistom aj počasiu ďakujeme za účasť ;-)</p>\r\n<p>Výsledky:</p>\r\n<p>Finale ligy 2012 Ženy<br /> <br /> Meno Skóre + Finále<br /><br />1. Monika Selecká 112 - 136<br />2. Katka Boďová 113 - 137<br />3. Bea Hergelová 122 - 145<br />4. Júlia Návratová 126 - 158<br />5. Denisa Hanečková 131<br />6. Sisa Grožajová 137<br /><br /><br /> Muži<br /><br />1. Martin Čirsson Krička 97 - 118<br />2. Lukáš KAShO Grožaj 102 - 125<br />3. Richard Kollár 107 - 129<br />4. Jozef Joey Čierny 108 - 135<br />5. Adam Flajs 110<br />6. Branislav Lukačovič 111<br />7. Adrián Németh 113<br />8. Juraj Fajo Feilhauer 115<br />9. Roman Miezga 116<br />10. Branislav Branki Jaško 120<br />11. Matej Kumo Kumorowitz 122<br />12. Peter Kučera 124<br />14. Vladko Spáčil 134</p>', '', 1, 0, 0, 18, '2012-12-08 13:58:06', 43, '', '2012-12-08 13:59:36', 43, 0, '0000-00-00 00:00:00', '2012-12-08 13:58:06', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 4, '', '', 1, 2792, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(53, 99, 'Hugov adventný pohárik 2012', 0x6875676f762d616476656e746e792d706f686172696b, '', '<p><span style="color: #000000;"><span style="font-size: medium;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;">Dovoľujeme si Vás pozvať na predvianočný Disc Golfový turnaj, ktorý sa bude konať </span></span><span style="font-size: medium;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;">16. decembra o 10:00 v Stupavskom parku. </span></span></span></p>\r\n<p style="text-align: justify;"><span style="color: #000000; font-size: medium;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;">Na 4 koše bude pripravených v dvoch hracích kolách celkom 22 jamiek. Nezabudnite tatranský čaj, rukavice, CD a DVD :)</span></span></span></p>\r\n<p style="text-align: justify;"><span style="color: #000000; font-size: medium;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;"> </span></span></span></p>\r\n<p style="text-align: justify;"><span style="color: #000000; font-size: medium;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;"><span style="font-family: ''arial'', ''helvetica'', sans-serif;"> </span></span></span></p>', '', 1, 0, 0, 18, '2013-03-05 14:56:35', 43, '', '2013-03-05 22:22:23', 43, 0, '0000-00-00 00:00:00', '2013-03-05 14:56:35', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, 3, '', '', 1, 2287, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(54, 100, 'Slovácka túra - zimná 2013', 0x736c6f7661636b612d747572612d7a696d6e612d32303133, '', '<p style="text-align: justify;">Rok 2013 odštartovali slovenský Disc Golfisti na jednom zo štyroch turnajov v rámci Slováckej túry na pevnom ihrisku v Uherskom Hradišti. Veľká škoda neskorého príchodu spôsobeného hustým snežením, ktoré malo za následok vysokú penalizáciu v prvom kole. Slovácka túra bude pokračovať najbižším jarným kolom 11.5. ďalej letným kolom 3.8. a ukončí a vyhodnotí sa na jeseň 16.11. Do konečných výsledkov si hráči započítavajú tri najlepšie dosiahnuté výsledky.</p>\r\n<p><img src="images/captions/Slovcka tra.jpg" border="0" alt="" /></p>\r\n<p> </p>', '', 1, 0, 0, 18, '2013-03-05 22:00:50', 43, '', '2013-03-05 22:05:11', 43, 0, '0000-00-00 00:00:00', '2013-03-05 22:00:50', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 2, '', '', 1, 2358, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(55, 101, 'Štompfa Cup 2013 prvý turnaj sezóny', 0x73746f6d7066612d6375702d32303133, '', '<p style="text-align: justify;">Za relatívne krásneho sobotného počasia sme úspešne odštartovali sezónu domácich jednodňových turnajov kategórie B, tento rok v Stupavskom parku pod názvom Stompfa cup 2013. Od 10.00 do 18.00 si 20 prihlásených hráčov stihlo odohrať 3 x 12 jamiek. Vďaka všetkým zúčastnením za príjemne strávený deň a tešíme sa na najbližší voľný tréning 13. apríla v Camping parku Karpaty v obci Kuchyňa, ktorý bude dobrou prípravou na prvý tohotoročný dvojdňový turnaj kategórie A <strong>Budmerice Spring Fling 2013.</strong></p>\r\n<p style="text-align: justify;">Podrobné výsledky Stompfa cup 2013 :<br /><br /><a href="https://docs.google.com/spreadsheet/ccc?key=0AvaX5urz29XsdG0zNy1XWUhlV29ReTUweWtGOFp5SGc#gid=1" target="_blank">https://docs.google.com/spreadsheet/ccc?key=0AvaX5urz29XsdG0zNy1XWUhlV29ReTUweWtGOFp5SGc#gid=1</a></p>\r\n<p><img src="images/captions/Stompfa cup 2013.jpg" border="0" alt="" /></p>', '', 1, 0, 0, 18, '2013-04-06 07:24:42', 43, '', '2013-04-06 07:40:04', 43, 0, '0000-00-00 00:00:00', '2013-04-06 07:24:42', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 1, '', '', 1, 1966, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(56, 102, 'SVK ranking', 0x73766b2d72616e6b696e67, '', '<p> <iframe src="https://docs.google.com/spreadsheet/ccc?key=0Ao34P7n7tY9cdDJVa0RGQkdjb3B0NkdJMmVMc2lQU2c#gid=1" width="1000" height="1750"></iframe>b</p>\r\n<p> </p>', '', 1, 0, 0, 2, '2013-04-18 10:14:55', 43, '', '2013-04-18 10:27:13', 43, 0, '0000-00-00 00:00:00', '2013-04-18 10:14:55', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, 1, '', '', 1, 2350, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(57, 103, 'Výsledky turnajov 2005 - 2012', 0x7679736c65646b792d7475726e616a6f762d323030352d32303132, '', '<h2><span style="color: #0000ff;">Rok 2012</span></h2>\r\n<h3><span style="color: #3366ff;">Smolenice Open</span></h3>\r\n<p>Výsledky <a href="https://sites.google.com/site/regnadgtur/results" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<h3><span style="color: #3366ff;">26.5.2012 Kuchyňa Camping Karpaty</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/20120526_174533.jpg"><img class="aligncenter" src="http://szf.sk/sites/default/files/20120526_174533.jpg" border="0" alt="" title="1.2.3." width="330" height="450" /></a></p>\r\n<p>Ako inak, za krásneho slnečného počasia sa v Kuchynskom Camp(e)ingParku uskutočnil turnaj campistov pod drobnohľadom zástupcov SZF. Hralo sa v skrátenej verzií pre začiatočníkov. Súťaž pozostávala z dvoch kôl: DiscGolf a Putting Contest.<br /> V prvom kole zbierali hráči 3 body za účasť a 3 za každého zdolaného súpera. Túto súťaž odštartovalo 16 nováčikov, ktorí pred obedom zdolali prvé štyri jamky vo vypustenej vodnej priehrade a po obedňajšej prestávke ďalšie štyri na ihrisku v lese.<br /> Druhé kolo, odohrali priamo v areáli CampingParku Karpaty. V tomto prípade sa udeľovali 2 body za každého porazeného hráča. Tu sme sa zapojili aj my, skúsenejší hráči (Sisa, Čirsson, KAShO).<br /> Výhru, 50€ poukážku v známej Bratislavskej reštaurácii, si odniesol Peter Červenka, ktorý sa predral k prvenstvu až v druhom kole a to až z piatej priečky. Musíme však spomenúť aj výkon najlepšieho Slováka v kategórií KID (do 6 rokov), ktorý sa držal po prvom kole, medzi dospelými, na neuveriteľnej druhej priečke.<br /> Nižšie nájdete výsledkovú tabulu. Zoznam je písaný v poradí po prvom kole, pokračuje skóre prvé štyri jamky, druhé štyri jamky, body za prvé kolo, body za Putting Contest, body spolu a konečné poradie. Prípadné chyby v tabuľke majú svoje opodstatnenie a nebudeme sa k ním vyjadrovať :)</p>\r\n<h2><span style="color: #0000ff;">Rok 2012</span></h2>\r\n<h3><span style="color: #3366ff;">Smolenice Open</span></h3>\r\n<p>Výsledky <a href="https://sites.google.com/site/regnadgtur/results" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<h3><span style="color: #3366ff;">26.5.2012 Kuchyňa Camping Karpaty</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/20120526_174533.jpg"><img class="aligncenter" src="http://szf.sk/sites/default/files/20120526_174533.jpg" border="0" alt="" title="1.2.3." width="330" height="450" /></a></p>\r\n<p>Ako inak, za krásneho slnečného počasia sa v Kuchynskom Camp(e)ingParku uskutočnil turnaj campistov pod drobnohľadom zástupcov SZF. Hralo sa v skrátenej verzií pre začiatočníkov. Súťaž pozostávala z dvoch kôl: DiscGolf a Putting Contest.<br /> V prvom kole zbierali hráči 3 body za účasť a 3 za každého zdolaného súpera. Túto súťaž odštartovalo 16 nováčikov, ktorí pred obedom zdolali prvé štyri jamky vo vypustenej vodnej priehrade a po obedňajšej prestávke ďalšie štyri na ihrisku v lese.<br /> Druhé kolo, odohrali priamo v areáli CampingParku Karpaty. V tomto prípade sa udeľovali 2 body za každého porazeného hráča. Tu sme sa zapojili aj my, skúsenejší hráči (Sisa, Čirsson, KAShO).<br /> Výhru, 50€ poukážku v známej Bratislavskej reštaurácii, si odniesol Peter Červenka, ktorý sa predral k prvenstvu až v druhom kole a to až z piatej priečky. Musíme však spomenúť aj výkon najlepšieho Slováka v kategórií KID (do 6 rokov), ktorý sa držal po prvom kole, medzi dospelými, na neuveriteľnej druhej priečke.<br /> Nižšie nájdete výsledkovú tabulu. Zoznam je písaný v poradí po prvom kole, pokračuje skóre prvé štyri jamky, druhé štyri jamky, body za prvé kolo, body za Putting Contest, body spolu a konečné poradie. Prípadné chyby v tabuľke majú svoje opodstatnenie a nebudeme sa k ním vyjadrovať :)</p>\r\n<h3><span style="color: #3366ff;">(Re)Prezentačný Hlohovecký Pohár 6.5.2012</span></h3>\r\n<p>Tento rok sa nám podarilo zorganizovať aj nultý ročník Hlohoveckého poháru v zámockom parku v Hlohovci. Tento turnaj organizovala organizácia saf za výdatnej podpori Martina Chalányho. Martin pritiahol aj nováčikov, ktorí sa zlepšovali každým kolom. Taktiež prišlo jedno plné auto z Čiech, pričom dvaja z nich si zobrali domov aj víťazné poháre. Celkovo nás bolo 21 hráčov.</p>\r\n<p>Po prvom kole sme mali troch prvých hráčov s rovnakým počtom hodov, podotýkam, že medzi nimi bola aj naša najlepšia hráčka na Slovensku Katka Boďová. Najlepšie odohrané kolo tohto 9 - jamkového ihriska mal Přemysl Novák s 25 hodmi. Nestačilo to však na víťaza Martina Kričku "Čirssona".</p>\r\n<p>Do finále sa dostali z mužov v tomto poradí: Martin Krička, Přemysl Novák, Richard Kollár, Lukáš Grožaj a Kryštof Novák. Prví dvaja si svoje miesta aj obhájili až na to, že si Přemek delil druhé miesto so svojim bratom Kryštofom Novákom, ktorému vyšlo finále a prebojoval sa cez Riša a Lukáša.</p>\r\n<p>Čo sa týka žien, poradie pred finále bolo nasledovné: Katka Boďová, Denisa Javorská a Bea Hergelová. Katka mala výrazný náskok, ale medzi Deniskou a Beou bol rozdiel iba dva hody, ale Deniska si svoje druhé miesto vo finále udržala.</p>\r\n<p>Vďaka patrí všetkým zúčastneným a mestu Hlohovec za umožnenie vzniku tohto turnaja.</p>\r\n<p>Výsledky <a href="https://sites.google.com/site/regnadgtur/results" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<h3><span style="color: #3366ff;">Budmerice Spring Fling 2012</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/20120422_143908.jpg"><img class="aligncenter" src="http://szf.sk/sites/default/files/20120422_143908.jpg" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>Sme radi, že aj tento rok sme dokázali usporiadať v poradí už šiesty<br /> ročník Budmerického discgolfu. Myslím, že tentokrát to organizačne<br /> vyšlo nad očakávania, k čomu prispelo aj objavenie solídnej<br /> reštaurácie, v ktorej sa dalo dobre najesť a večer príjemne posedieť.</p>\r\n<p>Počasie vyšlo opät fantasticky, najlepšie si ho vychutnal víťaz<br /> moravák Lukáš Jedlička, ktorý si takmer od začiatku zvyšoval svoj<br /> nádskok, takže pred finále už bolo o víťazovi rozhodnuté. Zaujímavý<br /> bol boj o druhé miesto, kde Čirsson bojoval s Berndom Kolomanzom až do poslednej<br /> finálovej jamky a kedže sa nerozhodlo ani v následnom rozstrele, prišla<br /> na rad CTP, ciže kto hodí jedným hodom najbližšie k určenému cielu.<br /> Bernd hodil bližšie k cielu a umiestnil sa na druhom mieste so 17 hodovou stratou na<br /> víťaza. O štvrté a piate miesto bojovali KAShO s Rišom a bol to veru<br /> napínavý boj. Vo finále sa poradie menilo takmer po každej jamke.<br /> Nakoniec bol KAShO o jeden putt lepší. Medzi ženami opät dominovala</p>\r\n<p>rakúšanka Irmgard Derschmidt pred krajankou Magdou Kiss a najlepšou slovenkou Sisou.<br /> Vďaka patrí všetkým zúčastneným, ale najmä Ministerstvu kultúry SR za<br /> vyhovenie žiadosti o usporiadanie tohto nádherného discgolfového<br /> víkendu.</p>\r\n<p>Výsledky <a href="https://sites.google.com/site/regnadgtur/results" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<h2><span style="color: #0000ff;">Rok 2011</span></h2>\r\n<h3><span style="color: #3366ff;">Makov Open 2011</span></h3>\r\n<p>Posledný tohtoročný turnaj pozostával z dvoch dní, ktoré sa od seba<br /> líšili hlavne v počasí. V sobotu sme museli čakať až do 10.30 na<br /> rozplynutie hmly, ale aj tak prvé skupiny museli hádzať na "slepo".<br /> Po pol hodine keď hmla ustúpila a vietor naopak zosilnel nastala pre hráčov skutočná skúška z toho, ako poznajú svoje<br /> disky. V nedeľu bolo na programe tretie kolo, ale vzhľadom k<br /> prekrásnemu jesennému počasiu sme sa všetci zhodli, že namiesto finále si radšej zahráme všetci štvrté kolo. Špecialitou v tomto kole bola skupina Dobrev family, ktorej patrí veľký obdiv a naše želanie, aby to nebolo naposledy. Ďakujeme zúčastneným hráčom z Moravy, Poľska a Bratislavy (špeciálne Vladkovi, pre ktorého to bol vôbec prvý turnaj) a veríme, že nás bude budúci rok ešte viac. Na záver by som rád poďakoval organizátorom SKI Apartmány Makov, ktorí tomuto turnaju vytvorili nádherné podmienky.</p>\r\n<p>Prvé oficiálne ženské Hole in one na turnaji zaznamenala Dendža na jamke č.6 (v hustom lese asi 40m) a také pravé, naše klubové: Tong Cing!!!</p>\r\n<p>Výsledky:<br /> Open<br /> Lukáš Jedlička 137<br /> Martin Krička 143<br /> Štefan Dobrev 148<br /> Martin Olšina 157<br /> Lukáš Grožaj 159</p>\r\n<p>Women :<br /> Silvia Grožajová 198<br /> Denisa Javorská 205<br /> Marcela Pongracova 236</p>\r\n<p>Junior ( 2 kola) :</p>\r\n<p>Hugo Krička 136<br /> Mária Dobrev 172<br /> Andrej Dobrev 177</p>\r\n<p>Kompletné výsledky nájdete <a href="https://sites.google.com/site/regnadgtur/results">tu</a>.</p>\r\n<h3><span style="color: #3366ff;">Majstrovstvá Slovenska Kuchyňa 2011</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/msr_kuchyna.jpg"><img class="aligncenter" src="http://szf.sk/sites/default/files/msr_kuchyna.jpg" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>V sobotu 8.10. sa na 9-jamkovom ihrisku v Kuchyni konali Majstrovstvá Slovenska v discgolfe. V kategórii mužov zvíťazil Richard Kollár, v kategórii žien Monika Selecká, medzi juniromi zvíťazil poliak Piotr Holda. V puttingu zvíťazil Lukáš Kasho Grožaj a poľská hráčka Alicja Zieba.<br /> Discgolfovú sezónu ukončí turnaj v Makove 15.-16.10.</p>\r\n<p>Kompletné výsledky aj so štatistikami nájdete na <a href="https://sites.google.com/site/regnadgtur/results" target="_blank">samostatnej stránke majstrovstiev</a>.</p>\r\n<p><strong>Výsledky MSR v puttingu</strong></p>\r\n<p><strong><span style="color: green;">Kategória OPEN</span></strong></p>\r\n<ol>\r\n<li>Lukáš Kasho Grožaj</li>\r\n<li>Adrián Németh</li>\r\n<li>Matej Kumo Kumorovitz</li>\r\n<li>Richard Kollár</li>\r\n<li>Martin Čirsson Krička<br /> Miloš Čáp</li>\r\n</ol>\r\n<p><strong><span style="color: green;">Kategória WOMEN</span></strong></p>\r\n<ol>\r\n<li>Alicja Zieba</li>\r\n<li>Sisa Grožajová</li>\r\n<li>Denisa Javorská</li>\r\n</ol>\r\n<h3><span style="color: #3366ff;">Kuchyna Camp 2011</span></h3>\r\n<p style="text-align: center;"><a href="http://www.szf.sk/sites/default/files/group%20foto.jpg"><img class="aligncenter" src="http://www.szf.sk/sites/default/files/group%20foto.jpg" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>Dňa 6.8.2011 sa za krásneho počasia uskutočnil Camp v Campingparku Karpaty (Kuchyňa).<br /> Stretlo sa tam zopár nadšencov frisbee a zopár kempistov z bratislavského klubu. Na zatiaľ 7 jamkovom pevnom ihrisku sme Camp zahájili súťažov dvojíc (Doubles - best disc), ktorú hralo 7 párov, zvíťazila dvojica Monika/Čirsson a na krk im dýchala dvojica Sisa/Marek, bohužial neviem s akým skóre niekde som stratil skorkarty. Pokračovali sme individuálnou súťažou (dve kolá za sebou). Tu sa podarilo vyhrať Mišovi Marčanovi (skóre 19+21, 40), tesne za ním Čirsson (21+20, 41), Miloš (24+21, 45) a v ženskej kategórií Sisa (23+25, 48)- mimochodom rovnako ako ja KAShO, čo znamená veľký pokrok v ženskom discgolfe na Slovensku :) Ďalej mal nasledovať Birdie hunt, ale vzhľadom na vyčerpanosť sme zvolili rýchlejšiu súťaž a to Speed DG, tam išlo o to prejísť celé ihrisko v čo najkratšom čase bez ohľadu na skóre. Štartovalo sa priamo v kempe pred recepciou, tam bol aj cieľ. Prvý sa dostal na trať Mišo a pokračovali Čirsson, ja a majiteľ kempu Peťo Kučera. V cieli sme videli prvého Čirssona s časom 7:05, nasledovali - ja 8:01, Peťo 8:27 a s problémovým kolenom Mišo 10:27.</p>\r\n<p style="text-align: center;"><a href="http://www.szf.sk/sites/default/files/Krst.jpg"><img class="aligncenter" src="http://www.szf.sk/sites/default/files/Krst.jpg" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>Podvečer sme poopekali dobré pstruhy, špekáčky, mäsko, popili sme dobre vychladené pifko a po zotmení pri umelom osvetlení, odštartovali Putting Contest. Hrali sa dve disciplíny, prvá bola klasický Putting Contest, na tri pokusy sa dostať čo najďalej od koša. Zučastnilo sa pomerne veľa hráčov, skoro všetci, čo boli v kempe (cca 25), tu som zvíťazil ja, nebola to žiadna dráma, pretože som išiel posledný asi na šiestej vzdialenosti a predomňou nikto nedal. Zato druhá súťaž bola oveľa napínavejšia, hráč musel prejsť šest rôznych vzdialeností na čo najmenej pokusov, vždy keď premenil posúval sa o priečku vyššie a každý mal nato 20 hodov. Najprv išli campisti z bratislavského klubu, keď tu zrazu pán s klobúkom na hlave všetkých prekvapil a podarilo sa mu to na perfektných 7 hodov. "Profesionáli" začali mať obavy, že nasadil latku príliš vysoko, keď Mišovi, Čirssonovi a dokonca ani Sise, ktorá sa dostala až na 6 métu bez zaváhania, nepodarilo dosiahnuť rekordných 7. Potom som prišiel ja a vyzeralo to biedne, keďže som pochybil už na 3 méte, ale napokon sa to podarilo na 7, prišiel rozstrel a tam sa ukázali skúsenosti zadarilo sa mi na 11, súperovi na 15, tak mi na konto pribudlo aj druhé víťaztvo.</p>\r\n<p>Ďakujem všetkým zúčastneným, že vytvorili perfektnú atmosféru a športovali v plnom nasadení.</p>\r\n<h3><span style="color: #3366ff;">Smolenice Open 2011</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/smolenice.png"><img class="aligncenter" src="http://szf.sk/sites/default/files/smolenice.png" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>Výsledky <a href="https://sites.google.com/site/regnadgtur/results/smolenie-201" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<p>Cez víkend 11-12. júna sa uskutočnil v Somleniciach ďalší ročník už tradičného turnaja. Ihrisko si vyslúžilo veľkú pochvalu od zahraničných aj domácich účastníkov - ako svoju malebnosťou, tak aj nárčnosťou, vďaka čomu sa radí do Európskej špičky.<br /> V nádhernom slnečnom počasí sa pod smolenickým zámkom od soboty odohrávali napäté súboje či už s premenlivým vetríkom,<br /> alebo s náročným terénom a prírodnými prekážkami.<br /> Mnohé jamky štartovali z úzkych turistických chodníkov v priľahlých lesíkoch a cieľový kôš bol umiestnený v diaľke na rozľahlých lúkach za rôznymi prekážkami, v zákrute za kríkmi, či medzi stromami.<br /> Pre divákov najefektnejší kôš sa však nachádzal postavený na protiľahlom svahu pod ktorým sa vábivo ligotalo male jazierko a znamenal pre<br /> mnohých zvýšený tep a napätie, pretože nejeden disk svišťal vzduchom ponad jazierko, ale nepreletel až na druhý breh a žblnkol do vody.<br /> Takže počas prestávky, poniektorí účastníci zhodili šaty a pokúšali sa vyloviť svoje náčinie, čo ich určite v panujúcej horúčave aspoň prijemne osviežilo.</p>\r\n<p>Nedeľa sa niesla v znamení nepríjemných prekvapení.<br /> Najprv organizátorom zmizol úsmev z tvárí, keď zistili, že im niekto cez noc z areálu ukradol jeden z osemnástich košov a na aute v ktorom prišli hráči z Maďarska vyfučali pravú zadnú pneumatiku.<br /> Úsmev sa im potom vrátil, vďaka esu (na tomto podujatí historicky prvému), ktoré sa podarilo dosiahnuť rakúskemu diskgolfistovi Berndovi Kolmanzovi na desiatej jamke dlhej viac ako 50m. Tento úžasný moment, keď hráč zasiahne kôš na prvý pokus, tzv. "hole-in-one" potvrdil vysokú kvalitu účastníkov, medzi ktorými bola takmer cela slovenska špička, plus silné zastúpenie z Čiech, Rakúska a Maďarska. Ďakujme všetkým za účasť a za vyzbieranie finančného príspevku na ukradnutý kôš, ktorý sme mali zapožičaný od Petra Kučeru, ktorý nám ho požičal z jeho pevného ihriska v Kuchyni.</p>\r\n<h3><span style="color: #3366ff;">Budmerice Spring Fling 2011</span></h3>\r\n<p style="text-align: center;"><a href="http://szf.sk/sites/default/files/grupovka.jpg"><img class="aligncenter" src="http://szf.sk/sites/default/files/grupovka.jpg" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>V dňoch 16-17 apríla sa za krásneho slnečného počasia uskutočnil discgolfový turnaj v okolí Budmerického zámku. Rekordná účasť 33 discgolfistov, aj keď nie všetci odohrali plný počet kôl, pretože boli pracovne vyťažení, si našli čas a prišli si užiť tento romantický discgolfový zážitok. Nalepšie kolo zahral Stefan Dobrev 6 pod PAR, PAR je na tomto ihrisku 38. Vysledky: <a href="https://sites.google.com/site/regnadgtur/results/budmerice-spring-fling-2011" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<h2><span style="color: #0000ff;">Rok 2010</span></h2>\r\n<h3><span style="color: #3366ff;">Majstrovstvá Slovenskej Republiky 2010</span></h3>\r\n<p style="text-align: center;"><a href="http://www.szf.sk/sites/default/files/M%20SR2010%20%2839%29.JPG"><img class="aligncenter" src="http://www.szf.sk/sites/default/files/M%20SR2010%20%2839%29.JPG" border="0" alt="" title="Všetci" width="500" height="330" /></a></p>\r\n<p>Dňa 16.10.2010 sa konali Majstrovstvá SR v Disgolfe.</p>\r\n<p style="text-align: left;">Tu sú dlho očakávané<a href="http://www.szf.sk/node/356" target="_blank" title="výsledky"> výsledky</a>.</p>\r\n<p style="text-align: left;">Nejaké fotečky<a href="http://picasaweb.google.com/kasho30/MajstrovstvaSRVDiscgolfe" target="_blank" title="FOTKY"> TU</a>!</p>\r\n<p style="text-align: left;">Podrobné výsledky<a href="https://sites.google.com/site/vysledkymsrdg2010/" target="_blank" title="podrobné"> TU</a>.</p>\r\n<h3><span style="color: #3366ff;">Smolenice 2010</span></h3>\r\n<p>Výsledky zo Smoleníc nájdete <a href="http://www.ifi.savba.sk/%7Estefan/discgolf/Smolenice10/Smolenice10Results.htm" target="_blank" title="výsledky">TU</a></p>\r\n<p>Fotečky zo Smoleníc 2010, ktoré nám poslal <a href="http://picasaweb.google.com/Pedosaur/Smolenice" title="Predrag photos">Predrag</a></p>\r\n<h3><span style="color: #3366ff;">Budmerce Spring Fling 2010</span></h3>\r\n<p>Aj 4. rocník tohoto turnaju prilákal do záhrady Budmerického kaštiela nadšencov discgolfu zo všetkých susediacich krajín plus dvoch reprezentantov z Chorvátska. Ked to na prvej jamke v prvom kole zarval do najbližšieho stromu a následne dokoncil jamku s bogey, nik netušil, že si nakoniec vo finále udrží s prehladom nádskok a ešte si aj svojich zúfale sa snažiacich protihrácov , stihne na poslednej jamke pofotit. Tak zdravo drzí a dobrý je vítaz prvého z dvoch tohtorocných discgolfových turnajov v SR Chorche Turan. Gratulujeme !!!</p>\r\n<p>Vysledky: <a href="http://www.ifi.savba.sk/%7Estefan/discgolf/Budmerice10/Budmerice2010Results.htm" target="_blank" title="výsledky">TU/HERE</a></p>\r\n<p>Fotky: <a href="http://szf.sk/fast_gallery/Disc_golf_galerie/2010_Budmerice" target="_blank">TU/HERE</a> &amp; <a href="http://picasaweb.google.com/116019228480629550558/DiscGolfBudmerice201002" target="_blank">TU/HERE</a></p>\r\n<h2><span style="color: #0000ff;">Rok 2009</span></h2>\r\n<h3><span style="color: #3366ff;">Czech Open 2009</span></h3>\r\n<p>Finálny turnaj Centrálnej Európskej ligy sa odohral v Prahe na Vipich parku. Výsledky:<a href="http://www.kiahgrabn.com/datenbank/index.php?TID%5B%5D=108&amp;PID%5B%5D=0" target="_blank">Tu<code>/</code>Here</a></p>\r\n<p>Celkové výsledky prvého ročníka CEL 2009: <a href="http://www.kiahgrabn.com/datenbank/cet.php" target="_blank">Tu<code>/</code>Here</a></p>\r\n<h3><span style="color: #3366ff;">H!Open 2009</span></h3>\r\n<p>Tretí turnaj v rámci CEL s názvom H!Open 2009 sa uskutočnil v Naturparku Lieser Berge v dolnom Rakúsku. Počasie bolo aj tentokrát priaznivé, ihrisko sa nachádza na kopci takže sa bolo treba vysporiadať s velmi silným vetrom. Dobrou správou je, že 5. decembra sa toto ihrisko spočívajúce s 18 jamiek (pevne zabudovaných košov) bude oficiálne otvárať a kedže je to iba 130 km od Bratislavy tak si určite radi v budúcom roku nájdeme čas na poriadny tréning.</p>\r\n<p>Výsledky: <a href="http://www.kiahgrabn.com/datenbank/index.php?TID=104">Tu<code>/</code>Here</a><br /> Priebežné výsledky CEL 2009: <a href="http://www.kiahgrabn.com/datenbank/cet.php">Tu<code>/</code>Here</a></p>\r\n<h3><span style="color: #3366ff;">CEL Smolenice 2009</span></h3>\r\n<p><a href="http://www.szf.sk/sites/default/files/smolenice2009%20%28Small%29.JPG"><img class="alignnone" src="http://www.szf.sk/sites/default/files/smolenice2009%20%28Small%29.JPG" border="0" alt="" title="Smolenice 2009" width="320" height="240" /></a></p>\r\n<p>Rekord v počte zúčastnených z jarného turnaju v Budmericiach sa nám podľa očakávania podarilo prekonať, do Smoleníc totiž prišlo až 45 hráčov na v poradí druhý turnaj Centrálnej Európskej ligy. Park v okolí Smolenického zámku ktorý nám aj tento rok Slovenská akadémia vied ponúkla (za čo jej touto cestou veľmi pekne Ďakujeme), si pre nás pripravil vynikajúce počasie. Od prvého kola si ihrisko v pohode užíval Daniel Hatvani (HU) ktorý aj vo finále dominoval a nakoniec s osem-hodovým nádskokom dokrácal k svojmu prvému turnajovému výťazstvu mimo Madarska. Mezdi ženami si ustrážila nádskok Irmgard Derschmidt (AUT). Za zmienku stoja aj dvaja Grandmasters, Gabriele Gould (AUT) a József Senior Jesztl (HU), krorý poctivo absolvovali všetky tri kolá tohoto nárocného ale za to prekrásneho ihriska.</p>\r\n<p>Trošku nás mrzí celkovo velmi nízka účasť Slovenských discgolfistov, preto dúfame, že sa nám v čo najkatšej dobe podarí konečne doriešiť ihrisko s pevne zabudovanými košmi, aby nás na nom mohlo trénovať čoraz viac, pretože liga sa nekončí, naopak pokračuje, presnejšie po prázdninách 5-6. septembra v Rakúskom Buschbergu a 26-27 septembra vyvrcholí v Prahe.</p>\r\n<p>Výsledky CET Smolenice Slovak open 2009: <a href="http://www.kiahgrabn.com/datenbank/index.php?TID%5B%5D=107&amp;PID%5B%5D=0alebo%20http://www.ifi.savba.sk/%7Estefan/discgolf/Smolenice09/Results-Smolenice09.htm">Tu<code>/</code>Here</a></p>\r\n<h3><span style="color: #3366ff;">2009 Budmerice Spring Fling, April 3-4</span></h3>\r\n<p>V rekordnom počte 25 hráčov (10 z Rakúska, 9 zo Slovenska, troch z Madarska, dvoch z Chorvátska a jedného Čecha) sa konal v okolitej záhrade kaštiela v Budmericiach, už v poradí tretí discgolfový turnaj pod krídlami Literárneho Fondu za ktorého podporu sa jeho vedeniu ako aj ostatným pracovníkom chceme touto cestou veľmi pekne poďakovať. Počasie nám aj tento rok pripravilo prekrásny víkend, tentokrát sme hrali 6 kôl po 12 jamiek, pričom sa poradie takmer po každom kole neustále menilo, čo nepochybne prispelo k dramaticnosti turnaja. Víťazom sa nakoniec stal Stefan Dobrev s trojhodovým vedením pred druhým Martinom Kričkom, ktorý sa neubránil vo finále pred výborne hrajúcim Jurajom Turanom a Laszlom Bakom s ktorými sa musel nakoniec o túto druhú priečku podeliť. Medzi ženami dominovala Susanne Giendl, ktorá nedala svojim súperkám prakticky žiadnu šancu a zvítazila s nádskokom 23 hodov. V kategórií juniorov sa po prvý krát okrem Šimona Valkovica predstavil aj Andrián Németh a ukázal že to myslí docela vážne! Držíme obidvom palce a dúfame že to na seba v Smoleniciach poriadne rozbalia :)</p>\r\n<p>Na záver ešte raz vďaka všetkým, ktorý prispeli k tomuto fantastickému discgolfovému turnaju!</p>\r\n<p>Žial ani z tohto turnaja nemám kompletné výsledky mal by ich mať Stefan Dobrev.</p>\r\n<h2><span style="color: #0000ff;">Rok 2008</span></h2>\r\n<h3><span style="color: #3366ff;">Smolenice Open 2008</span></h3>\r\n<p><a href="http://www.szf.sk/sites/default/files/smolenice2008%20%28Small%29.jpg"><img class="alignnone" src="http://www.szf.sk/sites/default/files/smolenice2008%20%28Small%29.jpg" border="0" alt="" title="Smolenice 2008" width="324" height="480" /></a></p>\r\n<p>The third year of our main discgolf tournament in Slovakia was held at the picturesque setting of the park near Chateau Smolenice, near village of Smolenice, about 1 hour drive north-east from Bratislava. We would like to thank ing. Karol Volner from the Chateau Smolenice for kindly allowing us to organize the tournament in this wonderful location.</p>\r\n<p>This year the tournament was moved from the park of Chateau Rusovce to Smolenice, and while the drive is now longer for most of us, we feel the move was extremely beneficial. The setting is truly beautiful, and allows to design a truly top-quality discgolf course.</p>\r\n<p>The attendance exceeded our wildest expectations, and at 26 players this was the largest discgolf tournament ever held in Slovakia. We had 6 players from Slovakia, 6 from Czech republic (all the top players from both countries attended), 8 from Austria, 4 from Hungary and 1 each from New Zealand and USA (although both are starting to be naturalized in Hungary/Slovakia, thanks to the very fine ladies here. :-). This included 2 ladies and a junior.</p>\r\n<p>We ordered an iffy weather for Saturday, with clouds and wind but not rain, in order to discourage the park visitors, so we can be free to play. This backfired somewhat, as we had some rain showers, including two that were somewhat wetter. We apologize for that and will try to do better next time. Sunday was a perfect discgolf weather, though. Sunny and not too hot, with only a light wind.</p>\r\n<p>We played two rounds on Saturday and as the course is really long (over 2400m) it proved to be a truly exhausting affair. With somewhat late start of the first round around 10:30 we finished the second round only around 19:30. After the first round we played in 3-somes and that helped to speed up the play. Despite reused baskets (many thanks to Dylan Cooper and Martin Slizek for bringing additional baskets) and some overlapping holes, the flow was good without much waiting for other groups.</p>\r\n<p>Dylan Cooper from New Zealand/Hungary took the early lead and with consistently solid play never relinquished it. However, the fight for 2-5th place was tight and interesting. At the end, the top 4 places featured players from 4 countries (New Zealand, Hungary, Czech Republic and Slovakia). Yes, this is a thinly veiled hint to our friends in Austria to send their best players next time. ;-)</p>\r\n<p>The tournament results can be seen</p>\r\n<p><img class="alignnone" src="http://www.szf.sk/sites/default/files/smol.vysledky2008.jpg" border="0" alt="" title="Smolenice 2008" width="649" height="556" /></p>\r\n<h3><span style="color: #3366ff;">Budmerice Spring Fling 2008</span></h3>\r\n<p>Aj tohoto roku nám prialo pocasie a tak sa aj druhý rocník medzinárodného discgolfového turnaju konajúceho sa v rozkvitnutej záhrade Budmerického kaštiela konal vo velkej pohode a dobrej nálade. Vdaka všetkým, ktorí pomohli tento parádny víkend uskutotcnit.<br /> Neviem nájisť výsledky k tomuto turnaju, preto tu niesu.</p>\r\n<p><a href="http://picasaweb.google.cz/chorche/BudmericeDiscGolfOpen" target="_blank">More pictures&gt;&gt;</a></p>\r\n<h2><span style="color: #0000ff;">Rok 2007</span></h2>\r\n<h3><span style="color: #3366ff;">Gerulata Discus Romanus Open 2007</span></h3>\r\n<p>Druhý ročník discgolfového turnaja na našom území sa konal v pekne pokosenom parku kaštiela v Rusovciach za čo patrí vďaka kompetentným v tejto mestkej časti Bratislavi. Dúfajme, že sa v budúcnosti zlepší aj čistota.</p>\r\n<p><img class="alignnone" src="http://www.szf.sk/sites/default/files/gerulata2007.jpg" border="0" alt="" title="Rusovce" width="543" height="341" /></p>\r\n<h3><span style="color: #3366ff;">Nováčikovský turnaj na Sandbergu<br /> </span></h3>\r\n<p>V utorok 8.5. sa konal v Devínskej novej Vsi na Sandbergu nováčikovsky discgolfový turnaj v kategorii zmiešaných dvojíc.</p>\r\n<p><a href="http://www.szf.sk/sites/default/files/sandberg2007%20%28Small%29.jpg"><img class="alignnone" src="http://www.szf.sk/sites/default/files/sandberg2007%20%28Small%29.jpg" border="0" alt="" title="Sandberg 2007" width="640" height="480" /></a></p>\r\n<p><img class="alignnone" src="http://www.szf.sk/sites/default/files/2.jpg" border="0" alt="" title="Dvojice" width="480" height="200" /></p>\r\n<h3><span style="color: #3366ff;">Budmerice Spring Fling 2007<br /> </span></h3>\r\n<p><a href="http://www.szf.sk/sites/default/files/budmerice2007%20%28Small%29.JPG"><img class="alignnone" src="http://www.szf.sk/sites/default/files/budmerice2007%20%28Small%29.JPG" border="0" alt="" title="Budmerice 2007" width="360" height="480" /></a></p>\r\n<p>Spravili sme si turnajík aj v krásnom parku okolo kaštiela v Budmericiach.</p>\r\n<h4><img class="alignnone" src="http://www.szf.sk/sites/default/files/2007budmericewomen.jpg" border="0" alt="" title="ženy" width="480" height="173" /></h4>\r\n<p><img class="alignnone" src="http://www.szf.sk/sites/default/files/2007budmericemen.jpg" border="0" alt="" title="Muži" width="480" height="554" /></p>\r\n<h3><span style="color: #3366ff;">Czech Open 2007</span></h3>\r\n<p>Úspesna výprava slovenských discgolfistov na majstrovstvách Českej ligy! Výsledky na: <a href="http://www.discgolf.cz/" target="_blank">www.discgolf.cz</a></p>\r\n<h2><span style="color: #0000ff;">Rok 2006</span></h2>\r\n<h3><span style="color: #3366ff;">First discgolf tournament in SR 2006</span></h3>\r\n<p>Historický prvý medzinárodný discolfový turnaj na Slovensku <strong>Gerulata Discus Romanus Open 2006 Part I.</strong> sa uskutoční <strong>22.-23.7 2006</strong> v parku kaštiela mestkej časti Bratislava Rusovce. Srdečne všetkých pozývame, o zábavu sa postaráme.</p>\r\n<p><a href="http://www.szf.sk/sites/default/files/1turnaj2006%20%28Small%29.JPG"><img class="alignnone" src="http://www.szf.sk/sites/default/files/1turnaj2006%20%28Small%29.JPG" border="0" alt="" title="Gerulata 2006" width="640" height="432" /></a></p>\r\n<p><img class="alignnone" src="http://www.szf.sk/sites/default/files/gerulata2006-1.jpg" border="0" alt="" title="Gerulata 2006" width="348" height="414" /></p>', '', 1, 0, 0, 2, '2013-04-18 10:33:21', 43, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-04-18 10:33:21', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 2449, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `b0e2j_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES (58, 104, 'Budmerice Spring Fling 2013', 0x6275646d65726963652d737072696e672d666c696e672d32303133, '', '<p>Ďakujeme všetkým za účasť na 7. ročníku Disc Golfového turnaja kategórie A Budmerice Spring Fling 2013.</p>\r\n<p>Tešíme sa na najbližší turnaj - Hlohovecký pohár, sobota 18. máj. 2013.</p>\r\n<p>Pozrite si <a href="https://sites.google.com/site/regnadgtur/results" target="_blank">výsledky</a> turnaja.</p>\r\n<p> </p>\r\n<p> </p>', '', 1, 0, 0, 18, '2013-05-05 19:17:44', 43, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-05-05 19:17:44', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 1373, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_content_frontpage`
-- 

CREATE TABLE `b0e2j_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_content_frontpage`
-- 

INSERT INTO `b0e2j_content_frontpage` (`content_id`, `ordering`) VALUES (1, 5),
(3, 4),
(9, 3),
(14, 2),
(35, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_content_rating`
-- 

CREATE TABLE `b0e2j_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(10) unsigned NOT NULL default '0',
  `rating_count` int(10) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_content_rating`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_core_log_searches`
-- 

CREATE TABLE `b0e2j_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_core_log_searches`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_extensions`
-- 

CREATE TABLE `b0e2j_extensions` (
  `extension_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL default '1',
  `access` int(10) unsigned default NULL,
  `protected` tinyint(3) NOT NULL default '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) default '0',
  `state` int(11) default '0',
  PRIMARY KEY  (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10045 DEFAULT CHARSET=utf8 AUTO_INCREMENT=10045 ;

-- 
-- Dumping data for table `b0e2j_extensions`
-- 

INSERT INTO `b0e2j_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES (1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"0","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"0","targeta":0,"targetb":0,"targetc":0,"float_intro":"right","float_fulltext":"right","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"0","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"0","show_cat_num_articles_cat":"0","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"none"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2012","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.2","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"2","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"applet","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0);
INSERT INTO `b0e2j_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES (433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"June 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.6","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'mod_xpertscroller', 'module', 'mod_xpertscroller', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_xpertscroller","type":"module","creationDate":"April 2011","author":"ThemeXpert","copyright":"Copyright (C) 20010 - 2011 ThemeXpert. All rights reserved.","authorEmail":"support@themexpert.com","authorUrl":"www.themexpert.com","version":"2.2","description":"XS_DESC","group":""}', '{"catid":"","count":"5","ordering":"published","user_id":"0","show_featured":"","scroller_layout":"basic_h","module_width":"400","module_height":"200","col_amount":"5","image_position":"top","control_margin":"40px 10px","animation_style":"animation_h","animation_speed":"1000","repeat":"1","keyboard_navigation":"1","auto_play":"0","interval":"1000","auto_pause":"1","article_title":"1","title_link":"0","item_image":"1","image_link":"1","browser_nav":"","intro_text":"0","intro_text_limit":"100","image_resize":"1","image_width":"150","image_height":"150","moduleclass_sfx":"","auto_module_id":"1","module_unique_id":"xs_1","load_jquery":"1","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 'Expose Templaet Framework for Joomla1.6', 'library', 'lib_expose', '', 0, 1, 1, 0, '{"legacy":false,"name":"Expose Templaet Framework for Joomla1.6","type":"library","creationDate":"Mar 03, 2011","author":"ThemeXpert","copyright":"Copyright (C) 2010 - 2011 ThemeXpert","authorEmail":"","authorUrl":"http:\\/\\/themexpert.com\\/","version":"2.0","description":"Expose is a flexible and powerful rapid development theme framework for joomla1.5 and 1.6 with a very small footprint provides an extensible environment for developing, maintaining, and deploying high quality themes. Choosing Expose allows you to release your themes earlier, host and scale them without problem, and maintain them over time with no hassle.\\nExpose is based on experience. It does not reinvent the wheel: it uses most of the best practices of web development and integrates nicely with joomla framework with some great third-party libraries.\\n    ","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'Xpert Captions', 'module', 'mod_xpertcaptions', '', 0, 1, 0, 0, '{"legacy":false,"name":"Xpert Captions","type":"module","creationDate":"Jul 2011","author":"ThemeXpert","copyright":"Copyright (C) 20010 - 2011 ThemeXpert. All rights reserved.","authorEmail":"support@themexpert.com","authorUrl":"www.themexpert.com","version":"2.0","description":"Automatic generation of box and captions for Joomla and K2 articles. Brought to you by ThemeXpert","group":""}', '{"catid":"","count":"3","ordering":"published","user_id":"0","show_featured":"","title":"1","intro":"0","intro_limit":"100","link":"1","width":"250","height":"250","animation":"xc-slide","speed":"150","opacity":"1","effect_apply":"caption","anchor":"left","anchor_position":"-100","hover_x":"0","hover_y":"0","moduleclass_sfx":"","load_jquery":"1","jquery_source":"local","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.7.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10017, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.7.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10020, 'TX_Freemium', 'template', 'tx_freemium', '', 0, 1, 1, 0, '{"legacy":false,"name":"TX_Freemium","type":"template","creationDate":"Sep 2011","author":"ThemeXpert.com","copyright":"Copyright (C) 2010 - 2011 ThemeXpert. All Rights Reserved.","authorEmail":"support@themexpert.com","authorUrl":"http:\\/\\/www.themexpert.com","version":"1.7","description":"EXPOSE_DESCRIPTION","group":""}', '{"style":"style1","background_color":"fffff","header_color":"555555","header_font_color":"555555","feature_color":"dddddd","feature_font_color":"dddddd","bottom_color":"eeeeee","bottom_font_color":"eeeeee","footer_color":"000000","footer_font_color":"000000","link_color":"30a8f4","layout_type":"1","iphone_theme":"0","android_theme":"0","template_width":"1068","sidebar-left":"30","sidebar-right":"30","roof-1":"20","roof-2":"20","roof-3":"20","roof-4":"20","roof-5":"20","header-1":"40","header-2":"60","header-3":"50","header-4":"50","header-5":"100","top-1":"20","top-2":"20","top-3":"20","top-4":"20","top-5":"20","utility-1":"40","utility-2":"30","utility-3":"30","utility-4":"100","utility-5":"100","feature-1":"20","feature-2":"20","feature-3":"20","feature-4":"20","feature-5":"20","main-top-1":"20","main-top-2":"20","main-top-3":"20","main-top-4":"20","main-top-5":"20","content-top-1":"25","content-top-2":"25","content-top-3":"25","content-top-4":"25","content-bottom-1":"25","content-bottom-2":"25","content-bottom-3":"25","content-bottom-4":"25","main-bottom-1":"20","main-bottom-2":"20","main-bottom-3":"20","main-bottom-4":"20","main-bottom-5":"20","bottom-1":"20","bottom-2":"20","bottom-3":"20","bottom-4":"20","bottom-5":"20","footer-1":"20","footer-2":"20","footer-3":"20","footer-4":"20","footer-5":"20","body_font":"none","body_selectors":"p,span","menu_font":"none","menu_selectors":".tx-menu a","heading_font":"none","heading_selectors":"h1,h3","module_font":"none","module_selectors":".header","menu_position":"header","menu_animation":"slide","menu_delay":"800","menu_speed":"normal","formats":"%A, %B %d, %Y","copyright":"1","copyright_text":"EXPOSE_DEFAULT_COPYRIGHT","scroll_top":"0","lazy_loader":"0","modernizr":"0","expose_logo":"1","expose_logo_type":"light","analytics":"0","analytics_id":"UA-xxxxxx-x","jquery_loader":"0","jquery_source":"local","jquery_version":"1.5.1","compress_css":"0","compress_js":"0","cache_time":"600","component_display":"0","rtl_enable":"0","3pd_integration":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"porter_en"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'com_tracks', 'component', 'com_tracks', '', 1, 1, 0, 0, '{"legacy":false,"name":"COM_TRACKS","type":"component","creationDate":"April 2012","author":"Julien Vonthron","copyright":"(C) 2008,2009,2010,2011,2012 Julien Vonthron. All rights reserved.","authorEmail":"julien.vonthron@gmail.com","authorUrl":"http:\\/\\/www.jlv-solutions.com","version":"1.0.7","description":"COM_TRACKS_XML_DESC","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10035, 'Content - Image gallery - sigplus', 'plugin', 'sigplus', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - Image gallery - sigplus","type":"plugin","creationDate":"Mar 13, 2012","author":"Levente Hunyadi","copyright":"\\u00a9 2009-2011 Levente Hunyadi. All rights reserved.","authorEmail":"hunyadi@gmail.com","authorUrl":"http:\\/\\/hunyadi.info.hu\\/projects\\/sigplus","version":"1.4.2.11","description":"SIGPLUS_DESCRIPTION","group":""}', '{"base_folder":"images","layout":"fixed","rows":"1","cols":"4","thumb_count":"0","thumb_width":"200","thumb_height":"200","thumb_crop":"0","alignment":"before-clear","lightbox":"boxplus\\/lightsquare","lightbox_slideshow":"0","slider":"boxplus.slider","slider_orientation":"horizontal","slider_navigation":"bottom","slider_buttons":"1","slider_links":"1","slider_counter":"1","slider_overlay":"0","slider_duration":"800","slider_animation":"0","captions":"none","caption_title":"","caption_description":"","download":"0","metadata":"0","margin":"","border_style":"","border_width":"","border_color":"","padding":"","thumb_cache":"1","thumb_folder":"thumbs","preview_folder":"preview","fullsize_folder":"fullsize","base_url":"","thumb_quality":"85","labels":"labels","labels_multilingual":"0","sort_criterion":"labels-filename","sort_order":"0","linkage":"inline","ajaxapi":"default","library":"default","activationtag":"gallery","debug":"0","settings":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'sigplus', 'module', 'mod_sigplus', '', 0, 1, 0, 0, '{"legacy":false,"name":"sigplus","type":"module","creationDate":"Mar 13, 2012","author":"Levente Hunyadi","copyright":"\\u00a9 2009-2011 Levente Hunyadi. All rights reserved.","authorEmail":"hunyadi@gmail.com","authorUrl":"http:\\/\\/hunyadi.info.hu\\/projects\\/sigplus","version":"1.4.2.11","description":"SIGPLUS_DESCRIPTION","group":""}', '{"images_folder":"images\\/sampledata\\/fruitshop","layout":"fixed","rows":"1","cols":"1","thumb_count":"0","thumb_width":"200","thumb_height":"200","thumb_crop":"0","alignment":"center","lightbox":"boxplus\\/lightsquare","lightbox_slideshow":"0","slider":"boxplus.slider","slider_orientation":"vertical","slider_navigation":"bottom","slider_buttons":"0","slider_links":"0","slider_counter":"0","slider_overlay":"1","slider_duration":"800","slider_animation":"0","download":"0","metadata":"0","margin":"","border_style":"","border_width":"","border_color":"","padding":"","thumb_cache":"1","thumb_folder":"thumbs","preview_folder":"preview","fullsize_folder":"fullsize","base_url":"","thumb_quality":"85","labels":"labels","labels_multilingual":"0","sort_criterion":"labels-filename","sort_order":"0","linkage":"inline","ajaxapi":"default","library":"default","moduleclass_sfx":"","debug":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'sigplus', 'package', 'pkg_sigplus', '', 0, 1, 1, 0, '{"legacy":false,"name":"sigplus","type":"package","creationDate":"Mar 13, 2012","author":"Levente Hunyadi","copyright":"\\u00a9 2009-2011 Levente Hunyadi. All rights reserved.","authorEmail":"","authorUrl":"http:\\/\\/hunyadi.info.hu\\/projects\\/sigplus","version":"1.4.2.11","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10038, 'Facebook FanBox', 'module', 'mod_fbfanbox', '', 0, 1, 0, 0, '{"legacy":true,"name":"Facebook FanBox","type":"module","creationDate":"July 2009","author":"Khawaib Ahmed","copyright":"Copyright (C) 2009 - Present. www.Khawaib.co.uk. All rights reserved.","authorEmail":"khawaib@khawaib.co.uk","authorUrl":"www.khawaib.co.uk","version":"1.3","description":"FANBOX_INSTALLED_SUCCESSFULLY","group":""}', '{"page_url":"","boxwidth":"250","boxheight":"550","show_faces":"1","show_stream":"1","show_header":"1","force_wall":"1","@spacer":"","connect_script_call":"1","moduleclass_sfx":"","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 'com_golfscores', 'component', 'com_golfscores', '', 1, 1, 0, 0, '{"legacy":true,"name":"com_golfscores","type":"component","creationDate":"September 2011","author":"Tony Korologos","copyright":"(C) 2011 Tony Korologos. All rights reserved.","authorEmail":"admin@tkserver.com","authorUrl":"http:\\/\\/www.tkserver.com","version":"1.6.0","description":"A Joomla! component for keeping basic golf scoring records. Integrates with JomSocial and Community Builder. JS integration adds users points for entering scores as well as entering scoring updates into the JS activity stream.  Additional free modules add more integration with JomSocial as well as Community Builder.  Visit http:\\/\\/www.tkserver.com for more information and updates!\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10040, 'Golf Scores', 'module', 'mod_golfscores_latest', '', 0, 1, 0, 0, '{"legacy":false,"name":"Golf Scores","type":"module","creationDate":"September 2011","author":"Tony Korologos","copyright":"(C) 2010-2011 www.tkserver.com","authorEmail":"admin@tkserver.com","authorUrl":"www.tkserver.com","version":"1.6","description":"Shows the latest member scores from TKServer.com''s Golf Scores 1.6 compoenent with optional links to Community Builder (CB) profiles.  CB integration requres the Community Builder component.","group":""}', '{"showname":"name","showgsmenu":"yes","CB_itemid":"","golfscores_itemid":"","@spacer":"","count":"5","cblink":"no","order":"desc","user":"Golfer","course":"Course","holes":"Holes","gross":"Gross"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 'comprofiler', 'component', 'com_comprofiler', '', 1, 1, 0, 0, '{"legacy":false,"name":"comprofiler","type":"component","creationDate":"2012-06-19","author":"Beat","copyright":"Copyright (C) 2004-2012 Joomlapolis.com. All rights reserved.","authorEmail":"beat@joomlapolis.com","authorUrl":"www.joomlapolis.com","version":"1.8.1","description":"Joomla\\/Mambo Community Builder 1.8.1 native for Joomla! 2.5.0 - 2.5.6, 1.7.0 - 1.7.3, 1.6.0 - 1.6.6, 1.5.3 - 1.5.26, 1.0.0 - 1.0.15 and Mambo 4.5.0 - 4.6.5.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 'CB Login', 'module', 'mod_cblogin', '', 0, 1, 0, 0, '{"legacy":true,"name":"CB Login","type":"module","creationDate":"2012-06-19","author":"Beat and JoomlaJoe","copyright":"(C) 2005-2012 Joomlapolis.com. This module is released under the GNU\\/GPL v2 License","authorEmail":"beat@joomlapolis.com","authorUrl":"www.joomlapolis.com","version":"1.8.1","description":"Login module to be used with Community Builder instead of the Login module.","group":""}', '{"moduleclass_sfx":"","horizontal":"0","compact":"0","pretext":"","logoutpretext":"","login":"","logout":"index.php","show_lostpass":"1","show_newaccount":"1","show_username_pass_icons":"0","name_lenght":"14","pass_lenght":"14","show_buttons_icons":"0","show_remind_register_icons":"0","login_message":"0","logout_message":"0","remember_enabled":"1","greeting":"1","name":"0","show_avatar":"0","avatar_position":"default","text_show_profile":"","text_edit_profile":"","pms_type":"0","show_pms":"0","show_connection_notifications":"0","https_post":"0","cb_plugins":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'CB Workflows', 'module', 'mod_comprofilermoderator', '', 0, 1, 0, 0, '{"legacy":true,"name":"CB Workflows","type":"module","creationDate":"2012-06-19","author":"Beat and JoomlaJoe","copyright":"(C) 2005-2012 Joomlapolis.com. This module is released under the GNU\\/GPL v2 License","authorEmail":"beat@joomlapolis.com","authorUrl":"www.joomlapolis.com","version":"1.8.1","description":"Displays Notifications of pending actions for the moderator and connections functionality of Community Builder.","group":""}', '{"moduleclass_sfx":"","pretext":"","posttext":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10044, 'CB Online', 'module', 'mod_comprofileronline', '', 0, 1, 0, 0, '{"legacy":true,"name":"CB Online","type":"module","creationDate":"2012-06-19","author":"Beat and JoomlaJoe","copyright":"(C) 2005-2012 Joomlapolis.com. This module is released under the GNU\\/GPL v2 License","authorEmail":"beat@joomlapolis.com","authorUrl":"www.joomlapolis.com","version":"1.8.1","description":"Displays a list of users logged in with a link to their profile.","group":""}', '{"moduleclass_sfx":"","pretext":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_filters`
-- 

CREATE TABLE `b0e2j_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL default '1',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL default '0',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL default '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY  (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_finder_filters`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links`
-- 

CREATE TABLE `b0e2j_finder_links` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `indexdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `md5sum` varchar(32) default NULL,
  `published` tinyint(1) NOT NULL default '1',
  `state` int(5) default '1',
  `access` int(5) default '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL default '0',
  `sale_price` double unsigned NOT NULL default '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY  (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_finder_links`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms0`
-- 

CREATE TABLE `b0e2j_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms0`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms1`
-- 

CREATE TABLE `b0e2j_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms1`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms2`
-- 

CREATE TABLE `b0e2j_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms2`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms3`
-- 

CREATE TABLE `b0e2j_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms3`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms4`
-- 

CREATE TABLE `b0e2j_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms4`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms5`
-- 

CREATE TABLE `b0e2j_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms5`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms6`
-- 

CREATE TABLE `b0e2j_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms6`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms7`
-- 

CREATE TABLE `b0e2j_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms7`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms8`
-- 

CREATE TABLE `b0e2j_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms8`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_terms9`
-- 

CREATE TABLE `b0e2j_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_terms9`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termsa`
-- 

CREATE TABLE `b0e2j_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termsa`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termsb`
-- 

CREATE TABLE `b0e2j_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termsb`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termsc`
-- 

CREATE TABLE `b0e2j_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termsc`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termsd`
-- 

CREATE TABLE `b0e2j_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termsd`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termse`
-- 

CREATE TABLE `b0e2j_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termse`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_links_termsf`
-- 

CREATE TABLE `b0e2j_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_links_termsf`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_taxonomy`
-- 

CREATE TABLE `b0e2j_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL default '1',
  `access` tinyint(1) unsigned NOT NULL default '0',
  `ordering` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `b0e2j_finder_taxonomy`
-- 

INSERT INTO `b0e2j_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES (1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_taxonomy_map`
-- 

CREATE TABLE `b0e2j_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_taxonomy_map`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_terms`
-- 

CREATE TABLE `b0e2j_finder_terms` (
  `term_id` int(10) unsigned NOT NULL auto_increment,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL default '0',
  `phrase` tinyint(1) unsigned NOT NULL default '0',
  `weight` float unsigned NOT NULL default '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL default '0',
  PRIMARY KEY  (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_finder_terms`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_terms_common`
-- 

CREATE TABLE `b0e2j_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_terms_common`
-- 

INSERT INTO `b0e2j_finder_terms_common` (`term`, `language`) VALUES ('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_tokens`
-- 

CREATE TABLE `b0e2j_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL default '0',
  `phrase` tinyint(1) unsigned NOT NULL default '0',
  `weight` float unsigned NOT NULL default '1',
  `context` tinyint(1) unsigned NOT NULL default '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_tokens`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_tokens_aggregate`
-- 

CREATE TABLE `b0e2j_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL default '0',
  `phrase` tinyint(1) unsigned NOT NULL default '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL default '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_finder_tokens_aggregate`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_finder_types`
-- 

CREATE TABLE `b0e2j_finder_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_finder_types`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_golfscores_config`
-- 

CREATE TABLE `b0e2j_golfscores_config` (
  `id` int(11) NOT NULL auto_increment,
  `conf_name` text,
  `value` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `b0e2j_golfscores_config`
-- 

INSERT INTO `b0e2j_golfscores_config` (`id`, `conf_name`, `value`) VALUES (1, 'title', 'Golf Scores'),
(2, 'listlimit', '100'),
(3, 'datelabel', 'Date'),
(4, 'courselabel', 'Course'),
(5, 'userlabel', 'User'),
(6, 'holes', 'Holes'),
(7, 'teeslabel', 'Tee Played'),
(8, 'grosslabel', 'Gross Score'),
(9, 'handicaplabel', 'Handicap'),
(10, 'netlabel', 'Net Score'),
(11, 'commentslabel', 'Comments');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_golfscores_tb`
-- 

CREATE TABLE `b0e2j_golfscores_tb` (
  `score_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `date` text,
  `user` text,
  `course` text,
  `holes` text,
  `tees` text,
  `grossscore` double(3,0) default NULL,
  `handicap` double(3,1) default NULL,
  `netscore` double(3,1) default NULL,
  `comments` text,
  PRIMARY KEY  (`score_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_golfscores_tb`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_languages`
-- 

CREATE TABLE `b0e2j_languages` (
  `lang_id` int(11) unsigned NOT NULL auto_increment,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL default '',
  `published` int(11) NOT NULL default '0',
  `access` int(10) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_ordering` (`ordering`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `b0e2j_languages`
-- 

INSERT INTO `b0e2j_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES (1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_menu`
-- 

CREATE TABLE `b0e2j_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL default '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL default '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL default '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL default '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL default '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL default '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL default '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL default '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned default NULL,
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL default '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL default '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL default '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL default '',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 AUTO_INCREMENT=194 ;

-- 
-- Dumping data for table `b0e2j_menu`
-- 

INSERT INTO `b0e2j_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES (1, '', 'Menu_Item_Root', 0x726f6f74, '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 225, 0, '*', 0),
(2, 'menu', 'com_banners', 0x42616e6e657273, '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 0x42616e6e657273, '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 0x43617465676f72696573, '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 0x436c69656e7473, '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 0x547261636b73, '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 0x436f6e7461637473, '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 0x436f6e7461637473, '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 0x43617465676f72696573, '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 0x4d6573736167696e67, '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 0x4e65772050726976617465204d657373616765, '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 0x526561642050726976617465204d657373616765, '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 0x4e657773204665656473, '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 0x4665656473, '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 0x43617465676f72696573, '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 0x5265646972656374, '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 37, 38, 0, '*', 1),
(17, 'menu', 'com_search', 0x536561726368, '', 'Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'menu', 'com_weblinks', 0x5765626c696e6b73, '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 31, 36, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 0x4c696e6b73, '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 32, 33, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 0x43617465676f72696573, '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 34, 35, 0, '*', 1),
(101, 'mainmenu', 'Domov', 0x646f6d6f76, '', 'domov', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"0","num_columns":"1","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"0","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"dynamic","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 1, '*', 0),
(102, 'mainmenu', 'Naše služby', 0x6e6173652d736c757a6279, '', 'nase-sluzby', 'index.php?option=com_content&view=article&id=36', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 107, 150, 0, '*', 0),
(103, 'mainmenu', 'Typography', 0x323031312d30342d31372d31372d32312d3435, '', 'nase-sluzby/2011-04-17-17-21-45', '#', 'url', -2, 102, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 108, 109, 0, '*', 0),
(104, 'mainmenu', 'Module Positions', 0x6d6f64756c652d706f736974696f6e73, '', 'nase-sluzby/module-positions', 'index.php?option=com_content&view=article&id=10', 'component', 0, 102, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 110, 111, 0, '*', 0),
(105, 'mainmenu', 'Module Variations', 0x6d6f64756c652d766172696174696f6e73, '', 'nase-sluzby/module-variations', 'index.php?option=com_content&view=article&id=11', 'component', 0, 102, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 112, 113, 0, '*', 0),
(106, 'mainmenu', 'Expose Framework', 0x6578706f73652d6672616d65776f726b, '', 'nase-sluzby/expose-framework', 'index.php?option=com_content&view=article&id=12', 'component', -2, 102, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 116, 117, 0, '*', 0),
(107, 'mainmenu', 'Typography', 0x7479706f677261706879, '', 'nase-sluzby/typography', 'index.php?option=com_content&view=article&id=13', 'component', 0, 102, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 114, 115, 0, '*', 0),
(108, 'mainmenu', 'Child Items', 0x323031312d30342d31392d31382d31302d3537, '', 'nase-sluzby/2011-04-19-18-10-57', '#', 'url', -2, 102, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 118, 149, 0, '*', 0),
(109, 'mainmenu', 'Icon Menu', 0x323031312d30342d31392d31382d31312d3231, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21', '#', 'url', -2, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Toolbox.png","menu_text":1}', 119, 142, 0, '*', 0),
(110, 'mainmenu', 'Child Item', 0x323031312d30342d31392d31382d31312d3530, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-50', '#', 'url', -2, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 143, 144, 0, '*', 0),
(111, 'mainmenu', 'Child Item', 0x323031312d30342d31392d31382d31322d3230, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-12-20', '#', 'url', -2, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 145, 146, 0, '*', 0),
(112, 'mainmenu', 'Child Item', 0x323031312d30342d31392d31382d31322d3437, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-12-47', '#', 'url', -2, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 147, 148, 0, '*', 0),
(113, 'mainmenu', 'Monitor', 0x323031312d30342d31392d31382d32372d3236, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-27-26', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Activity Monitor.png","menu_text":1}', 120, 121, 0, '*', 0),
(114, 'mainmenu', 'Address Book', 0x323031312d30342d31392d31382d32382d3234, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-28-24', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Address book.png","menu_text":1}', 122, 123, 0, '*', 0),
(115, 'mainmenu', 'Calender', 0x323031312d30342d31392d31382d32382d3534, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-28-54', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Calendar.png","menu_text":1}', 124, 125, 0, '*', 0),
(116, 'mainmenu', 'Chalkboard', 0x323031312d30342d31392d31382d32392d3235, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-29-25', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Chalkboard.png","menu_text":1}', 126, 127, 0, '*', 0),
(117, 'mainmenu', 'Clipboard', 0x323031312d30342d31392d31382d32392d3534, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-29-54', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Clipboard.png","menu_text":1}', 128, 129, 0, '*', 0),
(118, 'mainmenu', 'Contrast', 0x323031312d30342d31392d31382d33302d3235, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-30-25', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Contrast.png","menu_text":1}', 130, 131, 0, '*', 0),
(119, 'mainmenu', 'Download', 0x323031312d30342d31392d31382d33312d3034, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-31-04', '', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Downloads.png","menu_text":1}', 132, 133, 0, '*', 0),
(120, 'mainmenu', 'Mail', 0x323031312d30342d31392d31382d33312d3435, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-31-45', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Mail.png","menu_text":1}', 134, 135, 0, '*', 0),
(121, 'mainmenu', 'Movies', 0x323031312d30342d31392d31382d33322d3231, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-32-21', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Movies.png","menu_text":1}', 136, 137, 0, '*', 0),
(122, 'mainmenu', 'Music', 0x323031312d30342d31392d31382d33392d3335, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-39-35', '#', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Music.png","menu_text":1}', 138, 139, 0, '*', 0),
(123, 'mainmenu', 'Notes', 0x323031312d30342d31392d31382d34302d3031, '', 'nase-sluzby/2011-04-19-18-10-57/2011-04-19-18-11-21/2011-04-19-18-40-01', '', 'url', -2, 109, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/menu_icons\\/Notes.png","menu_text":1}', 140, 141, 0, '*', 0),
(124, 'mainmenu', 'o Disc Golfe', 0x6f2d64697363676f6c6665, '', 'o-discgolfe', 'index.php?option=com_content&view=article&id=38', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 41, 56, 0, '*', 0),
(125, 'mainmenu', 'Left+Content+Right', 0x323031312d30342d31392d31382d34352d3536, '', 'o-discgolfe/2011-04-19-18-45-56', 'index.php?option=com_content&view=article&id=11&Itemid=105&layouts=left.content.right', 'url', -2, 124, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 42, 43, 0, '*', 0),
(126, 'mainmenu', 'Left+Right+Content', 0x323031312d30342d31392d31382d34352d3537, '', 'o-discgolfe/2011-04-19-18-45-57', 'index.php?option=com_content&view=article&id=11&Itemid=105&layouts=left.right.content', 'url', -2, 124, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 44, 45, 0, '*', 0),
(127, 'mainmenu', 'Content+Left+Right', 0x323031312d30342d31392d31382d34352d3538, '', 'o-discgolfe/2011-04-19-18-45-58', 'index.php?option=com_content&view=article&id=11&Itemid=105&layouts=content.left.right', 'url', -2, 124, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 46, 47, 0, '*', 0),
(128, 'mainmenu', 'História', 0x686973746f726961, '', 'historia', 'index.php?option=com_content&view=article&id=42', 'component', -2, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 80, 0, '*', 0),
(129, 'mainmenu', 'LTR Language', 0x323031312d30342d31392d31382d35372d3439, '', 'historia/2011-04-19-18-57-49', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&direction=ltr', 'url', -2, 128, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 76, 77, 0, '*', 0),
(130, 'mainmenu', 'RTL Language', 0x323031312d30342d31392d31382d35382d3138, '', 'historia/2011-04-19-18-58-18', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&direction=rtl', 'url', -2, 128, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 78, 79, 0, '*', 0),
(131, 'mainmenu', 'Styles', 0x323031312d30342d31392d31392d30312d3034, '', '2011-04-19-19-01-04', '#', 'url', -2, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 81, 100, 0, '*', 0),
(132, 'mainmenu', 'Green', 0x323031312d30342d31392d31392d30322d3334, '', '2011-04-19-19-01-04/2011-04-19-19-02-34', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style1', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 82, 83, 0, '*', 0),
(133, 'mainmenu', 'Orange', 0x323031312d30342d31392d31392d30332d3337, '', '2011-04-19-19-01-04/2011-04-19-19-03-37', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style2', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 84, 85, 0, '*', 0),
(134, 'mainmenu', 'Blue', 0x323031312d30342d31392d31392d30342d3034, '', '2011-04-19-19-01-04/2011-04-19-19-04-04', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style3', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 86, 87, 0, '*', 0),
(135, 'mainmenu', 'Yellow', 0x323031312d30342d31392d31392d30342d3333, '', '2011-04-19-19-01-04/2011-04-19-19-04-33', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style4', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 88, 89, 0, '*', 0),
(136, 'mainmenu', 'Kontakt', 0x6b6f6e74616b74, '', 'kontakt', 'index.php?option=com_content&view=article&id=37', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 151, 184, 0, '*', 0),
(137, 'mainmenu', 'Single Article', 0x73696e676c652d61727469636c65, '', 'kontakt/2011-04-19-19-53-51/single-article', 'index.php?option=com_content&view=article&id=24', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 153, 154, 0, '*', 0),
(138, 'mainmenu', 'Category Blog', 0x63617465676f72792d626c6f67, '', 'kontakt/2011-04-19-19-53-51/category-blog', 'index.php?option=com_content&view=category&layout=blog&id=15', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"4","num_columns":"1","num_links":"5","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 155, 156, 0, '*', 0),
(139, 'mainmenu', 'Category List', 0x63617465676f72792d6c697374, '', 'kontakt/2011-04-19-19-53-51/category-list', 'index.php?option=com_content&view=category&id=15', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 157, 158, 0, '*', 0),
(140, 'mainmenu', 'Featured Articles', 0x66656174757265642d61727469636c6573, '', 'kontakt/2011-04-19-19-53-51/featured-articles', 'index.php?option=com_content&view=featured', 'component', -2, 141, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"4","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 159, 160, 0, '*', 0),
(141, 'mainmenu', 'Content Style', 0x323031312d30342d31392d31392d35332d3531, '', 'kontakt/2011-04-19-19-53-51', '#', 'url', -2, 136, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 152, 161, 0, '*', 0),
(142, 'mainmenu', 'Contact Style', 0x323031312d30342d31392d31392d35372d3439, '', 'kontakt/2011-04-19-19-57-49', '#', 'url', -2, 136, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 162, 169, 0, '*', 0),
(143, 'mainmenu', 'Single Contact', 0x73696e676c652d636f6e74616374, '', 'kontakt/2011-04-19-19-57-49/single-contact', 'index.php?option=com_contact&view=contact&id=1', 'component', -2, 142, 3, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 163, 164, 0, '*', 0),
(144, 'mainmenu', 'Contact Categories', 0x636f6e746163742d63617465676f72696573, '', 'kontakt/2011-04-19-19-57-49/contact-categories', 'index.php?option=com_contact&view=categories&id=0', 'component', -2, 142, 3, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_base_description":"","categories_description":"","maxLevelcat":"","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_items_cat":"","show_category_title":"1","show_description":"1","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_items":"","show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 165, 166, 0, '*', 0),
(145, 'mainmenu', 'Featured Contacts', 0x66656174757265642d636f6e7461637473, '', 'kontakt/2011-04-19-19-57-49/featured-contacts', 'index.php?option=com_contact&view=featured', 'component', -2, 142, 3, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 167, 168, 0, '*', 0),
(146, 'mainmenu', 'User Component', 0x323031312d30342d31392d32302d32302d3038, '', 'kontakt/2011-04-19-20-20-08', '#', 'url', -2, 136, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 170, 183, 0, '*', 0),
(147, 'mainmenu', 'Login Form', 0x6c6f67696e2d666f726d, '', 'kontakt/2011-04-19-20-20-08/login-form', 'index.php?option=com_users&view=login', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 171, 172, 0, '*', 0),
(148, 'mainmenu', 'Registration Form', 0x726567697374726174696f6e2d666f726d, '', 'kontakt/2011-04-19-20-20-08/registration-form', 'index.php?option=com_users&view=registration', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 173, 174, 0, '*', 0),
(149, 'mainmenu', 'User Profile', 0x757365722d70726f66696c65, '', 'kontakt/2011-04-19-20-20-08/user-profile', 'index.php?option=com_users&view=profile', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 175, 176, 0, '*', 0),
(150, 'mainmenu', 'Edit Profile', 0x656469742d70726f66696c65, '', 'kontakt/2011-04-19-20-20-08/edit-profile', 'index.php?option=com_users&view=profile&layout=edit', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 177, 178, 0, '*', 0),
(151, 'mainmenu', 'Username Reminder', 0x757365726e616d652d72656d696e6465722d72657175657374, '', 'kontakt/2011-04-19-20-20-08/username-reminder-request', 'index.php?option=com_users&view=remind', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 179, 180, 0, '*', 0),
(152, 'mainmenu', 'Password Reset', 0x70617373776f72642d7265736574, '', 'kontakt/2011-04-19-20-20-08/password-reset', 'index.php?option=com_users&view=reset', 'component', -2, 146, 3, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 181, 182, 0, '*', 0),
(153, 'mobile-menu', 'Home', 0x6d6f62696c652d686f6d65, '', 'mobile-home', 'index.php?option=com_content&view=category&layout=blog&id=11', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"2","num_columns":"1","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 185, 186, 0, '*', 0),
(154, 'mobile-menu', 'Contact Us', 0x6d6f62696c652d636f6e74616374, '', 'mobile-contact', 'index.php?option=com_contact&view=contact&id=1', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 187, 188, 0, '*', 0),
(155, 'mainmenu', 'Dark Coffee', 0x323031312d30342d31392d31392d30322d3335, '', '2011-04-19-19-01-04/2011-04-19-19-02-35', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style5', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 90, 91, 0, '*', 0),
(156, 'mainmenu', 'Dark Purple', 0x323031312d30342d31392d31392d30332d3338, '', '2011-04-19-19-01-04/2011-04-19-19-03-38', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style6', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 92, 93, 0, '*', 0),
(157, 'mainmenu', 'Dark Blue', 0x323031312d30342d31392d31392d30342d35, '', '2011-04-19-19-01-04/2011-04-19-19-04-5', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style7', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 94, 95, 0, '*', 0),
(158, 'mainmenu', 'Dark Pink', 0x323031312d30342d31392d31392d30342d3334, '', '2011-04-19-19-01-04/2011-04-19-19-04-34', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style8', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 96, 97, 0, '*', 0),
(159, 'mainmenu', 'Magenta', 0x323031312d30342d31392d31392d30342d3335, '', '2011-04-19-19-01-04/2011-04-19-19-04-35', 'index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101&style=style5', 'url', -2, 131, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 98, 99, 0, '*', 0),
(160, 'mainmenu', 'Purchase', 0x323031312d30392d31332d31372d34372d3430, '', '2011-09-13-17-47-40', 'http://www.themexpert.com/joomla/club-pricing', 'url', -2, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 189, 190, 0, '*', 0),
(162, 'mainmenu', 'Galéria', 0x67616c65726961, '', 'galeria', 'index.php?option=com_content&view=article&id=44', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 101, 106, 0, '*', 0),
(161, 'mainmenu', 'Disky', 0x6469736b79, '', 'o-discgolfe/disky', 'index.php?option=com_content&view=article&id=43', 'component', 1, 124, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 50, 51, 0, '*', 0),
(163, 'mainmenu', 'Ihriská', 0x69687269736b61, '', 'ihriska', 'index.php?option=com_content&view=category&layout=blog&id=16', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"7","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"order","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 66, 0, '*', 0),
(164, 'mainmenu', 'Kalendár turnajov', 0x6b616c656e6461722d7475726e616a6f76, '', 'o-discgolfe/kalendar-turnajov', 'index.php?option=com_content&view=article&id=40', 'component', -2, 124, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 54, 55, 0, '*', 0),
(165, 'mainmenu', 'Disc Golfové stránky', 0x6c696e6b792d6e612d737472616e6b79, '', 'o-discgolfe/linky-na-stranky', 'index.php?option=com_content&view=article&id=41', 'component', 1, 124, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 52, 53, 0, '*', 0),
(21, 'menu', 'com_finder', 0x536d61727420536561726368, '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 107, 108, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 0x4a6f6f6d6c612120557064617465, '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 107, 108, 0, '*', 1),
(166, 'main', 'COM_TRACKS_TRACKS', 0x636f6d2d747261636b732d747261636b73, '', 'com-tracks-tracks', 'index.php?option=com_tracks', 'component', 0, 1, 1, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_tracks/assets/images/tracks_logo_16.png', 0, '', 191, 206, 0, '', 1),
(167, 'main', 'COM_TRACKS_PROJECTS', 0x636f6d2d747261636b732d70726f6a65637473, '', 'com-tracks-tracks/com-tracks-projects', 'index.php?option=com_tracks', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 192, 193, 0, '', 1),
(168, 'main', 'COM_TRACKS_Competitions', 0x636f6d2d747261636b732d636f6d7065746974696f6e73, '', 'com-tracks-tracks/com-tracks-competitions', 'index.php?option=com_tracks&view=competitions', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 194, 195, 0, '', 1),
(169, 'main', 'COM_TRACKS_Seasons', 0x636f6d2d747261636b732d736561736f6e73, '', 'com-tracks-tracks/com-tracks-seasons', 'index.php?option=com_tracks&view=seasons', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 196, 197, 0, '', 1),
(170, 'main', 'COM_TRACKS_Individuals', 0x636f6d2d747261636b732d696e646976696475616c73, '', 'com-tracks-tracks/com-tracks-individuals', 'index.php?option=com_tracks&view=individuals', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 198, 199, 0, '', 1),
(171, 'main', 'COM_TRACKS_Teams', 0x636f6d2d747261636b732d7465616d73, '', 'com-tracks-tracks/com-tracks-teams', 'index.php?option=com_tracks&view=teams', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 200, 201, 0, '', 1),
(172, 'main', 'COM_TRACKS_Rounds', 0x636f6d2d747261636b732d726f756e6473, '', 'com-tracks-tracks/com-tracks-rounds', 'index.php?option=com_tracks&view=rounds', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 202, 203, 0, '', 1),
(173, 'main', 'COM_TRACKS_About_Tracks', 0x636f6d2d747261636b732d61626f75742d747261636b73, '', 'com-tracks-tracks/com-tracks-about-tracks', 'index.php?option=com_tracks&view=about', 'component', 0, 166, 2, 10022, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 204, 205, 0, '', 1),
(174, 'mainmenu', 'Súťaže', 0x737574617a65, '', 'sutaze', 'index.php?option=com_content&view=article&id=40', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"https:\\/\\/sites.google.com\\/site\\/discgolfovaliga\\/home","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 74, 0, '*', 0),
(175, 'mainmenu', 'Videá', 0x7669646561, '', 'galeria/videa', 'index.php?option=com_content&view=article&id=44', 'component', 1, 162, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 104, 105, 0, '*', 0),
(176, 'mainmenu', 'Chcete ihrisko?', 0x6368636574652d69687269736b6f, '', 'ihriska/chcete-ihrisko', 'index.php?option=com_content&view=article&id=31', 'component', 1, 163, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 64, 65, 0, '*', 0);
INSERT INTO `b0e2j_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES (177, 'mainmenu', 'Ihrisko Malý Slavín', 0x69687269736b6f2d6d616c792d736c6176696e, '', 'ihriska/ihrisko-maly-slavin', 'index.php?option=com_content&view=article&id=34', 'component', 1, 163, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 58, 59, 0, '*', 0),
(178, 'mainmenu', 'Ihrisko Makov', 0x69687269736b6f2d6d616b6f76, '', 'ihriska/ihrisko-makov', 'index.php?option=com_content&view=article&id=32', 'component', 1, 163, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 62, 63, 0, '*', 0),
(179, 'mainmenu', 'Disc Golf Camp Kuchyňa', 0x64697363676f6c662d63616d70, '', 'ihriska/discgolf-camp', 'index.php?option=com_content&view=article&id=33', 'component', 1, 163, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 60, 61, 0, '*', 0),
(180, 'mainmenu', 'Fotky', 0x666f746b79, '', 'galeria/fotky', 'index.php?option=com_content&view=article&id=46', 'component', 1, 162, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 103, 0, '*', 0),
(181, 'main', 'COM_GOLFSCORES', 0x636f6d2d676f6c6673636f726573, '', 'com-golfscores', 'index.php?option=com_golfscores', 'component', 0, 1, 1, 10039, 0, 0, '0000-00-00 00:00:00', 0, 1, '../components/com_golfscores/misc/icon-16-golfscores.png', 0, '', 207, 208, 0, '', 1),
(182, 'main', 'COM_COMPROFILER', 0x636f6d2d636f6d70726f66696c6572, '', 'com-comprofiler', 'index.php?option=com_comprofiler', 'component', 0, 1, 1, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, '../components/com_comprofiler/plugin/templates/luna/images/header/icon-16-cb.png', 0, '', 209, 224, 0, '', 1),
(183, 'main', 'COM_COMPROFILER_SHOWUSERS', 0x636f6d2d636f6d70726f66696c65722d73686f777573657273, '', 'com-comprofiler/com-comprofiler-showusers', 'index.php?option=com_comprofiler&task=showusers&view=showusers', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:user', 0, '', 210, 211, 0, '', 1),
(184, 'main', 'COM_COMPROFILER_SHOWTAB', 0x636f6d2d636f6d70726f66696c65722d73686f77746162, '', 'com-comprofiler/com-comprofiler-showtab', 'index.php?option=com_comprofiler&task=showTab&view=showTab', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:themes', 0, '', 212, 213, 0, '', 1),
(185, 'main', 'COM_COMPROFILER_SHOWFIELD', 0x636f6d2d636f6d70726f66696c65722d73686f776669656c64, '', 'com-comprofiler/com-comprofiler-showfield', 'index.php?option=com_comprofiler&task=showField&view=showField', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:content', 0, '', 214, 215, 0, '', 1),
(186, 'main', 'COM_COMPROFILER_SHOWLISTS', 0x636f6d2d636f6d70726f66696c65722d73686f776c69737473, '', 'com-comprofiler/com-comprofiler-showlists', 'index.php?option=com_comprofiler&task=showLists&view=showLists', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:search', 0, '', 216, 217, 0, '', 1),
(187, 'main', 'COM_COMPROFILER_SHOWPLUGINS', 0x636f6d2d636f6d70726f66696c65722d73686f77706c7567696e73, '', 'com-comprofiler/com-comprofiler-showplugins', 'index.php?option=com_comprofiler&task=showPlugins&view=showPlugins', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:plugin', 0, '', 218, 219, 0, '', 1),
(188, 'main', 'COM_COMPROFILER_TOOLS', 0x636f6d2d636f6d70726f66696c65722d746f6f6c73, '', 'com-comprofiler/com-comprofiler-tools', 'index.php?option=com_comprofiler&task=tools&view=tools', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:maintenance', 0, '', 220, 221, 0, '', 1),
(189, 'main', 'COM_COMPROFILER_SHOWCONFIG', 0x636f6d2d636f6d70726f66696c65722d73686f77636f6e666967, '', 'com-comprofiler/com-comprofiler-showconfig', 'index.php?option=com_comprofiler&task=showconfig&view=showconfig', 'component', 0, 182, 2, 10041, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:config', 0, '', 222, 223, 0, '', 1),
(190, 'mainmenu', 'Kalendár turnajov', 0x6b616c656e6461722d646f6d61636963682d612d7a616872616e69636e7963682d7475726e616a6f76, '', 'sutaze/kalendar-domacich-a-zahranicnych-turnajov', 'index.php?option=com_content&view=article&id=40', 'component', 1, 174, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 68, 69, 0, '*', 0),
(191, 'mainmenu', 'SVK ranking', 0x73766b2d72616e6b696e67, '', 'sutaze/svk-ranking', 'index.php?option=com_content&view=article&id=56', 'component', 1, 174, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 70, 71, 0, '*', 0),
(192, 'mainmenu', 'Výsledky turnajov', 0x7679736c65646b792d7475726e616a6f76, '', 'sutaze/vysledky-turnajov', 'index.php?option=com_content&view=article&id=57', 'component', 1, 174, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 72, 73, 0, '*', 0),
(193, 'mainmenu', 'o Disc Golfe', 0x6f2d646973632d676f6c6665, '', 'o-discgolfe/o-disc-golfe', 'index.php?option=com_content&view=article&id=38', 'component', 1, 124, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 48, 49, 0, '*', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_menu_types`
-- 

CREATE TABLE `b0e2j_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `b0e2j_menu_types`
-- 

INSERT INTO `b0e2j_menu_types` (`id`, `menutype`, `title`, `description`) VALUES (1, 'mainmenu', 'Menu', 'The main menu for the site'),
(2, 'mobile-menu', 'Mobile Menu', 'Mobile Menu');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_messages`
-- 

CREATE TABLE `b0e2j_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` tinyint(3) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL default '0',
  `priority` tinyint(1) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `b0e2j_messages`
-- 

INSERT INTO `b0e2j_messages` (`message_id`, `user_id_from`, `user_id_to`, `folder_id`, `date_time`, `state`, `priority`, `subject`, `message`) VALUES (1, 42, 42, 0, '2013-08-29 04:48:08', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: seoden4k');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_messages_cfg`
-- 

CREATE TABLE `b0e2j_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_messages_cfg`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_modules`
-- 

CREATE TABLE `b0e2j_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) NOT NULL default '',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `access` int(10) unsigned default NULL,
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL default '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

-- 
-- Dumping data for table `b0e2j_modules`
-- 

INSERT INTO `b0e2j_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES (1, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(6, 'Unread Messages', '', '', 1, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unread', 3, 1, '', 1, '*'),
(7, 'Online Users', '', '', 2, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_online', 3, 1, '', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(18, 'Banners', '', '', 1, 'position-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_banners', 1, 1, '{"target":"1","count":"1","cid":"1","catid":["27"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(19, 'Menu', '', '', 1, 'header-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"tx-menu nostyle","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(20, 'Our Services', '', '', 3, 'feature-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_xpertscroller', 1, 1, '{"catid":["14"],"count":"3","ordering":"c_dsc","user_id":"0","show_featured":"","scroller_layout":"basic_h","module_width":"448","module_height":"170","col_amount":"1","image_position":"left","control_margin":"0 0","animation_style":"animation_h","animation_speed":"1000","repeat":"1","keyboard_navigation":"1","auto_play":"1","navigator":"1","control_arrow":"0","interval":"5000","auto_pause":"1","article_title":"1","title_link":"1","item_image":"1","image_link":"0","browser_nav":"parent","intro_text":"1","intro_text_limit":"200","readmore":"0","image_resize":"0","image_width":"460","image_height":"260","layout":"_:default","moduleclass_sfx":"","auto_module_id":"1","module_unique_id":"slideshow","load_jquery":"0","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(21, 'Social Icons', '', '<p><img src="images/social-icons/flickr.png" border="0" /><img src="images/social-icons/stumbleupon.png" border="0" /><img src="images/social-icons/technorati.png" border="0" /><img src="images/social-icons/google_buzz.png" border="0" /><img src="images/social-icons/facebook.png" border="0" align="left" /><img src="images/social-icons/twitter.png" border="0" style="float: left;" /><img src="images/social-icons/linkedin.png" border="0" style="float: left;" /><img src="images/social-icons/rss.png" border="0" align="left" /></p>', 1, 'bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"social-icons","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(22, 'Search', '', '', 1, 'header-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_search', 1, 0, '{"label":"","width":"30","text":"Looking for something?","button":"","button_pos":"right","imagebutton":"","button_text":"","set_itemid":"","layout":"_:default","moduleclass_sfx":"tx-search","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(23, 'High Class Security', '', '<p><img src="images/technology_protest.jpg" border="0" width="343" height="150" /></p>', 1, 'feature-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1 title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(24, 'Optimized For Speed', '', '<p><img src="images/cloud-computing-360.jpg" border="0" width="332" height="150" /></p>', 1, 'feature-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(25, 'Spotlight', '', '<p><img src="images/mexico1.jpg" border="0" width="300" height="100" /></p>\r\n<h4>The price of Mexico''s ''drugs war''</h4>\r\n<p>Mexico, fighting a bloody war against drug cartels, seems unscathed by the conflict,</p>\r\n<p><a class="readon" href="#">Read Full Story</a></p>', 2, 'top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(26, 'Around the world >>', '', '', 1, 'main-bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_xpertscroller', 1, 1, '{"catid":["8","9","10","11","12"],"count":"14","ordering":"c_dsc","user_id":"0","show_featured":"","scroller_layout":"basic_h","module_width":"980","module_height":"130","col_amount":"7","image_position":"left","control_margin":"0","animation_style":"animation_h","animation_speed":"1000","repeat":"1","keyboard_navigation":"1","auto_play":"0","navigator":"1","interval":"3000","auto_pause":"1","article_title":"1","title_link":"1","item_image":"1","image_link":"1","browser_nav":"parent","intro_text":"0","intro_text_limit":"250","image_resize":"1","image_width":"112","image_height":"62","layout":"_:default","moduleclass_sfx":"box8","auto_module_id":"0","module_unique_id":"scrollable","load_jquery":"1","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(27, 'Breaking News >>', '', '', 1, 'roof-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_xpertscroller', 1, 1, '{"catid":[""],"count":"5","ordering":"c_dsc","user_id":"0","show_featured":"1","scroller_layout":"basic_h","module_width":"470","module_height":"29","col_amount":"1","image_position":"top","control_margin":"0","animation_style":"animation_v","animation_speed":"1500","repeat":"1","keyboard_navigation":"1","auto_play":"1","navigator":"0","interval":"5000","auto_pause":"1","article_title":"1","title_link":"1","item_image":"0","image_link":"0","browser_nav":"parent","intro_text":"0","intro_text_limit":"100","image_resize":"1","image_width":"150","image_height":"150","layout":"_:newsticker","moduleclass_sfx":"newsticker","auto_module_id":"1","module_unique_id":"newsticker","load_jquery":"1","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(30, 'Customization Friendly', '', '<p><img src="images/LG_g-slate.jpg" border="0" width="332" height="150" /></p>', 1, 'feature-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(31, 'Sidebar Left', '', '<p>The <a>Sidebar-a</a> position, <em>using</em> the <strong>box3 title5</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 2, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(32, 'Sidebar Right', '', '<p>The <a>Sidebar-a</a> position, <em>using</em> the <strong>box6 title6</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box6 title6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(33, 'Roof 1', '', '<p>The <a>Roof-1</a> position, <em>using</em> the <strong>box1</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'roof-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(34, 'Roof 1 (copy)', '', '<p>The <a>Roof-1</a> position, <em>using</em> the <strong>box1</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 1, 'roof-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(35, 'Roof 2', '', '<p>The <a>Roof-2</a> position, <em>using</em> the <strong>box2</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'roof-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(36, 'Roof 3', '', '<p>The <a>Roof-3</a> position, <em>using</em> the <strong>box3</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'roof-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(37, 'Roof 4', '', '<p>The <a>Roof-4</a> position, <em>using</em> the <strong>box4</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'roof-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box4","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(38, 'Roof 5', '', '<p>The <a>Roof-5</a> position, <em>using</em> the <strong>box5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'roof-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(39, 'Header 1', '', '<p>The <a>Header-1</a> position, <em>using</em> its <strong>default</strong> module styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'header-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(40, 'Header 5', '', '<p>The <a>Header-5</a> position, <em>using</em> its <strong>default</strong> module styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'header-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(41, 'Top 1', '', '<p>The <a href="#">Top-1</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'top-1', 42, '2012-08-31 06:20:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(42, 'Header 3', '', '<p>The <a>Header-3</a> position, <em>using</em> its <strong>default</strong> module styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'header-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(43, 'Header 4', '', '<p>The <a>Header-2</a> position, <em>using</em> its <strong>default</strong> module styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'header-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(44, 'Top 2', '', '<p>The <a href="#">Top-2</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(45, 'Top 3', '', '<p>The <a href="#">Top-3</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'top-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(46, 'Top 4', '', '<p>The <a href="#">Top-4</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'top-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(47, 'Top 5', '', '<p>The <a href="#">Top-5</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'top-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(48, 'Utility 1', '', '<p>The <a href="#">Utility-1</a> position, <em>using</em> the <strong>box1 badge-new</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'utility-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1 badge-new","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(49, 'Utility 2', '', '<p>The <a href="#">Utility-2</a> position, <em>using</em> the <strong>box3 badge-hot</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'utility-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3 badge-hot","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(50, 'Utility 4', '', '<p>The <a href="#">Utility-4</a> position, <em>using</em> the <strong>box5 badge-top</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'utility-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5 badge-top","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(51, 'Utility 3', '', '<p>The <a href="#">Utility-3</a> position, <em>using</em> the <strong>box4 badge-pick</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'utility-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box4 badge-pick","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(52, 'Utility 5', '', '<p>The Utility<a>-5</a> position, <em>using</em> the <strong>box5 title5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'utility-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(53, 'Feature 1', '', '<p>The <a href="#">Feature-1</a> position, <em>using</em> its <strong>default</strong> styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 2, 'feature-1', 42, '2012-08-31 13:21:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(54, 'Feature 3', '', '<p>The <a href="#">Feature-3</a> position, <em>using</em> its <strong>default</strong> styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'feature-3', 42, '2012-08-31 06:25:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(55, 'Feature 2', '', '<p>The <a href="#">Feature-2</a> position, <em>using</em> its <strong>default</strong> styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'feature-2', 42, '2012-08-31 06:25:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(56, 'Feature 4', '', '<p>The <a href="#">Feature-4</a> position, <em>using</em> its <strong>default</strong> styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'feature-4', 42, '2012-08-31 06:25:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(57, 'Feature 5', '', '<p>The <a href="#">Feature-5</a> position, <em>using</em> its <strong>default</strong> styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'feature-5', 42, '2012-08-31 06:25:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(58, 'Main Top 1', '', '<p>The Main Top<a>-1</a> position, <em>using</em> the <strong>box1 title5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(59, 'Main Top 2', '', '<p>The Main Top<a>-2</a> position, <em>using</em> the <strong>box2 title4</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2 title4","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(60, 'Main Top 3', '', '<p>The Main Top<a>-3</a> position, <em>using</em> the <strong>box8 title1</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-top-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box8 title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(61, 'Main Top 4', '', '<p>The Main Top<a>-4</a> position, <em>using</em> the <strong>box7 title2</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-top-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(62, 'Main Top 5', '', '<p>The Main Top<a>-5</a> position, <em>using</em> its <strong>default</strong> module styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-top-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(63, 'Content Top 1', '', '<p>The Content Top<a>-1</a> position, <em>using</em> the <strong>box5 title5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'content-top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(64, 'Content Top 2', '', '<p>The Content Top<a>-2</a> position, <em>using</em> the <strong>box7 title7</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'content-top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title7 box7","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(65, 'Content Bottom 2', '', '<p>The Content Bottom<a>-2</a> position, <em>using</em> the <strong>box8 title2</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'content-bottom-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box8 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(66, 'Content Bottom 1', '', '<p>The Content Bottom<a>-1</a> position, <em>using</em> the <strong>title7</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'content-bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title7","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(67, 'Sidebar Left', '', '<p>The <a>Sidebar-a</a> position, <em>using</em> the <strong>box3 title5</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 3, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(68, 'Sidebar Left', '', '<p>The <a>Sidebar-left</a> position, <em>using</em> the <strong>box8 title2</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 4, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box8 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(69, 'Sidebar Right (2)', '', '<p>The <a>Sidebar-a</a> position, <em>using</em> the <strong>box6 title6</strong> module class styling.</p>\r\n<p><a class="readon"><span>More</span></a></p>', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box6 title6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(70, 'News >>', '', '<ul>\r\n<li><a href="#">Africa</a></li>\r\n<li><a href="#">Asia-Pacific</a></li>\r\n<li><a href="#">Europe</a></li>\r\n<li><a href="#">Latin America</a></li>\r\n<li><a href="#">Middle East</a></li>\r\n<li><a href="#">South Asia</a></li>\r\n<li><a href="#">UK</a></li>\r\n<li><a href="#">US &amp; Canada</a></li>\r\n</ul>\r\n<h3>Types of news &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Business</a></li>\r\n<li><a href="#">Health</a></li>\r\n<li><a href="#">Science &amp; Environment</a></li>\r\n<li><a href="#">Technology</a></li>\r\n<li><a href="#">Entertainment &amp; Arts</a></li>\r\n<li><a href="#">Also in the News</a></li>\r\n</ul>', 1, 'footer-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(71, 'Sports >>', '', '<ul>\r\n<li><a href="#">Football</a></li>\r\n<li><a href="#">Cricket</a></li>\r\n<li><a href="#">Tennis</a></li>\r\n<li><a href="#">Motorsport</a></li>\r\n</ul>\r\n<h3>Business &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Market Data</a></li>\r\n<li><a href="#">Economy</a></li>\r\n<li><a href="#">Companies</a></li>\r\n</ul>\r\n<h3>Weather &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Weather News</a></li>\r\n</ul>', 1, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(72, 'Entertainment >>', '', '<ul>\r\n<li><a href="#">Entertainment News</a></li>\r\n<li><a href="#">Comedy</a></li>\r\n<li><a href="#">Drama</a></li>\r\n</ul>\r\n<h3>Music &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Genres</a></li>\r\n<li><a href="#">Reviews</a></li>\r\n<li><a href="#">Artists</a></li>\r\n<li><a href="#">News</a></li>\r\n</ul>\r\n<h3>Arts &amp; Culture &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Film</a></li>\r\n</ul>\r\n<h3>Food &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Techniques</a></li>\r\n<li><a href="#">Recipes</a></li>\r\n</ul>', 1, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(73, 'Science >>', '', '<ul>\r\n<li><a href="#">Humans</a></li>\r\n<li><a href="#">Space</a></li>\r\n</ul>\r\n<h3><a href="#">Nature</a> &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Animals</a></li>\r\n</ul>\r\n<h3><a href="#">Gardening</a> &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Plant finder</a></li>\r\n<li><a href="#">Advice</a></li>\r\n</ul>\r\n<h3>Religion &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">Multifaith Calendar</a></li>\r\n<li><a href="#">Quizzes</a></li>\r\n</ul>\r\n<h3>Ethics &gt;&gt;</h3>', 1, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(74, 'Learning English >>', '', '<ul>\r\n<li><a href="#">Online courses</a></li>\r\n<li><a href="#">Vocabulary &amp; Grammar</a></li>\r\n<li><a href="#">Quizzes</a></li>\r\n</ul>\r\n<h3><a href="#">Learning Other Languages >></a></h3>\r\n<ul>\r\n<li><a href="#">French</a></li>\r\n<li><a href="#">Spanish</a></li>\r\n<li><a href="#">German</a></li>\r\n<li><a href="#">Italian</a></li>\r\n</ul>\r\n<h3>TV Channels &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">BBC World News</a></li>\r\n<li><a href="#">BBC America</a></li>\r\n</ul>\r\n<h3>Radio &gt;&gt;</h3>\r\n<ul>\r\n<li><a href="#">World Service</a></li>\r\n</ul>', 1, 'footer-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(75, 'Who''s Online', '', '', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_whosonline', 1, 1, '{"showmode":"0","linknames":"0","layout":"_:default","moduleclass_sfx":"box1","cache":"0"}', 0, '*'),
(76, 'Menu', '', '', 1, 'sidebar-right', 42, '2012-08-31 16:02:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"list","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(77, 'Main Bottom 1', '', '<p>The <a>Main Bottom-1</a> position, <em>using</em> the <strong>title1</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(78, 'Main Bottom 2', '', '<p>The <a>Main Bottom-2</a> position, <em>using</em> the <strong>box2 title1</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-bottom-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2 title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(79, 'Main Bottom 3', '', '<p>The <a>Main Bottom-2</a> position, <em>using</em> the <strong>box7 title2</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-bottom-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box7 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(80, 'Main Bottom 4', '', '<p>The <a>Main Bottom-4</a> position, <em>using</em> the <strong>box5 title5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-bottom-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(81, 'Main Bottom 5', '', '<p>The <a>Main Bottom-5</a> position, <em>using</em> its <strong>default</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'main-bottom-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(82, 'Bottom 1', '', '<p>The <a>Bottom-1</a> position, <em>using</em> the <strong>box1 title1</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box1 title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(83, 'Bottom 2', '', '<p>The <a>Bottom-2</a> position, <em>using</em> the <strong>box2 title2</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(84, 'Bottom 3', '', '<p>The <a>Bottom-3</a> position, <em>using</em> the <strong>box3 title3</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(85, 'Bottom 4', '', '<p>The <a>Bottom-4</a> position, <em>using</em> the <strong>box4 title4</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box4 title4","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(86, 'Bottom 5', '', '<p>The <a>Bottom-5</a> position, <em>using</em> the <strong>box5 title5</strong> module class styling.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box5 title5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(87, 'System Requirement', '', '<p>The following are required for Syndicate to operate fully:</p>\r\n<ul class="check">\r\n<li>Joomla 1.6.x (latest version)</li>\r\n<li>Expose v2.0 or higher</li>\r\n<li>PHP 5.2 or higher</li>\r\n</ul>', 1, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(88, 'Demo Installer', '', '<p>Replicate this demo with ExpertExplorer, which includes the template, extensions, sample images and data.</p>', 5, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(89, 'Login Form', '', '', 6, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","layout":"_:default","moduleclass_sfx":"box6","cache":"0"}', 0, '*'),
(90, 'Who''s Online', '', '', 1, 'content-top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_whosonline', 1, 1, '{"showmode":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","filter_groups":"0"}', 0, '*'),
(91, 'Logo', '', '<a href=""></a>', 1, 'header-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"logo nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(92, 'iPad', '', '<p><img src="images/ipad.png" border="0" alt="ipad " title="ipad" style="float:left; margin-right: 10px;" /></p>\r\n<p>Pellentesque id elit vitae est lobortis suscipit et non urna. Nulla nec  rhoncus lectus. Ut facilisis purus in massa sagittis adipiscing.</p>\r\n<p><a class="readon" href="#"><span>Read More</span></a> <a class="readon" href="#"><span>Buy Now</span></a></p>', 1, 'main-top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(93, 'iPhone 4', '', '<p><img src="images/iphone4.png" border="0" alt="ipod comparison" title="ipod comparison" width="180" height="105" style="float:left; margin-right: 10px;" /></p>\r\n<p>Pellentesque id elit vitae est lobortis suscipit et non urna. Nulla nec  rhoncus lectus. Ut facilisis purus in massa sagittis adipiscing.</p>\r\n<p><a class="readon" href="#"><span>Read More</span></a> <a class="readon" href="#"><span>Buy Now</span></a></p>', 1, 'main-top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(94, 'iPad Touch', '', '<p><img src="images/ipod.png" border="0" alt="ipod comparison" title="ipod comparison" width="180" height="105" style="float:right; margin-right: 10px;" /></p>\r\n<p>Pellentesque id elit vitae est lobortis suscipit et non urna. Nulla nec  rhoncus lectus. Ut facilisis purus in massa sagittis adipiscing.</p>\r\n<p><a class="readon" href="#"><span>Read More</span></a> <a class="readon" href="#"><span>Buy Now</span></a></p>', 1, 'main-top-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"box7","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(95, 'Bottom Links', '', '<ul>\r\n<li><a href="#" title="Sample link">Nunc scelerisque</a></li>\r\n<li><a href="#" title="Sample link">Donec facilisis dictum </a></li>\r\n<li><a href="#" title="Sample link">Praesent hendrerit</a></li>\r\n  <li><a href="#" title="Sample link">Nunc scelerisque</a></li>\r\n<li><a href="#" title="Sample link">Donec facilisis dictum </a></li>\r\n<li><a href="#" title="Sample link">Praesent hendrerit</a></li>\r\n</ul>', 1, 'bottom-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(96, 'Contact Us', '', '<strong>ThemeXpert Q. Public</strong>\r\n10018 New York, NY<br />\r\nUnited States<br />\r\n\r\nTelephone: 1-212-555555-1<br />\r\nFax: 1-212-555555-2<br /><br />\r\n<a class="readon">EMAIL US</a>', 1, 'bottom-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(97, 'Service', '', '<ul>\r\n<li><a href="#" title="Sample link">Vivamus</a></li>\r\n<li><a href="#" title="Sample link">Mauris none</a></li>\r\n<li><a href="#" title="Sample link">Phasellus ac</a></li>\r\n  <li><a href="#" title="Sample link">Nunc scelerisque</a></li>\r\n<li><a href="#" title="Sample link">Donec facilisis dictum </a></li>\r\n<li><a href="#" title="Sample link">Praesent hendrerit</a></li>\r\n</ul>', 1, 'bottom-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(98, 'SOCIAL BOOKMARKS', '', '<p style="line-height:40px; margin-bottom:5px" class="clearfix"><img style="float:left;margin-right:10px" src="images/twitter.png" alt="Twitter" /><a href="http://twitter.com/themexpert">Twitter</a></p>\r\n\r\n<p style="line-height:40px;margin-bottom:5px" class="clearfix"><img style="float:left;margin-right:10px" src="images/facebook.png" alt="Facebook" /><a style="line-height:35px;" href="http://facebook.com/themexpert">Facebook</a></p>\r\n\r\n<p style="line-height:40px;margin-bottom:5px" class="clearfix"><img style="float:left;margin-right:10px" src="images/flickr.png" alt="Flickr" /><a href="http://flickr.com">Flicker</a></p>\r\n\r\n<p style="line-height:40px;margin-bottom:5px" class="clearfix"><img style="float:left;margin-right:10px" src="images/rss.png" alt="RSS" /><a href="#">Rss</a></p>', 1, 'bottom-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(99, 'Mobile Menu', '', '', 1, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 0, '{"menutype":"mobile-menu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(100, 'Big Banner', '', '<h2 class="big italic normal">We Create Awesome <br />\r\nWebsite and Interface</h2>\r\n<p class="medium">Dolor scelerisque magna a massa, tincidunt nunc tempor urna</p> \r\n<p class="medium">egestas porta, arcu dolor tristique</p>\r\n<a href="#" class="readon2"><span>Read More</span></a>', 1, 'top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"bg","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(101, 'About Us', '', '<blockquote>Scelerisque enim, massa mattis pellentesque sed turpis tortor egestas duis porta, lundium montes in? Turpis? Integer, sit elementum scelerisque, porta cum porttitor porta,Scelerisque enim, massa mattis pellentesque sed turpis tortor egestas duis porta, ac phasellus risus porta. Quis! <a href="#">more</a></blockquote>', 4, 'feature-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(102, 'From Our Blog', '', '<div style="margin-right: 10px;float:left;width:47%">\r\n<img src="images/blog-1.png" alt="Front-End Development" />\r\n<h2 class="medium">Front-End Development</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras <a href="#">pulvinar</a>, cursus, aliquet integer, duis tincidunt nascetur. </p>\r\n<a class="readon" href="#"><span>Read More..</span></a>\r\n</div>\r\n\r\n<div style="float:left;width:50%">\r\n<img src="images/blog-2.png" alt="Online Marketing" />\r\n<h2 class="medium">Online Marketing</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras pulvinar, cursus, <a href="#">aliquet integer</a>, duis tincidunt nascetur. </p>\r\n<a class="readon" href="#"><span>Read More..</span></a>\r\n</div>', 0, 'feature-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(103, 'Our Clients', '', '<img class="noborder" src="images/clients.png" alt="clients" />', 0, 'feature-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(104, 'Company', '', '<ul>\r\n<li><a href="#">About Us</a></li>\r\n<li><a href="#">News &amp; Events</a></li>\r\n<li><a href="#">Work</a></li>\r\n<li><a href="#">Contact</a></li>\r\n</ul>', 1, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(105, 'Service', '', '<ul>\r\n<li><a href="#">Internet Marketing</a></li>\r\n<li><a href="#">Business Consulting</a></li>\r\n<li><a href="#">Network Support</a></li>\r\n<li><a href="#">IT Services</a></li>\r\n</ul>', 1, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(106, 'Solutions', '', '<ul>\r\n<li><a href="#">Training</a></li>\r\n<li><a href="#">Support</a></li>\r\n<li><a href="#">Professional Services</a></li>\r\n<li><a href="#">Certificates</a></li>\r\n</ul>', 0, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title1 list","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(107, 'Monthly Newsletter', '', '<p class="small">Keep up to date on the latest from our network:</p>\r\n<form class="newsletter">\r\n<input type="text" name="nl" size="19" />\r\n<input type="submit" value="&gt;" />\r\n</form>', 0, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(108, 'Kontaktné údaje', '', '<h1 style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 18px !important; line-height: 1.5; color: #273b4a; font-family: Verdana !important;"><span style="color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; font-size: 14px; line-height: 20px;">Martin Krička</span></h1>\r\n<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 20px;">Eisnerova 13<br />841 07 Bratislava<br />IČO: 37349970<br />Tel: +421 905 805 204</div>\r\n<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 20px;">E-mail: info@discgolf.sk</div>', 1, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(109, 'Typography top', '', '<h2 class="big italic normal">Typography</h2>', 1, 'top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(110, 'Joomla menu top', '', '<h2 class="big italic normal">Joomla Component Style</h2>', 1, 'top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(111, 'Our Services', '', '', 2, 'top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_xpertscroller', 1, 1, '{"catid":["14"],"count":"5","ordering":"c_dsc","user_id":"0","show_featured":"","scroller_layout":"basic_h","module_width":"890","module_height":"280","col_amount":"1","image_position":"top","control_margin":"0 0","animation_style":"animation_h","animation_speed":"1000","repeat":"1","keyboard_navigation":"1","auto_play":"0","navigator":"1","interval":"5000","auto_pause":"1","article_title":"0","title_link":"0","item_image":"1","image_link":"0","browser_nav":"parent","intro_text":"0","intro_text_limit":"200","readmore":"0","image_resize":"0","image_width":"80","image_height":"80","layout":"_:default","moduleclass_sfx":"","auto_module_id":"1","module_unique_id":"slideshow","load_jquery":"0","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');
INSERT INTO `b0e2j_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES (112, 'o Disc Golfe', '', '<p style="text-align: justify;">Vitajte na stránke venovanej Disc Golfu. Či ste začiatočník alebo pokročilý, ak máte záujem si zahrať Disc Golf, na tejto stránke nájdete všetky potrebné informácie. Disc Golf je najpopulárnejšia individuálna hra s lietajúcim tanierom (diskom). Snahou hráča je dosiahnuť cieľ na čo najmenší počet hodov.<br /><br />Tým cieľom je v Disc Golfe špeciálny kôš (<strong>Disc Catcher</strong>).</p>', 3, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(113, 'Ihriská', '', '<p><img class="noborder" src="images/clients.png" border="0" alt="clients" style="width: 300px;" /></p>', 4, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(114, 'Naše služby', '', '<div><img src="images/blog-1.png" border="0" alt="Front-End Development" />\r\n<h2 class="medium">Front-End Development</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras <a href="#">pulvinar</a>, cursus, aliquet integer, duis tincidunt nascetur.</p>\r\n<a class="readon" href="#"><span>Read More..</span></a></div>\r\n<div><img src="images/blog-2.png" border="0" alt="Online Marketing" />\r\n<h2 class="medium">Online Marketing</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras pulvinar, cursus, <a href="#">aliquet integer</a>, duis tincidunt nascetur.</p>\r\n<a class="readon" href="#"><span>Read More..</span></a></div>', 5, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(115, 'Expose Features', '', '', 1, 'main-top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_xpertcaptions', 1, 0, '{"catid":["16"],"ordering":"c_dsc","user_id":"0","show_featured":"","count":"4","title":"1","intro":"1","intro_limit":"300","link":"1","width":"210","height":"150","animation":"xc-fade","speed":"250","opacity":"1","effect_apply":"caption","anchor":"left","anchor_position":"0","hover_x":"0","hover_y":"0","moduleclass_sfx":"","load_jquery":"0","jquery_source":"local","cache":"0","cache_time":"900","layout":"_:default"}', 0, '*'),
(116, 'Slideshow', '', '', 1, 'top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_xpertscroller', 1, 0, '{"catid":["14"],"count":"6","ordering":"m_dsc","user_id":"0","show_featured":"","scroller_layout":"basic_h","module_width":"960","module_height":"270","col_amount":"1","image_position":"top","control_margin":"0","animation_style":"animation_h","animation_speed":"1000","repeat":"1","keyboard_navigation":"1","auto_play":"1","navigator":"1","interval":"5000","auto_pause":"0","article_title":"0","title_link":"0","item_image":"1","image_link":"0","browser_nav":"parent","intro_text":"0","intro_text_limit":"150","readmore":"0","image_resize":"0","image_width":"150","image_height":"150","layout":"_:default","moduleclass_sfx":"slideshow nostyle ","auto_module_id":"1","module_unique_id":"xs_1","load_jquery":"1","jquery_source":"local","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(117, 'We ♥ Joomla', '', '<p>We create unique and professional looking Joomla Template. <br /><a class="readon" href="http://www.themexpert.com/joomla/templates"><span>Take A Look</span></a></p>', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(118, 'Expose Features', '', '<p class="check">Flexible Layout system.</p>\r\n<p class="check">52+ base module positions.</p>\r\n<p class="check">Mobile platform support.</p>\r\n<p class="check">RTL support.</p>\r\n<p class="check">Code compression.</p>\r\n<p class="check">Google Web Fonts.</p>', 1, 'sidebar-left', 42, '2012-08-31 06:48:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(119, 'Logo page spodne', '', '<p><img src="images/captions/logo_fin_crop.png" border="0" alt="" />                                                                    <a href="https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929" target="_blank"><img src="images/sampledata/facebook-logo.gif" border="0" alt="" width="80" height="80" /></a>    <a href="https://twitter.com/DiscGolfSR" target="_blank"><img src="images/sampledata/twitter_logo1.jpg" border="0" alt="" width="82" height="82" /></a>   <a href="http://www.youtube.com/user/DGKASHO?feature=CAQQwRs%3D" target="_blank"><img src="images/sampledata/YoutubeButton-150x150.png" border="0" width="80" height="80" /></a>                    </p>', 1, 'footer-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(120, 'Our Vission', '', '<p><img src="images/sampledata/vision.png" border="0" alt="our vision" title="vision" style="float:right;margin-left:5px;" />Lorem ipasu sm sdoorlsr sit amet vastibulum Lorem ipasu sm sdoorlsr sit amet vastibulum</p>\r\n<p><a href="#" style="text-decoration:none;">View More...</a></p>', 1, 'feature-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(121, 'Web Solution', '', '<p><img src="images/sampledata/web-solution.png" border="0" alt="solution is here" title="need solution" style="float:left;margin-right:5px;" />Mauris ultrices scelerisque lorem quis commodo. Lorem ipsum dolor sit amet consectetur.</p>\r\n<p><a href="#" style="text-decoration:none;">Learn More...</a></p>', 0, 'feature-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(122, 'Hlavna udalost', '', '<h2 style="text-align: center;"><a href="https://sites.google.com/site/regnadgtur/ftc-2013" target="_blank"><span style="color: #33cccc;">"Finále Slovenskej Disc Golfovej ligy 2013"</span></a></h2>\r\n<h2 style="text-align: center;"><a href="https://sites.google.com/site/regnadgtur/ftc-2013" target="_blank"><span style="color: #33cccc;"><span style="color: #33cccc;">"Slovak Disc Golf League Final 2013"</span></span></a><span style="color: #33cccc;"><span style="color: #33cccc;"><br /></span></span></h2>\r\n<p style="text-align: center;"><span style="color: #33cccc;"><span style="color: #33cccc;">pre viac informácií klikni <span style="text-decoration: underline;"><a href="https://sites.google.com/site/regnadgtur/ftc-2013" target="_blank"><span style="font-size: medium;">TU</span></a></span> - for more info click <span style="text-decoration: underline;"><span style="font-size: medium;"><a href="https://sites.google.com/site/regnadgtur/ftc-2013" target="_blank">HERE</a></span></span><br /></span></span></p>\r\n<p><span style="color: #33cccc;"><span style="color: #33cccc;"> </span></span></p>\r\n<p style="text-align: center;"><span style="font-size: large;"><span style="font-family: arial, helvetica, sans-serif;"> </span></span></p>\r\n<p> </p>', 1, 'feature-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(123, 'Mobile Theme Support', '', '<p><img src="images/sampledata/mobile_sticker.png" border="0" alt="Mobile ready template by themexpert" style="float: left; margin-right: 10px;" />Mobile device specific theme.</p>', 1, 'content-top-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(124, 'Easy Install and Customize', '', '<p><img src="images/sampledata/gears_sticker.png" border="0" alt="Themexpert templates are easily configurable and install" width="64" height="64" style="float: left; border: 0;" />Simple Installation and Configuration.</p>', 1, 'content-top-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(125, 'Demo Package Available', '', '<p><img src="images/sampledata/synchronize_sticker.png" border="0" alt="Sample demo installer included with every template" width="64" height="64" style="float: left; border: 0;" />Sample data to look like demo</p>', 1, 'content-top-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(126, 'From The Blog', '', '', 0, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":["7"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(127, 'About Freemium', '', '<div style="font-family: ''Puritan'', sans-serif; font-size: 20px; text-align: center;">\r\n<h3 style="font-size: 27px; font-family: ''Puritan'', sans-serif;">"Freemium is an extremely versatile theme with a myriad of options and styles"</h3>\r\n<p>Aliquam venenatis enim in mi iaculis in tempor lectus tempor et convallis erat pellentesque</p>\r\n</div>', 1, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"nostyle","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(128, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(129, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(134, 'sigplus', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_sigplus', 1, 1, '', 0, '*'),
(135, 'Facebook FanBox', '', '', 1, 'position-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_fbfanbox', 1, 1, '{"page_url":"https:\\/\\/www.facebook.com\\/pages\\/Disc-Golf-Slovakia\\/218686351593929","boxwidth":"250","boxheight":"250","show_faces":"1","show_stream":"1","show_header":"1","force_wall":"1","connect_script_call":"1","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(136, 'Naše služby (2)', '', '<div><img src="images/blog-1.png" border="0" alt="Front-End Development" />\r\n<h2 class="medium">Front-End Development</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras <a href="#">pulvinar</a>, cursus, aliquet integer, duis tincidunt nascetur.</p>\r\n<a class="readon" href="#"><span>Read More..</span></a></div>\r\n<div><img src="images/blog-2.png" border="0" alt="Online Marketing" />\r\n<h2 class="medium">Online Marketing</h2>\r\n<p>Nunc tincidunt a velit, in urna ac scelerisque nec nisi. Risus, odio vel cras pulvinar, cursus, <a href="#">aliquet integer</a>, duis tincidunt nascetur.</p>\r\n<a class="readon" href="#"><span>Read More..</span></a></div>', 5, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(137, 'Novinky', '', '<p>123455</p>', 1, 'mobile-header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(138, 'Kontakt', '', '<p>Martin </p>', 1, 'mobile-footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(139, 'DiscGolf Scores', '', '', 1, 'main-bottom-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_golfscores_latest', 1, 1, '{"showname":"name","showgsmenu":"yes","CB_itemid":"","golfscores_itemid":"","count":"5","cblink":"no","order":"desc","user":"Golfer","course":"Course","holes":"Holes","gross":"Gross"}', 0, '*'),
(140, 'Disc Golf Login', '', '', 1, 'content-bottom-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cblogin', 1, 1, '{"moduleclass_sfx":"","horizontal":"0","compact":"0","pretext":"","posttext":"","logoutpretext":"","logoutposttext":"","login":"","logout":"index.php","show_lostpass":"1","show_newaccount":"1","show_username_pass_icons":"0","name_lenght":"14","pass_lenght":"14","show_buttons_icons":"0","show_remind_register_icons":"0","login_message":"0","logout_message":"0","remember_enabled":"1","greeting":"1","name":"0","show_avatar":"0","avatar_position":"default","text_show_profile":"","text_edit_profile":"","pms_type":"0","show_pms":"0","show_connection_notifications":"0","https_post":"0","cb_plugins":"0"}', 0, '*'),
(141, 'CB Workflows', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_comprofilermoderator', 1, 1, '', 0, '*'),
(142, 'CB Online', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_comprofileronline', 1, 1, '', 0, '*'),
(143, 'Kontaktné údaje (copy)', '', '<h1 style="margin: 0px; padding: 5px 0px; border: 0px; outline: 0px; font-size: 18px !important; line-height: 1.5; color: #273b4a; font-family: Verdana !important;"><span style="color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; font-size: 14px; line-height: 20px;">Martin Krička</span></h1>\r\n<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 20px;">Eisnerova 13<br />841 07 Bratislava<br />IČO: 37349970<br />Tel: +421 905 805 204</div>\r\n<div style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; color: #444444; font-family: ''Trebuchet MS'', Verdana, Arial, sans-serif; line-height: 20px;">E-mail: info@discgolf.sk</div>', 1, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_modules_menu`
-- 

CREATE TABLE `b0e2j_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_modules_menu`
-- 

INSERT INTO `b0e2j_modules_menu` (`moduleid`, `menuid`) VALUES (1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 101),
(21, 0),
(22, 101),
(23, 101),
(24, 101),
(25, 101),
(26, 101),
(27, 101),
(30, 101),
(31, 105),
(32, 105),
(33, 105),
(34, 105),
(35, 105),
(36, 105),
(37, 105),
(38, 105),
(39, 105),
(40, 105),
(41, 105),
(42, 105),
(43, 105),
(44, 105),
(45, 105),
(46, 105),
(47, 105),
(48, 105),
(49, 105),
(50, 105),
(51, 105),
(52, 105),
(53, 105),
(54, 105),
(55, 105),
(56, 105),
(57, 105),
(58, 105),
(59, 105),
(60, 105),
(61, 105),
(62, 105),
(63, 105),
(64, 105),
(65, 105),
(66, 105),
(67, 105),
(68, 105),
(69, 105),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 107),
(76, 101),
(76, 136),
(77, 105),
(78, 105),
(79, 105),
(80, 105),
(81, 105),
(82, 105),
(83, 105),
(84, 105),
(85, 105),
(86, 105),
(87, 104),
(88, 104),
(89, 101),
(89, 104),
(90, 101),
(91, 0),
(92, 101),
(93, 101),
(94, 101),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 101),
(101, 101),
(102, 101),
(103, 101),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 107),
(110, 136),
(110, 137),
(110, 138),
(110, 139),
(110, 140),
(110, 141),
(110, 142),
(110, 143),
(110, 144),
(110, 145),
(110, 146),
(110, 147),
(110, 148),
(110, 149),
(110, 150),
(110, 151),
(110, 152),
(111, 101),
(112, 101),
(113, 101),
(114, 101),
(115, 101),
(116, 101),
(116, 102),
(116, 104),
(116, 105),
(116, 107),
(116, 124),
(116, 136),
(116, 161),
(116, 162),
(116, 163),
(116, 164),
(116, 165),
(117, 101),
(118, 101),
(119, 0),
(120, 101),
(121, 101),
(122, 101),
(122, 153),
(123, 101),
(124, 101),
(125, 101),
(126, 0),
(127, 101),
(127, 153),
(128, 0),
(129, 0),
(135, 101),
(136, 101),
(137, 0),
(138, 0),
(139, 136),
(140, 136),
(143, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_newsfeeds`
-- 

CREATE TABLE `b0e2j_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `link` varchar(200) NOT NULL default '',
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(10) unsigned NOT NULL default '1',
  `cache_time` int(10) unsigned NOT NULL default '3600',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  `access` int(10) unsigned default NULL,
  `language` char(7) NOT NULL default '',
  `params` text NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_newsfeeds`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_overrider`
-- 

CREATE TABLE `b0e2j_overrider` (
  `id` int(10) NOT NULL auto_increment COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_overrider`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_redirect_links`
-- 

CREATE TABLE `b0e2j_redirect_links` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `old_url` varchar(255) default NULL,
  `new_url` varchar(255) default NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL default '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM AUTO_INCREMENT=770 DEFAULT CHARSET=utf8 AUTO_INCREMENT=770 ;

-- 
-- Dumping data for table `b0e2j_redirect_links`
-- 

INSERT INTO `b0e2j_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES (1, 'http://localhost/joomla/templates16/iambus/index.php?layouts=left.mani.right&Itemid=125', '', 'http://localhost/joomla/templates16/iambus/index.php?option=com_content&view=category&layout=blog&id=8&Itemid=101', '', 0, 0, '2011-04-19 18:48:07', '0000-00-00 00:00:00'),
(2, 'http://localhost/joomla/templates16/iambus/index.php/2011-04-19-19-05-47/2011-04-19-19-53-51/index.php', '', 'http://localhost/joomla/templates16/iambus/index.php/2011-04-19-19-05-47/2011-04-19-19-53-51/category-blog', '', 0, 0, '2011-04-20 06:54:20', '0000-00-00 00:00:00'),
(3, 'http://localhost/joomla/templates16/iambus/index.php/2011-04-17-17-18-46/index.php', '', 'http://localhost/joomla/templates16/iambus/index.php/2011-04-17-17-18-46/module-variations', '', 0, 0, '2011-04-20 09:44:42', '0000-00-00 00:00:00'),
(4, 'http://localhost/joomla/templates16/iambus/index.php/t', '', '', '', 0, 0, '2011-04-21 06:13:52', '0000-00-00 00:00:00'),
(5, 'http://localhost/joomla/templates16/iambus/index.php/tp=1', '', '', '', 0, 0, '2011-04-21 06:13:53', '0000-00-00 00:00:00'),
(6, 'http://localhost/templates/vivify/j16/index.php/2011-04-19-19-05-47/2011-04-19-19-53-51/single-article', '', 'http://localhost/templates/vivify/j16/index.php/2011-04-17-17-18-46/module-variations', '', 0, 0, '2011-05-24 10:45:02', '0000-00-00 00:00:00'),
(7, 'http://discgolf.sk/new/2011-04-17-17-18-46', '', 'http://discgolf.sk/new/', '', 0, 0, '2012-08-31 11:34:06', '0000-00-00 00:00:00'),
(8, 'http://discgolf.sk/linky-na-discgolfove-stranky-v-zahranici', '', 'http://discgolf.sk/', '', 0, 0, '2012-09-01 10:17:34', '0000-00-00 00:00:00'),
(9, 'http://discgolf.sk/linky', '', 'http://discgolf.sk/', '', 0, 0, '2012-09-01 10:20:46', '0000-00-00 00:00:00'),
(10, 'http://discgolf.sk/kalendar-turnajov', '', 'http://discgolf.sk/', '', 0, 0, '2012-09-01 10:24:52', '0000-00-00 00:00:00'),
(11, 'http://www.discgolf.sk/kalendar-turnajov', '', '', '', 0, 0, '2012-09-01 10:25:03', '0000-00-00 00:00:00'),
(12, 'http://discgolf.sk/a', '', '', '', 1, 0, '2012-09-01 14:00:01', '0000-00-00 00:00:00'),
(13, 'http://www.discgolf.sk/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Result:+', '', 'http://www.discgolf.sk/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Result:+%EF%EE%E4%F5%EE%E4%FF%F9%E8%E9+%EA%EE%ED%F2%E5%ED%F2+%ED%E5+%', '', 5, 0, '2012-09-01 21:54:30', '0000-00-00 00:00:00'),
(14, 'http://www.discgolf.sk/media/system/js/);if(!a){a=new', '', '', '', 69, 0, '2012-09-01 22:30:18', '0000-00-00 00:00:00'),
(15, 'http://www.discgolf.sk/media/system/js/,c);}var', '', '', '', 18, 0, '2012-09-01 22:30:22', '0000-00-00 00:00:00'),
(16, 'http://www.discgolf.sk/media/system/js/;}};}})();(function(){var', '', '', '', 10, 0, '2012-09-01 22:30:23', '0000-00-00 00:00:00'),
(17, 'http://www.discgolf.sk/media/system/js/)?n.html:n.body;}})();Element.alias({position:', '', '', '', 7, 0, '2012-09-01 22:30:30', '0000-00-00 00:00:00'),
(18, 'http://www.discgolf.sk/media/system/js/in', '', '', '', 14, 0, '2012-09-01 22:30:31', '0000-00-00 00:00:00'),
(19, 'http://www.discgolf.sk/video2.html', '', '', '', 13, 0, '2012-09-02 17:20:42', '0000-00-00 00:00:00'),
(20, 'http://www.discgolf.sk/new/', '', '', '', 1, 0, '2012-09-03 05:42:28', '0000-00-00 00:00:00'),
(21, 'http://discgolf.sk/new', '', '', '', 1, 0, '2012-09-03 14:48:47', '0000-00-00 00:00:00'),
(22, 'http://www.discgolf.sk/aw_stat', '', '', '', 1, 0, '2012-09-03 15:14:13', '0000-00-00 00:00:00'),
(23, 'http://discgolf.sk/administration', '', '', '', 1, 0, '2012-09-03 21:19:08', '0000-00-00 00:00:00'),
(24, 'http://www.discgolf.sk/o-discgolfe/linky', '', 'http://www.discgolf.sk/nase-sluzby', '', 12, 0, '2012-09-03 21:35:56', '0000-00-00 00:00:00'),
(25, 'http://www.discgolf.sk/o-discgolfe/kalendar-turnajov', '', '', '', 71, 0, '2012-09-04 04:02:19', '0000-00-00 00:00:00'),
(26, 'http://discgolf.sk/o-discgolfe/kalendar-turnajov', '', '', '', 41, 0, '2012-09-04 08:43:15', '0000-00-00 00:00:00'),
(27, 'http://www.discgolf.sk/disky', '', '', '', 17, 0, '2012-09-04 19:24:03', '0000-00-00 00:00:00'),
(28, 'http://www.discgolf.sk/linky-na-discgolfove-stranky-v-zahranici', '', '', '', 1, 0, '2012-09-04 19:24:19', '0000-00-00 00:00:00'),
(29, 'http://ww.discgolf.sk/o-discgolfe/kalendar-turnajov', '', '', '', 1, 0, '2012-09-04 23:09:39', '0000-00-00 00:00:00'),
(30, 'http://www.discgolf.sk/budmerice.html', '', '', '', 9, 0, '2012-09-04 23:16:39', '0000-00-00 00:00:00'),
(31, 'http://www.discgolf.sk/2007.html', '', '', '', 10, 0, '2012-09-05 02:48:44', '0000-00-00 00:00:00'),
(32, 'http://www.discgolf.sk/prihlaska.html', '', '', '', 14, 0, '2012-09-05 14:00:27', '0000-00-00 00:00:00'),
(33, 'http://www.discgolf.sk/galeria/fotky/);', '', '', '', 363, 0, '2012-09-06 03:46:29', '0000-00-00 00:00:00'),
(34, 'http://www.discgolf.sk/<\\/a>', '', '', '', 1, 0, '2012-09-06 10:08:11', '0000-00-00 00:00:00'),
(35, 'http://www.discgolf.sk/2010.html', '', '', '', 17, 0, '2012-09-06 11:27:58', '0000-00-00 00:00:00'),
(36, 'http://www.discgolf.sk/disky.html', '', '', '', 22, 0, '2012-09-07 23:35:00', '0000-00-00 00:00:00'),
(37, 'http://discgolf.sk/prihlaska.html', '', '', '', 3, 0, '2012-09-08 00:28:50', '0000-00-00 00:00:00'),
(38, 'http://www.discgolf.sk/fotky', '', '', '', 1, 0, '2012-09-09 15:20:24', '0000-00-00 00:00:00'),
(39, 'http://www.discgolf.sk/galeriafotky', '', '', '', 1, 0, '2012-09-09 15:20:44', '0000-00-00 00:00:00'),
(40, 'http://www.discgolf.sk/galeriafoto', '', '', '', 1, 0, '2012-09-09 15:20:52', '0000-00-00 00:00:00'),
(41, 'http://www.discgolf.sk/2006.html', '', '', '', 5, 0, '2012-09-10 18:55:59', '0000-00-00 00:00:00'),
(42, 'http://www.discgolf.sk/gerulata.html', '', '', '', 10, 0, '2012-09-12 00:00:09', '0000-00-00 00:00:00'),
(43, 'http://www.discgolf.sk/2009.html', '', '', '', 9, 0, '2012-09-15 14:34:34', '0000-00-00 00:00:00'),
(44, 'http://www.discgolf.sk/foto.html', '', '', '', 13, 0, '2012-09-15 17:29:54', '0000-00-00 00:00:00'),
(45, 'http://www.discgolf.sk/aktuality.html', '', '', '', 139, 0, '2012-09-15 20:35:01', '0000-00-00 00:00:00'),
(46, 'http://discgolf.sk/budmerice2007.html', '', '', '', 11, 0, '2012-09-17 03:46:07', '0000-00-00 00:00:00'),
(47, 'http://discgolf.sk/budmerice2008.html', '', '', '', 11, 0, '2012-09-17 03:46:11', '0000-00-00 00:00:00'),
(48, 'http://discgolf.sk/aktuality.html', '', '', '', 11, 0, '2012-09-17 14:02:00', '0000-00-00 00:00:00'),
(49, 'http://discgolf.sk/index.html', '', '', '', 7, 0, '2012-09-18 14:22:31', '0000-00-00 00:00:00'),
(50, 'http://discgolf.sk/2006.html', '', '', '', 6, 0, '2012-09-19 05:06:31', '0000-00-00 00:00:00'),
(51, 'http://discgolf.sk/2007.html', '', '', '', 6, 0, '2012-09-19 05:06:35', '0000-00-00 00:00:00'),
(52, 'http://discgolf.sk/disky.html', '', '', '', 9, 0, '2012-09-19 05:06:43', '0000-00-00 00:00:00'),
(53, 'http://discgolf.sk/kontakt.html', '', '', '', 13, 0, '2012-09-19 05:06:47', '0000-00-00 00:00:00'),
(54, 'http://discgolf.sk/video.html', '', '', '', 10, 0, '2012-09-19 05:06:49', '0000-00-00 00:00:00'),
(55, 'http://www.discgolf.sk/files/foto/gerulataopen2006/index.html', '', '', '', 6, 0, '2012-09-19 05:06:57', '0000-00-00 00:00:00'),
(56, 'http://www.discgolf.sk/files/foto/gerulataopen2006/index2.html', '', '', '', 5, 0, '2012-09-19 05:06:59', '0000-00-00 00:00:00'),
(57, 'http://www.discgolf.sk/files/foto/gerulataopen2006/index3.html', '', '', '', 5, 0, '2012-09-19 05:07:04', '0000-00-00 00:00:00'),
(58, 'http://www.discgolf.sk/index.html', '', '', '', 24, 0, '2012-09-19 05:07:06', '0000-00-00 00:00:00'),
(59, 'http://www.discgolf.sk/kontakt.html', '', '', '', 24, 0, '2012-09-19 05:07:08', '0000-00-00 00:00:00'),
(60, 'http://www.discgolf.sk/video.html', '', '', '', 16, 0, '2012-09-19 05:07:10', '0000-00-00 00:00:00'),
(61, 'http://www.discgolf.sk/sandberg2007.html', '', '', '', 12, 0, '2012-09-20 09:23:04', '0000-00-00 00:00:00'),
(62, 'http://www.discgolf.sk/sandberg2005.html', '', '', '', 7, 0, '2012-09-20 16:53:48', '0000-00-00 00:00:00'),
(63, 'http://discgolf.sk/ADMINISTRATOR', '', '', '', 1, 0, '2012-09-23 08:47:16', '0000-00-00 00:00:00'),
(64, 'http://www.discgolf.sk/https://twitter.com/DiscGolfSR', '', '', '', 9, 0, '2012-09-26 02:59:02', '0000-00-00 00:00:00'),
(65, 'http://www.discgolf.sk/https://sites.google.com/site/discgolfovaliga', '', '', '', 1, 0, '2012-09-26 02:59:05', '0000-00-00 00:00:00'),
(66, 'http://www.discgolf.sk/galeria/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:05', '0000-00-00 00:00:00'),
(67, 'http://www.discgolf.sk/ihriska/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:05', '0000-00-00 00:00:00'),
(68, 'http://www.discgolf.sk/kontakt/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:06', '0000-00-00 00:00:00'),
(69, 'http://www.discgolf.sk/nase-sluzby/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:06', '0000-00-00 00:00:00'),
(70, 'http://www.discgolf.sk/o-discgolfe/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:06', '0000-00-00 00:00:00'),
(71, 'http://www.discgolf.sk/sutaze/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:06', '0000-00-00 00:00:00'),
(72, 'http://www.discgolf.sk/modules/mod_xpertscroller/interface/js/+c+', '', '', '', 3, 0, '2012-09-26 02:59:07', '0000-00-00 00:00:00'),
(73, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/popis?pli=1', '', '', '', 3, 0, '2012-09-26 02:59:07', '0000-00-00 00:00:00'),
(74, 'http://www.discgolf.sk/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 5, 0, '2012-09-26 02:59:07', '0000-00-00 00:00:00'),
(75, 'http://www.discgolf.sk//https://sites.google.com/site/discgolfovaliga', '', '', '', 1, 0, '2012-09-26 02:59:08', '0000-00-00 00:00:00'),
(76, 'http://www.discgolf.sk/ihriska/https://sites.google.com/site/discgolfovaliga', '', '', '', 3, 0, '2012-09-26 02:59:08', '0000-00-00 00:00:00'),
(77, 'http://www.discgolf.sk/sutaze/https://www.google.com/calendar/embed?mode=AGENDA&height=600&wkst=1&bgcolor=#FFFFFF&amp;src=mn8arlru20tkbpidaud95shaf4@group.calendar.google.com&amp;color=#182C57&amp;ctz=Europe/Prague', '', '', '', 1, 0, '2012-09-26 02:59:08', '0000-00-00 00:00:00'),
(78, 'http://www.discgolf.sk/galeria/fotky/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:08', '0000-00-00 00:00:00'),
(79, 'http://www.discgolf.sk/galeria/videa/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:09', '0000-00-00 00:00:00'),
(80, 'http://www.discgolf.sk/ihriska/chcete-ihrisko/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:09', '0000-00-00 00:00:00'),
(81, 'http://www.discgolf.sk/ihriska/discgolf-camp/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:09', '0000-00-00 00:00:00'),
(82, 'http://www.discgolf.sk/ihriska/ihrisko-makov/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:10', '0000-00-00 00:00:00'),
(83, 'http://www.discgolf.sk/ihriska/ihrisko-maly-slavin/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:10', '0000-00-00 00:00:00'),
(84, 'http://www.discgolf.sk/o-discgolfe/disky/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:10', '0000-00-00 00:00:00'),
(85, 'http://www.discgolf.sk/o-discgolfe/linky-na-stranky/https://twitter.com/DiscGolfSR', '', '', '', 3, 0, '2012-09-26 02:59:10', '0000-00-00 00:00:00'),
(86, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/results/msrmakov2012', '', '', '', 5, 0, '2012-09-26 02:59:11', '0000-00-00 00:00:00'),
(87, 'http://www.discgolf.sk/galeria/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 3, 0, '2012-09-26 02:59:11', '0000-00-00 00:00:00'),
(88, 'http://www.discgolf.sk/ihriska/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 3, 0, '2012-09-26 02:59:11', '0000-00-00 00:00:00'),
(89, 'http://www.discgolf.sk/kontakt/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 3, 0, '2012-09-26 02:59:11', '0000-00-00 00:00:00'),
(90, 'http://www.discgolf.sk/nase-sluzby/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 3, 0, '2012-09-26 02:59:12', '0000-00-00 00:00:00'),
(91, 'http://www.discgolf.sk/o-discgolfe/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 3, 0, '2012-09-26 02:59:12', '0000-00-00 00:00:00'),
(92, 'http://www.discgolf.sk/odiscgolfe.html', '', '', '', 18, 0, '2012-09-27 16:49:12', '0000-00-00 00:00:00'),
(93, 'http://discgolf.sk/smolenice2008.html', '', '', '', 6, 0, '2012-09-29 01:14:33', '0000-00-00 00:00:00'),
(94, 'http://www.discgolf.sk/ihriska.html', '', '', '', 15, 0, '2012-10-01 23:18:56', '0000-00-00 00:00:00'),
(95, 'http://discgolf.sk/index.php?option=com_spidercalendar&date=999999.9'' union all select null,null,concat(0x3D3D3D3D3D,username,0x3D,password,0x3D3D3D3D3D),null,null,null from jos_users+--+ D4NB4R', '', '', '', 1, 0, '2012-10-05 15:59:36', '0000-00-00 00:00:00'),
(96, 'http://discgolf.sk/wp-login.php', '', '', '', 44, 0, '2012-10-06 11:36:27', '0000-00-00 00:00:00'),
(97, 'http://www.discgolf.sk/sponzori.html', '', '', '', 5, 0, '2012-10-07 04:02:17', '0000-00-00 00:00:00'),
(98, 'http://www.discgolf.sk/historia.html', '', '', '', 5, 0, '2012-10-07 04:02:18', '0000-00-00 00:00:00'),
(99, 'http://discgolf.sk/admin.php', '', '', '', 31, 0, '2012-10-09 08:19:14', '0000-00-00 00:00:00'),
(100, 'http://www.discgolf.sk/smolenice2008.html', '', '', '', 11, 0, '2012-10-16 08:58:56', '0000-00-00 00:00:00'),
(101, 'http://discgolf.sk/component/content/article/18-reportaz/', '', '', '', 25, 0, '2012-10-22 03:06:36', '0000-00-00 00:00:00'),
(102, 'http://www.discgolf.sk/signup.php', '', '', '', 28, 0, '2012-10-30 09:36:56', '0000-00-00 00:00:00'),
(103, 'http://www.discgolf.sk/register.php', '', 'http://www.discgolf.sk/', '', 21, 0, '2012-10-30 09:37:09', '0000-00-00 00:00:00'),
(104, 'http://www.discgolf.sk/ucp.php?mode=register', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:37:10', '0000-00-00 00:00:00'),
(105, 'http://www.discgolf.sk/user/register', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:37:21', '0000-00-00 00:00:00'),
(106, 'http://www.discgolf.sk/signup/', '', 'http://www.discgolf.sk/', '', 6, 0, '2012-10-30 09:37:26', '0000-00-00 00:00:00'),
(107, 'http://www.discgolf.sk/account/register.php', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:37:27', '0000-00-00 00:00:00'),
(108, 'http://www.discgolf.sk/join.php', '', 'http://www.discgolf.sk/', '', 16, 0, '2012-10-30 09:37:32', '0000-00-00 00:00:00'),
(109, 'http://www.discgolf.sk/blogs/load/recent', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:37:33', '0000-00-00 00:00:00'),
(110, 'http://www.discgolf.sk/join_form.php', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:37:35', '0000-00-00 00:00:00'),
(111, 'http://www.discgolf.sk/signup', '', 'http://www.discgolf.sk/', '', 20, 0, '2012-10-30 09:37:40', '0000-00-00 00:00:00'),
(112, 'http://www.discgolf.sk/YaBB.cgi/', '', '', '', 5, 0, '2012-10-30 09:37:59', '0000-00-00 00:00:00'),
(113, 'http://www.discgolf.sk/YaBB.pl/', '', '', '', 4, 0, '2012-10-30 09:38:00', '0000-00-00 00:00:00'),
(114, 'http://www.discgolf.sk/member/register', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:38:01', '0000-00-00 00:00:00'),
(115, 'http://www.discgolf.sk/index.php/forums/member/register', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:38:01', '0000-00-00 00:00:00'),
(116, 'http://www.discgolf.sk/forum/member/register', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:38:02', '0000-00-00 00:00:00'),
(117, 'http://www.discgolf.sk/register/', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:38:03', '0000-00-00 00:00:00'),
(118, 'http://www.discgolf.sk/member/join.php', '', 'http://www.discgolf.sk/', '', 5, 0, '2012-10-30 09:38:11', '0000-00-00 00:00:00'),
(119, 'http://www.discgolf.sk/tiki-register.php', '', 'http://www.discgolf.sk/', '', 4, 0, '2012-10-30 09:38:34', '0000-00-00 00:00:00'),
(120, 'http://www.discgolf.sk/wp-login.php?action=register', '', 'http://www.discgolf.sk/', '', 4, 0, '2012-10-30 09:38:52', '0000-00-00 00:00:00'),
(121, 'http://discgolf.sk/index_e.php', '', 'http://www.discgolf.cz/', '', 1, 0, '2012-10-31 01:48:17', '0000-00-00 00:00:00'),
(122, 'http://www.discgolf.sk/index_e.php', '', 'http://www.discgolf.cz/', '', 1, 0, '2012-10-31 01:48:56', '0000-00-00 00:00:00'),
(123, 'http://www.discgolf.sk/component/content/article/18-reportaz/', '', '', '', 12, 0, '2012-11-01 03:03:58', '0000-00-00 00:00:00'),
(124, 'http://discgolf.sk//wp-login.php', '', '', '', 1, 0, '2012-11-01 17:14:37', '0000-00-00 00:00:00'),
(125, 'http://discgolf.sk/blog//wp-login.php', '', '', '', 1, 0, '2012-11-01 17:14:38', '0000-00-00 00:00:00'),
(126, 'http://discgolf.sk/wordpress//wp-login.php', '', '', '', 1, 0, '2012-11-01 17:14:38', '0000-00-00 00:00:00'),
(127, 'http://discgolf.sk/wp//wp-login.php', '', '', '', 1, 0, '2012-11-01 17:14:39', '0000-00-00 00:00:00'),
(128, 'http://discgolf.sk/https://sites.google.com/site/regnadgtur/popis', '', '', '', 4, 0, '2012-11-04 14:34:19', '0000-00-00 00:00:00'),
(129, 'http://discgolf.sk/https://sites.google.com/site/regnadgtur/results/finale-ligy-2012', '', '', '', 4, 0, '2012-11-04 14:34:26', '0000-00-00 00:00:00'),
(130, 'http://discgolf.sk/https://sites.google.com/site/regnadgtur/results/msrmakov2012', '', '', '', 6, 0, '2012-11-04 14:34:28', '0000-00-00 00:00:00'),
(131, 'http://discgolf.sk/https://twitter.com/DiscGolfSR', '', '', '', 6, 0, '2012-11-04 14:34:29', '0000-00-00 00:00:00'),
(132, 'http://discgolf.sk/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 6, 0, '2012-11-04 14:34:31', '0000-00-00 00:00:00'),
(133, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/results/finale-ligy-2012', '', '', '', 2, 0, '2012-11-26 08:04:32', '0000-00-00 00:00:00'),
(134, 'http://www.discgolf.sk/catalog/', '', '', '', 12, 0, '2012-12-05 01:27:03', '0000-00-00 00:00:00'),
(135, 'http://www.discgolf.sk/shop', '', '', '', 12, 0, '2012-12-05 01:27:03', '0000-00-00 00:00:00'),
(136, 'http://www.discgolf.sk/oscommerce/', '', '', '', 12, 0, '2012-12-05 01:27:03', '0000-00-00 00:00:00'),
(137, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo13.html', '', '', '', 3, 0, '2012-12-08 04:11:38', '0000-00-00 00:00:00'),
(138, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo52.html', '', '', '', 2, 0, '2012-12-08 04:11:41', '0000-00-00 00:00:00'),
(139, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo22.html', '', '', '', 2, 0, '2012-12-08 04:11:43', '0000-00-00 00:00:00'),
(140, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo12.html', '', '', '', 2, 0, '2012-12-08 04:11:46', '0000-00-00 00:00:00'),
(141, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo51.html', '', '', '', 2, 0, '2012-12-08 04:11:49', '0000-00-00 00:00:00'),
(142, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo41.html', '', '', '', 2, 0, '2012-12-08 04:11:51', '0000-00-00 00:00:00'),
(143, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo40.html', '', '', '', 2, 0, '2012-12-08 04:11:54', '0000-00-00 00:00:00'),
(144, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo47.html', '', '', '', 2, 0, '2012-12-08 04:11:56', '0000-00-00 00:00:00'),
(145, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo37.html', '', '', '', 3, 0, '2012-12-08 04:11:59', '0000-00-00 00:00:00'),
(146, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo26.html', '', '', '', 2, 0, '2012-12-08 04:12:01', '0000-00-00 00:00:00'),
(147, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo16.html', '', '', '', 2, 0, '2012-12-08 04:12:04', '0000-00-00 00:00:00'),
(148, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo65.html', '', '', '', 2, 0, '2012-12-08 04:12:06', '0000-00-00 00:00:00'),
(149, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo35.html', '', '', '', 2, 0, '2012-12-08 04:12:09', '0000-00-00 00:00:00'),
(150, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo25.html', '', '', '', 2, 0, '2012-12-08 04:12:12', '0000-00-00 00:00:00'),
(151, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo15.html', '', '', '', 2, 0, '2012-12-08 04:12:14', '0000-00-00 00:00:00'),
(152, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo44.html', '', '', '', 2, 0, '2012-12-08 04:12:17', '0000-00-00 00:00:00'),
(153, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo34.html', '', '', '', 2, 0, '2012-12-08 04:12:19', '0000-00-00 00:00:00'),
(154, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo24.html', '', '', '', 2, 0, '2012-12-08 04:12:22', '0000-00-00 00:00:00'),
(155, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo69.html', '', '', '', 2, 0, '2012-12-08 04:12:24', '0000-00-00 00:00:00'),
(156, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo29.html', '', '', '', 3, 0, '2012-12-08 04:12:27', '0000-00-00 00:00:00'),
(157, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo68.html', '', '', '', 2, 0, '2012-12-08 04:12:29', '0000-00-00 00:00:00'),
(158, 'http://discgolf.sk/video2.html', '', '', '', 6, 0, '2012-12-15 00:08:30', '0000-00-00 00:00:00'),
(159, 'http://www.discgolf.sk/http:/www.discgolf.sk/', '', 'http://www.discgolf.sk/', '', 18, 0, '2012-12-21 03:26:09', '0000-00-00 00:00:00'),
(160, 'http://www.discgolf.skhttp//www.discgolf.sk/http:/www.discgolf.sk/', '', 'http://www.discgolf.sk/', '', 4, 0, '2012-12-21 03:26:21', '0000-00-00 00:00:00'),
(161, 'http://forum.discgolf.sk/http://www.discgolf.sk//', '', 'http://forum.discgolf.sk/', '', 4, 0, '2012-12-21 03:28:07', '0000-00-00 00:00:00'),
(162, 'http://www.discgolf.sk/o-discgolfe/galeria/fotky', '', '', '', 1, 0, '2012-12-22 12:02:44', '0000-00-00 00:00:00'),
(163, 'http://www.discgolf.sk/o-discgolfe/o-discgolfe', '', '', '', 1, 0, '2012-12-22 12:02:44', '0000-00-00 00:00:00'),
(164, 'http://www.discgolf.sk/o-discgolfe/ihriska/ihrisko-maly-slavin', '', '', '', 1, 0, '2012-12-22 12:02:44', '0000-00-00 00:00:00'),
(165, 'http://www.discgolf.sk/o-discgolfe/ihriska', '', '', '', 1, 0, '2012-12-22 12:02:45', '0000-00-00 00:00:00'),
(166, 'http://www.discgolf.sk/o-discgolfe/component/mailto/?tmpl=component&template=tx_freemium&link=e17aa5ab2cc0460f0eb63f4a773987fca3532ada', '', '', '', 1, 0, '2012-12-22 12:02:45', '0000-00-00 00:00:00'),
(167, 'http://www.discgolf.sk/o-discgolfe/nase-sluzby', '', '', '', 1, 0, '2012-12-22 12:02:45', '0000-00-00 00:00:00'),
(168, 'http://www.discgolf.sk/o-discgolfe/ihriska/discgolf-camp', '', '', '', 1, 0, '2012-12-22 12:02:45', '0000-00-00 00:00:00'),
(169, 'http://www.discgolf.sk/o-discgolfe/o-discgolfe/disky', '', '', '', 1, 0, '2012-12-22 12:02:46', '0000-00-00 00:00:00'),
(170, 'http://www.discgolf.sk/o-discgolfe/o-discgolfe/linky-na-stranky?tmpl=component&print=1&page=', '', '', '', 1, 0, '2012-12-22 12:02:46', '0000-00-00 00:00:00'),
(171, 'http://www.discgolf.sk/o-discgolfe/o-discgolfe/linky-na-stranky', '', '', '', 1, 0, '2012-12-22 12:02:46', '0000-00-00 00:00:00'),
(172, 'http://www.discgolf.sk/o-discgolfe/ihriska/chcete-ihrisko', '', '', '', 1, 0, '2012-12-22 12:02:48', '0000-00-00 00:00:00'),
(173, 'http://www.discgolf.sk/o-discgolfe/galeria/videa', '', '', '', 1, 0, '2012-12-22 12:02:48', '0000-00-00 00:00:00'),
(174, 'http://www.discgolf.sk/o-discgolfe/ihriska/ihrisko-makov', '', '', '', 1, 0, '2012-12-22 12:02:49', '0000-00-00 00:00:00'),
(175, 'http://www.discgolf.sk/o-discgolfe/sutaze', '', '', '', 1, 0, '2012-12-22 12:02:49', '0000-00-00 00:00:00'),
(176, 'http://www.discgolf.sk/o-discgolfe/galeria', '', '', '', 1, 0, '2012-12-22 12:02:49', '0000-00-00 00:00:00'),
(177, 'http://www.discgolf.sk/o-discgolfe/kontakt', '', '', '', 1, 0, '2012-12-22 12:02:49', '0000-00-00 00:00:00'),
(178, 'http://www.discgolf.sk/component/content/article/18-reportaz/ihriska/chcete-ihrisko', '', '', '', 1, 0, '2012-12-22 12:02:49', '0000-00-00 00:00:00'),
(179, 'http://www.discgolf.sk/component/content/article/18-reportaz/galeria/videa', '', '', '', 1, 0, '2012-12-22 12:02:50', '0000-00-00 00:00:00'),
(180, 'http://www.discgolf.sk/component/content/article/18-reportaz/nase-sluzby', '', '', '', 2, 0, '2012-12-22 12:02:50', '0000-00-00 00:00:00'),
(181, 'http://www.discgolf.sk/component/content/article/18-reportaz/galeria', '', '', '', 1, 0, '2012-12-22 12:02:50', '0000-00-00 00:00:00'),
(182, 'http://www.discgolf.sk/component/content/article/18-reportaz/ihriska/discgolf-camp', '', '', '', 1, 0, '2012-12-22 12:02:53', '0000-00-00 00:00:00'),
(183, 'http://www.discgolf.sk/component/content/article/18-reportaz/ihriska', '', '', '', 1, 0, '2012-12-22 12:02:53', '0000-00-00 00:00:00'),
(184, 'http://www.discgolf.sk/component/content/article/18-reportaz/kontakt', '', '', '', 2, 0, '2012-12-22 12:02:54', '0000-00-00 00:00:00'),
(185, 'http://www.discgolf.sk/component/content/article/18-reportaz/o-discgolfe', '', '', '', 1, 0, '2012-12-22 12:02:54', '0000-00-00 00:00:00'),
(186, 'http://www.discgolf.sk/component/content/article/18-reportaz/sutaze', '', '', '', 1, 0, '2012-12-22 12:02:56', '0000-00-00 00:00:00'),
(187, 'http://www.discgolf.sk/component/content/article/18-reportaz/ihriska/ihrisko-maly-slavin', '', '', '', 1, 0, '2012-12-22 12:02:57', '0000-00-00 00:00:00'),
(188, 'http://www.discgolf.sk/component/content/article/18-reportaz/o-discgolfe/linky-na-stranky', '', '', '', 1, 0, '2012-12-22 12:02:57', '0000-00-00 00:00:00'),
(189, 'http://www.discgolf.sk/component/content/article/18-reportaz/component/mailto/?tmpl=component&template=tx_freemium&link=2c532a152b80b83b75d71d7e10c426d8b409008d', '', '', '', 1, 0, '2012-12-22 12:02:57', '0000-00-00 00:00:00'),
(190, 'http://www.discgolf.sk/component/content/article/18-reportaz/o-discgolfe/disky', '', '', '', 1, 0, '2012-12-22 12:02:58', '0000-00-00 00:00:00'),
(191, 'http://www.discgolf.sk/component/content/article/18-reportaz/galeria/fotky', '', '', '', 1, 0, '2012-12-22 12:02:58', '0000-00-00 00:00:00'),
(192, 'http://www.discgolf.sk/component/content/article/18-reportaz/ihriska/ihrisko-makov', '', '', '', 1, 0, '2012-12-22 12:02:58', '0000-00-00 00:00:00'),
(193, 'http://www.discgolf.sk/ihriska/galeria', '', '', '', 1, 0, '2012-12-22 12:03:02', '0000-00-00 00:00:00'),
(194, 'http://www.discgolf.sk/ihriska/component/mailto/?tmpl=component&template=tx_freemium&link=7c8760ea5e3d99a371863c4d1788daf545f897ba', '', '', '', 1, 0, '2012-12-22 12:03:03', '0000-00-00 00:00:00'),
(195, 'http://www.discgolf.sk/ihriska/galeria/fotky', '', '', '', 1, 0, '2012-12-22 12:03:03', '0000-00-00 00:00:00'),
(196, 'http://www.discgolf.sk/ihriska/kontakt', '', '', '', 2, 0, '2012-12-22 12:03:03', '0000-00-00 00:00:00'),
(197, 'http://www.discgolf.sk/ihriska/ihriska/ihrisko-maly-slavin', '', '', '', 1, 0, '2012-12-22 12:03:03', '0000-00-00 00:00:00'),
(198, 'http://www.discgolf.sk/ihriska/ihriska/ihrisko-maly-slavin?tmpl=component&print=1&page=', '', '', '', 1, 0, '2012-12-22 12:03:03', '0000-00-00 00:00:00'),
(199, 'http://www.discgolf.sk/ihriska/o-discgolfe/disky', '', '', '', 1, 0, '2012-12-22 12:03:04', '0000-00-00 00:00:00'),
(200, 'http://www.discgolf.sk/ihriska/o-discgolfe', '', '', '', 1, 0, '2012-12-22 12:03:04', '0000-00-00 00:00:00'),
(201, 'http://www.discgolf.sk/ihriska/sutaze', '', '', '', 1, 0, '2012-12-22 12:03:04', '0000-00-00 00:00:00'),
(202, 'http://www.discgolf.sk/ihriska/ihriska/ihrisko-makov', '', '', '', 1, 0, '2012-12-22 12:03:04', '0000-00-00 00:00:00'),
(203, 'http://www.discgolf.sk/ihriska/ihriska/chcete-ihrisko', '', '', '', 1, 0, '2012-12-22 12:03:05', '0000-00-00 00:00:00'),
(204, 'http://www.discgolf.sk/ihriska/o-discgolfe/linky-na-stranky', '', '', '', 1, 0, '2012-12-22 12:03:07', '0000-00-00 00:00:00'),
(205, 'http://www.discgolf.sk/ihriska/ihriska', '', '', '', 1, 0, '2012-12-22 12:03:08', '0000-00-00 00:00:00'),
(206, 'http://www.discgolf.sk/ihriska/galeria/videa', '', '', '', 1, 0, '2012-12-22 12:03:08', '0000-00-00 00:00:00'),
(207, 'http://www.discgolf.sk/ihriska/nase-sluzby', '', '', '', 2, 0, '2012-12-22 12:03:08', '0000-00-00 00:00:00'),
(208, 'http://www.discgolf.sk/ihriska/ihriska/discgolf-camp', '', '', '', 1, 0, '2012-12-22 12:03:08', '0000-00-00 00:00:00'),
(209, 'http://www.discgolf.sk/galeria/galeria/videa', '', '', '', 1, 0, '2012-12-22 12:03:16', '0000-00-00 00:00:00'),
(210, 'http://www.discgolf.sk/galeria/o-discgolfe/linky-na-stranky', '', '', '', 1, 0, '2012-12-22 12:03:17', '0000-00-00 00:00:00'),
(211, 'http://www.discgolf.sk/galeria/o-discgolfe', '', '', '', 1, 0, '2012-12-22 12:03:17', '0000-00-00 00:00:00'),
(212, 'http://www.discgolf.sk/galeria/kontakt', '', '', '', 2, 0, '2012-12-22 12:03:17', '0000-00-00 00:00:00'),
(213, 'http://www.discgolf.sk/galeria/ihriska/ihrisko-maly-slavin', '', '', '', 1, 0, '2012-12-22 12:03:17', '0000-00-00 00:00:00'),
(214, 'http://www.discgolf.sk/galeria/ihriska/ihrisko-makov', '', '', '', 1, 0, '2012-12-22 12:03:18', '0000-00-00 00:00:00'),
(215, 'http://www.discgolf.sk/galeria/galeria/videa?tmpl=component&print=1&page=', '', '', '', 1, 0, '2012-12-22 12:03:18', '0000-00-00 00:00:00'),
(216, 'http://www.discgolf.sk/galeria/ihriska/discgolf-camp', '', '', '', 1, 0, '2012-12-22 12:03:18', '0000-00-00 00:00:00'),
(217, 'http://www.discgolf.sk/galeria/sutaze', '', '', '', 1, 0, '2012-12-22 12:03:18', '0000-00-00 00:00:00'),
(218, 'http://www.discgolf.sk/galeria/galeria/fotky', '', '', '', 1, 0, '2012-12-22 12:03:19', '0000-00-00 00:00:00'),
(219, 'http://www.discgolf.sk/galeria/galeria', '', '', '', 1, 0, '2012-12-22 12:03:19', '0000-00-00 00:00:00'),
(220, 'http://www.discgolf.sk/galeria/o-discgolfe/disky', '', '', '', 1, 0, '2012-12-22 12:03:19', '0000-00-00 00:00:00'),
(221, 'http://www.discgolf.sk/galeria/nase-sluzby', '', '', '', 2, 0, '2012-12-22 12:03:19', '0000-00-00 00:00:00'),
(222, 'http://www.discgolf.sk/galeria/component/mailto/?tmpl=component&template=tx_freemium&link=4f5cb23b3e0aa91c75c8a7fd83648057efdc702d', '', '', '', 1, 0, '2012-12-22 12:03:23', '0000-00-00 00:00:00'),
(223, 'http://www.discgolf.sk/galeria/ihriska/chcete-ihrisko', '', '', '', 1, 0, '2012-12-22 12:03:23', '0000-00-00 00:00:00'),
(224, 'http://www.discgolf.sk/galeria/ihriska', '', '', '', 1, 0, '2012-12-22 12:03:23', '0000-00-00 00:00:00'),
(225, 'http://www.discgolf.sk/galeria/galeria/fotky?tmpl=component&print=1&page=', '', '', '', 1, 0, '2012-12-22 12:03:23', '0000-00-00 00:00:00'),
(226, 'http://www.discgolf.sk/galeria/component/mailto/?tmpl=component&template=tx_freemium&link=d12c1bdfac97655230f2489c5d451f087e82cf3c', '', '', '', 1, 0, '2012-12-22 12:03:24', '0000-00-00 00:00:00'),
(227, 'http://www.discgolf.sk/component/content/article/18-reportaz/component/mailto/?tmpl=component&template=tx_freemium&link=2f00902e40c098b4a58d668e04e64b893feea936', '', '', '', 1, 0, '2012-12-22 12:03:25', '0000-00-00 00:00:00'),
(228, 'http://www.discgolf.sk/ipb/', '', '', '', 4, 0, '2012-12-26 05:52:45', '0000-00-00 00:00:00'),
(229, 'http://www.discgolf.sk/forum/', '', '', '', 4, 0, '2012-12-26 05:52:45', '0000-00-00 00:00:00'),
(230, 'http://discgolf.sk/2010.html', '', '', '', 2, 0, '2013-01-01 19:29:33', '0000-00-00 00:00:00'),
(231, 'http://discgolf.sk/modules/mod_templ/mod_templ.php', '', '', '', 1, 0, '2013-01-07 18:08:25', '0000-00-00 00:00:00'),
(232, 'http://discgolf.sk/images/mod_system.php', '', '', '', 1, 0, '2013-01-08 18:47:41', '0000-00-00 00:00:00'),
(233, 'http://discgolf.sk/sandberg2007.html', '', '', '', 5, 0, '2013-01-09 00:24:57', '0000-00-00 00:00:00'),
(234, 'http://discgolf.sk/images/system.php', '', '', '', 2, 0, '2013-01-10 02:39:21', '0000-00-00 00:00:00'),
(235, 'http://discgolf.sk//images/stories/susu.php?indonesia', '', '', '', 6, 0, '2013-01-10 10:16:39', '0000-00-00 00:00:00'),
(236, 'http://discgolf.sk/images/stories/gg.php', '', '', '', 1, 0, '2013-01-13 09:45:23', '0000-00-00 00:00:00'),
(237, 'http://discgolf.sk/templates/index.old.php?comment=cGhwaW5mbygpOw==', '', '', '', 3, 0, '2013-01-15 21:49:18', '0000-00-00 00:00:00'),
(238, 'http://discgolf.sk/user/login/index.php', '', '', '', 1, 0, '2013-01-19 18:19:58', '0000-00-00 00:00:00'),
(239, 'http://discgolf.sk//images/stories/story.php?p1=phpinfo();', '', '', '', 7, 0, '2013-01-20 06:33:29', '0000-00-00 00:00:00'),
(240, 'http://discgolf.sk/phpmyadmin/scripts/setup.php', '', 'http://discgolf.sk/phpmyadmin/scripts/setup.php', '', 2, 0, '2013-01-21 10:17:55', '0000-00-00 00:00:00'),
(241, 'http://discgolf.sk/images/captions/ihrisko_foto_kuchyna/obrázok', '', '', '', 1, 0, '2013-01-23 10:56:10', '0000-00-00 00:00:00'),
(242, 'http://forum.discgolf.sk/forum/index.php', '', 'http://forum.discgolf.sk/forum/index.php', '', 1, 0, '2013-01-23 21:09:31', '0000-00-00 00:00:00'),
(243, 'http://forum.discgolf.sk/phpbb/index.php', '', 'http://forum.discgolf.sk/phpbb/index.php', '', 1, 0, '2013-01-23 21:09:32', '0000-00-00 00:00:00'),
(244, 'http://forum.discgolf.sk/phpbb2/index.php', '', 'http://forum.discgolf.sk/phpbb2/index.php', '', 1, 0, '2013-01-23 21:09:32', '0000-00-00 00:00:00'),
(245, 'http://forum.discgolf.sk/forums/index.php', '', 'http://forum.discgolf.sk/forums/index.php', '', 1, 0, '2013-01-23 21:09:33', '0000-00-00 00:00:00'),
(246, 'http://forum.discgolf.sk/board/index.php', '', 'http://forum.discgolf.sk/board/index.php', '', 1, 0, '2013-01-23 21:09:33', '0000-00-00 00:00:00'),
(247, 'http://discgolf.sk/components/com_oziogallery2/imagin/scripts_ralcr/filesystem/writeToFile.php', '', 'none', '', 3, 0, '2013-01-24 10:16:08', '0000-00-00 00:00:00'),
(248, 'http://discgolf.sk/images/pst.php', '', 'http://discgolf.sk', '', 3, 0, '2013-01-24 10:16:09', '0000-00-00 00:00:00'),
(249, 'http://discgolf.sk/administrator/index.old.php?comment=cGhwaW5mbygpOw==', '', '', '', 1, 0, '2013-01-28 00:54:49', '0000-00-00 00:00:00'),
(250, 'http://discgolf.sk/images/stories/story.php', '', '', '', 1, 0, '2013-01-28 21:26:59', '0000-00-00 00:00:00'),
(251, 'http://discgolf.sk//images/stories/x.php?indonesia', '', '', '', 1, 0, '2013-01-29 21:59:18', '0000-00-00 00:00:00'),
(252, 'http://discgolf.sk/images/stories/x.php?indonesia', '', '', '', 5, 0, '2013-01-30 04:29:04', '0000-00-00 00:00:00'),
(253, 'http://www.discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form', '', '', '', 1, 0, '2013-02-03 08:37:46', '0000-00-00 00:00:00'),
(254, 'http://discgolf.sk/"https://sites.google.com/site/regnadgtur/results/msrmakov2012"', '', '', '', 1, 0, '2013-02-10 10:52:03', '0000-00-00 00:00:00'),
(255, 'http://discgolf.sk/"index.php?option=com_content&view=article&id=49&catid=18">Reportáž', '', '', '', 1, 0, '2013-02-10 10:52:04', '0000-00-00 00:00:00'),
(256, 'http://www.discgolf.sk/phpmyadmin/index.php', '', '', '', 1, 0, '2013-02-10 21:37:17', '0000-00-00 00:00:00'),
(257, 'http://discgolf.sk/components/com_user/views/reset/mod.php', '', '', '', 10, 0, '2013-02-17 04:50:21', '0000-00-00 00:00:00'),
(258, 'http://discgolf.sk/images/stories/ll.php', '', '', '', 2, 0, '2013-02-19 07:16:33', '0000-00-00 00:00:00'),
(259, 'http://discgolf.sk//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20', '', '', '', 6, 0, '2013-02-20 03:18:48', '0000-00-00 00:00:00'),
(260, 'http://discgolf.sk//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743', '', '', '', 2, 0, '2013-02-20 03:18:49', '0000-00-00 00:00:00'),
(261, 'http://discgolf.sk//images/stories/gif.php?p1=phpinfo();', '', '', '', 4, 0, '2013-02-20 14:27:29', '0000-00-00 00:00:00'),
(262, 'http://discgolf.sk/myadmin/scripts/setup.php', '', 'http://discgolf.sk/myadmin/scripts/setup.php', '', 1, 0, '2013-02-23 06:29:31', '0000-00-00 00:00:00'),
(263, 'http://www.discgolf.sk/sign_up.html', '', 'http://www.discgolf.sk/', '', 4, 0, '2013-02-26 16:23:17', '0000-00-00 00:00:00'),
(264, 'http://www.discgolf.sk/forums/index.php?action=registernew', '', 'http://www.discgolf.sk/', '', 4, 0, '2013-02-26 16:23:44', '0000-00-00 00:00:00'),
(265, 'http://www.discgolf.sk/index.php?option=com_registration&task=register', '', 'http://www.discgolf.sk/index.php?option=com_registration&task=register', '', 8, 0, '2013-02-26 16:23:46', '0000-00-00 00:00:00'),
(266, 'http://www.discgolf.sk/profile.php?mode=register&agreed=true&coppa=0', '', 'http://www.discgolf.sk/profile.php?mode=register', '', 4, 0, '2013-02-26 16:23:59', '0000-00-00 00:00:00'),
(267, 'http://www.discgolf.sk//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20', '', '', '', 2, 0, '2013-02-27 09:24:04', '0000-00-00 00:00:00'),
(268, 'http://www.discgolf.sk//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743', '', '', '', 1, 0, '2013-02-27 09:24:05', '0000-00-00 00:00:00'),
(269, 'http://www.discgolf.sk/wp-login.php', '', 'http://www.discgolf.sk/wp-login.php', '', 21, 0, '2013-03-01 06:37:33', '0000-00-00 00:00:00'),
(270, 'http://discgolf.sk/index.php?option=com_fabrik&c=import&view=import&filetype=csv&table=1', '', '', '', 1, 0, '2013-03-05 11:51:34', '0000-00-00 00:00:00'),
(271, 'http://www.discgolf.sk/login.php', '', '', '', 8, 0, '2013-03-07 21:29:36', '0000-00-00 00:00:00'),
(272, 'http://www.discgolf.sk/member.php?mod=logging&action=login', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:29:37', '0000-00-00 00:00:00'),
(273, 'http://www.discgolf.sk/member.php?mod=register', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:29:41', '0000-00-00 00:00:00'),
(274, 'http://www.discgolf.sk/modules.php?app=user_reg', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:29:50', '0000-00-00 00:00:00'),
(275, 'http://www.discgolf.sk/logging.php?action=login', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:29:58', '0000-00-00 00:00:00'),
(276, 'http://www.discgolf.sk/login.php?action=quit', '', '', '', 2, 0, '2013-03-07 21:30:06', '0000-00-00 00:00:00'),
(277, 'http://www.discgolf.sk/member/index_do.php?fmdo=user&dopost=regnew', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:30:43', '0000-00-00 00:00:00'),
(278, 'http://www.discgolf.sk/post.php', '', '', '', 1, 0, '2013-03-07 21:31:03', '0000-00-00 00:00:00'),
(279, 'http://www.discgolf.sk/login.php?part=register', '', 'http://www.discgolf.sk/', '', 1, 0, '2013-03-07 21:31:41', '0000-00-00 00:00:00'),
(280, 'http://www.discgolf.sk/site/signup.php', '', 'http://www.discgolf.sk/', '', 2, 0, '2013-03-07 21:31:42', '0000-00-00 00:00:00'),
(281, 'http://discgolf.sk//templates/beez/index.php', '', '', '', 1, 0, '2013-03-10 02:22:14', '0000-00-00 00:00:00'),
(282, 'http://discgolf.sk/upload.php', '', '', '', 1, 0, '2013-03-10 05:17:51', '0000-00-00 00:00:00'),
(283, 'http://discgolf.sk/index.php?option=com_kunena&func=fbprofile''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/f', '', 'http://www.google.com/', '', 1, 0, '2013-03-12 12:15:53', '0000-00-00 00:00:00'),
(284, 'http://discgolf.sk/index.php?option=com_fireboard&Itemid=29''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/fro', '', 'http://www.google.com/', '', 1, 0, '2013-03-12 12:18:23', '0000-00-00 00:00:00'),
(285, 'http://discgolf.sk/ihriska.html', '', '', '', 4, 0, '2013-03-12 13:31:16', '0000-00-00 00:00:00'),
(286, 'http://discgolf.sk/index.php?option=com_fabrik&c=import&view=import&filetype=csv&tableid=1', '', 'http://discgolf.sk/index.php?option=com_fabrik&c=import&view=import&filetype=csv&tableid=1', '', 2, 0, '2013-03-13 04:03:56', '0000-00-00 00:00:00'),
(287, 'http://discgolf.sk/tmp/php.class.php?token=up', '', '', '', 2, 0, '2013-03-13 13:59:38', '0000-00-00 00:00:00'),
(288, 'http://discgolf.sk/LICESNE.php', '', '', '', 1, 0, '2013-03-13 17:48:55', '0000-00-00 00:00:00'),
(289, 'http://discgolf.sk/index.php?option=com_alphacontent&section=4''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/', '', 'http://www.google.com/', '', 1, 0, '2013-03-14 00:00:42', '0000-00-00 00:00:00'),
(290, 'http://discgolf.sk/language/en-GB/en_GB.php?en=phpinfo();', '', '', '', 1, 0, '2013-03-14 01:33:27', '0000-00-00 00:00:00'),
(291, 'http://discgolf.sk/components/com_banners/setting.php?en=phpinfo();', '', '', '', 1, 0, '2013-03-14 01:33:27', '0000-00-00 00:00:00'),
(292, 'http://discgolf.sk/components/com_wrapper/wraper.php?en=phpinfo();', '', '', '', 1, 0, '2013-03-14 01:33:27', '0000-00-00 00:00:00'),
(293, 'http://discgolf.sk/libraries/phputf8/phputf8.php?en=phpinfo();', '', '', '', 1, 0, '2013-03-14 01:33:27', '0000-00-00 00:00:00'),
(294, 'http://discgolf.sk/modules/mod_archive/tmpl/index.php?en=phpinfo();', '', '', '', 1, 0, '2013-03-14 01:33:28', '0000-00-00 00:00:00'),
(295, 'http://discgolf.sk/index.php?option=com_linx&Itemid=101''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/from/**', '', 'http://www.google.com/', '', 1, 0, '2013-03-14 07:41:32', '0000-00-00 00:00:00'),
(296, 'http://discgolf.sk/language/en-GB/language.php', '', '', '', 1, 0, '2013-03-14 10:05:46', '0000-00-00 00:00:00'),
(297, 'http://discgolf.sk/images/stories/jquery.php', '', '', '', 1, 0, '2013-03-14 10:05:47', '0000-00-00 00:00:00'),
(298, 'http://discgolf.sk/images/stories/susu.php?indonesia', '', '', '', 1, 0, '2013-03-14 12:58:28', '0000-00-00 00:00:00'),
(299, 'http://discgolf.sk/images/stories/joomla.class.php?pass=FgYuD@37', '', '', '', 2, 0, '2013-03-14 16:46:49', '0000-00-00 00:00:00'),
(300, 'http://discgolf.sk/images/joomla.class.php?pass=FgYuD@37', '', '', '', 1, 0, '2013-03-14 16:46:52', '0000-00-00 00:00:00'),
(301, 'http://discgolf.sk/tmp/joomla.class.php?pass=FgYuD@37', '', '', '', 1, 0, '2013-03-14 16:46:52', '0000-00-00 00:00:00'),
(302, 'http://discgolf.sk/images/stories/story.php?p1=phpinfo();', '', '', '', 1, 0, '2013-03-15 01:33:13', '0000-00-00 00:00:00'),
(303, 'http://discgolf.sk/images/stories/0day.php', '', '', '', 3, 0, '2013-03-15 03:03:40', '0000-00-00 00:00:00'),
(304, 'http://discgolf.sk/images/stories/gif.php?p1=phpinfo();', '', '', '', 1, 0, '2013-03-15 04:17:04', '0000-00-00 00:00:00'),
(305, 'http://discgolf.sk/index.php?option=com_content&view=article&id=71&Itemid=79''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(ra', '', 'http://www.google.com/', '', 1, 0, '2013-03-16 09:08:49', '0000-00-00 00:00:00'),
(306, 'http://www.discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20', '', '', '', 5, 0, '2013-03-16 11:29:08', '0000-00-00 00:00:00'),
(307, 'http://discgolf.sk/index.php?option=com_phocagallery&view=categories&Itemid=68''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(', '', 'http://www.google.com/', '', 1, 0, '2013-03-17 15:43:54', '0000-00-00 00:00:00'),
(308, 'http://discgolf.sk/index.php?option=com_rsmonials&Itemid=30''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/fro', '', 'http://www.google.com/', '', 1, 0, '2013-03-17 20:46:05', '0000-00-00 00:00:00'),
(309, 'http://discgolf.sk/index.php?option=com_periodicos&task=mostrarNoticiasCategoria&catid=0''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0', '', 'http://www.google.com/', '', 1, 0, '2013-03-19 06:09:25', '0000-00-00 00:00:00'),
(310, 'http://discgolf.sk/modules/mod_feed/help.php?ghst', '', '', '', 1, 0, '2013-03-19 21:56:17', '0000-00-00 00:00:00'),
(311, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo27.html', '', '', '', 1, 0, '2013-03-24 09:04:29', '0000-00-00 00:00:00'),
(312, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo19.html', '', '', '', 1, 0, '2013-03-24 09:05:09', '0000-00-00 00:00:00'),
(313, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo33.html', '', '', '', 1, 0, '2013-03-24 09:07:10', '0000-00-00 00:00:00'),
(314, 'http://www.discgolf.sk/budmerice2007.html', '', '', '', 6, 0, '2013-03-24 09:08:31', '0000-00-00 00:00:00'),
(315, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo6.html', '', '', '', 2, 0, '2013-03-24 09:09:11', '0000-00-00 00:00:00'),
(316, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo9.html', '', '', '', 2, 0, '2013-03-24 09:10:31', '0000-00-00 00:00:00'),
(317, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo28.html', '', '', '', 1, 0, '2013-03-24 09:11:12', '0000-00-00 00:00:00'),
(318, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo55.html', '', '', '', 1, 0, '2013-03-24 09:14:33', '0000-00-00 00:00:00'),
(319, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo2.html', '', '', '', 1, 0, '2013-03-24 09:15:13', '0000-00-00 00:00:00'),
(320, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo7.html', '', '', '', 1, 0, '2013-03-24 09:15:54', '0000-00-00 00:00:00'),
(321, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo23.html', '', '', '', 1, 0, '2013-03-24 09:16:34', '0000-00-00 00:00:00'),
(322, 'http://discgolf.sk/index.php?option=com_ezrealty&controller=properties&task=results&Itemid=11&type=1&cid=2&cnid=1&stid=1&locid=472&minprice=+(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x737', '', 'http://www.google.com/', '', 1, 0, '2013-03-26 08:21:19', '0000-00-00 00:00:00'),
(323, 'http://discgolf.sk/index.php?option=com_resmansearch&Itemid=71&lang=fr''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*', '', 'http://www.google.com/', '', 1, 0, '2013-03-29 14:32:24', '0000-00-00 00:00:00'),
(324, 'http://www.discgolf.sk/images/captions/ihrisko_foto_makov/img_79212', '', '', '', 2, 0, '2013-03-30 19:20:00', '0000-00-00 00:00:00'),
(325, 'http://discgolf.sk/index.php?option=com_editoruser&layout=editor_name&typename=pro''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),fl', '', 'http://www.google.com/', '', 1, 0, '2013-03-31 10:54:13', '0000-00-00 00:00:00'),
(326, 'http://discgolf.sk/index.php?option=com_mosforms&mosform=1''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/from', '', 'http://www.google.com/', '', 1, 0, '2013-04-01 01:53:57', '0000-00-00 00:00:00'),
(327, 'http://discgolf.sk/index.php?option=com_rsform&Itemid=50''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/**/from/*', '', 'http://www.google.com/', '', 1, 0, '2013-04-01 11:46:26', '0000-00-00 00:00:00'),
(328, 'http://discgolf.sk/index.php?option=com_k2&view=item&layout=item''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*2))x/*', '', 'http://www.google.com/', '', 1, 0, '2013-04-03 17:39:13', '0000-00-00 00:00:00'),
(329, 'http://discgolf.sk/index.php?view=detail&catid=2:tenne-events&id=15:hoellennacht-ii-krampuskraenzchen&option=com_simplecalendar&Itemid=63''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x737', '', 'http://www.google.com/', '', 1, 0, '2013-04-04 11:53:48', '0000-00-00 00:00:00'),
(330, 'http://www.discgolf.sk/manager/', '', '', '', 1, 0, '2013-04-04 18:41:10', '0000-00-00 00:00:00'),
(331, 'http://discgolf.sk/administrator/core.php', '', '', '', 1, 0, '2013-04-06 23:55:56', '0000-00-00 00:00:00'),
(332, 'http://discgolf.sk/components/config.php', '', '', '', 1, 0, '2013-04-06 23:55:57', '0000-00-00 00:00:00'),
(333, 'http://discgolf.sk/forum/include.php', '', '', '', 1, 0, '2013-04-06 23:55:57', '0000-00-00 00:00:00'),
(334, 'http://discgolf.sk/images/images.php', '', '', '', 2, 0, '2013-04-06 23:55:57', '0000-00-00 00:00:00'),
(335, 'http://discgolf.sk/includes/images.php', '', '', '', 1, 0, '2013-04-06 23:55:57', '0000-00-00 00:00:00'),
(336, 'http://discgolf.sk/language/stats.php', '', '', '', 1, 0, '2013-04-06 23:55:57', '0000-00-00 00:00:00'),
(337, 'http://discgolf.sk/libraries/web.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(338, 'http://discgolf.sk/logs/include.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(339, 'http://discgolf.sk/media/include.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(340, 'http://discgolf.sk/modules/application.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(341, 'http://discgolf.sk/plugins/config.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(342, 'http://discgolf.sk/remos_downloads/config.php', '', '', '', 1, 0, '2013-04-06 23:55:58', '0000-00-00 00:00:00'),
(343, 'http://discgolf.sk/templates/version.php', '', '', '', 1, 0, '2013-04-06 23:55:59', '0000-00-00 00:00:00'),
(344, 'http://discgolf.sk/tmp/info.php', '', '', '', 1, 0, '2013-04-06 23:55:59', '0000-00-00 00:00:00'),
(345, 'http://discgolf.sk/xmlrpc/version.php', '', '', '', 1, 0, '2013-04-06 23:55:59', '0000-00-00 00:00:00');
INSERT INTO `b0e2j_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES (346, 'http://www.discgolf.sk/cache/0f50bbdfb8cb0aa015c90b22af8fd7a4', '', 'http://www.discgolf.sk/', '', 1, 0, '2013-04-07 20:06:28', '0000-00-00 00:00:00'),
(347, 'http://www.discgolf.sk/ihriska/cache/0f50bbdfb8cb0aa015c90b22af8fd7a4', '', 'http://www.discgolf.sk/ihriska/ihrisko-maly-slavin', '', 1, 0, '2013-04-07 20:06:43', '0000-00-00 00:00:00'),
(348, 'http://discgolf.sk/index.php?option=com_jevents&task=icalrepeat.detail''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746f72/**/limit/**/0,1),floor(rand(0)*', '', 'http://www.google.com/', '', 1, 0, '2013-04-08 20:19:57', '0000-00-00 00:00:00'),
(349, 'http://discgolf.sk/index.php?option=com_s5clanroster&view=s5clanroster&layout=category&task=category&id=9''and(select/**/1/**/from(select/**/count(*),concat((select/**/username/**/from/**/jos_users/**/where/**/usertype=0x73757065722061646d696e6973747261746', '', 'http://www.google.com/', '', 1, 0, '2013-04-08 20:24:00', '0000-00-00 00:00:00'),
(350, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo45.html', '', '', '', 1, 0, '2013-04-16 19:02:28', '0000-00-00 00:00:00'),
(351, 'http://www.discgolf.sk/budmerice2008.html', '', '', '', 8, 0, '2013-04-20 05:41:11', '0000-00-00 00:00:00'),
(352, 'http://discgolf.sk/images/xxx.php?cmd=ls', '', '', '', 1, 0, '2013-04-21 11:30:40', '0000-00-00 00:00:00'),
(353, 'http://discgolf.sk/modules/mod_google/mod_google.php', '', 'http://discgolf.sk/modules/mod_google/mod_google.php', '', 2, 0, '2013-04-26 21:28:08', '0000-00-00 00:00:00'),
(354, 'http://discgolf.sk/modules/mod_dbrestore/mod_dbrestore.php', '', 'http://discgolf.sk/modules/mod_dbrestore/mod_dbrestore.php', '', 5, 0, '2013-04-27 03:49:06', '0000-00-00 00:00:00'),
(355, 'http://discgolf.sk/modules/mod_modules/mod_modules.php', '', 'http://discgolf.sk/modules/mod_modules/mod_modules.php', '', 3, 0, '2013-04-27 20:25:03', '0000-00-00 00:00:00'),
(356, 'http://discgolf.sk/modules/ss/ss.php', '', 'http://discgolf.sk/modules/ss/ss.php', '', 2, 0, '2013-04-28 07:42:11', '0000-00-00 00:00:00'),
(357, 'http://discgolf.sk/index.php?option=com_rsfiles&view=files&layout=agreement&tmpl=component&cid=1/**/and/**/1=0/**/union select 1,concat(0x78736962,CONCAT_WS(CHAR(58),username,password,null),0x78736965)/**/from/**/jos_users/**/where/**/usertype=0x737570657', '', 'http://www.google.com/', '', 1, 0, '2013-04-29 20:47:02', '0000-00-00 00:00:00'),
(358, 'http://discgolf.sk/images/rialamunas.php', '', 'http://discgolf.sk/images/rialamunas.php', '', 1, 0, '2013-05-02 04:06:39', '0000-00-00 00:00:00'),
(359, 'http://www.discgolf.sk/images/stories/story.php', '', 'http://www.discgolf.sk/images/stories/story.php', '', 1, 0, '2013-05-02 11:16:20', '0000-00-00 00:00:00'),
(360, 'http://www.discgolf.sk/images/stories/gif.php', '', 'http://www.discgolf.sk/images/stories/gif.php', '', 1, 0, '2013-05-02 15:58:35', '0000-00-00 00:00:00'),
(361, 'http://discgolf.sk/images/stories/images/x.php', '', '', '', 1, 0, '2013-05-07 07:17:31', '0000-00-00 00:00:00'),
(362, 'http://discgolf.sk/components/p.php', '', '', '', 1, 0, '2013-05-07 18:30:34', '0000-00-00 00:00:00'),
(363, 'http://discgolf.sk/modules/mod_jevents_cal/helper.php', '', 'http://discgolf.sk/modules/mod_jevents_cal/helper.php', '', 2, 0, '2013-05-09 04:30:19', '0000-00-00 00:00:00'),
(364, 'http://discgolf.sk/components/com_ad_google/index.php', '', 'http://discgolf.sk/components/com_ad_google/index.php', '', 1, 0, '2013-05-09 11:42:57', '0000-00-00 00:00:00'),
(365, 'http://www.discgolf.sk//wp-login.php', '', '', '', 2, 0, '2013-05-10 18:35:03', '0000-00-00 00:00:00'),
(366, 'http://discgolf.sk/modules/mod_sape/mod_sape.php', '', 'http://discgolf.sk/modules/mod_sape/mod_sape.php', '', 2, 0, '2013-05-11 02:53:53', '0000-00-00 00:00:00'),
(367, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo5.html', '', '', '', 1, 0, '2013-05-11 15:45:56', '0000-00-00 00:00:00'),
(368, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo1.html', '', '', '', 1, 0, '2013-05-11 15:46:01', '0000-00-00 00:00:00'),
(369, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo8.html', '', '', '', 1, 0, '2013-05-11 15:46:11', '0000-00-00 00:00:00'),
(370, 'http://discgolf.sk/admin/login/', '', '', '', 3, 0, '2013-05-13 23:32:06', '0000-00-00 00:00:00'),
(371, 'http://discgolf.sk/erp/main/login/', '', '', '', 1, 0, '2013-05-13 23:32:07', '0000-00-00 00:00:00'),
(372, 'http://discgolf.sk/admin/', '', '', '', 5, 0, '2013-05-13 23:32:07', '0000-00-00 00:00:00'),
(373, 'http://discgolf.sk/admin', '', '', '', 4, 0, '2013-05-13 23:32:08', '0000-00-00 00:00:00'),
(374, 'http://discgolf.sk/registracia/stratene-heslo', '', '', '', 1, 0, '2013-05-13 23:32:09', '0000-00-00 00:00:00'),
(375, 'http://discgolf.sk/asdoqjwojSKSsiowi', '', '', '', 4, 0, '2013-05-13 23:32:13', '0000-00-00 00:00:00'),
(376, 'http://discgolf.sk/administrator/asdoqjwojSKSsiowi', '', '', '', 1, 0, '2013-05-13 23:32:15', '0000-00-00 00:00:00'),
(377, 'http://discgolf.sk/admin/login.php', '', '', '', 1, 0, '2013-05-13 23:32:16', '0000-00-00 00:00:00'),
(378, 'http://www.discgolf.sk/tmp/j.php', '', 'http://www.discgolf.sk/tmp/j.php', '', 1, 0, '2013-05-17 08:46:32', '0000-00-00 00:00:00'),
(379, 'http://www.discgolf.sk/images/j.php', '', 'http://www.discgolf.sk/images/j.php', '', 1, 0, '2013-05-22 03:19:11', '0000-00-00 00:00:00'),
(380, 'http://discgolf.sk/wp-admin', '', '', '', 4, 0, '2013-05-28 05:09:35', '0000-00-00 00:00:00'),
(381, 'http://discgolf.sk/xmlrpc.php', '', '', '', 2, 0, '2013-06-08 15:00:33', '0000-00-00 00:00:00'),
(382, 'http://www.discgolf.sk//plugins/system/nnframework/index.html', '', '', '', 1, 0, '2013-06-13 17:37:27', '0000-00-00 00:00:00'),
(383, 'http://discgolf.sk/odiscgolfe.html', '', '', '', 2, 0, '2013-06-15 14:48:35', '0000-00-00 00:00:00'),
(384, 'http://www.discgolf.sk/member/reg.php', '', '', '', 1, 0, '2013-06-20 06:45:53', '0000-00-00 00:00:00'),
(385, 'http://discgolf.sk/index.php?option=com_user&view=register&lang=ru', '', '', '', 1, 0, '2013-06-23 02:47:40', '0000-00-00 00:00:00'),
(386, 'http://discgolf.sk/https://sites.google.com/site/regnadgtur/makov-2013', '', '', '', 2, 0, '2013-06-25 12:49:59', '0000-00-00 00:00:00'),
(387, 'http://discgolf.sk/https://sites.google.com/site/regnadgtur/results', '', '', '', 2, 0, '2013-06-25 12:50:01', '0000-00-00 00:00:00'),
(388, 'http://discgolf.sk/media/system/media.php', '', '', '', 1, 0, '2013-06-26 18:20:14', '0000-00-00 00:00:00'),
(389, 'http://discgolf.sk/foto.html', '', '', '', 2, 0, '2013-06-26 18:29:42', '0000-00-00 00:00:00'),
(390, 'http://discgolf.sk//administrator/components/com_contact/pp1.php', '', '', '', 1, 0, '2013-06-27 19:41:00', '0000-00-00 00:00:00'),
(391, 'http://discgolf.sk/wp-conf.php', '', '', '', 2, 0, '2013-06-29 20:01:35', '0000-00-00 00:00:00'),
(392, 'http://discgolf.sk/budmerice.html', '', '', '', 2, 0, '2013-06-30 20:01:57', '0000-00-00 00:00:00'),
(393, 'http://discgolf.sk/gerulata.html', '', '', '', 2, 0, '2013-06-30 21:09:00', '0000-00-00 00:00:00'),
(394, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/makov-2013', '', '', '', 1, 0, '2013-07-02 07:22:28', '0000-00-00 00:00:00'),
(395, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/results', '', '', '', 2, 0, '2013-07-02 07:22:29', '0000-00-00 00:00:00'),
(396, 'http://www.discgolf.sk/sutaze/https://www.google.com/calendar/embed?src=9cf595d2mjj8b55k264220jcms@group.calendar.google.com&ctz=Europe/Prague', '', '', '', 2, 0, '2013-07-02 07:22:30', '0000-00-00 00:00:00'),
(397, 'http://www.discgolf.sk/sutaze/kalendar-domacich-a-zahranicnych-turnajov/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:22:36', '0000-00-00 00:00:00'),
(398, 'http://www.discgolf.sk/sutaze/svk-ranking/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:22:37', '0000-00-00 00:00:00'),
(399, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:22:37', '0000-00-00 00:00:00'),
(400, 'http://www.discgolf.sk//https://sites.google.com/site/regnadgtur/results', '', '', '', 2, 0, '2013-07-02 07:22:49', '0000-00-00 00:00:00'),
(401, 'http://www.discgolf.sk/sutaze/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:22:52', '0000-00-00 00:00:00'),
(402, 'http://www.discgolf.sk/ihriska/ihrisko-maly-slavin/https://sites.google.com/site/discgolfovaliga', '', '', '', 2, 0, '2013-07-02 07:22:54', '0000-00-00 00:00:00'),
(403, 'http://www.discgolf.sk/sutaze/kalendar-domacich-a-zahranicnych-turnajov/https://www.google.com/calendar/embed?src=9cf595d2mjj8b55k264220jcms@group.calendar.google.com&ctz=Europe/Prague', '', '', '', 2, 0, '2013-07-02 07:22:54', '0000-00-00 00:00:00'),
(404, 'http://www.discgolf.sk/sutaze/svk-ranking/https://docs.google.com/spreadsheet/ccc?key=0Ao34P7n7tY9cdDJVa0RGQkdjb3B0NkdJMmVMc2lQU2c', '', '', '', 2, 0, '2013-07-02 07:22:55', '0000-00-00 00:00:00'),
(405, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://sites.google.com/site/vysledkymsrdg2010', '', '', '', 2, 0, '2013-07-02 07:22:55', '0000-00-00 00:00:00'),
(406, 'http://www.discgolf.sk/18-reportaz/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:22:58', '0000-00-00 00:00:00'),
(407, 'http://www.discgolf.sk//https://sites.google.com/site/regnadgtur/results/msrmakov2012', '', '', '', 2, 0, '2013-07-02 07:22:58', '0000-00-00 00:00:00'),
(408, 'http://www.discgolf.sk/2-uncategorised/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:08', '0000-00-00 00:00:00'),
(409, 'http://www.discgolf.sk/galeria/fotky/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:10', '0000-00-00 00:00:00'),
(410, 'http://www.discgolf.sk/galeria/videa/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:11', '0000-00-00 00:00:00'),
(411, 'http://www.discgolf.sk/ihriska/chcete-ihrisko/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:11', '0000-00-00 00:00:00'),
(412, 'http://www.discgolf.sk/ihriska/discgolf-camp/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:11', '0000-00-00 00:00:00'),
(413, 'http://www.discgolf.sk/ihriska/ihrisko-makov/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:12', '0000-00-00 00:00:00'),
(414, 'http://www.discgolf.sk/ihriska/ihrisko-maly-slavin/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:12', '0000-00-00 00:00:00'),
(415, 'http://www.discgolf.sk/o-discgolfe/disky/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:13', '0000-00-00 00:00:00'),
(416, 'http://www.discgolf.sk/o-discgolfe/linky-na-stranky/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:13', '0000-00-00 00:00:00'),
(417, 'http://www.discgolf.sk/sutaze/kalendar-domacich-a-zahranicnych-turnajov/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:14', '0000-00-00 00:00:00'),
(418, 'http://www.discgolf.sk/sutaze/svk-ranking/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:14', '0000-00-00 00:00:00'),
(419, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://sites.google.com/site/regnadgtur/results', '', '', '', 2, 0, '2013-07-02 07:23:14', '0000-00-00 00:00:00'),
(420, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:15', '0000-00-00 00:00:00'),
(421, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:16', '0000-00-00 00:00:00'),
(422, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:18', '0000-00-00 00:00:00'),
(423, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:19', '0000-00-00 00:00:00'),
(424, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:21', '0000-00-00 00:00:00'),
(425, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:22', '0000-00-00 00:00:00'),
(426, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:23', '0000-00-00 00:00:00'),
(427, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 2, 0, '2013-07-02 07:23:27', '0000-00-00 00:00:00'),
(428, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://sites.google.com/site/regnadgtur/results/budmerice-spring-fling-2011', '', '', '', 2, 0, '2013-07-02 07:23:29', '0000-00-00 00:00:00'),
(429, 'http://www.discgolf.sk/sutaze/vysledky-turnajov/https://sites.google.com/site/regnadgtur/results/smolenie-201', '', '', '', 2, 0, '2013-07-02 07:23:29', '0000-00-00 00:00:00'),
(430, 'http://www.discgolf.sk/component/content/article/18-reportaz/49-reporta-z-msr-2012/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:30', '0000-00-00 00:00:00'),
(431, 'http://www.discgolf.sk/component/content/article/18-reportaz/51-navsteva-u-juznych-susedov/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:30', '0000-00-00 00:00:00'),
(432, 'http://www.discgolf.sk/component/content/article/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:30', '0000-00-00 00:00:00'),
(433, 'http://www.discgolf.sk/component/content/article/18-reportaz/53-hugov-adventny-poharik/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:31', '0000-00-00 00:00:00'),
(434, 'http://www.discgolf.sk/component/content/article/18-reportaz/54-slovacka-tura-zimna-2013/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:31', '0000-00-00 00:00:00'),
(435, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:32', '0000-00-00 00:00:00'),
(436, 'http://www.discgolf.sk/component/content/article/18-reportaz/58-budmerice-spring-fling-2013/https://twitter.com/DiscGolfSR', '', '', '', 2, 0, '2013-07-02 07:23:32', '0000-00-00 00:00:00'),
(437, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013/https://docs.google.com/spreadsheet/ccc?key=0AvaX5urz29XsdG0zNy1XWUhlV29ReTUweWtGOFp5SGc', '', '', '', 2, 0, '2013-07-02 07:23:34', '0000-00-00 00:00:00'),
(438, 'http://www.discgolf.sk/component/content/article/18-reportaz/49-reporta-z-msr-2012/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:40', '0000-00-00 00:00:00'),
(439, 'http://www.discgolf.sk/component/content/article/18-reportaz/51-navsteva-u-juznych-susedov/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:40', '0000-00-00 00:00:00'),
(440, 'http://www.discgolf.sk/component/content/article/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:41', '0000-00-00 00:00:00'),
(441, 'http://www.discgolf.sk/component/content/article/18-reportaz/53-hugov-adventny-poharik/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:41', '0000-00-00 00:00:00'),
(442, 'http://www.discgolf.sk/component/content/article/18-reportaz/54-slovacka-tura-zimna-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:42', '0000-00-00 00:00:00'),
(443, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:42', '0000-00-00 00:00:00'),
(444, 'http://www.discgolf.sk/component/content/article/18-reportaz/58-budmerice-spring-fling-2013/https://sites.google.com/site/regnadgtur/results', '', '', '', 1, 0, '2013-07-02 07:23:43', '0000-00-00 00:00:00'),
(445, 'http://www.discgolf.sk/component/content/article/18-reportaz/58-budmerice-spring-fling-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:43', '0000-00-00 00:00:00'),
(446, 'http://www.discgolf.sk/18-reportaz/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:45', '0000-00-00 00:00:00'),
(447, 'http://www.discgolf.sk/2-uncategorised/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:48', '0000-00-00 00:00:00'),
(448, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:51', '0000-00-00 00:00:00'),
(449, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:52', '0000-00-00 00:00:00'),
(450, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:54', '0000-00-00 00:00:00'),
(451, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:55', '0000-00-00 00:00:00'),
(452, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:56', '0000-00-00 00:00:00'),
(453, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:58', '0000-00-00 00:00:00'),
(454, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:23:59', '0000-00-00 00:00:00'),
(455, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/discgolfovaliga/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:01', '0000-00-00 00:00:00'),
(456, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://docs.google.com/spreadsheet/ccc/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:08', '0000-00-00 00:00:00'),
(457, 'http://www.discgolf.sk/18-reportaz/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:11', '0000-00-00 00:00:00'),
(458, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:14', '0000-00-00 00:00:00'),
(459, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/results/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:15', '0000-00-00 00:00:00'),
(460, 'http://www.discgolf.sk/2-uncategorised/39-kde-hrat-discgolf/https://sites.google.com/site/discgolfovaliga/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:17', '0000-00-00 00:00:00'),
(461, 'http://www.discgolf.sk/2-uncategorised/35-domov/https://sites.google.com/site/regnadgtur/results/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:20', '0000-00-00 00:00:00'),
(462, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:22', '0000-00-00 00:00:00'),
(463, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:23', '0000-00-00 00:00:00'),
(464, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:25', '0000-00-00 00:00:00'),
(465, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:26', '0000-00-00 00:00:00'),
(466, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:28', '0000-00-00 00:00:00'),
(467, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:29', '0000-00-00 00:00:00'),
(468, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:30', '0000-00-00 00:00:00'),
(469, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://sites.google.com/site/regnadgtur/results/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:32', '0000-00-00 00:00:00'),
(470, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/results/msrmakov2012/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:33', '0000-00-00 00:00:00'),
(471, 'http://www.discgolf.sk/2-uncategorised/35-domov/https://sites.google.com/site/regnadgtur/results/msrmakov2012/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:43', '0000-00-00 00:00:00'),
(472, 'http://www.discgolf.sk/18-reportaz/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:44', '0000-00-00 00:00:00'),
(473, 'http://www.discgolf.sk/2-uncategorised/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:46', '0000-00-00 00:00:00'),
(474, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:54', '0000-00-00 00:00:00'),
(475, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:55', '0000-00-00 00:00:00'),
(476, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:57', '0000-00-00 00:00:00'),
(477, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:24:59', '0000-00-00 00:00:00'),
(478, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:00', '0000-00-00 00:00:00'),
(479, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:01', '0000-00-00 00:00:00'),
(480, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:03', '0000-00-00 00:00:00'),
(481, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/discgolfovaliga/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:04', '0000-00-00 00:00:00'),
(482, 'http://www.discgolf.sk/18-reportaz/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:21', '0000-00-00 00:00:00'),
(483, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://docs.google.com/spreadsheet/ccc/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:22', '0000-00-00 00:00:00'),
(484, 'http://www.discgolf.sk/18-reportaz/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:24', '0000-00-00 00:00:00'),
(485, 'http://www.discgolf.sk/2-uncategorised/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:26', '0000-00-00 00:00:00'),
(486, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:27', '0000-00-00 00:00:00'),
(487, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/results/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:28', '0000-00-00 00:00:00'),
(488, 'http://www.discgolf.sk/2-uncategorised/39-kde-hrat-discgolf/https://sites.google.com/site/discgolfovaliga/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:29', '0000-00-00 00:00:00'),
(489, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:37', '0000-00-00 00:00:00'),
(490, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:38', '0000-00-00 00:00:00'),
(491, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:40', '0000-00-00 00:00:00'),
(492, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:41', '0000-00-00 00:00:00'),
(493, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:42', '0000-00-00 00:00:00'),
(494, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:43', '0000-00-00 00:00:00'),
(495, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://twitter.com/DiscGolfSR/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:45', '0000-00-00 00:00:00'),
(496, 'http://www.discgolf.sk/2-uncategorised/35-domov/https://sites.google.com/site/regnadgtur/results/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:47', '0000-00-00 00:00:00'),
(497, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/discgolfovaliga/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:48', '0000-00-00 00:00:00'),
(498, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:49', '0000-00-00 00:00:00'),
(499, 'http://www.discgolf.sk/18-reportaz/51-navsteva-u-juznych-susedov/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:52', '0000-00-00 00:00:00'),
(500, 'http://www.discgolf.sk/18-reportaz/52-finale-ligy-v-camping-parku-karpaty/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:53', '0000-00-00 00:00:00'),
(501, 'http://www.discgolf.sk/18-reportaz/53-hugov-adventny-poharik/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:54', '0000-00-00 00:00:00'),
(502, 'http://www.discgolf.sk/18-reportaz/54-slovacka-tura-zimna-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:55', '0000-00-00 00:00:00'),
(503, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:57', '0000-00-00 00:00:00'),
(504, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:58', '0000-00-00 00:00:00'),
(505, 'http://www.discgolf.sk/18-reportaz/58-budmerice-spring-fling-2013/https://sites.google.com/site/regnadgtur/results/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:25:59', '0000-00-00 00:00:00'),
(506, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/results/msrmakov2012/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:01', '0000-00-00 00:00:00'),
(507, 'http://www.discgolf.sk/18-reportaz/55-stompfa-cup-2013/https://docs.google.com/spreadsheet/ccc/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:16', '0000-00-00 00:00:00'),
(508, 'http://www.discgolf.sk/18-reportaz/https://sites.google.com/site/regnadgtur/makov-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:17', '0000-00-00 00:00:00'),
(509, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/makov-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:18', '0000-00-00 00:00:00'),
(510, 'http://www.discgolf.sk/2-uncategorised/https://sites.google.com/site/regnadgtur/results/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:20', '0000-00-00 00:00:00'),
(511, 'http://www.discgolf.sk/2-uncategorised/39-kde-hrat-discgolf/https://sites.google.com/site/discgolfovaliga/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:22', '0000-00-00 00:00:00'),
(512, 'http://www.discgolf.sk/2-uncategorised/35-domov/https://sites.google.com/site/regnadgtur/results/msrmakov2012/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:23', '0000-00-00 00:00:00'),
(513, 'http://www.discgolf.sk/18-reportaz/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:25', '0000-00-00 00:00:00'),
(514, 'http://www.discgolf.sk/2-uncategorised/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://twitter.com/DiscGolfSR/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:26', '0000-00-00 00:00:00'),
(515, 'http://www.discgolf.sk/2-uncategorised/35-domov/https://sites.google.com/site/regnadgtur/results/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:35', '0000-00-00 00:00:00'),
(516, 'http://www.discgolf.sk/18-reportaz/49-reporta-z-msr-2012/https://sites.google.com/site/regnadgtur/makov-2013/https://sites.google.com/site/regnadgtur/makov-2013/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-07-02 07:26:37', '0000-00-00 00:00:00'),
(517, 'http://discgolf.sk/2009.html', '', '', '', 1, 0, '2013-07-03 16:27:23', '0000-00-00 00:00:00'),
(518, 'http://discgolf.sk/language/en-GB/en-GB.php', '', 'http://discgolf.sk/language/en-GB/en-GB.php', '', 2, 0, '2013-07-04 08:10:51', '0000-00-00 00:00:00'),
(519, 'http://discgolf.sk/includes/Archive/w.php', '', '', '', 1, 0, '2013-07-04 17:56:23', '0000-00-00 00:00:00'),
(520, 'http://discgolf.sk/components/com_contact/views/w.php', '', '', '', 1, 0, '2013-07-05 03:07:59', '0000-00-00 00:00:00'),
(521, 'http://discgolf.sk/modules/mod_bing/mod_bing.php', '', 'http://discgolf.sk/modules/mod_bing/mod_bing.php', '', 3, 0, '2013-07-05 13:45:45', '0000-00-00 00:00:00'),
(522, 'http://discgolf.sk/components/com_contact/p.php', '', '', '', 1, 0, '2013-07-05 14:12:07', '0000-00-00 00:00:00'),
(523, 'http://discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20', '', '', '', 6, 0, '2013-07-05 21:27:40', '0000-00-00 00:00:00'),
(524, 'http://discgolf.sk/wp-admin/', '', '', '', 1, 0, '2013-07-07 22:53:27', '0000-00-00 00:00:00'),
(525, 'http://discgolf.sk/modules/mod_add/mod_add.php', '', 'http://discgolf.sk/modules/mod_add/mod_add.php', '', 3, 0, '2013-07-09 09:41:44', '0000-00-00 00:00:00'),
(526, 'http://discgolf.sk/sandberg2005.html', '', '', '', 2, 0, '2013-07-10 09:32:22', '0000-00-00 00:00:00'),
(527, 'http://discgolf.sk/modules/mod_404/mod_404.php', '', '', '', 2, 0, '2013-07-11 12:48:16', '0000-00-00 00:00:00'),
(528, 'http://discgolf.sk/index.php', '', '', '', 1, 0, '2013-07-11 16:37:19', '0000-00-00 00:00:00'),
(529, 'http://discgolf.sk/index3.php', '', '', '', 1, 0, '2013-07-11 16:37:19', '0000-00-00 00:00:00'),
(530, 'http://discgolf.sk/modules/mod_xcache/mod_xcache.php', '', '', '', 2, 0, '2013-07-12 06:49:50', '0000-00-00 00:00:00'),
(531, 'http://www.discgolf.sk/phppath/php?-d+allow_url_include=on+-d+safe_mode=off+-d+suhosin.simulation=on+-d+disable_functions=""+-d+open_basedir=none+-d+auto_prepend_file=php://input+-n', '', '', '', 1, 0, '2013-07-14 15:53:07', '0000-00-00 00:00:00'),
(532, 'http://www.discgolf.sk/files/foto/gerulataopen2006/photos/photo14.html', '', '', '', 1, 0, '2013-07-16 08:21:50', '0000-00-00 00:00:00'),
(533, 'http://discgolf.sk/modules/mod_tools/mod_tools.php', '', '', '', 1, 0, '2013-07-18 21:19:56', '0000-00-00 00:00:00'),
(534, 'http://discgolf.sk/modules/mod_system/mod_system.php', '', '', '', 1, 0, '2013-07-19 11:55:45', '0000-00-00 00:00:00'),
(535, 'http://discgolf.sk/modules/mod_articles1/mod_articles1.php', '', '', '', 1, 0, '2013-07-20 18:51:28', '0000-00-00 00:00:00'),
(536, 'http://discgolf.sk/modules/mod_articles/mod_articles.php', '', '', '', 1, 0, '2013-07-21 10:05:12', '0000-00-00 00:00:00'),
(537, 'http://discgolf.sk/modules/mod_google/mod_msn_show.php', '', '', '', 1, 0, '2013-07-21 20:29:35', '0000-00-00 00:00:00'),
(538, 'http://discgolf.sk/modules/mod_helper/mod_helper.php', '', '', '', 1, 0, '2013-07-22 09:25:59', '0000-00-00 00:00:00'),
(539, 'http://discgolf.sk/modules/mod_joom/mod_joom.php', '', '', '', 1, 0, '2013-07-22 10:58:29', '0000-00-00 00:00:00'),
(540, 'http://discgolf.sk/modules/mod_sysconfig/mod_system.php', '', '', '', 1, 0, '2013-07-22 18:27:32', '0000-00-00 00:00:00'),
(541, 'http://discgolf.sk/components/com_hello/views/dlll.php', '', '', '', 2, 0, '2013-07-23 01:18:07', '0000-00-00 00:00:00'),
(542, 'http://www.discgolf.sk//?option=com_ckforms&controller=../../../../../../../../../../../../../../../../../../../../../../../..//proc/self/environ\000', '', '', '', 1, 0, '2013-07-24 13:03:46', '0000-00-00 00:00:00'),
(543, 'http://www.discgolf.sk/component/mailto//?option=com_ckforms&controller=../../../../../../../../../../../../../../../../../../../../../../../..//proc/self/environ\000', '', '', '', 1, 0, '2013-07-24 13:03:49', '0000-00-00 00:00:00'),
(544, 'http://www.discgolf.sk//?option=com_ckforms&controller=../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ\000', '', '', '', 1, 0, '2013-07-24 13:08:00', '0000-00-00 00:00:00'),
(545, 'http://www.discgolf.sk/component/mailto//?option=com_ckforms&controller=../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ\000', '', '', '', 1, 0, '2013-07-24 13:08:00', '0000-00-00 00:00:00'),
(546, 'http://discgolf.sk/modules/mod_zetta/zetta.php', '', '', '', 2, 0, '2013-07-28 00:32:42', '0000-00-00 00:00:00'),
(547, 'http://discgolf.sk/phpmyadmin/index.php', '', '', '', 2, 0, '2013-07-29 13:06:46', '0000-00-00 00:00:00'),
(548, 'http://discgolf.sk/pma/index.php', '', '', '', 1, 0, '2013-07-29 13:06:47', '0000-00-00 00:00:00'),
(549, 'http://discgolf.sk/myadmin/index.php', '', '', '', 1, 0, '2013-07-29 13:06:47', '0000-00-00 00:00:00'),
(550, 'http://discgolf.sk/modules/mod_twit/mod_twit.php', '', '', '', 1, 0, '2013-07-29 21:56:58', '0000-00-00 00:00:00'),
(551, 'http://discgolf.sk/modules/mod_xsystemx/mod_xsystemx.php', '', '', '', 1, 0, '2013-07-30 17:31:34', '0000-00-00 00:00:00'),
(552, 'http://discgolf.sk/modules/mod_apis/mod_apis.php', '', '', '', 1, 0, '2013-08-01 08:44:39', '0000-00-00 00:00:00'),
(553, 'http://discgolf.sk/modules/mod_update/mod_update.php', '', '', '', 1, 0, '2013-08-01 17:35:46', '0000-00-00 00:00:00'),
(554, 'http://discgolf.sk/modules/mod_truycap/helper.php', '', '', '', 1, 0, '2013-08-03 01:50:18', '0000-00-00 00:00:00'),
(555, 'http://www.discgolf.sk/http://www.discgolf.sk//', '', 'http://www.discgolf.sk/', '', 1, 0, '2013-08-08 20:03:26', '0000-00-00 00:00:00'),
(556, 'http://discgolf.sk/administrator/config.php', '', '', '', 1, 0, '2013-08-13 06:30:45', '0000-00-00 00:00:00'),
(557, 'http://discgolf.sk/modules/mod_sfx/mod_sfx.php', '', '', '', 1, 0, '2013-08-13 11:46:21', '0000-00-00 00:00:00'),
(558, 'http://discgolf.sk/modules/mod_server/mod_server.php', '', '', '', 1, 0, '2013-08-14 02:09:12', '0000-00-00 00:00:00'),
(559, 'http://discgolf.sk/modules/mod_joomrings/joomrings.php', '', '', '', 1, 0, '2013-08-14 08:11:44', '0000-00-00 00:00:00'),
(560, 'http://discgolf.sk/modules/mod_logerrors/logerrors.php', '', '', '', 1, 0, '2013-08-14 19:39:06', '0000-00-00 00:00:00'),
(561, 'http://discgolf.sk/modules/mod_jcore/shell.php', '', '', '', 1, 0, '2013-08-15 16:16:32', '0000-00-00 00:00:00'),
(562, 'http://discgolf.sk/modules/mod_perl/mod_perl.php', '', '', '', 1, 0, '2013-08-16 05:24:33', '0000-00-00 00:00:00'),
(563, 'http://discgolf.sk/modules/mod_feeder/mod_feeder.php', '', '', '', 1, 0, '2013-08-16 12:16:28', '0000-00-00 00:00:00'),
(564, 'http://discgolf.sk/administrator/bing.php', '', '', '', 1, 0, '2013-08-16 16:17:35', '0000-00-00 00:00:00'),
(565, 'http://discgolf.sk/modules/mod_media_style/mod_media_style.php', '', '', '', 2, 0, '2013-08-17 05:24:07', '0000-00-00 00:00:00'),
(566, 'http://discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form', '', '', '', 1, 0, '2013-08-18 06:29:23', '0000-00-00 00:00:00'),
(567, 'http://discgolf.sk/modules/mod_gogle/mod_gogle.php', '', '', '', 1, 0, '2013-08-18 16:56:03', '0000-00-00 00:00:00'),
(568, 'http://discgolf.sk/modules/grafskis/grafskis.php', '', '', '', 1, 0, '2013-08-18 22:39:11', '0000-00-00 00:00:00'),
(569, 'http://discgolf.sk/modules/mod_syst/systems.php', '', '', '', 1, 0, '2013-08-19 07:47:43', '0000-00-00 00:00:00'),
(570, 'http://discgolf.sk/modules/mod_wdbanners/mod_wdbanners.php', '', '', '', 1, 0, '2013-08-19 12:55:30', '0000-00-00 00:00:00'),
(571, 'http://discgolf.sk/modules/mod_inf/mod_inf.php', '', '', '', 1, 0, '2013-08-19 23:53:06', '0000-00-00 00:00:00'),
(572, 'http://discgolf.sk/modules/mod_plugins/mod_plugins.php', '', '', '', 1, 0, '2013-08-20 07:42:36', '0000-00-00 00:00:00'),
(573, 'http://discgolf.sk/modules/mod_help/mod_help.php', '', '', '', 1, 0, '2013-08-21 00:05:17', '0000-00-00 00:00:00'),
(574, 'http://www.discgolf.sk/ /', '', '', '', 1, 0, '2013-08-21 03:44:47', '0000-00-00 00:00:00'),
(575, 'http://discgolf.sk/components/com_ag_google_analytics2/index.php', '', '', '', 1, 0, '2013-08-21 13:24:55', '0000-00-00 00:00:00'),
(576, 'http://discgolf.sk/phpmyadmin/', '', 'http://www.google.com/', '', 2, 0, '2013-08-24 20:33:34', '0000-00-00 00:00:00'),
(577, 'http://discgolf.sk/db/', '', 'http://www.google.com/', '', 1, 0, '2013-08-24 20:33:34', '0000-00-00 00:00:00'),
(578, 'http://discgolf.sk/PMA/', '', 'http://www.google.com/', '', 1, 0, '2013-08-24 20:33:35', '0000-00-00 00:00:00'),
(579, 'http://discgolf.sk/index.php?option=com_kunena&func=userlist', '', 'http://www.google.com/', '', 1, 0, '2013-08-26 20:45:28', '0000-00-00 00:00:00'),
(580, 'http://discgolf.sk/modules/mod_pathauto/mod_pathauto.php', '', '', '', 1, 0, '2013-08-27 23:19:01', '0000-00-00 00:00:00'),
(581, 'http://discgolf.sk/modules/mod_breadcrumbs/7rch77.php', '', '', '', 1, 0, '2013-08-28 02:24:36', '0000-00-00 00:00:00'),
(582, 'http://www.discgolf.sk//sites/all/modules/civicrm/packages/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:11', '0000-00-00 00:00:00'),
(583, 'http://www.discgolf.sk//components/com_acymailing/inc/openflash/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:11', '0000-00-00 00:00:00'),
(584, 'http://www.discgolf.sk//components/com_jnews/includes/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:11', '0000-00-00 00:00:00'),
(585, 'http://www.discgolf.sk//components/com_civicrm/civicrm/packages/OpenFlashChart/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:12', '0000-00-00 00:00:00'),
(586, 'http://www.discgolf.sk//components/com_jinc/classes/graphics/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:12', '0000-00-00 00:00:00'),
(587, 'http://www.discgolf.sk//library/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:13', '0000-00-00 00:00:00'),
(588, 'http://www.discgolf.sk//components/com_jnewsletter/includes/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 1, 0, '2013-08-29 15:55:13', '0000-00-00 00:00:00'),
(589, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/3xp.php', '', '', '', 1, 0, '2013-08-29 18:39:20', '0000-00-00 00:00:00'),
(590, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/0day.php', '', '', '', 1, 0, '2013-08-29 18:39:21', '0000-00-00 00:00:00'),
(591, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/jahat.php', '', '', '', 1, 0, '2013-08-29 18:39:21', '0000-00-00 00:00:00'),
(592, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/70bex.php', '', '', '', 1, 0, '2013-08-29 18:39:21', '0000-00-00 00:00:00'),
(593, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/itil.php', '', '', '', 1, 0, '2013-08-29 18:39:22', '0000-00-00 00:00:00'),
(594, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/0d4y.php', '', '', '', 1, 0, '2013-08-29 18:39:22', '0000-00-00 00:00:00'),
(595, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//components/com_virtuemart/themes/pbv_multi/scripts/timthumb.php', '', '', '', 1, 0, '2013-08-29 18:39:22', '0000-00-00 00:00:00'),
(596, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//images/stories/iam.php', '', '', '', 1, 0, '2013-08-29 18:39:22', '0000-00-00 00:00:00'),
(597, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//components/com_facileforms/libraries/jquery/uploadify.php', '', '', '', 1, 0, '2013-08-29 18:39:22', '0000-00-00 00:00:00'),
(598, 'http://www.discgolf.sk/component/content/article/18-reportaz/55-stompfa-cup-2013//README.PHP?jom', '', '', '', 1, 0, '2013-08-29 18:39:28', '0000-00-00 00:00:00'),
(599, 'http://www.discgolf.sk//images/stories/3xp.php', '', '', '', 1, 0, '2013-08-29 18:39:28', '0000-00-00 00:00:00'),
(600, 'http://www.discgolf.sk//images/stories/0day.php', '', '', '', 1, 0, '2013-08-29 18:39:28', '0000-00-00 00:00:00'),
(601, 'http://www.discgolf.sk//images/stories/jahat.php', '', '', '', 1, 0, '2013-08-29 18:39:29', '0000-00-00 00:00:00'),
(602, 'http://www.discgolf.sk//images/stories/70bex.php', '', '', '', 1, 0, '2013-08-29 18:39:29', '0000-00-00 00:00:00'),
(603, 'http://www.discgolf.sk//images/stories/itil.php', '', '', '', 1, 0, '2013-08-29 18:39:29', '0000-00-00 00:00:00'),
(604, 'http://www.discgolf.sk//images/stories/0d4y.php', '', '', '', 1, 0, '2013-08-29 18:39:30', '0000-00-00 00:00:00'),
(605, 'http://www.discgolf.sk//components/com_virtuemart/themes/pbv_multi/scripts/timthumb.php', '', '', '', 1, 0, '2013-08-29 18:39:30', '0000-00-00 00:00:00'),
(606, 'http://www.discgolf.sk//images/stories/iam.php', '', '', '', 1, 0, '2013-08-29 18:39:30', '0000-00-00 00:00:00'),
(607, 'http://www.discgolf.sk//components/com_facileforms/libraries/jquery/uploadify.php', '', '', '', 1, 0, '2013-08-29 18:39:30', '0000-00-00 00:00:00'),
(608, 'http://www.discgolf.sk//README.PHP?jom', '', '', '', 1, 0, '2013-08-29 18:39:36', '0000-00-00 00:00:00'),
(609, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/3xp.php', '', '', '', 1, 0, '2013-08-29 18:39:36', '0000-00-00 00:00:00'),
(610, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/0day.php', '', '', '', 1, 0, '2013-08-29 18:39:36', '0000-00-00 00:00:00'),
(611, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/jahat.php', '', '', '', 1, 0, '2013-08-29 18:39:37', '0000-00-00 00:00:00'),
(612, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/70bex.php', '', '', '', 1, 0, '2013-08-29 18:39:37', '0000-00-00 00:00:00'),
(613, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/itil.php', '', '', '', 1, 0, '2013-08-29 18:39:37', '0000-00-00 00:00:00'),
(614, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/0d4y.php', '', '', '', 1, 0, '2013-08-29 18:39:37', '0000-00-00 00:00:00'),
(615, 'http://www.discgolf.sk/component/content/article/18-reportaz//components/com_virtuemart/themes/pbv_multi/scripts/timthumb.php', '', '', '', 1, 0, '2013-08-29 18:39:37', '0000-00-00 00:00:00'),
(616, 'http://www.discgolf.sk/component/content/article/18-reportaz//images/stories/iam.php', '', '', '', 1, 0, '2013-08-29 18:39:38', '0000-00-00 00:00:00');
INSERT INTO `b0e2j_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES (617, 'http://www.discgolf.sk/component/content/article/18-reportaz//components/com_facileforms/libraries/jquery/uploadify.php', '', '', '', 1, 0, '2013-08-29 18:39:38', '0000-00-00 00:00:00'),
(618, 'http://www.discgolf.sk/component/content/article/18-reportaz//README.PHP?jom', '', '', '', 1, 0, '2013-08-29 18:39:43', '0000-00-00 00:00:00'),
(619, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/Tee', '', '', '', 1, 0, '2013-08-31 20:08:38', '0000-00-00 00:00:00'),
(620, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/Obrázok', '', '', '', 1, 0, '2013-08-31 20:08:38', '0000-00-00 00:00:00'),
(621, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/discgolf', '', '', '', 1, 0, '2013-09-02 05:38:46', '0000-00-00 00:00:00'),
(622, 'http://www.discgolf.sk/images/captions/ihrisko_foto_makov/Obrázok', '', '', '', 4, 0, '2013-09-02 05:38:47', '0000-00-00 00:00:00'),
(623, 'http://discgolf.sk/modules/mod_joomcashe/joomcashe.php', '', '', '', 2, 0, '2013-09-03 04:04:41', '0000-00-00 00:00:00'),
(624, 'http://discgolf.sk/modules/mod_logo/mod_logo.php', '', '', '', 1, 0, '2013-09-03 18:04:37', '0000-00-00 00:00:00'),
(625, 'http://discgolf.sk/modules/mod_msn/mod_msn.php', '', '', '', 1, 0, '2013-09-04 02:02:58', '0000-00-00 00:00:00'),
(626, 'http://discgolf.sk/modules/mod_xsystem/mod_xsystem.php', '', '', '', 2, 0, '2013-09-04 12:18:08', '0000-00-00 00:00:00'),
(627, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/Thanks', '', '', '', 1, 0, '2013-09-05 12:58:39', '0000-00-00 00:00:00'),
(628, 'http://www.discgolf.sk/images/captions/ihrisko_foto_makov/IMG_79201', '', '', '', 1, 0, '2013-09-05 12:58:40', '0000-00-00 00:00:00'),
(629, 'http://discgolf.sk/modules/mod_te/mod_te.php', '', '', '', 1, 0, '2013-09-08 04:20:33', '0000-00-00 00:00:00'),
(630, 'http://discgolf.sk/administrator/connector.php', '', '', '', 1, 0, '2013-09-08 10:04:07', '0000-00-00 00:00:00'),
(631, 'http://www.discgolf.sk/component/content/article/18-reportaz/this.href,', '', '', '', 1, 0, '2013-09-09 18:00:07', '0000-00-00 00:00:00'),
(632, 'http://discgolf.sk/index.php?option=com_user&view=register', '', '', '', 1, 0, '2013-09-11 11:31:24', '0000-00-00 00:00:00'),
(633, 'http://discgolf.sk/modules/mod_page/mod_page.php', '', '', '', 1, 0, '2013-09-12 02:01:40', '0000-00-00 00:00:00'),
(634, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/discgolfov', '', '', '', 1, 0, '2013-09-12 05:25:45', '0000-00-00 00:00:00'),
(635, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/Discatcher3', '', '', '', 1, 0, '2013-09-12 06:36:46', '0000-00-00 00:00:00'),
(636, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/kuchyna', '', '', '', 2, 0, '2013-09-12 06:36:46', '0000-00-00 00:00:00'),
(637, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/Info', '', '', '', 1, 0, '2013-09-12 09:16:39', '0000-00-00 00:00:00'),
(638, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/pingpong7', '', '', '', 1, 0, '2013-09-12 10:15:48', '0000-00-00 00:00:00'),
(639, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/camping', '', '', '', 1, 0, '2013-09-12 10:15:49', '0000-00-00 00:00:00'),
(640, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/IMG_39174', '', '', '', 1, 0, '2013-09-12 10:22:10', '0000-00-00 00:00:00'),
(641, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/kuchna', '', '', '', 1, 0, '2013-09-12 10:22:11', '0000-00-00 00:00:00'),
(642, 'http://www.discgolf.sk/images/captions/ihrisko_foto_malyslavin/P10806016', '', '', '', 1, 0, '2013-09-12 13:03:59', '0000-00-00 00:00:00'),
(643, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/kuchyna710', '', '', '', 1, 0, '2013-09-12 13:03:59', '0000-00-00 00:00:00'),
(644, 'http://discgolf.sk/modules/wolosfer/wolosfer.php', '', '', '', 1, 0, '2013-09-13 03:16:06', '0000-00-00 00:00:00'),
(645, 'http://discgolf.sk/components/com_search/views/index.php', '', '', '', 1, 0, '2013-09-13 15:20:13', '0000-00-00 00:00:00'),
(646, 'http://discgolf.sk/images/info.php', '', '', '', 1, 0, '2013-09-14 00:52:53', '0000-00-00 00:00:00'),
(647, 'http://discgolf.sk/images/loader.php', '', '', '', 1, 0, '2013-09-14 07:53:16', '0000-00-00 00:00:00'),
(648, 'http://discgolf.sk/modules/mod_mamba/mod_mamba.php', '', '', '', 1, 0, '2013-09-15 17:43:31', '0000-00-00 00:00:00'),
(649, 'http://www.discgolf.sk/tmp/k.php', '', 'http://www.discgolf.sk/tmp/k.php', '', 1, 0, '2013-09-19 21:18:09', '0000-00-00 00:00:00'),
(650, 'http://discgolf.sk/components/com_banners/helpers/sys.php', '', '', '', 1, 0, '2013-09-20 04:52:59', '0000-00-00 00:00:00'),
(651, 'http://discgolf.sk/modules/mod_ya/mod_ya.php', '', '', '', 1, 0, '2013-09-20 23:32:19', '0000-00-00 00:00:00'),
(652, 'http://discgolf.sk/administrator/pack.php', '', '', '', 1, 0, '2013-09-21 05:38:56', '0000-00-00 00:00:00'),
(653, 'http://discgolf.sk/administrator/mysql_class.php', '', '', '', 1, 0, '2013-09-26 00:10:34', '0000-00-00 00:00:00'),
(654, 'http://discgolf.sk/cgi.php', '', '', '', 1, 0, '2013-09-26 18:53:31', '0000-00-00 00:00:00'),
(655, 'http://discgolf.sk/components/com_jce/media/js/info.php', '', '', '', 1, 0, '2013-09-26 21:23:46', '0000-00-00 00:00:00'),
(656, 'http://www.discgolf.sk/wp-admin', '', '', '', 1, 0, '2013-09-29 00:11:35', '0000-00-00 00:00:00'),
(657, 'http://discgolf.sk/e', '', '', '', 1, 0, '2013-10-03 09:02:48', '0000-00-00 00:00:00'),
(658, 'http://discgolf.sk/ed', '', '', '', 1, 0, '2013-10-03 09:02:49', '0000-00-00 00:00:00'),
(659, 'http://discgolf.sk/edi', '', '', '', 1, 0, '2013-10-03 09:02:50', '0000-00-00 00:00:00'),
(660, 'http://discgolf.sk/edit', '', '', '', 2, 0, '2013-10-03 09:02:51', '0000-00-00 00:00:00'),
(661, 'http://discgolf.sk/w', '', '', '', 1, 0, '2013-10-03 09:03:04', '0000-00-00 00:00:00'),
(662, 'http://discgolf.sk/wp', '', '', '', 1, 0, '2013-10-03 09:03:05', '0000-00-00 00:00:00'),
(663, 'http://discgolf.sk/wp-', '', '', '', 1, 0, '2013-10-03 09:03:09', '0000-00-00 00:00:00'),
(664, 'http://discgolf.sk/wp-a', '', '', '', 1, 0, '2013-10-03 09:03:11', '0000-00-00 00:00:00'),
(665, 'http://discgolf.sk/wp-ad', '', '', '', 1, 0, '2013-10-03 09:03:12', '0000-00-00 00:00:00'),
(666, 'http://discgolf.sk/wp-adm', '', '', '', 1, 0, '2013-10-03 09:03:12', '0000-00-00 00:00:00'),
(667, 'http://discgolf.sk/wp-admi', '', '', '', 1, 0, '2013-10-03 09:03:13', '0000-00-00 00:00:00'),
(668, 'http://www.discgolf.sk/images/captions/ihrisko_foto_makov/P104014310', '', '', '', 1, 0, '2013-10-03 11:24:57', '0000-00-00 00:00:00'),
(669, 'http://discgolf.sk/index.php?option=com_virtuemart', '', 'http://discgolf.sk/', '', 1, 0, '2013-10-05 04:03:57', '0000-00-00 00:00:00'),
(670, 'http://www.discgolf.sk/images/captions/ihrisko_foto_kuchyna/discgolf3', '', '', '', 1, 0, '2013-10-06 12:43:13', '0000-00-00 00:00:00'),
(671, 'http://discgolf.sk/278f34982b865793676c9ac356445c63.php', '', 'http://discauto.ru/wp-conf.php', '', 1, 0, '2013-10-07 23:59:49', '0000-00-00 00:00:00'),
(672, 'http://discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743', '', '', '', 8, 0, '2013-10-08 11:19:56', '0000-00-00 00:00:00'),
(673, 'http://discgolf.sk/mambots/editors/wysiwygpro/document.php', '', 'http://discgolf.sk/', '', 1, 0, '2013-10-18 17:49:40', '0000-00-00 00:00:00'),
(674, 'http://discgolf.sk/kickstart.php', '', 'http://discgolf.sk/', '', 1, 0, '2013-10-22 05:01:41', '0000-00-00 00:00:00'),
(675, 'http://www.discgolf.sk/https://sites.google.com/site/regnadgtur/ftc-2013', '', '', '', 1, 0, '2013-10-27 18:53:56', '0000-00-00 00:00:00'),
(676, 'http://www.discgolf.sk/o-discgolfe/o-disc-golfe/https://twitter.com/DiscGolfSR', '', '', '', 1, 0, '2013-10-27 18:54:04', '0000-00-00 00:00:00'),
(677, 'http://www.discgolf.sk/o-discgolfe/o-disc-golfe/https://www.facebook.com/pages/Disc-Golf-Slovakia/218686351593929', '', '', '', 1, 0, '2013-10-27 18:55:00', '0000-00-00 00:00:00'),
(678, 'http://www.discgolf.sk/robots', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:06', '0000-00-00 00:00:00'),
(679, 'http://www.discgolf.sk/ask', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:06', '0000-00-00 00:00:00'),
(680, 'http://www.discgolf.sk/admin/help/online_help_1.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:06', '0000-00-00 00:00:00'),
(681, 'http://www.discgolf.sk/do/reg.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:06', '0000-00-00 00:00:00'),
(682, 'http://www.discgolf.sk/digg.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:07', '0000-00-00 00:00:00'),
(683, 'http://www.discgolf.sk/admin/template/foot.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:07', '0000-00-00 00:00:00'),
(684, 'http://www.discgolf.sk/admin/template/article_more/config.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:08', '0000-00-00 00:00:00'),
(685, 'http://www.discgolf.sk/special', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:08', '0000-00-00 00:00:00'),
(686, 'http://www.discgolf.sk/hack/gather/template/edit_title.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:09', '0000-00-00 00:00:00'),
(687, 'http://www.discgolf.sk/member/template/homepage.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:09', '0000-00-00 00:00:00'),
(688, 'http://www.discgolf.sk/data', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:10', '0000-00-00 00:00:00'),
(689, 'http://www.discgolf.sk/admin/list.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:10', '0000-00-00 00:00:00'),
(690, 'http://www.discgolf.sk/template/default/refreshto.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:10', '0000-00-00 00:00:00'),
(691, 'http://www.discgolf.sk/index.php/i', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:10', '0000-00-00 00:00:00'),
(692, 'http://www.discgolf.sk/admin/licence', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:11', '0000-00-00 00:00:00'),
(693, 'http://www.discgolf.sk/dede/login.php?gotopage=/dede/', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:11', '0000-00-00 00:00:00'),
(694, 'http://www.discgolf.sk/admin', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:12', '0000-00-00 00:00:00'),
(695, 'http://www.discgolf.sk/template/home.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:12', '0000-00-00 00:00:00'),
(696, 'http://www.discgolf.sk/install/templates/step-1.html', '', 'http://www.baidu.com', '', 4, 0, '2013-10-29 13:26:13', '0000-00-00 00:00:00'),
(697, 'http://www.discgolf.sk/system/skins/default/system.login.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:13', '0000-00-00 00:00:00'),
(698, 'http://www.discgolf.sk/admin/tpl/showmessage.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:13', '0000-00-00 00:00:00'),
(699, 'http://www.discgolf.sk/99billdo.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:13', '0000-00-00 00:00:00'),
(700, 'http://www.discgolf.sk/install/templates/header.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:14', '0000-00-00 00:00:00'),
(701, 'http://www.discgolf.sk/media/blogs/index.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:15', '0000-00-00 00:00:00'),
(702, 'http://www.discgolf.sk/admin/tpl/footer.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:15', '0000-00-00 00:00:00'),
(703, 'http://www.discgolf.sk/leiame.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:15', '0000-00-00 00:00:00'),
(704, 'http://www.discgolf.sk/custom/README', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:16', '0000-00-00 00:00:00'),
(705, 'http://www.discgolf.sk/Dialog/about.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:18', '0000-00-00 00:00:00'),
(706, 'http://www.discgolf.sk/Southidceditor/Dialog/about.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:18', '0000-00-00 00:00:00'),
(707, 'http://www.discgolf.sk/install/templates/default/errorinfo.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:18', '0000-00-00 00:00:00'),
(708, 'http://www.discgolf.sk/templates/cn/html/about.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:19', '0000-00-00 00:00:00'),
(709, 'http://www.discgolf.sk/themes/lazycms/home.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:19', '0000-00-00 00:00:00'),
(710, 'http://www.discgolf.sk/agent/templates/Smarty/utf-8/footer.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:19', '0000-00-00 00:00:00'),
(711, 'http://www.discgolf.sk/install/templates/default/footer.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:19', '0000-00-00 00:00:00'),
(712, 'http://www.discgolf.sk/templates/default/cn/public/footer.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:19', '0000-00-00 00:00:00'),
(713, 'http://www.discgolf.sk/js/index.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:20', '0000-00-00 00:00:00'),
(714, 'http://www.discgolf.sk/eWebEditor/Dialog/about.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:20', '0000-00-00 00:00:00'),
(715, 'http://www.discgolf.sk/admin/Southidceditor/Dialog/about.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:20', '0000-00-00 00:00:00'),
(716, 'http://www.discgolf.sk/templates/default/header.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:20', '0000-00-00 00:00:00'),
(717, 'http://www.discgolf.sk/templates/default/en/public/footer.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:20', '0000-00-00 00:00:00'),
(718, 'http://www.discgolf.sk/phpldapadmin', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:21', '0000-00-00 00:00:00'),
(719, 'http://www.discgolf.sk/templet/default/', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:21', '0000-00-00 00:00:00'),
(720, 'http://www.discgolf.sk/templates/default/cn/public/fotter.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:21', '0000-00-00 00:00:00'),
(721, 'http://www.discgolf.sk/templates/default/footer.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:21', '0000-00-00 00:00:00'),
(722, 'http://www.discgolf.sk/editor/Dialog/about.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:22', '0000-00-00 00:00:00'),
(723, 'http://www.discgolf.sk/pla', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:22', '0000-00-00 00:00:00'),
(724, 'http://www.discgolf.sk/templates/default/en/public/fotter.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:22', '0000-00-00 00:00:00'),
(725, 'http://www.discgolf.sk/extmail/README', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:23', '0000-00-00 00:00:00'),
(726, 'http://www.discgolf.sk/minica_down.php', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:24', '0000-00-00 00:00:00'),
(727, 'http://www.discgolf.sk/README', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:25', '0000-00-00 00:00:00'),
(728, 'http://www.discgolf.sk/announcement/index.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:25', '0000-00-00 00:00:00'),
(729, 'http://www.discgolf.sk/docs/index.html', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:25', '0000-00-00 00:00:00'),
(730, 'http://www.discgolf.sk/message.html', '', 'http://www.baidu.com', '', 1, 0, '2013-10-29 13:26:25', '0000-00-00 00:00:00'),
(731, 'http://www.discgolf.sk/cuteeditor_files/Help/default.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:26', '0000-00-00 00:00:00'),
(732, 'http://www.discgolf.sk/phpmyadmin/README', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:26', '0000-00-00 00:00:00'),
(733, 'http://www.discgolf.sk/board/default/board_view.html', '', 'http://www.baidu.com', '', 2, 0, '2013-10-29 13:26:26', '0000-00-00 00:00:00'),
(734, 'http://www.discgolf.sk/templates/default/auction_detail.html', '', 'http://www.baidu.com', '', 2, 0, '2013-10-29 13:26:27', '0000-00-00 00:00:00'),
(735, 'http://www.discgolf.sk/phpmyadmin/ChangeLog', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:28', '0000-00-00 00:00:00'),
(736, 'http://www.discgolf.sk/Help/default.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:28', '0000-00-00 00:00:00'),
(737, 'http://www.discgolf.sk/ChangeLog', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:29', '0000-00-00 00:00:00'),
(738, 'http://www.discgolf.sk/editor/Help/default.htm', '', 'http://www.baidu.com', '', 3, 0, '2013-10-29 13:26:30', '0000-00-00 00:00:00'),
(739, 'http://discgolf.sk/http://fonts.googleapis.com/css?family=Puritan', '', '', '', 3, 0, '2013-10-30 11:29:12', '0000-00-00 00:00:00'),
(740, 'http://www.discgolf.sk/plugins/editors/jce.php', '', '', '', 2, 0, '2013-11-05 21:36:15', '0000-00-00 00:00:00'),
(741, 'http://www.discgolf.sk/-', '', '', '', 1, 0, '2013-11-08 06:10:30', '0000-00-00 00:00:00'),
(742, 'http://discgolf.sk/index.php?option=com_user&view=login', '', '', '', 1, 0, '2013-11-09 19:10:30', '0000-00-00 00:00:00'),
(743, 'http://www.discgolf.sk/index.php?option=com_user&view=login', '', '', '', 1, 0, '2013-11-09 19:49:53', '0000-00-00 00:00:00'),
(744, 'http://discgolf.sk/plugins/editors/fckeditor/editor/filemanager/browser/default/browser.html', '', 'http://google.com', '', 1, 0, '2013-11-15 18:59:44', '0000-00-00 00:00:00'),
(745, 'http://www.discgolf.sk/editor/editor/filemanager/browser/default/connectors/test.html', '', '', '', 1, 0, '2013-11-20 17:34:22', '0000-00-00 00:00:00'),
(746, 'http://www.discgolf.sk/editor/editor/filemanager/connectors/test.html', '', '', '', 1, 0, '2013-11-20 17:57:49', '0000-00-00 00:00:00'),
(747, 'http://www.discgolf.sk/editor/editor/filemanager/connectors/uploadtest.html', '', '', '', 1, 0, '2013-11-20 18:20:51', '0000-00-00 00:00:00'),
(748, 'http://www.discgolf.sk/fckeditor/editor/filemanager/browser/default/connectors/test.html', '', '', '', 1, 0, '2013-11-20 18:44:16', '0000-00-00 00:00:00'),
(749, 'http://www.discgolf.sk/fckeditor/editor/filemanager/connectors/test.html', '', '', '', 1, 0, '2013-11-20 19:07:38', '0000-00-00 00:00:00'),
(750, 'http://www.discgolf.sk/FCKeditor/editor/filemanager/connectors/uploadtest.html', '', '', '', 1, 0, '2013-11-20 19:33:52', '0000-00-00 00:00:00'),
(751, 'http://www.discgolf.sk/FCKeditor/editor/filemanager/upload/test.html', '', '', '', 1, 0, '2013-11-20 19:58:20', '0000-00-00 00:00:00'),
(752, 'http://www.discgolf.sk/editor/editor/filemanager/upload/test.html', '', '', '', 1, 0, '2013-11-20 20:23:17', '0000-00-00 00:00:00'),
(753, 'http://www.discgolf.sk/admin/fckeditor/editor/filemanager/browser/default/connectors/test.html', '', '', '', 1, 0, '2013-11-20 20:49:31', '0000-00-00 00:00:00'),
(754, 'http://www.discgolf.sk/admin/fckeditor/editor/filemanager/connectors/test.html', '', '', '', 1, 0, '2013-11-20 21:13:40', '0000-00-00 00:00:00'),
(755, 'http://www.discgolf.sk/admin/FCKeditor/editor/filemanager/connectors/uploadtest.html', '', '', '', 1, 0, '2013-11-20 21:37:09', '0000-00-00 00:00:00'),
(756, 'http://www.discgolf.sk/admin/FCKeditor/editor/filemanager/upload/test.html', '', '', '', 1, 0, '2013-11-20 22:00:27', '0000-00-00 00:00:00'),
(757, 'http://discgolf.sk/images/stories/muakero.php', '', '', '', 2, 0, '2013-11-26 13:32:52', '0000-00-00 00:00:00'),
(758, 'http://www.discgolf.sk/component/content/article/18-reportaz/components/com_jnews/includes/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 2, 0, '2013-11-30 02:54:00', '0000-00-00 00:00:00'),
(759, 'http://www.discgolf.sk/components/com_jnews/includes/openflashchart/php-ofc-library/ofc_upload_image.php', '', '', '', 2, 0, '2013-11-30 02:54:00', '0000-00-00 00:00:00'),
(760, 'http://www.discgolf.sk/component/mailto/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20', '', '', '', 3, 0, '2013-12-04 06:16:32', '0000-00-00 00:00:00'),
(761, 'http://www.discgolf.sk/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b', '', '', '', 3, 0, '2013-12-04 06:16:32', '0000-00-00 00:00:00'),
(762, 'http://www.discgolf.sk/component/mailto/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b', '', '', '', 3, 0, '2013-12-04 06:16:32', '0000-00-00 00:00:00'),
(763, 'http://www.discgolf.sk/images/stories/allstars.php?x', '', '', '', 1, 0, '2013-12-04 06:16:46', '0000-00-00 00:00:00'),
(764, 'http://discgolf.sk/blog/wp-login.php', '', '', '', 1, 0, '2013-12-05 15:55:05', '0000-00-00 00:00:00'),
(765, 'http://www.discgolf.sk/component/content/article/18-reportaz//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b', '', '', '', 1, 0, '2013-12-07 06:25:26', '0000-00-00 00:00:00'),
(766, 'http://www.discgolf.sk//index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b', '', '', '', 1, 0, '2013-12-07 06:25:26', '0000-00-00 00:00:00'),
(767, 'http://www.discgolf.sk//images/stories/ViAr.php?rf', '', '', '', 1, 0, '2013-12-07 19:05:31', '0000-00-00 00:00:00'),
(768, 'http://www.discgolf.sk//images/stories/food/footer.php?clone', '', '', '', 1, 0, '2013-12-07 19:05:37', '0000-00-00 00:00:00'),
(769, 'http://www.discgolf.sk/admin.php', '', '', '', 1, 0, '2013-12-09 05:34:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_schemas`
-- 

CREATE TABLE `b0e2j_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY  (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_schemas`
-- 

INSERT INTO `b0e2j_schemas` (`extension_id`, `version_id`) VALUES (700, '2.5.6'),
(10022, '1.0.7');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_session`
-- 

CREATE TABLE `b0e2j_session` (
  `session_id` varchar(200) NOT NULL default '',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `guest` tinyint(4) unsigned default '1',
  `time` varchar(14) default '',
  `data` mediumtext,
  `userid` int(11) default '0',
  `username` varchar(150) default '',
  `usertype` varchar(50) default '',
  PRIMARY KEY  (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_session`
-- 

INSERT INTO `b0e2j_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES ('cu6fiitt8fq6q6r3bjapsqtpf0', 0, 1, '1386592019', '__default|a:8:{s:15:"session.counter";i:3;s:19:"session.timer.start";i:1386591989;s:18:"session.timer.last";i:1386591998;s:17:"session.timer.now";i:1386592018;s:22:"session.client.browser";s:127:"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:16:"com_mailto.links";a:2:{s:40:"86f17bc944bf7f30e91c4d31b31fc2fbfcc7ec63";O:8:"stdClass":2:{s:4:"link";s:47:"http://www.discgolf.sk/sutaze/vysledky-turnajov";s:6:"expiry";i:1386592018;}s:40:"0552907477e0274fcce332ad6c2974f3a415911c";O:8:"stdClass":2:{s:4:"link";s:30:"http://www.discgolf.sk/kontakt";s:6:"expiry";i:1386591998;}}}', 0, '', ''),
('4gagbrghfgodpd67je8or58ue7', 0, 1, '1386593276', '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1386593276;s:18:"session.timer.last";i:1386593276;s:17:"session.timer.now";i:1386593276;s:22:"session.client.browser";s:66:"Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:16:"com_mailto.links";a:1:{s:40:"6acbb3e2961ea1e21eb6b67c86e344aef1810dc4";O:8:"stdClass":2:{s:4:"link";s:47:"http://www.discgolf.sk/2-uncategorised/35-domov";s:6:"expiry";i:1386593276;}}}', 0, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_template_styles`
-- 

CREATE TABLE `b0e2j_template_styles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `template` varchar(50) NOT NULL default '',
  `client_id` tinyint(1) unsigned NOT NULL default '0',
  `home` char(7) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `b0e2j_template_styles`
-- 

INSERT INTO `b0e2j_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES (2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default-Fruit Shop', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Matuna Market ","sitedescription":"Fruit Shop Sample Site","navposition":"left","html5":"0"}'),
(17, 'tx_freemium', 0, '1', 'TX_Freemium - Default', '{"style":"style3","background_color":"fffff","header_color":"555555","header_font_color":"555555","feature_color":"dddddd","feature_font_color":"dddddd","bottom_color":"eeeeee","bottom_font_color":"eeeeee","footer_color":"000000","footer_font_color":"000000","link_color":"30a8f4","layout_type":"1","iphone_theme":"1","android_theme":"1","template_width":"980","sidebar-left":"25","sidebar-right":"25","roof-1":"20","roof-2":"20","roof-3":"20","roof-4":"20","roof-5":"20","header-1":"30","header-2":"70","header-3":"50","header-4":"50","header-5":"100","top-1":"20","top-2":"20","top-3":"20","top-4":"20","top-5":"20","utility-1":"40","utility-2":"30","utility-3":"30","utility-4":"100","utility-5":"100","feature-1":"20","feature-2":"20","feature-3":"20","feature-4":"20","feature-5":"20","main-top-1":"20","main-top-2":"20","main-top-3":"20","main-top-4":"20","main-top-5":"20","content-top-1":"33","content-top-2":"34","content-top-3":"33","content-top-4":"100","content-bottom-1":"25","content-bottom-2":"25","content-bottom-3":"25","content-bottom-4":"25","main-bottom-1":"20","main-bottom-2":"20","main-bottom-3":"20","main-bottom-4":"20","main-bottom-5":"20","bottom-1":"20","bottom-2":"20","bottom-3":"20","bottom-4":"20","bottom-5":"20","footer-1":"25","footer-2":"25","footer-3":"25","footer-4":"25","footer-5":"100","body_font":"none","body_selectors":"p,span","body_css_rules":"","menu_font":"Puritan","menu_selectors":".tx-menu a","menu_css_rules":"","heading_font":"none","heading_selectors":"h1,h2,h3,h4,h5,h5,h2.title","heading_css_rules":"","module_font":"none","module_selectors":".mod-header","module_css_rules":"","menu_position":"top","menu_animation":"fade","menu_delay":"800","menu_speed":"normal","date":"1","formats":"Friday, August 31, 2012","copyright":"1","copyright_text":"Copyright \\u00a9 2012 discgolf.sk","scroll_top":"1","expose_logo":"1","expose_logo_type":"light","analytics_id":"UA-xxxxxx-x","jquery_loader":"1","jquery_source":"local","jquery_version":"1.5.1","cache_time":"600","component_display":"1"}');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_clubs`
-- 

CREATE TABLE `b0e2j_tracks_clubs` (
  `id` int(11) NOT NULL auto_increment,
  `full_name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `picture` varchar(100) default NULL,
  `picture_small` varchar(100) default NULL,
  `address` text,
  `postcode` varchar(10) default NULL,
  `city` varchar(50) default NULL,
  `state` varchar(20) default NULL,
  `country_code` varchar(3) default NULL,
  `description` text,
  `admin_id` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_clubs`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_competitions`
-- 

CREATE TABLE `b0e2j_tracks_competitions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `ordering` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_competitions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_individuals`
-- 

CREATE TABLE `b0e2j_tracks_individuals` (
  `id` int(11) NOT NULL auto_increment,
  `last_name` varchar(40) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `nickname` varchar(20) NOT NULL,
  `height` varchar(10) default NULL,
  `weight` varchar(10) default NULL,
  `dob` date default NULL,
  `hometown` varchar(50) default NULL,
  `country_code` varchar(3) default NULL,
  `user_id` int(11) NOT NULL,
  `picture` varchar(250) default NULL,
  `picture_small` varchar(250) default NULL,
  `address` text,
  `postcode` varchar(10) default NULL,
  `city` varchar(50) default NULL,
  `state` varchar(20) default NULL,
  `country` varchar(20) default NULL,
  `description` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_individuals`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_project_settings`
-- 

CREATE TABLE `b0e2j_tracks_project_settings` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `xml` varchar(50) NOT NULL default '',
  `settings` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_project_settings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_projects`
-- 

CREATE TABLE `b0e2j_tracks_projects` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `competition_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_projects`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_projects_individuals`
-- 

CREATE TABLE `b0e2j_tracks_projects_individuals` (
  `id` int(11) NOT NULL auto_increment,
  `individual_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `number` varchar(8) default NULL,
  `initial_points` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_projects_individuals`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_projects_rounds`
-- 

CREATE TABLE `b0e2j_tracks_projects_rounds` (
  `id` int(11) NOT NULL auto_increment,
  `round_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `description` text,
  `comment` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_projects_rounds`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_projects_subrounds`
-- 

CREATE TABLE `b0e2j_tracks_projects_subrounds` (
  `id` int(11) NOT NULL auto_increment,
  `projectround_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `description` text,
  `comment` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_projects_subrounds`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_projects_teams`
-- 

CREATE TABLE `b0e2j_tracks_projects_teams` (
  `id` int(11) NOT NULL auto_increment,
  `team_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `description` text,
  `initial_points` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_projects_teams`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_rounds`
-- 

CREATE TABLE `b0e2j_tracks_rounds` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `description` text,
  `ordering` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_rounds`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_rounds_results`
-- 

CREATE TABLE `b0e2j_tracks_rounds_results` (
  `id` int(11) NOT NULL auto_increment,
  `individual_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `number` varchar(8) default NULL,
  `subround_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `performance` varchar(30) NOT NULL default '',
  `bonus_points` float NOT NULL,
  `comment` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pr_ind` (`individual_id`,`subround_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_rounds_results`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_seasons`
-- 

CREATE TABLE `b0e2j_tracks_seasons` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `ordering` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_seasons`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_subroundtypes`
-- 

CREATE TABLE `b0e2j_tracks_subroundtypes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `note` varchar(100) NOT NULL,
  `points_attribution` varchar(250) NOT NULL,
  `description` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_subroundtypes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_tracks_teams`
-- 

CREATE TABLE `b0e2j_tracks_teams` (
  `id` int(11) NOT NULL auto_increment,
  `club_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `alias` varchar(100) NOT NULL default '',
  `short_name` varchar(20) NOT NULL,
  `acronym` varchar(6) NOT NULL,
  `picture` varchar(100) default NULL,
  `picture_small` varchar(100) default NULL,
  `country_code` varchar(3) default NULL,
  `description` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_tracks_teams`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_update_categories`
-- 

CREATE TABLE `b0e2j_update_categories` (
  `categoryid` int(11) NOT NULL auto_increment,
  `name` varchar(20) default '',
  `description` text NOT NULL,
  `parent` int(11) default '0',
  `updatesite` int(11) default '0',
  PRIMARY KEY  (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_update_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_update_sites`
-- 

CREATE TABLE `b0e2j_update_sites` (
  `update_site_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default '',
  `type` varchar(20) default '',
  `location` text NOT NULL,
  `enabled` int(11) default '0',
  `last_check_timestamp` bigint(20) default '0',
  PRIMARY KEY  (`update_site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `b0e2j_update_sites`
-- 

INSERT INTO `b0e2j_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES (1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 0, 1380083457),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 1367780733),
(3, 'Tracks Update Site', 'extension', 'http://www.jlv-solutions.com/updates/tracks-update.xml', 1, 1386005156),
(4, 'Community Builder Update Site', 'extension', 'http://update.joomlapolis.net/versions/comprofiler-1_8-update.xml', 1, 1386005156);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_update_sites_extensions`
-- 

CREATE TABLE `b0e2j_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL default '0',
  `extension_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

-- 
-- Dumping data for table `b0e2j_update_sites_extensions`
-- 

INSERT INTO `b0e2j_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES (1, 700),
(2, 700),
(3, 10022),
(4, 10041);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_updates`
-- 

CREATE TABLE `b0e2j_updates` (
  `update_id` int(11) NOT NULL auto_increment,
  `update_site_id` int(11) default '0',
  `extension_id` int(11) default '0',
  `categoryid` int(11) default '0',
  `name` varchar(100) default '',
  `description` text NOT NULL,
  `element` varchar(100) default '',
  `type` varchar(20) default '',
  `folder` varchar(20) default '',
  `client_id` tinyint(3) default '0',
  `version` varchar(10) default '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY  (`update_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `b0e2j_updates`
-- 

INSERT INTO `b0e2j_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES (1, 3, 0, 0, 'tracks-component', 'tracks component', 'com_tracks', 'component', '', 0, '1.0.7', '', 'http://www.jlv-solutions.com/updates/tracks-update.xml', 'http://www.jlv-solutions.com/products/tracks/tracks-download/1.0.7_STABLE.html'),
(2, 1, 700, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.7', '', 'http://update.joomla.org/core/extension.xml', ''),
(3, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.8', '', 'http://update.joomla.org/core/extension.xml', ''),
(4, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.8', '', 'http://update.joomla.org/core/extension.xml', ''),
(5, 4, 10041, 0, 'Community Builder', 'Community Builder Members Manager', 'com_comprofiler', 'component', '', 1, '1.9', '', 'http://update.joomlapolis.net/versions/comprofiler-1_8-update.xml', 'http://www.joomlapolis.com/'),
(6, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.8', '', 'http://update.joomla.org/core/extension.xml', ''),
(7, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(8, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(9, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(10, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(11, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(12, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(13, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(14, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(15, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(16, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(17, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.9', '', 'http://update.joomla.org/core/extension.xml', ''),
(18, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.10', '', 'http://update.joomla.org/core/extension.xml', ''),
(19, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(20, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(21, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(22, 4, 0, 0, 'Community Builder', 'Community Builder Members Manager', 'com_comprofiler', 'component', '', 1, '1.9.1', '', 'http://update.joomlapolis.net/versions/comprofiler-1_8-update.xml', 'http://www.joomlapolis.com/'),
(23, 4, 0, 0, 'Community Builder', 'Community Builder Members Manager', 'com_comprofiler', 'component', '', 1, '1.9.1', '', 'http://update.joomlapolis.net/versions/comprofiler-1_8-update.xml', 'http://www.joomlapolis.com/');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_user_notes`
-- 

CREATE TABLE `b0e2j_user_notes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `catid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(100) NOT NULL default '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `checked_out` int(10) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL default '0',
  `created_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_user_notes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_user_profiles`
-- 

CREATE TABLE `b0e2j_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- 
-- Dumping data for table `b0e2j_user_profiles`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_user_usergroup_map`
-- 

CREATE TABLE `b0e2j_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL default '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY  (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `b0e2j_user_usergroup_map`
-- 

INSERT INTO `b0e2j_user_usergroup_map` (`user_id`, `group_id`) VALUES (42, 8),
(43, 8),
(44, 2),
(45, 8);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_usergroups`
-- 

CREATE TABLE `b0e2j_usergroups` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL default '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL default '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL default '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` USING BTREE (`lft`,`rgt`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `b0e2j_usergroups`
-- 

INSERT INTO `b0e2j_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES (1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_users`
-- 

CREATE TABLE `b0e2j_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL default '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL default '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- 
-- Dumping data for table `b0e2j_users`
-- 

INSERT INTO `b0e2j_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES (42, 'Super User', 'admin', 'jp@jejpi.sk', '023f698da407cc6e7d0d6937a4e32570:hsAYnJXJzh9hu0LTtQrwtOXc5EMu0jfP', 'deprecated', 0, 1, '2012-08-30 18:13:54', '2012-09-06 05:58:58', '', '', '0000-00-00 00:00:00', 0),
(43, 'VS', 'melman', 'vladimir.spacil@gmail.com', '409eec9576be4b99bb1f6aac3af30afd:jF8vOnCXpxJehXPk8bWYVMrYHZviTLih', 'Registered', 0, 1, '2012-09-03 14:51:24', '2013-10-04 14:55:23', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
(44, 'seoden4k', 'seoden4k', 'seoden4ik@gmail.com', 'ad912fa31a5ede3f5217cc166b2ed94d:NvWFfmOnorxAPQUVRdW6uduOIyLKFoNM', '', 1, 0, '2013-08-29 04:48:07', '0000-00-00 00:00:00', '278a0ca0367aec38e721c3763247b5da', '{}', '0000-00-00 00:00:00', 0),
(45, 'new admin', '7lunes', 'richard.kollar@gmail.com', '9a382d957c54df62d90fa6f3ff525a7b:0ZNNdCFhcPu8g6SMKELKTtrYYbmBYhxQ', '', 0, 1, '2013-10-04 14:49:57', '2013-12-02 17:26:13', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_viewlevels`
-- 

CREATE TABLE `b0e2j_viewlevels` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `b0e2j_viewlevels`
-- 

INSERT INTO `b0e2j_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES (1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

-- 
-- Table structure for table `b0e2j_weblinks`
-- 

CREATE TABLE `b0e2j_weblinks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `state` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `access` int(11) NOT NULL default '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `b0e2j_weblinks`
-- 

