BEGIN TRANSACTION;

CREATE TABLE Student (
	studentID text PRIMARY KEY,
	FirstName text,
	MiddleName text,
	LastName text,
	InsuranceNumber text
);

CREATE TABLE IF NOT EXISTS "Visited" (
	"id"	integer,
	"site"	text,
	"dated"	text
);
CREATE TABLE IF NOT EXISTS "Survey" (
	"taken"	integer,
	"person"	text,
	"quant"	text,
	"reading"	real
);
CREATE TABLE IF NOT EXISTS "Site" (
	"name"	text,
	"lat"	real,
	"long"	real
);
CREATE TABLE IF NOT EXISTS "Person" (
	"id"	text,
	"personal"	text,
	"family"	text
);
INSERT INTO "Visited" ("id","site","dated") VALUES (619,'DR-1','1927-02-08');
INSERT INTO "Visited" ("id","site","dated") VALUES (622,'DR-1','1927-02-10');
INSERT INTO "Visited" ("id","site","dated") VALUES (734,'DR-3','1930-01-07');
INSERT INTO "Visited" ("id","site","dated") VALUES (735,'DR-3','1930-01-12');
INSERT INTO "Visited" ("id","site","dated") VALUES (751,'DR-3','1930-02-26');
INSERT INTO "Visited" ("id","site","dated") VALUES (752,'DR-3',NULL);
INSERT INTO "Visited" ("id","site","dated") VALUES (837,'MSK-4','1932-01-14');
INSERT INTO "Visited" ("id","site","dated") VALUES (844,'DR-1','1932-03-22');
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (619,'dyer','rad',9.82);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (619,'dyer','sal',0.13);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (622,'dyer','rad',7.8);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (622,'dyer','sal',0.09);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (734,'pb','rad',8.41);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (734,'lake','sal',0.05);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (734,'pb','temp',-21.5);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (735,'pb','rad',7.22);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (735,NULL,'sal',0.06);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (735,NULL,'temp',-26.0);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (751,'pb','rad',4.35);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (751,'pb','temp',-18.5);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (751,'lake','sal',0.1);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (752,'lake','rad',2.19);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (752,'lake','sal',0.09);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (752,'lake','temp',-16.0);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (752,'roe','sal',41.6);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (837,'lake','rad',1.46);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (837,'lake','sal',0.21);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (837,'roe','sal',22.5);
INSERT INTO "Survey" ("taken","person","quant","reading") VALUES (844,'roe','rad',11.25);
INSERT INTO "Site" ("name","lat","long") VALUES ('DR-1',-49.85,-128.57);
INSERT INTO "Site" ("name","lat","long") VALUES ('DR-3',-47.15,-126.72);
INSERT INTO "Site" ("name","lat","long") VALUES ('MSK-4',-48.87,-123.4);
INSERT INTO "Person" ("id","personal","family") VALUES ('dyer','William','Dyer');
INSERT INTO "Person" ("id","personal","family") VALUES ('pb','Frank','Pabodie');
INSERT INTO "Person" ("id","personal","family") VALUES ('lake','Anderson','Lake');
INSERT INTO "Person" ("id","personal","family") VALUES ('roe','Valentina','Roerich');
INSERT INTO "Person" ("id","personal","family") VALUES ('danforth','Frank','Danforth');
COMMIT;
