-- site lat, long, date. Survery quant and reading

select person.personal || ' ' || person.family as fullname
	 , Site.long
	 , Site.lat
	 , Visited.dated
	 , survey.quant as quantity
	 , survey.reading
from visited 
join site on (site.name = visited.site)
join survey on (survey.taken = visited.id)
join person on (person.id = survey.person);