-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2025 a las 21:11:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `presucostosv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu`
--

CREATE TABLE `apu` (
  `id_apu` int(11) NOT NULL,
  `capitulo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `epp` decimal(4,2) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu_herramienta`
--

CREATE TABLE `apu_herramienta` (
  `id` int(11) NOT NULL,
  `id_apu` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu_insumo`
--

CREATE TABLE `apu_insumo` (
  `id` int(11) NOT NULL,
  `id_apu` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `desperdicio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu_mdo`
--

CREATE TABLE `apu_mdo` (
  `id` int(11) NOT NULL,
  `id_apu` int(11) NOT NULL,
  `id_mdo` int(11) NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  `tiempo_labor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_alquiler`
--

CREATE TABLE `equipo_alquiler` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `unidad_alquiler` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `id_insumo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `unidad_medida` varchar(10) DEFAULT NULL,
  `embalaje` varchar(10) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdo`
--

CREATE TABLE `mdo` (
  `id_mdo` int(11) NOT NULL,
  `profesion_obrero` varchar(100) NOT NULL,
  `factor_profesion` decimal(5,2) DEFAULT 1.00,
  `especialidad` varchar(50) DEFAULT NULL,
  `factor_especialidad` decimal(5,2) DEFAULT 1.00,
  `valor` decimal(12,3) DEFAULT NULL,
  `config_cuadrilla` varchar(10) DEFAULT NULL,
  `oficiales` int(11) DEFAULT 0,
  `auxiliares` int(11) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `id_precio` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_alquiler`
--

CREATE TABLE `precio_alquiler` (
  `id` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_proveedor_equipo` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `unidadAlquiler` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `id_presupuesto` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `direccion_cliente` varchar(150) DEFAULT NULL,
  `nit_cliente` varchar(20) DEFAULT NULL,
  `telefono_cliente` varchar(20) DEFAULT NULL,
  `nombre_obra` varchar(100) DEFAULT NULL,
  `especificaciones` text DEFAULT NULL,
  `herramientamenor` decimal(12,2) DEFAULT NULL,
  `aiu_subcontratista` decimal(5,2) DEFAULT NULL,
  `tiempo_estimado` decimal(8,2) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto_apu`
--

CREATE TABLE `presupuesto_apu` (
  `id_presupuesto` int(11) NOT NULL,
  `id_apu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_equipo`
--

CREATE TABLE `proveedor_equipo` (
  `id_proveedor_equipo` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_colombia`
--

CREATE TABLE `reg_colombia` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reg_colombia`
--

INSERT INTO `reg_colombia` (`id_municipio`, `municipio`, `departamento`) VALUES
(1, 'Leticia', 'Amazonas'),
(2, 'Puerto Nariño', 'Amazonas'),
(3, 'Medellín', 'Antioquia'),
(4, 'Abejorral', 'Antioquia'),
(5, 'Abriaqui', 'Antioquia'),
(6, 'Alejandría', 'Antioquia'),
(7, 'Amagá', 'Antioquia'),
(8, 'Amalfi', 'Antioquia'),
(9, 'Andes', 'Antioquia'),
(10, 'Angelópolis', 'Antioquia'),
(11, 'Angostura', 'Antioquia'),
(12, 'Anorí', 'Antioquia'),
(13, 'Antioquia', 'Antioquia'),
(14, 'Anzá', 'Antioquia'),
(15, 'Apartadó', 'Antioquia'),
(16, 'Arboletes', 'Antioquia'),
(17, 'Argelia', 'Antioquia'),
(18, 'Armenia', 'Antioquia'),
(19, 'Barbosa', 'Antioquia'),
(20, 'Belmira', 'Antioquia'),
(21, 'Bello', 'Antioquia'),
(22, 'Betania', 'Antioquia'),
(23, 'Betulia', 'Antioquia'),
(24, 'Bolívar', 'Antioquia'),
(25, 'Briseño', 'Antioquia'),
(26, 'Buriticá', 'Antioquia'),
(27, 'Cáceres', 'Antioquia'),
(28, 'Caicedo', 'Antioquia'),
(29, 'Caldas', 'Antioquia'),
(30, 'Campamento', 'Antioquia'),
(31, 'Cañasgordas', 'Antioquia'),
(32, 'Caracolí', 'Antioquia'),
(33, 'Caramanta', 'Antioquia'),
(34, 'Carepa', 'Antioquia'),
(35, 'Carmen de Viboral', 'Antioquia'),
(36, 'Carolina', 'Antioquia'),
(37, 'Caucasia', 'Antioquia'),
(38, 'Chigorodó', 'Antioquia'),
(39, 'Cisneros', 'Antioquia'),
(40, 'Cocorná', 'Antioquia'),
(41, 'Concepción', 'Antioquia'),
(42, 'Concordia', 'Antioquia'),
(43, 'Copacabana', 'Antioquia'),
(44, 'Dabeiba', 'Antioquia'),
(45, 'Don Matías', 'Antioquia'),
(46, 'Ebéjico', 'Antioquia'),
(47, 'El Bagre', 'Antioquia'),
(48, 'Entrerríos', 'Antioquia'),
(49, 'Envigado', 'Antioquia'),
(50, 'Fredonia', 'Antioquia'),
(51, 'Frontino', 'Antioquia'),
(52, 'Giraldo', 'Antioquia'),
(53, 'Girardota', 'Antioquia'),
(54, 'Gómez Plata', 'Antioquia'),
(55, 'Granada', 'Antioquia'),
(56, 'Guadalupe', 'Antioquia'),
(57, 'Guarne', 'Antioquia'),
(58, 'Guatapé', 'Antioquia'),
(59, 'Heliconia', 'Antioquia'),
(60, 'Hispania', 'Antioquia'),
(61, 'Itagüí', 'Antioquia'),
(62, 'Ituango', 'Antioquia'),
(63, 'Jardín', 'Antioquia'),
(64, 'Jericó', 'Antioquia'),
(65, 'La Ceja', 'Antioquia'),
(66, 'La Estrella', 'Antioquia'),
(67, 'La Pintada', 'Antioquia'),
(68, 'La Unión', 'Antioquia'),
(69, 'Liborina', 'Antioquia'),
(70, 'Maceo', 'Antioquia'),
(71, 'Marinilla', 'Antioquia'),
(72, 'Montebello', 'Antioquia'),
(73, 'Murindó', 'Antioquia'),
(74, 'Mutatá', 'Antioquia'),
(75, 'Nariño', 'Antioquia'),
(76, 'Necoclí', 'Antioquia'),
(77, 'Nechí', 'Antioquia'),
(78, 'Olaya', 'Antioquia'),
(79, 'Peñol', 'Antioquia'),
(80, 'Peque', 'Antioquia'),
(81, 'Pueblorrico', 'Antioquia'),
(82, 'Puerto Berrío', 'Antioquia'),
(83, 'Puerto Nare', 'Antioquia'),
(84, 'Puerto Triunfo', 'Antioquia'),
(85, 'Remedios', 'Antioquia'),
(86, 'Retiro', 'Antioquia'),
(87, 'Rionegro', 'Antioquia'),
(88, 'Sabanalarga', 'Antioquia'),
(89, 'Sabaneta', 'Antioquia'),
(90, 'Salgar', 'Antioquia'),
(91, 'San Andrés', 'Antioquia'),
(92, 'San Carlos', 'Antioquia'),
(93, 'San Francisco', 'Antioquia'),
(94, 'San Jerónimo', 'Antioquia'),
(95, 'San José de Montaña', 'Antioquia'),
(96, 'San Juan de Urabá', 'Antioquia'),
(97, 'San Luis', 'Antioquia'),
(98, 'San Pedro', 'Antioquia'),
(99, 'San Pedro de Urabá', 'Antioquia'),
(100, 'San Rafael', 'Antioquia'),
(101, 'San Roque', 'Antioquia'),
(102, 'San Vicente', 'Antioquia'),
(103, 'Santa Bárbara', 'Antioquia'),
(104, 'Santa Rosa de Osos', 'Antioquia'),
(105, 'Santo Domingo', 'Antioquia'),
(106, 'Santuario', 'Antioquia'),
(107, 'Segovia', 'Antioquia'),
(108, 'Sonsón', 'Antioquia'),
(109, 'Sopetrán', 'Antioquia'),
(110, 'Támesis', 'Antioquia'),
(111, 'Tarazá', 'Antioquia'),
(112, 'Tarso', 'Antioquia'),
(113, 'Titiribí', 'Antioquia'),
(114, 'Toledo', 'Antioquia'),
(115, 'Turbo', 'Antioquia'),
(116, 'Uramita', 'Antioquia'),
(117, 'Urrao', 'Antioquia'),
(118, 'Valdivia', 'Antioquia'),
(119, 'Valparaíso', 'Antioquia'),
(120, 'Vegachí', 'Antioquia'),
(121, 'Venecia', 'Antioquia'),
(122, 'Vigía del Fuerte', 'Antioquia'),
(123, 'Yalí', 'Antioquia'),
(124, 'Yarumal', 'Antioquia'),
(125, 'Yolombó', 'Antioquia'),
(126, 'Yondó (Casabe)', 'Antioquia'),
(127, 'Zaragoza', 'Antioquia'),
(128, 'Arauca', 'Arauca'),
(129, 'Arauquita', 'Arauca'),
(130, 'Cravo Norte', 'Arauca'),
(131, 'Fortul', 'Arauca'),
(132, 'Puerto Rondón', 'Arauca'),
(133, 'Saravena', 'Arauca'),
(134, 'Tame', 'Arauca'),
(135, 'Barranquilla', 'Atlántico'),
(136, 'Baranoa', 'Atlántico'),
(137, 'Campo de la Cruz', 'Atlántico'),
(138, 'Candelaria', 'Atlántico'),
(139, 'Galapa', 'Atlántico'),
(140, 'Juan de Acosta', 'Atlántico'),
(141, 'Luruaco', 'Atlántico'),
(142, 'Malambo', 'Atlántico'),
(143, 'Manatí', 'Atlántico'),
(144, 'Palmar de Varela', 'Atlántico'),
(145, 'Piojó', 'Atlántico'),
(146, 'Polonuevo', 'Atlántico'),
(147, 'Ponedera', 'Atlántico'),
(148, 'Puerto Colombia', 'Atlántico'),
(149, 'Repelón', 'Atlántico'),
(150, 'Sabanagrande', 'Atlántico'),
(151, 'Sabanalarga', 'Atlántico'),
(152, 'Santa Lucía', 'Atlántico'),
(153, 'Santo Tomás', 'Atlántico'),
(154, 'Soledad', 'Atlántico'),
(155, 'Suán', 'Atlántico'),
(156, 'Tubará', 'Atlántico'),
(157, 'Usiacurí', 'Atlántico'),
(158, 'Cartagena', 'Bolívar'),
(159, 'Achí', 'Bolívar'),
(160, 'Altos del Rosario', 'Bolívar'),
(161, 'Arenal', 'Bolívar'),
(162, 'Arjona', 'Bolívar'),
(163, 'Arroyohondo', 'Bolívar'),
(164, 'Barranco de Loba', 'Bolívar'),
(165, 'Calamar', 'Bolívar'),
(166, 'Cantagallo', 'Bolívar'),
(167, 'Cicuto', 'Bolívar'),
(168, 'Córdoba', 'Bolívar'),
(169, 'Clemencia', 'Bolívar'),
(170, 'El Carmen de Bolívar', 'Bolívar'),
(171, 'El Guamo', 'Bolívar'),
(172, 'El Peñón', 'Bolívar'),
(173, 'Hatillo de Loba', 'Bolívar'),
(174, 'Magangue', 'Bolívar'),
(175, 'Mahates', 'Bolívar'),
(176, 'Margarita', 'Bolívar'),
(177, 'María la Baja', 'Bolívar'),
(178, 'Montecristo', 'Bolívar'),
(179, 'Mompós', 'Bolívar'),
(180, 'Morales', 'Bolívar'),
(181, 'Pinillos', 'Bolívar'),
(182, 'Regidor', 'Bolívar'),
(183, 'Río Viejo', 'Bolívar'),
(184, 'San Cristóbal', 'Bolívar'),
(185, 'San Estanislao', 'Bolívar'),
(186, 'San Fernando', 'Bolívar'),
(187, 'San Jacinto', 'Bolívar'),
(188, 'San Jacinto del Cauca', 'Bolívar'),
(189, 'San Juan Nepomuceno', 'Bolívar'),
(190, 'San Martín de Loba', 'Bolívar'),
(191, 'San Pablo', 'Bolívar'),
(192, 'Santa Catalina', 'Bolívar'),
(193, 'Santa Rosa', 'Bolívar'),
(194, 'Santa Rosa del Sur', 'Bolívar'),
(195, 'Simití', 'Bolívar'),
(196, 'Soplaviento', 'Bolívar'),
(197, 'Talaigua Nuevo', 'Bolívar'),
(198, 'Tiquisio (Puerto Rico)', 'Bolívar'),
(199, 'Turbaco', 'Bolívar'),
(200, 'Turbaná', 'Bolívar'),
(201, 'Villanueva', 'Bolívar'),
(202, 'Zambrano', 'Bolívar'),
(203, 'Tunja', 'Boyacá'),
(204, 'Almeida', 'Boyacá'),
(205, 'Aquitania', 'Boyacá'),
(206, 'Arcabuco', 'Boyacá'),
(207, 'Belén', 'Boyacá'),
(208, 'Berbeo', 'Boyacá'),
(209, 'Beteitiva', 'Boyacá'),
(210, 'Boavita', 'Boyacá'),
(211, 'Boyacá', 'Boyacá'),
(212, 'Briseño', 'Boyacá'),
(213, 'Buenavista', 'Boyacá'),
(214, 'Busbanzá', 'Boyacá'),
(215, 'Caldas', 'Boyacá'),
(216, 'Campohermoso', 'Boyacá'),
(217, 'Cerinza', 'Boyacá'),
(218, 'Chinavita', 'Boyacá'),
(219, 'Chiquinquirá', 'Boyacá'),
(220, 'Chiscas', 'Boyacá'),
(221, 'Chita', 'Boyacá'),
(222, 'Chitaranque', 'Boyacá'),
(223, 'Chivatá', 'Boyacá'),
(224, 'Ciénaga', 'Boyacá'),
(225, 'Cómbita', 'Boyacá'),
(226, 'Coper', 'Boyacá'),
(227, 'Corrales', 'Boyacá'),
(228, 'Covarachia', 'Boyacá'),
(229, 'Cubar', 'Boyacá'),
(230, 'Cucaita', 'Boyacá'),
(231, 'Cuitiva', 'Boyacá'),
(232, 'Chíquiza', 'Boyacá'),
(233, 'Chivor', 'Boyacá'),
(234, 'Duitama', 'Boyacá'),
(235, 'El Cocuy', 'Boyacá'),
(236, 'El Espino', 'Boyacá'),
(237, 'Firavitoba', 'Boyacá'),
(238, 'Floresta', 'Boyacá'),
(239, 'Gachantivá', 'Boyacá'),
(240, 'Gámeza', 'Boyacá'),
(241, 'Garagoa', 'Boyacá'),
(242, 'Guacamayas', 'Boyacá'),
(243, 'Guateque', 'Boyacá'),
(244, 'Guayatá', 'Boyacá'),
(245, 'Guicán', 'Boyacá'),
(246, 'Iza', 'Boyacá'),
(247, 'Jenesano', 'Boyacá'),
(248, 'Jericó', 'Boyacá'),
(249, 'Labranzagrande', 'Boyacá'),
(250, 'La Capilla', 'Boyacá'),
(251, 'La Victoria', 'Boyacá'),
(252, 'La Ubita', 'Boyacá'),
(253, 'Villa de Leyva', 'Boyacá'),
(254, 'Macanal', 'Boyacá'),
(255, 'Maripí', 'Boyacá'),
(256, 'Miraflores', 'Boyacá'),
(257, 'Mongua', 'Boyacá'),
(258, 'Monguí', 'Boyacá'),
(259, 'Moniquirá', 'Boyacá'),
(260, 'Motavita', 'Boyacá'),
(261, 'Muzo', 'Boyacá'),
(262, 'Nobsa', 'Boyacá'),
(263, 'Nuevo Colón', 'Boyacá'),
(264, 'Oicatá', 'Boyacá'),
(265, 'Otanche', 'Boyacá'),
(266, 'Pachavita', 'Boyacá'),
(267, 'Páez', 'Boyacá'),
(268, 'Paipa', 'Boyacá'),
(269, 'Pajarito', 'Boyacá'),
(270, 'Panqueba', 'Boyacá'),
(271, 'Pauna', 'Boyacá'),
(272, 'Paya', 'Boyacá'),
(273, 'Paz de Río', 'Boyacá'),
(274, 'Pesca', 'Boyacá'),
(275, 'Pisva', 'Boyacá'),
(276, 'Puerto Boyacá', 'Boyacá'),
(277, 'Quípama', 'Boyacá'),
(278, 'Ramiquirí', 'Boyacá'),
(279, 'Ráquira', 'Boyacá'),
(280, 'Rondón', 'Boyacá'),
(281, 'Saboyá', 'Boyacá'),
(282, 'Sáchica', 'Boyacá'),
(283, 'Samacá', 'Boyacá'),
(284, 'San Eduardo', 'Boyacá'),
(285, 'San José de Pare', 'Boyacá'),
(286, 'San Luis de Gaceno', 'Boyacá'),
(287, 'San Mateo', 'Boyacá'),
(288, 'San Miguel de Sema', 'Boyacá'),
(289, 'San Pablo de Borbur', 'Boyacá'),
(290, 'Santana', 'Boyacá'),
(291, 'Santa María', 'Boyacá'),
(292, 'Santa Rosa de Viterbo', 'Boyacá'),
(293, 'Santa Sofía', 'Boyacá'),
(294, 'Sativanorte', 'Boyacá'),
(295, 'Sativasur', 'Boyacá'),
(296, 'Siachoque', 'Boyacá'),
(297, 'Soatá', 'Boyacá'),
(298, 'Socotá', 'Boyacá'),
(299, 'Socha', 'Boyacá'),
(300, 'Sogamoso', 'Boyacá'),
(301, 'Somondoco', 'Boyacá'),
(302, 'Sora', 'Boyacá'),
(303, 'Sotaquirá', 'Boyacá'),
(304, 'Soracá', 'Boyacá'),
(305, 'Susacón', 'Boyacá'),
(306, 'Sutamarchán', 'Boyacá'),
(307, 'Sutatenza', 'Boyacá'),
(308, 'Tasco', 'Boyacá'),
(309, 'Tenza', 'Boyacá'),
(310, 'Tibaná', 'Boyacá'),
(311, 'Tibasosa', 'Boyacá'),
(312, 'Tinjacá', 'Boyacá'),
(313, 'Tipacoque', 'Boyacá'),
(314, 'Toca', 'Boyacá'),
(315, 'Toguí', 'Boyacá'),
(316, 'Tópaga', 'Boyacá'),
(317, 'Tota', 'Boyacá'),
(318, 'Tunungua', 'Boyacá'),
(319, 'Turmequé', 'Boyacá'),
(320, 'Tuta', 'Boyacá'),
(321, 'Tutazá', 'Boyacá'),
(322, 'Úmbita', 'Boyacá'),
(323, 'Ventaquemada', 'Boyacá'),
(324, 'Viracachá', 'Boyacá'),
(325, 'Zetaquirá', 'Boyacá'),
(326, 'Manizales', 'Caldas'),
(327, 'Aguadas', 'Caldas'),
(328, 'Anserma', 'Caldas'),
(329, 'Aranzazu', 'Caldas'),
(330, 'Belalcázar', 'Caldas'),
(331, 'Chinchina', 'Caldas'),
(332, 'Filadelfia', 'Caldas'),
(333, 'La Dorada', 'Caldas'),
(334, 'La Merced', 'Caldas'),
(335, 'Manzanares', 'Caldas'),
(336, 'Marmato', 'Caldas'),
(337, 'Marquetalia', 'Caldas'),
(338, 'Marulanda', 'Caldas'),
(339, 'Neira', 'Caldas'),
(340, 'Pácora', 'Caldas'),
(341, 'Palestina', 'Caldas'),
(342, 'Pensilvania', 'Caldas'),
(343, 'Riosucio', 'Caldas'),
(344, 'Risaralda', 'Caldas'),
(345, 'Salamina', 'Caldas'),
(346, 'Samaná', 'Caldas'),
(347, 'San José', 'Caldas'),
(348, 'Supía', 'Caldas'),
(349, 'Victoria', 'Caldas'),
(350, 'Villamaría', 'Caldas'),
(351, 'Viterbo', 'Caldas'),
(352, 'Yopal', 'Casanare'),
(353, 'Aguazul', 'Casanare'),
(354, 'Chameza', 'Casanare'),
(355, 'Hato Corozal', 'Casanare'),
(356, 'La Salina', 'Casanare'),
(357, 'Maní', 'Casanare'),
(358, 'Monterrey', 'Casanare'),
(359, 'Nunchía', 'Casanare'),
(360, 'Orocué', 'Casanare'),
(361, 'Paz de Ariporo', 'Casanare'),
(362, 'Pore', 'Casanare'),
(363, 'Recetor', 'Casanare'),
(364, 'Sabalarga', 'Casanare'),
(365, 'Sácama', 'Casanare'),
(366, 'San Luis de Palenque', 'Casanare'),
(367, 'Támara', 'Casanare'),
(368, 'Tauramena', 'Casanare'),
(369, 'Trinidad', 'Casanare'),
(370, 'Villanueva', 'Casanare'),
(371, 'Popayán', 'Cauca'),
(372, 'Almaguer', 'Cauca'),
(373, 'Argelia', 'Cauca'),
(374, 'Balboa', 'Cauca'),
(375, 'Bolívar', 'Cauca'),
(376, 'Buenos Aires', 'Cauca'),
(377, 'Cajibío', 'Cauca'),
(378, 'Caldono', 'Cauca'),
(379, 'Caloto', 'Cauca'),
(380, 'Corinto', 'Cauca'),
(381, 'El Tambo', 'Cauca'),
(382, 'Florencia', 'Cauca'),
(383, 'Guapi', 'Cauca'),
(384, 'Inzá', 'Cauca'),
(385, 'Jambaló', 'Cauca'),
(386, 'La Sierra', 'Cauca'),
(387, 'La Vega', 'Cauca'),
(388, 'López (Micay)', 'Cauca'),
(389, 'Mercaderes', 'Cauca'),
(390, 'Miranda', 'Cauca'),
(391, 'Morales', 'Cauca'),
(392, 'Padilla', 'Cauca'),
(393, 'Páez (Belalcazar)', 'Cauca'),
(394, 'Patía (El Bordo)', 'Cauca'),
(395, 'Piamonte', 'Cauca'),
(396, 'Piendamó', 'Cauca'),
(397, 'Puerto Tejada', 'Cauca'),
(398, 'Puracé (Coconuco)', 'Cauca'),
(399, 'Rosas', 'Cauca'),
(400, 'San Sebastián', 'Cauca'),
(401, 'Santander de Quilichao', 'Cauca'),
(402, 'Santa Rosa', 'Cauca'),
(403, 'Silvia', 'Cauca'),
(404, 'Sotará (Paispamba)', 'Cauca'),
(405, 'Suárez', 'Cauca'),
(406, 'Timbío', 'Cauca'),
(407, 'Timbiquí', 'Cauca'),
(408, 'Toribío', 'Cauca'),
(409, 'Totoro', 'Cauca'),
(410, 'Valledupar', 'Cesar'),
(411, 'Aguachica', 'Cesar'),
(412, 'Agustín Codazzi', 'Cesar'),
(413, 'Astrea', 'Cesar'),
(414, 'Becerril', 'Cesar'),
(415, 'Bosconia', 'Cesar'),
(416, 'Chimichagua', 'Cesar'),
(417, 'Chiriguaná', 'Cesar'),
(418, 'Curumaní', 'Cesar'),
(419, 'El Copey', 'Cesar'),
(420, 'El Paso', 'Cesar'),
(421, 'Gamarra', 'Cesar'),
(422, 'González', 'Cesar'),
(423, 'La Gloria', 'Cesar'),
(424, 'La Jagua de Ibirico', 'Cesar'),
(425, 'Manaure Balcón Cesar', 'Cesar'),
(426, 'Pailitas', 'Cesar'),
(427, 'Pelaya', 'Cesar'),
(428, 'Pueblo Bello', 'Cesar'),
(429, 'Río de Oro', 'Cesar'),
(430, 'La Paz (Robles)', 'Cesar'),
(431, 'San Alberto', 'Cesar'),
(432, 'San Diego', 'Cesar'),
(433, 'San Martín', 'Cesar'),
(434, 'Tamalameque', 'Cesar'),
(435, 'Montería', 'Córdoba'),
(436, 'Ayapel', 'Córdoba'),
(437, 'Buenavista', 'Córdoba'),
(438, 'Canalete', 'Córdoba'),
(439, 'Cereté', 'Córdoba'),
(440, 'Chima', 'Córdoba'),
(441, 'Chinú', 'Córdoba'),
(442, 'Ciénaga de Oro', 'Córdoba'),
(443, 'Cotorra', 'Córdoba'),
(444, 'La Apartada (Frontera)', 'Córdoba'),
(445, 'Lorica', 'Córdoba'),
(446, 'Los Córdobas', 'Córdoba'),
(447, 'Momil', 'Córdoba'),
(448, 'Montelíbano', 'Córdoba'),
(449, 'Monitos', 'Córdoba'),
(450, 'Planeta Rica', 'Córdoba'),
(451, 'Pueblo Nuevo', 'Córdoba'),
(452, 'Puerto Escondido', 'Córdoba'),
(453, 'Puerto Libertador', 'Córdoba'),
(454, 'Purísima', 'Córdoba'),
(455, 'Sahagún', 'Córdoba'),
(456, 'San Andrés Sotavento', 'Córdoba'),
(457, 'San Antero', 'Córdoba'),
(458, 'San Bernardo del Viento', 'Córdoba'),
(459, 'San Carlos', 'Córdoba'),
(460, 'San Pelayo', 'Córdoba'),
(461, 'Tierralta', 'Córdoba'),
(462, 'Valencia', 'Córdoba'),
(463, 'Agua de Dios', 'Cundinamarca'),
(464, 'Albán', 'Cundinamarca'),
(465, 'Anapoima', 'Cundinamarca'),
(466, 'Anolaima', 'Cundinamarca'),
(467, 'Arbeláez', 'Cundinamarca'),
(468, 'Beltrán', 'Cundinamarca'),
(469, 'Bituima', 'Cundinamarca'),
(470, 'Bojacá', 'Cundinamarca'),
(471, 'Cabrera', 'Cundinamarca'),
(472, 'Cachipay', 'Cundinamarca'),
(473, 'Cajicá', 'Cundinamarca'),
(474, 'Caparrapí', 'Cundinamarca'),
(475, 'Cáqueza', 'Cundinamarca'),
(476, 'Carmen de Carupa', 'Cundinamarca'),
(477, 'Chaguaní', 'Cundinamarca'),
(478, 'Chía', 'Cundinamarca'),
(479, 'Chipaque', 'Cundinamarca'),
(480, 'Choachí', 'Cundinamarca'),
(481, 'Chocontá', 'Cundinamarca'),
(482, 'Cogua', 'Cundinamarca'),
(483, 'Cota', 'Cundinamarca'),
(484, 'Cucunubá', 'Cundinamarca'),
(485, 'El Colegio', 'Cundinamarca'),
(486, 'El Peñón', 'Cundinamarca'),
(487, 'El Rosal', 'Cundinamarca'),
(488, 'Facatativá', 'Cundinamarca'),
(489, 'Fómeque', 'Cundinamarca'),
(490, 'Fosca', 'Cundinamarca'),
(491, 'Funza', 'Cundinamarca'),
(492, 'Fúquene', 'Cundinamarca'),
(493, 'Fusagasugá', 'Cundinamarca'),
(494, 'Gachalá', 'Cundinamarca'),
(495, 'Gachancipá', 'Cundinamarca'),
(496, 'Gachetá', 'Cundinamarca'),
(497, 'Gama', 'Cundinamarca'),
(498, 'Girardot', 'Cundinamarca'),
(499, 'Granada', 'Cundinamarca'),
(500, 'Guachetá', 'Cundinamarca'),
(501, 'Guaduas', 'Cundinamarca'),
(502, 'Guasca', 'Cundinamarca'),
(503, 'Guataquí', 'Cundinamarca'),
(504, 'Guatavita', 'Cundinamarca'),
(505, 'Guayabal de Síquima', 'Cundinamarca'),
(506, 'Guayabetal', 'Cundinamarca'),
(507, 'Gutiérrez', 'Cundinamarca'),
(508, 'Jerusalén', 'Cundinamarca'),
(509, 'Junín', 'Cundinamarca'),
(510, 'La Calera', 'Cundinamarca'),
(511, 'La Mesa', 'Cundinamarca'),
(512, 'La Palma', 'Cundinamarca'),
(513, 'La Peña', 'Cundinamarca'),
(514, 'La Vega', 'Cundinamarca'),
(515, 'Lenguazaque', 'Cundinamarca'),
(516, 'Machetá', 'Cundinamarca'),
(517, 'Madrid', 'Cundinamarca'),
(518, 'Manta', 'Cundinamarca'),
(519, 'Medina', 'Cundinamarca'),
(520, 'Mosquera', 'Cundinamarca'),
(521, 'Nariño', 'Cundinamarca'),
(522, 'Nemocón', 'Cundinamarca'),
(523, 'Nilo', 'Cundinamarca'),
(524, 'Nimaima', 'Cundinamarca'),
(525, 'Nocaima', 'Cundinamarca'),
(526, 'Venecia (Ospina Pérez)', 'Cundinamarca'),
(527, 'Pacho', 'Cundinamarca'),
(528, 'Paime', 'Cundinamarca'),
(529, 'Pandi', 'Cundinamarca'),
(530, 'Paratebueno', 'Cundinamarca'),
(531, 'Pasca', 'Cundinamarca'),
(532, 'Puerto Salgar', 'Cundinamarca'),
(533, 'Pulí', 'Cundinamarca'),
(534, 'Quebradanegra', 'Cundinamarca'),
(535, 'Quetame', 'Cundinamarca'),
(536, 'Quipile', 'Cundinamarca'),
(537, 'Rafael', 'Cundinamarca'),
(538, 'Ricaurte', 'Cundinamarca'),
(539, 'San Antonio de Tequendama', 'Cundinamarca'),
(540, 'San Bernardo', 'Cundinamarca'),
(541, 'San Cayetano', 'Cundinamarca'),
(542, 'San Francisco', 'Cundinamarca'),
(543, 'San Juan de Rioseco', 'Cundinamarca'),
(544, 'Sasaima', 'Cundinamarca'),
(545, 'Sesquilé', 'Cundinamarca'),
(546, 'Sibate', 'Cundinamarca'),
(547, 'Silvania', 'Cundinamarca'),
(548, 'Simijaca', 'Cundinamarca'),
(549, 'Soacha', 'Cundinamarca'),
(550, 'Sopó', 'Cundinamarca'),
(551, 'Subachoque', 'Cundinamarca'),
(552, 'Suesca', 'Cundinamarca'),
(553, 'Supatá', 'Cundinamarca'),
(554, 'Susa', 'Cundinamarca'),
(555, 'Sutatausa', 'Cundinamarca'),
(556, 'Tabio', 'Cundinamarca'),
(557, 'Tausa', 'Cundinamarca'),
(558, 'Tena', 'Cundinamarca'),
(559, 'Tenjo', 'Cundinamarca'),
(560, 'Tibacuy', 'Cundinamarca'),
(561, 'Tibiritá', 'Cundinamarca'),
(562, 'Tocaima', 'Cundinamarca'),
(563, 'Tocancipá', 'Cundinamarca'),
(564, 'Topaipí', 'Cundinamarca'),
(565, 'Ubalá', 'Cundinamarca'),
(566, 'Ubaque', 'Cundinamarca'),
(567, 'Ubaté', 'Cundinamarca'),
(568, 'Une', 'Cundinamarca'),
(569, 'Útica', 'Cundinamarca'),
(570, 'Vergara', 'Cundinamarca'),
(571, 'Vianí', 'Cundinamarca'),
(572, 'Villagómez', 'Cundinamarca'),
(573, 'Villapinzón', 'Cundinamarca'),
(574, 'Villeta', 'Cundinamarca'),
(575, 'Viotá', 'Cundinamarca'),
(576, 'Yacopí', 'Cundinamarca'),
(577, 'Zipacón', 'Cundinamarca'),
(578, 'Zipaquirá', 'Cundinamarca'),
(579, 'Quibdó', 'Chocó'),
(580, 'Acandí', 'Chocó'),
(581, 'Alto Baudó (Pie de Pato)', 'Chocó'),
(582, 'Atrato (Yuto)', 'Chocó'),
(583, 'Bagadó', 'Chocó'),
(584, 'Bahía Solano (Mútis)', 'Chocó'),
(585, 'Bajo Baudó (Pizarro)', 'Chocó'),
(586, 'Bojayá (Bellavista)', 'Chocó'),
(587, 'Cantón de San Pablo', 'Chocó'),
(588, 'Condoto', 'Chocó'),
(589, 'El Carmen', 'Chocó'),
(590, 'El Litoral de San Juan', 'Chocó'),
(591, 'Itsmina', 'Chocó'),
(592, 'Juradó', 'Chocó'),
(593, 'Lloró', 'Chocó'),
(594, 'Nóvita', 'Chocó'),
(595, 'Nuquí', 'Chocó'),
(596, 'Riosucio', 'Chocó'),
(597, 'San José del Palmar', 'Chocó'),
(598, 'Sipí', 'Chocó'),
(599, 'Tadó', 'Chocó'),
(600, 'Unguía', 'Chocó'),
(601, 'Neiva', 'Huila'),
(602, 'Acevedo', 'Huila'),
(603, 'Agrado', 'Huila'),
(604, 'Aipe', 'Huila'),
(605, 'Algeciras', 'Huila'),
(606, 'Altamira', 'Huila'),
(607, 'Baraya', 'Huila'),
(608, 'Campoalegre', 'Huila'),
(609, 'Colombia', 'Huila'),
(610, 'Elías', 'Huila'),
(611, 'Garzón', 'Huila'),
(612, 'Gigante', 'Huila'),
(613, 'Guadalupe', 'Huila'),
(614, 'Hobo', 'Huila'),
(615, 'Iquira', 'Huila'),
(616, 'Isnos', 'Huila'),
(617, 'La Argentina', 'Huila'),
(618, 'La Plata', 'Huila'),
(619, 'Nátaga', 'Huila'),
(620, 'Oporapa', 'Huila'),
(621, 'Paicol', 'Huila'),
(622, 'Palermo', 'Huila'),
(623, 'Palestina', 'Huila'),
(624, 'Pital', 'Huila'),
(625, 'Pitalito', 'Huila'),
(626, 'Rivera', 'Huila'),
(627, 'Saladoblanco', 'Huila'),
(628, 'San Agustín', 'Huila'),
(629, 'Santa María', 'Huila'),
(630, 'Suazá', 'Huila'),
(631, 'Tarqui', 'Huila'),
(632, 'Tesalia', 'Huila'),
(633, 'Tello', 'Huila'),
(634, 'Teruel', 'Huila'),
(635, 'Timaná', 'Huila'),
(636, 'Villavieja', 'Huila'),
(637, 'Yaguará', 'Huila'),
(638, 'Riohacha', 'La Guajira'),
(639, 'Barrancas', 'La Guajira'),
(640, 'Dibulla', 'La Guajira'),
(641, 'Distracción', 'La Guajira'),
(642, 'El Molino', 'La Guajira'),
(643, 'Fonseca', 'La Guajira'),
(644, 'Hatonuevo', 'La Guajira'),
(645, 'Maicao', 'La Guajira'),
(646, 'Manaure', 'La Guajira'),
(647, 'San Juan del Cesar', 'La Guajira'),
(648, 'Uribía', 'La Guajira'),
(649, 'Urumita', 'La Guajira'),
(650, 'Villanueva', 'La Guajira'),
(651, 'Santa Marta', 'Magdalena'),
(652, 'Aracataca', 'Magdalena'),
(653, 'Ariguaní (El Difícil)', 'Magdalena'),
(654, 'Cerro San Antonio', 'Magdalena'),
(655, 'Chivolo', 'Magdalena'),
(656, 'Ciénaga', 'Magdalena'),
(657, 'El Banco', 'Magdalena'),
(658, 'El Piñón', 'Magdalena'),
(659, 'El Retén', 'Magdalena'),
(660, 'Fundación', 'Magdalena'),
(661, 'Guamal', 'Magdalena'),
(662, 'Pedraza', 'Magdalena'),
(663, 'Pijiño del Carmen', 'Magdalena'),
(664, 'Pivijay', 'Magdalena'),
(665, 'Plato', 'Magdalena'),
(666, 'Publoviejo', 'Magdalena'),
(667, 'Remolino', 'Magdalena'),
(668, 'Salamina', 'Magdalena'),
(669, 'San Sebastián de Buuenavista', 'Magdalena'),
(670, 'San Zenón', 'Magdalena'),
(671, 'Santa Ana', 'Magdalena'),
(672, 'Sitionuevo', 'Magdalena'),
(673, 'Tenerife', 'Magdalena'),
(674, 'Pasto', 'Nariño'),
(675, 'Albán (San José)', 'Nariño'),
(676, 'Aldana', 'Nariño'),
(677, 'Ancuyá', 'Nariño'),
(678, 'Arboleda (Berruecos)', 'Nariño'),
(679, 'Barbacoas', 'Nariño'),
(680, 'Belén', 'Nariño'),
(681, 'Buesaco', 'Nariño'),
(682, 'Colón (Génova)', 'Nariño'),
(683, 'Consacá', 'Nariño'),
(684, 'Contadero', 'Nariño'),
(685, 'Córdoba', 'Nariño'),
(686, 'Cuaspud (Carlosama)', 'Nariño'),
(687, 'Cumbal', 'Nariño'),
(688, 'Cumbitará', 'Nariño'),
(689, 'Chachagüi', 'Nariño'),
(690, 'El Charco', 'Nariño'),
(691, 'El Rosario', 'Nariño'),
(692, 'El Tablón', 'Nariño'),
(693, 'El Tambo', 'Nariño'),
(694, 'Funes', 'Nariño'),
(695, 'Guachucal', 'Nariño'),
(696, 'Guaitarilla', 'Nariño'),
(697, 'Gualmatán', 'Nariño'),
(698, 'Iles', 'Nariño'),
(699, 'Imúes', 'Nariño'),
(700, 'Ipiales', 'Nariño'),
(701, 'La Cruz', 'Nariño'),
(702, 'La Florida', 'Nariño'),
(703, 'La Llanada', 'Nariño'),
(704, 'La Tola', 'Nariño'),
(705, 'La Unión', 'Nariño'),
(706, 'Leiva', 'Nariño'),
(707, 'Linares', 'Nariño'),
(708, 'Los Andes (Sotomayor)', 'Nariño'),
(709, 'Magüí (Payán)', 'Nariño'),
(710, 'Mallama (Piedrancha)', 'Nariño'),
(711, 'Mosquera', 'Nariño'),
(712, 'Olaya', 'Nariño'),
(713, 'Ospina', 'Nariño'),
(714, 'Francisco Pizarro', 'Nariño'),
(715, 'Policarpa', 'Nariño'),
(716, 'Potosí', 'Nariño'),
(717, 'Providencia', 'Nariño'),
(718, 'Puerres', 'Nariño'),
(719, 'Pupiales', 'Nariño'),
(720, 'Ricaurte', 'Nariño'),
(721, 'Roberto Payán (San José)', 'Nariño'),
(722, 'Samaniego', 'Nariño'),
(723, 'Sandoná', 'Nariño'),
(724, 'San Bernardo', 'Nariño'),
(725, 'San Lorenzo', 'Nariño'),
(726, 'San Pablo', 'Nariño'),
(727, 'San Pedro de Cartago', 'Nariño'),
(728, 'Santa Bárbara (Iscuandé)', 'Nariño'),
(729, 'Santa Cruz (Guachávez)', 'Nariño'),
(730, 'Sapuyés', 'Nariño'),
(731, 'Taminango', 'Nariño'),
(732, 'Tangua', 'Nariño'),
(733, 'Tumaco', 'Nariño'),
(734, 'Túquerres', 'Nariño'),
(735, 'Yacuanquer', 'Nariño'),
(736, 'Cúcuta', 'Norte de Santander'),
(737, 'Abrego', 'Norte de Santander'),
(738, 'Arboledas', 'Norte de Santander'),
(739, 'Bochalema', 'Norte de Santander'),
(740, 'Bucarasica', 'Norte de Santander'),
(741, 'Cácota', 'Norte de Santander'),
(742, 'Cáchira', 'Norte de Santander'),
(743, 'Chinácota', 'Norte de Santander'),
(744, 'Chitagá', 'Norte de Santander'),
(745, 'Convención', 'Norte de Santander'),
(746, 'Cucutilla', 'Norte de Santander'),
(747, 'Durania', 'Norte de Santander'),
(748, 'El Carmen', 'Norte de Santander'),
(749, 'El Tarra', 'Norte de Santander'),
(750, 'El Zulia', 'Norte de Santander'),
(751, 'Gramalote', 'Norte de Santander'),
(752, 'Hacarí', 'Norte de Santander'),
(753, 'Herrán', 'Norte de Santander'),
(754, 'Labateca', 'Norte de Santander'),
(755, 'La Esperanza', 'Norte de Santander'),
(756, 'La Playa', 'Norte de Santander'),
(757, 'Los Patios', 'Norte de Santander'),
(758, 'Lourdes', 'Norte de Santander'),
(759, 'Mutiscua', 'Norte de Santander'),
(760, 'Ocaña', 'Norte de Santander'),
(761, 'Pamplona', 'Norte de Santander'),
(762, 'Pamplonita', 'Norte de Santander'),
(763, 'Puerto Santander', 'Norte de Santander'),
(764, 'Ragonvalia', 'Norte de Santander'),
(765, 'Salazar', 'Norte de Santander'),
(766, 'San Calixto', 'Norte de Santander'),
(767, 'San Cayetano', 'Norte de Santander'),
(768, 'Santiago', 'Norte de Santander'),
(769, 'Sardinata', 'Norte de Santander'),
(770, 'Silos', 'Norte de Santander'),
(771, 'Teorama', 'Norte de Santander'),
(772, 'Tibú', 'Norte de Santander'),
(773, 'Toledo', 'Norte de Santander'),
(774, 'Villacaro', 'Norte de Santander'),
(775, 'Villa del Rosario', 'Norte de Santander'),
(776, 'Mocoa', 'Putumayo'),
(777, 'Colón', 'Putumayo'),
(778, 'Orito', 'Putumayo'),
(779, 'Puerto Asís', 'Putumayo'),
(780, 'Puerto Caicedo', 'Putumayo'),
(781, 'Puerto Guzmán', 'Putumayo'),
(782, 'Puerto Leguízamo', 'Putumayo'),
(783, 'Sibundoy', 'Putumayo'),
(784, 'San Francisco', 'Putumayo'),
(785, 'San Miguel', 'Putumayo'),
(786, 'Santiago', 'Putumayo'),
(787, 'Villa Gamuez (La Hormiga)', 'Putumayo'),
(788, 'Villa Garzón', 'Putumayo'),
(789, 'Pereira', 'Risaralda'),
(790, 'Apía', 'Risaralda'),
(791, 'Balboa', 'Risaralda'),
(792, 'Belén de Umbría', 'Risaralda'),
(793, 'Dos Quebradas', 'Risaralda'),
(794, 'Guática', 'Risaralda'),
(795, 'La Celia', 'Risaralda'),
(796, 'La Virginia', 'Risaralda'),
(797, 'Marsella', 'Risaralda'),
(798, 'Mistrató', 'Risaralda'),
(799, 'Pueblo Rico', 'Risaralda'),
(800, 'Quinchia', 'Risaralda'),
(801, 'Santa Rosa de Cabal', 'Risaralda'),
(802, 'Santuario', 'Risaralda'),
(803, 'San Andrés', 'San Andrés y Providencia'),
(804, 'Providencia', 'San Andrés y Providencia'),
(805, 'Bucaramanga', 'Santander'),
(806, 'Aguada', 'Santander'),
(807, 'Albania', 'Santander'),
(808, 'Aratoca', 'Santander'),
(809, 'Barbosa', 'Santander'),
(810, 'Barichara', 'Santander'),
(811, 'Barrancabermeja', 'Santander'),
(812, 'Betulia', 'Santander'),
(813, 'Bolívar', 'Santander'),
(814, 'Cabrera', 'Santander'),
(815, 'California', 'Santander'),
(816, 'Capitanejo', 'Santander'),
(817, 'Carcasí', 'Santander'),
(818, 'Cepitá', 'Santander'),
(819, 'Cerrito', 'Santander'),
(820, 'Charalá', 'Santander'),
(821, 'Charta', 'Santander'),
(822, 'Chima', 'Santander'),
(823, 'Chipatá', 'Santander'),
(824, 'Cimitarra', 'Santander'),
(825, 'Concepción', 'Santander'),
(826, 'Confines', 'Santander'),
(827, 'Contratación', 'Santander'),
(828, 'Coromoro', 'Santander'),
(829, 'Curití', 'Santander'),
(830, 'El Carmen', 'Santander'),
(831, 'El Guacamayo', 'Santander'),
(832, 'El Peñón', 'Santander'),
(833, 'El Playón', 'Santander'),
(834, 'Encino', 'Santander'),
(835, 'Enciso', 'Santander'),
(836, 'Florián', 'Santander'),
(837, 'Floridablanca', 'Santander'),
(838, 'Galán', 'Santander'),
(839, 'Gámbita', 'Santander'),
(840, 'Girón', 'Santander'),
(841, 'Guaca', 'Santander'),
(842, 'Guadalupe', 'Santander'),
(843, 'Guapotá', 'Santander'),
(844, 'Guavata', 'Santander'),
(845, 'Guepsa', 'Santander'),
(846, 'Hato', 'Santander'),
(847, 'Jesús María', 'Santander'),
(848, 'Jordán', 'Santander'),
(849, 'La Belleza', 'Santander'),
(850, 'Landázuri', 'Santander'),
(851, 'La Paz', 'Santander'),
(852, 'Lebrija', 'Santander'),
(853, 'Los Santos', 'Santander'),
(854, 'Macaravita', 'Santander'),
(855, 'Málaga', 'Santander'),
(856, 'Matanza', 'Santander'),
(857, 'Mogotes', 'Santander'),
(858, 'Molagavita', 'Santander'),
(859, 'Ocamonte', 'Santander'),
(860, 'Oiba', 'Santander'),
(861, 'Onzága', 'Santander'),
(862, 'Palmar', 'Santander'),
(863, 'Palmas del Socorro', 'Santander'),
(864, 'Páramo', 'Santander'),
(865, 'Pie de Cuesta', 'Santander'),
(866, 'Pinchote', 'Santander'),
(867, 'Puente Nacional', 'Santander'),
(868, 'Puerto Parra', 'Santander'),
(869, 'Puerto Wilches', 'Santander'),
(870, 'Rionegro', 'Santander'),
(871, 'Sabana de Torres', 'Santander'),
(872, 'San Andrés', 'Santander'),
(873, 'San Benito', 'Santander'),
(874, 'San Gil', 'Santander'),
(875, 'San Joaquín', 'Santander'),
(876, 'San José de Miranda', 'Santander'),
(877, 'San Miguel', 'Santander'),
(878, 'San Vicente de Chucurí', 'Santander'),
(879, 'Santa Bárbara', 'Santander'),
(880, 'Santa Helena del Opón', 'Santander'),
(881, 'Simacota', 'Santander'),
(882, 'Socorro', 'Santander'),
(883, 'Suaita', 'Santander'),
(884, 'Sucre', 'Santander'),
(885, 'Suratá', 'Santander'),
(886, 'Tona', 'Santander'),
(887, 'Valle de San José', 'Santander'),
(888, 'Vélez', 'Santander'),
(889, 'Vetas', 'Santander'),
(890, 'Villanueva', 'Santander'),
(891, 'Zapatoca', 'Santander'),
(892, 'Sincelejo', 'Sucre'),
(893, 'Buenavista', 'Sucre'),
(894, 'Caimito', 'Sucre'),
(895, 'Coloso (Ricaurte)', 'Sucre'),
(896, 'Corozal', 'Sucre'),
(897, 'Chalán', 'Sucre'),
(898, 'Galeras (Nueva Granada)', 'Sucre'),
(899, 'Guarandá', 'Sucre'),
(900, 'La Unión', 'Sucre'),
(901, 'Los Palmitos', 'Sucre'),
(902, 'Majagual', 'Sucre'),
(903, 'Morroa', 'Sucre'),
(904, 'Ovejas', 'Sucre'),
(905, 'Palmito', 'Sucre'),
(906, 'Sampués', 'Sucre'),
(907, 'San Benito Abad', 'Sucre'),
(908, 'San Juan de Betulia', 'Sucre'),
(909, 'San Marcos', 'Sucre'),
(910, 'San Onofre', 'Sucre'),
(911, 'San Pedro', 'Sucre'),
(912, 'Sincé', 'Sucre'),
(913, 'Sucre', 'Sucre'),
(914, 'Tolú', 'Sucre'),
(915, 'Toluviejo', 'Sucre'),
(916, 'Ibagué', 'Tolima'),
(917, 'Alpujarra', 'Tolima'),
(918, 'Alvarado', 'Tolima'),
(919, 'Ambalema', 'Tolima'),
(920, 'Anzóategui', 'Tolima'),
(921, 'Armero (Guayabal)', 'Tolima'),
(922, 'Ataco', 'Tolima'),
(923, 'Cajamarca', 'Tolima'),
(924, 'Carmen de Apicalá', 'Tolima'),
(925, 'Casabianca', 'Tolima'),
(926, 'Chaparral', 'Tolima'),
(927, 'Coello', 'Tolima'),
(928, 'Coyaima', 'Tolima'),
(929, 'Cunday', 'Tolima'),
(930, 'Dolores', 'Tolima'),
(931, 'Espinal', 'Tolima'),
(932, 'Falán', 'Tolima'),
(933, 'Flandes', 'Tolima'),
(934, 'Fresno', 'Tolima'),
(935, 'Guamo', 'Tolima'),
(936, 'Herveo', 'Tolima'),
(937, 'Honda', 'Tolima'),
(938, 'Icononzo', 'Tolima'),
(939, 'Lérida', 'Tolima'),
(940, 'Líbano', 'Tolima'),
(941, 'Mariquita', 'Tolima'),
(942, 'Melgar', 'Tolima'),
(943, 'Murillo', 'Tolima'),
(944, 'Natagaima', 'Tolima'),
(945, 'Ortega', 'Tolima'),
(946, 'Palocabildo', 'Tolima'),
(947, 'Piedras', 'Tolima'),
(948, 'Planadas', 'Tolima'),
(949, 'Prado', 'Tolima'),
(950, 'Purificación', 'Tolima'),
(951, 'Rioblanco', 'Tolima'),
(952, 'Roncesvalles', 'Tolima'),
(953, 'Rovira', 'Tolima'),
(954, 'Saldaña', 'Tolima'),
(955, 'San Antonio', 'Tolima'),
(956, 'San Luis', 'Tolima'),
(957, 'Santa Isabel', 'Tolima'),
(958, 'Suárez', 'Tolima'),
(959, 'Valle de San Juan', 'Tolima'),
(960, 'Venadillo', 'Tolima'),
(961, 'Villahermosa', 'Tolima'),
(962, 'Villarrica', 'Tolima'),
(963, 'Cali', 'Valle del Cauca'),
(964, 'Alcalá', 'Valle del Cauca'),
(965, 'Andalucía', 'Valle del Cauca'),
(966, 'Ansermanuevo', 'Valle del Cauca'),
(967, 'Argelia', 'Valle del Cauca'),
(968, 'Bolívar', 'Valle del Cauca'),
(969, 'Buenaventura', 'Valle del Cauca'),
(970, 'Buga', 'Valle del Cauca'),
(971, 'Bugalagrande', 'Valle del Cauca'),
(972, 'Caicedonia', 'Valle del Cauca'),
(973, 'Calima (Darién)', 'Valle del Cauca'),
(974, 'Candelaria', 'Valle del Cauca'),
(975, 'Cartago', 'Valle del Cauca'),
(976, 'Dagua', 'Valle del Cauca'),
(977, 'El Águila', 'Valle del Cauca'),
(978, 'El Cairo', 'Valle del Cauca'),
(979, 'El Cerrito', 'Valle del Cauca'),
(980, 'El Dovio', 'Valle del Cauca'),
(981, 'Florida', 'Valle del Cauca'),
(982, 'Ginebra', 'Valle del Cauca'),
(983, 'Guacarí', 'Valle del Cauca'),
(984, 'Jamundí', 'Valle del Cauca'),
(985, 'La Cumbre', 'Valle del Cauca'),
(986, 'La Unión', 'Valle del Cauca'),
(987, 'La Victoria', 'Valle del Cauca'),
(988, 'Obando', 'Valle del Cauca'),
(989, 'Palmira', 'Valle del Cauca'),
(990, 'Pradera', 'Valle del Cauca'),
(991, 'Restrepo', 'Valle del Cauca'),
(992, 'Riofrío', 'Valle del Cauca'),
(993, 'Roldanillo', 'Valle del Cauca'),
(994, 'San Pedro', 'Valle del Cauca'),
(995, 'Sevilla', 'Valle del Cauca'),
(996, 'Toro', 'Valle del Cauca'),
(997, 'Trujillo', 'Valle del Cauca'),
(998, 'Tuluá', 'Valle del Cauca'),
(999, 'Ulloa', 'Valle del Cauca'),
(1000, 'Versalles', 'Valle del Cauca'),
(1001, 'Vijes', 'Valle del Cauca'),
(1002, 'Yotoco', 'Valle del Cauca'),
(1003, 'Yumbo', 'Valle del Cauca'),
(1004, 'Zarzal', 'Valle del Cauca'),
(1005, 'Florencia', 'Caquetá'),
(1006, 'Albania', 'Caquetá'),
(1007, 'Belén de los Andaquíes', 'Caquetá'),
(1008, 'Cartagena del Chairá', 'Caquetá'),
(1009, 'Curillo', 'Caquetá'),
(1010, 'El Doncello', 'Caquetá'),
(1011, 'El Paujil', 'Caquetá'),
(1012, 'La Montañita', 'Caquetá'),
(1013, 'Milán', 'Caquetá'),
(1014, 'Morelia', 'Caquetá'),
(1015, 'Puerto Rico', 'Caquetá'),
(1016, 'San José del Fragua', 'Caquetá'),
(1017, 'San Vicente del Caguán', 'Caquetá'),
(1018, 'Solano', 'Caquetá'),
(1019, 'Solita', 'Caquetá'),
(1020, 'Valparaíso', 'Caquetá'),
(1021, 'San José del Guaviare', 'Guaviare'),
(1022, 'Calamar', 'Guaviare'),
(1023, 'El Retorno', 'Guaviare'),
(1024, 'Miraflores', 'Guaviare'),
(1025, 'Villavicencio', 'Meta'),
(1026, 'Acacías', 'Meta'),
(1027, 'Barranca de Upía', 'Meta'),
(1028, 'Cabuyaro', 'Meta'),
(1029, 'Castilla la Nueva', 'Meta'),
(1030, 'Cubarral', 'Meta'),
(1031, 'Cumaral', 'Meta'),
(1032, 'El Calvario', 'Meta'),
(1033, 'El Castillo', 'Meta'),
(1034, 'El Dorado', 'Meta'),
(1035, 'Fuente de Oro', 'Meta'),
(1036, 'Granada', 'Meta'),
(1037, 'Guamal', 'Meta'),
(1038, 'Mapiripán', 'Meta'),
(1039, 'Mesetas', 'Meta'),
(1040, 'La Macarena', 'Meta'),
(1041, 'La Uribe', 'Meta'),
(1042, 'Lejanías', 'Meta'),
(1043, 'Puerto Concordia', 'Meta'),
(1044, 'Puerto Gaitán', 'Meta'),
(1045, 'Puerto López', 'Meta'),
(1046, 'Puerto Lleras', 'Meta'),
(1047, 'Puerto Rico', 'Meta'),
(1048, 'Restrepo', 'Meta'),
(1049, 'San Carlos de Guaroa', 'Meta'),
(1050, 'San Juan de Arama', 'Meta'),
(1051, 'San Juanito', 'Meta'),
(1052, 'San Martín', 'Meta'),
(1053, 'Vistahermosa', 'Meta'),
(1054, 'Bogotá', 'Bogotá DC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(12) NOT NULL,
  `correo` varchar(25) NOT NULL,
  `contrasena` char(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono_empresa` char(10) NOT NULL,
  `nombre_representante` varchar(50) NOT NULL,
  `nit` int(10) DEFAULT NULL,
  `logo` varchar(50) NOT NULL,
  `telefono_representante` char(10) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `departamento` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `gastos` int(10) NOT NULL,
  `imprevistos` int(10) NOT NULL,
  `incapacidad` int(10) NOT NULL,
  `dotaciones` int(6) NOT NULL,
  `utilidad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo`, `contrasena`, `nombre`, `telefono_empresa`, `nombre_representante`, `nit`, `logo`, `telefono_representante`, `direccion`, `departamento`, `ciudad`, `gastos`, `imprevistos`, `incapacidad`, `dotaciones`, `utilidad`) VALUES
(13, 'construvega@gmail.com', 'scrypt:32768:8:1$yY48NiGmI4ZYUIey$41050edd939b92315da095a3c363b7de6aa28c3b516e6608ad6c72d1913f6a10f2cd89986a35399c6ee1ee08291b705ec5ae5b31aa0ff5a4b568516c695ff535', 'cesar bravo', '3004446219', 'Cesar Bravo', 16933539, '', '672073829', 'Larratxo pasealekua, 13', 'Valle del cauca', 'Cali', 0, 10, 0, 0, 10),
(14, 'col@gmail.com', 'scrypt:32768:8:1$TEiOSd0bZT5I6hWs$2cbbea64ededc84e2273f79d3bd1022ea9012560ee1906ff23593754c44f4af4b99c254070fc6aa84a25d13fad655d5de8e6bccd8ce3f3028584aa470e513f39', 'pepito perez', '', '', NULL, '', '', '', '', '', 0, 0, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apu`
--
ALTER TABLE `apu`
  ADD PRIMARY KEY (`id_apu`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `apu_herramienta`
--
ALTER TABLE `apu_herramienta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apu` (`id_apu`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `apu_insumo`
--
ALTER TABLE `apu_insumo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apu` (`id_apu`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `apu_mdo`
--
ALTER TABLE `apu_mdo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apu` (`id_apu`),
  ADD KEY `id_mdo` (`id_mdo`);

--
-- Indices de la tabla `equipo_alquiler`
--
ALTER TABLE `equipo_alquiler`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`id_insumo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `mdo`
--
ALTER TABLE `mdo`
  ADD PRIMARY KEY (`id_mdo`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`id_precio`),
  ADD KEY `id_insumo` (`id_insumo`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `precio_alquiler`
--
ALTER TABLE `precio_alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_proveedor_equipo` (`id_proveedor_equipo`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`id_presupuesto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `presupuesto_apu`
--
ALTER TABLE `presupuesto_apu`
  ADD PRIMARY KEY (`id_presupuesto`,`id_apu`),
  ADD KEY `id_apu` (`id_apu`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `proveedor_equipo`
--
ALTER TABLE `proveedor_equipo`
  ADD PRIMARY KEY (`id_proveedor_equipo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `reg_colombia`
--
ALTER TABLE `reg_colombia`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `correo` (`correo`),
  ADD KEY `nit` (`nit`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apu`
--
ALTER TABLE `apu`
  MODIFY `id_apu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apu_herramienta`
--
ALTER TABLE `apu_herramienta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apu_insumo`
--
ALTER TABLE `apu_insumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apu_mdo`
--
ALTER TABLE `apu_mdo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo_alquiler`
--
ALTER TABLE `equipo_alquiler`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumo`
--
ALTER TABLE `insumo`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mdo`
--
ALTER TABLE `mdo`
  MODIFY `id_mdo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio`
--
ALTER TABLE `precio`
  MODIFY `id_precio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio_alquiler`
--
ALTER TABLE `precio_alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_equipo`
--
ALTER TABLE `proveedor_equipo`
  MODIFY `id_proveedor_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reg_colombia`
--
ALTER TABLE `reg_colombia`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1055;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apu`
--
ALTER TABLE `apu`
  ADD CONSTRAINT `apu_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `apu_herramienta`
--
ALTER TABLE `apu_herramienta`
  ADD CONSTRAINT `apu_herramienta_ibfk_1` FOREIGN KEY (`id_apu`) REFERENCES `apu` (`id_apu`),
  ADD CONSTRAINT `apu_herramienta_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_alquiler` (`id_equipo`);

--
-- Filtros para la tabla `apu_insumo`
--
ALTER TABLE `apu_insumo`
  ADD CONSTRAINT `apu_insumo_ibfk_1` FOREIGN KEY (`id_apu`) REFERENCES `apu` (`id_apu`),
  ADD CONSTRAINT `apu_insumo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`);

--
-- Filtros para la tabla `apu_mdo`
--
ALTER TABLE `apu_mdo`
  ADD CONSTRAINT `apu_mdo_ibfk_1` FOREIGN KEY (`id_apu`) REFERENCES `apu` (`id_apu`),
  ADD CONSTRAINT `apu_mdo_ibfk_2` FOREIGN KEY (`id_mdo`) REFERENCES `mdo` (`id_mdo`);

--
-- Filtros para la tabla `equipo_alquiler`
--
ALTER TABLE `equipo_alquiler`
  ADD CONSTRAINT `equipo_alquiler_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `insumo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`),
  ADD CONSTRAINT `precio_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  ADD CONSTRAINT `precio_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `precio_ibfk_4` FOREIGN KEY (`id_municipio`) REFERENCES `reg_colombia` (`id_municipio`),
  ADD CONSTRAINT `precio_ibfk_5` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `precio_alquiler`
--
ALTER TABLE `precio_alquiler`
  ADD CONSTRAINT `precio_alquiler_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `reg_colombia` (`id_municipio`),
  ADD CONSTRAINT `precio_alquiler_ibfk_2` FOREIGN KEY (`id_proveedor_equipo`) REFERENCES `proveedor_equipo` (`id_proveedor_equipo`),
  ADD CONSTRAINT `precio_alquiler_ibfk_3` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_alquiler` (`id_equipo`),
  ADD CONSTRAINT `precio_alquiler_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `presupuesto_apu`
--
ALTER TABLE `presupuesto_apu`
  ADD CONSTRAINT `presupuesto_apu_ibfk_1` FOREIGN KEY (`id_presupuesto`) REFERENCES `presupuesto` (`id_presupuesto`),
  ADD CONSTRAINT `presupuesto_apu_ibfk_2` FOREIGN KEY (`id_apu`) REFERENCES `apu` (`id_apu`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `proveedor_equipo`
--
ALTER TABLE `proveedor_equipo`
  ADD CONSTRAINT `proveedor_equipo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
