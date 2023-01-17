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
where 1=1 
and pq.create_ts >=date'2022-11-10' --s etoi dati pojavilis' last_src y mobile_push rassilok
and pq.create_ts >=date_trunc('month',current_date) - '5 month'::interval
and pq.status_code = 'SENT'