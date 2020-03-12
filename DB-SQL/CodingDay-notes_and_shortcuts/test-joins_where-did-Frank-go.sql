-- all sites visited be people named frank and their longitude (and which Frank [and add other Frank who did nothing])

select distinct visited.site, site.lat, site.long, person.personal, person.family
from visited
join survey on (visited.id = survey.taken)
join person on (survey.person = person.id)
join site on (visited.site = site.name)
where person.personal = 'Frank';

