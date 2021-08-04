DROP TABLE IF EXISTS corpus;
DROP TABLE IF EXISTS monument;
DROP TABLE IF EXISTS findspot;
DROP TABLE IF EXISTS legio_serviceman;
DROP TABLE IF EXISTS monument_corpus;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS military_status;
DROP TABLE IF EXISTS monument_serviceman;


CREATE TABLE findspot (
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

.mode csv
.import ../original_source_data/findspot.csv findspot

UPDATE findspot SET RomanProvince = NULL WHERE RomanProvince = '';
UPDATE findspot SET AncientSite = NULL WHERE AncientSite = '';
UPDATE findspot SET SpecificAncientLocation = NULL WHERE SpecificAncientLocation = '';
UPDATE findspot SET ModernSite = NULL WHERE ModernSite = '';
UPDATE findspot SET SpecificModernLocation = NULL WHERE SpecificModernLocation = '';
UPDATE findspot SET ModernLocationNote = NULL WHERE ModernLocationNote = '';
UPDATE findspot SET ExtraLocationNote = NULL WHERE ExtraLocationNote = '';
UPDATE findspot SET LONGITUDE_epsg_4326 = NULL WHERE LONGITUDE_epsg_4326 = '';
UPDATE findspot SET LATITUDE_epsg_4326 = NULL WHERE LATITUDE_epsg_4326 = '';
UPDATE findspot SET Pleiades = NULL WHERE Pleiades = '';
UPDATE findspot SET Trismegistos = NULL WHERE Trismegistos = '';

select 'findspotsloaded', count(*) from findspot;


CREATE TABLE monument (
	MonumentID INTEGER PRIMARY KEY,
	FindSpotID INTEGER REFERENCES findspot,
	MonumentSpecificFindspotNote TEXT,
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
	DateFrom INTEGER, -- INTEGER YEAR - years are BCE
	DateTo INTEGER, -- INTEGER YEAR - years are BCE
	DateNote TEXT,
	Tončinić2011StelaeType TEXT,
	ModernHolding TEXT,
	HoldingData TEXT,
	MonumentNote TEXT,
	DBInclusionReason TEXT,
	Media TEXT
);

.mode csv
.import ../original_source_data/monument.csv monument

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



CREATE TABLE unit (
	UnitID INTEGER PRIMARY KEY,
	UnitTitle TEXT
);

.mode csv
.import ../original_source_data/unit.csv unit

select 'unitsloaded', count(*) from unit;


CREATE TABLE military_status (
	MilitaryStatusID INTEGER PRIMARY KEY,
	FirstRecordedOffice TEXT,
 	SecondRecordedOffice TEXT,
	FirstOfficeCertainty TEXT,
	SecondOfficeCertainty TEXT,
	VeteranStatus TEXT,
	VeteranStatusCertainty TEXT
);

.mode csv
.import ../original_source_data/military_status.csv military_status

select 'officesloaded', count(*) from military_status;

UPDATE military_status SET FirstRecordedOffice = NULL WHERE FirstRecordedOffice = '';
UPDATE military_status SET SecondRecordedOffice = NULL WHERE SecondRecordedOffice = '';
UPDATE military_status SET FirstOfficeCertainty = NULL WHERE FirstOfficeCertainty = '';
UPDATE military_status SET SecondOfficeCertainty = NULL WHERE SecondOfficeCertainty = '';
UPDATE military_status SET VeteranStatus = NULL WHERE VeteranStatus = '';
UPDATE military_status SET VeteranStatusCertainty = NULL WHERE VeteranStatusCertainty = '';



CREATE TABLE corpus (
	CorpusName TEXT PRIMARY KEY
);


.mode csv
.import ../original_source_data/corpus.csv corpus

select 'corpusloaded', count(*) from corpus;



CREATE TABLE monument_corpus (
  MonumentCorpusID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES monument NOT NULL,
	CorpusName TEXT NOT NULL REFERENCES corpus,
	Reference TEXT NOT NULL,
	isPrimaryReference TEXT
);

.mode csv
.import ../original_source_data/monument_corpus.csv monument_corpus

select 'referencesloaded', count(*) from monument_corpus;

UPDATE monument_corpus SET isPrimaryReference = NULL WHERE isPrimaryReference = '';



CREATE TABLE legio_serviceman (
  ServicemanID INTEGER PRIMARY KEY,
	Name TEXT,
	DefiniteServiceman TEXT,
	UnitID INTEGER REFERENCES unit,
	LiklihoodOfUnitAttribution TEXT,
  MilitaryStatusID INTEGER REFERENCES military_status,
	Tribe TEXT,
	OriginProvince TEXT,
	OriginSettlement TEXT,
	OriginCertainty TEXT,
	TribusDomiciliumNote TEXT,
	ServicemanNote TEXT
);
-- 'ServicemanID' is used to refer to the Legio VII serviceman recorded upon the inscription. There can be multiple per MonumentID
-- DefiniteServiceman refers to whether or not they were a soldier/milites, not necessarily Legio VII. For that, see .monument

.mode csv
.import ../original_source_data/legio_serviceman.csv legio_serviceman

select 'legionariesloaded', count(*) from legio_serviceman;

UPDATE legio_serviceman SET Name = NULL WHERE Name = '';
UPDATE legio_serviceman SET DefiniteServiceman = NULL WHERE DefiniteServiceman = '';
UPDATE legio_serviceman SET UnitID = NULL WHERE UnitID = '';
UPDATE legio_serviceman SET LiklihoodOfUnitAttribution = NULL WHERE LiklihoodOfUnitAttribution = '';
UPDATE legio_serviceman SET Tribe = NULL WHERE Tribe = '';
UPDATE legio_serviceman SET MilitaryStatusID = NULL WHERE MilitaryStatusID = '';
UPDATE legio_serviceman SET OriginProvince = NULL WHERE OriginProvince = '';
UPDATE legio_serviceman SET OriginSettlement = NULL WHERE OriginSettlement = '';
UPDATE legio_serviceman SET OriginCertainty = NULL WHERE OriginCertainty = '';
UPDATE legio_serviceman SET ServicemanNote = NULL WHERE ServicemanNote = '';
UPDATE legio_serviceman SET TribusDomiciliumNote = NULL WHERE TribusDomiciliumNote = '';



CREATE TABLE monument_serviceman (
	  MonumentServicemanID NUMBER PRIMARY KEY,
		ServicemanID INTEGER REFERENCES legio_serviceman,
		MonumentID INTEGER REFERENCES monument,
		ServicemanReferencedAs TEXT,
		PossibleDuplicateServicemanID INTEGER,
		SourceForDuplicateArgument TEXT
);

-- ServicemanReferencedAs refers to how Serviceman is referred to: either AS commemorator,
-- commemorated, both (erected during lifetime), administrator, or dedicant (sacral inscriptions)
-- PossibleDuplicateServicemanID records the ServicemanID of the individual which may be a duplicate of this certain MonumentID

.mode csv
.import ../original_source_data/monument_serviceman.csv monument_serviceman

select 'monumentservicemenloaded', count(*) from monument_serviceman;

UPDATE monument_serviceman SET ServicemanReferencedAs = NULL WHERE ServicemanReferencedAs = '';
UPDATE monument_serviceman SET PossibleDuplicateServicemanID = NULL WHERE PossibleDuplicateServicemanID = '';
UPDATE monument_serviceman SET SourceForDuplicateArgument = NULL WHERE SourceForDuplicateArgument = '';

-- Below are the various views created so that some information from various tables can be found in the same view

DROP VIEW IF EXISTS all_corpora;
CREATE VIEW all_corpora as
SELECT MonumentID, CIL, Tončinić, Betz, ILJug, AE, EDCS, EDH, OtherRef
  FROM (SELECT MonumentID
          FROM monument)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS CIL
        			 FROM monument_corpus
        			 WHERE CorpusName = 'CIL'
        			 GROUP BY MonumentID) AS ciltable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS Tončinić
        			 FROM monument_corpus
        			 WHERE CorpusName = 'Tončinić'
        			 GROUP BY MonumentID) AS Tončinićtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS Betz
        			 FROM monument_corpus
        			 WHERE CorpusName = 'Betz'
        			 GROUP BY MonumentID) AS Betztable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS ILJug
        			 FROM monument_corpus
        			 WHERE CorpusName = 'ILJug'
        			 GROUP BY MonumentID) AS ILJugtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS AE
						   FROM monument_corpus
						   WHERE CorpusName = 'AE'
						   GROUP BY MonumentID) AS AEtable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS EDCS
						 		FROM monument_corpus
						 		WHERE CorpusName = 'EDCS'
						 		GROUP BY MonumentID) AS EDCStable USING (MonumentID)
	LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS EDH
						 	 FROM monument_corpus
						   WHERE CorpusName = 'EDH'
						   GROUP BY MonumentID) AS EDHtable USING (MonumentID)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(Reference, '; ') AS OtherRef
        			 FROM monument_corpus
        			 WHERE CorpusName = 'Other Ref'
        			 GROUP BY MonumentID) AS OtherReftable USING (MonumentID);

DROP VIEW IF EXISTS all_servicemen;
CREATE VIEW all_servicemen AS
SELECT DISTINCT
	legio_serviceman.ServicemanID,
	MonumentIDs,
	Name AS 'Nomina',
	Tribe AS 'Tribus',
	OriginSettlement ||(coalesce(','|| OriginProvince, ' ')) AS 'Domicilium',
	DefiniteServiceman,
	unit.UnitTitle ||'('|| legio_serviceman.LiklihoodOfUnitAttribution ||')' AS 'Unit_Affiliation_and_Certainty',
	FirstRecordedOffice ||'('|| FirstOfficeCertainty ||')' AS 'Office_and_Certainty',
	SecondRecordedOffice ||'('|| SecondOfficeCertainty ||')' AS 'Other_Office_and_certainty',
	VeteranStatus ||'('|| VeteranStatusCertainty ||')' AS 'Veteran_Status_and_Certainty',
	ServicemanNote
	FROM monument_serviceman
		JOIN legio_serviceman USING (ServicemanID)
		JOIN military_status USING (MilitaryStatusID)
		JOIN unit USING (UnitID)
		JOIN (SELECT ServicemanID, group_concat(MonumentID, '; ') AS MonumentIDs
	        			 FROM monument_serviceman
	        			 WHERE ServicemanID = ServicemanID
	        			 GROUP BY ServicemanID) AS MonumentIDTable USING (ServicemanID)
	ORDER BY DefiniteServiceman DESC, ServicemanID;

DROP VIEW IF EXISTS leg_vii_funerary_monument;
CREATE VIEW leg_vii_funerary_monument AS
SELECT MonumentID,
	CorpusName ||' ' || Reference AS 'Monument_Reference',
	MonumentOfSeventhLegion,
	MonumentType,
	DateFrom ||' to '|| DateTo AS 'Creation_Date',
	RomanProvince ||(coalesce(', '|| AncientSite, '')) AS 'Site_of_Discovery',
	Inscription,
	Media
	FROM monument
		JOIN monument_corpus USING (MonumentID)
		JOIN findspot USING (FindSpotID)
			WHERE (MonumentType = 'stela'
				or MonumentType = 'funerary inscription'
				or MonumentType = 'titulus'
				or MonumentType = 'inscription fragment'
				or MonumentType = 'sacral monument'
				or MonumentType = 'altar')
			AND isPrimaryReference IS NOT NULL
				AND (MonumentOfSeventhLegion = 'yes'
				or MonumentOfSeventhLegion = 'maybe')
			ORDER BY MonumentOfSeventhLegion DESC, MonumentID;

DROP VIEW IF EXISTS all_monument_with_location;
CREATE VIEW all_monument_with_location AS
SELECT
	MonumentID,
	CorpusName ||' ' || Reference AS 'Monument_Reference',
	MonumentType,
	MonumentOfSeventhLegion AS 'Mention_Legio_VII',
	Inscription,
	Translation,
	TranslationSource AS 'Source_of_Translation',
	Tončinić2011StelaeType AS 'Tončinić_2011_Style_Type',
	LowerFieldDecoration || (coalesce(', '|| LowerFieldDetail, '')) AS 'Lower_Field_Decoration',
	Portrait,
	Frieze,
	DateFrom ||' to '||	DateTo AS 'Creation_Date',
	DateNote,
	ModernHolding ||(coalesce(', '|| HoldingData, '')) AS 'Current_Location',
	RomanProvince AS 'Roman_Province',
	AncientSite AS 'Ancient_Site',
	SpecificAncientLocation AS 'Specific_Provenience',
	ModernSite AS 'Modern_Find_Site',
	SpecificModernLocation 'Modern_Provenience',
	ExtraLocationNote AS 'General_Location_Note',
	MonumentSpecificFindSpotNote AS 'Unique_Monument_Provenience_Note',
	LATITUDE_epsg_4326 AS 'LAT',
	LONGITUDE_epsg_4326 AS 'LONG',
	Pleiades,
	Trismegistos,
	MonumentNote,
	DBInclusionReason,
	Media
	FROM monument
			JOIN findspot USING (FindSpotID)
			JOIN monument_corpus USING (MonumentID)
						WHERE isPrimaryReference IS NOT NULL
