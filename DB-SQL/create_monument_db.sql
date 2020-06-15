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
	SpecificLocation TEXT,
	LONG NUMBER,
	LAT NUMBER
);

INSERT INTO FindSpot (FindSpotID, Province,   Settlement, SpecificLocation, LONG,       LAT)
     VALUES          (1,          'Dalmatia', 'Iader',null,15.2313648, 44.119371),
                     (2,          'Dalmatia', 'Aequum','sinj',16.655704,  43.739278),
										 (3,          'Dalmatia', 'Salona',  'Grad Diokletianpalast Mausoleum', 16.44032121, 43.50811796),
										 (4,          'Dalmatia', 'Aequum',  'Majstorovici',null,null),
										 (5, 					'Dalmatia', 'Tilurium','Vojnić',null,null),
										 (6,          'Dalmatia', 'Tilurium','Gardun',16.729321,  43.607338),
										 (7,          'Dalmatia', null,null,null,null),
										 (8,          'Dalmatia', 'Salona',  'North Necropolis',null,null),
										 (9,          'Dalmatia', 'Salona',  'East Necropolis',null,null),
										 (10,         'Dalmatia','Iader','Filippi house', null, null),
                     (11,         'Dalmatia','Salona',null,null,null),
                     (12,         'Dalmatia','Ljubuški','Filovača',null,null),
                     (13,         'Dalmatia','Tilurium','Gardun, built into a house',null,null),
                     (14,         'Dalmatia','Iader','Church of st Michael',null,null),
                     (15,         'Dalmatia','Narona','Vid Metković',17.62464523, 43.08130155),
                     (16,         'Thracia','Lysimachia',null,26.75081, 40.548232),
										 (17,         'Dalmatia','Dugopolje','Near Tilurium and Salona', null, null),
										 (18,         'Dalmatia','Corinium','Karin, Near Iader', null, null),
										 (19,         'Dalmatia','Tilurium','Košute', null, null),
										 (20,         'Dalmatia','Dicmo','Near Tilurium', null, null),
										 (21,         'Dalmatia','Prud', null, null, null),
										 (22,         'Dalmatia','Imotski' ,'Runovići' , null, null),
										 (23,         'Dalmatia','Tilurium','Cetina River', 16.728064, 43.61461719),
										 (24,         'MoesiaS','Viminacium','Gradac', null, null),
										 (25,         'Dalmatia','Ljubuški','Hardomilje', null, null),
										 (26,         'Dalmatia','Asseria','Podgrađe', null, null),
										 (27,         'Dalmatia','Ljubuški','Veljaci', null, null),
										 (28,         'Dalmatia','Aequum','Glavice, near Sinj', null, null),
										 (29,         'Dalmatia','Tilurium','Trilj', null, null),
										 (30,         'Dalmatia','Municipium Riditarum, Danilo Gornje','Near Šibenik', null, null),
										 (31,         'Dalmatia','Narona','Čitluk', null, null),
										 (32,         'Dalmatia','Andetrium','Gornji Muć', null, null),
										 (33,         'Dalmatia','Ljubuški','Humac', null, null),
										 (34,         'Dalmatia','Aequum','Hrvace', null, null),
										 (35,         'Dalmatia','Siculi','Bijaći, near Tragurium', null, null),
										 (36,         'Dalmatia','Salona','Near Porta Caesarea', null, null),
										 (37,         'Dalmatia','Salona','Kapljuč', null, null),
										 (38,         'Dalmatia','Ljubuški','Vitaljina', null, null),
										 (39,         'Dalmatia','Vaganj','Near jajce', 17.17608, 44.15513),
										 (40,         'Galatia','Antiochia Pisidiae', null, null, null),
										 (41,         'Galatia','Cormasa','near Antiochia Pisidiae', null, null),
										 (42,         'Galatia','Iconium','near Antiochia Pisidiae', null, null),
                     (43,         'Dalmatia','Tragurium', null, null, null),
                     (44,         'Dalmatia','Burnum', null, null, null),
                     (45,         'Dalmatia','Salona','Modern Klis, possibly from the East Necropolis originally', null, null),
										 (46,         'Dalmatia','Tragurium','Seget Donji', null, null),
										 (47,         'Dalmatia','Andetrium','Gornji Postinje', null, null),
									   (48,         'Dalmatia','Popović','Near Karin', null, null),
										 (49,         'Dalmatia','Krug', 'Near Jesenice, Poljice', null, null),
										 (50,         'Dalmatia','Razvođe', 'Near Burnum', null, null),
										 (51,         'Dalmatia','Gorica','Near Dubrava, Poljice', null, null),
										 (52,         'Dalmatia','The surrounds of Sinjsko polje', null, null, null),
									   (53,         'Dalmatia','Krinj','Near Čitluk', null, null),
										 (54,         'Dalmatia','Aequum','Čitluk', null,  null);

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
                   ('Other DB');


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
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, AE, OtherDB
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
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' ; ') as OtherDB
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Other DB'
        			 GROUP BY MonumentID) as OtherDBtable USING (MonumentID);

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
SELECT MonumentID, CorpusName, Reference, AE, ILJug, OtherDB
	FROM MonumentCorpus JOIN AllCorpora USING (MonumentID)
 WHERE Tončinić IS NULL
	 AND isPrimaryReference is '1';

DROP VIEW IF EXISTS PrimaryReferenceTypeLocation;
CREATE VIEW PrimaryReferenceTypeLocation AS
SELECT MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference as Reference, monument.MonumentType, FindSpot.province, FindSpot.Settlement, FindSpot.SpecificLocation
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
