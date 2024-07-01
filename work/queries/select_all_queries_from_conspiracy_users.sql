SELECT aq.*
FROM aol_query AS aq
JOIN search_term AS st ON aq.text LIKE '%' || st.text || '%'
JOIN search_term_organisation AS sto ON st.id = sto.search_term_id
JOIN organisation AS org ON sto.organisation_id = org.id
WHERE aq.user_id IN (20753228, 21299479, 694246, 1609874, 1754281)
ORDER BY aq.user_id, aq.timestamp;