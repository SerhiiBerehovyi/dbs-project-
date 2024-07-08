select distinct 
	aq.*
from 
	aol_query as aq
	
join 
	search_term as st 
	on aq.text like '% ' || st.text || ' %'
    or aq.text like st.text || ' %'
    or aq.text like '% ' || st.text
    or aq.text = st.text
join 
	search_term_organisation as sto 
	on st.id = sto.search_term_id
join 
	organisation as org 
	on sto.organisation_id = org.id
	
where 
	org.in_film = TRUE;