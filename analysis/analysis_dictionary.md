# Dictionary for /analysis tables

## Overview

**5** csv tables have been generated as a form of analysis via the *DB Browser for SQLite* 'view' function. It is important to note that **NOT** all columns from the /data tables feature in these views. Instead, they represent *some* of the types of queries/analyses which can be made through this data.

## The Tables

The **5** analysis tables and their columns are:
1. All_Servicemen.csv
  * ServicemanID
  * Monument
  * Nomina
  * Tribus
  * Domicilium
  * Serviceman?
  * Unit Afilliation and Certainty
  * Office and Certainty
  * Other Office if specified
  * Veteran Status and Certainty
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
SELECT
	LegioServicemen.ServicemanID,
	Monument,
	Name AS 'Nomina',
	Tribe AS 'Tribus',
	OriginSettlement ||', '|| (coalesce(OriginProvince, ' ')) AS 'Domicilium',
	DefiniteServiceman AS 'Serviceman?',
	Units.UnitTitle ||'('|| LegioServicemen.LiklihoodOfUnitAttribution AS 'Unit Afilliation and Certainty',
	FirstRecordedOffice ||'('|| FirstOfficeCertainty AS 'Office and Certainty',
	SecondRecordedOffice ||'('|| SecondOfficeCertainty AS 'Other Office if specified',
	VeteranStatus ||'('|| VeteranStatusCertainty AS 'Veteran Status and Certainty',
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
* This is the column where the ID number for each individual serviceman referenced in the corpus is listed. It is the PrimaryKey from the data/LegioServicemen table. The view/table is ordered by this column. It is ordered firstly by whether or not the serviceman is definitely or likely a serviceman (e.g. epigraphically attested or conjecture), and then is ordered by ServicemanID.
* Distinct Values:
2. **Monument**
* This is the ID number for each monument that the serviceman is referenced upon. As such there can be multiple entries in this Monument column for each ServicemanID. This is the PrimaryKey from the data/Monument table
* Distinct Values:
3. **Nomina**
* This is a column where there is an English translation of the name of the serviceman, inclduing a paternal relation, if offered (e.g. 'Marcus, son of Julius'). If name data is not able to be fully reconstructed, it is left in the original Latin in the inscription. This references the 'Name' column in data/LegioServicemen table.
* Distinct Values:
4. **Tribus**
* Here the Roman tribe or 'tribus' of the recorded serviceman is recorded if available. References 'Tribe' column from data/LegioServicemen table.
* Distinct Values: _null_; Aemilia; Aniensis; Camilia; Claudia; Cornelia; Fabia; Lemonia; Maecia; Palatina; Papiria; Pollia; Pomptina; Publilia; Quirina; Scaptia; Sergia; Tromentia; Velina; Voltinia.
5. **Domicilium**
* This column records the domicilium, or city of origin, of the serviceman and the Roman province of this settlement. It references both the 'OriginSettlement' and 'OriginProvince' columns in data/LegioServicemen table.
* Distinct Values: _null_, _null_; Aesis, Galatia; Alorum, Macedonia; Amblada, Galatia; Ancyra, Galatia; Arretium, Italy; Augusta Troas, Asia; Augusta,  _null_; Beneventum, Italy; Bononia, Italy; Brixia, Italy; Clistinna, Galatia; Conana, Galatia; Cormassa, Galatia; Cremona, Italy; Dentum, Macedonia; Dyrrachium, Macedonia; Edessa, Macedonia; Florentia, Italy; Forum Corneli, Italy; Heraclea,  _null_; Iconium, Galatia; Isinda, Galatia; Laranda, Galatia; Libarna, Italy; Milyas, Galatia; Ninica, Galatia; Pessinus, Galatia; Phazimon, Galatia; Philippi, Macedonia; Pisaurum, Italy; Placentia, Italy; R[---],  _null_; Sebaste, Galatia; Sebastopolis, Galatia; Sinope, Galatia; Ticinum, Italy; Trernahensis,  _null_; Varvaria, Dalmatia; Verona, Italy; Vienna, Gallia Narbonensis.
6. **Serviceman?**
* Values:
7. **Unit Afilliation and Certainty**
* Values:
8. **Office and Certainty**
* Values:
9. **Other Office if specified**
* Values:
10. **Veteran Status and Certainty**
* Values:
11. **ServicemanNote**
* Values:
