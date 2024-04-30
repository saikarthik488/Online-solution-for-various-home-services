-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 04:11 PM
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
-- Database: `osfvhs`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 'Chef', 'A chef is a service when you hire a professional chef to come to home or event and prepare delicious meals for you and your family/Guests', 1, 0, '2024-03-16 12:44:42', NULL),
(4, 4, 'Women\'s Grooming', 'Salon Prime for women', 1, 0, '2024-03-24 19:50:46', NULL),
(10, 4, 'Care Taking', 'Taking care of oneself is an important aspect of overall well-being. It involves practicing self-care and making choices that prioritize physical, mental and emotional health', 1, 0, '2024-03-16 12:49:31', NULL),
(11, 4, 'Mens Grooming', 'Salon Prime for kids & men', 1, 0, '2024-03-24 19:49:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(3, '202403-00001', 'Sai Karthik', '', 'Murari', 'Male', '9876543210', 'Mubarak Colony Endada Rushikonda Road Endada\r\nFlat No 301 , sea Heights, Beside Oceanic Heights', 'saikarthikmurari488@gmail.com', '1727c5a6646da5707200d2db45d77dc0', 'uploads/clients/3.png?v=1710573383', 1, 0, '2024-03-16 12:46:22', '2024-03-16 13:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(5, '202403-00001', 3, 4, 1999, 'Mubarak Colony Endada Rushikonda Road Endada\r\nFlat No 301 , sea Heights, Beside Oceanic Heights', 1, '2024-03-16 12:57:43', '2024-03-16 13:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 11, 'Grooming essentials', '&lt;ul&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Haircut:&lt;/u&gt;&lt;/b&gt; Haircut for men&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Shave/Beard grooming:&lt;/u&gt;&lt;/b&gt; beard trimming &amp;amp; styling&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Massage:&lt;/u&gt;&lt;/b&gt; 10 Min relaxing massage&lt;/li&gt;&lt;/ul&gt;', 499, 'uploads/products/1.png?v=1711292480', 1, 0, '2024-03-24 19:53:01', '2024-03-26 20:02:23'),
(13, 4, 11, 'Cut & Colour', '&lt;ul&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Haircut:&lt;/u&gt;&lt;/b&gt; Haircut For Men&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Hair color:&lt;/u&gt;&lt;/b&gt; Deep black&amp;nbsp;&lt;/li&gt;&lt;/ul&gt;', 400, 'uploads/products/13.png?v=1711463373', 1, 0, '2024-03-26 19:59:33', '2024-03-26 20:02:02'),
(14, 4, 11, 'Face care & beyond', '&lt;ul&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Detan:&lt;/u&gt; &lt;/b&gt;Face &amp;amp; neck detan pack&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Haircut:&lt;/u&gt; &lt;/b&gt;Haircut for men&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Shave/ Bear grooming:&lt;/u&gt;&lt;/b&gt; Beard trimming &amp;amp; styling&lt;/li&gt;&lt;/ul&gt;', 749, 'uploads/products/14.png?v=1711463505', 1, 0, '2024-03-26 20:01:44', '2024-03-26 20:01:45'),
(15, 4, 11, 'Haircut for men', '&lt;p&gt;Professional haircut that suits your face shape&lt;/p&gt;', 209, 'uploads/products/15.png?v=1711463744', 1, 0, '2024-03-26 20:04:19', '2024-03-26 20:05:44'),
(16, 4, 11, 'Kids Haircut', '&lt;p&gt;Specially trained stylists for&amp;nbsp;&lt;/p&gt;&lt;p&gt;boys aged 2 years and above&lt;/p&gt;', 229, 'uploads/products/16.png?v=1711463708', 1, 0, '2024-03-26 20:05:08', '2024-03-26 20:05:08'),
(17, 4, 4, 'Wax & Glow', '&lt;ul&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Waxing:&lt;/u&gt;&amp;nbsp;&lt;/b&gt;Honey full arms+ underarms, full legs&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Facial:&lt;/u&gt;&amp;nbsp;&lt;/b&gt;Crave beauty hydretation banana facial&lt;/li&gt;&lt;li&gt;&lt;b&gt;&lt;u&gt;Threading:&lt;/u&gt;&amp;nbsp;&lt;/b&gt;Eye brow threading, Upper lip threading&lt;/li&gt;&lt;/ul&gt;', 1099, 'uploads/products/17.png?v=1711464057', 1, 0, '2024-03-26 20:10:57', '2024-03-26 20:10:57'),
(18, 4, 4, 'Instant glow facials', '&lt;p&gt;Perfect for an upcomming special occasions,&amp;nbsp;&lt;/p&gt;&lt;p&gt;for radiant &amp;amp; eye-catching&lt;/p&gt;', 550, 'uploads/products/18.png?v=1711464131', 1, 0, '2024-03-26 20:12:07', '2024-03-26 20:12:11'),
(19, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, NULL, 1, 1, '2024-03-26 20:14:00', '2024-03-26 20:17:57'),
(20, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, NULL, 1, 1, '2024-03-26 20:14:05', '2024-03-26 20:18:01'),
(21, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/21.png?v=1711464347', 1, 1, '2024-03-26 20:15:47', '2024-03-26 20:18:08'),
(22, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/22.png?v=1711464351', 1, 1, '2024-03-26 20:15:51', '2024-03-26 20:18:13'),
(23, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/23.png?v=1711464352', 1, 1, '2024-03-26 20:15:52', '2024-03-26 20:18:17'),
(24, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/24.png?v=1711464353', 1, 1, '2024-03-26 20:15:52', '2024-03-26 20:18:23'),
(25, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/25.png?v=1711464353', 1, 1, '2024-03-26 20:15:53', '2024-03-26 20:18:27'),
(26, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/26.png?v=1711464353', 1, 1, '2024-03-26 20:15:53', '2024-03-26 20:18:32'),
(27, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/27.png?v=1711464394', 1, 1, '2024-03-26 20:16:34', '2024-03-26 20:18:37'),
(28, 4, 4, 'Hydration facials & cleanup\'s', '&lt;p&gt;Perfect for pampering your skin.&amp;nbsp;&lt;/p&gt;&lt;p&gt;for moisturised &amp;amp; nourished skin&lt;/p&gt;', 300, 'uploads/products/28.png?v=1711464407', 1, 0, '2024-03-26 20:16:47', '2024-03-26 20:16:47'),
(29, 4, 4, 'tan removal cleanup\'s', '&lt;p&gt;perfect for hot summers or after vacation, &lt;/p&gt;&lt;p&gt;for clean &amp;amp; restored skins&lt;/p&gt;', 400, 'uploads/products/29.png?v=1711464579', 1, 0, '2024-03-26 20:19:39', '2024-03-26 20:19:39'),
(30, 4, 4, 'Hydra Facial', '&lt;p&gt;&lt;span style=&quot;color: rgb(237, 241, 241); font-family: &quot;Google Sans&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(51, 79, 81);&quot;&gt;Cleansing and exfoliation, Chemical peel, Vacuum suction extraction, and Hydrating serum&lt;/span&gt;&lt;/p&gt;&lt;ol jscontroller=&quot;M2ABbc&quot; jsaction=&quot;jZtoLb:SaHfyb&quot; data-hveid=&quot;CAgQAA&quot; data-ved=&quot;2ahUKEwi1oKfIlpKFAxWs-TgGHcN5AAcQnPYKegQICBAA&quot; style=&quot;margin: 20px 0px; padding: 0px 0px 0px 24px; line-height: 22px; color: rgb(237, 241, 241); font-family: &quot;Google Sans&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; background-color: rgb(32, 33, 36);&quot;&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px; list-style: inherit;&quot;&gt;HydroPeel tip:&nbsp;Cleanses the skin\'s surface by removing the initial layer of dirt and oil&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px; list-style: inherit;&quot;&gt;Exfoliation:&nbsp;Removes dead skin cells and other impurities&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px; list-style: inherit;&quot;&gt;Fruit acid peel:&nbsp;Gently removed&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px; list-style: inherit;&quot;&gt;Activ-4&trade; serum:&nbsp;Removes dead skin cells to reveal healthy skin&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 4px; list-style: inherit;&quot;&gt;GlySal&trade;:&nbsp;A mixture of glycolic and salicylic acids that delivers the benefits of a peel without post-peel scaling&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(237, 241, 241); font-family: &quot;Google Sans&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(51, 79, 81);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(237, 241, 241); font-family: &quot;Google Sans&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(51, 79, 81);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 2299, 'uploads/products/30.png?v=1711465045', 1, 0, '2024-03-26 20:21:10', '2024-03-26 20:27:25'),
(31, 4, 10, 'Care for home health aides', '&lt;ul jscontroller=&quot;M2ABbc&quot; jsaction=&quot;jZtoLb:SaHfyb&quot; data-hveid=&quot;CAkQAA&quot; data-ved=&quot;2ahUKEwjds5Ogl5KFAxVI7zgGHUXnCBYQm_YKegQICRAA&quot; style=&quot;margin: 20px 0px; padding: 0px 0px 0px 24px; line-height: 22px; color: rgb(237, 241, 241); font-family: &quot;Google Sans&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; background-color: rgb(32, 33, 36);&quot;&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Personal care:&nbsp;Bathing, dressing, grooming, toileting, feeding, and skin care&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Housekeeping:&nbsp;Laundry, changing bed linens, washing dishes, and meal preparation&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Medical:&nbsp;Monitoring vital signs, collecting specimens, administering medications, and performing maintenance exercise programs&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Transportation:&nbsp;Helping patients to medical appointments or hospital visits&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 4px;&quot;&gt;&lt;span class=&quot;oXzekf&quot;&gt;Guidance:&nbsp;&lt;/span&gt;&lt;span class=&quot;oXzekf&quot;&gt;Providing advice to patients and their families regarding their diet and exercise routines&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 1300, 'uploads/products/31.png?v=1711464982', 1, 0, '2024-03-26 20:24:11', '2024-03-26 20:26:22'),
(32, 4, 10, 'Care Taking', '&lt;div class=&quot;LT6XE&quot; style=&quot;position: relative; overflow-wrap: break-word; max-width: 632px; min-width: 0px; flex: 1 1 0%; color: rgb(241, 242, 219); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(32, 33, 36);&quot;&gt;&lt;div jsname=&quot;dvXlsc&quot; class=&quot;f5cPye&quot; data-lht=&quot;696&quot;&gt;&lt;div jsname=&quot;kj7T5c&quot; class=&quot;oD6fhb&quot;&gt;&lt;div class=&quot;WaaZC Zh8Myb&quot;&gt;&lt;div class=&quot;RJPOee EIJn2&quot; style=&quot;animation: auto ease 0s 1 normal none running none !important; color: var(--m3c11, var(--mc5));&quot;&gt;&lt;div class=&quot;rPeykc uP58nb eUu65e PZPZlf&quot; data-attrid=&quot;SGEParagraphFeedback&quot; data-hveid=&quot;CAUQAA&quot; data-ved=&quot;2ahUKEwiZtIazmJKFAxWO7TgGHeDJCesQo_EKegQIBRAA&quot; style=&quot;margin: 20px 0px; font-size: 16px; font-weight: bold; letter-spacing: 0.2px; line-height: 22px;&quot;&gt;&lt;span aria-level=&quot;2&quot; role=&quot;heading&quot;&gt;Care attendants may also help with:&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;WaaZC Zh8Myb&quot;&gt;&lt;div class=&quot;RJPOee EIJn2&quot; style=&quot;animation: auto ease 0s 1 normal none running none !important; color: var(--m3c11, var(--mc5));&quot;&gt;&lt;ul jscontroller=&quot;M2ABbc&quot; jsaction=&quot;jZtoLb:SaHfyb&quot; data-hveid=&quot;CAcQAA&quot; data-ved=&quot;2ahUKEwiZtIazmJKFAxWO7TgGHeDJCesQm_YKegQIBxAA&quot; style=&quot;margin: 20px 0px; padding: 0px 0px 0px 24px; font-size: 16px; line-height: 22px;&quot;&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Taking patients\' temperature, blood pressure, pulse, and respiration&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Preparing and administering medications&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Collecting specimens for lab tests&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Monitoring patients&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px 0px 8px; padding: 0px 0px 0px 4px;&quot;&gt;Recording treatment&lt;/li&gt;&lt;li class=&quot;PZPZlf&quot; data-attrid=&quot;SGEListItem&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 4px;&quot;&gt;Mobility, such as transferring the patient from bed to a wheelchair or helping them walk&lt;span class=&quot;UV3uM&quot; style=&quot;text-wrap: nowrap;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;oD6fhb&quot; lang=&quot;en&quot;&gt;&lt;/div&gt;&lt;/div&gt;', 1499, 'uploads/products/32.png?v=1711465143', 1, 0, '2024-03-26 20:29:03', '2024-03-26 20:29:03'),
(33, 4, 10, 'Doctor Care', '&lt;p&gt;&lt;span style=&quot;color: rgb(241, 242, 219); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(68, 73, 39);&quot;&gt;treating patients with care and compassion, recognizing their own limits, and providing follow-up care within a reasonable time&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 999, 'uploads/products/33.png?v=1711465186', 1, 0, '2024-03-26 20:29:46', '2024-03-26 20:29:46'),
(34, 4, 10, 'Nursing Care', '&lt;p&gt;&lt;span style=&quot;color: rgb(237, 241, 241); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 18px; background-color: rgb(51, 79, 81);&quot;&gt;medical tasks and personal care, such as administering medication, wound care, and monitoring vital signs, and personal care such as bathing and dressing&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 899, 'uploads/products/34.png?v=1711465321', 1, 0, '2024-03-26 20:32:01', '2024-03-26 20:32:01'),
(35, 4, 1, 'Personal chef', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 202, 190); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.1px; background-color: rgb(32, 33, 36);&quot;&gt;A trained professional who can come to your home as scheduled.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(189, 202, 190); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.1px; background-color: rgb(32, 33, 36);&quot;&gt;Personal chefs can specialize in vegetarian,&amp;nbsp; or calorie-counting cuisine, or design menus based on your body type&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 300, 'uploads/products/35.png?v=1711465535', 1, 0, '2024-03-26 20:35:35', '2024-03-26 20:35:35'),
(36, 4, 1, 'Commis-Chef', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 202, 190); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.1px; background-color: rgb(32, 33, 36);&quot;&gt;An entry-level chef who helps prepare meals, keeps work areas clean, and provides chefs with tools and ingredients.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 270, 'uploads/products/36.png?v=1711465653', 1, 0, '2024-03-26 20:37:33', '2024-03-26 20:37:33'),
(37, 4, 1, 'Kitchen porter', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 202, 190); font-family: &amp;quot;Google Sans&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif; font-size: 14px; letter-spacing: 0.1px; background-color: rgb(32, 33, 36);&quot;&gt;A non-chef who helps keep the kitchen running by delivering supplies, putting away deliveries, and keeping areas clean&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 230, 'uploads/products/37.png?v=1711465842', 1, 0, '2024-03-26 20:40:42', '2024-03-26 20:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Chef\'s', 1, 0, '2024-03-15 00:00:00', '2024-03-15 19:18:20'),
(2, 'Grooming', 1, 0, '2024-03-15 00:00:00', '2024-03-15 19:18:33'),
(3, 'Care Taking', 1, 0, '2024-03-15 00:00:00', '2024-03-15 19:18:48'),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Solution For Various Home Services'),
(6, 'short_name', 'OSFVHS'),
(11, 'logo', 'uploads/logo-1710574461.png'),
(13, 'user_avatar', 'uploads/men at3.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1710574445', NULL, 1, '2021-01-20 14:02:37', '2024-03-16 13:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202403-00001', 4, 'TaskSwift', 'Karthik', '1234567890', 'taskswift', 'ed2573ec76d5ad8011b491d652e2a343', 'uploads/vendors/4.png?v=1710510581', 1, 0, '2024-03-15 19:19:41', '2024-03-16 13:14:04'),
(5, '202403-00002', 3, 'Balaji', 'Srinivasulu', '9848939948', 'balaji', 'e75c1a66ae406db7d2f451b216b10664', NULL, 1, 0, '2024-03-24 15:51:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
