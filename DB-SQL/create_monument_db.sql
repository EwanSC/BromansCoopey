DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS MonumentMilitaryOffice;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;
DROP TABLE IF EXISTS LegioServicemen;
DROP TABLE IF EXISTS MonumentCorpus;


CREATE TABLE FindSpot (
	FindSpotID INTEGER PRIMARY KEY,
	Province TEXT,
	Settlement TEXT,
	ExtraInfo TEXT,
	LONG NUMBER,
	LAT NUMBER,
	Pleiades INTEGER
);

-- LONG and LAT are approximate, more related to the settlement/specific location than the actual monument itself.
-- Need to check all of these are actually being used, some FindSpotID may no longer be relevant

INSERT INTO FindSpot (FindSpotID, Province,   Settlement, ExtraInfo, LONG, LAT, Pleiades)
     VALUES          (1,          'Dalmatia', 'Iadera',null,15.223778,44.115501,197312),
                     (2,          'Dalmatia', 'Aequum','sinj',16.655704,43.739278,197095),
										 (3,          'Dalmatia', 'Salona',  'Grad Diokletianpalast Mausoleum',16.44032121,43.50811796,197488),
										 (4,          'Dalmatia', 'Aequum',  'Hrvace, in a Barn',16.621101,43.755188,197095),
										 (5, 					'Dalmatia', 'Tilurium','Vojnić',16.700356,43.615035,197552),
										 (6,          'Dalmatia', 'Tilurium','Gardun',16.714766,43.612006,197552),
										 (7,          'Dalmatia', null,null,null,null,981522),
										 (8,          'Dalmatia', 'Salona',  'North Necropolis',16.476543,43.538690,197488),
										 (9,          'Dalmatia', 'Salona',  'East Necropolis',16.491405,43.541733,197488),
										 (10,         'Dalmatia','Iadera','Filippi house',15.237922,44.120336,197312),
                     (11,         'Dalmatia','Salona',null,16.483426,43.539561,197488),
                     (12,         'Dalmatia','Bigeste/Ljubuški','Filovača',17.561619,43.195182,197167),
                     (13,         'Dalmatia','Tilurium','Gardun, built into a house',16.714676,43.612652,197552),
                     (14,         'Dalmatia','Iadera','Church of st Michael',15.283776,44.219355,197312),
                     (15,         'Dalmatia','Narona','Vid Metković',17.62464523, 43.08130155,197400),
                     (16,         'Thracia','Lysimacheia',null,26.762394,40.515920,501458),
										 (17,         'Dalmatia','Dugopolje','Near Tilurium and Salona',16.589915,43.599333,null),
										 (18,         'Dalmatia','Corinium','Karin, Near Iadera',15.633504,44.104527,197225),
										 (19,         'Dalmatia','Tilurium','Košute',16.699521,43.626113,197552),
										 (20,         'Dalmatia','Dicmo','Near Tilurium',16.593133,43.635791,null),
										 (21,         'Dalmatia','Prud',null,17.5494842,43.0920794,null),
										 (22,         'Dalmatia','Imotski' ,null,17.217691,43.447478,null),
										 (23,         'Dalmatia','Tilurium','Cetina River',16.728064,43.61461719,197552),
										 (24,         'MoesiaS','Viminacium',null,21.230575,44.732910,207549),
										 (25,         'Dalmatia','Bigeste/Ljubuški','Hardomilje',17.544753,43.159097,197167),
										 (26,         'Dalmatia','Asseria','Podgrađe',15.6663802,44.01096805,197145),
										 (27,         'Dalmatia','Bigeste/Ljubuški','Veljaci',17.445,43.237222,197167),
										 (28,         'Dalmatia','Aequum','Glavice, near Sinj',16.661095,43.711624,197095),
										 (29,         'Dalmatia','Tilurium','Trilj',16.723601,43.618756,197552),
										 (30,         'Dalmatia','Municipium Riditarum/Rider, Danilo','Near Šibenik',16.055704,43.700462,197473),
										 (31,         'Dalmatia','Narona','Čitluk',17.698194,43.228021,197400),
										 (32,         'Dalmatia','Andetrium','Gornji Muć',16.484007,43.690597,197115),
										 (33,         'Dalmatia','Bigeste/Ljubuški','Humac',17.533683,43.184896,197167),
										 (34,         'Dalmatia','Aequum','Hrvace',16.621101,43.755188,197095),
										 (35,         'Dalmatia','Siculi','Bijaći, near Tragurium',16.298595,43.555434,197511),
										 (36,         'Dalmatia','Salona','Near Porta Caesarea',16.4823429,43.5383152,197488),
										 (37,         'Dalmatia','Salona','North Necropolis, Kapljuč',16.476790,43.539370,197488),
										 (38,         'Dalmatia','Bigeste/Ljubuški','Vitaljina',17.5285698,43.182298,197167),
										 (39,         'Dalmatia','Vaganj','Near jajce',17.17608,44.15513,null),
										 (40,         'Galatia','Antiochia Pisidiae', null, 31.1894355,38.305175,609307),
										 (41,         'Galatia','Cormasa','near Antiochia Pisidiae',30.1194035,37.5053445,638936),
										 (42,         'Galatia','Iconium','near Antiochia Pisidiae',32.492331,37.872202,648647),
                     (43,         'Dalmatia','Tragurium',null,16.25063,43.517639,197555),
                     (44,         'Dalmatia','Burnum',null,16.025622,44.018914,197184),
                     (45,         'Dalmatia','Salona','Modern Klis, possibly from the East Necropolis originally',16.496858,43.540222,197488),
										 (46,         'Dalmatia','Tragurium','Seget Donji',16.2333,43.5167,197555),
										 (47,         'Dalmatia','Andetrium','Gornji Postinje',16.424,43.701,197115),
									   (48,         'Dalmatia','Popovići','Near Karin',15.663098,44.075137,null),
										 (50,         'Dalmatia','Razvođe', 'Near Burnum',16.107708,43.92898,null),
										 (49,         'Dalmatia','Krug', 'Near Jesenice, Poljice',16.634664,43.456728,null),
										 (52,         'Dalmatia','Sinjsko polje','The area between Aequum and Tilurium',16.695576,43.675387,197552),
										 (51,         'Dalmatia','Gorica','Near Dubrava, Poljice',16.647371,43.495214,null),
									   (53,         'Dalmatia','Aequum','Krinj, near Čitluk',16.644167,43.745556,197095),
										 (54,         'Dalmatia','Aequum','Čitluk',16.655704,43.739278,197095),
										 (55,					'Galatia','Apollonia','Later became site of Tymandus',30.607024,38.104416,609563);

CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	FirstPublicationCitation TEXT,
	DateFound DATE,
	DateFoundPrecisionNote TEXT,
	MonumentType TEXT,
	MemberSeventhLegion TEXT,
	CPFTitle TEXT, -- this can have values of: no, c, cpf, maybe.
	               -- The value "maybe" reflects historical uncertainty
								 -- it could be there, but it could also not be
	Inscription TEXT,
	Translation TEXT,
	DoorMotifPresent BOOLEAN,
	PortraitPresent BOOLEAN,
	WeaponsPresent BOOLEAN,
	DateFrom DATE,
	DateTo DATE,
	DateNote TEXT,
	StelaeType TEXT,
	Location TEXT,
	Note TEXT
);

.mode csv

.import ../monument-spreadsheet.csv Monument


select 'monumentsloaded', count(*) from monument;

UPDATE monument SET MonumentID = NULL WHERE MonumentID = '';
UPDATE monument SET FindSpotID = NULL WHERE FindSpotID = '';
UPDATE monument SET FirstPublicationCitation = NULL WHERE FirstPublicationCitation = '';
UPDATE monument SET DateFound = NULL WHERE DateFound = '';
UPDATE monument SET DateFoundPrecisionNote = NULL WHERE DateFoundPrecisionNote = '';
UPDATE monument SET MonumentType = NULL WHERE MonumentType = '';
UPDATE monument SET MemberSeventhLegion = NULL WHERE MemberSeventhLegion = '';
UPDATE monument SET CPFTitle = NULL WHERE CPFTitle = '';
UPDATE monument SET Inscription = NULL WHERE Inscription = '';
UPDATE monument SET Translation = NULL WHERE Translation = '';
UPDATE monument SET DoorMotifPresent = NULL WHERE DoorMotifPresent = '';
UPDATE monument SET PortraitPresent = NULL WHERE PortraitPresent = '';
UPDATE monument SET WeaponsPresent = NULL WHERE WeaponsPresent = '';
UPDATE monument SET DateFrom = NULL WHERE DateFrom = '';
UPDATE monument SET DateTo = NULL WHERE DateTo = '';
UPDATE monument SET DateNote = NULL WHERE DateNote = '';
UPDATE monument SET Location = NULL WHERE Location = '';
UPDATE monument SET StelaeType = NULL WHERE StelaeType = '';
UPDATE monument SET Note = NULL WHERE Note = '';


CREATE TABLE MonumentMilitaryOffice (
	  DistinctOffice NUMBER PRIMARY KEY,
		ServicemanID INTEGER REFERENCES LegioServicemen,
    OfficeType TEXT,
		MonumentID INTEGER REFERENCES Monument
);

--INSERT INTO MonumentMilitaryOffice (MonumentID, OfficeType)
--     VALUES                        (1,          'Milites'),
--		                               (2,          'Milites');
-- This was originaly going to be put in manually, but I decided to put in an 'automatic' .csv import system.

.mode csv

.import ../MonumentMilitaryOffice.csv MonumentMilitaryOffice

UPDATE MonumentMilitaryOffice SET OfficeType = NULL WHERE OfficeType = '';
UPDATE MonumentMilitaryOffice SET ServicemanID = NULL WHERE ServicemanID = '';



CREATE TABLE Corpus (
	CorpusName TEXT PRIMARY KEY
);

--which db type is this?

INSERT INTO Corpus (CorpusName)
     VALUES        ('CIL'),
                   ('Tončinić'),
                   ('Betz'),
                   ('ILJug'),
									 ('AE'),
									 ('EDH'),
                   ('Other Ref');


CREATE TABLE MonumentCorpus (
  MonumentCorpusID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES Monument NOT NULL,
	CorpusName TEXT NOT NULL REFERENCES Corpus,
	Reference TEXT NOT NULL,
	isPrimaryReference TEXT
);
-- monumentcorpusID is an autonum we don't care about, so we won't write it. Let the database take care of things.
-- (MonumentID,  CorpusName,  Reference,   isPrimaryReference)
-- below is the import code for automatic .csv importing, it needs to be worked on.

.mode csv

.import ../MonumentCorpus.csv MonumentCorpus

select count(*) from MonumentCorpus;

UPDATE MonumentCorpus SET isPrimaryReference = NULL WHERE isPrimaryReference = '';

CREATE TABLE LegioServicemen (
  ServicemanID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES Monument,
	Name TEXT,
	DefiniteServiceman TEXT,
	ReferencedAs TEXT,
  MilitaryStatus TEXT,
	Tribe TEXT,
	OriginProvince TEXT,
	OriginSettlement TEXT,
	OtherMonument TEXT,
	ServicemanNote TEXT
);
-- 'ServicemanID' is used to refer to the Legio VII serviceman recorded upon the
-- inscription. There can be multiple per MonumentID
-- 'Referenced As' refers to how Serviceman is referred to: either as commemorator,
-- commemorated, both (erected during lifetime), administrator, or dedicant (sacral inscriptions)
-- DefiniteServiceman refers to whether or not they were a soldier/milites, not necessarily Legio VII. For that, see .Monument
-- OtherMonument refers to any other monuemnt in the corpus where this individual was also mentioned (or may have been mentioned)
.mode csv

.import ../LegioServicemen.csv LegioServicemen

select count(*) from LegioServicemen;

UPDATE LegioServicemen SET Name = NULL WHERE Name = '';
UPDATE LegioServicemen SET DefiniteServiceman = NULL WHERE DefiniteServiceman = '';
UPDATE LegioServicemen SET ReferencedAs = NULL WHERE ReferencedAs = '';
UPDATE LegioServicemen SET Tribe = NULL WHERE Tribe = '';
UPDATE LegioServicemen SET MilitaryStatus = NULL WHERE MilitaryStatus = '';
UPDATE LegioServicemen SET OriginProvince = NULL WHERE OriginProvince = '';
UPDATE LegioServicemen SET OriginSettlement = NULL WHERE OriginSettlement = '';
UPDATE LegioServicemen SET OtherMonument = NULL WHERE OtherMonument = '';
UPDATE LegioServicemen SET ServicemanNote = NULL WHERE ServicemanNote = '';


-- Below are the various views created so that some information from various tables can be found in the same view

DROP VIEW IF EXISTS PrimaryCorpus;
CREATE VIEW PrimaryCorpus as
SELECT MonumentID, CorpusName || ': ' || Reference as corpus
  FROM MonumentCorpus
 WHERE isPrimaryReference is not null;


DROP VIEW IF EXISTS AllCorpora;
CREATE VIEW AllCorpora as
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, AE, EDH, OtherRef
  FROM (SELECT MonumentID
          FROM Monument)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as CIL
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'CIL'
        			 GROUP BY MonumentID) as ciltable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as Tončinić
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Tončinić'
        			 GROUP BY MonumentID) as Tončinićtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as Betz
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Betz'
        			 GROUP BY MonumentID) as Betztable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as ILJug
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'ILJug'
        			 GROUP BY MonumentID) as ILJugtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as AE
						   FROM MonumentCorpus
						   WHERE CorpusName = 'AE'
						   GROUP BY MonumentID) as AEtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as EDH
						 	 FROM MonumentCorpus
						   WHERE CorpusName = 'EDH'
						   GROUP BY MonumentID) as EDHtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as OtherRef
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Other Ref'
        			 GROUP BY MonumentID) as OtherReftable USING (MonumentID);

DROP VIEW IF EXISTS 'All Legionaries in Dalmatia';
CREATE VIEW 'All Legionaries in Dalmatia' AS
SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as Reference, Name, MonumentType, militarystatus, Office as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'CPF', Settlement, ExtraInfo
	FROM Monument JOIN FindSpot USING (FindSpotID)
						    JOIN LegioServicemen USING (MonumentID)
						    JOIN MonumentCorpus USING (MonumentID)
						    LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
		        			 FROM MonumentMilitaryOffice
		        			 WHERE MonumentID = MonumentID
		        			 GROUP BY MonumentID) as Officetable USING (MonumentID)
	WHERE province = 'Dalmatia'
   	AND isPrimaryReference = '1'
	  AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');


DROP VIEW IF EXISTS 'All Legionaries';
CREATE VIEW 'All Legionaries' AS
SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as Reference, Name, MonumentType, militarystatus, Office as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'Legio Title', Province
	FROM Monument JOIN FindSpot USING (FindSpotID)
						    JOIN LegioServicemen USING (MonumentID)
						    JOIN MonumentCorpus USING (MonumentID)
						    LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
		        			 FROM MonumentMilitaryOffice
		        			 WHERE MonumentID = MonumentID
		        			 GROUP BY MonumentID) as Officetable USING (MonumentID)
	 WHERE isPrimaryReference = '1'
	 AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');

DROP VIEW IF EXISTS 'Not in Tončinić 2011';
CREATE VIEW 'Not in Tončinić 2011' AS
SELECT MonumentID, CorpusName, Reference, AE, ILJug, OtherRef
	FROM MonumentCorpus JOIN AllCorpora USING (MonumentID)
 WHERE Tončinić IS NULL
	 AND isPrimaryReference is '1';

DROP VIEW IF EXISTS 'Reference, Monument and Location';
CREATE VIEW 'Reference, Monument and Location' AS
SELECT MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference as Reference, monument.MonumentType, FindSpot.province, FindSpot.Settlement, FindSpot.ExtraInfo
  FROM Monument JOIN MonumentCorpus USING (MonumentID)
								JOIN FindSpot USING (FindSpotID)
 WHERE isPrimaryReference = '1';

DROP VIEW IF EXISTS 'Servicemen and Reference';
CREATE VIEW 'Servicemen and Reference' AS
SELECT ServicemanID, MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference AS Reference, AllCorpora.Tončinić, LegioServicemen.Name, LegioServicemen.ReferencedAs, LegioServicemen.Tribe, LegioServicemen.OriginProvince, LegioServicemen.OriginSettlement
  FROM LegioServicemen JOIN MonumentCorpus USING (MonumentID)
											 JOIN AllCorpora USING (MonumentID)
WHERE isPrimaryReference = '1';

DROP VIEW IF EXISTS 'Tončinić and Primary Reference';
CREATE VIEW 'Tončinić and Primary Reference' AS
SELECT MonumentID, CorpusName ||', '|| REFERENCE as 'Reference', Tončinić, Inscription
  FROM MonumentCorpus JOIN AllCorpora USING (MonumentID)
											JOIN Monument USING (MonumentID)
 WHERE isPrimaryReference = '1'
	 AND Tončinić IS NOT NULL
 ORDER BY Reference;
