/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : medcast_v2

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-09 10:29:25
*/

SET FOREIGN_KEY_CHECKS=0;

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
  KEY `application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=116946 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4088 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2065 DEFAULT CHARSET=latin1;
