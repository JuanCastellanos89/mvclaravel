-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bdlara
CREATE DATABASE IF NOT EXISTS `bdlara` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdlara`;

-- Volcando estructura para tabla bdlara.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.categories: ~3 rows (aproximadamente)
INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Tecnologia', 'Informacion de tecnologia', NULL, NULL),
	(2, 'Cocina', 'Elementos de cocina', '2023-04-22 07:06:23', '2023-04-22 07:06:23'),
	(3, 'Electronica', 'Temas de electronica', '2023-04-22 10:24:34', '2023-04-22 10:24:34');

-- Volcando estructura para tabla bdlara.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Volcando datos para la tabla bdlara.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bdlara.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.migrations: ~8 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(35, '2014_10_12_000000_create_users_table', 1),
	(36, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(37, '2019_08_19_000000_create_failed_jobs_table', 1),
	(38, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(39, '2023_03_13_213453_create_categories_table', 1),
	(40, '2023_03_13_213456_create_posts_table', 1),
	(41, '2023_03_18_002433_create_permission_tables', 1),
	(42, '2023_04_22_003933_create_replies_table', 1);

-- Volcando estructura para tabla bdlara.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bdlara.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.model_has_roles: ~2 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 2),
	(1, 'App\\Models\\User', 3);

-- Volcando estructura para tabla bdlara.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bdlara.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.permissions: ~16 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'ver-rol', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(2, 'crear-rol', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(3, 'editar-rol', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(4, 'borrar-rol', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(5, 'ver-post', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(6, 'crear-post', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(7, 'editar-post', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(8, 'borrar-post', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(9, 'ver-category', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(10, 'crear-category', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(11, 'editar-category', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(12, 'borrar-category', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(13, 'ver-usuarios', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(14, 'crear-usuarios', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(15, 'editar-usuarios', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28'),
	(16, 'borrar-usuarios', 'web', '2023-04-22 06:35:28', '2023-04-22 06:35:28');

-- Volcando estructura para tabla bdlara.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bdlara.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `category_id` bigint unsigned NOT NULL,
  `autor_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `state` enum('post','no_post') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no_post',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_autor_id_foreign` (`autor_id`),
  CONSTRAINT `posts_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.posts: ~2 rows (aproximadamente)
INSERT INTO `posts` (`id`, `name`, `category_id`, `autor_id`, `description`, `state`, `created_at`, `updated_at`) VALUES
	(1, 'Pc alta gama', 1, 1, 'Equipos de alta gama', 'post', '2023-04-22 06:46:23', '2023-04-22 06:46:23'),
	(2, 'Circuitos', 3, 1, 'Cosa de le electronica', 'post', '2023-04-22 10:27:01', '2023-04-22 10:27:01');

-- Volcando estructura para tabla bdlara.replies
CREATE TABLE IF NOT EXISTS `replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_post_id_foreign` (`post_id`),
  CONSTRAINT `replies_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.replies: ~3 rows (aproximadamente)
INSERT INTO `replies` (`id`, `post_id`, `text`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Viejos pcs', '2023-04-22 06:46:47', '2023-04-22 07:06:52'),
	(2, 1, 'aqui hay otra respuesta', '2023-04-22 06:47:21', '2023-04-22 06:47:21'),
	(3, 2, 'Nuevos electronica', '2023-04-22 10:27:17', '2023-04-22 10:27:45');

-- Volcando estructura para tabla bdlara.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.roles: ~1 rows (aproximadamente)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'web', '2023-04-22 06:42:46', '2023-04-22 06:42:46');

-- Volcando estructura para tabla bdlara.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.role_has_permissions: ~16 rows (aproximadamente)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1);

-- Volcando estructura para tabla bdlara.users
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bdlara.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@email.com', NULL, '$2y$10$rfolXpDDaG1iRA4ORIT20.ipzG12MY2kHP5lpi9vRHGPeBgSyImd.', NULL, '2023-04-22 06:37:33', '2023-04-22 07:11:05'),
	(2, 'superadmin', 'superadmin@mail.com', NULL, '$2y$10$YtNqkGX/WWs6xDUJEvEx5OAEwRCE2Qr4jWLhulM6I8K8R94Y9acom', NULL, '2023-04-22 06:43:20', '2023-04-22 06:43:20'),
	(3, 'Juan', 'juan@mail.com', NULL, '$2y$10$W2E3meGWoJM7XR.Pqwafq.ikd2JLCrE1/t3DL/2W27zAWBeuRf15G', NULL, '2023-04-22 07:09:53', '2023-04-22 07:09:53');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
