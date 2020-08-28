SELECT Monument.MonumentID, CorpusName ||', '|| Reference as Reference, Tončinić, Settlement, MemberSeventhLegion, CPFTitle, Inscription, DoorMotifPresent, PortraitPresent, WeaponsPresent, StelaeType
FROM Monument
JOIN AllCorpora USING (MonumentID)
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
WHERE DoorMotifPresent = 'doors'
AND MemberSeventhLegion IS NOT 'No'
AND isPrimaryReference IS NOT NULL
ORDER BY MemberSeventhLegion