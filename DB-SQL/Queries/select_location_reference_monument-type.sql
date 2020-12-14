Select MonumentID, MonumentCorpus.CorpusName, MonumentCorpus.Reference, monument.MonumentType, FindSpot.Settlement, FindSpot.SpecificLocation
From Monument 
join MonumentCorpus using (MonumentID)
join FindSpot using (FindSpotID)
where isPrimaryReference = '1';