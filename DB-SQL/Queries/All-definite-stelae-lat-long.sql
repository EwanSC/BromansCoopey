select CorpusName ||' '|| Reference as 'Reference', Settlement, ExtraInfo, LAT, LONG
from Monument 
join FindSpot using (FindSpotID)
join MonumentCorpus using (MonumentID)
where Province = 'Dalmatia'
and MemberSeventhLegion = 'yes'
and isPrimaryReference = '1'
and (MonumentType = 'altar'
or MonumentType = 'stela'
or MonumentType = 'inscription fragment'
or MonumentType = 'funerary inscription'
or MonumentType = 'sacral monument'
or MonumentType = 'titulus')
order by Settlement;