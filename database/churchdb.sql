-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2022 at 03:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `churchdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `details` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `by_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `stop_date` date NOT NULL,
  `start_time` time NOT NULL,
  `stop_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `branch_id`, `details`, `by_who`, `start_date`, `stop_date`, `start_time`, `stop_time`, `created_at`, `updated_at`) VALUES
(2, 1, 'The national worship leaders and instrumentalists are welcomed to the celebration service at Muthurwa Main Altar.\nThe event will take place on Saturday 17th September 2022 from 9 AM to 5 PM. \nThose outside Nairobi are expected to arrive on Friday 16th and will stay until Sunday to attend services in different altars within Nairobi.\nAccomodation rates will be shared soon by Overseer Mary Lilian. Those who may need accomodation to contact Overseer Beryl.\n\nUPDATE announcements \nSET details=\n(\'one <br/> two\');\n\n\n\nEnsure you have enough Cash for fare to and fro Nairobi, and accommodation which will be shared by Overseer Mary Lilian. That is; the cost of the rooms.\n\nThose who may need an accommodation to kindly contact Overseer Beryl.\n\nAny special songs to be channeled to Overseer Mary Lilian through the shift leaders.\n\nThe deadline for submission of the special songs will be on Tuesday (13/9/2022).', 'Overseer Sheila Bett.', '2022-09-15', '2022-09-12', '09:00:00', '09:30:00', '2022-09-12 12:24:34', '2022-09-12 12:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `male` bigint(20) NOT NULL,
  `female` bigint(20) NOT NULL,
  `children` bigint(20) NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `branch_id`, `male`, `female`, `children`, `service_types_id`, `attendance_date`, `created_at`, `updated_at`) VALUES
(1, 1, 31, 208, 0, 1, '2022-08-20 21:00:00', '2022-08-23 07:43:06', '2022-08-23 07:43:06'),
(2, 1, 208, 32, 0, 1, '2022-09-10 21:00:00', '2022-09-12 06:10:50', '2022-09-12 06:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `collections_types_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `branch_id`, `collections_types_id`, `service_types_id`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1300, '2022-08-24', '2022-08-24 05:42:13', '2022-08-24 05:42:13'),
(2, 1, 1, 1, 94000, '2022-08-22', '2022-08-24 05:56:57', '2022-08-24 05:56:57'),
(3, 1, 1, 1, 64000, '2022-08-23', '2022-08-24 05:59:34', '2022-08-24 05:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `collections_commissions`
--

CREATE TABLE `collections_commissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `settled` tinyint(1) NOT NULL DEFAULT 0,
  `collection_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_commissions`
--

INSERT INTO `collections_commissions` (`id`, `branch_id`, `settled`, `collection_date`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2022-08-24', '2022-08-24 05:42:13', '2022-08-24 05:42:13'),
(2, 1, 0, '2022-08-22', '2022-08-24 05:56:58', '2022-08-24 05:56:58'),
(3, 1, 0, '2022-08-23', '2022-08-24 05:59:35', '2022-08-24 05:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `collections_types`
--

CREATE TABLE `collections_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_types`
--

INSERT INTO `collections_types` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monthly_Support', '2022-08-23 07:41:59', '2022-08-23 07:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `by_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `branch_id`, `title`, `details`, `location`, `time`, `by_who`, `assign_to`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Thanksgiving Service', 'The national worship team thanksgiving and celebration service', 'Nairobi Main Altar', '09:30', 'National Worship Leaders and Instrumentalists', 'greym95@gmail.com', '2022-09-17', '2022-09-12 11:49:00', '2022-09-12 11:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(255) NOT NULL DEFAULT 1111,
  `branch_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1001,
  `title` enum('Mr','Mrs','Miss','Dr','Pastor','Overseer','Bishop','Elder','Dr (Mrs)','Prof','Engr','Surveyor','Snr Pastor','Evangelist') COLLATE utf8mb4_unicode_ci DEFAULT 'Mrs',
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` enum('violinist','fluitist','saxophonist','usher','special','leader','technician','keyboardist','data_admin','hospitality','shift_leader_w','shift_leader_k','shift_leader_v','medic') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'violinist',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'female',
  `marital_status` enum('married','single') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_since` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wedding_anniversary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relative` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_status` enum('old','new') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'old',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `branch_id`, `title`, `firstname`, `lastname`, `email`, `dob`, `phone`, `occupation`, `position`, `address`, `address2`, `postal`, `city`, `state`, `country`, `sex`, `marital_status`, `member_since`, `wedding_anniversary`, `photo`, `relative`, `member_status`, `created_at`, `updated_at`) VALUES
(36805346, 1, 'Dr', 'Grey', 'Manuel', 'greym95@gmail.com', '1995-04-10', '0724899553', 'Engineer', 'special', 'Yaya Kilimani Altar', 'Nairobi Metropolis Region', NULL, 'Nairobi Block', 'Nairobi', 'Kenya', 'male', 'single', '2021-01-01', '1970-01-01', 'profile.png', NULL, 'old', '2022-09-12 06:24:19', '2022-09-12 06:24:19'),
(1111, 1, 'Mrs', 'Kencian', 'Kimathi', 'greytech1000@gmail.com', '1996-04-10', '0769321996', 'Doctor', 'violinist', 'Muthurwa', 'Nairobi', NULL, 'Nairobi', 'Kenya', 'Kenya', 'male', 'single', '2018-08-03', '1970-01-01', 'profile.png', NULL, 'old', '2022-08-24 06:48:56', '2022-08-24 06:48:56'),
(175383, 1, 'Mrs', 'Janet', 'Bowen', NULL, NULL, '1-970-515-9882', NULL, 'leader', 'Colorado State Altar', 'USA', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'bowen.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(31826711, 1, 'Mrs', 'Ruth', 'Achieng', NULL, NULL, '110929218', NULL, 'violinist', 'Muthurwa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37262498, 1, 'Mrs', 'Immanuel', 'Kipkoech', NULL, NULL, '112169328', NULL, 'violinist', 'Rafiki Farm', 'Kambi ya moto South ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(40403026, 1, 'Mrs', 'Victory', 'Maina', NULL, NULL, '112372291', NULL, 'violinist', 'Total', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(27485319, 1, 'Mrs', 'Vivian', 'Tracy', NULL, NULL, '113599322', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(39037834, 1, 'Mrs', 'Naomi', 'Kemunto', NULL, NULL, '114814187', NULL, 'violinist', 'Marani', 'Marani', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(28103646, 1, 'Mrs', 'Josephine', 'Julians', NULL, NULL, '28103646', NULL, 'leader', 'Naivasha Main', 'Naivasha', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'julians.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(3333, 1, 'Mrs', 'Winnie', 'Sawe', NULL, NULL, '700301054', NULL, 'violinist', 'Bomet', 'South Rift', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(30956565, 1, 'Mrs', 'Opar', 'Erustus', NULL, NULL, '700351488', NULL, 'leader', 'Mariwa Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'koth.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(34374418, 1, 'Mrs', 'Mercy', 'Ajwang', NULL, NULL, '700389323', NULL, 'leader', 'Juja Main', 'Juja', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'ajwang.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(27898366, 1, 'Mrs', 'Simon', 'Atetwe', NULL, NULL, '700409762', NULL, 'leader', 'Muthurwa Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'atetwe.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(32619346, 1, 'Mrs', 'Darlyne', 'Wesonga', NULL, NULL, '700654014', NULL, 'violinist', 'Donholm', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(28278881, 1, 'Mrs', 'Christopher', 'Ouma', NULL, NULL, '700690971', NULL, 'leader', 'Oyugis Main', 'Oyugis', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'chris.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(12508003, 1, 'Mrs', 'Beatrice', 'Gwada', NULL, NULL, '701096097', NULL, 'leader', 'Oasis Main', 'Kisumu Town', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'gwada.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(33621709, 1, 'Mrs', 'Mercy', 'Masika', NULL, NULL, '701253291', NULL, 'leader', 'Maili Nne Main', 'Maili Nne', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mmasika.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(37132771, 1, 'Mrs', 'Happiness', 'Khalan', NULL, NULL, '702213232', NULL, 'violinist', 'Utawala', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37934228, 1, 'Mrs', 'Remjius', 'Onyango', NULL, NULL, '702259967', NULL, 'leader', 'Muhoroni Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'remjius.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(33776466, 1, 'Mrs', 'Chepngetich', 'Joan', NULL, NULL, '702285094', NULL, 'leader', 'Kericho Main', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'cjoan.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(37706407, 1, 'Mrs', 'Susan', 'Ndungu', NULL, NULL, '702297859', NULL, 'leader', 'Rongai Main', 'Rongai', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'ndungu.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(40778839, 1, 'Mrs', 'Esther', 'Kageha', NULL, NULL, '702729861', NULL, 'violinist', 'Muthurwa Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33140696, 1, 'Mrs', 'Hellen', 'Kimani', NULL, NULL, '702883432', NULL, 'violinist', 'Ruai', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32401258, 1, 'Mrs', 'Michael', 'Wekesa', NULL, NULL, '703145899', NULL, 'leader', 'Kikuyu Altar', 'Kikuyu', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'wekesa.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(26808205, 1, 'Mrs', 'Hellen', 'Gwako', NULL, NULL, '703196164', NULL, 'leader', 'Nanyuki Main', 'Nanyuki', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'gwako.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(32110056, 1, 'Mrs', 'Laura', 'Blessing', NULL, NULL, '703602129', NULL, 'leader', 'Githurai 44 Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'laura.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29344066, 1, 'Mrs', 'Velma', 'Anzemo', NULL, NULL, '703994753', NULL, 'leader', 'Westlands Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'khayeshe.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(34208464, 1, 'Mrs', 'Mokaya', 'Vincent', NULL, NULL, '704251132', NULL, 'violinist', 'Nakuru ', 'Nakuru ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(36975919, 1, 'Mrs', 'Mourine', 'Joshua', NULL, NULL, '704321128', NULL, 'leader', 'Kericho Main', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mourine.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(34304399, 1, 'Mrs', 'Caroline', 'Gikonyo', NULL, NULL, '704327500', NULL, 'violinist', 'Kiambu', 'Kiambu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(28958633, 1, 'Mrs', 'Lilian', 'Arianga', NULL, NULL, '704403918', NULL, 'leader', 'Muthurwa Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'aranga.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(30632589, 1, 'Mrs', 'Prisca', 'Wasonga', NULL, NULL, '704415130', NULL, 'violinist', 'Oasis', 'Kisumu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(39453950, 1, 'Mrs', 'Mary', 'Mugo', NULL, NULL, '704831133', NULL, 'violinist', 'Githurai 45 ', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33327471, 1, 'Mrs', 'Nasserian', 'Beverly', NULL, NULL, '704834369', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(26991017, 1, 'Mrs', 'Ruth', 'Liliana', NULL, NULL, '705183032', NULL, 'violinist', 'Roysambu', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(27717134, 1, 'Mrs', 'Faith', 'Shisiali', NULL, NULL, '705479772', NULL, 'leader', 'Shinyalu Main', 'Shinyalu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'ashioya.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(36502203, 1, 'Mrs', 'Twillen', 'Azenga', NULL, NULL, '705556695', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(20482249, 1, 'Mrs', 'Beatrice', 'Nyasiando', NULL, NULL, '705901880', NULL, 'violinist', 'Bonyunyu', 'Nyamira t.e r', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(32261891, 1, 'Mrs', 'Kellyvin', 'Oduory', NULL, NULL, '706066800', NULL, 'leader', 'Ganga Altar', 'Busia', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'kellyvin.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(24441383, 1, 'Mrs', 'Susan', 'Chepkorir', NULL, NULL, '706200719', NULL, 'violinist', 'Olenguruone', 'Olenguruone ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(35866778, 1, 'Mrs', 'Grace', 'Wairimu', NULL, NULL, '706276417', NULL, 'violinist', 'Githurai 44 ', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(34605041, 1, 'Mrs', 'Emma', 'Mathu', NULL, NULL, '706280426', NULL, 'violinist', 'UON', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(36795259, 1, 'Mrs', 'Marion', 'Atieno', NULL, NULL, '706430172', NULL, 'violinist', 'Kibuye', 'Kisumu A', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32553519, 1, 'Mrs', 'Celestine', 'Ongeri', NULL, NULL, '706446333', NULL, 'violinist', 'Githurai 44', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(30882813, 1, 'Mrs', 'Kevin', 'Otieno', NULL, NULL, '706464953', NULL, 'leader', 'Muthurwa Main', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'kotieno.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(31436460, 1, 'Mrs', 'Patricia', 'Kawira', NULL, NULL, '707087195', NULL, 'leader', 'Kakamega Main', 'Kakamega', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'kawira.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32815876, 1, 'Mrs', 'Catherine', 'Toroitich', NULL, NULL, '707212607', NULL, 'leader', 'Kibabii University', 'Bungoma', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'toroitich.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(35392825, 1, 'Mrs', 'Peris', 'Atieno', NULL, NULL, '707309458', NULL, 'violinist', 'Kawangware 56', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(26285740, 1, 'Mrs', 'Faith', 'Langat', NULL, NULL, '707641109', NULL, 'violinist', 'Bomet', 'Bomet', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(29178325, 1, 'Mrs', 'Jane', 'Nyambura', NULL, NULL, '707658319', NULL, 'leader', 'Githurai 44', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'jnyambura.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(24968946, 1, 'Mrs', 'Sarah', 'Wangui', NULL, NULL, '707698715', NULL, 'leader', 'Amalemba Altar', 'Kakamega', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'swangui.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(32117589, 1, 'Mrs', 'Oyugi', 'Samuel', NULL, NULL, '707772653', NULL, 'leader', 'Bondo Main', 'Bondo', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'osam.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(24542755, 1, 'Mrs', 'Jacqueline', 'Anyango', NULL, NULL, '708535896', NULL, 'leader', 'Muhoroni Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'okiya.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(30213224, 1, 'Mrs', 'Harrison', 'Kiprono', NULL, NULL, '708635789', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(32373711, 1, 'Mrs', 'Pauline', 'Okwaro', NULL, NULL, '708848988', NULL, 'violinist', 'Narumoru', 'Nanyuki', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(26112383, 1, 'Mrs', 'Sarah', 'Mary', NULL, NULL, '710108536', NULL, 'violinist', 'Njoro', 'Njoro', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(21225600, 1, 'Mrs', 'Immaculate', 'Sikulu', NULL, NULL, '710167525', NULL, 'leader', 'Bungoma Main', 'Bungoma', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'sikulu.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(27948545, 1, 'Mrs', 'Benter', 'Obuya', NULL, NULL, '710290574', NULL, 'leader', 'Nyakach Main', 'Nyakach', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'obuya.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(33179055, 1, 'Mrs', 'Patrick', 'Maina', NULL, NULL, '710310804', NULL, 'violinist', 'Muthurwa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(25043778, 1, 'Mrs', 'Rosemary', 'Muthoni', NULL, NULL, '710497899', NULL, 'leader', 'Dandora Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'muthoni.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(27084929, 1, 'Mrs', 'Angeline', 'Kai', NULL, NULL, '710599737', NULL, 'leader', 'Mombasa Main', 'Mombasa', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'angeline.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(25883111, 1, 'Mrs', 'Stephen', 'Mulanda', NULL, NULL, '710682309', NULL, 'leader', 'Kakamega Main', 'Kakamega', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'mulanda.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29034227, 1, 'Mrs', 'Diana', 'Andayi', NULL, NULL, '711358624', NULL, 'violinist', 'Mshomoroni', 'Coast', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(13603885, 1, 'Mrs', 'Alice', 'Agembo', NULL, NULL, '711425467', NULL, 'leader', 'Seme Main Altar', 'Greater Seme', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'alice.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29146609, 1, 'Mrs', 'Winny', 'Malanda', NULL, NULL, '711498647', NULL, 'leader', 'Njoro Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'winfred.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(30225474, 1, 'Mrs', 'Millicent', 'Masinza', NULL, NULL, '711627549', NULL, 'violinist', 'Yaya', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(38027692, 1, 'Mrs', 'Derrick', 'Isindu', NULL, NULL, '711694452', NULL, 'violinist', 'Langas', 'Langas', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(31370193, 1, 'Mrs', 'Oscar', 'Omondi', NULL, NULL, '711872564', NULL, 'leader', 'Fortenan Altar', 'Fortenan', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'oscar.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(27496440, 1, 'Mrs', 'Susan', 'Achanga', NULL, NULL, '712362875', NULL, 'leader', 'Ahero Main', 'Greater Nyando', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'achanga.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(32341316, 1, 'Mrs', 'Isaac', 'Githaiga', NULL, NULL, '712549639', NULL, 'leader', 'Mai-Mahiu Altar', 'Naivasha', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'githaiga.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(27514374, 1, 'Mrs', 'Eustance', 'Odhiambo', NULL, NULL, '712731492', NULL, 'leader', 'Ugenya Main', 'Greater Ugenya', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'eustance.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(22425939, 1, 'Mrs', 'Benter', 'Aketch', NULL, NULL, '712798502', NULL, 'leader', 'Kolenyo Altar', 'Greater Seme', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'baketch.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(28006412, 1, 'Mrs', 'Vaughan', 'Mudegu', NULL, NULL, '712953262', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'mudegu.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(35718951, 1, 'Mrs', 'Kipkirui', 'Zadock', NULL, NULL, '713134129', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(30054559, 1, 'Mrs', 'Charltone', 'Samo', NULL, NULL, '713357699', NULL, 'leader', 'Kawangware 46 Main', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'samo.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(34671635, 1, 'Mrs', 'Rachael', 'Ludenyo', NULL, NULL, '713514024', NULL, 'violinist', 'K.u', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(29250747, 1, 'Mrs', 'Nicholas', 'Oketch', NULL, NULL, '714644636', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37335066, 1, 'Mrs', 'Golda', 'Mwaizi', NULL, NULL, '714667574', NULL, 'violinist', 'Muthurwa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(25004163, 1, 'Mrs', 'Deborah', 'Saida', NULL, NULL, '714692080', NULL, 'leader', 'Thika Main', 'Thika', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'saida.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(33887063, 1, 'Mrs', 'Fredrick', 'Mbara', NULL, NULL, '714814169', NULL, 'violinist', 'Homabay ', 'Homabay ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(33126793, 1, 'Mrs', 'Moses', 'Oumah', NULL, NULL, '715301592', NULL, 'violinist', 'Molo', 'Molo', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(28173728, 1, 'Mrs', 'Abiud', 'Nyongesa', NULL, NULL, '715372159', NULL, 'leader', 'Njoro Main', 'Nakuru', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'abiud.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(35101082, 1, 'Mrs', 'Joshua', 'Kipruto', NULL, NULL, '715528816', NULL, 'violinist', 'Burnt Forest', 'Burnt Forest', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(31621043, 1, 'Mrs', 'Doreen', 'Ashioya', NULL, NULL, '715541244', NULL, 'violinist', 'Kakamega', 'Kakamega', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32603662, 1, 'Mrs', 'Purity', 'Karimi', NULL, NULL, '715837227', NULL, 'violinist', 'Chokaa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(34883767, 1, 'Mrs', 'Elizabeth', 'Wamboi', NULL, NULL, '715905492', NULL, 'violinist', 'Langas', 'Langas ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(35072895, 1, 'Mrs', 'Susanne', 'Kidahula', NULL, NULL, '715982191', NULL, 'violinist', 'Mombasa Main', 'Mombasa ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(28107846, 1, 'Mrs', 'Sophie', 'Masese', NULL, NULL, '716018200', NULL, 'leader', 'Utawala Altar', 'Utawala', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'masese.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(27498996, 1, 'Mrs', 'Lilian', 'Baraka', NULL, NULL, '716080309', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'lbaraka.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(30188557, 1, 'Mrs', 'Gloria', 'Sarah', NULL, NULL, '716256252', NULL, 'leader', 'Muhoroni Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'gsarah.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32448095, 1, 'Mrs', 'Dorhine', 'Lencer', NULL, NULL, '716397715', NULL, 'leader', 'Mwimuto Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mtala.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29832194, 1, 'Mrs', 'Dorcas', 'Mutunga', NULL, NULL, '716438328', NULL, 'leader', 'Bethel Altar', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mutunga.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(36488348, 1, 'Mrs', 'Florence', 'Simiyu', NULL, NULL, '716819811', NULL, 'violinist', 'Chwele', 'Bungoma', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(28399299, 1, 'Mrs', 'Fabiana', 'Ednah', NULL, NULL, '716950170', NULL, 'leader', 'Luanda Town Altar', 'Luanda', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'fednah.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(30940465, 1, 'Mrs', 'David', 'Mugambi', NULL, NULL, '716965135', NULL, 'leader', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'mugambi.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(31708153, 1, 'Mrs', 'Stacey', 'Iris', NULL, NULL, '717316573', NULL, 'violinist', 'Soy', 'Soy', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(27639887, 1, 'Mrs', 'Riziki', 'Christabel', NULL, NULL, '717333963', NULL, 'leader', 'Machakos Main', 'Machakos', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'riziki.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(33382770, 1, 'Mrs', 'Nelly', 'Shamola', NULL, NULL, '717382403', NULL, 'leader', 'Oasis Altar', 'Kisumu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'shamola.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32159755, 1, 'Mrs', 'Anulisa', 'Claire', NULL, NULL, '717400966', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33015193, 1, 'Mrs', 'Sammuel', 'Jerry', NULL, NULL, '717711970', NULL, 'leader', 'Gilgil Main', 'Gilgil', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'sammuel.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(30239179, 1, 'Mrs', 'Elias', 'Kirui', NULL, NULL, '717743498', NULL, 'violinist', 'K.u', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(23923558, 1, 'Mrs', 'Kevin', 'Ben', NULL, NULL, '717797285', NULL, 'leader', 'Utawala Altar', 'Utawala', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'kevinben.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32993024, 1, 'Mrs', 'Anne', 'Nyambura', NULL, NULL, '717813284', NULL, 'violinist', 'Ruaka  ', 'Ruaka metro', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(37958761, 1, 'Mrs', 'Beryl', 'Achieng', NULL, NULL, '718290315', NULL, 'violinist', 'Koinange ', 'Koinange ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(36931446, 1, 'Mrs', 'Christine', 'Amondi', NULL, NULL, '718742037', NULL, 'violinist', 'Muthurwa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(25098770, 1, 'Mrs', 'Eunice', 'Adhiambo', NULL, NULL, '718883105', NULL, 'leader', 'Awasi Altar', 'Nyando Muhoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'eunice.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32265588, 1, 'Mrs', 'Irene', 'Mwangi', NULL, NULL, '719303592', NULL, 'leader', 'Naivasha Main', 'Naivasha', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'imwangi.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(31648821, 1, 'Mrs', 'Eunice', 'Oluoch', NULL, NULL, '719632598', NULL, 'leader', 'Siaya Main', 'Siaya', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'eoluoch.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(28478000, 1, 'Mrs', 'Emmanuel', 'Kenyatta', NULL, NULL, '719634308', NULL, 'violinist', 'Kayole', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(27818869, 1, 'Mrs', 'Eunice', 'Otieno', NULL, NULL, '719636603', NULL, 'leader', 'Sanctuary Altar', 'Naivasha', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'knight.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(39514411, 1, 'Mrs', 'Jeff', 'Brian', NULL, NULL, '720520119', NULL, 'leader', 'Muhoroni Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'jeff.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(26992177, 1, 'Mrs', 'George', 'Owuor', NULL, NULL, '721178216', NULL, 'leader', 'Ahero Main', 'Ahero', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'georgeo.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(973704, 1, 'Mrs', 'Isabella', 'Kiprono', NULL, NULL, '721632498', NULL, 'violinist', 'Nakuru', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34746196, 1, 'Mrs', 'Mirriam', 'Chepchirchir', NULL, NULL, '721771736', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(24055727, 1, 'Mrs', 'Salome', 'Itale', NULL, NULL, '721832844', NULL, 'violinist', 'Kerma', 'Njoro ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(1111, 1, 'Mrs', 'Innocent', 'Idiama', NULL, NULL, '722976328', NULL, 'violinist', 'Njoro', 'Njoro', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(23329608, 1, 'Mrs', 'Esther', 'Edome', NULL, NULL, '723073057', NULL, 'leader', 'Marigat Main', 'Marigat', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'edome.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(10011747, 1, 'Mrs', 'Rebecca', 'Adhiambo', NULL, NULL, '723232132', NULL, 'violinist', 'Ngata', 'Ngata', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(28076052, 1, 'Mrs', 'Beryl', 'Okoth', NULL, NULL, '723246326', NULL, 'leader', 'Utawala Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'berylok.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(24439391, 1, 'Mrs', 'Sheila', 'Shisoka', NULL, NULL, '724112310', NULL, 'leader', 'Kayole Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'fsheila.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(20977013, 1, 'Mrs', 'Sarah', 'Oluoch', NULL, NULL, '724131518', NULL, 'leader', 'Nakuru Altar', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'saraho.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(28567847, 1, 'Mrs', 'Lucy', 'Mwangi', NULL, NULL, '724468331', NULL, 'leader', 'Naivasha Main', 'Naivasha', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'mwangi.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(21926955, 1, 'Mrs', 'Joan', 'Maungu', NULL, NULL, '724569399', NULL, 'leader', 'Busia Main', 'Busia', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'maungu.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(33143271, 1, 'Mrs', 'Smith', 'Alphonce', NULL, NULL, '724599781', NULL, 'violinist', 'Mshomoroni', 'Mshomoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(30508705, 1, 'Mrs', 'Dennis', 'Musalia', NULL, NULL, '724717683', NULL, 'leader', 'Muthurwa Main', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'musalia.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(30610871, 1, 'Mrs', 'Mercy', 'Langat', NULL, NULL, '724753981', NULL, 'leader', 'Kitui Main', 'Ukambani', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'langat.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(27074649, 1, 'Mrs', 'Cetrick', 'Line', NULL, NULL, '724853231', NULL, 'leader', 'Elshaddai Altar', 'NAKURU', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'line.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(26102501, 1, 'Mrs', 'Mildred', 'Ochieng', NULL, NULL, '725040609', NULL, 'leader', 'Kericho Main', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mildredo.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(27513956, 1, 'Mrs', 'Immaculate', 'Samuel', NULL, NULL, '725090157', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'immaculate.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(2222, 1, 'Mrs', 'Ann', 'Auma', NULL, NULL, '725289807', NULL, 'violinist', 'Chokaa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(27637846, 1, 'Mrs', 'Esther', 'Rebecca', NULL, NULL, '725516335', NULL, 'violinist', 'UON', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32886705, 1, 'Mrs', 'Nancy', 'Collins', NULL, NULL, '725533150', NULL, 'leader', 'Juja Main', 'Juja', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'nancyc.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(29240011, 1, 'Mrs', 'Claudia', 'Vugutsa', NULL, NULL, '725765558', NULL, 'leader', 'Kisii Main', 'Kisii', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'claudia.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(35905749, 1, 'Mrs', 'Mercy', 'Chelangat', NULL, NULL, '726003317', NULL, 'violinist', 'Nakuru', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32100610, 1, 'Mrs', 'Noreen', 'Ingaista', NULL, NULL, '726018836', NULL, 'leader', 'Rotary Altar', 'Kisumu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'noreen.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(35558203, 1, 'Mrs', 'Zibiah', 'Kitur', NULL, NULL, '726563965', NULL, 'violinist', 'Yaya', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(24694435, 1, 'Mrs', 'Mary', 'Lilian', NULL, NULL, '726803085', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'marylilian.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32704061, 1, 'Mrs', 'Lilian', 'Ayuma', NULL, NULL, '726915463', NULL, 'leader', 'Kenlands Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'ayuma.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(21257908, 1, 'Mrs', 'Susan', 'Wangari', NULL, NULL, '727086500', NULL, 'violinist', 'Nakuru', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(27218371, 1, 'Mrs', 'Phoebe', 'Asiyo', NULL, NULL, '727121937', NULL, 'leader', 'Naivasha Altar', 'Naivasha', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'asiyo.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(32250540, 1, 'Mrs', 'Joseph', 'Wafula', NULL, NULL, '727140017', NULL, 'violinist', 'Cheptais', 'Mt Elgon', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(21620993, 1, 'Mrs', 'Juliet', 'Mwangi', NULL, NULL, '727204348', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'juliet.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(4444, 1, 'Mrs', 'Samuel', 'Njoroge', NULL, NULL, '727564071', NULL, 'leader', 'Maili Tatu Altar', 'Nakuru', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'kerage.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(38084589, 1, 'Mrs', 'Dinah', 'Lorenza', NULL, NULL, '727852420', NULL, 'violinist', 'K.u', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(41115426, 1, 'Mrs', 'Joy', 'Chepchirchir', NULL, NULL, '728032052', NULL, 'violinist', 'UON ', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(39071301, 1, 'Mrs', 'Sano', 'Angel', NULL, NULL, '728203017', NULL, 'violinist', 'Mombasa', 'Mombasa', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(31574568, 1, 'Mrs', 'Yvonne', 'Celestine', NULL, NULL, '728256289', NULL, 'leader', 'Oasis Altar', 'Kisumu Town', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'celestine.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(8642281, 1, 'Mrs', 'Elizabeth', 'Mercy', NULL, NULL, '728394988', NULL, 'leader', 'Nyahururu Main', 'Nyandarua', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mwanjiru.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(24941615, 1, 'Mrs', 'Jane', 'Kiptoo', NULL, NULL, '728835802', NULL, 'leader', 'Kitale Main', 'Kitale', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'kiptoo.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(28048279, 1, 'Mrs', 'Evans', 'Ivar', NULL, NULL, '729149493', NULL, 'leader', 'UoN Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'ivar.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(34681708, 1, 'Mrs', 'Phenny', 'Auma', NULL, NULL, '729229318', NULL, 'violinist', 'Kitale Main', 'Kitale', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(27797466, 1, 'Mrs', 'Hillary', 'Kipkosgei', NULL, NULL, '729317190', NULL, 'leader', 'Kiplombe Altar', 'Koibatek', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'lagat.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(26763912, 1, 'Mrs', 'Christine', 'Mukudi', NULL, NULL, '729415797', NULL, 'leader', 'Funyula Main', 'Funyula', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'mukudi.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(24700757, 1, 'Mrs', 'Lilian', 'Sikama', NULL, NULL, '729594947', NULL, 'leader', 'UAE Altar', 'Asia', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'sikama.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(29977470, 1, 'Mrs', 'Jackline', 'Wafula', NULL, NULL, '729941933', NULL, 'leader', 'Yaya Kilimani', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'jwafula.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(39928921, 1, 'Mrs', 'Adlight', 'Olaab', NULL, NULL, '731911619', NULL, 'violinist', 'Oasis', 'Kisumu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32942392, 1, 'Mrs', 'Felix', 'Washioya', NULL, NULL, '732996711', NULL, 'leader', 'Ruaka Metropolis Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'washioya.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29321581, 1, 'Mrs', 'Colleta', 'Kerubo', NULL, NULL, '735103101', NULL, 'violinist', 'Kisii', 'Gusii', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(38425076, 1, 'Mrs', 'Wafula', 'Linda', NULL, NULL, '740150930', NULL, 'violinist', 'Mombasa ', 'Coast ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(28892642, 1, 'Mrs', 'Maurine', 'Alivitsa', NULL, NULL, '740193154', NULL, 'violinist', 'Umoja', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(35961035, 1, 'Mrs', 'Faith', 'Neema', NULL, NULL, '740238188', NULL, 'violinist', 'Juja', 'Juja', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37353567, 1, 'Mrs', 'Mary', 'Mong\'ina', NULL, NULL, '740270641', NULL, 'violinist', 'Matungu', 'Matungu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(35759919, 1, 'Mrs', 'Mercy', 'Maloba', NULL, NULL, '740400160', NULL, 'violinist', 'Utawala', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(35822234, 1, 'Mrs', 'Joseph', 'Ogolla', NULL, NULL, '740896258', NULL, 'leader', 'Kayole Main', 'Nairobi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'jogola.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(34067712, 1, 'Mrs', 'Lucy', 'Mbatia', NULL, NULL, '741242433', NULL, 'violinist', 'Matunda Main', 'Matunda', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(21432328, 1, 'Mrs', 'Petronilla', 'Atieno', NULL, NULL, '741541355', NULL, 'leader', 'Muhoroni Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'petronilla.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(33806357, 1, 'Mrs', 'Rosoa', 'Almasi', NULL, NULL, '741573518', NULL, 'violinist', 'Roysambu', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32491517, 1, 'Mrs', 'Moureen', 'Njoroge', NULL, NULL, '741744302', NULL, 'violinist', 'KU', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(37888534, 1, 'Mrs', 'Winnie', 'Achieng', NULL, NULL, '741933216', NULL, 'violinist', 'Kisumu', 'Rabuor', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(30096108, 1, 'Mrs', 'Sarah', 'Ken', NULL, NULL, '741972447', NULL, 'leader', 'Oyugis Main', 'Oyugis', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'sken.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(40636486, 1, 'Mrs', 'Brilliant', 'Cherono', NULL, NULL, '742224984', NULL, 'violinist', 'Kakamega', 'Kakamega', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(33314917, 1, 'Mrs', 'Selly', 'Maru', NULL, NULL, '742251336', NULL, 'leader', 'Kiminini Main', 'Kiminini', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'maru.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(35015286, 1, 'Mrs', 'Prisca', 'Odhiambo', NULL, NULL, '742579910', NULL, 'violinist', 'Siaya Main ', 'Siaya', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(36633145, 1, 'Mrs', 'Victor', 'Mbogua', NULL, NULL, '742581939', NULL, 'violinist', 'Kengen ', 'Naivasha', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(36819781, 1, 'Mrs', 'Peter', 'Macharia', NULL, NULL, '742609946', NULL, 'violinist', 'KU', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37892429, 1, 'Mrs', 'Kuria', 'Leah', NULL, NULL, '742664893', NULL, 'violinist', 'Kabarak rafiki farm ', 'Kampi ya moto south ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(39335769, 1, 'Mrs', 'Lucy', 'Agola', NULL, NULL, '742932920', NULL, 'violinist', 'Kakamega', 'Kakamega', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34122625, 1, 'Mrs', 'Unwa', 'Mercy', NULL, NULL, '743282954', NULL, 'violinist', 'Manguo Main', 'Nyahururu ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(38875956, 1, 'Mrs', 'Joy', 'Jecinta', NULL, NULL, '743439241', NULL, 'leader', 'Maili Nne Altar', 'Maili Nne', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'joyj.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(370345, 1, 'Mrs', 'Priscah', 'Shalom', NULL, NULL, '743773838', NULL, 'violinist', 'Tudor', 'Matugu ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(3481635, 1, 'Mrs', 'Constantine', 'Jepngetich', NULL, NULL, '745130274', NULL, 'violinist', 'Mwiki', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(36718539, 1, 'Mrs', 'Imani', 'Ndolo', NULL, NULL, '745485486', NULL, 'violinist', 'Machakos', 'Machakos', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34914742, 1, 'Mrs', 'John', 'Sijeyo', NULL, NULL, '745608317', NULL, 'leader', 'Njoro Main', 'Nakuru', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'sijieyo.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(38407493, 1, 'Mrs', 'Eunice', 'Wangari', NULL, NULL, '745839390', NULL, 'violinist', 'Nyahururu ', 'Nyahururu ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(29999465, 1, 'Mrs', 'Finah', 'Olesi', NULL, NULL, '746421862', NULL, 'violinist', 'Ngong', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34952723, 1, 'Mrs', 'Esther', 'Dinah', NULL, NULL, '746862060', NULL, 'violinist', 'Kayole', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(27698356, 1, 'Mrs', 'Mildred', 'Muhando', NULL, NULL, '748397490', NULL, 'leader', 'Kibos Ground Altar', 'Greater Seme', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'muhando.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(37827924, 1, 'Mrs', 'Morine', 'Unwah', NULL, NULL, '748423980', NULL, 'violinist', 'Manguo', 'Nyahururu ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(40112488, 1, 'Mrs', 'Laura', 'Happiness', NULL, NULL, '751223596', NULL, 'leader', 'Oasis Main', 'Kisumu Town', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'happiness.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(38525738, 1, 'Mrs', 'Loice', 'Muyaku', NULL, NULL, '754692761', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(29605649, 1, 'Mrs', 'Susan', 'Triza', NULL, NULL, '754961836', NULL, 'leader', 'Doonholm Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'striza.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(35351140, 1, 'Mrs', 'Irene', 'Awandu', NULL, NULL, '757135253', NULL, 'violinist', 'Siaya', 'Siaya ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(37635737, 1, 'Mrs', 'Diana', 'Rose', NULL, NULL, '758134642', NULL, 'violinist', 'UON', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34948832, 1, 'Mrs', 'Lydia', 'Chacha', NULL, NULL, '758805910', NULL, 'violinist', 'Yaya', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(37591340, 1, 'Mrs', 'Irene', 'Kimani', NULL, NULL, '758824989', NULL, 'violinist', 'Ruai', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(31183491, 1, 'Mrs', 'Rosemary', 'Tanui', NULL, NULL, '762105424', NULL, 'violinist', 'Muthaiga', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(39126473, 1, 'Mrs', 'Christabel', 'Nasimiyu', NULL, NULL, '768220938', NULL, 'leader', 'Nyahururu Main', 'Nyandarua', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'nasimiyu.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(29685117, 1, 'Mrs', 'Patrick', 'Mwaura', NULL, NULL, '768416827', NULL, 'violinist', 'Olkalou', 'Olkalou', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(38076169, 1, 'Mrs', 'Nginya', 'Peninah', NULL, NULL, '769259939', NULL, 'leader', 'UoN Altar', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'nginya.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(39094996, 1, 'Mrs', 'Centrine', 'Muhele', NULL, NULL, '769980216', NULL, 'violinist', 'Bungoma ', 'Bungoma', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(37416590, 1, 'Mrs', 'Damaris', 'Githae', NULL, NULL, '772649896', NULL, 'violinist', 'Bamburi', 'Kisauni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(35439889, 1, 'Mrs', 'Faith', 'Chirchir', NULL, NULL, '774241652', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(34308047, 1, 'Mrs', 'Elizabeth', 'Odera', NULL, NULL, '774684652', NULL, 'violinist', 'Donholm', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(29981870, 1, 'Mrs', 'David', 'Agesa', NULL, NULL, '777669954', NULL, 'leader', 'Kenyata University Altar', 'THIKA', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'agesa.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(40202584, 1, 'Mrs', 'Vivianne', 'Catherine', NULL, NULL, '783013297', NULL, 'violinist', 'Ahero Main', 'Greater Nyando', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(34405544, 1, 'Mrs', 'Ephy', 'Ogal', NULL, NULL, '790014206', NULL, 'violinist', 'Molo Main', 'Molo', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33501818, 1, 'Mrs', 'Julius', 'Njenga', NULL, NULL, '790176006', NULL, 'violinist', 'Nyahururu Main', 'Nyahururu ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(30807971, 1, 'Mrs', 'Olgah', 'Akinyi', NULL, NULL, '790237283', NULL, 'leader', 'Githurai 45 Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'olgah.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(28650523, 1, 'Mrs', 'Treza', 'Nabwire', NULL, NULL, '790280816', NULL, 'leader', 'Nairobi Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'nabwire.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(37132931, 1, 'Mrs', 'Catherine', 'Mandere', NULL, NULL, '790446235', NULL, 'violinist', 'Westlands', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(35080541, 1, 'Mrs', 'Sherine', 'Akinyi', NULL, NULL, '791227826', NULL, 'leader', 'Kericho Main', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'sherine.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(38585683, 1, 'Mrs', 'Martha', 'Wangui', NULL, NULL, '791239920', NULL, 'violinist', 'UON', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(36518760, 1, 'Mrs', 'Celestine', 'Shisiali', NULL, NULL, '791541807', NULL, 'violinist', 'Mombasa Main', 'Coast', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(36661346, 1, 'Mrs', 'Everline', 'Lindah', NULL, NULL, '792038496', NULL, 'violinist', 'Nakuru Main', 'Nakuru', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33018638, 1, 'Mrs', 'Kelvin', 'Kabuga', NULL, NULL, '792614320', NULL, 'violinist', 'Utawala', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(33866528, 1, 'Mrs', 'Cynthia', 'Kwamboka', NULL, NULL, '792695528', NULL, 'leader', 'Gilimori Altar', 'Muhoroni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'ckwamboka.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48');
INSERT INTO `members` (`id`, `branch_id`, `title`, `firstname`, `lastname`, `email`, `dob`, `phone`, `occupation`, `position`, `address`, `address2`, `postal`, `city`, `state`, `country`, `sex`, `marital_status`, `member_since`, `wedding_anniversary`, `photo`, `relative`, `member_status`, `created_at`, `updated_at`) VALUES
(35771667, 1, 'Mrs', 'Monicah', 'Wanjiru', NULL, NULL, '792720047', NULL, 'violinist', 'Mt. Carmel', 'Molo', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(38515055, 1, 'Mrs', 'Emmanuel', 'Baraza', NULL, NULL, '793619843', NULL, 'violinist', 'K.u', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(39125359, 1, 'Mrs', 'Maryafline', 'Anyango', NULL, NULL, '793781835', NULL, 'violinist', 'KU', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34556907, 1, 'Mrs', 'Monicah', 'Njoroge', NULL, NULL, '794163100', NULL, 'violinist', 'Ruaka', 'Ruaka', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(32948144, 1, 'Mrs', 'Jackline', 'Atieno', NULL, NULL, '794212978', NULL, 'violinist', 'Utawala Main', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(34650864, 1, 'Mrs', 'Ruth', 'Muange', NULL, NULL, '795294997', NULL, 'violinist', 'Kayole ', 'Ruai', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(36800422, 1, 'Mrs', 'Charles', 'Kiprono', NULL, NULL, '795538214', NULL, 'violinist', 'Kitabmat', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(25389256, 1, 'Mrs', 'Sofia', 'Mukwana', NULL, NULL, '795584746', NULL, 'leader', 'Bambura Main', 'Kisauni', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'sofia.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(37170921, 1, 'Mrs', 'Jackie', 'Imela', NULL, NULL, '795620316', NULL, 'violinist', 'Eldoret', 'Uasin Gishu', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(29641852, 1, 'Mrs', 'Marion', 'Francis', NULL, NULL, '796116047', NULL, 'leader', 'Doonholm Altar', 'THIKA', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'marion.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(37105393, 1, 'Mrs', 'Esther', 'Guravi', NULL, NULL, '796173019', NULL, 'violinist', 'Juja main ', 'Juja', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(30393186, 1, 'Mrs', 'Flora', 'Asitabila', NULL, NULL, '796493587', NULL, 'violinist', 'Ruaka', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(36989572, 1, 'Mrs', 'Lydia', 'Mirumbe', NULL, NULL, '796662618', NULL, 'violinist', 'Kehancha', 'Kuria', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(34996300, 1, 'Mrs', 'Erastus', 'Ochieng', NULL, NULL, '797191716', NULL, 'violinist', 'Kenlands', 'Nakuru ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(34737348, 1, 'Mrs', 'Fiath', 'Chebet', NULL, NULL, '797899465', NULL, 'violinist', 'Nakuru ', 'Nakuru ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(38010295, 1, 'Mrs', 'Dorcas', 'Mukaile', NULL, NULL, '798180034', NULL, 'violinist', 'Machakos', 'Machakos', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37028444, 1, 'Mrs', 'Naomi', 'Wanyama', NULL, NULL, '798691806', NULL, 'violinist', 'Kadongo', 'Kadongo', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(39109493, 1, 'Mrs', 'Festus', 'Kipngeno', NULL, NULL, '798808084', NULL, 'violinist', 'Fort tenan', 'Fort tenan ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(31769968, 1, 'Mrs', 'Jane', 'Macire', NULL, NULL, '798955102', NULL, 'violinist', 'Isinya', 'Kajiado east', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(31953358, 1, 'Mrs', 'Kirigah', 'Martha', NULL, NULL, '799162343', NULL, 'leader', 'Kericho Main', 'Kericho', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'kirigah.png', NULL, 'old', '2022-08-18 13:24:48', '2022-08-18 13:24:48'),
(36527365, 1, 'Mrs', 'Favour', 'Amelia', NULL, NULL, '799190979', NULL, 'violinist', 'Yaya', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 12:56:42', '2022-08-18 12:56:42'),
(33682002, 1, 'Mrs', 'Andrew', 'Oremo', NULL, NULL, '799400553', NULL, 'leader', 'Arthi River Altar', 'Arthi River', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, 'oremo.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36'),
(35046995, 1, 'Mrs', 'Joan', 'Walubengo', NULL, NULL, '799624880', NULL, 'violinist', 'Chokaa', 'Nairobi', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:08:48', '2022-08-18 13:08:48'),
(37992210, 1, 'Mrs', 'Valentine', 'Chepkorir', NULL, NULL, '799876100', NULL, 'violinist', 'Uon', 'Nairobi ', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, 'old', '2022-08-18 13:00:02', '2022-08-18 13:00:02'),
(27088075, 1, 'Mrs', 'Pastor', 'Patience', NULL, NULL, '971532438943', NULL, 'leader', 'United Arab Emirates Main', 'Asia', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, 'patience.png', NULL, 'old', '2022-08-18 13:24:36', '2022-08-18 13:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `member_attendances`
--

CREATE TABLE `member_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `attendance` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_attendances`
--

INSERT INTO `member_attendances` (`id`, `member_id`, `service_types_id`, `attendance`, `date`, `created_at`, `updated_at`) VALUES
(101, 3333, 1, 'yes', '2022-08-21', '2022-08-20 21:00:00', '2022-08-20 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `member_collections`
--

CREATE TABLE `member_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `collections_types_id` bigint(20) UNSIGNED NOT NULL,
  `service_types_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `date_collected` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_collections`
--

INSERT INTO `member_collections` (`id`, `branch_id`, `member_id`, `collections_types_id`, `service_types_id`, `amount`, `date_collected`, `created_at`, `updated_at`) VALUES
(1, 1, 175383, 1, 1, 100, '2022-08-24', '2022-08-24 05:42:49', '2022-08-24 05:42:49'),
(2, 1, 31826711, 1, 1, 500, '2022-08-24', '2022-08-24 05:42:50', '2022-08-24 05:42:50'),
(3, 1, 37262498, 1, 1, 500, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(4, 1, 40403026, 1, 1, 200, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(5, 1, 27485319, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(6, 1, 39037834, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(7, 1, 28103646, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(8, 1, 3333, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(9, 1, 30956565, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:51', '2022-08-24 05:42:51'),
(10, 1, 34374418, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(11, 1, 27898366, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(12, 1, 32619346, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(13, 1, 28278881, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(14, 1, 12508003, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(15, 1, 33621709, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(16, 1, 37132771, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(17, 1, 37934228, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(18, 1, 33776466, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(19, 1, 37706407, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(20, 1, 40778839, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(21, 1, 33140696, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(22, 1, 32401258, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(23, 1, 26808205, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(24, 1, 32110056, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(25, 1, 29344066, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(26, 1, 34208464, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(27, 1, 36975919, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(28, 1, 34304399, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(29, 1, 28958633, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(30, 1, 30632589, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(31, 1, 39453950, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(32, 1, 33327471, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(33, 1, 26991017, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:52', '2022-08-24 05:42:52'),
(34, 1, 27717134, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(35, 1, 36502203, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(36, 1, 20482249, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(37, 1, 32261891, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(38, 1, 24441383, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(39, 1, 35866778, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(40, 1, 34605041, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(41, 1, 36795259, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(42, 1, 32553519, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(43, 1, 30882813, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(44, 1, 31436460, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:53', '2022-08-24 05:42:53'),
(45, 1, 32815876, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(46, 1, 35392825, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(47, 1, 26285740, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(48, 1, 29178325, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(49, 1, 24968946, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(50, 1, 32117589, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(51, 1, 24542755, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(52, 1, 30213224, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(53, 1, 32373711, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(54, 1, 26112383, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:54', '2022-08-24 05:42:54'),
(55, 1, 21225600, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(56, 1, 27948545, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(57, 1, 33179055, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(58, 1, 25043778, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(59, 1, 27084929, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(60, 1, 25883111, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(61, 1, 29034227, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(62, 1, 13603885, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(63, 1, 29146609, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(64, 1, 30225474, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(65, 1, 38027692, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(66, 1, 31370193, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:55', '2022-08-24 05:42:55'),
(67, 1, 27496440, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(68, 1, 32341316, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(69, 1, 27514374, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(70, 1, 22425939, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(71, 1, 28006412, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(72, 1, 35718951, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:56', '2022-08-24 05:42:56'),
(73, 1, 30054559, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(74, 1, 34671635, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(75, 1, 29250747, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(76, 1, 37335066, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(77, 1, 25004163, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(78, 1, 33887063, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(79, 1, 33126793, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(80, 1, 28173728, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(81, 1, 35101082, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(82, 1, 31621043, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(83, 1, 32603662, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:57', '2022-08-24 05:42:57'),
(84, 1, 34883767, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(85, 1, 35072895, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(86, 1, 28107846, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(87, 1, 27498996, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(88, 1, 30188557, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(89, 1, 32448095, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(90, 1, 29832194, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(91, 1, 36488348, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(92, 1, 28399299, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(93, 1, 30940465, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:58', '2022-08-24 05:42:58'),
(94, 1, 31708153, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:59', '2022-08-24 05:42:59'),
(95, 1, 27639887, 1, 1, 0, '2022-08-24', '2022-08-24 05:42:59', '2022-08-24 05:42:59'),
(96, 1, 33382770, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(97, 1, 32159755, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(98, 1, 33015193, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(99, 1, 30239179, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(100, 1, 23923558, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(101, 1, 32993024, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(102, 1, 37958761, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(103, 1, 36931446, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(104, 1, 25098770, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(105, 1, 32265588, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(106, 1, 31648821, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:00', '2022-08-24 05:43:00'),
(107, 1, 28478000, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:01', '2022-08-24 05:43:01'),
(108, 1, 27818869, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:01', '2022-08-24 05:43:01'),
(109, 1, 39514411, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:01', '2022-08-24 05:43:01'),
(110, 1, 26992177, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(111, 1, 973704, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(112, 1, 34746196, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(113, 1, 24055727, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(114, 1, 1111, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(115, 1, 23329608, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(116, 1, 10011747, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:02', '2022-08-24 05:43:02'),
(117, 1, 28076052, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:03', '2022-08-24 05:43:03'),
(118, 1, 24439391, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:03', '2022-08-24 05:43:03'),
(119, 1, 20977013, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:03', '2022-08-24 05:43:03'),
(120, 1, 28567847, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:05', '2022-08-24 05:43:05'),
(121, 1, 21926955, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:06', '2022-08-24 05:43:06'),
(122, 1, 33143271, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:08', '2022-08-24 05:43:08'),
(123, 1, 30508705, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:08', '2022-08-24 05:43:08'),
(124, 1, 30610871, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:08', '2022-08-24 05:43:08'),
(125, 1, 27074649, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:08', '2022-08-24 05:43:08'),
(126, 1, 26102501, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:08', '2022-08-24 05:43:08'),
(127, 1, 27513956, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:09', '2022-08-24 05:43:09'),
(128, 1, 2222, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:09', '2022-08-24 05:43:09'),
(129, 1, 27637846, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:09', '2022-08-24 05:43:09'),
(130, 1, 32886705, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:09', '2022-08-24 05:43:09'),
(131, 1, 29240011, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:09', '2022-08-24 05:43:09'),
(132, 1, 35905749, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(133, 1, 32100610, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(134, 1, 35558203, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(135, 1, 24694435, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(136, 1, 32704061, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(137, 1, 21257908, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(138, 1, 27218371, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(139, 1, 32250540, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(140, 1, 21620993, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(141, 1, 4444, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:10', '2022-08-24 05:43:10'),
(142, 1, 38084589, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:11', '2022-08-24 05:43:11'),
(143, 1, 41115426, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:11', '2022-08-24 05:43:11'),
(144, 1, 39071301, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(145, 1, 31574568, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(146, 1, 8642281, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(147, 1, 24941615, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(148, 1, 28048279, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(149, 1, 34681708, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(150, 1, 27797466, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(151, 1, 26763912, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(152, 1, 24700757, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(153, 1, 29977470, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(154, 1, 39928921, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(155, 1, 32942392, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:12', '2022-08-24 05:43:12'),
(156, 1, 29321581, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:13', '2022-08-24 05:43:13'),
(157, 1, 38425076, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:13', '2022-08-24 05:43:13'),
(158, 1, 28892642, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(159, 1, 35961035, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(160, 1, 37353567, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(161, 1, 35759919, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(162, 1, 35822234, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(163, 1, 34067712, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(164, 1, 21432328, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(165, 1, 33806357, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(166, 1, 32491517, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(167, 1, 37888534, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(168, 1, 30096108, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:14', '2022-08-24 05:43:14'),
(169, 1, 40636486, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:15', '2022-08-24 05:43:15'),
(170, 1, 33314917, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:16', '2022-08-24 05:43:16'),
(171, 1, 35015286, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:16', '2022-08-24 05:43:16'),
(172, 1, 36633145, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:16', '2022-08-24 05:43:16'),
(173, 1, 36819781, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:16', '2022-08-24 05:43:16'),
(174, 1, 37892429, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:17', '2022-08-24 05:43:17'),
(175, 1, 39335769, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:17', '2022-08-24 05:43:17'),
(176, 1, 34122625, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:17', '2022-08-24 05:43:17'),
(177, 1, 38875956, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:18', '2022-08-24 05:43:18'),
(178, 1, 370345, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:18', '2022-08-24 05:43:18'),
(179, 1, 3481635, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:18', '2022-08-24 05:43:18'),
(180, 1, 36718539, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:18', '2022-08-24 05:43:18'),
(181, 1, 34914742, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:20', '2022-08-24 05:43:20'),
(182, 1, 38407493, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:20', '2022-08-24 05:43:20'),
(183, 1, 29999465, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:21', '2022-08-24 05:43:21'),
(184, 1, 34952723, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(185, 1, 27698356, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(186, 1, 37827924, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(187, 1, 40112488, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(188, 1, 38525738, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(189, 1, 29605649, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(190, 1, 35351140, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:22', '2022-08-24 05:43:22'),
(191, 1, 37635737, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:23', '2022-08-24 05:43:23'),
(192, 1, 34948832, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:23', '2022-08-24 05:43:23'),
(193, 1, 37591340, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:23', '2022-08-24 05:43:23'),
(194, 1, 31183491, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:23', '2022-08-24 05:43:23'),
(195, 1, 39126473, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(196, 1, 29685117, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(197, 1, 38076169, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(198, 1, 39094996, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(199, 1, 37416590, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(200, 1, 35439889, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(201, 1, 34308047, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(202, 1, 29981870, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(203, 1, 40202584, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:24', '2022-08-24 05:43:24'),
(204, 1, 34405544, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:25', '2022-08-24 05:43:25'),
(205, 1, 33501818, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:25', '2022-08-24 05:43:25'),
(206, 1, 30807971, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(207, 1, 28650523, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(208, 1, 37132931, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(209, 1, 35080541, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(210, 1, 38585683, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(211, 1, 36518760, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(212, 1, 36661346, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(213, 1, 33018638, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:26', '2022-08-24 05:43:26'),
(214, 1, 33866528, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:27', '2022-08-24 05:43:27'),
(215, 1, 35771667, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:27', '2022-08-24 05:43:27'),
(216, 1, 38515055, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(217, 1, 39125359, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(218, 1, 34556907, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(219, 1, 32948144, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(220, 1, 34650864, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(221, 1, 36800422, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(222, 1, 25389256, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(223, 1, 37170921, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(224, 1, 29641852, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:28', '2022-08-24 05:43:28'),
(225, 1, 37105393, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:29', '2022-08-24 05:43:29'),
(226, 1, 30393186, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:29', '2022-08-24 05:43:29'),
(227, 1, 36989572, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:29', '2022-08-24 05:43:29'),
(228, 1, 34996300, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:29', '2022-08-24 05:43:29'),
(229, 1, 34737348, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:29', '2022-08-24 05:43:29'),
(230, 1, 38010295, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(231, 1, 37028444, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(232, 1, 39109493, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(233, 1, 31769968, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(234, 1, 31953358, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(235, 1, 36527365, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(236, 1, 33682002, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:30', '2022-08-24 05:43:30'),
(237, 1, 35046995, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:31', '2022-08-24 05:43:31'),
(238, 1, 37992210, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:31', '2022-08-24 05:43:31'),
(239, 1, 27088075, 1, 1, 0, '2022-08-24', '2022-08-24 05:43:31', '2022-08-24 05:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `messaging`
--

CREATE TABLE `messaging` (
  `id` int(10) UNSIGNED NOT NULL,
  `msg_to` bigint(20) UNSIGNED NOT NULL,
  `msg_from` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_21_102424_create_members_table', 1),
(4, '2018_06_21_102545_create_service_types_table', 1),
(5, '2018_06_21_102546_create_attendances_table', 1),
(6, '2018_06_22_082217_create_events_table', 1),
(7, '2018_07_12_122248_create_groups_table', 1),
(8, '2018_07_12_123555_create_group_members_table', 1),
(9, '2018_08_24_111333_create_member_attendances_table', 1),
(10, '2018_09_11_113254_create_messaging_table', 1),
(11, '2018_09_13_162055_create_announcements_table', 1),
(12, '2018_12_14_114432_create_options_table', 1),
(13, '2019_02_06_224640_create_collections_types_table', 1),
(14, '2019_02_07_100536_create_collections_table', 1),
(15, '2019_02_07_101424_create_collections_commissions_table', 1),
(16, '2019_02_21_162246_create_payments_table', 1),
(17, '2019_04_16_223522_create_member_collections_table', 1),
(18, '2019_04_18_124833_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `order_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorization_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sunday Service', '2022-08-23 07:42:16', '2022-08-23 07:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'name', 'NWTAD', '2022-08-19 06:00:56', '2022-08-19 06:00:56'),
(2, 'logo', 'logo.png', '2022-08-19 06:00:59', '2022-08-19 06:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branchname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchcode` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isadmin` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branchname`, `country`, `state`, `city`, `branchcode`, `email`, `address`, `currency`, `isadmin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'National Worship Team', 'Kenya', 'Nairobi', 'Nairobi', '1001', 'greytechsystems@gmail.com', 'Kilimani', 'Sh', 'true', '$2y$10$XKHIxHv3mRzAqrKQsq5bzu77e2qLSAUzaR20.k0yhsl2nb2nPcZmy', 'OO5iOoBYI7wbSodoYWv6I7Bpr5SjLdWzoyFuZre928yLD925BWlYXPeSMAu7', '2022-08-19 06:00:13', '2022-08-19 06:00:13'),
(2, 'Nairobi Metropolis Block', 'Kenya', 'Kenya', 'Nairobi', '1002', 'greytech3000@gmail.com', 'Nairobi', 'Sh', 'false', '$2y$10$Ol6L9B.dR37KK.znFpWZQOCURIPSY8XgllabPtXCn57QrhuG/Ear6', NULL, '2022-08-23 07:47:56', '2022-08-23 07:47:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_service_types_id_foreign` (`service_types_id`),
  ADD KEY `attendances_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_date_index` (`date`),
  ADD KEY `collections_branch_id_foreign` (`branch_id`),
  ADD KEY `collections_collections_types_id_foreign` (`collections_types_id`),
  ADD KEY `collections_service_types_id_foreign` (`service_types_id`);

--
-- Indexes for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_commissions_branch_id_foreign` (`branch_id`),
  ADD KEY `collections_commissions_collection_date_foreign` (`collection_date`);

--
-- Indexes for table `collections_types`
--
ALTER TABLE `collections_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collections_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_member_id_foreign` (`member_id`),
  ADD KEY `group_members_group_id_foreign` (`group_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Indexes for table `member_attendances`
--
ALTER TABLE `member_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_attendances_service_types_id_foreign` (`service_types_id`),
  ADD KEY `member_attendances_member_id_foreign` (`member_id`);

--
-- Indexes for table `member_collections`
--
ALTER TABLE `member_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_collections_branch_id_foreign` (`branch_id`),
  ADD KEY `member_collections_member_id_foreign` (`member_id`),
  ADD KEY `member_collections_collections_types_id_foreign` (`collections_types_id`),
  ADD KEY `member_collections_service_types_id_foreign` (`service_types_id`);

--
-- Indexes for table `messaging`
--
ALTER TABLE `messaging`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messaging_msg_to_foreign` (`msg_to`),
  ADD KEY `messaging_msg_from_foreign` (`msg_from`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_branchcode_unique` (`branchcode`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collections_types`
--
ALTER TABLE `collections_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_collections`
--
ALTER TABLE `member_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `messaging`
--
ALTER TABLE `messaging`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345226;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collections`
--
ALTER TABLE `collections`
  ADD CONSTRAINT `collections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_collections_types_id_foreign` FOREIGN KEY (`collections_types_id`) REFERENCES `collections_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collections_commissions`
--
ALTER TABLE `collections_commissions`
  ADD CONSTRAINT `collections_commissions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collections_commissions_collection_date_foreign` FOREIGN KEY (`collection_date`) REFERENCES `collections` (`date`) ON DELETE CASCADE;

--
-- Constraints for table `collections_types`
--
ALTER TABLE `collections_types`
  ADD CONSTRAINT `collections_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_attendances`
--
ALTER TABLE `member_attendances`
  ADD CONSTRAINT `member_attendances_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_attendances_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_collections`
--
ALTER TABLE `member_collections`
  ADD CONSTRAINT `member_collections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_collections_types_id_foreign` FOREIGN KEY (`collections_types_id`) REFERENCES `collections_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_collections_service_types_id_foreign` FOREIGN KEY (`service_types_id`) REFERENCES `service_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messaging`
--
ALTER TABLE `messaging`
  ADD CONSTRAINT `messaging_msg_from_foreign` FOREIGN KEY (`msg_from`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messaging_msg_to_foreign` FOREIGN KEY (`msg_to`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_types`
--
ALTER TABLE `service_types`
  ADD CONSTRAINT `service_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
