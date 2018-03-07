BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `user` (
	`uid`	TEXT,
	`actype`	TEXT
);
CREATE TABLE IF NOT EXISTS `teacher` (
	`tid`	TEXT,
	`tname`	TEXT NOT NULL,
	`phno`	NUMERIC,
	PRIMARY KEY(`tid`)
);
CREATE TABLE IF NOT EXISTS `subject` (
	`subid`	TEXT,
	`subname`	TEXT NOT NULL,
	`tid`	TEXT NOT NULL,
	FOREIGN KEY(`tid`) REFERENCES `teacher`(`tid`) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(`subid`)
);
CREATE TABLE IF NOT EXISTS `student` (
	`sid`	TEXT,
	`pid`	TEXT,
	`sname`	TEXT NOT NULL,
	`cid`	TEXT,
	`busno`	INTEGER,
	FOREIGN KEY(`pid`) REFERENCES `parent`(`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(`pid`,`sid`,`cid`),
	FOREIGN KEY(`busno`) REFERENCES `bus`(`bno`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(`cid`) REFERENCES `class1`(`cid`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `parent` (
	`pid`	TEXT,
	`pname`	TEXT NOT NULL,
	`phno`	NUMERIC,
	PRIMARY KEY(`pid`)
);
CREATE TABLE IF NOT EXISTS `news` (
	`ndate`	TEXT,
	`details`	TEXT,
	PRIMARY KEY(`ndate`,`details`)
);
CREATE TABLE IF NOT EXISTS `leave` (
	`sid`	TEXT,
	`ldate`	TEXT,
	`status`	TEXT,
	`rejectreason`	TEXT,
	FOREIGN KEY(`sid`) REFERENCES `student`(`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(`sid`,`ldate`)
);
CREATE TABLE IF NOT EXISTS `feedback` (
	`pid`	TEXT,
	`facilities`	INTEGER NOT NULL,
	`schoolbus`	INTEGER NOT NULL,
	`extracur`	INTEGER NOT NULL,
	`cleanliness`	INTEGER NOT NULL,
	`culfest`	INTEGER NOT NULL,
	PRIMARY KEY(`pid`),
	FOREIGN KEY(`pid`) REFERENCES `parent`(`pid`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `classinfo` (
	`cdate`	TEXT,
	`subid`	INTEGER,
	`cid`	INTEGER,
	`dailtreport`	TEXT NOT NULL,
	`hw`	TEXT,
	FOREIGN KEY(`cid`) REFERENCES `class1`(`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(`cdate`,`subid`,`cid`),
	FOREIGN KEY(`subid`) REFERENCES `subject`(`subid`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `class1` (
	`cid`	TEXT,
	`tid`	TEXT NOT NULL,
	FOREIGN KEY(`tid`) REFERENCES `teacher`(`tid`) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(`cid`)
);
CREATE TABLE IF NOT EXISTS `bus` (
	`bno`	INTEGER,
	`drname`	TEXT,
	PRIMARY KEY(`bno`)
);
CREATE TABLE IF NOT EXISTS `attendance` (
	`sid`	TEXT,
	`adate`	TEXT,
	`cid`	TEXT,
	`p_or_a`	TEXT,
	FOREIGN KEY(`cid`) REFERENCES `class1`(`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(`sid`,`adate`),
	FOREIGN KEY(`sid`) REFERENCES `student`(`sid`) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMIT;
