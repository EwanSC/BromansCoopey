SELECT DISTINCT LegioServicemen.ServicemanID, LegioServicemen.MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference AS Reference, LegioServicemen.Name, LegioServicemen.DefiniteServiceman, Monument.MemberSeventhLegion, Monument.CPFTitle, MonumentMilitaryOffice.OfficeType, LegioServicemen.MilitaryStatus, Tribe, OriginSettlement, OriginProvince
FROM LegioServicemen
JOIN MonumentMilitaryOffice USING (MonumentID)
JOIN MonumentCorpus USING (MonumentID)
JOIN Monument USING (MonumentID)
WHERE IsPrimaryReference IS NOT NULL
ORDER BY OfficeType DESC;