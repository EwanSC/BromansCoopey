SELECT MonumentID, MilitaryStatus, Office
  FROM (SELECT MonumentID, MilitaryStatus
          FROM LegioServicemen)
  LEFT OUTER JOIN (SELECT MonumentID, group_concat(OfficeType, ' ; ') as Office
        			 FROM MonumentMilitaryOffice
        			 WHERE MonumentID = MonumentID
        			 GROUP BY MonumentID) as Officetable USING (MonumentID)