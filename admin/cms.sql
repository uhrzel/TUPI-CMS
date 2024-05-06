-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 05:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', '18-12-2023 01:48:42 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(9, 24, 'in process', 'wait for processing!', '2023-12-18 18:22:37'),
(10, 26, 'in process', 'wait for immediate action', '2024-03-15 14:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(30, 'Poblacion (Polomolok)', NULL, '2023-12-18 17:12:09', NULL),
(31, 'Cannery Site', NULL, '2023-12-18 17:12:09', NULL),
(32, 'Magsaysay', NULL, '2023-12-18 17:12:09', NULL),
(33, 'Bentung', NULL, '2023-12-18 17:12:09', NULL),
(34, 'Crossing Palkan', NULL, '2023-12-18 17:12:09', NULL),
(35, 'Glamang', NULL, '2023-12-18 17:12:09', NULL),
(36, 'Kinilis', NULL, '2023-12-18 17:12:09', NULL),
(37, 'Klinan 6', NULL, '2023-12-18 17:12:09', NULL),
(38, 'Koronadal Proper', NULL, '2023-12-18 17:12:09', NULL),
(39, 'Lam Caliaf', NULL, '2023-12-18 17:12:09', NULL),
(40, 'Landan', NULL, '2023-12-18 17:12:09', NULL),
(41, 'Lapu', NULL, '2023-12-18 17:12:09', NULL),
(42, 'Lumakil', NULL, '2023-12-18 17:12:09', NULL),
(43, 'Maligo', NULL, '2023-12-18 17:12:09', NULL),
(44, 'Pagalungan', NULL, '2023-12-18 17:12:09', NULL),
(45, 'Palkan', NULL, '2023-12-18 17:12:09', NULL),
(46, 'Polo', NULL, '2023-12-18 17:12:09', NULL),
(47, 'Rubber', NULL, '2023-12-18 17:12:09', NULL),
(48, 'Silway 7', NULL, '2023-12-18 17:12:09', NULL),
(49, 'Silway 8', NULL, '2023-12-18 17:12:09', NULL),
(50, 'Sulit', NULL, '2023-12-18 17:12:09', NULL),
(51, 'Sumbakil', NULL, '2023-12-18 17:12:09', NULL),
(52, 'Upper Klinan', NULL, '2023-12-18 17:12:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(24, 2, 0, '', ' Complaint', 'Cannery Site', 'nag maoy', 'hubog gabii nag wild!', '', '2023-12-18 17:17:41', 'in process', '2023-12-18 18:22:37'),
(25, 2, 0, 'sub', 'General Query', 'Cannery Site', 'nag maoy sya', 'hubog ', '', '2023-12-18 17:37:33', NULL, NULL),
(26, 6, 0, 'sub', ' Complaint', 'Upper Klinan', 'gahud', 'paki solbad ko', '', '2024-03-15 14:15:31', 'in process', '2024-03-15 14:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(27, 2, 'john@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-18 08:23:55', '19-12-2023 12:04:11 AM', 1),
(28, 0, 'hermyrose12@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-16 14:49:14', '', 0),
(29, 0, 'hermyrose121997@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-16 14:50:43', '', 0),
(30, 0, 'hermydemz@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-29 07:57:07', '', 0),
(31, 0, 'hermydem@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-29 07:57:22', '', 0),
(32, 5, 'hermyrose@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-29 07:58:22', '29-02-2024 01:29:49 PM', 1),
(33, 6, 'irishmacalisang@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-15 13:42:35', '15-03-2024 07:45:55 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(2, 'john doe', 'john@gmail.com', '527bd5b5d689e2c32ae974c6229ff785', 912345678, '', 'Pagalungan', '', 9405, NULL, '2023-12-18 08:22:27', NULL, 1),
(3, 'hermyrose', 'hermyrose121997@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759', 987857653, NULL, NULL, NULL, NULL, NULL, '2024-02-16 14:48:45', NULL, 1),
(4, 'hermy', 'hermyrosedemz@gmail.com', 'e6cf77f28af840bd1c2e53eb81a71a85', 987665423, NULL, NULL, NULL, NULL, NULL, '2024-02-29 07:56:44', NULL, 1),
(5, 'hermz', 'hermyrose@gmail.com', 'e6cf77f28af840bd1c2e53eb81a71a85', 98765643, NULL, NULL, NULL, NULL, NULL, '2024-02-29 07:58:00', NULL, 1),
(6, 'irishjane', 'irishmacalisang@gmail.com', 'e6cf77f28af840bd1c2e53eb81a71a85', 98757645, NULL, NULL, NULL, NULL, NULL, '2024-03-15 13:40:36', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
