DROP DATABASE IF EXISTS `dbfinal`;
CREATE DATABASE `dbfinal` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `dbfinal`;
CREATE TABLE `members`(
memberID VARCHAR(40) NOT NULL UNIQUE,
memberPWD VARCHAR(20)  NOT NULL,
memberName VARCHAR(20) NOT NULL,
Tel VARCHAR(20)  NOT NULL,
address VARCHAR(40)  NOT NULL,
PRIMARY KEY(memberID)
);
INSERT INTO `members` VALUE("Facile@gmail.com","1234","官方帳號","03-265-9999","320桃園市中壢區中北路200號");

CREATE TABLE `product`(
`product_ID` VARCHAR(5)NOT NULL UNIQUE,
product_Name VARCHAR(50),
classify VARCHAR(20),
price INT,
stock INT DEFAULT NULL,
unit VARCHAR(3),
img VARCHAR(20)
);
INSERT INTO product VALUE("p0001","T-Shirt(藍)","tshirt","299","100","件","01");
INSERT INTO product VALUE("p0002","T-Shirt(綠)","tshirt","299","100","件","02");
INSERT INTO product VALUE("p0003","T-Shirt(白)","tshirt","299","100","件","03");
INSERT INTO product VALUE("p0004","襯衫(淺藍)","lshirt","599","100","件","04");
INSERT INTO product VALUE("p0005","襯衫(深藍)","lshirt","599","100","件","05");
INSERT INTO product VALUE("p0006","襯衫(粉)","lshirt","599","100","件","06");
INSERT INTO product VALUE("p0007","時尚短褲(褐)","shorts","489","100","件","07");
INSERT INTO product VALUE("p0008","時尚短褲(白)","shorts","489","100","件","08");
INSERT INTO product VALUE("p0009","時尚短褲(藍)","shorts","489","100","件","09");
INSERT INTO product VALUE("p0010","時尚長褲(綠)","trousers","689","100","件","10");
INSERT INTO product VALUE("p0011","時尚長褲(米白)","trousers","689","100","件","11");
INSERT INTO product VALUE("p0012","時尚長褲(藍)","trousers","689","100","件","12");
INSERT INTO product VALUE("p0013","外套(藍)","jackets","1299","100","件","13");
INSERT INTO product VALUE("p0014","外套(灰)","jackets","1299","100","件","14");
INSERT INTO product VALUE("p0015","外套(綠)","jackets","1299","100","件","15");
INSERT INTO product VALUE("p0016","皮帶(褐)","others","299","100","條","16");
INSERT INTO product VALUE("p0017","短襪(黑)","others","99","100","雙","17");
INSERT INTO product VALUE("p0018","時尚帆布鞋(白)","others","1299","100","雙","18");

#計算訪問人數
CREATE TABLE `count`(
count INT NOT NULL
);
INSERT INTO `count` VALUES (0);

##留言版
CREATE TABLE board (
  GBNO TINYINT(4) auto_increment,
  memberID varchar(255) NOT NULL,
  content text,
  putdate date DEFAULT NULL,
  stars varchar(255) NOT NULL,
  pid VARCHAR(5),
   PRIMARY KEY (GBNO)
);
#聯絡我們
CREATE TABLE contactus(
`name` VARCHAR(10),
phone VARCHAR(20),
email VARCHAR(40),
`subject` text,
content text
);
#購買
CREATE TABLE orders(
	order_ID INT auto_increment,
    memberID VARCHAR(40),
    ordername varchar(10),
    tel varchar(10),
    addr varchar(60),
    pay_way VARCHAR(20),
    timer date,
    primary key(order_ID)
);
CREATE TABLE order_detail(
	order_ID INT null,
	memberID VARCHAR(255),
	Product_Id varchar(10),
	num INT,
    size varchar(4)
);
#購物車
CREATE TABLE `car` (
  `carid` tinyint AUTO_INCREMENT,
  `pid` varchar(5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `size` varchar(3) NOT NULL,
  primary key(carid)
);
#廣告
CREATE TABLE `randad1` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_file` varchar(20) NOT NULL,
  `ADtitle` text NOT NULL,
  `ADContent` text NOT NULL,
  PRIMARY KEY (`ADID`)
);
INSERT INTO randad1 VALUES ('1','01','柔棉長袖襯衫','採用歐洲進口之特殊布料，不僅穿著舒適，更能與任何褲子百搭，是男士們必備的一件襯衫!');
INSERT INTO randad1 VALUES ('2','02','運動連帽外套', '特殊處理過的布料，能擋風防水，同時依然保有良好的透氣功能，是運動人士最好的選擇之一!');
CREATE TABLE `randad2` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_file` varchar(20) NOT NULL,
  `ADtitle` text NOT NULL,
  `ADContent` text NOT NULL,
  PRIMARY KEY (`ADID`)
);
INSERT INTO randad2 VALUES ('1', '03', '特彈牛仔褲', '採用極彈性的布料，不論是什麼樣的人都能輕鬆駕馭這條牛仔褲!');
INSERT INTO randad2 VALUES ('2', '04', '型男短褲', '使用彈性布料，俐落剪裁，除了能顯瘦，也是夏天的必備短褲!');
CREATE TABLE `randad3` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_file` varchar(20) NOT NULL,
  `ADtitle` text NOT NULL,
  `ADContent` text NOT NULL,
  PRIMARY KEY (`ADID`)
);
INSERT INTO randad3 VALUES ('1', '05', '飛行外套', '以飛行夾克的元素帶出軍裝風格，質輕、保暖經典的品牌，潮流人士的必備穿搭!');
INSERT INTO randad3 VALUES ('2', '06', '時尚凡布鞋', '簡潔、白色是它的外觀，時尚不脫俗，是年輕人當中必買的百搭鞋款!');