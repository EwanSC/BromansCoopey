SELECT Tončinić, CIL, AE, ILJug, Betz, OtherRef, EDH
FROM AllCorpora
JOIN Monument USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE MemberSeventhLegion = 'maybe' or MemberSeventhLegion = 'yes'
AND Province = 'Dalmatia'
ORDER BY Tončinić