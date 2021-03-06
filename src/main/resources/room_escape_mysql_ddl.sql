/* DDL FOR MySQL DATABASE */

/*CREATE DATABASE IF NOT EXISTS HC;*/
CREATE DATABASE ROOM_ESCAPE CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE USER (
 ID INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
 USERNAME VARCHAR(50) NOT NULL UNIQUE,
 REAL_NAME VARCHAR(50),
 PASSWORD VARCHAR(50),
 SEX INT,
 ID_NUMBER VARCHAR(50),
 PORTRAIT BLOB,
 CREATE_TIME TIMESTAMP DEFAULT NOW(),
 UPDATE_TIME TIMESTAMP DEFAULT NOW()
)
ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE USER_ROLE (
  ID INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  ROLE VARCHAR(50) NOT NULL,
  USER_ID INT(10),
  USERNAME VARCHAR(50),
  CREATE_TIME TIMESTAMP DEFAULT NOW(),
  UPDATE_TIME TIMESTAMP DEFAULT NOW()
 )
ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE TICKET (
  ID INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  NAME VARCHAR(50) NOT NULL,
  PRICE INT(10) NOT NULL,
  QUANTITY INT(10),
  YEAR VARCHAR(50),
  DAY VARCHAR(50),
  TIME VARCHAR(50),
  STATUS VARCHAR(50),
  CREATE_TIME TIMESTAMP DEFAULT NOW(),
  UPDATE_TIME TIMESTAMP DEFAULT NOW()
 )
ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE USER_TICKET (
  ID INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
  USER_ID INT(10),
  TICKET_ID INT(10),
  CREATE_TIME TIMESTAMP DEFAULT NOW(),
  UPDATE_TIME TIMESTAMP DEFAULT NOW()
 )
ENGINE=INNODB DEFAULT CHARSET=UTF8;


/* CONSTRAINT */
ALTER TABLE USER_ROLE ADD CONSTRAINT USER_ID_USER_ROLE_FK FOREIGN KEY (USER_ID) REFERENCES USER(ID);
ALTER TABLE USER_ROLE ADD CONSTRAINT USER_ID_USER_ROLE_UK UNIQUE KEY (ROLE,USERNAME);
ALTER TABLE TICKET ADD CONSTRAINT NAME_YEAR_DAY_TIME_TICKET_UK UNIQUE KEY (NAME,YEAR,DAY,TIME);
ALTER TABLE USER_TICKET ADD CONSTRAINT USER_TICKET_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES USER(ID);
ALTER TABLE USER_TICKET ADD CONSTRAINT USER_TICKET_TICKET_ID_FK FOREIGN KEY (TICKET_ID) REFERENCES TICKET(ID);
/* CONSTRAINT */

/* END */