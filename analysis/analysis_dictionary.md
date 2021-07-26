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
  * Ancient_Province
  * Ancient_Site
  * General_Provenience
  * Modern_Find_Site
  * Modern_Provenience
  * General_Location_Note
  * Unique_Monument_Provenience_Note
  * LAT
  * LONG
  * Pleiades
  * Trismegistos
  * MonumentNote
  * Media

## Table Field Descriptions

### all_servicemen.csv
* This table combines data from multiple tables within the dataset to provide an overview of the servicemen recorded on monuments within the corpus.
* This Table is created with this .sql code:

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
* Distinct Values: 1-135; 137
2. **MonumentIDs**
* Source Table: (data/LegioServicemen.MonumentID)
* The MonumentID (from data/Monument.MonumentID) of the monument/s that record information about each serviceman. As such there can be several values for each ServicemanID. MonumentID is a surrogate Foreign key linking to data/Monument.
* Distinct Values: MonumentID 2; 4-35; 39-101; 103-109; 126-129
3. **Nomina**
* Source Table: (data/LegioServicemen.name)
* Name and paternal relation (where recorded) of the serviceman. Names are translated into English where the original inscription is complete, and left in the original Latin when incomplete (including lacunae).
* Distinct values: all values. While there may be duplicate names, they are names shared by individual people. Use ServicemanID to determine uniqueness.
4. **Tribus**
* Source Table: (data/LegioServicemen.tribe)
* Roman tribe or _tribus_ (Latin) of the recorded serviceman if recorded. _null_ means an absence of data referring to tribe (either it is not recorded or the inscription is fragmentary).
* Distinct Values: _null_; Aemilia; Aniensis; Camilia; Claudia; Cornelia; Fabia; Lemonia; Maecia; Palatina; Papiria; Pollia; Pomptina; Publilia; Quirina; Scaptia; Sergia; Tromentia; Velina; Voltinia
5. **Domicilium**
* Source Table: (data/LegioServicemen.OriginSettlement & data/LegioServicemen.OriginProvince)
* _Domicilium_ (Latin), or city of origin, of the serviceman and the Roman province of this settlement/city. _null_ means an absence of data referring to _Domicilium_ (either it is not recorded or the inscription is fragmentary).
* Distinct Values: _null_; Aesis, Galatia; Alorum, Macedonia; Amblada, Galatia; Ancyra, Galatia; Arretium, Italy; Augusta Troas, Asia; Augusta,; Beneventum, Italy; Bononia, Italy; Brixia, Italy; Clistinna, Galatia; Conana, Galatia; Cormassa, Galatia; Cremona, Italy; Dentum, Macedonia; Dyrrachium, Macedonia; Edessa, Macedonia; Florentia, Italy; Forum Corneli, Italy; Heraclea,; Iconium, Galatia; Isinda, Galatia; Laranda, Galatia; Libarna, Italy; Milyas, Galatia; Ninica, Galatia; Pessinus, Galatia; Phazimon, Galatia; Philippi, Macedonia; Pisaurum, Italy; Placentia, Italy; R[---],; Sebaste, Galatia; Sebastopolis, Galatia; Sinope, Galatia; Ticinum, Italy; Trernahensis,; Varvaria, Dalmatia; Verona, Italy; Vienna, Gallia Narbonensis
6. **DefiniteServiceman**
* Source Table: (data/LegioServicemen.DefiniteServiceman)
* Records whether the individual is definitely or potentially a serviceman with the values 'yes' and 'maybe'. 'yes' = the individual is recorded as a soldier upon the monument. 'maybe' = the individual could potentially be a soldier, but this is not explicitly stated in writing within the inscription. Refer to ServicemanNote for more information on why an individual classed as 'maybe' has been included.
* Values: yes; maybe
7. **Unit_Affiliation_and_Certainty**
* Source Table: (data/Units.UnitTitle & data/LegioServicemen.LiklihoodOfUnitAttribution)
* Latin name of Roman unit/s that the serviceman served in, or likely served in, followed by the certainty of this attribution inside parentheses recorded as either 'epigraphically attested' or 'conjecture'. 'conjecture' = the unit attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription.
* Values: Ala Tungrorum(conjecture); Ala Tungrorum(epigraphically attested); Cohors II Cyrrhestarum(conjecture); Cohors II Cyrrhestarum(epigraphically attested); Legio VII Claudia pia fidelis and VII Claudia(epigraphically attested); Legio VII Claudia pia fidelis or XI Claudia pia fidelis(conjecture); Legio VII Claudia pia fidelis(conjecture); Legio VII Claudia pia fidelis(epigraphically attested); Legio VII Claudia(epigraphically attested); Legio VII Macedonica(epigraphically attested); Legio VII or VII Claudia pia fidelis(conjecture); Legio VII or VII Claudia pia fidelis(epigraphically attested); Legio VII or VIII(epigraphically attested); Legio VII(conjecture); Legio VII(epigraphically attested); Legio VII, VII Claudia pia fidelis, XI, XI Claudia pia fidelis(conjecture); Legio XI(epigraphically attested)
8. **Office_and_Certainty**
* Source Table: (data/MilitaryStatus.FirstRecordedOffice & data/MilitaryStatus.FirstOfficeCertainty)
* First office of the servicemen (if recorded) in Latin, followed by the certainty of this office being ascribed to them (inside parentheses). The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the attribution of the office is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data referring to office (either it is not recorded or the inscription is fragmentary).
* Values: _null_; centurio(conjecture); centurio(epigraphically attested); eques(conjecture); eques(epigraphically attested); imaginifer(epigraphically attested); miles(epigraphically attested); primus pilus(epigraphically attested); princeps posterior(epigraphically attested); scriba(epigraphically attested); signifer(epigraphically attested); tribunus(conjecture)
9. **Other_Office_and_certainty**
* Source Table: (data/MilitaryStatus.SecondRecordedOffice & data/MilitaryStatus.SecondOfficeCertainty)
* Second listed office of the servicemen (if recorded) in Latin, followed by the certainty of this office being ascribed to them (inside parentheses). The value for certainty of attribution is 'epigraphically attested'. _null_ means an absence of data referring to a second office (either it is not recorded or the inscription is fragmentary).
* Values: _null_; exacto consularis(epigraphically attested); iudex(epigraphically attested); praefectus castorum(epigraphically attested)
10. **Veteran_Status_and_Certainty**
* Source Table: (data/MilitaryStatus.VeteranStatus & data/MilitaryStatus.Veteran_Status_and_Certainty)
* The veteran (Latin: _veteranus_) status of the servicemen (if recorded) as well as the certainty of this status being ascribed to them (inside parentheses). The two values for certainty of attribution are 'epigraphically attested' or 'conjecture'. 'conjecture' = the veteran status is possible on account of factors such as monument decoration, but it is not specified within the inscription. Use ServicemanNote for insight into those classed with offices classed as 'conjecture'. _null_ means an absence of data referring to veteran status (either it is not recorded or the inscription is fragmentary).
* Values: _null_; veteranus(conjecture); veteranus(epigraphically attested)
11. **ServicemanNote**
* Source Table: (data/LegioServicemen.ServicemanNote)
* This column records any extra information regarding the serviceman and anything to do with their status as a serviceman, their unit attribution, possible double ups in terms of identification, and the rationale for their inclusion in this table if not clear.
* Values: This column has 38 distinct values including _null_. These notes consist of paragraphs or sentences.

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
* MonumentID is a surrogate Foreign key linking from data/monument. It identifies the monument each line in this table is referring too, providing their means of identification within this dataset.
* Values: 1-130
2. **CIL**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the reference number/s of the monument in the (1863-) _corpus inscriptionem latinarum_ (CIL). _null_ means the absence of information about this monument's references in the _corpus inscriptionem latinarum_ (CIL) within _this_ dataset = it has either not been found/recorded or it does not exist. If a monument has multiple entries in the CIL, each entry is separated by a ';'.
* Values: Each value is _null_ or distinct. If distinct, in the format of: "'Volume' , 'Reference number'". E.g. 03, 14951 is inscription #14951 in the 3rd volume of the CIL (often recorded as III 14951).
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
* Values: All values are distinct or _null_. If distinct, in format of: "'Volume', 'Reference number'". E.g. 3, 2092 is inscription 2092 in the 3rd volume of ILJug.
6. **AE**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the publication and reference number/s of the monument in the (1888-) _L'Année Epigraphique_ (AE). _null_ means the absence of information about this monument's references in AE within _this_ dataset = it has either not been found/recorded or it does not exist. If a monument has multiple entries in the AE, each entry is separated by a ';'.
* Values: All values are distinct or _null_. If distinct, in format of: "'Year of AE', 'Reference number'". E.g. 1900, 0046 is inscription 46 from the AE volume published for the year 1900.
7. **EDCS**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the URL and identifier of the entry for the monument on the _[Epigraphik-Datenbank Clauss Slaby](http://db.edcs.eu/epigr/epi.php?s_sprache=en)_ (EDCS). _null_ means the absence of information about this monument's references in EDCS within _this_ dataset = it has not been found/ does not exist. If a monument has multiple entries in the EDCS, each entry is separated by a ';'.
* Values: All values are distinct or _null_. If distinct, they comprise of a URL to the monument on the EDCS website. The last **8** numerals of each URL are also the monuments EDCS identification number. E.g. http://db.edcs.eu/epigr/edcs_id.php?s_sprache=en&p_edcs_id=EDCS-28400134 = EDCS ID 8400134.
8. **EDH**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the URL and identifier of the entry for the monument on the _[Epigraphic Database Heidelberg](https://edh-www.adw.uni-heidelberg.de/home)_ (EDH). _null_ means the absence of information about this monument's references in EDH within _this_ dataset = it has not been found/ does not exist. If a monument has multiple entries in the EDH, each entry is separated by a ';'.
* Values: All values are distinct or _null_. If distinct, they comprise of a URL to the monument on the EDH website. The last **8** characters of each URL are also the monuments EDH identification number. E.g. https://edh-www.adw.uni-heidelberg.de/edh/inschrift/HD028366 = EDH ID HD028366.
9. **OtherRef**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the bibliographic citations for any other reference works, catalogues, appendices, books or papers which refer to the monument (aside from CIL, Tončinić, Betz, ILJug, AE, EDCS or EDH). These works and their abbreviations (if any) are listed in DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris. _null_ means the absence of information about other references to this monument within _this_ dataset = they have not been found/ do not exist. If a monument has multiple other references, each entry is separated by a ';'.
* Values: The values are either _null_ or refer to a bibliographic citation in author date format (Chicago)[https://libguides.mq.edu.au/referencing/Chicago]. E.g. Wilkes 1969, 461; Maršić 2010, 65-67.

### leg_vii_funerary_monument.csv
* This table...
* This table is created with the SQL code:
``` SQL
SELECT MonumentID,
	CorpusName ||' ' || Reference AS 'Monument_Reference',
	MonumentOfSeventhLegion,
	MonumentType,
	DateFrom ||' to '|| DateTo AS 'Creation_Date',
	RomanProvince ||', '|| AncientSite AS 'Site_of_Discovery',
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
* MonumentID is a surrogate Foreign key linking from data/monument. It identifies the monument each line in this table is referring too, providing their means of identification within this dataset.
* Values: 2; 4-35; 39-82; 84-101; 103; 129-130
2. **Monument_Reference**
* Source Table: (data/monument_corpus.CorpusName & data/monument_corpus.Reference)
* Records the 'primary reference' of each monument referred to in this table. 'Primary reference' refers to the reference which was used to identify this monument in the thesis related to this database (this can be found in /thesis/). The order of preference for reference works was as follows (DESC): CIL, AE, ILJug, Tončinić, Betz, OtherRef (see data/corpus for these values). These works are listed in DB-SQL/bibliography_for_db.bib and DB-SQL/bibliography_for_db.ris.
* Values: Each value is a distinct citation. Either in the form of "'Reference work abbreviation','Volume','Reference number'" for a reference work, or author date (Chicago) for non reference works.
3. **MonumentOfSeventhLegion**
* Source Table: (data/monument.MonumentOfSeventhLegion)
* Records whether the monument commemorates, or was commemorated by, a serviceman of Legio VII. Values are 'yes' or 'maybe'. 'yes' = Legio VII is mentioned in what is left of the inscription or it can be reconstructed beyond reasonable doubt. 'maybe' = Legio VII is not mentioned in what is left of the inscription, but one can hypothesise that the monument belonged to a member of Legio VII based on 1) what survives of the inscription, 2) the location of the monument, 3) the style of the monument or 4) a combination of all these factors.
* Values: yes, maybe
4. **MonumentType**
* Source Table: (data/monument.Monument_Type)
* Records the class of funerary monument. Funerary monuments are understood as: "inscribed markers (often, but not exclusively, made of stone) primarily erected to indicate places of interment, as well as produce and preserve a memory of the deceased or soon-to-be deceased in a quasi-public cemeterial or funerary context" (Coopey 2020). The definitions for the types of monument are as follows: 'stela' = "stone monuments or ‘slabs’ with an inscribed epitaph bearing formulaic descriptions of the deceased and the commemorators" (Coopey 2020). 'tituli' = "isolated epitaphs with no, or minimal decorations" (Coopey 2020). 'altar' = a sacrificial altar with a funerary inscription. 'sacral monument' = a monument of a sacral nature.  'funerary inscription' = "an inscription fragment with content of a funerary nature whose larger monument has been too damaged to ascertain its specific type". 'inscription fragment' = a fragmentary from a monument which may have once been funerary or sacral but not enough is left for this to be securely ascertained.
* Values: titulus; stela; sacral monument; inscription fragment; funerary inscription; altar
5. **Creation_Date**
* Source Table:
*
* Values:
6. **Site_of_Discovery**
* Source Table:
*
* Values:
7. **Inscription**
* Source Table:
*
* Values:
8. **Media**
* Source Table:
*
* Values:

### all_monument_with_location.csv
* This table...
* This table is created with the SQL code:
``` SQL
```
