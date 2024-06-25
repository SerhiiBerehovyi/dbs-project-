select 
	fc.name, 
	count(q.text) as cnt,
	extract(month from q.timestamp) as mm,
	extract(day from q.timestamp) as dd

from 
	aol_query as q

join
	film_cast as fc
on
	q.text LIKE '%' || lower(fc.name) || '%'

group by
	fc.name, 
	mm,
	dd

order by 
	fc.name asc,
	mm asc,
	dd asc

--LIMIT 10