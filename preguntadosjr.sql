-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-10-2024 a las 14:52:48
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
  `resultado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '315e849d-8b33-11ef-ba48-e0d55e04b0c6', 'admin1', 'adminpass1', 'Administrador Uno', '1980-05-12', 'M', 'Argentina', 'Buenos Aires', 'admin1@example.com', '../public/perfiles/admin1.svg', 'admin', '2024-10-15', 0, NULL, NULL),
(2, '315e950f-8b33-11ef-ba48-e0d55e04b0c6', 'admin2', 'adminpass2', 'Administrador Dos', '1985-08-20', 'F', 'España', 'Madrid', 'admin2@example.com', '../public/perfiles/admin2.svg', 'admin', '2024-10-15', 0, NULL, NULL),
(6, '79fa418b-8b35-11ef-ba48-e0d55e04b0c6', 'editor1', 'editorPass456', 'Editor Uno', '1990-06-30', 'F', 'España', 'Madrid', 'editor1@example.com', '../public/perfiles/editor1.svg', 'editor', '2024-10-15', 0, NULL, NULL),
(7, '79fa4247-8b35-11ef-ba48-e0d55e04b0c6', 'editor2', 'editorPass789', 'Editor Dos', '1992-11-22', 'M', 'México', 'Ciudad de México', 'editor2@example.com', '../public/perfiles/editor2.svg', 'editor', '2024-10-15', 0, NULL, NULL),
(8, '79fa4289-8b35-11ef-ba48-e0d55e04b0c6', 'jugador1', 'jugadorPass123', 'Jugador Uno', '1995-08-10', 'M', 'Chile', 'Santiago', 'jugador1@example.com', '../public/perfiles/jugador1.svg', 'jugador', '2024-10-15', 10, NULL, NULL),
(9, '79fa42c8-8b35-11ef-ba48-e0d55e04b0c6', 'jugador2', 'jugadorPass456', 'Jugador Dos', '1998-12-05', 'F', 'Colombia', 'Bogotá', 'jugador2@example.com', '../public/perfiles/jugador2.svg', 'jugador', '2024-10-15', 20, NULL, NULL),
(35, '17297414696719c29db62376.75128480', 'test', '$2y$10$s/10ix8GLC6BU4EfntVYjudsiC/ohJhehulG01kzNd9STFlDKJ.ty', 'test1', '2005-05-11', 'M', 'Argentina', 'Remedios de Escalada', 'checchia47@gmail.com', '../public/perfiles/test.svg', 'jugador', '2024-10-24', 0, 'f5cdcc9ddc6cd41db679db0c04ebde85', 1);

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
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `preguntas_respondidas`
--
ALTER TABLE `preguntas_respondidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
