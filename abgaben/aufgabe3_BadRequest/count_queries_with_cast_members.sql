select 
	fc.name, 
	count(q.text) as cnt,
	q.timestamp::date as d

from
	aol_query as q

join
	film_cast as fc
on
	q.text LIKE '%' || lower(fc.name) || '%'

group by
	fc.name,
	d

order by
	fc.name asc,
	d asc
