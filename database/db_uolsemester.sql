-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2019 at 03:19 PM
-- Server version: 10.1.40-MariaDB-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rahezrww_db_uolsemester`
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
(11, 6, 'Fall 2015', 'this is fall 15 batch of software engineering', 'active', 1, '2019-06-15 02:31:24', '2019-06-15 02:31:24'),
(12, 5, 'Fall 2017', 'ths is f17 for cs', 'active', 1, '2019-06-15 02:31:33', '2019-06-15 02:31:33'),
(13, 6, 'Spring 2015', 'this is s15 for SE', 'active', 1, '2019-06-15 02:31:47', '2019-06-15 02:31:47'),
(14, 6, 'Spring 2016', 'This is s16 for se', 'active', 1, '2019-06-15 02:36:31', '2019-06-15 02:36:31'),
(15, 6, 'Spring 2017', 'this is s17 for se', 'active', 1, '2019-06-15 02:36:50', '2019-06-15 02:36:50'),
(16, 5, 'fall 2015', 'this is s15 for cs', 'active', 1, '2019-06-15 02:37:06', '2019-06-15 02:37:06'),
(17, 6, 'Fall 2109', 'fall 2019 batchi shere', 'active', 1, '2019-06-16 20:59:10', '2019-06-16 20:59:10');

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
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(11, '2019_06_12_104705_create_batches_table', 3),
(12, '2019_06_12_110630_create_programs_table', 4);

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
('0556ef3bff4d9ee58ed5df0ddfbc05bd1a38b3aac57ca2301b0de7e759c22646f575f2c378bb36b0', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:50:08', '2019-06-14 23:50:08', '2020-06-14 19:50:08'),
('071401544ffd457004c5a398aad5f547c126154a4f9b473a6defaf5fac4e60da8fba06694825068e', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:34:20', '2019-06-15 01:34:20', '2020-06-14 21:34:20'),
('0af233dfa017f8d118d688ab07b496ae8ab6e2f77582457511e0e2dc3d616403a7f4a40f16fac7bf', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:45:57', '2019-06-16 21:45:57', '2020-06-16 17:45:57'),
('0bffa0f91664eaa11f6c86c2a024740e36b68816bb22a526203fb270394dca83877daeefe822d2c7', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:19', '2019-06-16 17:46:19', '2020-06-16 13:46:19'),
('0c70bf6501311334e0a2bfeea2f6b148fd37681385cf4fc16f773e9dd2e095e99ffd9ed85a9637a9', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 16:23:56', '2019-06-16 16:23:56', '2020-06-16 12:23:56'),
('0cec0c382f5a4da5d746f7111c581bea84d9e4d94ce77bd411b917d81a475548273fd7d1c54da830', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:34:52', '2019-06-14 23:34:52', '2020-06-14 19:34:52'),
('0dd157b257ddcbcb90e609d53ab8c0118f2292fa48c1da18cb08a8bf4ea179a9898ee69b1b5524ac', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:48:02', '2019-06-15 01:48:02', '2020-06-14 21:48:02'),
('182660cf9cde3e49672937fbc61f633c4bc87cddc75d2d5761e4c826df0d5f351e31b6c4e826f9fc', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:10:21', '2019-06-14 20:10:21', '2020-06-14 16:10:21'),
('20d9a1362f8d8fbe6d65cd32516f93281d66e7c5e30d268d1ea9ef98505799c69164267079d78e26', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:00:02', '2019-06-16 19:00:02', '2020-06-16 15:00:02'),
('2176a67ce18a7424f6802bb7570ac35e8a94f03b4150e070be6e25c586e2102515a949dc00871e74', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:41:24', '2019-06-15 22:41:24', '2020-06-15 18:41:24'),
('223b5458292ebca1265605bd963f97087ba1664f5938927add097d4c6b34f8a07b0be0501be13b39', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:42:25', '2019-06-15 22:42:25', '2020-06-15 18:42:25'),
('252fe149b05a5af9a754480b7483e9bad637c14ede95128c93cfaca926ba592b2b0744e88772d742', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:26:10', '2019-06-14 22:26:10', '2020-06-14 18:26:10'),
('25a8ada77f2e84e1624c0c7303e391ba88fa242b31a719a48e5ce2d467733700c00d40ca82603f2f', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:12:51', '2019-06-14 23:12:51', '2020-06-14 19:12:51'),
('29e1a9515f6877b96fd7ba9b4cf68c39273f0dd65d011fb0fb899fa96fc98eaf41b866de0cd427d6', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:16:55', '2019-06-15 22:16:55', '2020-06-15 18:16:55'),
('2b0840b2f557bb45ceea93bc8da27f0e755bc071061c98372ddca1efcdb6843a2fd925a602e4ee5c', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:53', '2019-06-16 17:46:53', '2020-06-16 13:46:53'),
('2d5af541dbcdedc3b7570b983e656ebb5703333ac47509dc767161e9d976cc5d2df6c28f5c9012c9', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:09:04', '2019-06-14 22:09:04', '2020-06-14 18:09:04'),
('3036bb3ff52ff81c59afbd38ade42ded4e69bb623e8d32a85c93cd00d17e04238298de4b8806e074', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:37:49', '2019-06-14 22:37:49', '2020-06-14 18:37:49'),
('342d0ad3b1d0bb7674b5d7fa884bdbfcbd42bcafe932164dab75dd2d50168ff42223d988422f8d93', 15, 1, 'Personal Access Token', '[]', 0, '2019-06-12 16:02:56', '2019-06-12 16:02:56', '2020-06-12 21:02:56'),
('34ddb3d503504eaeda0352ea4f12a91eba8dd709c3d0fcf7f6b9a8b95ddc9bc9e8d7908659a84921', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 20:56:45', '2019-06-16 20:56:45', '2020-06-16 16:56:45'),
('37e4b505953798daca4f774e0b8110e2e1ec466024dfc839b6ec37e07ed5950fd81f0d3a227aff24', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 03:22:09', '2019-06-15 03:22:09', '2020-06-14 23:22:09'),
('3bf8104fbc52d3864c6ca105eb907baef3a3fbd64f1edab9f981e357e5ab6e34a8ab5a394b3c8634', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:13:56', '2019-06-14 20:13:56', '2020-06-14 16:13:56'),
('3d080ff41902fd7d232c1e5185e98954907d7bf72c3bfd0a1c9e7eb2536d1cbbcc185693a674ac6d', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 23:49:12', '2019-06-15 23:49:12', '2020-06-15 19:49:12'),
('41b2ea6f8ef856773f392bf33b5c4a1c03da7dffb9d9a81a9b75fa3fbc5de46f1712a09195e3c14d', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 02:00:41', '2019-06-15 02:00:41', '2020-06-14 22:00:41'),
('426d8dbe9db9586369cf14af3d2aa084d7061a77ffd4f7258f307cfc0a8a75921122920415076533', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:07:29', '2019-06-16 19:07:29', '2020-06-16 15:07:29'),
('446eadb7fd5983869c14ddb6ad6861f50ca0ebca82571211587d64148bbb5d6bfe72a1be909ddc87', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:01:51', '2019-06-16 21:01:51', '2020-06-16 17:01:51'),
('456dc009fbc9a93b9aa28ab7d0c1f513897edeaa13c81f922c270f63b27c6f47110f79e923074b29', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:50:22', '2019-06-14 23:50:22', '2020-06-14 19:50:22'),
('4ba4e3f18426903ae417edc83b112e9330ea0f575edcf4425aa4adde0b2d556d14efe2d91c2665f9', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:41:46', '2019-06-14 23:41:46', '2020-06-14 19:41:46'),
('4d2fa663293a8e94b5ac5814e73f025c6c9530bff3238f72f834b1538977792ea938454008a6c4d7', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:40:07', '2019-06-14 23:40:07', '2020-06-14 19:40:07'),
('4e1ec7763ad9b144f532c075d08adf08c854582a37f9f3c1ba4a46ac874a56170d281dda480b0399', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:58:49', '2019-06-15 01:58:49', '2020-06-14 21:58:49'),
('50380e6067f6224c524a0980977cb4284b719b4ff4e99e7a339198fad5ed30e5c0c4f0b898cccf02', 28, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:35:13', '2019-06-16 21:35:13', '2020-06-16 17:35:13'),
('5677c325a5431fc6694aba5354272f3dc64c27f1483276cbf527b568c60595390c1dd34030cb4679', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 19:34:16', '2019-06-14 19:34:16', '2020-06-14 15:34:16'),
('5893ecec2a8760b2e96581152220256f4158f3665fa6efc7a605c19938d4fdb934cd52a1c07cabec', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:01:27', '2019-06-14 23:01:27', '2020-06-14 19:01:27'),
('5954e7f9a886a79877b8232247759784b507223aa82d0464866ecda7b7567851cf06b3467d1eac01', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:20:16', '2019-06-15 01:20:16', '2020-06-14 21:20:16'),
('5aaab8aa1d1224683efc1b1ee9abf61d2e43878f16a9d249471ac9970a5483a2b6887d2c426283d0', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:07:00', '2019-06-16 19:07:00', '2020-06-16 15:07:00'),
('5bf506c4172dcc0fffb9d34425441e51af62c1d0f8fafee34cf8ea89fd12f63f6f1d6c7892971b67', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:12:53', '2019-04-09 14:12:53', '2020-04-09 19:12:53'),
('5e37a186542ed3f552f405726af20781c0effddd4d87924995749892a3c6beec8bf77c9f0b9fe32c', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 19:51:34', '2019-06-14 19:51:34', '2020-06-14 15:51:34'),
('5efc9d5dc97d70806f14b6dc63055de838f8808f07de859257c800646c951feb8ec9d0e70085de8b', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:10:11', '2019-06-14 20:10:11', '2020-06-14 16:10:11'),
('6143dd8e69fffef2ffa8a5dbdd36e90c0af10429fc9a9a6bc3298aaaba262e606a79737c9334846f', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 14:15:10', '2019-04-09 14:15:10', '2020-04-09 19:15:10'),
('67ffa87942196b5cd7987b7b8e8ab8a75245c1f1782762656676adc31a8a542401c6e63f649e1827', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:13:15', '2019-06-16 19:13:15', '2020-06-16 15:13:15'),
('712458152b86229e28583d5bb4302d01271d21b79f47a45fa43f66109417e48797ec093681862c1a', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:45:29', '2019-06-15 01:45:29', '2020-06-14 21:45:29'),
('71b82d0cf9b26e96257c855ba7c025bf7f430e20b580cc6920faf2873d38c18444b7bb41ce508653', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:55:20', '2019-06-14 23:55:20', '2020-06-14 19:55:20'),
('71ccbc8a5f5c976ef9b922caaeec714ff57982b47c123b25cedaf04a94970da102638a389ab0ff44', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:13:30', '2019-06-14 20:13:30', '2020-06-14 16:13:30'),
('7278a528e1adf313c4ee123b81fe4eca465ade5a6867126411890f7ee2da40894367dad2880f0f80', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:44:37', '2019-06-14 20:44:37', '2020-06-14 16:44:37'),
('72d1825e54506d1c7940796ee92584686af7cbf4dec16967ede0004959f6196a5214a7989eaea8ee', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:16:59', '2019-06-15 01:16:59', '2020-06-14 21:16:59'),
('74be658799f7afebda1447ef08226f6fed440477c32f6aec597b54949fa13e1d5ef578c466a0e49e', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:01:11', '2019-06-16 21:01:11', '2020-06-16 17:01:11'),
('78be70e04de788cedd3caf84b11b5df4949b0ef5ab42654fba018bdaa85ae0888f5e7f872e2f5882', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:12:09', '2019-06-14 23:12:09', '2020-06-14 19:12:09'),
('78d0318d539bcb7484ed86f4ee3a43b79caaece74922e2c27ef53c870d1a2fcaa235366ef998f977', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:48:01', '2019-06-14 23:48:01', '2020-06-14 19:48:01'),
('7d714d2483b43a24d539b9148f30ce194ad75b9b25a498868cfefab6ead58458e403712848cd1534', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:29', '2019-06-16 17:46:29', '2020-06-16 13:46:29'),
('80ca3af9de96f6b9864fbfd5513e7c3d0e129a699e8385e2e4900b3d3ff96a419c0e46af749d8125', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:51', '2019-06-16 17:46:51', '2020-06-16 13:46:51'),
('8140d590753cac4c1627c0bb435e1b4c1a5fce2b00fcd5cd0c2dd69be450d2f08e535cffb065b054', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:48:29', '2019-06-14 23:48:29', '2020-06-14 19:48:29'),
('82da20fe8e964fcb7bdb33c80ff651ccb8094f14ba7204f79df2861c97d47f2ebd8875efc974d538', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:43:30', '2019-06-15 01:43:30', '2020-06-14 21:43:30'),
('8602360fe3271b5fbdc9fc20f206da458419536f89a3248859139dee14578ca29eb11f6176bce113', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:17:52', '2019-06-15 22:17:52', '2020-06-15 18:17:52'),
('869b8051c7056fb376223bcfb120383560da71c4136bf225bec15a2491f2bf5ab86cacf23ea7c056', 20, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:57:30', '2019-06-14 23:57:30', '2020-06-14 19:57:30'),
('897d2cb2f61666967a585f1f734101936b92dc1f3d31518a217c853e56dba6028a5d818d5a258b6c', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 02:16:28', '2019-06-16 02:16:28', '2020-06-15 22:16:28'),
('8ab42d92ff4045d30ccdc09c144598425294208b6bf5f4aa45b56b73e458537140d0f81c7a2cfa66', 20, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:12:10', '2019-06-14 23:12:10', '2020-06-14 19:12:10'),
('8b59d629a1a8f905c168a2ca38ba6ea9ade95138190d43f53e4b299ddcc5db6690f30e9c06b5e2b8', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 20:57:49', '2019-06-16 20:57:49', '2020-06-16 16:57:49'),
('8bc41f8e93148247c5f906a1928f4e82b121218c638eebf1f8c893fd3dc197ee808e849f67d7f2a9', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 09:46:17', '2019-04-09 09:46:17', '2020-04-09 14:46:17'),
('8c2cc9797f66e1cc1f56150dcfdfcfb65a9ec34df0e368c0a33056a21eb8c136d2da038eac2fd385', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:06:59', '2019-06-16 19:06:59', '2020-06-16 15:06:59'),
('8fb7f3eecf7626944f62c072dba725242384b0d5e3316e198ee0ecbf3b5137954e03df2e3a1d94ac', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:12:26', '2019-06-15 22:12:26', '2020-06-15 18:12:26'),
('9035241904ffe2645e3fd7b32220fd922369d08768364eb4245507eef916b1ad0fd20b9f88a66cef', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:32:12', '2019-06-14 23:32:12', '2020-06-14 19:32:12'),
('9483d54f93c40f4bef861c1ca503183b8fca1f60770cca9e5e75565eace1c2b967a33d3929fecee0', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 03:21:01', '2019-06-15 03:21:01', '2020-06-14 23:21:01'),
('94b3926d7661e835d6fa1502026aa26fce15b2a6c972d68bf5d820598ba8c11b96a37724f347374e', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:30:35', '2019-06-15 01:30:35', '2020-06-14 21:30:35'),
('9b3087521d33624b8e721b9251a3824f87512cd773c294ab95348d375f2fa8e921122ae32b1d39a0', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:52:01', '2019-06-14 23:52:01', '2020-06-14 19:52:01'),
('9d13b2945114547efdfca0379ecd417db275b24b00887335650c13accfe188c5147cef7f5a48e8f8', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:49', '2019-06-16 17:46:49', '2020-06-16 13:46:49'),
('9f46b052ca7e1c1269965555b593d8e88bd23bdcfdb8f086d136a445768b013e6a800ec1f6620daf', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 03:25:26', '2019-06-15 03:25:26', '2020-06-14 23:25:26'),
('9f5688983c73df3f0ab7575fd258ebdacaf28b1b29c7977241f2774a732385d9dc0a9fa5a1b7b0a7', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:15:16', '2019-06-15 22:15:16', '2020-06-15 18:15:16'),
('a2e93084cec24d6be4a1d536e71c2334740dc9dc911551cb0a38a630f73655db1dd2f6da4fe570d9', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 21:58:06', '2019-06-15 21:58:06', '2020-06-15 17:58:06'),
('a2f2ec8d6f2f8889c2b739b84e7ab1a650a2c346e10e9c3686b9fc4dba33b96b62230857fec180fc', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:55:24', '2019-06-15 01:55:24', '2020-06-14 21:55:24'),
('a551a57e058dc95fda6e209f989177498dc70dcdef0ec9264b77650dc1d427a0f3c4f8c2bb491250', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:39:21', '2019-06-15 01:39:21', '2020-06-14 21:39:21'),
('a72ec0c55e3b4c19cbffe03deb970a3700cd0090f88fbea33d09b53b37ca4a16fe394f509d5687fb', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:57:28', '2019-06-14 22:57:28', '2020-06-14 18:57:28'),
('ac22ef5e58f97624e9ebe6fd1fa6de2429f108ffeeed61f3674d62a30bfcd6a5608f2bcb1f605a33', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 18:57:41', '2019-06-16 18:57:41', '2020-06-16 14:57:41'),
('b38341b87603d026ad7c40bbd71124e8999a8f0689f921fc1e8c0b6959ff5d1f71b019e9dc0b8461', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:23:08', '2019-06-15 01:23:08', '2020-06-14 21:23:08'),
('b49679ba43fce04d492e8d4f6468d3e316c4441f71c883c9444030e2647cc31710729940ee982c36', 2, 1, 'Personal Access Token', '[]', 0, '2019-04-09 10:14:37', '2019-04-09 10:14:37', '2020-04-09 15:14:37'),
('b4f8bb414767379a70212a6f75a4b7b1e4dd8b1dbd97a72a98b1d069e2eb3463e00b86cfbdeee501', 28, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:35:13', '2019-06-16 21:35:13', '2020-06-16 17:35:13'),
('b5416c9b98b55af06c33b487bbb3701fd912d1194ec07076255de13f39375d30aaf32a23c63e8e1b', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:06:49', '2019-06-16 21:06:49', '2020-06-16 17:06:49'),
('b7f676054acd9c00c40050f89864b291efb316b9505e332cc3d831a5e99014f3861aaf93246b67c5', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 19:07:28', '2019-06-16 19:07:28', '2020-06-16 15:07:28'),
('baeb3c0c8ecc4fea05489e75672c80c033498c9d2667b80505d94d768b83fea70ba26a05d014fcc2', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:03:57', '2019-06-14 22:03:57', '2020-06-14 18:03:57'),
('bd3d888b7437870904f4e70ec031e1760681af1b08d10a103dd9e6794c7fde0852aa619c326f1c52', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:49:31', '2019-06-15 01:49:31', '2020-06-14 21:49:31'),
('c5e48b134e9aca61287bac21ffab71fe254eded36df1ec1d5c0f00f35d5673b32a3c8bcda07e563d', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:44:11', '2019-06-15 01:44:11', '2020-06-14 21:44:11'),
('cc22a72c8bc59f13afe0c4727df747f7126b0b4af21f4a63bb9a2088b51c4238d595b4c98071b9d3', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:32:11', '2019-06-15 01:32:11', '2020-06-14 21:32:11'),
('d0ac9e8c2e9cf4f365f2dce89d84ba14608561f60e287b60c45518e2e5087164842f3181d10b1d4b', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:29:41', '2019-06-16 21:29:41', '2020-06-16 17:29:41'),
('d2be744739f47a2f3aa800fd62bbfcf9144d6da10e102c29581fbfa3f956d62e2699226c2e6ac76f', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 17:46:53', '2019-06-16 17:46:53', '2020-06-16 13:46:53'),
('d4296e0d2b4038853dc8f0d2e26d24ed6f275c430dea4494aaee1b0aaf03d5a9bebbf9cd1d33266c', 28, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:29:23', '2019-06-16 21:29:23', '2020-06-16 17:29:23'),
('df3b840468b7dbec9624a834871671e1227f62d49ab7f74b1ce83797fd4a9a77159032b7f6b0dea5', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:41:16', '2019-06-14 22:41:16', '2020-06-14 18:41:16'),
('e14d798af6d6188f4d7c3f39339c29eb2586a43e10b8c15eb3f549d21641b8e5d2518de7e4e939c7', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:14:24', '2019-06-14 22:14:24', '2020-06-14 18:14:24'),
('e203f730e8bc57827298e63b07a181ad7ab840e87c01b33db85d2b13f0a99228c3bf51f72ff9ed47', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:45:53', '2019-06-16 21:45:53', '2020-06-16 17:45:53'),
('e31ba8009142a877f6eb849f84ec51f74bd16d8366930ca20c792594a553e7ea7043edfd8e787e04', 27, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:26:14', '2019-06-16 21:26:14', '2020-06-16 17:26:14'),
('e5244dbc2859825cb2684ddb10ef8b264f4050ac5f90c0eb86c7106e272f4d412c02a9dae8b96045', 20, 3, 'Personal Access Token', '[]', 0, '2019-06-16 21:25:19', '2019-06-16 21:25:19', '2020-06-16 17:25:19'),
('e7dfafdaa2d86f897e5fe32ea2f13c28057ac3a8106fc01d3de3446cbf2dcc4d6be662ff0fd9a9c8', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:10:11', '2019-06-15 01:10:11', '2020-06-14 21:10:11'),
('ea203f5d3b7328d52f8d68097484aba620f8ff2b0f7f795d37732428b077013d918b814b0944abc4', 16, 3, 'Personal Access Token', '[]', 0, '2019-06-13 01:16:34', '2019-06-13 01:16:34', '2020-06-12 21:16:34'),
('ec072ae126076729f377ff3ad86e1ff89de658cb9a702f43173f27e076faad2dda393e1aa5c7cf75', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 22:38:57', '2019-06-14 22:38:57', '2020-06-14 18:38:57'),
('f30617587560cee23894d616f4ab3a26570e067226e918f58d33a89aaaea0cacbd3521eeb8013d50', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 02:02:07', '2019-06-15 02:02:07', '2020-06-14 22:02:07'),
('f3d12120ed901908e6dd7710a620f19bc7a665e1c7700e989bb1ab6fd197cf2ff4dea5773bedf53c', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 20:44:00', '2019-06-14 20:44:00', '2020-06-14 16:44:00'),
('f5040f242e2e25b79bca787455c0a97efa1a22bb1b99f266dcef9554f120de54dc0b459a6a4d5eac', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 23:13:07', '2019-06-15 23:13:07', '2020-06-15 19:13:07'),
('f5693939469067a3d666fd46e82763b86d2a9b60f3825dce5ceed6473aee1efa5fda2e52d709d8a3', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 23:48:57', '2019-06-14 23:48:57', '2020-06-14 19:48:57'),
('f738eab4b137d6eff446d496c3e0dc6dcd85d1674237de250db10aab0b38d4f6d0dab24713abb8d2', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 22:01:22', '2019-06-15 22:01:22', '2020-06-15 18:01:22'),
('faa1eca48f27ba7a4a2a1fc3ffd8b2c90cb7ac50095ec867e8b7e3cfd9fe9e5bef8debc8c57b438c', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 19:38:15', '2019-06-14 19:38:15', '2020-06-14 15:38:15'),
('fc5d78bbf4c074e14288dbd29f16b446192b0e41ee0f48736719a15da8b0c1b49684f523354f21ae', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-15 01:19:01', '2019-06-15 01:19:01', '2020-06-14 21:19:01'),
('ff01d7466301028413c7e885f5b49404e0bd3e9b52a32f939313d3d5b7666c5e010a4d2727b11aa9', 17, 3, 'Personal Access Token', '[]', 0, '2019-06-14 21:57:40', '2019-06-14 21:57:40', '2020-06-14 17:57:40');

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
(2, NULL, 'Laravel Password Grant Client', 'Qb2gA39qSL0tHeRMuxRG3eMNVXrxN43fuZX63yz5', 'http://localhost', 0, 1, 0, '2019-04-09 09:33:19', '2019-04-09 09:33:19'),
(3, NULL, 'Laravel Personal Access Client', '8p5VJVoBdZVZDZH5gHqmcwNZoBvJPy20RkcxpweK', 'http://localhost', 1, 0, 0, '2019-06-13 01:15:41', '2019-06-13 01:15:41'),
(4, NULL, 'Laravel Password Grant Client', 'PyDUTY3GKcej0Ci8bhksgSEurTLDWo5Sx1d21FcK', 'http://localhost', 0, 1, 0, '2019-06-13 01:15:41', '2019-06-13 01:15:41');

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
(1, 1, '2019-04-09 09:33:19', '2019-04-09 09:33:19'),
(2, 3, '2019-06-13 01:15:41', '2019-06-13 01:15:41');

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
(5, 'Computer Science', 'this is computer science department', 'active', 1, '2019-06-15 02:30:51', '2019-06-15 02:30:51'),
(6, 'Software Engineering', 'this is software engineering department', 'active', 1, '2019-06-15 02:31:05', '2019-06-15 02:31:05');

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
(21, NULL, '2022', 'Spring', '2019-06-02', '2019-08-15', 'active', 1, 0, '2019-06-12 13:42:28', '2019-06-12 13:42:28'),
(22, NULL, '2021', 'Spring', '2019-06-13', '2019-06-14', 'active', 1, 0, '2019-06-12 14:45:00', '2019-06-12 14:45:00');

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
(19, 21, 'this is for the month of june', 'General', NULL, '2019-06-15', NULL, '0', 'active', 1, '2019-06-15 01:03:26', '2019-06-15 01:03:26'),
(20, 21, 'this is june 2', 'Students', NULL, '2019-06-19', NULL, '0', 'active', 1, '2019-06-15 01:03:47', '2019-06-15 01:03:47'),
(21, 22, 'exam', 'General', NULL, '2019-06-26', NULL, '0', 'active', 1, '2019-06-15 22:15:01', '2019-06-15 22:15:01'),
(22, 22, 'exam', 'General', NULL, '2019-06-26', NULL, '1', 'active', 1, '2019-06-15 22:15:03', '2019-06-15 22:15:35'),
(23, 22, 'Mid term exams start today', 'General', NULL, '2019-06-29', NULL, '1', 'active', 1, '2019-06-15 22:16:38', '2019-06-15 22:17:12'),
(24, 22, 'Mid term exams start today', 'General', NULL, '2019-06-29', NULL, '1', 'active', 1, '2019-06-15 22:16:41', '2019-06-15 22:17:20'),
(25, 22, 'Mid term exams start today', 'General', NULL, '2019-06-29', NULL, '0', 'active', 1, '2019-06-15 22:16:42', '2019-06-15 22:16:42'),
(26, 22, 'Mid term exams start today', 'General', NULL, '2019-06-29', NULL, '1', 'active', 1, '2019-06-15 22:16:47', '2019-06-15 22:17:33'),
(27, 22, 'Mid term exams start today', 'General', NULL, '2019-06-29', NULL, '1', 'active', 1, '2019-06-15 22:16:49', '2019-06-15 22:17:33');

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
(15, 'dslfjklsf4d1', 'sdlfjld', 'dasfsaf', NULL, '932426556421', 'user', 1, 'active', 'sajdf22fsdf@dgj.com', NULL, '$2y$10$xgpeB.pB5L1a7X/T0Fb20.LmgwPfWFlxWpnZ9pGUZhJpU6YDGFhGG', NULL, '2019-06-12 16:02:46', '2019-06-12 16:02:46'),
(16, 'dslfjklsf4d12', 'sdlfjld', 'dasfsaf', NULL, '9324265421', 'user', 1, 'active', 'sajdf22fsd1f@dgj.com', NULL, '$2y$10$H35gIJljjKb2dd8TjfnO7uqh0Qe/Ov3sDCOoh0E5aXQEIjgyGu/tS', NULL, '2019-06-13 01:16:15', '2019-06-13 01:16:15'),
(17, 'disthis', 'dskajf d', 'kdjflkasfd', NULL, '92366565656', 'user', 1, 'active', 'dithis@gmail.com', NULL, '$2y$10$1tu9CcglDrmoK1SMw64K.uLFrpCe0d4lCM.jL9c2Ql1c3FfLtjSsW', NULL, '2019-06-14 19:34:03', '2019-06-14 19:34:03'),
(20, 'disthisz1', 'dskajf d', 'kdjflkasfd', NULL, '923665656521', 'teacher', 1, 'active', 'test@gmail.com', NULL, '$2y$10$Q0L4Opfo0vWTz/467iXSi.og3pNhRm7j.SLdrECbNj01L6cvSo2mu', NULL, '2019-06-14 23:11:39', '2019-06-14 23:11:39'),
(21, 'ihilal', 'Hilal', 'Ahmad', NULL, '12336', 'user', 2, 'active', 'ihilal@gmail.com', NULL, '$2y$10$gq3gcDaSVG0CcGYCyIgn0uC9c12dE/VBGQ2ZK8sZnMvLK9NO41RNW', NULL, '2019-06-15 12:46:56', '2019-06-15 12:46:56'),
(22, 'ihilala', 'Hilal', 'Ahmad', NULL, '123363', 'user', 2, 'active', 'ihilala@gmail.com', NULL, '$2y$10$dO4/6/1kw.xaczY6NsNGMuQGdrekbpIgELTdJEaJQb76RKLrA9oyC', NULL, '2019-06-16 12:16:46', '2019-06-16 12:16:46'),
(23, 'danyalahmad@gmail.com', 'danyal', 'ahmad', NULL, '123456', 'user', 12, 'active', 'danyalahmad@gmail.com', NULL, '$2y$10$OL1MzWBNZcjV/MW9xPVxxOFsB7rUX2MVc/Dyb/VV2WDfaCTpC7G66', NULL, '2019-06-16 12:41:04', '2019-06-16 12:41:04'),
(24, 'anas@gmail.com', 'anas', 'khan', NULL, '1234', 'user', 11, 'active', 'anas@gmail.com', NULL, '$2y$10$aDleABriSDTK46nz2PsueeoEkfx7tVA4MHed0dbgd4hZHobQ5oifG', NULL, '2019-06-16 19:12:08', '2019-06-16 19:12:08'),
(25, 'ihilalah@gmail.com', 'hilal', 'khan', NULL, '1477', 'user', 11, 'active', 'ihilalah@gmail.com', NULL, '$2y$10$PPlaJqUQwLGKam4Om2XVSumg7uTgi1i3KqkxcpwEEDLeGS/SVx5/S', NULL, '2019-06-16 20:35:20', '2019-06-16 20:35:20'),
(26, 'scor@gmail.com', 'hilal', 'khan', NULL, '147369', 'user', 17, 'inactive', 'scor@gmail.com', NULL, '$2y$10$t.UfIx/kARmcIB7WMqVRvePJxpLUIJv2zZro5/jb8p4Xeh1QFbOtm', NULL, '2019-06-16 21:03:38', '2019-06-16 21:03:38'),
(27, 'disthisz15', 'dskajf d', 'kdjflkasfd', NULL, '92366565655', 'user', 12, 'inactive', 'gagaga@gmail.com', NULL, '$2y$10$oth1Tlx27oZbF5JJrFwhQO0zNdsriHlfY9e1qGwEzyLsniFzWHjFG', NULL, '2019-06-16 21:25:58', '2019-06-16 21:25:58'),
(28, 'disthisz154', 'dskajf d', 'kdjflkasfd', NULL, '92366565654', 'user', 12, 'active', 'gagagag@gmail.com', NULL, '$2y$10$Sy5X.2vGY.zViHXMIs.qk./qWWhdWOycl6sEC7Yqc4AeiIu0Qmen.', NULL, '2019-06-16 21:29:08', '2019-06-16 21:35:04'),
(29, 'ihilalaa', 'Hilal', 'Ahmad', NULL, '1233633', 'user', 2, 'inactive', 'ihilalsa@gmail.com', NULL, '$2y$10$QIVkdt.foi55My.nSc3B0uYjzT97Dh41hU4n9XYIhrhyn.3gdCfT6', NULL, '2019-06-16 23:08:46', '2019-06-16 23:08:46');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
