Select *
FROM monument
JOIN FindSpot USING (FindSpotID)
WHERE (MemberSeventhLegion = 'yes' or MemberSeventhLegion = 'maybe')
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType iS NOT 'construction dedication'
AND MonumentType iS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
AND Province = 'Dalmatia'
ORDER BY MonumentType