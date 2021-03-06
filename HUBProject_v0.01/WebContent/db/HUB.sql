--DROP TABLE USERCONN_TB;
--DROP TABLE BUCKETCONN_TB;
--DROP TABLE GROUPCONN_TB;
--DROP TABLE USERGROUP_TB;
--DROP TABLE COCONN_TB;
--DROP TABLE USERPOST;
--DROP TABLE USER_TB;
--DROP TABLE BUCKETLIST_TB;
--DROP TABLE FOLLOW_TB;
--DROP TABLE GROUP_TB;
--DROP TABLE COOPER_TB;
--DROP TABLE POST_TB;
--DROP TABLE CONNCHAIN_TB;
--DROP SEQUENCE bucketlist_seq;
--DROP SEQUENCE cooper_seq;
--DROP SEQUENCE group_seq;
--DROP SEQUENCE post_seq;
--COMMIT;

CREATE TABLE USER_TB(
	PRIMARY KEY(USERID),
	USERID VARCHAR2(20),
	PW VARCHAR2(30),
	EMAIL VARCHAR2(50),
	PICTURE VARCHAR2(50),
	INTRODUCE VARCHAR2(2000),
	ADMIN VARCHAR2(3)
);

CREATE TABLE BUCKETLIST_TB(
	PRIMARY KEY(BUCKETID),
	BUCKETID NUMBER,
	TITLE VARCHAR2(100),
	GOAL VARCHAR2(20),
	STAR NUMBER,
	MEMO VARCHAR2(500),
	SOS VARCHAR2(200),
	LOCKER VARCHAR2(2),
	USERID VARCHAR2(20),
    FOREIGN KEY(USERID) REFERENCES USER_TB(USERID)
	ON DELETE CASCADE
);

CREATE TABLE FOLLOW_TB(
	PRIMARY KEY(USERID, FOLLOWID),
	USERID VARCHAR2(20),
	FOLLOWID VARCHAR2(20),
	RELATION NUMBER,
	CONFIRM VARCHAR2(2)
);


CREATE TABLE GROUP_TB(
	PRIMARY KEY(GROUPID),
	GROUPID NUMBER,
	GROUPNAME VARCHAR2(100),
	USERID VARCHAR2(20),
	LASTDAY DATE,
	LOCAL VARCHAR2(4),
	INTRODUCE VARCHAR2(4000),
	MAXPEOPLE NUMBER
);

CREATE TABLE COOPER_TB(
	PRIMARY KEY(COID),
	COID NUMBER,
	CONAME VARCHAR2(20),
	BANNER VARCHAR2(50),
	STARTDAY DATE,
	LASTDAY DATE
);

CREATE TABLE POST_TB(
	PRIMARY KEY(POSTID),
	POSTID NUMBER,
	SENDERID VARCHAR2(20),
	RECIEVERID VARCHAR2(20),
	SENDTIME DATE,
	CONTENT VARCHAR2(1000)
);

CREATE TABLE CONNCHAIN_TB(
	PRIMARY KEY(CONNCHAIN),
	CONNCHAIN VARCHAR2(20)
);

CREATE TABLE USERCONN_TB(
	PRIMARY KEY(USERID, CONNCHAIN),
	USERID VARCHAR2(20),
	CONNCHAIN VARCHAR2(20),
	FOREIGN KEY(USERID) REFERENCES USER_TB(USERID)
	ON DELETE CASCADE
);

CREATE TABLE BUCKETCONN_TB(
	PRIMARY KEY(BUCKETID, CONNCHAIN),
	BUCKETID NUMBER,
	CONNCHAIN VARCHAR2(20),
	FOREIGN KEY(BUCKETID) REFERENCES BUCKETLIST_TB(BUCKETID)
	ON DELETE CASCADE
);

CREATE TABLE GROUPCONN_TB(
	PRIMARY KEY(GROUPID, CONNCHAIN),
	GROUPID NUMBER,
	CONNCHAIN VARCHAR2(20),
	FOREIGN KEY(GROUPID) REFERENCES GROUP_TB(GROUPID)
	ON DELETE CASCADE
);

CREATE TABLE USERGROUP_TB(
	PRIMARY KEY(USERID, GROUPID),
	USERID VARCHAR2(20),
	GROUPID NUMBER,
	FOREIGN KEY(USERID) REFERENCES USER_TB(USERID) ON DELETE CASCADE,
	FOREIGN KEY(GROUPID) REFERENCES GROUP_TB(GROUPID) ON DELETE CASCADE
);

CREATE TABLE COCONN_TB(
	PRIMARY KEY(COID, CONNCHAIN),
	COID NUMBER,
	CONNCHAIN VARCHAR2(20),
	FOREIGN KEY(COID) REFERENCES COOPER_TB(COID)
	ON DELETE CASCADE
);

CREATE TABLE USERPOST_TB(
	PRIMARY KEY(USERID, POSTID),
	USERID VARCHAR2(20),
	POSTID NUMBER,
	FOREIGN KEY(USERID) REFERENCES USER_TB(USERID) ON DELETE CASCADE,
 	FOREIGN KEY(POSTID) REFERENCES POST_TB(POSTID) ON DELETE CASCADE
);

CREATE sequence bucketlist_seq start WITH 1 increment BY 1;
CREATE sequence cooper_seq start WITH 1 increment BY 1;
CREATE sequence group_seq start WITH 1 increment BY 1;
CREATE sequence post_seq start WITH 1 increment BY 1;

COMMIT;