select 
    aol_query.user_id, 
    aol_query.timestamp, 
    aol_query.text, 
    aol_query.page_rank,
    url.url
from 
    aol_query 
left join 
    url on url.id = aol_query.url_id
-- where 
--     aol_query.user_id = 711391
order by 
    aol_query.timestamp asc;