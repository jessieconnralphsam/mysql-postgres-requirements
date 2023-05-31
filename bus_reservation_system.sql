-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2023 at 04:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_reservation_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `plate_number` varchar(100) NOT NULL,
  `bus_name` varchar(100) NOT NULL,
  `capacity` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `fueltype` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bus_management_view`
-- (See below for the actual view)
--
CREATE TABLE `bus_management_view` (
`total_buses` bigint(21)
,`active_buses` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bus_search_view`
-- (See below for the actual view)
--
CREATE TABLE `bus_search_view` (
`plate_number` varchar(100)
,`bus_name` varchar(100)
,`model` varchar(100)
,`manufacturer` varchar(100)
,`color` varchar(100)
,`fueltype` varchar(100)
,`status` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `availability` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_details_view`
-- (See below for the actual view)
--
CREATE TABLE `driver_details_view` (
`driver_id` int(10)
,`name` varchar(100)
,`license_number` varchar(100)
,`contact_number` varchar(100)
,`email` varchar(100)
,`address` varchar(100)
,`experience` varchar(100)
,`availability` varchar(100)
,`created` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_list_view`
-- (See below for the actual view)
--
CREATE TABLE `driver_list_view` (
`driver_id` int(10)
,`name` varchar(100)
,`contact_number` varchar(100)
,`plate_number` varchar(100)
,`bus_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_details_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_details_view` (
`passenger_id` int(10)
,`name` varchar(100)
,`age` int(10)
,`gender` varchar(100)
,`contact` int(10)
,`email` varchar(100)
,`address` varchar(100)
,`nationality` varchar(100)
,`created` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_list_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_list_view` (
`passenger_id` int(10)
,`name` varchar(100)
,`age` int(10)
,`gender` varchar(100)
,`contact` int(10)
,`email` varchar(100)
,`address` varchar(100)
,`nationality` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_management_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_management_view` (
`total_passengers` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_search_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_search_view` (
`passenger_id` int(10)
,`name` varchar(100)
,`age` int(10)
,`gender` varchar(100)
,`contact` int(10)
,`email` varchar(100)
,`address` varchar(100)
,`nationality` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(10) NOT NULL,
  `passenger_id` int(10) NOT NULL,
  `schedule_id` int(10) NOT NULL,
  `seat_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(10) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `distance` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `fare` int(10) NOT NULL,
  `stops` varchar(100) NOT NULL,
  `departure` varchar(100) NOT NULL,
  `arrival_time` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(10) NOT NULL,
  `plate_number` varchar(100) NOT NULL,
  `route_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_number` int(10) NOT NULL,
  `reservation_id` int(10) NOT NULL,
  `ticket_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `bus_management_view`
--
DROP TABLE IF EXISTS `bus_management_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bus_management_view`  AS SELECT count(0) AS `total_buses`, sum(case when `bus`.`status` = 'Active' then 1 else 0 end) AS `active_buses` FROM `bus``bus`  ;

-- --------------------------------------------------------

--
-- Structure for view `bus_search_view`
--
DROP TABLE IF EXISTS `bus_search_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bus_search_view`  AS SELECT `bus`.`plate_number` AS `plate_number`, `bus`.`bus_name` AS `bus_name`, `bus`.`model` AS `model`, `bus`.`manufacturer` AS `manufacturer`, `bus`.`color` AS `color`, `bus`.`fueltype` AS `fueltype`, `bus`.`status` AS `status` FROM `bus``bus`  ;

-- --------------------------------------------------------

--
-- Structure for view `driver_details_view`
--
DROP TABLE IF EXISTS `driver_details_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `driver_details_view`  AS SELECT `driver`.`driver_id` AS `driver_id`, `driver`.`name` AS `name`, `driver`.`license_number` AS `license_number`, `driver`.`contact_number` AS `contact_number`, `driver`.`email` AS `email`, `driver`.`address` AS `address`, `driver`.`experience` AS `experience`, `driver`.`availability` AS `availability`, `driver`.`created` AS `created` FROM `driver``driver`  ;

-- --------------------------------------------------------

--
-- Structure for view `driver_list_view`
--
DROP TABLE IF EXISTS `driver_list_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `driver_list_view`  AS SELECT `driver`.`driver_id` AS `driver_id`, `driver`.`name` AS `name`, `driver`.`contact_number` AS `contact_number`, `bus`.`plate_number` AS `plate_number`, `bus`.`bus_name` AS `bus_name` FROM (`driver` join `bus` on(`driver`.`driver_id` = `bus`.`driver_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_details_view`
--
DROP TABLE IF EXISTS `passenger_details_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_details_view`  AS SELECT `passenger`.`passenger_id` AS `passenger_id`, `passenger`.`name` AS `name`, `passenger`.`age` AS `age`, `passenger`.`gender` AS `gender`, `passenger`.`contact` AS `contact`, `passenger`.`email` AS `email`, `passenger`.`address` AS `address`, `passenger`.`nationality` AS `nationality`, `passenger`.`created` AS `created` FROM `passenger``passenger`  ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_list_view`
--
DROP TABLE IF EXISTS `passenger_list_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_list_view`  AS SELECT `passenger`.`passenger_id` AS `passenger_id`, `passenger`.`name` AS `name`, `passenger`.`age` AS `age`, `passenger`.`gender` AS `gender`, `passenger`.`contact` AS `contact`, `passenger`.`email` AS `email`, `passenger`.`address` AS `address`, `passenger`.`nationality` AS `nationality` FROM `passenger``passenger`  ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_management_view`
--
DROP TABLE IF EXISTS `passenger_management_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_management_view`  AS SELECT count(0) AS `total_passengers` FROM `passenger``passenger`  ;

-- --------------------------------------------------------

--
-- Structure for view `passenger_search_view`
--
DROP TABLE IF EXISTS `passenger_search_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_search_view`  AS SELECT `passenger`.`passenger_id` AS `passenger_id`, `passenger`.`name` AS `name`, `passenger`.`age` AS `age`, `passenger`.`gender` AS `gender`, `passenger`.`contact` AS `contact`, `passenger`.`email` AS `email`, `passenger`.`address` AS `address`, `passenger`.`nationality` AS `nationality` FROM `passenger``passenger`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`plate_number`),
  ADD KEY `drive_id` (`driver_id`),
  ADD KEY `plate_number` (`plate_number`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `schedule_id` (`schedule_id`) USING BTREE;

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `plate_number` (`plate_number`),
  ADD KEY `route_id` (`route_id`) USING BTREE;

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_number`),
  ADD KEY `reservation_id` (`reservation_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_number` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`reservation_id`) REFERENCES `ticket` (`reservation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`plate_number`) REFERENCES `bus` (`plate_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
