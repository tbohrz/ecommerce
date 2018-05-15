-- MySQL Administrator dump 1.4
-- ATUALIZADO EM 11 de FEV de 2016, por Ademir Gabardo.
-- ------------------------------------------------------
-- Server version	5.6.16-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;


--
-- Create schema loja
--

CREATE DATABASE IF NOT EXISTS loja;
USE loja;

--
-- Definition of table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



--
-- Definition of table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


--
-- Definition of table `classes_metodos`
--

DROP TABLE IF EXISTS `classes_metodos`;
CREATE TABLE `classes_metodos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classe` varchar(255) NOT NULL,
  `metodo` varchar(255) NOT NULL,
  `nome_amigavel` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes_metodos`
--

/*!40000 ALTER TABLE `classes_metodos` DISABLE KEYS */;
INSERT INTO `classes_metodos` (`id`,`classe`,`metodo`,`nome_amigavel`) VALUES
 (1,'categorias','index','index - categorias'),
 (2,'categorias','alterar','alterar - categorias'),
 (3,'categorias','adicionar','adicionar - categorias'),
 (4,'home','index','index - home'),
 (5,'home','login','login - home'),
 (6,'produtos','index','index - produtos'),
 (7,'usuarios','sem_permissao','sem_permissao - usuarios'),
 (8,'clientes','index','index - clientes'),
 (9,'pedidos','index','index - pedidos'),
 (10,'transportadoras','index','index - transportadoras'),
 (11,'usuarios','index','index - usuarios'),
 (12,'usuarios','efetuar_login','efetuar_login - usuarios'),
 (13,'usuarios','logout','logout - usuarios'),
 (14,'usuarios','permissoes','permissoes - usuarios'),
 (15,'transportadoras','adicionar','adicionar - transportadoras'),
 (16,'clientes','detalhes','detalhes - clientes'),
 (17,'clientes','alterar','alterar - clientes'),
 (18,'clientes','excluir','excluir - clientes'),
 (19,'categorias','excluir','excluir - categorias'),
 (20,'produtos','adicionar','adicionar - produtos'),
 (21,'produtos','alterar','alterar - produtos'),
 (22,'pedidos','detalhes','detalhes - pedidos'),
 (23,'pedidos','excluir','excluir - pedidos'),
 (24,'transportadoras','excluir','excluir - transportadoras'),
 (25,'usuarios','alterar_permissoes','alterar_permissoes - usuarios'),
 (26,'usuarios','adicionar','adicionar - usuarios'),
 (27,'usuarios','alterar','alterar - usuarios'),
 (28,'usuarios','excluir','excluir - usuarios'),
 (29,'usuarios','salvar_alteracao','salvar_alteracao - usuarios');
/*!40000 ALTER TABLE `classes_metodos` ENABLE KEYS */;


--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(245) NOT NULL,
  `sobrenome` varchar(145) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `data_nascimento` datetime NOT NULL,
  `sexo` char(1) NOT NULL,
  `rua` varchar(145) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `bairro` varchar(145) NOT NULL,
  `cidade` varchar(145) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `email` varchar(145) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cadastrado_em` datetime NOT NULL DEFAULT '2016-02-11 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF_Unico` (`cpf`),
  UNIQUE KEY `Email_Unico` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;



--
-- Definition of table `clientes_log`
--

DROP TABLE IF EXISTS `clientes_log`;
CREATE TABLE `clientes_log` (
  `id` int(10) unsigned NOT NULL,
  `nome` varchar(245) NOT NULL,
  `sobrenome` varchar(145) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `data_nascimento` datetime NOT NULL,
  `sexo` char(1) NOT NULL,
  `rua` varchar(145) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `bairro` varchar(145) NOT NULL,
  `cidade` varchar(145) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `email` varchar(145) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cadastrado_em` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientes_log`
--

/*!40000 ALTER TABLE `clientes_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_log` ENABLE KEYS */;


--
-- Definition of table `itens_pedidos`
--

DROP TABLE IF EXISTS `itens_pedidos`;
CREATE TABLE `itens_pedidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pedido` int(10) unsigned NOT NULL,
  `item` varchar(45) NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



--
-- Definition of table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` timestamp NOT NULL DEFAULT '2016-02-11 00:00:00',
  `cliente` int(10) unsigned NOT NULL,
  `produtos` decimal(10,2) NOT NULL,
  `frete` decimal(10,2) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `comentarios` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;



--
-- Definition of table `permissoes`
--

DROP TABLE IF EXISTS `permissoes`;
CREATE TABLE `permissoes` (
  `usuario` int(10) unsigned NOT NULL,
  `metodo` int(10) unsigned NOT NULL,
  UNIQUE KEY `Chave_unica` (`usuario`,`metodo`),
  KEY `FK_metodo` (`metodo`),
  CONSTRAINT `FK_metodo` FOREIGN KEY (`metodo`) REFERENCES `classes_metodos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissoes`
--

/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;
INSERT INTO `permissoes` (`usuario`,`metodo`) VALUES
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (1,5),
 (1,6),
 (1,7),
 (1,8),
 (1,9),
 (1,10),
 (1,11),
 (1,12),
 (1,13),
 (1,14),
 (1,15),
 (1,16),
 (1,17),
 (1,18),
 (1,19),
 (1,20),
 (1,21),
 (1,22),
 (1,23),
 (1,24),
 (1,25),
 (1,26),
 (1,27),
 (1,28),
 (1,29);
/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;


--
-- Definition of table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `largura_caixa_mm` int(10) unsigned NOT NULL,
  `altura_caixa_mm` int(10) unsigned NOT NULL,
  `comprimento_caixa_mm` int(10) unsigned NOT NULL,
  `peso_gramas` int(10) unsigned NOT NULL,
  `data_adicionado` datetime NOT NULL DEFAULT '2016-02-11 00:00:00',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_unico` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;



--
-- Definition of table `produtos_categorias`
--

DROP TABLE IF EXISTS `produtos_categorias`;
CREATE TABLE `produtos_categorias` (
  `produto` int(10) unsigned NOT NULL,
  `categoria` int(10) unsigned NOT NULL,
  UNIQUE KEY `unique_produto_categoria` (`produto`,`categoria`),
  KEY `FK_produtos_categorias_categoria` (`categoria`),
  CONSTRAINT `FK_produtos_categorias_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_produtos_categorias_produto` FOREIGN KEY (`produto`) REFERENCES `produtos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`,`login`,`senha`) VALUES
 (1,'admin','12345');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;




/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
