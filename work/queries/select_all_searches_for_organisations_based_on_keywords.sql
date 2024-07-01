SELECT DISTINCT aq.*
FROM aol_query AS aq
JOIN search_term AS st ON aq.text LIKE '% ' || st.text || ' %'
    OR aq.text LIKE st.text || ' %'
    OR aq.text LIKE '% ' || st.text
    OR aq.text = st.text
JOIN search_term_organisation AS sto ON st.id = sto.search_term_id
JOIN organisation AS org ON sto.organisation_id = org.id
WHERE org.in_film = TRUE;