/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.21 : Database - zeroacidente
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zeroacidente` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `zeroacidente`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (2,'2014_10_12_100000_create_password_resets_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (3,'2019_08_19_000000_create_failed_jobs_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (4,'2020_11_19_014804_create_permission_tables',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (5,'2020_11_19_020107_create_products_table',2);
insert  into `migrations`(`id`,`migration`,`batch`) values (6,'2020_11_19_031834_create_perguntas_table',3);
insert  into `migrations`(`id`,`migration`,`batch`) values (7,'2020_11_19_031834_create_respostas_table',3);
insert  into `migrations`(`id`,`migration`,`batch`) values (8,'2020_11_19_031836_add_foreign_keys_to_perguntas_table',3);
insert  into `migrations`(`id`,`migration`,`batch`) values (9,'2020_11_19_031836_add_foreign_keys_to_respostas_table',3);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',1);
insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',3);
insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',6);
insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',7);
insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',8);
insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',9);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values ('wagnerggg@gmail.com','$2y$10$dnFrg/66D47gdLc.nL7ZneIo1UAu8TMzXTA8Bj/RUry/D0v375sJq','2020-11-20 03:42:03');

/*Table structure for table `perguntas` */

DROP TABLE IF EXISTS `perguntas`;

CREATE TABLE `perguntas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizz_id` bigint NOT NULL,
  `enunciado` varchar(500) NOT NULL,
  `texto` text,
  `ordem` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_perguntas_quiz1_idx` (`quizz_id`),
  CONSTRAINT `fk_perguntas_quiz1` FOREIGN KEY (`quizz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `perguntas` */

insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (1,1,'	 O “batedor” é um veículo autorizado para trafegar na mina, para qual finalidade?	',NULL,1);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (2,1,'	 Em área de mina, é obrigatório que veículos e equipamentos trafeguem sempre com os faróis acesos, mesmo durante o dia. Podemos dizer que esta afirmativa é:	',NULL,2);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (3,1,'	 Durante o deslocamento de veículos/equipamentos na mesma direção, a distância mínima de uma para o outro deve ser de no mínimo:	',NULL,3);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (4,1,'	 Sempre que se ausentar de um veículo/equipamento é obrigatório desligar e retirar a chave da ignição deixando o veículo sempre engrenado apenas. Podemos dizer que esta afirmativa é:	',NULL,4);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (5,1,'	 Durante uma manobra de ultrapassagem qual deve ser a distância lateral entre equipamentos?	',NULL,5);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (6,2,'	 Qual é o objetivo do Projeto Mãos Seguras?	',NULL,1);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (7,2,'	 Qual é o papel do empregado no Projeto Mãos Seguras?	',NULL,2);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (8,2,'	 Quem pode participar do Projeto Mãos Seguras?	',NULL,3);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (9,2,'	 O Projeto Mãos Seguras tem por objetivo motivar e reconhecer aos mesmos empregados que fazem tarefas arriscando suas mãos, para que  proponham novas formas de execução dessas mesmas tarefas através de propostas de criação de  dispositivos simples e eficazes, eliminando a exposição das mãos aos riscos de acidentes. Esta afirmação está:	',NULL,4);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (10,2,'	 Após a criação de um Projeto Mãos Seguras, onde ele pode ser usado?	',NULL,5);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (11,3,'	 A diretriz “utilize proteção contra queda para trabalhar acima de 2 metros de altura” está relacionada a qual Regra de Ouro?	',NULL,1);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (12,3,'	 O que a Regra de Ouro nº 1 para Bloqueio de Equipamentos estabelece?	',NULL,2);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (13,3,'	 Escolha a opção que melhor completa a Regra de Ouro nº 8 Cinto de Segurança: Utilize o cinto de segurança durante a operação de equipamentos móveis e veículos. Responsabilidade do ________________	',NULL,3);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (14,3,'	 A Disciplina Operacional e estar empenhado a trabalhar com segurança, fazendo cada tarefa, de maneira correta, o tempo todo. É a constância na execução de tarefas, padrões, procedimentos, regras de trabalho, todas as vezes, da maneira como elas foram especificadas, descritas e planejadas. Esta afirmativa é:	',NULL,4);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (15,3,'	 Na Regra de Ouro nº 9 para Basculamento de Caminhões, qual é a distância a ser respeitada quando houver manobrista.	',NULL,5);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (16,4,'	 A PPT deve contemplar as medidas de controle para os riscos identificados na fase de planejamento, na qual deve-se considerar condições seguras para liberação de equipamento ou trabalho a ser executado. Esta afirmativa é:	',NULL,1);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (17,4,'	 A emissão de uma PPT em branco sem a definição do trabalho a ser executado, sem a delimitação exata da área ou sem a prévia inspeção do local, constitui que tipo de falta?	',NULL,2);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (18,4,'	 Considera-se Premissa Básica para o uso da ART	',NULL,3);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (19,4,'	 Após o término do serviço, qual o tempo mínimo que a Análise de Riscos da Tarefa (ART) deve ser guardada?	',NULL,4);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (20,4,'	 Em uma tarefa a ser realizada foi constatada a não alteração dos riscos no ambiente de trabalho. Neste caso, a revalidação da Análise de Riscos da Tarefa (ART) por ser feita por quantos dias consecutivos?	',NULL,5);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (21,5,'	 Como é definida a modalidade de treinamento de uma empresa contratada para exercer atividades na MUSA	',NULL,1);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (22,5,'	 Assinale a alternativa que representa a responsabilidade dos gestores de contrato.	',NULL,2);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (23,5,'	 Com relação ao Plano de Manutenção de Maquinas e equipamento é incorreto afirmar:	',NULL,3);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (24,5,'	 A validade do treinamento de Integração é indeterminada desde que o empregado permaneça na mesma empresa e não fique afastado da Mineração Usiminas, por um período superior a 6 (seis) meses. Essa afirmativa é:	',NULL,4);
insert  into `perguntas`(`id`,`quizz_id`,`enunciado`,`texto`,`ordem`) values (25,5,'	 Com relação a Matriz de Identificação de Perigos, Avaliação de Riscos e Determinação de Controles (APR) é correto afirmar.	',NULL,5);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'role-list','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (2,'role-create','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (3,'role-edit','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (4,'role-delete','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (5,'product-list','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (6,'product-create','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (7,'product-edit','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (8,'product-delete','web','2020-11-19 02:21:11','2020-11-19 02:21:11');
insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (9,'participante-index','web',NULL,NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`detail`,`created_at`,`updated_at`) values (2,'Teste','Teste','2020-11-19 02:41:35','2020-11-19 02:41:35');
insert  into `products`(`id`,`name`,`detail`,`created_at`,`updated_at`) values (3,'aa','aaa','2020-11-17 11:37:38',NULL);

/*Table structure for table `quizzes` */

DROP TABLE IF EXISTS `quizzes`;

CREATE TABLE `quizzes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  `descricao` text,
  `dataInicio` timestamp NOT NULL,
  `dataFim` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `quizzes` */

insert  into `quizzes`(`id`,`nome`,`descricao`,`dataInicio`,`dataFim`,`created_at`,`updated_at`) values (1,'QUIZ 1º DIA – CONDUÇÃO DE VEÍCULOS, MÁQUINAS E EQUIPAMENTOS',NULL,'2020-11-23 00:00:00','2020-11-23 23:59:59','2020-11-19 17:14:18',NULL);
insert  into `quizzes`(`id`,`nome`,`descricao`,`dataInicio`,`dataFim`,`created_at`,`updated_at`) values (2,'QUIZ 2º DIA – MÃOS SEGURAS',NULL,'2020-11-24 00:00:00','2020-11-24 23:59:59','2020-11-19 17:14:18',NULL);
insert  into `quizzes`(`id`,`nome`,`descricao`,`dataInicio`,`dataFim`,`created_at`,`updated_at`) values (3,'QUIZ 3º DIA – DISCIPLINA OPERACIONAL/REGRAS DE OURO',NULL,'2020-11-25 00:00:00','2020-11-25 23:59:59','2020-11-19 17:14:18',NULL);
insert  into `quizzes`(`id`,`nome`,`descricao`,`dataInicio`,`dataFim`,`created_at`,`updated_at`) values (4,'QUIZ 4º DIA – ART E PPT',NULL,'2020-11-26 00:00:00','2020-11-26 23:59:59','2020-11-19 17:14:18',NULL);
insert  into `quizzes`(`id`,`nome`,`descricao`,`dataInicio`,`dataFim`,`created_at`,`updated_at`) values (5,'QUIZ 5º DIA – GESTORES DE CONTRATO',NULL,'2020-11-27 00:00:00','2020-11-27 23:59:59','2020-11-19 17:14:18',NULL);

/*Table structure for table `respondidas` */

DROP TABLE IF EXISTS `respondidas`;

CREATE TABLE `respondidas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint unsigned NOT NULL,
  `respostas_id` bigint NOT NULL,
  `perguntas_id` bigint NOT NULL,
  `correta` tinyint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opcoes_respondidas_respostas1_idx` (`respostas_id`),
  KEY `fk_opcoes_respondidas_perguntas1_idx` (`perguntas_id`),
  KEY `fk_opcoes_respondidas_users1_idx` (`users_id`),
  CONSTRAINT `fk_opcoes_respondidas_perguntas1` FOREIGN KEY (`perguntas_id`) REFERENCES `perguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_opcoes_respondidas_respostas1` FOREIGN KEY (`respostas_id`) REFERENCES `respostas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_opcoes_respondidas_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `respondidas` */

insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (91,1,22,6,0,'2020-11-20 21:58:17','2020-11-20 21:58:17');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (92,1,26,7,0,'2020-11-20 21:58:25','2020-11-20 21:58:25');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (93,1,34,8,0,'2020-11-20 21:58:37','2020-11-20 21:58:37');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (94,1,35,9,1,'2020-11-20 21:58:45','2020-11-20 21:58:45');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (95,1,41,10,0,'2020-11-20 21:58:53','2020-11-20 21:58:53');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (96,9,5,1,0,'2020-11-21 14:31:48','2020-11-21 14:31:48');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (97,9,6,2,1,'2020-11-21 14:31:56','2020-11-21 14:31:56');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (98,9,11,3,0,'2020-11-21 14:32:03','2020-11-21 14:32:03');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (99,9,14,4,0,'2020-11-21 14:32:10','2020-11-21 14:32:10');
insert  into `respondidas`(`id`,`users_id`,`respostas_id`,`perguntas_id`,`correta`,`created_at`,`updated_at`) values (100,9,17,5,0,'2020-11-21 14:32:16','2020-11-21 14:32:16');

/*Table structure for table `respostas` */

DROP TABLE IF EXISTS `respostas`;

CREATE TABLE `respostas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `perguntas_id` bigint NOT NULL,
  `ordem` char(1) NOT NULL,
  `texto` text NOT NULL,
  `correta` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_respostas_perguntas1_idx` (`perguntas_id`),
  CONSTRAINT `fk_respostas_perguntas1` FOREIGN KEY (`perguntas_id`) REFERENCES `perguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `respostas` */

insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (1,1,'A','	 Destinado especialmente para o transporte de cargas em mina ou similares e não possuem autorização para trafegar em rodovia.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (2,1,'B','	 Destinado ao abastecimento e lubrificação de equipamentos no campo.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (3,1,'C','	 Destinado ao acompanhamento e sinalização da movimentação de equipamentos móveis, semimóveis e veículos leves durante a locomoção e condições especiais.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (4,1,'D','	 Destinado para umidificação de vias e placas.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (5,1,'E','	 Destinados à realização dos processos de lavra tais como: perfuração, escavação, transporte e atividades de apoio na mina.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (6,2,'A','	 Verdadeira	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (7,2,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (8,3,'A','	 10 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (9,3,'B','	 20 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (10,3,'C','	 30 metros	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (11,3,'D','	 40 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (12,3,'E','	 50 metros 	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (13,4,'A','	 Verdadeira	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (14,4,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (15,5,'A','	 1 metro	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (16,5,'B','	 2 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (17,5,'C','	 3 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (18,5,'D','	 4 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (19,5,'E','	 5 metros	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (20,6,'A','	 Eliminar a exposição das mãos aos riscos.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (21,6,'B','	 Evitar o improviso.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (22,6,'C','	 Padronizar estabelecer critérios de utilização.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (23,6,'D','	 Fortalecer a disciplina operacional.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (24,6,'E','	 Todas as alternativas anteriores estão corretas.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (25,7,'A','	 Avaliar os dispositivos  propostos, verifica o  catálogo de Projetos Mãos  Seguras e o mercado, e  desenvolve projeto de  fabricação.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (26,7,'B','	 Avaliar as tarefas de risco  registradas, questionam se  podem ser eliminadas, além  disto, vira um compromisso  de solução dos gestores.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (27,7,'C','	 Registrar as tarefas onde haja exposição das mãos a riscos e propor ideias/sugestões de dispositivos.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (28,7,'D','	 Avaliar os riscos ergonômicos  dos dispositivos propostos e  confirma a eliminação do risco  identificado pelos empregados.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (29,7,'E','	 Providenciar fabricação e  fornecimento dos  dispositivos  aprovados.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (30,8,'A','	 Apenas empregados próprios	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (31,8,'B','	 Apenas empregados de empresas contratadas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (32,8,'C','	 Todos os empregados (próprios e contatados)	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (33,8,'D','	 Apenas os gerentes	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (34,8,'E','	 Apenas os supervisores	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (35,9,'A','	 Verdadeira	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (36,9,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (37,10,'A','	 Apenas pelo empregado que criou o projeto	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (38,10,'B','	 Apenas na Mineração Usiminas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (39,10,'C','	 Em qualquer Unidade da Usiminas, desde que aplicável	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (40,10,'D','	 Apenas na gerência onde o projeto foi criado	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (41,10,'E','	 Apenas após autorização do criador do projeto	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (42,11,'A','	Regra nº 3 Trabalho em Altura	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (43,11,'B','	Regra nº 1 Bloqueio de Equipamento	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (44,11,'C','	Regra nº 6 Mãos Seguras	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (45,11,'D','	Regra nº 4 Carga Suspenda/Equipamentos Móveis	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (46,11,'E','	Regra nº 2 Acesso a Locais de Risco	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (47,12,'A','	 Certifique-se de que a proteção da máquina está adequada antes de operá-la	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (48,12,'B','	 Somente opere equipamentos móveis e veículos com a devida autorização e cumpra seus requisitos de imobilização	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (49,12,'C','	 Mantenha-se fora do raio de ação de cargas suspensas e equipamentos em movimento	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (50,12,'D','	 Obedeça ao procedimento de bloqueio antes de iniciar a intervenção em equipamentos	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (51,12,'E','	 Use sempre os dispositivos homologados para proteção das mãos em atividades manuais com os risco de corte, pensamento ou esmagamento	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (52,13,'A','	Condutor	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (53,13,'B','	Condutor e de cada passageiro	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (54,13,'C','	Passageiros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (55,13,'D','	Passageiro no banco da frente	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (56,13,'E','	 Passageiro no banco de trás	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (57,14,'A','	 Verdadeira	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (58,14,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (59,15,'A','	3 metros	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (60,15,'B','	5 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (61,15,'C','	1 metro	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (62,15,'D','	2 metros	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (63,15,'E','	4 metros 	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (64,16,'A','	 Verdadeira	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (65,16,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (66,17,'A','	 Moderada	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (67,17,'B','	 Leve	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (68,17,'C','	 Catastrófica	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (69,17,'D','	 Grave	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (70,17,'E','	 Improvável	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (71,18,'A','	 O empregado deve estar treinado para elaboração da ART e ter conhecimento da tarefa a ser realizada	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (72,18,'B','	 A ART é uma ferramenta/técnica utilizada para aplicação consistente no planejamento de SSO, para realização das atividades, por isso deve ser elaborada e aprovada antes do início do trabalho	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (73,18,'C','	 Ao fazer uma ART, as experiências e questionamentos das pessoas que participam da atividade devem ser positivamente explorados	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (74,18,'D','	 Estar de posse da Ordem de Serviço/ Manutenção, quando aplicável	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (75,18,'E','	 Todas as alternativas anteriores estão corretas	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (76,19,'A','	 12 horas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (77,19,'B','	 6 horas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (78,19,'C','	 24 horas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (79,19,'D','	 3 horas	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (80,19,'E','	 48 horas	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (81,20,'A','	3 dias	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (82,20,'B','	5 dias	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (83,20,'C','	1 dias	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (84,20,'D','	7 dias	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (85,20,'E','	9 dias 	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (86,21,'A','	 Deve ser preenchido o formulário de classificação de risco do contrato, para verificar a categoria de risco e considerar também o tempo de duração do contrato.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (87,21,'B','	 Através da classificação de riscos.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (88,21,'C','	 Através do tempo do contrato.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (89,21,'D','	 Deve ser verificado o nº de empregados mobilizados no contrato.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (90,21,'E','	 Deve ser verificado se a empresa irá executar atividades de alto risco.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (91,22,'A','	 Assegurar que a empresa contratada cumpra todos os requisitos legais e/ou determinados pela MUSA.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (92,22,'B','	 Convocar o Setor de Segurança do Trabalho – Gestão de Contratadas da MUSA para as reuniões de kick-off.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (93,22,'C','	 Avaliar periodicamente, o desempenho em SSO da contratada.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (94,22,'D','	 Aplicar as medidas administrativas previstas no contrato em caso do descumprimento de procedimentos de SSO por parte da contratada.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (95,22,'E','	 Todas as alternativas estão corretas	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (96,23,'A','	 Os veículos e equipamentos que necessitam acessar as dependências da Mineração Usiminas devem possuir plano de manutenção preventiva de forma a mantê-los em condições seguras de operação. 	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (97,23,'B','	 As manutenções (preventiva e corretiv devem ser elaboradas e registradas sob a responsabilidade técnica de um profissional legalmente habilitado.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (98,23,'C','	 O plano de manutenção deverá ser encaminhado para comissionamento do equipamento.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (99,23,'D','	 O plano de manutenção somente é necessário para novos equipamentos que serão comissionados.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (100,23,'E','	 A empresa contratada deve manter a disposição, os manuais de operação e manutenção dos equipamentos quando necessário.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (101,24,'A','	 Verdadeira	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (102,24,'B','	 Falsa	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (103,25,'A','	 Toda empresa contratada deverá elaborar Matriz de Identificação de Perigos, Avaliação de Riscos e Determinação de Controles (APR) seguindo metodologia definida pela MUSA.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (104,25,'B','	 A APR deve ser aprovada pelo Gestor de Contrato.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (105,25,'C','	 A APR deverá ser divulgada a todos os empregados e estar disponível para consulta e em local de fácil acesso, para os empregados.	',0);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (106,25,'D','	 Todas as alternativas estão corretas.	',1);
insert  into `respostas`(`id`,`perguntas_id`,`ordem`,`texto`,`correta`) values (107,25,'E','	 Caso sejam identificadas atividades críticas, a empresa contratada deverá elaborar procedimento ou Instrução de Trabalho para avaliação e controle de tais riscos.	',0);

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (2,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (3,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (4,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (5,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (6,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (7,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (8,1);
insert  into `role_has_permissions`(`permission_id`,`role_id`) values (9,2);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'Admin','web','2020-11-19 02:22:31','2020-11-19 02:22:31');
insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (2,'Votante','web',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `enterprise` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (1,'Wagner Gomes Gonçalves','wagnerggg@gmail.com',NULL,'$2y$10$9GcnZydx4I89i9Z0uzdFj.SkFUeRhgS.YGAv893d/zWN9cJ4LhrnS','YjNetuhL9KMXdqTegXO5qDmSpAIUwrbvub86wAxLAncemzAGhlQ4Bg2IUTu0','2020-11-19 02:22:31','2020-11-20 20:40:04','+5531998477163','aaaaa');
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (3,'FLAVIA RODRIGUES CANTAGALLI','flavia.cantagalli@hotmail.com',NULL,'$2y$10$RjmkVINcwTMhzFyWqRQCUulYRXWYcOzpLVsqZmBgoToVHi.yFGXkK','hoT4NoY04OPYohJ7PUa75nQ4QKRoKpLXWScvUplKvnVmDQNtnraLtQFBp5hd','2020-11-20 03:03:03','2020-11-20 20:02:17','aaa','bbb');
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (4,'FLAVIA RODRIGUES CANTAGALLI','flavia.cantagalli@hotmail.com2',NULL,'$2y$10$Y9aXiabaIQZ6JXRMnUCAGewADiAzVVohkEVybwe3o/gZiguw/Mhxq',NULL,'2020-11-20 00:54:10','2020-11-20 00:54:10',NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (6,'Alexandre','alexandre@atma.com.br',NULL,'$2y$10$pA31.Jp9Q7Dak7Iq.HfXX.mJS6y14x./.kswEV.LLlzUid7yIgrbW',NULL,'2020-11-20 21:35:50','2020-11-20 21:35:50',NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (7,'aaa','wagnergggg@gmail.comg',NULL,'$2y$10$TCguPyekD0I1MxO7gNN.6.m2AY9j24qyvAOxo/SiwQNknri2bEFIe',NULL,'2020-11-21 13:15:22','2020-11-21 13:15:22',NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (8,'Teste','teste@teste.com.br',NULL,'$2y$10$HZOUpVc.77FwY7/h8nyWi.bopiE8ugNKp5LUzMAwMhvyk4NA2kEfW',NULL,'2020-11-21 14:10:56','2020-11-21 14:10:56',NULL,NULL);
insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`phone`,`enterprise`) values (9,'Teste 2','teste2@teste.com.br',NULL,'$2y$10$5yG0L/bbarnWvjwDCO379erJWFnfuG/IAsMIDWIhIyTGCkvbb7pNe',NULL,'2020-11-21 14:13:05','2020-11-21 14:13:05','Teste 2','Teste 2');

/*Table structure for table `vranking` */

DROP TABLE IF EXISTS `vranking`;

/*!50001 DROP VIEW IF EXISTS `vranking` */;
/*!50001 DROP TABLE IF EXISTS `vranking` */;

/*!50001 CREATE TABLE  `vranking`(
 `id` bigint unsigned ,
 `name` varchar(255) ,
 `email` varchar(255) ,
 `phone` varchar(45) ,
 `enterprise` varchar(100) ,
 `corretas` bigint ,
 `created_at` timestamp ,
 `posicao` int ,
 `respostas` bigint 
)*/;

/*Table structure for table `vresumo` */

DROP TABLE IF EXISTS `vresumo`;

/*!50001 DROP VIEW IF EXISTS `vresumo` */;
/*!50001 DROP TABLE IF EXISTS `vresumo` */;

/*!50001 CREATE TABLE  `vresumo`(
 `id` bigint unsigned ,
 `name` varchar(255) ,
 `corretas` bigint 
)*/;

/*View structure for view vranking */

/*!50001 DROP TABLE IF EXISTS `vranking` */;
/*!50001 DROP VIEW IF EXISTS `vranking` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vranking` AS select `u`.`id` AS `id`,`u`.`name` AS `name`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`enterprise` AS `enterprise`,`r`.`corretas` AS `corretas`,`u`.`created_at` AS `created_at`,(select find_in_set(`r1`.`corretas`,(select group_concat(`r2`.`corretas` order by `r2`.`corretas` DESC separator ',') from `vresumo` `r2`)) AS `posicao` from `vresumo` `r1` where (`r1`.`id` = `u`.`id`)) AS `posicao`,(select count(`r1`.`perguntas_id`) from (`respondidas` `r1` join `perguntas` `p1` on((`p1`.`id` = `r1`.`perguntas_id`))) where (`r1`.`users_id` = `u`.`id`)) AS `respostas` from (`users` `u` left join `vresumo` `r` on((`r`.`id` = `u`.`id`))) */;

/*View structure for view vresumo */

/*!50001 DROP TABLE IF EXISTS `vresumo` */;
/*!50001 DROP VIEW IF EXISTS `vresumo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vresumo` AS select `u`.`id` AS `id`,`u`.`name` AS `name`,count(`r`.`correta`) AS `corretas` from (`users` `u` join `respondidas` `r` on((`r`.`users_id` = `u`.`id`))) where (`r`.`correta` = 1) group by `u`.`id` order by `corretas` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
