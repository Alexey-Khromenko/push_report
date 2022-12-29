select
	             tld.date,
	             tld.last_src,
	             dc.category_2_name as category_2_name,
	             sum(tld.revenue_fact) as revenue_fact,
	             sum(tld.ho_clicks_line) as ho_clicks,
				 sum(tld.ho_conversions_line) as ho_conversions,
	             sum(tld.ho_issued_line) as ho_issued
	       from leadgen.t_leadgen_data tld 
	       left join ho.d_categories dc
	             on dc.id = tld.offer_category_id
	       where 1=1
	             and tld.last_src_type = 'mobile_push'
	             and tld.date >= date_trunc('month',current_date)::timestamp - '2 mons'::interval
	       group by 1,2,3