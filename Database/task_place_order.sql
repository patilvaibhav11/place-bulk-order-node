-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2022 at 08:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_place_order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_order_details_master`
--

CREATE TABLE `tb_order_details_master` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_rate` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_final_amount` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_order_details_master`
--

INSERT INTO `tb_order_details_master` (`order_detail_id`, `order_id`, `product_id`, `product_rate`, `product_quantity`, `product_final_amount`, `date_time`) VALUES
(1, 1, 1, 20, 1, 20, '2022-09-10 17:31:02'),
(2, 1, 2, 30, 3, 90, '2022-09-10 17:31:02'),
(3, 1, 3, 20, 5, 100, '2022-09-10 17:31:02'),
(4, 1, 4, 20, 1, 20, '2022-09-10 17:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order_master`
--

CREATE TABLE `tb_order_master` (
  `order_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_order_master`
--

INSERT INTO `tb_order_master` (`order_id`, `user_name`, `contact_no`, `city`) VALUES
(1, 'Vaibhav', '9096010022', 'Nashik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_order_details_master`
--
ALTER TABLE `tb_order_details_master`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `tb_order_master`
--
ALTER TABLE `tb_order_master`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_order_details_master`
--
ALTER TABLE `tb_order_details_master`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_order_master`
--
ALTER TABLE `tb_order_master`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
