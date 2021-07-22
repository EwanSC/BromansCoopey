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
3. **Definite_Funerary_Monuments.csv**
  * MonumentID
  * Monument_Reference
  * MonumentType
  * Creation_Date
  * Site_of_Discovery
4. **Monument_and_Location.csv**
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
5. **PrimaryCorpus.csv**
  * MonumentID
  * Reference
  * Monument_Type
  * Media

## Table Field Descriptions

### all_servicemen.csv

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
* Distinct Values: MonumentID 2, 4-35, 39-101, 103-109, 126-129
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
* Source Table: (LegioServicemen.DefiniteServiceman)
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
