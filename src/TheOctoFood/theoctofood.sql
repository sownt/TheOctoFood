-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 14, 2022 at 04:22 PM
-- Server version: 10.6.5-MariaDB-1:10.6.5+maria~focal
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theoctofood`
--
CREATE DATABASE IF NOT EXISTS `theoctofood` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `theoctofood`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add account', 6, 'add_account'),
(22, 'Can change account', 6, 'change_account'),
(23, 'Can delete account', 6, 'delete_account'),
(24, 'Can view account', 6, 'view_account'),
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add cart', 8, 'add_cart'),
(30, 'Can change cart', 8, 'change_cart'),
(31, 'Can delete cart', 8, 'delete_cart'),
(32, 'Can view cart', 8, 'view_cart'),
(33, 'Can add Category', 9, 'add_category'),
(34, 'Can change Category', 9, 'change_category'),
(35, 'Can delete Category', 9, 'delete_category'),
(36, 'Can view Category', 9, 'view_category'),
(37, 'Can add item', 10, 'add_item'),
(38, 'Can change item', 10, 'change_item'),
(39, 'Can delete item', 10, 'delete_item'),
(40, 'Can view item', 10, 'view_item'),
(41, 'Can add review', 11, 'add_review'),
(42, 'Can change review', 11, 'change_review'),
(43, 'Can delete review', 11, 'delete_review'),
(44, 'Can view review', 11, 'view_review'),
(45, 'Can add transaction', 12, 'add_transaction'),
(46, 'Can change transaction', 12, 'change_transaction'),
(47, 'Can delete transaction', 12, 'delete_transaction'),
(48, 'Can view transaction', 12, 'view_transaction'),
(49, 'Can add invoice', 13, 'add_invoice'),
(50, 'Can change invoice', 13, 'change_invoice'),
(51, 'Can delete invoice', 13, 'delete_invoice'),
(52, 'Can view invoice', 13, 'view_invoice'),
(53, 'Can add detail', 14, 'add_detail'),
(54, 'Can change detail', 14, 'change_detail'),
(55, 'Can delete detail', 14, 'delete_detail'),
(56, 'Can view detail', 14, 'view_detail');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-01-14 15:58:16.079262', '1', 'Mì Ý', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-01-14 15:59:23.855916', '2', 'Burger', 1, '[{\"added\": {}}]', 9, 1),
(3, '2022-01-14 15:59:51.239830', '3', 'Ăn vặt', 1, '[{\"added\": {}}]', 9, 1),
(4, '2022-01-14 16:00:41.729071', '4', 'Rau trộn', 1, '[{\"added\": {}}]', 9, 1),
(5, '2022-01-14 16:01:09.896845', '5', 'Cơm tấm', 1, '[{\"added\": {}}]', 9, 1),
(6, '2022-01-14 16:01:33.617335', '6', 'Pizza', 1, '[{\"added\": {}}]', 9, 1),
(7, '2022-01-14 16:01:48.105322', '7', 'Cháo', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-01-14 16:02:09.572087', '8', 'Bánh mì', 1, '[{\"added\": {}}]', 9, 1),
(9, '2022-01-14 16:02:26.171760', '9', 'Hủ tiếu', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-01-14 16:02:46.248837', '10', 'Trà sữa', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-01-14 16:03:08.503100', '11', 'Gà rán', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-01-14 16:03:23.865015', '12', 'Cơm', 1, '[{\"added\": {}}]', 9, 1),
(13, '2022-01-14 16:07:50.820744', '1', 'Pasta bò bằm Úc (Mì Ý / Macaroni)', 1, '[{\"added\": {}}]', 10, 1),
(14, '2022-01-14 16:09:40.509249', '2', 'Pasta truyền thống (CHƯA CÓ NHÂN)', 1, '[{\"added\": {}}]', 10, 1),
(15, '2022-01-14 16:11:17.754154', '3', 'Mì Ý sốt bò bằm xúc xích Đức', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-01-14 16:14:30.884688', '4', 'BURGER Bò Đặc Biệt 5 Tầng Kèm Sốt Teryzaki', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(14, 'orders', 'detail'),
(13, 'orders', 'invoice'),
(12, 'orders', 'transaction'),
(9, 'products', 'category'),
(10, 'products', 'item'),
(11, 'products', 'review'),
(5, 'sessions', 'session'),
(6, 'users', 'account'),
(7, 'users', 'address'),
(8, 'users', 'cart');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'users', '0001_initial', '2022-01-14 15:49:04.961201'),
(2, 'contenttypes', '0001_initial', '2022-01-14 15:49:05.010822'),
(3, 'admin', '0001_initial', '2022-01-14 15:49:05.113609'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-14 15:49:05.124450'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-14 15:49:05.135061'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-01-14 15:49:05.207661'),
(7, 'auth', '0001_initial', '2022-01-14 15:49:05.454815'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-01-14 15:49:05.505003'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-01-14 15:49:05.520008'),
(10, 'auth', '0004_alter_user_username_opts', '2022-01-14 15:49:05.538162'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-01-14 15:49:05.546949'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-01-14 15:49:05.549052'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-01-14 15:49:05.555106'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-01-14 15:49:05.561370'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-01-14 15:49:05.567510'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-01-14 15:49:05.586270'),
(17, 'auth', '0011_update_proxy_permissions', '2022-01-14 15:49:05.594616'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-01-14 15:49:05.606271'),
(19, 'users', '0002_account_date_joined_account_is_staff_and_more', '2022-01-14 15:49:05.677821'),
(20, 'users', '0003_account_is_superuser_account_username_and_more', '2022-01-14 15:49:05.802908'),
(21, 'users', '0004_address', '2022-01-14 15:49:05.870448'),
(22, 'users', '0005_address_is_default', '2022-01-14 15:49:05.918443'),
(23, 'products', '0001_initial', '2022-01-14 15:49:06.130017'),
(24, 'users', '0006_cart', '2022-01-14 15:49:06.248331'),
(25, 'users', '0007_alter_address_options', '2022-01-14 15:49:06.263863'),
(26, 'orders', '0001_initial', '2022-01-14 15:49:06.557044'),
(27, 'orders', '0002_remove_invoice_zip_code_alter_invoice_status', '2022-01-14 15:49:06.620218'),
(28, 'orders', '0003_alter_invoice_phone_number', '2022-01-14 15:49:06.708284'),
(29, 'orders', '0004_alter_invoice_tax_alter_invoice_total', '2022-01-14 15:49:06.829883'),
(30, 'sessions', '0001_initial', '2022-01-14 15:49:06.886905'),
(31, 'users', '0008_remove_address_zip_code', '2022-01-14 15:49:06.922024');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('aqzxnx5n5vhj1jd0qf55dqooh6p81xgz', '.eJxVjMEOwiAQRP-FsyGWwgY8evcbyLK7SNVAUtqT8d9tkx70OPPezFtFXJcS1y5znFhd1KBOv11CekrdAT-w3pumVpd5SnpX9EG7vjWW1_Vw_w4K9rKtPbvRAeIQvDsnwy5TQhgtbwHIBuCQiAJJFjaBjRXy3uYMKYOxJqjPF_bhOKY:1n8OrC:IVgWnnGDfo_UrljSzbNitrUFAtKHjRuXDrt4xjymV-U', '2022-01-28 15:51:14.107648');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_detail_invoice_id_df420433_fk_orders_invoice_id` (`invoice_id`),
  KEY `orders_detail_item_id_f1f45724_fk_products_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_invoice`
--

DROP TABLE IF EXISTS `orders_invoice`;
CREATE TABLE IF NOT EXISTS `orders_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_invoice_transaction_id_f0439459_fk_orders_transaction_id` (`transaction_id`),
  KEY `orders_invoice_user_id_4e63a96b_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_transaction`
--

DROP TABLE IF EXISTS `orders_transaction`;
CREATE TABLE IF NOT EXISTS `orders_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_transaction_user_id_8acdd0fb_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
CREATE TABLE IF NOT EXISTS `products_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `slug`, `description`, `image`) VALUES
(1, 'Mì Ý', 'mi-y', 'Mì Ý hay pasta là tên chung cho các loại mì hay nui được làm từ bột mì trộn với nước thành dạng bột nhào, sau đó được cán mỏng và định hình thành các dạng khác ...', 'categories/mi-y.jpeg'),
(2, 'Burger', 'burger', 'Thuật ngữ \"burger\" cũng có thể chỉ đến miếng thịt (patty) đặt trên món bánh, đặc biệt là ở Vương quốc Anh, nơi thuật ngữ \"patty\" hiếm khi được sử dụng, ...', 'categories/burger.jpg'),
(3, 'Ăn vặt', 'an-vat', '', 'categories/an-vat.jpeg'),
(4, 'Rau trộn', 'rau-tron', '', 'categories/rau-tron.jpg'),
(5, 'Cơm tấm', 'com-tam', '', 'categories/com-tam.jpeg'),
(6, 'Pizza', 'pizza', '', 'categories/pizza.jpg'),
(7, 'Cháo', 'chao', '', 'categories/chao.jpeg'),
(8, 'Bánh mì', 'banh-mi', '', 'categories/banh-mi.jpeg'),
(9, 'Hủ tiếu', 'hu-tieu', '', 'categories/hu-tieu.jpeg'),
(10, 'Trà sữa', 'tra-sua', '', 'categories/tra-sua.jpg'),
(11, 'Gà rán', 'ga-ran', '', 'categories/ga-ran.jpg'),
(12, 'Cơm', 'com', '', 'categories/com.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products_item`
--

DROP TABLE IF EXISTS `products_item`;
CREATE TABLE IF NOT EXISTS `products_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `products_item_category_id_4c94af84_fk_products_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_item`
--

INSERT INTO `products_item` (`id`, `name`, `slug`, `description`, `price`, `image`, `stock`, `is_active`, `category_id`) VALUES
(1, 'Pasta bò bằm Úc (Mì Ý / Macaroni)', 'pasta-bo-bam-uc-mi-y-macaroni', 'Pasta sốt bò bằm, có thể lựa chọn Mì Ý Spaghetti hoặc Macaroni. Không sử dụng đồ hộp chế biến sẵn, chúng tôi sử dụng nguyên liệu rau củ quả tươi sạch tạo ra sauce Mì ý đặc trưng chuẩn vị Âu và luôn tươi ngon mỗi ngày. KHÔNG sử dụng BỘT NGỌT trong sản phẩm.', 55000, 'items/pasta-bo-bam-uc-mi-y-macaroni.jpg', 15, 1, 1),
(2, 'Pasta truyền thống (CHƯA CÓ NHÂN)', 'pasta-truyen-thong-chua-co-nhan', 'Bao gồm: Sợi mì ý, sốt cà mì ý. Chưa bao gồm nhân (xúc xích, bò bằm, hải sản...) Pasta sốt cà truyền thống, có thể lựa chọn Mì Ý hay Macaroni. Không sử dụng đồ hộp chế biến sẵn.', 22000, 'items/pasta-truyen-thong-chua-co-nhan.jpeg', 10, 1, 1),
(3, 'Mì Ý sốt bò bằm xúc xích Đức', 'mi-y-sot-bo-bam-xuc-xich-duc', '', 39000, 'items/mi-y-sot-bo-bam-xuc-xich-duc.jpg', 9, 1, 1),
(4, 'BURGER Bò Đặc Biệt 5 Tầng Kèm Sốt Teryzaki', 'burger-bo-dac-biet-5-tang-kem-sot-teryzaki', 'Super Burger Chicken Teriyaki + Beef + Sausage + Egg + 2 Big Cheese', 81000, 'items/burger-bo-dac-biet-5-tang-kem-sot-teryzaki.jpg', 15, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_review`
--

DROP TABLE IF EXISTS `products_review`;
CREATE TABLE IF NOT EXISTS `products_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_review_item_id_cc10330f_fk_products_item_id` (`item_id`),
  KEY `products_review_user_id_2e53b831_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_account`
--

DROP TABLE IF EXISTS `users_account`;
CREATE TABLE IF NOT EXISTS `users_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_account_phone_number_ddac4682_uniq` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_account`
--

INSERT INTO `users_account` (`id`, `password`, `last_login`, `email`, `first_name`, `last_name`, `phone_number`, `is_active`, `date_joined`, `is_staff`, `is_superuser`, `username`) VALUES
(1, 'pbkdf2_sha256$320000$Szm3C5bFy808RcP0X1sQml$D4mYY/SiySsVmtxwr1J5EuhP2/ImJIBG4ZrI35OueP8=', '2022-01-14 15:51:14.104851', 'thonsai@outlook.com', 'Son', 'Tran Thai', '0865741801', 1, '2022-01-14 15:50:39.156976', 1, 1, 'sn');

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
CREATE TABLE IF NOT EXISTS `users_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street_address` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_address_user_id_4c106ba4_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_cart`
--

DROP TABLE IF EXISTS `users_cart`;
CREATE TABLE IF NOT EXISTS `users_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cart_item_id_c5823ab1_fk_products_item_id` (`item_id`),
  KEY `users_cart_user_id_01be2ef5_fk_users_account_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_cart`
--

INSERT INTO `users_cart` (`id`, `quantity`, `is_active`, `item_id`, `user_id`) VALUES
(1, 3, 1, 1, 1),
(2, 1, 1, 3, 1);

--
-- Constraints for dumped tables
--

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_invoice_id_df420433_fk_orders_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `orders_invoice` (`id`),
  ADD CONSTRAINT `orders_detail_item_id_f1f45724_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`);

--
-- Constraints for table `orders_invoice`
--
ALTER TABLE `orders_invoice`
  ADD CONSTRAINT `orders_invoice_transaction_id_f0439459_fk_orders_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `orders_transaction` (`id`),
  ADD CONSTRAINT `orders_invoice_user_id_4e63a96b_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `orders_transaction`
--
ALTER TABLE `orders_transaction`
  ADD CONSTRAINT `orders_transaction_user_id_8acdd0fb_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `products_item`
--
ALTER TABLE `products_item`
  ADD CONSTRAINT `products_item_category_id_4c94af84_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Constraints for table `products_review`
--
ALTER TABLE `products_review`
  ADD CONSTRAINT `products_review_item_id_cc10330f_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`),
  ADD CONSTRAINT `products_review_user_id_2e53b831_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `users_address`
--
ALTER TABLE `users_address`
  ADD CONSTRAINT `users_address_user_id_4c106ba4_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `users_cart`
--
ALTER TABLE `users_cart`
  ADD CONSTRAINT `users_cart_item_id_c5823ab1_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`),
  ADD CONSTRAINT `users_cart_user_id_01be2ef5_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
