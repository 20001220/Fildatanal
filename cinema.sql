-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        8.0.27 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 cinema 的数据库结构
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;


-- 导出  表 cinema.champion 结构
CREATE TABLE IF NOT EXISTS `champion` (
  `movies_M_Year` int DEFAULT NULL COMMENT '影片年份',
  `movies_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '影片名称',
  `movies_BoxOffice` float DEFAULT NULL COMMENT '影片票房',
  `movies_BoxOfficePercent` float DEFAULT NULL COMMENT '影片票房占比',
  KEY `movies_M_Year` (`movies_M_Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.champion 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `champion` DISABLE KEYS */;
INSERT INTO `champion` (`movies_M_Year`, `movies_Name`, `movies_BoxOffice`, `movies_BoxOfficePercent`) VALUES
	(2012, '人再囧途之泰囧', 10.03, 6.06),
	(2013, '西游降魔篇', 12.47, 5.81),
	(2014, '变形金刚4：绝迹重生', 19.78, 6.72),
	(2015, '捉妖记', 24.4, 5.56),
	(2016, '美人鱼', 33.92, 7.45),
	(2017, '战狼2', 56.79, 10.17),
	(2018, '红海行动', 36.51, 6.01),
	(2019, '哪吒之魔童降世', 50.03, 7.8),
	(2020, '八佰', 31.02, 15.28),
	(2021, '长津湖', 57.73, 12.27),
	(2022, '长津湖之水门桥', 40.7, 13.57),
	(2023, '满江红', 42.44, 33.41);
/*!40000 ALTER TABLE `champion` ENABLE KEYS */;


-- 导出  表 cinema.forecast 结构
CREATE TABLE IF NOT EXISTS `forecast` (
  `name` varchar(50) DEFAULT NULL,
  `boxoffice` float DEFAULT NULL,
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.forecast 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `forecast` DISABLE KEYS */;
INSERT INTO `forecast` (`name`, `boxoffice`) VALUES
	('流浪地球2', 38.69),
	('满江红', 43.88),
	('无名', 9.33),
	('深海', 7.83),
	('黑豹2', 0.85),
	('熊出没·伴我“熊芯”', 13.64),
	('交换人生', 3.88),
	('阿凡达：水之道', 18.67),
	('风再起时', 0.72),
	('穿靴子的猫2', 1.17),
	('想见你', 4.23),
	('橡树餐厅', 0.7),
	('平凡英雄', 2.81),
	('星球人', 0.72),
	('中国乒乓之绝地反击', 0.75),
	('深爱', 0.6),
	('冰雪与少年', 0.73),
	('西游记之七十二变', 0.4),
	('爱在井冈', 0.12),
	('追光', 0.71),
	('相见在鸾峰桥', 0.7),
	('沼泽深处的女孩', 0.78),
	('变身攻略', 0.7),
	('极速保镖', 0.66),
	('阳光照耀塔什库尔干', 0.69),
	('放牛班的春天', 0.38),
	('大鱼海棠', 5.86),
	('黑豹', 6.69),
	('中国机长', 29.25),
	('龙珠超：超级人造人', 0.72),
	('不能流泪的悲伤', 0.56),
	('我的青春不再见', 0.73),
	('可不可以不要离开我', 0.38);
/*!40000 ALTER TABLE `forecast` ENABLE KEYS */;


-- 导出  表 cinema.hotfilmone 结构
CREATE TABLE IF NOT EXISTS `hotfilmone` (
  `rankdate` int DEFAULT NULL,
  `datedate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ranka` float DEFAULT NULL,
  `rankb` float DEFAULT NULL,
  `rankc` float DEFAULT NULL,
  `rankd` float DEFAULT NULL,
  `ranke` float DEFAULT NULL,
  KEY `rankdate` (`rankdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.hotfilmone 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `hotfilmone` DISABLE KEYS */;
INSERT INTO `hotfilmone` (`rankdate`, `datedate`, `ranka`, `rankb`, `rankc`, `rankd`, `ranke`) VALUES
	(0, '02-07', 3481.32, 3334.52, 1136.81, 2003.59, 746.78),
	(1, '02-08', 2919.29, 2813.6, 1015.79, 1113.51, 566.84),
	(2, '02-09', 2559.2, 2480.17, 956.25, 828.53, 472.92),
	(3, '02-10', 3545.19, 3109.17, 1204.71, 1026.18, 725.79),
	(4, '02-11', 7602.68, 5616.1, 2378.41, 1810.94, 2875.72),
	(5, '02-12', 5534.86, 4127.31, 1819.05, 1232.64, 2472.05),
	(6, '02-13', 1098.19, 949.47, 433.95, 235.05, 213.44);
/*!40000 ALTER TABLE `hotfilmone` ENABLE KEYS */;


-- 导出  表 cinema.hotfilmtwo 结构
CREATE TABLE IF NOT EXISTS `hotfilmtwo` (
  `rank` int DEFAULT NULL COMMENT '识别标记',
  `filmname` varchar(150) DEFAULT NULL,
  KEY `rank` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.hotfilmtwo 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `hotfilmtwo` DISABLE KEYS */;
INSERT INTO `hotfilmtwo` (`rank`, `filmname`) VALUES
	(0, '流浪地球2'),
	(1, '满江红'),
	(2, '深海'),
	(3, '黑豹2'),
	(4, '熊出没·伴我“熊芯”');
/*!40000 ALTER TABLE `hotfilmtwo` ENABLE KEYS */;


-- 导出  表 cinema.movehall 结构
CREATE TABLE IF NOT EXISTS `movehall` (
  `special_columns` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '影厅类型',
  `special_data` float DEFAULT NULL COMMENT '数据',
  KEY `special_columns` (`special_columns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.movehall 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `movehall` DISABLE KEYS */;
INSERT INTO `movehall` (`special_columns`, `special_data`) VALUES
	('IMax厅', 18.2),
	('杜比全景声厅', 40.11),
	('中国巨幕CGS厅', 4.74),
	('4DX厅', 5.02),
	('ScreenX厅', 1.26);
/*!40000 ALTER TABLE `movehall` ENABLE KEYS */;


-- 导出  表 cinema.newmovie 结构
CREATE TABLE IF NOT EXISTS `newmovie` (
  `movies_year_Year` int DEFAULT NULL COMMENT '年份',
  `movies_year_BoxOfficea` float DEFAULT NULL COMMENT '总票房',
  `movies_year_BoxOffice_Guochan` float DEFAULT NULL COMMENT '国产票房',
  `movies_year_BoxOffice_Jinkou` float DEFAULT NULL COMMENT '进口票房',
  `movies_year_Num` int DEFAULT NULL COMMENT '新上映影片总数',
  `movies_year_Num_Guochan` int DEFAULT NULL COMMENT '新上映国产数',
  `movies_year_Num_Jinkou` int DEFAULT NULL COMMENT '新上映进口数',
  KEY `movies_year_Year` (`movies_year_Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.newmovie 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `newmovie` DISABLE KEYS */;
INSERT INTO `newmovie` (`movies_year_Year`, `movies_year_BoxOfficea`, `movies_year_BoxOffice_Guochan`, `movies_year_BoxOffice_Jinkou`, `movies_year_Num`, `movies_year_Num_Guochan`, `movies_year_Num_Jinkou`) VALUES
	(2012, 165.63, 72.22, 93.42, 388, 289, 99),
	(2013, 214.74, 124.1, 90.64, 373, 301, 72),
	(2014, 294.3, 159.78, 134.53, 407, 331, 76),
	(2015, 438.8, 273.36, 165.44, 476, 400, 76),
	(2016, 455.27, 264.17, 191.1, 507, 403, 104),
	(2017, 558.31, 298.81, 259.51, 490, 375, 115),
	(2018, 606.97, 375.79, 231.18, 505, 380, 125),
	(2019, 641.61, 399.98, 241.18, 552, 422, 130),
	(2020, 203.03, 170.03, 32.98, 295, 235, 60),
	(2021, 470.4, 393.38, 77.01, 508, 439, 69),
	(2022, 299.89, 252.52, 47.25, 321, 264, 57),
	(2023, 127.04, 117.95, 9.09, 25, 22, 3);
/*!40000 ALTER TABLE `newmovie` ENABLE KEYS */;


-- 导出  表 cinema.onnow 结构
CREATE TABLE IF NOT EXISTS `onnow` (
  `movies_rank` int DEFAULT NULL COMMENT '排名',
  `movies_MovieName` varchar(150) DEFAULT NULL COMMENT '影片名称',
  `movies_BoxOffice` float DEFAULT NULL COMMENT '当前票房',
  `movies_ReleaseDate` date DEFAULT NULL COMMENT '上映日期',
  `movies_TotalBoxOffice` float DEFAULT NULL COMMENT '累计票房',
  `movies_ShowCount` int DEFAULT NULL COMMENT '当前场次',
  `movies_AudienceCount` int DEFAULT NULL COMMENT '当前人次',
  `movies_BoxOfficePercent` float DEFAULT NULL COMMENT '票房占比',
  `movies_ReleaseDay` int DEFAULT NULL COMMENT '累计上映天数',
  `movies_ShowDay` int DEFAULT NULL COMMENT '当前统计天数',
  `movies_TaoPiaoPiaoWantToSee` int DEFAULT NULL COMMENT '淘票票想看数',
  `movies_MaoYanWantToSee` int DEFAULT NULL COMMENT '猫眼想看数',
  `movies_DouBanWantToSee` int DEFAULT NULL COMMENT '豆瓣想看数',
  `movies_HjBoxOffice` float DEFAULT NULL COMMENT '黄金场票房',
  `movies_HjShowCount` int DEFAULT NULL COMMENT '黄金场场次',
  `movies_HjBoxOfficePercent` float DEFAULT NULL COMMENT '黄金场票房占比',
  `movies_HjShowCountPercent` float DEFAULT NULL COMMENT '黄金场场次占比',
  `movies_HjAudienceCountPercent` float DEFAULT NULL COMMENT '黄金场人次占比',
  KEY `movies_rank` (`movies_rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.onnow 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `onnow` DISABLE KEYS */;
INSERT INTO `onnow` (`movies_rank`, `movies_MovieName`, `movies_BoxOffice`, `movies_ReleaseDate`, `movies_TotalBoxOffice`, `movies_ShowCount`, `movies_AudienceCount`, `movies_BoxOfficePercent`, `movies_ReleaseDay`, `movies_ShowDay`, `movies_TaoPiaoPiaoWantToSee`, `movies_MaoYanWantToSee`, `movies_DouBanWantToSee`, `movies_HjBoxOffice`, `movies_HjShowCount`, `movies_HjBoxOfficePercent`, `movies_HjShowCountPercent`, `movies_HjAudienceCountPercent`) VALUES
	(1, '流浪地球2', 10981900, '2023-01-22', 3672730000, 78912, 236982, 30.04, 23, 1, 1300622, 1214895, 82137, 3059940, 21987, 27.86, 27.86, 27.85),
	(2, '满江红', 9494730, '2023-01-22', 4253870000, 76367, 217967, 25.97, 23, 1, 598107, 1099489, 78743, 2619290, 21063, 27.59, 27.58, 27.58),
	(3, '无名', 4902240, '2023-01-22', 862315000, 22561, 98995, 13.41, 23, 1, 870977, 592362, 88585, 946603, 4354, 19.31, 19.3, 19.35),
	(4, '深海', 4339530, '2023-01-22', 767963000, 36362, 99985, 11.87, 23, 1, 359479, 430445, 110405, 1013370, 8493, 23.35, 23.36, 23.3),
	(5, '黑豹2', 2350530, '2023-02-07', 83726700, 33247, 56998, 6.43, 7, 1, 227958, 296086, 87387, 618381, 8749, 26.31, 26.32, 26.36),
	(6, '熊出没·伴我“熊芯”', 2134390, '2023-01-22', 1354030000, 20665, 51997, 5.84, 23, 1, 280230, 431430, 26585, 472527, 4576, 22.14, 22.14, 22.21),
	(7, '交换人生', 963032, '2023-01-22', 376485000, 13736, 21996, 2.63, 23, 1, 470356, 370906, 20382, 153828, 2192, 15.97, 15.96, 16.09),
	(8, '阿凡达：水之道', 812723, '2022-12-16', 1674350000, 4870, 18000, 2.22, 60, 1, 1199820, 1451318, 231042, 210487, 1261, 25.9, 25.89, 25.86),
	(9, '风再起时', 473151, '2023-02-05', 44565000, 8233, 9998, 1.29, 9, 1, 83901, 271578, 39991, 78104.2, 1361, 16.51, 16.53, 16.62),
	(10, '穿靴子的猫2', 26650.9, '2022-12-23', 46395400, 292, 635, 0.07, 53, 1, 22229, 11328, 55215, 3916.16, 43, 14.69, 14.73, 14.8),
	(11, '想见你', 23741.7, '2022-12-24', 401477000, 377, 506, 0.06, 52, 1, 274504, 567089, 50483, 3494.74, 55, 14.72, 14.59, 15.02),
	(12, '橡树餐厅', 21560, '2022-12-31', 338608, 21, 330, 0.06, 45, 1, 1621, 2015, 54, 0, 0, 0, 0, 0),
	(13, '平凡英雄', 16170, '2022-09-30', 217730000, 72, 479, 0.04, 137, 1, 30522, 31951, 6710, 2920, 13, 18.06, 18.06, 17.95),
	(14, '星球人', 9200, '2023-01-20', 26277.9, 6, 236, 0.03, 25, 1, 1112, 1461, NULL, 1540, 1, 16.74, 16.67, 16.95),
	(15, '中国乒乓之绝地反击', 3999.09, '2023-02-17', 49769400, 83, 84, 0.01, -3, 1, 158196, 260146, 10458, 850, 17, 21.25, 20.48, 20.24),
	(16, '深爱', 2790.4, '2021-08-13', 5360520, 511, 85, 0.01, 550, 1, 30500, 70511, 5693, 717.81, 131, 25.72, 25.64, 24.71),
	(17, '冰雪与少年', 599, '2023-01-24', 10108.6, 28, 4, 0, 21, 1, 774, 816, NULL, 0, 1, 0, 3.57, 0),
	(18, '西游记之七十二变', 7.97, '2022-12-30', 8297860, 32, 5, 0, 46, 1, 5730, NULL, 1512, 0, 4, 0, 12.5, 0),
	(19, '爱在井冈', 3.17, NULL, 265832, 4, 1, 0, NULL, 1, NULL, NULL, 78, 0, 1, 0, 25, 0),
	(20, '追光', 0, '2022-09-15', 483462, 1, 0, 0, 152, 1, 3441, 3588, NULL, 0, 0, 0, 0, 0),
	(21, '相见在鸾峰桥', 0, '2022-11-18', 81277.2, 1, 0, 0, 88, 1, 373, 278, 39, 0, 0, 0, 0, 0),
	(22, '沼泽深处的女孩', 0, '2022-11-25', 7952830, 1, 0, 0, 81, 1, 19981, 22802, 77250, 0, 0, 0, 0, 0),
	(23, '变身攻略', 0, '2022-12-24', 13080.3, 2, 0, 0, 52, 1, 567, 1227, 27, 0, 1, 0, 50, 0),
	(24, '极速保镖', 0, '2023-02-14', 7000, 2, 0, 0, 0, 1, 11438, 5751, 267, 0, 0, 0, 0, 0),
	(25, '阳光照耀塔什库尔干', 0, '2022-07-23', 60864.1, 1, 0, 0, 206, 1, 743, 758, 308, 0, 0, 0, 0, 0),
	(26, '放牛班的春天', 0, '2005-02-18', 7988460, 1, 0, 0, 6570, 1, NULL, NULL, NULL, 0, 0, 0, 0, 0),
	(27, '大鱼海棠', 0, '2016-07-08', 574984000, 2, 0, 0, 2412, 1, NULL, 229819, 61902, 0, 0, 0, 0, 0),
	(28, '黑豹', 0, '2018-03-09', 662591000, 11, 0, 0, 1803, 1, 248085, 283239, 72510, 0, 2, 0, 18.18, 0),
	(29, '中国机长', 0, '2019-09-30', 2913710000, 2, 0, 0, 1233, 1, 7174, 561040, 79173, 0, 0, 0, 0, 0),
	(30, '龙珠超：超级人造人', 0, '2023-01-06', 11163900, 1, 0, 0, 39, 1, 30120, 56738, 6277, 0, 0, 0, 0, 0),
	(31, '不能流泪的悲伤', 0, '2023-02-14', 28800, 1, 0, 0, 0, 1, 9390, 78472, 1066, 0, 0, 0, 0, 0),
	(32, '我的青春不再见', 0, '2023-02-10', 3320, 2, 0, 0, 4, 1, 1073, 1774, NULL, 0, 0, 0, 0, 0),
	(33, '可不可以不要离开我', 0, NULL, 0, 1, 0, 0, NULL, 1, 49348, 169777, 308, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `onnow` ENABLE KEYS */;


-- 导出  表 cinema.toptwo 结构
CREATE TABLE IF NOT EXISTS `toptwo` (
  `orderin` int DEFAULT NULL COMMENT '排名序号',
  `findLInk` varchar(150) DEFAULT NULL COMMENT '影片超链接',
  `findImgScr` varchar(150) DEFAULT NULL COMMENT '影片图片的超链接',
  `findTitleCn` varchar(150) DEFAULT NULL COMMENT '影片中文名',
  `findTitleEn` varchar(150) DEFAULT NULL COMMENT '影片英文名',
  `findRating` float DEFAULT NULL COMMENT '影片评分',
  `findJudge` float DEFAULT NULL COMMENT '影片评价人数',
  `findInq` varchar(150) DEFAULT NULL COMMENT '影片概况',
  `finddirector` varchar(150) DEFAULT NULL COMMENT '主演和导演',
  `findyear` varchar(150) DEFAULT NULL COMMENT '上映年份',
  `findcountry` varchar(150) DEFAULT NULL COMMENT '上映国家',
  `findclass` varchar(150) DEFAULT NULL COMMENT '影片类型',
  KEY `findLInk` (`findLInk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  cinema.toptwo 的数据：~250 rows (大约)
/*!40000 ALTER TABLE `toptwo` DISABLE KEYS */;
INSERT INTO `toptwo` (`orderin`, `findLInk`, `findImgScr`, `findTitleCn`, `findTitleEn`, `findRating`, `findJudge`, `findInq`, `finddirector`, `findyear`, `findcountry`, `findclass`) VALUES
	(1, 'https://movie.douban.com/subject/1292052/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg', '肖申克的救赎', '  The Shawshank Redemption', 9.7, 2799280, '希望让人自由', '... ', '1994', '美国', '犯罪 剧情'),
	(2, 'https://movie.douban.com/subject/1291546/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561716440.jpg', '霸王别姬', '', 9.6, 2071540, '风华绝代', '张丰毅 Fengyi Zha... ', '1993', '中国大陆 中国香港', '剧情 爱情 同性'),
	(3, 'https://movie.douban.com/subject/1292720/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2372307693.jpg', '阿甘正传', '  Forrest Gump', 9.5, 2097140, '一部美国近现代史', '... ', '1994', '美国', '剧情 爱情'),
	(4, 'https://movie.douban.com/subject/1292722/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p457760035.jpg', '泰坦尼克号', '  Titanic', 9.5, 2059380, '失去的才是永恒的 ', '导演: 詹姆斯·卡梅隆 James Cameron   主演: 莱昂纳多·迪卡普里奥 Leonardo... ', '1997', '美国 墨西哥 澳大利亚 加拿大', '剧情 爱情 灾难'),
	(5, 'https://movie.douban.com/subject/1295644/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p511118051.jpg', '这个杀手不太冷', '  Léon', 9.4, 2232130, '怪蜀黍和小萝莉不得不说的故事', '娜塔莉·波特曼 ... ', '1994', '法国 美国', '剧情 动作 犯罪'),
	(6, 'https://movie.douban.com/subject/1292063/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2578474613.jpg', '美丽人生', '  La vita è bella', 9.6, 1288500, '最美的谎言', '导演: 罗伯托·贝尼尼 Roberto Benigni   主演: 罗伯托·贝尼尼 Roberto Beni... ', '1997', '意大利', '剧情 喜剧 爱情 战争'),
	(7, 'https://movie.douban.com/subject/1291561/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.jpg', '千与千寻', '  千と千尋の神隠し', 9.4, 2173250, '最好的宫崎骏，最好的久石让 ', '入野自由 Miy... ', '2001', '日本', '剧情 动画 奇幻'),
	(8, 'https://movie.douban.com/subject/1295124/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p492406163.jpg', '辛德勒的名单', '  Schindler\'s List', 9.6, 1073680, '拯救一个人，就是拯救整个世界', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 连姆·尼森 Liam Neeson... ', '1993', '美国', '剧情 历史 战争'),
	(9, 'https://movie.douban.com/subject/3541415/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p513344864.jpg', '盗梦空间', '  Inception', 9.4, 2004410, '诺兰给了我们一场无法盗取的梦', '导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 莱昂纳多·迪卡普里奥 Le... ', '2010', '美国 英国', '剧情 科幻 悬疑 冒险'),
	(10, 'https://movie.douban.com/subject/1889243/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2614988097.jpg', '星际穿越', '  Interstellar', 9.4, 1763070, '爱是一种力量，让我们超越时空感知它的存在', '导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 马修·麦康纳 Matthew Mc... ', '2014', '美国 英国 加拿大', '剧情 科幻 冒险'),
	(11, 'https://movie.douban.com/subject/1292064/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p479682972.jpg', '楚门的世界', '  The Truman Show', 9.4, 1637660, '如果再也不能见到你，祝你早安，午安，晚安', '劳拉·琳妮 Lau... ', '1998', '美国', '剧情 科幻'),
	(12, 'https://movie.douban.com/subject/3011091/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p524964039.jpg', '忠犬八公的故事', '  Hachi: A Dog\'s Tale', 9.4, 1361550, '永远都不能忘记你所爱的人', '导演: 莱塞·霍尔斯道姆 Lasse Hallström   主演: 理查·基尔 Richard Ger... ', '2009', '美国 英国', '剧情'),
	(13, 'https://movie.douban.com/subject/1292001/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2574551676.jpg', '海上钢琴师', '  La leggenda del pianista sull\'oceano', 9.3, 1631990, '每个人都要走一条自己坚定了的路，就算是粉身碎骨 ', '... ', '1998', '意大利', '剧情 音乐'),
	(14, 'https://movie.douban.com/subject/3793023/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p579729551.jpg', '三傻大闹宝莱坞', '  3 Idiots', 9.2, 1810260, '英俊版憨豆，高情商版谢耳朵', '卡... ', '2009', '印度', '剧情 喜剧 爱情 歌舞'),
	(15, 'https://movie.douban.com/subject/1291549/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2884280708.jpg', '放牛班的春天', '  Les choristes', 9.3, 1275790, '天籁一般的童声，是最接近上帝的存在 ', '导演: 克里斯托夫·巴拉蒂 Christophe Barratier   主演: 让-巴蒂斯特·莫尼... ', '2004', '法国 瑞士 德国', '剧情 音乐'),
	(16, 'https://movie.douban.com/subject/2131459/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1461851991.jpg', '机器人总动员', '  WALL·E', 9.3, 1280430, '小瓦力，大人生', '艾丽... ', '2008', '美国', '科幻 动画 冒险'),
	(17, 'https://movie.douban.com/subject/1307914/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2564556863.jpg', '无间道', '  無間道', 9.3, 1316490, '香港电影史上永不过时的杰作', '梁朝伟 Tony Leung Chiu W... ', '2002', '中国香港', '剧情 犯罪 惊悚'),
	(18, 'https://movie.douban.com/subject/25662329/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2614500649.jpg', '疯狂动物城', '  Zootopia', 9.2, 1864610, '迪士尼给我们营造的乌托邦就是这样，永远善良勇敢，永远出乎意料', '瑞奇·摩尔 Rich Moore   主演: 金妮弗·... ', '2016', '美国', '喜剧 动画 冒险'),
	(19, 'https://movie.douban.com/subject/1296141/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1505392928.jpg', '控方证人', '  Witness for the Prosecution', 9.6, 526213, '比利·怀德满分作品', '玛琳·... ', '1957', '美国', '剧情 犯罪 悬疑'),
	(20, 'https://movie.douban.com/subject/1292213/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2455050536.jpg', '大话西游之大圣娶亲', '  西遊記大結局之仙履奇緣', 9.2, 1489390, '一生所爱', '吴孟达 Man Tat Ng... ', '1995', '中国香港 中国大陆', '喜剧 爱情 奇幻 古装'),
	(21, 'https://movie.douban.com/subject/5912992/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1363250216.jpg', '熔炉', '  도가니', 9.4, 906654, '我们一路奋战不是为了改变世界，而是为了不让世界改变我们', '... ', '2011', '韩国', '剧情'),
	(22, 'https://movie.douban.com/subject/1291841/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p616779645.jpg', '教父', '  The Godfather', 9.3, 934334, '千万不要记恨你的对手，这样会让你失去理智', '导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 马龙·白兰度 M... ', '1972', '美国', '剧情 犯罪'),
	(23, 'https://movie.douban.com/subject/1849031/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2614359276.jpg', '当幸福来敲门', '  The Pursuit of Happyness', 9.2, 1477780, '平民励志片 ', '导演: 加布里尔·穆奇诺 Gabriele Muccino   主演: 威尔·史密斯 Will Smith ... ', '2006', '美国', '剧情 传记 家庭'),
	(24, 'https://movie.douban.com/subject/6786002/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1454261925.jpg', '触不可及', '  Intouchables', 9.3, 1072280, '满满温情的高雅喜剧', '艾力克·托兰达 Eric Toledano   主... ', '2011', '法国', '剧情 喜剧'),
	(25, 'https://movie.douban.com/subject/3319755/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p501177648.jpg', '怦然心动', '  Flipped', 9.1, 1780190, '真正的幸福是来自内心深处', '卡... ', '2010', '美国', '剧情 喜剧 爱情'),
	(26, 'https://movie.douban.com/subject/1291560/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.jpg', '龙猫', '  となりのトトロ', 9.2, 1228080, '人人心中都有个龙猫，童年就永远不会消失', '坂本千夏 Ch... ', '1988', '日本', '动画 奇幻 冒险'),
	(27, 'https://movie.douban.com/subject/1293172/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p452089833.jpg', '末代皇帝', '  The Last Emperor', 9.3, 846152, '“不要跟我比惨，我比你更惨”再适合这部电影不过了', '陈... ', '1987', '英国 意大利 中国大陆 法国', '剧情 传记 历史'),
	(28, 'https://movie.douban.com/subject/20495023/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2614500706.jpg', '寻梦环游记', '  Coco', 9.1, 1614850, '死亡不是真的逝去，遗忘才是永恒的消亡', '阿德里安·莫利纳 Adrian Molina   主演: ... ', '2017', '美国', '喜剧 动画 奇幻 音乐'),
	(29, 'https://movie.douban.com/subject/1292365/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2597919477.jpg', '活着', '', 9.3, 814886, '张艺谋最好的电影', '姜武 Wu Jiang ', '1994', '中国大陆 中国香港', '剧情 历史 家庭'),
	(30, 'https://movie.douban.com/subject/1851857/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p462657443.jpg', '蝙蝠侠：黑暗骑士', '  The Dark Knight', 9.2, 1025330, '无尽的黑暗', '导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 克里斯蒂安·贝尔 Christ... ', '2008', '美国 英国', '剧情 动作 科幻 犯罪 惊悚'),
	(31, 'https://movie.douban.com/subject/1295038/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2614949805.jpg', '哈利·波特与魔法石', '  Harry Potter and the Sorcerer\'s Stone', 9.2, 1143790, '童话世界的开端', 'Rupert Grint ', '2001', '美国 英国', '奇幻 冒险'),
	(32, 'https://movie.douban.com/subject/1291552/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2642829472.jpg', '指环王3：王者无敌', '  The Lord of the Rings: The Return of the King', 9.3, 778259, '史诗的终章', '西恩... ', '2003', '美国 新西兰', '剧情 动作 奇幻 冒险'),
	(33, 'https://movie.douban.com/subject/1300267/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1963126880.jpg', '乱世佳人', '  Gone with the Wind', 9.3, 669454, 'Tomorrow is another day.', '乔治·库克 George Cukor   主演: 费... ', '1939', '美国', '剧情 历史 爱情 战争'),
	(34, 'https://movie.douban.com/subject/21937452/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2118532944.jpg', '素媛', '  소원', 9.3, 665531, '受过伤害的人总是笑得最开心，因为他们不愿意让身边的人承受一样的痛苦', '严志媛 Ji-won Uhm ... ', '2013', '韩国', '剧情'),
	(35, 'https://movie.douban.com/subject/26752088/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2561305376.jpg', '我不是药神', '', 9, 2039120, '对我们国家而言，这样的电影多一部是一部', '周... ', '2018', '中国大陆', '剧情 喜剧'),
	(36, 'https://movie.douban.com/subject/2129039/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2363116942.jpg', '飞屋环游记', '  Up', 9.1, 1285970, '最后那些最无聊的事情，才是最值得怀念的 ', '鲍勃·彼德森 Bob Peterson   主演: 爱德... ', '2009', '美国', '剧情 喜剧 动画 冒险'),
	(37, 'https://movie.douban.com/subject/30170448/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555295759.jpg', '何以为家', '  كفرناحوم', 9.1, 1013460, '凝视卑弱生命，用电影改变命运', '... ', '2018', '黎巴嫩 美国 法国 塞浦路斯 卡塔尔 英国', '剧情'),
	(38, 'https://movie.douban.com/subject/26387939/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2401676338.jpg', '摔跤吧！爸爸', '  Dangal', 9, 1527250, '你不是在为你一个人战斗，你要让千千万万的女性看到女生并不是只能相夫教子', '法缇玛... ', '2016', '印度', '剧情 传记 运动 家庭'),
	(39, 'https://movie.douban.com/subject/1293182/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2173577632.jpg', '十二怒汉', '  12 Angry Men', 9.4, 471306, '1957年的理想主义 ', '马丁·鲍尔萨姆 Marti... ', '1957', '美国', '剧情'),
	(40, 'https://movie.douban.com/subject/1308807/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2174346180.jpg', '哈尔的移动城堡', '  ハウルの動く城', 9.1, 986345, '带着心爱的人在天空飞翔', '木村拓... ', '2004', '日本', '动画 奇幻 冒险'),
	(41, 'https://movie.douban.com/subject/1291858/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2553104888.jpg', '鬼子来了', '', 9.3, 606984, '对敌人的仁慈，就是对自己残忍', '... ', '2000', '中国大陆', '剧情 喜剧'),
	(42, 'https://movie.douban.com/subject/1929463/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1784592701.jpg', '少年派的奇幻漂流', '  Life of Pi', 9.1, 1316180, '瑰丽壮观、无人能及的冒险之旅', '伊尔凡·可汗 Irrfan... ', '2012', '美国 中国台湾 英国 加拿大', '剧情 奇幻 冒险'),
	(43, 'https://movie.douban.com/subject/1305487/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p453924541.jpg', '猫鼠游戏', '  Catch Me If You Can', 9.1, 981374, '骗子大师和执著警探的你追我跑故事 ', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 莱昂纳多·迪卡普里奥 L... ', '2002', '美国 加拿大', '传记 犯罪 剧情'),
	(44, 'https://movie.douban.com/subject/3742360/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1512562287.jpg', '让子弹飞', '', 9, 1647080, '你给我翻译翻译，神马叫做TMD的惊喜', '周润发 Yun-F... ', '2010', '中国大陆 中国香港', '剧情 喜剧 动作 西部'),
	(45, 'https://movie.douban.com/subject/1296736/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1381339291.jpg', '钢琴家', '  The Pianist', 9.3, 610630, '音乐能化解仇恨', '导演: 罗曼·波兰斯基 Roman Polanski   主演: 艾德里安·布洛迪 Adrien Brod... ', '2002', '英国 法国 波兰 德国', '剧情 传记 战争 音乐'),
	(46, 'https://movie.douban.com/subject/1299398/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2561721372.jpg', '大话西游之月光宝盒', '  西遊記第壹佰零壹回之月光寶盒', 9, 1186830, '旷古烁今', '吴孟达 Man Tat Ng... ', '1995', '中国香港 中国大陆', '喜剧 爱情 奇幻 古装'),
	(47, 'https://movie.douban.com/subject/25958717/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2554525534.jpg', '海蒂和爷爷', '  Heidi', 9.3, 575068, '如果生活中有什么使你感到快乐，那就去做吧！不要管别人说什么', '... ', '2015', '德国 瑞士', '剧情 冒险 家庭'),
	(48, 'https://movie.douban.com/subject/1291583/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1446261379.jpg', '天空之城', '  天空の城ラピュタ', 9.2, 795233, '对天空的追逐，永不停止 ', '横泽启子 Ke... ', '1986', '日本', '动画 奇幻 冒险'),
	(49, 'https://movie.douban.com/subject/1291572/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2640236255.jpg', '指环王2：双塔奇兵', '  The Lord of the Rings: The Two Towers', 9.2, 728926, '承前启后的史诗篇章', '西恩... ', '2002', '美国 新西兰', '剧情 动作 奇幻 冒险'),
	(50, 'https://movie.douban.com/subject/1298624/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2550757929.jpg', '闻香识女人', '  Scent of a Woman', 9.1, 851947, '史上最美的探戈', '克里斯... ', '1992', '美国', '剧情'),
	(51, 'https://movie.douban.com/subject/1291828/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2653054340.jpg', '天堂电影院', '  Nuovo Cinema Paradiso', 9.2, 663105, '那些吻戏，那些青春，都在影院的黑暗里被泪水冲刷得无比清晰', '导演: 朱塞佩·托纳多雷 Giuseppe Tornatore   主演: 菲利普·努瓦雷 Philipp... ', '1988', '意大利 法国', '剧情 爱情'),
	(52, 'https://movie.douban.com/subject/1293839/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2189265085.jpg', '罗马假日', '  Roman Holiday', 9.1, 924174, '爱情哪怕只有一天', '格... ', '1953', '美国', '喜剧 剧情 爱情'),
	(53, 'https://movie.douban.com/subject/27060077/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2549177902.jpg', '绿皮书', '  Green Book', 8.9, 1591100, '去除成见，需要勇气', '... ', '2018', '美国 中国大陆', '剧情 喜剧 传记 音乐'),
	(54, 'https://movie.douban.com/subject/1418019/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2184505167.jpg', '大闹天宫', '', 9.4, 420446, '经典之作，历久弥新', '1978(中', '国大陆)', '中国大陆', '剧情 动画 奇幻 古装'),
	(55, 'https://movie.douban.com/subject/1291548/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575465690.jpg', '死亡诗社', '  Dead Poets Society', 9.2, 694829, '当一个死水般的体制内出现一个活跃的变数时，所有的腐臭都站在了光明的对面', '罗伯... ', '1989', '美国', '剧情'),
	(56, 'https://movie.douban.com/subject/1291571/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2373910134.jpg', '指环王1：护戒使者', '  The Lord of the Rings: The Fellowship of the Ring', 9.1, 820679, '传说的开始', '西恩... ', '2001', '新西兰 美国', '剧情 动作 奇幻 冒险'),
	(57, 'https://movie.douban.com/subject/1291843/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p451926968.jpg', '黑客帝国', '  The Matrix', 9.1, 813570, '视觉革命', '拉娜·沃卓斯基 Lana Wachowski   主... ', '1999', '美国', '动作 科幻'),
	(58, 'https://movie.douban.com/subject/1299131/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2194138787.jpg', '教父2', '  The Godfather: Part II', 9.3, 532397, '优雅的孤独', '导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 阿尔·帕西诺 A... ', '1974', '美国', '剧情 犯罪'),
	(59, 'https://movie.douban.com/subject/1301753/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p726659067.jpg', '狮子王', '  The Lion King', 9.1, 811322, '动物版《哈姆雷特》', '罗伯·明可夫 Rob Minkoff   主演: 乔纳森·泰勒·托马... ', '1994', '美国', '动画 冒险 歌舞'),
	(60, 'https://movie.douban.com/subject/21937445/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2158166535.jpg', '辩护人', '  변호인', 9.2, 574455, '电影的现实意义大过电影本身', '金英爱 Yeong-ae... ', '2013', '韩国', '剧情'),
	(61, 'https://movie.douban.com/subject/1291818/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1910899751.jpg', '饮食男女', '  飲食男女', 9.2, 599274, '人生不能像做菜，把所有的料都准备好了才下锅', '吴... ', '1994', '中国台湾 美国', '剧情 家庭'),
	(62, 'https://movie.douban.com/subject/1292000/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1910931622.jpg', '搏击俱乐部', '  Fight Club', 9, 822140, '邪恶与平庸蛰伏于同一个母体，在特定的时间互相对峙', '布拉... ', '1999', '美国 德国 意大利', '剧情 动作 悬疑 惊悚'),
	(63, 'https://movie.douban.com/subject/1306029/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1665997400.jpg', '美丽心灵', '  A Beautiful Mind', 9.1, 746791, '爱是一切逻辑和原由', '艾德·哈... ', '2001', '美国', '传记 剧情'),
	(64, 'https://movie.douban.com/subject/1485260/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2192535722.jpg', '本杰明·巴顿奇事', '  The Curious Case of Benjamin Button', 9, 955286, '在时间之河里感受溺水之苦', '... ', '2008', '美国', '剧情 爱情 奇幻'),
	(65, 'https://movie.douban.com/subject/3008247/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1473670352.jpg', '穿条纹睡衣的男孩', '  The Boy in the Striped Pajamas', 9.2, 543369, '尽管有些不切实际的幻想，这部电影依旧是一部感人肺腑的佳作', '导演: 马克·赫尔曼 Mark Herman   主演: 阿萨·巴特菲尔德 Asa Butterfield ... ', '2008', '英国 美国', '剧情 战争'),
	(66, 'https://movie.douban.com/subject/1900841/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1808872109.jpg', '窃听风暴', '  Das Leben der Anderen', 9.2, 547585, '别样人生', '导演: 弗洛里安·亨克尔·冯·多纳斯马尔克 Florian Henckel von Donnersmarck  &amp;n... ', '2006', '德国', '剧情 悬疑'),
	(67, 'https://movie.douban.com/subject/1292220/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2648230660.jpg', '情书', '  Love Letter', 8.9, 1071610, '暗恋的极致', '丰川悦司 Ets... ', '1995', '日本', '剧情 爱情'),
	(68, 'https://movie.douban.com/subject/1293350/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792443418.jpg', '两杆大烟枪', '  Lock, Stock and Two Smoking Barrels', 9.1, 579073, '4个臭皮匠顶个诸葛亮，盖·里奇果然不是盖的', 'Nick Moran ', '1998', '英国', '剧情 喜剧 犯罪'),
	(69, 'https://movie.douban.com/subject/1292402/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2441988159.jpg', '西西里的美丽传说', '  Malèna', 8.9, 946602, '美丽无罪', '导演: 朱塞佩·托纳多雷 Giuseppe Tornatore   主演: 莫妮卡·贝鲁奇 Monica ... ', '2000', '意大利 美国', '剧情 战争 情色'),
	(70, 'https://movie.douban.com/subject/1294408/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p453788577.jpg', '音乐之声', '  The Sound of Music', 9.1, 583103, '用音乐化解仇恨，让歌声串起美好', '克... ', '1965', '美国', '剧情 传记 爱情 歌舞'),
	(71, 'https://movie.douban.com/subject/26580232/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2498971355.jpg', '看不见的客人', '  Contratiempo', 8.8, 1217870, '你以为你以为的就是你以为的', '阿... ', '2016', '西班牙', '剧情 犯罪 悬疑 惊悚'),
	(72, 'https://movie.douban.com/subject/1652587/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2180085848.jpg', '阿凡达', '  Avatar', 8.8, 1380920, '绝对意义上的美轮美奂', '导演: 詹姆斯·卡梅隆 James Cameron   主演: 萨姆·沃辛顿 Sam Worthington ... ', '2009', '美国', '动作 科幻 冒险'),
	(73, 'https://movie.douban.com/subject/1292849/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1014542496.jpg', '拯救大兵瑞恩', '  Saving Private Ryan', 9.1, 628257, '美利坚精神输出大片No1.', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 汤姆·汉克斯 Tom Hanks... ', '1998', '美国', '剧情 战争'),
	(74, 'https://movie.douban.com/subject/1292224/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792238287.jpg', '飞越疯人院', '  One Flew Over the Cuckoo\'s Nest', 9.1, 533076, '自由万岁', '导演: 米洛斯·福尔曼 Miloš Forman   主演: 杰克·尼科尔森 Jack Nichols... ', '1975', '美国', '剧情'),
	(75, 'https://movie.douban.com/subject/1303021/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2165511465.jpg', '小鞋子', '  بچه های آسمان', 9.2, 398173, '奔跑的孩子是天使', '导演: 马基德·马基迪 Majid Majidi   主演: 默罕默德·阿米尔·纳吉 Mohamma... ', '1997', '伊朗', '剧情 儿童 家庭'),
	(76, 'https://movie.douban.com/subject/3011235/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1131848955.jpg', '哈利·波特与死亡圣器(下)', '  Harry Potter and the Deathly Hallows: Part 2', 9, 801738, '10年的完美句点', '导演: 大卫·叶茨 David Yates   主演: 丹尼尔·雷德克里夫 Daniel Radcliffe... ', '2011', '美国 英国', '奇幻 冒险'),
	(77, 'https://movie.douban.com/subject/1293544/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1593414327.jpg', '沉默的羔羊', '  The Silence of the Lambs', 8.9, 859217, '安东尼·霍普金斯的顶级表演', '安... ', '1991', '美国', '剧情 犯罪 惊悚'),
	(78, 'https://movie.douban.com/subject/2334904/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p450262388.jpg', '禁闭岛', '  Shutter Island', 8.9, 942681, '昔日翩翩少年，今日大腹便便', '... ', '2010', '美国', '剧情 悬疑 惊悚'),
	(79, 'https://movie.douban.com/subject/11525673/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2178872593.jpg', '布达佩斯大饭店', '  The Grand Budapest Hotel', 8.9, 897019, '小清新的故事里注入了大历史的情怀', '... ', '2014', '美国 德国 英国', '剧情 喜剧 冒险'),
	(80, 'https://movie.douban.com/subject/1780330/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p480383375.jpg', '致命魔术', '  The Prestige', 8.9, 832447, '孪生蝙蝠侠大战克隆金刚狼', '导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 休·杰克曼 Hugh Jackman... ', '2006', '英国 美国', '剧情 悬疑 惊悚'),
	(81, 'https://movie.douban.com/subject/1292343/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2209066019.jpg', '蝴蝶效应', '  The Butterfly Effect', 8.9, 908541, '人的命运被自己瞬间的抉择改变', 'J·麦基·格鲁伯 J. Mackye Gruber   主... ', '2004', '美国 加拿大', '剧情 悬疑 科幻 惊悚'),
	(82, 'https://movie.douban.com/subject/3442220/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2559579779.jpg', '海豚湾', '  The Cove', 9.3, 350384, '海豚的微笑，是世界上最高明的伪装', '路易·西霍... ', '2009', '美国', '纪录片'),
	(83, 'https://movie.douban.com/subject/1292656/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p480965695.jpg', '心灵捕手', '  Good Will Hunting', 8.9, 686246, '人生中应该拥有这样的一段豁然开朗', '罗宾·... ', '1997', '美国', '剧情'),
	(84, 'https://movie.douban.com/subject/1292262/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p477229647.jpg', '美国往事', '  Once Upon a Time in America', 9.2, 399750, '往事如烟，无处祭奠', '导演: 赛尔乔·莱翁内 Sergio Leone   主演: 罗伯特·德尼罗 Robert De Niro ... ', '1984', '美国 意大利', '犯罪 剧情'),
	(85, 'https://movie.douban.com/subject/1291543/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2219011938.jpg', '功夫', '', 8.8, 1078670, '警恶惩奸，维护世界和平这个任务就交给你了，好吗？', '... ', '2004', '中国大陆 中国香港', '动作 喜剧 犯罪 奇幻'),
	(86, 'https://movie.douban.com/subject/1291832/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1910902213.jpg', '低俗小说', '  Pulp Fiction', 8.9, 807245, '故事的高级讲法', '导演: 昆汀·塔伦蒂诺 Quentin Tarantino   主演: 约翰·特拉沃尔塔 John Tra... ', '1994', '美国', '剧情 喜剧 犯罪'),
	(87, 'https://movie.douban.com/subject/1294371/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2263408369.jpg', '摩登时代', '  Modern Times', 9.3, 290436, '大时代中的人生，小人物的悲喜', '导演: 查理·卓别林 Charles Chaplin   主演: 查理·卓别林 Charles Chaplin ... ', '1936', '美国', '剧情 喜剧 爱情'),
	(88, 'https://movie.douban.com/subject/1292679/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p465939041.jpg', '春光乍泄', '  春光乍洩', 9, 610013, '爱情纠缠，男女一致', '梁朝伟 Tony Leu... ', '1997', '中国香港 日本 韩国', '剧情 爱情 同性'),
	(89, 'https://movie.douban.com/subject/1291544/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1910812549.jpg', '哈利·波特与阿兹卡班的囚徒', '  Harry Potter and the Prisoner of Azkaban', 8.9, 696299, '不一样的导演，不一样的哈利·波特', 'Emma... ', '2004', '英国 美国', '奇幻 冒险'),
	(90, 'https://movie.douban.com/subject/1302425/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2579932167.jpg', '喜剧之王', '  喜劇之王', 8.8, 938923, '我是一个演员', '李力持 Lik-Chi Lee   主演: 周星驰 Stephen Ch... ', '1999', '中国香港', '喜剧 剧情 爱情'),
	(91, 'https://movie.douban.com/subject/5322596/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1305562621.jpg', '超脱', '  Detachment', 9, 567203, '穷尽一生，我们要学会的，不过是彼此拥抱', '马西... ', '2011', '美国', '剧情'),
	(92, 'https://movie.douban.com/subject/1297192/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2558364386.jpg', '致命ID', '  Identity', 8.9, 795279, '最不可能的那个人永远是最可能的', '雷... ', '2003', '美国', '剧情 悬疑 惊悚'),
	(93, 'https://movie.douban.com/subject/1292223/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2219586434.jpg', '七宗罪', '  Se7en', 8.8, 918968, '警察抓小偷，老鼠玩死猫', '布... ', '1995', '美国', '剧情 犯罪 悬疑 惊悚'),
	(94, 'https://movie.douban.com/subject/1300299/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1633113220.jpg', '杀人回忆', '  살인의 추억', 8.9, 686580, '关于连环杀人悬案的集体回忆', '金相庆 Sang-kyun... ', '2003', '韩国', '剧情 动作 犯罪 悬疑 惊悚'),
	(95, 'https://movie.douban.com/subject/1865703/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p456825720.jpg', '红辣椒', '  パプリカ', 9.1, 443682, '梦的勾结', '江守彻 Toru... ', '2006', '日本', '动画 悬疑 科幻 惊悚'),
	(96, 'https://movie.douban.com/subject/1298070/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1596085504.jpg', '加勒比海盗', '  Pirates of the Caribbean: The Curse of the Black Pearl', 8.8, 832505, '约翰尼·德普的独角戏', '... ', '2003', '美国', '动作 冒险 奇幻'),
	(97, 'https://movie.douban.com/subject/6985810/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1546987967.jpg', '狩猎', '  Jagten', 9.1, 376099, '人言可畏', '导演: 托马斯·温特伯格 Thomas Vinterberg   主演: 麦斯·米科尔森 Mads Mik... ', '2012', '丹麦 瑞典', '剧情'),
	(98, 'https://movie.douban.com/subject/1296996/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1082651990.jpg', '哈利·波特与密室', '  Harry Potter and the Chamber of Secrets', 8.8, 723457, '魔法的密室之门已打开...', '艾玛... ', '2002', '英国 美国', '奇幻 冒险'),
	(99, 'https://movie.douban.com/subject/1787291/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p884763596.jpg', '被嫌弃的松子的一生', '  嫌われ松子の一生', 8.9, 685973, '以戏谑来戏谑戏谑', '瑛太 E... ', '2006', '日本', '剧情 歌舞'),
	(100, 'https://movie.douban.com/subject/10777687/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1816276065.jpg', '7号房的礼物', '  7번방의 선물', 8.9, 540698, '《我是山姆》的《美丽人生》', '朴信惠 Shi... ', '2013', '韩国', '剧情 喜剧 家庭'),
	(101, 'https://movie.douban.com/subject/26799731/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2505525050.jpg', '请以你的名字呼唤我', '  Call Me by Your Name', 8.9, 697846, '沉醉在电影的情感和视听氛围中无法自拔', '... ', '2017', '意大利 法国 巴西 美国', '剧情 爱情 同性'),
	(102, 'https://movie.douban.com/subject/1292434/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2567845803.jpg', '一一', '', 9.1, 374609, '我们都曾经是一一', '金燕玲 Elai... ', '2000', '中国台湾 日本', '剧情 爱情 家庭'),
	(103, 'https://movie.douban.com/subject/1306249/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2357915564.jpg', '唐伯虎点秋香', '  唐伯虎點秋香', 8.7, 1043610, '华太师是黄霑，吴镇宇四大才子之一', '陈... ', '1993', '中国香港', '喜剧 爱情 古装'),
	(104, 'https://movie.douban.com/subject/1418834/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2604889017.jpg', '断背山', '  Brokeback Mountain', 8.8, 689997, '每个人心中都有一座断背山', '杰克·吉伦哈尔 Jake... ', '2005', '美国 加拿大', '剧情 爱情 同性 家庭'),
	(105, 'https://movie.douban.com/subject/1292370/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p480956937.jpg', '剪刀手爱德华', '  Edward Scissorhands', 8.7, 1011840, '浪漫忧郁的成人童话', '薇诺娜·... ', '1990', '美国', '剧情 奇幻 爱情'),
	(106, 'https://movie.douban.com/subject/1294639/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2004174709.jpg', '勇敢的心', '  Braveheart', 8.9, 547746, '史诗大片的典范', '苏菲·玛... ', '1995', '美国', '动作 传记 剧情 历史 战争'),
	(107, 'https://movie.douban.com/subject/2149806/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2707581855.jpg', '入殓师', '  おくりびと', 8.9, 645166, '死可能是一道门，逝去并不是终结，而是超越，走向下一程', '... ', '2008', '日本', '剧情'),
	(108, 'https://movie.douban.com/subject/1296339/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2555762374.jpg', '爱在黎明破晓前', '  Before Sunrise', 8.8, 654040, '缘分是个连绵词，最美不过一瞬', '导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ... ', '1995', '美国 奥地利 瑞士', '剧情 爱情'),
	(109, 'https://movie.douban.com/subject/1297630/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2220184425.jpg', '第六感', '  The Sixth Sense', 8.9, 538970, '深入内心的恐怖，出人意料的结局', '导演: M·奈特·沙马兰 M. Night Shyamalan   主演: 布鲁斯·威利斯 Bruce Wi... ', '1999', '美国', '剧情 悬疑 惊悚'),
	(110, 'https://movie.douban.com/subject/1291999/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p792381411.jpg', '重庆森林', '  重慶森林', 8.8, 783479, '寂寞没有期限', '金城武 Takeshi K... ', '1994', '中国香港', '剧情 爱情'),
	(111, 'https://movie.douban.com/subject/3395373/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1706428744.jpg', '蝙蝠侠：黑暗骑士崛起', '  The Dark Knight Rises', 8.8, 697944, '诺兰就是保证', '导演: 克里斯托弗·诺兰 Christopher Nolan   主演: 克里斯蒂安·贝尔 Christ... ', '2012', '美国 英国', '剧情 动作 科幻 犯罪 惊悚'),
	(112, 'https://movie.douban.com/subject/1297359/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1613191025.jpg', '幽灵公主', '  もののけ姫', 8.9, 507488, '人与自然的战争史诗', '石田百合... ', '1997', '日本', '动画 奇幻 冒险'),
	(113, 'https://movie.douban.com/subject/11026735/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2614500883.jpg', '超能陆战队', '  Big Hero 6', 8.7, 981224, 'Balalala~~~', '克里斯·威廉姆斯 Chris Williams   主演: 斯科特... ', '2014', '美国', '喜剧 动作 科幻 动画 冒险'),
	(114, 'https://movie.douban.com/subject/1293359/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2620392435.jpg', '菊次郎的夏天', '  菊次郎の夏', 8.9, 576045, '从没见过那么流氓的温柔，从没见过那么温柔的流氓', '关口雄介 Yus... ', '1999', '日本', '剧情 喜剧'),
	(115, 'https://movie.douban.com/subject/1292215/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2447590313.jpg', '天使爱美丽', '  Le fabuleux destin d\'Amélie Poulain', 8.7, 938929, '法式小清新 ', '导演: 让-皮埃尔·热内 Jean-Pierre Jeunet   主演: 奥黛丽·塔图 Audrey Tau... ', '2001', '法国 德国', '剧情 喜剧 爱情'),
	(116, 'https://movie.douban.com/subject/1291990/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561542458.jpg', '爱在日落黄昏时', '  Before Sunset', 8.9, 537438, '九年后的重逢是世俗和责任的交叠，没了悸动和青涩，沧桑而温暖', '导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ... ', '2004', '美国 法国', '剧情 爱情'),
	(117, 'https://movie.douban.com/subject/1291875/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2564685215.jpg', '阳光灿烂的日子', '', 8.9, 597674, '一场华丽的意淫', '陶虹 Hong Tao ', '1994', '中国大陆 中国香港', '剧情 爱情'),
	(118, 'https://movie.douban.com/subject/25814705/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2564498893.jpg', '小森林 夏秋篇', '  リトル・フォレスト 夏・秋', 9, 413474, '那些静得只能听见呼吸的日子里，你明白孤独即生活', '三浦贵大 Takahir... ', '2014', '日本', '剧情'),
	(119, 'https://movie.douban.com/subject/1305164/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2223011274.jpg', '甜蜜蜜', '', 8.9, 525372, '相逢只要一瞬间，等待却像是一辈子', '... ', '1996', '中国香港', '剧情 爱情'),
	(120, 'https://movie.douban.com/subject/1300992/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2190556408.jpg', '完美的世界', '  A Perfect World', 9.1, 304038, '坏人的好总是比好人的好来得更感人', '导演: 克林特·伊斯特伍德 Clint Eastwood   主演: 凯文·科斯特纳 Kevin Cos... ', '1993', '美国', '剧情 犯罪'),
	(121, 'https://movie.douban.com/subject/4202302/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p617533616.jpg', '借东西的小人阿莉埃蒂', '  借りぐらしのアリエッティ', 8.9, 534440, '曾经的那段美好会沉淀为一辈子的记忆', '神木... ', '2010', '日本', '动画 奇幻 冒险'),
	(122, 'https://movie.douban.com/subject/21318488/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2221768894.jpg', '消失的爱人', '  Gone Girl', 8.7, 904328, '年度最佳date movie', '罗莎蒙... ', '2014', '美国', '剧情 犯罪 悬疑 惊悚'),
	(123, 'https://movie.douban.com/subject/1292337/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p661160053.jpg', '无人知晓', '  誰も知らない', 9.1, 307058, '我的平常生活就是他人的幸福', '北浦爱... ', '2004', '日本', '剧情'),
	(124, 'https://movie.douban.com/subject/1297447/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2414157745.jpg', '倩女幽魂', '', 8.8, 709412, '两张绝世的脸 ', '王祖贤 Joey W... ', '1987', '中国香港', '爱情 奇幻 武侠 古装'),
	(125, 'https://movie.douban.com/subject/25814707/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2215147728.jpg', '小森林 冬春篇', '  リトル・フォレスト 冬・春', 9, 369150, '尊敬他人，尊敬你生活的这片土地，明白孤独是人生的常态', '三浦贵大 Takahir... ', '2015', '日本', '剧情'),
	(126, 'https://movie.douban.com/subject/1297052/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p456692072.jpg', '侧耳倾听', '  耳をすませば', 8.9, 446670, '少女情怀总是诗', '小林桂树 K... ', '1995', '日本', '剧情 爱情 动画'),
	(127, 'https://movie.douban.com/subject/10577869/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2070153774.jpg', '时空恋旅人', '  About Time', 8.8, 638397, '把每天当作最后一天般珍惜度过，积极拥抱生活，就是幸福', '导演: 理查德·柯蒂斯 Richard Curtis   主演: 多姆纳尔·格里森 Domhnall Gl... ', '2013', '英国', '喜剧 爱情 奇幻'),
	(128, 'https://movie.douban.com/subject/27010768/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561439800.jpg', '寄生虫', '  기생충', 8.8, 1328650, ' ', '李善均 Seon-gyun... ', '2019', '韩国', '剧情'),
	(129, 'https://movie.douban.com/subject/1292274/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p854757687.jpg', '幸福终点站', '  The Terminal', 8.8, 551423, '有时候幸福需要等一等 ', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 汤姆·汉克斯 Tom Hanks... ', '2004', '美国', '喜剧 剧情 爱情'),
	(130, 'https://movie.douban.com/subject/2353023/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p490385643.jpg', '驯龙高手', '  How to Train Your Dragon', 8.8, 734164, '和谐的生活离不开摸头与被摸头', '克里斯·桑德斯 Chris Sanders   主演:... ', '2010', '美国', '动画 奇幻 冒险'),
	(131, 'https://movie.douban.com/subject/5989818/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1675053073.jpg', '萤火之森', '  蛍火の杜へ', 8.9, 518442, '触不到的恋人', '内山昂辉 K... ', '2011', '日本', '剧情 爱情 动画 奇幻'),
	(132, 'https://movie.douban.com/subject/1294240/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2169664351.jpg', '教父3', '  The Godfather: Part III', 9, 359993, '任何信念的力量，都无法改变命运', '导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola   主演: 阿尔·帕西诺 A... ', '1990', '美国', '剧情 犯罪'),
	(133, 'https://movie.douban.com/subject/26628357/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2406624993.jpg', '一个叫欧维的男人决定去死', '  En man som heter Ove', 8.9, 456285, '惠及一生的美丽', '导演: 汉内斯·赫尔姆 Hannes Holm   主演: 罗夫·拉斯加德 Rolf Lassgård... ', '2015', '瑞典', '剧情'),
	(134, 'https://movie.douban.com/subject/1291579/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2513247938.jpg', '怪兽电力公司', '  Monsters, Inc.', 8.8, 647250, '不要给它起名字，起了名字就有感情了', '大卫·斯沃曼 David Silverman   主演: 约... ', '2001', '美国', '儿童 喜剧 动画 奇幻 冒险'),
	(135, 'https://movie.douban.com/subject/1395091/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1351050722.jpg', '未麻的部屋', '  Perfect Blue', 9.1, 316349, '好的剧本是，就算你猜到了结局也猜不到全部', '松本梨香 Rica Matsu... ', '1997', '日本', '动画 奇幻 惊悚'),
	(136, 'https://movie.douban.com/subject/1858711/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1283675359.jpg', '玩具总动员3', '  Toy Story 3', 8.9, 497167, '跨度十五年的欢乐与泪水', '蒂姆·艾... ', '2010', '美国', '喜剧 动画 奇幻 冒险'),
	(137, 'https://movie.douban.com/subject/1309055/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p735391084.jpg', '哈利·波特与火焰杯', '  Harry Potter and the Goblet of Fire', 8.8, 630602, ' ', '导演: 迈克·内威尔 Mike Newell   主演: 丹尼尔·雷德克里夫 Daniel Radclif... ', '2005', '英国 美国', '悬疑 奇幻 冒险'),
	(138, 'https://movie.douban.com/subject/1418200/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2016401659.jpg', '傲慢与偏见', '  Pride &amp; Prejudice', 8.7, 769082, '爱是摈弃傲慢与偏见之后的曙光', '马修·... ', '2005', '法国 英国 美国', '剧情 爱情'),
	(139, 'https://movie.douban.com/subject/3072124/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p488255145.jpg', '玛丽和马克思', '  Mary and Max', 8.9, 413457, '你是我最好的朋友，你是我唯一的朋友 ', '菲利... ', '2009', '澳大利亚 美国', '剧情 喜剧 动画'),
	(140, 'https://movie.douban.com/subject/25986180/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2360940399.jpg', '釜山行', '  부산행', 8.6, 1163020, '揭露人性的丧尸题材力作', '马... ', '2016', '韩国', '动作 惊悚 灾难'),
	(141, 'https://movie.douban.com/subject/3287562/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792776858.jpg', '神偷奶爸', '  Despicable Me', 8.6, 922364, 'Mr. I Don\'t Care其实也有Care的时候', '克里斯·雷纳德 Chris Renaud   主演: ... ', '2010', '美国 法国', '喜剧 动画 冒险'),
	(142, 'https://movie.douban.com/subject/6307447/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1800813767.jpg', '被解救的姜戈', '  Django Unchained', 8.8, 589618, '热血沸腾，那个低俗、性感的无耻混蛋又来了', '... ', '2012', '美国', '剧情 动作 西部 冒险'),
	(143, 'https://movie.douban.com/subject/4268598/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p689520756.jpg', '告白', '', 8.8, 656223, '没有一人完全善，也没有一人完全恶', '冈田将生 ... ', '2010', '日本', '剧情 悬疑'),
	(144, 'https://movie.douban.com/subject/10437779/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1903379979.jpg', '新世界', '  신세계', 8.9, 410435, '要做就做得狠一点，这样才能活下去', '崔岷植 Min-sik... ', '2013', '韩国', '剧情 犯罪'),
	(145, 'https://movie.douban.com/subject/1291545/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p692813374.jpg', '大鱼', '  Big Fish', 8.8, 553759, '抱着梦想而活着的人是幸福的，怀抱梦想而死去的人是不朽的', '阿... ', '2003', '美国', '剧情 家庭 奇幻 冒险'),
	(146, 'https://movie.douban.com/subject/1307315/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2532803206.jpg', '哪吒闹海', '', 9.2, 250192, '想你时你在闹海', '严定宪 Dingxian Yan   主演: 梁正晖 Zhenghui ... ', '1979', '中国大陆', '冒险 动画 奇幻'),
	(147, 'https://movie.douban.com/subject/1316510/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2609063922.jpg', '射雕英雄传之东成西就', '  射鵰英雄傳之東成西就', 8.7, 614846, '百看不厌 ', '林青霞 Bri... ', '1993', '中国香港', '喜剧 奇幻 武侠 古装'),
	(148, 'https://movie.douban.com/subject/4917726/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.jpg', '阳光姐妹淘', '  써니', 8.8, 578789, '再多各自牛逼的时光，也比不上一起傻逼的岁月 ', '闵孝琳 Hy... ', '2011', '韩国', '剧情 喜剧'),
	(149, 'https://movie.douban.com/subject/4920389/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2516578307.jpg', '头号玩家', '  Ready Player One', 8.7, 1329580, '写给影迷，动漫迷和游戏迷的一封情书', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 泰伊·谢里丹 Tye Sheri... ', '2018', '美国', '动作 科幻 冒险'),
	(150, 'https://movie.douban.com/subject/1306861/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p652417775.jpg', '我是山姆', '  I Am Sam', 9, 327752, '爱并不需要智商 ', 'Mi... ', '2001', '美国', '剧情 家庭'),
	(151, 'https://movie.douban.com/subject/10463953/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2255040492.jpg', '模仿游戏', '  The Imitation Game', 8.8, 626901, '他给机器起名“克里斯托弗”，因为这是他初恋的名字', '导演: 莫滕·泰杜姆 Morten Tyldum   主演: 本尼迪克特·康伯巴奇 Benedict C... ', '2014', '英国 美国', '剧情 传记 战争 同性'),
	(152, 'https://movie.douban.com/subject/1303037/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2249048907.jpg', '喜宴', '  囍宴', 9, 347309, '中国家庭的喜怒哀乐忍', '郎... ', '1993', '中国台湾 美国', '剧情 喜剧 爱情 同性 家庭'),
	(153, 'https://movie.douban.com/subject/21360417/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2016930906.jpg', '恐怖直播', '  더 테러 라이브', 8.7, 633618, '恐怖分子的“秋菊打官司”', '李璟荣 Kyeong-y... ', '2013', '韩国', '剧情 犯罪 悬疑'),
	(154, 'https://movie.douban.com/subject/26325320/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2398141939.jpg', '血战钢锯岭', '  Hacksaw Ridge', 8.7, 763893, '优秀的战争片不会美化战场，不会粉饰死亡，不会矮化敌人，不会无视常识，最重要的，不会宣扬战争', '... ', '2016', '澳大利亚 美国', '剧情 传记 历史 战争'),
	(155, 'https://movie.douban.com/subject/1291557/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1910828286.jpg', '花样年华', '  花樣年華', 8.7, 583907, '偷情本没有这样美', '张曼玉 Ma... ', '2000', '中国香港', '剧情 爱情'),
	(156, 'https://movie.douban.com/subject/1295399/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2215886505.jpg', '七武士', '  七人の侍', 9.3, 190613, '时代悲歌', '志村乔 ... ', '1954', '日本', '动作 冒险 剧情'),
	(157, 'https://movie.douban.com/subject/1297518/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p648370300.jpg', '九品芝麻官', '', 8.7, 648426, ' ', '... ', '1994', '中国香港 中国大陆', '剧情 喜剧 古装'),
	(158, 'https://movie.douban.com/subject/10533913/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2266293606.jpg', '头脑特工队', '  Inside Out', 8.8, 590059, '愿我们都不用长大，每一座城堡都能永远存在', '罗纳尔多·德尔·卡门 Ronaldo Del Carmen  &amp;nb... ', '2015', '美国', '喜剧 动画 冒险'),
	(159, 'https://movie.douban.com/subject/1828115/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p453716305.jpg', '色，戒', '', 8.6, 765655, '假戏真情，爱欲深海', '... ', '2007', '中国台湾 中国大陆 美国 中国香港', '剧情 爱情 情色'),
	(160, 'https://movie.douban.com/subject/1302467/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p443461818.jpg', '黑客帝国3：矩阵革命', '  The Matrix Revolutions', 8.8, 434194, '不得不说，《黑客帝国》系列是商业片与科幻、哲学完美结合的典范', '莉莉·沃卓斯基 Lilly Wachowski   ... ', '2003', '美国', '动作 科幻'),
	(161, 'https://movie.douban.com/subject/1461403/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2528965424.jpg', '茶馆', '', 9.5, 130704, ' ', '蓝天野 T... 1982(中', '国大陆)', '中国大陆', '剧情 历史'),
	(162, 'https://movie.douban.com/subject/1293181/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1021883305.jpg', '惊魂记', '  Psycho', 9, 279081, '故事的反转与反转，分裂电影的始祖', '导演: 阿尔弗雷德·希区柯克 Alfred Hitchcock   主演: 安东尼·博金斯 Antho... ', '1960', '美国', '悬疑 惊悚 恐怖'),
	(163, 'https://movie.douban.com/subject/1417598/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p726839485.jpg', '电锯惊魂', '  Saw', 8.7, 513984, '真相就在眼前', '加利·艾... ', '2004', '美国', '悬疑 惊悚 恐怖'),
	(164, 'https://movie.douban.com/subject/26683290/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2395733377.jpg', '你的名字。', '  君の名は。', 8.5, 1350460, '穿越错位的时空，仰望陨落的星辰，你没留下你的名字，我却无法忘记那句“我爱你”', '上... ', '2016', '日本', '剧情 爱情 动画'),
	(165, 'https://movie.douban.com/subject/26611804/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2510081688.jpg', '三块广告牌', '  Three Billboards Outside Ebbing, Missouri', 8.7, 798107, '怼天怼地，你走后，她与世界为敌', '导演: 马丁·麦克唐纳 Martin McDonagh   主演: 弗兰西斯·麦克多蒙德 France... ', '2017', '英国 美国', '剧情 犯罪'),
	(166, 'https://movie.douban.com/subject/1793929/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2166160837.jpg', '达拉斯买家俱乐部', '  Dallas Buyers Club', 8.8, 439855, 'Jared Leto的腿比女人还美！', '导演: 让-马克·瓦雷 Jean-Marc Vallée   主演: 马修·麦康纳 Matthew McCon... ', '2013', '美国', '剧情 传记 同性'),
	(167, 'https://movie.douban.com/subject/1907966/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1867084027.jpg', '疯狂原始人', '  The Croods', 8.7, 816105, '老少皆宜，这就是好莱坞动画的魅力', '克里斯·桑德斯 Chris Sanders   主演... ', '2013', '美国', '喜剧 动画 冒险'),
	(168, 'https://movie.douban.com/subject/1291822/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p470419493.jpg', '卢旺达饭店', '  Hotel Rwanda', 8.9, 319320, '当这个世界闭上双眼，他却敞开了怀抱', '苏菲·奥... ', '2004', '英国 南非 意大利 美国', '剧情 传记 历史 战争'),
	(169, 'https://movie.douban.com/subject/25917973/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2276780256.jpg', '心迷宫', '', 8.7, 502700, '荒诞讽刺，千奇百巧，抽丝剥茧，百转千回', '王笑天 Xiaotian Wang ... ', '2014', '中国大陆', '剧情 犯罪 悬疑'),
	(170, 'https://movie.douban.com/subject/1292208/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p455677490.jpg', '上帝之城', '  Cidade de Deus', 9, 293670, '被上帝抛弃了的上帝之城', '卡迪亚·兰德 Kátia Lund  &amp;nbsp... ', '2002', '巴西 法国', '犯罪 剧情'),
	(171, 'https://movie.douban.com/subject/1578507/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792223507.jpg', '谍影重重3', '  The Bourne Ultimatum', 8.8, 405348, '像吃了苏打饼一样干脆的电影', '... ', '2007', '美国 德国 法国 英国', '动作 悬疑 惊悚'),
	(172, 'https://movie.douban.com/subject/1297574/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2504997087.jpg', '英雄本色', '', 8.6, 517608, '英雄泪短，兄弟情长 ', '张国... ', '1986', '中国香港', '剧情 动作 犯罪'),
	(173, 'https://movie.douban.com/subject/1291585/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1917567652.jpg', '风之谷', '  風の谷のナウシカ', 8.9, 345287, '动画片的圣经', '松田洋治 Y... ', '1984', '日本', '动画 奇幻 冒险'),
	(174, 'https://movie.douban.com/subject/1295409/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2597918718.jpg', '纵横四海', '  緃横四海', 8.8, 407551, '香港浪漫主义警匪动作片的巅峰之作', '张国荣 Leslie Cheung... ', '1991', '中国香港', '剧情 喜剧 动作 犯罪'),
	(175, 'https://movie.douban.com/subject/25895901/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2603364117.jpg', '海街日记', '  海街diary', 8.8, 431764, '是枝裕和的家庭习作', '长泽雅美 M... ', '2015', '日本', '剧情 家庭'),
	(176, 'https://movie.douban.com/subject/1300374/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p767586451.jpg', '绿里奇迹', '  The Green Mile', 8.9, 317414, '天使暂时离开', '... ', '1999', '美国', '犯罪 剧情 奇幻 悬疑'),
	(177, 'https://movie.douban.com/subject/10808442/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2074715729.jpg', '爱在午夜降临前', '  Before Midnight', 8.9, 384018, '所谓爱情，就是话唠一路，都不会心生腻烦，彼此嫌弃', '导演: 理查德·林克莱特 Richard Linklater   主演: 伊桑·霍克 Ethan Hawke ... ', '2013', '美国 希腊', '剧情 爱情'),
	(178, 'https://movie.douban.com/subject/1304447/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p641688453.jpg', '记忆碎片', '  Memento', 8.7, 584684, '一个针管引发的血案', '... ', '2000', '美国', '犯罪 剧情 悬疑 惊悚'),
	(179, 'https://movie.douban.com/subject/3792799/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p456666151.jpg', '岁月神偷', '  歲月神偷', 8.7, 563314, '岁月流逝，来日可追', '钟绍... ', '2010', '中国香港 中国大陆', '剧情 家庭'),
	(180, 'https://movie.douban.com/subject/1959195/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2603716224.jpg', '忠犬八公物语', '  ハチ公物語', 9.2, 188020, '养狗三日，便会对你终其一生', '井川比佐志 Hisa... ', '1987', '日本', '剧情'),
	(181, 'https://movie.douban.com/subject/24750126/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2584519452.jpg', '荒蛮故事', '  Relatos salvajes', 8.8, 430028, '始于荒诞，止于更荒诞', '导演: 达米安·斯兹弗隆 Damián Szifron   主演: 达里奥·葛兰帝内提 Darío... ', '2014', '阿根廷 西班牙', '剧情 喜剧 犯罪'),
	(182, 'https://movie.douban.com/subject/1862151/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p712241453.jpg', '疯狂的石头', '', 8.6, 794593, '中国版《两杆大烟枪》', '连晋 Teddy Lin ', '2006', '中国大陆 中国香港', '喜剧 犯罪'),
	(183, 'https://movie.douban.com/subject/25773932/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2220776342.jpg', '爆裂鼓手', '  Whiplash', 8.7, 567969, '这个世界从不善待努力的人，努力了也不一定会成功，但是知道自己在努力，就是活下去的动力', '... ', '2014', '美国', '剧情 音乐'),
	(184, 'https://movie.douban.com/subject/27622447/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2530599636.jpg', '小偷家族', '  万引き家族', 8.7, 791493, '我们组成了家', '安藤樱 Sa... ', '2018', '日本', '剧情 犯罪 家庭'),
	(185, 'https://movie.douban.com/subject/6534248/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1735642656.jpg', '无敌破坏王', '  Wreck-It Ralph', 8.7, 520327, '迪士尼和皮克斯拿错剧本的产物', '萨拉... ', '2012', '美国', '喜剧 动画 奇幻 冒险'),
	(186, 'https://movie.douban.com/subject/1293460/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1612355875.jpg', '雨中曲', '  Singin\' in the Rain', 9.1, 214340, '骨灰级歌舞片', '吉恩·凯利 Gene Kelly   主演: 吉恩·... ', '1952', '美国', '喜剧 歌舞 爱情'),
	(187, 'https://movie.douban.com/subject/2209573/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2434249040.jpg', '贫民窟的百万富翁', '  Slumdog Millionaire', 8.6, 727228, '上帝之城+猜火车+阿甘正传+开心辞典=山寨富翁', '洛芙琳·坦丹 Loveleen Tandan   主演: 戴夫... ', '2008', '英国', '剧情 爱情'),
	(188, 'https://movie.douban.com/subject/1291578/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1910895719.jpg', '冰川时代', '  Ice Age', 8.6, 595178, '松鼠才是角儿', '克里斯·韦奇 Chris Wedge   主演... ', '2002', '美国', '喜剧 动画 冒险'),
	(189, 'https://movie.douban.com/subject/1292226/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2560717825.jpg', '2001太空漫游', '  2001: A Space Odyssey', 8.9, 311104, '现代科幻电影的开山之作，最伟大导演的最伟大影片', '... ', '1968', '英国 美国', '科幻 惊悚 冒险'),
	(190, 'https://movie.douban.com/subject/1307856/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2505048077.jpg', '背靠背，脸对脸', '', 9.5, 123420, ' ', '杨亚洲 Yazhou Yang   主演: 牛振华 Zhenhua N... ', '1994', '中国大陆 中国香港', '剧情'),
	(191, 'https://movie.douban.com/subject/1307106/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p958008320.jpg', '无间道2', '  無間道II', 8.7, 458639, ' ', '曾... ', '2003', '中国香港', '剧情 犯罪 惊悚'),
	(192, 'https://movie.douban.com/subject/3011051/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p462470694.jpg', '恐怖游轮', '  Triangle', 8.5, 830132, '不要企图在重复中寻找已经失去的爱', '导演: 克里斯托弗·史密斯 Christopher Smith   主演: 梅利莎·乔治 Melissa ... ', '2009', '英国 澳大利亚', '剧情 悬疑 惊悚'),
	(193, 'https://movie.douban.com/subject/1292328/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1982176012.jpg', '东邪西毒', '  東邪西毒', 8.6, 558548, '电影诗', '林青霞 Brigitte... ', '1994', '中国香港 中国台湾', '剧情 动作 爱情 武侠 古装'),
	(194, 'https://movie.douban.com/subject/27119724/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2567198874.jpg', '小丑', '  Joker', 8.7, 974313, ' ', '导演: 托德·菲利普斯 Todd Phillips   主演: 杰昆·菲尼克斯 Joaquin Phoeni... ', '2019', '美国 加拿大', '剧情 犯罪 惊悚'),
	(195, 'https://movie.douban.com/subject/1292401/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p475600770.jpg', '真爱至上', '  Love Actually', 8.6, 715480, '爱，是个动词', '柯林... ', '2003', '英国 美国 法国', '喜剧 剧情 爱情'),
	(196, 'https://movie.douban.com/subject/4848115/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2554167519.jpg', '你看起来好像很好吃', '  おまえうまそうだな', 8.9, 323363, '感情不分食草或者食肉', '爱河... ', '2010', '日本', '剧情 动画 儿童'),
	(197, 'https://movie.douban.com/subject/1867345/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2676812053.jpg', '遗愿清单', '  The Bucket List', 8.7, 440922, '用剩余不多的时间，去燃烧整个生命', '摩根... ', '2007', '美国', '冒险 喜剧 剧情'),
	(198, 'https://movie.douban.com/subject/1292329/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p848381236.jpg', '牯岭街少年杀人事件', '  牯嶺街少年殺人事件', 8.9, 285295, '弱者送给弱者的一刀', '张... ', '1991', '中国台湾', '剧情 犯罪'),
	(199, 'https://movie.douban.com/subject/1307811/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p456676352.jpg', '魔女宅急便', '  魔女の宅急便', 8.7, 443484, '宫崎骏的电影总让人感觉世界是美好的，阳光明媚的', '佐久间玲 Re... ', '1989', '日本', '动画 奇幻 冒险'),
	(200, 'https://movie.douban.com/subject/1978709/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2549648344.jpg', '黑天鹅', '  Black Swan', 8.6, 763431, '黑暗之美', '导演: 达伦·阿罗诺夫斯基 Darren Aronofsky   主演: 娜塔莉·波特曼 Natalie... ', '2010', '美国', '剧情 惊悚'),
	(201, 'https://movie.douban.com/subject/1310177/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p456703618.jpg', '东京教父', '  東京ゴッドファーザーズ', 9, 217036, ' ', '梅垣义明 Yoshiaki Ume... ', '2003', '日本', '剧情 喜剧 动画'),
	(202, 'https://movie.douban.com/subject/24733428/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2626308994.jpg', '心灵奇旅', '  Soul', 8.7, 939533, ' ', '凯普·鲍尔斯 Kemp Powers   主演: 杰米·... ', '2020', '美国', '动画 奇幻 音乐'),
	(203, 'https://movie.douban.com/subject/27059130/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2505928032.jpg', '大佛普拉斯', '', 8.7, 435940, '人们可以登上月球，却永远无法探索人们内心的宇宙', '陈竹昇 Chu-sh... ', '2017', '中国台湾', '剧情 喜剧'),
	(204, 'https://movie.douban.com/subject/1308857/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2363208684.jpg', '可可西里', '', 8.9, 293727, '坚硬的信仰', '亓亮 Qi L... ', '2004', '中国大陆 中国香港', '剧情 犯罪'),
	(205, 'https://movie.douban.com/subject/1293908/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2170238828.jpg', '城市之光', '  City Lights', 9.3, 140222, '永远的小人物，伟大的卓别林', '弗吉尼亚·... ', '1931', '美国', '喜剧 剧情 爱情'),
	(206, 'https://movie.douban.com/subject/1291870/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2353324612.jpg', '雨人', '  Rain Man', 8.7, 392784, '生活在自己的世界里，也可以让周围的人显得可笑和渺小', '导演: 巴瑞·莱文森 Barry Levinson   主演: 达斯汀·霍夫曼 Dustin Hoffman ... ', '1988', '美国', '剧情'),
	(207, 'https://movie.douban.com/subject/1309163/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p483604864.jpg', '恋恋笔记本', '  The Notebook', 8.6, 649240, '爱情没有那么多借口，如果不能圆满，只能说明爱的不够 ', '... ', '2004', '美国', '剧情 爱情'),
	(208, 'https://movie.douban.com/subject/3075287/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p988260245.jpg', '源代码', '  Source Code', 8.5, 812100, '邓肯·琼斯继《月球》之后再度奉献出一部精彩绝伦的科幻佳作', '... ', '2011', '美国 加拿大', '科幻 悬疑 惊悚'),
	(209, 'https://movie.douban.com/subject/4739952/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1505312273.jpg', '初恋这件小事', '  สิ่งเล็กเล็กที่เรียกว่า...รัก', 8.5, 959877, '黑小鸭速效美白记', '华森·波克彭... ', '2010', '泰国', '剧情 喜剧 爱情'),
	(210, 'https://movie.douban.com/subject/25980443/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2421855655.jpg', '海边的曼彻斯特', '  Manchester by the Sea', 8.6, 508429, '我们都有权利不与自己的过去和解', '导演: 肯尼斯·罗纳根 Kenneth Lonergan   主演: 卡西·阿弗莱克 Casey Affle... ', '2016', '美国', '剧情 家庭'),
	(211, 'https://movie.douban.com/subject/1296909/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2399597512.jpg', '虎口脱险', '  La grande vadrouille', 8.9, 247714, '永远看不腻的喜剧', '导演: 杰拉尔·乌里 Gérard Oury   主演: 路易·德·菲耐斯 Louis de Funès... ', '1966', '法国 英国', '喜剧 战争'),
	(212, 'https://movie.douban.com/subject/1302827/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792257137.jpg', '人工智能', '  Artificial Intelligence: AI', 8.7, 431051, '对爱的执着，可以超越一切', '导演: 史蒂文·斯皮尔伯格 Steven Spielberg   主演: 海利·乔·奥斯蒙 Haley... ', '2001', '美国 英国', '剧情 科幻'),
	(213, 'https://movie.douban.com/subject/5300054/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2549558913.jpg', '波西米亚狂想曲', '  Bohemian Rhapsody', 8.6, 583254, ' ', '本·哈... ', '2018', '英国 美国', '剧情 传记 同性 音乐'),
	(214, 'https://movie.douban.com/subject/1293318/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2237136718.jpg', '萤火虫之墓', '  火垂るの墓', 8.7, 396048, '幸福是生生不息，却难以触及的远 ', '志乃原良子 ', '1988', '日本', '动画 剧情 战争'),
	(215, 'https://movie.douban.com/subject/1303394/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2570901292.jpg', '青蛇', '', 8.6, 507387, '人生如此，浮生如斯谁人言，花彼岸，此生情长意短谁都是不懂爱的罢了', '... ', '1993', '中国香港 中国大陆', '剧情 爱情 奇幻 古装'),
	(216, 'https://movie.douban.com/subject/1291844/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1910909085.jpg', '终结者2：审判日', '  Terminator 2: Judgment Day', 8.8, 331511, '少见的超越首部的续集，动作片中的经典', '导演: 詹姆斯·卡梅隆 James Cameron   主演: 阿诺·施瓦辛格 Arnold Schwarz... ', '1991', '美国 法国', '动作 科幻'),
	(217, 'https://movie.douban.com/subject/1291879/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1598883511.jpg', '罗生门', '  羅生門', 8.8, 303633, '人生的N种可能性', '京町子 ... ', '1950', '日本', '剧情 犯罪 悬疑'),
	(218, 'https://movie.douban.com/subject/3592854/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2236181653.jpg', '疯狂的麦克斯4：狂暴之路', '  Mad Max: Fury Road', 8.7, 510610, '“多么美好的一天！”轰轰轰砰咚，啪哒哒哒轰隆隆，磅~', '查理兹·塞... ', '2015', '澳大利亚 美国', '动作 科幻 冒险'),
	(219, 'https://movie.douban.com/subject/1292287/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1421018669.jpg', '新龙门客栈', '  新龍門客棧', 8.7, 428776, '嬉笑怒骂，调风动月', '林青霞 Brigitte ... ', '1992', '中国香港 中国大陆', '动作 爱情 武侠 古装'),
	(220, 'https://movie.douban.com/subject/26787574/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2507709428.jpg', '奇迹男孩', '  Wonder', 8.6, 539209, '世界不完美，爱会有奇迹', '导演: 斯蒂芬·卓博斯基 Stephen Chbosky   主演: 雅各布·特伦布莱 Jacob Tr... ', '2017', '美国 中国香港', '剧情 儿童 家庭'),
	(221, 'https://movie.douban.com/subject/1300117/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2195672555.jpg', '千钧一发', '  Gattaca', 8.8, 285302, '一部能引人思考的科幻励志片', '乌玛... ', '1997', '美国', '剧情 科幻 惊悚'),
	(222, 'https://movie.douban.com/subject/26430107/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2457609817.jpg', '二十二', '', 8.7, 285364, '有一些东西不应该被遗忘', '导演: 郭柯 Ke Guo   主演:  ', '2015', '中国大陆', '纪录片'),
	(223, 'https://movie.douban.com/subject/1438652/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1086394013.jpg', '无耻混蛋', '  Inglourious Basterds', 8.6, 459164, '昆汀同学越来越变态了，比北野武还杜琪峰', '... ', '2009', '德国 美国', '剧情 犯罪'),
	(224, 'https://movie.douban.com/subject/1959877/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2627847859.jpg', '崖上的波妞', '  崖の上のポニョ', 8.6, 474698, ' ', '土井洋辉 Hir... ', '2008', '日本', '动画 奇幻 冒险'),
	(225, 'https://movie.douban.com/subject/25807345/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2187896734.jpg', '彗星来的那一夜', '  Coherence', 8.5, 554641, '小成本大魅力', '导演: 詹姆斯·沃德·布柯特 James Ward Byrkit   主演: 艾米丽·芭尔多尼 Em... ', '2013', '美国 英国', '科幻 悬疑 惊悚'),
	(226, 'https://movie.douban.com/subject/1304141/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p443461390.jpg', '黑客帝国2：重装上阵', '  The Matrix Reloaded', 8.7, 393927, '一个精彩的世界观正在缓缓建立', '莉莉·沃卓斯基 Lilly Wachowski   ... ', '2003', '美国', '动作 科幻'),
	(227, 'https://movie.douban.com/subject/25724855/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2259715855.jpg', '房间', '  Room', 8.8, 360821, '被偷走的岁月，被伤害的生命，被禁锢的灵魂，终将被希望和善意救赎', '导演: 伦尼·阿伯拉罕森 Lenny Abrahamson   主演: 布丽·拉尔森 Brie Larson... ', '2015', '爱尔兰 加拿大 英国 美国', '剧情 家庭'),
	(228, 'https://movie.douban.com/subject/1428175/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1244017073.jpg', '血钻', '  Blood Diamond', 8.7, 368094, '每个美丽事物背后都是滴血的现实', '导演: 爱德华·兹威克 Edward Zwick   主演: 莱昂纳多·迪卡普里奥 Leonardo ... ', '2006', '美国 德国 英国', '剧情 惊悚 冒险'),
	(229, 'https://movie.douban.com/subject/2222996/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2375245718.jpg', '步履不停', '  歩いても 歩いても', 8.8, 269791, '日本的家庭电影已经是世界巅峰了，步履不停是巅峰中的佳作', '夏川结衣 Yu... ', '2008', '日本', '剧情 家庭'),
	(230, 'https://movie.douban.com/subject/1419936/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p792282381.jpg', '战争之王', '  Lord of War', 8.7, 355815, '做一颗让别人需要你的棋子', '... ', '2005', '法国 德国 美国', '剧情 犯罪'),
	(231, 'https://movie.douban.com/subject/1291992/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1910924635.jpg', '末路狂花', '  Thelma &amp; Louise', 8.9, 237520, '没有了退路，只好飞向自由', '苏... ', '1991', '美国 英国 法国', '犯罪 剧情 惊悚'),
	(232, 'https://movie.douban.com/subject/1293964/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2351134499.jpg', '魂断蓝桥', '  Waterloo Bridge', 8.8, 269006, '中国式内在的美国电影', '罗伯特·... ', '1940', '美国', '剧情 爱情 战争'),
	(233, 'https://movie.douban.com/subject/25934014/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2395517414.jpg', '爱乐之城', '  La La Land', 8.4, 859366, ' ', '... ', '2016', '美国', '剧情 爱情 歌舞'),
	(234, 'https://movie.douban.com/subject/34874432/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2868462052.jpg', '花束般的恋爱', '  花束みたいな恋をした', 8.6, 568475, ' ', '有村架纯 Kasu... ', '2021', '日本', '剧情 爱情'),
	(235, 'https://movie.douban.com/subject/25864085/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2280097442.jpg', '火星救援', '  The Martian', 8.5, 702865, ' ', '杰西卡... ', '2015', '英国 美国 匈牙利 约旦', '剧情 科幻 冒险'),
	(236, 'https://movie.douban.com/subject/1308767/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p667644866.jpg', '谍影重重2', '  The Bourne Supremacy', 8.7, 340407, '谁说王家卫镜头很晃？', '... ', '2004', '美国 德国', '动作 悬疑 惊悚'),
	(237, 'https://movie.douban.com/subject/1307394/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2215102596.jpg', '千年女优', '  千年女優', 8.8, 254232, '爱情是一场没有尽头的虚幻追逐', '小山茉美 Mam... ', '2001', '日本', '动画 剧情 爱情'),
	(238, 'https://movie.douban.com/subject/2051007/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p719849995.jpg', '哈利·波特与死亡圣器(上)', '  Harry Potter and the Deathly Hallows: Part 1', 8.5, 547489, '最忠于原著的一部', '导演: 大卫·叶茨 David Yates   主演: 丹尼尔·雷德克里夫 Daniel Radcliffe... ', '2010', '英国 美国', '奇幻 冒险'),
	(239, 'https://movie.douban.com/subject/1295865/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2797313535.jpg', '燃情岁月', '  Legends of the Fall', 8.8, 278513, '传奇，不是每个人都可以拥有', '安东... ', '1994', '美国', '剧情 爱情 战争 西部'),
	(240, 'https://movie.douban.com/subject/1297880/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575337180.jpg', '芙蓉镇', '', 9.2, 125144, ' ', '郑在石... ', '1987', '中国大陆', '剧情 爱情'),
	(241, 'https://movie.douban.com/subject/1305690/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2525770523.jpg', '阿飞正传', '  阿飛正傳', 8.5, 490949, '王家卫是一种风格，张国荣是一个代表', '张曼玉 Maggie C... ', '1990', '中国香港', '犯罪 剧情 爱情'),
	(242, 'https://movie.douban.com/subject/1304102/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p1597183981.jpg', '谍影重重', '  The Bourne Identity', 8.6, 410642, '哗啦啦啦啦，天在下雨，哗啦啦啦啦，云在哭泣……找自己', '弗兰卡·波坦... ', '2002', '美国 德国 捷克', '动作 悬疑 惊悚'),
	(243, 'https://movie.douban.com/subject/3552028/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2577248102.jpg', '弱点', '  The Blind Side', 8.7, 293958, '拍掉身上的悲伤，从今天开始重新踏上追梦之旅', '导演: 约翰·李·汉考克 John Lee Hancock   主演: 桑德拉·布洛克 Sandra Bu... ', '2009', '美国', '剧情 家庭 传记 运动'),
	(244, 'https://movie.douban.com/subject/6874403/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2250287733.jpg', '再次出发之纽约遇见你', '  Begin Again', 8.6, 415615, '爱我就给我看你的播放列表', '马克... ', '2013', '美国', '喜剧 爱情 音乐'),
	(245, 'https://movie.douban.com/subject/2213597/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1140984198.jpg', '朗读者', '  The Reader', 8.6, 443917, '当爱情跨越年龄的界限，它似乎能变得更久远一点，成为一种责任，一种水到渠成的相濡以沫 ', '导演: 史蒂芬·戴德利 Stephen Daldry   主演: 凯特·温丝莱特 Kate Winslet ... ', '2008', '美国 德国', '剧情 爱情'),
	(246, 'https://movie.douban.com/subject/1760622/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2571500223.jpg', '香水', '  Perfume: The Story of a Murderer', 8.5, 530945, '一个单凭体香达到高潮的男人', '艾伦·瑞克... ', '2006', '德国 法国 西班牙 美国 比利时', '剧情 犯罪 奇幻'),
	(247, 'https://movie.douban.com/subject/3443389/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2559581324.jpg', '海洋', '  Océans', 9.1, 154145, '大海啊，不全是水', '雅克·克鲁奥德 Jacques Cluzaud   主演:... ', '2009', '法国 瑞士 西班牙 美国 阿联酋 摩纳哥', '纪录片'),
	(248, 'https://movie.douban.com/subject/1937946/', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2079334286.jpg', '穿越时空的少女', '  時をかける少女', 8.6, 371229, '爱上未来的你 ', '石田卓也 Takuya... ', '2006', '日本', '剧情 爱情 科幻 动画'),
	(249, 'https://movie.douban.com/subject/5908478/', 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p824590592.jpg', '我爱你', '  그대를 사랑합니다', 9, 160963, '你要相信，这世上真的有爱存在，不管在什么年纪 ', '李顺载 Soon-jae... ', '2011', '韩国', '剧情 爱情'),
	(250, 'https://movie.douban.com/subject/2363506/', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2197897857.jpg', '地球上的星星', '  Taare Zameen Par', 8.9, 199073, '天使保护事件始末', '阿... ', '2007', '印度', '剧情 儿童 家庭');
/*!40000 ALTER TABLE `toptwo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
