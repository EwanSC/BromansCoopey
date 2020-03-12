-- give us all 'people' first name (in reverse order) and last name ordered by first name, and last name in ascending
select personal, family
From person
Order by personal DESC, family;
