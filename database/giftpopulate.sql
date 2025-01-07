CREATE DATABASE  IF NOT EXISTS `giftdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `giftdb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: giftdb
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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `mode_id` int NOT NULL,
  `txn_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `bill_id_UNIQUE` (`bill_id`),
  KEY `order_id_idx` (`orderid`),
  KEY `mode_id_idx` (`mode_id`),
  CONSTRAINT `mode_id` FOREIGN KEY (`mode_id`) REFERENCES `paymode` (`mode_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_id` FOREIGN KEY (`orderid`) REFERENCES `order` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `br_id` int NOT NULL AUTO_INCREMENT,
  `br_name` varchar(50) NOT NULL,
  PRIMARY KEY (`br_id`),
  UNIQUE KEY `bid_UNIQUE` (`br_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_desc` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fashion and Lifestyle',NULL),(2,'Accessories',NULL),(3,'Home and Living',NULL),(4,'Decoration',NULL),(5,'Beauty and fragrance',NULL),(6,'clothing',NULL),(7,'personalized',NULL),(8,'sweets and choclate',NULL),(9,'Gift Hampers and combo',NULL),(10,'stationary',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customization`
--

DROP TABLE IF EXISTS `customization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customization` (
  `custz_id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(25) DEFAULT NULL,
  `desc_text` varchar(255) NOT NULL,
  PRIMARY KEY (`custz_id`),
  UNIQUE KEY `custz_id_UNIQUE` (`custz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customization`
--

LOCK TABLES `customization` WRITE;
/*!40000 ALTER TABLE `customization` DISABLE KEYS */;
/*!40000 ALTER TABLE `customization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `contact_UNIQUE` (`contact`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'Aadarsh Sharma','aadarsh.sharma@gmail.com','Aadarsh@123',1,'9876543210','21, MG Road, New Delhi'),(2,'Bharat Mehta','bharat.mehta@gmail.com','Bharat#456',3,'8765432109','15, Park Lane, Mumbai'),(3,'Bhavna Patel','bhavna.patel@gmail.com','Bhavna$789',3,'7654321098','45, Residency Road, Ahmedabad'),(4,'Bindu Nair','bindu.nair@gmail.com','Bindu*321',3,'6543210987','101, MG Road, Kochi'),(5,'Balram Choudhary','balram.choudhary@gmail.com','Balram@987',3,'5432109876','89, Raja Bazar, Kolkata'),(6,'Bimal Kumar','bimal.kumar@email.com','Bimal@123',3,'9123456780','12, Brigade Road, Bengaluru'),(7,'Barkha Singh','barkha.singh@email.com','Barkha#456',3,'9988776655','78, Civil Lines, Jaipur'),(8,'Bijoy Das','bijoy.das@email.com','Bijoy$789',3,'9871234567','34, College Street, Kolkata'),(9,'Sumit Verma','sumit.verma@email.com','Sumit@123',2,'9012345678','23, Market Road, Delhi'),(10,'Sneha Kapoor','sneha.kapoor@email.com','Sneha#456',2,'9123456789','56, Mall Road, Mumbai'),(11,'Sachin Tiwari','sachin.tiwari@email.com','Sachin$789',2,'9234567890','78, High Street, Pune'),(12,'Sanjay Reddy','sanjay.reddy@email.com','Sanjay@321',2,'9345678901','12, Main Road, Hyderabad'),(13,'Swati Gupta','swati.gupta@email.com','Swati#654',2,'9456789012','90, Park Street, Kolkata'),(14,'Suresh Nair','suresh.nair@email.com','Suresh$987',2,'9567890123','34, Marine Drive, Kochi'),(15,'Sakshi Desai','sakshi.desai@email.com','Sakshi*111',2,'9678901234','67, Residency Road, Ahmedabad');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occasion`
--

DROP TABLE IF EXISTS `occasion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occasion` (
  `occ_id` int NOT NULL AUTO_INCREMENT,
  `occ_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`occ_id`),
  UNIQUE KEY `occ_id_UNIQUE` (`occ_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occasion`
--

LOCK TABLES `occasion` WRITE;
/*!40000 ALTER TABLE `occasion` DISABLE KEYS */;
INSERT INTO `occasion` VALUES (1,'Birthday'),(2,'Anniversary'),(3,'Wedding and Engagement '),(4,'Housewarming '),(5,'BestWishes'),(6,'Diwali'),(7,'Christmas'),(8,'Rakshabandhan'),(9,'Eid'),(10,'Valentie\'s Day ');
/*!40000 ALTER TABLE `occasion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `shipp_add` varchar(255) NOT NULL,
  `total_amt` float DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `buyer_id` int NOT NULL,
  `pay_mode` varchar(50) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`),
  KEY `buy_id_idx` (`buyer_id`),
  CONSTRAINT `buy_id` FOREIGN KEY (`buyer_id`) REFERENCES `login` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `oi_id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `amount` float NOT NULL,
  `product_id` int NOT NULL,
  `ord_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`oi_id`),
  UNIQUE KEY `od_id_UNIQUE` (`oi_id`),
  KEY `prd_id_idx` (`product_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `ord_id_idx` (`ord_id`),
  CONSTRAINT `ord_id` FOREIGN KEY (`ord_id`) REFERENCES `order` (`oid`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymode`
--

DROP TABLE IF EXISTS `paymode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymode` (
  `mode_id` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(25) NOT NULL,
  PRIMARY KEY (`mode_id`),
  UNIQUE KEY `mode_id_UNIQUE` (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymode`
--

LOCK TABLES `paymode` WRITE;
/*!40000 ALTER TABLE `paymode` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_desc` varchar(200) DEFAULT NULL,
  `prod_name` varchar(50) NOT NULL,
  `cat_id` int NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `prod_id_UNIQUE` (`prod_id`),
  KEY `cat_id_idx` (`cat_id`),
  CONSTRAINT `cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `pc_id` int NOT NULL AUTO_INCREMENT,
  `pd_id` int NOT NULL,
  `ctg_id` int NOT NULL,
  PRIMARY KEY (`pc_id`),
  UNIQUE KEY `pc_id_UNIQUE` (`pc_id`),
  KEY `pd_id_idx` (`pd_id`),
  KEY `cat_id_idx` (`ctg_id`),
  CONSTRAINT `ctg_id` FOREIGN KEY (`ctg_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pd_id` FOREIGN KEY (`pd_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_value` int NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `b_id` int NOT NULL,
  `p_id` int NOT NULL,
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `r_id_UNIQUE` (`r_id`),
  KEY `b_id_idx` (`b_id`),
  KEY `p_id_idx` (`p_id`),
  CONSTRAINT `b_id` FOREIGN KEY (`b_id`) REFERENCES `login` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `p_id` FOREIGN KEY (`p_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Seller'),(3,'Buyer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` int NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(100) NOT NULL,
  `gst_no` varchar(100) NOT NULL,
  `shopname` varchar(50) NOT NULL,
  `u_id` int NOT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `seller_id_UNIQUE` (`seller_id`),
  UNIQUE KEY `gst_no_UNIQUE` (`gst_no`),
  UNIQUE KEY `reg_no_UNIQUE` (`reg_no`),
  KEY `user_id_idx` (`u_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `login` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (8,'REG12345','GSTIN12345XYZ','Verma Cosmetics',9),(9,'REG67890','GSTIN67890ABC','Kapoor Fashion',10),(10,'REG54321','GSTIN54321DEF','Tiwari Mart',11),(11,'REG23456','GSTIN23456GHI','Reddy Stores',12),(12,'REG34567','GSTIN34567JKL','Gupta Emporium',13),(13,'REG45678','GSTIN45678MNO','Nair Hypermart',14),(14,'REG56789','GSTIN56789PQR','Desai Traders',15);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellerproduct`
--

DROP TABLE IF EXISTS `sellerproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellerproduct` (
  `spid` int NOT NULL AUTO_INCREMENT,
  `p_qty` int NOT NULL,
  `price` float NOT NULL,
  `img` longblob,
  `is_active` tinyint DEFAULT NULL,
  `sid` int NOT NULL,
  `pid` int NOT NULL,
  `custz_id` int NOT NULL,
  `brand_id` int NOT NULL,
  PRIMARY KEY (`spid`),
  UNIQUE KEY `spid_UNIQUE` (`spid`),
  KEY `sid_idx` (`sid`),
  KEY `pid_idx` (`pid`),
  KEY `custz_id_idx` (`custz_id`),
  KEY `brand_id_idx` (`brand_id`),
  CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`br_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `custz_id` FOREIGN KEY (`custz_id`) REFERENCES `customization` (`custz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerproduct`
--

LOCK TABLES `sellerproduct` WRITE;
/*!40000 ALTER TABLE `sellerproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellerproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 15:14:05
