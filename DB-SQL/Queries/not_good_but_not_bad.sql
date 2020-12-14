Select MonumentID, MonumentType, Office, MilitaryStatus, MemberSeventhLegion, CPFTitle, Inscription
FROM monument
JOIN FindSpot USING (FindSpotID)
JOIN LegioServicemen USING (MonumentID)
JOIN MonumentMilitaryOffice USING (MonumentID)
 LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
		        			 FROM MonumentMilitaryOffice
		        			 WHERE MonumentID = MonumentID
		        			 GROUP BY MonumentID) as Officetable USING (MonumentID)
WHERE MemberSeventhLegion = 'yes'
AND (MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType iS NOT 'construction dedication'
AND MonumentType iS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar')
AND Province = 'Dalmatia'
ORDER BY MilitaryStatus, Office