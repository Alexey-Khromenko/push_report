
  create view "dwh"."public"."v_mob_push_report_msg_sent__dbt_tmp" as (
    select 
	pq.create_ts,
        pq.source,
        pq.status_code,
	pt.title,
	pt.msg_text as template_text,
	1 as msg_sent_cnt
from sms.t_push_queue pq
left join sms.d_push_template pt
	on pt.code::text = pq.template_id::text
where pq.create_ts >=date'2022-11-10'
and pq.create_ts >=date_trunc('month',current_date) - '2 month'::interval
and pq.status_code = 'SENT'
  );