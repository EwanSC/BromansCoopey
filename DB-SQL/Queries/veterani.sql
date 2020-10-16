SELECT CorpusName ||' '|| Reference AS Reference, CPFTitle, ReferencedAs, MilitaryStatus, MonumentID, ServicemanID, Tončinić, name
FROM Monument
JOIN LegioServicemen USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
JOIN MonumentCorpus USING (MonumentID)
JOIN AllCorpora USING (MonumentID)
WHERE DefiniteServiceman = 'yes'
AND MemberSeventhLegion = 'yes'
AND (MilitaryStatus = 'veteran' OR MilitaryStatus = '?veteran')
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
AND Province = 'Dalmatia'
AND isPrimaryReference IS NOT NULL
ORDER BY MilitaryStatus DESC, CPFTitle, CorpusName, Reference