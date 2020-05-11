-- MySQL dump 10.13  Distrib 5.5.40, for Win32 (x86)
--
-- Host: localhost    Database: xiaoqu
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `es_activity`
--

DROP TABLE IF EXISTS `es_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `content` text COMMENT '活动内容',
  `place` varchar(255) NOT NULL COMMENT '活动地点',
  `begin_time` int(10) unsigned DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned DEFAULT NULL COMMENT '活动截止时间',
  `sponsor_unit` varchar(255) NOT NULL COMMENT '举办单位',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 0 无效 1 有效',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区活动信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_activity`
--

LOCK TABLES `es_activity` WRITE;
/*!40000 ALTER TABLE `es_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_admin`
--

DROP TABLE IF EXISTS `es_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_admin`
--

LOCK TABLES `es_admin` WRITE;
/*!40000 ALTER TABLE `es_admin` DISABLE KEYS */;
INSERT INTO `es_admin` VALUES (1,'admin','超级管理员','1a802bc0186a1e1ecddf7926d8faf697','sariGA','/assets/img/avatar.png','admin@admin.com',0,1552359998,1492186163,1552359998,'e1d678aa-957d-4255-89a3-bb272390eb62','normal');
/*!40000 ALTER TABLE `es_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_admin_log`
--

DROP TABLE IF EXISTS `es_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_admin_log`
--

LOCK TABLES `es_admin_log` WRITE;
/*!40000 ALTER TABLE `es_admin_log` DISABLE KEYS */;
INSERT INTO `es_admin_log` VALUES (1,1,'admin','/public/admin.php/index/login?url=/public/admin.php','登录','{\"url\":\"\\/public\\/admin.php\",\"__token__\":\"b12d9f66945112d180b26bd6d89210b9\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359791),(2,1,'admin','/public/admin.php/dashboard/get_general_data','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359795),(3,1,'admin','/public/admin.php/dashboard/get_expenses','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359796),(4,1,'admin','/public/admin.php/dashboard/get_activity','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359796),(5,1,'admin','/public/admin.php/dashboard/get_repair','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359796),(6,1,'admin','/public/admin.php/dashboard/get_general_data','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359869),(7,1,'admin','/public/admin.php/dashboard/get_expenses','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359869),(8,1,'admin','/public/admin.php/dashboard/get_repair','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359870),(9,1,'admin','/public/admin.php/dashboard/get_activity','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359870),(10,1,'admin','/public/admin.php/general.config/edit','常规管理 系统配置 编辑','{\"row\":{\"name\":\"\\u838e\\u838e\\u7269\\u4e1a\\u7ba1\\u7406\\u7cfb\\u7edf\",\"beian\":\"https:\\/\\/bbs.sasadown.cn\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":{\"field\":{\"backend\":\"backend\",\"frontend\":\"frontend\"},\"value\":{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}},\"fixedpage\":\"dashboard\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359906),(11,1,'admin','/public/admin.php/general.profile/update','常规管理 个人配置 更新个人信息','{\"row\":{\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"email\":\"admin@admin.com\",\"nickname\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"bbs.sasadown.cn\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359971),(12,0,'Unknown','/public/admin.php/index/login?url=/public/admin.php/general/profile?ref=addtabs','登录','{\"url\":\"\\/public\\/admin.php\\/general\\/profile?ref=addtabs\",\"__token__\":\"1354b04c61320f3bfb92e2b32335116a\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359992),(13,1,'admin','/public/admin.php/index/login?url=/public/admin.php/general/profile?ref=addtabs','登录','{\"url\":\"\\/public\\/admin.php\\/general\\/profile?ref=addtabs\",\"__token__\":\"849c12447e40f01298d46bbaa15f2709\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552359998),(14,1,'admin','/public/admin.php/dashboard/get_general_data','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360002),(15,1,'admin','/public/admin.php/dashboard/get_expenses','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360002),(16,1,'admin','/public/admin.php/dashboard/get_activity','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360003),(17,1,'admin','/public/admin.php/dashboard/get_repair','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360003),(18,1,'admin','/public/admin.php/parking/usage/get_parking_by_cm_code','','{\"community_code\":\"\",\"status\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360027),(19,1,'admin','/public/admin.php/parking/usage/get_parking_by_cm_code','','{\"community_code\":\"\",\"parking_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360030),(20,1,'admin','/public/admin.php/house/index/get_building_by_cm_code','','{\"community_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360594),(21,1,'admin','/public/admin.php/house/index/get_building_by_cm_code','','{\"community_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360602),(22,1,'admin','/public/admin.php/expenses/index/get_project_by_cm_code','','{\"community_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360632),(23,1,'admin','/public/admin.php/expenses/index/get_project_by_cm_code','','{\"community_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360633),(24,1,'admin','/public/admin.php/expenses/index/get_project_by_cm_code','','{\"community_code\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552360642),(25,1,'admin','/public/admin.php/dashboard/get_general_data','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378515),(26,1,'admin','/public/admin.php/dashboard/get_activity','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378516),(27,1,'admin','/public/admin.php/dashboard/get_expenses','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378516),(28,1,'admin','/public/admin.php/dashboard/get_repair','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378516),(29,1,'admin','/public/admin.php/dashboard/get_expenses','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378526),(30,1,'admin','/public/admin.php/dashboard/get_general_data','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378527),(31,1,'admin','/public/admin.php/dashboard/get_activity','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378527),(32,1,'admin','/public/admin.php/dashboard/get_repair','','[]','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36',1552378527);
/*!40000 ALTER TABLE `es_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_attachment`
--

DROP TABLE IF EXISTS `es_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(30) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_attachment`
--

LOCK TABLES `es_attachment` WRITE;
/*!40000 ALTER TABLE `es_attachment` DISABLE KEYS */;
INSERT INTO `es_attachment` VALUES (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `es_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_auth_group`
--

DROP TABLE IF EXISTS `es_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_auth_group`
--

LOCK TABLES `es_auth_group` WRITE;
/*!40000 ALTER TABLE `es_auth_group` DISABLE KEYS */;
INSERT INTO `es_auth_group` VALUES (1,0,'超级管理员','*',1490883540,149088354,'normal'),(2,1,'小区管理员','1,9,10,13,14,15,16,17,40,41,42,43,44,45,46,582,583,585,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,5,581',1490883540,1510797711,'normal'),(3,2,'小区普通员工','',1509948028,1509948028,'normal'),(4,2,'业主','658,659,660,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682',1510275700,1510797745,'normal');
/*!40000 ALTER TABLE `es_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_auth_group_access`
--

DROP TABLE IF EXISTS `es_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_auth_group_access`
--

LOCK TABLES `es_auth_group_access` WRITE;
/*!40000 ALTER TABLE `es_auth_group_access` DISABLE KEYS */;
INSERT INTO `es_auth_group_access` VALUES (1,1);
/*!40000 ALTER TABLE `es_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_auth_rule`
--

DROP TABLE IF EXISTS `es_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_auth_rule`
--

LOCK TABLES `es_auth_rule` WRITE;
/*!40000 ALTER TABLE `es_auth_rule` DISABLE KEYS */;
INSERT INTO `es_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard\r','','Dashboard tips',1,1497429920,1497429920,201,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-list\r','','Category tips',1,1497429920,1497429920,119,'hidden'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'hidden'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user\r','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Operator','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Operator log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','',0,1497429920,1497429920,142,'hidden'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'hidden'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'hidden'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'hidden'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'hidden'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(104,'file',2,'general/crontab','定时任务','fa fa-tasks','','类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前仅支持三种任务:请求URL、执行SQL、执行Shell',1,1505542785,1505542785,0,'normal'),(105,'file',104,'general/crontab/index','查看','fa fa-circle-o','','',0,1505542785,1505542785,0,'normal'),(106,'file',104,'general/crontab/add','添加','fa fa-circle-o','','',0,1505542785,1505542785,0,'normal'),(107,'file',104,'general/crontab/edit','编辑 ','fa fa-circle-o','','',0,1505542785,1505542785,0,'normal'),(108,'file',104,'general/crontab/del','删除','fa fa-circle-o','','',0,1505542785,1505542785,0,'normal'),(109,'file',104,'general/crontab/multi','批量更新','fa fa-circle-o','','',0,1505542785,1505542785,0,'normal'),(581,'file',0,'community/index','小区管理','fa fa-list-alt','','用于展示小区列表信息，以及增加、修改、删除等操作',1,1509669650,1509669650,200,'normal'),(582,'file',581,'community/index/index','查看','fa fa-circle-o','','',0,1509669650,1509669650,0,'normal'),(583,'file',581,'community/index/detail','详情','fa fa-circle-o','','',0,1509669650,1509669650,0,'normal'),(584,'file',581,'community/index/add','添加','fa fa-circle-o','','',0,1509669650,1509669650,0,'normal'),(585,'file',581,'community/index/edit','修改','fa fa-circle-o','','',0,1509669650,1509669650,0,'normal'),(586,'file',581,'community/index/del','删除','fa fa-circle-o','','',0,1509669650,1509669650,0,'normal'),(587,'file',0,'expenses','收费管理','fa fa-usd','','',1,1509669659,1509669659,194,'normal'),(588,'file',587,'expenses/index','收费明细管理','fa fa-list-alt','','用于展示物业收费明细列表信息，以及增加、修改、删除等操作',1,1509669659,1509669659,2,'normal'),(589,'file',588,'expenses/index/index','查看','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(590,'file',588,'expenses/index/add','添加','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(591,'file',588,'expenses/index/edit','修改','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(592,'file',588,'expenses/index/del','删除','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(593,'file',587,'expenses/project','收费项目管理','fa fa-list-alt','','用于展示收费项目列表信息，以及增加、修改、删除等操作',1,1509669659,1509669659,1,'normal'),(594,'file',593,'expenses/project/index','查看','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(595,'file',593,'expenses/project/add','添加','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(596,'file',593,'expenses/project/edit','修改','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(597,'file',593,'expenses/project/del','删除','fa fa-circle-o','','',0,1509669659,1509669659,0,'normal'),(598,'file',0,'house','房产管理','fa fa-home','','',1,1509669664,1509669664,199,'normal'),(599,'file',598,'house/index','房产管理','fa fa-list-alt','','用于展示房产列表信息，以户为单位',1,1509669664,1509669664,2,'normal'),(600,'file',599,'house/index/index','查看','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(601,'file',599,'house/index/add','添加','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(602,'file',599,'house/index/edit','修改','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(603,'file',599,'house/index/del','删除','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(604,'file',598,'house/building','栋数管理','fa fa-list-alt','','用于展示小区里每一栋的基础信息',1,1509669664,1509669664,1,'normal'),(605,'file',604,'house/building/index','查看','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(606,'file',604,'house/building/add','添加','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(607,'file',604,'house/building/edit','修改','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(608,'file',604,'house/building/del','删除','fa fa-circle-o','','',0,1509669664,1509669664,0,'normal'),(609,'file',0,'owners','业主信息管理','fa fa-user','','',1,1509688838,1509688838,198,'normal'),(610,'file',609,'owners/index','人员管理','fa fa-list-alt','','用于管理小区里每个住户的基本信息，包括业主、家庭成员及租户等信息',1,1509688838,1509688838,3,'normal'),(611,'file',610,'owners/index/index','查看','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(612,'file',610,'owners/index/add','添加','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(613,'file',610,'owners/index/edit','修改','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(614,'file',610,'owners/index/del','删除','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(615,'file',609,'owners/vehicle','车辆管理','fa fa-list-alt','','用于管理小区里的车辆信息，包括业主、家庭成员及租户的车辆',1,1509688838,1509688838,2,'normal'),(616,'file',615,'owners/vehicle/index','查看','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(617,'file',615,'owners/vehicle/add','添加','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(618,'file',615,'owners/vehicle/edit','修改','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(619,'file',615,'owners/vehicle/del','删除','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(620,'file',609,'owners/pet','宠物管理','fa fa-list-alt','','用于管理小区里的宠物信息，包括业主、家庭成员及租户饲养的宠物',1,1509688838,1509688838,1,'normal'),(621,'file',620,'owners/pet/index','查看','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(622,'file',620,'owners/pet/add','添加','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(623,'file',620,'owners/pet/edit','修改','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(624,'file',620,'owners/pet/del','删除','fa fa-circle-o','','',0,1509688838,1509688838,0,'normal'),(625,'file',0,'parking','停车位管理','fa fa-film','','',1,1509934859,1509934859,197,'normal'),(626,'file',625,'parking/index','车位管理','fa fa-list-alt','','用于管理小区里每一个停车位的基本信息',1,1509934859,1509934859,2,'normal'),(627,'file',626,'parking/index/index','查看','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(628,'file',626,'parking/index/add','添加','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(629,'file',626,'parking/index/edit','修改','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(630,'file',626,'parking/index/del','删除','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(631,'file',625,'parking/usage','车位使用管理','fa fa-list-alt','','用于管理小区里每一个停车位的使用情况',1,1509934859,1509934859,1,'normal'),(632,'file',631,'parking/usage/index','查看','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(633,'file',631,'parking/usage/add','添加','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(634,'file',631,'parking/usage/edit','修改','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(635,'file',631,'parking/usage/del','删除','fa fa-circle-o','','',0,1509934859,1509934859,0,'normal'),(658,'file',0,'service','服务管理','fa fa-coffee','','',1,1509958393,1509958393,196,'normal'),(659,'file',658,'service/activity','活动管理','fa fa-list-alt','','用于管理小区里不定期举办的各种活动',1,1509958393,1509958393,4,'normal'),(660,'file',659,'service/activity/index','查看','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(661,'file',659,'service/activity/add','添加','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(662,'file',659,'service/activity/edit','修改','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(663,'file',659,'service/activity/del','删除','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(664,'file',659,'service/activity/detail','查看详情','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(665,'file',658,'service/repair','报修管理','fa fa-list-alt','','用于管理小区里业主的报修信息',1,1509958393,1509958393,3,'normal'),(666,'file',665,'service/repair/index','查看','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(667,'file',665,'service/repair/add','添加','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(668,'file',665,'service/repair/edit','修改','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(669,'file',665,'service/repair/del','删除','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(670,'file',665,'service/repair/detail','查看详情','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(671,'file',658,'service/complain','投诉管理','fa fa-list-alt','','用于管理小区里业主的投诉信息',1,1509958393,1509958393,2,'normal'),(672,'file',671,'service/complain/index','查看','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(673,'file',671,'service/complain/add','添加','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(674,'file',671,'service/complain/edit','修改','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(675,'file',671,'service/complain/del','删除','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(676,'file',671,'service/complain/detail','查看详情','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(677,'file',658,'service/mailbox','信箱管理','fa fa-list-alt','','用于管理小区里业主的信箱信息，包括工作建议，意见反馈等。',1,1509958393,1509958393,1,'normal'),(678,'file',677,'service/mailbox/index','查看','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(679,'file',677,'service/mailbox/add','添加','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(680,'file',677,'service/mailbox/edit','修改','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(681,'file',677,'service/mailbox/del','删除','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(682,'file',677,'service/mailbox/detail','查看详情','fa fa-circle-o','','',0,1509958393,1509958393,0,'normal'),(683,'file',0,'device/index','资产设备管理','fa fa-legal','','用于管理小区里的公共设备，比如电梯，路灯，垃圾桶，配电箱等',1,1510019471,1510019471,195,'normal'),(684,'file',683,'device/index/index','查看','fa fa-circle-o','','',0,1510019471,1510019471,0,'normal'),(685,'file',683,'device/index/add','添加','fa fa-circle-o','','',0,1510019471,1510019471,0,'normal'),(686,'file',683,'device/index/edit','修改','fa fa-circle-o','','',0,1510019471,1510019471,0,'normal'),(687,'file',683,'device/index/del','删除','fa fa-circle-o','','',0,1510019471,1510019471,0,'normal'),(688,'file',683,'device/index/detail','查看详情','fa fa-circle-o','','',0,1510019471,1510019471,0,'normal'),(689,'file',0,'duty/index','值班管理','fa fa-calendar','','用于管理小区物业的员工值班情况',1,1510212847,1510212847,193,'normal'),(690,'file',689,'duty/index/index','查看','fa fa-circle-o','','',0,1510212847,1510212847,0,'normal'),(691,'file',689,'duty/index/add','添加','fa fa-circle-o','','',0,1510212847,1510212847,0,'normal'),(692,'file',689,'duty/index/edit','修改','fa fa-circle-o','','',0,1510212847,1510212847,0,'normal');
/*!40000 ALTER TABLE `es_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_building`
--

DROP TABLE IF EXISTS `es_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_building` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '栋数编号，建议BD开头',
  `name` varchar(255) NOT NULL COMMENT '栋数名称',
  `house` int(10) NOT NULL COMMENT '总户数',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `lift` int(10) DEFAULT NULL COMMENT '电梯数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栋数信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_building`
--

LOCK TABLES `es_building` WRITE;
/*!40000 ALTER TABLE `es_building` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category`
--

DROP TABLE IF EXISTS `es_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category`
--

LOCK TABLES `es_category` WRITE;
/*!40000 ALTER TABLE `es_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_community`
--

DROP TABLE IF EXISTS `es_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_community` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) NOT NULL COMMENT '小区编号，建议CM开头',
  `name` varchar(255) NOT NULL COMMENT '小区名称',
  `introduction` text COMMENT '简介',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `address` varchar(255) NOT NULL COMMENT '坐落地址',
  `area` decimal(15,2) NOT NULL COMMENT '占地面积，单位：平米',
  `developer` varchar(255) NOT NULL COMMENT '开发商名称',
  `estate` varchar(255) NOT NULL COMMENT '物业公司名称',
  `greening_rate` decimal(10,2) NOT NULL COMMENT '绿化率，单位：百分比',
  `total_building` int(11) NOT NULL COMMENT '总栋数',
  `total_owner` int(11) NOT NULL COMMENT '总户数',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_community`
--

LOCK TABLES `es_community` WRITE;
/*!40000 ALTER TABLE `es_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_community_admin`
--

DROP TABLE IF EXISTS `es_community_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_community_admin` (
  `community_code` varchar(50) NOT NULL COMMENT '小区编号，建议CM开头',
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员id',
  UNIQUE KEY `cm_admin_id` (`community_code`,`admin_id`),
  KEY `community_code` (`community_code`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区管理员关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_community_admin`
--

LOCK TABLES `es_community_admin` WRITE;
/*!40000 ALTER TABLE `es_community_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_community_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_complain`
--

DROP TABLE IF EXISTS `es_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_complain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `member_id` int(11) NOT NULL COMMENT '投诉成员id',
  `title` varchar(255) NOT NULL COMMENT '投诉名称',
  `reason` text COMMENT '投诉事由',
  `is_anonymity` tinyint(1) unsigned DEFAULT '1' COMMENT '是否匿名 0 不匿名 1 匿名',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主投诉信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_complain`
--

LOCK TABLES `es_complain` WRITE;
/*!40000 ALTER TABLE `es_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_config`
--

DROP TABLE IF EXISTS `es_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_config`
--

LOCK TABLES `es_config` WRITE;
/*!40000 ALTER TABLE `es_config` DISABLE KEYS */;
INSERT INTO `es_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','莎莎物业管理系统','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','https://bbs.sasadown.cn','','',''),(3,'cdnurl','basic','Cdn url','如果使用CDN云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Cateogry type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');
/*!40000 ALTER TABLE `es_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_crontab`
--

DROP TABLE IF EXISTS `es_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_crontab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_crontab`
--

LOCK TABLES `es_crontab` WRITE;
/*!40000 ALTER TABLE `es_crontab` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_crontab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_device`
--

DROP TABLE IF EXISTS `es_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '设备编号，建议DV开头',
  `name` varchar(255) NOT NULL COMMENT '设备名称',
  `brand` varchar(100) NOT NULL COMMENT '品牌',
  `price` decimal(10,2) NOT NULL COMMENT '购买价格（单价）',
  `quantity` int(10) unsigned DEFAULT NULL COMMENT '购买数量',
  `buy_time` int(10) unsigned DEFAULT NULL COMMENT '购买时间',
  `durable_years` int(10) unsigned DEFAULT NULL COMMENT '预计使用年限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产设备信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_device`
--

LOCK TABLES `es_device` WRITE;
/*!40000 ALTER TABLE `es_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_device_maintain`
--

DROP TABLE IF EXISTS `es_device_maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_device_maintain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `device_code` varchar(50) NOT NULL COMMENT '设备编号，建议DV开头',
  `unit` varchar(100) NOT NULL COMMENT '维修单位名称',
  `contacts` varchar(50) NOT NULL COMMENT '维修人名称',
  `contacts_tel` varchar(50) NOT NULL COMMENT '维修人联系方式',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_maintain_time` int(10) unsigned DEFAULT NULL COMMENT '最后一次维护时间',
  `next_maintain_time` int(10) unsigned DEFAULT NULL COMMENT '下次维护时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产设备维修记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_device_maintain`
--

LOCK TABLES `es_device_maintain` WRITE;
/*!40000 ALTER TABLE `es_device_maintain` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_device_maintain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_duty`
--

DROP TABLE IF EXISTS `es_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_duty` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `name` varchar(255) NOT NULL COMMENT '值班人名称，多个值班人用英文逗号隔开',
  `start_time` int(10) unsigned DEFAULT NULL COMMENT '值班开始时间',
  `end_time` int(10) unsigned DEFAULT NULL COMMENT '值班结束时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物业员工值班信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_duty`
--

LOCK TABLES `es_duty` WRITE;
/*!40000 ALTER TABLE `es_duty` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_expenses`
--

DROP TABLE IF EXISTS `es_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_expenses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `house_code` varchar(50) NOT NULL COMMENT '缴费人，即房产编号，建议HS开头',
  `project_code` varchar(50) NOT NULL COMMENT '缴费项目编号，建议EP开头',
  `amount_total` decimal(10,2) NOT NULL COMMENT '应收金额',
  `amount_paid` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '缴费时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费用信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_expenses`
--

LOCK TABLES `es_expenses` WRITE;
/*!40000 ALTER TABLE `es_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_expenses_project`
--

DROP TABLE IF EXISTS `es_expenses_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_expenses_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '项目编号，建议EP开头',
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收费项目信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_expenses_project`
--

LOCK TABLES `es_expenses_project` WRITE;
/*!40000 ALTER TABLE `es_expenses_project` DISABLE KEYS */;
INSERT INTO `es_expenses_project` VALUES (1,'CM2017110100001','EP2017110100001','清洁卫生费用',1509522333,1510810378),(2,'CM2017110100002','EP2017110100002','绿化养护费用',1509522353,1510810389),(3,'CM2017110100001','EP2017110100003','机动车停车费用',1510810452,1510810452),(4,'CM2017110100001','EP2017110100004','房屋共用部位维修费用',1510810483,1510810542),(5,'CM2017110100001','EP2017110100005','小区共用设施维修费用',1510810518,1510810549),(6,'CM2017110100001','EP2017110100006','绿化养护费用',1510810576,1510810576),(7,'CM2017110100002','EP2017110100007','清洁卫生费用',1510810598,1510810598),(8,'CM2017110100002','EP2017110100008','机动车停车费用',1510810618,1510810618),(9,'CM2017110100002','EP2017110100009','房屋共用部位维修费用',1510810630,1510810630),(10,'CM2017110100002','EP2017110100010','小区共用设施维修费用',1510810638,1510810638);
/*!40000 ALTER TABLE `es_expenses_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_house`
--

DROP TABLE IF EXISTS `es_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_house` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `building_code` varchar(50) NOT NULL COMMENT '栋数编号，建议BD开头',
  `code` varchar(50) NOT NULL COMMENT '房产编号，建议HS开头',
  `name` varchar(255) NOT NULL COMMENT '房产名称',
  `owner_name` varchar(100) NOT NULL COMMENT '户主姓名',
  `owner_tel` varchar(50) NOT NULL COMMENT '户主联系方式',
  `rooms` int(10) NOT NULL COMMENT '房间数',
  `unit` varchar(50) NOT NULL COMMENT '单元信息',
  `floor` int(10) NOT NULL COMMENT '楼层信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '房产描述',
  `enter_time` int(10) unsigned DEFAULT NULL COMMENT '入住时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_house`
--

LOCK TABLES `es_house` WRITE;
/*!40000 ALTER TABLE `es_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_mailbox`
--

DROP TABLE IF EXISTS `es_mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_mailbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `title` varchar(255) NOT NULL COMMENT '信件标题',
  `content` text COMMENT '信件内容',
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 0 未读 1 已读',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主信箱信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_mailbox`
--

LOCK TABLES `es_mailbox` WRITE;
/*!40000 ALTER TABLE `es_mailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_member`
--

DROP TABLE IF EXISTS `es_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `house_code` varchar(50) NOT NULL COMMENT '房产编号，建议HS开头',
  `name` varchar(255) NOT NULL COMMENT '成员姓名',
  `identity_id` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(50) NOT NULL COMMENT '联系方式',
  `occupation` varchar(255) DEFAULT NULL COMMENT '职业',
  `birth` varchar(20) NOT NULL COMMENT '出生日期',
  `gender` tinyint(1) NOT NULL COMMENT '性别 0 女 1 男',
  `owner_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '成员类型 1 户主 2 家庭成员，3 租户',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `photo` text COMMENT '成员照片，拍照上传即可',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区成员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_member`
--

LOCK TABLES `es_member` WRITE;
/*!40000 ALTER TABLE `es_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_parking_space`
--

DROP TABLE IF EXISTS `es_parking_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_parking_space` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '车位编号，建议PK开头',
  `name` varchar(255) NOT NULL COMMENT '车位名称',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 0 闲置中 1 使用中',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车位基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_parking_space`
--

LOCK TABLES `es_parking_space` WRITE;
/*!40000 ALTER TABLE `es_parking_space` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_parking_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_parking_space_use`
--

DROP TABLE IF EXISTS `es_parking_space_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_parking_space_use` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `pk_code` varchar(50) NOT NULL COMMENT '车位编号，建议PK开头',
  `license_plate` varchar(50) NOT NULL COMMENT '车辆牌照',
  `owner` varchar(100) NOT NULL COMMENT '车辆所有人',
  `tel` varchar(50) NOT NULL COMMENT '联系电话',
  `begin_time` int(10) unsigned DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned DEFAULT NULL COMMENT '截止时间',
  `type` tinyint(1) unsigned NOT NULL COMMENT '使用性质 1 租 2 买',
  `cost` decimal(10,2) NOT NULL COMMENT '费用',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车位使用记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_parking_space_use`
--

LOCK TABLES `es_parking_space_use` WRITE;
/*!40000 ALTER TABLE `es_parking_space_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_parking_space_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_pet`
--

DROP TABLE IF EXISTS `es_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_pet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) NOT NULL COMMENT '家庭成员id',
  `name` varchar(255) NOT NULL COMMENT '宠物名称',
  `color` varchar(50) DEFAULT NULL COMMENT '宠物颜色',
  `photo` text COMMENT '宠物照片，拍照上传即可',
  `adopt_time` int(10) unsigned DEFAULT NULL COMMENT '收养时间',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宠物信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_pet`
--

LOCK TABLES `es_pet` WRITE;
/*!40000 ALTER TABLE `es_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_repair`
--

DROP TABLE IF EXISTS `es_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_repair` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `member_id` int(11) NOT NULL COMMENT '报修成员id',
  `device_name` varchar(255) NOT NULL COMMENT '报修设备名称',
  `desc` text COMMENT '报修描述',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 0 待受理 1 已受理 2 已维修',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主报修信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_repair`
--

LOCK TABLES `es_repair` WRITE;
/*!40000 ALTER TABLE `es_repair` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_test`
--

DROP TABLE IF EXISTS `es_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_test`
--

LOCK TABLES `es_test` WRITE;
/*!40000 ALTER TABLE `es_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_vehicle`
--

DROP TABLE IF EXISTS `es_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) NOT NULL COMMENT '家庭成员id',
  `name` varchar(255) NOT NULL COMMENT '车辆名称',
  `license_plate` varchar(50) NOT NULL COMMENT '车辆牌照',
  `color` varchar(50) DEFAULT NULL COMMENT '车辆颜色',
  `photo` text COMMENT '车辆照片，拍照上传即可',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_vehicle`
--

LOCK TABLES `es_vehicle` WRITE;
/*!40000 ALTER TABLE `es_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-12 17:03:37
