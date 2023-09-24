-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2023 at 06:04 AM
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
-- Table structure for table `compares`
--

CREATE TABLE `compares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `created_at`, `updated_at`) VALUES
(2, 'EZSNEAKERS TESTING', 5, '2023-08-30', 1, '2023-08-18 06:56:27', '2023-08-18 06:56:27'),
(3, 'TESTING COUPON', 90, '2023-08-20', 1, '2023-08-20 16:57:34', NULL),
(4, 'ALDOUS', 69, '3000-09-30', 1, '2023-09-05 21:29:18', NULL);

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
(15, '2023_07_25_140025_create_banners_table', 7),
(16, '2023_08_11_045421_create_wishlists_table', 8),
(17, '2023_08_12_013923_create_compares_table', 9),
(18, '2023_08_18_134244_create_coupons_table', 10),
(19, '2023_08_19_010901_create_ship_divisions_table', 11),
(20, '2023_08_19_011032_create_ship_districs_table', 11),
(21, '2023_08_19_011157_create_ship_states_table', 11),
(22, '2023_09_16_122134_create_orders_table', 12),
(23, '2023_09_16_123324_create_order_items_table', 12);

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
(33, 11, 'upload/products/multi-image/1772730756044931.png', '2023-07-28 21:16:32', NULL),
(34, 12, 'upload/products/multi-image/1774465477814141.jpg', '2023-08-17 00:49:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_month` varchar(255) NOT NULL,
  `order_year` varchar(255) NOT NULL,
  `confirmed_date` varchar(255) DEFAULT NULL,
  `processing_date` varchar(255) DEFAULT NULL,
  `picked_date` varchar(255) DEFAULT NULL,
  `shipped_date` varchar(255) DEFAULT NULL,
  `delivered_date` varchar(255) DEFAULT NULL,
  `cancel_date` varchar(255) DEFAULT NULL,
  `return_date` varchar(255) DEFAULT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `division_id`, `district_id`, `state_id`, `name`, `email`, `phone`, `address`, `post_code`, `notes`, `payment_type`, `payment_method`, `transaction_id`, `currency`, `amount`, `order_number`, `invoice_no`, `order_date`, `order_month`, `order_year`, `confirmed_date`, `processing_date`, `picked_date`, `shipped_date`, `delivered_date`, `cancel_date`, `return_date`, `return_reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', 'testing', 'card_1NrBp4JyMbg1UYGzmOuVni4y', 'Stripe', 'txn_3NrBp5JyMbg1UYGz0KL9HYiz', 'usd', 4543.00, '650674d906c3a', 'EOS33983577', '17 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-16 19:39:06', NULL),
(2, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', 'test 2', 'card_1NrDEdJyMbg1UYGzCB7FZefy', 'Stripe', 'txn_3NrDEhJyMbg1UYGz1vd5mDkG', 'usd', 391.00, '65068a0ce4270', 'EOS80954915', '17 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-16 21:09:36', NULL),
(3, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NrVHpJyMbg1UYGz8hLU46kG', 'Stripe', 'txn_3NrVHrJyMbg1UYGz0yDMSYh2', 'usd', 4565.00, '6507991abd0f3', 'EOS69039541', '18 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 16:26:04', NULL),
(4, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NrciOJyMbg1UYGzvGRH5hqT', 'Stripe', 'txn_3NrciQJyMbg1UYGz1BsGs5ew', 'usd', 1919.00, '650808a55b760', 'EOS75209830', '18 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-18 00:22:02', NULL),
(5, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NrdzuJyMbg1UYGzpI5vPIS2', 'Stripe', 'txn_3NrdzwJyMbg1UYGz085cSyrF', 'usd', 3007.00, '65081be80958c', 'EOS41183076', '18 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-18 01:44:09', NULL),
(6, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NreBXJyMbg1UYGzkdllh7h6', 'Stripe', 'txn_3NreBZJyMbg1UYGz1JHftVzB', 'usd', 2931.00, '65081eb8e07c2', 'EOS56658583', '18 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-18 01:56:10', NULL),
(7, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', 'cash on delivery testing', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 1781.00, NULL, 'EOS99218803', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 06:10:51', NULL),
(8, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1Ns5HgJyMbg1UYGz3FOyXPGU', 'Stripe', 'txn_3Ns5HhJyMbg1UYGz1hwIVxp2', 'usd', 3228.00, '6509b5a0e50e7', 'EOS30324233', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 06:52:20', NULL),
(9, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1Ns5IqJyMbg1UYGzAWpi32Lx', 'Stripe', 'txn_3Ns5IsJyMbg1UYGz1rK8w5eF', 'usd', 3228.00, '6509b5e98b913', 'EOS44460247', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 06:53:30', NULL),
(10, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1Ns5MCJyMbg1UYGzkfHhFGxN', 'Stripe', 'txn_3Ns5MDJyMbg1UYGz1nLv0uya', 'usd', 3228.00, '6509b6b8979ec', 'EOS94286545', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 06:56:58', NULL),
(11, 3, 3, 4, 5, 'User', 'testing@gmail.com', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1Ns5PkJyMbg1UYGzNzXGIzuX', 'Stripe', 'txn_3Ns5PlJyMbg1UYGz0tuKIeEt', 'usd', 4467.00, '6509b7951ada5', 'EOS31316463', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 07:00:38', NULL),
(12, 3, 3, 4, 5, 'User', 'testing@gmail.com', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1Ns5QgJyMbg1UYGzBRYoeNS0', 'Stripe', 'txn_3Ns5QhJyMbg1UYGz0q4Lovln', 'usd', 4467.00, '6509b7ceec3e4', 'EOS46254023', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 07:01:36', NULL),
(13, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 13500.00, NULL, 'EOS81750000', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 07:06:44', NULL),
(14, 3, 3, 4, 6, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 13500.00, NULL, 'EOS74476717', '19 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 07:08:03', NULL),
(15, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NsJB5JyMbg1UYGzy6QYkTrI', 'Stripe', 'txn_3NsJB7JyMbg1UYGz1wWtUrx9', 'usd', 7843.00, '650a86415402c', 'EOS39676552', '20 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-19 21:42:29', NULL),
(16, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NsPQ0JyMbg1UYGzFymGaWxG', 'Stripe', 'txn_3NsPQ1JyMbg1UYGz1Mi9yMIB', 'usd', 2931.00, '650ae3f5c42d2', 'EOS45455836', '20 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-20 04:22:15', NULL),
(17, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NsPReJyMbg1UYGzVtoFveDn', 'Stripe', 'txn_3NsPRfJyMbg1UYGz0ct8MIM5', 'usd', 2931.00, '650ae45bbbfe5', 'EOS25223996', '20 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-20 04:23:57', NULL),
(18, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NtLpUJyMbg1UYGz9u1fGePw', 'Stripe', 'txn_3NtLpVJyMbg1UYGz0CdismzZ', 'usd', 6003.00, '650e510884819', 'EOS24051735', '23 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-22 18:44:27', NULL),
(19, 3, 3, 4, 5, 'User', 'ivansamwabina@gmail.com', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NtSkmJyMbg1UYGzABPcz8Zo', 'Stripe', 'txn_3NtSknJyMbg1UYGz0iWu9Pqk', 'usd', 1395.00, '650eb90095c70', 'EOS97434962', '23 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-23 02:08:03', NULL),
(20, 3, 3, 4, 5, 'User', 'isrwabina@addu.edu.ph', '09268827283', 'Villa Patricia, Mankilam', '8100', NULL, 'card_1NtSnKJyMbg1UYGzvKTZ0WLM', 'Stripe', 'txn_3NtSnLJyMbg1UYGz1PCged2k', 'usd', 4500.00, '650eb99ebd9e1', 'EOS20715107', '23 September 2023', 'September', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2023-09-23 02:10:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `qty` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `vendor_id`, `color`, `size`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2', 'white', '7', '1', 5200.00, '2023-09-16 19:39:06', NULL),
(2, 1, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-16 19:39:06', NULL),
(3, 1, 3, '16', NULL, NULL, '1', 4955.00, '2023-09-16 19:39:06', NULL),
(4, 2, 10, '2', 'Red', 'Small', '1', 12.00, '2023-09-16 21:09:36', NULL),
(5, 2, 11, '2', 'Red', '11', '1', 2.00, '2023-09-16 21:09:36', NULL),
(6, 2, 6, NULL, 'Red', NULL, '1', 1234.00, '2023-09-16 21:09:36', NULL),
(7, 2, 9, '16', 'Red', 'Small', '1', 12.00, '2023-09-16 21:09:36', NULL),
(8, 3, 3, '16', NULL, NULL, '1', 4955.00, '2023-09-17 16:26:04', NULL),
(9, 3, 1, '2', 'white', '7', '1', 5200.00, '2023-09-17 16:26:04', NULL),
(10, 3, 10, '2', 'Red', 'Small', '6', 12.00, '2023-09-17 16:26:04', NULL),
(11, 3, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-17 16:26:04', NULL),
(12, 4, 3, '16', NULL, NULL, '1', 4955.00, '2023-09-18 00:22:02', NULL),
(13, 4, 6, NULL, 'Red', NULL, '1', 1234.00, '2023-09-18 00:22:02', NULL),
(14, 5, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-18 01:44:09', NULL),
(15, 5, 1, '2', 'white', '7', '1', 5200.00, '2023-09-18 01:44:09', NULL),
(16, 6, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-18 01:56:10', NULL),
(17, 6, 3, '16', NULL, NULL, '1', 4955.00, '2023-09-18 01:56:10', NULL),
(18, 7, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-19 06:10:51', NULL),
(19, 7, 6, NULL, 'Red', NULL, '1', 1234.00, '2023-09-19 06:10:51', NULL),
(20, 7, 7, NULL, 'Red', 'Small', '1', 12.00, '2023-09-19 06:10:51', NULL),
(21, 10, 1, '2', 'white', '7', '2', 5200.00, '2023-09-19 06:57:03', NULL),
(22, 10, 10, '2', 'Red', 'Small', '1', 12.00, '2023-09-19 06:57:03', NULL),
(23, 12, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-19 07:01:41', NULL),
(24, 12, 3, '16', NULL, NULL, '2', 4955.00, '2023-09-19 07:01:41', NULL),
(25, 14, 2, NULL, 'Red', '5', '3', 4500.00, '2023-09-19 07:08:08', NULL),
(26, 15, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-19 21:42:36', NULL),
(27, 15, 1, '2', 'white', '7', '4', 5200.00, '2023-09-19 21:42:36', NULL),
(28, 18, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-22 18:44:32', NULL),
(29, 18, 3, '16', NULL, NULL, '3', 4955.00, '2023-09-22 18:44:32', NULL),
(30, 19, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-23 02:08:12', NULL),
(31, 20, 2, NULL, 'Red', '5', '1', 4500.00, '2023-09-23 02:10:47', NULL);

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
(11, 2, 1, 6, '2', 'something shoeeess', 'something-shoeeess', '12313', '0', 'new product, top product', '11,12,13', 'Red, Blue, Black', '12', '2', 'asdwqasdqwdasd', '<p>Hello, World!</p>', 'upload/products/thumbnail/1772730755261322.png', 1, 1, 1, 1, 1, '2023-08-07 03:06:12', '2023-08-07 03:06:12'),
(12, 2, 2, 12, NULL, 'Christian Prado', 'christian-prado', '123', '2', 'new product, top product', '11,12', 'Red, Blue, Black', '123', '123', 'kjasdoiansdoinoiqwe', '<p>Hello, World!</p>', 'upload/products/thumbnail/1774465476352460.jpg', 1, NULL, NULL, NULL, 0, '2023-08-17 00:49:11', '2023-08-23 17:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `ship_districs`
--

CREATE TABLE `ship_districs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_districs`
--

INSERT INTO `ship_districs` (`id`, `division_id`, `district_name`, `created_at`, `updated_at`) VALUES
(2, 2, 'testing', NULL, NULL),
(3, 3, 'Davao del Norte', NULL, NULL),
(4, 3, 'Region 11 district testing', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_divisions`
--

CREATE TABLE `ship_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_divisions`
--

INSERT INTO `ship_divisions` (`id`, `division_name`, `created_at`, `updated_at`) VALUES
(2, 'Division Test', NULL, NULL),
(3, 'Region 11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_states`
--

CREATE TABLE `ship_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_states`
--

INSERT INTO `ship_states` (`id`, `division_id`, `district_id`, `state_name`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 'okadisfwear', NULL, NULL),
(4, 3, 3, 'Tagum CIty', NULL, NULL),
(5, 3, 4, 'state testing', NULL, NULL),
(6, 3, 4, 'sdfawerfasdf', NULL, NULL);

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
(2, 'Nest Food.,Ltd', 'vendor', 'vendor@gmail.com', NULL, '$2y$10$PyOzt65.aX4LMLGUvz/5k.tV4C9SHFV3XZsOYPL2yIHR7ZV94hTLG', '202307130242vendor-15.png', '540-025-124553', '5171 W Campbell Ave undefined, Utah 53127 United States', '2023', 'Got a smooth, buttery spread in your fridge? Chances are good that it\'s Good Chef. This brand made Lionto\'s list of the most popular grocery brands across the country.', 'vendor', 'active', NULL, NULL, '2023-09-22 21:01:43'),
(3, 'User', 'user', 'user@gmail.com', NULL, '$2y$10$6LuePCajUVQ/KqNz761s/.X29FfsE.fy80EEgD3Hr1p4MmLGwVW5e', '202307150419cat-3.png', '09268827283', NULL, NULL, NULL, 'user', 'active', NULL, NULL, '2023-08-10 21:27:48'),
(15, 'Walton', 'walton', 'walton@gmail.com', NULL, '$2y$10$taOSnwF2xvEOOU4m0jgU3OAhUomxZAqWyFPPDu0asbK53AiZXNAYi', NULL, '0926882', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-08-07 01:25:38'),
(16, 'Sonny', 'sonny', 'sonny@gmail.com', NULL, '$2y$10$8ssYS3a5wuSRWDiiiFIkXOsU0NSTCXowdV4FFnOOIirq72YuGs0iG', NULL, '092648', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-07-18 02:23:47'),
(17, 'Expert Fasion', 'expert', 'expert@gmail.com', NULL, '$2y$10$4G2W8t2BLbvrakZgJk8W/e54VSjX8eiSbjuDHaT/zyDpumgaCbBDm', NULL, '013564', NULL, '2022', NULL, 'vendor', 'active', NULL, NULL, '2023-07-28 18:56:16'),
(18, 'ivan', NULL, 'ivansamwabina@gmail.com', NULL, '$2y$10$b3Qgk0vXpav9n31KyGWV/.4CLZEvd.klYT936MxLmZrVwRQcdinlW', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2023-08-11 03:05:21', '2023-08-11 03:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(10, 18, 6, '2023-08-11 03:06:50', NULL),
(11, 18, 7, '2023-08-11 03:06:55', NULL),
(18, 2, 3, '2023-08-17 17:47:55', NULL),
(19, 2, 2, '2023-08-17 17:47:56', NULL),
(20, 2, 6, '2023-08-17 17:49:20', NULL);

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
-- Indexes for table `compares`
--
ALTER TABLE `compares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

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
-- Indexes for table `ship_districs`
--
ALTER TABLE `ship_districs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_states`
--
ALTER TABLE `ship_states`
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
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `compares`
--
ALTER TABLE `compares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ship_districs`
--
ALTER TABLE `ship_districs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ship_states`
--
ALTER TABLE `ship_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
