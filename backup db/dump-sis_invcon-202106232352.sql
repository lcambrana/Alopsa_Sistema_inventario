-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: sis_invcon
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `altura_predio`
--

DROP TABLE IF EXISTS `altura_predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `altura_predio` (
  `id_altura` int(11) NOT NULL AUTO_INCREMENT,
  `altura` int(11) DEFAULT NULL,
  `id_fila` int(11) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `id_ingresoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_altura`),
  KEY `altura_predio_FK` (`id_fila`),
  CONSTRAINT `altura_predio_FK` FOREIGN KEY (`id_fila`) REFERENCES `fila` (`idfila`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2730;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `altura_predio`
--

LOCK TABLES `altura_predio` WRITE;
/*!40000 ALTER TABLE `altura_predio` DISABLE KEYS */;
INSERT INTO `altura_predio` VALUES (1,1,1,'Asignado',3),(2,2,1,'Asignado',6),(3,3,1,'Sin Asignar',0),(4,4,1,'Sin Asignar',0),(5,5,1,'Sin Asignar',0),(6,6,1,'sin Asignar',0),(7,1,2,'sin Asignar',0);
/*!40000 ALTER TABLE `altura_predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_patio`
--

DROP TABLE IF EXISTS `areas_patio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas_patio` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `area` char(5) DEFAULT NULL,
  `id_patio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_area`),
  KEY `areas_patio_FK` (`id_patio`),
  CONSTRAINT `areas_patio_FK` FOREIGN KEY (`id_patio`) REFERENCES `patios` (`id_patio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_patio`
--

LOCK TABLES `areas_patio` WRITE;
/*!40000 ALTER TABLE `areas_patio` DISABLE KEYS */;
INSERT INTO `areas_patio` VALUES (1,'A',1),(2,'B',1);
/*!40000 ALTER TABLE `areas_patio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaciones` (
  `Id_a` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(255) DEFAULT NULL,
  `bloque` int(11) DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_a`,`id`,`Id_f`,`id_usuario`),
  KEY `ingreso_m_asignaciones` (`id`,`Id_f`,`id_usuario`),
  CONSTRAINT `ingreso_m_asignaciones` FOREIGN KEY (`id`, `Id_f`, `id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=32768;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciones`
--

LOCK TABLES `asignaciones` WRITE;
/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
INSERT INTO `asignaciones` VALUES (1,'prueba actualizada',2,4,3,3,1);
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(20) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `tabla` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bitacora_id_IDX` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=244;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,'Ingreso','2021-05-31','22:55:11','Administrador','Inicio de Sesion-Ingreso al sistema',''),(2,'Ingreso','2021-05-31','22:57:34','Administrador','Inicio de Sesion-Ingreso al sistema',''),(3,'Ingreso','2021-05-31','23:01:12','Administrador','Inicio de Sesion-Ingreso al sistema',''),(4,'Salida','2021-05-31','23:05:14','Administrador','Finalizacion de session',''),(5,'Ingreso','2021-05-31','23:05:18','Administrador','Inicio de Sesion-Ingreso al sistema',''),(6,'Ingreso','2021-05-31','23:06:21','Administrador','Inicio de Sesion-Ingreso al sistema',''),(7,'Salida','2021-05-31','23:06:26','Administrador','Finalizacion de session',''),(8,'Ingreso','2021-05-31','23:06:30','Administrador','Inicio de Sesion-Ingreso al sistema',''),(9,'Salida','2021-05-31','23:10:35','Administrador','Finalizacion de session',''),(10,'Ingreso','2021-05-31','23:10:40','Administrador','Inicio de Sesion-Ingreso al sistema',''),(11,'Ingreso','2021-05-31','23:11:10','Administrador','Inicio de Sesion-Ingreso al sistema',''),(12,'Ingreso','2021-05-31','23:13:27','Administrador','Inicio de Sesion-Ingreso al sistema',''),(13,'Salida','2021-05-31','23:14:49','Administrador','Finalizacion de session',''),(14,'Ingreso','2021-05-31','23:15:00','Administrador','Inicio de Sesion-Ingreso al sistema',''),(15,'Salida','2021-05-31','23:36:45','Administrador','Finalizacion de session',''),(16,'Ingreso','2021-05-31','23:36:51','Administrador','Inicio de Sesion-Ingreso al sistema',''),(17,'Ingreso','2021-05-31','23:37:17','Administrador','Inicio de Sesion-Ingreso al sistema',''),(18,'Ingreso','2021-05-31','23:38:22','Administrador','Inicio de Sesion-Ingreso al sistema',''),(19,'Ingreso','2021-05-31','23:45:55','Administrador','Inicio de Sesion-Ingreso al sistema',''),(20,'Ingreso','2021-05-31','23:48:50','Administrador','Inicio de Sesion-Ingreso al sistema',''),(21,'Ingreso','2021-05-31','23:50:10','Administrador','Inicio de Sesion-Ingreso al sistema',''),(22,'Ingreso','2021-05-31','23:54:33','Administrador','Inicio de Sesion-Ingreso al sistema',''),(23,'Ingreso','2021-05-31','23:56:37','Administrador','Inicio de Sesion-Ingreso al sistema',''),(24,'Salida','2021-05-31','23:57:57','Administrador','Finalizacion de session',''),(25,'Ingreso','2021-05-31','23:58:39','Administrador','Inicio de Sesion-Ingreso al sistema',''),(26,'Ingreso','2021-06-01','00:00:40','Administrador','Inicio de Sesion-Ingreso al sistema',''),(27,'Ingreso','2021-06-01','00:02:03','Administrador','Inicio de Sesion-Ingreso al sistema',''),(28,'Ingreso','2021-06-01','00:06:25','Administrador','Inicio de Sesion-Ingreso al sistema',''),(29,'Salida','2021-06-01','00:06:37','Administrador','Finalizacion de session',''),(30,'Ingreso','2021-06-01','00:06:42','Administrador','Inicio de Sesion-Ingreso al sistema',''),(31,'Salida','2021-06-01','00:26:44','Administrador','Finalizacion de session',''),(32,'Ingreso','2021-06-01','00:26:50','Administrador','Inicio de Sesion-Ingreso al sistema',''),(33,'Salida','2021-06-01','00:47:29','Administrador','Finalizacion de session',''),(34,'Ingreso','2021-06-01','00:47:33','Administrador','Inicio de Sesion-Ingreso al sistema',''),(35,'Ingreso','2021-06-01','18:03:41','Administrador','Inicio de Sesion-Ingreso al sistema',''),(36,'Salida','2021-06-01','23:05:02','Administrador','Finalizacion de session',''),(37,'Ingreso','2021-06-01','23:05:07','Administrador','Inicio de Sesion-Ingreso al sistema',''),(38,'Salida','2021-06-01','23:34:30','Administrador','Finalizacion de session',''),(39,'Ingreso','2021-06-01','23:34:35','Administrador','Inicio de Sesion-Ingreso al sistema',''),(40,'Ingreso','2021-06-02','20:26:43','Administrador','Inicio de Sesion-Ingreso al sistema',''),(41,'Salida','2021-06-02','20:47:18','Administrador','Finalizacion de session',''),(42,'Ingreso','2021-06-02','20:47:26','Administrador','Inicio de Sesion-Ingreso al sistema',''),(43,'Salida','2021-06-02','21:45:33','Administrador','Finalizacion de session',''),(44,'Ingreso','2021-06-02','21:45:43','Administrador','Inicio de Sesion-Ingreso al sistema',''),(45,'Ingreso','2021-06-03','12:18:33','Administrador','Inicio de Sesion-Ingreso al sistema',''),(46,'Salida','2021-06-03','12:48:53','Administrador','Finalizacion de session',''),(47,'Ingreso','2021-06-03','12:48:58','Administrador','Inicio de Sesion-Ingreso al sistema',''),(48,'Ingreso','2021-06-03','12:49:56','Administrador','Inicio de Sesion-Ingreso al sistema',''),(49,'Salida','2021-06-03','13:12:22','Administrador','Finalizacion de session',''),(50,'Ingreso','2021-06-03','13:12:27','Administrador','Inicio de Sesion-Ingreso al sistema',''),(51,'Salida','2021-06-03','13:38:02','Administrador','Finalizacion de session',''),(52,'Ingreso','2021-06-03','13:38:10','Administrador','Inicio de Sesion-Ingreso al sistema',''),(53,'Salida','2021-06-03','19:58:12','Administrador','Finalizacion de session',''),(54,'Ingreso','2021-06-03','19:58:19','Administrador','Inicio de Sesion-Ingreso al sistema',''),(55,'Ingreso','2021-06-03','20:06:39','Administrador','Inicio de Sesion-Ingreso al sistema',''),(56,'Salida','2021-06-03','20:29:04','Administrador','Finalizacion de session',''),(57,'Ingreso','2021-06-03','21:56:34','Administrador','Inicio de Sesion-Ingreso al sistema',''),(58,'Salida','2021-06-04','00:19:44','Administrador','Finalizacion de session',''),(59,'Ingreso','2021-06-04','00:19:56','Administrador','Inicio de Sesion-Ingreso al sistema',''),(60,'Ingreso','2021-06-04','21:51:26','Administrador','Inicio de Sesion-Ingreso al sistema',''),(61,'Salida','2021-06-04','22:14:13','Administrador','Finalizacion de session',''),(62,'Ingreso','2021-06-04','22:14:30','Administrador','Inicio de Sesion-Ingreso al sistema',''),(63,'Salida','2021-06-04','22:38:01','Administrador','Finalizacion de session',''),(64,'Ingreso','2021-06-04','22:38:05','Administrador','Inicio de Sesion-Ingreso al sistema',''),(65,'Salida','2021-06-04','23:29:40','Administrador','Finalizacion de session',''),(66,'Ingreso','2021-06-04','23:29:44','Administrador','Inicio de Sesion-Ingreso al sistema',''),(67,'Insertar','2021/06/04','23:33:40','Administrador','Inserta nueva exportacion','exportacion'),(68,'Actualizar','2021/06/04','23:42:41','Administrador','Se actualiza el registro no. 1','exportacion'),(69,'Ingreso','2021-06-04','23:45:09','Administrador','Inicio de Sesion-Ingreso al sistema',''),(70,'Salida','2021-06-05','00:05:23','Administrador','Finalizacion de session',''),(71,'Ingreso','2021-06-10','12:18:27','Administrador','Inicio de Sesion-Ingreso al sistema',''),(72,'Ingreso','2021-06-10','12:23:31','Administrador','Inicio de Sesion-Ingreso al sistema',''),(73,'Ingreso','2021-06-10','15:02:50','Administrador','Inicio de Sesion-Ingreso al sistema',''),(74,'Ingreso','2021-06-10','15:03:46','Administrador','Inicio de Sesion-Ingreso al sistema',''),(75,'Ingreso','2021-06-15','09:45:37','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(76,'Salida','2021-06-15','10:15:40','Fredy Garcia','Finalizacion de session',''),(77,'Ingreso','2021-06-15','10:15:46','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(78,'Insertar','2021/06/15','10:29:00','Fredy Garcia','Se Inserta TIR numero 28','datostir'),(79,'Salida','2021-06-15','10:36:38','Fredy Garcia','Finalizacion de session',''),(80,'Ingreso','2021-06-15','10:36:44','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(81,'Salida','2021-06-15','11:15:34','Fredy Garcia','Finalizacion de session',''),(82,'Ingreso','2021-06-15','12:12:49','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(83,'Salida','2021-06-15','12:15:00','Fredy Garcia','Finalizacion de session',''),(84,'Salida','2021-06-18','09:56:15','Administrador','Finalizacion de session',''),(85,'Ingreso','2021-06-18','11:03:05','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(86,'Salida','2021-06-18','11:04:03','Fredy Garcia','Finalizacion de session',''),(87,'Ingreso','2021-06-18','20:55:04','Administrador','Inicio de Sesion-Ingreso al sistema',''),(88,'Salida','2021-06-18','22:16:03','Administrador','Finalizacion de session',''),(89,'Ingreso','2021-06-18','22:16:15','Administrador','Inicio de Sesion-Ingreso al sistema',''),(90,'Ingreso','2021-06-18','22:19:15','Administrador','Inicio de Sesion-Ingreso al sistema',''),(91,'Ingreso','2021-06-18','22:20:19','Administrador','Inicio de Sesion-Ingreso al sistema',''),(92,'Salida','2021-06-18','22:40:45','Administrador','Finalizacion de session',''),(93,'Ingreso','2021-06-18','22:40:52','Administrador','Inicio de Sesion-Ingreso al sistema',''),(94,'Ingreso','2021-06-18','22:54:06','Administrador','Inicio de Sesion-Ingreso al sistema',''),(95,'Actualizar','2021/06/19','00:22:15','Administrador','Se Actualiza TIR numero 28','datostir'),(96,'Ingreso','2021-06-23','11:54:28','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(97,'Salida','2021-06-23','12:01:03','Fredy Garcia','Finalizacion de session',''),(98,'Ingreso','2021-06-23','12:06:03','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(99,'Ingreso','2021-06-23','12:06:03','Fredy Garcia','Inicio de Sesion-Ingreso al sistema',''),(100,'Salida','2021-06-23','12:06:42','Fredy Garcia','Finalizacion de session',''),(101,'Ingreso','2021-06-23','21:43:46','Administrador','Inicio de Sesion-Ingreso al sistema',''),(102,'Ingreso','2021-06-23','23:12:14','Administrador','Inicio de Sesion-Ingreso al sistema',''),(103,'Ingreso','2021-06-23','23:13:29','Administrador','Inicio de Sesion-Ingreso al sistema',''),(104,'Insertar','2021/06/23','23:43:54','Administrador','Inserta nueva exportacion','exportacion'),(105,'Actualizar','2021/06/23','23:48:27','Administrador','Se actualiza el registro no. 3','exportacion');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloque`
--

DROP TABLE IF EXISTS `bloque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloque` (
  `id_bloque` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` char(20) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_bloque`),
  KEY `bloque_FK` (`id_area`),
  CONSTRAINT `bloque_FK` FOREIGN KEY (`id_area`) REFERENCES `areas_patio` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloque`
--

LOCK TABLES `bloque` WRITE;
/*!40000 ALTER TABLE `bloque` DISABLE KEYS */;
INSERT INTO `bloque` VALUES (1,'1',1,NULL),(2,'2',1,NULL),(3,'3',1,NULL),(4,'1',2,NULL);
/*!40000 ALTER TABLE `bloque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion`
--

DROP TABLE IF EXISTS `conexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Conexion` date DEFAULT NULL,
  `Hora_De_Conexion` char(10) DEFAULT NULL,
  `Setpoint` decimal(5,2) DEFAULT NULL,
  `Suministro` decimal(5,2) DEFAULT NULL,
  `Retorno` decimal(5,2) DEFAULT NULL,
  `Id_f` int(11) NOT NULL,
  `Id_ingreso` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Estado` char(10) DEFAULT NULL,
  `temperatura` char(2) DEFAULT NULL,
  `tipoconexion` varchar(2) DEFAULT NULL,
  `mecanico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`,`Id_ingreso`,`Id_f`,`Id_usuario`),
  KEY `ingreso_m_conexion` (`Id_ingreso`,`Id_usuario`),
  CONSTRAINT `ingreso_m_conexion` FOREIGN KEY (`Id_ingreso`, `Id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion`
--

LOCK TABLES `conexion` WRITE;
/*!40000 ALTER TABLE `conexion` DISABLE KEYS */;
INSERT INTO `conexion` VALUES (1,'2021-04-06','19:11:43',3.10,2.20,2.10,1,4,1,'Activo','F','PP',NULL),(2,'2021-04-09','15:20:40',25.00,12.00,3.20,3,3,1,'Activo','F','EE','CARLOS MARTINEZ'),(3,'2021-06-01','23:05:13',12.20,2.00,5.20,3,5,1,'Activo','F','EE',NULL),(4,'2021-06-15','12:12:57',59.00,57.00,54.00,5,6,3,'Activo','F','EE','FG'),(6,'2021-06-23','21:45:06',32.20,12.20,1.25,3,5,1,'Inactivo','F','EE','MARIO RODAS');
/*!40000 ALTER TABLE `conexion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenedor_posicion_patio`
--

DROP TABLE IF EXISTS `contenedor_posicion_patio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenedor_posicion_patio` (
  `id_conte_posi` int(11) NOT NULL AUTO_INCREMENT,
  `idpatio` int(11) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  `idbloque` int(11) DEFAULT NULL,
  `idfila` int(11) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `idaltura` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `id_ingre_m` int(11) DEFAULT NULL,
  `idf` int(11) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_conte_posi`),
  KEY `contenedor_posicion_patio_FK_1` (`idpatio`),
  KEY `contenedor_posicion_patio_FK` (`id_ingre_m`,`idf`,`idusuario`),
  KEY `contenedor_posicion_patio_FK_2` (`idfila`),
  CONSTRAINT `contenedor_posicion_patio_FK` FOREIGN KEY (`id_ingre_m`, `idf`, `idusuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`),
  CONSTRAINT `contenedor_posicion_patio_FK_2` FOREIGN KEY (`idfila`) REFERENCES `fila` (`idfila`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenedor_posicion_patio`
--

LOCK TABLES `contenedor_posicion_patio` WRITE;
/*!40000 ALTER TABLE `contenedor_posicion_patio` DISABLE KEYS */;
INSERT INTO `contenedor_posicion_patio` VALUES (1,1,1,1,1,1,1,1,'2021-05-25','22:04:49',3,3,'prueba de ingreso','Ingresado'),(2,1,1,1,1,2,2,3,'2021-06-15','10:32:36',6,5,'','Ingresado');
/*!40000 ALTER TABLE `contenedor_posicion_patio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datostir`
--

DROP TABLE IF EXISTS `datostir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datostir` (
  `idtir` int(11) NOT NULL AUTO_INCREMENT,
  `SerieTir` char(2) DEFAULT NULL,
  `chassis` varchar(10) DEFAULT NULL,
  `tipochassis` varchar(5) DEFAULT NULL,
  `refrigeracion` varchar(10) DEFAULT NULL,
  `tipocontenedor` varchar(10) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `tipomov` varchar(10) DEFAULT NULL,
  `Nombre_naviera` varchar(30) NOT NULL,
  `vacio` varchar(10) DEFAULT NULL,
  `Destino` varchar(30) DEFAULT NULL,
  `fallaizq` bit(1) DEFAULT NULL,
  `fallader` bit(1) DEFAULT NULL,
  `fallafre` bit(1) DEFAULT NULL,
  `fallainte` bit(1) DEFAULT NULL,
  `fallatra` bit(1) DEFAULT NULL,
  `fallatec` bit(1) DEFAULT NULL,
  `fallachas` bit(1) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `Observaciones_cierre` varchar(100) DEFAULT NULL,
  `booking` int(11) DEFAULT NULL,
  `sello_botella` varchar(20) DEFAULT NULL,
  `idingreso` int(11) DEFAULT NULL,
  `id_f` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idtir`),
  KEY `datortir_idtir_IDX` (`idtir`),
  KEY `datortir_FK` (`idingreso`,`id_f`,`id_usuario`),
  CONSTRAINT `datortir_FK` FOREIGN KEY (`idingreso`, `id_f`, `id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=4681;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datostir`
--

LOCK TABLES `datostir` WRITE;
/*!40000 ALTER TABLE `datostir` DISABLE KEYS */;
INSERT INTO `datostir` VALUES (1,'A','DFS322','20\'','gens','20','2021-04-30','22:21:53','Ingreso','MARK','si','FINCAS','','','\0','\0','','\0','\0','Mark','Prueba de ingreso',NULL,2132,'test-2',3,3,1,'Activo'),(2,'A','2232','20\'','gens','40','2021-05-03','23:24:13','Ingreso','MARK','si','FINCAS','\0','\0','\0','\0','\0','\0','\0','Mark','Generacion de Nuevo TIR',NULL,NULL,NULL,4,2,1,'Anulado'),(3,'A','2232','20\'','gens','40','2021-05-03','23:24:13','Ingreso','MARK','si','FINCAS','\0','\0','\0','\0','\0','\0','\0','Mark','Generacion de Nuevo TIR',NULL,NULL,NULL,4,2,1,'Anulado'),(4,'A','F23','20\'','gens','40','2021-05-03','23:24:13','Ingreso','MARK','si','FINCAS','','','\0','\0','','\0','\0','Mark','Generacion de Nuevo TIR',NULL,NULL,NULL,4,2,1,'Cerrado'),(22,'A','F23','20\'','gens','40','2021/05/10','23:52:54','Salida','MARK','si','FINCAS','','','\0','\0','','\0','\0','Mark','Generacion de Nuevo TIR','prueba cierre',NULL,NULL,4,2,1,'Cerrado'),(26,'A','DFS3245','40\'','seco','40','2021-05-14','15:20:13','Ingreso','MARK','si','GUATEMALA CIUDAD','','','\0','\0','\0','\0','\0','m','prueba de ingresp',NULL,365,'Test-3',5,3,1,'Activo'),(27,'A','DFS3245','40\'','seco','40','2021/05/14','15:31:25','Salida','MARK','si','GUATEMALA CIUDAD','','','\0','\0','\0','\0','\0','m','prueba de ingresp','cierre de prueba',NULL,NULL,5,3,1,'Cerrado'),(28,'A','TC70B2W','40\'','reef','40','2021-06-16','15:40:16','Ingreso','ORELLANA','si','ALOPSA','','','','\0','','','\0','MAERKS','PARCHES EN EL ESTERIOR Y EN EL TECHO GRADO  EVACUACION r2011',NULL,0,'0',6,5,3,'Activo');
/*!40000 ALTER TABLE `datostir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desconexion`
--

DROP TABLE IF EXISTS `desconexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desconexion` (
  `Id_d` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_De_Desconexion` date DEFAULT NULL,
  `Hora_De_Desconexio` char(10) DEFAULT NULL,
  `totalhoras` char(20) DEFAULT NULL,
  `observaciones` varchar(75) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` char(10) DEFAULT NULL,
  `idconexion` int(11) DEFAULT NULL,
  `nombre_mecanico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_d`,`id`,`Id_f`,`id_usuario`),
  KEY `ingreso_m_desconexion` (`id`,`Id_f`,`id_usuario`),
  CONSTRAINT `ingreso_m_desconexion` FOREIGN KEY (`id`, `Id_f`, `id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desconexion`
--

LOCK TABLES `desconexion` WRITE;
/*!40000 ALTER TABLE `desconexion` DISABLE KEYS */;
INSERT INTO `desconexion` VALUES (1,'2021-04-09','13:51','66:39','prueba',3,3,1,'Activo',1,NULL),(4,'2021-06-15','12:14:01','0:02','FG',6,5,3,'Activo',4,NULL),(5,'2021-06-23','23:24:54','528:19','prueba de ingreso',5,3,1,'Activo',3,'Luis Cambran');
/*!40000 ALTER TABLE `desconexion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dfallatir`
--

DROP TABLE IF EXISTS `dfallatir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dfallatir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utfalla` varchar(10) DEFAULT NULL,
  `falla` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=630;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dfallatir`
--

LOCK TABLES `dfallatir` WRITE;
/*!40000 ALTER TABLE `dfallatir` DISABLE KEYS */;
INSERT INTO `dfallatir` VALUES (1,'int','SUCIO'),(2,'int','MAL OLOR'),(3,'int','RAYADURA'),(4,'puerta','EMPAQUE'),(5,'puerta','MANIJAS'),(6,'puerta','VISAGRAS'),(7,'chasis','LUCES'),(8,'chasis','PATAS'),(9,'chasis','FRENOS'),(10,'chasis','OTROS'),(11,'llantas','ADELANTE'),(12,'llantas','ATRAS'),(13,'marcham','ADELANTE'),(14,'marcham','ATRAS'),(15,'ext','SUCIO'),(16,'ext','MAL OLOR'),(17,'ext','RAYADURA'),(18,'ext','GOLPE'),(19,'ext','AGUJERO'),(20,'ext','MANCHAS'),(21,'ext','OXIDO'),(22,'int','GOLPE'),(23,'int','AGUJERO'),(24,'int','MANCHAS'),(25,'int','OXIDO'),(26,'puerta','BARRAS'),(27,'puerta','OTROS');
/*!40000 ALTER TABLE `dfallatir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envios` (
  `Id_en` int(11) NOT NULL AUTO_INCREMENT,
  `No_Envio` int(11) DEFAULT NULL,
  `Fecha_Envio` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_en`,`id`,`Id_f`,`id_usuario`),
  KEY `ingreso_m_envio` (`id`,`Id_f`,`id_usuario`),
  CONSTRAINT `ingreso_m_envio` FOREIGN KEY (`id`, `Id_f`, `id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exportacion`
--

DROP TABLE IF EXISTS `exportacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exportacion` (
  `Id_e` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_salida` date DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `nopiloto` varchar(70) DEFAULT NULL,
  `licenciapiloto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_e`,`id`,`Id_f`,`id_usuario`),
  KEY `ingreso_m_export` (`id`,`Id_f`,`id_usuario`),
  CONSTRAINT `ingreso_m_export` FOREIGN KEY (`id`, `Id_f`, `id_usuario`) REFERENCES `ingreso_maestro` (`Id_Ingreso`, `Id_f`, `id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exportacion`
--

LOCK TABLES `exportacion` WRITE;
/*!40000 ALTER TABLE `exportacion` DISABLE KEYS */;
INSERT INTO `exportacion` VALUES (1,'2021-05-31','22:10:43','2021-05-31',4,2,1,'Activo','Mario Marroquin','1225 3652541 0112'),(2,'2021-06-04','23:29:48','2021-06-04',3,3,1,'Activo',NULL,NULL),(3,'2021-06-23','23:39:24','2021-06-23',1,3,1,'Activo','Mario Ruiz','1211 6625242 1012');
/*!40000 ALTER TABLE `exportacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fallas_tir`
--

DROP TABLE IF EXISTS `fallas_tir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fallas_tir` (
  `idfalla_tir` int(11) NOT NULL AUTO_INCREMENT,
  `id_datostir` int(11) DEFAULT NULL,
  `ubicacion` char(20) DEFAULT NULL,
  `falla` varchar(20) DEFAULT NULL,
  `opcionfalla` bit(1) DEFAULT NULL,
  `Posicion` varchar(10) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idfalla_tir`),
  KEY `Fallas_TIR_FK` (`id_datostir`),
  CONSTRAINT `Fallas_TIR_FK` FOREIGN KEY (`id_datostir`) REFERENCES `datostir` (`idtir`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=1820;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fallas_tir`
--

LOCK TABLES `fallas_tir` WRITE;
/*!40000 ALTER TABLE `fallas_tir` DISABLE KEYS */;
INSERT INTO `fallas_tir` VALUES (1,1,'Interior/Exterior','SUCIO','','No Aplica','Sucio en la parte izquierda y derecha'),(3,2,'Interior/Exterior','RAYADURA','','No Aplica','Se encuentra rayado con marcador'),(4,3,'Interior/Exterior','RAYADURA','','No Aplica','Se encuentra rayado con marcador'),(5,4,'Interior/Exterior','RAYADURA','','No Aplica','Se encuentra rayado con marcador'),(12,4,'Interior/Exterior','SUCIO','','No Aplica','hg'),(16,22,'Interior/Exterior','RAYADURA','','No Aplica','Se encuentra rayado con marcador'),(17,22,'Interior/Exterior','SUCIO','','No Aplica','hg'),(25,26,'Puertas','VISAGRAS','','No Aplica','prueba visagras'),(26,26,'Chasis','LUCES','','No Aplica','luz'),(27,27,'Puertas','VISAGRAS','','No Aplica','prueba visagras'),(28,27,'Chasis','LUCES','','No Aplica','luz'),(29,28,'Exterior','SUCIO','','No Aplica','AMBOS LADOS'),(30,28,'Exterior','RAYADURA','','No Aplica','AMBOS LADOS'),(31,28,'Exterior','MANCHAS','','No Aplica','AMBOS LADOS'),(32,28,'Exterior','OXIDO','','No Aplica','AMBOS LADOS'),(33,28,'Puertas','EMPAQUE','','No Aplica','DAÑADO'),(34,28,'Puertas','BARRAS','','No Aplica','FALTA BUSHING, BARRA #3 DOBLADA, BARRA #2 SOLDADA'),(35,28,'Interior','OXIDO','','No Aplica',''),(36,28,'Exterior','GOLPE','','No Aplica','GOLPES FUERTES EN AMBOS LADOS');
/*!40000 ALTER TABLE `fallas_tir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fila`
--

DROP TABLE IF EXISTS `fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fila` (
  `idfila` int(11) NOT NULL AUTO_INCREMENT,
  `fila` int(11) DEFAULT NULL,
  `idbloque` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfila`),
  KEY `fila_FK` (`idbloque`),
  CONSTRAINT `fila_FK` FOREIGN KEY (`idbloque`) REFERENCES `bloque` (`id_bloque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2730;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fila`
--

LOCK TABLES `fila` WRITE;
/*!40000 ALTER TABLE `fila` DISABLE KEYS */;
INSERT INTO `fila` VALUES (1,1,1),(2,2,1),(3,3,1),(4,1,2),(5,2,2),(6,3,2);
/*!40000 ALTER TABLE `fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flota_transporte`
--

DROP TABLE IF EXISTS `flota_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flota_transporte` (
  `Id_f` int(11) NOT NULL AUTO_INCREMENT,
  `Cabezal` char(20) DEFAULT NULL,
  `Nombre_de_Piloto` char(20) DEFAULT NULL,
  `Licencias` char(20) DEFAULT NULL,
  `Placas` char(20) DEFAULT NULL,
  `Codigo_Piloto_Naviera` char(20) DEFAULT NULL,
  `Naviera` char(20) DEFAULT NULL,
  `Creadopor` char(20) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Fechacreacion` date DEFAULT NULL,
  `Transporte` varchar(20) DEFAULT NULL,
  `Ubicacion` char(20) DEFAULT NULL,
  PRIMARY KEY (`Id_f`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flota_transporte`
--

LOCK TABLES `flota_transporte` WRITE;
/*!40000 ALTER TABLE `flota_transporte` DISABLE KEYS */;
INSERT INTO `flota_transporte` VALUES (1,'122C','CRISTIAN ERNESTO GAR','1928 08990 1804','C018BQH','31748','MAERSK','Administrador',1,'2021-03-30','MARK','PUERTO'),(2,'117C','RONY DE JESUS HERRER','2283 20143 1801','C007BQH','30232','MAERSK','Administrador',1,'2021-03-30','MARK','PUERTO'),(3,'C6','MARIO ESTUARDO MORAL','2635 62298 1801','C899BPK','40893','CHIQUITA','Administrador',1,'2021-03-30','MARK','PUERTO'),(4,'127C','MAYNOR IRAEL MADRID','2266 89573 1801','C990BQB','39611',NULL,NULL,1,NULL,'CHIQUITA',NULL),(5,'NA','BYRON LOPEZ','911804','949BPT','NA',NULL,NULL,1,NULL,'ORELLANA',NULL);
/*!40000 ALTER TABLE `flota_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_maestro`
--

DROP TABLE IF EXISTS `ingreso_maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso_maestro` (
  `Id_Ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_ingreso` date DEFAULT NULL,
  `Hora_ingreso` char(20) DEFAULT NULL,
  `No_Contenedor` char(20) DEFAULT NULL,
  `Barco` varchar(50) DEFAULT NULL,
  `Tipo_Contenido` char(20) DEFAULT NULL,
  `Descripcion_contenido` varchar(50) DEFAULT NULL,
  `Detalle_Servicio` varchar(20) DEFAULT NULL,
  `Marchamo` char(20) DEFAULT NULL,
  `Hora_TIR` char(10) DEFAULT NULL,
  `Serie_TIR` char(5) DEFAULT NULL,
  `producto` varchar(30) DEFAULT NULL,
  `Ord` int(11) DEFAULT NULL,
  `Bloque` char(20) DEFAULT NULL,
  `Posicion` int(11) DEFAULT NULL,
  `Observaciones` char(20) DEFAULT NULL,
  `Destino` char(20) DEFAULT NULL,
  `Fecha_Asignacion` date DEFAULT NULL,
  `tara` decimal(10,2) DEFAULT NULL,
  `Estado` char(20) DEFAULT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Ingreso`,`Id_f`,`id_usuario`),
  UNIQUE KEY `UK_ingreso_maestro` (`Id_Ingreso`,`id_usuario`),
  KEY `flota_ingreso_m` (`Id_f`),
  KEY `usuario_maestro` (`id_usuario`),
  CONSTRAINT `flota_ingreso_m` FOREIGN KEY (`Id_f`) REFERENCES `flota_transporte` (`Id_f`),
  CONSTRAINT `usuario_maestro` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_maestro`
--

LOCK TABLES `ingreso_maestro` WRITE;
/*!40000 ALTER TABLE `ingreso_maestro` DISABLE KEYS */;
INSERT INTO `ingreso_maestro` VALUES (1,'2021-03-31','21:09:17','TEMU9080595','STARD STANDARD V49','VACIO','VACIO RF','VACIO','ALOPSA5490','21:09:17','A','BANANO',438,'2',4,'0890021297/900020873','FINCAS','2021-03-31',450.20,'Exportado',3,1),(2,'2021-04-01','21:10:27','TEMU9080595','STARD STANDARD V49','VACIO','VACIO RF','VACIO','ALOPSA5490','21:10:27','A','BANANO',43,'1',2,'prueba de ingreso','FINCAS','2021-04-01',NULL,'Ingresado',1,1),(3,'2021-04-06','18:00:37','TEMU9488308','STARD STANDARD V49','VACIO','VACIO RF','VACIO','ALOPSA5483','18:00:37','A','SIN PRODUCTO',9751,'2',5,'DESPACHO A FINCAS 2','FINCAS','2021-04-06',425.60,'Asignado',3,1),(4,'2021-04-09','14:59:13','TEMU9501349','STARD STANDARD V49','VACIO','VACIO RF','VACIO','ALOPSA5495','14:59:13','A','BANANO',11,'2',6,'DESPACHO A FINCAS','FINCAS','2021-04-09',255.25,'Ingresado',2,1),(5,'2021-05-14','14:52:14','TEMU9488318','STARD STANDARD V50','VACIO','VACIO RC','VACIO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Prueba de ingreso','GUATEMALA CIUDAD',NULL,255.20,'Ingresado',3,1),(6,'2021-06-01','15:10:25','HASU4022597','NA','VACIO','VACIO','ALMACENAJE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','ALOPSA',NULL,3860.00,'Asignado',5,3);
/*!40000 ALTER TABLE `ingreso_maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoreo`
--

DROP TABLE IF EXISTS `monitoreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoreo` (
  `Id_m` int(11) NOT NULL AUTO_INCREMENT,
  `Hora_De_Monitoreo` char(10) DEFAULT NULL,
  `Retorno` decimal(5,2) DEFAULT NULL,
  `Observaciones` varchar(50) DEFAULT NULL,
  `Producto` char(20) DEFAULT NULL,
  `Set_Point` decimal(5,2) DEFAULT NULL,
  `Suministro` decimal(5,2) DEFAULT NULL,
  `Fecha_Del_Monitoreo` char(20) DEFAULT NULL,
  `Nombre_Del_Mecanico` char(20) DEFAULT NULL,
  `id_ingreso` int(11) NOT NULL,
  `Id_f` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `temperatura` char(2) DEFAULT NULL,
  PRIMARY KEY (`Id_m`),
  KEY `ingreso_m_monitoreo` (`id_ingreso`,`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoreo`
--

LOCK TABLES `monitoreo` WRITE;
/*!40000 ALTER TABLE `monitoreo` DISABLE KEYS */;
INSERT INTO `monitoreo` VALUES (1,'22:06:00',1.00,'prueba de monitoreo',NULL,25.23,2.00,'2021-06-23','LUIS CAMBRAN',6,5,1,'Activo','F');
/*!40000 ALTER TABLE `monitoreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `Id_Movimientos` int(11) NOT NULL AUTO_INCREMENT,
  `Semana` char(20) DEFAULT NULL,
  `Año` char(20) DEFAULT NULL,
  `Hora_Movimiento` char(10) DEFAULT NULL,
  `Fecha_Movimeinto` char(20) DEFAULT NULL,
  `Medida` char(20) DEFAULT NULL,
  `No_Contenedor` char(20) DEFAULT NULL,
  `Ingreso_Movimiento` char(10) DEFAULT NULL,
  `Cliente` char(20) DEFAULT NULL,
  `Actividad` char(20) DEFAULT NULL,
  `Motivo` char(20) DEFAULT NULL,
  `Despacho_Movimeinto` char(20) DEFAULT NULL,
  `Importacion` char(20) DEFAULT NULL,
  `Exportacion` char(20) DEFAULT NULL,
  `Adicionales` char(20) DEFAULT NULL,
  `Movimiento_Interno` char(20) DEFAULT NULL,
  `Observaciones` varchar(75) DEFAULT NULL,
  `Fecha_Movimiento` date DEFAULT NULL,
  `Horario_Turno` char(20) DEFAULT NULL,
  `Kalmar_No` char(20) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Movimientos`,`id_usuario`),
  KEY `mov_usuario` (`id_usuario`),
  CONSTRAINT `mov_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patios`
--

DROP TABLE IF EXISTS `patios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patios` (
  `id_patio` int(11) NOT NULL AUTO_INCREMENT,
  `patio_desc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_patio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patios`
--

LOCK TABLES `patios` WRITE;
/*!40000 ALTER TABLE `patios` DISABLE KEYS */;
INSERT INTO `patios` VALUES (1,'PATIO NO 1');
/*!40000 ALTER TABLE `patios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'dashboard'),(2,'acceso'),(3,'reportes'),(4,'Ingresoc'),(5,'Datosm'),(6,'ingresov'),(7,'ingresomov');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Admin'),(2,'Usuario'),(3,'Supervisor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamaniochasis`
--

DROP TABLE IF EXISTS `tamaniochasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamaniochasis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamaniochasis`
--

LOCK TABLES `tamaniochasis` WRITE;
/*!40000 ALTER TABLE `tamaniochasis` DISABLE KEYS */;
INSERT INTO `tamaniochasis` VALUES (1,'20\''),(2,'40\''),(3,'40\' - 45\''),(4,'45\'');
/*!40000 ALTER TABLE `tamaniochasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontenedor`
--

DROP TABLE IF EXISTS `tipocontenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocontenedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=2340;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontenedor`
--

LOCK TABLES `tipocontenedor` WRITE;
/*!40000 ALTER TABLE `tipocontenedor` DISABLE KEYS */;
INSERT INTO `tipocontenedor` VALUES (1,'20 STD'),(2,'40 STD'),(3,'40 HC'),(4,'45 HC'),(5,'FLAT RACK'),(6,'OPEN TOP'),(7,'ISO TANK');
/*!40000 ALTER TABLE `tipocontenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  KEY `fk_usuario_permiso_idx` (`idpermiso`),
  CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permiso`
--

LOCK TABLES `usuario_permiso` WRITE;
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT INTO `usuario_permiso` VALUES (14,1,1),(15,1,2),(16,1,4),(17,1,5),(18,1,7),(19,2,1),(20,2,2),(21,2,5),(22,2,6),(23,3,1),(24,3,4),(25,3,5),(26,3,6),(27,3,7);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` char(20) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `clave` varchar(250) DEFAULT NULL,
  `condicion` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `empresa` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `usuario_rol` (`id_rol`),
  CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',1,1,'1614482617.png','sorporte@interport.com.gt','Informatica','ALOPSA'),(2,'Luis Cambran','lcambran','908ac8d4a9cbab02e53685ca15fbaf46f63a06e2215257272d005da14858764c',1,3,'1617246834.png','luis@cambrantech.com','Informatica','ALOPSA'),(3,'Fredy Garcia','fgarcia','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,1,'1620397246.png','tecnicopb@interport.com.gt','Informatica','ALOPSA');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_activos`
--

DROP TABLE IF EXISTS `usuarios_activos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_activos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios` varchar(10) DEFAULT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_activos`
--

LOCK TABLES `usuarios_activos` WRITE;
/*!40000 ALTER TABLE `usuarios_activos` DISABLE KEYS */;
INSERT INTO `usuarios_activos` VALUES (27,'1','Administrador','2021-06-23','23:13:29');
/*!40000 ALTER TABLE `usuarios_activos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacios_despachos`
--

DROP TABLE IF EXISTS `vacios_despachos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacios_despachos` (
  `Id_vd` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Despacho` char(20) DEFAULT NULL,
  `Hora_De_Despacho` char(20) DEFAULT NULL,
  `Marchamo` char(20) DEFAULT NULL,
  `Digitador` char(20) DEFAULT NULL,
  `Id_f` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_vd`),
  KEY `flota_vacio_d` (`Id_f`),
  KEY `vacios_ingreso_despacho_v` (`Id`,`id_usuario`),
  CONSTRAINT `flota_vacio_d` FOREIGN KEY (`Id_f`) REFERENCES `flota_transporte` (`Id_f`),
  CONSTRAINT `vacios_ingreso_despacho_v` FOREIGN KEY (`Id`, `id_usuario`) REFERENCES `vacios_ingresos` (`Id`, `id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacios_despachos`
--

LOCK TABLES `vacios_despachos` WRITE;
/*!40000 ALTER TABLE `vacios_despachos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacios_despachos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacios_flota`
--

DROP TABLE IF EXISTS `vacios_flota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacios_flota` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cabezal` char(20) DEFAULT NULL,
  `Codigo_Cabezal` char(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacios_flota`
--

LOCK TABLES `vacios_flota` WRITE;
/*!40000 ALTER TABLE `vacios_flota` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacios_flota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacios_ingresos`
--

DROP TABLE IF EXISTS `vacios_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacios_ingresos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Hora_De_Ingreso` datetime DEFAULT NULL,
  `SZ` char(20) DEFAULT NULL,
  `Dry_Reefer` char(20) DEFAULT NULL,
  `Clasificacion` char(20) DEFAULT NULL,
  `Contenido` char(20) DEFAULT NULL,
  `Procedencia` char(20) DEFAULT NULL,
  `TIR` char(20) DEFAULT NULL,
  `HR_TIR` char(20) DEFAULT NULL,
  `Transporte` char(20) DEFAULT NULL,
  `Ubicacion` char(20) DEFAULT NULL,
  `Estatus` char(20) DEFAULT NULL,
  `Predio_From` char(20) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Sello_Export` char(20) DEFAULT NULL,
  `Sello_Alopsa` char(20) DEFAULT NULL,
  `Buque` char(20) DEFAULT NULL,
  `ETA` char(20) DEFAULT NULL,
  `Booking` char(20) DEFAULT NULL,
  `Cliente` char(20) DEFAULT NULL,
  `Producto` char(20) DEFAULT NULL,
  `No_De_ATC` char(20) DEFAULT NULL,
  `Peso_Tara` char(20) DEFAULT NULL,
  `Fecha_Emision` char(20) DEFAULT NULL,
  `Fecha_Vencimiento` char(20) DEFAULT NULL,
  `Fecha_Actual` char(20) DEFAULT NULL,
  `Dias_Estadia` char(20) DEFAULT NULL,
  `Problemas_ATC` char(20) DEFAULT NULL,
  `Forecast` char(20) DEFAULT NULL,
  `Chatarra` char(20) DEFAULT NULL,
  `Daños` char(20) DEFAULT NULL,
  `Año_De_Fabricacion` date DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`id_usuario`),
  KEY `usuario_vacio_ingreso` (`id_usuario`),
  CONSTRAINT `usuario_vacio_ingreso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacios_ingresos`
--

LOCK TABLES `vacios_ingresos` WRITE;
/*!40000 ALTER TABLE `vacios_ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacios_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sis_invcon'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_asign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asign`(in idasignacion int, in observaciones varchar(255), in bloque int,in posicion int,
in idingreso int,in idf int)
begin
	start transaction;

UPDATE sis_invcon.asignaciones
SET observaciones = observaciones,
    bloque = bloque,
    posicion = posicion,
    id = idingreso,
    Id_f = idf
WHERE Id_a = idasignacion;

UPDATE sis_invcon.posicion
SET id_ingreso = idingreso,
    estado = 'Asignado'
WHERE idPosicion = posicion
AND idbloque = bloque;
		
if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_asignaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asignaciones`(in idasignacion int,in Observaciones varchar(255),in Bloque int,
in posiciona int,in idingresoa int,in idfa int)
begin
	 start transaction;
UPDATE sis_invcon.asignaciones
SET observaciones = Observaciones,
    bloque = Bloque,
    posicion = posiciona,
    id = idingresoa,
    Id_f = idfa
WHERE Id_a = idasignacion;

if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_conexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_conexion`(in id_conexion int,in fechac char(10),in horacon char(10),
in setpoint decimal(5,2),in suministro decimal(5,2),in retorno decimal(5,2),
in idingreso int, in idf int,in temperatura char(2),in tipocon char(2), in nomecanico varchar(50))
BEGIN
  start transaction;

UPDATE conexion
SET Fecha_Conexion = fechac,
    Hora_De_Conexion = horacon,
    Setpoint = setpoint,
    Retorno = retorno,
    Suministro = suministro,
    Id_ingreso = idingreso,
    Id_f = Id_f,
    temperatura = temperatura,
    tipoconexion = tipocon,
    mecanico = nomecanico
WHERE Id = id_conexion;

  if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_desconexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_desconexion`(in iddesco int,in fechadesco char(10),
  in horadesco char(10), in totalhoras char(10), in observaciones varchar(70),
  in idf int,in idingre int,in idconexion int,in nombremecanico varchar(100))
BEGIN
  start transaction;
UPDATE desconexion
SET Fecha_De_Desconexion = fechadesco,
    Hora_De_Desconexio = horadesco,
    totalhoras = totalhoras,
    observaciones = observaciones,
    id = idingre,
    Id_f = idf,
    idconexion = idconexion,
    nombre_mecanico = nombremecanico
WHERE Id_d = iddesco;

  if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_expo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_expo`(in idexpo int,in fechaexpo date, in hora time,
in fecha_asig date,in id_ingreso int,in idflota int,in nompiloto varchar(70),in licenciap varchar(30))
begin
	start transaction;

UPDATE sis_invcon.exportacion
SET Fecha_salida = fechaexpo,
    Hora_Salida = hora,
    fecha_asignacion = fecha_asig,
    id = id_ingreso,
    Id_f = idflota,
    nopiloto = nompiloto,
    licenciapiloto = licenciap
WHERE Id_e = idexpo;


if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_fallastir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_fallastir`(in idfat int,in id_ing int
,in ubicacion char(50),in f char(20),in op bit,in obser varchar(50),in pos varchar(10))
begin
	start transaction;
UPDATE sis_invcon.fallas_tir
SET ubicacion = ubicacion,
    falla = f,
    opcionfalla = op,
    Posicion = pos,
    observacion = obser
WHERE idfalla_tir = idfat
AND id_datostir = id_ing;

	if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_ingresom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_ingresom`(IN `idingreso` INT, IN `fechaingreso` DATE,
IN `horaingreso` CHAR(20), IN `nocontenedor` CHAR(20), IN `barco` VARCHAR(50), IN `tipocontenido` CHAR(20),
IN `dcontenido` VARCHAR(20), IN `dservicio` VARCHAR(50), IN `destino` CHAR(20),IN `observaciones` VARCHAR(200),
IN `idf` INT, IN `idusuario` INT,in tara decimal(18,2))
BEGIN
 start transaction;
UPDATE ingreso_maestro
SET Fecha_ingreso = fechaingreso,
    Hora_ingreso = horaingreso,
    No_Contenedor = nocontenedor,
    Barco = barco,
    Tipo_Contenido = tipocontenido,
    Descripcion_contenido = dcontenido,
    Detalle_Servicio = dservicio,
    Observaciones = observaciones,
    Destino = destino,
    Estado = 'Ingresado',
    Id_f = idf,
    id_usuario = idusuario,
    tara = tara
WHERE Id_Ingreso = idingreso;
   
  if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
 

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_ingreso_old` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_ingreso_old`(IN `idingreso` INT, IN `fechaingreso` DATE, IN `horaingreso` CHAR(20), IN `nocontenedor` CHAR(20), IN `barco` VARCHAR(50), IN `tipocontenido` CHAR(20), IN `dcontenido` VARCHAR(20), IN `dservicio` VARCHAR(50), IN `marchamo` CHAR(20), IN `htir` CHAR(10), IN `serietir` CHAR(5), IN `producto` VARCHAR(30), IN `orden` INT, IN `bloque` CHAR(20), IN `posicion` INT, IN `destino` CHAR(20), IN `fechaasignacion` DATE, IN `observaciones` VARCHAR(200), IN `idf` INT, IN `idusuario` INT)
BEGIN
  DECLARE posiciona int;
  DECLARE bloquea char(20);

SELECT
  Bloque,
  Posicion INTO bloquea, posiciona
FROM ingreso_maestro
WHERE Id_Ingreso = idingreso;
UPDATE posicion
SET id_ingreso = 0,
    estado = 'Sin Asignar'
WHERE id_ingreso = idingreso;

UPDATE ingreso_maestro
SET Fecha_ingreso = fechaingreso,
    Hora_ingreso = horaingreso,
    No_Contenedor = nocontenedor,
    Barco = barco,
    Tipo_Contenido = tipocontenido,
    Descripcion_contenido = dcontenido,
    Detalle_Servicio = dservicio,
    Marchamo = marchamo,
    Hora_TIR = htir,
    Serie_TIR = serietir,
    producto = producto,
    Ord = orden,
    Bloque = bloque,
    Posicion = posicion,
    Observaciones = observaciones,
    Destino = destino,
    Fecha_Asignacion = fechaasignacion,
    Estado = 'Ingresado',
    Id_f = idf,
    id_usuario = idusuario
WHERE Id_Ingreso = idingreso;

UPDATE posicion
SET id_ingreso = idingreso,
    estado = 'Asignado'
WHERE idPosicion = posicion
AND idbloque = bloque;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_monitoreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_monitoreo`(in idmonitoreo int,
  in horamonitoreo char(10),in retorno varchar(30),in observaciones varchar(70),
  in setpoint char(20),in suministro varchar(20),fechamonitoreo char(10),
  in mecanico char(20),in idingreso int,in idf int,in temperatura char(2))
BEGIN
  start transaction;

UPDATE monitoreo
SET Hora_De_Monitoreo = horamonitoreo,
    Retorno = retorno,
    Observaciones = observaciones,
    Set_Point = setpoint,
    Suministro = suministro,
    Fecha_Del_Monitoreo = fechamonitoreo,
    Nombre_Del_Mecanico = mecanico,
    id_ingreso = idingreso,
    Id_f = idf,
    temperatura = temperatura
WHERE Id_m = idmonitoreo;

  if (@@error_count=0) then 
    commit;
    else
    rollback;
    end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_Posicion_con` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_Posicion_con`(in idpos int,in fecha varchar(10),
in hora varchar(10),in idpatio int,in idarea int,in idbloque int,in idfila_u int,
in altura int,in id_ingreso int,in id_f int, in observaciones varchar(100), in idalturan int)
begin
		declare id_fila_t int;
		declare id_altura_t int;
	start transaction;

SELECT
  contenedor_posicion_patio.idfila,
  altura_predio.id_altura INTO id_fila_t, id_altura_t
FROM contenedor_posicion_patio
  INNER JOIN altura_predio
    ON contenedor_posicion_patio.idfila = altura_predio.id_fila
    AND altura_predio.id_altura = idalturan
WHERE id_conte_posi = idpos;

UPDATE sis_invcon.altura_predio
SET id_ingresoc = 0,
    estado = 'Sin Asignar'
WHERE id_altura = id_altura_t
AND id_fila = id_fila_t;

UPDATE sis_invcon.contenedor_posicion_patio
SET idpatio = idpatio,
    idarea = idarea,
    idbloque = idbloque,
    idfila = idfila_u,
    altura = altura,
    fecha = fecha,
    hora = hora,
    id_ingre_m = id_ingreso,
    idf = id_f,
    observaciones = observaciones
WHERE id_conte_posi = idpos;

UPDATE sis_invcon.altura_predio
SET id_ingresoc = id_ingreso,
    estado = 'Asignado'
WHERE id_altura = idalturan;
	
if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_tir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_tir`(in id_tir int,in seriet char(2),in chasis char(10),
in tchasis varchar (5),in refrig varchar(10),in tconten varchar(10),in fechat char(10),
in horat char(10),in tmov char(10),in naviera varchar(30),in vacio varchar(10),in destino varchar(30),
in fizq bit,in fder bit,in ffre bit, in finte bit,in ftra bit,in ftec bit, in fcha bit,
in cli varchar(100), in obser varchar(200), in id_ingre int, in idf int,
in booking int, in sbotella varchar(20))
begin
	start transaction;
	
	UPDATE sis_invcon.datostir
						SET SerieTir=seriet, 
						chassis=chasis, tipochassis=tchasis,
						refrigeracion=refrig, tipocontenedor=tconten, 
						fecha=fechat, hora=horat, tipomov=tmov, 
						Nombre_naviera=naviera, vacio=vacio, Destino=destino, 
						fallaizq=fizq, fallader=fder, fallafre=ffre,
						fallainte=finte, fallatra=ftra, fallatec=ftec, 
						fallachas=fcha, cliente=cli, observaciones=obser,
						idingreso=id_ingre, id_f=idf,
						booking = booking, sello_botella =sbotella
						WHERE idtir=id_tir;

	
	select id_tir as idtir;
	if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cierre_Tir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cierre_Tir`(in id_tir int, in observacionesc varchar(100),
in idusuario int, in fechac char(10),in horac char(10))
    DETERMINISTIC
    COMMENT 'Error al ejecutar el procedimiento'
begin
	
	declare exit handler for sqlexception
		begin
 
			rollback;
		end;
	declare exit handler for sqlwarning
	begin
		rollback;
	end;
	
	start transaction;
	
	set @obs := observacionesc;
	set @fechac :=fechac;
	set @horac :=horac;

INSERT INTO sis_invcon.datostir (SerieTir, chassis, tipochassis, refrigeracion, tipocontenedor,
fecha, hora, tipomov, Nombre_naviera, vacio, Destino, fallaizq, fallader, fallafre,
fallainte, fallatra, fallatec, fallachas, cliente, observaciones, Observaciones_cierre, idingreso, id_f, id_usuario, estado)
  SELECT
    SerieTir,
    chassis,
    tipochassis,
    refrigeracion,
    tipocontenedor,
    @fechac,
    @horac,
    'Salida',
    Nombre_naviera,
    vacio,
    Destino,
    fallaizq,
    fallader,
    fallafre,
    fallainte,
    fallatra,
    fallatec,
    fallachas,
    cliente,
    observaciones,
    @obs,
    idingreso,
    id_f,
    id_usuario,
    "Cerrado" estado
  FROM datostir d
  WHERE d.idtir = id_tir;

SELECT
  @idu := LAST_INSERT_ID();
INSERT INTO sis_invcon.fallas_tir (id_datostir, ubicacion, falla, opcionfalla, Posicion, observacion)
  SELECT
    @idu,
    ubicacion,
    falla,
    opcionfalla,
    Posicion,
    observacion
  FROM sis_invcon.fallas_tir
  WHERE id_datostir = id_tir;

UPDATE sis_invcon.datostir
SET estado = 'Cerrado'
WHERE idtir = id_tir;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosconexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosconexion`(in idconexion int)
BEGIN
SELECT
  a.Fecha_Conexion,
  a.Hora_De_Conexion,
  a.Setpoint,
  a.Suministro,
  b.Fecha_ingreso,
  b.Hora_ingreso,
  c.Cabezal,
  c.Nombre_de_Piloto,
  b.Id_f,
  b.Id_Ingreso
FROM conexion a
  INNER JOIN ingreso_maestro b
    ON a.Id_ingreso = b.Id_Ingreso
  INNER JOIN flota_transporte c
    ON b.Id_f = c.Id_f
WHERE a.id = idconexion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosingreso`(in idingreso int)
BEGIN
SELECT
  a.Id_Ingreso,
  a.tara,
  b.Nombre_de_Piloto,
  b.Licencias,
  b.Placas,
  b.Codigo_Piloto_Naviera,
  a.No_Contenedor,
  b.Transporte,
  a.Destino,
  a.Id_f,
  a.Barco
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON b.Id_f = a.Id_f
WHERE a.Estado IN ('Ingresado', 'Asignado')
AND a.Id_Ingreso = idingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosingreso_asig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosingreso_asig`(in idingreso int)
BEGIN
SELECT
  a.Id_Ingreso,
  a.ord,
  b.Nombre_de_Piloto,
  b.Licencias,
  b.Placas,
  b.Codigo_Piloto_Naviera,
  a.No_Contenedor,
  a.Bloque,
  a.Posicion,
  a.producto,
  a.Barco,
  c.Descripcion,
  d.noposicion,
  a.Id_f
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON b.Id_f = a.Id_f
  INNER JOIN bloque c
    ON a.Bloque = c.id_bloque
  INNER JOIN posicion d
    ON a.Posicion = d.idposicion
WHERE a.Estado = 'Ingresado'
AND a.Id_Ingreso = idingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosingreso_c` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosingreso_c`(in idingreso int)
BEGIN
SELECT
  a.Id_Ingreso,
  a.tara,
  b.Nombre_de_Piloto,
  b.Licencias,
  b.Placas,
  b.Codigo_Piloto_Naviera,
  a.No_Contenedor,
  b.Transporte,
  a.Destino,
  a.Id_f
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON b.Id_f = a.Id_f
WHERE a.Estado IN ('Ingresado', 'Asignado')
AND a.Id_Ingreso = idingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosingreso_datostir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosingreso_datostir`(in idingreso int)
begin
SELECT
  a.Id_Ingreso,
  a.tara,
  b.Nombre_de_Piloto,
  b.Licencias,
  b.Placas,
  b.Codigo_Piloto_Naviera,
  a.No_Contenedor,
  b.Transporte,
  a.Destino,
  a.Id_f
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON b.Id_f = a.Id_f
WHERE a.Estado IN ('Ingresado', 'Exportado','Asignado')
AND a.Id_Ingreso = idingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosingreso_exp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosingreso_exp`(in idingreso int)
begin
SELECT
  a.Id_Ingreso,
  a.tara,
  b.Nombre_de_Piloto,
  b.Licencias,
  b.Placas,
  b.Codigo_Piloto_Naviera,
  a.No_Contenedor,
  b.Transporte,
  a.Destino,
  a.Id_f,
  a.Barco
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON b.Id_f = a.Id_f
WHERE a.Estado IN ('Ingresado', 'Asignado', 'Exportado')
AND a.Id_Ingreso = idingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_asign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_asign`(in observaciones varchar(255),
in bloque int,in posicion int,in idingreso int,in idf int,in idusuario int)
BEGIN
start transaction;
INSERT INTO asignaciones (observaciones, bloque, posicion, id, Id_f, id_usuario)
  VALUES (observaciones, bloque, posicion, idingreso, idf, idusuario);

UPDATE posicion
SET id_ingreso = idingreso,
    estado = 'Asignado'
WHERE idPosicion = posicion
AND idbloque = bloque;

if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cone`(in fechac char(10),in horacon char(10),
in setpoint decimal(5,2),in suministro decimal(5,2),in retorno decimal(5,2),
in idingreso int, in idf int,in idusuario int,in temperatura char(2),in tipocon char(2))
BEGIN
	start transaction;
INSERT INTO sis_invcon.conexion (Fecha_Conexion, Hora_De_Conexion, Setpoint, Suministro, Retorno,
Id_ingreso, Id_f, Id_usuario, Estado, temperatura, tipoconexion)
  VALUES (fechac, horacon, setpoint, suministro, retorno, idingreso, idf, idusuario, 'Activo', temperatura, tipocon);
if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_conexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_conexion`(in fechac char(10),in horacon char(10),
in setpoint decimal(5,2),in suministro decimal(5,2),in retorno decimal(5,2),
in idingreso int, in idf int,in idusuario int,in temperatura char(2),in tipocon char(2),in nomecanico varchar(50))
BEGIN
	start transaction;
INSERT INTO sis_invcon.conexion (Fecha_Conexion, Hora_De_Conexion, Setpoint, Suministro, Retorno,
Id_ingreso, Id_f, Id_usuario, Estado, temperatura, tipoconexion, mecanico)
  VALUES (fechac, horacon, setpoint, suministro, retorno, idingreso, idf, idusuario, 'Activo', temperatura, tipocon, nomecanico);
if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_desconexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_desconexion`(in fechadesco char(10),
  in horadesco char(10), in totalhoras char(10), in observaciones varchar(70),
  in idf int,in idingre int,in idusuario int,in idconexion int,in nombremecanico varchar(100))
BEGIN
  	start transaction;
INSERT INTO desconexion (Fecha_De_Desconexion, Hora_De_Desconexio, totalhoras, observaciones, id, Id_f, id_usuario, estado, idconexion,nombre_mecanico)
  VALUES (fechadesco, horadesco, totalhoras, observaciones, idingre, idf, idusuario, 'Activo', idconexion,nombremecanico);
  if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_monitoreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_monitoreo`(in horamonitoreo char(10),
  in retorno varchar(30),in observaciones varchar(70),
  in setpoint char(20),in suministro varchar(20),in fechamonitoreo char(10),
  in mecanico char(20),in idingreso int,in idf int,in idusuarios int,in temperaura char(2))
BEGIN
start transaction;
INSERT INTO monitoreo (Hora_De_Monitoreo, Retorno, Observaciones,Set_Point, Suministro, Fecha_Del_Monitoreo,
Nombre_Del_Mecanico, id_ingreso, Id_f,id_usuario,estado, temperatura)
  VALUES (horamonitoreo, retorno, observaciones, setpoint, suministro, fechamonitoreo, mecanico, idingreso, idf, idusuarios, 'Activo', temperaura);
if (@@error_count=0) then
  commit;
  else
  rollback;
  end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_posicion_con` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_posicion_con`(in fecha varchar(10),
in hora varchar(10),in idpatio int,in idarea int,in idbloque int,in idfila int,
in altura int,in idusuario int, in id_ingreso int,in id_f int, in observaciones varchar(100),in id_altura int)
begin
	start transaction;
INSERT INTO sis_invcon.contenedor_posicion_patio (idpatio, idarea, idbloque, idfila, altura, idaltura, idusuario, fecha, hora, id_ingre_m, idf, observaciones, estado)
  VALUES (idpatio, idarea, idbloque, idfila, altura, id_altura, idusuario, fecha, hora, id_ingreso, id_f, observaciones, 'Ingresado');

UPDATE ingreso_maestro
SET Estado = 'Asignado'
WHERE Id_Ingreso = id_ingreso;

if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserta_expo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserta_expo`(in fechaexpo date, in hora time,
in fecha_asig date,in id_ingreso int,in idflota int, in user_id int,in nombre_piloto varchar(70),in licencia varchar(30))
begin
	start transaction;

INSERT INTO sis_invcon.exportacion (Fecha_salida, Hora_Salida, fecha_asignacion,
id, Id_f, id_usuario,nopiloto ,licenciapiloto ,estado)
  VALUES (fechaexpo, hora, fecha_asig, id_ingreso, idflota, user_id, nombre_piloto,licencia , 'Activo');

if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_fallastir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_fallastir`(in iddtir int,in ubicacion char(50),in f char(20),in op bit,in obser varchar(50),in pos varchar(10) )
begin
	start transaction;

INSERT INTO sis_invcon.fallas_tir (id_datostir, ubicacion, falla, opcionfalla, observacion, Posicion)
  VALUES (iddtir, ubicacion, f, op, obser, pos);

if (@@error_count=0) then
	commit;
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_tir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tir`(in seriet char(2),in chasis char(10),
in tchasis varchar (5),in refrig varchar(10),in tconten varchar(10),in fechat char(10),
in horat char(10),in tmov char(10),in naviera varchar(30),in vacio varchar(10),in destino varchar(30),
in fizq bit,in fder bit,in ffre bit, in finte bit,in ftra bit,in ftec bit, in fcha bit,
in cli varchar(100), in obser varchar(200), in id_ingre int, in idf int,in idusuario int,
in booking int, in sbotella varchar(20))
begin
	start transaction;

INSERT INTO sis_invcon.datostir (SerieTir, chassis, tipochassis, refrigeracion, tipocontenedor, fecha, hora,
tipomov, Nombre_naviera, vacio, Destino, fallaizq, fallader, fallafre, fallainte,
fallatra, fallatec, fallachas, cliente, observaciones, idingreso, id_f, id_usuario, estado, booking, sello_botella)
  VALUES (seriet, chasis, tchasis, refrig, tconten, fechat, horat, tmov, naviera, vacio, destino, fizq, fder, ffre, finte, ftra, ftec, fcha, cli, obser, id_ingre, idf, idusuario, 'Activo', booking, sbotella);

SELECT
  LAST_INSERT_ID() AS idtir;
 if (@@error_count=0) then
	commit;
	
	else
	rollback;
end if;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listardatosm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listardatosm`()
BEGIN
SELECT a.Id_Ingreso,b.Nombre_de_Piloto,b.Placas,a.No_Contenedor,a.Marchamo,
	a.producto,a.Barco,a.Destino,a.Estado,a.Bloque idb,a.Posicion idp,a.Id_f ,a.tara,a.Descripcion_contenido 
			from ingreso_maestro a 
            inner join flota_transporte b on a.Id_f=b.Id_f 
            
            WHERE b.Estado=1 and a.Estado in('Ingresado','Anulado');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_asignaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_asignaciones`()
BEGIN
SELECT
  b.Ord,
  a.Id_a,
  c.Nombre_de_Piloto,
  c.Placas,
  c.Codigo_Piloto_Naviera,
  b.No_Contenedor,
  d.Descripcion Bloque,
  e.noposicion Posicion,
  b.producto,
  b.Barco
FROM asignaciones a
  INNER JOIN ingreso_maestro b
    ON a.id = b.Id_Ingreso
  INNER JOIN flota_transporte c
    ON a.Id_f = c.Id_f
  INNER JOIN bloque d
    ON a.bloque = d.id_bloque
  INNER JOIN posicion e
    ON a.posicion = e.idposicion
WHERE b.Estado = 'Ingresado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_Monitoreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Monitoreo`()
BEGIN
SELECT
  a.Id_m,
  b.No_Contenedor,
  a.Hora_De_Monitoreo,
  a.suministro,
  a.Set_Point,
  a.Retorno,
  a.Nombre_Del_Mecanico ,
  a.temperatura, 
  b.Barco,
  a.Fecha_Del_Monitoreo
FROM monitoreo a
  INNER JOIN ingreso_maestro b
    ON a.id_ingreso = b.Id_Ingreso
  INNER JOIN flota_transporte c
    ON a.Id_f = c.Id_f
  left JOIN bloque d
    ON b.Bloque = d.id_bloque
WHERE a.estado = 'Activo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_asignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_asignacion`(in idasignacion int)
begin

SELECT
  *
FROM sis_invcon.asignaciones
WHERE Id_a = idasignacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_conexiones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_conexiones`()
BEGIN
SELECT
  a.Id,
  b.No_Contenedor,
  a.Fecha_Conexion,
  a.Hora_De_Conexion,
  a.Setpoint,
  a.Suministro,
  a.Retorno,
  b.Id_Ingreso,
  c.Cabezal,
  c.Nombre_de_Piloto
FROM conexion a
  INNER JOIN ingreso_maestro b
    ON a.Id_ingreso = b.Id_Ingreso
  INNER JOIN flota_transporte c
    ON a.Id_f = c.Id_f
WHERE b.Estado IN ('Ingresado', 'Asignado')
AND a.Estado = 'Activo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_cont_pos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_cont_pos`()
begin
SELECT
  cpp.id_conte_posi,
  im.No_Contenedor contenedor,
  p.patio_desc patio,
  ap.area,
  b.Descripcion bloque,
  f.fila,
  cpp.altura,
  cpp.observaciones,
  cpp.idaltura
FROM contenedor_posicion_patio cpp
  INNER JOIN ingreso_maestro im
    ON im.Id_Ingreso = cpp.id_ingre_m
  INNER JOIN flota_transporte ft
    ON ft.Id_f = cpp.idf
  INNER JOIN patios p
    ON p.id_patio = cpp.idpatio
  INNER JOIN areas_patio ap
    ON ap.id_area = cpp.idarea
    AND ap.id_patio = cpp.idpatio
  INNER JOIN bloque b
    ON b.id_bloque = cpp.idbloque
    AND b.id_area = cpp.idarea
  INNER JOIN fila f
    ON f.idfila = cpp.idfila
WHERE cpp.estado = "Ingresado";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_datosm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_datosm`()
BEGIN
SELECT
  a.Id_Ingreso,
  b.Nombre_de_Piloto,
  b.Placas,
  a.No_Contenedor,
  a.Marchamo,
  a.producto,
  a.Barco,
  a.Destino,
  a.Estado,
  a.Bloque idb,
  a.Posicion idp,
  a.Id_f,
  a.tara,
  a.Descripcion_contenido
FROM ingreso_maestro a
  INNER JOIN flota_transporte b
    ON a.Id_f = b.Id_f

WHERE b.Estado = 1
AND a.Estado IN ('Ingresado', 'Anulado', 'Asignado');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_datostir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_datostir`()
begin
SELECT
  im.No_Contenedor,
  a.chassis,
  SerieTir,
  a.fecha,
  a.hora,
  ft.Transporte,
  ft.Nombre_de_Piloto,
  ft.Placas,
  a.Destino,
  a.vacio,
  a.cliente,
  a.idtir
FROM sis_invcon.datostir a
  INNER JOIN ingreso_maestro im
    ON a.idingreso = im.Id_Ingreso
  INNER JOIN flota_transporte ft
    ON a.id_f = ft.Id_f
WHERE a.estado = 'Activo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_datos_monitoreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_datos_monitoreo`(in idmonitoreo int)
BEGIN
SELECT
  *
FROM monitoreo
WHERE Id_m = idmonitoreo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_datos_tir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_datos_tir`(in id_tir int)
begin
SELECT
  *
FROM sis_invcon.datostir
WHERE idtir = id_tir;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_dato_conexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_dato_conexion`(in idconexion int)
BEGIN
SELECT
  *
FROM conexion
WHERE Id = idconexion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_desconexion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_desconexion`()
BEGIN
SELECT
  a.Fecha_De_Desconexion,
  a.Hora_De_Desconexio,
  a.totalhoras,
  b.Id_Ingreso,
  c.Cabezal,
  c.Nombre_de_Piloto,
  b.No_Contenedor,
  a.Id_d,
  b.Hora_ingreso,
  b.Fecha_ingreso,
  b.Descripcion_contenido,
  d.Id 'idco'
FROM desconexion a
  INNER JOIN ingreso_maestro b
    ON a.id = b.Id_Ingreso
  INNER JOIN flota_transporte c
    ON a.Id_f = c.Id_f
  INNER JOIN conexion d
    ON a.idconexion = d.Id
WHERE a.estado = 'Activo'
AND b.Estado IN ('Ingresado', 'Asignado');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_exportacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_exportacion`()
begin
SELECT
  e.Fecha_salida,
  e.Hora_Salida,
  e.fecha_asignacion,
  im.No_Contenedor,
  ft.Nombre_de_Piloto,
  ft.Licencias,
  im.Barco,
  e.estado,
  im.Estado Estado_c,
  im.Id_Ingreso,
  e.Id_e
FROM sis_invcon.exportacion e
  INNER JOIN sis_invcon.ingreso_maestro im
    ON e.id = im.Id_Ingreso
  INNER JOIN sis_invcon.flota_transporte ft
    ON ft.Id_f = im.Id_f;
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

-- Dump completed on 2021-06-23 23:52:21
