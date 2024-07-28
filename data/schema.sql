-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2024 at 08:10 PM
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
-- Database: `users_club`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `club_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_date` date DEFAULT current_timestamp(),
  `club_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`club_id`, `name`, `description`, `create_date`, `club_code`) VALUES
(21, 'Tech Innovators', 'A club for technology enthusiasts and innovators.', '2024-07-28', 'TECH01'),
(22, 'Art Masters', 'A community for artists and art lovers.', '2024-07-28', 'ART02'),
(23, 'Sports Fanatics', 'For people who are passionate about various sports.', '2024-07-28', 'SPORT03'),
(24, 'Book Worms', 'A club for avid readers and book lovers.', '2024-07-28', 'BOOK04'),
(25, 'Music Lovers', 'For those who enjoy all genres of music.', '2024-07-28', 'MUSIC05'),
(26, 'Movie Buffs', 'A group for movie enthusiasts and critics.', '2024-07-28', 'MOVIE06'),
(27, 'Fitness Freaks', 'For individuals interested in fitness and health.', '2024-07-28', 'FITNESS07'),
(28, 'Travel Junkies', 'For those who love to travel and explore new places.', '2024-07-28', 'TRAVEL08'),
(29, 'Foodies', 'A club for those who love trying and making new foods.', '2024-07-28', 'FOOD09'),
(30, 'Gaming Geeks', 'For gamers of all kinds and levels.', '2024-07-28', 'GAMING10'),
(31, 'Science Explorers', 'For individuals passionate about scientific discoveries.', '2024-07-28', 'SCIENCE11'),
(32, 'History Buffs', 'A community for those interested in history.', '2024-07-28', 'HISTORY12'),
(33, 'Nature Enthusiasts', 'For those who love nature and the outdoors.', '2024-07-28', 'NATURE13'),
(34, 'Fashionistas', 'A club for fashion and style aficionados.', '2024-07-28', 'FASHION14'),
(35, 'Photography Club', 'For photographers and those interested in photography.', '2024-07-28', 'PHOTO15'),
(36, 'Entrepreneurs', 'A group for aspiring and current entrepreneurs.', '2024-07-28', 'ENTRE16'),
(37, 'Language Learners', 'For those who want to learn and practice new languages.', '2024-07-28', 'LANG17'),
(38, 'Environmentalists', 'A club focused on environmental issues and sustainability.', '2024-07-28', 'ENVIRON18'),
(39, 'DIY Enthusiasts', 'For people who enjoy do-it-yourself projects.', '2024-07-28', 'DIY19'),
(40, 'Philosophers', 'A group for discussing philosophical topics and ideas.', '2024-07-28', 'PHIL20'),
(41, 'Tech Startups', 'For startups and entrepreneurs in the tech industry.', '2024-07-28', 'START21'),
(42, 'Animal Lovers', 'A club for people who love animals and pets.', '2024-07-28', 'ANIMAL22'),
(43, 'Health Advocates', 'For those interested in health and wellness.', '2024-07-28', 'HEALTH23'),
(44, 'Young Professionals', 'A group for young professionals across various industries.', '2024-07-28', 'PROF24'),
(45, 'Film Critics', 'For those who analyze and critique films.', '2024-07-28', 'CRIT25'),
(46, 'Culinary Arts', 'For those passionate about cooking and culinary arts.', '2024-07-28', 'CULINARY26'),
(47, 'Startup Founders', 'A club for founders of startups and small businesses.', '2024-07-28', 'FOUNDER27'),
(48, 'Adventure Seekers', 'For individuals who love adventurous activities.', '2024-07-28', 'ADVENTURE28'),
(49, 'Social Activists', 'A group focused on social justice and activism.', '2024-07-28', 'ACTIVIST29'),
(50, 'Wine Tasters', 'For those who enjoy tasting and discussing wines.', '2024-07-28', 'WINE30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `is_admin` int(11) DEFAULT 0,
  `create_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `password`, `is_admin`, `create_date`) VALUES
(1, 'user1', 'Alice Smith', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(2, 'user2', 'Bob Johnson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(3, 'user3', 'Charlie Brown', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(4, 'user4', 'David Wilson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(5, 'user5', 'Emily Davis', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(6, 'user6', 'Frank Miller', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(7, 'user7', 'Grace Lee', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(8, 'user8', 'Hannah Taylor', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(9, 'user9', 'Ivy Anderson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(10, 'user10', 'Jack Thomas', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(11, 'user11', 'Kaitlyn Moore', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(12, 'user12', 'Liam Jackson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(13, 'user13', 'Mia White', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(14, 'user14', 'Noah Harris', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(15, 'user15', 'Olivia Clark', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(16, 'user16', 'Paul Lewis', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(17, 'user17', 'Quinn Walker', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(18, 'user18', 'Rachel Hall', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(19, 'user19', 'Samuel Allen', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(20, 'user20', 'Tina Young', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(21, 'user21', 'Ulysses King', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(22, 'user22', 'Vera Scott', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(23, 'user23', 'Willow Wright', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(24, 'user24', 'Xander Martinez', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(25, 'user25', 'Yara Robinson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(26, 'user26', 'Zane Carter', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(27, 'user27', 'Ava Green', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(28, 'user28', 'Brady Adams', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(29, 'user29', 'Cameron Nelson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(30, 'user30', 'Diana Cooper', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(31, 'user31', 'Ethan Harris', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(32, 'user32', 'Fiona Rivera', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(33, 'user33', 'George Phillips', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(34, 'user34', 'Holly Sanders', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(35, 'user35', 'Ian Brooks', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(36, 'user36', 'Jasmine Ward', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(37, 'user37', 'Kurt Bennett', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(38, 'user38', 'Luna Cox', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(39, 'user39', 'Mason Richardson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(40, 'user40', 'Nora Mitchell', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(41, 'user41', 'Oscar Perry', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(42, 'user42', 'Paige Rogers', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(43, 'user43', 'Quincy Long', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(44, 'user44', 'Riley Gomez', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(45, 'user45', 'Sophie Murphy', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(46, 'user46', 'Tyler Foster', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(47, 'user47', 'Ursula Myers', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(48, 'user48', 'Victor Phillips', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(49, 'user49', 'Wendy Bryant', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(50, 'user50', 'Xena Alexander', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(51, 'user51', 'Yasmine Hughes', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(52, 'user52', 'Zachary Ward', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(53, 'user53', 'Amelia Rogers', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(54, 'y', 'yousif dahabra3', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 1, '2024-07-27'),
(55, 'user55', 'Catherine Bryant', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(56, 'user56', 'Daniel Hayes', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(57, 'user57', 'Ella Adams', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(58, 'user58', 'Frankie Young', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(59, 'user59', 'Gina Rivera', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(60, 'user60', 'Henry Morris', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(61, 'user61', 'Iris Cook', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(62, 'user62', 'John Hughes', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(63, 'user63', 'Kylie Bennett', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(64, 'user64', 'Liam Stewart', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(65, 'user65', 'Maggie Reed', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(66, 'user66', 'Nolan James', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(67, 'user67', 'Olive Collins', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(68, 'user68', 'Paul Evans', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(69, 'user69', 'Quinn Scott', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(70, 'user70', 'Rebecca Barnes', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(71, 'user71', 'Sam Taylor', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(72, 'user72', 'Tina Reed', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(73, 'user73', 'Ulysses Walker', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(74, 'user74', 'Vera Adams', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(75, 'user75', 'William Davis', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(76, 'user76', 'Xander Clark', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(77, 'user77', 'Yara Foster', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(78, 'user78', 'Zane Rogers', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(79, 'user79', 'Alice Scott', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(80, 'user80', 'Ben Wright', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(81, 'user81', 'Cara Turner', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(82, 'user82', 'Derek Hill', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(83, 'user83', 'Eve Parker', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(84, 'user84', 'Fred Adams', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(85, 'user85', 'Gina Ross', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(86, 'user86', 'Harry Scott', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(87, 'user87', 'Ivy Cooper', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(88, 'user88', 'Jack Murphy', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(89, 'user89', 'Kara Evans', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(90, 'user90', 'Liam Young', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(91, 'user91', 'Mona Scott', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(92, 'user92', 'Nate Foster', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(93, 'user93', 'Olivia Turner', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(94, 'user94', 'Pete Martinez', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(95, 'user95', 'Quincy Harris', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(96, 'user96', 'Rachel Lewis', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(97, 'user97', 'Sean Jackson', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(98, 'user98', 'Tara Perry', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(99, 'user99', 'Uma Brooks', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28'),
(100, 'user100', 'Vincent Hall', '$2b$12$B0x.3LxV940KUHz9zihZ/ONOu/YjZfKzOgNK80ZJrOjPVLH82/iIC', 0, '2024-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `user_club`
--

CREATE TABLE `user_club` (
  `user_club_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `club_code` varchar(255) DEFAULT NULL,
  `craete_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_club`
--

INSERT INTO `user_club` (`user_club_id`, `username`, `club_code`, `craete_date`) VALUES
(30, 'user1', 'TECH01', '2024-07-28'),
(31, 'user1', 'ART02', '2024-07-28'),
(32, 'user1', 'MUSIC05', '2024-07-28'),
(33, 'user2', 'SPORT03', '2024-07-28'),
(34, 'user2', 'FOOD09', '2024-07-28'),
(35, 'user2', 'GAMING10', '2024-07-28'),
(36, 'user3', 'BOOK04', '2024-07-28'),
(37, 'user3', 'NATURE13', '2024-07-28'),
(38, 'user3', 'PHIL20', '2024-07-28'),
(39, 'user4', 'TECH01', '2024-07-28'),
(40, 'user4', 'FITNESS07', '2024-07-28'),
(41, 'user4', 'LANG17', '2024-07-28'),
(42, 'user5', 'ART02', '2024-07-28'),
(43, 'user5', 'SCIENCE11', '2024-07-28'),
(44, 'user5', 'DIY19', '2024-07-28'),
(45, 'user6', 'SPORT03', '2024-07-28'),
(46, 'user6', 'HEALTH23', '2024-07-28'),
(47, 'user6', 'START21', '2024-07-28'),
(48, 'user7', 'BOOK04', '2024-07-28'),
(49, 'user7', 'PHOTOGRAPHY15', '2024-07-28'),
(50, 'user7', 'Culinary Arts26', '2024-07-28'),
(51, 'user8', 'MUSIC05', '2024-07-28'),
(52, 'user8', 'ENTRE16', '2024-07-28'),
(53, 'user8', 'ADVENTURE28', '2024-07-28'),
(54, 'user9', 'FITNESS07', '2024-07-28'),
(55, 'user9', 'PHIL20', '2024-07-28'),
(56, 'user9', 'WINE30', '2024-07-28'),
(57, 'user10', 'TECH01', '2024-07-28'),
(58, 'user10', 'FOOD09', '2024-07-28'),
(59, 'user10', 'ENVIRON18', '2024-07-28'),
(60, 'user11', 'ART02', '2024-07-28'),
(61, 'user11', 'BOOK04', '2024-07-28'),
(62, 'user11', 'MUSIC05', '2024-07-28'),
(63, 'user12', 'SPORT03', '2024-07-28'),
(64, 'user12', 'DIY19', '2024-07-28'),
(65, 'user12', 'TECH01', '2024-07-28'),
(66, 'user13', 'GAMING10', '2024-07-28'),
(67, 'user13', 'SCIENCE11', '2024-07-28'),
(68, 'user13', 'HEALTH23', '2024-07-28'),
(69, 'user14', 'LANG17', '2024-07-28'),
(70, 'user14', 'NATURE13', '2024-07-28'),
(71, 'user14', 'WINE30', '2024-07-28'),
(72, 'user15', 'ENTRE16', '2024-07-28'),
(73, 'user15', 'TECH01', '2024-07-28'),
(74, 'user15', 'BOOK04', '2024-07-28'),
(75, 'user16', 'PHIL20', '2024-07-28'),
(76, 'user16', 'ART02', '2024-07-28'),
(77, 'user16', 'FOOD09', '2024-07-28'),
(78, 'user17', 'FITNESS07', '2024-07-28'),
(79, 'user17', 'GAMING10', '2024-07-28'),
(80, 'user17', 'START21', '2024-07-28'),
(81, 'user18', 'MUSIC05', '2024-07-28'),
(82, 'user18', 'SCIENCE11', '2024-07-28'),
(83, 'user18', 'PHOTOGRAPHY15', '2024-07-28'),
(84, 'user19', 'ART02', '2024-07-28'),
(85, 'user19', 'TECH01', '2024-07-28'),
(86, 'user19', 'DIY19', '2024-07-28'),
(87, 'user20', 'SPORT03', '2024-07-28'),
(88, 'user20', 'FOOD09', '2024-07-28'),
(89, 'user20', 'NATURE13', '2024-07-28'),
(90, 'user21', 'LANG17', '2024-07-28'),
(91, 'user21', 'WINE30', '2024-07-28'),
(92, 'user21', 'PHIL20', '2024-07-28'),
(93, 'user22', 'ENTRE16', '2024-07-28'),
(94, 'user22', 'HEALTH23', '2024-07-28'),
(95, 'user22', 'ADVENTURE28', '2024-07-28'),
(96, 'user23', 'FITNESS07', '2024-07-28'),
(97, 'user23', 'TECH01', '2024-07-28'),
(98, 'user23', 'BOOK04', '2024-07-28'),
(99, 'user24', 'ART02', '2024-07-28'),
(100, 'user24', 'MUSIC05', '2024-07-28'),
(101, 'user24', 'PHIL20', '2024-07-28'),
(102, 'user25', 'GAMING10', '2024-07-28'),
(103, 'user25', 'DIY19', '2024-07-28'),
(104, 'user25', 'START21', '2024-07-28'),
(105, 'user26', 'FOOD09', '2024-07-28'),
(106, 'user26', 'SCIENCE11', '2024-07-28'),
(107, 'user26', 'PHOTOGRAPHY15', '2024-07-28'),
(108, 'user27', 'TECH01', '2024-07-28'),
(109, 'user27', 'ENTRE16', '2024-07-28'),
(110, 'user27', 'WINE30', '2024-07-28'),
(111, 'user28', 'ART02', '2024-07-28'),
(112, 'user28', 'HEALTH23', '2024-07-28'),
(113, 'user28', 'ADVENTURE28', '2024-07-28'),
(114, 'user29', 'FITNESS07', '2024-07-28'),
(115, 'user29', 'GAMING10', '2024-07-28'),
(116, 'user29', 'TECH01', '2024-07-28'),
(117, 'user30', 'BOOK04', '2024-07-28'),
(118, 'user30', 'MUSIC05', '2024-07-28'),
(119, 'user30', 'PHIL20', '2024-07-28'),
(120, 'user31', 'PHOTOGRAPHY15', '2024-07-28'),
(121, 'user31', 'FOOD09', '2024-07-28'),
(122, 'user31', 'TECH01', '2024-07-28'),
(123, 'user32', 'HEALTH23', '2024-07-28'),
(124, 'user32', 'LANG17', '2024-07-28'),
(125, 'user32', 'ART02', '2024-07-28'),
(126, 'user33', 'SCIENCE11', '2024-07-28'),
(127, 'user33', 'NATURE13', '2024-07-28'),
(128, 'user33', 'GAMING10', '2024-07-28'),
(129, 'user34', 'BOOK04', '2024-07-28'),
(130, 'user34', 'START21', '2024-07-28'),
(131, 'user34', 'DIY19', '2024-07-28'),
(132, 'user35', 'ADVENTURE28', '2024-07-28'),
(133, 'user35', 'TECH01', '2024-07-28'),
(134, 'user35', 'MUSIC05', '2024-07-28'),
(135, 'user36', 'FITNESS07', '2024-07-28'),
(136, 'user36', 'PHIL20', '2024-07-28'),
(137, 'user36', 'FOOD09', '2024-07-28'),
(138, 'user37', 'ART02', '2024-07-28'),
(139, 'user37', 'SCIENCE11', '2024-07-28'),
(140, 'user37', 'GAMING10', '2024-07-28'),
(141, 'user38', 'TECH01', '2024-07-28'),
(142, 'user38', 'NATURE13', '2024-07-28'),
(143, 'user38', 'WINE30', '2024-07-28'),
(144, 'user39', 'START21', '2024-07-28'),
(145, 'user39', 'HEALTH23', '2024-07-28'),
(146, 'user39', 'PHOTOGRAPHY15', '2024-07-28'),
(147, 'user40', 'FITNESS07', '2024-07-28'),
(148, 'user40', 'ADVENTURE28', '2024-07-28'),
(149, 'user40', 'BOOK04', '2024-07-28'),
(150, 'user41', 'LANG17', '2024-07-28'),
(151, 'user41', 'TECH01', '2024-07-28'),
(152, 'user41', 'MUSIC05', '2024-07-28'),
(153, 'user42', 'FOOD09', '2024-07-28'),
(154, 'user42', 'SCIENCE11', '2024-07-28'),
(155, 'user42', 'DIY19', '2024-07-28'),
(156, 'user43', 'PHIL20', '2024-07-28'),
(157, 'user43', 'FITNESS07', '2024-07-28'),
(158, 'user43', 'GAMING10', '2024-07-28'),
(159, 'user44', 'NATURE13', '2024-07-28'),
(160, 'user44', 'ART02', '2024-07-28'),
(161, 'user44', 'TECH01', '2024-07-28'),
(162, 'user45', 'PHOTOGRAPHY15', '2024-07-28'),
(163, 'user45', 'FOOD09', '2024-07-28'),
(164, 'user45', 'START21', '2024-07-28'),
(165, 'user46', 'SCIENCE11', '2024-07-28'),
(166, 'user46', 'MUSIC05', '2024-07-28'),
(167, 'user46', 'ADVENTURE28', '2024-07-28'),
(168, 'user47', 'BOOK04', '2024-07-28'),
(169, 'user47', 'WINE30', '2024-07-28'),
(170, 'user47', 'HEALTH23', '2024-07-28'),
(171, 'user48', 'TECH01', '2024-07-28'),
(172, 'user48', 'GAMING10', '2024-07-28'),
(173, 'user48', 'DIY19', '2024-07-28'),
(174, 'user49', 'FOOD09', '2024-07-28'),
(175, 'user49', 'PHIL20', '2024-07-28'),
(176, 'user49', 'FITNESS07', '2024-07-28'),
(177, 'user50', 'MUSIC05', '2024-07-28'),
(178, 'user50', 'START21', '2024-07-28'),
(179, 'user50', 'NATURE13', '2024-07-28'),
(180, 'user51', 'FOOD09', '2024-07-28'),
(181, 'user51', 'PHOTOGRAPHY15', '2024-07-28'),
(182, 'user51', 'START21', '2024-07-28'),
(183, 'user51', 'BOOK04', '2024-07-28'),
(184, 'user51', 'WINE30', '2024-07-28'),
(185, 'user52', 'NATURE13', '2024-07-28'),
(186, 'user52', 'ADVENTURE28', '2024-07-28'),
(187, 'user52', 'DIY19', '2024-07-28'),
(188, 'user52', 'HEALTH23', '2024-07-28'),
(189, 'user52', 'TECH01', '2024-07-28'),
(190, 'user53', 'MUSIC05', '2024-07-28'),
(191, 'user53', 'PHIL20', '2024-07-28'),
(192, 'user53', 'GAMING10', '2024-07-28'),
(193, 'user53', 'SCIENCE11', '2024-07-28'),
(194, 'user53', 'FOOD09', '2024-07-28'),
(195, 'user54', 'ART02', '2024-07-28'),
(196, 'user54', 'START21', '2024-07-28'),
(197, 'user54', 'DIY19', '2024-07-28'),
(198, 'user54', 'PHOTOGRAPHY15', '2024-07-28'),
(199, 'user54', 'HEALTH23', '2024-07-28'),
(200, 'user55', 'WINE30', '2024-07-28'),
(201, 'user55', 'MUSIC05', '2024-07-28'),
(202, 'user55', 'TECH01', '2024-07-28'),
(203, 'user55', 'GAMING10', '2024-07-28'),
(204, 'user55', 'ART02', '2024-07-28'),
(205, 'user56', 'NATURE13', '2024-07-28'),
(206, 'user56', 'FOOD09', '2024-07-28'),
(207, 'user56', 'ADVENTURE28', '2024-07-28'),
(208, 'user56', 'MUSIC05', '2024-07-28'),
(209, 'user56', 'WINE30', '2024-07-28'),
(210, 'user57', 'HEALTH23', '2024-07-28'),
(211, 'user57', 'SCIENCE11', '2024-07-28'),
(212, 'user57', 'BOOK04', '2024-07-28'),
(213, 'user57', 'PHIL20', '2024-07-28'),
(214, 'user57', 'ART02', '2024-07-28'),
(215, 'user58', 'START21', '2024-07-28'),
(216, 'user58', 'DIY19', '2024-07-28'),
(217, 'user58', 'TECH01', '2024-07-28'),
(218, 'user58', 'GAMING10', '2024-07-28'),
(219, 'user58', 'NATURE13', '2024-07-28'),
(220, 'user59', 'FOOD09', '2024-07-28'),
(221, 'user59', 'PHOTOGRAPHY15', '2024-07-28'),
(222, 'user59', 'WINE30', '2024-07-28'),
(223, 'user59', 'ART02', '2024-07-28'),
(224, 'user59', 'ADVENTURE28', '2024-07-28'),
(225, 'user60', 'DIY19', '2024-07-28'),
(226, 'user60', 'HEALTH23', '2024-07-28'),
(227, 'user60', 'START21', '2024-07-28'),
(228, 'user60', 'MUSIC05', '2024-07-28'),
(229, 'user60', 'SCIENCE11', '2024-07-28'),
(230, 'user61', 'FOOD09', '2024-07-28'),
(231, 'user62', 'PHOTOGRAPHY15', '2024-07-28'),
(232, 'user63', 'START21', '2024-07-28'),
(233, 'user64', 'BOOK04', '2024-07-28'),
(234, 'user65', 'WINE30', '2024-07-28'),
(235, 'user66', 'NATURE13', '2024-07-28'),
(236, 'user67', 'ADVENTURE28', '2024-07-28'),
(237, 'user68', 'DIY19', '2024-07-28'),
(238, 'user69', 'HEALTH23', '2024-07-28'),
(239, 'user70', 'TECH01', '2024-07-28'),
(240, 'user71', 'MUSIC05', '2024-07-28'),
(241, 'user72', 'PHIL20', '2024-07-28'),
(242, 'user73', 'GAMING10', '2024-07-28'),
(243, 'user74', 'SCIENCE11', '2024-07-28'),
(244, 'user75', 'ART02', '2024-07-28'),
(245, 'user76', 'FOOD09', '2024-07-28'),
(246, 'user77', 'PHOTOGRAPHY15', '2024-07-28'),
(247, 'user78', 'START21', '2024-07-28'),
(248, 'user79', 'BOOK04', '2024-07-28'),
(249, 'user80', 'WINE30', '2024-07-28'),
(250, 'user81', 'NATURE13', '2024-07-28'),
(251, 'user82', 'ADVENTURE28', '2024-07-28'),
(252, 'user83', 'DIY19', '2024-07-28'),
(253, 'user84', 'HEALTH23', '2024-07-28'),
(254, 'user85', 'TECH01', '2024-07-28'),
(255, 'user86', 'MUSIC05', '2024-07-28'),
(256, 'user87', 'PHIL20', '2024-07-28'),
(257, 'user88', 'GAMING10', '2024-07-28'),
(258, 'user89', 'SCIENCE11', '2024-07-28'),
(259, 'user90', 'ART02', '2024-07-28'),
(260, 'user91', 'FOOD09', '2024-07-28'),
(261, 'user92', 'PHOTOGRAPHY15', '2024-07-28'),
(262, 'user93', 'START21', '2024-07-28'),
(263, 'user94', 'BOOK04', '2024-07-28'),
(264, 'user95', 'WINE30', '2024-07-28'),
(265, 'user96', 'NATURE13', '2024-07-28'),
(266, 'user97', 'ADVENTURE28', '2024-07-28'),
(267, 'user98', 'DIY19', '2024-07-28'),
(268, 'user99', 'HEALTH23', '2024-07-28'),
(269, 'user100', 'TECH01', '2024-07-28'),
(270, 'user1', 'BOOK04', '2024-07-28'),
(271, 'user1', 'SPORT03', '2024-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `user_followers`
--

CREATE TABLE `user_followers` (
  `follow_id` int(11) NOT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `craete_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_followers`
--

INSERT INTO `user_followers` (`follow_id`, `from_user`, `to_user`, `craete_date`) VALUES
(18, 'user1', 'user2', '2024-07-28'),
(19, 'user1', 'user3', '2024-07-28'),
(20, 'user2', 'user3', '2024-07-28'),
(21, 'user2', 'user4', '2024-07-28'),
(22, 'user3', 'user5', '2024-07-28'),
(23, 'user4', 'user6', '2024-07-28'),
(24, 'user5', 'user7', '2024-07-28'),
(25, 'user6', 'user8', '2024-07-28'),
(26, 'user7', 'user9', '2024-07-28'),
(27, 'user8', 'user10', '2024-07-28'),
(28, 'user9', 'user11', '2024-07-28'),
(29, 'user10', 'user12', '2024-07-28'),
(30, 'user11', 'user13', '2024-07-28'),
(31, 'user12', 'user14', '2024-07-28'),
(32, 'user13', 'user15', '2024-07-28'),
(33, 'user14', 'user16', '2024-07-28'),
(34, 'user15', 'user17', '2024-07-28'),
(35, 'user16', 'user18', '2024-07-28'),
(36, 'user17', 'user19', '2024-07-28'),
(37, 'user18', 'user20', '2024-07-28'),
(38, 'user19', 'user21', '2024-07-28'),
(39, 'user20', 'user22', '2024-07-28'),
(40, 'user21', 'user23', '2024-07-28'),
(41, 'user22', 'user24', '2024-07-28'),
(42, 'user23', 'user25', '2024-07-28'),
(43, 'user24', 'user26', '2024-07-28'),
(44, 'user25', 'user27', '2024-07-28'),
(45, 'user26', 'user28', '2024-07-28'),
(46, 'user27', 'user29', '2024-07-28'),
(47, 'user28', 'user30', '2024-07-28'),
(48, 'user29', 'user31', '2024-07-28'),
(49, 'user30', 'user32', '2024-07-28'),
(50, 'user31', 'user33', '2024-07-28'),
(51, 'user32', 'user34', '2024-07-28'),
(52, 'user33', 'user35', '2024-07-28'),
(53, 'user34', 'user36', '2024-07-28'),
(54, 'user35', 'user37', '2024-07-28'),
(55, 'user36', 'user38', '2024-07-28'),
(56, 'user37', 'user39', '2024-07-28'),
(57, 'user38', 'user40', '2024-07-28'),
(58, 'user39', 'user41', '2024-07-28'),
(59, 'user40', 'user42', '2024-07-28'),
(60, 'user41', 'user43', '2024-07-28'),
(61, 'user42', 'user44', '2024-07-28'),
(62, 'user43', 'user45', '2024-07-28'),
(63, 'user44', 'user46', '2024-07-28'),
(64, 'user45', 'user47', '2024-07-28'),
(65, 'user46', 'user48', '2024-07-28'),
(66, 'user47', 'user49', '2024-07-28'),
(67, 'user48', 'user50', '2024-07-28'),
(68, 'user49', 'user51', '2024-07-28'),
(69, 'user50', 'user52', '2024-07-28'),
(70, 'user51', 'user53', '2024-07-28'),
(71, 'user52', 'user54', '2024-07-28'),
(72, 'user53', 'user55', '2024-07-28'),
(73, 'user54', 'user56', '2024-07-28'),
(74, 'user55', 'user57', '2024-07-28'),
(75, 'user56', 'user58', '2024-07-28'),
(76, 'user57', 'user59', '2024-07-28'),
(77, 'user58', 'user60', '2024-07-28'),
(78, 'user59', 'user61', '2024-07-28'),
(79, 'user60', 'user62', '2024-07-28'),
(80, 'user61', 'user63', '2024-07-28'),
(81, 'user62', 'user64', '2024-07-28'),
(82, 'user63', 'user65', '2024-07-28'),
(83, 'user64', 'user66', '2024-07-28'),
(84, 'user65', 'user67', '2024-07-28'),
(85, 'user66', 'user68', '2024-07-28'),
(86, 'user67', 'user69', '2024-07-28'),
(87, 'user68', 'user70', '2024-07-28'),
(88, 'user69', 'user71', '2024-07-28'),
(89, 'user70', 'user72', '2024-07-28'),
(90, 'user71', 'user73', '2024-07-28'),
(91, 'user72', 'user74', '2024-07-28'),
(92, 'user73', 'user75', '2024-07-28'),
(93, 'user74', 'user76', '2024-07-28'),
(94, 'user75', 'user77', '2024-07-28'),
(95, 'user76', 'user78', '2024-07-28'),
(96, 'user77', 'user79', '2024-07-28'),
(97, 'user78', 'user80', '2024-07-28'),
(98, 'user79', 'user81', '2024-07-28'),
(99, 'user80', 'user82', '2024-07-28'),
(100, 'user81', 'user83', '2024-07-28'),
(101, 'user82', 'user84', '2024-07-28'),
(102, 'user83', 'user85', '2024-07-28'),
(103, 'user84', 'user86', '2024-07-28'),
(104, 'user85', 'user87', '2024-07-28'),
(105, 'user86', 'user88', '2024-07-28'),
(106, 'user87', 'user89', '2024-07-28'),
(107, 'user88', 'user90', '2024-07-28'),
(108, 'user89', 'user91', '2024-07-28'),
(109, 'user90', 'user92', '2024-07-28'),
(110, 'user91', 'user93', '2024-07-28'),
(111, 'user92', 'user94', '2024-07-28'),
(112, 'user93', 'user95', '2024-07-28'),
(113, 'user94', 'user96', '2024-07-28'),
(114, 'user95', 'user97', '2024-07-28'),
(115, 'user96', 'user98', '2024-07-28'),
(116, 'user97', 'user99', '2024-07-28'),
(117, 'user98', 'user100', '2024-07-28'),
(118, 'user99', 'user1', '2024-07-28'),
(119, 'user100', 'user2', '2024-07-28'),
(120, 'user1', 'user11', '2024-07-28'),
(121, 'user2', 'user12', '2024-07-28'),
(122, 'user3', 'user13', '2024-07-28'),
(123, 'user4', 'user14', '2024-07-28'),
(124, 'user5', 'user15', '2024-07-28'),
(125, 'user6', 'user16', '2024-07-28'),
(126, 'user7', 'user17', '2024-07-28'),
(127, 'user8', 'user18', '2024-07-28'),
(128, 'user9', 'user19', '2024-07-28'),
(129, 'user10', 'user20', '2024-07-28'),
(130, 'user11', 'user21', '2024-07-28'),
(131, 'user12', 'user22', '2024-07-28'),
(132, 'user13', 'user23', '2024-07-28'),
(133, 'user14', 'user24', '2024-07-28'),
(134, 'user15', 'user25', '2024-07-28'),
(135, 'user16', 'user26', '2024-07-28'),
(136, 'user17', 'user27', '2024-07-28'),
(137, 'user18', 'user28', '2024-07-28'),
(138, 'user19', 'user29', '2024-07-28'),
(139, 'user20', 'user30', '2024-07-28'),
(140, 'user21', 'user31', '2024-07-28'),
(141, 'user22', 'user32', '2024-07-28'),
(142, 'user23', 'user33', '2024-07-28'),
(143, 'user24', 'user34', '2024-07-28'),
(144, 'user25', 'user35', '2024-07-28'),
(145, 'user26', 'user36', '2024-07-28'),
(146, 'user27', 'user37', '2024-07-28'),
(147, 'user28', 'user38', '2024-07-28'),
(148, 'user29', 'user39', '2024-07-28'),
(149, 'user30', 'user40', '2024-07-28'),
(150, 'user31', 'user41', '2024-07-28'),
(151, 'user32', 'user42', '2024-07-28'),
(152, 'user33', 'user43', '2024-07-28'),
(153, 'user34', 'user44', '2024-07-28'),
(154, 'user35', 'user45', '2024-07-28'),
(155, 'user36', 'user46', '2024-07-28'),
(156, 'user37', 'user47', '2024-07-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`club_id`),
  ADD UNIQUE KEY `clube_code` (`club_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_club`
--
ALTER TABLE `user_club`
  ADD PRIMARY KEY (`user_club_id`),
  ADD UNIQUE KEY `user_club` (`username`,`club_code`);

--
-- Indexes for table `user_followers`
--
ALTER TABLE `user_followers`
  ADD PRIMARY KEY (`follow_id`),
  ADD UNIQUE KEY `followers` (`from_user`,`to_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `user_club`
--
ALTER TABLE `user_club`
  MODIFY `user_club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `user_followers`
--
ALTER TABLE `user_followers`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
