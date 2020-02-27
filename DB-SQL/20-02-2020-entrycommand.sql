DROP TABLE IF EXISTS MonumentCorpus;
DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS MonumentMilitaryOffice;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;


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
                     (2,          'Dalmatia', 'Aequum',null,16.655704,  43.739278),
										 (3,          'Dalmatia', 'Salona',  'Grad Diokletianpalast Mausoleum', 16.44032121, 43.50811796),
										 (4,          'Dalmatia', 'Aequum',  'Majstorovici',null,null),
										 (5, 					'Dalmatia', 'Tilurium','Vojnić',null,null),
										 (6,          'Dalmatia', 'Tilurium',null,16.729321,  43.607338),
										 (7,          'Dalmatia',null,null,null,null),
										 (8,          'Dalmatia', 'Salona',  'NthNecropolis',null,null),
										 (9,          'Dalmatia', 'Salona',  'EastNecropolis',null,null),
										 (10,         'Dalmatia', 'Tilurium',null,null,null),
										 (11,         'Dalmatia', 'Salona'  ,null,null,null),
										 (12,         'Dalmatia','Bigeste-Ljubuški','Filovača',null,null),
										 (13,         'Dalmatia','Tilurium','Gardun house',null,null),
										 (14,         'Dalmatia','Iader','Church of st Michael',null,null),
										 (15,         'Dalmatia','Narona','Vid-Metković',17.62464523,43.08130155)
										 ;

SELECT Settlement
  FROM FindSpot
 WHERE Province = 'Dalmatia';

CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	FirstPublicationCitation TEXT,
	DateFound DATE,
	DateFoundPrecisionNote TEXT,
	MonumentType TEXT,
	MilitaryStatus TEXT,
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
	Location TEXT,
	StelaeType TEXT,
	Note TEXT
);

INSERT INTO Monument (MonumentID, FindSpotID, FirstPublicationCitation, DateFound, DateFoundPrecisionNote, MonumentType, MilitaryStatus, MemberSeventhLegion, CPFTitle, Inscription, Translation, DoorMotifPresent, PortraitPresent, WeaponsPresent, DateFrom, DateTo, DateNote, Location, StelaeType, Note)
      VALUES         (1,          1,          null,                     null,      null,                   null,         null,           null,                null,     'Ti(berius) Caesar divi Aug(usti) f(ilius) / Augustus imp(erator) pontif(ex) max(imus) / trib(unicia) potest(ate) XX co(n)s(ul) III / leg(io) VII leg(io) XI / P(ublio) Cornelio Dolabella / leg(ato) pr(o) pr(aetore)',
                    																																								 null,        null,             null,            null,           18,       19,     null,     null,     null,       null),
                     (2,          2,          null,                     null,      null,                   null,         null,           null,                null,     'Sex(tus) Iu[lius Sex(ti) f(ilius)] / Ani(ensi) Silva[nus Foro Iulii] / summus c[urat(or) c(ivium) R(omanorum) prov(inciae) Dalm(atiae)] / suffragio [eorum factus vet(eranus?)] / leg(ionis) VII C(laudiae) P(iae) F(idelis) aed[ilis col(oniae) Claudiae Aequi ab] / ordine primus [post col(oniam) ded(uctam) creatus] / IIIIvir i(ure) d(icundo) pont(ifex) [in col(onia?) Salona(?) 3] / in ag[ro] p(edes) [3] / h(oc) s(epulcrum) h(eredem) [n(on) s(equetur)]',
                                                                                                                                                                                     null,        null,             null,            null,           18,       19,     null,     null,     null,       null);




CREATE TABLE MonumentMilitaryOffice (
    MonumentID INTEGER REFERENCES Monument,
    OfficeType TEXT,
    PRIMARY KEY (MonumentID, OfficeType)
);

INSERT INTO MonumentMilitaryOffice (MonumentID, OfficeType)
     VALUES                        (2,          'Milites');


CREATE TABLE Corpus (
	CorpusName TEXT PRIMARY KEY --which db type is this?
);

INSERT INTO Corpus (CorpusName)
     VALUES        ('CIL'),
                   ('Tončinić'),
                   ('Betz'),
                   ('ILJug'),
                   ('Other DB');


CREATE TABLE MonumentCorpus (
    MonumentCorpusID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES Monument NOT NULL,
	CorpusName TEXT NOT NULL REFERENCES Corpus,
	Reference TEXT NOT NULL,
	isPrimaryReference BOOLEAN
);
-- monumentcorpusID is an autonum we don't care about, so we won't write it. Let the database take care of things.
INSERT INTO MonumentCorpus (MonumentID,  CorpusName,  Reference,   isPrimaryReference)
     VALUES                (1,           'CIL',       '03, 02908', true),  --isPrimaryReference indicates which corpus appears in the "primary corpus" by setting it to be true. Otherwise, null is mostly hiddenish.
                           (1,           'Tončinić',  '92',        null),
                           (2,           'Tončinić',  '73',        true),
                           (2,           'Tončinić',  'error',     null),
                           (2,           'Other DB',  'EDCS-54900234',     null),
                           (2,           'Other DB',  'SanaderTončinić2013',     null)
     ;

DROP VIEW IF EXISTS PrimaryCorpus;
CREATE VIEW PrimaryCorpus as
SELECT MonumentID, CorpusName || ': ' || Reference as corpus
  FROM MonumentCorpus
 WHERE isPrimaryReference is not null;


SELECT * FROM PrimaryCorpus where MonumentID IN (1,2);


DROP VIEW IF EXISTS AllCorpora;
CREATE VIEW AllCorpora as
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, OtherDB
  FROM (SELECT MonumentID
          FROM Monument)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' - ') as CIL
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'CIL'
        			 GROUP BY MonumentID) as ciltable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' - ') as Tončinić
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Tončinić'
        			 GROUP BY MonumentID) as Tončinićtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' - ') as Betz
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Betz'
        			 GROUP BY MonumentID) as Betztable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' - ') as ILJug
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'ILJug'
        			 GROUP BY MonumentID) as ILJugtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, ' - ') as OtherDB
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Other DB'
        			 GROUP BY MonumentID) as OtherDBtable USING (MonumentID);

SELECT * FROM AllCorpora;
