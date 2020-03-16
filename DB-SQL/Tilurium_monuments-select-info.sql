SELECT MonumentID, MonumentType, SpecificLocation, MilitaryStatus, MemberSeventhLegion, CPFTitle, DateTo, DateFrom
FROM Monument JOIN FindSpot USING (FindSpotID)
WHERE Settlement = 'Tilurium'
Order by SpecificLocation;