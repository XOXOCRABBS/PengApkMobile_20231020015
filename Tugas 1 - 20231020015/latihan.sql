-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 05:17 PM
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
-- Database: `latihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `Id` int(11) NOT NULL,
  `Produk` varchar(255) NOT NULL,
  `First name` varchar(255) NOT NULL,
  `Last name` varchar(255) NOT NULL,
  `Avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`Id`, `Produk`, `First name`, `Last name`, `Avatar`) VALUES
(1, 'Beng-beng', 'Tasty snack Indonesia', 'Murah meriah', 'https://www.mayora.com/storage/files/2017-bengbeng.png'),
(2, 'Nabati', 'Ahh', 'Joss', 'https://www.mirotakampus.com/resources/assets/images/product_images/1575781782.Richeese_Nabati_Cheese_Wafer_50gr.jpg'),
(3, 'Indomie kuah', 'Rasa Mantab', 'Joss', 'https://img.id.my-best.com/product_images/faa21e5ca87dac2bed5f4a4ed6d0f126.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=53e0a2109a616567aaead630d6201afe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
