/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : ab

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 17/01/2022 21:00:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (1, 'Gallier, Jean H.');
INSERT INTO `author` VALUES (2, 'Williams, Gareth');
INSERT INTO `author` VALUES (3, 'Nicholson, W. Keith');
INSERT INTO `author` VALUES (4, 'Horowitz, Ellis.');
INSERT INTO `author` VALUES (5, 'Kreyszig, Erwin.');
INSERT INTO `author` VALUES (6, 'O’Neil, Peter V');
INSERT INTO `author` VALUES (7, 'Stanimirovic, Ivan.');
INSERT INTO `author` VALUES (8, 'Floyd, Thomas L.');
INSERT INTO `author` VALUES (9, 'Comer, Douglas.');
INSERT INTO `author` VALUES (10, 'PAM (Conference)');
INSERT INTO `author` VALUES (11, 'Magued Iskander.');
INSERT INTO `author` VALUES (12, 'Montgomery, Douglas C.');
INSERT INTO `author` VALUES (13, 'Severini');
INSERT INTO `author` VALUES (14, 'Thomas Alan');
INSERT INTO `author` VALUES (15, 'Ross, Sheldon M.');
INSERT INTO `author` VALUES (16, 'Smith, Bruce.');
INSERT INTO `author` VALUES (17, 'Roth, Charles H.');
INSERT INTO `author` VALUES (18, 'Donzellini, Giuliano.');
INSERT INTO `author` VALUES (19, 'Elmasri, Ramez');
INSERT INTO `author` VALUES (20, '陳祥輝');
INSERT INTO `author` VALUES (21, 'Teorey, Toby J.');
INSERT INTO `author` VALUES (22, 'Karayiannis, Christos.');
INSERT INTO `author` VALUES (23, 'Kromann, Frank M.');
INSERT INTO `author` VALUES (24, '葉建榮');
INSERT INTO `author` VALUES (25, 'LinkLevitin, Anany.');
INSERT INTO `author` VALUES (26, 'Silberschatz, Abraham.');
INSERT INTO `author` VALUES (27, 'Tanenbaum, Andrew S');
INSERT INTO `author` VALUES (28, 'Patterson, David A.');
INSERT INTO `author` VALUES (29, 'Antonucci, Domenic.');
INSERT INTO `author` VALUES (30, 'Charbonneau, Paul');
INSERT INTO `author` VALUES (31, 'Kranz, Maciej');
INSERT INTO `author` VALUES (32, 'Patterson, Josh.');
INSERT INTO `author` VALUES (33, 'Hamacher, V. Carl.');
INSERT INTO `author` VALUES (34, 'Paola Lecca');
INSERT INTO `author` VALUES (35, 'Dan Tulpan');
INSERT INTO `author` VALUES (36, 'Kanagasabai Rajaraman');
INSERT INTO `author` VALUES (37, 'Levin, Barbara B.');
INSERT INTO `author` VALUES (38, 'HarperCollins Publishers');
INSERT INTO `author` VALUES (39, '朱宏章');
INSERT INTO `author` VALUES (40, '舒國治');
INSERT INTO `author` VALUES (41, 'Singh,Kanwer');
INSERT INTO `author` VALUES (42, '蕭富仁 ');
INSERT INTO `author` VALUES (43, '黃竫蕙');
INSERT INTO `author` VALUES (44, '馬景賢');
INSERT INTO `author` VALUES (45, '于之琳');
INSERT INTO `author` VALUES (46, '彭作奎 ');
INSERT INTO `author` VALUES (47, '李忠憲 ');
INSERT INTO `author` VALUES (48, '吳漢雄');
INSERT INTO `author` VALUES (49, 'Lebrument, Chantal.');
INSERT INTO `author` VALUES (50, 'Elmasri, Ramez.');
INSERT INTO `author` VALUES (81, 'kiara');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `publish_id_b` int NOT NULL,
  `category_id_b` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `publish_year` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `fk_books_category_1`(`category_id_b`) USING BTREE,
  INDEX `fk_book_publisher_1`(`publish_id_b`) USING BTREE,
  CONSTRAINT `fk_book_publisher_1` FOREIGN KEY (`publish_id_b`) REFERENCES `publisher` (`publisher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_books_category_1` FOREIGN KEY (`category_id_b`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 1, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811206399 (v. 1 ', '2020', '2');
INSERT INTO `book` VALUES (2, 4, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811207716 (v. 1 ', '2020', '1');
INSERT INTO `book` VALUES (3, 7, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811206405 (v. 1 ', '2020', '1');
INSERT INTO `book` VALUES (4, 4, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811206412 (v. 1 ', '2020', '1');
INSERT INTO `book` VALUES (5, 4, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811216565 (v. 2 ', '2020', '1');
INSERT INTO `book` VALUES (6, 4, 4, 'Linear algebra and optimization with applications to machine learning / Jean Gallier, Jocelyn Quaint', 'Gallier, Jean H.', '9789811216589 (v. 2 ', '2020', '3');
INSERT INTO `book` VALUES (7, 5, 4, 'Linear algebra with applications / Gareth Williams.', 'Williams, Gareth, 1937-', '9781284120097 (hbk.)', '2019', '1');
INSERT INTO `book` VALUES (8, 5, 4, 'Linear algebra with applications / Gareth Williams.', 'Williams, Gareth, 1937-', '1284120090 (hbk.)', '2019', '1');
INSERT INTO `book` VALUES (9, 6, 4, '線性代數= Linear algebra with applications, 8E/ Gareth Williams作;劉霈譯', '威廉斯 (Williams, Gareth)', '9789865647032 (平裝)', '2015', '1');
INSERT INTO `book` VALUES (10, 6, 4, 'Linear algebra with applications / W. Keith Nicholson', 'Nicholson, W. Keith.', '9781259072994 (inter', '2013', '1');
INSERT INTO `book` VALUES (11, 8, 4, 'Linear algebra with applications / W. Keith Nicholson', 'Nicholson, W. Keith.', '1259072991 (internat', '2013', '1');
INSERT INTO `book` VALUES (12, 1, 4, 'Linear algebra with applications / W. Keith Nicholson', 'Nicholson, W. Keith.', '9780070401099', '2013', '1');
INSERT INTO `book` VALUES (13, 1, 4, 'Linear algebra with applications / W. Keith Nicholson', 'Nicholson, W. Keith.', '0070401098(', '2013', '1');
INSERT INTO `book` VALUES (14, 1, 4, 'LinkLinear algebra with applications / Gareth Williams.', 'Williams, Gareth, 1937-', '9780763782481 (hbk.)', '2011', '1');
INSERT INTO `book` VALUES (15, 9, 4, 'LinkLinear algebra with applications / Gareth Williams.', 'Williams, Gareth, 1937-', '0763782483 (ibid.)', '2011', '3');
INSERT INTO `book` VALUES (16, 10, 5, 'Fundamentals of data structures in C / Ellis Horowitz, Sartaj Sahni, Susan Anderson-Freed.', 'Horowitz, Ellis.', '9780929306407 (pbk.)', '2008', '1');
INSERT INTO `book` VALUES (17, 28, 5, 'Fundamentals of data structures in C / Ellis Horowitz, Sartaj Sahni, Susan Anderson-Freed.', 'Horowitz, Ellis.', '0929306406 (pbk.)', '2008', '1');
INSERT INTO `book` VALUES (18, 11, 5, 'Fundamentals of data structures in C / Ellis Horowitz, Sartaj Sahni,Susan Anderson-Freed.', 'Horowitz, Ellis', '0716782502 hbk.', '1993', '1');
INSERT INTO `book` VALUES (19, 11, 5, 'Advanced engineering mathematics / Erwin Kreyszig', 'Kreyszig, Erwin.', '9780470074466(intern', '2009', '1');
INSERT INTO `book` VALUES (20, 12, 4, 'Advanced engineering mathematics / Erwin Kreyszig ; in collaboration with Herbert Kreyszig, Edward J', 'Kreyszig, Erwin.', '9780470646137 (pbk.)', '2011', '1');
INSERT INTO `book` VALUES (21, 13, 4, '工程數學 / Peter V. O’Neil著 ; 黃孟槺, 郭姿君編譯.', '歐尼爾 (O’Neil, Peter V.) 著', '9789579282048 (平裝) ', '2018', '1');
INSERT INTO `book` VALUES (22, 13, 4, 'LinkAdvanced analytic methods in science and engineering / edited by Ivan Stanimirovic.', 'Stanimirovic, Ivan.', '9781773610726 (hbk.)', '2018', '3');
INSERT INTO `book` VALUES (23, 14, 4, '工程數學 / 吳漢雄編著', '吳漢雄', '9576367204 平裝', '1994', '1');
INSERT INTO `book` VALUES (24, 1, 5, 'Advanced engineering mathematics / Peter V. O’Neil.', 'O’Neil, Peter V.', '1111427429 (pbk. : i', '2012', '1');
INSERT INTO `book` VALUES (25, 15, 4, 'Advanced engineering mathematics / Peter V. O’Neil.', 'O’Neil, Peter V.', '9780534401306', '2012', '1');
INSERT INTO `book` VALUES (26, 15, 4, '數位邏輯基礎 / 佛勞德(Thomas L. Floyd)著 ; 李伯成,侯伯亨,劉沁侯譯', '佛勞德 (Floyd, Thomas L.)', '9576526728 ', '1994', '1');
INSERT INTO `book` VALUES (27, 16, 4, 'Digital fundamentals / Thomas L. Floyd.', 'Floyd, Thomas L.', '1292075988 (pbk.) :', '2015', '1');
INSERT INTO `book` VALUES (28, 17, 4, 'Digital fundamentals / Thomas L. Floyd.', 'Floyd, Thomas L.', '9781292075983 (pbk.)', '2015', '1');
INSERT INTO `book` VALUES (29, 18, 4, '數位邏輯設計 = Digital fundamentals with VHDL / Thomas L. Floyd著 ; 謝昌勳等編譯.', '佛勞德 (Floyd, Thomas L.) 著', '9789864126293 (平裝) :', '2009', '1');
INSERT INTO `book` VALUES (30, 18, 4, 'Digital fundamentals / Thomas L. Floyd.', 'Floyd, Thomas L.', '9780138146467 (pbk. ', '2009', '1');
INSERT INTO `book` VALUES (31, 17, 4, 'Digital fundamentals / Thomas L. Floyd.', 'Floyd, Thomas L.', '0131972553 (pbk. : P', '2006', '1');
INSERT INTO `book` VALUES (32, 15, 4, '數位邏輯 : 使用VHDL / 湯瑪斯.佛勞德(Thomas L. Floyd)著 ; 陳鴻進等譯', '佛勞德 (Floyd, Thomas L.)', '9572143662 平裝', '2004', '1');
INSERT INTO `book` VALUES (33, 15, 4, 'The inventions of Louis Pouzin [electronic resource] : one of the fathers of the Internet / by Chant', 'Lebrument, Chantal.', '9783030348359 (paper', '2020', '2');
INSERT INTO `book` VALUES (34, 14, 5, 'Computer networks and internets / Douglas E. Comer.', 'Comer, Douglas.', '1292061170 (pbk.)', '2015', '2');
INSERT INTO `book` VALUES (35, 1, 5, 'Computer networks and internets / Douglas E. Comer.', 'Comer, Douglas.', '9781292061177 (pbk.)', '2015', '1');
INSERT INTO `book` VALUES (36, 15, 5, 'Passive and active measurement [electronic resource] : 16th International Conference, PAM 2015, New ', 'PAM (Conference) (16th : 2015 : New York, N.Y.).', '9783319155081 (paper', '2015', '1');
INSERT INTO `book` VALUES (37, 14, 5, 'Computer networks and Internets / Douglas E. Comer.', 'Comer, Douglas.', '0136061273 (hbk.)', '2009', '1');
INSERT INTO `book` VALUES (38, 15, 5, 'Computer networks and Internets / Douglas E. Comer.', 'Comer, Douglas.', '9780136061274 (hbk.)', '2009', '1');
INSERT INTO `book` VALUES (39, 15, 5, '電腦與網際網路 = Computer networks and internets : with internet applications / 道格拉斯.康門(Douglas E. Comer)原著', '科默 (Comer, Douglas) 原著', '9572149784 平裝 ', '2005', '1');
INSERT INTO `book` VALUES (40, 1, 5, 'Computer networks and internets : with Internet applications / Douglas E. Comer', 'Comer, Douglas.', '0131433512 hbk. ', '2004', '1');
INSERT INTO `book` VALUES (41, 1, 5, '電腦及網際網路 / 科默(Douglas E. Comer)著 ; 鄭王駿,鄧姚文編譯', '科默 (Comer, Douglas)', '9572137646 平裝', '2003', '1');
INSERT INTO `book` VALUES (42, 8, 5, 'Computer networks and internets : with Internet applications / Douglas E. Comer', 'Comer, Douglas.', '0130935816 pbk. ', '2001', '1');
INSERT INTO `book` VALUES (43, 19, 5, 'Computer networks and internets / Douglas E. Comer', 'Comer, Douglas.', '0130836176 :', '1999', '1');
INSERT INTO `book` VALUES (44, 19, 5, 'Applied statistics and probability for engineers / Douglas C. Montgomery, George C. Runger.', 'Montgomery, Douglas C.', '9781118744123 (pbk.)', '2014', '1');
INSERT INTO `book` VALUES (45, 19, 5, 'Applied statistics and probability for engineers / Douglas C. Montgomery, George C. Runger.', 'Montgomery, Douglas C.', '471745898', '2007', '1');
INSERT INTO `book` VALUES (46, 1, 5, 'Applied statistics and probability for engineers / Douglas C. Montgomery, George C. Runger', 'Montgomery, Douglas C.', '0471170275 acid-free', '1999', '1');
INSERT INTO `book` VALUES (47, 20, 5, 'Analytic methods in sports : using mathematics and statistics to understand data from baseball, foot', 'Severini, Thomas A. (Thomas Alan), 1959-', '9780367469382 (pbk.)', '2020', '1');
INSERT INTO `book` VALUES (48, 21, 4, 'Analytic methods in sports : using mathematics and statistics to understand data from baseball, foot', 'Severini, Thomas A. (Thomas Alan), 1959-', '0367469383 (pbk.)', '2020', '1');
INSERT INTO `book` VALUES (49, 22, 4, 'Analytic methods in sports : using mathematics and statistics to understand data from baseball, foot', 'Severini, Thomas A. (Thomas Alan), 1959-', '9780367252076 (hbk.)', '2020', '1');
INSERT INTO `book` VALUES (50, 22, 4, 'Introduction to probability and statistics for engineers and scientists / Sheldon M. Ross.', 'Ross, Sheldon M.', '9780123948113 (hbk.)', '2014', '2');
INSERT INTO `book` VALUES (51, 23, 4, 'Raspberry Pi assembly language : raspbian hands on guide / Bruce Smith.', 'Smith, Bruce.', '9781492135289 (pbk.)', '2013', '1');
INSERT INTO `book` VALUES (52, 14, 5, 'Digital systems design using VHDL / Charles H. Roth, Lizy Kurian John.', 'Roth, Charles H.', '0534384625 (hbk.) ', '2008', '1');
INSERT INTO `book` VALUES (53, 24, 5, 'Digital systems design using VHDL / Charles H. Roth, Lizy Kurian John.', 'Roth, Charles H.', '9780534384623 (hbk.)', '2008', '1');
INSERT INTO `book` VALUES (54, 13, 5, 'Introduction to digital systems design [electronic resource] / by Giuliano Donzellini ... [et al.].', 'Donzellini, Giuliano.', '9783319928036 (paper', '2019', '1');
INSERT INTO `book` VALUES (55, 13, 5, 'Fundamentals of database systems, 5th ed. 中文', '艾爾瑪斯瑞 (Elmasri, Ramez) 原著', '9789861546551 平裝 ', '2008', '1');
INSERT INTO `book` VALUES (56, 20, 5, '資料庫系統理論與實務 = Fundamentals of database systems, principles and practices / 陳祥輝作', '陳祥輝 ', '9789574425730 平裝', '2009', '1');
INSERT INTO `book` VALUES (57, 1, 5, 'Fundamentals of database systems / Ramez Elmasri, Shamkant B. Navathe.', 'Elmasri, Ramez.', '032141506X (Int’l ed', '2007', '1');
INSERT INTO `book` VALUES (58, 20, 5, 'Fundamentals of database systems / Ramez Elmasri, Shamkant B. Navathe.', 'Elmasri, Ramez.', '0321369572 (pbk.)', '2007', '1');
INSERT INTO `book` VALUES (59, 14, 5, 'Database modeling & design [electronic resource] : logical design / Tobey Teorey, Sam Lightstone, To', 'Teorey, Toby J.', '9780126853520', '2005', '1');
INSERT INTO `book` VALUES (60, 18, 5, 'Database modeling & design [electronic resource] : logical design / Tobey Teorey, Sam Lightstone, To', 'Teorey, Toby J.', '0126853525(', '2005', '1');
INSERT INTO `book` VALUES (61, 25, 5, '資料庫系統原理 / Ramez Elmasri, Shamkant B. Navathe著 ; 藍中賢,吳郁瑩譯', '艾爾瑪斯瑞 (Elmasri, Ramez) 著', '9861542205 平裝', '2005', '1');
INSERT INTO `book` VALUES (62, 25, 5, 'Fundamentals of database systems / Ramez Elmasri, Shamkant B. Navathe.', 'Elmasri, Ramez19', '0321122267 hbk', '2004', '1');
INSERT INTO `book` VALUES (63, 26, 5, 'Web-based projects that rock the class [electronic resource] : build fully-functional web apps and l', 'Karayiannis, Christos.', '9781484244623 (paper', '2019', '1');
INSERT INTO `book` VALUES (64, 18, 5, 'Beginning PHP and MySQL [electronic resource] : from novice to professional / by Frank M. Kromann.', 'Kromann, Frank M.', '9781430260431 (paper', '2018', '1');
INSERT INTO `book` VALUES (65, 18, 5, 'PHP與MySQL網站規劃管理與應用/ 葉建榮著', '葉建榮', '9789863753995 (平裝) ', '2015', '1');
INSERT INTO `book` VALUES (66, 18, 5, 'Introduction to the design & analysis of algorithms / Anany Levitin ; International edition contribu', 'LinkLevitin, Anany.', '9780273764113 (pbk.)', '2012', '1');
INSERT INTO `book` VALUES (67, 18, 5, 'Introduction to the design & analysis of algorithms / Anany Levitin ; International edition contribu', 'LinkLevitin, Anany.', '027376411X (pbk.)', '2012', '1');
INSERT INTO `book` VALUES (68, 2, 5, 'Introduction to the design & analysis of algorithms / Anany Levitin.', 'Levitin, Anany.', '9780132316811 (pbk.)', '2012', '1');
INSERT INTO `book` VALUES (69, 27, 5, 'Introduction to the design & analysis of algorithms / Anany Levitin.', 'Levitin, Anany.', '0132316811 (pbk.', '2012', '1');
INSERT INTO `book` VALUES (70, 27, 5, 'Operating system concepts / Abraham Silberschatz, Peter Baer Galvin, Greg Gagne.', 'Silberschatz, Abraham.', '9781119586166 (pbk.)', '2019', '1');
INSERT INTO `book` VALUES (71, 28, 5, 'Operating system concepts with Java / Abraham Silberschatz, Peter Baer Galvin, Greg Gagne.', 'Silberschatz, Abraham.', '9780470398791 (pbk.)', '2011', '1');
INSERT INTO `book` VALUES (72, 29, 5, 'Operating system concepts, 8th ed.. 中文', '席爾柏柴斯 (Silberschatz, Abraham) ', '9789574835935 平裝', '2010', '1');
INSERT INTO `book` VALUES (73, 29, 5, 'Innovations in e-learning, instruction technology, assessment, and engineering education / edited by', 'Magued Iskander.', '1402062613 (hbk.)', '2007', '1');
INSERT INTO `book` VALUES (74, 28, 5, 'Innovations in e-learning, instruction technology, assessment, and engineering education / edited by', 'Magued Iskander.', '9781402062612 (hbk.)', '2007', '1');
INSERT INTO `book` VALUES (75, 28, 5, 'Operating system concepts with Java / Abraham Silberschatz, Peter Baer Galvin, Greg Gagne.', 'Silberschatz, Abraham.', '9780471769071 (hbk.)', '2007', '1');
INSERT INTO `book` VALUES (76, 30, 5, 'LinkOperating system concepts with Java / Abraham Silverschatz, Peter Baer Galvin, Greg Gagne.', 'Silberschatz, Abraham', '0471489050 hbk.', '2004', '1');
INSERT INTO `book` VALUES (77, 31, 5, 'Structured computer organization,3rd ed.. 中文', '塔涅鮑姆 (Tanenbaum, Andrew S., 1944-', '9572205889 平裝 ', '1993', '1');
INSERT INTO `book` VALUES (78, 27, 5, 'Computer organization and design : the hardware/software interface / David A. Patterson, John L. Hen', 'Patterson, David A.', '9780128122754 (pbk.)', '2018', '1');
INSERT INTO `book` VALUES (79, 2, 5, 'The cyber risk handbook : creating and measuring effective cybersecurity capabilities / Domenic Anto', 'Antonucci, Domenic.', '9781119308805 (hbk.)', '2017', '1');
INSERT INTO `book` VALUES (80, 32, 5, 'Natural complexity : a modeling handbook / Paul Charbonneau.', 'Charbonneau, Paul, 1961-', '9780691170350 (pbk.)', '2017', '1');
INSERT INTO `book` VALUES (81, 32, 5, 'Natural complexity : a modeling handbook / Paul Charbonneau.', 'Charbonneau, Paul, 1961-', '9780691176840 (hbk.)', '2017', '1');
INSERT INTO `book` VALUES (82, 27, 5, 'Building the Internet of things : implement new business models, disrupt competitors, and transform ', 'Kranz, Maciej, 1964-', '9781119285663 (hbk.)', '2017', '1');
INSERT INTO `book` VALUES (83, 27, 5, 'Building the Internet of things : implement new business models, disrupt competitors, and transform ', 'Kranz, Maciej, 1964-', '1119285666 (hbk.)', '2017', '1');
INSERT INTO `book` VALUES (84, 33, 5, 'Deep learning : a practitioner’s approach / Josh Patterson and Adam Gibson.', 'Patterson, Josh.', '1491914254 (pbk.)', '2017', '1');
INSERT INTO `book` VALUES (85, 33, 5, 'Deep learning : a practitioner’s approach / Josh Patterson and Adam Gibson.', 'Patterson, Josh.', '1491914254 (pbk.)', '2017', '1');
INSERT INTO `book` VALUES (86, 8, 5, 'Computer organization and embedded systems / Carl Hamacher ... [et al.].', 'Hamacher, V. Carl.', '9780071089005 (inter', '2012', '1');
INSERT INTO `book` VALUES (87, 8, 5, 'Computer organization and embedded systems / Carl Hamacher ... [et al.].', 'Hamacher, V. Carl.', '0071089004 ', '2012', '1');
INSERT INTO `book` VALUES (88, 34, 5, 'Systemic approaches in bioinformatics and computational systems biology : recent advances / [edited ', 'Paola Lecca, Dan Tulpan, and Kanagasabai Rajaraman.', '9781613504352 (hbk.)', '2012', '1');
INSERT INTO `book` VALUES (89, 8, 5, 'Leading technology-rich schools : award-winning models for success / Barbara B. Levin, Lynne Schrum ', 'Levin, Barbara B.', '9780807753354 (hbk.)', '2012', '1');
INSERT INTO `book` VALUES (90, 3, 5, 'Leading technology-rich schools : award-winning models for success / Barbara B. Levin, Lynne Schrum ', 'Levin, Barbara B.', '0807753351 (hbk.)', '2012', '1');
INSERT INTO `book` VALUES (91, 8, 8, 'Collins新制多益聽讀說寫全真測驗 / 柯林斯出版公司(HarperCollins Publishers, Limited)著 ; 強勇傑, 林宜瑄譯.', '柯林斯出版公司 (HarperCollins Publishers, Limited) 著.', '9789574458769 (平裝附光碟', '2020', '1');
INSERT INTO `book` VALUES (92, 35, 10, '表演創作與演員素養 / 朱宏章', '朱宏章 ', '9789865540319 (平裝) ', '2021', '1');
INSERT INTO `book` VALUES (93, 36, 8, '遙遠的公路 = Once upon a highway so long /', '舒國治 文字.攝影', '9789869917933 (平裝) ', '2020', '1');
INSERT INTO `book` VALUES (94, 37, 1, '從苦境中轉回 : 101種帶有力量, 能讓生活美好的思考 / 謙卑詩人(Humble the Poet)著 ; 許家瑜譯.', '辛格 (Singh,Kanwer) ', '9789573292265 (平裝) ', '2021', '1');
INSERT INTO `book` VALUES (95, 38, 6, '前瞻數位社會科學人才培育創新教學方法 : 創新與挑戰 / 蕭富仁,胡中凡, 林常青, 洪綾君, 郭彥廉, 蒙志成, 楊子慶, 劉彥翎合著.', '蕭富仁 ', '9789869974783 (平裝)', '2021', '1');
INSERT INTO `book` VALUES (96, 39, 10, '藝術活泉.2020 : 新竹市藝文資源調查 / 黃竫蕙總編輯.', '黃竫蕙', '9789865421762 平裝', '2021', '1');
INSERT INTO `book` VALUES (97, 40, 9, '好心眼的鬼 : 看童話學作文 / 馬景賢撰文 ; 王建國,孫佳麟插圖', '馬景賢', '9575143299 ', '1993', '1');
INSERT INTO `book` VALUES (98, 41, 6, '超簡單整理收納術, 讓家煥然一新! : 網路人氣整理師之琳超強口袋折衣術與居家收納法大公開, 讓您輕鬆掌握簡單＆不易亂的整理攻略 / 于之琳著.', '于之琳 ', '9789869519434 ', '2018', '1');
INSERT INTO `book` VALUES (99, 42, 6, '誰偷走了農地? : 影響每一個人的台灣農業與農地公平正義 / 彭作奎著', '彭作奎 ', '9789571387697 ', '2021', '1');
INSERT INTO `book` VALUES (100, 43, 8, '隱性反骨 : 持續思辨、否定自我的教授, 帶你逆想人生 /', '李忠憲 ', '9789861343686 ', '2021', '1');
INSERT INTO `book` VALUES (136, 96, 10, 'test', 'kiara', '1234556789', '2000', '1');

-- ----------------------------
-- Table structure for book_author
-- ----------------------------
DROP TABLE IF EXISTS `book_author`;
CREATE TABLE `book_author`  (
  `ba_id` int NOT NULL AUTO_INCREMENT,
  `book_id_ba` int NOT NULL,
  `author_id_ba` int NOT NULL,
  PRIMARY KEY (`ba_id`) USING BTREE,
  INDEX `fk_book_author_author_1`(`author_id_ba`) USING BTREE,
  INDEX `fk_book_author_book_1`(`book_id_ba`) USING BTREE,
  CONSTRAINT `fk_book_author_author_1` FOREIGN KEY (`author_id_ba`) REFERENCES `author` (`author_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_book_author_book_1` FOREIGN KEY (`book_id_ba`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_author
-- ----------------------------
INSERT INTO `book_author` VALUES (16, 16, 1);
INSERT INTO `book_author` VALUES (17, 7, 2);
INSERT INTO `book_author` VALUES (18, 18, 4);
INSERT INTO `book_author` VALUES (19, 19, 5);
INSERT INTO `book_author` VALUES (20, 20, 5);
INSERT INTO `book_author` VALUES (21, 21, 6);
INSERT INTO `book_author` VALUES (22, 22, 7);
INSERT INTO `book_author` VALUES (23, 23, 48);
INSERT INTO `book_author` VALUES (24, 24, 6);
INSERT INTO `book_author` VALUES (25, 25, 6);
INSERT INTO `book_author` VALUES (26, 26, 8);
INSERT INTO `book_author` VALUES (27, 27, 8);
INSERT INTO `book_author` VALUES (28, 28, 8);
INSERT INTO `book_author` VALUES (29, 29, 8);
INSERT INTO `book_author` VALUES (30, 30, 8);
INSERT INTO `book_author` VALUES (31, 31, 8);
INSERT INTO `book_author` VALUES (32, 32, 8);
INSERT INTO `book_author` VALUES (33, 33, 49);
INSERT INTO `book_author` VALUES (34, 34, 9);
INSERT INTO `book_author` VALUES (35, 35, 9);
INSERT INTO `book_author` VALUES (36, 36, 10);
INSERT INTO `book_author` VALUES (37, 37, 9);
INSERT INTO `book_author` VALUES (38, 38, 9);
INSERT INTO `book_author` VALUES (39, 39, 9);
INSERT INTO `book_author` VALUES (40, 40, 9);
INSERT INTO `book_author` VALUES (41, 41, 9);
INSERT INTO `book_author` VALUES (42, 42, 9);
INSERT INTO `book_author` VALUES (43, 43, 9);
INSERT INTO `book_author` VALUES (44, 44, 12);
INSERT INTO `book_author` VALUES (45, 45, 12);
INSERT INTO `book_author` VALUES (46, 46, 12);
INSERT INTO `book_author` VALUES (47, 47, 14);
INSERT INTO `book_author` VALUES (48, 48, 14);
INSERT INTO `book_author` VALUES (49, 49, 13);
INSERT INTO `book_author` VALUES (50, 50, 15);
INSERT INTO `book_author` VALUES (51, 51, 16);
INSERT INTO `book_author` VALUES (52, 52, 17);
INSERT INTO `book_author` VALUES (53, 53, 17);
INSERT INTO `book_author` VALUES (54, 54, 18);
INSERT INTO `book_author` VALUES (55, 55, 50);
INSERT INTO `book_author` VALUES (56, 56, 20);
INSERT INTO `book_author` VALUES (57, 57, 19);
INSERT INTO `book_author` VALUES (58, 58, 19);
INSERT INTO `book_author` VALUES (59, 59, 21);
INSERT INTO `book_author` VALUES (60, 60, 21);
INSERT INTO `book_author` VALUES (61, 61, 19);
INSERT INTO `book_author` VALUES (62, 62, 19);
INSERT INTO `book_author` VALUES (63, 63, 22);
INSERT INTO `book_author` VALUES (64, 64, 23);
INSERT INTO `book_author` VALUES (65, 65, 24);
INSERT INTO `book_author` VALUES (66, 66, 25);
INSERT INTO `book_author` VALUES (67, 67, 25);
INSERT INTO `book_author` VALUES (68, 68, 25);
INSERT INTO `book_author` VALUES (69, 69, 25);
INSERT INTO `book_author` VALUES (70, 70, 26);
INSERT INTO `book_author` VALUES (71, 71, 26);
INSERT INTO `book_author` VALUES (72, 72, 26);
INSERT INTO `book_author` VALUES (73, 73, 11);
INSERT INTO `book_author` VALUES (74, 74, 11);
INSERT INTO `book_author` VALUES (75, 75, 26);
INSERT INTO `book_author` VALUES (76, 76, 26);
INSERT INTO `book_author` VALUES (77, 77, 27);
INSERT INTO `book_author` VALUES (78, 78, 28);
INSERT INTO `book_author` VALUES (79, 79, 29);
INSERT INTO `book_author` VALUES (80, 80, 30);
INSERT INTO `book_author` VALUES (81, 81, 30);
INSERT INTO `book_author` VALUES (82, 82, 31);
INSERT INTO `book_author` VALUES (83, 83, 31);
INSERT INTO `book_author` VALUES (84, 84, 32);
INSERT INTO `book_author` VALUES (85, 85, 32);
INSERT INTO `book_author` VALUES (86, 86, 33);
INSERT INTO `book_author` VALUES (87, 87, 33);
INSERT INTO `book_author` VALUES (88, 88, 34);
INSERT INTO `book_author` VALUES (89, 89, 37);
INSERT INTO `book_author` VALUES (90, 90, 37);
INSERT INTO `book_author` VALUES (91, 91, 38);
INSERT INTO `book_author` VALUES (92, 92, 39);
INSERT INTO `book_author` VALUES (93, 93, 40);
INSERT INTO `book_author` VALUES (94, 94, 41);
INSERT INTO `book_author` VALUES (95, 95, 42);
INSERT INTO `book_author` VALUES (96, 96, 43);
INSERT INTO `book_author` VALUES (97, 97, 44);
INSERT INTO `book_author` VALUES (98, 98, 45);
INSERT INTO `book_author` VALUES (99, 99, 46);
INSERT INTO `book_author` VALUES (100, 100, 47);
INSERT INTO `book_author` VALUES (101, 47, 13);
INSERT INTO `book_author` VALUES (102, 49, 14);
INSERT INTO `book_author` VALUES (103, 88, 35);
INSERT INTO `book_author` VALUES (104, 88, 36);
INSERT INTO `book_author` VALUES (105, 48, 13);
INSERT INTO `book_author` VALUES (106, 1, 1);
INSERT INTO `book_author` VALUES (107, 2, 1);
INSERT INTO `book_author` VALUES (108, 3, 1);
INSERT INTO `book_author` VALUES (109, 4, 1);
INSERT INTO `book_author` VALUES (110, 5, 1);
INSERT INTO `book_author` VALUES (111, 6, 1);
INSERT INTO `book_author` VALUES (112, 17, 4);
INSERT INTO `book_author` VALUES (113, 8, 2);
INSERT INTO `book_author` VALUES (114, 9, 3);
INSERT INTO `book_author` VALUES (115, 10, 4);
INSERT INTO `book_author` VALUES (116, 11, 4);
INSERT INTO `book_author` VALUES (117, 12, 4);
INSERT INTO `book_author` VALUES (118, 13, 4);
INSERT INTO `book_author` VALUES (119, 14, 2);
INSERT INTO `book_author` VALUES (120, 15, 2);
INSERT INTO `book_author` VALUES (122, 136, 81);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '哲學');
INSERT INTO `category` VALUES (2, '宗教');
INSERT INTO `category` VALUES (3, '自然科學');
INSERT INTO `category` VALUES (4, '電腦與資訊');
INSERT INTO `category` VALUES (5, '應用科學');
INSERT INTO `category` VALUES (6, '社會科學');
INSERT INTO `category` VALUES (7, '史地/傳記');
INSERT INTO `category` VALUES (8, '語言/文學');
INSERT INTO `category` VALUES (9, '兒童文學');
INSERT INTO `category` VALUES (10, '藝術');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '資料結構', '2');
INSERT INTO `course` VALUES (2, '線性代數', '2');
INSERT INTO `course` VALUES (3, '工程數學', '2');
INSERT INTO `course` VALUES (4, '數位電路設計', '2');
INSERT INTO `course` VALUES (5, '計算機網路', '2');
INSERT INTO `course` VALUES (6, '機率與統計', '2');
INSERT INTO `course` VALUES (7, '組合語言與系統程式', '2');
INSERT INTO `course` VALUES (8, '普物', '2');
INSERT INTO `course` VALUES (9, '數位設計', '2');
INSERT INTO `course` VALUES (10, '科技法律', '2');
INSERT INTO `course` VALUES (11, '資料庫系統', '3');
INSERT INTO `course` VALUES (12, '演算法', '3');
INSERT INTO `course` VALUES (13, '作業系統', '3');
INSERT INTO `course` VALUES (14, '數值方法', '3');
INSERT INTO `course` VALUES (15, '計算機組織', '3');
INSERT INTO `course` VALUES (16, '計算機圖學', '3');
INSERT INTO `course` VALUES (17, '微積分', '1');
INSERT INTO `course` VALUES (18, '離散數學', '1');
INSERT INTO `course` VALUES (19, '生態學', '1');
INSERT INTO `course` VALUES (20, '地質學', '2');

-- ----------------------------
-- Table structure for course_book
-- ----------------------------
DROP TABLE IF EXISTS `course_book`;
CREATE TABLE `course_book`  (
  `cb_id` int NOT NULL AUTO_INCREMENT,
  `course_id_cb` int NOT NULL,
  `book_id_cb` int NOT NULL,
  PRIMARY KEY (`cb_id`) USING BTREE,
  INDEX `fk_course_book_book_1`(`book_id_cb`) USING BTREE,
  INDEX `fk_course_book_course_1`(`course_id_cb`) USING BTREE,
  CONSTRAINT `fk_course_book_book_1` FOREIGN KEY (`book_id_cb`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_course_book_course_1` FOREIGN KEY (`course_id_cb`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_book
-- ----------------------------
INSERT INTO `course_book` VALUES (1, 2, 2);
INSERT INTO `course_book` VALUES (2, 2, 1);
INSERT INTO `course_book` VALUES (3, 2, 3);
INSERT INTO `course_book` VALUES (4, 2, 4);
INSERT INTO `course_book` VALUES (5, 2, 5);
INSERT INTO `course_book` VALUES (6, 2, 6);
INSERT INTO `course_book` VALUES (7, 2, 7);
INSERT INTO `course_book` VALUES (8, 1, 16);
INSERT INTO `course_book` VALUES (9, 1, 17);
INSERT INTO `course_book` VALUES (10, 3, 20);
INSERT INTO `course_book` VALUES (11, 9, 29);
INSERT INTO `course_book` VALUES (12, 9, 30);
INSERT INTO `course_book` VALUES (13, 9, 31);
INSERT INTO `course_book` VALUES (14, 5, 34);
INSERT INTO `course_book` VALUES (15, 5, 35);
INSERT INTO `course_book` VALUES (16, 5, 37);
INSERT INTO `course_book` VALUES (17, 5, 38);
INSERT INTO `course_book` VALUES (18, 6, 44);
INSERT INTO `course_book` VALUES (19, 7, 45);
INSERT INTO `course_book` VALUES (20, 12, 66);
INSERT INTO `course_book` VALUES (21, 12, 67);
INSERT INTO `course_book` VALUES (22, 12, 68);
INSERT INTO `course_book` VALUES (23, 12, 69);
INSERT INTO `course_book` VALUES (24, 13, 70);
INSERT INTO `course_book` VALUES (25, 13, 71);
INSERT INTO `course_book` VALUES (26, 13, 72);
INSERT INTO `course_book` VALUES (27, 15, 78);

-- ----------------------------
-- Table structure for loan_record
-- ----------------------------
DROP TABLE IF EXISTS `loan_record`;
CREATE TABLE `loan_record`  (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `book_id_lr` int NOT NULL,
  `member_id_lr` int NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date NOT NULL,
  `loan_state` int NOT NULL,
  `loan_count` int NOT NULL,
  PRIMARY KEY (`loan_id`) USING BTREE,
  INDEX `fk_loan_member_1`(`member_id_lr`) USING BTREE,
  INDEX `fk_loan_book_1`(`book_id_lr`) USING BTREE,
  CONSTRAINT `fk_loan_book_1` FOREIGN KEY (`book_id_lr`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_loan_member_1` FOREIGN KEY (`member_id_lr`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loan_record
-- ----------------------------
INSERT INTO `loan_record` VALUES (1, 1, 3, '2021-12-16', '2022-01-16', 0, 0);
INSERT INTO `loan_record` VALUES (2, 2, 2, '2021-12-28', '2022-01-17', 0, 1);
INSERT INTO `loan_record` VALUES (3, 33, 3, '2021-12-30', '2022-01-30', 0, 1);
INSERT INTO `loan_record` VALUES (4, 11, 2, '2022-01-17', '2022-01-17', 0, 0);
INSERT INTO `loan_record` VALUES (5, 12, 2, '2022-01-17', '2022-01-17', 0, 0);
INSERT INTO `loan_record` VALUES (6, 12, 2, '2022-01-17', '2022-01-17', 0, 0);
INSERT INTO `loan_record` VALUES (7, 12, 2, '2022-01-17', '2022-01-17', 0, 0);
INSERT INTO `loan_record` VALUES (8, 50, 1, '2022-01-17', '0000-00-00', 0, 3);
INSERT INTO `loan_record` VALUES (9, 34, 1, '2022-01-17', '0000-00-00', 0, 2);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `point` int NULL DEFAULT NULL,
  `manager` int NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '小名', 'q12we3', 's108222', 0, 0);
INSERT INTO `member` VALUES (2, '曉華', '321', '321', 0, 0);
INSERT INTO `member` VALUES (3, '冰冰', '123', '123', 0, 1);

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`publisher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publisher
-- ----------------------------
INSERT INTO `publisher` VALUES (1, 'Hackensack, NJ ');
INSERT INTO `publisher` VALUES (2, 'Burlington, Massachusetts : Jones & Bartlett Learning');
INSERT INTO `publisher` VALUES (3, '滄海圖書');
INSERT INTO `publisher` VALUES (4, 'Whitby, Ontario ');
INSERT INTO `publisher` VALUES (5, 'Sudbury, Mass');
INSERT INTO `publisher` VALUES (6, 'Summit, NJ ');
INSERT INTO `publisher` VALUES (7, '先覺出版 ');
INSERT INTO `publisher` VALUES (8, 'New York ');
INSERT INTO `publisher` VALUES (9, '新加坡商聖智學習出版');
INSERT INTO `publisher` VALUES (10, 'Oakville, ON : Arcler Press');
INSERT INTO `publisher` VALUES (11, 'Australia : Cengage Learning');
INSERT INTO `publisher` VALUES (12, '儒林');
INSERT INTO `publisher` VALUES (13, 'Harlow ');
INSERT INTO `publisher` VALUES (14, '台灣堷生教育出版');
INSERT INTO `publisher` VALUES (15, 'Upper Saddle River, N.J.');
INSERT INTO `publisher` VALUES (16, '全華');
INSERT INTO `publisher` VALUES (17, 'Cham : Springer International Publishing ');
INSERT INTO `publisher` VALUES (18, 'Boston : Pearson');
INSERT INTO `publisher` VALUES (19, 'Boca Raton, Florida : CRC Press,');
INSERT INTO `publisher` VALUES (20, 'Amsterdam ');
INSERT INTO `publisher` VALUES (21, 'CreateSpace Independent Publishing Platform');
INSERT INTO `publisher` VALUES (22, 'Mason, OH : Thomson');
INSERT INTO `publisher` VALUES (23, 'Cham : Springer International Publishing ');
INSERT INTO `publisher` VALUES (24, '旗標');
INSERT INTO `publisher` VALUES (25, 'Berkeley, CA ');
INSERT INTO `publisher` VALUES (26, '上奇資訊');
INSERT INTO `publisher` VALUES (27, 'Hoboken, NJ');
INSERT INTO `publisher` VALUES (28, '臺灣東華');
INSERT INTO `publisher` VALUES (29, 'Dordrecht, Netherlands ');
INSERT INTO `publisher` VALUES (30, '松崗');
INSERT INTO `publisher` VALUES (31, 'Cambridge, MA ');
INSERT INTO `publisher` VALUES (32, 'Princeton, NJ ');
INSERT INTO `publisher` VALUES (33, 'Beijing ');
INSERT INTO `publisher` VALUES (34, 'Hershey PA');
INSERT INTO `publisher` VALUES (35, ' 書林出版');
INSERT INTO `publisher` VALUES (36, '新銳文創出版');
INSERT INTO `publisher` VALUES (37, '新經典圖文傳播出版');
INSERT INTO `publisher` VALUES (38, '遠流');
INSERT INTO `publisher` VALUES (39, '國立成功大學社會科學院');
INSERT INTO `publisher` VALUES (40, '新竹市文化局');
INSERT INTO `publisher` VALUES (41, ' 錦繡文化');
INSERT INTO `publisher` VALUES (42, '日日學');
INSERT INTO `publisher` VALUES (43, '時報文化');
INSERT INTO `publisher` VALUES (96, 'ame');

-- ----------------------------
-- Table structure for reservation_record
-- ----------------------------
DROP TABLE IF EXISTS `reservation_record`;
CREATE TABLE `reservation_record`  (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `book_id_r` int NULL DEFAULT NULL,
  `member_id_r` int NULL DEFAULT NULL,
  `res_status_id_r` int NOT NULL,
  `reservation_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`res_id`) USING BTREE,
  INDEX `fk_reservation_book_1`(`book_id_r`) USING BTREE,
  INDEX `fk_reservation_member_1`(`member_id_r`) USING BTREE,
  INDEX `fk_reservation_reservation_status_1`(`res_status_id_r`) USING BTREE,
  CONSTRAINT `fk_reservation_book_1` FOREIGN KEY (`book_id_r`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reservation_member_1` FOREIGN KEY (`member_id_r`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reservation_reservation_status_1` FOREIGN KEY (`res_status_id_r`) REFERENCES `reservation_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_record
-- ----------------------------
INSERT INTO `reservation_record` VALUES (1, 5, 2, 1, '2022-07-01');
INSERT INTO `reservation_record` VALUES (4, 15, 2, 3, '2022-01-16');
INSERT INTO `reservation_record` VALUES (5, 22, 2, 3, '2022-01-16');
INSERT INTO `reservation_record` VALUES (6, 6, 1, 3, '2022-01-17');

-- ----------------------------
-- Table structure for reservation_status
-- ----------------------------
DROP TABLE IF EXISTS `reservation_status`;
CREATE TABLE `reservation_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_status
-- ----------------------------
INSERT INTO `reservation_status` VALUES (1, '預約成功');
INSERT INTO `reservation_status` VALUES (2, '被預約中');
INSERT INTO `reservation_status` VALUES (3, '不在館內');

SET FOREIGN_KEY_CHECKS = 1;
