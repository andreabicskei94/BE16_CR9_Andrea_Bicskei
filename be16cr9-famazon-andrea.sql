-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 01:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr9_famazon_andreabicskei`
--
CREATE DATABASE IF NOT EXISTS `be16_cr9_famazon_andreabicskei` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be16_cr9_famazon_andreabicskei`;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `ID` int(10) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `fk_payment_option` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`ID`, `bank_name`, `fk_payment_option`) VALUES
(1, 'Bawag Bank', 0),
(2, 'Erste Bank', 0),
(3, 'Raiffeissen', 0),
(4, 'Barclays', 0),
(5, 'O-Bank', 0);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `ID` int(10) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `company_email` varchar(30) NOT NULL,
  `company_telephone` int(20) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`ID`, `company_name`, `company_email`, `company_telephone`, `fk_location_id`, `fk_bank_id`) VALUES
(1, 'HelloCompany', 'helocompi@gmail.com', 64742255, 1, 2),
(2, 'ShoopingCompi', 'shoopi@gmail.com', 5623444, 5, 3),
(3, 'ElenAllien', 'ali@hotmail.com', 659332, 2, 5),
(4, 'HappyPeople', 'pipll@yahoo.com', 6389214, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fk_ordering_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_transaction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `last_name`, `first_name`, `email`, `password`, `fk_ordering_id`, `fk_location_id`, `fk_transaction_id`) VALUES
(1, 'Guufy', 'Bob', 'bob@gmail.com', '122503', 1, 4, 3),
(2, 'Marta', 'More', 'more@hotmail.com', '25336', 1, 4, 4),
(3, 'Silvia', 'Cooper', 'sili@gmail.com', '55632', 3, 1, 5),
(4, 'Editha', 'Schmidt', 'editha@hotmail.com', '55362', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `famazon_table`
--

CREATE TABLE `famazon_table` (
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_company_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `famazon_table`
--

INSERT INTO `famazon_table` (`fk_customer_id`, `fk_company_id`, `fk_product_id`) VALUES
(2, 3, 5),
(2, 3, 5),
(4, 4, 2),
(4, 4, 2),
(2, 1, 4),
(2, 1, 4),
(1, 2, 3),
(1, 2, 3),
(4, 1, 6),
(4, 1, 6),
(3, 3, 1),
(3, 3, 1),
(1, 2, 8),
(1, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID` int(10) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID`, `adress`, `zip`, `city`) VALUES
(1, 'Bloch Bauer Promenade 1/2/51', 1100, 'Vienna'),
(2, 'Praterstrasse', 25630, 'Innsbruck'),
(3, 'Lost Street 23b/52', 3560, 'New York'),
(4, 'Black street 35/56c', 7592, 'London'),
(5, 'White Street', 5236, 'Barcelona');

-- --------------------------------------------------------

--
-- Table structure for table `ordering`
--

CREATE TABLE `ordering` (
  `ID` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `ship_date` date NOT NULL,
  `deliver_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `priceSum` int(11) NOT NULL,
  `fk_ship_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordering`
--

INSERT INTO `ordering` (`ID`, `order_date`, `ship_date`, `deliver_date`, `quantity`, `priceSum`, `fk_ship_id`) VALUES
(1, '2022-02-15', '2022-02-16', '2022-02-20', 3, 15, 2),
(2, '2022-05-06', '2022-05-15', '2022-05-20', 2, 23, 1),
(3, '2022-06-30', '2022-07-07', '2022-07-15', 3, 20, 3),
(4, '2022-08-07', '2022-08-15', '2022-08-20', 1, 25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment_option`
--

CREATE TABLE `payment_option` (
  `ID` int(11) NOT NULL,
  `card_number` int(11) NOT NULL,
  `bic` varchar(20) NOT NULL,
  `expire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_option`
--

INSERT INTO `payment_option` (`ID`, `card_number`, `bic`, `expire`) VALUES
(1, 123369523, 'BAWAAATW', '2025-05-12'),
(2, 123356933, '1523GG', '2026-09-15'),
(3, 1253369875, '15200LDD', '2030-02-18'),
(4, 25966311, 'MH52633', '2027-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `fk_product_set_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `name`, `description`, `photo`, `price`, `fk_product_set_id`) VALUES
(1, 'Harry Potter - The Whole Set', 'Fantasy', '', 15, 1),
(2, 'Raf Camora - Der Pakt', 'Biography', '', 22, 1),
(3, 'Towel - set', 'In every color', '', 25, 3),
(4, 'Gucci ', 'Bag', '', 300, 4),
(5, 'Tom Ford Noir', 'Parfüm', '', 150, 8),
(6, 'Balcony set', '4 chairs, 1 table', '', 230, 7),
(7, '4 pairs of T-shirt', 'T-shirt set ', '', 15, 6),
(8, 'Denim Jeans', 'Jeans', '', 120, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_set`
--

CREATE TABLE `product_set` (
  `ID` int(10) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_set`
--

INSERT INTO `product_set` (`ID`, `name`) VALUES
(1, 'Book'),
(2, 'Kitchen'),
(3, 'Bathroom'),
(4, 'Women'),
(5, 'Men'),
(6, 'Kids'),
(7, 'Garden'),
(8, 'Beauty');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `ID` int(10) NOT NULL,
  `start_location` varchar(30) NOT NULL,
  `end_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`ID`, `start_location`, `end_location`) VALUES
(1, 'Vienna', 'New York'),
(2, 'New York', 'Barcelona'),
(3, 'London', 'Barcelona'),
(4, 'Bratislava', 'Madrid');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `ID` int(10) NOT NULL,
  `trasaction_date` date NOT NULL,
  `approvement` tinyint(4) DEFAULT NULL,
  `fk_bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`ID`, `trasaction_date`, `approvement`, `fk_bank_id`) VALUES
(1, '2022-05-15', 1, 2),
(2, '2022-05-15', 1, 2),
(3, '2022-09-13', 0, 4),
(4, '2022-09-13', 0, 4),
(5, '2022-03-15', 1, 4),
(6, '2022-05-15', 0, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_payment_option` (`fk_payment_option`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_bank_id` (`fk_bank_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_ordering_id` (`fk_ordering_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_transaction_id` (`fk_transaction_id`);

--
-- Indexes for table `famazon_table`
--
ALTER TABLE `famazon_table`
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_ship_id` (`fk_ship_id`);

--
-- Indexes for table `payment_option`
--
ALTER TABLE `payment_option`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_product_set_id` (`fk_product_set_id`);

--
-- Indexes for table `product_set`
--
ALTER TABLE `product_set`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_bank_id` (`fk_bank_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ordering`
--
ALTER TABLE `ordering`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_option`
--
ALTER TABLE `payment_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_set`
--
ALTER TABLE `product_set`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`fk_payment_option`) REFERENCES `payment_option` (`ID`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`ID`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_bank_id`) REFERENCES `bank` (`ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_ordering_id`) REFERENCES `ordering` (`ID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`ID`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_transaction_id`) REFERENCES `transaction` (`ID`);

--
-- Constraints for table `famazon_table`
--
ALTER TABLE `famazon_table`
  ADD CONSTRAINT `famazon_table_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `famazon_table_ibfk_2` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`ID`),
  ADD CONSTRAINT `famazon_table_ibfk_3` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`ID`);

--
-- Constraints for table `ordering`
--
ALTER TABLE `ordering`
  ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`fk_ship_id`) REFERENCES `shipping` (`ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_product_set_id`) REFERENCES `product_set` (`ID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`fk_bank_id`) REFERENCES `bank` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
