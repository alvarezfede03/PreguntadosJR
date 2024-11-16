-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 00:16:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `preguntadosjr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

CREATE TABLE `partidas` (
  `id_partida` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_ultima_pregunta` int(11) DEFAULT NULL,
  `resultado` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `hora_pregunta_recibida` time DEFAULT NULL,
  `terminada` enum('si','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id_partida`, `id_jugador`, `id_ultima_pregunta`, `resultado`, `fecha_creacion`, `hora_pregunta_recibida`, `terminada`) VALUES
(124, 7, NULL, '0', '2024-11-08 18:07:37', NULL, 'si'),
(125, 7, NULL, '0', '2024-11-08 18:08:51', NULL, 'si'),
(126, 7, NULL, '0', '2024-11-08 18:10:05', NULL, 'si'),
(127, 7, NULL, '0', '2024-11-08 18:14:20', NULL, 'si'),
(128, 7, 17, '0', '2024-11-08 18:15:40', '18:17:31', 'si'),
(129, 7, 6, '0', '2024-11-08 18:17:44', '18:19:04', 'si'),
(130, 7, 45, '0', '2024-11-08 18:27:40', '18:27:40', 'si'),
(131, 7, 9, '0', '2024-11-08 18:30:16', '18:30:16', 'si'),
(132, 7, 56, '1', '2024-11-08 18:32:19', '18:32:19', 'si'),
(133, 7, 16, '1', '2024-11-08 18:34:54', '18:34:54', 'si'),
(134, 7, 14, '0', '2024-11-08 18:36:30', '18:36:30', 'si'),
(135, 7, 14, '1', '2024-11-08 18:37:01', '18:37:01', 'si'),
(136, 7, 36, '1', '2024-11-08 18:39:02', '18:39:02', 'si'),
(137, 7, 56, '0', '2024-11-08 18:40:42', '18:40:42', 'si'),
(138, 7, 22, '1', '2024-11-08 18:40:58', '18:41:15', 'si'),
(139, 7, 39, '0', '2024-11-08 18:41:20', '18:41:20', 'si'),
(140, 7, 36, '0', '2024-11-08 18:41:29', '18:41:29', 'si'),
(141, 7, 63, '0', '2024-11-08 18:41:42', '18:41:42', 'si'),
(142, 7, 39, '1', '2024-11-08 18:41:51', '18:42:05', 'si'),
(143, 7, 48, '0', '2024-11-08 18:42:30', '18:42:30', 'si'),
(144, 7, 25, '0', '2024-11-08 18:44:05', '18:44:05', 'si'),
(145, 7, 33, '1', '2024-11-08 18:44:09', '18:44:25', 'si'),
(146, 7, 33, '1', '2024-11-08 18:44:39', '18:44:39', 'si'),
(147, 7, 7, '0', '2024-11-08 18:46:06', '18:46:06', 'si'),
(148, 7, 11, '0', '2024-11-08 18:46:10', '18:46:10', 'si'),
(149, 7, 35, '1', '2024-11-08 18:46:13', '18:49:48', 'si'),
(150, 7, 18, '0', '2024-11-08 18:50:02', '18:50:02', 'si'),
(151, 7, 31, '1', '2024-11-08 18:50:05', '18:50:05', 'si'),
(152, 7, 27, '0', '2024-11-08 18:51:32', '18:51:32', 'si'),
(153, 7, 14, '1', '2024-11-08 18:51:37', '18:51:37', 'si'),
(154, 7, 7, '4', '2024-11-08 18:52:43', '18:53:11', 'si'),
(155, 7, 56, '1', '2024-11-08 18:55:49', '18:55:49', 'si'),
(156, 7, 40, '2', '2024-11-08 18:56:45', '18:56:56', 'si'),
(157, 7, 25, '0', '2024-11-08 18:57:10', '18:57:10', 'si'),
(158, 7, 46, '0', '2024-11-08 19:34:30', '19:34:30', 'si'),
(159, 7, 39, '2', '2024-11-08 19:34:46', '15:42:55', 'si'),
(160, 7, 5, '0', '2024-11-10 15:48:02', '15:48:02', 'si'),
(161, 7, 55, '1', '2024-11-10 15:48:07', '15:48:07', 'si'),
(162, 7, 29, '0', '2024-11-10 15:49:12', '15:49:12', 'si'),
(163, 7, 7, '0', '2024-11-10 15:49:24', '15:49:24', 'si'),
(164, 7, 48, '1', '2024-11-10 15:49:29', '15:49:41', 'si'),
(165, 7, 38, '0', '2024-11-10 15:50:41', '15:50:41', 'si'),
(166, 7, 20, '3', '2024-11-10 15:51:59', '15:52:29', 'si'),
(167, 7, 50, '0', '2024-11-10 15:58:39', '15:58:39', 'si'),
(168, 7, 25, '1', '2024-11-10 15:58:54', '15:58:54', 'si'),
(169, 7, 23, '0', '2024-11-10 16:00:31', '16:00:31', 'si'),
(170, 7, 52, '1', '2024-11-10 16:00:45', '16:00:45', 'si'),
(171, 7, NULL, '0', '2024-11-10 16:05:28', NULL, 'si'),
(172, 7, NULL, '0', '2024-11-10 16:05:33', NULL, 'si'),
(173, 7, NULL, '0', '2024-11-10 16:05:48', NULL, 'si'),
(174, 7, NULL, '0', '2024-11-10 16:06:39', NULL, 'si'),
(175, 7, 21, '1', '2024-11-10 16:06:59', '16:07:12', 'si'),
(176, 7, 7, '0', '2024-11-10 16:09:32', '16:09:32', 'si'),
(177, 7, 45, '0', '2024-11-10 16:09:41', '16:09:41', 'si'),
(178, 7, 33, '0', '2024-11-10 16:09:44', '16:09:44', 'si'),
(179, 7, 6, '1', '2024-11-10 16:09:47', '16:09:59', 'si'),
(180, 7, 63, '1', '2024-11-10 16:10:52', '16:11:07', 'si'),
(181, 7, 23, '0', '2024-11-10 16:11:52', '16:11:52', 'si'),
(182, 7, 59, '0', '2024-11-10 16:12:02', '16:12:02', 'si'),
(183, 7, 33, '1', '2024-11-10 16:13:22', '16:13:32', 'si'),
(184, 7, 46, '0', '2024-11-10 16:13:49', '16:13:49', 'si'),
(185, 7, 16, '0', '2024-11-10 16:14:21', '16:14:21', 'si'),
(186, 7, 33, '0', '2024-11-10 16:15:59', '16:16:00', 'si'),
(187, 7, 38, '0', '2024-11-10 16:17:15', '16:17:15', 'si'),
(188, 7, 12, '0', '2024-11-10 16:17:32', '16:17:32', 'si'),
(189, 7, 4, '1', '2024-11-10 16:17:37', '16:17:47', 'si'),
(190, 7, 22, '1', '2024-11-10 16:23:10', '16:23:18', 'si'),
(191, 7, 36, '1', '2024-11-10 16:25:02', '16:25:02', 'si'),
(192, 7, 3, '3', '2024-11-10 16:26:07', '16:26:07', 'si'),
(193, 7, 27, '0', '2024-11-10 16:29:00', '16:29:00', 'si'),
(194, 7, NULL, '1', '2024-11-10 16:33:51', '16:33:51', 'si'),
(195, 7, NULL, '1', '2024-11-10 16:34:52', '16:34:52', 'si'),
(196, 7, 40, '2', '2024-11-10 16:36:25', '16:36:44', 'si'),
(197, 7, 17, '1', '2024-11-10 16:36:51', '16:36:58', 'si'),
(198, 7, 31, '0', '2024-11-10 16:37:23', '16:37:23', 'si'),
(199, 7, 42, '2', '2024-11-10 16:37:33', '16:37:50', 'si'),
(200, 7, 8, '1', '2024-11-10 16:38:19', '16:38:44', 'si'),
(201, 7, 13, '0', '2024-11-10 16:38:51', '16:38:51', 'si'),
(202, 7, 7, '2', '2024-11-10 16:38:55', '16:39:05', 'si'),
(203, 7, 40, '4', '2024-11-10 16:41:28', '16:42:12', 'si'),
(204, 7, 10, '1', '2024-11-10 16:42:34', '16:42:41', 'si'),
(205, 7, 11, '4', '2024-11-10 16:43:54', '16:44:34', 'si'),
(206, 7, 63, '1', '2024-11-10 16:45:17', '16:45:22', 'si'),
(207, 7, 32, '2', '2024-11-10 16:45:36', '16:45:50', 'si'),
(208, 7, 18, '5', '2024-11-16 14:03:24', '14:04:22', 'si'),
(209, 7, 26, '3', '2024-11-16 14:04:54', '14:05:14', 'si'),
(210, 7, 29, '0', '2024-11-16 14:09:02', '14:09:02', 'si'),
(211, 7, 57, '0', '2024-11-16 14:09:46', '14:09:46', 'si'),
(212, 7, 52, '5', '2024-11-16 14:50:00', '14:51:04', 'si'),
(213, 7, 44, '1', '2024-11-16 14:52:02', '14:52:13', 'si'),
(214, 7, 27, '2', '2024-11-16 14:52:29', '14:52:40', 'si'),
(215, 7, 20, '0', '2024-11-16 14:53:03', '14:53:03', 'si'),
(216, 7, 17, '2', '2024-11-16 14:53:14', '14:53:28', 'si'),
(217, 7, NULL, '1', '2024-11-16 14:56:56', '14:56:56', 'si'),
(218, 7, 39, '0', '2024-11-16 14:57:01', '14:57:01', 'si'),
(219, 7, 39, '0', '2024-11-16 14:57:18', '14:57:18', 'si'),
(220, 7, NULL, '1', '2024-11-16 14:57:24', '14:57:24', 'si'),
(221, 7, 63, '1', '2024-11-16 14:57:32', '14:57:38', 'si'),
(222, 7, NULL, '1', '2024-11-16 15:01:31', '15:01:31', 'si'),
(223, 7, NULL, '2', '2024-11-16 15:01:36', '15:01:48', 'si'),
(224, 7, 10, '1', '2024-11-16 15:02:00', '15:02:08', 'si'),
(225, 7, 45, '0', '2024-11-16 15:03:51', '15:03:51', 'si'),
(226, 7, NULL, '1', '2024-11-16 15:04:00', '15:04:00', 'si'),
(227, 7, 11, '1', '2024-11-16 15:04:16', '15:04:26', 'si'),
(228, 7, 35, '1', '2024-11-16 15:36:06', '15:36:20', 'si'),
(229, 7, 10, '0', '2024-11-16 15:39:07', '15:39:07', 'si'),
(230, 7, 57, '0', '2024-11-16 15:40:36', '15:40:36', 'si'),
(231, 7, 47, '0', '2024-11-16 15:40:40', '15:40:40', 'si'),
(232, 7, 27, '0', '2024-11-16 15:40:55', '15:40:55', 'si'),
(233, 7, 43, '0', '2024-11-16 15:40:58', '15:40:58', 'si'),
(234, 7, 27, '1', '2024-11-16 15:41:52', '15:41:58', 'si'),
(235, 7, 38, '0', '2024-11-16 15:42:22', '15:42:22', 'si'),
(236, 7, 14, '3', '2024-11-16 15:42:43', '15:43:02', 'si'),
(237, 7, NULL, '0', '2024-11-16 16:10:55', NULL, 'si'),
(238, 7, NULL, '0', '2024-11-16 16:11:20', NULL, 'si'),
(239, 7, 44, '1', '2024-11-16 16:11:45', '16:11:54', 'si'),
(240, 7, 38, '3', '2024-11-16 16:12:53', '16:13:29', 'si'),
(241, 7, 36, '0', '2024-11-16 16:15:39', '16:15:39', 'si'),
(242, 7, 39, '0', '2024-11-16 16:15:48', '16:15:48', 'si'),
(243, 7, 7, '0', '2024-11-16 16:15:56', '16:15:56', 'si'),
(244, 7, 63, '0', '2024-11-16 16:15:59', '16:15:59', 'si'),
(245, 7, 31, '0', '2024-11-16 16:16:03', '16:16:04', 'si'),
(246, 7, 52, '0', '2024-11-16 16:16:14', '16:16:14', 'si'),
(247, 7, 27, '3', '2024-11-16 16:16:22', '16:16:41', 'si'),
(248, 7, 18, '0', '2024-11-16 16:16:58', '16:16:58', 'si'),
(249, 7, NULL, '1', '2024-11-16 16:17:01', '16:17:01', 'si'),
(250, 7, 6, '0', '2024-11-16 16:17:10', '16:17:10', 'si'),
(251, 7, NULL, '2', '2024-11-16 16:17:19', '16:17:23', 'si'),
(252, 7, NULL, '1', '2024-11-16 16:17:37', '16:17:37', 'si'),
(253, 7, NULL, '1', '2024-11-16 16:19:29', '16:19:29', 'si'),
(254, 7, 50, '0', '2024-11-16 16:19:36', '16:19:36', 'si'),
(255, 7, NULL, '1', '2024-11-16 16:19:39', '16:19:39', 'si'),
(256, 7, 32, '1', '2024-11-16 16:20:04', '16:20:10', 'si'),
(257, 7, 47, '4', '2024-11-16 16:21:25', '16:21:55', 'si'),
(258, 7, 25, '1', '2024-11-16 16:24:00', '16:24:10', 'si'),
(259, 7, 50, '0', '2024-11-16 19:30:36', '19:30:36', 'si'),
(260, 7, 1, '0', '2024-11-16 19:30:51', '19:30:51', 'si'),
(261, 7, 38, '0', '2024-11-16 19:37:22', '19:37:22', 'si'),
(262, 7, 40, '0', '2024-11-16 19:37:45', '19:37:45', 'si'),
(263, 7, 49, '0', '2024-11-16 19:39:23', '19:39:23', 'si'),
(264, 7, 19, '1', '2024-11-16 19:41:45', '19:41:53', 'si'),
(265, 7, 63, '0', '2024-11-16 19:42:17', '19:42:17', 'si'),
(266, 7, 20, '0', '2024-11-16 19:53:51', '19:53:51', 'si'),
(267, 7, 21, '0', '2024-11-16 20:00:07', '20:00:07', 'si'),
(268, 7, 27, '1', '2024-11-16 20:03:48', '20:03:52', 'si'),
(269, 7, 41, '0', '2024-11-16 20:03:58', '20:03:58', 'si'),
(270, 7, 39, '1', '2024-11-16 20:04:03', '20:04:10', 'si'),
(271, 7, 37, '1', '2024-11-16 20:04:54', '20:05:01', 'si'),
(272, 7, 10, '4', '2024-11-16 20:05:04', '20:05:29', 'si'),
(273, 7, 2, '0', '2024-11-16 20:05:41', '20:05:41', 'si'),
(274, 7, 45, '1', '2024-11-16 20:05:46', '20:05:49', 'si'),
(275, 7, 35, '0', '2024-11-16 20:06:09', '20:06:09', 'si'),
(276, 7, 38, '0', '2024-11-16 20:09:20', '20:09:20', 'si'),
(277, 7, 9, '1', '2024-11-16 20:09:25', '20:09:30', 'si'),
(278, 7, 39, '1', '2024-11-16 20:11:09', '20:11:15', 'si'),
(279, 7, 28, '1', '2024-11-16 20:11:30', '20:11:39', 'si'),
(280, 7, 20, '2', '2024-11-16 20:11:48', '20:12:01', 'si'),
(281, 7, 37, '0', '2024-11-16 20:12:12', '20:12:12', 'si'),
(282, 7, 44, '7', '2024-11-16 20:12:20', '20:13:07', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `reportada` enum('si','no') DEFAULT 'no',
  `aprobada` enum('si','no') DEFAULT 'no',
  `usada` int(10) UNSIGNED DEFAULT 0,
  `respondida_correctamente` int(10) UNSIGNED DEFAULT 0,
  `dificultad` tinyint(3) UNSIGNED NOT NULL CHECK (`dificultad` between 0 and 100),
  `categoria` varchar(50) NOT NULL,
  `creada` enum('si','no') NOT NULL DEFAULT 'no',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `reportada`, `aprobada`, `usada`, `respondida_correctamente`, `dificultad`, `categoria`, `creada`, `fecha_creacion`) VALUES
(1, '¿Cuál es el río más largo del mundo?', 'no', 'si', 2, 1, 3, 'Geografía', 'no', '2024-11-02 15:33:14'),
(2, '¿Dónde se encuentra la Torre Eiffel?', 'no', 'si', 1, 0, 3, 'Geografía', 'no', '2024-11-02 15:33:14'),
(3, '¿Cuál es el país más grande del mundo?', 'no', 'si', 0, 0, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(4, '¿En qué continente está Egipto?', 'no', 'si', 1, 1, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(5, '¿Cuál es la capital de Australia?', 'no', 'si', 1, 1, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(6, '¿Cuál es el país más poblado del mundo?', 'no', 'si', 1, 1, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(7, '¿En qué océano se encuentra la isla de Madagascar?', 'no', 'si', 0, 0, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(8, '¿Cuál es la capital de Canadá?', 'no', 'si', 0, 0, 0, 'Geografía', 'no', '2024-11-02 15:33:14'),
(9, '¿Dónde está el desierto del Sahara?', 'no', 'si', 2, 1, 3, 'Geografía', 'no', '2024-11-02 15:33:14'),
(10, '¿Qué país tiene la mayor cantidad de islas?', 'no', 'si', 1, 0, 3, 'Geografía', 'no', '2024-11-02 15:33:14'),
(11, '¿En qué año comenzó la Segunda Guerra Mundial?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(12, '¿Quién fue el primer presidente de los Estados Unidos?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(13, '¿Cuál de estos países fue parte de la Unión Soviética?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(14, '¿Quién fue Cleopatra?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(15, '¿En qué año cayó el Muro de Berlín?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(16, '¿Quién fue el primer hombre en pisar la Luna?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(17, '¿Cuál fue la civilización que construyó Machu Picchu?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(18, '¿En qué año comenzó la Revolución Francesa?', 'no', 'si', 0, 0, 0, 'Historia', 'no', '2024-11-02 15:33:14'),
(19, '¿Quién fue el líder de la independencia de la India?', 'no', 'si', 1, 0, 3, 'Historia', 'no', '2024-11-02 15:33:14'),
(20, '¿Dónde se firmó la Declaración de Independencia de los Estados Unidos?', 'no', 'si', 2, 0, 3, 'Historia', 'no', '2024-11-02 15:33:14'),
(21, '¿En qué deporte se utiliza un balón de voleibol?', 'no', 'si', 1, 0, 3, 'Deportes', 'no', '2024-11-02 15:33:14'),
(22, '¿Quién ganó el Mundial de Fútbol en 2018?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', '2024-11-02 15:33:14'),
(23, '¿Cuántos jugadores forman un equipo de baloncesto?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', '2024-11-02 15:33:14'),
(24, '¿En qué país se originaron los Juegos Olímpicos?', 'no', 'si', 1, 1, 1, 'Deportes', 'no', '2024-11-02 15:33:14'),
(25, '¿Quién tiene el récord de más títulos de Grand Slam en tenis masculino?', 'no', 'si', 1, 0, 3, 'Deportes', 'no', '2024-11-02 15:33:14'),
(26, '¿Qué deporte se practica en la NBA?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', '2024-11-02 15:33:14'),
(27, '¿Qué atleta ganó ocho medallas de oro en los Juegos Olímpicos de Pekín 2008?', 'no', 'si', 1, 0, 3, 'Deportes', 'no', '2024-11-02 15:33:14'),
(28, '¿Cuál es el equipo de fútbol con más Champions League ganadas?', 'no', 'si', 1, 0, 3, 'Deportes', 'no', '2024-11-02 15:33:14'),
(29, '¿En qué deporte se utiliza un bate y una pelota?', 'no', 'si', 1, 1, 1, 'Deportes', 'no', '2024-11-02 15:33:14'),
(30, '¿Quién es conocido como \"La Pulga\" en el fútbol?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', '2024-11-02 15:33:14'),
(31, '¿Quién pintó la Mona Lisa?', 'no', 'si', 2, 2, 1, 'Arte', 'no', '2024-11-02 15:33:14'),
(32, '¿En qué ciudad se encuentra el Museo del Louvre?', 'no', 'si', 0, 0, 0, 'Arte', 'no', '2024-11-02 15:33:14'),
(33, '¿Quién es el autor de \"La persistencia de la memoria\"?', 'no', 'si', 0, 0, 0, 'Arte', 'no', '2024-11-02 15:33:14'),
(34, '¿Cuál de estos es un cuadro de Vincent van Gogh?', 'no', 'si', 0, 0, 0, 'Arte', 'no', '2024-11-02 15:33:14'),
(35, '¿Qué artista pintó el techo de la Capilla Sixtina?', 'no', 'si', 1, 0, 3, 'Arte', 'no', '2024-11-02 15:33:14'),
(36, '¿Quién escribió \"Hamlet\"?', 'no', 'si', 1, 1, 1, 'Arte', 'no', '2024-11-02 15:33:14'),
(37, '¿En qué siglo vivió Rembrandt?', 'no', 'si', 2, 0, 3, 'Arte', 'no', '2024-11-02 15:33:14'),
(38, '¿Cuál es la técnica de pintar en paredes húmedas?', 'no', 'si', 2, 0, 3, 'Arte', 'no', '2024-11-02 15:33:14'),
(39, '¿Qué estilo es característico de Pablo Picasso?', 'no', 'si', 2, 0, 3, 'Arte', 'no', '2024-11-02 15:33:14'),
(40, '¿Quién compuso \"Las Cuatro Estaciones\"?', 'no', 'si', 2, 1, 3, 'Arte', 'no', '2024-11-02 15:33:14'),
(41, '¿Cuál es el planeta más grande del sistema solar?', 'no', 'si', 3, 2, 3, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(42, '¿Qué gas es esencial para la respiración humana?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(43, '¿Quién es conocido como el padre de la teoría de la relatividad?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(44, '¿Cuál es el metal más ligero?', 'no', 'si', 1, 0, 0, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(45, '¿Qué tipo de célula carece de núcleo?', 'no', 'si', 1, 0, 3, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(46, '¿Cuál es la sustancia que le da color a las plantas?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(47, '¿Cuántos elementos tiene la tabla periódica?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(48, '¿Quién desarrolló el principio de la flotabilidad?', 'no', 'si', 1, 1, 1, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(49, '¿Qué es H2O?', 'no', 'si', 1, 0, 3, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(50, '¿Cuál es el órgano más grande del cuerpo humano?', 'no', 'si', 1, 0, 3, 'Ciencia', 'no', '2024-11-02 15:33:14'),
(51, '¿Quién interpretó a Jack en Titanic?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(52, '¿Cuál es el nombre del villano en Los Vengadores?', 'no', 'si', 0, 0, 0, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(53, '¿En qué serie aparece \"Walter White\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(54, '¿Cuál es la saga de libros más vendida de J.K. Rowling?', 'no', 'si', 2, 2, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(55, '¿Quién es el superhéroe que es también Bruce Wayne?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(56, '¿Cuál de estos personajes es amigo de Shrek?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(57, '¿Cuál es el nombre del planeta natal de Superman?', 'no', 'si', 0, 0, 0, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(58, '¿Qué personaje es famoso por decir \"Hakuna Matata\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(59, '¿Cuál de estos cantantes es conocido como \"El Rey del Pop\"?', 'no', 'si', 1, 1, 0, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(60, '¿En qué película se escucha la frase \"Yo soy tu padre\"?', 'no', 'si', 0, 0, 0, 'Entretenimiento', 'no', '2024-11-02 15:33:14'),
(63, '¿Cuál de estos actores no ha interpretado al personaje de Batman en una película de acción real?', 'no', 'no', 1, 0, 3, 'Entretenimiento', 'si', '2024-11-02 15:52:34'),
(65, '¿Cuál de estos actores interpretó al personaje de Tony Stark/Iron Man en las películas del Universo Cinematográfico de Marvel?', 'no', 'no', 0, 0, 0, 'Entretenimiento', 'si', '2024-11-04 15:41:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_respondidas`
--

CREATE TABLE `preguntas_respondidas` (
  `id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas_respondidas`
--

INSERT INTO `preguntas_respondidas` (`id`, `partida_id`, `pregunta_id`) VALUES
(68, 132, 56),
(69, 133, 16),
(70, 135, 14),
(71, 136, 36),
(72, 138, 63),
(73, 142, 63),
(74, 145, 26),
(75, 146, 33),
(76, 149, 54),
(77, 151, 31),
(78, 153, 14),
(79, 154, 52),
(80, 154, 19),
(81, 154, 65),
(82, 154, 34),
(83, 155, 56),
(84, 156, 54),
(85, 156, 34),
(86, 159, 60),
(87, 159, 56),
(88, 161, 55),
(89, 164, 53),
(90, 166, 26),
(91, 166, 19),
(92, 166, 25),
(93, 168, 25),
(94, 170, 52),
(95, 175, 14),
(96, 179, 31),
(97, 180, 18),
(98, 183, 57),
(99, 189, 52),
(100, 190, 55),
(101, 191, 36),
(102, 192, 3),
(103, 192, 3),
(104, 192, 3),
(105, 194, 60),
(106, 195, 49),
(107, 196, 42),
(108, 196, 19),
(109, 197, 63),
(110, 199, 24),
(111, 199, 34),
(112, 200, 3),
(113, 202, 2),
(114, 202, 14),
(115, 203, 29),
(116, 203, 57),
(117, 203, 46),
(118, 203, 38),
(119, 204, 57),
(120, 205, 55),
(121, 205, 4),
(122, 205, 46),
(123, 205, 40),
(124, 206, 65),
(125, 207, 13),
(126, 207, 47),
(127, 208, 28),
(128, 208, 6),
(129, 208, 5),
(130, 208, 29),
(131, 208, 59),
(132, 209, 12),
(133, 209, 35),
(134, 209, 2),
(135, 212, 42),
(136, 212, 58),
(137, 212, 40),
(138, 212, 30),
(139, 212, 56),
(140, 213, 51),
(141, 214, 2),
(142, 214, 25),
(143, 216, 56),
(144, 216, 34),
(145, 217, 50),
(146, 220, 49),
(147, 221, 49),
(148, 222, 8),
(149, 223, 21),
(150, 223, 24),
(151, 224, 26),
(152, 226, 63),
(153, 227, 40),
(154, 228, 23),
(155, 234, 46),
(156, 236, 42),
(157, 236, 21),
(158, 236, 47),
(159, 239, 57),
(160, 240, 26),
(161, 240, 57),
(162, 240, 54),
(163, 247, 19),
(164, 247, 58),
(165, 247, 52),
(166, 249, 14),
(167, 251, 58),
(168, 251, 27),
(169, 252, 59),
(170, 253, 23),
(171, 255, 59),
(172, 256, 28),
(173, 257, 56),
(174, 257, 19),
(175, 257, 32),
(176, 257, 65),
(177, 258, 53),
(178, 264, 1),
(179, 268, 54),
(180, 270, 55),
(181, 271, 54),
(182, 272, 58),
(183, 272, 51),
(184, 272, 36),
(185, 272, 56),
(186, 274, 31),
(187, 277, 48),
(188, 278, 41),
(189, 279, 40),
(190, 280, 29),
(191, 280, 24),
(192, 282, 9),
(193, 282, 6),
(194, 282, 41),
(195, 282, 4),
(196, 282, 31),
(197, 282, 5),
(198, 282, 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','resuelto') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `pregunta_id`, `motivo`, `fecha`, `estado`) VALUES
(1, 52, 'En la primer pelicula es Loki', '2024-10-30 23:33:36', 'pendiente'),
(3, 20, 'test2', '2024-11-07 23:45:39', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_pregunta` int(11) DEFAULT NULL,
  `opcion_1` varchar(255) NOT NULL,
  `opcion_2` varchar(255) NOT NULL,
  `opcion_3` varchar(255) NOT NULL,
  `opcion_4` varchar(255) NOT NULL,
  `opcion_correcta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_pregunta`, `opcion_1`, `opcion_2`, `opcion_3`, `opcion_4`, `opcion_correcta`) VALUES
(1, 'Amazonas', 'Nilo', 'Yangtsé', 'Misisipi', 'Nilo'),
(2, 'Nueva York', 'Londres', 'París', 'Roma', 'París'),
(3, 'Canadá', 'Rusia', 'China', 'Estados Unidos', 'Rusia'),
(4, 'Asia', 'África', 'Europa', 'América', 'África'),
(5, 'Sídney', 'Melbourne', 'Canberra', 'Perth', 'Canberra'),
(6, 'India', 'Estados Unidos', 'Indonesia', 'China', 'China'),
(7, 'Atlántico', 'Pacífico', 'Índico', 'Ártico', 'Índico'),
(8, 'Toronto', 'Vancouver', 'Ottawa', 'Montreal', 'Ottawa'),
(9, 'Asia', 'África', 'América del Sur', 'Australia', 'África'),
(10, 'Canadá', 'Suecia', 'Filipinas', 'Indonesia', 'Suecia'),
(11, '1939', '1941', '1945', '1936', '1939'),
(12, 'Abraham Lincoln', 'Thomas Jefferson', 'George Washington', 'John Adams', 'George Washington'),
(13, 'Polonia', 'Rusia', 'Finlandia', 'Austria', 'Rusia'),
(14, 'Reina de Roma', 'Reina de Egipto', 'Emperatriz China', 'Princesa Persa', 'Reina de Egipto'),
(15, '1985', '1989', '1991', '1995', '1989'),
(16, 'Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Michael Collins', 'Neil Armstrong'),
(17, 'Aztecas', 'Mayas', 'Incas', 'Olmecas', 'Incas'),
(18, '1776', '1789', '1804', '1815', '1789'),
(19, 'Nelson Mandela', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Mahatma Gandhi'),
(20, 'Boston', 'Nueva York', 'Filadelfia', 'Washington D.C.', 'Filadelfia'),
(21, 'Fútbol', 'Baloncesto', 'Voleibol', 'Béisbol', 'Voleibol'),
(22, 'Brasil', 'Francia', 'Alemania', 'Argentina', 'Francia'),
(23, '5', '7', '6', '8', '5'),
(24, 'Italia', 'Grecia', 'Egipto', 'China', 'Grecia'),
(25, 'Rafael Nadal', 'Roger Federer', 'Novak Djokovic', 'Andy Murray', 'Novak Djokovic'),
(26, 'Hockey', 'Béisbol', 'Baloncesto', 'Fútbol Americano', 'Baloncesto'),
(27, 'Usain Bolt', 'Michael Phelps', 'Carl Lewis', 'Mark Spitz', 'Michael Phelps'),
(28, 'AC Milan', 'FC Barcelona', 'Real Madrid', 'Liverpool', 'Real Madrid'),
(29, 'Baloncesto', 'Voleibol', 'Béisbol', 'Fútbol', 'Béisbol'),
(30, 'Cristiano Ronaldo', 'Lionel Messi', 'Neymar', 'Kylian Mbappé', 'Lionel Messi'),
(31, 'Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Claude Monet', 'Leonardo da Vinci'),
(32, 'Madrid', 'Roma', 'París', 'Berlín', 'París'),
(33, 'Salvador Dalí', 'Pablo Picasso', 'Joan Miró', 'Henri Matisse', 'Salvador Dalí'),
(34, 'El grito', 'La noche estrellada', 'Guernica', 'Las Meninas', 'La noche estrellada'),
(35, 'Miguel Ángel', 'Donatello', 'Leonardo da Vinci', 'Rafael', 'Miguel Ángel'),
(36, 'Edgar Allan Poe', 'William Shakespeare', 'Oscar Wilde', 'Charles Dickens', 'William Shakespeare'),
(37, 'XV', 'XVI', 'XVII', 'XVIII', 'XVII'),
(38, 'Óleo', 'Pastel', 'Acuarela', 'Fresco', 'Fresco'),
(39, 'Impresionismo', 'Surrealismo', 'Cubismo', 'Romanticismo', 'Cubismo'),
(40, 'Mozart', 'Vivaldi', 'Beethoven', 'Bach', 'Vivaldi'),
(41, 'Tierra', 'Marte', 'Júpiter', 'Saturno', 'Júpiter'),
(42, 'Hidrógeno', 'Nitrógeno', 'Oxígeno', 'Dióxido de Carbono', 'Oxígeno'),
(43, 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Tesla', 'Albert Einstein'),
(44, 'Aluminio', 'Oro', 'Litio', 'Plomo', 'Litio'),
(45, 'Célula vegetal', 'Célula animal', 'Célula procariota', 'Célula eucariota', 'Célula procariota'),
(46, 'Clorofila', 'Melanina', 'Hemoglobina', 'Caroteno', 'Clorofila'),
(47, '108', '118', '98', '128', '118'),
(48, 'Galileo', 'Arquímedes', 'Pascal', 'Einstein', 'Arquímedes'),
(49, 'Hidrógeno', 'Agua', 'Oxígeno', 'Helio', 'Agua'),
(50, 'Corazón', 'Hígado', 'Piel', 'Cerebro', 'Piel'),
(51, 'Brad Pitt', 'Leonardo DiCaprio', 'Tom Cruise', 'Johnny Depp', 'Leonardo DiCaprio'),
(52, 'Ultrón', 'Loki', 'Thanos', 'Hela', 'Thanos'),
(53, 'Breaking Bad', 'The Sopranos', 'Lost', 'Prison Break', 'Breaking Bad'),
(54, 'El Señor de los Anillos', 'Harry Potter', 'Crepúsculo', 'Las Crónicas de Narnia', 'Harry Potter'),
(55, 'Superman', 'Iron Man', 'Batman', 'Spider-Man', 'Batman'),
(56, 'Simba', 'Mickey Mouse', 'Burro', 'El Gato con Botas', 'Burro'),
(57, 'Tierra', 'Kripton', 'Marte', 'Vulcano', 'Kripton'),
(58, 'Simba', 'Timón y Pumba', 'Rafiki', 'Scar', 'Timón y Pumba'),
(59, 'Elvis Presley', 'Michael Jackson', 'Prince', 'Freddie Mercury', 'Michael Jackson'),
(60, 'Titanic', 'Matrix', 'Star Wars', 'Jurassic Park', 'Star Wars'),
(63, 'Christian Bale', 'Robert Pattinson', 'Tom Cruise', 'Ben Affleck', 'Tom Cruise'),
(65, 'Chris Evans', 'Robert Downey Jr.', 'Chris Hemsworth', 'Mark Ruffalo', 'Robert Downey Jr.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `anio_nacimiento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `mail` varchar(100) NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `tipo_usuario` enum('admin','editor','jugador') NOT NULL DEFAULT 'jugador',
  `fecha_registro` date NOT NULL DEFAULT curdate(),
  `nivel` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(64) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `total_preguntas_aparecidas` int(11) UNSIGNED DEFAULT 0,
  `respuestas_correctas` int(11) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `UUID`, `nombre_usuario`, `contrasenia`, `nombre_completo`, `anio_nacimiento`, `sexo`, `pais`, `ciudad`, `mail`, `foto_perfil`, `tipo_usuario`, `fecha_registro`, `nivel`, `token`, `activo`, `total_preguntas_aparecidas`, `respuestas_correctas`) VALUES
(1, '1730243068672169fcd6b912.37226186', 'admin1', '$2y$10$3PFr39McNRO1UjyN7tNH5.eW8ulcmmOdoFrxXoM9v/qkn.7MlDBhW', 'administrador 1', '1998-02-11', 'M', 'Brasil', 'Río de Janeiro', 'checchia47@gmail.com', '../public/perfiles/admin1.svg', 'admin', '2022-10-29', 0, '9f03a77b4b8a7f96427ada99079f0e21', 1, 0, 0),
(2, '173024312067216a30277611.66937124', 'admin2', '$2y$10$rMd/e0Sv5zL8hQnNouT/TeZYLF2WppaEMNNr2tv8naF6tS7IxGjGK', 'administrador 2', '1940-11-11', 'F', 'Uruguay', 'La Paz', 'checchia47@gmail.com', '../public/perfiles/admin2.svg', 'admin', '2023-05-29', 0, '9d8bf23e18ba86703d0229529214faf8', 1, 0, 0),
(3, '173024318367216a6f1ada69.08162378', 'editor1', '$2y$10$W2dr2RhAft9rXVWohdrzse30D3kbNymTb/nW8x6RrEEhQ/X1KjJrW', 'editor 1', '1960-08-18', 'M', 'Argentina', 'Zárate', 'checchia47@gmail.com', '../public/perfiles/editor1.svg', 'editor', '2023-10-29', 0, 'd33f962d306933510570586e542fad66', 1, 0, 0),
(4, '173024323967216aa7dab492.88264967', 'editor2', '$2y$10$LYQrLEGVRuX3YmcrMk2gw.hp0QlX8ysA8Fi6q/iEapegIMqBSilvS', 'editor 2', '1980-04-14', 'F', 'Argentina', 'Pedanía Punta del Agua', 'checchia47@gmail.com', '../public/perfiles/editor2.svg', 'editor', '2024-02-29', 0, '0651639a87da9ed235fa584977ed6e98', 1, 0, 0),
(5, '173024329067216ada7677a3.98511133', 'jugador1', '$2y$10$owb8HRYSOPLzs/WItiPf/eQsFCYiOSOPd8aS2V7Yox17KbGhxviEi', 'jugador 1', '1999-02-17', 'M', 'Argentina', 'Castelar', 'checchia47@gmail.com', '../public/perfiles/jugador1.svg', 'jugador', '2024-07-29', 0, '0b17ea8082492a8b1ba782e47e198d53', 1, 0, 0),
(6, '173024333167216b038ce6e1.97310869', 'jugador2', '$2y$10$lExY2O5z5r6Q3rglGcHZG.vNZuJaONCHkZChW3WcSaCnTwP9X1d4W', 'jugador 2', '1990-12-11', 'F', 'Brasil', 'Orizona', 'checchia47@gmail.com', '../public/perfiles/jugador2.svg', 'jugador', '2024-10-28', 0, '20f21da3c0a7060a7c5f7271a78f6586', 1, 0, 0),
(7, '173024339267216b409efe16.20480083', 'test', '$2y$10$IAaH1BhabxMFeNIXq.91eOCJ31rB7hEWPW29p0DGEAs.dW8fEfasq', 'test test', '2010-12-12', 'O', 'Chile', 'Buin', 'checchia47@gmail.com', '../public/perfiles/test.svg', 'jugador', '2024-10-29', 1, '18dae336a1d3417f7e690f5f682845e6', 1, 73, 26);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `id_jugador` (`id_jugador`),
  ADD KEY `fk_id_ultima_pregunta` (`id_ultima_pregunta`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partida_id` (`partida_id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `fk_id_ultima_pregunta` FOREIGN KEY (`id_ultima_pregunta`) REFERENCES `preguntas` (`id`),
  ADD CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
  ADD CONSTRAINT `preguntas_respondidas_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id_partida`),
  ADD CONSTRAINT `preguntas_respondidas_ibfk_2` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
