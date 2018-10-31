/*
Navicat MySQL Data Transfer

Source Server         : ZHENG
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : admin_cloud_db

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-10-31 09:55:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_test
-- ----------------------------
DROP TABLE IF EXISTS `admin_test`;
CREATE TABLE `admin_test` (
  `user_no` varchar(20) DEFAULT NULL COMMENT '注释',
  `id_no` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_no`),
  UNIQUE KEY `id_no` (`id_no`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='测试表';

-- ----------------------------
-- Records of admin_test
-- ----------------------------
INSERT INTO `admin_test` VALUES ('23232', '3');
INSERT INTO `admin_test` VALUES ('323232', '4');
INSERT INTO `admin_test` VALUES ('323232', '5');
INSERT INTO `admin_test` VALUES ('2323232', '6');
INSERT INTO `admin_test` VALUES ('23232', '7');
INSERT INTO `admin_test` VALUES ('232323', '8');
INSERT INTO `admin_test` VALUES ('2323232', '9');
INSERT INTO `admin_test` VALUES ('323232', '10');
INSERT INTO `admin_test` VALUES ('2323232', '11');
INSERT INTO `admin_test` VALUES ('32323232', '12');
INSERT INTO `admin_test` VALUES ('223232', '13');

-- ----------------------------
-- Table structure for base_agent
-- ----------------------------
DROP TABLE IF EXISTS `base_agent`;
CREATE TABLE `base_agent` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '11111',
  `name` varchar(255) DEFAULT NULL COMMENT '代理商名称',
  `address` varchar(255) DEFAULT NULL COMMENT '代理商地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_agent
-- ----------------------------

-- ----------------------------
-- Table structure for base_contractinfo
-- ----------------------------
DROP TABLE IF EXISTS `base_contractinfo`;
CREATE TABLE `base_contractinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `contract_no` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '合同号',
  `contract_name` varchar(255) DEFAULT NULL COMMENT '合同名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_contractinfo
-- ----------------------------
INSERT INTO `base_contractinfo` VALUES ('2', '1', '122211');
INSERT INTO `base_contractinfo` VALUES ('3', '232', '23');
INSERT INTO `base_contractinfo` VALUES ('4', '22', '222');
INSERT INTO `base_contractinfo` VALUES ('5', '3', '3');

-- ----------------------------
-- Table structure for base_custaddr
-- ----------------------------
DROP TABLE IF EXISTS `base_custaddr`;
CREATE TABLE `base_custaddr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='客户地址信息';

-- ----------------------------
-- Records of base_custaddr
-- ----------------------------
INSERT INTO `base_custaddr` VALUES ('1', '121213333', '21212123232');
INSERT INTO `base_custaddr` VALUES ('2', '1', '1');

-- ----------------------------
-- Table structure for base_element
-- ----------------------------
DROP TABLE IF EXISTS `base_element`;
CREATE TABLE `base_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_element
-- ----------------------------
INSERT INTO `base_element` VALUES ('3', 'userManager:btn_add', 'button', '新增', '/back/user', '1', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('4', 'userManager:btn_edit', 'button', '编辑', '/back/user', '1', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('5', 'userManager:btn_del  ', 'button', '删除', '/back/user', '1', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('9', 'menuManager:element', 'uri', '按钮页面', '/admin/element', '6', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('10', 'menuManager:btn_add', 'button', '新增', '/back/menu', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('11', 'menuManager:btn_edit', 'button', '编辑', '/back/menu', '6', '', '', 'PUT', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('12', 'menuManager:btn_del  ', 'button', '删除', '/back/menu', '6', '', '', 'DELETE', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('13', 'menuManager:btn_element_add', 'button', '新增元素', '/back/element', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('14', 'menuManager:btn_element_edit', 'button', '编辑元素', '/back/element', '6', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('15', 'btn_element_del', 'button', '删除元素', '/back/element', '6', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('16', 'groupManager:btn_add', 'button', '新增', '/back/group', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('17', 'groupManager:btn_edit', 'button', '编辑', '/back/group', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('18', 'groupManager:btn_del', 'button', '删除', '/back/group', '7', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('19', 'groupManager:btn_userManager', 'button', '分配用户', '/back/group/{*}/user', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('20', 'groupManager:btn_resourceManager', 'button', '分配权限', '/back/group/{*}/authority', '7', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('21', 'groupManager:menu', 'uri', '分配菜单', '/back/group/{*}/authority/menu', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('22', 'groupManager:element', 'uri', '分配资源', '/back/group/{*}/authority/element', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('23', 'userManager:view  ', 'uri', '查看', '/back/user', '1', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('24', 'menuManager:view', 'uri', '查看', '/back/menu', '6', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('27', 'menuManager:element_view', 'uri', '查看', '/back/element', '6', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('28', 'groupManager:view', 'uri', '查看', '/back/group', '7', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('30', 'adminAPI:view', 'uri', '查看', '/back/swagger', '23', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('31', 'adminAPI:swagger', 'uri', '查看', '/back/v2', '23', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('32', 'groupTypeManager:view', 'uri', '查看', '/back/groupType', '8', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('33', 'groupTypeManager:btn_add', 'button', '新增', '/back/groupType', '8', null, null, 'POST', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('34', 'groupTypeManager:btn_edit', 'button', '编辑', '/back/groupType', '8', null, null, 'PUT', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('35', 'groupTypeManager:btn_del', 'button', '删除', '/back/groupType', '8', null, null, 'DELETE', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('40', 'adminAPI:swagger_resources', 'uri', '查看', '/back/swagger-resources', '23', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('41', 'gateLogManager:view', 'button', '查看', '/back/gateLog', '27', null, null, 'GET', '', '2017-07-01 00:00:00', '1', 'admin', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('42', 'testManager:view', 'uri', '查看', '/back/test', '28', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('44', 'testManager:btn_add', 'button', '新增', '/back/test', '28', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('45', 'testManager:btn_edit', 'button', '编辑', '/back/test', '28', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('46', 'testManager:btn_del', 'button', '删除', '/back/test', '28', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('47', 'test', 'button', 'test', '22', '29', null, null, 'GET', '', '2017-08-31 15:50:56', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('48', '212', 'button', '3121', 'ewew', '29', null, null, 'GET', '', '2017-08-31 15:51:06', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('49', 'linkmanManager:view', 'uri', '查看', '/back/linkman', '30', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('50', 'linkmanManager:btn_add', 'button', '新增', '/back/linkman', '30', null, null, 'POST', '', '2017-09-03 14:18:30', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('51', 'linkmanManager:btn_edit', 'button', '编辑', '/back/linkman', '30', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('52', 'linkmanManager:btn_del', 'button', '删除', '/back/linkman', '30', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('53', 'generateManager:view', 'uri', '查看', '/back/generate', '31', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('54', 'generateManager:btn_add', 'button', '新增', '/back/generate', '31', null, null, 'POST', '', '2017-09-03 17:22:07', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('55', 'generateManager:btn_edit', 'button', '编辑', '/back/generate', '31', null, null, 'PUT', '', '2017-09-03 17:22:59', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('56', 'generateManager:del', 'button', '删除', '/back/generate', '31', null, null, 'DELETE', '', '2017-09-03 17:23:24', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('57', 'custaddrManager:view', 'uri', '查看', '/back/custaddr', '32', null, null, 'GET', '', '2017-09-08 09:20:09', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('58', 'custaddrManager:view', 'uri', '查看', '/back/custaddr', '34', null, null, 'GET', null, '2017-09-08 09:49:04', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('59', 'custaddrManager:btn_add', 'button', '新增', '/back/custaddr', '34', null, null, 'POST', null, '2017-09-08 09:49:04', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('60', 'custaddrManager:btn_edit', 'button', '编辑', '/back/custaddr', '34', null, null, 'PUT', null, '2017-09-08 09:49:04', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('61', 'custaddrManager:btn_del', 'button', '删除', '/back/custaddr', '34', null, null, 'DELETE', null, '2017-09-08 09:49:04', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('62', 'groupmsgManager:view', 'uri', '查看', '/back/groupmsg', '35', null, null, 'GET', null, '2017-09-08 10:33:00', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('63', 'groupmsgManager:btn_add', 'button', '新增', '/back/groupmsg', '35', null, null, 'POST', null, '2017-09-08 10:33:00', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('64', 'groupmsgManager:btn_edit', 'button', '编辑', '/back/groupmsg', '35', null, null, 'PUT', null, '2017-09-08 10:33:00', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('65', 'groupmsgManager:btn_del', 'button', '删除', '/back/groupmsg', '35', null, null, 'DELETE', null, '2017-09-08 10:33:00', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('84', 'testidManager:view', 'uri', '查看', '/back/testid', '41', null, null, 'GET', null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('85', 'testidManager:btn_add', 'button', '新增', '/back/testid', '41', null, null, 'POST', null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('86', 'testidManager:btn_edit', 'button', '编辑', '/back/testid', '41', null, null, 'PUT', null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('87', 'testidManager:btn_del', 'button', '删除', '/back/testid', '41', null, null, 'DELETE', null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('88', 'contractinfoManager:view', 'uri', '查看', '/back/contractinfo', '42', null, null, 'GET', null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('89', 'contractinfoManager:btn_add', 'button', '新增', '/back/contractinfo', '42', null, null, 'POST', null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('90', 'contractinfoManager:btn_edit', 'button', '编辑', '/back/contractinfo', '42', null, null, 'PUT', null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('91', 'contractinfoManager:btn_del', 'button', '删除', '/back/contractinfo', '42', null, null, 'DELETE', null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_generate
-- ----------------------------
DROP TABLE IF EXISTS `base_generate`;
CREATE TABLE `base_generate` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tabname` varchar(255) DEFAULT NULL COMMENT '表名',
  `tabdesc` varchar(255) DEFAULT NULL COMMENT '描述',
  `generatedir` varchar(500) DEFAULT NULL COMMENT '代码生成路径',
  `generated` varchar(10) DEFAULT NULL COMMENT '程序生成标记',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_generate
-- ----------------------------
INSERT INTO `base_generate` VALUES ('1', 'base_agent', '代理商信息', 'D:/geek_qi-ace-security-master/ace-security/', 'Y', '2018-10-26 21:16:56');
INSERT INTO `base_generate` VALUES ('2', 'base_groupmsg', '渠道基本信息', 'D:/geek_qi-ace-security-master/admin-cloud-sysem', 'Y', '2018-10-16 17:24:10');
INSERT INTO `base_generate` VALUES ('3', 'base_testid', '1111', 'D:/geek_qi-ace-security-master/admin-cloud-sysem', 'Y', '2018-09-26 14:16:32');
INSERT INTO `base_generate` VALUES ('4', 'base_contractinfo', '合同信息表', 'D:/geek_qi-ace-security-master/admin-cloud-sysem', 'Y', '2018-10-26 22:01:49');
INSERT INTO `base_generate` VALUES ('5', 'base_linkman', '联系人信息', 'D:/geek_qi-ace-security-master/admin-cloud-sysem/', 'Y', '2018-10-26 22:01:15');

-- ----------------------------
-- Table structure for base_group
-- ----------------------------
DROP TABLE IF EXISTS `base_group`;
CREATE TABLE `base_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `group_type` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group
-- ----------------------------
INSERT INTO `base_group` VALUES ('1', 'adminRole', '管理员', '-1', '/adminRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('3', 'testGroup', '体验组', '-1', '/testGroup', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('4', 'visitorRole', '游客', '3', '/testGroup/visitorRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('6', 'company', 'AG集团', '-1', '/company', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('7', 'financeDepart', '财务部', '6', '/company/financeDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('8', 'hrDepart', '人力资源部', '6', '/company/hrDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_groupmsg
-- ----------------------------
DROP TABLE IF EXISTS `base_groupmsg`;
CREATE TABLE `base_groupmsg` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupcode` varchar(255) DEFAULT NULL COMMENT '渠道编码',
  `groupname` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `classname` varchar(255) DEFAULT NULL COMMENT '渠道类型',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系号码',
  `addr` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `born` date DEFAULT NULL COMMENT '生日',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_groupmsg
-- ----------------------------
INSERT INTO `base_groupmsg` VALUES ('3', 'r', 'r', 'r', 'r', 'r', '2018-10-07', null);
INSERT INTO `base_groupmsg` VALUES ('4', '44', '44', '44', '44', '44', '2018-10-01', null);
INSERT INTO `base_groupmsg` VALUES ('6', '222', '222', '222', '22', '22', '2018-10-15', null);
INSERT INTO `base_groupmsg` VALUES ('7', '4', '4', '4', '4', '4', '2018-10-14', '2018-10-18 15:38:27');

-- ----------------------------
-- Table structure for base_group_leader
-- ----------------------------
DROP TABLE IF EXISTS `base_group_leader`;
CREATE TABLE `base_group_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_leader
-- ----------------------------
INSERT INTO `base_group_leader` VALUES ('4', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_member
-- ----------------------------
DROP TABLE IF EXISTS `base_group_member`;
CREATE TABLE `base_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_member
-- ----------------------------
INSERT INTO `base_group_member` VALUES ('2', '4', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_member` VALUES ('6', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_member` VALUES ('7', '1', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_type
-- ----------------------------
DROP TABLE IF EXISTS `base_group_type`;
CREATE TABLE `base_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_type
-- ----------------------------
INSERT INTO `base_group_type` VALUES ('1', null, '角色类型', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('2', 'depart', '部门类型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('3', null, '自定义类型', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_linkman
-- ----------------------------
DROP TABLE IF EXISTS `base_linkman`;
CREATE TABLE `base_linkman` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  `born` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_linkman
-- ----------------------------
INSERT INTO `base_linkman` VALUES ('6', '李四1', '2018-10-11 00:00:00', '2018-10-17', '13060500055111');
INSERT INTO `base_linkman` VALUES ('14', '李四1', null, null, '13060500055');
INSERT INTO `base_linkman` VALUES ('15', '李四1', null, null, '13060500055');
INSERT INTO `base_linkman` VALUES ('16', '李四1', null, null, '13060500055');
INSERT INTO `base_linkman` VALUES ('17', '11', null, null, '11');
INSERT INTO `base_linkman` VALUES ('18', '2121', null, null, '2121');
INSERT INTO `base_linkman` VALUES ('19', '22', null, null, '22');
INSERT INTO `base_linkman` VALUES ('20', '222', null, null, '222');
INSERT INTO `base_linkman` VALUES ('21', '33', null, null, '33');
INSERT INTO `base_linkman` VALUES ('22', '22', null, null, '11');
INSERT INTO `base_linkman` VALUES ('23', '111', null, null, '111');
INSERT INTO `base_linkman` VALUES ('24', '11', null, null, '11');
INSERT INTO `base_linkman` VALUES ('25', '11', null, null, '11');
INSERT INTO `base_linkman` VALUES ('26', '1', null, null, '1');
INSERT INTO `base_linkman` VALUES ('27', '111', null, null, '111');
INSERT INTO `base_linkman` VALUES ('28', '22', null, null, '22');
INSERT INTO `base_linkman` VALUES ('29', '444', null, null, '44');
INSERT INTO `base_linkman` VALUES ('30', '44', null, null, '44');
INSERT INTO `base_linkman` VALUES ('31', '11', null, null, '11');
INSERT INTO `base_linkman` VALUES ('32', '22', null, null, '22');
INSERT INTO `base_linkman` VALUES ('33', '22', null, null, '22');
INSERT INTO `base_linkman` VALUES ('34', '22', null, null, '22');
INSERT INTO `base_linkman` VALUES ('35', '1', null, null, '11');
INSERT INTO `base_linkman` VALUES ('36', '44', null, null, '45454');
INSERT INTO `base_linkman` VALUES ('37', '45454', null, null, '5454');
INSERT INTO `base_linkman` VALUES ('38', '56', null, null, '56565');
INSERT INTO `base_linkman` VALUES ('39', '3232', null, null, '3232');
INSERT INTO `base_linkman` VALUES ('40', '12312', null, null, '13053088037');
INSERT INTO `base_linkman` VALUES ('41', '3232', null, null, '13053088037');
INSERT INTO `base_linkman` VALUES ('42', '111', null, null, '111');
INSERT INTO `base_linkman` VALUES ('43', '3', '2018-10-02 00:00:00', '2018-10-16', '3');

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `order_num` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL COMMENT '是否快捷方式',
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES ('1', 'userManager', '用户管理', '5', '/admin/user', 'fa fa-user', null, '0', '', '/adminSys/baseManager/userManager', null, null, null, null, null, '2018-10-23 10:34:13', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('5', 'baseManager', '基础配置管理', '13', '', 'fa fa-cog fa-spin', null, '0', '', '/adminSys/baseManager', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('6', 'menuManager', '菜单管理', '5', '/admin/menu', 'fa fa-list', null, '0', '', '/adminSys/baseManager/menuManager', null, null, null, null, null, '2018-10-22 15:35:27', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('7', 'groupManager', '角色组管理', '5', '/admin/group', 'fa fa-users', null, '0', '', '/adminSys/baseManager/groupManager', null, null, null, null, null, '2018-10-23 09:35:53', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('8', 'groupTypeManager', '角色类型管理', '5', '/admin/groupType', 'fa fa-address-card-o', null, '0', '', '/adminSys/baseManager/groupTypeManager', null, null, null, null, null, '2018-10-23 09:36:00', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('9', 'monitorManager', '系统监控', '13', '', 'fa fa-area-chart', null, '0', '', '/adminSys/monitorManager', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('10', 'bootMonitor', 'Spring-Boot监控', '9', 'http://localhost:8764/', 'fa fa-line-chart', null, '0', '', '/adminSys/monitorManager/bootMonitor', null, null, null, null, null, '2018-10-22 16:39:44', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('11', 'hystrixMonitor', 'Hystrix监控', '9', 'http://localhost:8764/hystrix', 'fa fa-bar-chart', null, '0', '', '/adminSys/monitorManager/hystrixMonitor', null, null, null, null, null, '2018-10-22 16:39:53', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('13', 'adminSys', '权限管理系统', '-1', '', 'fa fa-terminal', null, '0', '', '/adminSys', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('14', 'contentSys', '内容管理系统', '-1', '', 'fa-newspaper-o', null, '0', '', '/contentSys', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('17', 'articleManger', '文章管理', '20', '/test/monitor', '', null, '0', '', '/contentSys/artComManger/articleManger', null, null, null, null, null, '2018-10-23 09:37:14', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('18', 'commentManager', '评论管理', '20', '', '', null, '0', '', '/contentSys/artComManger/commentManager', null, null, null, null, null, '2018-10-23 09:36:59', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('20', 'artComManger', '文章评论管理', '14', '', 'fa fa-bookmark', null, '0', '', '/contentSys/artComManger', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('21', 'dictManager', '数据字典', '5', '', 'fa fa-book', null, '0', '', '/adminSys/baseManager/dictManager', null, null, null, null, null, '2018-10-23 09:36:07', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('22', 'apiManager', '服务端api文档', '13', '', 'fa fa-folder', null, '0', '', '/adminSys/apiManager', null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('23', 'adminAPI', 'Admin Rest API', '22', '/back/swagger-ui.html', 'fa fa-file-code-o', null, '0', '', '/adminSys/apiManager/adminAPI', null, null, null, null, null, '2018-10-23 09:36:39', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('24', 'druidMonitor', 'Admin Druid数据监控', '9', '/back/druid/datasource.html', 'fa fa-line-chart', null, '0', '', '/adminSys/monitorManager/druidMonitor', null, null, null, null, null, '2018-10-23 09:36:30', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('27', 'gateLogManager', '操作日志', '5', '/admin/gateLog', 'fa fa-book', null, '0', '', '/adminSys/baseManager/gateLogManager', null, null, null, null, null, '2018-10-22 15:35:37', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('30', 'linkmanManager', '联系人管理', '5', '/admin/linkman', ' fa fa-user', null, '0', '', '/adminSys/baseManager/linkmanManager', null, null, null, null, null, '2018-10-23 09:36:14', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('31', 'generateManager', '代码生成器', '5', '/admin/generate', 'fa-pencil-square-o', null, '0', '', '/adminSys/baseManager/generateManager', null, null, null, null, null, '2018-10-22 09:33:53', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('34', 'custaddrManager', '客户地址', '5', '/admin/custaddr', '', null, '0', '', '/adminSys/baseManager/custaddrManager', null, null, null, null, null, '2018-10-22 15:54:46', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('35', 'groupmsgManager', '渠道信息管理', '5', '/admin/groupmsg', 'bath', null, '0', '', '/adminSys/baseManager/groupmsgManager', null, null, null, null, null, '2018-10-22 15:35:44', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('42', 'contractinfoManager', '合同信息维护', '5', '/admin/contractinfo', '', null, '0', '', '/adminSys/baseManager/contractinfoManager', null, null, null, null, null, '2018-10-22 15:54:37', '1', '管理员', '0:0:0:0:0:0:0:1', 'Y', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_resource_authority
-- ----------------------------
DROP TABLE IF EXISTS `base_resource_authority`;
CREATE TABLE `base_resource_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_id` varchar(255) DEFAULT NULL,
  `authority_type` varchar(255) DEFAULT NULL,
  `resource_id` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_resource_authority
-- ----------------------------
INSERT INTO `base_resource_authority` VALUES ('285', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('286', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('287', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('288', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('289', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('290', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('291', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('292', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('293', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('294', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('295', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('296', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('297', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('298', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('299', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('300', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('301', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('302', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('303', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('304', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('305', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('306', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('307', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('308', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('309', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('310', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('311', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('312', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('314', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('315', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('316', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('317', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('318', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('319', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('349', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('371', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('372', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('373', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('374', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('375', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('376', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('377', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('378', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('379', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('380', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('381', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('382', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('383', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('384', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('385', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('386', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('387', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('389', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('390', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('391', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('392', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('393', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('394', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('395', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('396', '4', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('397', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('398', '4', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('399', '4', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('400', '4', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('401', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('402', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('403', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('421', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('422', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('423', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('424', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('436', '1', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('437', '1', 'group', '33', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('438', '1', 'group', '34', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('439', '1', 'group', '35', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('440', '4', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('464', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('465', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('466', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('467', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('468', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('469', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('470', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('471', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('492', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('493', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('516', '4', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('517', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('518', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('612', '4', 'group', '36', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('628', '4', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('629', '4', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('630', '4', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('631', '4', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('632', '4', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('633', '4', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('634', '4', 'group', '27', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('635', '4', 'group', '9', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('636', '4', 'group', '24', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('637', '4', 'group', '22', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('638', '4', 'group', '23', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('639', '4', 'group', '25', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('640', '4', 'group', '26', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('641', '4', 'group', '28', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('666', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('706', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('707', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('708', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('709', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('710', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('711', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('712', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('713', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('714', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('715', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('716', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('717', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('718', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('720', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('721', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('722', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('723', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('724', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('725', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('726', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('727', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('728', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('729', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('730', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('731', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('732', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('733', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('734', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('735', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('736', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('737', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('738', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('739', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('741', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('742', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('743', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('744', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('745', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('746', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('747', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('748', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('750', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('751', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('752', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('753', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('755', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('756', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('757', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('758', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('759', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('760', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('761', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('762', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('763', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('764', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('765', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('766', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('767', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('768', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('769', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('770', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('771', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('772', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('773', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('774', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('775', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('776', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('777', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('778', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('779', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('780', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('781', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('826', '1', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('845', '1', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('846', '1', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('847', '1', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('848', '1', 'group', '46', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('887', '1', 'group', '49', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('888', '1', 'group', '50', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('889', '1', 'group', '51', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('890', '1', 'group', '52', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('910', '1', 'group', '49', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('911', '1', 'group', '50', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('912', '1', 'group', '52', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('913', '1', 'group', '51', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('914', '1', 'group', '53', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('915', '1', 'group', '54', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('916', '1', 'group', '55', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('917', '1', 'group', '56', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('956', '1', 'group', '58', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('957', '1', 'group', '59', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('958', '1', 'group', '60', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('959', '1', 'group', '61', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1001', '1', 'group', '62', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1002', '1', 'group', '63', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1003', '1', 'group', '64', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1004', '1', 'group', '65', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1048', '1', 'group', '66', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1049', '1', 'group', '67', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1050', '1', 'group', '68', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1051', '1', 'group', '69', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1096', '1', 'group', '70', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1097', '1', 'group', '71', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1098', '1', 'group', '72', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1099', '1', 'group', '73', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1100', '1', 'group', '72', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1101', '1', 'group', '70', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1102', '1', 'group', '71', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1103', '1', 'group', '73', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1104', '1', 'group', '58', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1105', '1', 'group', '59', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1106', '1', 'group', '61', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1107', '1', 'group', '60', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1108', '1', 'group', '70', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1109', '1', 'group', '73', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1110', '1', 'group', '72', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1111', '1', 'group', '71', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1112', '1', 'group', '73', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1113', '1', 'group', '71', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1114', '1', 'group', '72', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1115', '1', 'group', '70', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1116', '1', 'uri', '75', 'group', '-1', null, null, '2018-09-28 16:12:27', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1117', '1', 'button', '76', 'group', '-1', null, null, '2018-09-28 16:12:27', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1118', '1', 'button', '77', 'group', '-1', null, null, '2018-09-28 16:12:27', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1119', '1', 'button', '78', 'group', '-1', null, null, '2018-09-28 16:12:27', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1142', '1', 'group', '75', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1143', '1', 'group', '76', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1144', '1', 'group', '77', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1145', '1', 'group', '78', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1169', '1', 'group', '81', 'button', '-1', null, null, '2018-09-28 19:46:26', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1170', '1', 'group', '82', 'button', '-1', null, null, '2018-09-28 19:46:26', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1171', '1', 'group', '83', 'button', '-1', null, null, '2018-09-28 19:46:26', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1172', '1', 'group', '81', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1173', '1', 'group', '82', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1174', '1', 'group', '83', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1175', '1', 'group', '80', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1198', '1', 'group', '81', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1199', '1', 'group', '82', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1200', '1', 'group', '83', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1201', '1', 'group', '80', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1202', '1', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1203', '1', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1204', '1', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1205', '1', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1206', '1', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1207', '1', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1208', '1', 'group', '27', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1209', '1', 'group', '30', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1210', '1', 'group', '31', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1211', '1', 'group', '34', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1212', '1', 'group', '35', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1214', '1', 'group', '9', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1215', '1', 'group', '10', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1216', '1', 'group', '11', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1217', '1', 'group', '24', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1218', '1', 'group', '22', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1219', '1', 'group', '23', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1220', '1', 'group', '14', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1221', '1', 'group', '20', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1222', '1', 'group', '17', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1223', '1', 'group', '18', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1224', '1', 'group', '41', 'menu', '-1', null, null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1225', '1', 'group', '84', 'button', '-1', null, null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1226', '1', 'group', '85', 'button', '-1', null, null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1227', '1', 'group', '86', 'button', '-1', null, null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1228', '1', 'group', '87', 'button', '-1', null, null, '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1229', '1', 'group', '42', 'menu', '-1', null, null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1230', '1', 'group', '88', 'button', '-1', null, null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1231', '1', 'group', '89', 'button', '-1', null, null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1232', '1', 'group', '90', 'button', '-1', null, null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1233', '1', 'group', '91', 'button', '-1', null, null, '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1234', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1235', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1236', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1237', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1238', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1239', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1240', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1241', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1242', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1243', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1244', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1245', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1246', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1247', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1249', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1250', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1251', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1252', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1253', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1254', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1255', '1', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1256', '1', 'group', '35', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1257', '1', 'group', '33', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1258', '1', 'group', '34', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1259', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1260', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1261', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1262', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1263', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1264', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1265', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1266', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1267', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1268', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1269', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1270', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1272', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1273', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1274', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1275', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1276', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1277', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1278', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1279', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1280', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1281', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1282', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1283', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1284', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1285', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1286', '1', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1287', '1', 'group', '35', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1288', '1', 'group', '33', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1289', '1', 'group', '34', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1291', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1292', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1293', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1294', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1295', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1296', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('1297', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_testid
-- ----------------------------
DROP TABLE IF EXISTS `base_testid`;
CREATE TABLE `base_testid` (
  `id` int(11) DEFAULT NULL COMMENT '343243',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  `born` date DEFAULT NULL COMMENT '生日',
  `name` varchar(100) DEFAULT NULL COMMENT '343243'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_testid
-- ----------------------------
INSERT INTO `base_testid` VALUES ('11', null, null, '11');
INSERT INTO `base_testid` VALUES ('121', null, null, '1212');
INSERT INTO `base_testid` VALUES ('1', null, null, '11');
INSERT INTO `base_testid` VALUES ('1', null, null, '1');

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `tel_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES ('1', 'admin', '$2a$12$vmLOjOFzq5NT9IvbVL66DeWf0J6KS6XgJH1kkVfvCYdeW2bKUou8.', '管理员', '', null, '', null, '', '男', null, null, '', null, null, null, null, '2018-10-26 16:40:18', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('2', 'test', '$2a$12$zWe6knO6rGp15UVfdWTTxu.Ykt.k3QnD5FPoj6a1cnL63csHY2A1S', '测试账户', '', null, '', null, '', '男', null, null, '', null, null, null, null, '2017-07-15 19:18:07', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('3', 'test', '$2a$12$dbM45.9qn7jgTWC1RuN9FOt0rcykl6kx22IBS/TEzL06/.HjmSei.', 'test222', '', null, '', null, '', '男', null, null, '', null, null, null, null, '2017-08-31 15:03:22', '1', '����Ա', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gate_client
-- ----------------------------
DROP TABLE IF EXISTS `gate_client`;
CREATE TABLE `gate_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `locked` char(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gate_client
-- ----------------------------
INSERT INTO `gate_client` VALUES ('1', 'admin-ui', '$2a$12$zmM.eBOEpcp7wUfo7ypBSemy23bcGSEESLlIreg1FhHWV3ADoap/q', 'admin-ui', '0', '', null, '', '', '', '2017-07-07 21:51:32', '1', '管理员', '0:0:0:0:0:0:0:1', '', '', '', '', '', '', '', '');
INSERT INTO `gate_client` VALUES ('3', 'admin-api-gate', '$2a$12$03C/g.y/QHnDe8P90Oi3cOS1nViIb22EoRUoeK9cWALmv5NJi1sUC', 'admin-api-gate', '0', '', null, null, null, null, '2017-07-06 21:42:17', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gate_client_service
-- ----------------------------
DROP TABLE IF EXISTS `gate_client_service`;
CREATE TABLE `gate_client_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gate_client_service
-- ----------------------------
INSERT INTO `gate_client_service` VALUES ('20', '44', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gate_log
-- ----------------------------
DROP TABLE IF EXISTS `gate_log`;
CREATE TABLE `gate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) DEFAULT NULL,
  `opt` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gate_log
-- ----------------------------
INSERT INTO `gate_log` VALUES ('11', '用户管理', '编辑', '/back/user', '2017-07-01 21:13:09', '1', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('12', '客户端管理', '新增', '/back/gateClient', '2017-07-02 16:54:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('13', '客户端管理', '新增', '/back/gateClient', '2017-07-02 22:31:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('14', '客户端管理', '新增', '/back/gateClient', '2017-07-02 22:32:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('15', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 13:35:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('16', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 13:35:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('17', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 05:38:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('18', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 05:38:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('19', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 05:38:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('20', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 05:39:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('21', '菜单管理', '新增', '/back/menu', '2017-07-03 12:43:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('22', '角色组管理', '新增', '/back/group', '2017-07-03 12:43:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('23', '菜单管理', '新增元素', '/back/element', '2017-07-03 13:39:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('24', '菜单管理', '新增元素', '/back/element', '2017-07-03 13:43:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('25', '菜单管理', '新增元素', '/back/element', '2017-07-03 13:49:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('26', '角色组管理', '新增', '/back/group', '2017-07-03 13:52:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('27', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 14:08:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('28', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 14:56:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('29', '客户端管理', '编辑', '/back/gateClient', '2017-07-03 14:56:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('30', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:14:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('31', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:14:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('32', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:17:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('33', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:17:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('34', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:35:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('35', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:36:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('36', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:43:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('37', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:47:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('38', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:47:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('39', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:47:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('40', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:48:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('41', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:49:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('42', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:52:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('43', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 00:52:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('44', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:16:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('45', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:16:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('46', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:17:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('47', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:20:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('48', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:21:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('49', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:21:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('50', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:25:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('51', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:26:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('52', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:26:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('53', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:26:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('54', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:26:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('55', '客户端管理', '编辑', '/back/gateClient', '2017-07-04 05:29:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('56', '客户端管理', '编辑', '/back/gateClient', '2017-07-05 05:25:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('57', '客户端管理', '编辑', '/back/gateClient', '2017-07-05 05:30:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('58', '菜单管理', '编辑元素', '/back/element', '2017-07-05 05:33:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('59', '菜单管理', '编辑元素', '/back/element', '2017-07-05 05:38:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('60', '客户端管理', '编辑', '/back/gateClient', '2017-07-05 05:38:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('61', '菜单管理', '新增元素', '/back/element', '2017-07-05 05:42:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('62', '菜单管理', '删除元素', '/back/element', '2017-07-05 05:45:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('63', '菜单管理', '新增元素', '/back/element', '2017-07-06 05:46:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('64', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 05:47:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('65', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:40:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('66', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:42:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('67', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:42:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('68', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:42:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('69', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:43:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('70', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 13:43:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('71', '客户端管理', '删除', '/back/gateClient', '2017-07-06 13:44:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('72', '菜单管理', '编辑元素', '/back/element', '2017-07-06 15:13:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('73', '菜单管理', '编辑元素', '/back/element', '2017-07-06 15:13:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('74', '菜单管理', '编辑元素', '/back/element', '2017-07-06 15:13:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('75', '客户端管理', '编辑', '/back/gateClient', '2017-07-06 15:14:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('76', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('77', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('78', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('79', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('80', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('81', '角色组管理', '新增', '/back/group', '2017-07-07 01:43:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('82', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:37:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('83', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:40:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('84', '客户端管理', '新增', '/gate/client', '2017-07-07 02:40:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('85', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:40:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('86', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:40:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('87', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:40:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('88', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:40:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('89', '客户端管理', '编辑', '/gate/client', '2017-07-07 02:42:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('90', '客户端管理', '编辑', '/gate/client', '2017-07-07 03:26:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('91', '客户端管理', '编辑', '/gate/client', '2017-07-07 03:32:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('92', '客户端管理', '编辑', '/gate/client', '2017-07-07 03:32:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('93', '菜单管理', '新增元素', '/back/element', '2017-07-07 04:04:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('94', '菜单管理', '新增元素', '/back/element', '2017-07-07 04:06:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('95', '菜单管理', '新增元素', '/back/element', '2017-07-07 04:06:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('96', '菜单管理', '新增元素', '/back/element', '2017-07-07 04:07:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('97', '角色组管理', '新增', '/back/group', '2017-07-07 04:08:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('98', '角色组管理', '新增', '/back/group', '2017-07-07 04:08:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('99', '角色组管理', '新增', '/back/group', '2017-07-07 04:08:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('100', '服务注册', '编辑', '/gate/service', '2017-07-07 04:09:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('101', '服务注册', '编辑', '/gate/service', '2017-07-07 04:09:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('102', '服务注册', '编辑', '/gate/service', '2017-07-07 04:12:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('103', '角色组管理', '新增', '/back/group', '2017-07-07 04:13:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('104', '角色组管理', '新增', '/back/group', '2017-07-07 04:13:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('105', '客户端管理', '编辑', '/gate/client', '2017-07-07 05:48:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('106', '客户端管理', '编辑', '/gate/client', '2017-07-07 05:50:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('107', '客户端管理', '编辑', '/gate/client', '2017-07-07 05:51:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('108', '客户端管理', '编辑', '/gate/client', '2017-07-07 09:29:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('109', '客户端管理', '编辑', '/gate/client', '2017-07-07 09:30:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('110', '服务注册', '删除', '/gate/service', '2017-07-07 09:30:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('111', '服务注册', '删除', '/gate/service', '2017-07-07 09:30:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('112', '服务注册', '删除', '/gate/service', '2017-07-07 09:30:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('113', '服务注册', '删除', '/gate/service', '2017-07-07 09:30:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('114', '客户端管理', '编辑', '/gate/client', '2017-07-07 20:59:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('115', '客户端管理', '编辑', '/gate/client', '2017-07-07 20:59:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('116', '客户端管理', '编辑', '/gate/client', '2017-07-07 20:59:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('117', '角色组管理', '新增', '/back/group', '2017-07-07 21:11:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('118', '角色组管理', '新增', '/back/group', '2017-07-07 21:11:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('119', '角色组管理', '新增', '/back/group', '2017-07-07 21:11:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('120', '角色组管理', '新增', '/back/group', '2017-07-07 21:13:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('121', '客户端管理', '编辑', '/gate/client', '2017-07-07 21:51:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('122', '客户端管理', '编辑', '/gate/client', '2017-07-07 21:51:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('123', '服务注册', '编辑', '/gate/service', '2017-07-07 22:22:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('124', '服务注册', '删除', '/gate/service', '2017-07-07 22:22:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('125', '服务注册', '删除', '/gate/service', '2017-07-07 22:22:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('126', '服务注册', '删除', '/gate/service', '2017-07-07 22:22:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('127', '客户端管理', '编辑', '/gate/client', '2017-07-07 22:22:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('128', '用户管理', '新增', '/back/user', '2017-07-15 18:32:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('129', '角色组管理', '编辑', '/back/group', '2017-07-15 18:32:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('130', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('131', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('132', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('133', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('134', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('135', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('136', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('137', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('138', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('139', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('140', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('141', '角色组管理', '新增', '/back/group', '2017-07-15 18:36:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('142', '角色组管理', '新增', '/back/group', '2017-07-15 18:37:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('143', '角色组管理', '新增', '/back/group', '2017-07-15 18:37:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('144', '角色组管理', '新增', '/back/group', '2017-07-15 18:37:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('145', '角色组管理', '新增', '/back/group', '2017-07-15 18:37:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('146', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:37:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('147', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:37:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('148', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:37:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('149', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:37:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('150', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:38:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('151', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:38:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('152', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:38:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('153', '菜单管理', '删除元素', '/back/element', '2017-07-15 18:38:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('154', '菜单管理', '删除', '/back/menu', '2017-07-15 18:38:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('155', '菜单管理', '删除', '/back/menu', '2017-07-15 18:38:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('156', '菜单管理', '删除', '/back/menu', '2017-07-15 18:38:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('157', '用户管理', '删除', '/back/user', '2017-07-15 19:15:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('158', '用户管理', '编辑', '/back/user', '2017-07-15 19:18:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('159', '角色组管理', '删除', '/back/group', '2017-07-15 19:22:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('160', '菜单管理', '新增', '/back/menu', '2017-08-30 14:59:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('161', '菜单管理', '编辑', '/back/menu', '2017-08-30 15:00:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('162', '角色组管理', '新增', '/back/group', '2017-08-30 15:01:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('163', '菜单管理', '新增元素', '/back/element', '2017-08-31 10:49:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('164', '菜单管理', '编辑元素', '/back/element', '2017-08-31 10:50:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('165', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('166', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('167', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('168', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('169', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('170', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('171', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('172', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('173', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('174', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('175', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('176', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('177', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('178', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('179', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('180', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('181', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('182', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('183', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('184', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('185', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('186', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('187', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('188', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('189', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('190', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('191', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('192', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('193', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('194', '角色组管理', '新增', '/back/group', '2017-08-31 10:51:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('195', '菜单管理', '编辑元素', '/back/element', '2017-08-31 10:56:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('196', '角色组管理', '新增', '/back/group', '2017-08-31 11:00:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('197', '角色组管理', '新增', '/back/group', '2017-08-31 11:00:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('198', '角色组管理', '新增', '/back/group', '2017-08-31 11:00:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('199', '角色组管理', '新增', '/back/group', '2017-08-31 11:00:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('200', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('201', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('202', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('203', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('204', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('205', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('206', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('207', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('208', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('209', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('210', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('211', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('212', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('213', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('214', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('215', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('216', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('217', '角色组管理', '新增', '/back/group', '2017-08-31 13:15:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('218', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('219', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('220', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('221', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('222', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('223', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('224', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('225', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('226', '角色组管理', '新增', '/back/group', '2017-08-31 13:16:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('227', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('228', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('229', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('230', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('231', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('232', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('233', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('234', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('235', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('236', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('237', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('238', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('239', '角色组管理', '新增', '/back/group', '2017-08-31 13:18:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('240', '菜单管理', '编辑元素', '/back/element', '2017-08-31 13:28:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('241', '菜单管理', '编辑元素', '/back/element', '2017-08-31 13:28:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('242', '菜单管理', '编辑元素', '/back/element', '2017-08-31 13:28:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('243', '用户管理', '新增', '/back/user', '2017-08-31 13:39:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('244', '角色组管理', '新增', '/back/group', '2017-08-31 13:52:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('245', '角色组管理', '新增', '/back/group', '2017-08-31 13:52:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('246', '测试', '新增', '/back/test', '2017-08-31 14:22:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('247', '测试', '新增', '/back/test', '2017-08-31 14:32:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('248', '测试', '新增', '/back/test', '2017-08-31 14:36:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('249', '测试', '编辑', '/back/test', '2017-08-31 14:36:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('250', '测试', '编辑', '/back/test', '2017-08-31 14:39:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('251', '测试', '编辑', '/back/test', '2017-08-31 14:46:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('252', '测试', '编辑', '/back/test', '2017-08-31 14:50:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('253', '用户管理', '编辑', '/back/user', '2017-08-31 14:50:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('254', '测试', '删除', '/back/test', '2017-08-31 14:55:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('255', '测试', '编辑', '/back/test', '2017-08-31 14:57:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('256', '测试', '编辑', '/back/test', '2017-08-31 14:59:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('257', '测试', '编辑', '/back/test', '2017-08-31 15:02:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('258', '用户管理', '编辑', '/back/user', '2017-08-31 15:03:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('259', '测试', '编辑', '/back/test', '2017-08-31 15:05:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('260', '测试', '编辑', '/back/test', '2017-08-31 15:16:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('261', '测试', '新增', '/back/test', '2017-08-31 15:23:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('262', '测试', '新增', '/back/test', '2017-08-31 15:23:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('263', '测试', '新增', '/back/test', '2017-08-31 15:23:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('264', '测试', '新增', '/back/test', '2017-08-31 15:24:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('265', '测试', '新增', '/back/test', '2017-08-31 15:24:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('266', '测试', '新增', '/back/test', '2017-08-31 15:24:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('267', '测试', '新增', '/back/test', '2017-08-31 15:24:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('268', '测试', '新增', '/back/test', '2017-08-31 15:24:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('269', '测试', '新增', '/back/test', '2017-08-31 15:24:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('270', '测试', '新增', '/back/test', '2017-08-31 15:24:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('271', '测试', '新增', '/back/test', '2017-08-31 15:24:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('272', '菜单管理', '新增', '/back/menu', '2017-08-31 15:50:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('273', '菜单管理', '新增元素', '/back/element', '2017-08-31 15:50:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('274', '菜单管理', '新增元素', '/back/element', '2017-08-31 15:51:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('275', '角色组管理', '新增', '/back/group', '2017-08-31 15:52:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('276', '角色组管理', '新增', '/back/group', '2017-08-31 15:52:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('277', '角色组管理', '新增', '/back/group', '2017-08-31 15:52:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('278', '角色组管理', '新增', '/back/group', '2017-08-31 15:53:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('279', '角色组管理', '新增', '/back/group', '2017-08-31 15:53:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('280', '角色组管理', '新增', '/back/group', '2017-08-31 15:53:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('281', '角色组管理', '新增', '/back/group', '2017-08-31 15:53:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('282', '角色组管理', '新增', '/back/group', '2017-08-31 15:53:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('283', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('284', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('285', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('286', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('287', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('288', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('289', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('290', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('291', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('292', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('293', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('294', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('295', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('296', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('297', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('298', '角色组管理', '新增', '/back/group', '2017-08-31 15:54:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('299', '测试', '删除', '/back/test', '2017-08-31 15:55:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('300', '菜单管理', '新增', '/back/menu', '2017-09-03 14:16:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('301', '菜单管理', '编辑', '/back/menu', '2017-09-03 14:16:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('302', '菜单管理', '新增元素', '/back/element', '2017-09-03 14:17:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('303', '菜单管理', '编辑元素', '/back/element', '2017-09-03 14:17:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('304', '菜单管理', '新增元素', '/back/element', '2017-09-03 14:18:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('305', '菜单管理', '编辑元素', '/back/element', '2017-09-03 14:18:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('306', '菜单管理', '新增元素', '/back/element', '2017-09-03 14:19:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('307', '菜单管理', '新增元素', '/back/element', '2017-09-03 14:19:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('308', '角色组管理', '新增', '/back/group', '2017-09-03 14:20:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('309', '角色组管理', '新增', '/back/group', '2017-09-03 14:20:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('310', '角色组管理', '新增', '/back/group', '2017-09-03 14:20:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('311', '角色组管理', '新增', '/back/group', '2017-09-03 14:20:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('312', '角色组管理', '新增', '/back/group', '2017-09-03 14:20:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('313', '联系人管理', '新增', '/back/linkman', '2017-09-03 14:41:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('314', '联系人管理', '新增', '/back/linkman', '2017-09-03 14:42:32', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('315', '菜单管理', '删除', '/back/menu', '2017-09-03 14:43:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('316', '角色组管理', '新增', '/back/group', '2017-09-03 14:44:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('317', '角色组管理', '新增', '/back/group', '2017-09-03 14:44:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('318', '角色组管理', '新增', '/back/group', '2017-09-03 14:44:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('319', '角色组管理', '新增', '/back/group', '2017-09-03 14:44:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('320', '菜单管理', '编辑元素', '/back/element', '2017-09-03 14:44:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('321', '菜单管理', '编辑元素', '/back/element', '2017-09-03 14:44:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('322', '联系人管理', '删除', '/back/linkman', '2017-09-03 14:46:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('323', '联系人管理', '新增', '/back/linkman', '2017-09-03 14:46:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('324', '联系人管理', '编辑', '/back/linkman', '2017-09-03 14:52:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('325', '菜单管理', '删除', '/back/menu', '2017-09-03 17:17:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('326', '菜单管理', '新增', '/back/menu', '2017-09-03 17:20:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('327', '菜单管理', '新增元素', '/back/element', '2017-09-03 17:21:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('328', '菜单管理', '新增元素', '/back/element', '2017-09-03 17:22:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('329', '菜单管理', '编辑元素', '/back/element', '2017-09-03 17:22:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('330', '菜单管理', '新增元素', '/back/element', '2017-09-03 17:22:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('331', '菜单管理', '新增元素', '/back/element', '2017-09-03 17:23:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('332', '角色组管理', '新增', '/back/group', '2017-09-03 17:23:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('333', '角色组管理', '新增', '/back/group', '2017-09-03 17:23:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('334', '角色组管理', '新增', '/back/group', '2017-09-03 17:23:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('335', '角色组管理', '新增', '/back/group', '2017-09-03 17:23:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('336', '角色组管理', '新增', '/back/group', '2017-09-03 17:23:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('337', '代码生成器', '新增', '/back/generate', '2017-09-04 14:25:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('338', '代码生成器', '编辑', '/back/generate', '2017-09-04 14:30:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('339', '菜单管理', '编辑', '/back/menu', '2017-09-04 14:44:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('340', '代码生成器', '编辑', '/back/generate', '2017-09-04 14:48:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('341', '代码生成器', '编辑', '/back/generate', '2017-09-04 15:05:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('342', '代码生成器', '编辑', '/back/generate', '2017-09-04 17:49:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('343', '代码生成器', '编辑', '/back/generate', '2017-09-04 19:49:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('344', '代码生成器', '编辑', '/back/generate', '2017-09-04 19:51:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('345', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:17:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('346', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:17:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('347', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:18:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('348', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:18:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('349', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:19:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('350', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:19:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('351', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:19:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('352', '菜单管理', '编辑', '/back/menu', '2017-09-07 14:20:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('353', '联系人管理', '新增', '/back/linkman', '2017-09-07 14:51:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('354', '联系人管理', '新增', '/back/linkman', '2017-09-07 14:52:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('355', '联系人管理', '新增', '/back/linkman', '2017-09-07 14:53:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('356', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:04:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('357', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:04:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('358', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:10:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('359', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:14:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('360', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:14:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('361', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:15:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('362', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:15:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('363', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:17:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('364', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:34:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('365', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:40:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('366', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:40:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('367', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:51:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('368', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:52:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('369', '联系人管理', '新增', '/back/linkman', '2017-09-07 15:53:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('370', '联系人管理', '新增', '/back/linkman', '2017-09-07 16:01:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('371', '联系人管理', '新增', '/back/linkman', '2017-09-07 16:03:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('372', '联系人管理', '新增', '/back/linkman', '2017-09-07 16:04:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('373', '联系人管理', '新增', '/back/linkman', '2017-09-07 16:04:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('374', '联系人管理', '新增', '/back/linkman', '2017-09-07 17:53:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('375', '联系人管理', '编辑', '/back/linkman', '2017-09-07 17:53:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('376', '联系人管理', '删除', '/back/linkman', '2017-09-07 17:56:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('377', '联系人管理', '删除', '/back/linkman', '2017-09-07 17:57:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('378', '联系人管理', '删除', '/back/linkman', '2017-09-07 17:57:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('379', '联系人管理', '新增', '/back/linkman', '2017-09-07 17:57:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('380', '  联系人管理', '编辑', '/back/linkman', '2017-09-07 19:03:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('381', '  联系人管理', '删除', '/back/linkman', '2017-09-07 19:04:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('382', '  联系人管理', '新增', '/back/linkman', '2017-09-07 19:04:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('383', '  联系人管理', '新增', '/back/linkman', '2017-09-07 19:16:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('384', '菜单管理', '新增', '/back/menu', '2017-09-07 20:09:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('385', '菜单管理', '新增元素', '/back/element', '2017-09-08 09:20:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('386', '菜单管理', '删除', '/back/menu', '2017-09-08 09:41:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('387', '菜单管理', '新增', '/back/menu', '2017-09-08 09:42:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('388', '菜单管理', '新增', '/back/menu', '2017-09-08 09:46:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('389', '菜单管理', '新增', '/back/menu', '2017-09-08 09:49:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('390', '菜单管理', '删除', '/back/menu', '2017-09-08 09:49:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('391', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:32', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('392', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('393', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('394', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('395', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('396', '角色组管理', '新增', '/back/group', '2017-09-08 09:49:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('397', '菜单管理', '编辑', '/back/menu', '2017-09-08 09:57:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('398', '客户地址', '新增', '/back/custaddr', '2017-09-08 10:03:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('399', '客户地址', '编辑', '/back/custaddr', '2017-09-08 10:05:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('400', '客户地址', '编辑', '/back/custaddr', '2017-09-08 10:06:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('401', ' 代码生成器', '新增', '/back/generate', '2017-09-08 10:29:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('402', '菜单管理', '新增', '/back/menu', '2017-09-08 10:33:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('403', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('404', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('405', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('406', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('407', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('408', '角色组管理', '新增', '/back/group', '2017-09-08 10:33:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('409', '联系人管理', '新增', '/back/linkman', '2017-09-15 15:22:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('410', '联系人管理', '编辑', '/back/linkman', '2017-09-15 15:22:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('411', '联系人管理', '编辑', '/back/linkman', '2017-09-18 15:50:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('412', '菜单管理', '新增', '/back/menu', '2017-10-10 14:47:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('413', '角色组管理', '新增', '/back/group', '2017-10-10 14:49:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('414', '角色组管理', '新增', '/back/group', '2017-10-10 14:50:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('415', '角色组管理', '新增', '/back/group', '2017-10-10 14:50:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('416', '角色组管理', '新增', '/back/group', '2017-10-10 14:50:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('417', '角色组管理', '新增', '/back/group', '2017-10-10 14:50:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('418', '角色组管理', '新增', '/back/group', '2017-10-10 14:50:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('419', '菜单管理', '删除', '/back/menu', '2017-10-10 17:16:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('420', '代码生成器', '编辑', '/back/generate', '2018-09-13 15:58:54', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('421', '代码生成器', '编辑', '/back/generate', '2018-09-13 15:58:56', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('422', '代码生成器', '编辑', '/back/generate', '2018-09-13 15:59:06', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('423', '渠道信息管理', '新增', '/back/groupmsg', '2018-09-13 16:25:48', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('424', '渠道信息管理', '新增', '/back/groupmsg', '2018-09-13 16:27:07', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('425', '渠道信息管理', '新增', '/back/groupmsg', '2018-09-13 16:28:11', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('426', '渠道信息管理', '新增', '/back/groupmsg', '2018-09-13 16:28:37', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('427', '渠道信息管理', '新增', '/back/groupmsg', '2018-09-13 16:29:08', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('428', '客户地址', '新增', '/back/custaddr', '2018-09-13 16:29:26', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('429', '代码生成器', '新增', '/back/generate', '2018-09-24 10:50:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('430', '菜单管理', '新增', '/back/menu', '2018-09-26 15:07:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('431', '菜单管理', '编辑', '/back/menu', '2018-09-26 15:10:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('432', '菜单管理', '删除元素', '/back/element', '2018-09-26 15:10:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('433', '菜单管理', '删除元素', '/back/element', '2018-09-26 15:10:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('434', '菜单管理', '删除元素', '/back/element', '2018-09-26 15:11:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('435', '菜单管理', '删除元素', '/back/element', '2018-09-26 15:11:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('436', '菜单管理', '编辑', '/back/menu', '2018-09-26 15:47:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('437', '角色组管理', '新增', '/back/group', '2018-09-26 15:59:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('438', '测试菜单', '新增', '/back/testid', '2018-09-28 14:57:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('439', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('440', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('441', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('442', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('443', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('444', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('445', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('446', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('447', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('448', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('449', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('450', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('451', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('452', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('453', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('454', '角色组管理', '新增', '/back/group', '2018-09-28 14:58:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('455', '菜单管理', '删除', '/back/menu', '2018-09-28 16:05:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('456', '菜单管理', '新增', '/back/menu', '2018-09-28 16:06:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('457', '菜单管理', '新增', '/back/menu', '2018-09-28 16:12:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('458', '菜单管理', '删除', '/back/menu', '2018-09-28 16:17:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('459', '角色组管理', '新增', '/back/group', '2018-09-28 16:17:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('460', '角色组管理', '新增', '/back/group', '2018-09-28 16:26:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('461', '角色组管理', '新增', '/back/group', '2018-09-28 16:26:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('462', '角色组管理', '新增', '/back/group', '2018-09-28 16:26:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('463', '角色组管理', '新增', '/back/group', '2018-09-28 16:26:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('464', '角色组管理', '新增', '/back/group', '2018-09-28 16:26:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('465', '测试地址', '新增', '/back/testid', '2018-09-28 16:28:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('466', '测试地址', '删除', '/back/testid', '2018-09-28 16:28:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('467', '测试地址', '新增', '/back/testid', '2018-09-28 17:31:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('468', '测试地址', '删除', '/back/testid', '2018-09-28 17:31:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('469', '菜单管理', '新增', '/back/menu', '2018-09-28 19:45:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('470', '菜单管理', '新增', '/back/menu', '2018-09-28 19:46:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('471', '角色组管理', '新增', '/back/group', '2018-09-28 19:47:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('472', '角色组管理', '新增', '/back/group', '2018-09-28 19:47:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('473', '角色组管理', '新增', '/back/group', '2018-09-28 19:47:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('474', '角色组管理', '新增', '/back/group', '2018-09-28 19:47:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('475', '角色组管理', '新增', '/back/group', '2018-09-28 19:48:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('476', '角色组管理', '新增', '/back/group', '2018-09-28 19:59:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('477', '角色组管理', '新增', '/back/group', '2018-09-28 19:59:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('478', '角色组管理', '新增', '/back/group', '2018-09-28 19:59:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('479', '角色组管理', '新增', '/back/group', '2018-09-28 19:59:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('480', '角色组管理', '新增', '/back/group', '2018-09-28 19:59:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('481', '菜单管理', '新增', '/back/menu', '2018-09-28 20:08:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('482', '代码生成器', '新增', '/back/generate', '2018-09-28 20:20:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('483', '代码生成器', '编辑', '/back/generate', '2018-09-28 20:20:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('484', '菜单管理', '新增', '/back/menu', '2018-09-28 20:33:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('485', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:33:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('486', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:39:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('487', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:40:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('488', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:44:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('489', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:46:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('490', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:46:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('491', '合同信息维护', '新增', '/back/contractinfo', '2018-09-28 20:54:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('492', '合同信息维护', '新增', '/back/contractinfo', '2018-09-29 10:58:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('493', '测试地址1', '新增', '/back/testid', '2018-09-29 11:00:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('494', '合同信息维护', '新增', '/back/contractinfo', '2018-09-29 11:02:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('495', '合同信息维护', '新增', '/back/contractinfo', '2018-09-29 11:07:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('496', '合同信息维护', '新增', '/back/contractinfo', '2018-09-29 16:17:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('497', '合同信息维护', '新增', '/back/contractinfo', '2018-09-29 17:15:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('498', '合同信息维护', '编辑', '/back/contractinfo', '2018-09-29 17:15:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('499', '合同信息维护', '编辑', '/back/contractinfo', '2018-09-29 17:16:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('500', '合同信息维护', '删除', '/back/contractinfo', '2018-09-29 17:17:32', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('501', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('502', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('503', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('504', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('505', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('506', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('507', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('508', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('509', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('510', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('511', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('512', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('513', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:21', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('514', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('515', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('516', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('517', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('518', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('519', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('520', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('521', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('522', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('523', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('524', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('525', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('526', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('527', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('528', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('529', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('530', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('531', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('532', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('533', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('534', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('535', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('536', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('537', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('538', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('539', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('540', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('541', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('542', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('543', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('544', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('545', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('546', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('547', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('548', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('549', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('550', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('551', '角色组管理', '新增', '/back/group', '2018-10-02 15:12:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('552', '角色组管理', '新增', '/back/group', '2018-10-11 17:15:55', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('553', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:02', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('554', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:02', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('555', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:02', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('556', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('557', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('558', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('559', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('560', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('561', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('562', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('563', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:03', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('564', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:04', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('565', '角色组管理', '新增', '/back/group', '2018-10-11 17:16:09', '1', '管理员', '130.30.3.170');
INSERT INTO `gate_log` VALUES ('566', '代码生成器', '新增', '/back/generate', '2018-10-12 14:55:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('567', '代码生成器', '新增', '/back/generate', '2018-10-12 14:56:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('568', '代码生成器', '新增', '/back/generate', '2018-10-12 15:02:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('569', '代码生成器', '新增', '/back/generate', '2018-10-12 15:02:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('570', '代码生成器', '新增', '/back/generate', '2018-10-12 15:02:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('571', '代码生成器', '新增', '/back/generate', '2018-10-12 15:08:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('572', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:41:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('573', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:41:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('574', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:41:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('575', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:45:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('576', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:46:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('577', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:48:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('578', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:49:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('579', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:49:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('580', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:49:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('581', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:49:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('582', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:51:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('583', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:52:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('584', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:54:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('585', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('586', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('587', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('588', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('589', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('590', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('591', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('592', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('593', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('594', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:56:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('595', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('596', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('597', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('598', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:33', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('599', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('600', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('601', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('602', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('603', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('604', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:57:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('605', '代码生成器', '编辑', '/back/generate', '2018-10-12 16:59:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('606', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:00:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('607', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('608', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('609', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('610', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('611', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('612', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('613', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('614', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:03:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('615', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:04:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('616', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:06:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('617', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:07:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('618', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:10:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('619', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:11:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('620', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:15:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('621', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:18:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('622', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:18:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('623', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:20:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('624', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:20:58', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('625', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:23:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('626', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:24:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('627', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:24:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('628', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:24:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('629', '代码生成器', '编辑', '/back/generate', '2018-10-12 17:27:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('630', '代码生成器', '新增', '/back/generate', '2018-10-12 21:37:32', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('631', '代码生成器', '新增', '/back/generate', '2018-10-12 21:37:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('632', '代码生成器', '新增', '/back/generate', '2018-10-12 21:37:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('633', '代码生成器', '新增', '/back/generate', '2018-10-12 21:41:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('634', '代码生成器', '新增', '/back/generate', '2018-10-12 21:53:19', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('635', '代码生成器', '新增', '/back/generate', '2018-10-12 21:56:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('636', '代码生成器', '新增', '/back/generate', '2018-10-12 21:57:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('637', '代码生成器', '新增', '/back/generate', '2018-10-12 21:59:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('638', '代码生成器', '新增', '/back/generate', '2018-10-12 22:00:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('639', '代码生成器', '新增', '/back/generate', '2018-10-12 22:00:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('640', '代码生成器', '新增', '/back/generate', '2018-10-12 22:01:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('641', '代码生成器', '新增', '/back/generate', '2018-10-12 22:02:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('642', '代码生成器', '新增', '/back/generate', '2018-10-12 22:02:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('643', '代码生成器', '新增', '/back/generate', '2018-10-12 22:04:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('644', '代码生成器', '新增', '/back/generate', '2018-10-12 22:06:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('645', '代码生成器', '新增', '/back/generate', '2018-10-12 22:08:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('646', '代码生成器', '新增', '/back/generate', '2018-10-12 22:10:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('647', '代码生成器', '新增', '/back/generate', '2018-10-12 22:12:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('648', '代码生成器', '新增', '/back/generate', '2018-10-12 22:15:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('649', '代码生成器', '新增', '/back/generate', '2018-10-12 22:15:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('650', '代码生成器', '新增', '/back/generate', '2018-10-16 11:32:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('651', '代码生成器', '新增', '/back/generate', '2018-10-16 13:18:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('652', '代码生成器', '新增', '/back/generate', '2018-10-16 13:19:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('653', '代码生成器', '新增', '/back/generate', '2018-10-16 13:24:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('654', '代码生成器', '新增', '/back/generate', '2018-10-16 13:25:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('655', '代码生成器', '新增', '/back/generate', '2018-10-16 13:47:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('656', '代码生成器', '新增', '/back/generate', '2018-10-16 13:54:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('657', '代码生成器', '新增', '/back/generate', '2018-10-16 14:05:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('658', '代码生成器', '新增', '/back/generate', '2018-10-16 14:23:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('659', '代码生成器', '新增', '/back/generate', '2018-10-16 14:29:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('660', '代码生成器', '新增', '/back/generate', '2018-10-16 14:38:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('661', '代码生成器', '新增', '/back/generate', '2018-10-16 14:41:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('662', '代码生成器', '新增', '/back/generate', '2018-10-16 14:45:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('663', '代码生成器', '新增', '/back/generate', '2018-10-16 14:45:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('664', '代码生成器', '新增', '/back/generate', '2018-10-16 14:45:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('665', '代码生成器', '新增', '/back/generate', '2018-10-16 14:49:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('666', '代码生成器', '新增', '/back/generate', '2018-10-16 14:59:32', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('667', '代码生成器', '新增', '/back/generate', '2018-10-16 15:13:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('668', '代码生成器', '新增', '/back/generate', '2018-10-16 15:20:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('669', '代码生成器', '新增', '/back/generate', '2018-10-16 15:25:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('670', '代码生成器', '新增', '/back/generate', '2018-10-16 15:28:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('671', '代码生成器', '新增', '/back/generate', '2018-10-16 15:28:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('672', '代码生成器', '新增', '/back/generate', '2018-10-16 15:28:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('673', '代码生成器', '新增', '/back/generate', '2018-10-16 15:29:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('674', '代码生成器', '新增', '/back/generate', '2018-10-16 15:31:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('675', '代码生成器', '新增', '/back/generate', '2018-10-16 15:34:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('676', '代码生成器', '新增', '/back/generate', '2018-10-16 15:35:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('677', '代码生成器', '新增', '/back/generate', '2018-10-16 15:40:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('678', '代码生成器', '新增', '/back/generate', '2018-10-16 15:41:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('679', '代码生成器', '新增', '/back/generate', '2018-10-16 15:41:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('680', '代码生成器', '新增', '/back/generate', '2018-10-16 15:46:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('681', '代码生成器', '新增', '/back/generate', '2018-10-16 15:46:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('682', '代码生成器', '新增', '/back/generate', '2018-10-16 15:55:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('683', '代码生成器', '新增', '/back/generate', '2018-10-16 15:56:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('684', '代码生成器', '新增', '/back/generate', '2018-10-16 15:57:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('685', '代码生成器', '新增', '/back/generate', '2018-10-16 16:07:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('686', '代码生成器', '新增', '/back/generate', '2018-10-16 16:13:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('687', '代码生成器', '新增', '/back/generate', '2018-10-16 16:28:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('688', '代码生成器', '新增', '/back/generate', '2018-10-16 16:30:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('689', '代码生成器', '新增', '/back/generate', '2018-10-16 16:34:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('690', '合同信息维护', '新增', '/back/contractinfo', '2018-10-16 16:39:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('691', '合同信息维护', '编辑', '/back/contractinfo', '2018-10-16 16:39:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('692', '合同信息维护', '删除', '/back/contractinfo', '2018-10-16 16:39:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('693', '代码生成器', '新增', '/back/generate', '2018-10-16 16:40:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('694', '代码生成器', '新增', '/back/generate', '2018-10-16 16:43:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('695', '代码生成器', '新增', '/back/generate', '2018-10-16 16:51:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('696', '代码生成器', '新增', '/back/generate', '2018-10-16 16:51:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('697', '代码生成器', '新增', '/back/generate', '2018-10-16 16:58:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('698', '代码生成器', '新增', '/back/generate', '2018-10-16 17:03:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('699', '代码生成器', '新增', '/back/generate', '2018-10-16 17:04:25', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('700', '代码生成器', '新增', '/back/generate', '2018-10-16 17:13:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('701', '代码生成器', '新增', '/back/generate', '2018-10-16 17:19:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('702', '代码生成器', '新增', '/back/generate', '2018-10-16 17:23:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('703', '代码生成器', '编辑', '/back/generate', '2018-10-16 17:24:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('704', '代码生成器', '新增', '/back/generate', '2018-10-16 17:25:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('705', '代码生成器', '新增', '/back/generate', '2018-10-16 17:37:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('706', '代码生成器', '新增', '/back/generate', '2018-10-17 13:47:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('707', '代码生成器', '新增', '/back/generate', '2018-10-17 13:57:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('708', '代码生成器', '新增', '/back/generate', '2018-10-17 14:16:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('709', '代码生成器', '新增', '/back/generate', '2018-10-17 14:32:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('710', '代码生成器', '新增', '/back/generate', '2018-10-17 14:46:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('711', '代码生成器', '新增', '/back/generate', '2018-10-17 16:21:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('712', '代码生成器', '新增', '/back/generate', '2018-10-17 16:24:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('713', '代码生成器', '新增', '/back/generate', '2018-10-17 16:30:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('714', '代码生成器', '新增', '/back/generate', '2018-10-17 16:35:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('715', '代码生成器', '新增', '/back/generate', '2018-10-17 16:37:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('716', '代码生成器', '新增', '/back/generate', '2018-10-17 16:40:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('717', '代码生成器', '新增', '/back/generate', '2018-10-17 16:41:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('718', '代码生成器', '新增', '/back/generate', '2018-10-17 16:42:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('719', '代码生成器', '新增', '/back/generate', '2018-10-17 16:48:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('720', '代码生成器', '新增', '/back/generate', '2018-10-17 16:51:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('721', '代码生成器', '新增', '/back/generate', '2018-10-17 16:52:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('722', '代码生成器', '新增', '/back/generate', '2018-10-17 16:54:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('723', '代码生成器', '新增', '/back/generate', '2018-10-17 17:03:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('724', '代码生成器', '新增', '/back/generate', '2018-10-17 17:08:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('725', '代码生成器', '新增', '/back/generate', '2018-10-17 18:02:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('726', '代码生成器', '新增', '/back/generate', '2018-10-17 18:03:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('727', '代码生成器', '新增', '/back/generate', '2018-10-18 09:14:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('728', '代码生成器', '新增', '/back/generate', '2018-10-18 09:29:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('729', '代码生成器', '新增', '/back/generate', '2018-10-18 09:37:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('730', '代码生成器', '新增', '/back/generate', '2018-10-18 09:47:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('731', '代码生成器', '新增', '/back/generate', '2018-10-18 09:51:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('732', '代码生成器', '新增', '/back/generate', '2018-10-18 11:20:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('733', '代码生成器', '新增', '/back/generate', '2018-10-18 11:25:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('734', '代码生成器', '新增', '/back/generate', '2018-10-18 11:30:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('735', '代码生成器', '新增', '/back/generate', '2018-10-18 13:15:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('736', '代码生成器', '新增', '/back/generate', '2018-10-18 13:24:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('737', '代码生成器', '新增', '/back/generate', '2018-10-18 13:26:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('738', '代码生成器', '新增', '/back/generate', '2018-10-18 13:30:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('739', '代码生成器', '新增', '/back/generate', '2018-10-18 13:40:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('740', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:43:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('741', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:44:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('742', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:46:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('743', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:47:54', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('744', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:49:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('745', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:51:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('746', '合同信息维护', '新增', '/back/contractinfo', '2018-10-18 13:55:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('747', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:56:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('748', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 13:59:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('749', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:06:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('750', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:06:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('751', '合同信息维护', '编辑', '/back/contractinfo', '2018-10-18 14:08:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('752', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:09:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('753', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:09:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('754', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:11:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('755', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:11:56', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('756', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:19:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('757', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:22:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('758', '渠道信息管理', '删除', '/back/groupmsg', '2018-10-18 14:23:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('759', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:29:05', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('760', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:31:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('761', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:33:02', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('762', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:34:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('763', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:35:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('764', '合同信息维护', '编辑', '/back/contractinfo', '2018-10-18 14:36:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('765', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 14:37:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('766', '渠道信息管理', '删除', '/back/groupmsg', '2018-10-18 14:39:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('767', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:39:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('768', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:40:31', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('769', '合同信息维护', '编辑', '/back/contractinfo', '2018-10-18 14:42:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('770', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:43:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('771', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:49:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('772', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:55:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('773', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:56:48', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('774', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:57:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('775', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 14:58:18', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('776', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:00:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('777', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:01:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('778', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:15:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('779', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:17:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('780', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:20:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('781', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:20:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('782', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:20:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('783', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:20:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('784', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:30:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('785', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:31:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('786', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:35:17', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('787', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:35:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('788', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:36:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('789', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:38:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('790', '渠道信息管理', '新增', '/back/groupmsg', '2018-10-18 15:38:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('791', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 15:38:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('792', '代码生成器', '新增', '/back/generate', '2018-10-18 16:15:23', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('793', '代码生成器', '编辑', '/back/generate', '2018-10-18 16:18:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('794', '代码生成器', '新增', '/back/generate', '2018-10-18 16:21:03', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('795', '代码生成器', '编辑', '/back/generate', '2018-10-18 16:21:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('796', '代码生成器', '编辑', '/back/generate', '2018-10-18 16:21:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('797', '代码生成器', '新增', '/back/generate', '2018-10-18 16:21:28', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('798', '代码生成器', '新增', '/back/generate', '2018-10-18 16:24:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('799', '代码生成器', '新增', '/back/generate', '2018-10-18 16:37:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('800', '代码生成器', '新增', '/back/generate', '2018-10-18 16:44:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('801', '联系人管理', '编辑', '/back/linkman', '2018-10-18 16:52:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('802', '代码生成器', '新增', '/back/generate', '2018-10-18 16:53:27', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('803', '代码生成器', '新增', '/back/generate', '2018-10-18 17:00:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('804', '代码生成器', '新增', '/back/generate', '2018-10-18 17:02:36', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('805', '代码生成器', '新增', '/back/generate', '2018-10-18 17:04:41', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('806', '代码生成器', '新增', '/back/generate', '2018-10-18 17:09:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('807', '代码生成器', '新增', '/back/generate', '2018-10-18 17:13:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('808', '代码生成器', '新增', '/back/generate', '2018-10-18 17:13:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('809', '代码生成器', '新增', '/back/generate', '2018-10-18 17:17:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('810', '代码生成器', '新增', '/back/generate', '2018-10-18 17:27:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('811', '代码生成器', '新增', '/back/generate', '2018-10-18 17:27:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('812', '代码生成器', '新增', '/back/generate', '2018-10-18 17:33:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('813', '代码生成器', '新增', '/back/generate', '2018-10-18 17:33:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('814', '代码生成器', '新增', '/back/generate', '2018-10-18 17:34:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('815', '渠道信息管理', '编辑', '/back/groupmsg', '2018-10-18 17:48:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('816', '渠道信息管理', '删除', '/back/groupmsg', '2018-10-18 17:48:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('817', '菜单管理', '删除', '/back/menu', '2018-10-19 09:45:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('818', '代码生成器', '新增', '/back/generate', '2018-10-19 10:47:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('819', '联系人管理', '删除', '/back/linkman', '2018-10-19 13:38:04', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('820', '菜单管理', '编辑', '/back/menu', '2018-10-22 09:33:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('821', '菜单管理', '编辑', '/back/menu', '2018-10-22 15:35:26', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('822', '菜单管理', '编辑', '/back/menu', '2018-10-22 15:35:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('823', '菜单管理', '编辑', '/back/menu', '2018-10-22 15:35:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('824', '菜单管理', '编辑', '/back/menu', '2018-10-22 15:54:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('825', '菜单管理', '编辑', '/back/menu', '2018-10-22 15:54:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('826', '菜单管理', '编辑', '/back/menu', '2018-10-22 16:39:44', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('827', '菜单管理', '编辑', '/back/menu', '2018-10-22 16:39:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('828', '菜单管理', '编辑', '/back/menu', '2018-10-22 16:40:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('829', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:35:01', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('830', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:35:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('831', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:35:53', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('832', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:00', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('833', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('834', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('835', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:30', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('836', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:39', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('837', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:36:59', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('838', '菜单管理', '编辑', '/back/menu', '2018-10-23 09:37:14', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('839', '菜单管理', '编辑', '/back/menu', '2018-10-23 10:34:13', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('840', '联系人管理', '新增', '/back/linkman', '2018-10-25 12:58:57', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('841', '联系人管理', '编辑', '/back/linkman', '2018-10-25 12:59:29', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('842', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:37', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('843', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:40', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('844', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('845', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:46', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('846', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:49', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('847', '联系人管理', '删除', '/back/linkman', '2018-10-25 12:59:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('848', '用户管理', '编辑', '/back/user', '2018-10-26 16:40:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('849', '代码生成器', '新增', '/back/generate', '2018-10-26 17:33:20', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('850', '代码生成器', '新增', '/back/generate', '2018-10-26 21:16:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('851', '代码生成器', '新增', '/back/generate', '2018-10-26 21:17:12', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('852', '代码生成器', '新增', '/back/generate', '2018-10-26 21:17:43', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('853', '代码生成器', '新增', '/back/generate', '2018-10-26 21:18:45', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('854', '代码生成器', '新增', '/back/generate', '2018-10-26 21:19:35', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('855', '代码生成器', '新增', '/back/generate', '2018-10-26 21:19:38', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('856', '代码生成器', '新增', '/back/generate', '2018-10-26 21:19:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('857', '代码生成器', '新增', '/back/generate', '2018-10-26 21:38:22', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('858', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('859', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:42', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('860', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:47', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('861', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:50', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('862', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:51', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('863', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:52', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('864', '代码生成器', '新增', '/back/generate', '2018-10-26 21:42:55', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('865', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:06', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('866', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:07', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('867', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:08', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('868', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('869', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:09', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('870', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('871', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('872', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('873', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('874', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:10', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('875', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('876', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('877', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('878', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('879', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:16', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('880', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:24', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('881', '代码生成器', '新增', '/back/generate', '2018-10-26 21:43:34', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('882', '代码生成器', '新增', '/back/generate', '2018-10-26 21:46:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('883', '代码生成器', '新增', '/back/generate', '2018-10-26 21:47:11', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('884', '代码生成器', '新增', '/back/generate', '2018-10-26 22:01:15', '1', '管理员', '0:0:0:0:0:0:0:1');
INSERT INTO `gate_log` VALUES ('885', '代码生成器', '新增', '/back/generate', '2018-10-26 22:01:48', '1', '管理员', '0:0:0:0:0:0:0:1');
