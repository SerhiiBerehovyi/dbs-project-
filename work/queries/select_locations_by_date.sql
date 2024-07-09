select 
	loc.name, 
	count(q.text) as cnt,
	q.timestamp::date as d

from
	complete_queries as q

join
	location as loc
on
	q.text LIKE '%' || lower(loc.name) || '%'

group by
	q.user_id,
	loc.name,
	d

order by
	loc.name asc,
	d asc
