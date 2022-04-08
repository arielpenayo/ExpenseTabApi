/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.28-0ubuntu0.20.04.3 : Database - expensetab
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expensetab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `expensetab`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `categoriaId` int unsigned NOT NULL AUTO_INCREMENT,
  `categoriaDenominacion` text NOT NULL,
  `categoriaEstado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoriaId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`categoriaId`,`categoriaDenominacion`,`categoriaEstado`) values 
(1,'Salud',1),
(2,'Transporte',1),
(3,'Restaurantes',1),
(4,'Regalos',1),
(5,'Tiempo Libre',1),
(6,'Carga de Saldo',1);

/*Table structure for table `transaccion` */

DROP TABLE IF EXISTS `transaccion`;

CREATE TABLE `transaccion` (
  `transaccionId` int unsigned NOT NULL AUTO_INCREMENT,
  `categoriaId` int NOT NULL,
  `transaccionMonto` decimal(10,0) NOT NULL,
  `transaccionFecha` date NOT NULL,
  `usuarioId` int NOT NULL,
  `usuarioCuentaId` int NOT NULL,
  `transaccionObservacion` text,
  PRIMARY KEY (`transaccionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transaccion` */

insert  into `transaccion`(`transaccionId`,`categoriaId`,`transaccionMonto`,`transaccionFecha`,`usuarioId`,`usuarioCuentaId`,`transaccionObservacion`) values 
(1,6,500000,'2022-04-17',1,1,'carga de saldo'),
(2,1,550000,'2022-04-06',1,1,'compre remedios'),
(3,2,880000,'2022-04-08',1,1,'regalo'),
(4,4,350000,'2022-04-15',1,1,NULL),
(5,5,600000,'2022-04-16',1,1,NULL);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuarioId` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioNombreApellido` varchar(200) NOT NULL,
  `usuarioCorreo` varchar(100) NOT NULL,
  `usuarioContrasenha` text,
  `usuarioCategoria` tinyint DEFAULT '1',
  PRIMARY KEY (`usuarioId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`usuarioId`,`usuarioNombreApellido`,`usuarioCorreo`,`usuarioContrasenha`,`usuarioCategoria`) values 
(1,'Ariel Penayo','ariel_penayo@hotmail.com','4900d0a19b6894a4a514e9ff3afcc2c0',1);

/*Table structure for table `usuario_cuenta` */

DROP TABLE IF EXISTS `usuario_cuenta`;

CREATE TABLE `usuario_cuenta` (
  `usuarioCuentaId` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioCuentaDescripcion` text NOT NULL,
  `usuarioId` int NOT NULL,
  PRIMARY KEY (`usuarioCuentaId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usuario_cuenta` */

insert  into `usuario_cuenta`(`usuarioCuentaId`,`usuarioCuentaDescripcion`,`usuarioId`) values 
(1,'Tarjeta de Credito Atlas',1),
(2,'Tarjeta de debito Atlas',1);

/*Table structure for table `transaccion_gpby_categoria` */

DROP TABLE IF EXISTS `transaccion_gpby_categoria`;

/*!50001 DROP VIEW IF EXISTS `transaccion_gpby_categoria` */;
/*!50001 DROP TABLE IF EXISTS `transaccion_gpby_categoria` */;

/*!50001 CREATE TABLE  `transaccion_gpby_categoria`(
 `categoriaId` int ,
 `categoriaDenominacion` text ,
 `transaccionMonto` decimal(32,0) ,
 `usuarioId` int ,
 `transaccionFechaMes` int ,
 `transaccionFechaAnho` int ,
 `categoriaEstado` tinyint 
)*/;

/*Table structure for table `transaccionext` */

DROP TABLE IF EXISTS `transaccionext`;

/*!50001 DROP VIEW IF EXISTS `transaccionext` */;
/*!50001 DROP TABLE IF EXISTS `transaccionext` */;

/*!50001 CREATE TABLE  `transaccionext`(
 `transaccionId` int unsigned ,
 `categoriaId` int ,
 `categoriaDenominacion` text ,
 `transaccionMonto` decimal(10,0) ,
 `transaccionFecha` date ,
 `usuarioId` int ,
 `usuarioNombreApellido` varchar(200) ,
 `transaccionFechaMes` int ,
 `categoriaEstado` tinyint ,
 `transaccionObservacion` text 
)*/;

/*View structure for view transaccion_gpby_categoria */

/*!50001 DROP TABLE IF EXISTS `transaccion_gpby_categoria` */;
/*!50001 DROP VIEW IF EXISTS `transaccion_gpby_categoria` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaccion_gpby_categoria` AS select `transaccion`.`categoriaId` AS `categoriaId`,max(`categoria`.`categoriaDenominacion`) AS `categoriaDenominacion`,sum(`transaccion`.`transaccionMonto`) AS `transaccionMonto`,max(`transaccion`.`usuarioId`) AS `usuarioId`,month(`transaccion`.`transaccionFecha`) AS `transaccionFechaMes`,year(`transaccion`.`transaccionFecha`) AS `transaccionFechaAnho`,`categoria`.`categoriaEstado` AS `categoriaEstado` from (`transaccion` left join `categoria` on((`transaccion`.`categoriaId` = `categoria`.`categoriaId`))) group by `transaccion`.`categoriaId`,month(`transaccion`.`transaccionFecha`),year(`transaccion`.`transaccionFecha`) */;

/*View structure for view transaccionext */

/*!50001 DROP TABLE IF EXISTS `transaccionext` */;
/*!50001 DROP VIEW IF EXISTS `transaccionext` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaccionext` AS select `transaccion`.`transaccionId` AS `transaccionId`,`transaccion`.`categoriaId` AS `categoriaId`,`categoria`.`categoriaDenominacion` AS `categoriaDenominacion`,`transaccion`.`transaccionMonto` AS `transaccionMonto`,`transaccion`.`transaccionFecha` AS `transaccionFecha`,`transaccion`.`usuarioId` AS `usuarioId`,`usuario`.`usuarioNombreApellido` AS `usuarioNombreApellido`,month(`transaccion`.`transaccionFecha`) AS `transaccionFechaMes`,`categoria`.`categoriaEstado` AS `categoriaEstado`,`transaccion`.`transaccionObservacion` AS `transaccionObservacion` from ((`transaccion` left join `categoria` on((`transaccion`.`categoriaId` = `categoria`.`categoriaId`))) left join `usuario` on((`transaccion`.`usuarioId` = `usuario`.`usuarioId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
