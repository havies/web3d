/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : web3d

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-04-14 22:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categorys`
-- ----------------------------
DROP TABLE IF EXISTS `categorys`;
CREATE TABLE `categorys` (
  `CategoryID` varchar(32) NOT NULL COMMENT '产品分类编号',
  `CategoryName` varchar(32) DEFAULT NULL COMMENT '产品分类名称',
  `ParentID` varchar(32) DEFAULT NULL COMMENT '父结点ID',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of categorys
-- ----------------------------
INSERT INTO `categorys` VALUES ('2c9095ec54106fe60154106fe6bc0000', '类别1', '0');

-- ----------------------------
-- Table structure for `eaexception`
-- ----------------------------
DROP TABLE IF EXISTS `eaexception`;
CREATE TABLE `eaexception` (
  `EXCEPTIONID` varchar(20) NOT NULL COMMENT '异常ID',
  `CLAZZ` varchar(200) DEFAULT NULL COMMENT '异常类',
  `METHODNAME` varchar(50) DEFAULT NULL COMMENT '方法名',
  `ACTIVETIME` bigint(14) DEFAULT NULL COMMENT '激活时间',
  `EXCEPTION` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`EXCEPTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常监控表';

-- ----------------------------
-- Records of eaexception
-- ----------------------------
INSERT INTO `eaexception` VALUES ('10000066', 'org.eredlab.g4.bmf.base.DaoImpl', 'queryForObject', '20120819010838', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000069', 'org.eredlab.g4.demo.service.impl.DemoServiceImpl', 'doError', '20120819010840', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000070', 'org.eredlab.g4.bmf.base.ReaderImpl', 'queryForObject', '20120820212259', 'SqlMapClient operation; bad SQL grammar []; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:   \n--- The error occurred while applying a parameter map.  \n--- Check the Demo.sumBalanceInfo-InlineParameterMap.  \n--- Check the parameter map.  \n--- Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: FUNCTION eredg4.SUM does not exist');
INSERT INTO `eaexception` VALUES ('10000071', 'org.eredlab.g4.bmf.base.ReaderImpl', 'queryForObject', '20120820212435', 'SqlMapClient operation; bad SQL grammar []; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:   \n--- The error occurred while applying a parameter map.  \n--- Check the Demo.sumBalanceInfo-InlineParameterMap.  \n--- Check the parameter map.  \n--- Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: FUNCTION eredg4.sum does not exist');
INSERT INTO `eaexception` VALUES ('10000072', 'org.eredlab.g4.bmf.base.ReaderImpl', 'queryForPage', '20120820224822', 'There is no statement named queryFiles in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000073', 'org.eredlab.g4.bmf.base.DaoImpl', 'insert', '20120820230013', 'SqlMapClient operation; bad SQL grammar []; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:   \n--- The error occurred in org/eredlab/g4/demo/sqlmap/Demo.xml.  \n--- The error occurred while applying a parameter map.  \n--- Check the Demo.insertEa_demo_uploadPo-InlineParameterMap.  \n--- Check the statement (update failed).  \n--- Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: Unknown column \'uploaddate\' in \'field list\'');
INSERT INTO `eaexception` VALUES ('10000074', 'org.eredlab.g4.demo.service.impl.DemoServiceImpl', 'doUpload', '20120820230013', 'SqlMapClient operation; bad SQL grammar []; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:   \n--- The error occurred in org/eredlab/g4/demo/sqlmap/Demo.xml.  \n--- The error occurred while applying a parameter map.  \n--- Check the Demo.insertEa_demo_uploadPo-InlineParameterMap.  \n--- Check the statement (update failed).  \n--- Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: Unknown column \'uploaddate\' in \'field list\'');
INSERT INTO `eaexception` VALUES ('10000075', 'org.eredlab.g4.bmf.base.ReaderImpl', 'queryForPage', '20120820231637', 'SqlMapClient operation; bad SQL grammar []; nested exception is com.ibatis.common.jdbc.exception.NestedSQLException:   \n--- The error occurred while applying a parameter map.  \n--- Check the Demo.queryBalanceInfo-InlineParameterMap.  \n--- Check the parameter map.  \n--- Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: FUNCTION eredg4.to_char does not exist');
INSERT INTO `eaexception` VALUES ('10000076', 'org.eredlab.g4.arm.service.impl.ArmTagSupportServiceImpl', 'getCardTreeList', '20120821205658', 'org.eredlab.g4.arm.web.tag.vo.MenuVo cannot be cast to org.eredlab.g4.ccl.datastructure.impl.BaseDto');
INSERT INTO `eaexception` VALUES ('10000077', 'org.eredlab.g4.arm.service.impl.ArmTagSupportServiceImpl', 'getCardTreeList', '20120821205721', 'org.eredlab.g4.arm.web.tag.vo.MenuVo cannot be cast to org.eredlab.g4.ccl.datastructure.impl.BaseDto');
INSERT INTO `eaexception` VALUES ('10000078', 'org.eredlab.g4.bmf.base.DaoImpl', 'queryForObject', '20120913211708', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000079', 'org.eredlab.g4.demo.service.impl.DemoServiceImpl', 'doError', '20120913211709', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000080', 'org.g4studio.demo.service.impl.DemoServiceImpl', 'doError', '20121108164737', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000081', 'org.g4studio.demo.service.impl.DemoServiceImpl', 'doError', '20121108164753', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000082', 'org.g4studio.demo.service.impl.DemoServiceImpl', 'doError', '20121108164756', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');
INSERT INTO `eaexception` VALUES ('10000083', 'org.g4studio.demo.service.impl.DemoServiceImpl', 'doError', '20130405234335', 'There is no statement named Demo.queryBalanceInfo1 in this SqlMap.');

-- ----------------------------
-- Table structure for `gy_calendar_event`
-- ----------------------------
DROP TABLE IF EXISTS `gy_calendar_event`;
CREATE TABLE `gy_calendar_event` (
  `CAL_EVENT_ID` varchar(64) NOT NULL,
  `EVENT_TITLE` varchar(200) DEFAULT NULL COMMENT '日历事件标题',
  `IS_ALLDAY` varchar(5) DEFAULT NULL COMMENT '全天事件',
  `WHEN_BEGIN` varchar(30) DEFAULT NULL COMMENT '事件开始时间',
  `WHEN_END` varchar(30) DEFAULT NULL COMMENT '事件结束时间',
  `EVENT_TYPE` varchar(20) DEFAULT NULL COMMENT '事件类型（工作|学习|娱乐|生活）',
  `REMINDER` varchar(45) DEFAULT NULL COMMENT '提醒方式',
  `NOTES` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `LOCATION` varchar(45) DEFAULT NULL COMMENT '地点',
  `WEB_LINK` varchar(200) DEFAULT NULL COMMENT 'Web链接',
  `EVENT_OWNER` varchar(45) DEFAULT NULL COMMENT '事件属主（public|private）',
  `OWNER_USERID` varchar(45) DEFAULT NULL COMMENT '私有事件的用户名',
  `SCRQ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CAL_EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gy_calendar_event
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_code`
-- ----------------------------
DROP TABLE IF EXISTS `gy_code`;
CREATE TABLE `gy_code` (
  `CODEID` varchar(8) NOT NULL,
  `FIELD` varchar(15) NOT NULL,
  `FIELDNAME` varchar(20) NOT NULL,
  `CODE` varchar(100) NOT NULL,
  `CODEDESC` varchar(200) NOT NULL,
  `ENABLED` varchar(2) NOT NULL DEFAULT '1',
  `EDITMODE` varchar(2) NOT NULL DEFAULT '1',
  `SORTNO` int(4) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CODEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码对照表';

-- ----------------------------
-- Records of gy_code
-- ----------------------------
INSERT INTO `gy_code` VALUES ('10000000', 'SEX', '性别', '0', '未知', '1', '1', '1', '');
INSERT INTO `gy_code` VALUES ('10000001', 'SEX', '性别', '1', '男', '1', '1', '2', '');
INSERT INTO `gy_code` VALUES ('10000002', 'SEX', '性别', '2', '女', '1', '1', '3', null);
INSERT INTO `gy_code` VALUES ('10000003', 'LOCKED', '锁定', '0', '激活', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000004', 'LOCKED', '锁定', '1', '锁定', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000005', 'ROLETYPE', '角色类型', '2', '管理授权角色', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000006', 'ROLETYPE', '角色类型', '1', '业务角色', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000007', 'LEAF', '节点类型', '1', '叶子节点', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000008', 'LEAF', '节点类型', '0', '树枝节点', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000009', 'EDITMODE', '编辑模式', '0', '只读', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000010', 'EDITMODE', '编辑模式', '1', '可编辑', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000011', 'ENABLED', '启用状态', '0', '禁用', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000012', 'ENABLED', '启用状态', '1', '启用', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000015', 'AUTHORIZELEVEL', '权限级别', '1', '访问权限', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000016', 'AUTHORIZELEVEL', '权限级别', '2', '管理权限', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000018', 'ROLETYPE', '角色类型', '3', '系统内置角色', '1', '0', '3', null);
INSERT INTO `gy_code` VALUES ('10000039', 'MENUTYPE', '菜单类型', '1', '系统菜单', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000040', 'MENUTYPE', '菜单类型', '0', '业务菜单', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000041', 'USERTYPE', '人员类型', '1', '业务人员', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000042', 'USERTYPE', '人员类型', '2', '管理授权人员', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000043', 'USERTYPE', '人员类型', '3', '系统内置用户', '1', '0', '3', null);
INSERT INTO `gy_code` VALUES ('10000048', 'CMPTYPE', 'UI元素类型', '1', '按钮', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000049', 'CMPTYPE', 'UI元素类型', '2', '表单输入(textField|textArea|comboBox|checkBox|radioBox|htmlEditor)', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000050', 'CMPTYPE', 'UI组件类型', '3', '面板容器(Panel|TabPanel|GridPanel|FormPanel|TreePanel)', '1', '0', '3', null);
INSERT INTO `gy_code` VALUES ('10000051', 'PARTAUTHTYPE', 'UI元素授权类型', '1', '禁用', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000052', 'PARTAUTHTYPE', 'UI元素授权类型', '3', '输入-不可编辑', '1', '0', '3', null);
INSERT INTO `gy_code` VALUES ('10000053', 'PARTAUTHTYPE', 'UI元素授权类型', '4', '输入-可编辑', '1', '0', '4', null);
INSERT INTO `gy_code` VALUES ('10000054', 'PARTAUTHTYPE', 'UI元素授权类型', '5', '显示', '1', '0', '5', null);
INSERT INTO `gy_code` VALUES ('10000055', 'PARTAUTHTYPE', 'UI元素授权类型', '6', '隐藏', '1', '0', '6', null);
INSERT INTO `gy_code` VALUES ('10000056', 'PARTAUTHTYPE', 'UI元素授权类型', '0', '挂起-取消授权', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000057', 'PARTAUTHTYPE', 'UI元素授权类型', '2', '激活', '1', '0', '4', null);
INSERT INTO `gy_code` VALUES ('10000058', 'ADVISETYPE', '通知类型', '1', '方法调用', '1', '0', '1', null);
INSERT INTO `gy_code` VALUES ('10000059', 'ADVISETYPE', '通知类型', '2', '异常捕获', '1', '0', '2', null);
INSERT INTO `gy_code` VALUES ('10000062', 'EXPAND', '节点状态', '1', '展开', '1', '0', '1', '');
INSERT INTO `gy_code` VALUES ('10000063', 'EXPAND', '展开状态', '0', '收缩', '1', '0', '2', '');
INSERT INTO `gy_code` VALUES ('10000064', 'ROLESPEC', '角色身份', 'RS01', '总管理员', '1', '0', '1', '');
INSERT INTO `gy_code` VALUES ('10000065', 'ROLESPEC', '角色身份', 'RS02', '系统管理员', '1', '0', '2', '');
INSERT INTO `gy_code` VALUES ('10000066', 'ROLESPEC', '角色身份', 'RS03', '管理者', '1', '0', '3', '');
INSERT INTO `gy_code` VALUES ('10000067', 'ROLESPEC', '角色身份', 'RS04', '成员', '1', '0', '4', '');
INSERT INTO `gy_code` VALUES ('10000071', 'DATARULE', '数据规则对象', 'DR01', '项目信息', '1', '0', '1', '');
INSERT INTO `gy_code` VALUES ('10000072', 'DATARULE', '数据规则对象', 'DR02', '成员信息', '1', '0', '2', '');
INSERT INTO `gy_code` VALUES ('10000073', 'DATARULE', '数据规则对象', 'DR03', '单位信息', '1', '0', '3', '');
INSERT INTO `gy_code` VALUES ('10000077', 'PARTAUTHTYPE', 'UI元素授权类型', '7', '输入-必填', '1', '0', '7', '');
INSERT INTO `gy_code` VALUES ('10000078', 'PARTAUTHTYPE', 'UI元素授权类型', '8', '输入-非必填', '1', '0', '8', '');
INSERT INTO `gy_code` VALUES ('10000079', 'CMPTYPE', 'UI元素类型', '4', '表格列(ColumnModel)', '1', '0', '4', '');
INSERT INTO `gy_code` VALUES ('10000082', 'VFS_ROOT_DIR', 'VFS文件夹的子目录字典', 'VFS_INFOATTACHMENT', '信息发布附件', '1', '1', '1', '');
INSERT INTO `gy_code` VALUES ('10000083', 'SYSINFO_MODULE', '系统信息发布模块', 'SYS', '系统相关', '1', '1', '1', '');
INSERT INTO `gy_code` VALUES ('10000084', 'SYSINFO_MODULE', '系统信息发布模块', 'PRJ', '项目相关', '1', '1', '2', '');

-- ----------------------------
-- Table structure for `gy_datarule`
-- ----------------------------
DROP TABLE IF EXISTS `gy_datarule`;
CREATE TABLE `gy_datarule` (
  `RULEID` varchar(8) NOT NULL,
  `RULENAME` varchar(50) NOT NULL,
  `RULEOBJECT` varchar(10) NOT NULL,
  `DATACOND` varchar(500) NOT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `LOCKED` varchar(2) DEFAULT '0',
  PRIMARY KEY (`RULEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据规则表';

-- ----------------------------
-- Records of gy_datarule
-- ----------------------------
INSERT INTO `gy_datarule` VALUES ('10000021', '1', 'DR02', '010502', '', '0');

-- ----------------------------
-- Table structure for `gy_datarulerole`
-- ----------------------------
DROP TABLE IF EXISTS `gy_datarulerole`;
CREATE TABLE `gy_datarulerole` (
  `RULEROLEID` varchar(8) NOT NULL,
  `RULEID` varchar(8) NOT NULL,
  `ROLEID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`RULEROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据规则角色授权表';

-- ----------------------------
-- Records of gy_datarulerole
-- ----------------------------
INSERT INTO `gy_datarulerole` VALUES ('10000044', '10000009', '10000092', '01050101');
INSERT INTO `gy_datarulerole` VALUES ('10000049', '10000013', '10000076', '01050101');
INSERT INTO `gy_datarulerole` VALUES ('10000083', '10000017', '10000095', '01050301');
INSERT INTO `gy_datarulerole` VALUES ('10000085', '10000019', '10000099', '010501');
INSERT INTO `gy_datarulerole` VALUES ('10000086', '10000019', '10000099', '010502');
INSERT INTO `gy_datarulerole` VALUES ('10000087', '10000019', '10000102', '010502');
INSERT INTO `gy_datarulerole` VALUES ('10000088', '10000020', '10000102', '010502');

-- ----------------------------
-- Table structure for `gy_dataruleuser`
-- ----------------------------
DROP TABLE IF EXISTS `gy_dataruleuser`;
CREATE TABLE `gy_dataruleuser` (
  `RULEUSERID` varchar(8) NOT NULL DEFAULT '',
  `RULEID` varchar(8) NOT NULL,
  `USERID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`RULEUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据规则用户授权表';

-- ----------------------------
-- Records of gy_dataruleuser
-- ----------------------------
INSERT INTO `gy_dataruleuser` VALUES ('10000004', '10000006', '10004898', '01050101');

-- ----------------------------
-- Table structure for `gy_dept`
-- ----------------------------
DROP TABLE IF EXISTS `gy_dept`;
CREATE TABLE `gy_dept` (
  `DEPTID` varchar(100) NOT NULL,
  `DEPTNAME` varchar(20) NOT NULL,
  `PARENTID` varchar(100) NOT NULL,
  `CUSTOMID` varchar(10) DEFAULT NULL,
  `ENABLED` varchar(1) NOT NULL DEFAULT '1',
  `SORTNO` int(4) DEFAULT NULL,
  `LEAF` varchar(2) NOT NULL DEFAULT '0',
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of gy_dept
-- ----------------------------
INSERT INTO `gy_dept` VALUES ('001', '桂圳集团', '0', '001', '1', '1', '1', '');

-- ----------------------------
-- Table structure for `gy_event`
-- ----------------------------
DROP TABLE IF EXISTS `gy_event`;
CREATE TABLE `gy_event` (
  `EVENTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(8) DEFAULT NULL,
  `ACCOUNT` varchar(30) DEFAULT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `ACTIVETIME` bigint(14) DEFAULT NULL,
  `REQUESTPATH` varchar(200) DEFAULT NULL,
  `METHODNAME` varchar(50) DEFAULT NULL,
  `COSTTIME` int(10) DEFAULT NULL,
  PRIMARY KEY (`EVENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000127940 DEFAULT CHARSET=utf8 COMMENT='操作员事件表';

-- ----------------------------
-- Records of gy_event
-- ----------------------------
INSERT INTO `gy_event` VALUES ('100000000127574', '10000000', 'super', '超级用户', '登录系统', '20160413231918', '/PR/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127575', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160413231919', '/PR/index.do', 'indexInit', '605');
INSERT INTO `gy_event` VALUES ('100000000127576', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160413231919', '/PR/index.do', 'preferencesInit', '273');
INSERT INTO `gy_event` VALUES ('100000000127577', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160413231920', '/PR/common/gyinformation/queryForView.action', null, '83');
INSERT INTO `gy_event` VALUES ('100000000127578', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160413231927', '/PR/resource.do', 'menuResourceInit', '250');
INSERT INTO `gy_event` VALUES ('100000000127579', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231928', '/PR/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127580', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231928', '/PR/resource.do', 'queryMenuItems', '62');
INSERT INTO `gy_event` VALUES ('100000000127581', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231928', '/PR/resource.do', 'queryMenuItems', '57');
INSERT INTO `gy_event` VALUES ('100000000127582', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231928', '/PR/resource.do', 'queryMenuItems', '70');
INSERT INTO `gy_event` VALUES ('100000000127583', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231928', '/PR/resource.do', 'queryMenuItems', '75');
INSERT INTO `gy_event` VALUES ('100000000127584', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231929', '/PR/resource.do', 'queryMenuItemsForManage', '49');
INSERT INTO `gy_event` VALUES ('100000000127585', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231933', '/PR/resource.do', 'queryMenuItemsForManage', '21');
INSERT INTO `gy_event` VALUES ('100000000127586', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231934', '/PR/resource.do', 'queryMenuItemsForManage', '32');
INSERT INTO `gy_event` VALUES ('100000000127587', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231945', '/PR/resource.do', 'queryMenuItemsForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127588', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231947', '/PR/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127589', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231951', '/PR/resource.do', 'queryMenuItemsForManage', '34');
INSERT INTO `gy_event` VALUES ('100000000127590', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[deleteMenuItems]', '20160413231958', '/PR/resource.do', 'deleteMenuItems', '80');
INSERT INTO `gy_event` VALUES ('100000000127591', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231958', '/PR/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127592', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413231958', '/PR/resource.do', 'queryMenuItemsForManage', '45');
INSERT INTO `gy_event` VALUES ('100000000127593', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231958', '/PR/resource.do', 'queryMenuItems', '4');
INSERT INTO `gy_event` VALUES ('100000000127594', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231958', '/PR/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127595', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413231958', '/PR/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127596', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232001', '/PR/resource.do', 'queryMenuItemsForManage', '17');
INSERT INTO `gy_event` VALUES ('100000000127597', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232002', '/PR/resource.do', 'queryMenuItemsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127598', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232006', '/PR/resource.do', 'queryMenuItemsForManage', '26');
INSERT INTO `gy_event` VALUES ('100000000127599', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveMenuItem]', '20160413232021', '/PR/resource.do', 'saveMenuItem', '272');
INSERT INTO `gy_event` VALUES ('100000000127600', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232021', '/PR/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127601', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232021', '/PR/resource.do', 'queryMenuItemsForManage', '38');
INSERT INTO `gy_event` VALUES ('100000000127602', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232021', '/PR/resource.do', 'queryMenuItems', '12');
INSERT INTO `gy_event` VALUES ('100000000127603', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232021', '/PR/resource.do', 'queryMenuItems', '30');
INSERT INTO `gy_event` VALUES ('100000000127604', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232021', '/PR/resource.do', 'queryMenuItems', '22');
INSERT INTO `gy_event` VALUES ('100000000127605', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232024', '/PR/resource.do', 'queryMenuItemsForManage', '9');
INSERT INTO `gy_event` VALUES ('100000000127606', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160413232035', '/PR/organization.do', 'departmentInit', '426');
INSERT INTO `gy_event` VALUES ('100000000127607', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160413232035', '/PR/organization.do', 'departmentTreeInit', '3');
INSERT INTO `gy_event` VALUES ('100000000127608', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160413232035', '/PR/organization.do', 'queryDeptsForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127609', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160413232037', '/PR/role.do', 'roleInit', '259');
INSERT INTO `gy_event` VALUES ('100000000127610', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160413232037', '/PR/role.do', 'departmentTreeInit', '4');
INSERT INTO `gy_event` VALUES ('100000000127611', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160413232037', '/PR/role.do', 'queryRolesForManage', '11');
INSERT INTO `gy_event` VALUES ('100000000127612', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[updateDeptItem]', '20160413232123', '/PR/organization.do', 'updateDeptItem', '30');
INSERT INTO `gy_event` VALUES ('100000000127613', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160413232123', '/PR/organization.do', 'queryDeptsForManage', '14');
INSERT INTO `gy_event` VALUES ('100000000127614', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160413232123', '/PR/organization.do', 'departmentTreeInit', '7');
INSERT INTO `gy_event` VALUES ('100000000127615', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160413232130', '/PR/organization.do', 'queryDeptsForManage', '16');
INSERT INTO `gy_event` VALUES ('100000000127616', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160413232137', '/PR/organization.do', 'queryDeptsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127617', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[系统字典维护]', '20160413232200', '/PR/resource.do', 'codeTableInit', '207');
INSERT INTO `gy_event` VALUES ('100000000127618', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryCodeItems]', '20160413232200', '/PR/resource.do', 'queryCodeItems', '37');
INSERT INTO `gy_event` VALUES ('100000000127619', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[全局参数表维护]', '20160413232206', '/PR/param.do', 'init', '204');
INSERT INTO `gy_event` VALUES ('100000000127620', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryParamsForManage]', '20160413232206', '/PR/param.do', 'queryParamsForManage', '12');
INSERT INTO `gy_event` VALUES ('100000000127621', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160413232221', '/PR/common/gyinformation/init.action', null, '302');
INSERT INTO `gy_event` VALUES ('100000000127622', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160413232222', '/PR/common/gyinformation/queryForManage.action', null, '12');
INSERT INTO `gy_event` VALUES ('100000000127623', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[系统预置图标]', '20160413232228', '/PR/resource.do', 'iconInit', '226');
INSERT INTO `gy_event` VALUES ('100000000127624', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryIconItems]', '20160413232228', '/PR/resource.do', 'queryIconItems', '15');
INSERT INTO `gy_event` VALUES ('100000000127625', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[系统字典维护]', '20160413232238', '/PR/resource.do', 'codeTableInit', '91');
INSERT INTO `gy_event` VALUES ('100000000127626', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryCodeItems]', '20160413232239', '/PR/resource.do', 'queryCodeItems', '49');
INSERT INTO `gy_event` VALUES ('100000000127627', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[全局参数表维护]', '20160413232245', '/PR/param.do', 'init', '70');
INSERT INTO `gy_event` VALUES ('100000000127628', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryParamsForManage]', '20160413232246', '/PR/param.do', 'queryParamsForManage', '9');
INSERT INTO `gy_event` VALUES ('100000000127629', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160413232251', '/PR/resource.do', 'menuResourceInit', '79');
INSERT INTO `gy_event` VALUES ('100000000127630', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232252', '/PR/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127631', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160413232252', '/PR/resource.do', 'queryMenuItemsForManage', '32');
INSERT INTO `gy_event` VALUES ('100000000127632', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232252', '/PR/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127633', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232252', '/PR/resource.do', 'queryMenuItems', '14');
INSERT INTO `gy_event` VALUES ('100000000127634', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160413232252', '/PR/resource.do', 'queryMenuItems', '12');
INSERT INTO `gy_event` VALUES ('100000000127635', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160413232254', '/PR/organization.do', 'departmentInit', '53');
INSERT INTO `gy_event` VALUES ('100000000127636', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160413232254', '/PR/organization.do', 'departmentTreeInit', '7');
INSERT INTO `gy_event` VALUES ('100000000127637', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160413232254', '/PR/organization.do', 'queryDeptsForManage', '15');
INSERT INTO `gy_event` VALUES ('100000000127638', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[数据规则管理]', '20160413232258', '/PR/rule.do', 'init', '188');
INSERT INTO `gy_event` VALUES ('100000000127639', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRulesForManage]', '20160413232258', '/PR/rule.do', 'queryRulesForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127640', '10000000', 'super', '超级用户', '登录系统', '20160414000003', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127641', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414000004', '/web3d/index.do', 'indexInit', '676');
INSERT INTO `gy_event` VALUES ('100000000127642', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414000005', '/web3d/index.do', 'preferencesInit', '322');
INSERT INTO `gy_event` VALUES ('100000000127643', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414000006', '/web3d/common/gyinformation/queryForView.action', null, '92');
INSERT INTO `gy_event` VALUES ('100000000127644', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160414000007', '/web3d/organization.do', 'departmentInit', '237');
INSERT INTO `gy_event` VALUES ('100000000127645', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000008', '/web3d/organization.do', 'departmentTreeInit', '8');
INSERT INTO `gy_event` VALUES ('100000000127646', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160414000008', '/web3d/organization.do', 'queryDeptsForManage', '12');
INSERT INTO `gy_event` VALUES ('100000000127647', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414000010', '/web3d/resource.do', 'menuResourceInit', '307');
INSERT INTO `gy_event` VALUES ('100000000127648', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000010', '/web3d/resource.do', 'queryMenuItems', '16');
INSERT INTO `gy_event` VALUES ('100000000127649', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000010', '/web3d/resource.do', 'queryMenuItemsForManage', '41');
INSERT INTO `gy_event` VALUES ('100000000127650', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000011', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127651', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000011', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127652', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000011', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127653', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000012', '/web3d/resource.do', 'queryMenuItemsForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127654', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[updateMenuItem]', '20160414000036', '/web3d/resource.do', 'updateMenuItem', '70');
INSERT INTO `gy_event` VALUES ('100000000127655', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000036', '/web3d/resource.do', 'queryMenuItemsForManage', '36');
INSERT INTO `gy_event` VALUES ('100000000127656', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000036', '/web3d/resource.do', 'queryMenuItems', '16');
INSERT INTO `gy_event` VALUES ('100000000127657', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000036', '/web3d/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127658', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000036', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127659', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000036', '/web3d/resource.do', 'queryMenuItems', '19');
INSERT INTO `gy_event` VALUES ('100000000127660', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000039', '/web3d/resource.do', 'queryMenuItemsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127661', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveMenuItem]', '20160414000052', '/web3d/resource.do', 'saveMenuItem', '32');
INSERT INTO `gy_event` VALUES ('100000000127662', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000052', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127663', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000052', '/web3d/resource.do', 'queryMenuItemsForManage', '17');
INSERT INTO `gy_event` VALUES ('100000000127664', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000052', '/web3d/resource.do', 'queryMenuItems', '12');
INSERT INTO `gy_event` VALUES ('100000000127665', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000052', '/web3d/resource.do', 'queryMenuItems', '17');
INSERT INTO `gy_event` VALUES ('100000000127666', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000052', '/web3d/resource.do', 'queryMenuItems', '20');
INSERT INTO `gy_event` VALUES ('100000000127667', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000052', '/web3d/resource.do', 'queryMenuItems', '16');
INSERT INTO `gy_event` VALUES ('100000000127668', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000054', '/web3d/resource.do', 'queryMenuItemsForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127669', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000056', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127670', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000105', '/web3d/resource.do', 'queryMenuItemsForManage', '10');
INSERT INTO `gy_event` VALUES ('100000000127671', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000107', '/web3d/resource.do', 'queryMenuItemsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127672', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[updateMenuItem]', '20160414000140', '/web3d/resource.do', 'updateMenuItem', '82');
INSERT INTO `gy_event` VALUES ('100000000127673', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000140', '/web3d/resource.do', 'queryMenuItemsForManage', '12');
INSERT INTO `gy_event` VALUES ('100000000127674', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000140', '/web3d/resource.do', 'queryMenuItems', '13');
INSERT INTO `gy_event` VALUES ('100000000127675', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000147', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127676', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414000151', '/web3d/role.do', 'roleInit', '293');
INSERT INTO `gy_event` VALUES ('100000000127677', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000151', '/web3d/role.do', 'departmentTreeInit', '6');
INSERT INTO `gy_event` VALUES ('100000000127678', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414000151', '/web3d/role.do', 'queryRolesForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127679', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[人员管理与授权]', '20160414000156', '/web3d/user.do', 'userInit', '268');
INSERT INTO `gy_event` VALUES ('100000000127680', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000157', '/web3d/user.do', 'departmentTreeInit', '13');
INSERT INTO `gy_event` VALUES ('100000000127681', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryUsersForManage]', '20160414000157', '/web3d/user.do', 'queryUsersForManage', '14');
INSERT INTO `gy_event` VALUES ('100000000127682', '10000000', 'super', '超级用户', '退出系统', '20160414000207', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127683', '10004922', 'admin', 'admin', '登录系统', '20160414000211', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127684', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[indexInit]', '20160414000211', '/web3d/index.do', 'indexInit', '143');
INSERT INTO `gy_event` VALUES ('100000000127685', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[preferencesInit]', '20160414000212', '/web3d/index.do', 'preferencesInit', '105');
INSERT INTO `gy_event` VALUES ('100000000127686', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000212', '/web3d/common/gyinformation/queryForView.action', null, '14');
INSERT INTO `gy_event` VALUES ('100000000127687', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[组织机构管理]', '20160414000214', '/web3d/organization.do', 'departmentInit', '76');
INSERT INTO `gy_event` VALUES ('100000000127688', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414000214', '/web3d/organization.do', 'departmentTreeInit', '15');
INSERT INTO `gy_event` VALUES ('100000000127689', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryDeptsForManage]', '20160414000214', '/web3d/organization.do', 'queryDeptsForManage', '20');
INSERT INTO `gy_event` VALUES ('100000000127690', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[人员管理与授权]', '20160414000216', '/web3d/user.do', 'userInit', '115');
INSERT INTO `gy_event` VALUES ('100000000127691', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414000216', '/web3d/user.do', 'departmentTreeInit', '4');
INSERT INTO `gy_event` VALUES ('100000000127692', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryUsersForManage]', '20160414000216', '/web3d/user.do', 'queryUsersForManage', '29');
INSERT INTO `gy_event` VALUES ('100000000127693', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[userGrantInit]', '20160414000218', '/web3d/user.do', 'userGrantInit', '173');
INSERT INTO `gy_event` VALUES ('100000000127694', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[角色管理与授权]', '20160414000224', '/web3d/role.do', 'roleInit', '114');
INSERT INTO `gy_event` VALUES ('100000000127695', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414000224', '/web3d/role.do', 'departmentTreeInit', '5');
INSERT INTO `gy_event` VALUES ('100000000127696', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryRolesForManage]', '20160414000224', '/web3d/role.do', 'queryRolesForManage', '19');
INSERT INTO `gy_event` VALUES ('100000000127697', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[operatorTabInit]', '20160414000233', '/web3d/role.do', 'operatorTabInit', '225');
INSERT INTO `gy_event` VALUES ('100000000127698', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectUserTabInit]', '20160414000235', '/web3d/role.do', 'selectUserTabInit', '175');
INSERT INTO `gy_event` VALUES ('100000000127699', '10004922', 'admin', 'admin', '退出系统', '20160414000247', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127700', '10000000', 'super', '超级用户', '登录系统', '20160414000251', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127701', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414000252', '/web3d/index.do', 'indexInit', '166');
INSERT INTO `gy_event` VALUES ('100000000127702', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414000252', '/web3d/index.do', 'preferencesInit', '69');
INSERT INTO `gy_event` VALUES ('100000000127703', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414000253', '/web3d/common/gyinformation/queryForView.action', null, '8');
INSERT INTO `gy_event` VALUES ('100000000127704', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414000254', '/web3d/resource.do', 'menuResourceInit', '73');
INSERT INTO `gy_event` VALUES ('100000000127705', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000255', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127706', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000255', '/web3d/resource.do', 'queryMenuItemsForManage', '31');
INSERT INTO `gy_event` VALUES ('100000000127707', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000255', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127708', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000255', '/web3d/resource.do', 'queryMenuItems', '11');
INSERT INTO `gy_event` VALUES ('100000000127709', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000255', '/web3d/resource.do', 'queryMenuItems', '10');
INSERT INTO `gy_event` VALUES ('100000000127710', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000255', '/web3d/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127711', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414000256', '/web3d/role.do', 'roleInit', '129');
INSERT INTO `gy_event` VALUES ('100000000127712', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000256', '/web3d/role.do', 'departmentTreeInit', '9');
INSERT INTO `gy_event` VALUES ('100000000127713', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414000256', '/web3d/role.do', 'queryRolesForManage', '10');
INSERT INTO `gy_event` VALUES ('100000000127714', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414000259', '/web3d/role.do', 'operatorTabInit', '80');
INSERT INTO `gy_event` VALUES ('100000000127715', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[managerTabInit]', '20160414000306', '/web3d/role.do', 'managerTabInit', '170');
INSERT INTO `gy_event` VALUES ('100000000127716', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveGrant]', '20160414000312', '/web3d/role.do', 'saveGrant', '132');
INSERT INTO `gy_event` VALUES ('100000000127717', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[selectUserTabInit]', '20160414000314', '/web3d/role.do', 'selectUserTabInit', '46');
INSERT INTO `gy_event` VALUES ('100000000127718', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveUser]', '20160414000317', '/web3d/role.do', 'saveUser', '86');
INSERT INTO `gy_event` VALUES ('100000000127719', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414000322', '/web3d/index.do', 'indexInit', '157');
INSERT INTO `gy_event` VALUES ('100000000127720', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414000322', '/web3d/index.do', 'preferencesInit', '88');
INSERT INTO `gy_event` VALUES ('100000000127721', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414000323', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127722', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414000324', '/web3d/resource.do', 'menuResourceInit', '95');
INSERT INTO `gy_event` VALUES ('100000000127723', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000325', '/web3d/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127724', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000325', '/web3d/resource.do', 'queryMenuItemsForManage', '37');
INSERT INTO `gy_event` VALUES ('100000000127725', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000325', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127726', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000325', '/web3d/resource.do', 'queryMenuItems', '14');
INSERT INTO `gy_event` VALUES ('100000000127727', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000325', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127728', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000325', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127729', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414000328', '/web3d/role.do', 'roleInit', '92');
INSERT INTO `gy_event` VALUES ('100000000127730', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000328', '/web3d/role.do', 'departmentTreeInit', '11');
INSERT INTO `gy_event` VALUES ('100000000127731', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414000328', '/web3d/role.do', 'queryRolesForManage', '12');
INSERT INTO `gy_event` VALUES ('100000000127732', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414000330', '/web3d/role.do', 'operatorTabInit', '75');
INSERT INTO `gy_event` VALUES ('100000000127733', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[managerTabInit]', '20160414000336', '/web3d/role.do', 'managerTabInit', '48');
INSERT INTO `gy_event` VALUES ('100000000127734', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[人员管理与授权]', '20160414000346', '/web3d/user.do', 'userInit', '77');
INSERT INTO `gy_event` VALUES ('100000000127735', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000346', '/web3d/user.do', 'departmentTreeInit', '5');
INSERT INTO `gy_event` VALUES ('100000000127736', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryUsersForManage]', '20160414000346', '/web3d/user.do', 'queryUsersForManage', '6');
INSERT INTO `gy_event` VALUES ('100000000127737', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[userGrantInit]', '20160414000348', '/web3d/user.do', 'userGrantInit', '65');
INSERT INTO `gy_event` VALUES ('100000000127738', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[selectMenuInit]', '20160414000350', '/web3d/user.do', 'selectMenuInit', '156');
INSERT INTO `gy_event` VALUES ('100000000127739', '10000000', 'super', '超级用户', '退出系统', '20160414000420', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127740', '10004922', 'admin', 'admin', '登录系统', '20160414000427', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127741', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectRolespec]', '20160414000427', '/web3d/login.do', 'selectRolespec', '4');
INSERT INTO `gy_event` VALUES ('100000000127742', '10004922', 'admin', 'admin', '登录系统', '20160414000434', '/web3d/login.do', 'selectRolespec', null);
INSERT INTO `gy_event` VALUES ('100000000127743', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectRolespec]', '20160414000434', '/web3d/login.do', 'selectRolespec', '82');
INSERT INTO `gy_event` VALUES ('100000000127744', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[indexInit]', '20160414000434', '/web3d/index.do', 'indexInit', '86');
INSERT INTO `gy_event` VALUES ('100000000127745', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[preferencesInit]', '20160414000435', '/web3d/index.do', 'preferencesInit', '56');
INSERT INTO `gy_event` VALUES ('100000000127746', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000436', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127747', '10004922', 'admin', 'admin', '退出系统', '20160414000440', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127748', '10004923', 'user1', 'user1', '登录系统', '20160414000447', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127749', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[indexInit]', '20160414000447', '/web3d/index.do', 'indexInit', '89');
INSERT INTO `gy_event` VALUES ('100000000127750', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[preferencesInit]', '20160414000447', '/web3d/index.do', 'preferencesInit', '50');
INSERT INTO `gy_event` VALUES ('100000000127751', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[null]', '20160414000448', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127752', '10004923', 'user1', 'user1', '退出系统', '20160414000452', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127753', '10004922', 'admin', 'admin', '登录系统', '20160414000459', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127754', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectRolespec]', '20160414000459', '/web3d/login.do', 'selectRolespec', '5');
INSERT INTO `gy_event` VALUES ('100000000127755', '10004922', 'admin', 'admin', '登录系统', '20160414000501', '/web3d/login.do', 'selectRolespec', null);
INSERT INTO `gy_event` VALUES ('100000000127756', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectRolespec]', '20160414000501', '/web3d/login.do', 'selectRolespec', '51');
INSERT INTO `gy_event` VALUES ('100000000127757', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[indexInit]', '20160414000501', '/web3d/index.do', 'indexInit', '140');
INSERT INTO `gy_event` VALUES ('100000000127758', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[preferencesInit]', '20160414000502', '/web3d/index.do', 'preferencesInit', '72');
INSERT INTO `gy_event` VALUES ('100000000127759', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000502', '/web3d/common/gyinformation/queryForView.action', null, '19');
INSERT INTO `gy_event` VALUES ('100000000127760', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[菜单资源管理]', '20160414000504', '/web3d/resource.do', 'menuResourceInit', '122');
INSERT INTO `gy_event` VALUES ('100000000127761', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000505', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127762', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItemsForManage]', '20160414000505', '/web3d/resource.do', 'queryMenuItemsForManage', '22');
INSERT INTO `gy_event` VALUES ('100000000127763', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000505', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127764', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000505', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127765', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000505', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127766', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000505', '/web3d/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127767', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000520', '/web3d//category/categorys/init.action', null, '410');
INSERT INTO `gy_event` VALUES ('100000000127768', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000521', '/web3d//category/categorys/queryForManage.action', null, '12');
INSERT INTO `gy_event` VALUES ('100000000127769', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[init]', '20160414000523', '/web3d/login.do', 'init', '33');
INSERT INTO `gy_event` VALUES ('100000000127770', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[login]', '20160414000528', '/web3d/login.do', 'login', '4');
INSERT INTO `gy_event` VALUES ('100000000127771', '10004922', 'admin', 'admin', '退出系统', '20160414000530', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127772', '10000000', 'super', '超级用户', '登录系统', '20160414000530', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127773', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414000531', '/web3d/index.do', 'indexInit', '117');
INSERT INTO `gy_event` VALUES ('100000000127774', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414000531', '/web3d/index.do', 'preferencesInit', '88');
INSERT INTO `gy_event` VALUES ('100000000127775', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414000532', '/web3d/common/gyinformation/queryForView.action', null, '14');
INSERT INTO `gy_event` VALUES ('100000000127776', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160414000535', '/web3d/organization.do', 'departmentInit', '48');
INSERT INTO `gy_event` VALUES ('100000000127777', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000536', '/web3d/organization.do', 'departmentTreeInit', '4');
INSERT INTO `gy_event` VALUES ('100000000127778', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160414000536', '/web3d/organization.do', 'queryDeptsForManage', '18');
INSERT INTO `gy_event` VALUES ('100000000127779', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414000543', '/web3d/resource.do', 'menuResourceInit', '76');
INSERT INTO `gy_event` VALUES ('100000000127780', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000543', '/web3d/resource.do', 'queryMenuItemsForManage', '26');
INSERT INTO `gy_event` VALUES ('100000000127781', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000543', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127782', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000543', '/web3d/resource.do', 'queryMenuItems', '17');
INSERT INTO `gy_event` VALUES ('100000000127783', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000543', '/web3d/resource.do', 'queryMenuItems', '16');
INSERT INTO `gy_event` VALUES ('100000000127784', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000543', '/web3d/resource.do', 'queryMenuItems', '18');
INSERT INTO `gy_event` VALUES ('100000000127785', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414000543', '/web3d/resource.do', 'queryMenuItems', '36');
INSERT INTO `gy_event` VALUES ('100000000127786', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414000545', '/web3d/role.do', 'roleInit', '76');
INSERT INTO `gy_event` VALUES ('100000000127787', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000546', '/web3d/role.do', 'departmentTreeInit', '6');
INSERT INTO `gy_event` VALUES ('100000000127788', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414000546', '/web3d/role.do', 'queryRolesForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127789', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414000549', '/web3d/role.do', 'operatorTabInit', '82');
INSERT INTO `gy_event` VALUES ('100000000127790', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000601', '/web3d/resource.do', 'queryMenuItemsForManage', '16');
INSERT INTO `gy_event` VALUES ('100000000127791', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000604', '/web3d/resource.do', 'queryMenuItemsForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127792', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000606', '/web3d/resource.do', 'queryMenuItemsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127793', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000611', '/web3d/resource.do', 'queryMenuItemsForManage', '12');
INSERT INTO `gy_event` VALUES ('100000000127794', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414000620', '/web3d/resource.do', 'queryMenuItemsForManage', '6');
INSERT INTO `gy_event` VALUES ('100000000127795', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[人员管理与授权]', '20160414000632', '/web3d/user.do', 'userInit', '88');
INSERT INTO `gy_event` VALUES ('100000000127796', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryUsersForManage]', '20160414000632', '/web3d/user.do', 'queryUsersForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127797', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414000632', '/web3d/user.do', 'departmentTreeInit', '16');
INSERT INTO `gy_event` VALUES ('100000000127798', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[userGrantInit]', '20160414000633', '/web3d/user.do', 'userGrantInit', '48');
INSERT INTO `gy_event` VALUES ('100000000127799', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveSelectedRole]', '20160414000640', '/web3d/user.do', 'saveSelectedRole', '77');
INSERT INTO `gy_event` VALUES ('100000000127800', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[selectMenuInit]', '20160414000642', '/web3d/user.do', 'selectMenuInit', '42');
INSERT INTO `gy_event` VALUES ('100000000127801', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveSelectedMenu]', '20160414000652', '/web3d/user.do', 'saveSelectedMenu', '153');
INSERT INTO `gy_event` VALUES ('100000000127802', '10000000', 'super', '超级用户', '退出系统', '20160414000702', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127803', '10004922', 'admin', 'admin', '登录系统', '20160414000706', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127804', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[indexInit]', '20160414000706', '/web3d/index.do', 'indexInit', '197');
INSERT INTO `gy_event` VALUES ('100000000127805', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[preferencesInit]', '20160414000707', '/web3d/index.do', 'preferencesInit', '68');
INSERT INTO `gy_event` VALUES ('100000000127806', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414000708', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127807', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[菜单资源管理]', '20160414000709', '/web3d/resource.do', 'menuResourceInit', '73');
INSERT INTO `gy_event` VALUES ('100000000127808', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000710', '/web3d/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127809', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItemsForManage]', '20160414000710', '/web3d/resource.do', 'queryMenuItemsForManage', '34');
INSERT INTO `gy_event` VALUES ('100000000127810', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000710', '/web3d/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127811', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000710', '/web3d/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127812', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000710', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127813', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItems]', '20160414000710', '/web3d/resource.do', 'queryMenuItems', '11');
INSERT INTO `gy_event` VALUES ('100000000127814', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItemsForManage]', '20160414000712', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127815', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItemsForManage]', '20160414000713', '/web3d/resource.do', 'queryMenuItemsForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127816', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryMenuItemsForManage]', '20160414000716', '/web3d/resource.do', 'queryMenuItemsForManage', '6');
INSERT INTO `gy_event` VALUES ('100000000127817', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[角色管理与授权]', '20160414000729', '/web3d/role.do', 'roleInit', '86');
INSERT INTO `gy_event` VALUES ('100000000127818', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414000729', '/web3d/role.do', 'departmentTreeInit', '8');
INSERT INTO `gy_event` VALUES ('100000000127819', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryRolesForManage]', '20160414000729', '/web3d/role.do', 'queryRolesForManage', '10');
INSERT INTO `gy_event` VALUES ('100000000127820', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[operatorTabInit]', '20160414000731', '/web3d/role.do', 'operatorTabInit', '63');
INSERT INTO `gy_event` VALUES ('100000000127821', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[角色管理与授权]', '20160414000800', '/web3d/role.do', 'roleInit', '89');
INSERT INTO `gy_event` VALUES ('100000000127822', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414000801', '/web3d/role.do', 'departmentTreeInit', '3');
INSERT INTO `gy_event` VALUES ('100000000127823', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryRolesForManage]', '20160414000801', '/web3d/role.do', 'queryRolesForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127824', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[operatorTabInit]', '20160414000809', '/web3d/role.do', 'operatorTabInit', '45');
INSERT INTO `gy_event` VALUES ('100000000127825', '10004922', 'admin', 'admin', '退出系统', '20160414001810', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127826', '10000000', 'super', '超级用户', '登录系统', '20160414001816', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127827', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414001817', '/web3d/index.do', 'indexInit', '114');
INSERT INTO `gy_event` VALUES ('100000000127828', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414001817', '/web3d/index.do', 'preferencesInit', '66');
INSERT INTO `gy_event` VALUES ('100000000127829', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414001818', '/web3d/common/gyinformation/queryForView.action', null, '6');
INSERT INTO `gy_event` VALUES ('100000000127830', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414001819', '/web3d/resource.do', 'menuResourceInit', '71');
INSERT INTO `gy_event` VALUES ('100000000127831', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001819', '/web3d/resource.do', 'queryMenuItems', '4');
INSERT INTO `gy_event` VALUES ('100000000127832', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001819', '/web3d/resource.do', 'queryMenuItemsForManage', '56');
INSERT INTO `gy_event` VALUES ('100000000127833', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001819', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127834', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001819', '/web3d/resource.do', 'queryMenuItems', '6');
INSERT INTO `gy_event` VALUES ('100000000127835', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001819', '/web3d/resource.do', 'queryMenuItems', '13');
INSERT INTO `gy_event` VALUES ('100000000127836', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001819', '/web3d/resource.do', 'queryMenuItems', '10');
INSERT INTO `gy_event` VALUES ('100000000127837', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001821', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127838', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[deleteMenuItems]', '20160414001825', '/web3d/resource.do', 'deleteMenuItems', '38');
INSERT INTO `gy_event` VALUES ('100000000127839', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001825', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127840', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001825', '/web3d/resource.do', 'queryMenuItemsForManage', '10');
INSERT INTO `gy_event` VALUES ('100000000127841', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001826', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127842', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001826', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127843', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001826', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127844', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001828', '/web3d/resource.do', 'queryMenuItemsForManage', '79');
INSERT INTO `gy_event` VALUES ('100000000127845', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[deleteMenuItems]', '20160414001831', '/web3d/resource.do', 'deleteMenuItems', '40');
INSERT INTO `gy_event` VALUES ('100000000127846', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001831', '/web3d/resource.do', 'queryMenuItems', '14');
INSERT INTO `gy_event` VALUES ('100000000127847', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001831', '/web3d/resource.do', 'queryMenuItemsForManage', '51');
INSERT INTO `gy_event` VALUES ('100000000127848', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001832', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127849', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001832', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127850', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001832', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127851', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001834', '/web3d/resource.do', 'queryMenuItemsForManage', '26');
INSERT INTO `gy_event` VALUES ('100000000127852', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveMenuItem]', '20160414001846', '/web3d/resource.do', 'saveMenuItem', '102');
INSERT INTO `gy_event` VALUES ('100000000127853', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001846', '/web3d/resource.do', 'queryMenuItems', '10');
INSERT INTO `gy_event` VALUES ('100000000127854', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001846', '/web3d/resource.do', 'queryMenuItemsForManage', '25');
INSERT INTO `gy_event` VALUES ('100000000127855', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001846', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127856', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001846', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127857', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001846', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127858', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414001853', '/web3d/role.do', 'roleInit', '72');
INSERT INTO `gy_event` VALUES ('100000000127859', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414001853', '/web3d/role.do', 'departmentTreeInit', '9');
INSERT INTO `gy_event` VALUES ('100000000127860', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414001853', '/web3d/role.do', 'queryRolesForManage', '13');
INSERT INTO `gy_event` VALUES ('100000000127861', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160414001859', '/web3d/organization.do', 'departmentInit', '46');
INSERT INTO `gy_event` VALUES ('100000000127862', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414001859', '/web3d/organization.do', 'departmentTreeInit', '4');
INSERT INTO `gy_event` VALUES ('100000000127863', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160414001859', '/web3d/organization.do', 'queryDeptsForManage', '9');
INSERT INTO `gy_event` VALUES ('100000000127864', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001903', '/web3d/resource.do', 'queryMenuItemsForManage', '6');
INSERT INTO `gy_event` VALUES ('100000000127865', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414001908', '/web3d/role.do', 'operatorTabInit', '58');
INSERT INTO `gy_event` VALUES ('100000000127866', '10000000', 'super', '超级用户', '退出系统', '20160414001917', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127867', '10000000', 'super', '超级用户', '登录系统', '20160414001923', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127868', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414001923', '/web3d/index.do', 'indexInit', '110');
INSERT INTO `gy_event` VALUES ('100000000127869', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414001924', '/web3d/index.do', 'preferencesInit', '56');
INSERT INTO `gy_event` VALUES ('100000000127870', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414001924', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127871', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414001927', '/web3d/resource.do', 'menuResourceInit', '69');
INSERT INTO `gy_event` VALUES ('100000000127872', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001927', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127873', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414001927', '/web3d/resource.do', 'queryMenuItemsForManage', '26');
INSERT INTO `gy_event` VALUES ('100000000127874', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001928', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127875', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001928', '/web3d/resource.do', 'queryMenuItems', '17');
INSERT INTO `gy_event` VALUES ('100000000127876', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414001928', '/web3d/resource.do', 'queryMenuItems', '15');
INSERT INTO `gy_event` VALUES ('100000000127877', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414001930', '/web3d/role.do', 'roleInit', '81');
INSERT INTO `gy_event` VALUES ('100000000127878', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414001930', '/web3d/role.do', 'departmentTreeInit', '3');
INSERT INTO `gy_event` VALUES ('100000000127879', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414001930', '/web3d/role.do', 'queryRolesForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127880', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414001932', '/web3d/role.do', 'operatorTabInit', '48');
INSERT INTO `gy_event` VALUES ('100000000127881', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[managerTabInit]', '20160414001937', '/web3d/role.do', 'managerTabInit', '44');
INSERT INTO `gy_event` VALUES ('100000000127882', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveGrant]', '20160414001946', '/web3d/role.do', 'saveGrant', '117');
INSERT INTO `gy_event` VALUES ('100000000127883', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414002017', '/web3d/role.do', 'operatorTabInit', '50');
INSERT INTO `gy_event` VALUES ('100000000127884', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[managerTabInit]', '20160414002018', '/web3d/role.do', 'managerTabInit', '59');
INSERT INTO `gy_event` VALUES ('100000000127885', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[saveGrant]', '20160414002021', '/web3d/role.do', 'saveGrant', '78');
INSERT INTO `gy_event` VALUES ('100000000127886', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160414002026', '/web3d/organization.do', 'departmentInit', '43');
INSERT INTO `gy_event` VALUES ('100000000127887', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414002026', '/web3d/organization.do', 'departmentTreeInit', '7');
INSERT INTO `gy_event` VALUES ('100000000127888', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160414002026', '/web3d/organization.do', 'queryDeptsForManage', '11');
INSERT INTO `gy_event` VALUES ('100000000127889', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[人员管理与授权]', '20160414002032', '/web3d/user.do', 'userInit', '85');
INSERT INTO `gy_event` VALUES ('100000000127890', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryUsersForManage]', '20160414002033', '/web3d/user.do', 'queryUsersForManage', '5');
INSERT INTO `gy_event` VALUES ('100000000127891', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414002033', '/web3d/user.do', 'departmentTreeInit', '11');
INSERT INTO `gy_event` VALUES ('100000000127892', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[userGrantInit]', '20160414002034', '/web3d/user.do', 'userGrantInit', '73');
INSERT INTO `gy_event` VALUES ('100000000127893', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[selectMenuInit]', '20160414002036', '/web3d/user.do', 'selectMenuInit', '47');
INSERT INTO `gy_event` VALUES ('100000000127894', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414002052', '/web3d/role.do', 'roleInit', '93');
INSERT INTO `gy_event` VALUES ('100000000127895', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414002053', '/web3d/role.do', 'departmentTreeInit', '6');
INSERT INTO `gy_event` VALUES ('100000000127896', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414002053', '/web3d/role.do', 'queryRolesForManage', '7');
INSERT INTO `gy_event` VALUES ('100000000127897', '10000000', 'super', '超级用户', '退出系统', '20160414002102', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127898', '10000000', 'super', '超级用户', '登录系统', '20160414002107', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127899', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[indexInit]', '20160414002107', '/web3d/index.do', 'indexInit', '133');
INSERT INTO `gy_event` VALUES ('100000000127900', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[preferencesInit]', '20160414002108', '/web3d/index.do', 'preferencesInit', '58');
INSERT INTO `gy_event` VALUES ('100000000127901', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[null]', '20160414002108', '/web3d/common/gyinformation/queryForView.action', null, '9');
INSERT INTO `gy_event` VALUES ('100000000127902', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[组织机构管理]', '20160414002112', '/web3d/organization.do', 'departmentInit', '54');
INSERT INTO `gy_event` VALUES ('100000000127903', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414002112', '/web3d/organization.do', 'departmentTreeInit', '3');
INSERT INTO `gy_event` VALUES ('100000000127904', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryDeptsForManage]', '20160414002112', '/web3d/organization.do', 'queryDeptsForManage', '9');
INSERT INTO `gy_event` VALUES ('100000000127905', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[菜单资源管理]', '20160414002115', '/web3d/resource.do', 'menuResourceInit', '65');
INSERT INTO `gy_event` VALUES ('100000000127906', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414002115', '/web3d/resource.do', 'queryMenuItems', '8');
INSERT INTO `gy_event` VALUES ('100000000127907', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414002115', '/web3d/resource.do', 'queryMenuItemsForManage', '28');
INSERT INTO `gy_event` VALUES ('100000000127908', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414002115', '/web3d/resource.do', 'queryMenuItems', '7');
INSERT INTO `gy_event` VALUES ('100000000127909', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414002115', '/web3d/resource.do', 'queryMenuItems', '5');
INSERT INTO `gy_event` VALUES ('100000000127910', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItems]', '20160414002115', '/web3d/resource.do', 'queryMenuItems', '9');
INSERT INTO `gy_event` VALUES ('100000000127911', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414002117', '/web3d/resource.do', 'queryMenuItemsForManage', '6');
INSERT INTO `gy_event` VALUES ('100000000127912', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414002119', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127913', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryMenuItemsForManage]', '20160414002119', '/web3d/resource.do', 'queryMenuItemsForManage', '8');
INSERT INTO `gy_event` VALUES ('100000000127914', '10000000', 'super', '超级用户', '超级用户[super]打开了菜单[角色管理与授权]', '20160414002123', '/web3d/role.do', 'roleInit', '91');
INSERT INTO `gy_event` VALUES ('100000000127915', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[departmentTreeInit]', '20160414002123', '/web3d/role.do', 'departmentTreeInit', '16');
INSERT INTO `gy_event` VALUES ('100000000127916', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[queryRolesForManage]', '20160414002123', '/web3d/role.do', 'queryRolesForManage', '16');
INSERT INTO `gy_event` VALUES ('100000000127917', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414002129', '/web3d/role.do', 'operatorTabInit', '55');
INSERT INTO `gy_event` VALUES ('100000000127918', '10000000', 'super', '超级用户', '超级用户[super]调用了Action方法[operatorTabInit]', '20160414002140', '/web3d/role.do', 'operatorTabInit', '55');
INSERT INTO `gy_event` VALUES ('100000000127919', '10000000', 'super', '超级用户', '退出系统', '20160414002150', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127920', '10004922', 'admin', 'admin', '登录系统', '20160414002153', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127921', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[indexInit]', '20160414002154', '/web3d/index.do', 'indexInit', '90');
INSERT INTO `gy_event` VALUES ('100000000127922', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[preferencesInit]', '20160414002154', '/web3d/index.do', 'preferencesInit', '50');
INSERT INTO `gy_event` VALUES ('100000000127923', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[null]', '20160414002154', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127924', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[组织机构管理]', '20160414002156', '/web3d/organization.do', 'departmentInit', '55');
INSERT INTO `gy_event` VALUES ('100000000127925', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414002157', '/web3d/organization.do', 'departmentTreeInit', '3');
INSERT INTO `gy_event` VALUES ('100000000127926', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryDeptsForManage]', '20160414002157', '/web3d/organization.do', 'queryDeptsForManage', '15');
INSERT INTO `gy_event` VALUES ('100000000127927', '10004922', 'admin', 'admin', 'admin[admin]打开了菜单[人员管理与授权]', '20160414002159', '/web3d/user.do', 'userInit', '76');
INSERT INTO `gy_event` VALUES ('100000000127928', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[departmentTreeInit]', '20160414002159', '/web3d/user.do', 'departmentTreeInit', '10');
INSERT INTO `gy_event` VALUES ('100000000127929', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[queryUsersForManage]', '20160414002159', '/web3d/user.do', 'queryUsersForManage', '19');
INSERT INTO `gy_event` VALUES ('100000000127930', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[userGrantInit]', '20160414002201', '/web3d/user.do', 'userGrantInit', '48');
INSERT INTO `gy_event` VALUES ('100000000127931', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[selectMenuInit]', '20160414002202', '/web3d/user.do', 'selectMenuInit', '45');
INSERT INTO `gy_event` VALUES ('100000000127932', '10004922', 'admin', 'admin', 'admin[admin]调用了Action方法[saveSelectedMenu]', '20160414002207', '/web3d/user.do', 'saveSelectedMenu', '58');
INSERT INTO `gy_event` VALUES ('100000000127933', '10004922', 'admin', 'admin', '退出系统', '20160414002213', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127934', '10004923', 'user1', 'user1', '登录系统', '20160414002217', '/web3d/login.do', 'login', null);
INSERT INTO `gy_event` VALUES ('100000000127935', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[indexInit]', '20160414002217', '/web3d/index.do', 'indexInit', '82');
INSERT INTO `gy_event` VALUES ('100000000127936', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[preferencesInit]', '20160414002217', '/web3d/index.do', 'preferencesInit', '44');
INSERT INTO `gy_event` VALUES ('100000000127937', '10004923', 'user1', 'user1', 'user1[user1]调用了Action方法[null]', '20160414002218', '/web3d/common/gyinformation/queryForView.action', null, '7');
INSERT INTO `gy_event` VALUES ('100000000127938', '10004923', 'user1', 'user1', '退出系统', '20160414002224', '/web3d/login.do', 'logout', null);
INSERT INTO `gy_event` VALUES ('100000000127939', '10000001', 'dev', '初始管理员', '登录系统', '20160414002230', '/web3d/login.do', 'login', null);

-- ----------------------------
-- Table structure for `gy_exception`
-- ----------------------------
DROP TABLE IF EXISTS `gy_exception`;
CREATE TABLE `gy_exception` (
  `EXCEPTIONID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLAZZ` varchar(200) DEFAULT NULL,
  `METHODNAME` varchar(50) DEFAULT NULL,
  `ACTIVETIME` bigint(14) DEFAULT NULL,
  `EXCEPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`EXCEPTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常监控表';

-- ----------------------------
-- Records of gy_exception
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_help`
-- ----------------------------
DROP TABLE IF EXISTS `gy_help`;
CREATE TABLE `gy_help` (
  `HELPID` varchar(8) NOT NULL,
  `MENUID` varchar(8) NOT NULL,
  `CONTENT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`HELPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助信息表';

-- ----------------------------
-- Records of gy_help
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_httpsession`
-- ----------------------------
DROP TABLE IF EXISTS `gy_httpsession`;
CREATE TABLE `gy_httpsession` (
  `SESSIONID` varchar(100) NOT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `ACCOUNT` varchar(30) DEFAULT NULL,
  `CREATETIME` varchar(20) DEFAULT NULL,
  `LOGINIP` varchar(100) DEFAULT NULL,
  `USERID` varchar(8) DEFAULT NULL,
  `EXPLORER` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SESSIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HTTP会话资源管理';

-- ----------------------------
-- Records of gy_httpsession
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_icon`
-- ----------------------------
DROP TABLE IF EXISTS `gy_icon`;
CREATE TABLE `gy_icon` (
  `ICONID` varchar(8) NOT NULL,
  `FILENAME` varchar(50) NOT NULL,
  `CSSNAME` varchar(50) NOT NULL,
  UNIQUE KEY `UK1_EAICON` (`FILENAME`) USING BTREE,
  UNIQUE KEY `CSSNAME_UNIQUE` (`CSSNAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统图标表';

-- ----------------------------
-- Records of gy_icon
-- ----------------------------
INSERT INTO `gy_icon` VALUES ('10000018', 'accept.png', 'acceptIcon');
INSERT INTO `gy_icon` VALUES ('10000046', 'add.png', 'addIcon');
INSERT INTO `gy_icon` VALUES ('10000008', 'application.png', 'applicationIcon');
INSERT INTO `gy_icon` VALUES ('10000010', 'application_cascade.png', 'application_cascadeIcon');
INSERT INTO `gy_icon` VALUES ('10000009', 'application_double.png', 'application_doubleIcon');
INSERT INTO `gy_icon` VALUES ('10000005', 'application_home.png', 'application_homeIcon');
INSERT INTO `gy_icon` VALUES ('10000028', 'application_view_list.png', 'application_view_listIcon');
INSERT INTO `gy_icon` VALUES ('10000063', 'app_boxes.png', 'app_boxesIcon');
INSERT INTO `gy_icon` VALUES ('10000064', 'app_left.png', 'app_leftIcon');
INSERT INTO `gy_icon` VALUES ('10000065', 'app_right.png', 'app_rightIcon');
INSERT INTO `gy_icon` VALUES ('10000022', 'arrow_refresh.png', 'arrow_refreshIcon');
INSERT INTO `gy_icon` VALUES ('10000066', 'arrow_switch.png', 'arrow_switchIcon');
INSERT INTO `gy_icon` VALUES ('10000048', 'award_star_silver_3.png', 'award_star_silver_3Icon');
INSERT INTO `gy_icon` VALUES ('10000025', 'book_previous.png', 'book_previousIcon');
INSERT INTO `gy_icon` VALUES ('10000053', 'bug.png', 'bugIcon');
INSERT INTO `gy_icon` VALUES ('10000033', 'building.png', 'buildingIcon');
INSERT INTO `gy_icon` VALUES ('10000067', 'calendar.png', 'calendarIcon');
INSERT INTO `gy_icon` VALUES ('10000032', 'chart_organisation.png', 'chart_organisationIcon');
INSERT INTO `gy_icon` VALUES ('10000037', 'collapse-all.gif', 'collapse-allIcon');
INSERT INTO `gy_icon` VALUES ('10000007', 'comments.png', 'commentsIcon');
INSERT INTO `gy_icon` VALUES ('10000012', 'comments_add.png', 'comments_addIcon');
INSERT INTO `gy_icon` VALUES ('10000017', 'comment_add.png', 'comment_addIcon');
INSERT INTO `gy_icon` VALUES ('10000054', 'config.png', 'configIcon');
INSERT INTO `gy_icon` VALUES ('10000004', 'cup.png', 'cupIcon');
INSERT INTO `gy_icon` VALUES ('10000051', 'database_connect.png', 'database_connectIcon');
INSERT INTO `gy_icon` VALUES ('10000056', 'database_refresh.png', 'database_refreshIcon');
INSERT INTO `gy_icon` VALUES ('10000019', 'delete.png', 'deleteIcon');
INSERT INTO `gy_icon` VALUES ('10000049', 'disconnect.png', 'disconnectIcon');
INSERT INTO `gy_icon` VALUES ('10000058', 'docs.gif', 'docsIcon');
INSERT INTO `gy_icon` VALUES ('10000062', 'download.png', 'downloadIcon');
INSERT INTO `gy_icon` VALUES ('10000047', 'edit1.png', 'edit1Icon');
INSERT INTO `gy_icon` VALUES ('10000052', 'exclamation.png', 'exclamationIcon');
INSERT INTO `gy_icon` VALUES ('10000036', 'expand-all.gif', 'expand-allIcon');
INSERT INTO `gy_icon` VALUES ('10000001', 'folder_camera.png', 'folder_cameraIcon');
INSERT INTO `gy_icon` VALUES ('10000003', 'folder_feed.png', 'folder_feedIcon');
INSERT INTO `gy_icon` VALUES ('10000002', 'folder_user.png', 'folder_userIcon');
INSERT INTO `gy_icon` VALUES ('10000000', 'folder_wrench.png', 'folder_wrenchIcon');
INSERT INTO `gy_icon` VALUES ('10000006', 'group.png', 'groupIcon');
INSERT INTO `gy_icon` VALUES ('10000039', 'group_link.png', 'group_linkIcon');
INSERT INTO `gy_icon` VALUES ('10000027', 'image.png', 'imageIcon');
INSERT INTO `gy_icon` VALUES ('10000029', 'key.png', 'keyIcon');
INSERT INTO `gy_icon` VALUES ('10000031', 'layout_content.png', 'layout_contentIcon');
INSERT INTO `gy_icon` VALUES ('10000023', 'lock.png', 'lockIcon');
INSERT INTO `gy_icon` VALUES ('10000041', 'medal_gold_1.png', 'medal_gold_1Icon');
INSERT INTO `gy_icon` VALUES ('10000040', 'medal_silver_3.png', 'medal_silver_3Icon');
INSERT INTO `gy_icon` VALUES ('10000060', 'message_edit.png', 'message_editIcon');
INSERT INTO `gy_icon` VALUES ('20000000', 'n_accept.png', 'n_acceptIcon');
INSERT INTO `gy_icon` VALUES ('20000001', 'n_add.png', 'n_addIcon');
INSERT INTO `gy_icon` VALUES ('20000002', 'n_anchor.png', 'n_anchorIcon');
INSERT INTO `gy_icon` VALUES ('20000003', 'n_application.png', 'n_applicationIcon');
INSERT INTO `gy_icon` VALUES ('20000004', 'n_application_add.png', 'n_application_addIcon');
INSERT INTO `gy_icon` VALUES ('20000005', 'n_application_cascade.png', 'n_application_cascadeIcon');
INSERT INTO `gy_icon` VALUES ('20000006', 'n_application_delete.png', 'n_application_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000007', 'n_application_double.png', 'n_application_doubleIcon');
INSERT INTO `gy_icon` VALUES ('20000008', 'n_application_edit.png', 'n_application_editIcon');
INSERT INTO `gy_icon` VALUES ('20000009', 'n_application_error.png', 'n_application_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000010', 'n_application_form.png', 'n_application_formIcon');
INSERT INTO `gy_icon` VALUES ('20000011', 'n_application_form_add.png', 'n_application_form_addIcon');
INSERT INTO `gy_icon` VALUES ('20000012', 'n_application_form_delete.png', 'n_application_form_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000013', 'n_application_form_edit.png', 'n_application_form_editIcon');
INSERT INTO `gy_icon` VALUES ('20000014', 'n_application_form_magnify.png', 'n_application_form_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000015', 'n_application_get.png', 'n_application_getIcon');
INSERT INTO `gy_icon` VALUES ('20000016', 'n_application_go.png', 'n_application_goIcon');
INSERT INTO `gy_icon` VALUES ('20000017', 'n_application_home.png', 'n_application_homeIcon');
INSERT INTO `gy_icon` VALUES ('20000018', 'n_application_key.png', 'n_application_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000019', 'n_application_lightning.png', 'n_application_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000020', 'n_application_link.png', 'n_application_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000021', 'n_application_osx.png', 'n_application_osxIcon');
INSERT INTO `gy_icon` VALUES ('20000022', 'n_application_osx_terminal.png', 'n_application_osx_terminalIcon');
INSERT INTO `gy_icon` VALUES ('20000023', 'n_application_put.png', 'n_application_putIcon');
INSERT INTO `gy_icon` VALUES ('20000024', 'n_application_side_boxes.png', 'n_application_side_boxesIcon');
INSERT INTO `gy_icon` VALUES ('20000025', 'n_application_side_contract.png', 'n_application_side_contractIcon');
INSERT INTO `gy_icon` VALUES ('20000026', 'n_application_side_expand.png', 'n_application_side_expandIcon');
INSERT INTO `gy_icon` VALUES ('20000027', 'n_application_side_list.png', 'n_application_side_listIcon');
INSERT INTO `gy_icon` VALUES ('20000028', 'n_application_side_tree.png', 'n_application_side_treeIcon');
INSERT INTO `gy_icon` VALUES ('20000029', 'n_application_split.png', 'n_application_splitIcon');
INSERT INTO `gy_icon` VALUES ('20000030', 'n_application_tile_horizontal.png', 'n_application_tile_horizontalIcon');
INSERT INTO `gy_icon` VALUES ('20000031', 'n_application_tile_vertical.png', 'n_application_tile_verticalIcon');
INSERT INTO `gy_icon` VALUES ('20000032', 'n_application_view_columns.png', 'n_application_view_columnsIcon');
INSERT INTO `gy_icon` VALUES ('20000033', 'n_application_view_detail.png', 'n_application_view_detailIcon');
INSERT INTO `gy_icon` VALUES ('20000034', 'n_application_view_gallery.png', 'n_application_view_galleryIcon');
INSERT INTO `gy_icon` VALUES ('20000035', 'n_application_view_icons.png', 'n_application_view_iconsIcon');
INSERT INTO `gy_icon` VALUES ('20000036', 'n_application_view_list.png', 'n_application_view_listIcon');
INSERT INTO `gy_icon` VALUES ('20000037', 'n_application_view_tile.png', 'n_application_view_tileIcon');
INSERT INTO `gy_icon` VALUES ('20000038', 'n_application_xp.png', 'n_application_xpIcon');
INSERT INTO `gy_icon` VALUES ('20000039', 'n_application_xp_terminal.png', 'n_application_xp_terminalIcon');
INSERT INTO `gy_icon` VALUES ('20000040', 'n_arrow_branch.png', 'n_arrow_branchIcon');
INSERT INTO `gy_icon` VALUES ('20000041', 'n_arrow_divide.png', 'n_arrow_divideIcon');
INSERT INTO `gy_icon` VALUES ('20000042', 'n_arrow_down.png', 'n_arrow_downIcon');
INSERT INTO `gy_icon` VALUES ('20000043', 'n_arrow_in.png', 'n_arrow_inIcon');
INSERT INTO `gy_icon` VALUES ('20000044', 'n_arrow_inout.png', 'n_arrow_inoutIcon');
INSERT INTO `gy_icon` VALUES ('20000045', 'n_arrow_join.png', 'n_arrow_joinIcon');
INSERT INTO `gy_icon` VALUES ('20000046', 'n_arrow_left.png', 'n_arrow_leftIcon');
INSERT INTO `gy_icon` VALUES ('20000047', 'n_arrow_merge.png', 'n_arrow_mergeIcon');
INSERT INTO `gy_icon` VALUES ('20000048', 'n_arrow_out.png', 'n_arrow_outIcon');
INSERT INTO `gy_icon` VALUES ('20000049', 'n_arrow_redo.png', 'n_arrow_redoIcon');
INSERT INTO `gy_icon` VALUES ('20000050', 'n_arrow_refresh.png', 'n_arrow_refreshIcon');
INSERT INTO `gy_icon` VALUES ('20000051', 'n_arrow_refresh_small.png', 'n_arrow_refresh_smallIcon');
INSERT INTO `gy_icon` VALUES ('20000052', 'n_arrow_rotate_anticlockwise.png', 'n_arrow_rotate_anticlockwiseIcon');
INSERT INTO `gy_icon` VALUES ('20000053', 'n_arrow_rotate_clockwise.png', 'n_arrow_rotate_clockwiseIcon');
INSERT INTO `gy_icon` VALUES ('20000054', 'n_arrow_switch.png', 'n_arrow_switchIcon');
INSERT INTO `gy_icon` VALUES ('20000055', 'n_arrow_turn_left.png', 'n_arrow_turn_leftIcon');
INSERT INTO `gy_icon` VALUES ('20000056', 'n_arrow_turn_right.png', 'n_arrow_turn_rightIcon');
INSERT INTO `gy_icon` VALUES ('20000057', 'n_arrow_undo.png', 'n_arrow_undoIcon');
INSERT INTO `gy_icon` VALUES ('20000058', 'n_arrow_up.png', 'n_arrow_upIcon');
INSERT INTO `gy_icon` VALUES ('20000059', 'n_asterisk_orange.png', 'n_asterisk_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000060', 'n_asterisk_yellow.png', 'n_asterisk_yellowIcon');
INSERT INTO `gy_icon` VALUES ('20000061', 'n_attach.png', 'n_attachIcon');
INSERT INTO `gy_icon` VALUES ('20000062', 'n_award_star_add.png', 'n_award_star_addIcon');
INSERT INTO `gy_icon` VALUES ('20000063', 'n_award_star_bronze_1.png', 'n_award_star_bronze_1Icon');
INSERT INTO `gy_icon` VALUES ('20000064', 'n_award_star_bronze_2.png', 'n_award_star_bronze_2Icon');
INSERT INTO `gy_icon` VALUES ('20000065', 'n_award_star_bronze_3.png', 'n_award_star_bronze_3Icon');
INSERT INTO `gy_icon` VALUES ('20000066', 'n_award_star_delete.png', 'n_award_star_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000067', 'n_award_star_gold_1.png', 'n_award_star_gold_1Icon');
INSERT INTO `gy_icon` VALUES ('20000068', 'n_award_star_gold_2.png', 'n_award_star_gold_2Icon');
INSERT INTO `gy_icon` VALUES ('20000069', 'n_award_star_gold_3.png', 'n_award_star_gold_3Icon');
INSERT INTO `gy_icon` VALUES ('20000070', 'n_award_star_silver_1.png', 'n_award_star_silver_1Icon');
INSERT INTO `gy_icon` VALUES ('20000071', 'n_award_star_silver_2.png', 'n_award_star_silver_2Icon');
INSERT INTO `gy_icon` VALUES ('20000072', 'n_award_star_silver_3.png', 'n_award_star_silver_3Icon');
INSERT INTO `gy_icon` VALUES ('20000073', 'n_basket.png', 'n_basketIcon');
INSERT INTO `gy_icon` VALUES ('20000074', 'n_basket_add.png', 'n_basket_addIcon');
INSERT INTO `gy_icon` VALUES ('20000075', 'n_basket_delete.png', 'n_basket_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000076', 'n_basket_edit.png', 'n_basket_editIcon');
INSERT INTO `gy_icon` VALUES ('20000077', 'n_basket_error.png', 'n_basket_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000078', 'n_basket_go.png', 'n_basket_goIcon');
INSERT INTO `gy_icon` VALUES ('20000079', 'n_basket_put.png', 'n_basket_putIcon');
INSERT INTO `gy_icon` VALUES ('20000080', 'n_basket_remove.png', 'n_basket_removeIcon');
INSERT INTO `gy_icon` VALUES ('20000081', 'n_bell.png', 'n_bellIcon');
INSERT INTO `gy_icon` VALUES ('20000082', 'n_bell_add.png', 'n_bell_addIcon');
INSERT INTO `gy_icon` VALUES ('20000083', 'n_bell_delete.png', 'n_bell_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000084', 'n_bell_error.png', 'n_bell_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000085', 'n_bell_go.png', 'n_bell_goIcon');
INSERT INTO `gy_icon` VALUES ('20000086', 'n_bell_link.png', 'n_bell_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000087', 'n_bin.png', 'n_binIcon');
INSERT INTO `gy_icon` VALUES ('20000088', 'n_bin_closed.png', 'n_bin_closedIcon');
INSERT INTO `gy_icon` VALUES ('20000089', 'n_bin_empty.png', 'n_bin_emptyIcon');
INSERT INTO `gy_icon` VALUES ('20000090', 'n_bomb.png', 'n_bombIcon');
INSERT INTO `gy_icon` VALUES ('20000091', 'n_book.png', 'n_bookIcon');
INSERT INTO `gy_icon` VALUES ('20000092', 'n_book_add.png', 'n_book_addIcon');
INSERT INTO `gy_icon` VALUES ('20000093', 'n_book_addresses.png', 'n_book_addressesIcon');
INSERT INTO `gy_icon` VALUES ('20000094', 'n_book_delete.png', 'n_book_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000095', 'n_book_edit.png', 'n_book_editIcon');
INSERT INTO `gy_icon` VALUES ('20000096', 'n_book_error.png', 'n_book_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000097', 'n_book_go.png', 'n_book_goIcon');
INSERT INTO `gy_icon` VALUES ('20000098', 'n_book_key.png', 'n_book_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000099', 'n_book_link.png', 'n_book_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000100', 'n_book_next.png', 'n_book_nextIcon');
INSERT INTO `gy_icon` VALUES ('20000101', 'n_book_open.png', 'n_book_openIcon');
INSERT INTO `gy_icon` VALUES ('20000102', 'n_book_previous.png', 'n_book_previousIcon');
INSERT INTO `gy_icon` VALUES ('20000103', 'n_box.png', 'n_boxIcon');
INSERT INTO `gy_icon` VALUES ('20000104', 'n_brick.png', 'n_brickIcon');
INSERT INTO `gy_icon` VALUES ('20000111', 'n_bricks.png', 'n_bricksIcon');
INSERT INTO `gy_icon` VALUES ('20000105', 'n_brick_add.png', 'n_brick_addIcon');
INSERT INTO `gy_icon` VALUES ('20000106', 'n_brick_delete.png', 'n_brick_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000107', 'n_brick_edit.png', 'n_brick_editIcon');
INSERT INTO `gy_icon` VALUES ('20000108', 'n_brick_error.png', 'n_brick_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000109', 'n_brick_go.png', 'n_brick_goIcon');
INSERT INTO `gy_icon` VALUES ('20000110', 'n_brick_link.png', 'n_brick_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000112', 'n_briefcase.png', 'n_briefcaseIcon');
INSERT INTO `gy_icon` VALUES ('20000113', 'n_bug.png', 'n_bugIcon');
INSERT INTO `gy_icon` VALUES ('20000114', 'n_bug_add.png', 'n_bug_addIcon');
INSERT INTO `gy_icon` VALUES ('20000115', 'n_bug_delete.png', 'n_bug_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000116', 'n_bug_edit.png', 'n_bug_editIcon');
INSERT INTO `gy_icon` VALUES ('20000117', 'n_bug_error.png', 'n_bug_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000118', 'n_bug_go.png', 'n_bug_goIcon');
INSERT INTO `gy_icon` VALUES ('20000119', 'n_bug_link.png', 'n_bug_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000120', 'n_building.png', 'n_buildingIcon');
INSERT INTO `gy_icon` VALUES ('20000121', 'n_building_add.png', 'n_building_addIcon');
INSERT INTO `gy_icon` VALUES ('20000122', 'n_building_delete.png', 'n_building_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000123', 'n_building_edit.png', 'n_building_editIcon');
INSERT INTO `gy_icon` VALUES ('20000124', 'n_building_error.png', 'n_building_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000125', 'n_building_go.png', 'n_building_goIcon');
INSERT INTO `gy_icon` VALUES ('20000126', 'n_building_key.png', 'n_building_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000127', 'n_building_link.png', 'n_building_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000128', 'n_bullet_add.png', 'n_bullet_addIcon');
INSERT INTO `gy_icon` VALUES ('20000129', 'n_bullet_arrow_bottom.png', 'n_bullet_arrow_bottomIcon');
INSERT INTO `gy_icon` VALUES ('20000130', 'n_bullet_arrow_down.png', 'n_bullet_arrow_downIcon');
INSERT INTO `gy_icon` VALUES ('20000131', 'n_bullet_arrow_top.png', 'n_bullet_arrow_topIcon');
INSERT INTO `gy_icon` VALUES ('20000132', 'n_bullet_arrow_up.png', 'n_bullet_arrow_upIcon');
INSERT INTO `gy_icon` VALUES ('20000133', 'n_bullet_black.png', 'n_bullet_blackIcon');
INSERT INTO `gy_icon` VALUES ('20000134', 'n_bullet_blue.png', 'n_bullet_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000135', 'n_bullet_delete.png', 'n_bullet_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000136', 'n_bullet_disk.png', 'n_bullet_diskIcon');
INSERT INTO `gy_icon` VALUES ('20000137', 'n_bullet_error.png', 'n_bullet_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000138', 'n_bullet_feed.png', 'n_bullet_feedIcon');
INSERT INTO `gy_icon` VALUES ('20000139', 'n_bullet_go.png', 'n_bullet_goIcon');
INSERT INTO `gy_icon` VALUES ('20000140', 'n_bullet_green.png', 'n_bullet_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000141', 'n_bullet_key.png', 'n_bullet_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000142', 'n_bullet_orange.png', 'n_bullet_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000143', 'n_bullet_picture.png', 'n_bullet_pictureIcon');
INSERT INTO `gy_icon` VALUES ('20000144', 'n_bullet_pink.png', 'n_bullet_pinkIcon');
INSERT INTO `gy_icon` VALUES ('20000145', 'n_bullet_purple.png', 'n_bullet_purpleIcon');
INSERT INTO `gy_icon` VALUES ('20000146', 'n_bullet_red.png', 'n_bullet_redIcon');
INSERT INTO `gy_icon` VALUES ('20000147', 'n_bullet_star.png', 'n_bullet_starIcon');
INSERT INTO `gy_icon` VALUES ('20000148', 'n_bullet_toggle_minus.png', 'n_bullet_toggle_minusIcon');
INSERT INTO `gy_icon` VALUES ('20000149', 'n_bullet_toggle_plus.png', 'n_bullet_toggle_plusIcon');
INSERT INTO `gy_icon` VALUES ('20000150', 'n_bullet_white.png', 'n_bullet_whiteIcon');
INSERT INTO `gy_icon` VALUES ('20000151', 'n_bullet_wrench.png', 'n_bullet_wrenchIcon');
INSERT INTO `gy_icon` VALUES ('20000152', 'n_bullet_yellow.png', 'n_bullet_yellowIcon');
INSERT INTO `gy_icon` VALUES ('20000153', 'n_cake.png', 'n_cakeIcon');
INSERT INTO `gy_icon` VALUES ('20000154', 'n_calculator.png', 'n_calculatorIcon');
INSERT INTO `gy_icon` VALUES ('20000155', 'n_calculator_add.png', 'n_calculator_addIcon');
INSERT INTO `gy_icon` VALUES ('20000156', 'n_calculator_delete.png', 'n_calculator_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000157', 'n_calculator_edit.png', 'n_calculator_editIcon');
INSERT INTO `gy_icon` VALUES ('20000158', 'n_calculator_error.png', 'n_calculator_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000159', 'n_calculator_link.png', 'n_calculator_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000160', 'n_calendar.png', 'n_calendarIcon');
INSERT INTO `gy_icon` VALUES ('20000161', 'n_calendar_add.png', 'n_calendar_addIcon');
INSERT INTO `gy_icon` VALUES ('20000162', 'n_calendar_delete.png', 'n_calendar_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000163', 'n_calendar_edit.png', 'n_calendar_editIcon');
INSERT INTO `gy_icon` VALUES ('20000164', 'n_calendar_link.png', 'n_calendar_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000165', 'n_calendar_view_day.png', 'n_calendar_view_dayIcon');
INSERT INTO `gy_icon` VALUES ('20000166', 'n_calendar_view_month.png', 'n_calendar_view_monthIcon');
INSERT INTO `gy_icon` VALUES ('20000167', 'n_calendar_view_week.png', 'n_calendar_view_weekIcon');
INSERT INTO `gy_icon` VALUES ('20000168', 'n_camera.png', 'n_cameraIcon');
INSERT INTO `gy_icon` VALUES ('20000169', 'n_camera_add.png', 'n_camera_addIcon');
INSERT INTO `gy_icon` VALUES ('20000170', 'n_camera_delete.png', 'n_camera_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000171', 'n_camera_edit.png', 'n_camera_editIcon');
INSERT INTO `gy_icon` VALUES ('20000172', 'n_camera_error.png', 'n_camera_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000173', 'n_camera_go.png', 'n_camera_goIcon');
INSERT INTO `gy_icon` VALUES ('20000174', 'n_camera_link.png', 'n_camera_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000175', 'n_camera_small.png', 'n_camera_smallIcon');
INSERT INTO `gy_icon` VALUES ('20000176', 'n_cancel.png', 'n_cancelIcon');
INSERT INTO `gy_icon` VALUES ('20000177', 'n_car.png', 'n_carIcon');
INSERT INTO `gy_icon` VALUES ('20000180', 'n_cart.png', 'n_cartIcon');
INSERT INTO `gy_icon` VALUES ('20000181', 'n_cart_add.png', 'n_cart_addIcon');
INSERT INTO `gy_icon` VALUES ('20000182', 'n_cart_delete.png', 'n_cart_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000183', 'n_cart_edit.png', 'n_cart_editIcon');
INSERT INTO `gy_icon` VALUES ('20000184', 'n_cart_error.png', 'n_cart_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000185', 'n_cart_go.png', 'n_cart_goIcon');
INSERT INTO `gy_icon` VALUES ('20000186', 'n_cart_put.png', 'n_cart_putIcon');
INSERT INTO `gy_icon` VALUES ('20000187', 'n_cart_remove.png', 'n_cart_removeIcon');
INSERT INTO `gy_icon` VALUES ('20000178', 'n_car_add.png', 'n_car_addIcon');
INSERT INTO `gy_icon` VALUES ('20000179', 'n_car_delete.png', 'n_car_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000188', 'n_cd.png', 'n_cdIcon');
INSERT INTO `gy_icon` VALUES ('20000189', 'n_cd_add.png', 'n_cd_addIcon');
INSERT INTO `gy_icon` VALUES ('20000190', 'n_cd_burn.png', 'n_cd_burnIcon');
INSERT INTO `gy_icon` VALUES ('20000191', 'n_cd_delete.png', 'n_cd_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000192', 'n_cd_edit.png', 'n_cd_editIcon');
INSERT INTO `gy_icon` VALUES ('20000193', 'n_cd_eject.png', 'n_cd_ejectIcon');
INSERT INTO `gy_icon` VALUES ('20000194', 'n_cd_go.png', 'n_cd_goIcon');
INSERT INTO `gy_icon` VALUES ('20000195', 'n_chart_bar.png', 'n_chart_barIcon');
INSERT INTO `gy_icon` VALUES ('20000196', 'n_chart_bar_add.png', 'n_chart_bar_addIcon');
INSERT INTO `gy_icon` VALUES ('20000197', 'n_chart_bar_delete.png', 'n_chart_bar_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000198', 'n_chart_bar_edit.png', 'n_chart_bar_editIcon');
INSERT INTO `gy_icon` VALUES ('20000199', 'n_chart_bar_error.png', 'n_chart_bar_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000200', 'n_chart_bar_link.png', 'n_chart_bar_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000201', 'n_chart_curve.png', 'n_chart_curveIcon');
INSERT INTO `gy_icon` VALUES ('20000202', 'n_chart_curve_add.png', 'n_chart_curve_addIcon');
INSERT INTO `gy_icon` VALUES ('20000203', 'n_chart_curve_delete.png', 'n_chart_curve_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000204', 'n_chart_curve_edit.png', 'n_chart_curve_editIcon');
INSERT INTO `gy_icon` VALUES ('20000205', 'n_chart_curve_error.png', 'n_chart_curve_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000206', 'n_chart_curve_go.png', 'n_chart_curve_goIcon');
INSERT INTO `gy_icon` VALUES ('20000207', 'n_chart_curve_link.png', 'n_chart_curve_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000208', 'n_chart_line.png', 'n_chart_lineIcon');
INSERT INTO `gy_icon` VALUES ('20000209', 'n_chart_line_add.png', 'n_chart_line_addIcon');
INSERT INTO `gy_icon` VALUES ('20000210', 'n_chart_line_delete.png', 'n_chart_line_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000211', 'n_chart_line_edit.png', 'n_chart_line_editIcon');
INSERT INTO `gy_icon` VALUES ('20000212', 'n_chart_line_error.png', 'n_chart_line_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000213', 'n_chart_line_link.png', 'n_chart_line_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000214', 'n_chart_organisation.png', 'n_chart_organisationIcon');
INSERT INTO `gy_icon` VALUES ('20000215', 'n_chart_organisation_add.png', 'n_chart_organisation_addIcon');
INSERT INTO `gy_icon` VALUES ('20000216', 'n_chart_organisation_delete.png', 'n_chart_organisation_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000217', 'n_chart_pie.png', 'n_chart_pieIcon');
INSERT INTO `gy_icon` VALUES ('20000218', 'n_chart_pie_add.png', 'n_chart_pie_addIcon');
INSERT INTO `gy_icon` VALUES ('20000219', 'n_chart_pie_delete.png', 'n_chart_pie_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000220', 'n_chart_pie_edit.png', 'n_chart_pie_editIcon');
INSERT INTO `gy_icon` VALUES ('20000221', 'n_chart_pie_error.png', 'n_chart_pie_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000222', 'n_chart_pie_link.png', 'n_chart_pie_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000223', 'n_clock.png', 'n_clockIcon');
INSERT INTO `gy_icon` VALUES ('20000224', 'n_clock_add.png', 'n_clock_addIcon');
INSERT INTO `gy_icon` VALUES ('20000225', 'n_clock_delete.png', 'n_clock_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000226', 'n_clock_edit.png', 'n_clock_editIcon');
INSERT INTO `gy_icon` VALUES ('20000227', 'n_clock_error.png', 'n_clock_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000228', 'n_clock_go.png', 'n_clock_goIcon');
INSERT INTO `gy_icon` VALUES ('20000229', 'n_clock_link.png', 'n_clock_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000230', 'n_clock_pause.png', 'n_clock_pauseIcon');
INSERT INTO `gy_icon` VALUES ('20000231', 'n_clock_play.png', 'n_clock_playIcon');
INSERT INTO `gy_icon` VALUES ('20000232', 'n_clock_red.png', 'n_clock_redIcon');
INSERT INTO `gy_icon` VALUES ('20000233', 'n_clock_stop.png', 'n_clock_stopIcon');
INSERT INTO `gy_icon` VALUES ('20000234', 'n_cog.png', 'n_cogIcon');
INSERT INTO `gy_icon` VALUES ('20000235', 'n_cog_add.png', 'n_cog_addIcon');
INSERT INTO `gy_icon` VALUES ('20000236', 'n_cog_delete.png', 'n_cog_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000237', 'n_cog_edit.png', 'n_cog_editIcon');
INSERT INTO `gy_icon` VALUES ('20000238', 'n_cog_error.png', 'n_cog_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000239', 'n_cog_go.png', 'n_cog_goIcon');
INSERT INTO `gy_icon` VALUES ('20000240', 'n_coins.png', 'n_coinsIcon');
INSERT INTO `gy_icon` VALUES ('20000241', 'n_coins_add.png', 'n_coins_addIcon');
INSERT INTO `gy_icon` VALUES ('20000242', 'n_coins_delete.png', 'n_coins_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000243', 'n_color_swatch.png', 'n_color_swatchIcon');
INSERT INTO `gy_icon` VALUES ('20000244', 'n_color_wheel.png', 'n_color_wheelIcon');
INSERT INTO `gy_icon` VALUES ('20000245', 'n_comment.png', 'n_commentIcon');
INSERT INTO `gy_icon` VALUES ('20000249', 'n_comments.png', 'n_commentsIcon');
INSERT INTO `gy_icon` VALUES ('20000250', 'n_comments_add.png', 'n_comments_addIcon');
INSERT INTO `gy_icon` VALUES ('20000251', 'n_comments_delete.png', 'n_comments_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000246', 'n_comment_add.png', 'n_comment_addIcon');
INSERT INTO `gy_icon` VALUES ('20000247', 'n_comment_delete.png', 'n_comment_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000248', 'n_comment_edit.png', 'n_comment_editIcon');
INSERT INTO `gy_icon` VALUES ('20000252', 'n_compress.png', 'n_compressIcon');
INSERT INTO `gy_icon` VALUES ('20000253', 'n_computer.png', 'n_computerIcon');
INSERT INTO `gy_icon` VALUES ('20000254', 'n_computer_add.png', 'n_computer_addIcon');
INSERT INTO `gy_icon` VALUES ('20000255', 'n_computer_delete.png', 'n_computer_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000256', 'n_computer_edit.png', 'n_computer_editIcon');
INSERT INTO `gy_icon` VALUES ('20000257', 'n_computer_error.png', 'n_computer_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000258', 'n_computer_go.png', 'n_computer_goIcon');
INSERT INTO `gy_icon` VALUES ('20000259', 'n_computer_key.png', 'n_computer_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000260', 'n_computer_link.png', 'n_computer_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000261', 'n_connect.png', 'n_connectIcon');
INSERT INTO `gy_icon` VALUES ('20000262', 'n_contrast.png', 'n_contrastIcon');
INSERT INTO `gy_icon` VALUES ('20000263', 'n_contrast_decrease.png', 'n_contrast_decreaseIcon');
INSERT INTO `gy_icon` VALUES ('20000264', 'n_contrast_high.png', 'n_contrast_highIcon');
INSERT INTO `gy_icon` VALUES ('20000265', 'n_contrast_increase.png', 'n_contrast_increaseIcon');
INSERT INTO `gy_icon` VALUES ('20000266', 'n_contrast_low.png', 'n_contrast_lowIcon');
INSERT INTO `gy_icon` VALUES ('20000287', 'n_controller.png', 'n_controllerIcon');
INSERT INTO `gy_icon` VALUES ('20000288', 'n_controller_add.png', 'n_controller_addIcon');
INSERT INTO `gy_icon` VALUES ('20000289', 'n_controller_delete.png', 'n_controller_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000290', 'n_controller_error.png', 'n_controller_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000267', 'n_control_eject.png', 'n_control_ejectIcon');
INSERT INTO `gy_icon` VALUES ('20000268', 'n_control_eject_blue.png', 'n_control_eject_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000269', 'n_control_end.png', 'n_control_endIcon');
INSERT INTO `gy_icon` VALUES ('20000270', 'n_control_end_blue.png', 'n_control_end_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000271', 'n_control_equalizer.png', 'n_control_equalizerIcon');
INSERT INTO `gy_icon` VALUES ('20000272', 'n_control_equalizer_blue.png', 'n_control_equalizer_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000273', 'n_control_fastforward.png', 'n_control_fastforwardIcon');
INSERT INTO `gy_icon` VALUES ('20000274', 'n_control_fastforward_blue.png', 'n_control_fastforward_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000275', 'n_control_pause.png', 'n_control_pauseIcon');
INSERT INTO `gy_icon` VALUES ('20000276', 'n_control_pause_blue.png', 'n_control_pause_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000277', 'n_control_play.png', 'n_control_playIcon');
INSERT INTO `gy_icon` VALUES ('20000278', 'n_control_play_blue.png', 'n_control_play_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000279', 'n_control_repeat.png', 'n_control_repeatIcon');
INSERT INTO `gy_icon` VALUES ('20000280', 'n_control_repeat_blue.png', 'n_control_repeat_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000281', 'n_control_rewind.png', 'n_control_rewindIcon');
INSERT INTO `gy_icon` VALUES ('20000282', 'n_control_rewind_blue.png', 'n_control_rewind_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000283', 'n_control_start.png', 'n_control_startIcon');
INSERT INTO `gy_icon` VALUES ('20000284', 'n_control_start_blue.png', 'n_control_start_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000285', 'n_control_stop.png', 'n_control_stopIcon');
INSERT INTO `gy_icon` VALUES ('20000286', 'n_control_stop_blue.png', 'n_control_stop_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000291', 'n_creditcards.png', 'n_creditcardsIcon');
INSERT INTO `gy_icon` VALUES ('20000292', 'n_cross.png', 'n_crossIcon');
INSERT INTO `gy_icon` VALUES ('20000293', 'n_css.png', 'n_cssIcon');
INSERT INTO `gy_icon` VALUES ('20000294', 'n_css_add.png', 'n_css_addIcon');
INSERT INTO `gy_icon` VALUES ('20000295', 'n_css_delete.png', 'n_css_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000296', 'n_css_go.png', 'n_css_goIcon');
INSERT INTO `gy_icon` VALUES ('20000297', 'n_css_valid.png', 'n_css_validIcon');
INSERT INTO `gy_icon` VALUES ('20000298', 'n_cup.png', 'n_cupIcon');
INSERT INTO `gy_icon` VALUES ('20000299', 'n_cup_add.png', 'n_cup_addIcon');
INSERT INTO `gy_icon` VALUES ('20000300', 'n_cup_delete.png', 'n_cup_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000301', 'n_cup_edit.png', 'n_cup_editIcon');
INSERT INTO `gy_icon` VALUES ('20000302', 'n_cup_error.png', 'n_cup_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000303', 'n_cup_go.png', 'n_cup_goIcon');
INSERT INTO `gy_icon` VALUES ('20000304', 'n_cup_key.png', 'n_cup_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000305', 'n_cup_link.png', 'n_cup_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000306', 'n_cursor.png', 'n_cursorIcon');
INSERT INTO `gy_icon` VALUES ('20000307', 'n_cut.png', 'n_cutIcon');
INSERT INTO `gy_icon` VALUES ('20000308', 'n_cut_red.png', 'n_cut_redIcon');
INSERT INTO `gy_icon` VALUES ('20000309', 'n_database.png', 'n_databaseIcon');
INSERT INTO `gy_icon` VALUES ('20000310', 'n_database_add.png', 'n_database_addIcon');
INSERT INTO `gy_icon` VALUES ('20000311', 'n_database_connect.png', 'n_database_connectIcon');
INSERT INTO `gy_icon` VALUES ('20000312', 'n_database_delete.png', 'n_database_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000313', 'n_database_edit.png', 'n_database_editIcon');
INSERT INTO `gy_icon` VALUES ('20000314', 'n_database_error.png', 'n_database_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000315', 'n_database_gear.png', 'n_database_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000316', 'n_database_go.png', 'n_database_goIcon');
INSERT INTO `gy_icon` VALUES ('20000317', 'n_database_key.png', 'n_database_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000318', 'n_database_lightning.png', 'n_database_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000319', 'n_database_link.png', 'n_database_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000320', 'n_database_refresh.png', 'n_database_refreshIcon');
INSERT INTO `gy_icon` VALUES ('20000321', 'n_database_save.png', 'n_database_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000322', 'n_database_table.png', 'n_database_tableIcon');
INSERT INTO `gy_icon` VALUES ('20000323', 'n_date.png', 'n_dateIcon');
INSERT INTO `gy_icon` VALUES ('20000324', 'n_date_add.png', 'n_date_addIcon');
INSERT INTO `gy_icon` VALUES ('20000325', 'n_date_delete.png', 'n_date_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000326', 'n_date_edit.png', 'n_date_editIcon');
INSERT INTO `gy_icon` VALUES ('20000327', 'n_date_error.png', 'n_date_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000328', 'n_date_go.png', 'n_date_goIcon');
INSERT INTO `gy_icon` VALUES ('20000329', 'n_date_link.png', 'n_date_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000330', 'n_date_magnify.png', 'n_date_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000331', 'n_date_next.png', 'n_date_nextIcon');
INSERT INTO `gy_icon` VALUES ('20000332', 'n_date_previous.png', 'n_date_previousIcon');
INSERT INTO `gy_icon` VALUES ('20000333', 'n_delete.png', 'n_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000334', 'n_disconnect.png', 'n_disconnectIcon');
INSERT INTO `gy_icon` VALUES ('20000335', 'n_disk.png', 'n_diskIcon');
INSERT INTO `gy_icon` VALUES ('20000336', 'n_disk_multiple.png', 'n_disk_multipleIcon');
INSERT INTO `gy_icon` VALUES ('20000337', 'n_door.png', 'n_doorIcon');
INSERT INTO `gy_icon` VALUES ('20000338', 'n_door_in.png', 'n_door_inIcon');
INSERT INTO `gy_icon` VALUES ('20000339', 'n_door_open.png', 'n_door_openIcon');
INSERT INTO `gy_icon` VALUES ('20000340', 'n_door_out.png', 'n_door_outIcon');
INSERT INTO `gy_icon` VALUES ('20000341', 'n_drink.png', 'n_drinkIcon');
INSERT INTO `gy_icon` VALUES ('20000342', 'n_drink_empty.png', 'n_drink_emptyIcon');
INSERT INTO `gy_icon` VALUES ('20000343', 'n_drive.png', 'n_driveIcon');
INSERT INTO `gy_icon` VALUES ('20000344', 'n_drive_add.png', 'n_drive_addIcon');
INSERT INTO `gy_icon` VALUES ('20000345', 'n_drive_burn.png', 'n_drive_burnIcon');
INSERT INTO `gy_icon` VALUES ('20000346', 'n_drive_cd.png', 'n_drive_cdIcon');
INSERT INTO `gy_icon` VALUES ('20000347', 'n_drive_cd_empty.png', 'n_drive_cd_emptyIcon');
INSERT INTO `gy_icon` VALUES ('20000348', 'n_drive_delete.png', 'n_drive_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000349', 'n_drive_disk.png', 'n_drive_diskIcon');
INSERT INTO `gy_icon` VALUES ('20000350', 'n_drive_edit.png', 'n_drive_editIcon');
INSERT INTO `gy_icon` VALUES ('20000351', 'n_drive_error.png', 'n_drive_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000352', 'n_drive_go.png', 'n_drive_goIcon');
INSERT INTO `gy_icon` VALUES ('20000353', 'n_drive_key.png', 'n_drive_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000354', 'n_drive_link.png', 'n_drive_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000355', 'n_drive_magnify.png', 'n_drive_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000356', 'n_drive_network.png', 'n_drive_networkIcon');
INSERT INTO `gy_icon` VALUES ('20000357', 'n_drive_rename.png', 'n_drive_renameIcon');
INSERT INTO `gy_icon` VALUES ('20000358', 'n_drive_user.png', 'n_drive_userIcon');
INSERT INTO `gy_icon` VALUES ('20000359', 'n_drive_web.png', 'n_drive_webIcon');
INSERT INTO `gy_icon` VALUES ('20000360', 'n_dvd.png', 'n_dvdIcon');
INSERT INTO `gy_icon` VALUES ('20000361', 'n_dvd_add.png', 'n_dvd_addIcon');
INSERT INTO `gy_icon` VALUES ('20000362', 'n_dvd_delete.png', 'n_dvd_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000363', 'n_dvd_edit.png', 'n_dvd_editIcon');
INSERT INTO `gy_icon` VALUES ('20000364', 'n_dvd_error.png', 'n_dvd_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000365', 'n_dvd_go.png', 'n_dvd_goIcon');
INSERT INTO `gy_icon` VALUES ('20000366', 'n_dvd_key.png', 'n_dvd_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000367', 'n_dvd_link.png', 'n_dvd_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000368', 'n_email.png', 'n_emailIcon');
INSERT INTO `gy_icon` VALUES ('20000369', 'n_email_add.png', 'n_email_addIcon');
INSERT INTO `gy_icon` VALUES ('20000370', 'n_email_attach.png', 'n_email_attachIcon');
INSERT INTO `gy_icon` VALUES ('20000371', 'n_email_delete.png', 'n_email_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000372', 'n_email_edit.png', 'n_email_editIcon');
INSERT INTO `gy_icon` VALUES ('20000373', 'n_email_error.png', 'n_email_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000374', 'n_email_go.png', 'n_email_goIcon');
INSERT INTO `gy_icon` VALUES ('20000375', 'n_email_link.png', 'n_email_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000376', 'n_email_open.png', 'n_email_openIcon');
INSERT INTO `gy_icon` VALUES ('20000377', 'n_email_open_image.png', 'n_email_open_imageIcon');
INSERT INTO `gy_icon` VALUES ('20000378', 'n_emoticon_evilgrin.png', 'n_emoticon_evilgrinIcon');
INSERT INTO `gy_icon` VALUES ('20000379', 'n_emoticon_grin.png', 'n_emoticon_grinIcon');
INSERT INTO `gy_icon` VALUES ('20000380', 'n_emoticon_happy.png', 'n_emoticon_happyIcon');
INSERT INTO `gy_icon` VALUES ('20000381', 'n_emoticon_smile.png', 'n_emoticon_smileIcon');
INSERT INTO `gy_icon` VALUES ('20000382', 'n_emoticon_surprised.png', 'n_emoticon_surprisedIcon');
INSERT INTO `gy_icon` VALUES ('20000383', 'n_emoticon_tongue.png', 'n_emoticon_tongueIcon');
INSERT INTO `gy_icon` VALUES ('20000384', 'n_emoticon_unhappy.png', 'n_emoticon_unhappyIcon');
INSERT INTO `gy_icon` VALUES ('20000385', 'n_emoticon_waii.png', 'n_emoticon_waiiIcon');
INSERT INTO `gy_icon` VALUES ('20000386', 'n_emoticon_wink.png', 'n_emoticon_winkIcon');
INSERT INTO `gy_icon` VALUES ('20000387', 'n_error.png', 'n_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000388', 'n_error_add.png', 'n_error_addIcon');
INSERT INTO `gy_icon` VALUES ('20000389', 'n_error_delete.png', 'n_error_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000390', 'n_error_go.png', 'n_error_goIcon');
INSERT INTO `gy_icon` VALUES ('20000391', 'n_exclamation.png', 'n_exclamationIcon');
INSERT INTO `gy_icon` VALUES ('20000392', 'n_eye.png', 'n_eyeIcon');
INSERT INTO `gy_icon` VALUES ('20000393', 'n_feed.png', 'n_feedIcon');
INSERT INTO `gy_icon` VALUES ('20000394', 'n_feed_add.png', 'n_feed_addIcon');
INSERT INTO `gy_icon` VALUES ('20000395', 'n_feed_delete.png', 'n_feed_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000396', 'n_feed_disk.png', 'n_feed_diskIcon');
INSERT INTO `gy_icon` VALUES ('20000397', 'n_feed_edit.png', 'n_feed_editIcon');
INSERT INTO `gy_icon` VALUES ('20000398', 'n_feed_error.png', 'n_feed_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000399', 'n_feed_go.png', 'n_feed_goIcon');
INSERT INTO `gy_icon` VALUES ('20000400', 'n_feed_key.png', 'n_feed_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000401', 'n_feed_link.png', 'n_feed_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000402', 'n_feed_magnify.png', 'n_feed_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000403', 'n_female.png', 'n_femaleIcon');
INSERT INTO `gy_icon` VALUES ('20000404', 'n_film.png', 'n_filmIcon');
INSERT INTO `gy_icon` VALUES ('20000405', 'n_film_add.png', 'n_film_addIcon');
INSERT INTO `gy_icon` VALUES ('20000406', 'n_film_delete.png', 'n_film_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000407', 'n_film_edit.png', 'n_film_editIcon');
INSERT INTO `gy_icon` VALUES ('20000408', 'n_film_error.png', 'n_film_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000409', 'n_film_go.png', 'n_film_goIcon');
INSERT INTO `gy_icon` VALUES ('20000410', 'n_film_key.png', 'n_film_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000411', 'n_film_link.png', 'n_film_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000412', 'n_film_save.png', 'n_film_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000413', 'n_find.png', 'n_findIcon');
INSERT INTO `gy_icon` VALUES ('20000414', 'n_flag_blue.png', 'n_flag_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000415', 'n_flag_green.png', 'n_flag_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000416', 'n_flag_orange.png', 'n_flag_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000417', 'n_flag_pink.png', 'n_flag_pinkIcon');
INSERT INTO `gy_icon` VALUES ('20000418', 'n_flag_purple.png', 'n_flag_purpleIcon');
INSERT INTO `gy_icon` VALUES ('20000419', 'n_flag_red.png', 'n_flag_redIcon');
INSERT INTO `gy_icon` VALUES ('20000420', 'n_flag_yellow.png', 'n_flag_yellowIcon');
INSERT INTO `gy_icon` VALUES ('20000421', 'n_folder.png', 'n_folderIcon');
INSERT INTO `gy_icon` VALUES ('20000422', 'n_folder_add.png', 'n_folder_addIcon');
INSERT INTO `gy_icon` VALUES ('20000423', 'n_folder_bell.png', 'n_folder_bellIcon');
INSERT INTO `gy_icon` VALUES ('20000424', 'n_folder_brick.png', 'n_folder_brickIcon');
INSERT INTO `gy_icon` VALUES ('20000425', 'n_folder_bug.png', 'n_folder_bugIcon');
INSERT INTO `gy_icon` VALUES ('20000426', 'n_folder_camera.png', 'n_folder_cameraIcon');
INSERT INTO `gy_icon` VALUES ('20000427', 'n_folder_database.png', 'n_folder_databaseIcon');
INSERT INTO `gy_icon` VALUES ('20000428', 'n_folder_delete.png', 'n_folder_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000429', 'n_folder_edit.png', 'n_folder_editIcon');
INSERT INTO `gy_icon` VALUES ('20000430', 'n_folder_error.png', 'n_folder_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000431', 'n_folder_explore.png', 'n_folder_exploreIcon');
INSERT INTO `gy_icon` VALUES ('20000432', 'n_folder_feed.png', 'n_folder_feedIcon');
INSERT INTO `gy_icon` VALUES ('20000433', 'n_folder_find.png', 'n_folder_findIcon');
INSERT INTO `gy_icon` VALUES ('20000434', 'n_folder_go.png', 'n_folder_goIcon');
INSERT INTO `gy_icon` VALUES ('20000435', 'n_folder_heart.png', 'n_folder_heartIcon');
INSERT INTO `gy_icon` VALUES ('20000436', 'n_folder_image.png', 'n_folder_imageIcon');
INSERT INTO `gy_icon` VALUES ('20000437', 'n_folder_key.png', 'n_folder_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000438', 'n_folder_lightbulb.png', 'n_folder_lightbulbIcon');
INSERT INTO `gy_icon` VALUES ('20000439', 'n_folder_link.png', 'n_folder_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000440', 'n_folder_magnify.png', 'n_folder_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000441', 'n_folder_page.png', 'n_folder_pageIcon');
INSERT INTO `gy_icon` VALUES ('20000442', 'n_folder_page_white.png', 'n_folder_page_whiteIcon');
INSERT INTO `gy_icon` VALUES ('20000443', 'n_folder_palette.png', 'n_folder_paletteIcon');
INSERT INTO `gy_icon` VALUES ('20000444', 'n_folder_picture.png', 'n_folder_pictureIcon');
INSERT INTO `gy_icon` VALUES ('20000445', 'n_folder_star.png', 'n_folder_starIcon');
INSERT INTO `gy_icon` VALUES ('20000446', 'n_folder_table.png', 'n_folder_tableIcon');
INSERT INTO `gy_icon` VALUES ('20000447', 'n_folder_user.png', 'n_folder_userIcon');
INSERT INTO `gy_icon` VALUES ('20000448', 'n_folder_wrench.png', 'n_folder_wrenchIcon');
INSERT INTO `gy_icon` VALUES ('20000449', 'n_font.png', 'n_fontIcon');
INSERT INTO `gy_icon` VALUES ('20000450', 'n_font_add.png', 'n_font_addIcon');
INSERT INTO `gy_icon` VALUES ('20000451', 'n_font_delete.png', 'n_font_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000452', 'n_font_go.png', 'n_font_goIcon');
INSERT INTO `gy_icon` VALUES ('20000453', 'n_group.png', 'n_groupIcon');
INSERT INTO `gy_icon` VALUES ('20000454', 'n_group_add.png', 'n_group_addIcon');
INSERT INTO `gy_icon` VALUES ('20000455', 'n_group_delete.png', 'n_group_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000456', 'n_group_edit.png', 'n_group_editIcon');
INSERT INTO `gy_icon` VALUES ('20000457', 'n_group_error.png', 'n_group_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000458', 'n_group_gear.png', 'n_group_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000459', 'n_group_go.png', 'n_group_goIcon');
INSERT INTO `gy_icon` VALUES ('20000460', 'n_group_key.png', 'n_group_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000461', 'n_group_link.png', 'n_group_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000462', 'n_heart.png', 'n_heartIcon');
INSERT INTO `gy_icon` VALUES ('20000463', 'n_heart_add.png', 'n_heart_addIcon');
INSERT INTO `gy_icon` VALUES ('20000464', 'n_heart_delete.png', 'n_heart_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000465', 'n_help.png', 'n_helpIcon');
INSERT INTO `gy_icon` VALUES ('20000466', 'n_hourglass.png', 'n_hourglassIcon');
INSERT INTO `gy_icon` VALUES ('20000467', 'n_hourglass_add.png', 'n_hourglass_addIcon');
INSERT INTO `gy_icon` VALUES ('20000468', 'n_hourglass_delete.png', 'n_hourglass_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000469', 'n_hourglass_go.png', 'n_hourglass_goIcon');
INSERT INTO `gy_icon` VALUES ('20000470', 'n_hourglass_link.png', 'n_hourglass_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000471', 'n_house.png', 'n_houseIcon');
INSERT INTO `gy_icon` VALUES ('20000472', 'n_house_go.png', 'n_house_goIcon');
INSERT INTO `gy_icon` VALUES ('20000473', 'n_house_link.png', 'n_house_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000474', 'n_html.png', 'n_htmlIcon');
INSERT INTO `gy_icon` VALUES ('20000475', 'n_html_add.png', 'n_html_addIcon');
INSERT INTO `gy_icon` VALUES ('20000476', 'n_html_delete.png', 'n_html_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000477', 'n_html_go.png', 'n_html_goIcon');
INSERT INTO `gy_icon` VALUES ('20000478', 'n_html_valid.png', 'n_html_validIcon');
INSERT INTO `gy_icon` VALUES ('20000479', 'n_image.png', 'n_imageIcon');
INSERT INTO `gy_icon` VALUES ('20000484', 'n_images.png', 'n_imagesIcon');
INSERT INTO `gy_icon` VALUES ('20000480', 'n_image_add.png', 'n_image_addIcon');
INSERT INTO `gy_icon` VALUES ('20000481', 'n_image_delete.png', 'n_image_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000482', 'n_image_edit.png', 'n_image_editIcon');
INSERT INTO `gy_icon` VALUES ('20000483', 'n_image_link.png', 'n_image_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000485', 'n_information.png', 'n_informationIcon');
INSERT INTO `gy_icon` VALUES ('20000486', 'n_ipod.png', 'n_ipodIcon');
INSERT INTO `gy_icon` VALUES ('20000487', 'n_ipod_cast.png', 'n_ipod_castIcon');
INSERT INTO `gy_icon` VALUES ('20000488', 'n_ipod_cast_add.png', 'n_ipod_cast_addIcon');
INSERT INTO `gy_icon` VALUES ('20000489', 'n_ipod_cast_delete.png', 'n_ipod_cast_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000490', 'n_ipod_sound.png', 'n_ipod_soundIcon');
INSERT INTO `gy_icon` VALUES ('20000491', 'n_joystick.png', 'n_joystickIcon');
INSERT INTO `gy_icon` VALUES ('20000492', 'n_joystick_add.png', 'n_joystick_addIcon');
INSERT INTO `gy_icon` VALUES ('20000493', 'n_joystick_delete.png', 'n_joystick_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000494', 'n_joystick_error.png', 'n_joystick_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000495', 'n_key.png', 'n_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000499', 'n_keyboard.png', 'n_keyboardIcon');
INSERT INTO `gy_icon` VALUES ('20000500', 'n_keyboard_add.png', 'n_keyboard_addIcon');
INSERT INTO `gy_icon` VALUES ('20000501', 'n_keyboard_delete.png', 'n_keyboard_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000502', 'n_keyboard_magnify.png', 'n_keyboard_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000496', 'n_key_add.png', 'n_key_addIcon');
INSERT INTO `gy_icon` VALUES ('20000497', 'n_key_delete.png', 'n_key_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000498', 'n_key_go.png', 'n_key_goIcon');
INSERT INTO `gy_icon` VALUES ('20000503', 'n_layers.png', 'n_layersIcon');
INSERT INTO `gy_icon` VALUES ('20000504', 'n_layout.png', 'n_layoutIcon');
INSERT INTO `gy_icon` VALUES ('20000505', 'n_layout_add.png', 'n_layout_addIcon');
INSERT INTO `gy_icon` VALUES ('20000506', 'n_layout_content.png', 'n_layout_contentIcon');
INSERT INTO `gy_icon` VALUES ('20000507', 'n_layout_delete.png', 'n_layout_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000508', 'n_layout_edit.png', 'n_layout_editIcon');
INSERT INTO `gy_icon` VALUES ('20000509', 'n_layout_error.png', 'n_layout_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000510', 'n_layout_header.png', 'n_layout_headerIcon');
INSERT INTO `gy_icon` VALUES ('20000511', 'n_layout_link.png', 'n_layout_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000512', 'n_layout_sidebar.png', 'n_layout_sidebarIcon');
INSERT INTO `gy_icon` VALUES ('20000513', 'n_lightbulb.png', 'n_lightbulbIcon');
INSERT INTO `gy_icon` VALUES ('20000514', 'n_lightbulb_add.png', 'n_lightbulb_addIcon');
INSERT INTO `gy_icon` VALUES ('20000515', 'n_lightbulb_delete.png', 'n_lightbulb_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000516', 'n_lightbulb_off.png', 'n_lightbulb_offIcon');
INSERT INTO `gy_icon` VALUES ('20000517', 'n_lightning.png', 'n_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000518', 'n_lightning_add.png', 'n_lightning_addIcon');
INSERT INTO `gy_icon` VALUES ('20000519', 'n_lightning_delete.png', 'n_lightning_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000520', 'n_lightning_go.png', 'n_lightning_goIcon');
INSERT INTO `gy_icon` VALUES ('20000521', 'n_link.png', 'n_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000522', 'n_link_add.png', 'n_link_addIcon');
INSERT INTO `gy_icon` VALUES ('20000523', 'n_link_break.png', 'n_link_breakIcon');
INSERT INTO `gy_icon` VALUES ('20000524', 'n_link_delete.png', 'n_link_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000525', 'n_link_edit.png', 'n_link_editIcon');
INSERT INTO `gy_icon` VALUES ('20000526', 'n_link_error.png', 'n_link_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000527', 'n_link_go.png', 'n_link_goIcon');
INSERT INTO `gy_icon` VALUES ('20000528', 'n_lock.png', 'n_lockIcon');
INSERT INTO `gy_icon` VALUES ('20000529', 'n_lock_add.png', 'n_lock_addIcon');
INSERT INTO `gy_icon` VALUES ('20000530', 'n_lock_break.png', 'n_lock_breakIcon');
INSERT INTO `gy_icon` VALUES ('20000531', 'n_lock_delete.png', 'n_lock_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000532', 'n_lock_edit.png', 'n_lock_editIcon');
INSERT INTO `gy_icon` VALUES ('20000533', 'n_lock_go.png', 'n_lock_goIcon');
INSERT INTO `gy_icon` VALUES ('20000534', 'n_lock_open.png', 'n_lock_openIcon');
INSERT INTO `gy_icon` VALUES ('20000535', 'n_lorry.png', 'n_lorryIcon');
INSERT INTO `gy_icon` VALUES ('20000536', 'n_lorry_add.png', 'n_lorry_addIcon');
INSERT INTO `gy_icon` VALUES ('20000537', 'n_lorry_delete.png', 'n_lorry_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000538', 'n_lorry_error.png', 'n_lorry_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000539', 'n_lorry_flatbed.png', 'n_lorry_flatbedIcon');
INSERT INTO `gy_icon` VALUES ('20000540', 'n_lorry_go.png', 'n_lorry_goIcon');
INSERT INTO `gy_icon` VALUES ('20000541', 'n_lorry_link.png', 'n_lorry_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000542', 'n_magifier_zoom_out.png', 'n_magifier_zoom_outIcon');
INSERT INTO `gy_icon` VALUES ('20000543', 'n_magnifier.png', 'n_magnifierIcon');
INSERT INTO `gy_icon` VALUES ('20000544', 'n_magnifier_zoom_in.png', 'n_magnifier_zoom_inIcon');
INSERT INTO `gy_icon` VALUES ('20000545', 'n_male.png', 'n_maleIcon');
INSERT INTO `gy_icon` VALUES ('20000546', 'n_map_add.png', 'n_map_addIcon');
INSERT INTO `gy_icon` VALUES ('20000547', 'n_map_delete.png', 'n_map_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000548', 'n_map_edit.png', 'n_map_editIcon');
INSERT INTO `gy_icon` VALUES ('20000549', 'n_map_go.png', 'n_map_goIcon');
INSERT INTO `gy_icon` VALUES ('20000550', 'n_map_magnify.png', 'n_map_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000551', 'n_medal_bronze_1.png', 'n_medal_bronze_1Icon');
INSERT INTO `gy_icon` VALUES ('20000552', 'n_medal_bronze_2.png', 'n_medal_bronze_2Icon');
INSERT INTO `gy_icon` VALUES ('20000553', 'n_medal_bronze_3.png', 'n_medal_bronze_3Icon');
INSERT INTO `gy_icon` VALUES ('20000554', 'n_medal_bronze_add.png', 'n_medal_bronze_addIcon');
INSERT INTO `gy_icon` VALUES ('20000555', 'n_medal_bronze_delete.png', 'n_medal_bronze_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000556', 'n_medal_gold_1.png', 'n_medal_gold_1Icon');
INSERT INTO `gy_icon` VALUES ('20000557', 'n_medal_gold_2.png', 'n_medal_gold_2Icon');
INSERT INTO `gy_icon` VALUES ('20000558', 'n_medal_gold_3.png', 'n_medal_gold_3Icon');
INSERT INTO `gy_icon` VALUES ('20000559', 'n_medal_gold_add.png', 'n_medal_gold_addIcon');
INSERT INTO `gy_icon` VALUES ('20000560', 'n_medal_gold_delete.png', 'n_medal_gold_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000561', 'n_medal_silver_1.png', 'n_medal_silver_1Icon');
INSERT INTO `gy_icon` VALUES ('20000562', 'n_medal_silver_2.png', 'n_medal_silver_2Icon');
INSERT INTO `gy_icon` VALUES ('20000563', 'n_medal_silver_3.png', 'n_medal_silver_3Icon');
INSERT INTO `gy_icon` VALUES ('20000564', 'n_medal_silver_add.png', 'n_medal_silver_addIcon');
INSERT INTO `gy_icon` VALUES ('20000565', 'n_medal_silver_delete.png', 'n_medal_silver_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000566', 'n_money.png', 'n_moneyIcon');
INSERT INTO `gy_icon` VALUES ('20000567', 'n_money_add.png', 'n_money_addIcon');
INSERT INTO `gy_icon` VALUES ('20000568', 'n_money_delete.png', 'n_money_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000569', 'n_money_dollar.png', 'n_money_dollarIcon');
INSERT INTO `gy_icon` VALUES ('20000570', 'n_money_euro.png', 'n_money_euroIcon');
INSERT INTO `gy_icon` VALUES ('20000571', 'n_money_pound.png', 'n_money_poundIcon');
INSERT INTO `gy_icon` VALUES ('20000572', 'n_money_yen.png', 'n_money_yenIcon');
INSERT INTO `gy_icon` VALUES ('20000573', 'n_monitor.png', 'n_monitorIcon');
INSERT INTO `gy_icon` VALUES ('20000574', 'n_monitor_add.png', 'n_monitor_addIcon');
INSERT INTO `gy_icon` VALUES ('20000575', 'n_monitor_delete.png', 'n_monitor_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000576', 'n_monitor_edit.png', 'n_monitor_editIcon');
INSERT INTO `gy_icon` VALUES ('20000577', 'n_monitor_error.png', 'n_monitor_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000578', 'n_monitor_go.png', 'n_monitor_goIcon');
INSERT INTO `gy_icon` VALUES ('20000579', 'n_monitor_lightning.png', 'n_monitor_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000580', 'n_monitor_link.png', 'n_monitor_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000581', 'n_mouse.png', 'n_mouseIcon');
INSERT INTO `gy_icon` VALUES ('20000582', 'n_mouse_add.png', 'n_mouse_addIcon');
INSERT INTO `gy_icon` VALUES ('20000583', 'n_mouse_delete.png', 'n_mouse_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000584', 'n_mouse_error.png', 'n_mouse_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000585', 'n_music.png', 'n_musicIcon');
INSERT INTO `gy_icon` VALUES ('20000586', 'n_new.png', 'n_newIcon');
INSERT INTO `gy_icon` VALUES ('20000587', 'n_newspaper.png', 'n_newspaperIcon');
INSERT INTO `gy_icon` VALUES ('20000588', 'n_newspaper_add.png', 'n_newspaper_addIcon');
INSERT INTO `gy_icon` VALUES ('20000589', 'n_newspaper_delete.png', 'n_newspaper_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000590', 'n_newspaper_go.png', 'n_newspaper_goIcon');
INSERT INTO `gy_icon` VALUES ('20000591', 'n_newspaper_link.png', 'n_newspaper_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000592', 'n_note.png', 'n_noteIcon');
INSERT INTO `gy_icon` VALUES ('20000593', 'n_note_add.png', 'n_note_addIcon');
INSERT INTO `gy_icon` VALUES ('20000594', 'n_note_delete.png', 'n_note_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000595', 'n_note_edit.png', 'n_note_editIcon');
INSERT INTO `gy_icon` VALUES ('20000596', 'n_note_error.png', 'n_note_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000597', 'n_note_go.png', 'n_note_goIcon');
INSERT INTO `gy_icon` VALUES ('20000598', 'n_overlays.png', 'n_overlaysIcon');
INSERT INTO `gy_icon` VALUES ('20000599', 'n_package.png', 'n_packageIcon');
INSERT INTO `gy_icon` VALUES ('20000600', 'n_package_add.png', 'n_package_addIcon');
INSERT INTO `gy_icon` VALUES ('20000601', 'n_package_delete.png', 'n_package_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000602', 'n_package_go.png', 'n_package_goIcon');
INSERT INTO `gy_icon` VALUES ('20000603', 'n_package_green.png', 'n_package_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000604', 'n_package_link.png', 'n_package_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000605', 'n_page.png', 'n_pageIcon');
INSERT INTO `gy_icon` VALUES ('20000606', 'n_page_attach.png', 'n_page_attachIcon');
INSERT INTO `gy_icon` VALUES ('20000607', 'n_page_code.png', 'n_page_codeIcon');
INSERT INTO `gy_icon` VALUES ('20000608', 'n_page_copy.png', 'n_page_copyIcon');
INSERT INTO `gy_icon` VALUES ('20000609', 'n_page_delete.png', 'n_page_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000610', 'n_page_edit.png', 'n_page_editIcon');
INSERT INTO `gy_icon` VALUES ('20000611', 'n_page_error.png', 'n_page_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000612', 'n_page_excel.png', 'n_page_excelIcon');
INSERT INTO `gy_icon` VALUES ('20000613', 'n_page_find.png', 'n_page_findIcon');
INSERT INTO `gy_icon` VALUES ('20000614', 'n_page_gear.png', 'n_page_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000615', 'n_page_go.png', 'n_page_goIcon');
INSERT INTO `gy_icon` VALUES ('20000616', 'n_page_green.png', 'n_page_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000617', 'n_page_key.png', 'n_page_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000618', 'n_page_lightning.png', 'n_page_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000619', 'n_page_link.png', 'n_page_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000620', 'n_page_paintbrush.png', 'n_page_paintbrushIcon');
INSERT INTO `gy_icon` VALUES ('20000621', 'n_page_paste.png', 'n_page_pasteIcon');
INSERT INTO `gy_icon` VALUES ('20000622', 'n_page_red.png', 'n_page_redIcon');
INSERT INTO `gy_icon` VALUES ('20000623', 'n_page_refresh.png', 'n_page_refreshIcon');
INSERT INTO `gy_icon` VALUES ('20000624', 'n_page_save.png', 'n_page_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000625', 'n_page_white.png', 'n_page_whiteIcon');
INSERT INTO `gy_icon` VALUES ('20000626', 'n_page_white_acrobat.png', 'n_page_white_acrobatIcon');
INSERT INTO `gy_icon` VALUES ('20000627', 'n_page_white_actionscript.png', 'n_page_white_actionscriptIcon');
INSERT INTO `gy_icon` VALUES ('20000628', 'n_page_white_add.png', 'n_page_white_addIcon');
INSERT INTO `gy_icon` VALUES ('20000629', 'n_page_white_c.png', 'n_page_white_cIcon');
INSERT INTO `gy_icon` VALUES ('20000630', 'n_page_white_camera.png', 'n_page_white_cameraIcon');
INSERT INTO `gy_icon` VALUES ('20000631', 'n_page_white_cd.png', 'n_page_white_cdIcon');
INSERT INTO `gy_icon` VALUES ('20000632', 'n_page_white_code.png', 'n_page_white_codeIcon');
INSERT INTO `gy_icon` VALUES ('20000633', 'n_page_white_code_red.png', 'n_page_white_code_redIcon');
INSERT INTO `gy_icon` VALUES ('20000634', 'n_page_white_coldfusion.png', 'n_page_white_coldfusionIcon');
INSERT INTO `gy_icon` VALUES ('20000635', 'n_page_white_compressed.png', 'n_page_white_compressedIcon');
INSERT INTO `gy_icon` VALUES ('20000636', 'n_page_white_copy.png', 'n_page_white_copyIcon');
INSERT INTO `gy_icon` VALUES ('20000637', 'n_page_white_cplusplus.png', 'n_page_white_cplusplusIcon');
INSERT INTO `gy_icon` VALUES ('20000638', 'n_page_white_csharp.png', 'n_page_white_csharpIcon');
INSERT INTO `gy_icon` VALUES ('20000639', 'n_page_white_cup.png', 'n_page_white_cupIcon');
INSERT INTO `gy_icon` VALUES ('20000640', 'n_page_white_database.png', 'n_page_white_databaseIcon');
INSERT INTO `gy_icon` VALUES ('20000641', 'n_page_white_delete.png', 'n_page_white_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000642', 'n_page_white_dvd.png', 'n_page_white_dvdIcon');
INSERT INTO `gy_icon` VALUES ('20000643', 'n_page_white_edit.png', 'n_page_white_editIcon');
INSERT INTO `gy_icon` VALUES ('20000644', 'n_page_white_error.png', 'n_page_white_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000645', 'n_page_white_excel.png', 'n_page_white_excelIcon');
INSERT INTO `gy_icon` VALUES ('20000646', 'n_page_white_find.png', 'n_page_white_findIcon');
INSERT INTO `gy_icon` VALUES ('20000647', 'n_page_white_flash.png', 'n_page_white_flashIcon');
INSERT INTO `gy_icon` VALUES ('20000648', 'n_page_white_freehand.png', 'n_page_white_freehandIcon');
INSERT INTO `gy_icon` VALUES ('20000649', 'n_page_white_gear.png', 'n_page_white_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000650', 'n_page_white_get.png', 'n_page_white_getIcon');
INSERT INTO `gy_icon` VALUES ('20000651', 'n_page_white_go.png', 'n_page_white_goIcon');
INSERT INTO `gy_icon` VALUES ('20000652', 'n_page_white_h.png', 'n_page_white_hIcon');
INSERT INTO `gy_icon` VALUES ('20000653', 'n_page_white_horizontal.png', 'n_page_white_horizontalIcon');
INSERT INTO `gy_icon` VALUES ('20000654', 'n_page_white_key.png', 'n_page_white_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000655', 'n_page_white_lightning.png', 'n_page_white_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000656', 'n_page_white_link.png', 'n_page_white_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000657', 'n_page_white_magnify.png', 'n_page_white_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000658', 'n_page_white_medal.png', 'n_page_white_medalIcon');
INSERT INTO `gy_icon` VALUES ('20000659', 'n_page_white_office.png', 'n_page_white_officeIcon');
INSERT INTO `gy_icon` VALUES ('20000660', 'n_page_white_paint.png', 'n_page_white_paintIcon');
INSERT INTO `gy_icon` VALUES ('20000661', 'n_page_white_paintbrush.png', 'n_page_white_paintbrushIcon');
INSERT INTO `gy_icon` VALUES ('20000662', 'n_page_white_paste.png', 'n_page_white_pasteIcon');
INSERT INTO `gy_icon` VALUES ('20000663', 'n_page_white_php.png', 'n_page_white_phpIcon');
INSERT INTO `gy_icon` VALUES ('20000664', 'n_page_white_picture.png', 'n_page_white_pictureIcon');
INSERT INTO `gy_icon` VALUES ('20000665', 'n_page_white_powerpoint.png', 'n_page_white_powerpointIcon');
INSERT INTO `gy_icon` VALUES ('20000666', 'n_page_white_put.png', 'n_page_white_putIcon');
INSERT INTO `gy_icon` VALUES ('20000667', 'n_page_white_ruby.png', 'n_page_white_rubyIcon');
INSERT INTO `gy_icon` VALUES ('20000668', 'n_page_white_stack.png', 'n_page_white_stackIcon');
INSERT INTO `gy_icon` VALUES ('20000669', 'n_page_white_star.png', 'n_page_white_starIcon');
INSERT INTO `gy_icon` VALUES ('20000670', 'n_page_white_swoosh.png', 'n_page_white_swooshIcon');
INSERT INTO `gy_icon` VALUES ('20000671', 'n_page_white_text.png', 'n_page_white_textIcon');
INSERT INTO `gy_icon` VALUES ('20000672', 'n_page_white_text_width.png', 'n_page_white_text_widthIcon');
INSERT INTO `gy_icon` VALUES ('20000673', 'n_page_white_tux.png', 'n_page_white_tuxIcon');
INSERT INTO `gy_icon` VALUES ('20000674', 'n_page_white_vector.png', 'n_page_white_vectorIcon');
INSERT INTO `gy_icon` VALUES ('20000675', 'n_page_white_visualstudio.png', 'n_page_white_visualstudioIcon');
INSERT INTO `gy_icon` VALUES ('20000676', 'n_page_white_width.png', 'n_page_white_widthIcon');
INSERT INTO `gy_icon` VALUES ('20000677', 'n_page_white_word.png', 'n_page_white_wordIcon');
INSERT INTO `gy_icon` VALUES ('20000678', 'n_page_white_world.png', 'n_page_white_worldIcon');
INSERT INTO `gy_icon` VALUES ('20000679', 'n_page_white_wrench.png', 'n_page_white_wrenchIcon');
INSERT INTO `gy_icon` VALUES ('20000680', 'n_page_white_zip.png', 'n_page_white_zipIcon');
INSERT INTO `gy_icon` VALUES ('20000681', 'n_page_word.png', 'n_page_wordIcon');
INSERT INTO `gy_icon` VALUES ('20000682', 'n_page_world.png', 'n_page_worldIcon');
INSERT INTO `gy_icon` VALUES ('20000683', 'n_paintbrush.png', 'n_paintbrushIcon');
INSERT INTO `gy_icon` VALUES ('20000684', 'n_paintcan.png', 'n_paintcanIcon');
INSERT INTO `gy_icon` VALUES ('20000685', 'n_palette.png', 'n_paletteIcon');
INSERT INTO `gy_icon` VALUES ('20000686', 'n_paste_plain.png', 'n_paste_plainIcon');
INSERT INTO `gy_icon` VALUES ('20000687', 'n_paste_word.png', 'n_paste_wordIcon');
INSERT INTO `gy_icon` VALUES ('20000688', 'n_pencil.png', 'n_pencilIcon');
INSERT INTO `gy_icon` VALUES ('20000689', 'n_pencil_add.png', 'n_pencil_addIcon');
INSERT INTO `gy_icon` VALUES ('20000690', 'n_pencil_delete.png', 'n_pencil_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000691', 'n_pencil_go.png', 'n_pencil_goIcon');
INSERT INTO `gy_icon` VALUES ('20000692', 'n_phone.png', 'n_phoneIcon');
INSERT INTO `gy_icon` VALUES ('20000693', 'n_phone_add.png', 'n_phone_addIcon');
INSERT INTO `gy_icon` VALUES ('20000694', 'n_phone_delete.png', 'n_phone_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000695', 'n_phone_sound.png', 'n_phone_soundIcon');
INSERT INTO `gy_icon` VALUES ('20000696', 'n_photo.png', 'n_photoIcon');
INSERT INTO `gy_icon` VALUES ('20000700', 'n_photos.png', 'n_photosIcon');
INSERT INTO `gy_icon` VALUES ('20000697', 'n_photo_add.png', 'n_photo_addIcon');
INSERT INTO `gy_icon` VALUES ('20000698', 'n_photo_delete.png', 'n_photo_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000699', 'n_photo_link.png', 'n_photo_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000701', 'n_picture.png', 'n_pictureIcon');
INSERT INTO `gy_icon` VALUES ('20000711', 'n_pictures.png', 'n_picturesIcon');
INSERT INTO `gy_icon` VALUES ('20000702', 'n_picture_add.png', 'n_picture_addIcon');
INSERT INTO `gy_icon` VALUES ('20000703', 'n_picture_delete.png', 'n_picture_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000704', 'n_picture_edit.png', 'n_picture_editIcon');
INSERT INTO `gy_icon` VALUES ('20000705', 'n_picture_empty.png', 'n_picture_emptyIcon');
INSERT INTO `gy_icon` VALUES ('20000706', 'n_picture_error.png', 'n_picture_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000707', 'n_picture_go.png', 'n_picture_goIcon');
INSERT INTO `gy_icon` VALUES ('20000708', 'n_picture_key.png', 'n_picture_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000709', 'n_picture_link.png', 'n_picture_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000710', 'n_picture_save.png', 'n_picture_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000712', 'n_pilcrow.png', 'n_pilcrowIcon');
INSERT INTO `gy_icon` VALUES ('20000713', 'n_pill.png', 'n_pillIcon');
INSERT INTO `gy_icon` VALUES ('20000714', 'n_pill_add.png', 'n_pill_addIcon');
INSERT INTO `gy_icon` VALUES ('20000715', 'n_pill_delete.png', 'n_pill_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000716', 'n_pill_go.png', 'n_pill_goIcon');
INSERT INTO `gy_icon` VALUES ('20000717', 'n_plugin.png', 'n_pluginIcon');
INSERT INTO `gy_icon` VALUES ('20000718', 'n_plugin_add.png', 'n_plugin_addIcon');
INSERT INTO `gy_icon` VALUES ('20000719', 'n_plugin_delete.png', 'n_plugin_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000720', 'n_plugin_disabled.png', 'n_plugin_disabledIcon');
INSERT INTO `gy_icon` VALUES ('20000721', 'n_plugin_edit.png', 'n_plugin_editIcon');
INSERT INTO `gy_icon` VALUES ('20000722', 'n_plugin_error.png', 'n_plugin_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000723', 'n_plugin_go.png', 'n_plugin_goIcon');
INSERT INTO `gy_icon` VALUES ('20000724', 'n_plugin_link.png', 'n_plugin_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000725', 'n_printer.png', 'n_printerIcon');
INSERT INTO `gy_icon` VALUES ('20000726', 'n_printer_add.png', 'n_printer_addIcon');
INSERT INTO `gy_icon` VALUES ('20000727', 'n_printer_delete.png', 'n_printer_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000728', 'n_printer_empty.png', 'n_printer_emptyIcon');
INSERT INTO `gy_icon` VALUES ('20000729', 'n_printer_error.png', 'n_printer_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000730', 'n_rainbow.png', 'n_rainbowIcon');
INSERT INTO `gy_icon` VALUES ('20000731', 'n_report.png', 'n_reportIcon');
INSERT INTO `gy_icon` VALUES ('20000732', 'n_report_add.png', 'n_report_addIcon');
INSERT INTO `gy_icon` VALUES ('20000733', 'n_report_delete.png', 'n_report_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000734', 'n_report_disk.png', 'n_report_diskIcon');
INSERT INTO `gy_icon` VALUES ('20000735', 'n_report_edit.png', 'n_report_editIcon');
INSERT INTO `gy_icon` VALUES ('20000736', 'n_report_go.png', 'n_report_goIcon');
INSERT INTO `gy_icon` VALUES ('20000737', 'n_report_key.png', 'n_report_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000738', 'n_report_link.png', 'n_report_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000739', 'n_report_magnify.png', 'n_report_magnifyIcon');
INSERT INTO `gy_icon` VALUES ('20000740', 'n_report_picture.png', 'n_report_pictureIcon');
INSERT INTO `gy_icon` VALUES ('20000741', 'n_report_user.png', 'n_report_userIcon');
INSERT INTO `gy_icon` VALUES ('20000742', 'n_report_word.png', 'n_report_wordIcon');
INSERT INTO `gy_icon` VALUES ('20000743', 'n_resultset_first.png', 'n_resultset_firstIcon');
INSERT INTO `gy_icon` VALUES ('20000744', 'n_resultset_last.png', 'n_resultset_lastIcon');
INSERT INTO `gy_icon` VALUES ('20000745', 'n_resultset_next.png', 'n_resultset_nextIcon');
INSERT INTO `gy_icon` VALUES ('20000746', 'n_resultset_previous.png', 'n_resultset_previousIcon');
INSERT INTO `gy_icon` VALUES ('20000747', 'n_rosette.png', 'n_rosetteIcon');
INSERT INTO `gy_icon` VALUES ('20000748', 'n_rss.png', 'n_rssIcon');
INSERT INTO `gy_icon` VALUES ('20000749', 'n_rss_add.png', 'n_rss_addIcon');
INSERT INTO `gy_icon` VALUES ('20000750', 'n_rss_delete.png', 'n_rss_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000751', 'n_rss_go.png', 'n_rss_goIcon');
INSERT INTO `gy_icon` VALUES ('20000752', 'n_rss_valid.png', 'n_rss_validIcon');
INSERT INTO `gy_icon` VALUES ('20000753', 'n_ruby.png', 'n_rubyIcon');
INSERT INTO `gy_icon` VALUES ('20000754', 'n_ruby_add.png', 'n_ruby_addIcon');
INSERT INTO `gy_icon` VALUES ('20000755', 'n_ruby_delete.png', 'n_ruby_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000756', 'n_ruby_gear.png', 'n_ruby_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000757', 'n_ruby_get.png', 'n_ruby_getIcon');
INSERT INTO `gy_icon` VALUES ('20000758', 'n_ruby_go.png', 'n_ruby_goIcon');
INSERT INTO `gy_icon` VALUES ('20000759', 'n_ruby_key.png', 'n_ruby_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000760', 'n_ruby_link.png', 'n_ruby_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000761', 'n_ruby_put.png', 'n_ruby_putIcon');
INSERT INTO `gy_icon` VALUES ('20000762', 'n_script.png', 'n_scriptIcon');
INSERT INTO `gy_icon` VALUES ('20000763', 'n_script_add.png', 'n_script_addIcon');
INSERT INTO `gy_icon` VALUES ('20000764', 'n_script_code.png', 'n_script_codeIcon');
INSERT INTO `gy_icon` VALUES ('20000765', 'n_script_code_red.png', 'n_script_code_redIcon');
INSERT INTO `gy_icon` VALUES ('20000766', 'n_script_delete.png', 'n_script_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000767', 'n_script_edit.png', 'n_script_editIcon');
INSERT INTO `gy_icon` VALUES ('20000768', 'n_script_error.png', 'n_script_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000769', 'n_script_gear.png', 'n_script_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000770', 'n_script_go.png', 'n_script_goIcon');
INSERT INTO `gy_icon` VALUES ('20000771', 'n_script_key.png', 'n_script_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000772', 'n_script_lightning.png', 'n_script_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000773', 'n_script_link.png', 'n_script_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000774', 'n_script_palette.png', 'n_script_paletteIcon');
INSERT INTO `gy_icon` VALUES ('20000775', 'n_script_save.png', 'n_script_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000776', 'n_server.png', 'n_serverIcon');
INSERT INTO `gy_icon` VALUES ('20000777', 'n_server_add.png', 'n_server_addIcon');
INSERT INTO `gy_icon` VALUES ('20000778', 'n_server_chart.png', 'n_server_chartIcon');
INSERT INTO `gy_icon` VALUES ('20000779', 'n_server_compressed.png', 'n_server_compressedIcon');
INSERT INTO `gy_icon` VALUES ('20000780', 'n_server_connect.png', 'n_server_connectIcon');
INSERT INTO `gy_icon` VALUES ('20000781', 'n_server_database.png', 'n_server_databaseIcon');
INSERT INTO `gy_icon` VALUES ('20000782', 'n_server_delete.png', 'n_server_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000783', 'n_server_edit.png', 'n_server_editIcon');
INSERT INTO `gy_icon` VALUES ('20000784', 'n_server_error.png', 'n_server_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000785', 'n_server_go.png', 'n_server_goIcon');
INSERT INTO `gy_icon` VALUES ('20000786', 'n_server_key.png', 'n_server_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000787', 'n_server_lightning.png', 'n_server_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000788', 'n_server_link.png', 'n_server_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000789', 'n_server_uncompressed.png', 'n_server_uncompressedIcon');
INSERT INTO `gy_icon` VALUES ('20000790', 'n_shading.png', 'n_shadingIcon');
INSERT INTO `gy_icon` VALUES ('20000791', 'n_shape_align_bottom.png', 'n_shape_align_bottomIcon');
INSERT INTO `gy_icon` VALUES ('20000792', 'n_shape_align_center.png', 'n_shape_align_centerIcon');
INSERT INTO `gy_icon` VALUES ('20000793', 'n_shape_align_left.png', 'n_shape_align_leftIcon');
INSERT INTO `gy_icon` VALUES ('20000794', 'n_shape_align_middle.png', 'n_shape_align_middleIcon');
INSERT INTO `gy_icon` VALUES ('20000795', 'n_shape_align_right.png', 'n_shape_align_rightIcon');
INSERT INTO `gy_icon` VALUES ('20000796', 'n_shape_align_top.png', 'n_shape_align_topIcon');
INSERT INTO `gy_icon` VALUES ('20000797', 'n_shape_flip_horizontal.png', 'n_shape_flip_horizontalIcon');
INSERT INTO `gy_icon` VALUES ('20000798', 'n_shape_flip_vertical.png', 'n_shape_flip_verticalIcon');
INSERT INTO `gy_icon` VALUES ('20000799', 'n_shape_group.png', 'n_shape_groupIcon');
INSERT INTO `gy_icon` VALUES ('20000800', 'n_shape_handles.png', 'n_shape_handlesIcon');
INSERT INTO `gy_icon` VALUES ('20000801', 'n_shape_move_back.png', 'n_shape_move_backIcon');
INSERT INTO `gy_icon` VALUES ('20000802', 'n_shape_move_backwards.png', 'n_shape_move_backwardsIcon');
INSERT INTO `gy_icon` VALUES ('20000803', 'n_shape_move_forwards.png', 'n_shape_move_forwardsIcon');
INSERT INTO `gy_icon` VALUES ('20000804', 'n_shape_move_front.png', 'n_shape_move_frontIcon');
INSERT INTO `gy_icon` VALUES ('20000805', 'n_shape_rotate_anticlockwise.png', 'n_shape_rotate_anticlockwiseIcon');
INSERT INTO `gy_icon` VALUES ('20000806', 'n_shape_rotate_clockwise.png', 'n_shape_rotate_clockwiseIcon');
INSERT INTO `gy_icon` VALUES ('20000807', 'n_shape_square.png', 'n_shape_squareIcon');
INSERT INTO `gy_icon` VALUES ('20000808', 'n_shape_square_add.png', 'n_shape_square_addIcon');
INSERT INTO `gy_icon` VALUES ('20000809', 'n_shape_square_delete.png', 'n_shape_square_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000810', 'n_shape_square_edit.png', 'n_shape_square_editIcon');
INSERT INTO `gy_icon` VALUES ('20000811', 'n_shape_square_error.png', 'n_shape_square_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000812', 'n_shape_square_go.png', 'n_shape_square_goIcon');
INSERT INTO `gy_icon` VALUES ('20000813', 'n_shape_square_key.png', 'n_shape_square_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000814', 'n_shape_square_link.png', 'n_shape_square_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000815', 'n_shape_ungroup.png', 'n_shape_ungroupIcon');
INSERT INTO `gy_icon` VALUES ('20000816', 'n_shield.png', 'n_shieldIcon');
INSERT INTO `gy_icon` VALUES ('20000817', 'n_shield_add.png', 'n_shield_addIcon');
INSERT INTO `gy_icon` VALUES ('20000818', 'n_shield_delete.png', 'n_shield_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000819', 'n_shield_go.png', 'n_shield_goIcon');
INSERT INTO `gy_icon` VALUES ('20000820', 'n_sitemap.png', 'n_sitemapIcon');
INSERT INTO `gy_icon` VALUES ('20000821', 'n_sitemap_color.png', 'n_sitemap_colorIcon');
INSERT INTO `gy_icon` VALUES ('20000822', 'n_sound.png', 'n_soundIcon');
INSERT INTO `gy_icon` VALUES ('20000823', 'n_sound_add.png', 'n_sound_addIcon');
INSERT INTO `gy_icon` VALUES ('20000824', 'n_sound_delete.png', 'n_sound_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000825', 'n_sound_low.png', 'n_sound_lowIcon');
INSERT INTO `gy_icon` VALUES ('20000826', 'n_sound_mute.png', 'n_sound_muteIcon');
INSERT INTO `gy_icon` VALUES ('20000827', 'n_sound_none.png', 'n_sound_noneIcon');
INSERT INTO `gy_icon` VALUES ('20000828', 'n_spellcheck.png', 'n_spellcheckIcon');
INSERT INTO `gy_icon` VALUES ('20000829', 'n_sport_8ball.png', 'n_sport_8ballIcon');
INSERT INTO `gy_icon` VALUES ('20000830', 'n_sport_basketball.png', 'n_sport_basketballIcon');
INSERT INTO `gy_icon` VALUES ('20000831', 'n_sport_football.png', 'n_sport_footballIcon');
INSERT INTO `gy_icon` VALUES ('20000832', 'n_sport_golf.png', 'n_sport_golfIcon');
INSERT INTO `gy_icon` VALUES ('20000833', 'n_sport_raquet.png', 'n_sport_raquetIcon');
INSERT INTO `gy_icon` VALUES ('20000834', 'n_sport_shuttlecock.png', 'n_sport_shuttlecockIcon');
INSERT INTO `gy_icon` VALUES ('20000835', 'n_sport_soccer.png', 'n_sport_soccerIcon');
INSERT INTO `gy_icon` VALUES ('20000836', 'n_sport_tennis.png', 'n_sport_tennisIcon');
INSERT INTO `gy_icon` VALUES ('20000837', 'n_star.png', 'n_starIcon');
INSERT INTO `gy_icon` VALUES ('20000838', 'n_status_away.png', 'n_status_awayIcon');
INSERT INTO `gy_icon` VALUES ('20000839', 'n_status_busy.png', 'n_status_busyIcon');
INSERT INTO `gy_icon` VALUES ('20000840', 'n_status_offline.png', 'n_status_offlineIcon');
INSERT INTO `gy_icon` VALUES ('20000841', 'n_status_online.png', 'n_status_onlineIcon');
INSERT INTO `gy_icon` VALUES ('20000842', 'n_stop.png', 'n_stopIcon');
INSERT INTO `gy_icon` VALUES ('20000843', 'n_style.png', 'n_styleIcon');
INSERT INTO `gy_icon` VALUES ('20000844', 'n_style_add.png', 'n_style_addIcon');
INSERT INTO `gy_icon` VALUES ('20000845', 'n_style_delete.png', 'n_style_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000846', 'n_style_edit.png', 'n_style_editIcon');
INSERT INTO `gy_icon` VALUES ('20000847', 'n_style_go.png', 'n_style_goIcon');
INSERT INTO `gy_icon` VALUES ('20000848', 'n_sum.png', 'n_sumIcon');
INSERT INTO `gy_icon` VALUES ('20000849', 'n_tab.png', 'n_tabIcon');
INSERT INTO `gy_icon` VALUES ('20000854', 'n_table.png', 'n_tableIcon');
INSERT INTO `gy_icon` VALUES ('20000855', 'n_table_add.png', 'n_table_addIcon');
INSERT INTO `gy_icon` VALUES ('20000856', 'n_table_delete.png', 'n_table_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000857', 'n_table_edit.png', 'n_table_editIcon');
INSERT INTO `gy_icon` VALUES ('20000858', 'n_table_error.png', 'n_table_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000859', 'n_table_gear.png', 'n_table_gearIcon');
INSERT INTO `gy_icon` VALUES ('20000860', 'n_table_go.png', 'n_table_goIcon');
INSERT INTO `gy_icon` VALUES ('20000861', 'n_table_key.png', 'n_table_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000862', 'n_table_lightning.png', 'n_table_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000863', 'n_table_link.png', 'n_table_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000864', 'n_table_multiple.png', 'n_table_multipleIcon');
INSERT INTO `gy_icon` VALUES ('20000865', 'n_table_refresh.png', 'n_table_refreshIcon');
INSERT INTO `gy_icon` VALUES ('20000866', 'n_table_relationship.png', 'n_table_relationshipIcon');
INSERT INTO `gy_icon` VALUES ('20000867', 'n_table_row_delete.png', 'n_table_row_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000868', 'n_table_row_insert.png', 'n_table_row_insertIcon');
INSERT INTO `gy_icon` VALUES ('20000869', 'n_table_save.png', 'n_table_saveIcon');
INSERT INTO `gy_icon` VALUES ('20000870', 'n_table_sort.png', 'n_table_sortIcon');
INSERT INTO `gy_icon` VALUES ('20000850', 'n_tab_add.png', 'n_tab_addIcon');
INSERT INTO `gy_icon` VALUES ('20000851', 'n_tab_delete.png', 'n_tab_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000852', 'n_tab_edit.png', 'n_tab_editIcon');
INSERT INTO `gy_icon` VALUES ('20000853', 'n_tab_go.png', 'n_tab_goIcon');
INSERT INTO `gy_icon` VALUES ('20000871', 'n_tag.png', 'n_tagIcon');
INSERT INTO `gy_icon` VALUES ('20000872', 'n_tag_blue.png', 'n_tag_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000873', 'n_tag_blue_add.png', 'n_tag_blue_addIcon');
INSERT INTO `gy_icon` VALUES ('20000874', 'n_tag_blue_delete.png', 'n_tag_blue_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000875', 'n_tag_blue_edit.png', 'n_tag_blue_editIcon');
INSERT INTO `gy_icon` VALUES ('20000876', 'n_tag_green.png', 'n_tag_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000877', 'n_tag_orange.png', 'n_tag_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000878', 'n_tag_pink.png', 'n_tag_pinkIcon');
INSERT INTO `gy_icon` VALUES ('20000879', 'n_tag_purple.png', 'n_tag_purpleIcon');
INSERT INTO `gy_icon` VALUES ('20000880', 'n_tag_red.png', 'n_tag_redIcon');
INSERT INTO `gy_icon` VALUES ('20000881', 'n_tag_yellow.png', 'n_tag_yellowIcon');
INSERT INTO `gy_icon` VALUES ('20000882', 'n_telephone.png', 'n_telephoneIcon');
INSERT INTO `gy_icon` VALUES ('20000883', 'n_telephone_add.png', 'n_telephone_addIcon');
INSERT INTO `gy_icon` VALUES ('20000884', 'n_telephone_delete.png', 'n_telephone_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000885', 'n_telephone_edit.png', 'n_telephone_editIcon');
INSERT INTO `gy_icon` VALUES ('20000886', 'n_telephone_error.png', 'n_telephone_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000887', 'n_telephone_go.png', 'n_telephone_goIcon');
INSERT INTO `gy_icon` VALUES ('20000888', 'n_telephone_key.png', 'n_telephone_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000889', 'n_telephone_link.png', 'n_telephone_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000890', 'n_television.png', 'n_televisionIcon');
INSERT INTO `gy_icon` VALUES ('20000891', 'n_television_add.png', 'n_television_addIcon');
INSERT INTO `gy_icon` VALUES ('20000892', 'n_television_delete.png', 'n_television_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000930', 'n_textfield.png', 'n_textfieldIcon');
INSERT INTO `gy_icon` VALUES ('20000931', 'n_textfield_add.png', 'n_textfield_addIcon');
INSERT INTO `gy_icon` VALUES ('20000932', 'n_textfield_delete.png', 'n_textfield_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000933', 'n_textfield_key.png', 'n_textfield_keyIcon');
INSERT INTO `gy_icon` VALUES ('20000934', 'n_textfield_rename.png', 'n_textfield_renameIcon');
INSERT INTO `gy_icon` VALUES ('20000893', 'n_text_align_center.png', 'n_text_align_centerIcon');
INSERT INTO `gy_icon` VALUES ('20000894', 'n_text_align_justify.png', 'n_text_align_justifyIcon');
INSERT INTO `gy_icon` VALUES ('20000895', 'n_text_align_left.png', 'n_text_align_leftIcon');
INSERT INTO `gy_icon` VALUES ('20000896', 'n_text_align_right.png', 'n_text_align_rightIcon');
INSERT INTO `gy_icon` VALUES ('20000897', 'n_text_allcaps.png', 'n_text_allcapsIcon');
INSERT INTO `gy_icon` VALUES ('20000898', 'n_text_bold.png', 'n_text_boldIcon');
INSERT INTO `gy_icon` VALUES ('20000899', 'n_text_columns.png', 'n_text_columnsIcon');
INSERT INTO `gy_icon` VALUES ('20000900', 'n_text_dropcaps.png', 'n_text_dropcapsIcon');
INSERT INTO `gy_icon` VALUES ('20000901', 'n_text_heading_1.png', 'n_text_heading_1Icon');
INSERT INTO `gy_icon` VALUES ('20000902', 'n_text_heading_2.png', 'n_text_heading_2Icon');
INSERT INTO `gy_icon` VALUES ('20000903', 'n_text_heading_3.png', 'n_text_heading_3Icon');
INSERT INTO `gy_icon` VALUES ('20000904', 'n_text_heading_4.png', 'n_text_heading_4Icon');
INSERT INTO `gy_icon` VALUES ('20000905', 'n_text_heading_5.png', 'n_text_heading_5Icon');
INSERT INTO `gy_icon` VALUES ('20000906', 'n_text_heading_6.png', 'n_text_heading_6Icon');
INSERT INTO `gy_icon` VALUES ('20000907', 'n_text_horizontalrule.png', 'n_text_horizontalruleIcon');
INSERT INTO `gy_icon` VALUES ('20000908', 'n_text_indent.png', 'n_text_indentIcon');
INSERT INTO `gy_icon` VALUES ('20000909', 'n_text_indent_remove.png', 'n_text_indent_removeIcon');
INSERT INTO `gy_icon` VALUES ('20000910', 'n_text_italic.png', 'n_text_italicIcon');
INSERT INTO `gy_icon` VALUES ('20000911', 'n_text_kerning.png', 'n_text_kerningIcon');
INSERT INTO `gy_icon` VALUES ('20000913', 'n_text_letterspacing.png', 'n_text_letterspacingIcon');
INSERT INTO `gy_icon` VALUES ('20000912', 'n_text_letter_omega.png', 'n_text_letter_omegaIcon');
INSERT INTO `gy_icon` VALUES ('20000914', 'n_text_linespacing.png', 'n_text_linespacingIcon');
INSERT INTO `gy_icon` VALUES ('20000915', 'n_text_list_bullets.png', 'n_text_list_bulletsIcon');
INSERT INTO `gy_icon` VALUES ('20000916', 'n_text_list_numbers.png', 'n_text_list_numbersIcon');
INSERT INTO `gy_icon` VALUES ('20000917', 'n_text_lowercase.png', 'n_text_lowercaseIcon');
INSERT INTO `gy_icon` VALUES ('20000918', 'n_text_padding_bottom.png', 'n_text_padding_bottomIcon');
INSERT INTO `gy_icon` VALUES ('20000919', 'n_text_padding_left.png', 'n_text_padding_leftIcon');
INSERT INTO `gy_icon` VALUES ('20000920', 'n_text_padding_right.png', 'n_text_padding_rightIcon');
INSERT INTO `gy_icon` VALUES ('20000921', 'n_text_padding_top.png', 'n_text_padding_topIcon');
INSERT INTO `gy_icon` VALUES ('20000922', 'n_text_replace.png', 'n_text_replaceIcon');
INSERT INTO `gy_icon` VALUES ('20000923', 'n_text_signature.png', 'n_text_signatureIcon');
INSERT INTO `gy_icon` VALUES ('20000924', 'n_text_smallcaps.png', 'n_text_smallcapsIcon');
INSERT INTO `gy_icon` VALUES ('20000925', 'n_text_strikethrough.png', 'n_text_strikethroughIcon');
INSERT INTO `gy_icon` VALUES ('20000926', 'n_text_subscript.png', 'n_text_subscriptIcon');
INSERT INTO `gy_icon` VALUES ('20000927', 'n_text_superscript.png', 'n_text_superscriptIcon');
INSERT INTO `gy_icon` VALUES ('20000928', 'n_text_underline.png', 'n_text_underlineIcon');
INSERT INTO `gy_icon` VALUES ('20000929', 'n_text_uppercase.png', 'n_text_uppercaseIcon');
INSERT INTO `gy_icon` VALUES ('20000935', 'n_thumb_down.png', 'n_thumb_downIcon');
INSERT INTO `gy_icon` VALUES ('20000936', 'n_thumb_up.png', 'n_thumb_upIcon');
INSERT INTO `gy_icon` VALUES ('20000937', 'n_tick.png', 'n_tickIcon');
INSERT INTO `gy_icon` VALUES ('20000938', 'n_time.png', 'n_timeIcon');
INSERT INTO `gy_icon` VALUES ('20000942', 'n_timeline_marker.png', 'n_timeline_markerIcon');
INSERT INTO `gy_icon` VALUES ('20000939', 'n_time_add.png', 'n_time_addIcon');
INSERT INTO `gy_icon` VALUES ('20000940', 'n_time_delete.png', 'n_time_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000941', 'n_time_go.png', 'n_time_goIcon');
INSERT INTO `gy_icon` VALUES ('20000943', 'n_transmit.png', 'n_transmitIcon');
INSERT INTO `gy_icon` VALUES ('20000944', 'n_transmit_add.png', 'n_transmit_addIcon');
INSERT INTO `gy_icon` VALUES ('20000945', 'n_transmit_blue.png', 'n_transmit_blueIcon');
INSERT INTO `gy_icon` VALUES ('20000946', 'n_transmit_delete.png', 'n_transmit_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000947', 'n_transmit_edit.png', 'n_transmit_editIcon');
INSERT INTO `gy_icon` VALUES ('20000948', 'n_transmit_error.png', 'n_transmit_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000949', 'n_transmit_go.png', 'n_transmit_goIcon');
INSERT INTO `gy_icon` VALUES ('20000950', 'n_tux.png', 'n_tuxIcon');
INSERT INTO `gy_icon` VALUES ('20000951', 'n_user.png', 'n_userIcon');
INSERT INTO `gy_icon` VALUES ('20000952', 'n_user_add.png', 'n_user_addIcon');
INSERT INTO `gy_icon` VALUES ('20000953', 'n_user_comment.png', 'n_user_commentIcon');
INSERT INTO `gy_icon` VALUES ('20000954', 'n_user_delete.png', 'n_user_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000955', 'n_user_edit.png', 'n_user_editIcon');
INSERT INTO `gy_icon` VALUES ('20000956', 'n_user_female.png', 'n_user_femaleIcon');
INSERT INTO `gy_icon` VALUES ('20000957', 'n_user_go.png', 'n_user_goIcon');
INSERT INTO `gy_icon` VALUES ('20000958', 'n_user_gray.png', 'n_user_grayIcon');
INSERT INTO `gy_icon` VALUES ('20000959', 'n_user_green.png', 'n_user_greenIcon');
INSERT INTO `gy_icon` VALUES ('20000960', 'n_user_orange.png', 'n_user_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000961', 'n_user_red.png', 'n_user_redIcon');
INSERT INTO `gy_icon` VALUES ('20000962', 'n_user_suit.png', 'n_user_suitIcon');
INSERT INTO `gy_icon` VALUES ('20000963', 'n_vcard.png', 'n_vcardIcon');
INSERT INTO `gy_icon` VALUES ('20000964', 'n_vcard_add.png', 'n_vcard_addIcon');
INSERT INTO `gy_icon` VALUES ('20000965', 'n_vcard_delete.png', 'n_vcard_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000966', 'n_vcard_edit.png', 'n_vcard_editIcon');
INSERT INTO `gy_icon` VALUES ('20000967', 'n_vector.png', 'n_vectorIcon');
INSERT INTO `gy_icon` VALUES ('20000968', 'n_vector_add.png', 'n_vector_addIcon');
INSERT INTO `gy_icon` VALUES ('20000969', 'n_vector_delete.png', 'n_vector_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000970', 'n_wand.png', 'n_wandIcon');
INSERT INTO `gy_icon` VALUES ('20000971', 'n_weather_clouds.png', 'n_weather_cloudsIcon');
INSERT INTO `gy_icon` VALUES ('20000972', 'n_weather_cloudy.png', 'n_weather_cloudyIcon');
INSERT INTO `gy_icon` VALUES ('20000973', 'n_weather_lightning.png', 'n_weather_lightningIcon');
INSERT INTO `gy_icon` VALUES ('20000974', 'n_weather_rain.png', 'n_weather_rainIcon');
INSERT INTO `gy_icon` VALUES ('20000975', 'n_weather_snow.png', 'n_weather_snowIcon');
INSERT INTO `gy_icon` VALUES ('20000976', 'n_weather_sun.png', 'n_weather_sunIcon');
INSERT INTO `gy_icon` VALUES ('20000977', 'n_webcam.png', 'n_webcamIcon');
INSERT INTO `gy_icon` VALUES ('20000978', 'n_webcam_add.png', 'n_webcam_addIcon');
INSERT INTO `gy_icon` VALUES ('20000979', 'n_webcam_delete.png', 'n_webcam_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000980', 'n_webcam_error.png', 'n_webcam_errorIcon');
INSERT INTO `gy_icon` VALUES ('20000981', 'n_world.png', 'n_worldIcon');
INSERT INTO `gy_icon` VALUES ('20000982', 'n_world_add.png', 'n_world_addIcon');
INSERT INTO `gy_icon` VALUES ('20000983', 'n_world_delete.png', 'n_world_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000984', 'n_world_edit.png', 'n_world_editIcon');
INSERT INTO `gy_icon` VALUES ('20000985', 'n_world_go.png', 'n_world_goIcon');
INSERT INTO `gy_icon` VALUES ('20000986', 'n_world_link.png', 'n_world_linkIcon');
INSERT INTO `gy_icon` VALUES ('20000987', 'n_wrench.png', 'n_wrenchIcon');
INSERT INTO `gy_icon` VALUES ('20000988', 'n_wrench_orange.png', 'n_wrench_orangeIcon');
INSERT INTO `gy_icon` VALUES ('20000989', 'n_xhtml.png', 'n_xhtmlIcon');
INSERT INTO `gy_icon` VALUES ('20000990', 'n_xhtml_add.png', 'n_xhtml_addIcon');
INSERT INTO `gy_icon` VALUES ('20000991', 'n_xhtml_delete.png', 'n_xhtml_deleteIcon');
INSERT INTO `gy_icon` VALUES ('20000992', 'n_xhtml_go.png', 'n_xhtml_goIcon');
INSERT INTO `gy_icon` VALUES ('20000993', 'n_xhtml_valid.png', 'n_xhtml_validIcon');
INSERT INTO `gy_icon` VALUES ('20000994', 'n_zoom.png', 'n_zoomIcon');
INSERT INTO `gy_icon` VALUES ('20000995', 'n_zoom_in.png', 'n_zoom_inIcon');
INSERT INTO `gy_icon` VALUES ('20000996', 'n_zoom_out.png', 'n_zoom_outIcon');
INSERT INTO `gy_icon` VALUES ('10000013', 'page_add.png', 'page_addIcon');
INSERT INTO `gy_icon` VALUES ('10000015', 'page_del.png', 'page_delIcon');
INSERT INTO `gy_icon` VALUES ('10000014', 'page_edit_1.png', 'page_edit_1Icon');
INSERT INTO `gy_icon` VALUES ('10000044', 'page_excel.png', 'page_excelIcon');
INSERT INTO `gy_icon` VALUES ('10000030', 'page_find.png', 'page_findIcon');
INSERT INTO `gy_icon` VALUES ('10000016', 'page_refresh.png', 'page_refreshIcon');
INSERT INTO `gy_icon` VALUES ('10000045', 'plugin.png', 'pluginIcon');
INSERT INTO `gy_icon` VALUES ('10000043', 'preview.png', 'previewIcon');
INSERT INTO `gy_icon` VALUES ('10000042', 'printer.png', 'printerIcon');
INSERT INTO `gy_icon` VALUES ('10000055', 'server_connect.png', 'server_connectIcon');
INSERT INTO `gy_icon` VALUES ('10000020', 'status_away.png', 'status_awayIcon');
INSERT INTO `gy_icon` VALUES ('10000021', 'status_busy.png', 'status_busyIcon');
INSERT INTO `gy_icon` VALUES ('10000035', 'status_online.png', 'status_onlineIcon');
INSERT INTO `gy_icon` VALUES ('10000050', 'table.png', 'tableIcon');
INSERT INTO `gy_icon` VALUES ('10000011', 'tbar_synchronize.png', 'tbar_synchronizeIcon');
INSERT INTO `gy_icon` VALUES ('10000059', 'theme2.png', 'theme2Icon');
INSERT INTO `gy_icon` VALUES ('10000061', 'upload.png', 'uploadIcon');
INSERT INTO `gy_icon` VALUES ('10000038', 'user.png', 'userIcon');
INSERT INTO `gy_icon` VALUES ('10000057', 'user_comment.png', 'user_commentIcon');
INSERT INTO `gy_icon` VALUES ('10000034', 'user_female.png', 'user_femaleIcon');
INSERT INTO `gy_icon` VALUES ('10000026', 'window_caise_list.png', 'window_caise_listIcon');
INSERT INTO `gy_icon` VALUES ('10000024', 'wrench.png', 'wrenchIcon');

-- ----------------------------
-- Table structure for `gy_information`
-- ----------------------------
DROP TABLE IF EXISTS `gy_information`;
CREATE TABLE `gy_information` (
  `information_id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(200) DEFAULT NULL COMMENT '信息标题',
  `module` varchar(100) DEFAULT NULL COMMENT '所属模块',
  `content` longtext COMMENT '信息内容',
  `attachment` varchar(200) DEFAULT NULL COMMENT '信息附件',
  `istop` varchar(2) DEFAULT NULL COMMENT '是否置顶',
  `read_count` int(11) DEFAULT '0' COMMENT '信息阅读数',
  `create_user` varchar(100) DEFAULT NULL COMMENT '信息创建用户',
  `create_time` varchar(21) DEFAULT NULL COMMENT '信息创建时间',
  `update_user` varchar(100) DEFAULT NULL COMMENT '信息修改用户',
  `update_time` varchar(21) DEFAULT NULL COMMENT '信息修改时间',
  `assignrolename` varchar(1000) DEFAULT NULL COMMENT '指定阅读角色（冗余）',
  `assignroleid` varchar(2000) DEFAULT NULL COMMENT '指定阅读角色ID（冗余）',
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公用信息发布';

-- ----------------------------
-- Records of gy_information
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_information_role`
-- ----------------------------
DROP TABLE IF EXISTS `gy_information_role`;
CREATE TABLE `gy_information_role` (
  `information_role_id` varchar(64) NOT NULL,
  `information_id` varchar(64) DEFAULT NULL COMMENT '信息ID',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `scrq` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`information_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息发布指派的阅读角色';

-- ----------------------------
-- Records of gy_information_role
-- ----------------------------
INSERT INTO `gy_information_role` VALUES ('402881e84821492f0148214a51590002', '402881ff4726cdd1014726cdd1640000', '10000089', '2014-08-29 18:23:11');
INSERT INTO `gy_information_role` VALUES ('402881e848226b590148226b59670000', '402881ff4726c8d2014726c8d2dc0000', '10000090', '2014-08-29 23:38:53');
INSERT INTO `gy_information_role` VALUES ('402881ec4684e4e9014684f3cf03001d', '402881ec4684e4e9014684e4ea030000', 'YJS05', '2014-06-10 16:45:09');
INSERT INTO `gy_information_role` VALUES ('402881ec4684e4e9014684f3cf21001e', '402881ec4684e4e9014684e4ea030000', '10000089', '2014-06-10 16:45:09');
INSERT INTO `gy_information_role` VALUES ('402881ec46853eec0146853eec970000', '402881ec468048ce0146804987ca0003', 'YJS05', '2014-06-10 18:07:11');
INSERT INTO `gy_information_role` VALUES ('402881ec46853eec0146853eecb50001', '402881ec468048ce0146804987ca0003', '10000088', '2014-06-10 18:07:11');
INSERT INTO `gy_information_role` VALUES ('402881ec46853eec0146853eecd20002', '402881ec468048ce0146804987ca0003', '10000089', '2014-06-10 18:07:11');
INSERT INTO `gy_information_role` VALUES ('402881ec468618e901468619834f0004', '402881ec4684e4e9014684ff1f2d0022', 'YJS04', '2014-06-10 22:05:57');
INSERT INTO `gy_information_role` VALUES ('402881ec468618e901468619836d0005', '402881ec4684e4e9014684ff1f2d0022', 'YJS02', '2014-06-10 22:05:57');
INSERT INTO `gy_information_role` VALUES ('402881ff471a80b301471a80b38b0000', '402881ec468048ce01468048f6740001', 'YJS05', '2014-07-09 17:42:27');
INSERT INTO `gy_information_role` VALUES ('402881ff471a80b301471a80b3ab0001', '402881ec468048ce01468048f6740001', '10000088', '2014-07-09 17:42:27');
INSERT INTO `gy_information_role` VALUES ('402881ff471a80b301471a80b3ca0002', '402881ec468048ce01468048f6740001', '10000087', '2014-07-09 17:42:27');
INSERT INTO `gy_information_role` VALUES ('402881ff471a80b301471a80b3e90003', '402881ec468048ce01468048f6740001', '10000089', '2014-07-09 17:42:27');

-- ----------------------------
-- Table structure for `gy_jdbcmonitor`
-- ----------------------------
DROP TABLE IF EXISTS `gy_jdbcmonitor`;
CREATE TABLE `gy_jdbcmonitor` (
  `MONITORID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SQLTEXT` longtext,
  `STARTTIME` bigint(14) DEFAULT NULL,
  `COSTTIME` int(10) DEFAULT NULL,
  `EFFECTROWS` int(10) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`MONITORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='JDBC监控信息表';

-- ----------------------------
-- Records of gy_jdbcmonitor
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_menu`
-- ----------------------------
DROP TABLE IF EXISTS `gy_menu`;
CREATE TABLE `gy_menu` (
  `MENUID` varchar(60) NOT NULL,
  `MENUNAME` varchar(50) NOT NULL,
  `PARENTID` varchar(60) NOT NULL,
  `ICONCLS` varchar(50) DEFAULT NULL,
  `EXPANDED` varchar(2) DEFAULT '0',
  `REQUEST` varchar(100) DEFAULT NULL,
  `LEAF` varchar(2) NOT NULL DEFAULT '0',
  `SORTNO` int(4) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `ICON` varchar(50) DEFAULT NULL,
  `MENUTYPE` varchar(2) DEFAULT '0',
  `SHORTCUT` varchar(50) DEFAULT NULL,
  `WIDTH` int(4) DEFAULT NULL,
  `HEIGHT` int(4) DEFAULT NULL,
  `SCROLLBAR` varchar(1) DEFAULT '0',
  PRIMARY KEY (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单资源信息表';

-- ----------------------------
-- Records of gy_menu
-- ----------------------------
INSERT INTO `gy_menu` VALUES ('01', '管理平台', '0', null, '0', '', '0', '1', null, null, '1', null, null, null, null);
INSERT INTO `gy_menu` VALUES ('0102', '授权管理平台', '01', 'folder_wrenchIcon', '1', '', '0', '60', null, null, '1', null, null, null, null);
INSERT INTO `gy_menu` VALUES ('010201', '组织机构管理', '0102', 'chart_organisationIcon', '0', 'organization.do?reqCode=departmentInit', '1', '1', null, 'chart_organisation.png', '1', 'onebit_18.png', null, null, '');
INSERT INTO `gy_menu` VALUES ('010202', '人员管理与授权', '0102', 'group_linkIcon', '0', 'user.do?reqCode=userInit', '1', '4', null, 'group_link.png', '1', 'groupofusers.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010204', '角色管理与授权', '0102', 'award_star_silver_3Icon', '0', 'role.do?reqCode=roleInit', '1', '3', null, 'award_star_silver_3.png', '1', 'favbadd.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010205', '菜单资源管理', '0102', 'arrow_switchIcon', '0', 'resource.do?reqCode=menuResourceInit', '1', '2', null, 'arrow_switch.png', '1', 'documentsorcopy.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010206', 'UI元素管理', '0102', 'app_boxesIcon', '0', 'part.do?reqCode=init', '1', '5', '', 'app_boxes.png', '1', 'file.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010207', 'UI元素角色授权', '0102', 'app_leftIcon', '0', 'rolePart.do?reqCode=init', '1', '6', '', 'app_left.png', '1', 'filelocked.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010208', 'UI元素人员授权', '0102', 'app_rightIcon', '0', 'userPart.do?reqCode=init', '1', '7', '', 'app_right.png', '1', 'addfile.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010209', '数据规则管理', '0102', 'app_boxesIcon', '0', 'rule.do?reqCode=init', '1', '8', '', 'app_boxes.png', '1', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('010210', '数据规则角色授权', '0102', 'server_connectIcon', '0', 'ruleRole.do?reqCode=init', '1', '9', '', 'server_connect.png', '1', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('010211', '数据规则人员授权', '0102', 'server_connectIcon', '0', 'ruleUser.do?reqCode=init', '1', '10', '', 'server_connect.png', '1', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('0103', '系统基础管理平台', '01', 'folder_wrenchIcon', '1', '', '0', '70', null, null, '1', null, null, null, null);
INSERT INTO `gy_menu` VALUES ('010301', '系统字典维护', '0103', 'application_view_listIcon', '0', 'resource.do?reqCode=codeTableInit', '1', '1', null, 'application_view_list.png', '1', 'shortcut_11.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010303', '全局参数表维护', '0103', 'configIcon', '0', 'param.do?reqCode=init', '1', '1', null, 'config.png', '1', 'textfile.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010304', '系统预置图标', '0103', 'imagesIcon', '0', 'resource.do?reqCode=iconInit', '1', '99', '', 'images.png', '1', 'shortcut_9.png', null, null, '');
INSERT INTO `gy_menu` VALUES ('010305', 'VFS文件管理', '0103', 'app_boxesIcon', '0', 'common/vfsfile.do?reqCode=init', '1', '4', '', 'app_boxes.png', '1', '', '0', '0', '0');
INSERT INTO `gy_menu` VALUES ('010306', '信息发布管理', '0103', 'app_boxesIcon', '0', 'common/gyinformation/init.action?module=ALL', '1', '3', '', 'app_boxes.png', '1', '', '0', '0', '0');
INSERT INTO `gy_menu` VALUES ('0109', '运行监控平台', '01', 'folder_wrenchIcon', '0', '', '0', '80', '', '', '1', '', '0', '0', '0');
INSERT INTO `gy_menu` VALUES ('010901', 'Session会话监控', '0109', 'user_commentIcon', '0', 'sessionMonitor.do?reqCode=init', '1', '5', null, 'user_comment.png', '1', 'onebit_22.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010903', '帐户访问请求审计', '0109', 'bugIcon', '0', 'eventTrack.do?reqCode=init', '1', '1', null, 'bug.png', '1', 'onebit_08.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010906', '系统异常监控', '0109', 'disconnectIcon', '0', 'beanMonitor.do?reqCode=init', '1', '8', null, 'disconnect.png', '1', 'close.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010907', '服务器信息', '0109', 'server_connectIcon', '0', 'serverInfo.do?reqCode=init', '1', '2', '', 'server_connect.png', '1', 'onebit_12.png', null, null, null);
INSERT INTO `gy_menu` VALUES ('010908', 'Web应用监控', '0109', 'server_connectIcon', '0', 'system/monitor/webapp.jsp', '1', '4', '', 'server_connect.png', '1', '', '0', '0', '0');
INSERT INTO `gy_menu` VALUES ('010909', 'SQL监控', '0109', 'book_previousIcon', '0', 'system/monitor/sql.jsp', '1', '6', '', 'book_previous.png', '1', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('010910', 'WebURI请求监控', '0109', 'bugIcon', '0', 'system/monitor/weburi.jsp', '1', '7', '', 'bug.png', '1', '', '0', '0', '0');
INSERT INTO `gy_menu` VALUES ('010912', '数据源监控', '0109', 'database_refreshIcon', '0', 'system/monitor/datasource.jsp', '1', '3', '', 'database_refresh.png', '1', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('0110', '业务系统', '01', '', '0', '', '0', '0', '', '', '0', '', null, null, '0');
INSERT INTO `gy_menu` VALUES ('011001', '类别管理', '0110', '', '0', 'category/categorys/init.action', '1', '0', '', '', '0', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `gy_menupart`
-- ----------------------------
DROP TABLE IF EXISTS `gy_menupart`;
CREATE TABLE `gy_menupart` (
  `PARTID` varchar(70) NOT NULL,
  `MENUID` varchar(60) NOT NULL,
  `CMPID` varchar(50) NOT NULL,
  `CMPTYPE` varchar(2) NOT NULL,
  `REMARK` varchar(100) DEFAULT '',
  PRIMARY KEY (`PARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UI托管组件';

-- ----------------------------
-- Records of gy_menupart
-- ----------------------------
INSERT INTO `gy_menupart` VALUES ('0105010111', '01050101', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105010112', '01050101', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105010113', '01050101', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105010114', '01050101', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105010115', '01050101', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050101211', '01050101', 'scrq', '2', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010123', '01050101', 'departmentcode', '2', '部门编号');
INSERT INTO `gy_menupart` VALUES ('0105010124', '01050101', 'departmentenglishcode', '2', '部门英文编号(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010125', '01050101', 'departmentname', '2', '部门名称');
INSERT INTO `gy_menupart` VALUES ('0105010126', '01050101', 'departmentenglishname', '2', '部门英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010127', '01050101', 'ordernum', '2', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010128', '01050101', 'styxbj', '2', '是否实体院系的标记，存：是/否');
INSERT INTO `gy_menupart` VALUES ('0105010129', '01050101', 'ssxwfwh', '2', '所属学位分委员会，存：人文社会科学学科学位分委员会/理学学科学位分委员会/医学学科学位分委员会/应用与工程学科学位分委员会');
INSERT INTO `gy_menupart` VALUES ('01050101411', '01050101', 'scrq', '4', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010143', '01050101', 'departmentcode', '4', '部门编号');
INSERT INTO `gy_menupart` VALUES ('0105010144', '01050101', 'departmentenglishcode', '4', '部门英文编号(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010145', '01050101', 'departmentname', '4', '部门名称');
INSERT INTO `gy_menupart` VALUES ('0105010146', '01050101', 'departmentenglishname', '4', '部门英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010147', '01050101', 'ordernum', '4', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010148', '01050101', 'styxbj', '4', '是否实体院系的标记，存：是/否');
INSERT INTO `gy_menupart` VALUES ('0105010149', '01050101', 'ssxwfwh', '4', '所属学位分委员会，存：人文社会科学学科学位分委员会/理学学科学位分委员会/医学学科学位分委员会/应用与工程学科学位分委员会');
INSERT INTO `gy_menupart` VALUES ('0105010211', '01050102', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105010212', '01050102', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105010213', '01050102', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105010214', '01050102', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105010215', '01050102', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050102210', '01050102', 'zzrq', '2', '终止日期');
INSERT INTO `gy_menupart` VALUES ('01050102211', '01050102', 'bsdbj', '2', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('01050102212', '01050102', 'bsdsqrqbegin', '2', '获得博士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102213', '01050102', 'bsdsqrqend', '2', '获得博士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102214', '01050102', 'ssdbj', '2', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('01050102215', '01050102', 'ssdsqrqbegin', '2', '获得硕士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102216', '01050102', 'ssdsqrqend', '2', '获得硕士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102217', '01050102', 'ssyjxksqbj', '2', '是否硕士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050102218', '01050102', 'ssyjxksqrqbegin', '2', '获得硕士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102219', '01050102', 'ssyjxksqrqend', '2', '获得硕士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102220', '01050102', 'bsyjxksqbj', '2', '是否博士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050102221', '01050102', 'bsyjxksqrqbegin', '2', '获得博士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102222', '01050102', 'bsyjxksqrqend', '2', '获得博士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102223', '01050102', 'gjzdxkpzbj', '2', '是否国家重点学科批准');
INSERT INTO `gy_menupart` VALUES ('01050102224', '01050102', 'gjzdxkpzrqbegin', '2', '国家重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102225', '01050102', 'gjzdxkpzrqend', '2', '国家重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102226', '01050102', 'szdxkpzbj', '2', '是否省重点学科');
INSERT INTO `gy_menupart` VALUES ('01050102227', '01050102', 'szdxkpzrqbegin', '2', '省重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102228', '01050102', 'szdxkpzrqend', '2', '省重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102229', '01050102', 'zszybj', '2', '是否自设专业');
INSERT INTO `gy_menupart` VALUES ('0105010223', '01050102', 'subjectinfotype', '2', '学科类别，存：门类/一级学科/二级学科（专业）/三级学科（研究方向）');
INSERT INTO `gy_menupart` VALUES ('01050102230', '01050102', 'xwlb', '2', '学位类别，存：科学学位/专业学位/类专业学位');
INSERT INTO `gy_menupart` VALUES ('01050102231', '01050102', 'xksyml', '2', '学科授予门类（多个，存名称，以\"，\"隔开）');
INSERT INTO `gy_menupart` VALUES ('01050102233', '01050102', 'scrq', '2', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010224', '01050102', 'subjectinfocode', '2', '代码');
INSERT INTO `gy_menupart` VALUES ('0105010225', '01050102', 'subjectinfoenglishcode', '2', '专业英文代码(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010226', '01050102', 'subjectinfoname', '2', '名称');
INSERT INTO `gy_menupart` VALUES ('0105010227', '01050102', 'subjectinfoenglishname', '2', '专业英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010228', '01050102', 'ordernum', '2', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010229', '01050102', 'jlrq', '2', '建立日期');
INSERT INTO `gy_menupart` VALUES ('01050102410', '01050102', 'zzrq', '4', '终止日期');
INSERT INTO `gy_menupart` VALUES ('01050102411', '01050102', 'bsdbj', '4', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('01050102412', '01050102', 'bsdsqrqbegin', '4', '获得博士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102413', '01050102', 'bsdsqrqend', '4', '获得博士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102414', '01050102', 'ssdbj', '4', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('01050102415', '01050102', 'ssdsqrqbegin', '4', '获得硕士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102416', '01050102', 'ssdsqrqend', '4', '获得硕士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102417', '01050102', 'ssyjxksqbj', '4', '是否硕士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050102418', '01050102', 'ssyjxksqrqbegin', '4', '获得硕士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102419', '01050102', 'ssyjxksqrqend', '4', '获得硕士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102420', '01050102', 'bsyjxksqbj', '4', '是否博士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050102421', '01050102', 'bsyjxksqrqbegin', '4', '获得博士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102422', '01050102', 'bsyjxksqrqend', '4', '获得博士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102423', '01050102', 'gjzdxkpzbj', '4', '是否国家重点学科批准');
INSERT INTO `gy_menupart` VALUES ('01050102424', '01050102', 'gjzdxkpzrqbegin', '4', '国家重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102425', '01050102', 'gjzdxkpzrqend', '4', '国家重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102426', '01050102', 'szdxkpzbj', '4', '是否省重点学科');
INSERT INTO `gy_menupart` VALUES ('01050102427', '01050102', 'szdxkpzrqbegin', '4', '省重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050102428', '01050102', 'szdxkpzrqend', '4', '省重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050102429', '01050102', 'zszybj', '4', '是否自设专业');
INSERT INTO `gy_menupart` VALUES ('0105010243', '01050102', 'subjectinfotype', '4', '学科类别，存：门类/一级学科/二级学科（专业）/三级学科（研究方向）');
INSERT INTO `gy_menupart` VALUES ('01050102430', '01050102', 'xwlb', '4', '学位类别，存：科学学位/专业学位/类专业学位');
INSERT INTO `gy_menupart` VALUES ('01050102431', '01050102', 'xksyml', '4', '学科授予门类（多个，存名称，以\"，\"隔开）');
INSERT INTO `gy_menupart` VALUES ('01050102433', '01050102', 'scrq', '4', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010244', '01050102', 'subjectinfocode', '4', '代码');
INSERT INTO `gy_menupart` VALUES ('0105010245', '01050102', 'subjectinfoenglishcode', '4', '专业英文代码(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010246', '01050102', 'subjectinfoname', '4', '名称');
INSERT INTO `gy_menupart` VALUES ('0105010247', '01050102', 'subjectinfoenglishname', '4', '专业英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010248', '01050102', 'ordernum', '4', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010249', '01050102', 'jlrq', '4', '建立日期');
INSERT INTO `gy_menupart` VALUES ('0105010311', '01050103', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105010312', '01050103', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105010313', '01050103', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105010314', '01050103', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105010315', '01050103', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050103210', '01050103', 'ksnf', '2', '开设年份');
INSERT INTO `gy_menupart` VALUES ('01050103211', '01050103', 'yxqjzbj', '2', '有效期截止标记');
INSERT INTO `gy_menupart` VALUES ('01050103212', '01050103', 'yxqjzsj', '2', '有效期截止时间');
INSERT INTO `gy_menupart` VALUES ('01050103213', '01050103', 'scrq', '2', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010324', '01050103', 'bjeditbj', '2', '是否允许学院修改本级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010325', '01050103', 'bjdeletebj', '2', '是否允许学院删除本级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010326', '01050103', 'xjnewbj', '2', '是否允许学院新增下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010327', '01050103', 'xjeditbj', '2', '是否允许学院修改下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010328', '01050103', 'xjdeletebj', '2', '是否允许学院删除下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010329', '01050103', 'ksxq', '2', '开设校区');
INSERT INTO `gy_menupart` VALUES ('01050103410', '01050103', 'ksnf', '4', '开设年份');
INSERT INTO `gy_menupart` VALUES ('01050103411', '01050103', 'yxqjzbj', '4', '有效期截止标记');
INSERT INTO `gy_menupart` VALUES ('01050103412', '01050103', 'yxqjzsj', '4', '有效期截止时间');
INSERT INTO `gy_menupart` VALUES ('01050103413', '01050103', 'scrq', '4', '时间戳');
INSERT INTO `gy_menupart` VALUES ('01050103414', '01050103', 'departmentcode', '4', '部门代码');
INSERT INTO `gy_menupart` VALUES ('01050103415', '01050103', 'departmentname', '4', '部门名称');
INSERT INTO `gy_menupart` VALUES ('01050103416', '01050103', 'subjectinfocode', '4', '学科专业代码');
INSERT INTO `gy_menupart` VALUES ('01050103417', '01050103', 'subjectinfotype', '4', '学科专业类型');
INSERT INTO `gy_menupart` VALUES ('01050103418', '01050103', 'subjectinfoname', '4', '学科专业名称');
INSERT INTO `gy_menupart` VALUES ('0105010344', '01050103', 'bjeditbj', '4', '是否允许学院修改本级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010345', '01050103', 'bjdeletebj', '4', '是否允许学院删除本级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010346', '01050103', 'xjnewbj', '4', '是否允许学院新增下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010347', '01050103', 'xjeditbj', '4', '是否允许学院修改下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010348', '01050103', 'xjdeletebj', '4', '是否允许学院删除下级别内容');
INSERT INTO `gy_menupart` VALUES ('0105010349', '01050103', 'ksxq', '4', '开设校区');
INSERT INTO `gy_menupart` VALUES ('0105010511', '01050105', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105010512', '01050105', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105010513', '01050105', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105010514', '01050105', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105010515', '01050105', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050105210', '01050105', 'zzrq', '2', '终止日期');
INSERT INTO `gy_menupart` VALUES ('01050105211', '01050105', 'bsdbj', '2', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('01050105212', '01050105', 'bsdsqrqbegin', '2', '获得博士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105213', '01050105', 'bsdsqrqend', '2', '获得博士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105214', '01050105', 'ssdbj', '2', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('01050105215', '01050105', 'ssdsqrqbegin', '2', '获得硕士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105216', '01050105', 'ssdsqrqend', '2', '获得硕士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105217', '01050105', 'ssyjxksqbj', '2', '是否硕士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050105218', '01050105', 'ssyjxksqrqbegin', '2', '获得硕士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105219', '01050105', 'ssyjxksqrqend', '2', '获得硕士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105220', '01050105', 'bsyjxksqbj', '2', '是否博士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050105221', '01050105', 'bsyjxksqrqbegin', '2', '获得博士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105222', '01050105', 'bsyjxksqrqend', '2', '获得博士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105223', '01050105', 'gjzdxkpzbj', '2', '是否国家重点学科批准');
INSERT INTO `gy_menupart` VALUES ('01050105224', '01050105', 'gjzdxkpzrqbegin', '2', '国家重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105225', '01050105', 'gjzdxkpzrqend', '2', '国家重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105226', '01050105', 'szdxkpzbj', '2', '是否省重点学科');
INSERT INTO `gy_menupart` VALUES ('01050105227', '01050105', 'szdxkpzrqbegin', '2', '省重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105228', '01050105', 'szdxkpzrqend', '2', '省重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105229', '01050105', 'zszybj', '2', '是否自设专业');
INSERT INTO `gy_menupart` VALUES ('0105010523', '01050105', 'subjectinfotype', '2', '学科类别，存：门类/一级学科/二级学科（专业）/三级学科（研究方向）');
INSERT INTO `gy_menupart` VALUES ('01050105230', '01050105', 'xwlb', '2', '学位类别，存：科学学位/专业学位/类专业学位');
INSERT INTO `gy_menupart` VALUES ('01050105231', '01050105', 'xksyml', '2', '学科授予门类（多个，存名称，以\"，\"隔开）');
INSERT INTO `gy_menupart` VALUES ('01050105233', '01050105', 'scrq', '2', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010524', '01050105', 'subjectinfocode', '2', '代码');
INSERT INTO `gy_menupart` VALUES ('0105010525', '01050105', 'subjectinfoenglishcode', '2', '专业英文代码(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010526', '01050105', 'subjectinfoname', '2', '名称');
INSERT INTO `gy_menupart` VALUES ('0105010527', '01050105', 'subjectinfoenglishname', '2', '专业英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010528', '01050105', 'ordernum', '2', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010529', '01050105', 'jlrq', '2', '建立日期');
INSERT INTO `gy_menupart` VALUES ('01050105410', '01050105', 'zzrq', '4', '终止日期');
INSERT INTO `gy_menupart` VALUES ('01050105411', '01050105', 'bsdbj', '4', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('01050105412', '01050105', 'bsdsqrqbegin', '4', '获得博士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105413', '01050105', 'bsdsqrqend', '4', '获得博士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105414', '01050105', 'ssdbj', '4', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('01050105415', '01050105', 'ssdsqrqbegin', '4', '获得硕士点授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105416', '01050105', 'ssdsqrqend', '4', '获得硕士点授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105417', '01050105', 'ssyjxksqbj', '4', '是否硕士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050105418', '01050105', 'ssyjxksqrqbegin', '4', '获得硕士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105419', '01050105', 'ssyjxksqrqend', '4', '获得硕士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105420', '01050105', 'bsyjxksqbj', '4', '是否博士一级学科授权');
INSERT INTO `gy_menupart` VALUES ('01050105421', '01050105', 'bsyjxksqrqbegin', '4', '获得博士一级学科授权日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105422', '01050105', 'bsyjxksqrqend', '4', '获得博士一级学科授权日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105423', '01050105', 'gjzdxkpzbj', '4', '是否国家重点学科批准');
INSERT INTO `gy_menupart` VALUES ('01050105424', '01050105', 'gjzdxkpzrqbegin', '4', '国家重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105425', '01050105', 'gjzdxkpzrqend', '4', '国家重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105426', '01050105', 'szdxkpzbj', '4', '是否省重点学科');
INSERT INTO `gy_menupart` VALUES ('01050105427', '01050105', 'szdxkpzrqbegin', '4', '省重点学科批准日期起始');
INSERT INTO `gy_menupart` VALUES ('01050105428', '01050105', 'szdxkpzrqend', '4', '省重点学科批准日期截止');
INSERT INTO `gy_menupart` VALUES ('01050105429', '01050105', 'zszybj', '4', '是否自设专业');
INSERT INTO `gy_menupart` VALUES ('0105010543', '01050105', 'subjectinfotype', '4', '学科类别，存：门类/一级学科/二级学科（专业）/三级学科（研究方向）');
INSERT INTO `gy_menupart` VALUES ('01050105430', '01050105', 'xwlb', '4', '学位类别，存：科学学位/专业学位/类专业学位');
INSERT INTO `gy_menupart` VALUES ('01050105431', '01050105', 'xksyml', '4', '学科授予门类（多个，存名称，以\"，\"隔开）');
INSERT INTO `gy_menupart` VALUES ('01050105433', '01050105', 'scrq', '4', '时间戳');
INSERT INTO `gy_menupart` VALUES ('0105010544', '01050105', 'subjectinfocode', '4', '代码');
INSERT INTO `gy_menupart` VALUES ('0105010545', '01050105', 'subjectinfoenglishcode', '4', '专业英文代码(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010546', '01050105', 'subjectinfoname', '4', '名称');
INSERT INTO `gy_menupart` VALUES ('0105010547', '01050105', 'subjectinfoenglishname', '4', '专业英文名称(用于英文成绩单、英文在学证明等调用)');
INSERT INTO `gy_menupart` VALUES ('0105010548', '01050105', 'ordernum', '4', '排序（相同父级下的排序）');
INSERT INTO `gy_menupart` VALUES ('0105010549', '01050105', 'jlrq', '4', '建立日期');
INSERT INTO `gy_menupart` VALUES ('0105030111', '01050301', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105030112', '01050301', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105030113', '01050301', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105030114', '01050301', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105030115', '01050301', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105030121', '01050301', 'sfxwjz', '2', '是否校外兼职：校内导师、校批兼职导师、院批兼职导师');
INSERT INTO `gy_menupart` VALUES ('01050301210', '01050301', 'zgxl', '2', '最高学历');
INSERT INTO `gy_menupart` VALUES ('01050301211', '01050301', 'zhxw', '2', '最后学位');
INSERT INTO `gy_menupart` VALUES ('01050301212', '01050301', 'gzdw', '2', '工作单位');
INSERT INTO `gy_menupart` VALUES ('01050301213', '01050301', 'xzzw', '2', '目前行政职务');
INSERT INTO `gy_menupart` VALUES ('01050301214', '01050301', 'zc', '2', '职称');
INSERT INTO `gy_menupart` VALUES ('01050301215', '01050301', 'dqzt', '2', '当前状态：在校在岗/在校不在岗/退休不返聘/退休返聘/调离/去世');
INSERT INTO `gy_menupart` VALUES ('01050301216', '01050301', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050301217', '01050301', 'email', '2', 'email地址');
INSERT INTO `gy_menupart` VALUES ('01050301218', '01050301', 'dh', '2', '电话');
INSERT INTO `gy_menupart` VALUES ('01050301219', '01050301', 'yzbm', '2', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105030122', '01050301', 'xm', '2', '姓名');
INSERT INTO `gy_menupart` VALUES ('01050301220', '01050301', 'lxdz', '2', '联系地址');
INSERT INTO `gy_menupart` VALUES ('01050301221', '01050301', 'dslb', '2', '导师类别：硕导/博导');
INSERT INTO `gy_menupart` VALUES ('01050301222', '01050301', 'sdlxfs', '2', '硕导遴选方式：校内遴选/百人计划确认/千人计划确认/其他确认');
INSERT INTO `gy_menupart` VALUES ('01050301223', '01050301', 'bdlxfs', '2', '博导遴选方式：校内遴选/百人计划确认/千人计划确认/其他确认');
INSERT INTO `gy_menupart` VALUES ('01050301224', '01050301', 'dslx', '2', '导师类型：学术型/专业学位');
INSERT INTO `gy_menupart` VALUES ('01050301225', '01050301', 'sdrqbegin', '2', '硕导聘任起始时间');
INSERT INTO `gy_menupart` VALUES ('01050301226', '01050301', 'sdrqend', '2', '硕导聘任截止时间');
INSERT INTO `gy_menupart` VALUES ('01050301227', '01050301', 'bdrqbegin', '2', '博导聘任起始时间');
INSERT INTO `gy_menupart` VALUES ('01050301228', '01050301', 'bdrqend', '2', '博导聘任截止时间');
INSERT INTO `gy_menupart` VALUES ('01050301229', '01050301', 'sfxsbdjt', '2', '是否享受博导津贴：是、否');
INSERT INTO `gy_menupart` VALUES ('0105030123', '01050301', 'zgh', '2', '职工号');
INSERT INTO `gy_menupart` VALUES ('01050301230', '01050301', 'xsbdjtrq', '2', '享受博导津贴的日期');
INSERT INTO `gy_menupart` VALUES ('01050301231', '01050301', 'sszszg', '2', '是否有硕士招生资格：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301232', '01050301', 'sszszgddzs', '2', '硕士招生是否可以单独招生：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301233', '01050301', 'bszszg', '2', '是否有博士招生资格：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301234', '01050301', 'bszszgddzs', '2', '博士招生是否可以单独招生：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301235', '01050301', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050301236', '01050301', 'yxtjbj', '2', '院系提交标志：未提交、已提交');
INSERT INTO `gy_menupart` VALUES ('01050301237', '01050301', 'yxtjbz', '2', '院系提交说明');
INSERT INTO `gy_menupart` VALUES ('01050301238', '01050301', 'yxtjrq', '2', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050301239', '01050301', 'yyspjg', '2', '研院审批结果：通过、不通过');
INSERT INTO `gy_menupart` VALUES ('0105030124', '01050301', 'dsbh', '2', '导师编号');
INSERT INTO `gy_menupart` VALUES ('01050301240', '01050301', 'yyspbz', '2', '研院审批说明');
INSERT INTO `gy_menupart` VALUES ('01050301241', '01050301', 'yysprq', '2', '研院审批日期');
INSERT INTO `gy_menupart` VALUES ('01050301242', '01050301', 'zp', '2', '照片');
INSERT INTO `gy_menupart` VALUES ('0105030125', '01050301', 'departmentname', '2', '所在部门');
INSERT INTO `gy_menupart` VALUES ('0105030126', '01050301', 'xb', '2', '性别');
INSERT INTO `gy_menupart` VALUES ('0105030127', '01050301', 'csrq', '2', '出生日期');
INSERT INTO `gy_menupart` VALUES ('0105030128', '01050301', 'sfzh', '2', '身份证号码');
INSERT INTO `gy_menupart` VALUES ('0105030129', '01050301', 'zzmm', '2', '政治面貌');
INSERT INTO `gy_menupart` VALUES ('0105030141', '01050301', 'sfxwjz', '4', '是否校外兼职：校内导师、校批兼职导师、院批兼职导师');
INSERT INTO `gy_menupart` VALUES ('01050301410', '01050301', 'zgxl', '4', '最高学历');
INSERT INTO `gy_menupart` VALUES ('01050301411', '01050301', 'zhxw', '4', '最后学位');
INSERT INTO `gy_menupart` VALUES ('01050301412', '01050301', 'gzdw', '4', '工作单位');
INSERT INTO `gy_menupart` VALUES ('01050301413', '01050301', 'xzzw', '4', '目前行政职务');
INSERT INTO `gy_menupart` VALUES ('01050301414', '01050301', 'zc', '4', '职称');
INSERT INTO `gy_menupart` VALUES ('01050301415', '01050301', 'dqzt', '4', '当前状态：在校在岗/在校不在岗/退休不返聘/退休返聘/调离/去世');
INSERT INTO `gy_menupart` VALUES ('01050301416', '01050301', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050301417', '01050301', 'email', '4', 'email地址');
INSERT INTO `gy_menupart` VALUES ('01050301418', '01050301', 'dh', '4', '电话');
INSERT INTO `gy_menupart` VALUES ('01050301419', '01050301', 'yzbm', '4', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105030142', '01050301', 'xm', '4', '姓名');
INSERT INTO `gy_menupart` VALUES ('01050301420', '01050301', 'lxdz', '4', '联系地址');
INSERT INTO `gy_menupart` VALUES ('01050301421', '01050301', 'dslb', '4', '导师类别：硕导/博导');
INSERT INTO `gy_menupart` VALUES ('01050301422', '01050301', 'sdlxfs', '4', '硕导遴选方式：校内遴选/百人计划确认/千人计划确认/其他确认');
INSERT INTO `gy_menupart` VALUES ('01050301423', '01050301', 'bdlxfs', '4', '博导遴选方式：校内遴选/百人计划确认/千人计划确认/其他确认');
INSERT INTO `gy_menupart` VALUES ('01050301424', '01050301', 'dslx', '4', '导师类型：学术型/专业学位');
INSERT INTO `gy_menupart` VALUES ('01050301425', '01050301', 'sdrqbegin', '4', '硕导聘任起始时间');
INSERT INTO `gy_menupart` VALUES ('01050301426', '01050301', 'sdrqend', '4', '硕导聘任截止时间');
INSERT INTO `gy_menupart` VALUES ('01050301427', '01050301', 'bdrqbegin', '4', '博导聘任起始时间');
INSERT INTO `gy_menupart` VALUES ('01050301428', '01050301', 'bdrqend', '4', '博导聘任截止时间');
INSERT INTO `gy_menupart` VALUES ('01050301429', '01050301', 'sfxsbdjt', '4', '是否享受博导津贴：是、否');
INSERT INTO `gy_menupart` VALUES ('0105030143', '01050301', 'zgh', '4', '职工号');
INSERT INTO `gy_menupart` VALUES ('01050301430', '01050301', 'xsbdjtrq', '4', '享受博导津贴的日期');
INSERT INTO `gy_menupart` VALUES ('01050301431', '01050301', 'sszszg', '4', '是否有硕士招生资格：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301432', '01050301', 'sszszgddzs', '4', '硕士招生是否可以单独招生：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301433', '01050301', 'bszszg', '4', '是否有博士招生资格：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301434', '01050301', 'bszszgddzs', '4', '博士招生是否可以单独招生：是|否');
INSERT INTO `gy_menupart` VALUES ('01050301435', '01050301', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050301436', '01050301', 'yxtjbj', '4', '院系提交标志：未提交、已提交');
INSERT INTO `gy_menupart` VALUES ('01050301437', '01050301', 'yxtjbz', '4', '院系提交说明');
INSERT INTO `gy_menupart` VALUES ('01050301438', '01050301', 'yxtjrq', '4', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050301439', '01050301', 'yyspjg', '4', '研院审批结果：通过、不通过');
INSERT INTO `gy_menupart` VALUES ('0105030144', '01050301', 'dsbh', '4', '导师编号');
INSERT INTO `gy_menupart` VALUES ('01050301440', '01050301', 'yyspbz', '4', '研院审批说明');
INSERT INTO `gy_menupart` VALUES ('01050301441', '01050301', 'yysprq', '4', '研院审批日期');
INSERT INTO `gy_menupart` VALUES ('0105030145', '01050301', 'departmentname', '4', '所在部门');
INSERT INTO `gy_menupart` VALUES ('0105030146', '01050301', 'xb', '4', '性别');
INSERT INTO `gy_menupart` VALUES ('0105030147', '01050301', 'csrq', '4', '出生日期');
INSERT INTO `gy_menupart` VALUES ('0105030148', '01050301', 'sfzh', '4', '身份证号码');
INSERT INTO `gy_menupart` VALUES ('0105030149', '01050301', 'zzmm', '4', '政治面貌');
INSERT INTO `gy_menupart` VALUES ('01050402P11', '01050402', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050402P12', '01050402', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050402P13', '01050402', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050402P14', '01050402', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050402P15', '01050402', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050402P21', '01050402', 'title', '2', '信息标题');
INSERT INTO `gy_menupart` VALUES ('01050402P210', '01050402', 'updatetime', '2', '信息修改时间');
INSERT INTO `gy_menupart` VALUES ('01050402P22', '01050402', 'module', '2', '所属模块');
INSERT INTO `gy_menupart` VALUES ('01050402P23', '01050402', 'content', '2', '信息内容');
INSERT INTO `gy_menupart` VALUES ('01050402P24', '01050402', 'attachment', '2', '信息附件');
INSERT INTO `gy_menupart` VALUES ('01050402P25', '01050402', 'istop', '2', '是否置顶');
INSERT INTO `gy_menupart` VALUES ('01050402P26', '01050402', 'readcount', '2', '信息阅读数');
INSERT INTO `gy_menupart` VALUES ('01050402P27', '01050402', 'createuser', '2', '信息创建用户');
INSERT INTO `gy_menupart` VALUES ('01050402P28', '01050402', 'createtime', '2', '信息创建时间');
INSERT INTO `gy_menupart` VALUES ('01050402P29', '01050402', 'updateuser', '2', '信息修改用户');
INSERT INTO `gy_menupart` VALUES ('01050402P41', '01050402', 'title', '4', '信息标题');
INSERT INTO `gy_menupart` VALUES ('01050402P410', '01050402', 'updatetime', '4', '信息修改时间');
INSERT INTO `gy_menupart` VALUES ('01050402P42', '01050402', 'module', '4', '所属模块');
INSERT INTO `gy_menupart` VALUES ('01050402P43', '01050402', 'content', '4', '信息内容');
INSERT INTO `gy_menupart` VALUES ('01050402P44', '01050402', 'attachment', '4', '信息附件');
INSERT INTO `gy_menupart` VALUES ('01050402P45', '01050402', 'istop', '4', '是否置顶');
INSERT INTO `gy_menupart` VALUES ('01050402P46', '01050402', 'readcount', '4', '信息阅读数');
INSERT INTO `gy_menupart` VALUES ('01050402P47', '01050402', 'createuser', '4', '信息创建用户');
INSERT INTO `gy_menupart` VALUES ('01050402P48', '01050402', 'createtime', '4', '信息创建时间');
INSERT INTO `gy_menupart` VALUES ('01050402P49', '01050402', 'updateuser', '4', '信息修改用户');
INSERT INTO `gy_menupart` VALUES ('01050403P11', '01050403', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050403P12', '01050403', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050403P13', '01050403', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050403P14', '01050403', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050403P15', '01050403', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050403P21', '01050403', 'comment', '2', '参数标题');
INSERT INTO `gy_menupart` VALUES ('01050403P210', '01050403', 'sortno', '2', '');
INSERT INTO `gy_menupart` VALUES ('01050403P211', '01050403', 'remark', '2', '参数附加说明');
INSERT INTO `gy_menupart` VALUES ('01050403P22', '01050403', 'fatherkey', '2', '参数父KEY');
INSERT INTO `gy_menupart` VALUES ('01050403P23', '01050403', 'paramvalue', '2', '业务参数值');
INSERT INTO `gy_menupart` VALUES ('01050403P24', '01050403', 'pvtype', '2', '参数类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P25', '01050403', 'paramvalue2', '2', '参数值2');
INSERT INTO `gy_menupart` VALUES ('01050403P26', '01050403', 'pv2type', '2', '参数2类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P27', '01050403', 'paramvalue3', '2', '参数值3');
INSERT INTO `gy_menupart` VALUES ('01050403P28', '01050403', 'pv3type', '2', '参数3类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P29', '01050403', 'promptmsg', '2', '提示语言');
INSERT INTO `gy_menupart` VALUES ('01050403P41', '01050403', 'comment', '4', '参数标题');
INSERT INTO `gy_menupart` VALUES ('01050403P410', '01050403', 'sortno', '4', '');
INSERT INTO `gy_menupart` VALUES ('01050403P411', '01050403', 'remark', '4', '参数附加说明');
INSERT INTO `gy_menupart` VALUES ('01050403P42', '01050403', 'fatherkey', '4', '参数父KEY');
INSERT INTO `gy_menupart` VALUES ('01050403P43', '01050403', 'paramvalue', '4', '业务参数值');
INSERT INTO `gy_menupart` VALUES ('01050403P44', '01050403', 'pvtype', '4', '参数类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P45', '01050403', 'paramvalue2', '4', '参数值2');
INSERT INTO `gy_menupart` VALUES ('01050403P46', '01050403', 'pv2type', '4', '参数2类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P47', '01050403', 'paramvalue3', '4', '参数值3');
INSERT INTO `gy_menupart` VALUES ('01050403P48', '01050403', 'pv3type', '4', '参数3类型（年度|年月|是否|日期(YYYY-MM-DD)|日期时间戳(YYYY-MM-DD HH:MM:SS)|文本|密码|代码值:DMCODE|枚举值:值1#值2#值3#值4）');
INSERT INTO `gy_menupart` VALUES ('01050403P49', '01050403', 'promptmsg', '4', '提示语言');
INSERT INTO `gy_menupart` VALUES ('01050405P11', '01050405', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050405P12', '01050405', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050405P13', '01050405', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050405P14', '01050405', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050405P15', '01050405', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050405P21', '01050405', 'columnname', '2', '数据表的字段');
INSERT INTO `gy_menupart` VALUES ('01050405P22', '01050405', 'columncomment', '2', '字段中文名称');
INSERT INTO `gy_menupart` VALUES ('01050405P23', '01050405', 'jscode', '2', 'EXT代码');
INSERT INTO `gy_menupart` VALUES ('01050405P24', '01050405', 'jscodeext', '2', '附加的extjs代码');
INSERT INTO `gy_menupart` VALUES ('01050405P25', '01050405', 'opersymbol', '2', '关系运算符(in,equal,notequal,like,notlike,gt,lt,ge,le)（在..中，等于，不等于，像，不像，大于，小于，大于等于，小于等于）');
INSERT INTO `gy_menupart` VALUES ('01050405P26', '01050405', 'sort', '2', '排序');
INSERT INTO `gy_menupart` VALUES ('01050405P27', '01050405', 'forscene', '2', '使用场景');
INSERT INTO `gy_menupart` VALUES ('01050405P41', '01050405', 'columnname', '4', '数据表的字段');
INSERT INTO `gy_menupart` VALUES ('01050405P42', '01050405', 'columncomment', '4', '字段中文名称');
INSERT INTO `gy_menupart` VALUES ('01050405P43', '01050405', 'jscode', '4', 'EXT代码');
INSERT INTO `gy_menupart` VALUES ('01050405P44', '01050405', 'jscodeext', '4', '附加的extjs代码');
INSERT INTO `gy_menupart` VALUES ('01050405P45', '01050405', 'opersymbol', '4', '关系运算符(in,equal,notequal,like,notlike,gt,lt,ge,le)（在..中，等于，不等于，像，不像，大于，小于，大于等于，小于等于）');
INSERT INTO `gy_menupart` VALUES ('01050405P46', '01050405', 'sort', '4', '排序');
INSERT INTO `gy_menupart` VALUES ('01050405P47', '01050405', 'forscene', '4', '使用场景');
INSERT INTO `gy_menupart` VALUES ('01050406P11', '01050406', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050406P12', '01050406', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050406P13', '01050406', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050406P14', '01050406', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050406P15', '01050406', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050406P21', '01050406', 'itemname', '2', '校对项目名称');
INSERT INTO `gy_menupart` VALUES ('01050406P22', '01050406', 'itemcol', '2', '项目对应的数据库字段');
INSERT INTO `gy_menupart` VALUES ('01050406P23', '01050406', 'jscode', '2', 'EXT代码');
INSERT INTO `gy_menupart` VALUES ('01050406P24', '01050406', 'jscodeext', '2', '附加的extjs代码');
INSERT INTO `gy_menupart` VALUES ('01050406P25', '01050406', 'orderno', '2', '排序序号');
INSERT INTO `gy_menupart` VALUES ('01050406P26', '01050406', 'sort', '2', '所属分类');
INSERT INTO `gy_menupart` VALUES ('01050406P41', '01050406', 'itemname', '4', '校对项目名称');
INSERT INTO `gy_menupart` VALUES ('01050406P42', '01050406', 'itemcol', '4', '项目对应的数据库字段');
INSERT INTO `gy_menupart` VALUES ('01050406P43', '01050406', 'jscode', '4', 'EXT代码');
INSERT INTO `gy_menupart` VALUES ('01050406P44', '01050406', 'jscodeext', '4', '附加的extjs代码');
INSERT INTO `gy_menupart` VALUES ('01050406P45', '01050406', 'orderno', '4', '排序序号');
INSERT INTO `gy_menupart` VALUES ('01050406P46', '01050406', 'sort', '4', '所属分类');
INSERT INTO `gy_menupart` VALUES ('0105050102P11', '0105050102', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105050102P12', '0105050102', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105050102P13', '0105050102', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105050102P14', '0105050102', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105050102P15', '0105050102', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105050102P21', '0105050102', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050102P210', '0105050102', 'zsyjfxmc', '2', '招生目录研究方向名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P211', '0105050102', 'syfw', '2', '使用范围（存：硕士| 博士| 港澳台硕士| 港澳台博士，支持多选）');
INSERT INTO `gy_menupart` VALUES ('0105050102P212', '0105050102', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050102P213', '0105050102', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050102P214', '0105050102', 'departmentname', '2', '院系名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P215', '0105050102', 'departmentcode', '2', '院系编号');
INSERT INTO `gy_menupart` VALUES ('0105050102P216', '0105050102', 'subjectinfotype', '2', '学科专业类别');
INSERT INTO `gy_menupart` VALUES ('0105050102P217', '0105050102', 'subjectinfocode', '2', '学科专业代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P218', '0105050102', 'subjectinfoname', '2', '学科专业名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P23', '0105050102', 'zszydmsfyxxg', '2', '允许学院修改专业代码（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P24', '0105050102', 'zszydm', '2', '招生目录专业代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P25', '0105050102', 'zszymcsfyxxg', '2', '允许学院修改专业名称（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P26', '0105050102', 'zszymc', '2', '招生目录专业名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P27', '0105050102', 'zsyjfxdmsfyxxg', '2', '允许学院修改研究方向代码（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P28', '0105050102', 'zsyjfxdm', '2', '招生目录研究方向代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P29', '0105050102', 'zsyjfxmcsfyxxg', '2', '允许学院修改研究方向名称（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P41', '0105050102', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050102P410', '0105050102', 'zsyjfxmc', '4', '招生目录研究方向名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P411', '0105050102', 'syfw', '4', '使用范围（存：硕士| 博士| 港澳台硕士| 港澳台博士，支持多选）');
INSERT INTO `gy_menupart` VALUES ('0105050102P412', '0105050102', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050102P413', '0105050102', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050102P414', '0105050102', 'departmentname', '4', '院系名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P415', '0105050102', 'departmentcode', '4', '院系编号');
INSERT INTO `gy_menupart` VALUES ('0105050102P416', '0105050102', 'subjectinfotype', '4', '学科专业类别');
INSERT INTO `gy_menupart` VALUES ('0105050102P417', '0105050102', 'subjectinfocode', '4', '学科专业代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P418', '0105050102', 'subjectinfoname', '4', '学科专业名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P43', '0105050102', 'zszydmsfyxxg', '4', '允许学院修改专业代码（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P44', '0105050102', 'zszydm', '4', '招生目录专业代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P45', '0105050102', 'zszymcsfyxxg', '4', '允许学院修改专业名称（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P46', '0105050102', 'zszymc', '4', '招生目录专业名称');
INSERT INTO `gy_menupart` VALUES ('0105050102P47', '0105050102', 'zsyjfxdmsfyxxg', '4', '允许学院修改研究方向代码（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050102P48', '0105050102', 'zsyjfxdm', '4', '招生目录研究方向代码');
INSERT INTO `gy_menupart` VALUES ('0105050102P49', '0105050102', 'zsyjfxmcsfyxxg', '4', '允许学院修改研究方向名称（默认否）');
INSERT INTO `gy_menupart` VALUES ('0105050201P11', '0105050201', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105050201P12', '0105050201', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105050201P13', '0105050201', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105050201P14', '0105050201', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105050201P15', '0105050201', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105050201P21', '0105050201', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050201P210', '0105050201', 'lxbm', '2', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050201P211', '0105050201', 'cz', '2', '传真');
INSERT INTO `gy_menupart` VALUES ('0105050201P212', '0105050201', 'yddh', '2', '移动电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P213', '0105050201', 'jssjrim', '2', '接收试卷人QQ');
INSERT INTO `gy_menupart` VALUES ('0105050201P214', '0105050201', 'email', '2', '电子邮箱');
INSERT INTO `gy_menupart` VALUES ('0105050201P215', '0105050201', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050201P216', '0105050201', 'lxrxm', '2', '联系人姓名');
INSERT INTO `gy_menupart` VALUES ('0105050201P217', '0105050201', 'lxrdh', '2', '联系人电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P218', '0105050201', 'lxrsj', '2', '联系人手机');
INSERT INTO `gy_menupart` VALUES ('0105050201P219', '0105050201', 'lxrcz', '2', '联系人传真');
INSERT INTO `gy_menupart` VALUES ('0105050201P22', '0105050201', 'jssjdz', '2', '接收试卷地址');
INSERT INTO `gy_menupart` VALUES ('0105050201P220', '0105050201', 'lxrim', '2', '联系人QQ');
INSERT INTO `gy_menupart` VALUES ('0105050201P221', '0105050201', 'lxremail', '2', '联系人邮箱');
INSERT INTO `gy_menupart` VALUES ('0105050201P222', '0105050201', 'lxrzw', '2', '联系人职务');
INSERT INTO `gy_menupart` VALUES ('0105050201P223', '0105050201', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050201P23', '0105050201', 'jssjrxm', '2', '接收试卷人姓名');
INSERT INTO `gy_menupart` VALUES ('0105050201P24', '0105050201', 'sjjsrdh', '2', '试卷接收人电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P25', '0105050201', 'yzbm', '2', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105050201P26', '0105050201', 'bmddm', '2', '报名点代码');
INSERT INTO `gy_menupart` VALUES ('0105050201P27', '0105050201', 'bmdmc', '2', '报名点名称');
INSERT INTO `gy_menupart` VALUES ('0105050201P28', '0105050201', 'szssm', '2', '所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105050201P29', '0105050201', 'csmc', '2', '省市名称');
INSERT INTO `gy_menupart` VALUES ('0105050201P41', '0105050201', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050201P410', '0105050201', 'lxbm', '4', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050201P411', '0105050201', 'cz', '4', '传真');
INSERT INTO `gy_menupart` VALUES ('0105050201P412', '0105050201', 'yddh', '4', '移动电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P413', '0105050201', 'jssjrim', '4', '接收试卷人QQ');
INSERT INTO `gy_menupart` VALUES ('0105050201P414', '0105050201', 'email', '4', '电子邮箱');
INSERT INTO `gy_menupart` VALUES ('0105050201P415', '0105050201', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050201P416', '0105050201', 'lxrxm', '4', '联系人姓名');
INSERT INTO `gy_menupart` VALUES ('0105050201P417', '0105050201', 'lxrdh', '4', '联系人电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P418', '0105050201', 'lxrsj', '4', '联系人手机');
INSERT INTO `gy_menupart` VALUES ('0105050201P419', '0105050201', 'lxrcz', '4', '联系人传真');
INSERT INTO `gy_menupart` VALUES ('0105050201P42', '0105050201', 'jssjdz', '4', '接收试卷地址');
INSERT INTO `gy_menupart` VALUES ('0105050201P420', '0105050201', 'lxrim', '4', '联系人QQ');
INSERT INTO `gy_menupart` VALUES ('0105050201P421', '0105050201', 'lxremail', '4', '联系人邮箱');
INSERT INTO `gy_menupart` VALUES ('0105050201P422', '0105050201', 'lxrzw', '4', '联系人职务');
INSERT INTO `gy_menupart` VALUES ('0105050201P423', '0105050201', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050201P43', '0105050201', 'jssjrxm', '4', '接收试卷人姓名');
INSERT INTO `gy_menupart` VALUES ('0105050201P44', '0105050201', 'sjjsrdh', '4', '试卷接收人电话');
INSERT INTO `gy_menupart` VALUES ('0105050201P45', '0105050201', 'yzbm', '4', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105050201P46', '0105050201', 'bmddm', '4', '报名点代码');
INSERT INTO `gy_menupart` VALUES ('0105050201P47', '0105050201', 'bmdmc', '4', '报名点名称');
INSERT INTO `gy_menupart` VALUES ('0105050201P48', '0105050201', 'szssm', '4', '所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105050201P49', '0105050201', 'csmc', '4', '省市名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P11', '0105050202', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105050202P12', '0105050202', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105050202P13', '0105050202', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105050202P14', '0105050202', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105050202P15', '0105050202', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105050202P21', '0105050202', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050202P210', '0105050202', 'sftm', '2', '是否有推免');
INSERT INTO `gy_menupart` VALUES ('0105050202P211', '0105050202', 'sfdk', '2', '是否有单考');
INSERT INTO `gy_menupart` VALUES ('0105050202P212', '0105050202', 'zgbmm', '2', '主管部门码');
INSERT INTO `gy_menupart` VALUES ('0105050202P213', '0105050202', 'zgbm', '2', '主管部门名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P214', '0105050202', 'xzlbm', '2', '学校性质类别代码');
INSERT INTO `gy_menupart` VALUES ('0105050202P215', '0105050202', 'xzlb', '2', '学校性质类别名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P216', '0105050202', 'cclbm', '2', '层次类别码');
INSERT INTO `gy_menupart` VALUES ('0105050202P217', '0105050202', 'cclb', '2', '层次类别名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P218', '0105050202', 'szssm', '2', '所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105050202P219', '0105050202', 'szss', '2', '所在省市名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P22', '0105050202', 'dwdm', '2', '单位代码');
INSERT INTO `gy_menupart` VALUES ('0105050202P220', '0105050202', 'lxdh', '2', '联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050202P221', '0105050202', 'lxbm', '2', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050202P222', '0105050202', 'dwdz', '2', '单位地址');
INSERT INTO `gy_menupart` VALUES ('0105050202P223', '0105050202', 'yzbm', '2', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105050202P224', '0105050202', 'jytxdz', '2', '寄邮通讯地址');
INSERT INTO `gy_menupart` VALUES ('0105050202P225', '0105050202', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050202P226', '0105050202', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050202P23', '0105050202', 'dwmc', '2', '单位名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P24', '0105050202', 'ydwmc', '2', '原单位名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P25', '0105050202', 'sfss', '2', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('0105050202P26', '0105050202', 'sfbs', '2', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('0105050202P27', '0105050202', 'sf211', '2', '是否211院校');
INSERT INTO `gy_menupart` VALUES ('0105050202P28', '0105050202', 'sfyjsy', '2', '是否设研究生院');
INSERT INTO `gy_menupart` VALUES ('0105050202P29', '0105050202', 'sfmba', '2', '是否招生MBA');
INSERT INTO `gy_menupart` VALUES ('0105050202P41', '0105050202', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050202P410', '0105050202', 'sftm', '4', '是否有推免');
INSERT INTO `gy_menupart` VALUES ('0105050202P411', '0105050202', 'sfdk', '4', '是否有单考');
INSERT INTO `gy_menupart` VALUES ('0105050202P412', '0105050202', 'zgbmm', '4', '主管部门码');
INSERT INTO `gy_menupart` VALUES ('0105050202P413', '0105050202', 'zgbm', '4', '主管部门名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P414', '0105050202', 'xzlbm', '4', '学校性质类别代码');
INSERT INTO `gy_menupart` VALUES ('0105050202P415', '0105050202', 'xzlb', '4', '学校性质类别名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P416', '0105050202', 'cclbm', '4', '层次类别码');
INSERT INTO `gy_menupart` VALUES ('0105050202P417', '0105050202', 'cclb', '4', '层次类别名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P418', '0105050202', 'szssm', '4', '所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105050202P419', '0105050202', 'szss', '4', '所在省市名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P42', '0105050202', 'dwdm', '4', '单位代码');
INSERT INTO `gy_menupart` VALUES ('0105050202P420', '0105050202', 'lxdh', '4', '联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050202P421', '0105050202', 'lxbm', '4', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050202P422', '0105050202', 'dwdz', '4', '单位地址');
INSERT INTO `gy_menupart` VALUES ('0105050202P423', '0105050202', 'yzbm', '4', '邮政编码');
INSERT INTO `gy_menupart` VALUES ('0105050202P424', '0105050202', 'jytxdz', '4', '寄邮通讯地址');
INSERT INTO `gy_menupart` VALUES ('0105050202P425', '0105050202', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050202P426', '0105050202', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050202P43', '0105050202', 'dwmc', '4', '单位名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P44', '0105050202', 'ydwmc', '4', '原单位名称');
INSERT INTO `gy_menupart` VALUES ('0105050202P45', '0105050202', 'sfss', '4', '是否硕士点');
INSERT INTO `gy_menupart` VALUES ('0105050202P46', '0105050202', 'sfbs', '4', '是否博士点');
INSERT INTO `gy_menupart` VALUES ('0105050202P47', '0105050202', 'sf211', '4', '是否211院校');
INSERT INTO `gy_menupart` VALUES ('0105050202P48', '0105050202', 'sfyjsy', '4', '是否设研究生院');
INSERT INTO `gy_menupart` VALUES ('0105050202P49', '0105050202', 'sfmba', '4', '是否招生MBA');
INSERT INTO `gy_menupart` VALUES ('0105050203P11', '0105050203', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105050203P12', '0105050203', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105050203P13', '0105050203', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105050203P14', '0105050203', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105050203P15', '0105050203', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105050203P210', '0105050203', 'dzxx', '2', 'email地址(电子信箱)');
INSERT INTO `gy_menupart` VALUES ('0105050203P211', '0105050203', 'zgyz', '2', '主管院长姓名');
INSERT INTO `gy_menupart` VALUES ('0105050203P212', '0105050203', 'yzlxdh', '2', '主管院长联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050203P213', '0105050203', 'yxsm', '2', '院系所码：3位');
INSERT INTO `gy_menupart` VALUES ('0105050203P214', '0105050203', 'yxsmc', '2', '院系所名称');
INSERT INTO `gy_menupart` VALUES ('0105050203P215', '0105050203', 'sftj', '2', '院系是否提交招生专业目录：是，否');
INSERT INTO `gy_menupart` VALUES ('0105050203P216', '0105050203', 'tjrq', '2', '院系提交招生专业目录日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P217', '0105050203', 'shjg', '2', '研院审核招生专业目录结果：通过，不通过，未审核');
INSERT INTO `gy_menupart` VALUES ('0105050203P218', '0105050203', 'shyj', '2', '研院审核招生专业目录意见：指修改建议');
INSERT INTO `gy_menupart` VALUES ('0105050203P219', '0105050203', 'shrq', '2', '研院审核招生专业目录日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P22', '0105050203', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050203P220', '0105050203', 'shr', '2', '研院招生专业目录审核人：USERID+UserCode+姓名，以\",\"隔开');
INSERT INTO `gy_menupart` VALUES ('0105050203P221', '0105050203', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P23', '0105050203', 'zslb', '2', '招生类别：硕士| 博士| 港澳台硕士| 港澳台博士');
INSERT INTO `gy_menupart` VALUES ('0105050203P24', '0105050203', 'lxbm', '2', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050203P25', '0105050203', 'txdz', '2', '通讯地址');
INSERT INTO `gy_menupart` VALUES ('0105050203P26', '0105050203', 'yb', '2', '邮编');
INSERT INTO `gy_menupart` VALUES ('0105050203P27', '0105050203', 'lxr', '2', '联系人');
INSERT INTO `gy_menupart` VALUES ('0105050203P28', '0105050203', 'lxdh', '2', '联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050203P29', '0105050203', 'cz', '2', '传真');
INSERT INTO `gy_menupart` VALUES ('0105050203P410', '0105050203', 'dzxx', '4', 'email地址(电子信箱)');
INSERT INTO `gy_menupart` VALUES ('0105050203P411', '0105050203', 'zgyz', '4', '主管院长姓名');
INSERT INTO `gy_menupart` VALUES ('0105050203P412', '0105050203', 'yzlxdh', '4', '主管院长联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050203P413', '0105050203', 'yxsm', '4', '院系所码：3位');
INSERT INTO `gy_menupart` VALUES ('0105050203P414', '0105050203', 'yxsmc', '4', '院系所名称');
INSERT INTO `gy_menupart` VALUES ('0105050203P415', '0105050203', 'sftj', '4', '院系是否提交招生专业目录：是，否');
INSERT INTO `gy_menupart` VALUES ('0105050203P416', '0105050203', 'tjrq', '4', '院系提交招生专业目录日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P417', '0105050203', 'shjg', '4', '研院审核招生专业目录结果：通过，不通过，未审核');
INSERT INTO `gy_menupart` VALUES ('0105050203P418', '0105050203', 'shyj', '4', '研院审核招生专业目录意见：指修改建议');
INSERT INTO `gy_menupart` VALUES ('0105050203P419', '0105050203', 'shrq', '4', '研院审核招生专业目录日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P42', '0105050203', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050203P420', '0105050203', 'shr', '4', '研院招生专业目录审核人：USERID+UserCode+姓名，以\",\"隔开');
INSERT INTO `gy_menupart` VALUES ('0105050203P421', '0105050203', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050203P43', '0105050203', 'zslb', '4', '招生类别：硕士| 博士| 港澳台硕士| 港澳台博士');
INSERT INTO `gy_menupart` VALUES ('0105050203P44', '0105050203', 'lxbm', '4', '联系部门');
INSERT INTO `gy_menupart` VALUES ('0105050203P45', '0105050203', 'txdz', '4', '通讯地址');
INSERT INTO `gy_menupart` VALUES ('0105050203P46', '0105050203', 'yb', '4', '邮编');
INSERT INTO `gy_menupart` VALUES ('0105050203P47', '0105050203', 'lxr', '4', '联系人');
INSERT INTO `gy_menupart` VALUES ('0105050203P48', '0105050203', 'lxdh', '4', '联系电话');
INSERT INTO `gy_menupart` VALUES ('0105050203P49', '0105050203', 'cz', '4', '传真');
INSERT INTO `gy_menupart` VALUES ('0105050204P11', '0105050204', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105050204P12', '0105050204', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105050204P13', '0105050204', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105050204P14', '0105050204', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105050204P15', '0105050204', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105050204P21', '0105050204', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050204P210', '0105050204', 'cksm', '2', '参考书目');
INSERT INTO `gy_menupart` VALUES ('0105050204P211', '0105050204', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050204P212', '0105050204', 'sftj', '2', '是否提交');
INSERT INTO `gy_menupart` VALUES ('0105050204P213', '0105050204', 'sftgsh', '2', '是否通过审核');
INSERT INTO `gy_menupart` VALUES ('0105050204P214', '0105050204', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050204P22', '0105050204', 'zslb', '2', '招生类别：硕士| 博士| 港澳台硕士| 港澳台博士');
INSERT INTO `gy_menupart` VALUES ('0105050204P23', '0105050204', 'kmxz', '2', '科目性质：统考|联考|单考|自命题|');
INSERT INTO `gy_menupart` VALUES ('0105050204P25', '0105050204', 'kmlb', '2', '科目类别：自定义代码，存名称。政治理论|外国语|业务课一|业务课二|复试专业课');
INSERT INTO `gy_menupart` VALUES ('0105050204P26', '0105050204', 'ksdy', '2', '考试单元序号');
INSERT INTO `gy_menupart` VALUES ('0105050204P27', '0105050204', 'lskmdm', '2', '临时科目码');
INSERT INTO `gy_menupart` VALUES ('0105050204P28', '0105050204', 'kmdm', '2', '正式科目码');
INSERT INTO `gy_menupart` VALUES ('0105050204P29', '0105050204', 'kmmc', '2', '科目名称');
INSERT INTO `gy_menupart` VALUES ('0105050204P41', '0105050204', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('0105050204P410', '0105050204', 'cksm', '4', '参考书目');
INSERT INTO `gy_menupart` VALUES ('0105050204P411', '0105050204', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('0105050204P412', '0105050204', 'sftj', '4', '是否提交');
INSERT INTO `gy_menupart` VALUES ('0105050204P413', '0105050204', 'sftgsh', '4', '是否通过审核');
INSERT INTO `gy_menupart` VALUES ('0105050204P414', '0105050204', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105050204P42', '0105050204', 'zslb', '4', '招生类别：硕士| 博士| 港澳台硕士| 港澳台博士');
INSERT INTO `gy_menupart` VALUES ('0105050204P43', '0105050204', 'kmxz', '4', '科目性质：统考|联考|单考|自命题|');
INSERT INTO `gy_menupart` VALUES ('0105050204P45', '0105050204', 'kmlb', '4', '科目类别：自定义代码，存名称。政治理论|外国语|业务课一|业务课二|复试专业课');
INSERT INTO `gy_menupart` VALUES ('0105050204P46', '0105050204', 'ksdy', '4', '考试单元序号');
INSERT INTO `gy_menupart` VALUES ('0105050204P47', '0105050204', 'lskmdm', '4', '临时科目码');
INSERT INTO `gy_menupart` VALUES ('0105050204P48', '0105050204', 'kmdm', '4', '正式科目码');
INSERT INTO `gy_menupart` VALUES ('0105050204P49', '0105050204', 'kmmc', '4', '科目名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P11', '010505020702', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('010505020702P12', '010505020702', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('010505020702P13', '010505020702', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('010505020702P14', '010505020702', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('010505020702P15', '010505020702', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('010505020702P21', '010505020702', 'nd', '2', '年度');
INSERT INTO `gy_menupart` VALUES ('010505020702P210', '010505020702', 'zjhm', '2', '证件号码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2100', '010505020702', 'ywk2m', '2', '业务课二码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2101', '010505020702', 'ywk2mc', '2', '业务课二名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2102', '010505020702', 'ywk2ks', '2', '业务课二考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2103', '010505020702', 'ywk2kc', '2', '业务课二考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P2104', '010505020702', 'ywk2stbh', '2', '业务课二试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P2105', '010505020702', 'ywk2cj', '2', '业务课二成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P2106', '010505020702', 'zf', '2', '总分');
INSERT INTO `gy_menupart` VALUES ('010505020702P2107', '010505020702', 'zfpm', '2', '总分排名');
INSERT INTO `gy_menupart` VALUES ('010505020702P2108', '010505020702', 'byxx', '2', '备用信息');
INSERT INTO `gy_menupart` VALUES ('010505020702P2109', '010505020702', 'byxx1', '2', '备用信息1');
INSERT INTO `gy_menupart` VALUES ('010505020702P211', '010505020702', 'csrq', '2', '出生日期(YYYY-MM-DD)');
INSERT INTO `gy_menupart` VALUES ('010505020702P2110', '010505020702', 'bkdsm', '2', '报考点说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P2111', '010505020702', 'zsdwsm', '2', '招生单位说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P2112', '010505020702', 'byxx2', '2', '备用信息2');
INSERT INTO `gy_menupart` VALUES ('010505020702P2113', '010505020702', 'kzyxx', '2', '跨专业信息');
INSERT INTO `gy_menupart` VALUES ('010505020702P2114', '010505020702', 'jfbz', '2', '交费标志');
INSERT INTO `gy_menupart` VALUES ('010505020702P2115', '010505020702', 'zxbz', '2', '照相标志');
INSERT INTO `gy_menupart` VALUES ('010505020702P2116', '010505020702', 'bmsj', '2', '报名时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2117', '010505020702', 'xgsj', '2', '修改时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2118', '010505020702', 'qrsj', '2', '确认时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2119', '010505020702', 'byxx3', '2', '备用信息3');
INSERT INTO `gy_menupart` VALUES ('010505020702P212', '010505020702', 'mzm', '2', '民族码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2120', '010505020702', 'byxx4', '2', '备用信息四');
INSERT INTO `gy_menupart` VALUES ('010505020702P2121', '010505020702', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010505020702P2122', '010505020702', 'tjdwdm', '2', '第二志愿单位代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2123', '010505020702', 'tjdw', '2', '第二志愿单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P2124', '010505020702', 'bkzp', '2', '报考照片');
INSERT INTO `gy_menupart` VALUES ('010505020702P2125', '010505020702', 'sfsx', '2', '是否上线');
INSERT INTO `gy_menupart` VALUES ('010505020702P2126', '010505020702', 'tjlx', '2', '调剂类型（存:校内调剂/由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P2127', '010505020702', 'tjzt', '2', '调剂状态（存:可调剂/已调剂）');
INSERT INTO `gy_menupart` VALUES ('010505020702P2128', '010505020702', 'sqtjdwdm', '2', '申请调入前或调往学校代码（针对：由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P2129', '010505020702', 'sqtjdw', '2', '申请调入前或调往学校名称（针对：由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P213', '010505020702', 'mz', '2', '民族');
INSERT INTO `gy_menupart` VALUES ('010505020702P2130', '010505020702', 'tjr', '2', '调剂人');
INSERT INTO `gy_menupart` VALUES ('010505020702P2131', '010505020702', 'tjsj', '2', '调剂时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2132', '010505020702', 'sffs', '2', '是否复试');
INSERT INTO `gy_menupart` VALUES ('010505020702P2133', '010505020702', 'sfsqpg', '2', '是否申请破格复试');
INSERT INTO `gy_menupart` VALUES ('010505020702P2134', '010505020702', 'sqpgyy', '2', '申请破格复试原因');
INSERT INTO `gy_menupart` VALUES ('010505020702P2135', '010505020702', 'sqpgzt', '2', '申请破格复试状态（存：申请破格/待院系提交/待研院审批/同意）');
INSERT INTO `gy_menupart` VALUES ('010505020702P2136', '010505020702', 'fsyxsm', '2', '复试院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2137', '010505020702', 'fsyxs', '2', '复试院系所名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2138', '010505020702', 'fszydm', '2', '复试专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2139', '010505020702', 'fszy', '2', '复试专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P214', '010505020702', 'xbm', '2', '性别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2140', '010505020702', 'fsyjfxm', '2', '复试研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2141', '010505020702', 'fsyjfx', '2', '复试研究方向名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2142', '010505020702', 'fsbdsj', '2', '复试报到时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2143', '010505020702', 'fsbddd', '2', '复试报到地点');
INSERT INTO `gy_menupart` VALUES ('010505020702P2144', '010505020702', 'fssj', '2', '复试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2145', '010505020702', 'fsnr', '2', '复试内容');
INSERT INTO `gy_menupart` VALUES ('010505020702P2146', '010505020702', 'fsapzt', '2', '复试安排状态（存：待院系提交/院系已提交）');
INSERT INTO `gy_menupart` VALUES ('010505020702P2147', '010505020702', 'fsaptjsj', '2', '提交复试安排时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2148', '010505020702', 'fszgsc', '2', '资格审查结果（存：院系审批通过|院系审批不通过');
INSERT INTO `gy_menupart` VALUES ('010505020702P2149', '010505020702', 'fsbscj', '2', '复试笔试成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P215', '010505020702', 'xb', '2', '性别');
INSERT INTO `gy_menupart` VALUES ('010505020702P2150', '010505020702', 'fsmscj', '2', '复试面试成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P2151', '010505020702', 'fszcj', '2', '复试总成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P2152', '010505020702', 'fsjskm1', '2', '加试科目1名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2153', '010505020702', 'fsjskm1cj', '2', '加试科目1成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P2154', '010505020702', 'fsjskm2', '2', '加试科目2名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2155', '010505020702', 'fsjskm2cj', '2', '加试科目2成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P2156', '010505020702', 'nlqyj', '2', '拟录取意见：录取|候补|不录取');
INSERT INTO `gy_menupart` VALUES ('010505020702P2157', '010505020702', 'nlqyxsm', '2', '拟录取院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2158', '010505020702', 'nlqyxs', '2', '拟录取院系所名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2159', '010505020702', 'nlqzydm', '2', '拟录取专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P216', '010505020702', 'hfm', '2', '婚姻状况码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2160', '010505020702', 'nlqzy', '2', '拟录取专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2161', '010505020702', 'nlqyjfxm', '2', '拟录取研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2162', '010505020702', 'nlqyjfx', '2', '拟录取研究方向名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2163', '010505020702', 'nlqdsid', '2', '拟录取导师ID');
INSERT INTO `gy_menupart` VALUES ('010505020702P2164', '010505020702', 'nlqdsbh', '2', '拟录取导师编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P2165', '010505020702', 'nlqdsxm', '2', '拟录取导师姓名');
INSERT INTO `gy_menupart` VALUES ('010505020702P2166', '010505020702', 'nlqpylx', '2', '拟录取培养类型：临床型|科研型');
INSERT INTO `gy_menupart` VALUES ('010505020702P2167', '010505020702', 'nlqpylbm', '2', '拟录取类别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2168', '010505020702', 'nlqpylb', '2', '拟录取类别');
INSERT INTO `gy_menupart` VALUES ('010505020702P2169', '010505020702', 'nlqsfzz', '2', '是否在职：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P217', '010505020702', 'hf', '2', '婚姻状况');
INSERT INTO `gy_menupart` VALUES ('010505020702P2170', '010505020702', 'nlqsfqrz', '2', '是否全日制：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P2171', '010505020702', 'nlqxq', '2', '校区');
INSERT INTO `gy_menupart` VALUES ('010505020702P2172', '010505020702', 'nlqhjzlx', '2', '获奖助类型');
INSERT INTO `gy_menupart` VALUES ('010505020702P2173', '010505020702', 'nlqtjjg', '2', '体检结果');
INSERT INTO `gy_menupart` VALUES ('010505020702P2174', '010505020702', 'nlqtjjl', '2', '体检结论');
INSERT INTO `gy_menupart` VALUES ('010505020702P2175', '010505020702', 'nlqdxwpdw', '2', '拟录取委培或定向单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P2176', '010505020702', 'nlqdxwpdwszssm', '2', '拟录取委培或定向单位所在省市码，国标dm_code前两位');
INSERT INTO `gy_menupart` VALUES ('010505020702P2177', '010505020702', 'nlqdxwpdwszss', '2', '拟录取委培或定向单位所在省市，存名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P2178', '010505020702', 'nlqtjbz', '2', '是否提交拟录取结果：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P2179', '010505020702', 'nlqzscl', '2', '政审材料是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P218', '010505020702', 'xyjrm', '2', '现役军人码');
INSERT INTO `gy_menupart` VALUES ('010505020702P2180', '010505020702', 'nlqrsda', '2', '人事档案是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P2181', '010505020702', 'nlqhts', '2', '合同书是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P2182', '010505020702', 'nlqzsjg', '2', '政审结果：通过|不通过');
INSERT INTO `gy_menupart` VALUES ('010505020702P2183', '010505020702', 'nlqzsjgbz', '2', '政审结果说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P2184', '010505020702', 'nlqblrxzgnx', '2', '保留入学资格年限');
INSERT INTO `gy_menupart` VALUES ('010505020702P2185', '010505020702', 'nlqblrxzgdqsj', '2', '保留入学资格到期时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P2186', '010505020702', 'nlqxszgzc', '2', '享受照顾政策');
INSERT INTO `gy_menupart` VALUES ('010505020702P2187', '010505020702', 'xh', '2', '硕士学号');
INSERT INTO `gy_menupart` VALUES ('010505020702P2188', '010505020702', 'xz', '2', '学制');
INSERT INTO `gy_menupart` VALUES ('010505020702P219', '010505020702', 'xyjr', '2', '现役军人');
INSERT INTO `gy_menupart` VALUES ('010505020702P22', '010505020702', 'bmddm', '2', '报名点代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P220', '010505020702', 'zzmmm', '2', '政治面貌码');
INSERT INTO `gy_menupart` VALUES ('010505020702P221', '010505020702', 'zzmm', '2', '政治面貌');
INSERT INTO `gy_menupart` VALUES ('010505020702P222', '010505020702', 'jgszdm', '2', '籍贯所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P223', '010505020702', 'jgszd', '2', '籍贯所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P224', '010505020702', 'csdm', '2', '出生地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P225', '010505020702', 'csd', '2', '出生地');
INSERT INTO `gy_menupart` VALUES ('010505020702P226', '010505020702', 'hkszdm', '2', '户口所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P227', '010505020702', 'hkszd', '2', '户口所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P228', '010505020702', 'hkszdxxdz', '2', '户口所在地详细地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P229', '010505020702', 'daszdm', '2', '考生档案所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P23', '010505020702', 'bmd', '2', '报名点');
INSERT INTO `gy_menupart` VALUES ('010505020702P230', '010505020702', 'daszd', '2', '考生档案所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P231', '010505020702', 'daszdw', '2', '考生档案所在单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P232', '010505020702', 'daszdwdz', '2', '考生档案所在单位地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P233', '010505020702', 'daszdwyzbm', '2', '考生档案所在单位邮政编码');
INSERT INTO `gy_menupart` VALUES ('010505020702P234', '010505020702', 'xxgzdw', '2', '现在学习或工作单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P235', '010505020702', 'xxgzjl', '2', '学习与工作经历');
INSERT INTO `gy_menupart` VALUES ('010505020702P236', '010505020702', 'jlcf', '2', '何时何地何原因受过何种奖励或处分');
INSERT INTO `gy_menupart` VALUES ('010505020702P237', '010505020702', 'kszbqk', '2', '考生作弊情况');
INSERT INTO `gy_menupart` VALUES ('010505020702P238', '010505020702', 'jtcy', '2', '家庭主要成员');
INSERT INTO `gy_menupart` VALUES ('010505020702P239', '010505020702', 'txdz', '2', '考生通讯地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P24', '010505020702', 'bmh', '2', '考生报名号');
INSERT INTO `gy_menupart` VALUES ('010505020702P240', '010505020702', 'yzbm', '2', '考生通讯地址邮政编码');
INSERT INTO `gy_menupart` VALUES ('010505020702P241', '010505020702', 'lxdh', '2', '固定电话');
INSERT INTO `gy_menupart` VALUES ('010505020702P242', '010505020702', 'yddh', '2', '移动电话');
INSERT INTO `gy_menupart` VALUES ('010505020702P243', '010505020702', 'dzxx', '2', '电子信箱');
INSERT INTO `gy_menupart` VALUES ('010505020702P244', '010505020702', 'kslym', '2', '考生来源码');
INSERT INTO `gy_menupart` VALUES ('010505020702P245', '010505020702', 'ksly', '2', '考生来源');
INSERT INTO `gy_menupart` VALUES ('010505020702P246', '010505020702', 'bydwssm', '2', '毕业学校所在省市代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P247', '010505020702', 'bydwss', '2', '毕业学校所在省市');
INSERT INTO `gy_menupart` VALUES ('010505020702P248', '010505020702', 'bydwm', '2', '毕业学校代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P249', '010505020702', 'bydw', '2', '毕业学校名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P25', '010505020702', 'xm', '2', '考生姓名');
INSERT INTO `gy_menupart` VALUES ('010505020702P250', '010505020702', 'byzydm', '2', '毕业专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P251', '010505020702', 'byzymc', '2', '毕业专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P252', '010505020702', 'xxxsm', '2', '取得最后学历的学习形式码');
INSERT INTO `gy_menupart` VALUES ('010505020702P253', '010505020702', 'xxxs', '2', '取得最后学历的学习形式');
INSERT INTO `gy_menupart` VALUES ('010505020702P254', '010505020702', 'xlm', '2', '最后学历码');
INSERT INTO `gy_menupart` VALUES ('010505020702P255', '010505020702', 'xl', '2', '最后学历');
INSERT INTO `gy_menupart` VALUES ('010505020702P256', '010505020702', 'xlzsbh', '2', '毕业证书编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P257', '010505020702', 'byny', '2', '获得最后学历毕业年月');
INSERT INTO `gy_menupart` VALUES ('010505020702P258', '010505020702', 'zcxh', '2', '注册学号');
INSERT INTO `gy_menupart` VALUES ('010505020702P259', '010505020702', 'xwm', '2', '最后学位码');
INSERT INTO `gy_menupart` VALUES ('010505020702P26', '010505020702', 'xmpy', '2', '考生姓名拼音');
INSERT INTO `gy_menupart` VALUES ('010505020702P260', '010505020702', 'xw', '2', '最后学位');
INSERT INTO `gy_menupart` VALUES ('010505020702P261', '010505020702', 'xwzsbh', '2', '学位证书编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P262', '010505020702', 'bkdwszssm', '2', '报考单位所在省市码');
INSERT INTO `gy_menupart` VALUES ('010505020702P263', '010505020702', 'bkdwszss', '2', '报考单位所在省市');
INSERT INTO `gy_menupart` VALUES ('010505020702P264', '010505020702', 'bkdwdm', '2', '报考单位代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P265', '010505020702', 'bkdw', '2', '报考单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P266', '010505020702', 'bkzydm', '2', '报考专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P267', '010505020702', 'bkzy', '2', '报考专业');
INSERT INTO `gy_menupart` VALUES ('010505020702P268', '010505020702', 'ksfsm', '2', '考试方式码');
INSERT INTO `gy_menupart` VALUES ('010505020702P269', '010505020702', 'ksfs', '2', '考试方式');
INSERT INTO `gy_menupart` VALUES ('010505020702P27', '010505020702', 'ksbh', '2', '考生编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P270', '010505020702', 'zxjhm', '2', '专项计划码');
INSERT INTO `gy_menupart` VALUES ('010505020702P271', '010505020702', 'zxjh', '2', '专项计划');
INSERT INTO `gy_menupart` VALUES ('010505020702P272', '010505020702', 'bklbm', '2', '报考类别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P273', '010505020702', 'bklb', '2', '报考类别');
INSERT INTO `gy_menupart` VALUES ('010505020702P274', '010505020702', 'dxwpdwszdm', '2', '定向就业单位所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P275', '010505020702', 'dxwpdwszd', '2', '定向就业单位所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P276', '010505020702', 'dxwpdw', '2', '定向就业单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P277', '010505020702', 'bkyxsm', '2', '报考院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P278', '010505020702', 'bkyxs', '2', '报考院系所');
INSERT INTO `gy_menupart` VALUES ('010505020702P279', '010505020702', 'bkyjfxm', '2', '研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P28', '010505020702', 'zjlxdm', '2', '证件类型代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P280', '010505020702', 'bkyjfx', '2', '研究方向');
INSERT INTO `gy_menupart` VALUES ('010505020702P281', '010505020702', 'sfzk', '2', '是否准考');
INSERT INTO `gy_menupart` VALUES ('010505020702P282', '010505020702', 'zzllm', '2', '政治理论码');
INSERT INTO `gy_menupart` VALUES ('010505020702P283', '010505020702', 'zzllmc', '2', '政治理论名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P284', '010505020702', 'zzllks', '2', '政治理论考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P285', '010505020702', 'zzllkc', '2', '政治理论考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P286', '010505020702', 'zzllstbh', '2', '政治理论试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P287', '010505020702', 'zzllcj', '2', '政治理论成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P288', '010505020702', 'wgym', '2', '外国语码');
INSERT INTO `gy_menupart` VALUES ('010505020702P289', '010505020702', 'wgymc', '2', '外国语名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P29', '010505020702', 'zjlx', '2', '证件类型');
INSERT INTO `gy_menupart` VALUES ('010505020702P290', '010505020702', 'wgyks', '2', '外国语考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P291', '010505020702', 'wgykc', '2', '外国语考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P292', '010505020702', 'wgystbh', '2', '外国语试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P293', '010505020702', 'wgycj', '2', '外国语成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P294', '010505020702', 'ywk1m', '2', '业务课一码');
INSERT INTO `gy_menupart` VALUES ('010505020702P295', '010505020702', 'ywk1mc', '2', '业务课一名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P296', '010505020702', 'ywk1ks', '2', '业务课一考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P297', '010505020702', 'ywk1kc', '2', '');
INSERT INTO `gy_menupart` VALUES ('010505020702P298', '010505020702', 'ywk1stbh', '2', '业务课一试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P299', '010505020702', 'ywk1cj', '2', '业务课一成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P41', '010505020702', 'nd', '4', '年度');
INSERT INTO `gy_menupart` VALUES ('010505020702P410', '010505020702', 'zjhm', '4', '证件号码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4100', '010505020702', 'ywk2m', '4', '业务课二码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4101', '010505020702', 'ywk2mc', '4', '业务课二名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4102', '010505020702', 'ywk2ks', '4', '业务课二考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4103', '010505020702', 'ywk2kc', '4', '业务课二考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P4104', '010505020702', 'ywk2stbh', '4', '业务课二试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P4105', '010505020702', 'ywk2cj', '4', '业务课二成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P4106', '010505020702', 'zf', '4', '总分');
INSERT INTO `gy_menupart` VALUES ('010505020702P4107', '010505020702', 'zfpm', '4', '总分排名');
INSERT INTO `gy_menupart` VALUES ('010505020702P4108', '010505020702', 'byxx', '4', '备用信息');
INSERT INTO `gy_menupart` VALUES ('010505020702P4109', '010505020702', 'byxx1', '4', '备用信息1');
INSERT INTO `gy_menupart` VALUES ('010505020702P411', '010505020702', 'csrq', '4', '出生日期(YYYY-MM-DD)');
INSERT INTO `gy_menupart` VALUES ('010505020702P4110', '010505020702', 'bkdsm', '4', '报考点说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P4111', '010505020702', 'zsdwsm', '4', '招生单位说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P4112', '010505020702', 'byxx2', '4', '备用信息2');
INSERT INTO `gy_menupart` VALUES ('010505020702P4113', '010505020702', 'kzyxx', '4', '跨专业信息');
INSERT INTO `gy_menupart` VALUES ('010505020702P4114', '010505020702', 'jfbz', '4', '交费标志');
INSERT INTO `gy_menupart` VALUES ('010505020702P4115', '010505020702', 'zxbz', '4', '照相标志');
INSERT INTO `gy_menupart` VALUES ('010505020702P4116', '010505020702', 'bmsj', '4', '报名时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4117', '010505020702', 'xgsj', '4', '修改时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4118', '010505020702', 'qrsj', '4', '确认时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4119', '010505020702', 'byxx3', '4', '备用信息3');
INSERT INTO `gy_menupart` VALUES ('010505020702P412', '010505020702', 'mzm', '4', '民族码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4120', '010505020702', 'byxx4', '4', '备用信息四');
INSERT INTO `gy_menupart` VALUES ('010505020702P4121', '010505020702', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010505020702P4122', '010505020702', 'tjdwdm', '4', '第二志愿单位代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4123', '010505020702', 'tjdw', '4', '第二志愿单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P4124', '010505020702', 'bkzp', '4', '报考照片');
INSERT INTO `gy_menupart` VALUES ('010505020702P4125', '010505020702', 'sfsx', '4', '是否上线');
INSERT INTO `gy_menupart` VALUES ('010505020702P4126', '010505020702', 'tjlx', '4', '调剂类型（存:校内调剂/由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P4127', '010505020702', 'tjzt', '4', '调剂状态（存:可调剂/已调剂）');
INSERT INTO `gy_menupart` VALUES ('010505020702P4128', '010505020702', 'sqtjdwdm', '4', '申请调入前或调往学校代码（针对：由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P4129', '010505020702', 'sqtjdw', '4', '申请调入前或调往学校名称（针对：由校外调入/由校内调出）');
INSERT INTO `gy_menupart` VALUES ('010505020702P413', '010505020702', 'mz', '4', '民族');
INSERT INTO `gy_menupart` VALUES ('010505020702P4130', '010505020702', 'tjr', '4', '调剂人');
INSERT INTO `gy_menupart` VALUES ('010505020702P4131', '010505020702', 'tjsj', '4', '调剂时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4132', '010505020702', 'sffs', '4', '是否复试');
INSERT INTO `gy_menupart` VALUES ('010505020702P4133', '010505020702', 'sfsqpg', '4', '是否申请破格复试');
INSERT INTO `gy_menupart` VALUES ('010505020702P4134', '010505020702', 'sqpgyy', '4', '申请破格复试原因');
INSERT INTO `gy_menupart` VALUES ('010505020702P4135', '010505020702', 'sqpgzt', '4', '申请破格复试状态（存：申请破格/待院系提交/待研院审批/同意）');
INSERT INTO `gy_menupart` VALUES ('010505020702P4136', '010505020702', 'fsyxsm', '4', '复试院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4137', '010505020702', 'fsyxs', '4', '复试院系所名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4138', '010505020702', 'fszydm', '4', '复试专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4139', '010505020702', 'fszy', '4', '复试专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P414', '010505020702', 'xbm', '4', '性别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4140', '010505020702', 'fsyjfxm', '4', '复试研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4141', '010505020702', 'fsyjfx', '4', '复试研究方向名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4142', '010505020702', 'fsbdsj', '4', '复试报到时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4143', '010505020702', 'fsbddd', '4', '复试报到地点');
INSERT INTO `gy_menupart` VALUES ('010505020702P4144', '010505020702', 'fssj', '4', '复试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4145', '010505020702', 'fsnr', '4', '复试内容');
INSERT INTO `gy_menupart` VALUES ('010505020702P4146', '010505020702', 'fsapzt', '4', '复试安排状态（存：待院系提交/院系已提交）');
INSERT INTO `gy_menupart` VALUES ('010505020702P4147', '010505020702', 'fsaptjsj', '4', '提交复试安排时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4148', '010505020702', 'fszgsc', '4', '资格审查结果（存：院系审批通过|院系审批不通过');
INSERT INTO `gy_menupart` VALUES ('010505020702P4149', '010505020702', 'fsbscj', '4', '复试笔试成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P415', '010505020702', 'xb', '4', '性别');
INSERT INTO `gy_menupart` VALUES ('010505020702P4150', '010505020702', 'fsmscj', '4', '复试面试成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P4151', '010505020702', 'fszcj', '4', '复试总成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P4152', '010505020702', 'fsjskm1', '4', '加试科目1名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4153', '010505020702', 'fsjskm1cj', '4', '加试科目1成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P4154', '010505020702', 'fsjskm2', '4', '加试科目2名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4155', '010505020702', 'fsjskm2cj', '4', '加试科目2成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P4156', '010505020702', 'nlqyj', '4', '拟录取意见：录取|候补|不录取');
INSERT INTO `gy_menupart` VALUES ('010505020702P4157', '010505020702', 'nlqyxsm', '4', '拟录取院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4158', '010505020702', 'nlqyxs', '4', '拟录取院系所名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4159', '010505020702', 'nlqzydm', '4', '拟录取专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P416', '010505020702', 'hfm', '4', '婚姻状况码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4160', '010505020702', 'nlqzy', '4', '拟录取专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4161', '010505020702', 'nlqyjfxm', '4', '拟录取研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4162', '010505020702', 'nlqyjfx', '4', '拟录取研究方向名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4163', '010505020702', 'nlqdsid', '4', '拟录取导师ID');
INSERT INTO `gy_menupart` VALUES ('010505020702P4164', '010505020702', 'nlqdsbh', '4', '拟录取导师编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P4165', '010505020702', 'nlqdsxm', '4', '拟录取导师姓名');
INSERT INTO `gy_menupart` VALUES ('010505020702P4166', '010505020702', 'nlqpylx', '4', '拟录取培养类型：临床型|科研型');
INSERT INTO `gy_menupart` VALUES ('010505020702P4167', '010505020702', 'nlqpylbm', '4', '拟录取类别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4168', '010505020702', 'nlqpylb', '4', '拟录取类别');
INSERT INTO `gy_menupart` VALUES ('010505020702P4169', '010505020702', 'nlqsfzz', '4', '是否在职：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P417', '010505020702', 'hf', '4', '婚姻状况');
INSERT INTO `gy_menupart` VALUES ('010505020702P4170', '010505020702', 'nlqsfqrz', '4', '是否全日制：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P4171', '010505020702', 'nlqxq', '4', '校区');
INSERT INTO `gy_menupart` VALUES ('010505020702P4172', '010505020702', 'nlqhjzlx', '4', '获奖助类型');
INSERT INTO `gy_menupart` VALUES ('010505020702P4173', '010505020702', 'nlqtjjg', '4', '体检结果');
INSERT INTO `gy_menupart` VALUES ('010505020702P4174', '010505020702', 'nlqtjjl', '4', '体检结论');
INSERT INTO `gy_menupart` VALUES ('010505020702P4175', '010505020702', 'nlqdxwpdw', '4', '拟录取委培或定向单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P4176', '010505020702', 'nlqdxwpdwszssm', '4', '拟录取委培或定向单位所在省市码，国标dm_code前两位');
INSERT INTO `gy_menupart` VALUES ('010505020702P4177', '010505020702', 'nlqdxwpdwszss', '4', '拟录取委培或定向单位所在省市，存名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P4178', '010505020702', 'nlqtjbz', '4', '是否提交拟录取结果：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P4179', '010505020702', 'nlqzscl', '4', '政审材料是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P418', '010505020702', 'xyjrm', '4', '现役军人码');
INSERT INTO `gy_menupart` VALUES ('010505020702P4180', '010505020702', 'nlqrsda', '4', '人事档案是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P4181', '010505020702', 'nlqhts', '4', '合同书是否齐全：是|否');
INSERT INTO `gy_menupart` VALUES ('010505020702P4182', '010505020702', 'nlqzsjg', '4', '政审结果：通过|不通过');
INSERT INTO `gy_menupart` VALUES ('010505020702P4183', '010505020702', 'nlqzsjgbz', '4', '政审结果说明');
INSERT INTO `gy_menupart` VALUES ('010505020702P4184', '010505020702', 'nlqblrxzgnx', '4', '保留入学资格年限');
INSERT INTO `gy_menupart` VALUES ('010505020702P4185', '010505020702', 'nlqblrxzgdqsj', '4', '保留入学资格到期时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P4186', '010505020702', 'nlqxszgzc', '4', '享受照顾政策');
INSERT INTO `gy_menupart` VALUES ('010505020702P4187', '010505020702', 'xh', '4', '硕士学号');
INSERT INTO `gy_menupart` VALUES ('010505020702P4188', '010505020702', 'xz', '4', '学制');
INSERT INTO `gy_menupart` VALUES ('010505020702P419', '010505020702', 'xyjr', '4', '现役军人');
INSERT INTO `gy_menupart` VALUES ('010505020702P42', '010505020702', 'bmddm', '4', '报名点代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P420', '010505020702', 'zzmmm', '4', '政治面貌码');
INSERT INTO `gy_menupart` VALUES ('010505020702P421', '010505020702', 'zzmm', '4', '政治面貌');
INSERT INTO `gy_menupart` VALUES ('010505020702P422', '010505020702', 'jgszdm', '4', '籍贯所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P423', '010505020702', 'jgszd', '4', '籍贯所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P424', '010505020702', 'csdm', '4', '出生地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P425', '010505020702', 'csd', '4', '出生地');
INSERT INTO `gy_menupart` VALUES ('010505020702P426', '010505020702', 'hkszdm', '4', '户口所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P427', '010505020702', 'hkszd', '4', '户口所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P428', '010505020702', 'hkszdxxdz', '4', '户口所在地详细地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P429', '010505020702', 'daszdm', '4', '考生档案所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P43', '010505020702', 'bmd', '4', '报名点');
INSERT INTO `gy_menupart` VALUES ('010505020702P430', '010505020702', 'daszd', '4', '考生档案所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P431', '010505020702', 'daszdw', '4', '考生档案所在单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P432', '010505020702', 'daszdwdz', '4', '考生档案所在单位地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P433', '010505020702', 'daszdwyzbm', '4', '考生档案所在单位邮政编码');
INSERT INTO `gy_menupart` VALUES ('010505020702P434', '010505020702', 'xxgzdw', '4', '现在学习或工作单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P435', '010505020702', 'xxgzjl', '4', '学习与工作经历');
INSERT INTO `gy_menupart` VALUES ('010505020702P436', '010505020702', 'jlcf', '4', '何时何地何原因受过何种奖励或处分');
INSERT INTO `gy_menupart` VALUES ('010505020702P437', '010505020702', 'kszbqk', '4', '考生作弊情况');
INSERT INTO `gy_menupart` VALUES ('010505020702P438', '010505020702', 'jtcy', '4', '家庭主要成员');
INSERT INTO `gy_menupart` VALUES ('010505020702P439', '010505020702', 'txdz', '4', '考生通讯地址');
INSERT INTO `gy_menupart` VALUES ('010505020702P44', '010505020702', 'bmh', '4', '考生报名号');
INSERT INTO `gy_menupart` VALUES ('010505020702P440', '010505020702', 'yzbm', '4', '考生通讯地址邮政编码');
INSERT INTO `gy_menupart` VALUES ('010505020702P441', '010505020702', 'lxdh', '4', '固定电话');
INSERT INTO `gy_menupart` VALUES ('010505020702P442', '010505020702', 'yddh', '4', '移动电话');
INSERT INTO `gy_menupart` VALUES ('010505020702P443', '010505020702', 'dzxx', '4', '电子信箱');
INSERT INTO `gy_menupart` VALUES ('010505020702P444', '010505020702', 'kslym', '4', '考生来源码');
INSERT INTO `gy_menupart` VALUES ('010505020702P445', '010505020702', 'ksly', '4', '考生来源');
INSERT INTO `gy_menupart` VALUES ('010505020702P446', '010505020702', 'bydwssm', '4', '毕业学校所在省市代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P447', '010505020702', 'bydwss', '4', '毕业学校所在省市');
INSERT INTO `gy_menupart` VALUES ('010505020702P448', '010505020702', 'bydwm', '4', '毕业学校代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P449', '010505020702', 'bydw', '4', '毕业学校名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P45', '010505020702', 'xm', '4', '考生姓名');
INSERT INTO `gy_menupart` VALUES ('010505020702P450', '010505020702', 'byzydm', '4', '毕业专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P451', '010505020702', 'byzymc', '4', '毕业专业名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P452', '010505020702', 'xxxsm', '4', '取得最后学历的学习形式码');
INSERT INTO `gy_menupart` VALUES ('010505020702P453', '010505020702', 'xxxs', '4', '取得最后学历的学习形式');
INSERT INTO `gy_menupart` VALUES ('010505020702P454', '010505020702', 'xlm', '4', '最后学历码');
INSERT INTO `gy_menupart` VALUES ('010505020702P455', '010505020702', 'xl', '4', '最后学历');
INSERT INTO `gy_menupart` VALUES ('010505020702P456', '010505020702', 'xlzsbh', '4', '毕业证书编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P457', '010505020702', 'byny', '4', '获得最后学历毕业年月');
INSERT INTO `gy_menupart` VALUES ('010505020702P458', '010505020702', 'zcxh', '4', '注册学号');
INSERT INTO `gy_menupart` VALUES ('010505020702P459', '010505020702', 'xwm', '4', '最后学位码');
INSERT INTO `gy_menupart` VALUES ('010505020702P46', '010505020702', 'xmpy', '4', '考生姓名拼音');
INSERT INTO `gy_menupart` VALUES ('010505020702P460', '010505020702', 'xw', '4', '最后学位');
INSERT INTO `gy_menupart` VALUES ('010505020702P461', '010505020702', 'xwzsbh', '4', '学位证书编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P462', '010505020702', 'bkdwszssm', '4', '报考单位所在省市码');
INSERT INTO `gy_menupart` VALUES ('010505020702P463', '010505020702', 'bkdwszss', '4', '报考单位所在省市');
INSERT INTO `gy_menupart` VALUES ('010505020702P464', '010505020702', 'bkdwdm', '4', '报考单位代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P465', '010505020702', 'bkdw', '4', '报考单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P466', '010505020702', 'bkzydm', '4', '报考专业代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P467', '010505020702', 'bkzy', '4', '报考专业');
INSERT INTO `gy_menupart` VALUES ('010505020702P468', '010505020702', 'ksfsm', '4', '考试方式码');
INSERT INTO `gy_menupart` VALUES ('010505020702P469', '010505020702', 'ksfs', '4', '考试方式');
INSERT INTO `gy_menupart` VALUES ('010505020702P47', '010505020702', 'ksbh', '4', '考生编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P470', '010505020702', 'zxjhm', '4', '专项计划码');
INSERT INTO `gy_menupart` VALUES ('010505020702P471', '010505020702', 'zxjh', '4', '专项计划');
INSERT INTO `gy_menupart` VALUES ('010505020702P472', '010505020702', 'bklbm', '4', '报考类别码');
INSERT INTO `gy_menupart` VALUES ('010505020702P473', '010505020702', 'bklb', '4', '报考类别');
INSERT INTO `gy_menupart` VALUES ('010505020702P474', '010505020702', 'dxwpdwszdm', '4', '定向就业单位所在地码');
INSERT INTO `gy_menupart` VALUES ('010505020702P475', '010505020702', 'dxwpdwszd', '4', '定向就业单位所在地');
INSERT INTO `gy_menupart` VALUES ('010505020702P476', '010505020702', 'dxwpdw', '4', '定向就业单位');
INSERT INTO `gy_menupart` VALUES ('010505020702P477', '010505020702', 'bkyxsm', '4', '报考院系所码');
INSERT INTO `gy_menupart` VALUES ('010505020702P478', '010505020702', 'bkyxs', '4', '报考院系所');
INSERT INTO `gy_menupart` VALUES ('010505020702P479', '010505020702', 'bkyjfxm', '4', '研究方向码');
INSERT INTO `gy_menupart` VALUES ('010505020702P48', '010505020702', 'zjlxdm', '4', '证件类型代码');
INSERT INTO `gy_menupart` VALUES ('010505020702P480', '010505020702', 'bkyjfx', '4', '研究方向');
INSERT INTO `gy_menupart` VALUES ('010505020702P481', '010505020702', 'sfzk', '4', '是否准考');
INSERT INTO `gy_menupart` VALUES ('010505020702P482', '010505020702', 'zzllm', '4', '政治理论码');
INSERT INTO `gy_menupart` VALUES ('010505020702P483', '010505020702', 'zzllmc', '4', '政治理论名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P484', '010505020702', 'zzllks', '4', '政治理论考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P485', '010505020702', 'zzllkc', '4', '政治理论考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P486', '010505020702', 'zzllstbh', '4', '政治理论试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P487', '010505020702', 'zzllcj', '4', '政治理论成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P488', '010505020702', 'wgym', '4', '外国语码');
INSERT INTO `gy_menupart` VALUES ('010505020702P489', '010505020702', 'wgymc', '4', '外国语名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P49', '010505020702', 'zjlx', '4', '证件类型');
INSERT INTO `gy_menupart` VALUES ('010505020702P490', '010505020702', 'wgyks', '4', '外国语考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P491', '010505020702', 'wgykc', '4', '外国语考场');
INSERT INTO `gy_menupart` VALUES ('010505020702P492', '010505020702', 'wgystbh', '4', '外国语试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P493', '010505020702', 'wgycj', '4', '外国语成绩');
INSERT INTO `gy_menupart` VALUES ('010505020702P494', '010505020702', 'ywk1m', '4', '业务课一码');
INSERT INTO `gy_menupart` VALUES ('010505020702P495', '010505020702', 'ywk1mc', '4', '业务课一名称');
INSERT INTO `gy_menupart` VALUES ('010505020702P496', '010505020702', 'ywk1ks', '4', '业务课一考试时间');
INSERT INTO `gy_menupart` VALUES ('010505020702P497', '010505020702', 'ywk1kc', '4', '');
INSERT INTO `gy_menupart` VALUES ('010505020702P498', '010505020702', 'ywk1stbh', '4', '业务课一试题编号');
INSERT INTO `gy_menupart` VALUES ('010505020702P499', '010505020702', 'ywk1cj', '4', '业务课一成绩');
INSERT INTO `gy_menupart` VALUES ('0105060111', '01050601', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105060112', '01050601', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105060113', '01050601', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105060114', '01050601', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105060115', '01050601', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105060121', '01050601', 'feeitemcode', '2', '缴费代码');
INSERT INTO `gy_menupart` VALUES ('01050601210', '01050601', 'userroles', '2', '缴费用户角色');
INSERT INTO `gy_menupart` VALUES ('01050601211', '01050601', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060122', '01050601', 'feeitemname', '2', '缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060123', '01050601', 'feetimebegin', '2', '缴费开始时间');
INSERT INTO `gy_menupart` VALUES ('0105060124', '01050601', 'feetimeend', '2', '缴费截止时间');
INSERT INTO `gy_menupart` VALUES ('0105060125', '01050601', 'relatedfield', '2', '关联字段');
INSERT INTO `gy_menupart` VALUES ('0105060126', '01050601', 'relatedfieldbz', '2', ' 关联字段备注');
INSERT INTO `gy_menupart` VALUES ('0105060127', '01050601', 'maxcount', '2', '每次缴费最大允许缴纳数量');
INSERT INTO `gy_menupart` VALUES ('0105060128', '01050601', 'maxmoney', '2', '每次缴费最大允许缴纳金额');
INSERT INTO `gy_menupart` VALUES ('0105060129', '01050601', 'method', '2', '缴费方式');
INSERT INTO `gy_menupart` VALUES ('0105060141', '01050601', 'feeitemcode', '4', '缴费代码');
INSERT INTO `gy_menupart` VALUES ('01050601410', '01050601', 'userroles', '4', '缴费用户角色');
INSERT INTO `gy_menupart` VALUES ('01050601411', '01050601', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060142', '01050601', 'feeitemname', '4', '缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060143', '01050601', 'feetimebegin', '4', '缴费开始时间');
INSERT INTO `gy_menupart` VALUES ('0105060144', '01050601', 'feetimeend', '4', '缴费截止时间');
INSERT INTO `gy_menupart` VALUES ('0105060145', '01050601', 'relatedfield', '4', '关联字段');
INSERT INTO `gy_menupart` VALUES ('0105060146', '01050601', 'relatedfieldbz', '4', ' 关联字段备注');
INSERT INTO `gy_menupart` VALUES ('0105060147', '01050601', 'maxcount', '4', '每次缴费最大允许缴纳数量');
INSERT INTO `gy_menupart` VALUES ('0105060148', '01050601', 'maxmoney', '4', '每次缴费最大允许缴纳金额');
INSERT INTO `gy_menupart` VALUES ('0105060149', '01050601', 'method', '4', '缴费方式');
INSERT INTO `gy_menupart` VALUES ('0105060211', '01050602', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105060212', '01050602', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105060213', '01050602', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105060214', '01050602', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105060215', '01050602', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050602210', '01050602', 'xq', '2', '学期');
INSERT INTO `gy_menupart` VALUES ('01050602211', '01050602', 'qysj', '2', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050602212', '01050602', 'sfbxsq', '2', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050602213', '01050602', 'summary', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050602214', '01050602', 'czr', '2', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050602215', '01050602', 'czsj', '2', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050602216', '01050602', 'sfyx', '2', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050602217', '01050602', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060222', '01050602', 'studentksbh', '2', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('0105060223', '01050602', 'studentxh', '2', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060224', '01050602', 'feeiteminfoid', '2', '缴费项目维护表中唯一ID');
INSERT INTO `gy_menupart` VALUES ('0105060225', '01050602', 'feeitemcode', '2', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060226', '01050602', 'feeitemname', '2', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060227', '01050602', 'chargingmethods', '2', '收费方式');
INSERT INTO `gy_menupart` VALUES ('0105060228', '01050602', 'factinamount', '2', '实收金额');
INSERT INTO `gy_menupart` VALUES ('0105060229', '01050602', 'xn', '2', '学年');
INSERT INTO `gy_menupart` VALUES ('01050602410', '01050602', 'xq', '4', '学期');
INSERT INTO `gy_menupart` VALUES ('01050602411', '01050602', 'qysj', '4', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050602412', '01050602', 'sfbxsq', '4', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050602413', '01050602', 'summary', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050602414', '01050602', 'czr', '4', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050602415', '01050602', 'czsj', '4', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050602416', '01050602', 'sfyx', '4', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050602417', '01050602', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060242', '01050602', 'studentksbh', '4', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('0105060243', '01050602', 'studentxh', '4', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060244', '01050602', 'feeiteminfoid', '4', '缴费项目维护表中唯一ID');
INSERT INTO `gy_menupart` VALUES ('0105060245', '01050602', 'feeitemcode', '4', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060246', '01050602', 'feeitemname', '4', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060247', '01050602', 'chargingmethods', '4', '收费方式');
INSERT INTO `gy_menupart` VALUES ('0105060248', '01050602', 'factinamount', '4', '实收金额');
INSERT INTO `gy_menupart` VALUES ('0105060249', '01050602', 'xn', '4', '学年');
INSERT INTO `gy_menupart` VALUES ('0105060311', '01050603', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105060312', '01050603', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105060313', '01050603', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105060314', '01050603', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105060315', '01050603', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105060321', '01050603', 'studentksbh', '2', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('01050603210', '01050603', 'xn', '2', '学年');
INSERT INTO `gy_menupart` VALUES ('01050603211', '01050603', 'xq', '2', '学期');
INSERT INTO `gy_menupart` VALUES ('01050603212', '01050603', 'qysj', '2', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050603213', '01050603', 'sfbxsq', '2', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050603214', '01050603', 'summary', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050603215', '01050603', 'czr', '2', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050603216', '01050603', 'czsj', '2', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050603217', '01050603', 'sfyx', '2', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050603218', '01050603', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060322', '01050603', 'studentxh', '2', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060324', '01050603', 'feeitemcode', '2', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060325', '01050603', 'feeitemname', '2', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060326', '01050603', 'shouldinamount', '2', '应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060327', '01050603', 'freeinamount', '2', '免收费金额');
INSERT INTO `gy_menupart` VALUES ('0105060328', '01050603', 'freeinbz', '2', '免收费原因');
INSERT INTO `gy_menupart` VALUES ('0105060329', '01050603', 'factshouldinamount', '2', '实际应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060341', '01050603', 'studentksbh', '4', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('01050603410', '01050603', 'xn', '4', '学年');
INSERT INTO `gy_menupart` VALUES ('01050603411', '01050603', 'xq', '4', '学期');
INSERT INTO `gy_menupart` VALUES ('01050603412', '01050603', 'qysj', '4', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050603413', '01050603', 'sfbxsq', '4', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050603414', '01050603', 'summary', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050603415', '01050603', 'czr', '4', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050603416', '01050603', 'czsj', '4', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050603417', '01050603', 'sfyx', '4', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050603418', '01050603', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060342', '01050603', 'studentxh', '4', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060344', '01050603', 'feeitemcode', '4', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060345', '01050603', 'feeitemname', '4', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060346', '01050603', 'shouldinamount', '4', '应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060347', '01050603', 'freeinamount', '4', '免收费金额');
INSERT INTO `gy_menupart` VALUES ('0105060348', '01050603', 'freeinbz', '4', '免收费原因');
INSERT INTO `gy_menupart` VALUES ('0105060349', '01050603', 'factshouldinamount', '4', '实际应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060411', '01050604', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105060412', '01050604', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105060413', '01050604', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105060414', '01050604', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105060415', '01050604', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105060421', '01050604', 'studentksbh', '2', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('01050604210', '01050604', 'xn', '2', '学年');
INSERT INTO `gy_menupart` VALUES ('01050604211', '01050604', 'xq', '2', '学期');
INSERT INTO `gy_menupart` VALUES ('01050604212', '01050604', 'qysj', '2', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050604213', '01050604', 'sfbxsq', '2', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050604214', '01050604', 'summary', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050604215', '01050604', 'czr', '2', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050604216', '01050604', 'czsj', '2', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050604217', '01050604', 'sfyx', '2', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050604218', '01050604', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060422', '01050604', 'studentxh', '2', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060424', '01050604', 'feeitemcode', '2', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060425', '01050604', 'feeitemname', '2', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060426', '01050604', 'shouldinamount', '2', '应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060427', '01050604', 'freeinamount', '2', '免收费金额');
INSERT INTO `gy_menupart` VALUES ('0105060428', '01050604', 'freeinbz', '2', '免收费原因');
INSERT INTO `gy_menupart` VALUES ('0105060429', '01050604', 'factshouldinamount', '2', '实际应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060441', '01050604', 'studentksbh', '4', '学生考生编号');
INSERT INTO `gy_menupart` VALUES ('01050604410', '01050604', 'xn', '4', '学年');
INSERT INTO `gy_menupart` VALUES ('01050604411', '01050604', 'xq', '4', '学期');
INSERT INTO `gy_menupart` VALUES ('01050604412', '01050604', 'qysj', '4', '启用时间（用于判断该缴费记录是否有效）');
INSERT INTO `gy_menupart` VALUES ('01050604413', '01050604', 'sfbxsq', '4', '是否必须收齐给予注册');
INSERT INTO `gy_menupart` VALUES ('01050604414', '01050604', 'summary', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050604415', '01050604', 'czr', '4', '操作人');
INSERT INTO `gy_menupart` VALUES ('01050604416', '01050604', 'czsj', '4', '操作时间');
INSERT INTO `gy_menupart` VALUES ('01050604417', '01050604', 'sfyx', '4', '是否有效，记录当前记录是否有效');
INSERT INTO `gy_menupart` VALUES ('01050604418', '01050604', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105060442', '01050604', 'studentxh', '4', '学生学号');
INSERT INTO `gy_menupart` VALUES ('0105060444', '01050604', 'feeitemcode', '4', '冗余缴费项目维护表中的缴费代码');
INSERT INTO `gy_menupart` VALUES ('0105060445', '01050604', 'feeitemname', '4', '冗余缴费项目维护表中的缴费项目');
INSERT INTO `gy_menupart` VALUES ('0105060446', '01050604', 'shouldinamount', '4', '应收费标准');
INSERT INTO `gy_menupart` VALUES ('0105060447', '01050604', 'freeinamount', '4', '免收费金额');
INSERT INTO `gy_menupart` VALUES ('0105060448', '01050604', 'freeinbz', '4', '免收费原因');
INSERT INTO `gy_menupart` VALUES ('0105060449', '01050604', 'factshouldinamount', '4', '实际应收费标准');
INSERT INTO `gy_menupart` VALUES ('010507020211', '0105070202', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('010507020212', '0105070202', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('010507020213', '0105070202', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('010507020214', '0105070202', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('010507020215', '0105070202', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105070202210', '0105070202', 'wbdyy', '2', '未报到原因（当选择报到为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202211', '0105070202', 'bdbz', '2', '报到备注');
INSERT INTO `gy_menupart` VALUES ('0105070202212', '0105070202', 'sfyz', '2', '是否通过新生验证：未验证，不通过验证，通过验证');
INSERT INTO `gy_menupart` VALUES ('0105070202213', '0105070202', 'yzbz', '2', '新生验证情况说明');
INSERT INTO `gy_menupart` VALUES ('0105070202214', '0105070202', 'sftj', '2', '体检标志：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202215', '0105070202', 'wtjyy', '2', '未体检原因（当选择体检为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202216', '0105070202', 'tjbz', '2', '体检备注');
INSERT INTO `gy_menupart` VALUES ('0105070202217', '0105070202', 'sfzc', '2', '注册标志：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202218', '0105070202', 'sfqxzc', '2', '是否强行注册标记：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202219', '0105070202', 'zcsj', '2', '注册时间');
INSERT INTO `gy_menupart` VALUES ('010507020222', '0105070202', 'xh', '2', '学号（冗余数据，用来通过学号快速判断注册信息）');
INSERT INTO `gy_menupart` VALUES ('0105070202220', '0105070202', 'zcr', '2', '注册操作人');
INSERT INTO `gy_menupart` VALUES ('0105070202221', '0105070202', 'wzcyy', '2', '未注册原因（当选择注册为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202222', '0105070202', 'zcbz', '2', '注册备注');
INSERT INTO `gy_menupart` VALUES ('0105070202223', '0105070202', 'sfqj', '2', '是否请假：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202224', '0105070202', 'qjkssj', '2', '请假开始时间');
INSERT INTO `gy_menupart` VALUES ('0105070202225', '0105070202', 'qjjzsj', '2', '请假截止时间');
INSERT INTO `gy_menupart` VALUES ('0105070202226', '0105070202', 'qjcsbz', '2', '请假超时标志（暂时不用，未来在系统提醒人员）');
INSERT INTO `gy_menupart` VALUES ('0105070202227', '0105070202', 'qjbz', '2', '请假备注');
INSERT INTO `gy_menupart` VALUES ('0105070202228', '0105070202', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('0105070202229', '0105070202', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010507020223', '0105070202', 'xm', '2', '姓名（冗余数据，用来通过学号快速判断注册信息）');
INSERT INTO `gy_menupart` VALUES ('010507020224', '0105070202', 'zcxn', '2', '注册学年');
INSERT INTO `gy_menupart` VALUES ('010507020225', '0105070202', 'zcxq', '2', '注册学期');
INSERT INTO `gy_menupart` VALUES ('010507020226', '0105070202', 'sfjf', '2', '交费标志：是，否（未来考虑从收费模块取数）');
INSERT INTO `gy_menupart` VALUES ('010507020227', '0105070202', 'sfbd', '2', '报到标志：是，否');
INSERT INTO `gy_menupart` VALUES ('010507020228', '0105070202', 'bdsj', '2', '报到时间');
INSERT INTO `gy_menupart` VALUES ('010507020229', '0105070202', 'bdr', '2', '报到操作人');
INSERT INTO `gy_menupart` VALUES ('0105070202410', '0105070202', 'wbdyy', '4', '未报到原因（当选择报到为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202411', '0105070202', 'bdbz', '4', '报到备注');
INSERT INTO `gy_menupart` VALUES ('0105070202412', '0105070202', 'sfyz', '4', '是否通过新生验证：未验证，不通过验证，通过验证');
INSERT INTO `gy_menupart` VALUES ('0105070202413', '0105070202', 'yzbz', '4', '新生验证情况说明');
INSERT INTO `gy_menupart` VALUES ('0105070202414', '0105070202', 'sftj', '4', '体检标志：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202415', '0105070202', 'wtjyy', '4', '未体检原因（当选择体检为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202416', '0105070202', 'tjbz', '4', '体检备注');
INSERT INTO `gy_menupart` VALUES ('0105070202417', '0105070202', 'sfzc', '4', '注册标志：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202418', '0105070202', 'sfqxzc', '4', '是否强行注册标记：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202419', '0105070202', 'zcsj', '4', '注册时间');
INSERT INTO `gy_menupart` VALUES ('010507020242', '0105070202', 'xh', '4', '学号（冗余数据，用来通过学号快速判断注册信息）');
INSERT INTO `gy_menupart` VALUES ('0105070202420', '0105070202', 'zcr', '4', '注册操作人');
INSERT INTO `gy_menupart` VALUES ('0105070202421', '0105070202', 'wzcyy', '4', '未注册原因（当选择注册为：否，必须填）');
INSERT INTO `gy_menupart` VALUES ('0105070202422', '0105070202', 'zcbz', '4', '注册备注');
INSERT INTO `gy_menupart` VALUES ('0105070202423', '0105070202', 'sfqj', '4', '是否请假：是，否');
INSERT INTO `gy_menupart` VALUES ('0105070202424', '0105070202', 'qjkssj', '4', '请假开始时间');
INSERT INTO `gy_menupart` VALUES ('0105070202425', '0105070202', 'qjjzsj', '4', '请假截止时间');
INSERT INTO `gy_menupart` VALUES ('0105070202426', '0105070202', 'qjcsbz', '4', '请假超时标志（暂时不用，未来在系统提醒人员）');
INSERT INTO `gy_menupart` VALUES ('0105070202427', '0105070202', 'qjbz', '4', '请假备注');
INSERT INTO `gy_menupart` VALUES ('0105070202428', '0105070202', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('0105070202429', '0105070202', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010507020243', '0105070202', 'xm', '4', '姓名（冗余数据，用来通过学号快速判断注册信息）');
INSERT INTO `gy_menupart` VALUES ('010507020244', '0105070202', 'zcxn', '4', '注册学年');
INSERT INTO `gy_menupart` VALUES ('010507020245', '0105070202', 'zcxq', '4', '注册学期');
INSERT INTO `gy_menupart` VALUES ('010507020246', '0105070202', 'sfjf', '4', '交费标志：是，否（未来考虑从收费模块取数）');
INSERT INTO `gy_menupart` VALUES ('010507020247', '0105070202', 'sfbd', '4', '报到标志：是，否');
INSERT INTO `gy_menupart` VALUES ('010507020248', '0105070202', 'bdsj', '4', '报到时间');
INSERT INTO `gy_menupart` VALUES ('010507020249', '0105070202', 'bdr', '4', '报到操作人');
INSERT INTO `gy_menupart` VALUES ('0105070301P11', '0105070301', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105070301P12', '0105070301', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105070301P13', '0105070301', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105070301P14', '0105070301', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105070301P15', '0105070301', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105070301P210', '0105070301', 'mzm', '2', '民族码');
INSERT INTO `gy_menupart` VALUES ('0105070301P2100', '0105070301', 'khyh', '2', '开户银行');
INSERT INTO `gy_menupart` VALUES ('0105070301P2101', '0105070301', 'yhzh', '2', '银行帐号');
INSERT INTO `gy_menupart` VALUES ('0105070301P2102', '0105070301', 'rxqdkqk', '2', '入学前贷款情况：未贷款|已还清|未还清');
INSERT INTO `gy_menupart` VALUES ('0105070301P2103', '0105070301', 'blrxzgbz', '2', '保留入学资格或学籍标识，存：是/否 (与DQZT配合使用)');
INSERT INTO `gy_menupart` VALUES ('0105070301P2104', '0105070301', 'blrxzgkssj', '2', '保留入学资格或学籍开始时间，格式：yyyy-mm-dd');
INSERT INTO `gy_menupart` VALUES ('0105070301P2105', '0105070301', 'blrxzgjssj', '2', '保留入学资格或学籍结束时间，格式：yyyy-mm-dd');
INSERT INTO `gy_menupart` VALUES ('0105070301P2106', '0105070301', 'dsz', '2', '单双证(仅对研究生有效)，自定义代码，存名称：单证/双证');
INSERT INTO `gy_menupart` VALUES ('0105070301P2107', '0105070301', 'ssxh', '2', '硕士学号(仅对研究生有效)');
INSERT INTO `gy_menupart` VALUES ('0105070301P2108', '0105070301', 'ldfs', '2', '连读方式(无|本硕连读|本硕博连读|硕博连读)');
INSERT INTO `gy_menupart` VALUES ('0105070301P2109', '0105070301', 'qddbsj', '2', '确定读博时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P211', '0105070301', 'mz', '2', '民族 GB-20002');
INSERT INTO `gy_menupart` VALUES ('0105070301P2110', '0105070301', 'jrbsjdsj', '2', '进入博士阶段时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2111', '0105070301', 'xsbsdysj', '2', '享受博士待遇时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2112', '0105070301', 'bsxh', '2', '博士学号');
INSERT INTO `gy_menupart` VALUES ('0105070301P2113', '0105070301', 'scbj', '2', '删除标记，存：未删除,已删除');
INSERT INTO `gy_menupart` VALUES ('0105070301P2114', '0105070301', 'ybyny', '2', '预毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P2115', '0105070301', 'sjybyny', '2', '实际预毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P2116', '0105070301', 'dqydzt', '2', '当前异动状态');
INSERT INTO `gy_menupart` VALUES ('0105070301P2117', '0105070301', 'dqydsj', '2', '当前异动时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2118', '0105070301', 'dqzt', '2', '当前状态 自定义代码，存名称：DD-922000010');
INSERT INTO `gy_menupart` VALUES ('0105070301P2119', '0105070301', 'zxsj', '2', '在校时间(学制内、延期、滞留、离校)');
INSERT INTO `gy_menupart` VALUES ('0105070301P212', '0105070301', 'xxm', '2', '血型码');
INSERT INTO `gy_menupart` VALUES ('0105070301P2120', '0105070301', 'xjbyjg', '2', '毕业结果，存：毕业/结业');
INSERT INTO `gy_menupart` VALUES ('0105070301P2121', '0105070301', 'byny', '2', '毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P2122', '0105070301', 'bysj', '2', '毕业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2123', '0105070301', 'jysj', '2', '结业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2124', '0105070301', 'yysj', '2', '肄业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2125', '0105070301', 'zsbh', '2', '证书编号');
INSERT INTO `gy_menupart` VALUES ('0105070301P2126', '0105070301', 'byshjg', '2', '毕业审核结果，存：通过/不通过');
INSERT INTO `gy_menupart` VALUES ('0105070301P2127', '0105070301', 'byjgyxtjbz', '2', '毕业结果院系提交标志，存是/否');
INSERT INTO `gy_menupart` VALUES ('0105070301P2128', '0105070301', 'byzpbj', '2', '是否存在毕业照片标记：存在，不存在');
INSERT INTO `gy_menupart` VALUES ('0105070301P2129', '0105070301', 'byzp', '2', '毕业照片');
INSERT INTO `gy_menupart` VALUES ('0105070301P213', '0105070301', 'xx', '2', '血型 GB-20017');
INSERT INTO `gy_menupart` VALUES ('0105070301P2130', '0105070301', 'olddqzt', '2', '原学籍当前状态,用于取消毕业操作');
INSERT INTO `gy_menupart` VALUES ('0105070301P2131', '0105070301', 'lxsj', '2', '离校时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P2132', '0105070301', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105070301P214', '0105070301', 'csdm', '2', '出生地码');
INSERT INTO `gy_menupart` VALUES ('0105070301P215', '0105070301', 'csd', '2', '出生地');
INSERT INTO `gy_menupart` VALUES ('0105070301P216', '0105070301', 'jtcsm', '2', '家庭出身码');
INSERT INTO `gy_menupart` VALUES ('0105070301P217', '0105070301', 'jtcs', '2', '家庭出身');
INSERT INTO `gy_menupart` VALUES ('0105070301P218', '0105070301', 'hyzkm', '2', '婚姻状况码');
INSERT INTO `gy_menupart` VALUES ('0105070301P219', '0105070301', 'hyzk', '2', '婚姻状况 GB-20003');
INSERT INTO `gy_menupart` VALUES ('0105070301P22', '0105070301', 'xh', '2', '学号');
INSERT INTO `gy_menupart` VALUES ('0105070301P220', '0105070301', 'jgssm', '2', '籍贯省市码');
INSERT INTO `gy_menupart` VALUES ('0105070301P221', '0105070301', 'jgs', '2', '籍贯（省市），国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P222', '0105070301', 'jgsx', '2', '籍贯（市、县），国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P223', '0105070301', 'mqhkszssm', '2', '现户口所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105070301P224', '0105070301', 'mqhkszss', '2', '现户口所在省市，国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P225', '0105070301', 'hkxzm', '2', '户口性质码');
INSERT INTO `gy_menupart` VALUES ('0105070301P226', '0105070301', 'hkxz', '2', '户口性质 DM-20005');
INSERT INTO `gy_menupart` VALUES ('0105070301P227', '0105070301', 'gbm', '2', '国别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P228', '0105070301', 'gb', '2', '国别 GB-30009');
INSERT INTO `gy_menupart` VALUES ('0105070301P229', '0105070301', 'gatqm', '2', '港澳台侨码');
INSERT INTO `gy_menupart` VALUES ('0105070301P23', '0105070301', 'xm', '2', '姓名');
INSERT INTO `gy_menupart` VALUES ('0105070301P230', '0105070301', 'gatq', '2', '港澳台侨 DM-20004 ');
INSERT INTO `gy_menupart` VALUES ('0105070301P231', '0105070301', 'ccqsz', '2', '乘车区间－－起始站');
INSERT INTO `gy_menupart` VALUES ('0105070301P232', '0105070301', 'cczdz', '2', '乘车区间－－终点站');
INSERT INTO `gy_menupart` VALUES ('0105070301P233', '0105070301', 'zzmmm', '2', '政治面貌码');
INSERT INTO `gy_menupart` VALUES ('0105070301P234', '0105070301', 'zzmm', '2', '政治面貌 GB-20011');
INSERT INTO `gy_menupart` VALUES ('0105070301P235', '0105070301', 'rdsj', '2', '政治面貌加入时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P236', '0105070301', 'zjlxm', '2', '证件类型码');
INSERT INTO `gy_menupart` VALUES ('0105070301P237', '0105070301', 'zjlx', '2', '证件类型，自定义代码，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P238', '0105070301', 'sfzh', '2', '证件号码');
INSERT INTO `gy_menupart` VALUES ('0105070301P239', '0105070301', 'tc', '2', '特长');
INSERT INTO `gy_menupart` VALUES ('0105070301P24', '0105070301', 'xmpy', '2', '姓名拼音(全拼)');
INSERT INTO `gy_menupart` VALUES ('0105070301P240', '0105070301', 'xslbm', '2', '学生类别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P241', '0105070301', 'xslb', '2', '学生类别');
INSERT INTO `gy_menupart` VALUES ('0105070301P242', '0105070301', 'rxzp', '2', '入学照片');
INSERT INTO `gy_menupart` VALUES ('0105070301P243', '0105070301', 'rxfsm', '2', '入学方式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P244', '0105070301', 'rxfs', '2', '入学方式DM-10029,HR-10078');
INSERT INTO `gy_menupart` VALUES ('0105070301P245', '0105070301', 'rxny', '2', '入学年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P246', '0105070301', 'xq', '2', '校区 HR-30011');
INSERT INTO `gy_menupart` VALUES ('0105070301P247', '0105070301', 'departmentid', '2', 'YY_SUBJECT_DEPARTMENT表中的唯一ID');
INSERT INTO `gy_menupart` VALUES ('0105070301P248', '0105070301', 'departmentcode', '2', '部门编号（冗余，方便查询及授权）');
INSERT INTO `gy_menupart` VALUES ('0105070301P249', '0105070301', 'departmentname', '2', '部门名称（冗余，方便查询及授权）');
INSERT INTO `gy_menupart` VALUES ('0105070301P25', '0105070301', 'xmpyjp', '2', '姓名简拼');
INSERT INTO `gy_menupart` VALUES ('0105070301P250', '0105070301', 'yysubjectsubjectinfo2departmentid', '2', 'YY_SUBJECT_SUBJECTINFO2DEPARTMENT_ID中唯一ID,用来关联学科院系信息');
INSERT INTO `gy_menupart` VALUES ('0105070301P251', '0105070301', 'subjectinfoid', '2', '学科信息ID');
INSERT INTO `gy_menupart` VALUES ('0105070301P252', '0105070301', 'mllb', '2', '取学科设置中的第二级（学术学位/专业学位/类专业学位）');
INSERT INTO `gy_menupart` VALUES ('0105070301P253', '0105070301', 'mlm', '2', '取学科设置中门类码');
INSERT INTO `gy_menupart` VALUES ('0105070301P254', '0105070301', 'ml', '2', '取学科设置中门类');
INSERT INTO `gy_menupart` VALUES ('0105070301P255', '0105070301', 'yjxkm', '2', '取学科设置中一级学科码');
INSERT INTO `gy_menupart` VALUES ('0105070301P256', '0105070301', 'yjxk', '2', '取学科设置中一级学科');
INSERT INTO `gy_menupart` VALUES ('0105070301P257', '0105070301', 'zydm', '2', '取学科设置中专业码');
INSERT INTO `gy_menupart` VALUES ('0105070301P258', '0105070301', 'zymc', '2', '取学科设置中专业');
INSERT INTO `gy_menupart` VALUES ('0105070301P259', '0105070301', 'zszydm', '2', '录取当年的招生专业代码');
INSERT INTO `gy_menupart` VALUES ('0105070301P26', '0105070301', 'zym', '2', '曾用名');
INSERT INTO `gy_menupart` VALUES ('0105070301P260', '0105070301', 'zszymc', '2', '录取当年的招生专业名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P261', '0105070301', 'yjfxm', '2', '取学科设置中研究方向码');
INSERT INTO `gy_menupart` VALUES ('0105070301P262', '0105070301', 'yjfx', '2', '取学科设置中研究方向');
INSERT INTO `gy_menupart` VALUES ('0105070301P263', '0105070301', 'zsyjfxm', '2', '录取当年的招生研究方向码');
INSERT INTO `gy_menupart` VALUES ('0105070301P264', '0105070301', 'zsyjfx', '2', '录取当年的招生研究方向');
INSERT INTO `gy_menupart` VALUES ('0105070301P265', '0105070301', 'nj', '2', '年级');
INSERT INTO `gy_menupart` VALUES ('0105070301P266', '0105070301', 'bh', '2', '班号');
INSERT INTO `gy_menupart` VALUES ('0105070301P267', '0105070301', 'yds', '2', '原导师');
INSERT INTO `gy_menupart` VALUES ('0105070301P268', '0105070301', 'xz', '2', '学制');
INSERT INTO `gy_menupart` VALUES ('0105070301P269', '0105070301', 'pyfsm', '2', '培养方式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P27', '0105070301', 'xbm', '2', '性别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P270', '0105070301', 'pyfs', '2', '培养方式 DM-10015');
INSERT INTO `gy_menupart` VALUES ('0105070301P271', '0105070301', 'pycc', '2', '培养层次 HR-10013');
INSERT INTO `gy_menupart` VALUES ('0105070301P272', '0105070301', 'xxpylb', '2', '学校培养类别(DM-922000013)');
INSERT INTO `gy_menupart` VALUES ('0105070301P273', '0105070301', 'pylb', '2', '培养类别(非定向|定向培养|委托培养|自筹经费|在职定向|在职委培|自费兼读|自费全日制|公费全日制)');
INSERT INTO `gy_menupart` VALUES ('0105070301P274', '0105070301', 'pylx', '2', '培养类型(无|科研型|临床(应用)型)');
INSERT INTO `gy_menupart` VALUES ('0105070301P275', '0105070301', 'tjjg', '2', '体检结果');
INSERT INTO `gy_menupart` VALUES ('0105070301P276', '0105070301', 'xxxsm', '2', '学习形式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P277', '0105070301', 'xxxs', '2', '学习形式 HR-10076');
INSERT INTO `gy_menupart` VALUES ('0105070301P278', '0105070301', 'dxwpdw', '2', '定向或委培单位');
INSERT INTO `gy_menupart` VALUES ('0105070301P279', '0105070301', 'dxwpdwdz', '2', '定向或委培单位地址');
INSERT INTO `gy_menupart` VALUES ('0105070301P28', '0105070301', 'xb', '2', '性别 GB-20001');
INSERT INTO `gy_menupart` VALUES ('0105070301P280', '0105070301', 'dxwpdwyb', '2', '定向或委培单位邮编');
INSERT INTO `gy_menupart` VALUES ('0105070301P281', '0105070301', 'dxwpdwlxfs', '2', '定向或委培单位联系方式');
INSERT INTO `gy_menupart` VALUES ('0105070301P282', '0105070301', 'lhpybz', '2', '是否联合培养，存：是/否');
INSERT INTO `gy_menupart` VALUES ('0105070301P283', '0105070301', 'lhpydw', '2', '联合培养单位');
INSERT INTO `gy_menupart` VALUES ('0105070301P284', '0105070301', 'lhpydwdz', '2', '联合培养单位地址');
INSERT INTO `gy_menupart` VALUES ('0105070301P285', '0105070301', 'lhpydwyb', '2', '联合培养单位邮编');
INSERT INTO `gy_menupart` VALUES ('0105070301P286', '0105070301', 'lhpydwlxfs', '2', '联合培养单位联系方式');
INSERT INTO `gy_menupart` VALUES ('0105070301P287', '0105070301', 'dazt', '2', '档案在校状态 (是,否)');
INSERT INTO `gy_menupart` VALUES ('0105070301P288', '0105070301', 'zzzt', '2', '在职状态 (是,否)(和全日制是否重复?)');
INSERT INTO `gy_menupart` VALUES ('0105070301P289', '0105070301', 'qrzzt', '2', '全日制状态 (是,否;全日制=脱产,非全日制=非脱产)');
INSERT INTO `gy_menupart` VALUES ('0105070301P29', '0105070301', 'csrq', '2', '出生日期');
INSERT INTO `gy_menupart` VALUES ('0105070301P290', '0105070301', 'xlszt', '2', '学历生状态(1=是,0=否)');
INSERT INTO `gy_menupart` VALUES ('0105070301P291', '0105070301', 'sfbz', '2', '收费标准');
INSERT INTO `gy_menupart` VALUES ('0105070301P292', '0105070301', 'zzje', '2', '资助金额');
INSERT INTO `gy_menupart` VALUES ('0105070301P293', '0105070301', 'zzly', '2', '资助来源(各种奖学金?)，自定义代码，存名称：教育部奖学金，国家奖学金，三助');
INSERT INTO `gy_menupart` VALUES ('0105070301P294', '0105070301', 'sfzzxsjz', '2', '是否正在享受奖助');
INSERT INTO `gy_menupart` VALUES ('0105070301P295', '0105070301', 'jzdj', '2', '奖助金等级');
INSERT INTO `gy_menupart` VALUES ('0105070301P296', '0105070301', 'sfysyp', '2', '是否优生优培');
INSERT INTO `gy_menupart` VALUES ('0105070301P297', '0105070301', 'sfxyjf', '2', '是否需要交费（是/否）');
INSERT INTO `gy_menupart` VALUES ('0105070301P298', '0105070301', 'sfxfdk', '2', '是否学费贷款');
INSERT INTO `gy_menupart` VALUES ('0105070301P299', '0105070301', 'dkje', '2', '贷款金额');
INSERT INTO `gy_menupart` VALUES ('0105070301P410', '0105070301', 'mzm', '4', '民族码');
INSERT INTO `gy_menupart` VALUES ('0105070301P4100', '0105070301', 'khyh', '4', '开户银行');
INSERT INTO `gy_menupart` VALUES ('0105070301P4101', '0105070301', 'yhzh', '4', '银行帐号');
INSERT INTO `gy_menupart` VALUES ('0105070301P4102', '0105070301', 'rxqdkqk', '4', '入学前贷款情况：未贷款|已还清|未还清');
INSERT INTO `gy_menupart` VALUES ('0105070301P4103', '0105070301', 'blrxzgbz', '4', '保留入学资格或学籍标识，存：是/否 (与DQZT配合使用)');
INSERT INTO `gy_menupart` VALUES ('0105070301P4104', '0105070301', 'blrxzgkssj', '4', '保留入学资格或学籍开始时间，格式：yyyy-mm-dd');
INSERT INTO `gy_menupart` VALUES ('0105070301P4105', '0105070301', 'blrxzgjssj', '4', '保留入学资格或学籍结束时间，格式：yyyy-mm-dd');
INSERT INTO `gy_menupart` VALUES ('0105070301P4106', '0105070301', 'dsz', '4', '单双证(仅对研究生有效)，自定义代码，存名称：单证/双证');
INSERT INTO `gy_menupart` VALUES ('0105070301P4107', '0105070301', 'ssxh', '4', '硕士学号(仅对研究生有效)');
INSERT INTO `gy_menupart` VALUES ('0105070301P4108', '0105070301', 'ldfs', '4', '连读方式(无|本硕连读|本硕博连读|硕博连读)');
INSERT INTO `gy_menupart` VALUES ('0105070301P4109', '0105070301', 'qddbsj', '4', '确定读博时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P411', '0105070301', 'mz', '4', '民族 GB-20002');
INSERT INTO `gy_menupart` VALUES ('0105070301P4110', '0105070301', 'jrbsjdsj', '4', '进入博士阶段时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4111', '0105070301', 'xsbsdysj', '4', '享受博士待遇时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4112', '0105070301', 'bsxh', '4', '博士学号');
INSERT INTO `gy_menupart` VALUES ('0105070301P4113', '0105070301', 'scbj', '4', '删除标记，存：未删除,已删除');
INSERT INTO `gy_menupart` VALUES ('0105070301P4114', '0105070301', 'ybyny', '4', '预毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P4115', '0105070301', 'sjybyny', '4', '实际预毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P4116', '0105070301', 'dqydzt', '4', '当前异动状态');
INSERT INTO `gy_menupart` VALUES ('0105070301P4117', '0105070301', 'dqydsj', '4', '当前异动时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4118', '0105070301', 'dqzt', '4', '当前状态 自定义代码，存名称：DD-922000010');
INSERT INTO `gy_menupart` VALUES ('0105070301P4119', '0105070301', 'zxsj', '4', '在校时间(学制内、延期、滞留、离校)');
INSERT INTO `gy_menupart` VALUES ('0105070301P412', '0105070301', 'xxm', '4', '血型码');
INSERT INTO `gy_menupart` VALUES ('0105070301P4120', '0105070301', 'xjbyjg', '4', '毕业结果，存：毕业/结业');
INSERT INTO `gy_menupart` VALUES ('0105070301P4121', '0105070301', 'byny', '4', '毕业年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P4122', '0105070301', 'bysj', '4', '毕业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4123', '0105070301', 'jysj', '4', '结业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4124', '0105070301', 'yysj', '4', '肄业时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4125', '0105070301', 'zsbh', '4', '证书编号');
INSERT INTO `gy_menupart` VALUES ('0105070301P4126', '0105070301', 'byshjg', '4', '毕业审核结果，存：通过/不通过');
INSERT INTO `gy_menupart` VALUES ('0105070301P4127', '0105070301', 'byjgyxtjbz', '4', '毕业结果院系提交标志，存是/否');
INSERT INTO `gy_menupart` VALUES ('0105070301P4128', '0105070301', 'byzpbj', '4', '是否存在毕业照片标记：存在，不存在');
INSERT INTO `gy_menupart` VALUES ('0105070301P4129', '0105070301', 'byzp', '4', '毕业照片');
INSERT INTO `gy_menupart` VALUES ('0105070301P413', '0105070301', 'xx', '4', '血型 GB-20017');
INSERT INTO `gy_menupart` VALUES ('0105070301P4130', '0105070301', 'olddqzt', '4', '原学籍当前状态,用于取消毕业操作');
INSERT INTO `gy_menupart` VALUES ('0105070301P4131', '0105070301', 'lxsj', '4', '离校时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P4132', '0105070301', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('0105070301P414', '0105070301', 'csdm', '4', '出生地码');
INSERT INTO `gy_menupart` VALUES ('0105070301P415', '0105070301', 'csd', '4', '出生地');
INSERT INTO `gy_menupart` VALUES ('0105070301P416', '0105070301', 'jtcsm', '4', '家庭出身码');
INSERT INTO `gy_menupart` VALUES ('0105070301P417', '0105070301', 'jtcs', '4', '家庭出身');
INSERT INTO `gy_menupart` VALUES ('0105070301P418', '0105070301', 'hyzkm', '4', '婚姻状况码');
INSERT INTO `gy_menupart` VALUES ('0105070301P419', '0105070301', 'hyzk', '4', '婚姻状况 GB-20003');
INSERT INTO `gy_menupart` VALUES ('0105070301P42', '0105070301', 'xh', '4', '学号');
INSERT INTO `gy_menupart` VALUES ('0105070301P420', '0105070301', 'jgssm', '4', '籍贯省市码');
INSERT INTO `gy_menupart` VALUES ('0105070301P421', '0105070301', 'jgs', '4', '籍贯（省市），国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P422', '0105070301', 'jgsx', '4', '籍贯（市、县），国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P423', '0105070301', 'mqhkszssm', '4', '现户口所在省市码');
INSERT INTO `gy_menupart` VALUES ('0105070301P424', '0105070301', 'mqhkszss', '4', '现户口所在省市，国标，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P425', '0105070301', 'hkxzm', '4', '户口性质码');
INSERT INTO `gy_menupart` VALUES ('0105070301P426', '0105070301', 'hkxz', '4', '户口性质 DM-20005');
INSERT INTO `gy_menupart` VALUES ('0105070301P427', '0105070301', 'gbm', '4', '国别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P428', '0105070301', 'gb', '4', '国别 GB-30009');
INSERT INTO `gy_menupart` VALUES ('0105070301P429', '0105070301', 'gatqm', '4', '港澳台侨码');
INSERT INTO `gy_menupart` VALUES ('0105070301P43', '0105070301', 'xm', '4', '姓名');
INSERT INTO `gy_menupart` VALUES ('0105070301P430', '0105070301', 'gatq', '4', '港澳台侨 DM-20004 ');
INSERT INTO `gy_menupart` VALUES ('0105070301P431', '0105070301', 'ccqsz', '4', '乘车区间－－起始站');
INSERT INTO `gy_menupart` VALUES ('0105070301P432', '0105070301', 'cczdz', '4', '乘车区间－－终点站');
INSERT INTO `gy_menupart` VALUES ('0105070301P433', '0105070301', 'zzmmm', '4', '政治面貌码');
INSERT INTO `gy_menupart` VALUES ('0105070301P434', '0105070301', 'zzmm', '4', '政治面貌 GB-20011');
INSERT INTO `gy_menupart` VALUES ('0105070301P435', '0105070301', 'rdsj', '4', '政治面貌加入时间');
INSERT INTO `gy_menupart` VALUES ('0105070301P436', '0105070301', 'zjlxm', '4', '证件类型码');
INSERT INTO `gy_menupart` VALUES ('0105070301P437', '0105070301', 'zjlx', '4', '证件类型，自定义代码，存名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P438', '0105070301', 'sfzh', '4', '证件号码');
INSERT INTO `gy_menupart` VALUES ('0105070301P439', '0105070301', 'tc', '4', '特长');
INSERT INTO `gy_menupart` VALUES ('0105070301P44', '0105070301', 'xmpy', '4', '姓名拼音(全拼)');
INSERT INTO `gy_menupart` VALUES ('0105070301P440', '0105070301', 'xslbm', '4', '学生类别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P441', '0105070301', 'xslb', '4', '学生类别');
INSERT INTO `gy_menupart` VALUES ('0105070301P442', '0105070301', 'rxzp', '4', '入学照片');
INSERT INTO `gy_menupart` VALUES ('0105070301P443', '0105070301', 'rxfsm', '4', '入学方式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P444', '0105070301', 'rxfs', '4', '入学方式DM-10029,HR-10078');
INSERT INTO `gy_menupart` VALUES ('0105070301P445', '0105070301', 'rxny', '4', '入学年月');
INSERT INTO `gy_menupart` VALUES ('0105070301P446', '0105070301', 'xq', '4', '校区 HR-30011');
INSERT INTO `gy_menupart` VALUES ('0105070301P447', '0105070301', 'departmentid', '4', 'YY_SUBJECT_DEPARTMENT表中的唯一ID');
INSERT INTO `gy_menupart` VALUES ('0105070301P448', '0105070301', 'departmentcode', '4', '部门编号（冗余，方便查询及授权）');
INSERT INTO `gy_menupart` VALUES ('0105070301P449', '0105070301', 'departmentname', '4', '部门名称（冗余，方便查询及授权）');
INSERT INTO `gy_menupart` VALUES ('0105070301P45', '0105070301', 'xmpyjp', '4', '姓名简拼');
INSERT INTO `gy_menupart` VALUES ('0105070301P450', '0105070301', 'yysubjectsubjectinfo2departmentid', '4', 'YY_SUBJECT_SUBJECTINFO2DEPARTMENT_ID中唯一ID,用来关联学科院系信息');
INSERT INTO `gy_menupart` VALUES ('0105070301P451', '0105070301', 'subjectinfoid', '4', '学科信息ID');
INSERT INTO `gy_menupart` VALUES ('0105070301P452', '0105070301', 'mllb', '4', '取学科设置中的第二级（学术学位/专业学位/类专业学位）');
INSERT INTO `gy_menupart` VALUES ('0105070301P453', '0105070301', 'mlm', '4', '取学科设置中门类码');
INSERT INTO `gy_menupart` VALUES ('0105070301P454', '0105070301', 'ml', '4', '取学科设置中门类');
INSERT INTO `gy_menupart` VALUES ('0105070301P455', '0105070301', 'yjxkm', '4', '取学科设置中一级学科码');
INSERT INTO `gy_menupart` VALUES ('0105070301P456', '0105070301', 'yjxk', '4', '取学科设置中一级学科');
INSERT INTO `gy_menupart` VALUES ('0105070301P457', '0105070301', 'zydm', '4', '取学科设置中专业码');
INSERT INTO `gy_menupart` VALUES ('0105070301P458', '0105070301', 'zymc', '4', '取学科设置中专业');
INSERT INTO `gy_menupart` VALUES ('0105070301P459', '0105070301', 'zszydm', '4', '录取当年的招生专业代码');
INSERT INTO `gy_menupart` VALUES ('0105070301P46', '0105070301', 'zym', '4', '曾用名');
INSERT INTO `gy_menupart` VALUES ('0105070301P460', '0105070301', 'zszymc', '4', '录取当年的招生专业名称');
INSERT INTO `gy_menupart` VALUES ('0105070301P461', '0105070301', 'yjfxm', '4', '取学科设置中研究方向码');
INSERT INTO `gy_menupart` VALUES ('0105070301P462', '0105070301', 'yjfx', '4', '取学科设置中研究方向');
INSERT INTO `gy_menupart` VALUES ('0105070301P463', '0105070301', 'zsyjfxm', '4', '录取当年的招生研究方向码');
INSERT INTO `gy_menupart` VALUES ('0105070301P464', '0105070301', 'zsyjfx', '4', '录取当年的招生研究方向');
INSERT INTO `gy_menupart` VALUES ('0105070301P465', '0105070301', 'nj', '4', '年级');
INSERT INTO `gy_menupart` VALUES ('0105070301P466', '0105070301', 'bh', '4', '班号');
INSERT INTO `gy_menupart` VALUES ('0105070301P467', '0105070301', 'yds', '4', '原导师');
INSERT INTO `gy_menupart` VALUES ('0105070301P468', '0105070301', 'xz', '4', '学制');
INSERT INTO `gy_menupart` VALUES ('0105070301P469', '0105070301', 'pyfsm', '4', '培养方式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P47', '0105070301', 'xbm', '4', '性别码');
INSERT INTO `gy_menupart` VALUES ('0105070301P470', '0105070301', 'pyfs', '4', '培养方式 DM-10015');
INSERT INTO `gy_menupart` VALUES ('0105070301P471', '0105070301', 'pycc', '4', '培养层次 HR-10013');
INSERT INTO `gy_menupart` VALUES ('0105070301P472', '0105070301', 'xxpylb', '4', '学校培养类别(DM-922000013)');
INSERT INTO `gy_menupart` VALUES ('0105070301P473', '0105070301', 'pylb', '4', '培养类别(非定向|定向培养|委托培养|自筹经费|在职定向|在职委培|自费兼读|自费全日制|公费全日制)');
INSERT INTO `gy_menupart` VALUES ('0105070301P474', '0105070301', 'pylx', '4', '培养类型(无|科研型|临床(应用)型)');
INSERT INTO `gy_menupart` VALUES ('0105070301P475', '0105070301', 'tjjg', '4', '体检结果');
INSERT INTO `gy_menupart` VALUES ('0105070301P476', '0105070301', 'xxxsm', '4', '学习形式码');
INSERT INTO `gy_menupart` VALUES ('0105070301P477', '0105070301', 'xxxs', '4', '学习形式 HR-10076');
INSERT INTO `gy_menupart` VALUES ('0105070301P478', '0105070301', 'dxwpdw', '4', '定向或委培单位');
INSERT INTO `gy_menupart` VALUES ('0105070301P479', '0105070301', 'dxwpdwdz', '4', '定向或委培单位地址');
INSERT INTO `gy_menupart` VALUES ('0105070301P48', '0105070301', 'xb', '4', '性别 GB-20001');
INSERT INTO `gy_menupart` VALUES ('0105070301P480', '0105070301', 'dxwpdwyb', '4', '定向或委培单位邮编');
INSERT INTO `gy_menupart` VALUES ('0105070301P481', '0105070301', 'dxwpdwlxfs', '4', '定向或委培单位联系方式');
INSERT INTO `gy_menupart` VALUES ('0105070301P482', '0105070301', 'lhpybz', '4', '是否联合培养，存：是/否');
INSERT INTO `gy_menupart` VALUES ('0105070301P483', '0105070301', 'lhpydw', '4', '联合培养单位');
INSERT INTO `gy_menupart` VALUES ('0105070301P484', '0105070301', 'lhpydwdz', '4', '联合培养单位地址');
INSERT INTO `gy_menupart` VALUES ('0105070301P485', '0105070301', 'lhpydwyb', '4', '联合培养单位邮编');
INSERT INTO `gy_menupart` VALUES ('0105070301P486', '0105070301', 'lhpydwlxfs', '4', '联合培养单位联系方式');
INSERT INTO `gy_menupart` VALUES ('0105070301P487', '0105070301', 'dazt', '4', '档案在校状态 (是,否)');
INSERT INTO `gy_menupart` VALUES ('0105070301P488', '0105070301', 'zzzt', '4', '在职状态 (是,否)(和全日制是否重复?)');
INSERT INTO `gy_menupart` VALUES ('0105070301P489', '0105070301', 'qrzzt', '4', '全日制状态 (是,否;全日制=脱产,非全日制=非脱产)');
INSERT INTO `gy_menupart` VALUES ('0105070301P49', '0105070301', 'csrq', '4', '出生日期');
INSERT INTO `gy_menupart` VALUES ('0105070301P490', '0105070301', 'xlszt', '4', '学历生状态(1=是,0=否)');
INSERT INTO `gy_menupart` VALUES ('0105070301P491', '0105070301', 'sfbz', '4', '收费标准');
INSERT INTO `gy_menupart` VALUES ('0105070301P492', '0105070301', 'zzje', '4', '资助金额');
INSERT INTO `gy_menupart` VALUES ('0105070301P493', '0105070301', 'zzly', '4', '资助来源(各种奖学金?)，自定义代码，存名称：教育部奖学金，国家奖学金，三助');
INSERT INTO `gy_menupart` VALUES ('0105070301P494', '0105070301', 'sfzzxsjz', '4', '是否正在享受奖助');
INSERT INTO `gy_menupart` VALUES ('0105070301P495', '0105070301', 'jzdj', '4', '奖助金等级');
INSERT INTO `gy_menupart` VALUES ('0105070301P496', '0105070301', 'sfysyp', '4', '是否优生优培');
INSERT INTO `gy_menupart` VALUES ('0105070301P497', '0105070301', 'sfxyjf', '4', '是否需要交费（是/否）');
INSERT INTO `gy_menupart` VALUES ('0105070301P498', '0105070301', 'sfxfdk', '4', '是否学费贷款');
INSERT INTO `gy_menupart` VALUES ('0105070301P499', '0105070301', 'dkje', '4', '贷款金额');
INSERT INTO `gy_menupart` VALUES ('0105070401P11', '0105070401', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105070401P12', '0105070401', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105070401P13', '0105070401', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105070401P14', '0105070401', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105070401P15', '0105070401', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105070401P21', '0105070401', 'stdclassifyid', '2', '学生范围ID');
INSERT INTO `gy_menupart` VALUES ('0105070401P22', '0105070401', 'kssj', '2', '开始时间');
INSERT INTO `gy_menupart` VALUES ('0105070401P23', '0105070401', 'jssj', '2', '结束时间');
INSERT INTO `gy_menupart` VALUES ('0105070401P24', '0105070401', 'active', '2', '是否使用');
INSERT INTO `gy_menupart` VALUES ('0105070401P25', '0105070401', 'ouser', '2', '操作人');
INSERT INTO `gy_menupart` VALUES ('0105070401P26', '0105070401', 'scrq', '2', '操作日期');
INSERT INTO `gy_menupart` VALUES ('0105070401P41', '0105070401', 'stdclassifyid', '4', '学生范围ID');
INSERT INTO `gy_menupart` VALUES ('0105070401P42', '0105070401', 'kssj', '4', '开始时间');
INSERT INTO `gy_menupart` VALUES ('0105070401P43', '0105070401', 'jssj', '4', '结束时间');
INSERT INTO `gy_menupart` VALUES ('0105070401P44', '0105070401', 'active', '4', '是否使用');
INSERT INTO `gy_menupart` VALUES ('0105070401P45', '0105070401', 'ouser', '4', '操作人');
INSERT INTO `gy_menupart` VALUES ('0105070401P46', '0105070401', 'scrq', '4', '操作日期');
INSERT INTO `gy_menupart` VALUES ('0105070402P11', '0105070402', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('0105070402P12', '0105070402', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('0105070402P13', '0105070402', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('0105070402P14', '0105070402', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('0105070402P15', '0105070402', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('0105070402P21', '0105070402', 'collateitemid', '2', '对应的校验项目id');
INSERT INTO `gy_menupart` VALUES ('0105070402P210', '0105070402', 'isoncemodify', '2', '是否首次修改确认无误后在有效学制内不允许个人再修改');
INSERT INTO `gy_menupart` VALUES ('0105070402P22', '0105070402', 'stdclassifyid', '2', '面向群体的单双证');
INSERT INTO `gy_menupart` VALUES ('0105070402P23', '0105070402', 'iscanmodify', '2', '是否可直接修改,1为可以,0为不可以');
INSERT INTO `gy_menupart` VALUES ('0105070402P24', '0105070402', 'iscanaudit', '2', '是否需经过研院管理员审核通过之后修改才能生效,1为是,0为不是');
INSERT INTO `gy_menupart` VALUES ('0105070402P25', '0105070402', 'isnull', '2', '是否可为空，默认不可以');
INSERT INTO `gy_menupart` VALUES ('0105070402P26', '0105070402', 'editable', '2', '是否可修改,1为可修改，0为不可编辑');
INSERT INTO `gy_menupart` VALUES ('0105070402P27', '0105070402', 'applydept', '2', '是否适用于院系,1为适用,0为不适用');
INSERT INTO `gy_menupart` VALUES ('0105070402P28', '0105070402', 'applystd', '2', '是否适用于学生,1为适用,0为不适用');
INSERT INTO `gy_menupart` VALUES ('0105070402P29', '0105070402', 'memo', '2', '备注信息');
INSERT INTO `gy_menupart` VALUES ('0105070402P41', '0105070402', 'collateitemid', '4', '对应的校验项目id');
INSERT INTO `gy_menupart` VALUES ('0105070402P410', '0105070402', 'isoncemodify', '4', '是否首次修改确认无误后在有效学制内不允许个人再修改');
INSERT INTO `gy_menupart` VALUES ('0105070402P42', '0105070402', 'stdclassifyid', '4', '面向群体的单双证');
INSERT INTO `gy_menupart` VALUES ('0105070402P43', '0105070402', 'iscanmodify', '4', '是否可直接修改,1为可以,0为不可以');
INSERT INTO `gy_menupart` VALUES ('0105070402P44', '0105070402', 'iscanaudit', '4', '是否需经过研院管理员审核通过之后修改才能生效,1为是,0为不是');
INSERT INTO `gy_menupart` VALUES ('0105070402P45', '0105070402', 'isnull', '4', '是否可为空，默认不可以');
INSERT INTO `gy_menupart` VALUES ('0105070402P46', '0105070402', 'editable', '4', '是否可修改,1为可修改，0为不可编辑');
INSERT INTO `gy_menupart` VALUES ('0105070402P47', '0105070402', 'applydept', '4', '是否适用于院系,1为适用,0为不适用');
INSERT INTO `gy_menupart` VALUES ('0105070402P48', '0105070402', 'applystd', '4', '是否适用于学生,1为适用,0为不适用');
INSERT INTO `gy_menupart` VALUES ('0105070402P49', '0105070402', 'memo', '4', '备注信息');
INSERT INTO `gy_menupart` VALUES ('01050710P11', '01050710', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050710P12', '01050710', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050710P13', '01050710', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050710P14', '01050710', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050710P15', '01050710', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050710P21', '01050710', 'forscene', '2', '适用场景（注册｜学籍校对｜选课｜申请奖助金）');
INSERT INTO `gy_menupart` VALUES ('01050710P22', '01050710', 'departmentname', '2', '适用院系部门');
INSERT INTO `gy_menupart` VALUES ('01050710P23', '01050710', 'departmentid', '2', '院系部门ID（如果有则会加入到条件中）');
INSERT INTO `gy_menupart` VALUES ('01050710P24', '01050710', 'studentclassifiedname', '2', '学生范围名称');
INSERT INTO `gy_menupart` VALUES ('01050710P25', '01050710', 'studentclassifiedvalue', '2', '设置学生范围格式（json）');
INSERT INTO `gy_menupart` VALUES ('01050710P26', '01050710', 'studentnum', '2', '查询的学生数');
INSERT INTO `gy_menupart` VALUES ('01050710P41', '01050710', 'forscene', '4', '适用场景（注册｜学籍校对｜选课｜申请奖助金）');
INSERT INTO `gy_menupart` VALUES ('01050710P42', '01050710', 'departmentname', '4', '适用院系部门');
INSERT INTO `gy_menupart` VALUES ('01050710P43', '01050710', 'departmentid', '4', '院系部门ID（如果有则会加入到条件中）');
INSERT INTO `gy_menupart` VALUES ('01050710P44', '01050710', 'studentclassifiedname', '4', '学生范围名称');
INSERT INTO `gy_menupart` VALUES ('01050710P45', '01050710', 'studentclassifiedvalue', '4', '设置学生范围格式（json）');
INSERT INTO `gy_menupart` VALUES ('01050710P46', '01050710', 'studentnum', '4', '查询的学生数');
INSERT INTO `gy_menupart` VALUES ('01050803P11', '01050803', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050803P12', '01050803', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050803P13', '01050803', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050803P14', '01050803', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050803P15', '01050803', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050803P21', '01050803', 'kcdm', '2', '课程代码');
INSERT INTO `gy_menupart` VALUES ('01050803P210', '01050803', 'khfs', '2', '考核方式');
INSERT INTO `gy_menupart` VALUES ('01050803P211', '01050803', 'xxkc', '2', '先修课程');
INSERT INTO `gy_menupart` VALUES ('01050803P212', '01050803', 'yxfzr', '2', '院系负责人');
INSERT INTO `gy_menupart` VALUES ('01050803P213', '01050803', 'kcml', '2', '课程门类');
INSERT INTO `gy_menupart` VALUES ('01050803P214', '01050803', 'kcjj', '2', '课程简介');
INSERT INTO `gy_menupart` VALUES ('01050803P215', '01050803', 'cksm', '2', '参考书目');
INSERT INTO `gy_menupart` VALUES ('01050803P216', '01050803', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050803P217', '01050803', 'yxbz', '2', '是否有效：是、否');
INSERT INTO `gy_menupart` VALUES ('01050803P218', '01050803', 'yxtjrq', '2', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050803P219', '01050803', 'yxtjbz', '2', '院系提交标志：已提交、未提交');
INSERT INTO `gy_menupart` VALUES ('01050803P22', '01050803', 'zwmc', '2', '课程中文名称');
INSERT INTO `gy_menupart` VALUES ('01050803P220', '01050803', 'yyshjg', '2', '研院审核结果：通过、不通过');
INSERT INTO `gy_menupart` VALUES ('01050803P221', '01050803', 'yyshrq', '2', '研院审核日期');
INSERT INTO `gy_menupart` VALUES ('01050803P222', '01050803', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050803P223', '01050803', 'zjjldwid', '2', '增加记录的单位的DEPARTMENT_ID');
INSERT INTO `gy_menupart` VALUES ('01050803P224', '01050803', 'kcxzm', '2', '课程性质码：DD-923000011');
INSERT INTO `gy_menupart` VALUES ('01050803P225', '01050803', 'kcxzid', '2', '课程性质ID');
INSERT INTO `gy_menupart` VALUES ('01050803P226', '01050803', 'kclbm', '2', '课程类别码：DD-923000009');
INSERT INTO `gy_menupart` VALUES ('01050803P227', '01050803', 'kclbid', '2', '课程类别ID');
INSERT INTO `gy_menupart` VALUES ('01050803P228', '01050803', 'skdxm', '2', '授课对象码：DD-920000008');
INSERT INTO `gy_menupart` VALUES ('01050803P229', '01050803', 'skdxid', '2', '授课对象ID');
INSERT INTO `gy_menupart` VALUES ('01050803P23', '01050803', 'ywmc', '2', '课程英文名称');
INSERT INTO `gy_menupart` VALUES ('01050803P230', '01050803', 'kcmlm', '2', '课程门类码：HR-10004');
INSERT INTO `gy_menupart` VALUES ('01050803P231', '01050803', 'kcmlid', '2', '课程门类ID');
INSERT INTO `gy_menupart` VALUES ('01050803P232', '01050803', 'yyyj', '2', '研院意见');
INSERT INTO `gy_menupart` VALUES ('01050803P233', '01050803', 'sfjswyxxx', '2', '是否接受外院系选修');
INSERT INTO `gy_menupart` VALUES ('01050803P234', '01050803', 'sfzyxwkc', '2', '是否专业学位课程');
INSERT INTO `gy_menupart` VALUES ('01050803P235', '01050803', 'sfykkdwzzgl', '2', '是否由开课单位自主管理');
INSERT INTO `gy_menupart` VALUES ('01050803P236', '01050803', 'creatorcampussn', '2', '');
INSERT INTO `gy_menupart` VALUES ('01050803P237', '01050803', 'kcmb', '2', '课程目标');
INSERT INTO `gy_menupart` VALUES ('01050803P238', '01050803', 'ykcdm', '2', '原课程代码');
INSERT INTO `gy_menupart` VALUES ('01050803P24', '01050803', 'kcxz', '2', '课程性质');
INSERT INTO `gy_menupart` VALUES ('01050803P25', '01050803', 'kclb', '2', '课程类别');
INSERT INTO `gy_menupart` VALUES ('01050803P26', '01050803', 'departmentid', '2', '开课单位：开设课程的负责单位');
INSERT INTO `gy_menupart` VALUES ('01050803P27', '01050803', 'skdx', '2', '授课对象');
INSERT INTO `gy_menupart` VALUES ('01050803P28', '01050803', 'zxs', '2', '总学时');
INSERT INTO `gy_menupart` VALUES ('01050803P29', '01050803', 'xf', '2', '学分');
INSERT INTO `gy_menupart` VALUES ('01050803P41', '01050803', 'kcdm', '4', '课程代码');
INSERT INTO `gy_menupart` VALUES ('01050803P410', '01050803', 'khfs', '4', '考核方式');
INSERT INTO `gy_menupart` VALUES ('01050803P411', '01050803', 'xxkc', '4', '先修课程');
INSERT INTO `gy_menupart` VALUES ('01050803P412', '01050803', 'yxfzr', '4', '院系负责人');
INSERT INTO `gy_menupart` VALUES ('01050803P413', '01050803', 'kcml', '4', '课程门类');
INSERT INTO `gy_menupart` VALUES ('01050803P414', '01050803', 'kcjj', '4', '课程简介');
INSERT INTO `gy_menupart` VALUES ('01050803P415', '01050803', 'cksm', '4', '参考书目');
INSERT INTO `gy_menupart` VALUES ('01050803P416', '01050803', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050803P417', '01050803', 'yxbz', '4', '是否有效：是、否');
INSERT INTO `gy_menupart` VALUES ('01050803P418', '01050803', 'yxtjrq', '4', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050803P419', '01050803', 'yxtjbz', '4', '院系提交标志：已提交、未提交');
INSERT INTO `gy_menupart` VALUES ('01050803P42', '01050803', 'zwmc', '4', '课程中文名称');
INSERT INTO `gy_menupart` VALUES ('01050803P420', '01050803', 'yyshjg', '4', '研院审核结果：通过、不通过');
INSERT INTO `gy_menupart` VALUES ('01050803P421', '01050803', 'yyshrq', '4', '研院审核日期');
INSERT INTO `gy_menupart` VALUES ('01050803P422', '01050803', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050803P423', '01050803', 'zjjldwid', '4', '增加记录的单位的DEPARTMENT_ID');
INSERT INTO `gy_menupart` VALUES ('01050803P424', '01050803', 'kcxzm', '4', '课程性质码：DD-923000011');
INSERT INTO `gy_menupart` VALUES ('01050803P425', '01050803', 'kcxzid', '4', '课程性质ID');
INSERT INTO `gy_menupart` VALUES ('01050803P426', '01050803', 'kclbm', '4', '课程类别码：DD-923000009');
INSERT INTO `gy_menupart` VALUES ('01050803P427', '01050803', 'kclbid', '4', '课程类别ID');
INSERT INTO `gy_menupart` VALUES ('01050803P428', '01050803', 'skdxm', '4', '授课对象码：DD-920000008');
INSERT INTO `gy_menupart` VALUES ('01050803P429', '01050803', 'skdxid', '4', '授课对象ID');
INSERT INTO `gy_menupart` VALUES ('01050803P43', '01050803', 'ywmc', '4', '课程英文名称');
INSERT INTO `gy_menupart` VALUES ('01050803P430', '01050803', 'kcmlm', '4', '课程门类码：HR-10004');
INSERT INTO `gy_menupart` VALUES ('01050803P431', '01050803', 'kcmlid', '4', '课程门类ID');
INSERT INTO `gy_menupart` VALUES ('01050803P432', '01050803', 'yyyj', '4', '研院意见');
INSERT INTO `gy_menupart` VALUES ('01050803P433', '01050803', 'sfjswyxxx', '4', '是否接受外院系选修');
INSERT INTO `gy_menupart` VALUES ('01050803P434', '01050803', 'sfzyxwkc', '4', '是否专业学位课程');
INSERT INTO `gy_menupart` VALUES ('01050803P435', '01050803', 'sfykkdwzzgl', '4', '是否由开课单位自主管理');
INSERT INTO `gy_menupart` VALUES ('01050803P436', '01050803', 'creatorcampussn', '4', '');
INSERT INTO `gy_menupart` VALUES ('01050803P437', '01050803', 'kcmb', '4', '课程目标');
INSERT INTO `gy_menupart` VALUES ('01050803P438', '01050803', 'ykcdm', '4', '原课程代码');
INSERT INTO `gy_menupart` VALUES ('01050803P44', '01050803', 'kcxz', '4', '课程性质');
INSERT INTO `gy_menupart` VALUES ('01050803P45', '01050803', 'kclb', '4', '课程类别');
INSERT INTO `gy_menupart` VALUES ('01050803P46', '01050803', 'departmentid', '4', '开课单位：开设课程的负责单位');
INSERT INTO `gy_menupart` VALUES ('01050803P47', '01050803', 'skdx', '4', '授课对象');
INSERT INTO `gy_menupart` VALUES ('01050803P48', '01050803', 'zxs', '4', '总学时');
INSERT INTO `gy_menupart` VALUES ('01050803P49', '01050803', 'xf', '4', '学分');
INSERT INTO `gy_menupart` VALUES ('01050804P11', '01050804', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('01050804P12', '01050804', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('01050804P13', '01050804', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('01050804P14', '01050804', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('01050804P15', '01050804', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('01050804P21', '01050804', 'nd', '2', '制定年度');
INSERT INTO `gy_menupart` VALUES ('01050804P210', '01050804', 'pyfs', '2', '培养方式');
INSERT INTO `gy_menupart` VALUES ('01050804P211', '01050804', 'khhj', '2', '考核环节');
INSERT INTO `gy_menupart` VALUES ('01050804P212', '01050804', 'xwlw', '2', '学位论文');
INSERT INTO `gy_menupart` VALUES ('01050804P213', '01050804', 'cksm', '2', '参考书目');
INSERT INTO `gy_menupart` VALUES ('01050804P214', '01050804', 'kszxnj', '2', '开始执行的年级');
INSERT INTO `gy_menupart` VALUES ('01050804P215', '01050804', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('01050804P216', '01050804', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050804P217', '01050804', 'fblwyq', '2', '在校期间发表论文要求');
INSERT INTO `gy_menupart` VALUES ('01050804P218', '01050804', 'sfsbld', '2', '是否硕博连读：是|否');
INSERT INTO `gy_menupart` VALUES ('01050804P219', '01050804', 'sfzyxw', '2', '是否专业学位：是|否');
INSERT INTO `gy_menupart` VALUES ('01050804P22', '01050804', 'departmentid', '2', '部门唯一ID');
INSERT INTO `gy_menupart` VALUES ('01050804P220', '01050804', 'yxtjrq', '2', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050804P221', '01050804', 'yxtjbz', '2', '院系提交标志：已提交、未提交');
INSERT INTO `gy_menupart` VALUES ('01050804P222', '01050804', 'yyshjg', '2', '研院审核结果：通过、不通过、未审核');
INSERT INTO `gy_menupart` VALUES ('01050804P223', '01050804', 'yyshrq', '2', '研院审核日期');
INSERT INTO `gy_menupart` VALUES ('01050804P224', '01050804', 'pycc', '2', '培养层次');
INSERT INTO `gy_menupart` VALUES ('01050804P225', '01050804', 'pyccm', '2', '培养层次码：DD-920000008');
INSERT INTO `gy_menupart` VALUES ('01050804P226', '01050804', 'pyccid', '2', '培养层次ID');
INSERT INTO `gy_menupart` VALUES ('01050804P227', '01050804', 'rxfs', '2', '入学方式，不需要');
INSERT INTO `gy_menupart` VALUES ('01050804P228', '01050804', 'rxfsm', '2', '入学方式码，不需要');
INSERT INTO `gy_menupart` VALUES ('01050804P229', '01050804', 'xkm', '2', '学科码');
INSERT INTO `gy_menupart` VALUES ('01050804P23', '01050804', 'xydepartmentid', '2', '学院DEPARTMENT_ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P230', '01050804', 'zxf', '2', '所有课程的最低总学分 or 总门数');
INSERT INTO `gy_menupart` VALUES ('01050804P231', '01050804', 'zxxf', '2', '必修的最低总学分 or 总门数');
INSERT INTO `gy_menupart` VALUES ('01050804P232', '01050804', 'xxxf', '2', '选修学分');
INSERT INTO `gy_menupart` VALUES ('01050804P233', '01050804', 'byzd', '2', '备用字段，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P234', '01050804', 'byzdsec', '2', '备用字段2，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P235', '01050804', 'byzdth', '2', '备用字段3，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P236', '01050804', 'zyh', '2', '专业号，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P237', '01050804', 'yjfxm', '2', '研究方向码，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P238', '01050804', 'xslb', '2', '学生类别');
INSERT INTO `gy_menupart` VALUES ('01050804P239', '01050804', 'pylx', '2', '培养类型');
INSERT INTO `gy_menupart` VALUES ('01050804P24', '01050804', 'xsdepartmentid', '2', '系所DEPARTMENT_ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P25', '01050804', 'subjectinfo2departmentid', '2', '学科专业对应部门设置ID');
INSERT INTO `gy_menupart` VALUES ('01050804P26', '01050804', 'majorid', '2', '专业ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P27', '01050804', 'pymb', '2', '培养目标');
INSERT INTO `gy_menupart` VALUES ('01050804P28', '01050804', 'yjfx', '2', '研究方向，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P29', '01050804', 'xxnx', '2', '学习年限');
INSERT INTO `gy_menupart` VALUES ('01050804P41', '01050804', 'nd', '4', '制定年度');
INSERT INTO `gy_menupart` VALUES ('01050804P410', '01050804', 'pyfs', '4', '培养方式');
INSERT INTO `gy_menupart` VALUES ('01050804P411', '01050804', 'khhj', '4', '考核环节');
INSERT INTO `gy_menupart` VALUES ('01050804P412', '01050804', 'xwlw', '4', '学位论文');
INSERT INTO `gy_menupart` VALUES ('01050804P413', '01050804', 'cksm', '4', '参考书目');
INSERT INTO `gy_menupart` VALUES ('01050804P414', '01050804', 'kszxnj', '4', '开始执行的年级');
INSERT INTO `gy_menupart` VALUES ('01050804P415', '01050804', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('01050804P416', '01050804', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('01050804P417', '01050804', 'fblwyq', '4', '在校期间发表论文要求');
INSERT INTO `gy_menupart` VALUES ('01050804P418', '01050804', 'sfsbld', '4', '是否硕博连读：是|否');
INSERT INTO `gy_menupart` VALUES ('01050804P419', '01050804', 'sfzyxw', '4', '是否专业学位：是|否');
INSERT INTO `gy_menupart` VALUES ('01050804P42', '01050804', 'departmentid', '4', '部门唯一ID');
INSERT INTO `gy_menupart` VALUES ('01050804P420', '01050804', 'yxtjrq', '4', '院系提交日期');
INSERT INTO `gy_menupart` VALUES ('01050804P421', '01050804', 'yxtjbz', '4', '院系提交标志：已提交、未提交');
INSERT INTO `gy_menupart` VALUES ('01050804P422', '01050804', 'yyshjg', '4', '研院审核结果：通过、不通过、未审核');
INSERT INTO `gy_menupart` VALUES ('01050804P423', '01050804', 'yyshrq', '4', '研院审核日期');
INSERT INTO `gy_menupart` VALUES ('01050804P424', '01050804', 'pycc', '4', '培养层次');
INSERT INTO `gy_menupart` VALUES ('01050804P425', '01050804', 'pyccm', '4', '培养层次码：DD-920000008');
INSERT INTO `gy_menupart` VALUES ('01050804P426', '01050804', 'pyccid', '4', '培养层次ID');
INSERT INTO `gy_menupart` VALUES ('01050804P427', '01050804', 'rxfs', '4', '入学方式，不需要');
INSERT INTO `gy_menupart` VALUES ('01050804P428', '01050804', 'rxfsm', '4', '入学方式码，不需要');
INSERT INTO `gy_menupart` VALUES ('01050804P429', '01050804', 'xkm', '4', '学科码');
INSERT INTO `gy_menupart` VALUES ('01050804P43', '01050804', 'xydepartmentid', '4', '学院DEPARTMENT_ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P430', '01050804', 'zxf', '4', '所有课程的最低总学分 or 总门数');
INSERT INTO `gy_menupart` VALUES ('01050804P431', '01050804', 'zxxf', '4', '必修的最低总学分 or 总门数');
INSERT INTO `gy_menupart` VALUES ('01050804P432', '01050804', 'xxxf', '4', '选修学分');
INSERT INTO `gy_menupart` VALUES ('01050804P433', '01050804', 'byzd', '4', '备用字段，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P434', '01050804', 'byzdsec', '4', '备用字段2，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P435', '01050804', 'byzdth', '4', '备用字段3，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P436', '01050804', 'zyh', '4', '专业号，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P437', '01050804', 'yjfxm', '4', '研究方向码，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P438', '01050804', 'xslb', '4', '学生类别');
INSERT INTO `gy_menupart` VALUES ('01050804P439', '01050804', 'pylx', '4', '培养类型');
INSERT INTO `gy_menupart` VALUES ('01050804P44', '01050804', 'xsdepartmentid', '4', '系所DEPARTMENT_ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P45', '01050804', 'subjectinfo2departmentid', '4', '学科专业对应部门设置ID');
INSERT INTO `gy_menupart` VALUES ('01050804P46', '01050804', 'majorid', '4', '专业ID，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P47', '01050804', 'pymb', '4', '培养目标');
INSERT INTO `gy_menupart` VALUES ('01050804P48', '01050804', 'yjfx', '4', '研究方向，无效');
INSERT INTO `gy_menupart` VALUES ('01050804P49', '01050804', 'xxnx', '4', '学习年限');
INSERT INTO `gy_menupart` VALUES ('010510020101P11', '010510020101', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('010510020101P12', '010510020101', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('010510020101P13', '010510020101', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('010510020101P14', '010510020101', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('010510020101P15', '010510020101', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('010510020101P21', '010510020101', 'jzprojectfatherid', '2', '项目父级ID');
INSERT INTO `gy_menupart` VALUES ('010510020101P210', '010510020101', 'leaf', '2', '是否叶级');
INSERT INTO `gy_menupart` VALUES ('010510020101P211', '010510020101', 'studentclassifiedid', '2', '名额分配范围（取yy_xj_student_classified表中唯一ID对应相关值，用英文\";\"隔开）');
INSERT INTO `gy_menupart` VALUES ('010510020101P212', '010510020101', 'money', '2', '金额');
INSERT INTO `gy_menupart` VALUES ('010510020101P213', '010510020101', 'accountunit', '2', '计算单位（存：年/月）');
INSERT INTO `gy_menupart` VALUES ('010510020101P214', '010510020101', 'ouser', '2', '最后操作人');
INSERT INTO `gy_menupart` VALUES ('010510020101P215', '010510020101', 'otime', '2', '最后操作时间');
INSERT INTO `gy_menupart` VALUES ('010510020101P216', '010510020101', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010510020101P217', '010510020101', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('010510020101P22', '010510020101', 'jzprojecttypecode', '2', '项目类别代码（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P23', '010510020101', 'jzprojecttypename', '2', '项目类别名称（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P24', '010510020101', 'jzprojectname', '2', '项目名称（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P25', '010510020101', 'departmentid', '2', '自主管理部门ID');
INSERT INTO `gy_menupart` VALUES ('010510020101P26', '010510020101', 'departmentcode', '2', '自主管理部门代码');
INSERT INTO `gy_menupart` VALUES ('010510020101P27', '010510020101', 'departmentname', '2', '自主管理部门名称');
INSERT INTO `gy_menupart` VALUES ('010510020101P28', '010510020101', 'begintime', '2', '开始时间');
INSERT INTO `gy_menupart` VALUES ('010510020101P29', '010510020101', 'endtime', '2', '结束时间');
INSERT INTO `gy_menupart` VALUES ('010510020101P41', '010510020101', 'jzprojectfatherid', '4', '项目父级ID');
INSERT INTO `gy_menupart` VALUES ('010510020101P410', '010510020101', 'leaf', '4', '是否叶级');
INSERT INTO `gy_menupart` VALUES ('010510020101P411', '010510020101', 'studentclassifiedid', '4', '名额分配范围（取yy_xj_student_classified表中唯一ID对应相关值，用英文\";\"隔开）');
INSERT INTO `gy_menupart` VALUES ('010510020101P412', '010510020101', 'money', '4', '金额');
INSERT INTO `gy_menupart` VALUES ('010510020101P413', '010510020101', 'accountunit', '4', '计算单位（存：年/月）');
INSERT INTO `gy_menupart` VALUES ('010510020101P414', '010510020101', 'ouser', '4', '最后操作人');
INSERT INTO `gy_menupart` VALUES ('010510020101P415', '010510020101', 'otime', '4', '最后操作时间');
INSERT INTO `gy_menupart` VALUES ('010510020101P416', '010510020101', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010510020101P417', '010510020101', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('010510020101P42', '010510020101', 'jzprojecttypecode', '4', '项目类别代码（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P43', '010510020101', 'jzprojecttypename', '4', '项目类别名称（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P44', '010510020101', 'jzprojectname', '4', '项目名称（类别/项目/等级）');
INSERT INTO `gy_menupart` VALUES ('010510020101P45', '010510020101', 'departmentid', '4', '自主管理部门ID');
INSERT INTO `gy_menupart` VALUES ('010510020101P46', '010510020101', 'departmentcode', '4', '自主管理部门代码');
INSERT INTO `gy_menupart` VALUES ('010510020101P47', '010510020101', 'departmentname', '4', '自主管理部门名称');
INSERT INTO `gy_menupart` VALUES ('010510020101P48', '010510020101', 'begintime', '4', '开始时间');
INSERT INTO `gy_menupart` VALUES ('010510020101P49', '010510020101', 'endtime', '4', '结束时间');
INSERT INTO `gy_menupart` VALUES ('010510020102P11', '010510020102', 'id_add_button', '1', '新增按钮');
INSERT INTO `gy_menupart` VALUES ('010510020102P12', '010510020102', 'id_update_button', '1', '修改按钮');
INSERT INTO `gy_menupart` VALUES ('010510020102P13', '010510020102', 'id_delete_button', '1', '删除按钮');
INSERT INTO `gy_menupart` VALUES ('010510020102P14', '010510020102', 'id_query_button', '1', '组合查询按钮');
INSERT INTO `gy_menupart` VALUES ('010510020102P15', '010510020102', 'id_export_button', '1', '导出Excel按钮');
INSERT INTO `gy_menupart` VALUES ('010510020102P21', '010510020102', 'jzprojectbaseinfoid', '2', '项目基本设置表中唯一ID');
INSERT INTO `gy_menupart` VALUES ('010510020102P210', '010510020102', 'islock', '2', '是否锁定（存：是/否）');
INSERT INTO `gy_menupart` VALUES ('010510020102P211', '010510020102', 'ouser', '2', '最后操作人');
INSERT INTO `gy_menupart` VALUES ('010510020102P212', '010510020102', 'otime', '2', '最后操作时间');
INSERT INTO `gy_menupart` VALUES ('010510020102P213', '010510020102', 'scrq', '2', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010510020102P214', '010510020102', 'bz', '2', '备注');
INSERT INTO `gy_menupart` VALUES ('010510020102P22', '010510020102', 'studentclassifiedid', '2', '名额分配范围（取yy_xj_student_classified表中唯一ID对应相关值，用英文\";\"隔开）');
INSERT INTO `gy_menupart` VALUES ('010510020102P23', '010510020102', 'xn', '2', '当前申请年度');
INSERT INTO `gy_menupart` VALUES ('010510020102P24', '010510020102', 'departmentid', '2', '部门ID');
INSERT INTO `gy_menupart` VALUES ('010510020102P25', '010510020102', 'departmentcode', '2', '部门代码');
INSERT INTO `gy_menupart` VALUES ('010510020102P26', '010510020102', 'departmentname', '2', '部门名称');
INSERT INTO `gy_menupart` VALUES ('010510020102P27', '010510020102', 'calculationmethod', '2', '计算方法（存：按满足范围学生数统计/按已申请学生数统计）');
INSERT INTO `gy_menupart` VALUES ('010510020102P28', '010510020102', 'proportion', '2', '比例');
INSERT INTO `gy_menupart` VALUES ('010510020102P29', '010510020102', 'peoplecount', '2', '人数');
INSERT INTO `gy_menupart` VALUES ('010510020102P41', '010510020102', 'jzprojectbaseinfoid', '4', '项目基本设置表中唯一ID');
INSERT INTO `gy_menupart` VALUES ('010510020102P410', '010510020102', 'islock', '4', '是否锁定（存：是/否）');
INSERT INTO `gy_menupart` VALUES ('010510020102P411', '010510020102', 'ouser', '4', '最后操作人');
INSERT INTO `gy_menupart` VALUES ('010510020102P412', '010510020102', 'otime', '4', '最后操作时间');
INSERT INTO `gy_menupart` VALUES ('010510020102P413', '010510020102', 'scrq', '4', '生成日期');
INSERT INTO `gy_menupart` VALUES ('010510020102P414', '010510020102', 'bz', '4', '备注');
INSERT INTO `gy_menupart` VALUES ('010510020102P42', '010510020102', 'studentclassifiedid', '4', '名额分配范围（取yy_xj_student_classified表中唯一ID对应相关值，用英文\";\"隔开）');
INSERT INTO `gy_menupart` VALUES ('010510020102P43', '010510020102', 'xn', '4', '当前申请年度');
INSERT INTO `gy_menupart` VALUES ('010510020102P44', '010510020102', 'departmentid', '4', '部门ID');
INSERT INTO `gy_menupart` VALUES ('010510020102P45', '010510020102', 'departmentcode', '4', '部门代码');
INSERT INTO `gy_menupart` VALUES ('010510020102P46', '010510020102', 'departmentname', '4', '部门名称');
INSERT INTO `gy_menupart` VALUES ('010510020102P47', '010510020102', 'calculationmethod', '4', '计算方法（存：按满足范围学生数统计/按已申请学生数统计）');
INSERT INTO `gy_menupart` VALUES ('010510020102P48', '010510020102', 'proportion', '4', '比例');
INSERT INTO `gy_menupart` VALUES ('010510020102P49', '010510020102', 'peoplecount', '4', '人数');

-- ----------------------------
-- Table structure for `gy_param`
-- ----------------------------
DROP TABLE IF EXISTS `gy_param`;
CREATE TABLE `gy_param` (
  `PARAMID` varchar(8) NOT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  `PARAMVALUE` varchar(1000) NOT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PARAMID`),
  UNIQUE KEY `UK_EAPARAM` (`PARAMKEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局参数表';

-- ----------------------------
-- Records of gy_param
-- ----------------------------
INSERT INTO `gy_param` VALUES ('10000008', 'SYS_DEFAULT_THEME', 'default', '系统默认主题皮肤');
INSERT INTO `gy_param` VALUES ('10000009', 'DEFAULT_ADMIN_ACCOUNT', 'super', '默认超级管理员帐户');
INSERT INTO `gy_param` VALUES ('10000010', 'DEFAULT_DEVELOP_ACCOUNT', 'dev', '系统默认开发专用帐户');
INSERT INTO `gy_param` VALUES ('10000017', 'SYS_TITLE', '信息系统云平台', '系统标题');
INSERT INTO `gy_param` VALUES ('10000018', 'LOGIN_WINDOW_TITLE', '云平台', '登录窗口标题');
INSERT INTO `gy_param` VALUES ('10000019', 'LOGIN_WINDOW_BANNER', '/resource/image/login_banner.png', '登录窗口的Banner图片。尺寸规格:450 X 70');
INSERT INTO `gy_param` VALUES ('10000020', 'WEST_NAVIGATE_TITLE', '导航菜单', '左边菜单导航栏标题');
INSERT INTO `gy_param` VALUES ('10000021', 'BOTTOM_COPYRIGHT', 'Copyright &copy 2014', '右下角的版权信息');
INSERT INTO `gy_param` VALUES ('10000022', 'MENU_FIRST', '信息系统云平台', '中心面板导航菜单的第一个节点名');
INSERT INTO `gy_param` VALUES ('10000023', 'WELCOME_PAGE_TITLE', '首页', '缺省欢迎页面的标题');
INSERT INTO `gy_param` VALUES ('10000024', 'INDEX_BANNER', '/resource/image/title_banner.png', '首页Banner图片,必须为透明的PNG图片,建议尺寸:600 X 58');
INSERT INTO `gy_param` VALUES ('10000025', 'PAGE_LOAD_MSG', '正在载入页面,请稍等...', '页面加载等待提示信息');
INSERT INTO `gy_param` VALUES ('10000027', 'MULTI_SESSION', '1', '是否允许同一个帐户建立多个会话连接。1:允许;0:不允许');
INSERT INTO `gy_param` VALUES ('10000028', 'WEST_CARDMENU_ACTIVEONTOP', '0', '左侧卡片树菜单当前活动卡片是否置顶1:置顶;0:不置顶');
INSERT INTO `gy_param` VALUES ('10000029', 'TITLE_ICON', 'yun_favicon.ico', '显示在浏览器标题前面的小图标(注:必须为.ico格式)');
INSERT INTO `gy_param` VALUES ('10000030', 'EXCEPTION_CLIENT_MSG', '很遗憾的通知您：服务器发生了错误，您提交的请求处理失败。请和我们的客服联系，客服支持电话：010-8888888。', '客户端异常响应概要信息');
INSERT INTO `gy_param` VALUES ('10000031', 'EXCEPTION_CLIENT_WIN_SIZE', '400,150', '客户端异常信息窗口宽度高度设置');
INSERT INTO `gy_param` VALUES ('10000033', 'APP_LAYOUT', '1', '系统级缺省主界面布局模式。1:传统经典布局;2:个性桌面布局。');
INSERT INTO `gy_param` VALUES ('10000034', 'DESKTOP_BACKGROUND', 'desktop1.jpg', '系统缺省桌面背景图片');
INSERT INTO `gy_param` VALUES ('10000036', 'SYS_INTRODUCE', '<div style=\"text-indent: 2em\"><img class=\"IEPNG\" src=\"./resource/image/ext/application_home.png\" />&nbsp;系统介绍1。</div><div style=\"text-indent: 2em\"><img class=\"IEPNG\" src=\"./resource/image/ext/medal_gold_1.png\" />&nbsp;系统介绍2。</div>', '系统介绍');
INSERT INTO `gy_param` VALUES ('10000037', 'MAX_UPLOAD_FILE_SIZE', '150', '上传文件的最大尺寸（MB）');
INSERT INTO `gy_param` VALUES ('10000038', 'VFS_ROOT_DIR', '/Users/zhaozehui/vfsroot', 'VFS文件管理根目录');

-- ----------------------------
-- Table structure for `gy_role`
-- ----------------------------
DROP TABLE IF EXISTS `gy_role`;
CREATE TABLE `gy_role` (
  `ROLEID` varchar(8) NOT NULL,
  `ROLENAME` varchar(50) NOT NULL,
  `DEPTID` varchar(100) NOT NULL,
  `ROLETYPE` varchar(2) NOT NULL DEFAULT '1',
  `ROLESPEC` varchar(10) NOT NULL,
  `REMARK` varchar(2) DEFAULT NULL,
  `LOCKED` varchar(2) DEFAULT '0',
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of gy_role
-- ----------------------------
INSERT INTO `gy_role` VALUES ('10000097', '总管理员', '001', '2', 'RS01', '', '0');
INSERT INTO `gy_role` VALUES ('10000106', '业务系统管理员', '001', '2', 'RS02', '', '0');
INSERT INTO `gy_role` VALUES ('10000108', '审核员', '001', '1', 'RS04', '', '0');
INSERT INTO `gy_role` VALUES ('10000109', '普通员工', '001', '1', 'RS04', '', '0');

-- ----------------------------
-- Table structure for `gy_roleauthorize`
-- ----------------------------
DROP TABLE IF EXISTS `gy_roleauthorize`;
CREATE TABLE `gy_roleauthorize` (
  `AUTHORIZEID` varchar(8) NOT NULL,
  `ROLEID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL,
  `AUTHORIZELEVEL` varchar(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`AUTHORIZEID`),
  UNIQUE KEY `UK_EARWAUTHORIZE` (`MENUID`,`AUTHORIZELEVEL`,`AUTHORIZEID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- ----------------------------
-- Records of gy_roleauthorize
-- ----------------------------
INSERT INTO `gy_roleauthorize` VALUES ('10005415', '10000097', '01', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005416', '10000097', '0102', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005417', '10000097', '010201', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005418', '10000097', '010202', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005419', '10000097', '010204', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005420', '10000097', '010205', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005421', '10000097', '010206', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005422', '10000097', '010207', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005423', '10000097', '010208', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005424', '10000097', '010209', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005425', '10000097', '010210', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005426', '10000097', '010211', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005427', '10000097', '0103', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005428', '10000097', '010301', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005429', '10000097', '010303', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005430', '10000097', '010304', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005431', '10000097', '0109', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005432', '10000097', '010901', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005433', '10000097', '010903', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005434', '10000097', '010906', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005435', '10000097', '010907', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005436', '10000097', '010908', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005437', '10000097', '010909', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005438', '10000097', '010910', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005439', '10000097', '010912', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005474', '10000106', '01', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005475', '10000106', '0102', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005476', '10000106', '010201', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005477', '10000106', '010202', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005508', '10000108', '01', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005519', '10000109', '01', '1');
INSERT INTO `gy_roleauthorize` VALUES ('10005528', '10000106', '01', '2');
INSERT INTO `gy_roleauthorize` VALUES ('10005529', '10000106', '0110', '2');
INSERT INTO `gy_roleauthorize` VALUES ('10005530', '10000097', '01', '2');
INSERT INTO `gy_roleauthorize` VALUES ('10005531', '10000097', '0110', '2');

-- ----------------------------
-- Table structure for `gy_rolemenupart`
-- ----------------------------
DROP TABLE IF EXISTS `gy_rolemenupart`;
CREATE TABLE `gy_rolemenupart` (
  `AUTHORIZEID` varchar(8) NOT NULL,
  `ROLEID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL,
  `PARTID` varchar(70) NOT NULL,
  `PARTAUTHTYPE` varchar(1) NOT NULL,
  PRIMARY KEY (`AUTHORIZEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UI元素角色授权表';

-- ----------------------------
-- Records of gy_rolemenupart
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `gy_sequence`;
CREATE TABLE `gy_sequence` (
  `SEQUENCEID` varchar(4) NOT NULL,
  `FIELDNAME` varchar(50) NOT NULL,
  `MAXID` varchar(50) NOT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `PATTERN` varchar(50) NOT NULL,
  `IDTYPE` varchar(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`SEQUENCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列号生成器';

-- ----------------------------
-- Records of gy_sequence
-- ----------------------------
INSERT INTO `gy_sequence` VALUES ('1000', 'CODEID', '10000084', '代码表ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1001', 'ROLEID', '10000109', '角色ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1002', 'USERID', '10004926', '用户ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1003', 'PARAMID', '10000038', '参数ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1004', 'EXCEPTIONID', '10000110', '异常ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1005', 'AUTHORIZEID_ROLE', '10005531', '角色授权ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1006', 'AUTHORIZEID_USER', '10004906', '人员授权ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1007', 'AUTHORIZEID_USERMENUMAP', '10000461', '人员菜单映射ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1008', 'XMID', '1000341273', '演示表(EZ_CHARGECATALOG)项目ID', '0000000000', '1');
INSERT INTO `gy_sequence` VALUES ('1009', 'EVENTID', '100000000070435', '事件ID', '000000000000000', '1');
INSERT INTO `gy_sequence` VALUES ('1011', 'FILEID', '10000135', '文件ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1012', 'PARTID', '10000188', 'UI元素ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1013', 'AUTHORIZEID_EAUSERAUTHORIZE', '10000000', 'UI元素人员授权ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1014', 'AUTHORIZEID_EAROLEAUTHORIZE', '10000083', 'UI元素角色授权ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1015', 'RULEID', '10000021', '数据规则ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1016', 'RULEROLEID', '10000088', '数据规则角色授权ID', '00000000', '1');
INSERT INTO `gy_sequence` VALUES ('1017', 'RULEUSERID', '10000004', '数据规则用户授权ID', '00000000', '1');

-- ----------------------------
-- Table structure for `gy_user`
-- ----------------------------
DROP TABLE IF EXISTS `gy_user`;
CREATE TABLE `gy_user` (
  `USERID` varchar(8) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `ACCOUNT` varchar(30) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `SEX` varchar(2) NOT NULL DEFAULT '0',
  `DEPTID` varchar(100) NOT NULL,
  `LOCKED` varchar(2) NOT NULL DEFAULT '0',
  `REMARK` varchar(50) DEFAULT NULL,
  `USERTYPE` varchar(2) DEFAULT '1',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `ENABLED` varchar(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `ACCOUNT_UNIQUE` (`ACCOUNT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of gy_user
-- ----------------------------
INSERT INTO `gy_user` VALUES ('10000000', '超级用户', 'super', 'wreGyPgRvMY=', '1', '001', '0', '超级用户,享有系统最高管理权限', '3', null, '1');
INSERT INTO `gy_user` VALUES ('10000001', '初始管理员', 'dev', 'wreGyPgRvMY=', '0', '001', '0', '1', '3', null, '1');
INSERT INTO `gy_user` VALUES ('10004906', '超级管理员', 'sa', 'wreGyPgRvMY=', '0', '001', '0', '', '2', null, '0');
INSERT INTO `gy_user` VALUES ('10004922', 'admin', 'admin', 'wreGyPgRvMY=', '0', '001', '0', '', '2', null, '1');
INSERT INTO `gy_user` VALUES ('10004923', 'user1', 'user1', 'wreGyPgRvMY=', '0', '001', '0', '', '1', null, '1');
INSERT INTO `gy_user` VALUES ('10004924', 'user2', 'user2', 'wreGyPgRvMY=', '0', '001', '0', '', '1', null, '1');
INSERT INTO `gy_user` VALUES ('10004925', 'user3', 'user3', 'wreGyPgRvMY=', '0', '001', '0', '', '1', null, '1');
INSERT INTO `gy_user` VALUES ('10004926', 'user4', 'user4', 'wreGyPgRvMY=', '0', '001', '0', '', '1', null, '1');

-- ----------------------------
-- Table structure for `gy_userauthorize`
-- ----------------------------
DROP TABLE IF EXISTS `gy_userauthorize`;
CREATE TABLE `gy_userauthorize` (
  `AUTHORIZEID` varchar(8) NOT NULL,
  `USERID` varchar(8) NOT NULL,
  `ROLEID` varchar(8) NOT NULL,
  PRIMARY KEY (`AUTHORIZEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of gy_userauthorize
-- ----------------------------
INSERT INTO `gy_userauthorize` VALUES ('10004901', '10004923', '10000108');
INSERT INTO `gy_userauthorize` VALUES ('10004902', '10004924', '10000109');
INSERT INTO `gy_userauthorize` VALUES ('10004903', '10004925', '10000109');
INSERT INTO `gy_userauthorize` VALUES ('10004904', '10004926', '10000109');
INSERT INTO `gy_userauthorize` VALUES ('10004906', '10004922', '10000106');

-- ----------------------------
-- Table structure for `gy_usermenumap`
-- ----------------------------
DROP TABLE IF EXISTS `gy_usermenumap`;
CREATE TABLE `gy_usermenumap` (
  `AUTHORIZEID` varchar(8) NOT NULL,
  `USERID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL,
  `AUTHORIZELEVEL` varchar(2) NOT NULL,
  PRIMARY KEY (`AUTHORIZEID`),
  UNIQUE KEY `UK_EAUSERMENUMAP` (`USERID`,`MENUID`,`AUTHORIZELEVEL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户菜单映射表';

-- ----------------------------
-- Records of gy_usermenumap
-- ----------------------------
INSERT INTO `gy_usermenumap` VALUES ('10000454', '10004922', '01', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000455', '10004922', '0102', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000456', '10004922', '010201', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000459', '10004922', '010202', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000458', '10004922', '010204', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000457', '10004922', '010205', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000460', '10004923', '01', '1');
INSERT INTO `gy_usermenumap` VALUES ('10000461', '10004923', '0110', '1');

-- ----------------------------
-- Table structure for `gy_usermenupart`
-- ----------------------------
DROP TABLE IF EXISTS `gy_usermenupart`;
CREATE TABLE `gy_usermenupart` (
  `AUTHORIZEID` varchar(8) NOT NULL,
  `USERID` varchar(8) NOT NULL,
  `MENUID` varchar(60) NOT NULL,
  `PARTID` varchar(70) NOT NULL,
  `PARTAUTHTYPE` varchar(1) NOT NULL,
  PRIMARY KEY (`AUTHORIZEID`),
  UNIQUE KEY `INDEX_EAUSERMENUPART` (`USERID`,`MENUID`,`PARTID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UI元素人员授权表';

-- ----------------------------
-- Records of gy_usermenupart
-- ----------------------------

-- ----------------------------
-- Table structure for `gy_usersubinfo`
-- ----------------------------
DROP TABLE IF EXISTS `gy_usersubinfo`;
CREATE TABLE `gy_usersubinfo` (
  `USERID` varchar(8) NOT NULL,
  `THEME` varchar(50) DEFAULT NULL,
  `LAYOUT` varchar(1) DEFAULT NULL,
  `BACKGROUND` varchar(50) DEFAULT NULL,
  `OPENID` varchar(100) DEFAULT NULL COMMENT '对应的微信用户唯一ID',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员信息附加属性表';

-- ----------------------------
-- Records of gy_usersubinfo
-- ----------------------------
INSERT INTO `gy_usersubinfo` VALUES ('10000000', 'default', '1', 'desktop1.jpg', null);
INSERT INTO `gy_usersubinfo` VALUES ('10000001', 'default', '1', 'desktop3.jpg', null);
INSERT INTO `gy_usersubinfo` VALUES ('10004893', null, '1', 'desktop1.jpg', null);
INSERT INTO `gy_usersubinfo` VALUES ('10004922', null, null, null, null);
INSERT INTO `gy_usersubinfo` VALUES ('10004923', null, null, null, null);
INSERT INTO `gy_usersubinfo` VALUES ('10004924', null, null, null, null);
INSERT INTO `gy_usersubinfo` VALUES ('10004925', null, null, null, null);
INSERT INTO `gy_usersubinfo` VALUES ('10004926', null, null, null, null);

-- ----------------------------
-- Table structure for `households`
-- ----------------------------
DROP TABLE IF EXISTS `households`;
CREATE TABLE `households` (
  `HouseID` varchar(32) NOT NULL COMMENT '户型编号',
  `StyleID` varchar(32) DEFAULT NULL COMMENT '风格编号',
  `RoomType` varchar(32) DEFAULT NULL COMMENT '户型类型',
  `Square` decimal(10,0) DEFAULT NULL COMMENT '面积',
  `Thumb` text,
  `Url` text,
  `AssetUrl` text,
  `AssetBundleName` varchar(32) DEFAULT NULL,
  `AssetName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`HouseID`),
  KEY `FK_STYLE_ID` (`StyleID`),
  CONSTRAINT `FK_STYLE_ID` FOREIGN KEY (`StyleID`) REFERENCES `housestyle` (`StyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='户型表';

-- ----------------------------
-- Records of households
-- ----------------------------

-- ----------------------------
-- Table structure for `housestyle`
-- ----------------------------
DROP TABLE IF EXISTS `housestyle`;
CREATE TABLE `housestyle` (
  `StyleID` varchar(32) NOT NULL COMMENT '风格编号',
  `StyleName` varchar(32) DEFAULT NULL COMMENT '风格名称',
  PRIMARY KEY (`StyleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风格名称表';

-- ----------------------------
-- Records of housestyle
-- ----------------------------

-- ----------------------------
-- Table structure for `material2product`
-- ----------------------------
DROP TABLE IF EXISTS `material2product`;
CREATE TABLE `material2product` (
  `UUID` varchar(32) NOT NULL DEFAULT '',
  `MaterialID` varchar(32) DEFAULT NULL COMMENT '材质ID',
  `ProductID` varchar(32) DEFAULT NULL COMMENT '产品ID',
  PRIMARY KEY (`UUID`),
  KEY `FK_MATERIAL_ID` (`MaterialID`),
  KEY `FK_PRODUCT_ID` (`ProductID`),
  CONSTRAINT `FK_MATERIAL_ID` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`),
  CONSTRAINT `FK_PRODUCT_ID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材质与产品关联表';

-- ----------------------------
-- Records of material2product
-- ----------------------------

-- ----------------------------
-- Table structure for `materials`
-- ----------------------------
DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `MaterialID` varchar(32) NOT NULL DEFAULT '' COMMENT '材质编号',
  `MaterialName` varchar(32) DEFAULT NULL COMMENT '材质名称',
  `MaterialUrl` text COMMENT '下载地址',
  `AssetUrl
AssetBundleName
AssetName
AssetUrl` text,
  `AssetBundleName` varchar(32) DEFAULT NULL,
  `AssetName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材质表';

-- ----------------------------
-- Records of materials
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProductID` varchar(32) NOT NULL,
  `ProductName` varchar(32) DEFAULT NULL COMMENT '产品名称',
  `CategoryID` varchar(32) DEFAULT NULL COMMENT '类型编号',
  `StyleID` varchar(32) DEFAULT NULL COMMENT '风格编号',
  `Length` decimal(10,0) DEFAULT NULL COMMENT '长',
  `Width` decimal(10,0) DEFAULT NULL COMMENT ' 宽',
  `Height` decimal(10,0) DEFAULT NULL COMMENT '高',
  `Thumb` text COMMENT '缩略图',
  `Url` text COMMENT '下载地址',
  `AssetUrl` text,
  `AssetBundleName` varchar(32) DEFAULT NULL,
  `AssetName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_CATETORY_ID` (`CategoryID`),
  CONSTRAINT `FK_CATETORY_ID` FOREIGN KEY (`CategoryID`) REFERENCES `categorys` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for `project2user`
-- ----------------------------
DROP TABLE IF EXISTS `project2user`;
CREATE TABLE `project2user` (
  `UUID` varchar(32) NOT NULL DEFAULT '',
  `ProjectID` varchar(32) DEFAULT NULL COMMENT '项目编号',
  `UserID` varchar(32) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`UUID`),
  KEY `FK_PROJECT_ID` (`ProjectID`),
  KEY `FK_USER_ID` (`UserID`),
  CONSTRAINT `FK_PROJECT_ID` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DIY项目与用户关联表';

-- ----------------------------
-- Records of project2user
-- ----------------------------

-- ----------------------------
-- Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `ProjectID` varchar(32) NOT NULL DEFAULT '',
  `Type` int(11) DEFAULT NULL COMMENT '类型：0--系统项目，1--DIY项目',
  `ProjectName` varchar(32) DEFAULT NULL COMMENT '项目名称',
  `Thumb` text COMMENT '缩略图',
  `Url` text COMMENT '下载地址',
  `CategoryID` varchar(32) DEFAULT NULL COMMENT '风格编号',
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='案例表';

-- ----------------------------
-- Records of projects
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserID` varchar(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `UserName` varchar(32) DEFAULT NULL COMMENT '用户名',
  `Password` varchar(32) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
