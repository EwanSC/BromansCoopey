SELECT CorpusName ||' '|| reference as 'Primary Reference', Inscription, MonumentType AS 'Monument Type', (Settlement ||', '|| coalesce(ExtraInfo, '')) AS FindSpot 
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE isPrimaryReference = '1'
AND MemberSeventhLegion = 'maybe'
AND Province = 'Dalmatia'
ORDER BY Reference