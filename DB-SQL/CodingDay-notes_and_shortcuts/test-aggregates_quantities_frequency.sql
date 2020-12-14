select quant, count(reading), min(reading), max(reading)
from Survey
where quant = 'sal';