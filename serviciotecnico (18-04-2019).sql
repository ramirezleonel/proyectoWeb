-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2019 a las 14:27:44
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `serviciotecnico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `cod_item` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `precio unitario` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `contado` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `cod_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`cod_nivel`, `nombre_nivel`) VALUES
(3, 'ADMINISTRADOR'),
(2, 'SECRETARIA'),
(1, 'TECNICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `num_presupuesto` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `fecha` date NOT NULL,
  `forma_pago` varchar(120) DEFAULT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto_item`
--

CREATE TABLE `presupuesto_item` (
  `num_presupuesto` int(11) NOT NULL,
  `cod_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni_usuario` int(11) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `cod_nivel` int(11) DEFAULT NULL,
  `estado_usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni_usuario`, `contrasenia`, `nombre`, `apellido`, `cod_nivel`, `estado_usuario`) VALUES
(12345678, '123456', 'admin', 'admin', 3, 'ONLINE'),
(15654456, '123456', 'Carlos', 'Massera', 4, 'ONLINE'),
(16660440, '123456', 'Pablo Emilio', 'Escobar', 1, 'ONLINE'),
(31456665, '123456', 'Roberto Alsides', 'Robles', 2, 'ONLINE'),
(34456123, '123456', 'Carla', 'Gomez', 1, 'ONLINE'),
(45454545, '123456', 'leonel', 'ramirez', 2, 'ONLINE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`cod_item`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`cod_nivel`),
  ADD UNIQUE KEY `nombre_nivel` (`nombre_nivel`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`num_presupuesto`);

--
-- Indices de la tabla `presupuesto_item`
--
ALTER TABLE `presupuesto_item`
  ADD KEY `num_presupuesto` (`num_presupuesto`),
  ADD KEY `cod_item` (`cod_item`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni_usuario`),
  ADD KEY `cod_nivel` (`cod_nivel`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `cod_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `cod_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `num_presupuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `presupuesto_item`
--
ALTER TABLE `presupuesto_item`
  ADD CONSTRAINT `presupuesto_item_ibfk_1` FOREIGN KEY (`num_presupuesto`) REFERENCES `presupuesto` (`num_presupuesto`),
  ADD CONSTRAINT `presupuesto_item_ibfk_2` FOREIGN KEY (`cod_item`) REFERENCES `item` (`cod_item`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
