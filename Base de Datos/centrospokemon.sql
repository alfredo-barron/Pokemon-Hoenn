-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: centrospokemon
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `ayudantes`
--

DROP TABLE IF EXISTS `ayudantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayudantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_graduacion` date NOT NULL,
  `id_enfermera` int(11) NOT NULL,
  `id_centro_pokemon` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`),
  KEY `id_enfermera` (`id_enfermera`),
  KEY `id_centro_pokemon` (`id_centro_pokemon`),
  CONSTRAINT `ayudantes_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `catalogo_pokemon` (`id`),
  CONSTRAINT `ayudantes_ibfk_2` FOREIGN KEY (`id_enfermera`) REFERENCES `enfermeras` (`id`),
  CONSTRAINT `ayudantes_ibfk_3` FOREIGN KEY (`id_centro_pokemon`) REFERENCES `centros_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayudantes`
--

LOCK TABLES `ayudantes` WRITE;
/*!40000 ALTER TABLE `ayudantes` DISABLE KEYS */;
INSERT INTO `ayudantes` VALUES (1,1,'1988-10-21','2001-11-01',4,2,0),(2,5,'1988-12-03','2003-07-23',5,2,0),(3,5,'1996-07-09','2004-01-06',10,2,0),(4,4,'1990-08-12','2001-08-08',2,2,0),(5,1,'1994-04-03','2010-08-21',8,2,0),(6,1,'1987-07-31','2010-10-02',12,2,1),(7,5,'1997-01-08','2012-10-04',3,2,0),(8,4,'1996-11-02','2011-11-02',9,2,0),(9,4,'1994-07-08','2013-03-08',13,2,0);
/*!40000 ALTER TABLE `ayudantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camas`
--

DROP TABLE IF EXISTS `camas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en_uso` tinyint(1) DEFAULT '0',
  `id_habitacion` int(11) NOT NULL,
  `id_entrenador` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_entrenador` (`id_entrenador`),
  CONSTRAINT `camas_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id`),
  CONSTRAINT `camas_ibfk_2` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camas`
--

LOCK TABLES `camas` WRITE;
/*!40000 ALTER TABLE `camas` DISABLE KEYS */;
INSERT INTO `camas` VALUES (1,1,1,2,1),(2,NULL,1,9,1);
/*!40000 ALTER TABLE `camas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_estatus`
--

DROP TABLE IF EXISTS `catalogo_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `tiempo` int(11) NOT NULL,
  `desaparece_a` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_estatus`
--

LOCK TABLES `catalogo_estatus` WRITE;
/*!40000 ALTER TABLE `catalogo_estatus` DISABLE KEYS */;
INSERT INTO `catalogo_estatus` VALUES (1,'Normal',30,100),(2,'Quemado',85,70),(3,'Congelado',85,70),(4,'Paralizado',100,90),(5,'Envenenado',100,70),(6,'Fuertemente envenenado',120,90),(7,'Dormido',60,70),(8,'Desmayado',60,70);
/*!40000 ALTER TABLE `catalogo_estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_habilidades`
--

DROP TABLE IF EXISTS `catalogo_habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_habilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_habilidades`
--

LOCK TABLES `catalogo_habilidades` WRITE;
/*!40000 ALTER TABLE `catalogo_habilidades` DISABLE KEYS */;
INSERT INTO `catalogo_habilidades` VALUES (1,'Latigo Sepa'),(2,'Clorofila'),(3,'Mar Llamas'),(4,'Poder Solar'),(5,'Ascuas'),(6,'Torrente'),(7,'Cura Lluvia'),(8,'Hidro Bomba'),(9,'Demora'),(10,'Endurecer'),(11,'Esporas'),(12,'Polvo Escudo'),(13,'Mudar'),(14,'Enjambre'),(15,'Placaje'),(16,'Vista Lince'),(17,'Tormenta Arena'),(18,'Arañazo'),(19,'Placaje'),(20,'Agallas'),(21,'Picotazo'),(22,'Francotirador'),(23,'Intimidacion'),(24,'Veneno'),(25,'Trueno'),(26,'Pararayos'),(27,'Velo Arena'),(28,'Impetu Arena'),(29,'Entusiasmo'),(30,'Arañazo'),(31,'Ataque Tierra'),(32,'Picotazo Venenoso'),(33,'Megapuño'),(34,'Metronomo'),(35,'Agilidad'),(36,'Lanzallamas'),(37,'Sequia'),(38,'Gran Encanto'),(39,'Tenacidad'),(40,'Supersonico'),(41,'Foco'),(42,'Fuga'),(43,'Bomba Olor'),(44,'Esporas'),(45,'Picotazo Venenoso'),(46,'Humedad'),(47,'Placaje'),(48,'Polvo Sueño'),(49,'Dig'),(50,'Arena'),(51,'Arañazo'),(52,'Nerviosismo'),(53,'Confusion'),(54,'HydroPunch'),(55,'Furia'),(56,'Ira'),(57,'Gruñido'),(58,'Chorro Agua'),(59,'Absorber'),(60,'Teletransportacion'),(61,'Telequinesis'),(62,'Confusion'),(63,'Golpe Karate'),(64,'Golpe Roca'),(65,'Corpulencia'),(66,'Danza Caos'),(67,'Atraccion'),(68,'Hierva Lazo'),(69,'Cura Lluvia'),(70,'Rayo Aurora'),(71,'Avalancha'),(72,'Pisoton'),(73,'Daño Secreto'),(74,'Cola Agua'),(75,'Danza Lluvia'),(76,'Destello'),(77,'Onda Trueno'),(78,'Doble Filo'),(79,'Ladron'),(80,'Fly'),(81,'Viento Hielo'),(82,'Surf'),(83,'Mal de Ojo'),(84,'Residuos'),(85,'Chirrido'),(86,'Rayo Burbuja'),(87,'Tinieblas'),(88,'Maldicion'),(89,'Bola Sombra'),(90,'Atadura'),(91,'Hipnosis'),(92,'Confusion'),(93,'Garra Metal'),(94,'Corte'),(95,'Explosion'),(96,'Campana Cura'),(97,'Aromaterapia'),(98,'Recuperacion'),(99,'Cura Natural'),(100,'Dicha'),(101,'Alma Cura'),(102,'Regeneracion'),(103,'Espesura'),(104,'Pies Rapidos'),(105,'Gula'),(106,'Recogida'),(107,'Nado Rapido'),(108,'Madrugar'),(109,'Rastro'),(110,'Sincronia'),(111,'Ausente'),(112,'Espiritu Vital'),(113,'Velo Agua'),(114,'Foco Interno');
/*!40000 ALTER TABLE `catalogo_habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_pokemon`
--

DROP TABLE IF EXISTS `catalogo_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especie` text NOT NULL,
  `region` int(11) NOT NULL,
  `hit_points` int(11) NOT NULL,
  `ataque` int(11) NOT NULL,
  `defensa` int(11) NOT NULL,
  `velocidad` int(11) NOT NULL,
  `evasion` int(11) NOT NULL,
  `prezision` int(11) NOT NULL,
  `evol_trans` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region` (`region`),
  CONSTRAINT `catalogo_pokemon_ibfk_1` FOREIGN KEY (`region`) REFERENCES `regiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_pokemon`
--

LOCK TABLES `catalogo_pokemon` WRITE;
/*!40000 ALTER TABLE `catalogo_pokemon` DISABLE KEYS */;
INSERT INTO `catalogo_pokemon` VALUES (1,'Chansey',1,50,50,50,50,50,100,0),(4,'Blissey',1,50,50,50,50,50,100,0),(5,'Audino',1,50,50,50,50,50,100,0),(6,'Treecko',4,40,45,35,65,55,70,1),(7,'Grovyle',4,50,65,45,85,65,95,1),(8,'Sceptile',4,70,85,65,105,85,120,0),(9,'Torchic',4,45,60,40,70,50,45,1),(10,'Combusken',4,60,85,60,85,60,55,1),(11,'Blaziken',4,80,120,70,110,70,80,0),(12,'Mudkip',4,50,70,50,50,50,40,1),(13,'Marshtomp',4,70,85,70,60,70,50,1),(14,'Swampert',4,100,110,90,85,90,60,0),(15,'Poochyena',4,35,55,35,30,30,35,1),(16,'Mightyena',4,70,90,70,60,60,70,0),(17,'Zigzagoon',4,38,30,41,30,41,60,1),(18,'Linoone',4,78,70,61,50,61,100,0),(19,'Wurmple',4,45,45,35,20,30,20,1),(20,'Beautifly',4,60,70,50,90,50,65,0),(21,'Lotad',4,40,30,30,40,50,30,1),(22,'Lombre',4,60,50,50,60,70,50,1),(23,'Ludicolo',4,80,70,70,90,100,70,0),(24,'Seedot',4,40,40,50,30,30,30,1),(25,'Nuzleaf',4,70,70,40,60,40,60,1),(26,'Shiftry',4,90,100,60,90,60,80,0),(27,'Taillow',4,40,55,30,30,30,85,1),(28,'Swellow',4,60,85,60,50,50,125,0),(29,'Wingull',4,40,30,30,55,30,85,1),(30,'Pelipper',4,60,50,100,85,70,65,0),(31,'Ralts',4,28,25,25,45,35,40,1),(32,'Kirlia',4,38,35,35,65,55,50,1),(33,'Gardevoir',4,68,65,65,125,115,80,0),(34,'Surskit',4,40,30,32,50,52,65,1),(35,'Masquerain',4,70,60,62,80,82,60,0),(36,'Shroomish',4,60,40,60,40,60,35,1),(37,'Breloom',4,60,130,80,60,60,70,0),(38,'Slakoth',4,60,60,60,35,35,30,1),(39,'Vigoroth',4,80,80,80,55,55,90,1),(40,'Slaking',4,150,160,100,95,65,100,0),(41,'Goldeen',4,45,67,60,35,50,63,1),(42,'Seaking',4,80,92,65,65,80,68,0),(43,'Silcoon',4,50,35,55,25,25,15,1);
/*!40000 ALTER TABLE `catalogo_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_tipos`
--

DROP TABLE IF EXISTS `catalogo_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_tipos`
--

LOCK TABLES `catalogo_tipos` WRITE;
/*!40000 ALTER TABLE `catalogo_tipos` DISABLE KEYS */;
INSERT INTO `catalogo_tipos` VALUES (1,'Planta'),(2,'Fuego'),(3,'Agua'),(4,'Bicho'),(5,'Normal'),(6,'Veneno'),(7,'Electrico'),(8,'Tierra'),(9,'Hada'),(10,'Lucha'),(11,'Psiquico'),(12,'Roca'),(13,'Fantasma'),(14,'Siniestro'),(15,'Volador'),(16,'Acero');
/*!40000 ALTER TABLE `catalogo_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centros_pokemon`
--

DROP TABLE IF EXISTS `centros_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centros_pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `id_region` int(11) NOT NULL,
  `password` text NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `centros_pokemon_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centros_pokemon`
--

LOCK TABLES `centros_pokemon` WRITE;
/*!40000 ALTER TABLE `centros_pokemon` DISABLE KEYS */;
INSERT INTO `centros_pokemon` VALUES (2,'Arrecipolis ',4,'110992',1);
/*!40000 ALTER TABLE `centros_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeras`
--

DROP TABLE IF EXISTS `enfermeras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermeras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `apellidos` text NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_graduacion` date NOT NULL,
  `cedula` varchar(6) NOT NULL,
  `id_centro_pokemon` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_centro_pokemon` (`id_centro_pokemon`),
  CONSTRAINT `enfermeras_ibfk_1` FOREIGN KEY (`id_centro_pokemon`) REFERENCES `centros_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeras`
--

LOCK TABLES `enfermeras` WRITE;
/*!40000 ALTER TABLE `enfermeras` DISABLE KEYS */;
INSERT INTO `enfermeras` VALUES (1,'Joy ','Smith','1988-10-21','2001-11-01','ABC123',2,0),(2,'Ana','Rose','1989-12-01','2012-09-10','GHU999',2,0),(3,'Joy ','Perry','1988-10-21','2001-11-01','ABC123',2,0),(4,'Joy','Jhonson','1999-08-14','2013-01-11','HJH891',2,0),(5,'Katy','Perry','1988-10-21','2001-11-01','ABC123',2,0),(6,'Mizty','James','1988-10-21','2013-09-13','IOI901',2,0),(7,'Mary','Perry','1988-10-21','2001-11-01','ABC123',2,0),(8,'Janneth','McCartney','1988-10-21','2013-09-13','019KIL',2,0),(9,'Andrea','McCartney','1988-10-21','2013-09-13','019KIL',2,0),(10,'Mary','Jane','1978-02-12','2010-06-13','JHI981',2,0),(12,'Lita','Kino','1992-03-28','2012-03-27','SJP677',2,1),(13,'Laura','Perez ','1986-09-12','2014-01-12','OKO891',2,1);
/*!40000 ALTER TABLE `enfermeras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrenadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `apellidos` text NOT NULL,
  `alias` varchar(15) DEFAULT NULL,
  `password` text NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` int(11) NOT NULL,
  `sexo` enum('Hombre','Mujer') DEFAULT 'Hombre',
  `es_lider` tinyint(1) DEFAULT '0',
  `localizacion_actual` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lugar_nacimiento` (`lugar_nacimiento`),
  KEY `localizacion_actual` (`localizacion_actual`),
  CONSTRAINT `entrenadores_ibfk_1` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `regiones` (`id`),
  CONSTRAINT `entrenadores_ibfk_2` FOREIGN KEY (`localizacion_actual`) REFERENCES `regiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (2,'Alfredo','Barron','Freddy','110992','1992-09-11',4,'Hombre',1,4,1),(3,'Ulises','Larraga','Kross','030593','1993-05-03',1,'Hombre',0,1,0),(4,'Karen','Osuna','Anna','carlitos','1992-09-27',1,'Mujer',0,1,0),(6,'Javier','Ramirez','samy','vkjbvk','2013-12-05',1,'Hombre',1,3,0),(7,'Alain','Olvera','bebe','259206','1992-06-25',2,'Hombre',1,1,0),(8,'Manuel','Hdez','Manny','akatsuki','1993-02-12',2,'Hombre',1,4,1),(9,'Jaime','Delgado','J2DEME','1234','1987-08-21',1,'Hombre',1,1,1);
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evoluciones`
--

DROP TABLE IF EXISTS `evoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evoluciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prevolucion` int(11) NOT NULL,
  `id_evolucion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_prevolucion` (`id_prevolucion`),
  KEY `id_evolucion` (`id_evolucion`),
  CONSTRAINT `evoluciones_ibfk_1` FOREIGN KEY (`id_prevolucion`) REFERENCES `catalogo_pokemon` (`id`),
  CONSTRAINT `evoluciones_ibfk_2` FOREIGN KEY (`id_evolucion`) REFERENCES `catalogo_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evoluciones`
--

LOCK TABLES `evoluciones` WRITE;
/*!40000 ALTER TABLE `evoluciones` DISABLE KEYS */;
INSERT INTO `evoluciones` VALUES (2,1,4),(3,6,7),(4,7,8),(5,9,10),(6,10,11),(7,12,13),(8,13,14),(9,15,16),(10,17,18),(11,19,43),(12,43,20),(13,21,22),(14,22,23),(15,24,25),(16,25,26),(17,27,28),(18,29,30),(19,31,32),(20,32,33),(21,34,35),(22,36,37),(23,38,39),(24,39,40),(25,41,42);
/*!40000 ALTER TABLE `evoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(11) NOT NULL,
  `id_habilidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_habilidad` (`id_habilidad`),
  CONSTRAINT `habilidades_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `catalogo_pokemon` (`id`),
  CONSTRAINT `habilidades_ibfk_2` FOREIGN KEY (`id_habilidad`) REFERENCES `catalogo_habilidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,1,100),(2,1,99),(3,4,99),(4,4,100),(5,5,102),(6,5,101),(7,6,103),(8,7,103),(9,8,103),(10,9,3),(11,10,3),(12,11,3),(13,12,6),(14,13,6),(15,15,42),(16,15,104),(17,16,23),(18,16,104),(19,17,106),(20,17,105),(21,18,106),(22,18,105),(23,19,12),(24,43,13),(25,20,14),(26,21,7),(27,21,107),(28,22,7),(29,22,107),(30,23,7),(31,23,107),(32,24,2),(33,24,108),(34,25,2),(35,25,108),(36,26,2),(37,26,108),(38,27,20),(39,28,20),(40,29,16),(41,30,16),(42,31,109),(43,31,110),(44,32,109),(45,32,110),(46,33,109),(47,33,110),(48,38,111),(49,39,112),(50,40,111),(51,41,107),(52,41,113),(53,42,107),(54,42,113),(55,35,23);
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capacidad` int(11) NOT NULL,
  `id_centro_pokemon` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_centro_pokemon` (`id_centro_pokemon`),
  CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_centro_pokemon`) REFERENCES `centros_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,10,2,1),(2,14,2,0);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_entrenador`
--

DROP TABLE IF EXISTS `imagenes_entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes_entrenador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` text NOT NULL,
  `id_entrenador` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entrenador` (`id_entrenador`),
  CONSTRAINT `imagenes_entrenador_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_entrenador`
--

LOCK TABLES `imagenes_entrenador` WRITE;
/*!40000 ALTER TABLE `imagenes_entrenador` DISABLE KEYS */;
INSERT INTO `imagenes_entrenador` VALUES (1,'alfredo.jpg',2),(2,'ulises.jpg',3),(3,'karen.jpg',4),(4,'javier.jpg',6),(5,'job.jpg',7),(6,'manuel.jpg',8);
/*!40000 ALTER TABLE `imagenes_entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_pokemon`
--

DROP TABLE IF EXISTS `imagenes_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes_pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` text NOT NULL,
  `id_catalogo_pokemon` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_catalogo_pokemon` (`id_catalogo_pokemon`),
  CONSTRAINT `imagenes_pokemon_ibfk_1` FOREIGN KEY (`id_catalogo_pokemon`) REFERENCES `catalogo_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_pokemon`
--

LOCK TABLES `imagenes_pokemon` WRITE;
/*!40000 ALTER TABLE `imagenes_pokemon` DISABLE KEYS */;
INSERT INTO `imagenes_pokemon` VALUES (1,'Chansey.png',1),(2,'Blissey.png',4),(3,'Audino.png',5),(4,'Treecko.png',6),(5,'Grovyle.png',7),(6,'Sceptile.png',8),(7,'Torchic.png',9),(8,'Combusken.png',10),(9,'Blaziken.png',11),(10,'Mudkip.png',12),(11,'Marshtomp.png',13),(12,'Swampert.png',14),(13,'Poochyena.png',15),(14,'Mightyena.png',16),(15,'Zigzagoon.png',17),(16,'Linoone.png',18),(17,'Wurmple.png',19),(18,'Beautifly.png',20),(19,'Lotad.png',21),(20,'Lombre.png',22),(21,'Ludicolo.png',23),(22,'Seedot.png',24),(23,'Nuzleaf.png',25),(24,'Shiftry.png',26),(25,'Taillow.png',27),(26,'Swellow.png',28),(27,'Wingull.png',29),(28,'Pelipper.png',30),(29,'Ralts.png',31),(30,'Kirlia.png',32),(31,'Gardevoir.png',33),(32,'Surskit.png',34),(33,'Masquerain.png',35),(34,'Shroomish.png',36),(35,'Breloom.png',37),(36,'Slakoth.png',38),(37,'Vigoroth.png',39),(38,'Slaking.png',40),(39,'Goldeen.png',41),(40,'Seaking.png',42),(41,'Silcoon.png',43);
/*!40000 ALTER TABLE `imagenes_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intercambios`
--

DROP TABLE IF EXISTS `intercambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intercambios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrenador_a` int(11) NOT NULL,
  `entrenador_b` int(11) NOT NULL,
  `pokemon_a` int(11) NOT NULL,
  `pokemon_b` int(11) NOT NULL,
  `id_maquina_ti` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entrenador_a` (`entrenador_a`),
  KEY `entrenador_b` (`entrenador_b`),
  KEY `pokemon_a` (`pokemon_a`),
  KEY `pokemon_b` (`pokemon_b`),
  KEY `id_maquina_ti` (`id_maquina_ti`),
  CONSTRAINT `intercambios_ibfk_1` FOREIGN KEY (`entrenador_a`) REFERENCES `entrenadores` (`id`),
  CONSTRAINT `intercambios_ibfk_2` FOREIGN KEY (`entrenador_b`) REFERENCES `entrenadores` (`id`),
  CONSTRAINT `intercambios_ibfk_3` FOREIGN KEY (`pokemon_a`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `intercambios_ibfk_4` FOREIGN KEY (`pokemon_b`) REFERENCES `pokemon` (`id`),
  CONSTRAINT `intercambios_ibfk_5` FOREIGN KEY (`id_maquina_ti`) REFERENCES `maquinasit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intercambios`
--

LOCK TABLES `intercambios` WRITE;
/*!40000 ALTER TABLE `intercambios` DISABLE KEYS */;
/*!40000 ALTER TABLE `intercambios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinasit`
--

DROP TABLE IF EXISTS `maquinasit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maquinasit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_centro_pokemon` int(11) NOT NULL,
  `activa` tinyint(1) DEFAULT '1',
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_centro_pokemon` (`id_centro_pokemon`),
  CONSTRAINT `maquinasit_ibfk_1` FOREIGN KEY (`id_centro_pokemon`) REFERENCES `centros_pokemon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinasit`
--

LOCK TABLES `maquinasit` WRITE;
/*!40000 ALTER TABLE `maquinasit` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquinasit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokebolas`
--

DROP TABLE IF EXISTS `pokebolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokebolas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_entrenador` int(11) NOT NULL,
  `id_pokemon` int(11) NOT NULL,
  `archivada` tinyint(1) DEFAULT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_entrenador` (`id_entrenador`),
  KEY `id_pokemon` (`id_pokemon`),
  CONSTRAINT `pokebolas_ibfk_1` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id`),
  CONSTRAINT `pokebolas_ibfk_2` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokebolas`
--

LOCK TABLES `pokebolas` WRITE;
/*!40000 ALTER TABLE `pokebolas` DISABLE KEYS */;
INSERT INTO `pokebolas` VALUES (1,2,1,1,0),(2,2,2,1,0),(3,2,3,1,1),(4,3,4,1,0),(5,4,5,1,0),(6,2,1,1,0),(7,6,6,1,0),(8,7,7,1,0),(9,8,8,1,0),(10,9,9,1,1);
/*!40000 ALTER TABLE `pokebolas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especie` int(11) NOT NULL,
  `alias` text,
  `sexo` enum('Masculino','Femenino') DEFAULT 'Masculino',
  `nivel` int(11) NOT NULL,
  `es_intercambiable` tinyint(1) DEFAULT NULL,
  `hit_points` int(11) NOT NULL,
  `ataque` int(11) NOT NULL,
  `defensa` int(11) NOT NULL,
  `velocidad` int(11) NOT NULL,
  `evasion` int(11) NOT NULL,
  `prezision` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `especie` (`especie`),
  KEY `estatus` (`estatus`),
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`especie`) REFERENCES `catalogo_pokemon` (`id`),
  CONSTRAINT `pokemon_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `catalogo_estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,6,'Tree','Masculino',1,1,100,40,50,70,50,90,1,0),(2,9,'Thor','Femenino',1,1,75,20,40,40,100,50,1,0),(3,12,'Mukito','Masculino',1,0,90,20,40,30,50,70,1,1),(4,9,'Torchic','Masculino',1,0,70,40,50,100,30,60,1,0),(5,12,'Mosca','Masculino',1,1,40,70,30,60,100,90,1,0),(6,31,'el guapo','Masculino',1,1,2,5,5,3,81,1,1,0),(7,27,'cuchurrumin','Masculino',1,1,30,79,30,50,90,60,1,0),(8,13,'','Masculino',1,1,100,85,50,80,90,75,1,0),(9,27,'','Masculino',1,1,100,87,80,30,100,80,1,1);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regeneradores`
--

DROP TABLE IF EXISTS `regeneradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regeneradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slots` enum('50','75','100','150') DEFAULT '50',
  `slots_funcionales` int(11) NOT NULL,
  `esta_mantenimiento` tinyint(1) DEFAULT NULL,
  `id_centro_pokemon` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_centro_pokemon` (`id_centro_pokemon`),
  CONSTRAINT `regeneradores_ibfk_1` FOREIGN KEY (`id_centro_pokemon`) REFERENCES `centros_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regeneradores`
--

LOCK TABLES `regeneradores` WRITE;
/*!40000 ALTER TABLE `regeneradores` DISABLE KEYS */;
INSERT INTO `regeneradores` VALUES (1,'50',10,0,2,1),(2,'150',50,1,2,0),(3,'75',20,0,2,0),(4,'50',15,0,2,0),(5,'75',10,1,2,0);
/*!40000 ALTER TABLE `regeneradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Kanto'),(2,'Jotho'),(3,'Sinnoh'),(4,'Hoenn'),(5,'Almia');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enfermera_entrada` int(11) NOT NULL,
  `enfermera_salida` int(11) DEFAULT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_estimada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `id_regenerador` int(11) NOT NULL,
  `hit_points` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `id_pokebola` int(11) NOT NULL,
  `suspendido` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `enfermera_entrada` (`enfermera_entrada`),
  KEY `enfermera_salida` (`enfermera_salida`),
  KEY `id_regenerador` (`id_regenerador`),
  KEY `id_pokebola` (`id_pokebola`),
  KEY `estatus` (`estatus`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`enfermera_entrada`) REFERENCES `enfermeras` (`id`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`enfermera_salida`) REFERENCES `enfermeras` (`id`),
  CONSTRAINT `registros_ibfk_3` FOREIGN KEY (`id_regenerador`) REFERENCES `regeneradores` (`id`),
  CONSTRAINT `registros_ibfk_4` FOREIGN KEY (`id_pokebola`) REFERENCES `pokebolas` (`id`),
  CONSTRAINT `registros_ibfk_5` FOREIGN KEY (`estatus`) REFERENCES `catalogo_estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,12,NULL,'2013-12-10 20:18:00',NULL,NULL,1,100,1,3,0),(2,12,NULL,'2013-12-10 23:21:00',NULL,NULL,1,100,1,1,0),(3,12,NULL,'2013-12-11 00:29:00',NULL,NULL,1,5,7,2,1),(4,13,NULL,'2013-12-11 09:48:00',NULL,NULL,1,100,1,10,0);
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `tipos_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `catalogo_pokemon` (`id`),
  CONSTRAINT `tipos_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `catalogo_tipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,1,5),(2,4,5),(3,5,5),(4,6,1),(5,7,1),(6,8,1),(7,9,2),(8,10,2),(9,10,10),(10,11,2),(11,12,3),(12,13,3),(13,13,8),(14,14,3),(15,14,8),(16,15,14),(17,16,14),(18,17,5),(19,18,5),(20,19,4),(21,43,4),(22,20,4),(23,20,15),(24,21,3),(25,21,1),(26,22,3),(27,22,1),(28,23,3),(29,23,1),(30,24,1),(31,25,1),(32,25,14),(33,26,1),(34,26,14),(35,27,5),(36,27,15),(37,28,5),(38,28,15),(39,29,3),(40,29,15),(41,30,3),(42,30,15),(43,31,11),(44,31,9),(45,32,11),(46,32,9),(47,33,11),(48,33,9),(49,38,5),(50,39,5),(51,40,5),(52,41,3),(53,42,3),(54,35,15);
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_ayudantes`
--

DROP TABLE IF EXISTS `vista_ayudantes`;
/*!50001 DROP VIEW IF EXISTS `vista_ayudantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_ayudantes` (
  `id` tinyint NOT NULL,
  `id_ayudante` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `fecha_nacimiento` tinyint NOT NULL,
  `fecha_graduacion` tinyint NOT NULL,
  `id_enfermera` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_ayuenfe`
--

DROP TABLE IF EXISTS `vista_ayuenfe`;
/*!50001 DROP VIEW IF EXISTS `vista_ayuenfe`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_ayuenfe` (
  `id` tinyint NOT NULL,
  `id_enfermera` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_camas`
--

DROP TABLE IF EXISTS `vista_camas`;
/*!50001 DROP VIEW IF EXISTS `vista_camas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_camas` (
  `id` tinyint NOT NULL,
  `en_uso` tinyint NOT NULL,
  `id_habitacion` tinyint NOT NULL,
  `id_entrenador` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `alias` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_cataloayudantes`
--

DROP TABLE IF EXISTS `vista_cataloayudantes`;
/*!50001 DROP VIEW IF EXISTS `vista_cataloayudantes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_cataloayudantes` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_catalogopokemon`
--

DROP TABLE IF EXISTS `vista_catalogopokemon`;
/*!50001 DROP VIEW IF EXISTS `vista_catalogopokemon`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_catalogopokemon` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `ataque` tinyint NOT NULL,
  `defensa` tinyint NOT NULL,
  `velocidad` tinyint NOT NULL,
  `evasion` tinyint NOT NULL,
  `prezision` tinyint NOT NULL,
  `nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_enfeayu`
--

DROP TABLE IF EXISTS `vista_enfeayu`;
/*!50001 DROP VIEW IF EXISTS `vista_enfeayu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_enfeayu` (
  `id` tinyint NOT NULL,
  `id_ayudante` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_enfermeras`
--

DROP TABLE IF EXISTS `vista_enfermeras`;
/*!50001 DROP VIEW IF EXISTS `vista_enfermeras`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_enfermeras` (
  `id` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `cedula` tinyint NOT NULL,
  `fecha_nacimiento` tinyint NOT NULL,
  `fecha_graduacion` tinyint NOT NULL,
  `centro` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_enfermeras1`
--

DROP TABLE IF EXISTS `vista_enfermeras1`;
/*!50001 DROP VIEW IF EXISTS `vista_enfermeras1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_enfermeras1` (
  `id` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_entrenadores`
--

DROP TABLE IF EXISTS `vista_entrenadores`;
/*!50001 DROP VIEW IF EXISTS `vista_entrenadores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_entrenadores` (
  `id` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `alias` tinyint NOT NULL,
  `fecha_nacimiento` tinyint NOT NULL,
  `lugar_nacimiento` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `es_lider` tinyint NOT NULL,
  `localizacion_actual` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_entrenadores1`
--

DROP TABLE IF EXISTS `vista_entrenadores1`;
/*!50001 DROP VIEW IF EXISTS `vista_entrenadores1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_entrenadores1` (
  `id` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `alias` tinyint NOT NULL,
  `id_pokemon` tinyint NOT NULL,
  `id_pokebola` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_entrepokemon`
--

DROP TABLE IF EXISTS `vista_entrepokemon`;
/*!50001 DROP VIEW IF EXISTS `vista_entrepokemon`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_entrepokemon` (
  `id` tinyint NOT NULL,
  `id_entrenador` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `alias` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL,
  `id_pokebola` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_evolucion`
--

DROP TABLE IF EXISTS `vista_evolucion`;
/*!50001 DROP VIEW IF EXISTS `vista_evolucion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_evolucion` (
  `id` tinyint NOT NULL,
  `id_prevolucion` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `imagen` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_habiles`
--

DROP TABLE IF EXISTS `vista_habiles`;
/*!50001 DROP VIEW IF EXISTS `vista_habiles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_habiles` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `habilidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_habitaciones`
--

DROP TABLE IF EXISTS `vista_habitaciones`;
/*!50001 DROP VIEW IF EXISTS `vista_habitaciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_habitaciones` (
  `id` tinyint NOT NULL,
  `capacidad` tinyint NOT NULL,
  `centro` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_poke`
--

DROP TABLE IF EXISTS `vista_poke`;
/*!50001 DROP VIEW IF EXISTS `vista_poke`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_poke` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `ataque` tinyint NOT NULL,
  `defensa` tinyint NOT NULL,
  `velocidad` tinyint NOT NULL,
  `evasion` tinyint NOT NULL,
  `prezision` tinyint NOT NULL,
  `region` tinyint NOT NULL,
  `imagen` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_pokebola`
--

DROP TABLE IF EXISTS `vista_pokebola`;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_pokebola` (
  `id` tinyint NOT NULL,
  `id_entrenador` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `aliasentrenador` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `id_pokemon` tinyint NOT NULL,
  `aliaspokemon` tinyint NOT NULL,
  `es_intercambiable` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `nivel` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `ataque` tinyint NOT NULL,
  `defensa` tinyint NOT NULL,
  `velocidad` tinyint NOT NULL,
  `evasion` tinyint NOT NULL,
  `prezision` tinyint NOT NULL,
  `estatus` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `archivada` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL,
  `suspendidopokemon` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_pokebola1`
--

DROP TABLE IF EXISTS `vista_pokebola1`;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_pokebola1` (
  `id` tinyint NOT NULL,
  `id_entrenador` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `aliasentrenador` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `id_pokemon` tinyint NOT NULL,
  `aliaspokemon` tinyint NOT NULL,
  `es_intercambiable` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `nivel` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `ataque` tinyint NOT NULL,
  `defensa` tinyint NOT NULL,
  `velocidad` tinyint NOT NULL,
  `evasion` tinyint NOT NULL,
  `prezision` tinyint NOT NULL,
  `estatus` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `archivada` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL,
  `suspendidopokemon` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_pokebola3`
--

DROP TABLE IF EXISTS `vista_pokebola3`;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_pokebola3` (
  `id` tinyint NOT NULL,
  `id_entrenador` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `apellidos` tinyint NOT NULL,
  `aliasentrenador` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `id_pokemon` tinyint NOT NULL,
  `aliaspokemon` tinyint NOT NULL,
  `es_intercambiable` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `nivel` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `ataque` tinyint NOT NULL,
  `defensa` tinyint NOT NULL,
  `velocidad` tinyint NOT NULL,
  `evasion` tinyint NOT NULL,
  `prezision` tinyint NOT NULL,
  `estatus` tinyint NOT NULL,
  `imagen` tinyint NOT NULL,
  `archivada` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL,
  `suspendidopokemon` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_pokemon`
--

DROP TABLE IF EXISTS `vista_pokemon`;
/*!50001 DROP VIEW IF EXISTS `vista_pokemon`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_pokemon` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `alias` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_pokemondispo`
--

DROP TABLE IF EXISTS `vista_pokemondispo`;
/*!50001 DROP VIEW IF EXISTS `vista_pokemondispo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_pokemondispo` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_regeneradores`
--

DROP TABLE IF EXISTS `vista_regeneradores`;
/*!50001 DROP VIEW IF EXISTS `vista_regeneradores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_regeneradores` (
  `id` tinyint NOT NULL,
  `slots` tinyint NOT NULL,
  `slots_funcionales` tinyint NOT NULL,
  `esta_mantenimiento` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `suspendido` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_registroestatus`
--

DROP TABLE IF EXISTS `vista_registroestatus`;
/*!50001 DROP VIEW IF EXISTS `vista_registroestatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_registroestatus` (
  `id` tinyint NOT NULL,
  `id_pokebola` tinyint NOT NULL,
  `hit_points` tinyint NOT NULL,
  `fecha_entrada` tinyint NOT NULL,
  `estatus` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `tiempo` tinyint NOT NULL,
  `desaparece_a` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_tipos`
--

DROP TABLE IF EXISTS `vista_tipos`;
/*!50001 DROP VIEW IF EXISTS `vista_tipos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_tipos` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `tipo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_tiposhabiles`
--

DROP TABLE IF EXISTS `vista_tiposhabiles`;
/*!50001 DROP VIEW IF EXISTS `vista_tiposhabiles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vista_tiposhabiles` (
  `id` tinyint NOT NULL,
  `especie` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `habilidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_ayudantes`
--

/*!50001 DROP TABLE IF EXISTS `vista_ayudantes`*/;
/*!50001 DROP VIEW IF EXISTS `vista_ayudantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ayudantes` AS select `ayudantes`.`id` AS `id`,`enfermeras`.`id` AS `id_ayudante`,`catalogo_pokemon`.`especie` AS `especie`,`ayudantes`.`fecha_nacimiento` AS `fecha_nacimiento`,`ayudantes`.`fecha_graduacion` AS `fecha_graduacion`,`enfermeras`.`id` AS `id_enfermera`,`enfermeras`.`nombre` AS `nombre`,`enfermeras`.`apellidos` AS `apellidos`,`imagenes_pokemon`.`imagen` AS `imagen`,`ayudantes`.`suspendido` AS `suspendido` from (((`ayudantes` join `catalogo_pokemon`) join `enfermeras`) join `imagenes_pokemon`) where ((`ayudantes`.`id_enfermera` = `enfermeras`.`id`) and (`ayudantes`.`tipo` = `catalogo_pokemon`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ayuenfe`
--

/*!50001 DROP TABLE IF EXISTS `vista_ayuenfe`*/;
/*!50001 DROP VIEW IF EXISTS `vista_ayuenfe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ayuenfe` AS select `ayudantes`.`id` AS `id`,`enfermeras`.`id` AS `id_enfermera`,`enfermeras`.`nombre` AS `nombre`,`enfermeras`.`apellidos` AS `apellidos`,`enfermeras`.`suspendido` AS `suspendido` from (`enfermeras` join `ayudantes`) where ((`ayudantes`.`id_enfermera` = `enfermeras`.`id`) and (`enfermeras`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_camas`
--

/*!50001 DROP TABLE IF EXISTS `vista_camas`*/;
/*!50001 DROP VIEW IF EXISTS `vista_camas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_camas` AS select `camas`.`id` AS `id`,`camas`.`en_uso` AS `en_uso`,`camas`.`id_habitacion` AS `id_habitacion`,`camas`.`id_entrenador` AS `id_entrenador`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `alias` from (`camas` join `entrenadores`) where (`camas`.`id_entrenador` = `entrenadores`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cataloayudantes`
--

/*!50001 DROP TABLE IF EXISTS `vista_cataloayudantes`*/;
/*!50001 DROP VIEW IF EXISTS `vista_cataloayudantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cataloayudantes` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie` from `catalogo_pokemon` where ((`catalogo_pokemon`.`id` > 0) and (`catalogo_pokemon`.`id` < 6)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_catalogopokemon`
--

/*!50001 DROP TABLE IF EXISTS `vista_catalogopokemon`*/;
/*!50001 DROP VIEW IF EXISTS `vista_catalogopokemon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_catalogopokemon` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`catalogo_pokemon`.`hit_points` AS `hit_points`,`catalogo_pokemon`.`ataque` AS `ataque`,`catalogo_pokemon`.`defensa` AS `defensa`,`catalogo_pokemon`.`velocidad` AS `velocidad`,`catalogo_pokemon`.`evasion` AS `evasion`,`catalogo_pokemon`.`prezision` AS `prezision`,`regiones`.`nombre` AS `nombre` from (`catalogo_pokemon` join `regiones`) where (`catalogo_pokemon`.`region` = `regiones`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_enfeayu`
--

/*!50001 DROP TABLE IF EXISTS `vista_enfeayu`*/;
/*!50001 DROP VIEW IF EXISTS `vista_enfeayu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_enfeayu` AS select `enfermeras`.`id` AS `id`,`ayudantes`.`id` AS `id_ayudante`,`catalogo_pokemon`.`id` AS `tipo`,`catalogo_pokemon`.`especie` AS `especie`,`imagenes_pokemon`.`imagen` AS `imagen`,`ayudantes`.`suspendido` AS `suspendido` from (((`catalogo_pokemon` join `enfermeras`) join `ayudantes`) join `imagenes_pokemon`) where ((`ayudantes`.`tipo` = `catalogo_pokemon`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`) and (`ayudantes`.`id_enfermera` = `enfermeras`.`id`) and (`ayudantes`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_enfermeras`
--

/*!50001 DROP TABLE IF EXISTS `vista_enfermeras`*/;
/*!50001 DROP VIEW IF EXISTS `vista_enfermeras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_enfermeras` AS select `enfermeras`.`id` AS `id`,`enfermeras`.`nombre` AS `nombre`,`enfermeras`.`apellidos` AS `apellidos`,`enfermeras`.`cedula` AS `cedula`,`enfermeras`.`fecha_nacimiento` AS `fecha_nacimiento`,`enfermeras`.`fecha_graduacion` AS `fecha_graduacion`,`centros_pokemon`.`nombre` AS `centro`,`enfermeras`.`suspendido` AS `suspendido` from (`enfermeras` join `centros_pokemon`) where (`enfermeras`.`id_centro_pokemon` = `centros_pokemon`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_enfermeras1`
--

/*!50001 DROP TABLE IF EXISTS `vista_enfermeras1`*/;
/*!50001 DROP VIEW IF EXISTS `vista_enfermeras1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_enfermeras1` AS select `enfermeras`.`id` AS `id`,`enfermeras`.`nombre` AS `nombre`,`enfermeras`.`apellidos` AS `apellidos`,`enfermeras`.`suspendido` AS `suspendido` from `enfermeras` where (`enfermeras`.`suspendido` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_entrenadores`
--

/*!50001 DROP TABLE IF EXISTS `vista_entrenadores`*/;
/*!50001 DROP VIEW IF EXISTS `vista_entrenadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_entrenadores` AS select `entrenadores`.`id` AS `id`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `alias`,`entrenadores`.`fecha_nacimiento` AS `fecha_nacimiento`,`regiones`.`nombre` AS `lugar_nacimiento`,`entrenadores`.`sexo` AS `sexo`,`entrenadores`.`es_lider` AS `es_lider`,`regiones`.`nombre` AS `localizacion_actual`,`imagenes_entrenador`.`imagen` AS `imagen`,`entrenadores`.`suspendido` AS `suspendido` from ((`entrenadores` join `regiones`) join `imagenes_entrenador`) where ((`entrenadores`.`lugar_nacimiento` = `regiones`.`id`) and (`imagenes_entrenador`.`id_entrenador` = `entrenadores`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_entrenadores1`
--

/*!50001 DROP TABLE IF EXISTS `vista_entrenadores1`*/;
/*!50001 DROP VIEW IF EXISTS `vista_entrenadores1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_entrenadores1` AS select `entrenadores`.`id` AS `id`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `alias`,`pokemon`.`id` AS `id_pokemon`,`pokebolas`.`id` AS `id_pokebola`,`imagenes_entrenador`.`imagen` AS `imagen`,`entrenadores`.`suspendido` AS `suspendido` from ((((`entrenadores` join `regiones`) join `imagenes_entrenador`) join `pokemon`) join `pokebolas`) where ((`entrenadores`.`lugar_nacimiento` = `regiones`.`id`) and (`imagenes_entrenador`.`id_entrenador` = `entrenadores`.`id`) and (`pokebolas`.`id_entrenador` = `entrenadores`.`id`) and (`entrenadores`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_entrepokemon`
--

/*!50001 DROP TABLE IF EXISTS `vista_entrepokemon`*/;
/*!50001 DROP VIEW IF EXISTS `vista_entrepokemon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_entrepokemon` AS select `pokemon`.`id` AS `id`,`entrenadores`.`id` AS `id_entrenador`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `alias`,`imagenes_entrenador`.`imagen` AS `imagen`,`entrenadores`.`suspendido` AS `suspendido`,`pokebolas`.`id` AS `id_pokebola` from (((`pokemon` join `pokebolas`) join `entrenadores`) join `imagenes_entrenador`) where ((`pokebolas`.`id_pokemon` = `pokemon`.`id`) and (`pokebolas`.`id_entrenador` = `entrenadores`.`id`) and (`imagenes_entrenador`.`id_entrenador` = `entrenadores`.`id`) and (`entrenadores`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_evolucion`
--

/*!50001 DROP TABLE IF EXISTS `vista_evolucion`*/;
/*!50001 DROP VIEW IF EXISTS `vista_evolucion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_evolucion` AS select `catalogo_pokemon`.`id` AS `id`,`evoluciones`.`id_prevolucion` AS `id_prevolucion`,`catalogo_pokemon`.`especie` AS `especie`,`imagenes_pokemon`.`imagen` AS `imagen` from ((`catalogo_pokemon` join `imagenes_pokemon`) join `evoluciones`) where ((`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`) and (`evoluciones`.`id_evolucion` = `catalogo_pokemon`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_habiles`
--

/*!50001 DROP TABLE IF EXISTS `vista_habiles`*/;
/*!50001 DROP VIEW IF EXISTS `vista_habiles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_habiles` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`catalogo_habilidades`.`nombre` AS `habilidad` from ((`catalogo_pokemon` join `catalogo_habilidades`) join `habilidades`) where ((`habilidades`.`id_pokemon` = `catalogo_pokemon`.`id`) and (`habilidades`.`id_habilidad` = `catalogo_habilidades`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_habitaciones`
--

/*!50001 DROP TABLE IF EXISTS `vista_habitaciones`*/;
/*!50001 DROP VIEW IF EXISTS `vista_habitaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_habitaciones` AS select `habitaciones`.`id` AS `id`,`habitaciones`.`capacidad` AS `capacidad`,`centros_pokemon`.`nombre` AS `centro`,`habitaciones`.`suspendido` AS `suspendido` from (`habitaciones` join `centros_pokemon`) where (`habitaciones`.`id_centro_pokemon` = `centros_pokemon`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_poke`
--

/*!50001 DROP TABLE IF EXISTS `vista_poke`*/;
/*!50001 DROP VIEW IF EXISTS `vista_poke`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_poke` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`catalogo_pokemon`.`hit_points` AS `hit_points`,`catalogo_pokemon`.`ataque` AS `ataque`,`catalogo_pokemon`.`defensa` AS `defensa`,`catalogo_pokemon`.`velocidad` AS `velocidad`,`catalogo_pokemon`.`evasion` AS `evasion`,`catalogo_pokemon`.`prezision` AS `prezision`,`regiones`.`nombre` AS `region`,`imagenes_pokemon`.`imagen` AS `imagen` from ((`catalogo_pokemon` join `regiones`) join `imagenes_pokemon`) where ((`catalogo_pokemon`.`region` = `regiones`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pokebola`
--

/*!50001 DROP TABLE IF EXISTS `vista_pokebola`*/;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pokebola` AS select `pokebolas`.`id` AS `id`,`entrenadores`.`id` AS `id_entrenador`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `aliasentrenador`,`catalogo_pokemon`.`especie` AS `especie`,`pokemon`.`id` AS `id_pokemon`,`pokemon`.`alias` AS `aliaspokemon`,`pokemon`.`es_intercambiable` AS `es_intercambiable`,`pokemon`.`sexo` AS `sexo`,`pokemon`.`nivel` AS `nivel`,`pokemon`.`hit_points` AS `hit_points`,`pokemon`.`ataque` AS `ataque`,`pokemon`.`defensa` AS `defensa`,`pokemon`.`velocidad` AS `velocidad`,`pokemon`.`evasion` AS `evasion`,`pokemon`.`prezision` AS `prezision`,`catalogo_estatus`.`nombre` AS `estatus`,`imagenes_pokemon`.`imagen` AS `imagen`,`pokebolas`.`archivada` AS `archivada`,`pokebolas`.`suspendido` AS `suspendido`,`pokemon`.`suspendido` AS `suspendidopokemon` from (((((`pokebolas` join `catalogo_pokemon`) join `pokemon`) join `entrenadores`) join `imagenes_pokemon`) join `catalogo_estatus`) where ((`pokebolas`.`id_entrenador` = `entrenadores`.`id`) and (`pokebolas`.`id_pokemon` = `pokemon`.`id`) and (`pokemon`.`especie` = `catalogo_pokemon`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`) and (`pokemon`.`estatus` = `catalogo_estatus`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pokebola1`
--

/*!50001 DROP TABLE IF EXISTS `vista_pokebola1`*/;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pokebola1` AS select `pokebolas`.`id` AS `id`,`entrenadores`.`id` AS `id_entrenador`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `aliasentrenador`,`catalogo_pokemon`.`especie` AS `especie`,`pokemon`.`id` AS `id_pokemon`,`pokemon`.`alias` AS `aliaspokemon`,`pokemon`.`es_intercambiable` AS `es_intercambiable`,`pokemon`.`sexo` AS `sexo`,`pokemon`.`nivel` AS `nivel`,`pokemon`.`hit_points` AS `hit_points`,`pokemon`.`ataque` AS `ataque`,`pokemon`.`defensa` AS `defensa`,`pokemon`.`velocidad` AS `velocidad`,`pokemon`.`evasion` AS `evasion`,`pokemon`.`prezision` AS `prezision`,`catalogo_estatus`.`nombre` AS `estatus`,`imagenes_pokemon`.`imagen` AS `imagen`,`pokebolas`.`archivada` AS `archivada`,`pokebolas`.`suspendido` AS `suspendido`,`pokemon`.`suspendido` AS `suspendidopokemon` from (((((`pokebolas` join `catalogo_pokemon`) join `pokemon`) join `entrenadores`) join `imagenes_pokemon`) join `catalogo_estatus`) where ((`pokebolas`.`id_entrenador` = `entrenadores`.`id`) and (`pokebolas`.`id_pokemon` = `pokemon`.`id`) and (`pokemon`.`especie` = `catalogo_pokemon`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`) and (`pokemon`.`estatus` = `catalogo_estatus`.`id`) and (`pokemon`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pokebola3`
--

/*!50001 DROP TABLE IF EXISTS `vista_pokebola3`*/;
/*!50001 DROP VIEW IF EXISTS `vista_pokebola3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pokebola3` AS select `pokebolas`.`id` AS `id`,`entrenadores`.`id` AS `id_entrenador`,`entrenadores`.`nombre` AS `nombre`,`entrenadores`.`apellidos` AS `apellidos`,`entrenadores`.`alias` AS `aliasentrenador`,`catalogo_pokemon`.`especie` AS `especie`,`pokemon`.`id` AS `id_pokemon`,`pokemon`.`alias` AS `aliaspokemon`,`pokemon`.`es_intercambiable` AS `es_intercambiable`,`pokemon`.`sexo` AS `sexo`,`pokemon`.`nivel` AS `nivel`,`pokemon`.`hit_points` AS `hit_points`,`pokemon`.`ataque` AS `ataque`,`pokemon`.`defensa` AS `defensa`,`pokemon`.`velocidad` AS `velocidad`,`pokemon`.`evasion` AS `evasion`,`pokemon`.`prezision` AS `prezision`,`catalogo_estatus`.`nombre` AS `estatus`,`imagenes_pokemon`.`imagen` AS `imagen`,`pokebolas`.`archivada` AS `archivada`,`pokebolas`.`suspendido` AS `suspendido`,`pokemon`.`suspendido` AS `suspendidopokemon` from (((((`pokebolas` join `catalogo_pokemon`) join `pokemon`) join `entrenadores`) join `imagenes_pokemon`) join `catalogo_estatus`) where ((`pokebolas`.`id_entrenador` = `entrenadores`.`id`) and (`pokebolas`.`id_pokemon` = `pokemon`.`id`) and (`pokemon`.`especie` = `catalogo_pokemon`.`id`) and (`imagenes_pokemon`.`id_catalogo_pokemon` = `catalogo_pokemon`.`id`) and (`pokemon`.`estatus` = `catalogo_estatus`.`id`) and (`pokebolas`.`suspendido` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pokemon`
--

/*!50001 DROP TABLE IF EXISTS `vista_pokemon`*/;
/*!50001 DROP VIEW IF EXISTS `vista_pokemon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pokemon` AS select `pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`pokemon`.`alias` AS `alias`,`pokemon`.`suspendido` AS `suspendido` from (`catalogo_pokemon` join `pokemon`) where (`pokemon`.`especie` = `catalogo_pokemon`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pokemondispo`
--

/*!50001 DROP TABLE IF EXISTS `vista_pokemondispo`*/;
/*!50001 DROP VIEW IF EXISTS `vista_pokemondispo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pokemondispo` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie` from `catalogo_pokemon` where (`catalogo_pokemon`.`id` > 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_regeneradores`
--

/*!50001 DROP TABLE IF EXISTS `vista_regeneradores`*/;
/*!50001 DROP VIEW IF EXISTS `vista_regeneradores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_regeneradores` AS select `regeneradores`.`id` AS `id`,`regeneradores`.`slots` AS `slots`,`regeneradores`.`slots_funcionales` AS `slots_funcionales`,`regeneradores`.`esta_mantenimiento` AS `esta_mantenimiento`,`centros_pokemon`.`nombre` AS `nombre`,`regeneradores`.`suspendido` AS `suspendido` from (`regeneradores` join `centros_pokemon`) where (`regeneradores`.`id_centro_pokemon` = `centros_pokemon`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_registroestatus`
--

/*!50001 DROP TABLE IF EXISTS `vista_registroestatus`*/;
/*!50001 DROP VIEW IF EXISTS `vista_registroestatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_registroestatus` AS select `registros`.`id` AS `id`,`registros`.`id_pokebola` AS `id_pokebola`,`registros`.`hit_points` AS `hit_points`,`registros`.`fecha_entrada` AS `fecha_entrada`,`registros`.`estatus` AS `estatus`,`catalogo_estatus`.`nombre` AS `nombre`,`catalogo_estatus`.`tiempo` AS `tiempo`,`catalogo_estatus`.`desaparece_a` AS `desaparece_a` from (`registros` join `catalogo_estatus`) where (`registros`.`estatus` = `catalogo_estatus`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipos`
--

/*!50001 DROP TABLE IF EXISTS `vista_tipos`*/;
/*!50001 DROP VIEW IF EXISTS `vista_tipos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipos` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`catalogo_tipos`.`nombre` AS `tipo` from ((`catalogo_pokemon` join `catalogo_tipos`) join `tipos`) where ((`tipos`.`id_pokemon` = `catalogo_pokemon`.`id`) and (`tipos`.`id_tipo` = `catalogo_tipos`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tiposhabiles`
--

/*!50001 DROP TABLE IF EXISTS `vista_tiposhabiles`*/;
/*!50001 DROP VIEW IF EXISTS `vista_tiposhabiles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tiposhabiles` AS select `catalogo_pokemon`.`id` AS `id`,`catalogo_pokemon`.`especie` AS `especie`,`catalogo_tipos`.`nombre` AS `tipo`,`catalogo_habilidades`.`nombre` AS `habilidad` from ((((`catalogo_pokemon` join `catalogo_tipos`) join `tipos`) join `catalogo_habilidades`) join `habilidades`) where ((`tipos`.`id_pokemon` = `catalogo_pokemon`.`id`) and (`tipos`.`id_tipo` = `catalogo_tipos`.`id`) and (`habilidades`.`id_pokemon` = `catalogo_pokemon`.`id`) and (`habilidades`.`id_habilidad` = `catalogo_habilidades`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-11 10:16:56
