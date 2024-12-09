-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 10:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lpt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Laptop', 'images/icon-1.png'),
(2, 'Printer', 'images/icon-10.png'),
(3, 'Printer Parts', 'images/icon-11.jpg'),
(4, 'Ink', 'images/icon-14.jpg'),
(5, 'Office Supply', 'images/icon-13.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(31, 1, 'Carlos ', 'cmacaraeg.a12241760@umak.edu.ph', '09926822845', 'Hi\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `phone_number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Carlos ', '0992682284', 'cmacaraeg.a12241760@umak.edu.ph', 'cash on delivery', 'Pembo, Makati, NCR - 1215', 'MSI Katana 15 B12UDXK-1826PH (45999 x 1) - MSI Cyborg 15 A12UCX-1298PH (40995 x 1) - ', 86994, '2024-12-09', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cost` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sold` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `cost`, `price`, `qty`, `image`, `sold`, `description`, `Unit`, `image_02`, `image_03`) VALUES
(1, '92633774', 'Acer Nitro V 16 ANV16-41-R3RP', 66899, 68899, 83, '../uploads/6743dd6a6fe75.jpg', 17, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', '../uploads/675671234a1a3.jpg', '../uploads/675671234a3d2.jpg'),
(2, '85405219', 'MSI Katana 15 B12UDXK-1826PH', 44995, 45999, 65, '../uploads/6743dde7b8ab9.jpg', 4, '15.6? FHD 144Hz | i5-12450H | RTX 3050 | 8GB DDR5 | 512GB SSD', 'Laptop', '../uploads/67567179a1a9a.jpg', '../uploads/67567179a1cb0.jpg'),
(3, '38430424', 'MSI Cyborg 15 A12UCX-1298PH', 38995, 40995, 50, '../uploads/6743de32dcdd6.jpg', 0, '15.6? FHD 144Hz IPS Gaming Laptop | i5-12450H | RTX 2050 | 8GB RAM | 512GB SSD', 'Laptop', '../uploads/675671aa5d2f4.jpg', '../uploads/675671aa5d4f0.jpg'),
(4, '95914340', 'LENOVO LOQ 15IRX9 83DV00E8PH', 53195, 55195, 50, '../uploads/6743e084e9191.jpg', 1, '15.6? FHD 144Hz | i5-13450HX | RTX 4050 | 8GB DDR5 | 512GB SSD', 'Laptop', '../uploads/675671d2997f9.jpg', '../uploads/675671d299a78.jpg'),
(5, '44514099', 'ASUS TUF Gaming A16 Advantage', 65995, 64995, 58, '../uploads/6743e0cee1a69.jpg', 0, 'Edition FA617NS-N3086W [Sandstorm] 16? 165Hz FHD+| Ryzen 7 7735HS | RX 7600S | 8GB DDR5 | 512GB SSD', 'Laptop', '../uploads/67567216140a3.jpg', '../uploads/675672161432d.jpg'),
(6, '41743346', 'Acer Nitro V 15 ANV15-41-R2M0', 39995, 40995, 89, '../uploads/6743e118683fc.jpg', 0, '[Black] 15.6? IPS 144Hz | Ryzen 5 7535HS | RTX 2050 | 8GB DDR5 | 512 SSD', 'Laptop', '../uploads/6756725e73de0.jpg', '../uploads/6756725e74024.jpg'),
(7, '79564613', 'ASUS TUF Gaming A15 FA507NUR-LP051W', 59995, 59995, 99, '../uploads/6743e16fc149c.jpg', 0, '[Mecha Gray] 15.6? 144Hz | Ryzen 7 7435HS | RTX 4050 (194 AI TOPs) | 16GB DDR5 | 512GB SSD', 'Laptop', '../uploads/675672a91b5d0.jpg', '../uploads/675672a91b82e.jpg'),
(8, '25917313', 'imageCLASS MF469x ', 65098, 65098, 199, '../uploads/6743e33300912.png', 1, 'Print, Scan, Copy, Fax Print Speed (A4): Up to 40 ppm Scan Speed (2-Sided A4): Up to 100/80 ipm (mono/colour)', 'Printer', '../uploads/675672cdbdd57.png', '../uploads/675672cdbdf55.png'),
(9, '69624750', 'imageCLASS MF465dw', 54398, 55398, 199, '../uploads/6743e726cf0cf.png', 0, 'Print, Scan, Copy, Fax Print Speed (A4): Up to 40 ppm Scan Speed (2-Sided A4): Up to 100/80 ipm (mono/colour)', 'Printer', '../uploads/675672f22b5e9.png', '../uploads/675672f22b7e5.png'),
(10, '95815969', 'Canon PIXMA G2010', 7995, 8995, 296, '../uploads/6743e78104fda.png', 0, 'Print, Scan, Copy Print Speed (A4, ISO): up to 8.8 / 5 ipm (mono/colour) USB 2.0 Recommended Monthly Print Volume: 150 - 1500 pages', 'Printer', '../uploads/675673181cbf4.png', '../uploads/675673181ce3f.png'),
(11, '57399700', 'PIXMA G3780', 11995, 12995, 200, '../uploads/6743e801347f8.png', 0, 'Print, Scan, Copy Print Speed (A4, ISO): up to 11 / 6 ipm (mono/colour) Wi-Fi, AirPrint, Mopria, Direct Wireless', 'Printer', '../uploads/6756734653cbb.png', '../uploads/6756734653fa1.png'),
(12, '95821206', 'PIXMA G2730', 8395, 8495, 186, '../uploads/6743e82fd3ec4.png', 1, 'Print, Scan, Copy Print Speed (A4, ISO): up to 11 / 6 ipm (mono/colour) USB 2.0', 'Printer', '../uploads/67567371c2720.png', '../uploads/67567371c2928.png'),
(13, '99305599', 'imageCLASS MF461dw', 47098, 470995, 200, '../uploads/6743e86cd6d5a.png', 0, 'Print, Scan, Copy Print Speed (A4): Up to 36 ppm Scan Speed (2-Sided A4): Up to 100/80 ipm (mono/colour)', 'Printer', '../uploads/67567394310c2.png', '../uploads/67567394312bd.png'),
(14, '81504912', 'PIXMA G1730', 6000, 6000, 289, '../uploads/6743e8aeb9948.png', 0, 'Print Print Speed (A4, ISO): up to 11 / 6 ipm (mono/colour) USB 2.0', 'Printer', '../uploads/675673c5c87fa.png', '../uploads/675673c5c8a4a.png'),
(15, '04765872', 'Epson EcoTank L121', 8999, 9278, 53, '../uploads/6743e9269a0c7.jpg', 0, '?	Print speed of up to 9.0 ipm (black) and 4.8 ipm (colour)\r\n?	Ultra-high page yield of 4,500 pages (black) and 7,500 pages (colour)\r\n', 'Printer', '../uploads/675673fadde78.jpg', '../uploads/675673fade08f.jpg'),
(16, '12032109', 'Epson EcoTank L1210', 10995, 11000, 68, '../uploads/6743e99110ae0.jpg', 1, '?	Compact integrated tank design\r\n?	High yield ink bottles\r\n?	Ultra-high page yield of 4,500 pages (black) and 7,500 pages (colour)\r\n?	Borderless Printing (up to 4R)\r\n', 'Printer', '../uploads/6756741b26a6a.jpg', '../uploads/6756741b26ccf.jpg'),
(17, '14553554', 'Office Warehouse Premium Copy Paper 80gsm Letter 500s', 240, 240, 499, '../uploads/6743ea7cb9ab5.jpg', 1, 'Paper 80gsm Legal 500s', 'Office Supply', '../uploads/6756743b56c60.jpg', '../uploads/67567516cb983.jpg'),
(18, '67783280', 'Office Warehouse Premium Copy Paper 80gsm Legal 500s', 280, 280, 69, '../uploads/6743eaa6087f7.jpg', 0, 'Paper 80gsm Legal 500s', 'Office Supply', '../uploads/67567453e72d5.jpg', '../uploads/6756751f1320e.jpg'),
(19, '91706356', 'Office Warehouse Multi-Purpose Copy Paper 70gsm Letter 500s', 210, 220, 467, '../uploads/6743eb0ade506.jpg', 0, 'Paper 70gsm Letter 500s', 'Office Supply', '../uploads/6756746e6d650.jpg', '../uploads/675675299d2e1.jpg'),
(20, '72334083', 'Office Warehouse Multi-Purpose Copy Paper 70gsm Legal 500s', 245, 245, 487, '../uploads/6743eb3378811.jpg', 0, 'Paper 70gsm Legal 500s', 'Office Supply', '../uploads/67567489a26b7.jpg', '../uploads/6756753671cee.jpg'),
(21, '12742896', 'Office Warehouse Multi-Purpose Copy Paper 70gsm A4 500s', 210, 220, 500, '../uploads/6743eb566b031.jpg', 0, 'Paper 70gsm A4 500s', 'Office Supply', '../uploads/675674af40182.jpg', '../uploads/675675409a263.jpg'),
(22, '63171646', 'Office Warehouse Premium Copy Paper 80gsm A4 500s', 255, 255, 687, '../uploads/6743f997efc4a.jpg', 0, 'Paper 80gsm A4 500s', 'Office Supply', '../uploads/675674cdb183e.jpg', '../uploads/675675474f263.jpg'),
(23, '57000422', 'Heating Fuser Unit For Brother', 5554, 5554, 69, '../uploads/674423b4d0d4a.jpg', 0, 'MFC-9465CDN MFC-9460CDN MFC-9560CDW MFC-9970CDW 9560 9460 9465 9970 MFC-9460 Fuser', 'Printer Parts', '../uploads/6756756f72634.jpg', '../uploads/6756756f72841.jpg'),
(24, '52229708', 'ADF Unit Assembly for HP M527', 11848, 10848, 400, '../uploads/67442400dad76.jpg', 0, 'ADF whole unit replacement', 'Printer Parts', '../uploads/67567585cda1c.jpg', '../uploads/67567585cdc32.jpg'),
(25, '19506211', 'HP 680 Ink Cartridge', 540, 640, 600, '../uploads/6744243866b66.jpg', 0, 'F6V27AA Black', 'Ink', '../uploads/675675ae938f4.jpg', '../uploads/675675ae93b38.jpg'),
(26, '95061969', 'HP 704 Ink Cartridge', 568, 568, 574, '../uploads/6744246cd8988.jpg', 0, 'CN693 Tri-color', 'Ink', '../uploads/675675c4c0bd3.jpg', '../uploads/675675c4c0e4a.jpg'),
(27, '37285119', 'HP 682 Ink Cartridge', 564, 465, 500, '../uploads/6744249a82086.jpg', 0, '3YM77AA Black', 'Ink', '../uploads/675675e75de65.jpg', '../uploads/675675e75e0ba.jpg'),
(28, '53275809', 'IdeaPad Slim 5 (15&#039;&#039;, Gen 10)', 50350, 55350, 50, '../uploads/6751bf8cde5d6.jpg', 0, 'High-performance thin &amp; light AI laptop\r\n\r\nLong battery life + Rapid Charge\r\n\r\nBrilliant display up to 2.5k OLED', 'Laptop', '../uploads/6756766f3d787.jpg', '../uploads/6756766f3d973.jpg'),
(29, '24266483', 'IdeaPad Slim 5 (13&quot;, Gen 10)', 46086, 47000, 50, '../uploads/6751bf5155f49.jpg', 0, 'Sleek 13? laptop with AMD Ryzen™ processors\r\n\r\nFull high-definition display\r\n\r\nSmart Login feature &amp; long-lasting battery', 'Laptop', '../uploads/675676c713b6c.jpg', '../uploads/675676c713dab.jpg'),
(30, '55944706', 'IdeaPad 5x 2-in-1 Snapdragon X (14&#039;&#039;, Gen 9)', 55539, 55639, 50, '../uploads/6751c0173110a.jpg', 0, 'Powered by Snapdragon® X Plus platform\r\n\r\n14? 2-in-1 laptop with Copilot+ productivity\r\n\r\nOLED display, superior sound &amp; fast WiFi 7', 'Laptop', '../uploads/67567717dd227.jpg', '../uploads/67567717dd467.jpg'),
(31, '32149466', 'IdeaPad Slim 5x Snapdragon X (14&#039;&#039;, Gen 9)', 57634, 58000, 50, '../uploads/6751c088dc6ec.jpg', 0, 'Copilot+ PC on the Snapdragon® X Plus Platform\r\n\r\nVibrant 16:10 display and long battery life\r\n\r\nRugged and stylish with all-metal chassis', 'Laptop', '../uploads/67567740a5648.jpg', '../uploads/67567740a58b7.jpg'),
(32, '24609422', 'IdeaPad Slim 3i (14&#039;&#039;, Gen 9)', 37598, 38250, 50, '../uploads/6751c0e5c171f.jpg', 0, 'Slim, portable Intel® Core™-fueled laptop\r\n\r\n14? dynamic display, rich audio-visual quality\r\n\r\nAI-driven features for prolonged productivity', 'Laptop', '', ''),
(33, '48739574', 'Aspire 3 A315-44P-R9WX OPI', 36099, 36790, 50, '../uploads/6751c446d2c19.jpg', 0, 'Windows 11 Home\r\nAMD Ryzen™ 7 5700U\r\n16GB RAM\r\n512GB SSD\r\nFull HD 1920 x 1080\r\nAMD Radeon™ Graphics', 'Laptop', '', ''),
(34, '77846639', 'Aspire 3 A315-59-570Z OPI Pure Silver', 33999, 34000, 50, '../uploads/6751c487f204d.jpg', 0, 'Intel® Core™ i5-1235U processor\r\n8GB RAM\r\n512GB SSD\r\n15.6&quot; display with Full HD 1920 x 1080\r\nWindows 11 Home\r\nUltra-slim design\r\nMercury free, environment friendly', 'Laptop', '../uploads/67567774ccc89.jpg', '../uploads/67567774ccefd.jpg'),
(35, '89008616', 'Swift Go EVO SFG14-73-529P OPI Pure Silver', 48449, 49000, 48, '../uploads/6751c501ad186.jpg', 3, 'Intel® Core™ Ultra 5 processor 125H\r\n16GB RAM\r\n512GB SSD\r\n14.0&quot; display with OLED (Organic Light-Emitting Diode) technology\r\nIntel® ARC™ Graphics\r\nWindows 11 Home\r\nMicrosoft Office for Home and Student 2021\r\nSupports Fast Charging technology', 'Laptop', '../uploads/6756779f945de.jpg', '../uploads/6756779f9483e.jpg'),
(36, '17995970', 'Predator Helios Neo 16 PHN16-72-75Z0 OPI Black', 99749, 100000, 20, '../uploads/6751c54731700.jpg', 0, 'Intel® Core™ i7-14700HX processor\r\n16GB RAM\r\n512GB SSD\r\n16.0&quot; display\r\nNVIDIA® GeForce RTX™ 4060\r\nFineTip RGB-backlight keyboard\r\nWindows 11 Home', 'Laptop', '../uploads/675677b8a2ae3.jpg', '../uploads/675677b8a2d46.jpg'),
(37, '16043722', 'Nitro V ANV15-41-R2M0 OPI Obsidian Black', 43699, 44000, 50, '../uploads/6751c629c8572.jpg', 0, 'AMD Ryzen™ 5 7535HS\r\n8 GB RAM\r\n512GB SSD\r\n15.6&quot; display with IPS Full HD 1920 x 1080\r\nNVIDIA® GeForce RTX™ 2050\r\nMicrosoft Office 2021 Home and Student\r\nWindows 11 Home', 'Laptop', '../uploads/675677dba0f55.jpg', '../uploads/675677dba11a5.jpg'),
(38, '98741869', 'Nitro V ANV15-51-519K OPI Obsidian Black', 50349, 50958, 50, '../uploads/6751c6a06abe7.jpg', 0, 'Intel® Core™ i5-13420H\r\n8GB RAM\r\n512G SSD\r\nNVIDIA® GeForce RTX™ 2050\r\n15.6&quot; display with IPS\r\nWindows 11 Home', 'Laptop', '../uploads/6756780ece494.jpg', '../uploads/6756780ece714.jpg'),
(39, '01466023', 'Asus TUF Gaming F15 FX506HC-HN083W', 44999, 45859, 50, '../uploads/6751caeee688c.jpg', 0, '15.6&quot; FHD | i5-11400H | GeForce RTX 3050 | 8GB RAM | 512GB SSD | WIN 11', 'Laptop', '../uploads/6751caeee6e74.jpg', '../uploads/6751cbbad00ed.jpg'),
(40, '35061195', 'Asus TUF Gaming A15 FA506NFR-HN005W', 44299, 45000, 50, '../uploads/6751cea183170.jpg', 0, '15.6&quot; FHD | Ryzen 7 7435HS | GeForce RTX 2050 | 8GB RAM | 512GB SSD | WIN 11', 'Laptop', '../uploads/67567830da61f.jpg', '../uploads/67567830da99d.jpg'),
(41, '51523911', 'PIXMA G4780', 14595, 15000, 100, '../uploads/6751cf857911c.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 11 / 6 ipm (mono/colour)\r\nWi-Fi, AirPrint®, Mopria® Print Service, Direct Wireless', 'Printer', '../uploads/6751cfa578076.png', '../uploads/6751cfa578478.png'),
(42, '42310081', 'PIXMA G3770', 10595, 11000, 100, '../uploads/6751d11e589a6.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 11 / 6 ipm (mono/colour)\r\nWi-Fi, AirPrint®, Mopria® Print Service, Direct Wireless', 'Printer', '../uploads/6751d14d6f495.png', '../uploads/6751d14d6f7ec.png'),
(43, '96667345', 'PIXMA G3730', 9995, 10525, 100, '../uploads/6751d255a5cca.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 11 / 6 ipm (mono/colour)\r\nWi-Fi, AirPrint®, Mopria® Print Service, Direct Wireless\r\nRecommended Monthly Print Volume: 150 - 1,500 pages', 'Printer', '../uploads/6751d273ae008.png', '../uploads/6751d273ae2c9.png'),
(44, '51846703', 'PIXMA G4770', 13495, 14000, 100, '../uploads/6751d40e22e55.png', 0, 'Print, Scan, Copy, Fax\r\nPrint Speed (A4, ISO): up to 11 / 6 ipm (mono/colour)\r\nWi-Fi, AirPrint® , Mopria® Print Service, Direct Wireless', 'Printer', '../uploads/6751d4353eaf5.png', '../uploads/6751d4353ed82.png'),
(45, '15908728', 'MAXIFY GX4070', 31995, 32585, 100, '../uploads/6751d5ce0a441.png', 0, 'Print, Scan, Copy, Fax\r\nPrint Speed (A4, ISO): up to 18 / 13 ipm (mono/colour)\r\nWi-Fi, LAN, AirPrint®, Mopria® Print Service, Direct Wireless\r\nRecommended Monthly Print Volume: 300 – 2,500 pages', 'Printer', '../uploads/6751d60aed2ae.png', '../uploads/6751d60aed58a.png'),
(46, '97717961', 'MAXIFY GX3070', 24995, 25000, 100, '../uploads/6751d6777e366.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 18 / 13 ipm (mono/colour)\r\nWi-Fi, AirPrint®, Mopria® Print Service, Direct Wireless', 'Printer', '../uploads/6751d683963a9.png', '../uploads/6751d683966dc.png'),
(47, '43928546', 'imageCLASS LBP456w', 63698, 64000, 100, '../uploads/6751d70f8df8c.png', 0, 'Print\r\nPrint Speed (A4): Up to 30 ppm\r\nPrint Resolution: 1,200 x 1,200 dpi (equivalent)', 'Printer', '../uploads/6751d71bb1b0e.png', '../uploads/6751d71bb1ffc.png'),
(48, '18724050', 'imageCLASS LBP248x', 32098, 33000, 100, '../uploads/6751d7fc9a02b.png', 0, 'Print Speed (A4): Up to 40 ppm\r\nFirst Print Out Time (A4): Approx. 5.0 sec\r\nPrint Resolution: Up to 1,200 x 1,200 dpi (equivalent)', 'Printer', '../uploads/6751d80a1a5e1.png', '../uploads/6751d80a1acc6.png'),
(49, '03485977', 'imageCLASS MF274dn', 25398, 25689, 100, '../uploads/6751d86327f25.png', 0, 'Print, Scan, Copy, Fax\r\nPrint Speed (A4): Up to 29 ppm\r\nFirst Print Out Time (A4): Approx. 5.4 sec', 'Printer', '../uploads/6751d86ee4d25.png', '../uploads/6751d86ee5210.png'),
(50, '66753976', 'imageCLASS MF272dw', 23598, 24000, 100, '../uploads/6751d8bd42be9.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4): Up to 29 ppm\r\nFirst Print Out Time (A4): Approx. 5.4 sec\r\nPrint resolution: Up to 2,400 (equivalent) x 600 dpi\r\nRecommended Monthly Print Volume: 150 – 2,000 pages', 'Printer', '../uploads/6751d8c95a0b8.png', '../uploads/6751d8c95a51e.png'),
(51, '94942755', 'imageCLASS MF271dn', 21598, 22000, 100, '../uploads/6751d91434f7c.png', 0, 'Print, Scan, Copy\r\nPrint Speed (A4): Up to 29 ppm\r\nFirst Print Out Time (A4): Approx. 5.4 sec\r\nPrint resolution: Up to 2,400 (equivalent) x 600 dpi\r\nRecommended Monthly Print Volume: 150 – 2,000 pages', 'Printer', '../uploads/6751d91f29afa.png', '../uploads/6751d91f29f80.png'),
(52, '24690595', '3M Scotch Transparent Tape 500 Yellow 12mmx50m', 55, 60, 200, '../uploads/6751daad98676.jpg', 0, 'Size: 12mm x 50m\r\nColor: Transparent Yellow\r\nPackaging Size: 1 roll per pack', 'Office Supply', '../uploads/6756786f40ee3.jpg', '../uploads/6756786f410d8.jpg'),
(53, '89763395', '3M Scotch Transparent Tape 500 Yellow 18mmx50m ', 75, 85, 200, '../uploads/6751db079227a.jpg', 0, 'Size: 18mm x 50m\r\nColor: Transparent Yellow\r\nPackaging Size: 1 roll per pack', 'Office Supply', '../uploads/67567889c170b.jpg', '../uploads/67567889c196f.jpg'),
(54, '19089503', '3M Tartan Masking Tape Cream 36mmx20m', 154, 165, 200, '../uploads/6751dbea9134b.jpg', 0, 'General Purpose Masking Tape for non-critical painting and utility applications\r\nSize: 36mm x 20m\r\nColor: Cream/Beige\r\nPackaging Size: 1 roll', 'Office Supply', '../uploads/675678b1ebbb0.jpg', '../uploads/675678b1ebde2.jpg'),
(55, '30274375', 'Brite Gun Tacker Staple Wire T-30 6mm 2000/box', 53, 60, 300, '../uploads/6751dc6fdf726.jpg', 0, 'For use on T-30 Gun Tacker\r\nHeavy-duty\r\nIdeal for chipboard and softwood\r\nSize: 6mm (1/4&quot;)\r\nPackaging Size: 2,000 pcs per box', 'Office Supply', '../uploads/675678dd650da.jpg', '../uploads/675678dd6531f.jpg'),
(56, '64275043', 'Brite Gun Tacker Staple Wire T-50 12mm 1000/box', 52, 60, 300, '../uploads/6751dcb486ef3.jpg', 0, 'For use on T-50 Gun Tacker\r\nHeavy-duty\r\nIdeal for chipboard and softwood\r\nSize: 12mm (1/2&quot;)\r\nPackaging Size: 1,000 pcs per box\r\n ', 'Office Supply', '../uploads/default_image_02.jpg', '../uploads/default_image_03.jpg'),
(57, '27716004', 'Century Folder Pressboard US Maroon Legal', 26, 30, 500, '../uploads/6751dcf75a3b8.jpg', 0, 'Size: Legal\r\nColor: Maroon\r\nPackaging size: 1 pc ', 'Office Supply', '../uploads/675678f3f0beb.jpg', '../uploads/675678f3f0ded.jpg'),
(58, '06992999', 'Century Pressboard Folder US Blue Legal', 26, 30, 500, '../uploads/6751dd1d899df.jpg', 0, 'Size: Legal\r\nColor: Blue\r\nPackaging size: 1 pc', 'Office Supply', '../uploads/67567904d6d9d.jpg', '../uploads/67567904d6fe6.jpg'),
(59, '37910187', 'Century Pressboard Folder US Green Legal', 26, 30, 500, '../uploads/6751dd4dd453d.jpg', 0, 'Size: Legal\r\nColor: Green\r\nPackaging size: 1 pc', 'Office Supply', '../uploads/67567915dc84d.jpg', '../uploads/67567915dcaac.jpg'),
(60, '41978990', 'Century Pressboard Folder US Green Letter', 26, 30, 500, '../uploads/6751dd6d4a4d0.jpg', 0, 'Size: Letter\r\nColor: Green\r\nPackaging size: 1 pc', 'Office Supply', '../uploads/6756792617388.jpg', '../uploads/67567926175dd.jpg'),
(61, '99854230', ' Century Pressboard Folder US Pink Legal Century Pressboard Folder US Pink Legal', 26, 30, 500, '../uploads/6751ddb288e27.jpg', 0, 'Size: Legal\r\nColor: Pink\r\nPackaging size: 1 pc', 'Office Supply', '../uploads/67567934b93fb.jpg', '../uploads/67567934b964f.jpg'),
(62, '29238402', 'Century Pressboard Folder US Yellow Legal', 26, 30, 500, '../uploads/6751ddd8c402d.jpg', 0, 'Size: Legal\r\nColor: Yellow\r\nPackaging size: 1 pc', 'Office Supply', '../uploads/6756794d47bb4.jpg', '../uploads/6756794d47dbd.jpg'),
(63, '26855713', 'Click Catalog Envelope w/String Kraft 9 x 12&quot;', 10, 12, 500, '../uploads/6751de34abb64.jpg', 0, 'Size: 9 x 12 inches\r\nWith String\r\nColor: Kraft\r\nPackaging Size: 1 pc', 'Office Supply', '../uploads/67567970cee36.jpg', '../uploads/67567970cf045.jpg'),
(64, '84260028', ' Click Folder 15PTS Glossy White 5s Legal Click Folder 15PTS Glossy White 5s Legal', 38, 45, 500, '../uploads/6751de92df11b.jpg', 0, 'Size: Legal\r\nColor: Glossy White\r\nAttr: 15PTS\r\nPackaging Size: 5 pcs per pack', 'Office Supply', '../uploads/6756798900cb0.jpg', '../uploads/6756798900f00.jpg'),
(65, '83839443', 'HBW 2000 Ballpen 0.5mm Blue', 6, 8, 600, '../uploads/6751decc5e391.jpg', 0, 'Perfectly balance designed high quality ballpoint pen\r\nSmooth writing with super fine point best for school &amp; office use\r\nModel: HBW 2000\r\nPen Tip Size: 0.5 mm\r\nColor: Blue', 'Office Supply', '../uploads/675679bf5e110.jpg', '../uploads/675679bf5e31d.jpg'),
(66, '31117567', ' Eagle Alpha Staple Remover R5026B Eagle Alpha Staple Remover R5026B', 29, 32, 200, '../uploads/6751df46ec63c.jpg', 0, 'Classic plastic staple remover\r\nHandy grip surface\r\nMetal jaws and coated finish\r\nRemoves all standard size staples\r\nGrip lock switch for easy storage\r\nModel: R5026B\r\nColor: Assorted Colors', 'Office Supply', '../uploads/675679d459ad2.jpg', '../uploads/675679d459d61.jpg'),
(67, '00372796', 'FUSER FILM SLEEVE', 754, 800, 50, '../uploads/6751e346074ee.jpg', 0, ' FOR 4250', 'Printer Parts', '../uploads/675679e5aade2.jpg', '../uploads/675679e5ab083.jpg'),
(68, '21885704', 'FUSER FILM ASSEMBLY', 850, 900, 30, '../uploads/6751e5ab8148d.jpg', 0, '(220V)\r\nUSE FOR 602', 'Printer Parts', '../uploads/675679f93bf53.jpg', '../uploads/675679f93c1d9.jpg'),
(69, '03905433', 'RUBBER FUSER FILM ', 1299, 1300, 80, '../uploads/6751e605a05ba.jpg', 0, 'USE FOR 602 220V\r\n', 'Printer Parts', '../uploads/67567a1802627.jpg', '../uploads/67567a1802811.jpg'),
(70, '53940699', 'FUSER ASSEMBLY/UNIT ', 1500, 1550, 10, '../uploads/6751e6872734e.jpg', 0, '(220V) USE FOR 602', 'Printer Parts', '../uploads/67567a34c73f7.jpg', '../uploads/67567a34c75eb.jpg'),
(71, '02492808', 'PAPER PICKUP ASSEMBLY', 1759, 1800, 20, '../uploads/6751e7663062d.jpg', 0, 'USE FOR MF244DW', 'Printer Parts', '../uploads/67567a43b800a.jpg', '../uploads/67567a43b822f.jpg'),
(72, '29002039', 'PICK UP ROLLER RUBER PAGER ', 300, 350, 200, '../uploads/6751e802592e4.jpg', 0, 'FOR HP 4250', 'Printer Parts', '../uploads/67567a5533793.jpg', '../uploads/67567a55339b5.jpg'),
(73, '20333151', 'EPSON INK 003 BLACK', 275, 285, 1000, '../uploads/6751e9aa01976.jpg', 0, '(PREMIUM INK) -SUNNY', 'Ink', '../uploads/67567a9782718.jpg', '../uploads/67567a97829d0.jpg'),
(74, '37018139', 'EPSON INK 003 CYAN', 285, 295, 1000, '../uploads/6751ea1aa4c15.jpg', 0, '(PREMIUM INK) -SUNNY', 'Ink', '../uploads/67567a7a9a510.jpg', '../uploads/67567a7a9a774.jpg'),
(75, '26944448', 'EPSON INK 003 MAGENTA', 285, 295, 1000, '../uploads/6751ea962e0aa.jpg', 0, '(PREMIUM INK) -SUNNY', 'Ink', '../uploads/67567af425143.jpg', '../uploads/67567af42538e.jpg'),
(76, '79897762', 'EPSON INK 003 YELLOW ', 285, 295, 1000, '../uploads/6751eada17814.jpg', 0, '(PREMIUM INK) -SUNNY', 'Ink', '../uploads/67567b15773d9.jpg', '../uploads/67567b15775d6.jpg'),
(77, '64834743', 'GT53 BLACK', 290, 310, 500, '../uploads/6751eb3bacf57.jpg', 0, 'Page yield (colour): 5,000 pages\r\nCartridge color: Black\r\nReplacement model of GT51 Ink Bottle\r\nCompatible with: HP DeskJet GT 5810 and 5820 All-in-One Printers, HP Ink Tank 310 series, HP Ink Tank Wireless 410 series, HP Smart Tank 350 series, HP Smart Tank Wireless 450 series, HP Smart Tank 510 series, HP Smart Tank Plus 550 series, HP Smart Tank Plus 610 series', 'Ink', '../uploads/67567b3ab23ba.jpg', '../uploads/67567b3ab2615.jpg'),
(78, '70082804', 'GT52 CYAN', 290, 310, 500, '../uploads/6751eba3672cb.jpg', 0, 'Page yield (colour): ~8,000 pages\r\nCartridge color: Cyan\r\nSupply type: Cartridge\r\nCompatible with: HP DeskJet GT 5810 and 5820 All-in-One Printers, HP Ink Tank 310 series, HP Ink Tank Wireless 410 series, HP Smart Tank 350 series, HP Smart Tank Wireless 450 series, HP Smart Tank 510 series, HP Smart Tank Plus 550 series, HP Smart Tank Plus 610 series', 'Ink', '../uploads/67567b590f0bc.jpg', '../uploads/67567b590f2fb.jpg'),
(79, '68857644', 'GT52 YELLOW', 290, 310, 500, '../uploads/6751ebe0e434a.jpg', 0, 'Page yield (colour): ~8,000 pages\r\nCartridge color: Yellow\r\nSupply type: Cartridge\r\nCompatible with: HP DeskJet GT 5810 and 5820 All-in-One Printers, HP Ink Tank 310 series, HP Ink Tank Wireless 410 series, HP Smart Tank 350 series, HP Smart Tank Wireless 450 series, HP Smart Tank 510 series, HP Smart Tank Plus 550 series, HP Smart Tank Plus 610 series', 'Ink', '../uploads/67567b73a9e7c.jpg', '../uploads/67567b73aa102.jpg'),
(80, '59997385', 'GT52 MAGENTA', 290, 310, 500, '../uploads/6751ec1ff1e21.jpg', 0, 'Page yield (colour): ~8,000 pages\r\nCartridge color: Magenta\r\nSupply type: Cartridge\r\nCompatible with: HP DeskJet GT 5810 and 5820 All-in-One Printers, HP Ink Tank 310 series, HP Ink Tank Wireless 410 series, HP Smart Tank 350 series, HP Smart Tank Wireless 450 series, HP Smart Tank 510 series, HP Smart Tank Plus 550 series, HP Smart Tank Plus 610 series', 'Ink', '../uploads/67567b9258659.jpg', '../uploads/67567b92588c0.jpg'),
(81, '92621112', 'Brother BT5000C Ink Bottle Cyan', 390, 410, 200, '../uploads/6751ed0b9e120.jpg', 0, 'Ink Colour: Cyan\r\nPage Yield : Approx.6,000 pages (BK) / 5,000 pages (CMY)\r\nWorks With : Brother Ink BT5000, BT6000 for Brother DCP-T300, T500W,T700W,MFC-T800W', 'Ink', '../uploads/67567c10b3b9b.jpg', '../uploads/67567c10b3da9.jpg'),
(82, '26760841', 'Brother BT5000M Ink Bottle Magenta', 390, 410, 200, '../uploads/6751ed2ef0fbe.jpg', 0, 'Ink Colour: Magenta\r\nPage Yield : Approx.6,000 pages (BK) / 5,000 pages (CMY)\r\nWorks With : Brother Ink BT5000, BT6000 for Brother DCP-T300, T500W,T700W,MFC-T800W', 'Ink', '../uploads/67567c2574f75.jpg', '../uploads/67567c25751f9.jpg'),
(83, '62776774', 'Brother BT5000Y Ink Bottle Yellow', 390, 410, 200, '../uploads/6751ed520d04d.jpg', 0, 'Ink Colour: Yellow\r\nPage Yield : Approx.6,000 pages (BK) / 5,000 pages (CMY)\r\nWorks With : Brother Ink BT5000, BT6000 for Brother DCP-T300, T500W,T700W,MFC-T800W\r\n\r\n', 'Ink', '../uploads/67567c3bb5a48.jpg', '../uploads/67567c3bb5ce9.jpg'),
(84, '54587115', 'BTD60BK Ink Bottle Black', 390, 410, 200, '../uploads/6751ed7e3e51a.jpg', 0, 'Model: BTD60BK\r\nInk Color: Black\r\nPage Yield : Approx. 7,500 pages\r\nCompatible with: Brother DCPT420W / DCPT520W / DCPT620W / DCPT720DW / DCPT820DW / MFCT920DW / DCPT510W / DCPT710W / MFCT810W / MFCT910DW', 'Ink', '../uploads/67567c4cd4a05.jpg', '../uploads/67567c4cd4c5b.jpg'),
(85, '70070028', 'Canon CL-57 Ink Cartridge Colored Canon', 945, 1000, 200, '../uploads/6751edf6a7e92.jpg', 0, 'Ink Type: Color \r\nModel: CL-57\r\nPage Yield: 180 pages\r\nCompatible with: Canon Printer E400, E410, E417, E460, E470, E477, E480, E4270', 'Ink', '../uploads/67567c6a6f9cb.jpg', '../uploads/67567c6a6fbd4.jpg'),
(86, '87632772', 'Canon CL-746 Color Ink Cartridge', 1290, 1300, 200, '../uploads/6751ee244fef5.jpg', 0, 'Fine Ink Cartridge at 9ml capacity, Ink for Pixma Model Printers\r\nPhotos are rich in detail. Print all the detail with a genuine Canon PG-745 Black Inkjet Cartridge.\r\nInk Type: Colored\r\nProduct Type: Ink Cartridge\r\nModel: CL-746\r\nCompatible with: Canon Printer MG2470 / MG2570 / MG2970 / iP2870 / MG3077 / MG3070\r\n ', 'Ink', '../uploads/67567c7f12da8.jpg', '../uploads/67567c7f1304a.jpg'),
(87, '21008958', 'Canon PG-47 Ink Cartridge Black', 485, 495, 200, '../uploads/6751ee5a802b5.jpg', 0, 'Ink Type: Black\r\nModel: PG-47\r\nPage Yield: 400 pages\r\nCompatible with: Canon Printer E400, E410, E417, E460, E470, E477, E480, E4270', 'Ink', '../uploads/67567c9599ef4.jpg', '../uploads/67567c959a13d.jpg'),
(88, '87933043', 'Epson 008 Ink Bottle C13T06G100 Black', 900, 950, 200, '../uploads/6751eea3c48af.jpg', 0, 'Ink Model: 008\r\nInk Color: Black\r\nPage Yield: 7,500 pages\r\nCompatible with: Epson Eco Tank Printers L15180, L15150, L15160, L6580, L6550, L6460, L6490, M15180', 'Ink', '../uploads/67567cb3a84a3.jpg', '../uploads/67567cb3a86a5.jpg'),
(89, '69833412', 'FUSER ASSEMBLY ', 3869, 4000, 15, '../uploads/67553113839cf.jpg', 0, 'FOR 4250', 'Printer Parts', '../uploads/67567ccb32dee.jpg', '../uploads/67567ccb330ca.jpg'),
(90, '15967617', '   Original Fuser Unit for HP Color LaserJet Pro', 9400, 9500, 10, '../uploads/6755b1c384f64.jpg', 0, ' M751 E75245 3WT88A 3WT88MC', 'Printer Parts', '../uploads/67567ce76c9a2.jpg', '../uploads/67567ce76cba9.jpg'),
(91, '34186294', 'Genuine Fuser Unit for HP Laserjet Enterprise', 11279, 11459, 10, '../uploads/6755de3be004d.jpg', 0, 'Mfp M776 M852 M856 776 852 856 Fuser Kit 4yl17mc Fuser Assembly 220V', 'Printer Parts', '../uploads/67567cfb2189f.jpg', '../uploads/67567cfb21ad1.jpg'),
(92, '38028128', 'XP600 Printhead Original DTF', 7236, 7500, 10, '../uploads/6755e0c1edad6.jpg', 0, 'print head XP600 Print Head for XP600 Eco Solvent Printer', 'Printer Parts', '../uploads/67567d0f6b9a1.jpg', '../uploads/67567d0f6bc0b.jpg'),
(93, '55756418', 'Presssure Roller', 136, 150, 50, '../uploads/6755e1c606d75.jpg', 0, 'Lower Roller HP LaserJet 1020/LBP2900/1010/1015', 'Printer Parts', '../uploads/67567d215a396.jpg', '../uploads/67567d215a5b3.jpg'),
(94, '43866769', 'Laser Scanner Unit LSU For HP Laser Jet', 376, 400, 50, '../uploads/6755e28dd34cd.jpg', 0, 'P1606DN MF 4750 MF 244Dw RM1 7489 ', 'Printer Parts', '../uploads/67567d347bd0a.jpg', '../uploads/67567d347bf81.jpg'),
(95, '78200259', 'CANON 244 CLUTCH DRIVE ', 60, 80, 100, '../uploads/6755e390cc8b0.jpg', 0, 'COMPATIBLE MODEL HP LASERJET P1566 P1606DN M1536DNF 1606DN', 'Printer Parts', '../uploads/67567d5731f36.jpg', '../uploads/67567d57321ca.jpg'),
(96, '31715224', 'Leaf Sensor/  Detector Sensor', 50, 60, 50, '../uploads/6755e428102f1.jpg', 0, 'For Epson LX-310/ Lq-310/ FX890ii', 'Printer Parts', '../uploads/67567dccebeea.jpg', '../uploads/67567dccec117.jpg'),
(97, '31224039', 'Fuser Assembly Exit Roller', 259, 300, 30, '../uploads/6755e4bf58769.jpg', 0, 'For HP LASERJET 244/1606', 'Printer Parts', '../uploads/67567ddfbe782.jpg', '../uploads/67567ddfbe992.jpg'),
(98, '62450507', 'Paper Feed Clutch Electric ', 800, 920, 18, '../uploads/6755e55f21b1f.jpg', 2, 'For Samsung 2200 436', 'Printer Parts', '../uploads/67567dfb88dd7.jpg', '../uploads/67567dfb88fe6.jpg'),
(99, '28139394', 'Schneider Slider Basic Ballpoint Pen XB #151201 Black', 39, 42, 120, '../uploads/6755e608470aa.jpg', 0, 'Extra Broad line width (XB)\r\nQuick-drying and smudge-proof ink\r\nWaterproof according to ink standard ISO 12757-2.\r\nRubberised grip zone for a secure hold and relaxed writing\r\nWear-resistant stainless steel tip\r\nCO2 neutral product\r\nModel: Slider Basic 151294\r\nLine Width: Extra Broad / 1.4mm\r\nInk Color: Black\r\n', 'Office Supply', '../uploads/67567e409001c.jpg', '../uploads/67567e4090235.jpg'),
(100, '99968260', 'Schneider Slider Basic Ballpoint Pen XB #151202 Red', 39, 42, 120, '../uploads/6755e62f22cf0.jpg', 0, 'Extra Broad line width (XB)\r\nQuick-drying and smudge-proof ink\r\nWaterproof according to ink standard ISO 12757-2.\r\nRubberised grip zone for a secure hold and relaxed writing\r\nWear-resistant stainless steel tip\r\nCO2 neutral product\r\nModel: Slider Basic 151294\r\nLine Width: Extra Broad / 1.4mm\r\nInk Color: Red', 'Office Supply', '../uploads/67567e5d77af8.jpg', '../uploads/67567e5d77ca6.jpg'),
(101, '52985830', 'Schneider Slider Basic Ballpoint Pen XB #151203 Blue', 39, 42, 120, '../uploads/6755e651013b5.jpg', 0, 'Extra Broad line width (XB)\r\nQuick-drying and smudge-proof ink\r\nWaterproof according to ink standard ISO 12757-2.\r\nRubberised grip zone for a secure hold and relaxed writing\r\nWear-resistant stainless steel tip\r\nCO2 neutral product\r\nModel: Slider Basic 151294\r\nLine Width: Extra Broad / 1.4mm\r\nInk Color: Blue', 'Office Supply', '../uploads/67567e6e4837f.jpg', '../uploads/67567e6e4851d.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rate_limit`
--

CREATE TABLE `rate_limit` (
  `ip` varchar(45) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice`, `name`, `address`, `amount`, `date`) VALUES
(1, 'RS-3522603', 'CARREON,JOHN CHRISTIAN C.', '138 A 8th avenue', 4990.00, '2024-11-28'),
(2, 'RS-32533', 'jc', '138 A 8th avenue', 2695.00, '2024-11-28'),
(3, 'RS-3837335', 'gaming chair', 'dfsdfsdf', 102058.00, '2024-11-28'),
(4, 'RS-7032623', 'gaming chair', 'dfsdfsdf', 166194.00, '2024-11-28'),
(5, 'RS-332220', 'cashier', 'sdf', 2272.00, '2024-11-29'),
(6, 'RS-39020233', 'gaming chair', 'dfsdfsdf', 119970.00, '2024-11-29'),
(7, 'RS-3933323', 'jc', '138 A 8th avenue', 18556.00, '2024-11-29'),
(8, 'RS-02392520', 'jc', '138 A 8th avenue', 220.00, '2024-11-29'),
(9, 'RS-2222800', 'jc', '138 A 8th avenue', 0.00, '2024-11-29'),
(10, 'RS-2233233', 'jc', '138 A 8th avenue', 129990.00, '2024-11-29'),
(11, 'RS-000222', 'gaming chair', 'west', 280.00, '2024-11-29'),
(12, 'RS-0202236', 'gaming chair', 'west', 59995.00, '2024-11-29'),
(13, '0', 'gaming chair', 'west', 0.00, '2024-11-29'),
(14, '0', 'Shane lee', 'west', 0.00, '2024-11-29'),
(15, 'RS-8233222', 'jc', '138 A 8th avenue', 40995.00, '2024-11-29'),
(16, 'RS-2223983', 'gaming chair', 'dfsdfsdf', 11000.00, '2024-11-29'),
(17, 'RS-0235700', 'jc', '138 A 8th avenue', 9278.00, '2024-11-30'),
(18, 'RS-020033', 'jc', '138 A 8th avenue', 8495.00, '2024-11-30'),
(19, 'RS-43056508', 'jc', '138 A 8th avenue', 10848.00, '2024-11-30'),
(0, 'RS-003323', 'RACQUEL INGUENGAN', 'fbdfdfg', 55185.00, '2024-12-06'),
(0, 'RS-0205230', 'RACQUEL INGUENGAN', 'fbdfdfg', 68889.00, '2024-12-06'),
(0, 'RS-3223222', 'jc', '135', 68899.00, '2024-12-06'),
(0, 'RS-5229286', 'dfsfsdfd', 'dffs', 68899.00, '2024-12-06'),
(0, '0', 'dfsfsdfd', 'dffs', 0.00, '2024-12-06'),
(0, '0', 'dfsfsdfd', 'dffs', 0.00, '2024-12-06'),
(0, '0', 'dfsfsdfd', 'dffs', 0.00, '2024-12-06'),
(0, '0', 'dfsfsdfd', 'dffs', 0.00, '2024-12-06'),
(0, 'RS-2225222', 'dfsfsdfd', 'dffs', 0.00, '2024-12-06'),
(0, 'RS-022322', 'dfsfsdfd', 'dffs', 11000.00, '2024-12-06'),
(0, 'RS-506078', 'dfsfsdfd', 'dffs', 68899.00, '2024-12-06'),
(0, 'RS-2228095', 'ssgf', 'fsdf', 240.00, '2024-12-06'),
(0, 'RS-2228095', 'ssgf', 'fsdf', 240.00, '2024-12-06'),
(0, 'RS-2228095', 'ssgf', 'fsdf', 240.00, '2024-12-06'),
(0, 'RS-2228095', 'ssgf', 'fsdf', 240.00, '2024-12-06'),
(0, 'RS-2228095', 'ssgf', 'fsdf', 240.00, '2024-12-06'),
(0, 'RS-333032', 'dsf', 'sdf', 68899.00, '2024-12-06'),
(0, 'RS-033329', 'fsdf', 'sdfsdf', 65098.00, '2024-12-06'),
(0, 'RS-222543', 'RACQUEL INGUENGAN', 'fbdfdfg', 68899.00, '2024-12-07'),
(0, 'RS-932302', 'Ced', 'hhsfh', 68899.00, '2024-12-08'),
(0, 'RS-3033220', 'los', '548d48as4d8', 139638.00, '2024-12-09'),
(0, 'RS-3307', 'los', '548d48as4d8', 137798.00, '2024-12-09'),
(0, 'RS-222323', 'carlos', '#09 Blueridge', 137798.00, '2024-12-09'),
(0, 'RS-3320222', 'carlos', '09 Blueridge', 98000.00, '2024-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`id`, `invoice`, `code`, `qty`, `amount`, `name`, `price`, `description`, `unit`, `discount`) VALUES
(1, 'RS-237204', '', 1, 8000, 'Canon PIXMA G2010', 8000, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 8.8 / 5 ipm (mono/colour)\r\nUSB 2.0\r\nRecommended Monthly Print Volume: 150 - 1500 pages', 'Printer', 0.00),
(2, 'RS-8293033', '', 1, 8000, 'Canon PIXMA G2010', 8000, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 8.8 / 5 ipm (mono/colour)\r\nUSB 2.0\r\nRecommended Monthly Print Volume: 150 - 1500 pages', 'Printer', 0.00),
(3, 'RS-263233', '', 1, 42, 'Eagle Alpha Pocket Stapler S5027B', 42, 'Mini-size plastic stapler with soft grip design\r\nWith staple remover at the back\r\nReload indicator\r\nType: Mini stapler\r\nMaterial: Plastic\r\nStaple Size: 26/6\r\nStapling Margin: 19mm\r\nStapling Capacity: 15 Sheets\r\n', 'Office Supplies ', 0.00),
(4, 'RS-237204', '', 1, 8000, 'Canon PIXMA G2010', 8000, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 8.8 / 5 ipm (mono/colour)\r\nUSB 2.0\r\nRecommended Monthly Print Volume: 150 - 1500 pages', 'Printer', 0.00),
(5, 'RS-8293033', '', 1, 8000, 'Canon PIXMA G2010', 8000, 'Print, Scan, Copy\r\nPrint Speed (A4, ISO): up to 8.8 / 5 ipm (mono/colour)\r\nUSB 2.0\r\nRecommended Monthly Print Volume: 150 - 1500 pages', 'Printer', 0.00),
(6, 'RS-263233', '', 1, 42, 'Eagle Alpha Pocket Stapler S5027B', 42, 'Mini-size plastic stapler with soft grip design\r\nWith staple remover at the back\r\nReload indicator\r\nType: Mini stapler\r\nMaterial: Plastic\r\nStaple Size: 26/6\r\nStapling Margin: 19mm\r\nStapling Capacity: 15 Sheets\r\n', 'Office Supplies ', 0.00),
(7, 'RS-72200', '', 1, 8495, 'PIXMA G2730', 8495, 'Print, Scan, Copy Print Speed (A4, ISO): up to 11 / 6 ipm (mono/colour) USB 2.0', 'Printer', 0.00),
(0, 'RS-3033220', '', 2, 1840, 'Paper Feed Clutch Electric ', 920, 'For Samsung 2200 436', 'Printer Parts', 0.00),
(0, 'RS-3033220', '', 2, 137798, 'Acer Nitro V 16 ANV16-41-R3RP', 68899, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', 0.00),
(0, 'RS-3290723', '', 1, 68899, 'Acer Nitro V 16 ANV16-41-R3RP', 68899, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', 0.00),
(0, 'RS-2363323', '', 2, 91998, 'MSI Katana 15 B12UDXK-1826PH', 45999, '15.6? FHD 144Hz | i5-12450H | RTX 3050 | 8GB DDR5 | 512GB SSD', 'Laptop', 0.00),
(0, 'RS-2009239', '', 2, 137798, 'Acer Nitro V 16 ANV16-41-R3RP', 68899, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', 0.00),
(0, 'RS-3307', '', 2, 137798, 'Acer Nitro V 16 ANV16-41-R3RP', 68899, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', 0.00),
(0, 'RS-222323', '', 2, 137798, 'Acer Nitro V 16 ANV16-41-R3RP', 68899, '[Black] 15.6? IPS WUXGA 165Hz | R7-8845HS | RTX 4050 | 8GB DDR5 | 512 SSD', 'Laptop', 0.00),
(0, 'RS-3320222', '', 2, 98000, 'Swift Go EVO SFG14-73-529P OPI Pure Silver', 49000, 'Intel® Core™ Ultra 5 processor 125H\r\n16GB RAM\r\n512GB SSD\r\n14.0&quot; display with OLED (Organic Light-Emitting Diode) technology\r\nIntel® ARC™ Graphics\r\nWindows 11 Home\r\nMicrosoft Office for Home and Student 2021\r\nSupports Fast Charging technology', 'Laptop', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `position`, `image`) VALUES
(1, 'admin', '$2y$10$UbL/ndZs37LdGAIg1MP1Oe7G/kxcHSxdMk0eg.5CWwqjQJwJKxsc2', 'admin', '../uploads/1733303469.jpg'),
(2, 'Carlos', '$2y$10$ccylnlK7CPXKbLFNuA9oCeXSJbNZgeOjpUJrV80kN3wJLRDpihZGS', 'admin', '../uploads/Los.jpg'),
(3, 'Shane', '$2y$10$J1hb3btWpPqeItMDnoyxlOpWYMv0QUR939CqByToJWVA0JwXU1W.y', 'cashier', '../uploads/1733413227.jpg'),
(4, 'Bren', '$2y$10$X/h3SiYMud33xYDFApgxXu9Y3HZp1VfY7h1NsONpDdVbcAd3xSc0S', 'cashier', '../uploads/377291831_752261373326619_3450372614834786455_n.jpg'),
(5, 'Vince', '$2y$10$zbbLYjL9mJnkkYAvCTu2nu6tx88RJ7mB1GrsT5ps1YnGE7HXGf9GG', 'cashier', '../uploads/v.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_number`, `address`) VALUES
(1, 'Carlos ', 'cmacaraeg.a12241760@umak.edu.ph', '87ba11a37913e362c48d781fb4fcdf5026e20fa4', '09926822845', 'Pembo, Makati, NCR - 1215');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate_limit`
--
ALTER TABLE `rate_limit`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
