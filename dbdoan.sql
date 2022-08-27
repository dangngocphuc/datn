-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbdoan
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_fullname` varchar(45) DEFAULT NULL,
  `user_roles` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','Đặng Văn Hải','1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Process',
  PRIMARY KEY (`bill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1638588930928 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1638588930927,1603337116134,1245241123,'Live','3112313','2022-05-09 08:13:19','hai','399487332','Process'),(1638588930926,2,30000000,'Bank transfer','2213123','2022-05-07 15:01:16','quangdeptrai','3872136214','Delivered'),(1638588930925,1603337116134,47800000,'Live','HaNoi','2022-05-07 07:49:18','hai','399487332','Process'),(1638588930924,1603337116134,36990000,'Live','12314','2022-05-07 07:41:01','hai','399487332','Process'),(1638588930923,1603337116134,13000000,'Live','12312','2022-05-07 07:25:16','hai','399487332','Cancel'),(1638588930922,1603337116134,46000000,'Live','Ha Noi',NULL,'hai','399487332','Cancel'),(1638588930921,1603337116134,59600000,'Live','Ha noi',NULL,'hai','399487332','Cancel'),(1638588930920,1603337116134,18990000,'Bank transfer','Thanh xuân','2022-05-03 11:11:12','hai','399487332','Process'),(1638588930919,1603337116134,25990000,'Live','Thanh xuân','2022-05-03 04:19:43','hai','399487332','Delivery');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `bill_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`bill_detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (54,1638588930927,53,1231241123,1),(53,1638588930927,5,7000000,2),(52,1638588930926,5,7000000,1),(51,1638588930926,2,23000000,1),(50,1638588930925,1,29800000,1),(49,1638588930925,4,18000000,1),(48,1638588930920,49,18990000,1),(47,1638588930919,5,7000000,1),(46,1638588930919,49,18990000,1);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple'),(2,'Samsung'),(3,'Oppo'),(4,'Xiaomi'),(5,'Huawei'),(6,'Nokia');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'IPHONE'),(2,'SAMSUNG'),(3,'OPPO'),(4,'XIAOMI'),(5,'REDMI'),(6,'HUEWAY'),(7,'NOKIA');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `value` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'email_root','doantotnghiep08082000@gmail.com'),(2,'subject','[SHOP DH]THONG BAO DON HANG #__idBill__'),(3,'mail.smtp.port','587'),(4,'mail.smtp.auth','true'),(5,'mail.smtp.starttls.enable','true'),(6,'content','<p>Xin chao <strong>__name__</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n__content__\r\n\r\n<p>Tong don hang :&nbsp; __total__ VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n'),(7,'pass_root','Dangvanhai88');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_id` bigint NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `contact_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'DA Phone','doantotnghiep08082000@gmail.com',NULL,NULL,'2022-06-24 17:00:00'),(2,'Đặng Văn Hải','danghai882000@gmail.com','Test Contact','yeu cau nt','2022-05-07 04:31:44');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_job`
--

DROP TABLE IF EXISTS `email_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_job` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` varchar(455) NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '0' COMMENT '0 la chua 1 la r 2 la loi',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_job`
--

LOCK TABLES `email_job` WRITE;
/*!40000 ALTER TABLE `email_job` DISABLE KEYS */;
INSERT INTO `email_job` VALUES (1,1603337116132,'true','hihi',1),(2,1603337116134,'[GEAR GAMING]THONG BAO DON HANG #1638588930919','<p>Xin chao <strong>hai</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n<p style=\"margin-left:40px\">Samsung Galaxy Note 20 Ultra 5G : 1 (sp)</p><p style=\"margin-left:40px\">iPhone XR 64GB | Chính hãng VN/A : 1 (sp)</p>\r\n\r\n<p>Tong don hang :&nbsp; 25,990,000 VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n',1),(3,1603337116134,'[DA PHONE]THONG BAO DON HANG #1638588930920','<p>Xin chao <strong>hai</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n<p style=\"margin-left:40px\">Samsung Galaxy Note 20 Ultra 5G : 1 (sp)</p>\r\n\r\n<p>Tong don hang :&nbsp; 18,990,000 VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n',1),(4,1603337116134,'[DA PHONE]THONG BAO DON HANG #1638588930925','<p>Xin chao <strong>hai</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n<p style=\"margin-left:40px\">iPhone 12  Pro Max 128GB | Chính hãng VN/A : 1 (sp)</p><p style=\"margin-left:40px\">iPhone 13 Pro Max 128GB | Chính hãng VN/A : 1 (sp)</p>\r\n\r\n<p>Tong don hang :&nbsp; 47,800,000 VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n',1),(5,2,'[DA PHONE]THONG BAO DON HANG #1638588930926','<p>Xin chao <strong>quangdeptrai</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n<p style=\"margin-left:40px\">iPhone 13 mini 512GB | Chính hãng VN/A : 1 (sp)</p><p style=\"margin-left:40px\">iPhone XR 64GB | Chính hãng VN/A : 1 (sp)</p>\r\n\r\n<p>Tong don hang :&nbsp; 30,000,000 VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n',0),(6,1603337116134,'[DA PHONE]THONG BAO DON HANG #1638588930927','<p>Xin chao <strong>hai</strong>,</p>\r\n\r\n<p>Ban da mua hang o cua hang:</p>\r\n\r\n<p style=\"margin-left:40px\">iPhone XR 64GB | Chính hãng VN/A : 2 (sp)</p><p style=\"margin-left:40px\">123142132 : 1 (sp)</p>\r\n\r\n<p>Tong don hang :&nbsp; 1,245,241,123 VND</p>\r\n\r\n<p>Xin tran trong cam on!</p>\r\n',1);
/*!40000 ALTER TABLE `email_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `product_importprice` decimal(10,0) DEFAULT NULL,
  `product_quantily` int DEFAULT NULL,
  `product_dimensions` varchar(45) DEFAULT NULL,
  `product_ram` varchar(45) DEFAULT NULL,
  `product_weight` smallint DEFAULT NULL,
  `product_quantity_sold` smallint DEFAULT NULL,
  `product_material` varchar(45) DEFAULT NULL,
  `product_marketprice` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'iPhone 13 Pro Max 128GB | Chính hãng VN/A',1,'images/iphone_13_Pro_Max.jpg',29800000,'iPhone 13 Pro Max 128GB, cáp USB-C sang Lightning',27000000,9,'160.8 x 78.1 x 7.4 mm','16GB',2,0,'Kim loại',30000000),(2,1,'iPhone 13 mini 512GB | Chính hãng VN/A',1,'images/ip13.jpg',23000000,'iPhone 13 512GB, cáp USB-C sang Lightning',21000000,9,'160.8 x 78.1 x 7.4 mm','16GB',2,0,'Kim loại',25000000),(3,1,'iPhone 11 64GB | Chính hãng VN/A',1,'images/iphone_11.png',13000000,'iPhone 11 512GB, cáp USB-C sang Lightning',11500000,10,'160.8 x 78.1 x 7.4 mm','16GB',2,0,'Kim loại',14000000),(4,1,'iPhone 12  Pro Max 128GB | Chính hãng VN/A',1,'images/iphone_12_pro_max_.png',18000000,'iPhone 12 512GB, cáp USB-C sang Lightning',16000000,9,'160.8 x 78.1 x 7.4 mm','16GB',2,0,'Kim loại',20000000),(5,1,'iPhone XR 64GB | Chính hãng VN/A',1,'images/iphone_xr.png',7000000,'iPhone XR, cáp USB-C sang Lightning',6000000,8,'160.8 x 78.1 x 7.4 mm','8GB',2,0,'Kim loại',0),(49,2,'Samsung Galaxy Note 20 Ultra 5G',2,'images/samsung_note20_ultra.jpg',18990000,'Bút cảm ứng, Cây lấy sim, Tai nghe dây đầu Type C, Cáp Type C - Type C, Củ sạc nhanh rời đầu Type C, Sách hướng dẫn',17000000,8,'158.4mm x 178.4mm',NULL,2,0,'Kim loại',21000000),(53,1,'123142132',1,'images/iphone_12_pro_max_.png',1231241123,'124213213',1231212,1323123,'1231241','142GB',1,0,'123132',2142131231),(54,4,'Xiao mi note 11 pro | Chính hãng CN',4,'images/xiao-mi-note-11.png',0,'Điện thoại giá rẻ chất lượng cao. \n',90000000,11500000,'60cm x 10cm x 40cm','8Gb',2,0,'Nhựa',12000000),(55,4,'Xiaomi mi 11 | Hàng chính hãng NA',4,'images/xiaomi-mi-11.png',13000000,'Hàng xách tay Trung Quốc',12000000,11,'12cm x 18cm x3mm','8Gb',2,0,'Nhựa',13500000),(56,4,'Xiao mi note 11 pro blue | Chính hãng QC',4,'images/Xiaomi-11-pro-plus-blue.jpg',14000000,'Hàng QC chất lượng cao',12000000,20,'12cm x 18cm x3mm','8Gb',2,0,'Kim loại',15000000),(57,2,'Samsung galaxy A73 | Hàng chính hãng NA',2,'images/samsung-galaxy-a73.jpg',13000000,'Hàng chính hãng Mỹ chất lượng cao.',12000000,20,'12cm x 18cm x3mm','16Gb',2,0,'Kim loại',14000000),(58,2,'Samsung galaxy s22 ultra | Chính hãng NA',2,'images/galaxys22ultra.jpg',22900000,'Samsung kèm bút chỉ cực kì tiện lợi.',20000000,33,'12cm x 18cm x3mm','16Gb',2,0,'Kim loại',23900000),(59,3,'Oppo reno 6 | Hàng nhập khẩu QC',3,'images/oppo_reno6.jpg',10000000,'Oppo với thiết kế tinh tế cũng camera full HD +',9000000,12,'12cm x 18cm x3mm','8Gb',1,0,'Nhựa',12000000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_role` bit(1) DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1603337116137 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'quangdeptrai',NULL,'1234',_binary '',NULL),(1488431413954,'dangquangkdc',NULL,'123456',_binary '\0',NULL),(1488394819194,'quang',NULL,'123456',_binary '\0',NULL),(1603337116135,'hai','danghai882000@gmail.com',NULL,_binary '\0','12312313'),(1490249636892,'a','a','a',_binary '\0','a'),(1490249751501,'b','b','b',_binary '\0','b'),(1490263429251,'test','a','a',_binary '\0','a'),(3,'test1','dangquangkdc@gmail.com','a',_binary '\0','a'),(1603337116136,'haitest','danghai882000@gmail.com','123123',_binary '\0','2141241'),(1603337116134,'hai','danghai882000@gmail.com','123123',_binary '\0','399487332');
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

-- Dump completed on 2022-05-13  0:02:47
