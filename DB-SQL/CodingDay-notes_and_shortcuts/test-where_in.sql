-- all survery records taken by lake or roe
select *
from survey
where person in ('lake', 'roe');
