-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2023 at 01:02 PM
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

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `CountActiveTickets` () RETURNS INT(11)  BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count 
    FROM ticket
    WHERE ticket_status = 'Active';
    
    RETURN count;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountAvailableBuses` () RETURNS INT(11)  BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count 
    FROM bus
    WHERE status = 'Available';
    
    RETURN count;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `CountCancelledTickets` () RETURNS INT(11)  BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count 
    FROM ticket
    WHERE ticket_status = 'cancelled';
    
    RETURN count;
END$$

DELIMITER ;

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

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`plate_number`, `bus_name`, `capacity`, `model`, `manufacturer`, `color`, `fueltype`, `status`, `driver_id`, `created`) VALUES
('XXXX-12345', 'Metro Shuttle A', '80', 'Old', 'Ford INC.', 'Red', 'Diesel', 'Available', 1, '2023-06-06 07:45:22'),
('XXXX-12346', 'Maharlika', '98', 'New', 'Mitsubishi', 'Pink', 'Diesel', 'Available', 5, '2023-06-08 00:26:21'),
('XXXX-12347', 'Maharlika', '98', 'New', 'Mitsubishi', 'Pink', 'Diesel', 'NA', 5, '2023-06-08 00:29:28'),
('XXXX-12348', 'Nissan', '48', 'New', 'Mitsubishi', 'Brown', 'Diesel', 'Available', 5, '2023-06-08 00:29:28'),
('XXXX-12349', 'Electric Bus', '98', 'New', 'Mitsubishi', 'Pink', 'Electric', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12351', 'Nissan', '48', 'New', 'Mitsubishi', 'Brown', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12352', 'Eugene', '38', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12353', 'Ford', '56', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12354', 'Ford', '56', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12355', 'Ford', '56', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12356', 'Ford', '56', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12357', 'Ford', '56', 'New', 'Mitsubishi', 'Yellow', 'Diesel', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12358', 'Electric Bus', '98', 'New', 'Mitsubishi', 'Pink', 'Electric', 'Available', 5, '2023-06-08 00:33:03'),
('XXXX-12359', 'Electric Bus', '98', 'New', 'Mitsubishi', 'Pink', 'Electric', 'Available', 5, '2023-06-08 00:33:03');

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

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `name`, `license_number`, `contact_number`, `email`, `address`, `experience`, `availability`, `created`) VALUES
(1, 'Ford Ulbata Jr.', 'AAAA-12345', '0936415272', 'ulbata@gmail.com', 'Fatima General Santos City', '2 years', 'Available', '2023-06-06 07:45:01'),
(2, 'Richard Bangoy', 'AAAA-12346', '09664267189', 'bangoy@gmail.com', 'Lagao General Santos City', '10 years', 'Available', '2023-06-06 08:13:17'),
(3, 'John Doe', 'AAAA-11111', '1234567890', 'johndoe@example.com', '123 Main St', '5 years', 'Available', '2023-06-06 08:18:56'),
(4, 'Jane Smith', 'BBBB-22222', '0987654321', 'janesmith@example.com', '456 Elm St', '3 years', 'Not Available', '2023-06-06 08:18:56'),
(5, 'David Johnson', 'CCCC-33333', '9876543210', 'davidjohnson@example.com', '789 Oak Ave', '7 years', 'Available', '2023-06-06 08:18:56'),
(6, 'Emily Davis', 'DDDD-44444', '0123456789', 'emilydavis@example.com', '321 Maple Rd', '2 years', 'Not Available', '2023-06-06 08:18:56'),
(7, 'Michael Wilson', 'EEEE-55555', '6789012345', 'michaelwilson@example.com', '654 Pine Ln', '6 years', 'Available', '2023-06-06 08:18:56'),
(8, 'Sarah Anderson', 'FFFF-66666', '5432167890', 'sarahanderson@example.com', '987 Cedar St', '4 years', 'Not Available', '2023-06-06 08:18:56'),
(9, 'Matthew Thomas', 'GGGG-77777', '8901234567', 'matthewthomas@example.com', '876 Birch Ave', '8 years', 'Available', '2023-06-06 08:18:56');

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

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `name`, `age`, `gender`, `contact`, `email`, `address`, `nationality`, `created`) VALUES
(1, 'Jessie Conn Ralph M. Sam', 21, 'Male', 981821721, 'sam@gmail.com', 'Fatima General Santos City', 'Filipino', '2023-06-06 07:47:56'),
(2, 'Matthew Fang Bilaos', 20, 'Male', 981821729, 'bilaos@gmail.com', 'Zone 4 Block 6 General Santos City', 'Filipino', '2023-06-06 08:48:07'),
(3, 'Mateo Cortez', 24, 'Male', 981672162, 'cortez@gmail.com', 'Fatima General Santos City', 'Filipino', '2023-06-08 00:36:03'),
(4, 'Richard Bangoy Jr.', 24, 'Male', 981672162, 'bangoy@gmail.com', 'Fatima General Santos City', 'Filipino', '2023-06-08 00:37:18'),
(5, 'Mateo Cortez', 24, 'Male', 981672162, 'cortez@gmail.com', 'Fatima General Santos City', 'Filipino', '2023-06-08 00:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(10) NOT NULL,
  `passenger_id` int(10) NOT NULL,
  `schedule_id` int(10) NOT NULL,
  `seat_number` int(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `passenger_id`, `schedule_id`, `seat_number`, `created`) VALUES
(4, 2, 1, 40, '2023-06-06 10:09:34'),
(5, 2, 1, 23, '2023-06-06 10:16:33'),
(6, 3, 3, 65, '2023-06-08 11:15:22'),
(7, 2, 3, 34, '2023-06-08 11:19:18');

--
-- Triggers `reservation`
--
DELIMITER $$
CREATE TRIGGER `cancel_ticket` AFTER DELETE ON `reservation` FOR EACH ROW BEGIN
  INSERT INTO ticket (reservation_id, ticket_status)
  VALUES (OLD.reservation_id, 'cancelled');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `create_ticket` AFTER INSERT ON `reservation` FOR EACH ROW BEGIN
  INSERT INTO ticket (reservation_id, ticket_status)
  VALUES (NEW.reservation_id, 'active');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservation_details_view`
-- (See below for the actual view)
--
CREATE TABLE `reservation_details_view` (
`name` varchar(100)
,`contact` int(10)
,`source` varchar(100)
,`destination` varchar(100)
,`departure` time
,`arrival_time` time
,`seat_number` int(10)
,`created` datetime
);

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
  `departure` time NOT NULL,
  `arrival_time` time NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `source`, `destination`, `distance`, `duration`, `fare`, `stops`, `departure`, `arrival_time`, `created`) VALUES
(1, 'Gensan', 'Davao', '2 km', '20 Minutes', 200, 'Davao Terminal', '04:30:00', '04:50:00', '2023-06-06 07:49:44'),
(2, 'Polomolok', 'Davao City', '', '200 km', 500, 'Davao City Terminal', '00:00:10', '00:00:12', '2023-06-08 10:40:46'),
(3, 'Polomolok', 'Davao City', '', '200 km', 500, 'Davao City Terminal', '00:00:10', '00:00:12', '2023-06-08 10:44:00'),
(4, 'Tagum City', 'Davao City', '', '30 km', 80, 'Davao City Terminal', '00:00:10', '00:00:12', '2023-06-08 10:44:00'),
(5, 'Polomolok', 'Tagum City', '', '200 km', 500, 'Tagum City Terminal', '00:00:11', '00:00:12', '2023-06-08 10:44:00'),
(6, 'Polomolok', 'Lagao', '', '100 km', 80, 'Lagao', '00:00:10', '00:00:12', '2023-06-08 10:44:00'),
(7, 'Fatima', 'Lagao', '', '30 km', 90, 'Lagao', '00:00:10', '00:00:12', '2023-06-08 10:44:00'),
(8, 'Fatima', 'Calumpang', '', '10 km', 20, 'Lagao', '00:00:10', '00:00:12', '2023-06-08 10:44:00'),
(9, 'Polomolok', 'Gensan', '20 km', '30 minutes', 100, 'Bolaong Terminal', '11:00:00', '12:00:00', '2023-06-08 11:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(10) NOT NULL,
  `plate_number` varchar(100) NOT NULL,
  `route_id` int(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `plate_number`, `route_id`, `created`) VALUES
(1, 'XXXX-12345', 1, '2023-06-06 09:28:56'),
(2, 'XXXX-12346', 5, '2023-06-08 11:14:16'),
(3, 'XXXX-12347', 9, '2023-06-08 11:18:41');

-- --------------------------------------------------------

--
-- Stand-in structure for view `schedule_view`
-- (See below for the actual view)
--
CREATE TABLE `schedule_view` (
`plate_number` varchar(100)
,`departure` time
,`arrival` time
,`source` varchar(100)
,`destination` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_number` int(10) NOT NULL,
  `reservation_id` int(10) NOT NULL,
  `ticket_status` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_number`, `reservation_id`, `ticket_status`, `created`) VALUES
(1, 2, 'active', '2023-06-06 09:27:26'),
(2, 1, 'cancelled', '2023-06-06 09:27:26'),
(3, 3, 'active', '2023-06-06 09:27:26'),
(4, 3, 'cancelled', '2023-06-06 09:27:26'),
(5, 4, 'active', '2023-06-06 10:09:34'),
(6, 2, 'cancelled', '2023-06-06 10:10:38'),
(7, 5, 'active', '2023-06-06 10:16:33'),
(8, 6, 'active', '2023-06-08 11:15:22'),
(9, 7, 'active', '2023-06-08 11:19:18'),
(10, 8, 'active', '2023-06-08 19:00:06'),
(11, 8, 'cancelled', '2023-06-08 19:01:21');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ticket_view`
-- (See below for the actual view)
--
CREATE TABLE `ticket_view` (
`passenger_name` varchar(100)
,`bus_name` varchar(100)
,`source` varchar(100)
,`destination` varchar(100)
,`departure_time` time
,`arrival_time` time
,`fare` int(10)
,`status` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `reservation_details_view`
--
DROP TABLE IF EXISTS `reservation_details_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservation_details_view`  AS SELECT `p`.`name` AS `name`, `p`.`contact` AS `contact`, `rt`.`source` AS `source`, `rt`.`destination` AS `destination`, `rt`.`departure` AS `departure`, `rt`.`arrival_time` AS `arrival_time`, `r`.`seat_number` AS `seat_number`, `r`.`created` AS `created` FROM (((`reservation` `r` join `passenger` `p` on(`r`.`passenger_id` = `p`.`passenger_id`)) join `schedule` `s` on(`r`.`schedule_id` = `s`.`schedule_id`)) join `routes` `rt` on(`s`.`route_id` = `rt`.`route_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `schedule_view`
--
DROP TABLE IF EXISTS `schedule_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `schedule_view`  AS SELECT `schedule`.`plate_number` AS `plate_number`, `routes`.`departure` AS `departure`, `routes`.`arrival_time` AS `arrival`, `routes`.`source` AS `source`, `routes`.`destination` AS `destination` FROM ((`schedule` join `bus` on(`schedule`.`plate_number` = `bus`.`plate_number`)) join `routes` on(`schedule`.`route_id` = `routes`.`route_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `ticket_view`
--
DROP TABLE IF EXISTS `ticket_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticket_view`  AS SELECT `passenger`.`name` AS `passenger_name`, `bus`.`bus_name` AS `bus_name`, `routes`.`source` AS `source`, `routes`.`destination` AS `destination`, `routes`.`departure` AS `departure_time`, `routes`.`arrival_time` AS `arrival_time`, `routes`.`fare` AS `fare`, `ticket`.`ticket_status` AS `status` FROM (((((`ticket` join `reservation` on(`ticket`.`reservation_id` = `reservation`.`reservation_id`)) join `passenger` on(`reservation`.`passenger_id` = `passenger`.`passenger_id`)) join `schedule` on(`reservation`.`schedule_id` = `schedule`.`schedule_id`)) join `bus` on(`schedule`.`plate_number` = `bus`.`plate_number`)) join `routes` on(`schedule`.`route_id` = `routes`.`route_id`))  ;

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
  MODIFY `driver_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_number` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
