-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 01:19 PM
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
  `description` varchar(200) DEFAULT NULL,
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
(1, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2020-01-01', 300, 1, 'NA', 1, NULL, NULL, 7, 1),
(2, 'LAPTOP001', 'HP-XYZ-007', 'HP', 123, '2020-01-01', 60000, 1, 'NA', 2, 1, 1, 7, 1),
(5, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2020-01-01', 150, 1, 'NA', 1, 4, 1, 6, 1),
(16, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2024-01-09', NULL, NULL, 'NA', NULL, NULL, NULL, NULL, NULL),
(17, 'LAPTOP001', 'HP-XYZ-007', 'HP', 123, '2024-01-09', NULL, NULL, 'NA', NULL, NULL, NULL, NULL, NULL),
(18, 'DESKTOP001', 'LG-XYZ-007', 'LG', 123, '2024-01-09', NULL, NULL, 'NA', NULL, NULL, NULL, NULL, NULL),
(19, 'CPU001', 'ACER-XYZ-007', 'ACER', 123, '2024-01-09', NULL, NULL, 'NA', NULL, NULL, NULL, NULL, NULL),
(20, 'MOUSE001', 'DELL-XYZ-007', 'DELL', 123, '2024-01-09', NULL, NULL, 'NA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_assetcategory`
--

CREATE TABLE `assetmanagementapp_assetcategory` (
  `asset_category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
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
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetmanagementapp_location`
--

CREATE TABLE `assetmanagementapp_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL
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
  `description` varchar(200) DEFAULT NULL,
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
  `name` varchar(50) NOT NULL,
  `color_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `show_on_dashboard_code` tinyint(1) NOT NULL,
  `is_default_for_status` tinyint(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL
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
  `description` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assetmanagementapp_supplier`
--

INSERT INTO `assetmanagementapp_supplier` (`supplier_id`, `name`, `description`, `email`, `mobile_no`) VALUES
(1, 'DELL Exclusive Store Pitampura', 'NA', 'des.store@gmail.com', 1234567890),
(2, 'Lenovo Exclusive Store KPNG Technologies', 'NA', 'les.store@gmail.com', 1234567890);

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
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add asset category', 7, 'add_assetcategory'),
(26, 'Can change asset category', 7, 'change_assetcategory'),
(27, 'Can delete asset category', 7, 'delete_assetcategory'),
(28, 'Can view asset category', 7, 'view_assetcategory'),
(29, 'Can add laptop', 8, 'add_laptop'),
(30, 'Can change laptop', 8, 'change_laptop'),
(31, 'Can delete laptop', 8, 'delete_laptop'),
(32, 'Can view laptop', 8, 'view_laptop'),
(33, 'Can add location', 9, 'add_location'),
(34, 'Can change location', 9, 'change_location'),
(35, 'Can delete location', 9, 'delete_location'),
(36, 'Can view location', 9, 'view_location'),
(37, 'Can add status', 10, 'add_status'),
(38, 'Can change status', 10, 'change_status'),
(39, 'Can delete status', 10, 'delete_status'),
(40, 'Can view status', 10, 'view_status'),
(41, 'Can add supplier', 11, 'add_supplier'),
(42, 'Can change supplier', 11, 'change_supplier'),
(43, 'Can delete supplier', 11, 'delete_supplier'),
(44, 'Can view supplier', 11, 'view_supplier'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add room', 13, 'add_room'),
(50, 'Can change room', 13, 'change_room'),
(51, 'Can delete room', 13, 'delete_room'),
(52, 'Can view room', 13, 'view_room'),
(53, 'Can add permission', 14, 'add_permission'),
(54, 'Can change permission', 14, 'change_permission'),
(55, 'Can delete permission', 14, 'delete_permission'),
(56, 'Can view permission', 14, 'view_permission'),
(57, 'Can add asset', 15, 'add_asset'),
(58, 'Can change asset', 15, 'change_asset'),
(59, 'Can delete asset', 15, 'delete_asset'),
(60, 'Can view asset', 15, 'view_asset');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(15, 'AssetManagementApp', 'asset'),
(7, 'AssetManagementApp', 'assetcategory'),
(8, 'AssetManagementApp', 'laptop'),
(9, 'AssetManagementApp', 'location'),
(14, 'AssetManagementApp', 'permission'),
(13, 'AssetManagementApp', 'room'),
(10, 'AssetManagementApp', 'status'),
(11, 'AssetManagementApp', 'supplier'),
(12, 'AssetManagementApp', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

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
(1, 'AssetManagementApp', '0001_initial', '2023-12-16 14:42:11.632489'),
(2, 'AssetManagementApp', '0002_alter_asset_description_alter_asset_purchase_date_and_more', '2024-01-08 17:25:58.312045'),
(3, 'contenttypes', '0001_initial', '2024-01-08 17:25:58.360625'),
(4, 'auth', '0001_initial', '2024-01-08 17:25:59.189725'),
(5, 'admin', '0001_initial', '2024-01-08 17:25:59.392593'),
(6, 'admin', '0002_logentry_remove_auto_add', '2024-01-08 17:25:59.409927'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-08 17:25:59.434684'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-01-08 17:25:59.543635'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-01-08 17:25:59.663482'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-01-08 17:25:59.692213'),
(11, 'auth', '0004_alter_user_username_opts', '2024-01-08 17:25:59.727106'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-01-08 17:25:59.848195'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-01-08 17:25:59.856492'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-01-08 17:25:59.872896'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-01-08 17:25:59.897494'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-01-08 17:25:59.926130'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-01-08 17:25:59.950399'),
(18, 'auth', '0011_update_proxy_permissions', '2024-01-08 17:25:59.974090'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-01-08 17:25:59.999340'),
(20, 'sessions', '0001_initial', '2024-01-08 17:26:00.107540');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetmanagementapp_asset`
--
ALTER TABLE `assetmanagementapp_asset`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `assetmanagementapp_assetcategory`
--
ALTER TABLE `assetmanagementapp_assetcategory`
  MODIFY `asset_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `assetmanagementapp_laptop`
--
ALTER TABLE `assetmanagementapp_laptop`
  MODIFY `laptop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetmanagementapp_location`
--
ALTER TABLE `assetmanagementapp_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `assetmanagementapp_supplier`
--
ALTER TABLE `assetmanagementapp_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assetmanagementapp_user`
--
ALTER TABLE `assetmanagementapp_user`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
