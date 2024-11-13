CREATE DATABASE  IF NOT EXISTS `fitfeedkc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitfeedkc`;
-- MySQL dump 10.13  Distrib 9.0.1, for macos15.1 (arm64)
--
-- Host: 127.0.0.1    Database: fitfeedkc
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00431b22-cf76-4481-86bc-98c760f68b18',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','09b96acc-cc3e-4235-bb05-ca31512f531a',1,10,1,'188fbad4-00dc-4806-9a00-f8364c03de88',NULL),('0404c476-a6bf-4e55-b28b-44b52da7bbc9',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','d167b6e1-e23d-409f-95d1-68023f1fff80',1,40,1,'0f22d296-dcb1-49a2-adb1-0afdb89f3f0f',NULL),('0a469e41-5b7a-4e59-9091-cb4760e87eb9',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','6060d93e-2071-46f2-af1a-7da88cf3689a',0,10,0,NULL,NULL),('10ed9980-c356-4504-b1e1-f2bff2217c0c',NULL,'auth-username-password-form','a0eed67d-7ba7-43be-975d-4b43b992cb82','000eed85-95d0-48a6-869a-9edb46c89b7b',0,10,0,NULL,NULL),('1c50abd0-273a-4c52-9f5f-6e06aef5926a',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','41e2183f-f707-41dd-a7a5-74f1a5fa82c4',1,20,1,'1b299ddb-901a-4eda-a1f5-73a7a7ea7565',NULL),('1e03997d-29ed-4a28-be27-2528ca06122f',NULL,'registration-user-creation','a0eed67d-7ba7-43be-975d-4b43b992cb82','eddff056-8a04-4189-b35b-bd7530ef2595',0,20,0,NULL,NULL),('1e14bd45-670e-4609-8e18-f46a5484f970',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','d47028a3-f5b1-4c9b-8c03-16494d2410ab',0,20,1,'618f191a-6c16-4189-970e-5a89420c0761',NULL),('21c78c9e-751a-4536-a8f5-fc38474ee20a',NULL,'direct-grant-validate-username','24a97d78-9efc-42ed-8f27-1d9a9a73830a','1fd11c80-10a8-4335-a190-a67f5ebe819a',0,10,0,NULL,NULL),('29ef30e5-75fb-46fd-9e14-f6869d8dc307',NULL,'registration-page-form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','25857b50-c9ec-45eb-a1c7-ad51dffb0349',0,10,1,'f178bc3b-9184-40fb-b3fe-6a9db3209229',NULL),('2bdf721a-7012-4091-ab3d-56f04f8177c7',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','3916a2b2-31ba-40cc-a9f6-824fc43d8326',0,10,0,NULL,NULL),('2d339df5-9e90-4964-a092-d8e734b56fad',NULL,'registration-recaptcha-action','a0eed67d-7ba7-43be-975d-4b43b992cb82','eddff056-8a04-4189-b35b-bd7530ef2595',3,60,0,NULL,NULL),('2e5df5c7-efd2-4b50-9835-43d1a10b75ec',NULL,'idp-confirm-link','a0eed67d-7ba7-43be-975d-4b43b992cb82','43b33716-bf21-49c1-a5cf-ce0b512cfd02',0,10,0,NULL,NULL),('2edc4237-1005-42cb-ad2f-f8f1afdd610e',NULL,'idp-email-verification','24a97d78-9efc-42ed-8f27-1d9a9a73830a','618f191a-6c16-4189-970e-5a89420c0761',2,10,0,NULL,NULL),('32e29cd0-dbdd-44d0-b9f0-e3300cad358e',NULL,'client-secret-jwt','a0eed67d-7ba7-43be-975d-4b43b992cb82','e5173939-8a31-47af-a108-41aead4c483b',2,30,0,NULL,NULL),('36d23380-c812-4d61-b93d-bac44e768446',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','b865a104-948c-49db-81d0-34a1eea17f09',2,20,1,'41e2183f-f707-41dd-a7a5-74f1a5fa82c4',NULL),('373dc3cb-e510-49ce-aca5-236a9a8d48e5',NULL,'docker-http-basic-authenticator','24a97d78-9efc-42ed-8f27-1d9a9a73830a','41b6138f-0bec-4402-8911-3efec1055897',0,10,0,NULL,NULL),('37f7bbcc-2c82-4252-8f83-5e112c5c6647',NULL,'idp-review-profile','24a97d78-9efc-42ed-8f27-1d9a9a73830a','7baf86c9-e7c0-407c-8dc3-91d043a078c0',0,10,0,NULL,'f3f30955-39a1-40d9-b0d4-f259a8d092ca'),('38f1f884-03e1-46c6-a014-318984d623bc',NULL,'auth-cookie','a0eed67d-7ba7-43be-975d-4b43b992cb82','2ec1f963-2c41-447b-890d-dd2669e5a2a0',2,10,0,NULL,NULL),('3a328342-18a1-44c8-8ed8-5987e05ef806',NULL,'client-x509','24a97d78-9efc-42ed-8f27-1d9a9a73830a','b52d9de9-d3ee-4cf6-9616-88fd76b28d52',2,40,0,NULL,NULL),('3a7bf572-710f-40fe-868a-83b4fa11f3ff',NULL,'auth-cookie','24a97d78-9efc-42ed-8f27-1d9a9a73830a','acf455c7-2bb1-4ed6-bd14-636e34224f39',2,10,0,NULL,NULL),('3e3645dc-478e-49c4-9eec-cb2ca106570a',NULL,'conditional-user-configured','a0eed67d-7ba7-43be-975d-4b43b992cb82','0f22d296-dcb1-49a2-adb1-0afdb89f3f0f',0,10,0,NULL,NULL),('40e2118b-420b-4c2d-ba74-a1a80eaf098d',NULL,'direct-grant-validate-password','a0eed67d-7ba7-43be-975d-4b43b992cb82','d86390ac-7263-4768-b6fc-3734000dbd37',0,20,0,NULL,NULL),('422cce7f-46a3-4b16-a70b-3dda26137e45',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','5973c863-2b17-4d9f-b827-101a7a882457',1,40,1,'a7492df7-f3ee-41ad-a4e8-047f14cab051',NULL),('42a6258a-cec5-4acc-bf1d-89e638e724ac',NULL,'docker-http-basic-authenticator','a0eed67d-7ba7-43be-975d-4b43b992cb82','22fa5977-cca7-4798-9395-4e1a4f2eb4b6',0,10,0,NULL,NULL),('43e00d03-3768-422e-b2af-7e451a61c776',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','eeb8cf51-f0ac-467e-95a2-dd8b2622ae1f',0,10,0,NULL,NULL),('456c89fd-65f0-43e1-9208-598a947f19ac',NULL,'registration-user-creation','24a97d78-9efc-42ed-8f27-1d9a9a73830a','f178bc3b-9184-40fb-b3fe-6a9db3209229',0,20,0,NULL,NULL),('45e97cb4-fa10-4387-9af6-70e7186fbc5e',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','188fbad4-00dc-4806-9a00-f8364c03de88',0,10,0,NULL,NULL),('465e0104-53ad-4920-be2a-128874e1b4aa',NULL,'client-x509','a0eed67d-7ba7-43be-975d-4b43b992cb82','e5173939-8a31-47af-a108-41aead4c483b',2,40,0,NULL,NULL),('46e9446a-a930-4afd-883e-d82e3518abad',NULL,'reset-credential-email','a0eed67d-7ba7-43be-975d-4b43b992cb82','d167b6e1-e23d-409f-95d1-68023f1fff80',0,20,0,NULL,NULL),('4bbcfa89-23c8-4b20-ba82-3b7d28c881f0',NULL,'auth-otp-form','a0eed67d-7ba7-43be-975d-4b43b992cb82','1b299ddb-901a-4eda-a1f5-73a7a7ea7565',0,20,0,NULL,NULL),('4f0c1575-2c31-4013-9383-439ef98642b2',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','618f191a-6c16-4189-970e-5a89420c0761',2,20,1,'8f92e3a0-3409-4ebe-96ef-a1752b0ea6a3',NULL),('541dea47-a85d-42c0-9125-9e1628369a48',NULL,'client-secret-jwt','24a97d78-9efc-42ed-8f27-1d9a9a73830a','b52d9de9-d3ee-4cf6-9616-88fd76b28d52',2,30,0,NULL,NULL),('567a8985-da14-49f7-ba2c-12924dd4a65b',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','1fd11c80-10a8-4335-a190-a67f5ebe819a',1,30,1,'3916a2b2-31ba-40cc-a9f6-824fc43d8326',NULL),('5c41a9a7-a937-41a3-bfea-9fb5814556db',NULL,'client-jwt','24a97d78-9efc-42ed-8f27-1d9a9a73830a','b52d9de9-d3ee-4cf6-9616-88fd76b28d52',2,20,0,NULL,NULL),('5f950497-0b67-489a-a585-6709c03132f3',NULL,'conditional-user-configured','a0eed67d-7ba7-43be-975d-4b43b992cb82','75c103f7-6ec6-45dc-8fc1-1340e1987e4e',0,10,0,NULL,NULL),('60678c8d-e8e2-4981-af09-4f51a8da8ce9',NULL,'registration-recaptcha-action','24a97d78-9efc-42ed-8f27-1d9a9a73830a','f178bc3b-9184-40fb-b3fe-6a9db3209229',3,60,0,NULL,NULL),('67188a4b-93a7-4e37-a620-9c53fc4481f8',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','7baf86c9-e7c0-407c-8dc3-91d043a078c0',1,50,1,'28ce5921-d1b1-4a98-b510-cdd7840e7345',NULL),('6f53afbc-65b7-4a1d-a0aa-8a32dd243f15',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','acf455c7-2bb1-4ed6-bd14-636e34224f39',2,26,1,'09b96acc-cc3e-4235-bb05-ca31512f531a',NULL),('73fdbcb0-082c-4f12-b15c-1b03ad3366e1',NULL,'registration-page-form','a0eed67d-7ba7-43be-975d-4b43b992cb82','7728c38c-d22a-4a64-a53c-c382f9f10376',0,10,1,'eddff056-8a04-4189-b35b-bd7530ef2595',NULL),('75370ffc-de23-4e92-9276-dfdd7ea382a0',NULL,'registration-terms-and-conditions','a0eed67d-7ba7-43be-975d-4b43b992cb82','eddff056-8a04-4189-b35b-bd7530ef2595',3,70,0,NULL,NULL),('75a51f4d-332c-4f51-8f93-7198b8e24903',NULL,'conditional-user-configured','a0eed67d-7ba7-43be-975d-4b43b992cb82','1b299ddb-901a-4eda-a1f5-73a7a7ea7565',0,10,0,NULL,NULL),('7b7183a4-3876-4b06-b50f-e33aaf73bc64',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','308d5e03-c4a4-447e-9dcb-57c0fae8a50a',0,20,1,'678d12f5-b723-4a6f-9c54-b584c0e92407',NULL),('7bbfe5aa-a1b9-4567-862f-0b5936b52561',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','2ec1f963-2c41-447b-890d-dd2669e5a2a0',2,30,1,'000eed85-95d0-48a6-869a-9edb46c89b7b',NULL),('8145dedc-6d2d-40a7-b6c8-127d433fab69',NULL,'reset-credentials-choose-user','a0eed67d-7ba7-43be-975d-4b43b992cb82','d167b6e1-e23d-409f-95d1-68023f1fff80',0,10,0,NULL,NULL),('8201b34c-c107-4ca2-88bc-0b8268120d2a',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','a7492df7-f3ee-41ad-a4e8-047f14cab051',0,10,0,NULL,NULL),('84e69ce1-fe7b-479e-8f19-dcc5be6c31be',NULL,'direct-grant-validate-otp','a0eed67d-7ba7-43be-975d-4b43b992cb82','75c103f7-6ec6-45dc-8fc1-1340e1987e4e',0,20,0,NULL,NULL),('85eaf5a1-c197-4800-b627-d8c507634ceb',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','0eff58d6-68db-47d8-a5b2-48cb85ebb06d',1,20,1,'eeb8cf51-f0ac-467e-95a2-dd8b2622ae1f',NULL),('85fb62a6-f237-4510-b5f6-bb4020a4315c',NULL,'idp-email-verification','a0eed67d-7ba7-43be-975d-4b43b992cb82','b865a104-948c-49db-81d0-34a1eea17f09',2,10,0,NULL,NULL),('92e54976-fe9c-4af0-82e1-a1b30e602585',NULL,'identity-provider-redirector','24a97d78-9efc-42ed-8f27-1d9a9a73830a','acf455c7-2bb1-4ed6-bd14-636e34224f39',2,25,0,NULL,NULL),('94527a8a-5a95-463f-92a8-8790eaeb29e8',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','678d12f5-b723-4a6f-9c54-b584c0e92407',2,20,1,'43b33716-bf21-49c1-a5cf-ce0b512cfd02',NULL),('9aa4ee0c-c89f-42a6-a924-e3144181d910',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','acf455c7-2bb1-4ed6-bd14-636e34224f39',2,30,1,'0eff58d6-68db-47d8-a5b2-48cb85ebb06d',NULL),('9aaeee10-178b-4f73-a4cd-423b1d767cd0',NULL,'reset-password','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5973c863-2b17-4d9f-b827-101a7a882457',0,30,0,NULL,NULL),('9e40a0d1-c699-4d25-9459-42175fd0c92e',NULL,'client-secret','24a97d78-9efc-42ed-8f27-1d9a9a73830a','b52d9de9-d3ee-4cf6-9616-88fd76b28d52',2,10,0,NULL,NULL),('9f423eaa-6f2a-400d-ae29-4d3993e6807f',NULL,'auth-username-password-form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0eff58d6-68db-47d8-a5b2-48cb85ebb06d',0,10,0,NULL,NULL),('a1c7ed38-f992-4148-96c6-d917207a1969',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','d86390ac-7263-4768-b6fc-3734000dbd37',1,30,1,'75c103f7-6ec6-45dc-8fc1-1340e1987e4e',NULL),('a3995f96-a497-4650-8cb7-451ab6a63dbe',NULL,'idp-username-password-form','a0eed67d-7ba7-43be-975d-4b43b992cb82','41e2183f-f707-41dd-a7a5-74f1a5fa82c4',0,10,0,NULL,NULL),('a8605c23-aab0-46b2-a95a-bbe5cb353bf9',NULL,'idp-confirm-link','24a97d78-9efc-42ed-8f27-1d9a9a73830a','d47028a3-f5b1-4c9b-8c03-16494d2410ab',0,10,0,NULL,NULL),('a8e4f440-f795-4921-abe9-93876329dcc6',NULL,'auth-otp-form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','eeb8cf51-f0ac-467e-95a2-dd8b2622ae1f',0,20,0,NULL,NULL),('ae0c75d8-1f93-4f8e-aa7e-c74d9853df53',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','000eed85-95d0-48a6-869a-9edb46c89b7b',1,20,1,'97b1a7f3-9557-4efa-bf63-e39fe969cb16',NULL),('b1f51253-c8f4-4930-8bd7-e8429f3f308d',NULL,'idp-username-password-form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','8f92e3a0-3409-4ebe-96ef-a1752b0ea6a3',0,10,0,NULL,NULL),('b46a3004-a6ff-45ff-a335-d32fa999c9bb',NULL,'client-secret','a0eed67d-7ba7-43be-975d-4b43b992cb82','e5173939-8a31-47af-a108-41aead4c483b',2,10,0,NULL,NULL),('b8ca487f-74a3-4830-afcc-9f00ae249e8c',NULL,'direct-grant-validate-password','24a97d78-9efc-42ed-8f27-1d9a9a73830a','1fd11c80-10a8-4335-a190-a67f5ebe819a',0,20,0,NULL,NULL),('ba118d5d-c27d-4a89-9238-3cdedc9cc8ed',NULL,'idp-add-organization-member','24a97d78-9efc-42ed-8f27-1d9a9a73830a','28ce5921-d1b1-4a98-b510-cdd7840e7345',0,20,0,NULL,NULL),('bc46ccaf-3854-48cb-96ae-665e8fbd9dc3',NULL,'auth-otp-form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','6060d93e-2071-46f2-af1a-7da88cf3689a',0,20,0,NULL,NULL),('c6c11cc5-e5be-490b-8025-8facee821358',NULL,'idp-review-profile','a0eed67d-7ba7-43be-975d-4b43b992cb82','308d5e03-c4a4-447e-9dcb-57c0fae8a50a',0,10,0,NULL,'8b539ab8-596e-487a-b1a8-218f192ae88d'),('c892e7e6-b9f7-49ff-8af4-d48759051935',NULL,'reset-credentials-choose-user','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5973c863-2b17-4d9f-b827-101a7a882457',0,10,0,NULL,NULL),('cbe082be-429f-4390-beda-38fd87decb20',NULL,'registration-terms-and-conditions','24a97d78-9efc-42ed-8f27-1d9a9a73830a','f178bc3b-9184-40fb-b3fe-6a9db3209229',3,70,0,NULL,NULL),('cf92c2de-df55-47db-a961-8eee9f7a7738',NULL,'reset-password','a0eed67d-7ba7-43be-975d-4b43b992cb82','d167b6e1-e23d-409f-95d1-68023f1fff80',0,30,0,NULL,NULL),('d15edbb6-7256-4f47-b4df-1eadc06b0de5',NULL,'idp-create-user-if-unique','a0eed67d-7ba7-43be-975d-4b43b992cb82','678d12f5-b723-4a6f-9c54-b584c0e92407',2,10,0,NULL,'ecf430d9-0a3f-4669-a039-9be03777cdb5'),('d396257a-76db-4534-aa28-30f559cd7138',NULL,'auth-spnego','a0eed67d-7ba7-43be-975d-4b43b992cb82','2ec1f963-2c41-447b-890d-dd2669e5a2a0',3,20,0,NULL,NULL),('d526b430-1c55-4ad7-a85a-f4fbf2febf08',NULL,'organization','24a97d78-9efc-42ed-8f27-1d9a9a73830a','188fbad4-00dc-4806-9a00-f8364c03de88',2,20,0,NULL,NULL),('d82ed41b-0c20-49df-9b4e-71c70db63496',NULL,'conditional-user-configured','a0eed67d-7ba7-43be-975d-4b43b992cb82','97b1a7f3-9557-4efa-bf63-e39fe969cb16',0,10,0,NULL,NULL),('d9817cff-c8a6-4aeb-9db9-7dba2fe86fef',NULL,'http-basic-authenticator','a0eed67d-7ba7-43be-975d-4b43b992cb82','b271901f-4599-430a-a4c1-47e41d925937',0,10,0,NULL,NULL),('dd5723bb-600f-4857-973b-a7b4e1060c75',NULL,'direct-grant-validate-username','a0eed67d-7ba7-43be-975d-4b43b992cb82','d86390ac-7263-4768-b6fc-3734000dbd37',0,10,0,NULL,NULL),('df1f2a7e-d257-442b-9a75-392651c27771',NULL,'registration-password-action','a0eed67d-7ba7-43be-975d-4b43b992cb82','eddff056-8a04-4189-b35b-bd7530ef2595',0,50,0,NULL,NULL),('e2fdbd18-6f72-495c-9006-8887a8618773',NULL,'reset-otp','24a97d78-9efc-42ed-8f27-1d9a9a73830a','a7492df7-f3ee-41ad-a4e8-047f14cab051',0,20,0,NULL,NULL),('e3cfc6df-0c4d-4ab0-870d-15b68827a7d3',NULL,'http-basic-authenticator','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0782c302-0318-4a54-b6bb-25ccdbce5d4c',0,10,0,NULL,NULL),('e716569c-fa50-48ff-b03c-140586163ca0',NULL,'conditional-user-configured','24a97d78-9efc-42ed-8f27-1d9a9a73830a','28ce5921-d1b1-4a98-b510-cdd7840e7345',0,10,0,NULL,NULL),('e8d1311a-5570-417e-88af-535903542e1c',NULL,'reset-credential-email','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5973c863-2b17-4d9f-b827-101a7a882457',0,20,0,NULL,NULL),('e9a0b022-7ff2-43ab-a0f1-1efae3a17d2f',NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','43b33716-bf21-49c1-a5cf-ce0b512cfd02',0,20,1,'b865a104-948c-49db-81d0-34a1eea17f09',NULL),('ea5b3e59-3bf8-4c09-9ebb-32c6080a9757',NULL,'client-jwt','a0eed67d-7ba7-43be-975d-4b43b992cb82','e5173939-8a31-47af-a108-41aead4c483b',2,20,0,NULL,NULL),('eb207906-ad01-44c5-b1f1-b647b131c167',NULL,'identity-provider-redirector','a0eed67d-7ba7-43be-975d-4b43b992cb82','2ec1f963-2c41-447b-890d-dd2669e5a2a0',2,25,0,NULL,NULL),('ec330a06-f7b8-4a0c-89ac-e780e64117de',NULL,'idp-create-user-if-unique','24a97d78-9efc-42ed-8f27-1d9a9a73830a','bd73195a-16c7-44df-8936-57f1b7462586',2,10,0,NULL,'a9339d85-7ed5-4e87-bab6-9a6ed776c99c'),('ec9cf5bb-af02-4496-9564-cb5bcebc1cf3',NULL,'registration-password-action','24a97d78-9efc-42ed-8f27-1d9a9a73830a','f178bc3b-9184-40fb-b3fe-6a9db3209229',0,50,0,NULL,NULL),('efd0b895-2edb-44ee-ba46-32bebfad4f84',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','8f92e3a0-3409-4ebe-96ef-a1752b0ea6a3',1,20,1,'6060d93e-2071-46f2-af1a-7da88cf3689a',NULL),('f35e8221-4818-4ad7-95fd-012b6be34b0b',NULL,'auth-otp-form','a0eed67d-7ba7-43be-975d-4b43b992cb82','97b1a7f3-9557-4efa-bf63-e39fe969cb16',0,20,0,NULL,NULL),('f3f9b7e6-ea5b-49fb-98df-1447a8e95069',NULL,'reset-otp','a0eed67d-7ba7-43be-975d-4b43b992cb82','0f22d296-dcb1-49a2-adb1-0afdb89f3f0f',0,20,0,NULL,NULL),('f68be041-9b0e-4d1d-87a3-639fbf7a2f50',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','bd73195a-16c7-44df-8936-57f1b7462586',2,20,1,'d47028a3-f5b1-4c9b-8c03-16494d2410ab',NULL),('f8e1c626-8c06-4691-96a9-a02c1e88a5be',NULL,'auth-spnego','24a97d78-9efc-42ed-8f27-1d9a9a73830a','acf455c7-2bb1-4ed6-bd14-636e34224f39',3,20,0,NULL,NULL),('f975eaf1-fe0b-42d6-855a-f24cb579fd95',NULL,'direct-grant-validate-otp','24a97d78-9efc-42ed-8f27-1d9a9a73830a','3916a2b2-31ba-40cc-a9f6-824fc43d8326',0,20,0,NULL,NULL),('ff9ced53-d516-4ac6-9557-2c7bb8c2afe2',NULL,NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','7baf86c9-e7c0-407c-8dc3-91d043a078c0',0,20,1,'bd73195a-16c7-44df-8936-57f1b7462586',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('000eed85-95d0-48a6-869a-9edb46c89b7b','forms','Username, password, otp and other auth forms.','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('0782c302-0318-4a54-b6bb-25ccdbce5d4c','saml ecp','SAML ECP Profile Authentication Flow','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('09b96acc-cc3e-4235-bb05-ca31512f531a','Organization',NULL,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('0eff58d6-68db-47d8-a5b2-48cb85ebb06d','forms','Username, password, otp and other auth forms.','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('0f22d296-dcb1-49a2-adb1-0afdb89f3f0f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('188fbad4-00dc-4806-9a00-f8364c03de88','Browser - Conditional Organization','Flow to determine if the organization identity-first login is to be used','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('1b299ddb-901a-4eda-a1f5-73a7a7ea7565','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('1fd11c80-10a8-4335-a190-a67f5ebe819a','direct grant','OpenID Connect Resource Owner Grant','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('22fa5977-cca7-4798-9395-4e1a4f2eb4b6','docker auth','Used by Docker clients to authenticate against the IDP','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('25857b50-c9ec-45eb-a1c7-ad51dffb0349','registration','Registration flow','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('28ce5921-d1b1-4a98-b510-cdd7840e7345','First Broker Login - Conditional Organization','Flow to determine if the authenticator that adds organization members is to be used','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('2ec1f963-2c41-447b-890d-dd2669e5a2a0','browser','Browser based authentication','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('308d5e03-c4a4-447e-9dcb-57c0fae8a50a','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('3916a2b2-31ba-40cc-a9f6-824fc43d8326','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('41b6138f-0bec-4402-8911-3efec1055897','docker auth','Used by Docker clients to authenticate against the IDP','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('41e2183f-f707-41dd-a7a5-74f1a5fa82c4','Verify Existing Account by Re-authentication','Reauthentication of existing account','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('43b33716-bf21-49c1-a5cf-ce0b512cfd02','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('5973c863-2b17-4d9f-b827-101a7a882457','reset credentials','Reset credentials for a user if they forgot their password or something','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('6060d93e-2071-46f2-af1a-7da88cf3689a','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('618f191a-6c16-4189-970e-5a89420c0761','Account verification options','Method with which to verity the existing account','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('678d12f5-b723-4a6f-9c54-b584c0e92407','User creation or linking','Flow for the existing/non-existing user alternatives','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('75c103f7-6ec6-45dc-8fc1-1340e1987e4e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('7728c38c-d22a-4a64-a53c-c382f9f10376','registration','Registration flow','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('7baf86c9-e7c0-407c-8dc3-91d043a078c0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('8f92e3a0-3409-4ebe-96ef-a1752b0ea6a3','Verify Existing Account by Re-authentication','Reauthentication of existing account','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('97b1a7f3-9557-4efa-bf63-e39fe969cb16','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('a7492df7-f3ee-41ad-a4e8-047f14cab051','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('acf455c7-2bb1-4ed6-bd14-636e34224f39','browser','Browser based authentication','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',1,1),('b271901f-4599-430a-a4c1-47e41d925937','saml ecp','SAML ECP Profile Authentication Flow','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('b52d9de9-d3ee-4cf6-9616-88fd76b28d52','clients','Base authentication for clients','24a97d78-9efc-42ed-8f27-1d9a9a73830a','client-flow',1,1),('b865a104-948c-49db-81d0-34a1eea17f09','Account verification options','Method with which to verity the existing account','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',0,1),('bd73195a-16c7-44df-8936-57f1b7462586','User creation or linking','Flow for the existing/non-existing user alternatives','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('d167b6e1-e23d-409f-95d1-68023f1fff80','reset credentials','Reset credentials for a user if they forgot their password or something','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('d47028a3-f5b1-4c9b-8c03-16494d2410ab','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('d86390ac-7263-4768-b6fc-3734000dbd37','direct grant','OpenID Connect Resource Owner Grant','a0eed67d-7ba7-43be-975d-4b43b992cb82','basic-flow',1,1),('e5173939-8a31-47af-a108-41aead4c483b','clients','Base authentication for clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','client-flow',1,1),('eddff056-8a04-4189-b35b-bd7530ef2595','registration form','Registration form','a0eed67d-7ba7-43be-975d-4b43b992cb82','form-flow',0,1),('eeb8cf51-f0ac-467e-95a2-dd8b2622ae1f','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','24a97d78-9efc-42ed-8f27-1d9a9a73830a','basic-flow',0,1),('f178bc3b-9184-40fb-b3fe-6a9db3209229','registration form','Registration form','24a97d78-9efc-42ed-8f27-1d9a9a73830a','form-flow',0,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('8b539ab8-596e-487a-b1a8-218f192ae88d','review profile config','a0eed67d-7ba7-43be-975d-4b43b992cb82'),('a9339d85-7ed5-4e87-bab6-9a6ed776c99c','create unique user config','24a97d78-9efc-42ed-8f27-1d9a9a73830a'),('ecf430d9-0a3f-4669-a039-9be03777cdb5','create unique user config','a0eed67d-7ba7-43be-975d-4b43b992cb82'),('f3f30955-39a1-40d9-b0d4-f259a8d092ca','review profile config','24a97d78-9efc-42ed-8f27-1d9a9a73830a');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('8b539ab8-596e-487a-b1a8-218f192ae88d','missing','update.profile.on.first.login'),('a9339d85-7ed5-4e87-bab6-9a6ed776c99c','false','require.password.update.after.registration'),('ecf430d9-0a3f-4669-a039-9be03777cdb5','false','require.password.update.after.registration'),('f3f30955-39a1-40d9-b0d4-f259a8d092ca','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('006f11c2-94de-4495-a2a4-f0bbdad3a824',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('061aeb14-6a34-4895-bafc-d34dd7910976',1,1,'fitfeed-rest-api',0,0,'ETcdqAuoZD3JJe0vhzw9AhmuLhDg6vIV','',0,'',0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',-1,0,0,'',0,'client-secret','','',NULL,1,0,1,0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,0,'account',0,1,NULL,'/realms/fitfeed-realm/account/',0,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('32d510c8-3b5d-4e6e-beee-75d32e090db4',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('44030384-ca1d-4f24-9940-41dcd15a1cf9',1,0,'fitfeed-realm-realm',0,0,NULL,NULL,1,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,0,0,0,'fitfeed-realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('715844ec-1a4f-4686-a692-bb7b40a680af',1,1,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('8f05029b-c702-4f6d-a920-bfcd21ea166c',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('94ee120c-bcc3-4e0e-a995-54c74412b5de',1,0,'account-console',0,1,NULL,'/realms/fitfeed-realm/account/',0,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('dd4df092-bbab-4948-9cad-b12df6e24e74',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('e42139f0-c4bb-4c6d-acac-0583c703ada7',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30',1,1,'security-admin-console',0,1,NULL,'/admin/fitfeed-realm/console/',0,NULL,0,'24a97d78-9efc-42ed-8f27-1d9a9a73830a','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'a0eed67d-7ba7-43be-975d-4b43b992cb82','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('006f11c2-94de-4495-a2a4-f0bbdad3a824','post.logout.redirect.uris','+'),('006f11c2-94de-4495-a2a4-f0bbdad3a824','realm_client','true'),('061aeb14-6a34-4895-bafc-d34dd7910976','backchannel.logout.revoke.offline.tokens','false'),('061aeb14-6a34-4895-bafc-d34dd7910976','backchannel.logout.session.required','true'),('061aeb14-6a34-4895-bafc-d34dd7910976','client.secret.creation.time','1730992400'),('061aeb14-6a34-4895-bafc-d34dd7910976','display.on.consent.screen','false'),('061aeb14-6a34-4895-bafc-d34dd7910976','oauth2.device.authorization.grant.enabled','false'),('061aeb14-6a34-4895-bafc-d34dd7910976','oidc.ciba.grant.enabled','false'),('061aeb14-6a34-4895-bafc-d34dd7910976','post.logout.redirect.uris','+'),('061aeb14-6a34-4895-bafc-d34dd7910976','realm_client','false'),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','post.logout.redirect.uris','+'),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','realm_client','false'),('32d510c8-3b5d-4e6e-beee-75d32e090db4','client.use.lightweight.access.token.enabled','true'),('715844ec-1a4f-4686-a692-bb7b40a680af','client.use.lightweight.access.token.enabled','true'),('715844ec-1a4f-4686-a692-bb7b40a680af','pkce.code.challenge.method','S256'),('715844ec-1a4f-4686-a692-bb7b40a680af','post.logout.redirect.uris','+'),('8f05029b-c702-4f6d-a920-bfcd21ea166c','post.logout.redirect.uris','+'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','pkce.code.challenge.method','S256'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','post.logout.redirect.uris','+'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','realm_client','false'),('dd4df092-bbab-4948-9cad-b12df6e24e74','post.logout.redirect.uris','+'),('dd4df092-bbab-4948-9cad-b12df6e24e74','realm_client','true'),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','pkce.code.challenge.method','S256'),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','post.logout.redirect.uris','+'),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','client.use.lightweight.access.token.enabled','true'),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','post.logout.redirect.uris','+'),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','realm_client','false'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','client.use.lightweight.access.token.enabled','true'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','pkce.code.challenge.method','S256'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','post.logout.redirect.uris','+'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','realm_client','false');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('11e28041-e0b5-4a03-9069-d2ddbac99857','address','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect built-in scope: address','openid-connect'),('158c08d4-b059-4bd0-83ad-be41f1e19591','acr','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('1c51a8a4-7c2d-4770-91de-785fb2ea1d8d','saml_organization','a0eed67d-7ba7-43be-975d-4b43b992cb82','Organization Membership','saml'),('22495a33-613c-4ce8-9cf1-b1fc66c6f104','microprofile-jwt','24a97d78-9efc-42ed-8f27-1d9a9a73830a','Microprofile - JWT built-in scope','openid-connect'),('4c6787d3-bbd9-4c28-acd8-51feee4b6351','web-origins','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('4d4a19ab-54ca-439b-b16c-020a50f2e599','role_list','24a97d78-9efc-42ed-8f27-1d9a9a73830a','SAML role list','saml'),('50f63572-4eeb-4149-bf3b-eb4192e4a595','web-origins','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('52a6f429-6e9a-404b-a883-191b69b5ae9e','acr','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('59af3913-25d7-4e65-a79c-a60fe94a4fff','roles','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect scope for add user roles to the access token','openid-connect'),('6118e52a-b838-44cb-ba91-50119e2e797a','email','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect built-in scope: email','openid-connect'),('6708ad99-1feb-473e-8beb-3f04afae4945','email','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect built-in scope: email','openid-connect'),('6fbfe7f0-dd68-4000-8517-1bef03a36222','roles','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect scope for add user roles to the access token','openid-connect'),('806e37b6-6d3f-4c13-b3d4-da7c26259407','saml_organization','24a97d78-9efc-42ed-8f27-1d9a9a73830a','Organization Membership','saml'),('83766062-4feb-46a2-8377-2a973d5659a6','address','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect built-in scope: address','openid-connect'),('84eae812-3b90-4866-93ca-829ca379ff31','organization','24a97d78-9efc-42ed-8f27-1d9a9a73830a','Additional claims about the organization a subject belongs to','openid-connect'),('854dc34a-e84e-4188-91f2-629badfd65c3','offline_access','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect built-in scope: offline_access','openid-connect'),('8ee3d3f1-872f-4dd1-94b2-f759fd381019','organization','a0eed67d-7ba7-43be-975d-4b43b992cb82','Additional claims about the organization a subject belongs to','openid-connect'),('a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6','profile','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect built-in scope: profile','openid-connect'),('a9de6044-725b-4e1f-afbb-736b67ecb740','offline_access','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect built-in scope: offline_access','openid-connect'),('aaa43944-09a4-4d55-a8cd-165449d77673','role_list','a0eed67d-7ba7-43be-975d-4b43b992cb82','SAML role list','saml'),('b5ed3009-ef65-43cf-9e95-e694ce36858e','phone','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect built-in scope: phone','openid-connect'),('baf692aa-26f3-41ce-940d-ff393180ced5','phone','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect built-in scope: phone','openid-connect'),('c9b79ed8-8b6c-4350-b6ac-54a11997122a','microprofile-jwt','a0eed67d-7ba7-43be-975d-4b43b992cb82','Microprofile - JWT built-in scope','openid-connect'),('e13f538c-892e-48fd-9020-958c0f74907b','basic','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect scope for add all basic claims to the token','openid-connect'),('e3f52383-764c-43e0-9483-b0b9b3a69e7c','basic','a0eed67d-7ba7-43be-975d-4b43b992cb82','OpenID Connect scope for add all basic claims to the token','openid-connect'),('f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59','profile','24a97d78-9efc-42ed-8f27-1d9a9a73830a','OpenID Connect built-in scope: profile','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('11e28041-e0b5-4a03-9069-d2ddbac99857','${addressScopeConsentText}','consent.screen.text'),('11e28041-e0b5-4a03-9069-d2ddbac99857','true','display.on.consent.screen'),('11e28041-e0b5-4a03-9069-d2ddbac99857','true','include.in.token.scope'),('158c08d4-b059-4bd0-83ad-be41f1e19591','false','display.on.consent.screen'),('158c08d4-b059-4bd0-83ad-be41f1e19591','false','include.in.token.scope'),('1c51a8a4-7c2d-4770-91de-785fb2ea1d8d','false','display.on.consent.screen'),('22495a33-613c-4ce8-9cf1-b1fc66c6f104','false','display.on.consent.screen'),('22495a33-613c-4ce8-9cf1-b1fc66c6f104','true','include.in.token.scope'),('4c6787d3-bbd9-4c28-acd8-51feee4b6351','','consent.screen.text'),('4c6787d3-bbd9-4c28-acd8-51feee4b6351','false','display.on.consent.screen'),('4c6787d3-bbd9-4c28-acd8-51feee4b6351','false','include.in.token.scope'),('4d4a19ab-54ca-439b-b16c-020a50f2e599','${samlRoleListScopeConsentText}','consent.screen.text'),('4d4a19ab-54ca-439b-b16c-020a50f2e599','true','display.on.consent.screen'),('50f63572-4eeb-4149-bf3b-eb4192e4a595','','consent.screen.text'),('50f63572-4eeb-4149-bf3b-eb4192e4a595','false','display.on.consent.screen'),('50f63572-4eeb-4149-bf3b-eb4192e4a595','false','include.in.token.scope'),('52a6f429-6e9a-404b-a883-191b69b5ae9e','false','display.on.consent.screen'),('52a6f429-6e9a-404b-a883-191b69b5ae9e','false','include.in.token.scope'),('59af3913-25d7-4e65-a79c-a60fe94a4fff','${rolesScopeConsentText}','consent.screen.text'),('59af3913-25d7-4e65-a79c-a60fe94a4fff','true','display.on.consent.screen'),('59af3913-25d7-4e65-a79c-a60fe94a4fff','false','include.in.token.scope'),('6118e52a-b838-44cb-ba91-50119e2e797a','${emailScopeConsentText}','consent.screen.text'),('6118e52a-b838-44cb-ba91-50119e2e797a','true','display.on.consent.screen'),('6118e52a-b838-44cb-ba91-50119e2e797a','true','include.in.token.scope'),('6708ad99-1feb-473e-8beb-3f04afae4945','${emailScopeConsentText}','consent.screen.text'),('6708ad99-1feb-473e-8beb-3f04afae4945','true','display.on.consent.screen'),('6708ad99-1feb-473e-8beb-3f04afae4945','true','include.in.token.scope'),('6fbfe7f0-dd68-4000-8517-1bef03a36222','${rolesScopeConsentText}','consent.screen.text'),('6fbfe7f0-dd68-4000-8517-1bef03a36222','true','display.on.consent.screen'),('6fbfe7f0-dd68-4000-8517-1bef03a36222','false','include.in.token.scope'),('806e37b6-6d3f-4c13-b3d4-da7c26259407','false','display.on.consent.screen'),('83766062-4feb-46a2-8377-2a973d5659a6','${addressScopeConsentText}','consent.screen.text'),('83766062-4feb-46a2-8377-2a973d5659a6','true','display.on.consent.screen'),('83766062-4feb-46a2-8377-2a973d5659a6','true','include.in.token.scope'),('84eae812-3b90-4866-93ca-829ca379ff31','${organizationScopeConsentText}','consent.screen.text'),('84eae812-3b90-4866-93ca-829ca379ff31','true','display.on.consent.screen'),('84eae812-3b90-4866-93ca-829ca379ff31','true','include.in.token.scope'),('854dc34a-e84e-4188-91f2-629badfd65c3','${offlineAccessScopeConsentText}','consent.screen.text'),('854dc34a-e84e-4188-91f2-629badfd65c3','true','display.on.consent.screen'),('8ee3d3f1-872f-4dd1-94b2-f759fd381019','${organizationScopeConsentText}','consent.screen.text'),('8ee3d3f1-872f-4dd1-94b2-f759fd381019','true','display.on.consent.screen'),('8ee3d3f1-872f-4dd1-94b2-f759fd381019','true','include.in.token.scope'),('a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6','${profileScopeConsentText}','consent.screen.text'),('a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6','true','display.on.consent.screen'),('a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6','true','include.in.token.scope'),('a9de6044-725b-4e1f-afbb-736b67ecb740','${offlineAccessScopeConsentText}','consent.screen.text'),('a9de6044-725b-4e1f-afbb-736b67ecb740','true','display.on.consent.screen'),('aaa43944-09a4-4d55-a8cd-165449d77673','${samlRoleListScopeConsentText}','consent.screen.text'),('aaa43944-09a4-4d55-a8cd-165449d77673','true','display.on.consent.screen'),('b5ed3009-ef65-43cf-9e95-e694ce36858e','${phoneScopeConsentText}','consent.screen.text'),('b5ed3009-ef65-43cf-9e95-e694ce36858e','true','display.on.consent.screen'),('b5ed3009-ef65-43cf-9e95-e694ce36858e','true','include.in.token.scope'),('baf692aa-26f3-41ce-940d-ff393180ced5','${phoneScopeConsentText}','consent.screen.text'),('baf692aa-26f3-41ce-940d-ff393180ced5','true','display.on.consent.screen'),('baf692aa-26f3-41ce-940d-ff393180ced5','true','include.in.token.scope'),('c9b79ed8-8b6c-4350-b6ac-54a11997122a','false','display.on.consent.screen'),('c9b79ed8-8b6c-4350-b6ac-54a11997122a','true','include.in.token.scope'),('e13f538c-892e-48fd-9020-958c0f74907b','false','display.on.consent.screen'),('e13f538c-892e-48fd-9020-958c0f74907b','false','include.in.token.scope'),('e3f52383-764c-43e0-9483-b0b9b3a69e7c','false','display.on.consent.screen'),('e3f52383-764c-43e0-9483-b0b9b3a69e7c','false','include.in.token.scope'),('f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59','${profileScopeConsentText}','consent.screen.text'),('f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59','true','display.on.consent.screen'),('f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('006f11c2-94de-4495-a2a4-f0bbdad3a824','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('006f11c2-94de-4495-a2a4-f0bbdad3a824','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('006f11c2-94de-4495-a2a4-f0bbdad3a824','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('006f11c2-94de-4495-a2a4-f0bbdad3a824','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('006f11c2-94de-4495-a2a4-f0bbdad3a824','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('006f11c2-94de-4495-a2a4-f0bbdad3a824','6118e52a-b838-44cb-ba91-50119e2e797a',1),('006f11c2-94de-4495-a2a4-f0bbdad3a824','84eae812-3b90-4866-93ca-829ca379ff31',0),('006f11c2-94de-4495-a2a4-f0bbdad3a824','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('006f11c2-94de-4495-a2a4-f0bbdad3a824','baf692aa-26f3-41ce-940d-ff393180ced5',0),('006f11c2-94de-4495-a2a4-f0bbdad3a824','e13f538c-892e-48fd-9020-958c0f74907b',1),('006f11c2-94de-4495-a2a4-f0bbdad3a824','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('061aeb14-6a34-4895-bafc-d34dd7910976','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('061aeb14-6a34-4895-bafc-d34dd7910976','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('061aeb14-6a34-4895-bafc-d34dd7910976','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('061aeb14-6a34-4895-bafc-d34dd7910976','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('061aeb14-6a34-4895-bafc-d34dd7910976','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('061aeb14-6a34-4895-bafc-d34dd7910976','6118e52a-b838-44cb-ba91-50119e2e797a',1),('061aeb14-6a34-4895-bafc-d34dd7910976','84eae812-3b90-4866-93ca-829ca379ff31',0),('061aeb14-6a34-4895-bafc-d34dd7910976','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('061aeb14-6a34-4895-bafc-d34dd7910976','baf692aa-26f3-41ce-940d-ff393180ced5',0),('061aeb14-6a34-4895-bafc-d34dd7910976','e13f538c-892e-48fd-9020-958c0f74907b',1),('061aeb14-6a34-4895-bafc-d34dd7910976','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','6118e52a-b838-44cb-ba91-50119e2e797a',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','84eae812-3b90-4866-93ca-829ca379ff31',0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','baf692aa-26f3-41ce-940d-ff393180ced5',0),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','e13f538c-892e-48fd-9020-958c0f74907b',1),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','6708ad99-1feb-473e-8beb-3f04afae4945',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','83766062-4feb-46a2-8377-2a973d5659a6',0),('32d510c8-3b5d-4e6e-beee-75d32e090db4','854dc34a-e84e-4188-91f2-629badfd65c3',0),('32d510c8-3b5d-4e6e-beee-75d32e090db4','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('32d510c8-3b5d-4e6e-beee-75d32e090db4','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('32d510c8-3b5d-4e6e-beee-75d32e090db4','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('32d510c8-3b5d-4e6e-beee-75d32e090db4','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('32d510c8-3b5d-4e6e-beee-75d32e090db4','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1),('715844ec-1a4f-4686-a692-bb7b40a680af','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('715844ec-1a4f-4686-a692-bb7b40a680af','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('715844ec-1a4f-4686-a692-bb7b40a680af','6708ad99-1feb-473e-8beb-3f04afae4945',1),('715844ec-1a4f-4686-a692-bb7b40a680af','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('715844ec-1a4f-4686-a692-bb7b40a680af','83766062-4feb-46a2-8377-2a973d5659a6',0),('715844ec-1a4f-4686-a692-bb7b40a680af','854dc34a-e84e-4188-91f2-629badfd65c3',0),('715844ec-1a4f-4686-a692-bb7b40a680af','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('715844ec-1a4f-4686-a692-bb7b40a680af','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('715844ec-1a4f-4686-a692-bb7b40a680af','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('715844ec-1a4f-4686-a692-bb7b40a680af','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('715844ec-1a4f-4686-a692-bb7b40a680af','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','6708ad99-1feb-473e-8beb-3f04afae4945',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','83766062-4feb-46a2-8377-2a973d5659a6',0),('8f05029b-c702-4f6d-a920-bfcd21ea166c','854dc34a-e84e-4188-91f2-629badfd65c3',0),('8f05029b-c702-4f6d-a920-bfcd21ea166c','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('8f05029b-c702-4f6d-a920-bfcd21ea166c','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('8f05029b-c702-4f6d-a920-bfcd21ea166c','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('8f05029b-c702-4f6d-a920-bfcd21ea166c','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('8f05029b-c702-4f6d-a920-bfcd21ea166c','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('94ee120c-bcc3-4e0e-a995-54c74412b5de','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('94ee120c-bcc3-4e0e-a995-54c74412b5de','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','6118e52a-b838-44cb-ba91-50119e2e797a',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','84eae812-3b90-4866-93ca-829ca379ff31',0),('94ee120c-bcc3-4e0e-a995-54c74412b5de','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('94ee120c-bcc3-4e0e-a995-54c74412b5de','baf692aa-26f3-41ce-940d-ff393180ced5',0),('94ee120c-bcc3-4e0e-a995-54c74412b5de','e13f538c-892e-48fd-9020-958c0f74907b',1),('94ee120c-bcc3-4e0e-a995-54c74412b5de','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('dd4df092-bbab-4948-9cad-b12df6e24e74','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('dd4df092-bbab-4948-9cad-b12df6e24e74','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','6118e52a-b838-44cb-ba91-50119e2e797a',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','84eae812-3b90-4866-93ca-829ca379ff31',0),('dd4df092-bbab-4948-9cad-b12df6e24e74','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('dd4df092-bbab-4948-9cad-b12df6e24e74','baf692aa-26f3-41ce-940d-ff393180ced5',0),('dd4df092-bbab-4948-9cad-b12df6e24e74','e13f538c-892e-48fd-9020-958c0f74907b',1),('dd4df092-bbab-4948-9cad-b12df6e24e74','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','6708ad99-1feb-473e-8beb-3f04afae4945',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','83766062-4feb-46a2-8377-2a973d5659a6',0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','854dc34a-e84e-4188-91f2-629badfd65c3',0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','6708ad99-1feb-473e-8beb-3f04afae4945',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','83766062-4feb-46a2-8377-2a973d5659a6',0),('e42139f0-c4bb-4c6d-acac-0583c703ada7','854dc34a-e84e-4188-91f2-629badfd65c3',0),('e42139f0-c4bb-4c6d-acac-0583c703ada7','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('e42139f0-c4bb-4c6d-acac-0583c703ada7','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('e42139f0-c4bb-4c6d-acac-0583c703ada7','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('e42139f0-c4bb-4c6d-acac-0583c703ada7','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('e42139f0-c4bb-4c6d-acac-0583c703ada7','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','6118e52a-b838-44cb-ba91-50119e2e797a',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','84eae812-3b90-4866-93ca-829ca379ff31',0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','baf692aa-26f3-41ce-940d-ff393180ced5',0),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','e13f538c-892e-48fd-9020-958c0f74907b',1),('ee8ef3c1-a83f-4611-b3de-f734dc36ec06','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','6118e52a-b838-44cb-ba91-50119e2e797a',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','84eae812-3b90-4866-93ca-829ca379ff31',0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','baf692aa-26f3-41ce-940d-ff393180ced5',0),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','e13f538c-892e-48fd-9020-958c0f74907b',1),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','6708ad99-1feb-473e-8beb-3f04afae4945',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','83766062-4feb-46a2-8377-2a973d5659a6',0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','854dc34a-e84e-4188-91f2-629badfd65c3',0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('ffc2d998-2443-4c0a-b81b-9bd85e48a4ab','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('854dc34a-e84e-4188-91f2-629badfd65c3','e5417518-134a-4ffe-9f4f-5572d97decb6'),('a9de6044-725b-4e1f-afbb-736b67ecb740','a658b49b-df7c-402c-9f20-21b502914a6a');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('13359226-7d4a-436f-96dc-a1bdffa597ef','rsa-enc-generated','24a97d78-9efc-42ed-8f27-1d9a9a73830a','rsa-enc-generated','org.keycloak.keys.KeyProvider','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL),('1536dd8b-72e8-4ae2-9ebb-e30dbb4f73db','hmac-generated-hs512','a0eed67d-7ba7-43be-975d-4b43b992cb82','hmac-generated','org.keycloak.keys.KeyProvider','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL),('16589b51-092a-4baf-9946-0d6c5fe61808','Allowed Client Scopes','24a97d78-9efc-42ed-8f27-1d9a9a73830a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('1e50ac91-8356-4089-89dc-668679ac77dd','Trusted Hosts','a0eed67d-7ba7-43be-975d-4b43b992cb82','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('21f5a43e-77f4-486d-98cc-eac129a387b7',NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL),('22e3b6f3-0d0b-481d-a5cb-bc6ff520e211','hmac-generated-hs512','24a97d78-9efc-42ed-8f27-1d9a9a73830a','hmac-generated','org.keycloak.keys.KeyProvider','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL),('25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','Allowed Protocol Mapper Types','a0eed67d-7ba7-43be-975d-4b43b992cb82','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('3250654a-69d4-4ea0-99a7-a5602186afa0','Consent Required','24a97d78-9efc-42ed-8f27-1d9a9a73830a','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('4a4852c6-0fe8-4ef2-8cbb-dc9246afb67e','Max Clients Limit','a0eed67d-7ba7-43be-975d-4b43b992cb82','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('4c13c48a-a672-4ac0-88cf-982eaa15e357','Trusted Hosts','24a97d78-9efc-42ed-8f27-1d9a9a73830a','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('507698ce-1ed3-4ffd-9821-bb38cb13ddea','Allowed Client Scopes','24a97d78-9efc-42ed-8f27-1d9a9a73830a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','authenticated'),('50dd7e4a-4201-4498-95d8-77a203113544','Allowed Protocol Mapper Types','a0eed67d-7ba7-43be-975d-4b43b992cb82','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','authenticated'),('556ce2f7-b148-49fa-abf3-4348cce59c2c','Max Clients Limit','24a97d78-9efc-42ed-8f27-1d9a9a73830a','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('5a453c67-da27-428a-9164-d9b908f0f93f','rsa-generated','24a97d78-9efc-42ed-8f27-1d9a9a73830a','rsa-generated','org.keycloak.keys.KeyProvider','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL),('5b78f4f8-74f2-4cbc-aeaf-46432a4ab009','Allowed Client Scopes','a0eed67d-7ba7-43be-975d-4b43b992cb82','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','authenticated'),('5cd2df91-de61-48a8-b7ba-0e120b5e4ade','Allowed Client Scopes','a0eed67d-7ba7-43be-975d-4b43b992cb82','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('5e6b9f78-757b-4bbd-9e14-83e205b76766','Consent Required','a0eed67d-7ba7-43be-975d-4b43b992cb82','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('7c12149b-9cbe-4591-a69d-9f83dab9d166','aes-generated','24a97d78-9efc-42ed-8f27-1d9a9a73830a','aes-generated','org.keycloak.keys.KeyProvider','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL),('8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','Allowed Protocol Mapper Types','24a97d78-9efc-42ed-8f27-1d9a9a73830a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','Allowed Protocol Mapper Types','24a97d78-9efc-42ed-8f27-1d9a9a73830a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','authenticated'),('b2f59f84-b692-4722-839f-ae22a7843ed2','Full Scope Disabled','a0eed67d-7ba7-43be-975d-4b43b992cb82','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','anonymous'),('ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','rsa-enc-generated','a0eed67d-7ba7-43be-975d-4b43b992cb82','rsa-enc-generated','org.keycloak.keys.KeyProvider','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL),('eb8430ee-fde3-440f-ba39-5eacd9797bfb','aes-generated','a0eed67d-7ba7-43be-975d-4b43b992cb82','aes-generated','org.keycloak.keys.KeyProvider','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL),('f557023e-8b1f-4b1b-92f5-8e8692a30742','Full Scope Disabled','24a97d78-9efc-42ed-8f27-1d9a9a73830a','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','anonymous'),('fdd0f588-57d8-45fc-93c6-34061b62a18c','rsa-generated','a0eed67d-7ba7-43be-975d-4b43b992cb82','rsa-generated','org.keycloak.keys.KeyProvider','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0458fce7-4f6d-456a-97a5-75ca5ff86420','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','oidc-full-name-mapper'),('0c3561c2-66d7-4b68-8713-9f38dd7f5795','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','saml-role-list-mapper'),('0ee2794e-089b-434c-b7e6-72e43803919c','22e3b6f3-0d0b-481d-a5cb-bc6ff520e211','algorithm','HS512'),('0f0a2c7b-1b11-4760-8ee1-23df5e289812','13359226-7d4a-436f-96dc-a1bdffa597ef','priority','100'),('0fe190b6-c473-4974-9dad-1b766d36819c','5cd2df91-de61-48a8-b7ba-0e120b5e4ade','allow-default-scopes','true'),('15d1d8b0-2bde-498a-92fa-35622cf10576','1536dd8b-72e8-4ae2-9ebb-e30dbb4f73db','kid','e38696c3-bb22-4aa6-b491-eab81b02e5be'),('17531bd6-a9de-4113-b818-8fe24801575b','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','saml-user-property-mapper'),('1a6817ce-acb8-4622-a2b4-1c6f06ca8c89','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','oidc-address-mapper'),('1b9c2bc6-fe1a-4305-9822-d774bbb08d8d','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('21b18155-aab5-468e-a829-2e7c6eec273e','7c12149b-9cbe-4591-a69d-9f83dab9d166','priority','100'),('2c324acc-bbcf-49e3-a1e8-cdd7b47d11ea','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','oidc-address-mapper'),('2f2d4d90-90e1-43fc-b875-3ee5c01b239e','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','saml-user-property-mapper'),('3583f0a5-e38c-4a5c-b10a-39101dab0b7b','5a453c67-da27-428a-9164-d9b908f0f93f','priority','100'),('3aeca668-8c51-4b87-9eb8-778687a8ffa8','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','saml-role-list-mapper'),('3b6a9dbe-4ce1-4315-b618-d2e63d8a4b25','ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','algorithm','RSA-OAEP'),('3bb2c05c-83c4-49c2-afaf-be9db241550d','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','oidc-full-name-mapper'),('3f22fdc0-80ea-4269-93c6-14f7bd44cf29','ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','privateKey','MIIEpAIBAAKCAQEAnm5D4b4p4KCENcET2h/vvEzyjnYFM4HFz7m8myXSnzJsnbVKwv1T/xNXu3UyVMXrGtMrF7AJNOAsNw7e5HHGLjHNqCZqKzf9bWyPoP9x3wHxebOdADt7863e7ZAH6jxqT6HD6jJYfbkr1e/bqOEGr7tNjQuWCt20CcaACy80fNaBnohMiyfxxLeuA1HWXwnw3T3eKqkoz2gmOIwyP/vbiOVObFwHAdHubG+XghAtrIf3M5qX9eHtM0oTCPrPaEfPFkq5d5MFHnA19w1P80UdHiwkiCDACB6ikGRVYlG3fs/50w0PI52T7xnuCY5fseSuNohZxsN4pUM/bsu/HgyPDQIDAQABAoIBABoPAexSBnpTfJuI1/aTNS/wKh9Di0R3Dm3F259bP8L+nL3t8U+UMmosqMwFEVO/QBXn8NkTE9iWHL+rmv7RNesoNu727pSQP4dtiUxOZ9Dp9WlyoRrGLfOdQCMsAxlEeaoCbgKJ6GM5f1vPeX5UEPD7qlxOMQ41fCT1eN8eExCLR4McG7YD3ahAiOjLLDA9EiJwKwQT6r5WNTPj7mxYEoTxX9NVH2njo2egyOYKdD6UvYhgrVAuCVlogJRC6wrLdE2zc/Phn5IVQbu+TTkvsetcMi0JoxIcnuFbTtFECu9OuEbHx2agqZxqoMV+9lzbo2oVJUicFh7h79nrObzeQ1ECgYEAytu6Zze5QnE+fYChBP6jvY2ANfsrYP3HALDXd7AtcKnyUd+FgANgF03bTc4iLBv37s44EiI+pJRBVp6crwfWZZjlEDE1Zq7nwyUDbFB2C0JWYkbatHEYbyrvkkZLL/+eAym0/+Xg1ATcmynOz62S4fGvKbNTCRZngbpGVzuuqbUCgYEAx+8XyFNiDuyKpyPG2GV8t6CrZS8yMUHnK0BQXu6x1swACr878M5sZRVWIv8ZHYEaP32LVJxartZZO5iJDpuKvOFHRWEqFc3U5nQKRRz2cVbi9lemP7+MBnznT21qeKVCw4fGFVW+7cu3eJuejhv/PZ3bfp50rmv7Xm2wRMT6RvkCgYALEaJCL5A0R+mY/4PJuftFRItSZrofOLm7F+sp5LsWAq/uN7wZGBYOL3lf7Xd/4KbOqQH2O1gfstc92rnB8zOHp6gYEhdP2wtaYpKlPl6yjpQYGLWmUuV6a2VXHe7MV65Pjd8Kd4ilCP7gmI9oVZhGK+Ha7KYDQO207m0YJXGKYQKBgQCJgFXK4A3AVc3FxUUr7iAn6cf2fs72MWzawhCEOYT1RLeCrKJ8qnrByjrDNs3/DJsQrzbzqdR0Cda0teMMuMxhuk1Z2ckn1bdmBshJX/HdYPQWl5Eupn2WuLAcYBOphX61GtuQMLhusnwr5lrVQUv5BGfAXRnCG2F1P9rKcO3vgQKBgQDH7GeTdznlovuhWLr6L8S4hu1NbDqecKC0ryL9TSQnNnQy7ixGxWMzXYVzaJ1c0BdS+hl38rUK2TAndZPtMK8e1txu2jCTC/pJl0C9Ybne7N25XV+Hkx4r/FIssb7FN86UXkMuQAoBbEygyUl8clWWfSDv7d+fdglpIA4bYCPjpg=='),('4423ff0a-da5d-4603-b3a3-63fbc3ddf9eb','13359226-7d4a-436f-96dc-a1bdffa597ef','privateKey','MIIEowIBAAKCAQEAuWQNry1Nm6yq5BmMmPBlAM+ei6Fckm2iaDiHfWbDf9nOyg23H0WeorflNFUN7MVLt8kdhprdxYVdHJVVWMZYBkkbTHYV3Syf+va3CYUCWF4ExbtQcpx88rTVp5GmJ+v+ZyPIM3Eyc5uthpy8M2m93BfFL7BNJqwYFFN2bRW8egiS0DuKfQNHoqr3JuCWNX4E0q4+VFnaUOojHWgOa0PWklDHp+jfBqXHp0DHonNtAw65u4kfqYetdUuctTF9ACUbpIYCRIllwGy+C3GjAtBH+REvjVjJDCRiQJEVC5tMqe2QG7I5MNPe3WYqBzKuPMa/qQ0inB+XKhOXFFkGggV3VwIDAQABAoIBAAgqUnn5NlZZdAto3qrrx58SBesjd8bRQlpxxvHsgUbTyopWsU6Uy+hhzhwQdPUNOYkGOCEyF/t3pMK6BxDKZ50bQjMLbmoX6ZHtpOEr9Q78URx+ZAwwPUaZVWG0hgtzFvjm+A3f+fdij3GC3L0s9ppHh71SeAtwf/0BMhGa5/q967EMpNVXnj7F/z/1F6R+1S4VPWASACaUTi+v+ZpJUNYUvfo1tfX/gK4fZHgmUbZP/ESuuV7s4iI8+/dcZJZJu7oOjghJapOShRwERuuAxWxgsG5xyKdGRBDZFOIF4fGtE7h8Wg7aRpzewur/OicqTaP0RcsCG4LJIGP2iP/Sr1ECgYEA6WEqzvWRbQx4ImGfRcpH4bwoiJzx5VNM0EBt9Ay79Ddm6Tqi8L/9rIfZfrmLjTG9tMsdhT3jbt28SYSsjh9Ftn+KdzZX0Em9GCo4smyLK+6N9AlSvrwvVhLtZNtkVt+0RqtutNdichFpfn0vDbB1ifpIwJjcWfuJFcIhawE7pgcCgYEAy1wlGNSyaVdAnsNcwSJmdPSEbXO0CEX9CiOabS5spViwe2j/2f36v38A4rE6Xfc2oJKtURsiT26emwqHVRN8SL0DsdOTMqpWuK20T7mjypE4h3c7u400NUaA5tsMyqM+QzmJT6Zwion4Km4FHx3QoNcVd36ujPd/W+5Q4xZj0DECgYAmwwm+KBFIYGrPoxE2ITvBJWRCFHck1KoMaLcacscA7/a6xA9uFyVF86ZPIvgnslxE2/uCNt5AermcKFoUnOMSRaq01CTPpn+utMyH7flLiaqwHqBMp6rhC/G776iBuVQS7MRNavyh33x7EsWu62EKUrSksH7gvyNsprqwMBs9HwKBgE4tLC2xhqysWDEwVTYB7XVEkqwo8KrFjRMawMD8OdQOljm7EbBRzNVVE5gSHagF40AzYuFtFvGGSv67O29fQEYOM59nAI1XomL4k/qaGPdEgIDDO3lMPSfF5MParb4wpzzcn4a5K0Z256oYBWwC4DMUvDHlx2B1vMYwhXPnJZPhAoGBAI4Nmtpg+AluZYMAlRaEBSH7sCp0xsViuJOLqjhnT31YtcOe3OzbaF1aYZvFV9D7QJSsEXk0XZNbCzsT08Pv7rJzyDNAaefnllNSYxSI28m3aioH9L8mNetEAjrySaXNb7VW7NGwbTP9ZYvsT9Zte6unFKO4io7fEo7DGNPicDaT'),('4ae7b4d8-677b-49ee-925b-52bb55b46375','1e50ac91-8356-4089-89dc-668679ac77dd','host-sending-registration-request-must-match','true'),('4b48314a-0267-4ff8-b66f-f4236c2809f8','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('4dd661c6-301c-44c7-93a0-94e80d82de2e','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4f63a1a4-89fa-4fad-a758-b7d9d67f0fca','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('53661e80-b605-44f9-a651-a4feebe68307','22e3b6f3-0d0b-481d-a5cb-bc6ff520e211','kid','c583495d-cb3c-4806-a715-8ffa65f8099d'),('548ca1ba-3121-42fa-8818-129f58fd7f54','7c12149b-9cbe-4591-a69d-9f83dab9d166','kid','5f3bd2e6-ee80-4d2f-bc51-1e7e125b2725'),('5546e910-1e1d-4b59-82d4-5090829328ea','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('575955cb-a671-451f-82b5-d8b0dfc0eb4e','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','oidc-address-mapper'),('5f331ebd-b9a8-45e2-9624-b1976f718939','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','saml-role-list-mapper'),('6377d4b7-b57d-4435-8ed6-2713dfef3705','507698ce-1ed3-4ffd-9821-bb38cb13ddea','allow-default-scopes','true'),('6a7cd182-c4be-421a-9913-a721f477f8b6','5a453c67-da27-428a-9164-d9b908f0f93f','privateKey','MIIEpAIBAAKCAQEAyPjGIYSDi0TqI7cqJcFBafw2so8fYSt9fc9jKAP1qzrhOPAF8Ai5AwAajPjAjSipL/emXBw3pLjZezxCGNXvQw7W/O0fYVxkqlEtDL5cmxaqQE+NEHYFyAar2aHReO48+m3uvN5g3AmukHzxLbBHAhMKOh1l0WpAfb0d/rZp2BiJfzy5d7m8Fgp4gxehkYM1FY+IjZAbTtjCLg7wHEkORamcdr2Ic6uWJYXGVdrCNUaegYIlszHfNDnO9p5OYxOcaYMQcYWNvgZUwL1hj5nUoY7/aMF5+gglU9t+5eB81haUEiZrTAlrOeXgAVATTk7zP6xHB9fj8IPPByDOheaXswIDAQABAoIBAAh1Yq7By2DkNfqU2KLy1FRSoja3trlklt6MXlRZKPuGTzkR7nNg2ptEDi9av41GuyriqyTQpzg5SNCwA5QqBOz3Re3VSRnURVm0cEdLXSMbPBqC0/bFEOSPVfz4m5QRwDfwwo3pH33YsSPcWQZJl2OAoPs7MNrfNExWgQRZxxtU3J5i2eT6K4N/T6/XmQ+o5R8KNeXlsHqIiXjHoIbae8j8HgmXvY2+H52yCMP6OL2OGXUWLYTF8tGWXyU87mDesJN9dY1B0pAqyOAjFZ3ga0BLVXZjhERetA/xjV47j3nX6G3q7Jheg0YO4EJ4nQDKiGhSxKyBZuUb2Qk1hwTObRkCgYEA52/fYlu7xIz2xYfmYklaogb0IrHE5+SvtOkQVLRPSVmsZbiUXywPxIAx3r5blUS5aQH46M6n8ODvC90voQtCsp9rSwd9llay8FUYTXnc6t81Sd9t3YXSCaUMOdDPDEKcUkd0djm3M6HQjGXx2O7WqpoKj0E3Dx4sCLWxdEyKkCUCgYEA3k0pxiApmpIwRHYrcKnkIdXWrZcnI+z9VodgD0fkvCd9Oiw5BKMOX+itm9umtSyNbKQLTQPlYugMW1/WOffYNCzWzO1aXf19jgmUZUQbyJ8u4nN8wf2SiZJCkolVls6fokyQnznw3K4wZcPwDMQOhjFy2WjSUtc5Seq8NWjWNPcCgYEA5v0PVVn9RCT1Px1uYXaZENIj5GTNBC2I+OUMuZ3k7G6l1DivTXXqntLb81bGjWq0Kwwe5C0uDQpTS+IM4Y0dmq3mJlJplB0gJyKnSNxyE7GHvB1VyB0CD0I9u46et7vbzXsnz7+3C79bKGWvRjbK5icsluIeE+anSGIfpNWoDkkCgYEAkfDUmPaqeYi52Wg+8pMGa1QowQP3tTUzyGfNn5qSRxghtVws/qdRm5N0zlqwokaifg1gQepp4Ln4ytArIxlcPjyltBmq9wOhNuuBGc5R8y7WJ+Krp+uiFWEJBYzVvNDfqjxbwbzXLPnKWjT9VlQsONsjzClt0ubq/GT3tJSj9FcCgYA8turBlznVGbXR8QqcYTdSpj1XpI7MeoLkX4VZsUrOZ35EoekIPnw395c3XwqCXRgx4z1p75G+ioLGVesZs5D3w2KDvJIdG4gAIWEzt1+s5eW2x62pTSZWVh2bzCHLH0sIdcYZVNpHyDxWnNhPpO1BxXOtlrIT/CSVLTMB/NaK+g=='),('6f18429c-db9f-4704-b819-eea0d2ecfbdf','fdd0f588-57d8-45fc-93c6-34061b62a18c','privateKey','MIIEpQIBAAKCAQEAoqzIv4LxbltpRtYOWd/LjIIvnhHWKDJud7hmT08IXgpl6nsUNaA6r4972FFEVeQpYj+ssmTXSRKFs5uHIWia2fNOuAt8fCekbXo/ZXE6aBW3ocHOLaXLyYGT1vzc4Md4N29Nk9gnOTR6YuDfETFP+LqWLuaXlL4H7iTf4qrk//auG8iQIbG7cOyLcEIFR+v6BJH11ZZ8futbMzTaw//5UMHFFoQ8bpJ0pM/XgkAtw4zGmAcA3naYPaDCmRHHvjlE+UbUcbY2RSBXZ90tYMOO9OLP8rH8Aq1dsBZ34wIM5C1rI5zHu4/C5aHSeG4E8Cv1ui9m6SyX/e75GfEBXle1UQIDAQABAoIBADhB6eD1P1praYKSV380Wpf6k84mG/plyndDwboOunWPQgSv0OLkyTbat7ktDaVolPlBzQ8auasvKSbelAJ1Qww5zRDwA/qJ2R71RoRl/o1taUabGBsIOewzkDWq2BYyVXxSVTFacOIjKGoWm34+IAqEOJj6rRRHDcYJYZXphO2RzCIEQgyOFE4fKirkJBR8D2dGpsrKwLPnwFjhdBHCmTjSXm81wsRDTE5r/m9nuqv522CPhNRObeBm9pP90xTIhErZYb2IdRCFN5ntAIEEyPhlRyc2xZd7NPuuUO6rM7xKlIrHCUS7ytr8Iis3Vqetpiu3zrFyXopu8SEHrI+gPPsCgYEA0EfmyMREocYDQRBaIPh8+NRYckbBmaibmoie/GFSik5f/41itH2yCLUk6woiIhhOBIKMR8L6FnBvXjdnOumAWVv3D8RhNE1GL8yfkhXT6r8MXuvjqWk3uvk/xn5UrDM/3+OyAntAWqIAKUMbs6lN0k45Hfei0pqvNlRUQv5fdKsCgYEAx/IAd5J3i1Q0PI3oXdbsbvT7EVA0cYn03lwkfPHtSo4Rj8CwmhYdvhKIVXKqYzXE5VqljkLRp2B9YXqp4JKDslDDF1ptwR328d4uM2TD09cRcnMq0jt5dZ0fKtP+3MH1HoeENahwnquGW9Z/j9XITQGpxyXENmjf0CVQJO0d5fMCgYEAiZTlWvtjBqXBYopFrv/VtZy3LA2XN0RMPSFAPCChoGCzQyEG8YkSQHRABc50y6bYalw+A+1Eu+vbdRYN57l0ohKAufaT6zOcSFjXk209xhQbPNx/T1oEiUq6GQk8L1/PMrq6zK7TzMq0Zo1A0EXm9SPc0PHSqWGqma3M11Amh+8CgYEAnz8imhmAtuqw1A3eJWc5VkIt+SMdMdTDv5o5wX3aFYhDem/o+EBnHeyawxuZk3zOvjFNLJoRazLRiaLtzBxFYe8rAt2WDrpz5T2lJG+7/GwNzE7nqxuNaFxk53KDSYX9WXxrk2T9lZJdZ6XWYVPOvW52r1NoDEHJCHm/dDmal3sCgYEAlBhl6Da6pSS0H/TcMxH+1sti3x51DOcPWQ4ACoAzQJgd5SmkV2iqTlSgtO3t/O3L6B7wSnZ6kxS5PvbO24/aKylwgjxDyghp1S3nSWYfx83uzEtDj5l1o5JoPh6vZMqZjB1cQyvX4ULkqslYiKYk5duloF1fJJivl/lpBpYiKrE='),('7489fe63-937a-4340-bcc4-3a8e9e9f3d8a','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','saml-role-list-mapper'),('7af7fc77-27c6-4643-b2c2-5b15cfbbe85d','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('7b2b707d-5d00-4e26-807b-ab2c4ded8652','22e3b6f3-0d0b-481d-a5cb-bc6ff520e211','priority','100'),('7fee57ba-8954-4a4e-9fd8-bcef71421177','1e50ac91-8356-4089-89dc-668679ac77dd','client-uris-must-match','true'),('837d8b33-8aa6-4b9b-b76a-7b6c91e5a618','21f5a43e-77f4-486d-98cc-eac129a387b7','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('847bca5f-6d03-4b0d-b3db-de7d7a36ee48','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('86a959d6-c206-4249-8418-7cfa89d3ef4b','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('876db3bd-3802-43a7-8669-9cc2bcc6441b','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('8c6543b4-6628-43d3-b2e1-ff5fdbefa1d2','ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','keyUse','ENC'),('916ec4f2-6fb5-4e07-b018-d7b005d7c1f8','eb8430ee-fde3-440f-ba39-5eacd9797bfb','kid','6a4e8c60-aa92-444d-9b25-28da47ca3a9b'),('96855ab3-bea6-4265-8ea1-dd23991967fe','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9a3e053d-1a4a-4b94-94af-300a5c373a06','4a4852c6-0fe8-4ef2-8cbb-dc9246afb67e','max-clients','200'),('a2376315-4a4e-4997-b363-b48abc4a5992','13359226-7d4a-436f-96dc-a1bdffa597ef','certificate','MIICqTCCAZECBgGTB3gK8TANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1maXRmZWVkLXJlYWxtMB4XDTI0MTEwNzE2MzAyN1oXDTM0MTEwNzE2MzIwN1owGDEWMBQGA1UEAwwNZml0ZmVlZC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALlkDa8tTZusquQZjJjwZQDPnouhXJJtomg4h31mw3/ZzsoNtx9FnqK35TRVDezFS7fJHYaa3cWFXRyVVVjGWAZJG0x2Fd0sn/r2twmFAlheBMW7UHKcfPK01aeRpifr/mcjyDNxMnObrYacvDNpvdwXxS+wTSasGBRTdm0VvHoIktA7in0DR6Kq9ybgljV+BNKuPlRZ2lDqIx1oDmtD1pJQx6fo3walx6dAx6JzbQMOubuJH6mHrXVLnLUxfQAlG6SGAkSJZcBsvgtxowLQR/kRL41YyQwkYkCRFQubTKntkBuyOTDT3t1mKgcyrjzGv6kNIpwflyoTlxRZBoIFd1cCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAoUBG+yqMtHjTfk7duYRYKgWKlYLJdDCnqDUQZwSoXl7VII+Cj2h5eVhOLUUdO+xZ/TJVeehx1BqIVU3joHJZbFbShQ8FY4zFsWaj1lAwxQbFAMlss3e7ELL+NkD11rINIlTo2wOOnRL7quNZqoDGrOz2TJYD7YxLsyqsVCX4hkV5lmw3pOQbEtWiCsInVGIDj5beY2cP06U8HJhs+8t7qyj5x2KaTr2KRKjz60ruRruao2JlmWXGwn4RmCsi5evoWd3/hOcJ8yl7FKLIYxW03BqlWO9u5Wq/4W2SQg1p3XDL54Ap7IqAB0b2xa1nY40B8+kMdgoIe0Jy5PHJ2g1ulA=='),('a348e18d-5ac3-464f-a3e9-f632f55d286d','22e3b6f3-0d0b-481d-a5cb-bc6ff520e211','secret','tRH0h3uD88fyRXcLTjEs4lL1IFmrkYN1zMrh45jiI_YkKgI_ZGwCRGytF-AjLY4q1oTKQl4Sgy5EinGf-BkpIVRkxRoJIeOklAcGhlNWVynZGze8oYkxtPHrQglhWL41Xz3Lr1u6SXypcI8arMB2pcs5OiPJ-rB8JtOp3KArrDQ'),('a5f016af-5371-4844-8bd7-44e7b773cb81','5b78f4f8-74f2-4cbc-aeaf-46432a4ab009','allow-default-scopes','true'),('ab19d474-c53b-48f9-a389-357857676ef9','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','saml-user-property-mapper'),('aede3649-fec6-44d6-aabf-13df7453ffd5','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b35af7ca-12ee-479c-8a5e-2d021d1e81f4','7c12149b-9cbe-4591-a69d-9f83dab9d166','secret','GPFao8P63LB7MFyXF8woMw'),('b426dc26-9098-46ef-b90f-2c8911e33a6a','fdd0f588-57d8-45fc-93c6-34061b62a18c','priority','100'),('b4b29fd5-5950-4161-ad1b-6b758b99a309','4c13c48a-a672-4ac0-88cf-982eaa15e357','host-sending-registration-request-must-match','true'),('b53cd461-e86c-4e4f-8e34-90174e90813c','eb8430ee-fde3-440f-ba39-5eacd9797bfb','priority','100'),('b55475d7-dfa7-42f5-8459-96684be15ad8','1536dd8b-72e8-4ae2-9ebb-e30dbb4f73db','algorithm','HS512'),('bf0679bf-d1dc-44d0-b4ac-d36c443d26b5','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c0a4e707-8f0d-4319-aaa7-988d134c1041','5a453c67-da27-428a-9164-d9b908f0f93f','certificate','MIICqTCCAZECBgGTB3gL7DANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1maXRmZWVkLXJlYWxtMB4XDTI0MTEwNzE2MzAyOFoXDTM0MTEwNzE2MzIwOFowGDEWMBQGA1UEAwwNZml0ZmVlZC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMj4xiGEg4tE6iO3KiXBQWn8NrKPH2ErfX3PYygD9as64TjwBfAIuQMAGoz4wI0oqS/3plwcN6S42Xs8QhjV70MO1vztH2FcZKpRLQy+XJsWqkBPjRB2BcgGq9mh0XjuPPpt7rzeYNwJrpB88S2wRwITCjodZdFqQH29Hf62adgYiX88uXe5vBYKeIMXoZGDNRWPiI2QG07Ywi4O8BxJDkWpnHa9iHOrliWFxlXawjVGnoGCJbMx3zQ5zvaeTmMTnGmDEHGFjb4GVMC9YY+Z1KGO/2jBefoIJVPbfuXgfNYWlBIma0wJaznl4AFQE05O8z+sRwfX4/CDzwcgzoXml7MCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAUW5ZJFCM37aAFDbl1wVLbxk/hQ9I1ZaQhsGeMBVYcPeRyTwuUEZ+bn5V3MA3VXzfhu9xHnz+jrAgvfkxyi7MxlBaFhnXtRf+dfDCEJSKq56H7uDo/6TzTDk+0GWbbmDXfD3CLGGbYiDbhDr5LUZ0YuPfByTGyWoET/9Uf5vUeFLWKXLl2eyQGAqmIvECqFiQJAh2AErosR/RS+Z2iwctb6+9QVddiSmtisM52/FTwLup3AucxhRmNUJUyegPat9bu9Ef0USylDwD25/kOv+TzJBiQPDq8AsADfN9CWRvWjZEyro+XP/BGBZCWZ/w0UlGvw10u8tJ7vSWC0Z1EUINmw=='),('c195877f-b385-4fef-a304-a58c4cb40609','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c3d96a74-df95-443f-85dc-d84fce1c4771','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c92da9e1-dcd1-4988-8a84-a18d22b57eb4','ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','priority','100'),('cb74f845-a227-4f5f-8fbb-37c14cb4f585','eb8430ee-fde3-440f-ba39-5eacd9797bfb','secret','DaFV-4Zf751CIN3KsjhAwQ'),('cc371fa0-60e8-4164-9dc5-09e57b979a3f','50dd7e4a-4201-4498-95d8-77a203113544','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e1a72b00-c2c7-40bd-b031-ddc67dd25d0d','ddfcb67e-ab2f-4eb4-a2c7-4ff096faa0eb','certificate','MIICmzCCAYMCBgGTHFKMajANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMTExMTc0MTMyWhcNMzQxMTExMTc0MzEyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCebkPhvingoIQ1wRPaH++8TPKOdgUzgcXPubybJdKfMmydtUrC/VP/E1e7dTJUxesa0ysXsAk04Cw3Dt7kccYuMc2oJmorN/1tbI+g/3HfAfF5s50AO3vzrd7tkAfqPGpPocPqMlh9uSvV79uo4Qavu02NC5YK3bQJxoALLzR81oGeiEyLJ/HEt64DUdZfCfDdPd4qqSjPaCY4jDI/+9uI5U5sXAcB0e5sb5eCEC2sh/czmpf14e0zShMI+s9oR88WSrl3kwUecDX3DU/zRR0eLCSIIMAIHqKQZFViUbd+z/nTDQ8jnZPvGe4Jjl+x5K42iFnGw3ilQz9uy78eDI8NAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAF4Q4N/MPBFP8hCRjgOMiLbJmO9RzAjlJmJueH5ewkRUYP/uV/srT5XbdDC5/m8cNm2x1jLUxx0XAAbKI079VBeD32skzpetGeyFQ0eXOReM3qOn1zoqrT1tQHBJgRRblxLdlIpjmOPFflCpIwgo3NPqv2D44z7NlcEx0Hx2CBLkZ88A8v9//bjeBLIHY/EHEw6/eGAKctAa+9v9SoqUIx9tbS2GoAgnlxrzPV7nkdxMbVu95SD2MyNCbFHOq/iX58Aj2Z1n08k/dRUrWUIecM7xAboJr897Y3OypwBcoWcRpd18Xh2EYpFRp8iUQtcCB1z8jBQ9ywEePskW98UQXkI='),('e2f89bbe-13e4-48c4-a92d-7501a053ce5e','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','saml-user-property-mapper'),('e3796b0c-8474-4e4a-a56e-14e0d147e65a','fdd0f588-57d8-45fc-93c6-34061b62a18c','certificate','MIICmzCCAYMCBgGTHFKK/TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMTExMTc0MTMxWhcNMzQxMTExMTc0MzExWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCirMi/gvFuW2lG1g5Z38uMgi+eEdYoMm53uGZPTwheCmXqexQ1oDqvj3vYUURV5CliP6yyZNdJEoWzm4chaJrZ8064C3x8J6Rtej9lcTpoFbehwc4tpcvJgZPW/Nzgx3g3b02T2Cc5NHpi4N8RMU/4upYu5peUvgfuJN/iquT/9q4byJAhsbtw7ItwQgVH6/oEkfXVlnx+61szNNrD//lQwcUWhDxuknSkz9eCQC3DjMaYBwDedpg9oMKZEce+OUT5RtRxtjZFIFdn3S1gw4704s/ysfwCrV2wFnfjAgzkLWsjnMe7j8LlodJ4bgTwK/W6L2bpLJf97vkZ8QFeV7VRAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGcJEi40J0K8fvTK9Sd89TiW8pNjH7cHW0Ruk/kynJYL1NkxveRa9M/fEzdITjU1Xavqt7eeAzeGz8D8wUrd64GeA8hVwBqnufCQ9v2XTn/lhhJ14RqauwvbLoki5Jlas/hjMh0GyZiXzQd42DU/N+CZQkW3tjx2n2qI7ZSvuLY2dtZwEXAeARfD5qXAulX7po1OLf0NQlrvK4JFusEL7NOO9hW23vDYGa0Kd+8/Fw5KrhKBQf3Gh7ikidD/9YWbIJeaXDsY7MG83QyJiBkvTR42rdmZoHYKQyEJaZcNQxpEkBc4mlr3hTojo9m98ZzscHliXjybqQ6UyCd0yzjuvSQ='),('e45b7c2b-357d-4d8e-9886-d534377c47c8','16589b51-092a-4baf-9946-0d6c5fe61808','allow-default-scopes','true'),('e5b83cbd-0a6b-4fdc-8732-f04884c9f2f2','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e699ea9b-4e5b-41df-ba88-82dbc5085d8d','4c13c48a-a672-4ac0-88cf-982eaa15e357','client-uris-must-match','true'),('eca2b14a-e4f3-4bce-bece-46744aeda5f5','8a1fb7d2-bf3d-41b0-8c17-fee9aa93cf94','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('edc8c257-290a-4539-87d8-dc864ce17e80','8a605fb7-f2e7-454c-b7a7-0bcbd785b05b','allowed-protocol-mapper-types','oidc-address-mapper'),('eec5c034-7b1a-4c30-a63d-f28af84631de','556ce2f7-b148-49fa-abf3-4348cce59c2c','max-clients','200'),('f2236bbb-2d67-4dca-8ec9-7d6319b02a8f','1536dd8b-72e8-4ae2-9ebb-e30dbb4f73db','secret','yPOUuKNGl5o-PB0Q5k0K8j8DZEEF6x_glBMmdPWwG-mBUDgrsvMg54heeshovU4HDv9hPIfZi5w8LBijx7DOAyR-NyfSAZsNttNy_kXIv4WAJXmlQw-PIlfUVaF6drSylh1Oxm_GR6Fiu7q5UdjRF2GZHgiiOW7oJ2ijPj9b-xo'),('f44df020-88b4-4bc8-8d0c-66d08753f181','fdd0f588-57d8-45fc-93c6-34061b62a18c','keyUse','SIG'),('fa351701-2af5-4e32-9551-52f03f9783ff','25cf9bd1-ee01-4003-ab1a-3e08fb5718cf','allowed-protocol-mapper-types','oidc-full-name-mapper'),('fc11d60e-7981-4bbf-a3da-a3663dfa845e','1536dd8b-72e8-4ae2-9ebb-e30dbb4f73db','priority','100'),('febec230-7d7a-44f0-95d2-89d6c1460863','13359226-7d4a-436f-96dc-a1bdffa597ef','algorithm','RSA-OAEP');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('25bd9b8c-68ec-43bc-86a0-7c4b827ff481','d0960562-de31-4fac-82b6-d36348e9fbc7'),('326d571c-5ce4-4fd1-9985-0f356c2f4aef','54623a3d-53a6-44d2-ad4e-623ac6ca4ef6'),('5e71d94f-b703-4ace-aa28-bdd18cd52196','251f4ddc-8ffc-4a7a-810d-2ddae174b413'),('5e71d94f-b703-4ace-aa28-bdd18cd52196','55666832-9718-41f6-ac50-8cfba9bb1ead'),('6afce683-7eda-4163-9b58-db80097747d7','ab61b2ec-e759-442d-8fc4-87112e6ac610'),('6fe53978-ec2c-4c12-bbcc-3bef2e59b640','97ca4a4d-f9ed-435f-88cd-468ae9fc3554'),('7109137c-a263-4ce9-bb21-737357002250','77d2837a-160d-4dd5-b4f8-c959af3ec78e'),('72211f3b-a0f6-4f90-8ced-5465b3d931fc','1f76a016-80d8-47a3-8829-12b9f3344c63'),('72211f3b-a0f6-4f90-8ced-5465b3d931fc','326d571c-5ce4-4fd1-9985-0f356c2f4aef'),('72211f3b-a0f6-4f90-8ced-5465b3d931fc','8d5518a9-ab23-43f8-a369-ae8926524a04'),('72211f3b-a0f6-4f90-8ced-5465b3d931fc','e5417518-134a-4ffe-9f4f-5572d97decb6'),('8ea078a7-0655-48ed-abad-dc1e8b3e9787','130527a7-b447-4d16-a124-69a4dec570e8'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','1061cb68-d47e-491f-8c9f-0baf7b8f0297'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','1081f51c-1a8c-42eb-9f5a-f3f874d52312'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','1f5af355-3c42-4eac-b07b-8859d1457345'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','251f4ddc-8ffc-4a7a-810d-2ddae174b413'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','3013b4d7-b20b-4800-8e94-1e2703b9e688'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','440d73ab-cb88-4192-bb31-ca4824bfac96'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','45ba60de-a4b2-4a5b-9eb3-45355fff1372'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','4cc428bf-23f5-4c88-a2df-5a96287ea57d'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','4f78392b-d85b-4c88-bb9f-5259555dc80b'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','55666832-9718-41f6-ac50-8cfba9bb1ead'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','5e71d94f-b703-4ace-aa28-bdd18cd52196'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','6afce683-7eda-4163-9b58-db80097747d7'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','6fe53978-ec2c-4c12-bbcc-3bef2e59b640'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','70c5c762-e26a-42b6-849c-db0a3699eca9'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','7404f152-e82f-485d-b287-eb89b3775b19'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','788316e0-10b8-456f-90ca-f66cec42494d'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','80118c44-da06-452b-a3cb-cb059f4434d2'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','8644f7cd-dd54-4249-a1b5-cb8125098a59'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','8a4746fb-c8ce-491e-b040-5a643a662d42'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','97ca4a4d-f9ed-435f-88cd-468ae9fc3554'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','a05faa8d-8521-463a-8309-1a1a7ce33988'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','a3ece604-a6d8-4afd-9c2e-cd1454a0ad12'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','a70276a9-59a1-42d8-a1b1-d39c0a1b7bf2'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','ab61b2ec-e759-442d-8fc4-87112e6ac610'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','aec6db83-6349-4979-89da-4b1e8b5570ce'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','b40ebb8b-9b6b-4c0b-84dd-22e8d45cac25'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','b5814c33-9cd2-4f7f-8ae7-5658d842bb00'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','ba1f553d-ad98-451e-b95b-f24220aec622'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','c5d16420-ddb0-4fc2-9cb8-eb28b5c6dff3'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','cbd71cc4-c03f-4db6-a614-fca9dfeb2f87'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','e56c78cb-af45-4b14-b624-9936c9b684c8'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','e60de20d-9f5d-43cb-a918-5d87273ce839'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','ea21d75b-7407-4858-b244-bed516088c8a'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','eb084e1d-369b-4ac8-afec-7cf9c996ef83'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','eca3f9db-1cb6-47ed-a99b-4e3948a46680'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','f2a66ada-4d33-41b8-ad9a-4242b7ccca16'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','fad6b668-56cc-45ab-8153-1c5d41ffa060'),('aa18e38d-c2b2-4651-8ccd-418c0820e07d','7ba3e814-2610-4fef-a693-39c5f8bb27d3'),('aa18e38d-c2b2-4651-8ccd-418c0820e07d','9c3505a7-7e0f-4c73-8c58-323a9a9f2e1f'),('aec6db83-6349-4979-89da-4b1e8b5570ce','1061cb68-d47e-491f-8c9f-0baf7b8f0297'),('aec6db83-6349-4979-89da-4b1e8b5570ce','1f5af355-3c42-4eac-b07b-8859d1457345'),('b121d12d-4545-42af-b20b-a163a50b4309','1ddfaff0-4bb9-4a26-8f95-e49f1615ffb1'),('b121d12d-4545-42af-b20b-a163a50b4309','a37505b5-5477-40c7-b1c8-9d60e08b33be'),('b121d12d-4545-42af-b20b-a163a50b4309','a658b49b-df7c-402c-9f20-21b502914a6a'),('b121d12d-4545-42af-b20b-a163a50b4309','b6e225dd-5892-419e-904c-f42854650075'),('b6e225dd-5892-419e-904c-f42854650075','653cdd29-754b-40f7-ad67-e8e72f06fab3'),('df97a685-6267-427a-a267-b813d8903459','25bd9b8c-68ec-43bc-86a0-7c4b827ff481'),('df97a685-6267-427a-a267-b813d8903459','39a4ea07-58c6-4302-8c9a-9a959526bee2'),('df97a685-6267-427a-a267-b813d8903459','49b7e36e-eb1e-4cf6-9686-f6905f26d1de'),('df97a685-6267-427a-a267-b813d8903459','5acdab5c-c2dd-46e0-8a07-9349bd3e4d02'),('df97a685-6267-427a-a267-b813d8903459','786a09bf-a7a0-430c-931a-ee6ede526e4a'),('df97a685-6267-427a-a267-b813d8903459','78911c5e-7e26-49d2-b258-06271ec5f4b7'),('df97a685-6267-427a-a267-b813d8903459','7b131e96-0032-4c5e-9d2f-caef233a2e5e'),('df97a685-6267-427a-a267-b813d8903459','7ba3e814-2610-4fef-a693-39c5f8bb27d3'),('df97a685-6267-427a-a267-b813d8903459','95236488-96c2-4c5d-8d8b-96b591c0467d'),('df97a685-6267-427a-a267-b813d8903459','9bd5bddc-24bf-4732-b576-5d27c0a1dde6'),('df97a685-6267-427a-a267-b813d8903459','9c3505a7-7e0f-4c73-8c58-323a9a9f2e1f'),('df97a685-6267-427a-a267-b813d8903459','aa18e38d-c2b2-4651-8ccd-418c0820e07d'),('df97a685-6267-427a-a267-b813d8903459','b565c59c-7653-4beb-9813-94c73828b293'),('df97a685-6267-427a-a267-b813d8903459','d0960562-de31-4fac-82b6-d36348e9fbc7'),('df97a685-6267-427a-a267-b813d8903459','d948446c-6e6c-4d3e-837c-d6fb9d9af9b9'),('df97a685-6267-427a-a267-b813d8903459','e0310a5a-eada-45ae-bf0a-e03334e5b0dd'),('df97a685-6267-427a-a267-b813d8903459','eacea43b-8241-4a45-814d-ed7ba350f0e2'),('df97a685-6267-427a-a267-b813d8903459','fad5af3f-9360-4c9e-9b92-0e054e72445b');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('3a9b5734-9b10-488c-8cd7-db9a0cba094f',NULL,'password','0696976c-46ae-46af-8aac-5e87c176905a',1731346995805,NULL,'{\"value\":\"01Sdjqd77LnPI7he8DXY7UdE2ty/ha+U6Wt9h2wVDuQ=\",\"salt\":\"YYLFC164SxipZAcUr1qSww==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),('68509508-6b39-4c14-8571-3b59796477ea',NULL,'password','46b45616-8f1f-4a3b-9118-b9dd4f732431',1730997338934,'My password','{\"value\":\"IWqz3MW0XFGXDCLhY1HeyFVUmAnrl1VbdFWBEQ1oEg4=\",\"salt\":\"izT9CnPIwYKh8FvtcI4rNQ==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-11-11 17:42:58',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-11-11 17:42:58',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-11-11 17:42:58',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-11-11 17:42:58',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-11-11 17:42:59',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-11-11 17:42:59',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-11-11 17:43:00',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-11-11 17:43:00',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-11-11 17:43:00',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-11-11 17:43:00',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-11-11 17:43:00',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-11-11 17:43:00',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-11-11 17:43:01',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-11-11 17:43:01',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-11-11 17:43:01',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-11-11 17:43:01',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-11-11 17:43:01',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-11-11 17:43:01',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-11-11 17:43:01',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-11-11 17:43:01',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-11-11 17:43:01',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-11-11 17:43:01',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-11-11 17:43:02',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-11-11 17:43:02',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-11-11 17:43:02',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-11-11 17:43:02',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-11-11 17:43:02',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-11-11 17:43:02',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-11-11 17:43:03',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-11-11 17:43:03',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-11-11 17:43:03',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-11-11 17:43:03',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-11-11 17:43:03',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-11-11 17:43:03',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-11-11 17:43:04',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-11-11 17:43:04',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-11-11 17:43:04',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'1346976825'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-11-11 17:43:04',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-11-11 17:43:04',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-11-11 17:43:04',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-11-11 17:43:04',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-11-11 17:43:04',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-11-11 17:43:04',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-11-11 17:43:04',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-11-11 17:43:04',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-11-11 17:43:04',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-11-11 17:43:04',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-11-11 17:43:05',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-11-11 17:43:05',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-11-11 17:43:05',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-11-11 17:43:05',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-11-11 17:43:05',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-11-11 17:43:05',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-11-11 17:43:05',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-11-11 17:43:05',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-11-11 17:43:05',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-11-11 17:43:06',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-11-11 17:43:06',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-11-11 17:43:07',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-11-11 17:43:07',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-11-11 17:43:07',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-11-11 17:43:07',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-11-11 17:43:07',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-11-11 17:43:07',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-11-11 17:43:07',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-11-11 17:43:07',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-11-11 17:43:07',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-11-11 17:43:07',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-11-11 17:43:07',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-11-11 17:43:07',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'1346976825'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-11-11 17:43:07',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.29.1',NULL,NULL,'1346976825'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-11-11 17:43:07',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-11-11 17:43:07',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-11-11 17:43:07',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-11-11 17:43:07',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-11-11 17:43:07',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-11-11 17:43:07',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-11-11 17:43:07',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-11-11 17:43:07',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-11-11 17:43:07',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-11-11 17:43:07',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-11-11 17:43:07',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-11-11 17:43:07',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-11-11 17:43:07',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'1346976825'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-11-11 17:43:08',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-11-11 17:43:08',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.29.1',NULL,NULL,'1346976825'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-11-11 17:43:08',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-11-11 17:43:08',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.29.1',NULL,NULL,'1346976825'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.29.1',NULL,NULL,'1346976825'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-11-11 17:43:08',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-11-11 17:43:08',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-11-11 17:43:08',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-11-11 17:43:08',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-11-11 17:43:08',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('18.0.15-30992-index-consent','keycloak','META-INF/jpa-changelog-18.0.15.xml','2024-11-11 17:43:08',107,'EXECUTED','9:80071ede7a05604b1f4906f3bf3b00f0','createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-11-11 17:43:08',108,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-11-11 17:43:08',109,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-11-11 17:43:08',110,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'1346976825'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-11-11 17:43:08',111,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-11-11 17:43:08',112,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-11-11 17:43:08',113,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.29.1',NULL,NULL,'1346976825'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-11-11 17:43:08',114,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-11-11 17:43:08',115,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-11-11 17:43:08',116,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-11-11 17:43:08',117,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.29.1',NULL,NULL,'1346976825'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-11-11 17:43:08',118,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-11-11 17:43:08',119,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-11-11 17:43:08',120,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-11-11 17:43:08',121,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-11-11 17:43:08',122,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-11-11 17:43:08',123,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-11-11 17:43:08',124,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-11-11 17:43:08',125,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28265-tables','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',126,'EXECUTED','9:deda2df035df23388af95bbd36c17cef','addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28265-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',127,'EXECUTED','9:3e96709818458ae49f3c679ae58d263a','createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28265-index-cleanup','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',128,'EXECUTED','9:8c0cfa341a0474385b324f5c4b2dfcc1','dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28265-index-2-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',129,'EXECUTED','9:b7ef76036d3126bb83c2423bf4d449d6','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28265-index-2-not-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',130,'MARK_RAN','9:23396cf51ab8bc1ae6f0cac7f9f6fcf7','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-org','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',131,'EXECUTED','9:5c859965c2c9b9c72136c360649af157','createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN','',NULL,'4.29.1',NULL,NULL,'1346976825'),('unique-consentuser','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',132,'MARK_RAN','9:5857626a2ea8767e9a6c66bf3a2cb32f','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('unique-consentuser-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',133,'EXECUTED','9:b79478aad5adaa1bc428e31563f55e8e','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('25.0.0-28861-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2024-11-11 17:43:08',134,'EXECUTED','9:b9acb58ac958d9ada0fe12a5d4794ab1','createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-org-alias','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:08',135,'EXECUTED','9:6ef7d63e4412b3c2d66ed179159886a4','addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-org-group','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:08',136,'EXECUTED','9:da8e8087d80ef2ace4f89d8c5b9ca223','addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-org-indexes','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:08',137,'EXECUTED','9:79b05dcd610a8c7f25ec05135eec0857','createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-org-group-membership','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',138,'EXECUTED','9:a6ace2ce583a421d89b01ba2a28dc2d4','addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP','',NULL,'4.29.1',NULL,NULL,'1346976825'),('31296-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',139,'EXECUTED','9:64ef94489d42a358e8304b0e245f0ed4','createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN','',NULL,'4.29.1',NULL,NULL,'1346976825'),('31725-index-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',140,'EXECUTED','9:b994246ec2bf7c94da881e1d28782c7b','createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-idps-for-login','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',141,'EXECUTED','9:51f5fffadf986983d4bd59582c6c1604','addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-32583-drop-redundant-index-on-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',142,'EXECUTED','9:24972d83bf27317a055d234187bb4af9','dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',143,'EXECUTED','9:febdc0f47f2ed241c59e60f58c3ceea5','dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...','',NULL,'4.29.1',NULL,NULL,'1346976825'),('26.0.0-33201-org-redirect-url','keycloak','META-INF/jpa-changelog-26.0.0.xml','2024-11-11 17:43:09',144,'EXECUTED','9:4d0e22b0ac68ebe9794fa9cb752ea660','addColumn tableName=ORG','',NULL,'4.29.1',NULL,NULL,'1346976825');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('24a97d78-9efc-42ed-8f27-1d9a9a73830a','11e28041-e0b5-4a03-9069-d2ddbac99857',0),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','158c08d4-b059-4bd0-83ad-be41f1e19591',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','22495a33-613c-4ce8-9cf1-b1fc66c6f104',0),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','4c6787d3-bbd9-4c28-acd8-51feee4b6351',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','4d4a19ab-54ca-439b-b16c-020a50f2e599',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','59af3913-25d7-4e65-a79c-a60fe94a4fff',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','6118e52a-b838-44cb-ba91-50119e2e797a',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','806e37b6-6d3f-4c13-b3d4-da7c26259407',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','84eae812-3b90-4866-93ca-829ca379ff31',0),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','a9de6044-725b-4e1f-afbb-736b67ecb740',0),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','baf692aa-26f3-41ce-940d-ff393180ced5',0),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','e13f538c-892e-48fd-9020-958c0f74907b',1),('24a97d78-9efc-42ed-8f27-1d9a9a73830a','f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','1c51a8a4-7c2d-4770-91de-785fb2ea1d8d',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','50f63572-4eeb-4149-bf3b-eb4192e4a595',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','52a6f429-6e9a-404b-a883-191b69b5ae9e',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','6708ad99-1feb-473e-8beb-3f04afae4945',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','6fbfe7f0-dd68-4000-8517-1bef03a36222',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','83766062-4feb-46a2-8377-2a973d5659a6',0),('a0eed67d-7ba7-43be-975d-4b43b992cb82','854dc34a-e84e-4188-91f2-629badfd65c3',0),('a0eed67d-7ba7-43be-975d-4b43b992cb82','8ee3d3f1-872f-4dd1-94b2-f759fd381019',0),('a0eed67d-7ba7-43be-975d-4b43b992cb82','a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','aaa43944-09a4-4d55-a8cd-165449d77673',1),('a0eed67d-7ba7-43be-975d-4b43b992cb82','b5ed3009-ef65-43cf-9e95-e694ce36858e',0),('a0eed67d-7ba7-43be-975d-4b43b992cb82','c9b79ed8-8b6c-4350-b6ac-54a11997122a',0),('a0eed67d-7ba7-43be-975d-4b43b992cb82','e3f52383-764c-43e0-9483-b0b9b3a69e7c',1);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` tinyint NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` tinyint NOT NULL DEFAULT '0',
  `ORGANIZATION_ID` varchar(255) DEFAULT NULL,
  `HIDE_ON_LOGIN` tinyint DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  KEY `IDX_IDP_REALM_ORG` (`REALM_ID`,`ORGANIZATION_ID`),
  KEY `IDX_IDP_FOR_LOGIN` (`REALM_ID`,`ENABLED`,`LINK_ONLY`,`HIDE_ON_LOGIN`,`ORGANIZATION_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `TYPE` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` tinyint DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('1061cb68-d47e-491f-8c9f-0baf7b8f0297','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_query-users}','query-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('1081f51c-1a8c-42eb-9f5a-f3f874d52312','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_query-realms}','query-realms','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('130527a7-b447-4d16-a124-69a4dec570e8','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_view-consent}','view-consent','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('1ddfaff0-4bb9-4a26-8f95-e49f1615ffb1','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_view-profile}','view-profile','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('1f5af355-3c42-4eac-b07b-8859d1457345','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_query-groups}','query-groups','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('1f76a016-80d8-47a3-8829-12b9f3344c63','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_view-profile}','view-profile','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('251f4ddc-8ffc-4a7a-810d-2ddae174b413','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_query-groups}','query-groups','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('25bd9b8c-68ec-43bc-86a0-7c4b827ff481','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-clients}','view-clients','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('27d96e46-8207-439d-bb03-c25c2bab398b','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_view-groups}','view-groups','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('2db56f37-917d-4bc1-b5fd-4a60e849b3bf','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_delete-account}','delete-account','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('3013b4d7-b20b-4800-8e94-1e2703b9e688','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-events}','manage-events','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('326d571c-5ce4-4fd1-9985-0f356c2f4aef','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_manage-account}','manage-account','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('39a4ea07-58c6-4302-8c9a-9a959526bee2','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-identity-providers}','view-identity-providers','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('3acc4f00-0dc8-494f-acb3-5320ca6aadbd','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,'','USER','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL,NULL),('440d73ab-cb88-4192-bb31-ca4824bfac96','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-events}','view-events','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('45ba60de-a4b2-4a5b-9eb3-45355fff1372','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-identity-providers}','manage-identity-providers','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('49b7e36e-eb1e-4cf6-9686-f6905f26d1de','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_impersonation}','impersonation','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('4cc428bf-23f5-4c88-a2df-5a96287ea57d','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-identity-providers}','manage-identity-providers','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('4f78392b-d85b-4c88-bb9f-5259555dc80b','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-realm}','view-realm','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('50223034-90db-4a1c-b355-f9ba1a5459b0','dd4df092-bbab-4948-9cad-b12df6e24e74',1,'${role_read-token}','read-token','24a97d78-9efc-42ed-8f27-1d9a9a73830a','dd4df092-bbab-4948-9cad-b12df6e24e74',NULL),('54623a3d-53a6-44d2-ad4e-623ac6ca4ef6','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_manage-account-links}','manage-account-links','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('55666832-9718-41f6-ac50-8cfba9bb1ead','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_query-users}','query-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('5acdab5c-c2dd-46e0-8a07-9349bd3e4d02','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-authorization}','manage-authorization','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('5e71d94f-b703-4ace-aa28-bdd18cd52196','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-users}','view-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('653cdd29-754b-40f7-ad67-e8e72f06fab3','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_manage-account-links}','manage-account-links','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('6afce683-7eda-4163-9b58-db80097747d7','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-clients}','view-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('6f1c69cc-e0dd-4ade-82f5-b79000b90a1e','ffc2d998-2443-4c0a-b81b-9bd85e48a4ab',1,'${role_read-token}','read-token','a0eed67d-7ba7-43be-975d-4b43b992cb82','ffc2d998-2443-4c0a-b81b-9bd85e48a4ab',NULL),('6fe53978-ec2c-4c12-bbcc-3bef2e59b640','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-clients}','view-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('70c5c762-e26a-42b6-849c-db0a3699eca9','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_impersonation}','impersonation','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('7109137c-a263-4ce9-bb21-737357002250','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_manage-consent}','manage-consent','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('72211f3b-a0f6-4f90-8ced-5465b3d931fc','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,'${role_default-roles}','default-roles-master','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,NULL),('7404f152-e82f-485d-b287-eb89b3775b19','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-users}','manage-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('77d2837a-160d-4dd5-b4f8-c959af3ec78e','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_view-consent}','view-consent','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('786a09bf-a7a0-430c-931a-ee6ede526e4a','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-events}','manage-events','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('788316e0-10b8-456f-90ca-f66cec42494d','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_impersonation}','impersonation','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('78911c5e-7e26-49d2-b258-06271ec5f4b7','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-realm}','manage-realm','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('7b131e96-0032-4c5e-9d2f-caef233a2e5e','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-realm}','view-realm','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('7ba3e814-2610-4fef-a693-39c5f8bb27d3','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_query-groups}','query-groups','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('80118c44-da06-452b-a3cb-cb059f4434d2','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-realm}','manage-realm','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('8644f7cd-dd54-4249-a1b5-cb8125098a59','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-realm}','manage-realm','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('8a4746fb-c8ce-491e-b040-5a643a662d42','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-authorization}','manage-authorization','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('8d5518a9-ab23-43f8-a369-ae8926524a04','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,'${role_uma_authorization}','uma_authorization','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,NULL),('8ea078a7-0655-48ed-abad-dc1e8b3e9787','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_manage-consent}','manage-consent','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('9517027d-73be-411b-9fe4-ebc8da2eebfd','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,'${role_admin}','admin','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,NULL),('95236488-96c2-4c5d-8d8b-96b591c0467d','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_query-realms}','query-realms','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('97ca4a4d-f9ed-435f-88cd-468ae9fc3554','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_query-clients}','query-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('9bd5bddc-24bf-4732-b576-5d27c0a1dde6','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-identity-providers}','manage-identity-providers','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('9c3505a7-7e0f-4c73-8c58-323a9a9f2e1f','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_query-users}','query-users','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('a05faa8d-8521-463a-8309-1a1a7ce33988','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-events}','manage-events','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('a37505b5-5477-40c7-b1c8-9d60e08b33be','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,'${role_uma_authorization}','uma_authorization','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL,NULL),('a3ece604-a6d8-4afd-9c2e-cd1454a0ad12','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-identity-providers}','view-identity-providers','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('a658b49b-df7c-402c-9f20-21b502914a6a','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,'${role_offline-access}','offline_access','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL,NULL),('a70276a9-59a1-42d8-a1b1-d39c0a1b7bf2','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-authorization}','manage-authorization','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('aa18e38d-c2b2-4651-8ccd-418c0820e07d','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-users}','view-users','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('ab61b2ec-e759-442d-8fc4-87112e6ac610','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_query-clients}','query-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('aec6db83-6349-4979-89da-4b1e8b5570ce','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-users}','view-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('b121d12d-4545-42af-b20b-a163a50b4309','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,'${role_default-roles}','default-roles-fitfeed-realm','24a97d78-9efc-42ed-8f27-1d9a9a73830a',NULL,NULL),('b40ebb8b-9b6b-4c0b-84dd-22e8d45cac25','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_manage-clients}','manage-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('b565c59c-7653-4beb-9813-94c73828b293','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-authorization}','view-authorization','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('b5814c33-9cd2-4f7f-8ae7-5658d842bb00','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-identity-providers}','view-identity-providers','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('b6e225dd-5892-419e-904c-f42854650075','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_manage-account}','manage-account','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('ba1f553d-ad98-451e-b95b-f24220aec622','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-clients}','manage-clients','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('c00b4012-3823-4b55-8d41-8586bc5273a4','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_view-groups}','view-groups','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('c5d16420-ddb0-4fc2-9cb8-eb28b5c6dff3','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-authorization}','view-authorization','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('cbd71cc4-c03f-4db6-a614-fca9dfeb2f87','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-realm}','view-realm','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('d0960562-de31-4fac-82b6-d36348e9fbc7','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_query-clients}','query-clients','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('d4313076-62e6-4c2c-9590-98a1cfcaaca9','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_view-applications}','view-applications','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL),('d4d489fe-3faa-4685-9495-313844ad86f4','8f05029b-c702-4f6d-a920-bfcd21ea166c',1,'${role_view-applications}','view-applications','a0eed67d-7ba7-43be-975d-4b43b992cb82','8f05029b-c702-4f6d-a920-bfcd21ea166c',NULL),('d948446c-6e6c-4d3e-837c-d6fb9d9af9b9','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-clients}','manage-clients','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('df97a685-6267-427a-a267-b813d8903459','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_realm-admin}','realm-admin','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('e0310a5a-eada-45ae-bf0a-e03334e5b0dd','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_view-events}','view-events','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('e5417518-134a-4ffe-9f4f-5572d97decb6','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,'${role_offline-access}','offline_access','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,NULL),('e56c78cb-af45-4b14-b624-9936c9b684c8','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_view-events}','view-events','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('e60de20d-9f5d-43cb-a918-5d87273ce839','44030384-ca1d-4f24-9940-41dcd15a1cf9',1,'${role_create-client}','create-client','a0eed67d-7ba7-43be-975d-4b43b992cb82','44030384-ca1d-4f24-9940-41dcd15a1cf9',NULL),('ea21d75b-7407-4858-b244-bed516088c8a','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,'${role_create-realm}','create-realm','a0eed67d-7ba7-43be-975d-4b43b992cb82',NULL,NULL),('eacea43b-8241-4a45-814d-ed7ba350f0e2','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_create-client}','create-client','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('eb084e1d-369b-4ac8-afec-7cf9c996ef83','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_query-realms}','query-realms','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('eca3f9db-1cb6-47ed-a99b-4e3948a46680','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_view-authorization}','view-authorization','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('f2a66ada-4d33-41b8-ad9a-4242b7ccca16','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_create-client}','create-client','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('fad5af3f-9360-4c9e-9b92-0e054e72445b','006f11c2-94de-4495-a2a4-f0bbdad3a824',1,'${role_manage-users}','manage-users','24a97d78-9efc-42ed-8f27-1d9a9a73830a','006f11c2-94de-4495-a2a4-f0bbdad3a824',NULL),('fad6b668-56cc-45ab-8153-1c5d41ffa060','e42139f0-c4bb-4c6d-acac-0583c703ada7',1,'${role_manage-users}','manage-users','a0eed67d-7ba7-43be-975d-4b43b992cb82','e42139f0-c4bb-4c6d-acac-0583c703ada7',NULL),('fe372be4-b9ec-478c-b83e-d66c94329120','06b5be14-f687-43e4-a4ce-3bf33a7f6498',1,'${role_delete-account}','delete-account','24a97d78-9efc-42ed-8f27-1d9a9a73830a','06b5be14-f687-43e4-a4ce-3bf33a7f6498',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('07r34','26.0.5',1731346989);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  `VERSION` int DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
INSERT INTO `OFFLINE_CLIENT_SESSION` VALUES ('4c117933-07fd-45b6-a4d0-3bef8bf4e688','715844ec-1a4f-4686-a692-bb7b40a680af','0',1731479491,'{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/admin/master/console/#/fitfeed-realm/users\",\"notes\":{\"clientId\":\"715844ec-1a4f-4686-a692-bb7b40a680af\",\"iss\":\"http://localhost:8080/realms/master\",\"startedAt\":\"1731479490\",\"response_type\":\"code\",\"level-of-authentication\":\"-1\",\"code_challenge_method\":\"S256\",\"nonce\":\"1b5d6a22-9722-4cc4-87d8-6c92bb3a3efd\",\"response_mode\":\"query\",\"scope\":\"openid\",\"userSessionStartedAt\":\"1731479490\",\"redirect_uri\":\"http://localhost:8080/admin/master/console/#/fitfeed-realm/users\",\"state\":\"f7c83c4b-71b1-4f6d-8086-c3247276c1ac\",\"code_challenge\":\"j2edGO1gqsu85-jZXBbPJfwzU5AcgKoe8YWlLrq92JM\"}}','local','local',1);
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  `BROKER_SESSION_ID` text,
  `VERSION` int DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH` (`REALM_ID`,`OFFLINE_FLAG`,`LAST_SESSION_REFRESH`),
  KEY `IDX_OFFLINE_USS_BY_BROKER_SESSION_ID` (`BROKER_SESSION_ID`(255),`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
INSERT INTO `OFFLINE_USER_SESSION` VALUES ('4c117933-07fd-45b6-a4d0-3bef8bf4e688','0696976c-46ae-46af-8aac-5e87c176905a','a0eed67d-7ba7-43be-975d-4b43b992cb82',1731479490,'0','{\"ipAddress\":\"0:0:0:0:0:0:0:1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIwOjA6MDowOjA6MDowOjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTMwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9\",\"AUTH_TIME\":\"1731479490\",\"authenticators-completed\":\"{\\\"10ed9980-c356-4504-b1e1-f2bff2217c0c\\\":1731479490}\"},\"state\":\"LOGGED_IN\"}',1731479491,NULL,1);
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG`
--

DROP TABLE IF EXISTS `ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG` (
  `ID` varchar(255) NOT NULL,
  `ENABLED` tinyint NOT NULL,
  `REALM_ID` varchar(255) NOT NULL,
  `GROUP_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `ALIAS` varchar(255) NOT NULL,
  `REDIRECT_URL` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORG_NAME` (`REALM_ID`,`NAME`),
  UNIQUE KEY `UK_ORG_GROUP` (`GROUP_ID`),
  UNIQUE KEY `UK_ORG_ALIAS` (`REALM_ID`,`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG`
--

LOCK TABLES `ORG` WRITE;
/*!40000 ALTER TABLE `ORG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG_DOMAIN`
--

DROP TABLE IF EXISTS `ORG_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_DOMAIN` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VERIFIED` tinyint NOT NULL,
  `ORG_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`NAME`),
  KEY `IDX_ORG_DOMAIN_ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG_DOMAIN`
--

LOCK TABLES `ORG_DOMAIN` WRITE;
/*!40000 ALTER TABLE `ORG_DOMAIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG_DOMAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0677a786-0d2f-4578-b88a-6d2bd6967e13','address','openid-connect','oidc-address-mapper',NULL,'83766062-4feb-46a2-8377-2a973d5659a6'),('06f093be-a96c-4408-a4ec-7519886c2667','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'6fbfe7f0-dd68-4000-8517-1bef03a36222'),('071c7f29-8558-4a16-a4db-65c32497318e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6fbfe7f0-dd68-4000-8517-1bef03a36222'),('1314fb77-e503-4714-9018-c38bc9428f4f','full name','openid-connect','oidc-full-name-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('21a03531-bc66-4bc3-ab39-dd274fcdc9c9','audience resolve','openid-connect','oidc-audience-resolve-mapper','e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1',NULL),('23d737ef-ff45-444b-bfa3-fc1af62c5693','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'6fbfe7f0-dd68-4000-8517-1bef03a36222'),('23f3e732-11af-49f5-8572-d79edb56752e','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'baf692aa-26f3-41ce-940d-ff393180ced5'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c9b79ed8-8b6c-4350-b6ac-54a11997122a'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','locale','openid-connect','oidc-usermodel-attribute-mapper','715844ec-1a4f-4686-a692-bb7b40a680af',NULL),('2d3abe48-64c2-4017-984e-02a320c0ba75','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c9b79ed8-8b6c-4350-b6ac-54a11997122a'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('35c9fa33-2210-420f-8f38-c2e5243233af','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('39900e18-f539-43bf-8a87-a1aed41a8a28','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'e13f538c-892e-48fd-9020-958c0f74907b'),('41f628bf-e940-4592-a1b9-a44f9df7407e','full name','openid-connect','oidc-full-name-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('444b4ced-ada0-4dc5-940d-0c025bed8842','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'50f63572-4eeb-4149-bf3b-eb4192e4a595'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('478396c6-870b-4ed0-ba85-2ccedad572ff','acr loa level','openid-connect','oidc-acr-mapper',NULL,'158c08d4-b059-4bd0-83ad-be41f1e19591'),('4e536213-e955-4d44-8226-2d77fcce22c3','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'4c6787d3-bbd9-4c28-acd8-51feee4b6351'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('56adbedf-e413-42ad-8a41-78c0a2f42173','organization','openid-connect','oidc-organization-membership-mapper',NULL,'84eae812-3b90-4866-93ca-829ca379ff31'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'e3f52383-764c-43e0-9483-b0b9b3a69e7c'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'59af3913-25d7-4e65-a79c-a60fe94a4fff'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6708ad99-1feb-473e-8beb-3f04afae4945'),('627149e6-8c7e-4b26-b4c9-db655d96b16d','role list','saml','saml-role-list-mapper',NULL,'aaa43944-09a4-4d55-a8cd-165449d77673'),('77ec7237-5854-434f-b918-49ef23e79eed','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b5ed3009-ef65-43cf-9e95-e694ce36858e'),('8929ed88-ad59-4838-830e-66a6ec49930b','organization','saml','saml-organization-membership-mapper',NULL,'1c51a8a4-7c2d-4770-91de-785fb2ea1d8d'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('928a298b-f8af-438d-a0b9-2b65b20010dc','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6118e52a-b838-44cb-ba91-50119e2e797a'),('9480dbea-2501-4738-80bf-436aabec59e4','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('96b73aac-b08d-413a-a9c3-d9b2b5a09ff9','sub','openid-connect','oidc-sub-mapper',NULL,'e3f52383-764c-43e0-9483-b0b9b3a69e7c'),('995e9012-4425-4b69-8254-37ac9408a86e','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b5ed3009-ef65-43cf-9e95-e694ce36858e'),('9c81bb05-82df-416b-b7b8-ca35642b3066','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('9f183b16-5ec0-41b2-93c4-7f732130552c','locale','openid-connect','oidc-usermodel-attribute-mapper','f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30',NULL),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('a56ab350-ff25-49c8-8d32-f748668583dd','address','openid-connect','oidc-address-mapper',NULL,'11e28041-e0b5-4a03-9069-d2ddbac99857'),('a5da010a-c004-4ae2-b1bb-9d2609995042','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('abbb37a5-d090-4578-a03d-cfd7baed9ca2','audience resolve','openid-connect','oidc-audience-resolve-mapper','94ee120c-bcc3-4e0e-a995-54c74412b5de',NULL),('b19d4262-5036-443c-8625-80f1b9d5b501','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('bddc040b-762b-473c-974b-463158e5af0d','sub','openid-connect','oidc-sub-mapper',NULL,'e13f538c-892e-48fd-9020-958c0f74907b'),('c656ab5e-bb0f-4e59-8885-657a5f744838','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('c6739481-30e3-41ea-a0f0-bafaadb325d7','acr loa level','openid-connect','oidc-acr-mapper',NULL,'52a6f429-6e9a-404b-a883-191b69b5ae9e'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'22495a33-613c-4ce8-9cf1-b1fc66c6f104'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6708ad99-1feb-473e-8beb-3f04afae4945'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'baf692aa-26f3-41ce-940d-ff393180ced5'),('d30cdc41-3032-4139-b081-0427b7629770','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('e084265c-4ef5-48d1-bfe5-eba7c02bc93a','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'59af3913-25d7-4e65-a79c-a60fe94a4fff'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'22495a33-613c-4ce8-9cf1-b1fc66c6f104'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','realm roles','openid-connect','oidc-usermodel-realm-role-mapper','061aeb14-6a34-4895-bafc-d34dd7910976',NULL),('e93776a8-0923-456e-ba24-b032e24c34fc','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a5a4c246-f83d-4ce9-82cd-2b52d4e2ccc6'),('e9adefba-5934-4b30-98c5-4fb92aae26a3','organization','saml','saml-organization-membership-mapper',NULL,'806e37b6-6d3f-4c13-b3d4-da7c26259407'),('eae197c7-1c65-44ea-8904-870079a0fde1','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f4b8ecc7-baba-4cf5-b4ea-4fb1eccfbd59'),('eedcad06-9944-4d29-968e-13f5f003bb4b','role list','saml','saml-role-list-mapper',NULL,'4d4a19ab-54ca-439b-b16c-020a50f2e599'),('f3185c3f-3474-48e2-a884-ea04765e22b8','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6118e52a-b838-44cb-ba91-50119e2e797a'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'59af3913-25d7-4e65-a79c-a60fe94a4fff'),('fa91aba6-db6e-4619-affb-2479fda61dcb','organization','openid-connect','oidc-organization-membership-mapper',NULL,'8ee3d3f1-872f-4dd1-94b2-f759fd381019');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0677a786-0d2f-4578-b88a-6d2bd6967e13','true','access.token.claim'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','true','id.token.claim'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','true','introspection.token.claim'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','country','user.attribute.country'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','formatted','user.attribute.formatted'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','locality','user.attribute.locality'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','postal_code','user.attribute.postal_code'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','region','user.attribute.region'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','street','user.attribute.street'),('0677a786-0d2f-4578-b88a-6d2bd6967e13','true','userinfo.token.claim'),('06f093be-a96c-4408-a4ec-7519886c2667','true','access.token.claim'),('06f093be-a96c-4408-a4ec-7519886c2667','resource_access.${client_id}.roles','claim.name'),('06f093be-a96c-4408-a4ec-7519886c2667','true','introspection.token.claim'),('06f093be-a96c-4408-a4ec-7519886c2667','String','jsonType.label'),('06f093be-a96c-4408-a4ec-7519886c2667','true','multivalued'),('06f093be-a96c-4408-a4ec-7519886c2667','foo','user.attribute'),('071c7f29-8558-4a16-a4db-65c32497318e','true','access.token.claim'),('071c7f29-8558-4a16-a4db-65c32497318e','realm_access.roles','claim.name'),('071c7f29-8558-4a16-a4db-65c32497318e','true','introspection.token.claim'),('071c7f29-8558-4a16-a4db-65c32497318e','String','jsonType.label'),('071c7f29-8558-4a16-a4db-65c32497318e','true','multivalued'),('071c7f29-8558-4a16-a4db-65c32497318e','foo','user.attribute'),('1314fb77-e503-4714-9018-c38bc9428f4f','true','access.token.claim'),('1314fb77-e503-4714-9018-c38bc9428f4f','true','id.token.claim'),('1314fb77-e503-4714-9018-c38bc9428f4f','true','introspection.token.claim'),('1314fb77-e503-4714-9018-c38bc9428f4f','true','userinfo.token.claim'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','true','access.token.claim'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','given_name','claim.name'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','true','id.token.claim'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','true','introspection.token.claim'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','String','jsonType.label'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','firstName','user.attribute'),('1d476d8f-f1fd-4c26-b5f9-9204065f475c','true','userinfo.token.claim'),('23d737ef-ff45-444b-bfa3-fc1af62c5693','true','access.token.claim'),('23d737ef-ff45-444b-bfa3-fc1af62c5693','true','introspection.token.claim'),('23f3e732-11af-49f5-8572-d79edb56752e','true','access.token.claim'),('23f3e732-11af-49f5-8572-d79edb56752e','phone_number_verified','claim.name'),('23f3e732-11af-49f5-8572-d79edb56752e','true','id.token.claim'),('23f3e732-11af-49f5-8572-d79edb56752e','true','introspection.token.claim'),('23f3e732-11af-49f5-8572-d79edb56752e','boolean','jsonType.label'),('23f3e732-11af-49f5-8572-d79edb56752e','phoneNumberVerified','user.attribute'),('23f3e732-11af-49f5-8572-d79edb56752e','true','userinfo.token.claim'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','true','access.token.claim'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','groups','claim.name'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','true','id.token.claim'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','true','introspection.token.claim'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','String','jsonType.label'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','true','multivalued'),('2b8a2b90-1ba3-4bc4-b4ab-995587d722ba','foo','user.attribute'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','true','access.token.claim'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','locale','claim.name'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','true','id.token.claim'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','true','introspection.token.claim'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','String','jsonType.label'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','locale','user.attribute'),('2c0a3c78-5c9e-4375-b202-1920bac3a8f2','true','userinfo.token.claim'),('2d3abe48-64c2-4017-984e-02a320c0ba75','true','access.token.claim'),('2d3abe48-64c2-4017-984e-02a320c0ba75','upn','claim.name'),('2d3abe48-64c2-4017-984e-02a320c0ba75','true','id.token.claim'),('2d3abe48-64c2-4017-984e-02a320c0ba75','true','introspection.token.claim'),('2d3abe48-64c2-4017-984e-02a320c0ba75','String','jsonType.label'),('2d3abe48-64c2-4017-984e-02a320c0ba75','username','user.attribute'),('2d3abe48-64c2-4017-984e-02a320c0ba75','true','userinfo.token.claim'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','true','access.token.claim'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','given_name','claim.name'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','true','id.token.claim'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','true','introspection.token.claim'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','String','jsonType.label'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','firstName','user.attribute'),('3568002c-e62e-4e80-909a-24d15b6c3f4b','true','userinfo.token.claim'),('35c9fa33-2210-420f-8f38-c2e5243233af','true','access.token.claim'),('35c9fa33-2210-420f-8f38-c2e5243233af','website','claim.name'),('35c9fa33-2210-420f-8f38-c2e5243233af','true','id.token.claim'),('35c9fa33-2210-420f-8f38-c2e5243233af','true','introspection.token.claim'),('35c9fa33-2210-420f-8f38-c2e5243233af','String','jsonType.label'),('35c9fa33-2210-420f-8f38-c2e5243233af','website','user.attribute'),('35c9fa33-2210-420f-8f38-c2e5243233af','true','userinfo.token.claim'),('39900e18-f539-43bf-8a87-a1aed41a8a28','true','access.token.claim'),('39900e18-f539-43bf-8a87-a1aed41a8a28','picture','claim.name'),('39900e18-f539-43bf-8a87-a1aed41a8a28','true','id.token.claim'),('39900e18-f539-43bf-8a87-a1aed41a8a28','true','introspection.token.claim'),('39900e18-f539-43bf-8a87-a1aed41a8a28','String','jsonType.label'),('39900e18-f539-43bf-8a87-a1aed41a8a28','picture','user.attribute'),('39900e18-f539-43bf-8a87-a1aed41a8a28','true','userinfo.token.claim'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','true','access.token.claim'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','auth_time','claim.name'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','true','id.token.claim'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','true','introspection.token.claim'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','long','jsonType.label'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','AUTH_TIME','user.session.note'),('3eade688-1161-47e3-9fd1-a10ac0f5685a','true','userinfo.token.claim'),('41f628bf-e940-4592-a1b9-a44f9df7407e','true','access.token.claim'),('41f628bf-e940-4592-a1b9-a44f9df7407e','true','id.token.claim'),('41f628bf-e940-4592-a1b9-a44f9df7407e','true','introspection.token.claim'),('41f628bf-e940-4592-a1b9-a44f9df7407e','true','userinfo.token.claim'),('444b4ced-ada0-4dc5-940d-0c025bed8842','true','access.token.claim'),('444b4ced-ada0-4dc5-940d-0c025bed8842','true','introspection.token.claim'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','true','access.token.claim'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','zoneinfo','claim.name'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','true','id.token.claim'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','true','introspection.token.claim'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','String','jsonType.label'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','zoneinfo','user.attribute'),('45f99f82-1bfd-4a20-866d-94ac614f49e3','true','userinfo.token.claim'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','true','access.token.claim'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','locale','claim.name'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','true','id.token.claim'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','true','introspection.token.claim'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','String','jsonType.label'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','locale','user.attribute'),('4772a442-2c7f-4dab-993a-4175a4e4aad8','true','userinfo.token.claim'),('478396c6-870b-4ed0-ba85-2ccedad572ff','true','access.token.claim'),('478396c6-870b-4ed0-ba85-2ccedad572ff','true','id.token.claim'),('478396c6-870b-4ed0-ba85-2ccedad572ff','true','introspection.token.claim'),('478396c6-870b-4ed0-ba85-2ccedad572ff','true','userinfo.token.claim'),('4e536213-e955-4d44-8226-2d77fcce22c3','true','access.token.claim'),('4e536213-e955-4d44-8226-2d77fcce22c3','true','introspection.token.claim'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','true','access.token.claim'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','preferred_username','claim.name'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','true','id.token.claim'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','true','introspection.token.claim'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','String','jsonType.label'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','username','user.attribute'),('4fc9f064-d32c-4e21-b811-983c0f0f574f','true','userinfo.token.claim'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','true','access.token.claim'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','birthdate','claim.name'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','true','id.token.claim'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','true','introspection.token.claim'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','String','jsonType.label'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','birthdate','user.attribute'),('5600476c-17f3-4628-b6ad-d07c27ee1bc2','true','userinfo.token.claim'),('56adbedf-e413-42ad-8a41-78c0a2f42173','true','access.token.claim'),('56adbedf-e413-42ad-8a41-78c0a2f42173','organization','claim.name'),('56adbedf-e413-42ad-8a41-78c0a2f42173','true','id.token.claim'),('56adbedf-e413-42ad-8a41-78c0a2f42173','true','introspection.token.claim'),('56adbedf-e413-42ad-8a41-78c0a2f42173','String','jsonType.label'),('56adbedf-e413-42ad-8a41-78c0a2f42173','true','multivalued'),('56adbedf-e413-42ad-8a41-78c0a2f42173','true','userinfo.token.claim'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','true','access.token.claim'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','auth_time','claim.name'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','true','id.token.claim'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','true','introspection.token.claim'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','long','jsonType.label'),('5cdfb48c-1a74-4bdb-be9b-a94ba501f43f','AUTH_TIME','user.session.note'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','true','access.token.claim'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','realm_access.roles','claim.name'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','true','introspection.token.claim'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','String','jsonType.label'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','true','multivalued'),('5cfb0b7b-3a75-44e4-a049-ea03f27307d7','foo','user.attribute'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','true','access.token.claim'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','email','claim.name'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','true','id.token.claim'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','true','introspection.token.claim'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','String','jsonType.label'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','email','user.attribute'),('5d2ae4b6-2dd4-4535-b0ad-30f069ec9082','true','userinfo.token.claim'),('627149e6-8c7e-4b26-b4c9-db655d96b16d','Role','attribute.name'),('627149e6-8c7e-4b26-b4c9-db655d96b16d','Basic','attribute.nameformat'),('627149e6-8c7e-4b26-b4c9-db655d96b16d','false','single'),('77ec7237-5854-434f-b918-49ef23e79eed','true','access.token.claim'),('77ec7237-5854-434f-b918-49ef23e79eed','phone_number_verified','claim.name'),('77ec7237-5854-434f-b918-49ef23e79eed','true','id.token.claim'),('77ec7237-5854-434f-b918-49ef23e79eed','true','introspection.token.claim'),('77ec7237-5854-434f-b918-49ef23e79eed','boolean','jsonType.label'),('77ec7237-5854-434f-b918-49ef23e79eed','phoneNumberVerified','user.attribute'),('77ec7237-5854-434f-b918-49ef23e79eed','true','userinfo.token.claim'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','true','access.token.claim'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','middle_name','claim.name'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','true','id.token.claim'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','true','introspection.token.claim'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','String','jsonType.label'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','middleName','user.attribute'),('8afb4525-4ab3-4e5d-b61e-e3479a1260b5','true','userinfo.token.claim'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','true','access.token.claim'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','nickname','claim.name'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','true','id.token.claim'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','true','introspection.token.claim'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','String','jsonType.label'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','nickname','user.attribute'),('91d845e8-bc41-4272-b6a2-74e9bf59593d','true','userinfo.token.claim'),('928a298b-f8af-438d-a0b9-2b65b20010dc','true','access.token.claim'),('928a298b-f8af-438d-a0b9-2b65b20010dc','website','claim.name'),('928a298b-f8af-438d-a0b9-2b65b20010dc','true','id.token.claim'),('928a298b-f8af-438d-a0b9-2b65b20010dc','true','introspection.token.claim'),('928a298b-f8af-438d-a0b9-2b65b20010dc','String','jsonType.label'),('928a298b-f8af-438d-a0b9-2b65b20010dc','website','user.attribute'),('928a298b-f8af-438d-a0b9-2b65b20010dc','true','userinfo.token.claim'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','true','access.token.claim'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','email','claim.name'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','true','id.token.claim'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','true','introspection.token.claim'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','String','jsonType.label'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','email','user.attribute'),('93c4d96e-4439-4edc-bedb-c4b0372364b7','true','userinfo.token.claim'),('9480dbea-2501-4738-80bf-436aabec59e4','true','access.token.claim'),('9480dbea-2501-4738-80bf-436aabec59e4','locale','claim.name'),('9480dbea-2501-4738-80bf-436aabec59e4','true','id.token.claim'),('9480dbea-2501-4738-80bf-436aabec59e4','true','introspection.token.claim'),('9480dbea-2501-4738-80bf-436aabec59e4','String','jsonType.label'),('9480dbea-2501-4738-80bf-436aabec59e4','locale','user.attribute'),('9480dbea-2501-4738-80bf-436aabec59e4','true','userinfo.token.claim'),('96b73aac-b08d-413a-a9c3-d9b2b5a09ff9','true','access.token.claim'),('96b73aac-b08d-413a-a9c3-d9b2b5a09ff9','true','introspection.token.claim'),('995e9012-4425-4b69-8254-37ac9408a86e','true','access.token.claim'),('995e9012-4425-4b69-8254-37ac9408a86e','phone_number','claim.name'),('995e9012-4425-4b69-8254-37ac9408a86e','true','id.token.claim'),('995e9012-4425-4b69-8254-37ac9408a86e','true','introspection.token.claim'),('995e9012-4425-4b69-8254-37ac9408a86e','String','jsonType.label'),('995e9012-4425-4b69-8254-37ac9408a86e','phoneNumber','user.attribute'),('995e9012-4425-4b69-8254-37ac9408a86e','true','userinfo.token.claim'),('9c81bb05-82df-416b-b7b8-ca35642b3066','true','access.token.claim'),('9c81bb05-82df-416b-b7b8-ca35642b3066','updated_at','claim.name'),('9c81bb05-82df-416b-b7b8-ca35642b3066','true','id.token.claim'),('9c81bb05-82df-416b-b7b8-ca35642b3066','true','introspection.token.claim'),('9c81bb05-82df-416b-b7b8-ca35642b3066','long','jsonType.label'),('9c81bb05-82df-416b-b7b8-ca35642b3066','updatedAt','user.attribute'),('9c81bb05-82df-416b-b7b8-ca35642b3066','true','userinfo.token.claim'),('9f183b16-5ec0-41b2-93c4-7f732130552c','true','access.token.claim'),('9f183b16-5ec0-41b2-93c4-7f732130552c','locale','claim.name'),('9f183b16-5ec0-41b2-93c4-7f732130552c','true','id.token.claim'),('9f183b16-5ec0-41b2-93c4-7f732130552c','true','introspection.token.claim'),('9f183b16-5ec0-41b2-93c4-7f732130552c','String','jsonType.label'),('9f183b16-5ec0-41b2-93c4-7f732130552c','locale','user.attribute'),('9f183b16-5ec0-41b2-93c4-7f732130552c','true','userinfo.token.claim'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','true','access.token.claim'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','birthdate','claim.name'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','true','id.token.claim'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','true','introspection.token.claim'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','String','jsonType.label'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','birthdate','user.attribute'),('a19ccb5a-f32f-41f5-8feb-336b710dfac4','true','userinfo.token.claim'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','true','access.token.claim'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','picture','claim.name'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','true','id.token.claim'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','true','introspection.token.claim'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','String','jsonType.label'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','picture','user.attribute'),('a1f8a2a4-5493-4889-ade4-79aac7905dd3','true','userinfo.token.claim'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','true','access.token.claim'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','preferred_username','claim.name'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','true','id.token.claim'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','true','introspection.token.claim'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','String','jsonType.label'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','username','user.attribute'),('a45a4732-f0d4-4a16-b618-aacd82a0a1f4','true','userinfo.token.claim'),('a56ab350-ff25-49c8-8d32-f748668583dd','true','access.token.claim'),('a56ab350-ff25-49c8-8d32-f748668583dd','true','id.token.claim'),('a56ab350-ff25-49c8-8d32-f748668583dd','true','introspection.token.claim'),('a56ab350-ff25-49c8-8d32-f748668583dd','country','user.attribute.country'),('a56ab350-ff25-49c8-8d32-f748668583dd','formatted','user.attribute.formatted'),('a56ab350-ff25-49c8-8d32-f748668583dd','locality','user.attribute.locality'),('a56ab350-ff25-49c8-8d32-f748668583dd','postal_code','user.attribute.postal_code'),('a56ab350-ff25-49c8-8d32-f748668583dd','region','user.attribute.region'),('a56ab350-ff25-49c8-8d32-f748668583dd','street','user.attribute.street'),('a56ab350-ff25-49c8-8d32-f748668583dd','true','userinfo.token.claim'),('a5da010a-c004-4ae2-b1bb-9d2609995042','true','access.token.claim'),('a5da010a-c004-4ae2-b1bb-9d2609995042','gender','claim.name'),('a5da010a-c004-4ae2-b1bb-9d2609995042','true','id.token.claim'),('a5da010a-c004-4ae2-b1bb-9d2609995042','true','introspection.token.claim'),('a5da010a-c004-4ae2-b1bb-9d2609995042','String','jsonType.label'),('a5da010a-c004-4ae2-b1bb-9d2609995042','gender','user.attribute'),('a5da010a-c004-4ae2-b1bb-9d2609995042','true','userinfo.token.claim'),('b19d4262-5036-443c-8625-80f1b9d5b501','true','access.token.claim'),('b19d4262-5036-443c-8625-80f1b9d5b501','updated_at','claim.name'),('b19d4262-5036-443c-8625-80f1b9d5b501','true','id.token.claim'),('b19d4262-5036-443c-8625-80f1b9d5b501','true','introspection.token.claim'),('b19d4262-5036-443c-8625-80f1b9d5b501','long','jsonType.label'),('b19d4262-5036-443c-8625-80f1b9d5b501','updatedAt','user.attribute'),('b19d4262-5036-443c-8625-80f1b9d5b501','true','userinfo.token.claim'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','true','access.token.claim'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','family_name','claim.name'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','true','id.token.claim'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','true','introspection.token.claim'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','String','jsonType.label'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','lastName','user.attribute'),('b5bb4f4a-7b1f-46c0-9843-6dc870cce5d1','true','userinfo.token.claim'),('bddc040b-762b-473c-974b-463158e5af0d','true','access.token.claim'),('bddc040b-762b-473c-974b-463158e5af0d','true','introspection.token.claim'),('c656ab5e-bb0f-4e59-8885-657a5f744838','true','access.token.claim'),('c656ab5e-bb0f-4e59-8885-657a5f744838','profile','claim.name'),('c656ab5e-bb0f-4e59-8885-657a5f744838','true','id.token.claim'),('c656ab5e-bb0f-4e59-8885-657a5f744838','true','introspection.token.claim'),('c656ab5e-bb0f-4e59-8885-657a5f744838','String','jsonType.label'),('c656ab5e-bb0f-4e59-8885-657a5f744838','profile','user.attribute'),('c656ab5e-bb0f-4e59-8885-657a5f744838','true','userinfo.token.claim'),('c6739481-30e3-41ea-a0f0-bafaadb325d7','true','access.token.claim'),('c6739481-30e3-41ea-a0f0-bafaadb325d7','true','id.token.claim'),('c6739481-30e3-41ea-a0f0-bafaadb325d7','true','introspection.token.claim'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','true','access.token.claim'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','groups','claim.name'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','true','id.token.claim'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','true','introspection.token.claim'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','String','jsonType.label'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','true','multivalued'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','foo','user.attribute'),('c6f39287-9999-4ece-bd81-c6f924a8b93f','true','userinfo.token.claim'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','true','access.token.claim'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','email_verified','claim.name'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','true','id.token.claim'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','true','introspection.token.claim'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','boolean','jsonType.label'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','emailVerified','user.attribute'),('c77201a5-f2ce-45c0-83e0-3017ebcccad6','true','userinfo.token.claim'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','true','access.token.claim'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','gender','claim.name'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','true','id.token.claim'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','true','introspection.token.claim'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','String','jsonType.label'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','gender','user.attribute'),('d068f4a5-642c-4888-915d-cb3bb7977ac2','true','userinfo.token.claim'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','true','access.token.claim'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','phone_number','claim.name'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','true','id.token.claim'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','true','introspection.token.claim'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','String','jsonType.label'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','phoneNumber','user.attribute'),('d285487b-b3f0-4ef4-ae17-8dba6b12c978','true','userinfo.token.claim'),('d30cdc41-3032-4139-b081-0427b7629770','true','access.token.claim'),('d30cdc41-3032-4139-b081-0427b7629770','middle_name','claim.name'),('d30cdc41-3032-4139-b081-0427b7629770','true','id.token.claim'),('d30cdc41-3032-4139-b081-0427b7629770','true','introspection.token.claim'),('d30cdc41-3032-4139-b081-0427b7629770','String','jsonType.label'),('d30cdc41-3032-4139-b081-0427b7629770','middleName','user.attribute'),('d30cdc41-3032-4139-b081-0427b7629770','true','userinfo.token.claim'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','true','access.token.claim'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','zoneinfo','claim.name'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','true','id.token.claim'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','true','introspection.token.claim'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','String','jsonType.label'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','zoneinfo','user.attribute'),('d8bef28d-89d3-43cb-aad0-ac2601113ce9','true','userinfo.token.claim'),('e084265c-4ef5-48d1-bfe5-eba7c02bc93a','true','access.token.claim'),('e084265c-4ef5-48d1-bfe5-eba7c02bc93a','true','introspection.token.claim'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','true','access.token.claim'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','upn','claim.name'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','true','id.token.claim'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','true','introspection.token.claim'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','String','jsonType.label'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','username','user.attribute'),('e2a59c30-510f-4bc8-9ffc-0ab82e3bd433','true','userinfo.token.claim'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','true','access.token.claim'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','realm_access.roles','claim.name'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','true','id.token.claim'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','true','introspection.token.claim'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','String','jsonType.label'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','false','lightweight.claim'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','true','multivalued'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','foo','user.attribute'),('e55c3832-bb6b-4f27-aadc-64f2bc3d7a67','false','userinfo.token.claim'),('e93776a8-0923-456e-ba24-b032e24c34fc','true','access.token.claim'),('e93776a8-0923-456e-ba24-b032e24c34fc','profile','claim.name'),('e93776a8-0923-456e-ba24-b032e24c34fc','true','id.token.claim'),('e93776a8-0923-456e-ba24-b032e24c34fc','true','introspection.token.claim'),('e93776a8-0923-456e-ba24-b032e24c34fc','String','jsonType.label'),('e93776a8-0923-456e-ba24-b032e24c34fc','profile','user.attribute'),('e93776a8-0923-456e-ba24-b032e24c34fc','true','userinfo.token.claim'),('eae197c7-1c65-44ea-8904-870079a0fde1','true','access.token.claim'),('eae197c7-1c65-44ea-8904-870079a0fde1','family_name','claim.name'),('eae197c7-1c65-44ea-8904-870079a0fde1','true','id.token.claim'),('eae197c7-1c65-44ea-8904-870079a0fde1','true','introspection.token.claim'),('eae197c7-1c65-44ea-8904-870079a0fde1','String','jsonType.label'),('eae197c7-1c65-44ea-8904-870079a0fde1','lastName','user.attribute'),('eae197c7-1c65-44ea-8904-870079a0fde1','true','userinfo.token.claim'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','true','access.token.claim'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','nickname','claim.name'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','true','id.token.claim'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','true','introspection.token.claim'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','String','jsonType.label'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','nickname','user.attribute'),('ecda7180-28b2-41b0-a3ea-24e6df09a488','true','userinfo.token.claim'),('eedcad06-9944-4d29-968e-13f5f003bb4b','Role','attribute.name'),('eedcad06-9944-4d29-968e-13f5f003bb4b','Basic','attribute.nameformat'),('eedcad06-9944-4d29-968e-13f5f003bb4b','false','single'),('f3185c3f-3474-48e2-a884-ea04765e22b8','true','access.token.claim'),('f3185c3f-3474-48e2-a884-ea04765e22b8','email_verified','claim.name'),('f3185c3f-3474-48e2-a884-ea04765e22b8','true','id.token.claim'),('f3185c3f-3474-48e2-a884-ea04765e22b8','true','introspection.token.claim'),('f3185c3f-3474-48e2-a884-ea04765e22b8','boolean','jsonType.label'),('f3185c3f-3474-48e2-a884-ea04765e22b8','emailVerified','user.attribute'),('f3185c3f-3474-48e2-a884-ea04765e22b8','true','userinfo.token.claim'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','true','access.token.claim'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','resource_access.${client_id}.roles','claim.name'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','true','introspection.token.claim'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','String','jsonType.label'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','true','multivalued'),('f5f38b23-166b-43bc-8f2a-dc0ffddb3f9f','foo','user.attribute'),('fa91aba6-db6e-4619-affb-2479fda61dcb','true','access.token.claim'),('fa91aba6-db6e-4619-affb-2479fda61dcb','organization','claim.name'),('fa91aba6-db6e-4619-affb-2479fda61dcb','true','id.token.claim'),('fa91aba6-db6e-4619-affb-2479fda61dcb','true','introspection.token.claim'),('fa91aba6-db6e-4619-affb-2479fda61dcb','String','jsonType.label'),('fa91aba6-db6e-4619-affb-2479fda61dcb','true','multivalued');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `SOCIAL` tinyint NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` tinyint NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('24a97d78-9efc-42ed-8f27-1d9a9a73830a',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'fitfeed-realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'44030384-ca1d-4f24-9940-41dcd15a1cf9',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','acf455c7-2bb1-4ed6-bd14-636e34224f39','25857b50-c9ec-45eb-a1c7-ad51dffb0349','1fd11c80-10a8-4335-a190-a67f5ebe819a','5973c863-2b17-4d9f-b827-101a7a882457','b52d9de9-d3ee-4cf6-9616-88fd76b28d52',2592000,0,900,1,0,'41b6138f-0bec-4402-8911-3efec1055897',0,0,0,0,'b121d12d-4545-42af-b20b-a163a50b4309'),('a0eed67d-7ba7-43be-975d-4b43b992cb82',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'e42139f0-c4bb-4c6d-acac-0583c703ada7',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','2ec1f963-2c41-447b-890d-dd2669e5a2a0','7728c38c-d22a-4a64-a53c-c382f9f10376','d86390ac-7263-4768-b6fc-3734000dbd37','d167b6e1-e23d-409f-95d1-68023f1fff80','e5173939-8a31-47af-a108-41aead4c483b',2592000,0,900,1,0,'22fa5977-cca7-4798-9395-4e1a4f2eb4b6',0,0,0,0,'72211f3b-a0f6-4f90-8ced-5465b3d931fc');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','24a97d78-9efc-42ed-8f27-1d9a9a73830a',''),('_browser_header.contentSecurityPolicyReportOnly','a0eed67d-7ba7-43be-975d-4b43b992cb82',''),('_browser_header.referrerPolicy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','no-referrer'),('_browser_header.referrerPolicy','a0eed67d-7ba7-43be-975d-4b43b992cb82','no-referrer'),('_browser_header.strictTransportSecurity','24a97d78-9efc-42ed-8f27-1d9a9a73830a','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','a0eed67d-7ba7-43be-975d-4b43b992cb82','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','24a97d78-9efc-42ed-8f27-1d9a9a73830a','nosniff'),('_browser_header.xContentTypeOptions','a0eed67d-7ba7-43be-975d-4b43b992cb82','nosniff'),('_browser_header.xFrameOptions','24a97d78-9efc-42ed-8f27-1d9a9a73830a','SAMEORIGIN'),('_browser_header.xFrameOptions','a0eed67d-7ba7-43be-975d-4b43b992cb82','SAMEORIGIN'),('_browser_header.xRobotsTag','24a97d78-9efc-42ed-8f27-1d9a9a73830a','none'),('_browser_header.xRobotsTag','a0eed67d-7ba7-43be-975d-4b43b992cb82','none'),('_browser_header.xXSSProtection','24a97d78-9efc-42ed-8f27-1d9a9a73830a','1; mode=block'),('_browser_header.xXSSProtection','a0eed67d-7ba7-43be-975d-4b43b992cb82','1; mode=block'),('actionTokenGeneratedByAdminLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','43200'),('actionTokenGeneratedByUserLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','300'),('bruteForceProtected','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('bruteForceProtected','a0eed67d-7ba7-43be-975d-4b43b992cb82','false'),('bruteForceStrategy','24a97d78-9efc-42ed-8f27-1d9a9a73830a','MULTIPLE'),('bruteForceStrategy','a0eed67d-7ba7-43be-975d-4b43b992cb82','MULTIPLE'),('cibaAuthRequestedUserHint','24a97d78-9efc-42ed-8f27-1d9a9a73830a','login_hint'),('cibaBackchannelTokenDeliveryMode','24a97d78-9efc-42ed-8f27-1d9a9a73830a','poll'),('cibaExpiresIn','24a97d78-9efc-42ed-8f27-1d9a9a73830a','120'),('cibaInterval','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5'),('client-policies.policies','24a97d78-9efc-42ed-8f27-1d9a9a73830a','{\"policies\":[]}'),('client-policies.profiles','24a97d78-9efc-42ed-8f27-1d9a9a73830a','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('clientOfflineSessionMaxLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('clientSessionIdleTimeout','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('clientSessionMaxLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('defaultSignatureAlgorithm','24a97d78-9efc-42ed-8f27-1d9a9a73830a','RS256'),('defaultSignatureAlgorithm','a0eed67d-7ba7-43be-975d-4b43b992cb82','RS256'),('displayName','a0eed67d-7ba7-43be-975d-4b43b992cb82','Keycloak'),('displayNameHtml','a0eed67d-7ba7-43be-975d-4b43b992cb82','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','24a97d78-9efc-42ed-8f27-1d9a9a73830a','30'),('failureFactor','a0eed67d-7ba7-43be-975d-4b43b992cb82','30'),('firstBrokerLoginFlowId','24a97d78-9efc-42ed-8f27-1d9a9a73830a','7baf86c9-e7c0-407c-8dc3-91d043a078c0'),('firstBrokerLoginFlowId','a0eed67d-7ba7-43be-975d-4b43b992cb82','308d5e03-c4a4-447e-9dcb-57c0fae8a50a'),('maxDeltaTimeSeconds','24a97d78-9efc-42ed-8f27-1d9a9a73830a','43200'),('maxDeltaTimeSeconds','a0eed67d-7ba7-43be-975d-4b43b992cb82','43200'),('maxFailureWaitSeconds','24a97d78-9efc-42ed-8f27-1d9a9a73830a','900'),('maxFailureWaitSeconds','a0eed67d-7ba7-43be-975d-4b43b992cb82','900'),('maxTemporaryLockouts','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('maxTemporaryLockouts','a0eed67d-7ba7-43be-975d-4b43b992cb82','0'),('minimumQuickLoginWaitSeconds','24a97d78-9efc-42ed-8f27-1d9a9a73830a','60'),('minimumQuickLoginWaitSeconds','a0eed67d-7ba7-43be-975d-4b43b992cb82','60'),('oauth2DeviceCodeLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','600'),('oauth2DevicePollingInterval','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5'),('offlineSessionMaxLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','5184000'),('offlineSessionMaxLifespan','a0eed67d-7ba7-43be-975d-4b43b992cb82','5184000'),('offlineSessionMaxLifespanEnabled','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('offlineSessionMaxLifespanEnabled','a0eed67d-7ba7-43be-975d-4b43b992cb82','false'),('organizationsEnabled','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('parRequestUriLifespan','24a97d78-9efc-42ed-8f27-1d9a9a73830a','60'),('permanentLockout','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('permanentLockout','a0eed67d-7ba7-43be-975d-4b43b992cb82','false'),('quickLoginCheckMilliSeconds','24a97d78-9efc-42ed-8f27-1d9a9a73830a','1000'),('quickLoginCheckMilliSeconds','a0eed67d-7ba7-43be-975d-4b43b992cb82','1000'),('realmReusableOtpCode','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('realmReusableOtpCode','a0eed67d-7ba7-43be-975d-4b43b992cb82','false'),('waitIncrementSeconds','24a97d78-9efc-42ed-8f27-1d9a9a73830a','60'),('waitIncrementSeconds','a0eed67d-7ba7-43be-975d-4b43b992cb82','60'),('webAuthnPolicyAttestationConveyancePreference','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyAuthenticatorAttachment','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','false'),('webAuthnPolicyCreateTimeout','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('webAuthnPolicyCreateTimeoutPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','0'),('webAuthnPolicyRequireResidentKey','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyRpEntityName','24a97d78-9efc-42ed-8f27-1d9a9a73830a','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','keycloak'),('webAuthnPolicyRpId','24a97d78-9efc-42ed-8f27-1d9a9a73830a',''),('webAuthnPolicyRpIdPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a',''),('webAuthnPolicySignatureAlgorithms','24a97d78-9efc-42ed-8f27-1d9a9a73830a','ES256,RS256'),('webAuthnPolicySignatureAlgorithmsPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','ES256,RS256'),('webAuthnPolicyUserVerificationRequirement','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('24a97d78-9efc-42ed-8f27-1d9a9a73830a','jboss-logging'),('a0eed67d-7ba7-43be-975d-4b43b992cb82','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint NOT NULL DEFAULT '0',
  `SECRET` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'24a97d78-9efc-42ed-8f27-1d9a9a73830a'),('password','password',1,1,'a0eed67d-7ba7-43be-975d-4b43b992cb82');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('061aeb14-6a34-4895-bafc-d34dd7910976','http://localhost:8081'),('06b5be14-f687-43e4-a4ce-3bf33a7f6498','/realms/fitfeed-realm/account/*'),('715844ec-1a4f-4686-a692-bb7b40a680af','/admin/master/console/*'),('8f05029b-c702-4f6d-a920-bfcd21ea166c','/realms/master/account/*'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','/realms/fitfeed-realm/account/*'),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','/realms/master/account/*'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','/admin/fitfeed-realm/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('036aa83f-d710-4f07-876b-a18197268602','CONFIGURE_TOTP','Configure OTP','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'CONFIGURE_TOTP',10),('09843eca-99e9-40ed-b807-dd20dcdb8155','delete_account','Delete Account','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,0,'delete_account',60),('136dcb01-9394-44ed-b5ec-6e65699a35c3','update_user_locale','Update User Locale','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'update_user_locale',1000),('175451a8-b44f-4d4b-8815-be9327dbd1eb','VERIFY_PROFILE','Verify Profile','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'VERIFY_PROFILE',90),('1aeed0a2-fb15-457e-9862-801e2b2750de','webauthn-register-passwordless','Webauthn Register Passwordless','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'webauthn-register-passwordless',80),('21ce36bc-45b6-4908-9d5e-9134e99b3ff5','update_user_locale','Update User Locale','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'update_user_locale',1000),('2437e104-d6b0-46c2-a8b2-8310fa1fda77','TERMS_AND_CONDITIONS','Terms and Conditions','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,0,'TERMS_AND_CONDITIONS',20),('258936bc-12ca-4726-8be7-521bccd71271','delete_account','Delete Account','a0eed67d-7ba7-43be-975d-4b43b992cb82',0,0,'delete_account',60),('31d326b0-94f9-407f-abb5-af84035b2c10','delete_credential','Delete Credential','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'delete_credential',100),('52423ccc-f25e-4331-8bcd-40dbd542d1b6','webauthn-register','Webauthn Register','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'webauthn-register',70),('53c9126b-d0ac-4c51-a525-27abf7d936c9','UPDATE_PROFILE','Update Profile','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'UPDATE_PROFILE',40),('614e4cf8-56ec-4f82-8d95-1c359effa495','TERMS_AND_CONDITIONS','Terms and Conditions','24a97d78-9efc-42ed-8f27-1d9a9a73830a',0,0,'TERMS_AND_CONDITIONS',20),('6155d5ad-843d-4a09-9626-0efc97912b07','UPDATE_PASSWORD','Update Password','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'UPDATE_PASSWORD',30),('6749563f-c0db-4e40-9007-c76cc13f2516','UPDATE_PASSWORD','Update Password','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'UPDATE_PASSWORD',30),('8ef44e4e-5b60-420d-a9f2-6123cb227513','webauthn-register','Webauthn Register','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'webauthn-register',70),('9b28a4c8-f07f-41f1-86b5-0503d4379651','webauthn-register-passwordless','Webauthn Register Passwordless','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'webauthn-register-passwordless',80),('9ddb6d39-4654-40ce-9293-093fd8b35ba6','VERIFY_EMAIL','Verify Email','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'VERIFY_EMAIL',50),('dbf3b57e-615f-436d-89c9-17a1dcbca3c5','VERIFY_EMAIL','Verify Email','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'VERIFY_EMAIL',50),('df53a257-c9ad-4316-b68b-b5a77f07d50c','VERIFY_PROFILE','Verify Profile','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'VERIFY_PROFILE',90),('e0aad28b-b836-4325-bad0-d99516373f0d','delete_credential','Delete Credential','a0eed67d-7ba7-43be-975d-4b43b992cb82',1,0,'delete_credential',100),('e7893347-b0eb-43bf-99a2-38ac8f030cdc','CONFIGURE_TOTP','Configure OTP','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'CONFIGURE_TOTP',10),('f075d334-aa5f-4a03-bf29-c312d6facca2','UPDATE_PROFILE','Update Profile','24a97d78-9efc-42ed-8f27-1d9a9a73830a',1,0,'UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  KEY `IDX_PERM_TICKET_REQUESTER` (`REQUESTER`),
  KEY `IDX_PERM_TICKET_OWNER` (`OWNER`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVOKED_TOKEN`
--

DROP TABLE IF EXISTS `REVOKED_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVOKED_TOKEN` (
  `ID` varchar(255) NOT NULL,
  `EXPIRE` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REV_TOKEN_ON_EXPIRE` (`EXPIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVOKED_TOKEN`
--

LOCK TABLES `REVOKED_TOKEN` WRITE;
/*!40000 ALTER TABLE `REVOKED_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVOKED_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','27d96e46-8207-439d-bb03-c25c2bab398b'),('e2728c6d-aa4a-47e8-9e5d-5cf0678c2ba1','326d571c-5ce4-4fd1-9985-0f356c2f4aef'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','b6e225dd-5892-419e-904c-f42854650075'),('94ee120c-bcc3-4e0e-a995-54c74412b5de','c00b4012-3823-4b55-8d41-8586bc5273a4');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('is_temporary_admin','true','0696976c-46ae-46af-8aac-5e87c176905a','674d1c3d-61d2-4ad9-83dc-07d8eca3eb5b',NULL,NULL,NULL);
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_LOCAL_CONSENT` (`CLIENT_ID`,`USER_ID`),
  UNIQUE KEY `UK_EXTERNAL_CONSENT` (`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  KEY `IDX_USCONSENT_SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('0696976c-46ae-46af-8aac-5e87c176905a',NULL,'52bca6b0-3036-446f-a02c-e8e1ff6404e9',0,1,NULL,NULL,NULL,'a0eed67d-7ba7-43be-975d-4b43b992cb82','admin',1731346995685,NULL,0),('46b45616-8f1f-4a3b-9118-b9dd4f732431','fitfeed476@gmail.com','fitfeed476@gmail.com',1,1,NULL,'Josh','Siegel','24a97d78-9efc-42ed-8f27-1d9a9a73830a','fitfeed-admin',1730997324924,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `MEMBERSHIP_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('72211f3b-a0f6-4f90-8ced-5465b3d931fc','0696976c-46ae-46af-8aac-5e87c176905a'),('9517027d-73be-411b-9fe4-ebc8da2eebfd','0696976c-46ae-46af-8aac-5e87c176905a'),('3acc4f00-0dc8-494f-acb3-5320ca6aadbd','46b45616-8f1f-4a3b-9118-b9dd4f732431'),('b121d12d-4545-42af-b20b-a163a50b4309','46b45616-8f1f-4a3b-9118-b9dd4f732431'),('df97a685-6267-427a-a267-b813d8903459','46b45616-8f1f-4a3b-9118-b9dd4f732431');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('061aeb14-6a34-4895-bafc-d34dd7910976','http://localhost:8081'),('715844ec-1a4f-4686-a692-bb7b40a680af','+'),('f964c8f4-f0b5-41b3-bcb3-8af5dcf55e30','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fitfeedkc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13  1:35:07
