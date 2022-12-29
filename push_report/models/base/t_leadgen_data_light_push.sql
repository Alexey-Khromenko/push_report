select
	             tld.date,
	             tld.last_src,
	             string_agg(tld.category_2_name,'>' order by revenue_fact desc ) as category_2_name,
	             sum(tld.revenue_fact) as revenue_fact,
	             sum(tld.ho_clicks) as ho_clicks,
	             sum(tld.ho_issued) as ho_issued
	       from {{ref('pre_t_leadgen_data_push')}} tld
	       group by 1,2