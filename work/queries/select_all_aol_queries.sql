SELECT 
    aol_query.user_id, 
    aol_query.timestamp, 
    aol_query.text, 
    aol_query.page_rank,
    url.url
FROM 
    aol_query 
LEFT JOIN 
    url ON url.id = aol_query.url_id
-- WHERE 
--     aol_query.user_id = 711391
ORDER BY 
    aol_query.timestamp ASC;