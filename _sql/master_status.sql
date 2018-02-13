/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 100203
Source Host           : localhost:3306
Source Database       : medcast_v2

Target Server Type    : MYSQL
Target Server Version : 100203
File Encoding         : 65001

Date: 2018-02-09 10:31:57
*/

SET FOREIGN_KEY_CHECKS=0;

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
