DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS MonumentMilitaryOffice;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;
DROP TABLE IF EXISTS LegioServicemen;
DROP TABLE IF EXISTS MonumentCorpus;
DROP TABLE IF EXISTS Units;
DROP TABLE IF EXISTS MonumentUnit;
DROP TABLE IF EXISTS MilitaryStatus;
DROP TABLE IF EXISTS MonumentServicemen;


CREATE TABLE FindSpot (
	FindSpotID INTEGER PRIMARY KEY,
	RomanProvince TEXT,
	AncientSettlement TEXT,
	SpecificAncientProveniance TEXT,
	ModernSettlement TEXT,
	ModernProvenance TEXT,
	LocationNote TEXT,
	ExtraInfo TEXT,
	LONG NUMBER,
	LAT NUMBER,
	Pleiades TEXT,
	Trismegistos TEXT
);

-- LONG and LAT are approximate, more related to the settlement/specific location than the actual monument itself.
-- Need to check all of these are actually being used, some FindSpotID may no longer be relevant

INSERT INTO FindSpot
(FindSpotID,RomanProvince,	AncientSettlement,						SpecificAncientProveniance, 		ModernSettlement,				ModernProvenance,									LocationNote,	LONG,				LAT,				Pleiades,                                    Trismegistos)
     VALUES (1,	'Dalmatia', 'Iadera',											null,														null,										null,															null,					15.223778,	44.115501,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(2, 'Dalmatia', 'Aequum',											null,														'Sinj',									null,															null,					16.655704,	43.739278,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(3, 'Dalmatia', 'Spalatum',										null,														'Split',								'Mausoleum of Diocletian',				null,					16.4388951,	43.507814,	'https://pleiades.stoa.org/places/834862588',	'https://www.trismegistos.org/place/29361'),
				 		(4, 'Dalmatia', 'Aequum',											null,														'Hrvace',								'Secondary use',									null,					16.621101,	43.755188,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(5,	'Dalmatia', 'Tilurium',										null,														'Vojnić',								null,															null,					16.700356,	43.615035,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(6, 'Dalmatia', 'Tilurium',										null,														'Gardun',								null,															null,					16.714766,	43.612006,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(7, 'Dalmatia', null,													null,														null,										null,															null,					null,				null,				'https://pleiades.stoa.org/places/981522',		'https://www.trismegistos.org/place/11624'),
				 		(8, 'Dalmatia', 'Salona',											'North Necropolis',							'Solin',								null,															null,					16.476543,	43.538690,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(9, 'Dalmatia', 'Salona',											'East Necropolis',							'Solin',								null,															null,					16.491405,	43.541733,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(10,'Dalmatia',	'Iadera',											null,														null,										'Filippi house',									null,					15.237922,	44.120336,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(11,'Dalmatia',	'Salona',											null,														'Solin',								null,															null,					16.483426,	43.539561,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
         		(12,'Dalmatia',	'Pagus Scunasticus',					null,														'Filovača',							null,															null,					17.561619,	43.195182,	null,																					'https://www.trismegistos.org/place/43363'),
         		(13,'Dalmatia',	'Tilurium',										null,														'Gardun',								'Secondary use',									null,					16.714676,	43.612652,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
         		(14,'Dalmatia',	'Iadera',											null,														null,										'Church of st Michael',						null,					15.283776,	44.219355,	'https://pleiades.stoa.org/places/197312',		'https://www.trismegistos.org/place/28796'),
         		(15,'Dalmatia',	'Narona',											null,														'Vid-Metković',					null,															null,					17.62464523,43.08130155,'https://pleiades.stoa.org/places/197400',		'https://www.trismegistos.org/place/16527'),
         		(16,'Thracia',	'Lysimacheia',								null,														'Bolayir',							null,															null,					26.762394,	40.515920,	'https://pleiades.stoa.org/places/501458',		'https://www.trismegistos.org/place/3582'),
				 		(17,'Dalmatia',	null,													null,														'Dugopolje',						null,															null,					16.589915,	43.599333,	null,																					'https://www.trismegistos.org/place/29360'),
				 		(18,'Dalmatia',	'Corinium',										null,														'Donji Karin',					null,															null,					15.633504,	44.104527,	'https://pleiades.stoa.org/places/197225',		'https://www.trismegistos.org/place/29319'),
				 		(19,'Dalmatia',	'Tilurium',										null,														'Košute',								null,															null,					16.699521,	43.626113,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(20,'Dalmatia',	null,													null,														'Dicmo',								null,															null,					16.593133,	43.635791,	null,																					'https://www.trismegistos.org/place/29340'),
				 		(21,'Dalmatia',	null,													null,														'Prud',									null,															null,					17.5494842,	43.0920794,	null,																					'https://www.trismegistos.org/place/36202'),
				 		(22,'Dalmatia',	null,													null,														'Imotski',							null,															null,					17.217691,	43.447478,	null,																					'https://www.trismegistos.org/place/29382'),
				 		(23,'Dalmatia',	'Pons Tiluri',								null,														'Trilj',								'Cetina River',										null,					16.728064,	43.61461719,'https://pleiades.stoa.org/places/197453',		'https://www.trismegistos.org/place/40852'),
				 		(24,'Moesia S',	'Viminacium',									null,														'Drmno',								null,															null,					21.230575,	44.732910,	'https://pleiades.stoa.org/places/207549',		'https://www.trismegistos.org/place/29642'),
				 		(25,'Dalmatia',	'Pagus Scunasticus',					null,														'Vuna-Hardomilje',			null,															null,					17.544753,	43.159097,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(26,'Dalmatia',	'Asseria',										null,														'Podgrađe',							null,															null,					15.6663802,	44.01096805,'https://pleiades.stoa.org/places/197145',		'https://www.trismegistos.org/place/28793'),
				 		(27,'Dalmatia',	'Pagus Scunasticus',					null,														'Veljaci',							null,															null,					17.445,			43.237222,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(28,'Dalmatia',	'Aequum',											null,														'Glavice',							null,															null,					16.661095,	43.711624,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(29,'Dalmatia',	'Tilurium',										null,														'Trilj',								null,															null,					16.723601,	43.618756,	'https://pleiades.stoa.org/places/197552',		'https://www.trismegistos.org/place/29459'),
				 		(30,'Dalmatia',	'Municipium Riditarum/Rider',	null,														'Danilo',								null,										'near Šibenik',					16.055704,	43.700462,	'https://pleiades.stoa.org/places/197473',		'https://www.trismegistos.org/place/29458'),
				 		(31,'Dalmatia',	'Narona',											null,														'Čitluk',								null,															null,					17.698194,	43.228021,	'https://pleiades.stoa.org/places/197400',		'https://www.trismegistos.org/place/16527'),
				 		(32,'Dalmatia',	'Andetrium',									null,														'Gornji Muć',						null,															null,					16.484007,	43.690597,	'https://pleiades.stoa.org/places/197115',		'https://www.trismegistos.org/place/29420'),
				 		(33,'Dalmatia',	'Pagus Scunasticus',					null,														'Gračine-Humac',				null,															null,					17.528855,	43.182217,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(34,'Dalmatia',	'Aequum',											null,														'Hrvace',								null,															null,					16.621101,	43.755188,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(35,'Dalmatia',	'Siculi',											null,														'Bijaći',								null,					'near Tragurium/Trogir',					16.298595,	43.555434,	'https://pleiades.stoa.org/places/197511',		'https://www.trismegistos.org/place/29385'),
				 		(36,'Dalmatia',	'Salona',											'near Porta Caesarea',					'Solin',								null,															null,					16.4823429,	43.5383152,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(37,'Dalmatia',	'Salona',											'North Necropolis',							'Kapljuč',							null,															null,					16.476790,	43.539370,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(38,'Dalmatia',	'Pagus Scunasticus',					null,														'Grebine-Vitaljina',		null,															null,					17.5285698,	43.182298,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(39,'Dalmatia',	null,													null,														'Vaganj-Jajce',					null,															null,					17.17608,		44.15513,		null,																					'https://www.trismegistos.org/place/36267'),
				 		(40,'Galatia',	'Antiochia Pisidiae',					null,														'Yalvaç',								null,															null,					31.1894355,	38.305175,	'https://pleiades.stoa.org/places/609307',		'https://www.trismegistos.org/place/204'),
				 		(41,'Galatia',	'Cormasa',										null,														'Gâvur Ören',						null,				'near Antiochia Pisidiae',					30.1194035,	37.5053445,	'https://pleiades.stoa.org/places/638936',		'https://www.trismegistos.org/place/16132'),
				 		(42,'Galatia',	'Iconium',										null,														'Konya',								null,				'near Antiochia Pisidiae',					32.492331,	37.872202,	'https://pleiades.stoa.org/places/648647',		'https://www.trismegistos.org/place/2919'),
         		(43,'Dalmatia',	'Tragurium',									null,														'Trogir',								null,															null,					16.25063,		43.517639,	'https://pleiades.stoa.org/places/197555',		'https://www.trismegistos.org/place/29369'),
         		(44,'Dalmatia',	'Burnum',											null,														'Kistanje',							null,															null,					16.025622,	44.018914,	'https://pleiades.stoa.org/places/197184',		'https://www.trismegistos.org/place/29387'),
         		(45,'Dalmatia',	'Salona',											'East Necropolis originally?',	'Klis', 								null,															null,					16.496858,	43.540222,	'https://pleiades.stoa.org/places/197488',		'https://www.trismegistos.org/place/7043'),
				 		(46,'Dalmatia',	'Tragurium',									null,														'Seget Donji',					null,															null,					16.2333,		43.5167,		'https://pleiades.stoa.org/places/197555',		'https://www.trismegistos.org/place/29369'),
				 		(47,'Dalmatia',	'Andetrium',									null,														'Gornji Postinje',			null,															null,					16.424,			43.701,			'https://pleiades.stoa.org/places/197115',		'https://www.trismegistos.org/place/29420'),
			   		(48,'Dalmatia',	null,													null,														'Popovići',							null,											'near Karin',					15.663098,	44.075137,	null,																					'https://www.trismegistos.org/place/36189'),
				 		(50,'Dalmatia',	null,													null,														'Razvođe',							null,						'near Burnum/Kistanje',					16.107708,	43.92898,		null,																					null),
				 		(49,'Dalmatia',	null,													null,														'Krug',									null,					'near Jesenice, Poljice',					16.634664,	43.456728,	null,																					'https://www.trismegistos.org/place/36097'),
				 		(52,'Dalmatia',	null,													'Originally Aequum?',						'Sinjsko polje',				null,															null,					16.695576,	43.675387,	null,																					null),
				 		(51,'Dalmatia',	null,													null,														'Gorica',								null,					'near Dubrava, Poljice',					16.647371,	43.495214,	null,																					null),
			   		(53,'Dalmatia',	'Aequum',											null,														'Krinj',								null,															null,					16.644167,	43.745556,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(54,'Dalmatia',	'Aequum',											null,														'Čitluk',								null,															null,					16.655704,	43.739278,	'https://pleiades.stoa.org/places/197095',		'https://www.trismegistos.org/place/19893'),
				 		(55,'Galatia',	'Apollonia/Tymandus',					null,														null,										null,															null,					30.607024,	38.104416,	'https://pleiades.stoa.org/places/609563',		'https://www.trismegistos.org/place/16444'),
				 		(56,'Dalmatia',	'Pagus Scunasticus',					null,														'Glavica-Ljubuški',			null,															null,					17.556913,	43.196349,	null,																					'https://www.trismegistos.org/place/43363'),
			 	 		(57,'Dalmatia',	'Pagus Scunasticus',					null,														'Humac',								null,															null,					17.528855,	43.182217,	null,																					'https://www.trismegistos.org/place/43363'),
				 		(58,'Dalmatia',	'Pagus Scunasticus',					null,														'Smokovice-Hardomilje',	null,															null,					17.544753,	43.159097,	null,																					'https://www.trismegistos.org/place/43363');

select 'findspotsloaded', count(*) from FindSpot;


CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	FirstPublicationCitation TEXT,
	DateFound DATE,
	DateFoundPrecisionNote TEXT,
	MonumentType TEXT,
	MonumentOfSeventhLegion TEXT,
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
	ModernHolding TEXT,
	HoldingData TEXT,
	MonumentNote TEXT,
	DBInclusionNote TEXT
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
UPDATE monument SET MonumentOfSeventhLegion = NULL WHERE MonumentOfSeventhLegion = '';
UPDATE monument SET Inscription = NULL WHERE Inscription = '';
UPDATE monument SET Translation = NULL WHERE Translation = '';
UPDATE monument SET LowerFieldDecoration = NULL WHERE LowerFieldDecoration = '';
UPDATE monument SET LowerFieldDetail = NULL WHERE LowerFieldDetail = '';
UPDATE monument SET Portrait = NULL WHERE Portrait = '';
UPDATE monument SET Frieze = NULL WHERE Frieze = '';
UPDATE monument SET DateFrom = NULL WHERE DateFrom = '';
UPDATE monument SET DateTo = NULL WHERE DateTo = '';
UPDATE monument SET DateNote = NULL WHERE DateNote = '';
UPDATE monument SET ModernHolding = NULL WHERE ModernHolding = '';
UPDATE monument SET StelaeType = NULL WHERE StelaeType = '';
UPDATE monument SET HoldingData = NULL WHERE HoldingData = '';
UPDATE monument SET MonumentNote = NULL WHERE MonumentNote = '';
UPDATE monument SET DBInclusionNote = NULL WHERE DBInclusionNote = '';



CREATE TABLE Units (
	UnitID INTEGER PRIMARY KEY,
	UnitTitle TEXT
);

INSERT INTO Units
(UnitID, UnitTitle)
	VALUES 	(1,'Legio VII'),
					(2,'Legio VII CPF'),
	        (3,'Legio VII Claudia'),
	        (4,'Legio VII or VII CPF'),
					(5,'Legio XI'),
					(6,'Ala Tungrorum'),
	        (7,'Cohors II Cyrrhestarum'),
					(8,'Legio VII Macedonica'),
					(9,'Legio VII or VIII'),
					(10,'Legio VII CPF and VII Claudia'),
					(11,'Legio VII CPF or XI CPF'),
					(12,'Legio VII, VII CPF, XI, XI CPF');

select 'unitsloaded', count(*) from Units;

--CREATE TABLE MonumentUnit (
--	MilitaryStatusID INTEGER PRIMARY KEY,
--	MonumentID INTEGER REFERENCES Monument,
--	UnitID INTEGER REFERENCES Units
--);
--
--.mode csv
--.import ../Unit_Monument.csv MonumentUnit
--
--select 'monumentunitsloaded', count(*) from MonumentUnit;

CREATE TABLE MilitaryStatus (
	MilitaryStatusID INTEGER PRIMARY KEY,
	FirstRecordedOffice TEXT,
 	SecondRecordedOffice TEXT,
	FirstOfficeCertainty TEXT,
	SecondOfficeCertainty TEXT,
	VeteranStatus TEXT,
	VeteranStatusCertainty TEXT
);
--
INSERT INTO MilitaryStatus
(MilitaryStatusID, FirstRecordedOffice, SecondRecordedOffice, FirstOfficeCertainty, SecondOfficeCertainty, VeteranStatus, VeteranStatusCertainty)
	VALUES 	(1,	'miles',							null,									'specified',null,					null,				null),
					(2,	'eques',							null,									'specified',null,					null,				null),
					(3,	'eques',							null,									'likely',		null,					null,				null),
					(4,	'eques',							null,									'specified',null,					'veteran',	'specified'),
					(5,	'centurio',						null,									'specified',null,					null,				null),
					(6,	'centurio',						null,									'specified',null,					'veteran',	'specified'),
					(7,	'centurio', 					null, 								'likely',		null,					null, 			null),
					(8,	'centurio',						null,									'likely',		null,					'veteran',	'likely'),
					(9,	'signifer',						null,									'specified',null,					null,				null),
					(10,'imaginifer',					null,									'specified',null,					null,				null),
					(11,null,									null,									null,				null,					null,				null),
					(12,'tribunus',						'iudex',							'likely',		'specified',	null,				null),
					(13,'princeps posterior',	null,									'specified',null,					null,				null),
					(14,null,									null,									null,				null,					'veteran',	'specified'),
					(15,null,									null,									null,				null,					'veteran',	'likely'),
					(16,'scriba',							null,									'specified',null,					'veteran',	'specified'),
					(17,'primus pilus',				'praefectus castorum','specified','specified',	null,				null),
					(18,'centurio',						'iudex',							'likely',		'specified',	null,				null),
					(19,'miles',							'exacto consularis',	'specified','specified',	null,				null),
					(20,'centurio',						'iudex',							'specified','specified',	null,				null),
					(21,null,									null,									null,				null,					'veteran',	'conjecture');

	select 'officesloaded', count(*) from MilitaryStatus;

--CREATE TABLE MonumentMilitaryOffice (
--	  DistinctOffice NUMBER PRIMARY KEY,
--		ServicemanID INTEGER REFERENCES LegioServicemen,
--    OfficeType TEXT,
--		MonumentID INTEGER REFERENCES Monument
--);
--
--.mode csv
--.import ../MonumentMilitaryOffice.csv MonumentMilitaryOffice
--
--select 'militaryserviceloaded', count(*) from MonumentMilitaryOffice;
--
--UPDATE MonumentMilitaryOffice SET OfficeType = NULL WHERE OfficeType = '';
--UPDATE MonumentMilitaryOffice SET ServicemanID = NULL WHERE ServicemanID = '';

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

.mode csv
.import ../MonumentCorpus.csv MonumentCorpus

select 'referencesloaded', count(*) from MonumentCorpus;

UPDATE MonumentCorpus SET isPrimaryReference = NULL WHERE isPrimaryReference = '';

CREATE TABLE LegioServicemen (
  ServicemanID INTEGER PRIMARY KEY,
	Name TEXT,
	DefiniteServiceman TEXT,
	UnitID INTEGER REFERENCES Units,
	LiklihoodOfUnitAttribution TEXT,
  MilitaryStatusID INTEGER REFERENCES MilitaryStatus,
	Tribe TEXT,
	OriginProvince TEXT,
	OriginSettlement TEXT,
	TribusDomiciliumNote TEXT,
	ServicemanNote TEXT
);
-- 'ServicemanID' is used to refer to the Legio VII serviceman recorded upon the inscription. There can be multiple per MonumentID
-- DefiniteServiceman refers to whether or not they were a soldier/milites, not necessarily Legio VII. For that, see .Monument

.mode csv
.import ../LegioServicemen.csv LegioServicemen

select 'legionariesloaded', count(*) from LegioServicemen;

UPDATE LegioServicemen SET Name = NULL WHERE Name = '';
UPDATE LegioServicemen SET DefiniteServiceman = NULL WHERE DefiniteServiceman = '';
UPDATE LegioServicemen SET UnitID = NULL WHERE UnitID = '';
UPDATE LegioServicemen SET LiklihoodOfUnitAttribution = NULL WHERE LiklihoodOfUnitAttribution = '';
UPDATE LegioServicemen SET Tribe = NULL WHERE Tribe = '';
UPDATE LegioServicemen SET MilitaryStatusID = NULL WHERE MilitaryStatusID = '';
UPDATE LegioServicemen SET OriginProvince = NULL WHERE OriginProvince = '';
UPDATE LegioServicemen SET OriginSettlement = NULL WHERE OriginSettlement = '';
UPDATE LegioServicemen SET ServicemanNote = NULL WHERE ServicemanNote = '';
UPDATE LegioServicemen SET TribusDomiciliumNote = NULL WHERE TribusDomiciliumNote = '';



CREATE TABLE MonumentServicemen (
	  MonumentServicemanID NUMBER PRIMARY KEY,
		ServicemanID INTEGER REFERENCES LegioServicemen,
		MonumentID INTEGER REFERENCES Monument,
		ReferencedAs TEXT,
		PossibleDuplicateServicemanID INTEGER,
		SourceForDuplicateArgument TEXT
);

--'Referenced As' refers to how Serviceman is referred to: either as commemorator,
-- commemorated, both (erected during lifetime), administrator, or dedicant (sacral inscriptions)
-- PossibleDuplicateServicemanID records the ServicemanID of the individual which may be a duplicate of this certain MonumentID

.mode csv
.import ../MonumentServicemen.csv MonumentServicemen

select 'monumentservicemenloaded', count(*) from MonumentServicemen;

UPDATE MonumentServicemen SET ReferencedAs = NULL WHERE ReferencedAs = '';
UPDATE MonumentServicemen SET PossibleDuplicateServicemanID = NULL WHERE PossibleDuplicateServicemanID = '';
UPDATE MonumentServicemen SET SourceForDuplicateArgument = NULL WHERE SourceForDuplicateArgument = '';


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
SELECT
	ServicemanID,
	MonumentID as 'Monument',
	CorpusName ||' '|| Reference as 'Reference',
	Name AS 'Nomina',
	Tribe AS 'Tribus',
	OriginSettlement ||', '|| (coalesce(OriginProvince, ' ')) AS 'Domicilium',
	DefiniteServiceman AS 'Serviceman?',
	UnitTitle ||'('|| LiklihoodOfUnitAttribution AS 'Unit Afilliation and Certainty',
	FirstRecordedOffice ||'('|| FirstOfficeCertainty AS 'Office and Certainty',
	SecondRecordedOffice ||'('|| SecondOfficeCertainty AS 'Other Office if specified',
	VeteranStatus ||'('|| VeteranStatusCertainty AS 'Veteran Status and Certainty',
	MonumentType,
	ServicemanNote
	FROM LegioServicemen
		JOIN Monument USING (MonumentID)
		JOIN MonumentCorpus USING (MonumentID)
		JOIN MilitaryStatus USING (MilitaryStatusID)
		JOIN Units USING (UnitID)
	WHERE isPrimaryReference = '1'
	AND (MonumentType = 'stela'
			or MonumentType = 'funerary inscription'
			or MonumentType = 'titulus'
			or MonumentType = 'inscription fragment'
			or MonumentType = 'sacral monument'
			or MonumentType = 'altar')
	ORDER BY DefiniteServiceman DESC, ServicemanID;

DROP VIEW IF EXISTS Reference_Monument_Location;
--CREATE VIEW Reference_Monument_Location AS
--SELECT 	MonumentID,
--				MonumentCorpus.CorpusName ||' '|| MonumentCorpus.Reference as Reference,
--				Monument.MonumentType,
--				UnitsMentioned AS 'Units Mentioned',
--				FindSpot.RomanProvince,
--				FindSpot.AncientSettlement,
--				FindSpot.SpecificAncientProveniance,
--				FindSpot.ModernSettlement,
--				FindSpot.ModernProvenance,
--				FindSpot.LocationNote,
--				Location ||'. '|| MonumentNote AS 'Modern Location and Notes'
--  FROM Monument JOIN MonumentCorpus USING (MonumentID)
--				JOIN FindSpot USING (FindSpotID)
--				JOIN (SELECT MonumentID, group_concat(UnitID, ', ') as UnitsMentioned
--        			 FROM MonumentUnit
--					 WHERE MonumentID = MonumentID
--        			 GROUP BY MonumentID) as MonumentUnitTable USING (MonumentID)
--
-- WHERE isPrimaryReference = '1';