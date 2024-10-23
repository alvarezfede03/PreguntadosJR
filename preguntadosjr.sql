-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-10-2024 a las 02:34:22
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
(2, '¿Quién pintó la Capilla Sixtina?', 'Leonardo da Vinci', 'Miguel Ángel', 'Rafael', 'Donatello', '2', 'no', 'si', 0, 0, 40, 'Arte'),
(3, '¿Qué gas es necesario para la respiración humana?', 'Oxígeno', 'Nitrógeno', 'Dióxido de carbono', 'Hidrógeno', '1', 'no', 'si', 0, 0, 20, 'Ciencia'),
(4, '¿En qué año comenzó la Segunda Guerra Mundial?', '1935', '1939', '1941', '1945', '2', 'no', 'si', 0, 0, 50, 'Historia'),
(5, '¿Cuál es el animal más grande del mundo?', 'Elefante', 'Jirafa', 'Ballena azul', 'Tiburón blanco', '3', 'no', 'si', 0, 0, 10, 'Naturaleza'),
(6, '¿Cuál es el continente más grande?', 'África', 'América', 'Asia', 'Europa', '3', 'no', 'si', 0, 0, 20, 'Geografía'),
(7, '¿Qué órgano bombea la sangre en el cuerpo humano?', 'Corazón', 'Pulmones', 'Hígado', 'Riñones', '1', 'no', 'si', 0, 0, 5, 'Ciencia'),
(8, '¿Quién escribió \"Romeo y Julieta\"?', 'Shakespeare', 'Hemingway', 'Tolkien', 'Orwell', '1', 'no', 'si', 0, 0, 60, 'Literatura'),
(9, '¿Cuál es el planeta más grande del sistema solar?', 'Tierra', 'Júpiter', 'Marte', 'Saturno', '2', 'no', 'si', 0, 0, 15, 'Ciencia'),
(10, '¿En qué país se encuentra la Torre Eiffel?', 'España', 'Francia', 'Italia', 'Reino Unido', '2', 'no', 'si', 0, 0, 10, 'Geografía'),
(11, '¿Cuál es el metal más abundante en la Tierra?', 'Aluminio', 'Hierro', 'Cobre', 'Oro', '1', 'no', 'si', 0, 0, 50, 'Ciencia'),
(12, '¿Qué país ganó el Mundial de Fútbol en 2014?', 'Brasil', 'Argentina', 'Alemania', 'España', '3', 'no', 'si', 0, 0, 30, 'Deportes'),
(13, '¿Quién es el autor de \"Cien años de soledad\"?', 'Gabriel García Márquez', 'Mario Vargas Llosa', 'Julio Cortázar', 'Isabel Allende', '1', 'no', 'si', 0, 0, 45, 'Literatura'),
(14, '¿Cuál es la moneda oficial del Reino Unido?', 'Dólar', 'Euro', 'Libra esterlina', 'Franco', '3', 'no', 'si', 0, 0, 25, 'Economía'),
(15, '¿Qué elemento tiene el símbolo \"O\" en la tabla periódica?', 'Oro', 'Oxígeno', 'Osmio', 'Oxalato', '2', 'no', 'si', 0, 0, 20, 'Ciencia'),
(16, '¿Cuántos jugadores tiene un equipo de fútbol?', '9', '10', '11', '12', '3', 'no', 'si', 0, 0, 5, 'Deportes'),
(17, '¿Quién fue el primer presidente de Estados Unidos?', 'Thomas Jefferson', 'Abraham Lincoln', 'George Washington', 'John Adams', '3', 'no', 'si', 0, 0, 70, 'Historia'),
(18, '¿Cuál es el libro sagrado del Islam?', 'Torá', 'Biblia', 'Corán', 'Vedas', '3', 'no', 'si', 0, 0, 40, 'Religión'),
(19, '¿En qué continente está ubicado Egipto?', 'África', 'Asia', 'Europa', 'América', '1', 'no', 'si', 0, 0, 30, 'Geografía'),
(20, '¿Cuál es el océano más grande?', 'Atlántico', 'Pacífico', 'Índico', 'Ártico', '2', 'no', 'si', 0, 0, 15, 'Geografía'),
(21, '¿Quién descubrió América?', 'Cristóbal Colón', 'Américo Vespucio', 'Magallanes', 'Marco Polo', '1', 'no', 'si', 0, 0, 50, 'Historia'),
(22, '¿Cuál es el elemento más ligero?', 'Helio', 'Oxígeno', 'Hidrógeno', 'Carbono', '3', 'no', 'si', 0, 0, 20, 'Ciencia'),
(23, '¿Qué país tiene la mayor población del mundo?', 'India', 'Estados Unidos', 'China', 'Brasil', '3', 'no', 'si', 0, 0, 10, 'Geografía'),
(24, '¿Cuántos planetas hay en el sistema solar?', '7', '8', '9', '10', '2', 'no', 'si', 0, 0, 40, 'Ciencia'),
(25, '¿Cuál es el idioma más hablado en el mundo?', 'Inglés', 'Español', 'Chino mandarín', 'Árabe', '3', 'no', 'si', 0, 0, 50, 'Cultura general'),
(26, '¿Qué instrumento tiene teclas blancas y negras?', 'Guitarra', 'Piano', 'Batería', 'Violín', '2', 'no', 'si', 0, 0, 15, 'Arte'),
(27, '¿Qué inventor es conocido por desarrollar la bombilla?', 'Nikola Tesla', 'Isaac Newton', 'Albert Einstein', 'Thomas Edison', '4', 'no', 'si', 0, 0, 60, 'Ciencia'),
(28, '¿Quién escribió \"Don Quijote de la Mancha\"?', 'Cervantes', 'Shakespeare', 'Hemingway', 'Tolstoy', '1', 'no', 'si', 0, 0, 40, 'Literatura'),
(29, '¿Cuál es la capital de Japón?', 'Tokio', 'Kioto', 'Osaka', 'Nara', '1', 'no', 'si', 0, 0, 10, 'Geografía'),
(30, '¿Quién desarrolló la teoría de la relatividad?', 'Newton', 'Galileo', 'Einstein', 'Bohr', '3', 'no', 'si', 0, 0, 30, 'Ciencia'),
(31, '¿Qué planeta es conocido como el planeta rojo?', 'Marte', 'Venus', 'Júpiter', 'Mercurio', '1', 'no', 'si', 0, 0, 10, 'Ciencia'),
(32, '¿En qué año cayó el Muro de Berlín?', '1985', '1987', '1989', '1991', '3', 'no', 'si', 0, 0, 50, 'Historia'),
(33, '¿Cuál es el símbolo químico del hierro?', 'Fe', 'Ir', 'I', 'H', '1', 'no', 'si', 0, 0, 20, 'Ciencia'),
(34, '¿Qué país es famoso por sus pirámides?', 'México', 'China', 'Egipto', 'Grecia', '3', 'no', 'si', 0, 0, 10, 'Historia'),
(35, '¿Quién escribió \"La Odisea\"?', 'Homero', 'Sófocles', 'Platón', 'Virgilio', '1', 'no', 'si', 0, 0, 40, 'Literatura'),
(36, '¿Qué país tiene más islas?', 'Filipinas', 'Noruega', 'Suecia', 'Indonesia', '3', 'no', 'si', 0, 0, 30, 'Geografía'),
(37, '¿Cuál es el país más grande del mundo por área?', 'Canadá', 'Estados Unidos', 'China', 'Rusia', '4', 'no', 'si', 0, 0, 10, 'Geografía'),
(38, '¿En qué año llegó el hombre a la Luna?', '1965', '1969', '1972', '1976', '2', 'no', 'si', 0, 0, 30, 'Ciencia'),
(39, '¿Cuál es la capital de Canadá?', 'Toronto', 'Ottawa', 'Vancouver', 'Montreal', '2', 'no', 'si', 0, 0, 20, 'Geografía'),
(40, '¿Qué invento es atribuido a Alexander Graham Bell?', 'Teléfono', 'Televisión', 'Internet', 'Radio', '1', 'no', 'si', 0, 0, 50, 'Ciencia'),
(41, '¿Cuál es el océano más pequeño?', 'Atlántico', 'Índico', 'Ártico', 'Pacífico', '3', 'no', 'si', 0, 0, 20, 'Geografía'),
(42, '¿Qué país está más al norte del mundo?', 'Noruega', 'Rusia', 'Canadá', 'Groenlandia', '1', 'no', 'si', 0, 0, 25, 'Geografía'),
(43, '¿Cuál es el hueso más largo del cuerpo humano?', 'Fémur', 'Húmero', 'Tibia', 'Peroné', '1', 'no', 'si', 0, 0, 30, 'Ciencia'),
(44, '¿Quién fue el primer hombre en el espacio?', 'Neil Armstrong', 'Yuri Gagarin', 'Buzz Aldrin', 'Laika', '2', 'no', 'si', 0, 0, 40, 'Ciencia'),
(45, '¿En qué país se celebraron los primeros Juegos Olímpicos modernos?', 'Italia', 'Grecia', 'Francia', 'España', '2', 'no', 'si', 0, 0, 35, 'Historia');

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
(9, '79fa42c8-8b35-11ef-ba48-e0d55e04b0c6', 'jugador2', 'jugadorPass456', 'Jugador Dos', '1998-12-05', 'F', 'Colombia', 'Bogotá', 'jugador2@example.com', '../public/perfiles/jugador2.svg', 'jugador', '2024-10-15', 20, NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
