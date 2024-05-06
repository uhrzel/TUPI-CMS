

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO admin VALUES("1","admin","e6e061838856bf47e1de730719fb2609","18-12-2023 01:48:42 PM");



CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO complaintremark VALUES("9","24","in process","wait for processing!","2023-12-19 02:22:37");
INSERT INTO complaintremark VALUES("10","26","in process","wait for immediate action","2024-03-15 22:53:49");



CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO state VALUES("30","Poblacion (Polomolok)","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("31","Cannery Site","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("32","Magsaysay","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("33","Bentung","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("34","Crossing Palkan","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("35","Glamang","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("36","Kinilis","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("37","Klinan 6","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("38","Koronadal Proper","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("39","Lam Caliaf","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("40","Landan","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("41","Lapu","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("42","Lumakil","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("43","Maligo","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("44","Pagalungan","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("45","Palkan","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("46","Polo","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("47","Rubber","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("48","Silway 7","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("49","Silway 8","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("50","Sulit","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("51","Sumbakil","","2023-12-19 01:12:09","");
INSERT INTO state VALUES("52","Upper Klinan","","2023-12-19 01:12:09","");



CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`complaintNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tblcomplaints VALUES("24","2","0",""," Complaint","Cannery Site","nag maoy","hubog gabii nag wild!","","2023-12-19 01:17:41","in process","2023-12-19 02:22:37");
INSERT INTO tblcomplaints VALUES("25","2","0","sub","General Query","Cannery Site","nag maoy sya","hubog ","","2023-12-19 01:37:33","","");
INSERT INTO tblcomplaints VALUES("26","6","0","sub"," Complaint","Upper Klinan","gahud","paki solbad ko","","2024-03-15 22:15:31","in process","2024-03-15 22:53:49");



CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO userlog VALUES("27","2","john@gmail.com","::1             ","2023-12-18 16:23:55","19-12-2023 12:04:11 AM","1");
INSERT INTO userlog VALUES("28","0","hermyrose12@gmail.com","::1             ","2024-02-16 22:49:14","","0");
INSERT INTO userlog VALUES("29","0","hermyrose121997@gmail.com","::1             ","2024-02-16 22:50:43","","0");
INSERT INTO userlog VALUES("30","0","hermydemz@gmail.com","::1             ","2024-02-29 15:57:07","","0");
INSERT INTO userlog VALUES("31","0","hermydem@gmail.com","::1             ","2024-02-29 15:57:22","","0");
INSERT INTO userlog VALUES("32","5","hermyrose@gmail.com","::1             ","2024-02-29 15:58:22","29-02-2024 01:29:49 PM","1");
INSERT INTO userlog VALUES("33","6","irishmacalisang@gmail.com","::1             ","2024-03-15 21:42:35","15-03-2024 07:45:55 PM","1");



CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO users VALUES("2","john doe","john@gmail.com","527bd5b5d689e2c32ae974c6229ff785","912345678","","Pagalungan","","9405","","2023-12-18 16:22:27","","1");
INSERT INTO users VALUES("3","hermyrose","hermyrose121997@gmail.com","fcea920f7412b5da7be0cf42b8c93759","987857653","","","","","","2024-02-16 22:48:45","","1");
INSERT INTO users VALUES("4","hermy","hermyrosedemz@gmail.com","e6cf77f28af840bd1c2e53eb81a71a85","987665423","","","","","","2024-02-29 15:56:44","","1");
INSERT INTO users VALUES("5","hermz","hermyrose@gmail.com","e6cf77f28af840bd1c2e53eb81a71a85","98765643","","","","","","2024-02-29 15:58:00","","1");
INSERT INTO users VALUES("6","irishjane","irishmacalisang@gmail.com","e6cf77f28af840bd1c2e53eb81a71a85","98757645","","","","","","2024-03-15 21:40:36","","1");

