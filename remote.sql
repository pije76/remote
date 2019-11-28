-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2019 at 10:47 AM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remote`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add email address', 8, 'add_emailaddress'),
(30, 'Can change email address', 8, 'change_emailaddress'),
(31, 'Can delete email address', 8, 'delete_emailaddress'),
(32, 'Can view email address', 8, 'view_emailaddress'),
(33, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(34, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(35, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(36, 'Can view email confirmation', 9, 'view_emailconfirmation'),
(37, 'Can add social account', 10, 'add_socialaccount'),
(38, 'Can change social account', 10, 'change_socialaccount'),
(39, 'Can delete social account', 10, 'delete_socialaccount'),
(40, 'Can view social account', 10, 'view_socialaccount'),
(41, 'Can add social application', 11, 'add_socialapp'),
(42, 'Can change social application', 11, 'change_socialapp'),
(43, 'Can delete social application', 11, 'delete_socialapp'),
(44, 'Can view social application', 11, 'view_socialapp'),
(45, 'Can add social application token', 12, 'add_socialtoken'),
(46, 'Can change social application token', 12, 'change_socialtoken'),
(47, 'Can delete social application token', 12, 'delete_socialtoken'),
(48, 'Can view social application token', 12, 'view_socialtoken'),
(49, 'Can add avatar', 13, 'add_avatar'),
(50, 'Can change avatar', 13, 'change_avatar'),
(51, 'Can delete avatar', 13, 'delete_avatar'),
(52, 'Can view avatar', 13, 'view_avatar'),
(53, 'Can add source', 14, 'add_source'),
(54, 'Can change source', 14, 'change_source'),
(55, 'Can delete source', 14, 'delete_source'),
(56, 'Can view source', 14, 'view_source'),
(57, 'Can add thumbnail', 15, 'add_thumbnail'),
(58, 'Can change thumbnail', 15, 'change_thumbnail'),
(59, 'Can delete thumbnail', 15, 'delete_thumbnail'),
(60, 'Can view thumbnail', 15, 'view_thumbnail'),
(61, 'Can add thumbnail dimensions', 16, 'add_thumbnaildimensions'),
(62, 'Can change thumbnail dimensions', 16, 'change_thumbnaildimensions'),
(63, 'Can delete thumbnail dimensions', 16, 'delete_thumbnaildimensions'),
(64, 'Can view thumbnail dimensions', 16, 'view_thumbnaildimensions'),
(65, 'Can add Menu Name', 17, 'add_menu'),
(66, 'Can change Menu Name', 17, 'change_menu'),
(67, 'Can delete Menu Name', 17, 'delete_menu'),
(68, 'Can view Menu Name', 17, 'view_menu'),
(69, 'Can add carousel', 18, 'add_carousel'),
(70, 'Can change carousel', 18, 'change_carousel'),
(71, 'Can delete carousel', 18, 'delete_carousel'),
(72, 'Can view carousel', 18, 'view_carousel'),
(73, 'Can add User profile', 19, 'add_profile'),
(74, 'Can change User profile', 19, 'change_profile'),
(75, 'Can delete User profile', 19, 'delete_profile'),
(76, 'Can view User profile', 19, 'view_profile'),
(77, 'Can add Client', 20, 'add_clientprofile'),
(78, 'Can change Client', 20, 'change_clientprofile'),
(79, 'Can delete Client', 20, 'delete_clientprofile'),
(80, 'Can view Client', 20, 'view_clientprofile'),
(81, 'Can add Profile', 21, 'add_freelancerprofile'),
(82, 'Can change Profile', 21, 'change_freelancerprofile'),
(83, 'Can delete Profile', 21, 'delete_freelancerprofile'),
(84, 'Can view Profile', 21, 'view_freelancerprofile'),
(85, 'Can add skill', 22, 'add_skill'),
(86, 'Can change skill', 22, 'change_skill'),
(87, 'Can delete skill', 22, 'delete_skill'),
(88, 'Can view skill', 22, 'view_skill'),
(89, 'Can add category', 23, 'add_category'),
(90, 'Can change category', 23, 'change_category'),
(91, 'Can delete category', 23, 'delete_category'),
(92, 'Can view category', 23, 'view_category'),
(93, 'Can add Project', 24, 'add_project'),
(94, 'Can change Project', 24, 'change_project'),
(95, 'Can delete Project', 24, 'delete_project'),
(96, 'Can view Project', 24, 'view_project');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$oI06ruxcBioE$Rb2d7jNvshKc4jk2rW+nm4VjuubISQa4R3dgpOvMmbo=', '2019-11-28 16:45:30.760184', 1, 'pije76', '', '', 'pije76@yahoo.com', 1, 1, '2019-11-28 16:45:16.925461');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `avatar_avatar`
--

DROP TABLE IF EXISTS `avatar_avatar`;
CREATE TABLE `avatar_avatar` (
  `id` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_clientprofile`
--

DROP TABLE IF EXISTS `client_clientprofile`;
CREATE TABLE `client_clientprofile` (
  `id` int(11) NOT NULL,
  `billing` varchar(80) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `website` varchar(80) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(13, 'avatar', 'avatar'),
(20, 'client', 'clientprofile'),
(5, 'contenttypes', 'contenttype'),
(14, 'easy_thumbnails', 'source'),
(15, 'easy_thumbnails', 'thumbnail'),
(16, 'easy_thumbnails', 'thumbnaildimensions'),
(21, 'freelancer', 'freelancerprofile'),
(22, 'freelancer', 'skill'),
(18, 'pondation', 'carousel'),
(17, 'pondation', 'menu'),
(19, 'profiles', 'profile'),
(23, 'project', 'category'),
(24, 'project', 'project'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(10, 'socialaccount', 'socialaccount'),
(11, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-28 16:42:28.720940'),
(2, 'auth', '0001_initial', '2019-11-28 16:42:37.134198'),
(3, 'account', '0001_initial', '2019-11-28 16:43:03.233378'),
(4, 'account', '0002_email_max_length', '2019-11-28 16:43:09.119281'),
(5, 'admin', '0001_initial', '2019-11-28 16:43:10.593971'),
(6, 'admin', '0002_logentry_remove_auto_add', '2019-11-28 16:43:16.388486'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-28 16:43:16.528455'),
(8, 'contenttypes', '0002_remove_content_type_name', '2019-11-28 16:43:20.702919'),
(9, 'auth', '0002_alter_permission_name_max_length', '2019-11-28 16:43:21.228559'),
(10, 'auth', '0003_alter_user_email_max_length', '2019-11-28 16:43:21.597172'),
(11, 'auth', '0004_alter_user_username_opts', '2019-11-28 16:43:21.744359'),
(12, 'auth', '0005_alter_user_last_login_null', '2019-11-28 16:43:23.741221'),
(13, 'auth', '0006_require_contenttypes_0002', '2019-11-28 16:43:23.856380'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2019-11-28 16:43:24.092820'),
(15, 'auth', '0008_alter_user_username_max_length', '2019-11-28 16:43:24.657103'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2019-11-28 16:43:25.191064'),
(17, 'auth', '0010_alter_group_name_max_length', '2019-11-28 16:43:25.541636'),
(18, 'auth', '0011_update_proxy_permissions', '2019-11-28 16:43:25.679423'),
(19, 'avatar', '0001_initial', '2019-11-28 16:43:26.877045'),
(20, 'avatar', '0002_add_verbose_names_to_avatar_fields', '2019-11-28 16:43:32.863761'),
(21, 'avatar', '0003_auto_20170827_1345', '2019-11-28 16:43:33.130382'),
(22, 'profiles', '0001_initial', '2019-11-28 16:43:35.116231'),
(23, 'client', '0001_initial', '2019-11-28 16:43:39.069587'),
(24, 'easy_thumbnails', '0001_initial', '2019-11-28 16:43:46.348575'),
(25, 'easy_thumbnails', '0002_thumbnaildimensions', '2019-11-28 16:43:52.772286'),
(26, 'freelancer', '0001_initial', '2019-11-28 16:43:57.152665'),
(27, 'project', '0001_initial', '2019-11-28 16:44:04.034348'),
(28, 'freelancer', '0002_auto_20191128_2245', '2019-11-28 16:44:19.966053'),
(29, 'pondation', '0001_initial', '2019-11-28 16:44:30.108333'),
(30, 'sessions', '0001_initial', '2019-11-28 16:44:35.586537'),
(31, 'sites', '0001_initial', '2019-11-28 16:44:37.211093'),
(32, 'sites', '0002_alter_domain_unique', '2019-11-28 16:44:37.991398'),
(33, 'socialaccount', '0001_initial', '2019-11-28 16:44:42.962594'),
(34, 'socialaccount', '0002_token_max_lengths', '2019-11-28 16:44:56.485618'),
(35, 'socialaccount', '0003_extra_data_default_dict', '2019-11-28 16:44:56.635982');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nu004ugg7txiguuylibd8f5axep4b1mn', 'ODk1NzFjNTY2N2Q5NDJmMGJiNDhkNjg5MTk5MzUwM2E3Y2U1Y2YyMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OWNjODBjNzZjNmRhNTRlN2VmYzk5NTBiZjU1ZjVhODk3Zjc1NmE4In0=', '2019-12-12 16:45:30.930566');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `easy_thumbnails_thumbnaildimensions`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
CREATE TABLE `easy_thumbnails_thumbnaildimensions` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_freelancerprofile`
--

DROP TABLE IF EXISTS `freelancer_freelancerprofile`;
CREATE TABLE `freelancer_freelancerprofile` (
  `username_id` int(11) NOT NULL,
  `membership` varchar(80) NOT NULL,
  `payment` varchar(80) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `point` varchar(80) NOT NULL,
  `rate` varchar(80) NOT NULL,
  `employment` varchar(80) NOT NULL,
  `portfolio` varchar(80) NOT NULL,
  `certificate` varchar(80) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_freelancerprofile_skill`
--

DROP TABLE IF EXISTS `freelancer_freelancerprofile_skill`;
CREATE TABLE `freelancer_freelancerprofile_skill` (
  `id` int(11) NOT NULL,
  `freelancerprofile_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_skill`
--

DROP TABLE IF EXISTS `freelancer_skill`;
CREATE TABLE `freelancer_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `path` longtext NOT NULL,
  `label` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pondation_carousel`
--

DROP TABLE IF EXISTS `pondation_carousel`;
CREATE TABLE `pondation_carousel` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `carouseltype` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image_order` int(10) UNSIGNED NOT NULL,
  `published` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `carousel_order` int(10) UNSIGNED NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pondation_menu`
--

DROP TABLE IF EXISTS `pondation_menu`;
CREATE TABLE `pondation_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles_profile`
--

DROP TABLE IF EXISTS `profiles_profile`;
CREATE TABLE `profiles_profile` (
  `id` int(11) NOT NULL,
  `membertype` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(254) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `completion_level` smallint(5) UNSIGNED NOT NULL,
  `email_is_verified` tinyint(1) NOT NULL,
  `personal_info_is_completed` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE `project_category` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_project`
--

DROP TABLE IF EXISTS `project_project`;
CREATE TABLE `project_project` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `project_type` varchar(60) NOT NULL,
  `rate` varchar(60) NOT NULL,
  `budget` varchar(60) NOT NULL,
  `workload` varchar(60) NOT NULL,
  `duration` varchar(60) NOT NULL,
  `create_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `project_owner_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `avatar_avatar`
--
ALTER TABLE `avatar_avatar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avatar_avatar_user_id_ae13b50b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `client_clientprofile`
--
ALTER TABLE `client_clientprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_id` (`username_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `easy_thumbnails_source`
--
ALTER TABLE `easy_thumbnails_source`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `easy_thumbnails_source_storage_hash_name_481ce32d_uniq` (`storage_hash`,`name`),
  ADD KEY `easy_thumbnails_source_storage_hash_946cbcc9` (`storage_hash`),
  ADD KEY `easy_thumbnails_source_name_5fe0edc6` (`name`);

--
-- Indexes for table `easy_thumbnails_thumbnail`
--
ALTER TABLE `easy_thumbnails_thumbnail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq` (`storage_hash`,`name`,`source_id`),
  ADD KEY `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` (`source_id`),
  ADD KEY `easy_thumbnails_thumbnail_storage_hash_f1435f49` (`storage_hash`),
  ADD KEY `easy_thumbnails_thumbnail_name_b5882c31` (`name`);

--
-- Indexes for table `easy_thumbnails_thumbnaildimensions`
--
ALTER TABLE `easy_thumbnails_thumbnaildimensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thumbnail_id` (`thumbnail_id`);

--
-- Indexes for table `freelancer_freelancerprofile`
--
ALTER TABLE `freelancer_freelancerprofile`
  ADD PRIMARY KEY (`username_id`),
  ADD KEY `freelancer_freelance_category_id_73c625ad_fk_project_c` (`category_id`);

--
-- Indexes for table `freelancer_freelancerprofile_skill`
--
ALTER TABLE `freelancer_freelancerprofile_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freelancer_freelancerpro_freelancerprofile_id_ski_84e6fb8c_uniq` (`freelancerprofile_id`,`skill_id`),
  ADD KEY `freelancer_freelance_skill_id_095670dc_fk_freelance` (`skill_id`);

--
-- Indexes for table `freelancer_skill`
--
ALTER TABLE `freelancer_skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `freelancer_skill_parent_id_7e43f21c_fk_freelancer_skill_id` (`parent_id`),
  ADD KEY `freelancer_skill_slug_febf4b2a` (`slug`);

--
-- Indexes for table `pondation_carousel`
--
ALTER TABLE `pondation_carousel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pondation_carousel_owner_id_c24dc626_fk_profiles_profile_id` (`owner_id`),
  ADD KEY `pondation_carousel_image_order_1e0e3792` (`image_order`),
  ADD KEY `pondation_carousel_carousel_order_96d55049` (`carousel_order`);

--
-- Indexes for table `pondation_menu`
--
ALTER TABLE `pondation_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pondation_menu_slug_26a7758b` (`slug`);

--
-- Indexes for table `profiles_profile`
--
ALTER TABLE `profiles_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membertype` (`membertype`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `project_category_slug_parent_id_bcca25e2_uniq` (`slug`,`parent_id`),
  ADD KEY `project_category_tree_id_4927735d` (`tree_id`),
  ADD KEY `project_category_parent_id_7d86555b` (`parent_id`);

--
-- Indexes for table `project_project`
--
ALTER TABLE `project_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `project_project_category_id_593c1763_fk_project_category_id` (`category_id`),
  ADD KEY `project_project_project_owner_id_3744c148_fk_client_cl` (`project_owner_id`),
  ADD KEY `project_project_skill_id_be883c55_fk_freelancer_skill_id` (`skill_id`),
  ADD KEY `project_project_expire_date_6a3c553b` (`expire_date`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `avatar_avatar`
--
ALTER TABLE `avatar_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_clientprofile`
--
ALTER TABLE `client_clientprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `easy_thumbnails_source`
--
ALTER TABLE `easy_thumbnails_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `easy_thumbnails_thumbnail`
--
ALTER TABLE `easy_thumbnails_thumbnail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `easy_thumbnails_thumbnaildimensions`
--
ALTER TABLE `easy_thumbnails_thumbnaildimensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `freelancer_freelancerprofile_skill`
--
ALTER TABLE `freelancer_freelancerprofile_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `freelancer_skill`
--
ALTER TABLE `freelancer_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pondation_carousel`
--
ALTER TABLE `pondation_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pondation_menu`
--
ALTER TABLE `pondation_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profiles_profile`
--
ALTER TABLE `profiles_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_project`
--
ALTER TABLE `project_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `avatar_avatar`
--
ALTER TABLE `avatar_avatar`
  ADD CONSTRAINT `avatar_avatar_user_id_ae13b50b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_clientprofile`
--
ALTER TABLE `client_clientprofile`
  ADD CONSTRAINT `client_clientprofile_username_id_fa292fff_fk_profiles_profile_id` FOREIGN KEY (`username_id`) REFERENCES `profiles_profile` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `easy_thumbnails_thumbnail`
--
ALTER TABLE `easy_thumbnails_thumbnail`
  ADD CONSTRAINT `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`);

--
-- Constraints for table `easy_thumbnails_thumbnaildimensions`
--
ALTER TABLE `easy_thumbnails_thumbnaildimensions`
  ADD CONSTRAINT `easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`);

--
-- Constraints for table `freelancer_freelancerprofile`
--
ALTER TABLE `freelancer_freelancerprofile`
  ADD CONSTRAINT `freelancer_freelance_category_id_73c625ad_fk_project_c` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`),
  ADD CONSTRAINT `freelancer_freelance_username_id_d04ec9fa_fk_profiles_` FOREIGN KEY (`username_id`) REFERENCES `profiles_profile` (`id`);

--
-- Constraints for table `freelancer_freelancerprofile_skill`
--
ALTER TABLE `freelancer_freelancerprofile_skill`
  ADD CONSTRAINT `freelancer_freelance_freelancerprofile_id_5ecdf12a_fk_freelance` FOREIGN KEY (`freelancerprofile_id`) REFERENCES `freelancer_freelancerprofile` (`username_id`),
  ADD CONSTRAINT `freelancer_freelance_skill_id_095670dc_fk_freelance` FOREIGN KEY (`skill_id`) REFERENCES `freelancer_skill` (`id`);

--
-- Constraints for table `freelancer_skill`
--
ALTER TABLE `freelancer_skill`
  ADD CONSTRAINT `freelancer_skill_parent_id_7e43f21c_fk_freelancer_skill_id` FOREIGN KEY (`parent_id`) REFERENCES `freelancer_skill` (`id`);

--
-- Constraints for table `pondation_carousel`
--
ALTER TABLE `pondation_carousel`
  ADD CONSTRAINT `pondation_carousel_owner_id_c24dc626_fk_profiles_profile_id` FOREIGN KEY (`owner_id`) REFERENCES `profiles_profile` (`id`);

--
-- Constraints for table `profiles_profile`
--
ALTER TABLE `profiles_profile`
  ADD CONSTRAINT `profiles_profile_user_id_a3e81f91_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `project_category`
--
ALTER TABLE `project_category`
  ADD CONSTRAINT `project_category_parent_id_7d86555b_fk_project_category_id` FOREIGN KEY (`parent_id`) REFERENCES `project_category` (`id`);

--
-- Constraints for table `project_project`
--
ALTER TABLE `project_project`
  ADD CONSTRAINT `project_project_category_id_593c1763_fk_project_category_id` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`),
  ADD CONSTRAINT `project_project_project_owner_id_3744c148_fk_client_cl` FOREIGN KEY (`project_owner_id`) REFERENCES `client_clientprofile` (`id`),
  ADD CONSTRAINT `project_project_skill_id_be883c55_fk_freelancer_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `freelancer_skill` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
