-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2021 at 02:09 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famazon_database`
--
CREATE DATABASE IF NOT EXISTS `famazon_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `famazon_database`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `f_name` varchar(25) NOT NULL,
  `l_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `f_name`, `l_name`) VALUES
(1, 'John', 'Doe'),
(2, 'Mary', 'Sutherland'),
(3, 'Leonardo', 'DiCaprio'),
(4, 'Keith', 'Richards');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `b_id` int(11) UNSIGNED NOT NULL,
  `b_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`b_id`, `b_name`) VALUES
(1, 'Nike'),
(2, 'Apple'),
(3, 'Microsoft'),
(4, 'Teufel');

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `distributor_id` int(11) UNSIGNED NOT NULL,
  `distributor_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`distributor_id`, `distributor_name`) VALUES
(1, 'DHL'),
(2, 'UPS'),
(3, 'DPD'),
(4, 'Hermes');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_amount` int(5) UNSIGNED NOT NULL,
  `payment_id` int(11) UNSIGNED NOT NULL,
  `ship_id` int(11) UNSIGNED NOT NULL,
  `oder_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `account_id`, `supplier_id`, `product_id`, `product_amount`, `payment_id`, `ship_id`, `oder_date`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2021-04-02'),
(2, 4, 3, 2, 1, 1, 2, '2020-04-09'),
(3, 3, 2, 3, 1, 5, 4, '2020-12-02'),
(4, 2, 3, 4, 2, 2, 5, '2020-06-04'),
(5, 1, 1, 4, 2, 6, 5, '2021-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `payment_data`
--

CREATE TABLE `payment_data` (
  `pay_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `IBAN` varchar(20) NOT NULL,
  `CVV` int(3) UNSIGNED NOT NULL,
  `payer_f_name` varchar(40) NOT NULL,
  `payer_l_name` varchar(40) NOT NULL,
  `processor_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_data`
--

INSERT INTO `payment_data` (`pay_id`, `account_id`, `IBAN`, `CVV`, `payer_f_name`, `payer_l_name`, `processor_id`) VALUES
(1, 1, '2131 4533 3234 4535', 422, 'John', 'Doe', 5),
(2, 4, '9958 4473 2283 2892', 567, 'Keith', 'Richards', 1),
(3, 3, '9628 6718 2683 3828', 155, 'His', 'Wife', 4),
(4, 2, '8727 1739 3894 1783', 762, 'Mary', 'Poppins', 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_processor`
--

CREATE TABLE `payment_processor` (
  `processor_id` int(11) UNSIGNED NOT NULL,
  `processor_name` varchar(25) NOT NULL,
  `processor_country` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_processor`
--

INSERT INTO `payment_processor` (`processor_id`, `processor_name`, `processor_country`) VALUES
(1, 'VISA', 'USA'),
(2, 'Erste Bank', 'Austria'),
(3, 'Bank Austria', 'Austria'),
(4, 'MasterCard', 'USA'),
(5, 'PayPal', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `payment_id` int(11) UNSIGNED NOT NULL,
  `pay_id` int(11) UNSIGNED NOT NULL,
  `payment_status` enum('Confirmed','Unconfirmed','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`payment_id`, `pay_id`, `payment_status`) VALUES
(1, 1, 'Confirmed'),
(2, 2, 'Unconfirmed'),
(3, 2, 'Cancelled'),
(4, 2, 'Confirmed'),
(5, 4, 'Confirmed'),
(6, 3, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED NOT NULL,
  `b_id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `p_name` varchar(25) NOT NULL,
  `p_category` varchar(25) NOT NULL,
  `p_price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `b_id`, `supplier_id`, `p_name`, `p_category`, `p_price`) VALUES
(1, 2, 1, 'MacBook Pro', 'Laptop', '1599.99'),
(2, 3, 3, 'Surface Pro 6', 'Tablet', '1499.99'),
(3, 1, 2, 'Airs', 'Shoes', '129.99'),
(4, 4, 1, 'Boomster 2', 'Speakers', '39.99');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_addresses`
--

CREATE TABLE `shipment_addresses` (
  `address_id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `street_name` varchar(40) NOT NULL,
  `house_no` int(11) UNSIGNED NOT NULL,
  `door_no` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipment_addresses`
--

INSERT INTO `shipment_addresses` (`address_id`, `account_id`, `street_name`, `house_no`, `door_no`) VALUES
(1, 4, 'Richards Street', 5, 7),
(2, 3, 'Penthouse Street', 9, 25),
(3, 2, 'Best Street', 19, 5),
(4, 2, 'Second Best Street', 19, 55),
(5, 1, 'London Street', 124, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shipment_details`
--

CREATE TABLE `shipment_details` (
  `ship_id` int(11) UNSIGNED NOT NULL,
  `address_id` int(11) UNSIGNED NOT NULL,
  `distributor_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipment_details`
--

INSERT INTO `shipment_details` (`ship_id`, `address_id`, `distributor_id`) VALUES
(1, 5, 1),
(2, 3, 2),
(3, 3, 4),
(4, 5, 3),
(5, 2, 3),
(6, 1, 1),
(7, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `supplier_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`) VALUES
(1, 'McShark'),
(2, 'BigClothingChain'),
(3, 'BigPCChain');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`distributor_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `ship_id` (`ship_id`);

--
-- Indexes for table `payment_data`
--
ALTER TABLE `payment_data`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `processor_id` (`processor_id`);

--
-- Indexes for table `payment_processor`
--
ALTER TABLE `payment_processor`
  ADD PRIMARY KEY (`processor_id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pay_id` (`pay_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `b_id` (`b_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  ADD PRIMARY KEY (`address_id`,`account_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `shipment_details`
--
ALTER TABLE `shipment_details`
  ADD PRIMARY KEY (`ship_id`),
  ADD KEY `distributor_id` (`distributor_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `b_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `distributor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_data`
--
ALTER TABLE `payment_data`
  MODIFY `pay_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_processor`
--
ALTER TABLE `payment_processor`
  MODIFY `processor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `payment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  MODIFY `address_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipment_details`
--
ALTER TABLE `shipment_details`
  MODIFY `ship_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payment_status` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`ship_id`) REFERENCES `shipment_details` (`ship_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_data`
--
ALTER TABLE `payment_data`
  ADD CONSTRAINT `payment_data_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_data_ibfk_2` FOREIGN KEY (`processor_id`) REFERENCES `payment_processor` (`processor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD CONSTRAINT `payment_status_ibfk_1` FOREIGN KEY (`pay_id`) REFERENCES `payment_data` (`pay_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `brands` (`b_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment_addresses`
--
ALTER TABLE `shipment_addresses`
  ADD CONSTRAINT `shipment_addresses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment_details`
--
ALTER TABLE `shipment_details`
  ADD CONSTRAINT `shipment_details_ibfk_2` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`distributor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_details_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `shipment_addresses` (`address_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
