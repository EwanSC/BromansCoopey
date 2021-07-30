# Dictionary for /data tables

## Overview

There are 8 tables of data which comprise this database. These are stored in csv files in /data/. The original csv  files are in /original_source_data/ and these were imported into a .DB file (BromansDB.db) after running the creation statement in DB-SQL/create_monument_db.sql via rebuildDB.sh. Once in the database these tables (and related analysis tables, see analysis/analysis_dictionary) were then exported using DB-SQL/exportDatabase.sh.

These tables hold various types of geographical, epigraphical, visual, and historical data related to inscribed Roman funerary monuments belonging to, or commemorating, servicemen or veterans of the Roman Seventh Legion (Legio VII) in the province of Dalmatia (the modern Eastern Adriatic coastline and hinterland), as well as select pieces of relevant sacral and administrative epigraphic material.

## The Tables

The **8** data tables and their columns are:
1. **corpus.csv**
* CorpusName
2. **findspot**
* FindSpotID
* Roman_Province
* SpecificAncientLocation
* ModernSite
* SpecificModernLocation
* ModernLocationNote
* ExtraLocationNote
* LONGITUDE_epsg_4326
* LATITUDE_epsg_4326
* Pleiades
* Trismegistos
3. **legio_serviceman**
* ServicemanID
* Name
* DefiniteServiceman
* UnitID
* LiklihoodOfUnitAttribution
* MilitaryStatusID
* Tribe
* OriginProvince
* OriginSettlement
* OriginCertainty
* TribusDomiciliumNote
* ServicemanNote
4. **military_status**
* MilitaryStatusID
* FirstRecordedOffice
* SecondRecordedOffice
* FirstOfficeCertainty
* SecondOfficeCertainty
* VeteranStatus
* VeteranStatusCertainty
5. **monument**
* MonumentID
* FindSpotID
* MonumentSpecificFindspotNote
* PublicationCitation
* DateFoundOrPublished
* DateFoundorPublishedPrecisionNote
* MonumentType
* MonumentOfSeventhLegion
* Inscription
* Translation
* TranslationSource
* LowerFieldDecoration
* LowerFieldDetail
* Portrait
* Frieze
* DateFrom
* DateTo
* DateNote
* Tončinić2011StelaeType
* ModernHolding
* HoldingData
* MonumentNote
* DBInclusionReason
* Media
6. **monument_corpus**
* MonumentCorpusID
* MonumentID
* CorpusName
* Reference
* isPrimaryReference
7. **monument_serviceman**
* MonumentServicemanID
* ServicemanID
* MonumentID
* ServicemanReferencedAs
* PossibleDuplicateServicemanID
* SourceForDuplicateArgument
8. **unit**
* UnitID
* UnitTitle

## Table Field Descriptions

### corpus.csv
* This table...
* This table is created using the .sql code:

``` SQL
CREATE TABLE corpus (
	CorpusName TEXT PRIMARY KEY
);
```

* Columns:
1. **CorpusName**
* Source Table:
* 
* Distinct Values:
