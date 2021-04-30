DROP TABLE IF EXISTS Corpus;
DROP TABLE IF EXISTS Monument;
DROP TABLE IF EXISTS FindSpot;
DROP TABLE IF EXISTS LegioServicemen;
DROP TABLE IF EXISTS MonumentCorpus;
DROP TABLE IF EXISTS Units;
DROP TABLE IF EXISTS MilitaryStatus;
DROP TABLE IF EXISTS MonumentServicemen;


CREATE TABLE FindSpot (
	FindSpotID INTEGER PRIMARY KEY,
	RomanProvince TEXT,
	AncientSite TEXT,
	SpecificAncientLocation TEXT,
	ModernSite TEXT,
	SpecificModernLocation TEXT,
	ModernLocationNote TEXT,
	ExtraLocationNote TEXT,
	LONGITUDE_epsg_4326 NUMBER,
	LATITUDE_epsg_4326 NUMBER,
	Pleiades TEXT,
	Trismegistos TEXT
);

UPDATE FindSpot SET RomanProvince = NULL WHERE RomanProvince = '';
UPDATE FindSpot SET AncientSite = NULL WHERE AncientSite = '';
UPDATE FindSpot SET SpecificAncientLocation = NULL WHERE SpecificAncientLocation = '';
UPDATE FindSpot SET ModernSite = NULL WHERE ModernSite = '';
UPDATE FindSpot SET SpecificModernLocation = NULL WHERE SpecificModernLocation = '';
UPDATE FindSpot SET ModernLocationNote = NULL WHERE ModernLocationNote = '';
UPDATE FindSpot SET ExtraLocationNote = NULL WHERE ExtraLocationNote = '';
UPDATE FindSpot SET LONGITUDE_epsg_4326 = NULL WHERE LONGITUDE_epsg_4326 = '';
UPDATE FindSpot SET LATITUDE_epsg_4326 = NULL WHERE LATITUDE_epsg_4326 = '';
UPDATE FindSpot SET Pleiades = NULL WHERE Pleiades = '';
UPDATE FindSpot SET Trismegistos = NULL WHERE Trismegistos = '';


.mode csv
.import ../original_data/FindSpot.csv FindSpot

select 'findspotsloaded', count(*) from FindSpot;


CREATE TABLE Monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES FindSpot,
	MonumentSpecificFindSpotNote TEXT,
	PublicationCitation TEXT,
	DateFoundOrPublished DATE,
	DateFoundorPublishedPrecisionNote TEXT,
	MonumentType TEXT,
	MonumentOfSeventhLegion TEXT,
	Inscription TEXT,
	Translation TEXT,
	TranslationSource TEXT,
	LowerFieldDecoration TEXT,
	LowerFieldDetail TEXT,
	Portrait TEXT,
	Frieze TEXT,
	DateFrom DATE,
	DateTo DATE,
	DateNote TEXT,
	Tončinić2011StelaeType TEXT,
	ModernHolding TEXT,
	HoldingData TEXT,
	MonumentNote TEXT,
	DBInclusionReason TEXT,
	Media TEXT
);

.mode csv
.import ../original_data/Monument.csv Monument

select 'monumentsloaded', count(*) from monument;

UPDATE monument SET MonumentID = NULL WHERE MonumentID = '';
UPDATE monument SET FindSpotID = NULL WHERE FindSpotID = '';
UPDATE monument SET MonumentSpecificFindSpotNote = NULL WHERE MonumentSpecificFindSpotNote = '';
UPDATE monument SET PublicationCitation = NULL WHERE PublicationCitation = '';
UPDATE monument SET DateFoundOrPublished = NULL WHERE DateFoundOrPublished = '';
UPDATE monument SET DateFoundorPublishedPrecisionNote = NULL WHERE DateFoundorPublishedPrecisionNote = '';
UPDATE monument SET MonumentType = NULL WHERE MonumentType = '';
UPDATE monument SET MonumentOfSeventhLegion = NULL WHERE MonumentOfSeventhLegion = '';
UPDATE monument SET Inscription = NULL WHERE Inscription = '';
UPDATE monument SET Translation = NULL WHERE Translation = '';
UPDATE monument SET TranslationSource = NULL WHERE TranslationSource = '';
UPDATE monument SET LowerFieldDecoration = NULL WHERE LowerFieldDecoration = '';
UPDATE monument SET LowerFieldDetail = NULL WHERE LowerFieldDetail = '';
UPDATE monument SET Portrait = NULL WHERE Portrait = '';
UPDATE monument SET Frieze = NULL WHERE Frieze = '';
UPDATE monument SET DateFrom = NULL WHERE DateFrom = '';
UPDATE monument SET DateTo = NULL WHERE DateTo = '';
UPDATE monument SET DateNote = NULL WHERE DateNote = '';
UPDATE monument SET ModernHolding = NULL WHERE ModernHolding = '';
UPDATE monument SET Tončinić2011StelaeType = NULL WHERE Tončinić2011StelaeType = '';
UPDATE monument SET HoldingData = NULL WHERE HoldingData = '';
UPDATE monument SET MonumentNote = NULL WHERE MonumentNote = '';
UPDATE monument SET DBInclusionReason = NULL WHERE DBInclusionReason = '';
UPDATE monument SET Media = NULL WHERE Media = '';



CREATE TABLE Units (
	UnitID INTEGER PRIMARY KEY,
	UnitTitle TEXT
);

.mode csv
.import ../original_data/Units.csv Units

select 'unitsloaded', count(*) from Units;


CREATE TABLE MilitaryStatus (
	MilitaryStatusID INTEGER PRIMARY KEY,
	FirstRecordedOffice TEXT,
 	SecondRecordedOffice TEXT,
	FirstOfficeCertainty TEXT,
	SecondOfficeCertainty TEXT,
	VeteranStatus TEXT,
	VeteranStatusCertainty TEXT
);

.mode csv
.import ../original_data/MilitaryStatus.csv MilitaryStatus

select 'officesloaded', count(*) from MilitaryStatus;

UPDATE MilitaryStatus SET FirstRecordedOffice = NULL WHERE FirstRecordedOffice = '';
UPDATE MilitaryStatus SET SecondRecordedOffice = NULL WHERE SecondRecordedOffice = '';
UPDATE MilitaryStatus SET FirstOfficeCertainty = NULL WHERE FirstOfficeCertainty = '';
UPDATE MilitaryStatus SET SecondOfficeCertainty = NULL WHERE SecondOfficeCertainty = '';
UPDATE MilitaryStatus SET VeteranStatus = NULL WHERE VeteranStatus = '';
UPDATE MilitaryStatus SET VeteranStatusCertainty = NULL WHERE VeteranStatusCertainty = '';



CREATE TABLE Corpus (
	CorpusName TEXT PRIMARY KEY
);


.mode csv
.import ../original_data/Corpus.csv Corpus

select 'corpusloaded', count(*) from Corpus;



CREATE TABLE MonumentCorpus (
  MonumentCorpusID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES Monument NOT NULL,
	CorpusName TEXT NOT NULL REFERENCES Corpus,
	Reference TEXT NOT NULL,
	isPrimaryReference TEXT
);

.mode csv
.import ../original_data/MonumentCorpus.csv MonumentCorpus

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
.import ../original_data/LegioServicemen.csv LegioServicemen

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
		ServicemanReferencedAs TEXT,
		PossibleDuplicateServicemanID INTEGER,
		SourceForDuplicateArgument TEXT
);

-- ServicemanReferencedAs refers to how Serviceman is referred to: either AS commemorator,
-- commemorated, both (erected during lifetime), administrator, or dedicant (sacral inscriptions)
-- PossibleDuplicateServicemanID records the ServicemanID of the individual which may be a duplicate of this certain MonumentID

.mode csv
.import ../original_data/MonumentServicemen.csv MonumentServicemen

select 'monumentservicemenloaded', count(*) from MonumentServicemen;

UPDATE MonumentServicemen SET ServicemanReferencedAs = NULL WHERE ServicemanReferencedAs = '';
UPDATE MonumentServicemen SET PossibleDuplicateServicemanID = NULL WHERE PossibleDuplicateServicemanID = '';
UPDATE MonumentServicemen SET SourceForDuplicateArgument = NULL WHERE SourceForDuplicateArgument = '';

-- Below are the various views created so that some information from various tables can be found in the same view

DROP VIEW IF EXISTS PrimaryCorpus;
CREATE VIEW PrimaryCorpus as
SELECT MonumentID, CorpusName || ' ' || Reference AS "Reference", MonumentType AS "Monument Type", Media
  FROM MonumentCorpus
	JOIN Monument USING (MonumentID)
 WHERE isPrimaryReference is not null;


DROP VIEW IF EXISTS AllCorpora;
CREATE VIEW AllCorpora as
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, AE, EDCS, EDH, OtherRef
  FROM (SELECT MonumentID
          FROM Monument)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS CIL
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'CIL'
        			 GROUP BY MonumentID) AS ciltable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS Tončinić
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Tončinić'
        			 GROUP BY MonumentID) AS Tončinićtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS Betz
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Betz'
        			 GROUP BY MonumentID) AS Betztable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS ILJug
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'ILJug'
        			 GROUP BY MonumentID) AS ILJugtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS AE
						   FROM MonumentCorpus
						   WHERE CorpusName = 'AE'
						   GROUP BY MonumentID) AS AEtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS EDCS
						 		FROM MonumentCorpus
						 		WHERE CorpusName = 'EDCS'
						 		GROUP BY MonumentID) AS EDCStable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS EDH
						 	 FROM MonumentCorpus
						   WHERE CorpusName = 'EDH'
						   GROUP BY MonumentID) AS EDHtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS OtherRef
        			 FROM MonumentCorpus
        			 WHERE CorpusName = 'Other Ref'
        			 GROUP BY MonumentID) AS OtherReftable USING (MonumentID);

DROP VIEW IF EXISTS All_Servicemen;
CREATE VIEW All_Servicemen AS
SELECT
	LegioServicemen.ServicemanID,
	Monument,
	Name AS 'Nomina',
	Tribe AS 'Tribus',
	OriginSettlement ||', '|| (coalesce(OriginProvince, ' ')) AS 'Domicilium',
	DefiniteServiceman AS 'Serviceman?',
	Units.UnitTitle ||'('|| LegioServicemen.LiklihoodOfUnitAttribution AS 'Unit Afilliation and Certainty',
	FirstRecordedOffice ||'('|| FirstOfficeCertainty AS 'Office and Certainty',
	SecondRecordedOffice ||'('|| SecondOfficeCertainty AS 'Other Office if specified',
	VeteranStatus ||'('|| VeteranStatusCertainty AS 'Veteran Status and Certainty',
	ServicemanNote
	FROM MonumentServicemen
		JOIN LegioServicemen USING (ServicemanID)
		JOIN MilitaryStatus USING (MilitaryStatusID)
		JOIN Units USING (UnitID)
		JOIN (SELECT ServicemanID, group_concat(MonumentID, '; ') AS Monument
	        			 FROM MonumentServicemen
	        			 WHERE ServicemanID = ServicemanID
	        			 GROUP BY ServicemanID) AS MonumentIDTable USING (ServicemanID)
	ORDER BY DefiniteServiceman DESC, ServicemanID;

DROP VIEW IF EXISTS Definite_Funerary_Monuments;
CREATE VIEW Definite_Funerary_Monuments AS
SELECT MonumentID,
	CorpusName ||' ' || Reference AS 'Monument Reference',
	MonumentType,
	DateFrom ||' to '|| DateTo AS 'Date',
	RomanProvince ||', '|| AncientSite AS 'Site of Discovery'
	FROM Monument
		JOIN MonumentCorpus USING (MonumentID)
		JOIN FindSpot USING (FindSpotID)
			WHERE (MonumentType = 'stela'
				or MonumentType = 'funerary inscription'
				or MonumentType = 'titulus'
				or MonumentType = 'inscription fragment'
				or MonumentType = 'sacral monument'
				or MonumentType = 'altar')
			AND isPrimaryReference IS NOT NULL
				AND (MonumentOfSeventhLegion = 'yes'
				or MonumentOfSeventhLegion = 'maybe')
			ORDER BY RomanProvince, AncientSite;

DROP VIEW IF EXISTS Monument_and_Location;
CREATE VIEW Monument_and_Location AS
SELECT
	MonumentID,
	CorpusName ||' ' || Reference AS 'Monument Reference',
	MonumentType,
	MonumentOfSeventhLegion AS 'Mentions Legio VII?',
	Inscription,
	Translation,
	TranslationSource AS 'Source of Translation',
	Tončinić2011StelaeType AS 'Tončinić 2011 Style Type',
	LowerFieldDecoration ||', '|| (coalesce(LowerFieldDetail, ' ')) AS 'Lower Field Decoration',
	Portrait,
	Frieze,
	DateFrom ||' to '||	DateTo AS 'Date',
	DateNote,
	ModernHolding ||', '|| (coalesce(HoldingData, ' ')) AS 'Current Location',
	RomanProvince AS 'Ancient Province Find Spot',
	AncientSite AS 'Ancient Site',
	SpecificAncientLocation AS 'General Proveniance',
	ModernSite AS 'Modern Find Site',
	SpecificModernLocation 'Modern Proveniance',
	ExtraLocationNote AS 'General Location Note',
	MonumentSpecificFindSpotNote AS 'Unique Monument Proveniance Note',
	LATITUDE_epsg_4326 AS 'LAT',
	LONGITUDE_epsg_4326 AS 'LONG',
	Pleiades,
	Trismegistos,
	MonumentNote AS 'Note on the Monument',
	Media
	FROM Monument
			JOIN FindSpot USING (FindSpotID)
			JOIN MonumentCorpus USING (MonumentID)
						WHERE isPrimaryReference IS NOT NULL
