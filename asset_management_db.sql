-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 07:12 PM
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
-- Database: `asset_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_asset`
--

CREATE TABLE `assetmanagementapp_asset` (
  `asset_id` int(11) NOT NULL,
  `asset_code` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` int(11) DEFAULT NULL,
  `warranty` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `asset_category_id_id` int(11) DEFAULT NULL,
  `employee_id_id` int(11) DEFAULT NULL,
  `room_id_id` int(11) DEFAULT NULL,
  `status_id_id` int(11) DEFAULT NULL,
  `supplier_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_asset`
--

INSERT INTO `assetmanagementapp_asset` (`asset_id`, `asset_code`, `model`, `company_name`, `serial_number`, `purchase_date`, `purchase_cost`, `warranty`, `description`, `asset_category_id_id`, `employee_id_id`, `room_id_id`, `status_id_id`, `supplier_id_id`) VALUES
(1, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2020-01-01', 300, 1, 'NA', 1, 1, 1, 7, 1),
(2, 'LAPTOP001', 'HP-XYZ-007', 'HP', 123, '2020-01-01', 60000, 1, 'NA', 2, 1, 1, 7, 1),
(3, 'DESKTOP001', 'LG-XYZ-007', 'LG', 123, '2020-01-01', 10000, 1, 'NA', 3, 4, 1, 7, 3),
(4, 'CPU001', 'ACER-XYZ-007', 'ACER', 123, '2020-01-01', 15000, 1, 'NA', 4, 4, 1, 7, 3),
(5, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2020-01-01', 150, 1, 'NA', 1, 4, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_assetcategory`
--

CREATE TABLE `assetmanagementapp_assetcategory` (
  `asset_category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_laptop` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_assetcategory`
--

INSERT INTO `assetmanagementapp_assetcategory` (`asset_category_id`, `category_name`, `description`, `is_laptop`) VALUES
(1, 'Mouse', '', 0),
(2, 'Laptop', '', 1),
(3, 'Desktop', '', 0),
(4, 'CPU', '', 0),
(5, 'Keyboard', '', 0),
(6, 'UPS', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_laptop`
--

CREATE TABLE `assetmanagementapp_laptop` (
  `laptop_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `wifi_mac_address` varchar(50) NOT NULL,
  `lan_mac_address` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `processor` varchar(50) NOT NULL,
  `ram` varchar(50) NOT NULL,
  `disk_type` varchar(50) NOT NULL,
  `disk_capacity` varchar(50) NOT NULL,
  `is_cisco_product` tinyint(1) NOT NULL,
  `is_cloudops_product` tinyint(1) NOT NULL,
  `is_splunk_product` tinyint(1) NOT NULL,
  `splunk_id` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_location`
--

CREATE TABLE `assetmanagementapp_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_location`
--

INSERT INTO `assetmanagementapp_location` (`location_id`, `name`, `description`) VALUES
(1, 'shahibabad, ghaziabad', ''),
(2, 'safderjung, delhi', ''),
(3, 'udyog vihar, gurugram', ''),
(4, 'sector 32, gurugram', '');

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_permission`
--

CREATE TABLE `assetmanagementapp_permission` (
  `permission_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_room`
--

CREATE TABLE `assetmanagementapp_room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_room`
--

INSERT INTO `assetmanagementapp_room` (`room_id`, `name`, `description`, `location_id_id`) VALUES
(1, 'IT Team', '', 1),
(2, 'Medicare Team', '', 1),
(3, 'Legal Team', '', 2),
(4, 'Admin Team', '', 3),
(5, 'Server Team', '', 3),
(6, 'Admin Team', '', 4),
(7, 'IT Team', '', 4),
(8, 'Management Team', '', 4),
(9, 'Marketing Team', '', 4),
(10, 'Finance Team', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_status`
--

CREATE TABLE `assetmanagementapp_status` (
  `status_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `show_on_dashboard_code` tinyint(1) NOT NULL,
  `is_default_for_status` tinyint(1) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_status`
--

INSERT INTO `assetmanagementapp_status` (`status_id`, `name`, `color_code`, `type`, `show_on_dashboard_code`, `is_default_for_status`, `description`) VALUES
(1, 'Pending', 'Yellow', 'Active', 1, 0, ''),
(2, 'Pending', 'Yellow', 'Deactive', 1, 0, ''),
(3, 'On Purchase', 'Orange', 'Active', 1, 0, ''),
(4, 'On Purchase', 'Orange', 'Deactive', 1, 0, ''),
(5, 'Not Available', 'Red', '', 1, 0, ''),
(6, 'Available', 'Green', '', 1, 0, ''),
(7, 'Asigned', 'Blue', '', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_supplier`
--

CREATE TABLE `assetmanagementapp_supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_supplier`
--

INSERT INTO `assetmanagementapp_supplier` (`supplier_id`, `name`, `description`, `email`, `mobile_no`) VALUES
(1, 'DELL Exclusive Store Pitampura', 'NA', 'des.store@gmail.com', 1234567890),
(2, 'Lenovo Exclusive Store KPNG Technologies', 'NA', 'les.store@gmail.com', 1234567890),
(3, 'LG Exclusive Store', 'NA', 'lg.store@gmail.com', 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_user`
--

CREATE TABLE `assetmanagementapp_user` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_user`
--

INSERT INTO `assetmanagementapp_user` (`employee_id`, `first_name`, `last_name`, `email`, `mobile_no`) VALUES
(1, 'Shubham', 'Saxena', 'shubham@gmail.com', 1234567890),
(2, 'Rajiv', 'Singh', 'rajiv@gmail.com', 1234567890),
(3, 'Grishma', 'Suryavanshi', 'grishma@gmail.com', 1234567890),
(4, 'Prashant', 'Singh', 'prashant@gmail.com', 1234567890),
(5, 'Vikrant', 'Tiwari', 'vikrant@gmail.com', 1234567890),
(6, 'Tajender', 'Bhardwaj', 'tajender@gmail.com', 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'AssetManagementApp', '0001_initial', '2023-12-16 14:42:11.632489');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetmanagementapp_asset`
--
ALTER TABLE `assetmanagementapp_asset`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `AssetManagementApp_a_asset_category_id_id_eb5233d8_fk_AssetMana` (`asset_category_id_id`),
  ADD KEY `AssetManagementApp_a_employee_id_id_5ebed6e3_fk_AssetMana` (`employee_id_id`),
  ADD KEY `AssetManagementApp_a_room_id_id_f2a91087_fk_AssetMana` (`room_id_id`),
  ADD KEY `AssetManagementApp_a_status_id_id_6ce0576b_fk_AssetMana` (`status_id_id`),
  ADD KEY `AssetManagementApp_a_supplier_id_id_eb639168_fk_AssetMana` (`supplier_id_id`);

--
-- Indexes for table `assetmanagementapp_assetcategory`
--
ALTER TABLE `assetmanagementapp_assetcategory`
  ADD PRIMARY KEY (`asset_category_id`);

--
-- Indexes for table `assetmanagementapp_laptop`
--
ALTER TABLE `assetmanagementapp_laptop`
  ADD PRIMARY KEY (`laptop_id`);

--
-- Indexes for table `assetmanagementapp_location`
--
ALTER TABLE `assetmanagementapp_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `assetmanagementapp_permission`
--
ALTER TABLE `assetmanagementapp_permission`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `AssetManagementApp_p_user_id_id_9502fa8b_fk_AssetMana` (`user_id_id`);

--
-- Indexes for table `assetmanagementapp_room`
--
ALTER TABLE `assetmanagementapp_room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `AssetManagementApp_r_location_id_id_40c6c64f_fk_AssetMana` (`location_id_id`);

--
-- Indexes for table `assetmanagementapp_status`
--
ALTER TABLE `assetmanagementapp_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `assetmanagementapp_supplier`
--
ALTER TABLE `assetmanagementapp_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `assetmanagementapp_user`
--
ALTER TABLE `assetmanagementapp_user`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetmanagementapp_asset`
--
ALTER TABLE `assetmanagementapp_asset`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `assetmanagementapp_assetcategory`
--
ALTER TABLE `assetmanagementapp_assetcategory`
  MODIFY `asset_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assetmanagementapp_laptop`
--
ALTER TABLE `assetmanagementapp_laptop`
  MODIFY `laptop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetmanagementapp_location`
--
ALTER TABLE `assetmanagementapp_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assetmanagementapp_permission`
--
ALTER TABLE `assetmanagementapp_permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetmanagementapp_room`
--
ALTER TABLE `assetmanagementapp_room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assetmanagementapp_status`
--
ALTER TABLE `assetmanagementapp_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `assetmanagementapp_supplier`
--
ALTER TABLE `assetmanagementapp_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assetmanagementapp_user`
--
ALTER TABLE `assetmanagementapp_user`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetmanagementapp_asset`
--
ALTER TABLE `assetmanagementapp_asset`
  ADD CONSTRAINT `AssetManagementApp_a_asset_category_id_id_eb5233d8_fk_AssetMana` FOREIGN KEY (`asset_category_id_id`) REFERENCES `assetmanagementapp_assetcategory` (`asset_category_id`),
  ADD CONSTRAINT `AssetManagementApp_a_employee_id_id_5ebed6e3_fk_AssetMana` FOREIGN KEY (`employee_id_id`) REFERENCES `assetmanagementapp_user` (`employee_id`),
  ADD CONSTRAINT `AssetManagementApp_a_room_id_id_f2a91087_fk_AssetMana` FOREIGN KEY (`room_id_id`) REFERENCES `assetmanagementapp_room` (`room_id`),
  ADD CONSTRAINT `AssetManagementApp_a_status_id_id_6ce0576b_fk_AssetMana` FOREIGN KEY (`status_id_id`) REFERENCES `assetmanagementapp_status` (`status_id`),
  ADD CONSTRAINT `AssetManagementApp_a_supplier_id_id_eb639168_fk_AssetMana` FOREIGN KEY (`supplier_id_id`) REFERENCES `assetmanagementapp_supplier` (`supplier_id`);

--
-- Constraints for table `assetmanagementapp_permission`
--
ALTER TABLE `assetmanagementapp_permission`
  ADD CONSTRAINT `AssetManagementApp_p_user_id_id_9502fa8b_fk_AssetMana` FOREIGN KEY (`user_id_id`) REFERENCES `assetmanagementapp_user` (`employee_id`);

--
-- Constraints for table `assetmanagementapp_room`
--
ALTER TABLE `assetmanagementapp_room`
  ADD CONSTRAINT `AssetManagementApp_r_location_id_id_40c6c64f_fk_AssetMana` FOREIGN KEY (`location_id_id`) REFERENCES `assetmanagementapp_location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
