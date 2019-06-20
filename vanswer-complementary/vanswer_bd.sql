-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2019 a las 10:01:14
-- Versión del servidor: 5.7.24-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vanswer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `nombre`, `apellidos`, `email`, `password`, `hash`, `activo`) VALUES
(1, 'Default', 'DefaultLastName', '- Elegir profesor -', 'test', '@dadoad123431', 1),
(19, 'Guadalupe', 'Ortiz', 'guadalupe.ortiz@uca.es', '$2y$10$NqynmfqtQAZ3turOHGAgb.Y3Ktus7kT9hJOEHixbTLYX5J1jYU.Zm', '84d9ee44e457ddef7f2c4f25dc8fa865', 1),
(22, 'Jose', 'Ruben', 'rubencitorivas@gmail.com', '$2y$10$j4.WMh8LzKLJ4POJzb1ah.K8tf8XluS1iuexyhldzNm3QrsY8jkTK', 'b53b3a3d6ab90ce0268229151c9bde11', 1),
(23, 'Administrador', 'del sistema', 'vansweruca@gmail.com', '$2y$10$9bP8QI5W7WzeEe3Z31jzEeIrbjdnnyDqBJxorvei7hLPEeF9OgSCy', '0f28b5d49b3020afeecd95b4009adf4c', 1),
(24, 'Alfonso', 'GdPF', 'alfonso.garciadeprado@uca.es', '$2y$10$3JBdVze/IDoGvpAtLk2zRu5cx2fP.vvCWeWGtNRBNC16jdsF0I18S', '96b9bff013acedfb1d140579e2fbeb63', 1),
(25, 'Juan', 'Boubeta-Puig', 'juan.boubeta@uca.es', '$2y$10$I2v.DIk9Qw1mKvDxIyo5EubDt0OdoBnJEJ1OGbzubAzRWYDTvuhoC', '16a5cdae362b8d27a1d8f8c7b78b4330', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacatprof`
--

CREATE TABLE `asociacatprof` (
  `prof_id` int(64) NOT NULL,
  `cat_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asociacatprof`
--

INSERT INTO `asociacatprof` (`prof_id`, `cat_id`) VALUES
(19, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(22, 20),
(19, 21),
(22, 21),
(22, 22),
(24, 22),
(22, 23),
(25, 23),
(22, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `usuario` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `tematica` text COLLATE utf8_spanish_ci NOT NULL,
  `aciertos` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `usuario`, `tematica`, `aciertos`, `total`, `fecha`) VALUES
(3, 'u45327753', 'Bases de datos', 1, 2, '2018-06-01 11:37:21'),
(4, 'u45327753', 'Bases de datos', 1, 2, '2018-06-01 12:55:42'),
(5, 'u45327753', 'Bases de datos', 2, 2, '2018-06-01 13:57:54'),
(6, 'u45327753', 'Bases de datos', 2, 2, '2018-06-01 14:13:12'),
(7, 'u45327753', 'Bases de datos', 2, 2, '2018-06-01 15:14:36'),
(8, 'u45327753', 'Bases de datos', 1, 2, '2018-06-01 15:16:53'),
(9, 'u45327753', 'Bases de datos', 2, 2, '2018-06-01 18:14:14'),
(11, 'u45327753', 'Topografía', 4, 4, '2018-06-02 15:38:39'),
(12, 'u45327753', 'Fruta', 3, 3, '2018-06-02 15:41:07'),
(13, 'u99765432', 'Topografía', 4, 4, '2018-06-03 09:22:15'),
(14, 'u31313467', 'Topografía', 4, 4, '2018-06-03 09:58:41'),
(15, 'u34009921', 'Topografía', 4, 4, '2018-06-04 12:02:19'),
(16, 'u45327753', 'Topografía', 3, 4, '2018-06-05 19:36:39'),
(17, 'u45327753', 'Topografía', 3, 3, '2018-06-07 10:24:21'),
(18, 'u45327753', 'SSI - Criptografía', 1, 7, '2019-05-02 09:03:57'),
(19, 'u75772171', 'SSI - Criptografía', 4, 7, '2019-05-02 09:07:30'),
(20, 'u45327753', 'SSI - Criptografía', 1, 7, '2019-05-02 09:08:26'),
(21, 'u45327753', 'SSI - Criptografía', 3, 7, '2019-05-02 09:09:08'),
(22, 'u45327753', 'SSI - Criptografía', 2, 7, '2019-05-02 09:10:42'),
(23, 'u45327753', 'SSI - Criptografía', 2, 8, '2019-05-02 09:15:18'),
(24, 'u75772171', 'SSI - Criptografía', 5, 8, '2019-05-02 09:18:28'),
(25, 'u45327753', 'SSI - Criptografía', 1, 8, '2019-05-02 09:19:27'),
(26, 'u75772171', 'SSI - Criptografía', 3, 8, '2019-05-03 16:39:29'),
(27, 'u49078042', 'SSI - Criptografía', 5, 8, '2019-05-07 07:48:54'),
(28, 'u75772171', 'SSI - Criptografía', 1, 8, '2019-05-07 07:49:13'),
(29, 'u45386132', 'SSI - Criptografía', 4, 8, '2019-05-07 07:53:33'),
(30, 'u63816273', 'SSI - Criptografía', 4, 8, '2019-05-07 07:55:33'),
(31, 'u49560472', 'SSI - Criptografía', 6, 8, '2019-05-07 07:56:23'),
(32, 'u77398052', 'SSI - Criptografía', 5, 8, '2019-05-07 07:56:32'),
(33, 'u44060185', 'SSI - Criptografía', 5, 8, '2019-05-07 07:57:39'),
(34, 'u49565825', 'SSI - Criptografía', 5, 8, '2019-05-07 07:57:51'),
(35, 'u20072463', 'SSI - Criptografía', 7, 8, '2019-05-07 07:59:28'),
(36, 'u00000000', 'ACPD - T3: Coherencia y Sincronismo', 29, 95, '2019-05-07 07:59:40'),
(37, 'u77174528', 'SSI - Criptografía', 5, 8, '2019-05-07 07:59:42'),
(38, 'u77176928', 'SSI - Criptografía', 6, 8, '2019-05-07 08:06:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) CHARACTER SET latin1 NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `activo`) VALUES
(1, '- Elegir temática -', 0),
(20, 'Topografía', 0),
(21, 'Ingeniería de Sistemas de Información', 0),
(22, 'ACPD - T3: Coherencia y Sincronismo', 1),
(23, 'SSI - Criptografía', 1),
(30, 'ABC - Caligrafía', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(255) NOT NULL,
  `titulo` text CHARACTER SET latin1 NOT NULL,
  `vof` varchar(1) CHARACTER SET latin1 DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `categoria_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `titulo`, `vof`, `tipo`, `categoria_id`) VALUES
(19, 'El objetivo de un levantamiento stop and go es:', NULL, 1, 20),
(20, 'Cuando usamos métodos cinemáticos conseguimos precisiones muy rigurosas:', 'F', 1, 20),
(21, 'La grabación de datos de la antena se inicia y se detiene para cada punto:', 'F', 2, 20),
(22, 'En un levantamiento cinemático la grabación de datos se realiza:', NULL, 1, 20),
(23, 'Serving customers well leads to customers returning, which raises revenues and profits', NULL, 1, 21),
(24, 'Collection of information organized in such a way that a computer program can quickly select desired pieces of data', NULL, 1, 21),
(25, 'Stage in which we can determine how a new system will work to meet  business needs defined during systems analysis', NULL, 1, 21),
(26, 'Measure of what is produced divided by what is consumed', NULL, 1, 21),
(27, 'Buffer for lack of flexibility in supply chain', NULL, 1, 21),
(28, 'Collection of facts organized in such a way that they have value beyond the facts themselves', NULL, 1, 21),
(29, 'Awareness and understanding of a set of information', NULL, 1, 21),
(30, 'Component of a system that produces useful information, sometimes in form of documents and reports', NULL, 1, 21),
(31, 'Part of a system that converts input data into useful outputs', NULL, 1, 21),
(32, 'Processes to manage relationships with a firm suppliers', NULL, 1, 21),
(33, 'Effect which appears when information about a product demand is distorted as it passes from one entity to another', NULL, 1, 21),
(34, 'Software that help companies manage all aspects of customer encounters or to collect customer data, contact customers, and educate them about new products', NULL, 1, 21),
(35, 'System information that is used to make changes to input or processing activities', NULL, 1, 21),
(36, 'Series of activities that includes inbound logistics and warehouse and storage', NULL, 1, 21),
(37, 'Set of interrelated elements that collect, manipulate, store and disseminate data', NULL, 1, 21),
(38, 'Suite of integrated software modules and a common central database that collects data from internal business activities', NULL, 1, 21),
(39, '¿Cuál es un protocólo de actualización?', NULL, 1, 22),
(40, '¿Cómo funciona el write-back?', NULL, 1, 22),
(41, '¿Que se consigue con las barreras?', NULL, 1, 22),
(42, '¿Qué se pretende conseguir con la sincronización?', NULL, 1, 22),
(43, 'La coherencia de caché en monoprocesadores es necesaria porque:', NULL, 1, 22),
(44, 'En los protocolos de invalidación de coherencia de caché:', NULL, 1, 22),
(45, 'Los problemas de sincronismo se producen cuando:', NULL, 1, 22),
(46, 'Con respecto a la consistencia que afirmación es verdadera', NULL, 1, 22),
(47, 'Las técnicas para actualizar las copias de la memoria son:', NULL, 1, 22),
(48, 'Se dice que un sistema es coherente si:', NULL, 1, 22),
(49, '¿A qué instrucción RMW se corresponde esta afirmación?: Intercambia de forma atómica el contenido de un registro con un a posición de memoria', NULL, 1, 22),
(50, 'Un multiprocesador es secuencialmente consistente si:', NULL, 1, 22),
(51, 'Un sistema será consistente si:', NULL, 1, 22),
(52, '¿Qué debería hacer un sistema que usa Snoopy MESI cuando un procesador actualiza de un dato de la caché?', NULL, 1, 22),
(53, '¿Cómo implementaría la sincronización punto a punto mediante eventos?', NULL, 1, 22),
(54, 'Diremos que un multiprocesador es secuencialmente consistente si:', NULL, 1, 22),
(55, '¿Cuál es un problema de la programación concurrente/paralela?', NULL, 1, 22),
(56, '¿Cuál de las siguientes afirmaciones es FALSA respecto a la coherencia?', NULL, 1, 22),
(57, '¿Cuál de las siguientes afirmaciones es VERDADERA respecto al protocolo Snoopy?', NULL, 1, 22),
(58, '¿Cuál de las siguientes afirmaciones es VERDADERA respecto a la consistencia?', NULL, 1, 22),
(59, 'En el protocolo MESI...', NULL, 1, 22),
(60, 'En el protocolo Snoopy cual no es un posible estado de un bloque', NULL, 1, 22),
(61, '¿Cómo sabe un procesador si una variable de su memoria caché ha sido modificada por otro procesador?', NULL, 1, 22),
(62, 'Write-back...', NULL, 1, 22),
(63, 'Que característica se desea en una sincronización:', NULL, 1, 22),
(64, 'Una característica de los Tickets en Métodos para reducir el trafico es', NULL, 1, 22),
(65, 'En modelos de Consistencia relajados, selecciona cuál NO es una instrucción fence:', NULL, 1, 22),
(66, 'Selecciona una acción de Snoopy frente al procesador local:', NULL, 1, 22),
(67, '¿Cual de estas acciones del protocolo snoopy es una solicitud de un bloque actualizado?', NULL, 1, 22),
(68, '¿Cual de los siguientes NO es un tipo de consistencia?', NULL, 1, 22),
(69, '¿Cual de las siguientes no es una caracteristica deseada en una sincronizacion?', NULL, 1, 22),
(70, 'Usando el protocolo MSI, partimos de:\r\n	P1(M) P2(S) P3(S) P4(S)\r\nSi la cache de P1 recibe una señal de BR(Bus read), ¿Cómo quedaria luego los procesos?', NULL, 1, 22),
(71, '¿Cuál es la principal desventaja de los protocolos de actualización frente a invalidación?', NULL, 1, 22),
(72, 'En una instrucción Test&Set, el tiempo de espera..', NULL, 1, 22),
(73, 'Para implementar una barrera, debemos hacer uso de:', NULL, 1, 22),
(74, 'Que un sistema multiprocesador sea consistente implica:', NULL, 1, 22),
(75, '¿Cuál es la propiedad que asegura que todas las copias accesibles a lectura mantengan la información actualizada?', NULL, 1, 22),
(76, '¿Cuáles de las siguientes son acciones Snoopy frente al procesador local?', NULL, 1, 22),
(77, '¿Cuál de las siguientes características NO es deseada en una sincronización?', NULL, 1, 22),
(78, '¿Cuáles de los siguientes algoritmos de espera son usados en procesadores SMP?', NULL, 1, 22),
(79, 'En el protocolo MOSI de actualiazción , el estado Owned (O) permite:', NULL, 1, 22),
(80, '¿Qué es una sección crítica?', NULL, 1, 22),
(81, '¿Cuáles son las caresterísticas deseadas en una sincronización?', NULL, 1, 22),
(82, '¿Cuál no es un modelo de consistencia relajado?', NULL, 1, 22),
(83, 'Cuales son las políticas de escritura que controlan la actualización de la memoria principal en el protocolo Snoopy?', NULL, 1, 22),
(84, 'Indique cual de las siguientes NO es una característica deseada en una sincronización:', NULL, 1, 22),
(85, 'Indique cual de los siguientes modelos de consistencia relajados que no asegura el orden Wr->Rd ni el orden Wr->Wr, pero sí el orden Rd->Wr', NULL, 1, 22),
(86, '¿Cuál es correcta sobre WT y WB?', NULL, 1, 22),
(87, '¿Cuándo decimos que un sistema de memoria es coherente?', NULL, 1, 22),
(88, 'En el protocolo Snoopy para gestionar la coherencia se añaden bits de control al bloque:', NULL, 1, 22),
(89, 'Características deseadas en una sincronización:', NULL, 1, 22),
(90, 'Un sistema paralelo ha de ser consistente, es decir:', NULL, 1, 22),
(91, '¿Cúal de estos algoritmos es capaz de expulsar un proceso en ejecución por otro que tenga más prioridad que él?', NULL, 1, 22),
(92, '¿Cúal de los álgoritmos es circular?', NULL, 1, 22),
(93, 'Si nuestra memoria se encuentra a un nivel más cerca del procesador significa..', NULL, 1, 22),
(94, '¿Qué método de exclusión mutua no usa flags?', NULL, 1, 22),
(95, '¿Qué modelo de consistencia relajado no asegura el orden Wr->Rd?', NULL, 1, 22),
(96, '¿En el protocolo Snoopy,¿en qué estados puede encontrarse un bloque de caché?', NULL, 1, 22),
(97, '¿Cuál de las siguientes afirmaciones sobre las Barreras es FALSA?', NULL, 1, 22),
(98, '¿Cuál de las siguiente afirmaciones es FALSA?', NULL, 1, 22),
(99, '¿Cuál de las siguientes afirmaciones sobre las instrucciones LL y SC es FALSA?', NULL, 1, 22),
(100, '¿Cuál de las siguente afirmaciones sobre la exclusión mutua es VERDADERA?', NULL, 1, 22),
(101, 'Si durante la lectura de un dato de memoria se produce un error, ¿hacia donde se transmite la petición de lectura?', NULL, 1, 22),
(102, '¿En qué consiste la propiedad de inclusión dentro de la jerarquía de caché?', NULL, 1, 22),
(103, '¿Qué protocolo de invalidación hemos tratado en este tema?', NULL, 1, 22),
(104, 'Se dice que un multiprocesador es secuencialmente consistente si:', NULL, 1, 22),
(105, '¿Qué estados son los que pueden tener los bloques de caché?', NULL, 1, 22),
(106, '¿Qué afirmación es cierta?', NULL, 1, 22),
(107, '¿Cuáles son los problemas que surgen al implementar el protocolo Snoopy?', NULL, 1, 22),
(108, '¿Qué realiza el algoritmo de espera SRTF?', NULL, 1, 22),
(109, '¿Cuándo un sistema multiprocesador es consistente?', NULL, 1, 22),
(110, '¿Que es la sincronización?', NULL, 1, 22),
(112, '¿Cuantos bits son necesatos para identificar los estados de snoopy?', NULL, 1, 22),
(113, '¿Cuales es un metodos de sincronización?', NULL, 1, 22),
(114, '¿Que elementos son necesarios para sea posible la sincronización mediante barrera?', NULL, 1, 22),
(115, '¿Cual es un método de consistencia relajado?', NULL, 1, 22),
(116, 'Uno de los problemas del protocolo Snoopy surge cuando procesador y bus intentan acceder a la vez a la memoria caché. ¿Qué solución adoptarías?', NULL, 1, 22),
(117, 'Uno de los protocolos de escritura en el Protocolo Snoopy es el de:', NULL, 1, 22),
(118, 'La coherencia en el Protocolo Snoopy se realizará por:', NULL, 1, 22),
(119, 'Para la sincronización mediante Barreras, es necesario:', NULL, 1, 22),
(120, '¿Qué quiere decir que un sistema paralelo ha de ser consistente?', NULL, 1, 22),
(121, 'En el protocolo MESI:', NULL, 1, 22),
(122, 'Al realizar una actualización de una variable compartida...', NULL, 1, 22),
(123, '¿Qué posibilidad(es) hay ante una actualización de un dato que está copiado?', NULL, 1, 22),
(124, '¿Qué significa que un sistema paralelo ha de ser consistente?', NULL, 1, 22),
(125, '¿Qué es un evento?', NULL, 1, 22),
(126, '¿Qué es una barrera?', NULL, 1, 22),
(127, '¿Qué problemas de caché surgen con el protocolo Snoopy?', NULL, 1, 22),
(128, '¿Cuál de los siguientes mecanismos regula la exclusión mutua a nivel hardware?', NULL, 1, 22),
(129, '¿Quién introdujo el término "Consistencia secuencial" por primera vez?', NULL, 1, 22),
(130, '¿Cual de los siguiente no es un protocolo de invalidacion?', NULL, 1, 22),
(131, '¿Cual de las siguientes instrucciones no pertenece al conjunto RWM?', NULL, 1, 22),
(132, '¿Cual de los siguientes mecanismos fue pensado para gestionar la exclusion mutua a nivel de hardware?', NULL, 1, 22),
(133, 'Los interbloqueos hacen referencia', NULL, 1, 22),
(134, 'Un sistema multiprocesador es secuencialmente consistente si:', NULL, 1, 22),
(135, 'Which cipher was used to obtain the following ciphertext?\r\nPlaintext = ESI IS THE ACRONYM FOR SCHOOL OF ENGINEERING\r\nCiphertext = JXN NX YMJ FHWTSDR KTW XHMTTQ TK JSLNSJJWNSL', NULL, 2, 23),
(136, 'Which is the ciphertext obtained as a result of applying ROT7 to the following plaintext?\r\nPlaintext = TODAY THE CLASS IS IN ENGLISH', NULL, 2, 23),
(137, 'Which cipher was used to obtain the following ciphertext?\r\nPlaintext = CYBERSECURITY IS A KEY ENABLER FOR INDUSTRY\r\nCiphertext = YRTSUDNI ROF RELBANE YEK A SI YTIRUCESREBYC', NULL, 2, 23),
(138, 'Encrypt the following plaintext using Caesar method?\r\nPlaintext = CONFIDENTIALITY AND INTEGRITY', NULL, 2, 23),
(139, 'Caesar cipher involves replacing each letter of the alphabet with the letter standing 5 places further down the alphabet:', 'F', 2, 23),
(140, 'In the transposition techniques, letters of plaintext are replaced by other letters.', 'F', 2, 23),
(141, 'Inverse transposition and shift-1 transposition are equivalent.', 'F', 2, 23),
(142, 'Ciphertext and cryptogram are synonyms.', 'V', 2, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repaso`
--

CREATE TABLE `repaso` (
  `id` int(11) NOT NULL,
  `usuario` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `tematica` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `repaso`
--

INSERT INTO `repaso` (`id`, `usuario`, `tematica`, `pregunta_id`) VALUES
(34, 'u12345678', 'Topografía', 19),
(35, 'u12345678', 'Topografía', 20),
(31, 'u31247211', 'Topografía', 19),
(32, 'u31247211', 'Topografía', 20),
(33, 'u31247211', 'Topografía', 22),
(241, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 58),
(242, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 60),
(243, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 67),
(365, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 102),
(255, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 105),
(261, 'u32078296', 'ACPD - T3: Coherencia y Sincronismo', 131),
(446, 'u32085090', 'Topografía', 19),
(447, 'u32085090', 'Topografía', 22),
(472, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 39),
(473, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 40),
(474, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 42),
(475, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 44),
(476, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 47),
(477, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 49),
(478, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 50),
(479, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 52),
(480, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 55),
(481, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 58),
(482, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 59),
(483, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 60),
(484, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 61),
(485, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 62),
(486, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 63),
(487, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 65),
(488, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 66),
(489, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 67),
(490, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 68),
(491, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 69),
(492, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 70),
(493, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 71),
(494, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 72),
(495, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 73),
(496, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 74),
(497, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 75),
(498, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 76),
(499, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 77),
(500, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 78),
(501, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 79),
(502, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 80),
(503, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 81),
(504, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 82),
(505, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 84),
(506, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 85),
(507, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 86),
(508, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 87),
(509, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 88),
(510, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 89),
(511, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 90),
(512, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 91),
(513, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 92),
(514, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 94),
(515, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 95),
(516, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 96),
(517, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 97),
(518, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 98),
(519, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 99),
(520, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 100),
(521, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 101),
(522, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 102),
(523, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 104),
(524, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 106),
(525, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 107),
(526, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 108),
(527, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 109),
(528, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 110),
(529, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 112),
(530, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 113),
(531, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 114),
(532, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 116),
(533, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 117),
(534, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 118),
(535, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 119),
(536, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 123),
(537, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 124),
(538, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 125),
(539, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 126),
(540, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 127),
(541, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 128),
(542, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 129),
(543, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 130),
(544, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 131),
(545, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 132),
(546, 'u45327753', 'ACPD - T3: Coherencia y Sincronismo', 134),
(209, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 39),
(190, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 43),
(197, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 44),
(199, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 47),
(213, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 48),
(214, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 49),
(127, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 51),
(128, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 52),
(164, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 53),
(166, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 57),
(102, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 59),
(104, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 61),
(221, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 63),
(222, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 66),
(80, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 67),
(137, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 68),
(225, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 70),
(226, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 71),
(174, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 72),
(228, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 74),
(229, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 77),
(230, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 79),
(231, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 81),
(93, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 82),
(116, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 83),
(94, 'u45327753', 'ACPD - T3: Coherencia/Sincronismo', 85),
(28, 'u45327753', 'Fruta', 16),
(29, 'u45327753', 'Fruta', 17),
(594, 'u45327753', 'Ingeniería de Sistemas de Información', 23),
(572, 'u45327753', 'Ingeniería de Sistemas de Información', 24),
(450, 'u45327753', 'Ingeniería de Sistemas de Información', 25),
(597, 'u45327753', 'Ingeniería de Sistemas de Información', 26),
(575, 'u45327753', 'Ingeniería de Sistemas de Información', 27),
(599, 'u45327753', 'Ingeniería de Sistemas de Información', 28),
(587, 'u45327753', 'Ingeniería de Sistemas de Información', 30),
(554, 'u45327753', 'Ingeniería de Sistemas de Información', 32),
(566, 'u45327753', 'Ingeniería de Sistemas de Información', 33),
(603, 'u45327753', 'Ingeniería de Sistemas de Información', 34),
(591, 'u45327753', 'Ingeniería de Sistemas de Información', 35),
(569, 'u45327753', 'Ingeniería de Sistemas de Información', 36),
(593, 'u45327753', 'Ingeniería de Sistemas de Información', 37),
(607, 'u45327753', 'Ingeniería de Sistemas de Información', 38),
(30, 'u45327753', 'Topografía', 22),
(417, 'u75772171', 'Ingeniería de Sistemas de Información', 27),
(418, 'u75772171', 'Ingeniería de Sistemas de Información', 29),
(419, 'u75772171', 'Ingeniería de Sistemas de Información', 30),
(420, 'u75772171', 'Ingeniería de Sistemas de Información', 31),
(421, 'u75772171', 'Ingeniería de Sistemas de Información', 32),
(423, 'u75772171', 'Ingeniería de Sistemas de Información', 34),
(424, 'u75772171', 'Ingeniería de Sistemas de Información', 35),
(427, 'u75772171', 'Ingeniería de Sistemas de Información', 38),
(51, 'u76444759', 'Ingenieria de Sistemas de Informacion', 25),
(57, 'u76444759', 'Ingenieria de Sistemas de Informacion', 26),
(54, 'u76444759', 'Ingenieria de Sistemas de Informacion', 30),
(59, 'u76444759', 'Ingenieria de Sistemas de Informacion', 31),
(55, 'u76444759', 'Ingenieria de Sistemas de Informacion', 32),
(38, 'uxxxxxxxx', 'Ingenieria de Sistemas de Informacion', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(255) NOT NULL,
  `descripcion` text CHARACTER SET latin1 NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `descripcion`, `is_correct`, `pregunta_id`) VALUES
(55, 'Medir puntos desconectados entre sí', 1, 19),
(56, 'Medir puntos contínuos', 0, 19),
(57, 'Medir puntos en trayectorias', 0, 19),
(58, 'Mediciones estáticas de precisión', 0, 19),
(59, 'Cada intervalo prefijado de tiempo y distancia', 1, 22),
(60, 'Cada intervalo de tiempo', 0, 22),
(61, 'Cada intervalo de distancia', 0, 22),
(62, 'En la media de los intervalos de distancia', 0, 22),
(63, 'Customer Intimacy', 1, 23),
(64, 'Survival', 0, 23),
(65, 'Supplier intimacy', 0, 23),
(66, 'None', 0, 23),
(67, 'Database', 1, 24),
(68, 'Raw data', 0, 24),
(69, 'Knowledge', 0, 24),
(70, 'All are true', 0, 24),
(71, 'System design', 1, 25),
(72, 'System analysis', 0, 25),
(73, 'System investigation', 0, 25),
(74, 'System implementation', 0, 25),
(75, 'Efficiency', 1, 26),
(76, 'Effectiveness', 0, 26),
(77, 'Productivity', 0, 26),
(78, 'None', 0, 26),
(79, 'Safety stock', 1, 27),
(80, 'Upstream supply chain', 0, 27),
(81, 'Downstream supply chain', 0, 27),
(82, 'Information system', 0, 27),
(83, 'Information', 1, 28),
(84, 'Raw data', 0, 28),
(85, 'Simple data', 0, 28),
(86, 'Complex data', 0, 28),
(87, 'Knowledge', 1, 29),
(88, 'Information', 0, 29),
(89, 'Data', 0, 29),
(90, 'Information system', 0, 29),
(91, 'Output', 1, 30),
(92, 'Input', 0, 30),
(93, 'Processing', 0, 30),
(94, 'Feedback', 0, 30),
(95, 'Processing', 1, 31),
(96, 'Input', 0, 31),
(97, 'Output', 0, 31),
(98, 'Feedback', 0, 31),
(99, 'Upstream supply chain', 1, 32),
(100, 'Downstream supply chain', 0, 32),
(101, 'Value chain', 0, 32),
(102, 'None', 0, 32),
(103, 'Bullwhip effect', 1, 33),
(104, 'Safety stock', 0, 33),
(105, 'Customer intimacy', 0, 33),
(106, 'Value chain', 0, 33),
(107, 'CRM', 1, 34),
(108, 'ERP', 0, 34),
(109, 'VAL', 0, 34),
(110, 'CHAIN', 0, 34),
(111, 'Feedback', 1, 35),
(112, 'Input', 0, 35),
(113, 'Output', 0, 35),
(114, 'Processing', 0, 35),
(115, 'Value chain', 1, 36),
(116, 'Downstream supply chain', 0, 36),
(117, 'Large chain', 0, 36),
(118, 'None', 0, 36),
(119, 'Information system', 1, 37),
(120, 'Knowledge', 0, 37),
(121, 'Data', 0, 37),
(122, 'Information', 0, 37),
(123, 'ERP', 1, 38),
(124, 'Business Process', 0, 38),
(125, 'Business Services', 0, 38),
(126, 'CRM', 0, 38),
(127, 'MSE', 1, 39),
(128, 'MSI', 0, 39),
(129, 'SMP', 0, 39),
(130, 'RMW', 0, 39),
(131, 'Las copias se actualizan en memoria principal cuando hay que eliminar el bloque de la caché', 1, 40),
(132, 'Se actualizan todas las copias', 0, 40),
(133, 'Se dedíca a fisgar en el bus', 0, 40),
(134, 'Escribe en orden opuesto', 0, 40),
(135, 'Asegurar que todos los procesos han llegado a un determinado punto', 1, 41),
(136, 'Disminuir el tráfico entre procesador y memoria', 0, 41),
(137, 'Para evitar que la sección crítica sea ejecutada por mas de un proceso consecuentemente', 0, 41),
(138, 'Ahorrar tiempo de transferencia cargando un bloque de caché desde otra caché', 0, 41),
(139, 'Baja latencia, tráfico limitado y escalabilidad', 1, 42),
(140, 'Baja latencia, tráfico mínimo y poca escalabilidad', 0, 42),
(141, 'Mayor latencia, trafico abundante y escalabilidad', 0, 42),
(142, 'Mejor rendimiento en consecuencia de aumento de tráfico', 0, 42),
(143, 'El dato más recientemente actualizado para una dirección de memoria puede no estar presente en uno o varios niveles de la jerarquía de memoria', 1, 43),
(144, 'Para que las escrituras se realicen antes que las lecturas', 0, 43),
(145, 'Sincronizar operaciones de varios hilos en memoria compartida', 0, 43),
(146, 'Permite al procesador almacenar datos en memoria externa mediante un controlador de E/S', 0, 43),
(147, 'Al realizar una actualización de una variable compartida en una caché, se invalidan todas las copias compartidas en el resto de cachés', 1, 44),
(148, 'Al realizar una actualización de una variable compartida en una caché, el mecanismo de write-back actualiza el bloque en todos los niveles inferiores de la jerarquía de caché y además se invalidan las copias compartidas en el resto de cachés', 0, 44),
(149, 'Al realizar una actualización de una variable compartida en una caché, se reemplaza el bloque para todas las copias compartidas en el resto de cachés', 0, 44),
(150, 'Al realizar una actualización de una variable compartida en una caché, se reemplaza la palabra de memoria para todas las copias compartidas en el resto de cachés', 0, 44),
(151, 'Varios procesadores acceden al mismo tiempo a una sección crítica, pudiendo quedar los datos escritos en un estado indeterminado que no sigue la lógica esperada para el programa', 1, 45),
(152, 'No utilizamos protocolos de invalidación para asegurar la coherencia de caché', 0, 45),
(153, 'Se bloquea el acceso de un procesador a una sección crítica mientras otro está dentro', 0, 45),
(154, 'No se utilizan barreras en el código concurrente', 0, 45),
(155, 'Necesitamos modelos específicos para asegurar la consistencia pues la coherencia y sincronización no son suficientes para asegurar la consistencia', 1, 46),
(156, 'Establecer mecanismos de sincronización es suficiente para asegurar la consistencia', 0, 46),
(157, 'La coherencia basta para asegurar el orden en el que se verán los cambios en variables diferentes', 0, 46),
(158, 'No es un problema de los multiprocesadores', 0, 46),
(159, 'WT y WB', 1, 47),
(160, 'TW y BW', 0, 47),
(161, 'WD y WL', 0, 47),
(162, 'WT y WA', 0, 47),
(163, 'Al leer una variable, se obtiene el último valor escrito en esa variable y todas las escrituras sobre una variable se "ven" en el mismo orden en todos los procesadores', 1, 48),
(164, 'Al leer una variable, se obtiene el primer valor escrito en esa variable y todas las escrituras sobre una variable se "ven" en el mismo orden en todos los procesadores', 0, 48),
(165, 'Al leer una variable, se obtiene el último valor escrito en esa variable y todas las escrituras sobre una variable se "ven" en distinto orden en todos los procesadores', 0, 48),
(166, 'Ninguna es correcta', 0, 48),
(167, 'Swap', 1, 49),
(168, 'Test&Set', 0, 49),
(169, 'LL(Load Locked)', 0, 49),
(170, 'Fetch&Op', 0, 49),
(171, 'Mantiene el orden local de las instrucciones y el orden global de las instrucciones corresponde a un determinado entrelazado', 1, 50),
(172, 'Aunque no mantenga el orden local de las instrucciones, el orden global de las instrucciones corresponde a un determinado entrelazado', 0, 50),
(173, 'No mantiene ni el orden local de las instruciónes ni el orden global de las instruciones', 0, 50),
(174, 'Mantiene el orden local de las instrucciones pero el orden global de las instrucciones no se corresponde a un determinado entrelazado', 0, 50),
(175, 'Cuando se lee una variable se obtiene el último valor escrito en ella', 1, 51),
(176, 'Las escrituras se ven en orden aleatorio en cada procesador', 0, 51),
(177, 'Se distribuyen los datos adecuadamente en la memoria', 0, 51),
(178, 'Los procesadores pueden usar variables privadas que solo puede usar ese procesador', 0, 51),
(179, 'Invalidar todas las copias', 1, 52),
(180, 'Invalidar todas las copias y actualizarlas en caché', 0, 52),
(181, 'Actualizar todas las copias', 0, 52),
(182, 'Actualizar todas las copias e invalidar el dato en memoria principal', 0, 52),
(183, 'Usando un bucle de espera activa que consultase una variable común', 1, 53),
(184, 'Usando cerrojos', 0, 53),
(185, 'Usando un contador y un flag', 0, 53),
(186, 'Usando variables auxiliares', 0, 53),
(187, 'El orden global de las intrucciones, necesariamente atómicas, corresponde a un determinado entrelazado', 1, 54),
(188, 'No mantiene el orden local de las instrucciones', 0, 54),
(189, 'Desordena las instrucciones de acceso a memoria', 0, 54),
(190, 'El compilador puede reordenar el código', 0, 54),
(191, 'Acceso a la misma posición en memoria por distintos procesos', 1, 55),
(192, 'Velocidad de procesamiento', 0, 55),
(193, 'Control de los ciclos de reloj', 0, 55),
(194, 'Aprovechamiento de los procesadores multinúcleo', 0, 55),
(195, 'Una variable pública puede estar en un bloque con otras variables que usan otros procesadores', 1, 56),
(196, 'Los procesadores pueden usar variables privadas que solo puede usar ese procesador', 0, 56),
(197, 'Los protocolos de coherencia no gestionan variables privadas', 0, 56),
(198, 'Se generan falsas comparticiones', 0, 56),
(199, 'La coherencia se realizará por hardware', 1, 57),
(200, 'Todas las operaciones son privadas y cualquier procesador puede ver lo que otros hacen', 0, 57),
(201, 'Todas las operaciones son privadas y no todos los procersadores pueden ver lo que otros hacen', 0, 57),
(202, 'La coherencia se realizará por software', 0, 57),
(203, 'La coherencia no asegura el orden en que se verán los cambios en las variables diferentes', 1, 58),
(204, 'La coherencia asegura el orden en que se verán los cambios en las variables diferentes', 0, 58),
(205, 'La sincronización es suficiente cuando se produce una reordenación del código', 0, 58),
(206, 'No asegura el orden de modificación de esa variable, sea igual en todos los procesadores', 0, 58),
(207, 'Se introduce un estado E (Exclusive) que garantiza solo una copia del bloque', 1, 59),
(208, 'Se introduce un estado V (Valid) que proporciona solo una copia valida', 0, 59),
(209, 'Para distinguir entre E y S se introduce una señal de control ph', 0, 59),
(210, 'Mejora del MSI para maximizar las invalidaciones', 0, 59),
(211, 'Valido', 1, 60),
(212, 'Exclusivo', 0, 60),
(213, 'Modificado', 0, 60),
(214, 'Compartido', 0, 60),
(215, 'Usar protocolos de coherencia', 1, 61),
(216, 'Cachear variables compartidas', 0, 61),
(217, 'Limpiar la caché', 0, 61),
(218, 'Cachear bloques de E/S', 0, 61),
(219, 'Las copias se actualizan en memoria principal cuando hay que eliminar el bloque de la caché', 1, 62),
(220, 'Las copias se actualizan en memoria principal cuando no hay que eliminar el bloque de la caché', 0, 62),
(221, 'Las copias se actualizan en memoria caché cuando hay que eliminar el bloque de la memoria principal', 0, 62),
(222, 'Las copias se desactualizan en memoria principal cuando hay que eliminar el bloque de la caché', 0, 62),
(223, 'Igualdad de oportunidades', 1, 63),
(224, 'Trafico ilimitado', 0, 63),
(225, 'Latencia alta', 0, 63),
(226, 'Poca escalabilidad', 0, 63),
(227, 'El incremento de las variables se realizan con la instrucción Fetch&Incr', 1, 64),
(228, 'Se implementa usando solamente una variable turno', 0, 64),
(229, 'Se implementa una cola LIFO para acceder a la sección critica', 0, 64),
(230, 'Al obtener el ticket y actualizar el turno, no se genera trafico', 0, 64),
(231, 'Load-fence', 1, 65),
(232, 'Write-fence', 0, 65),
(233, 'Read-fence', 0, 65),
(234, 'Memory-fence', 0, 65),
(235, 'PW (Processor Write)', 1, 66),
(236, 'BR (Bus Read)', 0, 66),
(237, 'BW (Bus Write)', 0, 66),
(238, 'BC (Broadcast)', 0, 66),
(239, 'INV(Invalidate)', 1, 67),
(240, 'BR', 0, 67),
(241, 'BC', 0, 67),
(242, 'BW', 0, 67),
(243, 'RCP', 1, 68),
(244, 'TSO', 0, 68),
(245, 'PSO', 0, 68),
(246, 'WO', 0, 68),
(247, 'Alto coste en memoria', 1, 69),
(248, 'Escalabilidad', 0, 69),
(249, 'Baja latencia', 0, 69),
(250, 'Trafico limitado', 0, 69),
(251, 'P1(S) P2(S) P3(S) P4(S)', 1, 70),
(252, 'P1(I) P2(M) P3(M) P4(M)', 0, 70),
(253, 'P1(S) P2(I) P3(I) P4(I)', 0, 70),
(254, 'P1(I) P2(S) P3(S) P4(S)', 0, 70),
(255, 'Necesitan de mayor ancho de banda para propagar las actualizaciones', 1, 71),
(256, 'Requieren siempre copiar a memoria los cambios en un bloque', 0, 71),
(257, 'Hacen uso de muchas más señales de control lo que los hace más complejos de implementar', 0, 71),
(258, 'No tienen ninguna desventaja destacable', 0, 71),
(259, 'debe ser exponencial, de forma que se incremente con cada intento fallido', 1, 72),
(260, 'debe ser bajo para poder adquirir el cerrojo en cuanto esté listo', 0, 72),
(261, 'debe ser alto, de forma que no se desperdicie tiempo preguntando', 0, 72),
(262, 'debe ser aleatorio, pues se desconoce cuándo estará libre', 0, 72),
(263, 'Un cerrojo, un contador y un flag', 1, 73),
(264, 'Un contador y un número de procesos a esperar', 0, 73),
(265, 'Un contador y un flag', 0, 73),
(266, 'Un contador, un flag, un número de procesos y un flag', 0, 73),
(267, 'Que los resultados sean los mismos que si se usara un único procesador', 1, 74),
(268, 'Que los cambios realizados en una variable compartida sea visible por todos los procesadores', 0, 74),
(269, 'Que se mantienen las propiedades de exclusión mútua en el acceso a variables compartidas', 0, 74),
(270, 'Mantener el orden original de las instrucciones', 0, 74),
(271, 'Coherencia', 1, 75),
(272, 'Consistencia', 0, 75),
(273, 'Sincronismo', 0, 75),
(274, 'Permanencia', 0, 75),
(275, 'PR, PW', 1, 76),
(276, 'BR, INV', 0, 76),
(277, 'BW, BC', 0, 76),
(278, 'PR, BW', 0, 76),
(279, 'Poca escalabilidad', 1, 77),
(280, 'Baja latencia', 0, 77),
(281, 'Trafico limitado', 0, 77),
(282, 'Poco coste en memoria', 0, 77),
(283, 'Espera activa y bloqueo', 1, 78),
(284, 'Interbloqueo', 0, 78),
(285, 'Espera sincronizada', 0, 78),
(286, 'Espera activa e interbloqueo', 0, 78),
(287, 'Tener múltiples copias no coherentes con memoria pero coherentes entre si', 1, 79),
(288, 'Tener un dato de forma aislada', 0, 79),
(289, 'El dato coincide con el resto de procesadores', 0, 79),
(290, 'El dato acaba de actualizarse en MP', 0, 79),
(291, 'Sección de código que para asegurar su correcto funcionamiento, en un momento dado solo puede ejecutarse en un procesador', 1, 80),
(292, 'Sección de código que puede ejecutarse de forma paralela', 0, 80),
(293, 'Sección de código que permite varios hilos la ejecuten a la vez', 0, 80),
(294, 'Sección de código que solo permite escrituras', 0, 80),
(295, 'Baja latencia, Trafico limitado, Escalabilidad, Poco coste en memoria, Igualdad de oportunidades', 1, 81),
(296, 'Alta latencia, Trafico ilimitado, Escalabilidad, Poco coste en memoria, Igualdad de oportunidades', 0, 81),
(297, 'Alta latencia, Trafico limitado, Escalabilidad, Poco coste en memoria, Igualdad de oportunidades', 0, 81),
(298, 'Baja latencia, Trafico ilimitado, Escalabilidad, Poco coste en memoria, Igualdad de oportunidades', 0, 81),
(299, 'WOE', 1, 82),
(300, 'TSO', 0, 82),
(301, 'PSO', 0, 82),
(302, 'WO', 0, 82),
(303, 'WriteThrough(WT) y WriteBack(WB)', 1, 83),
(304, 'Valid(V), Dirty(D)', 0, 83),
(305, 'Modified(M), Exlusive(E)', 0, 83),
(306, 'ProcessorWrite(PrWr), BusWrite(BusWr) y BusUpdate(BusUpdt)', 0, 83),
(307, 'Atomicidad', 1, 84),
(308, 'Tráfico limitado', 0, 84),
(309, 'Escalabilidad', 0, 84),
(310, 'Igualdad de oportunidades', 0, 84),
(311, 'Partial Store Ordering(PSO)', 1, 85),
(312, 'Secuential Consistency(SC)', 0, 85),
(313, 'Release Consistency(RC)', 0, 85),
(314, 'Weak Ordering(WO)', 0, 85),
(315, 'WB proporciona mejor rendimiento que WT, a costa de una mayor complejidad hardware para mantener coherencia', 1, 86),
(316, 'WT proporciona mejor rendimiento que WB, a costa de una mayor complejidad hardware para mantener coherencia', 0, 86),
(317, 'WB proporciona mejor rendimiento que WT, a costa de una mayor complejidad software para mantener coherencia', 0, 86),
(318, 'Ninguna es correcta', 0, 86),
(319, 'Todas son correctas', 1, 87),
(320, 'Cuando una operación de lectura retorna siempre el último valor independientemente del procesador que efectúa escritura o lectura', 0, 87),
(321, 'Si un dato se encuentra en el nivel más alto de la jerarquía y ha sido modificado, activará mecanismos para que esta modificación se lleve a cabo en el resto de niveles', 0, 87),
(322, 'Soluciona los problemas de coherencia de forma correcta', 0, 87),
(323, 'I (Inválido), E (Exclusivo), M (Modificado), S (Compartido) y O (Propietario)', 1, 88),
(324, 'I (Inválido), E (Exclusivo), S (Compartido) y O (Propietario)', 0, 88),
(325, 'I (Inválido), E (Exclusivo)y S (Compartido)', 0, 88),
(326, 'M (Modificado), S (Compartido) y O (Propietario)', 0, 88),
(327, 'Baja latencia, tráfico limitado, escalabilidad, poco coste en memoria e igualdad de oportunidades', 1, 89),
(328, 'Alta latencia, tráfico ilimitado, escalabilidad, poco coste en memoria e igualdad de oportunidades', 0, 89),
(329, 'Baja latencia, tráfico limitado, escalabilidad, alto coste en memoria e igualdad de oportunidades', 0, 89),
(330, 'Ninguna es correcta', 0, 89),
(331, 'Los resultados han de ser los mismos que si se ejecuta en un solo procesador', 1, 90),
(332, 'Los resultados han de ser principalmente diferentes para que sea consistente', 0, 90),
(333, 'Algunos resultados serán los mismos', 0, 90),
(334, 'Ninguna es correcta', 0, 90),
(335, 'SRTF', 1, 91),
(336, 'FCFS', 0, 91),
(337, 'SJF', 0, 91),
(338, 'RR', 0, 91),
(339, 'RR', 1, 92),
(340, 'FCFS', 0, 92),
(341, 'SJF', 0, 92),
(342, 'SRTF', 0, 92),
(343, 'Es más caro, más rápido y menos capacidad', 1, 93),
(344, 'Es más caro, más rápido y más capacidad', 0, 93),
(345, 'Es menos caro más rápido y más capacidad', 0, 93),
(346, 'Es menos caro menos rápido y menos capacidad', 0, 93),
(347, 'CS', 1, 94),
(348, 'Barreras', 0, 94),
(349, 'Punto a Punto', 0, 94),
(350, 'SC', 0, 94),
(351, 'PSO y TSO', 1, 95),
(352, 'PSO', 0, 95),
(353, 'SC', 0, 95),
(354, 'TSO', 0, 95),
(355, 'Inválido, Modificado, Compartido, Exclusivo, Propietario', 1, 96),
(356, 'Inválido, Modificado, Compartido', 0, 96),
(357, 'Inválido, Modificado, Compartido, VacíoInválido, Modificado, Compartido, Propietario', 0, 96),
(358, 'Inválido, Modificado, Compartido, Vacío', 0, 96),
(359, 'Es imposible que generen un interbloqueo', 1, 97),
(360, 'La barrera solo se levanta cuando todos los procesos han llegado hasta ella', 0, 97),
(361, 'Sirve para sincronizar procesos', 0, 97),
(362, 'Es necesario usar un cerrojo, un contador y un flag', 0, 97),
(363, 'En el modelo de consistencia hiperRelajado, el sincronismo se divide en tres partes: adquisición, comprobación y liberación', 1, 98),
(364, 'Para asegurar el orden global en la consistencia secuencial, la ejecución de una instrucción de acceso a memoria debe esperar a que las anteriores hayan terminado', 0, 98),
(365, 'En el modelo de consistencia relajado, siempre debe existir la posibilidad de forzar el orden estricto de las instrucciones', 0, 98),
(366, 'En el modelo de consistencia relajado, se utiliza un tipo de instrucción conocido como barreras de ordenación', 0, 98),
(367, 'Si SC comprueba que el flag de estado indica que el valor a guardar puede haber cambiado, se produce un salto hasta la instrucción LL(produce un bucle)', 1, 99),
(368, 'SC comprueba el valor del flag de estado colocado por LL antes de guardar el valor', 0, 99),
(369, 'LL puede utilizarse sin necesidad de incluir la instrucción SC', 0, 99),
(370, 'Las operaciones que queramos en exclusión mutua sobre el valor que queremos modificar, deben ir obligatoriamente entre la instrucción LL y la SC', 0, 99),
(371, 'En la mayoría de los casos, es necesaria la existencia de instrucciones RMW atómicas a nivel de hardware para poder implementar la exclusión mutua a nivel de software', 1, 100),
(372, 'Es imposible implementarla a nivel de hardware', 0, 100),
(373, 'Los métodos/operaciones de un monitor no tienen por qué realizarse en exclusión mutua', 0, 100),
(374, 'Siempre es necesaria cuando hay varios procesos concurrentes', 0, 100),
(375, 'Hacia el bus', 1, 101),
(376, 'Hacia la caché', 0, 101),
(377, 'Hacia la memoria principal', 0, 101),
(378, 'Se elimina la petición', 0, 101),
(379, 'Duplicar los datos de la caché L1 en la caché L2', 1, 102),
(380, 'Duplicar las memorias cachés para conseguir más espacio', 0, 102),
(381, 'Añadir un bit más para comprobar los datos de la caché L1 en la L2', 0, 102),
(382, 'Ninguna es correcta', 0, 102),
(383, 'Write-back con 3 estados', 1, 103),
(384, 'Write-Through con 3 estados', 0, 103),
(385, 'Write-back con 2 estados', 0, 103),
(386, 'Write-Through con 2 estados', 0, 103),
(387, 'Mantiene el orden local de las instrucciones y el orden global corresponde a un determinado entrelazado', 1, 104),
(388, 'No mantiene el orden de las instrucciones locales pero si las globales', 0, 104),
(389, 'Mantiene el orden local de las instrucciones pero desordena las instrucciones de acceso a memoria', 0, 104),
(390, 'Ninguna de las anteriores', 0, 104),
(391, 'Inválido, compartido, modificado y exclusivo', 1, 105),
(392, 'Inválido, difundido y modificado', 0, 105),
(393, 'Inválido, compartido, actualizado y modificado', 0, 105),
(394, 'Ninguna es correcta', 0, 105),
(395, 'Las acciones no atómicas introducen la posibilidad de que un protocolo pueda interrumpirse', 1, 106),
(396, 'El protoclo write-invalidate es una solución eficiente para sistemas con un gran número de procesadores', 0, 106),
(397, 'El protocolo de invalidación fuerza las escrituras en paralelo', 0, 106),
(398, 'Todas las anteriores son correctas', 0, 106),
(399, 'Acceso simultáneo del procesador y bus, operaciones solapadas de diferentes procesadores en el mismo bloque y en peticiones BR la memoria principal es muy lenta y la caché implica complejidad', 1, 107),
(400, 'Problemas de acceso a directorios debido a la duplicidad, operaciones solapadas de diferentes procesadores en el mismo bloque y operaciones no atómicas', 0, 107),
(401, 'Acceso simultáneo del procesador y bus, operaciones no atómicas y solapadas', 0, 107),
(402, 'Ninguna de las anteriores', 0, 107),
(403, 'El proceso en CPU es desalojado si llega a la cola un proceso con duración más corta', 1, 108),
(404, 'Planificación de servicio por orden de llegada', 0, 108),
(405, 'A cada proceso se le asigna un quantum de tiempo máximo de forma secuencial', 0, 108),
(406, 'Seleccionará el proceso que requiera menor tiempo de ejecución, sin expropiación', 0, 108),
(407, 'Todas las anteriores son correctas', 1, 109),
(408, 'Las operaciones de cada procesador aparecen en el orden indicado por el programa', 0, 109),
(409, 'El producto de cualquier ejecución es el mismo que en un procesador secuencial', 0, 109),
(410, 'Cuando se cumple a atomicidad', 0, 109),
(411, 'La coordinación de procesos que se ejecutan simultáneamente para completar una tarea', 1, 110),
(412, 'Tecnica por la que un proceso se adelanta a otro', 0, 110),
(413, 'Metodo que coordina en la red las horas de las CPU', 0, 110),
(414, 'Metodo con el que se consigue una distribución adecuada de los datos en memoria', 0, 110),
(419, '3', 1, 112),
(420, '2', 0, 112),
(421, '4', 0, 112),
(422, '5', 0, 112),
(423, 'Exclusión mutua', 1, 113),
(424, 'Snoopy', 0, 113),
(425, 'Consistencia secuencial', 0, 113),
(426, 'Instrucciones atomicas', 0, 113),
(427, 'Todas las anteriores son correctas', 1, 114),
(428, 'Un flag', 0, 114),
(429, 'Un cerrojo', 0, 114),
(430, 'Un contador', 0, 114),
(431, 'Total Store Ordering', 1, 115),
(432, 'Write-fence', 0, 115),
(433, 'Read-fence', 0, 115),
(434, 'Memory-fence', 0, 115),
(435, 'Duplicar el directorio de la caché', 1, 116),
(436, 'Reducir el reloj del sistema', 0, 116),
(437, 'Pasar los datos a una memoria temporal', 0, 116),
(438, 'Escribir directamente en memoria principal', 0, 116),
(439, 'Write-Back', 1, 117),
(440, 'Write-Miss', 0, 117),
(441, 'Read-Miss', 0, 117),
(442, 'Read-Back', 0, 117),
(443, 'Hardware', 1, 118),
(444, 'Software', 0, 118),
(445, 'Ambas', 0, 118),
(446, 'Ninguna', 0, 118),
(447, 'Todas son correctas', 1, 119),
(448, 'Un flag', 0, 119),
(449, 'Un contador', 0, 119),
(450, 'Un cerrojo', 0, 119),
(451, 'Los resultados han de ser los mismo que si se ejecuta en un solo procesador', 1, 120),
(452, 'No hace falta controlar las dependencias de las variables compartidas', 0, 120),
(453, 'Asegura el correcto cambio de una variable y su correcta propagación', 0, 120),
(454, 'Ninguna de las anteriores', 0, 120),
(455, 'Se introduce un estado E(Exclusive) que garantiza solo una copia del bloque', 1, 121),
(456, 'Se introduce un estado E(Existence) que garantiza que el dato existe', 0, 121),
(457, 'Se introduce un estado E(Exclusive) aunque este estado que ha de introducirse para poder cumplir con el protocolo hace que éste sea más ineficiente', 0, 121),
(458, 'Todas las anteriores son incorrectas', 0, 121),
(459, 'Se invalidan todas las copias distribuidas', 1, 122),
(460, 'Si está en estado inválido el bloque de caché entero queda inutilizable', 0, 122),
(461, 'Todas las anteriores son correctas', 0, 122),
(462, 'Ninguna de las anteriores es correcta', 0, 122),
(463, 'Invalidar todas las copias o Actualizar todas las copias', 1, 123),
(464, 'Eliminar las copias y enviar una señal de error', 0, 123),
(465, 'Invalidar o actualizar las copias aunque no dependerá de la política de escritura (WT/WB)', 0, 123),
(466, 'Ninguna de las anteriores es correcta', 0, 123),
(467, 'Que los resultados han de ser los mismos si se ejecuta en un solo procesador', 1, 124),
(468, 'Que los resultados pueden no ser los mismos si se ejecuta en un solo procesador', 0, 124),
(469, 'Que los resultados han de ser los mismos si se ejecuta en varios procesadores', 0, 124),
(470, 'Ninguna de las anteriores son correctas', 0, 124),
(471, 'La actualización del valor de una variable compartida/global', 1, 125),
(472, 'Un punto señalado en el tiempo', 0, 125),
(473, 'La actualización del valor de una varibale local', 0, 125),
(474, 'Todas son correctas', 0, 125),
(475, 'Un punto señalado en el código donde todos los hilos se sincronizan', 1, 126),
(476, 'Un punto señalado en el tiempo donde todos los hilos se sincronizan', 0, 126),
(477, 'Un punto en el cual una variable tendrá que levantar una barrera para que pase el hilo que llegue primero', 0, 126),
(478, 'Una estructura decontrol para controlar el último hilo que se ejecuta', 0, 126),
(479, 'Acceso simultáneo del procesador y del bus, que proboca operaciones solapadas de diferentes procesadores en la memoria', 1, 127),
(480, 'Todas son correctas', 0, 127),
(481, 'Problemas de acceso a directorios debido a la duplicidad', 0, 127),
(482, 'Acceso simultáneo del procesador y del bus, operaciones no aritméticas y solapamiento de operaciones', 0, 127),
(483, 'Instruciones RMW', 1, 128),
(484, 'Semáforo', 0, 128),
(485, 'Monitor', 0, 128),
(486, 'Ninguna de las anteriores', 0, 128),
(487, 'Leslie Lamport', 1, 129),
(488, 'Dijkstra', 0, 129),
(489, 'Einstein', 0, 129),
(490, 'Murray A. Eisenberg y Michael R. McGuire', 0, 129),
(491, 'Todos son protocolos de invalidacion', 1, 130),
(492, 'MSI', 0, 130),
(493, 'MESI', 0, 130),
(494, 'MOSI', 0, 130),
(495, 'Load Conditional', 1, 131),
(496, 'Test and Test and Set', 0, 131),
(497, 'Store Conditional', 0, 131),
(498, 'Linked Load', 0, 131),
(499, 'Instrucciones RWM', 1, 132),
(500, 'Cerrojo', 0, 132),
(501, 'Monitor', 0, 132),
(502, 'Semaforo', 0, 132),
(503, 'Al estado en el cual dos o mas procesos o tareas esperan para acceder a la seccion critica, pero nunca se libera la exclusion mutua, dejandolos en una espera infinita', 1, 133),
(504, 'Al estado en el cual a un proceso que desea acceder a una seccion critica libre se le impide realizar esta accion', 0, 133),
(505, 'Ninguna de las anteriores es correcta', 0, 133),
(506, 'Todas las anteriores son correctas', 0, 133),
(507, 'Todas son correctas', 1, 134),
(508, 'El producto de cual ejecucion es el mismo que si las operaciones se realizaran en un procesador secuencial', 0, 134),
(509, 'Las operaciones de cada procesador aparecen en el orden indicado por el programa', 0, 134),
(510, 'Todas son incorrectas', 0, 134),
(511, 'ROT5', 1, 135),
(512, 'ROT3', 0, 135),
(513, 'ROT11', 0, 135),
(514, 'ROT1', 0, 135),
(515, 'AVKHF AOL JSHZZ PZ PU LUNSPZO', 1, 136),
(516, 'ZUJGE ZNK IRGYY OY OT KTMROYN', 0, 136),
(517, 'HCROM HVS QZOGG WG WB SBUZWGV', 0, 136),
(518, 'ZUJGE ZNK IRGYY WG WB SBUZWGV', 0, 136),
(519, 'Inverse transposition', 1, 137),
(520, 'ROT11', 0, 137),
(521, 'Shift-1 transposition', 0, 137),
(522, 'Caesar Cypher', 0, 137),
(523, 'FRQILGHQWLDOLWB DQG LQWHJULWB', 1, 138),
(524, 'IUTLOJKTZOGROZE GTJ OTZKMXOZE', 0, 138),
(525, 'HTSKNIJSYNFQNYD FSI NSYJLWNYD', 0, 138),
(526, 'IUTLOJKTZOGROZE GTI NSYJLWNYD', 0, 138);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(255) NOT NULL,
  `clave` varchar(9) CHARACTER SET latin1 NOT NULL,
  `realizacion` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `clave`, `realizacion`) VALUES
(1, 'u12345678', 0),
(2, 'u87654321', 0),
(5, 'u45382150', 0),
(6, 'u31323003', 0),
(7, 'u31323002', 0),
(8, 'u34529800', 0),
(9, 'u96787321', 0),
(10, 'u23456789', 0),
(11, 'u31313467', 0),
(12, 'u52418759', 0),
(33, 'u35477261', 0),
(47, 'u45327750', 0),
(85, 'u99765432', 0),
(88, 'u34009921', 0),
(89, 'u35772354', 0),
(96, 'u25853572', 0),
(105, 'u45386559', 0),
(126, 'u45328811', 0),
(127, 'u45369912', 0),
(128, 'u45399103', 0),
(129, 'u34598702', 0),
(131, 'u31247211', 0),
(141, 'uxxxxxxxx', 0),
(143, 'u49190920', 0),
(147, 'u76444759', 0),
(166, 'u11111111', 0),
(167, 'u32078296', 0),
(169, 'u32056796', 0),
(191, 'u75772171', 0),
(224, 'u49078042', 0),
(226, 'u32085090', 0),
(227, 'u77398052', 0),
(228, 'u76650558', 0),
(229, 'u45386132', 0),
(230, 'u77177620', 0),
(233, 'u44060185', 0),
(234, 'u49560472', 0),
(236, 'u77176928', 0),
(243, 'u63816273', 0),
(244, 'u77175260', 0),
(245, 'u49565825', 0),
(248, 'u77174528', 0),
(249, 'u00000000', 0),
(250, 'u20072463', 0),
(254, 'u32073563', 0),
(257, 'u45327753', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asociacatprof`
--
ALTER TABLE `asociacatprof`
  ADD UNIQUE KEY `indx_ids` (`prof_id`,`cat_id`),
  ADD KEY `fk_cat_asocia_id` (`cat_id`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `repaso`
--
ALTER TABLE `repaso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`,`tematica`,`pregunta_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT de la tabla `repaso`
--
ALTER TABLE `repaso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=608;
--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asociacatprof`
--
ALTER TABLE `asociacatprof`
  ADD CONSTRAINT `fk_cat_asocia_id` FOREIGN KEY (`cat_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prof_asocia_id` FOREIGN KEY (`prof_id`) REFERENCES `acceso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `categoria_id_fk` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `pregunta_id_fk` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
