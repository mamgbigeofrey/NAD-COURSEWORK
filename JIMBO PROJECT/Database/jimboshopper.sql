-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2022 at 04:17 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jimboshopper`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin'),
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categoryline`
--

CREATE TABLE `categoryline` (
  `lineID` int(11) NOT NULL,
  `lineName` varchar(10) NOT NULL,
  `productLineID` int(3) NOT NULL,
  `requiredStaff` int(5) NOT NULL,
  `allocatedStaff` int(5) NOT NULL DEFAULT 0,
  `slots` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoryline`
--

INSERT INTO `categoryline` (`lineID`, `lineName`, `productLineID`, `requiredStaff`, `allocatedStaff`, `slots`) VALUES
(1, 'SHORT-TERM', 0, 0, 0, NULL),
(2, 'MID-TERM', 0, 0, 0, NULL),
(3, 'LONG-TERM', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `orderQuantity` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `productID`, `orderQuantity`, `orderDate`) VALUES
(5, 8, 8, 3, '2022-08-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `productline`
--

CREATE TABLE `productline` (
  `productLineID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `staffAllocated` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `price` int(30) DEFAULT NULL,
  `image` varchar(400) DEFAULT NULL,
  `quantityInStock` int(10) DEFAULT NULL,
  `productLineID` int(10) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productName`, `category`, `price`, `image`, `quantityInStock`, `productLineID`, `Likes`) VALUES
(1, 'JACKET 1', 'jackets', 50000, 'adrian-ordonez-P0W27GRvyww-unsplash.jpg', 20, NULL, NULL),
(2, 'JACKET 2', 'jackets', 40000, 'amanda-vick-ohWf6YuzOQk-unsplash.jpg', 40, NULL, NULL),
(3, 'JACKET 3', 'jackets', 50000, 'caio-coelho-QRN47la37gw-unsplash.jpg', 10, NULL, NULL),
(4, 'JACKET 4', 'jackets', 100000, 'kal-visuals-6TIoPIpMvLc-unsplash.jpg', 10, NULL, NULL),
(5, 'JACKET 5', 'jackets', 140000, 'rayan-mill-EvxwJ6ls2vc-unsplash.jpg', 10, NULL, NULL),
(6, 'JACKET 6', 'jackets', 600000, 'santosh-verma-i49yJtWD57w-unsplash.jpg', 10, NULL, NULL),
(7, 'JACKET 7', 'jackets', 850000, 'tobias-tullius-Fg15LdqpWrs-unsplash.jpg', 10, NULL, NULL),
(8, 'SHIRT 1', 'shirts', 20000, 'anomaly-WWesmHEgXDs-unsplash.jpg', 10, NULL, NULL),
(9, 'SHIRT 2', 'shirts', 45000, 'caio-coelho-xFmXLq_KJxg-unsplash.jpg', 22, NULL, NULL),
(10, 'SHIRT 3', 'shirts', 35000, 'faith-yarn-Wr0TpKqf26s-unsplash.jpg', 60, NULL, NULL),
(11, 'SHIRT 4', 'shirts', 25000, 'geoffroy-danest-0fG6zACWGJY-unsplash.jpg', 23, NULL, NULL),
(12, 'SHIRT 5', 'shirts', 50000, 'nimble-made-hMMXhKSZk7k-unsplash.jpg', 11, NULL, NULL),
(13, 'SHIRT 6', 'shirts', 30000, 'ryan-hoffman-6Nub980bI3I-unsplash.jpg', 100, NULL, NULL),
(14, 'SHIRT 7', 'shirts', 55000, 'ryan-hoffman-A7f7XRKgUWc-unsplash.jpg', 10, NULL, NULL),
(15, 'SHIRT 8', 'shirts', 45000, 'santhosh-kumar-RqYTuWkTdEs-unsplash.jpg', 34, NULL, NULL),
(16, 'SHOE 1', 'shoes', 200000, 'andres-jasso-PqbL_mxmaUE-unsplash.jpg', 10, NULL, NULL),
(17, 'SHOE 2', 'shoes', 150000, 'mojtaba-fahiminia-t4g1gctAaKk-unsplash.jpg', 22, NULL, NULL),
(18, 'SHOE 3', 'shoes', 150000, 'imani-bahati-LxVxPA1LOVM-unsplash.jpg', 60, NULL, NULL),
(19, 'SHOE 4', 'shoes', 250000, 'paul-gaudriault-a-QH9MAAVNI-unsplash.jpg', 23, NULL, NULL),
(20, 'SHOE 5', 'shoes', 150000, 'noah-smith-wh2udxkVPWA-unsplash.jpg', 11, NULL, NULL),
(21, 'SHOE 6', 'shoes', 300000, 'maxim-hopman-8cT5ja0P_N4-unsplash.jpg', 100, NULL, NULL),
(22, 'SHOE 7', 'shoes', 170000, 'maksim-larin-NOpsC3nWTzY-unsplash.jpg', 10, NULL, NULL),
(24, 'SHOE 9', 'shoes', 150000, 'irene-kredenets-dwKiHoqqxk8-unsplash.jpg', 10, NULL, NULL),
(26, 'JEWELLERY 1', 'jewellery', 20000, 'albina-white-qILRFVJmsBc-unsplash.jpg', 10, NULL, NULL),
(27, 'JEWELLERY 2', 'jewellery', 15000, 'andres-vera-202NAwjisYA-unsplash.jpg', 22, NULL, NULL),
(28, 'JEWELLERY 3', 'jewellery', 15000, 'cornelia-ng-zZLhoEwGCeM-unsplash.jpg', 60, NULL, NULL),
(29, 'JEWELLERY 4', 'jewellery', 25000, 'joeyy-lee-6VxYRxRRXEo-unsplash.jpg', 23, NULL, NULL),
(30, 'JEWELLERY 5', 'jewellery', 15000, 'luisana-galicia-rGz2Z6tVaeg-unsplash.jpg', 11, NULL, NULL),
(31, 'JEWELLERY 6', 'jewellery', 30000, 'moises-gonzalez-RNUXJPG8KE0-unsplash.jpg', 100, NULL, NULL),
(32, 'JEWELLERY 7', 'jewellery', 17000, 'nati-melnychuk-5ngCICAXiH0-unsplash.jpg', 10, NULL, NULL),
(33, 'JEWELLERY 8', 'jewellery', 130000, 'nati-melnychuk-oO0JAOJhquk-unsplash.jpg', 34, NULL, NULL),
(34, 'JEWELLERY 9', 'jewellery', 15000, 'sama-hosseini-h_ssRPj8UZo-unsplash.jpg', 10, NULL, NULL),
(35, 'JEWELLERY 10', 'jewellery', 17000, 'sonuj-giri-w-QWfFDR8Jo-unsplash.jpg', 10, NULL, NULL),
(36, 'JEWELLERY 10', 'jewellery', 17000, 'tessa-wilson-ECr_8nuXpBA-unsplash.jpg', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `sales` int(3) NOT NULL,
  `date` date NOT NULL,
  `productlineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sales`, `date`, `productlineID`) VALUES
(1, 1200, '2022-08-09', 1),
(2, 2300, '2022-08-10', 1),
(3, 200, '2022-07-12', 1),
(4, 2300, '2022-07-12', 1),
(5, 300, '2022-07-07', 1),
(6, 2000, '2022-08-09', 2),
(7, 4000, '2022-08-10', 2),
(8, 200, '2022-08-11', 2),
(9, 1500, '2022-07-05', 2),
(10, 3000, '2022-07-06', 2),
(11, 300, '2022-08-17', 3),
(12, 4000, '2022-08-18', 3),
(13, 400, '2022-07-12', 3),
(14, 0, '2022-07-19', 3),
(15, 3000, '2022-08-17', 4),
(16, 400, '2022-08-23', 4),
(17, 2900, '2022-07-05', 4),
(18, 4500, '2022-07-19', 4),
(19, 4500, '2022-06-14', 1),
(20, 45000, '2022-06-17', 1),
(21, 65000, '2022-05-18', 1),
(22, 50000, '2022-06-18', 2),
(23, 2000, '2022-06-18', 2),
(24, 28000, '2022-05-27', 2),
(25, 45000, '2022-06-22', 3),
(26, 34000, '2022-06-21', 3),
(27, 15000, '2022-05-25', 3),
(28, 43000, '2022-06-14', 4),
(29, 45000, '2022-06-24', 4),
(30, 40000, '2022-05-17', 4);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'PENDING',
  `productLineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstName`, `lastName`, `Age`, `gender`, `address`, `email`, `status`, `productLineID`) VALUES
(1, 'JENNIFER', 'BUKENYA', 23, 'FEMALE', 'KIIRA', 'namyalojenniferb@gmail.com', 'PENDING', 0),
(2, 'SSEMYALO', 'JEREMIAH', 45, 'MALE', 'LUBUYA', 'semmajerry1@gmail.com', 'PENDING', 0),
(3, 'MUZUVA', 'JOSHUA', 56, 'MALE', 'MUYENGA', 'joshuamuzuva@gmail.com', 'PENDING', 0),
(4, 'BENEDICTFRANCIS', 'BUKENYA', 23, 'MALE', 'KIBAALE', 'bk@gmail.com', 'PENDING', 0),
(5, 'NAMULINDWA', 'MARY', 54, 'FEMALE', 'NABB', 'maryn@gmail.com', 'PENDING', 0),
(6, 'SSEBA', 'LUKE', 25, 'MALE', 'KOMIGO', 'lukessebb@gmail.com', 'PENDING', 0),
(7, 'JOHN', 'LUBWAMA', 43, 'MALE', 'KIKONI', 'johnlubz@gmail.com', 'PENDING', 0),
(8, 'DANIELLA', 'CADEN', 34, 'FEMALE', 'AFRICA', 'dc@gmail.com', 'PENDING', 0),
(9, 'LYTON', 'NANTALE', 24, 'FEMALE', 'KASUBI', 'natyly@gmail.com', 'PENDING', 0),
(10, 'LUKEMAN', 'RIO', 45, 'MALE', 'QATAR', 'lukemanrio@gmail.com', 'PENDING', 0),
(11, 'ADRIAN', 'ATEENYI', 23, 'FEMALE', 'GGABA', 'ateenyiad@gmail.com', 'PENDING', 0),
(12, 'LOY', 'SSEBBALE', 34, 'FEMALE', 'WERE', 'loysebb@gmail.com', 'PENDING', 0),
(13, 'PETERO', 'AKUNI', 34, 'MALE', 'ERR', 'akuniero@gmail.com', 'PENDING', 0),
(14, 'AUGUST', 'AULI', 23, 'MALE', 'WANDEGEYA', 'augustli@gmail.com', 'PENDING', 0),
(15, 'JASPER', 'SSENDIKWANAWA', 34, 'MALE', 'JJINJA', 'ssendi@gmail.com', 'PENDING', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `timeCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(40) NOT NULL,
  `gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `email`, `age`, `address`, `timeCreated`, `password`, `gender`) VALUES
(6, 'Mamgbi', 'Geofrey', 'gmamgbi1999@gmail.com', 34, 'Mulago central', '2022-08-11 14:05:05', 'Ne1234', 'Male'),
(7, 'Mamgbi', 'Geofrey', 'gmamgbi1999@gmail.com', 34, 'Mulago central', '2022-08-11 14:05:05', 'Ne1234', 'Male'),
(8, 'User', 'Sensy', 'user@gmail.com', 13, 'Mulago, mawanda road', '2022-08-11 14:06:17', '2222', 'Male'),
(9, 'User', 'Sensy', 'user@gmail.com', 13, 'Mulago, mawanda road', '2022-08-11 14:06:17', '2222', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoryline`
--
ALTER TABLE `categoryline`
  ADD PRIMARY KEY (`lineID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `productline`
--
ALTER TABLE `productline`
  ADD PRIMARY KEY (`productLineID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `productLineID` (`productLineID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoryline`
--
ALTER TABLE `categoryline`
  MODIFY `lineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productline`
--
ALTER TABLE `productline`
  MODIFY `productLineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLineID`) REFERENCES `productline` (`productLineID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
