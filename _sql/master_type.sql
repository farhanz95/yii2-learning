/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : medcast_v2

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-09 10:31:45
*/

SET FOREIGN_KEY_CHECKS=0;

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
