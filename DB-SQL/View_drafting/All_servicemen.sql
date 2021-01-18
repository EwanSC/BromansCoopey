SELECT 
	ServicemanID, 
	MonumentID as 'Monument', 
	CorpusName ||' '|| Reference as 'Reference', 
	Name AS 'Nomina', 
	Tribe AS 'Tribus', 
	OriginSettlement ||', '|| (coalesce(OriginProvince, ' ')) AS 'Domicilium', 
	DefiniteServiceman AS 'Serviceman?', 
--	UnitTitle ||'('|| LiklihoodOfUnitAttribution AS 'Unit Afilliation and Certainty', 
	FirstRecordedOffice ||'('|| FirstOfficeCertainty AS 'Office and Certainty', 
	SecondRecordedOffice ||'('|| SecondOfficeCertainty AS 'Other Office if specfied', 
	VeteranStatus ||'('|| VeteranStatusCertainty AS 'Veteran Status and Certainty', 
	MonumentType,
	ServicemanNote
	FROM LegioServicemen 	
		JOIN Monument USING (MonumentID)
		JOIN MonumentCorpus USING (MonumentID)
		JOIN MilitaryStatus USING (MilitaryStatusID)
--		JOIN Units USING (UnitID)
	WHERE isPrimaryReference = '1'
--	AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar')
	ORDER BY DefiniteServiceman DESC, ServicemanID