-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 02:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `optionA` varchar(100) NOT NULL,
  `optionB` varchar(100) NOT NULL,
  `optionC` varchar(100) NOT NULL,
  `optionD` varchar(100) NOT NULL,
  `correctOption` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `optionA`, `optionB`, `optionC`, `optionD`, `correctOption`, `category`) VALUES
(1, 'Which of the following is a German brand', 'Ford', 'Volkswagen', 'Toyota', 'Hyundai', 'Volkswagen', 'automobile'),
(2, 'Where does Ford belong to', 'Germany', 'Japan', 'Korea', 'America', 'America', 'automobile'),
(3, 'Which type of state is Pakistan', 'Secular', 'Communist', 'Dictatorship', 'Democratic', 'Democratic', 'pakistan'),
(4, '2nd highest mountain peak in Pakistan is', 'RakaPoshi', 'NangaParbat', 'Makra', 'MalkaParbat', 'NangaParbat', 'pakistan'),
(5, 'Which is the capital of South Korea', 'Munich', 'Amsterdam', 'Monaco', 'Seoul', 'Seoul', 'geography'),
(6, 'Which country owns biggest trade canal', 'Egypt', 'Mexico', 'Denmark', 'Israel', 'Egypt', 'geography'),
(7, 'Which is highest selling japanese car:', 'Honda Civic', 'Nissan Sentra', 'Toyota Corolla', 'Mazda 6', 'Toyota Corolla', 'automobile'),
(8, 'What is the name of valley beside Kunhaar River?', 'Kaghan Valley', 'Hunza Valley', 'Swat Valley', 'Neelum Valley', 'Kaghan Valley', 'pakistan'),
(9, 'Largest ocean is:', 'Atlantic', 'Pacific', 'Indian', 'Arctic', 'Pacific', 'geography'),
(10, 'Which is the biggest religion in world?', 'Islam', 'Christianity', 'Hinduism', 'Jewism', 'Christianity', 'geography'),
(11, 'Which team won the first PSL?', 'Quetta Gladiators', 'Islamabad United', 'Karachi Kings', 'Peshawar Zalmi', 'Islamabad United', 'pakistan'),
(12, 'Which one is not part of General Motors (GM)', 'Buick', 'Cadillac', 'Chevrolet', 'Chrysler', 'Chrysler', 'automobile'),
(13, 'The biggest auto manufacturer group (sales wise)  is?', 'Volkswagon Group', 'Toyota Group', 'General Motors Group', 'Stellantis Group', 'Toyota Group', 'automobile'),
(16, 'Which brand makes costliest cars?', 'Mercedes Maybach', 'Genesis', 'Rolls Royce', 'Bentley', 'Rolls Royce', 'automobile'),
(17, 'Which is the parent company of Genesis', 'Hyundai', 'Volkswagon', 'Toyota', 'Volvo', 'Hyundai', 'automobile'),
(18, 'Which of the following super car brands is not Italian?', 'Lamborghini', 'Ferrari', 'Pagani', 'Buggati', 'Buggati', 'automobile'),
(19, 'Which is three times prime minister of Pakistan?', 'BeNazeer Bhutto', 'Asif Zardari', 'Parvez Musharaf', 'Nawaz Shareef', 'Nawaz Shareef', 'pakistan'),
(20, 'Who created the national anthem of Pakistan?', 'Altaf Hussain Hali', 'Allama Muhammad Iqbal', 'Sufi Tabassum', 'Hafeez Jalandhari', 'Hafeez Jalandhari', 'pakistan'),
(21, 'When did Pakistan Cricket Team won T20 World Cup?', '2007', '2008', '2009', '2010', '2009', 'pakistan'),
(22, 'Size of Pakistan Army is?', '560000', '470500', '723000', '646000', '560000', 'pakistan'),
(24, 'Which is 2nd biggest country w.r.t area?', 'Canada', 'USA', 'China', 'Brazil', 'Canada', 'geography'),
(25, 'Hitler was:', 'French', 'German', 'British', 'Italian', 'German', 'geography'),
(26, 'Niagara Falls is in:', 'America', 'Canada', 'Netherlands', 'Mexico', 'Canada', 'geography'),
(28, 'Drivetrain of Toyota Mark X is:', 'Front Wheel Drive', 'Rear Wheel Drive', 'All Wheel Drive', '4*4', 'Rear Wheel Drive', 'automobile');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
