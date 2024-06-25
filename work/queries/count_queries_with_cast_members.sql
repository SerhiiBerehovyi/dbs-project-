select fc.name, count(q.text) as cnt
	
from 
	aol_query as q

join
	film_cast as fc 
on
	q.text LIKE '%' || lower(fc.name) || '%'

group by 
	fc.name

--LIMIT 50