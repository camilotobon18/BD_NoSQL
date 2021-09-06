-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-09-2021 a las 00:27:11
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(15) NOT NULL,
  `nombre_cliente` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `apellido_cliente` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `estado_civil` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `ciudad` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(15) NOT NULL,
  `id_empleado` int(15) NOT NULL,
  `id_sede` int(6) NOT NULL,
  `fecha_hora` timestamp NOT NULL,
  `subtotal` int(7) NOT NULL,
  `impuesto` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_producto` int(6) NOT NULL,
  `nombre_producto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `precio` int(7) NOT NULL,
  `especialidad` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `medida` int(6) NOT NULL,
  `unidad_medida` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `impuesto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_por_factura`
--

CREATE TABLE `productos_por_factura` (
  `id_item` int(6) NOT NULL,
  `id_producto` int(6) NOT NULL,
  `id_factura` int(6) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `precio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_humano`
--

CREATE TABLE `recurso_humano` (
  `id_empleado` int(15) NOT NULL,
  `nombre_empleado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_sede` int(6) NOT NULL,
  `salario` int(8) NOT NULL,
  `cargo` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(6) NOT NULL,
  `nombre_sede` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `horario_apertura` time NOT NULL,
  `horario_cierre` time NOT NULL,
  `capacidad_aforo` int(3) NOT NULL,
  `telefono` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `inventario` (
  `id_item` int(6) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `cantidades_disponibles` int NOT NULL,
  `medida` int NOT NULL,
  `unidad_medida` varchar(15) NOT NULL,
  `especialidad` varchar(15) NOT NULL,
  `id_sede` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `productos_por_factura`
--
ALTER TABLE `productos_por_factura`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `recurso_humano`
--
ALTER TABLE `recurso_humano`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_producto` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_por_factura`
--
ALTER TABLE `productos_por_factura`
  MODIFY `id_item` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recurso_humano`
--
ALTER TABLE `recurso_humano`
  MODIFY `id_empleado` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`),
  ADD CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `recurso_humano` (`id_empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `facturacion_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `facturacion_ibfk_4` FOREIGN KEY (`id_factura`) REFERENCES `productos_por_factura` (`id_factura`);
  

ALTER TABLE `inventario`  
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos_por_factura` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
