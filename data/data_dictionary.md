# Dictionary for /data tables

## Overview

There are 8 tables of data which comprise this database. These are stored in csv files in /data/. The original csv  files are in /original_source_data/ and these were imported into a SQLite database (BromansDB.db) after running the creation statement in DB-SQL/create_monument_db.sql via rebuildDB.sh. Once in the database these tables (and related analysis tables, see analysis/analysis_dictionary) were then exported using DB-SQL/exportDatabase.sh.

These tables hold various types of geographical, epigraphical, visual, and historical data related to inscribed Roman funerary monuments belonging to, or commemorating, servicemen or veterans of the Roman Seventh Legion (Legio VII) in the province of Dalmatia (the modern Eastern Adriatic coastline and hinterland), as well as select pieces of relevant sacral and administrative epigraphic material.

## The Tables

The **8** data tables and their columns are:
1. **corpus.csv**
* CorpusName
2. **findspot**
* FindSpotID
* RomanProvince
* AncientSite
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
* This table records the categories (abbreviations) of bibliographic corpora that are listed in this database. It is linked to data/monument_corpus.CorpusName.
* This table is created using the .sql code:

``` SQL
CREATE TABLE corpus (
	CorpusName TEXT PRIMARY KEY
);
```

* Columns:
1. **CorpusName**
* Records the categories (abbreviations) of bibliographic corpora that are listed in this database.
* Distinct Values: AE; Betz; CIL; EDCS; EDH; ILJug; Other Ref; Tončinić. These abbreviations are all expanded upon in the database bibliography: DB-SQL/bibliography_for_db.bib & DB-SQL/bibliography_for_db.ris. 'Other Ref' = a corpus, reference work, article or book which is not covered by the other categories.

### findspot.csv
* This table...
* This table is created using the .sql code:

``` SQL
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
```

* Columns
1. **FindSpotID**
* Records an identifier for each row of findspot data. This primary key is a surrogate key.
* Distinct Values: 1-66
2. **RomanProvince**
* Records the Latin name of the Roman Imperial province where a monument was found. The name used is the same name as that which would have been used when the monument was created (e.g. contemporaneous).
* Distinct Values: Dalmatia; Thracia; Moesia Superior; Galatia
3. **AncientSite**
* Records the Latin name of the ancient site where the monument was found. _null_ means there is no data concerning the find site of a monument in this dataset = it has not been recorded or it is not known.
* Distinct Values: _null_; Aequum; Andetrium; Antiochia Pisidiae; Apollonia/Tymandus; Asseria; Burnum; Corinium; Cormasa; Iadera; Iconium; Lysimacheia; Municipium Riditarum/Rider; Narona; Pagus Scunasticus; Pons Tiluri; Salona; Siculi; Spalatum; Tilurium; Tragurium; Viminacium
4. **SpecificAncientLocation**
* Records a precise and specific data relating to provenience (if available) in relation to a contemporary ancient structures, locations or features. 'null' = no specific ancient find site has been recorded in this dataset.
* Distinct Values: _null_; North Necropolis; East Necropolis; Porta Caesarea-Five bridges
5. **ModernSite**
*
* Distinct Values:
6. **SpecificModernLocation**
*
* Distinct Values:
7. **ModernLocationNote**
*
* Distinct Values:
8. **ExtraLocationNote**
*
* Distinct Values:
9. **LONGITUDE_epsg_4326**
*
* Distinct Values:
10. **LATITUDE_epsg_4326**
*
* Distinct Values:
11. **Pleiades**
*
* Distinct Values:
12. **Trismegistos**
*
* Distinct Values:
