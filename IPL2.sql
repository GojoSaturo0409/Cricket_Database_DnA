-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Achievements`
--

DROP TABLE IF EXISTS `Achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Achievements` (
  `Achievement_ID` int NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Year` year DEFAULT NULL,
  PRIMARY KEY (`Achievement_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Achievements`
--

LOCK TABLES `Achievements` WRITE;
/*!40000 ALTER TABLE `Achievements` DISABLE KEYS */;
INSERT INTO `Achievements` VALUES (1,'Most Economical Bowler',2023),(2,'Highest S/R Bowler',2023),(3,'Orange Cap',2023),(4,'Purple Cap',2023),(5,'Maximum Sixes',2023),(6,'Century',2023),(7,'Highest S/R Batsman',2023),(8,'3-Wicket Haul',2023),(9,'5-Wicket Haul',2023);
/*!40000 ALTER TABLE `Achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Terms`
--

DROP TABLE IF EXISTS `Financial_Terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Financial_Terms` (
  `TermsID` int NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TermsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Terms`
--

LOCK TABLES `Financial_Terms` WRITE;
/*!40000 ALTER TABLE `Financial_Terms` DISABLE KEYS */;
INSERT INTO `Financial_Terms` VALUES (1,'Accounting',1000000.00),(2,'Investment',20000000.00),(3,'Taxation',1500000.00),(4,'Risk Management',2000000.00),(5,'Market',2500000.00);
/*!40000 ALTER TABLE `Financial_Terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `City` varchar(35) NOT NULL,
  `RegionState` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES ('Ahmedabad','Gujarat'),('Bengaluru','Karnataka'),('Chennai','Tamil Nadu'),('Delhi','India'),('Dharamshala','Himachal Pradesh'),('Doha','Qatar'),('Guwahati','Assam'),('Hyderabad','Telangana'),('Jaipur','Rajasthan'),('Kolkata','West Bengal'),('Lucknow','Uttar Pradesh'),('Mohali','Punjab'),('Mumbai','Maharashtra');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matches` (
  `Stadium_ID` int NOT NULL,
  `Team_ID` int NOT NULL,
  `Coin_Toss_Winner` varchar(25) DEFAULT NULL,
  `Total_Number_Of_Stumpings` int DEFAULT NULL,
  `Staff_ID` int NOT NULL,
  `Day_Of_Match` int DEFAULT NULL,
  `Month_Of_Match` int DEFAULT NULL,
  `Year_Of_Match` year DEFAULT NULL,
  `Hours` int DEFAULT NULL,
  `Minutes` int DEFAULT NULL,
  `Seconds` int DEFAULT NULL,
  PRIMARY KEY (`Stadium_ID`,`Team_ID`,`Staff_ID`),
  KEY `Team_ID` (`Team_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`Stadium_ID`) REFERENCES `Stadium` (`Stadium_ID`),
  CONSTRAINT `Matches_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`),
  CONSTRAINT `Matches_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
INSERT INTO `Matches` VALUES (1,4,'CSK',8,4,12,4,2023,3,18,27),(2,4,'DC',8,2,17,4,2023,3,27,0),(2,5,'SRH',7,3,11,4,2023,3,20,0),(3,6,'GT',7,2,7,4,2023,3,30,0),(4,5,'MI',10,1,4,4,2023,3,0,0),(5,6,'RCB',9,5,14,4,2023,3,35,15);
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `Player_ID` int NOT NULL,
  `Name` varchar(35) DEFAULT NULL,
  `Year_Of_Birth` year DEFAULT NULL,
  `Month_Of_Birth` int DEFAULT NULL,
  `Day_Of_Birth` int DEFAULT NULL,
  `Base_Salary` decimal(10,2) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`Player_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `Player_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (1,'Ravindra Jadeja',1988,12,6,865649.00,'Indian',1),(2,'David Warner',1986,10,27,12490397.00,'Australia',2),(3,'David Miller',1989,6,10,64995400.00,'South Africa',3),(4,'Suryakumar Yadav',1990,9,14,3190000.00,'Indian',4),(5,'Adil Rashid',1988,2,17,200000.00,'English',5),(6,'Virat Kohli',1988,11,5,7000000.00,'Indian',6),(8,'Mahendra Singh Dhoni',1981,7,7,77777777.00,'Indian',1);
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `Player_ID` int NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'All-Rounder'),(2,'Batsman'),(3,'Batsman'),(4,'Wicket Keeper'),(5,'Bowler'),(6,'Batsman');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORING`
--

DROP TABLE IF EXISTS `SPONSORING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORING` (
  `Sponsoring_ID` int NOT NULL,
  `Sponsor_ID` int DEFAULT NULL,
  `Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`Sponsoring_ID`),
  KEY `Sponsor_ID` (`Sponsor_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `SPONSORING_ibfk_1` FOREIGN KEY (`Sponsor_ID`) REFERENCES `Sponsor` (`Sponsor_ID`),
  CONSTRAINT `SPONSORING_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORING`
--

LOCK TABLES `SPONSORING` WRITE;
/*!40000 ALTER TABLE `SPONSORING` DISABLE KEYS */;
INSERT INTO `SPONSORING` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,5,2);
/*!40000 ALTER TABLE `SPONSORING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsor`
--

DROP TABLE IF EXISTS `Sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsor` (
  `Sponsor_ID` int NOT NULL,
  `Name` varchar(35) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `City` varchar(35) DEFAULT NULL,
  `Terms_ID` int DEFAULT NULL,
  `Clauses_ID` int DEFAULT NULL,
  PRIMARY KEY (`Sponsor_ID`),
  KEY `City` (`City`),
  KEY `Terms_ID` (`Terms_ID`),
  KEY `Clauses_ID` (`Clauses_ID`),
  CONSTRAINT `Sponsor_ibfk_1` FOREIGN KEY (`City`) REFERENCES `Location` (`City`),
  CONSTRAINT `Sponsor_ibfk_2` FOREIGN KEY (`Terms_ID`) REFERENCES `Financial_Terms` (`TermsID`),
  CONSTRAINT `Sponsor_ibfk_3` FOREIGN KEY (`Clauses_ID`) REFERENCES `Termination_Clauses` (`ClausesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsor`
--

LOCK TABLES `Sponsor` WRITE;
/*!40000 ALTER TABLE `Sponsor` DISABLE KEYS */;
INSERT INTO `Sponsor` VALUES (1,'India Cements','corporate@indiacements.co.in','Chennai',1,1),(2,'JSW Steel Ltd.','support.steel@jsw.in','Mumbai',2,2),(3,'Ather Energy','support@atherenergy.in','Bengaluru',3,3),(4,'slice','help@sliceit.com','Bengaluru',4,4),(5,'FanCraze','corporate@fancraze.co.in','Bengaluru',3,3),(6,'Qatar Airways','support@qairways.com','Doha',5,5);
/*!40000 ALTER TABLE `Sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsoring_Team_In_Match`
--

DROP TABLE IF EXISTS `Sponsoring_Team_In_Match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsoring_Team_In_Match` (
  `Sponsor_ID` int NOT NULL,
  `Team_ID` int NOT NULL,
  `Staff_ID` int NOT NULL,
  `Stadium_ID` int NOT NULL,
  PRIMARY KEY (`Sponsor_ID`,`Team_ID`,`Staff_ID`,`Stadium_ID`),
  KEY `Team_ID` (`Team_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Stadium_ID` (`Stadium_ID`),
  CONSTRAINT `Sponsoring_Team_In_Match_ibfk_1` FOREIGN KEY (`Sponsor_ID`) REFERENCES `Sponsor` (`Sponsor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sponsoring_Team_In_Match_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sponsoring_Team_In_Match_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`),
  CONSTRAINT `Sponsoring_Team_In_Match_ibfk_4` FOREIGN KEY (`Stadium_ID`) REFERENCES `Stadium` (`Stadium_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsoring_Team_In_Match`
--

LOCK TABLES `Sponsoring_Team_In_Match` WRITE;
/*!40000 ALTER TABLE `Sponsoring_Team_In_Match` DISABLE KEYS */;
INSERT INTO `Sponsoring_Team_In_Match` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5);
/*!40000 ALTER TABLE `Sponsoring_Team_In_Match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stadium`
--

DROP TABLE IF EXISTS `Stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stadium` (
  `Stadium_ID` int NOT NULL,
  `Stadium_Name` varchar(100) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Home_Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`Stadium_ID`),
  KEY `City` (`City`),
  KEY `Home_Team_ID` (`Home_Team_ID`),
  CONSTRAINT `Stadium_ibfk_1` FOREIGN KEY (`City`) REFERENCES `Location` (`City`),
  CONSTRAINT `Stadium_ibfk_2` FOREIGN KEY (`Home_Team_ID`) REFERENCES `Team` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stadium`
--

LOCK TABLES `Stadium` WRITE;
/*!40000 ALTER TABLE `Stadium` DISABLE KEYS */;
INSERT INTO `Stadium` VALUES (1,'Narendra Modi Stadium','Ahmedabad',132000,3),(2,'M. Chinnaswamy Stadium','Bengaluru',40000,6),(3,'M. A. Chidambaram Stadium','Chennai',40000,1),(4,'Arun Jaitley Stadium','Delhi',41000,2),(5,'Rajiv Gandhi International Cricket Stadium','Hyderabad',55000,5),(6,'Wankhede Stadium','Mumbai',33000,4);
/*!40000 ALTER TABLE `Stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `Staff_ID` int NOT NULL,
  `Name` varchar(35) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Department` varchar(40) DEFAULT NULL,
  `Contact_Number` bigint DEFAULT NULL,
  `Stadium_ID` int DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`),
  KEY `Stadium_ID` (`Stadium_ID`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`Stadium_ID`) REFERENCES `Stadium` (`Stadium_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Sujit Gujar',45,'Umpiring',9812445005,1),(2,'Harsh Gujral',27,'Scoring',9024290296,3),(3,'Akshay Sharma',33,'Groundskeeping',9971696076,5),(4,'Chandan Sahu',23,'Logistics',7999340667,4),(5,'Aryaman Chopra',43,'Medical',9816931682,2);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stats`
--

DROP TABLE IF EXISTS `Stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stats` (
  `Player_ID` int NOT NULL,
  `Team_ID` int NOT NULL,
  `Total_Runs` int DEFAULT NULL,
  `Total_Wickets` int DEFAULT NULL,
  `Total_Matches` int DEFAULT NULL,
  `Achievement_ID` int DEFAULT NULL,
  PRIMARY KEY (`Player_ID`,`Team_ID`),
  KEY `Team_ID` (`Team_ID`),
  KEY `Achievement_ID` (`Achievement_ID`),
  CONSTRAINT `Stats_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `Player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Stats_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Stats_ibfk_3` FOREIGN KEY (`Achievement_ID`) REFERENCES `Achievements` (`Achievement_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
INSERT INTO `Stats` VALUES (1,1,2692,18,226,4),(2,2,6397,0,176,5),(3,3,2714,0,121,NULL),(4,4,3249,0,139,NULL),(5,5,22,6,3,8),(6,6,7263,4,140,3);
/*!40000 ALTER TABLE `Stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `Team_ID` int NOT NULL,
  `Name` varchar(35) DEFAULT NULL,
  `Region` varchar(20) DEFAULT NULL,
  `OwnerID` int DEFAULT NULL,
  PRIMARY KEY (`Team_ID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `Team_ibfk_2` FOREIGN KEY (`OwnerID`) REFERENCES `Team_Owner` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Chennai Super Kings','Chennai',1),(2,'Delhi Capitals','Delhi',2),(3,'Gujarat Titans','Gujarat',3),(4,'Mumbai Indians','Mumbai',4),(5,'Sunrisers Hyderabad','Hyderabad',5),(6,'Royal Challengers Bangalore','Bengaluru',6);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_Manager`
--

DROP TABLE IF EXISTS `Team_Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team_Manager` (
  `Manager_ID` int NOT NULL,
  `Name` varchar(35) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`Manager_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `Team_Manager_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_Manager`
--

LOCK TABLES `Team_Manager` WRITE;
/*!40000 ALTER TABLE `Team_Manager` DISABLE KEYS */;
INSERT INTO `Team_Manager` VALUES (1,'Stephen Flaming','steph@gmail.com',1),(2,'Ricky Ponting','ricky@gmail.com',2),(3,'Ashish Nehra','ashish.nehra@yahoo.com',3),(4,'Mark Boucher','mark.boucher@Outlook.com',4),(5,'Brian Lara','brian.lara@gmail.com',5),(6,'Sanjay Bangar','s.bangar@gmail.com',6);
/*!40000 ALTER TABLE `Team_Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_Owner`
--

DROP TABLE IF EXISTS `Team_Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team_Owner` (
  `OwnerID` int NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Contact_Number` bigint DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_Owner`
--

LOCK TABLES `Team_Owner` WRITE;
/*!40000 ALTER TABLE `Team_Owner` DISABLE KEYS */;
INSERT INTO `Team_Owner` VALUES (1,'N.Srinivasan',9878785674,'srinivasan@chennaisuperkings.in'),(2,'Parth Jindal',61747056780,'pjindal@delhicapitals.in'),(3,'Steve Koltes',7656888432,'skoltes@gujarattitans.in'),(4,'Mukesh Ambani',8876545673,'mambani@reliance.co.in'),(5,'Kalanathi Maran',6345667790,'kmaran@suntv.in'),(6,'Hina Nagarajan',9654556655,'hina@unitedspirits.com');
/*!40000 ALTER TABLE `Team_Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Termination_Clauses`
--

DROP TABLE IF EXISTS `Termination_Clauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Termination_Clauses` (
  `ClausesID` int NOT NULL,
  `Type` varchar(40) DEFAULT NULL,
  `Contact_Duration` int DEFAULT NULL,
  PRIMARY KEY (`ClausesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Termination_Clauses`
--

LOCK TABLES `Termination_Clauses` WRITE;
/*!40000 ALTER TABLE `Termination_Clauses` DISABLE KEYS */;
INSERT INTO `Termination_Clauses` VALUES (1,'Fixed-Term Contract',1),(2,'Termination for Convenience',5),(3,'Termination for Cause',5),(4,'Termination by Mutual Agreement',5),(5,'Automatic Renewal',5);
/*!40000 ALTER TABLE `Termination_Clauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `uname` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `UserType` char(1) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('atidipt','chawasthi','A');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKING_IN`
--

DROP TABLE IF EXISTS `WORKING_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKING_IN` (
  `WorkingIn_ID` int NOT NULL,
  `Staff_ID` int DEFAULT NULL,
  `Stadium_ID` int DEFAULT NULL,
  `Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`WorkingIn_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Stadium_ID` (`Stadium_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `WORKING_IN_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`),
  CONSTRAINT `WORKING_IN_ibfk_2` FOREIGN KEY (`Stadium_ID`) REFERENCES `Stadium` (`Stadium_ID`),
  CONSTRAINT `WORKING_IN_ibfk_3` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKING_IN`
--

LOCK TABLES `WORKING_IN` WRITE;
/*!40000 ALTER TABLE `WORKING_IN` DISABLE KEYS */;
INSERT INTO `WORKING_IN` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5);
/*!40000 ALTER TABLE `WORKING_IN` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03  3:02:46
