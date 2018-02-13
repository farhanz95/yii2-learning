/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : medcast_v2

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-09 10:30:56
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
  `application_return_from_establishment` int(11) unsigned DEFAULT NULL,
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
  KEY `application_status_id` (`application_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=latin1;
