SELECT Monument.MonumentID, MonumentCorpus.CorpusName ||', '|| MonumentCorpus.Reference AS Reference, Monument.Inscription, MonumentType, StelaeType, DateFrom, DateTo, Monument.MemberSeventhLegion, Monument.CPFTitle, FindSpot.Settlement, FindSpot.ExtraInfo, Monument.Note
FROM Monument
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE Settlement = 'Salona'
AND isPrimaryReference IS NOT NULL
AND (Monument.MonumentType = 'altar'
OR Monument.MonumentType = 'stela'
OR Monument.MonumentType = 'inscription fragment'
OR Monument.MonumentType = 'funerary inscription'
OR Monument.MonumentType = 'sacral monument'
OR Monument.MonumentType = 'titulus')
AND (MemberSeventhLegion = 'yes'
OR MemberSeventhLegion = 'maybe')
ORDER BY ExtraInfo;