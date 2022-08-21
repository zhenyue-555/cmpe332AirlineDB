-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2021 at 03:01 AM
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
-- Database: `airlinedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Airline`
--

CREATE TABLE `Airline` (
  `code` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Airline`
--

INSERT INTO `Airline` (`code`, `name`) VALUES
('AC', 'AirCanada'),
('AD', 'AirDiss'),
('AF', 'AirFrance'),
('FJ', 'AirPacific'),
('FL', 'AirLicc'),
('QJ', 'AirQuess'),
('RG', 'AirRigh');

-- --------------------------------------------------------

--
-- Table structure for table `Airplane`
--

CREATE TABLE `Airplane` (
  `id` varchar(10) NOT NULL,
  `owner` varchar(5) NOT NULL,
  `year` int(5) DEFAULT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Airplane`
--

INSERT INTO `Airplane` (`id`, `owner`, `year`, `Type`) VALUES
('ID1', 'AC', 1990, 'A320'),
('ID2', 'AF', 1981, 'B722'),
('ID3', 'FJ', 1988, 'E190'),
('ID4', 'AD', 1988, 'S787'),
('ID5', 'FL', 1988, 'L990'),
('ID6', 'RG', 1988, 'R655'),
('ID7', 'QJ', 1988, 'Q334');

-- --------------------------------------------------------

--
-- Table structure for table `AirplaneType`
--

CREATE TABLE `AirplaneType` (
  `name` varchar(100) NOT NULL,
  `maxSeats` int(3) DEFAULT NULL,
  `company` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AirplaneType`
--

INSERT INTO `AirplaneType` (`name`, `maxSeats`, `company`) VALUES
('A320', 100, 'Airbus'),
('B722', 150, 'McDonnell'),
('E190', 120, 'Embraer'),
('L990', 130, 'Laiebus'),
('Q334', 120, 'Quest'),
('R655', 100, 'Right'),
('S787', 150, 'Sraer');

-- --------------------------------------------------------

--
-- Table structure for table `Airport`
--

CREATE TABLE `Airport` (
  `code` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Airport`
--

INSERT INTO `Airport` (`code`, `name`, `city`, `province`) VALUES
('LK', 'LAirport', 'CityL', 'CityK'),
('PA', 'PAirport', 'CityP', 'CityA'),
('QP', 'QAirport', 'CityQ', 'CityP'),
('RT', 'RAirport', 'CityR', 'CityT'),
('WS', 'WAirport', 'CityW', 'CityS'),
('XY', 'XAirport', 'CityX', 'CityY'),
('ZA', 'ZAirport', 'CityZ', 'CityA');

-- --------------------------------------------------------

--
-- Table structure for table `DaysOffered`
--

CREATE TABLE `DaysOffered` (
  `day` int(7) NOT NULL,
  `flightCode` varchar(10) NOT NULL,
  `airlineCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DaysOffered`
--

INSERT INTO `DaysOffered` (`day`, `flightCode`, `airlineCode`) VALUES
(3, 'AC321', 'AC'),
(5, 'AD666', 'AD'),
(7, 'AF222', 'AF'),
(6, 'FJ456', 'FJ'),
(4, 'FJ666', 'FJ'),
(5, 'FL123', 'FL'),
(6, 'QJ111', 'QJ'),
(4, 'QJ555', 'QJ'),
(7, 'RG555', 'RG');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

CREATE TABLE `Flight` (
  `flightCode` varchar(10) NOT NULL,
  `airlineCode` varchar(10) NOT NULL,
  `airplane` varchar(10) NOT NULL,
  `arrivalAirport` varchar(3) NOT NULL,
  `departureAirport` varchar(3) NOT NULL,
  `arrivalScheduledTime` datetime DEFAULT NULL,
  `arrivalActualTime` datetime DEFAULT NULL,
  `departureScheduledTime` datetime DEFAULT NULL,
  `departureActualTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Flight`
--

INSERT INTO `Flight` (`flightCode`, `airlineCode`, `airplane`, `arrivalAirport`, `departureAirport`, `arrivalScheduledTime`, `arrivalActualTime`, `departureScheduledTime`, `departureActualTime`) VALUES
('AC321', 'AC', 'ID1', 'LK', 'PA', '2021-01-01 19:00:00', '2021-01-01 19:00:00', '2021-01-01 19:00:00', '2021-01-02 08:00:00'),
('AD666', 'AD', 'ID2', 'PA', 'LK', '2021-06-01 19:00:00', '2021-06-01 19:00:00', '2021-06-02 08:00:00', '2021-06-02 08:00:00'),
('AF222', 'AF', 'ID2', 'QP', 'RT', '2021-06-01 20:00:00', '2021-06-01 19:00:00', '2021-06-01 20:00:00', '2021-06-02 08:00:00'),
('FJ456', 'FJ', 'ID3', 'RT', 'QP', '2021-09-01 17:00:00', '2021-09-01 19:00:00', '2021-09-01 17:00:00', '2021-09-02 08:00:00'),
('FJ666', 'FJ', 'ID2', 'WS', 'LK', '2021-06-01 19:00:00', '2021-06-01 19:00:00', '2021-06-02 08:00:00', '2021-06-02 08:00:00'),
('FL123', 'FL', 'ID1', 'LK', 'WS', '2021-08-02 15:00:00', '2021-06-01 19:00:00', '2021-08-02 15:00:00', '2021-06-02 08:00:00'),
('QJ111', 'QJ', 'ID2', 'XY', 'ZA', '2021-07-02 19:00:00', '2021-06-01 19:00:00', '2021-07-02 19:00:00', '2021-06-02 08:00:00'),
('QJ555', 'QJ', 'ID1', 'ZA', 'XY', '2021-09-01 19:00:00', '2021-09-01 19:00:00', '2021-09-01 19:00:00', '2021-09-02 08:00:00'),
('RG555', 'RG', 'ID1', 'PA', 'QP', '2021-12-15 19:00:00', '2021-06-01 19:00:00', '2021-12-15 19:00:00', '2021-06-02 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Handles`
--

CREATE TABLE `Handles` (
  `aircraftType` varchar(100) DEFAULT NULL,
  `airportCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Handles`
--

INSERT INTO `Handles` (`aircraftType`, `airportCode`) VALUES
('A320', 'PA'),
('B722', 'ZA'),
('E190', 'XY'),
('S787', 'WS'),
('L990', 'LK'),
('R655', 'RT'),
('Q334', 'QP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Airline`
--
ALTER TABLE `Airline`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `Airplane`
--
ALTER TABLE `Airplane`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `AirplaneType`
--
ALTER TABLE `AirplaneType`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `Airport`
--
ALTER TABLE `Airport`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `DaysOffered`
--
ALTER TABLE `DaysOffered`
  ADD PRIMARY KEY (`airlineCode`,`flightCode`,`day`);

--
-- Indexes for table `Flight`
--
ALTER TABLE `Flight`
  ADD PRIMARY KEY (`airlineCode`,`flightCode`),
  ADD KEY `arrivalAirport` (`arrivalAirport`),
  ADD KEY `departureAirport` (`departureAirport`),
  ADD KEY `airplane` (`airplane`);

--
-- Indexes for table `Handles`
--
ALTER TABLE `Handles`
  ADD KEY `airportCode` (`airportCode`),
  ADD KEY `aircraftType` (`aircraftType`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Airplane`
--
ALTER TABLE `Airplane`
  ADD CONSTRAINT `Airplane_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `Airline` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `Airplane_ibfk_2` FOREIGN KEY (`Type`) REFERENCES `AirplaneType` (`name`);

--
-- Constraints for table `DaysOffered`
--
ALTER TABLE `DaysOffered`
  ADD CONSTRAINT `DaysOffered_ibfk_1` FOREIGN KEY (`airlineCode`,`flightCode`) REFERENCES `Flight` (`airlineCode`, `flightCode`) ON DELETE CASCADE;

--
-- Constraints for table `Flight`
--
ALTER TABLE `Flight`
  ADD CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`arrivalAirport`) REFERENCES `Airport` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `Flight_ibfk_2` FOREIGN KEY (`departureAirport`) REFERENCES `Airport` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `Flight_ibfk_3` FOREIGN KEY (`airplane`) REFERENCES `Airplane` (`id`),
  ADD CONSTRAINT `Flight_ibfk_4` FOREIGN KEY (`airlineCode`) REFERENCES `Airline` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `Handles`
--
ALTER TABLE `Handles`
  ADD CONSTRAINT `Handles_ibfk_1` FOREIGN KEY (`airportCode`) REFERENCES `Airport` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `Handles_ibfk_2` FOREIGN KEY (`aircraftType`) REFERENCES `AirplaneType` (`name`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
