-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2022 at 02:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Minhest Sneaker', 'lorem-ipsum-is', 'http://localhost/storage/photos/1/Banner/banner-01.png', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">The World Of Sneakers</span></h2>', 'active', '2020-08-14 01:47:38', '2022-06-20 20:47:25'),
(2, 'Minhest Sneakers', 'lorem-ipsum', 'http://localhost/storage/photos/1/Banner/banner-02.png', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Tận tình - Uy tín - Chất lượng</span></h2>', 'active', '2020-08-14 01:50:23', '2022-06-20 20:59:14'),
(4, 'Chào mừng đến với', 'banner', 'http://localhost/storage/photos/1/Banner/banner-03.png', '<h2><span style=\"font-weight: bold; color: rgb(255, 255, 255);\">Minhest Sneakers</span></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2022-06-20 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(7, 'Jordan', 'jordan', 'active', '2022-06-20 21:02:03', '2022-06-20 21:02:03'),
(8, 'MLB', 'mlb', 'active', '2022-06-20 21:02:07', '2022-06-20 21:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(13, 24, 6, 30, '640000.00', 'new', 1, 640000.00, '2022-07-03 01:13:42', '2022-07-03 01:21:31'),
(14, 21, 6, 30, '510600.00', 'new', 1, 510600.00, '2022-07-03 01:13:57', '2022-07-03 01:21:31'),
(15, 25, 7, 31, '568800', 'new', 1, 568800.00, '2022-07-04 12:24:56', '2022-07-04 12:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nike', 'mens-fashion', NULL, 'http://localhost/storage/photos/1/Category/mini-banner4.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2022-06-20 20:33:31'),
(2, 'Jordan', 'womens-fashion', NULL, 'http://localhost/storage/photos/1/Category/mini-banner5.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2022-06-20 20:34:15'),
(3, 'MLB', 'kids', NULL, 'http://localhost/storage/photos/1/Category/mini-banner6.png', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2022-06-20 20:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'MINHEST SNEAKERS', 'percent', '50.00', 'active', '2022-07-02 13:22:36', '2022-07-02 13:22:36'),
(7, 'DEVNGUYEN123', 'fixed', '50000.00', 'active', '2022-07-02 13:22:59', '2022-07-02 13:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(6, 'Ngô Nguyễn Khắc Minh', 'Kiểm tra chức năng', 'minhanh.nvd@gmail.com', NULL, '0983103187', 'Chức năng tốt, test đã hoàn thiện.', '2022-07-03 01:28:02', '2022-07-03 01:27:03', '2022-07-03 01:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('7bd7c6c2-5454-4a36-b770-bcbf2104e63a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-07-03 01:21:31', '2022-07-03 01:21:31'),
('87b1414a-ee3d-4316-97c9-d8bd0abf4a5a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-07-04 12:25:37', '2022-07-04 12:25:37'),
('b7e9a8d6-f4b6-4723-84f2-02a166a4aa1e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/dunk-low-paisley\",\"fas\":\"fa-star\"}', NULL, '2022-07-04 12:37:44', '2022-07-04 12:37:44'),
('c886efcf-3148-4f73-a859-06af64069a18', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/custom-la-gi-5-buoc-custom-giay-sneaker-tai-nha-don-gian-nhat\",\"fas\":\"fas fa-comment\"}', NULL, '2022-07-04 12:42:00', '2022-07-04 12:42:00'),
('d5f35d31-1e5f-417f-b5b8-8e200354468d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"S\\u1ea3n ph\\u1ea9m m\\u1edbi \\u0111\\u01b0\\u1ee3c \\u0111\\u00e1nh gi\\u00e1!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/air-max-ivo\",\"fas\":\"fa-star\"}', NULL, '2022-07-07 12:32:19', '2022-07-07 12:32:19'),
('ee80fc45-5c5e-4121-aed9-603c58c153ee', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"S\\u1ea3n ph\\u1ea9m m\\u1edbi \\u0111\\u01b0\\u1ee3c \\u0111\\u00e1nh gi\\u00e1!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/air-force-1\",\"fas\":\"fa-star\"}', '2022-07-07 12:32:44', '2022-07-07 12:31:48', '2022-07-07 12:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(6, 'ORD-XCWDGODODF', 30, '1150600', 9, NULL, '1174600', 2, 'cod', 'unpaid', 'new', 'Ngô Nguyễn Khắc', 'Minh', 'minhanh.nvd@gmail.com', '0983103187', 'VN', '10000', 'Hà Nội', 'Hà Nội', '2022-07-03 01:21:30', '2022-07-03 01:21:30'),
(7, 'ORD-7RCVNWSRTZ', 31, '568800', 8, NULL, '601800', 1, 'cod', 'unpaid', 'process', 'Dev', 'Nguyen', 'ngonguyenkminh@gmail.com', '0123456789', 'VN', '10000', 'Hà Nội', 'Hà Nội', '2022-07-04 12:25:37', '2022-07-04 12:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Ưu đãi đặc biệt mừng khai trương Converse Aeon Bình Tân', 'uu-dai-dac-biet-mung-khai-truong-converse-aeon-mall-binh-tan', '<h2 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 26px; font-size: 16px; font-family: arial; color: rgb(51, 51, 51);\"><br></h2>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Converse Aeon Mall Bình Tân là cửa hàng chính hãng thứ 11 đánh dấu cột mốc phát triển của thương hiệu Converse tại Việt Nam. Tọa lạc tại một trong những trung tâm mua sắm lớn nhất TP.HCM, Converse Aeon Mall Bình Tân (Tầng 1-F26, TTTM Aeon Mall Bình Tân, đường số 17A, Bình Trị Đông B, Bình Tân) sở hữu không gian rộng lớn lên đến 61m2.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Khi đến với Converse Aeon Mall Bình Tân, các tín đồ Converse dễ dàng nhận thấy sự đồng nhất trong phong cách thiết kế, đặc trưng trong cách bài trí cửa hàng của Converse. Khách hàng &nbsp;dễ dàng tìm được cho mình những dòng sản phẩm nổi tiếng như Chuck 70, Run Star Hike, Converse Renew, Converse CX,..&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Bên cạnh đó, các sản phẩm khác như áo thun, balo, nón cũng được trưng bày đa dạng, đa mẫu mã giúp khách hàng dễ dàng mua sắm và chọn cho mình “item\" ưng ý nhất.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Đại diện MAP Active chia sẻ: “Converse đang tiếp tục đẩy mạnh độ phủ của thương hiệu và mở rộng thật nhiều cửa hàng trên toàn quốc nhằm đem đến các trải nghiệm mua sắm thuận tiện và tuyệt vời dành cho giới trẻ đam mê thời trang đường phố tại Việt Nam”.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Fanpage Converse Việt Nam: https://www.facebook.com/converse.vietnam/&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(68, 68, 68); line-height: 26px; font-family: Arial; text-align: justify;\">Instagram chính thức: https://www.instagram.com/converse.vn/</p>', '<h2 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 600; line-height: 26px; font-size: 16px; font-family: arial; color: rgb(51, 51, 51);\">Nhân dịp khai trương, cửa hàng Converse Aeon Mall Bình Tân mang đến ưu đãi giảm ngay 25% khi mua 2 sản phẩm bất kỳ. Chương trình kéo dài từ ngày 30/4 - 3/5, áp dụng cho mọi dòng sản phẩm nguyên giá được bày bán tại cửa hàng.</h2>', 'http://localhost/storage/photos/1/Blog/11.jpg', '2022,Sneakers,Fashion', 5, NULL, 1, 'active', '2022-06-24 16:28:15', '2022-07-02 13:21:07'),
(8, 'Top 6 Cửa Hàng Custom Giày Hà Nội Theo Yêu Cầu Tốt Nhất 2022', 'top-6-cua-hang-custom-giay-ha-noi-theo-yeu-cau-tot-nhat-2022', '<p><br></p>', '<h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"dubo-shop\">Cửa hàng Dubo</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Hoạt động từ năm 2010, với nhiều năm kinh nghiệm cửa hàng đã tạo được niềm tin với nhiều khách hàng. với hơn hàng nghìn mẫu giày được đặt làm riêng và thiết kế theo nhiều mẫu khác nhau từ chất liệu riêng tạo nên những đôi giày vô cùng độc đáo.</p><figure id=\"attachment_15905\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 355px;\"><img class=\"size-medium wp-image-15905 b-loaded\" alt=\"custom-made-for-noi\" width=\"365\" height=\"260\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.jpg\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">Cửa hàng Dubo</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Nhờ tâm huyết và niềm đam mê với giày mà shop đã phát triển cho đến ngày nay. Sở hữu đội ngũ nhân viên tay nghề cao, tận tâm sẽ khiến khách hàng hài lòng và tin tưởng lựa chọn đơn vị.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Làm sạch giày và túi xách chuyên nghiệp</li><li>Sản xuất và bán lẻ các sản phẩm tẩy rửa, vệ sinh giày</li><li>Phục hồi giày</li><li>Lớp phủ chống nước</li><li>Giày tùy chỉnh</li><li>Sơn lại màu giày</li><li>Giày nhuộm</li><li>…</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Các sản phẩm:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Dây giày</li><li>Áo mưa cho giày</li><li>Lót giày</li><li>Hộp đựng giày, túi đựng giày</li><li>Đế giày</li><li>Đế giữ giày</li><li>Viên khử mùi giày dép</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Địa chỉ: Số 1, ngõ 143 Đông Các, Q. Đống Đa, TP. Hà nội</li><li>Chi nhánh: 1 chi nhánh tại TP.</li><li>Fanpage: https://www.facebook.com/DuBoShop/</li><li>E-mail: [email&nbsp;protected]</li><li>Instagram: https://www.instagram.com/dubo.shop/</li><li>Trang web: http://duboshop.vn/</li></ul><h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"morino-shop\">Cửa hàng Morino</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Khởi đầu từ một đội ngũ không quá nhiều người vào năm 2015, đến nay đội ngũ đã phát triển mạnh mẽ, hiểu được nhu cầu của khách hàng trong việc tạo ra những đôi giày tùy chỉnh chất lượng cho người dùng. Morino đã thực sự chinh phục và tạo được lòng tin của người dùng, một số nghệ nhân nổi tiếng cũng đã ghé thăm shop như: Mr. Ah, Canaries chipi,….</p><figure id=\"attachment_15906\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 355px;\"><img class=\"size-medium wp-image-15906 b-loaded\" alt=\"custom-made-for-noi\" width=\"365\" height=\"260\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/1644293917_813_Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.jpg\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">Cửa hàng morino</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Tuy các chi nhánh cửa hàng chỉ mới có mặt tại Hà Nội nhưng đơn vị hỗ trợ các kênh liên lạc đáp ứng nhu cầu của khách hàng trên mọi miền. Ngoài ra, cửa hàng còn mở các lớp dạy nghề cho nhiều học viên tham gia.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Các sản phẩm:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Vệ sinh giày</li><li>Dây giày</li><li>Lót giày</li><li>Giữ form giày</li><li>Áo mưa cho giày</li><li>Bảo vệ đế giày</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Giày tùy chỉnh</li><li>Làm sạch và khử trùng giày</li><li>Bảo vệ đế giày</li><li>Sửa chữa / phục hồi giày</li><li>Giày nhuộm</li><li>Sơn lại màu giày</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>CS1: 22 Trần Quang Diệu, Đống Đa, Hà Nội</li><li>CS2: 452 Đội Cấn, Ba Đình, Hà Nội</li><li>CS3: 15A8A S202 Vinhome Ocean Park, Gia Lâm, Hà Nội</li><li>CS4: 14 ngõ 29 Hai Bà Trưng, ​​Lê Chân, Hải Phòng</li><li>Trang web: https://morino.vn/</li><li>Fanpage: https://www.facebook.com/morino868/</li><li>E-mail: [email&nbsp;protected]</li></ul><h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"sneaker-vitamin\">Vitamin cho giày thể thao</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Nhắc đến những shop giày custom hàng đầu tại Hà Nội không thể không kể đến cửa hàng Sneaker Vitamin. Là một trong những nơi được giới chơi giày yêu thích và tin tưởng. Với nhiều dịch vụ và sản phẩm về giày giúp đáp ứng tốt nhất cho khách hàng khi đến.</p><figure id=\"attachment_15907\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 355px;\"><img class=\"size-medium wp-image-15907 b-loaded\" alt=\"custom-made-for-noi\" width=\"365\" height=\"260\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/1644293917_188_Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.jpg\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">Vitamin cho giày thể thao</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Đội ngũ nhân viên tư vấn chuyên nghiệp, có óc thẩm mỹ cao có thể tư vấn giúp khách hàng lựa chọn được sản phẩm phù hợp nhất với mình. Ngoài ra, các sản phẩm tại đây luôn đảm bảo chất lượng cao và mang lại hiệu quả tốt nhất với dòng giày sneaker cho mọi đối tượng khách hàng.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Sản phẩm và dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Các sản phẩm về giày – cao gót – xăng đan</li><li>Dịch vụ dán duy nhất bảo vệ</li><li>Phục hồi, tân trang</li><li>Sửa chữa, may, thay thế</li><li>Đánh bóng bề mặt kim loại</li><li>Mạ khóa, nhẫn, lắc</li><li>Giày tùy chỉnh</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Địa chỉ: 348 Nguyễn Thị Minh Khai, P.5, Q.3, TP.HCM</li><li>CN 1: 204 Phan Đăng Lưu, P.3, Q.Phú Nhuận, TP.HCM</li><li>Chi nhánh 2: 109 Ô Chợ Dừa, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội</li><li>E-mail; [email&nbsp;protected]</li><li>Fanpage; https://www.facebook.com/bacthayvesinhgiay/</li><li>Trang web: https://sneakervitamin.vn/</li><li>Instgram: https://www.instagram.com/sneaker.vitamin/</li></ul><h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"21-shoez-clean-custom\">21 Shoez – Sạch sẽ và tùy chỉnh</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Một địa chỉ cung cấp dịch vụ vệ sinh, tùy chỉnh, phục hồi và chăm sóc giày dép uy tín tại Hà Nội. Hoạt động lâu năm với bề dày kinh nghiệm và đội ngũ chuyên nghiệp luôn sẵn sàng phục vụ khách hàng một cách tốt nhất. Đến với 21 shoez sẽ không làm khách hàng thất vọng.</p><figure id=\"attachment_15908\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 215px;\"><img class=\"size-full wp-image-15908 b-loaded\" alt=\"custom-made-for-noi\" width=\"225\" height=\"225\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/1644293918_143_Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.jpg\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">21 shoez – Sạch sẽ và tùy chỉnh</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Đa dạng về mẫu mã với nhiều mẫu giày, kiểu dáng, màu sắc, … khác nhau thu hút nhiều người dùng. Giá cả phù hợp với túi tiền của khách hàng và đảm bảo chất lượng là những gì khách hàng đánh giá cao về shop.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Các sản phẩm:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Sản phẩm làm sạch giày</li><li>Các công cụ tùy chỉnh</li><li>Giày tùy chỉnh</li><li>Phụ kiện cho giày</li><li>…</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Vệ sinh giày</li><li>Giày tùy chỉnh</li><li>Giáo dục</li><li>…</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Địa chỉ: Số 7, ngõ 68 Tam Khương, Đống Đa, Hà Nội</li><li>Chi nhánh: Ngõ 46 Giáp Bát, Hoàng Mai, Hà Nội</li><li>Trang web: http://21shoez.com/</li><li>Instagram: https://www.instagram.com/21shoez/</li><li>Fanpage: https://www.facebook.com/21shoezz/</li></ul><h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"tabu-custom\">Các tab tùy chỉnh</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Khởi nghiệp từ năm 2015, khởi đầu chỉ với niềm đam mê tạo ra những đôi giày theo yêu cầu của từng cá nhân. Cứ như vậy, khi niềm tin ngày càng lớn, Tabu custom trở thành thương hiệu chăm sóc giày được nhiều khách hàng trong và ngoài nước lựa chọn.</p><figure id=\"attachment_15909\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 355px;\"><img class=\"size-medium wp-image-15909 b-loaded\" alt=\"custom-made-for-noi\" width=\"365\" height=\"260\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.png\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">Các tab tùy chỉnh</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Đội ngũ Gen Z nhiệt tình, tận tâm giúp khách hàng có thể sở hữu được sản phẩm giày phù hợp nhất. Ngoài ra, giá cả vô cùng phải chăng, cạnh tranh trên thị trường đảm bảo sự tin tưởng của khách hàng với cửa hàng.</p><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Giày tùy chỉnh</li><li>Làm sạch giày</li><li>Sơn lại giày</li><li>Tẩy vết giày</li><li>Sửa giày</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Địa chỉ: Số 1 ngách 2 ngõ 231 Chùa Bộc – Trung Liệt – Đống Đa – Hà Nội</li><li>E-mail: [email&nbsp;protected]</li><li>Fanpage: https://www.facebook.com/customHN</li><li>Instagram: https://www.instagram.com/tabu_customs/</li></ul><h2 style=\"overflow-wrap: break-word; font-family: Roboto; font-weight: 700; line-height: 1.3; color: rgb(45, 45, 45); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\"><span id=\"susopa-shop\">Cửa hàng Susopa</span></h2><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Là cơ sở chuyên cung cấp các sản phẩm giày theo yêu cầu, vệ sinh, chăm sóc giày, … tại Hà Nội. Sở hữu đội ngũ chuyên nghiệp, được đào tạo bài bản sẽ chăm sóc khách hàng một cách tốt nhất. Giá cả mềm và sản phẩm chất lượng, đơn vị luôn mong muốn mang đến sản phẩm và dịch vụ tốt nhất cho khách hàng.</p><figure id=\"attachment_15910\" class=\"wp-caption aligncenter\" style=\"margin: 20px auto; clear: both; max-width: 100%; height: auto; text-align: center; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px; width: 355px;\"><img class=\"size-medium wp-image-15910 b-loaded\" alt=\"custom-made-for-noi\" width=\"365\" height=\"260\" src=\"https://allimages.sgp1.digitaloceanspaces.com/top10tphcmvn/2022/02/1644293921_521_Top-6-Cua-Hang-Custom-Giay-Ha-Noi-Theo-Yeu.jpg\" style=\"height: auto; max-width: 100%; border: 0px; display: inline-block;\"><figcaption class=\"wp-caption-text\" style=\"margin: 5px 0px 0px; font-style: italic; font-size: 13px; line-height: 15px; color: rgb(84, 84, 84); padding: 0px;\">Cửa hàng Susopa</figcaption></figure><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Các sản phẩm:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Làm sạch giày: kem làm sạch, kem dưỡng da, v.v.</li><li>Phục hồi giày: thuốc nhuộm, tẩy ố vàng, sơn lại bút, v.v.</li><li>Chăm sóc giày: túi hút ẩm, xịt khử mùi, …</li><li>Bảo vệ giày: xịt nano, áo mưa cho giày, miếng bảo vệ ngón chân, v.v.</li><li>Phụ kiện giày: làm giày, lót giày, giữ form giày, …..</li><li>….</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Dịch vụ:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Vệ sinh giày</li><li>Phục hồi giày</li><li>Bảo vệ giày</li><li>Giày tùy chỉnh</li><li>…</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><span style=\"font-weight: 700;\">Thông tin liên lạc:</span></p><ul style=\"overflow-wrap: break-word; margin-bottom: 17px; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"><li>Địa chỉ nhà; 159 Phố Vạn Xuân, Lai Xá, Kim Chung, Hoài Đức, Hà Nội</li><li>E-mail: [email&nbsp;protected]</li><li>Trang web: http://susopa.com/</li><li>Fanpage: https://www.facebook.com/spagiaycaocap/</li></ul><p style=\"overflow-wrap: break-word; margin-right: 0px; margin-bottom: 17px; margin-left: 0px; -webkit-font-smoothing: antialiased; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Dưới đây là 6 cửa hàng hàng đầu&nbsp;<span style=\"font-weight: 700;\">Giày hà nội theo yêu cầu</span>&nbsp;Hay nhất theo yêu cầu được tổng hợp và đánh giá dựa trên internet. Hi vọng, có thể giúp bạn lựa chọn được cửa hàng đóng giày theo yêu cầu tại Hà Nội tốt nhất. Đồng thời, mọi người có thể lựa chọn nhiều sản phẩm khác tại các cửa hàng trên.</p>', '<p><span style=\"color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Top 6 shop giày nam hà nội đặt làm theo yêu cầu với giá tốt nhất như: Dubo shop, morino shop, tabu custom, vitamin sneaker, … uy tín và nổi tiếng dưới đây sẽ giúp bạn tìm mua được những sản phẩm giày ưng ý nhất trên thị trường và đáp ứng được nhu cầu của người dùng . Ngoài ra, các cửa hàng này còn cung cấp thêm nhiều sản phẩm và dịch vụ đáp ứng nhu cầu của những người chơi thực sự giàu có để lựa chọn. Cùng với nhau&nbsp;</span><span style=\"font-weight: 700; color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\"></span><span style=\"color: rgb(34, 34, 34); font-family: Roboto; font-size: 15px;\">Cùng tìm hiểu những địa chỉ này qua nội dung bài viết dưới đây nhé!</span><br></p>', 'http://localhost/storage/photos/1/Blog/2.jpg', '2022,Sneakers,Fashion', 3, NULL, 1, 'active', '2022-06-24 16:30:52', '2022-06-24 16:32:47'),
(9, 'CUSTOM LÀ GÌ? 5 BƯỚC CUSTOM GIÀY SNEAKER TẠI NHÀ ĐƠN GIẢN NHẤT', 'custom-la-gi-5-buoc-custom-giay-sneaker-tai-nha-don-gian-nhat', '<p><br></p>', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Custom giày, hay còn gọi là “độ giày”, là một xu hướng đã du nhập vào Việt Nam một thời gian và nhận được sự hưởng ứng mạnh từ các bạn trẻ, đặc biệt dân chơi giày. Vậy bạn đã bao giờ tự tay thổi hồn vào đôi giày sneaker của mình chưa? Cùng&nbsp;<a href=\"https://giaybom.com/\" style=\"color: rgb(250, 205, 126); text-decoration-line: underline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong style=\"font-weight: bold;\">giayBOM</strong></a>&nbsp;khám phá xem Custom là gì và cách&nbsp;<strong style=\"font-weight: bold;\">custom giày sneaker</strong>&nbsp;tại nhà đơn giản nhất nhé!</p><h2 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 2em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Custom là gì?</strong></h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Có thể hiểu đơn giản<strong style=\"font-weight: bold;\">&nbsp;Custom giày</strong>&nbsp;là tự chỉnh sửa 1 đôi giày sneaker theo mẫu hay theo sở thích của bạn bằng cách vẽ thêm hình vào hay có thể đổi màu sắc toàn bộ đôi giày. Quá trình này giống như biến 1 đôi giày mới, thậm chí là cũ thành một đôi&nbsp;<a href=\"https://giaybom.com/meo-vat/top-nhung-doi-giay-sneaker-nu-2020-se-lam-cac-nang-dieu-dung\" style=\"color: rgb(250, 205, 126); text-decoration-line: underline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong style=\"font-weight: bold;\">giày sneaker đẹp</strong></a>&nbsp;khác biệt hoàn toàn về màu sắc, kiểu dáng, chất lượng.<br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Ngoài ra, các dân chơi giày có 1 tên gọi khác là&nbsp;<strong style=\"font-weight: bold;\">độ giày</strong>. Nâng cấp đôi giày sneaker của bạn để thể hiện đẳng cấp, độ chịu chơi của các dân chơi.&nbsp;<br><br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/1_27587a8db8d54b51972d44fc0860aaa5_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">“Ai cũng có nhu cầu thể hiện bản thân mình”, vì thế<strong style=\"font-weight: bold;\">&nbsp;Custom giày</strong>&nbsp;là một cách thể hiện tình yêu với giày, thỏa mãn sở thích của mỗi người và mang đến sự đa dạng cho phong cách cũng như tủ giày yêu quý của bạn.</p><h2 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 2em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Cách Custom giày sneaker đơn giản tại nhà</strong></h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Với xu hướng&nbsp;<strong style=\"font-weight: bold;\">Custom giày sneaker</strong>&nbsp;ngày càng mạnh mẽ, các bạn trẻ từ khắp nơi đã không ngần ngại mạnh dạn tạo nên phong cách riêng của trên những đôi giày của mình. Mặc dù trên thế giới đã chuyển sang công nghệ Deconstruction” – một kỹ thuật “tháo tung” đôi giày ra để “thay da đổi thịt cho các ẻm.” Thế nhưng bài viết này&nbsp;<strong style=\"font-weight: bold;\">giayBOM</strong>&nbsp;sẽ hướng dẫn cho các bạn không phải dân chuyên, không cần có hoa tay hay năng khiếu về nghệ thuật, chỉ cần bạn có đủ dũng cảm vẽ vời lên chính đôi giày của mình mà thôi. Bây giờ, hãy lấy đôi giày sneaker ra và thực hành cùng BOM nhé!<br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/2_ff5d88540d1d4b24939f233f70cbbc3b_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><h3 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 1.57143em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Bước 1: Chuẩn bị dụng cụ để vẽ</strong></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\"><strong style=\"font-weight: bold;\">- Bút và cọ vẽ giày:&nbsp;</strong>Loại bút thường được dùng để&nbsp;<strong style=\"font-weight: bold;\">Custom giày sneaker</strong>&nbsp;là các loại bút vẽ vải chuyên dụng. Bạn nên chọn ít nhất 3 loại bút lông với các kích cỡ ngòi khác nhau. Với người mới bắt đầu, chọn bút loại số 0, số 4 và số 6 là thích hợp nhất để quá trình vẽ dễ dàng hơn. Hai nơi uy tín bạn có thể tìm mua bút lông vẽ giày là Peltel hoặc Lukas.<br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/3_a5ffb9962dcb49e2bd2f53e187a571af_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\"><br>Để vẽ màu cho giày thật đẹp, bạn cần chuẩn bị thêm bộ cọ vẽ với mọi kích cỡ. Cọ là dụng cụ để bạn tô vẽ màu lên giày sau khi các chi tiết đã được phác thảo. Bạn nên dùng cả cọ cứng và cọ mềm khi vẽ. Cọ cứng cho sơn dày và cọ mềm cho màu nước.<br><br><strong style=\"font-weight: bold;\">- Màu để vẽ giày:&nbsp;</strong>Acrylic là loại được sử dụng phổ biến nhất để custom giày sneaker. Trên thị trường có rất nhiều loại màu Acrylic với chất lượng và màu sắc đa dạng để bạn lựa chọn. Tuy nhiên, bạn không nên chọn loại màu quá rẻ tiền, bởi chúng chứa rất ít chất màu mà còn có nhiều phụ gia, vừa không bền màu vừa có hại cho sức khỏe của bạn đấy.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/4_3422d1000981402990b9f04099565ea6_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">-<strong style=\"font-weight: bold;\">&nbsp;Keo sữa</strong>: Pha chung với màu Acrylic khi vẽ lên giày để giúp giữ màu lâu phai hơn.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">-&nbsp;<strong style=\"font-weight: bold;\">Pallet</strong>: Bạn cần một tấm bảng pallet để pha những màu có sẵn thành những màu mới đa dạng hơn.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">-&nbsp;<strong style=\"font-weight: bold;\">Ống/xô rửa bút</strong>: Kể cả bút lông hay cọ vẽ đều cần được rửa sạch và ngâm trong nước để tránh đầu bút/cọ bị cứng và nhanh hỏng.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">-&nbsp;<strong style=\"font-weight: bold;\">Băng keo giấy</strong>: Tránh dây màu cho những vùng giày bạn không muốn vẽ lên.</p><h3 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 1.57143em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Bước 2: Vệ sinh giày sạch sẽ<br><br><img src=\"https://giaybom.com/image/customm.jpg9270720201924147797.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%;\"></strong></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Nếu bạn chọn Custom giày mới thì có thể bỏ qua bước này, nhưng nếu bạn muốn sơn vẽ giày cũ thì hãy chắc chắn rằng bạn đã vệ sinh giày thật sạch sẽ để màu lên được đẹp và mực vẽ giày sẽ có độ bám màu bền hơn. Hơn nữa, bạn cũng không muốn cầm và vẽ trên một đôi giày vừa dơ vừa bốc mùi đúng không? Giặt sạch đôi giày của bạn, phơi chúng khô ráo để chuẩn bị cho ý tưởng sáng tạo nghệ thuật của bạn trở thành hiện thực nhé!&nbsp;<br>Tham khảo&nbsp;<em><a href=\"https://giaybom.com/meo-vat/lam-trang-giay-sau-chuoi-ngay-bi-bo-xo-vi-dich-corona\" style=\"color: rgb(250, 205, 126); text-decoration-line: underline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">cách tẩy trắng giày đơn giản tại nhà</a></em>&nbsp;nhé!</p><h3 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 1.57143em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Bước 3: Phác thảo ý tưởng</strong></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Không giống như vẽ trên giấy, khi custom giày một khi đã vẽ thì không xóa hay sửa được nữa nên dù là dân chuyên hay không chuyên thì chúng ta cũng phải phác thảo trước nhé.<br><br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/5_948cb066c9ff4659a456d3a142c03bda_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Nếu bạn là người sáng tạo có thể tự thiết kế cho riêng mình hoặc có thể lên mạng tham khảo, sau đó hãy phác họa ra giấy nhiều lần nhé! Sau khi bạn đã thuần thục các nét vẽ trên nháp, đây là lúc bạn có thể dùng bút để vẽ trực tiếp lên giày rồi đấy. Bây giờ, bạn dùng loại bút lông chuyên dụng để vẽ lên giày những chi tiết mà bạn muốn trước khi tô màu lên.&nbsp;</p><h3 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 1.57143em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Bước 4: Chia ranh giới để vẽ</strong></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Sau khi đã có được mẫu muốn vẽ, bước tiếp theo bạn phải định hình vị trí trên giày để vẽ. Đây là lúc cuộn băng keo phát huy tác dụng đấy, bạn hãy dán chúng vào những phần không vẽ trong quá trình custom giày sneaker để màu không bị lem màu. Lý do nên chọn băng keo giấy không những vì nó bám dính tốt mà còn ít để lại vết keo khi gỡ ra.</p><h3 style=\"font-family: Roboto, Helvetica, Arial, sans-serif; margin: 2em 0px 0.5em; line-height: 1.4; font-size: 1.57143em; color: rgb(102, 102, 102);\"><strong style=\"font-weight: bold;\">Bước 5:&nbsp; Vẽ thôi</strong></h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\">Công đoạn cuối cùng cũng là công đoạn quan trọng nhất, bạn cần phải tập trung cao độ, cẩn thận trong từng nét vẽ để màu lên thật đều và đẹp mắt nhé. Ở bước này, sai một ly là đi một dặm đấy :)<br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/6_9196c2a15ddb47cc88f42b270dc3f80d_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\"><br>- Với những loại giày bằng vải mềm như&nbsp;<a href=\"https://giaybom.com/giay-bata\" style=\"color: rgb(250, 205, 126); text-decoration-line: underline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><strong style=\"font-weight: bold;\">giày bata nữ</strong></a>, bạn cần cố định giày bằng ghim để không bị lệch khi vẽ màu lên nhé.<br><br>- Bạn nên lựa chọn đầu bút vẽ phù hợp, nhúng đầu bút vào khay đựng và gạt màu ở thành khay để tránh lấy quá nhiều màu, đủ lượng cần dùng cho phù hợp. Có thể pha màu với một ít keo sữa để màu bám chắc hơn trên giày.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/9_70f8f394eb574921ade2a4e0b37695ca_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px;\"><br>- Vẽ viền theo họa tiết đã phác thảo. Ở bước này hãy thật sự cẩn thận bởi màu khô rất nhanh và bám bền nên khi tẩy sẽ gây ảnh hưởng đến bề mặt. Một mẹo nhỏ dành cho bạn đó là khi lỡ vẽ màu sai, hãy dùng màu Acrylic trắng để tô chồng lên phần màu hỏng. Đợi cho đến khi màu khô đi bạn có thể tiếp tục vẽ và chỉnh sửa lại<br><br>- Khi vẽ xong bạn hãy để giày nơi khô ráo, thoáng mát để màu khô tự nhiên<br>&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(102, 102, 102); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\"><img src=\"https://file.hstatic.net/200000382351/file/11_c08f22fde2f64571a153204c8d03c5a6_grande.jpg\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; margin: 0px;\"></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: rgb(249, 249, 249);\">Custom giày, hay còn gọi là “độ giày”, là một xu hướng đã du nhập vào Việt Nam một thời gian và nhận được sự hưởng ứng mạnh từ các bạn trẻ, đặc biệt dân chơi giày. Vậy bạn đã bao giờ tự tay thổi hồn vào đôi giày sneaker của mình chưa? Cùng giayBOM khám phá xem Custom là gì và cách custom giày sne...</span><br></p>', 'http://localhost/storage/photos/1/Blog/3.jpg', 'Hot Trend,2022,Sneakers,Fashion', 5, NULL, 1, 'active', '2022-06-24 16:32:29', '2022-06-24 16:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fashion 2022', 'Fashion 2022', 'active', '2020-08-14 01:51:03', '2022-06-24 16:33:26'),
(2, 'Sneakers', 'Sneakers', 'active', '2020-08-14 01:51:22', '2022-06-24 16:33:34'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Hàng mới', 'Hàng mới', 'active', '2020-08-15 06:59:04', '2022-06-24 16:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 31, 9, 'Bài viết rất bổ ích, cảm ơn admin', 'active', NULL, NULL, '2022-07-04 12:42:00', '2022-07-04 12:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hot Trend', 'Hot Trend', 'active', '2020-08-14 01:53:52', '2022-06-24 16:16:39'),
(2, '2022', '2022', 'active', '2020-08-14 01:54:09', '2022-06-24 16:16:44'),
(3, 'Sneakers', 'Sneakers', 'active', '2020-08-14 01:54:33', '2022-06-24 16:16:50'),
(4, 'Fashion', 'Fashion', 'active', '2020-08-15 06:59:31', '2022-06-24 16:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(13, 'AIR FORCE 1', 'air-force-1', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">Ra mắt vào&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">năm 1982</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;bởi nhà thiết kế&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">Bruce Kilgore</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">, ngay lập tức&nbsp;mẫu giày&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">Nike&nbsp;Air Force 1 (AF1)</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;đã trở thành một ‘hit’ mạnh trên khắp thế giới khi ‘sold out’ ngay trong ngày đầu trình làng.</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Thiết kế mẫu&nbsp;<a charset=\"giày Nike Air Force 1\" class=\"giày Nike Air Force 1\" href=\"https://kingshoes.vn/air-force-1-07-315122-111-408.html\" id=\"giày Nike Air Force 1\" title=\"giày Nike Air Force 1\" type=\"giày Nike Air Force 1\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">giày Nike Air Force 1</strong></a>&nbsp;được xem là đôi giày mang tính cách mạng trong thế giới&nbsp;<strong style=\"font-weight: bold;\">sneaker</strong>, khi mà các nhà thiết kế kết hợp với các nhà khoa học cho ra mẫu giày có công nghệ&nbsp;<strong style=\"font-weight: bold;\">‘Air’</strong>&nbsp;– một túi khí ở gót chân để đệm hỗ trợ.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-2.jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"666\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-2.jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"1000\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Cái tên&nbsp;<strong style=\"font-weight: bold;\">‘Air Force One’</strong>&nbsp;được lấy ý tưởng từ chiếc chuyên cơ cùng tên chuyên dùng chở tổng thống Mỹ.&nbsp;<strong style=\"font-weight: bold;\">AF1</strong>&nbsp;có 3 hình thức chính:&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">low (thấp)</em></strong>&nbsp;–&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">mid (trung)</em></strong>&nbsp;–&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">top (cao)</em></strong>. Với các style Mid – Top, chúng ta dễ dàng nhận thấy một cọng dây đeo có khoá hoặc dán tạo vẻ chắc chắn cho đôi giày và có thể dịch chuyển theo tuỳ phiên bản. Đây là một sự đặc biệt của đôi&nbsp;<strong style=\"font-weight: bold;\">giày Nike Air Force 1</strong>&nbsp;so với các đôi giày khác cùng thời. Một điểm nhận dạng khác của các&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;là một huy hiệu nhỏ ở giữa dây giày được làm bằng thiếc (có phiên bản được làm bằng nhựa hoặc bạc) có khắc dòng chữ ‘AF1’.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-07-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-1(1).jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"1000\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-07-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-1(1).jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"1000\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;có hơn 1.700 bản phối với nhiều màu khác nhau và ngày càng tăng lên. Nhưng 2 màu cơ bản&nbsp;<em><strong style=\"font-weight: bold;\">White – on – White</strong></em>&nbsp;và&nbsp;<em><strong style=\"font-weight: bold;\">Black – on – Black</strong></em>&nbsp;vẫn là hai phiên bản thành công nhất với số lượng sản phẩm bán ra chạy nhất trong suốt nhiều thập kỷ qua. 12 triệu là số lượng giày được bán ra trong thời kì đỉnh cao của&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;vào năm 2005. Con số đã phần nào thể hiện được sự phổ biến của nó trên toàn thế giới.&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;thu về hơn 800 triệu USD mỗi năm cho Nike, sự tồn tại của đôi giày này trong hơn 25 năm qua cho ta thấy vị trí của nó trong trái tim những người đam mê ‘footwear’ cao đến mức nào.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\">Vậy có nên mua giày Nike Air Force 1 không?</strong></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Nói đến đây thì chắc hẳn bạn đã biết được có nên mua giày&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;rồi đúng không. Hiện nay, trên thị trường có rất nhiều giày Nike Air Force 1 fake.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Mua&nbsp;<a href=\"https://kingshoes.vn/air-force-1-07-315122-111-408.html\" id=\"giày Nike Air Force 1 chính hãng\" title=\"giày Nike Air Force 1 chính hãng\" type=\"giày Nike Air Force 1 chính hãng\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">giày Nike Air Force 1 chính hãng</strong></a>&nbsp;hãy ghé&nbsp;<a charset=\"King Shoes\" class=\"King Shoes\" href=\"https://kingshoes.vn/gioi-thieu/\" id=\"King Shoes\" title=\"King Shoes\" type=\"King Shoes\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">King Shoes</strong></a>&nbsp;để luôn được trao tận tay những đôi giày Real và giá luôn luôn hấp dẫn.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-3.jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"548\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-3.jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"750\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">⚡️&nbsp;<strong style=\"font-weight: bold;\">MINHEST SNEAKERS&nbsp;</strong>✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</p>', 'http://localhost/storage/photos/1/Products/1.jpg', 999, '36,39,42,44', 'hot', 'active', '330000.00', 0.00, 0, 1, NULL, 2, '2022-07-03 00:35:43', '2022-07-03 00:38:17'),
(14, 'FREE RUN 2', 'free-run-2', '<p>FREE RUN 2 - MINHEST SNEAKERS<br></p>', '<p style=\"margin-bottom: 5px; text-align: justify; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: medium;\">Trước khi Eliud Kipchoge và Nike Running làm nên lịch sử trong thế giới chạy marathon, tổ chức sau này đã thử nghiệm công nghệ mà nó đã giới thiệu trong suốt những năm 2000.&nbsp;Nhân kỷ niệm 10 năm ra đời những sản phẩm như&nbsp;Nike Free Run 2&nbsp;, Swoosh đã dành ra những màu sắc hấp dẫn, không nguyên bản cho những thiết kế sáng tạo này.</p><p style=\"margin-bottom: 5px; text-align: justify; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: medium;\">Tương tự như một cặp trung tâm “Đá hóa thạch” đã thấy trước đây, một kiểu dáng mới nổi đặt các sắc thái của “Summit White” và “Pure Platinum” lên hàng đầu.&nbsp;Kết cấu lưới và da lộn trên toàn bộ phần thân của giày đế thấp phân chia các tông màu nói trên, với các tấm một phần tạo thêm một số nét tinh tế mùa xuân mờ nhạt cho bộ quần áo.&nbsp;Dưới chân, bộ phận đế siêu linh hoạt tạo ra một số điểm nhấn màu hồng giống như đất sét, trong khi phần lớn của nó tự hào có màu trắng nhạt sạch sẽ.</p><p style=\"margin-bottom: 5px; text-align: justify; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: medium;\">Hãy thưởng thức những hình ảnh chính thức Nike Free Run 2 ở đây bên dưới và dự đoán rằng&nbsp;Nike.com&nbsp;sẽ sớm phát hành trong thời gian ngắn.</p><p style=\"margin-bottom: 5px; text-align: justify; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: medium;\"><img class=\"nike-free-run-2 aligncenter wp-image-19501 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"800\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-510x358.jpg 510w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-1-510x358.jpg 510w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19503 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"800\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-510x358.jpg 510w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-3-510x358.jpg 510w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19504 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"1140\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-100x100.jpg 100w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-4-100x100.jpg 100w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19505 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"800\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-510x358.jpg 510w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-5-510x358.jpg 510w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19506 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"800\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-510x358.jpg 510w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-570x400.jpg 570w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-768x539.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-6-510x358.jpg 510w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19507 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"1140\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-100x100.jpg 100w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-7-100x100.jpg 100w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"><img loading=\"lazy\" class=\"nike-free-run-2 aligncenter wp-image-19508 size-full lazy-load-active\" title=\"nike-free-run-2\" src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8.jpg\" data-src=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8.jpg\" alt=\"nike-free-run-2\" width=\"1140\" height=\"1140\" srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-100x100.jpg 100w\" data-srcset=\"https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8.jpg 1140w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-400x400.jpg 400w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-800x800.jpg 800w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-280x280.jpg 280w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-768x768.jpg 768w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-65x65.jpg 65w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-510x510.jpg 510w, https://vuongconverse.com/wp-content/uploads/2021/08/Nike-Free-Run-2-8-100x100.jpg 100w\" sizes=\"(max-width: 1140px) 100vw, 1140px\" style=\"max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;\"></p>', 'http://localhost/storage/photos/1/Products/2.jpeg', 888, '36,39,42,44', 'new', 'active', '550000.00', 2.00, 1, 1, NULL, 2, '2022-07-03 00:42:40', '2022-07-03 00:42:40'),
(15, 'AIR FORCE 1 NỮ', 'air-force-1-nu', '<p><a charset=\"Nike Air Force 1\" href=\"https://kingshoes.vn/air-force-1-07-315122-111-408.html\" id=\"Nike Air Force 1\" title=\"Nike Air Force 1\" type=\"Nike Air Force 1\" style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; color: inherit; background-color: rgb(255, 255, 255); transition: all 0.4s ease 0s; outline: none; font-size: 18px;\"><strong style=\"font-weight: bold;\">Nike Air Force 1</strong></a><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;Ra mắt vào&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">năm 1982</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;bởi nhà thiết kế&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">Bruce Kilgore</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">, ngay lập tức&nbsp;mẫu giày&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">Nike&nbsp;Air Force 1 (AF1)</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;đã trở thành một ‘hit’ mạnh trên khắp thế giới khi ‘sold out’ ngay trong ngày đầu trình làng.</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Thiết kế mẫu&nbsp;<a charset=\"giày Nike Air Force 1\" href=\"https://kingshoes.vn/air-force-1-07-315122-111-408.html\" id=\"giày Nike Air Force 1\" title=\"giày Nike Air Force 1\" type=\"giày Nike Air Force 1\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">giày Nike Air Force 1</strong></a>&nbsp;được xem là đôi giày mang tính cách mạng trong thế giới&nbsp;<strong style=\"font-weight: bold;\">sneaker</strong>, khi mà các nhà thiết kế kết hợp với các nhà khoa học cho ra mẫu giày có công nghệ&nbsp;<strong style=\"font-weight: bold;\">‘Air’</strong>&nbsp;– một túi khí ở gót chân để đệm hỗ trợ.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-2.jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"666\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-2.jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"1000\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Cái tên&nbsp;<strong style=\"font-weight: bold;\">‘Air Force One’</strong>&nbsp;được lấy ý tưởng từ chiếc chuyên cơ cùng tên chuyên dùng chở tổng thống Mỹ.&nbsp;<strong style=\"font-weight: bold;\">AF1</strong>&nbsp;có 3 hình thức chính:&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">low (thấp)</em></strong>&nbsp;–&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">mid (trung)</em></strong>&nbsp;–&nbsp;<strong style=\"font-weight: bold;\"><em style=\"font-weight: 400;\">top (cao)</em></strong>. Với các style Mid – Top, chúng ta dễ dàng nhận thấy một cọng dây đeo có khoá hoặc dán tạo vẻ chắc chắn cho đôi giày và có thể dịch chuyển theo tuỳ phiên bản. Đây là một sự đặc biệt của đôi&nbsp;<strong style=\"font-weight: bold;\">giày Nike Air Force 1</strong>&nbsp;so với các đôi giày khác cùng thời. Một điểm nhận dạng khác của các&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;là một huy hiệu nhỏ ở giữa dây giày được làm bằng thiếc (có phiên bản được làm bằng nhựa hoặc bạc) có khắc dòng chữ ‘AF1’.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-07-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-1(1).jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"1000\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-07-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-1(1).jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"1000\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;có hơn 1.700 bản phối với nhiều màu khác nhau và ngày càng tăng lên. Nhưng 2 màu cơ bản&nbsp;<em><strong style=\"font-weight: bold;\">White – on – White</strong></em>&nbsp;và&nbsp;<em><strong style=\"font-weight: bold;\">Black – on – Black</strong></em>&nbsp;vẫn là hai phiên bản thành công nhất với số lượng sản phẩm bán ra chạy nhất trong suốt nhiều thập kỷ qua. 12 triệu là số lượng giày được bán ra trong thời kì đỉnh cao của&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;vào năm 2005. Con số đã phần nào thể hiện được sự phổ biến của nó trên toàn thế giới.&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;thu về hơn 800 triệu USD mỗi năm cho Nike, sự tồn tại của đôi giày này trong hơn 25 năm qua cho ta thấy vị trí của nó trong trái tim những người đam mê ‘footwear’ cao đến mức nào.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\">Vậy có nên mua giày Nike Air Force 1 không?</strong></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Nói đến đây thì chắc hẳn bạn đã biết được có nên mua giày&nbsp;<strong style=\"font-weight: bold;\">Nike Air Force 1</strong>&nbsp;rồi đúng không. Hiện nay, trên thị trường có rất nhiều giày Nike Air Force 1 fake.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">Mua&nbsp;<a href=\"https://kingshoes.vn/air-force-1-07-315122-111-408.html\" id=\"giày Nike Air Force 1 chính hãng\" title=\"giày Nike Air Force 1 chính hãng\" type=\"giày Nike Air Force 1 chính hãng\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">giày Nike Air Force 1 chính hãng</strong></a>&nbsp;hãy ghé&nbsp;<a charset=\"King Shoes\" href=\"https://kingshoes.vn/gioi-thieu/\" id=\"King Shoes\" title=\"King Shoes\" type=\"King Shoes\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">King Shoes</strong></a>&nbsp;để luôn được trao tận tay những đôi giày Real và giá luôn luôn hấp dẫn.</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><a href=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-3.jpg\" data-fancybox=\"images\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><img alt=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" height=\"548\" id=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" longdesc=\"https://kingshoes.vn/Gi%C3%A0y%20Nike%20Sneaker%20AIR%20FORCE%201%20\'07%20Nam%20%7C%20KingShoes.vn%20B%C3%A1n%20Gi%C3%A0y%20Sneaker%20Ch%C3%ADnh%20H%C3%A3ng%20T%E1%BA%A1i%20Tphcm\" src=\"https://kingshoes.vn/data/upload/media/AIR-FORCE-1-NIKE-315122-111-KING-SHOES-SNEAKER-TPHCM-TANBINH-3.jpg\" title=\"Giày Nike Sneaker AIR FORCE 1 \'07 Nam | KingShoes.vn Bán Giày Sneaker Chính Hãng Tại Tphcm\" width=\"750\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></a></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\">⚡️⚡️⚡️&nbsp;<strong style=\"font-weight: bold;\">MINHEST SNEAKERS&nbsp;</strong>✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</p>', 'http://localhost/storage/photos/1/Products/3.jpeg', 475, '36,39,42,44', 'hot', 'active', '400000.00', 4.00, 0, 1, NULL, 2, '2022-07-03 00:44:17', '2022-07-03 00:44:17'),
(16, 'COURT LEGACY', 'court-legacy', '<p style=\"margin-bottom: 1.3em; font-family: Archivo, sans-serif; font-size: 15.36px;\"><a href=\"https://deestore.vn/giay-nike/\" style=\"touch-action: manipulation; color: rgb(51, 72, 98);\">Gìay Nike</a>&nbsp;Court Legacy GS White Black Desert Ochre</p><p style=\"margin-bottom: 1.3em; font-family: Archivo, sans-serif; font-size: 15.36px;\">Xuất xứ sản phẩm: Hàng ship Uk</p><p style=\"margin-bottom: 1.3em; font-family: Archivo, sans-serif; font-size: 15.36px;\">Mã sản phẩm: DAA538-102</p>', '<p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Nike Court Legacy White Desert Ochre mới nhất - mang trong mình nguồn cảm hứng sáng tạo, đạm chất thời trang và cá tính, mang đến cho bạn một phong cách cá tính riêng biệt.&nbsp;</span></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\"><img src=\"https://lh5.googleusercontent.com/cekPj3Bf2uKUVtQty8j06TGuLFo1BAKUK1YAKj14EsigvTRPlHmKjt6cltHUvVvwJMYGrypMuTp6Q9Vu9EEts_rPLoxZK23Fjon4F7D7rZ7fRn7IdxS7Mxh7j_B2Iz291a0zKI0\" width=\"555\" height=\"567\" style=\"outline: none; transition: all 0.3s ease 0s; max-width: 100%; height: auto;\"></span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Vẻ bề ngoài xuất sắc của Nike Court Legacy White Desert Ochre</span></p><h2 dir=\"ltr\" style=\"outline: none; font-size: 24px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></h2><div dir=\"ltr\" style=\"outline: none; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><table style=\"outline: none; caption-side: bottom;\"><colgroup style=\"outline: none;\"><col width=\"204\" style=\"outline: none;\"><col width=\"398\" style=\"outline: none;\"></colgroup><tbody style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td colspan=\"2\" style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">THÔNG SỐ KỸ THUẬT</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">TÊN SẢN PHẨM</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Nike Court Legacy White Desert Ochre</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">THƯƠNG HIỆU</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Nike</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">MÃ SẢN PHẨM</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">CU4150 102</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">CHẾ ĐỘ BẢO HÀNH</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">6 tháng kể từ ngày xuất hóa đơn</span></p></td></tr></tbody></table></div><ul style=\"outline: none; padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><li dir=\"ltr\" style=\"outline: none;\"><br style=\"outline: none;\"></li></ul><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><div dir=\"ltr\" style=\"outline: none; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><table style=\"outline: none; caption-side: bottom;\"><colgroup style=\"outline: none;\"><col width=\"203\" style=\"outline: none;\"><col width=\"397\" style=\"outline: none;\"></colgroup><tbody style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td colspan=\"2\" style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">ĐẶC ĐIỂM NỔI BẬT</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">GIỚI TÍNH</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Unisex</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">MÀU SẮC</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">White</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">THÂN GIÀY</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Da&nbsp;</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">ĐẾ GIÀY</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Cao su</span></p></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">HƯỚNG DẪN BẢO QUẢN</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><ul style=\"outline: none; padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none;\"><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Hạn chế tiếp xúc với nước</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Lau chùi vết bẩn thường xuyên bằng khăn mềm</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Tránh phơi dưới ánh nắng trực tiếp&nbsp;</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Bảo quản giày tốt nhất ở nơi thoáng mát</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Không sử dụng chất tẩy mạnh trực tiếp lên giày</span></p></li></ul></td></tr><tr style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial;\"><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">TÍNH NĂNG NỔI BẬT</span></p></td><td style=\"outline: none; border-width: 0px; border-style: solid; border-image: initial; border-color: inherit;\"><ul style=\"outline: none; padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none;\"><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Thiết kế đơn giản, form giày basic phối màu đen trắng đơn giản&nbsp;</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Giày được chế tác từ các chất liệu cao cấp, thoáng khí giúp bạn luôn cảm thấy dễ chịu</span></p></li><li dir=\"ltr\" style=\"outline: none;\"><p dir=\"ltr\" style=\"outline: none; font-size: 17px;\"><span style=\"outline: none;\">Phù hợp với nhiều phong cách</span></p></li></ul></td></tr></tbody></table></div><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\"><img src=\"https://lh3.googleusercontent.com/dWFPix4Oqey2RZ9V_upGlEHJEp6iKXwqjktDHjEWuq1UtF8h0Rl5aQgTkOKyq5pdCyMU75-Aq88pV_3eWX3mbhbMcQG25H5N4plBBe71o6PykhhR35oVBojqSoXXCXgDhmQxX7o\" width=\"531\" height=\"575\" style=\"outline: none; transition: all 0.3s ease 0s; max-width: 100%; height: auto;\"></span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Màu sắc đơn giản cùng với kiểu dáng basic đôi giày phù hợp với nhiều set đồ</span></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Nike Court Legacy được làm từ loại da cao cấp, dệt tỉ mỉ, tạo độ thoáng mát, cho dù là bạn có vận động cả ngày dài thì vẫn cảm nhận được sự khô thoáng. Đế cao su mềm dễ vệ sinh cùng lớp lót siêu êm ái giúp bạn cảm thấy dễ chịu khi hoạt động trong thời gian dài.</span></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Ngoài ra dưới đế còn có các đường rãnh chống trơn trượt, được thiết kế thêm phần đệm Air tăng tính linh hoạt cho bàn chân của bạn, giúp các bước chân được vững vàng và chắc chắn.</span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\"><img src=\"https://lh3.googleusercontent.com/8HWAGXJC0T_6vHVTAUFqwg1M4JWgDgCDhYBbZVoClg-dz_r-Q4BpW7EBpjFsDb-jjSmubfapJAb03ya6zjZIklcAFuFPKlolx5hzptJLwEWkgdqGve0YaL6opxNvfpQbVzb0xEE\" width=\"602\" height=\"559\" style=\"outline: none; transition: all 0.3s ease 0s; max-width: 100%; height: auto;\"></span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Nam nữ mang đều cực đẹp, mix-match được với mọi phong cách đồ</span><span style=\"outline: none;\"><br style=\"outline: none;\"><br style=\"outline: none;\"></span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Đây có lẽ là đôi giày được pha trộn giữa phong cách cổ điển cùng với thiết kế hiện đại mang trong mình giá trị lịch sử Quần Vợt của Nike. Với đường may sắc nét, phức tạp làm tăng thêm giá trị cho đôi giày.&nbsp;</span></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Bên trong được đệm một lớp mút dày dặn êm ái nhưng vẫn mang lại cho bạn cảm giác thoáng khí không bị bí. Hệ thống dây giày chắc chắn cố định chân bạn bên trong giày để bạn có thể linh hoạt trong những di chuyển của mình.</span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\"><img src=\"https://lh5.googleusercontent.com/vXVulPaYGV-KT73_rCHz_aNywGpe246JhPbhUe88oK5GAV9ilON8wFK_VcpnHXYCclc-4zstmNK2QLhMrfvU2fgDp9xYUdNOwd3WQoILOSBU27UkoaiagKD_im4axPRJzGEaBoA\" width=\"602\" height=\"601\" style=\"outline: none; transition: all 0.3s ease 0s; max-width: 100%; height: auto;\"></span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Trắng đen đơn giản cân mọi set đồ&nbsp;</span></p><p style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><br style=\"outline: none;\"></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Với đôi giày Nike Court Legacy bạn có thể tùy ý phối với một chiếc quần Jogger đơn giản cùng áo phông, nếu là nữ bạn mặc nó với một chiếc váy cũng rất là điệu đà đó ạ.&nbsp;</span></p><p dir=\"ltr\" style=\"outline: none; font-size: 17px; color: rgb(29, 28, 28); font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 251);\"><span style=\"outline: none;\">Màu sắc đơn giản trung tính, form đơn giản gọn gàng, kiểu dáng unisex rất phù hợp với các cặp đôi đang yêu nhau, hay những hội bạn thân rất hợp lý</span></p>', 'http://localhost/storage/photos/1/Products/4.jpeg', 666, '36,39,42,44', 'default', 'active', '555000.00', 1.00, 0, 1, NULL, 2, '2022-07-03 00:46:31', '2022-07-03 00:46:31');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(17, 'AIR MAX IVO', 'air-max-ivo', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Giày Nike Air Max Ivo 580518 106, size 44, real 2hand\r\nChất liệu: da\r\nTình trạng: new 90%. Mới cao, y ảnh chụp. Hàng sẵn\r\n✈ Giao hàng: Shop giao hàng toàn quốc\r\nZalo: 0982 303 758 để được Shop tư vấn và hỗ trợ đặt hàng</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">#giay #giày #thethao #giare #giaynam #giaythethao #giamgia #giayjordan\r\n#giárẻ #giảmgiá #13s #jordan #flugame #giaythethaonam #jordan #giaynike #jordan #giaythethao#real2hand</span><br></p>', 'http://localhost/storage/photos/1/Products/6.jpg', 421, '36,39,42,44', 'default', 'active', '830000.00', 10.00, 0, 1, NULL, 2, '2022-07-03 00:49:36', '2022-07-03 00:49:36'),
(18, 'PEGASUS 38', 'pegasus-38', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">MINHEST SNEAKERS&nbsp;</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">Những đôi giày có thể chạy như bay đang tái xuất hiện. Nike Air Zoom Pegasus 38 sử dụng bọt đẩy tương tự như người tiền nhiệm của nó. Dáng đi thướt tha vẫn tiếp tục. Lưới thoáng khí phía trên mang lại sự thoải mái và độ bền. Các ngón chân rộng.</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\"><img data-thumb=\"original\" original-height=\"576\" original-width=\"1024\" src=\"https://bizweb.dktcdn.net/100/347/092/files/nike-air-zoom-pegasus-38-cw7356-004-11.jpg?v=1626542392040\" style=\"border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; height: auto; margin: 0px;\"></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><br><span style=\"color: rgb(0, 0, 0);\">Mới nhưng truyền thống</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">Trong khi duy trì sự phù hợp tốt của Pegasus, bàn chân trước được mở rộng để đảm bảo không gian nơi các ngón chân có thể di chuyển tự do. Chất liệu lưới của phần trên có độ thoáng khí cao, hình dạng thoải mái và vừa vặn có thể mở rộng và co lại theo chuyển động của bàn chân mang lại sự thoải mái tốt nhất.</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><span style=\"color: rgb(0, 0, 0);\">Nảy thoải mái</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">Trọng lượng nhẹ và có độ đẩy cao. Bọt Nike React bền. Lượng bọt đã được tăng lên để giảm khối lượng và đệm. Bộ phận Zoom Air cung cấp độ đàn hồi tuyệt vời mỗi khi bạn bước lên nó. Nó được gắn gần chân hơn và tạo ra lực đẩy.</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><br><span style=\"color: rgb(0, 0, 0);\">Phù hợp đáng tin cậy</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">Khi các dây buộc được thắt chặt, phần vải ở giữa bàn chân tạo cảm giác vừa vặn thoải mái.</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><br><span style=\"color: rgb(0, 0, 0);\">Các tính năng khác</span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(157, 156, 156); font-family: Roboto, HelveticaNeue, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">Tăng bọt lưỡi để nâng cao khả năng đệm của mu bàn chân.<br>Màu hiển thị: Bạch kim tinh khiết / Xám sói / Xám sắt / Đỏ Chile<br>Phong cách: CW7356-004<br>Xuất xứ: Indonesia</span></p>', 'http://localhost/storage/photos/1/Products/7.jpeg', 444, '36,39,42,44', 'new', 'active', '690000.00', 4.00, 0, 1, NULL, 2, '2022-07-03 00:51:28', '2022-07-03 00:51:28'),
(19, 'REACT INFINITY RUN FLYKNIT 2', 'react-infinity-run-flyknit-2', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">MINHEST SNEAKERS&nbsp;</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><em>Giày Nike React Infinity Run Flyknit 2 là mẫu giày nâng cấp từ dòng Nike React Infinity Run Flyknit với những cải tiến vượt trội trong công nghệ.</em></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\">Upper vẫn sử dụng chất liệu Flyknit mới nhất được thiết kế theo hình ô caro khác hẳn so với các mẫu Epic. Logo Swoosh, được cách điệu lớn và cứng cáp hơn, sẽ giúp cho phần thân giày cứng cáp hơn.</span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\">Đế giữa được sử dụng 100%&nbsp; bọt React tạo nên sự đàn hồi, hỗ trợ tạo đổ nẩy cho bàn chân trong suốt quá trình di chuyển, tập luyện. Đặc biệt, đôi giày này chỉ có trọng lượng 291 gam- trọng lượng nhẹ hơn bao giờ hết.</span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\">Đế ngoài , được sử dụng cao su cacbon nhằm tăng độ bám với mặt sàn. Theo các nhà thiết kế của NIKE chia sẻ, React Infinity Run FK 2 sẽ giảm chấn thương tới 52% so với Structure 23. Nếu bạn là 1 tín đồ của giày NIKE thì Structure 23&nbsp;là một trong những đôi giày có độ ổn định trong phân khúc giày chạy. Đây chính là điểm ưu việt của Giày Nike React Infinity Run Flyknit 2</span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><span style=\"font-weight: 700;\"><span style=\"display: inline-block;\"><span style=\"display: inline-block;\">Giày Nike React Infinity Run&nbsp;Flyknit 2 chính hãng tại&nbsp;<a href=\"https://myshoes.vn/\" target=\"_blank\" style=\"color: rgb(58, 88, 173); text-decoration-line: underline; touch-action: manipulation; display: inline-block;\">Myshoes.vn</a>&nbsp;được nhập khẩu chính hãng. Full box, đầy đủ phụ kiện.</span></span></span></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-01.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-02.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-03.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-04.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-05.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; text-align: center;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &quot;Times New Roman&quot;, Times, serif;\"><img alt=\"giay nike react infinity run flyknit 2 nam den\" src=\"https://myshoes.vn/image/catalog/2022/nike/8.4/giay-nike-react-infinity-run-flyknit-2-nam-den-06.jpg\" style=\"border: 0px; max-width: 100%; height: auto; align-self: flex-start;\"></span></span></p>', 'http://localhost/storage/photos/1/Products/8.jpeg', 777, '36,39,42,44', 'hot', 'active', '390000.00', 7.00, 0, 1, NULL, 2, '2022-07-03 00:53:08', '2022-07-04 12:22:45'),
(20, 'PEGASUS 38 EAGLES', 'pegasus-38-eagles', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">MINHEST SNEAKERS&nbsp;</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"margin: 10px 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Lato, Arial; background-color: rgb(243, 244, 246);\">- Phần trên của giày&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Nike Air Zoom Pegasus 38 CW7358-601</span>&nbsp;được làm từ chất liệu vải dệt cao cấp với độ ôm được thiết kế đặc biệt để nâng đỡ có định hướng và hỗ trợ chuyển động.</p><p style=\"margin: 10px 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Lato, Arial; background-color: rgb(243, 244, 246);\">- Đế ngoài bằng cao su mềm dẻo tạo độ bám, lớp lót mềm mại mang lại cảm giác thoải mái cho đôi chân.</p><p style=\"margin: 10px 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Lato, Arial; background-color: rgb(243, 244, 246);\">- Form giày đi lên chân vừa vặn, các đường chỉ khâu rất tinh tế và chắc chắn đảm bảo hài lòng mọi khách hàng.</p><p style=\"margin: 10px 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Lato, Arial; background-color: rgb(243, 244, 246);\">- Màu sắc đơn giản rất dễ phối đồ.</p><p style=\"margin: 10px 0px; padding: 0px; color: rgb(68, 68, 68); font-family: Lato, Arial; background-color: rgb(243, 244, 246);\">Giày thể thao Nike luôn là sự lựa chọn hàng đầu bởi sự năng động, trẻ trung, tiện dụng, dễ dàng phối kết hợp với nhiều bộ trang phục và phù hợp đi trong nhiều hoàn cảnh khác nhau.</p>', 'http://localhost/storage/photos/1/Products/5.jpeg', 778, '36,39,42,44', 'hot', 'active', '888000.00', 15.00, 0, 1, NULL, 2, '2022-07-03 00:55:40', '2022-07-03 00:55:40'),
(21, 'ZOOM X INVICIBLE', 'zoom-x-invicible', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">MINHEST SNEAKERS&nbsp;</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Giày NIKE ZOOMX INVINCIBLE RUN - CHIẾN BINH ĐƯỜNG TRƯỜNG - Phiên bản màu Xanh cốm\r\n\r\nNike ZoomX Invincible Run được trang bị công nghệ Flyknit cao cấp trên phần thân giày với các sợi cao su trong suốt đan xen giúp tăng cường độ vững chắc. Bộ đệm công nghệ ZoomX tiên tiến nhất hiện nay, mang đến hiệu quả cao nhất cho từng giai đoạn của mỗi bước chạy.&nbsp;\r\n\r\nHiếm có đôi giày nào vừa mang đến độ đàn hồi cực đại đồng thời có thể cảm nhận sự êm ái tối đa như Nike ZoomX Invincible Run.Phần mũi và gót chân cũng được thiết kế rộng hơn nhằm gia tăng độ ổn định khi chạy bộ.\r\n\r\nPhần đế Với thiết kế đế zoomX cực giày và độ phẳng của đôi giày làm cho các Runner chạy bộ tập được hầu hết các cơ trên bàn chân và cảm nhận rõ nét nhất!\r\n\r\nSau khi trải nghiệm thực tế Nike ZoomX Invincible Run ở những cung đường chạy 21km, 42km, đa số các vận động viên cho biết họ dường như cảm thấy không còn mệt mỏi nhiều trong quá trình nghỉ ngơi, hồi phục sau khi chạy.Nike ZoomX Invincible Run FK.\r\n\r\nMột sự lựa chọn hàng đầu cho một đôi giày chạy bộ tập luyện hàng ngày.</span><br></p>', 'http://localhost/storage/photos/1/Products/10.jpeg', 478, '36,39,42,44', 'new', 'active', '555000.00', 8.00, 0, 1, NULL, 2, '2022-07-03 00:57:04', '2022-07-03 00:57:04'),
(22, 'AIR JORDAN 4 WHITE AND BLACK', 'air-jordan-4-white-and-black', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️ MINHEST SNEAKERS&nbsp;</span><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/1.jpeg', 444, '36,39,42,44', 'hot', 'active', '960000.00', 10.00, 0, 2, NULL, 7, '2022-07-03 01:00:23', '2022-07-04 12:22:38'),
(23, 'JORDAN MA2', 'jordan-ma2', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️ MINHEST SNEAKERS&nbsp;</span><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/22.jpeg', 555, '36,39,42,44', 'hot', 'active', '420000.00', 5.00, 0, 2, NULL, 7, '2022-07-03 01:02:06', '2022-07-03 01:02:06'),
(24, 'DUNK LOW DISRUPT 2', 'dunk-low-disrupt-2', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️ MINHEST SNEAKERS&nbsp;</span><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/33.jpeg', 666, '36,39,42,44', 'new', 'active', '800000.00', 20.00, 0, 2, NULL, 7, '2022-07-03 01:03:05', '2022-07-03 01:03:05'),
(25, 'DUNK LOW BLACK PAISLEY', 'dunk-low-black-paisley', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️ MINHEST SNEAKERS&nbsp;</span><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/66.jpeg', 663, '36,39,42,44', 'default', 'active', '720000.00', 21.00, 0, 2, NULL, 7, '2022-07-03 01:04:07', '2022-07-03 01:04:07'),
(26, 'DUNK LOW PAISLEY', 'dunk-low-paisley', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️ MINHEST SNEAKERS&nbsp;</span><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/88.jpeg', 888, '36,39,42,44', 'hot', 'active', '420000.00', 10.00, 0, 2, NULL, 7, '2022-07-03 01:05:10', '2022-07-03 01:05:10'),
(27, 'DUNK LOW BLUE PAISLEY', 'dunk-low-blue-paisley', '<p><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">⚡️&nbsp;</span><strong style=\"font-weight: bold; font-family: &quot;Roboto Condensed&quot;, sans-serif; color: rgb(91, 91, 91); font-size: 18px;\">MINHEST SNEAKERS&nbsp;</strong><span style=\"color: rgb(91, 91, 91); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">✓15 Ngày Đổi Hàng ✓Giao Hàng Miễn Phí ✓Thanh Toán Khi Nhận Hàng ✓Bảo Hành Hàng Chính Hãng Trọn Đời.!!!</span><br></p>', '<p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f51/1/16/1f449.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;&nbsp;<strong style=\"font-weight: bold;\">MINHESTSNEAKERS \"You\'re King In Your&nbsp;Way\".!!!&nbsp;</strong><img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\">&nbsp;<img alt=\"\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/f9d/1/16/1f45f.png\" style=\"max-width: 100%; margin: 0px auto; height: auto !important;\"></p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91); text-align: center;\"><a href=\"https://kingshoes.vn/king-and-queen\" id=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" title=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" type=\"KING\'S &amp; QUEEN\'S Check in Tại KINGSHOES.VN\" style=\"color: inherit; transition: all 0.4s ease 0s; outline: none;\"><strong style=\"font-weight: bold;\">KING\'S &amp; QUEEN\'S Check in Tại M</strong></a>INHEST SNEAKERS</p><p style=\"font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px; line-height: 1.5em; color: rgb(91, 91, 91);\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\"><strong style=\"font-weight: bold;\">Đến với \"MINHESTSNEAKERS”&nbsp;quý khách hàng sẽ có những sản phẩm ưng ý nhất, chất lượng phục vụ tốt và giá thành tốt nhất, cùng những&nbsp;“ Chương Trình Khuyến Mãi Đặc Biệt”.</strong></strong>&nbsp;</strong></p>', 'http://localhost/storage/photos/1/Products/re.jpeg', 888, '36,39,42,44', 'hot', 'active', '990000', 10.00, 1, 1, NULL, 2, '2022-07-04 12:21:50', '2022-07-04 12:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 31, 26, 5, 'Sản phẩm rất đẹp và rất xứng đáng đồng tiền bỏ ra', 'active', '2022-07-04 12:37:44', '2022-07-04 12:37:44'),
(4, 1, 13, 5, 'Sản phẩm rất tốt', 'active', '2022-07-07 12:31:47', '2022-07-07 12:31:47'),
(5, 1, 17, 5, NULL, 'active', '2022-07-07 12:32:19', '2022-07-07 12:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', '<span style=\"color: rgb(33, 37, 41); font-family: Nunito, Roboto; font-size: 18px;\">Minhest Sneaker</span><span style=\"color: rgb(33, 37, 41); font-family: Nunito, Roboto; font-size: 14px;\">&nbsp;</span><span style=\"font-family: Nunito, Roboto; color: rgb(33, 37, 41); font-size: 18px;\">&nbsp;là website phân phối Online hoàn toàn các sản phẩm giày thể thao, sneaker và thời trang Chính hãng trên toàn quốc. Với định hướng trở thành website giúp người dùng có thể trải nghiệm thời trang được chân thực nhất với những tính năng đặc biệt hơn trong tương lai, giúp người dùng tương tác tốt hơn với sản phẩm.</span>', 'http://localhost/storage/photos/1/logo_sneaker_black.png', 'http://localhost/storage/photos/1/Blog/blog3.png', 'Thị trấn Đông Anh, Hà Nội', '(0982) 303 758', 'minhest.sneakers@gmail.com', NULL, '2022-06-20 21:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'GHTK', '30000.00', 'active', '2022-06-20 21:02:35', '2022-06-20 21:02:35'),
(6, 'Viettel Post', '40000.00', 'active', '2022-06-20 21:02:49', '2022-06-20 21:02:49'),
(7, 'AhaMove', '15000.00', 'active', '2022-06-20 21:03:12', '2022-06-20 21:03:12'),
(8, 'J&T Express', '33000.00', 'active', '2022-06-20 21:03:31', '2022-06-20 21:03:31'),
(9, 'Ninja Van', '24000.00', 'active', '2022-06-20 21:03:50', '2022-06-20 21:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'MInhest Sneakers', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', 'http://localhost/storage/photos/1/users/logo_sneaker_black.png', 'admin', NULL, NULL, 'active', 'MlBZVuR2mdOh4faA5UOAtDNoXxOMpMMpiEbUZwJcPwL9ShFB31pccMu7Q3UA', NULL, '2022-06-20 21:06:06'),
(30, 'Ngô Nguyễn Khắc Minh', 'minhanh.nvd@gmail.com', NULL, '$2y$10$749aZhM4meRe6O/D9YENcOFjSNgv2wiQUq4QJTjtjX7Tq3dEfdwQ.', 'http://localhost/storage/photos/1/user.jpg', 'user', NULL, NULL, 'active', NULL, '2022-07-03 01:11:22', '2022-07-03 01:12:39'),
(31, 'Dev Nguyen', 'ngonguyenkminh@gmail.com', NULL, '$2y$10$rXwzHoghG4JqLWP4/m1cNONdZNfZ/x5l1/xi5BHrGb0LqtaP3bfp.', 'http://localhost/storage/photos/1/logo_no_text.png', 'user', NULL, NULL, 'active', NULL, '2022-07-04 12:24:06', '2022-07-04 12:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
