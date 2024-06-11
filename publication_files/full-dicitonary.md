# Dictionary
This is a dictionary of the structure and context of the csv files held in /data and /analysis folders.

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
* Records the attribution for the English translation of the inscription. _null_ = there is not translation within this dataset concerning this inscription, so there is nothing to attribute. Any attribution involving "Coopey" refers to the co-author of this database of the same name. Samuel Wessels is an Australian scholar at Macquarie University. Other citations are in author-date [Chicago](https://libguides.mq.edu.au/referencing/Chicago) style.
* Constrained vocabulary (see above). Values: _null_; Tončinić 2011; Demicheli, Tončinić 2012; Coopey, edit of Tončinić 2011 and Cesarik 2016; Coopey, edit of Tončinić 2011 (made with help of Milićević-Bradač); Coopey, edit of Tončinić 2011; Coopey, edit of Rendić-Miočević 1987; Coopey; Samuel Wessels
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

# Dictionary for /analysis

## Overview

**5** csv tables have been generated as a form of analysis via the *DB Browser for SQLite* 'view' function. It is important to note that **NOT** all columns from the /data tables feature in these views. Instead, they represent _some_ of the types of queries/analyses which can be made through this data.

## The Tables

The **5** analysis tables and their columns are:
1. **all_servicemen.csv**
  * ServicemanID
  * Monument
  * Nomina
  * Tribus
  * Domicilium
  * DefiniteServiceman
  * Unit_Affiliation_and_Certainty
  * Office_and_Certainty
  * Other_Office_and_certainty
  * Veteran_Status_and_Certainty
  * ServicemanNote
2. **all_corpora.csv**
  * MonumentID
  * CIL
  * Tončinić
  * Betz
  * ILJug
  * AE
  * EDCS
  * EDH
  * OtherRef
3. **leg_vii_funerary_monument.csv**
  * MonumentID
  * Monument_Reference
  * MonumentOfSeventhLegion
  * MonumentType
  * Creation_Date
  * Site_of_Discovery
  * Inscription
  * Media
4. **all_monument_with_location.csv**
  * MonumentID
  * Monument_Reference
  * MonumentType
  * Mention_Legio_VII
  * Inscription
  * Translation
  * Source_of_Translation
  * Tončinić_2011_Style_Type
  * Lower_Field_Decoration
  * Portrait
  * Frieze
  * Creation_Date
  * DateNote
  * Current_Location
  * Roman_Province
  * Ancient_Site
  * Specific_Provenience
  * Modern_Find_Site
  * Modern_Provenience
  * General_Location_Note
  * Unique_Monument_Provenience_Note
  * LAT
  * LONG
  * Pleiades
  * Trismegistos
  * MonumentNote
  * DBInclusionReason
  * Media

## Table Field Descriptions

### all_servicemen.csv
* This table combines data from multiple tables within the dataset to provide an overview of the servicemen recorded on monuments within the corpus.
* This table is created with this .sql code:

``` SQL
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
```

* Columns:
1. **ServicemanID**
* Source Table: (data/LegioServicemen.ServicemanID)
* This is the column where the ID number for each individual serviceman referenced in the corpus is listed. It is the Primary Key from the data/LegioServicemen table. It is a surrogate key with no relationship to external datasets. The table is ordered by this column. It is ordered firstly by whether or not the serviceman is definitely or likely a serviceman (e.g. epigraphically attested or conjecture), and then is ordered by ServicemanID.
* Values: 1-135; 137
2. **MonumentIDs**
* Source Table: (data/LegioServicemen.MonumentID)
* The MonumentID (from data/Monument.MonumentID) of the monument/s that record information about each serviceman. As such there can be several values for each ServicemanID. MonumentID is a Foreign key and surrogate key linking to data/Monument.
* Values: 2; 4-35; 39-101; 103-109; 126-129
3. **Nomina**
* Source Table: (data/LegioServicemen.name)
* Name and paternal relation (where recorded) of the serviceman. Names are translated into English where the original inscription is complete, and left in the original Latin when incomplete (including lacunae).
* Unconstrained vocabulary. Values: All values are distinct. While there may be duplicate names, they are names shared by individual people. Use ServicemanID to determine uniqueness.
4. **Tribus**
* Source Table: (data/LegioServicemen.tribe)
* Roman tribe or _tribus_ (Latin) of the recorded serviceman if recorded. _null_ means an absence of data referring to tribe (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary. Values: _null_; Aemilia; Aniensis; Camilia; Claudia; Cornelia; Fabia; Lemonia; Maecia; Palatina; Papiria; Pollia; Pomptina; Publilia; Quirina; Scaptia; Sergia; Tromentia; Velina; Voltinia
5. **Domicilium**
* Source Table: (data/LegioServicemen.OriginSettlement & data/LegioServicemen.OriginProvince)
* _Domicilium_ (Latin)/ city of origin of the serviceman and the Roman province of this settlement/city. _null_ means an absence of data referring to _Domicilium_ (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary, _Domicilium_ taken from https://www.trismegistos.org/geo/ where available, otherwise taken from inscription in data/monument.Inscription. Values: _null_; Aesis, Galatia; Alorum, Macedonia; Amblada, Galatia; Ancyra, Galatia; Arretium, Italy; Augusta Troas, Asia; Augusta,; Beneventum, Italy; Bononia, Italy; Brixia, Italy; Clistinna, Galatia; Conana, Galatia; Cormassa, Galatia; Cremona, Italy; Dentum, Macedonia; Dyrrachium, Macedonia; Edessa, Macedonia; Florentia, Italy; Forum Corneli, Italy; Heraclea,; Iconium, Galatia; Isinda, Galatia; Laranda, Galatia; Libarna, Italy; Milyas, Galatia; Ninica, Galatia; Pessinus, Galatia; Phazimon, Galatia; Philippi, Macedonia; Pisaurum, Italy; Placentia, Italy; R[---],; Sebaste, Galatia; Sebastopolis, Galatia; Sinope, Galatia; Ticinum, Italy; Trernahensis,; Varvaria, Dalmatia; Verona, Italy; Vienna, Gallia Narbonensis
6. **DefiniteServiceman**
* Source Table: (data/LegioServicemen.DefiniteServiceman)
* Records whether the individual is definitely or potentially a serviceman with the values 'yes' and 'maybe'. 'yes' = the individual is recorded as a soldier upon the monument. 'maybe' = the individual could potentially be a soldier, but this is not explicitly stated in writing within the inscription. Refer to ServicemanNote for more information on why an individual classed as 'maybe' has been included.
* Constrained vocabulary. Values: yes; maybe
7. **Unit_Affiliation_and_Certainty**
* Source Table: (data/Units.UnitTitle & data/LegioServicemen.LiklihoodOfUnitAttribution)
* Latin name of Roman unit/s that the serviceman served in, or likely served in, followed by the certainty of this attribution inside parentheses recorded as either 'epigraphically attested' or 'conjecture'. 'epigraphically attested' = it is specified in the inscription. 'conjecture' = the unit attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription.
* Constrained vocabulary. Values: Ala Tungrorum(conjecture); Ala Tungrorum(epigraphically attested); Cohors II Cyrrhestarum(conjecture); Cohors II Cyrrhestarum(epigraphically attested); Legio VII Claudia pia fidelis and VII Claudia(epigraphically attested); Legio VII Claudia pia fidelis or XI Claudia pia fidelis(conjecture); Legio VII Claudia pia fidelis(conjecture); Legio VII Claudia pia fidelis(epigraphically attested); Legio VII Claudia(epigraphically attested); Legio VII Macedonica(epigraphically attested); Legio VII or VII Claudia pia fidelis(conjecture); Legio VII or VII Claudia pia fidelis(epigraphically attested); Legio VII or VIII(epigraphically attested); Legio VII(conjecture); Legio VII(epigraphically attested); Legio VII, VII Claudia pia fidelis, XI, XI Claudia pia fidelis(conjecture); Legio XI(epigraphically attested)
8. **Office_and_Certainty**
* Source Table: (data/MilitaryStatus.FirstRecordedOffice & data/MilitaryStatus.FirstOfficeCertainty)
* First office of the servicemen (if recorded in an inscription) in Latin, followed by the certainty of this office being ascribed to them (inside parentheses). The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data referring to office (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary. Values: _null_; centurio(conjecture); centurio(epigraphically attested); eques(conjecture); eques(epigraphically attested); imaginifer(epigraphically attested); miles(epigraphically attested); primus pilus(epigraphically attested); princeps posterior(epigraphically attested); scriba(epigraphically attested); signifer(epigraphically attested); tribunus(conjecture)
9. **Other_Office_and_certainty**
* Source Table: (data/MilitaryStatus.SecondRecordedOffice & data/MilitaryStatus.SecondOfficeCertainty)
* Second listed office of the servicemen (if recorded in an inscription) in Latin, followed by the certainty of this office being ascribed to them (inside parentheses). The value for certainty of attribution is 'epigraphically attested'. _null_ means an absence of data referring to a second office (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary. Values: _null_; exacto consularis(epigraphically attested); iudex(epigraphically attested); praefectus castorum(epigraphically attested)
10. **Veteran_Status_and_Certainty**
* Source Table: (data/MilitaryStatus.VeteranStatus & data/MilitaryStatus.Veteran_Status_and_Certainty)
* The veteran (Latin: _veteranus_) status of the servicemen (if recorded) as well as the certainty of this status being ascribed to them (inside parentheses). The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the veteran status is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data referring to veteran status (either it is not recorded or the inscription is fragmentary).
* Constrained vocabulary. Values: _null_; veteranus(conjecture); veteranus(epigraphically attested)
11. **ServicemanNote**
* Source Table: (data/LegioServicemen.ServicemanNote)
* This column records any extra information regarding the serviceman and anything to do with their status as a serviceman, their unit attribution, possible double ups in terms of identification, and the rationale for their inclusion in this table if not clear.
* Values: Textual descriptions. 38 distinct values including _null_. These notes consist of paragraphs or sentences.

### all_corpora.csv
* This table is meant to act as a reader friendly bibliography table, combining the data from data/corpus and data/monument_corpus to record the monuments references numbers in various epigraphic reference works, as well as secondary literature referring to this monument.
* This table is created with the SQL code:
``` SQL
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
```

* Columns:
1. **MonumentID**
* Source Table: (data/monument.MonumentID)
* MonumentID is a surrogate key and Foreign key linking from data/monument. It identifies the monument each line in this table is referring to, providing their means of identification within this dataset.
* Values: 1-130
2. **CIL**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the reference number/s of the monument in the (1863-) _corpus inscriptionem latinarum_ (CIL). _null_ means the absence of information about this monument's references in the _corpus inscriptionem latinarum_ (CIL) within _this_ dataset = it has either not been found/recorded or it does not exist. If a monument has multiple entries in the CIL, each entry is separated by a ';'.
* Unconstrained values: Each value is _null_ or distinct. If distinct, in the format of: "'Volume' , 'Reference number'". E.g. 03, 14951 is inscription #14951 in the 3rd volume of the CIL (often recorded as III 14951).
3. **Tončinić**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the category number/s (English: cat. no., Hrvatski: kat. br.) of the monument in Tončinić (2011) _Spomenici VII. legije na području rimske provincije Dalmacije / Monuments of Legio VII in the Roman Province of Dalmatia_. _null_ means the absence of information about this monument in Tončinić (2011) = it does not exist.
* Values: 001-115
4. **Betz**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the category number/s (English: cat. no., Hrvatski: kat. br.) of the monument in Betz (1938) _Untersuchungen zur Militärgeschichte der römischen Provinz Dalmatien_. _null_ means the absence of information about this monument in Betz (1938) = it does not exist. If a monument has multiple entries in Betz (1938) each entry is separated by a ';'.
* Values: 001; 004-025; 027-082; 084; 173-174
5. **ILJug**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the reference number/s of the monument in the (1963-1986) _Inscriptiones latinae quae in Iugoslavia_ (ILJug). _null_ means the absence of information about this monument's references in ILJug within _this_ dataset = it has either not been found/recorded or it does not exist.
* Unconstrained values: All values are distinct or _null_. If distinct, in format of: "'Volume', 'Reference number'". E.g. 3, 2092 is inscription 2092 in the 3rd volume of ILJug.
6. **AE**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the publication and reference number/s of the monument in the (1888-) _L'Année Epigraphique_ (AE). _null_ means the absence of information about this monument's references in AE within _this_ dataset = it has either not been found/recorded or it does not exist. If a monument has multiple entries in the AE, each entry is separated by a ';'.
* Unconstrained values: All values are distinct or _null_. If distinct, in format of: "'Year of AE', 'Reference number'". E.g. 1900, 0046 is inscription 46 from the AE volume published for the year 1900.
7. **EDCS**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the URL and identifier of the entry for the monument on the _[Epigraphik-Datenbank Clauss Slaby](http://db.edcs.eu/epigr/epi.php?s_sprache=en)_ (EDCS). _null_ means the absence of information about this monument's references in EDCS within _this_ dataset = it has not been found/ does not exist. If a monument has multiple entries in the EDCS, each entry is separated by a ';'.
* Unconstrained values: All values are distinct or _null_. If distinct, they comprise of a URL to the monument on the EDCS website. The last **8** numerals of each URL are also the monuments EDCS identification number. E.g. http://db.edcs.eu/epigr/edcs_id.php?s_sprache=en&p_edcs_id=EDCS-28400134 = EDCS ID 8400134.
8. **EDH**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the URL and identifier of the entry for the monument on the _[Epigraphic Database Heidelberg](https://edh-www.adw.uni-heidelberg.de/home)_ (EDH). _null_ means the absence of information about this monument's references in EDH within _this_ dataset = it has not been found/ does not exist. If a monument has multiple entries in the EDH, each entry is separated by a ';'.
* Unconstrained values: All values are distinct or _null_. If distinct, they comprise of a URL to the monument on the EDH website. The last **8** characters of each URL are also the monuments EDH identification number. E.g. https://edh-www.adw.uni-heidelberg.de/edh/inschrift/HD028366 = EDH ID HD028366.
9. **OtherRef**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the bibliographic citations for any other reference works, catalogues, appendices, books or papers which refer to the monument (aside from CIL, Tončinić, Betz, ILJug, AE, EDCS or EDH). These works and their abbreviations (if any) are listed in DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris. _null_ means the absence of information about other references to this monument within _this_ dataset = they have not been found/ do not exist. If a monument has multiple other references, each entry is separated by a ';'.
* Unconstrained values: The values are either _null_ or a citation in author date format [Chicago](https://libguides.mq.edu.au/referencing/Chicago). E.g. Wilkes 1969, 461; Maršić 2010, 65-67.

### leg_vii_funerary_monument.csv
* This table records the 98 funerary and sacral monuments which do, or may, commemorate or refer to a member of the Roman Legio VII. These are the monuments which acted as the primary focus of the MRes Thesis research this database was a part of (Coopey 2020).
* This table is created with the SQL code:
``` SQL
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
```
* Columns
1. **MonumentID**
* Source Table: (data/monument.MonumentID)
* MonumentID is a  surrogate key and  Foreign key linking from data/monument. It identifies the monument each line in this table is referring too, providing their means of identification within this dataset.
* Values: 2; 4-35; 39-82; 84-101; 103; 129-130
2. **Monument_Reference**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the 'primary reference' of each monument referred to in this table. 'Primary reference' refers to the reference which was used to identify this monument in the thesis (Coopey 2020) related to this database (this can be found in /thesis/). The order of preference for reference works was as follows (DESC): 'CIL', 'AE', 'ILJug', 'Tončinić', 'Betz', 'OtherRef' (see data/corpus for these values). These works are listed in DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris.
* Unconstrained values: Each value is a distinct citation. Either in the form of "'Reference work abbreviation', 'Volume', 'Reference number'" for a reference work, or author date (Chicago) for non reference works.
3. **MonumentOfSeventhLegion**
* Source Table: (data/monument.MonumentOfSeventhLegion)
* Records whether the monument records, commemorates, or was commemorated by, a serviceman/servicemen of Legio VII. Values are 'yes' or 'maybe'. 'yes' = Legio VII is mentioned in what is left of the inscription or it can be reconstructed beyond reasonable doubt. 'maybe' = Legio VII is not mentioned in what is left of the inscription, but one can hypothesise that the monument belonged to a member of Legio VII based on 1) what survives of the inscription, 2) the location of the monument, 3) the style of the monument, 4) a combination of all these factors.
* Constrained Vocabulary. Values: yes, maybe
4. **MonumentType**
* Source Table: (data/monument.Monument_Type)
* Records the class of funerary monument.
* 'titulus' = "isolated epitaphs with no, or minimal decorations" (Coopey 2020).
* 'stela' = "stone monuments or ‘slabs’ with an inscribed epitaph bearing formulaic descriptions of the deceased and the commemorators" (Coopey 2020).
* 'sacral monument' = a monument of a sacral nature. 'sacral altar' = an altar where the inscription is sacral in nature.
* 'inscription fragment' = a fragmentary from a monument which may have once been funerary or sacral but not enough is left for this to be securely ascertained.
* 'funerary inscription' = "an inscription fragment with content of a funerary nature whose larger monument has been too damaged to ascertain its specific type".
* 'altar' = a sacrificial altar with a funerary inscription.
* Constrained vocabulary from Coopey (2020). Values: titulus; stela; sacral monument; inscription fragment; funerary inscription; altar
5. **Creation_Date**
* Source Table: (data/monument.DateFrom & data/monument.DateTo)
* Records the date range for the creation of the monument. The dates are in BCE/CE. With BCE represented by negative values. E.g. -30 = 30 BCE
* Numerical Values: The dates range between -30 and 230
6. **Site_of_Discovery**
* Source Table: (data/findspot.RomanProvince & data/findspot.AncientSite)
* Records the Ancient find spot of the monument (province and site).
* Constrained vocabulary: site names from https://www.trismegistos.org/geo/ where possible, for vocabulary for province names see data/data_dictionary. Values: Dalmatia; Dalmatia, Aequum; Dalmatia, Andetrium; Dalmatia, Asseria; Dalmatia, Burnum; Dalmatia, Corinium; Dalmatia, Iadera; Dalmatia, Municipium Riditarum/Rider; Dalmatia, Narona; Dalmatia, Pagus Scunasticus; Dalmatia, Salona; Dalmatia, Siculi; Dalmatia, Tilurium; Dalmatia, Tragurium; Galatia, Antiochia Pisidiae; Galatia, Apollonia/Tymandus; Galatia, Cormasa; Galatia, Iconium; Moesia Superior, Viminacium; Thracia, Lysimacheia.
7. **Inscription**
* Source Table: (data/monument.inscription)
* Records a transcription of the inscription found upon each monument in the original Latin or, rarely, ancient Greek, following the [Leiden Conventions](https://en.wikipedia.org/wiki/Leiden_Conventions).
* Values: Textual descriptions. Each value is a distinct transliteration.
8. **Media**
* Source Table: (data/monument.Media)
* Records URLs for images (photos or illustrations) of the monument. Where possible, the URL is for the <http://lupa.at> website. With some monuments having links to EDCS <http://db.edcs.eu>, and some having no images within the database (represented with _null_)
* Unconstrained values: _null_ or distinct. Distinct values are all URLs to gallery of images.

### all_monument_with_location.csv
* This table records all information from the data/monument and data/findspot tables to provide an in-depth overview of the archaeological and epigraphic corpus stored in this dataset (as opposed to the individuals mentioned). It is, in a sense, a kind of 'Master' table.
* This table is created with the SQL code:
``` SQL
SELECT
	MonumentID,
	CorpusName ||' ' || Reference AS 'Monument_Reference',
	MonumentType,
	MonumentOfSeventhLegion AS 'Mention_Legio_VII',
	Inscription,
	Translation,
	TranslationSource AS 'Source_of_Translation',
	Tončinić2011StelaeType AS 'Tončinić_2011_Style_Type',
	LowerFieldDecoration || (coalesce(', '|| LowerFieldDetail, ' ')) AS 'Lower_Field_Decoration',
	Portrait,
	Frieze,
	DateFrom ||' to '||	DateTo AS 'Creation_Date',
	DateNote,
	ModernHolding ||(coalesce(', '|| HoldingData, ' ')) AS 'Current_Location',
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
```

* Columns
1. **MonumentID**
* Source Table: (data/monument.MonumentID)
* MonumentID is a Foreign key and surrogate key linking from data/monument. It identifies the monument each line in this table is referring too, providing their means of identification within this dataset.
* Values: 1-130
2. **Monument_Reference**
* Records the 'primary reference' of each monument referred to in this table. 'Primary reference' refers to the reference which was used to identify this monument in the thesis (Coopey 2020) related to this database (this can be found in /thesis/). The order of preference for reference works was as follows (DESC): 'CIL', 'AE', 'ILJug', 'Tončinić', 'Betz', 'OtherRef' (see data/corpus for these values). These works are listed in DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris.
* Unconstrained values: Each value is a distinct citation. Either in the form of "'Reference work abbreviation', 'Volume', 'Reference number'" for a reference work, or author date (Chicago) for non reference works.
3. **MonumentType**
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
4. **Mention_Legio_VII**
* Source Table: (data/monument.MonumentOfSeventhLegion)
* Records whether the monument records, commemorates, or was commemorated by, a serviceman/servicemen of Legio VII. Values are 'yes', 'maybe', 'no'. 'yes' = Legio VII is mentioned in what is left of the inscription or it can be reconstructed beyond reasonable doubt. 'maybe' = Legio VII is not mentioned in what is left of the inscription, but one can hypothesise that the monument belonged to a member of Legio VII based on 1) what survives of the inscription, 2) the location of the monument, 3) the style of the monument, 4) a combination of all these factors. 'no' = no mention of Legio VII in extant inscription and no reason to believe it once existed (e.g. refers to a member of another unit). For why these monuments classed a 'no' are included in this database, refer to DBInclusionReason in this table (or data/monument.DBInclusionReason).
* Constrained vocabulary. Values: yes, maybe, no
5. **Inscription**
* Source Table: (data/monument.inscription)
* Records a transcription of the inscription found upon each monument in the original Latin or, rarely, ancient Greek, following the [Leiden Conventions](https://en.wikipedia.org/wiki/Leiden_Conventions).
* Values: Textual descriptions. Each value is a distinct transliteration of an inscription.
6. **Translation**
* Source Table: (data/monument.Translation)
* Records an English translation of the Latin/Ancient Greek (including lacunae where appropriate).
* Values: Textual description: Each translation is distinct. While there may be duplicate translations, the inscription they are based off is distinct, in which case refer to MonumentID to differentiate.
7. **Source_of_Translation**
* Source Table: (Data/monument.TranslationSource)
* Records the attribution for the English translation of the inscription. _null_ = there is not translation within this dataset concerning this inscription, so there is nothing to attribute. Any attribution involving "Coopey" refers to the co-author of this database of the same name. Samuel Wessels is an Australian scholar at Macquarie University. Other citations are in author-date [Chicago](https://libguides.mq.edu.au/referencing/Chicago) style.
* Constrained vocabulary (see above). Values: _null_; Tončinić 2011; Demicheli, Tončinić 2012; Coopey, edit of Tončinić 2011 and Cesarik 2016; Coopey, edit of Tončinić 2011 (made with help of Milićević-Bradač); Coopey, edit of Tončinić 2011; Coopey, edit of Rendić-Miočević 1987; Coopey; Samuel Wessels
8. **Tončinić_2011_Style_Type**
* Source Table: (data/monument.Tončinić2011StelaeType)
* Records the typological style type of the monument according to Tončinić (2011) _Spomenici VII. legije na području rimske provincije Dalmacije / Monuments of Legio VII in the Roman Province of Dalmatia_: 150-153. Here _null_ means there is not data relating to this column for a monument = either it is not classifiable within this typology or it is not a funerary monument.
* Constrained vocabulary from Tončinić (2011). Values: _null_; A1a; A1b; A2; A3a; A3b; A3c; Ra; Rb; Rc; altar; tituli
9. **Lower_Field_Decoration**
* Source Table: (data/monumentLowerFieldDecoration & data/monument.LowerFieldDetail)
* Records what decoration there is within the lower field (portion) of the monument (if any) and any details which can be made out. Here _null_ refers to the absence of data concerning the decoration of the lower field of this monument within this dataset = the monument either does not have a lower field or the lower field is broken off/lost. The broad description of the decoration style is recorded first, followed by any smaller details within this decoration. 'undecorated' = the lower field exists but is undecorated.
* Textual descriptions, own vocabulary with some monuments sharing same value. Values: _null_; (reduced) dual-panelled door, bow, arrows and quiver; dolabra; dona militaria; panelled door; panelled door, lions and handles; quad-panelled door; quad-panelled door, busts and knockers; quad-panelled door, construction tools; quad-panelled door, door knockers; quad-panelled door, handles; quad-panelled door, handles and knockers; quad-panelled door, knockers and floral; quad-panelled door, lions; quad-panelled door, lions and 'Attis'; quad-panelled door, lions and floral; quad-panelled door, lions and handles; quad-panelled door, lions and vines; undecorated
10. **Portrait**
* Source Table: (data/monument.Portrait)
* Records the type of portrait depicted upon the monument (if any). _null_ refers to the absence of data concerning this feature for a monument within this dataset = the monument is broken/lost.
* Constrained vocabulary (own). Values: _null_; bust; bust and rider; dual bust; family bust; no portrait; rider
11. **Frieze**
* Source Table: (data/monument.Frieze)
* Records information concerning the decorative style of the frieze upon the monument, if any. _null_ refers to the absence of data concerning a frieze for this monument within this dataset = the frieze is lost or the monument type cannot have a frieze. 'no frieze' means the monument could have had a frieze stylistically speaking, but does not.
* Constrained vocabulary (own). Values: _null_; floral; military; no frieze.
12. **Creation_Date**
* Source Table: (data/monument.DateFrom & data/monument.DateTo)
* Records the date range for the creation of the monument. The dates are in BCE/CE. With BCE represented by negative values. E.g. -30 = 30 BCE. Dates are own.
* Numerical Values: dates range between -30 and 230
13. **DateNote**
* Source Table: (data/monument.DateNote)
* Records a note about the dating of a monument, such as a more specific date, an issue, the rationale for a certain dating or a scholarly disagreement. _null_ means the absence of a note about the date within _this_ dataset.
* Values: Textual descriptions. Values are distinct (sentences or more specific ranges) or _null_
14. **Current_Location**
* Source Table: (data/monument.ModernHolding & data/monument.HoldingData)
* Records the status/modern location of the monument and any relevant holding number. _null_ means that there is no data concerning the status of this monument within this dataset = no information was available or found. The value 'lost' means that the monument is _known_ to be lost.
* Values: When not _null_ or 'lost', the values are distinct pieces of information about modern location.
15. **Roman_Province**
* Source Table: (data/findspot.RomanProvince)
* Records the Latin name of the Roman province wherein the monument was found (see data/data_dictionary for source of vocabulary).
* Constrained vocabulary. Values: Dalmatia; Galatia; Moesia Superior; Thracia
16. **Ancient_Site**
* Source Table: (data/findspot.AncientSite)
*  Records the Latin name of the ancient site where the monument was found. _null_ means there is no data concerning the find site of a monument in this dataset = it has not been recorded or it is not known.
* Constrained vocabulary from https://www.trismegistos.org/geo/ where possible, otherwise see analysis/all_corpora. Values: _null_; Aequum; Andetrium; Antiochia Pisidiae; Apollonia/Tymandus; Asseria; Burnum; Corinium; Cormasa; Iadera; Iconium; Lysimacheia; Municipium Riditarum/Rider; Narona; Pagus Scunasticus; Pons Tiluri; Salona; Siculi; Spalatum; Tilurium; Tragurium; Viminacium
17. **Specific_Provenience**
* Source Table: (data/findspot.SpecificAncientLocation)
* Records more precise and specific data relating to provenience (if available) in relation to a contemporary ancient structures, locations or features. _null_ = no more precise find spot data is available or it was not recorded in this dataset.
* Values: Textual description: _null_; East Necropolis; North Necropolis; Porta Caesarea-Five bridges
18. **Modern_Find_Site**
* Source Table: (data/findspot.ModernSite)
* Records the modern Croatian or Turkish name of the site where the monument was found.
* Constrained vocabulary from various academic written sources. Values: _null_; Bijaći; Bolayir; Danilo; Dicmo; Donji Karin; Drmno; Dugopolje; Filovača; Gardun; Glavica-Ljubuški; Glavice; Gorica; Gornji Muć; Gornji Postinje; Gračine-Humac; Grebine-Vitaljina; Gâvur Ören; Hrvace; Humac; Imotski; Kapljuč; Kistanje; Klis; Konya; Košute; Krinj-Hrvace; Krug; Podgrađe; Popovići; Prud; Razvođe; Seget Donji; Sinj; Sinjsko polje; Smokovice-Hardomilje; Solin; Split; Trilj; Trogir; Vaganj-Jajce; Veljaci; Vid; Vojnić; Vuna-Hardomilje; Yalvaç; Zadar; Čitluk
19. **Modern_Provenience**
* Source Table: (data/findspot.SpecificModernLocation)
* Records even more precise information concerning the provenience of the monument. _null_ refers to the lack of data within this dataset concerning provenience. 'uncertain' = it is known that the provenience of this monument in not known.
* Values are textual descriptions, whilst some text may be duplicated, they are separate find spots, see corresponding MonumentID for identification. Values: _null_; Cetina River; Church of st Michael; Mausoleum of Diocletian; built into modern structure; carved into rock; part of c.4th Late Antique tomb; re-used in Christian Cemetery; re-used in Medieval Cemetery; secondary use; surrounds of the amphitheatre; ul. Marka Marulića; uncertain
20. **General_Location_Note**
* Source Table: (data/findspot.ExtraLocationNote)
* Contains extra information about the location of a monument, such as nearby landmarks or other sites. _null_ means there is not extra information recorded about this site in this database.
* Values are textual descriptions (own). Values: _null_; 5km from Čitluk; Gradina; Matinčevo-Porta Suburbia I; Pet mostova; could also be from another site around the Sinjsko polje; found between Vojnić and Gardun; near Antiochia Pisidiae; near Burnum/Kistanje; near Dubrava, Poljice; near Jesenice, Poljice; near Karin; near Metković; near Porta Andetria; near Sinj; near Tragurium/Trogir; near Šibenik; right bank of Trebižat river
21. **Unique_Monument_Provenience_Note**
* Source Table: (data/monument.MonumentSpecificFindSpotNote)
* Extra information specific to the provenience and discovery of each monument (where available). _null_ means there is no extra unique information recorded for a monument.
* Values: Textual descriptions. Each value is either _null_ or a piece/pieces of information distinct to each monument.
22. **LAT**
* Source Table: (data/findspot.LATITUDE_epsg_4326)
* Records the latitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the latitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province). Source of latitude was Trismegistos (https://www.trismegistos.org/geo/) or Pleiades (https://pleiades.stoa.org/), and if neither available, Google Maps (https://www.google.com/maps). All were subject to being edited for higher precision by the author, however.
* Numerical values: 56 DISTINCT LAT values including _null_
23. **LONG**
* Source Table: (data/findspot.LONGITUDE_epsg_4326)
* Records the longitude of the find spot of the monument using [EPSG 326]( https://epsg.io/4326): World Geodetic System 1984. _null_ means that the longitude was not recorded in this dataset because the find spot was not specific enough (e.g., a whole province). Source of longitude was Trismegistos (https://www.trismegistos.org/geo/) or Pleiades (https://pleiades.stoa.org/), and if neither available, Google Maps (https://www.google.com/maps). All were subject to being edited for higher precision by the author, however.
* Numerical values: 56 DISTINCT LONG values including _null_
24. **Pleiades**
* Source Table: (data/findspot.Pleiades)
* Records the URL to the [Pleiades](https://pleiades.stoa.org) page for the find site of this monument. The last 6 digits of each URL are also the Pleiades identifier. _null_ means there is no Pleiades entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 22 DISTINCT Pleiades values including _null_
25. **Trismegistos**
* Source Table: (data/findspot.Trismegistos)
* Records the URL to the [Trismegistos](https://www.trismegistos.org) page for the find site of this monument. The digits at the end of each URL are also the Trismegistos identifier. _null_ means there is no Trismegistos entry for the find site of this monument in this dataset = it was not found or does not exist.
* URL values: 30 DISTINCT Trismegistos values including _null_
26. **MonumentNote**
* Source Table: (data/monument.MonumentNote)
* Records any additional information concerning the monument which does not fall into other columns. Such as scholarly debate concerning attribution, the degree of preservation (or lack thereof) and discrepancies in secondary literature. _null_ means no extra information was provided for this monument.
* Values: Textual descriptions. 54 DISTINCT MonumentNote values including _null_
27. **DBInclusionReason**
* Source Table: (data/monument.DBInclusionReason)
* Records the rationale for including the monument when it does not refer/possibly refer to Legio VII in the inscription. _null_ means there was no need state the rational for the inclusion of the monument = it refers, or may refer, to Legio VII.
* Values: Textual descriptions. 21 DISTINCT DBInclusionReason values including _null_
28. **Media**
* Source Table: (data/monument.Media)
* Records URLs for images (photos or illustrations) of the monument. Where possible, the URL is for the <http://lupa.at> website. With some monuments having links to EDCS <http://db.edcs.eu>, and some having no images within the database (represented with _null_)
* URL values: _null_ or distinct. Distinct values are all URLs to gallery of images.
