/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.6
 Source Server Type    : MySQL
 Source Server Version : 50506
 Source Host           : localhost:3306
 Source Schema         : ofuns

 Target Server Type    : MySQL
 Target Server Version : 50506
 File Encoding         : 65001

 Date: 08/03/2024 18:45:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_key`(`userid`) USING BTREE,
  CONSTRAINT `user_key` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '张三', '13112345678', '吉安街昆明市人民政府', NULL, '云南省', '昆明市', '呈贡区', NULL, NULL);
INSERT INTO `address` VALUES (2, '张三', '13112345678', '吉安街昆明市人民政府', 11, '云南省', '昆明市', '呈贡区', NULL, NULL);
INSERT INTO `address` VALUES (3, '李四', '13112345679', '吉安街昆明市人民政府', 11, '云南省', '昆明市', '五华区', NULL, NULL);
INSERT INTO `address` VALUES (4, '王五', '13112345679', '吉安街昆明市人民政府', 11, '云南省', '玉溪市', '红塔区', NULL, NULL);
INSERT INTO `address` VALUES (5, 'xxx', '13112345678', '我也不晓得是啥', 12, '安徽省', '合肥市', '蜀山区', NULL, NULL);
INSERT INTO `address` VALUES (6, '张三', '13112345678', '北京路昆明市盘龙区人民政府', 13, '云南省', '昆明市', '盘龙区', NULL, NULL);
INSERT INTO `address` VALUES (7, '张三', '13611111111', '重庆', 14, '重庆市', '重庆市', '万州区', NULL, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户',
  `productid` int(11) NULL DEFAULT NULL COMMENT '商品',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `ischecked` int(1) NULL DEFAULT 1 COMMENT '是否选中',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userkey`(`userid`) USING BTREE,
  INDEX `u_c_key`(`productid`) USING BTREE,
  CONSTRAINT `userkey` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `u_c_key` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (2, '会员管理', 'user', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (3, '商品管理', 'product', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (4, '订单管理', 'order', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (6, '分类管理', 'types', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (7, '售后管理', 'afterSale', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (8, '地址管理', 'address', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (9, '菜单管理', 'menus', NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (11, '角色管理', 'roles', '', '', '', '');
INSERT INTO `menus` VALUES (12, '管理员管理', 'admin', '', '', '', '');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '金额',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `ceatetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `mark` int(11) NULL DEFAULT NULL COMMENT '收货地址',
  `mark2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_o_key`(`userid`) USING BTREE,
  INDEX `u_a_key`(`mark`) USING BTREE,
  CONSTRAINT `u_a_key` FOREIGN KEY (`mark`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `u_o_key` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (20, 49.80, 14, '待付款', '2024-03-08 11:45:27', 7, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (21, 239.00, 14, '待发货', '2024-03-08 11:46:19', 7, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (22, 49.80, 14, '待退款', '2024-03-08 11:48:00', 7, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (23, 44.80, 14, '待发货', '2024-03-08 18:28:26', 7, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (24, 22.40, 14, '已退货', '2024-03-08 18:40:55', 7, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderid` int(11) NULL DEFAULT NULL COMMENT '订单',
  `productid` int(11) NULL DEFAULT NULL COMMENT '商品',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oo_p_key`(`productid`) USING BTREE,
  INDEX `oo_o_key`(`orderid`) USING BTREE,
  CONSTRAINT `oo_o_key` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `oo_p_key` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (20, 20, 23, 1, 48.80, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (21, 21, 22, 1, 239.00, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (22, 22, 23, 1, 48.80, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (23, 23, 24, 2, 22.40, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (24, 24, 24, 1, 22.40, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `stock` int(10) NULL DEFAULT NULL COMMENT '库存',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark2` int(10) NULL DEFAULT NULL,
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_t_fk`(`mark2`) USING BTREE,
  CONSTRAINT `p_t_fk` FOREIGN KEY (`mark2`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (19, '猫抓板', 29.90, 100, '宠母猫后宠物玩具猫抓板窝盆猫咪自嗨神器解闷柱爬架磨爪椭圆l形立式 猫屋60长30宽30高cm+猫薄荷', 'http://localhost/ofuns/getImage/img_2024_03_08112840947.jpg', 3, NULL, NULL, NULL);
INSERT INTO `product` VALUES (20, '猫咪按摩器', 39.90, 100, '昙蓓漫猫咪按摩头部神器四爪按摩器宠物抓头神器挠头撸猫狗狗电动挠痒仪 猫咪按摩器（白色） 【升级可拆洗硅胶按摩头】', 'http://localhost/ofuns/getImage/img_2024_03_08113426927.jpg', 4, NULL, NULL, NULL);
INSERT INTO `product` VALUES (22, '狗干粮', 239.00, 98, '网易严选狗粮 全价三拼犬粮 无谷三文鱼牛肉鸡肉鸭肉 柯基柴犬泰迪贵宾犬 【3.0升级款】10kg*1袋', 'http://localhost/ofuns/getImage/img_2024_03_08113650651.jpg', 6, NULL, NULL, NULL);
INSERT INTO `product` VALUES (23, '狗狗零食大礼包800g', 49.80, 95, 'HELLOJOY狗狗零食大礼包800g 宠物零食泰迪幼犬磨牙棒牛肉条鸡肉干鸭肉干', 'http://localhost/ofuns/getImage/img_2024_03_08113836459.png', 8, NULL, NULL, NULL);
INSERT INTO `product` VALUES (24, '猫咪牵引绳', 22.40, 97, 'hoopet猫咪牵引绳防挣脱外出专用遛猫绳子溜猫链子宠物胸背带可调节背心 雾霾蓝-工字防挣脱 M:胸围:28-42cm', 'http://localhost/ofuns/getImage/img_2024_03_08125822862.jpg', 10, NULL, NULL, NULL);
INSERT INTO `product` VALUES (25, 'ceshi', 50.00, 200, 'hoopet猫咪牵引绳防挣脱外出专用遛猫绳子溜猫链子宠物胸背带可调节背心 雾霾蓝-工字防挣脱 M:胸围:28-42cm', 'http://localhost/ofuns/getImage/img_2024_03_08184353819.png', 10, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `role` VALUES (2, '员工', '', '', '');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `roleid` int(11) NULL DEFAULT NULL COMMENT '角色',
  `menuid` int(11) NULL DEFAULT NULL COMMENT '菜单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `r_r_key`(`roleid`) USING BTREE,
  INDEX `r_m_key`(`menuid`) USING BTREE,
  CONSTRAINT `r_m_key` FOREIGN KEY (`menuid`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `r_r_key` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (52, 2, 3);
INSERT INTO `rolemenu` VALUES (53, 2, 4);
INSERT INTO `rolemenu` VALUES (54, 2, 6);
INSERT INTO `rolemenu` VALUES (55, 2, 7);
INSERT INTO `rolemenu` VALUES (56, 2, 8);
INSERT INTO `rolemenu` VALUES (57, 1, 2);
INSERT INTO `rolemenu` VALUES (58, 1, 9);
INSERT INTO `rolemenu` VALUES (59, 1, 11);
INSERT INTO `rolemenu` VALUES (60, 1, 12);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (3, '猫狗玩具');
INSERT INTO `types` VALUES (4, '洗护美容');
INSERT INTO `types` VALUES (6, '猫狗主粮');
INSERT INTO `types` VALUES (7, '营养保健');
INSERT INTO `types` VALUES (8, '零食');
INSERT INTO `types` VALUES (9, '猫狗日用');
INSERT INTO `types` VALUES (10, '猫狗出行');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `balance` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT 00000000.00 COMMENT '余额',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `mark2` int(11) NULL DEFAULT NULL COMMENT '角色',
  `mark3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_r_key`(`mark2`) USING BTREE,
  CONSTRAINT `u_r_key` FOREIGN KEY (`mark2`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '1', '123456', 00015000.00, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZRsFc6Slzbd62J6M2Kf55jX2GZO1OsMM8ABMhXZv8sWialaEnfiab5yqWvmHsynYoBlhRRh11ia69ibvKzm62GgdWA/132', 1, '1', '1');
INSERT INTO `user` VALUES (3, 'aaa', NULL, '123456', 00000013.00, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES (11, '朝暮雪', NULL, '123456', 00005700.00, 'https://thirdwx.qlogo.cn/mmopen/vi_32/ZRsFc6Slzbd62J6M2Kf55jX2GZO1OsMM8ABMhXZv8sWialaEnfiab5yqWvmHsynYoBlhRRh11ia69ibvKzm62GgdWA/132', NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, 'Java程序员', NULL, '123456', 00004000.00, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Cgc99TfK7ia78klqIrIqFg3q5GKiaJQbvtAKib1A24uUJdze8pmiaUrkW75YAgPfmpWa3clHKQLpY3U4iaMUwmjfNmg/132', NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, '微信用户', NULL, '123456', 00002900.00, 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', NULL, NULL, NULL);
INSERT INTO `user` VALUES (14, '叮当', NULL, '123456', 00099666.40, 'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEITIjM8ta1c63k1ak1lG5QNlPW0fVS9tDvR6eVaRKEUBoM5AE1YcicdibId7l9nic9diaLicBA77nCgURP3gjA4gu80aEcibP9uVDnVuFEoBDSzggdg/132', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
