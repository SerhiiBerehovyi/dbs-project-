select
	loc.name,
	count(*) as location_count
from 
	complete_queries as q
join 
	location as loc
	on q.text like '%' || lower(loc.name) || '%'
group by 
	loc.id
order by
	location_count desc