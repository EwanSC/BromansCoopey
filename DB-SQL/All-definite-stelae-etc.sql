Select CorpusName ||' '|| Reference as 'Reference', MonumentType
from Monument 
join MonumentCorpus using (monumentID)
join FindSpot using (FindSpotID)
Where (MonumentType = 'inscription fragment'
or    MonumentType = 'stela'
or    MonumentType = 'funerary inscription'
or    MonumentType = 'altar')
and   MemberSeventhLegion = 'yes'
and   isPrimaryReference = '1'
and   Province = 'Dalmatia'
order by MonumentType;
