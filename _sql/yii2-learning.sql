/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : yii2-learning

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-14 19:36:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `application_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` varchar(50) NOT NULL,
  `application_type_id` int(11) unsigned DEFAULT NULL,
  `application_status_id` int(11) unsigned DEFAULT NULL,
  `select_id` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT 'Join with organisation_id',
  `created_by` int(11) unsigned DEFAULT NULL,
  `submitted_by` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT '1000-01-01 00:00:00',
  `submitted_at` datetime DEFAULT '1000-01-01 00:00:00',
  `previous_application_id` int(11) unsigned DEFAULT NULL,
  `ammendment_parent_application_id` int(11) unsigned DEFAULT NULL,
  `personnel_parent_application_id` int(11) unsigned DEFAULT NULL,
  `establishment_parent_application_id` int(11) unsigned DEFAULT NULL,
  `ar_parent_application_id` int(11) unsigned DEFAULT NULL,
  `inbox_status` tinyint(4) DEFAULT 0,
  `withdrawal_status` tinyint(4) DEFAULT 0,
  `surrender_status` int(11) unsigned DEFAULT 0,
  `surrender_parent_application_id` int(11) unsigned DEFAULT NULL,
  `withdrawal_parent_application_id` int(11) unsigned DEFAULT NULL,
  `staff_id` int(11) unsigned DEFAULT NULL,
  `second_staff_id` int(11) unsigned DEFAULT NULL,
  `application_previous_status_id` int(11) unsigned DEFAULT NULL,
  `application_return_from_establishment` tinyint(1) unsigned DEFAULT NULL,
  `application_activeness` tinyint(4) unsigned DEFAULT 1,
  `app_migrate` tinyint(4) NOT NULL DEFAULT 0,
  `application_establishment_license_type` int(4) unsigned DEFAULT NULL COMMENT '1=Manufacturer, 2=Ar, 3=None',
  `application_cof_active` tinyint(4) DEFAULT 0 COMMENT 'For Change Of Notification',
  `organisation_id` int(11) unsigned DEFAULT NULL,
  `manufacturer` int(11) unsigned DEFAULT NULL,
  `ar` int(11) unsigned DEFAULT NULL,
  `distributor` int(11) unsigned DEFAULT NULL,
  `importer` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `application_type_id` (`application_type_id`),
  KEY `application_status_id` (`application_status_id`),
  KEY `application_ibfk_10` (`ar_parent_application_id`),
  KEY `application_ibfk_11` (`surrender_parent_application_id`),
  KEY `application_ibfk_12` (`withdrawal_parent_application_id`),
  KEY `application_ibfk_13` (`staff_id`),
  KEY `application_ibfk_14` (`second_staff_id`),
  KEY `application_ibfk_15` (`application_previous_status_id`),
  KEY `application_ibfk_16` (`organisation_id`),
  KEY `application_ibfk_3` (`user_id`),
  KEY `application_ibfk_4` (`created_by`),
  KEY `application_ibfk_5` (`submitted_by`),
  KEY `application_ibfk_6` (`previous_application_id`),
  KEY `application_ibfk_7` (`ammendment_parent_application_id`),
  KEY `application_ibfk_8` (`personnel_parent_application_id`),
  KEY `application_ibfk_9` (`establishment_parent_application_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`application_type_id`) REFERENCES `master_type` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_10` FOREIGN KEY (`ar_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_11` FOREIGN KEY (`surrender_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_12` FOREIGN KEY (`withdrawal_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_13` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_14` FOREIGN KEY (`second_staff_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_15` FOREIGN KEY (`application_previous_status_id`) REFERENCES `master_status` (`status_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_16` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`organisation_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`application_status_id`) REFERENCES `master_status` (`status_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_5` FOREIGN KEY (`submitted_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_6` FOREIGN KEY (`previous_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_7` FOREIGN KEY (`ammendment_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_8` FOREIGN KEY (`personnel_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_9` FOREIGN KEY (`establishment_parent_application_id`) REFERENCES `application` (`application_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of application
-- ----------------------------

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('frontend_user', '1', '1517902136');
INSERT INTO `auth_assignment` VALUES ('frontend_user', '2', '1518077494');
INSERT INTO `auth_assignment` VALUES ('frontend_user', '3', '1518143283');
INSERT INTO `auth_assignment` VALUES ('frontend_user', '4', '1518603488');
INSERT INTO `auth_assignment` VALUES ('frontend_user', '5', '1518604200');
INSERT INTO `auth_assignment` VALUES ('frontend_user', '6', '1518604299');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/create/item', '2', 'Create Item', null, null, '1517885616', '1517885616');
INSERT INTO `auth_item` VALUES ('/delete/item', '2', 'Delete Item', null, null, '1517885616', '1517885616');
INSERT INTO `auth_item` VALUES ('/update/item', '2', 'Update Item', null, null, '1517885616', '1517885616');
INSERT INTO `auth_item` VALUES ('frontend_user', '1', null, null, null, '1517885616', '1517885616');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `item_product_id` varchar(11) NOT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT 0,
  `item_price` varchar(10) DEFAULT '0.00',
  `item_brand` varchar(255) DEFAULT NULL,
  `item_model` varchar(255) DEFAULT NULL,
  `item_company_manufacturer` varchar(255) DEFAULT NULL,
  `item_manufactured_country_address` int(11) unsigned DEFAULT NULL,
  `item_manufactured_state_address` int(11) unsigned DEFAULT NULL,
  `item_manufactured_city_address` int(11) unsigned DEFAULT NULL,
  `item_manufactured_postcode_address` int(6) DEFAULT NULL,
  `item_manufactured_street_address` varchar(255) DEFAULT NULL,
  `item_manufactured_no_address` varchar(10) DEFAULT NULL,
  `item_weight` varchar(10) DEFAULT NULL,
  `item_size_height` varchar(10) DEFAULT NULL,
  `item_size_width` varchar(10) DEFAULT NULL,
  `item_size_length` varchar(10) DEFAULT NULL,
  `item_manufactured_date` datetime DEFAULT NULL,
  `item_availability_date_start` datetime DEFAULT NULL,
  `item_availability_date_end` datetime DEFAULT NULL,
  `item_registered_on_system_date` datetime DEFAULT current_timestamp(),
  `item_updated_on_system_date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `item_activeness` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`item_id`),
  KEY `item_ibfk_1` (`item_manufactured_country_address`),
  KEY `item_manufactured_state_address` (`item_manufactured_state_address`),
  KEY `item_manufactured_city_address` (`item_manufactured_city_address`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_manufactured_country_address`) REFERENCES `master_negara` (`negara_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`item_manufactured_state_address`) REFERENCES `master_negeri` (`negeri_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`item_manufactured_city_address`) REFERENCES `master_daerah` (`daerah_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', 'Span', 'FT-04539', 'Household', '17', '511.53', 'Acetaminophen, Phenylephrine Hydrochloride', 'TL', 'Boehm-Walker', '133', '7', '5', '39525', '223 Rigney Drive', '02', '15.11', '58.71', '245.19', '92.80', '2018-02-20 00:00:00', '2018-03-17 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('2', 'Trippledex', 'IE-97968', 'Apparatus', '64', '66.56', 'HEADCHES PAINFUL MENSTRUATION', 'Jetta', 'Kassulke, Treutel and D\'Amore', '133', '7', '5', '75005', '601 New Castle Center', '63', '10.89', '35.91', '120.24', '285.79', '2018-02-15 00:00:00', '2018-03-02 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('3', 'Sub-Ex', 'TI-55068', 'Apparatus', '47', '711.61', 'FLU', 'Savana', 'Kilback-Kiehn', '133', '7', '3', '29981', '2 Farwell Lane', '16', '20.60', '90.21', '38.46', '427.89', '2018-02-24 00:00:00', '2018-03-08 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('4', 'Lotlux', 'DS-82968', 'Household', '45', '224.99', 'BLUEBERRY', 'Touareg', 'Crooks, Tremblay and VonRueden', '133', '7', '5', '14939', '825 Debs Junction', '91', '1.21', '440.81', '43.79', '221.22', '2018-02-24 00:00:00', '2018-03-26 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('5', 'Tempsoft', 'AB-40271', 'Work Tools', '72', '783.56', 'Carvedilol', 'Pajero', 'Kunze-Treutel', '133', '7', '4', '47741', '0 Shelley Hill', '26', '5.75', '481.16', '184.81', '453.45', '2018-02-19 00:00:00', '2018-03-11 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('6', 'Sub-Ex', 'BI-63645', 'Apparatus', '61', '987.27', 'Venlafaxine Hydrochloride', 'Talon', 'Stokes and Sons', '133', '7', '3', '56867', '8860 Hollow Ridge Park', '73', '10.09', '280.40', '3.43', '337.16', '2018-02-06 00:00:00', '2018-03-14 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('7', 'Rank', 'DG-38558', 'Hybrid', '19', '982.34', 'COMBIVIR', 'G35', 'Russel and Sons', '133', '7', '6', '17512', '4 Northland Place', '98', '9.57', '76.00', '214.35', '217.12', '2018-02-01 00:00:00', '2018-03-30 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('8', 'Daltfresh', 'YL-80664', 'Household', '94', '280.63', 'Benazepril Hydrochloride', 'Sportvan G20', 'O\'Connell-Walter', '133', '7', '4', '36934', '0 Troy Drive', '45', '20.84', '56.58', '214.06', '367.33', '2018-02-03 00:00:00', '2018-03-29 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('9', 'Mat Lam Tam', 'BW-64385', 'Hybrid', '5', '548.48', 'Ocean Potion Instant Dry 50 Dab-On Spotstick', 'Avalon', 'Hamill-Nicolas', '133', '7', '5', '48117', '760 Bunker Hill Plaza', '43', '2.86', '264.84', '94.60', '255.87', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('10', 'Voltsillam', 'AS-40535', 'Apparatus', '80', '728.38', 'Gabapentin', 'Legacy', 'Gerlach-Goyette', '133', '7', '4', '88959', '61412 Raven Court', '71', '27.90', '241.90', '143.14', '316.88', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('11', 'Solarbreeze', 'XR-14291', 'Work Tools', '94', '763.20', 'Fluoxetine', 'DBS', 'Abernathy and Sons', '133', '7', '5', '93234', '6 Lake View Park', '55', '28.25', '432.66', '196.66', '491.10', '2018-02-13 00:00:00', '2018-03-09 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('12', 'Voltsillam', 'PU-01340', 'Hybrid', '81', '183.23', 'Colchicum Chelidonium', 'Rondo', 'Heidenreich Inc', '133', '7', '4', '24433', '1 Meadow Valley Park', '48', '21.51', '416.69', '267.16', '286.34', '2018-02-19 00:00:00', '2018-03-10 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('13', 'Bytecard', 'VU-60059', 'Household', '23', '26.74', 'Topical 60 Sec Sodium Fluoride', 'Silverado 1500', 'Muller LLC', '133', '7', '5', '55937', '5 Artisan Trail', '63', '2.22', '34.32', '255.98', '198.40', '2018-02-20 00:00:00', '2018-03-06 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('14', 'It', 'MJ-72874', 'Gadget', '73', '488.86', 'Fluphenazine Hydrochloride', 'Expedition EL', 'Romaguera Group', '133', '7', '2', '59346', '32 Di Loreto Trail', '20', '6.50', '437.05', '58.62', '74.02', '2018-02-19 00:00:00', '2018-03-12 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('15', 'Tresom', 'YJ-37286', 'Gadget', '45', '717.00', 'Metoclopramide', 'QX56', 'Turcotte, Howe and Windler', '133', '7', '3', '49997', '84 Logan Terrace', '42', '13.21', '249.65', '185.66', '178.20', '2018-02-01 00:00:00', '2018-03-01 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('16', 'Quo Lux', 'YU-85120', 'Household', '43', '245.98', 'Thymus Mercurius', 'Skylark', 'Schaefer, Heller and Miller', '133', '7', '4', '63261', '70017 Bultman Place', '95', '5.00', '475.20', '47.69', '392.02', '2018-02-11 00:00:00', '2018-03-13 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('17', 'Asoka', 'TH-85132', 'Apparatus', '7', '191.70', 'Butorphanol Tartrate', 'Cooper Clubman', 'Simonis LLC', '133', '7', '3', '16971', '4529 Union Trail', '13', '11.10', '118.93', '23.18', '302.66', '2018-02-24 00:00:00', '2018-03-15 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('18', 'Viva', 'DB-76289', 'Gadget', '65', '811.22', 'Arbonne Made in the Shade', 'Legacy', 'Lindgren and Sons', '133', '7', '3', '62607', '322 Carpenter Parkway', '92', '20.68', '320.62', '396.67', '354.39', '2018-02-15 00:00:00', '2018-03-16 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('19', 'Stringtough', 'JI-93179', 'Household', '39', '498.20', 'Neutrogena Naturals Acne Cleanser', 'SLK55 AMG', 'Breitenberg-Rosenbaum', '133', '7', '2', '3613', '21952 Mayfield Crossing', '83', '24.96', '187.72', '98.32', '476.90', '2018-02-11 00:00:00', '2018-03-27 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('20', 'Zathin', 'VW-75047', 'Work Tools', '83', '593.27', 'Naltrexone Hydrochloride', 'Uplander', 'Price Group', '133', '7', '2', '47745', '8 Waywood Circle', '28', '27.84', '211.48', '180.85', '80.35', '2018-02-25 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('21', 'Bitwolf', 'LD-33983', 'Hybrid', '91', '101.60', 'Trichophyton Mixture', 'Grand Prix', 'McDermott LLC', '133', '7', '2', '17881', '4143 Glacier Hill Point', '39', '4.89', '269.57', '439.23', '461.73', '2018-02-23 00:00:00', '2018-03-16 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('22', 'Zathin', 'BK-61713', 'Household', '52', '474.50', 'Unithroid', 'Mazda3', 'Crist, Wintheiser and Walsh', '133', '7', '3', '96186', '08324 Troy Street', '02', '17.25', '458.98', '94.19', '324.52', '2018-02-02 00:00:00', '2018-03-24 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('23', 'Gembucket', 'ZZ-72637', 'Household', '1', '500.92', 'DANDELION POLLEN', 'Grand Prix', 'Marks, Hansen and Farrell', '133', '7', '5', '78944', '14019 Rowland Terrace', '63', '21.16', '366.73', '275.25', '489.69', '2018-02-05 00:00:00', '2018-03-29 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('24', 'Stronghold', 'ZW-21492', 'Work Tools', '92', '652.44', 'HOUSE DUST', 'Express', 'Weimann, Wolff and Herzog', '133', '7', '6', '56537', '72614 Twin Pines Trail', '88', '13.28', '390.26', '470.36', '55.94', '2018-02-05 00:00:00', '2018-03-19 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('25', 'Alpha', 'AB-55700', 'Work Tools', '21', '253.73', 'Severe Allergy And Sinus Headache', 'XC70', 'Waelchi-Willms', '133', '7', '6', '69394', '4819 Mccormick Road', '26', '23.07', '32.90', '485.62', '414.59', '2018-02-12 00:00:00', '2018-03-15 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('26', 'Subin', 'ES-01732', 'Gadget', '34', '684.84', 'Constipation', 'E-Class', 'Brown, Fisher and Rowe', '133', '7', '3', '36591', '2 Debs Junction', '31', '29.40', '363.43', '449.02', '34.74', '2018-02-03 00:00:00', '2018-03-04 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('27', 'Konklux', 'CY-86351', 'Household', '21', '548.19', 'topcare allergy relief', 'Continental', 'Corwin, Steuber and Wyman', '133', '7', '5', '64698', '1203 Eastwood Point', '23', '10.75', '267.10', '138.56', '303.54', '2018-02-15 00:00:00', '2018-03-24 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('28', 'Cardify', 'DM-69181', 'Hybrid', '41', '464.78', 'Hydrogen Peroxide', 'Econoline E250', 'Osinski, Stamm and Wunsch', '133', '7', '4', '77252', '6 Coolidge Road', '00', '8.82', '102.37', '332.08', '28.98', '2018-02-07 00:00:00', '2018-03-05 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('29', 'Zontrax', 'AR-76808', 'Apparatus', '69', '376.23', 'CYZONE', 'Paseo', 'Kemmer and Sons', '133', '7', '4', '66959', '91 Erie Crossing', '53', '26.13', '187.52', '461.44', '414.44', '2018-02-16 00:00:00', '2018-03-17 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('30', 'Temp', 'CT-55759', 'Hybrid', '31', '367.91', 'Stem Cell Whitening Serum', 'Montero', 'Padberg-Walsh', '133', '7', '2', '96189', '9391 Grim Plaza', '41', '21.98', '108.64', '30.42', '491.52', '2018-02-15 00:00:00', '2018-03-06 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('31', 'Holdlamis', 'CF-41932', 'Hybrid', '36', '182.22', 'BEEVENOM PACT', 'Rally Wagon G2500', 'Harris, Reynolds and Ferry', '133', '7', '6', '46652', '41 Scofield Court', '60', '21.65', '385.90', '184.94', '311.65', '2018-02-22 00:00:00', '2018-03-15 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('32', 'Opela', 'JR-40672', 'Household', '18', '645.11', 'Aspirin', 'Sportvan G20', 'Block Group', '133', '7', '3', '15880', '55 Farragut Drive', '21', '1.19', '330.32', '403.96', '123.49', '2018-02-20 00:00:00', '2018-03-27 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('33', 'Bitwolf', 'ET-56490', 'Gadget', '44', '274.53', 'CLADOSPORIUM SPHAEROSPERMUM', 'F-Series Super Duty', 'Waters-Prosacco', '133', '7', '4', '76214', '479 Kensington Street', '75', '3.20', '298.76', '340.33', '18.15', '2018-02-25 00:00:00', '2018-03-16 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('34', 'Alphazap', 'MS-24922', 'Gadget', '7', '611.98', 'Healthy Accents Antibacterial Body Wash', 'Escort', 'Roob, Hudson and Corkery', '133', '7', '6', '84593', '48006 Tony Place', '94', '3.84', '87.01', '481.32', '329.76', '2018-02-23 00:00:00', '2018-03-23 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('35', 'Veribet', 'DD-96090', 'Work Tools', '22', '650.76', 'Dicyclomine Hydrochloride', 'Firebird', 'Christiansen-Treutel', '133', '7', '3', '95519', '334 Golf View Park', '51', '20.38', '20.16', '326.60', '172.40', '2018-02-20 00:00:00', '2018-03-10 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('36', 'Home Ing', 'FX-41593', 'Hybrid', '74', '369.84', 'Eye Wash', 'Cooper', 'McLaughlin Group', '133', '7', '2', '67842', '49398 Continental Road', '81', '16.41', '348.41', '399.47', '487.83', '2018-02-15 00:00:00', '2018-03-16 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('37', 'Y-find', 'IE-12326', 'Gadget', '61', '966.60', 'Isosulfan Blue', '5 Series', 'Emmerich and Sons', '133', '7', '6', '16683', '03040 Bonner Drive', '08', '23.44', '344.87', '221.09', '93.85', '2018-02-06 00:00:00', '2018-03-15 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('38', 'Prodder', 'AB-14474', 'Apparatus', '38', '472.50', 'Amoxicillin Extended-Release', 'S-Series', 'Denesik-Hessel', '133', '7', '3', '58884', '13 Butternut Lane', '95', '10.78', '328.21', '225.91', '92.22', '2018-02-15 00:00:00', '2018-03-14 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('39', 'Overhold', 'DH-48433', 'Household', '55', '40.46', 'Hydroxychloroquine sulfate', 'GS', 'Ruecker, Shields and Stanton', '133', '7', '2', '33581', '97 Oriole Alley', '94', '15.56', '149.66', '98.47', '251.33', '2018-02-03 00:00:00', '2018-03-10 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('40', 'Holdlamis', 'PT-09996', 'Apparatus', '78', '698.75', 'Oxygen', 'LeSabre', 'Johnson Inc', '133', '7', '2', '92207', '83 Monica Terrace', '23', '19.85', '258.56', '261.51', '390.12', '2018-02-02 00:00:00', '2018-03-22 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('41', 'Toughjoyfax', 'YX-37236', 'Hybrid', '85', '724.69', 'Humphreys Baby Teething Relief Very Cherry', 'F-Series', 'Kuhlman-Cummings', '133', '7', '3', '72636', '368 La Follette Place', '40', '22.98', '241.01', '455.42', '304.90', '2018-02-26 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('42', 'Tresom', 'JT-20705', 'Gadget', '28', '491.44', 'Doxepin Hydrochloride', 'Mystique', 'Thompson LLC', '133', '7', '5', '63115', '6680 La Follette Terrace', '03', '19.08', '126.86', '92.87', '412.74', '2018-02-12 00:00:00', '2018-03-23 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('43', 'Tres-Zap', 'PQ-41514', 'Work Tools', '81', '484.22', 'ESIKA', 'Suburban 2500', 'Raynor-Cummings', '133', '7', '3', '60285', '1 Artisan Pass', '05', '10.29', '456.29', '67.95', '396.01', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('44', 'Y-find', 'GC-17377', 'Gadget', '6', '181.02', 'BC Arthritis', 'Festiva', 'Gusikowski LLC', '133', '7', '4', '81709', '506 Kings Place', '84', '17.97', '409.00', '360.46', '131.38', '2018-02-06 00:00:00', '2018-03-12 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('45', 'Quo Lux', 'SR-20278', 'Gadget', '31', '220.90', 'Dicloxacillin Sodium', 'Festiva', 'Rath, Jakubowski and Orn', '133', '7', '3', '22728', '08 Aberg Plaza', '17', '8.17', '203.84', '109.65', '38.21', '2018-02-06 00:00:00', '2018-03-20 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('46', 'Prodder', 'FW-98737', 'Apparatus', '83', '665.76', 'Trimethobenzamide Hydrochloride', '1500', 'Ondricka and Sons', '133', '7', '2', '50041', '0912 Elka Hill', '63', '16.19', '24.18', '457.72', '298.08', '2018-02-15 00:00:00', '2018-03-03 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('47', 'Latlux', 'FZ-51699', 'Work Tools', '63', '280.81', 'medroxyprogesterone acetate', 'Silverado 1500', 'Huel, Hettinger and Robel', '133', '7', '3', '99043', '33772 Moulton Point', '81', '12.74', '43.50', '147.95', '46.07', '2018-02-08 00:00:00', '2018-03-28 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('48', 'Bitchip', 'KW-44065', 'Household', '90', '141.89', 'Atorvastatin Calcium', 'Element', 'Weber-Ledner', '133', '7', '2', '56273', '25747 Maryland Place', '63', '27.11', '169.89', '461.89', '332.31', '2018-02-14 00:00:00', '2018-03-02 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('49', 'Opela', 'SI-78887', 'Work Tools', '8', '88.25', 'ASSURED ACNE CREAM', 'RL', 'Feest-Von', '133', '7', '5', '60674', '55741 Schiller Avenue', '67', '26.06', '71.40', '142.35', '240.98', '2018-02-12 00:00:00', '2018-03-15 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('50', 'Cardguard', 'WB-97567', 'Hybrid', '7', '817.12', 'Clotrimazole', '500SEL', 'Turner, Baumbach and Pollich', '133', '7', '5', '48464', '01027 Cordelia Center', '06', '3.54', '157.18', '275.74', '315.61', '2018-02-13 00:00:00', '2018-03-28 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('51', 'Solarbreeze', 'CV-26762', 'Gadget', '70', '158.95', 'Hydrochlorothiazide', '3 Series', 'Pacocha LLC', '133', '7', '5', '53472', '0985 Milwaukee Crossing', '45', '8.31', '152.53', '221.65', '337.60', '2018-02-04 00:00:00', '2018-03-15 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('52', 'Fintone', 'WI-69163', 'Hybrid', '93', '33.73', 'Nasal Decongestant PE', 'Aspire', 'Gulgowski Group', '133', '7', '2', '89712', '177 Welch Drive', '38', '14.80', '51.43', '207.31', '21.22', '2018-02-11 00:00:00', '2018-03-11 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('53', 'Daltfresh', 'HJ-87920', 'Work Tools', '66', '971.33', 'Hydroxychloroquine sulfate', 'SL-Class', 'Fritsch-Wiegand', '133', '7', '4', '86551', '09802 High Crossing Pass', '22', '18.45', '93.13', '327.16', '194.10', '2018-02-05 00:00:00', '2018-03-13 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('54', 'Greenlam', 'NO-70659', 'Hybrid', '8', '665.18', 'QUAKING ASPEN POLLEN', 'LS', 'Morar, Feeney and Lang', '133', '7', '3', '10560', '932 Manufacturers Place', '22', '15.28', '151.34', '273.46', '243.18', '2018-02-27 00:00:00', '2018-03-30 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('55', 'Regrant', 'PB-96472', 'Hybrid', '95', '919.06', 'CANIS LUPUS FAMILIARIS SKIN', 'Savana 2500', 'Kreiger Group', '133', '7', '4', '59422', '0 Blaine Hill', '68', '2.85', '92.73', '39.12', '382.46', '2018-02-09 00:00:00', '2018-03-24 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('56', 'Tampflex', 'VD-64783', 'Household', '2', '43.21', 'Venlafaxine Hydrochloride', 'Defender 90', 'Bauch and Sons', '133', '7', '2', '20902', '749 Helena Court', '85', '14.21', '259.61', '204.44', '447.86', '2018-02-18 00:00:00', '2018-03-13 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('57', 'Biodex', 'HL-38040', 'Apparatus', '16', '759.46', 'HYDROCORTISONE', 'CL', 'Howell Inc', '133', '7', '6', '22019', '4 Namekagon Place', '54', '7.24', '156.15', '293.32', '73.20', '2018-02-19 00:00:00', '2018-03-29 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('58', 'Veribet', 'XI-54917', 'Apparatus', '27', '728.59', 'JUVISYNC', 'Cooper', 'Braun-Johnson', '133', '7', '6', '3975', '5186 Drewry Alley', '81', '2.01', '402.62', '115.65', '269.45', '2018-02-20 00:00:00', '2018-03-29 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('59', 'Y-find', 'AH-25242', 'Apparatus', '5', '761.24', 'Laura mercier Tinted Moisturizer SPF-20 Tan', 'Aspire', 'Shields, Leannon and Crist', '133', '7', '5', '4505', '5718 Jackson Parkway', '47', '20.39', '471.87', '370.99', '396.03', '2018-02-23 00:00:00', '2018-03-01 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('60', 'Aerified', 'NU-14837', 'Household', '1', '129.86', 'Oxazepam', 'MR2', 'Heidenreich, Schultz and Bogan', '133', '7', '6', '9642', '3990 Kim Road', '65', '20.17', '346.28', '199.85', '213.89', '2018-02-14 00:00:00', '2018-03-07 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('61', 'Daltfresh', 'HF-93834', 'Apparatus', '90', '994.26', 'MEDI-FIRST Ibuprofen', 'Econoline E150', 'Runolfsson Inc', '133', '7', '6', '67308', '12612 Forest Dale Park', '84', '21.44', '257.84', '420.76', '222.63', '2018-02-11 00:00:00', '2018-03-22 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('62', 'Tres-Zap', 'TM-55176', 'Household', '14', '966.73', 'CLEARSKIN PROFESSIONAL', 'Fiesta', 'Ebert, Goldner and Kreiger', '133', '7', '3', '67610', '020 Onsgard Junction', '38', '4.85', '470.02', '389.55', '21.60', '2018-02-16 00:00:00', '2018-03-27 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('63', 'Konklux', 'IP-37897', 'Gadget', '52', '608.59', 'Allergy Relief', 'Camry', 'Turner Inc', '133', '7', '5', '24178', '4004 Bluestem Court', '32', '29.09', '342.91', '160.48', '2.17', '2018-02-12 00:00:00', '2018-03-19 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('64', 'Treeflex', 'PG-48310', 'Gadget', '94', '243.83', 'No7 Lift and Luminate Foundation Sunscreen Broad Spectrum SPF 15 Calico', 'PT Cruiser', 'Prosacco-White', '133', '7', '2', '43920', '69 Briar Crest Crossing', '72', '15.49', '131.07', '463.53', '31.77', '2018-02-06 00:00:00', '2018-03-21 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('65', 'Trippledex', 'DX-74594', 'Apparatus', '67', '397.13', 'White Fish', 'Civic', 'Erdman, Hane and Mertz', '133', '7', '4', '35078', '8 Messerschmidt Alley', '24', '17.69', '378.82', '449.18', '166.12', '2018-02-04 00:00:00', '2018-03-15 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('66', 'Fix San', 'BV-06370', 'Work Tools', '14', '986.24', 'LBEL Couleur Luxe Rouge Amplifier XP amplifying SPF 15', 'Breeze', 'Bernhard-Kessler', '133', '7', '6', '94616', '9508 Killdeer Way', '45', '15.63', '128.80', '301.35', '101.16', '2018-02-20 00:00:00', '2018-03-05 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('67', 'Gembucket', 'YM-26946', 'Hybrid', '1', '961.68', 'LACHESIS MUTUS', '4Runner', 'Hermann Inc', '133', '7', '5', '41407', '31 Kim Street', '60', '5.74', '388.15', '465.76', '173.62', '2018-02-16 00:00:00', '2018-03-22 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('68', 'Flowdesk', 'KM-99734', 'Apparatus', '42', '880.56', 'Olanzapine', 'Corvette', 'Dach, Dibbert and Fisher', '133', '7', '2', '42255', '27 Acker Alley', '65', '8.71', '156.83', '102.69', '235.29', '2018-02-08 00:00:00', '2018-03-29 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('69', 'Keylex', 'VE-32109', 'Hybrid', '4', '390.21', 'Citroma', 'SRX', 'West Inc', '133', '7', '6', '11754', '5 Morningstar Junction', '44', '7.57', '190.72', '334.02', '176.00', '2018-02-10 00:00:00', '2018-03-13 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('70', 'Y-Solowarm', 'PS-73067', 'Work Tools', '16', '151.16', 'HyVee Alcohol Prep Pads', 'Continental Mark VII', 'Rippin, Bins and Ankunding', '133', '7', '2', '46382', '546 Stone Corner Lane', '91', '5.95', '191.00', '363.90', '335.73', '2018-02-08 00:00:00', '2018-03-20 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('71', 'Ventosanzap', 'YT-10997', 'Hybrid', '16', '201.21', 'Ice Quake', 'Safari', 'Torphy, Wiegand and Farrell', '133', '7', '5', '45862', '0925 Packers Point', '47', '4.38', '96.54', '226.04', '324.42', '2018-02-07 00:00:00', '2018-03-09 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('72', 'Gembucket', 'PD-41198', 'Apparatus', '24', '315.37', 'MEDI-FIRST Cherry Cough Drops', 'CL', 'Becker and Sons', '133', '7', '6', '316', '48 Lunder Terrace', '12', '14.37', '38.39', '61.66', '493.28', '2018-02-25 00:00:00', '2018-03-14 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('73', 'Tresom', 'GT-05751', 'Household', '16', '686.51', 'Promethazine Hydrochloride and Dextromethorphan Hydrobromide', 'TSX', 'Hackett-Monahan', '133', '7', '3', '23315', '95 Heath Pass', '75', '8.35', '23.70', '131.27', '459.67', '2018-02-17 00:00:00', '2018-03-28 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('74', 'Flexidy', 'QJ-83201', 'Apparatus', '29', '467.01', 'Prednisone', 'Sequoia', 'Bosco-Kulas', '133', '7', '5', '98926', '2 Forest Dale Way', '90', '13.62', '403.72', '97.57', '236.57', '2018-02-09 00:00:00', '2018-03-11 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('75', 'Pannier', 'IV-37432', 'Work Tools', '25', '652.74', 'Vagical', '7 Series', 'Will and Sons', '133', '7', '3', '52773', '44940 Springs Circle', '25', '26.08', '489.84', '209.45', '473.03', '2018-02-06 00:00:00', '2018-03-25 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('76', 'Subin', 'IM-03180', 'Hybrid', '41', '792.10', 'DEXTROSE', 'M5', 'Kohler, Kirlin and Barrows', '133', '7', '6', '92664', '846 Nancy Center', '82', '28.22', '91.08', '4.37', '220.95', '2018-02-05 00:00:00', '2018-03-24 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('77', 'Zaam-Dox', 'UW-53187', 'Household', '13', '858.73', 'Brintellix', 'Lancer Evolution', 'Runolfsson, Harvey and Erdman', '133', '7', '3', '79152', '8882 Westerfield Drive', '62', '27.72', '256.53', '183.12', '24.39', '2018-02-18 00:00:00', '2018-03-28 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('78', 'Bigtax', 'BH-51395', 'Gadget', '34', '659.70', 'MORPHINE SULFATE', 'Traverse', 'Schaefer, Casper and Bednar', '133', '7', '3', '99647', '20 Hollow Ridge Pass', '11', '4.64', '293.59', '300.79', '188.98', '2018-02-26 00:00:00', '2018-03-12 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('79', 'Voltsillam', 'YI-87475', 'Apparatus', '77', '457.72', 'Alcoscrub Foam', 'GT500', 'Wintheiser-Mante', '133', '7', '5', '88596', '6 North Alley', '19', '27.45', '428.32', '121.47', '105.08', '2018-02-20 00:00:00', '2018-03-30 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('80', 'Sonair', 'RZ-86737', 'Hybrid', '4', '330.43', 'Oxycodone and Acetaminophen', 'Odyssey', 'Spencer-Baumbach', '133', '7', '4', '56947', '89603 Donald Point', '80', '4.43', '468.24', '208.31', '339.71', '2018-02-20 00:00:00', '2018-03-26 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('81', 'Stim', 'EW-43509', 'Apparatus', '82', '139.41', 'Vaseline', 'Silverado 2500', 'King, Conroy and Schowalter', '133', '7', '6', '54676', '906 Rockefeller Drive', '73', '16.96', '479.71', '208.25', '215.47', '2018-02-12 00:00:00', '2018-03-07 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('82', 'Home Ing', 'OW-01196', 'Gadget', '8', '731.56', 'Pollens - Weeds, Dock/Sorrel Mix', 'Tahoe', 'Ebert-Runte', '133', '7', '5', '65296', '81 Old Gate Alley', '06', '3.70', '282.45', '170.32', '150.76', '2018-02-25 00:00:00', '2018-03-07 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('83', 'Andalax', 'VJ-37220', 'Apparatus', '51', '204.14', 'Olanzapine', 'F150', 'Harris-Langosh', '133', '7', '3', '80539', '527 Hovde Plaza', '68', '1.53', '15.41', '331.81', '23.26', '2018-02-06 00:00:00', '2018-03-30 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('84', 'Vagram', 'WT-27205', 'Work Tools', '49', '243.49', 'Pleo San Strep', 'Taurus', 'Nienow LLC', '133', '7', '2', '61487', '17401 Arkansas Circle', '54', '14.39', '288.86', '461.97', '176.38', '2018-02-14 00:00:00', '2018-03-29 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('85', 'Alpha', 'FJ-19172', 'Gadget', '14', '626.70', 'Thioridazine Hydrochloride', 'TT', 'Johnston-Marvin', '133', '7', '2', '71470', '8817 Nancy Plaza', '93', '27.25', '365.16', '8.73', '210.90', '2018-02-18 00:00:00', '2018-03-07 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('86', 'Y-Solowarm', 'VX-29825', 'Work Tools', '96', '619.04', 'Acne - Cystic Acne', 'Avalon', 'Fahey-Hartmann', '133', '7', '5', '52630', '547 Lien Place', '54', '15.76', '87.15', '259.32', '248.75', '2018-02-09 00:00:00', '2018-03-12 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('87', 'Y-find', 'VV-94574', 'Household', '20', '844.51', 'Olanzapine', 'Econoline E250', 'Zboncak-King', '133', '7', '6', '3975', '87 Badeau Park', '01', '19.91', '155.46', '230.87', '129.19', '2018-02-11 00:00:00', '2018-03-09 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('88', 'Cardguard', 'ZP-16939', 'Work Tools', '50', '917.61', 'Quality Choice Nighttime Severe Cold and Cough', 'Savana 3500', 'Schinner Group', '133', '7', '5', '62862', '5400 Darwin Parkway', '18', '6.07', '306.52', '245.11', '399.10', '2018-02-06 00:00:00', '2018-03-08 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('89', 'Bamity', 'JS-67551', 'Apparatus', '20', '110.22', 'CVS Pharmacy', 'B-Series', 'Connelly-Yost', '133', '7', '3', '47211', '48890 Southridge Center', '84', '20.03', '76.69', '446.02', '88.08', '2018-02-27 00:00:00', '2018-03-14 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('90', 'Zamit', 'JH-11801', 'Household', '25', '403.28', 'Flu Care', '80/90', 'Harber-Parisian', '133', '7', '2', '85719', '7 Delladonna Way', '97', '24.74', '179.59', '324.18', '479.35', '2018-02-25 00:00:00', '2018-03-20 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('91', 'Pannier', 'FS-01823', 'Household', '92', '15.24', 'Clorazepate dipotassium', '4Runner', 'Gerlach Group', '133', '7', '2', '69982', '9 Algoma Road', '41', '10.42', '30.80', '482.96', '109.21', '2018-02-15 00:00:00', '2018-03-14 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('92', 'Latlux', 'CT-81762', 'Hybrid', '21', '836.82', 'Firebush/Burning Bush', 'Cavalier', 'Stoltenberg LLC', '133', '7', '6', '88455', '41 Autumn Leaf Parkway', '64', '3.84', '427.70', '488.76', '207.66', '2018-02-18 00:00:00', '2018-03-03 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('93', 'Stronghold', 'UC-78516', 'Household', '59', '405.47', 'Hydromorphone Hydrochloride', 'Escort ZX2', 'Russel Group', '133', '7', '5', '62278', '2 Division Street', '77', '21.74', '62.94', '134.36', '480.60', '2018-02-10 00:00:00', '2018-03-11 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('94', 'Solarbreeze', 'QV-31849', 'Work Tools', '81', '307.00', 'RISPERIDONE', 'LSS', 'Baumbach Inc', '133', '7', '3', '29545', '285 Orin Park', '48', '24.89', '383.77', '445.63', '443.09', '2018-02-05 00:00:00', '2018-03-25 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('95', 'Cookley', 'CX-23762', 'Work Tools', '65', '876.45', 'CC Cream Complexion Corrector Medium Dark Broad Spectrum SPF 15', 'Montana SV6', 'Braun Inc', '133', '7', '5', '71086', '23 School Terrace', '66', '24.63', '74.95', '273.22', '62.88', '2018-02-12 00:00:00', '2018-03-10 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('96', 'Job', 'EQ-34817', 'Work Tools', '45', '331.34', 'FENOFIBRATE', 'CX-7', 'Hermiston Inc', '133', '7', '4', '30296', '27 Dexter Center', '19', '6.72', '497.35', '344.51', '169.87', '2018-02-12 00:00:00', '2018-03-10 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('97', 'Tempsoft', 'EJ-82981', 'Gadget', '65', '805.60', 'Diarrhea', 'GT500', 'Satterfield, Beer and Cassin', '133', '7', '5', '55774', '11745 Armistice Drive', '57', '8.22', '301.34', '429.60', '486.99', '2018-02-17 00:00:00', '2018-03-25 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('98', 'Cardify', 'OM-89623', 'Apparatus', '82', '672.61', 'Carrington Moisture Barrier', 'Monte Carlo', 'Hills-Ruecker', '133', '7', '6', '26432', '78 Kennedy Avenue', '89', '29.57', '474.75', '459.23', '465.49', '2018-02-17 00:00:00', '2018-03-28 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('99', 'Voyatouch', 'YI-51104', 'Household', '21', '846.39', 'Restless Leg', 'XJ Series', 'Hilpert, Bauch and O\'Hara', '133', '7', '6', '80332', '88 Larry Drive', '28', '10.67', '222.21', '423.89', '479.94', '2018-02-06 00:00:00', '2018-03-28 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('100', 'Keylex', 'WE-52087', 'Work Tools', '0', '741.96', 'Fexofenadine HCl and Pseudoephedrine HCI', 'Impala', 'Pouros, Sawayn and Emard', '133', '7', '2', '78312', '30 Gina Crossing', '96', '17.13', '33.57', '230.56', '146.57', '2018-02-19 00:00:00', '2018-03-18 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('101', 'Redhold', 'IL-45655', 'Apparatus', '50', '324.30', 'AllergyEase Dairy', 'Truck', 'Waelchi LLC', '133', '7', '3', '50499', '6773 Acker Pass', '52', '9.20', '377.12', '36.77', '299.48', '2018-02-20 00:00:00', '2018-03-19 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('102', 'Fintone', 'HR-01152', 'Apparatus', '1', '162.40', 'Renes Argentum nitricum', 'B-Series', 'Crona-Schoen', '133', '7', '6', '99432', '7 Maywood Plaza', '19', '22.76', '63.11', '55.07', '202.90', '2018-02-17 00:00:00', '2018-03-21 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('103', 'Voltsillam', 'JR-05092', 'Household', '3', '944.99', 'Dial Complete Antibacterial Foaming Hand Wash with Lotion', 'MX-6', 'Feest Group', '133', '7', '4', '31393', '33170 Harbort Alley', '60', '24.53', '374.48', '444.73', '347.01', '2018-02-16 00:00:00', '2018-03-03 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('104', 'Redhold', 'XV-44175', 'Hybrid', '9', '612.97', 'Wheat Stem Rust', 'Land Cruiser', 'Volkman LLC', '133', '7', '2', '13500', '72504 American Ash Drive', '98', '6.55', '24.42', '111.08', '432.71', '2018-02-10 00:00:00', '2018-03-02 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('105', 'Ventosanzap', 'UW-42543', 'Gadget', '66', '200.50', 'IPECACUANHA', 'Loyale', 'Shanahan, Marks and Lind', '133', '7', '2', '13691', '83 Dunning Hill', '69', '10.58', '207.19', '418.61', '113.94', '2018-02-15 00:00:00', '2018-03-03 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('106', 'Bamity', 'XW-96914', 'Hybrid', '16', '248.05', 'Childrens Plus Cough and Runny Nose', 'B-Series', 'Blick, Parker and Dickinson', '133', '7', '6', '31449', '94 Hollow Ridge Alley', '70', '11.63', '52.92', '55.55', '309.23', '2018-02-05 00:00:00', '2018-03-27 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('107', 'Redhold', 'OG-59860', 'Apparatus', '98', '335.21', 'TERRACOTTA JOLI TEINT BEAUTIFYING FOUNDATION WITH SUNSCREEN SUN-KISSED, HEALTHY GLOW BROAD SPECTRUM SPF 20 DARK', 'Electra', 'Cole-Cormier', '133', '7', '4', '44018', '07748 Stephen Road', '20', '14.86', '266.30', '126.58', '93.99', '2018-02-04 00:00:00', '2018-03-22 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('108', 'Stim', 'WG-27220', 'Hybrid', '34', '649.17', 'Curad Alcohol Prep Pads', 'NSX', 'Sipes, Ondricka and Greenfelder', '133', '7', '5', '75591', '4 Ramsey Way', '00', '13.11', '269.30', '434.33', '137.74', '2018-02-25 00:00:00', '2018-03-12 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('109', 'Sonsing', 'ZH-31158', 'Apparatus', '66', '438.25', 'CARE ONE EYE DROPS SEASONAL RELIEF', 'Ion', 'Fisher and Sons', '133', '7', '6', '75071', '50 Melby Lane', '90', '8.60', '125.30', '218.29', '88.96', '2018-02-07 00:00:00', '2018-03-26 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('110', 'Vagram', 'UF-97190', 'Household', '38', '376.17', 'Imipramine Hydrochloride', 'Ascender', 'Ebert LLC', '133', '7', '6', '6336', '004 Farragut Point', '42', '24.80', '238.37', '150.05', '44.68', '2018-02-24 00:00:00', '2018-03-16 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('111', 'Temp', 'XW-83323', 'Apparatus', '61', '326.29', 'babies r us infants pain and fever', 'Aerio', 'Stroman, Ward and Stamm', '133', '7', '4', '32279', '3498 Pond Center', '28', '10.38', '266.16', '469.25', '6.20', '2018-02-05 00:00:00', '2018-03-10 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('112', 'Ronstring', 'YR-77528', 'Household', '50', '879.15', 'Warfarin Sodium', 'F-250 Super Duty', 'Runolfsson, Kunze and Kiehn', '133', '7', '5', '2182', '563 Mayer Alley', '64', '18.32', '128.46', '177.00', '54.92', '2018-02-19 00:00:00', '2018-03-28 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('113', 'Mat Lam Tam', 'VY-74456', 'Gadget', '66', '860.09', 'Anti-Diarrheal', 'X6', 'Thompson-Oberbrunner', '133', '7', '6', '57249', '40 Luster Pass', '86', '19.73', '214.74', '301.44', '418.81', '2018-02-12 00:00:00', '2018-03-11 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('114', 'Transcof', 'VB-87977', 'Apparatus', '79', '331.28', 'Amlodipine Besylate and Benazepril Hydrochloride', 'LeMans', 'Koepp Group', '133', '7', '2', '65330', '153 Grim Terrace', '55', '5.23', '365.97', '398.77', '22.59', '2018-02-12 00:00:00', '2018-03-14 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('115', 'Mat Lam Tam', 'EO-15266', 'Gadget', '27', '575.18', 'Fears and Nightmares', '960', 'Ward, Wintheiser and Goodwin', '133', '7', '3', '24083', '9653 Chinook Point', '94', '12.12', '399.84', '124.76', '158.09', '2018-02-08 00:00:00', '2018-03-21 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('116', 'Matsoft', 'PI-04398', 'Hybrid', '19', '561.38', 'Klor-Con', 'X3', 'Goyette-Grimes', '133', '7', '5', '27999', '0457 Kropf Drive', '14', '5.09', '494.10', '442.64', '130.93', '2018-02-19 00:00:00', '2018-03-17 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('117', 'Wrapsafe', 'AX-28603', 'Gadget', '74', '446.33', 'DIGOX', 'Range Rover Sport', 'Bogisich-Mante', '133', '7', '4', '74163', '09894 Quincy Crossing', '34', '12.89', '373.44', '344.83', '323.05', '2018-02-09 00:00:00', '2018-03-11 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('118', 'Trippledex', 'FL-88607', 'Hybrid', '41', '481.03', 'Gabapentin', 'X5', 'Carroll, Jast and Stark', '133', '7', '6', '23623', '55746 Carey Center', '13', '14.61', '494.21', '253.17', '185.85', '2018-02-24 00:00:00', '2018-03-19 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('119', 'Sub-Ex', 'KK-58002', 'Household', '13', '742.15', 'Divalproex Sodium', 'Civic', 'Krajcik Group', '133', '7', '4', '71957', '2537 Magdeline Pass', '14', '16.88', '369.04', '386.00', '296.28', '2018-02-01 00:00:00', '2018-03-10 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('120', 'Tempsoft', 'XB-32464', 'Work Tools', '82', '794.47', 'Monistat 7 Combination Pack', 'Prius v', 'Funk LLC', '133', '7', '5', '21804', '067 Golden Leaf Pass', '83', '8.68', '201.68', '211.25', '486.33', '2018-02-10 00:00:00', '2018-03-17 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('121', 'Opela', 'FO-35652', 'Household', '12', '666.61', 'Homeopathic Immunity Supporting Tonic', 'Mustang', 'Heaney, Thompson and Gutmann', '133', '7', '3', '51429', '28 Corben Way', '44', '26.89', '176.43', '434.07', '384.08', '2018-02-11 00:00:00', '2018-03-30 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('122', 'Toughjoyfax', 'XQ-42179', 'Gadget', '14', '110.50', 'Antacid and Antigas', 'F-Series', 'Kulas LLC', '133', '7', '3', '88668', '88 Superior Terrace', '82', '19.26', '427.23', '457.44', '49.29', '2018-02-26 00:00:00', '2018-03-16 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('123', 'Tampflex', 'YQ-57305', 'Work Tools', '12', '82.74', 'Amoxicillin', 'LS', 'Wilkinson LLC', '133', '7', '3', '93298', '4 Corscot Center', '20', '17.24', '321.27', '310.47', '245.34', '2018-02-11 00:00:00', '2018-03-24 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('124', 'Matsoft', 'XU-54968', 'Gadget', '83', '116.40', 'Levofloxacin', 'Aries', 'Friesen-Sporer', '133', '7', '2', '18605', '547 Center Street', '92', '16.37', '154.42', '438.05', '487.70', '2018-02-01 00:00:00', '2018-03-13 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('125', 'Vagram', 'WK-44543', 'Apparatus', '19', '76.76', 'SAGE MIX, COMMON/DARK-LEAVED/DRAGON/PASTURE POLLEN', '3500', 'Cummerata-Dare', '133', '7', '6', '30021', '73 Sutherland Center', '70', '18.80', '189.22', '22.62', '98.54', '2018-02-22 00:00:00', '2018-03-26 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('126', 'Aerified', 'TQ-13607', 'Hybrid', '33', '601.92', 'Metoprolol Tartrate', 'Mirage', 'Lehner Group', '133', '7', '5', '1598', '779 Susan Alley', '22', '11.65', '291.62', '69.84', '217.35', '2018-02-07 00:00:00', '2018-03-14 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('127', 'Matsoft', 'IS-22505', 'Gadget', '27', '807.64', 'Arbonne Revelage', 'Q', 'Reichel-Hayes', '133', '7', '2', '22994', '263 Golf Point', '23', '18.46', '322.20', '122.85', '236.84', '2018-02-01 00:00:00', '2018-03-29 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('128', 'Kanlam', 'OJ-85127', 'Work Tools', '99', '282.57', 'HAND AND NATURE SANITIZER', 'GTO', 'Hane-Hermiston', '133', '7', '5', '46986', '615 American Trail', '03', '14.64', '234.84', '280.56', '288.58', '2018-02-23 00:00:00', '2018-03-15 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('129', 'Zaam-Dox', 'EG-72228', 'Hybrid', '97', '10.43', 'Morphine Sulfate', 'IS-F', 'Flatley, Kreiger and Zulauf', '133', '7', '2', '36460', '704 Dixon Trail', '14', '9.42', '86.90', '167.99', '164.74', '2018-02-26 00:00:00', '2018-03-10 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('130', 'Bitwolf', 'AQ-29730', 'Work Tools', '35', '623.79', 'MOIST MOISTURE ESSENCE FACE MASK', 'Galant', 'Rice LLC', '133', '7', '2', '88733', '0 Washington Center', '86', '3.21', '287.13', '129.40', '117.99', '2018-02-09 00:00:00', '2018-03-04 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('131', 'Span', 'MX-87917', 'Work Tools', '21', '550.54', 'Zithromax', 'M3', 'Lehner and Sons', '133', '7', '5', '61319', '3 David Center', '78', '18.66', '29.13', '33.72', '97.15', '2018-02-18 00:00:00', '2018-03-17 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('132', 'Subin', 'DC-93615', 'Work Tools', '8', '737.55', 'Ibuprofen', 'Sportage', 'Mayer-Monahan', '133', '7', '3', '38689', '78151 Sutherland Hill', '92', '5.68', '124.62', '317.10', '409.10', '2018-02-17 00:00:00', '2018-03-12 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('133', 'Stim', 'GK-49349', 'Household', '27', '569.88', 'Hackberry', 'Yukon', 'Sporer Inc', '133', '7', '2', '20837', '65844 Briar Crest Street', '29', '25.50', '243.06', '287.59', '459.62', '2018-02-06 00:00:00', '2018-03-15 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('134', 'Pannier', 'OG-26618', 'Household', '54', '676.01', 'Ibuprofen', 'Sable', 'McKenzie, Marquardt and Wintheiser', '133', '7', '6', '27721', '641 Cody Way', '11', '24.36', '430.52', '163.22', '124.40', '2018-02-06 00:00:00', '2018-03-17 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('135', 'It', 'JM-22341', 'Gadget', '15', '415.99', 'Corn Grain', 'Concorde', 'Kassulke-Mann', '133', '7', '3', '32269', '1 Thierer Avenue', '54', '21.45', '235.76', '275.26', '75.73', '2018-02-06 00:00:00', '2018-03-10 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('136', 'Fix San', 'CY-26937', 'Household', '15', '319.56', 'COTTON LINTERS', 'Talon', 'Bartell LLC', '133', '7', '4', '62096', '97034 Fuller Junction', '58', '18.83', '132.00', '492.81', '224.59', '2018-02-13 00:00:00', '2018-03-07 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('137', 'Redhold', 'CX-31396', 'Hybrid', '14', '638.24', 'Sardine', '612 Scaglietti', 'Bednar, Hayes and Pfannerstill', '133', '7', '4', '35072', '20 Charing Cross Way', '83', '19.18', '427.84', '17.54', '426.16', '2018-02-13 00:00:00', '2018-03-29 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('138', 'Voltsillam', 'VZ-58764', 'Gadget', '4', '823.72', 'Furosemide', 'Diablo', 'O\'Hara, Gaylord and Pfeffer', '133', '7', '3', '70739', '52 6th Parkway', '26', '1.88', '131.62', '43.84', '217.81', '2018-02-22 00:00:00', '2018-03-02 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('139', 'Toughjoyfax', 'HF-96836', 'Apparatus', '76', '734.78', 'ISA KNOX SMART BB SUN', 'Milan', 'Wintheiser Inc', '133', '7', '3', '62621', '4 Kropf Point', '77', '8.11', '491.66', '333.37', '434.34', '2018-02-14 00:00:00', '2018-03-14 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('140', 'Solarbreeze', 'NB-53309', 'Work Tools', '91', '57.14', 'Geodon', 'Silverado', 'Mann Inc', '133', '7', '3', '45186', '60988 Ramsey Junction', '73', '4.72', '285.62', '266.15', '176.54', '2018-02-22 00:00:00', '2018-03-24 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('141', 'Ronstring', 'YR-58808', 'Household', '62', '904.64', 'Allergy Relief', 'Monterey', 'Paucek Inc', '133', '7', '5', '57843', '821 Banding Road', '72', '17.58', '105.17', '215.18', '122.82', '2018-02-16 00:00:00', '2018-03-25 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('142', 'Namfix', 'WA-39752', 'Work Tools', '63', '734.64', 'GPS Topical Anesthetic', '300E', 'Kessler Inc', '133', '7', '6', '77691', '9 Village Crossing', '89', '4.75', '466.72', '231.37', '48.24', '2018-02-09 00:00:00', '2018-03-06 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('143', 'Namfix', 'RR-72939', 'Work Tools', '56', '852.24', 'Oxygen', 'Impreza', 'Pacocha-Beier', '133', '7', '3', '69352', '59 Clarendon Pass', '00', '17.45', '356.67', '14.92', '114.13', '2018-02-14 00:00:00', '2018-03-21 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('144', 'Alphazap', 'VP-86716', 'Household', '50', '852.56', 'Amazonian Clay 12-Hour Full Coverage Foundation Broad Spectrum SPF 15 Sunscreen', 'Crossfire', 'Rempel, Rodriguez and Ferry', '133', '7', '3', '71303', '54 Bonner Pass', '34', '6.73', '142.59', '13.28', '409.15', '2018-02-14 00:00:00', '2018-03-08 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('145', 'Andalax', 'GN-72839', 'Work Tools', '27', '667.25', 'LBEL', 'Cirrus', 'Runolfsdottir, Bosco and Halvorson', '133', '7', '6', '16242', '57179 Namekagon Point', '90', '17.32', '483.12', '322.11', '179.73', '2018-02-18 00:00:00', '2018-03-30 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('146', 'Subin', 'OL-81208', 'Gadget', '39', '581.29', 'ALOE UP PRO 15', 'Xtra', 'Pfeffer, Mayer and Green', '133', '7', '4', '94579', '8095 Truax Circle', '47', '22.09', '24.88', '321.35', '265.78', '2018-02-02 00:00:00', '2018-03-13 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('147', 'Mat Lam Tam', 'IT-46940', 'Apparatus', '1', '777.36', 'Danazol', 'Quattroporte', 'Cormier, D\'Amore and Nienow', '133', '7', '4', '19962', '707 Sachs Way', '35', '18.23', '395.06', '11.49', '345.67', '2018-02-12 00:00:00', '2018-03-17 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('148', 'Lotstring', 'NB-71307', 'Apparatus', '51', '866.97', 'FORTOLIN', 'Econoline E250', 'Rodriguez, Satterfield and Bechtelar', '133', '7', '6', '29698', '0798 Westridge Center', '12', '25.91', '424.11', '344.36', '120.78', '2018-02-11 00:00:00', '2018-03-13 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('149', 'Wrapsafe', 'FU-08999', 'Work Tools', '92', '687.58', 'Oxcarbazepine', 'XL-7', 'Strosin LLC', '133', '7', '2', '27927', '3922 1st Junction', '08', '28.45', '15.97', '110.67', '6.43', '2018-02-24 00:00:00', '2018-03-16 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('150', 'Sonair', 'LV-57062', 'Household', '65', '376.58', 'Proactiv Clear Zone Body Pads', '530', 'Stamm Group', '133', '7', '2', '33609', '2 Dahle Place', '58', '12.51', '40.34', '370.50', '302.37', '2018-02-04 00:00:00', '2018-03-15 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('151', 'Bytecard', 'TA-72700', 'Work Tools', '12', '836.74', 'Reef Safe SPF 45', 'Esprit', 'Johnson, Wisoky and Turner', '133', '7', '5', '11042', '2 Ridgeview Circle', '93', '15.16', '229.83', '102.10', '218.04', '2018-02-06 00:00:00', '2018-03-21 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('152', 'Redhold', 'MD-32005', 'Gadget', '80', '12.29', 'Sulwhasoo Lumitouch Compact', 'Club Wagon', 'Tillman LLC', '133', '7', '5', '33534', '66756 Golf Terrace', '23', '13.39', '466.04', '119.52', '69.47', '2018-02-03 00:00:00', '2018-03-20 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('153', 'Regrant', 'EJ-77490', 'Hybrid', '23', '721.66', 'Medpride', 'Rodeo', 'Windler, Runte and Terry', '133', '7', '5', '32462', '81 Sommers Street', '94', '14.50', '49.54', '393.94', '482.21', '2018-02-14 00:00:00', '2018-03-30 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('154', 'Trippledex', 'QM-87746', 'Hybrid', '26', '145.25', 'Good Neighbor Pharmacy Antacid', 'Excel', 'Kovacek-Grady', '133', '7', '2', '31810', '7569 Lunder Court', '01', '26.75', '100.68', '331.29', '26.87', '2018-02-18 00:00:00', '2018-03-23 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('155', 'Toughjoyfax', 'NY-69944', 'Hybrid', '81', '477.98', 'Keppra', 'Colt', 'Denesik-Cruickshank', '133', '7', '4', '24976', '8840 Annamark Parkway', '99', '15.77', '204.84', '273.35', '275.14', '2018-02-20 00:00:00', '2018-03-14 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('156', 'Toughjoyfax', 'GK-96258', 'Hybrid', '70', '508.35', 'NEW DOCTOR AG PLUS', 'Lancer', 'Jast, Kris and Brakus', '133', '7', '3', '81921', '6779 Maywood Court', '90', '17.79', '470.87', '111.95', '427.65', '2018-02-25 00:00:00', '2018-03-28 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('157', 'Subin', 'UE-30294', 'Household', '14', '932.25', 'Proctosol-HC', 'Capri', 'Will, DuBuque and Davis', '133', '7', '6', '12862', '949 Lotheville Center', '80', '4.22', '471.22', '490.77', '63.93', '2018-02-05 00:00:00', '2018-03-24 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('158', 'Sonsing', 'JK-32321', 'Work Tools', '31', '204.75', 'Anticavity', 'Eclipse', 'Cremin and Sons', '133', '7', '5', '93027', '8 Nova Place', '97', '19.75', '204.74', '251.49', '285.63', '2018-02-24 00:00:00', '2018-03-04 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('159', 'Daltfresh', 'UR-69191', 'Household', '85', '748.32', 'Disney MINNIE Antibacterial Hand Wipes', 'Jetta', 'Cruickshank-Schmeler', '133', '7', '2', '60392', '7 Lake View Place', '24', '1.05', '248.14', '427.91', '482.49', '2018-02-08 00:00:00', '2018-03-30 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('160', 'Wrapsafe', 'JF-60270', 'Household', '24', '204.63', 'Metaxalone', 'Azure', 'Torphy-Legros', '133', '7', '4', '11940', '56757 Rowland Alley', '04', '17.64', '177.99', '240.02', '498.38', '2018-02-02 00:00:00', '2018-03-23 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('161', 'Wrapsafe', 'FM-95486', 'Work Tools', '18', '875.11', 'Pleo Zinc', 'Tracer', 'Dickens, Hegmann and Bartell', '133', '7', '6', '30661', '23 Sauthoff Hill', '96', '17.01', '168.08', '63.21', '45.04', '2018-02-22 00:00:00', '2018-03-20 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('162', 'Zontrax', 'HK-71872', 'Hybrid', '68', '738.33', 'Promethazine Hydrochloride and Codeine Phosphate', 'Elantra', 'Abbott-Abbott', '133', '7', '4', '74411', '57172 Mifflin Pass', '78', '19.20', '489.26', '1.97', '363.71', '2018-02-01 00:00:00', '2018-03-23 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('163', 'Vagram', 'JG-65574', 'Apparatus', '91', '570.21', 'KINKAN', 'Sentra', 'Kulas Inc', '133', '7', '2', '81919', '042 Bartelt Junction', '16', '17.11', '414.65', '52.07', '124.50', '2018-02-07 00:00:00', '2018-03-28 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('164', 'Y-find', 'NK-97554', 'Hybrid', '62', '628.76', 'BANANA BOAT', 'A6', 'Kunde Group', '133', '7', '3', '49677', '653 Darwin Alley', '18', '6.34', '336.39', '267.92', '149.82', '2018-02-03 00:00:00', '2018-03-16 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('165', 'Fix San', 'WX-98190', 'Apparatus', '39', '338.53', 'Diazepam', '3000GT', 'Hoppe, Gulgowski and Dach', '133', '7', '2', '58178', '94629 Menomonie Terrace', '97', '6.39', '211.76', '99.79', '167.76', '2018-02-15 00:00:00', '2018-03-03 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('166', 'Lotstring', 'RT-26208', 'Gadget', '5', '681.18', 'MK Sting Relief Pads', 'Escalade', 'Nitzsche-Mayert', '133', '7', '6', '28922', '99212 Merrick Center', '24', '4.50', '200.61', '239.13', '34.82', '2018-02-17 00:00:00', '2018-03-18 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('167', 'Mat Lam Tam', 'VL-54239', 'Gadget', '52', '117.72', 'Spotless Cleanser', 'Monaro', 'Stoltenberg, MacGyver and Effertz', '133', '7', '2', '74023', '50 Stephen Alley', '34', '10.58', '352.28', '205.17', '351.19', '2018-02-02 00:00:00', '2018-03-23 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('168', 'Flowdesk', 'NL-27742', 'Apparatus', '21', '749.26', 'Pollens - Trees, Walnut, Black Juglans nigra', 'Breeze', 'Rogahn, McClure and Bailey', '133', '7', '4', '62092', '22026 Brickson Park Road', '71', '4.25', '17.85', '86.82', '324.95', '2018-02-05 00:00:00', '2018-03-22 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('169', 'Rank', 'KX-90043', 'Household', '11', '692.32', 'Curvularia inequalis', 'Laser', 'Powlowski-Schowalter', '133', '7', '6', '64034', '55 Burrows Alley', '87', '23.12', '67.77', '381.99', '336.57', '2018-02-06 00:00:00', '2018-03-05 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('170', 'It', 'ZC-83318', 'Apparatus', '22', '628.60', 'Alcohol Free Foam Sanitizer', 'Mustang', 'Corwin-Halvorson', '133', '7', '2', '63286', '61777 Sachs Crossing', '17', '3.25', '147.16', '137.06', '276.11', '2018-02-12 00:00:00', '2018-03-27 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('171', 'Domainer', 'FK-66738', 'Apparatus', '75', '328.00', 'ONDANSETRON', 'Impreza', 'Krajcik-Pagac', '133', '7', '5', '27616', '25 Eastwood Crossing', '05', '7.49', '26.11', '149.75', '384.48', '2018-02-07 00:00:00', '2018-03-08 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('172', 'Matsoft', 'FT-29323', 'Household', '31', '246.54', 'Childrens Cetirizine Hydrochloride Allergy', 'Prius c', 'Waelchi-Jacobi', '133', '7', '4', '73855', '0444 Nelson Drive', '41', '8.17', '455.05', '211.02', '423.63', '2018-02-25 00:00:00', '2018-03-20 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('173', 'Overhold', 'OQ-38741', 'Household', '86', '824.21', 'BareMinerals Medium Deep matte', 'I', 'Howe LLC', '133', '7', '4', '55983', '60537 Emmet Trail', '73', '24.98', '452.48', '201.25', '430.79', '2018-02-05 00:00:00', '2018-03-10 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('174', 'Stim', 'YY-73702', 'Hybrid', '16', '204.16', 'Doxycycline', 'Sonoma', 'Armstrong and Sons', '133', '7', '5', '83379', '55 Sycamore Point', '93', '4.52', '223.21', '497.80', '470.39', '2018-02-24 00:00:00', '2018-03-03 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('175', 'Veribet', 'CB-04272', 'Work Tools', '14', '43.59', 'Fioricet', 'Corvette', 'Beier-Franecki', '133', '7', '2', '51535', '84511 Dunning Point', '51', '14.54', '358.07', '430.35', '225.86', '2018-02-01 00:00:00', '2018-03-22 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('176', 'Bamity', 'CC-62767', 'Gadget', '12', '628.60', 'Revalife', 'V8 Vantage', 'Bernhard, Rippin and Reichert', '133', '7', '5', '61514', '4 Logan Road', '92', '1.19', '258.80', '93.89', '126.62', '2018-02-03 00:00:00', '2018-03-18 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('177', 'Voyatouch', 'VQ-70897', 'Work Tools', '0', '828.98', 'clobetasol propionate', 'Silverado 1500', 'Romaguera, Grimes and Bergnaum', '133', '7', '3', '46146', '59 Gina Crossing', '85', '10.91', '382.58', '171.00', '450.49', '2018-02-24 00:00:00', '2018-03-08 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('178', 'Zamit', 'QR-24457', 'Gadget', '27', '369.63', 'Losartan Potassium', 'Forte', 'Cummings, Huels and Ritchie', '133', '7', '4', '50711', '074 Larry Terrace', '13', '7.44', '439.49', '274.12', '159.25', '2018-02-14 00:00:00', '2018-03-29 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('179', 'Cardify', 'XI-96304', 'Work Tools', '23', '683.92', 'Black Oak', 'Suburban', 'Marks-Kovacek', '133', '7', '2', '87637', '229 Prairieview Hill', '37', '27.99', '415.81', '443.70', '141.13', '2018-02-27 00:00:00', '2018-03-02 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('180', 'Keylex', 'UE-05326', 'Work Tools', '38', '235.19', 'Sodium Chloride', 'Yukon', 'Keebler and Sons', '133', '7', '2', '11940', '1874 Jackson Crossing', '64', '27.03', '310.91', '211.84', '463.38', '2018-02-25 00:00:00', '2018-03-01 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('181', 'Fintone', 'QR-42256', 'Hybrid', '2', '347.43', 'ASACOL HD', 'Range Rover', 'Hilpert, Bogan and Boyle', '133', '7', '5', '3016', '8468 Brown Park', '28', '22.12', '355.93', '196.18', '7.11', '2018-02-11 00:00:00', '2018-03-22 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('182', 'Stim', 'RV-19764', 'Household', '69', '435.86', 'Wash-Up Towelette', 'Trooper', 'Hauck LLC', '133', '7', '6', '15515', '83 Dottie Avenue', '02', '6.71', '303.98', '483.90', '114.71', '2018-02-04 00:00:00', '2018-03-18 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('183', 'Zaam-Dox', 'PX-76443', 'Hybrid', '50', '129.88', 'Advanced Eye Relief Dry Eye Rejuvenation', 'Dakota Club', 'Weissnat-Haag', '133', '7', '2', '83117', '51 Crest Line Alley', '53', '22.93', '82.39', '108.07', '231.34', '2018-02-23 00:00:00', '2018-03-17 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('184', 'Zathin', 'ST-74863', 'Work Tools', '83', '361.86', 'Chlordiazepoxide Hydrochloride', 'Maxima', 'Williamson and Sons', '133', '7', '3', '64458', '5003 4th Junction', '78', '28.77', '158.77', '98.41', '128.53', '2018-02-18 00:00:00', '2018-03-14 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('185', 'Fix San', 'UW-36083', 'Work Tools', '40', '804.49', 'Benzonatate', 'Grand Prix', 'Brown-Waters', '133', '7', '4', '55871', '9877 Mandrake Pass', '85', '25.21', '486.56', '87.04', '336.73', '2018-02-21 00:00:00', '2018-03-21 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('186', 'Sonair', 'VX-47042', 'Apparatus', '12', '95.84', 'epinephrine', 'Sportvan G20', 'Keeling, Wuckert and Rodriguez', '133', '7', '6', '77868', '5839 Grasskamp Center', '12', '26.15', '37.20', '450.99', '218.85', '2018-02-23 00:00:00', '2018-03-24 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('187', 'Asoka', 'WQ-42713', 'Household', '62', '436.79', 'Penicillium notatum', 'Express 2500', 'Jerde, Lehner and Jenkins', '133', '7', '3', '4690', '68 Westridge Pass', '33', '8.28', '183.75', '94.31', '179.78', '2018-02-07 00:00:00', '2018-03-21 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('188', 'Y-find', 'QG-97681', 'Gadget', '75', '940.21', 'Cefadroxil', 'Justy', 'Olson Inc', '133', '7', '6', '92820', '203 Mccormick Court', '89', '28.97', '247.73', '191.76', '149.41', '2018-02-26 00:00:00', '2018-03-03 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('189', 'Sub-Ex', 'NY-58883', 'Hybrid', '62', '528.41', 'LEVONEST', 'TL', 'Leuschke-Hodkiewicz', '133', '7', '6', '62304', '7 Helena Drive', '34', '11.72', '89.16', '175.16', '474.02', '2018-02-09 00:00:00', '2018-03-26 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('190', 'Tempsoft', 'VG-97961', 'Work Tools', '38', '731.82', 'Bryonia Stannum', 'Mountaineer', 'Gerlach Group', '133', '7', '2', '90789', '152 Sutteridge Crossing', '43', '19.47', '209.24', '320.72', '458.79', '2018-02-05 00:00:00', '2018-03-30 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('191', 'Overhold', 'YX-25568', 'Hybrid', '3', '395.07', 'Tranexamic Acid', '6000', 'Wintheiser-Conn', '133', '7', '4', '80609', '4806 Roth Hill', '73', '21.37', '41.86', '197.94', '486.72', '2018-02-19 00:00:00', '2018-03-11 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('192', 'Span', 'YT-26068', 'Apparatus', '98', '997.86', 'MUCUS RELIEF', 'TundraMax', 'Orn, Dare and Dickens', '133', '7', '3', '67985', '55 Caliangt Drive', '16', '12.69', '421.01', '65.55', '243.95', '2018-02-16 00:00:00', '2018-03-20 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('193', 'Lotlux', 'XE-78277', 'Gadget', '13', '663.93', 'Lupron Depot-PED', 'Accord', 'Cruickshank-Kuhlman', '133', '7', '2', '39083', '7291 Hanson Place', '95', '15.80', '477.43', '285.02', '130.77', '2018-02-14 00:00:00', '2018-03-08 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('194', 'Zathin', 'GG-55897', 'Apparatus', '34', '134.76', 'leader nasal', 'Sonoma', 'Kirlin-Ratke', '133', '7', '6', '43017', '11358 Hayes Street', '24', '21.75', '117.48', '202.20', '237.20', '2018-02-17 00:00:00', '2018-03-30 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('195', 'Aerified', 'GX-74429', 'Gadget', '66', '146.08', 'AlphaNine', 'E-Series', 'Connelly LLC', '133', '7', '4', '67602', '80 Pierstorff Circle', '28', '12.15', '455.43', '158.04', '57.23', '2018-02-03 00:00:00', '2018-03-12 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('196', 'Opela', 'VY-07777', 'Household', '9', '924.78', 'NP Thyroid 60', 'Cayenne', 'Schneider-Kerluke', '133', '7', '3', '90828', '5564 Amoth Point', '21', '15.03', '27.99', '373.98', '13.94', '2018-02-01 00:00:00', '2018-03-06 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('197', 'Veribet', 'KQ-57083', 'Household', '66', '352.73', 'Olanzapine', 'Mustang', 'Jones, Morar and Gulgowski', '133', '7', '6', '94600', '74 Daystar Trail', '52', '14.76', '428.42', '464.33', '430.82', '2018-02-14 00:00:00', '2018-03-30 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('198', 'Overhold', 'QT-73443', 'Work Tools', '73', '202.80', 'Clonazepam', 'Legacy', 'Bayer, Kuphal and Wehner', '133', '7', '4', '79362', '74 Pankratz Street', '21', '13.40', '240.73', '197.61', '326.44', '2018-02-04 00:00:00', '2018-03-15 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('199', 'Toughjoyfax', 'GD-88270', 'Household', '16', '776.65', 'Oxygen', 'Taurus', 'Bernier-Marks', '133', '7', '2', '99588', '09 Grayhawk Junction', '58', '9.48', '433.56', '427.25', '357.98', '2018-02-17 00:00:00', '2018-03-27 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('200', 'Stronghold', 'LV-80232', 'Apparatus', '63', '186.37', 'Potassium Chloride', 'C30', 'Quigley, Ziemann and O\'Kon', '133', '7', '6', '66226', '8 Doe Crossing Junction', '76', '19.07', '19.87', '3.52', '158.97', '2018-02-02 00:00:00', '2018-03-11 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('201', 'Flexidy', 'XL-13859', 'Gadget', '84', '70.69', 'AGAVE CACTUS', 'Sedona', 'Rohan-Marks', '133', '7', '3', '62879', '255 Forest Way', '00', '10.54', '9.12', '193.51', '488.04', '2018-02-04 00:00:00', '2018-03-21 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('202', 'Stim', 'QM-93509', 'Household', '96', '324.05', 'Diclofenac Sodium', 'XJ Series', 'Hartmann LLC', '133', '7', '5', '20', '63139 Springs Drive', '16', '6.06', '126.28', '464.37', '319.53', '2018-02-04 00:00:00', '2018-03-09 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('203', 'Regrant', 'FD-56173', 'Hybrid', '78', '434.71', 'Sensorcaine', '2500 Club Coupe', 'Hagenes, Marvin and Kovacek', '133', '7', '6', '73295', '103 Onsgard Place', '70', '5.39', '218.85', '225.07', '26.69', '2018-02-02 00:00:00', '2018-03-12 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('204', 'Bytecard', 'NJ-12505', 'Gadget', '85', '427.34', 'LE BLANC', 'Corolla', 'Haley Group', '133', '7', '4', '80407', '05 Dunning Street', '84', '22.10', '57.68', '426.53', '306.19', '2018-02-03 00:00:00', '2018-03-30 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('205', 'Tempsoft', 'HE-98828', 'Work Tools', '62', '190.81', 'OXYGEN', 'Suburban 1500', 'Turcotte-Stiedemann', '133', '7', '6', '35891', '639 Meadow Vale Plaza', '89', '24.98', '293.37', '375.94', '364.47', '2018-02-27 00:00:00', '2018-03-04 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('206', 'Andalax', 'VU-62291', 'Household', '25', '96.48', 'Lancome Teint Miracle', 'Wrangler', 'McDermott Group', '133', '7', '5', '13914', '0633 Doe Crossing Trail', '39', '9.65', '160.82', '138.31', '489.00', '2018-02-13 00:00:00', '2018-03-28 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('207', 'Alphazap', 'IW-46809', 'Work Tools', '40', '215.37', 'Dexamethasone', 'XLR', 'Ward, Casper and Larkin', '133', '7', '5', '45572', '3 Luster Drive', '09', '14.08', '136.44', '482.83', '131.99', '2018-02-25 00:00:00', '2018-03-16 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('208', 'Voltsillam', 'UP-02341', 'Work Tools', '79', '659.94', 'Sulphur Kit Refill', 'MX-3', 'Maggio, Quigley and Bahringer', '133', '7', '2', '77868', '64 Kensington Trail', '70', '28.39', '250.19', '220.61', '370.57', '2018-02-19 00:00:00', '2018-03-05 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('209', 'Aerified', 'PV-26567', 'Gadget', '68', '863.85', 'Levofloxacin', 'Z4', 'Ziemann, Rau and Gorczany', '133', '7', '4', '372', '45 Westport Crossing', '71', '11.30', '28.03', '82.51', '41.09', '2018-02-27 00:00:00', '2018-03-10 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('210', 'Stronghold', 'KV-56018', 'Work Tools', '89', '306.51', 'Aspirin', 'Express 2500', 'Baumbach-Halvorson', '133', '7', '2', '48393', '23 Thompson Lane', '28', '13.00', '125.04', '276.82', '176.96', '2018-02-25 00:00:00', '2018-03-18 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('211', 'Kanlam', 'AH-27405', 'Hybrid', '55', '274.48', 'AVANDAMET', 'Trooper', 'Rippin, Parisian and Berge', '133', '7', '3', '62930', '53 Anthes Street', '79', '22.25', '364.16', '58.94', '317.72', '2018-02-07 00:00:00', '2018-03-29 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('212', 'Zaam-Dox', 'DA-31410', 'Hybrid', '97', '194.80', 'Trandolapril', 'Rabbit', 'Kihn-McKenzie', '133', '7', '3', '51943', '6278 Arkansas Pass', '88', '23.24', '31.12', '174.09', '389.89', '2018-02-08 00:00:00', '2018-03-15 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('213', 'Cardguard', 'DS-43618', 'Hybrid', '4', '472.23', 'Oxygen', 'Aurora', 'Huel-Bahringer', '133', '7', '5', '28335', '87130 Debs Place', '92', '5.20', '108.63', '444.04', '438.26', '2018-02-09 00:00:00', '2018-03-23 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('214', 'Biodex', 'AI-41886', 'Household', '56', '872.77', 'Thalomid', 'Protege', 'Effertz and Sons', '133', '7', '6', '94891', '3642 Dwight Terrace', '83', '20.90', '384.23', '366.57', '188.83', '2018-02-08 00:00:00', '2018-03-18 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('215', 'Zamit', 'GE-48423', 'Work Tools', '77', '474.57', 'Fungoid Tincture Treatment Kit', 'Grand Voyager', 'Kemmer, Runolfsson and Mann', '133', '7', '4', '40685', '70090 Graedel Point', '30', '22.24', '134.52', '165.25', '238.10', '2018-02-04 00:00:00', '2018-03-19 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('216', 'Viva', 'RU-73958', 'Apparatus', '41', '434.44', 'ADSOL Red Cell Preservation Solution System in Plastic Container (PL 146 Plastic)', 'Jetta', 'McLaughlin, Maggio and Konopelski', '133', '7', '3', '99211', '9563 Emmet Street', '02', '20.10', '473.83', '45.45', '371.43', '2018-02-11 00:00:00', '2018-03-13 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('217', 'Gembucket', 'FP-65666', 'Work Tools', '24', '657.03', 'Meloxicam', 'Azure', 'Schneider and Sons', '133', '7', '2', '95408', '9 Nelson Pass', '99', '24.03', '265.97', '441.42', '35.99', '2018-02-02 00:00:00', '2018-03-25 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('218', 'Tampflex', 'BA-57859', 'Household', '8', '942.68', 'Lithium Carbonate', '7 Series', 'Upton and Sons', '133', '7', '2', '2136', '968 Oxford Court', '41', '10.25', '236.69', '163.44', '301.23', '2018-02-26 00:00:00', '2018-03-22 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('219', 'Cardify', 'UI-11825', 'Work Tools', '37', '211.03', 'OPANA', 'CL-Class', 'Schmidt, Wiegand and Abernathy', '133', '7', '2', '2558', '32416 La Follette Court', '89', '24.40', '474.08', '65.71', '304.98', '2018-02-08 00:00:00', '2018-03-07 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('220', 'Y-find', 'IM-34225', 'Gadget', '57', '221.54', 'Clonidine Hydrochloride', 'G-Series 2500', 'Johnson-Bahringer', '133', '7', '5', '11069', '1359 Prairie Rose Lane', '19', '6.93', '260.96', '200.53', '267.27', '2018-02-20 00:00:00', '2018-03-27 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('221', 'It', 'NP-78527', 'Work Tools', '69', '867.62', 'Promethazine Hydrochloride', 'CL-Class', 'Mitchell-Smith', '133', '7', '5', '53659', '1 Erie Park', '21', '1.97', '68.70', '135.88', '283.60', '2018-02-16 00:00:00', '2018-03-11 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('222', 'Lotlux', 'UA-19546', 'Household', '49', '268.08', 'Neurontin', 'Rally Wagon 1500', 'Deckow-Hoeger', '133', '7', '6', '28539', '9 Longview Trail', '58', '26.31', '254.92', '167.04', '2.51', '2018-02-07 00:00:00', '2018-03-10 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('223', 'Ventosanzap', 'IS-01353', 'Apparatus', '79', '225.93', 'Clorox CareConcepts Perineal Cleansing', 'F430 Spider', 'Schroeder-Hammes', '133', '7', '3', '53403', '638 Ryan Court', '39', '17.16', '142.10', '190.77', '276.83', '2018-02-03 00:00:00', '2018-03-20 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('224', 'It', 'ZF-79818', 'Hybrid', '69', '60.91', 'Nicorette', 'Lancer', 'Gaylord Group', '133', '7', '3', '22621', '0 Esch Point', '71', '4.07', '43.19', '287.11', '320.47', '2018-02-19 00:00:00', '2018-03-20 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('225', 'Overhold', 'RC-85484', 'Apparatus', '21', '715.74', 'Ciprofloxacin', 'Grand Marquis', 'Thiel, Lubowitz and Lind', '133', '7', '4', '60088', '7 Mallard Road', '47', '11.24', '292.51', '39.81', '387.38', '2018-02-02 00:00:00', '2018-03-27 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('226', 'Asoka', 'PZ-75460', 'Work Tools', '89', '783.16', 'ShopRite Acid Reducer', 'M5', 'Nienow-McKenzie', '133', '7', '2', '59971', '17402 Buena Vista Road', '07', '16.90', '30.82', '350.40', '56.28', '2018-02-21 00:00:00', '2018-03-30 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('227', 'Otcom', 'ZR-62939', 'Work Tools', '39', '320.63', 'Heartburn Relief', 'rio', 'Collins-Ferry', '133', '7', '6', '77298', '63 Oxford Way', '98', '18.84', '41.54', '285.67', '236.61', '2018-02-11 00:00:00', '2018-03-10 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('228', 'Vagram', 'XW-42665', 'Work Tools', '47', '176.88', 'Hydrocortisone Butyrate', 'Eurovan', 'Bashirian-Murazik', '133', '7', '4', '91221', '47 Carey Crossing', '34', '8.41', '60.39', '486.07', '85.89', '2018-02-06 00:00:00', '2018-03-24 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('229', 'Zontrax', 'CT-26141', 'Work Tools', '68', '480.17', 'Metoprolol Succinate', 'Crown Victoria', 'Becker-Powlowski', '133', '7', '5', '59002', '0 Spohn Junction', '80', '15.22', '329.89', '489.80', '248.52', '2018-02-11 00:00:00', '2018-03-08 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('230', 'Mat Lam Tam', 'CD-86313', 'Household', '45', '175.01', 'Metformin hydrochloride', 'Yukon', 'Jenkins-Graham', '133', '7', '6', '37718', '5 Beilfuss Place', '85', '5.92', '53.16', '108.52', '252.39', '2018-02-12 00:00:00', '2018-03-23 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('231', 'Treeflex', 'TU-23602', 'Work Tools', '27', '417.77', 'Climara Pro', 'Solara', 'Wuckert-Langosh', '133', '7', '2', '63899', '26879 Talmadge Plaza', '18', '29.30', '359.68', '458.45', '330.78', '2018-02-25 00:00:00', '2018-03-25 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('232', 'Wrapsafe', 'UA-20030', 'Work Tools', '4', '405.20', 'Coppertone Tattoo Guard', 'J', 'Nikolaus and Sons', '133', '7', '3', '85977', '66840 Buell Center', '19', '5.03', '294.48', '433.04', '242.81', '2018-02-07 00:00:00', '2018-03-27 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('233', 'Sonsing', 'TJ-16879', 'Apparatus', '14', '218.80', 'Escitalopram Oxalate', 'Uplander', 'O\'Keefe Group', '133', '7', '5', '14996', '44084 Sutteridge Court', '49', '10.50', '406.76', '406.48', '158.20', '2018-02-26 00:00:00', '2018-03-24 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('234', 'Tresom', 'BP-54661', 'Household', '83', '936.71', 'Oxygen', 'Bravada', 'Williamson and Sons', '133', '7', '3', '91808', '10 Schmedeman Circle', '80', '15.74', '357.58', '445.07', '42.27', '2018-02-18 00:00:00', '2018-03-08 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('235', 'Home Ing', 'UO-64335', 'Gadget', '85', '793.06', 'Zorbtive', '626', 'Blanda-Shanahan', '133', '7', '3', '86309', '0 Elgar Avenue', '95', '18.15', '487.46', '326.32', '179.65', '2018-02-22 00:00:00', '2018-03-04 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('236', 'Biodex', 'MY-38566', 'Apparatus', '0', '913.91', 'Green Guard PMS Relief', 'Rockette', 'Hartmann LLC', '133', '7', '2', '68520', '82053 Almo Point', '40', '8.22', '80.98', '359.64', '238.87', '2018-02-21 00:00:00', '2018-03-22 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('237', 'Keylex', 'QR-77911', 'Gadget', '91', '245.66', 'LIGUSTRUM VULGARE POLLEN', 'S-Class', 'Dickinson, Larson and Collins', '133', '7', '2', '31637', '8 Steensland Junction', '36', '4.48', '140.98', '138.72', '476.29', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('238', 'Biodex', 'LB-87794', 'Gadget', '28', '818.57', 'Torsemide', '4Runner', 'Bergnaum-Emmerich', '133', '7', '5', '72662', '3759 Del Sol Street', '37', '26.19', '167.46', '291.81', '180.91', '2018-02-02 00:00:00', '2018-03-21 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('239', 'Y-Solowarm', 'RH-97121', 'Gadget', '73', '834.20', 'Standardized Mite, Dermatophagoides farinae, Scratch or Bulk, 30000 AU per mL', 'X6 M', 'Lind, Roob and Zieme', '133', '7', '3', '28897', '539 Stuart Avenue', '37', '12.78', '70.57', '17.09', '285.60', '2018-02-21 00:00:00', '2018-03-05 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('240', 'Subin', 'VJ-19068', 'Household', '0', '935.94', 'Leader TabTussin 400', 'Viper', 'Bode, Kutch and Krajcik', '133', '7', '6', '94574', '8862 Corscot Junction', '67', '5.63', '44.45', '181.19', '458.73', '2018-02-26 00:00:00', '2018-03-16 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('241', 'Fintone', 'WY-56416', 'Household', '23', '733.79', 'Suave', '88', 'Simonis, Schoen and Stokes', '133', '7', '6', '61763', '3 Oneill Place', '56', '2.73', '102.35', '64.00', '472.73', '2018-02-19 00:00:00', '2018-03-25 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('242', 'Fixflex', 'CJ-25991', 'Apparatus', '28', '854.08', 'ARNISPORT', 'Ram Wagon B350', 'Conroy, Daniel and Rolfson', '133', '7', '6', '97007', '8957 Tennyson Lane', '67', '23.95', '57.56', '313.44', '102.83', '2018-02-21 00:00:00', '2018-03-23 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('243', 'Ronstring', 'IZ-90785', 'Gadget', '21', '495.52', 'Stribild', 'Ranger', 'McClure, Koepp and Sawayn', '133', '7', '5', '56402', '44 Loeprich Place', '45', '8.27', '357.14', '394.54', '76.76', '2018-02-07 00:00:00', '2018-03-11 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('244', 'Tres-Zap', 'SC-32352', 'Apparatus', '58', '941.37', 'OXYGEN', 'MKX', 'Quigley LLC', '133', '7', '4', '57136', '9901 Comanche Street', '60', '4.85', '416.34', '488.96', '28.44', '2018-02-21 00:00:00', '2018-03-25 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('245', 'Sonair', 'WM-45942', 'Apparatus', '43', '913.52', 'SHISEIDO ADVANCED HYDRO-LIQUID COMPACT (REFILL)', 'FJ Cruiser', 'Schinner, Monahan and Fahey', '133', '7', '3', '61211', '40976 Lillian Pass', '92', '3.06', '378.97', '209.52', '10.51', '2018-02-20 00:00:00', '2018-03-16 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('246', 'Asoka', 'EI-14169', 'Work Tools', '7', '577.97', 'Sucralfate', 'Ranger', 'Nicolas and Sons', '133', '7', '6', '23253', '20 Kennedy Plaza', '16', '22.41', '260.46', '464.45', '254.91', '2018-02-07 00:00:00', '2018-03-01 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('247', 'Pannier', 'ZB-66919', 'Gadget', '94', '335.95', 'VYTORIN', 'MPV', 'Shanahan-Quigley', '133', '7', '3', '73989', '88 Hoffman Place', '30', '21.08', '445.30', '126.46', '326.57', '2018-02-12 00:00:00', '2018-03-25 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('248', 'Zontrax', 'EB-56393', 'Work Tools', '91', '783.05', 'ALUMEN', 'Yukon Denali', 'Klocko, Schinner and Feeney', '133', '7', '3', '8568', '0844 Darwin Hill', '30', '18.38', '346.40', '373.40', '87.58', '2018-02-14 00:00:00', '2018-03-25 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('249', 'Matsoft', 'AH-02259', 'Household', '25', '724.90', 'good sense all day pain relief', 'Familia', 'Kunze and Sons', '133', '7', '3', '72897', '70 Caliangt Plaza', '82', '23.24', '7.51', '320.85', '236.94', '2018-02-06 00:00:00', '2018-03-22 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('250', 'Y-Solowarm', 'HP-34147', 'Work Tools', '38', '752.57', 'Ipratropium Bromide', '911', 'Gerhold-Herzog', '133', '7', '4', '30675', '05521 Melvin Avenue', '33', '25.06', '209.78', '74.80', '469.09', '2018-02-13 00:00:00', '2018-03-02 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('251', 'Viva', 'RG-74371', 'Gadget', '35', '261.85', 'Demadex', 'Ram Van 2500', 'Larson Inc', '133', '7', '2', '53427', '05 Meadow Valley Lane', '60', '20.38', '164.06', '310.98', '201.50', '2018-02-22 00:00:00', '2018-03-25 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('252', 'Viva', 'XL-36276', 'Apparatus', '76', '289.40', 'Montelukast Sodium', 'G35', 'Kutch and Sons', '133', '7', '4', '99588', '4786 Twin Pines Junction', '05', '14.91', '280.22', '457.68', '210.29', '2018-02-16 00:00:00', '2018-03-18 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('253', 'Aerified', 'TE-08870', 'Hybrid', '42', '239.35', 'Ketoprofen', 'Civic', 'Beahan-Connelly', '133', '7', '4', '79259', '9 Everett Plaza', '17', '17.04', '75.93', '52.75', '115.17', '2018-02-14 00:00:00', '2018-03-23 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('254', 'Tin', 'QP-65915', 'Apparatus', '51', '350.74', 'Ribavirin', 'Optima', 'Fahey-Schmidt', '133', '7', '3', '90971', '38124 Mayer Drive', '38', '12.11', '261.62', '413.73', '95.84', '2018-02-21 00:00:00', '2018-03-04 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('255', 'Cardguard', 'NS-74036', 'Hybrid', '53', '874.45', 'Shopko Antibacterial Hand Sanitizer', 'Bronco', 'Bartoletti Group', '133', '7', '5', '56352', '91 Esch Hill', '64', '28.18', '346.28', '223.75', '117.86', '2018-02-23 00:00:00', '2018-03-24 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('256', 'Namfix', 'BT-56044', 'Apparatus', '66', '397.02', 'SENEXON-S', 'Passport', 'Renner LLC', '133', '7', '3', '91721', '867 Jenna Drive', '08', '2.55', '98.05', '490.02', '4.77', '2018-02-16 00:00:00', '2018-03-08 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('257', 'Biodex', 'AW-67744', 'Household', '93', '176.08', 'Lotensin HCT', 'Club Wagon', 'Upton LLC', '133', '7', '5', '91580', '171 Crest Line Center', '83', '17.47', '115.57', '338.65', '162.48', '2018-02-14 00:00:00', '2018-03-29 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('258', 'Stronghold', 'VL-21507', 'Hybrid', '64', '871.53', 'Mastic Dent', 'Cayenne', 'Schulist-Jones', '133', '7', '6', '9574', '2 Hoepker Circle', '53', '14.98', '423.15', '220.93', '313.51', '2018-02-24 00:00:00', '2018-03-15 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('259', 'Overhold', 'ML-66056', 'Gadget', '77', '286.85', 'Axe', '1000', 'Russel-Windler', '133', '7', '3', '82728', '631 Hermina Center', '51', '22.21', '389.44', '297.70', '103.03', '2018-02-09 00:00:00', '2018-03-04 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('260', 'Wrapsafe', 'SY-89872', 'Work Tools', '67', '298.24', 'Elite Natural SPF 30', 'H3T', 'Emard, Kub and Stokes', '133', '7', '3', '2812', '4765 Old Shore Avenue', '40', '28.89', '480.22', '206.61', '412.93', '2018-02-20 00:00:00', '2018-03-05 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('261', 'Bigtax', 'RJ-81177', 'Household', '38', '107.81', 'COLGATE PROCLINICAL - Sparkling Mint', 'SLX', 'Morar-McCullough', '133', '7', '5', '9413', '89 Meadow Vale Crossing', '74', '12.88', '442.32', '126.47', '476.48', '2018-02-16 00:00:00', '2018-03-29 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('262', 'Job', 'ZZ-21116', 'Hybrid', '14', '844.86', 'Doxycycline Hyclate', 'Metro', 'Hudson and Sons', '133', '7', '4', '89889', '48706 Lunder Avenue', '48', '1.10', '428.85', '218.09', '357.43', '2018-02-07 00:00:00', '2018-03-29 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('263', 'Voltsillam', 'IZ-52737', 'Work Tools', '32', '452.05', 'PANCRELIPASE', 'Echo', 'Stark LLC', '133', '7', '5', '75335', '3 Bultman Alley', '83', '15.99', '150.45', '338.36', '320.15', '2018-02-15 00:00:00', '2018-03-19 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('264', 'Sonair', 'RU-51433', 'Apparatus', '23', '861.25', 'Diphenoxylate Hydrochloride and Atropine Sulfate', '3500', 'Gutmann-Feil', '133', '7', '5', '60111', '39 Summit Court', '50', '13.76', '46.46', '333.66', '248.61', '2018-02-11 00:00:00', '2018-03-17 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('265', 'Veribet', 'BC-59365', 'Apparatus', '75', '288.40', 'Sertraline Hydrochloride', '5 Series', 'Ward, Labadie and Ernser', '133', '7', '3', '50673', '3 Karstens Terrace', '33', '7.69', '366.47', '456.04', '270.72', '2018-02-22 00:00:00', '2018-03-14 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('266', 'Flowdesk', 'IZ-93961', 'Household', '84', '86.60', 'equaline infants pain and fever', 'Grand Marquis', 'Douglas-Miller', '133', '7', '4', '34970', '6256 Commercial Junction', '67', '5.22', '82.84', '405.63', '306.75', '2018-02-01 00:00:00', '2018-03-05 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('267', 'Zamit', 'WV-41622', 'Work Tools', '7', '923.69', 'WHITE POTATO', 'Jetta', 'Gerlach-O\'Reilly', '133', '7', '5', '43420', '84 Elmside Crossing', '47', '18.04', '497.89', '327.69', '172.53', '2018-02-06 00:00:00', '2018-03-19 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('268', 'Bigtax', 'CP-64270', 'Work Tools', '70', '576.05', 'FlexGen', 'C8', 'Trantow-Von', '133', '7', '3', '42347', '261 Hoard Court', '17', '20.96', '323.07', '1.33', '193.40', '2018-02-25 00:00:00', '2018-03-08 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('269', 'Trippledex', 'ZY-50153', 'Work Tools', '47', '23.07', 'Health', 'tC', 'Cremin Group', '133', '7', '6', '23221', '8 Crownhardt Circle', '68', '12.51', '248.47', '419.42', '289.18', '2018-02-23 00:00:00', '2018-03-04 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('270', 'Alphazap', 'PL-28808', 'Gadget', '51', '45.55', 'ESIKA Extreme Moisturizing SPF 16', 'ES', 'Johnson-McClure', '133', '7', '2', '12099', '03559 Maple Court', '74', '14.13', '92.32', '143.19', '18.43', '2018-02-27 00:00:00', '2018-03-09 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('271', 'Otcom', 'IO-87834', 'Work Tools', '46', '407.28', 'Climara', 'Trooper', 'Balistreri-Frami', '133', '7', '4', '93854', '79 Bluejay Circle', '39', '12.86', '417.47', '465.23', '251.55', '2018-02-13 00:00:00', '2018-03-16 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('272', 'Mat Lam Tam', 'GA-68402', 'Gadget', '90', '911.32', 'Potassium Chloride', 'M3', 'Bergstrom, Hauck and Rau', '133', '7', '2', '58351', '867 Troy Alley', '18', '14.03', '142.35', '87.92', '288.56', '2018-02-19 00:00:00', '2018-03-09 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('273', 'Flexidy', 'LJ-17417', 'Gadget', '80', '487.81', 'PERIPLANETA AMERICANA', 'Grand Prix', 'Crist, Kulas and McCullough', '133', '7', '3', '3125', '36 Sunbrook Alley', '78', '24.41', '188.23', '183.99', '444.26', '2018-02-02 00:00:00', '2018-03-11 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('274', 'Cardguard', 'GP-71228', 'Work Tools', '56', '209.48', 'Standardized Mite D. pteronyssinus', 'Aztek', 'Kemmer, Schimmel and Batz', '133', '7', '2', '16551', '45580 Butternut Junction', '99', '21.06', '44.27', '32.00', '190.26', '2018-02-07 00:00:00', '2018-03-20 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('275', 'Biodex', 'TB-25834', 'Household', '58', '320.79', 'PERTZYE', 'Justy', 'Sanford-Wyman', '133', '7', '2', '70504', '08859 Maple Wood Court', '23', '4.52', '119.75', '92.43', '154.01', '2018-02-01 00:00:00', '2018-03-10 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('276', 'Sub-Ex', 'YP-77564', 'Gadget', '5', '728.44', 'M-END', 'PT Cruiser', 'Kemmer, Weber and Pacocha', '133', '7', '6', '75329', '6 Mcguire Hill', '67', '29.32', '296.47', '151.54', '30.18', '2018-02-06 00:00:00', '2018-03-26 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('277', 'Cookley', 'GF-93460', 'Household', '45', '655.18', 'NITROGEN', 'RX-8', 'Schumm-Hirthe', '133', '7', '5', '36453', '781 Hudson Hill', '77', '8.03', '278.95', '106.11', '200.58', '2018-02-09 00:00:00', '2018-03-24 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('278', 'Cookley', 'IM-50328', 'Work Tools', '4', '258.94', 'Guanfacine', 'Viper', 'Predovic-Greenfelder', '133', '7', '2', '86753', '5244 Rowland Court', '09', '1.96', '110.05', '289.29', '480.66', '2018-02-11 00:00:00', '2018-03-17 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('279', 'Opela', 'KE-81892', 'Household', '99', '814.09', 'Clorox Care Concepts Antimicrobial', 'Grand Prix', 'Kuvalis, Stanton and Koelpin', '133', '7', '5', '39022', '938 Hauk Lane', '52', '4.58', '48.40', '376.03', '387.79', '2018-02-04 00:00:00', '2018-03-20 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('280', 'Zoolab', 'QE-48807', 'Work Tools', '46', '479.18', 'Foaming Hand Wash', 'GS', 'Littel-Hoppe', '133', '7', '5', '60670', '8 Golf View Hill', '29', '20.77', '42.37', '8.16', '465.91', '2018-02-27 00:00:00', '2018-03-10 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('281', 'Stronghold', 'RZ-44372', 'Gadget', '97', '705.06', 'care one allergy eye', 'GTI', 'Bogisich, Barton and Bosco', '133', '7', '2', '58582', '3 Stone Corner Plaza', '12', '2.81', '361.84', '154.68', '169.22', '2018-02-11 00:00:00', '2018-03-06 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('282', 'Fix San', 'AX-46877', 'Work Tools', '15', '101.60', 'Atorvastatin Calcium', 'Grand Marquis', 'Hoppe and Sons', '133', '7', '3', '28358', '25630 Logan Plaza', '84', '4.02', '164.03', '255.35', '405.79', '2018-02-15 00:00:00', '2018-03-26 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('283', 'Tres-Zap', 'QF-02826', 'Work Tools', '46', '840.83', 'Pleo Alb', 'Camaro', 'Dickens, Maggio and McCullough', '133', '7', '6', '69758', '145 Fordem Avenue', '83', '12.75', '61.52', '66.13', '175.46', '2018-02-24 00:00:00', '2018-03-24 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('284', 'Gembucket', 'LK-72144', 'Apparatus', '31', '101.16', 'DILTZAC', 'LR2', 'Hirthe-Vandervort', '133', '7', '6', '55606', '1326 Shopko Parkway', '62', '13.59', '257.12', '26.85', '462.04', '2018-02-14 00:00:00', '2018-03-10 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('285', 'Sonair', 'UC-24939', 'Hybrid', '16', '833.16', 'NEUROSPORA SITOPHILA', 'Magnum', 'Boyer LLC', '133', '7', '3', '61801', '08992 Almo Crossing', '31', '17.80', '238.86', '112.82', '366.18', '2018-02-24 00:00:00', '2018-03-05 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('286', 'Veribet', 'RJ-08706', 'Gadget', '28', '860.74', 'Gemfibrozil', 'Millenia', 'Marks, Ullrich and Haag', '133', '7', '6', '95127', '2 Loftsgordon Alley', '23', '10.31', '253.31', '196.59', '282.04', '2018-02-01 00:00:00', '2018-03-10 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('287', 'Bigtax', 'DS-37538', 'Household', '45', '496.96', 'Chloroquine Phosphate', 'Laser', 'Feil, Dare and Pfannerstill', '133', '7', '5', '21542', '6 Crowley Point', '95', '10.52', '285.57', '464.76', '229.09', '2018-02-11 00:00:00', '2018-03-19 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('288', 'Temp', 'MW-02893', 'Apparatus', '42', '195.25', 'Pleo Lat', 'MKT', 'Franecki and Sons', '133', '7', '5', '1587', '1575 Monument Point', '50', '1.90', '181.14', '121.97', '213.62', '2018-02-25 00:00:00', '2018-03-02 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('289', 'Daltfresh', 'MX-17734', 'Household', '82', '880.51', 'Otrexup', 'RX-7', 'Upton and Sons', '133', '7', '2', '12694', '7 Toban Avenue', '32', '6.49', '311.33', '437.75', '338.43', '2018-02-01 00:00:00', '2018-03-05 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('290', 'Mat Lam Tam', 'CV-27087', 'Gadget', '95', '603.81', 'Traumeel', 'Chariot', 'Harvey-Gibson', '133', '7', '6', '11508', '96332 Doe Crossing Trail', '83', '25.56', '112.41', '383.31', '392.91', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('291', 'Zamit', 'PS-26212', 'Household', '22', '124.73', 'Caffeine Citrate', 'Lanos', 'Stehr, Emard and Strosin', '133', '7', '4', '84639', '1990 Grim Pass', '96', '15.91', '223.92', '232.56', '17.09', '2018-02-20 00:00:00', '2018-03-18 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('292', 'Bigtax', 'IY-14808', 'Gadget', '58', '914.52', 'Naturasil', 'Laser', 'Reilly Group', '133', '7', '5', '97662', '297 Kim Lane', '58', '22.26', '388.31', '398.46', '445.18', '2018-02-16 00:00:00', '2018-03-22 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('293', 'Bigtax', 'PO-17429', 'Hybrid', '3', '122.16', 'Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate and Amphetamine Sulfate', 'Navigator L', 'Beier Group', '133', '7', '5', '84547', '5 Forster Court', '60', '27.32', '481.97', '339.57', '346.98', '2018-02-07 00:00:00', '2018-03-19 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('294', 'Tampflex', 'PE-96903', 'Hybrid', '82', '564.55', 'AIR', 'Ram 1500 Club', 'Lynch Group', '133', '7', '6', '57174', '9539 Pawling Terrace', '33', '2.98', '499.36', '110.95', '174.93', '2018-02-10 00:00:00', '2018-03-08 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('295', 'Home Ing', 'IO-66116', 'Hybrid', '89', '997.19', 'SULWHASOO EVENFAIR PERFECTING CUSHION NO.23', 'Z4', 'Ryan-Swift', '133', '7', '4', '1518', '365 Gerald Hill', '50', '4.63', '482.74', '433.35', '499.09', '2018-02-13 00:00:00', '2018-03-30 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('296', 'Overhold', 'KD-68077', 'Household', '14', '751.39', 'Itch Relief', 'Crown Victoria', 'Leffler-Towne', '133', '7', '5', '42850', '9459 Northview Alley', '40', '22.24', '410.42', '232.49', '95.15', '2018-02-19 00:00:00', '2018-03-04 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('297', 'Lotstring', 'LQ-18090', 'Household', '8', '134.60', 'Hard (Sugar) Maple', 'Bonneville', 'Donnelly-Langworth', '133', '7', '3', '27361', '2939 Heffernan Park', '14', '14.72', '187.58', '44.63', '328.84', '2018-02-16 00:00:00', '2018-03-30 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('298', 'Matsoft', 'VY-26201', 'Gadget', '53', '230.91', 'Adult Glycerin Laxative', 'Crown Victoria', 'Monahan-Blick', '133', '7', '4', '97533', '8807 Glendale Crossing', '38', '16.51', '147.38', '142.62', '175.85', '2018-02-01 00:00:00', '2018-03-15 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('299', 'Pannier', 'NB-58580', 'Hybrid', '48', '797.26', 'Lip Remedy Medicinal Lip Balm', 'Shadow', 'Wiegand, Walker and Runte', '133', '7', '3', '89642', '62165 Hansons Terrace', '64', '15.37', '26.00', '103.05', '375.23', '2018-02-15 00:00:00', '2018-03-08 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('300', 'Bytecard', 'PF-85713', 'Gadget', '70', '786.69', 'Fluoxetine', 'Dakota Club', 'O\'Connell, Ferry and Casper', '133', '7', '4', '58305', '05 Havey Street', '48', '12.45', '139.04', '243.32', '218.13', '2018-02-05 00:00:00', '2018-03-30 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('301', 'Zamit', 'HT-47651', 'Work Tools', '37', '885.44', 'Eczema', 'CLK-Class', 'O\'Keefe, Kohler and Lowe', '133', '7', '4', '31906', '61 Hollow Ridge Parkway', '89', '20.10', '296.47', '223.31', '299.70', '2018-02-14 00:00:00', '2018-03-02 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('302', 'Bitchip', 'EQ-79897', 'Household', '37', '464.92', 'clindamycin hydrochloride', '9000', 'Schuppe-Dooley', '133', '7', '5', '72144', '375 Cardinal Park', '16', '19.12', '81.74', '388.52', '68.70', '2018-02-19 00:00:00', '2018-03-01 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('303', 'Fix San', 'BG-26566', 'Gadget', '24', '49.72', 'HAND AND NATURE SANITIZER', 'Ram', 'Satterfield, Mohr and Sipes', '133', '7', '3', '20513', '43050 Clyde Gallagher Plaza', '53', '13.20', '138.52', '225.96', '223.77', '2018-02-26 00:00:00', '2018-03-10 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('304', 'Zamit', 'CX-08049', 'Work Tools', '30', '314.11', 'Medicated Apricot Scrub', 'D350', 'Brakus, Gorczany and Becker', '133', '7', '3', '56202', '0489 Vera Street', '45', '26.90', '256.74', '338.92', '172.43', '2018-02-10 00:00:00', '2018-03-07 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('305', 'Stronghold', 'QN-51370', 'Household', '26', '438.83', 'Moisturizing Hand Sanitizer', 'Ram Van 1500', 'Heidenreich-Waters', '133', '7', '2', '55854', '76 Clarendon Point', '68', '17.00', '351.25', '374.71', '30.83', '2018-02-11 00:00:00', '2018-03-30 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('306', 'Lotstring', 'YO-52107', 'Apparatus', '92', '754.15', 'DIETHYLPROPION HYDROCHLORIDE', 'Century', 'Hermann, Kirlin and Barton', '133', '7', '6', '89277', '7931 Kropf Lane', '35', '23.03', '76.35', '146.53', '480.29', '2018-02-19 00:00:00', '2018-03-28 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('307', 'It', 'FO-80501', 'Gadget', '0', '642.38', 'Fluphenazine Hydrochloride', 'XJ Series', 'Tromp-Kulas', '133', '7', '4', '6007', '86 Oakridge Avenue', '74', '2.01', '347.50', '104.27', '4.49', '2018-02-27 00:00:00', '2018-03-14 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('308', 'Duobam', 'JV-00027', 'Hybrid', '97', '740.56', 'Meclizine Hydrochloride', '100', 'Macejkovic, Cartwright and Langosh', '133', '7', '4', '92998', '7 Pine View Pass', '26', '19.47', '328.99', '204.89', '325.06', '2018-02-16 00:00:00', '2018-03-27 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('309', 'Treeflex', 'IR-09784', 'Hybrid', '60', '320.83', 'Feldene', 'Spyder', 'Runte, Kuhlman and Beer', '133', '7', '2', '13363', '003 Farragut Terrace', '59', '12.93', '322.82', '391.19', '76.34', '2018-02-26 00:00:00', '2018-03-01 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('310', 'Trippledex', 'VL-96600', 'Household', '37', '806.93', 'Topcare Ibuprofen', 'Crosstour', 'Rath, Toy and Jacobson', '133', '7', '3', '91161', '284 Melody Pass', '40', '14.59', '486.15', '330.03', '122.17', '2018-02-09 00:00:00', '2018-03-07 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('311', 'Sub-Ex', 'SJ-00562', 'Gadget', '15', '191.81', 'hydrocortisone', '929', 'Parisian Group', '133', '7', '4', '93850', '5620 Rieder Plaza', '05', '25.16', '410.93', '459.01', '53.07', '2018-02-24 00:00:00', '2018-03-30 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('312', 'Zaam-Dox', 'ZK-15244', 'Hybrid', '99', '327.89', 'ALAVERT ALLERGY', 'Esprit', 'Stamm, Zulauf and Witting', '133', '7', '2', '68995', '1 Beilfuss Center', '46', '14.98', '157.99', '486.50', '298.26', '2018-02-26 00:00:00', '2018-03-04 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('313', 'Tempsoft', 'IT-38282', 'Apparatus', '35', '650.92', 'Exforge', 'E-Series', 'McDermott LLC', '133', '7', '6', '78695', '40945 Messerschmidt Point', '98', '12.32', '121.80', '332.92', '157.55', '2018-02-12 00:00:00', '2018-03-04 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('314', 'Biodex', 'CW-03715', 'Household', '15', '339.11', 'Losartan Potassium and Hydrochlorothiazide', 'Dakota Club', 'Hartmann LLC', '133', '7', '3', '4128', '4 Sommers Center', '76', '9.35', '259.64', '437.12', '157.19', '2018-02-14 00:00:00', '2018-03-16 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('315', 'It', 'GR-35384', 'Gadget', '69', '232.74', 'Erborian BB Creme Au Ginseng', 'J', 'Kunze Inc', '133', '7', '2', '77009', '0650 Meadow Valley Lane', '22', '23.94', '315.14', '278.65', '297.44', '2018-02-12 00:00:00', '2018-03-13 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('316', 'Regrant', 'TI-69267', 'Work Tools', '75', '177.57', 'CLE DE PEAU BEAUTE REFINING FLUID FOUNDATION', 'Cooper', 'Hane, Streich and Breitenberg', '133', '7', '5', '65315', '83779 Gale Center', '93', '16.78', '380.46', '322.30', '83.09', '2018-02-07 00:00:00', '2018-03-30 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('317', 'Hatity', 'CB-39133', 'Gadget', '7', '548.24', 'NHS HEADACHE', 'Land Cruiser', 'Sanford, Buckridge and Mayert', '133', '7', '2', '50590', '8 Larry Pass', '42', '12.04', '475.10', '175.15', '37.35', '2018-02-19 00:00:00', '2018-03-20 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('318', 'Y-Solowarm', 'GU-23217', 'Household', '80', '109.29', 'Potassium Citrate', 'B-Series', 'Bergnaum, Tromp and Runolfsdottir', '133', '7', '5', '58885', '2 Red Cloud Road', '64', '8.66', '91.64', '296.51', '232.50', '2018-02-22 00:00:00', '2018-03-14 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('319', 'It', 'PN-15037', 'Apparatus', '70', '891.01', 'CPDA-1', 'IS', 'Bauch and Sons', '133', '7', '2', '19578', '2150 Atwood Lane', '29', '19.25', '143.27', '39.92', '329.08', '2018-02-10 00:00:00', '2018-03-22 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('320', 'Daltfresh', 'WR-14244', 'Household', '4', '541.93', 'Fenofibric acid', 'Montana', 'Conroy LLC', '133', '7', '2', '94083', '4 Caliangt Plaza', '60', '21.52', '5.32', '366.32', '189.29', '2018-02-02 00:00:00', '2018-03-13 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('321', 'Alpha', 'LV-05141', 'Gadget', '66', '326.13', 'UltrasolSunscreen', 'Range Rover', 'Rosenbaum and Sons', '133', '7', '3', '71075', '10218 Randy Hill', '78', '5.11', '31.06', '481.67', '441.15', '2018-02-21 00:00:00', '2018-03-16 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('322', 'Namfix', 'TS-48048', 'Apparatus', '58', '844.89', 'PAROXETINE', 'Lynx', 'Bednar, Casper and Borer', '133', '7', '4', '90841', '500 Fordem Alley', '05', '21.02', '9.17', '218.85', '37.68', '2018-02-19 00:00:00', '2018-03-22 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('323', 'Home Ing', 'VP-63969', 'Household', '51', '897.97', 'Xalatan', '9-5', 'Runolfsson, Keebler and Grimes', '133', '7', '4', '33429', '664 Dryden Circle', '12', '21.91', '199.48', '328.26', '397.06', '2018-02-08 00:00:00', '2018-03-15 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('324', 'Konklab', 'UA-53199', 'Work Tools', '89', '913.09', 'Olanzapine', 'Cabriolet', 'Tromp Group', '133', '7', '2', '8911', '3609 Kinsman Alley', '32', '18.44', '241.51', '11.91', '249.84', '2018-02-26 00:00:00', '2018-03-22 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('325', 'Bigtax', 'KI-48197', 'Hybrid', '47', '755.29', 'RISPERDAL', 'RS 6', 'Rogahn-Reynolds', '133', '7', '3', '78357', '7 Glacier Hill Junction', '12', '28.61', '37.61', '153.74', '173.77', '2018-02-10 00:00:00', '2018-03-02 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('326', 'Y-find', 'PL-60503', 'Work Tools', '94', '748.85', 'JANUVIA', 'Sorento', 'Skiles LLC', '133', '7', '5', '12211', '3 Forest Dale Street', '31', '6.24', '239.14', '52.87', '5.04', '2018-02-16 00:00:00', '2018-03-17 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('327', 'Tresom', 'JL-52192', 'Hybrid', '47', '59.47', 'CeraVe', 'Sonoma Club Coupe', 'Reynolds and Sons', '133', '7', '4', '28362', '5 Warbler Plaza', '88', '16.88', '339.44', '54.56', '483.91', '2018-02-01 00:00:00', '2018-03-09 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('328', 'It', 'UM-22974', 'Gadget', '78', '738.70', 'CLINIQUE', 'Grand Prix', 'Hills-Stanton', '133', '7', '3', '49441', '8810 Talisman Crossing', '94', '6.98', '48.77', '237.26', '267.18', '2018-02-11 00:00:00', '2018-03-20 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('329', 'Ventosanzap', 'FH-13847', 'Apparatus', '79', '788.12', 'Betamethasone Valerate', 'XF', 'Dietrich Inc', '133', '7', '4', '11617', '911 Rowland Drive', '01', '11.05', '464.64', '185.40', '449.01', '2018-02-12 00:00:00', '2018-03-05 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('330', 'Mat Lam Tam', 'ZN-81833', 'Work Tools', '58', '946.49', 'Elta MD UV Pure', 'Magnum', 'Emmerich, Littel and Quigley', '133', '7', '4', '58157', '5626 Kings Place', '88', '20.97', '260.59', '416.13', '461.41', '2018-02-02 00:00:00', '2018-03-19 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('331', 'Flowdesk', 'HS-19018', 'Household', '39', '580.69', 'VANCOMYCIN HYDROCHLORIDE', 'Town Car', 'Rosenbaum Inc', '133', '7', '5', '81179', '9675 Emmet Alley', '74', '20.45', '416.74', '80.72', '22.01', '2018-02-15 00:00:00', '2018-03-20 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('332', 'Tempsoft', 'RF-37755', 'Apparatus', '12', '800.72', 'Amlodipine Besylate', 'Vitara', 'Reichert, Thompson and Johnston', '133', '7', '4', '49452', '365 Lighthouse Bay Avenue', '09', '18.31', '34.89', '234.50', '2.75', '2018-02-16 00:00:00', '2018-03-08 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('333', 'Rank', 'MR-86995', 'Household', '99', '941.84', 'Lovastatin', 'Phantom', 'Hoppe LLC', '133', '7', '5', '61639', '07 Hallows Trail', '72', '5.93', '280.52', '460.82', '472.33', '2018-02-13 00:00:00', '2018-03-05 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('334', 'Bitchip', 'IX-28479', 'Household', '72', '576.75', 'Promethazine VC', 'Frontier', 'Upton-Green', '133', '7', '2', '47318', '605 4th Plaza', '26', '16.35', '72.39', '73.85', '400.59', '2018-02-01 00:00:00', '2018-03-04 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('335', 'Stim', 'JR-33150', 'Gadget', '41', '580.91', 'Warfarin Sodium', 'Tahoe', 'Hartmann Group', '133', '7', '5', '64290', '489 Oak Valley Hill', '67', '26.30', '119.03', '391.56', '257.13', '2018-02-24 00:00:00', '2018-03-26 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('336', 'Kanlam', 'BF-45942', 'Work Tools', '56', '936.54', 'Amlodipine', 'Spirit', 'Lehner Group', '133', '7', '6', '24225', '49 Kropf Circle', '89', '4.35', '35.51', '345.36', '355.37', '2018-02-09 00:00:00', '2018-03-17 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('337', 'Asoka', 'MA-33270', 'Hybrid', '81', '714.37', 'Lorazepam', 'Tundra', 'Fisher-Douglas', '133', '7', '5', '35654', '12 Moose Lane', '33', '20.09', '93.12', '18.84', '233.63', '2018-02-05 00:00:00', '2018-03-17 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('338', 'Treeflex', 'NY-57118', 'Apparatus', '41', '636.90', 'TOPOTECAN HYDROCHLORIDE', '911', 'Pouros-Quigley', '133', '7', '6', '72237', '3464 Thompson Trail', '89', '29.48', '271.47', '165.83', '345.95', '2018-02-24 00:00:00', '2018-03-21 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('339', 'Kanlam', 'CQ-74656', 'Hybrid', '50', '836.68', 'TISSEEL', 'C70', 'Runolfsdottir, Huels and Johnson', '133', '7', '3', '44858', '45687 Lighthouse Bay Way', '68', '26.85', '447.09', '363.61', '179.30', '2018-02-11 00:00:00', '2018-03-30 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('340', 'Cookley', 'KB-72219', 'Apparatus', '39', '678.05', 'Renagel', 'V12 Vantage', 'Kohler, Gerlach and Cartwright', '133', '7', '4', '81413', '7 Riverside Point', '31', '3.25', '476.19', '101.12', '275.34', '2018-02-15 00:00:00', '2018-03-30 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('341', 'Opela', 'LL-27450', 'Work Tools', '12', '711.11', 'Medrol', 'Montana SV6', 'Hoeger and Sons', '133', '7', '6', '24345', '10812 Fairfield Trail', '62', '1.26', '479.09', '5.24', '96.18', '2018-02-16 00:00:00', '2018-03-30 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('342', 'Latlux', 'XK-55947', 'Apparatus', '77', '580.14', 'NICOTINE POLACRILEX', 'Grand Prix', 'Harber-Hudson', '133', '7', '4', '13578', '8 Waywood Terrace', '24', '24.99', '443.29', '45.80', '225.07', '2018-02-22 00:00:00', '2018-03-10 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('343', 'Alphazap', 'CO-08919', 'Apparatus', '70', '90.37', 'Nicorette', 'B-Series Plus', 'Koepp Inc', '133', '7', '4', '63498', '58702 Mosinee Lane', '49', '13.75', '480.44', '480.64', '75.75', '2018-02-24 00:00:00', '2018-03-15 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('344', 'Fintone', 'AE-64391', 'Household', '20', '9.96', 'Assured Instant Hand Sanitizer', 'X5', 'Carter and Sons', '133', '7', '5', '60294', '67887 Bunker Hill Lane', '60', '22.19', '297.24', '165.12', '276.67', '2018-02-23 00:00:00', '2018-03-22 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('345', 'Ronstring', 'DY-86573', 'Apparatus', '4', '236.88', 'Calcium Chloride', 'Sebring', 'Ondricka LLC', '133', '7', '3', '35128', '2543 Fair Oaks Junction', '30', '23.08', '334.91', '36.69', '407.72', '2018-02-09 00:00:00', '2018-03-14 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('346', 'Y-Solowarm', 'OZ-47065', 'Household', '57', '220.89', 'Smith and Johnson Antibacterial', 'Astra', 'Volkman-Reichert', '133', '7', '6', '10300', '1 Magdeline Trail', '88', '15.68', '369.22', '208.50', '257.56', '2018-02-15 00:00:00', '2018-03-02 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('347', 'Bytecard', 'EL-80742', 'Hybrid', '14', '139.32', 'Sunmark sleep aid', 'Continental', 'Morar, Reichel and Wilderman', '133', '7', '5', '94523', '3425 Jenifer Crossing', '16', '3.97', '382.28', '460.04', '450.65', '2018-02-20 00:00:00', '2018-03-16 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('348', 'Temp', 'ST-42399', 'Work Tools', '48', '891.81', 'High Potency Heal Grief', 'Fusion', 'Daugherty, Satterfield and Thiel', '133', '7', '2', '70143', '97401 Tennyson Trail', '74', '1.57', '393.59', '174.94', '210.60', '2018-02-04 00:00:00', '2018-03-03 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('349', 'Stronghold', 'EO-13117', 'Work Tools', '24', '135.68', 'Good Neighbor Pharmacy Nicotine', 'Beretta', 'Volkman LLC', '133', '7', '4', '43374', '3 Mariners Cove Avenue', '57', '16.89', '211.08', '9.26', '485.99', '2018-02-01 00:00:00', '2018-03-01 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('350', 'Andalax', 'ZI-26946', 'Household', '72', '670.35', 'Cisplatin', 'Continental', 'Hyatt, Dickinson and Weimann', '133', '7', '4', '71082', '05513 1st Terrace', '51', '16.06', '41.53', '476.67', '439.63', '2018-02-04 00:00:00', '2018-03-17 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('351', 'Domainer', 'ZY-72858', 'Hybrid', '66', '735.89', 'Cytomegalovirus Remedy', 'RL', 'Kuvalis LLC', '133', '7', '6', '42233', '64990 Helena Center', '89', '3.37', '324.31', '347.72', '317.94', '2018-02-06 00:00:00', '2018-03-12 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('352', 'Aerified', 'MF-86289', 'Household', '27', '154.14', 'Navane', 'TT', 'Hermiston-Abernathy', '133', '7', '6', '32173', '738 Sachtjen Pass', '97', '5.96', '178.88', '365.44', '264.57', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('353', 'Duobam', 'ND-36849', 'Hybrid', '30', '330.00', 'Zenzedi', 'ES', 'Turcotte-Romaguera', '133', '7', '6', '13183', '2 Crescent Oaks Junction', '07', '23.43', '379.13', '402.57', '30.27', '2018-02-08 00:00:00', '2018-03-23 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('354', 'Tres-Zap', 'LE-99304', 'Apparatus', '26', '178.93', 'UltraMax Invisible Solid', 'Equinox', 'McCullough-Lynch', '133', '7', '3', '97310', '3 Clemons Lane', '97', '6.92', '112.80', '468.74', '34.09', '2018-02-13 00:00:00', '2018-03-19 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('355', 'Fixflex', 'XR-65443', 'Work Tools', '79', '829.33', 'Bioelements', 'Diamante', 'Larson-Schaefer', '133', '7', '4', '28201', '8 Kipling Parkway', '90', '8.50', '350.80', '463.84', '386.07', '2018-02-23 00:00:00', '2018-03-10 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('356', 'Mat Lam Tam', 'KV-67809', 'Apparatus', '56', '62.04', 'Acetaminophen and Codeine Phosphate', 'Grand Prix', 'Stroman, Shields and Boehm', '133', '7', '3', '42486', '53027 Banding Trail', '51', '9.82', '219.43', '439.99', '277.98', '2018-02-19 00:00:00', '2018-03-19 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('357', 'Vagram', 'KK-03395', 'Household', '94', '578.63', 'Amazonian Clay BB Tinted Moisturizer Broad Spectrum SPF 20 Sunscreen', 'Z8', 'Schroeder, Hane and Mayer', '133', '7', '4', '42968', '27 Jenna Terrace', '10', '10.99', '492.57', '173.09', '66.30', '2018-02-27 00:00:00', '2018-03-13 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('358', 'Mat Lam Tam', 'TV-08225', 'Gadget', '3', '29.32', 'Oxycodone and Acetaminophen', 'Quest', 'Durgan Inc', '133', '7', '6', '47056', '25 Helena Place', '26', '28.62', '451.69', '66.37', '239.29', '2018-02-18 00:00:00', '2018-03-27 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('359', 'Solarbreeze', 'GV-63645', 'Work Tools', '50', '807.01', 'Etodolac', 'Armada', 'Luettgen-Gerhold', '133', '7', '2', '95760', '26540 Meadow Ridge Pass', '65', '10.52', '75.24', '446.85', '48.39', '2018-02-16 00:00:00', '2018-03-23 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('360', 'Otcom', 'ZA-92590', 'Hybrid', '76', '878.18', 'White Alder', 'Firebird', 'Orn and Sons', '133', '7', '5', '31681', '70 Lakewood Pass', '77', '21.91', '14.43', '106.74', '21.60', '2018-02-17 00:00:00', '2018-03-18 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('361', 'Stringtough', 'OF-33241', 'Gadget', '63', '336.62', 'Misoprostol', 'Ram 1500', 'Smith-Schinner', '133', '7', '4', '73429', '139 Warrior Place', '27', '1.09', '390.50', '495.02', '437.58', '2018-02-02 00:00:00', '2018-03-02 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('362', 'Voltsillam', 'UF-93020', 'Work Tools', '92', '722.69', 'Hill Country Essentials', 'Ram 2500', 'Aufderhar Inc', '133', '7', '6', '14939', '0 Sheridan Crossing', '65', '25.04', '352.07', '48.14', '291.74', '2018-02-14 00:00:00', '2018-03-16 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('363', 'Tampflex', 'WL-36091', 'Work Tools', '16', '530.11', 'Qsymia', 'Dakota Club', 'Simonis, Kautzer and Feeney', '133', '7', '6', '67341', '0429 Clyde Gallagher Crossing', '83', '9.19', '360.21', '300.89', '25.82', '2018-02-27 00:00:00', '2018-03-18 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('364', 'Flowdesk', 'MY-74055', 'Gadget', '17', '28.37', 'Care One Hemorrhoidal', 'Suburban 1500', 'Beier-Schultz', '133', '7', '5', '55377', '132 Miller Avenue', '67', '8.75', '109.49', '445.44', '222.07', '2018-02-07 00:00:00', '2018-03-20 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('365', 'Ronstring', 'CO-18021', 'Hybrid', '9', '568.33', 'M-END', 'Range Rover Sport', 'Rodriguez Inc', '133', '7', '2', '4586', '16257 Anderson Terrace', '90', '20.74', '77.11', '220.55', '287.69', '2018-02-21 00:00:00', '2018-03-03 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('366', 'Tempsoft', 'WZ-09210', 'Work Tools', '62', '548.17', 'BPO Creamy Wash Complete Pack', 'Impreza', 'Fay-Schumm', '133', '7', '2', '98955', '645 Petterle Way', '56', '7.99', '216.78', '62.74', '470.25', '2018-02-07 00:00:00', '2018-03-26 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('367', 'Ronstring', 'TY-21322', 'Work Tools', '67', '779.76', 'HUMATROPE', 'Camaro', 'Wiza-Brekke', '133', '7', '4', '96657', '552 Little Fleur Pass', '38', '21.17', '133.57', '224.58', '329.31', '2018-02-21 00:00:00', '2018-03-22 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('368', 'Namfix', 'OV-25767', 'Gadget', '26', '454.41', 'Mepivacaine', 'Daewoo Lacetti', 'Bergnaum LLC', '133', '7', '5', '60477', '00 Dryden Trail', '20', '8.76', '432.18', '25.73', '105.91', '2018-02-24 00:00:00', '2018-03-07 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('369', 'Latlux', 'AH-63456', 'Apparatus', '8', '847.62', 'Propranolol Hydrochloride', 'J', 'Mann, Schultz and Keebler', '133', '7', '3', '71587', '99 Rutledge Way', '24', '6.09', '263.89', '34.53', '325.80', '2018-02-10 00:00:00', '2018-03-02 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('370', 'Stim', 'XY-20843', 'Apparatus', '41', '385.84', 'Cough Relief Grape', 'Altima', 'Balistreri-Nienow', '133', '7', '4', '12819', '730 Morningstar Alley', '77', '9.59', '499.38', '299.33', '329.95', '2018-02-13 00:00:00', '2018-03-01 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('371', 'Aerified', 'MZ-45044', 'Gadget', '77', '33.79', 'SoonSoo gargle', 'S-Class', 'Zulauf Inc', '133', '7', '5', '97769', '5 Rigney Terrace', '24', '19.60', '7.10', '499.69', '182.75', '2018-02-22 00:00:00', '2018-03-12 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('372', 'Zontrax', 'UA-92339', 'Household', '4', '408.96', 'granisetron hydrochloride', 'Crown Victoria', 'Roberts, Kunde and King', '133', '7', '3', '37010', '9 Aberg Road', '42', '15.12', '8.97', '423.01', '315.94', '2018-02-20 00:00:00', '2018-03-16 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('373', 'It', 'LN-35127', 'Apparatus', '80', '743.46', 'HAMSOA DR ATOBY FOAMING WASH', 'Continental', 'Waters-Kutch', '133', '7', '4', '65263', '29798 Moose Avenue', '29', '4.75', '327.14', '272.65', '95.61', '2018-02-18 00:00:00', '2018-03-30 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('374', 'Andalax', 'CB-75863', 'Work Tools', '32', '201.85', 'Mycophenolate mofetil', 'Maxima', 'Beahan Inc', '133', '7', '6', '86780', '7 Manufacturers Crossing', '91', '9.17', '223.99', '459.64', '375.10', '2018-02-12 00:00:00', '2018-03-05 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('375', 'Asoka', 'UY-63090', 'Work Tools', '53', '664.06', 'Trandolapril', 'Ranger', 'D\'Amore-Dickinson', '133', '7', '2', '37742', '316 Elmside Terrace', '23', '21.77', '100.05', '450.89', '230.96', '2018-02-11 00:00:00', '2018-03-18 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('376', 'Konklab', 'IX-61904', 'Gadget', '82', '74.62', '3M Avagard D', 'Solara', 'Marquardt LLC', '133', '7', '4', '63151', '7 Mcguire Circle', '26', '28.40', '189.47', '447.50', '462.96', '2018-02-15 00:00:00', '2018-03-10 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('377', 'Regrant', 'HB-73458', 'Household', '33', '932.32', 'Pantoprazole', '3000GT', 'Hintz and Sons', '133', '7', '2', '42087', '90 Golden Leaf Place', '96', '27.56', '421.46', '321.45', '271.26', '2018-02-01 00:00:00', '2018-03-14 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('378', 'Greenlam', 'ND-50573', 'Gadget', '1', '597.94', 'Good Neighbor Pharmacy Acid Control 150', 'SL-Class', 'Schaden Group', '133', '7', '4', '3236', '57 Grim Center', '54', '17.04', '63.28', '228.16', '441.85', '2018-02-18 00:00:00', '2018-03-06 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('379', 'Lotstring', 'SL-08857', 'Apparatus', '4', '779.72', 'Throat-Releev (Honey and Lemon)', 'LR2', 'Carter Inc', '133', '7', '3', '39209', '25976 Commercial Street', '82', '29.70', '81.38', '384.50', '341.13', '2018-02-25 00:00:00', '2018-03-24 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('380', 'Toughjoyfax', 'PC-88576', 'Hybrid', '30', '588.83', 'Clear Eyes Cooling Redness Relief', 'Silverado 1500', 'Zemlak, Ankunding and Ward', '133', '7', '2', '23097', '0 Little Fleur Road', '56', '24.87', '202.31', '81.08', '495.15', '2018-02-05 00:00:00', '2018-03-08 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('381', 'Transcof', 'ZH-29638', 'Gadget', '98', '629.24', 'Acyclovir', 'Pajero', 'Beahan Group', '133', '7', '4', '52766', '07 Milwaukee Terrace', '88', '23.08', '341.11', '137.82', '471.12', '2018-02-02 00:00:00', '2018-03-14 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('382', 'Cardguard', 'FV-19128', 'Household', '0', '94.93', 'NIFEDIPINE', '300ZX', 'Schumm Group', '133', '7', '3', '72761', '65273 Annamark Point', '24', '17.07', '106.52', '271.93', '36.97', '2018-02-19 00:00:00', '2018-03-21 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('383', 'It', 'OQ-54358', 'Apparatus', '43', '162.82', 'IRRITABLE BLADDER FEVER', 'Altima', 'Blick, Buckridge and Reichert', '133', '7', '2', '62896', '86 Hermina Place', '18', '29.97', '277.54', '187.71', '95.17', '2018-02-27 00:00:00', '2018-03-06 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('384', 'Tres-Zap', 'CH-67773', 'Work Tools', '28', '101.96', 'Gris-PEG', 'Savana 2500', 'Beahan, O\'Keefe and Wunsch', '133', '7', '5', '36896', '30 Paget Pass', '42', '26.95', '346.34', '491.46', '330.14', '2018-02-10 00:00:00', '2018-03-14 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('385', 'Ventosanzap', 'SV-20773', 'Gadget', '71', '429.53', 'Hydromorphone Hydrochloride', 'Amigo', 'Okuneva LLC', '133', '7', '3', '30318', '233 Westridge Pass', '09', '6.94', '41.57', '167.63', '440.02', '2018-02-05 00:00:00', '2018-03-30 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('386', 'Solarbreeze', 'UJ-11173', 'Hybrid', '21', '559.01', 'Bowel - Digestive Care', 'Navigator', 'Buckridge-Hickle', '133', '7', '5', '46589', '69 Amoth Parkway', '32', '19.35', '61.03', '21.69', '305.27', '2018-02-15 00:00:00', '2018-03-11 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('387', 'Sonsing', 'RT-63637', 'Work Tools', '32', '389.27', 'Pollens - Weeds and Garden Plants, Cocklebur Xanthium strumarium', 'Tracker', 'Jaskolski, Bergnaum and Kovacek', '133', '7', '6', '62126', '6136 Golden Leaf Alley', '93', '29.04', '255.36', '85.88', '188.31', '2018-02-06 00:00:00', '2018-03-24 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('388', 'Holdlamis', 'AB-58783', 'Gadget', '67', '761.99', 'PERFECTION LUMIERE VELVET', 'Taurus', 'Nikolaus and Sons', '133', '7', '3', '73218', '17 Springview Park', '15', '15.00', '392.72', '173.65', '393.33', '2018-02-26 00:00:00', '2018-03-28 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('389', 'Pannier', 'RA-38181', 'Hybrid', '64', '792.86', 'True Essentials', 'MX-3', 'Abshire, Friesen and Ernser', '133', '7', '3', '44530', '32 Annamark Pass', '10', '14.24', '349.59', '41.95', '244.40', '2018-02-03 00:00:00', '2018-03-16 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('390', 'Gembucket', 'RA-41875', 'Household', '94', '125.98', 'Extra Strength Back and Body', 'Starion', 'Hettinger, Shanahan and Shanahan', '133', '7', '6', '37009', '01628 Weeping Birch Hill', '00', '1.41', '192.94', '466.69', '176.55', '2018-02-06 00:00:00', '2018-03-09 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('391', 'Tres-Zap', 'NA-78687', 'Apparatus', '45', '90.32', 'AZITHROMYCIN', 'Sunbird', 'McKenzie, Crona and Satterfield', '133', '7', '6', '78339', '9 Buena Vista Center', '89', '18.89', '250.18', '385.44', '226.44', '2018-02-04 00:00:00', '2018-03-06 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('392', 'Biodex', 'KI-03580', 'Work Tools', '90', '363.62', 'Personal Care Creamy Petroleum Jelly', 'Catera', 'Ernser-Lakin', '133', '7', '2', '11014', '19 Killdeer Way', '52', '11.94', '78.58', '78.09', '358.65', '2018-02-10 00:00:00', '2018-03-19 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('393', 'Konklux', 'VW-00831', 'Hybrid', '79', '268.45', 'Petroleum Jelly', '760', 'Huels-Conn', '133', '7', '2', '50629', '53331 Oriole Center', '96', '9.87', '472.00', '447.38', '8.54', '2018-02-12 00:00:00', '2018-03-09 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('394', 'Fixflex', 'GK-60758', 'Work Tools', '57', '321.70', 'Prazosin Hydrochloride', 'RL', 'Hansen Inc', '133', '7', '3', '93487', '582 Coleman Pass', '59', '14.08', '353.75', '389.21', '57.59', '2018-02-24 00:00:00', '2018-03-05 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('395', 'Redhold', 'LR-76385', 'Work Tools', '40', '553.47', 'Wal itin D', 'Ram Van 3500', 'Altenwerth, Torphy and Hintz', '133', '7', '3', '64617', '246 Boyd Court', '00', '2.81', '473.47', '376.88', '137.17', '2018-02-13 00:00:00', '2018-03-02 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('396', 'Lotstring', 'XL-41101', 'Work Tools', '88', '568.40', 'Amiodarone Hydrochloride', 'Grand Am', 'Koss Group', '133', '7', '2', '6365', '59 Troy Crossing', '21', '27.47', '182.92', '351.20', '151.01', '2018-02-11 00:00:00', '2018-03-15 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('397', 'Flexidy', 'NK-27622', 'Household', '95', '253.39', 'BAUME PRODIGIEUX LEVRES 01 NATURAL CRYSTAL', 'XC70', 'Bartell-Oberbrunner', '133', '7', '4', '63883', '0 Hauk Parkway', '56', '28.50', '36.50', '457.36', '122.81', '2018-02-26 00:00:00', '2018-03-22 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('398', 'Matsoft', 'VZ-75314', 'Work Tools', '17', '428.47', 'Moore Medical Loratadine', 'Z8', 'Kuphal Group', '133', '7', '5', '48235', '53 Hintze Circle', '98', '25.46', '467.01', '168.13', '331.61', '2018-02-24 00:00:00', '2018-03-09 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('399', 'Sonsing', 'KT-74112', 'Apparatus', '40', '987.00', 'Lazanda', 'Grand Am', 'Witting Inc', '133', '7', '4', '13607', '43095 Judy Crossing', '52', '14.78', '90.04', '63.77', '337.35', '2018-02-16 00:00:00', '2018-03-05 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('400', 'Zathin', 'TN-97982', 'Apparatus', '47', '947.49', 'Poverty Weed', 'Sedona', 'Bernhard-Haley', '133', '7', '5', '96393', '6 Commercial Trail', '18', '12.19', '375.62', '256.01', '246.47', '2018-02-04 00:00:00', '2018-03-28 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('401', 'Viva', 'NH-87130', 'Household', '37', '664.90', 'Doxazosin', '300', 'Kirlin LLC', '133', '7', '5', '4109', '5 Toban Place', '01', '3.10', '268.15', '126.70', '18.94', '2018-02-16 00:00:00', '2018-03-07 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('402', 'Prodder', 'XA-03551', 'Hybrid', '99', '130.22', 'Doxazosin', 'Miata MX-5', 'Cummerata Group', '133', '7', '4', '46367', '956 Esker Pass', '44', '10.79', '256.35', '253.18', '147.94', '2018-02-12 00:00:00', '2018-03-25 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('403', 'Namfix', 'DM-65831', 'Hybrid', '88', '772.35', 'Sertraline Hydrochloride', 'Nitro', 'Paucek, Jaskolski and Schaden', '133', '7', '2', '58115', '3309 Nelson Lane', '89', '23.57', '460.36', '124.18', '14.50', '2018-02-04 00:00:00', '2018-03-21 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('404', 'Tempsoft', 'ZM-43408', 'Household', '44', '470.02', 'Molds, Penicillium Mix', 'Cabriolet', 'Ritchie-Rogahn', '133', '7', '2', '71495', '0386 Ohio Crossing', '73', '9.72', '90.85', '218.97', '317.76', '2018-02-14 00:00:00', '2018-03-04 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('405', 'Sonair', 'WK-24224', 'Gadget', '42', '369.95', 'Olanzapine', 'Expedition EL', 'Runolfsdottir, Roberts and Hessel', '133', '7', '4', '57899', '4157 Green Road', '09', '11.41', '153.95', '400.79', '203.79', '2018-02-24 00:00:00', '2018-03-05 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('406', 'Trippledex', 'DS-08878', 'Apparatus', '8', '528.24', 'Right Guard Sport I.S. Antiperspirant Deodorant Active', 'SC', 'Cummerata, Rempel and Hettinger', '133', '7', '5', '42000', '05 Talmadge Drive', '63', '17.13', '217.18', '429.87', '399.52', '2018-02-17 00:00:00', '2018-03-17 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('407', 'Zamit', 'LK-87092', 'Hybrid', '29', '575.97', 'Neutrogena MoistureShine SPF20', 'Aerostar', 'Will-Mayer', '133', '7', '3', '13344', '29249 Almo Junction', '34', '27.90', '67.58', '297.22', '245.47', '2018-02-16 00:00:00', '2018-03-27 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('408', 'Bitchip', 'HJ-79570', 'Hybrid', '38', '385.18', 'Halls', 'F250', 'Mosciski and Sons', '133', '7', '4', '68457', '853 Gateway Park', '10', '22.16', '152.16', '498.78', '353.77', '2018-02-19 00:00:00', '2018-03-27 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('409', 'Fintone', 'WG-17033', 'Hybrid', '48', '475.92', 'Beef Liver', 'S-Class', 'Fahey-Willms', '133', '7', '4', '49422', '35 Michigan Avenue', '14', '27.48', '351.57', '346.37', '176.53', '2018-02-10 00:00:00', '2018-03-08 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('410', 'Tampflex', 'JX-62231', 'Apparatus', '81', '173.98', 'Healthy Accents Ibuprofen', 'LeSabre', 'Nicolas-Runte', '133', '7', '4', '46540', '3 Pennsylvania Park', '44', '9.14', '303.41', '149.66', '379.91', '2018-02-03 00:00:00', '2018-03-27 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('411', 'Pannier', 'JL-98326', 'Hybrid', '95', '928.88', 'COUMADIN', 'Celica', 'Kozey, Sanford and Schowalter', '133', '7', '5', '47708', '18 Burning Wood Junction', '23', '15.34', '367.95', '96.33', '309.67', '2018-02-08 00:00:00', '2018-03-22 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('412', 'Tres-Zap', 'UO-08746', 'Hybrid', '99', '361.14', 'Risperidone', 'Echo', 'Windler, Kuphal and Parisian', '133', '7', '6', '18716', '141 Corry Way', '45', '11.46', '196.43', '220.27', '7.60', '2018-02-25 00:00:00', '2018-03-07 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('413', 'Keylex', 'SK-54017', 'Apparatus', '42', '420.88', 'COUMADIN', 'MX-6', 'Schmeler, Nicolas and Lueilwitz', '133', '7', '3', '58905', '62 Browning Crossing', '45', '28.09', '441.16', '363.94', '207.95', '2018-02-12 00:00:00', '2018-03-27 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('414', 'Cardguard', 'KX-23180', 'Household', '15', '6.94', 'Tramadol Hydrchloride', 'Gemini', 'Oberbrunner, Treutel and Vandervort', '133', '7', '6', '48664', '53720 Sycamore Trail', '72', '13.65', '48.80', '346.58', '79.05', '2018-02-21 00:00:00', '2018-03-17 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('415', 'Alpha', 'UE-41042', 'Work Tools', '84', '772.15', 'Synthroid', 'Eclipse', 'Ruecker LLC', '133', '7', '2', '48270', '3 Burning Wood Alley', '09', '3.95', '281.71', '465.89', '84.10', '2018-02-27 00:00:00', '2018-03-20 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('416', 'Stringtough', 'IF-06148', 'Hybrid', '46', '156.05', 'Sage', 'Expo', 'Will and Sons', '133', '7', '3', '56725', '3 South Avenue', '78', '27.90', '89.92', '253.26', '301.28', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('417', 'Overhold', 'BZ-71700', 'Apparatus', '79', '125.89', 'Ibuprofen', 'NSX', 'Johns-Wilderman', '133', '7', '3', '57836', '208 Clyde Gallagher Hill', '69', '1.65', '274.70', '53.52', '277.44', '2018-02-27 00:00:00', '2018-03-23 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('418', 'Trippledex', 'HP-47140', 'Work Tools', '48', '842.53', 'Tourmaline Formica comp. Special Order', 'Rainier', 'Mills-Rice', '133', '7', '3', '11344', '088 Veith Junction', '17', '16.54', '281.95', '144.46', '32.96', '2018-02-20 00:00:00', '2018-03-26 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('419', 'Latlux', 'ZQ-95334', 'Work Tools', '96', '901.23', 'Flawless Finish Bare Perfection Makeup SPF 8 Mocha', 'Aurora', 'Medhurst-Medhurst', '133', '7', '5', '32004', '9 Fordem Center', '41', '9.00', '153.20', '382.23', '53.87', '2018-02-18 00:00:00', '2018-03-22 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('420', 'Y-find', 'NP-34884', 'Apparatus', '54', '546.27', 'topiramate', 'Land Cruiser', 'Brekke-Considine', '133', '7', '3', '46182', '05371 Forster Court', '93', '6.27', '7.68', '161.58', '440.92', '2018-02-13 00:00:00', '2018-03-16 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('421', 'Solarbreeze', 'VK-75871', 'Household', '52', '31.18', 'METRONIDAZOLE', 'S80', 'Nikolaus, Hermiston and Murazik', '133', '7', '3', '90308', '1 Gina Point', '98', '1.83', '134.33', '64.74', '440.73', '2018-02-11 00:00:00', '2018-03-17 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('422', 'Konklux', 'FS-47334', 'Work Tools', '25', '114.86', 'Benzonatate', 'Verano', 'Kutch, Turcotte and Murray', '133', '7', '6', '39646', '4 6th Center', '19', '30.00', '287.67', '107.33', '279.01', '2018-02-21 00:00:00', '2018-03-03 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('423', 'Treeflex', 'TE-60292', 'Work Tools', '1', '978.84', 'ACEPHEN', 'Acclaim', 'Luettgen-Runte', '133', '7', '4', '67739', '0 Montana Plaza', '73', '14.32', '71.43', '361.25', '490.93', '2018-02-11 00:00:00', '2018-03-06 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('424', 'Ventosanzap', 'ME-63179', 'Apparatus', '35', '949.23', 'Dr. Blue', 'Dakota', 'Hettinger Group', '133', '7', '6', '61340', '66 Moulton Way', '53', '29.42', '261.64', '275.56', '70.74', '2018-02-05 00:00:00', '2018-03-16 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('425', 'Alphazap', 'CD-45552', 'Work Tools', '76', '949.18', 'Nicotine Polacrilex', 'Passport', 'Frami-Cummerata', '133', '7', '4', '23410', '303 Dakota Lane', '67', '20.89', '290.17', '88.36', '364.54', '2018-02-03 00:00:00', '2018-03-14 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('426', 'Span', 'PC-63348', 'Household', '57', '29.60', 'Lipitor', 'LS', 'Schultz Inc', '133', '7', '5', '9829', '69 Lotheville Place', '57', '13.27', '270.76', '451.39', '388.96', '2018-02-10 00:00:00', '2018-03-16 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('427', 'Subin', 'TF-08098', 'Gadget', '34', '101.00', 'Atenolol', 'Integra', 'Auer-Leannon', '133', '7', '6', '49066', '63 Merchant Center', '68', '29.35', '62.58', '125.44', '172.33', '2018-02-09 00:00:00', '2018-03-30 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('428', 'Pannier', 'ZS-90186', 'Household', '32', '969.69', 'Hands First', 'Camry', 'Lang and Sons', '133', '7', '2', '92276', '430 Dawn Place', '07', '21.25', '145.86', '130.66', '468.63', '2018-02-24 00:00:00', '2018-03-07 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('429', 'Prodder', 'XW-01780', 'Gadget', '53', '777.63', 'Seroquel', 'C30', 'Schultz, Reinger and Dietrich', '133', '7', '3', '35767', '58592 Susan Street', '31', '28.28', '139.02', '226.08', '483.86', '2018-02-02 00:00:00', '2018-03-01 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('430', 'Stringtough', 'CG-23602', 'Gadget', '55', '538.45', 'Finasteride', 'Suburban 1500', 'Kovacek-Krajcik', '133', '7', '5', '73305', '30302 Thompson Avenue', '58', '16.78', '129.59', '392.95', '133.60', '2018-02-09 00:00:00', '2018-03-29 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('431', 'Quo Lux', 'RE-38533', 'Household', '27', '786.59', 'Meaningful Beauty Cindy Crawford Antioxidant', 'Grand Vitara', 'Bechtelar, Kozey and Ryan', '133', '7', '5', '35546', '582 Jenna Trail', '33', '21.65', '350.40', '284.36', '230.06', '2018-02-21 00:00:00', '2018-03-14 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('432', 'Gembucket', 'PO-41735', 'Hybrid', '64', '323.28', 'DIPYRIDAMOLE', 'LeSabre', 'Hand-Keeling', '133', '7', '2', '97781', '3 Stone Corner Hill', '81', '8.35', '326.34', '149.60', '30.13', '2018-02-10 00:00:00', '2018-03-11 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('433', 'Viva', 'UQ-76623', 'Hybrid', '5', '447.65', 'SEPIA OFFICINALIS', 'M', 'Ankunding-Hermiston', '133', '7', '3', '51139', '748 Crest Line Pass', '09', '3.57', '118.38', '46.71', '367.46', '2018-02-14 00:00:00', '2018-03-11 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('434', 'Flexidy', 'MY-14500', 'Apparatus', '8', '216.14', 'Inflammation - Fever', 'Passat', 'Runolfsdottir, Davis and Swaniawski', '133', '7', '5', '5159', '69791 Melby Road', '76', '29.53', '316.21', '317.41', '183.66', '2018-02-17 00:00:00', '2018-03-21 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('435', 'Redhold', 'OL-41727', 'Household', '90', '817.56', 'FAMILY WELLNESS MEDICATED COOLING PADS', 'Z3', 'Lesch, Rohan and Block', '133', '7', '3', '13935', '4175 Carberry Plaza', '67', '23.38', '157.77', '362.66', '458.52', '2018-02-20 00:00:00', '2018-03-23 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('436', 'Ronstring', 'SN-06726', 'Work Tools', '44', '541.53', 'Zicam', 'Impala', 'Shanahan Inc', '133', '7', '6', '42722', '0557 Melrose Circle', '30', '7.74', '263.94', '207.46', '338.30', '2018-02-16 00:00:00', '2018-03-27 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('437', 'Otcom', 'DQ-46348', 'Work Tools', '55', '579.29', 'Nateglinide', 'Stratus', 'Cummerata-Feeney', '133', '7', '2', '14675', '4703 Graceland Plaza', '90', '24.10', '494.82', '379.08', '54.41', '2018-02-27 00:00:00', '2018-03-12 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('438', 'Greenlam', 'GW-52239', 'Hybrid', '90', '196.64', 'Gentamicin Sulfate in Sodium Chloride', 'Q5', 'Erdman Inc', '133', '7', '4', '9072', '80 Reinke Junction', '91', '5.53', '324.16', '252.40', '172.57', '2018-02-13 00:00:00', '2018-03-13 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('439', 'Subin', 'QK-35895', 'Apparatus', '42', '904.94', 'Penicillin V Potasium', 'Montero Sport', 'Casper, Kassulke and Torphy', '133', '7', '5', '83327', '422 Schmedeman Pass', '61', '29.91', '118.77', '337.23', '360.32', '2018-02-09 00:00:00', '2018-03-08 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('440', 'Trippledex', 'CQ-84022', 'Work Tools', '93', '995.11', 'Dandruff', '5 Series', 'Howe-Balistreri', '133', '7', '4', '51714', '58762 Dayton Trail', '20', '20.94', '434.82', '52.65', '102.98', '2018-02-17 00:00:00', '2018-03-20 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('441', 'Bytecard', 'BV-22135', 'Gadget', '75', '503.91', 'simvastatin', 'Outback', 'Hamill, Parisian and Spinka', '133', '7', '3', '81216', '8695 Corben Pass', '52', '2.12', '254.16', '244.00', '227.27', '2018-02-18 00:00:00', '2018-03-01 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('442', 'Wrapsafe', 'NP-82673', 'Apparatus', '56', '691.35', 'TOTAL MERCURY', 'LX', 'Cole, Nicolas and Watsica', '133', '7', '6', '52757', '1052 Oakridge Alley', '71', '17.36', '93.79', '442.94', '66.90', '2018-02-27 00:00:00', '2018-03-13 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('443', 'Konklux', 'EE-72125', 'Apparatus', '34', '102.85', 'Colgate Sensitive Pro Relief Whitening', 'Navigator', 'Schinner, Donnelly and Thompson', '133', '7', '2', '6687', '8513 Service Drive', '39', '15.72', '275.02', '253.82', '148.31', '2018-02-03 00:00:00', '2018-03-05 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('444', 'Voltsillam', 'WR-59336', 'Hybrid', '57', '474.82', 'SUMATRIPTAN SUCCINATE', 'A4', 'Balistreri, Schneider and Kautzer', '133', '7', '5', '55568', '90 Erie Circle', '63', '8.80', '496.93', '424.20', '68.96', '2018-02-04 00:00:00', '2018-03-14 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('445', 'Keylex', 'TD-57856', 'Hybrid', '62', '713.20', 'Ranitidine', '928', 'Bechtelar-Hahn', '133', '7', '5', '5297', '53 Manley Center', '19', '17.62', '317.88', '79.12', '470.88', '2018-02-22 00:00:00', '2018-03-02 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('446', 'Alpha', 'PI-68456', 'Work Tools', '11', '431.07', 'Azithromycin', 'Enclave', 'Lakin, Ratke and Conn', '133', '7', '6', '64360', '39166 Debs Point', '51', '26.84', '175.42', '386.49', '180.99', '2018-02-21 00:00:00', '2018-03-10 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('447', 'Kanlam', 'QJ-43254', 'Apparatus', '23', '359.01', 'Zep Round One Hand Cleaner', 'QX', 'Bechtelar, Toy and Pouros', '133', '7', '2', '81927', '6 Everett Park', '23', '7.46', '174.84', '149.96', '147.55', '2018-02-24 00:00:00', '2018-03-07 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('448', 'Subin', 'RV-14751', 'Apparatus', '62', '356.19', 'Cefuroxime and Dextrose', 'S4', 'Hane-Fay', '133', '7', '5', '27981', '5 Arapahoe Pass', '67', '4.13', '158.03', '394.81', '467.95', '2018-02-06 00:00:00', '2018-03-08 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('449', 'It', 'PI-32974', 'Hybrid', '6', '72.05', 'Pronto Plus', 'GS', 'Dietrich, Kreiger and Brekke', '133', '7', '2', '670', '65658 Prentice Street', '05', '10.07', '235.28', '332.44', '131.99', '2018-02-24 00:00:00', '2018-03-12 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('450', 'Flexidy', 'KR-08773', 'Gadget', '21', '351.59', 'Pain Reliever Sleep Aid', 'Grand Prix', 'Doyle, Feest and Green', '133', '7', '4', '48130', '3 Dakota Circle', '42', '2.16', '112.26', '353.65', '257.37', '2018-02-05 00:00:00', '2018-03-10 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('451', 'Namfix', 'KL-96345', 'Hybrid', '25', '182.02', 'Bupropion hydrochloride', 'Ranger', 'Heaney-Boehm', '133', '7', '2', '8734', '57 Gulseth Alley', '14', '6.89', '398.60', '7.03', '7.89', '2018-02-27 00:00:00', '2018-03-25 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('452', 'Keylex', 'WC-90157', 'Gadget', '95', '869.22', 'Lisinopril and hydrochlorothiazide', 'Expedition', 'Mraz Group', '133', '7', '3', '11504', '364 Elgar Road', '93', '3.72', '111.52', '276.72', '7.44', '2018-02-02 00:00:00', '2018-03-16 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('453', 'Mat Lam Tam', 'SL-15419', 'Hybrid', '61', '248.28', '01 Moisture Foundation SPF 15', 'Caravan', 'Turner Group', '133', '7', '3', '64286', '4 Southridge Pass', '33', '11.86', '487.52', '100.27', '452.39', '2018-02-10 00:00:00', '2018-03-15 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('454', 'Hatity', 'DE-23140', 'Work Tools', '32', '964.01', 'Dolce and Gabbana The Lift Foundation Creamy 80', '6 Series', 'Weissnat Inc', '133', '7', '4', '16009', '199 Charing Cross Place', '80', '25.47', '165.26', '160.29', '6.93', '2018-02-18 00:00:00', '2018-03-21 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('455', 'Flexidy', 'DV-88218', 'Work Tools', '73', '501.20', 'PediaCare Childrens Allergy and Cold', 'Ram 50', 'Gorczany Inc', '133', '7', '6', '68967', '7 Moland Center', '83', '3.18', '369.86', '183.20', '22.26', '2018-02-03 00:00:00', '2018-03-26 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('456', 'Daltfresh', 'CT-24753', 'Hybrid', '98', '634.48', 'Oxsoralen-Ultra', 'Terrain', 'Conroy-Emard', '133', '7', '2', '50029', '31971 Continental Lane', '14', '4.49', '353.31', '268.05', '145.17', '2018-02-12 00:00:00', '2018-03-18 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('457', 'Subin', 'GM-66293', 'Household', '38', '346.25', 'DayTime NiteTime', 'Sentra', 'Kuhn Inc', '133', '7', '4', '99303', '351 Coleman Terrace', '18', '14.47', '490.16', '465.61', '78.88', '2018-02-11 00:00:00', '2018-03-22 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('458', 'Bamity', 'QQ-19734', 'Work Tools', '45', '599.77', 'Lombardy Poplar', 'Trooper', 'O\'Keefe, Abbott and Lockman', '133', '7', '5', '10985', '924 Corscot Parkway', '23', '11.45', '432.14', '418.06', '494.33', '2018-02-16 00:00:00', '2018-03-22 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('459', 'Toughjoyfax', 'HS-19768', 'Apparatus', '96', '141.92', 'Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate and Amphetamine Sulfate', 'Legacy', 'Lebsack Inc', '133', '7', '3', '81866', '455 Sullivan Junction', '92', '24.35', '151.43', '379.31', '398.59', '2018-02-07 00:00:00', '2018-03-06 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('460', 'Hatity', 'UC-97554', 'Apparatus', '56', '657.08', 'Phentolamine Mesylate', 'Sienna', 'Quigley, Keeling and Greenholt', '133', '7', '5', '33583', '52 Hanover Pass', '39', '22.40', '339.57', '453.25', '155.69', '2018-02-19 00:00:00', '2018-03-26 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('461', 'Greenlam', 'CL-46812', 'Apparatus', '80', '788.61', 'Childrens Cold and Allergy', 'Quattroporte', 'McDermott, Smitham and Lakin', '133', '7', '4', '78836', '5 Dahle Hill', '88', '23.84', '83.72', '198.43', '146.59', '2018-02-11 00:00:00', '2018-03-11 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('462', 'Veribet', 'IF-55519', 'Household', '7', '813.02', 'Ideal Flawless', '944', 'Cormier-Streich', '133', '7', '6', '58667', '02129 Daystar Terrace', '97', '12.63', '431.71', '293.38', '336.44', '2018-02-08 00:00:00', '2018-03-28 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('463', 'Sonsing', 'YB-90473', 'Household', '54', '783.13', 'Famvir', 'C-Class', 'Erdman-Jaskolski', '133', '7', '3', '16914', '829 West Junction', '04', '18.02', '338.71', '447.69', '175.94', '2018-02-22 00:00:00', '2018-03-15 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('464', 'Ronstring', 'BF-53160', 'Household', '92', '499.77', 'Strawberry', 'Leone', 'Fahey LLC', '133', '7', '6', '35591', '16 Bowman Street', '39', '14.82', '495.32', '392.45', '8.03', '2018-02-16 00:00:00', '2018-03-01 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('465', 'Ventosanzap', 'ND-32464', 'Household', '87', '251.63', 'Good Care Surgical Brush With Nail Cleaner', 'Sienna', 'King, Reichel and Lynch', '133', '7', '4', '55200', '44950 Karstens Hill', '84', '19.36', '356.80', '272.48', '443.33', '2018-02-02 00:00:00', '2018-03-10 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('466', 'Greenlam', 'LR-97186', 'Hybrid', '20', '639.25', 'Donepezil Hydrochloride', 'Commander', 'Kunde, Terry and Mertz', '133', '7', '3', '95410', '5743 Eastwood Trail', '34', '18.01', '408.92', '495.28', '87.42', '2018-02-24 00:00:00', '2018-03-22 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('467', 'Y-Solowarm', 'PC-18164', 'Hybrid', '51', '404.70', 'Strophanthus Aurum', 'SLK-Class', 'Ziemann-Jaskolski', '133', '7', '5', '29801', '6 Marquette Place', '83', '24.10', '89.68', '394.93', '211.92', '2018-02-10 00:00:00', '2018-03-18 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('468', 'Zamit', 'LC-38996', 'Gadget', '87', '502.02', 'Losartan Potassium', 'Mariner', 'Beahan, Rogahn and Leffler', '133', '7', '3', '12263', '9831 Graceland Road', '26', '9.23', '78.37', '137.81', '374.72', '2018-02-01 00:00:00', '2018-03-04 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('469', 'Aerified', 'GM-64496', 'Apparatus', '52', '419.51', 'Carbinoxamine Maleate', 'Integra', 'Cummings and Sons', '133', '7', '6', '69261', '330 Prentice Junction', '25', '24.49', '93.91', '258.52', '249.35', '2018-02-01 00:00:00', '2018-03-03 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('470', 'Hatity', 'NY-40419', 'Hybrid', '51', '448.68', 'Tretinoin', 'Trooper', 'Stanton Inc', '133', '7', '4', '44422', '0045 Declaration Place', '11', '3.86', '120.12', '318.98', '77.63', '2018-02-02 00:00:00', '2018-03-16 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('471', 'Regrant', 'LF-80027', 'Household', '95', '254.44', 'Hog Epithelium', 'Camry', 'Aufderhar-Koelpin', '133', '7', '6', '11715', '4657 Old Shore Place', '24', '14.48', '362.99', '54.09', '18.00', '2018-02-13 00:00:00', '2018-03-28 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('472', 'Bigtax', 'JK-36792', 'Apparatus', '33', '204.27', 'Ropinirole Hydrochloride', 'Altima', 'Ondricka LLC', '133', '7', '6', '24386', '156 Sullivan Hill', '21', '21.01', '29.38', '424.45', '248.88', '2018-02-13 00:00:00', '2018-03-09 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('473', 'Alphazap', 'WI-43729', 'Gadget', '87', '430.24', 'Pramipexole Dihydrochloride', 'Express 1500', 'O\'Kon and Sons', '133', '7', '6', '80409', '25 Rutledge Lane', '66', '17.61', '203.29', '184.75', '355.95', '2018-02-18 00:00:00', '2018-03-20 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('474', 'It', 'YX-47447', 'Hybrid', '58', '237.80', 'NHS Dyspepsia', 'Diamante', 'Green-Willms', '133', '7', '2', '51388', '029 Tony Plaza', '40', '7.00', '379.06', '351.54', '199.53', '2018-02-19 00:00:00', '2018-03-18 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('475', 'Ventosanzap', 'NI-69186', 'Hybrid', '31', '461.45', 'CRESTOR', 'E-Class', 'Crooks, Crist and Spinka', '133', '7', '5', '79588', '0 Golf View Parkway', '95', '4.46', '26.37', '442.15', '392.53', '2018-02-17 00:00:00', '2018-03-29 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('476', 'Rank', 'GY-94533', 'Gadget', '12', '942.32', 'Earths Care Arnica Compound', 'Ridgeline', 'McGlynn LLC', '133', '7', '4', '59958', '13 Sugar Lane', '79', '13.96', '140.35', '484.97', '223.30', '2018-02-15 00:00:00', '2018-03-08 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('477', 'Sonsing', 'ZQ-75756', 'Hybrid', '74', '861.20', 'Black Walnut', 'Sentra', 'Marks, Durgan and Champlin', '133', '7', '4', '63892', '67421 Farmco Plaza', '34', '17.26', '102.59', '32.35', '450.67', '2018-02-08 00:00:00', '2018-03-25 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('478', 'It', 'JY-43017', 'Gadget', '62', '193.23', 'Skin Doctors Photo Age Reverse Night Serum', 'Excursion', 'Prohaska and Sons', '133', '7', '2', '84582', '5513 Meadow Ridge Avenue', '71', '25.31', '271.62', '13.94', '44.14', '2018-02-05 00:00:00', '2018-03-15 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('479', 'Home Ing', 'VU-72277', 'Apparatus', '88', '989.74', 'Acetaminophen', 'Alpina B7', 'Brekke LLC', '133', '7', '6', '16711', '1422 Roth Road', '72', '23.31', '486.33', '259.49', '2.52', '2018-02-19 00:00:00', '2018-03-22 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('480', 'Biodex', 'ZB-21122', 'Apparatus', '78', '63.81', 'smart sense triple antibiotic', 'S-Class', 'VonRueden Group', '133', '7', '2', '50643', '4 Park Meadow Crossing', '67', '20.72', '263.55', '193.23', '112.33', '2018-02-26 00:00:00', '2018-03-02 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('481', 'Job', 'BP-24226', 'Gadget', '46', '302.88', 'TISSEEL', 'RAV4', 'Walter-Bins', '133', '7', '6', '13742', '08 Thierer Point', '63', '28.11', '196.81', '174.08', '404.72', '2018-02-18 00:00:00', '2018-03-23 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('482', 'Overhold', 'BV-87027', 'Hybrid', '92', '457.38', 'Hydralazine Hydrochloride', 'Challenger', 'Yost, Kovacek and Smith', '133', '7', '6', '92901', '1430 Mesta Lane', '24', '23.90', '324.91', '51.78', '237.47', '2018-02-14 00:00:00', '2018-03-04 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('483', 'Mat Lam Tam', 'TW-83292', 'Apparatus', '6', '49.05', 'Auto 157', 'Legend', 'Jacobson Inc', '133', '7', '5', '83906', '3 Delaware Junction', '32', '27.48', '316.07', '41.58', '283.99', '2018-02-01 00:00:00', '2018-03-29 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('484', 'Greenlam', 'YA-43252', 'Apparatus', '60', '415.02', 'Gabapentin', 'LTD Crown Victoria', 'Stark-Hintz', '133', '7', '3', '367', '1 Oak Way', '09', '28.53', '88.54', '326.16', '264.69', '2018-02-11 00:00:00', '2018-03-14 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('485', 'Zathin', 'HN-80012', 'Household', '68', '904.07', 'Fentanyl', 'Explorer', 'Langosh, Steuber and Bahringer', '133', '7', '5', '16815', '06749 Bultman Circle', '89', '20.21', '77.84', '495.12', '346.63', '2018-02-11 00:00:00', '2018-03-19 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('486', 'Pannier', 'AY-31049', 'Household', '44', '73.86', 'Povidone-Iodine', 'Highlander', 'Rohan Group', '133', '7', '6', '46758', '2139 Coleman Trail', '83', '21.89', '367.38', '244.14', '143.11', '2018-02-06 00:00:00', '2018-03-15 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('487', 'Stim', 'IY-54193', 'Household', '82', '498.43', 'Doxazosin', 'XG350', 'Hoppe-Schamberger', '133', '7', '3', '36689', '20 Sunnyside Hill', '37', '12.84', '111.71', '330.64', '321.72', '2018-02-11 00:00:00', '2018-03-12 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('488', 'Aerified', 'IB-10485', 'Gadget', '0', '810.51', 'Fever Inflammations', 'Pajero', 'Schmidt Group', '133', '7', '3', '24055', '6654 Magdeline Point', '26', '27.73', '486.38', '138.84', '203.41', '2018-02-23 00:00:00', '2018-03-11 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('489', 'Fixflex', 'HP-52379', 'Gadget', '13', '389.85', 'Aurum Olibanum Myrrha', 'GTO', 'Schuppe-Gleason', '133', '7', '3', '59079', '30 Porter Plaza', '55', '6.93', '153.35', '221.09', '465.25', '2018-02-22 00:00:00', '2018-03-09 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('490', 'Opela', 'KH-88753', 'Gadget', '77', '377.54', 'Meclizine Hydrochloride', 'Monte Carlo', 'Gleason-Schneider', '133', '7', '2', '65509', '5 Everett Pass', '45', '10.69', '287.01', '447.21', '108.60', '2018-02-06 00:00:00', '2018-03-04 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('491', 'Zamit', 'FE-92266', 'Work Tools', '93', '397.14', 'GOOD SENSE IBUPROFEN', 'Dakota', 'Kuhic and Sons', '133', '7', '3', '73810', '73427 Esker Place', '70', '18.83', '482.50', '30.41', '336.93', '2018-02-24 00:00:00', '2018-03-04 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('492', 'Sub-Ex', 'HI-04283', 'Work Tools', '10', '95.40', 'Leukine', 'Mariner', 'Carter Inc', '133', '7', '4', '50909', '96876 Dapin Park', '26', '26.23', '439.94', '377.54', '11.49', '2018-02-16 00:00:00', '2018-03-04 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('493', 'Tresom', 'IQ-05204', 'Hybrid', '97', '261.37', 'dg health headache relief', 'Aztek', 'Schaden, Zieme and Sauer', '133', '7', '5', '63948', '6 Nobel Park', '38', '3.72', '279.15', '154.51', '454.11', '2018-02-04 00:00:00', '2018-03-05 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('494', 'Namfix', 'TA-41225', 'Hybrid', '93', '867.20', 'Teniposide', 'LX', 'Batz-Predovic', '133', '7', '5', '8173', '15 Declaration Avenue', '13', '9.54', '177.30', '359.90', '111.24', '2018-02-17 00:00:00', '2018-03-12 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('495', 'Redhold', 'PH-34481', 'Gadget', '45', '198.33', 'Goose Feathers', 'Impreza', 'Steuber, Brekke and Towne', '133', '7', '3', '72412', '46 Dottie Plaza', '19', '18.01', '400.17', '365.87', '10.10', '2018-02-20 00:00:00', '2018-03-09 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('496', 'Opela', 'TO-33616', 'Hybrid', '13', '639.60', 'Hickory/Pecan Mixture', 'Town & Country', 'Lakin, Shanahan and MacGyver', '133', '7', '2', '58041', '24 Shelley Trail', '34', '18.66', '173.79', '461.32', '368.72', '2018-02-21 00:00:00', '2018-03-19 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('497', 'Latlux', 'UD-11487', 'Gadget', '0', '857.30', 'Good Sense Childrens Mucus Relief Cough', 'Millenia', 'Corwin, Nikolaus and Wunsch', '133', '7', '4', '50185', '1 Monterey Place', '74', '1.91', '335.93', '402.33', '118.47', '2018-02-14 00:00:00', '2018-03-29 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('498', 'Aerified', 'NU-48757', 'Household', '70', '13.44', 'Potassium Chloride', 'Echo', 'Orn LLC', '133', '7', '6', '7946', '8 Talisman Alley', '96', '27.36', '158.74', '352.60', '154.53', '2018-02-27 00:00:00', '2018-03-07 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('499', 'Y-find', 'DX-17479', 'Gadget', '36', '956.90', 'PureLight', 'Avalon', 'Denesik, Moore and Langosh', '133', '7', '5', '64837', '35 John Wall Avenue', '06', '24.17', '465.30', '220.02', '103.64', '2018-02-17 00:00:00', '2018-03-27 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('500', 'Lotlux', 'KP-12526', 'Work Tools', '34', '262.17', 'Glyburide and Metformin', 'Discovery Series II', 'Towne Inc', '133', '7', '2', '44187', '5937 Village Parkway', '86', '8.63', '395.78', '211.36', '98.66', '2018-02-05 00:00:00', '2018-03-21 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('501', 'Solarbreeze', 'VU-55689', 'Hybrid', '99', '506.26', 'CLONIDINE HYDROCHLORIDE', 'Santa Fe', 'Ondricka-Ernser', '133', '7', '3', '57047', '00 Sheridan Terrace', '81', '12.62', '400.50', '315.46', '303.84', '2018-02-09 00:00:00', '2018-03-30 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('502', 'Biodex', 'HX-53198', 'Household', '94', '589.43', 'SHISEIDO BENEFIANCE WRINKLERESIST24 DAY', 'Impala', 'Weimann Inc', '133', '7', '6', '94940', '67701 Coleman Junction', '97', '29.73', '345.28', '490.52', '47.89', '2018-02-20 00:00:00', '2018-03-24 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('503', 'Latlux', 'ZL-90239', 'Work Tools', '46', '515.34', 'ALUMEN', '350Z', 'Reichert, Toy and Beahan', '133', '7', '2', '34244', '64684 Lindbergh Street', '23', '9.23', '27.75', '251.48', '212.92', '2018-02-09 00:00:00', '2018-03-11 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('504', 'Cookley', 'UT-56547', 'Gadget', '76', '207.67', 'Secret Scent Expressions', 'E-Series', 'Harris, Kunde and Herman', '133', '7', '6', '46824', '0 Ridge Oak Circle', '86', '9.33', '480.72', '148.13', '18.14', '2018-02-20 00:00:00', '2018-03-30 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('505', 'Y-Solowarm', 'HM-68614', 'Hybrid', '98', '808.87', 'DIPHENHYDRAMINE HYDROCHLORIDE', 'Neon', 'Pacocha-Herman', '133', '7', '4', '56196', '4755 Boyd Pass', '37', '17.99', '449.13', '33.75', '63.13', '2018-02-11 00:00:00', '2018-03-03 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('506', 'Ventosanzap', 'OU-01237', 'Gadget', '82', '450.74', 'Leader Original Nasal', 'Z3', 'Jerde-Hyatt', '133', '7', '3', '68514', '5 International Road', '02', '9.34', '117.97', '264.59', '4.30', '2018-02-21 00:00:00', '2018-03-17 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('507', 'Holdlamis', 'HR-16047', 'Hybrid', '39', '413.11', 'nite time', 'Talon', 'Schaden, Williamson and Lebsack', '133', '7', '4', '91389', '59 Granby Parkway', '91', '26.61', '428.69', '20.11', '54.32', '2018-02-12 00:00:00', '2018-03-13 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('508', 'Treeflex', 'XT-10463', 'Work Tools', '38', '992.43', 'FLU HP', 'Phantom', 'Weissnat Inc', '133', '7', '2', '47871', '0945 Londonderry Alley', '75', '11.50', '204.17', '487.57', '246.01', '2018-02-23 00:00:00', '2018-03-08 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('509', 'Bamity', 'LW-26877', 'Gadget', '18', '825.82', 'Levothyroxine Sodium', 'Sportage', 'O\'Hara, VonRueden and Moen', '133', '7', '4', '55350', '177 Hayes Circle', '13', '6.41', '181.53', '340.87', '325.80', '2018-02-10 00:00:00', '2018-03-30 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('510', 'Rank', 'CR-23917', 'Gadget', '6', '777.22', 'Diazepam', 'Caravan', 'Schneider and Sons', '133', '7', '4', '19367', '5 Melrose Park', '52', '18.55', '402.05', '216.62', '163.56', '2018-02-22 00:00:00', '2018-03-21 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('511', 'Andalax', 'RR-86309', 'Household', '72', '324.66', 'Zetia', 'Ranger', 'Tillman and Sons', '133', '7', '5', '61428', '36 Schmedeman Lane', '33', '14.40', '31.66', '227.78', '123.57', '2018-02-21 00:00:00', '2018-03-23 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('512', 'Tempsoft', 'CO-83408', 'Apparatus', '70', '530.16', 'Enalapril Maleate', 'Acadia', 'Kirlin, Senger and Jacobi', '133', '7', '4', '41920', '97 Continental Parkway', '96', '6.75', '100.78', '167.19', '394.71', '2018-02-24 00:00:00', '2018-03-28 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('513', 'Flexidy', 'XP-78170', 'Apparatus', '69', '643.80', 'bacitracin', '3 Series', 'Green, Maggio and Cruickshank', '133', '7', '5', '6581', '9 Buena Vista Way', '78', '17.39', '462.04', '42.47', '323.67', '2018-02-18 00:00:00', '2018-03-18 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('514', 'Bigtax', 'MT-37617', 'Gadget', '69', '896.00', 'Fluconazole', '6 Series', 'Spencer and Sons', '133', '7', '4', '54997', '711 Ridge Oak Drive', '57', '21.16', '245.98', '401.48', '318.69', '2018-02-15 00:00:00', '2018-03-26 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('515', 'Fintone', 'FH-71709', 'Apparatus', '96', '83.93', 'Loperamide Hydrochloride', 'XG350', 'Weimann Group', '133', '7', '6', '77517', '47675 Darwin Court', '96', '9.26', '224.01', '355.29', '421.55', '2018-02-15 00:00:00', '2018-03-27 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('516', 'Alpha', 'SD-17537', 'Gadget', '38', '671.65', 'Eve Lom Brilliant Cover Concealer Broad Spectrum SPF 15 Sunscreen', 'Vibe', 'Predovic, O\'Conner and Watsica', '133', '7', '3', '73238', '643 Rigney Court', '94', '29.52', '147.66', '64.16', '271.58', '2018-02-20 00:00:00', '2018-03-11 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('517', 'Tempsoft', 'TE-43027', 'Gadget', '92', '220.98', 'ESIKA', '4Runner', 'Altenwerth-Trantow', '133', '7', '2', '12566', '14816 Sunfield Center', '49', '13.70', '466.45', '134.87', '451.81', '2018-02-24 00:00:00', '2018-03-18 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('518', 'Keylex', 'UM-61278', 'Work Tools', '40', '780.71', 'Mineral Oil Lubricant Laxative', 'Dakota Club', 'Heller, Langosh and Lowe', '133', '7', '6', '76782', '22948 Thompson Way', '44', '4.16', '358.37', '460.24', '92.71', '2018-02-09 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('519', 'Mat Lam Tam', 'AS-74453', 'Gadget', '11', '823.68', 'Treatment Set TS330718', 'M-Class', 'Crona and Sons', '133', '7', '2', '70381', '6 Thierer Point', '67', '9.13', '238.81', '335.77', '210.39', '2018-02-16 00:00:00', '2018-03-04 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('520', 'Matsoft', 'PR-74047', 'Apparatus', '70', '338.45', 'winter vanilla hand sanitizer', 'Maxima', 'Nienow-Corwin', '133', '7', '5', '59252', '886 Steensland Crossing', '76', '13.02', '108.44', '185.70', '71.20', '2018-02-08 00:00:00', '2018-03-04 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('521', 'Regrant', 'WJ-90403', 'Work Tools', '28', '200.25', 'Divalproex Sodium', 'H1', 'Shields Group', '133', '7', '4', '71154', '7466 Drewry Pass', '37', '3.64', '72.83', '49.26', '72.82', '2018-02-14 00:00:00', '2018-03-15 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('522', 'Fixflex', 'KF-85508', 'Hybrid', '20', '698.76', 'Lamotrigine', 'MX-5', 'Daniel-Eichmann', '133', '7', '2', '73361', '9564 Magdeline Point', '25', '12.89', '187.38', '197.52', '287.14', '2018-02-06 00:00:00', '2018-03-05 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('523', 'Alphazap', 'HG-32944', 'Gadget', '76', '994.23', 'CELEBREX', 'R-Class', 'West and Sons', '133', '7', '6', '4570', '8 Graedel Court', '31', '18.87', '410.16', '13.19', '162.71', '2018-02-26 00:00:00', '2018-03-17 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('524', 'Fintone', 'BJ-51947', 'Gadget', '55', '607.18', 'Propranolol Hydrochloride', 'C-Class', 'Schinner Group', '133', '7', '4', '4344', '6 Arizona Alley', '23', '29.79', '308.49', '394.27', '152.06', '2018-02-04 00:00:00', '2018-03-17 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('525', 'Kanlam', 'LT-88778', 'Gadget', '1', '849.08', 'Hydrocodone Bitartrate And Acetaminophen', 'TSX', 'Fritsch-Wolff', '133', '7', '5', '72252', '72416 Wayridge Plaza', '07', '9.76', '31.50', '358.16', '388.48', '2018-02-24 00:00:00', '2018-03-26 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('526', 'Latlux', 'JW-81048', 'Apparatus', '6', '927.33', 'Fluorouracil', 'Esprit', 'Hane, McDermott and Keeling', '133', '7', '6', '20777', '915 Hooker Junction', '80', '23.40', '75.10', '310.62', '434.92', '2018-02-21 00:00:00', '2018-03-24 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('527', 'Tin', 'WN-80618', 'Hybrid', '88', '155.80', 'DIPYRIDAMOLE', 'Corolla', 'Pfannerstill and Sons', '133', '7', '2', '51688', '691 Meadow Valley Alley', '84', '17.98', '93.32', '442.94', '205.61', '2018-02-15 00:00:00', '2018-03-03 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('528', 'Bigtax', 'GL-28414', 'Work Tools', '60', '51.91', 'Oxcarbazepine', 'Q', 'Willms-Hilll', '133', '7', '4', '82709', '69699 Morning Drive', '64', '20.57', '28.53', '366.00', '135.16', '2018-02-07 00:00:00', '2018-03-07 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('529', 'Regrant', 'WH-85381', 'Apparatus', '65', '415.04', 'rx act ibuprofen', 'Trooper', 'Kiehn, Stanton and Schroeder', '133', '7', '4', '80520', '9 Eagan Place', '00', '26.54', '413.74', '402.12', '494.57', '2018-02-12 00:00:00', '2018-03-01 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('530', 'Keylex', 'QH-35363', 'Apparatus', '9', '657.46', 'Be-Dry', 'F350', 'Batz and Sons', '133', '7', '2', '17507', '4008 Fairview Crossing', '88', '14.87', '220.20', '207.91', '268.33', '2018-02-17 00:00:00', '2018-03-07 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('531', 'Tresom', 'XA-40333', 'Hybrid', '70', '262.68', 'TRIAMTERENE and HYDROCHLOROTHIAZIDE', 'Veracruz', 'Watsica, Dietrich and Wolf', '133', '7', '5', '88473', '902 Valley Edge Pass', '52', '29.66', '199.81', '432.37', '184.24', '2018-02-02 00:00:00', '2018-03-25 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('532', 'Y-find', 'LA-24991', 'Gadget', '68', '924.33', 'Bethanechol Chloride', '9000', 'Wolf-Wintheiser', '133', '7', '4', '76432', '25021 Rutledge Court', '53', '5.72', '156.67', '439.34', '208.91', '2018-02-05 00:00:00', '2018-03-03 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('533', 'Sonsing', 'ND-46898', 'Apparatus', '82', '178.47', 'NUCYNTA', 'Paseo', 'Dietrich-Hoppe', '133', '7', '6', '1853', '7886 Moland Place', '35', '12.52', '59.94', '283.16', '247.50', '2018-02-08 00:00:00', '2018-03-15 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('534', 'Fintone', 'GE-90313', 'Hybrid', '55', '560.75', 'Ibuprofen', 'S40', 'Cremin, Reichel and Gibson', '133', '7', '2', '1585', '61 Alpine Avenue', '78', '9.44', '298.46', '230.29', '360.73', '2018-02-24 00:00:00', '2018-03-25 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('535', 'Tempsoft', 'PY-39067', 'Work Tools', '7', '457.35', 'CLE DE PEAU BEAUTE', 'IS', 'Effertz-Stroman', '133', '7', '4', '65781', '2828 Mayer Center', '72', '19.60', '75.21', '208.79', '496.80', '2018-02-05 00:00:00', '2018-03-06 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('536', 'Alpha', 'WR-36711', 'Apparatus', '13', '615.06', 'TOPCARE', 'LX', 'Kozey Group', '133', '7', '5', '94066', '1 Derek Way', '51', '14.67', '290.77', '21.60', '330.40', '2018-02-26 00:00:00', '2018-03-17 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('537', 'Sub-Ex', 'SQ-93814', 'Household', '53', '968.26', 'Fentanyl Citrate', 'Transit Connect', 'Bernhard-Gottlieb', '133', '7', '5', '77018', '55022 Buena Vista Pass', '94', '22.59', '492.34', '180.10', '320.40', '2018-02-06 00:00:00', '2018-03-15 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('538', 'Overhold', 'XF-57367', 'Gadget', '3', '396.45', 'OPIUM', 'Wrangler', 'Durgan-VonRueden', '133', '7', '6', '43555', '2 Gateway Junction', '01', '20.24', '40.01', '11.96', '32.28', '2018-02-10 00:00:00', '2018-03-25 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('539', 'Tres-Zap', 'PN-39406', 'Gadget', '36', '491.78', 'Meloxicam', 'Sunbird', 'Swift, Homenick and Franecki', '133', '7', '4', '28613', '0 Bartillon Circle', '40', '18.95', '1.23', '171.56', '414.35', '2018-02-25 00:00:00', '2018-03-03 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('540', 'Holdlamis', 'HR-38827', 'Work Tools', '11', '654.77', 'Rifampin', 'Outback', 'Cassin Group', '133', '7', '2', '75837', '81 Del Mar Court', '03', '19.92', '86.81', '45.51', '195.76', '2018-02-14 00:00:00', '2018-03-29 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('541', 'Trippledex', 'XG-61072', 'Household', '65', '541.58', 'Vichy Laboratoires Normaderm Purifying Pore Tightening Toner', 'Explorer', 'White, Bruen and Stokes', '133', '7', '2', '67969', '9480 Little Fleur Point', '83', '17.15', '401.68', '130.35', '6.22', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('542', 'Solarbreeze', 'LS-32760', 'Household', '71', '822.49', 'OXYGEN', 'Corvette', 'Williamson, Jakubowski and Feeney', '133', '7', '5', '21847', '3 Service Hill', '82', '21.67', '73.38', '76.37', '138.08', '2018-02-16 00:00:00', '2018-03-03 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('543', 'Rank', 'KP-63170', 'Apparatus', '68', '503.82', 'Alvesco', 'Ram', 'Price, Pacocha and Altenwerth', '133', '7', '3', '82971', '56 Lakeland Crossing', '35', '9.19', '155.53', '121.51', '41.52', '2018-02-26 00:00:00', '2018-03-26 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('544', 'Hatity', 'YY-06269', 'Hybrid', '92', '866.55', 'Serotonin', 'C-Class', 'Schumm-Frami', '133', '7', '4', '30440', '24983 Memorial Pass', '45', '17.04', '466.03', '392.62', '61.66', '2018-02-07 00:00:00', '2018-03-01 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('545', 'Solarbreeze', 'NI-59222', 'Gadget', '98', '845.04', 'Hydralazine Hydrochloride', 'Tacoma Xtra', 'Cremin, Romaguera and Altenwerth', '133', '7', '4', '31616', '8843 Dapin Place', '57', '13.70', '107.36', '29.06', '178.72', '2018-02-09 00:00:00', '2018-03-16 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('546', 'Konklux', 'AS-83631', 'Gadget', '98', '366.36', 'OXYGEN', '5 Series', 'Rogahn-Heidenreich', '133', '7', '2', '83029', '2 Meadow Valley Center', '07', '11.32', '496.67', '112.31', '190.47', '2018-02-09 00:00:00', '2018-03-16 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('547', 'Subin', 'LX-41463', 'Work Tools', '8', '752.93', 'Amlodipine Besylate', 'Cherokee', 'Wuckert-Zieme', '133', '7', '4', '27394', '2 Troy Alley', '54', '27.32', '217.25', '195.86', '327.72', '2018-02-12 00:00:00', '2018-03-24 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('548', 'Lotstring', 'TR-69159', 'Household', '35', '12.72', 'Equate Childrens Pain and Fever', 'C-Class', 'Lindgren, Stiedemann and Schumm', '133', '7', '3', '43287', '145 Walton Crossing', '32', '16.75', '112.52', '12.01', '334.93', '2018-02-01 00:00:00', '2018-03-29 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('549', 'Bamity', 'DR-58150', 'Gadget', '49', '498.73', 'Spearmint', 'Wrangler', 'Lockman, Nitzsche and Koepp', '133', '7', '6', '69518', '49163 Express Terrace', '80', '25.62', '162.00', '275.73', '357.00', '2018-02-14 00:00:00', '2018-03-26 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('550', 'Pannier', 'FY-68632', 'Hybrid', '10', '667.25', 'Promethazine Hydrochloride', 'Passat', 'Beier-Wintheiser', '133', '7', '5', '71968', '07896 Steensland Junction', '25', '10.20', '21.50', '121.65', '52.38', '2018-02-09 00:00:00', '2018-03-21 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('551', 'Andalax', 'TH-18088', 'Hybrid', '18', '89.27', 'Certus Wash Towelette', 'Range Rover', 'Rodriguez, O\'Connell and Wuckert', '133', '7', '4', '43730', '0 Stoughton Trail', '16', '10.90', '254.60', '38.02', '299.06', '2018-02-09 00:00:00', '2018-03-29 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('552', 'Zoolab', 'BL-03373', 'Work Tools', '30', '545.83', 'Cilostazol', 'Countryman', 'Towne and Sons', '133', '7', '3', '23171', '70 Fieldstone Drive', '76', '19.61', '359.30', '52.18', '394.42', '2018-02-14 00:00:00', '2018-03-01 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('553', 'Fixflex', 'QX-73096', 'Household', '66', '735.71', 'Humulin N', 'GTO', 'Wisoky Inc', '133', '7', '6', '95971', '08169 Bayside Park', '65', '22.06', '448.43', '337.18', '28.37', '2018-02-03 00:00:00', '2018-03-16 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('554', 'Subin', 'PZ-00079', 'Gadget', '80', '481.17', 'Ibuprofen', 'riolet', 'Toy LLC', '133', '7', '4', '76107', '9 Kipling Trail', '43', '10.59', '262.80', '20.93', '100.16', '2018-02-09 00:00:00', '2018-03-10 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('555', 'Regrant', 'VF-82715', 'Hybrid', '5', '600.56', 'ALENDRONATE SODIUM', 'Suburban 1500', 'Stark, Anderson and Jakubowski', '133', '7', '3', '88469', '5 Gulseth Crossing', '38', '20.73', '498.87', '194.44', '235.18', '2018-02-16 00:00:00', '2018-03-24 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('556', 'Flexidy', 'OH-89857', 'Gadget', '9', '759.83', 'Buspirone HCl', 'Sebring', 'VonRueden and Sons', '133', '7', '4', '65339', '1871 Kim Pass', '45', '19.97', '271.74', '176.23', '394.11', '2018-02-01 00:00:00', '2018-03-12 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('557', 'Hatity', 'BR-53537', 'Work Tools', '74', '78.17', 'HEADACHE/MIGRAINE RELIEF', 'Forester', 'Labadie-Heaney', '133', '7', '3', '62260', '722 Forster Crossing', '43', '22.86', '394.32', '258.26', '29.07', '2018-02-20 00:00:00', '2018-03-13 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('558', 'Overhold', 'GH-69577', 'Apparatus', '27', '788.88', 'Edluar', 'B9 Tribeca', 'Denesik-Hettinger', '133', '7', '4', '14700', '98475 Roxbury Crossing', '15', '23.01', '47.71', '267.16', '376.67', '2018-02-13 00:00:00', '2018-03-21 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('559', 'Aerified', 'KQ-55852', 'Apparatus', '34', '483.53', 'Ondansetron', 'Azera', 'Dickinson-Bernhard', '133', '7', '6', '24381', '7 Dakota Hill', '72', '7.94', '96.12', '25.53', '91.80', '2018-02-24 00:00:00', '2018-03-25 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('560', 'Tres-Zap', 'KJ-94257', 'Household', '77', '87.73', 'Sensorcaine', 'Prizm', 'Tillman, Lebsack and Kovacek', '133', '7', '4', '58207', '96 Pawling Avenue', '67', '7.28', '15.35', '378.95', '384.85', '2018-02-01 00:00:00', '2018-03-16 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('561', 'Latlux', 'HF-99154', 'Gadget', '58', '736.24', 'Betamethasone Dipropionate', 'Blazer', 'Hegmann, Jones and Hyatt', '133', '7', '2', '99833', '41 Beilfuss Hill', '73', '3.63', '316.40', '121.25', '112.50', '2018-02-27 00:00:00', '2018-03-26 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('562', 'Temp', 'HX-89670', 'Household', '85', '824.64', 'OXYGEN', 'Grand Vitara', 'Lang, Kiehn and Kris', '133', '7', '3', '35714', '15007 Homewood Drive', '69', '22.52', '388.56', '52.31', '446.02', '2018-02-02 00:00:00', '2018-03-14 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('563', 'Flexidy', 'OP-83823', 'Apparatus', '82', '594.85', 'Real Deal Foundation', 'LS', 'Kautzer-Champlin', '133', '7', '2', '52032', '5 Kipling Pass', '23', '29.17', '437.91', '437.09', '6.11', '2018-02-04 00:00:00', '2018-03-23 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('564', 'Job', 'CL-74252', 'Apparatus', '57', '812.77', 'Scrub Pine', 'Envoy', 'Dare LLC', '133', '7', '5', '25718', '963 Rieder Avenue', '23', '15.08', '411.92', '474.46', '228.33', '2018-02-17 00:00:00', '2018-03-22 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('565', 'Alpha', 'UV-83907', 'Work Tools', '13', '513.83', 'Healthy Accents infants pain and fever', 'Voyager', 'Hyatt LLC', '133', '7', '5', '59198', '8805 Holmberg Junction', '41', '2.25', '9.59', '281.49', '41.78', '2018-02-11 00:00:00', '2018-03-09 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('566', 'Namfix', 'WE-47414', 'Work Tools', '23', '57.52', 'Zep FS Antimicrobial Hand Cleaner', 'Electra', 'Nikolaus and Sons', '133', '7', '4', '87625', '98994 Vahlen Street', '37', '25.29', '228.65', '250.21', '213.47', '2018-02-09 00:00:00', '2018-03-21 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('567', 'Aerified', 'WK-94106', 'Hybrid', '75', '390.96', 'Cephalexin', '760', 'Predovic-Boehm', '133', '7', '2', '45439', '2 Donald Crossing', '82', '4.57', '180.37', '345.56', '302.71', '2018-02-13 00:00:00', '2018-03-24 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('568', 'Daltfresh', 'PE-18443', 'Apparatus', '83', '559.67', 'DIABETIC ULCER DEFENSE', 'RX Hybrid', 'Kshlerin, Schultz and Swaniawski', '133', '7', '3', '20927', '4342 Coolidge Plaza', '01', '15.58', '67.60', '269.78', '420.63', '2018-02-23 00:00:00', '2018-03-29 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('569', 'Ronstring', 'PY-94526', 'Gadget', '12', '7.24', 'Theophylline', '5 Series', 'VonRueden and Sons', '133', '7', '2', '15493', '8426 Dahle Park', '84', '7.21', '252.46', '467.61', '215.32', '2018-02-08 00:00:00', '2018-03-30 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('570', 'Zathin', 'IH-44822', 'Work Tools', '14', '462.29', 'Venlafaxine Hydrochloride', 'PT Cruiser', 'Smith-Mitchell', '133', '7', '6', '44266', '058 Crest Line Hill', '69', '12.20', '463.40', '455.02', '349.61', '2018-02-22 00:00:00', '2018-03-24 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('571', 'Mat Lam Tam', 'BG-39619', 'Gadget', '66', '446.78', 'Childrens Plus Multi-Symptom Grape', 'Grand Caravan', 'Graham Group', '133', '7', '3', '29467', '97 Ludington Place', '50', '26.03', '70.35', '356.86', '173.96', '2018-02-01 00:00:00', '2018-03-04 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('572', 'Temp', 'AX-50028', 'Gadget', '38', '531.16', 'Potassium Chloride in Dextrose and Sodium Chloride', 'Boxster', 'Balistreri-Ziemann', '133', '7', '3', '35961', '9154 7th Trail', '23', '1.03', '212.88', '296.25', '335.56', '2018-02-09 00:00:00', '2018-03-02 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('573', 'Fix San', 'IJ-11835', 'Gadget', '34', '252.22', 'Miconazole 7', '626', 'Waters Inc', '133', '7', '2', '76976', '545 Charing Cross Parkway', '80', '17.84', '477.43', '124.67', '227.43', '2018-02-07 00:00:00', '2018-03-25 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('574', 'Domainer', 'FS-85705', 'Household', '64', '973.83', 'Moms Choice Rx', 'X-Type', 'Kreiger, Kreiger and Streich', '133', '7', '5', '86138', '71 Grim Plaza', '30', '29.67', '69.70', '244.99', '253.95', '2018-02-11 00:00:00', '2018-03-18 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('575', 'Asoka', 'IW-79226', 'Work Tools', '55', '94.96', 'Alprazolam', 'S80', 'Wuckert-Cummerata', '133', '7', '6', '11145', '26164 Fisk Circle', '64', '6.32', '127.84', '476.68', '383.49', '2018-02-23 00:00:00', '2018-03-10 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('576', 'Zaam-Dox', 'FD-40021', 'Gadget', '90', '885.28', 'Oxygen', 'Land Cruiser', 'Olson, Parisian and Yundt', '133', '7', '2', '50914', '26109 Hovde Pass', '28', '14.64', '97.30', '481.25', '34.65', '2018-02-12 00:00:00', '2018-03-26 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('577', 'Wrapsafe', 'YU-26801', 'Household', '65', '446.42', 'Labetalol Hydrochloride', 'New Beetle', 'Brown Inc', '133', '7', '4', '99028', '24825 Prentice Trail', '34', '23.04', '486.30', '443.94', '216.67', '2018-02-12 00:00:00', '2018-03-01 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('578', 'Overhold', 'HG-77687', 'Hybrid', '33', '647.78', 'Best Choice', 'Ram 2500', 'Leuschke LLC', '133', '7', '2', '56560', '2 Sutherland Way', '06', '29.66', '249.46', '96.45', '444.82', '2018-02-09 00:00:00', '2018-03-12 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('579', 'Bamity', 'NU-30590', 'Household', '4', '587.64', 'Oxygen', 'Mark VIII', 'Dach, Haley and Borer', '133', '7', '5', '18508', '43 Kensington Lane', '50', '5.07', '355.89', '418.12', '276.45', '2018-02-12 00:00:00', '2018-03-07 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('580', 'It', 'FG-71783', 'Work Tools', '66', '967.37', 'Olive Oil Antibacterial Foaming Hand Wash', 'S80', 'Blanda and Sons', '133', '7', '3', '18874', '1 Fairview Court', '11', '20.44', '129.26', '143.16', '109.26', '2018-02-13 00:00:00', '2018-03-29 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('581', 'Duobam', 'VO-36651', 'Hybrid', '40', '295.51', 'Ciprofloxacin hydrochloride', 'Topaz', 'Cummings-Rolfson', '133', '7', '6', '91765', '95 Stone Corner Way', '00', '14.26', '472.48', '375.63', '257.12', '2018-02-21 00:00:00', '2018-03-13 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('582', 'Tresom', 'BR-80401', 'Apparatus', '47', '316.10', 'Oxygen', 'New Beetle', 'Weimann, Pfeffer and Terry', '133', '7', '4', '98178', '99587 Lukken Point', '87', '2.48', '87.58', '262.84', '199.52', '2018-02-06 00:00:00', '2018-03-19 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('583', 'Quo Lux', 'RN-88036', 'Gadget', '82', '568.71', 'Nicotine Polacrilex, Coated Mint Flavor', 'Century', 'Weissnat and Sons', '133', '7', '6', '4595', '69506 Kim Hill', '79', '6.08', '114.69', '196.92', '381.25', '2018-02-27 00:00:00', '2018-03-15 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('584', 'Zathin', 'XY-76111', 'Household', '88', '390.13', 'Doxorubicin Hydrochloride', 'SL-Class', 'Connelly Group', '133', '7', '6', '58380', '1 Kropf Center', '15', '17.56', '257.15', '114.59', '192.09', '2018-02-13 00:00:00', '2018-03-10 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('585', 'Biodex', 'PJ-51723', 'Apparatus', '68', '490.78', 'GROUNDSEL TREE POLLEN', 'F150', 'Raynor and Sons', '133', '7', '2', '45368', '42091 Farragut Street', '35', '14.42', '143.58', '459.94', '281.15', '2018-02-16 00:00:00', '2018-03-24 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('586', 'Gembucket', 'DZ-47456', 'Household', '83', '866.73', 'White Mulberry', 'G6', 'Pfannerstill Inc', '133', '7', '3', '23261', '4 Gale Parkway', '24', '14.53', '98.68', '14.11', '231.61', '2018-02-19 00:00:00', '2018-03-14 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('587', 'Zoolab', 'YB-14689', 'Hybrid', '71', '268.26', 'Best Choice Nighttime Severe Cold and Cough', 'LR2', 'Hansen-Satterfield', '133', '7', '6', '48296', '67 Pepper Wood Trail', '77', '28.12', '326.99', '29.70', '429.76', '2018-02-18 00:00:00', '2018-03-13 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('588', 'Zaam-Dox', 'WF-06368', 'Gadget', '16', '420.94', 'Pantene Pro-V Expert Collection', 'Diablo', 'Wisoky-Upton', '133', '7', '2', '74610', '6327 Toban Parkway', '88', '20.86', '347.63', '188.07', '213.98', '2018-02-15 00:00:00', '2018-03-15 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('589', 'Transcof', 'OR-30924', 'Gadget', '77', '190.82', 'Amlodipine Besylate', 'F150', 'Yost-Hand', '133', '7', '6', '94704', '5 Bonner Court', '22', '19.19', '439.60', '468.22', '54.19', '2018-02-01 00:00:00', '2018-03-09 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('590', 'Y-find', 'NZ-75462', 'Work Tools', '20', '210.29', 'GUNA-RERIO', '911', 'Hills-O\'Keefe', '133', '7', '6', '62381', '5167 Brentwood Alley', '92', '26.47', '411.88', '281.58', '167.69', '2018-02-09 00:00:00', '2018-03-02 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('591', 'Cookley', 'TQ-16634', 'Household', '46', '956.53', 'Goodys Extra Strength', 'Tiburon', 'Hirthe LLC', '133', '7', '4', '58010', '574 Old Gate Avenue', '26', '10.19', '260.03', '394.49', '34.88', '2018-02-12 00:00:00', '2018-03-02 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('592', 'Flexidy', 'YI-09014', 'Gadget', '59', '680.56', 'Ipecac', 'Caliber', 'Connelly, Armstrong and Monahan', '133', '7', '5', '13065', '99024 John Wall Center', '02', '22.47', '352.14', '443.04', '436.23', '2018-02-05 00:00:00', '2018-03-23 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('593', 'Latlux', 'KQ-82193', 'Gadget', '14', '811.85', 'Famciclovir', 'F-Series Super Duty', 'Okuneva-Breitenberg', '133', '7', '2', '95275', '1250 Grasskamp Point', '49', '15.54', '316.57', '130.27', '289.58', '2018-02-20 00:00:00', '2018-03-28 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('594', 'Hatity', 'MM-60570', 'Household', '45', '780.69', 'INLYTA', 'CLK-Class', 'Keeling, Leannon and Cummerata', '133', '7', '2', '91954', '70 Hollow Ridge Pass', '82', '23.12', '472.84', '31.25', '483.45', '2018-02-18 00:00:00', '2018-03-18 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('595', 'Tempsoft', 'UX-94133', 'Apparatus', '61', '830.58', 'Atenolol', 'Focus', 'Ryan-Cremin', '133', '7', '3', '28702', '94596 Almo Drive', '36', '5.65', '49.43', '170.11', '421.21', '2018-02-16 00:00:00', '2018-03-28 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('596', 'Tres-Zap', 'NZ-75884', 'Household', '93', '516.25', 'Cefepime Hydrochloride', 'Charger', 'Schultz-Schroeder', '133', '7', '6', '90096', '999 Morningstar Hill', '00', '1.28', '160.98', '199.61', '222.95', '2018-02-15 00:00:00', '2018-03-03 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('597', 'Regrant', 'HW-73896', 'Gadget', '67', '653.81', 'PHENTERMINE HYDROCHLORIDE', 'SVX', 'Frami LLC', '133', '7', '4', '83890', '670 Fallview Way', '88', '6.51', '12.05', '282.61', '257.52', '2018-02-07 00:00:00', '2018-03-14 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('598', 'Lotlux', 'WL-66804', 'Gadget', '34', '971.16', 'Gas-X', 'Suburban 1500', 'Schmitt Inc', '133', '7', '5', '46749', '01 Heath Center', '54', '2.25', '123.49', '146.89', '261.32', '2018-02-12 00:00:00', '2018-03-22 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('599', 'Cookley', 'UK-79108', 'Gadget', '58', '703.14', 'PHENTERMINE HYDROCHLORIDE', 'Cube', 'Corkery Group', '133', '7', '4', '85958', '722 Granby Drive', '06', '11.01', '44.81', '86.87', '396.93', '2018-02-05 00:00:00', '2018-03-25 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('600', 'Fixflex', 'GA-90168', 'Hybrid', '13', '8.72', 'Etodolac', 'Lucerne', 'Lockman Inc', '133', '7', '6', '60806', '02 West Trail', '61', '23.17', '492.51', '348.06', '179.70', '2018-02-16 00:00:00', '2018-03-14 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('601', 'Sub-Ex', 'ZE-07369', 'Work Tools', '42', '55.61', 'Mineral Oil', 'Cirrus', 'Powlowski-O\'Reilly', '133', '7', '5', '92182', '83 Elmside Circle', '70', '11.30', '247.45', '467.42', '358.83', '2018-02-24 00:00:00', '2018-03-29 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('602', 'Zaam-Dox', 'HW-35271', 'Apparatus', '70', '425.37', 'Etidronate Disodium', 'A5', 'Wintheiser, Watsica and Hartmann', '133', '7', '5', '53332', '67541 Harper Circle', '71', '19.91', '360.68', '184.34', '70.32', '2018-02-16 00:00:00', '2018-03-19 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('603', 'Greenlam', 'IM-36619', 'Gadget', '24', '276.94', 'Exelon', 'Town Car', 'Quigley-Schoen', '133', '7', '3', '36759', '33 Gale Pass', '86', '26.90', '64.04', '48.07', '499.05', '2018-02-23 00:00:00', '2018-03-10 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('604', 'Voyatouch', 'YT-06809', 'Household', '95', '96.01', 'Ranitidine', 'LR3', 'Marks-Runolfsson', '133', '7', '5', '8231', '500 Linden Street', '88', '13.09', '142.24', '259.24', '4.47', '2018-02-13 00:00:00', '2018-03-11 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('605', 'Wrapsafe', 'GJ-14569', 'Hybrid', '43', '979.20', 'healthy accents nicotine', 'Range Rover', 'Little, Maggio and Von', '133', '7', '2', '57258', '7537 Beilfuss Hill', '85', '9.58', '368.54', '87.36', '398.50', '2018-02-12 00:00:00', '2018-03-02 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('606', 'Keylex', 'ZQ-75928', 'Work Tools', '81', '74.06', 'Divalproex Sodium', 'Aviator', 'MacGyver and Sons', '133', '7', '2', '86900', '5011 Bartelt Park', '44', '2.51', '95.38', '100.59', '382.03', '2018-02-12 00:00:00', '2018-03-19 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('607', 'Sonair', 'KK-31764', 'Work Tools', '50', '863.17', 'fast mucus relief', 'Lancer', 'Kohler, Predovic and Hilll', '133', '7', '6', '86297', '4 Bonner Crossing', '91', '5.93', '359.65', '285.98', '14.25', '2018-02-06 00:00:00', '2018-03-18 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('608', 'Keylex', 'QB-24571', 'Work Tools', '2', '195.75', 'COUGH AND COLD NIGHTTIME FORMULA KIDS RELIEF', 'Tacoma Xtra', 'Ward-Green', '133', '7', '3', '19246', '580 Amoth Trail', '89', '5.45', '123.92', '317.26', '429.47', '2018-02-04 00:00:00', '2018-03-04 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('609', 'Stringtough', 'HS-98337', 'Gadget', '86', '471.04', 'PAROXETINE', 'ES', 'Green-Roberts', '133', '7', '3', '81434', '54 Green Road', '24', '16.04', '157.13', '439.92', '10.03', '2018-02-08 00:00:00', '2018-03-23 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('610', 'Kanlam', 'NI-33864', 'Gadget', '10', '788.58', 'Diltiazem Hydrochloride', 'Gran Sport', 'Howe LLC', '133', '7', '6', '48096', '80 Clyde Gallagher Place', '91', '16.44', '114.37', '31.55', '49.05', '2018-02-15 00:00:00', '2018-03-20 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('611', 'Cardify', 'UI-80439', 'Work Tools', '15', '998.72', 'Ritalin', 'Sable', 'Graham-Heathcote', '133', '7', '5', '44682', '2 Atwood Road', '97', '22.01', '209.05', '227.45', '472.32', '2018-02-20 00:00:00', '2018-03-21 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('612', 'Span', 'FA-05817', 'Gadget', '52', '125.96', 'Peppermint', 'Sienna', 'Hauck-Goyette', '133', '7', '3', '26589', '39128 Upham Avenue', '30', '13.74', '377.64', '7.90', '369.75', '2018-02-10 00:00:00', '2018-03-05 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('613', 'Tresom', 'HL-20190', 'Apparatus', '33', '994.99', 'Ipratropium Bromide', 'Esperante', 'Crooks-Schmidt', '133', '7', '6', '87740', '3748 Saint Paul Plaza', '87', '10.00', '486.92', '100.64', '41.11', '2018-02-15 00:00:00', '2018-03-18 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('614', 'Biodex', 'SJ-36210', 'Household', '83', '216.27', 'Bodycology', 'Leone', 'Haag-Marquardt', '133', '7', '4', '72223', '74 Anhalt Lane', '85', '14.86', '345.41', '259.38', '300.17', '2018-02-10 00:00:00', '2018-03-24 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('615', 'Transcof', 'SQ-70541', 'Work Tools', '15', '46.67', 'KETOROLAC TROMETHAMINE', 'Regal', 'Emmerich, Hamill and Kohler', '133', '7', '2', '4607', '1 Loftsgordon Road', '35', '7.63', '183.63', '414.33', '475.47', '2018-02-02 00:00:00', '2018-03-07 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('616', 'Andalax', 'MX-10268', 'Work Tools', '23', '219.02', 'Hydrocodone Bitartrate And Acetaminophen', '626', 'Langworth, Lehner and Schmidt', '133', '7', '6', '96676', '33 Harbort Trail', '19', '7.11', '89.95', '483.69', '420.06', '2018-02-19 00:00:00', '2018-03-27 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('617', 'Prodder', 'OL-18829', 'Hybrid', '70', '552.71', 'Standardized Kentucky (June) Bluegrass Pollen', 'MX-3', 'Waelchi LLC', '133', '7', '2', '78738', '1535 Di Loreto Street', '54', '1.96', '413.34', '373.37', '43.78', '2018-02-27 00:00:00', '2018-03-20 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('618', 'Mat Lam Tam', 'PI-76407', 'Hybrid', '80', '501.34', 'FAMOTIDINE', 'Evora', 'Weissnat, Hilpert and Murray', '133', '7', '2', '47287', '2344 Johnson Pass', '27', '29.74', '221.12', '206.14', '385.53', '2018-02-22 00:00:00', '2018-03-20 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('619', 'Wrapsafe', 'QZ-26832', 'Hybrid', '68', '992.96', 'SHISEIDO ADVANCED HYDRO-LIQUID COMPACT (REFILL)', 'Sportage', 'Gusikowski, Grimes and Gutkowski', '133', '7', '6', '16', '79 Dryden Lane', '76', '2.33', '184.53', '131.42', '364.66', '2018-02-23 00:00:00', '2018-03-21 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('620', 'Bamity', 'HQ-63501', 'Hybrid', '25', '46.08', 'CLE DE PEAU BEAUTE RADIANT FLUID FOUNDATION', 'FF', 'Cummerata-Jacobs', '133', '7', '3', '68713', '72 Morningstar Crossing', '20', '1.90', '309.89', '139.23', '477.77', '2018-02-21 00:00:00', '2018-03-22 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('621', 'Zaam-Dox', 'WW-95701', 'Household', '90', '935.52', 'buspirone hydrochloride', 'Tiburon', 'Ratke-Emard', '133', '7', '4', '62106', '6 Packers Plaza', '57', '2.14', '257.36', '227.34', '227.61', '2018-02-12 00:00:00', '2018-03-15 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('622', 'Latlux', 'ZX-06243', 'Work Tools', '90', '866.03', 'stila CC color correcting broad-spectrum SPF 20 08 TAN', 'Lancer Evolution', 'Paucek, Kub and Berge', '133', '7', '3', '94745', '088 John Wall Park', '97', '4.46', '238.91', '64.80', '80.61', '2018-02-23 00:00:00', '2018-03-09 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('623', 'Cardify', 'QO-39458', 'Household', '55', '472.69', 'ESIKA HD COLOR HIGH DEFINITION COLOR SPF 20', 'Eurovan', 'Tromp-Donnelly', '133', '7', '4', '11699', '73 Westridge Junction', '42', '6.50', '45.62', '335.21', '18.95', '2018-02-09 00:00:00', '2018-03-16 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('624', 'Zaam-Dox', 'CV-30760', 'Hybrid', '70', '823.52', 'REYATAZ', 'Continental Flying Spur', 'Mosciski and Sons', '133', '7', '3', '86301', '9 Arkansas Hill', '58', '15.59', '490.07', '97.30', '449.84', '2018-02-04 00:00:00', '2018-03-20 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('625', 'Bitwolf', 'CG-03287', 'Gadget', '56', '191.04', 'Propafenone HCl', 'E-Class', 'Jaskolski Inc', '133', '7', '6', '78692', '342 Eastlawn Alley', '12', '28.74', '201.00', '387.13', '99.75', '2018-02-09 00:00:00', '2018-03-07 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('626', 'Overhold', 'KU-89059', 'Hybrid', '48', '356.42', 'Nice', 'GX', 'Wilderman, Schmitt and Rosenbaum', '133', '7', '6', '34096', '0 Raven Drive', '04', '8.55', '221.27', '112.95', '107.10', '2018-02-03 00:00:00', '2018-03-15 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('627', 'Pannier', 'XM-21699', 'Apparatus', '17', '198.85', 'Venlafaxine Hydrochloride', 'Range Rover', 'Mueller Inc', '133', '7', '2', '78741', '0341 Tony Junction', '16', '26.05', '175.48', '317.07', '454.07', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('628', 'Temp', 'FW-07942', 'Apparatus', '7', '905.47', 'Miacalcin', 'Rabbit', 'Botsford-Hessel', '133', '7', '2', '44780', '38 Melby Court', '16', '26.12', '82.89', '150.66', '386.96', '2018-02-01 00:00:00', '2018-03-01 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('629', 'Quo Lux', 'ZO-87530', 'Household', '20', '691.19', 'Soothe', 'Town & Country', 'Veum, O\'Hara and Berge', '133', '7', '5', '84793', '766 Canary Terrace', '90', '19.67', '54.80', '74.08', '69.74', '2018-02-12 00:00:00', '2018-03-15 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('630', 'Kanlam', 'KT-37871', 'Hybrid', '10', '885.12', 'Natural Fiber Powder', 'G-Series G20', 'Hodkiewicz-Ruecker', '133', '7', '5', '83469', '198 Crest Line Plaza', '98', '4.51', '207.17', '244.06', '380.45', '2018-02-08 00:00:00', '2018-03-06 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('631', 'Ventosanzap', 'CU-11130', 'Work Tools', '36', '447.40', 'Cefuroxime axetil', 'ES', 'Jones-Lueilwitz', '133', '7', '5', '22983', '932 Judy Alley', '85', '27.41', '76.64', '490.42', '366.18', '2018-02-16 00:00:00', '2018-03-07 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('632', 'Tres-Zap', 'RB-56093', 'Work Tools', '10', '303.91', 'Health Smart Natural Epsom Salt', 'Crown Victoria', 'Kub-Jenkins', '133', '7', '5', '21796', '062 Fremont Circle', '90', '9.97', '27.13', '431.32', '231.80', '2018-02-05 00:00:00', '2018-03-14 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('633', 'Voltsillam', 'PI-25973', 'Gadget', '88', '194.22', 'kaiser permanente benzoyl peroxide', 'Durango', 'Abbott-Okuneva', '133', '7', '5', '43559', '702 Linden Circle', '94', '12.27', '321.56', '173.91', '50.32', '2018-02-03 00:00:00', '2018-03-22 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('634', 'Duobam', 'SN-20214', 'Hybrid', '13', '188.51', 'Cuprum 17 Special Order', 'S2000', 'Hane, Sawayn and Parker', '133', '7', '5', '97097', '325 Blue Bill Park Street', '64', '24.16', '456.51', '382.60', '355.76', '2018-02-10 00:00:00', '2018-03-03 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('635', 'Y-find', 'GJ-21083', 'Gadget', '46', '335.61', 'Neutrogena Mineral Sheers', 'SL-Class', 'Klocko, Huels and Bernier', '133', '7', '6', '46337', '45 Magdeline Crossing', '55', '22.77', '338.79', '455.34', '142.41', '2018-02-19 00:00:00', '2018-03-24 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('636', 'Job', 'KN-16482', 'Household', '48', '334.35', 'VIVID TINT BAR', 'Outlander', 'Hayes-Wilderman', '133', '7', '5', '64926', '0391 Merchant Junction', '35', '9.00', '196.86', '34.20', '389.53', '2018-02-16 00:00:00', '2018-03-18 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('637', 'Vagram', 'PA-53161', 'Hybrid', '47', '74.23', 'ULMUS CRASSIFOLIA POLLEN', 'V70', 'McClure, Price and Cummings', '133', '7', '2', '14028', '8475 Crescent Oaks Place', '78', '9.35', '168.31', '177.29', '174.65', '2018-02-27 00:00:00', '2018-03-25 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('638', 'It', 'CQ-63891', 'Apparatus', '47', '267.45', 'Standardized Bermuda Grass Pollen', 'Escalade', 'Gibson-Hartmann', '133', '7', '5', '68724', '05422 Raven Court', '39', '26.16', '233.93', '296.28', '83.59', '2018-02-02 00:00:00', '2018-03-17 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('639', 'Stronghold', 'CE-98412', 'Household', '66', '171.97', 'Metoprolol Tartrate', 'Escape', 'Funk Group', '133', '7', '3', '37868', '587 Summit Pass', '59', '11.14', '176.83', '346.64', '236.51', '2018-02-06 00:00:00', '2018-03-19 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('640', 'Tres-Zap', 'SS-06173', 'Household', '99', '875.72', 'Scalpicin Medicated Wipes', 'Focus', 'Corkery, Jacobi and O\'Connell', '133', '7', '6', '96752', '182 Westridge Parkway', '14', '13.72', '444.18', '444.37', '405.75', '2018-02-21 00:00:00', '2018-03-14 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('641', 'Bitwolf', 'YP-89925', 'Household', '84', '352.95', 'Solu-Medrol', 'Grand Caravan', 'Langworth-Reilly', '133', '7', '2', '79121', '01 Melrose Crossing', '95', '22.32', '388.54', '318.69', '341.26', '2018-02-10 00:00:00', '2018-03-04 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('642', 'Voyatouch', 'YK-83535', 'Gadget', '84', '114.57', 'Smart Sense', 'Exige', 'Schumm and Sons', '133', '7', '4', '4476', '47337 Maple Wood Way', '10', '3.16', '183.62', '207.70', '495.94', '2018-02-01 00:00:00', '2018-03-03 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('643', 'Gembucket', 'GS-25565', 'Household', '4', '99.60', 'Hyosyne', 'Sienna', 'Von-Casper', '133', '7', '5', '40811', '822 Sunnyside Court', '90', '2.15', '298.32', '145.46', '448.78', '2018-02-13 00:00:00', '2018-03-26 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('644', 'Home Ing', 'VX-24761', 'Work Tools', '16', '90.98', 'Butalbital, Acetaminophen and Caffeine', 'Prelude', 'Tromp, Streich and Hane', '133', '7', '4', '41361', '9 Emmet Parkway', '74', '10.63', '27.06', '155.11', '234.40', '2018-02-05 00:00:00', '2018-03-21 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('645', 'It', 'FU-21805', 'Apparatus', '29', '750.26', 'cephalexin', 'Impreza', 'Boehm-Gottlieb', '133', '7', '4', '60730', '69072 Thackeray Terrace', '41', '12.45', '326.45', '227.32', '83.22', '2018-02-19 00:00:00', '2018-03-26 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('646', 'Job', 'AG-11861', 'Apparatus', '94', '285.36', 'NEO CLASSIC HOMME BB', 'Sorento', 'Dietrich Group', '133', '7', '4', '42864', '1641 Lighthouse Bay Center', '47', '16.64', '439.10', '65.07', '139.49', '2018-02-10 00:00:00', '2018-03-27 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('647', 'Tin', 'BJ-07038', 'Household', '70', '66.71', 'La Vaquita', 'V70', 'Lockman, Ritchie and Waters', '133', '7', '2', '99856', '66 American Ash Hill', '01', '28.40', '322.60', '354.86', '229.20', '2018-02-04 00:00:00', '2018-03-22 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('648', 'Trippledex', 'PC-61129', 'Gadget', '59', '12.41', 'Carbo Vegetabilis 30c', 'Ram', 'Dietrich-Roob', '133', '7', '4', '44705', '925 Little Fleur Junction', '41', '2.19', '175.76', '80.26', '94.10', '2018-02-04 00:00:00', '2018-03-03 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('649', 'Lotlux', 'PI-36353', 'Gadget', '98', '808.25', 'Argentum Quartz', 'Explorer', 'Kshlerin, Bogisich and Bartoletti', '133', '7', '6', '97566', '427 Fieldstone Alley', '97', '13.59', '237.98', '39.08', '483.16', '2018-02-20 00:00:00', '2018-03-30 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('650', 'Y-find', 'ED-09526', 'Gadget', '37', '109.59', 'Good Neighbor Pharmacy ibuprofen', 'Festiva', 'Kessler LLC', '133', '7', '3', '87330', '1391 Cascade Alley', '41', '21.85', '375.45', '80.19', '320.36', '2018-02-06 00:00:00', '2018-03-22 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('651', 'Tempsoft', 'WG-68778', 'Household', '73', '487.58', 'Witch Hazel', 'Corvette', 'Hoppe, Larkin and Legros', '133', '7', '2', '64968', '27435 Oak Valley Street', '76', '20.01', '185.35', '158.66', '27.74', '2018-02-02 00:00:00', '2018-03-17 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('652', 'Bitchip', 'XG-42346', 'Apparatus', '50', '541.06', 'Losartan Potassium and Hydrochlorothiazide', '3 Series', 'Hilll, Hagenes and Fay', '133', '7', '2', '31038', '51502 Norway Maple Parkway', '22', '1.02', '311.57', '148.94', '441.94', '2018-02-13 00:00:00', '2018-03-24 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('653', 'Tampflex', 'ZE-43688', 'Gadget', '33', '131.01', 'QUERCUS ALBA POLLEN', 'XL-7', 'Marquardt Group', '133', '7', '6', '87477', '564 Northwestern Way', '22', '3.31', '473.84', '54.87', '359.16', '2018-02-05 00:00:00', '2018-03-12 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('654', 'Tresom', 'WX-35774', 'Hybrid', '1', '188.67', 'Live Better', 'Tracker', 'Durgan and Sons', '133', '7', '3', '92088', '27586 Sunfield Drive', '55', '7.05', '318.72', '11.08', '143.66', '2018-02-16 00:00:00', '2018-03-22 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('655', 'Andalax', 'KX-78228', 'Work Tools', '8', '186.28', 'Nite Time', 'Savana 2500', 'Schimmel, Bruen and Spinka', '133', '7', '5', '76386', '353 Twin Pines Hill', '58', '19.43', '386.00', '394.51', '12.39', '2018-02-23 00:00:00', '2018-03-07 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('656', 'Kanlam', 'SJ-76612', 'Hybrid', '66', '832.23', 'Dermasorb AF Complete Kit', 'Impreza', 'Cummerata, Wiza and Rice', '133', '7', '5', '15363', '867 Kenwood Circle', '94', '23.32', '429.98', '227.20', '37.79', '2018-02-12 00:00:00', '2018-03-12 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('657', 'Overhold', 'YF-21128', 'Hybrid', '43', '957.24', 'SMART SENSE', 'Tiguan', 'Spinka-Glover', '133', '7', '2', '85464', '12 Crest Line Plaza', '05', '23.56', '238.81', '441.92', '347.01', '2018-02-26 00:00:00', '2018-03-28 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('658', 'Konklab', 'VY-49633', 'Hybrid', '51', '93.24', 'DEXTROAMPHETAMINE SULFATE', 'M3', 'Bogisich, Blanda and Stracke', '133', '7', '3', '58981', '7 Eastlawn Street', '15', '26.54', '198.48', '18.27', '155.05', '2018-02-27 00:00:00', '2018-03-05 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('659', 'Sonsing', 'ZD-93372', 'Apparatus', '7', '885.93', 'pramipexole dihydrochloride', 'Yukon', 'Parker LLC', '133', '7', '4', '65009', '8537 Kennedy Lane', '73', '16.02', '163.12', '449.80', '153.90', '2018-02-19 00:00:00', '2018-03-06 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('660', 'Lotlux', 'TO-05108', 'Work Tools', '6', '295.27', 'KALI BICHROMICUM', 'S10', 'Mertz and Sons', '133', '7', '3', '91382', '7 Jay Plaza', '01', '29.16', '101.26', '397.70', '454.06', '2018-02-12 00:00:00', '2018-03-14 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('661', 'Alphazap', 'RO-15697', 'Gadget', '66', '191.35', 'ADSOL Red Cell Preservation Solution System in Plastic Container (PL 146 Plastic)', 'Skylark', 'Batz Inc', '133', '7', '6', '90709', '12 Jana Crossing', '70', '16.28', '65.19', '149.66', '461.33', '2018-02-07 00:00:00', '2018-03-22 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('662', 'Prodder', 'LZ-72520', 'Work Tools', '40', '948.23', 'Clonazepam', 'Supra', 'King, McClure and Legros', '133', '7', '6', '23538', '5141 Fallview Trail', '61', '22.88', '416.45', '146.59', '299.92', '2018-02-24 00:00:00', '2018-03-26 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('663', 'Tres-Zap', 'IR-44656', 'Apparatus', '1', '836.12', 'Minocycline Hydrochloride', 'Grand Cherokee', 'Wolf-Metz', '133', '7', '4', '46502', '46 Barby Trail', '15', '27.95', '388.91', '116.38', '420.03', '2018-02-03 00:00:00', '2018-03-24 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('664', 'Alpha', 'FU-00865', 'Gadget', '27', '377.16', 'Alka-Seltzer Plus Fast Crystals Packs Cold Formula', 'Corrado', 'Brakus, Mills and Klocko', '133', '7', '3', '62335', '649 Chinook Junction', '44', '7.17', '246.76', '92.04', '396.61', '2018-02-17 00:00:00', '2018-03-15 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('665', 'Tres-Zap', 'KR-72179', 'Apparatus', '52', '494.99', 'LONG LAST GLOSSWEAR', 'PT Cruiser', 'Abbott, D\'Amore and Price', '133', '7', '3', '73828', '75339 Buhler Circle', '55', '7.27', '340.46', '410.40', '164.51', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('666', 'Opela', 'IO-70616', 'Hybrid', '16', '655.57', 'CD CAPTURE TOTALE Multi-Perfection UVB Base Sunscreen SPF 50', '530', 'Schoen and Sons', '133', '7', '2', '95360', '9 Veith Point', '95', '28.69', '171.28', '220.80', '196.84', '2018-02-07 00:00:00', '2018-03-05 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('667', 'Voltsillam', 'AY-09213', 'Hybrid', '56', '558.53', 'Rheumatoid Arthritis Nosode', 'Camaro', 'McKenzie-Hintz', '133', '7', '2', '61237', '9857 Judy Crossing', '81', '10.12', '314.79', '277.60', '185.14', '2018-02-12 00:00:00', '2018-03-27 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('668', 'Wrapsafe', 'FF-09119', 'Household', '80', '239.92', 'AIR', 'Malibu', 'Reichel, Howe and Ferry', '133', '7', '6', '26138', '0453 Fairfield Street', '94', '3.74', '142.92', '47.24', '169.85', '2018-02-10 00:00:00', '2018-03-18 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('669', 'Transcof', 'XF-75811', 'Household', '20', '40.56', 'Lisinopril', 'Crown Victoria', 'Ryan, Koss and Schneider', '133', '7', '5', '17115', '89 Old Shore Place', '27', '3.63', '329.81', '249.59', '218.51', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('670', 'Regrant', 'JN-98836', 'Gadget', '27', '355.24', 'diltiazem hydrochloride', 'Camry Hybrid', 'Hessel-Roberts', '133', '7', '2', '13129', '5 Upham Drive', '70', '12.22', '113.07', '243.82', '169.27', '2018-02-11 00:00:00', '2018-03-23 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('671', 'Tempsoft', 'KY-99017', 'Gadget', '52', '892.86', 'Vertiforce', 'SRX', 'Jones-Johnston', '133', '7', '6', '32509', '7161 Forest Way', '94', '9.35', '226.38', '324.77', '330.57', '2018-02-27 00:00:00', '2018-03-23 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('672', 'Holdlamis', 'HQ-82439', 'Gadget', '72', '539.84', 'Glycopyrrolate', 'Golf', 'Oberbrunner Group', '133', '7', '6', '68354', '57325 Hollow Ridge Junction', '19', '10.34', '440.18', '97.58', '173.09', '2018-02-20 00:00:00', '2018-03-14 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('673', 'Namfix', 'HB-09023', 'Hybrid', '7', '394.18', 'Good Neighbor Pharmacy Acid Reducer', 'Yaris', 'MacGyver LLC', '133', '7', '4', '81651', '4410 Lakeland Trail', '68', '22.87', '121.60', '76.80', '128.17', '2018-02-12 00:00:00', '2018-03-28 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('674', 'Subin', 'FA-78490', 'Gadget', '32', '329.24', 'Tizanidine', 'Impreza', 'Zulauf Inc', '133', '7', '5', '41029', '8427 Thompson Circle', '55', '24.21', '11.62', '266.62', '23.93', '2018-02-18 00:00:00', '2018-03-25 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('675', 'Cardify', 'DI-70031', 'Gadget', '89', '315.02', 'Ibuprofen softgels', 'Familia', 'Wilkinson-Kassulke', '133', '7', '5', '54035', '0 Garrison Plaza', '81', '29.53', '393.74', '67.48', '241.07', '2018-02-17 00:00:00', '2018-03-19 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('676', 'Daltfresh', 'BS-90294', 'Household', '97', '126.16', 'Camilia', 'Dakota', 'Koss-Parker', '133', '7', '2', '86248', '99 Independence Way', '50', '28.98', '335.63', '358.62', '472.38', '2018-02-22 00:00:00', '2018-03-26 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('677', 'Job', 'MA-52392', 'Work Tools', '38', '976.11', 'Nafcillin', 'Miata MX-5', 'Effertz, Koss and Collier', '133', '7', '3', '55674', '79686 Annamark Center', '68', '28.94', '421.54', '436.04', '214.31', '2018-02-06 00:00:00', '2018-03-13 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('678', 'Viva', 'KC-58630', 'Apparatus', '59', '686.68', 'Perfect Sleep', 'Skylark', 'Ritchie-Beahan', '133', '7', '6', '37284', '55 Hauk Plaza', '00', '26.81', '226.94', '441.75', '379.58', '2018-02-15 00:00:00', '2018-03-24 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('679', 'Konklab', 'BN-51224', 'Household', '57', '129.08', 'BuPROPion Hydrochloride', 'LS', 'Howell-McGlynn', '133', '7', '5', '26304', '7 Kinsman Road', '30', '11.00', '449.01', '115.25', '251.74', '2018-02-16 00:00:00', '2018-03-09 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('680', 'Regrant', 'UK-04170', 'Work Tools', '75', '889.37', 'Navane', 'S-Series', 'Bode Group', '133', '7', '2', '60029', '931 Dapin Junction', '42', '2.01', '174.48', '64.09', '215.74', '2018-02-01 00:00:00', '2018-03-02 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('681', 'Cookley', 'DN-54382', 'Household', '44', '801.90', 'SURGICEPT', 'Beretta', 'Shanahan, Walsh and Dicki', '133', '7', '3', '18116', '95 Clarendon Hill', '39', '13.90', '33.23', '16.97', '71.04', '2018-02-13 00:00:00', '2018-03-16 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('682', 'Kanlam', 'KI-85919', 'Work Tools', '11', '23.32', 'CVS day time cough and severe cold', 'Tacoma', 'Kautzer Inc', '133', '7', '5', '9670', '956 Gateway Circle', '11', '14.75', '133.13', '289.52', '473.06', '2018-02-22 00:00:00', '2018-03-08 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('683', 'Aerified', 'YF-49787', 'Apparatus', '80', '780.87', 'Zenchent', 'Bonneville', 'Mayer and Sons', '133', '7', '4', '1481', '9 Doe Crossing Place', '82', '13.24', '42.11', '2.30', '420.90', '2018-02-24 00:00:00', '2018-03-13 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('684', 'Overhold', 'HE-31784', 'Apparatus', '82', '610.86', 'BUPROPION HYDROCHLORIDE', 'Mountaineer', 'Haley, Tremblay and Fisher', '133', '7', '6', '27061', '0523 7th Drive', '55', '10.08', '291.82', '296.89', '407.66', '2018-02-10 00:00:00', '2018-03-16 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('685', 'Veribet', 'XI-58442', 'Gadget', '45', '934.14', 'Smart sense', 'Corolla', 'Johnson, Yost and O\'Reilly', '133', '7', '6', '95210', '5 Dennis Plaza', '94', '27.66', '108.07', '169.02', '332.70', '2018-02-18 00:00:00', '2018-03-06 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('686', 'Regrant', 'KQ-39681', 'Gadget', '42', '39.69', 'Levetiracetam', 'Pilot', 'Pfeffer, Cronin and Muller', '133', '7', '5', '90557', '384 Lindbergh Circle', '92', '14.30', '243.50', '246.78', '315.16', '2018-02-22 00:00:00', '2018-03-16 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('687', 'Fixflex', 'XB-38614', 'Gadget', '29', '602.54', 'Isosorbide', 'Solara', 'O\'Kon, Prohaska and D\'Amore', '133', '7', '5', '36523', '19831 Ohio Pass', '27', '21.40', '436.62', '416.37', '224.99', '2018-02-01 00:00:00', '2018-03-20 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('688', 'Sub-Ex', 'UK-16942', 'Household', '12', '337.85', 'Metoprolol Tartrate', 'Aurora', 'Wilderman-Lueilwitz', '133', '7', '6', '93887', '85 Dryden Parkway', '54', '26.07', '483.89', '111.66', '199.94', '2018-02-22 00:00:00', '2018-03-13 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('689', 'Bitchip', 'KV-54294', 'Apparatus', '83', '257.89', 'Meperidine HCl', 'Sportage', 'Hintz LLC', '133', '7', '5', '28438', '1 Anniversary Lane', '02', '9.14', '322.95', '408.47', '191.66', '2018-02-04 00:00:00', '2018-03-08 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('690', 'Fintone', 'VU-06681', 'Hybrid', '63', '486.88', 'Clindamycin Hydrochloride', 'Sable', 'Greenholt, Hane and Williamson', '133', '7', '6', '61852', '6980 Shelley Lane', '69', '19.02', '458.67', '87.33', '433.28', '2018-02-25 00:00:00', '2018-03-25 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('691', 'Job', 'LX-77259', 'Hybrid', '87', '461.54', 'Tramadol Hydrochloride and Acetaminophen', 'Dakota', 'Glover-Gutkowski', '133', '7', '4', '475', '2214 Ryan Place', '71', '9.21', '159.61', '7.56', '112.20', '2018-02-26 00:00:00', '2018-03-21 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('692', 'Mat Lam Tam', 'TJ-28708', 'Gadget', '56', '724.66', 'TopCare', 'MDX', 'McCullough-Dietrich', '133', '7', '4', '22714', '17674 Jay Hill', '07', '27.92', '282.89', '198.44', '418.55', '2018-02-21 00:00:00', '2018-03-13 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('693', 'Biodex', 'CD-81661', 'Apparatus', '9', '751.89', 'Soma', 'Accord', 'Cormier-Zemlak', '133', '7', '5', '68601', '18 Caliangt Center', '18', '4.81', '182.07', '314.34', '212.44', '2018-02-17 00:00:00', '2018-03-24 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('694', 'Vagram', 'YL-37106', 'Apparatus', '23', '250.49', 'Appetite and Weight with P.H.A.T.', 'Titan', 'Reynolds Inc', '133', '7', '5', '7516', '239 Meadow Valley Pass', '02', '19.68', '40.50', '216.06', '285.57', '2018-02-16 00:00:00', '2018-03-21 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('695', 'Veribet', 'GM-33570', 'Hybrid', '53', '971.01', 'Fentanyl Citrate', 'W123', 'Zemlak-Bartell', '133', '7', '4', '30040', '5107 Paget Hill', '31', '12.58', '142.49', '288.66', '390.03', '2018-02-08 00:00:00', '2018-03-17 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('696', 'Bytecard', 'RI-49848', 'Apparatus', '89', '263.96', 'SEPHORA Skin Perfect CC Sunscreen Broad Spectrum SPF 20 MEDIUM-TAN', 'Terrain', 'Donnelly-Wiza', '133', '7', '5', '3359', '0479 Linden Street', '56', '8.54', '123.92', '74.06', '94.79', '2018-02-07 00:00:00', '2018-03-23 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('697', 'Andalax', 'OK-87452', 'Gadget', '72', '700.65', 'THE SPF 18 FLUID TINT', 'Continental GT', 'Weissnat-Donnelly', '133', '7', '5', '23429', '5571 Thierer Street', '31', '11.43', '312.32', '463.95', '234.39', '2018-02-25 00:00:00', '2018-03-15 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('698', 'Y-Solowarm', 'NV-67021', 'Gadget', '96', '184.42', 'Baclofen', 'CLS-Class', 'Bednar, Rohan and Brakus', '133', '7', '4', '92295', '95 8th Crossing', '40', '17.12', '343.76', '390.73', '152.50', '2018-02-15 00:00:00', '2018-03-24 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('699', 'Biodex', 'MV-43428', 'Hybrid', '90', '315.26', 'Oxycodone and Acetaminophen', 'TT', 'Lind-Dach', '133', '7', '6', '842', '7 Coolidge Alley', '09', '12.48', '188.07', '383.00', '286.51', '2018-02-06 00:00:00', '2018-03-19 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('700', 'Viva', 'ZO-52247', 'Work Tools', '89', '363.15', 'Metaproterenol Sulfate', 'RX-8', 'Jaskolski Inc', '133', '7', '4', '91003', '074 Badeau Trail', '83', '23.12', '372.53', '359.14', '5.09', '2018-02-20 00:00:00', '2018-03-16 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('701', 'Stim', 'AZ-48750', 'Gadget', '4', '868.93', 'PediaCare Childrens Allergy and Cold', 'Express 3500', 'Dickens and Sons', '133', '7', '3', '11533', '2323 Forest Run Way', '17', '29.56', '208.69', '233.74', '337.66', '2018-02-14 00:00:00', '2018-03-10 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('702', 'Treeflex', 'GR-17665', 'Work Tools', '18', '283.66', 'Belladonna Homaccord', 'F250', 'Hilpert, Durgan and Grady', '133', '7', '6', '97548', '487 Columbus Avenue', '42', '28.98', '366.55', '483.33', '21.67', '2018-02-23 00:00:00', '2018-03-24 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('703', 'Otcom', 'CF-75489', 'Gadget', '77', '952.21', 'TYLENOL with Codeine', 'Probe', 'Konopelski-Hintz', '133', '7', '6', '55693', '557 Sullivan Place', '47', '4.54', '295.92', '191.66', '400.02', '2018-02-07 00:00:00', '2018-03-19 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('704', 'Sonair', 'JT-30956', 'Work Tools', '64', '676.90', 'Sesame', 'MPV', 'Prosacco LLC', '133', '7', '3', '16957', '666 Brickson Park Place', '61', '7.40', '239.29', '148.73', '239.58', '2018-02-19 00:00:00', '2018-03-02 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('705', 'Zoolab', 'DS-35945', 'Work Tools', '30', '493.76', 'Alcare Foamed Antiseptic Handrub', '900', 'Kemmer LLC', '133', '7', '2', '93127', '6257 Farmco Road', '03', '2.20', '221.16', '297.54', '181.81', '2018-02-26 00:00:00', '2018-03-09 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('706', 'Redhold', 'TN-83440', 'Apparatus', '9', '992.58', 'Potassium Citrate Citric Acid Crystals', 'Camaro', 'Ryan, Hayes and Pfeffer', '133', '7', '2', '31509', '794 Sloan Terrace', '07', '25.63', '231.74', '231.57', '251.68', '2018-02-01 00:00:00', '2018-03-02 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('707', 'Stim', 'BJ-69313', 'Apparatus', '31', '829.22', 'Menopause', 'ES', 'Buckridge-Gleichner', '133', '7', '3', '43409', '83 Longview Center', '01', '18.52', '317.58', '417.81', '321.69', '2018-02-25 00:00:00', '2018-03-25 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('708', 'Vagram', 'QH-71059', 'Work Tools', '85', '991.87', 'Aspirin', 'Tracer', 'Rosenbaum Group', '133', '7', '3', '2186', '86901 Gerald Point', '32', '8.09', '4.76', '76.98', '357.43', '2018-02-11 00:00:00', '2018-03-08 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('709', 'Gembucket', 'AT-10233', 'Household', '14', '538.15', 'Nice', 'Terraza', 'Beatty-Bailey', '133', '7', '2', '61609', '6 Fair Oaks Point', '90', '16.83', '51.26', '353.49', '473.06', '2018-02-10 00:00:00', '2018-03-26 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('710', 'Tampflex', 'UF-28593', 'Hybrid', '11', '129.44', 'Acetaminophen', '911', 'Ruecker LLC', '133', '7', '5', '50990', '31607 Corben Road', '04', '28.49', '389.19', '6.18', '166.86', '2018-02-02 00:00:00', '2018-03-05 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('711', 'Regrant', 'FF-38627', 'Gadget', '87', '320.68', 'Allergy Relief', 'xB', 'Huels Inc', '133', '7', '2', '90476', '946 Milwaukee Trail', '69', '14.13', '405.18', '336.17', '198.33', '2018-02-11 00:00:00', '2018-03-14 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('712', 'Regrant', 'RI-36936', 'Apparatus', '95', '884.22', 'Chest Rub', 'Firebird', 'Sipes-Sawayn', '133', '7', '4', '19228', '5792 Barby Crossing', '64', '11.07', '82.26', '72.14', '322.06', '2018-02-09 00:00:00', '2018-03-18 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('713', 'Stringtough', 'WB-40298', 'Work Tools', '58', '292.00', 'Halls', 'Silverado', 'Green, Vandervort and Wintheiser', '133', '7', '2', '64084', '1210 Artisan Court', '27', '14.26', '5.86', '91.66', '241.60', '2018-02-09 00:00:00', '2018-03-28 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('714', 'Daltfresh', 'GD-30009', 'Gadget', '81', '123.80', 'equate vitamins a and d', 'Mirage', 'Mertz-Skiles', '133', '7', '3', '38', '441 Bartillon Court', '28', '1.53', '460.27', '200.46', '479.30', '2018-02-16 00:00:00', '2018-03-19 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('715', 'Cookley', 'QW-70038', 'Work Tools', '44', '362.39', 'Allopurinol', 'Trooper', 'Williamson-Barrows', '133', '7', '3', '85718', '82 Stuart Parkway', '65', '7.96', '230.83', '104.43', '211.71', '2018-02-24 00:00:00', '2018-03-29 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('716', 'Voltsillam', 'BT-49714', 'Household', '1', '970.74', 'day time', 'Diamante', 'Koch-Huel', '133', '7', '3', '4032', '40 Grasskamp Junction', '66', '8.82', '380.81', '191.36', '211.25', '2018-02-02 00:00:00', '2018-03-23 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('717', 'Lotstring', 'YY-37856', 'Gadget', '33', '805.48', 'good sense tussin cf', 'Corvette', 'Mraz-Labadie', '133', '7', '3', '56749', '424 Mccormick Point', '22', '14.90', '361.22', '366.68', '171.39', '2018-02-20 00:00:00', '2018-03-07 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('718', 'Treeflex', 'RV-46006', 'Household', '56', '771.24', 'Colocynthis Kit Refill', 'Hombre Space', 'Franecki and Sons', '133', '7', '4', '39261', '2 1st Pass', '61', '13.20', '313.66', '450.06', '7.12', '2018-02-26 00:00:00', '2018-03-15 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('719', 'Latlux', 'ZX-43463', 'Apparatus', '88', '755.05', 'Treatment Set TS347249', 'S-Class', 'Dare, Kutch and Will', '133', '7', '2', '39772', '783 Maywood Place', '12', '6.83', '275.37', '233.86', '64.91', '2018-02-21 00:00:00', '2018-03-20 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('720', 'Greenlam', 'LW-75954', 'Gadget', '10', '175.16', 'Multi Vitamin and Fluoride', 'Optima', 'Bernhard-Trantow', '133', '7', '4', '90638', '19 Independence Hill', '86', '20.51', '499.80', '400.14', '374.53', '2018-02-15 00:00:00', '2018-03-24 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('721', 'Quo Lux', 'ZE-67902', 'Household', '16', '847.49', 'Cotton Linters', 'V8 Vantage', 'Cartwright LLC', '133', '7', '6', '50439', '65 Oneill Pass', '82', '1.77', '440.87', '267.62', '449.95', '2018-02-24 00:00:00', '2018-03-02 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('722', 'Prodder', 'DU-28419', 'Apparatus', '94', '701.47', 'NARS ALL DAY LUMINOUS FOUNDATION', 'Ranger', 'Eichmann-Quitzon', '133', '7', '4', '96459', '69 Prairie Rose Drive', '60', '8.93', '140.98', '300.01', '446.25', '2018-02-08 00:00:00', '2018-03-27 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('723', 'Otcom', 'XR-08355', 'Gadget', '41', '383.53', 'Enchanted Moments Candy Apple Hand Sanitizer', 'STS', 'Smith, Okuneva and Jakubowski', '133', '7', '4', '39190', '656 Cherokee Circle', '22', '7.22', '26.45', '201.44', '10.34', '2018-02-18 00:00:00', '2018-03-18 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('724', 'Zaam-Dox', 'XB-87399', 'Hybrid', '63', '711.28', 'Chocolated Laxative', 'Legacy', 'Herman, Terry and Ward', '133', '7', '2', '14942', '15 Old Gate Trail', '15', '28.12', '489.07', '115.43', '27.58', '2018-02-27 00:00:00', '2018-03-04 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('725', 'Keylex', 'WE-99560', 'Apparatus', '15', '777.73', 'Naratriptan', 'Ram Van 1500', 'Miller, Abshire and Purdy', '133', '7', '5', '72729', '652 Brickson Park Alley', '31', '16.00', '286.49', '14.25', '336.54', '2018-02-08 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('726', 'Biodex', 'IL-57222', 'Household', '48', '508.50', 'UNDECYLENIC ACID', 'Sorento', 'Lakin, Conroy and Hayes', '133', '7', '6', '36806', '79395 Merrick Hill', '77', '4.73', '331.17', '93.88', '245.55', '2018-02-06 00:00:00', '2018-03-05 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('727', 'Lotstring', 'IF-79275', 'Work Tools', '36', '575.44', 'Etodolac', 'Town Car', 'Hintz Inc', '133', '7', '5', '34329', '8950 Dayton Place', '15', '19.21', '85.51', '92.10', '212.83', '2018-02-14 00:00:00', '2018-03-07 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('728', 'Y-Solowarm', 'EI-09477', 'Apparatus', '29', '735.06', 'Riluzole', 'GTO', 'West-Rice', '133', '7', '6', '84391', '07 Browning Lane', '23', '11.23', '486.80', '211.31', '443.95', '2018-02-12 00:00:00', '2018-03-05 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('729', 'Fix San', 'MU-75915', 'Gadget', '32', '262.51', 'INDOCIN', 'Cabriolet', 'Pollich, Deckow and Langosh', '133', '7', '6', '91636', '91738 Elgar Hill', '04', '5.80', '262.26', '496.47', '107.45', '2018-02-10 00:00:00', '2018-03-13 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('730', 'Vagram', 'FT-43558', 'Household', '62', '987.57', 'Chinese Elm', 'Q', 'Boehm-Borer', '133', '7', '5', '94860', '25434 5th Circle', '22', '1.54', '482.33', '346.25', '197.57', '2018-02-04 00:00:00', '2018-03-17 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('731', 'Stringtough', 'YS-44164', 'Apparatus', '41', '570.80', 'TYLENOL', 'Xterra', 'Conn, Lakin and Kerluke', '133', '7', '2', '30875', '4010 John Wall Circle', '10', '12.69', '87.20', '42.17', '6.28', '2018-02-21 00:00:00', '2018-03-07 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('732', 'Domainer', 'IC-14268', 'Hybrid', '74', '631.55', 'Night Time', 'SC', 'Koelpin and Sons', '133', '7', '2', '31291', '6 Towne Center', '58', '17.66', '276.83', '440.93', '59.41', '2018-02-17 00:00:00', '2018-03-02 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('733', 'Quo Lux', 'OZ-31199', 'Household', '98', '824.61', 'Therapeutic Herbal Muscle Calm', 'F-350 Super Duty', 'Kemmer Group', '133', '7', '6', '43618', '8922 Maywood Trail', '33', '26.93', '401.01', '113.63', '68.68', '2018-02-16 00:00:00', '2018-03-23 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('734', 'Pannier', 'OK-24532', 'Work Tools', '69', '372.47', 'Potassium Chloride in Lactated Ringers and Dextrose', 'Intrigue', 'Padberg-Olson', '133', '7', '4', '27039', '69 Birchwood Junction', '78', '8.08', '321.71', '233.62', '241.25', '2018-02-16 00:00:00', '2018-03-17 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('735', 'Stronghold', 'HV-20435', 'Work Tools', '37', '951.81', 'Molds, Rusts and Smuts, Epidermophyton floccosum', 'Bravada', 'Lockman-Steuber', '133', '7', '5', '43756', '579 Schlimgen Pass', '49', '28.31', '116.85', '435.41', '287.20', '2018-02-07 00:00:00', '2018-03-26 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('736', 'Y-Solowarm', 'SN-49431', 'Household', '85', '600.39', 'Acetaminophen', 'Tracer', 'Monahan Group', '133', '7', '4', '65732', '060 Veith Way', '57', '14.30', '264.53', '8.66', '255.39', '2018-02-04 00:00:00', '2018-03-24 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('737', 'Kanlam', 'XM-07329', 'Household', '99', '386.86', 'Risperidone', 'Jetta', 'Muller, Bode and Homenick', '133', '7', '6', '61892', '956 Armistice Parkway', '06', '12.41', '35.05', '191.13', '316.23', '2018-02-15 00:00:00', '2018-03-12 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('738', 'Y-find', 'CQ-48690', 'Hybrid', '31', '922.57', 'Lubricant Eye', '911', 'Lindgren LLC', '133', '7', '2', '69290', '9394 Linden Circle', '29', '18.96', '446.76', '469.42', '58.29', '2018-02-05 00:00:00', '2018-03-19 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('739', 'Zamit', 'HX-79751', 'Apparatus', '5', '392.31', 'Bacitracin', 'Mazda6', 'Moen-Murphy', '133', '7', '3', '52123', '6224 Manufacturers Terrace', '26', '23.35', '191.94', '149.15', '185.57', '2018-02-06 00:00:00', '2018-03-02 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('740', 'Regrant', 'VX-85650', 'Work Tools', '32', '280.38', 'NITROGEN', 'C8', 'Casper-Stroman', '133', '7', '6', '26284', '02 Rockefeller Parkway', '27', '21.09', '443.70', '76.90', '53.08', '2018-02-21 00:00:00', '2018-03-01 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('741', 'Sonair', 'XX-79724', 'Gadget', '6', '564.50', 'Risperidone', 'Colt', 'Batz, McClure and Runolfsdottir', '133', '7', '3', '29398', '38135 Oneill Street', '12', '28.73', '119.00', '282.48', '126.46', '2018-02-22 00:00:00', '2018-03-23 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('742', 'Fixflex', 'TR-78792', 'Gadget', '40', '388.73', 'RX200 Foaming Instant Hand Sanitizer', 'Landaulet', 'Effertz LLC', '133', '7', '4', '84455', '1125 Elmside Crossing', '62', '26.26', '47.64', '224.86', '93.69', '2018-02-21 00:00:00', '2018-03-30 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('743', 'Asoka', 'AC-06300', 'Apparatus', '64', '13.15', 'Nettle', 'Sonata', 'Klocko and Sons', '133', '7', '5', '40794', '3 Cascade Alley', '92', '25.42', '244.60', '486.90', '331.76', '2018-02-25 00:00:00', '2018-03-18 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('744', 'Konklux', 'JU-28979', 'Gadget', '96', '579.79', 'Pioglitazone', 'GTO', 'Casper Group', '133', '7', '2', '36493', '3 Portage Plaza', '73', '27.05', '299.04', '206.44', '292.83', '2018-02-09 00:00:00', '2018-03-15 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('745', 'Fix San', 'NR-28189', 'Work Tools', '27', '733.27', 'Zetia', 'Mustang', 'Gleason, MacGyver and Konopelski', '133', '7', '2', '84375', '34847 Bunting Pass', '87', '8.15', '283.40', '180.77', '342.85', '2018-02-12 00:00:00', '2018-03-23 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('746', 'Toughjoyfax', 'SA-54976', 'Hybrid', '95', '146.60', 'Phendimetrazine Tartrate', 'Cirrus', 'Harris-Schumm', '133', '7', '4', '58333', '819 Clyde Gallagher Court', '87', '19.39', '444.39', '329.40', '476.63', '2018-02-11 00:00:00', '2018-03-07 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('747', 'Namfix', 'MI-27728', 'Household', '69', '814.62', 'NoHist LQ', 'Journey', 'Blick-McDermott', '133', '7', '6', '31451', '0 Armistice Terrace', '09', '8.37', '144.28', '5.26', '266.81', '2018-02-08 00:00:00', '2018-03-25 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('748', 'Bitwolf', 'EY-41422', 'Hybrid', '63', '869.29', 'Nystatin and Triamcinolone', 'G6', 'Cremin-Stracke', '133', '7', '6', '87796', '7 Briar Crest Plaza', '13', '8.07', '184.91', '246.56', '428.80', '2018-02-26 00:00:00', '2018-03-20 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('749', 'Ventosanzap', 'DM-73741', 'Work Tools', '98', '555.25', 'Escitalopram Oxalate', 'XF', 'Dach, Johns and Smith', '133', '7', '3', '87278', '21759 Nevada Drive', '43', '22.74', '327.66', '434.62', '345.92', '2018-02-14 00:00:00', '2018-03-11 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('750', 'Domainer', 'SZ-25164', 'Apparatus', '44', '227.18', 'Badger Unscented SPF 30 Sunscreen', 'Z4', 'Murphy, Tremblay and Jaskolski', '133', '7', '4', '17624', '58573 Reinke Way', '88', '7.88', '314.65', '129.91', '133.45', '2018-02-26 00:00:00', '2018-03-29 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('751', 'Bigtax', 'PK-10597', 'Apparatus', '23', '612.88', 'Speed Stick', '940', 'Kautzer, Williamson and Fisher', '133', '7', '2', '80638', '24018 Calypso Lane', '57', '12.61', '399.98', '363.39', '249.70', '2018-02-04 00:00:00', '2018-03-23 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('752', 'Konklab', 'AJ-78723', 'Work Tools', '96', '707.42', 'Dronabinol', 'PT Cruiser', 'Hessel, Krajcik and Renner', '133', '7', '2', '27010', '2 Fulton Point', '58', '11.91', '338.70', '304.23', '246.19', '2018-02-27 00:00:00', '2018-03-30 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('753', 'Konklab', 'DE-63725', 'Apparatus', '10', '693.21', 'Triamcinolone Acetonide', 'Equinox', 'Huels Inc', '133', '7', '6', '98070', '1211 Kinsman Pass', '67', '20.95', '345.32', '319.18', '357.48', '2018-02-13 00:00:00', '2018-03-08 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('754', 'Voyatouch', 'DD-63266', 'Work Tools', '60', '664.18', 'RUTIN', 'Accent', 'Mraz-O\'Connell', '133', '7', '2', '26431', '87366 Armistice Circle', '73', '5.37', '123.45', '17.45', '460.42', '2018-02-13 00:00:00', '2018-03-24 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('755', 'Zoolab', 'KE-01771', 'Hybrid', '27', '108.50', 'Peptic Relief', 'Safari', 'Yundt and Sons', '133', '7', '4', '25473', '42538 Merchant Plaza', '74', '17.97', '330.10', '349.69', '39.55', '2018-02-08 00:00:00', '2018-03-18 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('756', 'Opela', 'WU-50128', 'Work Tools', '53', '438.95', 'Duck Meat', 'Escalade', 'Bailey-Jones', '133', '7', '4', '55768', '58082 Schiller Pass', '71', '25.98', '47.48', '473.36', '396.60', '2018-02-12 00:00:00', '2018-03-02 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('757', 'Namfix', 'JH-29207', 'Work Tools', '27', '697.32', 'Levothyroxine Sodium', 'LS', 'Hessel, Rau and Marvin', '133', '7', '6', '59573', '79 Macpherson Park', '66', '16.71', '338.75', '303.48', '15.23', '2018-02-23 00:00:00', '2018-03-13 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('758', 'Bitchip', 'AM-20185', 'Household', '8', '141.74', 'Betadine', 'MR2', 'Greenfelder Inc', '133', '7', '3', '91400', '8 Russell Street', '44', '22.84', '362.89', '12.87', '145.36', '2018-02-03 00:00:00', '2018-03-22 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('759', 'Andalax', 'JG-98316', 'Gadget', '52', '558.69', 'Excedrin', 'LX', 'Keeling, Stiedemann and Breitenberg', '133', '7', '5', '85438', '71567 Burrows Pass', '18', '13.90', '211.83', '384.76', '184.08', '2018-02-22 00:00:00', '2018-03-18 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('760', 'Alphazap', 'UU-39003', 'Work Tools', '68', '933.74', 'ZOVIRAX', 'Ram 3500', 'McDermott, Schuster and Hudson', '133', '7', '2', '7905', '7 Debs Place', '04', '9.10', '38.29', '261.57', '127.95', '2018-02-22 00:00:00', '2018-03-09 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('761', 'Sonsing', 'NL-73341', 'Hybrid', '50', '654.78', 'Neuralgia Numbness', 'Avalanche 1500', 'Heller-Deckow', '133', '7', '4', '41384', '4 Linden Circle', '79', '25.61', '351.11', '206.44', '197.77', '2018-02-09 00:00:00', '2018-03-11 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('762', 'Zontrax', 'ML-61202', 'Hybrid', '89', '461.45', 'Captopril', 'Diamante', 'Hickle Inc', '133', '7', '3', '997', '75 5th Court', '40', '5.47', '27.64', '331.50', '148.25', '2018-02-08 00:00:00', '2018-03-17 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('763', 'Zontrax', 'HQ-26832', 'Gadget', '38', '104.34', 'Bupropion Hydrochloride', 'Ram 3500', 'Stoltenberg Group', '133', '7', '4', '48497', '756 Bartillon Circle', '47', '10.37', '443.14', '75.15', '171.96', '2018-02-12 00:00:00', '2018-03-04 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('764', 'Trippledex', 'CQ-46803', 'Gadget', '63', '341.81', 'Amoxicillin and Clavulanate Potassium', 'S-Class', 'Kiehn, Hoeger and Rempel', '133', '7', '2', '20916', '7421 3rd Drive', '68', '5.26', '238.61', '473.75', '191.52', '2018-02-15 00:00:00', '2018-03-15 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('765', 'Asoka', 'TI-52281', 'Gadget', '53', '807.42', 'SyCircue', 'Bonneville', 'Schamberger Group', '133', '7', '3', '73441', '01 Rowland Way', '64', '14.10', '95.26', '342.52', '12.01', '2018-02-18 00:00:00', '2018-03-25 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('766', 'Pannier', 'YD-08666', 'Gadget', '42', '979.95', 'Isoniazid', 'MR2', 'Emmerich, Feil and Hoppe', '133', '7', '5', '51222', '74485 Randy Lane', '83', '14.15', '376.44', '212.77', '145.36', '2018-02-17 00:00:00', '2018-03-16 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('767', 'Fix San', 'BK-11797', 'Apparatus', '91', '727.20', 'Duck Feathers', 'Continental', 'Metz-Schultz', '133', '7', '4', '98628', '21684 Sloan Court', '74', '6.73', '214.38', '295.15', '404.17', '2018-02-14 00:00:00', '2018-03-25 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('768', 'Matsoft', 'KV-47758', 'Gadget', '19', '513.07', 'MESNEX', 'TrailBlazer', 'Morissette-Willms', '133', '7', '5', '48913', '124 Glendale Circle', '30', '17.62', '242.43', '144.04', '250.99', '2018-02-04 00:00:00', '2018-03-05 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('769', 'Cookley', 'RX-03035', 'Hybrid', '40', '102.99', 'Sun Blossom Antibacterial Foaming Hand Wash', 'MX-5', 'Muller-Cole', '133', '7', '5', '69372', '36 Northfield Circle', '62', '12.20', '456.62', '98.88', '31.34', '2018-02-11 00:00:00', '2018-03-11 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('770', 'Ronstring', 'FS-77560', 'Apparatus', '65', '776.71', 'Minocin', 'Murano', 'Mraz Group', '133', '7', '5', '81401', '381 Atwood Place', '82', '11.58', '111.71', '209.52', '13.07', '2018-02-18 00:00:00', '2018-03-17 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('771', 'It', 'TW-43768', 'Work Tools', '70', '12.05', 'CINA', 'TSX', 'Williamson and Sons', '133', '7', '5', '73217', '76 Claremont Avenue', '13', '8.03', '58.04', '204.75', '216.56', '2018-02-18 00:00:00', '2018-03-03 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('772', 'Fintone', 'PT-57262', 'Household', '20', '546.19', 'Advanced Healing', 'Golf', 'Wehner, White and Howell', '133', '7', '3', '68775', '119 Leroy Parkway', '23', '5.48', '170.51', '356.21', '287.92', '2018-02-01 00:00:00', '2018-03-17 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('773', 'Ronstring', 'RM-79379', 'Gadget', '30', '146.58', 'Tussin Cough Long Acting', 'Tacoma Xtra', 'Skiles, Fay and Hoeger', '133', '7', '4', '34878', '83448 Charing Cross Road', '98', '14.95', '418.55', '97.91', '240.18', '2018-02-27 00:00:00', '2018-03-29 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('774', 'Duobam', 'II-86288', 'Gadget', '75', '395.43', 'Helium', 'Continental', 'Bashirian-Treutel', '133', '7', '2', '14209', '776 La Follette Street', '40', '19.98', '375.26', '449.72', '336.29', '2018-02-15 00:00:00', '2018-03-14 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('775', 'Duobam', 'VB-06016', 'Apparatus', '64', '250.90', 'CLARINS Skin Illusion SPF 10 Natural Radiance Foundation Tint 104', 'Corvette', 'Graham, Kiehn and Parisian', '133', '7', '4', '8824', '23 Sauthoff Road', '66', '24.19', '93.34', '354.33', '215.79', '2018-02-27 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('776', 'Sub-Ex', 'BI-15607', 'Gadget', '54', '579.02', 'Sardine', 'Type-1h', 'McDermott-Pacocha', '133', '7', '6', '28740', '23046 Michigan Trail', '19', '8.76', '398.65', '119.43', '281.93', '2018-02-27 00:00:00', '2018-03-28 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('777', 'Temp', 'SA-20633', 'Household', '23', '548.01', 'Docusate Sodium', 'Yaris', 'Jones, Ratke and Kunde', '133', '7', '4', '63269', '0566 Elka Hill', '64', '28.83', '422.90', '165.69', '132.20', '2018-02-11 00:00:00', '2018-03-25 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('778', 'Konklux', 'JU-08011', 'Work Tools', '86', '96.76', 'mint', 'Accord', 'McCullough Group', '133', '7', '6', '93208', '718 Welch Parkway', '40', '5.41', '103.49', '314.93', '15.51', '2018-02-05 00:00:00', '2018-03-22 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('779', 'Biodex', 'RS-27917', 'Hybrid', '50', '817.79', 'FOAMING HAND SANITIZER', 'T100', 'Schuppe and Sons', '133', '7', '6', '33064', '51030 Crescent Oaks Parkway', '93', '2.23', '87.38', '51.96', '348.85', '2018-02-11 00:00:00', '2018-03-18 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('780', 'Latlux', 'RB-72885', 'Gadget', '87', '131.22', 'PNV Ferrous Fumarate Docusate Folic Acid', 'G-Series 2500', 'Harber, Leffler and Yost', '133', '7', '5', '60623', '75022 Bayside Avenue', '22', '23.96', '312.73', '214.38', '380.91', '2018-02-10 00:00:00', '2018-03-17 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('781', 'Zoolab', 'AH-95122', 'Apparatus', '38', '541.51', 'Childrens Ibuprofen', 'Avalanche 1500', 'Turner-Sanford', '133', '7', '3', '36336', '13974 Kensington Lane', '04', '19.15', '253.22', '165.98', '1.77', '2018-02-21 00:00:00', '2018-03-02 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('782', 'Opela', 'XF-27715', 'Gadget', '87', '191.94', 'TREE ANTIGEN', 'Passat', 'Armstrong-Gottlieb', '133', '7', '3', '29417', '75 Meadow Valley Road', '39', '22.16', '210.97', '108.96', '487.85', '2018-02-13 00:00:00', '2018-03-18 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('783', 'Andalax', 'VS-49851', 'Gadget', '15', '825.22', 'equaline anti itch', 'MKS', 'Lang and Sons', '133', '7', '4', '75906', '0 Mockingbird Lane', '39', '20.17', '365.60', '339.19', '270.57', '2018-02-21 00:00:00', '2018-03-20 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('784', 'Alphazap', 'LR-86765', 'Household', '33', '137.39', 'Sumatriptan', 'Stratus', 'Franecki, Hodkiewicz and Runolfsson', '133', '7', '6', '82002', '922 Bartelt Court', '51', '19.97', '368.46', '335.38', '309.57', '2018-02-20 00:00:00', '2018-03-19 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('785', 'Konklux', 'HV-09429', 'Household', '39', '402.58', 'ONDANSETRON', 'Skyhawk', 'O\'Reilly, Ortiz and Oberbrunner', '133', '7', '5', '1049', '530 Vernon Trail', '26', '10.65', '496.86', '378.75', '172.21', '2018-02-05 00:00:00', '2018-03-09 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('786', 'Span', 'DL-33218', 'Gadget', '61', '430.99', 'povidine iodine', 'Thunderbird', 'Bosco-Kuvalis', '133', '7', '4', '71780', '55042 Esch Place', '06', '19.91', '349.13', '111.26', '155.85', '2018-02-26 00:00:00', '2018-03-12 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('787', 'Voltsillam', 'UM-13262', 'Apparatus', '68', '258.65', 'Caduet', 'Mark VIII', 'O\'Kon and Sons', '133', '7', '4', '44467', '1985 Twin Pines Plaza', '84', '20.99', '251.08', '34.11', '85.31', '2018-02-27 00:00:00', '2018-03-13 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('788', 'Andalax', 'WC-73553', 'Gadget', '29', '373.59', 'Plak Smacker', 'Grand Caravan', 'Tromp, Langworth and Greenholt', '133', '7', '6', '67301', '789 Green Road', '23', '10.50', '94.58', '132.01', '451.72', '2018-02-24 00:00:00', '2018-03-14 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('789', 'Flowdesk', 'TM-65442', 'Household', '94', '232.23', 'topcare antacid calcium', 'LeSabre', 'Lesch-Lind', '133', '7', '5', '94438', '18823 Mifflin Road', '30', '2.02', '148.75', '112.17', '316.26', '2018-02-10 00:00:00', '2018-03-17 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('790', 'Asoka', 'QZ-78263', 'Work Tools', '97', '790.19', 'LACHESIS MUTUS', 'Continental', 'Stracke, Nitzsche and Ferry', '133', '7', '6', '39877', '83166 Mallory Center', '05', '1.50', '117.77', '495.55', '84.72', '2018-02-10 00:00:00', '2018-03-16 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('791', 'Bitchip', 'CA-90115', 'Apparatus', '24', '93.67', 'Ulta Vanilla Sugar Anti-Bacterial Gentle Foaming', 'Avalanche 1500', 'Gleichner Inc', '133', '7', '6', '55563', '2 Colorado Hill', '10', '3.63', '140.33', '176.19', '119.96', '2018-02-10 00:00:00', '2018-03-18 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('792', 'Sonair', 'BS-99052', 'Household', '71', '824.19', 'Ciclopirox', 'Tacoma', 'Purdy-D\'Amore', '133', '7', '4', '58003', '8596 Aberg Park', '73', '29.17', '196.59', '483.20', '195.88', '2018-02-25 00:00:00', '2018-03-27 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('793', 'Flexidy', 'PG-68212', 'Work Tools', '0', '968.57', 'La Roche Posay Laboratoire Dermatologique Anthelios 60 Face Ultra Light Fluid Sunscreen Broad Spectrum SPF 60', 'Passport', 'Vandervort-McDermott', '133', '7', '5', '14159', '294 Grayhawk Place', '88', '4.20', '164.58', '447.81', '465.78', '2018-02-25 00:00:00', '2018-03-04 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('794', 'Sub-Ex', 'AD-05516', 'Apparatus', '31', '141.39', 'Naproxen', 'GX', 'Reinger-Fadel', '133', '7', '6', '26119', '91743 Heath Lane', '88', '9.49', '137.50', '334.70', '451.08', '2018-02-02 00:00:00', '2018-03-17 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('795', 'Alphazap', 'CQ-53757', 'Apparatus', '56', '397.78', 'Potassium Chloride in Dextrose', 'Silverado 1500', 'Rau LLC', '133', '7', '2', '62549', '3070 Golden Leaf Park', '58', '11.12', '469.46', '402.44', '335.57', '2018-02-17 00:00:00', '2018-03-25 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('796', 'Pannier', 'FI-02427', 'Hybrid', '49', '467.67', 'Baby Orajel Naturals', 'Grand Marquis', 'Rice-Mertz', '133', '7', '5', '86162', '59 David Junction', '51', '14.52', '26.57', '414.84', '369.36', '2018-02-12 00:00:00', '2018-03-10 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('797', 'Transcof', 'XN-24647', 'Household', '97', '74.99', 'TOPIRAMATE', 'Diamante', 'Heller, Bauch and Cummerata', '133', '7', '2', '9334', '38893 Old Gate Street', '77', '25.85', '94.09', '270.53', '291.92', '2018-02-25 00:00:00', '2018-03-18 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('798', 'Viva', 'XV-63083', 'Hybrid', '39', '726.90', 'Diphenhydramine Hydrochloride', 'Optima', 'Grimes, Haag and Johnson', '133', '7', '2', '33011', '43 Lakeland Trail', '90', '7.58', '110.22', '14.21', '150.48', '2018-02-01 00:00:00', '2018-03-19 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('799', 'Daltfresh', 'AV-87501', 'Hybrid', '33', '219.28', 'Pier 1 Imports Iced Cookie Anti-Bacterial Hand Sanitizer', 'Corrado', 'Nienow, Kuhn and Ruecker', '133', '7', '3', '29497', '2242 Golf Course Crossing', '68', '24.30', '10.88', '263.83', '433.97', '2018-02-02 00:00:00', '2018-03-06 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('800', 'Tin', 'JE-42665', 'Hybrid', '74', '597.23', 'PERIPLANETA AMERICANA', 'Impreza', 'O\'Hara-Purdy', '133', '7', '2', '2462', '885 Melody Plaza', '31', '6.47', '475.68', '181.61', '239.12', '2018-02-13 00:00:00', '2018-03-07 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('801', 'Flexidy', 'GQ-28090', 'Work Tools', '65', '242.02', 'Levetiracetam', 'Expedition EL', 'O\'Keefe Group', '133', '7', '5', '60202', '9415 Randy Crossing', '43', '23.87', '356.53', '387.44', '295.43', '2018-02-27 00:00:00', '2018-03-21 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('802', 'Regrant', 'HM-37063', 'Household', '47', '471.68', 'Anti-Bacterial Hand', 'B-Series', 'Hirthe-Feest', '133', '7', '3', '34914', '04200 Talisman Way', '62', '16.00', '55.19', '386.57', '98.55', '2018-02-26 00:00:00', '2018-03-16 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('803', 'Bytecard', 'HS-79367', 'Gadget', '0', '53.95', 'Ropinirole Hydrochloride', '944', 'Dach Inc', '133', '7', '4', '15991', '4 Utah Place', '80', '5.38', '247.89', '482.78', '403.34', '2018-02-22 00:00:00', '2018-03-24 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('804', 'Opela', 'YS-37826', 'Household', '26', '348.67', 'No Drip Nasal Mist', 'M5', 'Satterfield-Crona', '133', '7', '5', '3120', '5 Briar Crest Trail', '38', '21.34', '319.70', '293.36', '2.04', '2018-02-07 00:00:00', '2018-03-18 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('805', 'Bigtax', 'CF-11244', 'Apparatus', '64', '989.80', 'Clarithromycin', 'Sebring', 'Schumm, Bins and Paucek', '133', '7', '4', '8370', '8327 Village Center', '38', '23.60', '233.52', '347.68', '194.86', '2018-02-23 00:00:00', '2018-03-08 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('806', 'Solarbreeze', 'VA-52046', 'Hybrid', '86', '478.46', 'SUPER ORIGIN CUSHION COMPLETE CONTROL', 'IS F', 'Bechtelar LLC', '133', '7', '2', '22791', '5 Pearson Circle', '89', '18.43', '122.14', '87.53', '363.47', '2018-02-19 00:00:00', '2018-03-13 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('807', 'Temp', 'TE-70967', 'Apparatus', '19', '219.59', 'CLARINS Skin Illusion SPF 10 Natural Radiance Foundation Tint 116.5', 'Catera', 'Goldner Inc', '133', '7', '3', '67863', '72823 Lindbergh Lane', '86', '1.42', '201.36', '183.78', '334.58', '2018-02-20 00:00:00', '2018-03-29 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('808', 'Lotlux', 'ON-74207', 'Gadget', '89', '818.90', 'Too Faced BB Creme Complete Coverage Make-Up', 'Century', 'Miller Group', '133', '7', '4', '49462', '139 Muir Court', '12', '11.87', '306.17', '40.07', '73.83', '2018-02-23 00:00:00', '2018-03-20 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('809', 'Transcof', 'RK-42294', 'Household', '35', '372.98', 'Morphine Sulfate Extended Release', 'Ram 1500', 'Will, Greenfelder and Kiehn', '133', '7', '3', '26255', '2 Hollow Ridge Avenue', '98', '20.94', '216.94', '337.22', '494.64', '2018-02-22 00:00:00', '2018-03-15 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('810', 'Zontrax', 'ZC-23234', 'Apparatus', '26', '708.55', 'Olanzapine', 'RL', 'Jenkins, Wiza and Bashirian', '133', '7', '6', '84335', '16 Waxwing Pass', '66', '7.08', '296.18', '279.29', '295.39', '2018-02-23 00:00:00', '2018-03-05 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('811', 'Sonsing', 'UL-82940', 'Household', '3', '372.60', 'PHARMACYS PRESCRIPTION', 'C70', 'Ondricka-Deckow', '133', '7', '5', '15386', '2896 Memorial Way', '49', '10.93', '247.47', '312.89', '71.41', '2018-02-07 00:00:00', '2018-03-27 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('812', 'Tin', 'SZ-83294', 'Work Tools', '53', '504.12', 'ARNISPORT', 'Miata MX-5', 'Donnelly-Grady', '133', '7', '5', '70539', '163 Stuart Way', '59', '7.00', '67.27', '179.21', '59.51', '2018-02-16 00:00:00', '2018-03-12 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('813', 'Y-find', 'HT-89000', 'Hybrid', '47', '253.23', 'Triple Antibiotic', 'MKZ', 'Deckow and Sons', '133', '7', '3', '8740', '6 Scofield Court', '44', '28.52', '190.18', '21.83', '396.51', '2018-02-11 00:00:00', '2018-03-29 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('814', 'Ronstring', 'XD-28460', 'Household', '19', '264.84', 'COCHLIOBOLUS SATIVUS', 'Intrigue', 'Schoen Group', '133', '7', '3', '29600', '2327 Upham Place', '15', '14.25', '72.66', '42.19', '1.64', '2018-02-02 00:00:00', '2018-03-09 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('815', 'Stringtough', 'RJ-65526', 'Gadget', '29', '175.55', 'RABEPRAZOLE SODIUM', 'Genesis', 'Block, Kuhic and Price', '133', '7', '2', '12658', '191 Mosinee Street', '64', '1.99', '232.08', '356.93', '183.40', '2018-02-17 00:00:00', '2018-03-15 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('816', 'Keylex', 'DS-57260', 'Apparatus', '24', '143.07', 'Brevibloc', 'Thunderbird', 'Ankunding-Rutherford', '133', '7', '6', '18768', '465 Alpine Terrace', '71', '10.95', '282.81', '27.02', '264.58', '2018-02-02 00:00:00', '2018-03-27 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('817', 'Y-Solowarm', 'CV-16702', 'Household', '89', '153.81', 'Minocycline hydrochloride', 'Yukon XL 2500', 'Wintheiser-Johnston', '133', '7', '4', '73980', '30 Cherokee Crossing', '18', '14.03', '196.14', '284.65', '310.01', '2018-02-08 00:00:00', '2018-03-19 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('818', 'Greenlam', 'MF-56872', 'Apparatus', '41', '742.76', 'NAPROXEN SODIUM', 'Frontier', 'Kunde-Senger', '133', '7', '3', '51055', '0 Myrtle Street', '73', '16.56', '170.69', '38.65', '241.01', '2018-02-05 00:00:00', '2018-03-03 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('819', 'Sonair', 'KA-13060', 'Apparatus', '37', '869.42', 'CTx4 Gel 1100', 'Yukon', 'Hermiston-Bergnaum', '133', '7', '4', '84864', '35262 Havey Trail', '54', '7.96', '145.66', '320.45', '82.39', '2018-02-07 00:00:00', '2018-03-22 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('820', 'Lotlux', 'YO-02560', 'Work Tools', '59', '497.66', 'Losartan Potassium', 'Voyager', 'Dooley Inc', '133', '7', '4', '33297', '7893 Sutteridge Terrace', '55', '21.70', '400.02', '409.45', '126.31', '2018-02-27 00:00:00', '2018-03-09 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('821', 'Ronstring', 'UC-20688', 'Gadget', '46', '826.18', 'UltraMax Invisible Solid', 'FX', 'Wintheiser, Renner and Hartmann', '133', '7', '2', '97650', '6078 Pond Way', '77', '26.89', '379.70', '42.48', '263.12', '2018-02-17 00:00:00', '2018-03-21 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('822', 'Zoolab', 'DA-57817', 'Gadget', '4', '787.25', 'losartan potassium and hydrochlorothiazide', 'XC70', 'Russel, Quigley and Dicki', '133', '7', '4', '72394', '607 Harper Circle', '78', '2.26', '323.75', '45.68', '427.34', '2018-02-04 00:00:00', '2018-03-10 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('823', 'Domainer', 'TA-94893', 'Apparatus', '15', '361.72', 'Apis Arnica', 'CTS-V', 'Jast LLC', '133', '7', '5', '25154', '167 Oak Valley Center', '98', '23.95', '234.65', '480.61', '94.52', '2018-02-19 00:00:00', '2018-03-30 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('824', 'Zontrax', 'EH-90440', 'Hybrid', '84', '977.77', 'Gabapentin', 'Malibu', 'Jerde-Raynor', '133', '7', '4', '1252', '9 Manley Park', '84', '24.31', '451.74', '399.24', '72.48', '2018-02-11 00:00:00', '2018-03-05 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('825', 'Bytecard', 'MN-92955', 'Hybrid', '84', '533.02', 'Hydrocodone Bitartrate and Acetaminophen', 'Sentra', 'Nolan, Sporer and Walker', '133', '7', '6', '43169', '8 Rockefeller Drive', '80', '13.88', '464.76', '496.34', '396.59', '2018-02-03 00:00:00', '2018-03-06 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('826', 'Bitchip', 'YZ-06014', 'Gadget', '15', '79.59', 'Doxycycline Hyclate', 'Accord', 'Bergstrom Inc', '133', '7', '6', '91692', '92 Melby Road', '81', '15.97', '100.59', '264.42', '343.23', '2018-02-10 00:00:00', '2018-03-07 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('827', 'Zaam-Dox', 'BJ-65498', 'Hybrid', '73', '871.36', 'Harvest Grape Antibacterial Foaming Hand Wash', 'Sable', 'Lesch-Morissette', '133', '7', '3', '81563', '5990 Rowland Point', '57', '22.17', '209.27', '384.76', '254.50', '2018-02-08 00:00:00', '2018-03-19 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('828', 'Matsoft', 'UU-91877', 'Apparatus', '84', '764.67', 'Super Sensitive Shield', 'A6', 'Kshlerin Inc', '133', '7', '4', '22403', '76 Sunbrook Place', '55', '11.25', '468.70', '462.21', '85.43', '2018-02-08 00:00:00', '2018-03-12 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('829', 'Stringtough', 'KX-01685', 'Work Tools', '48', '360.85', 'Therapentin-90', 'B-Series', 'Borer, Cummerata and Legros', '133', '7', '6', '14237', '1 4th Plaza', '21', '28.37', '106.47', '78.80', '463.77', '2018-02-09 00:00:00', '2018-03-29 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('830', 'Y-find', 'XO-27354', 'Household', '72', '723.42', 'Amlodipine Besylate and Benazepril Hydrochloride', 'Riviera', 'Conroy, Jones and Davis', '133', '7', '6', '48590', '5 Gateway Point', '66', '4.29', '343.80', '476.78', '52.28', '2018-02-07 00:00:00', '2018-03-22 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('831', 'Bytecard', 'ON-17955', 'Hybrid', '64', '203.06', 'Non-Drowsy Daytime Multi-Symptom Cold and Flu', 'Veracruz', 'Larkin, Grant and Williamson', '133', '7', '5', '68513', '7 Carey Circle', '03', '18.98', '275.33', '142.56', '390.02', '2018-02-20 00:00:00', '2018-03-21 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('832', 'Y-Solowarm', 'PU-22161', 'Hybrid', '6', '204.20', 'OXYGEN', 'Sportage', 'Heathcote-Muller', '133', '7', '2', '82051', '7 Northland Park', '94', '3.51', '378.58', '91.69', '405.41', '2018-02-13 00:00:00', '2018-03-10 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('833', 'Fixflex', 'WC-81836', 'Hybrid', '13', '968.98', 'Creamy Peach Antibacterial Foaming Hand Wash', 'LeSabre', 'Jacobson, Lakin and Bogan', '133', '7', '3', '17942', '5 Drewry Circle', '49', '14.84', '468.66', '84.65', '58.96', '2018-02-07 00:00:00', '2018-03-19 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('834', 'Overhold', 'NL-85010', 'Household', '88', '743.00', 'Pantoprazole', 'New Beetle', 'Dare, Harber and Tromp', '133', '7', '2', '67776', '3930 Badeau Way', '30', '18.06', '216.40', '353.87', '393.00', '2018-02-08 00:00:00', '2018-03-04 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('835', 'Bitchip', 'JI-51446', 'Gadget', '30', '576.42', 'Instant Hand Sanitizer Candy Apple', 'SL-Class', 'Gutmann, Rogahn and Ortiz', '133', '7', '4', '98288', '36451 Bay Lane', '18', '29.07', '106.30', '489.57', '319.51', '2018-02-25 00:00:00', '2018-03-18 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('836', 'Cardguard', 'XH-90182', 'Household', '17', '158.59', 'Epiphysis Plumbum', 'Seville', 'Schneider, Veum and Kohler', '133', '7', '2', '53264', '95638 Becker Hill', '50', '16.66', '37.13', '480.90', '357.42', '2018-02-15 00:00:00', '2018-03-28 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('837', 'Voltsillam', 'DZ-28488', 'Hybrid', '81', '984.47', 'Lisinopril', 'V50', 'Friesen, Dickinson and Schimmel', '133', '7', '4', '23733', '0440 Monterey Terrace', '78', '12.62', '465.39', '371.08', '398.48', '2018-02-23 00:00:00', '2018-03-03 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('838', 'Ronstring', 'HT-57044', 'Household', '68', '626.50', 'Coumarin', 'ES', 'Greenholt LLC', '133', '7', '6', '73856', '054 1st Center', '28', '8.04', '391.99', '255.85', '80.52', '2018-02-21 00:00:00', '2018-03-07 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('839', 'Treeflex', 'CG-57679', 'Hybrid', '99', '916.69', 'Losartan Potassium and Hydrochlorothiazide', 'Golf', 'Oberbrunner Group', '133', '7', '6', '28597', '8518 Commercial Circle', '30', '11.67', '336.14', '462.65', '174.10', '2018-02-05 00:00:00', '2018-03-04 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('840', 'Tres-Zap', 'ZJ-18783', 'Household', '5', '175.69', 'Allergy Relief', 'RX-7', 'Mertz-Hauck', '133', '7', '5', '65977', '599 Birchwood Lane', '25', '20.87', '429.32', '73.40', '186.96', '2018-02-21 00:00:00', '2018-03-06 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('841', 'Latlux', 'OU-20898', 'Household', '42', '522.96', 'Cefpodoxime Proxetil', '370Z', 'Doyle, Christiansen and Jakubowski', '133', '7', '3', '22025', '5 Manley Point', '65', '11.18', '64.23', '93.28', '30.25', '2018-02-23 00:00:00', '2018-03-05 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('842', 'Solarbreeze', 'BG-96523', 'Apparatus', '11', '391.76', 'ESIKA Silk Skin SPF 9', 'Ram 2500 Club', 'Casper, Feest and Lueilwitz', '133', '7', '2', '74424', '83 Westend Crossing', '62', '19.92', '466.56', '158.00', '358.23', '2018-02-15 00:00:00', '2018-03-22 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('843', 'Bitwolf', 'UK-10591', 'Apparatus', '0', '893.32', 'Carbidopa and Levodopa', 'Cayman', 'Lebsack Group', '133', '7', '6', '98353', '64 5th Terrace', '49', '8.41', '170.25', '359.23', '81.16', '2018-02-12 00:00:00', '2018-03-05 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('844', 'Gembucket', 'PN-92322', 'Work Tools', '10', '487.78', 'Sprayology SleepEase', 'Town & Country', 'Kiehn and Sons', '133', '7', '3', '57755', '341 Reindahl Road', '13', '4.44', '377.74', '385.25', '309.65', '2018-02-27 00:00:00', '2018-03-11 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('845', 'Sonsing', 'CT-29912', 'Work Tools', '80', '794.27', 'Neutrogena Healthy Skin Radiance', 'Topaz', 'Dickinson, Johnston and Carroll', '133', '7', '2', '7515', '28 Fordem Hill', '92', '24.81', '127.50', '65.38', '105.04', '2018-02-05 00:00:00', '2018-03-01 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('846', 'Subin', 'RW-97753', 'Apparatus', '24', '52.43', 'Lobelia Quercus', 'MDX', 'Stamm-Runolfsdottir', '133', '7', '5', '64639', '53 Westerfield Trail', '65', '8.45', '113.22', '327.28', '371.76', '2018-02-17 00:00:00', '2018-03-06 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('847', 'Duobam', 'OG-26028', 'Household', '65', '592.21', 'Femara', 'SLK-Class', 'Balistreri-Johns', '133', '7', '6', '32116', '7 New Castle Lane', '76', '22.52', '420.76', '409.79', '202.71', '2018-02-21 00:00:00', '2018-03-27 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('848', 'Quo Lux', 'XS-67352', 'Hybrid', '93', '446.92', 'Allergy Relief', 'Ram 1500', 'Funk-Kunde', '133', '7', '3', '35892', '919 Stoughton Center', '76', '13.77', '492.68', '195.48', '246.00', '2018-02-14 00:00:00', '2018-03-14 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('849', 'Overhold', 'ID-10843', 'Gadget', '90', '91.67', 'Levothyroxine Sodium', 'RX', 'Schmitt-Kuhn', '133', '7', '5', '64584', '1642 Mayfield Street', '96', '22.75', '9.90', '115.39', '370.80', '2018-02-03 00:00:00', '2018-03-03 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('850', 'Tin', 'GL-52025', 'Household', '90', '121.59', 'Curvularia inequalis', 'F250', 'Dooley-Heller', '133', '7', '2', '37771', '996 Golden Leaf Terrace', '30', '9.71', '400.60', '167.00', '221.19', '2018-02-22 00:00:00', '2018-03-12 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('851', 'Zaam-Dox', 'VQ-31724', 'Apparatus', '59', '406.99', 'Buprenorphine HCl and Naloxone HCl', 'Ram Wagon B350', 'Bahringer-Kuhlman', '133', '7', '3', '53075', '546 Sachs Lane', '85', '15.91', '265.77', '59.25', '171.35', '2018-02-21 00:00:00', '2018-03-11 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('852', 'Quo Lux', 'PI-51720', 'Gadget', '69', '696.54', 'Lovenox', 'Tribute', 'Bergnaum, Kuphal and Feil', '133', '7', '5', '8705', '98 Westridge Terrace', '74', '24.11', '103.07', '31.19', '268.05', '2018-02-14 00:00:00', '2018-03-18 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('853', 'Zaam-Dox', 'WY-51844', 'Work Tools', '21', '457.80', 'Nighttime Sleep Aid', 'Continental GTC', 'Doyle, Grant and Nolan', '133', '7', '3', '16092', '07101 Nelson Plaza', '68', '29.97', '289.75', '260.06', '57.74', '2018-02-23 00:00:00', '2018-03-11 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('854', 'Gembucket', 'FJ-11455', 'Apparatus', '39', '833.89', 'Teflaro', 'Continental', 'Fahey-Kub', '133', '7', '5', '99116', '41076 Arrowood Point', '32', '2.39', '364.17', '32.71', '346.92', '2018-02-07 00:00:00', '2018-03-16 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('855', 'Veribet', 'II-96307', 'Household', '84', '270.25', 'FEXOFENADINE HYDROCHLORIDE', 'LeBaron', 'Jast, Gleason and Reinger', '133', '7', '3', '19572', '9660 Buhler Avenue', '30', '15.66', '461.93', '200.42', '128.25', '2018-02-25 00:00:00', '2018-03-03 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('856', 'Gembucket', 'RZ-13770', 'Apparatus', '43', '269.55', 'CVS Scalp Relief', 'V40', 'Casper, Abbott and Ruecker', '133', '7', '4', '37843', '1822 Lyons Pass', '78', '5.75', '262.32', '57.24', '66.34', '2018-02-24 00:00:00', '2018-03-05 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('857', 'Voltsillam', 'EM-11825', 'Gadget', '15', '367.88', 'TRAMADOL HYDROCHLORIDE AND ACETAMINOPHEN', 'Durango', 'Kemmer, Dooley and Stokes', '133', '7', '2', '21692', '177 Di Loreto Place', '08', '19.67', '191.26', '84.03', '192.18', '2018-02-05 00:00:00', '2018-03-25 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('858', 'Zamit', 'JP-39540', 'Apparatus', '63', '920.18', 'SunZone Baby Sunscreen SPF-60', 'Sentra', 'Rohan Group', '133', '7', '5', '30015', '15108 Lake View Plaza', '01', '11.66', '391.72', '178.10', '200.67', '2018-02-27 00:00:00', '2018-03-15 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('859', 'Zamit', 'CF-49728', 'Household', '33', '953.49', 'Lovenox', 'F150', 'Bernhard-Emard', '133', '7', '3', '83847', '23 South Crossing', '92', '24.91', '155.23', '149.32', '378.34', '2018-02-07 00:00:00', '2018-03-06 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('860', 'Zontrax', 'AT-56160', 'Hybrid', '44', '462.01', 'Oxalis Belladonna', 'Sierra', 'Jerde-Lang', '133', '7', '5', '6462', '9143 Warbler Terrace', '59', '17.89', '166.27', '399.39', '493.36', '2018-02-23 00:00:00', '2018-03-09 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('861', 'Zaam-Dox', 'RD-32321', 'Gadget', '39', '589.92', 'Clonazepam', 'Econoline E250', 'Ledner, Ernser and Tromp', '133', '7', '2', '99333', '8 Pond Junction', '35', '8.65', '354.17', '443.94', '259.22', '2018-02-15 00:00:00', '2018-03-21 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('862', 'Regrant', 'NL-61437', 'Apparatus', '38', '250.68', 'CLARINS HydraQuench Normal to Combination Skin Broad Spectrum SPF 15 Sunscreen', 'RS4', 'McKenzie Group', '133', '7', '4', '32912', '8620 Jenna Park', '03', '26.36', '201.21', '211.31', '433.33', '2018-02-27 00:00:00', '2018-03-13 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('863', 'Flexidy', 'SH-46754', 'Apparatus', '39', '642.60', 'Gas Relief', 'F150', 'Schneider and Sons', '133', '7', '4', '90658', '4 Green Ridge Point', '63', '11.07', '329.59', '318.98', '140.31', '2018-02-02 00:00:00', '2018-03-27 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('864', 'Cardify', 'JY-18587', 'Apparatus', '57', '517.74', 'Sinus Congestion PE', 'DeVille', 'Runolfsdottir and Sons', '133', '7', '4', '2298', '98 Sundown Circle', '59', '17.81', '482.31', '420.10', '95.97', '2018-02-04 00:00:00', '2018-03-04 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('865', 'Y-Solowarm', 'WE-94272', 'Hybrid', '57', '535.23', 'Carvedilol', 'Ram 1500 Club', 'Weissnat, Crona and Fay', '133', '7', '2', '62721', '4 Macpherson Road', '59', '3.52', '302.37', '443.13', '13.52', '2018-02-04 00:00:00', '2018-03-24 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('866', 'Voltsillam', 'HF-56588', 'Work Tools', '14', '750.06', 'DROXIA', 'Legend', 'Gerlach-Leffler', '133', '7', '3', '80809', '20 Pleasure Way', '58', '10.77', '419.55', '314.60', '29.23', '2018-02-24 00:00:00', '2018-03-25 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('867', 'Mat Lam Tam', 'VI-96033', 'Hybrid', '44', '846.33', 'Methotrexate Sodium', 'Golf III', 'Mann-Jacobi', '133', '7', '4', '65075', '1231 Nobel Terrace', '05', '5.24', '60.34', '186.18', '268.93', '2018-02-25 00:00:00', '2018-03-02 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('868', 'Temp', 'IT-18991', 'Work Tools', '40', '976.66', 'Griseofulvin', 'ES', 'Sipes-Rodriguez', '133', '7', '6', '34486', '8228 Crowley Road', '51', '10.77', '367.59', '195.25', '164.25', '2018-02-04 00:00:00', '2018-03-01 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('869', 'Subin', 'ZK-58264', 'Gadget', '75', '318.94', 'SelectHealth Tussin DM', 'Accent', 'Mueller Inc', '133', '7', '3', '15411', '51 Bluestem Street', '08', '10.84', '171.32', '364.14', '214.21', '2018-02-05 00:00:00', '2018-03-11 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('870', 'Rank', 'BH-61291', 'Apparatus', '63', '896.06', 'Buspirone HCl', 'Rogue', 'Kub, Stark and Morissette', '133', '7', '3', '73457', '74 Sunfield Parkway', '48', '6.00', '451.85', '480.74', '59.03', '2018-02-23 00:00:00', '2018-03-08 00:00:00', '2018-04-19 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('871', 'Treeflex', 'XC-59270', 'Apparatus', '57', '927.08', 'Oxycodone and Acetaminophen', 'SL-Class', 'Frami, Smith and Wehner', '133', '7', '2', '96583', '09 Washington Crossing', '58', '28.80', '43.63', '273.63', '337.95', '2018-02-24 00:00:00', '2018-03-03 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('872', 'Stronghold', 'WH-48507', 'Apparatus', '40', '576.19', 'Insects (whole body) cockroach mix', 'M3', 'Stark-Pacocha', '133', '7', '6', '79282', '6 Forest Road', '68', '24.91', '287.20', '455.73', '85.55', '2018-02-09 00:00:00', '2018-03-06 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('873', 'Andalax', 'PF-59056', 'Gadget', '41', '726.71', 'Brewers Yeast', 'E-Class', 'Skiles Group', '133', '7', '5', '74777', '66923 Springview Avenue', '11', '12.39', '310.08', '31.51', '128.86', '2018-02-15 00:00:00', '2018-03-11 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('874', 'Bigtax', 'CK-98509', 'Hybrid', '81', '893.48', 'METHOTREXATE', 'Riviera', 'Goldner-Heller', '133', '7', '4', '13071', '18 Lien Place', '42', '3.09', '127.38', '200.48', '126.98', '2018-02-02 00:00:00', '2018-03-22 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('875', 'Tres-Zap', 'MW-93941', 'Work Tools', '21', '508.81', 'berkley and jensen nicotine', 'Highlander', 'Kshlerin, Kozey and Kessler', '133', '7', '2', '16901', '2595 Mccormick Road', '54', '13.70', '184.40', '279.99', '208.22', '2018-02-20 00:00:00', '2018-03-27 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('876', 'Transcof', 'YW-34371', 'Household', '84', '627.51', 'Metaxalone', 'Venture', 'VonRueden-O\'Hara', '133', '7', '5', '16', '02 Delladonna Parkway', '02', '20.08', '96.59', '489.80', '326.97', '2018-02-20 00:00:00', '2018-03-15 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('877', 'Span', 'LT-14967', 'Household', '23', '108.25', 'Metoprolol Tartrate', 'F350', 'Nader-Cummings', '133', '7', '4', '76402', '18 Welch Point', '95', '22.51', '494.25', '247.65', '274.32', '2018-02-11 00:00:00', '2018-03-28 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('878', 'Lotlux', 'ZL-88551', 'Apparatus', '9', '459.92', 'Mirtazapine', 'F150', 'Torphy-Schmidt', '133', '7', '4', '91755', '9314 Fisk Park', '97', '17.14', '385.12', '50.77', '478.34', '2018-02-07 00:00:00', '2018-03-21 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('879', 'Bigtax', 'AQ-77487', 'Work Tools', '43', '276.49', 'Chloraseptic Warming Sore Throat', 'QX', 'Hirthe-Batz', '133', '7', '2', '15905', '793 Bowman Lane', '68', '17.92', '293.75', '21.22', '157.96', '2018-02-14 00:00:00', '2018-03-06 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('880', 'Cardify', 'JR-54364', 'Work Tools', '31', '168.89', 'Gerbil Epithelium', 'STS', 'Murazik, Berge and Grant', '133', '7', '4', '37108', '9 Vermont Terrace', '94', '1.01', '458.59', '376.61', '345.75', '2018-02-02 00:00:00', '2018-03-14 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('881', 'Fix San', 'WR-44702', 'Gadget', '59', '130.40', 'Blister Armour Anti-Friction', 'S10', 'Hammes LLC', '133', '7', '4', '49786', '85328 Erie Center', '79', '5.30', '313.48', '383.05', '150.58', '2018-02-04 00:00:00', '2018-03-07 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('882', 'Biodex', 'IN-08723', 'Household', '75', '365.46', 'Modafinil', 'Elise', 'Adams Inc', '133', '7', '2', '66945', '0 Hazelcrest Street', '87', '25.65', '491.27', '320.81', '477.31', '2018-02-17 00:00:00', '2018-03-08 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('883', 'Redhold', 'BW-69295', 'Household', '78', '311.41', 'wal tussin dm', 'Tribute', 'Hayes, Runte and Deckow', '133', '7', '3', '8340', '98652 Lighthouse Bay Plaza', '85', '27.07', '220.14', '226.02', '270.29', '2018-02-04 00:00:00', '2018-03-09 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('884', 'Flexidy', 'PJ-73654', 'Work Tools', '57', '919.93', 'Liver comp.', 'MX-6', 'O\'Keefe, Witting and Ziemann', '133', '7', '3', '49818', '9 Waywood Alley', '00', '18.65', '114.85', '71.83', '385.06', '2018-02-09 00:00:00', '2018-03-19 00:00:00', '2018-04-23 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('885', 'Zathin', 'DD-44422', 'Household', '37', '796.10', 'Rite Aid RENEWAL', 'Dynasty', 'Gerlach LLC', '133', '7', '4', '99922', '91 Menomonie Avenue', '64', '20.80', '41.45', '465.04', '185.05', '2018-02-05 00:00:00', '2018-03-18 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('886', 'Latlux', 'ZR-99458', 'Household', '80', '218.52', 'DELFLEX', 'Savana 1500', 'Runolfsson LLC', '133', '7', '5', '97525', '21867 Roth Junction', '14', '16.70', '218.60', '101.64', '350.10', '2018-02-04 00:00:00', '2018-03-08 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('887', 'Tres-Zap', 'KZ-47134', 'Apparatus', '11', '868.52', 'INFLUENZINUM', 'Truck', 'Boyle-Schamberger', '133', '7', '2', '28412', '916 Utah Road', '67', '18.39', '349.71', '26.86', '151.84', '2018-02-25 00:00:00', '2018-03-16 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('888', 'Voltsillam', 'FT-91670', 'Apparatus', '17', '734.33', 'Bio Wild Rose', 'S80', 'Lesch, Murphy and O\'Conner', '133', '7', '6', '95052', '23 Gateway Court', '67', '24.74', '124.91', '321.58', '439.79', '2018-02-23 00:00:00', '2018-03-19 00:00:00', '2018-04-13 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('889', 'Sonsing', 'NV-68135', 'Work Tools', '27', '934.67', 'Disney PRINCESS Antibacterial Hand Wipes', 'V40', 'Wolf Inc', '133', '7', '5', '20722', '7 Tony Pass', '15', '24.23', '452.73', '474.57', '12.15', '2018-02-18 00:00:00', '2018-03-05 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('890', 'Trippledex', 'ZB-48481', 'Work Tools', '33', '913.63', 'MK Povidone-Iodine Swabstick Sterile', 'TSX', 'Howe-Walter', '133', '7', '3', '55621', '5435 Merchant Drive', '96', '6.31', '168.63', '23.47', '396.15', '2018-02-12 00:00:00', '2018-03-04 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('891', 'Fixflex', 'PS-98056', 'Apparatus', '96', '883.87', 'Diltiazem Hydrochloride', '9000', 'Maggio Inc', '133', '7', '2', '62687', '891 Onsgard Hill', '10', '2.33', '72.53', '71.93', '449.79', '2018-02-27 00:00:00', '2018-03-11 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('892', 'Daltfresh', 'LE-77580', 'Hybrid', '28', '703.03', 'Clario Instant Hand Sanitizer', 'Aero 8', 'Romaguera-Thiel', '133', '7', '4', '55015', '74628 Jackson Parkway', '97', '21.62', '18.79', '469.55', '179.82', '2018-02-06 00:00:00', '2018-03-17 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('893', 'Stringtough', 'DJ-78732', 'Household', '38', '222.36', 'Lidocaine', '2500', 'Kuhn LLC', '133', '7', '5', '42991', '41 Erie Terrace', '10', '25.79', '52.87', '308.12', '446.00', '2018-02-22 00:00:00', '2018-03-22 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('894', 'Veribet', 'SM-81696', 'Gadget', '0', '582.35', 'Relief', 'M-Class', 'Baumbach Group', '133', '7', '2', '8564', '1 Straubel Alley', '30', '24.73', '332.11', '302.04', '482.65', '2018-02-23 00:00:00', '2018-03-21 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('895', 'Hatity', 'YW-47536', 'Work Tools', '63', '76.46', 'SOLIDAGO CANADENSIS POLLEN', 'XK', 'Davis Group', '133', '7', '4', '27755', '9425 Old Gate Drive', '35', '7.00', '432.87', '70.05', '139.79', '2018-02-21 00:00:00', '2018-03-08 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('896', 'Subin', 'WD-31606', 'Household', '7', '174.44', 'Oxcarbazepine', 'LeMans', 'Waelchi, Purdy and Purdy', '133', '7', '2', '59923', '8043 Jackson Drive', '29', '14.30', '424.48', '168.86', '347.78', '2018-02-08 00:00:00', '2018-03-17 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('897', 'Cardguard', 'LP-60533', 'Hybrid', '35', '844.17', 'LISINOPRIL AND HYDROCHLOROTHIAZIDE', 'MX-6', 'Metz, Wisoky and Corkery', '133', '7', '2', '222', '736 Packers Avenue', '04', '27.21', '113.71', '167.34', '53.98', '2018-02-10 00:00:00', '2018-03-01 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('898', 'Stim', 'OC-60840', 'Apparatus', '7', '917.94', 'Morphinum Muriaticum', 'Quattroporte', 'Runolfsdottir-Friesen', '133', '7', '5', '79128', '25 Westport Crossing', '64', '27.30', '79.91', '262.21', '371.93', '2018-02-09 00:00:00', '2018-03-19 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('899', 'Tres-Zap', 'ID-65226', 'Hybrid', '90', '128.14', 'Pro Advantage Fast Absorbing Perineal with Dimethicone Skin Protectant', 'Camaro', 'Brakus, Kautzer and Carroll', '133', '7', '5', '34391', '38165 Garrison Street', '98', '16.76', '224.88', '268.42', '153.85', '2018-02-27 00:00:00', '2018-03-30 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('900', 'Lotlux', 'XW-84219', 'Hybrid', '3', '638.99', 'Exforge', '6 Series', 'Christiansen-O\'Connell', '133', '7', '5', '52861', '19 Rockefeller Drive', '36', '24.77', '2.92', '297.05', '271.80', '2018-02-09 00:00:00', '2018-03-22 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('901', 'Solarbreeze', 'EU-23048', 'Work Tools', '65', '844.13', 'Lornamead', 'LaCrosse', 'Doyle-Cormier', '133', '7', '3', '24026', '4 Surrey Court', '55', '27.42', '215.52', '158.27', '334.51', '2018-02-08 00:00:00', '2018-03-26 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('902', 'Konklux', 'SL-02522', 'Hybrid', '79', '796.79', 'Loratadine', 'Sorento', 'Breitenberg-Brakus', '133', '7', '4', '18887', '2 Debs Pass', '64', '4.25', '60.63', '447.97', '222.84', '2018-02-02 00:00:00', '2018-03-16 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('903', 'Tin', 'FF-53060', 'Work Tools', '7', '756.00', 'Husky Instant Hand Sanitizer', 'Outback', 'Toy and Sons', '133', '7', '6', '16176', '2759 Fairview Terrace', '55', '1.78', '332.11', '317.26', '4.80', '2018-02-01 00:00:00', '2018-03-27 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('904', 'Hatity', 'XI-44986', 'Household', '81', '822.07', 'Voltaren', 'QX', 'Frami Group', '133', '7', '5', '3783', '07750 Old Shore Point', '29', '21.15', '42.68', '320.59', '173.23', '2018-02-08 00:00:00', '2018-03-20 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('905', 'Aerified', 'IB-88381', 'Hybrid', '39', '978.07', 'Robinul', 'Aspire', 'Heaney-Langosh', '133', '7', '6', '47983', '8 Moulton Crossing', '51', '11.93', '368.12', '223.36', '209.74', '2018-02-16 00:00:00', '2018-03-10 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('906', 'Lotlux', 'ZF-75475', 'Work Tools', '98', '642.62', 'Pussy Willow', 'Town Car', 'Bogisich and Sons', '133', '7', '6', '75785', '83 Truax Lane', '26', '22.59', '207.21', '364.98', '251.11', '2018-02-27 00:00:00', '2018-03-14 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('907', 'Matsoft', 'BO-74575', 'Gadget', '13', '483.89', 'Lorazepam', 'Fox', 'Jacobs, Jaskolski and Cremin', '133', '7', '6', '60583', '381 Memorial Hill', '76', '8.03', '133.11', '285.72', '426.66', '2018-02-24 00:00:00', '2018-03-09 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('908', 'Otcom', 'CE-58494', 'Hybrid', '36', '850.36', 'SINGULAIR', 'M', 'Russel, Cassin and Bahringer', '133', '7', '6', '3138', '56493 Talisman Hill', '16', '11.73', '189.87', '358.33', '319.19', '2018-02-26 00:00:00', '2018-03-04 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('909', 'Asoka', 'PA-47467', 'Household', '71', '388.67', 'Keystone Liquid Hand Sanitizer', 'Escalade', 'Leannon, Krajcik and Stanton', '133', '7', '2', '721', '0 Manley Road', '11', '12.45', '408.19', '78.48', '435.55', '2018-02-06 00:00:00', '2018-03-01 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('910', 'Namfix', 'NJ-31913', 'Hybrid', '48', '347.71', 'ReCreate Foundation', 'Express 2500', 'Boyer Group', '133', '7', '4', '24748', '36 Monica Avenue', '97', '2.16', '369.32', '140.16', '377.85', '2018-02-18 00:00:00', '2018-03-19 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('911', 'Alphazap', 'VJ-43133', 'Work Tools', '20', '463.00', 'Aloxi', 'Sentra', 'Schinner-Bogan', '133', '7', '6', '7571', '4 Cascade Alley', '71', '16.78', '100.67', '83.30', '152.27', '2018-02-20 00:00:00', '2018-03-02 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('912', 'Fintone', 'UY-62983', 'Apparatus', '79', '921.98', 'Betoptic S', 'Range Rover Sport', 'Larkin, Ernser and Walsh', '133', '7', '5', '20788', '62 International Place', '16', '21.59', '206.51', '112.22', '127.04', '2018-02-02 00:00:00', '2018-03-14 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('913', 'Prodder', 'BL-26515', 'Work Tools', '88', '177.04', 'Topcare Allergy Relief', 'Navigator', 'Abshire-Kemmer', '133', '7', '6', '95631', '714 Anzinger Lane', '43', '28.52', '178.25', '432.27', '336.00', '2018-02-20 00:00:00', '2018-03-23 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('914', 'Otcom', 'QQ-72539', 'Work Tools', '26', '475.99', 'Stribild', 'CR-V', 'O\'Hara and Sons', '133', '7', '6', '50416', '405 Talisman Road', '61', '27.25', '119.42', '274.74', '300.35', '2018-02-17 00:00:00', '2018-03-02 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('915', 'Y-Solowarm', 'MS-13220', 'Household', '27', '472.24', 'Triaminic Long Acting Cough', 'G', 'Weimann Group', '133', '7', '3', '8719', '6 Dwight Parkway', '22', '15.28', '475.98', '481.52', '333.88', '2018-02-07 00:00:00', '2018-03-16 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('916', 'Lotstring', 'WZ-38535', 'Work Tools', '57', '345.55', 'Triaminic', 'Sable', 'Lueilwitz-Mitchell', '133', '7', '3', '68368', '8 Heffernan Street', '67', '26.56', '100.41', '214.45', '435.46', '2018-02-16 00:00:00', '2018-03-08 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('917', 'Y-find', 'FP-42674', 'Apparatus', '87', '891.97', 'Divalproex Sodium', 'Familia', 'Rath, Von and Hartmann', '133', '7', '5', '14506', '44 Arapahoe Place', '94', '7.76', '325.87', '371.07', '244.19', '2018-02-13 00:00:00', '2018-03-06 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('918', 'Holdlamis', 'TS-37420', 'Work Tools', '88', '981.34', 'Ropinirole Hydrochloride', '3500', 'Ledner LLC', '133', '7', '5', '20441', '70 Golf View Junction', '65', '29.08', '125.97', '464.24', '259.38', '2018-02-11 00:00:00', '2018-03-11 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('919', 'Home Ing', 'KW-36092', 'Gadget', '22', '176.02', 'Topcare ibuprofen', 'Amanti', 'Smitham-Bogisich', '133', '7', '4', '54015', '3733 Grayhawk Center', '78', '19.10', '364.75', '299.18', '295.44', '2018-02-25 00:00:00', '2018-03-13 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('920', 'Y-find', 'TX-21628', 'Household', '34', '75.25', 'Mucus Relief', 'H3T', 'Kemmer, Klocko and Denesik', '133', '7', '2', '84902', '2814 Maple Wood Street', '40', '29.95', '198.84', '357.90', '114.13', '2018-02-19 00:00:00', '2018-03-27 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('921', 'Voyatouch', 'RO-74845', 'Apparatus', '79', '138.73', 'Clarins Advanced Extra-Firming Day', 'Aztek', 'Grimes Group', '133', '7', '6', '6367', '855 Di Loreto Lane', '15', '21.26', '362.49', '36.98', '85.17', '2018-02-15 00:00:00', '2018-03-19 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('922', 'Duobam', 'ZA-86990', 'Apparatus', '55', '506.69', 'Prednisone', 'F350', 'Gleason and Sons', '133', '7', '4', '6813', '5 Jay Lane', '48', '27.30', '425.30', '474.09', '269.19', '2018-02-02 00:00:00', '2018-03-05 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('923', 'Biodex', 'PS-83932', 'Gadget', '80', '18.45', 'ReCreate Foundation', 'Accord', 'Cartwright, Friesen and Schamberger', '133', '7', '5', '72982', '91656 Gerald Circle', '30', '27.89', '403.30', '148.34', '468.48', '2018-02-20 00:00:00', '2018-03-03 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('924', 'Keylex', 'XY-74250', 'Apparatus', '98', '176.87', 'Leader Sore throat', 'ES', 'Littel Inc', '133', '7', '6', '98446', '5017 Eagle Crest Place', '58', '14.78', '416.41', '56.97', '493.94', '2018-02-13 00:00:00', '2018-03-20 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('925', 'Domainer', 'YD-08424', 'Work Tools', '39', '536.93', 'AAPE Skin Ampoule', 'XL-7', 'Wyman, Hermann and Wunsch', '133', '7', '6', '9057', '36 Melrose Place', '83', '24.42', '251.31', '367.36', '418.75', '2018-02-05 00:00:00', '2018-03-04 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('926', 'Zathin', 'BJ-46219', 'Gadget', '59', '172.56', 'RYMED', 'SLX', 'Kertzmann Inc', '133', '7', '2', '83719', '205 Washington Parkway', '95', '12.05', '99.88', '271.74', '239.37', '2018-02-06 00:00:00', '2018-03-10 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('927', 'Subin', 'PJ-01210', 'Hybrid', '51', '617.66', 'NASONEX', 'XL7', 'Bayer, Dooley and Smith', '133', '7', '6', '68702', '90473 Namekagon Drive', '08', '4.57', '73.56', '115.84', '224.35', '2018-02-26 00:00:00', '2018-03-18 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('928', 'Job', 'WO-70103', 'Household', '34', '402.81', 'athletes foot', 'Focus', 'Nader, Moore and Nikolaus', '133', '7', '5', '96251', '93 Hoard Circle', '02', '24.99', '299.85', '355.68', '343.48', '2018-02-05 00:00:00', '2018-03-11 00:00:00', '2018-04-15 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('929', 'Y-find', 'RJ-97700', 'Hybrid', '96', '700.27', 'Fosphenytoin Sodium', 'Bonneville', 'Oberbrunner-Buckridge', '133', '7', '6', '17286', '35 Packers Plaza', '81', '2.15', '365.27', '37.34', '184.94', '2018-02-05 00:00:00', '2018-03-19 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('930', 'Konklab', 'KL-30864', 'Household', '43', '890.16', 'Se-Tan DHA', 'SVX', 'Heidenreich-Ferry', '133', '7', '3', '94593', '778 Mesta Point', '44', '12.63', '294.21', '443.44', '126.45', '2018-02-01 00:00:00', '2018-03-29 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('931', 'Flowdesk', 'AV-38354', 'Hybrid', '67', '8.74', 'Prednisone', 'F-Series', 'Reynolds-Waelchi', '133', '7', '6', '26983', '79267 Mcguire Circle', '32', '9.74', '8.31', '468.64', '282.30', '2018-02-06 00:00:00', '2018-03-24 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('932', 'Domainer', 'ZJ-03590', 'Apparatus', '34', '70.70', 'Skin Effects by Dr. Jeffrey Dover Glycolic Day', 'Continental', 'Turner-Walter', '133', '7', '5', '21239', '2 Riverside Parkway', '34', '9.64', '437.13', '426.81', '305.17', '2018-02-08 00:00:00', '2018-03-09 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('933', 'Zoolab', 'XU-69738', 'Apparatus', '81', '26.84', 'Povidone-Iodine Prep Swabsticks', 'Suburban 1500', 'Sawayn-Stiedemann', '133', '7', '2', '16608', '9 Ramsey Circle', '93', '21.16', '139.41', '273.42', '168.44', '2018-02-03 00:00:00', '2018-03-05 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('934', 'It', 'CX-53074', 'Household', '32', '903.18', 'Dermoneen', '62', 'Murray, Reichel and Johnson', '133', '7', '6', '70889', '04485 Melrose Alley', '84', '7.20', '202.58', '488.70', '428.08', '2018-02-04 00:00:00', '2018-03-17 00:00:00', '2018-04-12 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('935', 'Bytecard', 'JZ-35618', 'Apparatus', '96', '75.89', 'Kinesys', 'Clubman', 'Monahan, Torp and Hauck', '133', '7', '3', '78480', '90596 Northport Circle', '68', '23.64', '444.61', '462.60', '173.57', '2018-02-12 00:00:00', '2018-03-23 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('936', 'Bytecard', 'HA-29963', 'Hybrid', '96', '174.87', 'Carvedilol', 'Continental Mark VII', 'McCullough Group', '133', '7', '5', '31781', '64 Eastwood Junction', '58', '29.43', '436.42', '489.95', '83.78', '2018-02-03 00:00:00', '2018-03-15 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('937', 'Cardguard', 'SY-70782', 'Apparatus', '11', '943.34', 'Halls', 'Ipsum', 'Doyle-Hettinger', '133', '7', '4', '50737', '216 Bunting Hill', '05', '11.03', '170.28', '486.40', '445.35', '2018-02-16 00:00:00', '2018-03-14 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('938', 'Aerified', 'XB-93017', 'Work Tools', '98', '421.08', 'Alendronate Sodium', 'Traverse', 'Johnson Inc', '133', '7', '3', '5563', '79223 Nelson Circle', '88', '5.13', '108.15', '265.40', '489.51', '2018-02-11 00:00:00', '2018-03-30 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('939', 'Stim', 'YG-18413', 'Gadget', '16', '568.06', 'Metformin Hydrochloride', 'LS', 'Grimes, Gerlach and Bahringer', '133', '7', '6', '89365', '96568 Warner Lane', '84', '23.42', '15.40', '458.75', '309.73', '2018-02-14 00:00:00', '2018-03-16 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('940', 'Y-find', 'MZ-17527', 'Work Tools', '27', '762.30', 'Sertraline Hydrochloride', '9-5', 'Gutkowski, Prohaska and Connelly', '133', '7', '4', '98904', '5 Di Loreto Road', '77', '6.33', '119.82', '291.40', '13.36', '2018-02-26 00:00:00', '2018-03-12 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('941', 'Solarbreeze', 'XO-86894', 'Hybrid', '24', '990.62', 'Carvedilol', 'Forester', 'Wisozk, Rath and DuBuque', '133', '7', '5', '32560', '4656 Westend Lane', '34', '2.47', '320.46', '380.26', '207.70', '2018-02-03 00:00:00', '2018-03-20 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('942', 'Keylex', 'DU-26224', 'Apparatus', '41', '507.82', 'Clindamycin hydrochloride', 'Probe', 'Cummings-Kris', '133', '7', '4', '44674', '50 Melvin Crossing', '65', '23.79', '497.83', '489.53', '446.00', '2018-02-11 00:00:00', '2018-03-28 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('943', 'Bamity', 'ZE-82679', 'Gadget', '62', '497.47', 'Flumazenil', 'Capri', 'Veum, Strosin and Schultz', '133', '7', '5', '21615', '4300 Roth Circle', '74', '13.95', '124.37', '116.45', '137.78', '2018-02-13 00:00:00', '2018-03-13 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('944', 'Zoolab', 'QH-62866', 'Apparatus', '99', '296.86', 'promethazine hydrochloride', 'Prius Plug-in', 'Murphy-Upton', '133', '7', '5', '44460', '1 Tennyson Drive', '44', '27.34', '490.10', '468.91', '385.68', '2018-02-19 00:00:00', '2018-03-22 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('945', 'Wrapsafe', 'PF-71385', 'Work Tools', '22', '48.42', 'Pollens - Weeds and Garden Plants, Lambs Quarters Chenopodium album', 'Endeavor', 'Medhurst Inc', '133', '7', '5', '9445', '8 Maple Drive', '96', '20.73', '162.98', '43.28', '68.84', '2018-02-22 00:00:00', '2018-03-30 00:00:00', '2018-04-24 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('946', 'Transcof', 'CO-93610', 'Work Tools', '15', '661.12', 'SNAIL RECOVER HEALER', 'MPV', 'Kessler-Wiegand', '133', '7', '4', '18248', '9046 Crownhardt Point', '77', '20.73', '276.46', '287.21', '332.35', '2018-02-15 00:00:00', '2018-03-19 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('947', 'Lotlux', 'SN-79068', 'Apparatus', '48', '986.27', 'Ranitidine Hydrochloride', '3500', 'Reichel Group', '133', '7', '4', '53076', '6452 Porter Drive', '73', '20.51', '397.80', '244.95', '308.57', '2018-02-27 00:00:00', '2018-03-07 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('948', 'Tres-Zap', 'IJ-81512', 'Work Tools', '2', '598.86', 'Fresh Picked Strawberries Anti Bacterial Foaming Hand', 'Continental', 'Senger-Weimann', '133', '7', '6', '70597', '8414 Porter Terrace', '62', '19.72', '239.60', '8.21', '335.81', '2018-02-20 00:00:00', '2018-03-25 00:00:00', '2018-04-18 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('949', 'Toughjoyfax', 'DK-21326', 'Apparatus', '52', '598.26', 'Escitalopram', 'CX-7', 'Collier Group', '133', '7', '4', '85833', '3 Anderson Junction', '41', '28.81', '160.29', '487.78', '157.69', '2018-02-23 00:00:00', '2018-03-13 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('950', 'Namfix', 'SP-60671', 'Gadget', '77', '917.67', 'Triamterene and Hydrochlorothiazide', 'Venture', 'Toy-Kemmer', '133', '7', '2', '47111', '5357 Dwight Center', '69', '9.15', '445.36', '287.15', '489.41', '2018-02-20 00:00:00', '2018-03-28 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('951', 'Cardguard', 'HZ-51914', 'Work Tools', '5', '267.64', 'Antibacterial Hand Sanitizer', 'Prius', 'Douglas-Jones', '133', '7', '5', '59531', '2 Harbort Terrace', '21', '13.66', '315.46', '237.25', '179.60', '2018-02-01 00:00:00', '2018-03-04 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('952', 'Zaam-Dox', 'GJ-04400', 'Gadget', '29', '971.42', 'Levofloxacin', 'Storm', 'Goldner, Abshire and Friesen', '133', '7', '3', '76525', '5 Corry Way', '27', '6.69', '418.57', '93.32', '27.97', '2018-02-27 00:00:00', '2018-03-17 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('953', 'Cookley', 'IF-86401', 'Gadget', '16', '372.98', 'Pier 1 Imports Ginger Peach Anti-Bacterial Hand Sanitizer', 'MX-5', 'Schmeler, Stamm and Simonis', '133', '7', '4', '26961', '9 Rockefeller Trail', '57', '3.51', '347.83', '342.39', '358.58', '2018-02-08 00:00:00', '2018-03-28 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('954', 'Job', 'MD-46476', 'Hybrid', '67', '652.17', 'Extreme Thyro pro', 'Savana', 'O\'Conner and Sons', '133', '7', '6', '90578', '405 Jenifer Place', '91', '29.95', '275.15', '382.50', '37.12', '2018-02-25 00:00:00', '2018-03-07 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('955', 'Zaam-Dox', 'WE-46200', 'Household', '31', '439.13', 'ULTRAM ER', 'Ram 2500', 'Aufderhar, Conn and Shanahan', '133', '7', '3', '59804', '300 Haas Street', '69', '12.81', '152.51', '144.67', '217.29', '2018-02-20 00:00:00', '2018-03-30 00:00:00', '2018-04-04 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('956', 'Alpha', 'MV-99025', 'Household', '85', '741.33', 'TAMSULOSIN HYDROCHLORIDE', 'Expedition', 'Bradtke Inc', '133', '7', '6', '36107', '54 Little Fleur Crossing', '04', '5.99', '9.47', '7.59', '445.86', '2018-02-03 00:00:00', '2018-03-28 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('957', 'Fintone', 'BN-66839', 'Gadget', '57', '402.98', 'Neutrogena Oil Free Moisture', 'TSX', 'Jaskolski and Sons', '133', '7', '5', '62914', '3249 Sutteridge Way', '32', '28.42', '245.11', '270.77', '237.34', '2018-02-22 00:00:00', '2018-03-01 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('958', 'Zathin', 'QD-27833', 'Work Tools', '96', '83.41', 'Paricalcitol', 'Savana 3500', 'Volkman LLC', '133', '7', '2', '84195', '5025 Macpherson Terrace', '76', '18.31', '224.87', '313.06', '236.58', '2018-02-05 00:00:00', '2018-03-10 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('959', 'Ronstring', 'WR-09601', 'Hybrid', '54', '180.88', 'Cortizone 10 Intensive Healing', 'Mazdaspeed6', 'Cormier, Kirlin and Wintheiser', '133', '7', '3', '21155', '5 Arizona Way', '13', '25.94', '105.97', '154.04', '88.87', '2018-02-20 00:00:00', '2018-03-13 00:00:00', '2018-04-08 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('960', 'Lotlux', 'EF-14888', 'Hybrid', '57', '585.67', 'AFCO 5512', 'Journey', 'Kessler, Thiel and Labadie', '133', '7', '5', '12355', '4912 Summit Park', '86', '12.10', '350.55', '225.98', '262.74', '2018-02-11 00:00:00', '2018-03-16 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('961', 'Zamit', 'OE-05051', 'Household', '93', '802.04', 'Amlodipine Besylate', 'Jimmy', 'Sporer, Farrell and Douglas', '133', '7', '6', '47341', '4 Bunker Hill Crossing', '89', '18.77', '362.61', '275.57', '341.61', '2018-02-04 00:00:00', '2018-03-20 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('962', 'Cardify', 'KJ-73949', 'Household', '76', '236.52', 'PROTECTOR Alcohol Prep Pad', 'Passat', 'Labadie, Bernier and Bode', '133', '7', '4', '39964', '29194 Riverside Terrace', '53', '18.87', '462.17', '303.29', '378.84', '2018-02-17 00:00:00', '2018-03-30 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('963', 'Treeflex', 'GD-82450', 'Work Tools', '84', '67.16', 'Cure-Aid Corn Plasters', 'F-Series', 'Deckow-Dickinson', '133', '7', '6', '18314', '90 Hoard Circle', '77', '3.54', '105.53', '313.81', '328.57', '2018-02-08 00:00:00', '2018-03-27 00:00:00', '2018-04-10 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('964', 'Trippledex', 'KM-05757', 'Household', '10', '990.41', 'Vytone', 'E250', 'Gleichner-Daniel', '133', '7', '6', '47154', '0737 Thackeray Trail', '84', '23.94', '424.48', '1.64', '84.17', '2018-02-04 00:00:00', '2018-03-06 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('965', 'Ronstring', 'HR-28915', 'Household', '2', '308.05', 'COZAAR', 'E-Class', 'Dickinson, Dietrich and Dooley', '133', '7', '4', '78435', '07 Leroy Lane', '36', '29.64', '337.36', '148.01', '123.58', '2018-02-21 00:00:00', '2018-03-03 00:00:00', '2018-04-11 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('966', 'Flexidy', 'VS-67741', 'Apparatus', '27', '725.99', 'Pravastatin Sodium', 'Sedona', 'Haag-Lindgren', '133', '7', '5', '79702', '46 Canary Plaza', '26', '24.00', '353.47', '332.44', '309.39', '2018-02-10 00:00:00', '2018-03-02 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('967', 'Tres-Zap', 'XS-85619', 'Hybrid', '88', '758.81', 'ORRIS ROOT', 'Oasis', 'Wunsch-Schoen', '133', '7', '6', '52828', '530 Manley Hill', '46', '8.87', '104.80', '479.22', '136.08', '2018-02-07 00:00:00', '2018-03-14 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('968', 'Holdlamis', 'JO-56625', 'Hybrid', '0', '473.22', 'Polymyxin B Sulfate and Trimethoprim', 'xA', 'Upton, Smith and Hilpert', '133', '7', '6', '16909', '2 Scofield Avenue', '45', '7.34', '365.17', '112.68', '197.57', '2018-02-02 00:00:00', '2018-03-04 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('969', 'Sonair', 'KQ-28588', 'Gadget', '13', '45.27', 'Hydrochlorothiazide', 'GTI', 'Strosin-Tremblay', '133', '7', '6', '4778', '0086 Oriole Parkway', '69', '9.69', '369.54', '144.62', '203.99', '2018-02-03 00:00:00', '2018-03-30 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('970', 'Solarbreeze', 'FH-60559', 'Apparatus', '76', '324.71', 'TODAYS HEALTH SINUS NASAL RELIEF', 'Rogue', 'Hessel-Windler', '133', '7', '5', '45879', '91808 Miller Point', '12', '16.69', '285.99', '101.84', '481.20', '2018-02-04 00:00:00', '2018-03-28 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('971', 'Tresom', 'ZD-17002', 'Household', '87', '9.92', 'Lavender Sap Patch', 'Terraza', 'Lemke-Walter', '133', '7', '6', '84955', '6303 Anniversary Court', '49', '6.95', '498.19', '170.19', '292.17', '2018-02-09 00:00:00', '2018-03-23 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('972', 'Andalax', 'WB-80551', 'Gadget', '25', '605.93', 'Ibuprofen', '400E', 'Kreiger, Bosco and Franecki', '133', '7', '6', '81249', '1740 Twin Pines Parkway', '45', '29.35', '493.90', '407.37', '25.26', '2018-02-17 00:00:00', '2018-03-23 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('973', 'Kanlam', 'WM-92648', 'Apparatus', '98', '14.22', 'Amoxicillin and Clavulanate Potassium', 'Comanche', 'Schinner Group', '133', '7', '4', '33973', '88 Mariners Cove Plaza', '10', '1.17', '145.13', '403.69', '81.32', '2018-02-27 00:00:00', '2018-03-01 00:00:00', '2018-04-09 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('974', 'Y-find', 'FD-07924', 'Gadget', '10', '489.89', 'Nix Complete Maximum Strength Lice Elimination', 'Fury', 'Klocko-Volkman', '133', '7', '4', '86167', '9 Westerfield Plaza', '64', '6.48', '71.18', '112.25', '77.84', '2018-02-06 00:00:00', '2018-03-19 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('975', 'Toughjoyfax', 'LO-45686', 'Work Tools', '17', '734.68', 'Glimepiride', 'LS Hybrid', 'Stracke LLC', '133', '7', '4', '49770', '948 Manufacturers Circle', '01', '19.95', '139.41', '157.85', '439.47', '2018-02-03 00:00:00', '2018-03-11 00:00:00', '2018-04-17 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('976', 'Namfix', 'IB-83946', 'Work Tools', '8', '408.74', 'Joint Rescue', 'Sierra 1500', 'Beier, Watsica and Dooley', '133', '7', '5', '3423', '39559 Algoma Crossing', '53', '24.25', '155.56', '379.23', '435.21', '2018-02-06 00:00:00', '2018-03-05 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('977', 'Latlux', 'KP-98068', 'Gadget', '94', '281.98', 'MAGNESIA PHOS', 'G8', 'Robel Inc', '133', '7', '6', '30857', '20593 Little Fleur Crossing', '36', '1.12', '479.12', '171.95', '490.54', '2018-02-25 00:00:00', '2018-03-03 00:00:00', '2018-04-16 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('978', 'Alphazap', 'JD-38617', 'Apparatus', '42', '201.57', 'Beefwood/Australian Pine', 'Forester', 'O\'Kon and Sons', '133', '7', '2', '45112', '68 Dunning Junction', '04', '21.91', '75.63', '352.75', '215.37', '2018-02-17 00:00:00', '2018-03-22 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('979', 'Zaam-Dox', 'OC-82399', 'Apparatus', '84', '968.17', 'La Roche-Posay Laboratoire Dermatologique Anthelios 45', 'Galant', 'Dickens and Sons', '133', '7', '4', '21263', '26787 Norway Maple Place', '65', '21.34', '331.64', '431.48', '296.01', '2018-02-04 00:00:00', '2018-03-11 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('980', 'Job', 'ZF-28950', 'Apparatus', '66', '516.72', 'Rice Grain', 'Explorer', 'Klocko, Medhurst and Larkin', '133', '7', '5', '32966', '79862 Bashford Pass', '03', '14.50', '355.54', '427.84', '363.13', '2018-02-25 00:00:00', '2018-03-13 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('981', 'Ronstring', 'RS-52954', 'Household', '89', '565.55', 'Cold Sores', '3000GT', 'Schinner Group', '133', '7', '4', '56294', '07662 Hauk Street', '13', '21.43', '116.39', '91.53', '208.38', '2018-02-03 00:00:00', '2018-03-22 00:00:00', '2018-04-02 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('982', 'Zaam-Dox', 'KA-24644', 'Work Tools', '42', '135.36', 'XtraCare Antibacterial Hand Cleanse', 'Murciélago', 'Bayer, Kassulke and Bergstrom', '133', '7', '5', '70304', '933 Golden Leaf Parkway', '62', '22.21', '143.31', '329.52', '476.01', '2018-02-17 00:00:00', '2018-03-20 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('983', 'Vagram', 'QH-37934', 'Work Tools', '42', '743.44', 'ULMUS AMERICANA POLLEN', 'Camaro', 'Fahey-Gleason', '133', '7', '3', '33248', '0 Dixon Plaza', '77', '1.26', '295.19', '237.36', '31.77', '2018-02-06 00:00:00', '2018-03-09 00:00:00', '2018-04-21 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('984', 'Span', 'XV-26237', 'Apparatus', '88', '133.91', 'English Walnut Pollen', 'Grand Prix', 'Schneider LLC', '133', '7', '4', '9903', '8 Pepper Wood Street', '96', '20.64', '421.26', '219.10', '419.41', '2018-02-22 00:00:00', '2018-03-26 00:00:00', '2018-04-05 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('985', 'Sonsing', 'TM-35932', 'Apparatus', '84', '65.13', 'Sulwhasoo', 'Silverado 3500', 'Kirlin Inc', '133', '7', '2', '99474', '2 Marquette Alley', '11', '25.63', '463.22', '301.21', '256.24', '2018-02-12 00:00:00', '2018-03-13 00:00:00', '2018-04-29 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('986', 'Cookley', 'BO-46725', 'Gadget', '37', '631.73', 'Paclitaxel', 'Express 3500', 'Oberbrunner Inc', '133', '7', '5', '55916', '886 Duke Circle', '19', '22.66', '248.13', '468.38', '469.35', '2018-02-09 00:00:00', '2018-03-10 00:00:00', '2018-04-20 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('987', 'Span', 'SI-04538', 'Gadget', '59', '594.05', 'FLUOXETINE', 'CR-X', 'Weimann-Smitham', '133', '7', '5', '66027', '8863 Eliot Lane', '41', '15.10', '287.53', '360.45', '5.46', '2018-02-16 00:00:00', '2018-03-01 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('988', 'Fintone', 'HB-25542', 'Work Tools', '3', '132.01', 'Warts - Moles - Skin Tags', 'Expo', 'Douglas-Hammes', '133', '7', '6', '37603', '29 Buena Vista Hill', '00', '6.77', '224.22', '297.59', '346.60', '2018-02-23 00:00:00', '2018-03-30 00:00:00', '2018-04-28 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('989', 'Aerified', 'ZA-83589', 'Household', '92', '93.14', 'Bio Heather', 'Protege', 'Keebler, Botsford and Waters', '133', '7', '3', '33471', '68327 Kropf Place', '77', '16.13', '77.87', '443.33', '420.36', '2018-02-04 00:00:00', '2018-03-11 00:00:00', '2018-04-25 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('990', 'Bamity', 'JT-91441', 'Gadget', '14', '568.24', 'Alendronate Sodium', 'XF', 'Walker Inc', '133', '7', '5', '76223', '30402 Browning Junction', '31', '20.62', '339.64', '108.58', '405.75', '2018-02-21 00:00:00', '2018-03-21 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('991', 'Prodder', 'JK-74275', 'Apparatus', '96', '313.78', 'Simply Saline', 'A8', 'Metz Inc', '133', '7', '4', '77534', '8 Welch Trail', '77', '7.34', '484.29', '485.51', '286.42', '2018-02-02 00:00:00', '2018-03-05 00:00:00', '2018-04-14 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('992', 'Opela', 'PT-31921', 'Household', '37', '692.85', 'DG Health Heartburn Relief', 'Outlander Sport', 'Kunze Group', '133', '7', '3', '32485', '88384 Goodland Parkway', '21', '6.56', '316.59', '278.54', '271.21', '2018-02-03 00:00:00', '2018-03-07 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('993', 'Sub-Ex', 'KY-09717', 'Household', '29', '210.74', 'Oxycodone Hydrochloride', 'Insight', 'Miller, Terry and Oberbrunner', '133', '7', '2', '90325', '48 Washington Circle', '88', '11.14', '418.25', '204.84', '77.19', '2018-02-12 00:00:00', '2018-03-24 00:00:00', '2018-04-06 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('994', 'Tresom', 'VC-82379', 'Household', '26', '426.03', 'Aurum Equisetum A', 'Explorer', 'Krajcik, Prosacco and Jaskolski', '133', '7', '6', '7189', '2891 Holy Cross Crossing', '38', '7.38', '481.73', '328.24', '85.17', '2018-02-02 00:00:00', '2018-03-14 00:00:00', '2018-04-01 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('995', 'Cookley', 'QQ-79568', 'Apparatus', '67', '192.23', 'Red Cedar', 'Pilot', 'Dickens, Nienow and Jast', '133', '7', '5', '17517', '546 Lunder Circle', '19', '7.77', '449.75', '327.96', '165.75', '2018-02-25 00:00:00', '2018-03-28 00:00:00', '2018-04-22 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('996', 'Aerified', 'UB-42775', 'Household', '65', '257.10', 'Colds Flu', 'V70', 'Howell, Fay and Swift', '133', '7', '4', '6423', '18497 Emmet Drive', '80', '11.12', '113.67', '392.44', '489.87', '2018-02-20 00:00:00', '2018-03-20 00:00:00', '2018-04-03 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('997', 'Domainer', 'XR-25234', 'Household', '35', '280.60', 'Doxazosin', '924 S', 'Glover, Kuhlman and Bergnaum', '133', '7', '5', '12162', '9053 Dawn Court', '97', '10.28', '218.44', '288.19', '171.50', '2018-02-19 00:00:00', '2018-03-21 00:00:00', '2018-04-27 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('998', 'Flexidy', 'OD-82710', 'Household', '2', '652.92', 'Atropine Sulfate', '300', 'Senger LLC', '133', '7', '4', '83840', '946 Monument Junction', '19', '1.90', '417.15', '179.80', '313.51', '2018-02-14 00:00:00', '2018-03-07 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '0');
INSERT INTO `item` VALUES ('999', 'Fintone', 'IB-41048', 'Apparatus', '36', '29.13', 'Methylprednisolone', 'Integra', 'Klocko, Buckridge and Armstrong', '133', '7', '4', '16044', '3047 Luster Terrace', '51', '27.50', '466.86', '28.74', '292.47', '2018-02-03 00:00:00', '2018-03-22 00:00:00', '2018-04-07 00:00:00', '2018-02-05 19:01:37', null, '1');
INSERT INTO `item` VALUES ('1000', 'Zontrax', 'QB-00607', 'Household', '82', '959.45', 'Burweed Marsh Elder', 'New Beetle', 'Welch, Cummings and Koss', '133', '7', '3', '89275', '530 Heffernan Alley', '90', '26.18', '70.39', '430.04', '54.51', '2018-02-19 00:00:00', '2018-03-30 00:00:00', '2018-04-26 00:00:00', '2018-02-05 19:01:37', null, '1');

-- ----------------------------
-- Table structure for kod_kawasan_telekom_malaysia
-- ----------------------------
DROP TABLE IF EXISTS `kod_kawasan_telekom_malaysia`;
CREATE TABLE `kod_kawasan_telekom_malaysia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kod_kawasan_no` varchar(11) DEFAULT NULL,
  `kod_kawasan_nama` varchar(255) DEFAULT NULL,
  `kod_kawasan_no_lama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of kod_kawasan_telekom_malaysia
-- ----------------------------
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('1', '0065', 'Republik Singapura', '+602');
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('2', '+603', 'Kuala Lumpur, Putrajaya, Selangor & Pahang (Genting Highland)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('3', '+604', 'Perlis, Kedah (kecuali Daerah Bandar Baharu), Pulau Pinang & Perak (Pengkalan Hulu)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('4', '+605', 'Perak, Pahang (Cameron Highlands) & Kedah (Daerah Bandar Baharu)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('5', '+606', 'Negeri Sembilan (kecuali Gemas), Melaka & Johor (Muar)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('6', '+607', 'Johor (kecuali Daerah Muar) & Negeri Sembilan (Gemas)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('7', '+6080', 'Negara Brunei Darussalam', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('8', '+6081', 'Akses domestik sahaja', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('9', '+6082', 'Sarawak (Kuching)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('10', '+6083', 'Sri Aman, Betong', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('11', '+6084', 'Bintangor, Kanowit, Kapit, Sarikei, Sibu, Song', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('12', '+6085', 'Lawas, Limbang, Miri', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('13', '+6086', 'Bintulu, Belaga', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('14', '+6087', 'Sabah (Daerah Pendalaman, & Labuan)', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('15', '+6088', 'Kota Kinabalu, Kudat', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('16', '+6089', 'Lahad Datu, Sandakan, Tawau', null);
INSERT INTO `kod_kawasan_telekom_malaysia` VALUES ('17', '+609', 'Kelantan, Pahang (kecuali Cameron Highlands, dan Genting Highland) & Terengganu', null);

-- ----------------------------
-- Table structure for master_daerah
-- ----------------------------
DROP TABLE IF EXISTS `master_daerah`;
CREATE TABLE `master_daerah` (
  `daerah_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `daerah_nama` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `negeri_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`daerah_id`),
  UNIQUE KEY `daerah_nama` (`daerah_nama`),
  KEY `state_id` (`negeri_id`),
  CONSTRAINT `master_daerah_ibfk_1` FOREIGN KEY (`negeri_id`) REFERENCES `master_negeri` (`negeri_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=971 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of master_daerah
-- ----------------------------
INSERT INTO `master_daerah` VALUES ('1', 'Kuala Lumpur', '14');
INSERT INTO `master_daerah` VALUES ('2', 'Petaling Jaya', '7');
INSERT INTO `master_daerah` VALUES ('3', 'Industrial Park,Shah Alam', '7');
INSERT INTO `master_daerah` VALUES ('4', 'Bandar Utama, Petaling Jaya', '7');
INSERT INTO `master_daerah` VALUES ('5', 'Subang Hitech Industrial Park, Shah Alam', '7');
INSERT INTO `master_daerah` VALUES ('6', 'Temasya Industrial Park, Shah Alam', '7');
INSERT INTO `master_daerah` VALUES ('7', '3 Persiaran Bandar Utama Petaling Jaya', '8');
INSERT INTO `master_daerah` VALUES ('8', 'Ind. Park, Shah Alam', '7');
INSERT INTO `master_daerah` VALUES ('9', 'Kuching', '11');
INSERT INTO `master_daerah` VALUES ('10', 'Tuaran', '12');
INSERT INTO `master_daerah` VALUES ('11', 'Kota Kinabalu', '12');
INSERT INTO `master_daerah` VALUES ('12', 'Tawau', '12');
INSERT INTO `master_daerah` VALUES ('13', 'Tambunan', '12');
INSERT INTO `master_daerah` VALUES ('14', 'Kota Belud', '12');
INSERT INTO `master_daerah` VALUES ('15', 'Sarikei', '11');
INSERT INTO `master_daerah` VALUES ('16', 'Miri', '11');
INSERT INTO `master_daerah` VALUES ('17', 'Sibu', '11');
INSERT INTO `master_daerah` VALUES ('18', 'Sandakan', '12');
INSERT INTO `master_daerah` VALUES ('19', 'Tenom', '12');
INSERT INTO `master_daerah` VALUES ('20', 'Penampang', '12');
INSERT INTO `master_daerah` VALUES ('21', 'Inanam', '12');
INSERT INTO `master_daerah` VALUES ('22', 'Papar', '12');
INSERT INTO `master_daerah` VALUES ('23', 'Kudat', '12');
INSERT INTO `master_daerah` VALUES ('24', 'Ayer Itam', '10');
INSERT INTO `master_daerah` VALUES ('25', 'Penang', '10');
INSERT INTO `master_daerah` VALUES ('26', 'Kuala Penyu', '12');
INSERT INTO `master_daerah` VALUES ('27', 'Johor Bahru', '1');
INSERT INTO `master_daerah` VALUES ('28', 'Masai', '1');
INSERT INTO `master_daerah` VALUES ('29', 'Muar', '1');
INSERT INTO `master_daerah` VALUES ('30', 'Subang Jaya', '7');
INSERT INTO `master_daerah` VALUES ('31', 'Shah Alam', '7');
INSERT INTO `master_daerah` VALUES ('32', 'Bangsar', '7');
INSERT INTO `master_daerah` VALUES ('33', 'Puchong', '7');
INSERT INTO `master_daerah` VALUES ('34', 'Kelang', '7');
INSERT INTO `master_daerah` VALUES ('35', 'Cheras', '7');
INSERT INTO `master_daerah` VALUES ('36', 'Damansara', '7');
INSERT INTO `master_daerah` VALUES ('37', 'Ampang Jaya', '7');
INSERT INTO `master_daerah` VALUES ('38', 'Kajang', '7');
INSERT INTO `master_daerah` VALUES ('39', 'Batu Caves', '7');
INSERT INTO `master_daerah` VALUES ('40', 'Rawang', '7');
INSERT INTO `master_daerah` VALUES ('41', 'Semenyih', '7');
INSERT INTO `master_daerah` VALUES ('42', 'Bangi', '7');
INSERT INTO `master_daerah` VALUES ('43', 'Kelana Jaya', '7');
INSERT INTO `master_daerah` VALUES ('44', 'Seri Kembangan', '7');
INSERT INTO `master_daerah` VALUES ('45', 'Alor Star', '2');
INSERT INTO `master_daerah` VALUES ('46', 'Bandar Melaka', '5');
INSERT INTO `master_daerah` VALUES ('47', 'Seremban', '6');
INSERT INTO `master_daerah` VALUES ('48', 'Rasah', '6');
INSERT INTO `master_daerah` VALUES ('49', 'Kuantan', '4');
INSERT INTO `master_daerah` VALUES ('50', 'Ipoh', '8');
INSERT INTO `master_daerah` VALUES ('51', 'Pasir Pinji', '8');
INSERT INTO `master_daerah` VALUES ('52', 'Arau', '9');
INSERT INTO `master_daerah` VALUES ('53', 'Kuala Perlis', '9');
INSERT INTO `master_daerah` VALUES ('54', 'Kuala Terengganu', '13');
INSERT INTO `master_daerah` VALUES ('55', 'Kota Bahru', '3');
INSERT INTO `master_daerah` VALUES ('56', 'Pasir Putih', '3');
INSERT INTO `master_daerah` VALUES ('57', 'Tanah Merah', '3');
INSERT INTO `master_daerah` VALUES ('58', 'Bachok', '3');
INSERT INTO `master_daerah` VALUES ('578', 'Batu Pahat', '1');
INSERT INTO `master_daerah` VALUES ('579', 'Kluang', '1');
INSERT INTO `master_daerah` VALUES ('580', 'Kulai', '1');
INSERT INTO `master_daerah` VALUES ('581', 'Kota Tinggi', '1');
INSERT INTO `master_daerah` VALUES ('582', 'Segamat', '1');
INSERT INTO `master_daerah` VALUES ('583', 'Pontian', '1');
INSERT INTO `master_daerah` VALUES ('584', 'Ayer Tawar 5', '1');
INSERT INTO `master_daerah` VALUES ('585', 'Mersing', '1');
INSERT INTO `master_daerah` VALUES ('586', 'Ayer Baloi', '1');
INSERT INTO `master_daerah` VALUES ('587', 'Ayer Hitam', '1');
INSERT INTO `master_daerah` VALUES ('588', 'Ayer Tawar 2', '1');
INSERT INTO `master_daerah` VALUES ('589', 'Ayer Tawar 3', '1');
INSERT INTO `master_daerah` VALUES ('590', 'Ayer Tawar 4', '1');
INSERT INTO `master_daerah` VALUES ('591', 'Bandar Penawar', '1');
INSERT INTO `master_daerah` VALUES ('592', 'Bandar Tenggara', '1');
INSERT INTO `master_daerah` VALUES ('593', 'Batu Anam', '1');
INSERT INTO `master_daerah` VALUES ('594', 'Bekok', '1');
INSERT INTO `master_daerah` VALUES ('595', 'Benut', '1');
INSERT INTO `master_daerah` VALUES ('596', 'Bukit Gambir', '1');
INSERT INTO `master_daerah` VALUES ('597', 'Bukit Pasir', '1');
INSERT INTO `master_daerah` VALUES ('598', 'Chaah', '1');
INSERT INTO `master_daerah` VALUES ('599', 'Endau', '1');
INSERT INTO `master_daerah` VALUES ('600', 'Gelang Patah', '1');
INSERT INTO `master_daerah` VALUES ('601', 'Gerisek', '1');
INSERT INTO `master_daerah` VALUES ('602', 'Gugusan Taib Andak', '1');
INSERT INTO `master_daerah` VALUES ('603', 'Jementah', '1');
INSERT INTO `master_daerah` VALUES ('604', 'Kahang', '1');
INSERT INTO `master_daerah` VALUES ('605', 'Kukup', '1');
INSERT INTO `master_daerah` VALUES ('606', 'Labis', '1');
INSERT INTO `master_daerah` VALUES ('607', 'Layang-Layang', '1');
INSERT INTO `master_daerah` VALUES ('608', 'Nusajaya', '1');
INSERT INTO `master_daerah` VALUES ('609', 'Pagoh', '1');
INSERT INTO `master_daerah` VALUES ('610', 'Paloh', '1');
INSERT INTO `master_daerah` VALUES ('611', 'Panchor', '1');
INSERT INTO `master_daerah` VALUES ('612', 'Parit Jawa', '1');
INSERT INTO `master_daerah` VALUES ('613', 'Parit Raja', '1');
INSERT INTO `master_daerah` VALUES ('614', 'Parit Sulong', '1');
INSERT INTO `master_daerah` VALUES ('615', 'Pasir Gudang', '1');
INSERT INTO `master_daerah` VALUES ('616', 'Pekan Nenas', '1');
INSERT INTO `master_daerah` VALUES ('617', 'Pengerang', '1');
INSERT INTO `master_daerah` VALUES ('618', 'Rengam', '1');
INSERT INTO `master_daerah` VALUES ('619', 'Rengit', '1');
INSERT INTO `master_daerah` VALUES ('620', 'Semerah', '1');
INSERT INTO `master_daerah` VALUES ('621', 'Senai', '1');
INSERT INTO `master_daerah` VALUES ('622', 'Senggarang', '1');
INSERT INTO `master_daerah` VALUES ('623', 'Seri Gading', '1');
INSERT INTO `master_daerah` VALUES ('624', 'Seri Medan', '1');
INSERT INTO `master_daerah` VALUES ('625', 'Simpang Rengam', '1');
INSERT INTO `master_daerah` VALUES ('626', 'Sungai Mati', '1');
INSERT INTO `master_daerah` VALUES ('627', 'Tangkak', '1');
INSERT INTO `master_daerah` VALUES ('628', 'Ulu Tiram', '1');
INSERT INTO `master_daerah` VALUES ('629', 'Alor Setar', '2');
INSERT INTO `master_daerah` VALUES ('630', 'Baling', '2');
INSERT INTO `master_daerah` VALUES ('631', 'Bandar Baharu', '2');
INSERT INTO `master_daerah` VALUES ('632', 'Bedong', '2');
INSERT INTO `master_daerah` VALUES ('633', 'Bukit Kayu Hitam', '2');
INSERT INTO `master_daerah` VALUES ('634', 'Changloon', '2');
INSERT INTO `master_daerah` VALUES ('635', 'Gurun', '2');
INSERT INTO `master_daerah` VALUES ('636', 'Jeniang', '2');
INSERT INTO `master_daerah` VALUES ('637', 'Jitra', '2');
INSERT INTO `master_daerah` VALUES ('638', 'Karangan', '2');
INSERT INTO `master_daerah` VALUES ('639', 'Kepala Batas', '2');
INSERT INTO `master_daerah` VALUES ('640', 'Kodiang', '2');
INSERT INTO `master_daerah` VALUES ('641', 'Kota Kuala Muda', '2');
INSERT INTO `master_daerah` VALUES ('642', 'Kota Sarang Semut', '2');
INSERT INTO `master_daerah` VALUES ('643', 'Kuala Kedah', '2');
INSERT INTO `master_daerah` VALUES ('644', 'Kuala Ketil', '2');
INSERT INTO `master_daerah` VALUES ('645', 'Kuala Nerang', '2');
INSERT INTO `master_daerah` VALUES ('646', 'Kuala Pegang', '2');
INSERT INTO `master_daerah` VALUES ('647', 'Kulim', '2');
INSERT INTO `master_daerah` VALUES ('648', 'Kupang', '2');
INSERT INTO `master_daerah` VALUES ('649', 'Langgar', '2');
INSERT INTO `master_daerah` VALUES ('650', 'Langkawi', '2');
INSERT INTO `master_daerah` VALUES ('651', 'Lunas', '2');
INSERT INTO `master_daerah` VALUES ('652', 'Merbok', '2');
INSERT INTO `master_daerah` VALUES ('653', 'Padang Serai', '2');
INSERT INTO `master_daerah` VALUES ('654', 'Pendang', '2');
INSERT INTO `master_daerah` VALUES ('655', 'Pokok Sena', '2');
INSERT INTO `master_daerah` VALUES ('656', 'Serdang', '2');
INSERT INTO `master_daerah` VALUES ('657', 'Sik', '2');
INSERT INTO `master_daerah` VALUES ('658', 'Simpang Empat', '2');
INSERT INTO `master_daerah` VALUES ('659', 'Sungai Petani', '2');
INSERT INTO `master_daerah` VALUES ('660', 'Universiti Utara Malaysia', '2');
INSERT INTO `master_daerah` VALUES ('661', 'Yan', '2');
INSERT INTO `master_daerah` VALUES ('662', 'Ayer Lanas', '3');
INSERT INTO `master_daerah` VALUES ('663', 'Cherang Ruku', '3');
INSERT INTO `master_daerah` VALUES ('664', 'Dabong', '3');
INSERT INTO `master_daerah` VALUES ('665', 'Gua Musang', '3');
INSERT INTO `master_daerah` VALUES ('666', 'Jeli', '3');
INSERT INTO `master_daerah` VALUES ('667', 'Kem Desa Pahlawan', '3');
INSERT INTO `master_daerah` VALUES ('668', 'Ketereh', '3');
INSERT INTO `master_daerah` VALUES ('669', 'Kota Bharu', '3');
INSERT INTO `master_daerah` VALUES ('670', 'Kuala Balah', '3');
INSERT INTO `master_daerah` VALUES ('671', 'Kuala Krai', '3');
INSERT INTO `master_daerah` VALUES ('672', 'Machang', '3');
INSERT INTO `master_daerah` VALUES ('673', 'Melor', '3');
INSERT INTO `master_daerah` VALUES ('674', 'Pasir Mas', '3');
INSERT INTO `master_daerah` VALUES ('675', 'Pasir Puteh', '3');
INSERT INTO `master_daerah` VALUES ('676', 'Pulai Chondong', '3');
INSERT INTO `master_daerah` VALUES ('677', 'Rantau Panjang', '3');
INSERT INTO `master_daerah` VALUES ('678', 'Selising', '3');
INSERT INTO `master_daerah` VALUES ('679', 'Temangan', '3');
INSERT INTO `master_daerah` VALUES ('680', 'Tumpat', '3');
INSERT INTO `master_daerah` VALUES ('681', 'Wakaf Bharu', '3');
INSERT INTO `master_daerah` VALUES ('682', 'Alor Gajah', '5');
INSERT INTO `master_daerah` VALUES ('683', 'Asahan', '5');
INSERT INTO `master_daerah` VALUES ('684', 'Ayer Keroh', '5');
INSERT INTO `master_daerah` VALUES ('685', 'Bemban', '5');
INSERT INTO `master_daerah` VALUES ('686', 'Durian Tunggal', '5');
INSERT INTO `master_daerah` VALUES ('687', 'Jasin', '5');
INSERT INTO `master_daerah` VALUES ('688', 'Kem Trendak', '5');
INSERT INTO `master_daerah` VALUES ('689', 'Kuala Sungai Baru', '5');
INSERT INTO `master_daerah` VALUES ('690', 'Lubok China', '5');
INSERT INTO `master_daerah` VALUES ('691', 'Masjid Tanah', '5');
INSERT INTO `master_daerah` VALUES ('692', 'Melaka', '5');
INSERT INTO `master_daerah` VALUES ('693', 'Merlimau', '5');
INSERT INTO `master_daerah` VALUES ('694', 'Selandar', '5');
INSERT INTO `master_daerah` VALUES ('695', 'Sungai Rambai', '5');
INSERT INTO `master_daerah` VALUES ('696', 'Sungai Udang', '5');
INSERT INTO `master_daerah` VALUES ('697', 'Tanjong Kling', '5');
INSERT INTO `master_daerah` VALUES ('698', 'Bahau', '6');
INSERT INTO `master_daerah` VALUES ('699', 'Bandar Enstek', '6');
INSERT INTO `master_daerah` VALUES ('700', 'Bandar Seri Jempol', '6');
INSERT INTO `master_daerah` VALUES ('701', 'Batu Kikir', '6');
INSERT INTO `master_daerah` VALUES ('702', 'Gemas', '6');
INSERT INTO `master_daerah` VALUES ('703', 'Gemencheh', '6');
INSERT INTO `master_daerah` VALUES ('704', 'Johol', '6');
INSERT INTO `master_daerah` VALUES ('705', 'Kota', '6');
INSERT INTO `master_daerah` VALUES ('706', 'Kuala Klawang', '6');
INSERT INTO `master_daerah` VALUES ('707', 'Kuala Pilah', '6');
INSERT INTO `master_daerah` VALUES ('708', 'Labu', '6');
INSERT INTO `master_daerah` VALUES ('709', 'Linggi', '6');
INSERT INTO `master_daerah` VALUES ('710', 'Mantin', '6');
INSERT INTO `master_daerah` VALUES ('711', 'Nilai', '6');
INSERT INTO `master_daerah` VALUES ('712', 'Port Dickson', '6');
INSERT INTO `master_daerah` VALUES ('713', 'Pusat Bandar Palong', '6');
INSERT INTO `master_daerah` VALUES ('714', 'Rantau', '6');
INSERT INTO `master_daerah` VALUES ('715', 'Rembau', '6');
INSERT INTO `master_daerah` VALUES ('716', 'Rompin', '6');
INSERT INTO `master_daerah` VALUES ('717', 'Si Rusa', '6');
INSERT INTO `master_daerah` VALUES ('718', 'Simpang Durian', '6');
INSERT INTO `master_daerah` VALUES ('719', 'Simpang Pertang', '6');
INSERT INTO `master_daerah` VALUES ('720', 'Tampin', '6');
INSERT INTO `master_daerah` VALUES ('721', 'Tanjong Ipoh', '6');
INSERT INTO `master_daerah` VALUES ('722', 'Balok', '4');
INSERT INTO `master_daerah` VALUES ('723', 'Bandar Bera', '4');
INSERT INTO `master_daerah` VALUES ('724', 'Bandar Pusat Jengka', '4');
INSERT INTO `master_daerah` VALUES ('725', 'Bandar Tun Abdul Razak', '4');
INSERT INTO `master_daerah` VALUES ('726', 'Benta', '4');
INSERT INTO `master_daerah` VALUES ('727', 'Bentong', '4');
INSERT INTO `master_daerah` VALUES ('728', 'Brinchang', '4');
INSERT INTO `master_daerah` VALUES ('729', 'Bukit Fraser', '4');
INSERT INTO `master_daerah` VALUES ('730', 'Bukit Goh', '4');
INSERT INTO `master_daerah` VALUES ('731', 'Chenor', '4');
INSERT INTO `master_daerah` VALUES ('732', 'Chini', '4');
INSERT INTO `master_daerah` VALUES ('733', 'Damak', '4');
INSERT INTO `master_daerah` VALUES ('734', 'Dong', '4');
INSERT INTO `master_daerah` VALUES ('735', 'Gambang', '4');
INSERT INTO `master_daerah` VALUES ('736', 'Genting Highlands', '4');
INSERT INTO `master_daerah` VALUES ('737', 'Jerantut', '4');
INSERT INTO `master_daerah` VALUES ('738', 'Karak', '4');
INSERT INTO `master_daerah` VALUES ('739', 'Kemayan', '4');
INSERT INTO `master_daerah` VALUES ('740', 'Kuala Krau', '4');
INSERT INTO `master_daerah` VALUES ('741', 'Kuala Lipis', '4');
INSERT INTO `master_daerah` VALUES ('742', 'Kuala Rompin', '4');
INSERT INTO `master_daerah` VALUES ('743', 'Lanchang', '4');
INSERT INTO `master_daerah` VALUES ('744', 'Lurah Bilut', '4');
INSERT INTO `master_daerah` VALUES ('745', 'Maran', '4');
INSERT INTO `master_daerah` VALUES ('746', 'Mentakab', '4');
INSERT INTO `master_daerah` VALUES ('747', 'Muadzam Shah', '4');
INSERT INTO `master_daerah` VALUES ('748', 'Padang Tengku', '4');
INSERT INTO `master_daerah` VALUES ('749', 'Pekan', '4');
INSERT INTO `master_daerah` VALUES ('750', 'Raub', '4');
INSERT INTO `master_daerah` VALUES ('751', 'Ringlet', '4');
INSERT INTO `master_daerah` VALUES ('752', 'Sega', '4');
INSERT INTO `master_daerah` VALUES ('753', 'Sungai Koyan', '4');
INSERT INTO `master_daerah` VALUES ('754', 'Sungai Lembing', '4');
INSERT INTO `master_daerah` VALUES ('755', 'Tanah Rata', '4');
INSERT INTO `master_daerah` VALUES ('756', 'Temerloh', '4');
INSERT INTO `master_daerah` VALUES ('757', 'Triang', '4');
INSERT INTO `master_daerah` VALUES ('758', 'Ayer Tawar', '8');
INSERT INTO `master_daerah` VALUES ('759', 'Bagan Datoh', '8');
INSERT INTO `master_daerah` VALUES ('760', 'Bagan Serai', '8');
INSERT INTO `master_daerah` VALUES ('761', 'Bandar Seri Iskandar', '8');
INSERT INTO `master_daerah` VALUES ('762', 'Batu Gajah', '8');
INSERT INTO `master_daerah` VALUES ('763', 'Batu Kurau', '8');
INSERT INTO `master_daerah` VALUES ('764', 'Behrang Stesen', '8');
INSERT INTO `master_daerah` VALUES ('765', 'Bidor', '8');
INSERT INTO `master_daerah` VALUES ('766', 'Bota', '8');
INSERT INTO `master_daerah` VALUES ('767', 'Bruas', '8');
INSERT INTO `master_daerah` VALUES ('768', 'Changkat Jering', '8');
INSERT INTO `master_daerah` VALUES ('769', 'Changkat Keruing', '8');
INSERT INTO `master_daerah` VALUES ('770', 'Chemor', '8');
INSERT INTO `master_daerah` VALUES ('771', 'Chenderiang', '8');
INSERT INTO `master_daerah` VALUES ('772', 'Chenderong Balai', '8');
INSERT INTO `master_daerah` VALUES ('773', 'Chikus', '8');
INSERT INTO `master_daerah` VALUES ('774', 'Enggor', '8');
INSERT INTO `master_daerah` VALUES ('775', 'Gerik', '8');
INSERT INTO `master_daerah` VALUES ('776', 'Gopeng', '8');
INSERT INTO `master_daerah` VALUES ('777', 'Hutan Melintang', '8');
INSERT INTO `master_daerah` VALUES ('778', 'Intan', '8');
INSERT INTO `master_daerah` VALUES ('779', 'Jeram', '8');
INSERT INTO `master_daerah` VALUES ('780', 'Kampar', '8');
INSERT INTO `master_daerah` VALUES ('781', 'Kampung Gajah', '8');
INSERT INTO `master_daerah` VALUES ('782', 'Kampung Kepayang', '8');
INSERT INTO `master_daerah` VALUES ('783', 'Kamunting', '8');
INSERT INTO `master_daerah` VALUES ('784', 'Kuala Kangsar', '8');
INSERT INTO `master_daerah` VALUES ('785', 'Kuala Kurau', '8');
INSERT INTO `master_daerah` VALUES ('786', 'Kuala Sepetang', '8');
INSERT INTO `master_daerah` VALUES ('787', 'Lambor Kanan', '8');
INSERT INTO `master_daerah` VALUES ('788', 'Langkap', '8');
INSERT INTO `master_daerah` VALUES ('789', 'Lenggong', '8');
INSERT INTO `master_daerah` VALUES ('790', 'Lumut', '8');
INSERT INTO `master_daerah` VALUES ('791', 'Malim Nawar', '8');
INSERT INTO `master_daerah` VALUES ('792', 'Manong', '8');
INSERT INTO `master_daerah` VALUES ('793', 'Matang', '8');
INSERT INTO `master_daerah` VALUES ('794', 'Padang Rengas', '8');
INSERT INTO `master_daerah` VALUES ('795', 'Pangkor', '8');
INSERT INTO `master_daerah` VALUES ('796', 'Pantai Remis', '8');
INSERT INTO `master_daerah` VALUES ('797', 'Parit', '8');
INSERT INTO `master_daerah` VALUES ('798', 'Parit Buntar', '8');
INSERT INTO `master_daerah` VALUES ('799', 'Pengkalan Hulu', '8');
INSERT INTO `master_daerah` VALUES ('800', 'Pusing', '8');
INSERT INTO `master_daerah` VALUES ('801', 'Sauk', '8');
INSERT INTO `master_daerah` VALUES ('802', 'Selama', '8');
INSERT INTO `master_daerah` VALUES ('803', 'Selekoh', '8');
INSERT INTO `master_daerah` VALUES ('804', 'Seri Manjong', '8');
INSERT INTO `master_daerah` VALUES ('805', 'Simpang', '8');
INSERT INTO `master_daerah` VALUES ('806', 'Simpang Ampat Semanggol', '8');
INSERT INTO `master_daerah` VALUES ('807', 'Sitiawan', '8');
INSERT INTO `master_daerah` VALUES ('808', 'Slim River', '8');
INSERT INTO `master_daerah` VALUES ('809', 'Sungai Siput', '8');
INSERT INTO `master_daerah` VALUES ('810', 'Sungai Sumun', '8');
INSERT INTO `master_daerah` VALUES ('811', 'Sungkai', '8');
INSERT INTO `master_daerah` VALUES ('812', 'Taiping', '8');
INSERT INTO `master_daerah` VALUES ('813', 'Tanjong Malim', '8');
INSERT INTO `master_daerah` VALUES ('814', 'Tanjong Piandang', '8');
INSERT INTO `master_daerah` VALUES ('815', 'Tanjong Rambutan', '8');
INSERT INTO `master_daerah` VALUES ('816', 'Tanjong Tualang', '8');
INSERT INTO `master_daerah` VALUES ('817', 'Tapah', '8');
INSERT INTO `master_daerah` VALUES ('818', 'Tapah Road', '8');
INSERT INTO `master_daerah` VALUES ('819', 'Teluk Intan', '8');
INSERT INTO `master_daerah` VALUES ('820', 'Temoh', '8');
INSERT INTO `master_daerah` VALUES ('821', 'TLDM Lumut', '8');
INSERT INTO `master_daerah` VALUES ('822', 'Trolak', '8');
INSERT INTO `master_daerah` VALUES ('823', 'Trong', '8');
INSERT INTO `master_daerah` VALUES ('824', 'Tronoh', '8');
INSERT INTO `master_daerah` VALUES ('825', 'Ulu Bernam', '8');
INSERT INTO `master_daerah` VALUES ('826', 'Ulu Kinta', '8');
INSERT INTO `master_daerah` VALUES ('827', 'Kaki Bukit', '9');
INSERT INTO `master_daerah` VALUES ('828', 'Kangar', '9');
INSERT INTO `master_daerah` VALUES ('829', 'Padang Besar', '9');
INSERT INTO `master_daerah` VALUES ('830', 'Simpang Ampat', '9');
INSERT INTO `master_daerah` VALUES ('831', 'Balik Pulau', '10');
INSERT INTO `master_daerah` VALUES ('832', 'Batu Ferringhi', '10');
INSERT INTO `master_daerah` VALUES ('833', 'Batu Maung', '10');
INSERT INTO `master_daerah` VALUES ('834', 'Bayan Lepas', '10');
INSERT INTO `master_daerah` VALUES ('835', 'Bukit Mertajam', '10');
INSERT INTO `master_daerah` VALUES ('836', 'Butterworth', '10');
INSERT INTO `master_daerah` VALUES ('837', 'Gelugor', '10');
INSERT INTO `master_daerah` VALUES ('838', 'Jelutong', '10');
INSERT INTO `master_daerah` VALUES ('839', 'Kubang Semang', '10');
INSERT INTO `master_daerah` VALUES ('840', 'Nibong Tebal', '10');
INSERT INTO `master_daerah` VALUES ('841', 'Penaga', '10');
INSERT INTO `master_daerah` VALUES ('842', 'Penang Hill', '10');
INSERT INTO `master_daerah` VALUES ('843', 'Perai', '10');
INSERT INTO `master_daerah` VALUES ('844', 'Permatang Pauh', '10');
INSERT INTO `master_daerah` VALUES ('845', 'Pulau Pinang', '10');
INSERT INTO `master_daerah` VALUES ('846', 'Sungai Jawi', '10');
INSERT INTO `master_daerah` VALUES ('847', 'Tanjong Bungah', '10');
INSERT INTO `master_daerah` VALUES ('848', 'Tasek Gelugor', '10');
INSERT INTO `master_daerah` VALUES ('849', 'USM Pulau Pinang', '10');
INSERT INTO `master_daerah` VALUES ('850', 'Beaufort', '12');
INSERT INTO `master_daerah` VALUES ('851', 'Beluran', '12');
INSERT INTO `master_daerah` VALUES ('852', 'Beverly', '12');
INSERT INTO `master_daerah` VALUES ('853', 'Bongawan', '12');
INSERT INTO `master_daerah` VALUES ('854', 'Keningau', '12');
INSERT INTO `master_daerah` VALUES ('855', 'Kota Kinabatangan', '12');
INSERT INTO `master_daerah` VALUES ('856', 'Kota Marudu', '12');
INSERT INTO `master_daerah` VALUES ('857', 'Kunak', '12');
INSERT INTO `master_daerah` VALUES ('858', 'Lahad Datu', '12');
INSERT INTO `master_daerah` VALUES ('859', 'Likas', '12');
INSERT INTO `master_daerah` VALUES ('860', 'Membakut', '12');
INSERT INTO `master_daerah` VALUES ('861', 'Menumbok', '12');
INSERT INTO `master_daerah` VALUES ('862', 'Nabawan', '12');
INSERT INTO `master_daerah` VALUES ('863', 'Pamol', '12');
INSERT INTO `master_daerah` VALUES ('864', 'Putatan', '12');
INSERT INTO `master_daerah` VALUES ('865', 'Ranau', '12');
INSERT INTO `master_daerah` VALUES ('866', 'Semporna', '12');
INSERT INTO `master_daerah` VALUES ('867', 'Tamparuli', '12');
INSERT INTO `master_daerah` VALUES ('868', 'Tanjung Aru', '12');
INSERT INTO `master_daerah` VALUES ('869', 'Tenghilan', '12');
INSERT INTO `master_daerah` VALUES ('870', 'Asajaya', '11');
INSERT INTO `master_daerah` VALUES ('871', 'Balingian', '11');
INSERT INTO `master_daerah` VALUES ('872', 'Baram', '11');
INSERT INTO `master_daerah` VALUES ('873', 'Bau', '11');
INSERT INTO `master_daerah` VALUES ('874', 'Bekenu', '11');
INSERT INTO `master_daerah` VALUES ('875', 'Belaga', '11');
INSERT INTO `master_daerah` VALUES ('876', 'Belawai', '11');
INSERT INTO `master_daerah` VALUES ('877', 'Betong', '11');
INSERT INTO `master_daerah` VALUES ('878', 'Bintangor', '11');
INSERT INTO `master_daerah` VALUES ('879', 'Bintulu', '11');
INSERT INTO `master_daerah` VALUES ('880', 'Dalat', '11');
INSERT INTO `master_daerah` VALUES ('881', 'Daro', '11');
INSERT INTO `master_daerah` VALUES ('882', 'Debak', '11');
INSERT INTO `master_daerah` VALUES ('883', 'Engkilili', '11');
INSERT INTO `master_daerah` VALUES ('884', 'Julau', '11');
INSERT INTO `master_daerah` VALUES ('885', 'Kabong', '11');
INSERT INTO `master_daerah` VALUES ('886', 'Kanowit', '11');
INSERT INTO `master_daerah` VALUES ('887', 'Kapit', '11');
INSERT INTO `master_daerah` VALUES ('888', 'Kota Samarahan', '11');
INSERT INTO `master_daerah` VALUES ('889', 'Lawas', '11');
INSERT INTO `master_daerah` VALUES ('890', 'Limbang', '11');
INSERT INTO `master_daerah` VALUES ('891', 'Lingga', '11');
INSERT INTO `master_daerah` VALUES ('892', 'Long Lama', '11');
INSERT INTO `master_daerah` VALUES ('893', 'Lubok Antu', '11');
INSERT INTO `master_daerah` VALUES ('894', 'Lundu', '11');
INSERT INTO `master_daerah` VALUES ('895', 'Lutong', '11');
INSERT INTO `master_daerah` VALUES ('896', 'Matu', '11');
INSERT INTO `master_daerah` VALUES ('897', 'Mukah', '11');
INSERT INTO `master_daerah` VALUES ('898', 'Nanga Medamit', '11');
INSERT INTO `master_daerah` VALUES ('899', 'Niah', '11');
INSERT INTO `master_daerah` VALUES ('900', 'Pusa', '11');
INSERT INTO `master_daerah` VALUES ('901', 'Roban', '11');
INSERT INTO `master_daerah` VALUES ('902', 'Saratok', '11');
INSERT INTO `master_daerah` VALUES ('903', 'Sebauh', '11');
INSERT INTO `master_daerah` VALUES ('904', 'Sebuyau', '11');
INSERT INTO `master_daerah` VALUES ('905', 'Serian', '11');
INSERT INTO `master_daerah` VALUES ('906', 'Siburan', '11');
INSERT INTO `master_daerah` VALUES ('907', 'Simunjan', '11');
INSERT INTO `master_daerah` VALUES ('908', 'Song', '11');
INSERT INTO `master_daerah` VALUES ('909', 'Spaoh', '11');
INSERT INTO `master_daerah` VALUES ('910', 'Sri Aman', '11');
INSERT INTO `master_daerah` VALUES ('911', 'Sundar', '11');
INSERT INTO `master_daerah` VALUES ('912', 'Tatau', '11');
INSERT INTO `master_daerah` VALUES ('913', 'Ampang', '7');
INSERT INTO `master_daerah` VALUES ('914', 'Bandar Baru Bangi', '7');
INSERT INTO `master_daerah` VALUES ('915', 'Bandar Puncak Alam', '7');
INSERT INTO `master_daerah` VALUES ('916', 'Banting', '7');
INSERT INTO `master_daerah` VALUES ('917', 'Batang Berjuntai', '7');
INSERT INTO `master_daerah` VALUES ('918', 'Batang Kali', '7');
INSERT INTO `master_daerah` VALUES ('919', 'Batu Arang', '7');
INSERT INTO `master_daerah` VALUES ('920', 'Beranang', '7');
INSERT INTO `master_daerah` VALUES ('921', 'Bukit Rotan', '7');
INSERT INTO `master_daerah` VALUES ('922', 'Cyberjaya', '7');
INSERT INTO `master_daerah` VALUES ('923', 'Dengkil', '7');
INSERT INTO `master_daerah` VALUES ('924', 'Hulu Langat', '7');
INSERT INTO `master_daerah` VALUES ('925', 'Jenjarom', '7');
INSERT INTO `master_daerah` VALUES ('926', 'Kapar', '7');
INSERT INTO `master_daerah` VALUES ('927', 'Kerling', '7');
INSERT INTO `master_daerah` VALUES ('928', 'Klang', '7');
INSERT INTO `master_daerah` VALUES ('929', 'KLIA', '7');
INSERT INTO `master_daerah` VALUES ('930', 'Kuala Kubu Baru', '7');
INSERT INTO `master_daerah` VALUES ('931', 'Kuala Selangor', '7');
INSERT INTO `master_daerah` VALUES ('932', 'Pelabuhan Klang', '7');
INSERT INTO `master_daerah` VALUES ('933', 'Pulau Carey', '7');
INSERT INTO `master_daerah` VALUES ('934', 'Pulau Indah', '7');
INSERT INTO `master_daerah` VALUES ('935', 'Pulau Ketam', '7');
INSERT INTO `master_daerah` VALUES ('936', 'Rasa', '7');
INSERT INTO `master_daerah` VALUES ('937', 'Sabak Bernam', '7');
INSERT INTO `master_daerah` VALUES ('938', 'Sekinchan', '7');
INSERT INTO `master_daerah` VALUES ('939', 'Sepang', '7');
INSERT INTO `master_daerah` VALUES ('940', 'Serendah', '7');
INSERT INTO `master_daerah` VALUES ('941', 'Sungai Ayer Tawar', '7');
INSERT INTO `master_daerah` VALUES ('942', 'Sungai Besar', '7');
INSERT INTO `master_daerah` VALUES ('943', 'Sungai Buloh', '7');
INSERT INTO `master_daerah` VALUES ('944', 'Sungai Pelek', '7');
INSERT INTO `master_daerah` VALUES ('945', 'Tanjong Karang', '7');
INSERT INTO `master_daerah` VALUES ('946', 'Tanjong Sepat', '7');
INSERT INTO `master_daerah` VALUES ('947', 'Telok Panglima Garang', '7');
INSERT INTO `master_daerah` VALUES ('948', 'Ajil', '13');
INSERT INTO `master_daerah` VALUES ('949', 'Al Muktatfi Billah Shah', '13');
INSERT INTO `master_daerah` VALUES ('950', 'Ayer Puteh', '13');
INSERT INTO `master_daerah` VALUES ('951', 'Bukit Besi', '13');
INSERT INTO `master_daerah` VALUES ('952', 'Bukit Payong', '13');
INSERT INTO `master_daerah` VALUES ('953', 'Ceneh', '13');
INSERT INTO `master_daerah` VALUES ('954', 'Chalok', '13');
INSERT INTO `master_daerah` VALUES ('955', 'Cukai', '13');
INSERT INTO `master_daerah` VALUES ('956', 'Dungun', '13');
INSERT INTO `master_daerah` VALUES ('957', 'Jerteh', '13');
INSERT INTO `master_daerah` VALUES ('958', 'Kampung Raja', '13');
INSERT INTO `master_daerah` VALUES ('959', 'Kemasek', '13');
INSERT INTO `master_daerah` VALUES ('960', 'Kerteh', '13');
INSERT INTO `master_daerah` VALUES ('961', 'Ketengah Jaya', '13');
INSERT INTO `master_daerah` VALUES ('962', 'Kijal', '13');
INSERT INTO `master_daerah` VALUES ('963', 'Kuala Berang', '13');
INSERT INTO `master_daerah` VALUES ('964', 'Kuala Besut', '13');
INSERT INTO `master_daerah` VALUES ('965', 'Marang', '13');
INSERT INTO `master_daerah` VALUES ('966', 'Paka', '13');
INSERT INTO `master_daerah` VALUES ('967', 'Permaisuri', '13');
INSERT INTO `master_daerah` VALUES ('968', 'Sungai Tong', '13');
INSERT INTO `master_daerah` VALUES ('969', 'Labuan', '14');
INSERT INTO `master_daerah` VALUES ('970', 'Putrajaya', '14');

-- ----------------------------
-- Table structure for master_negara
-- ----------------------------
DROP TABLE IF EXISTS `master_negara`;
CREATE TABLE `master_negara` (
  `negara_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `negara_code` varchar(8) DEFAULT NULL,
  `negara_nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`negara_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_negara
-- ----------------------------
INSERT INTO `master_negara` VALUES ('1', 'UK', 'UNITED KINGDOM');
INSERT INTO `master_negara` VALUES ('2', 'AF', 'AFGHANISTAN');
INSERT INTO `master_negara` VALUES ('3', 'AL', 'ALBANIA');
INSERT INTO `master_negara` VALUES ('4', 'DZ', 'ALGERIA');
INSERT INTO `master_negara` VALUES ('5', 'US', 'UNITED STATES');
INSERT INTO `master_negara` VALUES ('6', 'AD', 'ANDORRA');
INSERT INTO `master_negara` VALUES ('7', 'AO', 'ANGOLA');
INSERT INTO `master_negara` VALUES ('8', 'AI', 'ANGUILLA');
INSERT INTO `master_negara` VALUES ('9', 'AG', 'ANTIGUA AND BARBUDA');
INSERT INTO `master_negara` VALUES ('10', 'AR', 'ARGENTINA');
INSERT INTO `master_negara` VALUES ('11', 'AM', 'ARMENIA');
INSERT INTO `master_negara` VALUES ('12', 'AW', 'ARUBA');
INSERT INTO `master_negara` VALUES ('13', 'AU', 'AUSTRALIA');
INSERT INTO `master_negara` VALUES ('14', 'AT', 'AUSTRIA');
INSERT INTO `master_negara` VALUES ('15', 'AZ', 'AZERBAIJAN');
INSERT INTO `master_negara` VALUES ('16', 'BS', 'BAHAMAS');
INSERT INTO `master_negara` VALUES ('17', 'BH', 'BAHRAIN');
INSERT INTO `master_negara` VALUES ('18', 'BD', 'BANGLADESH');
INSERT INTO `master_negara` VALUES ('19', 'BB', 'BARBADOS');
INSERT INTO `master_negara` VALUES ('20', 'LS', 'LESOTHO');
INSERT INTO `master_negara` VALUES ('21', 'BW', 'BOTSWANA');
INSERT INTO `master_negara` VALUES ('22', 'BY', 'BELARUS');
INSERT INTO `master_negara` VALUES ('23', 'BE', 'BELGIUM');
INSERT INTO `master_negara` VALUES ('24', 'BZ', 'BELIZE');
INSERT INTO `master_negara` VALUES ('25', 'BJ', 'BENIN');
INSERT INTO `master_negara` VALUES ('26', 'BM', 'BERMUDA');
INSERT INTO `master_negara` VALUES ('27', 'BT', 'BHUTAN');
INSERT INTO `master_negara` VALUES ('28', 'BO', 'BOLIVIA');
INSERT INTO `master_negara` VALUES ('29', 'BA', 'BOSNIA AND HERZEGOVINA');
INSERT INTO `master_negara` VALUES ('30', 'BR', 'BRAZIL');
INSERT INTO `master_negara` VALUES ('31', 'VG', 'BRITISH VIRGIN ISLANDS');
INSERT INTO `master_negara` VALUES ('32', 'BN', 'BRUNEI DARUSSALAM');
INSERT INTO `master_negara` VALUES ('33', 'BG', 'BULGARIA');
INSERT INTO `master_negara` VALUES ('34', 'BF', 'BURKINA FASO');
INSERT INTO `master_negara` VALUES ('35', 'MM', 'MYANMAR');
INSERT INTO `master_negara` VALUES ('36', 'BI', 'BURUNDI');
INSERT INTO `master_negara` VALUES ('37', 'KH', 'CAMBODIA');
INSERT INTO `master_negara` VALUES ('38', 'CM', 'CAMEROON');
INSERT INTO `master_negara` VALUES ('39', 'CA', 'CANADA');
INSERT INTO `master_negara` VALUES ('40', 'CV', 'CAPE VERDE');
INSERT INTO `master_negara` VALUES ('41', 'KY', 'CAYMAN ISLANDS');
INSERT INTO `master_negara` VALUES ('42', 'CF', 'CENTRAL AFRICAN REPUBLIC');
INSERT INTO `master_negara` VALUES ('43', 'TD', 'CHAD');
INSERT INTO `master_negara` VALUES ('44', 'GG', 'GUERNSEY');
INSERT INTO `master_negara` VALUES ('45', 'JE', 'JERSEY');
INSERT INTO `master_negara` VALUES ('46', 'CL', 'CHILE');
INSERT INTO `master_negara` VALUES ('47', 'CN', 'CHINA');
INSERT INTO `master_negara` VALUES ('48', 'HK', 'HONG KONG (SAR)');
INSERT INTO `master_negara` VALUES ('49', 'MO', 'MACAO');
INSERT INTO `master_negara` VALUES ('50', 'CX', 'CHRISTMAS ISLAND');
INSERT INTO `master_negara` VALUES ('51', 'CC', 'COCOS (KEELING) ISLANDS');
INSERT INTO `master_negara` VALUES ('52', 'CO', 'COLOMBIA');
INSERT INTO `master_negara` VALUES ('53', 'KM', 'COMOROS');
INSERT INTO `master_negara` VALUES ('54', 'CD', 'DEMOCRATIC REPUBLIC OF THE CON');
INSERT INTO `master_negara` VALUES ('55', 'CG', 'REPUBLIC OF THE CONGO');
INSERT INTO `master_negara` VALUES ('56', 'CK', 'COOK ISLANDS');
INSERT INTO `master_negara` VALUES ('57', 'CR', 'COSTA RICA');
INSERT INTO `master_negara` VALUES ('58', 'HR', 'CROATIA');
INSERT INTO `master_negara` VALUES ('59', 'CU', 'CUBA');
INSERT INTO `master_negara` VALUES ('60', 'CY', 'CYPRUS');
INSERT INTO `master_negara` VALUES ('61', 'CZ', 'CZECH REPUBLIC');
INSERT INTO `master_negara` VALUES ('62', 'DK', 'DENMARK');
INSERT INTO `master_negara` VALUES ('63', 'DJ', 'DJIBOUTI');
INSERT INTO `master_negara` VALUES ('64', 'DM', 'DOMINICA');
INSERT INTO `master_negara` VALUES ('65', 'DO', 'DOMINICAN REPUBLIC');
INSERT INTO `master_negara` VALUES ('66', 'NL', 'NETHERLANDS');
INSERT INTO `master_negara` VALUES ('67', 'AN', 'NETHERLANDS ANTILLES');
INSERT INTO `master_negara` VALUES ('68', 'EC', 'ECUADOR');
INSERT INTO `master_negara` VALUES ('69', 'EG', 'EGYPT');
INSERT INTO `master_negara` VALUES ('70', 'AE', 'UNITED ARAB EMIRATES');
INSERT INTO `master_negara` VALUES ('71', 'GQ', 'EQUATORIAL GUINEA');
INSERT INTO `master_negara` VALUES ('72', 'ER', 'ERITREA');
INSERT INTO `master_negara` VALUES ('73', 'EE', 'ESTONIA');
INSERT INTO `master_negara` VALUES ('74', 'ET', 'ETHIOPIA');
INSERT INTO `master_negara` VALUES ('75', 'FK', 'FALKLAND ISLANDS (ISLAS MALVIN');
INSERT INTO `master_negara` VALUES ('76', 'FO', 'FAROE ISLANDS');
INSERT INTO `master_negara` VALUES ('77', 'FJ', 'FIJI');
INSERT INTO `master_negara` VALUES ('78', 'PH', 'PHILIPPINES');
INSERT INTO `master_negara` VALUES ('79', 'FI', 'FINLAND');
INSERT INTO `master_negara` VALUES ('80', 'FR', 'FRANCE');
INSERT INTO `master_negara` VALUES ('81', 'FX', 'FRANCE METROPOLITAN');
INSERT INTO `master_negara` VALUES ('82', 'PM', 'SAINT PIERRE AND MIQUELON');
INSERT INTO `master_negara` VALUES ('83', 'GF', 'FRENCH GUIANA');
INSERT INTO `master_negara` VALUES ('84', 'PF', 'FRENCH POLYNESIA');
INSERT INTO `master_negara` VALUES ('85', 'GA', 'GABON');
INSERT INTO `master_negara` VALUES ('86', 'GM', 'GAMBIA');
INSERT INTO `master_negara` VALUES ('87', 'GE', 'GEORGIA');
INSERT INTO `master_negara` VALUES ('88', 'DE', 'GERMANY');
INSERT INTO `master_negara` VALUES ('89', 'GH', 'GHANA');
INSERT INTO `master_negara` VALUES ('90', 'GI', 'GIBRALTAR');
INSERT INTO `master_negara` VALUES ('91', 'GR', 'GREECE');
INSERT INTO `master_negara` VALUES ('92', 'GL', 'GREENLAND');
INSERT INTO `master_negara` VALUES ('93', 'GD', 'GRENADA');
INSERT INTO `master_negara` VALUES ('94', 'GP', 'GUADELOUPE');
INSERT INTO `master_negara` VALUES ('95', 'GU', 'GUAM');
INSERT INTO `master_negara` VALUES ('96', 'GT', 'GUATEMALA');
INSERT INTO `master_negara` VALUES ('97', 'GN', 'GUINEA');
INSERT INTO `master_negara` VALUES ('98', 'GW', 'GUINEA-BISSAU');
INSERT INTO `master_negara` VALUES ('99', 'GY', 'GUYANA');
INSERT INTO `master_negara` VALUES ('100', 'HT', 'HAITI');
INSERT INTO `master_negara` VALUES ('101', 'HN', 'HONDURAS');
INSERT INTO `master_negara` VALUES ('102', 'HU', 'HUNGARY');
INSERT INTO `master_negara` VALUES ('103', 'IS', 'ICELAND');
INSERT INTO `master_negara` VALUES ('104', 'IN', 'INDIA');
INSERT INTO `master_negara` VALUES ('105', 'ID', 'INDONESIA');
INSERT INTO `master_negara` VALUES ('106', 'IR', 'IRAN');
INSERT INTO `master_negara` VALUES ('107', 'IQ', 'IRAQ');
INSERT INTO `master_negara` VALUES ('108', 'IE', 'IRELAND');
INSERT INTO `master_negara` VALUES ('109', 'IL', 'ISRAEL');
INSERT INTO `master_negara` VALUES ('110', 'IT', 'ITALY');
INSERT INTO `master_negara` VALUES ('111', 'CI', 'COTE D IVOIRE');
INSERT INTO `master_negara` VALUES ('112', 'JM', 'JAMAICA');
INSERT INTO `master_negara` VALUES ('113', 'JP', 'JAPAN');
INSERT INTO `master_negara` VALUES ('114', 'JO', 'JORDAN');
INSERT INTO `master_negara` VALUES ('115', 'KZ', 'KAZAKHSTAN');
INSERT INTO `master_negara` VALUES ('116', 'KE', 'KENYA');
INSERT INTO `master_negara` VALUES ('117', 'KI', 'KIRIBATI');
INSERT INTO `master_negara` VALUES ('118', 'KN', 'SAINT KITTS AND NEVIS');
INSERT INTO `master_negara` VALUES ('119', 'KW', 'KUWAIT');
INSERT INTO `master_negara` VALUES ('120', 'KG', 'KYRGYZSTAN');
INSERT INTO `master_negara` VALUES ('121', 'LA', 'LAOS');
INSERT INTO `master_negara` VALUES ('122', 'LV', 'LATVIA');
INSERT INTO `master_negara` VALUES ('123', 'LB', 'LEBANON');
INSERT INTO `master_negara` VALUES ('124', 'LR', 'LIBERIA');
INSERT INTO `master_negara` VALUES ('125', 'LY', 'LIBYA');
INSERT INTO `master_negara` VALUES ('126', 'LI', 'LIECHTENSTEIN');
INSERT INTO `master_negara` VALUES ('127', 'LT', 'LITHUANIA');
INSERT INTO `master_negara` VALUES ('128', 'LU', 'LUXEMBOURG');
INSERT INTO `master_negara` VALUES ('129', 'MK', 'FORMER YUGOSLAV REPUBLIC OF MACEDONIA');
INSERT INTO `master_negara` VALUES ('130', 'YT', 'MAYOTTE');
INSERT INTO `master_negara` VALUES ('131', 'MG', 'MADAGASCAR');
INSERT INTO `master_negara` VALUES ('132', 'MW', 'MALAWI');
INSERT INTO `master_negara` VALUES ('133', 'MY', 'MALAYSIA');
INSERT INTO `master_negara` VALUES ('134', 'MV', 'MALDIVES');
INSERT INTO `master_negara` VALUES ('135', 'ML', 'MALI');
INSERT INTO `master_negara` VALUES ('136', 'MT', 'MALTA');
INSERT INTO `master_negara` VALUES ('137', 'IM', 'ISLE OF MAN');
INSERT INTO `master_negara` VALUES ('138', 'MH', 'MARSHALL ISLANDS');
INSERT INTO `master_negara` VALUES ('139', 'MQ', 'MARTINIQUE');
INSERT INTO `master_negara` VALUES ('140', 'MR', 'MAURITANIA');
INSERT INTO `master_negara` VALUES ('141', 'MU', 'MAURITIUS');
INSERT INTO `master_negara` VALUES ('142', 'MX', 'MEXICO');
INSERT INTO `master_negara` VALUES ('143', 'FM', 'FEDERATED STATES OF MICRONESIA');
INSERT INTO `master_negara` VALUES ('144', 'MD', 'MOLDOVA');
INSERT INTO `master_negara` VALUES ('145', 'MC', 'MONACO');
INSERT INTO `master_negara` VALUES ('146', 'MN', 'MONGOLIA');
INSERT INTO `master_negara` VALUES ('147', 'MS', 'MONTSERRAT');
INSERT INTO `master_negara` VALUES ('148', 'MA', 'MOROCCO');
INSERT INTO `master_negara` VALUES ('149', 'MZ', 'MOZAMBIQUE');
INSERT INTO `master_negara` VALUES ('150', 'NA', 'NAMIBIA');
INSERT INTO `master_negara` VALUES ('151', 'NR', 'NAURU');
INSERT INTO `master_negara` VALUES ('152', 'NP', 'NEPAL');
INSERT INTO `master_negara` VALUES ('153', 'NC', 'NEW CALEDONIA');
INSERT INTO `master_negara` VALUES ('154', 'NZ', 'NEW ZEALAND');
INSERT INTO `master_negara` VALUES ('155', 'NI', 'NICARAGUA');
INSERT INTO `master_negara` VALUES ('156', 'NG', 'NIGERIA');
INSERT INTO `master_negara` VALUES ('157', 'NE', 'NIGER');
INSERT INTO `master_negara` VALUES ('158', 'NU', 'NIUE');
INSERT INTO `master_negara` VALUES ('159', 'VU', 'VANUATU');
INSERT INTO `master_negara` VALUES ('160', 'AQ', 'ANTARCTICA');
INSERT INTO `master_negara` VALUES ('161', 'BV', 'BOUVET ISLAND');
INSERT INTO `master_negara` VALUES ('162', 'IO', 'BRITISH INDIAN OCEAN TERRITORY');
INSERT INTO `master_negara` VALUES ('163', 'TF', 'FRENCH SOUTHERN & ANTARCTIC');
INSERT INTO `master_negara` VALUES ('164', 'HM', 'HEARD ISLAND AND MCDONALD ISLA');
INSERT INTO `master_negara` VALUES ('165', 'VA', 'HOLY SEE (VATICAN CITY)');
INSERT INTO `master_negara` VALUES ('166', 'MP', 'NORTHERN MARIANA ISLANDS');
INSERT INTO `master_negara` VALUES ('167', 'GS', 'SOUTH GEORGIA & THE SOUTH SANDWICH ISLANDS');
INSERT INTO `master_negara` VALUES ('168', 'SJ', 'SVALBARD');
INSERT INTO `master_negara` VALUES ('169', 'TC', 'TURKS AND CAICOS ISLANDS');
INSERT INTO `master_negara` VALUES ('170', 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS');
INSERT INTO `master_negara` VALUES ('171', 'NF', 'NORFOLK ISLAND');
INSERT INTO `master_negara` VALUES ('172', 'KP', 'NORTH KOREA');
INSERT INTO `master_negara` VALUES ('173', 'NO', 'NORWAY');
INSERT INTO `master_negara` VALUES ('174', 'OM', 'OMAN');
INSERT INTO `master_negara` VALUES ('175', 'PK', 'PAKISTAN');
INSERT INTO `master_negara` VALUES ('176', 'PW', 'PALAU');
INSERT INTO `master_negara` VALUES ('177', 'PS', 'OCCUPIED PALESTINIAN TERRITORY');
INSERT INTO `master_negara` VALUES ('178', 'PA', 'PANAMA');
INSERT INTO `master_negara` VALUES ('179', 'PG', 'PAPUA NEW GUINEA');
INSERT INTO `master_negara` VALUES ('180', 'PY', 'PARAGUAY');
INSERT INTO `master_negara` VALUES ('181', 'PE', 'PERU');
INSERT INTO `master_negara` VALUES ('182', 'PN', 'PITCAIRN ISLANDS');
INSERT INTO `master_negara` VALUES ('183', 'PL', 'POLAND');
INSERT INTO `master_negara` VALUES ('184', 'PT', 'PORTUGAL');
INSERT INTO `master_negara` VALUES ('185', 'PR', 'PUERTO RICO');
INSERT INTO `master_negara` VALUES ('186', 'QA', 'QATAR');
INSERT INTO `master_negara` VALUES ('187', 'RE', 'RéUNION');
INSERT INTO `master_negara` VALUES ('188', 'RO', 'ROMANIA');
INSERT INTO `master_negara` VALUES ('189', 'RU', 'RUSSIAN FEDERATION');
INSERT INTO `master_negara` VALUES ('190', 'RW', 'RWANDA');
INSERT INTO `master_negara` VALUES ('191', 'EH', 'WESTERN SAHARA');
INSERT INTO `master_negara` VALUES ('192', 'SH', 'SAINT HELENA');
INSERT INTO `master_negara` VALUES ('193', 'LC', 'SAINT LUCIA');
INSERT INTO `master_negara` VALUES ('194', 'SV', 'EL SALVADOR');
INSERT INTO `master_negara` VALUES ('195', 'SM', 'SAN MARINO');
INSERT INTO `master_negara` VALUES ('196', 'WS', 'SAMOA');
INSERT INTO `master_negara` VALUES ('197', 'ST', 'SãO TOMé AND PRíNCIPE');
INSERT INTO `master_negara` VALUES ('198', 'SA', 'SAUDI ARABIA');
INSERT INTO `master_negara` VALUES ('199', 'SN', 'SENEGAL');
INSERT INTO `master_negara` VALUES ('200', 'CS', 'SERBIA AND MONTENEGRO');
INSERT INTO `master_negara` VALUES ('201', 'SC', 'SEYCHELLES');
INSERT INTO `master_negara` VALUES ('202', 'SL', 'SIERRA LEONE');
INSERT INTO `master_negara` VALUES ('203', 'SK', 'SLOVAKIA');
INSERT INTO `master_negara` VALUES ('204', 'SI', 'SLOVENIA');
INSERT INTO `master_negara` VALUES ('205', 'SB', 'SOLOMON ISLANDS');
INSERT INTO `master_negara` VALUES ('206', 'SO', 'SOMALIA');
INSERT INTO `master_negara` VALUES ('207', 'ZA', 'SOUTH AFRICA');
INSERT INTO `master_negara` VALUES ('208', 'KR', 'SOUTH KOREA');
INSERT INTO `master_negara` VALUES ('209', 'ES', 'SPAIN');
INSERT INTO `master_negara` VALUES ('210', 'LK', 'SRI LANKA');
INSERT INTO `master_negara` VALUES ('211', 'SD', 'SUDAN');
INSERT INTO `master_negara` VALUES ('212', 'SR', 'SURINAME');
INSERT INTO `master_negara` VALUES ('213', 'SZ', 'SWAZILAND');
INSERT INTO `master_negara` VALUES ('214', 'SE', 'SWEDEN');
INSERT INTO `master_negara` VALUES ('215', 'CH', 'SWITZERLAND');
INSERT INTO `master_negara` VALUES ('216', 'SY', 'SYRIA');
INSERT INTO `master_negara` VALUES ('217', 'TW', 'TAIWAN');
INSERT INTO `master_negara` VALUES ('218', 'TJ', 'TAJIKISTAN');
INSERT INTO `master_negara` VALUES ('219', 'TZ', 'TANZANIA');
INSERT INTO `master_negara` VALUES ('220', 'TH', 'THAILAND');
INSERT INTO `master_negara` VALUES ('221', 'TP', 'EAST TIMOR');
INSERT INTO `master_negara` VALUES ('222', 'TG', 'TOGO');
INSERT INTO `master_negara` VALUES ('223', 'TK', 'TOKELAU');
INSERT INTO `master_negara` VALUES ('224', 'TO', 'TONGA');
INSERT INTO `master_negara` VALUES ('225', 'TT', 'TRINIDAD AND TOBAGO');
INSERT INTO `master_negara` VALUES ('226', 'TN', 'TUNISIA');
INSERT INTO `master_negara` VALUES ('227', 'TR', 'TURKEY');
INSERT INTO `master_negara` VALUES ('228', 'TM', 'TURKMENISTAN');
INSERT INTO `master_negara` VALUES ('229', 'TV', 'TUVALU');
INSERT INTO `master_negara` VALUES ('230', 'UG', 'UGANDA');
INSERT INTO `master_negara` VALUES ('231', 'UA', 'UKRAINE');
INSERT INTO `master_negara` VALUES ('232', 'UY', 'URUGUAY');
INSERT INTO `master_negara` VALUES ('233', 'UZ', 'UZBEKISTAN');
INSERT INTO `master_negara` VALUES ('234', 'VE', 'VENEZUELA');
INSERT INTO `master_negara` VALUES ('235', 'VN', 'VIETNAM');
INSERT INTO `master_negara` VALUES ('236', 'VC', 'SAINT VINCENT AND THE GRENADIN');
INSERT INTO `master_negara` VALUES ('237', 'VI', 'VIRGIN ISLANDS');
INSERT INTO `master_negara` VALUES ('238', 'WF', 'WALLIS AND FUTUNA');
INSERT INTO `master_negara` VALUES ('239', 'YE', 'YEMEN');
INSERT INTO `master_negara` VALUES ('240', 'YU', 'YUGOSLAVIA');
INSERT INTO `master_negara` VALUES ('241', 'ZM', 'ZAMBIA');
INSERT INTO `master_negara` VALUES ('242', 'ZW', 'ZIMBABWE');
INSERT INTO `master_negara` VALUES ('243', 'SG', 'SINGAPORE');

-- ----------------------------
-- Table structure for master_negeri
-- ----------------------------
DROP TABLE IF EXISTS `master_negeri`;
CREATE TABLE `master_negeri` (
  `negeri_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `negeri_nama` varchar(64) NOT NULL,
  `negara_id` int(11) unsigned DEFAULT NULL,
  `negeri_aktif` int(1) DEFAULT 0,
  PRIMARY KEY (`negeri_id`),
  KEY `negara_id` (`negara_id`),
  CONSTRAINT `master_negeri_ibfk_1` FOREIGN KEY (`negara_id`) REFERENCES `master_negara` (`negara_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_negeri
-- ----------------------------
INSERT INTO `master_negeri` VALUES ('1', 'Johor', '133', '1');
INSERT INTO `master_negeri` VALUES ('2', 'Kedah', '133', '1');
INSERT INTO `master_negeri` VALUES ('3', 'Kelantan', '133', '1');
INSERT INTO `master_negeri` VALUES ('4', 'Pahang', '133', '1');
INSERT INTO `master_negeri` VALUES ('5', 'Melaka', '133', '1');
INSERT INTO `master_negeri` VALUES ('6', 'Negeri Sembilan', '133', '1');
INSERT INTO `master_negeri` VALUES ('7', 'Selangor', '133', '1');
INSERT INTO `master_negeri` VALUES ('8', 'Perak', '133', '1');
INSERT INTO `master_negeri` VALUES ('9', 'Perlis', '133', '1');
INSERT INTO `master_negeri` VALUES ('10', 'Pulau Pinang', '133', '1');
INSERT INTO `master_negeri` VALUES ('11', 'Sarawak', '133', '1');
INSERT INTO `master_negeri` VALUES ('12', 'Sabah', '133', '1');
INSERT INTO `master_negeri` VALUES ('13', 'Terengganu', '133', '1');
INSERT INTO `master_negeri` VALUES ('14', 'Wilayah Persekutuan', '133', '1');

-- ----------------------------
-- Table structure for master_status
-- ----------------------------
DROP TABLE IF EXISTS `master_status`;
CREATE TABLE `master_status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  `old_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_status
-- ----------------------------
INSERT INTO `master_status` VALUES ('1', 'DRAFT', null);
INSERT INTO `master_status` VALUES ('2', 'APPLICATION FEE', 'PAY1');
INSERT INTO `master_status` VALUES ('3', 'APPLICATION FEE (RECEIVED)', null);
INSERT INTO `master_status` VALUES ('4', 'EVALUATION', 'EVAL');
INSERT INTO `master_status` VALUES ('5', 'VERIFICATION', 'VER');
INSERT INTO `master_status` VALUES ('6', 'CONFIRMATION & RECOMMENDATION', 'PRO');
INSERT INTO `master_status` VALUES ('7', 'APPROVAL', 'DECS');
INSERT INTO `master_status` VALUES ('8', 'AUDIT UNIT', null);
INSERT INTO `master_status` VALUES ('9', 'CABAC MEETING', null);
INSERT INTO `master_status` VALUES ('10', 'BOARD MEETING', null);
INSERT INTO `master_status` VALUES ('11', 'REGISTRATION FEE', null);
INSERT INTO `master_status` VALUES ('12', 'REGISTRATION FEE (RECEIVED)', null);
INSERT INTO `master_status` VALUES ('13', 'PRINT CERTIFICATE', null);
INSERT INTO `master_status` VALUES ('14', 'COMPLETE', 'COMPLETE');
INSERT INTO `master_status` VALUES ('15', 'SUBMIT APPLICATION', null);
INSERT INTO `master_status` VALUES ('16', 'RETURN FROM MDA (NEED EXTRA INFORMATION)', 'RETURN');
INSERT INTO `master_status` VALUES ('17', 'APPLICATION FEE (BANK DRAFT REJECTED)', null);
INSERT INTO `master_status` VALUES ('18', 'REGISTRATION FEE (BANK DRAFT REJECTED)', null);
INSERT INTO `master_status` VALUES ('19', 'REJECT', 'DROP');
INSERT INTO `master_status` VALUES ('20', 'INTERVIEW', null);
INSERT INTO `master_status` VALUES ('21', 'AUDIT UNIT & INTERVIEW', null);
INSERT INTO `master_status` VALUES ('22', 'LICENSING FEE', 'PAY2');
INSERT INTO `master_status` VALUES ('23', 'LICENSING FEE (RECEIVED)', null);
INSERT INTO `master_status` VALUES ('24', 'LICENSING FEE (BANK DRAFT REJECTED)', null);
INSERT INTO `master_status` VALUES ('25', 'PRINT LICENSE', 'PRNT');
INSERT INTO `master_status` VALUES ('26', 'INSPECTION', null);
INSERT INTO `master_status` VALUES ('27', 'JKPKPP (EVALUATION)', null);
INSERT INTO `master_status` VALUES ('28', 'COMMITTEE MEETING', null);
INSERT INTO `master_status` VALUES ('29', 'RESUBMIT RETURN APPLICATION (EVALUATION)', 'RETURN2');
INSERT INTO `master_status` VALUES ('30', 'ADMIN', 'ADMIN');
INSERT INTO `master_status` VALUES ('31', 'RETURN FOR CHANGES', null);

-- ----------------------------
-- Table structure for master_type
-- ----------------------------
DROP TABLE IF EXISTS `master_type`;
CREATE TABLE `master_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `type_name_simple` varchar(255) DEFAULT NULL,
  `application_module_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `application_module_id` (`application_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_type
-- ----------------------------
INSERT INTO `master_type` VALUES ('1', 'EL - NEW REGISTRATION', 'New License', '1');
INSERT INTO `master_type` VALUES ('2', 'MDR - CLASS B, C, D - NEW REGISTRATION', 'NEW REGISTRATION CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('3', 'MDR - CLASS A - NEW REGISTRATION', 'NEW REGISTRATION CLASS A', '3');
INSERT INTO `master_type` VALUES ('4', 'CAB - NEW REGISTRATION', null, '4');
INSERT INTO `master_type` VALUES ('5', 'LABORATORY - NEW REGISTRATION', null, '5');
INSERT INTO `master_type` VALUES ('6', 'INVESTIGATIONAL USE', null, '6');
INSERT INTO `master_type` VALUES ('7', 'CLINICAL RESEARCH USE', null, '6');
INSERT INTO `master_type` VALUES ('8', 'NOTIFICATION OF CHANGE', null, '6');
INSERT INTO `master_type` VALUES ('9', 'CUSTOM MADE MEDICAL DEVICES', null, '6');
INSERT INTO `master_type` VALUES ('10', 'DEMONSTRATION', null, '6');
INSERT INTO `master_type` VALUES ('11', 'SPECIAL ACCESS', null, '6');
INSERT INTO `master_type` VALUES ('12', 'EL - RENEWAL', 'Renewal License', '1');
INSERT INTO `master_type` VALUES ('13', 'MDR - CLASS B, C, D - RE-REGISTRATION', 'RE REGISTRATION CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('14', 'MDR - CLASS A - RE-REGISTRATION', 'RE REGISTRATION CLASS A', '3');
INSERT INTO `master_type` VALUES ('15', 'CAB - RE-REGISTRATION APPLICATION', null, '4');
INSERT INTO `master_type` VALUES ('16', 'LABORATORY - RE-REGISTRATION', null, '5');
INSERT INTO `master_type` VALUES ('17', 'CAB - PERSONNEL APPLICATION', null, '4');
INSERT INTO `master_type` VALUES ('18', 'LABORATORY - PERSONNEL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('19', 'CAB - AMMENDMENT APPLICATION', null, '4');
INSERT INTO `master_type` VALUES ('20', 'CAB - AMMENDMENT PERSONNEL APPLICATION', null, '4');
INSERT INTO `master_type` VALUES ('21', 'EL - WITHDRAWAL APPLICATION', 'Withdrawal', '1');
INSERT INTO `master_type` VALUES ('22', 'EL - AMMENDMENT MAJOR APPLICATION', 'Ammendment Major', '1');
INSERT INTO `master_type` VALUES ('23', 'EL - AMMENDMENT MINOR APPLICATION', 'Ammendment Minor', '1');
INSERT INTO `master_type` VALUES ('24', 'EL - SURRENDER APPLICATION', 'Surrender', '1');
INSERT INTO `master_type` VALUES ('25', 'LABORATORY - WITHDRAWAL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('26', 'LABORATORY - SURRENDER APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('28', 'CAB - RE-REGISTRATION PERSONNEL APPLICATION', null, '4');
INSERT INTO `master_type` VALUES ('29', 'LABORATORY - AMMENDMENT APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('30', 'LABORATORY - AMMENDMENT PERSONNEL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('31', 'LABORATORY - RE-REGISTRATION PERSONNEL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('32', 'LABORATORY - WITHDRAWAL PERSONNEL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('33', 'LABORATORY - SURRENDER PERSONNEL APPLICATION', null, '5');
INSERT INTO `master_type` VALUES ('34', 'MDR - CLASS B, C, D - CHANGE OF NOTIFICATION', 'CHANGE NOTIFICATION CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('35', 'MDR - CLASS A - CHANGE OF NOTIFICATION', 'CHANGE NOTIFICATION CLASS A', '3');
INSERT INTO `master_type` VALUES ('36', 'MDR - CLASS B, C, D - WITHDRAWAL APPLICATION', 'WITHDRAWAL APPLICATION CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('37', 'MDR - CLASS A - WITHDRAWAL APPLICATION', 'WITHDRAWAL APPLICATION CLASS A', '3');
INSERT INTO `master_type` VALUES ('38', 'MDR - CLASS B, C, D - WITHDRAWAL CERTIFICATE', 'WITHDRAWAL CERTIFICATE CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('39', 'MDR - CLASS A - WITHDRAWAL CERTIFICATE', 'WITHDRAWAL CERTIFICATE CLASS A', '3');
INSERT INTO `master_type` VALUES ('40', 'MDR - CLASS B, C, D - CHANGE OF OWNERSHIP', 'CHANGE OF AR CLASS B,C,D', '2');
INSERT INTO `master_type` VALUES ('41', 'MDR - CLASS A - CHANGE OF OWNERSHIP', 'CHANGE OF AR CLASS A', '3');

-- ----------------------------
-- Table structure for mdr_device
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device`;
CREATE TABLE `mdr_device` (
  `device_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned DEFAULT NULL,
  `device_registration_route` tinyint(4) unsigned DEFAULT NULL,
  `device_role_of_establishment` tinyint(4) unsigned DEFAULT NULL,
  `device_class_name` char(1) DEFAULT NULL,
  `device_type` tinyint(4) unsigned DEFAULT NULL,
  `device_risk_type_id` int(11) unsigned DEFAULT NULL,
  `device_risk_rule_id` int(11) unsigned DEFAULT NULL,
  `device_risk_rule_detail_id` int(11) unsigned DEFAULT NULL,
  `device_category` varchar(24) DEFAULT NULL,
  `device_discipline` varchar(24) DEFAULT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_proprietary_brand` varchar(255) DEFAULT NULL,
  `device_model` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `device_for_export` tinyint(4) unsigned DEFAULT NULL,
  `device_is_combination_product` tinyint(4) unsigned DEFAULT NULL,
  `device_contains_active_ingredient` tinyint(4) unsigned DEFAULT NULL,
  `device_description` blob DEFAULT NULL,
  `device_intended_use` text DEFAULT NULL,
  `device_hsdn_code` varchar(64) DEFAULT NULL,
  `device_gmdn_code` varchar(64) DEFAULT NULL,
  `device_unique_device_identifier` varchar(64) DEFAULT NULL,
  `device_umdns_code` varchar(64) DEFAULT NULL,
  `device_grouping_type` varchar(24) DEFAULT NULL,
  `device_grouping_type_child` varchar(24) DEFAULT NULL,
  `device_identifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `mdr_device_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping`;
CREATE TABLE `mdr_device_grouping` (
  `device_grouping_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned DEFAULT NULL,
  `device_product_identifier` varchar(255) DEFAULT NULL,
  `device_same_manufacturer` tinyint(4) unsigned DEFAULT NULL,
  `device_discipline` varchar(11) DEFAULT NULL,
  `device_category` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`device_grouping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping_family
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping_family`;
CREATE TABLE `mdr_device_grouping_family` (
  `device_family_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_family_name` varchar(255) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `device_grouping_type_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`device_family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping_family
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping_list
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping_list`;
CREATE TABLE `mdr_device_grouping_list` (
  `device_grouping_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned DEFAULT NULL,
  `device_grouping_product_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_product_model` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_permissible_variant` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_permissible_variant_details` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_device_identifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_brief_description` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_grouping_intended_purposes` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_systemmodel_id` int(11) unsigned DEFAULT NULL,
  `device_grouping_no` int(11) unsigned DEFAULT NULL,
  `device_grouping_list_checklist_value` int(11) unsigned DEFAULT NULL,
  `device_save_by_upload` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`device_grouping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping_list
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping_list_comment
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping_list_comment`;
CREATE TABLE `mdr_device_grouping_list_comment` (
  `device_grouping_list_comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_grouping_id` int(11) unsigned DEFAULT NULL,
  `device_grouping_ivd_id` int(11) unsigned DEFAULT NULL,
  `device_grouping_list_comment_details` text DEFAULT NULL,
  `device_grouping_list_comment_datetime` datetime DEFAULT '1000-01-01 00:00:00',
  `user_id` int(11) unsigned DEFAULT NULL,
  `application_status_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`device_grouping_list_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping_list_comment
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping_list_ivd_cluster
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping_list_ivd_cluster`;
CREATE TABLE `mdr_device_grouping_list_ivd_cluster` (
  `device_grouping_ivd_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned DEFAULT NULL,
  `ivd_cluster_id` int(11) unsigned DEFAULT NULL,
  `name_as_per_device_label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `intended_purpose_of_the_device` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `name_of_reagent_or_article_as_per_label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_type_reagant` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `identifier_of_reagent_or_article_product_code` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `brief_description_of_reagent_or_article` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `name_and_address_of_manufacturing_site` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `iso_certificate_number` varchar(255) DEFAULT NULL,
  `iso_certificate_issuing_agency` varchar(255) DEFAULT NULL,
  `iso_certificate_expiry_date` varchar(255) DEFAULT NULL,
  `sterility` varchar(255) DEFAULT NULL,
  `method_of_sterilisation` varchar(255) DEFAULT NULL,
  `sterilisation_validation_report_provided` varchar(255) DEFAULT NULL,
  `proposed_shelf_life` varchar(255) DEFAULT NULL,
  `device_grouping_list_checklist_value` int(11) unsigned DEFAULT NULL,
  `device_save_by_upload` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`device_grouping_ivd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping_list_ivd_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for mdr_device_grouping_system_model
-- ----------------------------
DROP TABLE IF EXISTS `mdr_device_grouping_system_model`;
CREATE TABLE `mdr_device_grouping_system_model` (
  `device_systemmodel_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_systemmodel_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_systemmodel_identifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `device_systemmodel_name_model` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `device_grouping_type_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`device_systemmodel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mdr_device_grouping_system_model
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1517828458');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1517828459');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1517828527');
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1517828527');

-- ----------------------------
-- Table structure for organisation
-- ----------------------------
DROP TABLE IF EXISTS `organisation`;
CREATE TABLE `organisation` (
  `organisation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(255) DEFAULT NULL,
  `organisation_registration_no` varchar(255) NOT NULL,
  `organisation_address` varchar(255) DEFAULT NULL,
  `organisation_country_id` int(11) unsigned DEFAULT NULL,
  `organisation_state_id` int(11) unsigned DEFAULT NULL,
  `organisation_city_id` int(11) unsigned DEFAULT NULL,
  `organisation_postcode` varchar(255) DEFAULT NULL,
  `organisation_telephone` varchar(255) DEFAULT NULL,
  `organisation_fax` varchar(255) DEFAULT NULL,
  `organisation_email` varchar(255) DEFAULT NULL,
  `organisation_account_type_for` int(11) unsigned NOT NULL DEFAULT 0,
  `organisation_type` tinyint(2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`organisation_id`),
  KEY `organisation_state_id` (`organisation_state_id`),
  KEY `organisation_country_id` (`organisation_country_id`),
  KEY `organisation_district_id` (`organisation_city_id`),
  KEY `organisation_country_id_2` (`organisation_country_id`),
  KEY `organisation_state_id_2` (`organisation_state_id`),
  KEY `organisation_city_id` (`organisation_city_id`),
  CONSTRAINT `organisation_ibfk_1` FOREIGN KEY (`organisation_country_id`) REFERENCES `master_country` (`country_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `organisation_ibfk_2` FOREIGN KEY (`organisation_state_id`) REFERENCES `master_state` (`state_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `organisation_ibfk_3` FOREIGN KEY (`organisation_city_id`) REFERENCES `master_city` (`city_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of organisation
-- ----------------------------

-- ----------------------------
-- Table structure for pelan_nombor_telefon_malaysia
-- ----------------------------
DROP TABLE IF EXISTS `pelan_nombor_telefon_malaysia`;
CREATE TABLE `pelan_nombor_telefon_malaysia` (
  `pelan_no` varchar(9) NOT NULL,
  `pelan_nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pelan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pelan_nombor_telefon_malaysia
-- ----------------------------
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('010', 'DIGI, XOX, Tune Talk');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-10', 'P1, Redtone Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-11', 'U Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-12', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-13', 'XOX, Salamfone');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-14', 'Maxis, Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-15', 'Tune Talk, Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-16', 'DiGi, Tron');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-17', 'Yes 4G, Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-18', 'M, Celcom, Tune Talk');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-19', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-20', 'Tron, XOX');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-22\r\n', 'Clixster Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('011-23', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('012', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('013', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-2', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-3', 'DiGi');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-5', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-6', '	DiGi');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-7', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-8', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('014-9', 'DiGi');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('015-2', 'BluePack Network (5Ghz Internet & VOIP)');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('015-3', '	B&E Wireless Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('015-4', 'Celcom, TM Net, Jaring, Redtone Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('015-5', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('015-6', 'Celcom');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('016', 'DiGi');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('017', 'Maxis');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('018', 'U Mobile');
INSERT INTO `pelan_nombor_telefon_malaysia` VALUES ('019', 'Celcom');

-- ----------------------------
-- Table structure for uploaded
-- ----------------------------
DROP TABLE IF EXISTS `uploaded`;
CREATE TABLE `uploaded` (
  `image_id` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of uploaded
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `organisation_id` int(11) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `birth_country` int(11) DEFAULT NULL,
  `birth_state` int(11) DEFAULT NULL,
  `birth_city` int(11) DEFAULT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  KEY `user_ibfk_1` (`organisation_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`organisation_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'dunocymyso', 'uZEJcicMaxcGSaRYNE-AsVadgHxu_3Ny', '$2y$13$3j4eBZe25OdDHPH6Y09HQeO3CinBPqakve.bKZe8LCtb018etyJLG', null, 'jupihohup@yahoo.com', '10', '1517902136', '1517902136', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'admin', '2bTAo1zJWr4KDRxT9lUYtAUmoylVZ_YN', '$2y$13$dD/3x0J2P/QF6dtGrPU4oOZslbyNMj7NC8B3tf43KxsB/M7ti3m5O', null, 'admin@admin.com', '10', '1518077494', '1518077494', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'farhan', 'RkuhD6QCshyHwrJDo_HKvn1V8Cx-rOPO', '$2y$13$gBp2HLPHmN.dbvuqsv.BXO7qINd/ok1nSk9irVfZAx3uvTDn8oyWi', null, 'farhan.unijaya@gmail.com', '10', '1518143283', '1518143283', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'zoqysud', 'jE4CRiMlGe9QzDkaMkSkUN1ZbSphDE_s', '$2y$13$y.CO.3z8OrTjXOmoylt7supI/CIKq5Len5wXVZw.qAVYhivJLM4Jm', null, 'zivagycove@hotmail.com', '10', '1518603488', '1518603488', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'dilapy', 'TAEed-6XpuaL-Q2QCpxBCkUJGRrCSuUm', '$2y$13$ELb1pnBxFWNe4zqG6mQ4OOmzlHi0HXnweDbZHYzxtDX7f.eY/fb9m', null, 'qozi@hotmail.com', '10', '1518604200', '1518604200', null, 'Damon', 'Ruiz', '2006-07-24 00:00:00', '179', null, null, 'M', '019-382-4192', '03-6177-5205');
INSERT INTO `user` VALUES ('6', 'hurycexoc', 'aiFr1InZhxOssSVyG2LT1XD31p09LMGT', '$2y$13$dazF8MZts92J0bG1cn7.oehqodLDwQgJzMtgd6fZrooX9b9/5HoPy', null, 'gujupitu@hotmail.com', '10', '1518604298', '1518604298', null, 'Bert', 'Mercado', '2006-02-20 00:00:00', '238', null, null, 'O', '019-382-4192', '03-6177-5205');
