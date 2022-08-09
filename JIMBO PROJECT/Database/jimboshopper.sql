-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 09, 2022 at 01:15 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

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
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `orderQuantity` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ProductLine`
--

CREATE TABLE `ProductLine` (
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
-- Stand-in structure for view `sales`
-- (See below for the actual view)
--
CREATE TABLE `sales` (
`productName` varchar(100)
,`orderQuantity` int(11)
,`Amount` bigint(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `staffID` int(11) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `productLineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Structure for view `sales`
--
DROP TABLE IF EXISTS `sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales`  AS SELECT `products`.`productName` AS `productName`, `orders`.`orderQuantity` AS `orderQuantity`, `orders`.`orderQuantity`* `products`.`price` AS `Amount` FROM (`products` join `orders`) WHERE `orders`.`productID` = `products`.`productID``productID`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `ProductLine`
--
ALTER TABLE `ProductLine`
  ADD PRIMARY KEY (`productLineID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `productLineID` (`productLineID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`staffID`),
  ADD KEY `productLineID` (`productLineID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ProductLine`
--
ALTER TABLE `ProductLine`
  MODIFY `productLineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLineID`) REFERENCES `ProductLine` (`productLineID`);

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`productLineID`) REFERENCES `ProductLine` (`productLineID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
