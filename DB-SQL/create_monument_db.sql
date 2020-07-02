DROP TABLE IF EXISTS MonumentCorpus;
DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS MonumentMilitaryOffice;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;
DROP TABLE IF EXISTS LegioServicemen;


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

INSERT INTO FindSpot (FindSpotID, Province,   Settlement, ExtraInfo, LONG, LAT, Pleiades)
     VALUES          (1,          'Dalmatia', 'Iader',null,15.223778, 44.115501,197312),
                     (2,          'Dalmatia', 'Aequum','sinj',16.655704,  43.739278, 197095),
										 (3,          'Dalmatia', 'Salona',  'Grad Diokletianpalast Mausoleum', 16.44032121, 43.50811796,197488),
										 (4,          'Dalmatia', 'Aequum',  'Majstorovici',null,null,197095),
										 (5, 					'Dalmatia', 'Tilurium','Vojnić',null,null,197552),
										 (6,          'Dalmatia', 'Tilurium','Gardun',16.729321,  43.607338,197552),
										 (7,          'Dalmatia', null,null,null,null,981522),
										 (8,          'Dalmatia', 'Salona',  'North Necropolis',null,null,197488),
										 (9,          'Dalmatia', 'Salona',  'East Necropolis',null,null,197488),
										 (10,         'Dalmatia','Iader','Filippi house', null, null,197312),
                     (11,         'Dalmatia','Salona',null,16.483426,43.539561,197488),
                     (12,         'Dalmatia','Bigeste/Ljubuški','Filovača',null,null,197167),
                     (13,         'Dalmatia','Tilurium','Gardun, built into a house',null,null,197552),
                     (14,         'Dalmatia','Iader','Church of st Michael',null,null,197312),
                     (15,         'Dalmatia','Narona','Vid Metković',17.62464523, 43.08130155,197400),
                     (16,         'Thracia','Lysimacheia',null,26.75081, 40.548232,501458),
										 (17,         'Dalmatia','Dugopolje','Near Tilurium and Salona',16.596944,43.580278,null),
										 (18,         'Dalmatia','Corinium','Karin, Near Iader', 15.633504,44.104527,197225),
										 (19,         'Dalmatia','Tilurium','Košute',null,null,197552),
										 (20,         'Dalmatia','Dicmo','Near Tilurium',16.95,43.5,null),
										 (21,         'Dalmatia','Prud',null,null,null,null),
										 (22,         'Dalmatia','Imotski' ,'Runovići' , 17.216667,43.45,null),
										 (23,         'Dalmatia','Tilurium','Cetina River', 16.728064, 43.61461719,197552),
										 (24,         'MoesiaS','Viminacium','Gradac', 21.1913635,44.7266235,207549),
										 (25,         'Dalmatia','Bigeste/Ljubuški','Hardomilje', 17.55,43.15,197167),
										 (26,         'Dalmatia','Asseria','Podgrađe', 15.6663802,44.01096805,197145),
										 (27,         'Dalmatia','Bigeste/Ljubuški','Veljaci', 17.445,43.237222,197167),
										 (28,         'Dalmatia','Aequum','Glavice, near Sinj',null,null,197095),
										 (29,         'Dalmatia','Tilurium','Trilj',null,null,197552),
										 (30,         'Dalmatia','Municipium Riditarum/Rider, Danilo','Near Šibenik',16.055704,43.700462,197473),
										 (31,         'Dalmatia','Narona','Čitluk', 16.484007,43.690597,197400),
										 (32,         'Dalmatia','Andetrium','Gornji Muć',16.53,43.68,197115),
										 (33,         'Dalmatia','Bigeste/Ljubuški','Humac',17.521667,43.196667,197167),
										 (34,         'Dalmatia','Aequum','Hrvace',null,null,197095),
										 (35,         'Dalmatia','Siculi','Bijaći, near Tragurium',16.346833,43.553234,197511),
										 (36,         'Dalmatia','Salona','Near Porta Caesarea',16.4823429,43.5383152,197488),
										 (37,         'Dalmatia','Salona','North Necropolis, Kapljuč',16.4737934,43.5424905,197488),
										 (38,         'Dalmatia','Bigeste/Ljubuški','Vitaljina',17.562,43.1694,197167),
										 (39,         'Dalmatia','Vaganj','Near jajce',17.17608,44.15513,null),
										 (40,         'Galatia','Antiochia Pisidiae', null, 31.1894355,38.305175,609307),
										 (41,         'Galatia','Cormasa','near Antiochia Pisidiae',30.1194035,37.5053445,638936),
										 (42,         'Galatia','Iconium','near Antiochia Pisidiae',32.492331,37.872202,648647),
                     (43,         'Dalmatia','Tragurium',null,16.25063,43.517639,197555),
                     (44,         'Dalmatia','Burnum',null,16.025622,44.018914,197184),
                     (45,         'Dalmatia','Salona','Modern Klis, possibly from the East Necropolis originally',16.496858,43.540222,197488),
										 (46,         'Dalmatia','Tragurium','Seget Donji',16.2333,43.5167,197555),
										 (47,         'Dalmatia','Andetrium','Gornji Postinje',16.424,43.701,197115),
									   (48,         'Dalmatia','Popovići','Near Karin',15.672364,44.070419,null),
										 (49,         'Dalmatia','Krug', 'Near Jesenice, Poljice',16.647371,43.495214,null),
										 (50,         'Dalmatia','Razvođe', 'Near Burnum',16.107708,43.92898,null),
										 (51,         'Dalmatia','Gorica','Near Dubrava, Poljice',16.634664,43.456728,null),
										 (52,         'Dalmatia','Sinjsko polje','The area between Aequum and Tilurium',16.695576,43.675387,197552),
									   (53,         'Dalmatia','Aequum','Krinj, near Čitluk',16.644167,43.745556,197095),
										 (54,         'Dalmatia','Aequum','Čitluk',16.655704,43.739278,197095);

-- SELECT Settlement
--   FROM FindSpot
--  WHERE Province = 'Dalmatia';

CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	FirstPublicationCitation TEXT,
	DateFound DATE,
	DateFoundPrecisionNote TEXT,
	MonumentType TEXT,
	MemberSeventhLegion TEXT,
	CPFTitle TEXT, -- this can have values of: no, c, cpf, maybe, and both.
	               -- The value "both" reflects historical uncertainty
	               -- and is not actually multivalued.
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

-- INSERT INTO Monument (MonumentID, FindSpotID, FirstPublicationCitation, DateFound, DateFoundPrecisionNote, MonumentType, MilitaryStatus, MemberSeventhLegion, CPFTitle, Inscription, Translation, DoorMotifPresent, PortraitPresent, WeaponsPresent, DateFrom, DateTo, DateNote, Location, StelaeType, Note)
--       VALUES         (1,          1,          null,                     null,      null,                   'construction dedication',         null,           'yes',                'no',     'Ti(berius) Caesar divi Aug(usti) f(ilius) / Augustus imp(erator) pontif(ex) max(imus) / trib(unicia) potest(ate) XX co(n)s(ul) III / leg(io) VII leg(io) XI / P(ublio) Cornelio Dolabella / leg(ato) pr(o) pr(aetore)',
--                     																																								 null,        'no',             'no',            null,           18,       19,     null,     null,     null,       null),
--                      (2,          2,          null,                     null,      null,                   'stela',         'veteran',           'yes',                'cpf',     'Sex(tus) Iu[lius Sex(ti) f(ilius)] / Ani(ensi) Silva[nus Foro Iulii] / summus c[urat(or) c(ivium) R(omanorum) prov(inciae) Dalm(atiae)] / suffragio [eorum factus vet(eranus?)] / leg(ionis) VII C(laudiae) P(iae) F(idelis) aed[ilis col(oniae) Claudiae Aequi ab] / ordine primus [post col(oniam) ded(uctam) creatus] / IIIIvir i(ure) d(icundo) pont(ifex) [in col(onia?) Salona(?) ---] / in ag[ro] p(edes) [---] / h(oc) s(epulcrum) h(eredem) [n(on) s(equetur)]',
--                                                                                                                                                                                      null,        null,             null,            null,           42,       42,     null,     null,     null,       'Check inconsistencies in Tončinić2011');
--
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
		MonumentID INTEGER REFERENCES Monument,
    OfficeType TEXT
);

--INSERT INTO MonumentMilitaryOffice (MonumentID, OfficeType)
--     VALUES                        (1,          'Milites'),
--		                               (2,          'Milites');
-- This was originaly going to be put in manually, but I decided to put in an 'automatic' .csv import system.

.mode csv

.import ../MonumentMilitaryOffice.csv MonumentMilitaryOffice

UPDATE MonumentMilitaryOffice SET OfficeType = NULL WHERE OfficeType = '';


CREATE TABLE Corpus (
	CorpusName TEXT PRIMARY KEY --which db type is this?
);

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
-- -- monumentcorpusID is an autonum we don't care about, so we won't write it. Let the database take care of things.
-- (MonumentID,  CorpusName,  Reference,   isPrimaryReference)
-- below is the import code for automatic .csv importing, it needs to be worked on.

.mode csv

.import ../MonumentCorpus.csv MonumentCorpus


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

select count(*) from MonumentCorpus;
select count(*) from LegioServicemen;
UPDATE MonumentCorpus SET isPrimaryReference = NULL WHERE isPrimaryReference = '';
UPDATE LegioServicemen SET Name = NULL WHERE Name = '';
UPDATE LegioServicemen SET DefiniteServiceman = NULL WHERE DefiniteServiceman = '';
UPDATE LegioServicemen SET ReferencedAs = NULL WHERE ReferencedAs = '';
UPDATE LegioServicemen SET Tribe = NULL WHERE Tribe = '';
UPDATE LegioServicemen SET MilitaryStatus = NULL WHERE MilitaryStatus = '';
UPDATE LegioServicemen SET OriginProvince = NULL WHERE OriginProvince = '';
UPDATE LegioServicemen SET OriginSettlement = NULL WHERE OriginSettlement = '';
UPDATE LegioServicemen SET OtherMonument = NULL WHERE OtherMonument = '';
UPDATE LegioServicemen SET ServicemanNote = NULL WHERE ServicemanNote = '';


--Below are the various views created so that some information from various tables can be found in the same view

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

DROP VIEW IF EXISTS LegionaryDetailsDalmatia;
CREATE VIEW LegionaryDetailsDalmatia AS
SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as Reference, MonumentType, militarystatus, OfficeType as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'CPF'
	FROM Monument JOIN FindSpot USING (FindSpotID)
							  JOIN MonumentMilitaryOffice USING (monumentid)
							  JOIN MonumentCorpus USING (MonumentID)
								JOIN LegioServicemen USING (MonumentID)
	WHERE province = 'Dalmatia'
   	AND isPrimaryReference = '1'
	  AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');


DROP VIEW IF EXISTS LegionaryDetails;
CREATE VIEW LegionaryDetails AS
SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as Reference, Name, MonumentType, militarystatus, OfficeType as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'CPF'
	FROM Monument JOIN FindSpot USING (FindSpotID)
	              JOIN MonumentMilitaryOffice USING (monumentid)
				        JOIN MonumentCorpus USING (MonumentID)
				        JOIN LegioServicemen USING (MonumentID)
 WHERE province = 'Dalmatia'
	 AND isPrimaryReference = '1'
	 AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');

DROP VIEW IF EXISTS NotTončinić;
CREATE VIEW NotTončinić AS
SELECT MonumentID, CorpusName, Reference, AE, ILJug, OtherRef
	FROM MonumentCorpus JOIN AllCorpora USING (MonumentID)
 WHERE Tončinić IS NULL
	 AND isPrimaryReference is '1';

DROP VIEW IF EXISTS PrimaryReferenceTypeLocation;
CREATE VIEW PrimaryReferenceTypeLocation AS
SELECT MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference as Reference, monument.MonumentType, FindSpot.province, FindSpot.Settlement, FindSpot.ExtraInfo
  FROM Monument JOIN MonumentCorpus USING (MonumentID)
								JOIN FindSpot USING (FindSpotID)
 WHERE isPrimaryReference = '1';

DROP VIEW IF EXISTS ServicemenAndReference;
CREATE VIEW ServicemenAndReference AS
SELECT ServicemanID, MonumentID, CorpusName ||', '|| Reference AS Reference, Tončinić, Name, DeceasedOrDedicant, Tribe, OriginProvince, OriginSettlement
  FROM LegioServicemen JOIN MonumentCorpus USING (monumentID)
											 JOIN AllCorpora USING (MonumentID)
	WHERE isPrimaryReference = '1';

DROP VIEW IF EXISTS TončinićPrimaryReference;
CREATE VIEW TončinićPrimaryReference AS
SELECT CorpusName ||', '|| REFERENCE as 'Reference', Tončinić, Inscription
  FROM MonumentCorpus JOIN AllCorpora USING (MonumentID)
											JOIN Monument USING (monumentID)
 WHERE isPrimaryReference = '1'
	 AND Tončinić IS NOT NULL
 ORDER BY Reference;
