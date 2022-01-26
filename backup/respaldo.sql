-- MySQL dump 10.13  Distrib 8.0.27, for Linux (aarch64)
--
-- Host: localhost    Database: pandora
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.04.1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_cursos`
--

DROP TABLE IF EXISTS `area_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_cursos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `curso_id` bigint unsigned DEFAULT NULL,
  `area_id` bigint unsigned DEFAULT NULL,
  `area_curso` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_cursos_curso_id_foreign` (`curso_id`),
  KEY `area_cursos_area_id_foreign` (`area_id`),
  CONSTRAINT `area_cursos_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_cursos_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_cursos`
--

LOCK TABLES `area_cursos` WRITE;
/*!40000 ALTER TABLE `area_cursos` DISABLE KEYS */;
INSERT INTO `area_cursos` VALUES (1,1,1,'1-1','2022-01-25 09:00:12','2022-01-25 09:00:12');
/*!40000 ALTER TABLE `area_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Lengua Castellana',1,'2022-01-25 08:20:57','2022-01-25 08:20:57'),(2,'Ética',1,'2022-01-25 19:39:46','2022-01-25 19:39:46');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios`
--

DROP TABLE IF EXISTS `cuestionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tema` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `curso_id` bigint unsigned DEFAULT NULL,
  `area_id` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_curso_id_foreign` (`curso_id`),
  CONSTRAINT `cuestionarios_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios`
--

LOCK TABLES `cuestionarios` WRITE;
/*!40000 ALTER TABLE `cuestionarios` DISABLE KEYS */;
INSERT INTO `cuestionarios` VALUES (1,'Prueba Diagnóstica','2022-01-23',1,1,1,1,'2022-01-23 23:13:35','2022-01-24 16:18:18'),(2,'cosas','2022-01-19',1,0,1,1,'2022-01-24 03:33:16','2022-01-24 03:51:14'),(3,'Los elementos de la oracion','2022-01-20',1,1,1,1,'2022-01-25 18:53:32','2022-01-25 18:55:59'),(4,'El ensayo','2022-01-26',1,1,1,1,'2022-01-25 18:56:15','2022-01-25 18:56:15');
/*!40000 ALTER TABLE `cuestionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cursos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'902',1,'2022-01-23 23:13:35',NULL);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `curso_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupos_nombre_unique` (`nombre`),
  KEY `grupos_curso_id_foreign` (`curso_id`),
  CONSTRAINT `grupos_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'grupo 1',1,1,'2022-01-23 23:13:35',NULL),(2,'grupo 2',1,1,'2022-01-23 23:13:35',NULL),(3,'grupo 3',1,1,'2022-01-23 23:13:35',NULL),(4,'grupo 4',1,1,'2022-01-23 23:13:35',NULL),(5,'grupo 5',1,1,'2022-01-23 23:13:35',NULL),(6,'grupo 6',1,1,'2022-01-23 23:13:35',NULL);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

    
        
          
    

        
    
    @@ -207,7 +27,7 @@ CREATE TABLE `migrations` (
  
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--

    
        
          
    

        
    
    @@ -216,328 +36,8 @@ CREATE TABLE `migrations` (
  
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2010_06_26_181817_create_cursos_table',1),(2,'2011_07_26_220138_create_grupos_table',1),(3,'2012_12_16_172925_create_cuestionarios_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_resets_table',1),(6,'2016_06_01_000001_create_oauth_auth_codes_table',1),(7,'2016_06_01_000002_create_oauth_access_tokens_table',1),(8,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(9,'2016_06_01_000004_create_oauth_clients_table',1),(10,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(11,'2019_08_19_000000_create_failed_jobs_table',1),(12,'2021_12_15_045552_create_preguntas_table',1),(13,'2021_12_17_154844_create_opcions_table',1),(14,'2021_12_17_220345_create_respuestas_table',1),(15,'2022_01_23_213343_existe',2),(16,'2022_01_23_213345_faltante',3),(17,'2022_01_24_174837_titulo_pregunta',4),(18,'2022_01_25_015144_create_areas',5),(19,'2022_01_25_015825_create_curso_area',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('03c293d087b8c13c3abc9daa40cea7ff1d408b2a611777a978f6ddd1bfac811e3860bd3d66728502',1,3,'pandora','[]',1,'2022-01-24 16:17:46','2022-01-24 16:17:46','2023-01-24 11:17:46'),('15940072e9626b27140e648c51d7c5843cfeab5de9c8fdb214df7b95b8d89481672709f944aa535e',1,3,'pandora','[]',1,'2022-01-24 08:21:02','2022-01-24 08:21:02','2023-01-24 03:21:02'),('1a973b92f9d55a681c61fcfd2719eceab4b552c62ba29d9d25c88a177430234d11cd5523beb69ec5',1,3,'pandora','[]',1,'2022-01-24 17:17:00','2022-01-24 17:17:00','2023-01-24 12:17:00'),('4d6437364611956d41ccd66623a77541907940910ba8cb6a4d4263b28f179cd8cabc80ec017a17ce',1,3,'pandora','[]',1,'2022-01-25 06:33:05','2022-01-25 06:33:05','2023-01-25 01:33:05'),('4dd3825fafe13357d3e1c2bd2018abf943cdd947c492a396c7068436aabe5722fe1d35b9c51f9c0f',1,3,'pandora','[]',1,'2022-01-25 02:07:39','2022-01-25 02:07:39','2023-01-24 21:07:39'),('68fe1d98527a3a7d9ff472a7251fc90c2a6e4b3895d2d714cf609878355bd9fdde9d83ac4a7af5be',1,3,'pandora','[]',1,'2022-01-24 02:11:01','2022-01-24 02:11:01','2023-01-23 21:11:01'),('9d90093b8aebd57beae76d04c69917057bd2ef1e59a3119b2771b1ff95f5fae7de027f69b4ebe724',1,3,'pandora','[]',1,'2022-01-24 17:10:22','2022-01-24 17:10:22','2023-01-24 12:10:22'),('bd3c38aa4a4a74ab5f90bf1a3aad58bdab874c8e229c07ed7a4ca9c771fce521fa3338ba339cdd91',1,3,'pandora','[]',1,'2022-01-25 06:33:06','2022-01-25 06:33:06','2023-01-25 01:33:06'),('c446e010ffd73272b25f3cbb657e7ef5be6c45c5f3eba07a49e4ad5b2a577add282c315864588ccc',1,3,'pandora','[]',1,'2022-01-24 02:29:55','2022-01-24 02:29:55','2023-01-23 21:29:55'),('c5f95fef164639c049b2763e925831ba4d2abffc74f376056eabeb8bafdeaef868deece6e50ce7f7',1,3,'pandora','[]',1,'2022-01-24 08:10:49','2022-01-24 08:10:49','2023-01-24 03:10:49'),('cedc2884c308e2aba7ecb35a9f2285328c70a526b25ad0545a2beb4d2b2248e03cb8c52f1f7d0bce',1,3,'pandora','[]',1,'2022-01-24 17:12:08','2022-01-24 17:12:08','2023-01-24 12:12:08'),('e1d574b6346fb05c6b262130fc9f4bf7fbf1c175058ebe8596672d6bcdc81c0cf45b710b25ed4e25',1,3,'pandora','[]',0,'2022-01-25 09:27:46','2022-01-25 09:27:46','2023-01-25 04:27:46'),('e833009fef9c6d2b83f98331095d8969b58d8e71f73ab3a17f32fd8e9197684373b87df534ffd5fe',1,3,'pandora','[]',1,'2022-01-24 04:28:37','2022-01-24 04:28:37','2023-01-23 23:28:37'),('ed35f0edd85d75c6731baf3d1881421ce43202af86e15bfe1743ab0de4929780d0bb6feb6a8795a5',1,3,'pandora','[]',1,'2022-01-23 23:15:55','2022-01-23 23:15:55','2023-01-23 18:15:55'),('fcbc19661228e15ae19bf1aa566b41fc8abb9fff314c619fe6027705ed8b4b95499b9600aa9a1f6c',1,3,'pandora','[]',1,'2022-01-24 22:21:05','2022-01-24 22:21:05','2023-01-24 17:21:05'),('ffcee6ded6ed4331620a17de04f0eca9e6a6e16fa2884f6f1c149dde98ed342755ea66a36e4c53f2',1,3,'pandora','[]',1,'2022-01-24 08:25:11','2022-01-24 08:25:11','2023-01-24 03:25:11');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','gmDaadIv1pUjAXQusey3wZp2kDIHruX752bL7FkS',NULL,'http://localhost',1,0,0,'2022-01-23 23:13:57','2022-01-23 23:13:57'),(2,NULL,'Laravel Password Grant Client','gK7lNcVtVHVNUtNPaeqU4z4Lm29A7seV7wXGncQC','users','http://localhost',0,1,0,'2022-01-23 23:13:57','2022-01-23 23:13:57'),(3,NULL,'pandora','iCqMOvof2CsHwxlJFqJx12vysfgcZgaQUYPRZW5z',NULL,'http://localhost',1,0,0,'2022-01-23 23:14:27','2022-01-23 23:14:27');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-01-23 23:13:57','2022-01-23 23:13:57'),(2,3,'2022-01-23 23:14:27','2022-01-23 23:14:27');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcions`
--

DROP TABLE IF EXISTS `opcions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `enunciado` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `letra` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `letraPregunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctoPregunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pregunta_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opcions_pregunta_id_foreign` (`pregunta_id`),
  CONSTRAINT `opcions_pregunta_id_foreign` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcions`
--

LOCK TABLES `opcions` WRITE;
/*!40000 ALTER TABLE `opcions` DISABLE KEYS */;
INSERT INTO `opcions` VALUES (1,'Es un adjetivo',0,'B',1,'B-1','0-1',1,'2022-01-23 23:13:35','2022-01-24 16:21:21'),(2,'Es un sustantivo',0,'A',1,'A-1','-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:37'),(3,'Es un pronombre',0,'D',1,'D-1','0-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:30'),(4,'Es un verbo',1,'C',1,'C-1','1-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:48'),(5,'Salió la e',0,'E',0,'E-1','0-1',1,'2022-01-24 00:26:20','2022-01-24 05:17:25');
/*!40000 ALTER TABLE `opcions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'titulo de pregunta',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enunciado` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuestionario_id` bigint unsigned DEFAULT NULL,
  `valor` int NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preguntas_cuestionario_id_foreign` (`cuestionario_id`),
  CONSTRAINT `preguntas_cuestionario_id_foreign` FOREIGN KEY (`cuestionario_id`) REFERENCES `cuestionarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'Identifica el tipo de palabra',NULL,'<p>Analiza la siguiente oración y dime qué tipo de palabra es la que está subrayada.</p><p></p><p><strong>A Diego le gusta <u>jugar</u> en el parque.</strong></p>',1,5,1,1,0,'2022-01-23 23:13:35','2022-01-25 06:38:15'),(2,'titulo de pregunta','','Hola mundo 2',1,5,1,1,0,'2022-01-23 23:13:35',NULL);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pregunta_id` bigint unsigned DEFAULT NULL,
  `grupo_id` bigint unsigned DEFAULT NULL,
  `opcion_id` bigint unsigned DEFAULT NULL,
  `cuestionario_id` bigint unsigned DEFAULT NULL,
  `puntaje` int NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `grupoPregunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respuestas_pregunta_id_foreign` (`pregunta_id`),
  KEY `respuestas_grupo_id_foreign` (`grupo_id`),
  KEY `respuestas_opcion_id_foreign` (`opcion_id`),
  KEY `respuestas_cuestionario_id_foreign` (`cuestionario_id`),
  CONSTRAINT `respuestas_cuestionario_id_foreign` FOREIGN KEY (`cuestionario_id`) REFERENCES `cuestionarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `respuestas_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `respuestas_opcion_id_foreign` FOREIGN KEY (`opcion_id`) REFERENCES `opcions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `respuestas_pregunta_id_foreign` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,1,1,1,1,0,1,'1-1','2022-01-23 23:13:35.814716',NULL),(2,1,2,1,1,0,1,'2-1','2022-01-23 23:13:35.814632',NULL),(3,1,3,1,1,8,1,'3-2','2022-01-23 23:13:35.814640',NULL);
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `curso_id` bigint unsigned DEFAULT NULL,
  `grupo_id` bigint unsigned DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_curso_id_foreign` (`curso_id`),
  KEY `users_grupo_id_foreign` (`grupo_id`),
  CONSTRAINT `users_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rubén Darío Villamil Zamora','001','admin',1,1,1,'rubenphii@gmail.com',NULL,'$2y$10$FlYImAOZfZf5rOg2/L66ieLKBgFXpPRPshIfxfxZdWI7rl9SIrs5e',NULL,'2022-01-23 23:13:36',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

    
        
          
    

        
    
    @@ -548,4 +48,4 @@ UNLOCK TABLES;
  
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
