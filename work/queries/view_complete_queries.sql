create view complete_queries as

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
order by 
    aol_query.timestamp asc;