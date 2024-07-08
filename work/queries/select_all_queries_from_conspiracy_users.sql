select 
	aq.*
from 
	aol_query as aq
	
join 
	search_term as st 
	on aq.text like '%' || st.text || '%'
join 
	search_term_organisation as sto 
	on st.id = sto.search_term_id
join organisation as org 
	on sto.organisation_id = org.id
	
where 
	aq.user_id in (20753228, 21299479, 694246, 1609874, 1754281)

order by 
	aq.user_id, aq.timestamp;