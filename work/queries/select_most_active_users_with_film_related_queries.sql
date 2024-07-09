with FilmRelatedQueries as (
    select 
		aq.user_id, aq.id
    from 
		aol_query aq
    join plot_theme as pt 
		on aq.text like '%' || lower(pt.name) || '%'
),

UsersWithFilmRelatedQueries as (
    select distinct 
		user_id
    from 
		FilmRelatedQueries
),

TotalQueriesCount as (
    select 
		user_id, 
		count(*) as total_queries
    from 
		aol_query
    where 
		user_id in 
			(select user_id from UsersWithFilmRelatedQueries)
    group by 
		user_id
),

FilmRelatedQueriesCount as (
    select 
		user_id, 
		count(*) as film_queries
    from 
		FilmRelatedQueries
    group by 
		user_id
)

select * from (
	select 
		related_cnt.user_id,
		cast(related_cnt.film_queries as FLOAT) / total_count.total_queries as proportion
	from 
		TotalQueriesCount as total_count
	join 
		FilmRelatedQueriesCount as related_cnt 
		on total_count.user_id = related_cnt.user_id
	) as results
where
	proportion > '0.1'
order by
	proportion desc;