CREATE TABLE label (
  lbltitle text PRIMARY KEY NOT NULL,
  lblstreet text ,
  lblcity text ,
  lblstate text ,
  lblpostcode text ,
  lblnation text
  );


INSERT INTO label VALUES ('Atlantic','75 Rockefeller Plaza','New York','NY','10019','USA');


CREATE TABLE cd (
  cdid integer PRIMARY KEY NOT NULL,
  cdlblid text,
  cdtitle text ,
  cdyear integer,
  lbltitle text,
  FOREIGN KEY (lbltitle) REFERENCES label (lbltitle)
);

INSERT INTO cd VALUES (1,'A2 1311','Giant Steps',1960,'Atlantic'),
(2,'83012-2','Swing',1977,'Atlantic');


CREATE TABLE person (
  psnid integer PRIMARY KEY NOT NULL,
  psnfname text ,
  psnlname text
  );



INSERT INTO person VALUES (1,'John','Coltrane'),
(2,'Tommy','Flanagan'),
(3,'Paul','Chamber'),
(4,'Art','Taylor'),
(5,'Cheryl','Bentyne'),
(6,'Janis','Siegel'),
(7,'Tim','Hauser'),
(8,'Alan','Paul');


CREATE TABLE person_cd (
  psnid integer NOT NULL,
  cdid integer NOT NULL,
  psncdorder integer ,
  PRIMARY KEY (psnid,cdid),
  FOREIGN KEY (cdid) REFERENCES cd (cdid),
  FOREIGN KEY (psnid) REFERENCES person (psnid)
);


INSERT INTO person_cd VALUES (1,1,1);


CREATE TABLE composition (
  compid integer PRIMARY KEY NOT NULL,
  comptitle text NOT NULL,
  compyear integer
);


INSERT INTO composition VALUES (1,'Giant Steps',NULL),
(2,'Cousin Mary',NULL),
(3,'Countdown',NULL),
(4,'Spiral',NULL),
(5,'Syeeda’s Song Flute',NULL),
(6,'Naima',NULL),
(7,'Mr. P.C.',NULL),
(8,'Stomp of King Porter',1924),
(9,'Sing a Study in Brown',1937),
(10,'Sing Moten’s Swing',1997),
(11,'A-Tisket, A-Tasket',1938),
(12,'I Know Why',1941),
(13,'Sing You Sinners',1930),
(14,'Java Jive',1940),
(15,'Down South Camp Meetin’',1997),
(16,'Topsy',1936),
(17,'Clouds',NULL),
(18,'Skyliner',1944),
(19,'It’s a Good Enough to Keep',NULL),
(20,'Choo Choo Ch’ Boogie',1945);


CREATE TABLE person_composition (
  psnid integer NOT NULL,
  compid integer NOT NULL,
  psncomprole text ,
  psncomporder integer ,
  PRIMARY KEY (psnid,compid),
  FOREIGN KEY (compid) REFERENCES composition (compid),
  FOREIGN KEY (psnid) REFERENCES person (psnid)
);


INSERT INTO person_composition VALUES (1,1,'music',1),
(1,2,'music',1),
(1,3,'music',1),
(1,4,'music',1),
(1,5,'music',1),
(1,6,'music',1),
(1,7,'music',1),
(2,4,'music',2),
(3,6,'music',2),
(4,1,'lyrics',2),
(4,2,'lyrics',2),
(4,8,'music',1),
(7,6,'lyrics',3),
(7,8,'lyrics',2);


CREATE TABLE recording (
  rcdid integer NOT NULL,
  compid integer NOT NULL,
  rcdlength REAL ,
  rcddate date ,
  PRIMARY KEY (rcdid,compid),
  FOREIGN KEY (compid) REFERENCES composition (compid)
);


INSERT INTO recording VALUES (1,1,4.72,'1959-04-05'),
(2,2,5.75,'1959-04-05'),
(3,3,2.35,'1959-04-05'),
(4,4,5.93,'1959-04-05'),
(5,5,7.00,'1959-04-05'),
(6,6,4.35,'1959-12-02'),
(7,7,2.95,'1959-04-05'),
(8,1,5.93,'1959-04-01'),
(9,6,7.00,'1959-04-01'),
(10,2,6.95,'1959-04-05'),
(11,3,3.67,'1959-04-05'),
(12,2,4.45,'1959-04-05'),
(13,8,3.20,NULL),
(14,9,2.85,NULL),
(15,10,3.60,NULL),
(16,11,2.95,NULL),
(17,12,3.57,NULL),
(18,13,2.75,NULL),
(19,14,2.85,NULL),
(20,15,3.25,NULL),
(21,16,3.23,NULL),
(22,17,7.20,NULL),
(23,18,3.18,NULL),
(24,19,3.18,NULL),
(25,20,3.00,NULL);


CREATE TABLE track (
  cdid integer NOT NULL,
  trkid integer NOT NULL,
  rcdid integer NOT NULL,
  PRIMARY KEY (cdid,trkid,rcdid),
  FOREIGN KEY (cdid) REFERENCES cd (cdid)
  FOREIGN KEY (rcdid) REFERENCES recording (rcdid)
);


INSERT INTO track VALUES (1,1,1),
(1,2,2),
(1,3,3),
(1,4,4),
(1,5,5),
(1,6,6),
(1,7,7),
(1,8,1),
(1,9,6),
(1,10,2),
(1,11,3),
(1,12,5),
(2,1,13),
(2,2,14),
(2,3,15),
(2,4,16),
(2,5,17),
(2,6,18),
(2,7,19),
(2,8,20),
(2,9,21),
(2,10,22),
(2,11,23),
(2,12,24),
(2,13,25);


CREATE TABLE person_recording (
  psnid integer NOT NULL,
  rcdid integer NOT NULL,
  compid integer ,
  psncdprole text ,
  PRIMARY KEY (psnid,rcdid),
  FOREIGN KEY (psnid) REFERENCES person (psnid),
  FOREIGN KEY (rcdid, compid) REFERENCES recording (rcdid, compid)
);


INSERT INTO person_recording VALUES (1,1,1,'tenor sax'),
(2,1,1,'piano'),
(3,1,1,'bass'),
(4,1,1,'drums');


CREATE TABLE grp (
  grpid integer NOT NULL,
  grpname text ,
  PRIMARY KEY (grpid)
);


INSERT INTO grp VALUES (1,'Manhattan Transfer'),
(2,'Asleep at the Wheel');


CREATE TABLE group_recording (
  grpid integer NOT NULL,
  rcdid integer NOT NULL,
  compid integer NOT NULL,
  grpcdrole text NOT NULL,
  PRIMARY KEY (grpid,rcdid,compid,grpcdrole),
  FOREIGN KEY (grpid) REFERENCES grp (grpid),
  FOREIGN KEY (rcdid, compid) REFERENCES recording (rcdid, compid)
);


INSERT INTO group_recording VALUES (1,20,15,'vocals'),
(1,21,16,'vocals'),
(1,22,17,'vocals'),
(1,23,18,'vocals'),
(1,24,19,'vocals'),
(1,25,20,'vocals'),
(2,15,10,'music'),
(2,16,11,'music'),
(2,19,14,'music');


CREATE TABLE group_cd (
  grpid integer NOT NULL,
  cdid integer NOT NULL,
  grpcdorder integer ,
  PRIMARY KEY (grpid,cdid),
  FOREIGN KEY (cdid) REFERENCES cd (cdid),
  FOREIGN KEY (grpid) REFERENCES grp (grpid)
);


INSERT INTO group_cd VALUES (1,2,1),
(2,2,2);


CREATE TABLE person_group (
  grpid integer NOT NULL,
  psnid integer NOT NULL,
  PRIMARY KEY (grpid,psnid),
  FOREIGN KEY (grpid) REFERENCES grp (grpid),
  FOREIGN KEY (psnid) REFERENCES person (psnid)
);


INSERT INTO person_group VALUES (1,5),
(1,6),
(1,7),
(1,8);