
  create view "dwh"."public"."v_mob_push_report__dbt_tmp" as (
    select
	       coalesce(mps.create_ts::date, tld.date) as create_ts,
	       coalesce(mps.source, tld.last_src) as last_src,
	       mps.title,
	       mps.template_text,
	       sum(mps.msg_sent_cnt) as msg_sent_count,
	       max(category_2_name) as category_2_name,
	       max(revenue_fact) as revenue_fact,
	       max(ho_clicks) as ho_clicks,
		   max(ho_conversions) as ho_conversions,
	       max(ho_issued) as ho_issued
	from "dwh"."public"."v_mob_push_report_msg_sent" mps
	left outer join "dwh"."public"."v_mob_push_report_leadgen" tld
	       on tld.last_src = mps.source
	group by
	       coalesce(mps.create_ts::date, tld.date),
	       coalesce(mps.source, tld.last_src),
	       mps.title,
	       mps.template_text
  );