-- write me a query that lists all radiation readings from DR-1 site

select *
from survey
where quant = 'rad';

select *
from Visited
where site = 'DR-1';

select survey.reading as "Radiation Readin"
from survey 
join visited on (survey.taken = visited.id)
where quant = 'rad'
and visited.site = 'DR-1';