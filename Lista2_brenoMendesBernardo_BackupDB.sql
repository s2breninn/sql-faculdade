-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dblocadoraviewssps
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Temporary view structure for view `VW_ClientesInadimplentes`
--

DROP TABLE IF EXISTS `VW_ClientesInadimplentes`;
/*!50001 DROP VIEW IF EXISTS `VW_ClientesInadimplentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_ClientesInadimplentes` AS SELECT 
 1 AS `codcliente`,
 1 AS `nome_cliente`,
 1 AS `codfilme`,
 1 AS `nome_filme`,
 1 AS `datalocacao`,
 1 AS `datadevolucaoprevista`,
 1 AS `valorlocacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VW_FilmesAlocadosAcimaDaMedia`
--

DROP TABLE IF EXISTS `VW_FilmesAlocadosAcimaDaMedia`;
/*!50001 DROP VIEW IF EXISTS `VW_FilmesAlocadosAcimaDaMedia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_FilmesAlocadosAcimaDaMedia` AS SELECT 
 1 AS `codfilme`,
 1 AS `nome`,
 1 AS `datalocacao`,
 1 AS `valorlocacao`,
 1 AS `anolancamento`,
 1 AS `MediaValorAlocacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VW_FilmesAlocadosEmMG`
--

DROP TABLE IF EXISTS `VW_FilmesAlocadosEmMG`;
/*!50001 DROP VIEW IF EXISTS `VW_FilmesAlocadosEmMG`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_FilmesAlocadosEmMG` AS SELECT 
 1 AS `codigo_filme`,
 1 AS `filme`,
 1 AS `data_locacao`,
 1 AS `data_devolucao`,
 1 AS `cod_cliente`,
 1 AS `cliente`,
 1 AS `cidade`,
 1 AS `uf`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VW_ListaFilmes`
--

DROP TABLE IF EXISTS `VW_ListaFilmes`;
/*!50001 DROP VIEW IF EXISTS `VW_ListaFilmes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_ListaFilmes` AS SELECT 
 1 AS `codcategoria`,
 1 AS `codfilme`,
 1 AS `nome`,
 1 AS `anolancamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codcategoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ação'),(2,'Aventura'),(3,'Suspense'),(4,'Terror'),(5,'Ficção Científica'),(6,'Animação');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `codcidade` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`codcidade`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Teófilo Otoni','MG'),(2,'Governador Valadares','MG'),(3,'Belo Horizonte','MG'),(4,'Itambacuri','MG'),(5,'Rio de Janeiro','RJ'),(6,'Sao Paulo','SP'),(7,'Rio Grande do Sul','RS'),(9,'Poté','MG'),(10,'Pavão','MG'),(11,'Carlos Chagas','MG');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codcliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `idade` int DEFAULT NULL,
  `codcidadereside` int NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`codcliente`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_cliente_cidade_codcidadereside` (`codcidadereside`),
  CONSTRAINT `fk_cliente_cidade_codcidadereside` FOREIGN KEY (`codcidadereside`) REFERENCES `cidade` (`codcidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'João da Silva','Rua Brasília, 202, Bairro Alípio de Melo',46,3,'M','12345678909'),(2,'João da Silva','Rua Brasília, 202, Bairro Alípio de Melo',46,3,'M','98765432100'),(3,'Antônia Braz','Rua São Paulo, 1200, Bairro Centro',35,1,'F','45678912330'),(4,'Helena Mendes','Av. Getúlio Vergas, 1542, Bairro Centro',28,3,'F','78912345641'),(5,'Roberto Chaves','Tr. São Sebastião, 38-A, Bairro Belvedere',NULL,3,'M','32165498760');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `codfilme` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `anolancamento` int NOT NULL,
  `codcategoria` int NOT NULL,
  PRIMARY KEY (`codfilme`),
  KEY `fk_cliente_categoria_codcategoria` (`codcategoria`),
  CONSTRAINT `fk_cliente_categoria_codcategoria` FOREIGN KEY (`codcategoria`) REFERENCES `categoria` (`codcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Matrix Revolution',2002,1),(2,'Missão Impossível',2005,1),(3,'Máquina Mortífera 4',2009,1),(4,'O Senhor dos Aneis: Pedra Filosofal',2001,2),(5,'Madagascar 3',2010,6),(6,'Velozes e Furiosos 6',2013,1);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `codcliente` int NOT NULL,
  `codfilme` int NOT NULL,
  `datalocacao` date NOT NULL,
  `datadevolucaoprevista` date NOT NULL,
  `datadevolucao` date DEFAULT NULL,
  `valorlocacao` float(8,2) NOT NULL,
  `statuslocacao` char(1) NOT NULL COMMENT 'D- Devolvido\nE- Empréstimo',
  PRIMARY KEY (`codcliente`,`codfilme`,`datalocacao`),
  KEY `fk_locacao_filme_codfilme` (`codfilme`),
  CONSTRAINT `fk_locacao_cliente_codcliente` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`codcliente`),
  CONSTRAINT `fk_locacao_filme_codfilme` FOREIGN KEY (`codfilme`) REFERENCES `filme` (`codfilme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,2,'2014-10-15','2014-10-20','2014-10-20',3.50,'D'),(1,3,'2015-01-09','2015-01-11','2015-01-11',2.50,'D'),(2,3,'2017-04-04','2017-04-07','2017-04-15',3.50,'D'),(3,2,'2014-10-22','2014-10-23','2014-10-25',3.50,'D'),(4,1,'2016-08-10','2016-08-12','2016-10-22',2.80,'D'),(4,3,'2016-10-17','2016-10-21',NULL,4.00,'E');
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dblocadoraviewssps'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_ClientesAdimplentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_ClientesAdimplentes`(_CPFCliente VARCHAR(11)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE filmes_em_atraso INT;
    
    -- Conta o número de locações em atraso para o cliente especificado
    SELECT COUNT(*) INTO filmes_em_atraso
    FROM locacao l
    JOIN cliente c ON l.codcliente = c.codcliente
    WHERE c.cpf = _CPFCliente
    AND l.datadevolucao > l.datadevolucaoprevista;
    
    -- Se não há filmes em atraso, retorna 0, caso contrário, retorna a quantidade de filmes em atraso
    IF filmes_em_atraso = 0 THEN
        RETURN 0;
    ELSE
        RETURN filmes_em_atraso;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_VerificarCidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_VerificarCidade`(_NomeCidade VARCHAR(50), _UFCidade CHAR(2)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE _RETORNO, _CODIGOCID INTEGER; -- DECLARAÇÃO
    SET _RETORNO = -1; -- ATRIBUIÇÃO DE VALOR
    SET _CODIGOCID = 0; -- ATRIBUIÇÃO DE VALOR
    
    SELECT 
		codcidade INTO _CODIGOCID
    FROM 
		cidade
    WHERE 
		(nome LIKE _NomeCidade) AND
        (uf LIKE _UFCidade);
    
    IF (_CODIGOCID != 0) THEN
		SET _RETORNO = _CODIGOCID;
    END IF;
    
	RETURN _RETORNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CadastrarCidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CadastrarCidade`(IN _NomeCidade VARCHAR(50),
									IN _UFCidade CHAR(2),
									OUT _RetornoCodCidade INTEGER)
BEGIN
	DECLARE _CODIGOCID INTEGER;
    
	SET _CODIGOCID = 0;

	SELECT
		FN_VerificarCidade(_NomeCidade, _UFCidade) INTO _CODIGOCID;
	
    IF (_CODIGOCID = -1) THEN 
		INSERT INTO cidade (nome, uf) VALUES (_NomeCidade, _UFCidade);
	END IF;
    SET _RetornoCodCidade = _CODIGOCID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DevolverFilme` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DevolverFilme`(
    IN p_codcliente INT,         -- Identificador do cliente
    IN p_codfilme INT,           -- Identificador do filme
    IN p_datadevolucao DATE      -- Data de devolução
)
BEGIN
    -- Atualiza a data de devolução e o status para devolvido
    UPDATE locacao
    SET datadevolucao = p_datadevolucao,
        statuslocacao = 'D'
    WHERE codcliente = p_codcliente
    AND codfilme = p_codfilme
    AND statuslocacao = 'E';    -- Somente atualiza se a locação estiver em andamento (status 'E')
    
    -- Adicione aqui verificações ou lógica adicional, se necessário.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TotalLocacaoFilmesPorAno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TotalLocacaoFilmesPorAno`()
BEGIN
    SELECT
		year(datalocacao) as ano,
		COUNT(*) total_locacao_ano
	FROM locacao
	GROUP BY 
		YEAR(datalocacao)
	ORDER BY 
		ano;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `VW_ClientesInadimplentes`
--

/*!50001 DROP VIEW IF EXISTS `VW_ClientesInadimplentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_ClientesInadimplentes` AS select `c`.`codcliente` AS `codcliente`,`c`.`nome` AS `nome_cliente`,`f`.`codfilme` AS `codfilme`,`f`.`nome` AS `nome_filme`,`l`.`datalocacao` AS `datalocacao`,`l`.`datadevolucaoprevista` AS `datadevolucaoprevista`,`l`.`valorlocacao` AS `valorlocacao` from ((`cliente` `c` join `locacao` `l` on((`c`.`codcliente` = `l`.`codcliente`))) join `filme` `f` on((`l`.`codfilme` = `f`.`codfilme`))) where ((`l`.`datadevolucaoprevista` < curdate()) and (`l`.`datadevolucao` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VW_FilmesAlocadosAcimaDaMedia`
--

/*!50001 DROP VIEW IF EXISTS `VW_FilmesAlocadosAcimaDaMedia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_FilmesAlocadosAcimaDaMedia` AS select `f`.`codfilme` AS `codfilme`,`f`.`nome` AS `nome`,`l`.`datalocacao` AS `datalocacao`,`l`.`valorlocacao` AS `valorlocacao`,`f`.`anolancamento` AS `anolancamento`,`media`.`MediaValorAlocacao` AS `MediaValorAlocacao` from ((`filme` `f` join `locacao` `l` on((`f`.`codfilme` = `l`.`codfilme`))) join (select avg(`l`.`valorlocacao`) AS `MediaValorAlocacao` from (`locacao` `l` join `filme` `f` on((`l`.`codfilme` = `f`.`codfilme`))) where (`f`.`anolancamento` between 2016 and 2018)) `media` on((`l`.`valorlocacao` > `media`.`MediaValorAlocacao`))) where (`f`.`anolancamento` between 2016 and 2018) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VW_FilmesAlocadosEmMG`
--

/*!50001 DROP VIEW IF EXISTS `VW_FilmesAlocadosEmMG`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_FilmesAlocadosEmMG` AS select `f`.`codfilme` AS `codigo_filme`,`f`.`nome` AS `filme`,`loc`.`datalocacao` AS `data_locacao`,`loc`.`datadevolucao` AS `data_devolucao`,`cli`.`codcliente` AS `cod_cliente`,`cli`.`nome` AS `cliente`,`cid`.`nome` AS `cidade`,`cid`.`uf` AS `uf` from (((`cliente` `cli` join `cidade` `cid` on((`cli`.`codcidadereside` = `cid`.`codcidade`))) join `locacao` `loc` on((`loc`.`codcliente` = `cli`.`codcliente`))) join `filme` `f` on((`f`.`codfilme` = `loc`.`codfilme`))) where ((`cid`.`uf` = 'MG') and (`loc`.`statuslocacao` = 'E')) order by `loc`.`datalocacao` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VW_ListaFilmes`
--

/*!50001 DROP VIEW IF EXISTS `VW_ListaFilmes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_ListaFilmes` AS select `c`.`codcategoria` AS `codcategoria`,`f`.`codfilme` AS `codfilme`,`f`.`nome` AS `nome`,`f`.`anolancamento` AS `anolancamento` from (`filme` `f` join `categoria` `c` on((`f`.`codcategoria` = `c`.`codcategoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-28 20:22:17
