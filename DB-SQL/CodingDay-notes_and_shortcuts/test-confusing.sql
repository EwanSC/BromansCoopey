-- how many readings has each frank taken?

select personal, count(*)
from survey
join person on (survey.person = person.id)
where person.personal = 'Frank';

select id, personal, family, count(reading)
from person
left outer join survey on (person.id = survey.person)
where personal = 'Frank'
group by id, personal, family;