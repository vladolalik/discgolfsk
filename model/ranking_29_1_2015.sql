-- phpMyAdmin SQL Dump
-- version 2.8.0.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 29, 2015 at 07:16 PM
-- Server version: 5.0.89
-- PHP Version: 5.3.10
-- 
-- Database: `vx600000db`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `statistics_ranking`
-- 

CREATE TABLE `statistics_ranking` (
  `ranking_id` int(11) NOT NULL auto_increment,
  `open_score` double default NULL,
  `women_score` double default NULL,
  `open_slovak_DG` double default NULL,
  `women_slovak_DG` double default NULL,
  `last_update` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=latin1 AUTO_INCREMENT=744 ;

-- 
-- Dumping data for table `statistics_ranking`
-- 

INSERT INTO `statistics_ranking` (`ranking_id`, `open_score`, `women_score`, `open_slovak_DG`, `women_slovak_DG`, `last_update`, `user_id`) VALUES (330, NULL, NULL, 0, 0, '2015-01-29', 12),
(401, NULL, 400, 0, 0, '2015-01-29', 83),
(402, NULL, NULL, 0, 0, '2015-01-29', 91),
(403, 327.671345445179, NULL, 0, 0, '2015-01-29', 98),
(404, 20.833333333333, NULL, 0, 0, '2015-01-29', 108),
(405, NULL, NULL, 0, 0, '2015-01-29', 103),
(406, 100.057471264367, NULL, 0, 0, '2015-01-29', 202),
(407, NULL, 187.5, 0, 0, '2015-01-29', 205),
(408, 409.306949530072, NULL, 0, 0, '2015-01-29', 95),
(409, NULL, 305, 0, 0, '2015-01-29', 199),
(410, NULL, NULL, 0, 0, '2015-01-29', 85),
(411, 22.222222222222, NULL, 0, 0, '2015-01-29', 96),
(412, 289.572192513369, NULL, 0, 0, '2015-01-29', 204),
(413, NULL, NULL, 0, 0, '2015-01-29', 104),
(414, NULL, 77.777777777778, 0, 0, '2015-01-29', 86),
(415, 465.823008409215, NULL, 0, 0, '2015-01-29', 93),
(416, 154.271159874608, NULL, 0, 0, '2015-01-29', 359),
(417, 338.406837134018, NULL, 0, 0, '2015-01-29', 92),
(418, NULL, NULL, 0, 0, '2015-01-29', 109),
(419, 25, NULL, 0, 0, '2015-01-29', 107),
(420, 183.354107578244, NULL, 0, 0, '2015-01-29', 100),
(421, 215.488505747126, NULL, 0, 0, '2015-01-29', 97),
(422, 116.106442577031, NULL, 0, 0, '2015-01-29', 106),
(423, NULL, NULL, 0, 0, '2015-01-29', 105),
(425, 23.333333333333, NULL, 0, 0, '2015-01-29', 102),
(426, 20.689655172414, NULL, 0, 0, '2015-01-29', 101),
(427, NULL, 33.333333333333, 0, 0, '2015-01-29', 88),
(428, NULL, 30, 0, 0, '2015-01-29', 110),
(429, NULL, NULL, 0, 0, '2015-01-29', 113),
(430, NULL, NULL, 0, 0, '2015-01-29', 115),
(431, NULL, NULL, 0, 0, '2015-01-29', 111),
(432, 81.666666666667, NULL, 0, 0, '2015-01-29', 196),
(433, NULL, 57.5, 0, 0, '2015-01-29', 112),
(434, 31.666666666667, NULL, 0, 0, '2015-01-29', 116),
(435, NULL, NULL, 0, 0, '2015-01-29', 130),
(436, NULL, NULL, 0, 0, '2015-01-29', 123),
(437, NULL, NULL, 0, 0, '2015-01-29', 132),
(439, NULL, NULL, 0, 0, '2015-01-29', 126),
(440, NULL, NULL, 0, 0, '2015-01-29', 122),
(441, NULL, NULL, 0, 0, '2015-01-29', 121),
(442, NULL, NULL, 0, 0, '2015-01-29', 124),
(443, NULL, NULL, 0, 0, '2015-01-29', 127),
(444, 27.777777777778, NULL, 0, 0, '2015-01-29', 120),
(446, NULL, NULL, 0, 0, '2015-01-29', 129),
(447, 31.944444444444, NULL, 0, 0, '2015-01-29', 119),
(448, NULL, NULL, 0, 0, '2015-01-29', 131),
(449, 10.714285714286, NULL, 0, 0, '2015-01-29', 128),
(450, 21.428571428571, NULL, 0, 0, '2015-01-29', 125),
(451, 0, NULL, 0, 0, '2015-01-29', 140),
(452, NULL, 0, 0, 0, '2015-01-29', 133),
(453, 74.7287274366371, NULL, 0, 0, '2015-01-29', 187),
(454, 0, NULL, 0, 0, '2015-01-29', 198),
(455, 16.666666666667, NULL, 0, 0, '2015-01-29', 139),
(456, NULL, NULL, 0, 0, '2015-01-29', 134),
(457, NULL, NULL, 0, 0, '2015-01-29', 137),
(458, NULL, NULL, 0, 0, '2015-01-29', 138),
(459, 25, NULL, 0, 0, '2015-01-29', 135),
(460, NULL, NULL, 0, 0, '2015-01-29', 233),
(461, NULL, NULL, 0, 0, '2015-01-29', 370),
(462, 240.830721003135, NULL, 0, 0, '2015-01-29', 188),
(463, 27.272727272727, NULL, 0, 0, '2015-01-29', 396),
(464, NULL, 12.5, 0, 0, '2015-01-29', 395),
(465, NULL, 118.055555555556, 0, 0, '2015-01-29', 189),
(466, 84.090909090909, NULL, 0, 0, '2015-01-29', 398),
(467, 15.909090909091, NULL, 0, 0, '2015-01-29', 399),
(468, 143.933247280103, NULL, 0, 0, '2015-01-29', 364),
(469, 27.586206896552, NULL, 0, 0, '2015-01-29', 206),
(471, 74.255485893417, NULL, 0, 0, '2015-01-29', 365),
(472, NULL, NULL, 0, 0, '2015-01-29', 154),
(473, NULL, NULL, 0, 0, '2015-01-29', 160),
(474, 99.949290060852, NULL, 0, 0, '2015-01-29', 151),
(475, NULL, NULL, 0, 0, '2015-01-29', 150),
(476, NULL, NULL, 0, 0, '2015-01-29', 156),
(477, 58.620689655172, NULL, 0, 0, '2015-01-29', 152),
(478, NULL, NULL, 0, 0, '2015-01-29', 147),
(479, NULL, NULL, 0, 0, '2015-01-29', 163),
(480, NULL, NULL, 0, 0, '2015-01-29', 167),
(481, NULL, NULL, 0, 0, '2015-01-29', 165),
(482, 0, NULL, 0, 0, '2015-01-29', 421),
(483, 5.8823529411765, NULL, 0, 0, '2015-01-29', 419),
(484, NULL, NULL, 0, 0, '2015-01-29', 166),
(485, NULL, NULL, 0, 0, '2015-01-29', 176),
(486, 0, NULL, 0, 0, '2015-01-29', 420),
(487, 64.705882352941, NULL, 0, 0, '2015-01-29', 418),
(488, NULL, NULL, 0, 0, '2015-01-29', 164),
(489, NULL, NULL, 0, 0, '2015-01-29', 177),
(490, NULL, NULL, 0, 0, '2015-01-29', 175),
(491, NULL, NULL, 0, 0, '2015-01-29', 178),
(492, NULL, NULL, 0, 0, '2015-01-29', 179),
(493, NULL, NULL, 0, 0, '2015-01-29', 161),
(494, 13.888888888889, NULL, 0, 0, '2015-01-29', 169),
(495, NULL, NULL, 0, 0, '2015-01-29', 173),
(496, NULL, NULL, 0, 0, '2015-01-29', 174),
(497, NULL, NULL, 0, 0, '2015-01-29', 172),
(498, NULL, NULL, 0, 0, '2015-01-29', 181),
(499, NULL, NULL, 0, 0, '2015-01-29', 180),
(500, NULL, 124.444444444444, 0, 0, '2015-01-29', 186),
(501, NULL, NULL, 0, 0, '2015-01-29', 185),
(502, NULL, NULL, 0, 0, '2015-01-29', 184),
(503, 11.666666666667, NULL, 0, 0, '2015-01-29', 182),
(504, NULL, NULL, 0, 0, '2015-01-29', 183),
(505, 240.830721003135, NULL, 0, 0, '2015-01-29', 188),
(506, 74.7287274366371, NULL, 0, 0, '2015-01-29', 187),
(507, NULL, 305, 0, 0, '2015-01-29', 199),
(508, NULL, 163.888888888889, 0, 0, '2015-01-29', 190),
(509, 100.057471264367, NULL, 0, 0, '2015-01-29', 202),
(510, NULL, 187.5, 0, 0, '2015-01-29', 205),
(511, NULL, 118.055555555556, 0, 0, '2015-01-29', 189),
(512, 55.799373040752, NULL, 0, 0, '2015-01-29', 191),
(513, 27.586206896552, NULL, 0, 0, '2015-01-29', 206),
(514, 289.572192513369, NULL, 0, 0, '2015-01-29', 204),
(515, 0, NULL, 0, 0, '2015-01-29', 198),
(516, 130.467980295567, NULL, 0, 0, '2015-01-29', 208),
(517, 351.043190525949, NULL, 0, 0, '2015-01-29', 207),
(518, 81.666666666667, NULL, 0, 0, '2015-01-29', 196),
(519, NULL, NULL, 0, 0, '2015-01-29', 201),
(520, NULL, NULL, 0, 0, '2015-01-29', 195),
(521, NULL, NULL, 0, 0, '2015-01-29', 193),
(522, 48.275862068966, NULL, 0, 0, '2015-01-29', 203),
(523, NULL, NULL, 0, 0, '2015-01-29', 192),
(524, NULL, NULL, 0, 0, '2015-01-29', 194),
(525, NULL, NULL, 0, 0, '2015-01-29', 197),
(526, NULL, 75.555555555556, 0, 0, '2015-01-29', 200),
(527, NULL, NULL, 0, 0, '2015-01-29', 210),
(528, 8.3333333333333, NULL, 0, 0, '2015-01-29', 209),
(529, 18.333333333333, NULL, 0, 0, '2015-01-29', 215),
(530, 3.3333333333333, NULL, 0, 0, '2015-01-29', 222),
(532, 5, NULL, 0, 0, '2015-01-29', 221),
(533, NULL, 8.3333333333333, 0, 0, '2015-01-29', 219),
(534, 15, NULL, 0, 0, '2015-01-29', 216),
(535, 1.6666666666667, NULL, 0, 0, '2015-01-29', 218),
(536, 10, NULL, 0, 0, '2015-01-29', 217),
(537, 45, NULL, 0, 0, '2015-01-29', 212),
(538, 43.055555555555, NULL, 0, 0, '2015-01-29', 214),
(539, 6.6666666666667, NULL, 0, 0, '2015-01-29', 220),
(542, 55.681818181818, NULL, 0, 0, '2015-01-29', 226),
(543, NULL, NULL, 0, 0, '2015-01-29', 223),
(544, NULL, NULL, 0, 0, '2015-01-29', 227),
(545, 52.941176470588, NULL, 0, 0, '2015-01-29', 224),
(546, NULL, NULL, 0, 0, '2015-01-29', 230),
(547, NULL, NULL, 0, 0, '2015-01-29', 229),
(548, NULL, NULL, 0, 0, '2015-01-29', 228),
(549, NULL, NULL, 0, 0, '2015-01-29', 233),
(550, NULL, NULL, 0, 0, '2015-01-29', 242),
(551, NULL, NULL, 0, 0, '2015-01-29', 238),
(552, 39.772727272727, NULL, 0, 0, '2015-01-29', 234),
(553, NULL, NULL, 0, 0, '2015-01-29', 241),
(554, 24.137931034483, NULL, 0, 0, '2015-01-29', 240),
(555, NULL, NULL, 0, 0, '2015-01-29', 239),
(556, 72.727272727273, NULL, 0, 0, '2015-01-29', 236),
(557, 72.727272727273, NULL, 0, 0, '2015-01-29', 236),
(558, 72.727272727273, NULL, 0, 0, '2015-01-29', 236),
(673, 44.827586206897, NULL, 0, 0, '2015-01-29', 363),
(675, 143.933247280103, NULL, 0, 0, '2015-01-29', 364),
(676, 74.255485893417, NULL, 0, 0, '2015-01-29', 365),
(677, 123.354231974921, NULL, 0, 0, '2015-01-29', 368),
(678, 154.271159874608, NULL, 0, 0, '2015-01-29', 359),
(679, NULL, NULL, 0, 0, '2015-01-29', 369),
(680, 162.170385395537, NULL, 0, 0, '2015-01-29', 360),
(681, 62.068965517241, NULL, 0, 0, '2015-01-29', 362),
(682, 13.793103448276, NULL, 0, 0, '2015-01-29', 367),
(683, 131.708105394718, NULL, 0, 0, '2015-01-29', 366),
(684, NULL, NULL, 0, 0, '2015-01-29', 233),
(685, NULL, NULL, 0, 0, '2015-01-29', 370),
(686, 26.082251082251, NULL, 0, 0, '2015-01-29', 375),
(687, NULL, 20, 0, 0, '2015-01-29', 377),
(688, 27.586206896552, NULL, 0, 0, '2015-01-29', 206),
(689, NULL, NULL, 0, 0, '2015-01-29', 374),
(690, 11.111111111111, NULL, 0, 0, '2015-01-29', 379),
(691, 23.8816738816736, NULL, 0, 0, '2015-01-29', 373),
(692, 13.6724386724387, NULL, 0, 0, '2015-01-29', 376),
(693, NULL, NULL, 0, 0, '2015-01-29', 378),
(694, NULL, NULL, 0, 0, '2015-01-29', 243),
(695, 16.666666666667, NULL, 0, 0, '2015-01-29', 380),
(696, 70.689655172414, NULL, 0, 0, '2015-01-29', 381),
(697, NULL, NULL, 0, 0, '2015-01-29', 372),
(698, NULL, NULL, 0, 0, '2015-01-29', 382),
(699, NULL, NULL, 0, 0, '2015-01-29', 383),
(700, 17.857142857143, NULL, 0, 0, '2015-01-29', 390),
(701, 25, NULL, 0, 0, '2015-01-29', 389),
(702, 0, NULL, 0, 0, '2015-01-29', 391),
(703, NULL, 0, 0, 0, '2015-01-29', 392),
(704, 63.636363636364, NULL, 0, 0, '2015-01-29', 405),
(705, 18.181818181818, NULL, 0, 0, '2015-01-29', 386),
(706, 93.181818181818, NULL, 0, 0, '2015-01-29', 385),
(707, 27.272727272727, NULL, 0, 0, '2015-01-29', 396),
(708, NULL, 12.5, 0, 0, '2015-01-29', 395),
(709, 84.090909090909, NULL, 0, 0, '2015-01-29', 398),
(710, 15.909090909091, NULL, 0, 0, '2015-01-29', 399),
(711, 84.090909090909, NULL, 0, 0, '2015-01-29', 400),
(712, 29.545454545455, NULL, 0, 0, '2015-01-29', 384),
(713, 11.363636363636, NULL, 0, 0, '2015-01-29', 415),
(714, NULL, 50, 0, 0, '2015-01-29', 414),
(715, 21.590909090909, NULL, 0, 0, '2015-01-29', 412),
(716, 70.454545454545, NULL, 0, 0, '2015-01-29', 404),
(717, 32.954545454545, NULL, 0, 0, '2015-01-29', 411),
(718, 55.681818181818, NULL, 0, 0, '2015-01-29', 226),
(719, NULL, NULL, 0, 0, '2015-01-29', 394),
(720, 45.454545454545, NULL, 0, 0, '2015-01-29', 409),
(721, 55.681818181818, NULL, 0, 0, '2015-01-29', 407),
(722, NULL, NULL, 0, 0, '2015-01-29', 388),
(723, 63.636363636364, NULL, 0, 0, '2015-01-29', 387),
(724, 59.090909090909, NULL, 0, 0, '2015-01-29', 401),
(725, 52.272727272727, NULL, 0, 0, '2015-01-29', 397),
(726, 13.636363636364, NULL, 0, 0, '2015-01-29', 413),
(727, 100, NULL, 0, 0, '2015-01-29', 393),
(728, 36.363636363636, NULL, 0, 0, '2015-01-29', 410),
(729, NULL, 75, 0, 0, '2015-01-29', 402),
(730, 75, NULL, 0, 0, '2015-01-29', 403),
(731, 50, NULL, 0, 0, '2015-01-29', 408),
(732, 0, NULL, 0, 0, '2015-01-29', 421),
(733, 5.8823529411765, NULL, 0, 0, '2015-01-29', 419),
(734, 0, NULL, 0, 0, '2015-01-29', 420),
(735, 64.705882352941, NULL, 0, 0, '2015-01-29', 418),
(736, NULL, NULL, 0, 0, '2015-01-29', 416),
(737, 79.411764705882, NULL, 0, 0, '2015-01-29', 417),
(738, NULL, 36.111111111111, 0, 0, '2015-01-29', 422),
(739, 17.647058823529, NULL, 0, 0, '2015-01-29', 423),
(740, 29.0849673202616, NULL, 0, 0, '2015-01-29', 424),
(741, NULL, NULL, 0, 0, '2015-01-29', 425),
(742, 2.7777777777778, NULL, 0, 0, '2015-01-29', 427),
(743, 12.5, NULL, 0, 0, '2015-01-29', 426);
