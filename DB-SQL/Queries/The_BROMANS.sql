SELECT DISTINCT Monument.MonumentID, PrimaryCorpus.corpus, Inscription, MonumentType, FindSpot.Settlement, DateFrom, DateTo
FROM Monument
JOIN PrimaryCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE Inscription LIKE '%frat%'
AND MemberSeventhLegion IS NOT 'no';