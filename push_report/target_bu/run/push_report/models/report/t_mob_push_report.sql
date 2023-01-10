
  
    

  create  table "dwh"."public"."t_mob_push_report__dbt_tmp"
  as (
    
select * from "dwh"."public"."v_mob_push_report"
  );
  