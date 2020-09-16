SELECT Tončinić, CIL, AE, ILJug, Betz, OtherRef, EDH
FROM AllCorpora
JOIN Monument USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE MemberSeventhLegion = 'maybe'
AND Province = 'Dalmatia'
ORDER BY Tončinić