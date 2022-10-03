-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 04:35 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twin_cities`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `icon`) VALUES
(1, 'restaurant', 'img/restaurant.png'),
(2, 'aquarium', 'img/aquarium.png'),
(3, 'beach', 'img/beach.png'),
(4, 'park', 'img/park.png'),
(5, 'museum', 'img/museum.png'),
(6, 'place of worship', 'img/church.png');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `woeid` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `country` varchar(32) NOT NULL,
  `region` varchar(32) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `population` int(32) NOT NULL,
  `mayor` varchar(32) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `language` varchar(25) NOT NULL,
  `weblink` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`woeid`, `name`, `country`, `region`, `description`, `population`, `mayor`, `latitude`, `longitude`, `language`, `weblink`) VALUES
(32185, 'Plymouth', 'England', 'South West England', 'Plymouth is a port city in England on the south coast of Devon, approximately 37 miles (60 km) south-west of Exeter and 190 miles (310 km) west-south-west of London. Enclosing the city are the mouths of the river Plym and river Tamar, which are naturally incorporated into Plymouth Sound to form a boundary with Cornwall.\r\n\r\nPlymouth\'s early history extends to the Bronze Age when a first settlement emerged at Mount Batten. This settlement continued as a trading post for the Roman Empire, until it was surpassed by the more prosperous village of Sutton founded in the ninth century, now called Plymouth. In 1620, the Pilgrim Fathers departed Plymouth for the New World and established Plymouth Colony, the second English settlement in what is now the United States of America. During the English Civil War, the town was held by the Parliamentarians and was besieged between 1642 and 1646.\r\n\r\nThroughout the Industrial Revolution, Plymouth grew as a commercial shipping port, handling imports and passengers from the Americas, and exporting local minerals (tin, copper, lime, china clay and arsenic). The neighbouring town of Devonport became strategically important to the Royal Navy for its shipyards and dockyards. In 1914, three neighbouring independent towns, viz. the county borough of Plymouth, the County Borough of Devonport, and the urban district of East Stonehouse were merged, becoming the County Borough of Plymouth. In 1928, it achieved city status. During World War II, due to the city\'s naval importance, the German military targeted and partially destroyed the city by bombing, an act known as the Plymouth Blitz. After the war, the city centre was completely rebuilt. Subsequent expansion led to the incorporation of Plympton, Plymstock, and other outlying suburbs, in 1967.\r\n\r\nThe city is home to 262,100 (mid-2019 est.) people, making it the 30th-most populous built-up area in the United Kingdom and the second-largest city in the South West, after Bristol. It is governed locally by Plymouth City Council and is represented nationally by three MPs. Plymouth\'s economy remains strongly influenced by shipbuilding and seafaring but has tended toward a service economy since the 1990s. It has ferry links to Brittany (Roscoff and St Malo) and to Spain (Santander). It has the largest operational naval base in Western Europe, HMNB Devonport, and is home to the University of Plymouth.', 234982, 'Sam Davey', 50.3763, -4.14384, 'English', 'https://www.visitplymouth.co.uk'),
(493421, 'Gdynia', 'Poland', 'Pomeranian', 'Gdynia is a city in northern Poland. On Gdańsk Bay on the southern coast of the Baltic Sea, it is a major seaport and the second-largest city in Pomeranian Voivodeship after Gdańsk. Gdynia has a population of 246,348, which makes it the twelfth-largest city in Poland. It is part of a conurbation with the spa town of Sopot, the city of Gdańsk, and suburban communities, which together form a metropolitan area called the Tricity (Trójmiasto), with a population of over 1,000,000 people.\r\n\r\nHistorically and culturally part of Kashubia in Eastern Pomerania, Gdynia for centuries remained a small farming and fishing village. At the beginning of the 20th-century, Gdynia attracted visitors as a seaside resort town, and began to build tourism. The local population increased in response to the change in the economy.\r\n\r\nAfter Poland regained its independence in 1918, the government decided to construct a Polish seaport in Gdynia, between the Free City of Danzig (a semi-autonomous city-state) and German Pomerania, making Gdynia a primary economic hub. In 1926 Gdynia was granted city rights, after which it enjoyed a rapid demographic and architectural development.\r\n\r\nThis was interrupted by the outbreak of World War II, during which the newly built port and shipyard were completely destroyed. The population of the city suffered heavy losses, as most of the inhabitants were evicted and expelled by the German occupiers. The locals were either displaced to other regions of occupied Poland or sent to German Nazi concentration camps throughout Europe.\r\n\r\nAfter the war, Gdynia was settled with the former inhabitants of Warsaw, which also suffered major destruction, and lost cities, such as Lviv and Vilnius in the Eastern Borderlands. The city was gradually regenerating, with its shipyard being rebuilt and expanded. In December 1970 the shipyard workers\' protest against an increase in government-established prices was violently repressed by government forces. This greatly contributed to the rise of the Solidarity movement in nearby Gdańsk.\r\n\r\nToday the port of Gdynia is a regular stopover on the cruising itinerary of large, luxury passenger ships. A new ferry terminal with a civil airport are under development. The city has won numerous awards for its safety, infrastructure, quality of life, and a rich variety of tourist attractions. In 2013 Gdynia was ranked by readers of The News as Poland\'s best city to live in, and topped the national rankings in the category of \"general quality of life\".', 246348, 'Wojciech Szczurek', 54.5189, 18.5305, 'Polish', 'https://www.gdynia.pl');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(32) NOT NULL,
  `content` varchar(2048) NOT NULL,
  `author` varchar(64) NOT NULL,
  `date_published` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `woeid` int(32) DEFAULT NULL,
  `place_id` int(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `author`, `date_published`, `woeid`, `place_id`) VALUES
(1, 'eeeeeee', 'eeee', '2021-03-19 11:10:14', 32185, NULL),
(2, 'tyjt', 'Jed Powell', '2021-03-19 11:22:18', 32185, 2),
(3, 'aaaaaaaaaa', 'Jed Powell', '2021-03-19 11:23:50', 493421, NULL),
(4, '', '', '2021-03-21 19:52:40', 493421, NULL),
(5, 'fgnfn', 'Reworked use case di', '2021-03-22 14:41:04', 32185, NULL),
(6, 'ssss', 'test', '2021-03-22 14:42:41', 32185, NULL),
(7, 'dddddd', 'Jed Powell', '2021-03-22 14:45:00', 32185, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(32) NOT NULL,
  `date_published` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `source` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `weblink` varchar(64) NOT NULL,
  `woeid` int(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(32) NOT NULL,
  `source` varchar(64) NOT NULL,
  `date_published` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `woeid` int(32) DEFAULT NULL,
  `place_id` int(32) DEFAULT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `source`, `date_published`, `woeid`, `place_id`, `description`) VALUES
(1, '../img/plymouth/nma1.jpg', '2021-03-19 09:48:48', 32185, 1, 'main building'),
(2, '../img/plymouth/nma2.jpg', '2021-03-19 09:49:35', 32185, 1, 'viewing screen side of aquarium'),
(3, '../img/plymouth/nma3.jpg', '2021-03-19 09:50:05', 32185, 1, 'shark seen from side viewing panel'),
(4, '../img/plymouth/pb1.jpg', '2021-03-19 09:50:24', 32185, 2, 'front of building'),
(5, '../img/plymouth/pb2.jpg', '2021-03-19 09:50:49', 32185, 2, 'inside gallery'),
(6, '../img/plymouth/pb3.jpg', '2021-03-19 09:51:04', 32185, 2, 'building from the side'),
(7, '../img/plymouth/ph1.jpg', '2021-03-19 09:52:06', 32185, 3, 'Smeaton\'s Tower with Plymouth Sound behind'),
(8, '../img/plymouth/ph2.jpg', '2021-03-19 09:53:42', 32185, 3, 'a view across Plymouth Hoe'),
(9, '../img/plymouth/ph3.jpg', '2021-03-19 09:54:22', 32185, 3, 'Plymouth Hoe as seen from the water'),
(10, '../img/plymouth/mhm1.jpg', '2021-03-19 09:55:01', 32185, 4, 'front view of building'),
(11, '../img/plymouth/mhm2.jpg', '2021-03-19 09:55:36', 32185, 4, 'inside, showing a ship\'s wheel and old barrels'),
(12, '../img/plymouth/mhm3.jpg', '2021-03-19 09:56:03', 32185, 4, 'a model ship on display'),
(13, '../img/plymouth/bk1.jpg', '2021-03-19 09:57:00', 32185, 5, 'the main sign'),
(14, '../img/plymouth/bk2.jpg', '2021-03-19 09:57:22', 32185, 5, 'the kitchen counter'),
(15, '../img/plymouth/bk3.jpg', '2021-03-19 09:57:35', 32185, 5, 'a prepared dish'),
(16, '../img/plymouth/mcosa1.jpg', '2021-03-19 09:58:24', 32185, 6, 'view of the church from the road'),
(17, '../img/plymouth/mcosa2.jpg', '2021-03-19 09:58:44', 32185, 6, 'another view of the church'),
(18, '../img/plymouth/mcosa3.jpg', '2021-03-19 09:59:04', 32185, 6, 'the church interior'),
(19, '../img/gdynia/dp1.jpg', '2021-03-19 09:59:52', 493421, 7, 'the ship at dusk'),
(20, '../img/gdynia/dp2.jpg', '2021-03-19 10:00:02', 493421, 7, 'the ship'),
(21, '../img/gdynia/dp3.jpg', '2021-03-19 10:00:13', 493421, 7, 'another view of the ship'),
(22, '../img/gdynia/pmlk1.jpg', '2021-03-19 10:00:35', 493421, 8, 'a pavilion'),
(23, '../img/gdynia/pmlk2.jpg', '2021-03-19 10:00:53', 493421, 8, 'a path through the trees'),
(24, '../img/gdynia/pmlk3.jpg', '2021-03-19 10:04:58', 493421, 8, 'a cable car'),
(25, '../img/gdynia/o86-1.jpg', '2021-03-19 10:01:48', 493421, 9, 'front of building at dusk with lights on'),
(26, '../img/gdynia/o86-2.jpg', '2021-03-19 10:02:14', 493421, 9, 'a dressed dining table in white'),
(27, '../img/gdynia/o86-3.jpg', '2021-03-19 10:02:35', 493421, 9, 'the dining room'),
(28, '../img/gdynia/kma1.jpg', '2021-03-19 10:03:03', 493421, 10, 'a view of the building'),
(29, '../img/gdynia/kma2.jpg', '2021-03-19 10:03:19', 493421, 10, 'the interior looking towards the altar'),
(30, '../img/gdynia/kma3.jpg', '2021-03-19 10:03:57', 493421, 10, 'the church walls'),
(31, '../img/gdynia/pm1.jpg', '2021-03-19 10:05:16', 493421, 11, 'the beach'),
(32, '../img/gdynia/pm2.jpg', '2021-03-19 10:05:32', 493421, 11, 'the beach looking along the shoreline'),
(33, '../img/gdynia/pm3.jpg', '2021-03-19 10:04:34', 493421, 11, 'wide path on the shore in sunlight'),
(34, '../img/gdynia/ag1.jpg', '2021-03-19 10:05:56', 493421, 12, 'building and main entrance'),
(35, '../img/gdynia/ag2.jpg', '2021-03-19 10:06:08', 493421, 12, 'a clown fish'),
(36, '../img/gdynia/ag3.jpg', '2021-03-19 10:06:26', 493421, 12, 'exhibition');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `place_id` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `capacity` int(32) DEFAULT NULL,
  `address` varchar(64) NOT NULL,
  `data_opened` varchar(16) DEFAULT NULL,
  `opening_times` varchar(64) NOT NULL,
  `pets_allowed` tinyint(1) NOT NULL,
  `weblink` varchar(64) NOT NULL,
  `woeid` int(32) DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`place_id`, `name`, `description`, `capacity`, `address`, `data_opened`, `opening_times`, `pets_allowed`, `weblink`, `woeid`, `latitude`, `longitude`) VALUES
(1, 'National Marine Aquarium', 'Visit the UK\'s largest Aquarium, be amazed by their fascinating underwater world, and how we all play a part in conserving it. All day tickets come with a free 12 month pass so pay once and return as much as you like throughout the year!\r\n\r\nThe National Marine Aquarium is run by the Ocean Conservation Trust, a charity dedicated to connecting people with the Ocean. A visit to the Aquarium will take you on a journey across the world\'s Ocean, from the shores of Plymouth Sound to the coral reefs of the tropics of Australia. With over 4,000 animals to meet including sharks, sting rays, octopuses, jellyfish and a cheeky turtle, there will be something different on every visit.\r\n\r\nTheir Ocean Discovery Rangers host the Aquarium to connect all visitors to the animals who call it home. With four main zones, their exhibits include the UK’s deepest and largest tank, the UK’s largest native exhibit, the UK’s largest single viewing panel and many more interactive displays.\r\n\r\nNot only are they a fantastic day out, but the National Marine Aquarium is a truly unique venue in the stunning location of Sutton Harbour. Its relaxed environment and breath-taking views make it the perfect venue for a variety of functions and events, from birthday celebrations to wedding receptions. With several spaces available to hire and a variety of catering options available. Enjoy fine dining for 120 guests on round tables in our auditorium looking at the amazing Eddystone Reef exhibit or a buffet for 75 in Horizons, with views to die for across Plymouth Sound.\r\n\r\nTheir events calendar has something for everyone, from yoga sessions, late night lecture series and even a chance to enjoy an evening in one of the most unique settings for a dine at the Aquarium experience.  And if you live a little way a way and want to explore the Aquarium virtually before visiting Plymouth, why not try one of their virtual tour experiences? The perfect treat or present for any budding marine biologists.\r\n\r\nMake sure you visit the National Marine Aquarium website for an updated list of all the events and activities upcoming. 2021 marks the beginning of the globally significant UN Ocean Decade.  Places for the people to engage with and understand our Ocean cultural heritage are required now more than ever.  The UK is an island nation, no-one is ever more than 70 miles from the coast.  The Ocean and its underwater and natural heritage is intricately intertwined with our cultural heritage.', NULL, 'Rope Walk Coxside, Plymouth PL4 0LF', '1998', 'Daily 10am to 5pm', 0, 'https://www.national-aquarium.co.uk', 32185, 50.3667, -4.131),
(2, 'The Box Plymouth', 'Brand new museum redeveloped from Plymouth City Museum and Art Gallery which houses a collection of about 2 million items. The Box, Plymouth’s major new museum, gallery and archive, opened in late 2020 and is one of the UK’s most exciting cultural attractions.\r\n\r\nNine permanent galleries showcase the city’s incredible art, natural history, human history, film, photographic and archive collections. Three major exhibitions highlight the Mayflower 400 anniversary and contemporary art by international artists.', NULL, 'Tavistock, Plymouth PL4 8AX', '2020', 'Tuesday to Sunday between 10am and 5pm', 0, 'https://www.theboxplymouth.com', 32185, 50.3744, -4.1375),
(3, 'Plymouth Hoe', 'A large green expanse that covers much of Plymouths southern waterfront, Plymouth Hoe is home to many attractions as well as being an attraction in of itself. Rather like a park, many locals and holiday makers enjoy a picnic on the grass while gazing out onto the wide view of Plymouth Sound, the Breakwater and Eddyston Lighthouse.\r\nSmeaton’s Tower, a white and red striped lighthouse, is a dominant feature of the Hoe and has become a recognised landmark for Plymouth and its waterfront. A statue of Sir Francis Drake and The Royal Citadel also occupy the Hoe, and during the summer months, the public can enjoy a dip in the Tinside Lido, a saltwater swimming pool located on the shore amongst the rocks. Annual events are also hosted on Plymouth Hoe such as the British Fireworks Championships and Plymouth Armed Forces Day, as well a fun-fairs and music.', NULL, '4 Osborne Pl, Plymouth PL1 2PU, England', '1588', 'Open all day', 1, 'https://www.visitplymouth.co.uk/explore/areas-to-visit/the-hoe', 32185, 50.3656, -4.1423),
(4, 'Mayflower House Museum', 'The Pilgrims set sail from Plymouth on the Mayflower on 6 September 1620, eventually landing and settling in present-day Plymouth, Massachusetts.\r\n\r\nThe Mayflower Museum explores the story of the Mayflower and the Pilgrims with information and hands-on displays, including dress-up and role play, a model of the Mayflower built by Devonport Dockyard apprentices in 1969 and a list of all the Pilgrims and their hometowns.', NULL, '3-5 The Barbican, Plymouth PL1 2LR, England', '1620', 'Open all year April to October: Monday to Saturday 9.00 - 17:00', 0, 'https://www.mayflower400uk.org', 32185, 50.3596, -4.1337),
(5, 'Barbican Kitchen', 'Housed in the world famous Plymouth Gin Distillery, the Barbican Kitchen was established in 2006 by the Tanner Brothers, Chris and James. Our aim is to deliver fresh local food at a realistic price. The Barbican Kitchen takes full advantage of the superb larder available to us here in the Westcountry. Menu showcasing stunning local meats, vegetables and top quality fish from fantastic network of suppliers', 150, 'Black Friars Distillery, 60 Southside St, Plymouth PL1 2LQ', '2016', 'Tuesday to Saturday between 12pm and 21.30pm', 0, 'http://barbicankitchen.com', 32185, 50.3678, -4.1378),
(6, 'Minster Church of St. Andrew', 'The Minster Church of St Andrew, also known as St Andrew\'s Church, Plymouth is an Anglican church in Plymouth. It is the original parish church of Sutton, one of the three towns which were later combined to form the city of Plymouth. The church is the largest parish church in the historic county of Devon and was built in the mid to late 15th century. It was designated as a Minster Church in 2009 and it continues to operate as the focus for religious civic events for the city and as a bustling evangelical church.\r\n\r\nIt is likely to be on the site of the original Saxon church and was once attached to the abbey of Plympton.', NULL, 'Royal Parade, Plymouth PL1 2AD', '1460', 'Monday to Friday between 9am and 1pm', 0, 'https://www.standrewschurch.org.uk', 32185, 50.37, -4.13987),
(7, 'Dar Pomorza', 'Polish full-rigged sailing ship built in 1909 which is preserved in Gdynia as a museum ship. Since 27 May 1983 she has been a museum ship in Gdynia (next to the Błyskawica). She is part of a collection of National Maritime Museum in Gdańsk. In October 2009 the Dar Pomorza celebrated her 100th \"birthday\". The celebration included her second christening by Mrs Barbara Szczurek, the wife of the Mayor of Gdynia.\r\n\r\nHer speed under sail averaged 5 knots, with a 17 knots maximum. Her auxiliary engine was one of the type used in German U-Boats, and her horn, installed after the war, was from the German battle-cruiser Gneisenau, scuttled on 27/28 March 1945 at one of the entrances to the harbour of Gdynia.', 190, 'al. Jana Paw³a II, 81-345 Gdynia, Polska', '1909', 'Tuesday to Sunday between 10am and 4pm', 0, 'https://www.nmm.pl/dar-pomorza', 493421, 54.5195, 18.5528),
(8, 'Park im. Marii i Lecha Kaczyñski', 'Kamienna Góra is a park named after Maria and Lech Kaczyñski. At the very top there is an observation deck - you can reach it by stairs which lead from every side. Second option to get at the top is a cable car, unfortunately temporarily closed. Lots of greenery around and flowers replenished constantly. There is also a small amphitheater that can be used by artists.', NULL, 'Adama Mickiewicza, 81-379, Gdynia, Polska', '2010', 'Open all day', 1, 'https://www.gdynia.pl', 493421, 54.4461, 18.5715),
(9, 'Oberża 86', 'Before the war, it housed a household shop, then a shoemaker\'s workshop. After 1945, a cottage was taken by \r\nfour families. Then the city arranged\r\nan exhibition devoted to the oldest history of Gdynia as a fishing village. As a result of budget reduction in 2013, the Museum of the City of Gdynia gave up further lease of the house.\r\nAs a result, it was transformed into restaurant. Thanks to this, Ober¿a 86 can host you today in their restaurant to serve traditional Polish cuisine based on regional flavours and natural products.', 0, 'Starowiejska 30, 81-304 Gdynia, Polska', '2013', 'Every day from 12pm to 8pm', 0, 'https://www.sztuczkabistro.com', 493421, 54.5215, 18.538),
(10, 'Koœció³ pw. œw. Micha³a Archanio', 'Roman Catholic church located in Gdynia in the Oksywie district at ul. Stanis³awa D¹bka', 200, 'Pu³kownika Stanis³awa D¹bka 1, 81-107 Gdynia, Polska', '1124', 'Monday 7pm to 7.30pm, Tuesday 8.30am to 9am, Wednesday 4pm to 5p', 0, 'http://www.parafia.oksy.net.pl', 493421, 54.5476, 18.5534),
(11, 'Plaża Miejska', 'The most popular beach in Gdynia, located in the vicinity of the Musical Theater and Koœciuszko Square. There is a bathing area 200m wide, which is guarded until the end of August. The beach is perfectly connected, there are also many attractions for children (including a playground, inflatable slide, trampoline) and adults (famous for its BBQ spots as well as pet-friendly area). It can get crowded in the summer, although city takes care of daily cleaning services. During the winter, people also benefit from the beach through winter swimming which is plunging in the autumn/winter season in icy water, wearing only a swimsuit and a hat or gloves – although it is recommended to visit a doctor before.', NULL, 'ul. Bulwar Nadmorski, 81-451 Gdynia, Polska', '1998', 'Open all day', 1, 'http://www.gdyniarodzinna.pl/miejsce/554,plaza-gdynia-srodmiesci', 493421, 54.516, 18.551),
(12, 'Akwarium Gdyñskie', 'Biggest Polish public aquarium and sea museum operated by the National Marine Fisheries Research Institute in Gdynia, Poland. Previously called the Oceanographic Museum and Sea Aquarium of the Sea Fisheries Institute in Gdynia (1971-2003), the aquarium has a zoological garden status and is situated along Aleja John Paul II on the South Pier.\r\nExhibitions presented within the museum are on oceanography and hydrobiology, while the aquarium contains both sea and freshwater flora and fauna. You can find here a total of 215 species from 61 families, including 142 fish species, 3 amphibian species, 12 reptiles species and 58 invertebrates species. One of the biggest attractions of this place is the coral reef, which delights with its riot of colours and the richness of its inhabitants’ shapes.', NULL, 'al. Jana Paw³a II 1, 81-345 Gdynia, Polska', '1971', 'Tuesday to Sunday between 10am and 5pm', 0, 'https://akwarium.gdynia.pl', 493421, 54.5186, 18.5582);

-- --------------------------------------------------------

--
-- Table structure for table `place_category`
--

CREATE TABLE `place_category` (
  `place_id` int(32) NOT NULL,
  `category_id` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `place_category`
--

INSERT INTO `place_category` (`place_id`, `category_id`) VALUES
(1, 2),
(2, 5),
(3, 4),
(4, 5),
(5, 1),
(6, 6),
(7, 5),
(8, 4),
(9, 1),
(10, 6),
(11, 3),
(12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tweet`
--

CREATE TABLE `tweet` (
  `twin_cities_id` double NOT NULL,
  `author` varchar(50) NOT NULL,
  `date_published` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `content` varchar(5000) NOT NULL,
  `woeid` int(32) DEFAULT NULL,
  `place_id` int(10) DEFAULT NULL,
  `tweet_id` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweet`
--

INSERT INTO `tweet` (`twin_cities_id`, `author`, `date_published`, `content`, `woeid`, `place_id`, `tweet_id`) VALUES
(949, 'Plymouth Citybus', 'Thu Mar 11 15:18:46 +0000 2021', 'The Plymouth Startup Weekend goes live from 23rd-25th April 2021.\n\nLearn how to bring your business ideas to life in just 54 hours!\n\nClick the link to find out more: https://t.co/ULG6mCIQkA\n\n#Plymouthstartupweekend #Business #Plymouth https://t.co/ReszvKWU0f', 32185, NULL, 1.3700314524783944e18),
(950, 'Future Inns', 'Thu Mar 11 15:15:10 +0000 2021', 'Book your 2021 staycation in #Plymouth\n🛏️ Bedrooms sleep up to 4\n👨‍👨‍👧‍👦 Under 12s stay for free\n🚗 Free parking\n📶 Free WiFi\n💸 Rooms from £67\n\nYou can book with confidence. Book direct for the best rates guaranteed on our website:  https://t.co/36ojtPQEkR\n#VisitPlymouth #FamilyHotel https://t.co/BCd6egEMYj', 32185, NULL, 1.3700305461690614e18),
(951, 'Building Plymouth', 'Thu Mar 11 15:00:11 +0000 2021', 'RT @PlymCityCentre: New life for #Plymouth Guildhall on the cards. The landmark building is in line for a serious makeover as part of the c…', 32185, NULL, 1.3700267731240264e18),
(952, 'Find Shows Near Me', 'Thu Mar 11 15:00:01 +0000 2021', 'Canadian comedian Katherine Ryan will head out on tour from Sep 2021. @Kathbum  See her in #Glasgow #Leeds #Halifax #Coventry #Plymouth #Liverpool #Brighton #Bristol #Reading &amp; more\n\nhttps://t.co/wm9QhgW0M3', 32185, NULL, 1.3700267308915794e18),
(953, 'Tess Blight', 'Thu Mar 11 14:55:48 +0000 2021', 'RT @NaturePlymouth: There are so many incredible green initiatives happening across the city, making sure that we\'re greening as we grow. W…', 32185, NULL, 1.3700256716536627e18),
(954, 'Pierre Wassenaar', 'Thu Mar 11 14:55:43 +0000 2021', 'RT @WWAsurveyors: The new Lighthouse Laboratory in #Plymouth is a true testament to the power of utilising a locally based specialist team!…', 32185, NULL, 1.3700256502040207e18),
(955, 'DEVON', 'Thu Mar 11 14:53:03 +0000 2021', '#Plymouth freeport could \'suck business\' from local area https://t.co/RYglm3q7sI', 32185, NULL, 1.3700249773663232e18),
(956, 'Plymouth Boat Trips', 'Thu Mar 11 14:51:07 +0000 2021', '😊 Our Cremyll Ferry is still operating as usual today! Thanks Martin Burgess-Moon for the fabulous photo taken at lunchtime today 🌊 ⛴ \n#loveplymboattrips #cremyllferry #plymouth #mountedgcumbe #allaboard https://t.co/KYFYc4u3b6', 32185, NULL, 1.3700244939518198e18),
(957, '👤 Look II Plymouth👤 Final day to VOTE IN MY POLL', 'Thu Mar 11 14:50:54 +0000 2021', 'Just 1 day left to vote in this poll.\nPreliminary results do indeed suggest cross-party support, which is rather comforting.... 😊\n\n#Poll #Polls #LookII #Plymouth #LookIIPlymouth #RustyReg #AntonyGormley #CrossPartySupport #Statue #Gormley', 32185, NULL, 1.3700244393000346e18),
(958, 'Stuart Elford 💙', 'Thu Mar 11 14:49:57 +0000 2021', 'RT @freshairstudios: Erm, she\'s not that kind of doctor @PaulCPhilpott! Wonderful to have @AnnJamesNHS &amp; @StuartElford at @freshairstudios…', 32185, NULL, 1.3700241987818168e18),
(961, 'Gniewko', 'Thu Mar 11 12:59:13 +0000 2021', '#Warszawa #Kraków #Łódź #Wrocław #Poznań #Gdańsk #Szczecin #Bydgoszcz #Lublin #Białystok #Katowice #Gdynia #Częstochowa #Radom #Sosnowiec #Toruń #Kielce #Rzeszów #Gliwice #Zabrze #Olsztyn #BielskoBiała #Bytom #ZielonaGóra #Rybnik #RudaŚląska #Tychy #Opole #GorzówWielkopolski https://t.co/o0RtQ8hMPZ', 493421, NULL, 1.3699963306098074e18),
(962, 'Marek Jażdżewski', 'Thu Mar 11 09:23:59 +0000 2021', 'RT @idkielce: Dwie wystawy przygotowane przez Instytut Dizajnu w wydarzeniach polecanych przez #DesignAlive 🙌 \'\'Dziewczyny na warsztat\'\' w…', 493421, NULL, 1.3699421674483261e18),
(963, 'Pomorski Park N-T', 'Thu Mar 11 09:22:45 +0000 2021', 'RT @idkielce: Dwie wystawy przygotowane przez Instytut Dizajnu w wydarzeniach polecanych przez #DesignAlive 🙌 \'\'Dziewczyny na warsztat\'\' w…', 493421, NULL, 1.369941855895511e18),
(964, 'Gniewko', 'Thu Mar 11 08:57:42 +0000 2021', '#Warszawa #Kraków #Łódź #Wrocław #Poznań #Gdańsk #Szczecin #Bydgoszcz #Lublin #Białystok #Katowice #Gdynia #Częstochowa #Radom #Sosnowiec #Toruń #Kielce #Rzeszów #Gliwice #Zabrze #Olsztyn #BielskoBiała #Bytom #ZielonaGóra #Rybnik #RudaŚląska #Tychy #Opole #GorzówWielkopolski https://t.co/1uBlh1ThFh', 493421, NULL, 1.3699355540250337e18),
(965, 'Andrzej Olkiewicz', 'Thu Mar 11 06:55:44 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.369904856710996e18),
(966, 'Harry', 'Thu Mar 11 06:36:34 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.369900035782099e18),
(967, 'WIKI WEST', 'Wed Mar 10 22:40:30 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.3697802271451464e18),
(968, 'Bogusław Liberadzki', 'Wed Mar 10 21:06:13 +0000 2021', 'RT @GDDKiA_Gdansk: Garść zimowych zdjęć z budowy 3 odc. #S6 Trasy Kaszubskiej od #Gdynia po Bożepole Wlk. W zimie prace budowlane ze względ…', 493421, NULL, 1.3697565001184174e18),
(969, 'Regio Poland (Komisja Europejska #funduszeUE🇪🇺)', 'Wed Mar 10 20:31:09 +0000 2021', 'RT @GDDKiA_Gdansk: Garść zimowych zdjęć z budowy 3 odc. #S6 Trasy Kaszubskiej od #Gdynia po Bożepole Wlk. W zimie prace budowlane ze względ…', 493421, NULL, 1.3697476758438543e18),
(972, 'Plymouth Voice', 'Thu Mar 11 15:25:41 +0000 2021', '#Plymouth promotes St. Patrick\'s Day with a new slant on shopping and dining. https://t.co/JMy454PBbd', 32185, NULL, 1.370033193013936e18),
(981, 'Jezuici', 'Thu Mar 11 15:29:15 +0000 2021', 'Uczniowie jezuickich szkół rozkręcają nowe projekty #szkoły #Gdynia #Kraków #NowySacz \nhttps://t.co/XU04vmqI4w https://t.co/cRFYmmBMzA', 493421, NULL, 1.370034087851856e18),
(1010, 'Chaz Singh', 'Wed Mar 10 20:02:26 +0000 2021', 'Very dangerous #plymouth #hoe #waterfront @plymouthcc @H_S_E #RT https://t.co/CV7B9t2j6f', NULL, 3, 1.3697404488399708e18),
(1011, 'Neil Lewis', 'Wed Mar 10 19:15:37 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3697286683150991e18),
(1012, 'HE Maritime', 'Wed Mar 10 09:12:01 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3695767692133048e18),
(1013, 'Firefighters Memorial', 'Wed Mar 10 07:34:10 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3695521441273774e18),
(1014, 'Bob Garnham', 'Wed Mar 10 01:02:10 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.369453491249365e18),
(1015, 'David Moore', 'Wed Mar 10 00:53:37 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3694513428388536e18),
(1016, 'Ibrahim Jaradah', 'Tue Mar 09 23:35:02 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3694315666032026e18),
(1017, '🅰🅽🅳🆈 1QDG & LI', 'Tue Mar 09 22:08:02 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.369409669324759e18),
(1018, 'glenn', 'Tue Mar 09 22:07:04 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.3694094273680138e18),
(1019, 'Scott68', 'Tue Mar 09 22:01:21 +0000 2021', 'RT @CWGC: RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinue…', NULL, 3, 1.369407987085947e18),
(1020, 'CommonwealthWarGraves', 'Tue Mar 09 22:01:04 +0000 2021', 'RT @PlymouthRebecca: The @CWGC Naval Memorial on Plymouth Hoe was looking great today in the sunshine. #Plymouth #ourworkcontinues #ourwargravesyourhistory https://t.co/g4C01cQBcZ', NULL, 3, 1.3694079173053276e18),
(1021, 'Sarah Elmes', 'Tue Mar 09 20:48:44 +0000 2021', 'RT @Paolomc84: 3 mile walk North hill (Drakes reservoir) to Plymouth Hoe &amp; back. Wind picked up, lockdown in city centre shows but some pre…', NULL, 3, 1.3693897142020383e18),
(1022, 'Dr Abigail McQuatters-Gollop アビゲイル', 'Tue Mar 09 18:25:21 +0000 2021', 'RT @Paolomc84: 3 mile walk North hill (Drakes reservoir) to Plymouth Hoe &amp; back. Wind picked up, lockdown in city centre shows but some pre…', NULL, 3, 1.3693536289983283e18),
(1023, 'Paul McDonnell', 'Tue Mar 09 18:04:26 +0000 2021', '3 mile walk North hill (Drakes reservoir) to Plymouth Hoe &amp; back. Wind picked up, lockdown in city centre shows but some pretty views 😍 #plymouth #lockdown https://t.co/bQoW2d4DAw', NULL, 3, 1.3693483646351483e18),
(1024, 'Hazel', 'Tue Mar 09 08:39:46 +0000 2021', 'RT @JackieGMs66: Sunset on The Belvedere and The Hoe  @Plymouth_Live @britainsocean @oneplymouth @Plymouth2013 @DestinationPlym @visitplymo…', NULL, 3, 1.3692062634191421e18),
(1025, 'Gillian Adams', 'Tue Mar 09 07:46:45 +0000 2021', 'RT @JackieGMs66: Sunset on The Belvedere and The Hoe  @Plymouth_Live @britainsocean @oneplymouth @Plymouth2013 @DestinationPlym @visitplymo…', NULL, 3, 1.369192920801239e18),
(1026, 'Mathew Muratore', 'Mon Mar 08 23:12:41 +0000 2021', 'RT @JackieGMs66: Sunset on The Belvedere and The Hoe  @Plymouth_Live @britainsocean @oneplymouth @Plymouth2013 @DestinationPlym @visitplymo…', NULL, 3, 1.3690635518941757e18),
(1027, 'Destination Plymouth', 'Mon Mar 08 21:51:31 +0000 2021', 'RT @JackieGMs66: Sunset on The Belvedere and The Hoe  @Plymouth_Live @britainsocean @oneplymouth @Plymouth2013 @DestinationPlym @visitplymo…', NULL, 3, 1.3690431281125786e18),
(1028, 'Jo Gould', 'Mon Mar 08 21:30:36 +0000 2021', 'RT @JackieGMs66: Sunset on The Belvedere and The Hoe  @Plymouth_Live @britainsocean @oneplymouth @Plymouth2013 @DestinationPlym @visitplymo…', NULL, 3, 1.3690378632334664e18),
(1029, 'nowiny.pl', 'Sun Mar 07 14:27:30 +0000 2021', '#Plaża miejska #racibórz potrzebuje gospodarza\n\n👉 https://t.co/OVMd01RxGg', NULL, 11, 1.3685689984351724e18),
(1039, 'Jezuici', 'Thu Mar 11 15:32:26 +0000 2021', 'Międzynarodowy projekt edukacyjny na temat pandemii. Debatują jezuickie szkoły z \"#Gdynia #Tomsk #Malaga #Palermo https://t.co/4TL82FB9Pq', 493421, NULL, 1.3700348885403566e18),
(1069, 'MiHi Digital', 'Fri Mar 12 12:45:05 +0000 2021', 'In this video, Joe goes through the updates and talks in a little bit of detail about why Instagram Shopping is good for your business, how the new update affects you and some other bits and bobs. https://t.co/G38jy6spnp\n\n#webdesign #smallbiz #kernow #website #plymouth https://t.co/ycBD9jdlaM', 32185, NULL, 1.3703551635427492e18),
(1070, 'Andy Nicholls', 'Fri Mar 12 12:43:16 +0000 2021', 'RT @OnthisdayRN: #OnThisDay 2009, #plymouth sailor Kate Louise Nesbitt became the first @RoyalNavy woman to win the Military Cross for gall…', 32185, NULL, 1.3703547079406633e18),
(1071, 'Hereward The Woke', 'Fri Mar 12 12:42:22 +0000 2021', 'RT @OnthisdayRN: #OnThisDay 2009, #plymouth sailor Kate Louise Nesbitt became the first @RoyalNavy woman to win the Military Cross for gall…', 32185, NULL, 1.370354477702783e18),
(1072, 'Jobs at Fresh Thyme Farmers Market', 'Fri Mar 12 12:37:26 +0000 2021', 'This job might be a great fit for you: Assistant Store Director - https://t.co/egdqDnKKFg #Retail #Plymouth, MN', 32185, NULL, 1.3703532397831823e18),
(1073, 'Millbay Academy', 'Fri Mar 12 12:30:29 +0000 2021', 'A welcome back message from Polly in this weeks secondary headteacher\'s vlog!\n#plymouthparents #Plymouth #millbayacademy\nhttps://t.co/UMPOmHW0oV', 32185, NULL, 1.3703514891018035e18),
(1074, 'Ocean City Radio', 'Fri Mar 12 12:27:49 +0000 2021', 'Join Mikey R on Ocean City Radio at 4pm for \'Feel Good Friday\'. A two hour mix of dance and trance anthems. Listen here: https://t.co/1HujZaLhCz #Plymouth #radio #community 💃🏻🕺📻🎶 https://t.co/7PgSKlWl30', 32185, NULL, 1.3703508192924221e18),
(1075, 'Ocean City Radio', 'Fri Mar 12 12:26:35 +0000 2021', 'Join Barnaby Clotworthy from 1pm until 4pm on Ocean City Radio for 3 hours of \'Harmonious Connections\'. Listen here: https://t.co/1HujZaLhCz #Plymouth #radio #community 📻🎶🎤🎧 https://t.co/wmDdWdLBYt', 32185, NULL, 1.3703505072780943e18),
(1076, 'Plymouth Manufacturers Group', 'Fri Mar 12 12:20:33 +0000 2021', 'RT @JCPinPlymouth: Good Morning #Plymouth.  We have a day full of jobs and advice for you.  Good luck with your job search . Gill https://t…', 32185, NULL, 1.3703489905296916e18),
(1077, 'Paul Lacey', 'Fri Mar 12 12:19:02 +0000 2021', 'RT @OnthisdayRN: #OnThisDay 2009, #plymouth sailor Kate Louise Nesbitt became the first @RoyalNavy woman to win the Military Cross for gall…', 32185, NULL, 1.3703486053206098e18),
(1078, 'The Box, Plymouth', 'Fri Mar 12 12:15:13 +0000 2021', 'Heritage attracts thousands of people to #Plymouth each year. At The Box we’re all about telling #Plymouth’s stories, but we can uncover even more thanks to our city’s incredible cultural network.\n\nSee the new #CulturePlan at https://t.co/eabEtMU78i.\n@PlymouthUK2020 https://t.co/5s4TaxyrX1', 32185, NULL, 1.3703476484992205e18),
(1079, 'Bowvie Weather', 'Fri Mar 12 12:30:14 +0000 2021', 'Current #weather in #Gdynia, Cloudy with a #temperature of 5 degrees celsius. Keep track of the weather in Gdynia -&gt; https://t.co/9waGABBxy0', 493421, NULL, 1.3703514248911299e18),
(1080, 'GDDKiA Łódź', 'Fri Mar 12 12:23:59 +0000 2021', 'RT @GDDKiA_Gdansk: Garść zimowych zdjęć z budowy 3 odc. #S6 Trasy Kaszubskiej od #Gdynia po Bożepole Wlk. W zimie prace budowlane ze względ…', 493421, NULL, 1.3703498546695537e18),
(1081, 'Pomorski Park N-T', 'Fri Mar 12 12:16:32 +0000 2021', '📣 @PPNT_Gdynia | #CentrumDesignu zostało oficjalnym partnerem inicjatywy #NewEuropeanBauhaus, której celem jest głęboka odnowa Europy poprzez zaangażowanie do działania architektów, artystów, inżynierów i projektantów.\n\nwięcej: https://t.co/mvPO3oMwLP\n\n#wgdynia #gdynia #ppnt', 493421, NULL, 1.370347976472793e18),
(1082, 'Owoce Do Biura', 'Fri Mar 12 11:58:21 +0000 2021', 'Ile owoców zamówić? Jakie owoce wybrać? Wystarczy napisać maila 👉 bok@owocedobiura.pl 👌 Doradzimy\n\n#owocedobiura #owocedofirmy #owocedlapracownika #pomorskie #Gdańsk #Sopot #Gdynia https://t.co/oOrhOJge0r', 493421, NULL, 1.3703434036916388e18),
(1083, 'Intytut Dizajnu', 'Fri Mar 12 10:31:11 +0000 2021', 'W drugiej połowie marca startujemy ze sklepem internetowym! 😌 Książka \'\'Obiekty, które zostały biedronkami\'\' również trafi do magazynu! #kielce #idkielce #miastokielce #gdynia #bydgoszcz @Dominika_Janick https://t.co/3vgikgFmZY', 493421, NULL, 1.3703214661269176e18),
(1084, 'Royal Lane', 'Fri Mar 12 09:59:05 +0000 2021', 'RT @k_pawlowska: #CultureTrav \n#Water\n So close to me  #BalticSea &amp; #Gdynia\nAnd it\'s just like that:\n\"I need the great water, this good one…', 493421, NULL, 1.3703133887697428e18),
(1085, 'Gniewko', 'Fri Mar 12 09:47:02 +0000 2021', '#Warszawa #Kraków #Łódź #Wrocław #Poznań #Gdańsk #Szczecin #Bydgoszcz #Lublin #Białystok #Katowice #Gdynia #Częstochowa #Radom #Sosnowiec #Toruń #Kielce #Rzeszów #Gliwice #Zabrze #Olsztyn #BielskoBiała #Bytom #ZielonaGóra #Rybnik #RudaŚląska #Tychy #Opole #GorzówWielkopolski https://t.co/joillbtdjz', 493421, NULL, 1.370310354522288e18),
(1086, 'Bartosz T. Wieliński 🇵🇱💯', 'Fri Mar 12 09:18:29 +0000 2021', '🇵🇱🌳🌳🌳👧 The #Silver #Hood lost in the #woods\n\'\n\'\n\'\n#nature #forest #Gdynia #Kolibki #Poland #hdr #travel #instatravel https://t.co/R77pWdLfzG https://t.co/hbb7Z14LyY', 493421, NULL, 1.3703031692139602e18),
(1087, 'Ojczyzna 🇵🇱✌', 'Fri Mar 12 07:59:41 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.3702833410108948e18),
(1088, 'Andrzej Olkiewicz', 'Fri Mar 12 07:52:09 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.3702814456258888e18),
(1109, 'Exeter Consortium', 'Wed Mar 17 10:33:51 +0000 2021', 'RT @PlymouthTSA: Don\'t miss out on the Art/DT Open Hub Meeting! #CPD #plymouth #teachers @TorbayTSA @SouthWestTSA @ExCoTSA @teachingschsSW…', 32185, NULL, 1.3721340761493422e18),
(1110, 'Building Plymouth', 'Wed Mar 17 10:30:14 +0000 2021', 'Calling #serviceleavers in the SW. \nRegister for a FREE @buildplymouth &amp; @BuildGreaterExe virtual #Construction #Careers event on 24.03.21 \nTwo service leavers from @MidasGroupUk &amp; @morgansindallci will talk about their experiences👍\nRegister: https://t.co/QlVfnne2XH \n#plymouth https://t.co/gl4cy2QtlA', 32185, NULL, 1.372133164630573e18),
(1111, 'reliefchef.org', 'Wed Mar 17 10:24:41 +0000 2021', '@kirenpuri No, some guy in #Plymouth beat you to it. He\'s #WalterMitty', 32185, NULL, 1.3721317680490168e18),
(1112, 'D A Alexander & Co', 'Wed Mar 17 10:20:04 +0000 2021', 'Spring warm-up!\n\n🧤✔️😎\n\n#daalexander #landscapes #landscapedesign #landscapephotos #boulders #case #machine #hardwork #michigan #livonia #novi #northville #plymouth #canton #annarbor #southlyon #mi #outside #perfect #loveyourlandscape https://t.co/re9L0xHNNF', 32185, NULL, 1.3721306057276908e18),
(1113, 'Devon Stainless', 'Wed Mar 17 10:19:21 +0000 2021', 'Our Infinity Lite System is fitted without channel or handrail. \n\nThis allows you to maximise your wonderful views 🤩\n\n#devonstainless #infinitylite #devonbusiness #glass #balustrade #southhams #swisbest #plymouth #salcombe #torbay #lovewhereyoulive https://t.co/PU1acLaoOg', 32185, NULL, 1.3721304288328622e18),
(1114, 'HumanResource by PartwellHR', 'Wed Mar 17 10:17:06 +0000 2021', 'RT @Diversityjobs4u: Latest Vacancy: HM Land Registry @HMLandRegistry is #recruiting a Test Analyst - #DiversityandInclusion #Jobsite #jobs…', 32185, NULL, 1.3721298616371773e18),
(1115, 'The Diversity Dashboard', 'Wed Mar 17 10:17:00 +0000 2021', 'Latest Vacancy: HM Land Registry @HMLandRegistry is #recruiting a Test Analyst - #DiversityandInclusion #Jobsite #jobs #latestvacancy #HR #UKGovernment #plymouth #it #itjobs #Analytics #recruiting  #london #it #itjobs https://t.co/RBzko13M1g', 32185, NULL, 1.3721298348523602e18),
(1116, 'Paul Keen', 'Wed Mar 17 10:10:36 +0000 2021', 'Our in house jewellery expert and gemologist, Tracey, is having a very busy day managing a high number of enquiries for tonights exciting jewellery auction in #Plymouth . Tune in at 6pm https://t.co/IvvnIU6bP8 @thesaleroom https://t.co/m1Rt0XbEuY', 32185, NULL, 1.3721282243779953e18),
(1117, 'DCPolfed', 'Wed Mar 17 10:10:05 +0000 2021', '#BroughtToJustice in #Plymouth: https://t.co/R8DRiZWox9', 32185, NULL, 1.3721280947656458e18),
(1118, 'Thane Sparks', 'Wed Mar 17 09:55:21 +0000 2021', 'RT @ACESwimming1: Stunning! Amazing conditions - perfect to start the day with 2km in the sea 😍💙🌅🏊‍♂️\n#aceswimming #acefitness #plymouth #b…', 32185, NULL, 1.372124385549648e18),
(1119, 'Pomorski Park N-T', 'Wed Mar 17 10:22:24 +0000 2021', 'Startuje Konkurs im. Romualda Szczęsnego! \n\nStudencie! Pochwal się swoją pracą dyplomową z zakresu nowych technologii wykonaną na @PolitechnikaGda i zawalcz o nagrodę główną w wysokości 10 000 zł!\n\nℹ️ więcej: https://t.co/I0ctLqNBqe\n📨 zgłoszenia: https://t.co/q67umTgZfq\n\n#gdynia https://t.co/FXcH2CGy7h', 493421, NULL, 1.3721311950986445e18),
(1120, 'NaviExpert', 'Wed Mar 17 09:26:20 +0000 2021', '#Wypadek na Obwodnicy #Trójmiasto (#S6) pomiędzy węzłami #Gdańsk Kowale i Gdańsk Szadółki. Występują #utrudnienia w ruchu w kierunku #Gdynia. #pomorskie', 493421, NULL, 1.3721170858585047e18),
(1121, 'Marcin Kordacki', 'Wed Mar 17 09:07:16 +0000 2021', 'Floating #Gdynia #blackandwhitephotography #2021 https://t.co/tmGunuqfVP', 493421, NULL, 1.3721122870545818e18),
(1122, 'Stowarzyszenie Ekonomiki Transportu', 'Wed Mar 17 07:41:32 +0000 2021', '@LeszekMatula @krzysztof1985 Airport #Gdynia to już w ogóle szczególny przypadek. Władowano 90 mln zł w nikomu niepotrzebne lotnisko (w momencie gdy za rogiem rozbudowywało się Rębiechowo - nie tylko samo lotnisko, ale też przecież kolej i drogi!), a sprzedano resztki za niecałe 10 mln...', 493421, NULL, 1.372090713580712e18),
(1123, 'Mirosław Woźniak', 'Wed Mar 17 05:20:11 +0000 2021', 'RT @IntermodalnewsP: Norweski #armator short sea @viaseashipping  otwiera biura w #Gdynia i Kłajpedzie #transportmorski https://t.co/4US1y9…', 493421, NULL, 1.3720551375989842e18),
(1124, 'Andrzej Olkiewicz', 'Wed Mar 17 00:19:16 +0000 2021', 'RT @AndrzejOlkiewi: #PrzekopMierzei? gdy powstawał obok Gdańska port we wsi #Gdynia, #Niemcy krytykowali jak PO🇩🇪 dzisiaj, #Polska gigantom…', 493421, NULL, 1.3719794132571382e18),
(1125, 'Intermodalnews.pl', 'Tue Mar 16 18:08:19 +0000 2021', 'Norweski #armator short sea @viaseashipping  otwiera biura w #Gdynia i Kłajpedzie #transportmorski https://t.co/4US1y9W0AZ', 493421, NULL, 1.371886056799359e18),
(1126, 'Kronika24.pl', 'Tue Mar 16 16:54:00 +0000 2021', 'Wiosna. Gdyńskie sokoły gotowe na sezon lęgowy. Są już dwa jaja\n#Gdynia\nhttps://t.co/k8uhQm57LI', 493421, NULL, 1.3718673553289052e18),
(1127, 'Gniewko', 'Tue Mar 16 13:40:25 +0000 2021', '#KONFEDERACJA #Warszawa #Kraków #Łódź #Wrocław #Poznań #Gdańsk #Szczecin #Bydgoszcz #Lublin #Białystok #Katowice #Gdynia #Częstochowa #Radom #Sosnowiec #Toruń #Kielce #Rzeszów #Gliwice #Zabrze #Olsztyn #BielskoBiała #Bytom #ZielonaGóra #Rybnik #RudaŚląska https://t.co/1cTBVXJMZH https://t.co/JE0SqPplie', 493421, NULL, 1.3718186388235264e18),
(1128, 'Andreas Sebayang', 'Tue Mar 16 09:57:15 +0000 2021', 'RT @AndreasPrause: Situation in der Region #Gdańsk/#Gdynia: Im Infektionskrankenhaus Gdańsk sind 193 von 211 Betten belegt. \"COVID-Statione…', 493421, NULL, 1.3717624767951995e18),
(1129, 'Pete Smith', 'Tue Mar 16 16:53:23 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3718672028534252e18),
(1130, 'Jan Fricker', 'Tue Mar 16 11:59:26 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.37179322570342e18),
(1131, 'Sandra Mancey', 'Tue Mar 16 09:26:26 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3717547238214205e18),
(1132, 'Maritime UK ⚓ 🇬🇧', 'Tue Mar 16 08:50:13 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3717456064279347e18),
(1133, 'DougKerr', 'Mon Mar 15 23:22:38 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3716027707850998e18),
(1134, 'Kyle Lewis', 'Mon Mar 15 22:49:42 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715944848201564e18),
(1135, 'Richard Allan', 'Mon Mar 15 21:58:18 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715815496872428e18),
(1136, 'Dr Nigel J. Marley', 'Mon Mar 15 21:46:06 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.37157847785873e18),
(1137, 'Grrooves💚', 'Mon Mar 15 20:50:12 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715644083218104e18),
(1138, 'Martin George', 'Mon Mar 15 20:42:34 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715624898010276e18),
(1139, 'sandii', 'Mon Mar 15 20:37:37 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.37156124418082e18),
(1140, 'History', 'Mon Mar 15 20:30:43 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715595061619016e18),
(1141, 'Tudor Evans', 'Mon Mar 15 20:26:33 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715584571077386e18),
(1142, 'Chris Penberthy', 'Mon Mar 15 20:19:30 +0000 2021', 'RT @plymouthcc: Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.371556686327079e18),
(1143, 'Plymouth City Council', 'Mon Mar 15 20:19:14 +0000 2021', 'Standing watch on #Plymouth Hoe. https://t.co/O9VOdSf7ZA', NULL, 3, 1.3715566161689969e18),
(1144, 'patricia goddard', 'Sun Mar 14 16:49:43 +0000 2021', 'RT @LeilaNottage: @LookIIPlymouth you were looking very calm today as the sun set over #Plymouth Hoe. We enjoyed stopping by to say hello.…', NULL, 3, 1.3711415026095882e18),
(1145, '👤 Look II Plymouth 👤 \"Rusty Reg\" - A New POLL', 'Sun Mar 14 08:04:51 +0000 2021', 'RT @PlymouthDevon1: A little stroll along Plymouth Hoe this evening.... 🚶 🌥️\n#Plymouth #SirFrancisDrake #memorial #ValentisCafe #PlymouthHo…', NULL, 3, 1.3710094151308083e18),
(1146, 'Leila Nottage', 'Sat Mar 13 23:17:10 +0000 2021', '@LookIIPlymouth you were looking very calm today as the sun set over #Plymouth Hoe. We enjoyed stopping by to say hello. #britainsoceancity https://t.co/wfgGKWDqc7', NULL, 3, 1.370876617946456e18),
(1165, 'swcomms', 'Wed Mar 17 11:30:09 +0000 2021', '#swcomms are pleased to announce that Paul North from @CityFibre and Elaine Bellamy from #swcomms will be hosting a #webinar about the benefits of full fibre for businesses and the transformation of digital Britain: https://t.co/xQq3UFyzdB #bristol #exeter #plymouth #portsmouth https://t.co/z60CWW3H7Q', 32185, NULL, 1.372148245900714e18),
(1166, 'Destination Plymouth', 'Wed Mar 17 11:28:40 +0000 2021', 'RT @plymouthmarket: We wish you a very happy Saint Patrick\'s Day 🍀🌈💰\n from @plymouthmarket traders and staff \n#Plymouth #StPatricksDay #Lov…', 32185, NULL, 1.372147870825132e18),
(1167, 'Tom', 'Wed Mar 17 11:27:27 +0000 2021', 'RT @ClearWasteApp: Someone must recognise this fridge freezer - with its distinctive Daffy Duck sticker. It was fly-tipped in the last few…', 32185, NULL, 1.3721475667045253e18),
(1168, 'beabothered', 'Wed Mar 17 11:26:42 +0000 2021', 'RT @ClearWasteApp: Someone must recognise this fridge freezer - with its distinctive Daffy Duck sticker. It was fly-tipped in the last few…', 32185, NULL, 1.3721473745550787e18),
(1169, 'Cool Brighton', 'Wed Mar 17 11:13:10 +0000 2021', 'RT @SceneLGBTQ: #LGBTQ #Trans #TransRights #Plymouth #UK #Brighton #Sussex https://t.co/32phQWYSCZ', 32185, NULL, 1.372143969338073e18),
(1170, 'Scene Magazine', 'Wed Mar 17 11:12:05 +0000 2021', '#LGBTQ #Trans #TransRights #Plymouth #UK #Brighton #Sussex https://t.co/32phQWYSCZ', 32185, NULL, 1.372143696490156e18),
(1171, 'JCP in Plymouth', 'Wed Mar 17 11:03:19 +0000 2021', 'RT @Alltopbananas: Good morning @JCPinPlymouth We have 3,000+ jobs in Plymouth today!\n\nhttps://t.co/M2u0EmD5q9\n\n#plymouth #plymouthjobs #we…', 32185, NULL, 1.3721414900681605e18),
(1172, 'MiHi Digital', 'Wed Mar 17 11:00:17 +0000 2021', 'Want to rank higher on Google? Then you\'ve come to the right place. Click the link to find out more about our SEO work. https://t.co/gX5RLQDRmh\n\n#webdesign #smallbiz #kernow #website #plymouth #digital #stives https://t.co/hkSDiDNGmA', 32185, NULL, 1.3721407279211684e18),
(1173, 'Lilly Markes', 'Wed Mar 17 10:53:44 +0000 2021', 'RT @OuterStageUK: Bigger stage floor to help maintain social distancing this summer.  #OutdoorEvents #MobileStage #Plymouth https://t.co/xV…', 32185, NULL, 1.372139079362605e18),
(1174, 'Harold Duckworth & Co', 'Wed Mar 17 10:50:00 +0000 2021', 'This would be amazing progress for the Civic Centre - which is long overdue a makeover! https://t.co/kf0uRLWRwv \n#plymouth #wednesdaymotivation', 32185, NULL, 1.3721381396330004e18),
(1175, 'Gniewko', 'Wed Mar 17 10:53:53 +0000 2021', 'NarodowaEutanazja #PiS #Warszawa #Kraków #Łódź #Wrocław #Poznań #Gdańsk #Szczecin #Bydgoszcz #Lublin #Białystok #Katowice #Gdynia #Częstochowa #Radom #Sosnowiec #Toruń #Kielce #Rzeszów #Gliwice #Zabrze #Olsztyn #BielskoBiała #Bytom #ZielonaGóra #Rybnik #RudaŚląska #Tychy #Opole https://t.co/MMPZuqaEl9', 493421, NULL, 1.3721391185247928e18),
(1176, 'Gdynia', 'Wed Mar 17 10:42:41 +0000 2021', 'RT @PPNT_Gdynia: Startuje Konkurs im. Romualda Szczęsnego! \n\nStudencie! Pochwal się swoją pracą dyplomową z zakresu nowych technologii wyko…', 493421, NULL, 1.3721362983251558e18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`woeid`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `woeid` (`woeid`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `woeid` (`woeid`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `woeid` (`woeid`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `woeid` (`woeid`);

--
-- Indexes for table `place_category`
--
ALTER TABLE `place_category`
  ADD PRIMARY KEY (`place_id`,`category_id`);

--
-- Indexes for table `tweet`
--
ALTER TABLE `tweet`
  ADD PRIMARY KEY (`twin_cities_id`),
  ADD UNIQUE KEY `tweet_id` (`tweet_id`),
  ADD KEY `woeid` (`woeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tweet`
--
ALTER TABLE `tweet`
  MODIFY `twin_cities_id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1369321690472321025;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`),
  ADD CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `place` (`place_id`);

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`);

--
-- Constraints for table `tweet`
--
ALTER TABLE `tweet`
  ADD CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
