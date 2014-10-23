-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2014 a las 02:54:35
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `lab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `idUsuario`, `fecha`, `total`) VALUES
(1, 1, '2013-09-23 00:00:00', 402),
(2, 2, '2013-09-23 00:00:00', 906),
(3, 1, '2013-09-23 00:00:00', 802),
(4, 1, '2013-09-23 00:00:00', 2),
(5, 1, '2013-09-23 00:00:00', 16),
(6, 2, '2014-09-30 00:00:00', 10),
(7, 2, '2014-09-30 00:00:00', 20),
(8, 2, '2014-09-30 00:00:00', 20),
(9, 2, '2014-09-30 00:00:00', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE IF NOT EXISTS `detallecompra` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`id_detalle`, `id_compra`, `precio`, `id_producto`, `cantidad`) VALUES
(8, 1, 2.00, 3, 1),
(9, 1, 400.00, 2, 1),
(10, 2, 6.00, 3, 3),
(11, 2, 800.00, 2, 2),
(12, 2, 100.00, 1, 1),
(13, 3, 2.00, 3, 1),
(14, 3, 800.00, 2, 2),
(15, 4, 2.00, 3, 1),
(16, 5, 16.00, 3, 8),
(17, 6, 10.00, 3, 5),
(18, 7, 20.00, 3, 10),
(19, 8, 20.00, 3, 10),
(20, 9, 10.00, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `estado`, `stock`, `precio`) VALUES
(1, 'tele', 'plasma', 1, 1000, 100.00),
(2, 'microondas', 'bueno', 1, 100, 400.00),
(3, 'clavo', 'aluminio', 1, 14000, 2.00),
(4, 'Cepillos', 'Azul', 1, 2500, 4.00),
(5, 'Lija', '120', 1, 1500, 3.00),
(6, 'Lija', '150', 1, 150, 8.00),
(7, 'Pincel', '200', 1, 10, 9.00),
(8, 'Lata ', 'Azul', 1, 1, 20.00),
(9, 'Membrana', 'Azul', 1, 2, 25.00),
(10, 'Articulo', 'Modificable', 1, 35, 25.00),
(11, '', '', 0, 0, 0.00),
(12, '', '', 0, 0, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `pass`, `estado`, `direccion`, `telefono`, `documento`, `nivel`) VALUES
(1, 'fer', 'martinez', 'asd', 0, 'afdsa', 123, 123, 2),
(2, 'mica', 'sorano', 'asds', 1, 'camet', 1123, 12345, 2),
(3, 'admin', 'asd', 'admin', 1, 'gfdgfd', 23423, 23423, 1),
(4, 'Yanina', 'Gaitero', 'Admin01', 0, 'italia3973', 4750494, 32126934, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
