-- phpMyAdmin SQL Dump
-- version 4.4.0-beta1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2015 a las 21:34:06
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdalbumes`
--
CREATE DATABASE IF NOT EXISTS `bdalbumes` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE bdalbumes;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `codigo_album` int(11) NOT NULL,
  `nombre_album` varchar(50) NOT NULL,
  `descripcion_album` varchar(100) NOT NULL,
  `year_album` int(11) NOT NULL
);

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`codigo_album`, `nombre_album`, `descripcion_album`, `year_album`) VALUES
(1, 'panini', 'mundial de brasil', 2014),
(2, 'supercampeones', 'mundial juvenil', 2010),
(3, 'copa america', 'futbol suramericano', 2015),
(4, 'liga de campeones', 'clubes europeos', 2015);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `codigo_seccion` int(11) NOT NULL,
  `orden_seccion` int(11) NOT NULL,
  `nombre_seccion` varchar(50) NOT NULL,
  `numerohojas_seccion` int(11) NOT NULL,
  `codigo_album` int(11) NOT NULL
)AUTO_INCREMENT=16;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`codigo_seccion`, `orden_seccion`, `nombre_seccion`, `numerohojas_seccion`, `codigo_album`) VALUES
(3, 1, 'estadios', 5, 1),
(4, 2, 'fifa', 4, 1),
(5, 3, 'equipos', 7, 1),
(6, 4, 'jugadores', 20, 1),
(7, 1, 'torneos', 5, 2),
(8, 2, 'jugadores', 15, 2),
(9, 3, 'equipos', 10, 2),
(10, 4, 'estadios', 7, 2),
(11, 1, 'historia', 5, 3),
(12, 2, 'mejores jugadores', 5, 3),
(13, 1, 'clubes', 5, 4),
(14, 2, 'jugadores', 15, 4),
(15, 3, 'estadios', 8, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`codigo_album`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`codigo_seccion`),
  ADD KEY `codigo_album` (`codigo_album`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `codigo_seccion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`codigo_album`) REFERENCES `album` (`codigo_album`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
