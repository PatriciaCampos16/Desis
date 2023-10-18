-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2023 a las 20:56:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre_candidato` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre_candidato`) VALUES
(1, 'Luisa Morales'),
(2, 'Raj Patel'),
(3, 'Elena Fernandez'),
(4, 'Mikhail Petrov'),
(5, 'Sophie Dupont'),
(6, 'Diego Ramirez'),
(7, 'Aisha Khan'),
(8, 'Giovanni Rossi'),
(9, 'Isabella Costa'),
(10, 'Khaled Al-Farsi'),
(11, 'Carlos Rodriguez'),
(12, 'Isabel Gutierrez'),
(13, 'Javier Hernandez'),
(14, 'Camila Silva'),
(15, 'Ricardo Lima'),
(16, 'Marina Martinez'),
(17, 'Luis Flores'),
(18, 'Gabriela Torres'),
(19, 'Juan Carlos Mendoza'),
(20, 'Valentina Morales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `nombre_comuna` varchar(255) NOT NULL,
  `id_region` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `nombre_comuna`, `id_region`) VALUES
(1, 'Alto Hospicio', 2),
(2, 'Camina', 2),
(3, 'Colchane', 2),
(4, 'Huara', 2),
(5, 'Iquique', 2),
(6, 'Pica', 2),
(7, 'Pozo Almonte', 2),
(8, 'Antofagasta', 3),
(9, 'Calama', 3),
(10, 'Maria Elena', 3),
(11, 'Mejillones', 3),
(12, 'Ollague', 3),
(13, 'San Pedro de Atacama', 3),
(14, 'Sierra Gorda', 3),
(15, 'Taltal', 3),
(16, 'Tocopilla', 3),
(17, 'Alto del Carmen', 4),
(18, 'Caldera', 4),
(19, 'Chanaral', 4),
(20, 'Copiapo', 4),
(21, 'Diego de Almagro', 4),
(22, 'Freirina', 4),
(23, 'Huasco', 4),
(24, 'Tierra Amarilla', 4),
(25, 'Vallenar', 4),
(26, 'Andacollo', 5),
(27, 'Canela', 5),
(28, 'Combarbala', 5),
(29, 'Coquimbo', 5),
(30, 'Illapel', 5),
(31, 'La Higuera', 5),
(32, 'La Serena', 5),
(33, 'Los Vilos', 5),
(34, 'Monte Patria', 5),
(35, 'Ovalle', 5),
(36, 'Paihuano', 5),
(37, 'Punitaqui', 5),
(38, 'Rio Hurtado', 5),
(39, 'Salamanca', 5),
(40, 'Vicuna', 5),
(41, 'Angol', 11),
(42, 'Carahue', 11),
(43, 'Cholchol', 11),
(44, 'Collipulli', 11),
(45, 'Cunco', 11),
(46, 'Curacautin', 11),
(47, 'Curarrehue', 11),
(48, 'Ercilla', 11),
(49, 'Freire', 11),
(50, 'Galvarino', 11),
(51, 'Gorbea', 11),
(52, 'Lautaro', 11),
(53, 'Loncoche', 11),
(54, 'Lonquimay', 11),
(55, 'Los Sauces', 11),
(56, 'Lumaco', 11),
(57, 'Melipeuco', 11),
(58, 'Nueva Imperial', 11),
(59, 'Padre Las Casas', 11),
(60, 'Perquenco', 11),
(61, 'Perquenco', 11),
(62, 'Pitrufquen', 11),
(63, 'Pucon', 11),
(64, 'Puren', 11),
(65, 'Renaico', 11),
(66, 'Saavedra', 11),
(67, 'Temuco', 11),
(68, 'Teodoro Schmidt', 11),
(69, 'Tolten', 11),
(70, 'Traiguen', 11),
(71, 'Victoria', 11),
(72, 'Vilcun', 11),
(73, 'Villarica', 11),
(74, 'Alhue', 16),
(75, 'Buin', 16),
(76, 'Calera de Tango', 16),
(77, 'Cerrillos', 16),
(78, 'Cerro Navia', 16),
(79, 'Colina', 16),
(80, 'Conchali', 16),
(81, 'Curacavi', 16),
(82, 'El Bosque', 16),
(83, 'El Monte', 16),
(84, 'Estacion Central', 16),
(85, 'Huechuraba', 16),
(86, 'Independencia', 16),
(87, 'Isla de Maipo', 16),
(88, 'La Cisterna', 16),
(89, 'La Florida', 16),
(90, 'La Granja', 16),
(91, 'La Pintana', 16),
(92, 'La Reina', 16),
(93, 'Lampa', 16),
(94, 'Las Condes', 16),
(95, 'Lo Barnechea', 16),
(96, 'Lo Espejo', 16),
(97, 'Lo Prado', 16),
(98, 'Macul', 16),
(99, 'Maipu', 16),
(100, 'Maria Pinto', 16),
(101, 'Melipilla', 16),
(102, 'Nunoa', 16),
(103, 'Padre Hurtado', 16),
(104, 'Paine', 16),
(105, 'Pedro Aguirre Cerda', 16),
(106, 'Penaflor', 16),
(107, 'Penalolen', 16),
(108, 'Pirque', 16),
(109, 'Providencia', 16),
(110, 'Pudahuel', 16),
(111, 'Puente Alto', 16),
(112, 'Quilicura', 16),
(113, 'Quinta Normal', 16),
(114, 'Recoleta', 16),
(115, 'Renca', 16),
(116, 'San Bernardo', 16),
(117, 'San Joaquin', 16),
(118, 'San Jose de Maipo', 16),
(119, 'San Miguel', 16),
(120, 'San Pedro', 16),
(121, 'San Ramon', 16),
(122, 'Santiago', 16),
(123, 'Talagante', 16),
(124, 'Tiltil', 16),
(125, 'Vitacura', 16),
(126, 'Algarrobo', 6),
(127, 'Cabildo', 6),
(128, 'Calera', 6),
(129, 'Calle Larga', 6),
(130, 'Cartagena', 6),
(131, 'Casablanca', 6),
(132, 'Catemu', 6),
(133, 'Concon', 6),
(134, 'El Quisco', 6),
(135, 'El Tabo', 6),
(136, 'Hijuelas', 6),
(137, 'Isla de Pascua', 6),
(138, 'Juan Fernandez', 6),
(139, 'La Cruz', 6),
(140, 'La Ligua', 6),
(141, 'Limache', 6),
(142, 'Llaillay', 6),
(143, 'Los Andes', 6),
(144, 'Nogales', 6),
(145, 'Olmue', 6),
(146, 'Panquehue', 6),
(147, 'Papudo', 6),
(148, 'Petorca', 6),
(149, 'Puchuncavi', 6),
(150, 'Putaendo', 6),
(151, 'Quillota', 6),
(152, 'Quilpue', 6),
(153, 'Quintero', 6),
(154, 'Rinconada', 6),
(155, 'San Antonio', 6),
(156, 'San Esteban', 6),
(157, 'San Felipe', 6),
(158, 'Santa Maria', 6),
(159, 'Santo Domingo', 6),
(160, 'Valparaiso', 6),
(161, 'Villa Alemana', 6),
(162, 'Vina del Mar', 6),
(163, 'Zapallar', 6),
(164, 'Chepica', 7),
(165, 'Chimbarongo', 7),
(166, 'Codegua', 7),
(167, 'Coinco', 7),
(168, 'Coltauco', 7),
(169, 'Donihue', 7),
(170, 'Graneros', 7),
(171, 'La Estrella', 7),
(172, 'Las Cabras', 7),
(173, 'Litueche', 7),
(174, 'Lolol', 7),
(175, 'Machali', 7),
(176, 'Malloa', 7),
(177, 'Marchigue', 7),
(178, 'Mostazal', 7),
(179, 'Nancagua', 7),
(180, 'Navidad', 7),
(181, 'Olivar', 7),
(182, 'Palmilla', 7),
(183, 'Paredones', 7),
(184, 'Peralillo', 7),
(185, 'Peumo', 7),
(186, 'Pichidegua', 7),
(187, 'Pichilemu', 7),
(188, 'Placilla', 7),
(189, 'Pumanque', 7),
(190, 'Quinta de Tilcoco', 7),
(191, 'Rancagua', 7),
(192, 'Rengo', 7),
(193, 'Requinoa', 7),
(194, 'San Fernando', 7),
(195, 'San Vicente', 7),
(196, 'Santa Cruz', 7),
(197, 'Cauquenes', 8),
(198, 'Chanco', 8),
(199, 'Colbun', 8),
(200, 'Constitucion', 8),
(201, 'Curepto', 8),
(202, 'Curico', 8),
(203, 'Empedrado', 8),
(204, 'Hualane', 8),
(205, 'Licanten', 8),
(206, 'Linares', 8),
(207, 'Longavi', 8),
(208, 'Maule', 8),
(209, 'Molina', 8),
(210, 'Parral', 8),
(211, 'Pelarco', 8),
(212, 'Pelluhue', 8),
(213, 'Pencahue', 8),
(214, 'Rauco', 8),
(215, 'Retiro', 8),
(216, 'Rio Claro', 8),
(217, 'Romeral', 8),
(218, 'Sagrada Familia', 8),
(219, 'San Clemente', 8),
(220, 'San Javier', 8),
(221, 'San Rafael', 8),
(222, 'Talca', 8),
(223, 'Teno', 8),
(224, 'Vichuquen', 8),
(225, 'Villa Alegre', 8),
(226, 'Yerbas Buenas', 8),
(227, 'Alto Biobio', 9),
(228, 'Antauco', 9),
(229, 'Arauco', 9),
(230, 'Cabrero', 9),
(231, 'Canete', 9),
(232, 'Chiguayante', 9),
(233, 'Concepcion', 9),
(234, 'Contulmo', 9),
(235, 'Coronel', 9),
(236, 'Curanilahue', 9),
(237, 'Florida', 9),
(238, 'Hualpen', 9),
(239, 'Hualqui', 9),
(240, 'Laja', 9),
(241, 'Lebu', 9),
(242, 'Los Alamos', 9),
(243, 'Los Angeles', 9),
(244, 'Lota', 9),
(245, 'Mulchen', 9),
(246, 'Nacimiento', 9),
(247, 'Negrete', 9),
(248, 'Penco', 9),
(249, 'Quilaco', 9),
(250, 'Quilleco', 9),
(251, 'San Pedro de la Paz', 9),
(252, 'San Rosendo', 9),
(253, 'Santa Barbara', 9),
(254, 'Santa Juana', 9),
(255, 'Talcahuano', 9),
(256, 'Tirua', 9),
(257, 'Tome', 9),
(258, 'Tucapel', 9),
(259, 'Yumbel', 9),
(260, 'Ancud', 12),
(261, 'Calbuco', 12),
(262, 'Castro', 12),
(263, 'Chaiten', 12),
(264, 'Chonchi', 12),
(265, 'Cochamo', 12),
(266, 'Curaco de Velez', 12),
(267, 'Dalcahue', 12),
(268, 'Fresia', 12),
(269, 'Frutillar', 12),
(270, 'Futaleufu', 12),
(271, 'Hualaihue', 12),
(272, 'Llanquihue', 12),
(273, 'Los Muermos', 12),
(274, 'Maullin', 12),
(275, 'Osorno', 12),
(276, 'Palena', 12),
(277, 'Puerto Montt', 12),
(278, 'Puerto Octay', 12),
(279, 'Puerto Varas', 12),
(280, 'Puqueldon', 12),
(281, 'Purranque', 12),
(282, 'Puyehue', 12),
(283, 'Queilen', 12),
(284, 'Quellon', 12),
(285, 'Quemchi', 12),
(286, 'Quinchao', 12),
(287, 'Rio Negro', 12),
(288, 'San Juan de la Costa', 12),
(289, 'San Pablo', 12),
(290, 'Aysen', 14),
(291, 'Chile Chico', 14),
(292, 'Cisnes', 14),
(293, 'Cochrane', 14),
(294, 'Coyhaique', 14),
(295, 'Guaitecas', 14),
(296, 'Lago Verde', 14),
(297, 'O Higgins', 14),
(298, 'Rio Ibanez', 14),
(299, 'Tortel', 14),
(300, 'Cabo de Hornos', 15),
(301, 'Laguna Blanca', 15),
(302, 'Natales', 15),
(303, 'Porvenir', 15),
(304, 'Primavera', 15),
(305, 'Punta Arenas', 15),
(306, 'Rio Verde', 15),
(307, 'San Gregorio', 15),
(308, 'Timaukel', 15),
(309, 'Torres del Paine', 15),
(310, 'Corral', 13),
(311, 'Futrono', 13),
(312, 'La Union', 13),
(313, 'Lago Ranco', 13),
(314, 'Lanco', 13),
(315, 'Los Lagos', 13),
(316, 'Mafil', 13),
(317, 'Mariquina', 13),
(318, 'Paillaco', 13),
(319, 'Panguipulli', 13),
(320, 'Rio Bueno', 13),
(321, 'Valdivia', 13),
(322, 'Arica', 1),
(323, 'Camarones', 1),
(324, 'General Lagos', 1),
(325, 'Putre', 1),
(326, 'Bulnes', 10),
(327, 'Chillan', 10),
(328, 'Chillan Viejo', 10),
(329, 'Cobquecura', 10),
(330, 'Coelemu', 10),
(331, 'Coihueco', 10),
(332, 'El Carmen', 10),
(333, 'Ninhue', 10),
(334, 'Niquen', 10),
(335, 'Pemuco', 10),
(336, 'Pinto', 10),
(337, 'Portezuelo', 10),
(338, 'Quillon', 10),
(339, 'Quirihue', 10),
(340, 'Ranquil', 10),
(341, 'San Carlos', 10),
(342, 'San Fabian', 10),
(343, 'San Ignacio', 10),
(344, 'San Nicolas', 10),
(345, 'Treguaco', 10),
(346, 'Yungay', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `nombre_region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre_region`) VALUES
(1, 'XV'),
(2, 'I'),
(3, 'II'),
(4, 'III'),
(5, 'IV'),
(6, 'V'),
(7, 'VI'),
(8, 'VII'),
(9, 'VIII'),
(10, 'XVI'),
(11, 'IX'),
(12, 'X'),
(13, 'XIV'),
(14, 'XI'),
(15, 'XII'),
(16, 'RM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `rut` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `conocimiento_usuario` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `id_comuna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_apellido`, `alias`, `rut`, `email`, `conocimiento_usuario`, `activo`, `id_comuna`) VALUES
(1, 'Patricia Campos', 'Pati234', '197216948', 'p@p.cl', 'Web, TV, Redes Sociales', 1, 19),
(2, 'Leon Aranguiz', 'Leon123', '272653801', 'l@l.cl', 'Web, TV', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_candidato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`id`, `id_usuario`, `id_candidato`) VALUES
(1, 1, 3),
(2, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
