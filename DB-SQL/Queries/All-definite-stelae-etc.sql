Select MonumentID, CorpusName ||' '|| Reference as 'Reference', MonumentType, Inscription
from Monument 
join MonumentCorpus using (monumentID)
join FindSpot using (FindSpotID)
Where (MonumentType = 'inscription fragment'
or    MonumentType = 'stela'
or    MonumentType = 'funerary inscription'
or    MonumentType = 'altar'
or    MonumentType = 'sacral monument'
or    MonumentType = 'titulus')
and   MemberSeventhLegion = 'yes'
and   isPrimaryReference = '1'
and   Province = 'Dalmatia'
and not MonumentID = 102
and not MonumentID = 63
order by MonumentType;
