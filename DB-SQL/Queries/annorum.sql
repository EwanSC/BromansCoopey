SELECT MonumentID, CorpusName ||' '|| Reference AS Reference, Inscription, MemberSeventhLegion, Tončinić, Settlement
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
JOIN AllCorpora USING (MonumentID)
WHERE (isPrimaryReference = '1')
AND (REPLACE(REPLACE(REPLACE(REPLACE(Inscription, '(', ''), ')', ''), '[', ''), ']', '') LIKE '%annorum%' OR Inscription LIKE '%ann{i}or(um)%' OR Inscription LIKE '%ann(os)%')
AND (MemberSeventhLegion = 'yes' or MemberSeventhLegion = 'maybe')
AND Province = 'Dalmatia'
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
ORDER BY MemberSeventhLegion DESC, CorpusName, Reference