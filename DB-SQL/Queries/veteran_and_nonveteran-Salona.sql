Select MonumentID, PrimaryReferenceTypeLocation.CorpusName ||', '|| PrimaryReferenceTypeLocation.Reference as 'Reference', Monument.MonumentType, Settlement, SpecificLocation, MilitaryStatus, OfficeType, Inscription
from PrimaryReferenceTypeLocation
join Monument using (MonumentID)
join MonumentMilitaryOffice using (MonumentID)
Where Settlement = 'Salona'
and (Monument.MonumentType = 'altar'
or Monument.MonumentType = 'stela'
or Monument.MonumentType = 'inscription fragment'
or Monument.MonumentType = 'funerary inscription'
or Monument.MonumentType = 'sacral monument'
or Monument.MonumentType = 'titulus')
and MemberSeventhLegion = 'yes';