-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2019 at 03:52 PM
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
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `program_id`, `name`, `description`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'fall 2016', 'sfd asfsaf', 'active', 1, '2019-06-14 17:17:28', '2019-06-14 17:17:28'),
(2, 1, 'Fall 2015', 'this is description of the fall 15', 'active', 1, '2019-06-16 11:58:18', '2019-06-16 11:58:18');

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
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `course_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `teacher_id`, `program_id`, `course_code`, `semester_id`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 'safsaf', 20, 1, '668326', 22, 'active', 1, '2019-06-23 06:20:10', '2019-06-23 06:22:08'),
(4, 'Software Quality Engineering', 20, 1, '931300', 22, 'inactive', 1, '2019-06-23 06:21:16', '2019-06-23 06:21:55'),
(5, 'Operating System', 20, 1, '255402', 22, 'active', 1, '2019-06-25 02:18:18', '2019-06-25 02:18:18');

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
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(11, '2019_06_12_104705_create_batches_table', 3),
(12, '2019_06_12_110630_create_programs_table', 4),
(13, '2019_06_23_100616_create_courses_table', 5);

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
('117daab46beaef51343ec8067caac8f0a1aed9c244b28eebc85a96013aa991132f1c363a8b963b4a', 17, 1, 'Personal Access Token', '[]', 0, '2019-06-14 11:29:55', '2019-06-14 11:29:55', '2020-06-14 16:29:55'),
('17bab371ecbecbe8b5cd6f91876b81c4183c3f79feba29123b16c98c76d478ebc1254594b1eeaaa9', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 17:42:28', '2019-06-25 17:42:28', '2020-06-25 22:42:28'),
('29adafed02387f803bf48a377ee3da27ec07c281ee861bbd2d5ca316699551aa8c4f87d45a0f04f2', 18, 1, 'Personal Access Token', '[]', 0, '2019-06-14 13:14:33', '2019-06-14 13:14:33', '2020-06-14 18:14:33'),
('342d0ad3b1d0bb7674b5d7fa884bdbfcbd42bcafe932164dab75dd2d50168ff42223d988422f8d93', 15, 1, 'Personal Access Token', '[]', 0, '2019-06-12 16:02:56', '2019-06-12 16:02:56', '2020-06-12 21:02:56'),
('38e45978d1367dea055e7584a5f11bf08f0438e0f118e69a304b11c250147182e8d5faf7c72dec12', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 17:27:07', '2019-06-25 17:27:07', '2020-06-25 22:27:07'),
('4b4a32eda72b62e4540c832ff60c00433a5d8a65e6c6ad82520b9039846d6f26ee15a21984e8cf3d', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 17:34:44', '2019-06-25 17:34:44', '2020-06-25 22:34:44'),
('580f3f1e60a475d1083722457824a51ad744c4cb20bc89f3a8e6584acddd50a37c42b13148193510', 19, 1, 'Personal Access Token', '[]', 0, '2019-06-14 15:13:08', '2019-06-14 15:13:08', '2020-06-14 20:13:08'),
('5bf506c4172dcc0fffb9d34425441e51af62c1d0f8fafee34cf8ea89fd12f63f6f1d6c7892971b67', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:12:53', '2019-04-09 14:12:53', '2020-04-09 19:12:53'),
('5f7e4623ac0fb4b332fa170473e33657e3beda173e50cfb023bab5a3e1ac186dd65de70ae324b99e', 1, 1, 'Personal Access Token', '[]', 0, '2019-06-23 06:58:02', '2019-06-23 06:58:02', '2020-06-23 11:58:02'),
('6143dd8e69fffef2ffa8a5dbdd36e90c0af10429fc9a9a6bc3298aaaba262e606a79737c9334846f', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:15:10', '2019-04-09 14:15:10', '2020-04-09 19:15:10'),
('7d38048251781a039f4a2010abb35e0bab9e5addb6d435eb61dd3fe62bd14df09d528dd6f8098b56', 18, 1, 'Personal Access Token', '[]', 0, '2019-06-14 11:18:10', '2019-06-14 11:18:10', '2020-06-14 16:18:10'),
('8bc41f8e93148247c5f906a1928f4e82b121218c638eebf1f8c893fd3dc197ee808e849f67d7f2a9', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 09:46:17', '2019-04-09 09:46:17', '2020-04-09 14:46:17'),
('aa071c4de9bfb1189519316d7416de818ec0719477909d9ca8f7ecb63d5350e03bf47c625bdb6bc1', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 15:48:32', '2019-06-25 15:48:32', '2020-06-25 20:48:32'),
('b49679ba43fce04d492e8d4f6468d3e316c4441f71c883c9444030e2647cc31710729940ee982c36', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 10:14:37', '2019-04-09 10:14:37', '2020-04-09 15:14:37'),
('bd2210e849501d27d0d2eaf10d8ebe01adb3f55489dbf3aa424cc8b2bc5a6765d863865311224c25', 18, 1, 'Personal Access Token', '[]', 0, '2019-06-14 17:37:43', '2019-06-14 17:37:43', '2020-06-14 22:37:43'),
('bd2c237e2dddb714b1c857da6f7fb8a907b4b0125de0340b3aa08ed7a926c0d358caa16f6a77b38e', 17, 1, 'Personal Access Token', '[]', 0, '2019-06-14 11:19:02', '2019-06-14 11:19:02', '2020-06-14 16:19:02'),
('d2ccec2566542151242a73073bd8746a2476aed66949608a616369bf225971dc63fc376055a5592f', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 17:34:22', '2019-06-25 17:34:22', '2020-06-25 22:34:22'),
('d48b08922547bacd240149e6c939d490295927f04e385925bb2920fcc274ceaf6d8ea863d7efc061', 15, 1, 'Personal Access Token', '[]', 0, '2019-06-12 16:14:28', '2019-06-12 16:14:28', '2020-06-12 21:14:28'),
('e029fa63975697a99e660e27a55015757640fa3b31dc97e0ecf9265a93cc195deee4a485878a2212', 16, 1, 'Personal Access Token', '[]', 0, '2019-06-12 16:14:47', '2019-06-12 16:14:47', '2020-06-12 21:14:47'),
('e0353a6455603e73ea3cb6c0cf624a49462b88783cebbfcfb205cf8e0dd06c76f2f0aceb957240e2', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 17:05:11', '2019-06-25 17:05:11', '2020-06-25 22:05:11'),
('e9da75c3f5c0f3f1c0cedb2456246f0aa0b143bd61b9ccea0c031c2e8a9c65d5ddcf7f3216c7e74b', 23, 1, 'Personal Access Token', '[]', 0, '2019-06-25 16:15:17', '2019-06-25 16:15:17', '2020-06-25 21:15:17');

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
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `program_name`, `program_description`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Computer Science', 'dsfsdf', 'active', 1, '2019-06-14 17:17:20', '2019-06-14 17:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_start_date` date DEFAULT NULL,
  `semester_end_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `semester_title`, `semester_year`, `semester_type`, `semester_start_date`, `semester_end_date`, `status`, `created_by`, `isDeleted`, `created_at`, `updated_at`) VALUES
(21, NULL, '2022', 'Spring', '2019-06-02', '2019-08-15', 'inactive', 1, 0, '2019-06-12 13:42:28', '2019-06-23 05:42:23'),
(22, NULL, '2021', 'Spring', '2019-06-13', '2019-06-14', 'active', 1, 0, '2019-06-12 14:45:00', '2019-06-23 05:42:26');

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
(14, 22, 'tasdfdas fdsaf', 'General', NULL, '2019-06-15', NULL, '1', 'active', 1, '2019-06-12 15:14:54', '2019-06-12 15:34:18'),
(15, 22, 'this is 21 century event', 'Students', NULL, '2019-06-22', NULL, '1', 'active', 1, '2019-06-12 15:15:04', '2019-06-12 15:34:20'),
(16, 21, 'this is 21 century event', 'General', NULL, '2019-06-21', NULL, '0', 'active', 1, '2019-06-12 15:34:34', '2019-06-12 15:34:34'),
(17, 21, 'Full day event in Pakistan', 'Students', NULL, '2019-06-27', NULL, '0', 'active', 1, '2019-06-12 15:34:44', '2019-06-12 15:34:44'),
(18, 21, 'eid holiday 2020', 'General', NULL, '2019-06-07', NULL, '0', 'active', 1, '2019-06-12 15:34:56', '2019-06-12 15:34:56'),
(19, 21, 'teacher events', 'Teachers', NULL, '2019-06-21', NULL, '0', 'active', 1, '2019-06-14 15:23:17', '2019-06-14 15:23:17');

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
  `batch_id` int(11) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `image`, `phone`, `role`, `batch_id`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'akhan', NULL, '3333639395', 'admin', 1, 'active', 'admin@admin.com', NULL, '$2y$10$/lUqqx1NlAdBRyjRg1j.IeTDUEYlemY7PCRnlkjMbis.cHDWLThrm', NULL, '2019-04-07 14:57:34', '2019-04-07 14:57:34'),
(16, 'raheelkhan@gmail.com', 'raheel', 'khan', NULL, '147852', 'user', 123, 'inactive', 'raheelkhan@gmail.com', NULL, '$2y$10$4HxX5u0NH1pDTrVdLn7tsOaByiXouBoR4G4w0H0CQfW0iGntSNvJW', NULL, '2019-06-12 16:14:23', '2019-06-15 16:37:19'),
(17, 'disthis', 'dskajf d', 'kdjflkasfd', NULL, '92366565656', 'user', 1, 'inactive', 'dithis@gmail.com', NULL, '$2y$10$gD.hJYvs/d0obcUxYwqRNerdT4QOUMvEzRqPFJJ0c59bP.eqY.XGu', NULL, '2019-06-14 11:03:40', '2019-06-15 16:16:13'),
(18, 'dslfjkldsf4d1', 'sdlfjld', 'dasfsaf', NULL, '9324556421', 'user', 1, 'inactive', 'sajdf22fsddf@dgj.com', NULL, '$2y$10$E8ej20BjIwiV8k834.F4uOFZCtZl4xQMyIlqA8qfeWXlrbHlq8XVC', NULL, '2019-06-14 11:17:44', '2019-06-15 16:16:11'),
(20, 'admin@admidfdn.com', 'Ayaz', 'Yasin', NULL, '304504504011', 'teacher', 1, 'active', 'ayzekhn@gmail.com', NULL, '$2y$10$z5PSvxlVq259MkiEkmvSU.G2g6hdnR3H8pRE083CrvWL0/BlcrsfG', NULL, '2019-06-15 17:20:50', '2019-06-15 17:24:14'),
(21, 'dslfjkldsf4d1ss', 'sdlfjld', 'dasfsaf', NULL, '932455642111', 'user', 1, 'active', 'sajdf22fsssddf@dgj.com', NULL, '$2y$10$b/yBnCiyjfwtMS2PgLQa2.Av5RDwpGtaHzTALvKBvfGPgY8BRs2nC', NULL, '2019-06-15 17:23:41', '2019-06-15 17:24:20'),
(22, 'arshadalikhan', 'teacher', 'khan', NULL, '92838383', 'teacher', 2, 'active', 'teacher@teacher.com', NULL, '$2y$10$I2ltNuiSZnGsCdt0lkSXJuQFwBcbmCRpzgxhrYzoeXGuLTEu3XxOC', NULL, '2019-06-16 15:28:02', '2019-06-16 15:28:02'),
(23, 'kartoos@gmail.com', 'kartoos', 'khan', NULL, '12345697', 'user', 1, 'active', 'kartoos@gmail.com', NULL, '$2y$10$TmqJbrishUdRG3UEUv.E7emeqx8KnV5g3I7GEtq8dmUnrTiuCuJpS', NULL, '2019-06-25 15:39:01', '2019-06-25 15:48:19'),
(24, 'ihilalaa2', 'Hilal', 'Ahmad', NULL, '12336332', 'user', 2, 'inactive', 'ihilalsa2@gmail.com', NULL, '$2y$10$GW/rzgIECetHx7vNeDcxluIlkCAkcA9qdcFsrDqgZRPomr9p1eYyi', NULL, '2019-06-25 17:14:03', '2019-06-25 17:14:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
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
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
