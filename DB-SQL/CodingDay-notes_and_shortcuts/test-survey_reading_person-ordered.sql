-- who took what kinds of readings (specified by quant)? ordered by person and then quant

Select DISTINCT quant, person, reading
From Survey
Order by person, quant, reading;