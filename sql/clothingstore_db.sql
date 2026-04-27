-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2025 at 05:46 AM
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
-- Database: `clothingstore_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(46, 2, 11, 'Ivory Kurta Set', '600', '1', 'product1-traditionals.jpeg'),
(47, 2, 6, 'The Iconic Doeskin Blazer', '1500', '1', 'product2-formals.jpeg'),
(48, 2, 9, 'Brenton Suede Wingtip', '900', '1', 'product3-formals.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total_products` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `placed_on` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(12, 2, 'Demo User', '828', 'user@example.com', 'credit card', '123 Main St,,Anytown,,Canada,A1B2C3', ', Tailored Fit Wool Barathea Tuxedo (1 ), The Iconic Doeskin Blazer (1 )', '2599', '27-Nov-2025', 'completed'),
(13, 2, 'Demo User', '', 'user@example.com', 'paytm', '123 Main St,,Anytown,,Canada,A1B2C3', ', The Iconic Doeskin Blazer (1 ), Graduate Fringe Tartan Tie (1 )', '1740', '27-Nov-2025', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `product_detail` varchar(1000) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `product_detail`, `image`, `category`) VALUES
(5, 'Tailored Fit Wool Barathea Tuxedo', '1099', 'Crafted in Italy from fine wool, this tailored  suit offers a trim silhouette through the chest and waist with structured shoulders, high armholes, and classic notch lapels. The fully lined jacket features a two‑button front, welt and flap pockets, and a double vent for ease of movement, while the trousers are designed with side adjusters, angled pockets, and a curtain waistband for refined comfort. With precise detailing, premium linings, and an unhemmed 38\" inseam for custom tailoring, this suit embodies timeless sophistication and modern polish.', 'product1-formals.jpeg', 'Formals'),
(6, 'The Iconic Doeskin Blazer', '1500', 'Crafted in Portugal from luxurious Italian wool, this tailored blazer offers a relaxed fit through the body with a slim cut at the hips, designed to hit at the hip for a modern silhouette. Featuring classic notch lapels, a two‑button front, and long sleeves finished with four decorative buttons, the jacket is fully lined for structure and comfort. Thoughtful details include a chest welt pocket, flapped waist pockets, interior storage, and a single vent at the back, enhanced by princess seams for a flattering shape. With precise measurements — a US size 8 has a 27.5\" back body length and 33.25\" sleeve length — this piece combines timeless design with refined craftsmanship. Dry clean only. Style Number: 648716.', 'product2-formals.jpeg', 'Formals'),
(9, 'Brenton Suede Wingtip', '900', 'Handmade in Spain, this classic wingtip shoe is crafted from 100% leather with a refined almond‑shaped toe and intricate perforated detailing across the toe, vamp, and heel. Designed with a lace‑up front and welt‑stitched construction, it features a cork‑filled insole that molds comfortably to the foot and a durable leather outsole for lasting wear. Finished with a 30 mm (1¼\") heel and Goodyear welt craftsmanship, this shoe combines timeless elegance with superior durability. Style Number: 512683.', 'product3-formals.jpeg', 'Formals'),
(10, 'Graduate Fringe Tartan Tie', '240', 'Made in Italy from 100% wool, this classic tartan tie measures approximately 3.75\" wide and is fully crafted for timeless sophistication. Designed with exceptional attention to detail, it offers a refined finish that pairs effortlessly with both formal and tailored looks. Dry clean only. Style Number: 100066261.', 'product4-formals.jpeg', 'Formals'),
(11, 'Ivory Kurta Set', '600', ' Beautifully crafted from georgette, the kurta is adorned with resham and sequinned embroidery that adds a refined shimmer to festive occasions. Designed with a two‑pocket silhouette and viscose lining, it balances style with functionality. Paired with an ivory Patiala and a richly detailed dupatta, this ensemble embodies heritage while offering modern comfort. Perfect for weddings, celebrations, and cultural gatherings, the set is a statement of craftsmanship and sophistication', 'product1-traditionals.jpeg', 'Traditionals'),
(12, 'Intricate Stunning Embroidered Lehenga', '1500', 'A statement of elegance and craftsmanship, the Intricate Stunning Embroidered Lehenga is designed to blend modern style with traditional artistry. Handcrafted with exquisite detailing, this lehenga features rich embroidery that highlights its luxurious finish. Offered in a warm brown tone, it is fully customizable to suit your preferred color and fit. The set is available in size M/38, with options for pre‑order and custom tailoring to ensure a perfect match. Ideal for weddings, festive occasions, and cultural celebrations, this piece reflects Meena Bazaar’s commitment to assured quality and timeless design', 'product2-traditionals.jpeg', 'Traditionals'),
(14, 'All Handwork Sharara with Peplum', '4000', 'A champagne sharara set with a hand-embroidered peplum-style top featuring a deep V-neck and sheer sleeves, paired with wide-flared sharara pants and a coordinating net dupatta.\r\nType of Work: Hand Embroidery\r\nShop By Style: Sharara Sets\r\nBest For Events: Mehendi, Nikkah, Sangeet, Jaggo, Haldi, Cocktail, Festive, Housewarming, Engagement, Reception, Wedding, Bridal\r\nStyle Tip: Complement this look with rose-gold jhumkas and nude strappy heels.', 'product3-traditionals.jpeg', 'Traditionals'),
(15, 'Loose-Fit Cargo Pants', '120', 'Loose-fit cargo pants in woven fabric with a generous but not oversized silhouette. Internal drawstring at waistband and a zip fly with button. Side pockets with flap, back pockets with flap and hook-loop fastening, and leg pockets with flap. Stitched pleats at knees and a concealed drawstring at hems.', 'product1-jeans.jpeg', 'Jeans'),
(17, 'Loose-Fit Twisted Jeans', '250', '5-pocket jeans in rigid cotton denim with a loose fit from seat to hem. Regular waist, button fly, and dropped gusset. Extra roomy, straight legs with twisted seams. Stacked at ankle', 'product2-jeans.jpeg', 'Jeans'),
(18, 'High-Rise Relaxed Straight Jean', '400', 'Cut for a relaxed, straight silhouette, these jeans are crafted with cotton right-hand twill and treated for a lived-in look. They’re washed for a medium indigo hue and hand-sanded to achieve highs and lows throughout', 'product3-jeans.jpeg', 'Jeans'),
(19, 'Easy Care Stretch Cotton Shirt', '150', 'Crafted from a soft cotton blend with a touch of stretch, this Lauren Ralph Lauren shirt offers a straight fit designed to hit at the hip for a flattering silhouette. Featuring a point collar, buttoned placket with custom logo buttons, and long sleeves with barrel cuffs, it is finished with the signature “LRL” monogram embroidered at the chest. A shirttail hem and back yoke add classic tailoring, while the no‑iron finish ensures effortless wear. Machine washable or dry clean, this versatile piece combines comfort, polish, and sustainability', 'product1-casualshirts.jpeg', 'Casual Shirts'),
(20, 'Cotton-Linen Denim Western Shirt', '1250', 'Skillfully crafted in Italy from indigo‑dyed Japanese denim woven with cotton and linen, this Western‑inspired shirt combines heritage craftsmanship with modern refinement. Designed with a point collar accented by a hand‑sewn sterling silver button, it features a snapped placket with genuine mother‑of‑pearl snaps, front and back yokes, and long sleeves finished with snapped barrel cuffs. Two chest pockets add utility, while the tailored fit ensures a sharp silhouette. With precise detailing and premium materials, this piece embodies timeless style and artisanal quality', 'product2-casualshirts.jpeg', 'Casual Shirts'),
(21, 'Suede Overshirt', '3300', 'A testament to Italian craftsmanship, this Purple Label overshirt is impeccably tailored from supple suede for a distinguished look and feel. Designed with a straight collar, buttoned placket, and genuine horn buttons custom‑developed with the Ralph Lauren logo, it embodies timeless sophistication. Long sleeves with barrel cuffs, two chest cargo pockets, and a lined back yoke add both function and refinement. With precise proportions — a size medium measures 30\" in front length, 29.25\" in back length, 18.5\" shoulder, 44.25\" chest, and 36\" sleeve length — this piece offers a sharp silhouette. Finished with a cotton‑cupro lining and crafted in Italy, it reflects uncompromising quality and enduring style.', 'product3-casualshirts.jpeg', 'Casual Shirts'),
(22, 'Snowflake Cable-Knit Wool-Blend Sweater', '850', 'This heritage‑inspired mockneck sweater combines timeless design with modern comfort. Featuring a classic snowflake motif across the upper body and a marled cable‑knit pattern at the lower body, it delivers a distinctive seasonal look. A rib‑knit mockneck with a five‑button placket and genuine horn buttons adds refined detail, while long sleeves with ribbed cuffs and a ribbed hem ensure a comfortable fit.Crafted from a premium blend of wool, linen, and cotton, this sweater offers warmth and durability. Imported and designed in a regular fit, it embodies effortless sophistication for cold‑weather dressing.', 'product1-winterwear.jpeg', 'Winter Wear'),
(23, 'Wool Shawl-Collar Cardigan', '2000', 'This intricately knit cardigan showcases a vibrant pattern of geometric motifs, eagles, and the signature “RL” logo, crafted from thick‑gauge wool yarns for warmth and texture. Created in collaboration with Manos del Uruguay, a nonprofit collective of women artisans, each piece is signed by the maker, celebrating both craftsmanship and social impact. Designed in a regular fit with a shawl collar, full‑zip front, and rib‑knit cuffs and hem, it offers comfort and timeless style. Two front waist slip pockets add functionality, while the premium 100% wool construction ensures lasting quality. Imported and finished with artisan detail, this cardigan embodies heritage design with modern sophistication.', 'product2-winterwear.jpeg', 'Winter Wear'),
(24, 'Cashmere Pashmina Scarf', '1350', 'Spun from pure cashmere, this Italian‑made scarf embodies timeless luxury and refinement. Measuring 83\" by 27\", it features hand‑rolled ends and is finished with Ralph Lauren’s signature script embroidery at the bottom corner for a distinguished touch. Soft, lightweight, and versatile, it offers warmth and sophistication to any ensemble. Dry clean only', 'product3-winterwear.jpeg', 'Winter Wear'),
(26, 'Cable-Knit Cashmere Crewneck Cardigan', '849', 'This slim‑fitting crewneck cardigan is crafted from chunky cashmere yarn in Ralph Lauren’s iconic cable‑knit construction, offering both warmth and timeless sophistication. Designed to hit at the hip, it features a rib‑knit crewneck, buttoned placket, and long sleeves finished with ribbed cuffs. A ribbed hem completes the silhouette, ensuring a flattering fit. Imported and made from 100% cashmere, this piece embodies luxurious comfort and enduring style.', 'product4-winterwear.jpeg', 'Winter Wear');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'Admin', 'admin@example.com', 'admin_password', 'admin'),
(2, 'Admin', 'user@example.com', 'user_password', 'user'),
(3, 'User2', 'user2@example.com', 'user_password', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_cart` (`user_id`),
  ADD KEY `fk_product_cart` (`pid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_order` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_product_cart` FOREIGN KEY (`pid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_user_cart` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_order` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
