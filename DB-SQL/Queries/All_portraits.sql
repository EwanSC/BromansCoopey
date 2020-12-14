SELECT DISTINCT Monument.MonumentID, CorpusName ||', '|| Reference as Reference, Tončinić, Settlement,ExtraInfo, CPFTitle, MilitaryStatus, Inscription, DoorMotifPresent, PortraitPresent, WeaponsPresent, StelaeType
FROM Monument
JOIN AllCorpora USING (MonumentID)
JOIN MonumentCorpus USING (MonumentID)
JOIN FindSpot USING (FindSpotID)
JOIN LegioServicemen USING (MonumentID)
WHERE PortraitPresent = 'portrait'
AND isPrimaryReference IS NOT NULL