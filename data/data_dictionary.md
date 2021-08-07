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
* TribeSettlementNote
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
* Values: AE; Betz; CIL; EDCS; EDH; ILJug; Other Ref; Tončinić. These abbreviations are all expanded upon in the database bibliography: DB-SQL/bibliography_for_db.bib & DB-SQL/bibliography_for_db.ris. 'Other Ref' = a corpus, reference work, article or book which is not covered by the other categories.

### findspot.csv
* This table records the contextual and geographical find spot data for the monuments within the database.
* This table is created using the .sql code:

``` SQL
CREATE TABLE findspot (
	FindSpotID INTEGER PRIMARY KEY,
	RomanProvince TEXT,
	AncientSite TEXT,
	SpecificAncientLocation TEXT,
	ModernSite TEXT,
	SpecificModernLocation TEXT,
	ExtraLocationNote TEXT,
	LONGITUDE_epsg_4326 NUMBER,
	LATITUDE_epsg_4326 NUMBER,
	Pleiades TEXT,
	Trismegistos TEXT
);
```

* Columns
1. **FindSpotID**
* Records an identifier for each row of find spot data. This primary key is a surrogate key.
* Values: 1-66
2. **RomanProvince**
* Records the Latin name of the Roman Imperial province where a monument was found. The name used is the same name as that which would have been used when the monument was created (e.g. contemporaneous), except for 'Dalmatia', which is also used for monuments that were created when this region was part of the bigger province named Illyricum which was split some time under Tiberius or Claudius into Dalmatia and Pannonia.
* Constrained Vocabulary from https://pleiades.stoa.org/places. Values: Dalmatia; Thracia; Moesia Superior; Galatia
3. **AncientSite**
* Records the Latin name of the ancient site where the monument was found. _null_ means there is no data concerning the find site of a monument in this dataset = it has not been recorded or it is not known.
* Constrained vocabulary, where possible values are taken from https://www.trismegistos.org/geo/, otherwise see analysis/all_corpora for source works. Values: _null_; Aequum; Andetrium; Antiochia Pisidiae; Apollonia/Tymandus; Asseria; Burnum; Corinium; Cormasa; Iadera; Iconium; Lysimacheia; Municipium Riditarum/Rider; Narona; Pagus Scunasticus; Pons Tiluri; Salona; Siculi; Spalatum; Tilurium; Tragurium; Viminacium
4. **SpecificAncientLocation**
* Records a precise and specific data relating to provenience (if available) in relation to a contemporary ancient structures, locations or features. 'null' = no specific ancient find site has been recorded in this dataset.
* Values: Constrained vocabulary (own): _null_; North Necropolis; East Necropolis; Porta Caesarea-Five bridges
5. **ModernSite**
* Records the modern Croatian or Turkish name of the site where the monument was found. _null_ means the
* Constrained vocabulary from various academic written sources. Values: _null_; Bijaći; Bolayir; Danilo; Dicmo; Donji Karin; Drmno; Dugopolje; Filovača; Gardun; Glavica-Ljubuški; Glavice; Gorica; Gornji Muć; Gornji Postinje; Gračine-Humac; Grebine-Vitaljina; Gâvur Ören; Hrvace; Humac; Imotski; Kapljuč; Kistanje; Klis; Konya; Košute; Krinj-Hrvace; Krug; Podgrađe; Popovići; Prud; Razvođe; Seget Donji; Sinj; Sinjsko polje; Smokovice-Hardomilje; Solin; Split; Trilj; Trogir; Vaganj-Jajce; Veljaci; Vid; Vojnić; Vuna-Hardomilje; Yalvaç; Zadar; Čitluk
6. **SpecificModernLocation**
* Records even more precise information concerning the provenience of the monument. _null_ refers to the lack of data within this dataset concerning provenience. 'uncertain' = it is known that the provenience of this monument in not known.
* Values are textual descriptions, whilst some text may be duplicated, they are separate find spots, see corresponding MonumentID for identification. Values: _null_; Cetina River; Church of st Michael; Mausoleum of Diocletian; built into modern structure; carved into rock; part of c.4th Late Antique tomb; re-used in Christian Cemetery; re-used in Medieval Cemetery; secondary use; surrounds of the amphitheatre; ul. Marka Marulića; uncertain
7. **ExtraLocationNote**
* Contains extra information about the location of a monument, such as nearby landmarks or other sites. _null_ means there is not extra information recorded about this site in this database.
* Values are textual descriptions (own). Values: _null_; 5km from Čitluk; Gradina; Matinčevo-Porta Suburbia I; Pet mostova; could also be from another site around the Sinjsko polje; found between Vojnić and Gardun; near Antiochia Pisidiae; near Burnum/Kistanje; near Dubrava, Poljice; near Jesenice, Poljice; near Karin; near Metković; near Porta Andetria; near Sinj; near Tragurium/Trogir; near Šibenik; right bank of Trebižat river
8. **LONGITUDE_epsg_4326**
* Records the longitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the longitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province).
* Numerical values: 56 DISTINCT LONG values including _null_
9. **LATITUDE_epsg_4326**
* Records the latitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the latitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province).
* Numerical values: 56 DISTINCT LONG values including _null_
10. **Pleiades**
* Records the URL to the [Pleiades](https://pleiades.stoa.org) page for the find site of this monument. The last 6 digits of each URL are also the Pleiades identifier. _null_ means there is no Pleiades entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 22 DISTINCT Pleiades values including _null_
11. **Trismegistos**
* Records the URL to the [Trismegistos](https://www.trismegistos.org) page for the find site of this monument. The digits at the end of each URL are also the Trismegistos identifier. _null_ means there is no Trismegistos entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 30 DISTINCT Trismegistos values including _null_

### legio_serviceman.csv
* This table records data concerning the servicemen and potential servicemen within this corpus.
* This table is created using the .sql code:

``` SQL
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
	TribeSettlementNote TEXT,
	ServicemanNote TEXT
);
```

* Columns
1. **ServicemanID**
* Records ID number for each individual serviceman referenced in the corpus. It is the Primary Key. It is a surrogate key with no relationship to external datasets.
* Distinct values: 1-137
2. **Name**
* Records name and paternal relation (where recorded) of the serviceman. Names are translated into English where the original inscription is complete, and left in the original Latin when incomplete (including lacunae).
* Unconstrained vocabulary. Values: All values are distinct. While there may be duplicate names, they are names shared by individual people. Use ServicemanID to determine uniqueness.
3. **DefiniteServiceman**
* Records whether the individual is definitely or potentially a serviceman with the values 'yes' and 'maybe'. 'yes' = the individual is recorded as a soldier upon the monument. 'maybe' = the individual could potentially be a soldier, but this is not explicitly stated in writing within the inscription. Refer to ServicemanNote for more information on why an individual classed as 'maybe' has been included.
* Constrained vocabulary (own). Values: yes; maybe
4. **UnitID**
* Foreign key referencing data/unit.UnitID. Surrogate key which records the unit/s a serviceman may have served in according to the inscription. This column can be joined with data/unit.UnitTitle to be more (human) reader friendly. As seen with analysis/all_servicemen.Unit_Affiliation_and_Certainty. _null_ here means that not data about the unit of this serviceman has been recorded in this database.
* Constrained vocabulary from data/unit. values: _null_; 1-12
5. **LiklihoodOfUnitAttribution**
* Records the certainty of the Unit attribution for each serviceman as either 'epigraphically attested' or 'conjecture'. 'epigraphically attested' = it is specified in the inscription. 'conjecture' = the unit attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription.
* Constrained vocabulary. values: epigraphically attested; conjecture
6. **MilitaryStatusID**
* Foreign key referencing data/military_status.MilitaryStatusID. Surrogate key recording the combination of offices held by a serviceman, as well as their veteran status. This column can be used to join the table with data/military_status to be more (human) reader friendly, as seen with analysis/all_servicemen.
* Constrained vocabulary from data/military_status. Values: 1-21.
7. **Tribe**
* Roman tribe or _tribus_ (Latin) of the recorded serviceman if recorded in the inscription. _null_ means an absence of data referring to tribe (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary. Values: _null_; Aemilia; Aniensis; Camilia; Claudia; Cornelia; Fabia; Lemonia; Maecia; Palatina; Papiria; Pollia; Pomptina; Publilia; Quirina; Scaptia; Sergia; Tromentia; Velina; Voltinia
8. **OriginProvince**
* Records the Latin name of the Roman province where the serviceman is thought to have hailed from according to the Domicilium in their commemorative inscription, except for those found on the Italian peninsular, which are recorded as 'Italy'. _null_ means absence of data relating to province in this dataset (either it is not recorded or the inscription is fragmentary).
* Constrained Vocabulary from https://pleiades.stoa.org/places. Values: _null_; Asia; Dalmatia; Galatia; Gallia Narbonensis; Italy; Macedonia
9. **OriginSettlement**
* Records _Domicilium_ (Latin)/ settlement of origin of the serviceman. _null_ means an absence of data referring to _Domicilium_ (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary from https://www.trismegistos.org/geo/ where available, otherwise taken from inscription in data/monument.Inscription. Values: _null_;
Aesis; Alorum; Amblada; Ancyra; Arretium; Augusta; Augusta Troas; Beneventum; Bononia; Brixia; Clistinna; Conana; Cormassa; Cremona; Dentum; Dyrrachium; Edessa; Florentia; Forum Corneli; Heraclea; Iconium; Isinda; Laranda; Libarna; Milyas; Ninica; Pessinus; Phazimon; Philippi; Pisaurum; Placentia; R[---]; Sebaste; Sebastopolis; Sinope; Ticinum; Trernahensis; Varvaria; Verona; Vienna
10. **OriginCertainty**
* Records if the OriginSettlement of a serviceman is conjecture by recording a '?'. _null_ means that nothing has been noted about the certainty of the soldier's origins. For information on why a serviceman's origins are classed as '?', see data/legio_serviceman.TribeSettlementNote
* Constrained vocabulary. Values: _null_; ?
11. **TribeSettlementNote**
* Records any notes about the classification a soldier has been given for the .Tribe, .OriginProvince and .OriginSettlement. Information includes rationale for classification, as well as alternative interpretations. _null_ means no notes have been recorded regarding this serviceman's origins or tribe in this database.
* Values: Textual descriptions or _null_. 19 distinct values including _null_
12. **ServicemanNote**
* This column records any extra information regarding the serviceman and anything to do with their status as a serviceman, their unit attribution, possible double ups in terms of identification, and the rationale for their inclusion in this table if not clear.
* Values: Textual descriptions. 38 distinct values including _null_. These notes consist of paragraphs or sentences.

### military_status.csv

* This table records the combinations of military offices soldiers recorded within this corpus held, as well as their veteran status (if ascertainable). It is designed to be linked with data/legio_serviceman.
* This table is created using the .sql code:

``` SQL
CREATE TABLE monument_serviceman (
	  MonumentServicemanID NUMBER PRIMARY KEY,
		ServicemanID INTEGER REFERENCES legio_serviceman,
		MonumentID INTEGER REFERENCES monument,
		ServicemanReferencedAs TEXT,
		PossibleDuplicateServicemanID INTEGER,
		SourceForDuplicateArgument TEXT
);
```

* Columns
1. **MilitaryStatusID**
* Primary key and surrogate key. Used to identify the combination of military offices serviceman had.
* Numerical values: All distinct. 1-21
2. **FirstRecordedOffice**
* Records the types of military offices that are recorded first within the inscriptions in this corpus. The offices are left in their Latin spelling, and taken from the inscriptions. _nulls_ mean no first office is recorded in this dataset for this combination of offices (either the inscription does not record one or it is fragmentary).
* Constrained vocabulary. Values: _null_; centurio; eques; imaginifer; miles; primus pilus; princeps posterior; scriba; signifer; tribunus
3. **SecondRecordedOffice**
* Records the types of military offices that are recorded second within the inscriptions in this corpus. The offices are left in their Latin spelling, and taken from the inscriptions. _nulls_ mean no second office is recorded in this dataset for this combination of offices (either the inscription does not record one or it is fragmentary).
* Constrained vocabulary. Values: _null_; exacto consularis; iudex; praefectus castorum
4. **FirstOfficeCertainty**
* Records the certainty of the attribution of this office to a serviceman. The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data concerning to the certainty of the office in this database.
* Constrained vocabulary. Values: _null_; conjecture; epigraphically attested
5. **SecondOfficeCertainty**
* Records the certainty of the attribution of this office to a serviceman. The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data concerning to the certainty of the office in this database.
* Values: _null_; epigraphically attested
6. **VeteranStatus**
* Records that a commemorated serviceman was a veteran by recording the Latin word _veteranus_. _null_ means that no information regarding veteran status is recorded in this dataset for this serviceman.
* Values: _null_; veteranus
7. **VeteranStatusCertainty**
Records the certainty of the attribution of this veteran status to a serviceman. The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the attribution of the veteran status is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with veteran status classed as 'conjecture'. _null_ means an absence of data referring to the certainty of a serviceman's veteran status in this database.
* Constrained vocabulary. Values: _null_; conjecture; epigraphically attested

### monument.csv

* This table records...
* This table is created using the .sql code:

``` SQL
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
```
* Columns
1. **MonumentID**
*
Values
2. **FindSpotID**
*
Values
3. **MonumentSpecificFindspotNote**
*
Values
4. **PublicationCitation**
*
Values
5. **DateFoundOrPublished**
*
Values
6. **DateFoundorPublishedPrecisionNote**
*
Values
7. **MonumentType**
*
Values
8. **MonumentOfSeventhLegion**
*
Values
9. **Inscription**
*
Values
10. **Translation**
*
Values
11. **TranslationSource**
*
Values
12. **LowerFieldDecoration**
*
Values
13. **LowerFieldDetail**
*
Values
14. **Portrait**
*
Values
15. **Frieze**
*
Values
16. **DateFrom**
*
Values
17. **DateTo**
*
Values
18. **DateNote**
*
Values
19. **Tončinić2011StelaeType**
*
Values
20. **ModernHolding**
*
Values
21. **HoldingData**
*
Values
22. **MonumentNote**
*
Values
23. **DBInclusionReason**
*
Values
24. **Media**
*
Values
