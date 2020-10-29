SELECT (Province ||', '|| coalesce(Settlement, '')) AS 'Site', COUNT (*) AS 'Number of Monuments', SUM(COUNT(Province)) OVER() AS Total
FROM FindSpot
JOIN Monument USING (FindSpotID) 
WHERE Province = 'Dalmatia'
AND (MemberSeventhLegion = 'maybe' or MemberSeventhLegion = 'yes')
AND MonumentType IS NOT 'tegula' 
AND MonumentType IS NOT 'boundary inscription' 
AND MonumentType IS NOT 'construction dedication'
AND MonumentType IS NOT 'sacral monument'
AND MonumentType IS NOT 'sacral altar'
GROUP BY Settlement
