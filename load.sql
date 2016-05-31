/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : load

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 11:12:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_way_assess`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_assess`;
CREATE TABLE `t_way_assess` (
  `assess_id` varchar(32) NOT NULL,
  `content` varchar(1000) NOT NULL COMMENT '评价内容',
  `service` int(2) NOT NULL COMMENT '服务评价',
  `route` int(2) NOT NULL COMMENT '路线评价',
  `assess_time` varchar(20) NOT NULL COMMENT '评价时间',
  `reserve_id` varchar(32) NOT NULL COMMENT '对应评价表表主键',
  `user_id` varchar(32) NOT NULL COMMENT '对应用户表主键',
  PRIMARY KEY (`assess_id`),
  KEY `fk_assess_user_userId` (`user_id`),
  KEY `fk_assess_reserve_reserveId` (`reserve_id`),
  CONSTRAINT `fk_assess_reserve_reserveId` FOREIGN KEY (`reserve_id`) REFERENCES `t_way_reserve` (`reserve_id`),
  CONSTRAINT `fk_assess_user_userId` FOREIGN KEY (`user_id`) REFERENCES `t_way_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_assess
-- ----------------------------
INSERT INTO `t_way_assess` VALUES ('402881e654161c1b01541635e3510008', 'xxxx', '5', '4', '2016-04-15 03:18:30', '402881e654161c1b0154163509ef0007', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_assess` VALUES ('4028d8a95417af81015417fe77a90009', '张慧云', '5', '5', '2016-04-15 11:37:13', '4028d8a95417af81015417b5ff5b0003', '40283f86540d98db01540fb18fd5006f');

-- ----------------------------
-- Table structure for `t_way_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_feedback`;
CREATE TABLE `t_way_feedback` (
  `feedback_id` varchar(32) NOT NULL,
  `feedback_content` varchar(1000) NOT NULL COMMENT '反馈内容',
  `feedback_time` varchar(20) NOT NULL COMMENT '反馈时间',
  `answer_content` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  `answer_time` varchar(20) DEFAULT NULL COMMENT '回复时间',
  `user_id` varchar(32) NOT NULL COMMENT '对应用户表主键',
  `user_name` varchar(20) NOT NULL COMMENT '对应用户表名称',
  `delsoft` varchar(2) NOT NULL DEFAULT '1' COMMENT '删除标志（删除0）',
  PRIMARY KEY (`feedback_id`),
  KEY `fk_back_user_userId` (`user_id`),
  CONSTRAINT `fk_back_user_userId` FOREIGN KEY (`user_id`) REFERENCES `t_way_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_feedback
-- ----------------------------
INSERT INTO `t_way_feedback` VALUES ('2c9081dd5426d90d015426dfbcae0002', '这孩子正在', '2016-04-18 08:57:57', null, null, '2c9081dd5426d90d015426ddecf50001', 'zhanghuiyun', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540faa7ead005d', '为什么没有景点呀？                              		', '2016-04-13 08:48:32', 'xxxxxx', '2016-04-15 02:58:03', '40283f86540d98db01540fa9c24b005c', 'tourist', '0');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540faaf2dd005e', '我要去厦门玩，不知道有没有什么地方可以推荐的呀？\r\n                              		', '2016-04-13 08:49:02', '没有', '2016-04-15 10:16:37', '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fab2347005f', '厦门有什么好玩的地方吗？                              		', '2016-04-13 08:49:14', '鼓浪屿', '2016-04-15 11:45:43', '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fab63ff0060', '厦门是北方吗？\r\n                              		', '2016-04-13 08:49:31', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fab8f320061', '为什么景点那么少？                              		', '2016-04-13 08:49:42', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fabc9710062', '视频太吵了！！！                              		', '2016-04-13 08:49:57', 'xxx', '2016-04-15 02:57:54', '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fabfad80063', '首页图片太丑了，要改进                              		', '2016-04-13 08:50:09', 'aaaaaaaaaaaaaaaaaaaaaaa', '2016-04-15 10:02:00', '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fac2a960064', '记得多更新图片！                              		', '2016-04-13 08:50:21', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fac7e680065', '厦门景点就那么少吗？                              		', '2016-04-13 08:50:43', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540face8930066', '厦门好玩吗？                              		', '2016-04-13 08:51:10', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fad20860067', '厦门有什么好吃的呀？                              		', '2016-04-13 08:51:24', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fad5d820068', '  可以做个美食专栏!                            		', '2016-04-13 08:51:40', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fadae740069', '只要厦门？                              		', '2016-04-13 08:52:01', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fade96a006a', '为什么没有其他地方的景点呀？                              		', '2016-04-13 08:52:16', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fae7b88006b', '图片太丑了                              		', '2016-04-13 08:52:53', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540fae9bd9006c', '    页面太丑了                          		', '2016-04-13 08:53:02', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540faecbd1006d', '页面布局太丑了                              		', '2016-04-13 08:53:14', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('40283f86540d98db01540faf0bef006e', '页面怎么可以这么丑呢？                              		', '2016-04-13 08:53:30', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('402881e654161c1b01541624b1940002', '1111', '2016-04-15 02:59:44', null, null, '40283f86540d98db01540fa9c24b005c', 'tourist', '1');
INSERT INTO `t_way_feedback` VALUES ('4028d8a95417501001541796a08b0012', '我想去上海旅游，有相关的景点吗', '2016-04-15 09:43:48', null, null, '4028d8a95417501001541795aa760011', 'wuwei2016', '1');
INSERT INTO `t_way_feedback` VALUES ('4028d8a95417af81015417f7b1f20005', '张慧云', '2016-04-15 11:29:49', null, null, '4028d8a95417af81015417f6766f0004', 'tourist3', '1');

-- ----------------------------
-- Table structure for `t_way_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_reserve`;
CREATE TABLE `t_way_reserve` (
  `reserve_id` varchar(32) NOT NULL,
  `reserve_number` varchar(16) NOT NULL COMMENT '订单编号',
  `star_time` varchar(20) NOT NULL COMMENT '开始日期',
  `adult_num` int(4) NOT NULL COMMENT '成人人数',
  `child_num` int(4) NOT NULL COMMENT '儿童人数',
  `price` double(10,0) NOT NULL COMMENT '价格',
  `linkman` varchar(20) NOT NULL COMMENT '联系人',
  `telephone` varchar(12) NOT NULL COMMENT '电话',
  `mail` varchar(30) NOT NULL COMMENT '邮箱',
  `total` double(10,0) NOT NULL COMMENT '总金额',
  `reserve_time` varchar(20) NOT NULL COMMENT '预约时间',
  `state` varchar(2) NOT NULL DEFAULT '0' COMMENT '预约状态(待受理0，预约成功1,拒绝2,取消3,已评价4,失信5)',
  `refuse` varchar(1000) DEFAULT NULL COMMENT '拒绝理由',
  `delsoft` varchar(2) NOT NULL DEFAULT '1' COMMENT '删除标志（删除0）',
  `user_id` varchar(32) NOT NULL COMMENT '对应用户表主键',
  `route_id` varchar(32) NOT NULL COMMENT '对应路线表的主键',
  `route_name` varchar(20) NOT NULL COMMENT '路线名称',
  `guide_name` varchar(20) NOT NULL COMMENT '商家名称',
  PRIMARY KEY (`reserve_id`),
  KEY `fk_reserve_user_userId` (`user_id`),
  KEY `fk_reserve_route_routeId` (`route_id`),
  CONSTRAINT `fk_reserve_route_routeId` FOREIGN KEY (`route_id`) REFERENCES `t_way_route` (`route_id`),
  CONSTRAINT `fk_reserve_user_userId` FOREIGN KEY (`user_id`) REFERENCES `t_way_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_reserve
-- ----------------------------
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d1d9301543d1ff9d20004', '16042216390001', '2016-04-30', '2', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '246', '2016-04-22', '2', '对不起，时间不允许！', '0', '40283f86540d98db01540fb18fd5006f', '4028d8a95417af81015418000dba000a', '厦门鼓浪屿', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d1d9301543d2025290006', '16042216390002', '2016-04-27', '2', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '246', '2016-04-22', '1', null, '0', '40283f86540d98db01540fb18fd5006f', '4028d8a95417af81015418000dba000a', '厦门鼓浪屿', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d1d9301543d24aa8b0007', '16042216440001', '2016-04-23', '3', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '3702', '2016-04-22', '1', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d1d9301543d264e6d000a', '16042216460001', '2016-04-23', '2', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '2468', '2016-04-22', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d27f401543d2878f90000', '16042216490001', '2016-04-23', '3', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '3702', '2016-04-22', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d27f401543d2aa9030003', '16042216510001', '2016-04-23', '3', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '3702', '2016-04-22', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d2e1301543d2ea0160000', '16042216550001', '2016-04-23', '2', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '2468', '2016-04-22', '2', '没时间', '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d2e1301543d3b09db0005', '16042217090001', '2016-04-28', '3', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '369', '2016-04-22', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '4028d8a95417af81015418000dba000a', '厦门鼓浪屿', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('2c9081dd543d2e1301543d4290d7000a', '16042217170001', '2016-04-30', '4', '3', '111', 'guide1', '18850551111', '18850551035@163.com', '610', '2016-04-22', '1', null, '0', '40283f86540d98db01540fb18fd5006f', '4028d8a954175010015417601ada0001', 'qqq', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('40283f86540d98db01540fe4c2ba00f4', '16041321520001', '2016-4-13', '2', '1', '6789', '123456', '13004935639', '785391076@qq.com', '16972', '2016-04-13', '5', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fda23930097', '十里蓝山,厦门红楼,曾厝垵,鼓浪屿4日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc3668830000', '16051708560001', '2016-05-19', '1', '0', '2345', 'guide1', '18850551111', '18850551035@163.com', '2345', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '402881e45470214d01547110c6450011', '十里蓝山,厦门红楼,曾厝垵', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc372c9d0001', '16051708560002', '2016-05-26', '3', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '369', '2016-05-17', '2', '不好哦！', '0', '40283f86540d98db01540fb18fd5006f', '4028d8a95417af81015418000dba000a', '厦门鼓浪屿', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc40d1150002', '16051709070001', '2016-05-27', '3', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '369', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '4028d8a9541750100154177bdf8d000a', '厦门五缘湾', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc4411bc0003', '16051709100001', '2016-05-28', '1', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '1234', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc5d75600004', '16051709380001', '2016-05-28', '1', '0', '2345', 'guide1', '18850551111', '18850551035@163.com', '2345', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc5fe2490005', '16051709400001', '2016-05-19', '1', '0', '1234', 'guide1', '18850551111', '18850551035@163.com', '1234', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc338a0154bc61b3300006', '16051709420001', '2016-05-18', '1', '0', '1345', 'guide1', '18850551111', '18850551035@163.com', '1345', '2016-05-17', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd9a134008e', '北辰山,厦门方特,日光岩,金光湖4日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc65020154bc6682bd0000', '16051709480001', '2016-05-18', '1', '0', '2345', 'guide1', '18850551111', '18850551035@163.com', '2345', '2016-05-17', '0', null, '1', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc65020154bc67dc0d0003', '16051709500001', '2016-05-18', '2', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '246', '2016-05-17', '0', null, '1', '40283f86540d98db01540fb18fd5006f', '4028d8a9541750100154177bdf8d000a', '厦门五缘湾', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881a754bc65020154bc693b860006', '16051709510001', '2016-05-19', '2', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '246', '2016-05-17', '0', null, '1', '40283f86540d98db01540fb18fd5006f', '4028d8a9541750100154177bdf8d000a', '厦门五缘湾', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881e45470214d0154702f7c87000b', '16050214370001', '2016-05-11', '2', '0', '2345', 'guide1', '18850551111', '18850551035@163.com', '4690', '2016-05-02', '0', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881e45470214d01547030ff36000c', '16050214380001', '2016-05-17', '2', '0', '123', 'guide1', '18850551111', '18850551035@163.com', '246', '2016-05-02', '1', null, '0', '40283f86540d98db01540fb18fd5006f', '4028d8a9541750100154177bdf8d000a', '厦门五缘湾', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881e654161c1b01541623fd200001', '16041502580001', '2016-04-19', '2', '0', '2345', '123456', '13004935639', '785391076@qq.com', '4690', '2016-04-15', '1', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('402881e654161c1b0154163509ef0007', '16041503170001', '2016-04-21', '1', '0', '2345', 'guide1', '18850551111', '18850551035@163.com', '2345', '2016-04-15', '4', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b88154270d3701542711d2cf0001', '16041809520001', '2016-04-21', '2', '3', '1234', 'tourist', '@@', '704354597@qq.com', '4319', '2016-04-18', '1', null, '1', '40283f86540d98db01540fa9c24b005c', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b88154289cda0154289d13880001', '16041817040001', '2016-04-19', '1', '0', '1234', '123456', '13004935639', '785391076@qq.com', '1234', '2016-04-18', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b8815428a7c1015428a836000001', '16041817160001', '2016-04-18', '1', '0', '1234', '123456', '13004935639', '785391076@qq.com', '1234', '2016-04-18', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b8815428a8c1015428a92c1d0001', '16041817170001', '2016-04-19', '1', '0', '1234', '123456', '13004935639', '785391076@qq.com', '1234', '2016-04-18', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b8815429ebe4015429ed2fd10002', '16041823110001', '2016-04-21', '1', '0', '1234', '123456', '13004935639', '785391076@qq.com', '1234', '2016-04-18', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542a192101542a1a72ee0001', '16041900000001', '2016-04-19', '1', '0', '1234', '123456', '13004935639', '785391076@qq.com', '1234', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542c54e601542c58595a0000', '16041910270001', '2016-04-20', '1', '0', '2345', '123456', '13004935639', '785391076@qq.com', '2345', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542d9e0501542d9f46020000', '16041916240001', '2016-04-19', '3', '0', '1234', '123456', '13004935639', '785391076@qq.com', '3702', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542da35f01542da45f660000', '16041916300001', '2016-04-19', '3', '0', '1234', '123456', '13004935639', '785391076@qq.com', '3702', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542da73301542da7454e0000', '16041916330001', '2016-04-19', '3', '0', '1234', '123456', '13004935639', '785391076@qq.com', '3702', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542da73301542da8435e0001', '16041916340001', '2016-04-19', '3', '0', '1234', '123456', '13004935639', '785391076@qq.com', '3702', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542da73301542daa49480002', '16041916360001', '2016-04-20', '2', '0', '1234', '123456', '13004935639', '785391076@qq.com', '2468', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542daacd01542dab51eb0000', '16041916380001', '2016-04-19', '2', '0', '1234', '123456', '13004935639', '785391076@qq.com', '2468', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542dae7e01542daf0d2d0000', '16041916420001', '2016-04-19', '2', '0', '1234', '123456', '13004935639', '785391076@qq.com', '2468', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542daf8901542dc954b00000', '16041917100001', '2016-04-20', '2', '0', '1234', '123456', '13004935639', '785391076@qq.com', '2468', '2016-04-19', '0', null, '0', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028b881542ddfb901542de17cac0000', '16041917370001', '2016-04-20', '3', '0', '1234', '123456', '13004935639', '785391076@qq.com', '3702', '2016-04-19', '0', null, '1', 'ff808081530d27d001530d2c91ad0001', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a9541750100154179765710013', '16041509440001', '2016-04-22', '1', '2', '1234', 'wuwei2016', '13004945678', '461974161@qq.com', '2468', '2016-04-15', '1', null, '1', '4028d8a95417501001541795aa760011', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a95417af81015417b503c70001', '16041510160001', '2016-04-28', '2', '0', '111', '123456', '13004935639', '785391076@qq.com', '222', '2016-04-15', '1', null, '0', 'ff808081530d27d001530d2c91ad0001', '4028d8a954175010015417601ada0001', 'qqq', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a95417af81015417b545540002', '16041510170001', '2016-04-21', '1', '0', '111', '123456', '13004935639', '785391076@qq.com', '111', '2016-04-15', '2', '没时间', '0', 'ff808081530d27d001530d2c91ad0001', '4028d8a954175010015417601ada0001', 'qqq', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a95417af81015417b5ff5b0003', '16041510180001', '2016-04-21', '2', '0', '6789', 'guide1', '18850551111', '18850551035@163.com', '13578', '2016-04-15', '4', null, '0', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fda23930097', '十里蓝山,厦门红楼,曾厝垵,鼓浪屿4日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a95417af81015417f877d40006', '16041511300001', '2016-04-16', '2', '0', '1234', 'tourist3', '18850551036', '704354597@qq.com', '2468', '2016-04-15', '2', '水水水水', '0', '4028d8a95417af81015417f6766f0004', '40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('4028d8a95417af81015417f8d3980007', '16041511310001', '2016-04-21', '2', '2', '6789', 'tourist3', '18850551036', '704354597@qq.com', '20367', '2016-04-15', '1', '顶顶顶顶', '1', '4028d8a95417af81015417f6766f0004', '40283f86540d98db01540fda23930097', '十里蓝山,厦门红楼,曾厝垵,鼓浪屿4日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('f5993f7554d71b1d0154d7f687b60002', '16052218150001', '2016-05-24', '3', '0', '2345', 'tourist', '13004945678', '704354597@qq.com', '7035', '2016-05-22', '1', null, '1', '40283f86540d98db01540fa9c24b005c', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('f5993f7554d71b1d0154d7f746470003', '16052218160001', '2016-05-26', '3', '0', '2345', 'tourist', '13004945678', '704354597@qq.com', '7035', '2016-05-22', '0', null, '1', '40283f86540d98db01540fa9c24b005c', '40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('ff80808154cc12140154cc51efd80000', '16052012000001', '2016-05-26', '2', '0', '1345', 'guide1', '18850551111', '18850551035@163.com', '2690', '2016-05-20', '0', null, '1', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd9a134008e', '北辰山,厦门方特,日光岩,金光湖4日游', 'guide1');
INSERT INTO `t_way_reserve` VALUES ('ff80808154d63e9e0154d640e9a80000', '16052210170001', '2016-05-24', '2', '0', '1345', 'guide1', '18850551111', '18850551035@163.com', '2690', '2016-05-22', '0', null, '1', '40283f86540d98db01540fb18fd5006f', '40283f86540d98db01540fd9a134008e', '北辰山,厦门方特,日光岩,金光湖4日游', 'guide1');

-- ----------------------------
-- Table structure for `t_way_route`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_route`;
CREATE TABLE `t_way_route` (
  `route_id` varchar(32) NOT NULL COMMENT '路线表主键',
  `route_name` varchar(20) NOT NULL COMMENT '路线名称',
  `price` float(6,0) NOT NULL COMMENT '定价',
  `reason` varchar(1000) NOT NULL COMMENT '路线推荐理由',
  `day` int(2) NOT NULL COMMENT '旅游的天数',
  `num` int(10) DEFAULT '0' COMMENT '预约的次数',
  `grade` double(10,5) DEFAULT NULL COMMENT '评价的平均分',
  `state` varchar(2) NOT NULL DEFAULT '0' COMMENT '路线状态(0 待审核 1 审核通过 2下线 3拒绝)',
  `refuse` varchar(1000) DEFAULT NULL COMMENT '拒绝理由',
  `user_id` varchar(32) NOT NULL COMMENT '对应用户表主键(导游)',
  `user_name` varchar(20) NOT NULL COMMENT '商家信息',
  `time` varchar(20) NOT NULL COMMENT '提交时间',
  `views` varchar(200) NOT NULL,
  PRIMARY KEY (`route_id`),
  KEY `fk_route_user_userId` (`user_id`),
  CONSTRAINT `fk_route_user_userId` FOREIGN KEY (`user_id`) REFERENCES `t_way_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_route
-- ----------------------------
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fd61eab0083', '北辰山-十里蓝山一日游', '1234', '很好玩的一个地方，不玩不会后悔的！！相信我，我会带给你一个全新的体验', '1', '0', '0.00000', '2', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:36:11', '北辰山,十里蓝山');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fd810d40087', '厦门中山路,同安影视城,环岛路3日游', '2345', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '2.25000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:38:18', '厦门中山路,同安影视城,环岛路');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fd9a134008e', '北辰山,厦门方特,日光岩,金光湖4日游', '1345', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '4', '0', '0.00000', '3', '不好玩，路线不合理', '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:40:01', '北辰山,厦门方特,日光岩,金光湖');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fda23930097', '十里蓝山,厦门红楼,曾厝垵,鼓浪屿4日游', '6789', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '4', '0', '2.50000', '2', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:40:34', '十里蓝山,厦门红楼,曾厝垵,鼓浪屿');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fdaabea00a0', '厦门大学,天竺山,观音山3日游', '4571', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:41:09', '厦门大学,天竺山,观音山');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fdb403d00a7', '厦门五老峰,后溪古镇,萤火虫公园3日游', '1234', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:41:47', '厦门五老峰,后溪古镇,萤火虫公园');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fdbd09300ae', '厦门中山路,同安影视城,环岛路3日游', '1234', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:42:24', '厦门中山路,同安影视城,环岛路');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fde1e6b00e6', '环岛路,萤火虫公园,观音山', '1234', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:44:55', '环岛路,萤火虫公园,观音山');
INSERT INTO `t_way_route` VALUES ('40283f86540d98db01540fdeee6c00ed', '日光岩,曾厝垵,环岛路', '1234', '“旅游”从字意上很好理解。“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-13 21:45:48', '日光岩,曾厝垵,环岛路');
INSERT INTO `t_way_route` VALUES ('402881e45470214d01547110c6450011', '十里蓝山,厦门红楼,曾厝垵', '2345', '少时诵诗书顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大大大', '1', '0', '0.00000', '0', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-02 18:43:25', '十里蓝山,厦门红楼,曾厝垵');
INSERT INTO `t_way_route` VALUES ('402881e45470214d015471117bb90016', '厦门中山路,同安影视城,环岛路', '3456', '反反复复凤飞飞方法反反复复凤飞飞反复', '1', '0', '0.00000', '0', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-02 18:44:11', '厦门中山路,同安影视城,环岛路');
INSERT INTO `t_way_route` VALUES ('402881e45470214d01547119a795001b', '曾厝垵,环岛路,萤火虫公园,观音山', '3456', '曾厝垵,环岛路,萤火虫公园,观音山', '1', '0', '0.00000', '0', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-02 18:53:07', '曾厝垵,环岛路,萤火虫公园,观音山');
INSERT INTO `t_way_route` VALUES ('402881e55464fd4401546a07b8c10000', '11', '11', '1111', '1', '0', '0.00000', '3', '柔柔弱弱', '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-01 09:56:11', '萤火虫公园,观音山');
INSERT INTO `t_way_route` VALUES ('402881e654161c1b0154162b16160003', '1', '1', '1', '1', '0', '0.00000', '2', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-15 03:06:43', '同安影视城,环岛路');
INSERT INTO `t_way_route` VALUES ('4028d8a954175010015417601ada0001', 'qqq', '111', '11111', '2', '0', '0.00000', '2', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-15 08:44:14', '厦门中山路,厦门五老峰,同安影视城,后溪古镇,环岛路,萤火虫公园');
INSERT INTO `t_way_route` VALUES ('4028d8a9541750100154177bdf8d000a', '厦门五缘湾', '123', '不错', '3', '0', '0.00000', '1', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-15 09:14:34', '厦门中山路,同安影视城,环岛路');
INSERT INTO `t_way_route` VALUES ('4028d8a95417af81015418000dba000a', '厦门鼓浪屿', '123', '好哇', '3', '0', '0.00000', '3', 'FA', '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-04-15 11:38:57', '厦门五老峰,后溪古镇,萤火虫公园');
INSERT INTO `t_way_route` VALUES ('f5993f7554d71b1d0154d7fafb560004', '厦门五老峰,后溪古镇,萤火虫公园', '1239', '很好玩', '1', '0', '0.00000', '0', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-22 18:20:30', '厦门五老峰,后溪古镇,萤火虫公园');
INSERT INTO `t_way_route` VALUES ('ff80808154d63e9e0154d642b1780002', '厦门中山路,同安影视城,环岛路', '1900', '很好玩，给你不一样的体验！', '1', '0', '0.00000', '0', null, '40283f86540d98db01540fb18fd5006f', 'guide1', '2016-05-22 10:19:35', '厦门中山路,同安影视城,环岛路');

-- ----------------------------
-- Table structure for `t_way_route_view`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_route_view`;
CREATE TABLE `t_way_route_view` (
  `id` varchar(32) NOT NULL COMMENT '路线景点表',
  `route_id` varchar(32) NOT NULL COMMENT '对应路线表主键',
  `view_id` varchar(32) NOT NULL COMMENT '对应景点表主键',
  PRIMARY KEY (`id`),
  KEY `fk_routeView_route_id` (`route_id`),
  KEY `fk_routeView_view_id` (`view_id`),
  CONSTRAINT `fk_routeView_route_id` FOREIGN KEY (`route_id`) REFERENCES `t_way_route` (`route_id`),
  CONSTRAINT `fk_routeView_view_id` FOREIGN KEY (`view_id`) REFERENCES `t_way_view` (`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_route_view
-- ----------------------------
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd61eab0085', '40283f86540d98db01540fd61eab0083', '40283f86540d98db01540fbae7f60071');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd61eab0086', '40283f86540d98db01540fd61eab0083', '40283f86540d98db01540fcb59d5007d');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd810d4008b', '40283f86540d98db01540fd810d40087', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd810d4008c', '40283f86540d98db01540fd810d40087', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd810d4008d', '40283f86540d98db01540fd810d40087', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd9a1340093', '40283f86540d98db01540fd9a134008e', '40283f86540d98db01540fc8b5d5007c');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd9a1340094', '40283f86540d98db01540fd9a134008e', '40283f86540d98db01540fbae7f60071');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd9a1340095', '40283f86540d98db01540fd9a134008e', '40283f86540d98db01540fc330700078');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fd9a1340096', '40283f86540d98db01540fd9a134008e', '40283f86540d98db01540fc491920079');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fda2394009c', '40283f86540d98db01540fda23930097', '40283f86540d98db01540fc7d010007b');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fda2395009d', '40283f86540d98db01540fda23930097', '40283f86540d98db01540fbcdbe30074');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fda2395009e', '40283f86540d98db01540fda23930097', '40283f86540d98db01540fb926440070');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fda2395009f', '40283f86540d98db01540fda23930097', '40283f86540d98db01540fcb59d5007d');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdaabea00a4', '40283f86540d98db01540fdaabea00a0', '40283f86540d98db01540fbe7e270075');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdaabea00a5', '40283f86540d98db01540fdaabea00a0', '40283f86540d98db01540fc6446d007a');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdaabea00a6', '40283f86540d98db01540fdaabea00a0', '40283f86540d98db01540fcca2f7007e');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdb403f00ab', '40283f86540d98db01540fdb403d00a7', '40283f86540d98db01540fcdd3d90080');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdb403f00ac', '40283f86540d98db01540fdb403d00a7', '40283f86540d98db01540fc078ed0076');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdb403f00ad', '40283f86540d98db01540fdb403d00a7', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdbd09300b2', '40283f86540d98db01540fdbd09300ae', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdbd09300b3', '40283f86540d98db01540fdbd09300ae', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdbd09300b4', '40283f86540d98db01540fdbd09300ae', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fde1e6b00ea', '40283f86540d98db01540fde1e6b00e6', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fde1e6b00eb', '40283f86540d98db01540fde1e6b00e6', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fde1e6b00ec', '40283f86540d98db01540fde1e6b00e6', '40283f86540d98db01540fbe7e270075');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdeee6c00f1', '40283f86540d98db01540fdeee6c00ed', '40283f86540d98db01540fc491920079');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdeee6c00f2', '40283f86540d98db01540fdeee6c00ed', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('40283f86540d98db01540fdeee6c00f3', '40283f86540d98db01540fdeee6c00ed', '40283f86540d98db01540fbcdbe30074');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547110c6f10013', '402881e45470214d01547110c6450011', '40283f86540d98db01540fcb59d5007d');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547110c6f10014', '402881e45470214d01547110c6450011', '40283f86540d98db01540fc7d010007b');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547110c6f10015', '402881e45470214d01547110c6450011', '40283f86540d98db01540fbcdbe30074');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d015471117bba0018', '402881e45470214d015471117bb90016', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d015471117bba0019', '402881e45470214d015471117bb90016', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d015471117bba001a', '402881e45470214d015471117bb90016', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547119a796001d', '402881e45470214d01547119a795001b', '40283f86540d98db01540fbcdbe30074');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547119a796001e', '402881e45470214d01547119a795001b', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547119a797001f', '402881e45470214d01547119a795001b', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('402881e45470214d01547119a7980020', '402881e45470214d01547119a795001b', '40283f86540d98db01540fbe7e270075');
INSERT INTO `t_way_route_view` VALUES ('402881e55464fd4401546a07b93a0002', '402881e55464fd4401546a07b8c10000', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('402881e55464fd4401546a07b93a0003', '402881e55464fd4401546a07b8c10000', '40283f86540d98db01540fbe7e270075');
INSERT INTO `t_way_route_view` VALUES ('402881e654161c1b0154162b16170005', '402881e654161c1b0154162b16160003', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('402881e654161c1b0154162b16170006', '402881e654161c1b0154162b16160003', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70004', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70005', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70006', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fcdd3d90080');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70007', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fc078ed0076');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70008', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('4028d8a954175010015417601af70009', '4028d8a954175010015417601ada0001', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('4028d8a9541750100154177bdf90000e', '4028d8a9541750100154177bdf8d000a', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('4028d8a9541750100154177bdf90000f', '4028d8a9541750100154177bdf8d000a', '40283f86540d98db01540fcd4302007f');
INSERT INTO `t_way_route_view` VALUES ('4028d8a9541750100154177bdf910010', '4028d8a9541750100154177bdf8d000a', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('4028d8a95417af81015418000dbc000e', '4028d8a95417af81015418000dba000a', '40283f86540d98db01540fcdd3d90080');
INSERT INTO `t_way_route_view` VALUES ('4028d8a95417af81015418000dbc000f', '4028d8a95417af81015418000dba000a', '40283f86540d98db01540fc078ed0076');
INSERT INTO `t_way_route_view` VALUES ('4028d8a95417af81015418000dbc0010', '4028d8a95417af81015418000dba000a', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('f5993f7554d71b1d0154d7fafb680006', 'f5993f7554d71b1d0154d7fafb560004', '40283f86540d98db01540fcf52620082');
INSERT INTO `t_way_route_view` VALUES ('f5993f7554d71b1d0154d7fafb680007', 'f5993f7554d71b1d0154d7fafb560004', '40283f86540d98db01540fcdd3d90080');
INSERT INTO `t_way_route_view` VALUES ('f5993f7554d71b1d0154d7fafb680008', 'f5993f7554d71b1d0154d7fafb560004', '40283f86540d98db01540fc078ed0076');
INSERT INTO `t_way_route_view` VALUES ('ff80808154d63e9e0154d642b1880004', 'ff80808154d63e9e0154d642b1780002', '40283f86540d98db01540fc1d1e00077');
INSERT INTO `t_way_route_view` VALUES ('ff80808154d63e9e0154d642b1880005', 'ff80808154d63e9e0154d642b1780002', '40283f86540d98db01540fce67fe0081');
INSERT INTO `t_way_route_view` VALUES ('ff80808154d63e9e0154d642b1880006', 'ff80808154d63e9e0154d642b1780002', '40283f86540d98db01540fcd4302007f');

-- ----------------------------
-- Table structure for `t_way_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_schedule`;
CREATE TABLE `t_way_schedule` (
  `schedule_id` varchar(32) NOT NULL COMMENT '行程表主键',
  `schedule_time` varchar(10) NOT NULL COMMENT '第几天',
  `schedule_content` varchar(1000) NOT NULL COMMENT '行程',
  `route_id` varchar(32) NOT NULL COMMENT '对应路线表主键',
  PRIMARY KEY (`schedule_id`),
  KEY `fk_schedule_route_routeId` (`route_id`),
  CONSTRAINT `fk_schedule_route_routeId` FOREIGN KEY (`route_id`) REFERENCES `t_way_route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_schedule
-- ----------------------------
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd61eab0084', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd61eab0083');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd810d40088', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd810d40087');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd810d40089', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd810d40087');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd810d4008a', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd810d40087');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd9a134008f', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd9a134008e');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd9a1340090', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd9a134008e');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd9a1340091', '4', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd9a134008e');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fd9a1340092', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fd9a134008e');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fda23940098', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fda23930097');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fda23940099', '4', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fda23930097');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fda2394009a', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fda23930097');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fda2394009b', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fda23930097');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdaabea00a1', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdaabea00a0');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdaabea00a2', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdaabea00a0');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdaabea00a3', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdaabea00a0');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdb403e00a8', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdb403d00a7');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdb403e00a9', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdb403d00a7');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdb403e00aa', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdb403d00a7');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdbd09300af', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdbd09300ae');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdbd09300b0', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdbd09300ae');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdbd09300b1', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdbd09300ae');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fde1e6b00e7', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fde1e6b00e6');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fde1e6b00e8', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fde1e6b00e6');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fde1e6b00e9', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fde1e6b00e6');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdeee6c00ee', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdeee6c00ed');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdeee6c00ef', '3', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdeee6c00ed');
INSERT INTO `t_way_schedule` VALUES ('40283f86540d98db01540fdeee6c00f0', '2', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '40283f86540d98db01540fdeee6c00ed');
INSERT INTO `t_way_schedule` VALUES ('402881e45470214d01547110c6f10012', '1', '啊啊啊啊啊啊啊啊<br/>7777777777', '402881e45470214d01547110c6450011');
INSERT INTO `t_way_schedule` VALUES ('402881e45470214d015471117bba0017', '1', '反反复复方法反反复复凤飞飞反复', '402881e45470214d015471117bb90016');
INSERT INTO `t_way_schedule` VALUES ('402881e45470214d01547119a795001c', '1', '08:00 在某某地方集合<br/>09:00 到达北辰山<br/>12:00 吃午餐<br/>13:00 出发到十里蓝山<br/>21:00 回市区', '402881e45470214d01547119a795001b');
INSERT INTO `t_way_schedule` VALUES ('402881e55464fd4401546a07b93a0001', '1', '1111', '402881e55464fd4401546a07b8c10000');
INSERT INTO `t_way_schedule` VALUES ('402881e654161c1b0154162b16170004', '1', '11', '402881e654161c1b0154162b16160003');
INSERT INTO `t_way_schedule` VALUES ('4028d8a954175010015417601af70002', '1', '   qqq', '4028d8a954175010015417601ada0001');
INSERT INTO `t_way_schedule` VALUES ('4028d8a954175010015417601af70003', '2', 'qqq', '4028d8a954175010015417601ada0001');
INSERT INTO `t_way_schedule` VALUES ('4028d8a9541750100154177bdf8e000b', '3', '08：00 张慧云是好人<br/>09：00 雷良卿是傻帽<br/>12：00 吃饭<br/>21：00 睡觉', '4028d8a9541750100154177bdf8d000a');
INSERT INTO `t_way_schedule` VALUES ('4028d8a9541750100154177bdf8e000c', '1', '08：00 张慧云是好人<br/>09：00 雷良卿是傻帽<br/>12：00 吃饭<br/>21：00 睡觉', '4028d8a9541750100154177bdf8d000a');
INSERT INTO `t_way_schedule` VALUES ('4028d8a9541750100154177bdf8f000d', '2', '08：00 张慧云是好人<br/>09：00 雷良卿是傻帽<br/>12：00 吃饭<br/>21：00 睡觉', '4028d8a9541750100154177bdf8d000a');
INSERT INTO `t_way_schedule` VALUES ('4028d8a95417af81015418000dbb000b', '1', 'twegdgdghhchsd<br/>sjdskfjdncdsjhfuvbjdf<br/>哈哈哈哈哈啊哈哈哈', '4028d8a95417af81015418000dba000a');
INSERT INTO `t_way_schedule` VALUES ('4028d8a95417af81015418000dbc000c', '3', '啊哈哈哈哈哈jajahaah<br/>jajaajaj', '4028d8a95417af81015418000dba000a');
INSERT INTO `t_way_schedule` VALUES ('4028d8a95417af81015418000dbc000d', '2', '哈哈哈哈啊哈哈哈哈<br/>哈哈哈哈哈哈哈哈<br/>jajaajahah', '4028d8a95417af81015418000dba000a');
INSERT INTO `t_way_schedule` VALUES ('f5993f7554d71b1d0154d7fafb670005', '1', '09:00 很好玩<br/>', 'f5993f7554d71b1d0154d7fafb560004');
INSERT INTO `t_way_schedule` VALUES ('ff80808154d63e9e0154d642b1880003', '1', '09:00 吃饭<br/>10:00 睡觉', 'ff80808154d63e9e0154d642b1780002');

-- ----------------------------
-- Table structure for `t_way_tourist`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_tourist`;
CREATE TABLE `t_way_tourist` (
  `tourist_id` varchar(32) NOT NULL,
  `tourist_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `tourist_tele` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `tourist_id_num` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '所属用户的id',
  PRIMARY KEY (`tourist_id`),
  UNIQUE KEY `tourist_id_UNIQUE` (`tourist_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_way_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出游人信息表';

-- ----------------------------
-- Records of t_way_tourist
-- ----------------------------
INSERT INTO `t_way_tourist` VALUES ('402881a754bc65020154bc67cd650002', '刘志阳', '13000819693', '350403199309870011', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881a754bc65020154bc693bcf0007', '陈佩琼', '13012345678', '350403199307230021', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702a77a90000', '张慧云', '18850551035', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702aafc10001', '江慧', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702acc0e0002', '廖阿丽', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702b106b0003', '吴威', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702b33300004', '李风顺', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702b64210005', '郑黎明', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702b9d0b0006', '郑世广', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702bbaac0007', '杨茹培', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702bd6f80008', '张美香', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702bf8070009', '撞燕红', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d0154702c1b88000a', '叶琪', '18850551031', '350783199401293028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d01547030ffbd000d', '章平', '18850524539', '350783199401283028', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('402881e45470214d015470310004000e', '林小米', '18850528124', '350783199401290327', '40283f86540d98db01540fb18fd5006f');
INSERT INTO `t_way_tourist` VALUES ('f5993f7554d71b1d0154d7f624420000', '张慧云', '18850551035', '350783199401293028', '40283f86540d98db01540fa9c24b005c');
INSERT INTO `t_way_tourist` VALUES ('f5993f7554d71b1d0154d7f673540001', '林晓梅', '18850551234', '350783199401293022', '40283f86540d98db01540fa9c24b005c');

-- ----------------------------
-- Table structure for `t_way_tourist_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_tourist_reserve`;
CREATE TABLE `t_way_tourist_reserve` (
  `id` varchar(32) NOT NULL,
  `tourist_id` varchar(32) NOT NULL,
  `reserve_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_tourist_reserve
-- ----------------------------
INSERT INTO `t_way_tourist_reserve` VALUES ('402881a754bc65020154bc6683490001', '402881e45470214d0154702b106b0003', '402881a754bc65020154bc6682bd0000');
INSERT INTO `t_way_tourist_reserve` VALUES ('402881a754bc65020154bc67dc6b0004', '402881e45470214d0154702acc0e0002', '402881a754bc65020154bc67dc0d0003');
INSERT INTO `t_way_tourist_reserve` VALUES ('402881a754bc65020154bc67dc6e0005', '402881a754bc65020154bc67cd650002', '402881a754bc65020154bc67dc0d0003');
INSERT INTO `t_way_tourist_reserve` VALUES ('402881a754bc65020154bc693c030008', '402881e45470214d0154702aafc10001', '402881a754bc65020154bc693b860006');
INSERT INTO `t_way_tourist_reserve` VALUES ('402881a754bc65020154bc693c060009', '402881a754bc65020154bc693bcf0007', '402881a754bc65020154bc693b860006');
INSERT INTO `t_way_tourist_reserve` VALUES ('ff80808154cc12140154cc51f1050001', '402881e45470214d01547030ffbd000d', 'ff80808154cc12140154cc51efd80000');
INSERT INTO `t_way_tourist_reserve` VALUES ('ff80808154d63e9e0154d640ea3c0001', '402881e45470214d0154702c1b88000a', 'ff80808154d63e9e0154d640e9a80000');

-- ----------------------------
-- Table structure for `t_way_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_user`;
CREATE TABLE `t_way_user` (
  `user_id` varchar(32) NOT NULL,
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `img` varchar(100) DEFAULT 'head.png' COMMENT '头像',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL COMMENT '盐值',
  `telephone` varchar(11) NOT NULL COMMENT '联系电话',
  `mail` varchar(30) NOT NULL,
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `id_number` varchar(18) DEFAULT NULL COMMENT '证件号码',
  `picture` varchar(100) DEFAULT NULL COMMENT '证件照片',
  `role` varchar(1) NOT NULL COMMENT '游客0，导游，旅行社1,管理员2',
  `introduce` varchar(1000) DEFAULT NULL,
  `state` varchar(2) NOT NULL COMMENT '账户状态(0 禁用 1启用 2待审批 3 审批不通过)',
  `code` varchar(32) DEFAULT NULL COMMENT '修改密码的密钥',
  `afalse` varchar(2) NOT NULL DEFAULT '0' COMMENT '过错次数',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `tk_userId` (`user_id`),
  KEY `tk_userName` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_user
-- ----------------------------
INSERT INTO `t_way_user` VALUES ('2c9081dd5426d90d015426ddecf50001', 'zhanghuiyun', '14609410662961.jpg', '852af28c9c6bdaffb496e7426829636f', '1460940958964', '18850551035', '704354597@qq.com', '', '', null, '0', '我是好人，大大的好人', '0', 'umgo', '0');
INSERT INTO `t_way_user` VALUES ('2c9081dd5426d90d015426e3c8000003', 'zhanghy', 'head.png', 'a35cb5d71d81f7996eed9e7b23735116', '1460941342702', '18840437465', '82736452@qq.com', '张会晕', 'D1111111111', '14609413427022.jpg', '1', null, '0', 'q9wg', '0');
INSERT INTO `t_way_user` VALUES ('40283f86540d98db01540fa9c24b005c', 'tourist', '14606603646281.jpg', 'b83a4980794de17024d1011cc693107a', '1460551664200', '13004945678', '704354597@qq.com', '', '', null, '0', '@@', '1', '8nhc', '0');
INSERT INTO `t_way_user` VALUES ('40283f86540d98db01540fb18fd5006f', 'guide1', '14638836160550.jpg', '1c4dd0ac71f6e2c3970d8e762190da01', '1460552175535', '18850551111', '18850551035@163.com', '茹培', 'D1234567890', '14605521755355.jpg', '1', '我是一个爱好旅游的女生，相信我一定会带给你们不一样的体', '1', 'lc24', '0');
INSERT INTO `t_way_user` VALUES ('4028d8a95417501001541795aa760011', 'wuwei2016', 'head.png', 'e58d10fa63f15b9d4fe204743f7ee435', '1460684565106', '13004945678', '461974161@qq.com', '', '', null, '0', null, '1', 'd5d7', '0');
INSERT INTO `t_way_user` VALUES ('4028d8a95417af81015417f6766f0004', 'tourist3', '14606909203212.jpg', '96572542392d9065b3ffe544ed465cea', '1460690908781', '18850551036', '704354597@qq.com', '', '', null, '0', '我是豪恩', '1', '4pmi', '0');
INSERT INTO `t_way_user` VALUES ('4028d8a95417af81015417faebf50008', 'guide2', 'head.png', '9460543bcc8c2810059cf311fe9e1927', '1460691200996', '18850551035', '70373664@qq.com', '咋个会与', 'D1111111111', '14606912009963.jpg', '1', null, '0', 'wsmz', '0');
INSERT INTO `t_way_user` VALUES ('ff808081530d27d001530d2c91ad0001', '123456', '14613186649560.png', '08c5ee6b47eca14b556d748c288fd92a', '1460011584239', '13004935639', '785391076@qq.com', null, null, null, '2', '我是好人，大大的好人!!', '1', null, '0');

-- ----------------------------
-- Table structure for `t_way_view`
-- ----------------------------
DROP TABLE IF EXISTS `t_way_view`;
CREATE TABLE `t_way_view` (
  `view_id` varchar(32) NOT NULL,
  `view_name` varchar(20) NOT NULL COMMENT '景点名称',
  `view_address` varchar(100) NOT NULL COMMENT '景点地址',
  `view_remark` varchar(1000) NOT NULL COMMENT '景点描述',
  `view_recommend` varchar(1000) DEFAULT NULL COMMENT '旅游项目推荐',
  `view_picture` varchar(100) NOT NULL COMMENT '图片',
  `view_num` int(10) NOT NULL DEFAULT '0' COMMENT '预约次数',
  `view_grade` double(10,5) DEFAULT NULL COMMENT '评价的分数',
  PRIMARY KEY (`view_id`),
  KEY `index_viewId` (`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_way_view
-- ----------------------------
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fb926440070', '鼓浪屿', '厦门某某大街某某号', '在厦门西面，隔海约700米处有一个美丽的小岛，这就是有海上花园之称的鼓浪屿。在我国漫长的海岸线上有无数近海小岛，但只有鼓浪屿荣获海上花园的称号。', '日光岩、菽庄花园、皓月园、古避暑洞、龙头山寨、郑成功纪念馆', '[14605526727907.jpg, 14605526728058.jpg, 14605526728199.jpg, 146055267283410.jpeg]', '0', '6.50000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fbae7f60071', '北辰山', '厦门同安', '北辰山俗称北山岩，景区内主要山峰牛岭峰海拔779米，开闽王王审知入闽的典故就发生于此。景区内八仙、神农氏、七仙女的传说以及同安历代名人轶事，无不折射出北辰山璀璨的历史光芒。', '有五个旅游片区，即：龙潭飞练，北山古刹，澄湖镜碧、牛岭远眺，林海叠翠万花谷。低山丘陵、花岗岩地貌，以十二龙潭瀑布为主要特色。', '[146055278789011.jpg, 146055278792112.jpg, 146055278793913.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fbcdbe30074', '曾厝垵', '厦门市思明区滨海街道', '曾厝垵，中国第一文创村。别名“曾里”，又称“曾家沃”、“曾家湾”，位于厦门岛东南部，至今已有八百多年历史[1]  。曾厝垵东至白石炮台，与黄厝社区接壤；西至胡里山炮台，与厦门大学相邻；南面大海与大担岛隔海相望；北至御屏山西姑岭。三面环山，一面临海，面积6.5平方公里。风景秀丽，美丽的环岛路贯通曾厝垵社区。[2] ', '曾厝垵，中国第一文创村。别名“曾里”，又称“曾家沃”、“曾家湾”，位于厦门岛东南部，至今已有八百多年历史[1]  。曾厝垵东至白石炮台，与黄厝社区接壤；西至胡里山炮台，与厦门大学相邻；南面大海与大担岛隔海相望；北至御屏山西姑岭。三面环山，一面临海，面积6.5平方公里。风景秀丽，美丽的环岛路贯通曾厝垵社区。', '[146055291581425.jpg, 146055291585526.jpg, 146055291589427.jpg, 146055291592028.jpg]', '0', '6.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fbe7e270075', '观音山', '福建省厦门市思明市环岛东路观音山', '厦门观音山海滨旅游项目用地位于厦门本岛东部，紧临环岛东路，面向厦门东海域，与金门隔海相望，周边有香山、鸡山、观音山、虎仔山等，自然环境良好。其西部为观音山国际商务运营中心，南面靠近国际会展中心、国际会议中心、国际网球中心、国际游艇俱乐部。', '沙雕公园位于厦门最美的环岛路中段，沙雕休闲配套区将举办沙雕工艺品展，游客可在该区购买沙雕画和立体沙雕工艺品做纪念。', '[146055302293829.jpg, 146055302297030.jpg, 146055302298531.jpg, 146055302299932.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc078ed0076', '后溪古镇', '集美后溪', '清康熙元年间，清廷为防止厦门被郑成功攻克，迁界禁海，特令福建水师提督施琅将军，在海滩上修建城池，命名做“城内”，又称“霞城”。在三百年前的城内村是三面临海，一面靠山的半岛。', '苧溪桥是厦门集美区现存最古老的石建桥梁，对于研究桥梁建筑有其重要实物价值。在厦门集美后溪镇坂头水库前，漳泉公路与坂头公路交汇处往水库方向走约500米处，有两棵高大的木棉树，木棉树驻扎在观音桥上，观音桥的尽头就是观音寺。', '[146055315263633.jpg, 146055315267634.jpg, 146055315270535.jpg, 146055315272936.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc1d1e00077', '环岛路', '福建省厦门市', '厦门环岛路全程43公里，路宽44～60米，为双向6车道，绿化带80～100米，是厦门市环海风景旅游干道之一。环岛路的建设一直奉行“临海见海，把最美的沙滩留给百姓”的宗旨，有的依山傍海，有的凌海架桥，有的穿石钻洞，建设起点高，标准严，充分体现了亚热带风光特色。', '石鼓山立交桥←→疏港路←→湖滨西路←→鹭江道←→和平码头←→演武大桥←→厦大白城←→曾厝垵←→黄厝←→会展中心←→香山←→观音山←→五通←→钟宅湾大桥←→墩上←→机场路口←→石鼓山立交桥。', '[146055324091837.jpg, 146055324096038.jpg, 146055324098939.jpg, 146055324101840.jpg]', '0', '6.50000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc330700078', '金光湖', '厦门市同安区莲花镇内田村', '林区山形如“湖”状，四周六条山岭和两座小山交相环抱，构成“金”字形，旭日初生、叶露晶莹、金光闪闪，故名“金光湖”。金光湖被誉为“闽南的西双版纳”，林海茫茫，野生动植物品种繁多，不胜枚举，林区总面积7768亩，最高海拔845米。林区古木参天，曲径幽回，身处林海，不仅可以饱览大自然秀丽风光，还可尽情享受“森林氧吧”的无穷乐趣。区内有国家一级、二级保护植物及其它树林，还有珍稀动物。', '这里\r\n厦门金光湖\r\n厦门金光湖 (5张)\r\n 有2亿多年前与恐龙同时代的植物“活化石” ——刺桫椤，以及稀有的蕨类植物——观音坐莲，国家一级保护动物——穿山甲，可供采用的中药——灵芝草、风鼓草、砂仁、玉桂等，林区还有173科835种较为罕见树种。', '[146055333065941.jpg, 146055333070142.jpg, 146055333074243.jpg, 146055333077844.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc491920079', '日光岩', '鼓浪屿中部偏南', '相传1641年，郑成功来到晃岩，看到这里的景色胜过日本的日光山，便把\"晃\"字拆开，称之为\"日光岩\"。日光岩游览区由日光岩和琴园两个部分组成。日光岩耸峙于鼓浪屿中部偏南，是由两块巨石一竖一横相倚而立，成为龙头山的顶峰，海拔92.7米，为鼓浪屿最高峰。', '站在日光岩山门处，看到一块高40多米的巨岩，凌空而立，在那巨岩峭壁上，有1915年许世英题刻的“天风海涛”四字横书；其下还有两行大字题刻，右侧为“鼓浪洞天”，系明万历元年（公元1573年）江苏丹阳人丁一中所书，这是日光岩最早的题刻。', '[146055342105145.jpg, 146055342116146.jpg, 146055342118547.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc6446d007a', '厦门大学', '厦门市思明区思明南路422号', '截至2015年3月，学校占地超过9000亩，其中思明校区位于厦门本岛南端，占地2596亩，漳州校区占地2568亩，翔安校区占地3645亩。2014年7月，厦门大学马来西亚分校动工建设。校舍建筑总面积210万平方米，图书馆馆藏纸质图书总量468万册，固定资产总值46亿元，仪器设备总值超过18亿元。校园高速信息网络建设的规模、水平居全国高校前列并成为CERNET2的核心节点之一。', '芙蓉隧道，白城，曾厝垵，沙坡尾', '[146055353243548.gif, 146055353244449.jpg, 146055353247250.JPG, 146055353249751.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc7d010007b', '厦门红楼', '厦门湖里区的华光路', '1996年9月，一座7层楼房拔地而起。红顶、红瓦、红墙、红窗、红门、红灯笼、红地毯，该着色的地方尽是红色。这也是闽南侨乡一带的习俗，红，代表吉利，代表发财。正因为这座楼外观尽是红色，到过此楼的人干脆称之为“红楼”', '一楼是接待厅。二楼是餐厅，附设四间厢房，桌餐椅一色是厦门红楼厦门红楼 (5张)名贵的红木。', '[146055363374352.jpg, 146055363376453.jpg, 146055363378654.jpg]', '0', '6.50000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fc8b5d5007c', '厦门方特', '厦门市同安区洪塘镇龙西一里', '是一个以高科技为主要表现形式的文化科技主题公园。坐落于美丽的海滨古城厦门●同安，是由深圳华强集团投资巨额兴建的大型高科技第四代主题公园。其最大特点是以科幻和互动体验为最大特色，将动漫卡通、电影特技等国际时尚娱乐元素与中国传统文化符号巧妙融合，创造出充满幻想和创意的神奇天地，被誉为“东方梦幻乐园”、“亚洲科幻神奇”。', '由[1]  飞越极限、决战金山寺、生命之光、宇宙博览会、魔法城堡、秦陵历险、丛林的故事、聊斋、唐古拉雪山、暴风眼、极地快车以及水世界等二十几个大型主题项目区组成，涵盖主题项目、游乐项目、休闲及景观项目数百项。', '[146055369252155.jpg, 146055369256856.jpg, 146055369259757.jpg, 146055369261458.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fcb59d5007d', '十里蓝山', '厦门灌口与长泰交界处', '十里蓝山位于厦门灌口与长泰交界处，距厦门市约45分钟车程，交通方便，区域位置优越。地处厦漳泉地理中心，闽南金三角旅游经济圈，地块四面环山，环境优美，被政府定为都市休闲区。', '十里蓝山由三大地块组成：天岳区、云岭区和寻梦谷旅游休闲区。总占地约11000亩，可开发面积约1000余亩，容积率为0.6。具有丰富的生态环境资源和山地资源；拥有原生森林，原生瓜果、珍稀动物等生态资源。', '[146055386554359.jpg, 146055386558260.jpg, 146055386562061.jpg, 146055386565762.jpg]', '0', '6.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fcca2f7007e', '天竺山', '厦门市郊区西北部的国营天竺山林场内', '天竺山森林公园总面积为2651公顷，森林覆盖率达到96.8%；乔木层树种以马尾松为主。[1] 区内山峰连绵起伏，大多在700米以上，最高峰天柱山海拔933米，次高峰仙灵旗海拔916米。', '天竺湖；两二湖；龙门寺；真寂寺；百竹园；浴龙桥', '[146055394983863.jpg, 146055394988264.jpg, 146055394991865.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fcd4302007f', '同安影视城', '厦门市同安区五显镇的东溪河西岸', '。是厦门同安旅游发展有限公司较有活力和极具生机的下属单位，为前远华集团投资兴建的仿古人造景观娱乐城，于1998年落成。作为福建省首家影视拍摄基地，这里曾经是《皇宫宝贝》、《开台英雄郑成功》、《施琅将军》、《褡裢王爷》等影视剧的拍摄基地。', '同安影视城是福建省首家影视拍摄基地，主要选取北京故宫的典型建筑即天安门、太和殿、养心殿、颐和园长廊、明清一条街作为基本建筑群体。老北京风情十足，是旅游娱乐、拍片摄影、休闲度假的好地方。', '[146055399080966.jpg, 146055399084167.jpg, 146055399086568.jpg, 146055399088969.jpg]', '0', '6.50000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fcdd3d90080', '厦门五老峰', '南普陀寺后面五个山头', '五老峰位于南普陀寺后面五个山头，峥嵘凌空，时有白云缭绕，云下丛林葱郁，隐约如垂长须，远远望去，好像是五位须发皆白、历尽人间沧桑的老人，翘首遥望茫茫大海。这就是厦门大八景之一\"五老凌霄\"胜景。五老峰，海拔184.8m，一般登顶需一个小时。', '五老峰山上，遍是相思树，也称\"台湾相思\"，由于相思树来自台湾，至今大陆和台湾的骨肉同胞对相思树都有特殊的感情。全国政协副主席胡子昂先生题赠南普陀寺字幅：\"观赏南普陀，缅怀日月潭\"，表达了全国人民希望台湾早日回归祖国，海峡两岸统一的愿望。', '[146055402791470.jpg, 146055402793871.jpg, 146055402795972.jpg, 146055402797873.jpg]', '0', '8.00000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fce67fe0081', '厦门中山路', '厦门岛 西南部', '是厦门市思明区中华街道的一条东西走向的道路。日据时代称为大汉路（1933年－1945年），中山路长约1.2公里，西起轮渡鹭江道，中跨思明南路与思明北路的分界点，东达新华路（即今厦门市公安局，原厦门市工人文化宫所在地）与公园南路相连。', '中山路全长1198米，宽15米，位于厦门市思明区繁华闹市，一头连着厦庇五洲客的宾馆大厦，一头连着门泊万倾涛的碧波大海，与海上花园“鼓浪屿”遥遥相望。中山路的骑楼街是厦门建筑文化的代表，这些建筑绝大部分是二十年代华侨回乡建造的，在我市的城市总体规划中已被列为旧城保护的重点。', '[146055406584174.jpg, 146055406586775.jpg, 146055406588376.jpg, 146055406590077.jpg]', '0', '6.50000');
INSERT INTO `t_way_view` VALUES ('40283f86540d98db01540fcf52620082', '萤火虫公园', '东林电子', '萤火虫主题公园每晚7点30分至9点30分免费向16岁以下的少年儿童开放，前来参观的少年儿童必须有至少一名监护人陪同，每天限额300名游客入园参观，需提前预约。成人单独不能入园。', '公园由萤火虫环保教室、萤火虫生态展览室和萤火虫实景观赏通道三部分组成。在萤火虫环保教室，小朋友们将会观看一段环保影片，了解萤火虫从卵到幼虫再到成虫的生长过程，以及环境恶化对萤火虫的影响。在生态展览室，孩子们可以用手触摸水生萤火虫。随后，在萤火虫姐姐的带领下，孩子们进入萤火虫观赏通道。这条木栈道没有明亮的路灯，只有脚底微弱的红光指示方向。走在通道上，孩子们可以看到树枝上、半空中、草丛里漫天繁星般的萤火虫。', '[146055412578678.jpg, 146055412582779.jpg, 146055412586480.jpg, 146055412589781.jpg]', '0', '8.00000');
