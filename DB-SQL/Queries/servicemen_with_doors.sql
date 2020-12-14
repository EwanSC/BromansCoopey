SELECT DISTINCT CorpusName ||', '|| Reference AS 'Reference', MonumentID, ServicemanID, ReferencedAs, MilitaryStatus, Tribe, OriginProvince, DoorMotifPresent, MemberSeventhLegion, CPFTitle
FROM LegioServicemen
JOIN Monument USING (MonumentID)
JOIN MonumentCorpus USING (MonumentID)
WHERE DoorMotifPresent = 'doors'
AND (MemberSeventhLegion = 'yes' or MemberSeventhLegion = 'maybe')
AND (ReferencedAs = 'commemorated' or ReferencedAs = 'both' or ReferencedAs IS NULL)
AND isPrimaryReference = '1'
ORDER BY OriginProvince