SELECT Tončinić, CIL, AE, ILJug, Betz, OtherRef, EDH
FROM AllCorpora
JOIN Monument USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE (MemberSeventhLegion = 'maybe' or MemberSeventhLegion = 'yes')
AND Province = 'Dalmatia'
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar' 
ORDER BY Tončinić