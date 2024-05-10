-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2024 a las 08:02:15
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
-- Base de datos: `bd_bolsas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `razon_social`, `ruc`, `direccion`, `telefono`, `correo`, `id_rol`, `id_usuario`) VALUES
(5, 'UPEU-juliaca', '20859632542', 'JULIACA', '985968574', 'atencion@upeu.edu.pe', 1, 1),
(8, 'Espiga de trigo', '20547165856', 'JULIACA', '965874156', 'ECED@upeu.edu.pe', 2, 2),
(9, 'COCACOLA', '20548965857', 'JULIACA', '965856325', 'ECED@cocacola.pe', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_laboral`
--

CREATE TABLE `oferta_laboral` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `remuneracion` decimal(10,2) DEFAULT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `tipo` enum('presencial','remoto') NOT NULL,
  `limite_postulante` int(11) DEFAULT NULL,
  `categoria` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta_laboral`
--

INSERT INTO `oferta_laboral` (`id`, `id_empresa`, `titulo`, `descripcion`, `fecha_publicacion`, `fecha_cierre`, `remuneracion`, `ubicacion`, `tipo`, `limite_postulante`, `categoria`) VALUES
(2, 8, 'TRABAJO', 'trabaja', '2024-04-25', '2024-04-30', 2000.00, 'juliaca', 'remoto', 11, ''),
(4, 8, 'TRABAJO3', 'gggggg', '2024-04-27', '2024-05-09', 2000.00, 'juliaca', 'remoto', 20, ''),
(5, 9, 'TRABAJOccc', 'dcdc', '2024-04-28', '2024-04-29', 2000.00, 'juliaca', 'remoto', 25, ''),
(12, 5, 'arquitecto', 'rbt5btrb', '2024-04-17', '2024-05-10', 2000.00, 'juliaca', 'remoto', 12, ''),
(13, 8, 'Diseñador', 'edervcefvr', '2024-04-30', '2024-05-11', 1544.00, 'juliaca', 'presencial', 7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulaciones`
--

CREATE TABLE `postulaciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_oferta` int(11) NOT NULL,
  `fecha_hora_postulante` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_actual` enum('abierto','cerrado') NOT NULL,
  `usuario_seleccionado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postulaciones`
--

INSERT INTO `postulaciones` (`id`, `id_usuario`, `id_oferta`, `fecha_hora_postulante`, `estado_actual`, `usuario_seleccionado`) VALUES
(2, 1, 2, '2024-05-02 22:18:47', 'abierto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `ruta_cv` varchar(255) DEFAULT NULL,
  `asignacion` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `dni`, `direccion`, `telefono`, `usuario`, `contrasenia`, `id_rol`, `ruta_foto`, `ruta_cv`, `asignacion`) VALUES
(1, 'jhamil', 'apaza', '58749658', 'juliaca', '958746855', 'jhamil.apaza', '123456', 1, NULL, NULL, 'SI'),
(2, 'jorge', 'perezz', '58746952', '', '7857', 'jorge', '123456', 2, NULL, NULL, 'SI'),
(3, 'Carlos', 'Ramos', '58749625', '', '985968574', 'carlos', '123456', 2, NULL, NULL, 'SI'),
(4, 'Pedro', 'perez', '58746952', '', '985968574', 'pedro', '123456', 3, NULL, NULL, 'NO'),
(6, 'Carlos', 'Torres', '55152355', '', '965874156', '', '', 3, NULL, '../data/img/Documento.pdf', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `postulaciones`
--
ALTER TABLE `postulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_oferta` (`id_oferta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `postulaciones`
--
ALTER TABLE `postulaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD CONSTRAINT `oferta_laboral_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `postulaciones`
--
ALTER TABLE `postulaciones`
  ADD CONSTRAINT `postulaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `postulaciones_ibfk_2` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_laboral` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
