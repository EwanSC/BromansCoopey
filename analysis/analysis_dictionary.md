# Dictionary for /analysis tables

## Overview

**5** csv tables have been generated as a form of analysis via the *DB Browser for SQLite* 'view' function. It is important to note that **NOT** all columns from the /data tables feature in these views. Instead, they represent _some_ of the types of queries/analyses which can be made through this data.

## The Tables

The **5** analysis tables and their columns are:
1. All_Servicemen.csv
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
2. AllCorpora.csv
  * MonumentID
  * CIL
  * Tončinić
  * Betz
  * ILJug
  * AE
  * EDCS
  * EDH
  * OtherRef
3. Definite_Funerary_Monuments.csv
  * MonumentID
  * Monument Reference
  * MonumentType
  * Date
  * Site of Discovery
4. Monument_and_Location.csv
  * MonumentID
  * Monument Reference
  * MonumentType
  * Mentions Legio VII?
  * Inscription
  * Translation
  * Tončinić 2011 Style Type
  * Lower Field Decoration
  * Portrait
  * Frieze
  * Date
  * DateNote
  * Current Location
  * Ancient Province Find Spot
  * Ancient Site
  * General Proveniance
  * Modern Find Site
  * Modern Proveniance
  * General Location Note
  * Unique Monument Proveniance Note
  * LAT
  * LONG
  * Pleiades
  * Trismegistos
  * Note on the Monument
  * Media
5. PrimaryCorpus.csv
  * MonumentID
  * Reference
  * Monument Type
  * Media

## Table Tours

### All_Servicemen.csv

* This Table is created with this .sql code:

DROP VIEW IF EXISTS All_Servicemen;
CREATE VIEW All_Servicemen AS
SELECT DISTINCT
	LegioServicemen.ServicemanID,
	Monument,
	Name AS 'Nomina',
	Tribe AS 'Tribus',
	OriginSettlement ||', '|| (coalesce(OriginProvince, ' ')) AS 'Domicilium',
	DefiniteServiceman,
	Units.UnitTitle ||'('|| LegioServicemen.LiklihoodOfUnitAttribution AS 'Unit_Affiliation_and_Certainty',
	FirstRecordedOffice ||'('|| FirstOfficeCertainty AS 'Office_and_Certainty',
	SecondRecordedOffice ||'('|| SecondOfficeCertainty AS 'Other_Office_and_certainty',
	VeteranStatus ||'('|| VeteranStatusCertainty AS 'Veteran_Status_and_Certainty',
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

* Columns:
1. **ServicemanID**
* This is the column where the ID number for each individual serviceman referenced in the corpus is listed. It is the PrimaryKey from the data/LegioServicemen table (Data/LegioServicemen.ServicemanID). The view/table is ordered by this column. It is ordered firstly by whether or not the serviceman is definitely or likely a serviceman (e.g. epigraphically attested or conjecture), and then is ordered by ServicemanID.
* Distinct Values: 1-135; 137
2. **Monument**
* This is the ID number for each monument that the serviceman is referenced upon. As such there can be multiple entries in this Monument column for each ServicemanID. This Value is the PrimaryKey from the data/Monument table (data/monument.MonumentID)
* Distinct Values: 2; 4-35; 39-101, 103-109; 126-129
3. **Nomina**
* This is a column where there is an English translation of the name of the serviceman, including a paternal relation, if offered (e.g. 'Marcus, son of Julius'). If name data is not able to be fully reconstructed, it is left in the original Latin in the inscription. This references data/LegioServicemen.Name.
* Distinct Values: There are 126 unique values, however, in reality, all 136 values are '_distinct_' as some names were used by different servicemen. When servicemen share names, their uniqueness is demonstrated by their different ServicemanID values.
4. **Tribus**
* Here the Roman tribe or 'tribus' of the recorded serviceman is recorded if available. References data/LegioServicemen.tribe.
* Distinct Values: _null_; Aemilia; Aniensis; Camilia; Claudia; Cornelia; Fabia; Lemonia; Maecia; Palatina; Papiria; Pollia; Pomptina; Publilia; Quirina; Scaptia; Sergia; Tromentia; Velina; Voltinia
5. **Domicilium**
* This column records the domicilium, or city of origin, of the serviceman and the Roman province of this settlement. It references both data/LegioServicemen.OriginSettlement and data/LegioServicemen.OriginProvince.
* Distinct Values: _null_, _null_; Aesis, Galatia; Alorum, Macedonia; Amblada, Galatia; Ancyra, Galatia; Arretium, Italy; Augusta Troas, Asia; Augusta,  _null_; Beneventum, Italy; Bononia, Italy; Brixia, Italy; Clistinna, Galatia; Conana, Galatia; Cormassa, Galatia; Cremona, Italy; Dentum, Macedonia; Dyrrachium, Macedonia; Edessa, Macedonia; Florentia, Italy; Forum Corneli, Italy; Heraclea,  _null_; Iconium, Galatia; Isinda, Galatia; Laranda, Galatia; Libarna, Italy; Milyas, Galatia; Ninica, Galatia; Pessinus, Galatia; Phazimon, Galatia; Philippi, Macedonia; Pisaurum, Italy; Placentia, Italy; R[---],  _null_; Sebaste, Galatia; Sebastopolis, Galatia; Sinope, Galatia; Ticinum, Italy; Trernahensis,  _null_; Varvaria, Dalmatia; Verona, Italy; Vienna, Gallia Narbonensis
6. **DefiniteServiceman**
* This column records whether the individual is definitely or maybe a serviceman with the values 'yes' and 'maybe'. It references the column in LegioServicemen.DefiniteServiceman.
* Values: yes; maybe
7. **Unit_Affiliation_and_Certainty**
* This column records the Roman unit/s that the serviceman served, or likely served in with the Certainty of this allocation marked after a '(' with 'epigraphically attested' or 'conjecture'. These two values refer to the data from data/Units.UnitTitle and data/LegioServicemen.LiklihoodOfUnitAttribution.
* Values: Ala Tungrorum(conjecture; Ala Tungrorum(epigraphically attested; Cohors II Cyrrhestarum(conjecture; Cohors II Cyrrhestarum(epigraphically attested; Legio VII Claudia pia fidelis and VII Claudia(epigraphically attested; Legio VII Claudia pia fidelis or XI Claudia pia fidelis(conjecture; Legio VII Claudia pia fidelis(conjecture; Legio VII Claudia pia fidelis(epigraphically attested; Legio VII Claudia(epigraphically attested; Legio VII Macedonica(epigraphically attested; Legio VII or VII Claudia pia fidelis(conjecture; Legio VII or VII Claudia pia fidelis(epigraphically attested; Legio VII or VIII(epigraphically attested; Legio VII(conjecture; Legio VII(epigraphically attested; Legio VII, VII Claudia pia fidelis, XI, XI Claudia pia fidelis(conjecture; Legio XI(epigraphically attested
8. **Office_and_Certainty**
* This column records the first listed office of the servicemen, if there is one recorded, as well as the certainty of this office being ascribed to them, which is placed after the office inside a '('. These two types of data are taken from data/MilitaryStatus.FirstRecordedOffice and data/MilitaryStatus.FirstOfficeCertainty.
* Values: _null_; centurio(likely; centurio(specified; eques(likely; eques(specified; imaginifer(specified; miles(specified; primus pilus(specified; princeps posterior(specified; scriba(specified; signifer(specified; tribunus(likely
9. **Other_Office_and_certainty**
* This column records the second listed office of the servicemen, if there is one recorded, as well as the certainty of this office being ascribed to them, which is placed after the office inside a '('. These two types of data are taken from data/MilitaryStatus.SecondRecordedOffice and data/MilitaryStatus.SecondOfficeCertainty.
* Values: _null_; exacto consularis(specified; iudex(specified; praefectus castorum(specified
10. **Veteran_Status_and_Certainty**
* This column records the veteran status of the servicemen, if there is one recorded, as well as the certainty of this status being ascribed to them, which is placed after the office inside a '('. These two types of data are taken from data/MilitaryStatus.VeteranStatus and data/MilitaryStatus.Veteran_Status_and_Certainty.
* Values: _null_; veteran(conjecture; veteran(likely; veteran(specified
11. **ServicemanNote**
* This column records any extra information regarding the serviceman and anything to do with their status as a serviceman, their unit attribution,  possible double ups in terms of identification, and the rationale for their inclusion in this table if not clear. This column and its values reference data/LegioServicemen.ServicemanNote
* Values: This column has 38 distinct values including _null_. These notes consist of paragraphs or sentences.
