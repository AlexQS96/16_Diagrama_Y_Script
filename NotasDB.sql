-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2021 at 04:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NotasDB`
--
DROP DATABASE IF EXISTS NotasDB;
CREATE DATABASE NotasDB;
USE NotasDB;

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Tareas'),
(2, 'Musica'),
(3, 'Supermercado');

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `id` smallint(6) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `bloquearNota` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `category` smallint(6) DEFAULT NULL,
  `usuarioID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `descripcion`, `bloquearNota`, `created_at`, `updated_at`, `category`, `usuarioID`) VALUES
(1, 'terminar tp', NULL, 0, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 2),
(2, 'terminar las compras', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 3, 3),
(3, 'repasar musica', NULL, 0, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 2, 1),
(4, 'terminar proyecto', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 4),
(5, 'limpieza', NULL, 0, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 5),
(6, 'cocinar', NULL, 0, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 9),
(7, 'terminar tarea de musica', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 2, 8),
(8, 'repasar react', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 6),
(9, 'arreglar la pc', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 1, 7),
(10, 'practicar musica', NULL, 1, '2021-12-28 15:11:50', '2021-12-28 12:11:50', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`) VALUES
(1, 'Jose', 'jose@gmail.com'),
(2, 'Marcos', 'marcos@gmail.com'),
(3, 'Lucas', 'lucas@gmail.com'),
(4, 'Maria', 'maria@gmail.com'),
(5, 'Laura', 'laura@gmail.com'),
(6, 'Lucia', 'lucia@gmail.com'),
(7, 'Camila', 'camila@gmail.com'),
(8, 'Ignacio', 'ignacio@gmail.com'),
(9, 'Tomas', 'tomas@gmail.com'),
(10, 'Luciano', 'luciano@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notas_FK` (`category`),
  ADD KEY `notas_FK_1` (`usuarioID`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_FK` FOREIGN KEY (`category`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `notas_FK_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
