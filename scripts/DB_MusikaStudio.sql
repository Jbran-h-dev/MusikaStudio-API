CREATE DATABASE  IF NOT EXISTS `musikastudio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musikastudio`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: musikastudio
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_log`
--

DROP TABLE IF EXISTS `auditoria_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_tabla` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_registro_afectado` int NOT NULL,
  `tipo_operacion` enum('I','U','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_modificador` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalles_cambio` json DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_nombre_tabla` (`nombre_tabla`),
  KEY `idx_fecha_modificacion` (`fecha_modificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_log`
--

LOCK TABLES `auditoria_log` WRITE;
/*!40000 ALTER TABLE `auditoria_log` DISABLE KEYS */;
INSERT INTO `auditoria_log` VALUES (1,'usuarios',1,'I','system','{\"email\": \"admin@musikastudio.local\", \"nombre\": \"Admin\", \"apellido\": \"Root\", \"username\": \"admin\"}','2025-08-24 00:57:58'),(2,'usuarios',2,'I','system','{\"email\": \"cliente1@musikastudio.local\", \"nombre\": \"Cliente\", \"apellido\": \"Demo\", \"username\": \"cliente1\"}','2025-08-24 01:12:46'),(3,'usuarios',3,'I','manual-script','{\"email\": \"admin_manual@musikastudio.local\", \"nombre\": \"Admin\", \"apellido\": \"Manual\", \"username\": \"admin_manual\"}','2025-08-24 01:31:14'),(4,'usuarios',3,'U','manual-script','{\"campos_nuevos\": {\"email\": \"admin_manual@musikastudio.local\", \"activo\": 1, \"nombre\": \"Admin\", \"apellido\": \"Manual\", \"username\": \"admin_manual\"}, \"campos_anteriores\": {\"email\": \"admin_manual@musikastudio.local\", \"activo\": 1, \"nombre\": \"Admin\", \"apellido\": \"Manual\", \"username\": \"admin_manual\"}}','2025-08-24 01:33:10'),(5,'usuarios',5,'I','system','{\"email\": \"jose@musikastudio.local\", \"nombre\": \"Cliente\", \"apellido\": \"Demo\", \"username\": \"{{Jose}}\"}','2025-08-24 01:48:11'),(6,'usuarios',6,'I','system','{\"email\": \"samuel@musikastudio.local\", \"nombre\": \"Cliente\", \"apellido\": \"Laura\", \"username\": \"Samuel\"}','2025-08-24 01:54:35'),(7,'usuarios',1,'U','system','{\"campos_nuevos\": {\"email\": \"admin@musikastudio.local\", \"activo\": 1, \"nombre\": \"Admin\", \"apellido\": \"Root\", \"username\": \"admin\"}, \"campos_anteriores\": {\"email\": \"admin@musikastudio.local\", \"activo\": 1, \"nombre\": \"Admin\", \"apellido\": \"Root\", \"username\": \"admin\"}}','2025-08-24 02:03:29'),(8,'usuarios',7,'I','sydtem','{\"email\": \"tester@gmail.com\", \"nombre\": \"Simon\", \"apellido\": \"Salome\", \"username\": \"tester\"}','2025-08-24 02:14:54'),(9,'usuarios',7,'U','system','{\"campos_nuevos\": {\"email\": \"tester@gmail.com\", \"activo\": 1, \"nombre\": \"Simon\", \"apellido\": \"Salome\", \"username\": \"admin\"}, \"campos_anteriores\": {\"email\": \"tester@gmail.com\", \"activo\": 1, \"nombre\": \"Simon\", \"apellido\": \"Salome\", \"username\": \"tester\"}}','2025-08-24 02:21:53'),(10,'usuarios',8,'I','system','{\"email\": \"admin@gmail.com\", \"nombre\": \"Raul\", \"apellido\": \"Taylor\", \"username\": \"administrador\"}','2025-08-24 02:37:21'),(11,'instrumentos',1,'I','admin','{\"codigo\": \"001\", \"nombre\": \"guitarra\", \"precio\": 200.00}','2025-08-24 03:53:36'),(12,'instrumentos',3,'I','admin','{\"codigo\": \"INS-007\", \"nombre\": \"Guitarra electrica\", \"precio\": 899.99}','2025-08-24 04:24:29'),(13,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"001\", \"nombre\": \"guitarra\", \"precio\": 200.00}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"001\", \"nombre\": \"guitarra\", \"precio\": 200.00}}','2025-08-24 04:25:26'),(14,'instrumentos',3,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-007\", \"nombre\": \"Guitarra electrica\", \"precio\": 899.99}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"INS-007\", \"nombre\": \"Guitarra electrica\", \"precio\": 899.99}}','2025-08-24 04:26:39'),(15,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 949.99}, \"campos_anteriores\": {\"activo\": 0, \"codigo\": \"001\", \"nombre\": \"guitarra\", \"precio\": 200.00}}','2025-08-24 04:28:30'),(16,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 949.99}}','2025-08-24 17:42:21'),(17,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 17:48:24'),(18,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 17:51:11'),(19,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 18:09:34'),(20,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 18:10:02'),(21,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 18:10:10'),(22,'instrumentos',1,'U','admin','{\"campos_nuevos\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra Acústica Pro\", \"precio\": 549.99}}','2025-08-24 18:10:44'),(23,'instrumentos',9,'I','admin','{\"codigo\": \"INS-009\", \"nombre\": \"Guitarra Acústica\", \"precio\": 499.99}','2025-08-24 18:11:28'),(24,'instrumentos',1,'U','Samuel','{\"campos_nuevos\": {\"activo\": 0, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra\", \"precio\": 549.99}, \"campos_anteriores\": {\"activo\": 1, \"codigo\": \"INS-001\", \"nombre\": \"Guitarra\", \"precio\": 549.99}}','2025-08-24 18:22:03'),(25,'instrumentos',10,'I','admin','{\"codigo\": \"INS-033\", \"nombre\": \"Tompeta\", \"precio\": 499.99}','2025-08-24 18:45:30');
/*!40000 ALTER TABLE `auditoria_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Guitarras y Bajos','Actualizada',0,'2025-08-24 00:57:58','system','2025-08-24 18:21:37','Samuel'),(2,'TECLADOS','Instrumentos de teclado',0,'2025-08-24 00:57:58','system','2025-08-24 17:51:27','admin'),(3,'TAMBOR','tambor',0,'2025-08-24 00:57:58','system','2025-08-24 17:52:05','admin'),(4,'Bajo','Instrumentos de cuerda pulsada',0,'2025-08-24 04:39:34','admin','2025-08-24 04:41:07','admin'),(6,'VIOLIN','Instrumentos de cuerda pulsada',1,'2025-08-24 04:46:38','admin','2025-08-24 04:46:38','admin'),(7,'Guitarras','Instrumentos de cuerda pulsada',1,'2025-08-24 17:57:18','admin','2025-08-24 17:57:18','admin'),(8,'y Bajos','Actualizada',1,'2025-08-24 18:11:45','admin','2025-08-24 18:12:15','admin'),(9,'Trompetas','Instrumentos de cuerda pulsada',1,'2025-08-24 18:46:11','admin','2025-08-24 18:46:11','admin');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_instrumento` int NOT NULL,
  `id_venta` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_instrumento` (`id_instrumento`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `detalles_ventas_ibfk_1` FOREIGN KEY (`id_instrumento`) REFERENCES `instrumentos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalles_ventas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ventas`
--

LOCK TABLES `detalles_ventas` WRITE;
/*!40000 ALTER TABLE `detalles_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumentos`
--

DROP TABLE IF EXISTS `instrumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrumentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `stock_minimo` int NOT NULL DEFAULT '0',
  `url_imagen` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_ingreso` date NOT NULL DEFAULT (curdate()),
  `id_categoria` int NOT NULL,
  `id_marca` int NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_instrumentos_codigo` (`codigo`),
  KEY `idx_instrumentos_nombre` (`nombre`),
  KEY `idx_instrumentos_precio` (`precio`),
  KEY `idx_instrumentos_categoria` (`id_categoria`),
  KEY `idx_instrumentos_marca` (`id_marca`),
  CONSTRAINT `instrumentos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `instrumentos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumentos`
--

LOCK TABLES `instrumentos` WRITE;
/*!40000 ALTER TABLE `instrumentos` DISABLE KEYS */;
INSERT INTO `instrumentos` VALUES (1,'INS-001','Guitarra','Actualizada',549.99,8,2,'https://example.com/img2.jpg',0,'2025-08-23',1,1,'2025-08-23 05:00:00','admin','2025-08-24 18:22:03','Samuel'),(3,'INS-007','Guitarra electrica','Cuerpo de caoba',899.99,10,2,'https://example.com/img.jpg',0,'2025-08-23',1,1,'2025-08-24 04:24:29','admin','2025-08-24 04:26:39','admin'),(9,'INS-009','Guitarra Acústica','Cuerpo de caoba',499.99,10,2,'https://example.com/img.jpg',1,'2025-08-24',1,1,'2025-08-24 18:11:28','admin','2025-08-24 18:11:28','admin'),(10,'INS-033','Tompeta','Cuerpo de caoba',499.99,10,2,'https://example.com/img.jpg',1,'2025-08-24',1,1,'2025-08-24 18:45:30','admin','2025-08-24 18:45:30','admin');
/*!40000 ALTER TABLE `instrumentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_instrumentos_insert` AFTER INSERT ON `instrumentos` FOR EACH ROW BEGIN
  INSERT INTO auditoria_log (
    nombre_tabla, id_registro_afectado, tipo_operacion, usuario_modificador, detalles_cambio
  ) VALUES (
    'instrumentos', NEW.id, 'I', NEW.usuario_creacion,
    JSON_OBJECT('codigo', NEW.codigo, 'nombre', NEW.nombre, 'precio', NEW.precio)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_instrumentos_update` AFTER UPDATE ON `instrumentos` FOR EACH ROW BEGIN
  INSERT INTO auditoria_log (
    nombre_tabla, id_registro_afectado, tipo_operacion, usuario_modificador, detalles_cambio
  ) VALUES (
    'instrumentos', NEW.id, 'U', NEW.usuario_actualizacion,
    JSON_OBJECT(
      'campos_anteriores', JSON_OBJECT('codigo', OLD.codigo, 'nombre', OLD.nombre, 'precio', OLD.precio, 'activo', OLD.activo),
      'campos_nuevos', JSON_OBJECT('codigo', NEW.codigo, 'nombre', NEW.nombre, 'precio', NEW.precio, 'activo', NEW.activo)
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'YAMAHA','Fabricante japonés de instrumentos musicales',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system'),(2,'FENDER','Fabricante estadounidense de guitarras',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'EFECTIVO','Pago en efectivo',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system'),(2,'TARJETA','Pago con tarjeta',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN','Administrador con todos los permisos',1,'2025-08-24 00:57:58','system','2025-08-24 01:31:14','manual-script'),(2,'VENDEDOR','Ventas y gestión sin administración de usuarios',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system'),(3,'CLIENTE','Cliente con permisos de lectura y sus compras',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` VALUES (1,'DNI','Documento Nacional de Identidad',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system'),(2,'PASAPORTE','Documento de identidad internacional',1,'2025-08-24 00:57:58','system','2025-08-24 00:57:58','system');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario_rol` (`usuario_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_roles`
--

LOCK TABLES `usuario_roles` WRITE;
/*!40000 ALTER TABLE `usuario_roles` DISABLE KEYS */;
INSERT INTO `usuario_roles` VALUES (2,2,3,1,'2025-08-24 01:12:46','system','2025-08-24 01:12:46','system'),(3,3,1,1,'2025-08-24 01:33:10','manual-script','2025-08-24 01:33:10','manual-script'),(4,5,3,1,'2025-08-24 01:48:11','system','2025-08-24 01:48:11','system'),(5,6,3,1,'2025-08-24 01:54:35','system','2025-08-24 01:54:35','system'),(7,7,1,1,'2025-08-24 02:35:15','manual-fix','2025-08-24 02:35:15','manual-fix'),(8,8,1,1,'2025-08-24 02:37:21','system','2025-08-24 02:37:21','system');
/*!40000 ALTER TABLE `usuario_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL DEFAULT (curdate()),
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `id_tipo_documento` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  KEY `role_id` (`role_id`),
  KEY `idx_usuarios_username` (`username`),
  KEY `idx_usuarios_email` (`email`),
  KEY `idx_usuarios_documento` (`numero_documento`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'cliente1','cliente1@musikastudio.local','$2a$10$OZA8PJismmQJYfa3trOc7u.9cquIUKa5VjUgyyPZf2C87gxfCw5gG','Cliente','Demo',NULL,NULL,NULL,'2025-08-23',NULL,1,NULL,3,'2025-08-24 01:12:46','system','2025-08-24 01:12:46','system'),(3,'admin_manual','admin_manual@musikastudio.local','$2a$10$0CGuV4gqsOP3dpVqIhnVmev7z3b0xv1kQxJ4G2O1rXcG6w8rJxE8S','Admin','Manual',NULL,NULL,NULL,'2025-08-23',NULL,1,NULL,1,'2025-08-24 01:31:14','manual-script','2025-08-24 01:33:10','manual-script'),(5,'{{Jose}}','jose@musikastudio.local','$2a$10$NaWa2j5DF4T.04Rqz5iU3OYlnLAUr7rR597TWmk2cEJSDCkhwlYOa','Cliente','Demo',NULL,NULL,NULL,'2025-08-23',NULL,1,NULL,3,'2025-08-24 01:48:11','system','2025-08-24 01:48:11','system'),(6,'Samuel','samuel@musikastudio.local','$2a$10$cQm00xkjwXK7Fcl2Xf0d0ueliegxiE.CjYARm9TDss/KMEX2I8tua','Cliente','Laura',NULL,NULL,NULL,'2025-08-23',NULL,1,NULL,3,'2025-08-24 01:54:35','system','2025-08-24 01:54:35','system'),(7,'admin','tester@gmail.com','$2a$10$TcvMr/Os7xfnQQhBsVUjbOY5uOraOhozQPtscezbCKKL4Zu.Wsevq','Simon','Salome','945673233','arq','234567','2025-08-23',NULL,1,NULL,1,'2025-08-24 01:50:35','sydtem','2025-08-24 02:21:53','system'),(8,'administrador','admin@gmail.com','$2a$10$Vfd8eI9DolB5Mez4wWWiJebgHNSjug5qrJM4jIlP4oQzXPoX9cBou','Raul','Taylor','999999999','HQ','00000002','2025-08-23',NULL,1,1,1,'2025-08-24 02:37:21','system','2025-08-24 02:37:21','system');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuarios_insert` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
  INSERT INTO auditoria_log (
    nombre_tabla, id_registro_afectado, tipo_operacion, usuario_modificador, detalles_cambio
  ) VALUES (
    'usuarios', NEW.id, 'I', NEW.usuario_creacion,
    JSON_OBJECT('username', NEW.username, 'email', NEW.email, 'nombre', NEW.nombre, 'apellido', NEW.apellido)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuarios_update` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
  INSERT INTO auditoria_log (
    nombre_tabla, id_registro_afectado, tipo_operacion, usuario_modificador, detalles_cambio
  ) VALUES (
    'usuarios', NEW.id, 'U', NEW.usuario_actualizacion,
    JSON_OBJECT(
      'campos_anteriores', JSON_OBJECT('username', OLD.username, 'email', OLD.email, 'nombre', OLD.nombre, 'apellido', OLD.apellido, 'activo', OLD.activo),
      'campos_nuevos', JSON_OBJECT('username', NEW.username, 'email', NEW.email, 'nombre', NEW.nombre, 'apellido', NEW.apellido, 'activo', NEW.activo)
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `fecha_venta` date NOT NULL DEFAULT (curdate()),
  `precio_total` decimal(10,2) NOT NULL,
  `impuesto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `confirmada` tinyint(1) DEFAULT '0',
  `numero_factura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_actualizacion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  KEY `idx_ventas_fecha` (`fecha_venta`),
  KEY `idx_ventas_usuario` (`id_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,7,1,'2025-08-24',100.00,18.00,0.00,0,NULL,'Venta demo','2025-08-24 18:13:05','admin','2025-08-24 18:13:05','admin');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'musikastudio'
--

--
-- Dumping routines for database 'musikastudio'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_instrumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_instrumento`(
  IN p_id INT,
  IN p_codigo VARCHAR(50),
  IN p_nombre VARCHAR(100),
  IN p_descripcion TEXT,
  IN p_precio DECIMAL(10,2),
  IN p_stock INT,
  IN p_stock_minimo INT,
  IN p_url_imagen VARCHAR(500),
  IN p_id_categoria INT,
  IN p_id_marca INT,
  IN p_activo BOOLEAN,
  IN p_usuario_actualizacion VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  UPDATE instrumentos SET
    codigo = p_codigo,
    nombre = p_nombre,
    descripcion = p_descripcion,
    precio = p_precio,
    stock = p_stock,
    stock_minimo = p_stock_minimo,
    url_imagen = p_url_imagen,
    id_categoria = p_id_categoria,
    id_marca = p_id_marca,
    activo = p_activo,
    usuario_actualizacion = p_usuario_actualizacion,
    fecha_actualizacion = CURRENT_TIMESTAMP
  WHERE id = p_id;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_usuario`(
  IN p_id INT,
  IN p_username VARCHAR(50),
  IN p_email VARCHAR(100),
  IN p_nombre VARCHAR(100),
  IN p_apellido VARCHAR(100),
  IN p_telefono VARCHAR(15),
  IN p_direccion VARCHAR(255),
  IN p_numero_documento VARCHAR(20),
  IN p_id_tipo_documento INT,
  IN p_activo BOOLEAN,
  IN p_usuario_actualizacion VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  UPDATE usuarios SET
    username = p_username,
    email = p_email,
    nombre = p_nombre,
    apellido = p_apellido,
    telefono = p_telefono,
    direccion = p_direccion,
    numero_documento = p_numero_documento,
    id_tipo_documento = p_id_tipo_documento,
    activo = p_activo,
    usuario_actualizacion = p_usuario_actualizacion,
    fecha_actualizacion = CURRENT_TIMESTAMP
  WHERE id = p_id;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autenticar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticar_usuario`(
  IN p_username VARCHAR(50)
)
BEGIN
  SELECT 
    id,
    username,
    email,
    password_hash,
    activo
  FROM usuarios
  WHERE username = p_username 
    AND activo = TRUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_instrumentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_instrumentos`(
  IN p_nombre VARCHAR(100),
  IN p_limite INT,
  IN p_offset INT
)
BEGIN
  SELECT 
    i.id,
    i.codigo,
    i.nombre,
    i.precio,
    i.stock,
    i.activo,
    c.nombre as categoria,
    m.nombre as marca
  FROM instrumentos i
  INNER JOIN categorias c ON i.id_categoria = c.id
  INNER JOIN marcas m ON i.id_marca = m.id
  WHERE i.nombre LIKE CONCAT('%', p_nombre, '%')
    AND i.activo = TRUE
  ORDER BY i.nombre
  LIMIT p_limite OFFSET p_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crear_instrumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_instrumento`(
  IN p_codigo VARCHAR(50),
  IN p_nombre VARCHAR(100),
  IN p_descripcion TEXT,
  IN p_precio DECIMAL(10,2),
  IN p_stock INT,
  IN p_stock_minimo INT,
  IN p_url_imagen VARCHAR(500),
  IN p_id_categoria INT,
  IN p_id_marca INT,
  IN p_usuario_creacion VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  INSERT INTO instrumentos (
    codigo, nombre, descripcion, precio, stock, 
    stock_minimo, url_imagen, id_categoria, id_marca,
    usuario_creacion, usuario_actualizacion
  ) VALUES (
    p_codigo, p_nombre, p_descripcion, p_precio, p_stock,
    p_stock_minimo, p_url_imagen, p_id_categoria, p_id_marca,
    p_usuario_creacion, p_usuario_creacion
  );

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crear_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_usuario`(
  IN p_username VARCHAR(50),
  IN p_email VARCHAR(100),
  IN p_password_hash VARCHAR(255),
  IN p_nombre VARCHAR(100),
  IN p_apellido VARCHAR(100),
  IN p_telefono VARCHAR(15),
  IN p_direccion VARCHAR(255),
  IN p_numero_documento VARCHAR(20),
  IN p_id_tipo_documento INT,
  IN p_usuario_creacion VARCHAR(50),
  IN p_role_id INT
)
BEGIN
  DECLARE v_usuario_id INT;
  DECLARE v_role_id INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  -- Resolver rol: si no envían, usar 'CLIENTE'
  IF p_role_id IS NULL THEN
    SELECT id INTO v_role_id FROM roles WHERE UPPER(nombre) = 'CLIENTE' LIMIT 1;
  ELSE
    SET v_role_id = p_role_id;
  END IF;

  INSERT INTO usuarios (
    username, email, password_hash, nombre, apellido,
    telefono, direccion, numero_documento, id_tipo_documento, role_id,
    usuario_creacion, usuario_actualizacion
  ) VALUES (
    p_username, p_email, p_password_hash, p_nombre, p_apellido,
    p_telefono, p_direccion, p_numero_documento, p_id_tipo_documento, v_role_id,
    p_usuario_creacion, p_usuario_creacion
  );

  SET v_usuario_id = LAST_INSERT_ID();

  INSERT INTO usuario_roles (usuario_id, rol_id, usuario_creacion, usuario_actualizacion)
  VALUES (v_usuario_id, v_role_id, p_usuario_creacion, p_usuario_creacion)
  ON DUPLICATE KEY UPDATE activo = TRUE, usuario_actualizacion = VALUES(usuario_actualizacion), fecha_actualizacion = CURRENT_TIMESTAMP;

  COMMIT;

  SELECT v_usuario_id as id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_index_if_not_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_index_if_not_exists`(
  IN p_schema VARCHAR(64),
  IN p_table VARCHAR(64),
  IN p_index VARCHAR(64),
  IN p_ddl TEXT
)
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.statistics
    WHERE table_schema = p_schema AND table_name = p_table AND index_name = p_index
  ) THEN
    SET @sql = p_ddl;
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_instrumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_instrumento`(
  IN p_id INT,
  IN p_usuario_actualizacion VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  UPDATE instrumentos SET 
    activo = FALSE,
    usuario_actualizacion = p_usuario_actualizacion,
    fecha_actualizacion = CURRENT_TIMESTAMP
  WHERE id = p_id;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_usuario`(
  IN p_id INT,
  IN p_usuario_actualizacion VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  UPDATE usuarios SET 
    activo = FALSE,
    usuario_actualizacion = p_usuario_actualizacion,
    fecha_actualizacion = CURRENT_TIMESTAMP
  WHERE id = p_id;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_categorias`()
BEGIN
  SELECT
    id,
    nombre,
    descripcion,
    activo
  FROM categorias
  WHERE activo = TRUE
  ORDER BY nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_instrumentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_instrumentos`(
  IN p_limite INT,
  IN p_offset INT
)
BEGIN
  SELECT 
    i.id,
    i.codigo,
    i.nombre,
    i.precio,
    i.stock,
    i.activo,
    c.nombre as categoria,
    m.nombre as marca
  FROM instrumentos i
  INNER JOIN categorias c ON i.id_categoria = c.id
  INNER JOIN marcas m ON i.id_marca = m.id
  ORDER BY i.fecha_creacion DESC
  LIMIT p_limite OFFSET p_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_usuarios`(
  IN p_limite INT,
  IN p_offset INT
)
BEGIN
  SELECT 
    u.id,
    u.username,
    u.email,
    u.nombre,
    u.apellido,
    u.fecha_registro,
    u.activo,
    GROUP_CONCAT(r.nombre) as roles
  FROM usuarios u
  LEFT JOIN usuario_roles ur ON u.id = ur.usuario_id AND ur.activo = TRUE
  LEFT JOIN roles r ON ur.rol_id = r.id AND r.activo = TRUE
  GROUP BY u.id
  ORDER BY u.fecha_creacion DESC
  LIMIT p_limite OFFSET p_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_categoria`(
  IN p_id INT
)
BEGIN
  SELECT
    id,
    nombre,
    descripcion,
    activo
  FROM categorias
  WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_instrumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_instrumento`(
  IN p_id INT
)
BEGIN
  SELECT 
    i.id,
    i.codigo,
    i.nombre,
    i.descripcion,
    i.precio,
    i.stock,
    i.stock_minimo,
    i.url_imagen,
    i.activo,
    c.nombre as categoria,
    m.nombre as marca
  FROM instrumentos i
  INNER JOIN categorias c ON i.id_categoria = c.id
  INNER JOIN marcas m ON i.id_marca = m.id
  WHERE i.id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_usuario`(
  IN p_id INT
)
BEGIN
  SELECT 
    u.id,
    u.username,
    u.email,
    u.nombre,
    u.apellido,
    u.telefono,
    u.direccion,
    u.numero_documento,
    u.fecha_registro,
    u.activo,
    td.nombre as tipo_documento,
    GROUP_CONCAT(r.nombre) as roles
  FROM usuarios u
  LEFT JOIN tipos_documentos td ON u.id_tipo_documento = td.id
  LEFT JOIN usuario_roles ur ON u.id = ur.usuario_id AND ur.activo = TRUE
  LEFT JOIN roles r ON ur.rol_id = r.id AND r.activo = TRUE
  WHERE u.id = p_id
  GROUP BY u.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-24 14:44:04
