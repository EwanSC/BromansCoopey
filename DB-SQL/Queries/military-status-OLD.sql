SELECT DISTINCT Office, MilitaryStatus
FROM LegioServicemen
JOIN (SELECT ServicemanID, group_concat(OfficeType, ' ; ') as Office
		        			 FROM MonumentMilitaryOffice
		        			 WHERE ServicemanID = ServicemanID
		        			 GROUP BY ServicemanID) as Officetable USING (ServicemanID)
	ORDER BY MilitaryStatus
	