

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO admin VALUES("1","admin","21232f297a57a5a743894a0e4a801fc3","08-05-2020 07:23:45 PM");



CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `chats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO chats VALUES("1","sample1@gmail.com","hi","2024-04-10 08:28:41");
INSERT INTO chats VALUES("2","sample1@gmail.com","hello","2024-04-10 08:46:05");



CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `replies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO replies VALUES("1","sample1@gmail.com","okay","2024-04-10 10:13:32");
INSERT INTO replies VALUES("2","sample1@gmail.com","okay","2024-04-10 10:13:38");
INSERT INTO replies VALUES("3","sample1@gmail.com","yeah","2024-04-10 10:14:14");
INSERT INTO replies VALUES("4","sample1@gmail.com","okay","2024-04-10 10:14:36");
INSERT INTO replies VALUES("5","sample1@gmail.com","okay","2024-04-10 10:29:28");
INSERT INTO replies VALUES("6","sample1@gmail.com","okay","2024-04-10 10:34:30");
INSERT INTO replies VALUES("7","sample1@gmail.com","okay","2024-04-10 10:36:06");
INSERT INTO replies VALUES("8","sample1@gmail.com","okay","2024-04-10 10:45:21");
INSERT INTO replies VALUES("9","sample1@gmail.com","okayss","2024-04-10 10:45:33");
INSERT INTO replies VALUES("10","sample1@gmail.com","good afternoon","2024-04-10 10:46:20");
INSERT INTO replies VALUES("11","sample1@gmail.com","okay","2024-04-10 10:46:26");
INSERT INTO replies VALUES("12","sample1@gmail.com","okay","2024-04-10 12:24:45");
INSERT INTO replies VALUES("13","sample1@gmail.com","okay","2024-04-10 12:25:12");



CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO state VALUES("1","Polomolok,South Cotabato","Municipality","2024-04-10 06:52:28","");
INSERT INTO state VALUES("2","Tupi,South Cotabato","Municipality","2024-04-10 06:53:47","");
INSERT INTO state VALUES("3","Pagalungan,Polomolok,South Cotabato","Barangay","2024-04-10 06:54:12","");
INSERT INTO state VALUES("4","Palkan,Polomolok,South Cotabato","Barangay","2024-04-10 06:54:27","");
INSERT INTO state VALUES("5","Crossing Rubber,Tupi,South Cotabato","Barangay","2024-04-10 06:54:55","");
INSERT INTO state VALUES("6","Labangal, General Santos CIty","Barangay","2024-04-10 06:55:27","");
INSERT INTO state VALUES("7","Morales, Koronadal City","Barangay","2024-04-10 06:55:43","");
INSERT INTO state VALUES("8","San Isidro , General Santos City","Barangay","2024-04-10 06:56:04","");
INSERT INTO state VALUES("9","Tambler,General Santos City","Barangay","2024-04-10 06:56:32","");
INSERT INTO state VALUES("10","Katangawan, General Santos CIty","Barangay","2024-04-10 06:56:56","");



CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`complaintNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tblcomplaints VALUES("1","3","0","sub"," Complaint","Polomolok,South Cotabato","Noise Complaints","Residents might complain about loud music, parties, or construction noise disturbing their peace and quiet, especially during late hours.","","2024-04-10 07:02:35","","0000-00-00 00:00:00");



CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO userlog VALUES("1","0","john@gmail.com","::1             ","2020-05-08 22:14:43","","0");
INSERT INTO userlog VALUES("2","1","john@gmail.com","::1             ","2020-05-08 22:14:50","08-05-2020 07:44:51 PM","1");
INSERT INTO userlog VALUES("3","1","john@gmail.com","::1             ","2020-05-08 22:16:30","","1");
INSERT INTO userlog VALUES("6","3","sample@gmail.com","::1             ","2024-04-10 06:48:33","10-04-2024 04:21:29 AM","1");
INSERT INTO userlog VALUES("7","3","sample@gmail.com","::1             ","2024-04-10 06:58:00","10-04-2024 05:01:07 AM","1");
INSERT INTO userlog VALUES("8","0","sample@gmail.com","::1             ","2024-04-10 07:31:21","","0");
INSERT INTO userlog VALUES("9","0","sample@gmail.com","::1             ","2024-04-10 07:31:36","","0");
INSERT INTO userlog VALUES("10","0","sample@gmail.com","::1             ","2024-04-10 07:31:46","","0");
INSERT INTO userlog VALUES("11","4","sample1@gmail.com","::1             ","2024-04-10 07:32:36","10-04-2024 05:12:51 AM","1");
INSERT INTO userlog VALUES("12","4","sample1@gmail.com","::1             ","2024-04-10 07:43:07","10-04-2024 05:22:40 AM","1");
INSERT INTO userlog VALUES("13","4","sample1@gmail.com","::1             ","2024-04-10 07:52:54","10-04-2024 05:34:12 AM","1");



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
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO users VALUES("1","John Smith","john@gmail.com","202cb962ac59075b964b07152d234b70","9999999999","","","","","","2020-05-08 22:10:50","2020-05-08 22:16:22","1");
INSERT INTO users VALUES("3","Juan Dela Cruz","sample@gmail.com","7488e331b8b64e5794da3fa4eb10ad5d","967619865","","","","","","2024-04-10 06:48:09","0000-00-00 00:00:00","1");
INSERT INTO users VALUES("4","Juan Dela Cruz","sample1@gmail.com","e66055e8e308770492a44bf16e875127","967619865","","","","","","2024-04-10 07:32:20","0000-00-00 00:00:00","1");

