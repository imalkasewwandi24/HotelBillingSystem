-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 03, 2026 at 07:02 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resort_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` varchar(20) NOT NULL,
  `bill_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `reservation_id`, `bill_date`, `total_amount`, `discount`, `service_charge`, `grand_total`, `payment_method`) VALUES
(1, 'RES002', '2026-02-16 08:58:29', 0.00, 5.00, 10.00, 9405.00, 'card'),
(2, 'RES003', '2026-02-16 09:06:01', 0.00, 0.00, 10.00, 14850.00, 'cash'),
(5, 'RES001', '2026-02-24 07:49:38', 0.00, 5.00, 10.00, 9405.00, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE IF NOT EXISTS `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `room_id` int NOT NULL,
  `nights` int NOT NULL,
  `room_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `bill_id`, `room_id`, `nights`, `room_price`, `total_price`) VALUES
(1, 1, 2, 2, 4500.00, 9000.00),
(2, 2, 2, 3, 4500.00, 13500.00),
(3, 3, 4, 3, 7000.00, 21000.00),
(4, 4, 6, 5, 10000.00, 50000.00),
(5, 4, 4, 1, 7000.00, 7000.00),
(6, 5, 2, 2, 4500.00, 9000.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` varchar(20) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `status` enum('CHECKED_IN','CHECKED_OUT') NOT NULL,
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `reservation_id` (`reservation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`r_id`, `reservation_id`, `guest_name`, `nic`, `address`, `contact_number`, `email`, `room_type`, `check_in_date`, `check_out_date`, `status`) VALUES
(9, 'RES004', 'Nimal Perera', '200065432109', 'Colombo 05', '0777987890', 'nimal@gmail.com', 'R005_FAMILY', '2026-02-03', '2026-02-04', 'CHECKED_OUT'),
(3, 'RES002', 'Nimal Perera', '200065432109', 'Colombo 05', '0727654321', 'nimal@gmail.com', 'R005_FAMILY', '2026-02-07', '2026-02-08', 'CHECKED_IN'),
(4, 'RES003', 'Sewmi Amanda', '201065452109', 'Kandy 07', '0777987890', 'sew24@gmail.com', 'R002_DOUBLE', '2026-02-08', '2026-02-09', 'CHECKED_OUT'),
(8, 'RES005', 'Updated Guest', '200025832109', 'Kandy 07', '0711234567', 'ishkavi2@gmail.com', 'R005_FAMILY', '2026-02-22', '2026-02-25', 'CHECKED_OUT'),
(11, 'RES006', 'Sanath Ananda', '199912345678', 'Gampaha, Sri Lanka', '0770982345', 'anda3@gmail.com', 'R003_Twin', '2026-02-23', '2026-02-25', 'CHECKED_IN');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_code` varchar(50) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `number_of_rooms` int NOT NULL,
  `max_guests` int NOT NULL,
  `room_status` enum('Available','Occupied','Maintenance') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_code`, `room_name`, `description`, `price_per_night`, `number_of_rooms`, `max_guests`, `room_status`) VALUES
(2, 'R001', 'Single', 'Single room with a bed, suitable for avelers', 4500.00, 101, 1, 'Available'),
(3, 'R002', 'Double', 'Comfortable room with one double bed for couples', 6500.00, 102, 2, 'Occupied'),
(17, 'R003', 'Twin', 'Two single beds, ensuite bathroom, free Wi-Fi, air conditioning', 12000.00, 208, 2, 'Available'),
(6, 'R004', 'Dulex', 'Spacious room with premium amenities', 6000.00, 112, 3, 'Available'),
(12, 'R005', 'Family', 'Spacious family room with one queen bed and two single beds', 18000.00, 205, 4, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usertype` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `usertype`) VALUES
(18, 'Admin1', 'e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7', 'admin1ocean@gmail.com', 0),
(20, 'Admin2', '1ee804b8ba5cca98222776ace4c63615931014f89ef0df2231771c1be0ccf7bc', 'admin2ocean@gmail.com', 0),
(19, 'Receptionist1', 'c1bbb1221a28833ca14a861c128ab7a2f39c6d9c74424319a0bf4f025ffdc23f', 'receptionist123@gmail.com', 1),
(21, 'Receptionist2', 'e1c98f86b46629caf52bc95f4f6a1674423cae40729027057f5e4cc2c5a367f4', 'reception2ocean@gamil.com', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
