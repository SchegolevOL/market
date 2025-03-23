-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Мар 20 2025 г., 21:40
-- Версия сервера: 8.2.0
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `market`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Одежда', NULL, '2025-03-19 22:26:44', '2025-03-19 22:26:44'),
(2, 'Мужская одежда', 1, '2025-03-19 22:27:04', '2025-03-19 22:27:04'),
(3, 'Женская Одежда', 1, '2025-03-20 09:07:33', '2025-03-20 09:07:38'),
(6, 'Детская одежда', 1, '2025-03-19 22:31:20', '2025-03-19 22:31:20'),
(9, 'Спец одежда', 1, '2025-03-19 23:19:00', '2025-03-19 23:19:00'),
(28, 'Спец обувь', 9, '2025-03-20 11:29:50', '2025-03-20 11:29:50');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `product_id`, `path`, `created_at`, `updated_at`) VALUES
(2, 1, 'images/3VPdg7m6fT7cuF5HWZznwoaumS0EAge64oS5LAD8.webp', '2025-03-20 03:27:23', '2025-03-20 03:27:23'),
(3, 1, 'images/6FhVG22UhiDU9Esvpso3ZfsQMwOENBSKdcNu6Qgh.png', '2025-03-20 03:27:23', '2025-03-20 03:27:23'),
(4, 1, 'images/Xh6lEKLW63BQ9ldEE1Vzo9TIUyHkobFp88MEg9bG.jpg', '2025-03-20 03:27:23', '2025-03-20 03:27:23'),
(5, 2, 'images/JctK3NTXnoMwsGPWaj6XyzB2Fha28tJOzNiIb16s.jpg', '2025-03-20 03:32:56', '2025-03-20 03:32:56'),
(6, 2, 'images/CYUpVp34Z22m6cX0lQhDlsCaaP7p7wtnFavMOxjJ.jpg', '2025-03-20 03:32:56', '2025-03-20 03:32:56'),
(7, 2, 'images/CICpsY8jBYcvappGJsVvJs1dibOAeplAr6LsJAWZ.jpg', '2025-03-20 03:32:56', '2025-03-20 03:32:56'),
(8, 3, 'images/KtjCv8G5dX5wWS4khJQRjr6RfkmVgTffoN9ClSHp.jpg', '2025-03-20 03:36:17', '2025-03-20 03:36:17'),
(9, 3, 'images/PaLKgD1aj3XKfyrX2u8XZ5eC86mBzV06zmTZPInN.jpg', '2025-03-20 03:36:17', '2025-03-20 03:36:17'),
(10, 3, 'images/WcCePY2Gh5hAJ6cXOTP2JAzYLk3JKO4HV1ZUZl5e.jpg', '2025-03-20 03:36:17', '2025-03-20 03:36:17'),
(11, 8, 'images/teA42ABTsGn9Gh9RrSaawv8fF2GMkvISGRGGADI1.webp', '2025-03-20 04:12:15', '2025-03-20 04:12:15'),
(12, 8, 'images/iHM1yt77iLGSHJzgO2X60dIRRF39o1VKCBX6Zs09.webp', '2025-03-20 04:12:15', '2025-03-20 04:12:15'),
(13, 8, 'images/Wt14o4tYv86ZdkhIZhUEgXQwgUdV1oydNL1SEyYo.webp', '2025-03-20 04:12:15', '2025-03-20 04:12:15'),
(14, 11, 'images/oCUCXpWE30b28gFSmG9IarqketJSGXQ3DiUBjI0g.jpg', '2025-03-20 11:32:11', '2025-03-20 11:32:11'),
(15, 11, 'images/wmPRy5wJ29puHowqFNv3KbFTdENHtFHMg09FY4Mx.jpg', '2025-03-20 11:32:11', '2025-03-20 11:32:11'),
(16, 11, 'images/KVNupCewR56qu9iHpfKTXQW8sM1xHDzTJJE0TRj7.jpg', '2025-03-20 11:32:11', '2025-03-20 11:32:11'),
(17, 12, 'images/OLdjsvUR37aZ85wvG8G41uiMzZ1yF7DFfofDcI0e.jpg', '2025-03-20 11:38:47', '2025-03-20 11:38:47'),
(18, 12, 'images/YQkJp3wF0SDYyNd58x4fz18IVOJwQQGaD2uOVvqT.webp', '2025-03-20 11:38:47', '2025-03-20 11:38:47'),
(19, 12, 'images/GeIw2RaKwoyBdtMqEAWerQADPB7bGnATzS51xxHG.png', '2025-03-20 11:38:47', '2025-03-20 11:38:47'),
(20, 12, 'images/qhjuK4GJwMajcRkD1NkcsQs3TT47fDtZ7XiXeh9T.jpg', '2025-03-20 11:38:50', '2025-03-20 11:38:50'),
(21, 12, 'images/XfWkilDGCKvsL7aotFXbjS0MHhDN6AlfVnEZ4dI6.webp', '2025-03-20 11:38:50', '2025-03-20 11:38:50'),
(22, 12, 'images/tnn6jhJRE2ylrNcoqhxuwNQ08mgEWFGf6YbNP8Ur.png', '2025-03-20 11:38:50', '2025-03-20 11:38:50'),
(23, 12, 'images/bvVImovXidBznDs9VmRcG24J5vSwIgEt3ztINwjE.jpg', '2025-03-20 11:38:52', '2025-03-20 11:38:52'),
(24, 12, 'images/OjhIHjHK0hklnjZCWL7SpVasX1gKvNe4I65wy5eL.webp', '2025-03-20 11:38:52', '2025-03-20 11:38:52'),
(25, 12, 'images/Jk09VjlBGbcGeLcMacLL1fbUqijRQQ8f691IxsHN.png', '2025-03-20 11:38:52', '2025-03-20 11:38:52');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '0001_01_01_000000_create_users_table', 1),
(28, '0001_01_01_000001_create_cache_table', 1),
(29, '0001_01_01_000002_create_jobs_table', 1),
(30, '2025_02_04_081652_create_product_groups_table', 1),
(31, '2025_02_27_161948_create_categories_table', 1),
(32, '2025_02_27_162047_create_products_table', 1),
(33, '2025_02_27_162116_create_params_table', 1),
(34, '2025_02_27_162242_create_param_product_table', 1),
(35, '2025_02_27_162526_create_orders_table', 1),
(36, '2025_02_27_162527_create_product_user_cards_table', 1),
(37, '2025_02_27_162622_create_images_table', 1),
(38, '2025_02_28_022300_create_roles_table', 1),
(39, '2025_02_28_023806_create_role_user_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `params`
--

CREATE TABLE `params` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filter_type` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `params`
--

INSERT INTO `params` (`id`, `title`, `filter_type`, `created_at`, `updated_at`) VALUES
(1, 'Размер', 3, '2025-03-20 03:09:38', '2025-03-20 03:09:38'),
(2, 'Рост', 1, '2025-03-20 03:11:15', '2025-03-20 03:11:15'),
(3, 'Цвет', 4, '2025-03-20 03:12:31', '2025-03-20 03:12:31');

-- --------------------------------------------------------

--
-- Структура таблицы `param_product`
--

CREATE TABLE `param_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `param_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `param_product`
--

INSERT INTO `param_product` (`id`, `product_id`, `param_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '42', NULL, NULL),
(2, 5, 1, '43', NULL, NULL),
(3, 6, 1, '45', NULL, NULL),
(4, 7, 1, '44', NULL, NULL),
(5, 9, 1, '36', NULL, NULL),
(6, 10, 1, '38', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `article` bigint UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `old_price` decimal(8,2) DEFAULT NULL,
  `qty` bigint UNSIGNED NOT NULL,
  `product_group_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `content`, `article`, `price`, `old_price`, `qty`, `product_group_id`, `category_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Кросовки мужские Nike', 'Господа, высокотехнологичная концепция общественного уклада создаёт предпосылки для своевременного выполнения сверхзадачи.', 'Противоположная точка зрения подразумевает, что сторонники тоталитаризма в науке, превозмогая сложившуюся непростую экономическую ситуацию, в равной степени предоставлены сами себе.', 1, 100.00, 120.00, 11, 2, 2, NULL, '2025-03-20 03:27:23', '2025-03-20 03:55:33'),
(2, 'Брюки мужские Adidas', 'Но современная методология разработки напрямую зависит от приоретизации разума над эмоциями.', 'Равным образом, начало повседневной работы по формированию позиции однозначно определяет каждого участника как способного принимать собственные решения касаемо поставленных обществом задач.', 2, 200.00, 210.00, 20, 3, 2, NULL, '2025-03-20 03:32:56', '2025-03-20 03:51:27'),
(3, 'Футболка мужская Demix', 'Значимость этих проблем настолько очевидна, что новая модель организационной деятельности говорит о возможностях экспериментов, поражающих по своей масштабности и грандиозности.', 'Не следует, однако, забывать, что современная методология разработки обеспечивает широкому кругу (специалистов) участие в формировании системы массового участия.', 3, 120.00, 130.00, 30, 1, 2, NULL, '2025-03-20 03:36:17', '2025-03-20 03:51:50'),
(4, 'Кросовки мужские Nike', 'Господа, высокотехнологичная концепция общественного уклада создаёт предпосылки для своевременного выполнения сверхзадачи.', 'Противоположная точка зрения подразумевает, что сторонники тоталитаризма в науке, превозмогая сложившуюся непростую экономическую ситуацию, в равной степени предоставлены сами себе.', 11, 100.00, 120.00, 3, 2, 2, 1, '2025-03-20 03:52:18', '2025-03-20 03:52:18'),
(5, 'Кросовки мужские Nike', 'Господа, высокотехнологичная концепция общественного уклада создаёт предпосылки для своевременного выполнения сверхзадачи.', 'Противоположная точка зрения подразумевает, что сторонники тоталитаризма в науке, превозмогая сложившуюся непростую экономическую ситуацию, в равной степени предоставлены сами себе.', 12, 100.00, 120.00, 3, 2, 2, 1, '2025-03-20 03:52:59', '2025-03-20 03:53:39'),
(6, 'Кросовки мужские Nike', 'Господа, высокотехнологичная концепция общественного уклада создаёт предпосылки для своевременного выполнения сверхзадачи.', 'Противоположная точка зрения подразумевает, что сторонники тоталитаризма в науке, превозмогая сложившуюся непростую экономическую ситуацию, в равной степени предоставлены сами себе.', 13, 100.00, 120.00, 2, 2, 2, 1, '2025-03-20 03:54:42', '2025-03-20 03:54:42'),
(7, 'Кросовки мужские Nike', 'Господа, высокотехнологичная концепция общественного уклада создаёт предпосылки для своевременного выполнения сверхзадачи.', 'Противоположная точка зрения подразумевает, что сторонники тоталитаризма в науке, превозмогая сложившуюся непростую экономическую ситуацию, в равной степени предоставлены сами себе.', 14, 100.00, 120.00, 3, 2, 2, 1, '2025-03-20 03:55:15', '2025-03-20 03:55:15'),
(8, 'Футболка женская Adidas', 'Безусловно, постоянный количественный рост и сфера нашей активности способствует подготовке и реализации существующих финансовых и административных условий.', 'Вот вам яркий пример современных тенденций — существующая теория требует от нас анализа первоочередных требований.', 4, 120.00, 100.00, 20, 1, 3, NULL, '2025-03-20 04:12:15', '2025-03-20 04:12:15'),
(9, 'Футболка женская Adidas', 'Безусловно, постоянный количественный рост и сфера нашей активности способствует подготовке и реализации существующих финансовых и административных условий.', 'Вот вам яркий пример современных тенденций — существующая теория требует от нас анализа первоочередных требований.', 41, 120.00, 100.00, 20, 1, 3, 8, '2025-03-20 04:13:05', '2025-03-20 04:13:05'),
(10, 'Футболка женская Adidas', 'Безусловно, постоянный количественный рост и сфера нашей активности способствует подготовке и реализации существующих финансовых и административных условий.', 'Вот вам яркий пример современных тенденций — существующая теория требует от нас анализа первоочередных требований.', 42, 120.00, 100.00, 20, 1, 3, 8, '2025-03-20 04:13:49', '2025-03-20 04:13:49'),
(11, 'Специяьлный костюм', 'Есть над чем задуматься: стремящиеся вытеснить традиционное производство, нанотехнологии функционально разнесены на независимые элементы. Кстати, базовые сценарии поведения пользователей преданы социально-демократической анафеме. В рамках спецификации современных стандартов, диаграммы связей могут быть ассоциативно распределены по отраслям.', 'А также ключевые особенности структуры проекта заблокированы в рамках своих собственных рациональных ограничений. Идейные соображения высшего порядка, а также новая модель организационной деятельности требует от нас анализа системы обучения кадров, соответствующей насущным потребностям.', 9, 1000.00, 1100.00, 20, 1, 9, NULL, '2025-03-20 11:32:11', '2025-03-20 11:36:08'),
(12, 'Ботинки сварщика', 'Как принято считать, представители современных социальных резервов неоднозначны и будут указаны как претенденты на роль ключевых факторов.', 'Как принято считать, представители современных социальных резервов неоднозначны и будут указаны как претенденты на роль ключевых факторов.', 10, 300.00, 310.00, 5, 2, 28, NULL, '2025-03-20 11:38:06', '2025-03-20 11:38:06');

-- --------------------------------------------------------

--
-- Структура таблицы `product_groups`
--

CREATE TABLE `product_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_groups`
--

INSERT INTO `product_groups` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Футболка', '2025-03-20 03:15:43', '2025-03-20 03:15:43'),
(2, 'Кросовки', '2025-03-20 03:17:03', '2025-03-20 03:17:03'),
(3, 'Брюки', '2025-03-20 03:17:15', '2025-03-20 03:17:15'),
(4, 'Платье', '2025-03-20 03:17:43', '2025-03-20 03:17:43');

-- --------------------------------------------------------

--
-- Структура таблицы `product_user_cards`
--

CREATE TABLE `product_user_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `qty` int UNSIGNED NOT NULL,
  `status` smallint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-03-19 22:24:45', '2025-03-19 22:24:45');

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rkxEtBQrHYit8cllXbiSnNLTxzE61DWtvq0ZpuUF', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM3ZNUEJsQ0djOXQwcERYc2lLNHZwZmVPcjFKV0dtMmZOWW1ZMXNRMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXRlZ29yaWVzLzI4L3Byb2R1Y3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1742488744);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$12$WXd2biH0ohAfoC2GEFghWu7mM6kVGdS9RiB.KCWnpBYkgEsRQMfO2', NULL, '2025-03-19 22:24:45', '2025-03-19 22:24:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_index` (`product_id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`);

--
-- Индексы таблицы `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `param_product`
--
ALTER TABLE `param_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `param_product_product_id_index` (`product_id`),
  ADD KEY `param_product_param_id_index` (`param_id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_article_unique` (`article`),
  ADD KEY `products_product_group_id_index` (`product_group_id`),
  ADD KEY `products_category_id_index` (`category_id`),
  ADD KEY `products_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_user_cards`
--
ALTER TABLE `product_user_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_user_cards_product_id_index` (`product_id`),
  ADD KEY `product_user_cards_user_id_index` (`user_id`),
  ADD KEY `product_user_cards_order_id_index` (`order_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `params`
--
ALTER TABLE `params`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `param_product`
--
ALTER TABLE `param_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_user_cards`
--
ALTER TABLE `product_user_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `param_product`
--
ALTER TABLE `param_product`
  ADD CONSTRAINT `param_product_param_id_foreign` FOREIGN KEY (`param_id`) REFERENCES `params` (`id`),
  ADD CONSTRAINT `param_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_product_group_id_foreign` FOREIGN KEY (`product_group_id`) REFERENCES `product_groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_user_cards`
--
ALTER TABLE `product_user_cards`
  ADD CONSTRAINT `product_user_cards_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_user_cards_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_user_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
