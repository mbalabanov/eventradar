-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2020 at 07:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventradar`
--
CREATE DATABASE IF NOT EXISTS `eventradar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eventradar`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`, `alias`, `description`) VALUES
(1, 'Football', 'Soccer', 'Football is a team sport played with a spherical ball between two teams of 11 players. It is played by approximately 250 million players in over 200 countries and dependencies, making it the world\'s most popular sport. The game is played on a rectangular field called a pitch with a goal at each end. The object of the game is to outscore the opposition by moving the ball beyond the goal line into the opposing goal. The team with the higher number of goals wins the game. Source: Wikipedia.'),
(2, 'Basketball', 'Hoops', 'Basketball is a team sport in which two teams, most commonly of five players each, opposing one another on a rectangular court, compete with the primary objective of shooting a basketball (approximately 9.4 inches (24 cm) in diameter) through the defender\'s hoop (a basket 18 inches (46 cm) in diameter mounted 10 feet (3.048 m) high to a backboard at each end of the court) while preventing the opposing team from shooting through their own hoop. Source: Wikipedia.'),
(3, 'Ice Hockey', NULL, 'Ice hockey is a contact team sport played on ice, usually in a rink, in which two teams of skaters use their sticks to shoot a vulcanized rubber puck into their opponent\'s net to score goals. The sport is known to be fast-paced and physical, with teams usually fielding six players at a time: one goaltender, and five players who skate the span of the ice trying to control the puck and score goals against the opposing team. Source: Wikipedia.');

-- --------------------------------------------------------

--
-- Table structure for table `contenders`
--

CREATE TABLE `contenders` (
  `contendersId` int(11) NOT NULL,
  `_teamIdA` int(11) NOT NULL,
  `_teamIdB` int(11) NOT NULL,
  `scoreTeamA` int(11) DEFAULT NULL,
  `scoreTeamB` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contenders`
--

INSERT INTO `contenders` (`contendersId`, `_teamIdA`, `_teamIdB`, `scoreTeamA`, `scoreTeamB`) VALUES
(1, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

CREATE TABLE `contest` (
  `contestId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `federationName` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`contestId`, `name`, `imageUrl`, `federationName`, `website`) VALUES
(1, 'UEFA Europe Cup', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `flagUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryId`, `name`, `flagUrl`) VALUES
(1, 'Afghanistan', NULL),
(2, 'Albania', NULL),
(3, 'Algeria', NULL),
(4, 'Andorra', NULL),
(5, 'Angola', NULL),
(6, 'Antigua and Barbuda', NULL),
(7, 'Argentina', NULL),
(8, 'Armenia', NULL),
(9, 'Australia', NULL),
(10, 'Austria', NULL),
(11, 'Azerbaijan', NULL),
(12, 'Bahamas', NULL),
(13, 'Bahrain', NULL),
(14, 'Bangladesh', NULL),
(15, 'Barbados', NULL),
(16, 'Belarus', NULL),
(17, 'Belgium', NULL),
(18, 'Belize', NULL),
(19, 'Benin', NULL),
(20, 'Bhutan', NULL),
(21, 'Bolivia', NULL),
(22, 'Bosnia and Herzegovina', NULL),
(23, 'Botswana', NULL),
(24, 'Brazil', NULL),
(25, 'Brunei ', NULL),
(26, 'Bulgaria', NULL),
(27, 'Burkina Faso', NULL),
(28, 'Burundi', NULL),
(29, 'Ivory Coast', NULL),
(30, 'Cabo Verde', NULL),
(31, 'Cambodia', NULL),
(32, 'Cameroon', NULL),
(33, 'Canada', NULL),
(34, 'Central African Republic', NULL),
(35, 'Chad', NULL),
(36, 'Chile', NULL),
(37, 'China', NULL),
(38, 'Colombia', NULL),
(39, 'Comoros', NULL),
(40, 'Congo (Congo-Brazzaville)', NULL),
(41, 'Costa Rica', NULL),
(42, 'Croatia', NULL),
(43, 'Cuba', NULL),
(44, 'Cyprus', NULL),
(45, 'Czechia (Czech Republic)', NULL),
(46, 'Democratic Republic of the Congo', NULL),
(47, 'Denmark', NULL),
(48, 'Djibouti', NULL),
(49, 'Dominica', NULL),
(50, 'Dominican Republic', NULL),
(51, 'Ecuador', NULL),
(52, 'Egypt', NULL),
(53, 'El Salvador', NULL),
(54, 'Equatorial Guinea', NULL),
(55, 'Eritrea', NULL),
(56, 'Estonia', NULL),
(57, 'Eswatini (fmr. Swaziland)', NULL),
(58, 'Ethiopia', NULL),
(59, 'Fiji', NULL),
(60, 'Finland', NULL),
(61, 'France', NULL),
(62, 'Gabon', NULL),
(63, 'Gambia', NULL),
(64, 'Georgia', NULL),
(65, 'Germany', NULL),
(66, 'Ghana', NULL),
(67, 'Greece', NULL),
(68, 'Grenada', NULL),
(69, 'Guatemala', NULL),
(70, 'Guinea', NULL),
(71, 'Guinea-Bissau', NULL),
(72, 'Guyana', NULL),
(73, 'Haiti', NULL),
(74, 'Holy See', NULL),
(75, 'Honduras', NULL),
(76, 'Hungary', NULL),
(77, 'Iceland', NULL),
(78, 'India', NULL),
(79, 'Indonesia', NULL),
(80, 'Iran', NULL),
(81, 'Iraq', NULL),
(82, 'Ireland', NULL),
(83, 'Israel', NULL),
(84, 'Italy', NULL),
(85, 'Jamaica', NULL),
(86, 'Japan', NULL),
(87, 'Jordan', NULL),
(88, 'Kazakhstan', NULL),
(89, 'Kenya', NULL),
(90, 'Kiribati', NULL),
(91, 'Kuwait', NULL),
(92, 'Kyrgyzstan', NULL),
(93, 'Laos', NULL),
(94, 'Latvia', NULL),
(95, 'Lebanon', NULL),
(96, 'Lesotho', NULL),
(97, 'Liberia', NULL),
(98, 'Libya', NULL),
(99, 'Liechtenstein', NULL),
(100, 'Lithuania', NULL),
(101, 'Luxembourg', NULL),
(102, 'Madagascar', NULL),
(103, 'Malawi', NULL),
(104, 'Malaysia', NULL),
(105, 'Maldives', NULL),
(106, 'Mali', NULL),
(107, 'Malta', NULL),
(108, 'Marshall Islands', NULL),
(109, 'Mauritania', NULL),
(110, 'Mauritius', NULL),
(111, 'Mexico', NULL),
(112, 'Micronesia', NULL),
(113, 'Moldova', NULL),
(114, 'Monaco', NULL),
(115, 'Mongolia', NULL),
(116, 'Montenegro', NULL),
(117, 'Morocco', NULL),
(118, 'Mozambique', NULL),
(119, 'Myanmar (formerly Burma)', NULL),
(120, 'Namibia', NULL),
(121, 'Nauru', NULL),
(122, 'Nepal', NULL),
(123, 'Netherlands', NULL),
(124, 'New Zealand', NULL),
(125, 'Nicaragua', NULL),
(126, 'Niger', NULL),
(127, 'Nigeria', NULL),
(128, 'North Korea', NULL),
(129, 'North Macedonia', NULL),
(130, 'Norway', NULL),
(131, 'Oman', NULL),
(132, 'Pakistan', NULL),
(133, 'Palau', NULL),
(134, 'Palestine State', NULL),
(135, 'Panama', NULL),
(136, 'Papua New Guinea', NULL),
(137, 'Paraguay', NULL),
(138, 'Peru', NULL),
(139, 'Philippines', NULL),
(140, 'Poland', NULL),
(141, 'Portugal', NULL),
(142, 'Qatar', NULL),
(143, 'Romania', NULL),
(144, 'Russia', NULL),
(145, 'Rwanda', NULL),
(146, 'Saint Kitts and Nevis', NULL),
(147, 'Saint Lucia', NULL),
(148, 'Saint Vincent and the Grenadines', NULL),
(149, 'Samoa', NULL),
(150, 'San Marino', NULL),
(151, 'Sao Tome and Principe', NULL),
(152, 'Saudi Arabia', NULL),
(153, 'Senegal', NULL),
(154, 'Serbia', NULL),
(155, 'Seychelles', NULL),
(156, 'Sierra Leone', NULL),
(157, 'Singapore', NULL),
(158, 'Slovakia', NULL),
(159, 'Slovenia', NULL),
(160, 'Solomon Islands', NULL),
(161, 'Somalia', NULL),
(162, 'South Africa', NULL),
(163, 'South Korea', NULL),
(164, 'South Sudan', NULL),
(165, 'Spain', NULL),
(166, 'Sri Lanka', NULL),
(167, 'Sudan', NULL),
(168, 'Suriname', NULL),
(169, 'Sweden', NULL),
(170, 'Switzerland', NULL),
(171, 'Syria', NULL),
(172, 'Tajikistan', NULL),
(173, 'Tanzania', NULL),
(174, 'Thailand', NULL),
(175, 'Timor-Leste', NULL),
(176, 'Togo', NULL),
(177, 'Tonga', NULL),
(178, 'Trinidad and Tobago', NULL),
(179, 'Tunisia', NULL),
(180, 'Turkey', NULL),
(181, 'Turkmenistan', NULL),
(182, 'Tuvalu', NULL),
(183, 'Uganda', NULL),
(184, 'Ukraine', NULL),
(185, 'United Arab Emirates', NULL),
(186, 'United Kingdom', NULL),
(187, 'United States of America', NULL),
(188, 'Uruguay', NULL),
(189, 'Uzbekistan', NULL),
(190, 'Vanuatu', NULL),
(191, 'Venezuela', NULL),
(192, 'Vietnam', NULL),
(193, 'Yemen', NULL),
(194, 'Zambia', NULL),
(195, 'Zimbabwe', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` int(11) NOT NULL,
  `eventDate` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `_teamIdA` int(11) NOT NULL,
  `scoreTeamA` int(11) DEFAULT NULL,
  `_teamIdB` int(11) NOT NULL,
  `scoreTeamB` int(11) DEFAULT NULL,
  `_contestId` int(11) NOT NULL,
  `_locationId` int(11) NOT NULL,
  `_categoryId` int(11) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventId`, `eventDate`, `name`, `imageUrl`, `_teamIdA`, `scoreTeamA`, `_teamIdB`, `scoreTeamB`, `_contestId`, `_locationId`, `_categoryId`, `note`) VALUES
(1, '2021-03-04 20:00:00', 'Lorem Ipsum', NULL, 1, 0, 1, 0, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `leagueId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `_countryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`leagueId`, `name`, `logoUrl`, `website`, `_countryId`) VALUES
(1, 'bet-at-home Eishockey-Liga', 'assets/logos/bet-at-home-eishockey-liga-logo.png', 'ice.hockey', 10),
(2, 'Tipico Bundesliga', 'assets/logos/tipico-bundesliga.png', 'bundesliga.at', 10),
(3, 'Deutsche Bundesliga', 'assets/logos/deutsche-bundesliga-logo.png', 'bundesliga.de', 65),
(4, 'Ligue 1', 'assets/logos/ligue1-france.png', 'ligue1.fr', 61),
(5, 'La Liga', 'assets/logos/la-liga-espana.png', 'laliga.com', 165),
(6, 'Premier League', 'assets/logos/premier-league-logo.png', 'premierleague.com', 186);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `maxAudienceCapacity` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `streetNo` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `_countryId` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `name`, `imageUrl`, `maxAudienceCapacity`, `website`, `phone`, `email`, `street`, `streetNo`, `postalCode`, `city`, `_countryId`, `description`) VALUES
(1, 'Gerhard-Hanappi-Stadion', '/assets/locations/ernst-happel-stadion.jpg', 17500, 'https://www.skrapid.at/de/startseite/verein/geschichte/gerhard-hanappi-stadion', NULL, NULL, 'Gerhard-Hanappi-Platz', '1', '1140 ', 'Vienna', 10, 'The Gerhard-Hanappi-Stadion was a football stadium in Hütteldorf, in the west of Vienna, Austria. It was the home ground of Rapid Vienna. It was officially opened in 1977 as \"Weststadion\" (Western stadium). In 1980 it was renamed to honour its architect, Austrian football player Gerhard Hanappi. Among fans the stadium was also known as \"Sankt Hanappi\" (Saint Hanappi), in reference to the fans\' slogan \"Rapid ist uns\'re Religion\" (\"Rapid is our religion\"). Source: Wikipedia.');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleNames` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) NOT NULL,
  `academicTitle` varchar(255) DEFAULT NULL,
  `photoUrl` varchar(255) DEFAULT NULL,
  `_teamId` int(11) NOT NULL,
  `_nationality` int(11) NOT NULL,
  `_roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personId`, `firstName`, `middleNames`, `lastName`, `academicTitle`, `photoUrl`, `_teamId`, `_nationality`, `_roleId`) VALUES
(1, 'Tanguy', NULL, 'Nianzou', NULL, '/assets/persons/tanguy-nianzou.jpg', 1, 61, 2),
(2, 'Manuel', NULL, 'Neuer', NULL, '/assets/persons/manuel-neuer.jpg', 1, 65, 3),
(3, 'Javi', NULL, 'Martínez', NULL, '/assets/persons/javi-martinez.jpg', 1, 65, 2),
(4, 'Joshua', NULL, 'Zirkzee', NULL, '/assets/persons/joshua-zirkzee.jpg', 1, 65, 2),
(5, 'Niklas', NULL, 'Süle', NULL, '/assets/persons/niklas-suele.jpg', 1, 65, 2),
(6, 'Jérôme', NULL, 'Boateng', NULL, '/assets/persons/jerome-boateng.jpg', 1, 65, 2),
(7, 'Eric', 'Maxim', 'Choupo-Moting', NULL, '/assets/persons/eric-choupo-moting.jpg', 1, 65, 2),
(8, 'Leon', NULL, 'Goretzka', NULL, '/assets/persons/leon-goretzka.jpg', 1, 65, 2),
(9, 'Chris', NULL, 'Richards', NULL, '/assets/persons/chris-richards.jpg', 1, 65, 2),
(10, 'Jamal', NULL, 'Musiala', NULL, '/assets/persons/jamal-musiala.jpg', 1, 65, 2),
(11, 'Marc', NULL, 'Roca', NULL, '/assets/persons/marc-roca.jpg', 1, 65, 2),
(12, 'Corentin', NULL, 'Tolisso', NULL, '/assets/persons/corentin-tolisso.jpg', 1, 65, 2),
(13, 'Robert', NULL, 'Lewandowski', NULL, '/assets/persons/robert-lewandowski.jpg', 1, 65, 2),
(14, 'Leroy', NULL, 'Sané', NULL, '/assets/persons/leroy-sane.jpg', 1, 65, 2),
(15, 'Thomas', NULL, 'Müller', NULL, '/assets/persons/thomas-mueller.jpg', 1, 65, 2),
(16, 'Lucas', NULL, 'Hernández', NULL, '/assets/persons/lucas-hernandez.jpg', 1, 65, 2),
(17, 'Alphonso', NULL, 'Davies', NULL, '/assets/persons/alphonso-davies.jpg', 1, 65, 2),
(18, 'David', NULL, 'Alaba', NULL, '/assets/persons/david-alaba.jpg', 1, 10, 2),
(19, 'Toni', NULL, 'Tapalović', NULL, '/assets/persons/toni-tapalovic.jpg', 1, 65, 2),
(20, 'Miroslav', NULL, 'Klose', NULL, '/assets/persons/miroslav-klose.jpg', 1, 65, 2),
(21, 'Hermann', NULL, 'Gerland', NULL, '/assets/persons/hermann-gerland.jpg', 1, 65, 2),
(22, 'Hansi', NULL, 'Flick', NULL, '/assets/persons/hansi-flick.jpg', 1, 65, 2),
(23, 'Danny', NULL, 'Röhl', NULL, '/assets/persons/danny-roehl.jpg', 1, 65, 2),
(24, 'Holger', NULL, 'Broich', 'Prof. Dr.', '/assets/persons/holger-broich.jpg', 1, 65, 4),
(25, 'Kingsley', NULL, 'Coman', NULL, '/assets/persons/kingsley-coman.jpg', 1, 65, 4);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `name`) VALUES
(1, 'Trainer (Coach)'),
(2, 'Player'),
(3, 'Team Captain'),
(4, 'Doctor');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `_categoryId` int(11) NOT NULL,
  `_leagueId` int(11) DEFAULT NULL,
  `leagueRanking` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`teamId`, `name`, `logoUrl`, `_categoryId`, `_leagueId`, `leagueRanking`, `description`) VALUES
(1, 'FC Bayern München', 'assets/logos/fc-bayern-logo.png', 1, 3, 1, 'Fußball-Club Bayern München e.V. is a German professional sports club based in Munich, Bavaria. It is best known for its professional football team, which plays in the Bundesliga, the top tier of the German football league system, and is the most successful club in German football history, having won a record 30 national titles, including eight consecutively since 2013, and 20 national cups, along with numerous European honours. Source: Wikipedia.'),
(2, 'SK Rapid Wien', 'assets/logos/rapid-wien-logo.png', 1, 2, 4, 'Sportklub Rapid Wien, commonly known as Rapid Vienna, is an Austrian football club playing in the country\'s capital city of Vienna. Rapid has won the most Austrian championship titles (32), including the first title in the season 1911–12, as well as a German championship in 1941 during Nazi rule. Rapid twice reached the final of the European Cup Winners\' Cup in 1985 and 1996, losing on both occasions. The club is often known as Die Grün-Weißen (The Green-Whites) for its team colours or as Hütteldorfer, in reference to the location of the Gerhard Hanappi Stadium, which is in Hütteldorf, part of the city\'s 14th district in Penzing. Source: Wikipedia.'),
(3, 'Paris Saint-Germain F.C.', 'assets/logos/paris-saint-germain.png', 1, 4, 3, 'Paris Saint-Germain Football Club, commonly referred to as Paris Saint-Germain, is a French professional football club based in Paris. They compete in Ligue 1, the top division of French football. PSG are one of France\'s most successful clubs, having won more than 40 official honours, including nine league titles and one major European trophy. Their home ground is the Parc des Princes. Source: Wikipedia.'),
(4, 'FC Barcelona', 'assets/logos/fc-barcelona-logo.png', 1, 5, 5, 'Futbol Club Barcelona, commonly referred to as Barcelona and colloquially known as Barça, is a Spanish professional football club based in Barcelona, that competes in La Liga, the top flight of Spanish football. Source: Wikipedia.'),
(5, 'Manchester United F.C.', 'assets/logos/manchester-united-logo.png', 1, 6, 3, 'Manchester United Football Club is a professional football club based in Old Trafford, Greater Manchester, England, that competes in the Premier League, the top flight of English football. Nicknamed \"the Red Devils\", the club was founded as Newton Heath LYR Football Club in 1878, changed its name to Manchester United in 1902 and moved to its current stadium, Old Trafford, in 1910.'),
(6, 'EC KAC', 'assets/logos/kac-logo.png', 3, 1, 4, 'Klagenfurt Athletic Sports Club or EC KAC (German: Klagenfurter Athletiksport Club) is a professional ice hockey team in the Austrian Erste Bank Hockey League. The team plays their home games in Klagenfurt, Carinthia, Austria at Stadthalle Klagenfurt. EC KAC has won the most Austrian ice hockey Championships, a total of 31 times including 11 consecutive titles from 1964 to 1974, and four consecutive from 1985 to 1988. Most recently they won it in 2019. Source: Wikipedia.'),
(7, 'Steinbach Black Wings 1992 (EHC Linz)', 'assets/logos/black-wings-logo.png', 3, 1, 7, 'The Steinbach Black Wings 1992 are a member of the Austrian Hockey League. They play their home games in Linz, Austria at the Linz AG Eisarena.'),
(8, 'SK Sturm Graz', 'assets/logos/sturm-graz.png', 1, 2, 2, 'Sportklub Sturm Graz is an Austrian association football club, based in Graz, Styria, playing in the Austrian Football Bundesliga. The club was founded in 1909. Its colours are black and white. In its history, Sturm Graz has won the Austrian football championship three times, in 1998, 1999 and 2011, and participated several times in the UEFA Champions League and UEFA Europa League. Their biggest rivals are Graz neighbours Grazer AK. Source: Wikipedia.'),
(9, 'FC Red Bull Salzburg', 'assets/logos/red-bull-salzburg.png', 1, 2, 1, 'FC Red Bull Salzburg is an Austrian professional football club based in Wals-Siezenheim, that competes in the Austrian Bundesliga, the top flight of Austrian Football. Their home ground is the Red Bull Arena. Due to sponsorship restrictions, the club is known as FC Salzburg and wears a modified crest when playing in UEFA competitions. The club was known as SV Austria Salzburg, and had several sponsored names, before being bought by Red Bull GmbH in 2005 who renamed the club and changed its colours from its traditional violet and white to red and white. The change resulted in some of the team\'s fans forming a new club, SV Austria Salzburg. Source: Wikipedia.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `contenders`
--
ALTER TABLE `contenders`
  ADD PRIMARY KEY (`contendersId`),
  ADD KEY `contenders-teamA` (`_teamIdA`),
  ADD KEY `contenders-teamB` (`_teamIdB`);

--
-- Indexes for table `contest`
--
ALTER TABLE `contest`
  ADD PRIMARY KEY (`contestId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventId`),
  ADD KEY `event-contest` (`_contestId`),
  ADD KEY `event-location` (`_locationId`),
  ADD KEY `event-category` (`_categoryId`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`leagueId`),
  ADD KEY `league-country` (`_countryId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationId`),
  ADD KEY `location-country` (`_countryId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`),
  ADD KEY `person-team` (`_teamId`),
  ADD KEY `person-nationality` (`_nationality`),
  ADD KEY `person-role` (`_roleId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamId`),
  ADD KEY `team-category` (`_categoryId`),
  ADD KEY `team-league` (`_leagueId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contenders`
--
ALTER TABLE `contenders`
  MODIFY `contendersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contest`
--
ALTER TABLE `contest`
  MODIFY `contestId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `countryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `leagueId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `teamId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contenders`
--
ALTER TABLE `contenders`
  ADD CONSTRAINT `contenders-teamA` FOREIGN KEY (`_teamIdA`) REFERENCES `team` (`teamId`),
  ADD CONSTRAINT `contenders-teamB` FOREIGN KEY (`_teamIdB`) REFERENCES `team` (`teamId`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event-category` FOREIGN KEY (`_categoryId`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `event-contest` FOREIGN KEY (`_contestId`) REFERENCES `contest` (`contestId`),
  ADD CONSTRAINT `event-location` FOREIGN KEY (`_locationId`) REFERENCES `location` (`locationId`);

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league-country` FOREIGN KEY (`_countryId`) REFERENCES `country` (`countryId`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location-country` FOREIGN KEY (`_countryId`) REFERENCES `country` (`countryId`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person-nationality` FOREIGN KEY (`_nationality`) REFERENCES `country` (`countryId`),
  ADD CONSTRAINT `person-role` FOREIGN KEY (`_roleId`) REFERENCES `role` (`roleId`),
  ADD CONSTRAINT `person-team` FOREIGN KEY (`_teamId`) REFERENCES `team` (`teamId`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team-category` FOREIGN KEY (`_categoryId`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `team-league` FOREIGN KEY (`_leagueId`) REFERENCES `league` (`leagueId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
