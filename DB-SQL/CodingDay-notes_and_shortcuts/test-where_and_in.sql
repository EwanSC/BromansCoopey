-- all salination readings by lake or roe

select reading, person
from Survey
where quant = 'sal'
and (person = 'lake' or person = 'roe');

select quant, reading, person
from Survey
where quant = 'sal'
and person in ('lake', 'roe');
