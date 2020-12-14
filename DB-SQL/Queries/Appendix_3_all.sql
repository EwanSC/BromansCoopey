SELECT CorpusName ||' '|| reference as 'Primary Reference', Inscription, MonumentType AS 'Monument Type', (Settlement ||', '|| coalesce(ExtraInfo, '')) AS 'Find Spot', CPFTitle AS 'Claudia Title', MemberSeventhLegion AS 'Title'
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE (isPrimaryReference = '1')
AND (MemberSeventhLegion = 'maybe' or MemberSeventhLegion = 'yes')
AND Province = 'Dalmatia'
AND (MonumentType = 'tegula' 
OR MonumentType = 'boundary inscription' 
OR MonumentType = 'construction dedication'
OR MonumentType = 'sacral monument'
OR MonumentType = 'sacral altar')
ORDER BY MemberSeventhLegion DESC, MonumentType, CPFTitle DESC, CorpusName, reference