SELECT MonumentID, CorpusName ||' '|| Reference AS Reference, Inscription, Settlement, CPFTitle, MemberSeventhLegion, Tončinić
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
JOIN AllCorpora USING (MonumentID)
WHERE (isPrimaryReference = '1')
AND (MemberSeventhLegion = 'yes' OR MemberSeventhLegion = 'maybe')
AND Province = 'Dalmatia'
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
AND (REPLACE(REPLACE(REPLACE(REPLACE(Inscription, '(', ''), ')', ''), '[', ''), ']', '') LIKE '%stipendi%' OR Inscription LIKE '%stip(endorium%' OR Inscription LIKE '%annorum%' OR Inscription LIKE '%ann{i}or(um)%' OR Inscription LIKE '%ann(os)%')
ORDER BY MemberSeventhLegion DESC, Settlement, CPftitle, CorpusName, Reference