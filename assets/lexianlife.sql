/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : lexianlife

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 27/07/2020 18:27:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员用户名',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '管理员姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '管理员电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '管理员邮箱',
  `status` int(11) DEFAULT NULL COMMENT '账号可用状态',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='后台管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'suwen', '123', 'suwen', '11', '11@1.com', 1);
INSERT INTO `admin` VALUES (2, 'susie', '123', 'suwen', '11', '11@1.com', 1);
INSERT INTO `admin` VALUES (3, 'lunafreya', '123', 'suwen', '11', '11@1.com', 1);
INSERT INTO `admin` VALUES (4, 'katarina', '123', 'suwen', '11', '11@1.com', 1);
INSERT INTO `admin` VALUES (5, 'emily', '123', 'suwen', '11', '11@1.com', 1);
COMMIT;

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `adminlog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `admin_id` bigint(20) DEFAULT NULL COMMENT '管理员编号',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作名',
  `content` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作内容',
  `time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`adminlog_id`),
  KEY `FK_Relationship_22` (`admin_id`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员操作日志';

-- ----------------------------
-- Records of adminlog
-- ----------------------------
BEGIN;
INSERT INTO `adminlog` VALUES (1, 1, 'com.cqjtu.lexian.controller.manager.CustomreController.records()', '查看用户浏览记录', '2020-07-27 15:01:34');
INSERT INTO `adminlog` VALUES (2, 1, 'com.cqjtu.lexian.controller.manager.ProductController.newProduct()', '添加商品或修改', '2020-07-27 15:21:47');
INSERT INTO `adminlog` VALUES (3, 1, 'com.cqjtu.lexian.controller.manager.ProductController.newProduct()', '添加商品或修改', '2020-07-27 15:23:30');
INSERT INTO `adminlog` VALUES (4, 1, 'com.cqjtu.lexian.controller.manager.ProductController.newProduct()', '添加商品或修改', '2020-07-27 15:25:04');
INSERT INTO `adminlog` VALUES (5, 1, 'com.cqjtu.lexian.controller.manager.CustomreController.records()', '查看用户浏览记录', '2020-07-27 15:28:23');
INSERT INTO `adminlog` VALUES (6, 1, 'com.cqjtu.lexian.controller.manager.CustomreController.records()', '查看用户浏览记录', '2020-07-27 15:28:25');
INSERT INTO `adminlog` VALUES (7, 1, 'com.cqjtu.lexian.controller.manager.AdminController.login()', '登录', '2020-07-27 15:33:50');
INSERT INTO `adminlog` VALUES (8, 1, 'com.cqjtu.lexian.controller.manager.CustomreController.records()', '查看用户浏览记录', '2020-07-27 15:34:04');
INSERT INTO `adminlog` VALUES (9, 1, 'com.cqjtu.lexian.controller.manager.AdminController.login()', '登录', '2020-07-27 18:18:44');
INSERT INTO `adminlog` VALUES (10, 1, 'com.cqjtu.lexian.controller.manager.ProductController.newProduct()', '添加商品或修改', '2020-07-27 18:25:53');
COMMIT;

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `att_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '顾客编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`att_id`),
  KEY `FK_Relationship_23` (`goods_id`),
  KEY `FK_Relationship_7` (`cus_id`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品关注';

-- ----------------------------
-- Records of attention
-- ----------------------------
BEGIN;
INSERT INTO `attention` VALUES (19, 2, 711);
INSERT INTO `attention` VALUES (20, 2, 10010);
COMMIT;

-- ----------------------------
-- Table structure for browserecord
-- ----------------------------
DROP TABLE IF EXISTS `browserecord`;
CREATE TABLE `browserecord` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '浏览记录编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '顾客编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `time` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`record_id`),
  KEY `FK_Relationship_20` (`cus_id`),
  KEY `FK_Relationship_21` (`goods_id`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `FK_Relationship_21` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='浏览记录';

-- ----------------------------
-- Records of browserecord
-- ----------------------------
BEGIN;
INSERT INTO `browserecord` VALUES (1, 2, 7, '2020-07-23 10:13:33');
INSERT INTO `browserecord` VALUES (2, 2, 6, '2020-07-23 10:15:12');
INSERT INTO `browserecord` VALUES (3, 2, 7, '2020-07-23 10:15:48');
INSERT INTO `browserecord` VALUES (4, 2, 711, '2020-07-23 10:22:29');
INSERT INTO `browserecord` VALUES (5, 2, 3033, '2020-07-23 10:23:41');
INSERT INTO `browserecord` VALUES (6, 2, 2997, '2020-07-23 10:23:46');
INSERT INTO `browserecord` VALUES (7, 2, 371, '2020-07-23 10:32:10');
INSERT INTO `browserecord` VALUES (8, 2, 13, '2020-07-23 10:32:59');
INSERT INTO `browserecord` VALUES (9, 2, 711, '2020-07-23 15:07:58');
INSERT INTO `browserecord` VALUES (10, 2, 7, '2020-07-25 15:15:01');
INSERT INTO `browserecord` VALUES (11, 2, 5, '2020-07-25 15:15:07');
INSERT INTO `browserecord` VALUES (12, 2, 711, '2020-07-25 15:15:11');
INSERT INTO `browserecord` VALUES (13, 2, 75, '2020-07-25 15:19:00');
INSERT INTO `browserecord` VALUES (14, 2, 76, '2020-07-25 15:19:06');
INSERT INTO `browserecord` VALUES (15, 2, 78, '2020-07-25 15:19:09');
INSERT INTO `browserecord` VALUES (16, 2, 542, '2020-07-25 15:19:43');
INSERT INTO `browserecord` VALUES (17, 2, 546, '2020-07-25 15:20:07');
INSERT INTO `browserecord` VALUES (18, 2, 1, '2020-07-25 15:20:18');
INSERT INTO `browserecord` VALUES (19, 2, 711, '2020-07-25 15:20:41');
INSERT INTO `browserecord` VALUES (20, 2, 712, '2020-07-25 15:42:30');
INSERT INTO `browserecord` VALUES (21, 2, 1, '2020-07-25 15:43:44');
INSERT INTO `browserecord` VALUES (22, 2, 2, '2020-07-25 15:43:53');
INSERT INTO `browserecord` VALUES (23, 2, 13, '2020-07-25 15:44:34');
INSERT INTO `browserecord` VALUES (24, 2, 541, '2020-07-25 15:45:18');
INSERT INTO `browserecord` VALUES (25, 2, 13, '2020-07-25 15:46:08');
INSERT INTO `browserecord` VALUES (26, 2, 711, '2020-07-25 16:06:52');
INSERT INTO `browserecord` VALUES (27, 2, 711, '2020-07-26 10:29:04');
INSERT INTO `browserecord` VALUES (28, 2, 7, '2020-07-26 10:29:12');
INSERT INTO `browserecord` VALUES (29, 2, 13, '2020-07-26 10:29:16');
INSERT INTO `browserecord` VALUES (30, 2, 1, '2020-07-26 10:29:19');
INSERT INTO `browserecord` VALUES (31, 2, 1, '2020-07-26 10:29:48');
INSERT INTO `browserecord` VALUES (32, 2, 49, '2020-07-26 10:29:54');
INSERT INTO `browserecord` VALUES (33, 2, 25, '2020-07-26 10:29:59');
INSERT INTO `browserecord` VALUES (34, 2, 37, '2020-07-26 10:30:02');
INSERT INTO `browserecord` VALUES (35, 2, 73, '2020-07-26 10:30:05');
INSERT INTO `browserecord` VALUES (36, 2, 13, '2020-07-26 10:30:27');
INSERT INTO `browserecord` VALUES (37, 2, 14, '2020-07-26 10:30:31');
INSERT INTO `browserecord` VALUES (38, 2, 711, '2020-07-26 10:58:29');
INSERT INTO `browserecord` VALUES (39, 2, 1, '2020-07-26 10:58:36');
INSERT INTO `browserecord` VALUES (40, 2, 12, '2020-07-26 10:58:42');
INSERT INTO `browserecord` VALUES (41, 2, 13, '2020-07-26 10:58:51');
INSERT INTO `browserecord` VALUES (42, 2, 14, '2020-07-26 10:58:57');
INSERT INTO `browserecord` VALUES (43, 2, 128, '2020-07-26 10:59:01');
INSERT INTO `browserecord` VALUES (44, 2, 199, '2020-07-26 10:59:09');
INSERT INTO `browserecord` VALUES (45, 2, 711, '2020-07-26 14:22:51');
INSERT INTO `browserecord` VALUES (46, 2, 1, '2020-07-26 14:23:24');
INSERT INTO `browserecord` VALUES (47, 2, 711, '2020-07-26 14:30:20');
INSERT INTO `browserecord` VALUES (48, 2, 37, '2020-07-26 14:30:33');
INSERT INTO `browserecord` VALUES (49, 2, 711, '2020-07-26 15:11:32');
INSERT INTO `browserecord` VALUES (50, 2, 1, '2020-07-26 15:11:35');
INSERT INTO `browserecord` VALUES (53, 2, 711, '2020-07-26 15:15:31');
INSERT INTO `browserecord` VALUES (54, 2, 1, '2020-07-26 15:15:34');
INSERT INTO `browserecord` VALUES (58, 2, 1, '2020-07-26 15:27:44');
INSERT INTO `browserecord` VALUES (60, 2, 711, '2020-07-26 15:33:07');
INSERT INTO `browserecord` VALUES (61, 2, 1, '2020-07-26 15:33:10');
INSERT INTO `browserecord` VALUES (64, 2, 711, '2020-07-26 17:21:35');
INSERT INTO `browserecord` VALUES (65, 2, 711, '2020-07-26 17:22:22');
INSERT INTO `browserecord` VALUES (66, 2, 711, '2020-07-26 17:22:39');
INSERT INTO `browserecord` VALUES (67, 2, 711, '2020-07-26 17:26:57');
INSERT INTO `browserecord` VALUES (68, 2, 711, '2020-07-26 17:39:07');
INSERT INTO `browserecord` VALUES (70, 2, 10010, '2020-07-26 18:12:13');
INSERT INTO `browserecord` VALUES (71, 2, 711, '2020-07-26 18:13:27');
INSERT INTO `browserecord` VALUES (72, 2, 366, '2020-07-26 18:14:05');
INSERT INTO `browserecord` VALUES (73, 2, 711, '2020-07-26 19:09:39');
INSERT INTO `browserecord` VALUES (74, 2, 10010, '2020-07-26 19:13:13');
INSERT INTO `browserecord` VALUES (75, 2, 10010, '2020-07-26 19:17:16');
INSERT INTO `browserecord` VALUES (76, 2, 10010, '2020-07-26 19:24:44');
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cus_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_Relationship_13` (`cus_id`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES (1, 2);
INSERT INTO `cart` VALUES (2, 3);
COMMIT;

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartitem_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车商品项编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `cart_id` bigint(20) DEFAULT NULL COMMENT '购物车编号',
  `num` double NOT NULL COMMENT '商品数量',
  `selected` tinyint(1) DEFAULT NULL COMMENT '是否选中',
  PRIMARY KEY (`cartitem_id`),
  KEY `FK_Relationship_10` (`goods_id`),
  KEY `FK_Relationship_9` (`cart_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车商品项';

-- ----------------------------
-- Records of cartitem
-- ----------------------------
BEGIN;
INSERT INTO `cartitem` VALUES (57, 10010, 1, 1, 1);
INSERT INTO `cartitem` VALUES (58, 366, 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catalog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品目录编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品目录名',
  `des` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品目录描述',
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品目录图',
  `status` int(11) DEFAULT NULL COMMENT '商品目录可用状态',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品目录';

-- ----------------------------
-- Records of catalog
-- ----------------------------
BEGIN;
INSERT INTO `catalog` VALUES (1, '特色食品', '食遍天下', '../../img/goodsImg/特色食品.png', 1);
INSERT INTO `catalog` VALUES (2, '美容美体', '你的美丽，无可比拟', '../../img/goodsImg/美容美体.png', 1);
INSERT INTO `catalog` VALUES (3, '手机数码', '顶尖科技打造便捷生活', '../../img/goodsImg/手机数码.png', 1);
INSERT INTO `catalog` VALUES (4, '潮流服饰', '穿出你的时尚', '../../img/goodsImg/潮流服饰.png', 1);
INSERT INTO `catalog` VALUES (5, '家居饰品', '爱美丽更爱家', '../../img/goodsImg/家居饰品.png', 1);
INSERT INTO `catalog` VALUES (6, '图书音像', '每天看一点书，每天都会不同', '../../img/goodsImg/图书音像.png', 1);
INSERT INTO `catalog` VALUES (7, '汽车用品', '爱车就给它更好的', '../../img/goodsImg/汽车用品.png', 1);
INSERT INTO `catalog` VALUES (8, '母婴玩具', '您的舒适安全，我们的责任', '../../img/goodsImg/母婴玩具.png', 1);
INSERT INTO `catalog` VALUES (9, '名鞋箱包', '鞋走天下，包行万里', '../../img/goodsImg/名鞋箱包.png', 1);
INSERT INTO `catalog` VALUES (10, '奢侈礼品', '亲戚好友拜访必备', '../../img/goodsImg/奢侈礼品.png', 1);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品大类编号',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '商品大类所属目录编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品大类名',
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_1` (`catalog_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catalog_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品大类';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 9, '运动鞋');
INSERT INTO `category` VALUES (2, 9, '皮鞋');
INSERT INTO `category` VALUES (3, 9, '板鞋');
INSERT INTO `category` VALUES (4, 9, '正装鞋');
INSERT INTO `category` VALUES (5, 9, '帆布鞋');
INSERT INTO `category` VALUES (6, 9, '拖鞋');
INSERT INTO `category` VALUES (7, 9, '凉鞋');
INSERT INTO `category` VALUES (8, 9, '跑鞋');
INSERT INTO `category` VALUES (9, 9, '网面鞋');
INSERT INTO `category` VALUES (10, 9, '豆豆鞋');
INSERT INTO `category` VALUES (11, 9, '登山鞋');
INSERT INTO `category` VALUES (12, 9, '足球鞋');
INSERT INTO `category` VALUES (13, 9, '篮球鞋');
INSERT INTO `category` VALUES (14, 9, '童鞋');
INSERT INTO `category` VALUES (15, 9, '军鞋');
INSERT INTO `category` VALUES (16, 9, '公文箱');
INSERT INTO `category` VALUES (17, 9, '手提箱');
INSERT INTO `category` VALUES (18, 9, '皮票夹');
INSERT INTO `category` VALUES (19, 9, '行李箱');
INSERT INTO `category` VALUES (20, 9, '公事包');
INSERT INTO `category` VALUES (21, 9, '钱包');
INSERT INTO `category` VALUES (22, 9, '化妆包');
INSERT INTO `category` VALUES (23, 9, '手提包');
INSERT INTO `category` VALUES (24, 9, '单肩包');
INSERT INTO `category` VALUES (25, 9, '双肩包');
INSERT INTO `category` VALUES (26, 9, '斜挎包');
INSERT INTO `category` VALUES (27, 9, '腰包');
INSERT INTO `category` VALUES (28, 9, '腕包');
INSERT INTO `category` VALUES (29, 9, '晚装包');
INSERT INTO `category` VALUES (30, 9, '多功能包');
INSERT INTO `category` VALUES (31, 6, '小说');
INSERT INTO `category` VALUES (32, 6, '文学');
INSERT INTO `category` VALUES (33, 6, '青春');
INSERT INTO `category` VALUES (34, 6, '动漫');
INSERT INTO `category` VALUES (35, 6, '儿童文学');
INSERT INTO `category` VALUES (36, 6, '教材');
INSERT INTO `category` VALUES (37, 6, '人文社科');
INSERT INTO `category` VALUES (38, 6, '经济');
INSERT INTO `category` VALUES (39, 6, '管理');
INSERT INTO `category` VALUES (40, 6, '育儿');
INSERT INTO `category` VALUES (41, 6, '健身保健');
INSERT INTO `category` VALUES (42, 6, '美食烹饪');
INSERT INTO `category` VALUES (43, 6, '旅游地图');
INSERT INTO `category` VALUES (44, 6, '绘画');
INSERT INTO `category` VALUES (45, 6, '书法');
INSERT INTO `category` VALUES (46, 6, '摄影');
INSERT INTO `category` VALUES (47, 6, '设计');
INSERT INTO `category` VALUES (48, 6, '科普');
INSERT INTO `category` VALUES (49, 6, '心理学');
INSERT INTO `category` VALUES (50, 6, '计算机');
INSERT INTO `category` VALUES (51, 6, '医学');
INSERT INTO `category` VALUES (52, 6, '建筑');
INSERT INTO `category` VALUES (53, 6, '工业');
INSERT INTO `category` VALUES (54, 6, '原版书');
INSERT INTO `category` VALUES (55, 6, '杂志期刊');
INSERT INTO `category` VALUES (56, 6, '电子书');
INSERT INTO `category` VALUES (57, 6, '音乐');
INSERT INTO `category` VALUES (58, 6, '影视');
INSERT INTO `category` VALUES (59, 6, '教育音像');
INSERT INTO `category` VALUES (60, 6, '游戏');
INSERT INTO `category` VALUES (61, 10, '腕表');
INSERT INTO `category` VALUES (62, 10, '钢笔');
INSERT INTO `category` VALUES (63, 10, '手机');
INSERT INTO `category` VALUES (64, 10, '打火机');
INSERT INTO `category` VALUES (65, 10, '时装');
INSERT INTO `category` VALUES (66, 10, '珠宝');
INSERT INTO `category` VALUES (67, 10, '跑车');
INSERT INTO `category` VALUES (68, 10, '游艇');
INSERT INTO `category` VALUES (69, 10, '箱包');
INSERT INTO `category` VALUES (70, 10, '葡萄酒');
INSERT INTO `category` VALUES (71, 5, '相框');
INSERT INTO `category` VALUES (72, 5, '镜子');
INSERT INTO `category` VALUES (73, 5, '妆台');
INSERT INTO `category` VALUES (74, 5, '床垫');
INSERT INTO `category` VALUES (75, 5, '床品');
INSERT INTO `category` VALUES (76, 5, '床头柜');
INSERT INTO `category` VALUES (77, 5, '茶具');
INSERT INTO `category` VALUES (78, 5, '花瓶');
INSERT INTO `category` VALUES (79, 5, '餐桌');
INSERT INTO `category` VALUES (80, 5, '餐椅');
INSERT INTO `category` VALUES (81, 5, '挂钩');
INSERT INTO `category` VALUES (82, 5, '浴缸');
INSERT INTO `category` VALUES (83, 5, '餐具');
INSERT INTO `category` VALUES (84, 5, '刀具');
INSERT INTO `category` VALUES (85, 5, '烹饪用具');
INSERT INTO `category` VALUES (86, 5, '灯饰');
INSERT INTO `category` VALUES (87, 5, '地毯');
INSERT INTO `category` VALUES (88, 5, '鞋柜');
INSERT INTO `category` VALUES (89, 5, '书桌');
INSERT INTO `category` VALUES (90, 5, '转椅');
INSERT INTO `category` VALUES (91, 5, '衣柜');
INSERT INTO `category` VALUES (92, 5, '墙面贴饰');
INSERT INTO `category` VALUES (93, 5, '书架');
INSERT INTO `category` VALUES (94, 5, '电视柜');
INSERT INTO `category` VALUES (95, 5, '杂物收纳');
INSERT INTO `category` VALUES (96, 5, '家庭清洁');
INSERT INTO `category` VALUES (97, 5, '卫浴套件');
INSERT INTO `category` VALUES (98, 5, '餐具柜');
INSERT INTO `category` VALUES (99, 5, '保险柜');
INSERT INTO `category` VALUES (100, 5, '沙发');
INSERT INTO `category` VALUES (101, 3, '智能手机');
INSERT INTO `category` VALUES (102, 3, '功能机');
INSERT INTO `category` VALUES (103, 3, '笔记本');
INSERT INTO `category` VALUES (104, 3, '台式机');
INSERT INTO `category` VALUES (105, 3, '平板电脑');
INSERT INTO `category` VALUES (106, 3, '游戏主机');
INSERT INTO `category` VALUES (107, 3, '游戏掌机');
INSERT INTO `category` VALUES (108, 3, '照相机');
INSERT INTO `category` VALUES (109, 3, '数字电视');
INSERT INTO `category` VALUES (110, 3, '摄像机');
INSERT INTO `category` VALUES (111, 3, '电纸书');
INSERT INTO `category` VALUES (112, 3, '电子词典');
INSERT INTO `category` VALUES (113, 3, '无人机');
INSERT INTO `category` VALUES (114, 3, '智能家居');
INSERT INTO `category` VALUES (115, 3, '智能手表');
INSERT INTO `category` VALUES (116, 3, '运动手环');
INSERT INTO `category` VALUES (117, 3, '路由器');
INSERT INTO `category` VALUES (118, 3, '移动电源');
INSERT INTO `category` VALUES (119, 3, '音响');
INSERT INTO `category` VALUES (120, 3, '麦克风');
INSERT INTO `category` VALUES (121, 3, 'hifi耳机');
INSERT INTO `category` VALUES (122, 3, 'VR');
INSERT INTO `category` VALUES (123, 3, 'MP3/MP4');
INSERT INTO `category` VALUES (124, 3, '扫描仪');
INSERT INTO `category` VALUES (125, 3, '摄像头');
INSERT INTO `category` VALUES (126, 3, '显示器');
INSERT INTO `category` VALUES (127, 3, '硬盘');
INSERT INTO `category` VALUES (128, 3, '录音笔');
INSERT INTO `category` VALUES (129, 3, '机顶盒');
INSERT INTO `category` VALUES (130, 3, 'U盘');
INSERT INTO `category` VALUES (131, 8, '连体衣');
INSERT INTO `category` VALUES (132, 8, '亲子装');
INSERT INTO `category` VALUES (133, 8, '婴儿礼盒');
INSERT INTO `category` VALUES (134, 8, '反穿衣');
INSERT INTO `category` VALUES (135, 8, '肚兜');
INSERT INTO `category` VALUES (136, 8, '学步鞋');
INSERT INTO `category` VALUES (137, 8, '亲子鞋');
INSERT INTO `category` VALUES (138, 8, '婴儿推车');
INSERT INTO `category` VALUES (139, 8, '学步车');
INSERT INTO `category` VALUES (140, 8, '安全座椅');
INSERT INTO `category` VALUES (141, 8, '婴儿背带');
INSERT INTO `category` VALUES (142, 8, '腰凳');
INSERT INTO `category` VALUES (143, 8, '婴儿床');
INSERT INTO `category` VALUES (144, 8, '餐椅');
INSERT INTO `category` VALUES (145, 8, '睡袋');
INSERT INTO `category` VALUES (146, 8, '抱被');
INSERT INTO `category` VALUES (147, 8, '奶瓶');
INSERT INTO `category` VALUES (148, 8, '奶嘴');
INSERT INTO `category` VALUES (149, 8, '辅食机');
INSERT INTO `category` VALUES (150, 8, '调奶器');
INSERT INTO `category` VALUES (151, 8, '暖奶器');
INSERT INTO `category` VALUES (152, 8, '围嘴');
INSERT INTO `category` VALUES (153, 8, '婴儿玩具');
INSERT INTO `category` VALUES (154, 8, '儿童自行车');
INSERT INTO `category` VALUES (155, 8, '纸尿裤');
INSERT INTO `category` VALUES (156, 8, '纸尿片');
INSERT INTO `category` VALUES (157, 8, '孕妈装');
INSERT INTO `category` VALUES (158, 8, '月子服');
INSERT INTO `category` VALUES (159, 8, '哺乳文胸');
INSERT INTO `category` VALUES (160, 8, '待产包');
INSERT INTO `category` VALUES (161, 7, '汽车脚垫');
INSERT INTO `category` VALUES (162, 7, '专用坐垫');
INSERT INTO `category` VALUES (163, 7, '专用座套');
INSERT INTO `category` VALUES (164, 7, '合成机油');
INSERT INTO `category` VALUES (165, 7, '轮胎');
INSERT INTO `category` VALUES (166, 7, '行车记录仪');
INSERT INTO `category` VALUES (167, 7, '安全预警仪');
INSERT INTO `category` VALUES (168, 7, '后视镜导航');
INSERT INTO `category` VALUES (169, 7, '便携式导航');
INSERT INTO `category` VALUES (170, 7, 'GPS定位');
INSERT INTO `category` VALUES (171, 7, '空气净化器');
INSERT INTO `category` VALUES (172, 7, '车载冰箱');
INSERT INTO `category` VALUES (173, 7, '车载MP3');
INSERT INTO `category` VALUES (174, 7, '手机充电器');
INSERT INTO `category` VALUES (175, 7, '车载蓝牙');
INSERT INTO `category` VALUES (176, 7, '方向盘套');
INSERT INTO `category` VALUES (177, 7, '尾箱垫');
INSERT INTO `category` VALUES (178, 7, '充气泵');
INSERT INTO `category` VALUES (179, 7, '安全锤');
INSERT INTO `category` VALUES (180, 7, '雨刮器');
INSERT INTO `category` VALUES (181, 7, '空调滤芯');
INSERT INTO `category` VALUES (182, 7, '机油滤芯');
INSERT INTO `category` VALUES (183, 7, '空气滤芯');
INSERT INTO `category` VALUES (184, 7, '刹车片');
INSERT INTO `category` VALUES (185, 7, '火花塞');
INSERT INTO `category` VALUES (186, 7, '汽车贴膜');
INSERT INTO `category` VALUES (187, 7, '装饰灯');
INSERT INTO `category` VALUES (188, 7, '车顶架');
INSERT INTO `category` VALUES (189, 7, '车顶箱');
INSERT INTO `category` VALUES (190, 7, '太阳膜');
INSERT INTO `category` VALUES (191, 4, '短袖T恤');
INSERT INTO `category` VALUES (192, 4, '短袖衬衫');
INSERT INTO `category` VALUES (193, 4, '修身夹克');
INSERT INTO `category` VALUES (194, 4, '潮流卫衣');
INSERT INTO `category` VALUES (195, 4, '束脚裤');
INSERT INTO `category` VALUES (196, 4, '九分裤');
INSERT INTO `category` VALUES (197, 4, '破洞牛仔裤');
INSERT INTO `category` VALUES (198, 4, '棒球服');
INSERT INTO `category` VALUES (199, 4, '西服套装');
INSERT INTO `category` VALUES (200, 4, '羽绒服');
INSERT INTO `category` VALUES (201, 4, '休闲裤');
INSERT INTO `category` VALUES (202, 4, '西裤');
INSERT INTO `category` VALUES (203, 4, 'POLO衫');
INSERT INTO `category` VALUES (204, 4, '针织衫');
INSERT INTO `category` VALUES (205, 4, '针织裤');
INSERT INTO `category` VALUES (206, 4, '气质连衣裙');
INSERT INTO `category` VALUES (207, 4, '印花衬衫');
INSERT INTO `category` VALUES (208, 4, '蕾丝连衣裙');
INSERT INTO `category` VALUES (209, 4, '真丝连衣裙');
INSERT INTO `category` VALUES (210, 4, '百褶裙');
INSERT INTO `category` VALUES (211, 4, '背心裙');
INSERT INTO `category` VALUES (212, 4, 'a字裙');
INSERT INTO `category` VALUES (213, 4, '棉麻连衣裙');
INSERT INTO `category` VALUES (214, 4, '包臀裙');
INSERT INTO `category` VALUES (215, 4, '长袖连衣裙');
INSERT INTO `category` VALUES (216, 4, '小脚裤');
INSERT INTO `category` VALUES (217, 4, '哈伦裤');
INSERT INTO `category` VALUES (218, 4, '优雅旗袍');
INSERT INTO `category` VALUES (219, 4, '背带裤');
INSERT INTO `category` VALUES (220, 4, '精致礼服');
INSERT INTO `category` VALUES (221, 1, '巧克力');
INSERT INTO `category` VALUES (222, 1, '坚果');
INSERT INTO `category` VALUES (223, 1, '饼干');
INSERT INTO `category` VALUES (224, 1, '蛋糕');
INSERT INTO `category` VALUES (225, 1, '糖果');
INSERT INTO `category` VALUES (226, 1, '曲奇');
INSERT INTO `category` VALUES (227, 1, '海苔');
INSERT INTO `category` VALUES (228, 1, '肉松饼');
INSERT INTO `category` VALUES (229, 1, '牛肉干');
INSERT INTO `category` VALUES (230, 1, '鱿鱼丝');
INSERT INTO `category` VALUES (231, 1, '蜜饯');
INSERT INTO `category` VALUES (232, 1, '鸭脖');
INSERT INTO `category` VALUES (233, 1, '豆干');
INSERT INTO `category` VALUES (234, 1, '啤酒');
INSERT INTO `category` VALUES (235, 1, '葡萄酒');
INSERT INTO `category` VALUES (236, 1, '西湖龙井');
INSERT INTO `category` VALUES (237, 1, '大红袍');
INSERT INTO `category` VALUES (238, 1, '铁观音');
INSERT INTO `category` VALUES (239, 1, '普洱茶');
INSERT INTO `category` VALUES (240, 1, '红茶');
INSERT INTO `category` VALUES (241, 1, '牛奶');
INSERT INTO `category` VALUES (242, 1, '酸奶');
INSERT INTO `category` VALUES (243, 1, '咖啡');
INSERT INTO `category` VALUES (244, 1, '麦片');
INSERT INTO `category` VALUES (245, 1, '奶茶');
INSERT INTO `category` VALUES (246, 1, '柚子茶');
INSERT INTO `category` VALUES (247, 1, '果汁');
INSERT INTO `category` VALUES (248, 1, '桂圆干');
INSERT INTO `category` VALUES (249, 1, '香肠');
INSERT INTO `category` VALUES (250, 1, '寿司');
INSERT INTO `category` VALUES (251, 2, '乳液面霜');
INSERT INTO `category` VALUES (252, 2, '精华液');
INSERT INTO `category` VALUES (253, 2, '护手霜');
INSERT INTO `category` VALUES (254, 2, '爽肤水');
INSERT INTO `category` VALUES (255, 2, '洁面眼霜');
INSERT INTO `category` VALUES (256, 2, '身体乳');
INSERT INTO `category` VALUES (257, 2, '精油芳疗');
INSERT INTO `category` VALUES (258, 2, '香水');
INSERT INTO `category` VALUES (259, 2, 'BB霜');
INSERT INTO `category` VALUES (260, 2, '口红');
INSERT INTO `category` VALUES (261, 2, '粉底');
INSERT INTO `category` VALUES (262, 2, '粉饼');
INSERT INTO `category` VALUES (263, 2, '指甲油');
INSERT INTO `category` VALUES (264, 2, '眉笔');
INSERT INTO `category` VALUES (265, 2, '睫毛膏');
INSERT INTO `category` VALUES (266, 2, '洗发水');
INSERT INTO `category` VALUES (267, 2, '护发素');
INSERT INTO `category` VALUES (268, 2, '发膜');
INSERT INTO `category` VALUES (269, 2, '面膜');
INSERT INTO `category` VALUES (270, 2, '护发精油');
INSERT INTO `category` VALUES (271, 2, '弹力素');
INSERT INTO `category` VALUES (272, 2, '染发霜');
INSERT INTO `category` VALUES (273, 2, '面部喷雾');
INSERT INTO `category` VALUES (274, 2, '漱口水');
INSERT INTO `category` VALUES (275, 2, '口气清新剂');
INSERT INTO `category` VALUES (276, 2, '沐浴露');
INSERT INTO `category` VALUES (277, 2, '香皂');
INSERT INTO `category` VALUES (278, 2, '洗手液');
INSERT INTO `category` VALUES (279, 2, '手动剃须刀');
INSERT INTO `category` VALUES (280, 2, '卫生棉条');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品评论编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '顾客编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `content` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品评论内容',
  `score` int(11) DEFAULT NULL COMMENT '商品评论分数',
  `time` datetime DEFAULT NULL COMMENT '商品评论时间',
  PRIMARY KEY (`comment_id`),
  KEY `FK_Relationship_4` (`goods_id`),
  KEY `FK_Relationship_6` (`cus_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品评论';

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, 2, 1, '东西不错，用着很舒服，给个赞', 5, '2017-09-22 11:26:53');
INSERT INTO `comment` VALUES (2, 2, 1, '质量不错', 4, '2017-09-22 14:39:32');
INSERT INTO `comment` VALUES (3, 2, 1, '也还行吧', 3, '2017-09-22 14:40:01');
INSERT INTO `comment` VALUES (4, 2, 1, '还行吧', 3, '2017-09-22 14:40:19');
INSERT INTO `comment` VALUES (5, 2, 1, '只能说还凑合', 2, '2017-09-22 14:40:56');
INSERT INTO `comment` VALUES (6, 2, 1, '太差了，再也不买这款了', 0, '2017-09-22 14:41:32');
INSERT INTO `comment` VALUES (7, 2, 1, '此用户未留下任何评论', 5, '2017-09-21 14:48:21');
INSERT INTO `comment` VALUES (8, 2, 1, '东西不错，用着很舒服，给个赞', 5, '2017-09-22 11:26:53');
INSERT INTO `comment` VALUES (9, 2, 1, '质量不错', 4, '2017-09-22 14:39:32');
INSERT INTO `comment` VALUES (10, 2, 1, '也还行吧', 3, '2017-09-22 14:40:01');
INSERT INTO `comment` VALUES (11, 2, 1, '还行吧', 3, '2017-09-22 14:40:19');
INSERT INTO `comment` VALUES (12, 2, 1, '只能说还凑合', 2, '2017-09-22 14:40:56');
INSERT INTO `comment` VALUES (13, 2, 1, '太差了，再也不买这款了', 0, '2017-09-22 14:41:32');
INSERT INTO `comment` VALUES (14, 2, 1, '此用户未留下任何评论', 5, '2017-09-21 14:48:21');
INSERT INTO `comment` VALUES (15, 2, 1, '东西不错，用着很舒服，给个赞', 5, '2017-09-22 11:26:53');
INSERT INTO `comment` VALUES (16, 2, 1, '质量不错', 4, '2017-09-22 14:39:32');
INSERT INTO `comment` VALUES (17, 2, 1, '也还行吧', 3, '2017-09-22 14:40:01');
INSERT INTO `comment` VALUES (18, 2, 1, '还行吧', 3, '2017-09-22 14:40:19');
INSERT INTO `comment` VALUES (19, 2, 1, '只能说还凑合', 2, '2017-09-22 14:40:56');
INSERT INTO `comment` VALUES (20, 2, 1, '太差了，再也不买这款了', 0, '2017-09-22 14:41:32');
INSERT INTO `comment` VALUES (21, 2, 1, '此用户未留下任何评论', 5, '2017-09-21 14:48:21');
INSERT INTO `comment` VALUES (22, 2, 711, '宝贝不错', 4, '2020-07-26 17:26:10');
INSERT INTO `comment` VALUES (23, 2, 7, '牛逼', 4, '2020-07-26 17:28:19');
INSERT INTO `comment` VALUES (26, 2, 711, '那是真的牛逼', 3, '2020-07-26 17:58:54');
INSERT INTO `comment` VALUES (28, 2, 10010, '真的牛批', 3, '2020-07-26 19:14:07');
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cus_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '顾客编号',
  `headimg` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客头像',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客用户名',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客呢称',
  `realname` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客姓名',
  `sex` int(11) DEFAULT NULL COMMENT '顾客性别',
  `birth` datetime DEFAULT NULL COMMENT '顾客生日',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客电话',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '顾客邮箱',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '顾客密码',
  `status` int(11) DEFAULT NULL COMMENT '账号可用状态',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='顾客';

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (2, '../../../img/headImg/xiaobing.jpg', 'suwen', '好想淋雨', '苏雯', 1, '2020-02-06 00:00:00', '15112345678', '123@123.com', '123', 1);
INSERT INTO `customer` VALUES (3, '../../../img/headImg/xiaoming.jpg', 'suise', '做啡', '苏雯', 1, '2020-02-06 10:37:50', '15112345678', '123@123.com', '123', 1);
INSERT INTO `customer` VALUES (5, '../../../img/headImg/xiaobing.jpg', 'lunafreya', '一人徘徊', '苏雯', 1, '2020-02-06 00:00:00', '15112345678', '123@123.com', '123', 1);
INSERT INTO `customer` VALUES (6, '../../../img/headImg/xiaobing.jpg', 'katarina', '轻烟薄雾', '苏雯', 1, '2020-02-06 00:00:00', '15112345678', '123@123.com', '123', 1);
INSERT INTO `customer` VALUES (7, '../../../img/headImg/xiaobing.jpg', 'emily', '三十岁前不早恋', '苏雯', 1, '2020-02-06 00:00:00', '15112345678', '123@123.com', '123', 1);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `category_id` bigint(20) DEFAULT NULL COMMENT '所属类别',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品图',
  `unit_price` double NOT NULL COMMENT '商品单价',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品计量单位',
  `status` int(11) DEFAULT NULL COMMENT '商品状态',
  `weight` double DEFAULT NULL COMMENT '商品重量',
  `onsale_time` datetime DEFAULT NULL COMMENT '商品销售时间',
  `inventory` double DEFAULT NULL COMMENT '商品库存',
  `sale_count` int(11) DEFAULT '0' COMMENT '商品已销售数量',
  PRIMARY KEY (`goods_id`),
  KEY `FK_Reference_19` (`category_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品信息';

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (1, 1, '墨季2020秋季新款男士休闲运动鞋', '../../img/goodsImg/1.jpg', 118, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2, 1, 'NEW BALANCE WRL247SC运动鞋', '../../img/goodsImg/2.jpg', 479, '双', 0, 1, '2020-02-06 00:00:00', 100, 1);
INSERT INTO `goods` VALUES (3, 1, '乔丹 男鞋跑步鞋减震轻便运动鞋', '../../img/goodsImg/3.jpg', 159, '双', 0, 1, '2020-02-06 00:00:00', 100, 2);
INSERT INTO `goods` VALUES (4, 1, '鸿星尔克男鞋运动鞋网面透气', '../../img/goodsImg/4.jpg', 149, '双', 0, 1, '2020-02-06 00:00:00', 100, 3);
INSERT INTO `goods` VALUES (5, 1, '耐克NIKE 男子 跑步鞋 FLEX EXPERIENCE RN', '../../img/goodsImg/5.jpg', 399, '双', 0, 1, '2020-02-06 00:00:00', 100, 4);
INSERT INTO `goods` VALUES (6, 1, 'Mizuno美津浓 缓冲跑步鞋', '../../img/goodsImg/6.jpg', 279, '双', 0, 1, '2020-02-06 00:00:00', 100, 5);
INSERT INTO `goods` VALUES (7, 1, 'NIKE耐克男鞋2020新款AIR ZOOM气垫运动鞋', '../../img/goodsImg/7.jpg', 419, '双', 0, 1, '2020-02-06 00:00:00', 100, 7);
INSERT INTO `goods` VALUES (8, 1, '开学季男士跑步鞋运动鞋', '../../img/goodsImg/8.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (9, 1, '毅途运动鞋', '../../img/goodsImg/9.jpg', 139, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (10, 1, 'Kappa卡帕男女同款运动跑鞋', '../../img/goodsImg/10.jpg', 259, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (11, 1, '匹克 运动鞋', '../../img/goodsImg/11.jpg', 149, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (12, 1, 'NNP 运动鞋男鞋夏季透气跑步鞋', '../../img/goodsImg/12.jpg', 79, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (13, 2, '花花公子皮鞋', '../../img/goodsImg/13.jpg', 288, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (14, 2, '马克狐狸（Makehuli)皮鞋', '../../img/goodsImg/14.jpg', 146, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (15, 2, '奥康 男士皮鞋男鞋', '../../img/goodsImg/15.jpg', 219, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (16, 2, '策乐 皮鞋男2020新款商务', '../../img/goodsImg/16.jpg', 179, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (17, 2, '罗伦邦帅商务休闲皮鞋', '../../img/goodsImg/17.jpg', 99, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (18, 2, '罗伦邦帅商务休闲皮鞋', '../../img/goodsImg/18.jpg', 359, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (19, 2, '科悍 时尚皮鞋布洛克雕花男士皮鞋', '../../img/goodsImg/19.jpg', 199, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (20, 2, '富贵鸟皮鞋商务休闲鞋', '../../img/goodsImg/20.jpg', 228, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (21, 2, '卡络门德皮鞋男士商务休闲', '../../img/goodsImg/21.jpg', 168, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (22, 2, '度绱古琪皮鞋', '../../img/goodsImg/22.jpg', 158, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (23, 2, '士格诚品皮鞋男2020秋季新款', '../../img/goodsImg/23.jpg', 99, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (24, 2, '卡帝乐鳄鱼皮鞋', '../../img/goodsImg/24.jpg', 299, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (25, 3, '墨季 2020夏季新款帆布鞋低帮男士板鞋', '../../img/goodsImg/25.jpg', 89, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (26, 3, '安踏板鞋', '../../img/goodsImg/26.jpg', 169, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (27, 3, '李宁板鞋', '../../img/goodsImg/27.jpg', 159, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (28, 3, 'NIKE空军一号低帮运动休闲板鞋 ', '../../img/goodsImg/28.jpg', 769, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (29, 3, '空军一号低帮运动休闲板鞋', '../../img/goodsImg/29.jpg', 299, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (30, 3, '骆驼（CAMEL） 时尚运动休闲板鞋', '../../img/goodsImg/30.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (31, 3, '透气英伦休闲鞋男低帮潮板鞋', '../../img/goodsImg/31.jpg', 98, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (32, 3, '此间少年 板鞋男2020春秋季', '../../img/goodsImg/32.jpg', 89, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (33, 3, '列戈男鞋秋季休闲鞋男士板鞋', '../../img/goodsImg/33.jpg', 79, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (34, 3, 'VANSVIM 男鞋低帮黑白条板鞋', '../../img/goodsImg/34.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (35, 3, 'Belle/百丽2020新款秋季低帮平底板鞋', '../../img/goodsImg/35.jpg', 258, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (36, 3, 'Kappa卡帕 背靠背 男款休闲鞋板鞋', '../../img/goodsImg/36.jpg', 319, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (37, 4, '温思登男士皮鞋男英伦正装鞋', '../../img/goodsImg/37.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (38, 4, '谧之森新款秋季正装鞋', '../../img/goodsImg/38.jpg', 128, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (39, 4, '乔锐男士正装商务皮鞋', '../../img/goodsImg/39.jpg', 298, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (40, 4, '欧靓妮男士皮鞋新款男士商务休闲皮鞋正装鞋', '../../img/goodsImg/40.jpg', 128, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (41, 4, '宜驰 EGCHI 皮鞋正装鞋', '../../img/goodsImg/41.jpg', 129, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (42, 4, '木林森（MULINSEN）正装皮鞋男鞋', '../../img/goodsImg/42.jpg', 299, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (43, 4, 'JUDUN巨盾男士皮鞋男真皮商务', '../../img/goodsImg/43.jpg', 299, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (44, 4, '谧之森皮鞋男夏季透气正装鞋', '../../img/goodsImg/44.jpg', 118, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (45, 4, '奥康/谷尔正品男士真皮商务皮鞋', '../../img/goodsImg/45.jpg', 198, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (46, 4, '舞琉男士皮鞋 正装皮鞋', '../../img/goodsImg/46.jpg', 129, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (47, 4, '富贵鸟皮鞋男士时尚商务正装', '../../img/goodsImg/47.jpg', 288, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (48, 4, '花花公子正品商务正装皮鞋', '../../img/goodsImg/48.jpg', 298, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (49, 5, '帆布鞋情侣鞋', '../../img/goodsImg/49.jpg', 88, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (50, 5, '回力男士帆布鞋', '../../img/goodsImg/50.jpg', 58, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (51, 5, 'CONVERSE 匡威 经典款 休闲男女帆布', '../../img/goodsImg/51.jpg', 369, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (52, 5, '左右良品帆布鞋男2020秋冬季新品', '../../img/goodsImg/52.jpg', 79, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (53, 5, '帆布鞋男低帮套脚休闲', '../../img/goodsImg/53.jpg', 68, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (54, 5, '森马 帆布鞋男鞋2020秋季清爽', '../../img/goodsImg/54.jpg', 119, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (55, 5, '回力休闲帆布鞋', '../../img/goodsImg/55.jpg', 65, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (56, 5, '足途帆布鞋', '../../img/goodsImg/56.jpg', 79, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (57, 5, '秋季新款男鞋子帆布鞋', '../../img/goodsImg/57.jpg', 98, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (58, 5, '莱恩克斯勒帆布鞋', '../../img/goodsImg/58.jpg', 39, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (59, 5, '墨恩帆布鞋', '../../img/goodsImg/59.jpg', 98, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (60, 5, '一脚蹬男鞋韩版低帮帆布鞋', '../../img/goodsImg/60.jpg', 58, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (61, 6, '北索柔软人字拖鞋', '../../img/goodsImg/61.jpg', 49, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (62, 6, '酷趣coqui 四季情侣家居浴室拖鞋', '../../img/goodsImg/62.jpg', 19.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (63, 6, '朴西（POSEHOME）情侣家居开口棉麻拖鞋', '../../img/goodsImg/63.jpg', 39.8, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (64, 6, '恋家 家居亚麻拖鞋', '../../img/goodsImg/64.jpg', 12.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (65, 6, '酷趣coqui 四季家居浴室拖鞋', '../../img/goodsImg/65.jpg', 28.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (66, 6, '喜家家 夏季家居拖鞋', '../../img/goodsImg/66.jpg', 9.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (67, 6, '南极人（Nanjiren）拖鞋男简约夹脚人字拖', '../../img/goodsImg/67.jpg', 99, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (68, 6, '酷趣coqui家居浴室拖鞋', '../../img/goodsImg/68.jpg', 24.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (69, 6, '南极人 拖鞋洗澡漏水防滑情侣居家浴室拖鞋', '../../img/goodsImg/69.jpg', 19.9, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (70, 6, '回力warrior新款夏季洞洞鞋男沙滩鞋拖鞋', '../../img/goodsImg/70.jpg', 30, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (71, 6, 'lining李宁拖鞋男沙宁拖鞋', '../../img/goodsImg/71.jpg', 58, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (72, 6, 'adidas 阿迪达斯 男子 拖鞋', '../../img/goodsImg/72.jpg', 299, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (73, 7, '墨季 夏季新品休闲露趾凉鞋', '../../img/goodsImg/73.jpg', 99, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (74, 7, '骆驼动感（camel active）凉鞋', '../../img/goodsImg/74.jpg', 158, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (75, 7, '宜驰 EGCHI 凉鞋男士凉拖', '../../img/goodsImg/75.jpg', 79, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (76, 7, '普若森（Precentor）凉鞋', '../../img/goodsImg/76.jpg', 69, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (77, 7, '舒特 凉鞋', '../../img/goodsImg/77.jpg', 39, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (78, 7, '战地吉普（AFS JEEP）凉鞋', '../../img/goodsImg/78.jpg', 198, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (79, 7, '顿（HAUTTON）凉鞋男夏季新款', '../../img/goodsImg/79.jpg', 169, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (80, 7, '宜驰 EGCHI 凉鞋', '../../img/goodsImg/80.jpg', 69, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (81, 7, '墨季 凉鞋新品2020新款', '../../img/goodsImg/81.jpg', 99, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (82, 7, '舒特凉鞋男夏季新款休闲透气', '../../img/goodsImg/82.jpg', 59, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (83, 7, '伶羊男凉鞋夏季真皮沙滩鞋', '../../img/goodsImg/83.jpg', 99, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (84, 7, '南极人（Nanjiren）凉鞋男士时尚', '../../img/goodsImg/84.jpg', 168, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (85, 8, 'SAUCONY圣康尼 Grid Cohesion 8 缓冲避震跑步鞋', '../../img/goodsImg/85.jpg', 289, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (86, 8, '安踏ANTA男鞋 2020夏季跑步鞋', '../../img/goodsImg/86.jpg', 189, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (87, 8, '李宁旗舰店2020新品绝影跑步鞋', '../../img/goodsImg/87.jpg', 319, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (88, 8, 'ASICS亚瑟士跑鞋透气跑步鞋', '../../img/goodsImg/88.jpg', 413, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (89, 8, '匹克男鞋跑步鞋运动鞋', '../../img/goodsImg/89.jpg', 159, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (90, 8, '耐克NIKE 男子 跑步鞋', '../../img/goodsImg/90.jpg', 399, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (91, 8, '李宁旗舰店跑步鞋男鞋', '../../img/goodsImg/91.jpg', 179, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (92, 8, '双星跑步鞋', '../../img/goodsImg/92.jpg', 139, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (93, 8, '特步男透气减震运动慢跑鞋', '../../img/goodsImg/93.jpg', 139, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (94, 8, '亚瑟士ASICS运动鞋男稳定跑步鞋', '../../img/goodsImg/94.jpg', 413, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (95, 8, '李宁男鞋跑步鞋', '../../img/goodsImg/95.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (96, 8, '李宁男鞋跑步鞋运动鞋轻质透气慢跑鞋', '../../img/goodsImg/96.jpg', 369, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (97, 9, '夏季男鞋透气网鞋', '../../img/goodsImg/97.jpg', 99, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (98, 9, '奥康网鞋男休闲鞋', '../../img/goodsImg/98.jpg', 179, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (99, 9, 'Kappa 卡帕网面透气鞋', '../../img/goodsImg/99.jpg', 279, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (100, 9, '鸿星尔克男鞋运动鞋网面透气', '../../img/goodsImg/100.jpg', 149, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (101, 9, 'ECCO爱步 质感潮流网面透气', '../../img/goodsImg/101.jpg', 1599, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (102, 9, '布瑞京夏季新款男网鞋', '../../img/goodsImg/102.jpg', 86, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (103, 9, '回力网鞋男夏季透气网面鞋', '../../img/goodsImg/103.jpg', 69, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (104, 9, 'Kappa卡帕 背靠背男款网面运动鞋', '../../img/goodsImg/104.jpg', 279, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (105, 9, '足途 休闲鞋男夏季新品运动网面', '../../img/goodsImg/105.jpg', 99, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (106, 9, '2020年运动鞋男飞织网面', '../../img/goodsImg/106.jpg', 139, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (107, 9, '特步男鞋网面气垫运动鞋', '../../img/goodsImg/107.jpg', 169, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (108, 9, '乔丹男鞋透气网面运动鞋', '../../img/goodsImg/108.jpg', 108, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (109, 10, '珂法 2020秋季豆豆鞋', '../../img/goodsImg/109.jpg', 96, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (110, 10, '奥康（Aokang）休闲鞋男真皮豆豆鞋', '../../img/goodsImg/110.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (111, 10, '新款男鞋豆豆鞋', '../../img/goodsImg/111.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (112, 10, '流步 男士豆豆鞋', '../../img/goodsImg/112.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (113, 10, '红蜻蜓男鞋 休闲鞋男新品豆豆鞋', '../../img/goodsImg/113.jpg', 288, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (114, 10, '闽言2020新品豆豆鞋', '../../img/goodsImg/114.jpg', 99, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (115, 10, '墨季新品豆豆鞋', '../../img/goodsImg/115.jpg', 98, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (116, 10, '骆驼 动感新款透气豆豆鞋', '../../img/goodsImg/116.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (117, 10, '奥康男鞋 秋季新款豆豆鞋', '../../img/goodsImg/117.jpg', 199, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (118, 10, '2020年豆豆鞋男懒人鞋', '../../img/goodsImg/118.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (119, 10, 'UGG男士休闲豆豆鞋', '../../img/goodsImg/119.jpg', 699, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (120, 10, 'ECCO爱步春季新款男鞋 豆豆鞋', '../../img/goodsImg/120.jpg', 1599, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (121, 11, 'TFO 登山鞋 全掌气垫透气舒适减震登山鞋8', '../../img/goodsImg/121.jpg', 299, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (122, 11, '骆驼 CAMEL 户外登山鞋', '../../img/goodsImg/122.jpg', 328, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (123, 11, '探路者登山鞋', '../../img/goodsImg/123.jpg', 389, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (124, 11, '北面登山鞋男', '../../img/goodsImg/124.jpg', 747, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (125, 11, '北迈户外登山鞋', '../../img/goodsImg/125.jpg', 168.3, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (126, 11, '凯乐石户外运动登山鞋', '../../img/goodsImg/126.jpg', 879, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (127, 11, '远满 登山鞋', '../../img/goodsImg/127.jpg', 138, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (128, 11, 'FLDN 登山鞋男款大码', '../../img/goodsImg/128.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (129, 11, '跨洋户外登山鞋', '../../img/goodsImg/129.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (130, 11, '奥士登 登山鞋男女款秋冬季防滑', '../../img/goodsImg/130.jpg', 168, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (131, 11, '诺诗兰NORTHLAND 登山鞋 ', '../../img/goodsImg/131.jpg', 498, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (132, 11, 'HOMASS登山鞋男 ', '../../img/goodsImg/132.jpg', 138, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (133, 12, '耐克NIKE 男子足球鞋', '../../img/goodsImg/133.jpg', 399, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (134, 12, 'adidas 阿迪达斯 足球', '../../img/goodsImg/134.jpg', 299, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (135, 12, '振足 新款成人青少年儿童足球鞋 ', '../../img/goodsImg/135.jpg', 139, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (136, 12, '北迈足球鞋碎钉', '../../img/goodsImg/136.jpg', 74.8, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (137, 12, 'Mizuno美津浓 足球鞋', '../../img/goodsImg/137.jpg', 318, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (138, 12, '马伯2020新款足球鞋 ', '../../img/goodsImg/138.jpg', 128, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (139, 12, '李宁足球鞋男款', '../../img/goodsImg/139.jpg', 139, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (140, 12, '海德HEAD足球鞋男款长钉 ', '../../img/goodsImg/140.jpg', 148, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (141, 12, 'Umbro茵宝 男子训练足球鞋 ', '../../img/goodsImg/141.jpg', 149, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (142, 12, '毅途足球鞋新款成人青少年', '../../img/goodsImg/142.jpg', 139, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (143, 12, '双星 DOUBLE STAR 1032 室内足球鞋', '../../img/goodsImg/143.jpg', 146, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (144, 12, 'LEOCI足球鞋', '../../img/goodsImg/144.jpg', 139, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (145, 13, '乔丹男鞋2020新款男高帮耐磨防滑减震篮球鞋', '../../img/goodsImg/145.jpg', 199, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (146, 13, '安踏NBA篮球鞋', '../../img/goodsImg/146.jpg', 219, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (147, 13, '匹克篮球鞋 男鞋', '../../img/goodsImg/147.jpg', 179, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (148, 13, 'NBA场下篮球鞋', '../../img/goodsImg/148.jpg', 209, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (149, 13, 'MVPBOY篮球鞋男高帮透气 ', '../../img/goodsImg/149.jpg', 168, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (150, 13, 'adidas男鞋2020春季新款维金斯', '../../img/goodsImg/150.jpg', 999, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (151, 13, '特步篮球鞋 运动鞋篮球鞋', '../../img/goodsImg/151.jpg', 169, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (152, 13, '乔丹篮球鞋男鞋新款减震耐磨', '../../img/goodsImg/152.jpg', 259, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (153, 13, '李宁篮球鞋男鞋CBA音速4代', '../../img/goodsImg/153.jpg', 319, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (154, 13, '鹏威 高帮篮球鞋', '../../img/goodsImg/154.jpg', 168, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (155, 13, 'MVPBOY篮球鞋男鞋高帮', '../../img/goodsImg/155.jpg', 168, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (156, 13, '亚瑟士(asics)篮球鞋男女鞋', '../../img/goodsImg/156.jpg', 645, '双', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (157, 14, '鸿星尔克（ERKE）童鞋 儿童运动鞋', '../../img/goodsImg/157.jpg', 129, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (158, 14, '361度童鞋 男童鞋中大童鞋', '../../img/goodsImg/158.jpg', 109, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (159, 14, '萌妮酷童鞋2020春秋新款运动鞋', '../../img/goodsImg/159.jpg', 119, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (160, 14, '江博士童鞋秋款男童鞋', '../../img/goodsImg/160.jpg', 219, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (161, 14, '七波辉男童鞋2020秋季新款儿童单双网面', '../../img/goodsImg/161.jpg', 149, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (162, 14, 'R7童鞋 男童鞋弹簧鞋2020秋季新款', '../../img/goodsImg/162.jpg', 99, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (163, 14, '牧童男童女童童鞋', '../../img/goodsImg/163.jpg', 119, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (164, 14, '安踏童鞋男童鞋儿童运动鞋', '../../img/goodsImg/164.jpg', 129, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (165, 14, '卡西龙童鞋男女秋冬新款儿童运动鞋', '../../img/goodsImg/165.jpg', 79, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (166, 14, 'Dr.Kong江博士男童鞋宝宝防滑鞋', '../../img/goodsImg/166.jpg', 239, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (167, 14, '史努比童鞋', '../../img/goodsImg/167.jpg', 128, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (168, 14, '巴布豆儿童板鞋男童女童鞋', '../../img/goodsImg/168.jpg', 79, '双', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (169, 15, '艾买户外运动迷彩鞋男军', '../../img/goodsImg/169.jpg', 118, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (170, 15, '奥康男鞋 军官皮鞋男士官军鞋', '../../img/goodsImg/170.jpg', 349, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (171, 15, '5.11作战靴 男特种兵特勤特警', '../../img/goodsImg/171.jpg', 1053, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (172, 15, '配发皮鞋男士真皮单鞋军鞋', '../../img/goodsImg/172.jpg', 236, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (173, 15, '3537解放鞋男军鞋07作训鞋', '../../img/goodsImg/173.jpg', 58, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (174, 15, '解放鞋 男女夏季军鞋', '../../img/goodsImg/174.jpg', 39, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (175, 15, '户外情侣军鞋', '../../img/goodsImg/175.jpg', 259, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (176, 15, '3537军训迷彩鞋军鞋', '../../img/goodsImg/176.jpg', 58, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (177, 15, '军靴07式作训鞋解放鞋军鞋', '../../img/goodsImg/177.jpg', 45, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (178, 15, '卓伦尚品军迷作训鞋 迷彩鞋男军鞋', '../../img/goodsImg/178.jpg', 120, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (179, 15, '新式作训鞋07a迷彩鞋休闲鞋男军鞋', '../../img/goodsImg/179.jpg', 139, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (180, 15, '超轻低帮07军鞋', '../../img/goodsImg/180.jpg', 138, '双', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (181, 16, '新秀丽Samsonite 硬壳手提密码箱', '../../img/goodsImg/181.jpg', 1180, '个', 0, 2.7, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (182, 16, '皓森特手提密码箱PU材质商务公文箱', '../../img/goodsImg/182.jpg', 219, '个', 0, 2.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (183, 16, '手提工具箱铝合金 商务公文箱', '../../img/goodsImg/183.jpg', 528, '个', 0, 1.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (184, 16, '摩斯卡MONSCA手提箱PU材质商务公文箱', '../../img/goodsImg/184.jpg', 239, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (185, 16, '皓森特Horsent手提公文箱', '../../img/goodsImg/185.jpg', 259, '个', 0, 2.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (186, 16, '丝缇.兰妮新款时尚手提密码箱公文箱', '../../img/goodsImg/186.jpg', 948, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (187, 16, '安途尔 铝镁合金公文箱文件箱', '../../img/goodsImg/187.jpg', 899, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (188, 16, '菲雪儿经典牛皮公文箱', '../../img/goodsImg/188.jpg', 539, '个', 0, 4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (189, 16, 'WREO 商务PC手提密码箱公文箱', '../../img/goodsImg/189.jpg', 634, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (190, 16, 'WREO 手提密码箱S公文箱', '../../img/goodsImg/190.jpg', 436, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (191, 16, 'ARSMUNDI 手提密码箱商务公文箱', '../../img/goodsImg/191.jpg', 250, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (192, 16, 'KVKY手提密码箱商务公文箱', '../../img/goodsImg/192.jpg', 561, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (193, 17, 'GKO 金属手提箱 航空铝材', '../../img/goodsImg/193.jpg', 2080, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (194, 17, 'MSJ新品s3fs公文箱密码手提箱 ', '../../img/goodsImg/194.jpg', 313, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (195, 17, 'LDTX铝框行李箱男女手提箱', '../../img/goodsImg/195.jpg', 348, '个', 0, 3.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (196, 17, '大号铝合金工具箱密码箱子手提', '../../img/goodsImg/196.jpg', 175, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (197, 17, '博瑞（BORY）文件密码箱手提保险箱', '../../img/goodsImg/197.jpg', 78, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (198, 17, '拓为（Tactix）320311 17英寸大码塑料多功能乐高整理箱手提箱', '../../img/goodsImg/198.jpg', 139, '个', 0, 1.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (199, 17, '腾彩行李箱小旅行箱迷你手提箱', '../../img/goodsImg/199.jpg', 73, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (200, 17, '摩斯卡MONSCA手提箱', '../../img/goodsImg/200.jpg', 239, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (201, 17, '珂洛保罗 化妆箱 迷你手提箱', '../../img/goodsImg/201.jpg', 79, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (202, 17, 'uniwalker复古迷你手提箱', '../../img/goodsImg/202.jpg', 540, '个', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (203, 17, '嘉禾生活新品子母箱防刮拉杆箱手提箱', '../../img/goodsImg/203.jpg', 148, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (204, 17, 'niwalker复古手提箱', '../../img/goodsImg/204.jpg', 396, '个', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (205, 18, '得力(deli)5799 便携皮质发票夹', '../../img/goodsImg/205.jpg', 15, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (206, 18, '优得佳 黑色皮质支票夹', '../../img/goodsImg/206.jpg', 13, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (207, 18, '信发（TRNFA）发票夹 A6皮面支票夹', '../../img/goodsImg/207.jpg', 12, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (208, 18, '优得佳 黑色皮质支票夹', '../../img/goodsImg/208.jpg', 9, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (209, 18, '金利来（Goldlion）新款时尚男士票夹', '../../img/goodsImg/209.jpg', 248, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (210, 18, ' cardin女士钱包时尚多卡位真皮长款钱夹女头层牛皮票夹', '../../img/goodsImg/210.jpg', 468, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (211, 18, '韩版休闲头层牛皮票夹', '../../img/goodsImg/211.jpg', 159, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (212, 18, '啄木鸟（TUCANO）男士钱包短款头层牛皮票夹', '../../img/goodsImg/212.jpg', 119, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (213, 18, 'PLAYBOY花花公子钱包男头层牛皮韩版时尚皮夹真皮票夹', '../../img/goodsImg/213.jpg', 129, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (214, 18, '皮尔卡丹pierrecardin皮票夹', '../../img/goodsImg/214.jpg', 528, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (215, 18, '姬龙雪 guy laroche 女士钱包牛皮票夹', '../../img/goodsImg/215.jpg', 790, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (216, 18, '优得佳 黑色皮质支票夹', '../../img/goodsImg/216.jpg', 13, '个', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (217, 19, '新秀丽（Samsonite）ARQ行李箱', '../../img/goodsImg/217.jpg', 2779, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (218, 19, '美旅AmericanTouristerPC行李箱', '../../img/goodsImg/218.jpg', 399, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (219, 19, '杰西尼 海关锁铝框拉杆箱万向轮行李箱', '../../img/goodsImg/219.jpg', 266, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (220, 19, '梵地亚（Vantiiear）拉杆箱万向轮行李箱', '../../img/goodsImg/220.jpg', 149, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (221, 19, 'vanwalk 多功能商务拉杆箱 大容量行李箱', '../../img/goodsImg/221.jpg', 398, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (222, 19, '妮狼拉杆箱旅行箱包皮箱密码箱行李箱', '../../img/goodsImg/222.jpg', 262, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (223, 19, '七公主拉杆箱男女学生行李箱', '../../img/goodsImg/223.jpg', 269, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (224, 19, '意酷(YKOO)铝框拉杆箱万向轮行李箱', '../../img/goodsImg/224.jpg', 318, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (225, 19, '七公主可爱行李箱', '../../img/goodsImg/225.jpg', 268, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (226, 19, '爱华仕（OIWAS）飞机轮拉杆箱6098 休闲大容量行李箱', '../../img/goodsImg/226.jpg', 279, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (227, 19, '文森保罗（VinsonPaul）行李箱 ', '../../img/goodsImg/227.jpg', 289, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (228, 19, 'EAZZ铝框拉杆箱 万向轮行李箱', '../../img/goodsImg/228.jpg', 209, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (229, 20, '外交官男包公事包', '../../img/goodsImg/229.jpg', 588, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (230, 20, '法国LEXON乐上防水公事包', '../../img/goodsImg/230.jpg', 299, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (231, 20, '金得利 HB713 A4商务手提袋公事包', '../../img/goodsImg/231.jpg', 23, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (232, 20, '帆布手提文件包公文袋会议公事包', '../../img/goodsImg/232.jpg', 88, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (233, 20, '金得利 SA602 A4透明收纳空格包', '../../img/goodsImg/233.jpg', 12, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (234, 20, '公文袋418手提康百公事包', '../../img/goodsImg/234.jpg', 28, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (235, 20, '威豹（WINPARD）男商务12寸电脑公事包', '../../img/goodsImg/235.jpg', 159, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (236, 20, '卡拉羊（Carany）CS1327深灰 男士商务电脑包公文包公事包', '../../img/goodsImg/236.jpg', 259, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (237, 20, '帆布手提文件包公文袋会议公事包', '../../img/goodsImg/237.jpg', 69, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (238, 20, '男士商务纯皮手提包黑色油腊皮公事包', '../../img/goodsImg/238.jpg', 789, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (239, 20, 'piquadro皮咖杜男士公文包手提包公事包', '../../img/goodsImg/239.jpg', 2670, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (240, 20, '公事包办公文件包帆布', '../../img/goodsImg/240.jpg', 44, '个', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (241, 21, '英皇保罗新款钱包', '../../img/goodsImg/241.jpg', 168, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (242, 21, '金利来（Goldlion）新款男士钱包', '../../img/goodsImg/242.jpg', 189, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (243, 21, '皮尔卡丹（pierre cardin）女士钱包', '../../img/goodsImg/243.jpg', 228, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (244, 21, '七匹狼钱包', '../../img/goodsImg/244.jpg', 59, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (245, 21, '花花公子playboy 男士多功能短款钱包', '../../img/goodsImg/245.jpg', 59, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (246, 21, '稻草人MEXICAN男士钱包', '../../img/goodsImg/246.jpg', 59, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (247, 21, '梦特娇/MONTAGUT女士钱包', '../../img/goodsImg/247.jpg', 299, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (248, 21, '红谷HONGU女士钱包', '../../img/goodsImg/248.jpg', 199, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (249, 21, 'PENIMATE钱包', '../../img/goodsImg/249.jpg', 138, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (250, 21, '稻草人男士钱包 ', '../../img/goodsImg/250.jpg', 79, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (251, 21, '阿尔皮纳袋鼠（L’ALPINA) 钱包', '../../img/goodsImg/251.jpg', 158, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (252, 21, '金狐狸（FOXER）钱包', '../../img/goodsImg/252.jpg', 99, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (253, 22, '蓝橙（LYCEEM）HelloKitty化妆包', '../../img/goodsImg/253.jpg', 99, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (254, 22, '加加林 女士化妆包', '../../img/goodsImg/254.jpg', 29, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (255, 22, 'Naturehike韩国化妆包', '../../img/goodsImg/255.jpg', 19.9, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (256, 22, '收纳总动员 双层化妆包', '../../img/goodsImg/256.jpg', 49, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (257, 22, '旅行洗漱包化妆包', '../../img/goodsImg/257.jpg', 36, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (258, 22, 'WELLHOUSE 洗漱包 旅行男女出差化妆', '../../img/goodsImg/258.jpg', 28, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (259, 22, '维至（VOYJOY）新款防水化妆包', '../../img/goodsImg/259.jpg', 59, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (260, 22, '娑娜依 化妆包', '../../img/goodsImg/260.jpg', 29, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (261, 22, '四万公里 韩国多功能化妆包', '../../img/goodsImg/261.jpg', 19, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (262, 22, '卡登途 化妆包', '../../img/goodsImg/262.jpg', 29.9, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (263, 22, '洗漱包旅行男士女化妆包', '../../img/goodsImg/263.jpg', 39, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (264, 22, 'Botta化妆包三件套', '../../img/goodsImg/264.jpg', 45, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (265, 23, '文艺青年 洗漱包旅行男女士化妆包', '../../img/goodsImg/265.jpg', 36, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (266, 23, '旅行收纳袋洗漱袋透明便携化妆包', '../../img/goodsImg/266.jpg', 39, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (267, 23, '博牌旅行袋 手提旅行', '../../img/goodsImg/267.jpg', 259, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (268, 23, '金利来（Goldlion） 男士商务手提包', '../../img/goodsImg/268.jpg', 1028, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (269, 23, '蒂梵森（DRFSON）男包男士手提包', '../../img/goodsImg/269.jpg', 105, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (270, 23, 'vanwalk 男旅行包手提包', '../../img/goodsImg/270.jpg', 159, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (271, 23, '极为 JEVI 商务手提包', '../../img/goodsImg/271.jpg', 99, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (272, 23, '博牌旅行包男行李袋商务手提包', '../../img/goodsImg/272.jpg', 299, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (273, 23, 'GM 男包手提包公文包', '../../img/goodsImg/273.jpg', 698, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (274, 23, 'Samsonite/新秀丽男士公文包商务手提包', '../../img/goodsImg/274.jpg', 1679, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (275, 23, 'FION/菲安妮 欧美时尚手提包', '../../img/goodsImg/275.jpg', 799, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (276, 23, '古琪仕牛皮男士公文包手提包', '../../img/goodsImg/276.jpg', 399, '个', 0, 1.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (277, 24, '第九城(V.NINE)单肩包', '../../img/goodsImg/277.jpg', 99, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (278, 24, '七匹狼 男士胸包单肩', '../../img/goodsImg/278.jpg', 159, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (279, 24, '稻草人（MEXICAN）男士胸包休闲运动单肩包', '../../img/goodsImg/279.jpg', 149, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (280, 24, 'YOK胸包男士单肩包', '../../img/goodsImg/280.jpg', 129, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (281, 24, '稻草人（MEXICAN）男士胸包头层牛皮单肩', '../../img/goodsImg/281.jpg', 179, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (282, 24, '瑞士军刀威戈（Wenger）单肩包', '../../img/goodsImg/282.jpg', 99, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (283, 24, '派保爵PaboJoe单肩包', '../../img/goodsImg/283.jpg', 298, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (284, 24, '阿迪达斯小肩包 男 单肩包 ', '../../img/goodsImg/284.jpg', 137, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (285, 24, '奥克丹格AUKETANG 男士单肩包 ', '../../img/goodsImg/285.jpg', 149, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (286, 24, 'WILLIAMDOU威廉老人头男士胸包', '../../img/goodsImg/286.jpg', 199, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (287, 24, '波斯丹顿（BOSTANTEN）男包单肩包', '../../img/goodsImg/287.jpg', 179, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (288, 24, '老人头（LAORENTOU）男士胸包多功能男包潮流单肩包', '../../img/goodsImg/288.jpg', 129, '个', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (289, 25, '羚跑时尚休闲男士双肩包', '../../img/goodsImg/289.jpg', 350, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (290, 25, 'SWISSGEAR双肩包', '../../img/goodsImg/290.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (291, 25, '瑞士军刀威戈Wenger双肩包', '../../img/goodsImg/291.jpg', 149, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (292, 25, '爱华仕（OIWAS）双肩包 ', '../../img/goodsImg/292.jpg', 109, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (293, 25, '维多利亚旅行者 VICTORIATOURIST 双肩包', '../../img/goodsImg/293.jpg', 109, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (294, 25, 'TOPPU 男士双肩包', '../../img/goodsImg/294.jpg', 199, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (295, 25, 'SWISSGEAR双肩包', '../../img/goodsImg/295.jpg', 119, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (296, 25, 'SWISSGEAR背包 多功能电脑包15.6英寸商务双肩包', '../../img/goodsImg/296.jpg', 139, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (297, 25, '新秀丽（Samsonite）男女双肩包', '../../img/goodsImg/297.jpg', 419, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (298, 25, 'vanwalk 背包双肩包', '../../img/goodsImg/298.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (299, 25, '高尔夫GOLF双肩包', '../../img/goodsImg/299.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (300, 25, '小米（MI）极简都市双肩包', '../../img/goodsImg/300.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (301, 26, '稻草人（MEXICAN）潮女包斜挎包', '../../img/goodsImg/301.jpg', 189, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (302, 26, '防水时尚休闲胸包三角斜挎包', '../../img/goodsImg/302.jpg', 69, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (303, 26, '爱华仕(OIWAS) 男士休闲单肩斜挎包 ', '../../img/goodsImg/303.jpg', 99, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (304, 26, 'Carneyroad卡尼路男包单肩斜挎包', '../../img/goodsImg/304.jpg', 99, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (305, 26, '稻草人 男士胸包复古斜挎包', '../../img/goodsImg/305.jpg', 149, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (306, 26, '老人头（LAORENTOU）女士斜挎包', '../../img/goodsImg/306.jpg', 268, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (307, 26, '金利来（Goldlion）男包 欧美新款男士斜挎包', '../../img/goodsImg/307.jpg', 748, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (308, 26, 'NIID FINO 男健身斜挎包', '../../img/goodsImg/308.jpg', 199, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (309, 26, 'MR男包单肩包 男士韩版潮流斜挎包', '../../img/goodsImg/309.jpg', 109, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (310, 26, '爱华仕oiwas 户外运动男女休闲腰包斜挎', '../../img/goodsImg/310.jpg', 69, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (311, 26, '天逸TINYAT腰包男健身斜挎包', '../../img/goodsImg/311.jpg', 29, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (312, 26, '简佰格包包女包新款女士链条斜挎包', '../../img/goodsImg/312.jpg', 259, '个', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (313, 27, 'Tuban运动跑步腰包', '../../img/goodsImg/313.jpg', 49, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (314, 27, '轻骑者 多功能腰包', '../../img/goodsImg/314.jpg', 59, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (315, 27, '爱华仕（OIWAS）运动休闲 时尚腰包', '../../img/goodsImg/315.jpg', 69, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (316, 27, '七匹狼 腰包男士', '../../img/goodsImg/316.jpg', 139, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (317, 27, '天逸TINYAT男士小腰包', '../../img/goodsImg/317.jpg', 23.5, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (318, 27, '迈路士 运动跑步腰包', '../../img/goodsImg/318.jpg', 39, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (319, 27, 'SWISSGEAR腰包男', '../../img/goodsImg/319.jpg', 79, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (320, 27, '梵士汇（F4Y）户外运动腰包', '../../img/goodsImg/320.jpg', 59, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (321, 27, 'CAMEL骆驼户外腰包', '../../img/goodsImg/321.jpg', 45, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (322, 27, '马盖先手机腰包男', '../../img/goodsImg/322.jpg', 149, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (323, 27, '顿巴纵队 手机腰包男士户外运动腰包', '../../img/goodsImg/323.jpg', 45, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (324, 27, '初弎中国风男死飞骑行复古风佛唛腰包', '../../img/goodsImg/324.jpg', 249, '个', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (325, 28, '泰昂跑步运动手机臂包 手腕包', '../../img/goodsImg/325.jpg', 45, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (326, 28, 'NIKE/耐克 PU皮零钱包腕包 ', '../../img/goodsImg/326.jpg', 89, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (327, 28, '骆驼（CAMEL）户外男女款运动腕包', '../../img/goodsImg/327.jpg', 58, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (328, 28, '手机臂包运动跑步包6英寸臂袋手腕包', '../../img/goodsImg/328.jpg', 49, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (329, 28, '跑步臂包男女手腕包', '../../img/goodsImg/329.jpg', 39, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (330, 28, '蒙奇奇运动手机臂包臂袋男女跑步手腕包', '../../img/goodsImg/330.jpg', 39, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (331, 28, '加加林 运动手机臂包手腕包', '../../img/goodsImg/331.jpg', 29, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (332, 28, '斯泰克 跑步运动手机臂包 手腕包', '../../img/goodsImg/332.jpg', 29.9, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (333, 28, '加加林 运动手机臂包手腕包', '../../img/goodsImg/333.jpg', 29, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (334, 28, '图跃（TUYUE）运动手机臂包手腕包', '../../img/goodsImg/334.jpg', 29.9, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (335, 28, 'WELLHOUSE 臂包 手机包骑行腕包', '../../img/goodsImg/335.jpg', 35, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (336, 28, 'WELLHOUSE 手机臂包 跑步音乐腕包', '../../img/goodsImg/336.jpg', 49, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (337, 29, '稻草人Mexican女士手包甜美淑女晚装包', '../../img/goodsImg/337.jpg', 129, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (338, 29, '大森林2016新款蝴蝶结水钻包手抓包晚宴包晚装包', '../../img/goodsImg/338.jpg', 60, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (339, 29, '2020新款晚宴包金色镶钻晚装包', '../../img/goodsImg/339.jpg', 102, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (340, 29, '洛芊（Luoqian）闪亮宴会手包晚装包', '../../img/goodsImg/340.jpg', 139, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (341, 29, '德仕奇时尚新款女士珠绣包重手工宴会晚装包', '../../img/goodsImg/341.jpg', 122, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (342, 29, '冰瑞流行女包宴会晚装包', '../../img/goodsImg/342.jpg', 36, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (343, 29, '啄木鸟优雅女士手拿包韩版简约时尚晚装包', '../../img/goodsImg/343.jpg', 119, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (344, 29, 'TEAEGG珍珠包包新款晚宴包宴会手拿包女晚装包', '../../img/goodsImg/344.jpg', 148, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (345, 29, '德仕奇镶钻石女士包精致绒布皇冠晚装包', '../../img/goodsImg/345.jpg', 63, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (346, 29, '然锋 女士镶钻晚装包', '../../img/goodsImg/346.jpg', 59, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (347, 29, '然锋 龙凤纹女士晚宴包 古典晚装包', '../../img/goodsImg/347.jpg', 56, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (348, 29, '曼普拉2016夏秋女士单肩晚装包', '../../img/goodsImg/348.jpg', 80, '个', 0, 0.38, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (349, 30, '奥克丹格（AUKETANG）男士休闲多功能', '../../img/goodsImg/349.jpg', 138, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (350, 30, 'SWISSGEAR背包 多功能电脑包', '../../img/goodsImg/350.jpg', 139, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (351, 30, '小米生态链企业90分多功能电脑双肩包 ', '../../img/goodsImg/351.jpg', 249, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (352, 30, '新秀丽（Samsonite）男女双肩包多功能', '../../img/goodsImg/352.jpg', 419, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (353, 30, '新秀丽（Samsonite）男女双肩包多功能', '../../img/goodsImg/353.jpg', 329, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (354, 30, 'M&R.TWO大容量背包双肩包男多功能', '../../img/goodsImg/354.jpg', 178, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (355, 30, '英国Knomo falmouth双肩包男士多功能', '../../img/goodsImg/355.jpg', 758, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (356, 30, '瑞士军刀威戈双肩包背包男女多功能', '../../img/goodsImg/356.jpg', 299, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (357, 30, '老人头（LAORENTOU）男士胸包多功能', '../../img/goodsImg/357.jpg', 129, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (358, 30, 'CAMEL骆驼户外旅行包男女通用多功能', '../../img/goodsImg/358.jpg', 139, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (359, 30, '慕腾/MUTENG双肩包多功能', '../../img/goodsImg/359.jpg', 59, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (360, 30, '施维茨十字双肩包多功能', '../../img/goodsImg/360.jpg', 137, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (361, 31, '解忧杂货店', '../../img/goodsImg/361.jpg', 27.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (362, 31, '白夜行', '../../img/goodsImg/362.jpg', 27.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (363, 31, '嫌疑人X的献身', '../../img/goodsImg/363.jpg', 26.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (364, 31, '圣女的救济', '../../img/goodsImg/364.jpg', 37.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (365, 31, '虚无的十字架', '../../img/goodsImg/365.jpg', 27.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (366, 32, '一只特立独行的猪', '../../img/goodsImg/366.jpg', 25, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (367, 32, '文化苦旅', '../../img/goodsImg/367.jpg', 22.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (368, 32, '我与地坛', '../../img/goodsImg/368.jpg', 15, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (369, 32, '朝花夕拾', '../../img/goodsImg/369.jpg', 9.4, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (370, 32, '寂静的春天', '../../img/goodsImg/370.jpg', 21.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (371, 33, '后来时间都与你有关', '../../img/goodsImg/371.jpg', 29.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (372, 33, '把生活过成你想要的样子', '../../img/goodsImg/372.jpg', 29, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (373, 33, '加油！你是最胖的 ', '../../img/goodsImg/373.jpg', 26.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (374, 33, '从你的全世界路过 ', '../../img/goodsImg/374.jpg', 24.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (375, 33, '愿有人陪你颠沛流离 ', '../../img/goodsImg/375.jpg', 24.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (376, 34, '就喜欢你看不惯我又干不掉我的样子', '../../img/goodsImg/376.jpg', 35.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (377, 34, '你的名字', '../../img/goodsImg/377.jpg', 24.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (378, 34, '美国漫画·漫威超级英雄漫画', '../../img/goodsImg/378.jpg', 67.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (379, 34, '秒速5厘米（典藏版）', '../../img/goodsImg/379.jpg', 25.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (380, 34, '追逐繁星的孩子', '../../img/goodsImg/380.jpg', 27.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (381, 35, '窗边的小豆豆', '../../img/goodsImg/381.jpg', 18.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (382, 35, '夏洛的网', '../../img/goodsImg/382.jpg', 16.4, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (383, 35, '三毛流浪记全集', '../../img/goodsImg/383.jpg', 18.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (384, 35, '杨红樱笑猫日记', '../../img/goodsImg/384.jpg', 18.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (385, 35, '草房子', '../../img/goodsImg/385.jpg', 12.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (386, 36, '刑法学（第五版 上下册）', '../../img/goodsImg/386.jpg', 94.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (387, 36, '高等数学 第7版 ', '../../img/goodsImg/387.jpg', 124.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (388, 36, '人卫临床本科第八版医学教材', '../../img/goodsImg/388.jpg', 382.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (389, 36, '计算机网络（第7版）', '../../img/goodsImg/389.jpg', 37.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (390, 36, '计算机操作系统', '../../img/goodsImg/390.jpg', 31.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (391, 37, '图说金刚经', '../../img/goodsImg/391.jpg', 51.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (392, 37, '菊与刀', '../../img/goodsImg/392.jpg', 24.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (393, 37, '中国哲学简史（插图修订版）', '../../img/goodsImg/393.jpg', 28.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (394, 37, '中国古代文化常识（插图修订第4版）', '../../img/goodsImg/394.jpg', 45, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (395, 37, '我在故宫修文物', '../../img/goodsImg/395.jpg', 30.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (396, 38, '自下而上：万物进化简史', '../../img/goodsImg/396.jpg', 60.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (397, 38, '国富论 精装', '../../img/goodsImg/397.jpg', 44.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (398, 38, '数字经济：中国创新增长新动能', '../../img/goodsImg/398.jpg', 40.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (399, 38, '魔鬼经济学', '../../img/goodsImg/399.jpg', 135, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (400, 38, '城乡中国', '../../img/goodsImg/400.jpg', 51.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (401, 39, '传染：塑造消费、心智、决策的隐秘力量', '../../img/goodsImg/401.jpg', 42.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (402, 39, '销售就是要玩转情商：沟通技巧版', '../../img/goodsImg/402.jpg', 30.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (403, 39, '运营有道：重新定义互联网运营', '../../img/goodsImg/403.jpg', 52.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (404, 39, '极简管理法则', '../../img/goodsImg/404.jpg', 38.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (405, 39, '互联网下半场', '../../img/goodsImg/405.jpg', 45.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (406, 40, '怀孕圣经（第4版）', '../../img/goodsImg/406.jpg', 30.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (407, 40, '儿童护牙宝典', '../../img/goodsImg/407.jpg', 34.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (408, 40, '华人育儿百科', '../../img/goodsImg/408.jpg', 69.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (409, 40, '迪士尼·亲子旅行纪念册：海洋奇缘', '../../img/goodsImg/409.jpg', 26.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (410, 40, '孩子：挑战', '../../img/goodsImg/410.jpg', 35.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (411, 41, '施瓦辛格健身全书', '../../img/goodsImg/411.jpg', 59.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (412, 41, '硬派健身：你的第一本健身书', '../../img/goodsImg/412.jpg', 33.1, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (413, 41, '肌肉训练完全图解：终极健身百科全书', '../../img/goodsImg/413.jpg', 60, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (414, 41, '精准拉伸 疼痛消除和损伤预防的针对性练', '../../img/goodsImg/414.jpg', 33.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (415, 41, '器械健身完全指南', '../../img/goodsImg/415.jpg', 19.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (416, 42, '新编百姓最爱家常菜2888例', '../../img/goodsImg/416.jpg', 23.4, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (417, 42, '时尚新厨房：花式营养早餐一本全', '../../img/goodsImg/417.jpg', 23, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (418, 42, '中国居民膳食指南', '../../img/goodsImg/418.jpg', 50.4, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (419, 42, '营养圣经（最新修订版）', '../../img/goodsImg/419.jpg', 31.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (420, 42, '菜谱 家常菜 食谱大全', '../../img/goodsImg/420.jpg', 36.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (421, 43, '西藏，一个人的浩浩荡荡', '../../img/goodsImg/421.jpg', 24.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (422, 43, '与一万个城市擦身而过', '../../img/goodsImg/422.jpg', 28.4, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (423, 43, '旅行之道：歌之版图', '../../img/goodsImg/423.jpg', 30.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (424, 43, '2020中国地图册+世界地图册', '../../img/goodsImg/424.jpg', 52.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (425, 43, '2020中国自驾游地图集', '../../img/goodsImg/425.jpg', 42.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (426, 44, '秘密花园：一本探索奇境的手绘涂色书', '../../img/goodsImg/426.jpg', 31.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (427, 44, '写给大家的西方美术史', '../../img/goodsImg/427.jpg', 46.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (428, 44, '素描入门实战一本通', '../../img/goodsImg/428.jpg', 34.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (429, 44, '山海经典藏画册', '../../img/goodsImg/429.jpg', 82.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (430, 44, '10000例简笔画一学就会 ', '../../img/goodsImg/430.jpg', 35.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (431, 45, '田英章凹槽练字板：行书 ', '../../img/goodsImg/431.jpg', 19.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (432, 45, '墨点字帖国学楷书硬笔书法钢', '../../img/goodsImg/432.jpg', 52.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (433, 45, '庞中华硬笔楷书系列', '../../img/goodsImg/433.jpg', 26.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (434, 45, '汉字书法之美 ', '../../img/goodsImg/434.jpg', 32.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (435, 45, '墨点字帖·传世碑帖精选', '../../img/goodsImg/435.jpg', 4.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (436, 46, '黑镜头20周年纪念版', '../../img/goodsImg/436.jpg', 203.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (437, 46, '昨天的青春：八十年代中学生', '../../img/goodsImg/437.jpg', 74.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (438, 46, '廿四：南北风物里的四时节气', '../../img/goodsImg/438.jpg', 32.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (439, 46, '仍然', '../../img/goodsImg/439.jpg', 69.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (440, 46, '人与土地（精装）', '../../img/goodsImg/440.jpg', 41.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (441, 47, '写给大家看的设计书', '../../img/goodsImg/441.jpg', 41.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (442, 47, '设计中的设计', '../../img/goodsImg/442.jpg', 73.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (443, 47, '配色设计原理 ', '../../img/goodsImg/443.jpg', 41, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (444, 47, '设计师的设计日记', '../../img/goodsImg/444.jpg', 33.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (445, 47, '设计法则100', '../../img/goodsImg/445.jpg', 33.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (446, 48, '八堂极简科学课', '../../img/goodsImg/446.jpg', 37, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (447, 48, '癌症 新知 ：科学终结恐慌', '../../img/goodsImg/447.jpg', 44.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (448, 48, '揭秘太空：人类的航天梦', '../../img/goodsImg/448.jpg', 34.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (449, 48, '宇宙 ', '../../img/goodsImg/449.jpg', 46.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (450, 48, '花朵的秘密生命', '../../img/goodsImg/450.jpg', 36.1, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (451, 49, '微反应心理学全集 ', '../../img/goodsImg/451.jpg', 21, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (452, 49, '微动作、微表情、微反应读心术', '../../img/goodsImg/452.jpg', 55.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (453, 49, '心理学与生活', '../../img/goodsImg/453.jpg', 89.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (454, 49, '性格心理学 ', '../../img/goodsImg/454.jpg', 20, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (455, 49, '博弈心理学+欲望心理学', '../../img/goodsImg/455.jpg', 50.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (456, 50, 'Go程序设计语言', '../../img/goodsImg/456.jpg', 54.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (457, 50, '流畅的Python', '../../img/goodsImg/457.jpg', 94.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (458, 50, '深度学习原理与TensorFlow实践', '../../img/goodsImg/458.jpg', 55.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (459, 50, 'Python机器学习实践指南', '../../img/goodsImg/459.jpg', 49.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (460, 50, '算法导论（原书第3版）', '../../img/goodsImg/460.jpg', 104.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (461, 51, '胰腺病手术学', '../../img/goodsImg/461.jpg', 148, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (462, 51, '协和外科住院医师手册', '../../img/goodsImg/462.jpg', 14.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (463, 51, '神经介入技术', '../../img/goodsImg/463.jpg', 195.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (464, 51, '肾脏病临床概览', '../../img/goodsImg/464.jpg', 98.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (465, 51, '医学衷中参西录', '../../img/goodsImg/465.jpg', 56.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (466, 52, '中国建筑史 ', '../../img/goodsImg/466.jpg', 43.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (467, 52, '启发绘本：我的建筑形状书', '../../img/goodsImg/467.jpg', 24.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (468, 52, '解读建筑 ', '../../img/goodsImg/468.jpg', 40.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (469, 52, '建筑构造 ', '../../img/goodsImg/469.jpg', 40.2, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (470, 52, '日本建筑解剖书 ', '../../img/goodsImg/470.jpg', 31.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (471, 53, '不可思议的纸飞机', '../../img/goodsImg/471.jpg', 27.1, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (472, 53, '分布式光伏发电系统工程设计与实例', '../../img/goodsImg/472.jpg', 23.9, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (473, 53, '电气工程师手册', '../../img/goodsImg/473.jpg', 132.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (474, 53, 'PLC工业控制', '../../img/goodsImg/474.jpg', 51.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (475, 53, '激光原理（第7版）', '../../img/goodsImg/475.jpg', 45.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (476, 54, 'The Kite Runner 追风筝的人 英文原版', '../../img/goodsImg/476.jpg', 60.8, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (477, 54, 'THE NEST', '../../img/goodsImg/477.jpg', 52.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (478, 54, 'DUNKIRK', '../../img/goodsImg/478.jpg', 58.5, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (479, 54, 'Lord of the Flies', '../../img/goodsImg/479.jpg', 67.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (480, 54, 'Peter Pan 彼得·潘 英', '../../img/goodsImg/480.jpg', 39.7, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (481, 55, '中国国家地理（2020年6月号）', '../../img/goodsImg/481.jpg', 16.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (482, 55, '男人装（2020年7月号）', '../../img/goodsImg/482.jpg', 17.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (483, 55, '环球科学（2020年7月号）', '../../img/goodsImg/483.jpg', 15.6, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (484, 55, 'VOGUE服饰与美容（2020年07月号）', '../../img/goodsImg/484.jpg', 15, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (485, 55, '三联生活周刊（2020年第27期）', '../../img/goodsImg/485.jpg', 11.3, '本', 0, 0.15, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (486, 56, '欢乐颂（套装全三册）（电子书）', '../../img/goodsImg/486.jpg', 2.49, '部', 0, 0, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (487, 56, '无声告白（电子书） ', '../../img/goodsImg/487.jpg', 6.99, '部', 0, 0, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (488, 56, '别让不好意思害了你（电子书）', '../../img/goodsImg/488.jpg', 0.99, '部', 0, 0, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (489, 56, '被偷走的那五年（电子书）', '../../img/goodsImg/489.jpg', 0.99, '部', 0, 0, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (490, 56, '杉杉来吃（电子书）', '../../img/goodsImg/490.jpg', 5, '部', 0, 0, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (491, 57, '郭美美《你的名字》', '../../img/goodsImg/491.jpg', 83, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (492, 57, '张学友：私人角落 CD', '../../img/goodsImg/492.jpg', 48, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (493, 57, '薛之谦《初学者》', '../../img/goodsImg/493.jpg', 76.7, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (494, 57, '梁博 迷藏（CD）', '../../img/goodsImg/494.jpg', 54.9, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (495, 57, 'A-Lin黄丽玲精选（2CD', '../../img/goodsImg/495.jpg', 62.8, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (496, 58, '正版阿凡达3D蓝光碟', '../../img/goodsImg/496.jpg', 148, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (497, 58, '太空旅客（DVD9）', '../../img/goodsImg/497.jpg', 37, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (498, 58, 'X战警 角色限定版', '../../img/goodsImg/498.jpg', 105.2, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (499, 58, '冰川时代3（蓝光碟 BD50）', '../../img/goodsImg/499.jpg', 94.2, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (500, 58, '美国队长2（蓝光碟 BD+DVD)', '../../img/goodsImg/500.jpg', 228, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (501, 59, '儿童国学（18DVD）', '../../img/goodsImg/501.jpg', 75, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (502, 59, '猫和老鼠启蒙英语套装', '../../img/goodsImg/502.jpg', 85, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (503, 59, '英语小达人：我爱记单词', '../../img/goodsImg/503.jpg', 32, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (504, 59, '最新驾考轻松', '../../img/goodsImg/504.jpg', 72.2, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (505, 59, '钢琴考级教程第1级', '../../img/goodsImg/505.jpg', 38.9, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (506, 60, '最终幻想 15 Final Fantasy XV ', '../../img/goodsImg/506.jpg', 349, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (507, 60, '生化危机7 ', '../../img/goodsImg/507.jpg', 326, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (508, 60, '国土防线2', '../../img/goodsImg/508.jpg', 219, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (509, 60, '侠盗猎车手5', '../../img/goodsImg/509.jpg', 276, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (510, 60, '尼尔：机械纪元', '../../img/goodsImg/510.jpg', 385, '张', 0, 0.018, '2020-02-06 00:00:00', 200, 0);
INSERT INTO `goods` VALUES (511, 61, '万国(IWC)手表 葡萄牙系列', '../../img/goodsImg/511.jpg', 334500, '块', 0, 0.15, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (512, 61, '劳力士（ROLEX）手表', '../../img/goodsImg/512.jpg', 280500, '块', 0, 0.15, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (513, 61, '欧米茄（OMEGA）手表 海马系列', '../../img/goodsImg/513.jpg', 249300, '块', 0, 0.15, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (514, 61, '劳力士（Rolex）玫瑰金表手表116515LN', '../../img/goodsImg/514.jpg', 227500, '块', 0, 0.15, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (515, 61, '真力时（ZENITH）手表 指挥官系列', '../../img/goodsImg/515.jpg', 140000, '块', 0, 0.15, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (516, 62, 'MontBlanc万宝龙限量版卢多维科', '../../img/goodsImg/516.jpg', 100800, '支', 0, 0.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (517, 62, 'MontBlanc万宝龙限量艺术赞助', '../../img/goodsImg/517.jpg', 96600, '支', 0, 0.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (518, 62, 'MontBlanc万宝龙大班暮蓝149 ', '../../img/goodsImg/518.jpg', 81580, '支', 0, 0.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (519, 62, 'MontBlanc万宝龙限量版888墨水笔', '../../img/goodsImg/519.jpg', 98800, '支', 0, 0.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (520, 62, 'MontBlanc万宝龙星际行者系列钢笔世界', '../../img/goodsImg/520.jpg', 54380, '支', 0, 0.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (521, 63, 'VERTU眼镜蛇限量版 ', '../../img/goodsImg/521.jpg', 2474000, '部', 0, 0.16, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (522, 63, '詹姆士R19 Plus 君权版', '../../img/goodsImg/522.jpg', 25800, '部', 0, 0.16, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (523, 63, '华为mate9保时捷设计', '../../img/goodsImg/523.jpg', 19999, '部', 0, 0.16, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (524, 63, 'HANMAC 海恩迈 将军系列', '../../img/goodsImg/524.jpg', 19800, '部', 0, 0.16, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (525, 63, '三星G9298 ', '../../img/goodsImg/525.jpg', 15999, '部', 0, 0.16, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (526, 64, 'S.T.Dupont 法国都彭Ligne2', '../../img/goodsImg/526.jpg', 51300, '只', 0, 0.287, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (527, 64, '第11111号 正品之宝zippo打火机', '../../img/goodsImg/527.jpg', 23000, '只', 0, 0.287, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (528, 64, '纪梵希打火机 ', '../../img/goodsImg/528.jpg', 4880, '只', 0, 0.287, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (529, 64, 'Zippo打火机 镀铬盔甲镜面75周年纪念限量版', '../../img/goodsImg/529.jpg', 2980, '只', 0, 0.287, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (530, 64, 'Zippo打火机 C01 01年镀金花纱', '../../img/goodsImg/530.jpg', 2580, '只', 0, 0.287, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (531, 65, 'ZrCr2020秋装新款纯色丝绒外套', '../../img/goodsImg/531.jpg', 4690, '件', 0, 0.3, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (532, 65, '罗威奢品品牌2020秋季新款', '../../img/goodsImg/532.jpg', 3338, '件', 0, 0.3, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (533, 65, 'STACCATO/思加图2020年冬季专柜同款', '../../img/goodsImg/533.jpg', 2899, '件', 0, 0.3, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (534, 65, '生活在左时装周款装', '../../img/goodsImg/534.jpg', 2899, '件', 0, 0.3, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (535, 65, 'CCXII夏季针织露肩连衣裙', '../../img/goodsImg/535.jpg', 2891, '件', 0, 0.3, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (536, 66, 'MEIYUN/美赟珠宝南洋金珠大溪地黑珍珠', '../../img/goodsImg/536.jpg', 49999, '颗', 0, 0.1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (537, 66, '恒久之星珠宝 钻戒', '../../img/goodsImg/537.jpg', 33333, '颗', 0, 0.1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (538, 66, 'TESiRO通灵珠宝 50分H色 ', '../../img/goodsImg/538.jpg', 25875, '颗', 0, 0.1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (539, 66, '罗曼蒂珠宝白18K金钻戒', '../../img/goodsImg/539.jpg', 25590, '颗', 0, 0.1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (540, 66, '爱度珠宝 Doido 钻石吊坠/', '../../img/goodsImg/540.jpg', 21040, '颗', 0, 0.1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (541, 67, '911 Turbo S', '../../../img/goodsImg/1595845552581.jpg', 3358000, '辆', 0, 2000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (542, 67, '兰博基尼Aventador', '../../img/goodsImg/542.jpg', 8011500, '辆', 0, 2000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (543, 67, '劳斯莱斯幻影', '../../img/goodsImg/543.jpg', 14880000, '辆', 0, 2000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (544, 67, '玛莎拉蒂GranCabrio', '../../img/goodsImg/544.jpg', 3020000, '辆', 0, 2000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (545, 67, '迈巴赫S级', '../../img/goodsImg/545.jpg', 2880000, '辆', 0, 2000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (546, 68, '法国亚诺Pestige60', '../../img/goodsImg/546.jpg', 14800000, '艘', 0, 100000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (547, 68, '全新Ferretti Yachts 450', '../../img/goodsImg/547.jpg', 28880000, '艘', 0, 100000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (548, 68, '蒙地卡罗游艇MCY 105', '../../img/goodsImg/548.jpg', 65000000, '艘', 0, 100000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (549, 68, '亲吻天空号', '../../img/goodsImg/549.jpg', 230800000, '艘', 0, 30000000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (550, 68, '武士刀号', '../../img/goodsImg/550.jpg', 448420000, '艘', 0, 65000000, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (551, 69, '宝缇嘉 BV 女士红色羊', '../../img/goodsImg/551.jpg', 29000, '个', 0, 1.14, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (552, 69, '古驰（GUCCI）女士手提包', '../../img/goodsImg/552.jpg', 28019, '个', 0, 1.14, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (553, 69, '芬迪 女士银色牛皮立体花朵手提', '../../img/goodsImg/553.jpg', 27990, '个', 0, 1.14, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (554, 69, '普拉达 女士Cahier系列黑色粉雾', '../../img/goodsImg/554.jpg', 26680, '个', 0, 1.14, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (555, 69, 'GUCCI女包 Dionysus系列乌', '../../img/goodsImg/555.jpg', 26640, '个', 0, 1.14, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (556, 70, '拉菲1982年正牌', '../../img/goodsImg/556.jpg', 888828, '瓶', 0, 1.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (557, 70, '罗曼尼康帝酒园红葡萄酒 ', '../../img/goodsImg/557.jpg', 156000, '瓶', 0, 1.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (558, 70, '波尔多波美侯产区 柏图斯干红葡萄酒 ', '../../img/goodsImg/558.jpg', 33088, '瓶', 0, 1.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (559, 70, '奔富BIN系列红酒 ', '../../img/goodsImg/559.jpg', 27300, '瓶', 0, 1.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (560, 70, '里鹏庄园干红葡萄酒 ', '../../img/goodsImg/560.jpg', 185600, '瓶', 0, 1.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (561, 71, '森淼实木质相框摆台', '../../img/goodsImg/561.jpg', 14, '个', 0, 1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (562, 71, '晟旎尚品 11框实木组合相框', '../../img/goodsImg/562.jpg', 129, '个', 0, 1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (563, 71, '天字一号 实木相框架7', '../../img/goodsImg/563.jpg', 5, '个', 0, 1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (564, 71, '现代挂墙相框', '../../img/goodsImg/564.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (565, 71, '米子家居 三联蝴蝶结相框', '../../img/goodsImg/565.jpg', 62, '个', 0, 1, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (566, 72, '谭木匠 SP礼盒漆艺镜-青颜 木镜子', '../../img/goodsImg/566.jpg', 138, '面', 0, 0.21, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (567, 72, '欧润哲 镜子', '../../img/goodsImg/567.jpg', 35.9, '面', 0, 0.21, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (568, 72, '玛丽弟弟化妆镜子', '../../img/goodsImg/568.jpg', 9.9, '面', 0, 0.21, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (569, 72, '美人坊便携小镜子', '../../img/goodsImg/569.jpg', 19.9, '面', 0, 0.21, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (570, 72, '图胜图 便携台式镜子', '../../img/goodsImg/570.jpg', 29, '面', 0, 0.21, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (571, 73, '锦巢 卧室多功能梳妆台', '../../img/goodsImg/571.jpg', 399, '个', 0, 35, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (572, 73, '卧室梳妆台现代简约', '../../img/goodsImg/572.jpg', 537, '个', 0, 35, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (573, 73, '树之家 梳妆台', '../../img/goodsImg/573.jpg', 1014, '个', 0, 35, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (574, 73, '艾森雅 梳妆台', '../../img/goodsImg/574.jpg', 1788, '个', 0, 35, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (575, 73, '风之意 梳妆台', '../../img/goodsImg/575.jpg', 899, '个', 0, 35, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (576, 74, '香港红苹果 席梦思床垫', '../../img/goodsImg/576.jpg', 1299, '张', 0, 43, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (577, 74, '宜眠坊（ESF）床垫', '../../img/goodsImg/577.jpg', 799, '张', 0, 43, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (578, 74, '喜临门（SLEEMON）乳胶椰棕床垫', '../../img/goodsImg/578.jpg', 2299, '张', 0, 43, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (579, 74, '【北极熊】天然乳胶床垫', '../../img/goodsImg/579.jpg', 2599, '张', 0, 43, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (580, 74, '优自然 泰国进口天然乳胶床垫', '../../img/goodsImg/580.jpg', 1199, '张', 0, 43, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (581, 75, '浪莎 床品家纺', '../../img/goodsImg/581.jpg', 298, '套', 0, 2.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (582, 75, '南极人四件套纯棉床上用品全棉床品', '../../img/goodsImg/582.jpg', 149, '套', 0, 2.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (583, 75, '博洋家纺 （BEYOND）床品', '../../img/goodsImg/583.jpg', 388, '套', 0, 2.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (584, 75, '富安娜（FUANNA）家纺床品', '../../img/goodsImg/584.jpg', 498, '套', 0, 2.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (585, 75, '多喜爱(Dohia)床品', '../../img/goodsImg/585.jpg', 229, '套', 0, 2.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (586, 76, '木以成居 床头柜 ', '../../img/goodsImg/586.jpg', 99, '个', 0, 7.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (587, 76, 'ADL/奥黛丽 简约现代皮艺床头柜 ', '../../img/goodsImg/587.jpg', 299, '个', 0, 7.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (588, 76, '蔓斯菲尔床头柜', '../../img/goodsImg/588.jpg', 39, '个', 0, 7.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (589, 76, '家逸 简约床头柜', '../../img/goodsImg/589.jpg', 199, '个', 0, 7.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (590, 76, '家逸 韩式床头柜', '../../img/goodsImg/590.jpg', 239, '个', 0, 7.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (591, 77, '申道正品台湾汝窑茶具', '../../img/goodsImg/591.jpg', 641, '套', 0, 3.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (592, 77, '雅诚德arst陶瓷整套茶具', '../../img/goodsImg/592.jpg', 243, '套', 0, 3.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (593, 77, '金镶玉 功夫茶具套装 ', '../../img/goodsImg/593.jpg', 299, '套', 0, 3.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (594, 77, '言艺 茶具 紫砂陶瓷功夫茶具', '../../img/goodsImg/594.jpg', 99, '套', 0, 3.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (595, 77, '豪峰 整套功夫茶具', '../../img/goodsImg/595.jpg', 298, '套', 0, 3.5, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (596, 78, '欧式玻璃花瓶摆', '../../img/goodsImg/596.jpg', 58, '个', 0, 2.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (597, 78, '韦柯（WENCCO)北欧风铁艺插花瓶 ', '../../img/goodsImg/597.jpg', 39, '个', 0, 2.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (598, 78, '米子家居 居家装饰陶瓷花瓶', '../../img/goodsImg/598.jpg', 79, '个', 0, 2.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (599, 78, '欢畅景德镇花瓶', '../../img/goodsImg/599.jpg', 28, '个', 0, 2.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (600, 78, '贝汉美 家居饰品陶瓷花瓶', '../../img/goodsImg/600.jpg', 69.8, '个', 0, 2.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (601, 79, '缘艺馨 实木餐桌', '../../img/goodsImg/601.jpg', 3899, '张', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (602, 79, '丽巢餐桌', '../../img/goodsImg/602.jpg', 3099, '张', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (603, 79, '明都 欧式餐桌', '../../img/goodsImg/603.jpg', 300, '张', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (604, 79, '精邦 餐桌', '../../img/goodsImg/604.jpg', 759, '张', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (605, 79, '乐和居 餐桌', '../../img/goodsImg/605.jpg', 2399, '张', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (606, 80, '贝能(Baoneo)儿童餐椅', '../../img/goodsImg/606.jpg', 286, '张', 0, 8.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (607, 80, '星威 餐椅', '../../img/goodsImg/607.jpg', 588, '张', 0, 8.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (608, 80, '爱音（Aing）儿童餐椅 ', '../../img/goodsImg/608.jpg', 98, '张', 0, 8.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (609, 80, '爱必居 实木餐椅 ', '../../img/goodsImg/609.jpg', 239, '张', 0, 8.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (610, 80, '宝宝好儿童餐椅', '../../img/goodsImg/610.jpg', 129, '张', 0, 8.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (611, 81, '茶花 粘钩挂钩', '../../img/goodsImg/611.jpg', 9.9, '套', 0, 0.05, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (612, 81, '双庆家居 吸盘挂钩', '../../img/goodsImg/612.jpg', 29.9, '套', 0, 0.05, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (613, 81, '易时代 不锈钢挂钩', '../../img/goodsImg/613.jpg', 17.5, '套', 0, 0.05, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (614, 81, '雨花泽（Yuhuaze） 挂勾', '../../img/goodsImg/614.jpg', 13.9, '套', 0, 0.05, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (615, 81, '乾越 【免打孔/不伤墙】强力无痕挂钩', '../../img/goodsImg/615.jpg', 11.8, '套', 0, 0.05, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (616, 82, '法恩莎浴缸卫浴', '../../img/goodsImg/616.jpg', 1856, '个', 0, 80, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (617, 82, '沃特玛薄边新款独立式浴缸', '../../img/goodsImg/617.jpg', 1998, '个', 0, 80, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (618, 82, '九牧（JOMOO）浴缸亚克力浴缸', '../../img/goodsImg/618.jpg', 4999, '个', 0, 80, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (619, 82, '科勒(KOHLER)嵌入式浴缸', '../../img/goodsImg/619.jpg', 1311, '个', 0, 80, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (620, 82, '箭牌卫浴ARROW亚克力五件套浴缸', '../../img/goodsImg/620.jpg', 2999, '个', 0, 80, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (621, 83, '剑林 创意欧式陶瓷餐具', '../../img/goodsImg/621.jpg', 369, '套', 0, 10.51, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (622, 83, '雅诚德arst陶瓷餐具', '../../img/goodsImg/622.jpg', 128, '套', 0, 10.51, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (623, 83, '玉泉 初雨 陶瓷餐具 ', '../../img/goodsImg/623.jpg', 289, '套', 0, 10.51, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (624, 83, '御晟景德镇陶瓷器骨瓷餐具', '../../img/goodsImg/624.jpg', 268, '套', 0, 10.51, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (625, 83, '泥火匠餐具', '../../img/goodsImg/625.jpg', 99, '套', 0, 10.51, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (626, 84, '张小泉 古韵系列不锈钢七件刀具', '../../img/goodsImg/626.jpg', 159, '套', 0, 2.66, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (627, 84, '苏泊尔（SUPOR）7件套刀具 ', '../../img/goodsImg/627.jpg', 199, '套', 0, 2.66, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (628, 84, '十八子作 厨房刀具组合', '../../img/goodsImg/628.jpg', 49, '套', 0, 2.66, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (629, 84, '双立人（ZWILLING）刀具', '../../img/goodsImg/629.jpg', 898, '套', 0, 2.66, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (630, 84, '炊大皇 不锈钢刀具七件套装 ', '../../img/goodsImg/630.jpg', 149, '套', 0, 2.66, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (631, 85, '苏泊尔supor 居家不粘三件套锅', '../../img/goodsImg/631.jpg', 199, '套', 0, 5.12, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (632, 85, '双立人百年锅具', '../../img/goodsImg/632.jpg', 1388, '套', 0, 5.12, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (633, 85, '炊大皇锅具套装', '../../img/goodsImg/633.jpg', 159, '套', 0, 5.12, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (634, 85, '美厨（maxcook）锅具套装', '../../img/goodsImg/634.jpg', 99, '套', 0, 5.12, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (635, 85, '苏泊尔锅具套装 炒锅 汤锅 煎锅三件套', '../../img/goodsImg/635.jpg', 599, '套', 0, 5.12, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (636, 86, '雷士（NVC）led集成吊顶灯', '../../img/goodsImg/636.jpg', 99, '个', 0, 0.74, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (637, 86, 'TCL 卧室灯led吸顶灯', '../../img/goodsImg/637.jpg', 569, '个', 0, 0.74, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (638, 86, '欧普照明led吸顶灯', '../../img/goodsImg/638.jpg', 189, '个', 0, 0.74, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (639, 86, '松下（Panasonic）吸顶灯', '../../img/goodsImg/639.jpg', 1499, '个', 0, 0.74, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (640, 86, '雷士照明 客厅灯led吸顶灯 ', '../../img/goodsImg/640.jpg', 2399, '个', 0, 0.74, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (641, 87, '富居(FOOJO)地毯', '../../img/goodsImg/641.jpg', 59, '个', 0, 0.97, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (642, 87, '万腾 欧式地毯', '../../img/goodsImg/642.jpg', 340, '个', 0, 0.97, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (643, 87, '捷成地毯', '../../img/goodsImg/643.jpg', 91, '个', 0, 0.97, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (644, 87, '家易净 地毯', '../../img/goodsImg/644.jpg', 89, '个', 0, 0.97, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (645, 87, '万腾 欧式地毯', '../../img/goodsImg/645.jpg', 340, '个', 0, 0.97, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (646, 88, '家乐铭品 鞋柜', '../../img/goodsImg/646.jpg', 199, '个', 0, 17.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (647, 88, 'BS家具 客厅实木翻斗鞋柜 ', '../../img/goodsImg/647.jpg', 969, '个', 0, 17.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (648, 88, '家逸实木鞋柜', '../../img/goodsImg/648.jpg', 1399, '个', 0, 17.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (649, 88, '蔓斯菲尔简易鞋柜', '../../img/goodsImg/649.jpg', 199, '个', 0, 17.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (650, 88, '亿家达简易鞋柜 ', '../../img/goodsImg/650.jpg', 158, '个', 0, 17.6, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (651, 89, '木以成居 电脑桌钢木书桌 ', '../../img/goodsImg/651.jpg', 129, '个', 0, 9.56, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (652, 89, '海洋卫士电脑桌', '../../img/goodsImg/652.jpg', 158, '个', 0, 9.56, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (653, 89, '亿家达电脑桌 台式家用 书桌 ', '../../img/goodsImg/653.jpg', 99, '个', 0, 9.56, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (654, 89, '朗程简约台式电脑桌 书桌 ', '../../img/goodsImg/654.jpg', 149, '个', 0, 9.56, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (655, 89, '香可 钢木电脑桌台式简易书桌', '../../img/goodsImg/655.jpg', 199, '个', 0, 9.56, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (656, 90, '联丰(lianfeng) 电脑椅 办公椅 家用转椅', '../../img/goodsImg/656.jpg', 199, '个', 0, 9.77, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (657, 90, '西昊/SIHOO 人体工学电脑椅子 ', '../../img/goodsImg/657.jpg', 599, '个', 0, 9.77, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (658, 90, '迪锐克斯（DXRACER）电脑椅', '../../img/goodsImg/658.jpg', 1499, '个', 0, 9.77, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (659, 90, '伯力斯（BECAUSES）电脑椅', '../../img/goodsImg/659.jpg', 189, '个', 0, 9.77, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (660, 90, '生活诚品 电脑椅 椅子 办公椅 家用转椅', '../../img/goodsImg/660.jpg', 199, '个', 0, 9.77, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (661, 91, '诗尼曼衣柜', '../../img/goodsImg/661.jpg', 798, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (662, 91, '丽巢家具 推拉门衣柜', '../../img/goodsImg/662.jpg', 2940, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (663, 91, '尚品宅配 衣柜', '../../img/goodsImg/663.jpg', 500, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (664, 91, '索菲亚衣柜', '../../img/goodsImg/664.jpg', 899, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (665, 91, '全友家居 现代时尚板式衣柜', '../../img/goodsImg/665.jpg', 1819, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (666, 92, '墙面装饰品挂画', '../../img/goodsImg/666.jpg', 192.28, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (667, 92, '幼儿园装饰墙面区角布置组合墙贴', '../../img/goodsImg/667.jpg', 45.6, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (668, 92, '港恒圣诞装饰品 10-41cm泡沫墙面贴饰', '../../img/goodsImg/668.jpg', 19.94, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (669, 92, '画框创意挂墙客厅装饰画', '../../img/goodsImg/669.jpg', 208.15, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (670, 92, '幼儿园教室走廊装饰吊饰墙面贴饰', '../../img/goodsImg/670.jpg', 14, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (671, 93, '炫彩小家 书架', '../../img/goodsImg/671.jpg', 148, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (672, 93, '好事达书柜书架', '../../img/goodsImg/672.jpg', 129, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (673, 93, '木马人 组合简易书架', '../../img/goodsImg/673.jpg', 149, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (674, 93, '哈尔优 楠竹书架', '../../img/goodsImg/674.jpg', 58, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (675, 93, '慧乐家 书架', '../../img/goodsImg/675.jpg', 109, '个', 0, 10, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (676, 94, '新饰荣 电视柜', '../../img/goodsImg/676.jpg', 829, '个', 0, 52, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (677, 94, '青岛一木 电视柜 ', '../../img/goodsImg/677.jpg', 2599, '个', 0, 52, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (678, 94, '卧派 电视柜可伸缩钢化玻璃电视柜', '../../img/goodsImg/678.jpg', 2300, '个', 0, 52, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (679, 94, '丽巢 实木电视柜', '../../img/goodsImg/679.jpg', 1860, '个', 0, 52, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (680, 94, '华纳斯 电视柜', '../../img/goodsImg/680.jpg', 1519, '个', 0, 52, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (681, 95, '巨惠包装收纳箱', '../../img/goodsImg/681.jpg', 12.8, '个', 0, 1.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (682, 95, '百草园收纳箱', '../../img/goodsImg/682.jpg', 59.9, '个', 0, 1.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (683, 95, '青苇收纳盒', '../../img/goodsImg/683.jpg', 69, '个', 0, 1.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (684, 95, '禧天龙（Citylong）收纳箱', '../../img/goodsImg/684.jpg', 59, '个', 0, 1.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (685, 95, '百家好世儿童收纳箱', '../../img/goodsImg/685.jpg', 39.9, '个', 0, 1.2, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (686, 96, '威猛先生 厨房重油污净', '../../img/goodsImg/686.jpg', 19.9, '个', 0, 1.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (687, 96, '蓝月亮 地板清洁剂', '../../img/goodsImg/687.jpg', 27.8, '个', 0, 1.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (688, 96, '蓝月亮 强力型厨房油污净 ', '../../img/goodsImg/688.jpg', 26.8, '个', 0, 1.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (689, 96, '威猛先生 5合1洁厕液 ', '../../img/goodsImg/689.jpg', 19.9, '个', 0, 1.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (690, 96, '净安（Cleafe）洗衣机槽清洗剂', '../../img/goodsImg/690.jpg', 8.9, '个', 0, 1.02, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (691, 97, '九牧（JOMOO）卫浴五金套件', '../../img/goodsImg/691.jpg', 399, '套', 0, 4, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (692, 97, '箭牌卫浴浴室五金挂件套件', '../../img/goodsImg/692.jpg', 780, '套', 0, 4, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (693, 97, '卫浴套件浴室用品套件', '../../img/goodsImg/693.jpg', 118, '套', 0, 4, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (694, 97, '普润 卫浴套件浴室用品套件_', '../../img/goodsImg/694.jpg', 63, '套', 0, 4, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (695, 97, '特兰恩 卫浴套件欧式陶瓷卫浴', '../../img/goodsImg/695.jpg', 128, '套', 0, 4, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (696, 98, '诸美（ZM）消毒柜 家用消毒碗柜', '../../img/goodsImg/696.jpg', 468, '个', 0, 20, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (697, 98, '康宝（Canbo)消毒柜', '../../img/goodsImg/697.jpg', 1399, '个', 0, 20, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (698, 98, '凡萨帝(Fasato)商用消毒柜立式 ', '../../img/goodsImg/698.jpg', 999, '个', 0, 20, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (699, 98, '凡萨帝（Fasato）YTP910K-3A 商用消毒柜', '../../img/goodsImg/699.jpg', 1580, '个', 0, 20, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (700, 98, '万昌消毒柜家用', '../../img/goodsImg/700.jpg', 269, '个', 0, 20, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (701, 99, '虎牌保险柜FDG-A1/D-55', '../../img/goodsImg/701.jpg', 1288, '个', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (702, 99, '得力（deli）33146 圣骑士系列高级保险箱 ', '../../img/goodsImg/702.jpg', 1698, '个', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (703, 99, '全能保险柜办公密码柜', '../../img/goodsImg/703.jpg', 528, '个', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (704, 99, '大一保险柜', '../../img/goodsImg/704.jpg', 398, '个', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (705, 99, '全能保险柜办公', '../../img/goodsImg/705.jpg', 199, '个', 0, 65, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (706, 100, 'A家家具 沙发', '../../img/goodsImg/706.jpg', 1599, '个', 0, 48.7, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (707, 100, '卡菲纳 沙发', '../../img/goodsImg/707.jpg', 1980, '个', 0, 48.7, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (708, 100, '摩天 沙发', '../../img/goodsImg/708.jpg', 5380, '个', 0, 48.7, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (709, 100, '慕尼思丹 沙发 ', '../../img/goodsImg/709.jpg', 5399, '个', 0, 48.7, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (710, 100, '丽巢实木沙发', '../../img/goodsImg/710.jpg', 6600, '个', 0, 48.7, '2020-02-06 00:00:00', 50, 0);
INSERT INTO `goods` VALUES (711, 101, '努比亚nubia Z17 ', '../../img/goodsImg/711.jpg', 2699, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 2);
INSERT INTO `goods` VALUES (712, 101, '诺基亚6', '../../img/goodsImg/712.jpg', 1699, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (713, 101, '锤子 坚果Pro ', '../../img/goodsImg/713.jpg', 1799, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (714, 101, '三星 Galaxy S7 edge', '../../img/goodsImg/714.jpg', 3399, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (715, 101, 'iPhone 8 Plus�', '../../img/goodsImg/715.jpg', 7988, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (716, 102, '飞利浦 Philips E106 ', '../../img/goodsImg/716.jpg', 99, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (717, 102, '飞利浦 E311 海军蓝 ', '../../img/goodsImg/717.jpg', 229, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (718, 102, '天语（K-Touch）H998', '../../img/goodsImg/718.jpg', 138, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (719, 102, '尼凯恩（Neken）/EN3', '../../img/goodsImg/719.jpg', 99, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (720, 102, '诺基亚（NOKIA）105 ', '../../img/goodsImg/720.jpg', 179, '部', 0, 0.15, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (721, 103, 'ThinkPad New S2', '../../img/goodsImg/721.jpg', 4588, '台', 0, 4.3, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (722, 103, '联想(Lenovo)拯救者R720 ', '../../img/goodsImg/722.jpg', 6399, '台', 0, 4.3, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (723, 103, 'Apple MacBook Air', '../../img/goodsImg/723.jpg', 5988, '台', 0, 4.3, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (724, 103, '戴尔DELL XPS13-9360-R1609 ', '../../img/goodsImg/724.jpg', 7999, '台', 0, 4.3, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (725, 103, '小米(MI)Air', '../../img/goodsImg/725.jpg', 5199, '台', 0, 4.3, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (726, 104, '联想（Lenovo）天逸510S商用台式', '../../img/goodsImg/726.jpg', 3199, '台', 0, 7.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (727, 104, '联想（Lenovo）拯救者 刃7000', '../../img/goodsImg/727.jpg', 4999, '台', 0, 7.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (728, 104, '戴尔（DELL）台式电脑整机 ', '../../img/goodsImg/728.jpg', 2699, '台', 0, 7.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (729, 104, '戴尔（DELL）V3668-R1408台式电脑', '../../img/goodsImg/729.jpg', 3499, '台', 0, 7.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (730, 104, '惠普（HP）光影精灵 580-076cn台式', '../../img/goodsImg/730.jpg', 6099, '台', 0, 7.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (731, 105, 'Apple iPad mini 4�', '../../img/goodsImg/731.jpg', 2998, '台', 0, 0.59, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (732, 105, '华为(HUAWEI)M3', '../../img/goodsImg/732.jpg', 1839, '台', 0, 0.59, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (733, 105, '荣耀平板2 ', '../../img/goodsImg/733.jpg', 999, '台', 0, 0.59, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (734, 105, '微软（Microsoft）Surface Pro ', '../../img/goodsImg/734.jpg', 9888, '台', 0, 0.59, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (735, 105, 'Apple iPad Pro', '../../img/goodsImg/735.jpg', 4988, '台', 0, 0.59, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (736, 106, '索尼（SONY）【PS4 Pro 国行主机】', '../../img/goodsImg/736.jpg', 2999, '台', 0, 4.615, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (737, 106, '索尼（SONY）PS4Slim', '../../img/goodsImg/737.jpg', 1888, '台', 0, 4.615, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (738, 106, '微软（Microsoft） Xbox One S ', '../../img/goodsImg/738.jpg', 2199, '台', 0, 4.615, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (739, 106, '任天堂 Nintendo Switch ', '../../img/goodsImg/739.jpg', 3098, '台', 0, 4.615, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (740, 106, 'Microsoft/微软Xbox', '../../img/goodsImg/740.jpg', 2490, '台', 0, 4.615, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (741, 107, 'Sony 索尼 PSV 2000 VITA', '../../img/goodsImg/741.jpg', 1198, '台', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (742, 107, 'Nintendo 任天堂 New 3ds', '../../img/goodsImg/742.jpg', 1899, '台', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (743, 107, 'PlayStationVita�psp�', '../../img/goodsImg/743.jpg', 1299, '台', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (744, 107, 'Nintendo 任天堂 New 3ds 3dsLL', '../../img/goodsImg/744.jpg', 1899, '台', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (745, 107, '小霸王游戏机掌机', '../../img/goodsImg/745.jpg', 289, '台', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (746, 108, '佳能（Canon）PowerShot SX720 HS', '../../img/goodsImg/746.jpg', 1879, '台', 0, 0.44, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (747, 108, '索尼（SONY） DSC-RX100', '../../img/goodsImg/747.jpg', 2299, '台', 0, 0.44, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (748, 108, '尼康（NIKON） Coolpix A100 ', '../../img/goodsImg/748.jpg', 649, '台', 0, 0.44, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (749, 108, '富士（FUJIFILM）X100F ', '../../img/goodsImg/749.jpg', 8600, '台', 0, 0.44, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (750, 108, '卡西欧（CASIO）EX-TR750', '../../img/goodsImg/750.jpg', 5999, '台', 0, 0.44, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (751, 109, '万佳CF-65FA9', '../../img/goodsImg/751.jpg', 3799, '台', 0, 30, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (752, 109, '飞利浦（PHILIPS）32PHF3661/T3', '../../img/goodsImg/752.jpg', 1199, '台', 0, 30, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (753, 109, '长虹（CHANGHONG）84J2000 ', '../../img/goodsImg/753.jpg', 35800, '台', 0, 30, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (754, 109, '飞利浦（PHILIPS）BDL8430QD', '../../img/goodsImg/754.jpg', 78999, '台', 0, 30, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (755, 109, '长虹（CHANGHONG）55J3000 5', '../../img/goodsImg/755.jpg', 3598, '台', 0, 30, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (756, 110, '索尼（SONY）FDR-AX40 4K高清数码摄像机 ', '../../img/goodsImg/756.jpg', 5299, '台', 0, 1.05, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (757, 110, 'JVC JY-HM95AC 专业高清闪存摄像机', '../../img/goodsImg/757.jpg', 6599, '台', 0, 1.05, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (758, 110, 'GoPro HERO 5 Black 运动摄像机', '../../img/goodsImg/758.jpg', 3398, '台', 0, 1.05, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (759, 110, '松下（Panasonic） HC-MDH2GK-K 肩扛式数码摄像机 ', '../../img/goodsImg/759.jpg', 5779, '台', 0, 1.05, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (760, 110, '台湾欧达Z20摄像机高', '../../img/goodsImg/760.jpg', 1830, '台', 0, 1.05, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (761, 111, 'Kindle Paperwhite�', '../../img/goodsImg/761.jpg', 958, '部', 0, 0.4, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (762, 111, 'kindle 新款入门', '../../img/goodsImg/762.jpg', 559, '部', 0, 0.4, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (763, 111, 'Kindle voyage�', '../../img/goodsImg/763.jpg', 1499, '部', 0, 0.4, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (764, 111, 'JDRead京东电子书 ', '../../img/goodsImg/764.jpg', 769, '部', 0, 0.4, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (765, 111, '掌阅（iReader） Light 青春版', '../../img/goodsImg/765.jpg', 658, '部', 0, 0.4, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (766, 112, '易通（Besta）WN-3 电子词典', '../../img/goodsImg/766.jpg', 499, '部', 0, 0.32, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (767, 112, '好易通 Besta WN-7电子词典', '../../img/goodsImg/767.jpg', 1398, '部', 0, 0.32, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (768, 112, 'Casio卡西欧电子词典E-Y200', '../../img/goodsImg/768.jpg', 2490, '部', 0, 0.32, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (769, 112, '快易典A920英语电子词典', '../../img/goodsImg/769.jpg', 338, '部', 0, 0.32, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (770, 112, '快易典EH3英语电子词典', '../../img/goodsImg/770.jpg', 458, '部', 0, 0.32, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (771, 113, '大疆Mavic Pro ', '../../img/goodsImg/771.jpg', 7999, '架', 0, 4.35, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (772, 113, '卓优 专业航拍器无人机', '../../img/goodsImg/772.jpg', 1299, '架', 0, 4.35, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (773, 113, '大疆（DJI）精灵Phantom 3 SE', '../../img/goodsImg/773.jpg', 3449, '架', 0, 4.35, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (774, 113, '卓优 专业航拍器无人机', '../../img/goodsImg/774.jpg', 410000, '架', 0, 4.35, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (775, 113, '蓝天飞扬无人机飞行器MC6-1000', '../../img/goodsImg/775.jpg', 398600, '架', 0, 4.35, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (776, 114, 'Aqara墙壁开关', '../../img/goodsImg/776.jpg', 139, '套', 0, 0.5, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (777, 114, '悦控 UCON 智能遥控器 ', '../../img/goodsImg/777.jpg', 99, '套', 0, 20, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (778, 114, '绿袖子 智能三居室', '../../img/goodsImg/778.jpg', 7230, '套', 0, 20, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (779, 114, '霍尼韦尔（Honeywell）LYNX TOUCH ', '../../img/goodsImg/779.jpg', 5999, '套', 0, 20, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (780, 114, '斑点猫spotmau双开门', '../../img/goodsImg/780.jpg', 6923, '套', 0, 20, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (781, 115, 'NOERDEN 牛丁LIFE 时尚智能手表 ', '../../img/goodsImg/781.jpg', 299, '块', 0, 0.202, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (782, 115, 'Apple Watch Series 3智能手表', '../../img/goodsImg/782.jpg', 3488, '块', 0, 0.202, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (783, 115, 'Amazfit 米动手表青春版', '../../img/goodsImg/783.jpg', 399, '块', 0, 0.202, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (784, 115, 'HUAWEI WATCH 2�', '../../img/goodsImg/784.jpg', 1988, '块', 0, 0.202, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (785, 115, '荣耀手表S1 ', '../../img/goodsImg/785.jpg', 588, '块', 0, 0.202, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (786, 116, '荣耀手环3 ', '../../img/goodsImg/786.jpg', 229, '块', 0, 0.08, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (787, 116, '乐心 MAMBO2 ', '../../img/goodsImg/787.jpg', 169, '块', 0, 0.08, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (788, 116, '小米（MI）小米手环2代', '../../img/goodsImg/788.jpg', 149, '块', 0, 0.08, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (789, 116, '拉卡拉手环 ', '../../img/goodsImg/789.jpg', 178, '块', 0, 0.08, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (790, 116, '华为手环B3 ', '../../img/goodsImg/790.jpg', 1199, '块', 0, 0.08, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (791, 117, 'TP-LINK TL-WDR5620', '../../img/goodsImg/791.jpg', 139, '台', 0, 0.685, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (792, 117, '斐讯K2 1200M智能双频无线路由器 ', '../../img/goodsImg/792.jpg', 399, '台', 0, 0.685, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (793, 117, '360安全路由器P3 ', '../../img/goodsImg/793.jpg', 199, '台', 0, 0.685, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (794, 117, 'TP-LINK TL-WR886N�', '../../img/goodsImg/794.jpg', 87.5, '台', 0, 0.685, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (795, 117, '腾达（Tenda）AC10 1200M ', '../../img/goodsImg/795.jpg', 195, '台', 0, 0.685, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (796, 118, '罗马仕（ROMOSS）sense6 ', '../../img/goodsImg/796.jpg', 99, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (797, 118, '小米(MI) 10000毫安', '../../img/goodsImg/797.jpg', 79, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (798, 118, '品胜（PISEN）20000毫安 ', '../../img/goodsImg/798.jpg', 129, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (799, 118, '飞利浦充电宝', '../../img/goodsImg/799.jpg', 149, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (800, 118, '华为（HUAWEI）充电宝', '../../img/goodsImg/800.jpg', 299, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (801, 119, 'JBL 音响 ', '../../img/goodsImg/801.jpg', 1690000, '台', 0, 60, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (802, 119, '惠威（HiVi）Swans', '../../img/goodsImg/802.jpg', 162410, '台', 0, 60, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (803, 119, '索尼 SONY SS-AR1', '../../img/goodsImg/803.jpg', 124900, '台', 0, 60, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (804, 119, '麦景图（mcintosh）MXA70', '../../img/goodsImg/804.jpg', 79800, '台', 0, 60, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (805, 119, '索尼（SONY）SS-AR1 ', '../../img/goodsImg/805.jpg', 70000, '台', 0, 60, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (806, 120, 'TELEFUNKEN德律风根U47高端人声电子管麦克风', '../../img/goodsImg/806.jpg', 109999, '个', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (807, 120, '雷麦（LEIMAI）LM-5288U 无线麦克风', '../../img/goodsImg/807.jpg', 65000, '个', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (808, 120, 'Blue Bottle大瓶子奶瓶专业录音棚电子管电容麦克', '../../img/goodsImg/808.jpg', 70999, '个', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (809, 120, '爱科技（AKG） C12 VR ', '../../img/goodsImg/809.jpg', 39800, '个', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (810, 120, '方图（FionTu）F5 BK 嵌入式麦克风', '../../img/goodsImg/810.jpg', 49999, '个', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (811, 121, '森海塞尔/Sennheiser 奥菲斯II ', '../../img/goodsImg/811.jpg', 529999, '对', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (812, 121, 'Audeze 奥蒂兹 LCD-4 ', '../../img/goodsImg/812.jpg', 56699, '对', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (813, 121, '索尼（SONY）索尼 立体声耳机', '../../img/goodsImg/813.jpg', 28888, '对', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (814, 121, '橙朗 猫耳朵蓝牙耳机 ', '../../img/goodsImg/814.jpg', 24380, '对', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (815, 121, '舒尔（SHURE） KSE1500', '../../img/goodsImg/815.jpg', 22999, '对', 0, 1, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (816, 122, 'HTC�VIVE�', '../../img/goodsImg/816.jpg', 5488, '部', 0, 5.36, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (817, 122, '索尼PlayStation VR ', '../../img/goodsImg/817.jpg', 6898, '部', 0, 5.36, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (818, 122, 'AmanStino�VR', '../../img/goodsImg/818.jpg', 39999, '部', 0, 5.36, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (819, 122, 'FreeSpin�VR', '../../img/goodsImg/819.jpg', 32880, '部', 0, 5.36, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (820, 122, 'Tralean VR一体机', '../../img/goodsImg/820.jpg', 31009, '部', 0, 5.36, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (821, 123, '索尼（SONY）NW-A35HN ', '../../img/goodsImg/821.jpg', 1599, '部', 0, 0.24, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (822, 123, '索尼（SONY）NW-ZX100', '../../img/goodsImg/822.jpg', 3099, '部', 0, 0.24, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (823, 123, 'Apple iPod shuffle�', '../../img/goodsImg/823.jpg', 399, '部', 0, 0.24, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (824, 123, '锐族（RUIZU）X02 ', '../../img/goodsImg/824.jpg', 99, '台', 0, 0.24, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (825, 123, '纽曼（Newsmy）F35', '../../img/goodsImg/825.jpg', 99, '台', 0, 0.24, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (826, 124, '明基（BenQ）U610PLUS A3', '../../img/goodsImg/826.jpg', 2599, '台', 0, 6.55, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (827, 124, '佳能（Canon）LiDE120 扫描仪 ', '../../img/goodsImg/827.jpg', 385, '台', 0, 6.55, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (828, 124, '富士通（Fujitsu）ix500扫描仪', '../../img/goodsImg/828.jpg', 2799, '台', 0, 6.55, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (829, 124, '爱普生（EPSON）V19', '../../img/goodsImg/829.jpg', 399, '台', 0, 6.55, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (830, 124, '方正（Founder）Q1080高拍仪扫描仪', '../../img/goodsImg/830.jpg', 999, '台', 0, 6.55, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (831, 125, '360智能摄像头', '../../img/goodsImg/831.jpg', 299, '个', 0, 0.635, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (832, 125, '小方智能摄像头', '../../img/goodsImg/832.jpg', 139, '个', 0, 0.635, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (833, 125, '小蚁（YI）智能摄像头', '../../img/goodsImg/833.jpg', 169, '个', 0, 0.635, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (834, 125, '萤石（EZVIZ）C3C 4mm ', '../../img/goodsImg/834.jpg', 249, '个', 0, 0.635, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (835, 125, '中兴（ZTE）小兴看看', '../../img/goodsImg/835.jpg', 229, '个', 0, 0.635, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (836, 126, '飞利浦（PHILIPS）23.6英寸 ', '../../img/goodsImg/836.jpg', 799, '台', 0, 4.62, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (837, 126, 'AOC 23.6英寸 焕新二代PLS屏 ', '../../img/goodsImg/837.jpg', 888, '台', 0, 4.62, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (838, 126, '三星（SAMSUNG）C27F390FHC ', '../../img/goodsImg/838.jpg', 1499, '台', 0, 4.62, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (839, 126, '戴尔（DELL） U2417H ', '../../img/goodsImg/839.jpg', 1599, '台', 0, 4.62, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (840, 126, '三星（SAMSUNG）S24D360HL', '../../img/goodsImg/840.jpg', 949, '台', 0, 4.62, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (841, 127, '西部数据（WD） Elements 新元素系列 ', '../../img/goodsImg/841.jpg', 389, '块', 0, 0.17, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (842, 127, '希捷(SEAGATE)酷鱼系列', '../../img/goodsImg/842.jpg', 299, '块', 0, 0.17, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (843, 127, '东芝（TOSHIBA）新黑甲虫系列 ', '../../img/goodsImg/843.jpg', 369, '块', 0, 0.17, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (844, 127, '希捷（seagate）Expansion 新睿翼2TB', '../../img/goodsImg/844.jpg', 579, '块', 0, 0.17, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (845, 127, '三星(SAMSUNG) 850 EVO 500G', '../../img/goodsImg/845.jpg', 1199, '块', 0, 0.17, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (846, 128, '爱国者（aigo）R6611录音笔', '../../img/goodsImg/846.jpg', 199, '个', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (847, 128, '锐力（Relee）数码微型录音笔 ', '../../img/goodsImg/847.jpg', 299, '个', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (848, 128, '飞利浦（PHILIPS）VTR5200 ', '../../img/goodsImg/848.jpg', 499, '个', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (849, 128, '索尼（SONY） ICD-PX240 数码录音笔', '../../img/goodsImg/849.jpg', 299, '个', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (850, 128, '纽曼（Newsmy）V03 ', '../../img/goodsImg/850.jpg', 139, '个', 0, 0.25, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (851, 129, '小米（MI）小米盒子3C ', '../../img/goodsImg/851.jpg', 229, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (852, 129, '华为荣耀盒子Pro', '../../img/goodsImg/852.jpg', 429, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (853, 129, '创维(Skyworth) T2智能网络电视机顶盒', '../../img/goodsImg/853.jpg', 179, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (854, 129, '海美迪 H7四代', '../../img/goodsImg/854.jpg', 439, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (855, 129, 'WeBox泰捷WE30PRO ', '../../img/goodsImg/855.jpg', 489, '个', 0, 0.52, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (856, 130, '三星（SAMSUNG）Bar 64GB ', '../../img/goodsImg/856.jpg', 159, '个', 0, 0.02, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (857, 130, '金士顿（Kingston）32GB ', '../../img/goodsImg/857.jpg', 109, '个', 0, 0.02, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (858, 130, '闪迪（SanDisk）酷铄(CZ73) USB3.0', '../../img/goodsImg/858.jpg', 299, '个', 0, 0.02, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (859, 130, '东芝（TOSHIBA）隼闪系列', '../../img/goodsImg/859.jpg', 69.9, '个', 0, 0.02, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (860, 130, 'banq P9 U盘32G ', '../../img/goodsImg/860.jpg', 59.9, '个', 0, 0.02, '2020-02-06 00:00:00', 150, 0);
INSERT INTO `goods` VALUES (1521, 131, 'pureborn婴儿连体衣秋冬装宝宝', '../../img/goodsImg/1521.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1522, 131, '衣拉拉秋装婴儿连体衣男童纯棉', '../../img/goodsImg/1522.jpg', 86, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1523, 131, '童泰新款新生儿衣服男女宝宝偏开连体衣', '../../img/goodsImg/1523.jpg', 65, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1524, 131, 'papa冬彩棉宝宝仿羊羔绒带帽连体爬服', '../../img/goodsImg/1524.jpg', 169, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1525, 131, 'Carter\'s1件式短袖连体衣', '../../img/goodsImg/1525.jpg', 59, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1526, 131, '英氏新生儿连体衣纯棉婴儿衣服', '../../img/goodsImg/1526.jpg', 268, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1527, 131, '贝贝怡新生儿衣服秋冬婴儿连体衣', '../../img/goodsImg/1527.jpg', 40, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1528, 131, '婴儿秋装衣服男女宝宝开档长袖连体衣', '../../img/goodsImg/1528.jpg', 35, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1529, 131, '优奇婴儿连体衣服春秋新生儿秋装', '../../img/goodsImg/1529.jpg', 70, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1530, 131, '婴儿连体衣服女新生儿宝宝棉爬服', '../../img/goodsImg/1530.jpg', 36, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1531, 131, '婴儿连体衣春秋夏季纯棉哈衣爬服', '../../img/goodsImg/1531.jpg', 49, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1532, 131, '秋冬婴儿保暖连体衣服春秋纯棉宝宝连体哈衣', '../../img/goodsImg/1532.jpg', 36, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1533, 132, '亲子装秋装卫衣2020冬季新款潮', '../../img/goodsImg/1533.jpg', 127, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1534, 132, '2020新款潮春装全家一家三口装毛衣', '../../img/goodsImg/1534.jpg', 98, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1535, 132, '2020新款潮春装亲子装连衣裙一家三口秋装母子全家套装', '../../img/goodsImg/1535.jpg', 59, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1536, 132, '2020冬新款女童韩版纯棉迷彩毛衣', '../../img/goodsImg/1536.jpg', 219, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1537, 132, '2020新款潮韩版母女套装长袖连衣裙', '../../img/goodsImg/1537.jpg', 148, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1538, 132, '2020新款潮一家三口四口家庭装毛衣', '../../img/goodsImg/1538.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1539, 132, '2020新款潮母子母女装冬装运动三件套装', '../../img/goodsImg/1539.jpg', 69, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1540, 132, '2020新款潮母女全家装春装套装', '../../img/goodsImg/1540.jpg', 138, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1541, 132, '海边亲子装夏装全家装一家三口家庭装', '../../img/goodsImg/1541.jpg', 58, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1542, 132, '小猪班纳亲子装卫衣', '../../img/goodsImg/1542.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1543, 132, '2020新款潮母子母女装家庭外套装', '../../img/goodsImg/1543.jpg', 126, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1544, 132, '2020新款潮一家三口家庭装四口外套', '../../img/goodsImg/1544.jpg', 62, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1545, 133, '婴儿衣服秋季套装0-3个月6新生儿礼盒', '../../img/goodsImg/1545.jpg', 97, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1546, 133, '婴儿衣服纯棉春秋新生儿礼盒套装', '../../img/goodsImg/1546.jpg', 109, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1547, 133, '婴儿衣服纯棉新生儿礼盒0-3个月套装', '../../img/goodsImg/1547.jpg', 206, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1548, 133, '婴儿衣服纯棉新生儿礼盒套装用品', '../../img/goodsImg/1548.jpg', 168, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1549, 133, '婴儿衣服纯棉套装新生儿礼盒春秋冬季', '../../img/goodsImg/1549.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1550, 133, '婴儿衣服纯棉新生儿礼盒套装', '../../img/goodsImg/1550.jpg', 97, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1551, 133, '四季秋冬新生儿婴儿礼盒', '../../img/goodsImg/1551.jpg', 110, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1552, 133, '纯棉婴儿衣服新生儿套装礼盒', '../../img/goodsImg/1552.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1553, 133, '婴儿衣服夏季纯棉新生儿礼盒套装', '../../img/goodsImg/1553.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1554, 133, '婴儿衣服夏季新生儿礼盒套装', '../../img/goodsImg/1554.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1555, 133, '新生儿礼盒夏季套装', '../../img/goodsImg/1555.jpg', 108, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1556, 133, '婴儿衣服纯棉新生儿礼盒', '../../img/goodsImg/1556.jpg', 98, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1557, 134, '3件装南极人防水反穿衣', '../../img/goodsImg/1557.jpg', 35, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1558, 134, '淘喜儿童防水罩衣宝宝反穿衣', '../../img/goodsImg/1558.jpg', 36, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1559, 134, '儿童罩衣长袖宝宝吃饭罩衣防水反穿衣', '../../img/goodsImg/1559.jpg', 28, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1560, 134, '儿童罩衣秋冬宝宝反穿衣', '../../img/goodsImg/1560.jpg', 32, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1561, 134, '南极人宝宝吃饭罩衣围兜儿童防水反穿衣', '../../img/goodsImg/1561.jpg', 35, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1562, 134, '宝宝吃饭罩衣儿童画画围兜护衣婴儿反穿衣', '../../img/goodsImg/1562.jpg', 16, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1563, 134, '儿童反穿衣夏季男童防水宝宝围裙女童画画衣', '../../img/goodsImg/1563.jpg', 34, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1564, 134, '秋冬儿童罩衣长袖小孩防水反穿衣', '../../img/goodsImg/1564.jpg', 34, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1565, 134, '宝宝罩衣秋冬纯棉方格长袖婴儿防水反穿衣', '../../img/goodsImg/1565.jpg', 14, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1566, 134, '宝宝吃饭兜围兜罩衣长袖婴儿反穿衣', '../../img/goodsImg/1566.jpg', 23, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1567, 134, '婴儿饭兜围兜幼儿园画画反穿衣', '../../img/goodsImg/1567.jpg', 17, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1568, 134, '宝宝可爱围裙画画衣男童女童反穿衣', '../../img/goodsImg/1568.jpg', 28, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1569, 135, '婴儿肚兜秋冬纯棉婴幼儿连脚肚兜', '../../img/goodsImg/1569.jpg', 20, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1570, 135, '秋冬宝宝纯棉新生儿裹肚子肚兜', '../../img/goodsImg/1570.jpg', 32, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1571, 135, '纯棉护脐带护肚子新生儿肚兜秋冬', '../../img/goodsImg/1571.jpg', 30, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1572, 135, '纯棉新生儿肚兜四季通用护肚围', '../../img/goodsImg/1572.jpg', 20, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1573, 135, '新生儿肚兜纯棉初生0-3个月', '../../img/goodsImg/1573.jpg', 18, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1574, 135, '童泰秋冬新生儿用品男女宝宝纯棉肚兜', '../../img/goodsImg/1574.jpg', 25, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1575, 135, '婴儿肚兜秋冬纯棉春夏季薄款护肚连脚肚兜', '../../img/goodsImg/1575.jpg', 20, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1576, 135, '婴儿肚兜纯棉背心式夹棉肚兜', '../../img/goodsImg/1576.jpg', 30, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1577, 135, '童泰男女宝宝纯棉肚兜', '../../img/goodsImg/1577.jpg', 19, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1578, 135, '哈咪奇婴儿肚兜', '../../img/goodsImg/1578.jpg', 25, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1579, 135, '宝宝儿童护肚脐围夏季秋冬护肚兜', '../../img/goodsImg/1579.jpg', 29, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1580, 135, '四季通用新生儿春秋加厚款护脐带', '../../img/goodsImg/1580.jpg', 39, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1581, 136, '卡特兔秋季学步鞋', '../../img/goodsImg/1581.jpg', 79, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1582, 136, '基诺浦17年春秋款男女宝宝学步鞋', '../../img/goodsImg/1582.jpg', 139, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1583, 136, '木木屋童鞋2020潮新款包头学步鞋', '../../img/goodsImg/1583.jpg', 60, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1584, 136, '一二段宝宝学步鞋', '../../img/goodsImg/1584.jpg', 299, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1585, 136, '好孩子婴儿鞋宝宝鞋学步鞋秋单鞋子', '../../img/goodsImg/1585.jpg', 109, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1586, 136, '爱慕玛蒂诺软底防滑女童学步鞋', '../../img/goodsImg/1586.jpg', 159, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1587, 136, 'New Balance NB男女儿童学步鞋', '../../img/goodsImg/1587.jpg', 169, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1588, 136, '玛克邦纳春秋款儿童女童宝宝学步鞋', '../../img/goodsImg/1588.jpg', 159, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1589, 136, '维维星宝宝婴儿学步鞋', '../../img/goodsImg/1589.jpg', 137, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1590, 136, '戴维贝拉春秋季女宝婴儿学步鞋', '../../img/goodsImg/1590.jpg', 89, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1591, 136, 'Skechers斯凯奇儿童学步鞋', '../../img/goodsImg/1591.jpg', 219, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1592, 136, 'Clarks童鞋耐磨透气学步鞋婴儿鞋', '../../img/goodsImg/1592.jpg', 279, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1593, 137, '凯蒂猫宝宝亲子居家小孩防滑室内拖鞋', '../../img/goodsImg/1593.jpg', 26, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1594, 137, '百丽2020春秋亲子鞋', '../../img/goodsImg/1594.jpg', 199, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1595, 137, 'Skechers斯凯奇魔术贴儿童亲子运动鞋', '../../img/goodsImg/1595.jpg', 369, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1596, 137, '双星儿童亲子鞋', '../../img/goodsImg/1596.jpg', 39, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1597, 137, '牧童春秋亲子儿童居家拖鞋', '../../img/goodsImg/1597.jpg', 40, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1598, 137, '男童女童低帮亲子鞋', '../../img/goodsImg/1598.jpg', 27, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1599, 137, '基诺浦春秋款男女儿童鞋亲子鞋', '../../img/goodsImg/1599.jpg', 189, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1600, 137, '亲子迪士尼夏新室内防滑洗澡凉拖鞋', '../../img/goodsImg/1600.jpg', 25, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1601, 137, 'Converse匡威亲子帆布鞋', '../../img/goodsImg/1601.jpg', 218, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1602, 137, '2020新款豆豆亲子鞋', '../../img/goodsImg/1602.jpg', 139, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1603, 137, '韩国opoee母女亲子鞋', '../../img/goodsImg/1603.jpg', 29, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1604, 137, '迪士尼冬季亲子家居室内防滑棉拖鞋', '../../img/goodsImg/1604.jpg', 29, '双', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1605, 138, 'belecoo贝丽可婴儿推车', '../../img/goodsImg/1605.jpg', 409, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1606, 138, 'belecoo贝丽可折叠双向四轮宝宝手推车', '../../img/goodsImg/1606.jpg', 399, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1607, 138, 'Vinng超轻便折叠简易便携式小宝宝口袋伞车', '../../img/goodsImg/1607.jpg', 499, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1608, 138, '宓驰超轻便携可坐可躺折叠手推伞车', '../../img/goodsImg/1608.jpg', 299, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1609, 138, 'gb好孩子婴儿推车', '../../img/goodsImg/1609.jpg', 419, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1610, 138, '婴儿超轻便可坐平躺折叠双向四轮儿童车', '../../img/goodsImg/1610.jpg', 289, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1611, 138, 'Wangbaby超轻便携折叠四轮婴儿童车', '../../img/goodsImg/1611.jpg', 289, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1612, 138, 'gb好孩子四轮避震折叠宝宝手推车C400', '../../img/goodsImg/1612.jpg', 699, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1613, 138, '亿宝莱婴儿推车', '../../img/goodsImg/1613.jpg', 189, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1614, 138, '宝宝好婴儿推车', '../../img/goodsImg/1614.jpg', 299, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1615, 138, 'belecoo贝丽可婴儿推车', '../../img/goodsImg/1615.jpg', 299, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1616, 138, 'Pouch婴儿推车', '../../img/goodsImg/1616.jpg', 799, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1617, 139, '婴儿童学步车可折叠带音乐', '../../img/goodsImg/1617.jpg', 169, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1618, 139, '儿童防侧翻可折叠起步学行脚步车', '../../img/goodsImg/1618.jpg', 199, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1619, 139, '可优比宝宝学步车', '../../img/goodsImg/1619.jpg', 258, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1620, 139, '爱奇高多功能婴儿童学步车', '../../img/goodsImg/1620.jpg', 219, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1621, 139, 'VTech伟易达学步车', '../../img/goodsImg/1621.jpg', 349, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1622, 139, '优乐恩宝宝学步车', '../../img/goodsImg/1622.jpg', 99, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1623, 139, 'Yeesoom尹萱婴儿童学步车', '../../img/goodsImg/1623.jpg', 148, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1624, 139, '7-18个月宝宝多功能防侧翻学步车', '../../img/goodsImg/1624.jpg', 165, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1625, 139, '带音乐手推静音四轮学步车', '../../img/goodsImg/1625.jpg', 185, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1626, 139, '可升降防侧翻学步车 助步6/7-18个月', '../../img/goodsImg/1626.jpg', 109, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1627, 139, '爱奇高婴儿学步车', '../../img/goodsImg/1627.jpg', 249, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1628, 139, '宝宝学步车多功能助步车6/7-18个月', '../../img/goodsImg/1628.jpg', 259, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1629, 140, 'gb好孩子儿童安全座椅', '../../img/goodsImg/1629.jpg', 849, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1630, 140, '宝贝第一 儿童安全座椅', '../../img/goodsImg/1630.jpg', 1380, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1631, 140, '车载婴儿宝宝安全座椅汽车用isofix', '../../img/goodsImg/1631.jpg', 1680, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1632, 140, 'britax宝得适超级百变王儿童安全座椅', '../../img/goodsImg/1632.jpg', 1980, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1633, 140, '宝得适britax百变骑士汽车儿童安全座椅', '../../img/goodsImg/1633.jpg', 2980, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1634, 140, 'Savile猫头鹰海格儿童安全座椅', '../../img/goodsImg/1634.jpg', 1399, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1635, 140, 'gb好孩子汽车儿童安全座椅0-4-7岁', '../../img/goodsImg/1635.jpg', 1299, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1636, 140, 'Savile猫头鹰汽车用儿童安全座椅', '../../img/goodsImg/1636.jpg', 1380, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1637, 140, '贝贝卡西汽车用儿童安全座椅', '../../img/goodsImg/1637.jpg', 699, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1638, 140, 'gb好孩子0-7岁新生儿宝宝汽车安全座椅', '../../img/goodsImg/1638.jpg', 1099, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1639, 140, 'maxicosi儿童安全座椅', '../../img/goodsImg/1639.jpg', 2449, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1640, 140, '美国原版0-12岁汽车儿童安全座椅', '../../img/goodsImg/1640.jpg', 2236, '张', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1641, 141, '纽贝乐婴儿多功能背带', '../../img/goodsImg/1641.jpg', 129, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1642, 141, '布兜妈妈夏四季透气多功能婴儿背带', '../../img/goodsImg/1642.jpg', 98, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1643, 141, '婴儿多功能背带四季款', '../../img/goodsImg/1643.jpg', 89, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1644, 141, '四季通用多功能新生儿童宝宝背带', '../../img/goodsImg/1644.jpg', 79, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1645, 141, '前抱式四季多功能宝宝背带', '../../img/goodsImg/1645.jpg', 159, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1646, 141, '爱蓓优婴儿背带', '../../img/goodsImg/1646.jpg', 89, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1647, 141, '爱蓓优新初生婴儿背带', '../../img/goodsImg/1647.jpg', 69, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1648, 141, '迪士尼抱娃宝夏季婴儿背带', '../../img/goodsImg/1648.jpg', 85, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1649, 141, '多功能夏四季透气婴儿宝宝背带', '../../img/goodsImg/1649.jpg', 69, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1650, 141, '新星婴儿背带前抱式', '../../img/goodsImg/1650.jpg', 39, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1651, 141, '抱抱熊前抱四季多功能宝宝小孩背带', '../../img/goodsImg/1651.jpg', 179, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1652, 141, '四季多功能宝宝透气双肩背带', '../../img/goodsImg/1652.jpg', 37, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1653, 142, '四季透气多功能前抱式小孩腰凳', '../../img/goodsImg/1653.jpg', 78, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1654, 142, '婴儿四季通用多功能腰凳', '../../img/goodsImg/1654.jpg', 69, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1655, 142, '嗨皮熊四季通用腰凳', '../../img/goodsImg/1655.jpg', 88, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1656, 142, 'gb好孩子多功能三合一婴儿腰凳', '../../img/goodsImg/1656.jpg', 279, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1657, 142, '迪士尼加肥加大码四季多功能宝宝腰凳', '../../img/goodsImg/1657.jpg', 149, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1658, 142, '爱蓓优婴儿腰凳', '../../img/goodsImg/1658.jpg', 89, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1659, 142, '抱抱熊G01宝宝多功能腰凳', '../../img/goodsImg/1659.jpg', 213, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1660, 142, '迪士尼腰凳婴儿四季通用前抱式', '../../img/goodsImg/1660.jpg', 108, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1661, 142, '宝宝轻便腰凳婴儿四季通用', '../../img/goodsImg/1661.jpg', 88, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1662, 142, '抱抱熊夏季小孩腰凳', '../../img/goodsImg/1662.jpg', 159, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1663, 142, '多功能单双肩婴儿腰登', '../../img/goodsImg/1663.jpg', 35, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1664, 142, '天才一叮宝宝腰凳', '../../img/goodsImg/1664.jpg', 33, '条', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1665, 143, '婴爱婴儿床实木宝宝多功能儿童床', '../../img/goodsImg/1665.jpg', 767, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1666, 143, 'KUB可优比婴儿床实木欧式宝宝床', '../../img/goodsImg/1666.jpg', 798, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1667, 143, '睿宝婴儿床实木无漆宝宝BB床', '../../img/goodsImg/1667.jpg', 288, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1668, 143, '好孩子集团儿童床小龙哈彼婴儿床', '../../img/goodsImg/1668.jpg', 429, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1669, 143, '好孩子集团儿童床小龙哈彼婴儿床', '../../img/goodsImg/1669.jpg', 289, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1670, 143, '星月童话婴儿床实木多功能宝宝床', '../../img/goodsImg/1670.jpg', 379, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1671, 143, 'gb好孩子实木多功能无漆游戏摇篮折叠床', '../../img/goodsImg/1671.jpg', 839, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1672, 143, '蒂爱便携式床中床宝宝婴儿床', '../../img/goodsImg/1672.jpg', 389, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1673, 143, 'bebivita实木欧式多功能白色宝宝床', '../../img/goodsImg/1673.jpg', 659, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1674, 143, 'ZEDBED实木无漆多功能宝宝床', '../../img/goodsImg/1674.jpg', 689, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1675, 143, 'gb好孩子婴儿床实木无漆宝宝多功能BB儿童床松木摇篮床蚊帐MC283', '../../img/goodsImg/1675.jpg', 689, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1676, 143, 'Kindbear康贝儿多功能新生儿床', '../../img/goodsImg/1676.jpg', 139, '张', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1677, 144, 'Pouch欧式婴儿餐椅儿童多功能宝宝餐椅', '../../img/goodsImg/1677.jpg', 569, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1678, 144, '贝能宝宝餐椅儿童餐椅', '../../img/goodsImg/1678.jpg', 299, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1679, 144, 'teknum宝宝餐椅', '../../img/goodsImg/1679.jpg', 399, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1680, 144, 'teknum宝宝餐椅可折叠餐椅', '../../img/goodsImg/1680.jpg', 299, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1681, 144, '博比龙儿童餐椅实木宝宝餐椅', '../../img/goodsImg/1681.jpg', 199, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1682, 144, '安贝贝anbebe婴儿餐椅', '../../img/goodsImg/1682.jpg', 338, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1683, 144, '宝宝餐椅儿童餐桌椅', '../../img/goodsImg/1683.jpg', 83, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1684, 144, 'ARICARE多功能儿童餐椅', '../../img/goodsImg/1684.jpg', 258, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1685, 144, '笑巴喜宝宝餐椅儿童餐椅', '../../img/goodsImg/1685.jpg', 189, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1686, 144, '萌小孩儿童餐椅实木餐桌椅', '../../img/goodsImg/1686.jpg', 197, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1687, 144, 'bellyfish多功能儿童餐桌椅', '../../img/goodsImg/1687.jpg', 329, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1688, 144, '可优比宝宝餐椅', '../../img/goodsImg/1688.jpg', 178, '张', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1689, 145, '欧孕新生宝宝婴儿分腿睡袋', '../../img/goodsImg/1689.jpg', 145, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1690, 145, '小儿郎婴儿睡袋', '../../img/goodsImg/1690.jpg', 188, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1691, 145, '南极人婴儿睡袋', '../../img/goodsImg/1691.jpg', 119, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1692, 145, '南极人婴儿睡袋春秋儿童薄棉', '../../img/goodsImg/1692.jpg', 129, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1693, 145, '米乐鱼婴儿睡袋', '../../img/goodsImg/1693.jpg', 299, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1694, 145, '呼西贝分腿睡袋', '../../img/goodsImg/1694.jpg', 79, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1695, 145, '呼西贝薄棉防踢被宝宝分脚式大婴儿童睡袋', '../../img/goodsImg/1695.jpg', 119, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1696, 145, '婴儿睡袋秋冬加厚宝宝睡袋', '../../img/goodsImg/1696.jpg', 129, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1697, 145, '威尔贝鲁纯棉宝宝婴儿睡袋', '../../img/goodsImg/1697.jpg', 119, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1698, 145, '欧孕婴儿秋冬新生儿防踢被睡袋', '../../img/goodsImg/1698.jpg', 179, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1699, 145, '分腿睡袋秋冬季加厚婴儿夹棉', '../../img/goodsImg/1699.jpg', 169, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1700, 145, '婴儿睡袋春秋薄棉四季薄款宝宝分腿睡袋', '../../img/goodsImg/1700.jpg', 115, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1701, 146, '新生儿包被纯棉婴儿春秋冬抱被', '../../img/goodsImg/1701.jpg', 50, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1702, 146, '新生儿秋冬纯棉抱被 ', '../../img/goodsImg/1702.jpg', 89, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1703, 146, '全棉时代 婴儿针织棉纱抱被', '../../img/goodsImg/1703.jpg', 268, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1704, 146, '纯棉初生婴儿抱被', '../../img/goodsImg/1704.jpg', 69, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1705, 146, '秋冬加厚保暖小鸡宝宝包被', '../../img/goodsImg/1705.jpg', 90, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1706, 146, '新生儿抱被彩棉春秋纯棉抱被', '../../img/goodsImg/1706.jpg', 158, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1707, 146, '春秋冬季纯棉初生儿抱被宝宝加厚款薄夏用品', '../../img/goodsImg/1707.jpg', 59, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1708, 146, '婴儿抱被秋冬可脱胆纯棉被子', '../../img/goodsImg/1708.jpg', 169, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1709, 146, '迪士尼宝宝初生婴儿春夏薄棉抱被', '../../img/goodsImg/1709.jpg', 159, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1710, 146, '欧孕新生儿抱被', '../../img/goodsImg/1710.jpg', 109, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1711, 146, 'pureborn 新生婴儿抱被', '../../img/goodsImg/1711.jpg', 159, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1712, 146, '龙之涵 新生婴儿抱被', '../../img/goodsImg/1712.jpg', 279, '张', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1713, 147, '贝亲宽口径PPSU奶瓶', '../../img/goodsImg/1713.jpg', 83, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1714, 147, 'Pigeon/贝亲自然实感宽口玻璃奶瓶', '../../img/goodsImg/1714.jpg', 103, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1715, 147, '贝适邦耐摔硅胶套防胀气宽口径婴儿玻璃奶瓶', '../../img/goodsImg/1715.jpg', 39, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1716, 147, '贝亲新生婴儿宽口径玻璃奶瓶', '../../img/goodsImg/1716.jpg', 90, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1717, 147, '飞利浦新安怡新生儿宽口径玻璃奶瓶', '../../img/goodsImg/1717.jpg', 129, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1718, 147, 'Pigeon/自然实感奶瓶配L号AA94', '../../img/goodsImg/1718.jpg', 94, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1719, 147, '爱得利宽口晶钻玻璃奶瓶套装', '../../img/goodsImg/1719.jpg', 59, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1720, 147, '贝亲PPSU奶瓶宽口径新生儿奶瓶', '../../img/goodsImg/1720.jpg', 83, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1721, 147, '爱因美奶瓶新生儿硅胶套宽口径玻璃奶瓶', '../../img/goodsImg/1721.jpg', 50, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1722, 147, '爱因美奶瓶ppsu耐摔宽口径防胀气塑料奶瓶', '../../img/goodsImg/1722.jpg', 39, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1723, 147, '爱得利玻璃宽口防摔奶瓶(带手柄吸管)', '../../img/goodsImg/1723.jpg', 69, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1724, 147, '新生儿防摔PPSU奶瓶', '../../img/goodsImg/1724.jpg', 79, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1725, 148, 'comotomo可么多么硅胶奶嘴', '../../img/goodsImg/1725.jpg', 82, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1726, 148, '贝亲奶嘴仿真母乳实感婴儿硅胶奶嘴', '../../img/goodsImg/1726.jpg', 49, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1727, 148, '贝亲奶嘴 自然实感宽口径硅胶奶嘴', '../../img/goodsImg/1727.jpg', 26, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1728, 148, 'Comotomo奶嘴可么多么奶嘴', '../../img/goodsImg/1728.jpg', 69, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1729, 148, '飞利浦新安怡 原装进口奶嘴', '../../img/goodsImg/1729.jpg', 65, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1730, 148, '飞利浦新安怡 自然原生宽口径奶嘴', '../../img/goodsImg/1730.jpg', 45, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1731, 148, '美国 comotomo奶嘴Y型', '../../img/goodsImg/1731.jpg', 69, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1732, 148, '贝亲安抚奶嘴婴儿硅胶安睡奶嘴', '../../img/goodsImg/1732.jpg', 19, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1733, 148, '世喜婴儿硅胶断奶神器宝宝仿真奶嘴', '../../img/goodsImg/1733.jpg', 46, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1734, 148, '安睡型安抚奶嘴', '../../img/goodsImg/1734.jpg', 19, '个', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1735, 148, 'bobo乐儿宝 宽口径奶嘴', '../../img/goodsImg/1735.jpg', 28, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1736, 148, '婴儿宽口径奶嘴', '../../img/goodsImg/1736.jpg', 36, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1737, 149, 'QOOC迷你婴儿辅食机', '../../img/goodsImg/1737.jpg', 268, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1738, 149, '法国beaba婴儿辅食机', '../../img/goodsImg/1738.jpg', 1799, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1739, 149, '波咯咯婴儿辅食机', '../../img/goodsImg/1739.jpg', 209, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1740, 149, 'QOOC迷你婴儿辅食机', '../../img/goodsImg/1740.jpg', 268, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1741, 149, '小白熊婴儿辅食机', '../../img/goodsImg/1741.jpg', 299, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1742, 149, 'babycare宝宝辅食研磨器', '../../img/goodsImg/1742.jpg', 78, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1743, 149, '飞利浦新安怡宝宝多功能辅食机', '../../img/goodsImg/1743.jpg', 1099, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1744, 149, '飞利浦新迷你辅食研磨器蒸煮搅拌一体机', '../../img/goodsImg/1744.jpg', 149, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1745, 149, '飞利浦新安怡原装进口宝宝辅食机', '../../img/goodsImg/1745.jpg', 779, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1746, 149, '贝亲宝宝辅食研磨器', '../../img/goodsImg/1746.jpg', 74, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1747, 149, '贝亲宝宝婴儿辅食机', '../../img/goodsImg/1747.jpg', 379, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1748, 149, '法国beaba婴儿辅食机宝宝研磨器', '../../img/goodsImg/1748.jpg', 2099, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1749, 150, '小白熊恒温调奶器', '../../img/goodsImg/1749.jpg', 319, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1750, 150, '思贝优宝宝恒温调奶器', '../../img/goodsImg/1750.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1751, 150, '鲁茜宝宝恒温调奶器', '../../img/goodsImg/1751.jpg', 128, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1752, 150, '贝贝鸭恒温调奶器', '../../img/goodsImg/1752.jpg', 298, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1753, 150, '小白熊恒温调奶器婴儿冲奶器', '../../img/goodsImg/1753.jpg', 115, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1754, 150, '西可智能恒温调奶器', '../../img/goodsImg/1754.jpg', 118, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1755, 150, '新贝恒温调奶器', '../../img/goodsImg/1755.jpg', 165, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1756, 150, '舒氏恒温调奶器', '../../img/goodsImg/1756.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1757, 150, '米苏塔调奶器', '../../img/goodsImg/1757.jpg', 118, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1758, 150, '贝贝鸭多功能恒温调奶器', '../../img/goodsImg/1758.jpg', 168, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1759, 150, '开优米恒温调奶器玻璃水壶智能宝宝温暖奶婴儿泡冲奶机器热奶器', '../../img/goodsImg/1759.jpg', 68, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1760, 150, '海尔调奶器', '../../img/goodsImg/1760.jpg', 229, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1761, 151, '苏格朗自动暖奶器', '../../img/goodsImg/1761.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1762, 151, '德国OIDIRE温奶器消毒器二合一', '../../img/goodsImg/1762.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1763, 151, '小白熊恒温调奶器暖奶器', '../../img/goodsImg/1763.jpg', 319, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1764, 151, '小白熊暖奶器多功能温奶器', '../../img/goodsImg/1764.jpg', 69, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1765, 151, '思贝优宝宝智能自动暖奶器', '../../img/goodsImg/1765.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1766, 151, '小白熊暖奶器0803婴儿温奶器', '../../img/goodsImg/1766.jpg', 62, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1767, 151, '鲁茜宝宝自动暖奶器', '../../img/goodsImg/1767.jpg', 128, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1768, 151, '可瑞儿温奶器恒温暖奶器', '../../img/goodsImg/1768.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1769, 151, '贝亲温奶器', '../../img/goodsImg/1769.jpg', 139, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1770, 151, '舒氏婴儿热奶器多功能恒温双奶瓶加热器', '../../img/goodsImg/1770.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1771, 151, '舒氏二合一恒温智能双瓶婴儿S138', '../../img/goodsImg/1771.jpg', 169, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1772, 151, '飞利浦新安怡温奶器', '../../img/goodsImg/1772.jpg', 149, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1773, 152, '婴儿口水巾宝宝三角巾纯棉双层围嘴', '../../img/goodsImg/1773.jpg', 12, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1774, 152, '纯棉婴儿围嘴纯棉360度可旋转', '../../img/goodsImg/1774.jpg', 27, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1775, 152, '宝宝食饭兜防水儿童围嘴', '../../img/goodsImg/1775.jpg', 17, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1776, 152, '超软防水吃饭衣小孩围兜围嘴饭兜', '../../img/goodsImg/1776.jpg', 25, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1777, 152, '宝宝三角巾纯棉围嘴', '../../img/goodsImg/1777.jpg', 10, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1778, 152, '新生儿秋冬季加大围嘴兜头巾', '../../img/goodsImg/1778.jpg', 12, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1779, 152, '童泰婴儿宝宝头巾四季围嘴', '../../img/goodsImg/1779.jpg', 23, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1780, 152, '婴儿口水巾围兜防水宝宝围嘴', '../../img/goodsImg/1780.jpg', 10, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1781, 152, '五羊婴儿绵柔三角巾新生儿童围嘴', '../../img/goodsImg/1781.jpg', 3, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1782, 152, '婴儿口水巾纯棉围嘴360度旋转', '../../img/goodsImg/1782.jpg', 10, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1783, 152, '世纪宝贝 宝宝吃饭围嘴', '../../img/goodsImg/1783.jpg', 46, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1784, 152, '立体防水儿童吃饭围嘴', '../../img/goodsImg/1784.jpg', 12, '个', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1785, 153, '宝宝手拍鼓', '../../img/goodsImg/1785.jpg', 55, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1786, 153, '宝宝可充电拍拍鼓', '../../img/goodsImg/1786.jpg', 69, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1787, 153, '汇乐婴儿玩具大号不倒翁点头娃娃', '../../img/goodsImg/1787.jpg', 18, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1788, 153, '澳贝健身架奥贝带音乐脚踏钢琴', '../../img/goodsImg/1788.jpg', 209, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1789, 153, '婴儿玩具毛绒布艺床铃', '../../img/goodsImg/1789.jpg', 158, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1790, 153, '新生儿婴儿玩具0-1岁床铃', '../../img/goodsImg/1790.jpg', 30, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1791, 153, '贝恩施婴儿脚踏钢琴健身架', '../../img/goodsImg/1791.jpg', 118, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1792, 153, 'KUB 可优比婴儿音乐游戏毯', '../../img/goodsImg/1792.jpg', 298, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1793, 153, '婴儿玩具手摇铃', '../../img/goodsImg/1793.jpg', 28, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1794, 153, '米宝兔摇铃宝宝牙胶', '../../img/goodsImg/1794.jpg', 34, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1795, 153, '米宝兔婴儿脚踏钢琴', '../../img/goodsImg/1795.jpg', 168, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1796, 153, '阿李罗火火兔R1手摇铃', '../../img/goodsImg/1796.jpg', 119, '个', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1797, 154, '凤凰儿童自行车', '../../img/goodsImg/1797.jpg', 368, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1798, 154, '好孩子儿童自行车', '../../img/goodsImg/1798.jpg', 469, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1799, 154, '优贝儿童自行车', '../../img/goodsImg/1799.jpg', 568, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1800, 154, 'lecoco乐卡儿童三轮车', '../../img/goodsImg/1800.jpg', 168, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1801, 154, '健儿儿童自行车3岁男女宝宝童车', '../../img/goodsImg/1801.jpg', 339, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1802, 154, '小虎子正品折叠儿童三轮车', '../../img/goodsImg/1802.jpg', 499, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1803, 154, '优贝儿童山地单车', '../../img/goodsImg/1803.jpg', 598, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1804, 154, '宝仕儿童3轮自行车', '../../img/goodsImg/1804.jpg', 398, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1805, 154, '儿童三轮车折叠幼儿童车', '../../img/goodsImg/1805.jpg', 289, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1806, 154, '凤凰儿童自行车14/16/18寸', '../../img/goodsImg/1806.jpg', 288, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1807, 154, 'Lecoco乐卡儿童三轮车', '../../img/goodsImg/1807.jpg', 368, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1808, 154, '凯蒂猫儿童自行车12/14/16寸', '../../img/goodsImg/1808.jpg', 313, '辆', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1809, 155, '帮宝适 超薄干爽透气纸尿裤', '../../img/goodsImg/1809.jpg', 161, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1810, 155, '日本进口 花王妙而舒纸尿裤', '../../img/goodsImg/1810.jpg', 239, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1811, 155, '好奇L100银装成长裤', '../../img/goodsImg/1811.jpg', 112, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1812, 155, '日本花王纸尿裤M64片', '../../img/goodsImg/1812.jpg', 98, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1813, 155, '雀氏柔薄乐动纸尿裤大号L168片', '../../img/goodsImg/1813.jpg', 200, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1814, 155, '白金帮宝适特级棉柔纸尿裤', '../../img/goodsImg/1814.jpg', 99, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1815, 155, '好奇铂金装NB84新生儿纸尿裤', '../../img/goodsImg/1815.jpg', 79, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1816, 155, '日本花王纸尿裤S82', '../../img/goodsImg/1816.jpg', 88, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1817, 155, '好奇金装初生婴儿纸尿裤NB80+10片 新生儿宝宝尿不湿男女宝宝通用', '../../img/goodsImg/1817.jpg', 69, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1818, 155, 'Moony尤妮佳日本进口婴儿纸尿裤', '../../img/goodsImg/1818.jpg', 99, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1819, 155, '妈咪宝贝婴儿纸尿裤S100+12片', '../../img/goodsImg/1819.jpg', 85, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1820, 155, '妈咪宝贝婴儿纸尿裤M168片', '../../img/goodsImg/1820.jpg', 169, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1821, 156, '雀氏金装阳光动吸婴儿纸尿片', '../../img/goodsImg/1821.jpg', 111, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1822, 156, '帮宝适超薄干爽透气纸尿片', '../../img/goodsImg/1822.jpg', 92, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1823, 156, '南极人纸尿片L ', '../../img/goodsImg/1823.jpg', 70, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1824, 156, '帮宝适超薄干爽透气新生儿宝宝尿片', '../../img/goodsImg/1824.jpg', 125, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1825, 156, '日本花王婴儿尿不湿宝宝尿片', '../../img/goodsImg/1825.jpg', 110, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1826, 156, '帮宝适特级棉柔婴儿宝宝尿片', '../../img/goodsImg/1826.jpg', 109, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1827, 156, '爽然屁屁好朋友亲柔纸尿片L128', '../../img/goodsImg/1827.jpg', 85, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1828, 156, '一朵纸尿片XL126片', '../../img/goodsImg/1828.jpg', 94, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1829, 156, '优茵婴儿纸尿片', '../../img/goodsImg/1829.jpg', 56, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1830, 156, '家得宝大码纸尿片L码144片', '../../img/goodsImg/1830.jpg', 79, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1831, 156, '南极人新生儿婴儿超薄透气纸尿片XL', '../../img/goodsImg/1831.jpg', 70, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1832, 156, '白又白新生婴儿纸尿片', '../../img/goodsImg/1832.jpg', 79, '包', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1833, 157, '2020新款秋冬款孕妇时尚两件套装', '../../img/goodsImg/1833.jpg', 118, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1834, 157, '孕妇装秋款连衣裙孕妈秋装', '../../img/goodsImg/1834.jpg', 98, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1835, 157, '时尚气质款荷叶袖中长款红色孕妇裙子', '../../img/goodsImg/1835.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1836, 157, '孕妇秋装连衣裙中长款时尚款', '../../img/goodsImg/1836.jpg', 88, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1837, 157, '孕妇裙装时尚款潮流妈咪秋装', '../../img/goodsImg/1837.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1838, 157, '2020新款孕妇针织开衫两件套', '../../img/goodsImg/1838.jpg', 118, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1839, 157, '孕妇装春秋中长款', '../../img/goodsImg/1839.jpg', 89, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1840, 157, '2020新款夏季宽松大码孕妇哺乳裙', '../../img/goodsImg/1840.jpg', 79, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1841, 157, '摩可妈妈孕妇连衣裙', '../../img/goodsImg/1841.jpg', 158, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1842, 157, '孕妇秋装套装时尚款2020新款孕妇装', '../../img/goodsImg/1842.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1843, 157, '2020新款条纹上衣裤长裤休闲两件套', '../../img/goodsImg/1843.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1844, 157, '2020新款韩版雪纺礼服长裙孕妇装', '../../img/goodsImg/1844.jpg', 106, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1845, 158, '月子服春秋纯棉产后哺乳衣', '../../img/goodsImg/1845.jpg', 78, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1846, 158, '月子服产后外出春秋孕妇睡衣', '../../img/goodsImg/1846.jpg', 78, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1847, 158, '月子服春秋纯棉产后哺乳喂奶衣', '../../img/goodsImg/1847.jpg', 88, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1848, 158, '月子服春秋冬纯棉产后孕妇睡衣', '../../img/goodsImg/1848.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1849, 158, '穗鹿月子服春秋季孕妇睡衣', '../../img/goodsImg/1849.jpg', 79, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1850, 158, '纳斐月子服春秋纯棉产后孕妇睡衣', '../../img/goodsImg/1850.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1851, 158, '梦蜜纯棉纱布月子服', '../../img/goodsImg/1851.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1852, 158, '月子服秋冬纯棉产后孕妇睡衣', '../../img/goodsImg/1852.jpg', 98, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1853, 158, '月子服秋冬纯棉产后长袖哺乳衣', '../../img/goodsImg/1853.jpg', 119, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1854, 158, '母爱无私秋季月子服', '../../img/goodsImg/1854.jpg', 189, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1855, 158, '月子服春秋喂奶加厚孕妇睡衣', '../../img/goodsImg/1855.jpg', 158, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1856, 158, '孕妇哺乳睡衣冬季月子服', '../../img/goodsImg/1856.jpg', 59, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1857, 159, '歌庆哺乳文胸', '../../img/goodsImg/1857.jpg', 67, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1858, 159, '南极人哺乳文胸夏季薄款', '../../img/goodsImg/1858.jpg', 40, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1859, 159, '哺乳文胸孕妇内衣全罩杯', '../../img/goodsImg/1859.jpg', 68, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1860, 159, '纳斐孕妇纯棉哺乳文胸', '../../img/goodsImg/1860.jpg', 74, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1861, 159, '雅特茂孕妇哺乳文胸', '../../img/goodsImg/1861.jpg', 59, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1862, 159, '婧麒孕妇怀孕期喂奶防下垂哺乳文胸', '../../img/goodsImg/1862.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1863, 159, '乔妮雅夏季薄款喂奶哺乳文胸', '../../img/goodsImg/1863.jpg', 80, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1864, 159, '喜贝雅哺乳文胸', '../../img/goodsImg/1864.jpg', 35, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1865, 159, '十月妈咪哺乳文胸', '../../img/goodsImg/1865.jpg', 119, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1866, 159, '浪莎 孕妇防下垂聚拢喂奶文胸', '../../img/goodsImg/1866.jpg', 147, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1867, 159, '妈妈喂哺乳文胸', '../../img/goodsImg/1867.jpg', 298, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1868, 159, '美德乐旗舰店bravado哺乐多哺乳文胸', '../../img/goodsImg/1868.jpg', 268, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1869, 160, '十月结晶待产包', '../../img/goodsImg/1869.jpg', 136, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1870, 160, '待产包入院全套母子组合孕妇用品', '../../img/goodsImg/1870.jpg', 218, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1871, 160, '贝亲孕妇入院备产待产包', '../../img/goodsImg/1871.jpg', 388, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1872, 160, 'dacco三洋待产包', '../../img/goodsImg/1872.jpg', 410, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1873, 160, '全棉时代 产妇待产包', '../../img/goodsImg/1873.jpg', 398, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1874, 160, '子初待产包秋冬季入院全套', '../../img/goodsImg/1874.jpg', 159, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1875, 160, '开丽待产包冬季入院全套', '../../img/goodsImg/1875.jpg', 109, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1876, 160, '娇雪待产包秋季入院全套', '../../img/goodsImg/1876.jpg', 299, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1877, 160, '十月妈咪孕妇待产包秋季入院全套', '../../img/goodsImg/1877.jpg', 99, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1878, 160, '子初孕妇待产包夏季套装', '../../img/goodsImg/1878.jpg', 128, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1879, 160, '十月结晶孕妇待产全套母子组合', '../../img/goodsImg/1879.jpg', 88, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1880, 160, '开丽待产包春夏季23件套装', '../../img/goodsImg/1880.jpg', 99, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1881, 161, '文丰全包围汽车脚垫', '../../img/goodsImg/1881.jpg', 598, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1882, 161, '汽车脚垫丝圈全包围', '../../img/goodsImg/1882.jpg', 188, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1883, 161, '2020款新速全包围汽车脚垫', '../../img/goodsImg/1883.jpg', 298, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1884, 161, '固特异汽车丝圈脚垫', '../../img/goodsImg/1884.jpg', 380, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1885, 161, '全包围汽车脚垫丝圈', '../../img/goodsImg/1885.jpg', 386, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1893, 162, '夏季全包围男女通用可爱车座垫套', '../../img/goodsImg/1893.jpg', 698, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1894, 162, 'pu皮革全包座椅套四季通用全包围坐垫', '../../img/goodsImg/1894.jpg', 328, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1895, 162, '朗森专车专用三件套座垫', '../../img/goodsImg/1895.jpg', 380, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1896, 162, '东风本田xrv缤智十代思域crv专用座套', '../../img/goodsImg/1896.jpg', 598, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1897, 162, '全包汽车坐垫四季座垫专用宝马5系3系', '../../img/goodsImg/1897.jpg', 780, '张', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1905, 163, '汽车座套17新款专用坐套', '../../img/goodsImg/1905.jpg', 328, '套', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1906, 163, '紫风铃新款全包围汽车座套', '../../img/goodsImg/1906.jpg', 438, '套', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1907, 163, '雅鞍全包汽车座套', '../../img/goodsImg/1907.jpg', 799, '套', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1908, 163, '汽车坐垫四季通用全包坐垫套', '../../img/goodsImg/1908.jpg', 346, '套', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1909, 163, '汽车四季女卡通可爱座套', '../../img/goodsImg/1909.jpg', 398, '套', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1917, 164, 'Castrol嘉实多磁护5W-40正品合成机油', '../../img/goodsImg/1917.jpg', 259, '瓶', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1918, 164, 'Mobil 美孚一号全合成机油', '../../img/goodsImg/1918.jpg', 329, '瓶', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1919, 164, '长城 金吉星全合成机油', '../../img/goodsImg/1919.jpg', 498, '瓶', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1920, 164, '龙蟠SONIC9000 全合成机油', '../../img/goodsImg/1920.jpg', 199, '瓶', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1921, 164, '嘉实多金嘉护合成机油', '../../img/goodsImg/1921.jpg', 246, '瓶', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1929, 165, '邓禄普轮胎SP270 195/60R16 89H', '../../img/goodsImg/1929.jpg', 505, '个', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1930, 165, '邓禄普汽车轮胎SP T1 205', '../../img/goodsImg/1930.jpg', 396, '个', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1931, 165, '米其林轮胎韧悦XM2 205', '../../img/goodsImg/1931.jpg', 649, '个', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1932, 165, '佳通汽车轮胎SUV520 225', '../../img/goodsImg/1932.jpg', 329, '个', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1933, 165, '佳通汽车轮胎WINGRO 165', '../../img/goodsImg/1933.jpg', 135, '个', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1941, 166, '捷渡行车记录仪', '../../img/goodsImg/1941.jpg', 399, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1942, 166, '惠普行车记录仪', '../../img/goodsImg/1942.jpg', 359, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1943, 166, 'PAPAGO趴趴狗行车记录仪', '../../img/goodsImg/1943.jpg', 469, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1944, 166, 'DOD行车记录仪', '../../img/goodsImg/1944.jpg', 599, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1945, 166, '任E行V3隐藏式行车记录仪', '../../img/goodsImg/1945.jpg', 799, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1953, 167, '善领GT618车载电子狗汽车安全预警仪', '../../img/goodsImg/1953.jpg', 299, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1954, 167, '征服者电子狗测速雷达安全预警仪', '../../img/goodsImg/1954.jpg', 499, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1955, 167, '征服者电子狗贝尔自动升级安全预警仪', '../../img/goodsImg/1955.jpg', 699, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1956, 167, '征服者电子狗测速雷达汽车载安全预警仪', '../../img/goodsImg/1956.jpg', 699, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1957, 167, '领航星2020最新汽车安全预警仪', '../../img/goodsImg/1957.jpg', 199, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1965, 168, '捷渡新款双镜头无线后视镜行车记录仪', '../../img/goodsImg/1965.jpg', 969, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1966, 168, '仙人指路道镜前后双录智能后视镜导航仪', '../../img/goodsImg/1966.jpg', 1490, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1967, 168, '任我游E88智能后视镜导航仪', '../../img/goodsImg/1967.jpg', 1980, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1968, 168, '4gwifi8寸智能后视镜导航', '../../img/goodsImg/1968.jpg', 1059, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1969, 168, '天之眼YunOS智能云后视镜导航', '../../img/goodsImg/1969.jpg', 3699, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1977, 169, '凯立德7英寸汽车载GPS便携式导航仪', '../../img/goodsImg/1977.jpg', 399, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1978, 169, '7寸GPS导航仪汽车车载货车便携式记录仪', '../../img/goodsImg/1978.jpg', 268, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1979, 169, '正版凯立德汽车载GPS便携导航仪', '../../img/goodsImg/1979.jpg', 399, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1980, 169, 'Garmin佳明汽车GPS便携式导航', '../../img/goodsImg/1980.jpg', 769, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1981, 169, '图吧 GPS汽车载便携式导航仪', '../../img/goodsImg/1981.jpg', 559, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1989, 170, '韩松GPS定位器', '../../img/goodsImg/1989.jpg', 288, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1990, 170, '攀西免安装GPS定位器', '../../img/goodsImg/1990.jpg', 258, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1991, 170, '途强北斗GPS定位跟踪器', '../../img/goodsImg/1991.jpg', 328, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1992, 170, '追随者GPS定位跟踪器', '../../img/goodsImg/1992.jpg', 358, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (1993, 170, 'TCL汽车gps定位器', '../../img/goodsImg/1993.jpg', 198, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2001, 171, '飞利浦空气净化器', '../../img/goodsImg/2001.jpg', 2599, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2002, 171, '美的空气净化器', '../../img/goodsImg/2002.jpg', 1098, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2003, 171, '海尔Q6汽车载空气净化器', '../../img/goodsImg/2003.jpg', 499, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2004, 171, '小米空气净化器', '../../img/goodsImg/2004.jpg', 1349, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2005, 171, '德国汉朗空气净化器', '../../img/goodsImg/2005.jpg', 1490, '个', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2013, 172, '科敏20L双制冷车载冰箱', '../../img/goodsImg/2013.jpg', 459, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2014, 172, '美固15L车载冰箱', '../../img/goodsImg/2014.jpg', 299, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2015, 172, '英得尔车载冰箱', '../../img/goodsImg/2015.jpg', 1480, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2016, 172, '德国20L双制冷车载冰箱', '../../img/goodsImg/2016.jpg', 369, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2020, 172, '德国20L双制冷车载冰箱', '../../img/goodsImg/2020.jpg', 298, '个', 0, 6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2025, 173, '先科车载MP3播放器', '../../img/goodsImg/2025.jpg', 69, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2026, 173, '网易云音乐车载MP3播放器', '../../img/goodsImg/2026.jpg', 119, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2027, 173, '英才星车载蓝牙MP3播放器', '../../img/goodsImg/2027.jpg', 98, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2028, 173, '纽曼车载MP3播放器', '../../img/goodsImg/2028.jpg', 99, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2029, 173, '索浪车载MP3播放器', '../../img/goodsImg/2029.jpg', 59, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2037, 174, '飞利浦车载充电器', '../../img/goodsImg/2037.jpg', 69, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2038, 174, '现代车载充电器', '../../img/goodsImg/2038.jpg', 39, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2039, 174, '先科车载充电器', '../../img/goodsImg/2039.jpg', 55, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2040, 174, '公牛车载充电器', '../../img/goodsImg/2040.jpg', 69, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2041, 174, '飞毛腿车载充电器', '../../img/goodsImg/2041.jpg', 17, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2049, 175, 'unifee 车载蓝牙播放器', '../../img/goodsImg/2049.jpg', 69, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2050, 175, '咚咚语音驾驶车载mp3蓝牙播放器', '../../img/goodsImg/2050.jpg', 159, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2051, 175, '小米roidmi睿米车载蓝牙播放器', '../../img/goodsImg/2051.jpg', 99, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2052, 175, 'accnic车载蓝牙播放器', '../../img/goodsImg/2052.jpg', 86, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2053, 175, '纽曼C58蓝牙车载mp3播放器', '../../img/goodsImg/2053.jpg', 119, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2061, 176, '徐记 新POLO/高尔夫7真皮方向盘套', '../../img/goodsImg/2061.jpg', 196, '个', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2062, 176, '徐记 迈腾B8L真皮方向盘套', '../../img/goodsImg/2062.jpg', 196, '个', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2063, 176, '14-17款卡罗拉方向盘套', '../../img/goodsImg/2063.jpg', 159, '个', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2064, 176, '17款宝骏510方向盘套', '../../img/goodsImg/2064.jpg', 38, '个', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2065, 176, '2020款途观l方向盘套', '../../img/goodsImg/2065.jpg', 188, '个', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2073, 177, '17款宝骏510专用后备箱垫', '../../img/goodsImg/2073.jpg', 138, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2074, 177, '2020款本田冠道URV全包围后备箱垫', '../../img/goodsImg/2074.jpg', 248, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2075, 177, '专用于斯柯达柯迪亚克后备箱垫', '../../img/goodsImg/2075.jpg', 320, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2076, 177, '大众全新朗逸桑塔纳尾箱垫', '../../img/goodsImg/2076.jpg', 48, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2077, 177, '本田CRV后备箱垫', '../../img/goodsImg/2077.jpg', 178, '个', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2085, 178, '舜展车载双缸充气泵', '../../img/goodsImg/2085.jpg', 139, '个', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2086, 178, '非常爱车12V汽车车载充气泵', '../../img/goodsImg/2086.jpg', 129, '个', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2087, 178, '米其林数显预设胎压车载充气泵', '../../img/goodsImg/2087.jpg', 178, '个', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2088, 178, '车志酷车载充气泵', '../../img/goodsImg/2088.jpg', 98, '个', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2089, 178, '尤利特车载充气泵', '../../img/goodsImg/2089.jpg', 135, '个', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2097, 179, '布迪车用安全锤', '../../img/goodsImg/2097.jpg', 25, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2098, 179, '洗匠车用安全锤', '../../img/goodsImg/2098.jpg', 128, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2099, 179, '朗力正品迷你安全锤', '../../img/goodsImg/2099.jpg', 30, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2100, 179, '奥克龙正品安全锤', '../../img/goodsImg/2100.jpg', 69, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2101, 179, '百事泰车用安全锤', '../../img/goodsImg/2101.jpg', 118, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2109, 180, '适用丰田凯美瑞雨刮器', '../../img/goodsImg/2109.jpg', 68, '对', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2110, 180, '适用大众速腾朗逸雨刮器', '../../img/goodsImg/2110.jpg', 68, '对', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2111, 180, 'Bosch博世无骨雨刷器', '../../img/goodsImg/2111.jpg', 79, '对', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2112, 180, '博世凯越雨刮器', '../../img/goodsImg/2112.jpg', 84, '对', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2113, 180, '3M广本雅阁雨刮器', '../../img/goodsImg/2113.jpg', 138, '对', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2121, 181, '新福克斯科鲁兹汽车空调滤芯', '../../img/goodsImg/2121.jpg', 50, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2122, 181, '速派高尔夫6空调滤芯', '../../img/goodsImg/2122.jpg', 69, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2123, 181, '国产马自达CX-5空调滤芯', '../../img/goodsImg/2123.jpg', 48, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2124, 181, '新威驰汉兰达致炫普拉多空调滤芯', '../../img/goodsImg/2124.jpg', 30, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2125, 181, 'CRV思铂睿杰德艾力绅空调滤芯', '../../img/goodsImg/2125.jpg', 49, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2133, 182, '高尔夫6途安尚酷机滤机油滤芯', '../../img/goodsImg/2133.jpg', 28, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2134, 182, '新宝来高6速腾迈腾途安机油滤芯', '../../img/goodsImg/2134.jpg', 49, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2135, 182, '丰田原装纯牌 机油滤清器', '../../img/goodsImg/2135.jpg', 26, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2136, 182, '骑士S7机滤机油滤芯', '../../img/goodsImg/2136.jpg', 20, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2137, 182, '新奥拓尚悦启悦机滤机油滤芯', '../../img/goodsImg/2137.jpg', 24, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2145, 183, '新福克斯经典空气滤芯', '../../img/goodsImg/2145.jpg', 49, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2146, 183, '经典科鲁兹空滤博世空气滤芯格清器', '../../img/goodsImg/2146.jpg', 30, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2147, 183, '卡罗拉原厂汽车空气滤芯', '../../img/goodsImg/2147.jpg', 40, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2148, 183, '高尔夫7速腾空滤空气滤芯格滤清器', '../../img/goodsImg/2148.jpg', 39, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2149, 183, '丰田原装纯牌空气滤清器芯', '../../img/goodsImg/2149.jpg', 67, '个', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2157, 184, '汉兰达陶瓷汽车前刹车片', '../../img/goodsImg/2157.jpg', 280, '片', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2158, 184, 'i30途胜前刹车片', '../../img/goodsImg/2158.jpg', 158, '片', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2159, 184, '阿特兹马六前陶瓷刹车片', '../../img/goodsImg/2159.jpg', 260, '片', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2160, 184, '君越昂科拉博世前刹车片', '../../img/goodsImg/2160.jpg', 188, '片', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2161, 184, '皇冠博世前刹车片', '../../img/goodsImg/2161.jpg', 168, '片', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2169, 185, '博世铂金火花塞', '../../img/goodsImg/2169.jpg', 116, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2170, 185, 'NGK火花塞', '../../img/goodsImg/2170.jpg', 60, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2171, 185, '科鲁兹1.6汽车双铱金火花塞', '../../img/goodsImg/2171.jpg', 69, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2172, 185, 'CNG油气两用三极火花塞', '../../img/goodsImg/2172.jpg', 30, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2173, 185, '博世铂金FR8NP火花塞', '../../img/goodsImg/2173.jpg', 120, '个', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2181, 186, '强生汽车贴膜', '../../img/goodsImg/2181.jpg', 1498, '套', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2182, 186, '龙膜汽车贴膜', '../../img/goodsImg/2182.jpg', 2280, '套', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2183, 186, '威固 名雅系列 汽车贴膜', '../../img/goodsImg/2183.jpg', 1988, '套', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2184, 186, '量子高清晰汽车贴膜', '../../img/goodsImg/2184.jpg', 2000, '套', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2185, 186, '美基汽车贴膜', '../../img/goodsImg/2185.jpg', 618, '套', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2193, 187, '车内氛围灯led汽车装饰灯', '../../img/goodsImg/2193.jpg', 88, '盏', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2194, 187, '双畅 汽车装饰灯音乐节奏灯', '../../img/goodsImg/2194.jpg', 112, '盏', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2195, 187, '汽车太阳能装饰灯', '../../img/goodsImg/2195.jpg', 268, '盏', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2196, 187, '福特13-17新蒙迪欧装饰灯', '../../img/goodsImg/2196.jpg', 258, '盏', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2197, 187, '七彩尾箱汽车装饰灯', '../../img/goodsImg/2197.jpg', 58, '盏', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2205, 188, '通用SUV越野改装车顶架', '../../img/goodsImg/2205.jpg', 640, '架', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2206, 188, '缤智改装车顶架', '../../img/goodsImg/2206.jpg', 458, '架', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2207, 188, '全新17款本田crv车顶架', '../../img/goodsImg/2207.jpg', 508, '架', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2208, 188, '专用于14-17款别克昂科威车顶架', '../../img/goodsImg/2208.jpg', 338, '架', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2209, 188, '日产尼桑逍客装饰车顶架', '../../img/goodsImg/2209.jpg', 238, '架', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2217, 189, '韦帕 车顶行李箱', '../../img/goodsImg/2217.jpg', 2180, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2218, 189, '正品SUV汽车车载行李箱', '../../img/goodsImg/2218.jpg', 1260, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2219, 189, '正品汽车车载车顶行李箱', '../../img/goodsImg/2219.jpg', 1560, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2220, 189, '点缤 正品汽车车顶行李箱', '../../img/goodsImg/2220.jpg', 1580, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2221, 189, '拓鹰汽车车载车顶行李箱', '../../img/goodsImg/2221.jpg', 1430, '个', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2229, 190, '美基汽车太阳膜', '../../img/goodsImg/2229.jpg', 618, '套', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2230, 190, '优卡航 汽车太阳膜', '../../img/goodsImg/2230.jpg', 437, '套', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2231, 190, '贝特夫汽车太阳膜', '../../img/goodsImg/2231.jpg', 688, '套', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2232, 190, '今蓝纳米汽车太阳膜', '../../img/goodsImg/2232.jpg', 599, '套', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2233, 190, '首纳s系汽车太阳膜', '../../img/goodsImg/2233.jpg', 459, '套', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2241, 191, 'HLA/海澜之家印花短袖t恤', '../../img/goodsImg/2241.jpg', 78, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2242, 191, '衣品天成夏季短袖男圆领套头印花t恤', '../../img/goodsImg/2242.jpg', 70, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2243, 191, 'GXG男士舒适打底衫白色圆领短袖T恤', '../../img/goodsImg/2243.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2244, 191, '太平鸟纯色干净时尚百搭休闲帅气短袖T恤', '../../img/goodsImg/2244.jpg', 159, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2245, 191, 'AK都市特工字母印花圆领短袖T恤', '../../img/goodsImg/2245.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2253, 192, 'G2000夏季白衬衫男短袖', '../../img/goodsImg/2253.jpg', 159, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2254, 192, '雅戈尔白色秋季纯棉男士短袖衬衫', '../../img/goodsImg/2254.jpg', 329, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2255, 192, 'ZARA白色素面修身弹性短袖衬衫', '../../img/goodsImg/2255.jpg', 199, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2256, 192, '杉杉短袖衬衫', '../../img/goodsImg/2256.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2257, 192, 'Seno夏季新款男士修身短袖衬衫', '../../img/goodsImg/2257.jpg', 128, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2265, 193, 'ZARA 男装深蓝色修身牛仔夹克', '../../img/goodsImg/2265.jpg', 299, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2266, 193, '骆驼男装2020春秋双面修身夹克', '../../img/goodsImg/2266.jpg', 238, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2267, 193, 'VIISHOW2020春秋装牛仔夹克', '../../img/goodsImg/2267.jpg', 228, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2268, 193, 'HLA/海澜之家立领修身夹克', '../../img/goodsImg/2268.jpg', 398, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2269, 193, 'abx秋季英伦复古麂皮绒修身夹克', '../../img/goodsImg/2269.jpg', 339, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2277, 194, '森马连帽男卫衣', '../../img/goodsImg/2277.jpg', 150, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2278, 194, 'GXG黑色时尚潮流连帽套头宽松卫衣', '../../img/goodsImg/2278.jpg', 399, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2279, 194, 'VIISHOW新款情侣外套嘻哈卫衣', '../../img/goodsImg/2279.jpg', 149, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2280, 194, '春秋季oversize连帽套头卫衣', '../../img/goodsImg/2280.jpg', 85, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2281, 194, '唐狮纯色慵懒卫衣', '../../img/goodsImg/2281.jpg', 129, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2289, 195, 'lilbetter新品潮牌青年束脚裤', '../../img/goodsImg/2289.jpg', 178, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2290, 195, 'GXG男装秋季热卖时尚潮流黑色束脚裤', '../../img/goodsImg/2290.jpg', 239, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2291, 195, '马克华菲时尚潮流印花黑色针织束脚裤', '../../img/goodsImg/2291.jpg', 158, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2292, 195, 'Lee新品猫须水洗中腰男士束脚裤', '../../img/goodsImg/2292.jpg', 514, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2293, 195, '太平鸟冬款黑色个性拉链抽绳束脚裤', '../../img/goodsImg/2293.jpg', 289, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2301, 196, 'A21秋季男装休闲潮流小脚九分裤', '../../img/goodsImg/2301.jpg', 179, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2302, 196, 'TRENDIANO简约运动棉质纯色九分裤', '../../img/goodsImg/2302.jpg', 149, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2303, 196, 'Simwood秋新款裤口褶边微弹小脚九分裤', '../../img/goodsImg/2303.jpg', 158, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2304, 196, '韩版潮流男士宽松青少年九分裤', '../../img/goodsImg/2304.jpg', 99, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2305, 196, '花花公子韩版潮流哈伦束脚裤', '../../img/goodsImg/2305.jpg', 139, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2313, 197, 'Lilbetter复古水洗做旧破洞牛仔裤', '../../img/goodsImg/2313.jpg', 148, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2314, 197, 'PANMAX潮流百搭大码破洞牛仔裤', '../../img/goodsImg/2314.jpg', 198, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2315, 197, 'Lee秋冬新品低腰直脚破洞牛仔裤', '../../img/goodsImg/2315.jpg', 801, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2316, 197, 'A21秋季新男士百搭破洞牛仔裤', '../../img/goodsImg/2316.jpg', 199, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2317, 197, '秋季潮牌破洞牛仔裤', '../../img/goodsImg/2317.jpg', 138, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2325, 198, '花花公子男士秋季外套青年棒球服', '../../img/goodsImg/2325.jpg', 269, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2326, 198, '韩版潮流修身帅气棒球服', '../../img/goodsImg/2326.jpg', 138, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2327, 198, '马克华菲新品潮流韩版飞行员棒球服', '../../img/goodsImg/2327.jpg', 398, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2328, 198, '战地吉普春秋棒球服', '../../img/goodsImg/2328.jpg', 188, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2329, 198, '唐狮男士外套春秋韩版舒适棒球服', '../../img/goodsImg/2329.jpg', 199, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2337, 199, '罗蒙职业后中开叉西服套装', '../../img/goodsImg/2337.jpg', 558, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2338, 199, '培罗蒙秋款中年男士商务西服套装', '../../img/goodsImg/2338.jpg', 618, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2339, 199, 'VICUTU/威可多男西服套装', '../../img/goodsImg/2339.jpg', 1008, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2340, 199, '杉杉黑色修身商务休闲西装套装', '../../img/goodsImg/2340.jpg', 759, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2341, 199, 'HANY汉尼西服套装', '../../img/goodsImg/2341.jpg', 1999, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2349, 200, 'SELECTED思莱德白鸭羽绒服', '../../img/goodsImg/2349.jpg', 400, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2350, 200, 'BSD波司登百搭连帽男装羽绒服', '../../img/goodsImg/2350.jpg', 989, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2351, 200, '雪中飞纯色连帽宽松加厚潮羽绒服', '../../img/goodsImg/2351.jpg', 599, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2352, 200, '迪卡侬 男户外羽绒服', '../../img/goodsImg/2352.jpg', 999, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2353, 200, '杰克琼斯男装冬天毛领加厚羽绒服', '../../img/goodsImg/2353.jpg', 900, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2361, 201, '森马男士黑色修身休闲裤', '../../img/goodsImg/2361.jpg', 97, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2362, 201, 'HLA/海澜之家修身休闲裤', '../../img/goodsImg/2362.jpg', 168, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2363, 201, 'Simwood简木男装秋季休闲裤', '../../img/goodsImg/2363.jpg', 88, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2364, 201, 'a21男士弹力修身休闲裤', '../../img/goodsImg/2364.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2365, 201, '太平鸟男士藏青色时尚修身休闲裤', '../../img/goodsImg/2365.jpg', 179, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2373, 202, '杉杉2020新款纯色免烫西裤', '../../img/goodsImg/2373.jpg', 179, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2374, 202, 'G2000青年修身西裤', '../../img/goodsImg/2374.jpg', 229, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2375, 202, '思莱德时尚简约男士商务修身西裤', '../../img/goodsImg/2375.jpg', 250, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2376, 202, 'VICUTU/威可多男士西装裤', '../../img/goodsImg/2376.jpg', 395, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2377, 202, '海澜之家男装简约大气商务西裤', '../../img/goodsImg/2377.jpg', 228, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2385, 203, '七匹狼男士翻领纯色POLO衫', '../../img/goodsImg/2385.jpg', 179, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2386, 203, '墨麦客男秋季翻领POLO衫', '../../img/goodsImg/2386.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2387, 203, '与狼共舞新款青年男士翻领polo衫', '../../img/goodsImg/2387.jpg', 149, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2388, 203, '恒源祥春秋中老年打底polo衫', '../../img/goodsImg/2388.jpg', 158, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2389, 203, 'AFS JEEP秋季新款翻领POLO衫', '../../img/goodsImg/2389.jpg', 88, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2397, 204, '哥弟女装秋装新款针织衫', '../../img/goodsImg/2397.jpg', 199, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2398, 204, 'M茵曼女2020新款V领针织衫', '../../img/goodsImg/2398.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2399, 204, 'VeroModa七分袖针织衫', '../../img/goodsImg/2399.jpg', 180, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2400, 204, 'ZARA珍珠装饰针织开衫', '../../img/goodsImg/2400.jpg', 259, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2401, 204, 'MOCO深V休闲落肩袖针织毛衫', '../../img/goodsImg/2401.jpg', 899, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2409, 205, '海澜之家运动风修身弹力针织裤', '../../img/goodsImg/2409.jpg', 158, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2410, 205, 'Hansca汉斯卡宽松针织裤', '../../img/goodsImg/2410.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2411, 205, 'GXG秋季男士时尚运动针织裤', '../../img/goodsImg/2411.jpg', 249, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2412, 205, '秋季薄款战地吉普男士针织裤', '../../img/goodsImg/2412.jpg', 98, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2413, 205, '劲利莱斯春秋季男士针织裤', '../../img/goodsImg/2413.jpg', 69, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2421, 206, '珂莱蒂尔休闲碎花气质连衣裙', '../../img/goodsImg/2421.jpg', 1038, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2422, 206, 'EP雅莹气质罗纹X型连衣裙', '../../img/goodsImg/2422.jpg', 1079, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2423, 206, 'Vero Moda气质蕾丝直筒连衣裙', '../../img/goodsImg/2423.jpg', 749, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2424, 206, 'Five Plus气质镂空刺绣连衣裙', '../../img/goodsImg/2424.jpg', 645, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2425, 206, 'snidel气质喇叭袖修身连衣裙', '../../img/goodsImg/2425.jpg', 540, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2433, 207, 'TRENDIANO冬装时尚休闲印花衬衫', '../../img/goodsImg/2433.jpg', 149, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2434, 207, '花花公子男士印花薄款商务衬衣', '../../img/goodsImg/2434.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2435, 207, 'UOOHE简约男士秋装绣印花衬衣', '../../img/goodsImg/2435.jpg', 168, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2436, 207, '英爵伦男士条纹印花衬衣', '../../img/goodsImg/2436.jpg', 128, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2437, 207, '恒源祥男士长袖印花衬衣', '../../img/goodsImg/2437.jpg', 298, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2445, 208, 'MOCO开衩蕾丝连衣裙', '../../img/goodsImg/2445.jpg', 1899, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2446, 208, 'Five Plus蕾丝长袖连衣裙', '../../img/goodsImg/2446.jpg', 436, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2447, 208, 'EP雅莹丝绒蝴蝶结蕾丝连衣裙', '../../img/goodsImg/2447.jpg', 799, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2448, 208, '欧时力蕾丝镂空连衣裙', '../../img/goodsImg/2448.jpg', 499, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2449, 208, '海青蓝蕾丝名媛立领喇叭袖连衣裙', '../../img/goodsImg/2449.jpg', 328, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2457, 209, 'Five Plus真丝纱钉珠连衣裙', '../../img/goodsImg/2457.jpg', 1195, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2458, 209, 'Massimo Dutt印花真丝连衣裙', '../../img/goodsImg/2458.jpg', 1590, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2459, 209, '魔法气质桑蚕丝红色真丝连衣裙', '../../img/goodsImg/2459.jpg', 489, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2460, 209, '中国风红色真丝桑蚕丝连衣裙', '../../img/goodsImg/2460.jpg', 539, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2461, 209, '丹慕妮尔新款七分袖真丝连衣裙', '../../img/goodsImg/2461.jpg', 328, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2469, 210, 'Vero Moda碎花系带百褶连衣裙', '../../img/goodsImg/2469.jpg', 699, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2470, 210, '哥弟女装拼色女百褶裙', '../../img/goodsImg/2470.jpg', 479, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2471, 210, '太平鸟女装百搭学院风百褶裙', '../../img/goodsImg/2471.jpg', 249, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2472, 210, 'Five Plus新女装纯色半身百褶裙', '../../img/goodsImg/2472.jpg', 569, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2473, 210, '欧时力秋装丝绒紧腰百褶半身裙', '../../img/goodsImg/2473.jpg', 399, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2481, 211, 'Vero Moda罩衫背心连衣裙', '../../img/goodsImg/2481.jpg', 549, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2482, 211, 'Five Plus秋装刺绣V领背心裙', '../../img/goodsImg/2482.jpg', 447, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2483, 211, 'ZARA女装斜纹软呢背心裙', '../../img/goodsImg/2483.jpg', 259, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2484, 211, '芙娜妮套装裙针织背心裙', '../../img/goodsImg/2484.jpg', 149, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2485, 211, '海青蓝个性绑带收腰背心连衣裙', '../../img/goodsImg/2485.jpg', 328, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2493, 212, 'VeroModa A摆针织连衣裙', '../../img/goodsImg/2493.jpg', 449, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2494, 212, '太平鸟修身钻石绒半身A字裙', '../../img/goodsImg/2494.jpg', 169, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2495, 212, '伊芙丽韩版新款中长款显瘦a字裙', '../../img/goodsImg/2495.jpg', 249, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2496, 212, '珂莱蒂尔正品新款秋冬红色a字裙', '../../img/goodsImg/2496.jpg', 2148, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2497, 212, '乐町新款女印花丝绒A字裙', '../../img/goodsImg/2497.jpg', 239, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2505, 213, '歌瑞拉棉麻碎花连衣裙', '../../img/goodsImg/2505.jpg', 138, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2506, 213, '春秋棉麻衬衫连衣裙', '../../img/goodsImg/2506.jpg', 149, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2507, 213, '民族风棉麻春秋冬连衣裙', '../../img/goodsImg/2507.jpg', 359, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2508, 213, '蒲牌新款女装针织拼接棉麻连衣裙', '../../img/goodsImg/2508.jpg', 568, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2509, 213, '星诺复古文艺森女系棉麻连衣裙', '../../img/goodsImg/2509.jpg', 186, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2517, 214, '哥弟女装新款中长款女士包臀裙', '../../img/goodsImg/2517.jpg', 199, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2518, 214, '乐町印花丝绒包臀裙', '../../img/goodsImg/2518.jpg', 239, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2519, 214, '太平鸟新款格子开叉包臀裙', '../../img/goodsImg/2519.jpg', 219, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2520, 214, '伊芙丽新款港味时尚包臀裙', '../../img/goodsImg/2520.jpg', 268, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2521, 214, '蒙小橙职业包臀裙', '../../img/goodsImg/2521.jpg', 109, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2529, 215, 'VeroModa条纹圆领长袖连衣裙', '../../img/goodsImg/2529.jpg', 199, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2530, 215, 'MOCO趣味图案刺绣长袖连衣裙', '../../img/goodsImg/2530.jpg', 899, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2531, 215, 'ZARA连帽天鹅绒长袖连衣裙', '../../img/goodsImg/2531.jpg', 399, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2532, 215, '欧时力新女装摩登长袖连衣裙', '../../img/goodsImg/2532.jpg', 279, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2533, 215, 'EP雅莹新款长袖黑色连衣裙', '../../img/goodsImg/2533.jpg', 779, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2541, 216, '森马新款男士弹力修身小脚裤', '../../img/goodsImg/2541.jpg', 130, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2542, 216, 'simwood男士弹力修身小脚裤', '../../img/goodsImg/2542.jpg', 148, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2543, 216, '马克华菲时尚舒适微弹小脚裤', '../../img/goodsImg/2543.jpg', 258, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2544, 216, 'a21男士弹力修身休闲小脚裤', '../../img/goodsImg/2544.jpg', 139, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2545, 216, 'Lilbetter休闲小脚裤', '../../img/goodsImg/2545.jpg', 148, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2553, 217, 'Lilbetter秋季修身牛仔哈伦裤', '../../img/goodsImg/2553.jpg', 168, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2554, 217, '森马韩版潮流修身哈伦裤', '../../img/goodsImg/2554.jpg', 150, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2555, 217, 'TRENDIANO潮流纯色哈伦裤', '../../img/goodsImg/2555.jpg', 299, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2556, 217, '秋季新款男士休闲哈伦裤', '../../img/goodsImg/2556.jpg', 78, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2557, 217, '凡转秋季男士哈伦裤', '../../img/goodsImg/2557.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2565, 218, '玲珑品智宴会金丝绒旗袍裙', '../../img/goodsImg/2565.jpg', 468, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2566, 218, '名兰世家秋装中袖短款改良旗袍', '../../img/goodsImg/2566.jpg', 739, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2567, 218, '丝绒中袖绣花旗袍裙', '../../img/goodsImg/2567.jpg', 288, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2568, 218, '华族经典中式优雅喜庆旗袍', '../../img/goodsImg/2568.jpg', 688, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2569, 218, '钱塘佳人中长款旗袍裙', '../../img/goodsImg/2569.jpg', 599, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2577, 219, '童装女童背带裤', '../../img/goodsImg/2577.jpg', 83, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2578, 219, '齐齐熊休闲百搭牛仔背带裤', '../../img/goodsImg/2578.jpg', 75, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2579, 219, '女装百搭学生韩版牛仔背带裤', '../../img/goodsImg/2579.jpg', 89, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2580, 219, '自然相伴牛仔背带裤', '../../img/goodsImg/2580.jpg', 129, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2581, 219, '韩版白搭学生浅诉背带裤', '../../img/goodsImg/2581.jpg', 159, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2589, 220, '精致新款旅拍森系轻婚纱礼服', '../../img/goodsImg/2589.jpg', 699, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2590, 220, '精致雕花欧式抹胸婚纱礼服', '../../img/goodsImg/2590.jpg', 948, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2591, 220, '串珠流苏精致仙美新娘婚纱礼服', '../../img/goodsImg/2591.jpg', 188, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2592, 220, '香云莎精致真丝香云纱礼服', '../../img/goodsImg/2592.jpg', 3690, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2593, 220, '爱特爱精致奢华气质V领礼服', '../../img/goodsImg/2593.jpg', 739, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2601, 221, '德芙巧克力3碗装官网正品纯黑白牛奶礼盒散装dove', '../../img/goodsImg/2601.jpg', 97, '件', 0, 0.753, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2602, 221, 'kisses好时之吻巧克力1000g原装整袋', '../../img/goodsImg/2602.jpg', 87, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2603, 221, '100%无糖纯黑巧克力QMINI散装 礼盒装零食', '../../img/goodsImg/2603.jpg', 27, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2604, 221, 'amovo魔吻100%无糖纯黑巧克力 纯可可脂', '../../img/goodsImg/2604.jpg', 30, '件', 0, 0.12, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2605, 221, '德芙士力架花生夹心巧克力散装1000g', '../../img/goodsImg/2605.jpg', 67, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2606, 221, '费列罗巧克力礼盒装48粒婚庆', '../../img/goodsImg/2606.jpg', 99, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2607, 221, '卜珂16味黑松露形巧克力808g礼盒装（代可可脂）', '../../img/goodsImg/2607.jpg', 40, '件', 0, 0.808, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2608, 221, '依蒂安斯手工巧克力礼盒装纯可可脂黑松露形', '../../img/goodsImg/2608.jpg', 30, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2609, 221, 'Lindt瑞士莲进口特醇排装可可黑巧克力', '../../img/goodsImg/2609.jpg', 33, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2610, 221, 'GuyLian吉利莲比利时进口金贝壳巧克力礼盒装250g', '../../img/goodsImg/2610.jpg', 89, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2611, 221, '朵娜贝拉生巧克力礼盒装手工黑松露抹茶', '../../img/goodsImg/2611.jpg', 70, '件', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2612, 221, '德菲丝法国原味1kg进口松露形巧克力礼盒装（代可可脂）', '../../img/goodsImg/2612.jpg', 89, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2613, 222, '【三只松鼠_开口松子218gx2袋】手剥红松子原味', '../../img/goodsImg/2613.jpg', 48, '件', 0, 0.436, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2614, 222, '棠品零食干果坚果组合1000g大礼包', '../../img/goodsImg/2614.jpg', 53, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2615, 222, '沃隆每日坚果大礼包中秋礼品盒混合干果30包', '../../img/goodsImg/2615.jpg', 148, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2616, 222, '楼兰蜜语薄皮核桃500gx2袋新疆生核桃坚果仁', '../../img/goodsImg/2616.jpg', 44, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2617, 222, '良品铺子坚果大礼包每日坚果零食组合中秋干果礼盒', '../../img/goodsImg/2617.jpg', 90, '件', 0, 1.149, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2618, 222, '【百草味-圆满大礼包1428g】 综合零食礼盒8袋', '../../img/goodsImg/2618.jpg', 98, '件', 0, 1.428, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2619, 222, '新疆特产薄皮大核桃500g*3袋干果原味生坚果', '../../img/goodsImg/2619.jpg', 60, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2620, 222, '【憨豆熊 坚果大礼包】夏威夷果 碧根果杏仁开心果', '../../img/goodsImg/2620.jpg', 43, '件', 0, 0.48, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2621, 222, '【神品】原味手剥松子500g干果坚果薄壳巴西松子', '../../img/goodsImg/2621.jpg', 146, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2622, 222, '【壳太郎_杏仁500g】无壳杏仁坚果干果原味盐焗', '../../img/goodsImg/2622.jpg', 32, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2623, 222, 'Kirkland Signature科克兰 无调味综合坚果1130g ', '../../img/goodsImg/2623.jpg', 198, '件', 0, 1.13, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2624, 222, '【粒上皇-奶油味夏威夷果245g*2袋】坚果干果', '../../img/goodsImg/2624.jpg', 39, '件', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2625, 223, '上海冠生园压缩饼干代餐饱腹干粮118g9/10包组合', '../../img/goodsImg/2625.jpg', 29, '件', 0, 1.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2626, 223, '每日生机奶盐味苏打饼干咸味香葱梳打饼干', '../../img/goodsImg/2626.jpg', 44, '件', 0, 2.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2627, 223, '雀巢脆脆鲨巧克力味夹心威化24+8条休闲零食饼干', '../../img/goodsImg/2627.jpg', 25, '件', 0, 0.48, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2628, 223, 'AJI惊奇脆片苏打饼干咸味整箱批发200g*5包', '../../img/goodsImg/2628.jpg', 30, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2629, 223, '中膳堂杂粮粗粮燕麦饼干整箱2.25kg', '../../img/goodsImg/2629.jpg', 50, '件', 0, 2.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2630, 223, '印尼进口 richeese丽芝士纳宝帝奶酪威化饼干', '../../img/goodsImg/2630.jpg', 30, '件', 0, 0.35, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2631, 223, '江中猴姑饼干20天装960g 酥性零食猴头菇饼干 ', '../../img/goodsImg/2631.jpg', 118, '件', 0, 0.96, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2632, 223, '米多奇烤香馍片40包2kg整箱食品烤馍馒头片', '../../img/goodsImg/2632.jpg', 36, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2633, 223, '亿滋焙朗早餐饼300g*3盒谷物粗粮酥性饼干', '../../img/goodsImg/2633.jpg', 48, '件', 0, 0.9, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2634, 223, '台湾宏亚77松塔30个480g蜜兰诺千层酥饼干', '../../img/goodsImg/2634.jpg', 36, '件', 0, 0.48, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2635, 223, 'Aji酵母减盐苏打饼干 咸味梳打饼干472.5g*3', '../../img/goodsImg/2635.jpg', 30, '件', 0, 1.417, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2636, 223, '健元堂全燕麦饼干粗粮饱腹健身代餐食品', '../../img/goodsImg/2636.jpg', 20, '件', 0, 0.36, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2637, 224, '港荣蒸蛋糕1kg早餐糕点手撕小面包整箱', '../../img/goodsImg/2637.jpg', 39, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2638, 224, '好利来半熟芝士蛋糕5枚入甜品糕点点心', '../../img/goodsImg/2638.jpg', 38, '件', 0, 0.18, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2639, 224, '麦吉士鲜蛋糕小零食食品长崎面包糕点', '../../img/goodsImg/2639.jpg', 55, '件', 0, 1.28, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2640, 224, '良品铺子奶香蒸蛋糕 面包零食小吃整箱1kg', '../../img/goodsImg/2640.jpg', 40, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2641, 224, '【葡记 长崎蜂蜜蛋糕1000g】烘焙手撕面包', '../../img/goodsImg/2641.jpg', 40, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2642, 224, '达利园瑞士卷香蕉味蛋糕3斤 ', '../../img/goodsImg/2642.jpg', 35, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2643, 224, '好丽友派60枚大包装 巧克力味休闲糕点蛋糕', '../../img/goodsImg/2643.jpg', 77, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2644, 224, '稻香村蜂蜜鸡蛋糕330G*2好吃的小蛋糕', '../../img/goodsImg/2644.jpg', 26, '件', 0, 0.66, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2645, 224, '豪士口袋面包750g*2箱 菠萝果粒夹心三明治', '../../img/goodsImg/2645.jpg', 50, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2646, 224, '【百草味-椰丝球210gx2袋】糕点甜点小包装', '../../img/goodsImg/2646.jpg', 23, '件', 0, 0.42, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2647, 224, '派悦坊 红丝绒圆舞曲 生日蛋糕 ', '../../img/goodsImg/2647.jpg', 249, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2648, 224, '黑天鹅蛋糕天使之爱朗姆提子巧克力', '../../img/goodsImg/2648.jpg', 399, '件', 0, 1.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2649, 225, '糖村 法式原味手工牛轧糖500g', '../../img/goodsImg/2649.jpg', 127, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2650, 225, '阿尔卑斯散糖2.5kg硬糖混合装巧克力牛奶糖', '../../img/goodsImg/2650.jpg', 140, '件', 0, 2.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2651, 225, '旺旺 旺仔牛奶糖HelloKitty版518g罐装糖果零食', '../../img/goodsImg/2651.jpg', 22, '件', 0, 0.518, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2652, 225, 'candylab【猫咪，柴犬礼盒】手工切片糖果', '../../img/goodsImg/2652.jpg', 60, '件', 0, 0.96, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2653, 225, 'Almond Roca乐家扁桃仁巧克力罐装糖果822g', '../../img/goodsImg/2653.jpg', 148, '件', 0, 0.822, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2661, 226, '皇冠丹麦曲奇饼干90gX5盒大礼包黄油曲奇 ', '../../img/goodsImg/2661.jpg', 36, '件', 0, 0.072, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2662, 226, '日本进口饼干波路梦/布尔本曲奇德式什锦味', '../../img/goodsImg/2662.jpg', 45, '件', 0, 0.317, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2663, 226, '曲奇饼干礼盒伴手礼铁盒装 手工网红曲奇  悠享家', '../../img/goodsImg/2663.jpg', 119, '件', 0, 0.58, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2664, 226, '【百草味-蔓越莓曲奇100g】曲奇手工饼干点心美食', '../../img/goodsImg/2664.jpg', 12, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2665, 226, '法丽兹曲奇蛋卷零食大礼包1348g组合装', '../../img/goodsImg/2665.jpg', 55, '件', 0, 1.348, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2673, 227, '【波力海苔原味126gX2罐】 海苔片', '../../img/goodsImg/2673.jpg', 200, '件', 0, 0.252, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2674, 227, '泰国原装进口小老板big sheet大片海苔原味', '../../img/goodsImg/2674.jpg', 57, '件', 0, 0.189, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2675, 227, 'ZEK儿童宝宝烤海苔即食12袋（36小包） ', '../../img/goodsImg/2675.jpg', 80, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2676, 227, '优基夹心海苔脆片40g*5罐(200g) 即食紫菜', '../../img/goodsImg/2676.jpg', 47, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2677, 227, '韩国拌饭海苔橄榄油芝麻炒海苔70*3', '../../img/goodsImg/2677.jpg', 35, '件', 0, 0.35, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2685, 228, '正宗友臣肉松饼1.25kg福建特产零食', '../../img/goodsImg/2685.jpg', 42, '件', 0, 1.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2686, 228, '良品铺子肉松饼整箱小吃糕点点心早餐食品', '../../img/goodsImg/2686.jpg', 60, '件', 0, 2.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2687, 228, '好利来肉松蛋黄Q饼手工现烤台湾酥皮糕点心礼盒', '../../img/goodsImg/2687.jpg', 58, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2688, 228, '【三只松鼠黄金肉松饼456gx2袋】休闲食品糕点小吃', '../../img/goodsImg/2688.jpg', 36, '件', 0, 0.912, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2689, 228, '苹果花园肉松蛋黄酥六只盒装390g手工肉松蛋黄饼', '../../img/goodsImg/2689.jpg', 42, '件', 0, 0.39, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2697, 229, '科尔沁手撕风干牛肉干400g原味内蒙特产休闲零食', '../../img/goodsImg/2697.jpg', 99, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2698, 229, ' 内蒙古牛肉干 风干牛肉干 草原达尔沁 零食 食品特产', '../../img/goodsImg/2698.jpg', 76, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2699, 229, '金角老四川牛肉干500g  重庆特产 麻辣零食特色小吃', '../../img/goodsImg/2699.jpg', 76, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2700, 229, '棒棒娃手撕风干牛肉干 四川特产小吃五香味/麻辣味', '../../img/goodsImg/2700.jpg', 70, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2701, 229, '牛浪汉 牛肉条 经典五香 牛肉干 重庆特产共500g', '../../img/goodsImg/2701.jpg', 72, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2709, 230, '百草味手撕鱿鱼条80g 海味即食鱿鱼丝海鲜零食小吃', '../../img/goodsImg/2709.jpg', 10, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2710, 230, '老鲜生碳烤手撕风琴鱿鱼丝香辣味大连特产', '../../img/goodsImg/2710.jpg', 30, '件', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2711, 230, '海边人 鱿鱼丝500g包邮零食小吃青岛海鲜特产', '../../img/goodsImg/2711.jpg', 30, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2712, 230, '良品铺子风琴鱿鱼丝 香辣味手撕鱿鱼片原味', '../../img/goodsImg/2712.jpg', 20, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2713, 230, '万顺昌 鱿鱼丝500g包邮大连特产碳烤手撕鱿鱼片', '../../img/goodsImg/2713.jpg', 28, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2721, 231, '熊孩子 芒果干4袋水果干蜜饯果脯果干类芒果片', '../../img/goodsImg/2721.jpg', 30, '件', 0, 0.48, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2722, 231, '雪海梅乡_话梅575g组合4罐装果干果脯', '../../img/goodsImg/2722.jpg', 30, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2723, 231, '三只松鼠 红杏干106g休闲零食果脯蜜饯水果干杏肉', '../../img/goodsImg/2723.jpg', 20, '件', 0, 0.106, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2724, 231, '良品铺子零食大礼包水果芒果干组合蜜饯果脯礼盒 ', '../../img/goodsImg/2724.jpg', 69, '件', 0, 0.866, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2725, 231, '【三只松鼠_琥珀阿胶蜜枣220g】蜜饯红枣无核', '../../img/goodsImg/2725.jpg', 16, '件', 0, 0.22, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2733, 232, '【周黑鸭旗舰店】卤鸭脖200g卤鸭锁骨240g鸭翅250g', '../../img/goodsImg/2733.jpg', 87, '件', 0, 0.69, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2734, 232, '精武鸭脖鸭掌舌翅鸭架锁骨肫鸭肉卤味零食675g', '../../img/goodsImg/2734.jpg', 59, '件', 0, 0.675, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2735, 232, '良品铺子辣味零食大礼包组合卤味肉类鸭脖鸭舌', '../../img/goodsImg/2735.jpg', 56, '件', 0, 0.49, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2736, 232, '煌上煌保鲜装鸭肉组合鸭脖260g鸭掌230g', '../../img/goodsImg/2736.jpg', 49, '件', 0, 0.49, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2737, 232, '好棒美香辣鸭脖子湖南特产真空小包装劲辣12g*30包', '../../img/goodsImg/2737.jpg', 27, '件', 0, 0.36, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2745, 233, '沈师傅鸡蛋干100g*10袋四川特产零食小吃食品', '../../img/goodsImg/2745.jpg', 39, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2746, 233, '好巴食豆腐干综合味750G四川特产麻辣豆干', '../../img/goodsImg/2746.jpg', 24, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2747, 233, '香之渝香菇豆干多口味500g麻辣豆腐干散装小包装', '../../img/goodsImg/2747.jpg', 9, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2748, 233, '劲仔厚豆干25gX40包 麻辣零食小吃湖南特产', '../../img/goodsImg/2748.jpg', 34, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2749, 233, '重庆特产偷嘴猴香菇豆干500克包邮小包装', '../../img/goodsImg/2749.jpg', 9, '件', 0, 0.54, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2757, 234, 'Budweiser/百威啤酒 小麦醇正拉罐500ml*18听 整箱', '../../img/goodsImg/2757.jpg', 99, '件', 0, 9, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2758, 234, '青岛啤酒爆款经典系列PK德国啤酒500ml*12听*2箱 ', '../../img/goodsImg/2758.jpg', 118, '件', 0, 12, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2759, 234, '德国进口啤酒 慕尼黑教士小麦啤酒 白啤酒500ML*24听', '../../img/goodsImg/2759.jpg', 159, '件', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2760, 234, '法国进口1664白啤酒玫瑰6种果味精酿啤酒12瓶', '../../img/goodsImg/2760.jpg', 119, '件', 0, 8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2761, 234, '嘉士伯法国克伦堡凯旋1664白啤酒整箱330ml*16瓶', '../../img/goodsImg/2761.jpg', 198, '件', 0, 10, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2769, 235, '国产红酒整箱装长城窖酿解百纳干红葡萄酒750ml*6瓶', '../../img/goodsImg/2769.jpg', 139, '件', 0, 4.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2770, 235, '拉菲红酒原瓶进口巴斯克花园干红葡萄酒6支', '../../img/goodsImg/2770.jpg', 526, '件', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2771, 235, '中粮长城干红葡萄酒 特酿三解百纳 红酒整箱6支', '../../img/goodsImg/2771.jpg', 165, '件', 0, 4.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2772, 235, '法国波尔多AOC干红葡萄酒原装进口红酒一生一世组合', '../../img/goodsImg/2772.jpg', 354, '件', 0, 9, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2773, 235, '法国原装进口干红路易拉菲红酒双支葡萄酒2支整箱装', '../../img/goodsImg/2773.jpg', 158, '件', 0, 4.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2781, 236, '卢正浩茶叶绿茶正宗雨前西湖龙井250克2020新茶上市', '../../img/goodsImg/2781.jpg', 88, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2782, 236, '西湖牌龙井绿茶百年老茶树西湖龙井茶叶', '../../img/goodsImg/2782.jpg', 98, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2783, 236, '西湖龙井2020新茶 雨前龙井茶叶绿茶200g', '../../img/goodsImg/2783.jpg', 158, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2784, 236, '2020新茶 盛茗世家绿茶  西湖龙井茶叶礼盒装250g ', '../../img/goodsImg/2784.jpg', 299, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2785, 236, '艺福堂茶叶 绿茶 西湖龙井茶250g  2020新茶 春茶', '../../img/goodsImg/2785.jpg', 69, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2793, 237, '大红袍武夷岩茶散装森舟中火大红袍礼盒装500g', '../../img/goodsImg/2793.jpg', 108, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2794, 237, '大红袍500g 武夷岩茶浓香型 正岩乌龙茶 ', '../../img/goodsImg/2794.jpg', 89, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2795, 237, '天福茗茶 大红袍 武夷山特产 正宗岩茶乌龙茶 ', '../../img/goodsImg/2795.jpg', 240, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2796, 237, '八马茶叶 武夷岩茶大红袍 乌龙茶 大红袍盒装160克', '../../img/goodsImg/2796.jpg', 89, '件', 0, 0.16, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2797, 237, '正山堂茶业 元正特级大红袍武夷山岩茶茶叶50g*3罐', '../../img/goodsImg/2797.jpg', 138, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2805, 238, '八马茶业 铁观音茶叶 浓香型  安溪乌龙茶133g', '../../img/goodsImg/2805.jpg', 199, '件', 0, 0.133, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2806, 238, '铁观音茶叶 安溪乌龙茶 清香浓香组合504克', '../../img/goodsImg/2806.jpg', 89, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2807, 238, '铁观音 浓香型 新茶安溪铁观音乌龙茶礼盒装共500g', '../../img/goodsImg/2807.jpg', 45, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2808, 238, '铁观音浓香型 安溪铁观音茶叶 500g乌龙茶叶', '../../img/goodsImg/2808.jpg', 78, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2809, 238, '清香型安溪铁观音茶叶 森舟满口香8198正味', '../../img/goodsImg/2809.jpg', 156, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2817, 239, '大益茶 勐海茶厂普洱茶 7572357g茶叶2020年', '../../img/goodsImg/2817.jpg', 123, '件', 0, 0.357, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2818, 239, '1000g普洱茶熟茶 新益号 2014升级版五年 1公斤', '../../img/goodsImg/2818.jpg', 69, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2819, 239, '宫明茶叶 云南 普洱茶熟茶  易武古树醇香散茶600g', '../../img/goodsImg/2819.jpg', 178, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2820, 239, '彩程2020年春茶老班章冰岛昔归古树普洱茶', '../../img/goodsImg/2820.jpg', 88, '件', 0, 0.357, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2821, 239, '龙润茶普洱茶熟茶陈年茶饼茶叶普洱茶叶 357g ', '../../img/goodsImg/2821.jpg', 130, '件', 0, 0.357, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2829, 240, '正山堂茶业 元正正山小种红茶茶叶特级50g*3罐', '../../img/goodsImg/2829.jpg', 100, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2830, 240, '立顿/Lipton 黄牌精选红茶 袋泡茶叶茶包 200G/盒', '../../img/goodsImg/2830.jpg', 38, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2831, 240, 'Twinings川宁 英国豪门伯爵红茶 红茶包50袋 ', '../../img/goodsImg/2831.jpg', 55, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2832, 240, '滇红茶2020新茶 660克 云南凤庆古树红茶  红茶茶叶', '../../img/goodsImg/2832.jpg', 65, '件', 0, 0.66, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2833, 240, '2020春茶武夷山茶叶正山小种红茶 特级茶叶 礼盒装', '../../img/goodsImg/2833.jpg', 79, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2841, 241, '蒙牛特仑苏醇纤牛奶250ml*12盒平衡好搭档', '../../img/goodsImg/2841.jpg', 51, '件', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2842, 241, '新西兰进口牛奶 安佳Anchor全脂纯牛奶 250ml*24整箱', '../../img/goodsImg/2842.jpg', 89, '件', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2843, 241, '蒙牛旗舰店 新养道零乳糖牛奶低脂型250ml*12盒整箱', '../../img/goodsImg/2843.jpg', 37, '件', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2844, 241, '科迪旗舰店原生高钙科迪牛奶透明袋装180ml*16袋', '../../img/goodsImg/2844.jpg', 45, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2845, 241, '中粮上质旗舰店法国原装进口牛奶脱脂牛奶1Lx12盒', '../../img/goodsImg/2845.jpg', 89, '件', 0, 5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2853, 242, '【24盒装】蒙牛纯甄常温酸奶 200g*24盒进口菌种', '../../img/goodsImg/2853.jpg', 99, '件', 0, 4.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2854, 242, '天润网红酸奶新疆牛奶低温浓缩原味乳饮品180g*12', '../../img/goodsImg/2854.jpg', 55, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2855, 242, '光明莫斯利安酸奶常温酸奶 350g*6*2  风味酸奶纯', '../../img/goodsImg/2855.jpg', 76, '件', 0, 4.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2856, 242, '小西牛 青海老酸奶青稞黑米酸牛奶低温老酸奶190gx12', '../../img/goodsImg/2856.jpg', 65, '件', 0, 1.9, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2857, 242, '燕塘原味酸奶饮品 常温酸牛奶200ml*12盒*2箱', '../../img/goodsImg/2857.jpg', 69, '件', 0, 2.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2865, 243, 'Nestle雀巢1+2原味三合一速溶咖啡粉100条礼盒装', '../../img/goodsImg/2865.jpg', 109, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2866, 243, '麦斯威尔咖啡三合一速溶咖啡粉经典原味咖啡', '../../img/goodsImg/2866.jpg', 80, '件', 0, 0.13, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2867, 243, '肆只猫云南小粒原味特浓100条1600g克三合一即冲饮', '../../img/goodsImg/2867.jpg', 39, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2868, 243, '塞纳左岸 速溶咖啡 特浓三合一白咖啡粉800g', '../../img/goodsImg/2868.jpg', 46, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2869, 243, 'NESPRESSO胶囊咖啡套装 瑞士进口人气精选 意式浓缩 ', '../../img/goodsImg/2869.jpg', 378, '件', 0, 0.51, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2877, 244, '瑞典进口ICA麦片50%水果坚果燕麦片750g冲饮美味早餐', '../../img/goodsImg/2877.jpg', 58, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2878, 244, '桂格燕麦片即食营养原味纯全麦片1000g*3', '../../img/goodsImg/2878.jpg', 57, '件', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2879, 244, '西麦有机燕麦片4袋装共3080g麦片食品冲饮谷物', '../../img/goodsImg/2879.jpg', 54, '件', 0, 3.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2880, 244, '家乐氏谷兰诺拉草莓黄桃双果谷物水果麦片490g*2盒', '../../img/goodsImg/2880.jpg', 80, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2881, 244, '杂粮先生 水果麦片1080g+坚果麦片1080g组合 ', '../../img/goodsImg/2881.jpg', 78, '件', 0, 2.16, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2889, 245, '香飘飘奶茶多口味冲泡即饮', '../../img/goodsImg/2889.jpg', 60, '件', 0, 1.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2890, 245, '喜之郎 优乐美奶茶粉袋装50袋*22g', '../../img/goodsImg/2890.jpg', 38, '件', 0, 1.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2891, 245, '创实 原味奶茶 三合一速溶珍珠奶茶粉1000g', '../../img/goodsImg/2891.jpg', 28, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2892, 245, '马来西亚进口 益昌三合一原味速溶奶茶 ', '../../img/goodsImg/2892.jpg', 32, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2893, 245, '广禧原味奶盖粉800g 皇茶喜贡茶奶盖茶专用', '../../img/goodsImg/2893.jpg', 30, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2901, 246, ' 韩国进口冲饮 全南 蜂蜜柚子茶 1kg 原装进口', '../../img/goodsImg/2901.jpg', 40, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2902, 246, '福事多蜂蜜柚子茶柠檬茶1Kg 韩国风果味茶水果茶', '../../img/goodsImg/2902.jpg', 32, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2903, 246, 'Lipton立顿清新柠檬冰红茶 冲饮速溶茶粉', '../../img/goodsImg/2903.jpg', 39, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2904, 246, '韩国进口全南蜂蜜芦荟茶1000g柚子茶', '../../img/goodsImg/2904.jpg', 39, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2905, 246, '新仙尼 蜂蜜柚子茶冲饮袋装饮料果味茶自制茶酱', '../../img/goodsImg/2905.jpg', 36, '件', 0, 1.36, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2913, 247, '韩国进口饮料lotte乐天180ml*15罐', '../../img/goodsImg/2913.jpg', 29, '件', 0, 2.7, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2914, 247, '农夫山泉NFC100%橙汁纯果汁饮料300ml24瓶装', '../../img/goodsImg/2914.jpg', 132, '件', 0, 7.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2915, 247, '椰树牌椰汁利乐包245ml*24盒整箱椰奶果汁', '../../img/goodsImg/2915.jpg', 72, '件', 0, 2.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2916, 247, '谷稻小庄 橙汁味浓缩果汁浓浆奶茶店原料', '../../img/goodsImg/2916.jpg', 36, '件', 0, 2.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2917, 247, '新日期促销 北冰洋汽水 桔味5瓶装', '../../img/goodsImg/2917.jpg', 26, '件', 0, 3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2925, 248, '【6A大果新货】远山农业 福建莆田桂圆干1500g', '../../img/goodsImg/2925.jpg', 48, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2926, 248, '盛耳 桂圆肉 460克 无核桂圆干龙眼肉', '../../img/goodsImg/2926.jpg', 48, '件', 0, 0.46, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2927, 248, '妙味珍新货大桂圆干6A龙眼干2斤干货肉厚甜', '../../img/goodsImg/2927.jpg', 34, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2928, 248, '盛耳 桂圆干500g*2龙眼干新货莆田特产', '../../img/goodsImg/2928.jpg', 20, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2929, 248, '三只松鼠 桂圆干500g*2龙眼干新货莆田特产', '../../img/goodsImg/2929.jpg', 20, '件', 0, 0.132, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2937, 249, ' 金锣 肉粒多香肠40g*8支/袋 火腿肠 零食 食品', '../../img/goodsImg/2937.jpg', 10, '件', 0, 0.32, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2938, 249, '丰热狗香肠原味500g*4袋台湾风味肉肠手工烤肠', '../../img/goodsImg/2938.jpg', 62, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2939, 249, '双汇王中王优级火腿肠30g*80支香肠泡面搭档', '../../img/goodsImg/2939.jpg', 66, '件', 0, 0.24, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2940, 249, '金字 香肠腊肠广式微甜味 农家自制正宗特产', '../../img/goodsImg/2940.jpg', 67, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2941, 249, '双汇玉米热狗肠40g*60根整箱火腿肠小香肠玉米肠', '../../img/goodsImg/2941.jpg', 52, '件', 0, 0.24, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2949, 250, '做寿司工具套装全套包邮 初学者寿司材料食材', '../../img/goodsImg/2949.jpg', 40, '件', 0, 1.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2950, 250, '初学者做寿司材料食材寿司工具套装全套包邮', '../../img/goodsImg/2950.jpg', 24, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2951, 250, '日本进口寿司醋500ml多福寿司材料/食材寿司', '../../img/goodsImg/2951.jpg', 47, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2952, 250, '凤球唛芥末青芥辣43g*3支寿司料理芥末酱芥末膏料', '../../img/goodsImg/2952.jpg', 25, '件', 0, 0.043, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2953, 250, '寿司工具套装初学者 做寿司材料食材全套', '../../img/goodsImg/2953.jpg', 18, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2961, 251, '倩碧黄油无油125ml/有油125g  清爽乳液 ', '../../img/goodsImg/2961.jpg', 295, '件', 0, 0.125, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2962, 251, '兰蔻 新立体塑颜紧致乳液100ml', '../../img/goodsImg/2962.jpg', 920, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2963, 251, '城野医生亲研旗舰店3D黄金海洋胶原肤乳液面霜', '../../img/goodsImg/2963.jpg', 350, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2964, 251, 'IPSA茵芙莎EX3乳液自律循环美肌液175ml', '../../img/goodsImg/2964.jpg', 570, '件', 0, 0.125, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2965, 251, 'POLA/宝丽B.A 乳液80ml 保湿滋润柔滑美肌', '../../img/goodsImg/2965.jpg', 1590, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2973, 252, 'Kiehl\'s科颜氏集焕白均衡亮肤淡斑精华液30ml', '../../img/goodsImg/2973.jpg', 520, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2974, 252, '兰蔻 「小黑瓶」全规格精华肌底液', '../../img/goodsImg/2974.jpg', 1080, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2975, 252, '肌肤之钥CPB水磨精华面部控油收缩毛孔精华液', '../../img/goodsImg/2975.jpg', 850, '件', 0, 0.17, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2976, 252, 'Innisfree/悦诗风吟小绿瓶精华 保湿面部精华液 ', '../../img/goodsImg/2976.jpg', 210, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2977, 252, '资生堂新透白美肌集光祛斑精华液30ml', '../../img/goodsImg/2977.jpg', 880, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2985, 253, '欧舒丹护手霜 鹿晗樱花润手霜30ml/75ml', '../../img/goodsImg/2985.jpg', 85, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2986, 253, '露得清挪威护手霜滋润保湿补水手部护理防冻裂', '../../img/goodsImg/2986.jpg', 92, '件', 0, 0.112, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2987, 253, '资生堂美润 护手霜保湿润滑(渗透滋养型)100g', '../../img/goodsImg/2987.jpg', 52, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2988, 253, '德国进口Herbacin/贺本清小甘菊护手霜20ml', '../../img/goodsImg/2988.jpg', 23, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2989, 253, 'LA MER海蓝之谜护手霜100ml 润手霜 滋润', '../../img/goodsImg/2989.jpg', 800, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2997, 254, 'Kiehl\'s科颜氏金盏花植物爽肤水250ml/500ml', '../../img/goodsImg/2997.jpg', 330, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2998, 254, '兰蔻清滢柔肤水400ml 粉水补水保湿爽肤水', '../../img/goodsImg/2998.jpg', 420, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (2999, 254, '娥佩兰薏仁水500ml爽肤水化妆水保湿水', '../../img/goodsImg/2999.jpg', 60, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3000, 254, '雅诗兰黛爽肤水红石榴能量水200ml ', '../../img/goodsImg/3000.jpg', 420, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3001, 254, '水密码爽肤水女男补水保湿定妆收缩毛孔化妆水', '../../img/goodsImg/3001.jpg', 49, '件', 0, 0.12, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3009, 255, '自然堂套装补水保湿水乳面部化妆品护肤品套装', '../../img/goodsImg/3009.jpg', 226, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3010, 255, '菲诗小铺水乳套装金盏花补水保湿少女护肤品', '../../img/goodsImg/3010.jpg', 359, '件', 0, 0.35, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3011, 255, '丸美巧克力丝滑护肤品套装正品女补水保湿水乳', '../../img/goodsImg/3011.jpg', 433, '件', 0, 0.55, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3012, 255, '京润珍珠化妆品套装女菁白护肤品补水保湿美白', '../../img/goodsImg/3012.jpg', 159, '件', 0, 0.45, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3013, 255, '玉兰油新生塑颜大红瓶套装抗抗皱紧致衰老护肤品', '../../img/goodsImg/3013.jpg', 623, '件', 0, 0.65, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3021, 256, 'Vaseline凡士林身体乳润肤露护手霜', '../../img/goodsImg/3021.jpg', 116, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3022, 256, '欧舒丹乳木果丰凝沐浴洗发露身体乳套装', '../../img/goodsImg/3022.jpg', 440, '件', 0, 0.8, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3023, 256, '原装进口 所望牛奶身体乳沐浴露套装', '../../img/goodsImg/3023.jpg', 118, '件', 0, 0.125, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3024, 256, 'cetaphil丝塔芙保湿润肤霜润肤身体乳566g', '../../img/goodsImg/3024.jpg', 129, '件', 0, 0.566, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3025, 256, 'Avon/雅芳小黑裙三件套装香体乳沐浴露走珠香水', '../../img/goodsImg/3025.jpg', 86, '件', 0, 0.55, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3033, 257, '按摩精油通经络全身推油身体肩颈足部玫瑰', '../../img/goodsImg/3033.jpg', 49, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3034, 257, '阿芙薰衣草精油10ml 天然植物香薰护肤精油芳疗', '../../img/goodsImg/3034.jpg', 138, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3035, 257, '英国AA网身体紧致按摩油100ml 基础按摩精油', '../../img/goodsImg/3035.jpg', 54, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3036, 257, '英国The body shop/美体小铺茶树精油10ml ', '../../img/goodsImg/3036.jpg', 68, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3037, 257, '伊帕尔汗薰衣草精油  面部护肤 熏衣草香薰精油', '../../img/goodsImg/3037.jpg', 125, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3045, 258, '兰蔻 奇迹绽放香水浪漫法国女士清新甜美花果香氛', '../../img/goodsImg/3045.jpg', 480, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3046, 258, 'Chanel/香奈儿清新邂逅女士发香雾淡香水', '../../img/goodsImg/3046.jpg', 395, '件', 0, 0.035, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3047, 258, 'Gucci/古驰清新邂逅女士发香淡香水', '../../img/goodsImg/3047.jpg', 395, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3048, 258, 'Bvlgari宝格丽碧蓝男士淡香水水能量', '../../img/goodsImg/3048.jpg', 298, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3049, 258, 'jo malone祖马龙香水蓝风铃祖玛龙海盐', '../../img/goodsImg/3049.jpg', 439, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3057, 259, 'Missha谜尚迷尚大红BB霜裸妆遮瑕保湿隔离防晒', '../../img/goodsImg/3057.jpg', 128, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3058, 259, 'heynature/韩妮采植物遮瑕BB霜 轻透裸妆 ', '../../img/goodsImg/3058.jpg', 99, '件', 0, 0.04, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3059, 259, '韩后BB霜裸妆遮瑕强持久提亮肤色保湿隔离霜', '../../img/goodsImg/3059.jpg', 69, '件', 0, 0.04, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3060, 259, '高姿多效修容霜SPF30+BB霜女 裸妆补水保湿', '../../img/goodsImg/3060.jpg', 99, '件', 0, 0.045, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3061, 259, '美宝莲巨水巨润BB霜 持久滋润补水保湿裸妆', '../../img/goodsImg/3061.jpg', 109, '件', 0, 0.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3069, 260, 'Dior迪奥烈焰蓝金唇膏3.5gCD烈艳蓝星口红', '../../img/goodsImg/3069.jpg', 275, '件', 0, 0.005, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3070, 260, '兰蔻菁纯柔润丝缎唇膏口红持久不脱色', '../../img/goodsImg/3070.jpg', 270, '件', 0, 0.005, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3071, 260, '纪梵希小羊皮魅惑唇膏口红持久不脱色', '../../img/goodsImg/3071.jpg', 365, '件', 0, 0.005, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3072, 260, 'YSL圣罗兰迷魅纯漾唇膏金圆管口红shine ', '../../img/goodsImg/3072.jpg', 286, '件', 0, 0.005, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3073, 260, '肌肤之钥CPB口红 瑰丽唇膏4g 持久不脱色 ', '../../img/goodsImg/3073.jpg', 660, '件', 0, 0.004, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3081, 261, '法国YSL/圣罗兰羽毛蕾丝气垫BB粉底14g SPF23', '../../img/goodsImg/3081.jpg', 489, '件', 0, 0.014, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3082, 261, 'COVERMARK修护粉底霜30g防晒粉底液', '../../img/goodsImg/3082.jpg', 455, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3083, 261, '雪花秀采淡致美气垫粉底液 气垫bb霜', '../../img/goodsImg/3083.jpg', 400, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3084, 261, '肌肤之钥CPB粉底 光缎粉霜 遮瑕持久不脱妆', '../../img/goodsImg/3084.jpg', 900, '件', 0, 0.014, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3085, 261, '正品Armani 阿玛尼造型紧颜粉底液30ml', '../../img/goodsImg/3085.jpg', 445, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3093, 262, 'BOBBI BROWN/芭比波朗羽柔蜜粉饼', '../../img/goodsImg/3093.jpg', 380, '件', 0, 0.011, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3094, 262, '日本 Canmake井田棉花糖粉饼 控油定妆蜜粉饼', '../../img/goodsImg/3094.jpg', 96, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3095, 262, 'innisfree/悦诗风吟控油矿物质粉饼散粉 ', '../../img/goodsImg/3095.jpg', 80, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3096, 262, '美宝莲梦幻丝绒蜜盒粉饼遮瑕控油定妆修容两用', '../../img/goodsImg/3096.jpg', 156, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3097, 262, '玛丽黛佳元气青柠蜜粉饼遮瑕持久控油定妆修容', '../../img/goodsImg/3097.jpg', 68, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3105, 263, 'Miss Candy健康指彩指甲油套装无毒可剥撕拉', '../../img/goodsImg/3105.jpg', 76, '件', 0, 0.014, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3106, 263, 'zero nana200色可卸高亮泽蔻丹芭比红色指甲油', '../../img/goodsImg/3106.jpg', 38, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3107, 263, 'innisfree/悦诗风吟 生机指甲油芭蕾舞系列 ', '../../img/goodsImg/3107.jpg', 23, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3108, 263, 'CandyMoyo指甲油套装美甲持久防水快干', '../../img/goodsImg/3108.jpg', 49, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3109, 263, '美宝莲水性指甲油色秀糖果甲油专业彩妆', '../../img/goodsImg/3109.jpg', 26, '件', 0, 0.014, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3117, 264, '玛丽黛佳自然生动眉笔眉粉双头防水防汗持久', '../../img/goodsImg/3117.jpg', 48, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3118, 264, '卡姿兰眉笔防水防汗不脱色持久', '../../img/goodsImg/3118.jpg', 53, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3119, 264, 'innisfree/悦诗风吟生机三角形自动扁头眉笔', '../../img/goodsImg/3119.jpg', 45, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3120, 264, 'ETUDE HOUSE 伊蒂之屋双头睛彩自然眉笔', '../../img/goodsImg/3120.jpg', 29, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3121, 264, 'KATE/凯朵 双效立体眉笔眉粉 自然长久', '../../img/goodsImg/3121.jpg', 119, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3129, 265, '玛丽黛佳黑流苏密语睫毛膏防水纤长卷翘', '../../img/goodsImg/3129.jpg', 89, '件', 0, 0.011, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3130, 265, '美宝莲飞箭睫毛膏防水纤长卷翘浓密', '../../img/goodsImg/3130.jpg', 105, '件', 0, 0.012, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3131, 265, '卡姿兰睫毛膏正品防水纤长卷翘加密加长', '../../img/goodsImg/3131.jpg', 49, '件', 0, 0.011, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3132, 265, 'innisfree/悦诗风吟纤巧精细防水睫毛膏3.5g ', '../../img/goodsImg/3132.jpg', 90, '件', 0, 0.004, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3133, 265, '蜜丝佛陀睫毛膏 臻密不凝结纤长卷翘', '../../img/goodsImg/3133.jpg', 139, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3141, 266, 'VS沙宣洗发水 修护水养洗发露护发素洗护套装', '../../img/goodsImg/3141.jpg', 109, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3142, 266, '清扬男士洗发水 去屑洗发露活力运动薄荷型', '../../img/goodsImg/3142.jpg', 54, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3143, 266, '卓蓝雅无硅油防脱发生姜洗发水男女士正品', '../../img/goodsImg/3143.jpg', 63, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3144, 266, '滋源无硅油无患子洗发水露（油性）控油清爽', '../../img/goodsImg/3144.jpg', 70, '件', 0, 0.535, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3145, 266, '日本进口资生堂惠润植物无硅油洗发水护发素套装', '../../img/goodsImg/3145.jpg', 80, '件', 0, 0.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3153, 267, '蜂花护发素1L含小麦蛋白改善毛躁滋润补水润发乳', '../../img/goodsImg/3153.jpg', 20, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3154, 267, '拉芳香水护发素正品 保湿柔顺补水烫染受损', '../../img/goodsImg/3154.jpg', 21, '件', 0, 0.55, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3155, 267, '琴叶护发素正品还原酸水疗头发spa修复柔顺', '../../img/goodsImg/3155.jpg', 35, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3156, 267, '欧莱雅奇焕润发精油护发素正品修复干枯补水', '../../img/goodsImg/3156.jpg', 59, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3157, 267, '飘柔护发素润发精华素乳男女通用750ml', '../../img/goodsImg/3157.jpg', 30, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3165, 268, '法国淳萃牛油果润滋养损伤修复干枯毛燥发膜', '../../img/goodsImg/3165.jpg', 35, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3166, 268, '施华蔻多效修护19发膜护发素改善干枯分叉', '../../img/goodsImg/3166.jpg', 99, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3167, 268, '笛梵发膜正品DIFO玻尿酸补水修护倒膜烫染修复', '../../img/goodsImg/3167.jpg', 69, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3168, 268, '优妮发膜免蒸倒膜焗油膏营养修复干枯烫染受损', '../../img/goodsImg/3168.jpg', 30, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3169, 268, '正品汉高头发干枯毛躁修复发膜营养护理倒膜套装', '../../img/goodsImg/3169.jpg', 90, '件', 0, 1.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3177, 269, '一叶子补水保湿面膜清爽控油收缩毛孔深层锁水', '../../img/goodsImg/3177.jpg', 129, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3178, 269, '薇诺娜 舒敏保湿丝滑面膜 敏感肌肤补水面膜', '../../img/goodsImg/3178.jpg', 168, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3179, 269, '御泥坊盈透美肌黑面膜套装女士学生清洁收缩毛孔', '../../img/goodsImg/3179.jpg', 119, '件', 0, 0.4, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3180, 269, 'sk-ii sk2前男友面膜 skii护肤精华贴急救套装', '../../img/goodsImg/3180.jpg', 740, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3181, 269, '百雀羚三生花面膜贴套装补水保湿滋润紧致嫩肤', '../../img/goodsImg/3181.jpg', 99, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3189, 270, 'L\'OREAL 欧莱雅美发奇焕润发卷发护发精油', '../../img/goodsImg/3189.jpg', 73, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3190, 270, 'Moroccanoil 摩洛哥油护发精油滋养去毛躁', '../../img/goodsImg/3190.jpg', 298, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3191, 270, '芭图雅摩洛哥护发精油头发护理免洗护发素', '../../img/goodsImg/3191.jpg', 128, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3192, 270, 'L\'OREAL 欧莱雅玫瑰护发精油免洗100ml ', '../../img/goodsImg/3192.jpg', 75, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3193, 270, '美多丝 精华液护发精油营养水免洗护发', '../../img/goodsImg/3193.jpg', 59, '件', 0, 0.12, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3201, 271, '法式魔香持久弹力素护卷发保湿定型啫喱水', '../../img/goodsImg/3201.jpg', 21, '件', 0, 0.28, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3202, 271, '芭图雅弹力素卷发保湿护卷定型造型啫喱水膏', '../../img/goodsImg/3202.jpg', 69, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3203, 271, '丝蕴盈润魅卷弹力素150ml轻柔定型 空气感润卷', '../../img/goodsImg/3203.jpg', 28, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3204, 271, '美国TIGI宝贝蛋弹力女素卷发专用修复保湿定型', '../../img/goodsImg/3204.jpg', 69, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3205, 271, '沙宣弹力素 盈卷修润弹力素100ml 修护烫染发质', '../../img/goodsImg/3205.jpg', 45, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3213, 272, '施华蔻怡然染发剂纯黑色染发霜膏天然遮白不伤发', '../../img/goodsImg/3213.jpg', 69, '件', 0, 0.17, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3214, 272, '欧莱雅卓韵霜赋活养护染发霜 持久固色轻松遮白发', '../../img/goodsImg/3214.jpg', 59, '件', 0, 0.172, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3215, 272, '美源发采植物白发染黑染发膏自然黑色染发霜', '../../img/goodsImg/3215.jpg', 68, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3216, 272, '章华生态染发剂焗油染发霜140ml植物精华', '../../img/goodsImg/3216.jpg', 109, '件', 0, 0.14, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3217, 272, '光明无氨染发膏染发剂染发霜无刺激', '../../img/goodsImg/3217.jpg', 69, '件', 0, 0.094, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3225, 273, 'DayShow冷喷雾蒸脸面部保加湿纳米补水仪器', '../../img/goodsImg/3225.jpg', 399, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3226, 273, '隆典纳米喷雾补水仪器面部美容仪加湿冷喷雾机', '../../img/goodsImg/3226.jpg', 49, '件', 0, 0.2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3227, 273, 'MKS/美克斯纳米喷雾补水仪冷喷机面部美容仪', '../../img/goodsImg/3227.jpg', 99, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3228, 273, '纳米喷雾补水仪便携保湿美容脸部面部加湿蒸脸器', '../../img/goodsImg/3228.jpg', 40, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3229, 273, '启邦蒸脸器面部美容仪冷喷雾机便携保湿神器', '../../img/goodsImg/3229.jpg', 39, '件', 0, 0.3, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3237, 274, '李施德林进口漱口水 除口臭去牙渍口气清新', '../../img/goodsImg/3237.jpg', 69, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3238, 274, '三金西瓜霜漱口水清新口气去除口臭去异味', '../../img/goodsImg/3238.jpg', 29, '件', 0, 0.47, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3239, 274, 'LION/狮王日本原装进口 洁净防护漱口水组合装', '../../img/goodsImg/3239.jpg', 89, '件', 0, 0.9, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3240, 274, 'ora2皓乐齿漱口水除口臭去牙渍口气清新日本进口', '../../img/goodsImg/3240.jpg', 65, '件', 0, 0.46, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3241, 274, 'saky舒客竹炭薄荷漱口水除口臭杀菌', '../../img/goodsImg/3241.jpg', 60, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3249, 275, '舒客口喷改善口气清新口腔去除口臭喷雾剂', '../../img/goodsImg/3249.jpg', 30, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3250, 275, '隆力奇口气清新剂女士香男士口腔喷雾去除口臭', '../../img/goodsImg/3250.jpg', 20, '件', 0, 0.025, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3251, 275, '日本进口狮王ETIQUETTE口腔清新剂(木糖醇)', '../../img/goodsImg/3251.jpg', 25, '件', 0, 0.018, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3252, 275, '隆力奇口气清新剂喷雾男口腔去除口臭口气', '../../img/goodsImg/3252.jpg', 39, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3253, 275, '缇妍堂去异味喷剂去除口臭口气清新剂30ml', '../../img/goodsImg/3253.jpg', 75, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3261, 276, '联合利华 多芬樱花+深层1L*2日系沐浴露', '../../img/goodsImg/3261.jpg', 79, '件', 0, 2, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3262, 276, '日本进口沐浴露沐浴乳资生堂可悠然欣怡幽香', '../../img/goodsImg/3262.jpg', 56, '件', 0, 0.55, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3263, 276, '舒肤佳沐浴露 男女家庭滋润持久留香保湿纯白', '../../img/goodsImg/3263.jpg', 50, '件', 0, 1.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3264, 276, 'COCOVEL沐浴露 香水持久留香72小时', '../../img/goodsImg/3264.jpg', 35, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3265, 276, '国产安利沐浴露雅蜜正沐浴露乳品男女持久留香', '../../img/goodsImg/3265.jpg', 90, '件', 0, 0.75, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3273, 277, '力士娇肤香皂 恒久嫩肤 蚕丝精华 法国玫瑰', '../../img/goodsImg/3273.jpg', 11, '件', 0, 0.371, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3274, 277, '上海香皂 上海硫磺皂130g*4块 洗脸皂驱螨', '../../img/goodsImg/3274.jpg', 22, '件', 0, 0.52, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3275, 277, '草木之心手工古皂去黑头祛痘精油香皂洁面洗脸', '../../img/goodsImg/3275.jpg', 69, '件', 0, 0.12, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3276, 277, '蜂花香皂 檀香皂 玫瑰皂 茉莉皂125g*6块组合装', '../../img/goodsImg/3276.jpg', 28, '件', 0, 0.125, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3277, 277, '安利香皂雅蜜香皂润肤三块装洗脸洁面洗澡', '../../img/goodsImg/3277.jpg', 64, '件', 0, 0.25, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3285, 278, '蓝月亮洗手液瓶芦荟抑菌500gx6 洗手液', '../../img/goodsImg/3285.jpg', 50, '件', 0, 3.61, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3286, 278, '威露士滋润抑菌洗手液青柠盈润525mlx2', '../../img/goodsImg/3286.jpg', 16, '件', 0, 1.05, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3287, 278, '滴露洗手液 滋润清香型儿童家用抑菌洗手液', '../../img/goodsImg/3287.jpg', 26, '件', 0, 1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3288, 278, '洁芙柔免水洗洗手液大瓶装500ml3瓶家用杀菌', '../../img/goodsImg/3288.jpg', 78, '件', 0, 1.6, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3289, 278, '隆力奇泡沫洗手液500ml 儿童洗手抑菌消毒液', '../../img/goodsImg/3289.jpg', 10, '件', 0, 0.5, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3297, 279, '吉列手动剃须刀锋速3男士刮胡刀套装', '../../img/goodsImg/3297.jpg', 150, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3298, 279, '大力人全金属剃须刀手动刮胡刀手动男士', '../../img/goodsImg/3298.jpg', 149, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3299, 279, '吉列锋速5刀片手动剃须锋隐刀片吉利剃须刀片手动', '../../img/goodsImg/3299.jpg', 88, '件', 0, 0.02, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3300, 279, '褚铁匠经典版 老式剃刀刮脸刀剃须刀 手动 镜面刀刃', '../../img/goodsImg/3300.jpg', 118, '件', 0, 0.1, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3301, 279, '英吉利手动剃须刀刮胡刀手动男士剃胡', '../../img/goodsImg/3301.jpg', 68, '件', 0, 0.15, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3309, 280, '强生ob卫生棉条混合量多普通型3盒德国进口', '../../img/goodsImg/3309.jpg', 60, '件', 0, 0.08, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3310, 280, 'Tmaxx内置卫生棉条卫生巾姨妈导管式日用夜用', '../../img/goodsImg/3310.jpg', 30, '件', 0, 0.03, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3311, 280, 'mytex进口卫生棉条20支导管式内置游泳卫生巾', '../../img/goodsImg/3311.jpg', 30, '件', 0, 0.055, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3312, 280, 'BeGirl德国进口导管式卫生棉条内置卫生巾', '../../img/goodsImg/3312.jpg', 28, '件', 0, 0.015, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (3313, 280, '德国强生ob棉条量多型内置式卫生巾导管式卫生棉条', '../../img/goodsImg/3313.jpg', 20, '件', 0, 0.01, '2020-02-06 00:00:00', 100, 0);
INSERT INTO `goods` VALUES (10010, 101, 'iPhone11 Pro Max苹果11 Pro Max', '../../img/goodsImg/0.jpg', 8999, '台', 0, 1, '2020-02-06 00:00:00', 100, 70);
INSERT INTO `goods` VALUES (10011, 221, '测试商品名', '../../../img/goodsImg/1595834703171.jpg', 0, '人', 0, 0, '2020-07-27 15:25:03', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for goodsattr
-- ----------------------------
DROP TABLE IF EXISTS `goodsattr`;
CREATE TABLE `goodsattr` (
  `goodsattr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品参数编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品参数名',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品参数值',
  PRIMARY KEY (`goodsattr_id`),
  KEY `FK_Relationship_3` (`goods_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品属性';

-- ----------------------------
-- Records of goodsattr
-- ----------------------------
BEGIN;
INSERT INTO `goodsattr` VALUES (1, 1, '商品产地', '大陆');
INSERT INTO `goodsattr` VALUES (2, 1, '风格', '韩版');
INSERT INTO `goodsattr` VALUES (3, 1, '闭合方式', '系带');
INSERT INTO `goodsattr` VALUES (4, 1, '鞋底材质', '橡胶');
INSERT INTO `goodsattr` VALUES (5, 1, '鞋跟', '平底');
INSERT INTO `goodsattr` VALUES (6, 1, '里料材质', '棉布');
INSERT INTO `goodsattr` VALUES (7, 1, '场合', '日常休闲');
INSERT INTO `goodsattr` VALUES (8, 1, '颜色', '黑色');
INSERT INTO `goodsattr` VALUES (9, 10010, '品牌名称', 'Apple/苹果');
INSERT INTO `goodsattr` VALUES (10, 10010, '证书编号', '2019011606222155');
INSERT INTO `goodsattr` VALUES (11, 10010, '产品名称', 'Apple/苹果 iPhone 11 Pro Max');
INSERT INTO `goodsattr` VALUES (12, 10010, 'Apple型号', ' iPhone 11 Pro');
INSERT INTO `goodsattr` VALUES (13, 10010, '机身颜色', '暗夜绿色 银色 金色 深空灰色');
INSERT INTO `goodsattr` VALUES (14, 10010, '存储容量', '64GB 256GB 512GB');
INSERT INTO `goodsattr` VALUES (15, 10010, 'CPU型号', 'A13');
COMMIT;

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `loginlog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '登录日志编号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ip地址',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`loginlog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='登录日志';

-- ----------------------------
-- Records of loginlog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '顾客编号',
  `recaddr_id` bigint(20) DEFAULT NULL COMMENT '地址编号',
  `payway_id` bigint(20) DEFAULT NULL COMMENT '支付方式编号',
  `order_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `status` int(11) NOT NULL COMMENT '订单状态',
  `amount` double DEFAULT NULL COMMENT '订单商品费用',
  `logistics_fee` double DEFAULT NULL COMMENT '订单物流费用',
  `logistics_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单物流数量',
  `service_fee` double DEFAULT NULL COMMENT '订单服务费用',
  `pay_time` datetime DEFAULT NULL COMMENT '订单支付时间',
  PRIMARY KEY (`order_id`),
  KEY `FK_Relationship_14` (`recaddr_id`),
  KEY `FK_Relationship_16` (`cus_id`),
  KEY `FK_Relationship_19` (`payway_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`recaddr_id`) REFERENCES `recaddr` (`recaddr_id`),
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`payway_id`) REFERENCES `payway` (`payway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单';

-- ----------------------------
-- Records of orderform
-- ----------------------------
BEGIN;
INSERT INTO `orderform` VALUES (6, 3, 7, 1, 'LX1830795450165', '2020-07-23 15:09:32', 1, 277, 20, NULL, 2, '2020-07-23 15:09:57');
INSERT INTO `orderform` VALUES (8, 3, 7, 1, 'LX1151563754539', '2020-07-23 15:21:06', 1, 406, 20, NULL, 2, '2020-07-23 15:21:09');
INSERT INTO `orderform` VALUES (9, 3, 7, 1, 'LX1546620912070', '2020-07-23 23:07:40', 0, 118, 10, NULL, 1, '2020-07-23 00:00:00');
INSERT INTO `orderform` VALUES (10, 2, 1, 1, 'LX98365299955', '2020-07-23 10:15:59', 5, 419, 10, NULL, 1, '2020-07-23 10:16:04');
INSERT INTO `orderform` VALUES (11, 2, 7, 1, 'LX224731749697', '2020-07-26 17:22:55', 5, 2699, 10, NULL, 1, '2020-07-26 17:22:59');
INSERT INTO `orderform` VALUES (12, 2, 1, 1, 'LX904762287718', '2020-07-26 17:39:16', 5, 2699, 10, NULL, 1, '2020-07-26 17:39:20');
INSERT INTO `orderform` VALUES (13, 2, 7, 3, 'LX2132507074613', '2020-07-26 19:13:21', 5, 8999, 10, NULL, 1, '2020-07-26 19:13:26');
COMMIT;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitem_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `order_id` bigint(20) NOT NULL COMMENT '订单编号',
  `num` double NOT NULL COMMENT '商品数量',
  `commented` int(11) DEFAULT '0' COMMENT '评论状态',
  PRIMARY KEY (`orderitem_id`),
  KEY `FK_Relationship_11` (`order_id`),
  KEY `FK_Relationship_12` (`goods_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`order_id`) REFERENCES `orderform` (`order_id`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单详情';

-- ----------------------------
-- Records of orderitem
-- ----------------------------
BEGIN;
INSERT INTO `orderitem` VALUES (11, 1, 6, 1, 0);
INSERT INTO `orderitem` VALUES (12, 3, 6, 1, 0);
INSERT INTO `orderitem` VALUES (15, 1, 8, 1, 0);
INSERT INTO `orderitem` VALUES (16, 13, 8, 1, 0);
INSERT INTO `orderitem` VALUES (17, 1, 9, 1, 0);
INSERT INTO `orderitem` VALUES (18, 7, 10, 1, 1);
INSERT INTO `orderitem` VALUES (19, 711, 11, 1, 1);
INSERT INTO `orderitem` VALUES (20, 711, 12, 1, 1);
INSERT INTO `orderitem` VALUES (21, 10010, 13, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for payway
-- ----------------------------
DROP TABLE IF EXISTS `payway`;
CREATE TABLE `payway` (
  `payway_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '付款方式编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款方式名',
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款方式图',
  PRIMARY KEY (`payway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='付款方式';

-- ----------------------------
-- Records of payway
-- ----------------------------
BEGIN;
INSERT INTO `payway` VALUES (1, '支付宝', '../../../img/payway/0.png');
INSERT INTO `payway` VALUES (2, '银联', '../../../img/payway/1.png');
INSERT INTO `payway` VALUES (3, '微信', '../../../img/payway/2.png');
COMMIT;

-- ----------------------------
-- Table structure for recaddr
-- ----------------------------
DROP TABLE IF EXISTS `recaddr`;
CREATE TABLE `recaddr` (
  `recaddr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收货地址编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '顾客编号',
  `rec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货地址名',
  `province` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货地址省名',
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货地址城市名',
  `district` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货地址地区名',
  `addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货地址详细地址',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人电话',
  `postcode` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址邮编',
  PRIMARY KEY (`recaddr_id`),
  KEY `FK_Relationship_15` (`cus_id`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收货地址';

-- ----------------------------
-- Records of recaddr
-- ----------------------------
BEGIN;
INSERT INTO `recaddr` VALUES (1, 2, '苏雯', '重庆市', '重庆市', '渝北区', '人和街道', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (7, 2, '苏雯', '重庆市', '重庆市', '南岸区', '学府大道66号重庆交通大学', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (8, 3, '苏雯', '重庆市', '重庆市', '渝北区', '人和街道', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (9, 3, '苏雯', '重庆市', '重庆市', '南岸区', '学府大道66号重庆交通大学', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (10, 5, '苏雯', '重庆市', '重庆市', '渝北区', '人和街道', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (11, 5, '苏雯', '重庆市', '重庆市', '南岸区', '学府大道66号重庆交通大学', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (12, 6, '苏雯', '重庆市', '重庆市', '渝北区', '人和街道', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (13, 6, '苏雯', '重庆市', '重庆市', '南岸区', '学府大道66号重庆交通大学', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (14, 7, '苏雯', '重庆市', '重庆市', '渝北区', '人和街道', '15112345678', '401120');
INSERT INTO `recaddr` VALUES (15, 7, '苏雯', '重庆市', '重庆市', '南岸区', '学府大道66号重庆交通大学', '15112345678', '401120');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
