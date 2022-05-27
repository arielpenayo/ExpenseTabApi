/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.29 : Database - expensetab
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

/*Table structure for table `emailer` */

DROP TABLE IF EXISTS `emailer`;

CREATE TABLE `emailer` (
  `emailer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `emailer_to` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `emailer_subject` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `emailer_text` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `emailer_estado` int NOT NULL DEFAULT '2' COMMENT '2 a enviar | 1 enviado | 0 anulado',
  PRIMARY KEY (`emailer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

/*Data for the table `emailer` */

insert  into `emailer`(`emailer_id`,`emailer_to`,`emailer_subject`,`emailer_text`,`emailer_estado`) values 
(50,'ariel_penayo@hotmail.com','Restablecer Cuenta','Haga click en el siguiente enlace para restablecer su contraseña: \n\nhttp://localhost:3456/#!/usuario-activar/ariel_penayo@hotmail.com/6bdfa10d0a09d9119fc346d8a0695f18',1),
(51,'ariel_penayo@hotmail.com','Restablecer Cuenta','Haga click en el siguiente enlace para restablecer su contraseña: \n\nhttp://localhost:3456/#!/usuario-activar/ariel_penayo@hotmail.com/4737bd6877817a24b1dbcfba3c00b3ed',1),
(52,'ariel_penayo@hotmail.com','Restablecer Cuenta','Haga click en el siguiente enlace para restablecer su contraseña: \n\nhttp://localhost:6060/#!/usuario-activar/ariel_penayo@hotmail.com/8f32b5c02e01227de7c57b3e3e3a1ad8',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transaccion` */

insert  into `transaccion`(`transaccionId`,`categoriaId`,`transaccionMonto`,`transaccionFecha`,`usuarioId`,`usuarioCuentaId`,`transaccionObservacion`) values 
(1,6,500000,'2022-04-17',1,1,'carga de saldo'),
(2,1,550000,'2022-04-06',1,1,'compre remedios'),
(3,4,880000,'2022-04-08',1,1,'Casamiento de Carlos'),
(4,4,350000,'2022-04-15',1,1,'Cumple de Jose'),
(5,5,600000,'2022-04-16',1,1,'Campamento'),
(6,5,300000,'2022-05-10',1,1,'Cena en Belsitt'),
(7,4,222222,'2022-05-10',1,1,'cumple de miguel');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuarioId` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioNombreApellido` varchar(200) NOT NULL,
  `usuarioCorreo` varchar(100) NOT NULL,
  `usuarioContrasenha` text,
  `usuarioCategoria` tinyint DEFAULT '1',
  `usuarioObservacion` text,
  PRIMARY KEY (`usuarioId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`usuarioId`,`usuarioNombreApellido`,`usuarioCorreo`,`usuarioContrasenha`,`usuarioCategoria`,`usuarioObservacion`) values 
(1,'Ariel Penayo','ariel_penayo@hotmail.com','8f32b5c02e01227de7c57b3e3e3a1ad8',1,NULL),
(2,'jose gutierrez','jose_gutierrez@gmail.com','4900d0a19b6894a4a514e9ff3afcc2c0',2,'Economista Pais (Country Economist) de Paraguay at CAF - Banco de Desarrollo de América Latina');

/*Table structure for table `usuario_asesorado` */

DROP TABLE IF EXISTS `usuario_asesorado`;

CREATE TABLE `usuario_asesorado` (
  `usuarioAsesoradoId` int unsigned NOT NULL AUTO_INCREMENT,
  `asesoradorId` int unsigned DEFAULT NULL,
  `asesoradoId` int unsigned DEFAULT NULL,
  `usuarioAsesoradoEstado` tinyint DEFAULT NULL,
  PRIMARY KEY (`usuarioAsesoradoId`),
  UNIQUE KEY `UK_asesorado_asesorador` (`asesoradorId`,`asesoradoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usuario_asesorado` */

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

/*Table structure for table `usuario_asesorado_ext` */

DROP TABLE IF EXISTS `usuario_asesorado_ext`;

/*!50001 DROP VIEW IF EXISTS `usuario_asesorado_ext` */;
/*!50001 DROP TABLE IF EXISTS `usuario_asesorado_ext` */;

/*!50001 CREATE TABLE  `usuario_asesorado_ext`(
 `usuarioAsesoradoId` int unsigned ,
 `asesoradoId` int unsigned ,
 `asesoradoNombreApellido` varchar(200) ,
 `asesoradoCorreo` varchar(100) ,
 `asesoradorId` int unsigned ,
 `asesoradorNombreApellido` varchar(200) ,
 `usuarioAsesoradoEstado` tinyint 
)*/;

/*View structure for view transaccion_gpby_categoria */

/*!50001 DROP TABLE IF EXISTS `transaccion_gpby_categoria` */;
/*!50001 DROP VIEW IF EXISTS `transaccion_gpby_categoria` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `transaccion_gpby_categoria` AS select `transaccion`.`categoriaId` AS `categoriaId`,max(`categoria`.`categoriaDenominacion`) AS `categoriaDenominacion`,sum(`transaccion`.`transaccionMonto`) AS `transaccionMonto`,max(`transaccion`.`usuarioId`) AS `usuarioId`,month(`transaccion`.`transaccionFecha`) AS `transaccionFechaMes`,year(`transaccion`.`transaccionFecha`) AS `transaccionFechaAnho`,`categoria`.`categoriaEstado` AS `categoriaEstado` from (`transaccion` left join `categoria` on((`transaccion`.`categoriaId` = `categoria`.`categoriaId`))) group by `transaccion`.`categoriaId`,month(`transaccion`.`transaccionFecha`),year(`transaccion`.`transaccionFecha`) */;

/*View structure for view transaccionext */

/*!50001 DROP TABLE IF EXISTS `transaccionext` */;
/*!50001 DROP VIEW IF EXISTS `transaccionext` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `transaccionext` AS select `transaccion`.`transaccionId` AS `transaccionId`,`transaccion`.`categoriaId` AS `categoriaId`,`categoria`.`categoriaDenominacion` AS `categoriaDenominacion`,`transaccion`.`transaccionMonto` AS `transaccionMonto`,`transaccion`.`transaccionFecha` AS `transaccionFecha`,`transaccion`.`usuarioId` AS `usuarioId`,`usuario`.`usuarioNombreApellido` AS `usuarioNombreApellido`,month(`transaccion`.`transaccionFecha`) AS `transaccionFechaMes`,`categoria`.`categoriaEstado` AS `categoriaEstado`,`transaccion`.`transaccionObservacion` AS `transaccionObservacion` from ((`transaccion` left join `categoria` on((`transaccion`.`categoriaId` = `categoria`.`categoriaId`))) left join `usuario` on((`transaccion`.`usuarioId` = `usuario`.`usuarioId`))) */;

/*View structure for view usuario_asesorado_ext */

/*!50001 DROP TABLE IF EXISTS `usuario_asesorado_ext` */;
/*!50001 DROP VIEW IF EXISTS `usuario_asesorado_ext` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usuario_asesorado_ext` AS select `usuario_asesorado`.`usuarioAsesoradoId` AS `usuarioAsesoradoId`,`usuario_asesorado`.`asesoradoId` AS `asesoradoId`,`asesorado`.`usuarioNombreApellido` AS `asesoradoNombreApellido`,`asesorado`.`usuarioCorreo` AS `asesoradoCorreo`,`usuario_asesorado`.`asesoradorId` AS `asesoradorId`,`asesorador`.`usuarioNombreApellido` AS `asesoradorNombreApellido`,`usuario_asesorado`.`usuarioAsesoradoEstado` AS `usuarioAsesoradoEstado` from ((`usuario_asesorado` left join `usuario` `asesorado` on((`usuario_asesorado`.`asesoradoId` = `asesorado`.`usuarioId`))) left join `usuario` `asesorador` on((`usuario_asesorado`.`asesoradorId` = `asesorador`.`usuarioId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
