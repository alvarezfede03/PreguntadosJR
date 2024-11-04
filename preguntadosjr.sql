-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
<<<<<<< HEAD
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2024 a las 00:58:37
=======
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-10-2024 a las 00:16:21
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709
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
  `resultado` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidas`
--

<<<<<<< HEAD
INSERT INTO `partidas` (`id_partida`, `id_jugador`, `resultado`, `fecha_creacion`) VALUES
(1, 7, '1', '2024-10-29 21:31:31'),
(2, 5, '3', '2024-10-29 21:31:31'),
(3, 6, '8', '2024-10-29 21:31:31'),
(4, 7, '0', '2024-10-29 21:31:31'),
(5, 7, '1', '2024-10-29 21:31:31'),
(6, 7, '1', '2024-10-29 21:31:37'),
(7, 7, '0', '2024-10-29 21:32:01'),
(8, 7, '0', '2024-10-29 21:32:10'),
(9, 7, '4', '2024-10-30 19:41:32'),
(10, 7, '4', '2024-10-30 20:00:08'),
(11, 7, '0', '2024-10-30 20:19:02'),
(12, 7, '3', '2024-10-30 20:30:32'),
(13, 7, '7', '2024-10-30 20:32:13');
=======
INSERT INTO `partidas` (`id_partida`, `id_jugador`, `resultado`) VALUES
(1, 7, '1'),
(2, 5, '3'),
(3, 6, '8');
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `opcion_1` varchar(255) NOT NULL,
  `opcion_2` varchar(255) NOT NULL,
  `opcion_3` varchar(255) NOT NULL,
  `opcion_4` varchar(255) NOT NULL,
  `opcion_correcta` enum('1','2','3','4') NOT NULL,
  `reportada` enum('si','no') DEFAULT 'no',
  `aprobada` enum('si','no') DEFAULT 'no',
  `usada` int(10) UNSIGNED DEFAULT 0,
  `respondida_correctamente` int(10) UNSIGNED DEFAULT 0,
  `dificultad` tinyint(3) UNSIGNED NOT NULL CHECK (`dificultad` between 0 and 100),
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `opcion_1`, `opcion_2`, `opcion_3`, `opcion_4`, `opcion_correcta`, `reportada`, `aprobada`, `usada`, `respondida_correctamente`, `dificultad`, `categoria`) VALUES
(1, '¿Cuál es el río más largo del mundo?', 'Amazonas', 'Nilo', 'Yangtsé', 'Misisipi', '2', 'no', 'si', 0, 0, 30, 'Geografía'),
(2, '¿Dónde se encuentra la Torre Eiffel?', 'Nueva York', 'Londres', 'París', 'Roma', '3', 'no', 'si', 0, 0, 20, 'Geografía'),
(3, '¿Cuál es el país más grande del mundo?', 'Canadá', 'Rusia', 'China', 'Estados Unidos', '2', 'no', 'si', 0, 0, 40, 'Geografía'),
(4, '¿En qué continente está Egipto?', 'Asia', 'África', 'Europa', 'América', '2', 'no', 'si', 0, 0, 10, 'Geografía'),
(5, '¿Cuál es la capital de Australia?', 'Sídney', 'Melbourne', 'Canberra', 'Perth', '3', 'no', 'si', 0, 0, 35, 'Geografía'),
(6, '¿Cuál es el país más poblado del mundo?', 'India', 'Estados Unidos', 'Indonesia', 'China', '4', 'no', 'si', 0, 0, 50, 'Geografía'),
(7, '¿En qué océano se encuentra la isla de Madagascar?', 'Atlántico', 'Pacífico', 'Índico', 'Ártico', '3', 'no', 'si', 0, 0, 60, 'Geografía'),
(8, '¿Cuál es la capital de Canadá?', 'Toronto', 'Vancouver', 'Ottawa', 'Montreal', '3', 'no', 'si', 0, 0, 25, 'Geografía'),
(9, '¿Dónde está el desierto del Sahara?', 'Asia', 'África', 'América del Sur', 'Australia', '2', 'no', 'si', 0, 0, 45, 'Geografía'),
(10, '¿Qué país tiene la mayor cantidad de islas?', 'Canadá', 'Suecia', 'Filipinas', 'Indonesia', '2', 'no', 'si', 0, 0, 70, 'Geografía'),
(11, '¿En qué año comenzó la Segunda Guerra Mundial?', '1939', '1941', '1945', '1936', '1', 'no', 'si', 0, 0, 30, 'Historia'),
(12, '¿Quién fue el primer presidente de los Estados Unidos?', 'Abraham Lincoln', 'Thomas Jefferson', 'George Washington', 'John Adams', '3', 'no', 'si', 0, 0, 20, 'Historia'),
(13, '¿Cuál de estos países fue parte de la Unión Soviética?', 'Polonia', 'Rusia', 'Finlandia', 'Austria', '2', 'no', 'si', 0, 0, 40, 'Historia'),
(14, '¿Quién fue Cleopatra?', 'Reina de Roma', 'Reina de Egipto', 'Emperatriz China', 'Princesa Persa', '2', 'no', 'si', 0, 0, 50, 'Historia'),
(15, '¿En qué año cayó el Muro de Berlín?', '1985', '1989', '1991', '1995', '2', 'no', 'si', 0, 0, 25, 'Historia'),
(16, '¿Quién fue el primer hombre en pisar la Luna?', 'Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Michael Collins', '1', 'no', 'si', 0, 0, 30, 'Historia'),
(17, '¿Cuál fue la civilización que construyó Machu Picchu?', 'Aztecas', 'Mayas', 'Incas', 'Olmecas', '3', 'no', 'si', 0, 0, 35, 'Historia'),
(18, '¿En qué año comenzó la Revolución Francesa?', '1776', '1789', '1804', '1815', '2', 'no', 'si', 0, 0, 45, 'Historia'),
(19, '¿Quién fue el líder de la independencia de la India?', 'Nelson Mandela', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', '2', 'no', 'si', 0, 0, 40, 'Historia'),
(20, '¿Dónde se firmó la Declaración de Independencia de los Estados Unidos?', 'Boston', 'Nueva York', 'Filadelfia', 'Washington D.C.', '3', 'no', 'si', 0, 0, 50, 'Historia'),
(21, '¿En qué deporte se utiliza un balón de voleibol?', 'Fútbol', 'Baloncesto', 'Voleibol', 'Béisbol', '3', 'no', 'si', 0, 0, 10, 'Deportes'),
(22, '¿Quién ganó el Mundial de Fútbol en 2018?', 'Brasil', 'Francia', 'Alemania', 'Argentina', '2', 'no', 'si', 0, 0, 30, 'Deportes'),
(23, '¿Cuántos jugadores forman un equipo de baloncesto?', '5', '7', '6', '8', '1', 'no', 'si', 0, 0, 20, 'Deportes'),
(24, '¿En qué país se originaron los Juegos Olímpicos?', 'Italia', 'Grecia', 'Egipto', 'China', '2', 'no', 'si', 0, 0, 15, 'Deportes'),
(25, '¿Quién tiene el récord de más títulos de Grand Slam en tenis masculino?', 'Rafael Nadal', 'Roger Federer', 'Novak Djokovic', 'Andy Murray', '3', 'no', 'si', 0, 0, 50, 'Deportes'),
(26, '¿Qué deporte se practica en la NBA?', 'Hockey', 'Béisbol', 'Baloncesto', 'Fútbol Americano', '3', 'no', 'si', 0, 0, 15, 'Deportes'),
(27, '¿Qué atleta ganó ocho medallas de oro en los Juegos Olímpicos de Pekín 2008?', 'Usain Bolt', 'Michael Phelps', 'Carl Lewis', 'Mark Spitz', '2', 'no', 'si', 0, 0, 70, 'Deportes'),
(28, '¿Cuál es el equipo de fútbol con más Champions League ganadas?', 'AC Milan', 'FC Barcelona', 'Real Madrid', 'Liverpool', '3', 'no', 'si', 0, 0, 40, 'Deportes'),
(29, '¿En qué deporte se utiliza un bate y una pelota?', 'Baloncesto', 'Voleibol', 'Béisbol', 'Fútbol', '3', 'no', 'si', 0, 0, 10, 'Deportes'),
(30, '¿Quién es conocido como \"La Pulga\" en el fútbol?', 'Cristiano Ronaldo', 'Lionel Messi', 'Neymar', 'Kylian Mbappé', '2', 'no', 'si', 0, 0, 25, 'Deportes'),
(31, '¿Quién pintó la Mona Lisa?', 'Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Claude Monet', '2', 'no', 'si', 0, 0, 20, 'Arte'),
(32, '¿En qué ciudad se encuentra el Museo del Louvre?', 'Madrid', 'Roma', 'París', 'Berlín', '3', 'no', 'si', 0, 0, 15, 'Arte'),
(33, '¿Quién es el autor de \"La persistencia de la memoria\"?', 'Salvador Dalí', 'Pablo Picasso', 'Joan Miró', 'Henri Matisse', '1', 'no', 'si', 0, 0, 30, 'Arte'),
(34, '¿Cuál de estos es un cuadro de Vincent van Gogh?', 'El grito', 'La noche estrellada', 'Guernica', 'Las Meninas', '2', 'no', 'si', 0, 0, 25, 'Arte'),
(35, '¿Qué artista pintó el techo de la Capilla Sixtina?', 'Miguel Ángel', 'Donatello', 'Leonardo da Vinci', 'Rafael', '1', 'no', 'si', 0, 0, 30, 'Arte'),
(36, '¿Quién escribió \"Hamlet\"?', 'Edgar Allan Poe', 'William Shakespeare', 'Oscar Wilde', 'Charles Dickens', '2', 'no', 'si', 0, 0, 40, 'Arte'),
(37, '¿En qué siglo vivió Rembrandt?', 'XV', 'XVI', 'XVII', 'XVIII', '3', 'no', 'si', 0, 0, 45, 'Arte'),
(38, '¿Cuál es la técnica de pintar en paredes húmedas?', 'Óleo', 'Pastel', 'Acuarela', 'Fresco', '4', 'no', 'si', 0, 0, 50, 'Arte'),
(39, '¿Qué estilo es característico de Pablo Picasso?', 'Impresionismo', 'Surrealismo', 'Cubismo', 'Romanticismo', '3', 'no', 'si', 0, 0, 40, 'Arte'),
(40, '¿Quién compuso \"Las Cuatro Estaciones\"?', 'Mozart', 'Vivaldi', 'Beethoven', 'Bach', '2', 'no', 'si', 0, 0, 25, 'Arte'),
(41, '¿Cuál es el planeta más grande del sistema solar?', 'Tierra', 'Marte', 'Júpiter', 'Saturno', '3', 'no', 'si', 0, 0, 20, 'Ciencia'),
(42, '¿Qué gas es esencial para la respiración humana?', 'Hidrógeno', 'Nitrógeno', 'Oxígeno', 'Dióxido de Carbono', '3', 'no', 'si', 0, 0, 15, 'Ciencia'),
(43, '¿Quién es conocido como el padre de la teoría de la relatividad?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Tesla', '2', 'no', 'si', 0, 0, 40, 'Ciencia'),
(44, '¿Cuál es el metal más ligero?', 'Aluminio', 'Oro', 'Litio', 'Plomo', '3', 'no', 'si', 0, 0, 50, 'Ciencia'),
(45, '¿Qué tipo de célula carece de núcleo?', 'Célula vegetal', 'Célula animal', 'Célula procariota', 'Célula eucariota', '3', 'no', 'si', 0, 0, 45, 'Ciencia'),
(46, '¿Cuál es la sustancia que le da color a las plantas?', 'Clorofila', 'Melanina', 'Hemoglobina', 'Caroteno', '1', 'no', 'si', 0, 0, 25, 'Ciencia'),
(47, '¿Cuántos elementos tiene la tabla periódica?', '108', '118', '98', '128', '2', 'no', 'si', 0, 0, 30, 'Ciencia'),
(48, '¿Quién desarrolló el principio de la flotabilidad?', 'Galileo', 'Arquímedes', 'Pascal', 'Einstein', '2', 'no', 'si', 0, 0, 60, 'Ciencia'),
(49, '¿Qué es H2O?', 'Hidrógeno', 'Agua', 'Oxígeno', 'Helio', '2', 'no', 'si', 0, 0, 10, 'Ciencia'),
(50, '¿Cuál es el órgano más grande del cuerpo humano?', 'Corazón', 'Hígado', 'Piel', 'Cerebro', '3', 'no', 'si', 0, 0, 35, 'Ciencia'),
(51, '¿Quién interpretó a Jack en Titanic?', 'Brad Pitt', 'Leonardo DiCaprio', 'Tom Cruise', 'Johnny Depp', '2', 'no', 'si', 0, 0, 20, 'Entretenimiento'),
(52, '¿Cuál es el nombre del villano en Los Vengadores?', 'Ultrón', 'Loki', 'Thanos', 'Hela', '3', 'no', 'si', 0, 0, 40, 'Entretenimiento'),
(53, '¿En qué serie aparece \"Walter White\"?', 'Breaking Bad', 'The Sopranos', 'Lost', 'Prison Break', '1', 'no', 'si', 0, 0, 15, 'Entretenimiento'),
(54, '¿Cuál es la saga de libros más vendida de J.K. Rowling?', 'El Señor de los Anillos', 'Harry Potter', 'Crepúsculo', 'Las Crónicas de Narnia', '2', 'no', 'si', 0, 0, 25, 'Entretenimiento'),
(55, '¿Quién es el superhéroe que es también Bruce Wayne?', 'Superman', 'Iron Man', 'Batman', 'Spider-Man', '3', 'no', 'si', 0, 0, 20, 'Entretenimiento'),
(56, '¿Cuál de estos personajes es amigo de Shrek?', 'Simba', 'Mickey Mouse', 'Burro', 'El Gato con Botas', '3', 'no', 'si', 0, 0, 15, 'Entretenimiento'),
(57, '¿Cuál es el nombre del planeta natal de Superman?', 'Tierra', 'Kripton', 'Marte', 'Vulcano', '2', 'no', 'si', 0, 0, 35, 'Entretenimiento'),
(58, '¿Qué personaje es famoso por decir \"Hakuna Matata\"?', 'Simba', 'Timón y Pumba', 'Rafiki', 'Scar', '2', 'no', 'si', 0, 0, 20, 'Entretenimiento'),
(59, '¿Cuál de estos cantantes es conocido como \"El Rey del Pop\"?', 'Elvis Presley', 'Michael Jackson', 'Prince', 'Freddie Mercury', '2', 'no', 'si', 0, 0, 50, 'Entretenimiento'),
(60, '¿En qué película se escucha la frase \"Yo soy tu padre\"?', 'Titanic', 'Matrix', 'Star Wars', 'Jurassic Park', '3', 'no', 'si', 0, 0, 25, 'Entretenimiento');

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
(1, 1, 39),
(2, 2, 38),
(3, 2, 54),
(4, 2, 18),
(5, 3, 15),
(6, 3, 1),
(7, 3, 39),
(8, 3, 36),
(9, 3, 51),
(10, 3, 13),
(11, 3, 10),
<<<<<<< HEAD
(12, 3, 60),
(13, 5, 30),
(14, 6, 40),
(15, 9, 2),
(16, 9, 7),
(17, 9, 28),
(18, 9, 23),
(19, 10, 26),
(20, 10, 49),
(21, 10, 54),
(22, 10, 59),
(23, 12, 49),
(24, 12, 41),
(25, 12, 36),
(26, 13, 13),
(27, 13, 55),
(28, 13, 24),
(29, 13, 9),
(30, 13, 56),
(31, 13, 58),
(32, 13, 12);
=======
(12, 3, 60);
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

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
<<<<<<< HEAD

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `pregunta_id`, `motivo`, `fecha`, `estado`) VALUES
(1, 52, 'En la primer pelicula es Loki', '2024-10-30 23:33:36', 'pendiente');
=======
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

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
  `nivel` tinyint(3) UNSIGNED DEFAULT 0,
  `token` varchar(64) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `UUID`, `nombre_usuario`, `contrasenia`, `nombre_completo`, `anio_nacimiento`, `sexo`, `pais`, `ciudad`, `mail`, `foto_perfil`, `tipo_usuario`, `fecha_registro`, `nivel`, `token`, `activo`) VALUES
(1, '1730243068672169fcd6b912.37226186', 'admin1', '$2y$10$3PFr39McNRO1UjyN7tNH5.eW8ulcmmOdoFrxXoM9v/qkn.7MlDBhW', 'administrador 1', '1998-02-11', 'M', 'Brasil', 'Río de Janeiro', 'checchia47@gmail.com', '../public/perfiles/admin1.svg', 'admin', '2024-10-29', 0, '9f03a77b4b8a7f96427ada99079f0e21', 1),
(2, '173024312067216a30277611.66937124', 'admin2', '$2y$10$rMd/e0Sv5zL8hQnNouT/TeZYLF2WppaEMNNr2tv8naF6tS7IxGjGK', 'administrador 2', '1998-11-11', 'F', 'Uruguay', 'La Paz', 'checchia47@gmail.com', '../public/perfiles/admin2.svg', 'admin', '2024-10-29', 0, '9d8bf23e18ba86703d0229529214faf8', 1),
(3, '173024318367216a6f1ada69.08162378', 'editor1', '$2y$10$W2dr2RhAft9rXVWohdrzse30D3kbNymTb/nW8x6RrEEhQ/X1KjJrW', 'editor 1', '0998-08-18', 'M', 'Argentina', 'Zárate', 'checchia47@gmail.com', '../public/perfiles/editor1.svg', 'editor', '2024-10-29', 0, 'd33f962d306933510570586e542fad66', 1),
(4, '173024323967216aa7dab492.88264967', 'editor2', '$2y$10$LYQrLEGVRuX3YmcrMk2gw.hp0QlX8ysA8Fi6q/iEapegIMqBSilvS', 'editor 2', '1996-04-14', 'F', 'Argentina', 'Pedanía Punta del Agua', 'checchia47@gmail.com', '../public/perfiles/editor2.svg', 'editor', '2024-10-29', 0, '0651639a87da9ed235fa584977ed6e98', 1),
(5, '173024329067216ada7677a3.98511133', 'jugador1', '$2y$10$owb8HRYSOPLzs/WItiPf/eQsFCYiOSOPd8aS2V7Yox17KbGhxviEi', 'jugador 1', '1999-02-17', 'M', 'Argentina', 'Castelar', 'checchia47@gmail.com', '../public/perfiles/jugador1.svg', 'jugador', '2024-10-29', 0, '0b17ea8082492a8b1ba782e47e198d53', 1),
(6, '173024333167216b038ce6e1.97310869', 'jugador2', '$2y$10$lExY2O5z5r6Q3rglGcHZG.vNZuJaONCHkZChW3WcSaCnTwP9X1d4W', 'jugador 2', '1990-12-11', 'F', 'Brasil', 'Orizona', 'checchia47@gmail.com', '../public/perfiles/jugador2.svg', 'jugador', '2024-10-29', 0, '20f21da3c0a7060a7c5f7271a78f6586', 1),
(7, '173024339267216b409efe16.20480083', 'test', '$2y$10$IAaH1BhabxMFeNIXq.91eOCJ31rB7hEWPW29p0DGEAs.dW8fEfasq', 'test test', '2000-12-12', 'O', 'Chile', 'Buin', 'checchia47@gmail.com', '../public/perfiles/test.svg', 'jugador', '2024-10-29', 0, '18dae336a1d3417f7e690f5f682845e6', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `id_jugador` (`id_jugador`);

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
<<<<<<< HEAD
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
=======
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
<<<<<<< HEAD
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
=======
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
<<<<<<< HEAD
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
=======
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
>>>>>>> 37b601d95bc112166d12e597490b01132f59e709

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partidas`
--
ALTER TABLE `partidas`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
