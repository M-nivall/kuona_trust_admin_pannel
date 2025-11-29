-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 09:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuona_trust`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'kimathi', 'kimathi@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `art_work`
--

CREATE TABLE `art_work` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `art_desc` text NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `art_status` varchar(50) NOT NULL DEFAULT 'Pending approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_work`
--

INSERT INTO `art_work` (`id`, `artist_id`, `title`, `art_desc`, `image_name`, `art_status`) VALUES
(1, 6, 'Beautiful Home', 'Represent those beautiful homsted', '20250508124447_681c8b1f441c3.jpg', 'Approved'),
(2, 7, 'Side by Side Always', 'Reflection of friends who are always by your side', '20250514010110_6823cf361f641.jpg', 'Approved'),
(3, 8, 'Furry Wheels', 'A mix of power and enjoyment.', '20250527175245_6835dfcd29fa2.jpg', 'Approved'),
(4, 9, 'Ancient Greek', 'Learning ancient times', '20250528105211_6836cebb23e02.jpg', 'Approved'),
(5, 6, 'Art.', 'Sampling.', '20250727212300_68867c9438073.jpg', 'Approved'),
(6, 14, 'Beyond the Brushes', 'a world where art is enjoyed', '20250728153150_68877bc6db200.jpg', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `assign_status` varchar(20) NOT NULL DEFAULT 'Pending deliver',
  `materials` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`id`, `emp_id`, `order_id`, `assign_status`, `materials`) VALUES
(1, 7, 1, 'Delivered', 'screw driver, hammer, drill');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `order_id` int(11) NOT NULL,
  `client_id` int(15) NOT NULL,
  `county_id` int(11) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `date_to_deliver` varchar(20) DEFAULT NULL,
  `time_to_deliver` varchar(20) DEFAULT NULL,
  `order_status` varchar(11) NOT NULL DEFAULT '0',
  `order_date` varchar(20) DEFAULT NULL,
  `date_delivered` varchar(20) DEFAULT NULL,
  `order_remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`order_id`, `client_id`, `county_id`, `town_id`, `address`, `date_to_deliver`, `time_to_deliver`, `order_status`, `order_date`, `date_delivered`, `order_remark`) VALUES
(1, 2, 1, 15, 'all smiles', NULL, NULL, '8', '2023-11-05 18:55:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone_no` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'Pending approval',
  `password` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `user` varchar(10) NOT NULL DEFAULT 'Artist',
  `bio` varchar(100) DEFAULT NULL,
  `portfolio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(70) DEFAULT NULL,
  `wallet` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `status`, `password`, `date_created`, `remarks`, `user`, `bio`, `portfolio`, `profile_image`, `wallet`) VALUES
(6, 'Calvin', 'Calmax', 'calvin', '0780961279', 'calvin@gmail.com', 'Approved', '1234', '2025-05-07 14:03:17', NULL, 'Artist', 'Professional Artist', 'www.calvin.com', '-m3vhtp.jpg', 66890.00),
(7, 'Amelia', 'Nyambura', 'Amelia', '0786971420', 'amelia@gmail.com', 'Approved', '1234', '2025-05-13 22:41:46', NULL, 'Artist', 'Professional Artist', 'www.amelia.com', 'IMG-20250227-WA0016.jpg', 0.00),
(8, 'seamless', '4ms', '4ms', '0723456789', '4ms@gmail.com', 'Approved', '1234', '2025-05-27 15:45:51', NULL, 'Artist', 'professional artist', '4ms.com', 'Screenshot_20250525-224905_WhatsApp.png', 36100.00),
(9, 'kim', 'Davis', 'kim', '0785223456', 'kim@gmail.com', 'Approved', '1234', '2025-05-28 08:49:29', NULL, 'Artist', 'Artist by profession', 'kim.com', 'a8ae920992e08b4569e57c6c18596869.jpg', 28000.00),
(10, 'Joy', 'Wambui', 'Joy', '0745259860', 'joy@gmail.com', 'Approved', '1234', '2025-06-19 21:45:07', NULL, 'Student', NULL, NULL, NULL, 0.00),
(11, 'Martin', 'kin', 'martin', '0713215487', 'martin@gmail.com', 'Approved', '1234', '2025-06-24 10:22:38', NULL, 'Student', NULL, NULL, NULL, 0.00),
(12, 'Kevin', 'blake', 'Blake', '0769429674', 'blake@gmail.com', 'Approved', '1234', '2025-06-25 06:27:33', NULL, 'Artist', 'art is a science', 'www.blake.com', '1c3fadca4d5a2a1e5780ec76d6c758ec.jpg', 70000.00),
(13, 'Slim', 'Simon', 'Simon', '0740456179', 'Simon@gmail.com', 'Approved', '1234', '2025-06-25 09:37:42', NULL, 'Artist', 'artist', 'www.simon.com', '8717475e8f5d298fc27c89a91c815b50.jpg', 0.00),
(14, 'Njoroge', 'Kamau', 'Njoroge', '0796321458', 'kamau1@gmail.com', 'Approved', '1234', '2025-07-28 10:57:16', NULL, 'Artist', 'Art enthusiast', 'www.njoro', 'f57f0b3d4c0bc8389f8c7152570b46be.jpg', 35000.00);

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `county_id` int(11) NOT NULL,
  `county_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`county_id`, `county_name`) VALUES
(1, 'Meru'),
(2, 'Kiambu'),
(3, 'Mombasa'),
(4, 'Kwale'),
(5, 'Embu');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `county_id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_cost`
--

CREATE TABLE `delivery_cost` (
  `d_id` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery_cost`
--

INSERT INTO `delivery_cost` (`d_id`, `cost`) VALUES
(1, 300);

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL,
  `art_id` int(11) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `donor_id` int(11) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_code` varchar(20) NOT NULL,
  `donation_date` varchar(50) NOT NULL,
  `artist_share` decimal(12,2) DEFAULT NULL,
  `company_share` decimal(12,2) DEFAULT NULL,
  `donation_status` int(11) NOT NULL DEFAULT 1,
  `donation_for` varchar(50) DEFAULT 'Artwork'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`donation_id`, `art_id`, `artist_id`, `donor_id`, `amount`, `payment_method`, `reference_code`, `donation_date`, `artist_share`, `company_share`, `donation_status`, `donation_for`) VALUES
(1, 1, 6, 1, '50000', 'Bank', 'VOATYTRD9H', '2025-05-11', 35000.00, 15000.00, 4, 'Artwork'),
(2, 1, 6, 1, '20000', 'MPESA', 'DPG5APPQF2', '2025-05-18', 14000.00, 6000.00, 4, 'Exhibition'),
(3, 3, 8, 2, '30000', 'MPESA', '6F0NRGPSBJ', '2025-05-27', 21000.00, 9000.00, 3, 'Artwork'),
(4, 2, 8, 2, '23000', 'Bank', '4C6OZL5PF2', '2025-05-27', 16100.00, 6900.00, 3, 'Exhibition'),
(5, 4, 9, 2, '40000', 'MPESA', '17PTOG1F8V', '2025-05-28', 28000.00, 12000.00, 3, 'Artwork'),
(6, 4, 12, 2, '100000', 'PayPal', 'A7XK05NVXS', '2025-06-25', 70000.00, 30000.00, 4, 'Exhibition'),
(7, 5, 6, 2, '17000', 'Card', '5T2476KO5V', '2025-07-27', 11900.00, 5100.00, 4, 'Exhibition'),
(8, 6, 14, 2, '50000', 'MPESA', 'LU8D7CHUOP', '2025-07-28', 35000.00, 15000.00, 4, 'Artwork');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `donor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending approval',
  `password` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `user` varchar(50) NOT NULL DEFAULT 'Donor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`donor_id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `status`, `password`, `date_created`, `remarks`, `user`) VALUES
(1, 'Abed', 'Muhanda', 'Abed', '0745253989', 'abed@gmail.com', 'Approved', '1234', '2025-05-10 20:01:46', NULL, 'Patron'),
(2, 'yconn', 'ybn', 'yconn', '0797552523', 'ybn3@gmail.com', 'Approved', '1234', '2025-05-27 16:00:00', NULL, 'Patron');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `userlevel` varchar(20) NOT NULL DEFAULT 'Staff',
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `contact` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `f_name`, `l_name`, `username`, `email`, `password`, `date_added`, `userlevel`, `status`, `contact`) VALUES
(1, 'Jane', 'Wambui', 'Jane', 'jwambui@gmail.com', '1234', '2023-10-16 15:24:21', 'Finance', 'Active', '0723456298'),
(2, 'Amina', 'Wangech', 'Amina', 'amina@gmail.com', '1234', '2023-11-05 15:14:18', 'Exhibition Manager', 'Active', '0734236758'),
(8, 'Amani', 'James', 'Amani', 'amani@gmail.com', '1234', '2025-06-19 17:29:36', 'Mentor', 'Active', '0745780912'),
(9, 'John', 'Wasike', 'John', 'john@gmail.com', '1234', '2025-06-24 10:26:26', 'Mentor', 'Active', '0756431290');

-- --------------------------------------------------------

--
-- Table structure for table `exhibitions`
--

CREATE TABLE `exhibitions` (
  `exhibition_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `exhibition_desc` text NOT NULL,
  `starting_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `venue` varchar(50) NOT NULL,
  `exhibition_type` varchar(50) NOT NULL,
  `banner_img` varchar(80) NOT NULL,
  `exhibition_status` varchar(50) NOT NULL DEFAULT 'Upcoming',
  `visibility` varchar(50) NOT NULL DEFAULT 'gone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exhibitions`
--

INSERT INTO `exhibitions` (`exhibition_id`, `title`, `exhibition_desc`, `starting_date`, `end_date`, `venue`, `exhibition_type`, `banner_img`, `exhibition_status`, `visibility`) VALUES
(3, 'Echoes of Culture', 'A celebration of heritage, tradition, and identity...', '25/7/2025', '31/5/2025', 'Main Hall', 'Physical', 'IMG-20250514-WA0000.jpg', 'Upcoming', 'gone'),
(4, 'Voices of Change', 'A powerful showcase of art that inspires awareness, challenges injustice, and sparks meaningful conversations', '20/6/2025', '23/5/2025', 'Main Hall', 'Physical', 'IMG-20250514-WA0002.jpg', 'Upcoming', 'gone'),
(5, 'The World Of Art', 'Getting to understand Art.', '1/6/2025', '2/6/2025', 'Main Hall', 'Physical', '552c06c5f06cceadb8db11c4d34e0c72.jpg', 'Upcoming', 'gone'),
(6, 'Learn Art', 'sample.', '07/27/2025', '07/27/2025', 'Mph', 'Physical', '45b378b5065421b7474a8cb0362f7e7f (1).jpg', 'Upcoming', 'gone');

-- --------------------------------------------------------

--
-- Table structure for table `exhibition_artworks`
--

CREATE TABLE `exhibition_artworks` (
  `id` int(11) NOT NULL,
  `exhibition_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `art_desc` text NOT NULL,
  `image_name` varchar(70) NOT NULL,
  `ex_status` varchar(50) DEFAULT 'Pending approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exhibition_artworks`
--

INSERT INTO `exhibition_artworks` (`id`, `exhibition_id`, `artist_id`, `title`, `art_desc`, `image_name`, `ex_status`) VALUES
(1, 3, 6, 'Echoes of Culture', 'Traditional cultural life', '20250515115005_6825b8cd75256.jpg', 'Approved'),
(2, 5, 8, 'Greek Mythology', 'Learning and getting to see ancient mythology.', '20250527182300_6835e6e4b3482.jpg', 'Approved'),
(3, 5, 9, 'Ancient Greek', 'learning about ancient mythology', '20250528110712_6836d240551e1.jpg', 'Approved'),
(4, 5, 12, 'Icarus', 'to fall means you once flied', '20250625083104_685b97a8059ff.jpg', 'Approved'),
(5, 6, 6, 'Art', 'sample', '20250727212818_68867dd225547.jpg', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fb_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `fb` text NOT NULL,
  `fb_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) NOT NULL,
  `staff_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fb_id`, `comment`, `fb`, `fb_date`, `client_id`, `staff_id`) VALUES
(4, 'hello sir', 'Hi, how can I help you', '2025-07-31 21:32:21', 6, 'Exhibition Manager');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `image_name` varchar(80) NOT NULL,
  `exhibition_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(60) NOT NULL,
  `art_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `title`, `image_name`, `exhibition_id`, `artist_id`, `artist_name`, `art_id`) VALUES
(1, 'icarus', '20250625083104_685b97a8059ff.jpg', 5, 12, 'Kevin blake', 4),
(2, 'Echoes of Culture', '20250515115005_6825b8cd75256.jpg', 3, 6, 'Calvin Calmax', 1),
(3, 'Ancient Greek', '20250528110712_6836d240551e1.jpg', 5, 9, 'kim Davis', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(15) NOT NULL,
  `county_id` int(11) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `date_to_deliver` varchar(20) DEFAULT NULL,
  `time_to_deliver` varchar(20) DEFAULT NULL,
  `order_status` varchar(11) NOT NULL DEFAULT '0',
  `order_date` varchar(20) DEFAULT NULL,
  `date_delivered` varchar(20) DEFAULT NULL,
  `order_remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `client_id`, `county_id`, `town_id`, `address`, `date_to_deliver`, `time_to_deliver`, `order_status`, `order_date`, `date_delivered`, `order_remark`) VALUES
(1, 2, 1, 15, 'all smiles', NULL, NULL, '1', '2023-11-05 19:08:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `stock_id` int(15) NOT NULL,
  `order_id` int(15) NOT NULL,
  `item_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_status` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `stock_id`, `order_id`, `item_price`, `quantity`, `item_status`, `client_id`) VALUES
(3, 1, 1, 7000, 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(15) NOT NULL,
  `mpesa_code` varchar(15) NOT NULL,
  `client_id` int(15) NOT NULL,
  `order_cost` int(11) NOT NULL,
  `delivery_cost` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `mpesa_code`, `client_id`, `order_cost`, `delivery_cost`, `total_cost`, `status`) VALUES
(1, 1, '', 2, 7000, 0, 0, 1),
(2, 1, 'QRTYBB23TT', 2, 21000, 300, 21300, 1);

-- --------------------------------------------------------

--
-- Table structure for table `platform_wallet`
--

CREATE TABLE `platform_wallet` (
  `id` int(11) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `platform_wallet`
--

INSERT INTO `platform_wallet` (`id`, `total_amount`, `last_updated`) VALUES
(1, 150900.00, '2025-07-28 13:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `items` text NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `request_status` varchar(30) NOT NULL DEFAULT 'Pending approval',
  `remarks` text NOT NULL,
  `quantity` varchar(11) NOT NULL,
  `amount` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`stock_id`, `image`, `product_name`, `price`, `stock`, `last_update`, `description`) VALUES
(1, 'install.jpg', 'Installation', 4500, 12, '2023-10-16 15:12:05', 'Installation Services'),
(2, 'install.jpg', 'Equipment Maintenace', 4500, 16, '2023-10-16 15:13:41', 'Maintenance'),
(3, 'install.jpg', 'Repair Services', 4500, 16, '2023-10-16 15:14:14', 'Repair Services');

-- --------------------------------------------------------

--
-- Table structure for table `service_payment`
--

CREATE TABLE `service_payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(15) NOT NULL,
  `mpesa_code` varchar(15) NOT NULL,
  `client_id` int(15) NOT NULL,
  `order_cost` int(11) NOT NULL,
  `delivery_cost` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `service_payment`
--

INSERT INTO `service_payment` (`payment_id`, `order_id`, `mpesa_code`, `client_id`, `order_cost`, `delivery_cost`, `total_cost`, `status`) VALUES
(1, 1, 'QRTYBB23TT', 2, 8000, 1, 8000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `image`, `product_name`, `price`, `stock`, `last_update`, `description`) VALUES
(1, 'smokehood.jpg', 'Smoke Hood', 7000, 33, '2023-11-05 16:08:19', 'Silver Coated Smoke extractor hood.'),
(2, 'Bain-Marie-3-1.jpg', '6 Pot Bain Marie', 25000, 30, '2023-10-23 05:13:15', '6 Pot Bain Marie, food warmer'),
(3, 'burnerfrier.jpg', 'Steel Burner with Double Frier', 185000, 12, '2023-10-23 05:06:47', 'Cookers that are combined are elegant and fit in small spaces this has all the combination for a start up\r\n-2burners\r\n-Frier double (best quality)\r\n-Of course an oven '),
(4, 'steelsink.jpg', 'Steel Sink', 4500, 26, '2023-10-23 05:06:51', 'Steel Sink\r\nDeep with drying rack'),
(7, 'Chacoal-grill-fiber-insulated.jpg', 'Chacoal-grill-fiber-insulated', 8000, 20, '2023-10-23 05:18:13', 'Chacoal-grill-fiber-insulated'),
(8, 'charcoal-oven-full-stainless-babacue-grill.jpg', 'charcoal oven full stainless barbecue grill', 76000, 10, '2023-10-23 05:19:26', 'charcoal-oven-full-stainless-babacue-grill'),
(9, 'Chips-warmer-with-inserts.jpg', 'Chips warmer with inserts', 4500, 30, '2023-10-23 05:20:29', 'Chips-warmer-with-insert\r\nPerfect display\r\nAntidust'),
(10, 'Tea-urn-commercial-100ltrs-300ltr2.jpg', 'Tea urn commercial  300ltr', 11000, 25, '2023-10-23 05:22:18', 'Tea-urn-commercial\r\ncapacity: 300 litres\r\nPerfect for institutions and events\r\n'),
(11, 'wood-chacoal-cooker1.jpg', 'wood charcoal cooker', 26000, 12, '2023-10-23 05:24:53', 'wood-charcoal-cooker\r\nCombined station\r\nWood Saver\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `stock_old`
--

CREATE TABLE `stock_old` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock_old`
--

INSERT INTO `stock_old` (`stock_id`, `image`, `product_name`, `price`, `stock`, `last_update`, `description`) VALUES
(1, '1606235323_6911.jpg', 'Onions 1 kg', 250, 822, '2022-03-18 23:11:03', 'best quality'),
(2, '1606235066_9235.jpg', 'Maize per bag', 1500, 165, '2022-03-15 22:44:06', 'best maize'),
(3, '1606235176_3722.jpg', 'Sukuma wiki per bag', 580, 989, '2022-03-18 23:11:03', 'best for all'),
(4, '1606235546_5496.jpg', 'rabbits ', 2500, 175, '2022-03-18 13:41:47', 'best item'),
(5, '1606236173_4002.jpg', 'milk 1 ltr', 100, 981, '2022-03-15 22:39:43', 'quality milk'),
(6, '1606236764_8439.jpg', 'cabbage per bag', 300, 1379, '2022-03-18 23:11:03', 'fresh cabbage'),
(7, '1647640148_7658.jpg', 'l;l;l', 9800, 0, '2022-03-18 21:49:08', 'ljlj');

-- --------------------------------------------------------

--
-- Table structure for table `supply_payment`
--

CREATE TABLE `supply_payment` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(25) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `payment_description` varchar(50) NOT NULL,
  `payment_status` varchar(25) NOT NULL DEFAULT 'unpaid',
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `quantity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `town_id` int(11) NOT NULL,
  `town_name` varchar(50) NOT NULL,
  `county_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`town_id`, `town_name`, `county_id`) VALUES
(1, 'Meru town', 1),
(2, 'Maua', 1),
(3, 'Kainjai', 1),
(4, 'Kiambu town', 2),
(5, 'Limuru', 2),
(6, 'Thika', 2),
(7, 'Kikuyu', 2),
(8, 'Old town', 3),
(9, 'Mambasa town', 3),
(10, 'Ngumbu', 1),
(11, 'Mikinduri', 1),
(14, 'Mathare', 1),
(15, 'Runogone', 1),
(16, 'Kaaga', 0),
(17, 'Kaaga', 1);

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `workshop_id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `workshop_desc` text NOT NULL,
  `workshop_date` varchar(40) NOT NULL,
  `venue` varchar(50) NOT NULL,
  `workshop_type` varchar(40) NOT NULL,
  `banner_img` varchar(50) NOT NULL,
  `workshop_status` varchar(50) NOT NULL DEFAULT 'Upcoming'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workshops`
--

INSERT INTO `workshops` (`workshop_id`, `mentor_id`, `title`, `workshop_desc`, `workshop_date`, `venue`, `workshop_type`, `banner_img`, `workshop_status`) VALUES
(1, 8, 'The Art of Self Expression', 'Encourage creativity and confidence in personal expressions', '30/6/2025', 'https://meet.google.com/xaw-nrmv-wbs', 'Virtual', 'IMG-20250619-WA0009.jpg', 'Upcoming'),
(2, 9, 'Embracing art', 'learning to understand and embrace art', '27/6/2025', 'https://meet.google.com/fsn-jvhc-mni', 'Virtual', 'fffa7d12c7ae9a8183e1bee75b09a9d7.jpg', 'Completed'),
(3, 9, 'Learn', 'Learning art', '07/27/2025', 'MPH', 'Physical', '45b378b5065421b7474a8cb0362f7e7f (1).jpg', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_registrations`
--

CREATE TABLE `workshop_registrations` (
  `id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_names` varchar(60) NOT NULL,
  `attendance_status` varchar(50) NOT NULL DEFAULT 'Pending approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workshop_registrations`
--

INSERT INTO `workshop_registrations` (`id`, `workshop_id`, `student_id`, `student_names`, `attendance_status`) VALUES
(1, 1, 10, 'Joy Wambui', 'Approved'),
(2, 2, 11, 'Martin kin', 'Approved'),
(3, 3, 11, 'Martin kin', 'Approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `art_work`
--
ALTER TABLE `art_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_code` (`client_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `client_code_2` (`client_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `location_id` (`county_id`),
  ADD KEY `ap_id` (`town_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`county_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ap_id` (`county_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `delivery_cost`
--
ALTER TABLE `delivery_cost`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `exhibitions`
--
ALTER TABLE `exhibitions`
  ADD PRIMARY KEY (`exhibition_id`);

--
-- Indexes for table `exhibition_artworks`
--
ALTER TABLE `exhibition_artworks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fb_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_code` (`client_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `client_code_2` (`client_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `location_id` (`county_id`),
  ADD KEY `ap_id` (`town_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `product_code` (`stock_id`),
  ADD KEY `order_code` (`order_id`),
  ADD KEY `order_code_2` (`order_id`),
  ADD KEY `order_code_3` (`order_id`),
  ADD KEY `product_id` (`stock_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `pro_id` (`stock_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_id_2` (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `platform_wallet`
--
ALTER TABLE `platform_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `service_payment`
--
ALTER TABLE `service_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_id_2` (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_old`
--
ALTER TABLE `stock_old`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `supply_payment`
--
ALTER TABLE `supply_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`town_id`),
  ADD KEY `county_id` (`county_id`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`workshop_id`);

--
-- Indexes for table `workshop_registrations`
--
ALTER TABLE `workshop_registrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `art_work`
--
ALTER TABLE `art_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assign`
--
ALTER TABLE `assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `counties`
--
ALTER TABLE `counties`
  MODIFY `county_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_cost`
--
ALTER TABLE `delivery_cost`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `exhibitions`
--
ALTER TABLE `exhibitions`
  MODIFY `exhibition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exhibition_artworks`
--
ALTER TABLE `exhibition_artworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `platform_wallet`
--
ALTER TABLE `platform_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_payment`
--
ALTER TABLE `service_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stock_old`
--
ALTER TABLE `stock_old`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supply_payment`
--
ALTER TABLE `supply_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `town_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `workshop_registrations`
--
ALTER TABLE `workshop_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`county_id`) REFERENCES `counties` (`county_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
