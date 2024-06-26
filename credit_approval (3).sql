-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 09:47 PM
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
-- Database: `credit_approval`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_data`
--

CREATE TABLE `customer_data` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(11) NOT NULL,
  `last_name` varchar(12) NOT NULL,
  `age` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `monthly_salary` int(11) NOT NULL,
  `approved_limit` int(11) NOT NULL,
  `current_debt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_data`
--

INSERT INTO `customer_data` (`customer_id`, `first_name`, `last_name`, `age`, `phone_number`, `monthly_salary`, `approved_limit`, `current_debt`) VALUES
(53, 'jayant', 'nishad', 23, 3353534, 30000, 1, 33333),
(1012, 'Alaine', 'Diez', 55, 2147483647, 251000, 4500000, 1135575),
(1066, 'Ai', 'Mendez', 57, 2147483647, 146000, 2000000, 588444),
(1088, 'Adrien', 'Marin', 34, 2147483647, 229000, 4800000, 4454514),
(1204, 'Addie', 'Muñoz', 51, 2147483647, 168000, 2500000, 731611),
(1212, 'Adrianne', 'Rubio', 36, 2147483647, 282000, 1300000, 1269901),
(1239, 'Alejandra', 'Carmona', 25, 2147483647, 283000, 4500000, 1998961),
(1278, 'Aileen', 'Vidal', 25, 2147483647, 243000, 2200000, 967059),
(1336, 'Alex', 'Rojas', 54, 2147483647, 126000, 1600000, 1590616),
(1390, 'Adeline', 'Vazquez', 29, 2147483647, 142000, 1300000, 295690),
(1469, 'Adelia', 'Torres', 38, 2147483647, 150000, 1200000, 703987),
(1552, 'Abigail', 'Perez', 20, 2147483647, 268000, 2200000, 1160363),
(1641, 'Ada', 'Jimenez', 27, 2147483647, 85000, 2400000, 354806),
(1729, 'Aaron', 'Garcia', 63, 2147483647, 50000, 4500000, 1351508),
(1737, 'Alethia', 'Gallardo', 26, 2147483647, 61000, 5000000, 4978423),
(1743, 'Adele', 'Navarro', 66, 2147483647, 109000, 4100000, 2749475),
(1796, 'Alfredia', 'Arroyo', 42, 2147483647, 254000, 1600000, 1071864),
(1930, 'Akilah', 'Flores', 26, 2147483647, 166000, 2800000, 350305),
(2041, 'Aida', 'Calvo', 60, 2147483647, 294000, 3700000, 1560964),
(2104, 'Alexandria', 'Espinosa', 56, 2147483647, 228000, 2400000, 1801554),
(2106, 'Agnus', 'Santos', 47, 2147483647, 101000, 1300000, 1032372),
(2152, 'Abby', 'Fernandez', 60, 2147483647, 117000, 2600000, 124806),
(2405, 'Alica', 'Rey', 40, 2147483647, 56000, 2600000, 1734717),
(2452, 'Albert', 'Pascual', 47, 2147483647, 200000, 1400000, 271666),
(2471, 'Alan', 'Fuentes', 57, 2147483647, 115000, 2900000, 2189518),
(2541, 'Adelle', 'Ramirez', 69, 2147483647, 202000, 1400000, 590754),
(2564, 'Ailene', 'Leon', 28, 2147483647, 268000, 4500000, 2761360),
(2622, 'Alisa', 'Sierra', 49, 2147483647, 185000, 2600000, 2176341),
(2664, 'Agustina', 'Guerrero', 25, 2147483647, 192000, 1500000, 674857),
(2715, 'Alida', 'Galan', 65, 2147483647, 66000, 2800000, 2578793),
(2736, 'Adan', 'Alvarez', 35, 2147483647, 230000, 4200000, 1455835),
(2782, 'Adrienne', 'Nuñez', 36, 2147483647, 169000, 4600000, 1641709),
(2806, 'Akiko', 'Cabrera', 32, 2147483647, 73000, 3800000, 573370),
(3114, 'Aisha', 'Marquez', 62, 2147483647, 173000, 2800000, 56388),
(3126, 'Alexia', 'Lara', 39, 2147483647, 270000, 2200000, 1832461),
(3167, 'Agueda', 'Cortes', 60, 2147483647, 168000, 1900000, 745790),
(3192, 'Alfonzo', 'Rivera', 43, 2147483647, 160000, 2200000, 87059),
(3353, 'Adolph', 'Suarez', 59, 2147483647, 86000, 3000000, 1883099),
(3357, 'Adolfo', 'Molina', 63, 2147483647, 287000, 4600000, 4337579),
(3393, 'Adella', 'Gil', 23, 2147483647, 43000, 2500000, 2314351),
(3437, 'Aleisha', 'Vargas', 30, 2147483647, 99000, 1500000, 684934),
(3465, 'Agnes', 'Garrido', 31, 2147483647, 172000, 3100000, 1761587),
(3479, 'Alfreda', 'Casado', 33, 2147483647, 82000, 2100000, 416656),
(3524, 'Adrianna', 'Ortiz', 65, 2147483647, 111000, 1600000, 187375),
(3589, 'Afton', 'Iglesias', 40, 2147483647, 268000, 1300000, 738443),
(3650, 'Aleshia', 'Velasco', 51, 2147483647, 40000, 2500000, 1812186),
(3769, 'Ahmad', 'Cano', 61, 2147483647, 57000, 4700000, 482039),
(3819, 'Alfredo', 'Redondo', 62, 2147483647, 109000, 3500000, 77480),
(3865, 'Abe', 'Martinez', 28, 2147483647, 129000, 1900000, 430214),
(3948, 'Adena', 'Serrano', 43, 2147483647, 108000, 2400000, 2035534),
(4000, 'Alicia', 'Luque', 55, 2147483647, 142000, 3400000, 3185647),
(4048, 'Alethea', 'Bravo', 48, 2147483647, 128000, 2300000, 1259845),
(4063, 'Alane', 'Caballero', 58, 2147483647, 125000, 1900000, 1832187),
(4097, 'Aimee', 'Herrera', 65, 2147483647, 91000, 4100000, 3926837),
(4106, 'Alejandro', 'Roman', 49, 2147483647, 254000, 900000, 590828),
(4107, 'Aldo', 'Duran', 33, 2147483647, 124000, 4800000, 3142907),
(4140, 'Alise', 'Segura', 47, 2147483647, 111000, 3900000, 3062938),
(4182, 'Abraham', 'Gomez', 29, 2147483647, 163000, 3100000, 2317635),
(4197, 'Albina', 'Ibañez', 52, 2147483647, 86000, 2700000, 447869),
(4205, 'Alfonso', 'Rivas', 60, 2147483647, 179000, 1800000, 507554),
(4213, 'Adelaida', 'Alonso', 58, 2147483647, 45000, 900000, 392269),
(4235, 'Adina', 'Blanco', 44, 2147483647, 278000, 2200000, 334888),
(4253, 'Abdul', 'Lopez', 40, 2147483647, 219000, 1000000, 228442),
(4254, 'Alina', 'Montes', 38, 2147483647, 65000, 1800000, 1065892),
(4263, 'Alease', 'Vicente', 23, 2147483647, 173000, 1400000, 759440),
(4393, 'Aide', 'Cruz', 54, 2147483647, 247000, 4100000, 65675),
(4550, 'Alaina', 'Vega', 35, 2147483647, 103000, 2200000, 358415),
(5147, 'Adria', 'Morales', 34, 2147483647, 169000, 1100000, 492121),
(5231, 'Alfred', 'Silva', 32, 2147483647, 83000, 4100000, 3802415),
(5369, 'Alda', 'Gimenez', 21, 2147483647, 139000, 2800000, 364542),
(5434, 'Albertine', 'Hidalgo', 26, 2147483647, 179000, 2800000, 356473),
(5471, 'Adela', 'Romero', 68, 2147483647, 204000, 2600000, 2395877),
(5604, 'Albertha', 'Santana', 29, 2147483647, 37000, 1000000, 515080),
(5621, 'Aja', 'Peña', 64, 2147483647, 147000, 1500000, 43407),
(5765, 'Adam', 'Moreno', 55, 2147483647, 56000, 2200000, 1036824),
(6092, 'Alexandra', 'Franco', 28, 2147483647, 183000, 3300000, 237360),
(6121, 'Alecia', 'Santiago', 38, 2147483647, 118000, 3200000, 296592),
(6126, 'Abbie', 'Rodrigues', 47, 2147483647, 193000, 2500000, 2010061),
(6270, 'Abbey', 'Gonzalez', 20, 2147483647, 33000, 1400000, 320519),
(6339, 'Agripina', 'Castillo', 27, 2147483647, 70000, 2000000, 427355),
(6387, 'Aline', 'Rios', 56, 2147483647, 35000, 3300000, 734003),
(6404, 'Adriene', 'Sanz', 21, 2147483647, 33000, 3200000, 1805257),
(6424, 'Adelaide', 'Gutierrez', 40, 2147483647, 269000, 3600000, 262829),
(6521, 'Alden', 'Ferrer', 37, 2147483647, 98000, 1800000, 484079),
(6610, 'Adrian', 'Ortega', 45, 2147483647, 138000, 4000000, 3844618),
(6625, 'Alice', 'Otero', 57, 2147483647, 295000, 4800000, 1733459),
(6760, 'Albertina', 'Lorenzo', 42, 2147483647, 97000, 4300000, 1079009),
(6768, 'Alishia', 'Marcos', 42, 2147483647, 66000, 4700000, 1168849),
(6800, 'Alexis', 'Izquierdo', 55, 2147483647, 210000, 1100000, 816835),
(6887, 'Ali', 'Camacho', 62, 2147483647, 133000, 3300000, 358519),
(6905, 'Aletha', 'Parra', 62, 2147483647, 82000, 4200000, 4118107),
(6921, 'Adell', 'Ramos', 26, 2147483647, 96000, 4900000, 482391),
(6924, 'Adaline', 'Diaz', 65, 2147483647, 253000, 3900000, 3569545),
(7009, 'Alayna', 'Reyes', 66, 2147483647, 272000, 1800000, 1638820),
(7062, 'Agatha', 'Medina', 32, 2147483647, 229000, 1600000, 1210547),
(7170, 'Adah', 'Ruiz', 49, 2147483647, 289000, 2600000, 362220),
(7517, 'Aleen', 'Arias', 21, 2147483647, 173000, 2100000, 1152920),
(7561, 'Aiko', 'Gallego', 56, 2147483647, 242000, 4200000, 2724216),
(7571, 'Adriana', 'Delgado', 31, 2147483647, 112000, 3700000, 1402238),
(7600, 'Alene', 'Soto', 23, 2147483647, 117000, 5000000, 1798853),
(7606, 'Alberta', 'Herrero', 47, 2147483647, 262000, 2600000, 237452),
(7726, 'Alesia', 'Soler', 36, 2147483647, 274000, 2200000, 2167243),
(7834, 'Alena', 'Pastor', 60, 2147483647, 188000, 1100000, 435368),
(7879, 'Alana', 'Carrasco', 26, 2147483647, 115000, 900000, 751692),
(7926, 'Alexa', 'Pardo', 24, 2147483647, 220000, 3000000, 2637477),
(8144, 'Adelina', 'Dominguez', 64, 2147483647, 184000, 2800000, 1315387),
(8227, 'Alessandra', 'Moya', 25, 2147483647, 204000, 1700000, 671995),
(8338, 'Alexander', 'Merino', 25, 2147483647, 72000, 2700000, 2545027),
(8360, 'Agustin', 'Lozano', 64, 2147483647, 202000, 4100000, 3829681),
(8365, 'Ahmed', 'Prieto', 57, 2147483647, 122000, 5000000, 1614220),
(8526, 'Al', 'Campos', 47, 2147483647, 137000, 3900000, 647452),
(8592, 'Alba', 'Aguilar', 26, 2147483647, 182000, 4500000, 1670241),
(8640, 'Adalberto', 'Hernandez', 41, 2147483647, 229000, 2700000, 2114892),
(8641, 'Abram', 'Martin', 37, 2147483647, 89000, 1000000, 274503),
(8649, 'Alesha', 'Saez', 69, 2147483647, 299000, 4700000, 2275318),
(8883, 'Abel', 'Sanchez', 65, 2147483647, 73000, 2600000, 1843706),
(8893, 'Aleida', 'Mora', 21, 2147483647, 297000, 2000000, 533977),
(9304, 'Aleta', 'Esteban', 59, 2147483647, 32000, 2200000, 2003199),
(9377, 'Alia', 'Vera', 25, 2147483647, 286000, 1400000, 1194480),
(9381, 'Alec', 'Benitez', 28, 2147483647, 226000, 3600000, 1363377),
(9673, 'Alberto', 'Montero', 49, 2147483647, 156000, 3600000, 2214649),
(9857, 'Adriane', 'Castro', 37, 2147483647, 180000, 2500000, 2065829),
(9881, 'Alanna', 'Nieto', 66, 2147483647, 125000, 3500000, 1830936),
(9947, 'Alejandrina', 'Crespo', 43, 2147483647, 153000, 4000000, 1820799),
(9948, 'sjayan', 'nishad', 30, 3333, 4, 0, 0),
(9949, 'sjayan', 'nishad', 30, 3333, 4, 0, 0),
(9950, 'sjayan', 'nishad', 30, 3333, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loans_data`
--

CREATE TABLE `loans_data` (
  `customer_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `loan_amount` int(11) NOT NULL,
  `tenure` int(11) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `monthly_payment` int(11) NOT NULL,
  `emis_paid_on_time` int(11) NOT NULL,
  `date_of_approval` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans_data`
--

INSERT INTO `loans_data` (`customer_id`, `loan_id`, `loan_amount`, `tenure`, `interest_rate`, `monthly_payment`, `emis_paid_on_time`, `date_of_approval`, `end_date`) VALUES
(2, 5607, 400000, 81, 13.16, 10369, 64, '0000-00-00', '0000-00-00'),
(12, 2108, 800000, 120, 9.14, 15986, 104, '0000-00-00', '0000-00-00'),
(14, 5930, 900000, 129, 8.20, 15344, 114, '0000-00-00', '0000-00-00'),
(15, 4439, 900000, 105, 8.87, 16917, 64, '0000-00-00', '0000-00-00'),
(21, 1548, 600000, 102, 17.89, 21947, 65, '0000-00-00', '0000-00-00'),
(24, 6592, 300000, 147, 8.37, 5354, 93, '0000-00-00', '0000-00-00'),
(28, 5152, 200000, 147, 12.39, 5526, 126, '0000-00-00', '0000-00-00'),
(29, 8977, 200000, 21, 17.07, 11150, 19, '0000-00-00', '0000-00-00'),
(35, 9640, 600000, 129, 11.83, 14228, 122, '0000-00-00', '0000-00-00'),
(53, 8321, 100000, 177, 9.59, 2036, 123, '0000-00-00', '0000-00-00'),
(68, 6701, 500000, 171, 12.72, 15631, 160, '0000-00-00', '0000-00-00'),
(70, 1438, 500000, 57, 17.52, 16732, 56, '0000-00-00', '0000-00-00'),
(74, 5639, 200000, 81, 10.59, 4517, 74, '0000-00-00', '0000-00-00'),
(84, 6700, 500000, 72, 17.63, 18397, 66, '0000-00-00', '0000-00-00'),
(93, 8532, 200000, 144, 13.03, 6039, 99, '0000-00-00', '0000-00-00'),
(105, 1313, 500000, 69, 13.21, 13475, 42, '0000-00-00', '0000-00-00'),
(107, 6719, 200000, 102, 10.15, 4249, 92, '0000-00-00', '0000-00-00'),
(113, 4722, 700000, 138, 15.36, 24425, 93, '0000-00-00', '0000-00-00'),
(125, 2826, 400000, 15, 9.79, 29277, 9, '0000-00-00', '0000-00-00'),
(129, 3792, 300000, 159, 9.55, 6176, 112, '0000-00-00', '0000-00-00'),
(133, 3832, 1000000, 9, 9.12, 111111, 6, '0000-00-00', '0000-00-00'),
(138, 8579, 200000, 159, 10.65, 4688, 141, '0000-00-00', '0000-00-00'),
(173, 2751, 200000, 81, 12.84, 5097, 50, '0000-00-00', '0000-00-00'),
(184, 4364, 200000, 126, 13.61, 5686, 118, '0000-00-00', '0000-00-00'),
(186, 2767, 500000, 150, 16.78, 21444, 111, '0000-00-00', '0000-00-00'),
(187, 4207, 200000, 120, 17.10, 8080, 74, '0000-00-00', '0000-00-00'),
(191, 1039, 600000, 63, 14.52, 18759, 63, '0000-00-00', '0000-00-00'),
(202, 2459, 600000, 105, 15.98, 18708, 87, '0000-00-00', '0000-00-00'),
(209, 6917, 700000, 84, 10.42, 16678, 79, '0000-00-00', '0000-00-00'),
(215, 7879, 800000, 177, 13.55, 26775, 152, '0000-00-00', '0000-00-00'),
(223, 3363, 700000, 120, 14.01, 21644, 99, '0000-00-00', '0000-00-00'),
(229, 4648, 700000, 18, 12.57, 43777, 13, '0000-00-00', '0000-00-00'),
(240, 1336, 800000, 162, 12.03, 21623, 93, '0000-00-00', '0000-00-00'),
(241, 5189, 400000, 153, 10.72, 8873, 133, '0000-00-00', '0000-00-00'),
(244, 7997, 400000, 135, 12.10, 10408, 81, '0000-00-00', '0000-00-00'),
(250, 7023, 500000, 81, 16.79, 15665, 57, '0000-00-00', '0000-00-00'),
(251, 6957, 600000, 90, 16.14, 19001, 56, '0000-00-00', '0000-00-00'),
(258, 8659, 500000, 63, 9.65, 12580, 60, '0000-00-00', '0000-00-00'),
(260, 9996, 600000, 90, 18.00, 21236, 59, '0000-00-00', '0000-00-00'),
(265, 8112, 500000, 54, 16.06, 16800, 35, '0000-00-00', '0000-00-00'),
(270, 2941, 300000, 3, 13.46, 100000, 3, '0000-00-00', '0000-00-00'),
(276, 3056, 400000, 141, 16.32, 14964, 99, '0000-00-00', '0000-00-00'),
(280, 1787, 600000, 132, 16.87, 25253, 88, '0000-00-00', '0000-00-00'),
(288, 1151, 900000, 24, 17.01, 51343, 19, '0000-00-00', '0000-00-00'),
(290, 3301, 800000, 108, 14.55, 25155, 86, '0000-00-00', '0000-00-00'),
(295, 7102, 600000, 120, 12.89, 16808, 105, '0000-00-00', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_data`
--
ALTER TABLE `customer_data`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `loans_data`
--
ALTER TABLE `loans_data`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_data`
--
ALTER TABLE `customer_data`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9951;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
