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
  `area_curso` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_cursos_curso_id_foreign` (`curso_id`),
  KEY `area_cursos_area_id_foreign` (`area_id`),
  CONSTRAINT `area_cursos_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_cursos_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_cursos`
--

LOCK TABLES `area_cursos` WRITE;
/*!40000 ALTER TABLE `area_cursos` DISABLE KEYS */;
INSERT INTO `area_cursos` VALUES (1,1,1,'1-1','2022-01-25 09:00:12','2022-01-25 09:00:12'),(2,2,1,'1-2','2022-01-27 04:44:38','2022-01-27 04:44:38'),(3,1,2,'2-1','2022-01-27 06:28:01','2022-01-27 06:28:01');
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
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tema` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios`
--

LOCK TABLES `cuestionarios` WRITE;
/*!40000 ALTER TABLE `cuestionarios` DISABLE KEYS */;
INSERT INTO `cuestionarios` VALUES (1,'Prueba Diagnóstica','2022-01-23',1,1,1,1,'2022-01-23 23:13:35','2022-01-24 16:18:18'),(2,'cosas','2022-01-19',1,0,1,1,'2022-01-24 03:33:16','2022-01-24 03:51:14'),(3,'Los elementos de la oracion','2022-01-20',1,1,1,1,'2022-01-25 18:53:32','2022-01-25 18:55:59'),(4,'El ensayo','2022-01-26',1,1,1,1,'2022-01-25 18:56:15','2022-01-25 18:56:15'),(5,'Cuestionario Inicial','2022-01-27',1,1,2,1,'2022-01-27 05:38:47','2022-01-27 05:38:47'),(6,'cuestionario prueba','2022-01-27',1,0,2,1,'2022-01-27 06:34:16','2022-01-27 06:34:28');
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
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cursos_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'902',1,'2022-01-23 23:13:35',NULL),(2,'901',1,'2022-01-27 04:40:43','2022-01-27 04:40:43');
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
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `curso_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grupos_curso_id_foreign` (`curso_id`),
  CONSTRAINT `grupos_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'grupo 1',1,1,'2022-01-23 23:13:35',NULL),(2,'grupo 2',1,1,'2022-01-23 23:13:35',NULL),(3,'grupo 3',1,1,'2022-01-23 23:13:35',NULL),(4,'grupo 4',1,1,'2022-01-23 23:13:35',NULL),(5,'grupo 5',1,1,'2022-01-23 23:13:35',NULL),(6,'grupo 6',1,1,'2022-01-23 23:13:35',NULL),(9,'grupo 1',1,2,'2022-01-27 05:20:42','2022-01-27 05:20:42'),(10,'grupo 2',1,2,'2022-01-27 05:21:00','2022-01-27 05:21:00'),(11,'grupo 3',1,2,'2022-01-27 05:21:06','2022-01-27 05:21:06'),(12,'grupo 4',1,2,'2022-01-27 05:21:10','2022-01-27 05:21:10'),(13,'grupo 5',1,2,'2022-01-27 05:26:28','2022-01-27 05:26:28'),(14,'grupo 6',1,2,'2022-01-27 05:26:31','2022-01-27 05:26:31'),(15,'grupo 7',1,2,'2022-01-27 05:26:37','2022-01-27 05:26:37'),(16,'grupo 8',1,2,'2022-01-27 05:26:40','2022-01-27 05:26:40'),(17,'grupo 9',1,2,'2022-01-27 05:26:43','2022-01-27 05:26:43'),(18,'grupo 10',1,2,'2022-01-27 05:26:46','2022-01-27 05:26:46');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
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
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `oauth_access_tokens` VALUES ('03c293d087b8c13c3abc9daa40cea7ff1d408b2a611777a978f6ddd1bfac811e3860bd3d66728502',1,3,'pandora','[]',1,'2022-01-24 16:17:46','2022-01-24 16:17:46','2023-01-24 11:17:46'),('09ed7c7b91bc0dffe23571318069dcae3cf42d7770d151dfd1aa9ad36c21052c054bc22aef72f7c0',1,3,'pandora','[]',1,'2022-01-27 19:12:01','2022-01-27 19:12:01','2023-01-27 14:12:01'),('1108dd94575bd22c4ea74931a091fdce1008b3197575cf8388ecb1ba7be45d8ffb237a9d6030f43b',1,3,'pandora','[]',1,'2022-01-27 04:54:41','2022-01-27 04:54:41','2023-01-26 23:54:41'),('15940072e9626b27140e648c51d7c5843cfeab5de9c8fdb214df7b95b8d89481672709f944aa535e',1,3,'pandora','[]',1,'2022-01-24 08:21:02','2022-01-24 08:21:02','2023-01-24 03:21:02'),('1a6da22001dc5ff3bd8b790d7ddd17143951e0009909e101d392cc49176acf85e137052294f30e04',11,3,'pandora','[]',1,'2022-01-27 17:34:40','2022-01-27 17:34:40','2023-01-27 12:34:40'),('1a973b92f9d55a681c61fcfd2719eceab4b552c62ba29d9d25c88a177430234d11cd5523beb69ec5',1,3,'pandora','[]',1,'2022-01-24 17:17:00','2022-01-24 17:17:00','2023-01-24 12:17:00'),('1e151abac4332414f1346d8ab3e5e69b8d32d5cf1cadc855f49ebd004d18c01df0b50b0992371023',7,3,'pandora','[]',0,'2022-01-27 17:34:12','2022-01-27 17:34:12','2023-01-27 12:34:12'),('2323ffe2189ddd41f7a1f6035fe953b2e4542558752b8d3e000c4afc33a8c6c086963a7d4be7dcf2',11,3,'pandora','[]',0,'2022-01-27 17:37:32','2022-01-27 17:37:32','2023-01-27 12:37:32'),('25b045728cafda813ada4bfcf4c89a12172cf9470ebcfa0bc0cfc0ed80f24a03144d8da4a377cbed',2,3,'pandora','[]',1,'2022-01-27 08:26:52','2022-01-27 08:26:52','2023-01-27 03:26:52'),('2965e950a36e1be5f4143550c759f28987daf9666289eecb61ea3e7b960a1b7c660760b9a27cbf50',11,3,'pandora','[]',1,'2022-01-27 17:36:41','2022-01-27 17:36:41','2023-01-27 12:36:41'),('29e30b16d8310e13c66359acca69b6fe3f2474d66be56cbd11815b5d64271d1fbf500b7dac675975',1,3,'pandora','[]',1,'2022-01-27 19:50:42','2022-01-27 19:50:42','2023-01-27 14:50:42'),('2b1f07d98077a248e3c605dea9eaf5d4df875c5327d14f310b6894cf597031a95aad36eeea0e5c6b',8,3,'pandora','[]',0,'2022-01-27 17:34:20','2022-01-27 17:34:20','2023-01-27 12:34:20'),('2cf48ed0f573b3b9b0ae4a22e5a8a14009372e3c3565941c0c50d5b4b35c7c0b3b3d74da979ecff3',9,3,'pandora','[]',0,'2022-01-27 17:35:03','2022-01-27 17:35:03','2023-01-27 12:35:03'),('34b749bbca639390bce12ee62b2ac7f52f65e62b3ad61b70d40081150dfe3293393c0ef8b1841f16',1,3,'pandora','[]',1,'2022-01-27 04:15:00','2022-01-27 04:15:00','2023-01-26 23:15:00'),('35735e08f857570f333bb3db9567341c2aad512bdfd0929a078b9aaa68065518e4e35ab013c06c84',1,3,'pandora','[]',1,'2022-01-27 19:49:07','2022-01-27 19:49:07','2023-01-27 14:49:07'),('398f81c5f8980a3578d79dd1c3dd0ff8e765a639d3c5ae6301a336d52cf7838beb75b66e3d3ae8fd',1,3,'pandora','[]',1,'2022-01-27 19:54:14','2022-01-27 19:54:14','2023-01-27 14:54:14'),('3b3ebd60c092342a025d26060802ae8629068f91f0afbbc9bf7002a55ab01f3eec507f707b140a78',1,3,'pandora','[]',1,'2022-01-27 08:14:01','2022-01-27 08:14:01','2023-01-27 03:14:01'),('3ffab83b1f9eab52c859380a8c3e00c042bcee7aec01ae6660bdeb7fe2b828c47df920fa4d5ea204',2,3,'pandora','[]',1,'2022-01-27 09:08:07','2022-01-27 09:08:07','2023-01-27 04:08:07'),('420fe308a65d68f839b5883a6e51e399d568a01dd93e8992aa9acd7b56a8cc3745aae9d26f692b40',1,3,'pandora','[]',1,'2022-01-27 08:12:55','2022-01-27 08:12:55','2023-01-27 03:12:55'),('44447ceeb4f86ddeb3739b05eb7cff4bcfea9af6f234c1514e5fc9210e33fcd6bd758d2b86fe53ce',3,3,'pandora','[]',1,'2022-01-27 08:49:20','2022-01-27 08:49:20','2023-01-27 03:49:20'),('448d51d1ededc87a70bf05a3cd794b3aec11a9237fd0dbadc774890456e034214bcede03c119c37b',2,3,'pandora','[]',1,'2022-01-27 08:15:31','2022-01-27 08:15:31','2023-01-27 03:15:31'),('49fdc75c1f660fe963958ab88a708bce77f99ae00810aca5fe466f728a3f5be8483baf5a908f03ed',2,3,'pandora','[]',1,'2022-01-27 05:38:02','2022-01-27 05:38:02','2023-01-27 00:38:02'),('4d6437364611956d41ccd66623a77541907940910ba8cb6a4d4263b28f179cd8cabc80ec017a17ce',1,3,'pandora','[]',1,'2022-01-25 06:33:05','2022-01-25 06:33:05','2023-01-25 01:33:05'),('4dd3825fafe13357d3e1c2bd2018abf943cdd947c492a396c7068436aabe5722fe1d35b9c51f9c0f',1,3,'pandora','[]',1,'2022-01-25 02:07:39','2022-01-25 02:07:39','2023-01-24 21:07:39'),('53857de62c9585b61dbd3bc893e7091cef398be77d45523609c06569b1d9b0baf7d6b6ed1a14560e',3,3,'pandora','[]',0,'2022-01-27 17:33:56','2022-01-27 17:33:56','2023-01-27 12:33:56'),('61632e3c94c22d423e18c8f4c07a874e373009c526eace71cb84d6feb630856898181091ad69940b',2,3,'pandora','[]',1,'2022-01-27 17:34:45','2022-01-27 17:34:45','2023-01-27 12:34:45'),('68fe1d98527a3a7d9ff472a7251fc90c2a6e4b3895d2d714cf609878355bd9fdde9d83ac4a7af5be',1,3,'pandora','[]',1,'2022-01-24 02:11:01','2022-01-24 02:11:01','2023-01-23 21:11:01'),('6923320c87264f04256bfc2a2572237209bb0c2357cbd008f4fea377855a2d4384ac22a653df0089',1,3,'pandora','[]',1,'2022-01-27 19:18:02','2022-01-27 19:18:02','2023-01-27 14:18:02'),('80ab7b6778ea9d54a5b55db7368dba4af49ccd22d7dcfb41f9190095996d47fd5d80b291b4db61af',2,3,'pandora','[]',0,'2022-01-27 20:05:41','2022-01-27 20:05:41','2023-01-27 15:05:41'),('88981c4551aefdb974b247eeb7e403bee7e5be3e4fbe4c98bb23fea8818bb892f30652fdbe41aa58',2,3,'pandora','[]',1,'2022-01-27 08:59:55','2022-01-27 08:59:55','2023-01-27 03:59:55'),('89510c9af7e71d3cbec4e128f32065d3ea6429cfa42fd888cab1e596f964ce68f8aca6e01f63cccc',11,3,'pandora','[]',1,'2022-01-27 17:35:44','2022-01-27 17:35:44','2023-01-27 12:35:44'),('8dd0dde1a6117b58c18a32ba17bcd3c1f7b0e5349064595265a5da1a585e630d5f3fc99548c21207',1,3,'pandora','[]',1,'2022-01-27 09:00:06','2022-01-27 09:00:06','2023-01-27 04:00:06'),('9bb18d29f2b4fd5232ddd2e3accda08929ac11a184af293da5c5e8fbc54149da4f9ffb3be80d48a5',1,3,'pandora','[]',1,'2022-01-27 08:14:02','2022-01-27 08:14:02','2023-01-27 03:14:02'),('9d90093b8aebd57beae76d04c69917057bd2ef1e59a3119b2771b1ff95f5fae7de027f69b4ebe724',1,3,'pandora','[]',1,'2022-01-24 17:10:22','2022-01-24 17:10:22','2023-01-24 12:10:22'),('9f5562bd53355343d48b0c953da803db31357f406aacd7e4a15f0bb70358cddf109f3979585bc388',4,3,'pandora','[]',0,'2022-01-27 17:34:18','2022-01-27 17:34:18','2023-01-27 12:34:18'),('a642e187aa2069d821753b4d3d4a796813615f89b10903ba58fa008ea22c7094eaa6c8ff4fd949b8',6,3,'pandora','[]',0,'2022-01-27 17:33:46','2022-01-27 17:33:46','2023-01-27 12:33:46'),('aa1e5b0011d720228cbf146313cb8f7a70a3045443f7e8610dfb92232c61d73ad6f703929490340e',3,3,'pandora','[]',1,'2022-01-27 08:50:00','2022-01-27 08:50:00','2023-01-27 03:50:00'),('ab4e2cf157487021aec1bfc8806110024d6779f9a44e2e1b08758a3808377a42bcf257bd6afada9b',7,3,'pandora','[]',1,'2022-01-27 17:34:11','2022-01-27 17:34:11','2023-01-27 12:34:11'),('b0cd0d9ff93aa9adff4e72b72b24145618dbf6f87256d6a5279486dea81dba21472e6e0a258ecbb5',2,3,'pandora','[]',1,'2022-01-27 08:49:35','2022-01-27 08:49:35','2023-01-27 03:49:35'),('b302cc65ce905f301ecd494c92840ed57f409969bc852f4132e075d7c5b4f317d96640ee8f934d84',2,3,'pandora','[]',1,'2022-01-27 08:59:24','2022-01-27 08:59:24','2023-01-27 03:59:24'),('b99197b2fbb3de2de4a49728b2a25075020179b3c68ed5608d62f7bca22c3c53798fc80499242f03',2,3,'pandora','[]',1,'2022-01-27 19:14:21','2022-01-27 19:14:21','2023-01-27 14:14:21'),('bd3c38aa4a4a74ab5f90bf1a3aad58bdab874c8e229c07ed7a4ca9c771fce521fa3338ba339cdd91',1,3,'pandora','[]',1,'2022-01-25 06:33:06','2022-01-25 06:33:06','2023-01-25 01:33:06'),('c446e010ffd73272b25f3cbb657e7ef5be6c45c5f3eba07a49e4ad5b2a577add282c315864588ccc',1,3,'pandora','[]',1,'2022-01-24 02:29:55','2022-01-24 02:29:55','2023-01-23 21:29:55'),('c5f95fef164639c049b2763e925831ba4d2abffc74f376056eabeb8bafdeaef868deece6e50ce7f7',1,3,'pandora','[]',1,'2022-01-24 08:10:49','2022-01-24 08:10:49','2023-01-24 03:10:49'),('cedc2884c308e2aba7ecb35a9f2285328c70a526b25ad0545a2beb4d2b2248e03cb8c52f1f7d0bce',1,3,'pandora','[]',1,'2022-01-24 17:12:08','2022-01-24 17:12:08','2023-01-24 12:12:08'),('d32fdb933b034c3c910c487337260e9e4a7ab13a1158435f3bab507661428490d2f51a6aecac7c40',10,3,'pandora','[]',0,'2022-01-27 17:35:06','2022-01-27 17:35:06','2023-01-27 12:35:06'),('dbbee0c37c4c3f271a4deec4bb6fcb754ddc5d108ca074cbfd1d544cc80c783b353d1b84d5bb239a',1,3,'pandora','[]',0,'2022-01-27 21:25:21','2022-01-27 21:25:21','2023-01-27 16:25:21'),('dd62874526276c76ed74c9a9590276dbe087a28d9ee9f0c75d9fe170a243e17297434f23497e0967',1,3,'pandora','[]',1,'2022-01-27 08:53:23','2022-01-27 08:53:23','2023-01-27 03:53:23'),('e1d574b6346fb05c6b262130fc9f4bf7fbf1c175058ebe8596672d6bcdc81c0cf45b710b25ed4e25',1,3,'pandora','[]',1,'2022-01-25 09:27:46','2022-01-25 09:27:46','2023-01-25 04:27:46'),('e833009fef9c6d2b83f98331095d8969b58d8e71f73ab3a17f32fd8e9197684373b87df534ffd5fe',1,3,'pandora','[]',1,'2022-01-24 04:28:37','2022-01-24 04:28:37','2023-01-23 23:28:37'),('ea1d0679155513e2aabdd00aee65be2a7568d56d71015ce1bfac91106421073204c8ff1d3a3c10bd',2,3,'pandora','[]',1,'2022-01-27 08:45:32','2022-01-27 08:45:32','2023-01-27 03:45:32'),('ed35f0edd85d75c6731baf3d1881421ce43202af86e15bfe1743ab0de4929780d0bb6feb6a8795a5',1,3,'pandora','[]',1,'2022-01-23 23:15:55','2022-01-23 23:15:55','2023-01-23 18:15:55'),('f658de7fa2387c3efae69bb1febc4d9bd0e163945914908637c318c71f81c6b6e80402778ca0475e',1,3,'pandora','[]',1,'2022-01-27 04:38:06','2022-01-27 04:38:06','2023-01-26 23:38:06'),('fa1486573ac3de3deeb636eea8d160ecde0292623a37b53a0572aceaeecead4032bcd8b052f88eff',2,3,'pandora','[]',1,'2022-01-27 08:59:30','2022-01-27 08:59:30','2023-01-27 03:59:30'),('fbf5eb89428417ea4a3e4746e711e85e6d6a7ebb7199e778c1eb4b76457f159236aed4c35a45334b',1,3,'pandora','[]',1,'2022-01-27 04:41:22','2022-01-27 04:41:22','2023-01-26 23:41:22'),('fcbc19661228e15ae19bf1aa566b41fc8abb9fff314c619fe6027705ed8b4b95499b9600aa9a1f6c',1,3,'pandora','[]',1,'2022-01-24 22:21:05','2022-01-24 22:21:05','2023-01-24 17:21:05'),('ffcee6ded6ed4331620a17de04f0eca9e6a6e16fa2884f6f1c149dde98ed342755ea66a36e4c53f2',1,3,'pandora','[]',1,'2022-01-24 08:25:11','2022-01-24 08:25:11','2023-01-24 03:25:11');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `enunciado` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `letra` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `letraPregunta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctoPregunta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pregunta_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opcions_pregunta_id_foreign` (`pregunta_id`),
  CONSTRAINT `opcions_pregunta_id_foreign` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcions`
--

LOCK TABLES `opcions` WRITE;
/*!40000 ALTER TABLE `opcions` DISABLE KEYS */;
INSERT INTO `opcions` VALUES (1,'Es un adjetivo',0,'B',1,'B-1','0-1',1,'2022-01-23 23:13:35','2022-01-24 16:21:21'),(2,'Es un sustantivo',0,'A',1,'A-1','-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:37'),(3,'Es un pronombre',0,'D',1,'D-1','0-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:30'),(4,'Es un verbo',1,'C',1,'C-1','1-1',1,'2022-01-23 23:13:35','2022-01-24 16:22:48'),(5,'Salió la e',0,'E',0,'E-1','0-1',1,'2022-01-24 00:26:20','2022-01-24 05:17:25'),(6,'Un Verbo',1,'A',1,'A-3','1-3',3,'2022-01-27 07:35:28','2022-01-27 07:35:28'),(7,'Un adjetivo',0,'C',1,'C-3','0-3',3,'2022-01-27 07:35:46','2022-01-27 07:35:46'),(8,'Un sustantivo',0,'D',1,'D-3','0-3',3,'2022-01-27 07:36:13','2022-01-27 07:36:13'),(9,'Un pronombre',0,'B',1,'B-3','0-3',3,'2022-01-27 07:36:37','2022-01-27 07:36:37'),(10,'Un verbo',0,'A',1,'A-4','0-4',4,'2022-01-27 09:03:34','2022-01-27 09:03:34'),(11,'Un sustantivo',0,'B',1,'B-4','0-4',4,'2022-01-27 09:03:50','2022-01-27 09:03:50'),(12,'Un adjetivo',1,'C',1,'C-4','1-4',4,'2022-01-27 09:04:09','2022-01-27 09:04:38'),(13,'Un pronombre',0,'D',1,'D-4','0-4',4,'2022-01-27 09:04:27','2022-01-27 09:04:27'),(14,'Yiyeimy tiene un carro caro',0,'A',1,'A-5','0-5',5,'2022-01-27 09:09:35','2022-01-27 09:09:35'),(15,'Frederick disfruta de las fresas dulces',0,'B',1,'B-5','0-5',5,'2022-01-27 09:10:00','2022-01-27 09:10:00'),(16,'Chiriley come pan seco porque no tiene dinero',0,'C',1,'C-5','0-5',5,'2022-01-27 09:10:44','2022-01-27 09:10:44'),(17,'Liderney estudia mucho todos los dias en su casa',1,'D',1,'D-5','1-5',5,'2022-01-27 09:11:08','2022-01-27 09:11:48'),(18,'perro, mesa, suelo',0,'A',1,'A-6','0-6',6,'2022-01-27 15:43:56','2022-01-27 15:45:53'),(19,'puerta, ventana, licuadora',0,'B',1,'B-6','0-6',6,'2022-01-27 15:44:30','2022-01-27 15:44:30'),(20,'correr, cantar, jugar',1,'C',1,'C-6','1-6',6,'2022-01-27 15:45:04','2022-01-27 15:45:04'),(21,'caja, tienda, armario',0,'D',1,'D-6','0-6',6,'2022-01-27 15:45:31','2022-01-27 15:45:31'),(22,'Verbos',1,'A',1,'A-7','1-7',7,'2022-01-27 15:52:18','2022-01-27 15:52:18'),(23,'Adjetivos',0,'B',1,'B-7','0-7',7,'2022-01-27 15:52:30','2022-01-27 15:52:30'),(24,'Sustantivos',0,'C',1,'C-7','0-7',7,'2022-01-27 15:52:46','2022-01-27 15:52:46'),(25,'Pronombres',0,'D',1,'D-7','0-7',7,'2022-01-27 15:53:05','2022-01-27 15:53:05'),(26,'un verbo, un adjetivo y un pronombre.',0,'A',1,'A-8','0-8',8,'2022-01-27 16:08:52','2022-01-27 16:08:52'),(27,'un adjetivo, un pronombre, un verbo',1,'B',1,'B-8','1-8',8,'2022-01-27 16:09:36','2022-01-27 16:11:10'),(28,'un pronombre, un verbo, un adjetivo',0,'C',1,'C-8','0-8',8,'2022-01-27 16:10:03','2022-01-27 16:10:03'),(29,'un adjetivo, un verbo, un pronombre',0,'D',1,'D-8','0-8',8,'2022-01-27 16:10:50','2022-01-27 16:10:50'),(30,'Prueba de respuesta',1,'A',1,'A-9','1-9',9,'2022-01-27 19:13:49','2022-01-27 20:04:06'),(31,'Un Verbo',1,'A',1,'A-31','1-31',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(32,'Un adjetivo',0,'C',1,'C-31','0-31',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(33,'Un sustantivo',0,'D',1,'D-31','0-31',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(34,'Un pronombre',0,'B',1,'B-31','0-31',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(35,'Un verbo',0,'A',1,'A-32','0-32',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(36,'Un sustantivo',0,'B',1,'B-32','0-32',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(37,'Un adjetivo',1,'C',1,'C-32','1-32',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(38,'Un pronombre',0,'D',1,'D-32','0-32',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(39,'Yiyeimy tiene un carro caro',0,'A',1,'A-33','0-33',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(40,'Frederick disfruta de las fresas dulces',0,'B',1,'B-33','0-33',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(41,'Chiriley come pan seco porque no tiene dinero',0,'C',1,'C-33','0-33',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(42,'Liderney estudia mucho todos los dias en su casa',1,'D',1,'D-33','1-33',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(43,'perro, mesa, suelo',0,'A',1,'A-34','0-34',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(44,'puerta, ventana, licuadora',0,'B',1,'B-34','0-34',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(45,'correr, cantar, jugar',1,'C',1,'C-34','1-34',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(46,'caja, tienda, armario',0,'D',1,'D-34','0-34',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(47,'Verbos',1,'A',1,'A-35','1-35',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(48,'Adjetivos',0,'B',1,'B-35','0-35',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(49,'Sustantivos',0,'C',1,'C-35','0-35',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(50,'Pronombres',0,'D',1,'D-35','0-35',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(51,'un verbo, un adjetivo y un pronombre.',0,'A',1,'A-36','0-36',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(52,'un adjetivo, un pronombre, un verbo',1,'B',1,'B-36','1-36',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(53,'un pronombre, un verbo, un adjetivo',0,'C',1,'C-36','0-36',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(54,'un adjetivo, un verbo, un pronombre',0,'D',1,'D-36','0-36',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(55,'Prueba de respuesta',1,'A',1,'A-37','1-37',NULL,'2022-01-27 22:47:05','2022-01-27 22:47:05'),(56,'Un Verbo',1,'A',1,'A-38','1-38',38,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(57,'Un adjetivo',0,'C',1,'C-38','0-38',38,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(58,'Un sustantivo',0,'D',1,'D-38','0-38',38,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(59,'Un pronombre',0,'B',1,'B-38','0-38',38,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(60,'Un verbo',0,'A',1,'A-39','0-39',39,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(61,'Un sustantivo',0,'B',1,'B-39','0-39',39,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(62,'Un adjetivo',1,'C',1,'C-39','1-39',39,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(63,'Un pronombre',0,'D',1,'D-39','0-39',39,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(64,'Yiyeimy tiene un carro caro',0,'A',1,'A-40','0-40',40,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(65,'Frederick disfruta de las fresas dulces',0,'B',1,'B-40','0-40',40,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(66,'Chiriley come pan seco porque no tiene dinero',0,'C',1,'C-40','0-40',40,'2022-01-27 22:52:31','2022-01-27 22:52:31'),(67,'Liderney estudia mucho todos los dias en su casa',1,'D',1,'D-40','1-40',40,'2022-01-27 22:52:31','2022-01-27 22:52:31'),(68,'perro, mesa, suelo',0,'A',1,'A-41','0-41',41,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(69,'puerta, ventana, licuadora',0,'B',1,'B-41','0-41',41,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(70,'correr, cantar, jugar',1,'C',1,'C-41','1-41',41,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(71,'caja, tienda, armario',0,'D',1,'D-41','0-41',41,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(72,'Verbos',1,'A',1,'A-42','1-42',42,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(73,'Adjetivos',0,'B',1,'B-42','0-42',42,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(74,'Sustantivos',0,'C',1,'C-42','0-42',42,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(75,'Pronombres',0,'D',1,'D-42','0-42',42,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(76,'un verbo, un adjetivo y un pronombre.',0,'A',1,'A-43','0-43',43,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(77,'un adjetivo, un pronombre, un verbo',1,'B',1,'B-43','1-43',43,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(78,'un pronombre, un verbo, un adjetivo',0,'C',1,'C-43','0-43',43,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(79,'un adjetivo, un verbo, un pronombre',0,'D',1,'D-43','0-43',43,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(80,'Prueba de respuesta',1,'A',1,'A-44','1-44',44,'2022-01-27 22:52:32','2022-01-27 22:52:32');
/*!40000 ALTER TABLE `opcions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `titulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'titulo de pregunta',
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enunciado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'Identifica el tipo de palabra',NULL,'<p>Analiza la siguiente oración y dime qué tipo de palabra es la que está subrayada.</p><p></p><p><strong>A Diego le gusta <u>jugar</u> en el parque.</strong></p>',1,5,1,1,0,'2022-01-23 23:13:35','2022-01-25 06:38:15'),(2,'titulo de pregunta','','Hola mundo 2',1,5,1,1,0,'2022-01-23 23:13:35',NULL),(3,'Primera Pregunta',NULL,'<p>Lee la siguiente oración</p><p></p><p><strong>A juanita le <u>robaron </u>el bolso en la calle</strong></p><p></p><p>La palabra subrayada es:</p>',5,5,1,1,0,'2022-01-27 07:35:02','2022-01-27 09:08:38'),(4,'Segunda Pregunta',NULL,'<p>A Ernesto le gustan las chicas _______ porque le da pena salir con alguien más alto que él.</p><p>En el espacio en blanco debería ir:</p>',5,5,1,1,0,'2022-01-27 09:03:08','2022-01-27 17:45:32'),(5,'Tercera pregunta',NULL,'<p>De las siguientes oraciones una <strong>no</strong> tiene adjetivos</p>',5,8,1,1,0,'2022-01-27 09:06:52','2022-01-27 17:50:19'),(6,'Cuarta Pregunta',NULL,'<p>Analice las 4 listas de palabras, observe qué tienen en común y cuál está fuera de lugar. Es decir identifique la respuesta que no corresponde</p>',5,8,1,1,0,'2022-01-27 15:43:25','2022-01-27 17:52:17'),(7,'Quinta Pregunta',NULL,'<p>Miedo al <strong>ver</strong> a Bruno <strong>balbuceando</strong> y <strong>tropezando</strong></p><p>Siempre lo recuerdo <strong>murmurando</strong> y <strong>farfullando</strong></p><p>Su sonido es como la arena al <strong>resbalar. 🎶🎶</strong></p><p></p><p>Las palabras resaltadas son:</p>',5,5,1,1,0,'2022-01-27 15:51:58','2022-01-27 17:56:08'),(8,'Sexta pregunta','fotografias/1643281644.jpg','<p>En la frase</p><p><strong>Dolores es muy <u>chismosa</u>, <u>ella</u> <u>escucha</u> hasta el sonido de una aguja.</strong></p><p>Las palabras subrayadas son:</p>',5,7,1,1,0,'2022-01-27 16:07:24','2022-01-27 17:58:31'),(9,'Séptima pregunta',NULL,'<h6><strong>Borrador de pregunta</strong></h6>',5,6,1,1,1,'2022-01-27 19:13:32','2022-01-27 20:06:46'),(38,'Primera Pregunta',NULL,'<p>Lee la siguiente oración</p><p></p><p><strong>A juanita le <u>robaron </u>el bolso en la calle</strong></p><p></p><p>La palabra subrayada es:</p>',2,5,1,1,0,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(39,'Segunda Pregunta',NULL,'<p>A Ernesto le gustan las chicas _______ porque le da pena salir con alguien más alto que él.</p><p>En el espacio en blanco debería ir:</p>',2,5,1,1,0,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(40,'Tercera pregunta',NULL,'<p>De las siguientes oraciones una <strong>no</strong> tiene adjetivos</p>',2,8,1,1,0,'2022-01-27 22:52:30','2022-01-27 22:52:30'),(41,'Cuarta Pregunta',NULL,'<p>Analice las 4 listas de palabras, observe qué tienen en común y cuál está fuera de lugar. Es decir identifique la respuesta que no corresponde</p>',2,8,1,1,0,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(42,'Quinta Pregunta',NULL,'<p>Miedo al <strong>ver</strong> a Bruno <strong>balbuceando</strong> y <strong>tropezando</strong></p><p>Siempre lo recuerdo <strong>murmurando</strong> y <strong>farfullando</strong></p><p>Su sonido es como la arena al <strong>resbalar. 🎶🎶</strong></p><p></p><p>Las palabras resaltadas son:</p>',2,5,1,1,0,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(43,'Sexta pregunta',NULL,'<p>En la frase</p><p><strong>Dolores es muy <u>chismosa</u>, <u>ella</u> <u>escucha</u> hasta el sonido de una aguja.</strong></p><p>Las palabras subrayadas son:</p>',2,7,1,1,0,'2022-01-27 22:52:32','2022-01-27 22:52:32'),(44,'Séptima pregunta',NULL,'<h6><strong>Borrador de pregunta</strong></h6>',2,6,1,1,1,'2022-01-27 22:52:32','2022-01-27 22:52:32');
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
  `grupoPregunta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (13,3,10,6,5,8,1,'10-3','2022-01-27 17:37:39.667822','2022-01-27 17:37:39.667822'),(14,3,9,7,5,0,1,'9-3','2022-01-27 17:37:47.868329','2022-01-27 17:37:47.868329'),(15,3,17,9,5,0,1,'17-3','2022-01-27 17:37:48.080027','2022-01-27 17:37:48.080027'),(16,3,14,6,5,5,1,'14-3','2022-01-27 17:38:28.159449','2022-01-27 17:38:28.159449'),(17,3,16,6,5,5,1,'16-3','2022-01-27 17:38:32.708819','2022-01-27 17:38:32.708819'),(18,3,18,6,5,5,1,'18-3','2022-01-27 17:38:32.710617','2022-01-27 17:38:32.710617'),(19,3,11,6,5,5,1,'11-3','2022-01-27 17:38:50.181352','2022-01-27 17:38:50.181352'),(20,3,13,6,5,5,1,'13-3','2022-01-27 17:39:24.633464','2022-01-27 17:39:24.633464'),(21,4,18,12,5,8,1,'18-4','2022-01-27 17:46:53.692706','2022-01-27 17:46:53.692706'),(22,4,16,13,5,0,1,'16-4','2022-01-27 17:46:54.583215','2022-01-27 17:46:54.583215'),(23,4,10,12,5,5,1,'10-4','2022-01-27 17:46:59.245227','2022-01-27 17:46:59.245227'),(24,4,11,11,5,0,1,'11-4','2022-01-27 17:47:02.883234','2022-01-27 17:47:02.883234'),(25,4,13,12,5,5,1,'13-4','2022-01-27 17:47:16.208078','2022-01-27 17:47:16.208078'),(26,4,9,12,5,5,1,'9-4','2022-01-27 17:47:49.762880','2022-01-27 17:47:49.762880'),(27,4,14,12,5,5,1,'14-4','2022-01-27 17:48:29.185106','2022-01-27 17:48:29.185106'),(28,4,14,12,5,5,1,'14-4','2022-01-27 17:48:29.187062','2022-01-27 17:48:29.187062'),(29,4,17,12,5,5,1,'17-4','2022-01-27 17:49:10.414361','2022-01-27 17:49:10.414361'),(30,5,18,16,5,0,1,'18-5','2022-01-27 17:50:36.859545','2022-01-27 17:50:36.859545'),(31,5,11,15,5,0,1,'11-5','2022-01-27 17:50:40.635876','2022-01-27 17:50:40.635876'),(32,5,10,17,5,12,1,'10-5','2022-01-27 17:50:40.647247','2022-01-27 17:50:40.647247'),(33,5,10,17,5,12,1,'10-5','2022-01-27 17:50:40.648418','2022-01-27 17:50:40.648418'),(34,5,17,17,5,8,1,'17-5','2022-01-27 17:50:44.150584','2022-01-27 17:50:44.150584'),(35,5,13,17,5,8,1,'13-5','2022-01-27 17:50:55.892434','2022-01-27 17:50:55.892434'),(36,5,14,15,5,0,1,'14-5','2022-01-27 17:50:59.213568','2022-01-27 17:50:59.213568'),(37,5,9,14,5,0,1,'9-5','2022-01-27 17:51:08.052123','2022-01-27 17:51:08.052123'),(38,5,16,14,5,0,1,'16-5','2022-01-27 17:51:13.709336','2022-01-27 17:51:13.709336'),(39,5,15,14,5,0,1,'15-5','2022-01-27 17:51:20.271087','2022-01-27 17:51:20.271087'),(40,6,17,20,5,12,1,'17-6','2022-01-27 17:52:35.098970','2022-01-27 17:52:35.098970'),(41,6,18,20,5,8,1,'18-6','2022-01-27 17:52:36.346624','2022-01-27 17:52:36.346624'),(42,6,10,18,5,0,1,'10-6','2022-01-27 17:52:41.911710','2022-01-27 17:52:41.911710'),(43,6,14,19,5,0,1,'14-6','2022-01-27 17:52:48.439814','2022-01-27 17:52:48.439814'),(44,6,15,19,5,0,1,'15-6','2022-01-27 17:53:10.320089','2022-01-27 17:53:10.320089'),(45,6,13,19,5,0,1,'13-6','2022-01-27 17:53:10.984888','2022-01-27 17:53:10.984888'),(46,6,16,19,5,0,1,'16-6','2022-01-27 17:53:12.591781','2022-01-27 17:53:12.591781'),(47,6,11,20,5,8,1,'11-6','2022-01-27 17:53:17.321577','2022-01-27 17:53:17.321577'),(48,6,9,20,5,8,1,'9-6','2022-01-27 17:55:08.670295','2022-01-27 17:55:08.670295'),(49,7,17,22,5,8,1,'17-7','2022-01-27 17:56:23.326863','2022-01-27 17:56:23.326863'),(50,7,18,22,5,5,1,'18-7','2022-01-27 17:56:24.210201','2022-01-27 17:56:24.210201'),(51,7,14,22,5,5,1,'14-7','2022-01-27 17:56:49.185893','2022-01-27 17:56:49.185893'),(52,7,10,22,5,5,1,'10-7','2022-01-27 17:56:51.772800','2022-01-27 17:56:51.772800'),(53,7,13,25,5,0,1,'13-7','2022-01-27 17:56:55.912498','2022-01-27 17:56:55.912498'),(54,7,16,23,5,0,1,'16-7','2022-01-27 17:56:59.762875','2022-01-27 17:56:59.762875'),(55,7,9,24,5,0,1,'9-7','2022-01-27 17:57:00.239265','2022-01-27 17:57:00.239265'),(56,7,11,22,5,5,1,'11-7','2022-01-27 17:57:07.200033','2022-01-27 17:57:07.200033'),(57,7,15,22,5,5,1,'15-7','2022-01-27 17:57:07.244461','2022-01-27 17:57:07.244461'),(58,8,17,29,5,0,1,'17-8','2022-01-27 17:58:53.640785','2022-01-27 17:58:53.640785'),(59,8,18,29,5,0,1,'18-8','2022-01-27 17:59:00.060900','2022-01-27 17:59:00.060900'),(60,8,14,26,5,0,1,'14-8','2022-01-27 17:59:02.641682','2022-01-27 17:59:02.641682'),(61,8,16,27,5,11,1,'16-8','2022-01-27 17:59:14.163563','2022-01-27 17:59:14.163563'),(62,8,15,27,5,7,1,'15-8','2022-01-27 17:59:21.701711','2022-01-27 17:59:21.701711'),(63,8,10,27,5,7,1,'10-8','2022-01-27 17:59:28.820664','2022-01-27 17:59:28.820664'),(64,8,11,27,5,7,1,'11-8','2022-01-27 17:59:44.139926','2022-01-27 17:59:44.139926'),(65,8,13,27,5,7,1,'13-8','2022-01-27 17:59:51.390718','2022-01-27 17:59:51.390718'),(66,8,9,27,5,7,1,'9-8','2022-01-27 18:00:04.296295','2022-01-27 18:00:04.296295'),(68,9,9,30,5,9,1,'9-9','2022-01-27 20:06:53.084091','2022-01-27 20:06:53.084091');
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
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `existe` tinyint(1) NOT NULL DEFAULT '1',
  `curso_id` bigint unsigned DEFAULT NULL,
  `grupo_id` bigint unsigned DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_curso_id_foreign` (`curso_id`),
  KEY `users_grupo_id_foreign` (`grupo_id`),
  CONSTRAINT `users_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_grupo_id_foreign` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rubén Darío Villamil Zamora','001','admin',1,1,1,'rubenphii@gmail.com',NULL,'$2y$10$FlYImAOZfZf5rOg2/L66ieLKBgFXpPRPshIfxfxZdWI7rl9SIrs5e',NULL,'2022-01-23 23:13:36',NULL),(2,'Grupo 1','901G1','estudiante',1,2,9,'901G1@gmail.com',NULL,'$2y$10$3ZpimueLH8SFVJXDVDpTa.jDwXTxYnm3t2hToW2BsxQOXCkK0mriC',NULL,'2022-01-27 05:34:52','2022-01-27 08:24:51'),(3,'Grupo 2','901G2','estudiante',1,2,10,'901G2@gmail.com',NULL,'$2y$10$LuHRD5aVC.QTRtZ5EiDW9ONJfp.hv5jOmVFSrmO9v1Jfy6BxJSBx.',NULL,'2022-01-27 05:35:09','2022-01-27 08:25:01'),(4,'Grupo 3','901G3','estudiante',1,2,11,'901G3@gmail.com',NULL,'$2y$10$wXn53WViJKH9oVYqRHu8De00DF8txA3j9.HE5.m0HBNfVqmy7vSd2',NULL,'2022-01-27 05:35:30','2022-01-27 08:25:10'),(5,'Grupo 4','901G4','estudiante',1,2,12,'901G4@gmail.com',NULL,'$2y$10$Y54b4priXA1cDElQq.h1v.avvtILlQLsbWlEtR/KeuxhOaiicS3Fe',NULL,'2022-01-27 05:35:48','2022-01-27 08:25:19'),(6,'Grupo 5','901G5','estudiante',1,2,13,'901G5@gmail.com',NULL,'$2y$10$3hS1kUhkx10gSC6suw9/SOFbRo4Ut2LOC5i3TlZzL0YW9Zw2Kwljy',NULL,'2022-01-27 05:36:02','2022-01-27 08:25:28'),(7,'Grupo 6','901G6','estudiante',1,2,14,'901G6@gmail.com',NULL,'$2y$10$g8je8XQfE.KHkEeoX8z9Yul4cg/o2udKPX0F7cdXfDNedNYjbiKEK',NULL,'2022-01-27 05:36:18','2022-01-27 08:25:37'),(8,'Grupo 7','901G7','estudiante',1,2,15,'901G7@gmail.com',NULL,'$2y$10$i9yJaZOXDUy3zo0/V4FtYOA7YUF0P7J8fEkxizfu.LmHLtG00rYR2',NULL,'2022-01-27 05:36:35','2022-01-27 08:25:45'),(9,'Grupo 8','901G8','estudiante',1,2,16,'901G8@gmail.com',NULL,'$2y$10$cKoqbBGSSSEbeqpzCcmFYODtMJcqCeILBPAnd5mbfIsa/9sPMs9KS',NULL,'2022-01-27 05:37:16','2022-01-27 08:25:56'),(10,'Grupo 9','901G9','estudiante',1,2,17,'901G9@gmail.com',NULL,'$2y$10$/ofM2jIN744aNlrp5.akSOc5fJ6FfCDNyJ3r6CU/rdr0QYlzsen2G',NULL,'2022-01-27 05:37:27','2022-01-27 08:26:05'),(11,'Grupo 10','901G10','estudiante',1,2,18,'901G10@gmail.com',NULL,'$2y$10$NE741l5RoDJYKjwywpmIPedL7NolPKvZR8m03nve40RPJrDwJ9g8q',NULL,'2022-01-27 05:37:43','2022-01-27 08:26:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-27 12:57:17
