-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 11:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `churchhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `check_in_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `event_id`, `member_id`, `check_in_time`) VALUES
(1, 2, 92, '2025-04-21 22:32:00'),
(2, 2, 92, '2025-05-04 08:17:00'),
(3, 2, 93, '2025-05-21 20:19:00'),
(4, 2, 93, '2025-05-23 21:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `communications`
--

CREATE TABLE `communications` (
  `communication_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_body` text DEFAULT NULL,
  `communication_type` varchar(50) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `donation_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` datetime NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_date`, `location`, `description`) VALUES
(2, 'Church Service Easter', '2025-04-20 04:00:00', 'Church', 'Resurrection of Christ');

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `family_id` int(11) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `primary_contact_member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `citizenship` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `facebook_account` varchar(255) DEFAULT NULL,
  `spouse_last` varchar(100) DEFAULT NULL,
  `spouse_first` varchar(100) DEFAULT NULL,
  `spouse_middle` varchar(50) DEFAULT NULL,
  `spouse_dob` date DEFAULT NULL,
  `date_of_marriage` date DEFAULT NULL,
  `place_of_marriage` varchar(255) DEFAULT NULL,
  `year_of_membership` date DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ministry_position` varchar(255) DEFAULT NULL,
  `year_of_conversion` date DEFAULT NULL,
  `year_of_baptism` date DEFAULT NULL,
  `previous_religion` varchar(255) DEFAULT NULL,
  `previous_church` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `membership_status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `place_of_birth`, `citizenship`, `gender`, `civil_status`, `email`, `phone`, `facebook_account`, `spouse_last`, `spouse_first`, `spouse_middle`, `spouse_dob`, `date_of_marriage`, `place_of_marriage`, `year_of_membership`, `address_id`, `join_date`, `ministry_position`, `year_of_conversion`, `year_of_baptism`, `previous_religion`, `previous_church`, `address`, `membership_status`) VALUES
(92, 'Juan', 'Santos', 'Dela Cruz', '2025-04-17', 'Davao City', '', 'Male', 'Married', 'juan.delacruz@example.com', '+639171234567', 'juan.delacruz.fb', 'Dela Cruz', 'Maria', 'Lopez', NULL, '2010-06-12', 'Davao City Hall', '2025-04-10', NULL, '0000-00-00 00:00:00', 'Youth Leader', '2005-03-05', '2006-08-14', 'None', 'None', '123 Church St., Davao City', 'active'),
(93, 'Juana', 'Sant', 'Dela Cruz', '1985-07-15', 'Davao City', 'Filipino', 'Female', '', 'juana.delacruz@example.com', '+639171234567', 'juana.delacruz.fb', 'NA', 'NA', 'NA', '0000-00-00', '0000-00-00', 'NA', '2025-04-10', NULL, '0000-00-00 00:00:00', 'Youth Leader', '2005-03-05', '2006-08-14', 'None', 'None', '123 Church St., Davao City', 'inactive'),
(96, 'Juanddfa', 'Santosd', 'Dela Cruzdd', '1985-07-15', 'Davao City', 'Filipino', 'Male', 'Single', 'juaawn.delacruz@example.com', '+639171234567', 'juan.delacruz.fb', 'Dela Cruz', 'Maria', 'Lopez', '1987-09-20', '2010-06-12', 'Davao City Hall', '2025-04-10', NULL, '0000-00-00 00:00:00', 'Youth Leader', '2005-03-05', '2006-08-14', 'None', 'None', '123 Church St., Davao City', 'active'),
(98, 'John', 'Saint', 'Dela Vega', '1985-07-15', 'Davao City', 'Filipino', 'Male', 'Single', 'John.delacruz@example.com', '+639171234567', 'John.delacruz.fb', 'NA', 'NA', 'NA', '0000-00-00', '0000-00-00', 'NA', '2025-05-13', NULL, '0000-00-00 00:00:00', 'NA', '2005-03-05', '2006-08-14', 'None', 'None', '123 4Church St., Davao City', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `member_children`
--

CREATE TABLE `member_children` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `child_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_departments`
--

CREATE TABLE `member_departments` (
  `id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_departments`
--

INSERT INTO `member_departments` (`id`, `member_name`, `department_name`, `created_at`) VALUES
(1, 'Juana Sant Dela Cruz', 'UFW', '2025-05-09 13:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `member_education`
--

CREATE TABLE `member_education` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `year_graduated` varchar(10) NOT NULL,
  `course_degree` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_families`
--

CREATE TABLE `member_families` (
  `member_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_gifts`
--

CREATE TABLE `member_gifts` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `gift` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_gifts`
--

INSERT INTO `member_gifts` (`id`, `member_id`, `gift`) VALUES
(17, 92, 'Teaching'),
(18, 92, 'Leadership'),
(19, 93, 'Teaching'),
(20, 93, 'Leadership'),
(21, 96, 'Teaching'),
(22, 96, 'Leadership'),
(23, 98, 'Teaching'),
(24, 98, 'Leadership');

-- --------------------------------------------------------

--
-- Table structure for table `member_health`
--

CREATE TABLE `member_health` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `condition_name` varchar(255) NOT NULL,
  `condition` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_health`
--

INSERT INTO `member_health` (`id`, `member_id`, `condition_name`, `condition`) VALUES
(7, 92, 'Using Eyeglasses', ''),
(8, 92, 'Migraine', ''),
(9, 92, '', ''),
(10, 93, 'Using Eyeglasses', ''),
(11, 93, 'Migraine', ''),
(12, 93, '', ''),
(13, 96, 'Using Eyeglasses', ''),
(14, 96, 'Migraine', ''),
(15, 96, '', ''),
(16, 98, 'Using Eyeglasses', ''),
(17, 98, 'Migraine', ''),
(18, 98, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `member_hobbies`
--

CREATE TABLE `member_hobbies` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `hobby` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_hobbies`
--

INSERT INTO `member_hobbies` (`id`, `member_id`, `hobby`) VALUES
(7, 92, 'Basketball'),
(8, 92, 'Swimming'),
(9, 92, ''),
(10, 93, 'Basketball'),
(11, 93, 'Swimming'),
(12, 93, ''),
(13, 96, 'Basketball'),
(14, 96, 'Swimming'),
(15, 96, ''),
(16, 98, 'Basketball'),
(17, 98, 'Swimming'),
(18, 98, '');

-- --------------------------------------------------------

--
-- Table structure for table `member_ministries`
--

CREATE TABLE `member_ministries` (
  `member_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_skills`
--

CREATE TABLE `member_skills` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `skill` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_skills`
--

INSERT INTO `member_skills` (`id`, `member_id`, `skill`) VALUES
(9, 92, 'Driving'),
(10, 92, 'Writing'),
(11, 92, 'Cooking'),
(12, 92, ''),
(13, 93, 'Driving'),
(14, 93, 'Writing'),
(15, 93, 'Cooking'),
(16, 93, ''),
(17, 96, 'Driving'),
(18, 96, 'Writing'),
(19, 96, 'Cooking'),
(20, 96, ''),
(21, 98, 'Driving'),
(22, 98, 'Writing'),
(23, 98, 'Sewing'),
(24, 98, 'Selling/Marketing'),
(25, 98, 'Doing Electrical Jobs'),
(26, 98, 'Doing Computer Work'),
(27, 98, 'Cooking'),
(28, 98, '');

-- --------------------------------------------------------

--
-- Table structure for table `member_trainings`
--

CREATE TABLE `member_trainings` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `training_name` varchar(255) NOT NULL,
  `year_taken` varchar(10) NOT NULL,
  `title_designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ministries`
--

CREATE TABLE `ministries` (
  `ministry_id` int(11) NOT NULL,
  `ministry_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `record_type` enum('Baptismal','Child Dedication','Wedding','Death') NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `officiating_pastor` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `member_id`, `record_type`, `name`, `date`, `location`, `officiating_pastor`, `remarks`, `created_at`) VALUES
(5, 92, 'Baptismal', 'Juan Santos Dela Cruz', '2025-05-03', 'Vasilyo', 'RR', 'Accepted', '2025-05-03 12:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `church_name` varchar(255) DEFAULT NULL,
  `church_address` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `logo_path` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `church_name`, `church_address`, `contact_email`, `contact_phone`, `logo_path`) VALUES
(1, 'Foursquare', 'Santo Tomas Foursquare Gospel Church, Tibal-Og, Davao, Philippines', 'contact@foursquare.org', '', 0x89504e470d0a1a0a0000000d49484452000000cc000000c008030000007f3e7cbb000000d8504c5445ffffff9e283c184e795a4178d7b448fefdfb004372d4ae30f9f4e7bd78823b0f63003d6f6f89a2d3ab21ecdcb2bd7a838d000000346ae8ebefeeebf049286c990d2a899db2d5b13aada3b8e8d5d7f6eeefa13143f8f6f997a6b8ecdbdd9c2136ca999f35005f002d66d7d8e0dcbe688490a8cad0d9553a7495001da94b59e7d39ef2e7cc4f3270f5edd8c8c2d0411c67e2c985dfc478daba5aefe2c0d2cdd9654f809b8fab897a9c6e5a8776638db36a73a54150537392376085bbc5d1adb9c7930013002261dab9bc506689b05e6b220054000048bab2c5eabd18040000082e49444154789ceddd697fda3618007097c376c2d182494c5bb39498441d1842ccbd85d036dbf8fedf683687b12d3d3a0caca2d3f3a2bfb533823f921e9d6935edfdcdbb73c6076d1fb7a5dc39a3560fdee37f8bb9bbd9c6ddaf80f9e3fd26aefee4d7c88ab9fbfc71fbb13e097c010aa3300aa3300aa3300a733a8c2e149263ca2d917801387260968f9a48dcca8d7915b138726372629807a931fa4a0853961a5312c2d4e54e0082187221d2606e1d11cc77a9317ab92e8079bc971bf3e60a605a35a931395d64d48492992c989a4006708032a4c1886480fabde4187dc99f015650970131df3e90e3eb1e73053cf001df1ce459cfd4f833c052740970f3f13720f6cde113f0ff2d7cab9307536af1b633071a6540ccd74fdc5f543a7ecf84c9e578db19a50c6930f7bcc919fe3ae4c1e82f7cc5bf522a571a4cee3b5f0a8066cc7261f4379ed25fe10264c270f51a8756312046644a7e228cbe64bfe98a5631e038f3058a5d95393fa0073e67c504731a96c5a5560c3803000ef9cebca3c9d8d7007732181820ce8bd1dfe823e72bdd2217265871d22c8f0c8b64985ce9014e026eeec23094850ddb221d26577b20f79b4778f35f5e4caef442c869757013436e4cae946ba52ac7792d739d524988092ba7f578e83af55599dd5de4c5e4747dd98a3afe1b2745564c98a3a39e7fcffb1a6931fa01c3d3f5154661144661144661144661144661f8e2179a3527d633cbcb5ecf94de6e632b4db775c12b4d5dbf4d9d07d4576f5c1af930a525e182835bbec8dd199d7c5fb3cea3910e039d04d4e1e37f6931b516d942bb65222b465f82c7b4e0cd4c6931b45300f65440328cfee082b162b751b93039fd1e0c763a930d7354288cc2288cc228cce5637e6cef957ebcba7cccbbbbafdb0bbfdf7e89bfdc2043288cc2288cc2fc4798ab6f37e78c03a65c13fb896cc1f81e62be5c9d35fe8a30abf259e345e4c7f054a850a142858a4c5134cf1bd11b39d67923b4542be78dfe1ed3fcfbfa9cf18f15628cc239c38eaaa6d9c89f33ae15466114466114466114466114466114e6588c6118b66d548ee1ca8231eceea81f44afea572e1d53e99ac5fdca7a94b972e4c0547a45ed10fdac1a2930765f4b448f4b63fb3262ec51d2a299439b6d199a58691260ec6e3185d158ddc62e74fa84d27e3ec67e36d316ad8fb5a014a51aa60a8cfcf3317e0fb368e633a59dd99deee643cb88e9e2165aa7b1fdee3e5dc887e9e08d2c78b00b608c42b71ff530f9307d8205c204d3847e2c59c886b1ab240b191350cc44de930d13843f1c61a999d0672a856aaa41ca989a0b76c5488f9afd4e1263181dbc399e148326a7c1845ffb305939bdf83813b8f06175d3164f87f19a6b91573066cdc9ba196d9601b66d177cbfd325e688a0b4e1e93048b3d0c9300523f131479d4d3c0fbb2352e6de86d94977accc98465373445ec2c054925fbf192ed44c52e38a3d83159219e3399ae6e6f9eb8685214c6a18d1c796a4593141c5689a33f54e86013a061c84c23262503e3c70d5c613eeaa6161e84d8a84c127a319314fcdcd6b9c29f78b18185bd4a215f1b2b83128dea210b2b62f1a24aac6a3d4131d6390e6cef42094c58b418b7825349abb1fa6736631a3375bc01ac6380367602848eb3cde9a59bbf3e873a37cf4538ef1aaf16865d031be70971911b6d7383168626983e863471513c4ecf0a7aee65e67c318c4f90a2d8aa435022f661e3cb14fc468323e943a88ea651db43a3855d331c2a30c71290a60e60b9468fe681a3c61edba84378dfff869e20f67090dcacff830c2a3cc88580c198316836942e30dc247b6c34aa26282aad97c7e6fb1c96f89b9a7976f8ef930b660ffefb18a4936b381b38ecf55bc6d2a6e22ac62b65583261bad663dc55e335f6beba80c2ac617c38c809d280013ce56c69343fa9a6f9f7182ee9eaa98e0b900807629c13a24376f318ea7072a86b8ab0145b10aedaa01186f1abcb73b6fc46cdb0febe5d12c5dfa0479b3fdb813cdd6bc595082353f3da6ff0c50400c5a84238935ddb59aeb685c19b7d31513f49af6fc30eeec5ed1d8b4c5c161317a224c0fa6c07d066dfa80d3bcde7cb5ed4369b339f606ceaec384e16eaba2bddefc6e8af830609f298e629b4be668685037a1214c63bdfba61b286cfeb1f2097fc5412c21586172464fdb879c052706ce667dbf52a918854ec7b783ff601c0e4098286585b398bd8c23c2d5a737dfbd763ce7c450a666558ed30d1606cd77f362cd9da1b605bc1321064f284addeb58818c9333b03caeb31a0626ef45fddc994ef82dda787198b8c517a299e7663deaf1061f26deb4b0fc4509ebd0a7ac052fc6ee50269ae4a98b58cd4cb3fffb03bb48acdc188b335a6e868e04f831874e93399af159271d63d3569af86e9f2826df3816634df931c94d404ce3f36960ccd380563e47b88945346b4383ba09502c70b53418e34d8fc40c126b1bd6dd1983baa4c1772fc530287f5c06486ddeb26f355157ce5c1acab2b97d1cc69a09d54c30dba46ae8a7e94ccc13ff248614a98d6836867421404c43c178d8c24528064f79314c3074e20782b1604f052818848eb1a437d5796e02da856e8fc2616a685b4d22f34b2cacd49e3adfb546db1f523cac9646c31c35d2b8a9e278ef68dab6ff3cacf6c8ddc7f4a9e30d0d73d448933ef014b8701a1e65763a4115e14767a64dd3d030289fdde2ccbccc98ed070b7fc1f706cc02a508eaf66c23fb48e3a44bcb7615387d41206c697019548cb7d69c8c31380d66887f4d45ca8d27eac679a39d35b0c23261ec67426603af3cc970dd8416a49b7581e63231c4ab75e1062db17224c740f3b51e512339a650205f48d3fa9d63ce347f12069c4a9b43fc5053760cbc9e2e562f0f134c03a0b8440c7f288cc2288cc2288cc2288cc29c15f32fe1f75f65936fd20f0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'admin', '$2y$10$wH6Qv8w8Qk1Qn8w8Qk1QnOeQw8Qk1Qn8w8Qk1Qn8w8Qk1Qn8w8Qk1Q');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_assignments`
--

CREATE TABLE `volunteer_assignments` (
  `assignment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `assignment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `communications`
--
ALTER TABLE `communications`
  ADD PRIMARY KEY (`communication_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`family_id`),
  ADD KEY `primary_contact_member_id` (`primary_contact_member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `member_children`
--
ALTER TABLE `member_children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_departments`
--
ALTER TABLE `member_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_education`
--
ALTER TABLE `member_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_families`
--
ALTER TABLE `member_families`
  ADD PRIMARY KEY (`member_id`,`family_id`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `member_gifts`
--
ALTER TABLE `member_gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_health`
--
ALTER TABLE `member_health`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_hobbies`
--
ALTER TABLE `member_hobbies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_ministries`
--
ALTER TABLE `member_ministries`
  ADD PRIMARY KEY (`member_id`,`ministry_id`),
  ADD KEY `ministry_id` (`ministry_id`);

--
-- Indexes for table `member_skills`
--
ALTER TABLE `member_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_trainings`
--
ALTER TABLE `member_trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `ministries`
--
ALTER TABLE `ministries`
  ADD PRIMARY KEY (`ministry_id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `volunteer_assignments`
--
ALTER TABLE `volunteer_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `ministry_id` (`ministry_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `communications`
--
ALTER TABLE `communications`
  MODIFY `communication_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `family_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `member_children`
--
ALTER TABLE `member_children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_departments`
--
ALTER TABLE `member_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_education`
--
ALTER TABLE `member_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_gifts`
--
ALTER TABLE `member_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `member_health`
--
ALTER TABLE `member_health`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `member_hobbies`
--
ALTER TABLE `member_hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `member_skills`
--
ALTER TABLE `member_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `member_trainings`
--
ALTER TABLE `member_trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ministries`
--
ALTER TABLE `ministries`
  MODIFY `ministry_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `volunteer_assignments`
--
ALTER TABLE `volunteer_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `communications`
--
ALTER TABLE `communications`
  ADD CONSTRAINT `communications_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_ibfk_1` FOREIGN KEY (`primary_contact_member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `member_children`
--
ALTER TABLE `member_children`
  ADD CONSTRAINT `member_children_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_education`
--
ALTER TABLE `member_education`
  ADD CONSTRAINT `member_education_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_families`
--
ALTER TABLE `member_families`
  ADD CONSTRAINT `member_families_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `member_families_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `families` (`family_id`);

--
-- Constraints for table `member_gifts`
--
ALTER TABLE `member_gifts`
  ADD CONSTRAINT `member_gifts_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_health`
--
ALTER TABLE `member_health`
  ADD CONSTRAINT `member_health_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_hobbies`
--
ALTER TABLE `member_hobbies`
  ADD CONSTRAINT `member_hobbies_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_ministries`
--
ALTER TABLE `member_ministries`
  ADD CONSTRAINT `member_ministries_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `member_ministries_ibfk_2` FOREIGN KEY (`ministry_id`) REFERENCES `ministries` (`ministry_id`);

--
-- Constraints for table `member_skills`
--
ALTER TABLE `member_skills`
  ADD CONSTRAINT `member_skills_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_trainings`
--
ALTER TABLE `member_trainings`
  ADD CONSTRAINT `member_trainings_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `volunteer_assignments`
--
ALTER TABLE `volunteer_assignments`
  ADD CONSTRAINT `volunteer_assignments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `volunteer_assignments_ibfk_2` FOREIGN KEY (`ministry_id`) REFERENCES `ministries` (`ministry_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
