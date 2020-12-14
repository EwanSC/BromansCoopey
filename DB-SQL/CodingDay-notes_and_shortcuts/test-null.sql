-- which survey number and site name do we not know the date it was taken for?

select visited.id, visited.site
from visited
where dated is null;