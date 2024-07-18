-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 08:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electra`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`product_id`, `user_id`, `product_quantity`) VALUES
(28, 23, 5),
(19, 23, 2),
(20, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`) VALUES
(30, 'Laptop & Accessories', 'laptop.png'),
(31, 'Wearable Items', 'werableItems.jpeg'),
(32, 'Smart Phones', 'phone.png'),
(33, 'Gaming & Accessories', 'gaming.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` int(11) DEFAULT NULL,
  `order_date` varchar(20) DEFAULT NULL,
  `total_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_user_id`, `order_date`, `total_amount`) VALUES
(7, 23, '2024-05-09 08:56:05', 632110),
(8, 23, '2024-05-09 09:09:01', 1039650),
(10, 23, '2024-05-09 23:14:42', 4550),
(11, 21, '2024-05-09 23:15:22', 790100),
(12, 21, '2024-05-09 23:16:50', 1110100);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `order_product_id`, `order_quantity`, `order_status`) VALUES
(3, 7, 29, 4, 1),
(4, 8, 43, 33, 2),
(7, 10, 45, 1, 2),
(8, 11, 29, 5, 1),
(9, 12, 29, 5, 0),
(10, 12, 25, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_image` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `trending_item` int(11) DEFAULT NULL,
  `featured_item` int(11) DEFAULT NULL,
  `desc_title1` varchar(50) NOT NULL,
  `desc_title2` varchar(50) NOT NULL,
  `desc_title3` varchar(50) NOT NULL,
  `desc_title4` varchar(50) DEFAULT NULL,
  `desc_title5` varchar(50) DEFAULT NULL,
  `desc_text1` text NOT NULL,
  `desc_text2` text NOT NULL,
  `desc_text3` text NOT NULL,
  `desc_text4` text DEFAULT NULL,
  `desc_text5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_category_id`, `product_name`, `product_price`, `product_image`, `stock`, `trending_item`, `featured_item`, `desc_title1`, `desc_title2`, `desc_title3`, `desc_title4`, `desc_title5`, `desc_text1`, `desc_text2`, `desc_text3`, `desc_text4`, `desc_text5`) VALUES
(17, 30, 'HP OMEN', 176500.00, 'HP OMEN 17-INCH LAPTOP.png', 30, 0, 1, 'Brand', 'Model Name', 'Screen Size', 'Hard Disk Size', 'CPU Model', 'HP', 'Omen by HP 17-inch Laptop PC 17- cm2010nr', '17.3 inches', '16GB', 'Core i7'),
(18, 31, 'Samsung Galaxy Watch ', 39999.00, 'SAMSUNG Galaxy Watch 5 40mm Bluetooth Smartwatch.png', 42, 0, 0, 'Brand', 'Model Name', 'Screen Size', 'Color', 'Compatible Devices', 'Samsung', 'Galaxy Watch 5', '40 Millimeters', 'Gray', 'Smartphone'),
(19, 30, 'Acer Nitro 5', 103100.00, 'ACER NITRO 5.png', 30, 1, 0, 'Brand', 'Model Name', 'Color', 'Hard Disk Size', 'CPU Model', 'Acer', 'AN515-57-79TD', 'Black', '512GB', 'Core i7'),
(20, 31, 'Apple Watch Series 9', 66999.00, 'APPLE WATCH SERIES 9.png', 34, 0, 1, 'Brand', 'Model Name', 'Screen Size', 'Special Features', 'Color', 'Apple', 'Apple Watch Series 9 (GPS)', '41 Millimeters', 'Cycle Tracking, Activity Tracker, GPS, Voice Control, Heart Rate Monitor', 'Starlight Aluminum Case With Starlight Sport Loop'),
(21, 30, 'Samsung Galaxy Book3', 93100.00, 'SAMSUNG 15.6 GALAXY BOOK3 BUSINESS LAPTOP.png', 43, 0, 1, 'Brand', 'Screen Size', 'Hard Disk Size', 'CPU Model', 'Color', 'Samsung', '15.6 inches', '512GB', 'core i7', 'Silver'),
(22, 32, 'iPhone 13 pro', 150000.00, 'iphone13pro.jpg', 33, 0, 1, 'Brand', 'Operating system', 'Cellular Technology', 'Color', 'Screen size', 'Apple', 'IOS 15', '5G', 'Sierra Blue', '6.1 inches'),
(23, 33, 'Xbox Wireless Controller', 12159.00, 'Xbox Core Wireless Gaming Controller.jpg', 43, 0, 1, 'Brand', 'Model Name', 'Color', 'Connectivity Technology', NULL, 'Xbox', 'Xbox Core', 'Carbon black', 'Wireless', NULL),
(24, 33, 'HyperX Pulsefire Haste', 13000.00, 'HyperX Pulsefire Haste.jpg', 23, 0, 0, 'Brand', 'Movement Detection Technology', 'Special Features', 'Color', 'Connectivity Technology', 'HyperX', 'Optical', 'Wireless, Lightweight, Water Resistant', 'Black', 'USB'),
(25, 30, 'Apple 2022 MacBook ', 160000.00, 'APPLE 2022 MACBOOK AIR LAPTOP.webp', 33, 1, 0, 'Brand', 'Model Name', 'Screen Size', 'Hard Disk Size', 'Operating System', 'Apple', 'Macbook Air', '13.6 Inches', '256GB', 'Mac OS '),
(26, 32, 'iPhone 15 pro max', 215000.00, 'iphone 15 pro max.jpg', 22, 1, 0, 'Brand', 'Model Name', 'Cellular Technology', 'Color', 'Screen size', 'Apple', 'Iphone 15 pro max', '5G', 'Natural Titanium', '6.7 inches'),
(27, 33, 'Logitech G213', 8500.00, 'Logitech G213 Prodigy.jpg', 31, 0, 0, 'Brand', 'Special Feature', 'Connectivity Technology', 'Color', 'Compatible Devices', 'Logitech G', 'Lighting', 'Wired, USB', 'Black', 'PC'),
(28, 31, 'Apple Watch SE', 44500.00, 'APPLE WATCH SE 2nd Gen.png', 17, 0, 0, 'Brand', 'Screen Size', 'Model Name', 'Color', 'Special Features', 'Apple', '40Millimeters', 'Apple Watch SE (2nd Gen, GPS)', 'Midnight Aluminum Case With Midnight Sport Loop', 'Cycle Tracking, GPS, Voice Controller'),
(29, 30, 'Apple 2024 MacBook ', 157990.00, 'APPLE 2024 MACBOOK AIR 15-INCH LAPTOP.png', 14, 1, 0, 'Brand', 'Model Name', 'Screen Size', 'Hard Disk Size', 'Color', 'Apple', 'Macbook Air', '15.3 inches', '256GB', 'Starlight'),
(30, 32, 'Redmi Note 11 Pro', 36999.00, 'Redmi note 11 pro.jpg', 32, 0, 0, 'Brand', 'Model Name', 'Cellular Technology', 'Color', 'SIM Card Slot', 'Xiaomi', 'Note 11 Pro', '5G', 'Space Grey', 'Dual Sim'),
(32, 33, 'Logitech G305', 12149.00, 'Logitech_G305-removebg-preview.png', 29, 0, 0, 'Brand', 'Special Features', 'Movement Detection Technology', 'Connectivity Technology', 'Color', 'Logitech G', 'Wireless, Lightweight, Portable', 'Optical', 'Bluetooth', 'Black'),
(33, 30, 'MSI Thin Gaming Laptop', 79500.00, 'MSI NEWEST GF63 THIN GAMING LAPTOP.png', 31, 0, 0, 'Brand', 'Model Name', 'Screen Size', 'Color', 'CPU Model', 'MSI', 'MSI GF63', '15.6 inches', 'Aluminum Black', 'Core i5'),
(34, 32, 'Samsung 23 Ultra', 191999.00, 'Samsung S23 Ultra.jpg', 22, 1, 0, 'Brand', 'Model Name', 'Cellular Technology', 'Memory Storage Capactiy', 'Screen size', 'Samsung', 'Galaxy S23 Ultra', '5G', '256GB', '6.8 Inches'),
(35, 33, 'Xbox Elite Series 2', 45473.00, 'Xbox Elite Series 2 Wireless Gaming Controller.jpg', 33, 0, 0, 'Brand', 'Model Name', 'Color', 'Connectivity Technology', NULL, 'Xbox', 'XboxElite', 'Blue Black', 'Wireless', NULL),
(36, 33, 'Logitech G335', 10500.00, 'Logitech G335.jpg', 33, 0, 0, 'Brand', 'Model Name', 'Color', 'Form Factor', 'Connectivity ', 'Logitech G', 'G335', 'Black', 'Over Ear', 'Wireless'),
(37, 32, 'Samsung 21 Ultra', 155000.00, 'Samsung S 21 Ultra.jpg', 28, 0, 1, 'Brand', 'Model Name', 'Color', 'Screen Size', 'Memory Storage Capacity', 'Samsung', 'Galaxy S21 Ultra 5G', 'Black', '6.8 Inches', '256GB'),
(38, 30, 'Apple MacBook 2023 ', 245000.00, 'APPLE 2023 MACBOOK PRO LAPTOP.jpg', 44, 1, 0, 'Brand', 'Model Name', 'Screen Size', 'Color', 'Hard Disk Size', 'Apple', 'Macbook Pro', '14.2 Inches', 'Space Grey', '1TB'),
(39, 33, 'Razer DeathAdder', 18500.00, 'Razer DeathAdder.jpg', 33, 0, 1, 'Brand', 'Color', 'Connectivity Technology', 'Special Features', 'Movement Detection Technology', 'Razer', 'Classic Black', 'Wired', 'Optical Sensor, Durable, Lightweight', 'Optical'),
(40, 30, 'Dell Inspiron 15', 62200.00, 'DELL 2023 NEWEST INSPIRON 15 3525 LAPTOP.png', 31, 0, 0, 'Brand', 'Model Name', 'Hard Disk Size', 'CPU Model', 'Operating System', 'Dell', 'Dell Inspiron 15 3525 Laptop', '1 TB', 'Ryzen 5', 'Windows 11 Home'),
(41, 31, 'Apple Watch Ultra 2', 106571.00, 'APPLE WATCH ULTRA 2.png', 30, 1, 0, 'Brand', 'Model Name', 'Screen Size', 'Color', 'Style', 'Apple', 'Apple Watch Ultra 2 (GPS + Cellular)', '49 Millimeters', 'Titanium Case With Indigo Alpine Loop', 'Hybrid'),
(42, 31, 'Samsung Galaxy Watch 4', 26840.00, 'SAMSUNG GALAXY WATCH 4 Classic 42mm SMARTWATCH.png', 34, 0, 0, 'Brand ', 'Model Name', 'Color', 'Screen Size', 'Style', 'Samsung', 'Galaxy', 'Silver', '44 Millimeters', 'LTE'),
(43, 31, 'Apple Airpods (3rd Gen)', 31500.00, 'APPLE AIRPODS (3rd Generation) WIRELESS EAR BUDS.png', 50, 1, 0, 'Brand ', 'Model Name', 'Color', 'Form Factor', 'Connectivity Technology', 'Apple', 'Airpods', 'White', 'In Ear', 'Bluetooth '),
(45, 31, 'Smart Band 4', 4400.00, 'smartBand4.png', 39, 0, 0, 'Brand ', 'Model Name', 'Display', 'Special Features', NULL, 'MI', 'MI Smart Band 4', 'Full Touch, Amoled', 'Adjustable brightness, color', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(500) NOT NULL,
  `username` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `phone_number`, `password`, `username`, `email`, `user_type`) VALUES
(18, 'Nilak Pathak', '9826102785', '448cd19d332c02226f003f7b901ccd3d', 'nilak14', 'nilakpathak14@gmail.com', 1),
(21, 'Nischal Pathak', '9804117832', '448cd19d332c02226f003f7b901ccd3d', 'nischal22', 'nischalpathak14@gmail.com', 0),
(23, 'Utsab Devkota', '9806561880', 'f04c21e5787b0465f4086e0631cf413e', 'TheUtsab', 'info.utsab10@gmail.com', 0),
(24, 'Biswas Lohani', '9814785236', 'eda3ed22eefdd98e3119c3ba246d4c25', 'BiswasBK6', 'biswaslohani4@gmail.com', 0),
(26, 'Utsab', '9823145205', '448cd19d332c02226f003f7b901ccd3d', 'utsab10', 'utsabmessi6@gmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  ADD KEY `cart_ibfk_1` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_ibfk_1` (`order_user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_details_ibfk_1` (`order_id`),
  ADD KEY `order_details_ibfk_2` (`order_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_ibfk_1` (`product_category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
