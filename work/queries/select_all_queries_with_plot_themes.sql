select
	*
from 
	aol_query as aq
join 
	plot_theme as pt 
	on aq.text like '%' || lower(pt.name) || '%'

group by 
	aq.id, pt.id