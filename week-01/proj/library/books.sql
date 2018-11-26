/*
 Navicat Premium Data Transfer

 Source Server         : MAMP_MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:8889
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/11/2018 15:49:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(30) NOT NULL COMMENT '书名',
  `isbn` varchar(20) NOT NULL COMMENT 'ISBN',
  `author` varchar(15) DEFAULT NULL COMMENT '作者',
  `price` varchar(20) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of books
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES (1, '西游记', '9787536829077', '吴承恩', '58.00');
INSERT INTO `books` VALUES (2, '挪威的森林', '9787532725694', '[日]村上春树', '138.00');
INSERT INTO `books` VALUES (4, '世界尽头与冷酷仙境', '9787532730001', '[日]村上春树', '40.00');
INSERT INTO `books` VALUES (5, '海边的卡夫卡', '9787532734191', '[日]村上春树', '173.00');
INSERT INTO `books` VALUES (17, '远方的鼓声', '9787532754533', '[日]村上春树', '85.00');
INSERT INTO `books` VALUES (18, '再袭面包店', '9787532726325', '[日]村上春树', '141.00');
INSERT INTO `books` VALUES (19, '一九七三年的弹子球', '9787532726288', '[日]村上春树', '139.00');
INSERT INTO `books` VALUES (20, '爵士乐群英谱', '9787532729371', '[日] 村上春树 文', '154.00');
INSERT INTO `books` VALUES (21, '终究悲哀的外国语', '9787532732319', '[日]村上春树', '73.00');
INSERT INTO `books` VALUES (23, '程序员的自我修养', '9787121085116', '俞甲子', '100.00');
INSERT INTO `books` VALUES (24, '我编程，我快乐', '9787115233523', '[美] Chad Fowler', '31.00');
INSERT INTO `books` VALUES (26, '我和LabVIEW', '9787811248890', '阮奇桢', '142.00');
INSERT INTO `books` VALUES (27, 'Web全栈工程师的自我修养', '9787115399021', '余果', '54.00');
INSERT INTO `books` VALUES (28, '我的前半生', '9787802283930', '[加拿大]亦舒', '97.00');
INSERT INTO `books` VALUES (29, '当我们谈论爱情时我们在谈论什么', '9787544710442', '[美]雷蒙德·卡佛', '178.00');
INSERT INTO `books` VALUES (30, '1988：我想和这个世界谈谈', '9787512500983', '韩寒', '90.00');
INSERT INTO `books` VALUES (31, '我的名字叫红', '9787208061750', '[土耳其]奥尔罕·帕慕克', '139.00');
INSERT INTO `books` VALUES (32, '我们', '9787214040992', '[俄]尤金·扎米亚金', '160.00');
INSERT INTO `books` VALUES (33, '我们在此相遇', '9787563383726', '[英]约翰·伯格', '34.00');
INSERT INTO `books` VALUES (35, '致我们终将逝去的青春', '9787505416772', '辛夷坞', '176.00');
INSERT INTO `books` VALUES (36, '我的前半生', '9787806154366', '[加拿大]亦舒', '99.00');
INSERT INTO `books` VALUES (37, '我是猫', '9787805673103', '[日]夏目漱石', '30.00');
INSERT INTO `books` VALUES (38, '曾有一个人，爱我如生命', '9787802203907', '舒仪', '182.00');
INSERT INTO `books` VALUES (39, '我弥留之际', '9787532733026', '[美]福克纳', '84.00');
INSERT INTO `books` VALUES (40, '我的团长我的团（上部）', '9787802254817', '兰晓龙', '88.00');
INSERT INTO `books` VALUES (41, '鸟，看见我了', '9787503946417', '阿乙', '24.00');
INSERT INTO `books` VALUES (42, '那些年，我们一起追的女孩', '9787806737842', '九把刀', '167.00');
INSERT INTO `books` VALUES (43, '啊哈C！思考快你一步', '9787121213366', '啊哈磊', '129.00');
INSERT INTO `books` VALUES (44, '你必须知道的.NET', '9787121058912', '王涛', '148.00');
INSERT INTO `books` VALUES (45, '你必须知道的495个C语言问题', '9787115194329', 'Steve Summit', '164.00');
INSERT INTO `books` VALUES (46, '你好，旧时光（上 下）', '9787510407109', '八月长安', '196.00');
INSERT INTO `books` VALUES (47, '你往何处去', '9787544244268', '[波兰]显克维奇', '45.00');
INSERT INTO `books` VALUES (48, '你在天堂里遇见的五个人', '9787532742714', '[美]米奇·阿尔博姆', '88.00');
INSERT INTO `books` VALUES (49, '原来你还在这里', '9787505417731', '辛夷坞', '83.00');
INSERT INTO `books` VALUES (50, '我是你爸爸', '9787222039490', '王朔', '125.00');
INSERT INTO `books` VALUES (56, '来不及说我爱你', '9787802281127', '匪我思存', '27.00');
INSERT INTO `books` VALUES (57, '时间足够你爱', '9787536464100', '[美]罗伯特·海因莱因', '196.00');
INSERT INTO `books` VALUES (58, '世界因你不同', '9787508616780', '李开复', '115.00');
INSERT INTO `books` VALUES (59, '你凭什么做好互联网', '9787505738751', '曹政', '57.00');
INSERT INTO `books` VALUES (60, '疯传：让你的产品、思想、行为像病毒一样入侵（全新修订版）', '9787121275982', '[美]乔纳·伯杰', '169.00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
