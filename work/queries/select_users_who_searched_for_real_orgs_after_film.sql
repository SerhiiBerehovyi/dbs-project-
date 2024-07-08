with UsersWhoSearchedForOrgsInFilm as (
    select 
		aq.user_id, 
		min(aq.timestamp) as first_search
    from 
		aol_query as aq
    join 
		search_term as st 
		on aq.text like '% ' || st.text || ' %'
        or aq.text like st.text || ' %'
        or aq.text like '% ' || st.text
        or aq.text = st.text
    join search_term_organisation as sto 
		on st.id = sto.search_term_id
    join organisation as org 
		on sto.organisation_id = org.id
    where 
		org.in_film = TRUE
    group by 
		aq.user_id
),
UsersWhoSearchedForOrgsNotInFilm as (
    select 
		aq.user_id, 
		min(aq.timestamp) as first_search
    from 
		aol_query as aq
    join 
		search_term as st on aq.text like '% ' || st.text || ' %'
        or aq.text like st.text || ' %'
        or aq.text like '% ' || st.text
        or aq.text = st.text
    join 
		search_term_organisation as sto 
		on st.id = sto.search_term_id
    join organisation org 
		on sto.organisation_id = org.id
    where 
		org.in_film = FALSE
    group by 
		aq.user_id
)
	
select 
	oif.user_id
from 
	UsersWhoSearchedForOrgsInFilm as oif
join 
	UsersWhoSearchedForOrgsNotInFilm as onif 
	on oif.user_id = onif.user_id
where 
	oif.first_search < onif.first_search;

