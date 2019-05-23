-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 09:30 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uol_semester`
--

-- --------------------------------------------------------

--
-- Table structure for table `completed_tasks`
--

CREATE TABLE `completed_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2019_04_06_225253_create_tasks_table', 1),
(4, '2019_04_06_225316_create_completed_tasks_table', 1),
(5, '2019_04_06_225339_create_semesters_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(9, '2016_06_01_000004_create_oauth_clients_table', 2),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5bf506c4172dcc0fffb9d34425441e51af62c1d0f8fafee34cf8ea89fd12f63f6f1d6c7892971b67', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:12:53', '2019-04-09 14:12:53', '2020-04-09 19:12:53'),
('6143dd8e69fffef2ffa8a5dbdd36e90c0af10429fc9a9a6bc3298aaaba262e606a79737c9334846f', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:15:10', '2019-04-09 14:15:10', '2020-04-09 19:15:10'),
('8bc41f8e93148247c5f906a1928f4e82b121218c638eebf1f8c893fd3dc197ee808e849f67d7f2a9', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 09:46:17', '2019-04-09 09:46:17', '2020-04-09 14:46:17'),
('b49679ba43fce04d492e8d4f6468d3e316c4441f71c883c9444030e2647cc31710729940ee982c36', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 10:14:37', '2019-04-09 10:14:37', '2020-04-09 15:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Rc1f236W2wIjdvg9VV3E5fMPfHzC1dl9G5nwieUl', 'http://localhost', 1, 0, 0, '2019-04-09 09:33:19', '2019-04-09 09:33:19'),
(2, NULL, 'Laravel Password Grant Client', 'Qb2gA39qSL0tHeRMuxRG3eMNVXrxN43fuZX63yz5', 'http://localhost', 0, 1, 0, '2019-04-09 09:33:19', '2019-04-09 09:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-04-09 09:33:19', '2019-04-09 09:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `semester_title`, `semester_year`, `semester_type`, `status`, `created_by`, `isDeleted`, `created_at`, `updated_at`) VALUES
(1, NULL, '2019', 'Fall', 'active', 1, 0, '2019-04-07 19:00:00', '2019-05-19 14:49:42'),
(3, NULL, '2019', 'Fall', 'active', 1, 1, '2019-05-19 07:36:13', '2019-05-19 07:38:27'),
(4, NULL, '2019', 'Fall', 'active', 1, 1, '2019-05-19 07:36:17', '2019-05-19 07:38:18'),
(5, NULL, '2019', 'Fall', 'active', 1, 1, '2019-05-19 07:38:41', '2019-05-19 10:39:35'),
(6, NULL, '2019', 'Spring', 'active', 1, 1, '2019-05-19 07:43:33', '2019-05-19 10:39:38'),
(7, NULL, '2020', 'Spring', 'active', 1, 1, '2019-05-19 07:45:15', '2019-05-19 10:39:31'),
(8, NULL, '2019', 'Fall', 'active', 1, 1, '2019-05-19 07:46:15', '2019-05-19 10:39:28'),
(9, NULL, '2020', 'Summer', 'active', 1, 1, '2019-05-19 10:39:59', '2019-05-19 10:40:14'),
(10, NULL, '2020', 'Summer', 'active', 1, 1, '2019-05-19 10:40:48', '2019-05-19 10:40:58'),
(11, NULL, '2020', 'Summer', 'inactive', 1, 1, '2019-05-19 10:41:04', '2019-05-19 14:42:55'),
(12, NULL, '2020', 'Fall', 'active', 1, 0, '2019-05-23 14:07:56', '2019-05-23 14:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_id` int(11) NOT NULL,
  `task_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_date` date NOT NULL,
  `task_due_date` date DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `semester_id`, `task_title`, `task_type`, `task_status`, `task_date`, `task_due_date`, `isDeleted`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'tesitng title', 'typeof', 'upocing', '2019-04-12', NULL, '1', 'inactive', 1, '2019-04-07 19:00:00', '2019-05-19 14:30:51'),
(3, 1, 'this is the testing from views chrome', 'General', NULL, '2019-05-02', NULL, '1', 'inactive', 1, '2019-05-19 15:33:30', '2019-05-19 15:37:19'),
(4, 1, 'this is the testing from views chrome', 'Teachers', NULL, '2019-05-05', '2019-05-08', '1', 'active', 1, '2019-05-19 15:38:00', '2019-05-19 15:59:13'),
(5, 1, 'this is the testing from views chrome', 'Teachers', NULL, '2019-05-24', NULL, '1', 'active', 1, '2019-05-19 15:38:10', '2019-05-19 15:59:09'),
(6, 1, 'this is the testing from views chrome', 'Teachers', NULL, '2019-05-22', NULL, '0', 'active', 1, '2019-05-19 15:58:37', '2019-05-19 15:58:37'),
(7, 1, 'asdfwfsfa sfasdf asdf dasf', 'General', NULL, '2019-05-23', NULL, '0', 'active', 1, '2019-05-19 15:58:57', '2019-05-19 15:58:57'),
(8, 1, 'this is the testing from views chrome', 'General', NULL, '2019-05-22', NULL, '0', 'active', 1, '2019-05-21 10:07:07', '2019-05-21 10:07:07'),
(9, 1, 'Full day event in Pakistan', 'General', NULL, '2019-05-29', NULL, '0', 'active', 1, '2019-05-21 10:50:53', '2019-05-21 10:50:53'),
(10, 1, 'this is 21 century event', 'Teachers', NULL, '2019-05-21', NULL, '0', 'active', 1, '2019-05-21 10:51:48', '2019-05-21 10:51:48'),
(11, 1, 'Final Exams for Spring 2019', 'General', NULL, '2019-06-20', '2019-07-01', '0', 'active', 1, '2019-05-21 13:40:28', '2019-05-21 13:40:28'),
(12, 12, 'eid holiday 2020', 'General', NULL, '2019-06-05', NULL, '0', 'active', 1, '2019-05-23 14:08:39', '2019-05-23 14:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `image`, `phone`, `role`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'akhan', NULL, '3333639395', 'admin', 'active', 'admin@admin.com', NULL, '$2y$10$/lUqqx1NlAdBRyjRg1j.IeTDUEYlemY7PCRnlkjMbis.cHDWLThrm', NULL, '2019-04-07 14:57:34', '2019-04-07 14:57:34'),
(2, 'raheelkhan', 'raheel', 'khan', NULL, '932222332334', 'admin', 'active', 'rahil@gmail.com', NULL, '$2y$10$NuPlaJWmRXIDW2Gpfv6W9O0Gu6oe2tY.QTiSYBtH4NVA3hd5VseXO', NULL, '2019-04-09 09:45:48', '2019-04-09 09:45:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
