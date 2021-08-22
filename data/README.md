# Dictionary for /data tables

## Overview

There are 8 tables of data which comprise this database. These are stored in csv files in /data/. The original csv  files are in /original_source_data/ and these were imported into a SQLite database (BromansDB.db) after running the creation statement in DB-SQL/create_monument_db.sql via rebuild_db.sh. Once in the database these tables (and related analysis tables, see analysis/analysis_dictionary) were then exported using DB-SQL/export_database.sh.

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
* Records the categories (abbreviations) of bibliographic corpora that are listed in this database. Primary key. Abbreviations are all expanded upon in the database bibliography: DB-SQL/bibliography_for_db.bib & DB-SQL/bibliography_for_db.ris. 'Other Ref' = a corpus, reference work, article or book which is not covered by the other categories.
* Values: AE; Betz; CIL; EDCS; EDH; ILJug; Other Ref; Tončinić.

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
* Records an identifier for each row of find spot data. This primary key is a surrogate key. Identifies the various geographical locations of findspots for monuments within this corpus
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
* Records the longitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the longitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province). Source of longitude was Trismegistos (https://www.trismegistos.org/geo/) or Pleiades (https://pleiades.stoa.org/), and if neither available, Google Maps (https://www.google.com/maps). All were subject to being edited for higher precision by the author, however.
* Numerical values: 56 DISTINCT LONG values including _null_
9. **LATITUDE_epsg_4326**
* Records the latitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the latitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province). Source of latitude was Trismegistos (https://www.trismegistos.org/geo/) or Pleiades (https://pleiades.stoa.org/), and if neither available, Google Maps (https://www.google.com/maps). All were subject to being edited for higher precision by the author, however. 
* Numerical values: 56 DISTINCT LONG values including _null_
10. **Pleiades**
* Records the URL to the [Pleiades](https://pleiades.stoa.org) page for the find site of this monument. The last 6 digits of each URL are also the Pleiades identifier. _null_ means there is no Pleiades entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 22 DISTINCT Pleiades values including _null_
11. **Trismegistos**
* Records the URL to the [Trismegistos](https://www.trismegistos.org) page for the find site of this monument. The digits at the end of each URL are also the Trismegistos identifier. _null_ means there is no Trismegistos entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 30 DISTINCT Trismegistos values including _null_

### legio_serviceman.csv
* This table records data concerning the servicemen and potential servicemen within this corpus. It is the 'core' table of the dataset for legionary/serviceman data, alongside data/monument which is the 'core' for monument information.
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

* This table records data about the monuments held within this dataset. It is the 'core' table of the dataset for monument data, alongside data/legio_serviceman which is the 'core' for legionary information.
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
* MonumentID is a primary key and a surrogate key. It identifies the monument in each line, providing their means of identification within this entire dataset.
* Numerical values: 1-130
2. **FindSpotID**
* A foreign key referencing data/findspot.FindSpotID. A surrogate key which identifies the various geographical locations of findspots for monuments within this corpus. Designed to be used to join this table with data from the findspot table, as seen with analysis/all_monument_with_location.csv.
* Numerical values: 1-66
3. **MonumentSpecificFindspotNote**
* Extra information unique to the provenience and discovery of each monument (where available). _null_ means there is no extra unique information recorded for a monument.
* Values: Textual descriptions. Each value is either _null_ or a piece/pieces of information distinct to each monument.
4. **PublicationCitation**
* Records the work in which the monument was first cited. All works are recorded in the DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris files. _null_ means no data about first publication was recorded in this dataset.
* Some values (citations) are shared between monuments. Values: There are 50 distinct values, including _null_. Citations are in author date format [Chicago](https://libguides.mq.edu.au/referencing/Chicago) or an abbreviation.
5. **DateFoundOrPublished**
* Records the year in which the monument is thought to have been found, or when it was first published (to ascertain if it records the publishing date, correspond with data/monument.PublicationCitation). _null_ means no data about discovery/publish date is recorded in this dataset.
* Some values (years) are shared between monuments. Values: 38 distinct values including _null_
6. **DateFoundorPublishedPrecisionNote**
* Contains textual note on the precision or nature of a publication/discovery date. _null_ means no notes on discovery/publish date are recorded in this dataset.
* Values: Textual descriptions. There are 30 distinct values including _null_
7. **MonumentType**
* Records the class of archaeological / epigraphic monument. The definitions for the types of monument are as follows:
  * 'titulus' = "isolated epitaphs with no, or minimal decorations" (Coopey 2020).
  * 'tegula' = terracotta roof tile.
  * 'stela' = "stone monuments or ‘slabs’ with an inscribed epitaph bearing formulaic descriptions of the deceased and the commemorators" (Coopey 2020).
  * 'sacral monument' = a monument of a sacral nature. 'sacral altar' = an altar where the inscription is sacral in nature.
  * 'milestone' = a milestone from a Roman road.
  * 'inscription fragment' = a fragmentary from a monument which may have once been funerary or sacral but not enough is left for this to be securely ascertained.
  * 'funerary inscription' = an inscription fragment with content of a funerary nature whose larger monument has been too damaged to ascertain its specific type.
  * 'construction dedication' = a dedicatory epitaph commemorating the construction of a building or structure.
  * 'boundary inscription' = an inscriptions from a boundary stone usually recording the demarcation of land by a Roman official.
  * 'altar' = a sacrificial altar with a funerary inscription.
* Constrained vocabulary (see above). Values: titulus; tegula; stela; sacral monument; sacral altar; milestone; inscription fragment; funerary inscription; construction dedication; boundary inscription; altar.
8. **MonumentOfSeventhLegion**
* Records whether the monument records, commemorates, or was commemorated by, a serviceman/servicemen of Legio VII. Values are 'yes', 'maybe', 'no'. 'yes' = Legio VII is mentioned in what is left of the inscription or it can be reconstructed beyond reasonable doubt. 'maybe' = Legio VII is not mentioned in what is left of the inscription, but one can hypothesise that the monument belonged to a member of Legio VII based on 1) what survives of the inscription, 2) the location of the monument, 3) the style of the monument, 4) a combination of all these factors. 'no' = no mention of Legio VII in extant inscription and no reason to believe it once existed (e.g. refers to a member of another unit). For why these monuments classed a 'no' are included in this database, refer to data/monument.DBInclusionReason.
* Constrained vocabulary. Values: yes, maybe, no
9. **Inscription**
* Records a transcription of the inscription found upon each monument in the original Latin or, rarely, ancient Greek, following the [Leiden Conventions](https://en.wikipedia.org/wiki/Leiden_Conventions).
* Values: Textual descriptions. Each value is a distinct transliteration of an inscription.
10. **Translation**
* Records an English translation of the Latin/Ancient Greek (including lacunae where appropriate).
* Values: Textual description: Each translation is distinct. While there may be duplicate translations, the inscription they are based off is distinct, in which case refer to MonumentID to differentiate.
11. **TranslationSource**
* Records the attribution for the English translation of the inscription. _null_ = there is not translation within this dataset concerning this inscription, so there is nothing to attribute. Any attribution involving "Coopey" refers to the co-author of this database of the same name. Other citations are in author-date [Chicago](https://libguides.mq.edu.au/referencing/Chicago) style.
* Constrained vocabulary (see above). Values: _null_; Tončinić 2011; Demicheli, Tončinić 2012; Coopey, edit of Tončinić 2011 and Cesarik 2016; Coopey, edit of Tončinić 2011 (made with help of Milićević-Bradač); Coopey, edit of Tončinić 2011; Coopey, edit of Rendić-Miočević 1987; Coopey
12. **LowerFieldDecoration**
* Records what decoration there is within the lower field (portion) of the monument (if any) and any details which can be made out. Here _null_ refers to the absence of data concerning the decoration of the lower field of this monument within this dataset = the monument either does not have a lower field or the lower field is broken off/lost. Descriptions are as follows:
  * 'undecorated' = the lower field exists but is undecorated.
  * '(reduced) dual-panelled door' = a two-panelled door motif
  * 'dolabra' = a Roman pick-axe
  * 'dona militaria' = Roman military awards
  * 'panelled door' = a door motif with an undiscernible number of panels
  * 'quad-panelled door' = a four-panelled door motif
* Textual descriptions, own constrained vocabulary. Values: _null_; (reduced) dual-panelled door; dolabra; dona militaria; panelled door; quad-panelled door; undecorated
13. **LowerFieldDetail**
* Records smaller sculptural details visible within the decoration upon the lower field of a monument. Meant to be used with data/monument.LowerFieldDecoration, as seen with analysis/all_monument_with_location.Lower_Field_Decoration. _null_ means no data concerning the lower field was recorded in this dataset (there is none, it does not have a lower field, it was not recorded)
* Values: Textual descriptions with some duplicates between monuments. _null_; bow, arrows and quiver; busts and knockers; construction tools; door knockers; handles; handles and knockers; knockers and floral; lions; lions and 'Attis'; lions and floral; lions and handles; lions and vines
14. **Portrait**
* Records the type of portrait depicted upon the monument (if any). _null_ refers to the absence of data concerning this feature for a monument within this dataset = the monument is broken/lost.
* Constrained vocabulary (own). Values: _null_; bust; bust and rider; dual bust; family bust; no portrait; rider
15. **Frieze**
* Records information concerning the decorative style of the frieze upon the monument, if any. _null_ refers to the absence of data concerning a frieze for this monument within this dataset = the frieze is lost or the monument type cannot have a frieze. 'no frieze' means the monument could have had a frieze stylistically speaking, but does not.
* Constrained vocabulary (own). Values: _null_; floral; military; no frieze
16. **DateFrom**
* Beginning date of date range for the creation of the monument. Dates are in BCE/CE. With BCE represented by negative values. E.g. -30 = 30 BCE. Dates are own, based on scholarly interpretations.
*  Numerical values: 14 distinct values
17. **DateTo**
* End date of date range for the creation of the monument. Dates are in BCE/CE. With BCE represented by negative values. E.g. -30 = 30 BCE. Dates are own, based on scholarly interpretations.
* Numerical values: 16 distinct values
18. **DateNote**
* Records a note about the dating of a monument, such as a more specific date, an issue, the rationale for a certain dating or a scholarly disagreement. _null_ means the absence of a note about the date within _this_ dataset.
* Values: Textual descriptions. Values are distinct (sentences or more specific ranges) or _null
19. **Tončinić2011StelaeType**
* Records the typological style type of the monument according to Tončinić (2011) _Spomenici VII. legije na području rimske provincije Dalmacije / Monuments of Legio VII in the Roman Province of Dalmatia_: 150-153. Here _null_ means there is not data relating to this column for a monument = either it is not classifiable within this typology or it is not a funerary monument.
* Constrained vocabulary from Tončinić (2011). Values: _null_; A1a; A1b; A2; A3a; A3b; A3c; Ra; Rb; Rc; altar; tituli
20. **ModernHolding**
* Records the name of the museum or site where the monument is now held/situated. Where possible, Croatian and English versions of the names are provided. _null_ means not data about modern holding has been recorded in this dataset (it is not known, or it is uncertain). 'Secondary use'% means the monument is in a state of re-use. The site of re-use is sometimes recorded.
* Values: Textual descriptions. 17 distinct values including _null_
21. **HoldingData**
* Records any other information concerning the modern holding/situation of the monument, such as specific location or museum accession number. _null_ means not data about modern holding has been recorded in this dataset (it is not known, or it is uncertain).
* Values: textual descriptions. 81 values including _null_
22. **MonumentNote**
* Records any additional information concerning the monument which does not fall into other columns. Such as scholarly debate concerning attribution, the degree of preservation (or lack thereof) and discrepancies in secondary literature. _null_ means no extra information was provided for this monument.
* Values: Textual descriptions. 54 distinct values including _null_
23. **DBInclusionReason**
* Records the rationale for including the monument when it does not refer/possibly refer to Legio VII in the inscription. _null_ means there was no need state the rational for the inclusion of the monument = it refers, or may refer, to Legio VII.
* Values: Textual descriptions. 21 distinct values
24. **Media**
* Records URLs for images (photos or illustrations) of the monument. Where possible, the URL is for the <http://lupa.at> website. With some monuments having links to EDCS <http://db.edcs.eu>, and some having no images within the database (represented with _null_)
* URL values: _null_ or distinct. Distinct values are all URLs to gallery of images

### monument_corpus.csv
* This table records the references for this dataset, listing the works which publish, cite and/or discuss a monument.
* This table is created using the .sql code:

``` SQL
CREATE TABLE monument_corpus (
  MonumentCorpusID INTEGER PRIMARY KEY,
	MonumentID INTEGER REFERENCES monument NOT NULL,
	CorpusName TEXT NOT NULL REFERENCES corpus,
	Reference TEXT NOT NULL,
	isPrimaryReference TEXT
);
```

* Columns
1. **MonumentCorpusID**
* Primary key and surrogate key. Identifies each distinct reference and monument combination.
* Values: 1-908
2. **MonumentID**
* MonumentID is a surrogate key and Foreign key linking from data/monument. It identifies the monument each line in this table is referring to, providing their means of identification within this dataset.
* Values: 1-130
3. **CorpusName**
* Records the category of bibliographic reference information for each line/MonumentCorpusID. Foreign key referencing data/corpus.CorpusName. Abbreviations are all expanded upon in the database bibliography: DB-SQL/bibliography_for_db.bib & DB-SQL/bibliography_for_db.ris. 'Other Ref' = a corpus, reference work, article or book which is not covered by the other categories.
* Constrained values (own): AE; Betz; CIL; EDCS; EDH; ILJug; Other Ref; Tončinić
4. **Reference**
* Records the rest of the metadata for the reference. For those MonumentCorpusID which are of a category _other than_ 'OtherRef', this will have a catalogue number or volume and references number. For those of 'OtherRef' classification, this will have an author date citation in [Chicago](https://libguides.mq.edu.au/referencing/Chicago). E.g. Wilkes 1969, 461; Maršić 2010, 65-67.
* Textual descriptions. Values: All values distinct, if duplicated, refer to MonumentCorpusID and CorpusName to distinguish.
5. **isPrimaryReference**
* Marks whether or not this reference data (all columns) was the primary means of citation in the thesis related to this dataset (Coopey 2020). The order of preference for reference works was as follows (DESC): 'CIL', 'AE', 'ILJug', 'Tončinić', 'Betz', 'OtherRef'. The value '1' marks this reference out as the' primary reference', _null_ means it is not the primary reference.
* Constrained values: 1; _null_

### monument_serviceman.csv
* This table records data relating to which monuments refer to which servicemen, and in what capacity.
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
1. MonumentServicemanID
* Primary key and surrogate key. Provides means of identification for each combination of monument (MonumentID) and serviceman (ServicemanID).
* Numerical values: 1-139
2. ServicemanID
* Foreign key and surrogate key referencing data/legio_serviceman.ServicemanID. Identifies the serviceman referred to on a monument.
* Constrained numerical values: 1-137
3. MonumentID
* Foreign key and surrogate key referencing data/monument.MonumentID and  identifying the monument in each line.
* Constrained numerical values: 2; 4-109; 126-130
4. ServicemanReferencedAs
* Records the capacity in which the serviceman/servicemen were referred to in the monument's inscription. _null_ means that their capacity is not ascertainable or has not been recorded in this dataset. Other than _null_ there are 6 possible values:
	* 'administrator' = referred to in an administrative capacity.
	* 'commemorated' = commemorated by the monument.
	* 'commemorator' = erected the monument in commemoration of another/others.
	* 'commemorator and commemorated' = erected the monument in commemoration of others and/or themselves.
	* 'dedicant' = dedicated the monument to a certain deity (typically used in reference to altars)
	* 'political supporter' = referred to as a political supporter
* Constrained values (own): _null_; administrator; commemorated; commemorator; commemorator and commemorated; dedicant; political supporter
5. PossibleDuplicateServicemanID
* Records if the serviceman may be a duplicate of another serviceman with a separate ServicemanID from another MonumentID. Provideds the ServicemanID of the possible duplciate. _null_ means no information regarding possible duplicates has been recorded in this dataset (they are represented as duplicates in the dataset already, or they have no potential duplicates).
* Values: _null_, 102; 107
6. SourceForDuplicateArgument
* Records the bibliographical reference for any scholarly sources which hypothesise that a certain ServicemanID may be a duplicate of another ServicemanID. _null_ means there has been no data recorded for this column in this dataset.
* Values: Textual descriptions or _null_

### 8. unit.csv
* This table records data concerning the unit, or possible combinations of units, an individual serviceman can be assigned within this dataset.
* This table is created using the .sql code:

``` SQL
CREATE TABLE unit (
	UnitID INTEGER PRIMARY KEY,
	UnitTitle TEXT
);
```

* Columns
1. **UnitID**
* Primary key and surrogate key which records the unit/s a serviceman may have served in according to the inscription on a monument. This column can be joined with data/unit.UnitTitle to be more (human) reader friendly. As seen with analysis/all_servicemen.Unit_Affiliation_and_Certainty.
* Numerical values: 1-12
2. **UnitTitle**
* Latin name of Roman unit/s that a serviceman served in, or likely served in.
* Constrained vocabulary. Values: Ala Tungrorum; Cohors II Cyrrhestarum; Legio VII; Legio VII Claudia; Legio VII Claudia pia fidelis; Legio VII Claudia pia fidelis and VII Claudia; Legio VII Claudia pia fidelis or XI Claudia pia fidelis; Legio VII Macedonica; Legio VII or VII Claudia pia fidelis; Legio VII or VIII; Legio VII, VII Claudia pia fidelis, XI, XI Claudia pia fidelis; Legio XI
