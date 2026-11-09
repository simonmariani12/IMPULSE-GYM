-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2026 a las 17:55:29
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `nombre_actividad` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `nombre_actividad`, `descripcion`) VALUES
(1, 'Musculacion', 'Entrenamiento en sala'),
(2, 'Funcional', 'Entrenamiento funcional en grupo'),
(3, 'Zumba', 'Clases de baile y movimiento'),
(4, 'Crossfit', 'Entrenamiento de fuerza y resistencia'),
(5, 'Spinning', 'Entrenamiento en bicicleta fija');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `dia_semana` varchar(15) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `cupo_maximo` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_horario`, `dia_semana`, `hora_inicio`, `hora_fin`, `cupo_maximo`, `id_actividad`, `id_profesor`) VALUES
(1, 'Lunes', '07:00:00', '22:00:00', 60, 1, 1),
(2, 'Martes', '07:00:00', '22:00:00', 60, 1, 1),
(3, 'Lunes', '18:00:00', '19:00:00', 20, 2, 2),
(4, 'Miercoles', '19:00:00', '20:00:00', 25, 3, 3),
(5, 'Jueves', '18:00:00', '19:00:00', 15, 4, 2),
(6, 'Viernes', '17:00:00', '18:00:00', 18, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `estado_inscripcion` varchar(30) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `fecha_inscripcion`, `estado_inscripcion`, `id_socio`, `id_horario`) VALUES
(1, '2026-11-02', 'Activa', 2, 3),
(2, '2026-11-03', 'Activa', 3, 4),
(3, '2026-11-04', 'Activa', 4, 5),
(4, '2026-11-04', 'Activa', 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL,
  `estado_pago` varchar(30) NOT NULL,
  `id_socio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `fecha_pago`, `monto`, `metodo_pago`, `estado_pago`, `id_socio`) VALUES
(1, '2026-11-01', 28000.00, 'Efectivo', 'Pagado', 1),
(2, '2026-11-02', 45000.00, 'Transferencia', 'Pagado', 2),
(3, '2026-11-03', 32000.00, 'Tarjeta', 'Pagado', 3),
(4, '2026-11-04', 45000.00, 'Transferencia', 'Pendiente', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `nombre_plan` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `duracion_meses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `nombre_plan`, `descripcion`, `precio`, `duracion_meses`) VALUES
(1, 'Musculacion', 'Acceso a la sala de musculacion', 28000.00, 1),
(2, 'Actividades', 'Acceso a las clases grupales', 32000.00, 1),
(3, 'Pase libre', 'Musculacion y actividades grupales', 45000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `dni`, `nombre`, `apellido`, `telefono`, `email`, `especialidad`) VALUES
(1, '30111222', 'Martin', 'Perez', '1144441111', 'martin.perez@ejemplo.com', 'Musculacion'),
(2, '32222333', 'Lucia', 'Gomez', '1144442222', 'lucia.gomez@ejemplo.com', 'Funcional y Crossfit'),
(3, '33333444', 'Carla', 'Ruiz', '1144443333', 'carla.ruiz@ejemplo.com', 'Zumba y Spinning');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `id_plan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_socio`, `dni`, `nombre`, `apellido`, `fecha_nacimiento`, `telefono`, `email`, `direccion`, `fecha_alta`, `id_plan`) VALUES
(1, '40123456', 'Juan', 'Lopez', '2002-04-12', '1155511111', 'juan.lopez@ejemplo.com', 'Calle 1 123', '2026-11-01', 1),
(2, '42123457', 'Sofia', 'Martinez', '2004-08-20', '1155522222', 'sofia.martinez@ejemplo.com', 'Calle 2 456', '2026-11-02', 3),
(3, '39123458', 'Pedro', 'Fernandez', '1999-12-05', '1155533333', 'pedro.fernandez@ejemplo.com', 'Calle 3 789', '2026-11-03', 2),
(4, '43123459', 'Valentina', 'Diaz', '2005-06-14', '1155544444', 'valentina.diaz@ejemplo.com', 'Calle 4 100', '2026-11-04', 3),
(5, '50041922', 'Simon', 'Mariani', NULL, '1165973840', 'simongalo1203@gmail.com', NULL, '2026-11-06', 2),
(6, '47865976', 'lola', 'mariani', NULL, '1154768450', 'holatodos@gmail.com', NULL, '2026-11-07', 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clases`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clases` (
`id_horario` int(11)
,`nombre_actividad` varchar(60)
,`dia_semana` varchar(15)
,`hora_inicio` time
,`hora_fin` time
,`cupo_maximo` int(11)
,`profesor` varchar(121)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_inscripciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_inscripciones` (
`id_inscripcion` int(11)
,`socio` varchar(121)
,`nombre_actividad` varchar(60)
,`dia_semana` varchar(15)
,`hora_inicio` time
,`fecha_inscripcion` date
,`estado_inscripcion` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pagos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pagos` (
`id_pago` int(11)
,`socio` varchar(121)
,`fecha_pago` date
,`monto` decimal(10,2)
,`metodo_pago` varchar(30)
,`estado_pago` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_socios_planes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_socios_planes` (
`id_socio` int(11)
,`dni` varchar(15)
,`nombre` varchar(60)
,`apellido` varchar(60)
,`fecha_alta` date
,`nombre_plan` varchar(50)
,`precio` decimal(10,2)
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `fk_horario_actividad` (`id_actividad`),
  ADD KEY `fk_horario_profesor` (`id_profesor`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD UNIQUE KEY `uq_socio_horario` (`id_socio`,`id_horario`),
  ADD KEY `fk_inscripcion_horario` (`id_horario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_socio_pago` (`id_socio`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `fk_socio_plan` (`id_plan`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clases`
--
DROP TABLE IF EXISTS `vista_clases`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clases`  AS SELECT `h`.`id_horario` AS `id_horario`, `a`.`nombre_actividad` AS `nombre_actividad`, `h`.`dia_semana` AS `dia_semana`, `h`.`hora_inicio` AS `hora_inicio`, `h`.`hora_fin` AS `hora_fin`, `h`.`cupo_maximo` AS `cupo_maximo`, concat(`pr`.`nombre`,' ',`pr`.`apellido`) AS `profesor` FROM ((`horario` `h` join `actividad` `a` on(`h`.`id_actividad` = `a`.`id_actividad`)) join `profesor` `pr` on(`h`.`id_profesor` = `pr`.`id_profesor`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_inscripciones`
--
DROP TABLE IF EXISTS `vista_inscripciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_inscripciones`  AS SELECT `i`.`id_inscripcion` AS `id_inscripcion`, concat(`s`.`nombre`,' ',`s`.`apellido`) AS `socio`, `a`.`nombre_actividad` AS `nombre_actividad`, `h`.`dia_semana` AS `dia_semana`, `h`.`hora_inicio` AS `hora_inicio`, `i`.`fecha_inscripcion` AS `fecha_inscripcion`, `i`.`estado_inscripcion` AS `estado_inscripcion` FROM (((`inscripcion` `i` join `socio` `s` on(`i`.`id_socio` = `s`.`id_socio`)) join `horario` `h` on(`i`.`id_horario` = `h`.`id_horario`)) join `actividad` `a` on(`h`.`id_actividad` = `a`.`id_actividad`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pagos`
--
DROP TABLE IF EXISTS `vista_pagos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pagos`  AS SELECT `pa`.`id_pago` AS `id_pago`, concat(`s`.`nombre`,' ',`s`.`apellido`) AS `socio`, `pa`.`fecha_pago` AS `fecha_pago`, `pa`.`monto` AS `monto`, `pa`.`metodo_pago` AS `metodo_pago`, `pa`.`estado_pago` AS `estado_pago` FROM (`pago` `pa` join `socio` `s` on(`pa`.`id_socio` = `s`.`id_socio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_socios_planes`
--
DROP TABLE IF EXISTS `vista_socios_planes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_socios_planes`  AS SELECT `s`.`id_socio` AS `id_socio`, `s`.`dni` AS `dni`, `s`.`nombre` AS `nombre`, `s`.`apellido` AS `apellido`, `s`.`fecha_alta` AS `fecha_alta`, `p`.`nombre_plan` AS `nombre_plan`, `p`.`precio` AS `precio` FROM (`socio` `s` join `plan` `p` on(`s`.`id_plan` = `p`.`id_plan`)) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  ADD CONSTRAINT `fk_horario_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_horario` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`),
  ADD CONSTRAINT `fk_inscripcion_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_socio_pago` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `fk_socio_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
