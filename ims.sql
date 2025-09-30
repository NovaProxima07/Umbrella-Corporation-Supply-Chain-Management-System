-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 12:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ims`
--

-- --------------------------------------------------------

--
-- Table structure for table `ims_brand`
--

CREATE TABLE `ims_brand` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_brand`
--

INSERT INTO `ims_brand` (`id`, `categoryid`, `bname`, `status`) VALUES
(1, 2, 'BioGrow', 'active'),
(2, 2, 'AquaFresh', 'active'),
(3, 2, ' SolventPro', 'active'),
(5, 1, 'Apple', 'active'),
(6, 1, 'Samsung', 'active'),
(7, 3, 'The Generics Pharmacy', 'active'),
(8, 3, 'Unilab', 'active'),
(9, 3, 'Ritemed', 'active'),
(10, 4, 'Careline', 'active'),
(11, 4, 'MAC Cosmetics', 'active'),
(12, 4, 'Maybelline', 'active'),
(13, 1, 'Xiaomi', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `ims_category`
--

CREATE TABLE `ims_category` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_category`
--

INSERT INTO `ims_category` (`categoryid`, `name`, `status`) VALUES
(1, 'Technology', 'active'),
(2, 'Chemicals', 'active'),
(3, 'Pharmaceuticals', 'active'),
(4, 'Cosmetics', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `ims_customer`
--

CREATE TABLE `ims_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobile` int(50) NOT NULL,
  `balance` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_customer`
--

INSERT INTO `ims_customer` (`id`, `name`, `address`, `mobile`, `balance`) VALUES
(1, 'Mark Cooper', 'Sample Address', 2147483647, 25000.00),
(2, 'George Wilson', '2306 St, Here There', 2147483647, 35000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ims_order`
--

CREATE TABLE `ims_order` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `total_shipped` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_order`
--

INSERT INTO `ims_order` (`order_id`, `product_id`, `total_shipped`, `customer_id`, `order_date`) VALUES
(1, '1', 5, 1, '2022-06-20 08:20:40'),
(2, '2', 3, 2, '2022-06-20 08:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `ims_product`
--

CREATE TABLE `ims_product` (
  `pid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(45) NOT NULL,
  `unit` varchar(150) NOT NULL,
  `base_price` double(10,2) NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `minimum_order` double(10,2) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_product`
--

INSERT INTO `ims_product` (`pid`, `categoryid`, `brandid`, `pname`, `model`, `description`, `quantity`, `unit`, `base_price`, `tax`, `minimum_order`, `supplier`, `status`, `date`) VALUES
(1, 2, 1, 'Organic Fertilizer', 'BG-100', ' The BioGrow BG-100 is a premium organic fertilizer designed to enhance soil fertility and promote healthy plant growth. Made from all-natural ingredients, this fertilizer is rich in essential nutrients, minerals, and beneficial microorganisms. The BG-100 improves soil structure, boosts nutrient absorption, and stimulates root development, leading to stronger and more productive plants. It is suitable for use in gardens, farms, and landscaping projects, providing a sustainable and eco-friendly solution for plant nourishment.', 100000, 'Kg', 500.00, '10.00', 1.00, 2, 'active', '0000-00-00'),
(3, 3, 7, 'PainReliefMax', 'PRM-500', 'PainReliefMax (PRM-500) is a fast-acting analgesic medication designed to provide effective relief from moderate to severe pain. The PRM-500 model is formulated with a potent combination of pain-relieving ingredients, targeting both acute and chronic pain conditions. It offers extended-release properties to provide long-lasting relief, making it suitable for conditions such as post-operative pain, musculoskeletal pain, or neuropathic pain. PainReliefMax (PRM-500) is commonly prescribed by healthcare professionals and helps patients manage their pain and improve their quality of life.', 1000, 'Box', 500.00, '12.00', 1.00, 3, 'active', '0000-00-00'),
(5, 4, 10, 'Radiant Glow Serum', 'Rejuvenate+', ' Radiant Glow Serum is a luxurious skincare product designed to revitalize and enhance the natural radiance of your skin. Infused with potent antioxidants and hydrating ingredients, this serum helps to minimize the appearance of fine lines and wrinkles, while promoting a brighter and more youthful complexion. The lightweight formula absorbs quickly and leaves your skin feeling silky smooth and nourished. Incorporate the Rejuvenate+ Radiant Glow Serum into your daily skincare routine to achieve a luminous and rejuvenated look.', 100000, 'Bottles', 350.00, '3.00', 1.00, 4, 'active', '0000-00-00'),
(6, 1, 5, 'iPhone 13 Pro ', 'A2628 ', 'The iPhone 13 Pro (model A2628) is the latest flagship smartphone from Apple. It features a stunning Super Retina XDR display with ProMotion technology for smooth scrolling and an immersive visual experience. The iPhone 13 Pro is equipped with the powerful A15 Bionic chip, offering improved performance and energy efficiency. It boasts a triple-camera system with enhanced low-light capabilities, enabling users to capture professional-quality photos and videos. With its sleek design, advanced features, and iOS ecosystem, the iPhone 13 Pro is a top choice for tech enthusiasts and mobile photography enthusiasts', 3000, 'Box', 3000000.00, '12.00', 1.00, 1, 'active', '0000-00-00'),
(7, 1, 6, 'Samsung Galaxy S21 Ultra', 'SM-G998U ', 'The Samsung Galaxy S21 Ultra (model SM-G998U) is a premium flagship smartphone that sets new standards in performance and versatility. It features a large Dynamic AMOLED display with a 120Hz refresh rate, offering vibrant colors and smooth scrolling. The Galaxy S21 Ultra is powered by a powerful Exynos or Snapdragon processor (depending on the region) for seamless multitasking and gaming. It boasts a quad-camera system with a 108MP main sensor and advanced zoom capabilities, allowing users to capture stunning photos even from a distance. With its powerful hardware, cutting-edge features, and sleek design, the Galaxy S21 Ultra is a powerhouse in the Android smartphone market.', 3000, 'Box', 250000.00, '12.00', 1.00, 1, 'active', '0000-00-00'),
(8, 1, 13, ' Xiaomi Mi 11', 'M2011K2G', 'The Xiaomi Mi 11 (model M2011K2G) is a feature-packed smartphone that combines cutting-edge technology with an attractive design. It features a vibrant AMOLED display with a 120Hz refresh rate for smooth visuals. The Mi 11 is equipped with a Qualcomm Snapdragon 888 processor, ensuring fast and responsive performance. It offers a versatile triple-camera setup, including a 108MP main sensor, enabling users to capture stunning photos and videos.', 100000213, 'Box', 12123.00, '99.99', 1.00, 1, 'active', '0000-00-00'),
(9, 2, 3, 'Industrial Degreaser', 'SP-500', 'The SolventPro SP-500 is a highly effective industrial degreaser designed to remove stubborn grease, oil, and grime from various surfaces. It is specially formulated to provide excellent cleaning power while being safe for use on metals, plastics, and painted surfaces. The SP-500 is widely used in manufacturing facilities, automotive workshops, and maintenance operations where heavy-duty degreasing is required.', 5000, 'Bottles', 500.00, '1.00', 1.00, 2, 'active', '0000-00-00'),
(10, 2, 2, 'Water Treatment System ', 'AF-2000 ', 'The AquaFresh AF-2000 is an advanced water treatment system that utilizes state-of-the-art filtration and purification technologies to ensure clean and safe drinking water. It employs a multi-stage process involving activated carbon filters, reverse osmosis, and UV disinfection to remove impurities, bacteria, and harmful contaminants. The AF-2000 is ideal for both residential and commercial use, providing peace of mind and improving the overall quality of water.', 3000, 'Bottles', 700.00, '3.00', 1.00, 2, 'active', '0000-00-00'),
(11, 3, 9, 'ImmunoBoostX', 'IBX-300', 'The IBX-300 model contains a blend of vitamins, minerals, and herbal extracts known for their immune-boosting properties.', 3000, 'Bottles', 300.00, '3.00', 1.00, 3, 'active', '0000-00-00'),
(12, 3, 8, 'CardioGuard', 'CG-2000', 'CardioGuard (CG-2000) is an innovative cardiovascular medication that helps in the management of heart-related conditions. This model is specifically designed to support cardiovascular health by regulating blood pressure and improving blood circulation. CardioGuard (CG-2000) contains a unique blend of active ingredients known for their cardio-protective properties, helping to reduce the risk of heart disease and related complications. It is commonly prescribed as part of a comprehensive treatment plan for patients with hypertension, congestive heart failure, or other cardiovascular disorders.', 3000, 'Bottles', 300.00, '3.00', 1.00, 3, 'active', '0000-00-00'),
(13, 4, 11, 'Studio Fix Fluid ', 'SPF 15 Foundation', 'MAC Studio Fix Fluid SPF 15 Foundation is a bestselling, medium to full coverage foundation that provides a smooth, flawless finish. The oil-free formula offers long-wearing, matte coverage while also protecting the skin with SPF 15. It is available in a wide range of shades to match various skin tones, making it a popular choice for professional makeup artists and beauty enthusiasts alike.', 4000, 'Bottles', 250.00, '3.00', 1.00, 4, 'active', '0000-00-00'),
(14, 4, 12, 'Instant Age Rewind Eraser ', 'Dark Circles Treatment Concealer', ' Maybelline Instant Age Rewind Eraser Dark Circles Treatment Concealer is a multitasking product that covers dark circles, brightens the under-eye area, and helps reduce puffiness. The formula is infused with goji berry and Haloxyl, which work together to improve the appearance of tired-looking eyes. The built-in sponge applicator allows for easy and precise application, making it a go-to concealer for a refreshed and youthful look.', 1500, 'Bottles', 400.00, '2.00', 1.00, 4, 'active', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `ims_purchase`
--

CREATE TABLE `ims_purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_purchase`
--

INSERT INTO `ims_purchase` (`purchase_id`, `supplier_id`, `product_id`, `quantity`, `purchase_date`) VALUES
(1, '1', '1', '25', '2022-06-20 08:20:07'),
(2, '2', '2', '35', '2022-06-20 08:20:14'),
(3, '3', '3', '10', '2022-06-20 08:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `ims_supplier`
--

CREATE TABLE `ims_supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ims_supplier`
--

INSERT INTO `ims_supplier` (`supplier_id`, `supplier_name`, `mobile`, `address`, `status`) VALUES
(1, 'TechNexus Global', '+1-555-123-4567', ' 123 Main Street, California, USA', 'active'),
(2, 'ChemTech International', '+33-1-2345-6789', ' 321 Maple Lane, Paris, France', 'active'),
(3, 'PharmaLink Solutions', '+44-20-1234-5678 ', '456 Elm Avenue, Cityville, United Kingdom', 'active'),
(4, 'CosmoTrade Corporation', '+61-2-9876-5432 ', '789 Oak Street, Townsville, Australia', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `ID` int(11) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Company` varchar(45) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`ID`, `Fullname`, `Position`, `Email`, `Address`, `Phone`, `Company`, `Username`, `Password`) VALUES
(1, 'RJ P. Delariarte', 'Manager', 'rjdelariarte@yahoo.com', 'Dumangas, Iloilo', '09565382770', '123123', 'rjdelariarte', 'password123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ims_brand`
--
ALTER TABLE `ims_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_category`
--
ALTER TABLE `ims_category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `ims_customer`
--
ALTER TABLE `ims_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_order`
--
ALTER TABLE `ims_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `ims_product`
--
ALTER TABLE `ims_product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `ims_purchase`
--
ALTER TABLE `ims_purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `ims_supplier`
--
ALTER TABLE `ims_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ims_brand`
--
ALTER TABLE `ims_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ims_category`
--
ALTER TABLE `ims_category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ims_customer`
--
ALTER TABLE `ims_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ims_order`
--
ALTER TABLE `ims_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ims_product`
--
ALTER TABLE `ims_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ims_purchase`
--
ALTER TABLE `ims_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ims_supplier`
--
ALTER TABLE `ims_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
