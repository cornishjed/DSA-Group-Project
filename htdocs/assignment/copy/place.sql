-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 05:02 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

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
(1, 'National Marine Aquarium', 'Visit the UK\'s largest Aquarium, be amazed by their fascinating underwater world, and how we all play a part in conserving it. All day tickets come with a free 12 month pass so pay once and return as much as you like throughout the year! The National Marine Aquarium is run by the Ocean Conservation Trust, a charity dedicated to connecting people with the Ocean. A visit to the Aquarium will take you on a journey across the world\'s Ocean, from the shores of Plymouth Sound to the coral reefs of the tropics of Australia. With over 4,000 animals to meet including sharks, sting rays, octopuses, jellyfish and a cheeky turtle, there will be something different on every visit. Their Ocean Discovery Rangers host the Aquarium to connect all visitors to the animals who call it home. With four main zones, their exhibits include the UK\'s deepest and largest tank, the UK\'s largest native exhibit, the UK\'s largest single viewing panel and many more interactive displays. Not only are they a fantastic day out, but the National Marine Aquarium is a truly unique venue in the stunning location of Sutton Harbour. Its relaxed environment and breath-taking views make it the perfect venue for a variety of functions and events, from birthday celebrations to wedding receptions. With several spaces available to hire and a variety of catering options available. Enjoy fine dining for 120 guests on round tables in our auditorium looking at the amazing Eddystone Reef exhibit or a buffet for 75 in Horizons, with views to die for across Plymouth Sound. Their events calendar has something for everyone, from yoga sessions, late night lecture series and even a chance to enjoy an evening in one of the most unique settings for a dine at the Aquarium experience. And if you live a little way a way and want to explore the Aquarium virtually before visiting Plymouth, why not try one of their virtual tour experiences? The perfect treat or present for any budding marine biologists. Make sure you visit the National Marine Aquarium website for an updated list of all the events and activities upcoming. 2021 marks the beginning of the globally significant UN Ocean Decade. Places for the people to engage with and understand our Ocean cultural heritage are required now more than ever. The UK is an island nation, no-one is ever more than 70 miles from the coast. The Ocean and its underwater and natural heritage is intricately intertwined with our cultural heritage.', NULL, 'Rope Walk Coxside, Plymouth PL4 0LF', '1998', 'Daily 10am to 5pm', 0, 'https://www.national-aquarium.co.uk', 32185, 50.3667, -4.131),
(2, 'The Box Plymouth', 'Brand new museum redeveloped from Plymouth City Museum and Art Gallery which houses a collection of about 2 million items. The Box, Plymouth\'s major new museum, gallery and archive, opened in late 2020 and is one of the UK\'s most exciting cultural attractions. Nine permanent galleries showcase the city\'s incredible art, natural history, human history, film, photographic and archive collections. Three major exhibitions highlight the Mayflower 400 anniversary and contemporary art by international artists.', NULL, 'Tavistock, Plymouth PL4 8AX', '2020', 'Tuesday to Sunday between 10am and 5pm', 0, 'https://www.theboxplymouth.com', 32185, 50.3744, -4.1375),
(3, 'Plymouth Hoe', 'A large green expanse that covers much of Plymouths southern waterfront, Plymouth Hoe is home to many attractions as well as being an attraction in of itself. Rather like a park, many locals and holiday makers enjoy a picnic on the grass while gazing out onto the wide view of Plymouth Sound, the Breakwater and Eddyston Lighthouse. Smeaton\'s Tower, a white and red striped lighthouse, is a dominant feature of the Hoe and has become a recognised landmark for Plymouth and its waterfront. A statue of Sir Francis Drake and The Royal Citadel also occupy the Hoe, and during the summer months, the public can enjoy a dip in the Tinside Lido, a saltwater swimming pool located on the shore amongst the rocks. Annual events are also hosted on Plymouth Hoe such as the British Fireworks Championships and Plymouth Armed Forces Day, as well a fun-fairs and music.', NULL, '4 Osborne Pl, Plymouth PL1 2PU, England', '1588', 'Open all day', 1, 'https://www.visitplymouth.co.uk/explore/areas-to-visit/the-hoe', 32185, 50.3656, -4.1423),
(4, 'Mayflower House Museum', 'The Pilgrims set sail from Plymouth on the Mayflower on 6 September 1620, eventually landing and settling in present-day Plymouth, Massachusetts. The Mayflower Museum explores the story of the Mayflower and the Pilgrims with information and hands-on displays, including dress-up and role play, a model of the Mayflower built by Devonport Dockyard apprentices in 1969 and a list of all the Pilgrims and their hometowns.', NULL, '3-5 The Barbican, Plymouth PL1 2LR, England', '1620', 'Open all year April to October: Monday to Saturday 9.00 - 17:00', 0, 'https://www.mayflower400uk.org', 32185, 50.3596, -4.1337),
(5, 'Barbican Kitchen', 'Housed in the world famous Plymouth Gin Distillery, the Barbican Kitchen was established in 2006 by the Tanner Brothers, Chris and James. Our aim is to deliver fresh local food at a realistic price. The Barbican Kitchen takes full advantage of the superb larder available to us here in the Westcountry. Menu showcasing stunning local meats, vegetables and top quality fish from fantastic network of suppliers', 150, 'Black Friars Distillery, 60 Southside St, Plymouth PL1 2LQ', '2016', 'Tuesday to Saturday between 12pm and 21.30pm', 0, 'http://barbicankitchen.com', 32185, 50.3678, -4.1378),
(6, 'Minster Church of St. Andrew', 'The Minster Church of St Andrew, also known as St Andrew\'s Church, Plymouth is an Anglican church in Plymouth. It is the original parish church of Sutton, one of the three towns which were later combined to form the city of Plymouth. The church is the largest parish church in the historic county of Devon and was built in the mid to late 15th century. It was designated as a Minster Church in 2009 and it continues to operate as the focus for religious civic events for the city and as a bustling evangelical church. It is likely to be on the site of the original Saxon church and was once attached to the abbey of Plympton.', NULL, 'Royal Parade, Plymouth PL1 2AD', '1460', 'Monday to Friday between 9am and 1pm', 0, 'https://www.standrewschurch.org.uk', 32185, 50.37, -4.13987),
(7, 'Dar Pomorza', 'Polish full-rigged sailing ship built in 1909 which is preserved in Gdynia as a museum ship. Since 27 May 1983 she has been a museum ship in Gdynia (next to the Błyskawica). She is part of a collection of National Maritime Museum in Gdańsk. In October 2009 the Dar Pomorza celebrated her 100th \"birthday\". The celebration included her second christening by Mrs Barbara Szczurek, the wife of the Mayor of Gdynia. Her speed under sail averaged 5 knots, with a 17 knots maximum. Her auxiliary engine was one of the type used in German U-Boats, and her horn, installed after the war, was from the German battle-cruiser Gneisenau, scuttled on 27/28 March 1945 at one of the entrances to the harbour of Gdynia.', 190, 'al. Jana Paw³a II, 81-345 Gdynia, Polska', '1909', 'Tuesday to Sunday between 10am and 4pm', 0, 'https://www.nmm.pl/dar-pomorza', 493421, 54.5195, 18.5528),
(8, 'Park im. Marii i Lecha Kaczyñski', 'Kamienna Góra is a park named after Maria and Lech Kaczyñski. At the very top there is an observation deck - you can reach it by stairs which lead from every side. Second option to get at the top is a cable car, unfortunately temporarily closed. Lots of greenery around and flowers replenished constantly. There is also a small amphitheater that can be used by artists.', NULL, 'Adama Mickiewicza, 81-379, Gdynia, Polska', '2010', 'Open all day', 1, 'https://www.gdynia.pl', 493421, 54.4461, 18.5715),
(9, 'Oberża 86', 'Before the war, it housed a household shop, then a shoemaker\'s workshop. After 1945, a cottage was taken by four families. Then the city arranged an exhibition devoted to the oldest history of Gdynia as a fishing village. As a result of budget reduction in 2013, the Museum of the City of Gdynia gave up further lease of the house. As a result, it was transformed into restaurant. Thanks to this, Ober¿a 86 can host you today in their restaurant to serve traditional Polish cuisine based on regional flavours and natural products.', 0, 'Starowiejska 30, 81-304 Gdynia, Polska', '2013', 'Every day from 12pm to 8pm', 0, 'https://www.sztuczkabistro.com', 493421, 54.5215, 18.538),
(10, 'Koœció³ pw. œw. Micha³a Archanio', 'Roman Catholic church located in Gdynia in the Oksywie district at ul. Stanis³awa D¹bka', 200, 'Pu³kownika Stanis³awa D¹bka 1, 81-107 Gdynia, Polska', '1124', 'Monday 7pm to 7.30pm, Tuesday 8.30am to 9am, Wednesday 4pm to 5p', 0, 'http://www.parafia.oksy.net.pl', 493421, 54.5476, 18.5534),
(11, 'Plaża Miejska', 'The most popular beach in Gdynia, located in the vicinity of the Musical Theater and Koœciuszko Square. There is a bathing area 200m wide, which is guarded until the end of August. The beach is perfectly connected, there are also many attractions for children (including a playground, inflatable slide, trampoline) and adults (famous for its BBQ spots as well as pet-friendly area). It can get crowded in the summer, although city takes care of daily cleaning services. During the winter, people also benefit from the beach through winter swimming which is plunging in the autumn/winter season in icy water, wearing only a swimsuit and a hat or gloves – although it is recommended to visit a doctor before.', NULL, 'ul. Bulwar Nadmorski, 81-451 Gdynia, Polska', '1998', 'Open all day', 1, 'http://www.gdyniarodzinna.pl/miejsce/554,plaza-gdynia-srodmiesci', 493421, 54.516, 18.551),
(12, 'Akwarium Gdyñskie', 'Biggest Polish public aquarium and sea museum operated by the National Marine Fisheries Research Institute in Gdynia, Poland. Previously called the Oceanographic Museum and Sea Aquarium of the Sea Fisheries Institute in Gdynia (1971-2003), the aquarium has a zoological garden status and is situated along Aleja John Paul II on the South Pier. Exhibitions presented within the museum are on oceanography and hydrobiology, while the aquarium contains both sea and freshwater flora and fauna. You can find here a total of 215 species from 61 families, including 142 fish species, 3 amphibian species, 12 reptiles species and 58 invertebrates species. One of the biggest attractions of this place is the coral reef, which delights with its riot of colours and the richness of its inhabitants’ shapes.', NULL, 'al. Jana Paw³a II 1, 81-345 Gdynia, Polska', '1971', 'Tuesday to Sunday between 10am and 5pm', 0, 'https://akwarium.gdynia.pl', 493421, 54.5186, 18.5582);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `woeid` (`woeid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`woeid`) REFERENCES `city` (`woeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
