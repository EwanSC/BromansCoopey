CREATE VIEW "LegionaryDetailsDalmatia" AS SELECT MonumentID as 'Monument', CorpusName as 'Primary', Reference, MonumentType, militarystatus, OfficeType as 'Active Office', MemberSeventhLegion as 'Member of Legio VII', CPFTitle as 'CPF title'
FROM Monument JOIN FindSpot USING (FindSpotID)
              JOIN MonumentMilitaryOffice USING (monumentid)
			  JOIN MonumentCorpus USING (MonumentID)
WHERE province = 'Dalmatia' 
  AND isPrimaryReference = '1' 
  AND (MonumentType = 'stela' or MonumentType = 'funerary inscription' or MonumentType = 'titulus' or MonumentType = 'inscription fragment' or MonumentType = 'sacral monument' or MonumentType = 'altar')