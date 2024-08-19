-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtriggers
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auditoria` (
  `Data` datetime NOT NULL,
  `Descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `caixa` (
  `CodCaixa` int(11) NOT NULL AUTO_INCREMENT,
  `DataCaixa` date NOT NULL,
  `SaldoInicial` decimal(10,2) NOT NULL,
  `SaldoFinal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'2019-03-21',100.00,150.50),(3,'2019-03-28',200.00,200.00),(4,'2019-04-01',300.00,325.50);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `CodCliente` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCliente` varchar(50) NOT NULL,
  `Idade` int(11) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Cpf` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  PRIMARY KEY (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Manuela da Silva',25,'F','66644477799','1995-03-03'),(17,'Antônio da Silva',65,'M','11122233344','1955-05-05'),(18,'Maria da Silva',45,'F','55566644499','1975-01-10'),(19,'José da Silva',32,'M','88877733311','1988-06-13');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departamento` (
  `CodDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Telefone` char(10) DEFAULT NULL,
  `TotalSalarios` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Financeiro','3332502189',4100.50),(2,'Tecnologia da Informação','3332502190',1000.00);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dependente` (
  `CodFuncionario` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `DataNascimento` datetime NOT NULL,
  `GrauParentesco` varchar(15) NOT NULL,
  PRIMARY KEY (`Nome`,`CodFuncionario`),
  KEY `fk_dep_func_codfunc_idx` (`CodFuncionario`),
  CONSTRAINT `fk_dep_func_codfunc` FOREIGN KEY (`CodFuncionario`) REFERENCES `funcionario` (`CodFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (2,'Alice Silva','2000-01-01 00:00:00','Filho(a)'),(2,'Eloisa Silva','2002-02-02 00:00:00','Filho(a)');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empregado` (
  `CodEmpregado` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `CodDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`CodEmpregado`),
  KEY `FK_DEPTO_CODDEPTO_idx` (`CodDepartamento`),
  CONSTRAINT `FK_DEPTO_CODDEPTO` FOREIGN KEY (`CodDepartamento`) REFERENCES `departamento` (`CodDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1,'Ana Maria','F',2000.00,1),(2,'Ana Julia','F',1500.50,1),(3,'Thiago Silva','M',1000.00,2),(4,'João Roberto','M',600.00,1);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `emprestimo` (
  `CodEmprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `CodCliente` int(11) NOT NULL,
  `DataEmprestimo` date NOT NULL,
  `MontanteEmprestimo` decimal(10,2) NOT NULL,
  `MontanteDevido` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodEmprestimo`),
  KEY `CodCliente_idx` (`CodCliente`),
  CONSTRAINT `CodClienteEmprestimo` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimoparcela`
--

DROP TABLE IF EXISTS `emprestimoparcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `emprestimoparcela` (
  `CodEmprestimo` int(11) NOT NULL,
  `NumParcela` int(11) NOT NULL,
  `DataVencimento` date NOT NULL,
  `DataPagamento` date DEFAULT NULL,
  `ValorPagar` decimal(10,2) NOT NULL,
  `ValorPago` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodEmprestimo`,`NumParcela`),
  CONSTRAINT `FK_EMPPARC_CODEMPRESTIMO` FOREIGN KEY (`CodEmprestimo`) REFERENCES `emprestimo` (`CodEmprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimoparcela`
--

LOCK TABLES `emprestimoparcela` WRITE;
/*!40000 ALTER TABLE `emprestimoparcela` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimoparcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionario` (
  `CodFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (2,'Roberta Silva','F',2000.00);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedido`
--

DROP TABLE IF EXISTS `itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itempedido` (
  `CodPedido` int(11) NOT NULL,
  `NumeroItem` int(11) NOT NULL,
  `ValorUnitario` decimal(8,2) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL,
  PRIMARY KEY (`CodPedido`,`NumeroItem`),
  KEY `CodProduto_idx` (`CodProduto`) /*!80000 INVISIBLE */,
  CONSTRAINT `CodPedido` FOREIGN KEY (`CodPedido`) REFERENCES `pedido` (`CodPedido`),
  CONSTRAINT `CodProduto` FOREIGN KEY (`CodProduto`) REFERENCES `produto` (`CodProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedido`
--

LOCK TABLES `itempedido` WRITE;
/*!40000 ALTER TABLE `itempedido` DISABLE KEYS */;
INSERT INTO `itempedido` VALUES (1,1,8.50,1,6),(1,2,21.40,2,5);
/*!40000 ALTER TABLE `itempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `CodPedido` int(11) NOT NULL AUTO_INCREMENT,
  `CodCliente` int(11) NOT NULL,
  `DataPedido` date NOT NULL,
  `ValorTotal` decimal(8,2) NOT NULL,
  PRIMARY KEY (`CodPedido`),
  KEY `CodCliente_idx` (`CodCliente`),
  CONSTRAINT `CodCliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2020-02-12',29.90);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto` (
  `CodProduto` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`CodProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (5,'Açúcar 5Kg',350),(6,'Feijão Carioquinha 1Kg',550),(7,'Sabonete Lux 120g',1500);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vendas` (
  `IdVenda` int(11) NOT NULL AUTO_INCREMENT,
  `DataHoraVenda` datetime NOT NULL,
  `ValorVenda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdVenda`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (8,'2019-03-21 21:59:06',50.50),(9,'2019-04-01 21:21:48',25.50);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06  8:53:33
