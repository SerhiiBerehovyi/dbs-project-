WITH OrgsInFilm AS (
    SELECT aq.user_id, MIN(aq.timestamp) as FirstSearchForOrgInFilm
    FROM aol_query AS aq
    JOIN search_term AS st ON aq.text LIKE '% ' || st.text || ' %'
        OR aq.text LIKE st.text || ' %'
        OR aq.text LIKE '% ' || st.text
        OR aq.text = st.text
    JOIN search_term_organisation sto ON st.id = sto.search_term_id
    JOIN organisation org ON sto.organisation_id = org.id
    WHERE org.in_film = TRUE
    GROUP BY aq.user_id
),
OrgsNotInFilm AS (
    SELECT aq.user_id, MIN(aq.timestamp) as FirstSearchForOrgNotInFilm
    FROM aol_query aq
    JOIN search_term st ON aq.text LIKE '% ' || st.text || ' %'
        OR aq.text LIKE st.text || ' %'
        OR aq.text LIKE '% ' || st.text
        OR aq.text = st.text
    JOIN search_term_organisation sto ON st.id = sto.search_term_id
    JOIN organisation org ON sto.organisation_id = org.id
    WHERE org.in_film = FALSE
    GROUP BY aq.user_id
)
SELECT oif.user_id
FROM OrgsInFilm as oif
JOIN OrgsNotInFilm as onif ON oif.user_id = onif.user_id
WHERE oif.FirstSearchForOrgInFilm < onif.FirstSearchForOrgNotInFilm;