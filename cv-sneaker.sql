-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 03:45 AM
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
-- Database: `cv-sneaker`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_title` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `banner_title`, `banner_url`, `banner_image`, `created_at`, `updated_at`) VALUES
(2, 'test', 'https://www.youtube.com/watch?v=mMMm2wx24lc', 'upload/banner/1772405813867754.png', NULL, '2023-07-25 21:10:38'),
(3, 'test 2', 'testing 2', 'upload/banner/1772458309724565.png', NULL, NULL),
(4, 'test 3', 'testing 3', 'upload/banner/1772458329449861.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_slug` varchar(255) NOT NULL,
  `brand_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `brand_image`, `created_at`, `updated_at`) VALUES
(2, 'Jordan 1 Low', 'jordan-1-low', 'upload/brand/1771550291394705.jpg', NULL, '2023-07-18 20:37:24'),
(3, 'Dunk Low', 'dunk-low', 'upload/brand/1771550327582481.png', NULL, NULL),
(4, 'Jorj', 'jorj', 'upload/brand/1772046694162363.webp', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 'fashion', 'upload/category/1771632278731814.png', NULL, '2023-07-16 18:17:09'),
(2, 'Electronics', 'electronics', 'upload/category/1772453615396990.png', NULL, '2023-07-25 19:51:30'),
(3, 'Appliance', 'appliance', 'upload/category/1771631582615040.jpg', NULL, NULL),
(5, 'Sweet Home', 'sweet-home', 'upload/category/1771640122337799.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2023_07_16_024603_create_brands_table', 2),
(10, '2023_07_17_011425_create_categories_table', 3),
(11, '2023_07_17_025611_create_sub_categories_table', 4),
(12, '2023_07_19_011407_create_products_table', 5),
(13, '2023_07_19_012546_create_multi_images_table', 5),
(14, '2023_07_24_133839_create_sliders_table', 6),
(15, '2023_07_25_140025_create_banners_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `multi_images`
--

CREATE TABLE `multi_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_images`
--

INSERT INTO `multi_images` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'upload/products/multi-image/1771937995780288.jpg', '2023-07-20 03:15:56', NULL),
(2, 1, 'upload/products/multi-image/1771937995867798.jpg', '2023-07-20 03:15:57', NULL),
(3, 1, 'upload/products/multi-image/1772038227726155.webp', '2023-07-20 03:15:57', '2023-07-21 05:49:05'),
(4, 2, 'upload/products/multi-image/1771938535800310.jpg', '2023-07-20 03:24:32', NULL),
(5, 2, 'upload/products/multi-image/1771938535976568.jpg', '2023-07-20 03:24:32', NULL),
(6, 2, 'upload/products/multi-image/1771938536105156.jpg', '2023-07-20 03:24:32', NULL),
(7, 3, 'upload/products/multi-image/1771941661585764.jpg', '2023-07-20 04:14:13', NULL),
(8, 3, 'upload/products/multi-image/1771941661774571.jpg', '2023-07-20 04:14:13', NULL),
(9, 3, 'upload/products/multi-image/1771941661908971.jpg', '2023-07-20 04:14:13', NULL),
(15, 6, 'upload/products/multi-image/1772537084499718.png', '2023-07-26 17:58:12', NULL),
(16, 6, 'upload/products/multi-image/1772537084911667.png', '2023-07-26 17:58:13', NULL),
(17, 6, 'upload/products/multi-image/1772537085305999.png', '2023-07-26 17:58:13', NULL),
(18, 6, 'upload/products/multi-image/1772537085692212.png', '2023-07-26 17:58:13', NULL),
(19, 7, 'upload/products/multi-image/1772668930964844.png', '2023-07-28 04:53:51', NULL),
(20, 7, 'upload/products/multi-image/1772668931097238.png', '2023-07-28 04:53:51', NULL),
(21, 7, 'upload/products/multi-image/1772668931180188.png', '2023-07-28 04:53:51', NULL),
(22, 8, 'upload/products/multi-image/1772669452360054.jpg', '2023-07-28 05:02:08', NULL),
(23, 8, 'upload/products/multi-image/1772669452524751.jpg', '2023-07-28 05:02:08', NULL),
(24, 8, 'upload/products/multi-image/1772669452682711.jpg', '2023-07-28 05:02:08', NULL),
(25, 9, 'upload/products/multi-image/1772673502073716.jpg', '2023-07-28 06:06:30', NULL),
(26, 9, 'upload/products/multi-image/1772673502163606.jpg', '2023-07-28 06:06:30', NULL),
(27, 9, 'upload/products/multi-image/1772673502252196.jpg', '2023-07-28 06:06:30', NULL),
(28, 10, 'upload/products/multi-image/1772730704806429.png', '2023-07-28 21:15:43', NULL),
(29, 11, 'upload/products/multi-image/1772730755656485.png', '2023-07-28 21:16:31', NULL),
(30, 11, 'upload/products/multi-image/1772730755764950.png', '2023-07-28 21:16:31', NULL),
(31, 11, 'upload/products/multi-image/1772730755855595.png', '2023-07-28 21:16:31', NULL),
(32, 11, 'upload/products/multi-image/1772730755951736.png', '2023-07-28 21:16:31', NULL),
(33, 11, 'upload/products/multi-image/1772730756044931.png', '2023-07-28 21:16:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_slug` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_qty` varchar(255) NOT NULL,
  `product_tags` varchar(255) DEFAULT NULL,
  `product_size` varchar(255) DEFAULT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `selling_price` varchar(255) NOT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `short_descp` text NOT NULL,
  `long_descp` text NOT NULL,
  `product_thumbnail` varchar(255) NOT NULL,
  `hot_deals` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `special_offer` int(11) DEFAULT NULL,
  `special_deals` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `subcategory_id`, `vendor_id`, `product_name`, `product_slug`, `product_code`, `product_qty`, `product_tags`, `product_size`, `product_color`, `selling_price`, `discount_price`, `short_descp`, `long_descp`, `product_thumbnail`, `hot_deals`, `featured`, `special_offer`, `special_deals`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 6, '2', 'Night Maroon', 'night-maroon', '1111', '1', 'new product, top product', '7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 12, 13', 'white', '5200', NULL, 'something something short description...........................', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772461123369972.jpg', 1, NULL, NULL, NULL, 1, '2023-07-26 18:04:48', '2023-07-26 18:04:48'),
(2, 3, 1, 2, NULL, 'Sundial', 'sundial', '1212', '1', 'new product, top product', '5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10', 'Red', '4995', '4500', 'adasdasdasd', '<p>adasdwqedasdqwdasdwqdasdwqdasdw</p>', 'upload/products/thumbnail/1772461075189319.webp', NULL, 1, 1, NULL, 1, '2023-07-26 18:04:43', '2023-07-26 18:04:43'),
(3, 3, 2, 4, '16', 'Ivan', 'ivan', '1212', '1', 'shoe,hello', NULL, NULL, '52000', '4955', 'sdfoiasdiofnoiwaemfasdf', '<p>paodmspojwqepojapsdkopwepoaisdopqopweiaopsidopqwieopisapdoiopwiqeqweasd</p>', 'upload/products/thumbnail/1771941660903663.jpg', 1, NULL, NULL, NULL, 1, '2023-07-26 18:04:32', '2023-07-26 18:04:32'),
(6, 2, 1, 1, NULL, 'testing1', 'testing1', '1234', '1', 'new product', NULL, 'Red, Blue', '1234', NULL, 'testing description', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772537083769781.png', 1, NULL, NULL, 1, 1, '2023-07-26 18:04:27', '2023-07-26 18:04:27'),
(7, 2, 1, 2, NULL, 'fashion testing', 'fashion-testing', '123', '1', 'new product, top product', 'Small, Medium, Large', 'Red, Blue, Black', '123', '12', 'asdwq', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772668930651699.png', NULL, 1, 1, NULL, 1, '2023-07-28 04:53:50', NULL),
(8, 2, 3, 11, NULL, 'appliance testing', 'appliance-testing', '231', '1', 'new product, top product', 'Small, Medium, Large', 'Red, Blue, Black', '123', NULL, 'asdqwdasdwqe', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772669452181808.jpg', NULL, 1, 1, NULL, 1, '2023-07-28 05:02:08', NULL),
(9, 2, 2, 12, '16', 'Hot Deals testing', 'hot-deals-testing', '1', '1', 'new product, top product', 'Small, Medium, Large', 'Red, Blue, Black', '123', '12', 'asdasd', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772673501968751.png', 1, NULL, NULL, 1, 1, '2023-07-28 06:06:30', NULL),
(10, 2, 5, 8, '2', 'heyyoooo', 'heyyoooo', '123', '1', 'new product, top product', 'Small, Medium, Large', 'Red, Blue, Black', '1234213', '12', 'asdwqasd', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772730703998558.png', 1, 1, 1, 1, 1, '2023-07-28 21:15:43', NULL),
(11, 2, 1, 6, '2', 'something shoeeess', 'something-shoeeess', '12313', '0', 'new product, top product', 'Small, Medium, Large', 'Red, Blue, Black', '12', '2', 'asdwqasdqwdasd', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772730755261322.png', 1, 1, 1, 1, 1, '2023-07-28 21:16:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_title` varchar(255) NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `slider_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_title`, `short_title`, `slider_image`, `created_at`, `updated_at`) VALUES
(1, 'test', 'testing', 'upload/slider/1772458053149054.png', NULL, '2023-07-25 21:02:02'),
(2, 'test 2', 'testing 2', 'upload/slider/1772311775867374.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `subcategory_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name`, `subcategory_slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mans Top Ware', 'mans-top-ware', NULL, '2023-07-16 20:40:08'),
(2, 1, 'Mans Bottom Ware', 'mans-bottom-ware', NULL, NULL),
(3, 2, 'Computer Peripherals', 'computer-peripherals', NULL, NULL),
(4, 2, 'Mobile Accessory', 'mobile-accessory', NULL, NULL),
(6, 1, 'Women Footwear', 'women-footwear', NULL, NULL),
(7, 5, 'Living Room', 'living-room', NULL, NULL),
(8, 5, 'Home Decor', 'home-decor', NULL, NULL),
(9, 3, 'Television', 'television', NULL, '2023-07-19 18:09:21'),
(10, 3, 'Washing Machine', 'washing-machine', NULL, NULL),
(11, 3, 'Refrigerator', 'refrigerator', NULL, NULL),
(12, 2, 'Computer', 'computer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `vendor_join` varchar(255) DEFAULT NULL,
  `vendor_short_info` text DEFAULT NULL,
  `role` enum('admin','user','vendor') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `vendor_join`, `vendor_short_info`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$9TWAk7kJy9mIMiPOnPJQwuJwqMKEUvgvN5DjDOLz8EDsCSYyDVTji', NULL, NULL, NULL, NULL, NULL, 'admin', 'active', NULL, NULL, '2023-07-12 18:23:29'),
(2, 'Nest Food.,Ltd', 'vendor', 'vendor@gmail.com', NULL, '$2y$10$PyOzt65.aX4LMLGUvz/5k.tV4C9SHFV3XZsOYPL2yIHR7ZV94hTLG', '202307130242vendor-15.png', '540-025-124553', '5171 W Campbell Ave undefined, Utah 53127 United States', '2023', 'Got a smooth, buttery spread in your fridge? Chances are good that it\'s Good Chef. This brand made Lionto\'s list of the most popular grocery brands across the country.', 'vendor', 'active', NULL, NULL, '2023-07-28 17:35:44'),
(3, 'User', 'user', 'user@gmail.com', NULL, '$2y$10$0E0nzV/btZAQXwnZkfMwF.oR.L.eyBWZ2ucETzyUdbew/M8fGI746', '202307150419cat-3.png', '09268827283', NULL, NULL, NULL, 'user', 'active', NULL, NULL, '2023-07-21 08:04:58'),
(15, 'Walton', 'walton', 'walton@gmail.com', NULL, '$2y$10$taOSnwF2xvEOOU4m0jgU3OAhUomxZAqWyFPPDu0asbK53AiZXNAYi', NULL, '0926882', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-07-28 18:56:11'),
(16, 'Sonny', 'sonny', 'sonny@gmail.com', NULL, '$2y$10$8ssYS3a5wuSRWDiiiFIkXOsU0NSTCXowdV4FFnOOIirq72YuGs0iG', NULL, '092648', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-07-18 02:23:47'),
(17, 'Expert Fasion', 'expert', 'expert@gmail.com', NULL, '$2y$10$4G2W8t2BLbvrakZgJk8W/e54VSjX8eiSbjuDHaT/zyDpumgaCbBDm', NULL, '013564', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-07-28 18:56:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_images`
--
ALTER TABLE `multi_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
