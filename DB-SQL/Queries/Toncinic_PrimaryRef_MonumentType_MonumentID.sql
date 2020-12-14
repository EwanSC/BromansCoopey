SELECT Tončinić, MonumentID, Reference, MonumentType
FROM monument
JOIN TončinićPrimaryReference USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE Province = 'Dalmatia'
AND MemberSeventhLegion = 'yes'
AND NOT MonumentType = 'tegula'
AND NOT MonumentType = 'boundary inscription'
AND NOT MonumentType =  'construction dedication'
ORDER BY Tončinić;