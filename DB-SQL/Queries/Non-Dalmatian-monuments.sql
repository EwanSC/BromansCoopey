select MonumentID, MonumentType as 'Monument type', Province, Settlement as 'site', SpecificLocation as 'Location note', CPFTitle as 'Claudia Pia Fidelis?'
From Monument join FindSpot on (FindSpot.FindSpotID = Monument.FindSpotID)
Where Province is not 'Dalmatia';
