-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 10:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `price` float NOT NULL,
  `price_per_day` float NOT NULL,
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_img`, `price`, `price_per_day`, `car_availability`) VALUES
(21, 'Alto', 'DL V3 5521', 'assets/img/cars/alto-800.png', 50, 500, 'yes'),
(22, 'Amaze', 'DL V3 5522', 'assets/img/cars/amaze.png', 60, 550, 'yes'),
(23, 'Bolero', 'DL V3 5525', 'assets/img/cars/bolero.jpg', 100, 1000, 'yes'),
(24, 'Dzire', 'DL V3 5528', 'assets/img/cars/dzire.png', 90, 600, 'yes'),
(25, 'Fortuner', 'DL V3 8956', 'assets/img/cars/fortuner.png', 150, 1500, 'yes'),
(26, 'Innova', 'DL V3 5632', 'assets/img/cars/innova.png', 100, 800, 'yes'),
(27, 'Nexon', 'DL V3 9654', 'assets/img/cars/nexon.jpg', 120, 1200, 'yes'),
(28, 'Scorpio', 'DL V3 3215', 'assets/img/cars/scorpio.jpg', 150, 1500, 'yes'),
(29, 'XUV', 'DL V3 9632', 'assets/img/cars/Mahindra.jpg', 100, 800, 'yes'),
(30, 'Ertiga', 'DL V3 9633', 'assets/img/cars/ertiga.jpg', 100, 1000, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

CREATE TABLE `clientcars` (
  `car_id` int(20) NOT NULL,
  `emp_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clientcars`
--

INSERT INTO `clientcars` (`car_id`, `emp_username`) VALUES
(28, 'ash'),
(29, 'ash'),
(30, 'ash'),
(21, 'laku'),
(22, 'laku'),
(23, 'laku'),
(24, 'laku'),
(25, 'shubu'),
(26, 'shubu'),
(27, 'shubu');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('abhi', 'Abhishek', '9632564125', 'abhi@gmail.com', 'Dwarka', '2345'),
('anki', 'Anikita', '8745632566', 'ankita@gmail.com', 'Saket', '5648'),
('anshu', 'anshul', '8855446625', 'anshul@gmail.com', 'Janakpuri', '5649'),
('archi', 'Archita', '9633669985', 'archi@gmail.com', 'NehruPlace', '9874'),
('javu', 'javed', '8554466255', 'javed@gmail.com', 'Rajouri', '5544'),
('kusha', 'Kusha', '9687451256', 'kusha@gmail.com', 'SubhashNagar', '1234'),
('ritu', 'ritvik', '8544665521', 'ritvik@gmail.com', 'Dwarka', '5564');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(10) NOT NULL,
  `driver_phone` varchar(10) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `emp_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `emp_username`, `driver_availability`) VALUES
(100, 'Kavya', 'DL547234', '9655448852', 'Dwarka', 'laku', 'yes'),
(101, 'Piyush', 'DL569856', '7456215215', 'Shadra', 'laku', 'yes'),
(102, 'Deepu', 'DL534198', '8459654125', 'Dwarka', 'shubu', 'yes'),
(103, 'Yash', 'DL567456', '7485965412', 'Vaishali', 'shubu', 'yes'),
(104, 'Nischay', 'DL587496', '9845663258', 'Saket', 'ash', 'yes'),
(105, 'Lakshay', 'DL582314', '9745632158', 'Dwarka', 'ash', 'yes'),
(106, 'Harjot', 'DL854789', '8456325964', 'Janakpuri', 'rahu', 'yes'),
(107, 'Rishabh', 'DL564789', '9845632584', 'Nawada', 'anni', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_username` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_email` varchar(25) NOT NULL,
  `emp_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `emp_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_username`, `emp_name`, `emp_phone`, `emp_email`, `emp_address`, `emp_password`) VALUES
('adii', 'Aditi', '9655663325', 'aditi@gmail.com', 'Nawada', '0001'),
('anni', 'Anirudh', '9658745623', 'anni@gmail.com', 'Noida', '5689'),
('ash', 'Ayush', '9655477856', 'ayush@gamil.com', 'Saket', '4567'),
('laku', 'Laksh', '9658745125', 'laksh@gmail.com', 'Janakpuri', '6967'),
('rahu', 'Rahul', '9655663322', 'rahul@gmail.com', 'Shadra', '7890'),
('ron', 'Rohan', '8745695512', 'rohan@gmail.com', 'Dwarka', '8520'),
('shubu', 'Shubham', '7485965458', 'shubham@gmail.com', 'Palam', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `customer_username`, `car_id`, `driver_id`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`) VALUES
(574681281, 'kusha', 23, 100, '2023-11-05', '2023-11-06', '2023-11-05', 100, 'km', 10, 1, 1000, 'R'),
(574681282, 'kusha', 21, 101, '2023-11-05', '2023-11-07', '2023-11-05', 500, 'days', NULL, 2, 1000, 'R'),
(574681283, 'kusha', 28, 104, '2023-11-05', '2023-11-08', '2023-11-05', 150, 'km', 60, 3, 9000, 'R'),
(574681284, 'abhi', 23, 100, '2023-11-05', '2023-11-06', '2023-11-05', 100, 'km', 5, 1, 500, 'R'),
(574681285, 'anki', 24, 101, '2023-11-05', '2023-11-07', '2023-11-05', 90, 'km', 10, 2, 900, 'R'),
(574681286, 'anki', 29, 105, '2023-11-06', '2023-11-07', '2023-11-05', 800, 'days', NULL, 1, 800, 'R'),
(574681287, 'kusha', 23, 101, '2023-11-06', '2023-11-07', '2023-11-05', 100, 'km', 5, 1, 500, 'R');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

--
-- Indexes for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `client_username` (`emp_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `dl_number` (`dl_number`),
  ADD KEY `client_username` (`emp_username`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_username`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681288;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD CONSTRAINT `clientcars_ibfk_1` FOREIGN KEY (`emp_username`) REFERENCES `employee` (`emp_username`),
  ADD CONSTRAINT `clientcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`emp_username`) REFERENCES `employee` (`emp_username`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
