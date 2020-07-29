SELECT MonumentID as 'Monument', CorpusName ||', '|| Reference as Reference, Name, MonumentType, militarystatus, Office as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'CPF'
	FROM Monument JOIN FindSpot USING (FindSpotID)
				  JOIN LegioServicemen USING (MonumentID)
				  JOIN MonumentCorpus USING (MonumentID)
				  LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
        			 FROM MonumentMilitaryOffice
        			 WHERE MonumentID = MonumentID
        			 GROUP BY MonumentID) as Officetable USING (MonumentID)
 WHERE province = 'Dalmatia'
	 AND isPrimaryReference = '1'
	 AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar');
