Select MonumentID, CorpusName, Reference, OfficeType, Settlement, SpecificLocation, Inscription
From Monument 
join FindSpot using (FindSpotID)
join MonumentMilitaryOffice using (MonumentID)
join MonumentCorpus using (MonumentID)
where MilitaryStatus is null
and   Settlement is 'Salona'
and   OfficeType is not null
and isPrimaryReference is '1'
order by CorpusName
