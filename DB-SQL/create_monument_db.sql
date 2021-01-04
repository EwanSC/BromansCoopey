DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS MonumentMilitaryOffice;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;
DROP TABLE IF EXISTS LegioServicemen;
DROP TABLE IF EXISTS MonumentCorpus;


CREATE TABLE FindSpot (
	FindSpotID INTEGER PRIMARY KEY,
	Province TEXT,
	AncientSettlement TEXT,
	ModernSettlement TEXT,
	ExtraInfo TEXT,
	LONG NUMBER,
	LAT NUMBER,
	Pleiades TEXT,
	Trismegistos TEXT
);

-- LONG and LAT are approximate, more related to the settlement/specific location than the actual monument itself.
-- Need to check all of these are actually being used, some FindSpotID may no longer be relevant

INSERT INTO FindSpot
(FindSpotID,	Province,	AncientSettlement,								ModernSettlement,			ExtraInfo,												LONG,				LAT,				Pleiades,                                    Trismegistos)
     VALUES (1,	'Dalmatia', 'Iadera',											null,										null,															15.223778,	44.115501,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(2, 'Dalmatia', 'Aequum',											'Sinj',									null,															16.655704,	43.739278,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(3, 'Dalmatia', 'Spalatum',										'Split',								'Palace of Diocletian, Mausoleum',16.4388951,	43.507814,	'https://pleiades.stoa.org/places/834862588',	'https://www.trismegistos.org/place/29361'),
				 		(4, 'Dalmatia', 'Aequum',											'Hrvace',								'Secondary use in a Barn',				16.621101,	43.755188,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(5,	'Dalmatia', 'Tilurium',										'Vojnić',								null,															16.700356,	43.615035,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(6, 'Dalmatia', 'Tilurium',										'Gardun',								null,															16.714766,	43.612006,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(7, 'Dalmatia', null,													null,										null,															null,				null,				'https://pleiades.stoa.org/places/981522',		'https://www.trismegistos.org/place/11624'),
				 		(8, 'Dalmatia', 'Salona',											'Solin',								'North Necropolis',								16.476543,	43.538690,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(9, 'Dalmatia', 'Salona',											'Solin',								'East Necropolis',								16.491405,	43.541733,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(10,'Dalmatia',	'Iadera',											null,										'Filippi house',									15.237922,	44.120336,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(11,'Dalmatia',	'Salona',											'Solin',								null,															16.483426,	43.539561,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
         		(12,'Dalmatia',	'Pagus Scunasticus',					'Filovača',							null,															17.561619,	43.195182,	null,																					'https://www.trismegistos.org/place/43363'),
         		(13,'Dalmatia',	'Tilurium',										'Gardun',								'built into a house',							16.714676,	43.612652,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
         		(14,'Dalmatia',	'Iadera',											null,										'Church of st Michael',						15.283776,	44.219355,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(15,'Dalmatia',	'Narona',											'Vid Metković',					null,															17.62464523,43.08130155,'https://pleiades.stoa.org/places/197400',		'https://www.trismegistos.org/place/16527'),
         		(16,'Thracia',	'Lysimacheia',								'Bolayir',							null,															26.762394,	40.515920,	'https://pleiades.stoa.org/places/501458',		'https://www.trismegistos.org/place/3582'),
				 		(17,'Dalmatia',	null,													'Dugopolje',						null,															16.589915,	43.599333,	null,																					'https://www.trismegistos.org/place/29360'),
				 		(18,'Dalmatia',	'Corinium',										'Donji Karin',					null,															15.633504,	44.104527,	'https://pleiades.stoa.org/places/197225',		'https://www.trismegistos.org/place/29319'),
				 		(19,'Dalmatia',	'Tilurium',										'Košute',								null,															16.699521,	43.626113,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(20,'Dalmatia',	null,													'Dicmo',								null,															16.593133,	43.635791,	null,																					'https://www.trismegistos.org/place/29340'),
				 		(21,'Dalmatia',	null,													'Prud',									null,															17.5494842,	43.0920794,	null,																					'https://www.trismegistos.org/place/36202'),
				 		(22,'Dalmatia',	null,													'Imotski',							null,															17.217691,	43.447478,	null,																					'https://www.trismegistos.org/place/29382'),
				 		(23,'Dalmatia',	'Pons Tiluri',								'Trilj',								'Cetina River',										16.728064,	43.61461719,'https://pleiades.stoa.org/places/197453',		'https://www.trismegistos.org/place/40852'),
				 		(24,'Moesia S',	'Viminacium',									'Drmno',								null,															21.230575,	44.732910,	'https://pleiades.stoa.org/places/207549',		'https://www.trismegistos.org/place/29642'),
				 		(25,'Dalmatia',	'Pagus Scunasticus',					'Vuna-Hardomilje',			null,															17.544753,	43.159097,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(26,'Dalmatia',	'Asseria',										'Podgrađe',							null,															15.6663802,	44.01096805,'https://pleiades.stoa.org/places/197145',		'https://www.trismegistos.org/place/28793'),
				 		(27,'Dalmatia',	'Pagus Scunasticus',					'Veljaci',							null,															17.445,			43.237222,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(28,'Dalmatia',	'Aequum',											'Glavice',							null,															16.661095,	43.711624,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(29,'Dalmatia',	'Tilurium',										'Trilj',								null,															16.723601,	43.618756,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(30,'Dalmatia',	'Municipium Riditarum/Rider',	'Danilo',								'Near Šibenik',										16.055704,	43.700462,	'https://pleiades.stoa.org/places/197473',		'https://www.trismegistos.org/place/29458'),
				 		(31,'Dalmatia',	'Narona',											'Čitluk',								null,															17.698194,	43.228021,	'https://pleiades.stoa.org/places/197400',		'https://www.trismegistos.org/place/16527'),
				 		(32,'Dalmatia',	'Andetrium',									'Gornji Muć',						null,															16.484007,	43.690597,	'https://pleiades.stoa.org/places/197115',		'https://www.trismegistos.org/place/29420'),
				 		(33,'Dalmatia',	'Pagus Scunasticus',					'Gračine-Humac',				null,															17.528855,	43.182217,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(34,'Dalmatia',	'Aequum',											'Hrvace',								null,															16.621101,	43.755188,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(35,'Dalmatia',	'Siculi',											'Bijaći',								'Near Tragurium',									16.298595,	43.555434,	'https://pleiades.stoa.org/places/197511',		'https://www.trismegistos.org/place/29385'),
				 		(36,'Dalmatia',	'Salona',											'Solin',								'Near Porta Caesarea',						16.4823429,	43.5383152,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(37,'Dalmatia',	'Salona',											'Kapljuč',							'North Necropolis',								16.476790,	43.539370,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(38,'Dalmatia',	'Pagus Scunasticus',					'Grebine-Vitaljina',		null,															17.5285698,	43.182298,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(39,'Dalmatia',	null,													'Vaganj',								'Jajce',													17.17608,		44.15513,		null,																					'https://www.trismegistos.org/place/36267'),
				 		(40,'Galatia',	'Antiochia Pisidiae',					'Yalvaç',								null,															31.1894355,	38.305175,	'https://pleiades.stoa.org/places/609307',		'https://www.trismegistos.org/place/204'),
				 		(41,'Galatia',	'Cormasa',										'Gâvur Ören',						'near Antiochia Pisidiae',				30.1194035,	37.5053445,	'https://pleiades.stoa.org/places/638936',		'https://www.trismegistos.org/place/16132'),
				 		(42,'Galatia',	'Iconium',										'Konya',								'near Antiochia Pisidiae',				32.492331,	37.872202,	'https://pleiades.stoa.org/places/648647',		'https://www.trismegistos.org/place/2919'),
         		(43,'Dalmatia',	'Tragurium',									'Trogir',								null,															16.25063,		43.517639,	'https://pleiades.stoa.org/places/197555',		'https://www.trismegistos.org/place/29369'),
         		(44,'Dalmatia',	'Burnum',											'Kistanje',							null,															16.025622,	44.018914,	'https://pleiades.stoa.org/places/197184',		'https://www.trismegistos.org/place/29387'),
         		(45,'Dalmatia',	'Salona',											'Klis', 								'East Necropolis originally?',		16.496858,	43.540222,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(46,'Dalmatia',	'Tragurium',									'Seget Donji',					null,															16.2333,		43.5167,		'https://pleiades.stoa.org/places/197555',		'https://www.trismegistos.org/place/29369'),
				 		(47,'Dalmatia',	'Andetrium',									'Gornji Postinje',			null,															16.424,			43.701,			'https://pleiades.stoa.org/places/197115',		'https://www.trismegistos.org/place/29420'),
			   		(48,'Dalmatia',	null,													'Popovići',							'Near Karin',											15.663098,	44.075137,	null,																					'https://www.trismegistos.org/place/36189'),
				 		(50,'Dalmatia',	null,													'Razvođe',							'Near Burnum',										16.107708,	43.92898,		null,																					null),
				 		(49,'Dalmatia',	null,													'Krug',									'Near Jesenice, Poljice',					16.634664,	43.456728,	null,																					'https://www.trismegistos.org/place/36097'),
				 		(52,'Dalmatia',	null,													'Sinjsko polje',				'Originally Aequum?	',						16.695576,	43.675387,	null,																					null),
				 		(51,'Dalmatia',	null,													'Gorica',								'Near Dubrava, Poljice',					16.647371,	43.495214,	null,																					null),
			   		(53,'Dalmatia',	'Aequum',											'Krinj',								null,															16.644167,	43.745556,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(54,'Dalmatia',	'Aequum',											'Čitluk',								null,															16.655704,	43.739278,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(55,'Galatia',	'Apollonia',									null,										'Later became Tymandus',					30.607024,	38.104416,	'https://pleiades.stoa.org/places/609563',		'https://www.trismegistos.org/place/16444'),
				 		(56,'Dalmatia',	'Pagus Scunasticus',					'Glavica-Ljubuški',			null,															17.556913,	43.196349,	null,																					'https://www.trismegistos.org/place/43363'),
			 	 		(57,'Dalmatia',	'Pagus Scunasticus',					'Humac',								null,															17.528855,	43.182217,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(58,'Dalmatia',	'Pagus Scunasticus',					'Smokovice-Hardomilje',	null,															17.544753,	43.159097,	null,																					'https://www.trismegistos.org/place/43363');

select 'findspotsloaded', count(*) from FindSpot;


CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	FirstPublicationCitation TEXT,
	DateFound DATE,
	DateFoundPrecisionNote TEXT,
	MonumentType TEXT,
	MemberSeventhLegion TEXT,
	Unit TEXT, -- this refers to the unit title, even if the unit is not legio VII
	Inscription TEXT,
	Translation TEXT,
	LowerFieldDecoration TEXT,
	LowerFieldDetail TEXT,
	Portrait TEXT,
	Frieze TEXT,
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
UPDATE monument SET Unit = NULL WHERE Unit = '';
UPDATE monument SET Inscription = NULL WHERE Inscription = '';
UPDATE monument SET Translation = NULL WHERE Translation = '';
UPDATE monument SET LowerFieldDecoration = NULL WHERE LowerFieldDecoration = '';
UPDATE monument SET LowerFieldDetail = NULL WHERE LowerFieldDetail = '';
UPDATE monument SET Portrait = NULL WHERE Portrait = '';
UPDATE monument SET Frieze = NULL WHERE Frieze = '';
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
-- DistinctOffice is not really important, just needed a primary key for thist table as a single monumentID and ServicemanID
-- could have multiple Offices for it, thus a unique key was needed

.mode csv
.import ../MonumentMilitaryOffice.csv MonumentMilitaryOffice

select 'officesloaded', count(*) from MonumentMilitaryOffice;

UPDATE MonumentMilitaryOffice SET OfficeType = NULL WHERE OfficeType = '';
UPDATE MonumentMilitaryOffice SET ServicemanID = NULL WHERE ServicemanID = '';



CREATE TABLE Corpus (
	CorpusName TEXT PRIMARY KEY
);

INSERT INTO Corpus (CorpusName)
     VALUES        ('CIL'),
                   ('Tončinić'),
                   ('Betz'),
                   ('ILJug'),
									 ('AE'),
									 ('EDH'),
                   ('Other Ref');

select 'corpusloaded', count(*) from Corpus;


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

select 'referencesloaded', count(*) from MonumentCorpus;

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

select 'legionariesloaded', count(*) from LegioServicemen;

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
SELECT MonumentID, CorpusName || ' ' || Reference as corpus
  FROM MonumentCorpus
 WHERE isPrimaryReference is not null;


DROP VIEW IF EXISTS AllCorpora;
CREATE VIEW AllCorpora as
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, AE, EDH, OtherRef
  FROM (SELECT MonumentID
          FROM Monument)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as CIL
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'CIL'
        			 GROUP BY MonumentID) as ciltable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as Tončinić
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Tončinić'
        			 GROUP BY MonumentID) as Tončinićtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as Betz
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Betz'
        			 GROUP BY MonumentID) as Betztable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as ILJug
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'ILJug'
        			 GROUP BY MonumentID) as ILJugtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as AE
						   FROM MonumentCorpus
						   WHERE CorpusName = 'AE'
						   GROUP BY MonumentID) as AEtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as EDH
						 	 FROM MonumentCorpus
						   WHERE CorpusName = 'EDH'
						   GROUP BY MonumentID) as EDHtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') as OtherRef
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Other Ref'
        			 GROUP BY MonumentID) as OtherReftable USING (MonumentID);

DROP VIEW IF EXISTS All_Servicemen;
CREATE VIEW All_Servicemen AS
SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as 'Reference', ServicemanID, Name, OriginSettlement, OriginProvince, militarystatus, Office as 'ActiveOffice', MemberSeventhLegion as 'MemberLegioVII', Unit as 'MemberCPF', MonumentType, Province as 'Monument_Province'
	FROM Monument JOIN FindSpot USING (FindSpotID)
						    JOIN LegioServicemen USING (MonumentID)
						    JOIN MonumentCorpus USING (MonumentID)
						    LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
		        			 FROM MonumentMilitaryOffice
		        			 WHERE MonumentID = MonumentID
		        			 GROUP BY MonumentID) as Officetable USING (MonumentID)
	 WHERE isPrimaryReference = '1'
	 AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');

DROP VIEW IF EXISTS Reference_Monument_Location;
CREATE VIEW Reference_Monument_Location AS
SELECT MonumentID, MonumentCorpus.CorpusName ||' '|| MonumentCorpus.Reference as Reference, monument.MonumentType, FindSpot.province, FindSpot.Settlement, FindSpot.ExtraInfo
  FROM Monument JOIN MonumentCorpus USING (MonumentID)
								JOIN FindSpot USING (FindSpotID)
 WHERE isPrimaryReference = '1';
