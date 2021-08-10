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
* Records the attribution for the English translation of the inscription. _null_ = there is not translation within this dataset concerning this inscription, so there is nothing to attribute. Any attribution involving "Coopey" refers to the co-author of this database of the same name. Other citations are in author-date [Chicago](https://libguides.mq.edu.au/referencing/Chicago) style.
* Constrained vocabulary (see above). Values: _null_; Tončinić 2011; Demicheli, Tončinić 2012; Coopey, edit of Tončinić 2011 and Cesarik 2016; Coopey, edit of Tončinić 2011 (made with help of Milićević-Bradač); Coopey, edit of Tončinić 2011; Coopey, edit of Rendić-Miočević 1987; Coopey
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
