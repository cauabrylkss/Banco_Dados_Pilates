-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: pilates1
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `cpf` char(11) NOT NULL,
  `dadosSaude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `cep` char(8) NOT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `rua` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cep`),
  UNIQUE KEY `cep` (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES ('10000001','Sao Paulo','Centro','Rua A',100,'ap 101'),('10000002','Sao Paulo','Centro','Rua B',200,''),('10000003','Sao Paulo','Jardim','Avenida C',50,'bloco 1'),('10000004','Sao Paulo','Jardim','Avenida D',75,''),('10000005','Sao Paulo','Vila Nova','Rua E',120,'casa'),('10000006','Campinas','Centro','Rua F',10,''),('10000007','Campinas','Jardim','Rua G',45,'ap 12'),('10000008','Santos','Praia','Avenida H',300,'andar 2'),('10000009','Santos','Centro','Rua I',22,''),('10000010','Sao Jose','Bela Vista','Rua J',80,''),('10000011','Sao Paulo','Vila Velha','Rua K',15,''),('10000012','Sao Paulo','Vila Velha','Rua L',16,''),('10000013','Ribeirao','Centro','Rua M',5,''),('10000014','Jundiai','Centro','Rua N',60,''),('10000015','Sorocaba','Vila','Rua O',90,''),('10000016','Barueri','Centro','Rua P',33,''),('10000017','Osasco','Centro','Rua Q',44,''),('10000018','Braganca','Centro','Rua R',77,''),('10000019','Itu','Centro','Rua S',2,''),('10000020','Guarulhos','Centro','Rua T',11,'');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faxineiro`
--

DROP TABLE IF EXISTS `faxineiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faxineiro` (
  `idFaxineiro` int DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `idFuncionario` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `faxineiro_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `faxineiro_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faxineiro`
--

LOCK TABLES `faxineiro` WRITE;
/*!40000 ALTER TABLE `faxineiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `faxineiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cpf` char(11) NOT NULL,
  `idFuncionario` int NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `idMatricula` int NOT NULL,
  `statusMatricula` enum('pendente','ativa','cancelada') DEFAULT NULL,
  `idPlano` int DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  PRIMARY KEY (`idMatricula`),
  UNIQUE KEY `idMatricula` (`idMatricula`),
  KEY `idPlano` (`idPlano`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `cpf` FOREIGN KEY (`cpf`) REFERENCES `aluno` (`cpf`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`idPlano`) REFERENCES `plano` (`idPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidade`
--

DROP TABLE IF EXISTS `mensalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidade` (
  `idMensalidade` int NOT NULL,
  `dataRecorrencia` int DEFAULT NULL,
  `statusMensalidade` varchar(45) DEFAULT NULL,
  `formaPagamento` varchar(45) DEFAULT NULL,
  `idMatricula` int DEFAULT NULL,
  PRIMARY KEY (`idMensalidade`),
  UNIQUE KEY `idMensalidade` (`idMensalidade`),
  KEY `fk_mensalidade_matricula` (`idMatricula`),
  CONSTRAINT `fk_mensalidade_matricula` FOREIGN KEY (`idMatricula`) REFERENCES `matricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidade`
--

LOCK TABLES `mensalidade` WRITE;
/*!40000 ALTER TABLE `mensalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` char(11) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `cep` (`cep`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`cep`) REFERENCES `endereco` (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `idPlano` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `regrasCancelameto` enum('multa de 20% do valor mensal','multa no valor de uma mensalidade') DEFAULT NULL,
  `beneficios` enum('2 reposicoes mensais','4 reposicoes mensais') DEFAULT NULL,
  PRIMARY KEY (`idPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idProfessor` int NOT NULL,
  `especializacao` enum('educacao fisica','fisioterapia') DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `idFuncionario` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `idProfessor` (`idProfessor`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `idPagamento` int NOT NULL,
  `dataDeposito` int DEFAULT NULL,
  `statusSalario` enum('pago','pendente') DEFAULT NULL,
  `formaDeposito` varchar(45) DEFAULT NULL,
  `valorSalario` int DEFAULT NULL,
  `idFuncionario` int DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  UNIQUE KEY `idPagamento` (`idPagamento`),
  KEY `fk_salario_funcionario` (`idFuncionario`),
  CONSTRAINT `fk_salario_funcionario` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretario`
--

DROP TABLE IF EXISTS `secretario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secretario` (
  `idSecretario` int DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `idFuncionario` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `secretario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`),
  CONSTRAINT `secretario_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretario`
--

LOCK TABLES `secretario` WRITE;
/*!40000 ALTER TABLE `secretario` DISABLE KEYS */;
/*!40000 ALTER TABLE `secretario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `idTurma` int NOT NULL,
  `horario` time NOT NULL,
  `idProfessor` int DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `capacidadeMax` int NOT NULL,
  PRIMARY KEY (`idTurma`),
  UNIQUE KEY `idTurma` (`idTurma`),
  KEY `idProfessor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmaaluno`
--

DROP TABLE IF EXISTS `turmaaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmaaluno` (
  `idTurma` int NOT NULL,
  `idMatricula` int NOT NULL,
  PRIMARY KEY (`idTurma`,`idMatricula`),
  KEY `fk_turmaaluno_matricula` (`idMatricula`),
  CONSTRAINT `fk_turmaaluno_matricula` FOREIGN KEY (`idMatricula`) REFERENCES `matricula` (`idMatricula`),
  CONSTRAINT `fk_turmaaluno_turma` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmaaluno`
--

LOCK TABLES `turmaaluno` WRITE;
/*!40000 ALTER TABLE `turmaaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turmaaluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13 12:59:56
