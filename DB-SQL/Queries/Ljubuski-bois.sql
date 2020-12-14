SELECT MonumentID, CorpusName ||', '|| Reference as 'Reference', Tončinić, Inscription, Settlement, ExtraInfo, MonumentType, DoorMotifPresent, WeaponsPresent, PortraitPresent
FROM Monument
JOIN FindSpot USING (FindspotId)
JOIN MonumentCorpus USING (MonumentID)
JOIN AllCorpora USING (MonumentID)
WHERE Settlement = 'Pagus Scunasticus/Bigeste'
AND isPrimaryReference IS NOT NULL