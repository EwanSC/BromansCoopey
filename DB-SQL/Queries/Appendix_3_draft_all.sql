SELECT (Province ||', '|| coalesce(Settlement, '')) AS 'Site', COUNT (*) AS 'Number of Monuments', SUM(COUNT(Settlement)) OVER() AS Total
FROM FindSpot
JOIN Monument USING (FindSpotID) 
WHERE Province = 'Dalmatia'
AND (MemberSeventhLegion = 'yes'
OR MemberSeventhLegion = 'maybe')
AND (MonumentType = 'stela'
OR MonumentType = 'titulus'
OR MonumentType = 'funerary inscription'
OR MonumentType = 'altar'
OR MonumentType = 'sacral inscription'
OR MonumentType = 'inscription fragment')
GROUP BY Settlement
