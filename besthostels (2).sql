-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 08:42 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `besthostels`
--

-- --------------------------------------------------------

--
-- Table structure for table `absent`
--

CREATE TABLE `absent` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `status` int(11) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  `shift` enum('morning','evening','night') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absent`
--

INSERT INTO `absent` (`id`, `userId`, `status`, `date`, `description`, `shift`) VALUES
(138, 1, 1, '2022-03-13 10:49:43', 'hadir', 'morning');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `fromDate` date NOT NULL DEFAULT current_timestamp(),
  `untilDate` date NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  `status` enum('pending','rejected','approved') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`id`, `userId`, `fromDate`, `untilDate`, `description`, `status`) VALUES
(8, 6, '2022-01-27', '2022-01-30', 'Saya ingin liburan sebentar', 'approved'),
(9, 1, '2022-01-27', '2022-01-30', 'Saya ingin liburan sebentar 3 hr', 'approved'),
(13, 1, '2022-01-27', '2022-01-30', 'Saya ingin liburan sebentar 3 hr', 'approved'),
(30, 1, '2022-02-02', '2022-02-02', 'saassaas', 'rejected'),
(31, 1, '2022-02-05', '2022-02-18', 'Liburan tahun baru', 'rejected'),
(32, 1, '2022-02-07', '2022-02-10', 'Liburan', 'rejected'),
(33, 1, '2022-02-07', '2022-02-10', 'Ini Saya\n', 'approved'),
(34, 1, '2022-02-07', '2022-02-10', 'Hhh', 'rejected'),
(35, 1, '2022-02-05', '2022-02-05', 'saassaas', 'rejected'),
(36, 1, '2022-02-05', '2022-02-05', 'saassaas', 'pending'),
(37, 1, '2022-01-27', '2022-01-30', 'Saya ingin liburan sebentar 3 hr', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `isDelete` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `updatedAt` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`, `isDelete`, `createdAt`, `updatedAt`) VALUES
(1, 'User ', 1, '2022-01-26', '2022-01-31'),
(2, 'Manager', 0, '2022-01-26', '2022-01-26'),
(8, 'Staff 1', 0, '2022-01-30', '2022-01-30'),
(9, 'Staff 2', 1, '2022-01-30', '2022-02-20'),
(10, 'Staff 3', 1, '2022-01-30', '2022-02-01'),
(11, 'Staff 4', 1, '2022-01-30', '2022-01-31'),
(12, 'Staff 5', 1, '2022-01-30', '2022-01-31'),
(13, 'Staff 7', 1, '2022-01-31', '2022-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `createdAt`, `updatedAt`) VALUES
(5, 'Product 5', 500004, '2022-01-20 13:23:31', '2022-01-21 09:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `positionId` bigint(20) NOT NULL DEFAULT 1,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `salary` decimal(11,0) NOT NULL DEFAULT 0,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `positionId`, `username`, `fullname`, `password`, `address`, `phone`, `salary`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'fajar', '', '$2a$10$/1.An85aTuyMyTsKw0C47.aibX5kB.23y/80MydaHAA16aCdPxyc6', 'Mengwi', '082235265301', '7000000', '2022-01-24', '2022-02-20'),
(6, 1, 'adasdaa', 'asdasdee', '$2a$10$cDxKg3KoxmoGrCVsig5QFO8LZIc/xAQV4MVPOH5A6Tt9Lo66u2hOO', 'Gianyar', '082235265401', '15000000', '2022-01-26', '2022-02-20'),
(9, 1, 'Rama', 'Rama widana', '$2a$10$3vxfmuXdJWO0Fpcal2sgzepd8i9MOwlzSvAVNNYLSoZNUKvhoGHnK', '', '085258963145', '2000', '2022-01-28', '2022-02-20'),
(10, 1, 'Gede', 'Gede Fajar', '$2a$10$dRcMZuQW8BFvpqZu2K4swOTU/YD/4A1Se5n4TzHoxq8r4WxQKOeoO', '', '08525896314598', '400000', '2022-01-28', '2022-02-05'),
(12, 1, 'yusmira', 'Yusmira Kartika', '$2a$10$j41bnNDUqyWljIhIqLwvkOSWP457cgZkW//.CM8vNbfb4q3U8lOOy', 'Gianyar', '082235265401', '0', '2022-02-18', '2022-02-18'),
(13, 2, 'Admin', 'Admin', '$2a$10$v8Ca9/.ErAoJMKHx2G61DO894bhOy1X.pzXfJKynpQgU.s5VkWLoK', 'Baha\n', '082235265301', '2000000', '2022-02-18', '2022-02-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absent`
--
ALTER TABLE `absent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`positionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absent`
--
ALTER TABLE `absent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absent`
--
ALTER TABLE `absent`
  ADD CONSTRAINT `absent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `leave`
--
ALTER TABLE `leave`
  ADD CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
