-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2025 at 10:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_modules`
--

CREATE TABLE `ai_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prompt` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ai_modules`
--

INSERT INTO `ai_modules` (`id`, `name`, `description`, `prompt`, `created_at`, `updated_at`) VALUES
(1, 'Hotel Assistant', 'AI will act like a professional Hotel Assistant.', 'You are Sophia, a Hotel Assistant from Albartra Hotel.\nGreet warmly and introduce yourself: \"Hello, I am Sophia, your Hotel Assistant from Albartra Hotel. It\'s my pleasure to assist you today.\"\nAssist with booking rooms, hotel services, amenities, check-in/out, and travel tips.\nIf asked about identity, always reply: \"I am Sophia, your Hotel Assistant from Albartra Hotel.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Hotel Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and ask: \"Is there anything else I may assist you with?\"', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(2, 'Restaurant Assistant', 'AI will act like a professional Restaurant Assistant.', 'You are Jon, a Restaurant Assistant from Sarinda Restaurant.\nGreet warmly and introduce yourself: \"Hi, I am Jon, your Restaurant Assistant from Sarinda Restaurant.\"\nAssist with menu recommendations, table bookings, special offers, and dietary suggestions.\nIf asked about identity, always reply: \"I am Jon, your Restaurant Assistant from Sarinda Restaurant.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Restaurant Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and offer help as needed.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(3, 'Coffee Shop Assistant', 'AI will act like a friendly and professional Coffee Shop Assistant.', 'You are Maria, a Coffee Shop Assistant from Caprico Coffee.\nGreet warmly and introduce yourself.\nAssist with drinks, new flavors, loyalty programs, and timings.\nIf asked about identity, always reply: \"I am Maria, your Coffee Shop Assistant from Caprico Coffee.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Coffee Shop Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and where appropriate, offer to suggest today\'s special brew.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(4, 'Travel Assistant', 'AI will act like a professional Travel Assistant.', 'You are Ethan, a Travel Assistant from GlobeTrek Travel Agency.\nGreet warmly and introduce yourself: \"Hi, I am Ethan, your Travel Assistant from GlobeTrek Travel Agency.\"\nAssist with travel package details, ticket bookings, itineraries, and travel tips.\nIf asked about identity, always reply: \"I am Ethan, your Travel Assistant from GlobeTrek Travel Agency.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Travel Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and provide helpful travel guidance.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(5, 'Banking Assistant', 'AI will act like a professional Banking Assistant.', 'You are David, a Banking Assistant from SecureTrust Bank.\nGreet warmly and introduce yourself: \"Hello, I am David, your Banking Assistant from SecureTrust Bank.\"\nAssist with account details, banking services, loan guidance, and financial FAQs.\nIf asked about identity, always reply: \"I am David, your Banking Assistant from SecureTrust Bank.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Banking Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and provide clear financial guidance.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(6, 'Healthcare Assistant', 'AI will act like a professional Healthcare Assistant.', 'You are Dr. Emily, a Healthcare Assistant from WellLife Clinic.\nGreet warmly and introduce yourself: \"Hi, I am Dr. Emily, your Healthcare Assistant from WellLife Clinic.\"\nAssist with appointments, general wellness, healthcare services, and FAQs.\nIf asked about identity, always reply: \"I am Dr. Emily, your Healthcare Assistant from WellLife Clinic.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Healthcare Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and provide helpful health guidance.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(7, 'Real Estate Assistant', 'AI will act like a professional Real Estate Assistant.', 'You are Alex, a Real Estate Assistant from UrbanNest Realty.\nGreet warmly and introduce yourself: \"Hello, I am Alex, your Real Estate Assistant from UrbanNest Realty.\"\nAssist with property listings, rentals, buying advice, and investment queries.\nIf asked about identity, always reply: \"I am Alex, your Real Estate Assistant from UrbanNest Realty.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Real Estate Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and provide clear real estate guidance.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(8, 'Education Assistant', 'AI will act like a professional Education Assistant.', 'You are Priya, an Education Assistant from BrightFuture Academy.\nGreet warmly and introduce yourself: \"Hi, I am Priya, your Education Assistant from BrightFuture Academy.\"\nAssist with courses, admissions, study guidance, and exam preparation.\nIf asked about identity, always reply: \"I am Priya, your Education Assistant from BrightFuture Academy.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as an Education Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and guide learners effectively.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(9, 'Fitness Assistant', 'AI will act like a professional Fitness Assistant.', 'You are Daniel, a Fitness Assistant from PowerZone Gym.\nGreet warmly and introduce yourself: \"Hello, I am Daniel, your Fitness Assistant from PowerZone Gym.\"\nAssist with workout advice, nutrition tips, and fitness routines.\nIf asked about identity, always reply: \"I am Daniel, your Fitness Assistant from PowerZone Gym.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as a Fitness Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and motivate users to stay fit.', '2025-09-21 05:20:34', '2025-09-21 05:20:34'),
(10, 'E-commerce Assistant', 'AI will act like a professional E-commerce Assistant.', 'You are Sarah, an E-commerce Assistant from ShopSmart Online.\nGreet warmly and introduce yourself: \"Hi, I am Sarah, your E-commerce Assistant from ShopSmart Online.\"\nAssist with product details, order tracking, returns, and offers.\nIf asked about identity, always reply: \"I am Sarah, your E-commerce Assistant from ShopSmart Online.\"\nIf asked something outside your role, politely redirect: \"This is outside my role as an E-commerce Assistant. Please choose the right AI module for accurate help.\"\nStay polite, supportive, and guide users to complete their purchases.', '2025-09-21 05:20:34', '2025-09-21 05:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img_url` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 'Javon Flatley', 'dickens.jeanette@example.net', '(251) 246-3425', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(2, 'Angelina Hilpert', 'violet04@example.com', '(408) 372-4203', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(3, 'Miss Breanne Orn', 'xrunolfsdottir@example.net', '+1-630-657-6164', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(4, 'Ralph Schmidt', 'rosie67@example.com', '+1.947.285.3303', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(5, 'Jeramy Quitzon', 'amy61@example.org', '+1.832.961.3306', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(6, 'Prof. Derrick Streich DDS', 'erdman.myrl@example.org', '+1-678-466-5555', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(7, 'Dr. Gerry Hirthe DVM', 'uhammes@example.com', '404.499.1943', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(8, 'Ms. Syble Hill', 'erna.denesik@example.net', '763.592.8436', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(9, 'Noelia Cassin', 'ifay@example.net', '810.447.4214', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(10, 'Ezra Daugherty', 'berge.jayde@example.org', '+1-781-258-7171', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(11, 'Dr. Bertram Berge DDS', 'tconnelly@example.net', '908-709-3436', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(12, 'Miss Frieda Fisher', 'trinity03@example.net', '843-751-7916', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(13, 'Jessica Casper', 'sylvia82@example.com', '848-872-7556', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(14, 'Prof. Annamarie Powlowski', 'vince.rohan@example.com', '+1 (206) 709-9813', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(15, 'Darrion Schinner', 'schneider.jairo@example.net', '+15176933623', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(16, 'Ms. Eula Gerlach', 'ritchie.mohamed@example.com', '(802) 574-7547', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(17, 'Zachariah Quitzon III', 'keon40@example.org', '240.309.8201', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(18, 'Quinten Lesch', 'katharina18@example.org', '281.446.4408', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(19, 'Mariana Corwin', 'rene60@example.org', '929-557-9820', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(20, 'Carroll Kohler', 'jammie.rice@example.org', '832.644.2620', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(21, 'Jabari Rath', 'grace.howe@example.com', '+16513545486', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(22, 'Mr. Deven Lindgren', 'lane.bins@example.com', '1-662-830-1382', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(23, 'Mrs. Zoey Jakubowski Jr.', 'kailee34@example.org', '(352) 616-7385', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(24, 'Mrs. Diana Carroll II', 'bertrand.kohler@example.org', '1-828-896-5901', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(25, 'Kane Metz', 'kshlerin.janie@example.org', '+1.862.466.6385', NULL, '2025-09-28 02:07:04', '2025-09-28 02:07:04');

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
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` char(36) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `submitter_id` varchar(255) NOT NULL,
  `responses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responses`)),
  `submitted_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `form_id`, `submitter_id`, `responses`, `submitted_at`, `created_at`, `updated_at`) VALUES
('01998f5c-71ce-7033-9eda-01c1312f0587', 'a4eb5961-ad5d-4f2d-a824-db336f268ef0', 'b5b17a99-1949-4f4b-9c29-8732f9d05c6f', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71d1-7319-bf27-04c05006deeb', '90746810-20d4-4ab2-a853-0493ebe4b4e7', '56e22b7d-d654-4e92-8092-e1d372b332da', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71d3-7357-8e5b-b9bff9b71f12', '159dd6b0-9f60-4a78-9e07-98f6e72e17f3', '8752c009-dd96-4069-ad1c-422a9d4e81ab', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71d4-7091-8b47-2100ddcdf597', 'e3c82c88-7514-40aa-9588-802a31b2e896', 'cfc2f8fa-225c-4294-9ab9-7d2719f28578', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71d7-7304-89ac-ccde7afac299', '535ec4d8-6293-4d11-b90d-cec43ef6bb0e', '472b8a0b-ed72-42c2-b160-fa85b781a2c6', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71d9-7139-9d13-d48b838767b5', 'a4bfce98-cbc9-46a5-a2e5-7184f84073ce', '42e8e2aa-bb0b-41d3-982a-5a59e62e8785', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71da-732f-bcad-ac46c51e97f3', 'd2a20386-7e4f-49e7-b270-4623e190907b', 'e0795c68-760d-431b-bd28-a6a5aa9af561', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71dc-7345-add9-c0df8db92343', '19cd727f-0a32-482d-af6f-fe517dee1ffb', 'd53ddb9f-6afb-4e14-a853-190bb8da19a1', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71de-72ba-8334-8484c481a42a', 'e6863645-b25f-44b1-9dbb-59ba47b9e43b', '307c111c-d4a7-4fe5-96dd-826f5c8bd81d', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
('01998f5c-71e0-711b-9a5d-7987bcf96173', '38d38c78-855c-4ebd-bc8e-d0a9f074360e', 'e1f6fa6c-1e58-400a-a5e1-12479e79e07e', '{\"question1\":\"answer1\",\"question2\":\"answer2\"}', '2025-09-28 08:07:04', '2025-09-28 02:07:04', '2025-09-28 02:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `item_ratings`
--

CREATE TABLE `item_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_ratings`
--

INSERT INTO `item_ratings` (`id`, `user_id`, `item_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 20, 5, 'Voluptatem atque ut dolor dolorum hic ratione et. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(2, 2, 20, 5, 'Quas fugit vitae omnis soluta modi iste omnis omnis. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(3, 3, 20, 5, 'Et quam itaque earum et soluta doloremque consequuntur. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(4, 4, 20, 5, 'Qui cum aliquid fugiat quos sint. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(5, 5, 20, 5, 'Nemo quo et magnam eius et libero. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(6, 6, 20, 5, 'Voluptatibus aut quo debitis pariatur. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(7, 7, 20, 5, 'Dignissimos magnam velit provident excepturi quisquam amet. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(8, 8, 20, 5, 'Omnis ipsam et aperiam aliquid. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(9, 9, 20, 5, 'Enim quisquam earum amet perferendis reprehenderit. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(10, 10, 20, 5, 'In in natus consequatur nobis similique veritatis nemo. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(11, 11, 20, 5, 'Expedita aut aliquam non illum molestiae dignissimos. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(12, 12, 20, 5, 'Tempora qui quis nesciunt qui. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(13, 14, 20, 5, 'A asperiores alias quos nesciunt accusamus autem eos. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(14, 15, 20, 5, 'Dolorem voluptas qui quis minima. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(15, 1, 4, 5, 'Eum asperiores reprehenderit rerum sunt magni unde eaque. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(16, 2, 4, 5, 'Incidunt libero perferendis quia. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(17, 5, 4, 5, 'Ab nam est et consequatur nam ullam quam. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(18, 7, 4, 5, 'Nemo vero nemo incidunt voluptas quod odio. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(19, 9, 4, 5, 'Est explicabo numquam deleniti officia dolores saepe dicta porro. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(20, 11, 4, 5, 'Veritatis sed maiores corporis voluptas aliquid. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(21, 12, 4, 5, 'Cupiditate explicabo et quo itaque cum. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(22, 14, 4, 5, 'Aut ipsam quae quia est necessitatibus. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(23, 16, 4, 5, 'Doloribus eius rerum adipisci cum. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(24, 2, 8, 5, 'Inventore et vitae id non autem quo. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(25, 3, 8, 5, 'Debitis neque error neque eius quam asperiores quos. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(26, 4, 8, 5, 'Quo libero sunt aliquam temporibus commodi. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(27, 5, 8, 5, 'Ut id dolor dolorem non. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(28, 6, 8, 5, 'Doloribus officia maxime consequuntur laudantium quis omnis. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(29, 8, 8, 5, 'Nobis sunt aut occaecati architecto quis. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(30, 9, 8, 5, 'Quas voluptatibus ea qui totam ullam in. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(31, 10, 8, 5, 'Qui et vel perspiciatis eligendi nihil omnis ratione. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(32, 12, 8, 5, 'Fugit recusandae enim ut. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(33, 13, 8, 5, 'Nihil suscipit repudiandae qui quibusdam. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(34, 14, 8, 5, 'Ut autem eum et. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(35, 15, 8, 5, 'Eveniet minus aut repellendus. Excellent quality!', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(36, 1, 29, 4, 'Repellat tempore quaerat iusto aut eum culpa. Veniam fugiat alias possimus officiis. Sint quo aut doloribus rerum ut quod.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(37, 2, 29, 4, 'Aliquam dolores excepturi voluptatem culpa aut et. Sed numquam explicabo cumque vitae sapiente. Est iste est maxime ullam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(38, 3, 29, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(39, 4, 29, 4, 'Sapiente occaecati omnis quia ut. Qui quo rem nesciunt a adipisci eligendi nulla. Nemo similique doloremque labore. Eos commodi molestias et id sit quasi.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(40, 5, 29, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(41, 6, 29, 4, 'Perspiciatis voluptatum cupiditate dolor dolores et nisi dolore. At aut aliquam est quia blanditiis. Et ipsa eum veniam similique ea voluptatibus quisquam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(42, 7, 29, 4, 'Maiores qui aperiam aut eum aperiam at ea debitis. Consequuntur tempora quod temporibus odit et sed culpa. Amet id eum facere sed dolores commodi deserunt. Autem voluptates est sequi et qui similique.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(43, 8, 29, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(44, 10, 29, 4, 'Aut doloribus ratione enim ex. Est sed quos consequatur reprehenderit veritatis. Sit voluptas cumque vel eius nesciunt. Consequuntur dolor voluptas architecto est omnis ut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(45, 12, 29, 2, 'Eveniet magni qui facilis aut quia iure labore numquam. Vitae neque amet quae. Deserunt aperiam qui ut laborum. Praesentium minus quia dolores culpa harum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(46, 13, 29, 2, 'Laudantium error eos assumenda molestias. Sint et nihil inventore temporibus ut sint molestiae. Ullam quasi quis voluptas dolores placeat ratione. Vel enim est et molestiae quidem sunt illum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(47, 15, 29, 1, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(48, 2, 13, 5, 'Vitae aut id quaerat nobis assumenda. Voluptatem dolores enim repellat autem consequatur voluptate labore. Accusantium nihil sit molestiae quia consequatur earum et.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(49, 3, 13, 5, 'Distinctio dolorum cum illum fugit maiores. Quibusdam voluptatem necessitatibus et magni dicta fuga. Est id laborum facilis deleniti esse. Nisi reprehenderit minus vel quia. Non et qui fugiat magni et omnis qui.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(50, 4, 13, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(51, 6, 13, 5, 'Unde cupiditate consectetur provident maiores modi. Voluptatibus iusto dolorem quidem consequatur dolores quia. Repellat ut velit quibusdam vero. Animi corporis dolorem perspiciatis inventore aliquid voluptas.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(52, 7, 13, 5, 'Inventore veritatis debitis suscipit cumque. Minus tempora temporibus odit aut repellendus alias aut. Dolorem magnam et quia.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(53, 8, 13, 5, 'Illum laboriosam laboriosam ipsa dignissimos iure eos molestias. Dolorem ipsam veniam optio amet. Maiores perferendis sit ut. Voluptatibus nihil suscipit et autem illum expedita quidem.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(54, 9, 13, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(55, 11, 13, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(56, 13, 13, 1, 'Quo repellendus magnam voluptatum magni ut. Odio eius ut deserunt sit asperiores officia. Voluptate quaerat molestiae enim quas perferendis nulla. Labore eius dignissimos earum voluptas alias.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(57, 15, 13, 2, 'Velit repellat aut qui et nihil. Autem culpa minus voluptas in. Autem repellendus minima qui.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(58, 16, 13, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(59, 1, 14, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(60, 4, 14, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(61, 6, 14, 4, 'Ut in expedita soluta voluptate. Sit pariatur excepturi cum quisquam temporibus. Nostrum architecto sit ut aspernatur est id.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(62, 7, 14, 5, 'Nobis maiores et distinctio at delectus odit quas. Quas sint quod neque facere fuga velit dolorem eum. Voluptate perferendis iure quos.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(63, 9, 14, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(64, 10, 14, 5, 'Ad sint enim molestiae. Debitis est magni dolorem aliquid voluptatem. Voluptatum praesentium totam veritatis voluptas voluptatem est dolor asperiores.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(65, 13, 14, 2, 'Quaerat est eos fugit velit tempora temporibus repudiandae. Quia natus consectetur quaerat occaecati sequi. Dolores quidem voluptate pariatur. Sed magnam facere enim rerum tempore.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(66, 15, 14, 2, 'Aut autem non repellat quasi ut eius labore. Quis dolorum quasi quod. Reprehenderit modi vitae minima sunt. Repellat in accusantium aut quis.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(67, 1, 23, 4, 'Ipsam impedit modi saepe corporis. Voluptatem quia aspernatur corrupti quia. Similique similique qui omnis et.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(68, 3, 23, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(69, 4, 23, 4, 'Ut a aut illum non. Beatae eum optio facere eveniet corrupti dicta. Quibusdam molestiae omnis nihil et et quo.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(70, 5, 23, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(71, 6, 23, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(72, 9, 23, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(73, 11, 23, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(74, 13, 23, 5, 'Odio voluptatem facilis voluptate quaerat ut soluta aut. Est fugiat facilis saepe ut consectetur aut. Qui exercitationem in voluptatem blanditiis iure aut velit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(75, 15, 23, 5, 'Minima rerum occaecati sit sequi non quos ut. Odit veritatis tempore consectetur id ad ut. Itaque atque deleniti mollitia.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(76, 1, 28, 5, 'Vitae velit consectetur id ad. Qui deserunt necessitatibus aut et voluptatem autem error est. Iste rerum voluptatibus voluptatem iusto nihil aut. Sit quo ut distinctio quisquam fuga.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(77, 3, 28, 5, 'Assumenda cum est aperiam ipsam nam. Reiciendis libero voluptas culpa rem qui eum. Eum commodi vero quia atque sit necessitatibus. Recusandae ut libero alias sit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(78, 4, 28, 5, 'Suscipit quo hic corporis dolores delectus sit sed quas. Quas dignissimos aspernatur ea nihil in id aut. Magni nihil fuga molestias.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(79, 8, 28, 5, 'Rem ut rerum officia consectetur sit eaque. Voluptatibus sed non cupiditate quo voluptas maiores nulla. Quia voluptatem ea libero. Assumenda voluptas doloribus aut explicabo omnis.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(80, 10, 28, 4, 'Ut numquam molestiae repudiandae mollitia tempora consectetur ducimus odit. Autem cumque autem consectetur autem autem. Quaerat officia deserunt quibusdam cumque autem commodi.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(81, 11, 28, 4, 'Eos maiores aliquam et earum repellendus. Officia ipsam iure asperiores. Modi non animi voluptatem explicabo magnam dolor. Dolorum delectus totam consequuntur sunt voluptatem quis. Ab sunt voluptas blanditiis libero sint sit sit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(82, 12, 28, 4, 'Tenetur voluptas odio harum aliquid autem. Earum enim ullam numquam reprehenderit. Aliquid excepturi deleniti tenetur facere.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(83, 13, 28, 1, 'Eaque sit quis sunt quis. Aliquid rem minima vitae repellat accusantium. Harum tenetur quisquam architecto nemo.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(84, 14, 28, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(85, 15, 28, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(86, 5, 9, 5, 'Dolore et a nihil est vero expedita quia. Ab reprehenderit dignissimos magni dolores pariatur esse. Ullam dignissimos iste magni eos tempore et.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(87, 6, 9, 4, 'Aut quaerat debitis excepturi ipsam corrupti. Officia culpa pariatur quia eum velit. Non consequatur autem sunt cum quia dolor quae sit. Quo distinctio suscipit quisquam quo nulla aspernatur voluptas.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(88, 8, 9, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(89, 12, 9, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(90, 13, 9, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(91, 14, 9, 1, 'Doloremque aut exercitationem illum itaque aut repudiandae fuga sit. Veniam ut harum eos ut ut sint. Ut ratione vel inventore quis. Excepturi minus eligendi dignissimos.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(92, 15, 9, 4, 'Commodi officia cupiditate temporibus autem nulla. Perspiciatis qui dolorem nam excepturi. Et voluptatem quisquam suscipit consequatur.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(93, 1, 17, 5, 'Sequi dolor rerum ut commodi ducimus odit. Corporis odio aut odio neque. Recusandae sint nihil amet maiores. Fugit quaerat omnis magnam aperiam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(94, 5, 17, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(95, 7, 17, 4, 'Quasi placeat adipisci sint soluta. Quia incidunt nihil numquam. Doloribus atque est aut illo voluptas. Quidem qui fuga sapiente praesentium ut harum eveniet reprehenderit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(96, 8, 17, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(97, 9, 17, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(98, 12, 17, 4, 'Omnis id nostrum asperiores dolore sunt. Et rerum explicabo aperiam est sed placeat voluptas modi. Cupiditate velit perspiciatis et corporis natus odit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(99, 15, 17, 1, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(100, 1, 6, 5, 'Rem non animi excepturi dicta id architecto. Et eius natus aperiam et harum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(101, 5, 6, 5, 'Optio et sint quam quo. Commodi nesciunt occaecati nihil nulla aliquid ipsum. Magnam eligendi possimus sunt. Officia at reiciendis quis magni.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(102, 11, 6, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(103, 12, 6, 4, 'Provident beatae mollitia ea deleniti natus rerum. Nostrum dolores architecto cupiditate assumenda tempora perspiciatis voluptatem. Tempore dolore sint quia delectus similique qui eligendi numquam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(104, 15, 6, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(105, 1, 16, 5, 'Commodi quis quae dolore nihil est. Architecto autem ipsa laudantium officiis perferendis delectus. Rem mollitia nemo quas autem expedita facere maiores. Incidunt et debitis consectetur beatae.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(106, 2, 16, 5, 'Perferendis sit non magnam quidem quia. Quo unde fugit laboriosam sed quos. Aut ut veniam est eius eum similique dolorem.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(107, 4, 16, 5, 'Possimus in facere veniam consequatur nihil. Quis enim recusandae rerum quo eveniet sit enim. Esse vel eum quia alias molestiae labore.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(108, 5, 16, 4, 'Rerum dignissimos aliquid voluptates. Perferendis in est id. Nulla et non eos accusantium. Placeat commodi ullam voluptas sunt.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(109, 10, 16, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(110, 12, 16, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(111, 13, 16, 5, 'Et quo sint rerum impedit itaque. Neque vero sit reiciendis aut. Ut laboriosam amet tempora velit incidunt ut. Quae sequi sed consequatur vero.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(112, 14, 16, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(113, 15, 16, 1, 'Qui velit dolorum quia voluptates dolorum molestias quidem. Ipsa dolor quam vel odit molestiae ex. Deserunt provident accusamus aspernatur similique necessitatibus magnam dolorem saepe.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(114, 16, 16, 1, 'Doloremque magni reprehenderit voluptatum ipsum. Ut labore ex ut nesciunt enim voluptatem saepe. Nulla dolor reprehenderit voluptas molestiae. Neque pariatur aspernatur aliquam vitae.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(115, 1, 18, 5, 'Aliquam et odio labore ut dignissimos. Sunt distinctio illo necessitatibus ut tenetur natus magnam sit. Nam dolorem autem fugit provident. Numquam architecto quia quo.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(116, 3, 18, 5, 'Sint omnis quia doloremque harum ipsa expedita. Quaerat voluptas deleniti ipsum laborum deserunt ut et. Reprehenderit magni omnis quia est nisi. Natus dolor et in.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(117, 4, 18, 4, 'Ut deserunt voluptas voluptatibus ipsam et. Non eligendi velit libero rerum cupiditate. Eos doloribus ut quia omnis dolores vel et in. Minus aut nihil rerum laborum sed est vel.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(118, 5, 18, 5, 'Ad suscipit ut eaque excepturi. Quos atque reiciendis optio quod dolorum voluptatem. Distinctio ea ullam repudiandae quia cumque et.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(119, 7, 18, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(120, 8, 18, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(121, 9, 18, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(122, 10, 18, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(123, 11, 18, 5, 'Dignissimos id consectetur rerum pariatur adipisci exercitationem. Autem quia et dolore repellat. Mollitia dolor esse autem repudiandae fugiat. Aut ex ratione culpa et. Quo odit officia corporis magnam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(124, 12, 18, 3, 'Ea voluptatem non tempora quidem consectetur. Rem qui reprehenderit quam rerum dolorum vel cupiditate. Cupiditate voluptates dolor ut consequatur error ex similique.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(125, 13, 18, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(126, 16, 18, 2, 'Explicabo iste ullam deserunt. Recusandae alias voluptatem et. Perferendis nesciunt voluptatem dolorem vel deleniti.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(127, 1, 19, 4, 'Excepturi non quod non excepturi. Culpa alias fuga sit nihil asperiores alias ut. Voluptatem accusamus sed ea doloremque minus ea voluptas.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(128, 2, 19, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(129, 5, 19, 4, 'Aut voluptas officia odio quia sit. Eos recusandae alias dolorum consectetur. Et et quam eveniet at dolorem sed. Enim aut laboriosam quae id fugiat consequatur eveniet.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(130, 6, 19, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(131, 7, 19, 5, 'Occaecati omnis odit provident vero. Nulla et dolores sed est. Consequuntur facere qui nisi consequatur illo. Voluptates soluta nulla iusto est et dolore vel.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(132, 10, 19, 4, 'Commodi animi voluptatum esse sapiente eaque autem pariatur qui. Velit ut necessitatibus totam nihil. Aut nulla omnis ullam voluptatem. Qui sit unde maxime quos ratione rerum aut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(133, 11, 19, 4, 'Enim et debitis suscipit reprehenderit expedita sint. Fugiat vero qui aliquam consectetur tenetur quis. Illum error dolor sed tenetur numquam et. Assumenda aut similique molestiae ratione. Voluptates minus facere quidem voluptate quis nihil.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(134, 12, 19, 4, 'Est sunt et vel nobis odit. Dolorem soluta similique mollitia eaque odit. Amet officiis temporibus ea quibusdam veniam qui vitae ipsa. Ut eius temporibus ipsam quibusdam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(135, 13, 19, 4, 'Assumenda laborum soluta magnam rem vero aut alias non. Non esse explicabo quibusdam ut aperiam magnam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(136, 14, 19, 2, 'Qui officia magni sed debitis qui unde quo. Et qui facilis rerum et. Perferendis optio corporis ea omnis impedit eligendi qui.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(137, 15, 19, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(138, 16, 19, 2, 'Soluta aut voluptatem itaque id nostrum. Inventore culpa cumque aut. Ducimus et voluptatem officia officia. Incidunt corporis id culpa soluta quos alias et.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(139, 3, 1, 5, 'Nostrum vel dolor impedit excepturi corrupti. Blanditiis et dicta nesciunt non similique. Vel hic harum quia quo aperiam alias.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(140, 5, 1, 4, 'Mollitia eveniet a voluptatum aspernatur. Quia consectetur recusandae a quas consequatur impedit. Sit esse aut enim dolore saepe. Pariatur aut atque inventore repudiandae voluptate qui eum rerum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(141, 6, 1, 5, 'Exercitationem nihil eaque ad animi nostrum. Voluptate deserunt veritatis alias ut quos. Dolor ipsa optio a molestiae.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(142, 9, 1, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(143, 11, 1, 4, 'Tenetur consequatur provident neque. At quia a tempore voluptatem et et accusantium. Animi non provident enim.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(144, 14, 1, 5, 'Est quibusdam in dolorem. Qui asperiores assumenda consectetur et ut sint ipsum. Vero aut non sit corporis sapiente consectetur aperiam. Soluta ut iusto minus ea id.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(145, 15, 1, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(146, 16, 1, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(147, 1, 26, 4, 'Et hic perspiciatis rerum eveniet. Voluptates a quibusdam esse ab modi magnam. Atque id aperiam consectetur expedita libero est commodi qui. Error qui sunt amet beatae praesentium aut tempore.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(148, 3, 26, 4, 'Tempora laborum eos nesciunt. Illum quaerat omnis fugit quis aut. Aut repellat dolorum dignissimos est non.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(149, 8, 26, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(150, 9, 26, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(151, 11, 26, 4, 'Ut ratione ut quo consequatur ut architecto. Adipisci eaque iusto cumque quae deleniti quidem. Et dolore eum est et officia. Porro et nihil molestiae qui nostrum debitis pariatur.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(152, 13, 26, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(153, 14, 26, 4, 'Dolor itaque laudantium est. Laborum quaerat voluptas quaerat earum est consequuntur sint. Enim laboriosam quis quis non. Hic a aut ea consequatur non.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(154, 16, 26, 4, 'In veniam repudiandae qui incidunt nesciunt optio. Voluptas quia eaque architecto eos quia. Error sint voluptatem possimus et officia molestiae eius.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(155, 1, 5, 5, 'Quia ut temporibus et saepe unde. Quia quia ducimus itaque aut similique enim molestias.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(156, 2, 5, 4, 'Commodi sed doloribus debitis dolores aut sint. Veniam debitis dolores molestiae est saepe. Odit illo maxime sit iure et non est.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(157, 3, 5, 4, 'Non explicabo placeat autem nobis error. Ut aspernatur magni quasi corrupti vero non aperiam. Dolorem libero rerum dolorem animi voluptatem ut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(158, 4, 5, 4, 'Consequatur ipsam non cumque repellat. Ipsam qui odio ipsam perspiciatis quia. Neque quisquam exercitationem culpa a illo perspiciatis. Est atque impedit tempore veniam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(159, 5, 5, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(160, 6, 5, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(161, 9, 5, 4, 'Eum neque ea ut eveniet. Et voluptas occaecati aut consectetur architecto nihil ut. Occaecati exercitationem similique inventore dolorum culpa sed vel. Explicabo quia quia et autem.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(162, 10, 5, 4, 'Labore voluptas consequatur molestias. Quidem voluptas doloremque occaecati autem qui saepe reprehenderit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(163, 13, 5, 4, 'Quos voluptates et voluptatem et. Quidem sequi aliquid iste nesciunt. Est voluptate laboriosam est eum nihil aut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(164, 14, 5, 1, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(165, 15, 5, 5, 'Officia cum harum omnis provident asperiores atque mollitia. Sit laboriosam blanditiis distinctio fuga aliquid non. Culpa ut quidem distinctio qui delectus at quia.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(166, 2, 11, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(167, 7, 11, 5, 'Ullam est sequi unde consequuntur voluptatem earum. Nulla ipsa voluptatem molestias magnam ex vel. Magni adipisci ut esse non laboriosam. Quae aperiam accusamus provident omnis est quidem.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(168, 8, 11, 5, 'Velit nesciunt est sit eaque. Omnis beatae iure ipsum minus debitis aliquam ipsa. Eveniet cupiditate iure temporibus deleniti itaque. Molestias atque nesciunt est reprehenderit sint.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(169, 10, 11, 4, 'Illum unde vel nostrum dolorem cupiditate reprehenderit unde. Velit aut animi consectetur et sunt porro labore. Perferendis enim ut eos quaerat.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(170, 13, 11, 4, 'Maxime ducimus recusandae voluptates cumque. Nisi quisquam ut aperiam facere praesentium expedita. Sit accusamus deleniti natus aut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(171, 1, 22, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(172, 2, 22, 3, 'Enim soluta id qui iusto qui perspiciatis sint. Doloremque iusto vero necessitatibus velit quo. Hic sit qui numquam perspiciatis.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(173, 4, 22, 4, 'Dolorum est quas odio. Vel illo tenetur sunt aut.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(174, 9, 22, 3, 'Quia et aut distinctio nulla maiores animi accusamus. Quas provident dolorem est ut magnam unde. Voluptas voluptatem sed et quas quaerat ex.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(175, 10, 22, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(176, 11, 22, 2, 'Esse vel quo quo maxime voluptate. Autem voluptas eius quibusdam quia deserunt. Qui repellat rerum quae.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(177, 12, 22, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(178, 15, 22, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(179, 2, 30, 5, 'Optio sed sapiente quos itaque. Voluptas voluptates doloribus tenetur fuga a et pariatur dicta. Quis ipsum nobis earum vitae qui.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(180, 4, 30, 3, 'Numquam eius id iure voluptatem. Ducimus rerum corporis dicta pariatur iste et. Cum qui esse id accusamus ratione dicta.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(181, 7, 30, 3, 'Quia delectus itaque dolore aspernatur neque eum omnis qui. Sit placeat sit et velit voluptatem. Commodi modi voluptatem totam esse eum. Excepturi alias ratione suscipit iure.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(182, 9, 30, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(183, 14, 30, 3, 'Qui voluptatum nesciunt cupiditate sit in. Incidunt eaque dignissimos consequuntur est temporibus accusamus. Commodi officiis vero non sed magnam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(184, 2, 15, 1, 'Quibusdam voluptatem adipisci qui cumque. Deleniti rerum dignissimos cumque. Dolorem sapiente eos aperiam dolor. Inventore aut soluta et totam rerum dignissimos libero.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(185, 6, 15, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(186, 7, 15, 4, 'Id est molestiae et iste beatae ea. Voluptas error et assumenda ratione quia. Modi quia esse id aperiam aut maiores iste. Animi magnam vel quaerat molestias quia quaerat non.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(187, 8, 15, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(188, 9, 15, 2, 'Ea nemo ducimus omnis. Fugit quis quibusdam est rerum minima.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(189, 10, 15, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(190, 14, 15, 4, 'Omnis deserunt odit porro ratione temporibus dicta ipsa. Officia facere sint ex hic natus est. Dolorem et tempora cum omnis. Porro laboriosam velit ex nisi.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(191, 3, 12, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(192, 5, 12, 1, 'Tenetur qui possimus adipisci. Maiores possimus aliquid repudiandae et repellat. Et sit ratione molestiae. Maxime omnis amet est est eius commodi.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(193, 13, 12, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(194, 5, 10, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(195, 12, 10, 4, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(196, 15, 10, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(197, 2, 24, 1, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(198, 4, 24, 3, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(199, 6, 24, 5, 'Dolores ullam ex provident ut neque voluptatem ipsam hic. Nisi nihil error aliquam labore aut dolor. Cum dolor qui accusamus aut aut illo at eaque. Voluptatem dolor perspiciatis omnis dolorum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(200, 7, 24, 1, 'Id corporis fugiat est omnis. Eius dolor iste quam aperiam. Enim quo hic inventore iure.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(201, 9, 24, 2, 'Non commodi laudantium est omnis qui sed. Vel voluptatibus quae doloremque molestiae. Enim et harum et aut dolores dolorum sed. Quos magnam numquam qui a inventore.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(202, 11, 24, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(203, 12, 24, 1, 'Fugit quos et est animi non voluptatum ipsum. Quod ut reiciendis voluptatem adipisci est deserunt. Velit autem optio quo dolore.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(204, 16, 24, 2, 'At earum voluptates non. Nobis qui tempora explicabo pariatur ut ut temporibus. Assumenda voluptates omnis nemo consequatur. Repellat dolores quam culpa veniam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(205, 2, 25, 3, 'Fugiat est voluptatem et qui nam quasi. Pariatur corporis eos non quos. Cum sint enim quasi consectetur voluptates. Autem enim assumenda rerum voluptatibus cumque tempora perspiciatis.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(206, 3, 25, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(207, 6, 25, 2, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(208, 7, 25, 1, 'Corporis consequuntur rerum laboriosam reprehenderit velit voluptatibus minus. Velit architecto libero sint quo accusantium et officia. Voluptatem blanditiis consectetur itaque explicabo officia. Veritatis ea quo ut voluptas consequatur.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(209, 8, 25, 2, 'Eius inventore similique officiis vel non eos dolores. Harum atque eum id vero debitis iste quia. Quasi totam molestias hic deserunt voluptatem unde. Aut dolores quia minima beatae est non sit.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(210, 9, 25, 4, 'Occaecati aut ratione suscipit autem. Vitae dolorem dolores impedit autem eum perferendis omnis sapiente. Nihil sed nesciunt aperiam.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(211, 14, 25, 5, 'Porro voluptate hic vitae neque aspernatur et quisquam. Quisquam vel sunt sequi sit odit tempore. Omnis et rem adipisci provident repellendus quia. Dolor enim qui quod delectus commodi dolore voluptatem perspiciatis.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(212, 15, 25, 5, NULL, '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(213, 11, 2, 2, 'Sed assumenda reiciendis ex saepe. Reiciendis non ipsa temporibus dolores. Autem necessitatibus et provident veniam quis. A dolores minima numquam eaque.', '2025-09-28 02:07:06', '2025-09-28 02:07:06'),
(214, 15, 2, 1, 'Sapiente qui commodi reprehenderit alias soluta ullam consequuntur. Facere molestias occaecati et id at quia veniam. Est illo porro aut nesciunt voluptatem. Odio ut nostrum et possimus eum.', '2025-09-28 02:07:06', '2025-09-28 02:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `item_name`, `description`, `price`, `image_url`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'Macchiato', 'Voluptas est corporis ea et.', 6.46, 'https://via.placeholder.com/200x200.png/00bb88?text=coffee+omnis', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(2, 'Cold Brew', 'Aspernatur delectus nemo et ducimus ut ut assumenda.', 2.65, 'https://via.placeholder.com/200x200.png/00cc66?text=coffee+est', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(3, 'Espresso', 'Ex eveniet eum enim enim.', 6.88, 'https://via.placeholder.com/200x200.png/00aaff?text=coffee+perferendis', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(4, 'Espresso', 'Sed assumenda accusantium dolores.', 2.54, 'https://via.placeholder.com/200x200.png/00bb22?text=coffee+sed', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(5, 'Cappuccino', 'Qui et vel eaque sequi sit blanditiis vel in.', 7.43, 'https://via.placeholder.com/200x200.png/0099cc?text=coffee+est', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(6, 'Americano', 'Illo rerum quo pariatur in similique veritatis labore.', 8.10, 'https://via.placeholder.com/200x200.png/0099aa?text=coffee+consectetur', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(7, 'Latte', 'Quia amet numquam tempore vel porro.', 2.03, 'https://via.placeholder.com/200x200.png/0044aa?text=coffee+at', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(8, 'Espresso', 'Ut commodi asperiores id est qui nemo illo possimus.', 5.35, 'https://via.placeholder.com/200x200.png/0066aa?text=coffee+aut', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(9, 'Frappuccino', 'Assumenda odit itaque nesciunt repellat.', 8.56, 'https://via.placeholder.com/200x200.png/0066bb?text=coffee+aspernatur', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(10, 'Mocha', 'Ea voluptatem deleniti est et nulla ad autem.', 2.98, 'https://via.placeholder.com/200x200.png/003311?text=coffee+magnam', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(11, 'Cappuccino', 'Voluptas deleniti dolorem temporibus.', 3.94, 'https://via.placeholder.com/200x200.png/00bbdd?text=coffee+sint', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(12, 'Cold Brew', 'Non facere qui non voluptates enim ut.', 5.75, 'https://via.placeholder.com/200x200.png/0022cc?text=coffee+quis', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(13, 'Mocha', 'Reiciendis fuga est recusandae nostrum aut quaerat.', 6.47, 'https://via.placeholder.com/200x200.png/00ee77?text=coffee+et', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(14, 'Cappuccino', 'Nesciunt quis reprehenderit consequuntur explicabo.', 6.05, 'https://via.placeholder.com/200x200.png/00aa44?text=coffee+ut', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(15, 'Cappuccino', 'Qui dolore molestiae beatae architecto.', 7.01, 'https://via.placeholder.com/200x200.png/009955?text=coffee+voluptatum', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(16, 'Americano', 'Sit eligendi autem qui ratione voluptates exercitationem.', 8.08, 'https://via.placeholder.com/200x200.png/0099ee?text=coffee+ipsam', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(17, 'Espresso', 'Ab repellat cum recusandae est numquam.', 2.80, 'https://via.placeholder.com/200x200.png/0011dd?text=coffee+ipsum', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(18, 'Mocha', 'Provident quasi incidunt et illo excepturi.', 7.17, 'https://via.placeholder.com/200x200.png/005533?text=coffee+soluta', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(19, 'Espresso', 'Possimus soluta facere omnis aut ipsum sed.', 2.66, 'https://via.placeholder.com/200x200.png/00cc22?text=coffee+molestias', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(20, 'Latte', 'Iste dolorem qui dolores aut sed sit.', 5.12, 'https://via.placeholder.com/200x200.png/0099dd?text=coffee+amet', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(21, 'Cappuccino', 'Quo similique eaque et doloribus.', 8.07, 'https://via.placeholder.com/200x200.png/00ff99?text=coffee+placeat', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(22, 'Cappuccino', 'Occaecati veritatis animi illo quam eligendi impedit neque repudiandae.', 5.79, 'https://via.placeholder.com/200x200.png/004400?text=coffee+ipsam', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(23, 'Cold Brew', 'Dolore quia totam rem rerum voluptate corrupti quas.', 6.78, 'https://via.placeholder.com/200x200.png/002211?text=coffee+dolorem', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(24, 'Americano', 'Exercitationem voluptas dolorem totam.', 7.90, 'https://via.placeholder.com/200x200.png/00dd66?text=coffee+et', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(25, 'Macchiato', 'Error est similique magnam qui dolorem enim.', 3.98, 'https://via.placeholder.com/200x200.png/0011bb?text=coffee+ab', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(26, 'Latte', 'Harum quibusdam autem ipsam illo.', 2.36, 'https://via.placeholder.com/200x200.png/002288?text=coffee+molestias', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(27, 'Cold Brew', 'Nisi omnis earum pariatur quo molestias facilis.', 6.97, 'https://via.placeholder.com/200x200.png/00aa33?text=coffee+qui', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(28, 'Macchiato', 'Veniam ad et vel dolor non dignissimos.', 5.75, 'https://via.placeholder.com/200x200.png/00cc55?text=coffee+sint', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(29, 'Cold Brew', 'Voluptatum omnis delectus odio rerum dolores.', 7.92, 'https://via.placeholder.com/200x200.png/0011cc?text=coffee+autem', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(30, 'Macchiato', 'Possimus a necessitatibus autem totam eaque debitis.', 5.45, 'https://via.placeholder.com/200x200.png/00ee22?text=coffee+eum', 1, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(31, 'Americano', 'Voluptatum voluptate adipisci ducimus ea.', 7.28, 'https://via.placeholder.com/200x200.png/00aa22?text=coffee+pariatur', 0, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(32, 'Frappuccino', 'Ipsum aliquid eius est officia eligendi nihil.', 4.57, 'https://via.placeholder.com/200x200.png/00ee00?text=coffee+reiciendis', 0, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(33, 'Espresso', 'Saepe voluptas quasi enim sed totam.', 6.01, 'https://via.placeholder.com/200x200.png/007788?text=coffee+eos', 0, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(34, 'Americano', 'Est sed est facere.', 6.58, 'https://via.placeholder.com/200x200.png/007722?text=coffee+aut', 0, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(35, 'Espresso', 'Dolor placeat non sed autem eum incidunt.', 4.09, 'https://via.placeholder.com/200x200.png/00aa11?text=coffee+quidem', 0, '2025-09-28 02:07:04', '2025-09-28 02:07:04');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000001_create_customers_table', 1),
(5, '2024_01_01_000002_create_menu_items_table', 1),
(6, '2024_01_01_000003_create_orders_table', 1),
(7, '2024_01_01_000004_create_order_items_table', 1),
(8, '2025_09_01_062943_create_form_submissions_table', 1),
(9, '2025_09_15_102550_create_ai_modules_table', 1),
(10, '2025_09_25_160304_create_item_ratings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','preparing','ready','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_time`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, '2025-09-25 01:49:47', 35.93, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(2, 15, '2025-09-25 01:49:47', 21.68, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(3, 19, '2025-09-25 01:49:47', 24.86, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(4, 15, '2025-09-25 01:49:47', 10.35, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(5, 18, '2025-09-25 01:49:47', 35.13, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(6, 15, '2025-09-25 01:49:47', 54.74, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(7, 16, '2025-09-25 01:49:47', 29.47, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(8, 10, '2025-09-25 01:49:47', 15.88, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(9, 15, '2025-09-25 01:49:47', 12.06, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(10, 6, '2025-09-25 01:49:47', 43.72, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(11, 13, '2025-09-25 01:49:47', 42.94, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(12, 9, '2025-09-25 01:49:47', 60.76, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(13, 4, '2025-09-25 01:49:47', 19.64, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(14, 20, '2025-09-25 01:49:47', 18.63, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(15, 7, '2025-09-25 01:49:47', 12.72, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(16, 18, '2025-09-25 01:49:47', 15.60, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(17, 24, '2025-09-25 01:49:47', 39.70, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(18, 15, '2025-09-25 01:49:47', 43.57, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(19, 9, '2025-09-25 01:49:47', 10.24, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(20, 10, '2025-09-25 01:49:47', 95.24, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(21, 10, '2025-09-25 01:49:47', 7.15, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(22, 1, '2025-09-25 01:49:47', 52.81, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(23, 11, '2025-09-25 01:49:47', 49.01, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(24, 7, '2025-09-25 01:49:47', 2.21, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(25, 19, '2025-09-25 01:49:47', 30.10, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(26, 4, '2025-09-25 01:49:47', 52.54, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(27, 17, '2025-09-25 01:49:47', 60.08, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(28, 23, '2025-09-25 01:49:47', 9.78, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(29, 2, '2025-09-25 01:49:47', 47.40, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(30, 10, '2025-09-25 01:49:47', 21.64, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(31, 20, '2025-09-25 01:49:47', 39.49, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(32, 23, '2025-09-25 01:49:47', 50.05, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(33, 16, '2025-09-25 01:49:47', 42.19, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(34, 16, '2025-09-25 01:49:47', 8.50, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(35, 13, '2025-09-25 01:49:47', 52.44, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(36, 3, '2025-09-25 01:49:47', 26.74, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(37, 24, '2025-09-25 01:49:47', 22.56, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(38, 5, '2025-09-25 01:49:47', 18.85, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(39, 12, '2025-09-25 01:49:47', 21.43, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(40, 9, '2025-09-25 01:49:47', 6.11, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(41, 25, '2025-09-25 01:49:47', 29.49, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(42, 4, '2025-09-25 01:49:47', 19.50, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(43, 1, '2025-09-25 01:49:47', 77.44, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(44, 24, '2025-09-25 01:49:47', 4.20, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(45, 5, '2025-09-25 01:49:47', 33.37, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(46, 17, '2025-09-25 01:49:47', 55.52, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(47, 15, '2025-09-25 01:49:47', 15.31, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(48, 8, '2025-09-25 01:49:47', 51.78, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(49, 13, '2025-09-25 01:49:47', 25.56, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(50, 11, '2025-09-25 01:49:47', 59.90, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(51, 4, '2025-08-19 13:42:55', 4.22, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(52, 18, '2025-08-19 13:42:55', 8.02, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(53, 23, '2025-08-19 13:42:55', 54.33, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(54, 19, '2025-08-19 13:42:55', 42.80, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(55, 14, '2025-08-19 13:42:55', 50.78, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(56, 22, '2025-08-19 13:42:55', 60.37, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(57, 22, '2025-08-19 13:42:55', 28.44, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(58, 10, '2025-08-19 13:42:55', 23.07, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(59, 20, '2025-08-19 13:42:55', 28.11, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(60, 16, '2025-08-19 13:42:55', 29.80, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(61, 8, '2025-08-19 13:42:55', 58.79, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(62, 1, '2025-08-19 13:42:55', 21.03, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(63, 25, '2025-08-19 13:42:55', 32.73, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(64, 14, '2025-08-19 13:42:55', 14.40, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(65, 7, '2025-08-19 13:42:55', 13.22, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(66, 25, '2025-08-19 13:42:55', 63.96, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(67, 19, '2025-08-19 13:42:55', 28.50, 'preparing', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(68, 12, '2025-08-19 13:42:55', 18.74, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(69, 21, '2025-08-19 13:42:55', 18.94, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(70, 20, '2025-08-19 13:42:55', 24.15, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(71, 12, '2025-08-19 13:42:55', 76.86, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(72, 17, '2025-08-19 13:42:55', 24.30, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(73, 15, '2025-08-19 13:42:55', 11.60, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(74, 25, '2025-08-19 13:42:55', 66.30, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(75, 6, '2025-08-19 13:42:55', 25.41, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(76, 23, '2025-08-19 13:42:55', 47.72, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(77, 19, '2025-08-19 13:42:55', 21.57, 'completed', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(78, 22, '2025-08-19 13:42:55', 6.90, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(79, 25, '2025-08-19 13:42:55', 33.01, 'pending', '2025-09-28 02:07:04', '2025-09-28 02:07:05'),
(80, 21, '2025-08-19 13:42:55', 26.66, 'ready', '2025-09-28 02:07:04', '2025-09-28 02:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 2, 2.14, 4.28, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(2, 1, 6, 1, 6.96, 6.96, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(3, 1, 5, 2, 9.03, 18.06, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(4, 1, 22, 1, 6.63, 6.63, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(5, 2, 23, 1, 9.98, 9.98, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(6, 2, 3, 2, 5.85, 11.70, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(7, 3, 30, 3, 7.39, 22.17, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(8, 3, 6, 1, 2.69, 2.69, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(9, 4, 5, 3, 3.45, 10.35, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(10, 5, 21, 2, 2.29, 4.58, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(11, 5, 7, 2, 7.21, 14.42, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(12, 5, 5, 1, 3.44, 3.44, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(13, 5, 25, 1, 5.45, 5.45, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(14, 5, 1, 2, 3.62, 7.24, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(15, 6, 29, 2, 9.04, 18.08, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(16, 6, 20, 1, 8.78, 8.78, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(17, 6, 21, 2, 6.61, 13.22, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(18, 6, 29, 1, 6.28, 6.28, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(19, 6, 29, 1, 8.38, 8.38, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(20, 7, 9, 3, 3.67, 11.01, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(21, 7, 12, 2, 6.13, 12.26, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(22, 7, 15, 1, 6.20, 6.20, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(23, 8, 28, 2, 7.94, 15.88, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(24, 9, 30, 2, 2.42, 4.84, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(25, 9, 22, 2, 3.61, 7.22, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(26, 10, 22, 3, 2.79, 8.37, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(27, 10, 16, 3, 4.15, 12.45, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(28, 10, 5, 1, 9.98, 9.98, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(29, 10, 9, 2, 4.28, 8.56, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(30, 10, 8, 1, 4.36, 4.36, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(31, 11, 1, 3, 2.55, 7.65, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(32, 11, 10, 2, 3.54, 7.08, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(33, 11, 26, 2, 6.89, 13.78, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(34, 11, 22, 3, 4.81, 14.43, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(35, 12, 10, 3, 7.00, 21.00, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(36, 12, 8, 3, 2.40, 7.20, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(37, 12, 15, 1, 6.00, 6.00, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(38, 12, 3, 3, 6.72, 20.16, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(39, 12, 21, 1, 6.40, 6.40, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(40, 13, 2, 2, 9.82, 19.64, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(41, 14, 6, 2, 5.46, 10.92, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(42, 14, 12, 1, 7.71, 7.71, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(43, 15, 4, 1, 3.08, 3.08, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(44, 15, 15, 1, 9.64, 9.64, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(45, 16, 23, 1, 6.02, 6.02, '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(46, 16, 22, 3, 2.09, 6.27, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(47, 16, 14, 1, 3.31, 3.31, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(48, 17, 5, 3, 6.10, 18.30, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(49, 17, 14, 2, 6.47, 12.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(50, 17, 29, 2, 4.23, 8.46, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(51, 18, 22, 2, 2.78, 5.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(52, 18, 17, 3, 6.11, 18.33, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(53, 18, 23, 2, 6.94, 13.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(54, 18, 28, 1, 5.80, 5.80, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(55, 19, 4, 2, 5.12, 10.24, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(56, 20, 13, 2, 2.81, 5.62, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(57, 20, 21, 3, 9.33, 27.99, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(58, 20, 16, 2, 9.78, 19.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(59, 20, 10, 3, 7.71, 23.13, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(60, 20, 2, 2, 9.47, 18.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(61, 21, 2, 1, 7.15, 7.15, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(62, 22, 10, 2, 3.43, 6.86, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(63, 22, 10, 1, 5.89, 5.89, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(64, 22, 18, 3, 8.80, 26.40, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(65, 22, 6, 2, 6.83, 13.66, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(66, 23, 15, 3, 8.19, 24.57, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(67, 23, 26, 2, 3.61, 7.22, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(68, 23, 25, 1, 4.32, 4.32, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(69, 23, 7, 3, 4.30, 12.90, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(70, 24, 13, 1, 2.21, 2.21, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(71, 25, 29, 2, 3.47, 6.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(72, 25, 24, 3, 7.72, 23.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(73, 26, 4, 3, 3.93, 11.79, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(74, 26, 21, 1, 4.22, 4.22, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(75, 26, 15, 3, 8.15, 24.45, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(76, 26, 23, 2, 4.18, 8.36, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(77, 26, 6, 1, 3.72, 3.72, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(78, 27, 11, 3, 4.40, 13.20, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(79, 27, 23, 2, 6.38, 12.76, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(80, 27, 12, 1, 8.04, 8.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(81, 27, 2, 3, 5.96, 17.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(82, 27, 11, 2, 4.10, 8.20, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(83, 28, 23, 3, 3.26, 9.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(84, 29, 7, 3, 2.63, 7.89, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(85, 29, 23, 3, 8.44, 25.32, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(86, 29, 14, 1, 6.05, 6.05, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(87, 29, 8, 1, 8.14, 8.14, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(88, 30, 27, 1, 5.70, 5.70, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(89, 30, 2, 1, 2.74, 2.74, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(90, 30, 9, 3, 4.40, 13.20, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(91, 31, 28, 1, 6.47, 6.47, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(92, 31, 4, 3, 4.33, 12.99, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(93, 31, 29, 2, 6.71, 13.42, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(94, 31, 26, 1, 6.61, 6.61, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(95, 32, 2, 1, 9.64, 9.64, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(96, 32, 7, 3, 3.99, 11.97, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(97, 32, 4, 1, 9.12, 9.12, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(98, 32, 18, 3, 6.44, 19.32, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(99, 33, 26, 1, 7.92, 7.92, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(100, 33, 28, 3, 2.75, 8.25, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(101, 33, 22, 2, 4.26, 8.52, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(102, 33, 30, 2, 8.75, 17.50, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(103, 34, 28, 1, 8.50, 8.50, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(104, 35, 30, 1, 5.73, 5.73, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(105, 35, 18, 2, 8.53, 17.06, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(106, 35, 13, 2, 4.99, 9.98, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(107, 35, 29, 3, 3.29, 9.87, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(108, 35, 6, 1, 9.80, 9.80, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(109, 36, 24, 2, 4.40, 8.80, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(110, 36, 30, 3, 5.98, 17.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(111, 37, 15, 2, 2.04, 4.08, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(112, 37, 19, 3, 6.16, 18.48, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(113, 38, 16, 2, 5.43, 10.86, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(114, 38, 30, 1, 7.99, 7.99, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(115, 39, 1, 2, 7.16, 14.32, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(116, 39, 20, 1, 7.11, 7.11, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(117, 40, 18, 1, 6.11, 6.11, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(118, 41, 17, 3, 9.83, 29.49, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(119, 42, 22, 2, 9.75, 19.50, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(120, 43, 21, 1, 9.27, 9.27, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(121, 43, 6, 2, 6.18, 12.36, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(122, 43, 22, 3, 8.13, 24.39, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(123, 43, 15, 2, 8.39, 16.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(124, 43, 28, 2, 7.32, 14.64, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(125, 44, 16, 1, 4.20, 4.20, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(126, 45, 27, 2, 2.39, 4.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(127, 45, 20, 3, 9.53, 28.59, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(128, 46, 10, 1, 8.39, 8.39, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(129, 46, 30, 2, 4.92, 9.84, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(130, 46, 13, 3, 4.72, 14.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(131, 46, 28, 3, 4.99, 14.97, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(132, 46, 18, 3, 2.72, 8.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(133, 47, 24, 1, 5.17, 5.17, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(134, 47, 10, 2, 2.08, 4.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(135, 47, 12, 1, 5.98, 5.98, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(136, 48, 5, 1, 7.17, 7.17, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(137, 48, 23, 2, 8.28, 16.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(138, 48, 26, 1, 6.21, 6.21, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(139, 48, 24, 3, 7.28, 21.84, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(140, 49, 19, 2, 8.16, 16.32, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(141, 49, 7, 1, 9.24, 9.24, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(142, 50, 18, 3, 3.55, 10.65, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(143, 50, 4, 1, 5.85, 5.85, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(144, 50, 14, 3, 3.96, 11.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(145, 50, 16, 3, 8.12, 24.36, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(146, 50, 5, 2, 3.58, 7.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(147, 51, 19, 1, 4.22, 4.22, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(148, 52, 11, 1, 8.02, 8.02, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(149, 53, 9, 3, 8.22, 24.66, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(150, 53, 2, 2, 4.52, 9.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(151, 53, 28, 3, 5.24, 15.72, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(152, 53, 3, 1, 4.91, 4.91, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(153, 54, 16, 1, 2.90, 2.90, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(154, 54, 9, 2, 3.63, 7.26, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(155, 54, 4, 1, 5.04, 5.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(156, 54, 20, 3, 2.17, 6.51, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(157, 54, 1, 3, 7.03, 21.09, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(158, 55, 14, 3, 9.28, 27.84, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(159, 55, 23, 3, 4.88, 14.64, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(160, 55, 29, 1, 8.30, 8.30, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(161, 56, 12, 2, 7.99, 15.98, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(162, 56, 26, 1, 9.34, 9.34, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(163, 56, 6, 3, 8.45, 25.35, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(164, 56, 16, 1, 9.70, 9.70, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(165, 57, 10, 3, 2.68, 8.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(166, 57, 27, 3, 6.80, 20.40, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(167, 58, 1, 1, 6.93, 6.93, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(168, 58, 11, 1, 3.26, 3.26, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(169, 58, 1, 2, 6.44, 12.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(170, 59, 25, 3, 3.49, 10.47, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(171, 59, 19, 3, 3.39, 10.17, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(172, 59, 8, 1, 7.47, 7.47, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(173, 60, 7, 2, 6.34, 12.68, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(174, 60, 13, 2, 5.28, 10.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(175, 60, 30, 2, 3.28, 6.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(176, 61, 23, 2, 8.32, 16.64, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(177, 61, 10, 2, 4.44, 8.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(178, 61, 4, 2, 4.92, 9.84, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(179, 61, 18, 2, 8.51, 17.02, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(180, 61, 23, 1, 6.41, 6.41, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(181, 62, 6, 3, 7.01, 21.03, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(182, 63, 10, 1, 7.05, 7.05, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(183, 63, 2, 3, 8.56, 25.68, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(184, 64, 6, 3, 4.80, 14.40, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(185, 65, 29, 2, 4.00, 8.00, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(186, 65, 4, 2, 2.61, 5.22, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(187, 66, 6, 3, 8.29, 24.87, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(188, 66, 11, 2, 3.87, 7.74, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(189, 66, 4, 3, 4.06, 12.18, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(190, 66, 13, 1, 9.78, 9.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(191, 66, 18, 3, 3.13, 9.39, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(192, 67, 27, 2, 6.86, 13.72, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(193, 67, 6, 2, 7.39, 14.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(194, 68, 28, 2, 2.00, 4.00, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(195, 68, 19, 1, 6.04, 6.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(196, 68, 20, 3, 2.90, 8.70, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(197, 69, 3, 2, 9.47, 18.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(198, 70, 8, 1, 4.70, 4.70, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(199, 70, 23, 2, 6.97, 13.94, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(200, 70, 29, 1, 5.51, 5.51, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(201, 71, 22, 3, 8.37, 25.11, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(202, 71, 9, 3, 9.52, 28.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(203, 71, 29, 3, 4.24, 12.72, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(204, 71, 9, 1, 8.39, 8.39, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(205, 71, 29, 1, 2.08, 2.08, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(206, 72, 5, 2, 4.12, 8.24, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(207, 72, 7, 2, 2.33, 4.66, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(208, 72, 30, 3, 3.80, 11.40, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(209, 73, 18, 2, 5.80, 11.60, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(210, 74, 30, 3, 9.50, 28.50, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(211, 74, 26, 1, 5.86, 5.86, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(212, 74, 8, 3, 5.86, 17.58, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(213, 74, 1, 2, 3.81, 7.62, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(214, 74, 1, 2, 3.37, 6.74, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(215, 75, 14, 1, 2.88, 2.88, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(216, 75, 30, 2, 7.58, 15.16, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(217, 75, 2, 1, 7.37, 7.37, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(218, 76, 6, 2, 9.61, 19.22, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(219, 76, 14, 2, 8.28, 16.56, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(220, 76, 19, 1, 2.04, 2.04, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(221, 76, 22, 1, 4.12, 4.12, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(222, 76, 29, 1, 5.78, 5.78, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(223, 77, 2, 2, 6.06, 12.12, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(224, 77, 9, 3, 3.15, 9.45, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(225, 78, 3, 3, 2.30, 6.90, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(226, 79, 25, 2, 4.83, 9.66, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(227, 79, 20, 3, 3.35, 10.05, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(228, 79, 15, 2, 6.65, 13.30, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(229, 80, 17, 1, 9.82, 9.82, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(230, 80, 21, 1, 2.92, 2.92, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(231, 80, 28, 2, 5.48, 10.96, '2025-09-28 02:07:05', '2025-09-28 02:07:05'),
(232, 80, 18, 1, 2.96, 2.96, '2025-09-28 02:07:05', '2025-09-28 02:07:05');

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
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'yJeEwH1xLs', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(2, 'Antone Hickle DDS', 'sheridan07@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'Hsqgi0vxVh', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(3, 'Jovan Littel', 'maynard.abernathy@example.net', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', '6dyts7jK5V', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(4, 'Jaycee Jacobson', 'feeney.stone@example.org', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', '8erEmbejy0', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(5, 'Loraine Johns', 'davon57@example.org', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'j4FEyn13MV', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(6, 'Davonte Frami', 'ardella.anderson@example.net', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'gbuRZPBb42', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(7, 'Mrs. Vernice Champlin DVM', 'qhuels@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'bnHfOkZ0yP', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(8, 'Martina Goodwin', 'demard@example.org', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'xwXsjeyPVE', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(9, 'Vivien Stracke', 'ewell.reichel@example.net', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', '4LxHKL8So9', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(10, 'Austin Kuhlman', 'stamm.carlos@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'V5RPBliVYd', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(11, 'Jonathon Mann', 'vonrueden.ocie@example.org', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'tRpLBIxzDW', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(12, 'Charley Stroman', 'nitzsche.margarita@example.net', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'WesmltpYOV', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(13, 'Ray Weimann', 'amelie.farrell@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'x6lXIxunpI', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(14, 'Alfonzo Spencer', 'frami.garfield@example.org', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'FhPMGGt6US', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(15, 'Efren Kertzmann', 'elang@example.net', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'MjL7MPCB4N', '2025-09-28 02:07:04', '2025-09-28 02:07:04'),
(16, 'Sam Miller', 'mckenna.medhurst@example.com', '2025-09-28 02:07:04', '$2y$12$egKUeH5/EXJlIaLEpMIsl.rrGyRRuJLLrUtVUDEyK9Lud3yccsZMq', 'RzorWlzbMu', '2025-09-28 02:07:04', '2025-09-28 02:07:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_modules`
--
ALTER TABLE `ai_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_ratings_user_id_item_id_unique` (`user_id`,`item_id`),
  ADD KEY `item_ratings_item_id_foreign` (`item_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `ai_modules`
--
ALTER TABLE `ai_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_ratings`
--
ALTER TABLE `item_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD CONSTRAINT `item_ratings_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
