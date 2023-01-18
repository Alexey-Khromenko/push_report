select
	       coalesce(mps.create_ts::date, tld.date) as create_ts,
	       coalesce(mps.source, tld.last_src) as last_src,
	       mps.title,
	       mps.template_text,
	       mps.msg_sent_cnt,
	       tld.category_2_name,
	       tld.revenue_fact,
	       tld.ho_clicks,
		   tld.ho_conversions,
	       tld.ho_issued
	from {{ ref('v_mob_push_report_msg_sent')}} mps
	full outer join {{ ref('v_mob_push_report_leadgen')}} tld
	       on tld.last_src = mps.source
