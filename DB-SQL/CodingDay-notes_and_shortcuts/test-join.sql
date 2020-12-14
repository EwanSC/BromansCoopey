-- The lattitude and longitutde and date of all sites visits

select *
from site join visited on (site.name = visited.site);

select* 
from person join survey on (person.id = survey.person);