use restaurante;

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
show create table `productos_por_factura`;

-- Eliminar las relaciones entre tablas para poder eliminarlas
ALTER TABLE `facturacion` DROP FOREIGN KEY `facturacion_ibfk_3`;
ALTER TABLE `facturacion` DROP FOREIGN KEY `facturacion_ibfk_2`;
ALTER TABLE `facturacion` DROP FOREIGN KEY `facturacion_ibfk_1`;
ALTER TABLE `productos_por_factura` DROP FOREIGN KEY `productos_por_factura_ibfk_1`;
ALTER TABLE `productos_por_factura` DROP FOREIGN KEY `productos_por_factura_ibfk_2`;
ALTER TABLE `inventario` DROP FOREIGN KEY `inventario_ibfk_1`;

-- Eliminar las tablas para volver a crearlas con la nueva estructura
DROP TABLE IF EXISTS `inventario`;
DROP TABLE IF EXISTS `productos_por_factura`;
DROP TABLE IF EXISTS `facturacion`;
DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `cliente`;
DROP TABLE IF EXISTS `recurso_humano`;
DROP TABLE IF EXISTS `sedes`;

-- Crear las tablas
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

CREATE TABLE `menu` (
  `id_producto` int(6) NOT NULL,
  `nombre_producto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `precio` int(7) NOT NULL,
  `especialidad` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `medida` int(6) NOT NULL,
  `unidad_medida` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `impuesto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(15) NOT NULL,
  `id_empleado` int(15) NOT NULL,
  `id_sede` int(6) NOT NULL,
  `fecha_hora` timestamp NOT NULL,
  `subtotal` int(7) NOT NULL,
  `impuesto` int(7) NOT NULL,
  `total` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `productos_por_factura` (
  `id_item` int(6) NOT NULL,
  `id_producto` int(6) NOT NULL,
  `id_factura` int(6) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `precio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

CREATE TABLE `inventario` (
  `id_item` int(6) NOT NULL,
  `nombre_prod` varchar(30) NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `cantidades_disponibles` int NOT NULL,
  `medida` int NOT NULL,
  `unidad_medida` varchar(15) NOT NULL,
  `especialidad` varchar(15) NOT NULL,
  `id_sede` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- Definir llaves primarias y foraneas
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

ALTER TABLE `recurso_humano`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_sede` (`id_sede`);

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_producto`);

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_sede` (`id_sede`);

ALTER TABLE `productos_por_factura`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_factura` (`id_factura`);

ALTER TABLE `cliente`
  MODIFY `id_cliente` int(15) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `recurso_humano`
  MODIFY `id_empleado` int(15) NOT NULL AUTO_INCREMENT;

ALTER TABLE `facturacion`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `menu`
  MODIFY `id_producto` int(6) NOT NULL AUTO_INCREMENT;

ALTER TABLE `productos_por_factura`
  MODIFY `id_item` int(6) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sedes`
  MODIFY `id_sede` int(6) NOT NULL AUTO_INCREMENT;

ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`),
  ADD CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `recurso_humano` (`id_empleado`),
  ADD CONSTRAINT `facturacion_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
  
ALTER TABLE `inventario`  
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

ALTER TABLE `productos_por_factura`
  ADD CONSTRAINT `productos_por_factura_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `menu` (`id_producto`),
  ADD CONSTRAINT `productos_por_factura_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `facturacion` (`id_factura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;