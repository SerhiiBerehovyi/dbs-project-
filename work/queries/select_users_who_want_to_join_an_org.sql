select 
	q.*
from 
	complete_queries as q
join 
	search_term as st 
	on q.text like '% ' || st.text || ' %'
    or q.text like st.text || ' %'
    or q.text like '% ' || st.text
    or q.text = st.text
join 
	search_term_organisation as sto 
	on st.id = sto.search_term_id
join 
	organisation as org 
	on sto.organisation_id = org.id

where 
	q.text like '%' || 'join' || '%'
	or q.text like '%' || 'member' || '%'