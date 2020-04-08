select CorpusName ||' '|| Reference as 'Reference', MonumentType as 'Monument Type', SpecificLocation as 'Site', Settlement as 'Ancient Settlement', Province
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
or MonumentType = 'sacral monument')
order by Settlement;
