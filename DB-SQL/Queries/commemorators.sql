SELECT Monument.MonumentID, PrimaryCorpus.corpus, MonumentType, Tončinić
FROM Monument 
JOIN PrimaryCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
JOIN AllCorpora USING (MonumentID)
WHERE MemberSeventhLegion = 'yes'
AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar')
AND Province = 'Dalmatia'
ORDER BY corpus
;