--{{ config(materialized='table') }}
select
	       coalesce(mps.create_ts::date, tld.date) as create_ts,
	       coalesce(mps.source, tld.last_src) as last_src,
	       mps.title,
	       mps.template_text,
	       sum(mps.msg_sent_cnt) as msg_sent_count,
	       max(category_2_name),
	       max(revenue_fact),
	       max(ho_clicks),
	       max(ho_issued)
	from {{ ref('mob_push_msg_sent')}} mps
	full outer join {{ ref('t_leadgen_data_light_push')}} tld
	       on tld.last_src = mps.source
	       and tld.date::date = mps.create_ts::date
	group by
	       coalesce(mps.create_ts::date, tld.date),
	       coalesce(mps.source, tld.last_src),
	       mps.title,
	       mps.template_text