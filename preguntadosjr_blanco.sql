-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2024 a las 22:43:31
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
  `eliminada` enum('si','no') DEFAULT 'no',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `reportada`, `aprobada`, `usada`, `respondida_correctamente`, `dificultad`, `categoria`, `creada`, `eliminada`, `fecha_creacion`) VALUES
(1, '¿Cuál es el río más largo del mundo?', 'no', 'si', 3, 2, 3, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(2, '¿Dónde se encuentra la Torre Eiffel?', 'no', 'si', 3, 1, 3, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(3, '¿Cuál es el país más grande del mundo?', 'no', 'si', 0, 0, 0, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(4, '¿En qué continente está Egipto?', 'no', 'si', 1, 1, 1, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(5, '¿Cuál es la capital de Australia?', 'no', 'si', 1, 1, 1, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(6, '¿Cuál es el país más poblado del mundo?', 'no', 'si', 1, 1, 1, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(7, '¿En qué océano se encuentra la isla de Madagascar?', 'no', 'si', 0, 0, 0, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(8, '¿Cuál es la capital de Canadá?', 'no', 'si', 1, 1, 1, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(9, '¿Dónde está el desierto del Sahara?', 'no', 'si', 6, 4, 3, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(10, '¿Qué país tiene la mayor cantidad de islas?', 'no', 'si', 2, 0, 3, 'Geografía', 'no', 'no', '2024-11-02 15:33:14'),
(11, '¿En qué año comenzó la Segunda Guerra Mundial?', 'si', 'si', 4, 1, 3, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(12, '¿Quién fue el primer presidente de los Estados Unidos?', 'no', 'si', 3, 1, 3, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(13, '¿Cuál de estos países fue parte de la Unión Soviética?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(14, '¿Quién fue Cleopatra?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(15, '¿En qué año cayó el Muro de Berlín?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(16, '¿Quién fue el primer hombre en pisar la Luna?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(17, '¿Cuál fue la civilización que construyó Machu Picchu?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(18, '¿En qué año comenzó la Revolución Francesa?', 'no', 'si', 0, 0, 0, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(19, '¿Quién fue el líder de la independencia de la India?', 'no', 'si', 5, 2, 3, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(20, '¿Dónde se firmó la Declaración de Independencia de los Estados Unidos?', 'no', 'si', 5, 0, 3, 'Historia', 'no', 'no', '2024-11-02 15:33:14'),
(21, '¿En qué deporte se utiliza un balón de voleibol?', 'no', 'si', 2, 1, 3, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(22, '¿Quién ganó el Mundial de Fútbol en 2018?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(23, '¿Cuántos jugadores forman un equipo de baloncesto?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(24, '¿En qué país se originaron los Juegos Olímpicos?', 'no', 'si', 2, 2, 1, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(25, '¿Quién tiene el récord de más títulos de Grand Slam en tenis masculino?', 'no', 'si', 1, 0, 3, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(26, '¿Qué deporte se practica en la NBA?', 'no', 'si', 0, 0, 0, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(27, '¿Qué atleta ganó ocho medallas de oro en los Juegos Olímpicos de Pekín 2008?', 'no', 'si', 5, 1, 3, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(28, '¿Cuál es el equipo de fútbol con más Champions League ganadas?', 'no', 'si', 4, 1, 3, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(29, '¿En qué deporte se utiliza un bate y una pelota?', 'no', 'si', 1, 1, 1, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(30, '¿Quién es conocido como \"La Pulga\" en el fútbol?', 'no', 'si', 1, 1, 1, 'Deportes', 'no', 'no', '2024-11-02 15:33:14'),
(31, '¿Quién pintó la Mona Lisa?', 'no', 'si', 2, 2, 1, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(32, '¿En qué ciudad se encuentra el Museo del Louvre?', 'no', 'si', 0, 0, 0, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(33, '¿Quién es el autor de \"La persistencia de la memoria\"?', 'no', 'si', 0, 0, 0, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(34, '¿Cuál de estos es un cuadro de Vincent van Gogh?', 'no', 'si', 5, 2, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(35, '¿Qué artista pintó el techo de la Capilla Sixtina?', 'no', 'si', 4, 2, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(36, '¿Quién escribió \"Hamlet\"?', 'no', 'si', 1, 1, 1, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(37, '¿En qué siglo vivió Rembrandt?', 'no', 'si', 4, 1, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(38, '¿Cuál es la técnica de pintar en paredes húmedas?', 'no', 'si', 2, 0, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(39, '¿Qué estilo es característico de Pablo Picasso?', 'no', 'si', 3, 1, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(40, '¿Quién compuso \"Las Cuatro Estaciones\"?', 'no', 'si', 4, 1, 3, 'Arte', 'no', 'no', '2024-11-02 15:33:14'),
(41, '¿Cuál es el planeta más grande del sistema solar?', 'no', 'si', 3, 2, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(42, '¿Qué gas es esencial para la respiración humana?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(43, '¿Quién es conocido como el padre de la teoría de la relatividad?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(44, '¿Cuál es el metal más ligero?', 'no', 'si', 5, 3, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(45, '¿Qué tipo de célula carece de núcleo?', 'no', 'si', 4, 2, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(46, '¿Cuál es la sustancia que le da color a las plantas?', 'no', 'si', 0, 0, 0, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(47, '¿Cuántos elementos tiene la tabla periódica?', 'no', 'si', 1, 1, 1, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(48, '¿Quién desarrolló el principio de la flotabilidad?', 'no', 'si', 5, 1, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(49, '¿Qué es H2O?', 'no', 'si', 5, 2, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(50, '¿Cuál es el órgano más grande del cuerpo humano?', 'no', 'si', 2, 1, 3, 'Ciencia', 'no', 'no', '2024-11-02 15:33:14'),
(51, '¿Quién interpretó a Jack en Titanic?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(52, '¿Cuál es el nombre del villano en Los Vengadores?', 'no', 'si', 0, 0, 0, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(53, '¿En qué serie aparece \"Walter White\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(54, '¿Cuál es la saga de libros más vendida de J.K. Rowling?', 'no', 'si', 3, 3, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(55, '¿Quién es el superhéroe que es también Bruce Wayne?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(56, '¿Cuál de estos personajes es amigo de Shrek?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(57, '¿Cuál es el nombre del planeta natal de Superman?', 'no', 'si', 0, 0, 0, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(58, '¿Qué personaje es famoso por decir \"Hakuna Matata\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(59, '¿Cuál de estos cantantes es conocido como \"El Rey del Pop\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(60, '¿En qué película se escucha la frase \"Yo soy tu padre\"?', 'no', 'si', 1, 1, 1, 'Entretenimiento', 'no', 'no', '2024-11-02 15:33:14'),
(63, '¿Cuál de estos actores no ha interpretado al personaje de Batman en una película de acción real?', 'no', 'no', 1, 0, 3, 'Entretenimiento', 'si', 'no', '2024-11-02 15:52:34'),
(65, '¿Cuál de estos actores interpretó al personaje de Tony Stark/Iron Man en las películas del Universo Cinematográfico de Marvel?', 'no', 'no', 0, 0, 0, 'Entretenimiento', 'si', 'no', '2024-11-04 15:41:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_respondidas`
--

CREATE TABLE `preguntas_respondidas` (
  `id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
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

INSERT INTO `respuestas` (`id`, `id_pregunta`, `opcion_1`, `opcion_2`, `opcion_3`, `opcion_4`, `opcion_correcta`) VALUES
(1, 1, 'Amazonas', 'Nilo', 'Yangtsé', 'Misisipi', 'Nilo'),
(2, 2, 'Nueva York', 'Londres', 'París', 'Roma', 'París'),
(3, 3, 'Canadá', 'Rusia', 'China', 'Estados Unidos', 'Rusia'),
(4, 4, 'Asia', 'África', 'Europa', 'América', 'África'),
(5, 5, 'Sídney', 'Melbourne', 'Canberra', 'Perth', 'Canberra'),
(6, 6, 'India', 'Estados Unidos', 'Indonesia', 'China', 'China'),
(7, 7, 'Atlántico', 'Pacífico', 'Índico', 'Ártico', 'Índico'),
(8, 8, 'Toronto', 'Vancouver', 'Ottawa', 'Montreal', 'Ottawa'),
(9, 9, 'Asia', 'África', 'América del Sur', 'Australia', 'África'),
(10, 10, 'Canadá', 'Suecia', 'Filipinas', 'Indonesia', 'Suecia'),
(11, 11, '1939', '1941', '1945', '1936', '1939'),
(12, 12, 'Abraham Lincoln', 'Thomas Jefferson', 'George Washington', 'John Adams', 'George Washington'),
(13, 13, 'Polonia', 'Rusia', 'Finlandia', 'Austria', 'Rusia'),
(14, 14, 'Reina de Roma', 'Reina de Egipto', 'Emperatriz China', 'Princesa Persa', 'Reina de Egipto'),
(15, 15, '1985', '1989', '1991', '1995', '1989'),
(16, 16, 'Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Michael Collins', 'Neil Armstrong'),
(17, 17, 'Aztecas', 'Mayas', 'Incas', 'Olmecas', 'Incas'),
(18, 18, '1776', '1789', '1804', '1815', '1789'),
(19, 19, 'Nelson Mandela', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Mahatma Gandhi'),
(20, 20, 'Boston', 'Nueva York', 'Filadelfia', 'Washington D.C.', 'Filadelfia'),
(21, 21, 'Fútbol', 'Baloncesto', 'Voleibol', 'Béisbol', 'Voleibol'),
(22, 22, 'Brasil', 'Francia', 'Alemania', 'Argentina', 'Francia'),
(23, 23, '5', '7', '6', '8', '5'),
(24, 24, 'Italia', 'Grecia', 'Egipto', 'China', 'Grecia'),
(25, 25, 'Rafael Nadal', 'Roger Federer', 'Novak Djokovic', 'Andy Murray', 'Novak Djokovic'),
(26, 26, 'Hockey', 'Béisbol', 'Baloncesto', 'Fútbol Americano', 'Baloncesto'),
(27, 27, 'Usain Bolt', 'Michael Phelps', 'Carl Lewis', 'Mark Spitz', 'Michael Phelps'),
(28, 28, 'AC Milan', 'FC Barcelona', 'Real Madrid', 'Liverpool', 'Real Madrid'),
(29, 29, 'Baloncesto', 'Voleibol', 'Béisbol', 'Fútbol', 'Béisbol'),
(30, 30, 'Cristiano Ronaldo', 'Lionel Messi', 'Neymar', 'Kylian Mbappé', 'Lionel Messi'),
(31, 31, 'Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Claude Monet', 'Leonardo da Vinci'),
(32, 32, 'Madrid', 'Roma', 'París', 'Berlín', 'París'),
(33, 33, 'Salvador Dalí', 'Pablo Picasso', 'Joan Miró', 'Henri Matisse', 'Salvador Dalí'),
(34, 34, 'El grito', 'La noche estrellada', 'Guernica', 'Las Meninas', 'La noche estrellada'),
(35, 35, 'Miguel Ángel', 'Donatello', 'Leonardo da Vinci', 'Rafael', 'Miguel Ángel'),
(36, 36, 'Edgar Allan Poe', 'William Shakespeare', 'Oscar Wilde', 'Charles Dickens', 'William Shakespeare'),
(37, 37, 'XV', 'XVI', 'XVII', 'XVIII', 'XVII'),
(38, 38, 'Óleo', 'Pastel', 'Acuarela', 'Fresco', 'Fresco'),
(39, 39, 'Impresionismo', 'Surrealismo', 'Cubismo', 'Romanticismo', 'Cubismo'),
(40, 40, 'Mozart', 'Vivaldi', 'Beethoven', 'Bach', 'Vivaldi'),
(41, 41, 'Tierra', 'Marte', 'Júpiter', 'Saturno', 'Júpiter'),
(42, 42, 'Hidrógeno', 'Nitrógeno', 'Oxígeno', 'Dióxido de Carbono', 'Oxígeno'),
(43, 43, 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Tesla', 'Albert Einstein'),
(44, 44, 'Aluminio', 'Oro', 'Litio', 'Plomo', 'Litio'),
(45, 45, 'Célula vegetal', 'Célula animal', 'Célula procariota', 'Célula eucariota', 'Célula procariota'),
(46, 46, 'Clorofila', 'Melanina', 'Hemoglobina', 'Caroteno', 'Clorofila'),
(47, 47, '108', '118', '98', '128', '118'),
(48, 48, 'Galileo', 'Arquímedes', 'Pascal', 'Einstein', 'Arquímedes'),
(49, 49, 'Hidrógeno', 'Agua', 'Oxígeno', 'Helio', 'Agua'),
(50, 50, 'Corazón', 'Hígado', 'Piel', 'Cerebro', 'Piel'),
(51, 51, 'Brad Pitt', 'Leonardo DiCaprio', 'Tom Cruise', 'Johnny Depp', 'Leonardo DiCaprio'),
(52, 52, 'Ultrón', 'Loki', 'Thanos', 'Hela', 'Thanos'),
(53, 53, 'Breaking Bad', 'The Sopranos', 'Lost', 'Prison Break', 'Breaking Bad'),
(54, 54, 'El Señor de los Anillos', 'Harry Potter', 'Crepúsculo', 'Las Crónicas de Narnia', 'Harry Potter'),
(55, 55, 'Superman', 'Iron Man', 'Batman', 'Spider-Man', 'Batman'),
(56, 56, 'Simba', 'Mickey Mouse', 'Burro', 'El Gato con Botas', 'Burro'),
(57, 57, 'Tierra', 'Kripton', 'Marte', 'Vulcano', 'Kripton'),
(58, 58, 'Simba', 'Timón y Pumba', 'Rafiki', 'Scar', 'Timón y Pumba'),
(59, 59, 'Elvis Presley', 'Michael Jackson', 'Prince', 'Freddie Mercury', 'Michael Jackson'),
(60, 60, 'Titanic', 'Matrix', 'Star Wars', 'Jurassic Park', 'Star Wars'),
(61, 63, 'Christian Bale', 'Robert Pattinson', 'Tom Cruise', 'Ben Affleck', 'Tom Cruise'),
(62, 65, 'Chris Evans', 'Robert Downey Jr.', 'Chris Hemsworth', 'Mark Ruffalo', 'Robert Downey Jr.');

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
(5, '173024329067216ada7677a3.98511133', 'jugador1', '$2y$10$owb8HRYSOPLzs/WItiPf/eQsFCYiOSOPd8aS2V7Yox17KbGhxviEi', 'jugador 1', '1999-02-17', 'M', 'Argentina', 'Castelar', 'checchia47@gmail.com', '../public/perfiles/jugador1.svg', 'jugador', '2024-07-29', 1, '0b17ea8082492a8b1ba782e47e198d53', 1, 0, 0),
(6, '173024333167216b038ce6e1.97310869', 'jugador2', '$2y$10$lExY2O5z5r6Q3rglGcHZG.vNZuJaONCHkZChW3WcSaCnTwP9X1d4W', 'jugador 2', '1990-12-11', 'F', 'Brasil', 'Orizona', 'checchia47@gmail.com', '../public/perfiles/jugador2.svg', 'jugador', '2024-06-28', 1, '20f21da3c0a7060a7c5f7271a78f6586', 1, 0, 0),
(7, '173024339267216b409efe16.20480083', 'jugador3', '$2y$10$IAaH1BhabxMFeNIXq.91eOCJ31rB7hEWPW29p0DGEAs.dW8fEfasq', 'jugador 3', '2010-12-12', 'O', 'Chile', 'Buin', 'checchia47@gmail.com', '../public/perfiles/test.svg', 'jugador', '2024-11-18', 1, '18dae336a1d3417f7e690f5f682845e6', 1, 0, 0),
(8, '1732111151673deb2f53b9b2.25901046', 'jugador4', '$2y$10$5qBc5WWSl6EvnInt1fyP4ORjZoHLAhv8LBNyVhOeorLKZs7LoFDA2', 'jugador 4', '2003-02-20', 'M', 'United States', 'New York', 'checchia47@gmail.com', '../public/perfiles/jugador4.svg', 'jugador', '2024-11-20', 0, 'a279a3c0808ba9c7c37ae7ca9481d487', 1, 0, 0);

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
  ADD PRIMARY KEY (`id`),
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
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
