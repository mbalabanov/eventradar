-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2020 at 08:06 PM
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
(1, 'Afghanistan', '/assets/flags/flag-of-Afghanistan.png'),
(2, 'Albania', '/assets/flags/flag-of-Albania.png'),
(3, 'Algeria', '/assets/flags/flag-of-Algeria.png'),
(4, 'Andorra', '/assets/flags/flag-of-Andorra.png'),
(5, 'Angola', '/assets/flags/flag-of-Angola.png'),
(6, 'Antigua and Barbuda', '/assets/flags/flag-of-Antigua.png'),
(7, 'Argentina', '/assets/flags/flag-of-Argentina.png'),
(8, 'Armenia', '/assets/flags/flag-of-Armenia.png'),
(9, 'Australia', '/assets/flags/flag-of-Australia.png'),
(10, 'Austria', '/assets/flags/flag-of-Austria.png'),
(11, 'Azerbaijan', '/assets/flags/flag-of-Azerbaijan.png'),
(12, 'Bahamas', '/assets/flags/flag-of-Bahamas.png'),
(13, 'Bahrain', '/assets/flags/flag-of-Bahrain.png'),
(14, 'Bangladesh', '/assets/flags/flag-of-Bangladesh.png'),
(15, 'Barbados', '/assets/flags/flag-of-Barbados.png'),
(16, 'Belarus', '/assets/flags/flag-of-Belarus.png'),
(17, 'Belgium', '/assets/flags/flag-of-Belgium.png'),
(18, 'Belize', '/assets/flags/flag-of-Belize.png'),
(19, 'Benin', '/assets/flags/flag-of-Benin.png'),
(20, 'Bhutan', '/assets/flags/flag-of-Bhutan.png'),
(21, 'Bolivia', '/assets/flags/flag-of-Bolivia.png'),
(22, 'Bosnia and Herzegovina', '/assets/flags/flag-of-Bosnia-Herzegovina.png'),
(23, 'Botswana', '/assets/flags/flag-of-Botswana.png'),
(24, 'Brazil', '/assets/flags/flag-of-Brazil.png'),
(25, 'Brunei ', '/assets/flags/flag-of-Brunei.png'),
(26, 'Bulgaria', '/assets/flags/flag-of-Bulgaria.png'),
(27, 'Burkina Faso', '/assets/flags/flag-of-Burkina-Faso.png'),
(28, 'Burundi', '/assets/flags/flag-of-Burundi.png'),
(29, 'Côte D\'Ivoire (Ivory Coast)', '/assets/flags/flag-of-Cote-d-Ivoire.png'),
(30, 'Cabo Verde', '/assets/flags/flag-of-Cabo-Verde.png'),
(31, 'Cambodia', '/assets/flags/flag-of-Cambodia.png'),
(32, 'Cameroon', '/assets/flags/flag-of-Cameroon.png'),
(33, 'Canada', '/assets/flags/flag-of-Canada.png'),
(34, 'Central African Republic', '/assets/flags/flag-of-Central-African-Republic.png'),
(35, 'Chad', '/assets/flags/flag-of-Chad.png'),
(36, 'Chile', '/assets/flags/flag-of-Chile.png'),
(37, 'China', '/assets/flags/flag-of-China.png'),
(38, 'Colombia', '/assets/flags/flag-of-Colombia.png'),
(39, 'Comoros', '/assets/flags/flag-of-Comoros.png'),
(40, 'Congo (Congo-Brazzaville)', '/assets/flags/flag-of-Congo.png'),
(41, 'Costa Rica', '/assets/flags/flag-of-Costa-Rica.png'),
(42, 'Croatia', '/assets/flags/flag-of-Croatia.png'),
(43, 'Cuba', '/assets/flags/flag-of-Cuba.png'),
(44, 'Cyprus', '/assets/flags/flag-of-Cyprus.png'),
(45, 'Czechia (Czech Republic)', '/assets/flags/flag-of-Czech-Republic.png'),
(46, 'Democratic Republic of the Congo', '/assets/flags/flag-of-Congo-Democratic-Republic-of.png'),
(47, 'Denmark', '/assets/flags/flag-of-Denmark.png'),
(48, 'Djibouti', '/assets/flags/flag-of-Djibouti.png'),
(49, 'Dominica', '/assets/flags/flag-of-Dominica.png'),
(50, 'Dominican Republic', '/assets/flags/flag-of-Dominican-Republic.png'),
(51, 'Ecuador', '/assets/flags/flag-of-Ecuador.png'),
(52, 'Egypt', '/assets/flags/flag-of-Egypt.png'),
(53, 'El Salvador', '/assets/flags/flag-of-El-Salvador.png'),
(54, 'Equatorial Guinea', '/assets/flags/flag-of-Equatorial-Guinea.png'),
(55, 'Eritrea', '/assets/flags/flag-of-Eritrea.png'),
(56, 'Estonia', '/assets/flags/flag-of-Estonia.png'),
(57, 'Eswatini (fmr. Swaziland)', '/assets/flags/flag-of-Eswatini.png'),
(58, 'Ethiopia', '/assets/flags/flag-of-Ethiopia.png'),
(59, 'Fiji', '/assets/flags/flag-of-Fiji.png'),
(60, 'Finland', '/assets/flags/flag-of-Finland.png'),
(61, 'France', '/assets/flags/flag-of-France.png'),
(62, 'Gabon', '/assets/flags/flag-of-Gabon.png'),
(63, 'Gambia', '/assets/flags/flag-of-Gambia.png'),
(64, 'Georgia', '/assets/flags/flag-of-Georgia.png'),
(65, 'Germany', '/assets/flags/flag-of-Germany.png'),
(66, 'Ghana', '/assets/flags/flag-of-Ghana.png'),
(67, 'Greece', '/assets/flags/flag-of-Greece.png'),
(68, 'Grenada', '/assets/flags/flag-of-Grenada.png'),
(69, 'Guatemala', '/assets/flags/flag-of-Guatemala.png'),
(70, 'Guinea', '/assets/flags/flag-of-Guinea.png'),
(71, 'Guinea-Bissau', '/assets/flags/flag-of-Guinea-Bissau.png'),
(72, 'Guyana', '/assets/flags/flag-of-Guyana.png'),
(73, 'Haiti', '/assets/flags/flag-of-Haiti.png'),
(74, 'Holy See (Vatican City)', '/assets/flags/flag-of-Vatican-City.png'),
(75, 'Honduras', '/assets/flags/flag-of-Honduras.png'),
(76, 'Hungary', '/assets/flags/flag-of-Hungary.png'),
(77, 'Iceland', '/assets/flags/flag-of-Iceland.png'),
(78, 'India', '/assets/flags/flag-of-India.png'),
(79, 'Indonesia', '/assets/flags/flag-of-Indonesia.png'),
(80, 'Iran', '/assets/flags/flag-of-Iran.png'),
(81, 'Iraq', '/assets/flags/flag-of-Iraq.png'),
(82, 'Ireland', '/assets/flags/flag-of-Ireland.png'),
(83, 'Israel', '/assets/flags/flag-of-Israel.png'),
(84, 'Italy', '/assets/flags/flag-of-Italy.png'),
(85, 'Jamaica', '/assets/flags/flag-of-Jamaica.png'),
(86, 'Japan', '/assets/flags/flag-of-Japan.png'),
(87, 'Jordan', '/assets/flags/flag-of-Jordan.png'),
(88, 'Kazakhstan', '/assets/flags/flag-of-Kazakhstan.png'),
(89, 'Kenya', '/assets/flags/flag-of-Kenya.png'),
(90, 'Kiribati', '/assets/flags/flag-of-Kiribati.png'),
(91, 'Kuwait', '/assets/flags/flag-of-Kuwait.png'),
(92, 'Kyrgyzstan', '/assets/flags/flag-of-Kyrgyzstan.png'),
(93, 'Laos', '/assets/flags/flag-of-Laos.png'),
(94, 'Latvia', '/assets/flags/flag-of-Latvia.png'),
(95, 'Lebanon', '/assets/flags/flag-of-Lebanon.png'),
(96, 'Lesotho', '/assets/flags/flag-of-Lesotho.png'),
(97, 'Liberia', '/assets/flags/flag-of-Liberia.png'),
(98, 'Libya', '/assets/flags/flag-of-Libya.png'),
(99, 'Liechtenstein', '/assets/flags/flag-of-Liechtenstein.png'),
(100, 'Lithuania', '/assets/flags/flag-of-Lithuania.png'),
(101, 'Luxembourg', '/assets/flags/flag-of-Luxembourg.png'),
(102, 'Madagascar', '/assets/flags/flag-of-Madagascar.png'),
(103, 'Malawi', '/assets/flags/flag-of-Malawi.png'),
(104, 'Malaysia', '/assets/flags/flag-of-Malaysia.png'),
(105, 'Maldives', '/assets/flags/flag-of-Maldives.png'),
(106, 'Mali', '/assets/flags/flag-of-Mali.png'),
(107, 'Malta', '/assets/flags/flag-of-Malta.png'),
(108, 'Marshall Islands', '/assets/flags/flag-of-Marshall-Islands.png'),
(109, 'Mauritania', '/assets/flags/flag-of-Mauritania.png'),
(110, 'Mauritius', '/assets/flags/flag-of-Mauritius.png'),
(111, 'Mexico', '/assets/flags/flag-of-Mexico.png'),
(112, 'Micronesia', '/assets/flags/flag-of-Micronesia.png'),
(113, 'Moldova', '/assets/flags/flag-of-Moldova.png'),
(114, 'Monaco', '/assets/flags/flag-of-Monaco.png'),
(115, 'Mongolia', '/assets/flags/flag-of-Mongolia.png'),
(116, 'Montenegro', '/assets/flags/flag-of-Montenegro.png'),
(117, 'Morocco', '/assets/flags/flag-of-Morocco.png'),
(118, 'Mozambique', '/assets/flags/flag-of-Mozambique.png'),
(119, 'Myanmar (formerly Burma)', '/assets/flags/flag-of-Myanmar.png'),
(120, 'Namibia', '/assets/flags/flag-of-Namibia.png'),
(121, 'Nauru', '/assets/flags/flag-of-Nauru.png'),
(122, 'Nepal', '/assets/flags/flag-of-Nepal.png'),
(123, 'Netherlands', '/assets/flags/flag-of-Netherlands.png'),
(124, 'New Zealand', '/assets/flags/flag-of-New-Zealand.png'),
(125, 'Nicaragua', '/assets/flags/flag-of-Nicaragua.png'),
(126, 'Niger', '/assets/flags/flag-of-Niger.png'),
(127, 'Nigeria', '/assets/flags/flag-of-Nigeria.png'),
(128, 'North Korea', '/assets/flags/flag-of-Korea-North.png'),
(129, 'North Macedonia', '/assets/flags/flag-of-North-Macedonia.png'),
(130, 'Norway', '/assets/flags/flag-of-Norway.png'),
(131, 'Oman', '/assets/flags/flag-of-Oman.png'),
(132, 'Pakistan', '/assets/flags/flag-of-Pakistan.png'),
(133, 'Palau', '/assets/flags/flag-of-Palau.png'),
(134, 'Palestine State', '/assets/flags/flag-of-Palestine.png'),
(135, 'Panama', '/assets/flags/flag-of-Panama.png'),
(136, 'Papua New Guinea', '/assets/flags/flag-of-Papua-New-Guinea.png'),
(137, 'Paraguay', '/assets/flags/flag-of-Paraguay.png'),
(138, 'Peru', '/assets/flags/flag-of-Peru.png'),
(139, 'Philippines', '/assets/flags/flag-of-Philippines.png'),
(140, 'Poland', '/assets/flags/flag-of-Poland.png'),
(141, 'Portugal', '/assets/flags/flag-of-Portugal.png'),
(142, 'Qatar', '/assets/flags/flag-of-Qatar.png'),
(143, 'Romania', '/assets/flags/flag-of-Romania.png'),
(144, 'Russia', '/assets/flags/flag-of-Russia.png'),
(145, 'Rwanda', '/assets/flags/flag-of-Rwanda.png'),
(146, 'Saint Kitts and Nevis', '/assets/flags/flag-of-St-Kitts-Nevis.png'),
(147, 'Saint Lucia', '/assets/flags/flag-of-St-Lucia.png'),
(148, 'Saint Vincent and the Grenadines', '/assets/flags/flag-of-St-Vincent-the-Grenadines.png'),
(149, 'Samoa', '/assets/flags/flag-of-Samoa.png'),
(150, 'San Marino', '/assets/flags/flag-of-San-Marino.png'),
(151, 'Sao Tome and Principe', '/assets/flags/flag-of-Sao-Tome-and-Principe.png'),
(152, 'Saudi Arabia', '/assets/flags/flag-of-Saudi-Arabia.png'),
(153, 'Senegal', '/assets/flags/flag-of-Senegal.png'),
(154, 'Serbia', '/assets/flags/flag-of-Serbia.png'),
(155, 'Seychelles', '/assets/flags/flag-of-Seychelles.png'),
(156, 'Sierra Leone', '/assets/flags/flag-of-Sierra-Leone.png'),
(157, 'Singapore', '/assets/flags/flag-of-Singapore.png'),
(158, 'Slovakia', '/assets/flags/flag-of-Slovakia.png'),
(159, 'Slovenia', '/assets/flags/flag-of-Slovenia.png'),
(160, 'Solomon Islands', '/assets/flags/flag-of-Solomon-Islands.png'),
(161, 'Somalia', '/assets/flags/flag-of-Somalia.png'),
(162, 'South Africa', '/assets/flags/flag-of-South-Africa.png'),
(163, 'South Korea', '/assets/flags/flag-of-Korea-South.png'),
(164, 'South Sudan', '/assets/flags/flag-of-South-Sudan.png'),
(165, 'Spain', '/assets/flags/flag-of-Spain.png'),
(166, 'Sri Lanka', '/assets/flags/flag-of-Sri-Lanka.png'),
(167, 'Sudan', '/assets/flags/flag-of-Sudan.png'),
(168, 'Suriname', '/assets/flags/flag-of-Suriname.png'),
(169, 'Sweden', '/assets/flags/flag-of-Sweden.png'),
(170, 'Switzerland', '/assets/flags/flag-of-Switzerland.png'),
(171, 'Syria', '/assets/flags/flag-of-Syria.png'),
(172, 'Tajikistan', '/assets/flags/flag-of-Tajikistan.png'),
(173, 'Tanzania', '/assets/flags/flag-of-Tanzania.png'),
(174, 'Thailand', '/assets/flags/flag-of-Thailand.png'),
(175, 'Timor-Leste', '/assets/flags/flag-of-Timor-Leste.png'),
(176, 'Togo', '/assets/flags/flag-of-Togo.png'),
(177, 'Tonga', '/assets/flags/flag-of-Tonga.png'),
(178, 'Trinidad and Tobago', '/assets/flags/flag-of-Trinidad-and-Tobago.png'),
(179, 'Tunisia', '/assets/flags/flag-of-Tunisia.png'),
(180, 'Turkey', '/assets/flags/flag-of-Turkey.png'),
(181, 'Turkmenistan', '/assets/flags/flag-of-Turkmenistan.png'),
(182, 'Tuvalu', '/assets/flags/flag-of-Tuvalu.png'),
(183, 'Uganda', '/assets/flags/flag-of-Uganda.png'),
(184, 'Ukraine', '/assets/flags/flag-of-Ukraine.png'),
(185, 'United Arab Emirates', '/assets/flags/flag-of-United-Arab-Emirates.png'),
(186, 'United Kingdom', '/assets/flags/flag-of-United-Kingdom.png'),
(187, 'United States of America', '/assets/flags/flag-of-United-States-of-America.png'),
(188, 'Uruguay', '/assets/flags/flag-of-Uruguay.png'),
(189, 'Uzbekistan', '/assets/flags/flag-of-Uzbekistan.png'),
(190, 'Vanuatu', '/assets/flags/flag-of-Vanuatu.png'),
(191, 'Venezuela', '/assets/flags/flag-of-Venezuela.png'),
(192, 'Vietnam', '/assets/flags/flag-of-Vietnam.png'),
(193, 'Yemen', '/assets/flags/flag-of-Yemen.png'),
(194, 'Zambia', '/assets/flags/flag-of-Zambia.png'),
(195, 'Zimbabwe', '/assets/flags/flag-of-Zimbabwe.png');

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
(1, '2021-03-06 19:00:00', 'Battle of the Century', '/assets/events/promo1.jpg', 1, 0, 2, 0, 1, 1, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(2, '2021-05-09 19:00:00', 'Rematch of the Century', '/assets/events/promo2.jpg', 2, 0, 1, 0, 1, 1, 1, 'Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo.');

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
(1, 'bet-at-home Eishockey-Liga', '/assets/logos/bet-at-home-eishockey-liga-logo.png', 'ice.hockey', 10),
(2, 'Tipico Bundesliga', '/assets/logos/tipico-bundesliga.png', 'bundesliga.at', 10),
(3, 'Deutsche Bundesliga', '/assets/logos/deutsche-bundesliga-logo.png', 'bundesliga.de', 65),
(4, 'Ligue 1', '/assets/logos/ligue1-france.png', 'ligue1.fr', 61),
(5, 'La Liga', '/assets/logos/la-liga-espana.png', 'laliga.com', 165),
(6, 'Premier League', '/assets/logos/premier-league-logo.png', 'premierleague.com', 186);

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
(3, 'Javi', NULL, 'Martínez', NULL, '/assets/persons/javi-martinez.jpg', 1, 165, 2),
(4, 'Joshua', NULL, 'Zirkzee', NULL, '/assets/persons/joshua-zirkzee.jpg', 1, 123, 2),
(5, 'Niklas', NULL, 'Süle', NULL, '/assets/persons/niklas-suele.jpg', 1, 65, 2),
(6, 'Jérôme', NULL, 'Boateng', NULL, '/assets/persons/jerome-boateng.jpg', 1, 65, 2),
(7, 'Eric', 'Maxim', 'Choupo-Moting', NULL, '/assets/persons/eric-choupo-moting.jpg', 1, 65, 2),
(8, 'Leon', NULL, 'Goretzka', NULL, '/assets/persons/leon-goretzka.jpg', 1, 65, 2),
(9, 'Chris', NULL, 'Richards', NULL, '/assets/persons/chris-richards.jpg', 1, 187, 2),
(10, 'Jamal', NULL, 'Musiala', NULL, '/assets/persons/jamal-musiala.jpg', 1, 65, 2),
(11, 'Marc', NULL, 'Roca', NULL, '/assets/persons/marc-roca.jpg', 1, 165, 2),
(12, 'Corentin', NULL, 'Tolisso', NULL, '/assets/persons/corentin-tolisso.jpg', 1, 61, 2),
(13, 'Robert', NULL, 'Lewandowski', NULL, '/assets/persons/robert-lewandowski.jpg', 1, 140, 2),
(14, 'Leroy', NULL, 'Sané', NULL, '/assets/persons/leroy-sane.jpg', 1, 65, 2),
(15, 'Thomas', NULL, 'Müller', NULL, '/assets/persons/thomas-mueller.jpg', 1, 65, 2),
(16, 'Lucas', NULL, 'Hernández', NULL, '/assets/persons/lucas-hernandez.jpg', 1, 61, 2),
(17, 'Alphonso', NULL, 'Davies', NULL, '/assets/persons/alphonso-davies.jpg', 1, 66, 2),
(18, 'David', NULL, 'Alaba', NULL, '/assets/persons/david-alaba.jpg', 1, 10, 2),
(19, 'Toni', NULL, 'Tapalović', NULL, '/assets/persons/toni-tapalovic.jpg', 1, 65, 2),
(20, 'Miroslav', NULL, 'Klose', NULL, '/assets/persons/miroslav-klose.jpg', 1, 140, 2),
(21, 'Hermann', NULL, 'Gerland', NULL, '/assets/persons/hermann-gerland.jpg', 1, 65, 1),
(22, 'Hansi', NULL, 'Flick', NULL, '/assets/persons/hansi-flick.jpg', 1, 65, 1),
(23, 'Danny', NULL, 'Röhl', NULL, '/assets/persons/danny-roehl.jpg', 1, 65, 1),
(24, 'Holger', NULL, 'Broich', 'Prof. Dr.', '/assets/persons/holger-broich.jpg', 1, 65, 4),
(25, 'Kingsley', NULL, 'Coman', NULL, '/assets/persons/kingsley-coman.jpg', 1, 61, 2),
(26, 'Augustus', NULL, 'Barrs', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(27, 'Colby', 'Pasquale', 'Truesdale', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(28, 'Byron', NULL, 'Edenfield', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(29, 'Marcus', NULL, 'Headley', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(30, 'Jarod', NULL, 'Fairey', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(31, 'Ike', NULL, 'Hornick', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(32, 'Manual', NULL, 'Nolette', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(33, 'Gonzalo', 'Eliseo', 'Woolsey', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(34, 'Stanton', NULL, 'Zielinski', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(35, 'Elvis', NULL, 'Beckman', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(36, 'Porfirio', NULL, 'Fonte', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(37, 'Brice', NULL, 'Focht', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(38, 'Zackary', 'Julio', 'Ochs', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(39, 'Mohammed', NULL, 'Reddix', NULL, '/assets/persons/person-placeholder.jpg', 3, 61, 2),
(40, 'Shaun', NULL, 'Wragg', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(41, 'Kenneth', NULL, 'Scheffler', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(42, 'Gonzalo', NULL, 'Vaughn', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(43, 'Renato', NULL, 'Eberhart', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(44, 'Adalberto', NULL, 'Racicot', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(45, 'Ronnie', NULL, 'Journey', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(46, 'Moises', NULL, 'Labarre', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(47, 'Bobbie', NULL, 'Kissane', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(48, 'Rudy', NULL, 'Ammann', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(49, 'Les', NULL, 'Ryce', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(50, 'Caleb', NULL, 'Mcguire', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(51, 'Felipe', NULL, 'Najera', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(52, 'Ronny', NULL, 'Marney', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(53, 'Earl', NULL, 'Fettig', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(54, 'Ed', NULL, 'Omalley', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(55, 'Teodoro', NULL, 'Cancel', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(56, 'Rey', NULL, 'Mozingo', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(57, 'Jason', NULL, 'Lafromboise', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(58, 'Sanford', NULL, 'Scheck', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(59, 'Clair', NULL, 'Okane', NULL, '/assets/persons/person-placeholder-hockey.jpg', 7, 10, 2),
(60, 'Franklin', NULL, 'Baumgartner', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(61, 'Taylor', NULL, 'Auslander', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(62, 'Kevin', NULL, 'Rasor', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(63, 'Joshua', NULL, 'Delahoussaye', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(64, 'Rosario', NULL, 'Olah', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(65, 'Lavern', NULL, 'Joshi', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(66, 'Julius', NULL, 'Shehorn', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(67, 'Albert', NULL, 'Winbush', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(68, 'Neville', NULL, 'Hornbuckle', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(69, 'Dale', NULL, 'Murawski', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(70, 'Rod', NULL, 'Matzen', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(71, 'Jack', NULL, 'Belfield', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(72, 'Denis', NULL, 'Maher', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(73, 'Alva', NULL, 'Buchta', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(74, 'Adolfo', NULL, 'Lout', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(75, 'Buck', NULL, 'Prada', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(76, 'Rodrick', NULL, 'Piazza', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(77, 'Randolph', NULL, 'Monteleone', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(78, 'Felix', NULL, 'Shorter', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(79, 'Franklin', NULL, 'Baumgartner', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(80, 'Taylor', NULL, 'Auslander', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(81, 'Kevin', NULL, 'Rasor', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(82, 'Joshua', NULL, 'Delahoussaye', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(83, 'Rosario', NULL, 'Olah', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(84, 'Lavern', NULL, 'Joshi', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(85, 'Julius', NULL, 'Shehorn', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(86, 'Albert', NULL, 'Winbush', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(87, 'Neville', NULL, 'Hornbuckle', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(88, 'Dale', NULL, 'Murawski', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(89, 'Rod', NULL, 'Matzen', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(90, 'Jack', NULL, 'Belfield', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(91, 'Denis', NULL, 'Maher', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(92, 'Alva', NULL, 'Buchta', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(93, 'Adolfo', NULL, 'Lout', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(94, 'Buck', NULL, 'Prada', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(95, 'Rodrick', NULL, 'Piazza', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(96, 'Randolph', NULL, 'Monteleone', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(97, 'Felix', NULL, 'Shorter', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(98, 'Randolph', NULL, 'Monteleone', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(99, 'Felix', NULL, 'Shorter', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(100, 'Elvin', NULL, 'Burford', NULL, '/assets/persons/person-placeholder-hockey.jpg', 6, 10, 2),
(101, 'Hilton', NULL, 'Reames', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(102, 'Darin', NULL, 'Rush', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(103, 'Alexis', NULL, 'Boice', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(104, 'Devin', NULL, 'Bowsher', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(105, 'Millard', NULL, 'Balling', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(106, 'Jae', NULL, 'Hoke', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(107, 'Lupe', NULL, 'Jordon', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(108, 'Enoch', NULL, 'Castelli', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(109, 'Timmy', NULL, 'Pepin', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(110, 'Mel', NULL, 'Hynson', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(111, 'Desmond', NULL, 'Garn', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(112, 'Kurt', NULL, 'Minard', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(113, 'Rashad', NULL, 'Caceres', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(114, 'Ahmad', NULL, 'Poissant', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(115, 'Max', NULL, 'Barrows', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(116, 'Carlos', NULL, 'Prahl', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(117, 'Dewey', NULL, 'Suter', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(118, 'Raymond', NULL, 'Vesely', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(119, 'Gordon', NULL, 'Mcclure', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(120, 'Jacob', NULL, 'Roberge', NULL, '/assets/persons/person-placeholder-hockey.jpg', 10, 10, 2),
(121, 'Richard', NULL, 'Strebinger', NULL, '/assets/persons/richard-strebinger.jpg', 2, 10, 2),
(122, 'Bernhard', NULL, 'Unger', NULL, '/assets/persons/bernhard-unger.jpg', 2, 10, 2),
(123, 'Paul', NULL, 'Gartler', NULL, '/assets/persons/paul-gartler.jpg', 2, 10, 2),
(124, 'Mateo', NULL, 'Barac', NULL, '/assets/persons/mateo-barac.jpg', 2, 42, 2),
(125, 'Mario', NULL, 'Sonnleitner', NULL, '/assets/persons/mario-sonnleitner.jpg', 2, 10, 2),
(126, 'Christopher', NULL, 'Dibon', NULL, '/assets/persons/christopher-dibon.jpg', 2, 10, 2),
(127, 'Maximilian', NULL, 'Hofmann', NULL, '/assets/persons/max-hofmann.jpg', 2, 10, 2),
(128, 'Filip', NULL, 'Stojkovic', NULL, '/assets/persons/filip-stojkovic.jpg', 2, 116, 2),
(129, 'Leo', NULL, 'Greiml', NULL, '/assets/persons/leo-greiml.jpg', 2, 10, 2),
(130, 'Maximilian', NULL, 'Ullmann', NULL, '/assets/persons/max-ullmann.jpg', 2, 10, 2),
(131, 'Lukas', NULL, 'Sulzbacher', NULL, '/assets/persons/person-placeholder-rapid.jpg', 2, 10, 2),
(132, 'Adrian', NULL, 'Hajdari', NULL, '/assets/persons/adrian-hajdari.jpg', 2, 10, 2),
(133, 'Paul', NULL, 'Gobara', NULL, '/assets/persons/paul-gobara.jpg', 2, 10, 2),
(134, 'Marcel', NULL, 'Ritzmaier', NULL, '/assets/persons/marcel-ritzmaier.jpg', 2, 10, 2),
(135, 'Thorsten', NULL, 'Schick', NULL, '/assets/persons/thorsten-schick.jpg', 2, 10, 2),
(136, 'Srdjan', NULL, 'Grahovac', NULL, '/assets/persons/srdjan-grahovac.jpg', 2, 22, 2),
(137, 'Dejan', NULL, 'Petrovic', NULL, '/assets/persons/dejan-petrovic.jpg', 2, 159, 2),
(138, 'Tamás', NULL, 'Szántó', NULL, '/assets/persons/tamas-szanto.jpg', 2, 76, 2),
(139, 'Christoph', NULL, 'Knasmüllner', NULL, '/assets/persons/christopher-knasmuellner.jpg', 2, 10, 2),
(140, 'Dejan', NULL, 'Ljubicic', NULL, '/assets/persons/dejan-ljubicic.jpg', 2, 10, 2),
(141, 'Melih', NULL, 'Ibrahimoglu', NULL, '/assets/persons/melih-ibrahimoglu.jpg', 2, 10, 2),
(142, 'Lion', NULL, 'Schuster', NULL, '/assets/persons/person-placeholder-rapid.jpg', 2, 10, 2),
(143, 'Dragoljub', NULL, 'Savic', NULL, '/assets/persons/dragoljub-savic.jpg', 2, 154, 2),
(144, 'Dalibor', NULL, 'Velimirovic', NULL, '/assets/persons/dalibor-velimirovic.jpg', 2, 10, 2),
(145, 'Philipp', NULL, 'Schobesberger', NULL, '/assets/persons/philipp-schobesberger.jpg', 2, 10, 2),
(146, 'Taxiarchis', NULL, 'Fountas', NULL, '/assets/persons/taxi-fountas.jpg', 2, 67, 2),
(147, 'Deni', NULL, 'Alar', NULL, '/assets/persons/deni-alar.jpg', 2, 10, 2),
(148, 'Ercan', NULL, 'Kara', NULL, '/assets/persons/ercan-kara.jpg', 2, 10, 2),
(149, 'Koya', NULL, 'Kitagawa', NULL, '/assets/persons/koya-kitagawa.jpg', 2, 86, 2),
(150, 'Kelvin', NULL, 'Arase', NULL, '/assets/persons/kelvin-arase.jpg', 2, 10, 2),
(151, 'Yusuf', NULL, 'Demir', NULL, '/assets/persons/yusuf-demir.jpg', 2, 10, 2);

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
(1, 'FC Bayern München', '/assets/logos/fc-bayern-logo.png', 1, 3, 1, 'Fußball-Club Bayern München e.V. is a German professional sports club based in Munich, Bavaria. It is best known for its professional football team, which plays in the Bundesliga, the top tier of the German football league system, and is the most successful club in German football history, having won a record 30 national titles, including eight consecutively since 2013, and 20 national cups, along with numerous European honours. Source: Wikipedia.'),
(2, 'SK Rapid Wien', '/assets/logos/rapid-wien-logo.png', 1, 2, 4, 'Sportklub Rapid Wien, commonly known as Rapid Vienna, is an Austrian football club playing in the country\'s capital city of Vienna.  Rapid twice reached the final of the European Cup Winners\' Cup in 1985 and 1996, losing on both occasions. The club is often known as \"Die Grün-Weißen\" (The Green-Whites) for its team colours or as Hütteldorfer, in reference to the location of the Gerhard Hanappi Stadium, which is in Hütteldorf, part of the city\'s 14th district in Penzing. Source: Wikipedia.'),
(3, 'Paris Saint-Germain F.C.', '/assets/logos/paris-saint-germain.png', 1, 4, 3, 'Paris Saint-Germain Football Club, commonly referred to as Paris Saint-Germain, is a French professional football club based in Paris. They compete in Ligue 1, the top division of French football. PSG are one of France\'s most successful clubs, having won more than 40 official honours, including nine league titles and one major European trophy. Their home ground is the Parc des Princes. Source: Wikipedia.'),
(4, 'FC Barcelona', '/assets/logos/fc-barcelona-logo.png', 1, 5, 5, 'Futbol Club Barcelona, commonly referred to as Barcelona and colloquially known as Barça, is a Spanish professional football club based in Barcelona, that competes in La Liga, the top flight of Spanish football. Source: Wikipedia.'),
(5, 'Manchester United F.C.', '/assets/logos/manchester-united-logo.png', 1, 6, 3, 'Manchester United Football Club is a professional football club based in Old Trafford, Greater Manchester, England, that competes in the Premier League, the top flight of English football. Nicknamed \"the Red Devils\", the club was founded as Newton Heath LYR Football Club in 1878, changed its name to Manchester United in 1902 and moved to its current stadium, Old Trafford, in 1910.'),
(6, 'EC KAC', '/assets/logos/kac-logo.png', 3, 1, 4, 'Klagenfurt Athletic Sports Club or EC KAC (German: Klagenfurter Athletiksport Club) is a professional ice hockey team in the Austrian Erste Bank Hockey League. The team plays their home games in Klagenfurt, Carinthia, Austria at Stadthalle Klagenfurt. EC KAC has won the most Austrian ice hockey Championships, a total of 31 times including 11 consecutive titles from 1964 to 1974, and four consecutive from 1985 to 1988. Most recently they won it in 2019. Source: Wikipedia.'),
(7, 'Steinbach Black Wings 1992 - EHC Linz', '/assets/logos/black-wings-logo.png', 3, 1, 7, 'The Steinbach Black Wings 1992 are a member of the Austrian Hockey League. They play their home games in Linz, Austria at the Linz AG Eisarena.'),
(8, 'SK Sturm Graz', '/assets/logos/sturm-graz.png', 1, 2, 2, 'Sportklub Sturm Graz is an Austrian association football club, based in Graz, Styria, playing in the Austrian Football Bundesliga. The club was founded in 1909. Its colours are black and white. In its history, Sturm Graz has won the Austrian football championship three times, in 1998, 1999 and 2011, and participated several times in the UEFA Champions League and UEFA Europa League. Their biggest rivals are Graz neighbours Grazer AK. Source: Wikipedia.'),
(9, 'FC Red Bull Salzburg', '/assets/logos/red-bull-salzburg.png', 1, 2, 1, 'FC Red Bull Salzburg is an Austrian professional football club based in Wals-Siezenheim, that competes in the Austrian Bundesliga, the top flight of Austrian Football. Their home ground is the Red Bull Arena. Due to sponsorship restrictions, the club is known as FC Salzburg and wears a modified crest when playing in UEFA competitions. The club was known as SV Austria Salzburg, and had several sponsored names, before being bought by Red Bull GmbH in 2005 who renamed the club and changed its colours from its traditional violet and white to red and white. The change resulted in some of the team\'s fans forming a new club, SV Austria Salzburg. Source: Wikipedia.'),
(10, 'Vienna Capitals', '/assets/logos/vienna-capitals.png', 3, 1, 3, 'Vienna Capitals are an Austrian professional ice hockey club who participate in the Erste Bank Hockey League. Founded in 2001, the Capitals play their home games in Vienna, Austria, at Albert Schultz Eishalle. In the 2004–05 season, the Capitals claimed their first Austrian Championship in defeating EC KAC.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'user@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UFBBRERsUlRaVENteWJETg$rgXvVVmtQ9oPZigGNUfAdqLUiOtepn0sYkiqntfSOQE');

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
  ADD KEY `event-category` (`_categoryId`),
  ADD KEY `teamateamid` (`_teamIdA`),
  ADD KEY `teambteamid` (`_teamIdB`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

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
  MODIFY `eventId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `teamId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `eventcategory` FOREIGN KEY (`_categoryId`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `eventcontest` FOREIGN KEY (`_contestId`) REFERENCES `contest` (`contestId`),
  ADD CONSTRAINT `eventlocation` FOREIGN KEY (`_locationId`) REFERENCES `location` (`locationId`),
  ADD CONSTRAINT `teamateamid` FOREIGN KEY (`_teamIdA`) REFERENCES `team` (`teamId`),
  ADD CONSTRAINT `teambteamid` FOREIGN KEY (`_teamIdB`) REFERENCES `team` (`teamId`);

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `leaguecountry` FOREIGN KEY (`_countryId`) REFERENCES `country` (`countryId`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `locationcountry` FOREIGN KEY (`_countryId`) REFERENCES `country` (`countryId`);

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
  ADD CONSTRAINT `teamcategory` FOREIGN KEY (`_categoryId`) REFERENCES `category` (`categoryId`),
  ADD CONSTRAINT `teamleague` FOREIGN KEY (`_leagueId`) REFERENCES `league` (`leagueId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
