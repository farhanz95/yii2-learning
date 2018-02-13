/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : medcast_v2

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-09 10:44:28
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=3988 DEFAULT CHARSET=latin1;
