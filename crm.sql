CREATE DATABASE  IF NOT EXISTS `crm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crm`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_Number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmailAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'83fd60d4-a194-42fc-99d8-e9f6b882af55','1222323333344','1972-06-14','Josh','Doe','Joshd@gmail.com','0758985643',1,'2023-11-30 13:12:58','2023-11-30 17:58:27',NULL),(2,'ef6e70dc-11db-44f7-a3ab-400c7211e584','1212121212121212','2067-06-20','test3','test34','test33@gmail.com','1111111111',0,'2023-11-30 18:55:57','2023-11-30 18:56:18','2023-11-30 18:56:18'),(3,'5d667397-9995-44eb-af78-02f504d08821','7301185222084','1973-01-18','Jane','Lee','Janel@gmail.com','2222222222',1,'2023-12-01 03:17:12','2023-12-01 03:17:12',NULL),(4,'cdcc7242-2dc6-43ab-a890-bccb64804767','7811867689087','1978-11-08','Sindy','Shaw','Sindys@gmail.com','3333333333',1,'2023-12-01 03:20:35','2023-12-01 07:52:32',NULL),(5,'32b82218-281b-4e78-89e1-2390fd2090af','5706057845084','2057-06-05','Andrea','Riley','Andrear@gmail.com','6187318007',1,'2023-12-01 03:23:49','2023-12-01 03:23:49',NULL),(6,'f6414768-12d1-46aa-9bc2-d11aafa7fb89','9805108905087','1998-05-10','Heather','Synder','Heathers@gmail.com','3688435288',1,'2023-12-01 03:27:07','2023-12-01 03:27:07',NULL),(7,'b320d388-6895-4e49-9db1-3244b3b27f4d','5302115643084','2053-02-11','Beth','Edwards','Bethe@gmail.com','7446985032',0,'2023-12-01 03:29:06','2023-12-01 03:29:06',NULL),(8,'178e895b-8f33-4ddf-af02-0409de4b79de','9105015690088','1991-05-01','Derrick','Mitchell','Derrickm@gmail.com','5269434502',0,'2023-12-01 03:31:11','2023-12-01 03:31:11',NULL),(9,'4db360e9-683b-4afb-bf76-4bb5d070eda9','5606067854084','2054-06-06','Connie','Perez','Conniep@gmail.com','6152348897',1,'2023-12-01 03:33:25','2023-12-01 03:33:25',NULL),(10,'64556978-35b6-40a8-9e4f-1b17a1c743b0','8204126798088','1982-04-12','Frederick','Castro','Federickc@gmail.com','2272393457',1,'2023-12-01 03:38:23','2023-12-01 03:38:23',NULL),(11,'c80aa6bf-b31c-4b1f-a338-c02dfabdb2eb','8705053454085','1987-05-05','Nathaniel','Hudson','Nathanielh@gmail.com','9676931952',1,'2023-12-01 03:40:45','2023-12-01 03:40:45',NULL),(12,'3363af7f-3796-4ac6-bd14-538ccf2d2ed9','5302086758084','2053-02-08','Leah','Ramos','Leahr@gmail.com','4486922301',1,'2023-12-01 03:43:05','2023-12-01 03:43:05',NULL),(13,'ad641548-6f86-4ebc-a0d5-f38418bf7974','9706095463084','1997-06-09','Charlene','Bates','Charleneb@gmail.com','8226778654',1,'2023-12-01 03:45:30','2023-12-01 03:45:30',NULL),(14,'910c8b5d-7736-4ff5-9e4f-b27327d90c6d','5805017856084','2058-05-01','Lisa','Pearson','lisa.person@gmail.com','9429889918',1,'2023-12-01 07:56:54','2023-12-01 07:56:54',NULL),(15,'b5c948a6-9033-4d10-b9a9-bb6b91b4932f','8505048855088','1985-05-04','Justin','Pena','Justinp@gmail.com','9596312359',1,'2023-12-01 07:58:47','2023-12-01 07:58:47',NULL),(16,'5c36a7ca-795b-4257-aa5e-8508ae2ebe52','6707026634084','2067-07-02','Danielle','Butler','Danielleb@gmail.com','9839629482',1,'2023-12-01 08:01:08','2023-12-01 08:01:08',NULL),(17,'f507fdb0-e5fd-4caf-965e-e73a93ff1811','8304043523088','1983-04-04','Tyrone','Shaw','Tyrone.Shaw@gmail.com','8225670296',1,'2023-12-01 08:03:57','2023-12-01 08:03:57',NULL),(18,'b809d8e9-e499-46a9-a609-9aef8573050f','7204093345088','1972-04-09','Dana','Morgan','Dana.Morgan@gmail.com','3057721106',1,'2023-12-01 08:05:24','2023-12-01 08:05:24',NULL),(19,'713c00a2-61a8-440b-a417-44113c2a802e','9507115634088','1995-07-11','Samuel','Stanley','Samuel.Stanley@gmail.com','6655064023',1,'2023-12-01 08:07:27','2023-12-01 08:07:27',NULL),(20,'64666c98-5d1f-4fd7-9e85-eb697d5d335e','7002085172088','1971-02-08','Kevin','Allen','Kevin.Allen@gmail.com','7605361149',1,'2023-12-01 08:08:52','2023-12-01 08:08:52',NULL),(21,'ccf91dae-3d5f-43eb-a374-07079c90d067','6305014567088','2063-05-01','Cory','Sullivan','Cory.S@gmail.com','9088110706',1,'2023-12-01 08:12:25','2023-12-01 08:12:25',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_11_27_132344_create_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'browser','0befb143db5ed90869f0fdb92af8bcd28a9ff3e6b14742ea3ed2d9abb9217551','[\"*\"]',NULL,NULL,'2023-11-29 12:40:45','2023-11-29 12:40:45'),(2,'App\\Models\\User',1,'browser','62b9e9263a6bbb1d198feb95a3bd9d2d5cc8482c228b3e3227b4cba8d57f4d13','[\"*\"]',NULL,NULL,'2023-11-29 12:58:41','2023-11-29 12:58:41'),(4,'App\\Models\\User',1,'browser','8295ca06ffdb54c36d907131bd1a1db15351e4d16f283c34f213348e215ae98a','[\"*\"]',NULL,NULL,'2023-11-29 16:36:06','2023-11-29 16:36:06'),(6,'App\\Models\\User',1,'browser','d7ad9ad574c225a2227dd2518f66d0f26c59740a15c46779813d8b7a97146a3d','[\"*\"]','2023-12-01 08:15:12',NULL,'2023-11-29 16:37:44','2023-12-01 08:15:12');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin@artFundi.art',NULL,'$2y$12$4x0StGnh3u/HZUwDRSeEYOg8TknxEAS9YO8e0ZS/BOyDOnh7Db602',NULL,NULL,NULL);
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

-- Dump completed on 2023-12-01 12:59:39
