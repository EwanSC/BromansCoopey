-- fix this query - find all sites that lie wihtin 48 degrees of equator

select * 
from site 
where(lat > -48) and (lat < 48);
