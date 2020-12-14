SELECT CorpusName ||' '|| reference as 'Primary Reference', Inscription, MonumentType AS 'Monument Type', StelaeType AS 'Style Type', (Settlement ||', '|| coalesce(ExtraInfo, '')) AS 'Find Spot', CPFTitle AS 'Claudia Title', MemberSeventhLegion AS 'Legio VII Title'
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE (isPrimaryReference = '1')
AND (MemberSeventhLegion = 'maybe' or MemberSeventhLegion = 'yes')
AND Province = 'Dalmatia'
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
ORDER BY MemberSeventhLegion DESC, CPFTitle DESC, CorpusName, reference