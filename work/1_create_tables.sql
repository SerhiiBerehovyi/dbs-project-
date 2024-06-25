BEGIN;

INSERT INTO url (url)
SELECT DISTINCT click_url
FROM queries
WHERE click_url IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO aol_query (user_id, timestamp, text, page_rank, url_id)
SELECT q.userid, q.querytime, q.searchquery, q.itemrank, u.id
FROM queries AS q
LEFT JOIN url AS u ON q.click_url = u.url;  -- left join to also insert NULL urls

COMMIT;