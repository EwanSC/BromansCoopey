select person, count(reading), min(reading), max(reading)
from Survey
where quant = 'rad'
group by person;