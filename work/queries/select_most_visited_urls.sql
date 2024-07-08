select
	u.url,
	count(u.url) as url_count
from 
	aol_query as aq
	
join 
	plot_theme as pt 
	on aq.text like '%' || lower(pt.name) || '%'
join
	url as u
	on aq.url_id = u.id
	
group by 
	u.url
order by
	url_count desc