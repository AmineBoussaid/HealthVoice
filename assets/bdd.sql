-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 18 nov. 2025 à 01:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka_s`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` text DEFAULT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('9kKYaeVduzTk3jbe8zXc9BBdvXK83z46', 1, 'test', '$2y$10$5lZj67HcMth547XsJRtdpu3hg2vC4R9dpH7hD3Any3ZiwVSViAWbe', 0x00000000000000000000000000000001, '2025-11-18 00:08:12', '2025-11-13 19:30:44');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(99, 'items', 1, 1, 'Utilisateur 1', 'Utilisateur 1\nJean Martin\nuser1@example.com'),
(100, 'items', 1, 1, 'Utilisateur 2', 'Utilisateur 2\nMarie Dubois\nuser2@example.com'),
(101, 'items', 1, 1, 'Utilisateur 3', 'Utilisateur 3\nPierre Bernard\nuser3@example.com'),
(102, 'items', 1, 1, 'Utilisateur 4', 'Utilisateur 4\nSophie Petit\nuser4@example.com'),
(103, 'items', 1, 1, 'Observation - Toux', 'Observation - Toux\n2025-11-17T18:08\nToux\nFaible\nToux sèche persistante depuis ce matin\nUtilisateur 1'),
(104, 'items', 1, 1, 'Observation - Fièvre', 'Observation - Fièvre\n2025-11-17T12:08\nFièvre\nModérée\nForte fièvre avec frissons\nUtilisateur 2'),
(105, 'items', 1, 1, 'Observation - Fatigue', 'Observation - Fatigue\n2025-11-17T06:08\nFatigue\nForte\nGrande fatigue et manque d\'énergie\nUtilisateur 3'),
(106, 'items', 1, 1, 'Observation - Maux de tête', 'Observation - Maux de tête\n2025-11-17T00:08\nMaux de tête\nTrès forte\nMaux de tête intenses au réveil\nUtilisateur 4'),
(107, 'items', 1, 1, 'Analyse - Respiratoire', 'Analyse - Respiratoire\nRespiratoire\nSymptômes respiratoires légers sans complications\nRepos, hydratation, sirop si besoin\nObservation - Toux'),
(108, 'items', 1, 1, 'Analyse - Général', 'Analyse - Général\nGénéral\nFièvre probablement virale, surveillance nécessaire\nParacétamol toutes les 6h, surveiller température\nObservation - Fièvre'),
(109, 'items', 1, 1, 'Analyse - Général', 'Analyse - Général\nGénéral\nFatigue importante nécessitant du repos\nRepos prolongé, alimentation équilibrée\nObservation - Fatigue'),
(110, 'items', 1, 1, 'Analyse - Neurologique', 'Analyse - Neurologique\nNeurologique\nCéphalées de tension, pas de signes alarmants\nParacétamol au besoin, éviter écrans\nObservation - Maux de tête');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(99, NULL),
(100, NULL),
(101, NULL),
(102, NULL),
(103, NULL),
(104, NULL),
(105, NULL),
(106, NULL),
(107, NULL),
(108, NULL),
(109, NULL),
(110, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"observations.csv\",\"filesize\":\"244\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeAEDA.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:dateObservation\":187},{\"hv:symptome\":188},{\"hv:intensite\":189},{\"hv:transcription\":190},{\"hv:utilisateur\":191}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:41:48+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:41:48+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:41:48+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:41:48', '2025-10-20 23:41:48'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"135\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeD2A.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:41:52+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:41:52+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:41:52+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:41:52', '2025-10-20 23:41:52'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"analyses.csv\",\"filesize\":\"250\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeD05E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:categorie\":192},{\"hv:resume\":193},{\"hv:recommandations\":194},{\"hv:observe\":195}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:41:53+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:41:53+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:41:53+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:41:53', '2025-10-20 23:41:53'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"135\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeAC42.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:47:55+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:47:55+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:47:55+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:47:55', '2025-10-20 23:47:55'),
(5, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"135\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome8961.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:51:05+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:51:05+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:51:05+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:51:05', '2025-10-20 23:51:05'),
(6, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeAB0D.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:55:20+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:55:20+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:55:20+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:55:20', '2025-10-20 23:55:20'),
(7, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"112\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome3697.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-20T23:58:54+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-20T23:58:54+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-20T23:58:54+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-20 23:58:54', '2025-10-20 23:58:54'),
(8, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeD60B.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T00:04:04+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T00:04:04+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T00:04:04+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 00:04:04', '2025-10-21 00:04:04'),
(9, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome7C7A.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"column-private-values\":{\"2\":\"1\"},\"column-resource-identifier-property\":{\"2\":\"bibo:identifier\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T00:13:28+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T00:13:28+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T00:13:28+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 00:13:28', '2025-10-21 00:13:28'),
(10, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome9372.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T00:14:27+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T00:14:27+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T00:14:27+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 00:14:27', '2025-10-21 00:14:27'),
(11, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeF3AD.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 00:19:20', NULL),
(12, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome8F23.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 00:20:03', NULL),
(13, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"observations.csv\",\"filesize\":\"244\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeFDF3.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:dateObservation\":187},{\"hv:symptome\":188},{\"hv:intensite\":189},{\"hv:transcription\":190},{\"hv:utilisateur\":191}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":7},\"o:resource_class\":{\"o:id\":107},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 00:22:42', NULL),
(14, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"analyses.csv\",\"filesize\":\"250\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome5F5E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:categorie\":192},{\"hv:resume\":193},{\"hv:recommandations\":194},{\"hv:observe\":195}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":8},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 00:23:05', NULL),
(15, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome52D5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 01:10:00', NULL),
(16, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeFDA2.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 01:26:17', NULL),
(17, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome8D2B.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T01:28:03+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 01:28:03', '2025-10-21 01:28:03'),
(18, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"143\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome4547.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T01:30:57+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T01:30:57+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T01:30:57+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 01:30:57', '2025-10-21 01:30:57');
INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(19, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"analyses.csv\",\"filesize\":\"250\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeA4E3.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:categorie\":192},{\"hv:resume\":193},{\"hv:recommandations\":194},{\"hv:observe\":195}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":8},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T01:36:50+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T01:36:50+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T01:36:50+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 01:36:50', '2025-10-21 01:36:50'),
(20, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"86\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\omeE78F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-21T01:39:16+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2025-10-21T01:39:16+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2025-10-21T01:39:16+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2025-10-21 01:39:16', '2025-10-21 01:39:16'),
(21, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"86\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome8D1D.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 01:42:10', NULL),
(22, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"users.csv\",\"filesize\":\"541\",\"filepath\":\"C:\\\\Users\\\\ADMIN\\\\AppData\\\\Local\\\\Temp\\\\ome66FE.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"dcterms:title\",\"hv:nom\",\"hv:email\"],\"column-property\":[{\"dcterms:title\":1},{\"hv:nom\":185},{\"hv:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-14 00:48:05', NULL),
(23, 2, NULL, 'starting', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-11-17 22:01:29', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('QVroMaQBjf6w4ZJot1ky0u0XHcc19EF7', 2, '2025-10-21 07:17:01', 1),
('eP2LvWQmXhWhpyD5AY5zpIsM7Bf9U5Uj', 1, '2025-10-20 20:06:40', 0);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(197, 2, 6, 'nom', 'Nom de l\'utilisateur', NULL),
(198, 2, 6, 'email', 'Email de l\'utilisateur', NULL),
(199, 2, 6, 'dateObservation', 'Date de l\'observation', NULL),
(200, 2, 6, 'symptome', 'Symptôme', NULL),
(201, 2, 6, 'intensite', 'Intensité du symptôme', NULL),
(202, 2, 6, 'transcription', 'Transcription vocale', NULL),
(203, 2, 6, 'utilisateur', 'Observation faite par l\'utilisateur', NULL),
(204, 2, 6, 'categorie', 'Catégorie de l\'analyse', NULL),
(205, 2, 6, 'resume', 'Résumé de l\'analyse', NULL),
(206, 2, 6, 'recommandations', 'Recommandations médicales', NULL),
(207, 2, 6, 'observe', 'Analyse basée sur l\'observation', NULL),
(208, 2, 6, 'audioRecording', 'Enregistrement audio', 'Lien vers le média audio associé (Omeka S Media)');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(99, 1, 109, 6, NULL, 'Utilisateur 1', 1, '2025-11-18 00:08:00', '2025-11-18 00:08:00', 'Omeka\\Entity\\Item'),
(100, 1, 109, 6, NULL, 'Utilisateur 2', 1, '2025-11-18 00:08:02', '2025-11-18 00:08:02', 'Omeka\\Entity\\Item'),
(101, 1, 109, 6, NULL, 'Utilisateur 3', 1, '2025-11-18 00:08:03', '2025-11-18 00:08:03', 'Omeka\\Entity\\Item'),
(102, 1, 109, 6, NULL, 'Utilisateur 4', 1, '2025-11-18 00:08:04', '2025-11-18 00:08:04', 'Omeka\\Entity\\Item'),
(103, 1, 110, 7, NULL, 'Observation - Toux', 1, '2025-11-18 00:08:05', '2025-11-18 00:08:05', 'Omeka\\Entity\\Item'),
(104, 1, 110, 7, NULL, 'Observation - Fièvre', 1, '2025-11-18 00:08:07', '2025-11-18 00:08:07', 'Omeka\\Entity\\Item'),
(105, 1, 110, 7, NULL, 'Observation - Fatigue', 1, '2025-11-18 00:08:08', '2025-11-18 00:08:08', 'Omeka\\Entity\\Item'),
(106, 1, 110, 7, NULL, 'Observation - Maux de tête', 1, '2025-11-18 00:08:09', '2025-11-18 00:08:09', 'Omeka\\Entity\\Item'),
(107, 1, 111, 8, NULL, 'Analyse - Respiratoire', 1, '2025-11-18 00:08:09', '2025-11-18 00:08:09', 'Omeka\\Entity\\Item'),
(108, 1, 111, 8, NULL, 'Analyse - Général', 1, '2025-11-18 00:08:10', '2025-11-18 00:08:10', 'Omeka\\Entity\\Item'),
(109, 1, 111, 8, NULL, 'Analyse - Général', 1, '2025-11-18 00:08:11', '2025-11-18 00:08:11', 'Omeka\\Entity\\Item'),
(110, 1, 111, 8, NULL, 'Analyse - Neurologique', 1, '2025-11-18 00:08:12', '2025-11-18 00:08:12', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(109, 2, 6, 'Utilisateur', 'Utilisateur', 'Représente un utilisateur de HealthVoice+'),
(110, 2, 6, 'Observation', 'Observation médicale', 'Observation enregistrée par un utilisateur'),
(111, 2, 6, 'Analyse', 'Analyse médicale', 'Analyse basée sur une observation');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(6, 1, 109, NULL, NULL, 'Utilisateur'),
(7, 1, 110, NULL, NULL, 'Observation'),
(8, 1, 111, NULL, NULL, 'Analyse');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(40, 8, 1, NULL, NULL, 1, '[\"literal\"]', 1, 0, NULL),
(41, 7, 1, NULL, NULL, 1, '[\"literal\"]', 1, 0, NULL),
(44, 6, 20, NULL, NULL, 4, NULL, 0, 0, NULL),
(45, 8, 20, NULL, NULL, 2, NULL, 0, 0, NULL),
(49, 6, 197, NULL, NULL, 2, '[\"literal\"]', 0, 0, NULL),
(50, 6, 198, NULL, NULL, 3, '[\"literal\"]', 0, 0, NULL),
(51, 7, 203, NULL, NULL, 2, NULL, 0, 0, NULL),
(52, 7, 199, NULL, NULL, 3, NULL, 0, 0, NULL),
(53, 7, 200, NULL, NULL, 4, NULL, 0, 0, NULL),
(54, 7, 208, NULL, NULL, 5, NULL, 0, 0, NULL),
(55, 7, 201, NULL, NULL, 6, NULL, 0, 0, NULL),
(56, 7, 202, NULL, NULL, 7, NULL, 0, 0, NULL),
(57, 8, 204, NULL, NULL, 3, NULL, 0, 0, NULL),
(58, 8, 205, NULL, NULL, 4, NULL, 0, 0, NULL),
(59, 8, 206, NULL, NULL, 5, NULL, 0, 0, NULL),
(60, 8, 207, NULL, NULL, 6, NULL, 0, 0, NULL),
(61, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('01n5kv7coa41sha7ju0de7u034', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323039312e3934383733323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230316e356b7637636f613431736861376a753064653775303334223b7d7d, 1763082091),
('0iacmstsh8opafqe7ckhqu7mi9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333934322e3132363432393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306961636d73747368386f706166716537636b687175376d6939223b7d7d, 1763423942),
('0l62c6i6pldbnk5rg5c9dlug6t', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032322e30333438313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c363263366936706c64626e6b357267356339646c75673674223b7d7d, 1763082022),
('1ei8gmunjr4v30i6tcmo44fk3k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134362e3937343734323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231656938676d756e6a7234763330693674636d6f3434666b336b223b7d7d, 1763082146),
('1k966mchs59r45dreacud1s808', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333030383533382e3039343137393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269686f74307239746c6339373533706274363962653369326172223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333034353130383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333035313731393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333035313731333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223734396230323033303031616230306365316361306339333031303066313638223b733a33323a223564613738383365316630323066343064356162333431366334323763356261223b733a33323a226265316533666665623766393139383031623264336337633966326236323530223b733a33323a226535376231396439633833313237303336316136336663336430346436643431223b733a33323a226337353138633061623164363236613036343666363438323061313966616564223b733a33323a223235303136346664663031386435613737316433663034383563366463366261223b7d733a343a2268617368223b733a36353a2232353031363466646630313864356137373164336630343835633664633662612d6337353138633061623164363236613036343666363438323061313966616564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226533303961386634336532373038656135356137653036323666643436333562223b733a33323a226261346466363330633639366166623966303031353566653038663639373161223b733a33323a226430303938666563666634316664343639623563316163626337383063613634223b733a33323a226631636435666236336535646531333035383862353836373837633630313662223b733a33323a223537306661323731353836343336323562353165376666363038343365396165223b733a33323a223664303836303565643534313239636233313430393439343666366537303833223b733a33323a223035376331623037393932376439393964396264396239303035666162353233223b733a33323a223731646231643465626361363231653966646137613061643431323036656662223b733a33323a226265626139323831616434363832366537643737333930363335386462653335223b733a33323a226538326231633366353566663136616430663535303661383665633435366239223b733a33323a223864376137306535356566343237323363343933646263316166663931366433223b733a33323a223663313832353537393665633535613938663735363861646263383734376531223b733a33323a223834376262366163326562363932663636396138663739653439333131363964223b733a33323a223864643032363030343232303734373939646165373233383564363930633836223b733a33323a226239343565373534653738343238393936393435313663656330336437613365223b733a33323a223034333231643133633238623337366338623564353263643939373962656637223b733a33323a226231316537323630663865646336366639343038333465313735633130346464223b733a33323a223164626534656237643837656563376239326634303239626237336666666236223b733a33323a226238316163323664303264633236383066393736623233353566323535643766223b733a33323a223334326339353230613166366233326634316562613531363239383635613633223b733a33323a223030393763343832313164643937653562393063343134313235623430386333223b733a33323a223264363335656337306166366339643761306432636130636437333334363666223b7d733a343a2268617368223b733a36353a2232643633356563373061663663396437613064326361306364373333343636662d3030393763343832313164643937653562393063343134313235623430386333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32383a7b733a33323a223461626630333338393936373163643466643032343466323061376539323863223b733a33323a226432346435333130306465373233623239333663653764623766366633623064223b733a33323a223630643663366162373735303964313531626466336161326465393833623235223b733a33323a223139643263653461396133616462663161663361643931336137383135316465223b733a33323a226266383839613362356261616333363362666231613765643831303436376633223b733a33323a223032363131643730356536386330303234333038336335343539303334373233223b733a33323a223964366234663234326335313761656165643739373936393632646230313338223b733a33323a223762393739306532393035663037613163343263386635396333346633306366223b733a33323a226163326131613862396233646438353761383063333238356562643630353366223b733a33323a223636343366646431313836633961633434323266363134653266303036666561223b733a33323a226266646233313030626139396339353234663464346561303966343761396134223b733a33323a226663613834373233646566643134633430633635353035316663616132393336223b733a33323a226535396366313763343561623137613961303636663166656462306334306430223b733a33323a223463316139613530306336633530363631633265663431643536616133303236223b733a33323a226437373132663333666236633361633431383330626262653131346630383565223b733a33323a223231656338373831376334336534383339356239666631363335343133626366223b733a33323a223732363239616265376265353534396238663761653839636531393565303535223b733a33323a226338616662666430306432303235343962303037633862386563666230623036223b733a33323a223937353761653139653566333165316439323265383537356438356332666566223b733a33323a223337326637306632316461303039336536326261656531663935373931333362223b733a33323a223737336164386631326438656436623663343930373066343965376366346262223b733a33323a226233636530333638636666306136373265613032386338393563333963336534223b733a33323a226630303361643565313631396535373831373933636464393534353161653962223b733a33323a226663376432663833336661353562653364623230613663376235393361366665223b733a33323a223938393362643937323265616636666636643264303861663339346333303263223b733a33323a226334636635646463393266666337333866616131666236306664303033663536223b733a33323a223237393338303662663961333733346534346261663765326564306532646432223b733a33323a223035623933333234356132343538383164663363646339306666363161633233223b733a33323a226237396262316266346439636433393730316665313338653438643335393264223b733a33323a226237353066376662616261383731316637393731313764366636376665366130223b733a33323a223363616663383537363232316233383438313635643335363235326433613131223b733a33323a223734396639363439353466643836326365333730393435666338663263653231223b733a33323a226266333064643563656265623937346537616366316364353831626161366366223b733a33323a226130323039653261326565623335303337653264643133363337656336306461223b733a33323a223136613366346538393361653733336365333063636238336361623735373530223b733a33323a226662303265656135623566303565303066323864343734393265333933393630223b733a33323a223564383463636166393136313231646161666132313163616433373235333462223b733a33323a223236646335623362343532366134373231623932393533396261376538323138223b733a33323a223865376666353830613332616439663833333139353866646233333230663532223b733a33323a223439326130323930373461353136643361316135313363643833373266303265223b733a33323a223031353437323965646264363135663838353761383731306637336634363361223b733a33323a223962623933626532373934316437613866323139303363613131646631393139223b733a33323a226234656562326236336232643435373934323330663166633830333236393063223b733a33323a226231373066623861313238313335316430376664366662306363396238366636223b733a33323a223563333362653766656538303963373734663261363238343763333135383665223b733a33323a223962646539373437656361383162333532613965353438643764656534373166223b733a33323a226331646164643638353537653432383239653637666134353239373336353437223b733a33323a223232356461336562646237313138613835666232333062366134363730626463223b733a33323a223936383965653534623839393665383739366435326464666239396461626234223b733a33323a223239626236333162303038343533336364633432313130643134326162313038223b733a33323a226263373335636139303336646432313034626164626633363261356231376134223b733a33323a226235363162316566303337383963623963333535396161346164633538373861223b733a33323a226139386330333962653238626636323063316166616138373035653530366366223b733a33323a223563333730336237336238343061323336616261326539613164303035613934223b733a33323a223037376534633062313939303139613962646236343462373537373032626332223b733a33323a226437623633336466323632363963383765643665666332313037646236356563223b7d733a343a2268617368223b733a36353a2264376236333364663236323639633837656436656663323130376462363565632d3037376534633062313939303139613962646236343462373537373032626332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763008538),
('1q2hmu3aip9kncmfm7c7pd3v1e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134372e3832373331323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22317132686d7533616970396b6e636d666d376337706433763165223b7d7d, 1763082147),
('1vslm420utpluj7ug3t2vvr9md', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323835322e3237393636393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223176736c6d3432307574706c756a377567337432767672396d64223b7d7d, 1763082852),
('2cm62e7kpjup6478tnqm3saap2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938302e3232353835313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232636d363265376b706a757036343738746e716d337361617032223b7d7d, 1763081980),
('2jrgofisnlm0gm2e97mbaj6prc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333034362e3037373437313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326a72676f6669736e6c6d30676d326539376d62616a36707263223b7d7d, 1763183046),
('31dbuptm4h6bf2bgtitfjnpk44', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234383038332e3831313231343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6564366262346a3338756b6873727171343931736f61393934223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303235313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303835373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223737613639346263383930356466383239303562383238613863393532393438223b733a33323a223036363635356636343435653465343132303230373632396438333331336137223b7d733a343a2268617368223b733a36353a2230363636353566363434356534653431323032303736323964383333313361372d3737613639346263383930356466383239303562383238613863393532393438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223934666633663834396131643234656338663539383666313634323936656133223b733a33323a223635643666366535313165303965616336393561303938613333323434663237223b733a33323a226331346466396538336665616136666362326135393362323964303533393337223b733a33323a226362303037326362306634343135653035646162376139383738646530363962223b733a33323a226536386632383530636664303362376561326362656131303633646265616230223b733a33323a226139333235353263666361333636643861616462383536626134666166326232223b733a33323a226562333930643732353266343633353334306339626638393166346339626634223b733a33323a223238643733393338636131386534343832366163613064643965323933313039223b7d733a343a2268617368223b733a36353a2232386437333933386361313865343438323661636130646439653239333130392d6562333930643732353266343633353334306339626638393166346339626634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762248083),
('31l29499ldm142oct8dv06jko8', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234393234302e3035373431323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d326e30686474386c6e376162643268617575323076307472223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313839363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239323035313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239323037313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226532353539333038343730633663636433313734363237393731633962306662223b733a33323a223036383830623664306464643834336432376166353931313565326635343639223b7d733a343a2268617368223b733a36353a2230363838306236643064646438343364323761663539313135653266353436392d6532353539333038343730633663636433313734363237393731633962306662223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226131323831383464343939636263386333313930336633366233626136663731223b733a33323a226431646336626162353932613866323162363334383438373238633032333034223b733a33323a223537313033316532316637386131323635633266636263306230383265326661223b733a33323a226563343333666164643861303039313135666532333064386563386535653634223b733a33323a223162383838393739616533393732656562666361653264653865643965373438223b733a33323a226335333336636461313266356361356265323039626438616530363034623665223b733a33323a226431616166353530353538636433373639313764383634366235346332313630223b733a33323a226133303463656262313364323661316534363038643534343434333430633639223b733a33323a226237623566613635366465336137636630643634313364383762646432353962223b733a33323a226661313166383461653436356335616266393532356138346334333032633262223b733a33323a223363333937363133353238623763316337643437623964313431383335636138223b733a33323a223837623163653061356165656231363139326663316336363063643464666563223b733a33323a223061313564373635386263396365656564306432383131346336393364653036223b733a33323a226131326331313462636463346562623738313635366330393463336434643631223b733a33323a223634353862386632383638363334333536316666666130666135653638313132223b733a33323a226434623861343037313564353730616433323966333433626534326661373865223b7d733a343a2268617368223b733a36353a2264346238613430373135643537306164333239663334336265343266613738652d3634353862386632383638363334333536316666666130666135653638313132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223766356532626234653733333430393932633462613332626664363734333830223b733a33323a223632363837643562633337326635336462356462343162643965346265613465223b733a33323a223863313736356639643964396237303339623738336564383634343737336432223b733a33323a226165313634316130306433623161383366636439636435376266643534303365223b733a33323a223862663530373535363636343838656236376366646432633532653261323535223b733a33323a226236656338336365633665333866396233303664383865363232396564313039223b733a33323a223233613039336461306161363433653934393135306330353132646635643131223b733a33323a226534313537393134363338326361303733313937663539316563313862653631223b733a33323a223861666165336334623437613861336631396532306365306538663563373939223b733a33323a223762386536306130356566613636343136336132313736383739323131626166223b733a33323a223063386165383861366163633932356134386231386261323161373432323535223b733a33323a223631303139626534663238666264633832663463623936616464356537383163223b733a33323a223039333734666162346435363165313865383137336564373364353031393761223b733a33323a226238373634356461656136613062363266353265313438393166666531613637223b733a33323a223166663966353932336266366539623838343836373532376632343835626433223b733a33323a226135393765636361356434333565613762373538333830363035366436643533223b733a33323a226132306234376638633230343939643537383239653236643632303962333464223b733a33323a223039343238386330323332353930613331386635653131343739303262343365223b733a33323a226565363861633732313665353364633666343734333133343934633532663666223b733a33323a223661333162653761366563663563303563386635313566623630373531646334223b733a33323a226461303866346566393335396166356432326561333038663962636164633939223b733a33323a223139646232323565373331636662356164326233636431653632643736366464223b7d733a343a2268617368223b733a36353a2231396462323235653733316366623561643262336364316536326437363664642d6461303866346566393335396166356432326561333038663962636164633939223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762249240),
('31ttiq0aei205onjlc8lm0nf6m', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732312e3330393137343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333174746971306165693230356f6e6a6c63386c6d306e66366d223b7d7d, 1762218721),
('42en6ruc2eus87v93u0pold42n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333932322e3135373132373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223432656e367275633265757338377639337530706f6c6434326e223b7d7d, 1763183922),
('430d60a5uah8ijabl7jgus1bso', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333032352e3239393234383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343330643630613575616838696a61626c376a6775733162736f223b7d7d, 1763183025),
('43vmm5onu9b04bm2h26buv3jf2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333030382e3633383139323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223433766d6d356f6e7539623034626d32683236627576336a6632223b7d7d, 1763183008),
('47d892rm0i8boij6aukdftcv40', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333032362e3033353538363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343764383932726d306938626f696a3661756b64667463763430223b7d7d, 1763423026),
('4lrs1l8niie4o7m2fe2er6cg2r', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333033382e3337353030343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346c7273316c386e696965346f376d3266653265723663673272223b7d7d, 1763183038),
('4lunosckgvleooo0d02quaeoiu', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431383330302e38353337313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22346c756e6f73636b67766c656f6f6f30643032717561656f6975223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436313530303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223531376561366265663132623564663365366466326531366264333861303461223b733a33323a223433386431393434343733366365306231343333343935343730396161646138223b7d733a343a2268617368223b733a36353a2234333864313934343437333663653062313433333439353437303961616461382d3531376561366265663132623564663365366466326531366264333861303461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763418301),
('55n30b6qpntipa1pdago7020v1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393136342e3132383633383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235356e3330623671706e7469706131706461676f373032307631223b7d7d, 1762219164),
('5as2s5fsg4gfj3dpq0um5aitj3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134372e3332393137313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223561733273356673673467666a3364707130756d356169746a33223b7d7d, 1763082147),
('5g3gmh3m4u0afk75lu0bgalikm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038333030392e3836303437323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356733676d68336d34753061666b37356c75306267616c696b6d223b7d7d, 1763083009),
('5id02rlb717pk44bssr2q9ntvi', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323833312e3435323936343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223569643032726c62373137706b3434627373723271396e747669223b7d7d, 1763082831),
('5rjn9qvobjfletcnqpmcosvvv4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333832342e3935373336393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235726a6e3971766f626a666c6574636e71706d636f7376767634223b7d7d, 1763183824),
('5s01t1a8mbgdmfbsphejfj7cre', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938342e3232353130353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235733031743161386d6267646d6662737068656a666a37637265223b7d7d, 1763081984),
('660mhh2939qe8jrg396meogfou', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938332e3237313334333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223636306d6868323933397165386a72673339366d656f67666f75223b7d7d, 1763081983),
('67h9jqi5u2o4loki45t67j6ie6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333033332e3230373135353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363768396a71693575326f346c6f6b6934357436376a36696536223b7d7d, 1763183033),
('69q0e2cbt80bqgfbbecsphu3kj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333031322e3037373936333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223639713065326362743830627167666262656373706875336b6a223b7d7d, 1763183012),
('6afd5qirq6n8j1rsibn3n5n52s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732352e3139353138393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366166643571697271366e386a31727369626e336e356e353273223b7d7d, 1762218725),
('6iqjhr1m3dlnrnrb7rv3n0c77f', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353330302e3736363633343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223669716a6872316d33646c6e726e7262377276336e3063373766223b7d7d, 1763065300),
('6jgd24ph85bujbksbehjko591a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333833332e3737303239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366a676432347068383562756a626b736265686a6b6f35393161223b7d7d, 1763183833),
('6jisa2nvthdvstrqfb9amm8p9e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938312e3332323433323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366a697361326e767468647673747271666239616d6d38703965223b7d7d, 1763081981),
('6k8hmu6octcbpsg30ke6cd0t6m', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432343835392e3630363234383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626b6532736f75746f6d737467616f746c67643165356433636a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436343334313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436373034333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333436363836383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436363839313b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223733343931383339623764303136343464333933343532393236386531373264223b733a33323a223962643863643632303435626532323030323231343439663936366266633762223b7d733a343a2268617368223b733a36353a2239626438636436323034356265323230303232313434396639363662666337622d3733343931383339623764303136343464333933343532393236386531373264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223533356334313332376133316534396538613437653931306262336262366465223b733a33323a223834666666663735313631653464373530376461306636663963643862653439223b733a33323a226435366138356234643264393730313835653661343365636262636234336237223b733a33323a223439633533396466363063316465306336313032663039623863656637326234223b733a33323a223834393431363833343638343633616465373334326532303163643266383539223b733a33323a223634653961666665383235623830383664623661643362646566393432316635223b733a33323a223535666430616436343164363735366437373836643430393438303030366131223b733a33323a223830346639386538316337663838306461383734633463393731346661336130223b733a33323a226535653363343461386330333064353130666339373834653931613439383138223b733a33323a223731656164326635376437636463303763303066643661333335303339313139223b733a33323a223435383164656330353638333034303234303661313164643332326635393861223b733a33323a223034366466343534313261656439383431633235393134636362363163633464223b733a33323a223566633436626363306331616562356634393364613136616433636265643466223b733a33323a223836343437363663376535376230346533383032346165346537656666613963223b733a33323a226438386565313061303030626437343931343665323038346334313161373834223b733a33323a223534393035646634326164383165626337346537356439393435376539336230223b733a33323a226666313737636164633336636139363133316561326638353361626662346465223b733a33323a226133643136373036306161316162323166306361356134623730386161623961223b733a33323a226636656565653234386464333466323230323965646566313966306239323632223b733a33323a223463393161353564323866646137623763353232633835333864663665316464223b733a33323a226333393966323962366264616162393839333065366638306432333464656230223b733a33323a223864346462376261346565366136316465336635373937363133346539303738223b733a33323a226130356131623135303364356564653139623237336361323331306266353230223b733a33323a226539616330333138333830393161383265653331653331633462623135363939223b733a33323a223862346436656438653630336432663063636233343136346232333730333766223b733a33323a223336653236393330373961373133663630613732373737326332336166396431223b733a33323a226631336365346637353839653630666131396539353737346562633632616162223b733a33323a223233613765646366386137633439333462643133386266313162313832313064223b733a33323a223963656639306662353134376137633861656136396532316639626363623166223b733a33323a223162393336646661356338653264636137636161356538343838393434386437223b733a33323a223237303532363463306337363962313234343932623831343462376537663761223b733a33323a226233333965666462336537373730383437323863306136393232636265333039223b733a33323a223032653061663330663039633835383732396431613635303331653462346165223b733a33323a226139616637363765306139356663323439313763653533663563343635323030223b7d733a343a2268617368223b733a36353a2261396166373637653061393566633234393137636535336635633436353230302d3032653061663330663039633835383732396431613635303331653462346165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226634633730393765353763343463396563643039326462626661663836353838223b733a33323a223164343165666566643933623134383830303461626638383266653035656466223b733a33323a223963313330386566653736353532653036316539653633343739366661353662223b733a33323a223661323930613332353936646135663263653831326566306562636166633737223b733a33323a223434613739633736393236363435663432313632306562303064383136623934223b733a33323a223737323931623230643930326262343565303563633034386365316532373639223b7d733a343a2268617368223b733a36353a2237373239316232306439303262623435653035636330343863653165323736392d3434613739633736393236363435663432313632306562303064383136623934223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226333306234643265666132386466633933373461663537656635323237323163223b733a33323a223639353530346636643035303365303932663334653735636262666332393565223b733a33323a223936326335666364393437313333636333646437356539346565633766623434223b733a33323a223164383864333830303139396464616331393462393661356436666563626361223b7d733a343a2268617368223b733a36353a2231643838643338303031393964646163313934623936613564366665636263612d3936326335666364393437313333636333646437356539346565633766623434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763424860),
('6lk9p1m2b6bjgpo3bjam53cq9k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323834392e3239303739353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366c6b3970316d326236626a67706f33626a616d35336371396b223b7d7d, 1763082849),
('6pqntnslaml64un00qhumkq992', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393134392e3539393430313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223670716e746e736c616d6c3634756e30307168756d6b71393932223b7d7d, 1762219149),
('71t9drsrk5mo0j54slf9rbhiu0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138313237392e3536313033373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237317439647273726b356d6f306a3534736c6639726268697530223b7d7d, 1763181279),
('77mjmlctg1k7v5lks995ivnaq1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323039362e3537373930383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237376d6a6d6c637467316b3776356c6b7339393569766e617131223b7d7d, 1763082096),
('7g9ocacgthehs1mieqeb3u7pjh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353032312e3633383132383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223767396f636163677468656873316d6965716562337537706a68223b7d7d, 1763065021),
('7lp2h805o9phcmcpacoagmsrn6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323830382e3938313334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22376c7032683830356f397068636d637061636f61676d73726e36223b7d7d, 1763082808);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('84qu9ponktb9imsul4nhris2ps', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333438362e3736303432383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226767316a373270376e307031626a6875646e703739736f6e3639223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333231323139383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333232363531373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333232363637323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333232363534313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333231323936333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226534353762306637353634356264343262633165646631623034663638633734223b733a33323a226332343435366135373230656539323133333866323733643963343663663138223b7d733a343a2268617368223b733a36353a2263323434353661353732306565393231333338663237336439633436636631382d6534353762306637353634356264343262633165646631623034663638633734223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223431636462383933633137353665383064613839313731333464666466323362223b733a33323a223439356666656430386165663432626563353737643233363661333138316664223b733a33323a226633373565383162633033616134316231656638316236376537353332643962223b733a33323a223330383832303561333030633266306436376239333436316365393630646135223b733a33323a223166353232643930636638306639303633643133396531613965343661393530223b733a33323a226230323531326133663261356635353439323466323764303238363865393165223b733a33323a223531396563366335383364383833633362366634353561316236326134623437223b733a33323a226661323534343738623661616636353037613038336339663262623364333931223b733a33323a226632666334366132646334633764626637636635656230366466653736383038223b733a33323a223037333564396465373132643335623061643165616265383562333139313531223b733a33323a223961396165383065303162383038303833333566333731616237613533366239223b733a33323a226332356464323031316436646661363361663164336163623935353364636230223b733a33323a223533333530663937343039333535323833636461383163623034393638326361223b733a33323a223864313931353433323664343730316464336365353762366461633663643030223b733a33323a226136643034313733386666616332663662366136306438316264656165303466223b733a33323a223462383733303361633838363362363436646162653061343435313632613430223b733a33323a226230643234323632366164633035303435376239613637383466616233633465223b733a33323a223766363165643834346365636364343562633032356531373730633632306139223b733a33323a223536303539333761383039303232363934666564333161313831666236323937223b733a33323a223833373136356536376434333934346364306363376166343835346664363334223b733a33323a223734663066356630623736353833343636613265363033653366613030396336223b733a33323a226336343037393933343939343235393832353064353464613632666662333736223b733a33323a226631333462363535616363393765373239646533633164636464613030623163223b733a33323a226438656464663034656633656164663434373361313836343064643264636338223b733a33323a226666306536346130363838343864613932323366363838343835323536306562223b733a33323a223966616236653436666637643861616564623931623934623532366231336634223b7d733a343a2268617368223b733a36353a2239666162366534366666376438616165646239316239346235323662313366342d6666306536346130363838343864613932323366363838343835323536306562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a39393a7b733a33323a226164316631313834666435653534333364656565316665663831333535643137223b733a33323a226435313332353939386231333062643033396564303065363066656361356332223b733a33323a223336633831643162313030303063623534316335636464616164313631303130223b733a33323a223031653165656666613634366465616138343039333338383336633135336633223b733a33323a223336346237333364306330333738356534333661663562353630633336376565223b733a33323a226536366233366466633064636131346366313364643339656538353163353931223b733a33323a226166383465386663363732633864663538636239336165313765633632626238223b733a33323a223839613237613737303435326437333763313536313362333839393837343565223b733a33323a223638303132393065323537313137386166323835623632616166316633333030223b733a33323a223765643833613766616362393632336461383135626661623333626266633362223b733a33323a223130653862303966366564303435303337376230346365653737386335306461223b733a33323a223961346531643731333433666261623239363234303634306464333964623235223b733a33323a226136383431353933343034633539393264653465393336353333383630613864223b733a33323a226265643663653462363336633630666263316363326662353063623036306439223b733a33323a223166646337653637383532633730333133643839623734646166383636353537223b733a33323a226532383262396331356639303162616533336536303662663033313765373730223b733a33323a223632343265303831623933393133633138363061646636373134643962333865223b733a33323a223736346666353633303637653466633133663036616564623435363832303031223b733a33323a223062393836346538613938303432336335663763376266623035633462643937223b733a33323a226461366239366437613934373231316566616135633036363138333532653737223b733a33323a226138656566386338643539383133666635663434333365633566313664373965223b733a33323a226432636464346562396431653838623561346231376666616433663534656161223b733a33323a226337393661646462303539336436393364303463386665356435373231336535223b733a33323a223634373738653632356238386232633035316434333836666338323164613139223b733a33323a223336643939353538323239343762363865383666373133363331393766396665223b733a33323a223934323739653235656630393033313439633135643830363633366436323762223b733a33323a223130333265633536646464643034316534376666383161303231386563326631223b733a33323a223262333235383135646230363033383866393161373530326330373266396633223b733a33323a223730613734373439336261346563343936313431323532373364623961306664223b733a33323a223030326362393830646639663735356432363562353364373766396162633530223b733a33323a223539323335643966633861353631316261616438386630646361343162323465223b733a33323a226435653964656166363336306335313039353332313266663531313536323962223b733a33323a226438633338373665656566653334326330373832623536663939306137383561223b733a33323a226639626264643765346630393662623130376631386130623566393362383539223b733a33323a223037356130666264626537646239613830663135376137316536663163323635223b733a33323a226461636136366361313066396663383161633234656566666265346632383163223b733a33323a223665643332366661353939346265343962386530363436356432313831353164223b733a33323a226636333133333732643632326632653535636465386238343637373031623166223b733a33323a223938373738646431356465353637326564653732333262376165393330316661223b733a33323a223266366530383239316637386362323861383935646533336534653631386434223b733a33323a226661333061363362356464333336376463333862343737303333396533393637223b733a33323a223961383231323166383534386336356130623465616463656639383436626635223b733a33323a223634633265353032653962396462323963386361643662343263356465353235223b733a33323a226639663037363039356534613465653665653930663136376162613139353337223b733a33323a223037373766396333656533386563363734396530623466623736333761313336223b733a33323a223763316232343030363132316530623562303937313765336364613133313533223b733a33323a223336366236623830303134643061633631323531663761633239343133666637223b733a33323a223634643035383036383666316265623863666336396534653066333963366631223b733a33323a223362353630363939353232323035393666316438313666303535333036616130223b733a33323a223534383161333935316237316338666633376662393839336235316533626366223b733a33323a226237303536356665373063343238393065303834653936383639656230386663223b733a33323a226364363061333165653461383133323837333438656339663838326530663662223b733a33323a223039653936366666363133366531636330326431343137313238626533346437223b733a33323a226230666336376434306137663661353134623337396161353831323564636265223b733a33323a226437653834373163323865323636346161353266303133323561316534653039223b733a33323a226331366332323231636535613462626236323039663536396533343932333031223b733a33323a223736363135653961386436616232653832303966303164396464613264396536223b733a33323a223636333939616538363837663032343330653533303338623861646437656464223b733a33323a223631663663326631303366643963313934613138656634623862646538383436223b733a33323a223961383639616432656635383631626661323030626630383233386139643064223b733a33323a223766366363393661626363306666646162316639663562313135386261363836223b733a33323a226261376437316233613237333033663061373336383461313764306163343566223b733a33323a223930383431363762663839383366373132643439653161633165363336666138223b733a33323a223831623137306136316466653030323038373938636563346261336231373234223b733a33323a226232653830633133303863623930336439636230353961613133316337323633223b733a33323a223532366539353662376534343964626235363533356463386265313166373631223b733a33323a223663353764343330363264653432646461313931303132363137366631623138223b733a33323a223530643432636338396332643432633937623230306135393162316434363363223b733a33323a226133656332303162336634316338333938306462663766616630313463306437223b733a33323a223339633263613435333032346361343766666662323236396338643736633638223b733a33323a223632616261303566633464306432356261613366393537356531343162326463223b733a33323a223165663565386134666139353639313466643631643830623165306134316333223b733a33323a223333353661613164613336616435336366646563373336313435376637336535223b733a33323a226566376631336430316238343736626137313839306434633639363738383134223b733a33323a223136353437323731663462363136376432346230613436396366303131626339223b733a33323a226537396334326163353633383635393632663435613733643764373263386433223b733a33323a226338356366313031303463373963343937363261333036653263346431326130223b733a33323a223465306338383462346164393536396631616166643862663032336561306663223b733a33323a223535383662393135376366646633633264663039333462376166333839653064223b733a33323a226633626165643464646461303531616133636133393337363230336361306630223b733a33323a223130663039646137633064336365353332333334313763366538303331653931223b733a33323a223938373532303639313632623533383065626332643038383662326563666163223b733a33323a223063383133386438616161393730343066636332306538316333633961326565223b733a33323a223265363932356265383762316565633663613135393836316137666362393132223b733a33323a226362363735613633313761363531663034656538333233633034353137326633223b733a33323a226261346263323934323633653435313263643163663661626432636434306162223b733a33323a226461303037393034623039393237623466613230653064376164346232393635223b733a33323a223738306636396562303565376330663336646330346561646436653463326332223b733a33323a223263656535366362663065636239353564653438303432336436636633636165223b733a33323a223362323066333031643833336131363763373734343330613334333833366465223b733a33323a226537616661393861663964646538653562313933376539646564616264373133223b733a33323a226562356336626437633961626436616462626132396164306663363434306230223b733a33323a226366323463353562316365623930393663393132396637633439323162343662223b733a33323a223030646533666661623230333465313539366530363863353963636466376438223b733a33323a226238633638323436356437313838346538343135333262666137303564353564223b733a33323a223737343237336261633533393837333062613032313262643464313537343931223b733a33323a223761363762356666373337386664353464663032656439396261356263363432223b733a33323a223134616233363635646435343733363631643435356338313433333638343362223b733a33323a223364613537396234396536356562343838323333326263323332353963343938223b733a33323a223031326536306666333839623663346663323231636335363563663937353934223b733a33323a223061353137346631313536636561613136323261653164323761383162313834223b733a33323a226239363166613164393337386638353236336439666662396466346562363838223b733a33323a223836373135333930303338653263333938356334323431313039333463373565223b733a33323a226464313366333664353965626531386430343032306530363566646234353330223b733a33323a226463623865333430323739623635373564663037663135623133313037383837223b733a33323a223335343366643562616164656466643634646664383438313335323039336535223b733a33323a223535363037316339393365653734613335646437326165393863623761646234223b733a33323a223636656336323731616263336163373738636163646431343431386231643936223b733a33323a226432666234376663333439616565323138333036316231366433646231616634223b733a33323a223164396134393039643564303034306538303231663765646237653031313063223b733a33323a226637343062623164666361656538306132646534386430396264633962363334223b733a33323a223763306131663164393639616439636231656531393362306539396239323266223b733a33323a223234663830663237623664363139326564383766643764643737643433363331223b733a33323a223431633731366165616561353962323035353339333462623636313761336662223b733a33323a226630383765636266616132313264393939656539363466326266316234633737223b733a33323a223635376265653865306136396563303563643030306561633864656137653063223b733a33323a223463303533333835303232356333366330323135343035663862393734343165223b733a33323a223732616435333734363661303633653933636534656162653561373365393534223b733a33323a223137303532386334396333333237323037303633383232643438336264663863223b733a33323a226464316665636335353033343766323135643461653666613862646163326537223b733a33323a226565656363333839323663383230396265666138356436323238653338663338223b733a33323a226163343266363233393966336235623236663565336363366265343366363339223b733a33323a223465633734653431363232343834656434653264346137323965646532396362223b733a33323a223533653832653334366666373830646364356363653432306666373365613139223b733a33323a226638333561376130626566363861366336396266343338626537633962376366223b733a33323a223233333664626461343838636165623364353237653032653166613962623034223b733a33323a226139613065373662306430386234393036376164333633373734373534636163223b733a33323a223965623165613332643834376238663337643663363461633933663934353964223b733a33323a226361313036663739303233633839613463613765306638303666326236323466223b733a33323a223939366666353161653433323366333062356461643630653535626230636133223b733a33323a226538356238393165366234386330623034396362396364316433633933643734223b733a33323a226531313931383962313334336636336532646466623430396635386637396431223b733a33323a226230303337636464343636336135323134393063316538666430316139666338223b733a33323a226239663364616133626138346532633032343062663935653333363762343261223b733a33323a226531386664666537386132393161373363633262366237323634613831386436223b733a33323a223234383533643737333264393539643134383430343033336436613962383963223b733a33323a223438303065356562383333303538306638316530313264393638616661306431223b733a33323a223161333738386532343761323165373962346561303462623365373466356137223b733a33323a223765336331656131623433373865666363383365383066396238376237383935223b733a33323a226565363433386333363362363563366332336530376139373437373630646235223b733a33323a223337623438643630393537653938656262666334346366623231303037653739223b733a33323a223330386565623261363239633632393666326638386431623163323966353634223b733a33323a226435386339393930323930646232666165653835613030303066356238376263223b733a33323a223661396436366336633666656664373266343034636137353938613831396435223b733a33323a223737363031346236653838376635613930326434336438303934353037396635223b733a33323a226162333532333830316435646132623936663161363336366462393466313061223b733a33323a223464393635363761306637366366656333363366366161643664353061646430223b733a33323a226463366363653365363435356131396462316666626331303738323334363761223b733a33323a223238373838656332313566643463323662303166326239363236663835663437223b733a33323a223339326139656232383835396561383263633233353734636137363334623966223b733a33323a226139626131613133306631376638353962633464393732613064303264386534223b733a33323a223266303062363432336566633234666263636139396334633762326632393435223b733a33323a226631333466376563653665613436646530366434363536313030363939633831223b733a33323a223337646661356238346161323965653334396433373336646239613562323262223b733a33323a223639366664376338636365303330636664313332653264373361643530343534223b733a33323a226439326166666132343739343339313035363261323832383138646561613862223b733a33323a226263313964386331316161313931333566346136333033663864303236643936223b733a33323a226564366231386230346465653762643965643263643538313930666463343636223b733a33323a223237316239613631356465306163376363393433396539623864633264363339223b733a33323a226631653238323038626266376362613937393632386561643039653964623165223b733a33323a223861656661333337316534383436306133623134306239633937643564616133223b733a33323a223533393065326630616130636563373537643837646565353730333432323561223b733a33323a223931626131656364656561343165363665376361666331303664376236343766223b733a33323a223834303662333134616664313236376563393836393431633264646235653064223b733a33323a223032313233633037376639356136343931383736616664303734373664373762223b733a33323a226565333432313337366637356263646633393661316336643834633366626363223b733a33323a226239343638303565653235336234643264653935316638386535613233306433223b733a33323a223133613736323436386131353833613331363831653064356664306462366361223b733a33323a226566663963396462326137383437646662326266373263333066613237626465223b733a33323a226166356233346334386535363461353863306234313330613039353761393331223b733a33323a226337376432656163356137323033336163653563303765323230656466373037223b733a33323a223835333032396464396130383833313330366237373930353230326634656165223b733a33323a223761616330346463303136633863656338323263333636643561373762633133223b733a33323a226462613537643534373466366664623233653461336336306433326137373834223b733a33323a223961373863616432646465336361363335336530346361333535363437353439223b733a33323a226332373838613366373864336462336362303262323936356132336130393361223b733a33323a223666643162653336343837356331386430636434613232376663303961336133223b733a33323a223362346336343461316565326339616539323433343039613338353836623366223b733a33323a223932356433643136626330386432636130656432643639326632366339616665223b733a33323a226435626534666136313866346231353635393336316236346437663537616331223b733a33323a223039613539393663356430633263386336616231666165313331383131376366223b733a33323a223432663839303261343730623564656130373164326335393030303335363530223b733a33323a226433363162333633393731353766336337323137663631653738646431333938223b733a33323a226361356463396532613734306530373463383734663862656136303666646633223b733a33323a223937633635336439356162663635646239353562363734356131313033393564223b733a33323a223930613936303734613132346430333132633533653732643530636361656462223b733a33323a223330336662396466396664393331303861313230663862356438613833656433223b733a33323a223936313363356630383332356530363134316663363433393765663963333336223b733a33323a226233663564303133313163353130363962373264646539616536613337333864223b733a33323a223437336564363434366436393463336665623435393339633737353865636364223b733a33323a226130356566396234366661313134346261663830343336363563396565663738223b733a33323a226261333564636333396162623662383138323662346531363430336334353337223b733a33323a226533313638636632373565616165643066613464333730636361653130336464223b733a33323a226265333965316461373931343763613162633339333061666139646136333766223b733a33323a223432396230653337326262633339393533613338633662343939323731373037223b733a33323a223065323565633434333535353864626265396330623335353131393037633539223b733a33323a226432373263323963653361353434353964346562376338333333326633623664223b733a33323a226333623164613466393335616566353436313736623734643764356432303430223b7d733a343a2268617368223b733a36353a2263336231646134663933356165663534363137366237346437643564323034302d6432373263323963653361353434353964346562376338333333326633623664223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226130616439313532653934656538616534323038333130386137333433353135223b733a33323a223139373531663932333332336664326638633537376233356539626664633765223b733a33323a223362303533353439616137373266393032616263653663353934666139393434223b733a33323a226364613933643963336330613864643337393936353461373561633037613830223b733a33323a223737623265356364306131346462663530616431356230373966336238626636223b733a33323a226336653630333164653531313262656333316331383531336530613735366163223b733a33323a223866666632353130363438313338353166363961333835386434303263373337223b733a33323a223430646566303634633130303534343031323262313863643666633034396530223b733a33323a226561303663636438363861333630656664316162646338663134373230346133223b733a33323a223230313062333233653935623332666336613732633566306336643839393565223b733a33323a223263303064333062643135363661663238383436336339313832343562323334223b733a33323a223062643138653032646534333330346534633533383430383238616332613535223b733a33323a223837316161363064653932363466613634623962653763333632343162613462223b733a33323a223762386665613430336437623364623839653638346365323263336261303530223b733a33323a223433653565343335643366613934656237616663326662373633313235646331223b733a33323a226539366262323430303165613966613138336434356436366333346630633337223b733a33323a223864333333393236353331643862306237356433623563386535373331353530223b733a33323a223065393035646365666266353566306439336563316131613663396231323630223b733a33323a226166303561316533313135393436346430363836653964343731666161323034223b733a33323a223936373061333839303065653333373531373631306332306134373935313434223b733a33323a223834353534373231336562363334653639343239616236656264333037623861223b733a33323a226638633535646531653561646136393236306136636237323132653038326637223b733a33323a223733643030663661306566343333613936653064346463376132653639353133223b733a33323a223663623763363664646263343630666232636430353461666630613432666532223b733a33323a223438653731643431336430366266626165343063346133366639396339366164223b733a33323a223037333533336531333166626538316535303139363835653333623530636462223b7d733a343a2268617368223b733a36353a2230373335333365313331666265383165353031393638356533336235306364622d3438653731643431336430366266626165343063346133366639396339366164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226262323565323836386164383564323233353936656632333363306333366434223b733a33323a226366616334336636346662373164333539633161383430633163346331323430223b733a33323a223333313465386139333262366266656361393138303666663133643630366366223b733a33323a226434616532353966336139633633376665313466663639393864323338343261223b7d733a343a2268617368223b733a36353a2264346165323539663361396336333766653134666636393938643233383432612d3333313465386139333262366266656361393138303666663133643630366366223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763183486),
('856nbf7m2gc75nr6refc9qlng0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333034382e3130343436393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223835366e6266376d32676337356e72367265666339716c6e6730223b7d7d, 1763183048),
('8cu5mg9mgqs1sqmh73qgqbgf55', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313937382e3832313132393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386375356d67396d6771733173716d6837337167716267663535223b7d7d, 1763081978),
('8qanq2it6el90dc3k99ghnui95', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323835382e3435353832393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223871616e7132697436656c39306463336b393967686e75693935223b7d7d, 1763082858),
('8trnsfsc69u61atoehnasag0bh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134362e3136383332353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223874726e73667363363975363161746f65686e61736167306268223b7d7d, 1763082146),
('8vpafed7b9f8mbopj6m8ek25s1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323836332e3934373334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223876706166656437623966386d626f706a366d38656b32357331223b7d7d, 1763082863),
('91bqqin85671f48psvf4nenorb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393135302e3032323934343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223931627171696e383536373166343870737666346e656e6f7262223b7d7d, 1762219150),
('91fe0dccclr88ssflmi08qo7k8', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333136383939372e3932303937333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666b6f343034703376723832636671306b30676b6b6671353063223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333230393531313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333231323138333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333231323034313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333231323138333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226665653163363635323930343130666562636437306330373162303633613037223b733a33323a226663316566663839353463366337613962383061653731643637623664303933223b733a33323a223661353362646639393064663030643961663738343864386231333262633264223b733a33323a226235626532323062623362336133626436376463346164366536346539373865223b733a33323a226265353233613235333966303333313234323561333634323037653332326632223b733a33323a223463333937653635646130396136313434306435616436336363346336336136223b7d733a343a2268617368223b733a36353a2234633339376536356461303961363134343064356164363363633463363361362d6265353233613235333966303333313234323561333634323037653332326632223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34323a7b733a33323a223135356266663761616530656333623733396337636431366635643430623936223b733a33323a223262373437656235336437653733623066623865653332363062636530383661223b733a33323a223131633531633532626137373838613665343831343937373138643837623537223b733a33323a223630333836616366396230633330396630303735383532633630353733383935223b733a33323a226533356633623538323262353230646339303336396137343661386663356438223b733a33323a223937616431373736323033333464613739613639666234353337663164376639223b733a33323a226465316162383239613933346230396561336132663466316237333032626537223b733a33323a223534666635633137326461336536346463613832333064393961663266613837223b733a33323a223837386232616436343933376466326331633164613562313064366432623863223b733a33323a223835393731373936323532333762393732376439393265616530616161336133223b733a33323a223961343036356339623365303039386266613838616662663637376334636161223b733a33323a223037366534626263666464653333633137643233353161323036396532326233223b733a33323a226565373165636163623037313930653364616336313732353264613036396662223b733a33323a226662616133663461663436343031636430326463666531316138303831363933223b733a33323a223431386234613865373361366364343262643364623432313132363032383963223b733a33323a226234396332643564393336386432643836326630306434346536393436386466223b733a33323a223236393235326431623539313034666462313135306663623764313461663861223b733a33323a226162313730643132383635346530643033666562306466346132663662623263223b733a33323a226564613663316334656162646138356162346462626432386361303137396537223b733a33323a223939343963346564663964646636363438303461313033663436366237343332223b733a33323a226332386161383962353861376132643935653166363465303036323333336632223b733a33323a226237343762623566313037306337616531383230396539306436353739316135223b733a33323a223238633962626164393433353065383435383833373031613935643264626636223b733a33323a226565396431306566356234613262363735376464306564336538633562396566223b733a33323a226334346130366362313439663063346363356631326263633638326632356663223b733a33323a223035376264326462376462336663653335393562333638613133303563316661223b733a33323a226138353361373263356261316231313961353163353238616264383338643063223b733a33323a223434363865353935636639626530393335613234656330303735303262313438223b733a33323a226539343339656330326637666336663862303663636633366264336231306463223b733a33323a223938313763633634323935636364393433386562376236346461383530343638223b733a33323a223031393233666531656433303062626265626165333636613031363735386166223b733a33323a223732633065626537303232333839353637303032343439386364613136626436223b733a33323a223035643061376433353833383937383336353336663034636234323539333731223b733a33323a223266623436316531313236333936636261643266303163386564643136396563223b733a33323a223762376238636533636634353131666362346263323032636134653937376231223b733a33323a223635643464336265363835383530623234663334643565336161663738353330223b733a33323a223332333730396537303030373230326361396463343861656333393139636233223b733a33323a226366346134323162316137353737366532366533643734303233393064393765223b733a33323a226535356363633561303036643439636130306133353536623763333932643130223b733a33323a226562623961323631313131363137363131313236663531363837613935656439223b733a33323a226633633036666462653137643936663930646138636138633130393232303233223b733a33323a223734306337356635383865346432316435356563326239633731393732373861223b733a33323a223634333061626632636630353034383833643836383466363133656637363634223b733a33323a223136366538393333646435653563316439656566336237356433356537336234223b733a33323a223134373639326139666565393739396330396136356462643531303163353861223b733a33323a223164653437373038666531613833626537383730343861636235303961333937223b733a33323a223335653430343938643833656461616530373032336335623934313036326236223b733a33323a223536623062313830326335636536333436326366643337386233366133346335223b733a33323a226637323230343331333366663266303034356230393932306238326132633331223b733a33323a226638336338666335653231346664326136613764323738653935353234353438223b733a33323a223162353136616131386561313531613839346565326238353866373066356239223b733a33323a226561316438386465396639333462353263623032323265626331303066363133223b733a33323a223865303662373061376334633036613039373461613763323932653865323266223b733a33323a226661396138373265623163353561616331653935323233323561306531333836223b733a33323a223666626231613163636436386266376333356466343432626262363862376234223b733a33323a226139626466643439326662656666323663613166666637333064326565366430223b733a33323a223239396463313735333236326233363964326235613566366639306236303064223b733a33323a226261623266646337366634373933326334353463323533333930333430346235223b733a33323a223135353133336239313962386665393462663430666637343833646436643131223b733a33323a223966303137393461326334326635306433383262323430363865313437346634223b733a33323a226563666237333830313333353533316363383132643366303662393764383138223b733a33323a223530666161623262306336343239353162343331653233333531636666643866223b733a33323a226266616162656166346231353933306263316131306464373936386332326537223b733a33323a226239393437623831613332333938663538666564316665633639353835353763223b733a33323a223336373265633761663666653131313564386637386261333533653435346237223b733a33323a226633636264396261346436373766656138326130393533303630313831343963223b733a33323a226434646261653266366537653632646537333231656261393730396136623666223b733a33323a223962646439663837343038636232356533393666356230613535396430633965223b733a33323a223434613438663032336264626137316238383932346531626462323763633632223b733a33323a223166393631613561643333326432663336663466393337336639356339323837223b733a33323a223739663634353863376364366262306365613039623962626464363330353064223b733a33323a223433613061643139393638346434303931316461316663656334623135376136223b733a33323a223839646430396162313266313664666463343033353530366437393733613866223b733a33323a226663373834633235393630376236663063646333333931633038666136336139223b733a33323a223333313438393661333066386663313036633734316532666464333866316334223b733a33323a223237306139303663393231633835616566373238376231613737326565663436223b733a33323a223961663931383137343035643663333332356634346136633530636431383162223b733a33323a223238666338653164633861353139353139613165313866363762363239653066223b733a33323a223635376662343634333130313033316631396638373862323363666431633831223b733a33323a223339656637663865343335326562643836346661353862386135303130343133223b733a33323a223366366266376661633434346666626363303531623438366330366364663164223b733a33323a226461636563363065336265323266353831333061366131616366343263323061223b733a33323a226439303539316638363131336132653234383365343634623030316465663430223b733a33323a223164343035366466356139313135646362656337316339383064633232323130223b7d733a343a2268617368223b733a36353a2231643430353664663561393131356463626563373163393830646332323231302d6439303539316638363131336132653234383365343634623030316465663430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223231643165373662656365376161613833666535393631656564363062373732223b733a33323a226163363934333731366461316631613463343232646661303765383166316365223b733a33323a223065383837623431643338363334623632613939646438363237356661303538223b733a33323a223532356166613561383135303036356565623066313963313261393538386566223b733a33323a223063343862623339303066393161376662373933643134643562613534363835223b733a33323a223433313564313433323962313561333432356538316635663166313961323164223b733a33323a226436306261343330333239306437666536313665373566626339623165316237223b733a33323a223462326235393362373033666331636333333032633234363935383632653365223b733a33323a226336616561393765626563353965333034316631376263633863383136663337223b733a33323a223333343733653063656166383336376462333635643438663735303761303335223b733a33323a226262376361333930623932376434646539393136373263356131613637363864223b733a33323a223737326163616536633066633231336365613538353335326262653237393638223b733a33323a223666653130643934306531386364666237643335666462346535643864363830223b733a33323a223232643562613263353437333038343434313365643866383034353566336361223b733a33323a223831343534616163323462663739366332653662643731376563653563636566223b733a33323a226265313366613161363230646530393565636563663763633637653266353564223b733a33323a223764643832323461326331376337373734623330326236383564663632386437223b733a33323a223864366238313865323164363265663637393932626364386439393033303034223b733a33323a223964366331633632643238313530353835366662303831336433643164316363223b733a33323a226362303333326334393138656633313962303862653063616265643562643263223b7d733a343a2268617368223b733a36353a2263623033333263343931386566333139623038626530636162656435626432632d3964366331633632643238313530353835366662303831336433643164316363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226235333631346439393833613962366335646566646166653833363339663934223b733a33323a223632663731623634343338396633333831376532373733323862303135613662223b733a33323a223834383937313465333763653338353636363665643534396366666632333333223b733a33323a226436353036646637303761656339396461336632356439626564656365373636223b733a33323a223364636336373032623232633430323536643463336237363666323934383435223b733a33323a226635353532313961383365666532363035373431363335643566313236666162223b733a33323a223839636232656435633336333633613164386330333433393936613563343436223b733a33323a223362646531353265333838363038393261303363303762363939396639663936223b733a33323a226637623436316135653561353263396536653734646663343938653065373562223b733a33323a223963393362646239353839386363663764623733633735366365356332343431223b733a33323a226435346237616231333162316130643862633063633037363839646438346336223b733a33323a223733356638336361626262336339336535643031333663653534306532653463223b733a33323a223762643338376635386363376634316636303738396639366664656465366639223b733a33323a226538653063346561356135363863386532636435393765623163396631383365223b733a33323a223239663762363634313536336366383633383930306130663434333365353335223b733a33323a226236666538643634653263353963363937333262326565373261643730666430223b733a33323a223037613237666632633465616639613930393138626237313032333631323435223b733a33323a223837363466316262623630306331626337363266656163396435326637303939223b733a33323a223664386632363566313438356430313631613962663563663338303865306662223b733a33323a226564363237643434303265313463303739383436353834666365623739333230223b733a33323a223361623336313363663234363938356236646137346161646339353237666262223b733a33323a226437376264393730393166643331323663623264626431363765323339313366223b7d733a343a2268617368223b733a36353a2264373762643937303931666433313236636232646264313637653233393133662d3361623336313363663234363938356236646137346161646339353237666262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763168997),
('974j58ab3n02hngqgk0tsb0j0a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333539332e36373834323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223937346a35386162336e3032686e6771676b30747362306a3061223b7d7d, 1763183593);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('9hndl21r6rd9l00bf7ivki19u3', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333030393937302e32383032393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223275637272666730663035726371736d336c6d646f7067633173223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333035313733393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333031333535373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333031333536393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223930616165613464353261366235393236616262366332646435333833383437223b733a33323a223130643334663936616434633334653733646562316666326234333838613462223b7d733a343a2268617368223b733a36353a2231306433346639366164346333346537336465623166663262343338386134622d3930616165613464353261366235393236616262366332646435333833383437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31383a7b733a33323a223539646531353362663632313965343237663238336666653030646238346130223b733a33323a223030656435353466303166323639353536303162353966336462303164323039223b733a33323a223130346462616234643930643939646462616133386239373266663135353535223b733a33323a226266336434613263396432313362393562313839653964656263633233353830223b733a33323a223161616635376564353463323037346136633161363833303466343365386136223b733a33323a226338653862303665313164643337333663376331653465386235356434396531223b733a33323a223836323066336564333561383934636535623966343861396164343166646338223b733a33323a226366356439666238383439383062303936306133386334373436323638363962223b733a33323a223339306230666264393834666132383936383664633764303231646266336438223b733a33323a223231353362656134623863303731623262396139616464646631343534343631223b733a33323a226438353336323836386634326430626236666239333033383564373932643838223b733a33323a223532383165393666633930303535303732316434343138346431626361613665223b733a33323a226630313734626438326630666530326364393934346266363465643439396465223b733a33323a223461303238623737393737666237396238626432396336663039316430326463223b733a33323a226439643432353835386430313965643533306634613964326535356531316534223b733a33323a223732343533386466326564386133383034376162613939343039303138386563223b733a33323a223762376466626137663262333065393362346232353637396337613139306365223b733a33323a223332626631383136643639656436396235346339393363616166623838353239223b733a33323a223235636565353532623933373931643335643636303665323834626339633532223b733a33323a226162646466633263333133363037366330366263393834636330646461383262223b733a33323a226565363233393532663237376366626636616364383532623266353361336430223b733a33323a223862613336333636336362336563343463363330613832636166623836656264223b733a33323a226562323636663430623061353135613631336231623638393630616534643732223b733a33323a223864326235316536316633663930616466363664303763303962343732363063223b733a33323a223630316262323732613762306634636365633934393762623961346463623738223b733a33323a223562633737623631613235326430336665626632636333656633623262313932223b733a33323a223065343437663835353862366338326633393565393131646361326632363732223b733a33323a223465303463396233656165646535313562623538316161656530613839383365223b733a33323a223863356235393231323064366264346534386437303165623431396463633334223b733a33323a223363666662643135396662353534383038653161356166313630343563343236223b733a33323a223132373665623734646662386638643466333138653766306261396362643065223b733a33323a226561643239343263646132386635383562393338363632376238653736666138223b733a33323a223262336361663461386562356361363265316138616232373634343036643930223b733a33323a226639616364393265343064303636376164353133633037393864306238396464223b733a33323a223730313461363736373666396365343733626531343965363634333965303439223b733a33323a223966326564623864383538326535373361363534333732616332663863323662223b7d733a343a2268617368223b733a36353a2239663265646238643835383265353733613635343337326163326638633236622d3730313461363736373666396365343733626531343965363634333965303439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223231383936373961396334363264633865313161353737666432356438636565223b733a33323a226430303637323064356231376330323232303532386632653435346263616539223b733a33323a226335626466383332386564303834636438613833343438363030303634616630223b733a33323a223937626230313230366162346135383139636334393165636663613536343565223b733a33323a226562306661376335623062316330393765656135343738363235623962613661223b733a33323a223562366561316536383166313834383732653539343434316230346565623230223b733a33323a223135623439366166323738316236336661363365386139303133626433616465223b733a33323a223862613766643730656230313064363034303036343137336430303466313261223b733a33323a226632333731666430616135343539666364633436353137366166623866656664223b733a33323a226130363466656133376166623266306464643663316437313237323435326233223b733a33323a226433346366383463363632363138646432336335376663323934643765656564223b733a33323a223937353765336135373034623263623938393465383266346361393764633065223b733a33323a223036373565633261653466643866633934633935626636636237616164653135223b733a33323a226135613634346265363263356437326438623361363062613939353132646666223b733a33323a223634366430306662393534386663653362313663316433336634326666646663223b733a33323a223337626132363236636439616230333434396137366237323336393230343163223b733a33323a226133333031343438613538373939376438396463313966636366643337353765223b733a33323a226235663633393332636637363638346433646666386566666366643061323733223b733a33323a223939313238376134376133333466383331363936373165356235323837653832223b733a33323a223835636335376231626535336661646134623136336633646537663830656132223b733a33323a226438386138343639343963376433306538613132343831303835646534383761223b733a33323a223334656165393863643030396633323934623766653939373431633061386438223b733a33323a223030366333343239626339653238653438613134323730623236646537616261223b733a33323a223134393563303233316535616562646639373030316265663231383432343634223b733a33323a223932393939626463326235616333616165376239343465636338643930373234223b733a33323a223065303036616666363266653439326330343038616664343762623934336165223b733a33323a226631353866316364363838323438303430663835323136323330623634343834223b733a33323a223235346238323734666164396431366434343264633837376666343865326138223b733a33323a223530663631633366396637393837336662613937363961633465663063663761223b733a33323a226131646533396230646463313337346166346262313339656466616533363737223b7d733a343a2268617368223b733a36353a2261316465333962306464633133373461663462623133396564666165333637372d3530663631633366396637393837336662613937363961633465663063663761223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763009970),
('9hs9nf5ggao23majfjn2nt4jjk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432323738382e3530363334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396873396e66356767616f32336d616a666a6e326e74346a6a6b223b7d7d, 1763422788),
('9jelljviq8cp4636n9961ppi55', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333531332e3439363434353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396a656c6c6a766971386370343633366e393936317070693535223b7d7d, 1763183513),
('9nhu90tb0udampc35pkcm9hrot', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323031392e3332373232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396e687539307462307564616d70633335706b636d3968726f74223b7d7d, 1763082019),
('a2eclfdt8mkt04hsje42sq965c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393134312e3233353030363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22613265636c666474386d6b74303468736a653432737139363563223b7d7d, 1762219141),
('a36rc3gv83ilir2atb3rj6l9v2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333133312e3936353437343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261333672633367763833696c69723261746233726a366c397632223b7d7d, 1763183131),
('a59fhp5dc17gloe08fuem49qgq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333033352e3233303738363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226135396668703564633137676c6f6530386675656d3439716771223b7d7d, 1763183035),
('a8qnt63ike4ck3n7soa78mvshu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432343237362e3038363938373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226138716e743633696b6534636b336e37736f6137386d76736875223b7d7d, 1763424276),
('aano9l408h62b5kae62gjc0bla', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038333033332e3234393431383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261616e6f396c34303868363262356b61653632676a6330626c61223b7d7d, 1763083033),
('aarh6vrt5teshf8c0a3lqgn3vj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323833332e3232353734323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616172683676727435746573686638633061336c71676e33766a223b7d7d, 1763082833),
('ad8viugvrdnag1qq67jpdcrkd5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323130302e3831383430323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616438766975677672646e616731717136376a706463726b6435223b7d7d, 1763082100),
('arvc4uriu1ra9sj3md448hcuo6', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038353835382e3733343035363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343170667161696275686b656e383976696b313067666c636a30223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333130353238383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333132383630353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333132393034333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333132383835333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226130333466316631666563323331313039633933663338366362383562363661223b733a33323a223462616531393538656631633431356136326232396665653764353533663238223b7d733a343a2268617368223b733a36353a2234626165313935386566316334313561363262323966656537643535336632382d6130333466316631666563323331313039633933663338366362383562363661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226161353663333063656439326661336434326331393862646566386534343433223b733a33323a226465643038643331616231316266383737336565643535626266666565613931223b733a33323a226234636237316237663062643838313833633432333137383066323939363131223b733a33323a223664633330636566316665393861646333373163633337373431303935396434223b733a33323a223938363332366462626137636364313033306634306230303535616534376133223b733a33323a223662313861643765386464613161323166353862396263633132356563336562223b733a33323a226664363233656238396230643462653666316433353639306463303036313732223b733a33323a223939396438363563623239626261323661303863343764643539643332353439223b733a33323a223762323439373630613965643166653035323562616162303166633466316435223b733a33323a223665323732306532646538386630346431363738326239646163663034643732223b733a33323a223339396565386539326533336135613134663164356437313532363337653035223b733a33323a223734653239383133326663303566316630323933396432393539373136396435223b733a33323a223164336635623437353930336265376339643630326438373832663635633937223b733a33323a223831616264333139333935653163333462636134653036313633666661663735223b733a33323a223166383330373138343066353835336363663833396464643532633866396637223b733a33323a226563396632353632386561616466663861383239333938363761353037653665223b733a33323a223534323835626436303766393862303562316466396363626132346261636438223b733a33323a226232643537653238666664666361373232613234333831623835353632313336223b733a33323a223235663164323439313235663732373233373633333239373034303736653137223b733a33323a226562376436666139646663333162633038316662353838663935623564663930223b733a33323a226432333130626165353535613339383065353035353166316634316236306263223b733a33323a223537653264623462613061363363626162376133303431343764666164343162223b7d733a343a2268617368223b733a36353a2235376532646234626130613633636261623761333034313437646661643431622d6432333130626165353535613339383065353035353166316634316236306263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a223531353332623563666466366664666561613537366665316162333735646237223b733a33323a223334386231336236303464653437306139363565363736636139323039646565223b733a33323a223839613963336166626361633532633161343633313261303936316537366466223b733a33323a223261633066383233353033366162633435626639613361633838646465306436223b733a33323a223564396337333230626536313030326265393165333031333564323837613762223b733a33323a226362633535626136346431353932633130346363613632646664363037376666223b733a33323a226462383731346536373233623139383463376464373733366364346632326139223b733a33323a223733653764623963336634626165396165343262333130356434613165626163223b733a33323a223634613138386664323966643130343963396335636530643163393965303734223b733a33323a223232396539373661643266626333376261313033303538326432313032373264223b733a33323a223465346335386531333934626236633863363736313864303966326439386465223b733a33323a226538356639316265616634653230343838633434356136663237316131336137223b733a33323a223733663235313433393338613462613862336632616233376230326630346638223b733a33323a226561616131303938393636313062363364346138623661613136646636313766223b733a33323a223238396632623230353266646632373863313666356662356566336535633530223b733a33323a223063396363633262393636653363316564303465656337646235616338356261223b733a33323a223466363764373231653333633832376634633936636165323361666330643130223b733a33323a223833326265363236623764623438373833393165333932363237373064623732223b733a33323a226631356534653335386131646534653631343230613064633437656462343761223b733a33323a223663663064386534656162316439633066646137653061383337373038303834223b733a33323a223264396135663665626565386633393331333661353761653663623664356266223b733a33323a223661353536643937613633646634383537636337356665313735313764316436223b733a33323a226632346565306563643862316162326234343237323863343631306535353864223b733a33323a226435353661643766643339643931636637353762333138393564646535326538223b733a33323a223565353362343136643436303365663935356364656135626330636436633939223b733a33323a226434356230663431346136383835353263343963376636663539396133376233223b733a33323a226366343464373431613664353930393532366265333231613338613836343431223b733a33323a226136316464613038643936383236626437386564383338376366653062353562223b733a33323a223065343066626663336239663164633366333337306235653934636162393465223b733a33323a223161376639373231343865643162636566343064636361636635636161656232223b733a33323a223666633136316636636436653262393966363538346663626434346639623263223b733a33323a223434376236373532633138666236373164643334393233353263333762343938223b733a33323a223636326633663632383033313038303934613636643433383437343732636262223b733a33323a223263326337666433633538623264323939616562303133346138353439643934223b733a33323a223136666365366361663565356438373731636563643534366663653933343361223b733a33323a226163396331643935393337363932353134333038356232386566353865306464223b733a33323a223538376165343063353433386561313865316337316666373464313164356561223b733a33323a223965623935353437363965303332346165363633393263666639343639383334223b733a33323a223039383462616666363336373334626563323463343064636264333632663237223b733a33323a223465663563336433353639393963363662666362343731643733356538366337223b733a33323a226430353234663831643761333236366462353031363065343832343332333838223b733a33323a223436623234616665376232393036636435356563653839643233333132303764223b733a33323a223861376235326232646166333939376232373965366333626639333239393161223b733a33323a226539653138383163653433333563653735313031646134376162646532613531223b733a33323a223530613861326633626134383538343338623234633164633931633330356531223b733a33323a223164343065646439613462303236383065313838386663373332343533393334223b733a33323a223066333162663964373664303932393337636562373631393464646130303637223b733a33323a223035346663646434386330333031386466386232333633636565386435313831223b733a33323a226364633334656261396263623837363139636538333031363433653966386637223b733a33323a226634656235613139633436376561313234613534316435616264363261653338223b733a33323a223861633435623536366338373564323435366564333233383739356437643063223b733a33323a226231346131373733623833663438316163653835336131313762333834643736223b733a33323a223433316632396636336166323534396431633535393532353461303637666234223b733a33323a226361353661353034323465643962323966623335343963633435356362303530223b733a33323a226362366131303232313666343262383932306164303431306661366133346336223b733a33323a223339326431633835396230336636363332613965623535333831613666363036223b733a33323a223539613132303536373661303164396364363962373465303636643837353162223b733a33323a223564383662613738623964303335313566356166366565353439396430396563223b733a33323a226638343164396461363137393065376338383835663865363763663236653833223b733a33323a223333353631363362363239393837646632666633396664303533636438663033223b733a33323a223531353339383630356636626231626566343438663135366536633938373366223b733a33323a226236623435333437643464626535626230663461393332333132393431333262223b733a33323a223366646637353262353761373137656565663664336432393837636238633331223b733a33323a223432386533336563313261613135353138333031633435346366373364626539223b733a33323a226466393334386363333666386634373133396661616164656131643131613532223b733a33323a223663323166396237336665373264323938373231666332343963653533393163223b733a33323a226637643363326664363133656239613035353761613963306530376137663866223b733a33323a226337373765383763393237656664666232373165353762326537626264343033223b733a33323a226439633566373636613432353662343962376565633035616465623337663064223b733a33323a223761633139383337353430393831313933343762363835396339313832373432223b733a33323a223465366364363736393263306339363532616663623438656262363735663065223b733a33323a223838326264346232313839393638396432343463333661386636646134663234223b733a33323a226137643066616665386166376562303761343133633366393939333963646337223b733a33323a226130643363366665653366393365336239306337333332646630616261663065223b733a33323a223364383932633431363438373430636266393862303238353836323231646666223b733a33323a223066623131363132393433353361393835633536346236643162396663623839223b7d733a343a2268617368223b733a36353a2230666231313631323934333533613938356335363462366431623966636238392d3364383932633431363438373430636266393862303238353836323231646666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223261343364346463663661313133376535326365303861363035623764326565223b733a33323a226463313363373264633334396437616264353365366231303662336538626435223b733a33323a223938383236336639613536356333653237633534383565616366646139383632223b733a33323a226138376635383063333365623639373331623032313033313435623938353633223b733a33323a223966373039666332373138343935303337376432623531656365306461373338223b733a33323a223736353838356566633266646665646663336437653331306565343430656333223b733a33323a223463303330393838363361343530356637306530623365623436623438633431223b733a33323a223433626533343732306233636535616437313837393239373231626234316662223b733a33323a223137383431633763346233656537343066373466343065313233373263343438223b733a33323a226632623436346663636536303361663064323661303332323235626132303364223b733a33323a223435396364323035323638393438316433303539353666643039393237383130223b733a33323a223861373462323139633535626331636237386639326636383739333265333133223b7d733a343a2268617368223b733a36353a2238613734623231396335356263316362373866393266363837393332653331332d3435396364323035323638393438316433303539353666643039393237383130223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763085858),
('b7615k6e0t8tbq3i29j84hgked', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333031332e3938373333363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262373631356b3665307438746271336932396a383468676b6564223b7d7d, 1763183013),
('bapu43hnc3po3rin5r4cbrgpvr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032312e3230303737353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626170753433686e6333706f3372696e35723463627267707672223b7d7d, 1763082021),
('besr122ckc5l19nrq6u17mlrsl', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333030362e3530323830353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262657372313232636b63356c31396e7271367531376d6c72736c223b7d7d, 1763183006),
('btug2pq9gheo5hcv1kjmrjvi6v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353033332e3034343932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2262747567327071396768656f35686376316b6a6d726a76693676223b7d7d, 1763065033),
('cjo02ep6flt7fo3akjm6tmtpq6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732312e32363731363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22636a6f3032657036666c7437666f33616b6a6d36746d74707136223b7d7d, 1762218721),
('cre7c8h38d9hqf89ikcmniai29', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038333031342e3637353139363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2263726537633868333864396871663839696b636d6e6961693239223b7d7d, 1763083014),
('crpns4uadkh8i1tasr1c49ehh3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353937312e3631383830333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226372706e73347561646b68386931746173723163343965686833223b7d7d, 1763065971),
('d6p15k53389giana8d9ias1duq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323939342e3731373933373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264367031356b35333338396769616e6138643969617331647571223b7d7d, 1763182994),
('dei5bcfma4j3vlpjrphdd2k2b2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138343139312e3239303535393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646569356263666d61346a33766c706a7270686464326b326232223b7d7d, 1763184191),
('dhgdkam3j493aetnr04eh1806s', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235333036322e3433303634363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226265353970616836353774716f6c6975393065366a6b71316473223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239343537313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223536663232656135373164343634336139333039326537373464653333346232223b733a33323a223239376363626463393438626137653666663330356438626261383133616533223b7d733a343a2268617368223b733a36353a2232393763636264633934386261376536666633303564386262613831336165332d3536663232656135373164343634336139333039326537373464653333346232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1762253062),
('dpdgck1vsu5tukr2k0c507aa1c', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234383233332e3036333136313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226738336330633834766a6a7138346c32733063356364696d6c34223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313238343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313334363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313432373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223336356234306261623639633637353636343430336339623961336166333239223b733a33323a223333333066616436333036643336646230376266313431636338636538623538223b7d733a343a2268617368223b733a36353a2233333330666164363330366433366462303762663134316363386365386235382d3336356234306261623639633637353636343430336339623961336166333239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226532333030623436386639663137626665346665373761643432346537613031223b733a33323a226237353661356439313935323436646338666163646535303637633935316535223b733a33323a226231353037666338373064386532326634373864646433636339663862313765223b733a33323a226538333930343838383234376330616138373430363066303065626361653133223b7d733a343a2268617368223b733a36353a2265383339303438383832343763306161383734303630663030656263616531332d6231353037666338373064386532326634373864646433636339663862313765223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226364366530613439386135623636353635313039653030633731613735623065223b733a33323a226439396264613466663334366365366439363666396633313936653537643064223b733a33323a223664393063376532373730336464653030396266343566633139663737356432223b733a33323a223334336334396238363434366437633361663231343462643935633764633531223b733a33323a223465316535306235323033663165323237316238613066656134306537646137223b733a33323a223363303439333364346137316236386138313530326336306132643137393031223b7d733a343a2268617368223b733a36353a2233633034393333643461373162363861383135303263363061326431373930312d3465316535306235323033663165323237316238613066656134306537646137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762248233),
('dt99db3hdf9d3lo0in5bvijpdm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323832302e38343431353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22647439396462336864663964336c6f30696e356276696a70646d223b7d7d, 1763082820),
('e0e3snuhrllnifr2ucsenle7qs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333833382e3733323739393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265306533736e7568726c6c6e69667232756373656e6c65377173223b7d7d, 1763183838),
('ej04c05j94v4qqop5j4n3iousn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333933382e3032303331333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656a30346330356a3934763471716f70356a346e33696f75736e223b7d7d, 1763423938),
('faegqjdd76pfvs8h9degmdlvdu', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353131322e3731333232393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266616567716a64643736706676733868396465676d646c766475223b7d7d, 1763065112),
('ftdqd7hv9qei1e29nht5md2b6q', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323938302e3431373635313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22667464716437687639716569316532396e6874356d6432623671223b7d7d, 1763182980),
('g71bq9ur1fu8pp2dgb5pep3h77', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333832372e3434393039323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226737316271397572316675387070326467623570657033683737223b7d7d, 1763183827),
('gip1p9h8pe9o8bdb1nhq8voofd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393134312e3238303638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267697031703968387065396f38626462316e687138766f6f6664223b7d7d, 1762219141),
('gniu1m69m9u175bo4rnhku85tm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038353030372e3533333033313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676e6975316d36396d3975313735626f34726e686b753835746d223b7d7d, 1763085007),
('gt47380h0789b3mm3nl7k7afv2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323938332e3833353835373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267743437333830683037383962336d6d336e6c376b3761667632223b7d7d, 1763182983),
('guutj71gok7q5bj1d2umm988ej', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323937372e3939313738323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677575746a3731676f6b377135626a316432756d6d393838656a223b7d7d, 1763182977),
('h61i5fcn2a7aev3jgurajhb00v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323939382e3437323935383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22683631693566636e326137616576336a677572616a6862303076223b7d7d, 1763082998);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('hfkdjuvh0kq2pnjnqe6pbqmpvp', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431383330302e3432333036363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273336232753932616231636a62746a366f623232693738393537223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436303537303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436313433373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436313438323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333436313439373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436313235363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226531386236623833643364383937366662383361366132316332623362653537223b733a33323a223032306466333534633534616239623030663535373364633533326665306130223b7d733a343a2268617368223b733a36353a2230323064663335346335346162396230306635353733646335333266653061302d6531386236623833643364383937366662383361366132316332623362653537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223431313830383363353136626664316161666164666339633830333562633538223b733a33323a223066623932393131373036656363343032633438393736613933376631383338223b733a33323a223631376438356332646431656237353663356566613063376266343262643432223b733a33323a223464663162366561653638666533663363656231616665626464613734383961223b7d733a343a2268617368223b733a36353a2234646631623665616536386665336633636562316166656264646137343839612d3631376438356332646431656237353663356566613063376266343262643432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226230396637333436346139383435376566313666363036353833393232373935223b733a33323a223663343836306433623565353262616331643562386439333134373139626134223b733a33323a223664353961343364323836653131323231666365653839356334373439666264223b733a33323a223733626230623662303165663638376133313565623333336538633938643630223b733a33323a226337346563303462356138346533666565663437333266326362386662363663223b733a33323a223864656166373136306239303361616461363532613066326664313162653837223b733a33323a223339643261646165303061366531373435663834393931636464646337663565223b733a33323a223961366532626564303139306664363034333231366236383131633133346264223b733a33323a226532363864623733373434396139396438313864373637613939333031376336223b733a33323a226165363833333136326430326564636134653163636664313565383462316537223b733a33323a223330323936366135643463633436306134646466386661633063373561343939223b733a33323a226466613539326437373633616633393265393138623931633835633330326330223b733a33323a223334656538633564613534663134356439633131386534343733313862623766223b733a33323a226664363566353438626162326362663632306466386230343835356265373334223b733a33323a223638353262626231313961666264666236623063656530666631393236373561223b733a33323a226663383332623236613837353336663937363666333432346539653638393039223b733a33323a226335643039383538316465326539353135653938363033353234323564333237223b733a33323a223239623964356531323461636436613436356566343538303539326239633963223b733a33323a226561373235343335666535623236616336653361636531323434636464663931223b733a33323a226432363466363335326636353035363633336430393661653933326530306138223b733a33323a223838393232643237343066393036386333623964336630313836666334316466223b733a33323a223136316262313235363333653439383037636363616537623664396666353463223b7d733a343a2268617368223b733a36353a2231363162623132353633336534393830376363636165376236643966663534632d3838393232643237343066393036386333623964336630313836666334316466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223238323463376664323562303363663130353265663836363931316330353231223b733a33323a226334393363333531643232313666623336643836363338356536343430636461223b733a33323a226433386132316462653735353862366339373863626138366238353734303333223b733a33323a223137613432363134333536656231366262353561653231383338643139376561223b733a33323a226464383334386639333039633534663362646461323731333366636437363834223b733a33323a223936343135646639646434323430303437653538303130393339353935616161223b733a33323a223366666531633739333435356437363861343031613862643061363034623664223b733a33323a223234656232316332646438633434303365623635316665383263363232393031223b733a33323a223337363632356537313831633039353362643132666236363339646336393261223b733a33323a223964393638386164333535656335363462306332636534643165313537623338223b7d733a343a2268617368223b733a36353a2239643936383861643335356563353634623063326365346431653135376233382d3337363632356537313831633039353362643132666236363339646336393261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226230653166313263653339396131393162303932626363366230323036336236223b733a33323a223739613838333135356365653361616133326632633234666664663930376461223b7d733a343a2268617368223b733a36353a2237396138383331353563656533616161333266326332346666646639303764612d6230653166313263653339396131393162303932626363366230323036336236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763418300),
('hmu77qund550ebqjd7ubrevsv7', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235303631302e33303337323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d67346e31746f72626f7337613071383766766e633676727036223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239323434303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223066646134313234326164643637633835663331333633613731306538383861223b733a33323a226261303633376661643435393239623661643935363835633135613763633166223b7d733a343a2268617368223b733a36353a2262613036333766616434353932396236616439353638356331356137636331662d3066646134313234326164643637633835663331333633613731306538383861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1762250610),
('i5s582a77r90kj7o1i32nhnbo8', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333032382e36373836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226935733538326137377239306b6a376f316933326e686e626f38223b7d7d, 1763183028),
('i6v6he91jsfpif15t34g31h486', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323031392e38333535333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2269367636686539316a7366706966313574333467333168343836223b7d7d, 1763082019),
('ic5c28gk00o3av9dkqsa24gpeq', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938332e3738313835323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696335633238676b30306f33617639646b717361323467706571223b7d7d, 1763081983),
('imitrgdo9ga7nql3r046642ggp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038333031372e30383133353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696d69747267646f396761376e716c3372303436363432676770223b7d7d, 1763083017),
('iouhag03i38cuh7h17be10dnlt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353630382e3531343333353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696f7568616730336933386375683768313762653130646e6c74223b7d7d, 1763065608),
('j5bovl0c2b24ia4gprbk70cpfm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333136362e3630333730373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a35626f766c306332623234696134677072626b37306370666d223b7d7d, 1763183166),
('jakl0gsfviod1ckg6qaq7lff24', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333934302e3933333134333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a616b6c3067736676696f6431636b6736716171376c66663234223b7d7d, 1763423940),
('jo7kgvd9rupm8occbs2luq91qj', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323031382e3634313735353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6f376b677664397275706d386f63636273326c75713931716a223b7d7d, 1763082018),
('jqgpu14rmq8tknmls3vrh2csl2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333933302e3334393239393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a716770753134726d7138746b6e6d6c73337672683263736c32223b7d7d, 1763423930),
('kdmo8ljc37h2qsl3faah1g2im7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323832342e3139373033333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b646d6f386c6a633337683271736c3366616168316732696d37223b7d7d, 1763082824),
('kegpa542ergpbqrjq10p16rus5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323832372e3132393638333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b65677061353432657267706271726a71313070313672757335223b7d7d, 1763082827),
('kelf9h77s87o43tmtr3gk28ht5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032302e3236353838353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b656c66396837377338376f3433746d747233676b3238687435223b7d7d, 1763082020),
('kmvm2pbij5hbe4aphj4s1iq6do', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032332e3034363038343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6d766d327062696a35686265346170686a347331697136646f223b7d7d, 1763082023),
('ko4oma5caadch3l7893dg1bfjb', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134362e3534383932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6f346f6d6135636161646368336c3738393364673162666a62223b7d7d, 1763082146),
('kujdpftp99cpvjnc9e12hnud3c', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432343239332e3536393037353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b756a647066747039396370766a6e6339653132686e75643363223b7d7d, 1763424293),
('l190ch9m4vqgj5bc57cr9b5s76', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323832322e3134333130333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c3139306368396d347671676a35626335376372396235733736223b7d7d, 1763082822),
('l4dvd171sphl4e1qb785m0tb8n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353333342e3832303735373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c346476643137317370686c34653171623738356d307462386e223b7d7d, 1763065334),
('la6mj9uf079mhgnnehcljt33q9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353532342e323738393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c61366d6a3975663037396d68676e6e6568636c6a7433337139223b7d7d, 1763065524),
('luc8jfm6ulblqbhrlsa8m4hgpt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323831362e3834333339333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c7563386a666d36756c626c716268726c7361386d3468677074223b7d7d, 1763082816),
('luna9949ed5j52sg927mlm2l61', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134352e3830343839383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c756e61393934396564356a353273673932376d6c6d326c3631223b7d7d, 1763082145),
('mbp811ojdkr7hr4b446g183aas', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938322e3037383438313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d62703831316f6a646b72376872346234343667313833616173223b7d7d, 1763081982),
('mgoge8pc5n691pelaa31jutpia', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353732362e3135363939353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d676f6765387063356e36393170656c616133316a7574706961223b7d7d, 1763065726),
('mkpq060orku3ke75o38erf7do0', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333031313033352e3834303631333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326e6a35666671696364756d6c736576676e323770626b35666e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333031343231353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333031343632373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333031343633343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223564343361396136313362663138653462323933343966643862383261363038223b733a33323a223961646463313966376335313162373866303731383938313663393530356135223b733a33323a226462373463353530386538646232623766323738636362373439623530616430223b733a33323a223133323032383362333930653339393233613934336139306137343535653564223b7d733a343a2268617368223b733a36353a2231333230323833623339306533393932336139343361393061373435356535642d6462373463353530386538646232623766323738636362373439623530616430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223532366361323764383238666235666638336230376662346461303831626631223b733a33323a223665323335373032626531303161393464646336353961333766623235633135223b733a33323a223961346637396230373037356433383933303831363136613531336137336135223b733a33323a223762313462643463646336343637376230616432383039613336393734333433223b733a33323a226233313431383239333532653837303066663239613631346432353831373662223b733a33323a223039643131313261363536653631343765613665643939393264613532393230223b733a33323a226534653836383764643931663166646338346132653635306631383332353863223b733a33323a226364633166333663376231656132346336623137653433653932666339303163223b733a33323a223365343061613363393330363961366163366237633635323830653764336234223b733a33323a226630343662346661643761653336633665353837326538386561626266666633223b733a33323a226465316163323965653264656165373333636438663833353261306331343036223b733a33323a223261363835376539383938356166323735626639643866353666346434343266223b733a33323a223265313037613935656162363665663663613164303435393931323963393338223b733a33323a223866623931333765373937366337323938336437376235383138323231326339223b733a33323a226132313664343964663239343232323137653835326333363266333835353730223b733a33323a223965303538343732333435623834316232613230663531626234343263616334223b733a33323a223032323633376536366233643932363835646166333435633438616138636463223b733a33323a223634373335336262313632373365356661376430376666326363396334393338223b733a33323a226364396566306562613663373730646261393233616532373238343833613535223b733a33323a223938633835333165356633613131386438626234343963336232626265613931223b7d733a343a2268617368223b733a36353a2239386338353331653566336131313864386262343439633362326262656139312d6364396566306562613663373730646261393233616532373238343833613535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226538613763373234353134333533613437353761623135393765303462313632223b733a33323a226136306562376336393666643761326637326365373361363336393838666635223b733a33323a226339376134306436663232393937346561633062613164396566646636383339223b733a33323a226131303133396264653030666565626436636331333765643462336465363462223b733a33323a223962346436313863353130376433313030346165303661666366363933643265223b733a33323a223131336530303565646364303466386539343962643761373865313562346633223b733a33323a223765316662363134303061663834346234333032343937626534366634616238223b733a33323a223633393635613230623138316661393137313431306661623730653232666265223b7d733a343a2268617368223b733a36353a2236333936356132306231383166613931373134313066616237306532326662652d3765316662363134303061663834346234333032343937626534366634616238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763011035),
('mmhjcn8fagpjaaahp414h998fv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323836352e3034383132393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6d686a636e38666167706a6161616870343134683939386676223b7d7d, 1763082865),
('mpbbdp0655b51khp1taprjgsu0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323938362e3432393435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d7062626470303635356235316b687031746170726a67737530223b7d7d, 1763182986),
('mpdo5vpanc9fft2ghaloqk81k1', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938302e3731363238333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d70646f357670616e6339666674326768616c6f716b38316b31223b7d7d, 1763081980),
('mqqvcple3plj25jseijhvgjlga', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333137302e3632333537343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d71717663706c6533706c6a32356a7365696a6876676a6c6761223b7d7d, 1763183170),
('mrbdm73s32maidgiutv2bn8qbd', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431373337302e31363232373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226330393033766d65686e726165616e683674326a37306538356e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333435383537353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436303536333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333436303034393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333436303138353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223466333164386661383839373832643266353431393839303061656162393564223b733a33323a223630373932643133643638353834366336633733303964623564646131393863223b7d733a343a2268617368223b733a36353a2236303739326431336436383538343663366337333039646235646461313938632d3466333164386661383839373832643266353431393839303061656162393564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34343a7b733a33323a223964623766343864623436646631613136393833343232343331333337643765223b733a33323a223335613433333638343136616334613835303437303264323938353865616363223b733a33323a223263386530383231363833336334373663623238313932373135653164353938223b733a33323a223136353966366137343834373864663138396639623764336535316536353635223b733a33323a226363316564623666326139633263303265333837303066383862303065393037223b733a33323a226538366561653631663563383265303336323563366362353563613030383439223b733a33323a226564316535613539633664613763636134376663306433383963616539303533223b733a33323a223435613564306637383636353134373830343239326634333430616638326437223b733a33323a223864363731303638323063333632343862353234313266383339613836366631223b733a33323a223336333364613436636561343834633630356638323261653730373239343437223b733a33323a223039343532373237376266643163663434393233656537633763363366383837223b733a33323a223037616434363130333130333662373537646633663062633137326530636561223b733a33323a226164666562346632366266646362313562656234353830353037363463656437223b733a33323a223935383834333139393065656265386631376534386636373238613336343232223b733a33323a223066383430303136353138376662653436343464623330366262653730343061223b733a33323a223930316466303731323734333932313336653432336139303662323834633037223b733a33323a223634363938363230376364623166306333323961393433366461656130653038223b733a33323a226334643165333464306264666466323365663530383131346563656266663266223b733a33323a226664626663613563656234333365356364393566663862316163663561313032223b733a33323a223737313136333232616438653037316235626666356463323539383934373962223b733a33323a226666313961623937323465626434353162336637356465343832376564623336223b733a33323a226461376232356362396530353035396231333033306330343837613134343965223b733a33323a223935656538303231653566383763653634353133306561316563386535386633223b733a33323a226438643339363035623439376334393138306633353130313833623664396364223b733a33323a226162646561306133653063336162653136346131333462346534653566316462223b733a33323a226634313433323962626463373864633531363138643864656331633234343034223b733a33323a223639646538353931316632396437326464393731323439376562663863313466223b733a33323a226232303939666635303761383132306531313862383636386533356263336630223b733a33323a223131343931383137653636373166383539323064316434353332383861613262223b733a33323a226261323435303964343865313231663833666431663739393562653536316165223b733a33323a226330626530613530376532313830616633633538633432613130643034633364223b733a33323a226339383938303766306464376333393366303131386361303133373663383833223b733a33323a226133616266333737336661306436323038393163326166306138623531633237223b733a33323a226662366430316366643631663633636663626531333332613238666562663062223b733a33323a223363623432343631363533666363313236626332383064663530353138303630223b733a33323a223230316537626230373563633966393961633064363939313061393664383164223b733a33323a223162343432646630326236363264616164383366366337383437373534303564223b733a33323a226664306233663538366235633663336162346633313634643033343939643832223b733a33323a223236336235613736396663656538343233383665386563653565383032613562223b733a33323a223663613764343835356433656635326666343437336231613036653339666337223b733a33323a223634666166643836396337323230346133386437653334636232383537346138223b733a33323a226466316433306363633234393737373736326335333435303239306135383737223b733a33323a223930326563623038626333626166613232313535623635663633353134653532223b733a33323a226135613437386564656233303563353266356162616666656636653431656635223b733a33323a226530623832626635666231653732333430656332383933393865396131393133223b733a33323a223936393030653132393838333331646163633132623237373131326636636132223b733a33323a223064346165393038396461643533383938326465383766373032643566376365223b733a33323a226263613665663735343532383437363064613163643962346332393264656463223b733a33323a226365303038303830343537333230343161623261376633323037643636343333223b733a33323a226236313831316633636537363562316637303630363634323631313936386166223b733a33323a223366626666653734326133376631323561303035373634383433376135636130223b733a33323a226633323366366137666235646534656535353033323161393962623566326235223b733a33323a223237663432303733613161633232383738363835393734363166356462393739223b733a33323a223430376138616665643163336535373930303838616661353636393963653662223b733a33323a226236376466653832343936353966343431666438393031323430356134663239223b733a33323a223539353534616362393965643462373330333161643133396139333530396362223b733a33323a226235363930393264653035623763613632653261383138656135303834323161223b733a33323a223237303164663136336337306632653262363366313765613866333335666133223b733a33323a226634663765653535333763306232386163393735356633333535613064383366223b733a33323a223162313739313638623333323532313631343764346238333463326539316164223b733a33323a223038336365356262613666633632343439343837633138366434343933333265223b733a33323a223439613633356164636461623463313463316265386232373633656566306436223b733a33323a226661646534613638616332353736366664643238386234366239376630316132223b733a33323a223166356362613861633763316364353362313761313564373433323332666236223b733a33323a223665316139323635613138623965646331366661353833333135643733373262223b733a33323a223534333130623565306230633863366565343431306466656433303134373536223b733a33323a226434363930303565623638323165356364343866323434313338383236386266223b733a33323a226239656235383432326134303839336262303363626663343639356236343636223b733a33323a223435353733353565353934383063383238333463613161303561646133316562223b733a33323a223835623561336564633532316131353332366534303337656536396432323661223b733a33323a223039666333363765616563363534343261363338326631656530643365313832223b733a33323a223463346436396564386239383162363561323634656433653632623234646138223b733a33323a223238616234316638663036633736623261636466323531646364366237333839223b733a33323a226364343162653039383338303135356665623962353865393830653062366233223b733a33323a226333326530313636656332336563323036306233326632633634316330633762223b733a33323a223936653366666637616361346537613933643538326632323862613564313465223b733a33323a223661336531393732356364303233396463343731626436373262376232626264223b733a33323a223562396363636436303563313264313938663562323138613832353563346534223b733a33323a223037306136303034383665653139666338623432303663383764633830613331223b733a33323a226539326265613133626465333761643237386464626262616637343835316361223b733a33323a226661396565653266306232356139666162353532366166366537313034376536223b733a33323a223636656530343162663566646238633561616233646366353336353337323133223b733a33323a226531346461626233343261633161383735383233613037393463353462616137223b733a33323a223236376162353338386165653432356165633966376438306430336332333339223b733a33323a223836343639313465333237643438636536643736303438383332316631646535223b733a33323a223334336238663931366632353832623332396461366166323138336633353535223b733a33323a223830636439313333336166663537616336346334613364366331343839663864223b733a33323a223365636537663037386637326430373831663436646433623932396239343238223b7d733a343a2268617368223b733a36353a2233656365376630373866373264303738316634366464336239323962393432382d3830636439313333336166663537616336346334613364366331343839663864223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226630663639323534626637336465633838626536386234656563383238343538223b733a33323a223034646636326364666461346237356536656331623030386632363633356637223b733a33323a226638303430633036393930613466363732373530353061353130346366306235223b733a33323a223263323065643765373861396137623431623166353063336166353635383938223b733a33323a223463386464303666316261323236613831333166616463323433613837636465223b733a33323a223061303336383938373331653835343633343264393364343538313564303862223b733a33323a223364663363616665613536366364633366363638626664366432343235623761223b733a33323a223561346531323636373538636136663833356138383335636666316130613065223b733a33323a223765343435623066363331613639393462353531353836373634303364636263223b733a33323a226463653766303939376231623433383165383261346638666363336166623332223b733a33323a226139643534393933316531323266646131373063663535636337356262653266223b733a33323a223334333739313935323866346130656665656332663135396134663863373064223b733a33323a226262303638653661363037353734376563623966363066346461316633373862223b733a33323a223661366536663335363332396361363436366465333338323738633262366561223b733a33323a223537633934653939363066613362393064643065653130666365653437663730223b733a33323a223966363161616164663935316536326265646538656535383234383365633566223b733a33323a223237623334316266326133623031663237616333313563363134346265656165223b733a33323a223561643339353634643634373831313433333566636435353763333562343064223b733a33323a223336323066616130633764633962323965633430656161336563343837643166223b733a33323a223162343036333338656262386665326439643335376464373163343032626363223b7d733a343a2268617368223b733a36353a2231623430363333386562623866653264396433353764643731633430326263632d3336323066616130633764633962323965633430656161336563343837643166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223035313131353537383364336362313065626163666439373061656638326665223b733a33323a226261313566396233363631313134643735623835313737313564643931306138223b733a33323a223631623938626331353062343164306666623465363236653862353562383537223b733a33323a223163393132366634356366663565333136633433373535376335656131346634223b733a33323a223661643264353838646332666431383239313732663738326431663330636561223b733a33323a223938363134666638623536636666346261343032623236613031363432356161223b733a33323a223636336332306632303031663934313931633831396233313030313336623163223b733a33323a226638616264336565383162653666313233316466663937316364656231346636223b733a33323a226366643736613733666233383336653837343236653432663131393263613963223b733a33323a223466623836626166613265376131393630616265366635306631333735646337223b733a33323a223730663932363565633561393638626236313135363236636265373530373236223b733a33323a226335303639353462653962393737373035386639306265343235346663333532223b733a33323a223135343137333038373632343231306266363331653238383263633066653839223b733a33323a226434646132343632356437316431303366653635383862646365616363336637223b733a33323a226462313666656430373630656566633464643361643637353936363962643035223b733a33323a226632313035333438396331646531616566663564373435356636633066353262223b733a33323a226130376362383434346333353038653263656235353535383462316562363662223b733a33323a223037633465393465333164363561326466613137656136363933613765383731223b733a33323a226261346466383266666163326665636535393035373331663434323032626666223b733a33323a226363653962373335353436323861323861336165343261383666383761636636223b733a33323a223033646566343831383739363831313134366133653361663035333635363339223b733a33323a223065643035643136643730393538353736636561313665303463333738323561223b7d733a343a2268617368223b733a36353a2230656430356431366437303935383537366365613136653034633337383235612d3033646566343831383739363831313134366133653361663035333635363339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763417370),
('n3op4837uegfd8gjspkvkufi2d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138343134372e3530343732383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e336f7034383337756567666438676a73706b766b7566693264223b7d7d, 1763184147),
('n7nl2134r4n1bbrcu2i7khh7f6', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333431353337352e3037363333363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676e36683265706a34706f6930666d6c396d71356a6236656676223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333435383439363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333435383536393b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226237646338616265383166656237313735663762316662386138346537343530223b733a33323a226434613438643761643733613262623736376134626266396662623366393961223b7d733a343a2268617368223b733a36353a2264346134386437616437336132626237363761346262663966626233663939612d6237646338616265383166656237313735663762316662386138346537343530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a226466633461373938613230336536396335323538306363356465346661316538223b733a33323a226139386136303661336338626263316130383738613630303236323731353433223b733a33323a226133383564323430356130616639383962383637316161386265346433666239223b733a33323a226364643065616232346465633930666662643537666233363263313530393761223b733a33323a223438363330356430636630366666653064333837633732386431396435616663223b733a33323a226664336433366439386137653865386535353634653362643539303433623933223b733a33323a226339613039383633353162393961626535383534353138646632303730366562223b733a33323a223631373835333663633061383834336434316262626562633232366361353261223b733a33323a226364326264303838383266396163633061353239366635313365636638646631223b733a33323a226630303263376165393137303434653732323463623830323565663035333333223b733a33323a223338666162393331643164383231323862636238306564633035383436393564223b733a33323a226530633439313436663866653833396438616230616566643332313861303766223b733a33323a223334663137613730646465303162306364613434386535343462376635313065223b733a33323a223139346662666463333030653534303062386434333639663637386533636633223b733a33323a223231613237373461353132656130303638336337623734376562333438336162223b733a33323a223730313864656463333939343132343930653632363338333632373735653633223b733a33323a226230343963353534643466363334393930386130376231393562613865373061223b733a33323a226166316236653565393932653866363336323238663036303433323430653561223b7d733a343a2268617368223b733a36353a2261663162366535653939326538663633363232386630363034333234306535612d6230343963353534643466363334393930386130376231393562613865373061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763415375),
('njip5gvjpim1lcumjq5qafbri9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353039332e3135383037333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6a69703567766a70696d316c63756d6a713571616662726939223b7d7d, 1763065093);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('nmfepsa2v8dcnarfkn2si5knds', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432343239372e3438343239323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6d666570736132763864636e6172666b6e327369356b6e6473223b7d7d, 1763424297),
('nokv3rrd92668g8k6fu5ikn9k7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333031362e3936383930333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6f6b7633727264393236363867386b36667535696b6e396b37223b7d7d, 1763183016),
('ns1h2tc1gus7plvsrrv9pjh1hh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323831382e3834303134353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e7331683274633167757337706c767372727639706a68316868223b7d7d, 1763082818),
('o18o4n8hn4r59stacl5sr2f4jp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333137323231302e3430343938363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f31386f346e38686e34723539737461636c3573723266346a70223b7d7d, 1763172210),
('o3dh3csqb2lr1njai5f3g61ud3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333737382e3331353331333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f3364683363737162326c72316e6a6169356633673631756433223b7d7d, 1763183778),
('o66koi3td3c2tpn73km9sakugr', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393134392e3532323435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f36366b6f6933746433633274706e37336b6d3973616b756772223b7d7d, 1762219149),
('o79hp80rea2j29ub4hdunkek2p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323831352e3238333733383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f373968703830726561326a32397562346864756e6b656b3270223b7d7d, 1763082815),
('oecqhjhd09oavhlhqbi5o73t6o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732352e3132383435393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f656371686a686430396f6176686c68716269356f373374366f223b7d7d, 1762218725),
('ooeqrkis0c136d3ts3m5ira4ka', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732352e31323834353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6f6571726b6973306331333664337473336d35697261346b61223b7d7d, 1762218725),
('pd1rfh1ueladffft9c9stlj2a0', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323836302e3038353039353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227064317266683175656c61646666667439633973746c6a326130223b7d7d, 1763082860),
('pf504gn8ihvr69v07gb8l8ngb7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333032312e3836373033363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227066353034676e386968767236397630376762386c386e676237223b7d7d, 1763183021),
('pfn3bnuapkgn1nnsv41j98j3vt', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432333933342e3033333337343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270666e33626e7561706b676e316e6e737634316a39386a337674223b7d7d, 1763423934),
('pkei677815bnkk7dpqq1c2o1bf', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235313337302e383436373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2236367366373336746b6f366964736c34626331636a6b6267636f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333831303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239343231393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239343231343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223036646135346563373639613665313065383664366365636639383635333535223b733a33323a223233393364386132323131303137653435313330663533623266636332343133223b7d733a343a2268617368223b733a36353a2232333933643861323231313031376534353133306635336232666363323431332d3036646135346563373639613665313065383664366365636639383635333535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226333353634316566656365323932323432633762343831383931393338386333223b733a33323a226461643437383461663233393334363833313861303636633338636431323863223b733a33323a223430343437353233396336653235626364333232366261663863333139643337223b733a33323a226637376464393761636466363531653663383930316365623738613761326537223b733a33323a223732666664323661376639363231613561336638663338383563303035306239223b733a33323a226536636361633738353633626530313362626432333038336431633832626530223b733a33323a223265356362313132316633343864326133616662303231343132316535396238223b733a33323a223839303830303035386230666132306138623130383634323939353462333739223b733a33323a223236316132386365363038383662613031323561386632616564643063326561223b733a33323a226536336663303464346130663639363631616661633962356631333731363736223b7d733a343a2268617368223b733a36353a2265363366633034643461306636393636316166616339623566313337313637362d3236316132386365363038383662613031323561386632616564643063326561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223565303835646364663732303136626431376261643338396464383938313163223b733a33323a226135333064623561316161613837313033663065353661633266333862326530223b733a33323a226632346435356637366139616330666564613430316364396235623539363633223b733a33323a226261353862306466643139366333346264313037663266373930383239343566223b7d733a343a2268617368223b733a36353a2262613538623064666431393663333462643130376632663739303832393435662d6632346435356637366139616330666564613430316364396235623539363633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762251370),
('plgm9tcj33oug55fijqb8dok0e', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373035302e3734303530313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223572723736656765677630643970366239366639726b6d6f6133223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323232373937313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238383432393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323236313937373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323233303032363b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226633376639396637636434383466353534326564643862396139356539633437223b733a33323a223862303466666532376530626363366333663766383130393663323131613833223b733a33323a223961336634376431303333646230383862343530306132633937313331393738223b733a33323a223038663537353361346561333363386461656233316232383739333563393061223b7d733a343a2268617368223b733a36353a2230386635373533613465613333633864616562333162323837393335633930612d3961336634376431303333646230383862343530306132633937313331393738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226434323031636361383432303065306534393562653537303262393032636236223b733a33323a226339346339663531303834656230383061353235643261666566306666366363223b733a33323a223132303562333866386130646331346666303530626233633163333533343431223b733a33323a223532386530623161386362636238313032626631656336636362643236366539223b733a33323a226336316634336333353765313663353633386635326531396337396631653437223b733a33323a223131646661616262383962343133356263393233383734303739326166616131223b733a33323a223964633137343164633863633537626231643832623632623438323831376630223b733a33323a226436616538306637363436376234306263363633306633623535343631646338223b7d733a343a2268617368223b733a36353a2264366165383066373634363762343062633636333066336235353436316463382d3964633137343164633863633537626231643832623632623438323831376630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226330376433376263313331383935316438353134363736376534346363356432223b733a33323a223438363839653332376464333039343832623031353331663231383931316630223b733a33323a226463363663376461313561333630653230643033316535623635613630393161223b733a33323a223966643037636132326138313930383837313264646433396134303063303630223b733a33323a223836623434383433613436663030356266343736323332373430396432643764223b733a33323a223461376438303164316266376338636330383130323835353638623130393439223b733a33323a223032306662366238323638343634303763623235633637313138643363333331223b733a33323a226631646238656332353766663031353033303831633335306134386135303639223b733a33323a223264666432393462333863386533346665386361663464656234383130613030223b733a33323a223334646334313461653630613565353661393064623335303238633335363333223b733a33323a226637373431646165383262663561643063353232376462373135343339386161223b733a33323a223132623230636635323163363462353963613530353265653933396364366438223b733a33323a223161356631396334613932353530633733616639666263373363303061623132223b733a33323a223837353662376231323162383866613836383863333831636665373232343238223b733a33323a226363613465333133666461393638306432663334633638336363383137333435223b733a33323a226532383432343033336135633330366665613764336431366231313638613965223b733a33323a223434313530376332343638333032366438663062633330323061646462393762223b733a33323a226336653232306437316364393137643235383737303839326363363431323561223b733a33323a223139336262626137613064356630393630336566346636373566303464323632223b733a33323a226462633938353838363334343436336362633363333932336461616636323133223b733a33323a223437623237363931376263323137353135623836326331616639356538373165223b733a33323a223561376530363234653661613362383239356661326162383734633938373364223b733a33323a223732646365663231396666346465613763323532346233653033383162363439223b733a33323a226633323931346333323138386439333162623265363639376131393266336331223b733a33323a223461313933333431663663383539306432653463343436396361613562383937223b733a33323a223131376236653132303433623864666538383330333335613237616333613232223b733a33323a223534633162306134323936646237303839636632633764303131656330343933223b733a33323a226431623738306366303231613836666332656566303365633066326335646133223b7d733a343a2268617368223b733a36353a2264316237383063663032316138366663326565663033656330663263356461332d3534633162306134323936646237303839636632633764303131656330343933223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226638623633383765653930373732313630353030653930303937366666353439223b733a33323a226137303438613264306136666666643333393131313664386637656463313564223b7d733a343a2268617368223b733a36353a2261373034386132643061366666666433333931313136643866376564633135642d6638623633383765653930373732313630353030653930303937366666353439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247050),
('q1pt337uhpa9b02mhl5u5prk3o', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032302e3738353635313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227131707433333775687061396230326d686c35753570726b336f223b7d7d, 1763082020),
('qen1ir8o2hqprgn6c259jhesd3', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333036353836302e3535363231373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271656e316972386f3268717072676e36633235396a6865736433223b7d7d, 1763065860),
('qj15jdvdbv9ibo5afbmulcsad7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313938322e3732303131343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716a31356a64766462763969626f356166626d756c6373616437223b7d7d, 1763081982),
('qkkqi4ne080omed56uu7ferrs5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333432343239382e3438363532343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716b6b7169346e653038306f6d65643536757537666572727335223b7d7d, 1763424298),
('qq1fk0b2bhpusi48pqo88cbbrv', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323832352e3932313537373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22717131666b306232626870757369343870716f38386362627276223b7d7d, 1763082825),
('qsli8dc7jggpvt9t6209lut7rm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038313937392e3438383435353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271736c69386463376a67677076743974363230396c757437726d223b7d7d, 1763081979),
('qtlhmprpisks2qqdodhhvl6hj5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138343031352e3830333537313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271746c686d70727069736b73327171646f646868766c36686a35223b7d7d, 1763184015),
('qv953eg3dvd0srv5d3lmem04sc', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323830362e3035373934353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227176393533656733647664307372763564336c6d656d30347363223b7d7d, 1763082806),
('r2al0kvpa4nm55mrne537t9h7s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138343031392e3839383335383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227232616c306b767061346e6d35356d726e653533377439683773223b7d7d, 1763184019),
('r4ki2upm2g2jvd8l9u8i9jlmk4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393134312e3235333638343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272346b693275706d3267326a7664386c39753869396a6c6d6b34223b7d7d, 1762219141),
('r54364ht0aggesq36ta4aqfu9e', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134382e3939363232343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227235343336346874306167676573713336746134617166753965223b7d7d, 1763082149),
('r7hhu8tfboeh0c50kqrlptg2q2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333733372e37353839333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227237686875387466626f6568306335306b71726c707467327132223b7d7d, 1763183737),
('rg6arsv1nlv27448niqtdt5ph4', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393136332e3331373230333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272673661727376316e6c7632373434386e697174647435706834223b7d7d, 1762219163),
('rmc3rt9cmls3o9ivgg2pthmr1p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323939332e3630383932313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726d6333727439636d6c73336f3969766767327074686d723170223b7d7d, 1763182993),
('rnbdgq0bh33g7g2mfv4j61ansm', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134352e3235383231333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726e626467713062683333673767326d6676346a3631616e736d223b7d7d, 1763082145),
('rtdnf004r5oihgkjqrbgcpplbh', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138323939382e3435383536353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227274646e6630303472356f6968676b6a717262676370706c6268223b7d7d, 1763182998),
('scu6kvuiab8dup5lpo3ljjtvi6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323834372e3731393531323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22736375366b767569616238647570356c706f336c6a6a74766936223b7d7d, 1763082847),
('sdsss7npm633h64158d78kf95b', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234383639362e3530333135363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316971766c66733671306469723276696d6d3472393932713835223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313731323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223862316162386335613365303661616362653534636666303935396531373636223b733a33323a223430303430336165663039353235373233666631653463383731653237383438223b7d733a343a2268617368223b733a36353a2234303034303361656630393532353732336666316534633837316532373834382d3862316162386335613365303661616362653534636666303935396531373636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1762248696),
('stelnmgc386q72jffv0a9su4ai', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231393136332e3236333233313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227374656c6e6d67633338367137326a6666763061397375346169223b7d7d, 1762219163),
('tc1eaqsp30241h7teglr1nvms2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333038332e3736353639383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227463316561717370333032343168377465676c72316e766d7332223b7d7d, 1763183083),
('telg0nm1n1trd5vmek00ht60tp', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333138333933302e3239333937373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274656c67306e6d316e3174726435766d656b3030687436307470223b7d7d, 1763183930),
('tldsav4msc6aq2bar3cddufjjs', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323831332e3333393934323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746c64736176346d7363366171326261723363646475666a6a73223b7d7d, 1763082813),
('tsut640c6mfe7kgtflljfgpicn', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038333030352e32303535323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227473757436343063366d6665376b6774666c6c6a66677069636e223b7d7d, 1763083005),
('tve7hp741fumam73j49ecpniem', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323231383732312e3338363730363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274766537687037343166756d616d37336a34396563706e69656d223b7d7d, 1762218721),
('um4s7ndf6qsbfk8dfm2koh24le', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032312e3633303638353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756d3473376e646636717362666b3864666d326b6f6832346c65223b7d7d, 1763082021),
('uruu76sspq1343r54rmrn4ld9k', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323032322e3431313033383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227572757537367373707131333433723534726d726e346c64396b223b7d7d, 1763082022),
('v62fbiajp3o904h3hul721o42i', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323830392e3834333539353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22763632666269616a70336f393034683368756c3732316f343269223b7d7d, 1763082809),
('v6f6r1fu43d8b83nlf9stvhg8s', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134382e3634353134353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227636663672316675343364386238336e6c663973747668673873223b7d7d, 1763082148),
('vieda4ft5tkfcn3soqg3e2tmde', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333038323134382e32363533333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22766965646134667435746b66636e33736f7167336532746d6465223b7d7d, 1763082148),
('vma2o00ro09ltraae07ap79evs', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234383531322e3636353039313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226232353870327334706f72686439636c6a7630646a6738343263223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313433333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313639323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313639303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226133646230343633363361303038306135383631373735313963326439613461223b733a33323a223866353463663032393162616333343232333431306330356263353833613766223b7d733a343a2268617368223b733a36353a2238663534636630323931626163333432323334313063303562633538336137662d6133646230343633363361303038306135383631373735313963326439613461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223634393862663562363936663733613438346435336235343064396661633337223b733a33323a223338336133333139666465353738366537316462336462326161356336336531223b733a33323a226164303936663636666165636534643039373533353134306638333962623830223b733a33323a223961376235616534333232373639666265356166613135373834346166656130223b733a33323a223365366537303665663564646233363030626364333463666630646636373932223b733a33323a226138326334356430636639333064656335666537333364346130336162323432223b733a33323a226434376236353661323463373137633130306365633933393736646234373936223b733a33323a223133633361653865633236623964306236396632343536653035316664373330223b733a33323a223433353138316531633638303838383233313964316336323333643238313534223b733a33323a223966303738376534626264386566613236633030336435626433366266383334223b733a33323a223863663737636262343166636364383635646539633534643263636464616232223b733a33323a223936666534393261623430633939323030326238626131663739353964636261223b7d733a343a2268617368223b733a36353a2239366665343932616234306339393230303262386261316637393539646362612d3863663737636262343166636364383635646539633534643263636464616232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223730656534303564333232336236353366626561353030666462313463646435223b733a33323a223936393839656637643333363536383731623237386632373562383066643065223b733a33323a223334633162326639346264326638313439323535386666373961383564613836223b733a33323a226138323265663636306235383032616339383861646562356633343231383064223b733a33323a223335333835633662313636346261373239643537303339396166303535336631223b733a33323a223535613138633333303532626564303930333333343834643361303936313438223b733a33323a223233316436333434326631366139643561313365396463623761383032643031223b733a33323a223233623064626630333561653363616163376164306262626232663263313033223b733a33323a223539616138396263323965393932663834646162616164393132346164363261223b733a33323a223761616563613737653737613131633037366132396636643231383564356366223b733a33323a226130363231636333303766306265373531343663343236313636656337386463223b733a33323a223236343761363965643138343666623464393031613134646232633534333835223b733a33323a223630643832346264643434616439316265353731653137326130363737343730223b733a33323a223834373533656437326531313938363131373765373836653761626235633733223b733a33323a223932633063306331343465323638666238316632623165376164653064306334223b733a33323a226164343462633336626131313830396337323065643031623934353736363439223b733a33323a226536613261643738396435396465633761666463396430313734636533656531223b733a33323a223638653665393661623064653938393130326639653032383234356235313062223b7d733a343a2268617368223b733a36353a2236386536653936616230646539383931303266396530323832343562353130622d6536613261643738396435396465633761666463396430313734636533656531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762248512);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"boussaid.amine01@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('disable_jsonld_reverse', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('favicon', '\"\"'),
('installation_title', '\"OmekasAmine\"'),
('locale', '\"\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'boussaid.amine01@gmail.com', 'Amine', '2025-10-13 23:21:57', '2025-11-13 04:58:32', '$2y$10$mp0eBUzf6RWFh1NE6y6tzuW0RoIyWqMMmh0p8xUN5GSwadryImXUO', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'samuel szoniecky', '2025-10-21 07:17:01', '2025-11-04 09:34:31', '$2y$10$qi.5oWPbzQk.36IbJfvddOiR.VRPpl9vQXTXxduLGhrALubePbX7W', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(399, 99, 1, NULL, NULL, 'literal', NULL, 'Utilisateur 1', NULL, 1),
(400, 99, 197, NULL, NULL, 'literal', NULL, 'Jean Martin', NULL, 1),
(401, 99, 198, NULL, NULL, 'literal', NULL, 'user1@example.com', NULL, 1),
(402, 100, 1, NULL, NULL, 'literal', NULL, 'Utilisateur 2', NULL, 1),
(403, 100, 197, NULL, NULL, 'literal', NULL, 'Marie Dubois', NULL, 1),
(404, 100, 198, NULL, NULL, 'literal', NULL, 'user2@example.com', NULL, 1),
(405, 101, 1, NULL, NULL, 'literal', NULL, 'Utilisateur 3', NULL, 1),
(406, 101, 197, NULL, NULL, 'literal', NULL, 'Pierre Bernard', NULL, 1),
(407, 101, 198, NULL, NULL, 'literal', NULL, 'user3@example.com', NULL, 1),
(408, 102, 1, NULL, NULL, 'literal', NULL, 'Utilisateur 4', NULL, 1),
(409, 102, 197, NULL, NULL, 'literal', NULL, 'Sophie Petit', NULL, 1),
(410, 102, 198, NULL, NULL, 'literal', NULL, 'user4@example.com', NULL, 1),
(411, 103, 1, NULL, NULL, 'literal', NULL, 'Observation - Toux', NULL, 1),
(412, 103, 199, NULL, NULL, 'literal', NULL, '2025-11-17T18:08', NULL, 1),
(413, 103, 200, NULL, NULL, 'literal', NULL, 'Toux', NULL, 1),
(414, 103, 201, NULL, NULL, 'literal', NULL, 'Faible', NULL, 1),
(415, 103, 202, NULL, NULL, 'literal', NULL, 'Toux sèche persistante depuis ce matin', NULL, 1),
(416, 103, 203, 99, NULL, 'resource', NULL, NULL, NULL, 1),
(417, 104, 1, NULL, NULL, 'literal', NULL, 'Observation - Fièvre', NULL, 1),
(418, 104, 199, NULL, NULL, 'literal', NULL, '2025-11-17T12:08', NULL, 1),
(419, 104, 200, NULL, NULL, 'literal', NULL, 'Fièvre', NULL, 1),
(420, 104, 201, NULL, NULL, 'literal', NULL, 'Modérée', NULL, 1),
(421, 104, 202, NULL, NULL, 'literal', NULL, 'Forte fièvre avec frissons', NULL, 1),
(422, 104, 203, 100, NULL, 'resource', NULL, NULL, NULL, 1),
(423, 105, 1, NULL, NULL, 'literal', NULL, 'Observation - Fatigue', NULL, 1),
(424, 105, 199, NULL, NULL, 'literal', NULL, '2025-11-17T06:08', NULL, 1),
(425, 105, 200, NULL, NULL, 'literal', NULL, 'Fatigue', NULL, 1),
(426, 105, 201, NULL, NULL, 'literal', NULL, 'Forte', NULL, 1),
(427, 105, 202, NULL, NULL, 'literal', NULL, 'Grande fatigue et manque d\'énergie', NULL, 1),
(428, 105, 203, 101, NULL, 'resource', NULL, NULL, NULL, 1),
(429, 106, 1, NULL, NULL, 'literal', NULL, 'Observation - Maux de tête', NULL, 1),
(430, 106, 199, NULL, NULL, 'literal', NULL, '2025-11-17T00:08', NULL, 1),
(431, 106, 200, NULL, NULL, 'literal', NULL, 'Maux de tête', NULL, 1),
(432, 106, 201, NULL, NULL, 'literal', NULL, 'Très forte', NULL, 1),
(433, 106, 202, NULL, NULL, 'literal', NULL, 'Maux de tête intenses au réveil', NULL, 1),
(434, 106, 203, 102, NULL, 'resource', NULL, NULL, NULL, 1),
(435, 107, 1, NULL, NULL, 'literal', NULL, 'Analyse - Respiratoire', NULL, 1),
(436, 107, 204, NULL, NULL, 'literal', NULL, 'Respiratoire', NULL, 1),
(437, 107, 205, NULL, NULL, 'literal', NULL, 'Symptômes respiratoires légers sans complications', NULL, 1),
(438, 107, 206, NULL, NULL, 'literal', NULL, 'Repos, hydratation, sirop si besoin', NULL, 1),
(439, 107, 207, 103, NULL, 'resource', NULL, NULL, NULL, 1),
(440, 108, 1, NULL, NULL, 'literal', NULL, 'Analyse - Général', NULL, 1),
(441, 108, 204, NULL, NULL, 'literal', NULL, 'Général', NULL, 1),
(442, 108, 205, NULL, NULL, 'literal', NULL, 'Fièvre probablement virale, surveillance nécessaire', NULL, 1),
(443, 108, 206, NULL, NULL, 'literal', NULL, 'Paracétamol toutes les 6h, surveiller température', NULL, 1),
(444, 108, 207, 104, NULL, 'resource', NULL, NULL, NULL, 1),
(445, 109, 1, NULL, NULL, 'literal', NULL, 'Analyse - Général', NULL, 1),
(446, 109, 204, NULL, NULL, 'literal', NULL, 'Général', NULL, 1),
(447, 109, 205, NULL, NULL, 'literal', NULL, 'Fatigue importante nécessitant du repos', NULL, 1),
(448, 109, 206, NULL, NULL, 'literal', NULL, 'Repos prolongé, alimentation équilibrée', NULL, 1),
(449, 109, 207, 105, NULL, 'resource', NULL, NULL, NULL, 1),
(450, 110, 1, NULL, NULL, 'literal', NULL, 'Analyse - Neurologique', NULL, 1),
(451, 110, 204, NULL, NULL, 'literal', NULL, 'Neurologique', NULL, 1),
(452, 110, 205, NULL, NULL, 'literal', NULL, 'Céphalées de tension, pas de signes alarmants', NULL, 1),
(453, 110, 206, NULL, NULL, 'literal', NULL, 'Paracétamol au besoin, éviter écrans', NULL, 1),
(454, 110, 207, 106, NULL, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(6, 2, 'https://healthvoice.local/onto/hv#', 'hv', 'HealthVoice Vocabulaire', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
