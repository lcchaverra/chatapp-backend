-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-01-2025 a las 17:40:11
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kuepa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `is_moderator` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `content`, `is_moderator`, `created_at`) VALUES
(1, 1, '¡Hola a todos!', 0, '2025-01-15 16:20:40'),
(2, 1, '¡Hola a todos!', 0, '2025-01-15 16:41:24'),
(3, 1, '¡Hola a todos!', 0, '2025-01-15 16:42:01'),
(4, 1, 'asdasd', 0, '2025-01-15 16:44:58'),
(5, 1, 'asdasd', 0, '2025-01-15 16:52:27'),
(6, 1, 'asdas', 0, '2025-01-15 17:04:01'),
(7, 1, 'gdfhfgh', 0, '2025-01-15 17:04:02'),
(8, 1, 'bnmbnm', 0, '2025-01-15 17:04:03'),
(9, 1, 'Zx', 0, '2025-01-15 17:04:04'),
(10, 1, 'qweqwe', 0, '2025-01-15 17:04:05'),
(11, 1, 'rtytru', 0, '2025-01-15 17:04:06'),
(12, 1, 'hola soy goku tatiano', 0, '2025-01-15 17:20:54'),
(13, 1, 'asdasd', 0, '2025-01-15 17:21:07'),
(14, 2, 'asd', 0, '2025-01-15 17:21:36'),
(15, 2, 'sdfgsdfg', 0, '2025-01-15 17:21:40'),
(16, 2, 'sdfsdf', 0, '2025-01-15 17:25:53'),
(17, 2, 'ghkjhjk', 0, '2025-01-15 17:25:55'),
(18, 0, 'asdasdasdcxvxcvxcv', 0, '2025-01-15 17:27:09'),
(19, 0, 'jkljkljl', 0, '2025-01-15 17:27:11'),
(20, 0, 'jkljkjk', 0, '2025-01-15 17:27:24'),
(21, 0, 'assadds', 0, '2025-01-15 17:27:27'),
(22, 0, 'fg', 0, '2025-01-15 17:27:58'),
(23, 0, 'jkljklkjlklj', 0, '2025-01-15 17:27:59'),
(24, 0, 'ertertre', 0, '2025-01-15 17:28:01'),
(25, 0, 'ertert', 0, '2025-01-15 17:28:02'),
(26, 0, 'ghjghjghjghjghjghjghjghjghjghjghjghjghjghjghjghj', 0, '2025-01-15 17:28:04'),
(27, 1, 'ghjghj', 0, '2025-01-15 17:28:23'),
(28, 1, 'jlñklñk', 0, '2025-01-15 17:28:24'),
(29, 0, 'assad', 0, '2025-01-15 17:29:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','moderator') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Juan Pérez', 'juan123', '$2b$10$dDuYlc06681zThU98wZ81uhH5mGhwehVXnXUo3MdDtalW0t2jYfUC', 'student', '2025-01-15 15:56:47'),
(2, 'Luis Carlos Chaverra Córdoba', 'lcchaverra', '$2b$10$sYmnKOuBQbHZ4M7NmHH97OQBNvz1J6ACFVZKy.6D8Co/BNxMsEYTa', 'moderator', '2025-01-15 16:03:20'),
(3, 'Dominga Cordoba Trejos', 'dominga1', '$2b$10$atfZHJ9ChamX2qdqHZ8LfuS78ZbCxOBKPT4F8JJkxVnkw29fdSSAe', 'student', '2025-01-15 16:03:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
