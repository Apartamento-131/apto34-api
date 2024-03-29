-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommece
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `id` int NOT NULL,
  `data_emissao_boleto` datetime NOT NULL,
  `numero_boleto` varchar(48) NOT NULL,
  `valor_boleto` float NOT NULL,
  `boleto_pago` tinyint NOT NULL,
  `data_pagamento_boleto` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_boleto_UNIQUE` (`numero_boleto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao` (
  `id` int NOT NULL,
  `numero_cartao` char(4) NOT NULL,
  `nome_cartao` varchar(25) NOT NULL,
  `data_expiracao` date NOT NULL,
  `id_cartao_bandeira` int NOT NULL,
  `salt` varchar(40) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_cartao_UNIQUE` (`numero_cartao`),
  UNIQUE KEY `salt_UNIQUE` (`salt`),
  KEY `fk_cartoes_cartao_bandeiras1_idx` (`id_cartao_bandeira`),
  CONSTRAINT `fk_cartoes_cartao_bandeiras1` FOREIGN KEY (`id_cartao_bandeira`) REFERENCES `cartao_bandeira` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_bandeira`
--

DROP TABLE IF EXISTS `cartao_bandeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao_bandeira` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `bandeira` varchar(20) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_bandeira`
--

LOCK TABLES `cartao_bandeira` WRITE;
/*!40000 ALTER TABLE `cartao_bandeira` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_bandeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_bandeira_tem_pagamento_tipo`
--

DROP TABLE IF EXISTS `cartao_bandeira_tem_pagamento_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao_bandeira_tem_pagamento_tipo` (
  `idCartaoBandeira` int NOT NULL,
  `idPagamentoTipo` int NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idCartaoBandeira`,`idPagamentoTipo`),
  KEY `fk_cartao_bandeira_has_pagamento_tipo_pagamento_tipo1_idx` (`idPagamentoTipo`),
  KEY `fk_cartao_bandeira_has_pagamento_tipo_cartao_bandeira1_idx` (`idCartaoBandeira`),
  CONSTRAINT `fk_cartao_bandeira_has_pagamento_tipo_cartao_bandeira1` FOREIGN KEY (`idCartaoBandeira`) REFERENCES `cartao_bandeira` (`id`),
  CONSTRAINT `fk_cartao_bandeira_has_pagamento_tipo_pagamento_tipo1` FOREIGN KEY (`idPagamentoTipo`) REFERENCES `pagamento_tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_bandeira_tem_pagamento_tipo`
--

LOCK TABLES `cartao_bandeira_tem_pagamento_tipo` WRITE;
/*!40000 ALTER TABLE `cartao_bandeira_tem_pagamento_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_bandeira_tem_pagamento_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id_cidade` int NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `id_estado` int NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado1_idx` (`id_estado`),
  CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Piracicaba',1,NULL,NULL);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(60) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `data_de_nascimento` date DEFAULT NULL,
  `id_telefone` int DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `senha` varchar(200) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `data_ultima_atualizacao` datetime DEFAULT NULL,
  `desativado` tinyint DEFAULT NULL,
  `data_conta_desativada` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `admin` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_cliente_telefones1_idx` (`id_telefone`),
  CONSTRAINT `fk_cliente_telefones1` FOREIGN KEY (`id_telefone`) REFERENCES `telefone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'','',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'2023-07-09 21:10:11','2023-07-09 21:10:11',NULL,0),(2,'Gabriela','Nery da Silva de Mattos',NULL,NULL,NULL,'gneri94890@gmail.com',NULL,'$2a$10$CbxR.gmWk9PtfqSFjZ/W8OZyLbal/gpfntkUHp.PrPjwckFASd0oq',NULL,NULL,NULL,NULL,'2023-07-10 00:10:57','2023-07-10 00:10:57',NULL,1),(4,'Jana','Silva',NULL,NULL,NULL,'jana-silva@gmail.com',NULL,'$2a$10$CbxR.gmWk9PtfqSFjZ/W8OZyLbal/gpfntkUHp.PrPjwckFASd0oq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_enderecos`
--

DROP TABLE IF EXISTS `cliente_has_enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_enderecos` (
  `idCliente` int NOT NULL,
  `idEndereco` int NOT NULL,
  `idTelefone` int NOT NULL,
  `nome_completo` varchar(45) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idEndereco`,`idTelefone`),
  KEY `fk_cliente_has_enderecos_enderecos1_idx` (`idEndereco`),
  KEY `fk_cliente_has_enderecos_cliente1_idx` (`idCliente`),
  KEY `fk_cliente_has_enderecos_telefones1_idx` (`idTelefone`),
  CONSTRAINT `fk_cliente_has_enderecos_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_cliente_has_enderecos_enderecos1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `fk_cliente_has_enderecos_telefones1` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_enderecos`
--

LOCK TABLES `cliente_has_enderecos` WRITE;
/*!40000 ALTER TABLE `cliente_has_enderecos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_has_enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_tem_cartao`
--

DROP TABLE IF EXISTS `cliente_tem_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_tem_cartao` (
  `idCliente` int NOT NULL,
  `idCartao` int NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idCartao`),
  KEY `fk_cliente_has_cartao_cartao1_idx` (`idCartao`),
  KEY `fk_cliente_has_cartao_cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_cliente_has_cartao_cartao1` FOREIGN KEY (`idCartao`) REFERENCES `cartao` (`id`),
  CONSTRAINT `fk_cliente_has_cartao_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_tem_cartao`
--

LOCK TABLES `cliente_tem_cartao` WRITE;
/*!40000 ALTER TABLE `cliente_tem_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_tem_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_tem_endereco`
--

DROP TABLE IF EXISTS `cliente_tem_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_tem_endereco` (
  `idCliente` int NOT NULL,
  `idEndereco` int NOT NULL,
  `endereco_criacao` tinyint NOT NULL,
  `padrao` tinyint NOT NULL,
  `data_criacao` datetime NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idEndereco`),
  KEY `fk_cliente_has_endereco_endereco1_idx` (`idEndereco`),
  KEY `fk_cliente_has_endereco_cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_cliente_has_endereco_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_cliente_has_endereco_endereco1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_tem_endereco`
--

LOCK TABLES `cliente_tem_endereco` WRITE;
/*!40000 ALTER TABLE `cliente_tem_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_tem_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'Rosa','2023-07-09 20:53:42','2023-07-09 20:53:42'),(2,'Preto','2023-07-09 20:53:42','2023-07-09 20:53:42'),(3,'Branco','2023-07-09 20:53:42','2023-07-09 20:53:42');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddd`
--

DROP TABLE IF EXISTS `ddd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ddd` (
  `id` int NOT NULL,
  `ddd` int NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ddd_UNIQUE` (`ddd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddd`
--

LOCK TABLES `ddd` WRITE;
/*!40000 ALTER TABLE `ddd` DISABLE KEYS */;
INSERT INTO `ddd` VALUES (19,19,NULL,NULL);
/*!40000 ALTER TABLE `ddd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `nome` varchar(255) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'2014-08-15 00:00:00','Correios',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` char(8) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(60) NOT NULL,
  `id_cidade` int NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enderecos_cidade1_idx` (`id_cidade`),
  CONSTRAINT `fk_enderecos_cidade1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'13400853','Av. Dr. Paulo de Moraes',1423,NULL,'Paulista',1,NULL,NULL),(2,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:37:29','2024-03-03 03:37:29'),(3,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:41:12','2024-03-03 03:41:12'),(4,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:42:37','2024-03-03 03:42:37'),(5,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:43:48','2024-03-03 03:43:48'),(6,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:45:20','2024-03-03 03:45:20'),(7,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:46:06','2024-03-03 03:46:06'),(8,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:47:00','2024-03-03 03:47:00'),(9,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 03:49:15','2024-03-03 03:49:15'),(10,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:20:38','2024-03-03 04:20:38'),(11,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:22:01','2024-03-03 04:22:01'),(12,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:32:41','2024-03-03 04:32:41'),(13,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:32:51','2024-03-03 04:32:51'),(14,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:33:09','2024-03-03 04:33:09'),(15,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:35:57','2024-03-03 04:35:57'),(16,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:40:51','2024-03-03 04:40:51'),(17,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:43:58','2024-03-03 04:43:58'),(18,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:45:58','2024-03-03 04:45:58'),(19,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:48:05','2024-03-03 04:48:05'),(20,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:48:45','2024-03-03 04:48:45'),(21,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:50:43','2024-03-03 04:50:43'),(22,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:52:28','2024-03-03 04:52:28'),(23,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 04:52:45','2024-03-03 04:52:45'),(24,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 22:04:36','2024-03-03 22:04:36'),(25,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 22:06:02','2024-03-03 22:06:02'),(26,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 22:06:43','2024-03-03 22:06:43'),(27,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 22:06:56','2024-03-03 22:06:56'),(28,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 22:59:18','2024-03-03 22:59:18'),(29,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:00:50','2024-03-03 23:00:50'),(30,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:02:08','2024-03-03 23:02:08'),(31,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:04:22','2024-03-03 23:04:22'),(32,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:06:49','2024-03-03 23:06:49'),(33,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:07:48','2024-03-03 23:07:48'),(34,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:08:05','2024-03-03 23:08:05'),(35,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-03 23:08:44','2024-03-03 23:08:44'),(36,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:03:36','2024-03-04 00:03:36'),(37,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:03:51','2024-03-04 00:03:51'),(38,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:08:29','2024-03-04 00:08:29'),(39,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:10:40','2024-03-04 00:10:40'),(40,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:11:37','2024-03-04 00:11:37'),(41,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:12:15','2024-03-04 00:12:15'),(42,'13400690','rua aqui',55,'qq','qqs',1,'2024-03-04 00:12:59','2024-03-04 00:12:59');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrega_status` int NOT NULL,
  `data_entrega_inicio` datetime DEFAULT NULL,
  `valor_frete` float NOT NULL,
  `codigo_rastreio` varchar(15) DEFAULT NULL,
  `idEndereco` int NOT NULL,
  `idTransportadora` int NOT NULL,
  `idTelefone` int NOT NULL,
  `data_entrega_previsao` datetime DEFAULT NULL,
  `entrega_concluida` tinyint DEFAULT NULL,
  `data_entrega_fim` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrega_endereco1_idx` (`idEndereco`),
  KEY `fk_entrega_telefone1_idx` (`idTelefone`),
  KEY `fk_entrega_transportadora1_idx` (`idTransportadora`),
  KEY `fk_entrega_entrega_status1_idx` (`id_entrega_status`),
  CONSTRAINT `fk_entrega_endereco1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `fk_entrega_entrega_status1` FOREIGN KEY (`id_entrega_status`) REFERENCES `entrega_status` (`id`),
  CONSTRAINT `fk_entrega_telefone1` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`id`),
  CONSTRAINT `fk_entrega_transportadora1` FOREIGN KEY (`idTransportadora`) REFERENCES `transportadora` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega_status`
--

DROP TABLE IF EXISTS `entrega_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega_status` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `status_entrega` varchar(45) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_status`
--

LOCK TABLES `entrega_status` WRITE;
/*!40000 ALTER TABLE `entrega_status` DISABLE KEYS */;
INSERT INTO `entrega_status` VALUES (1,NULL,'Em transporte',0,NULL,NULL,NULL),(2,NULL,'Entregue',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `entrega_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  `uf` char(2) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'São Paulo','SP',NULL,NULL);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `id` int NOT NULL,
  `data_emissao_nota` datetime NOT NULL,
  `numero_nota` int NOT NULL,
  `valor_nota` float NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_nota_UNIQUE` (`numero_nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pagamento_tipo` int NOT NULL,
  `parcelado` tinyint DEFAULT NULL,
  `quantidade_parcelas` int DEFAULT NULL,
  `id_boleto` int DEFAULT NULL,
  `pagamento_confirmado` tinyint NOT NULL,
  `data_pagamento_confirmado` date DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `mp_id` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `status_detail` varchar(45) DEFAULT NULL,
  `pix_qrcode` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagamento_pagamento_tipo1_idx` (`id_pagamento_tipo`),
  KEY `fk_pagamento_boleto1_idx` (`id_boleto`),
  CONSTRAINT `fk_pagamento_boleto1` FOREIGN KEY (`id_boleto`) REFERENCES `boleto` (`id`),
  CONSTRAINT `fk_pagamento_pagamento_tipo1` FOREIGN KEY (`id_pagamento_tipo`) REFERENCES `pagamento_tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_tipo`
--

DROP TABLE IF EXISTS `pagamento_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento_tipo` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `tipo_pagamento` varchar(45) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_tipo`
--

LOCK TABLES `pagamento_tipo` WRITE;
/*!40000 ALTER TABLE `pagamento_tipo` DISABLE KEYS */;
INSERT INTO `pagamento_tipo` VALUES (1,'2014-08-15 00:00:00','cc',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pagamento_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPedidoStatus` int NOT NULL,
  `idNotaFiscal` int DEFAULT NULL,
  `data_pedido_realizado` datetime NOT NULL,
  `idCliente` int NOT NULL,
  `idPagamento` int DEFAULT NULL,
  `idEntrega` int NOT NULL,
  `pedido_concluido` tinyint NOT NULL,
  `data_pedido_concluido` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_entrega_UNIQUE` (`idEntrega`),
  KEY `fk_pedido_cliente1_idx` (`idCliente`),
  KEY `fk_pedido_pagamento1_idx` (`idPagamento`),
  KEY `fk_pedido_entrega1_idx` (`idEntrega`),
  KEY `fk_pedido_pedido_status1_idx` (`idPedidoStatus`),
  KEY `fk_pedido_nota_fiscal1_idx` (`idNotaFiscal`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_pedido_entrega1` FOREIGN KEY (`idEntrega`) REFERENCES `entrega` (`id`),
  CONSTRAINT `fk_pedido_nota_fiscal1` FOREIGN KEY (`idNotaFiscal`) REFERENCES `nota_fiscal` (`id`),
  CONSTRAINT `fk_pedido_pagamento1` FOREIGN KEY (`idPagamento`) REFERENCES `pagamento` (`id`),
  CONSTRAINT `fk_pedido_pedido_status1` FOREIGN KEY (`idPedidoStatus`) REFERENCES `pedido_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_status`
--

DROP TABLE IF EXISTS `pedido_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_status` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `status_pedido` varchar(45) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_status`
--

LOCK TABLES `pedido_status` WRITE;
/*!40000 ALTER TABLE `pedido_status` DISABLE KEYS */;
INSERT INTO `pedido_status` VALUES (1,'2014-08-15 00:00:00','Aguardando pagamento',0,NULL,NULL,NULL),(2,'2014-08-15 00:00:00','Cancelado',0,NULL,NULL,NULL),(3,'2014-08-15 00:00:00','Pago',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pedido_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_tem_produto`
--

DROP TABLE IF EXISTS `pedido_tem_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_tem_produto` (
  `idProduto` int NOT NULL,
  `idPedido` int NOT NULL,
  `quantidade` int NOT NULL,
  `desconto` tinyint NOT NULL,
  `valor_desconto` float DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idProduto`,`idPedido`),
  KEY `fk_produto_has_pedido_pedido1_idx` (`idPedido`),
  KEY `fk_produto_has_pedido_produto1_idx` (`idProduto`),
  CONSTRAINT `fk_produto_has_pedido_pedido1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_produto_has_pedido_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_tem_produto`
--

LOCK TABLES `pedido_tem_produto` WRITE;
/*!40000 ALTER TABLE `pedido_tem_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_tem_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `is_cover` tinyint(1) DEFAULT '0',
  `thumbnail` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (164,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(165,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(166,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(167,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(168,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(169,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(170,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(171,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(172,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(173,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(174,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(175,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(176,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(177,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(178,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(179,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(180,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(181,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(182,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(183,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(184,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(185,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(186,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(187,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(188,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(189,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(190,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(191,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(192,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(193,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(194,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(195,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(196,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(197,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(198,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(199,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(200,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(201,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(202,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(203,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,NULL),(204,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(205,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(206,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(207,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(208,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(209,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(210,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(211,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(212,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(213,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(214,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(215,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(216,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(217,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(218,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(219,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(220,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(221,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(222,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(223,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(224,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(225,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(226,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(227,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(228,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(229,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(230,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(231,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(232,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(233,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(234,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(235,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(236,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(237,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(238,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(239,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(240,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(241,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(242,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(243,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(244,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(245,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(246,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(247,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(248,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(249,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(250,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(251,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(252,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(253,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(254,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(255,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(256,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(257,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(258,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(259,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(260,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(261,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(262,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(263,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(264,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(265,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(266,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(267,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(268,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(269,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(270,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(271,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(272,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(273,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(274,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(275,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(276,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(277,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(278,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(279,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(280,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(281,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(282,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(283,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(284,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(285,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(286,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(287,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(288,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(289,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(290,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(291,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(292,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(293,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(294,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(295,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(296,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(297,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(298,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(299,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(300,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(301,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(302,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(303,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(304,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(305,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(306,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(307,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(308,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(309,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(310,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(311,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(312,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(313,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(314,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(315,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(316,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(317,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(318,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(319,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(320,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(321,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(322,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(323,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(324,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(325,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(326,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(327,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(328,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(329,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(330,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(331,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(332,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(333,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(334,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(335,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(336,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(337,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(338,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(339,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(340,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(341,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(342,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(343,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(344,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(345,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(346,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(347,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(348,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(349,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(350,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(351,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(352,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(353,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(354,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(355,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(356,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(357,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(358,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(359,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(360,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(361,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(362,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(363,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(364,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(365,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(366,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(367,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(368,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(369,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(370,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(371,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(372,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(373,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(374,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(375,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,0),(376,'http://localhost:3005/uploads/1981701649514738-diminuido.jpg',0,1),(377,'http://localhost:3005/uploads/1991701658529769.jpg',0,0),(378,'http://localhost:3005/uploads/1991701658529769-diminuido.jpg',0,1),(379,'https://storage.googleapis.com/apto34/2001709230356351.jpg',0,0),(380,'https://storage.googleapis.com/apto34/2001709230356351-diminuido.jpg',0,1),(381,'https://storage.googleapis.com/jatoba/2011709230603688.jpg',0,0),(382,'https://storage.googleapis.com/jatoba/2011709230603688-diminuido.jpg',0,1),(383,'https://storage.googleapis.com/jatoba/2201709390840924.jpg',0,0),(384,'https://storage.googleapis.com/jatoba/2201709390840924-thumb.jpg',0,1),(385,'https://storage.googleapis.com/jatoba/2221709512795292.jpg',0,0),(386,'https://storage.googleapis.com/jatoba/2221709512795298.jpg',0,0),(387,'https://storage.googleapis.com/jatoba/2221709512795292-thumb.jpg',0,1),(388,'https://storage.googleapis.com/jatoba/2221709512795298-thumb.jpg',0,1),(389,'https://storage.googleapis.com/jatoba/2221709512795299-thumb.jpg',0,1),(390,'https://storage.googleapis.com/jatoba/2221709512795299.jpg',0,0),(391,'https://storage.googleapis.com/jatoba/2231709514025367-thumb.jpg',0,1),(392,'https://storage.googleapis.com/jatoba/2231709514025361-thumb.jpg',0,1),(393,'https://storage.googleapis.com/jatoba/2231709514025367.jpg',0,0),(394,'https://storage.googleapis.com/jatoba/2231709514025361.jpg',0,0),(395,'https://storage.googleapis.com/jatoba/2231709514025368.jpg',0,0),(396,'https://storage.googleapis.com/jatoba/2231709514025368-thumb.jpg',0,1),(397,'https://storage.googleapis.com/jatoba/2251709514313316.jpg',0,0),(398,'https://storage.googleapis.com/jatoba/2251709514313316-thumb.jpg',0,1),(399,'https://storage.googleapis.com/jatoba/2251709514313323.jpg',0,0),(400,'https://storage.googleapis.com/jatoba/2251709514313323-thumb.jpg',0,1),(401,'https://storage.googleapis.com/jatoba/2261709514374822.jpg',0,0),(402,'https://storage.googleapis.com/jatoba/2261709514374822-thumb.jpg',0,1),(403,'https://storage.googleapis.com/jatoba/2341709515311430.jpg',0,0),(404,'https://storage.googleapis.com/jatoba/2341709515311430-thumb.jpg',0,1),(405,'https://storage.googleapis.com/jatoba/2341709515311435.jpg',0,0),(406,'https://storage.googleapis.com/jatoba/2341709515311435-thumb.jpg',0,1),(407,'https://storage.googleapis.com/jatoba/2371709516380330-thumb.jpg',0,1),(408,'https://storage.googleapis.com/jatoba/2371709516380330.jpg',0,0),(409,'https://storage.googleapis.com/jatoba/2371709516380339-thumb.jpg',0,1),(410,'https://storage.googleapis.com/jatoba/2371709516380339.jpg',0,0),(411,'https://storage.googleapis.com/jatoba/2371709516380340.jpg',0,0),(412,'https://storage.googleapis.com/jatoba/2371709516380341.jpg',0,0),(413,'https://storage.googleapis.com/jatoba/2371709516380341-thumb.jpg',0,1),(414,'https://storage.googleapis.com/jatoba/2371709516380341.jpg',0,0),(415,'https://storage.googleapis.com/jatoba/2371709516380340-thumb.jpg',0,1),(416,'https://storage.googleapis.com/jatoba/2371709516380343.jpg',0,0),(417,'https://storage.googleapis.com/jatoba/2371709516380341-thumb.jpg',0,1),(418,'https://storage.googleapis.com/jatoba/2371709516380343-thumb.jpg',0,1),(419,'https://storage.googleapis.com/jatoba/2371709516380344.jpg',0,0),(420,'https://storage.googleapis.com/jatoba/2371709516380344-thumb.jpg',0,1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `valor_produto` varchar(45) DEFAULT NULL,
  `desativado` tinyint DEFAULT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (222,'Calça Pantalona Veneza Bordô','Calça Pantalona Veneza Bordô','149',0,NULL,'2024-03-04 00:39:55','2024-03-04 00:39:55',100),(223,'Vestido Camponesa Curto Floral Mostarda','Vestido Camponesa Curto Floral Mostarda','189',0,NULL,'2024-03-04 01:00:25','2024-03-04 01:00:25',10),(225,'Kimono Amplo de Viscose Preto','Kimono Amplo de Viscose Preto','100',0,NULL,'2024-03-04 01:05:13','2024-03-04 01:05:13',100),(226,'Calça Pantalona Veneza Bordô','Calça Pantalona Veneza Bordô','100',0,NULL,'2024-03-04 01:06:14','2024-03-04 01:06:14',100);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_categoria`
--

DROP TABLE IF EXISTS `produto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_categoria` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `categoria` varchar(100) NOT NULL,
  `descricao_categoria` varchar(150) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_categoria`
--

LOCK TABLES `produto_categoria` WRITE;
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
INSERT INTO `produto_categoria` VALUES (1,NULL,'Feminino','para moças',0,NULL),(2,NULL,'Masculino ','para moços',0,NULL),(3,NULL,'Teste','teste',0,NULL);
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_subcategoria`
--

DROP TABLE IF EXISTS `produto_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_subcategoria` (
  `id` int NOT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `subcategoria` varchar(100) NOT NULL,
  `descricao_subcategoria` varchar(150) NOT NULL,
  `desativado` tinyint NOT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `produtoCategoriaId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_subcategoria_produto_categoria1_idx` (`produtoCategoriaId`),
  CONSTRAINT `fk_produto_subcategoria_produto_categoria1` FOREIGN KEY (`produtoCategoriaId`) REFERENCES `produto_categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_subcategoria`
--

LOCK TABLES `produto_subcategoria` WRITE;
/*!40000 ALTER TABLE `produto_subcategoria` DISABLE KEYS */;
INSERT INTO `produto_subcategoria` VALUES (1,NULL,'calças','calças',0,NULL,1),(2,NULL,'vestidos','vestidos',0,NULL,1),(3,NULL,'teste','tss',0,NULL,3);
/*!40000 ALTER TABLE `produto_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_cor`
--

DROP TABLE IF EXISTS `produto_tem_cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_tem_cor` (
  `corId` int NOT NULL,
  `produtoId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_has_cor_produto_idx` (`produtoId`),
  KEY `fk_produto_has_cor_cor1_idx` (`corId`),
  CONSTRAINT `fk_produto_has_cor_cor1` FOREIGN KEY (`corId`) REFERENCES `cor` (`id`),
  CONSTRAINT `fk_produto_has_cor_produto` FOREIGN KEY (`produtoId`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_cor`
--

LOCK TABLES `produto_tem_cor` WRITE;
/*!40000 ALTER TABLE `produto_tem_cor` DISABLE KEYS */;
INSERT INTO `produto_tem_cor` VALUES (2,222,10,100),(1,223,11,10),(1,225,13,100),(1,226,14,10);
/*!40000 ALTER TABLE `produto_tem_cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_photo`
--

DROP TABLE IF EXISTS `produto_tem_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_tem_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produtoId` int DEFAULT NULL,
  `photoId` int DEFAULT NULL,
  `is_cover` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_tem_photo_ibfk_1` (`produtoId`),
  KEY `produto_tem_photo_ibfk_2_idx` (`photoId`),
  CONSTRAINT `produto_tem_photo_ibfk_1` FOREIGN KEY (`produtoId`) REFERENCES `produto` (`id`),
  CONSTRAINT `produto_tem_photo_ibfk_2` FOREIGN KEY (`photoId`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_photo`
--

LOCK TABLES `produto_tem_photo` WRITE;
/*!40000 ALTER TABLE `produto_tem_photo` DISABLE KEYS */;
INSERT INTO `produto_tem_photo` VALUES (304,222,385,1),(305,222,386,0),(306,222,388,0),(307,222,387,1),(308,222,389,0),(309,222,390,0),(310,223,391,0),(311,223,394,1),(312,223,393,0),(313,223,396,0),(314,223,392,1),(315,223,395,0),(316,225,397,1),(317,225,399,0),(318,225,398,1),(319,225,400,0),(320,226,401,1),(321,226,402,1);
/*!40000 ALTER TABLE `produto_tem_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_subcategoria`
--

DROP TABLE IF EXISTS `produto_tem_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_tem_subcategoria` (
  `produtoId` int NOT NULL,
  `produtoSubcategoriumId` int NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_1_idx` (`produtoId`),
  KEY `fk_2_idx` (`produtoSubcategoriumId`),
  CONSTRAINT `fk_1` FOREIGN KEY (`produtoId`) REFERENCES `produto` (`id`),
  CONSTRAINT `fk_2` FOREIGN KEY (`produtoSubcategoriumId`) REFERENCES `produto_subcategoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_subcategoria`
--

LOCK TABLES `produto_tem_subcategoria` WRITE;
/*!40000 ALTER TABLE `produto_tem_subcategoria` DISABLE KEYS */;
INSERT INTO `produto_tem_subcategoria` VALUES (222,1,81),(223,2,82),(225,3,84),(226,1,85);
/*!40000 ALTER TABLE `produto_tem_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_tamanho`
--

DROP TABLE IF EXISTS `produto_tem_tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_tem_tamanho` (
  `produtoId` int NOT NULL,
  `tamanhoId` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`produtoId`,`tamanhoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_tamanho`
--

LOCK TABLES `produto_tem_tamanho` WRITE;
/*!40000 ALTER TABLE `produto_tem_tamanho` DISABLE KEYS */;
INSERT INTO `produto_tem_tamanho` VALUES (222,4,100),(223,4,10),(224,4,100),(225,4,100),(226,4,10),(227,6,100),(228,6,100),(236,6,100),(237,6,100);
/*!40000 ALTER TABLE `produto_tem_tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamanho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` VALUES (1,'PP'),(2,'P'),(3,'M'),(4,'G'),(5,'GG'),(6,'EG');
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id` int NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `id_ddd` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  KEY `fk_telefones_ddd1_idx` (`id_ddd`),
  CONSTRAINT `fk_telefones_ddd1` FOREIGN KEY (`id_ddd`) REFERENCES `ddd` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'98268-8074',19);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadora`
--

DROP TABLE IF EXISTS `transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `id_unidade` int NOT NULL,
  `desativado` tinyint NOT NULL DEFAULT '0',
  `data_desativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unidade_UNIQUE` (`id_unidade`),
  KEY `fk_transportadora_unidade1_idx` (`id_unidade`),
  CONSTRAINT `fk_transportadora_unidade1` FOREIGN KEY (`id_unidade`) REFERENCES `unidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadora`
--

LOCK TABLES `transportadora` WRITE;
/*!40000 ALTER TABLE `transportadora` DISABLE KEYS */;
INSERT INTO `transportadora` VALUES (1,'2024-03-03 00:00:00',1,0,NULL);
/*!40000 ALTER TABLE `transportadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idEmpresa` int NOT NULL,
  `data_criacao` datetime NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `idTelefone` int NOT NULL,
  `idEndereco` int NOT NULL,
  `desativado` tinyint NOT NULL DEFAULT '0',
  `data_desativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  KEY `fk_transportadora_telefone1_idx` (`idTelefone`),
  KEY `fk_transportadora_empresa1_idx` (`idEmpresa`),
  KEY `fk_unidade_endereco1_idx` (`idEndereco`),
  CONSTRAINT `fk_transportadora_empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `fk_transportadora_telefone1` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
INSERT INTO `unidade` VALUES (1,1,'2024-03-03 00:00:00','Correios','correior','1',1,1,0,NULL);
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-03 22:58:06
